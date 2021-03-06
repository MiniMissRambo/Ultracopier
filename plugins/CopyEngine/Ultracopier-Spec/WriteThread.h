/** \file WriteThread.h
\brief Thread changed to open/close and write the destination file
\author alpha_one_x86
\licence GPL3, see the file COPYING */

#ifndef WRITETHREAD_H
#define WRITETHREAD_H

#include "Environment.h"
#include "StructEnumDefinition_CopyEngine.h"
#include <cstdint>
#ifdef Q_OS_LINUX
#include "CallBackEventLoop.h"
#endif

class ReadThread;
/// \brief Thread changed to open/close and write the destination file
class WriteThread : public QObject
        #ifdef Q_OS_LINUX
        , public CallBackEventLoop
        #endif
{
    Q_OBJECT
public:
    explicit WriteThread();
    ~WriteThread();
protected:
    void run();
public:
    /// \brief open the destination to open it
    void open(const std::string &file, const uint64_t &startSize);
    /// \brief to return the error string
    std::string errorString() const;
    /// \brief to stop all
    void stop();
    /// \brief to write data
    bool write();
    #ifdef ULTRACOPIER_PLUGIN_DEBUG
    /// \brief to set the id
    void setId(int id);
    /// \brief get the write stat
    enum WriteStat
    {
        Idle=0,
        InodeOperation=1,
        Write=2,
        Close=3,
        Read=5
    };
    WriteStat status;
    #endif
    /// \brief do the fake open
    void fakeOpen();
    /// \brief do the fake writeIsStarted
    void fakeWriteIsStarted();
    /// \brief do the fake writeIsStopped
    void fakeWriteIsStopped();
    /// \brief set block size in KB
    int64_t getLastGoodPosition() const;
    /// \brief buffer is empty
    bool bufferIsEmpty();
    void reemitStartOpen();

    //buffer cannot be directly writen
    char   blockArray[/*1024**/1024];		///< temp data for block writing, type: ring buffer
    // if writeThread->blockArrayStart == writeThread->blockArrayStop then is empty
    std::atomic<std::uint32_t> blockArrayStart;//where start used block
    std::atomic<std::uint32_t> blockArrayStop;//where stop used block

    void setReadThread(ReadThread * readThread);
    #ifdef Q_OS_LINUX
    void callBack();
    #endif
public slots:
    /// \brief start the operation
    void postOperation();
    /// \brief flush buffer
    void flushBuffer();
    /// \brief set the end is detected
    void endIsDetected();
    /// \brief reopen the file
    void reopen();
    /// \brief flush and seek to zero
    void flushAndSeekToZero();
    void setDeletePartiallyTransferredFiles(const bool &deletePartiallyTransferredFiles);
signals:
    void error() const;
    void opened() const;
    void reopened() const;
    void writeIsStarted() const;
    void writeIsStopped() const;
    void flushedAndSeekedToZero() const;
    void closed() const;
    //internal signals
    void internalStartOpen() const;
    void internalStartReopen() const;
    void internalStartWrite() const;
    void internalStartClose() const;
    void internalStartEndOfFile() const;
    void internalStartFlushAndSeekToZero() const;
    /// \brief To debug source
    void debugInformation(const Ultracopier::DebugLevel &level,const std::string &fonction,const std::string &text,const std::string &file,const int &ligne) const;
private:
    FILE * file;
    std::string fileName;
    std::string             errorString_internal;
    volatile bool		stopIt;
    volatile bool       postOperationRequested;
    volatile bool       writeFullBlocked;
    uint64_t             lastGoodPosition;
    int                 id;
    volatile bool       endDetected;
    uint64_t             startSize;
    bool                fakeMode;
    bool                needRemoveTheFile;
    bool                deletePartiallyTransferredFiles;
    ReadThread *        readThread;
private slots:
    bool internalOpen();
    void internalWrite();
    void internalCloseSlot();
    void internalClose(bool emitSignal=true);
    void internalReopen();
    void internalEndOfFile();
    void internalFlushAndSeekToZero();
};

#endif // WRITETHREAD_H
