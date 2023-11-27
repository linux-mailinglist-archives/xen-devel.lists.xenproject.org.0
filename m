Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7016D7FAAC3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:00:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642472.1001946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hmP-0000yy-TS; Mon, 27 Nov 2023 20:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642472.1001946; Mon, 27 Nov 2023 20:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hmP-0000uw-Q0; Mon, 27 Nov 2023 20:00:29 +0000
Received: by outflank-mailman (input) for mailman id 642472;
 Mon, 27 Nov 2023 20:00:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hmO-0000uA-Bd
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:00:28 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a1f149f-8d5f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:00:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 2124520103;
 Mon, 27 Nov 2023 21:00:24 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1eZin29raO_T; Mon, 27 Nov 2023 21:00:24 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 011E720101;
 Mon, 27 Nov 2023 21:00:24 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hmJ-00000005ckW-35vU; Mon, 27 Nov 2023 21:00:23 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9a1f149f-8d5f-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:00:23 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 07/32] Mini-OS: add EXPORT_SYMBOL() instances to
 lib/sys.c
Message-ID: <20231127200023.55gfbvrbygmep34l@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-8-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:24:58 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to lib/sys.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  lib/sys.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 87 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/sys.c b/lib/sys.c
> index 118fc441..481067f7 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -20,6 +20,7 @@
>  
>  #ifdef HAVE_LIBC
>  #include <os.h>
> +#include <export.h>
>  #include <string.h>
>  #include <console.h>
>  #include <sched.h>
> @@ -63,7 +64,8 @@
>      { \
>  	print_unsupported(#function); \
>  	do_exit(); \
> -    }
> +    } \
> +    EXPORT_SYMBOL(function)
>  
>  /* Log and err out on function call */
>  #define unsupported_function_log(type, function, ret) \
> @@ -73,7 +75,8 @@
>  	print_unsupported(#function); \
>  	errno = ENOSYS; \
>  	return ret; \
> -    }
> +    } \
> +    EXPORT_SYMBOL(function)
>  
>  /* Err out on function call */
>  #define unsupported_function(type, function, ret) \
> @@ -82,7 +85,8 @@
>      { \
>  	errno = ENOSYS; \
>  	return ret; \
> -    }
> +    } \
> +    EXPORT_SYMBOL(function)
>  
>  #define NOFILE 32
>  #define N_MOUNTS  16
> @@ -187,6 +191,7 @@ unsigned int alloc_file_type(const struct file_ops *ops)
>  
>      return ret;
>  }
> +EXPORT_SYMBOL(alloc_file_type);
>  
>  static const struct file_ops *get_file_ops(unsigned int type)
>  {
> @@ -203,8 +208,10 @@ struct file *get_file_from_fd(int fd)
>  
>      return (files[fd].type == FTYPE_NONE) ? NULL : files + fd;
>  }
> +EXPORT_SYMBOL(get_file_from_fd);
>  
>  DECLARE_WAIT_QUEUE_HEAD(event_queue);
> +EXPORT_SYMBOL(event_queue);
>  
>  int alloc_fd(unsigned int type)
>  {
> @@ -222,6 +229,7 @@ int alloc_fd(unsigned int type)
>      printk("Too many opened files\n");
>      do_exit();
>  }
> +EXPORT_SYMBOL(alloc_fd);
>  
>  void close_all_files(void)
>  {
> @@ -232,6 +240,7 @@ void close_all_files(void)
>              close(i);
>      pthread_mutex_unlock(&fd_lock);
>  }
> +EXPORT_SYMBOL(close_all_files);
>  
>  int dup2(int oldfd, int newfd)
>  {
> @@ -243,33 +252,39 @@ int dup2(int oldfd, int newfd)
>      pthread_mutex_unlock(&fd_lock);
>      return 0;
>  }
> +EXPORT_SYMBOL(dup2);
>  
>  pid_t getpid(void)
>  {
>      return 1;
>  }
> +EXPORT_SYMBOL(getpid);
>  
>  pid_t getppid(void)
>  {
>      return 1;
>  }
> +EXPORT_SYMBOL(getppid);
>  
>  pid_t setsid(void)
>  {
>      return 1;
>  }
> +EXPORT_SYMBOL(setsid);
>  
>  char *getcwd(char *buf, size_t size)
>  {
>      snprintf(buf, size, "/");
>      return buf;
>  }
> +EXPORT_SYMBOL(getcwd);
>  
>  int mkdir(const char *pathname, mode_t mode)
>  {
>      errno = EIO;
>      return -1;
>  }
> +EXPORT_SYMBOL(mkdir);
>  
>  #ifdef CONFIG_CONSFRONT
>  int posix_openpt(int flags)
> @@ -282,6 +297,7 @@ int posix_openpt(int flags)
>  
>      return fd;
>  }
> +EXPORT_SYMBOL(posix_openpt);
>  
>  static int open_pt(struct mount_point *mnt, const char *pathname, int flags,
>                     mode_t mode)
> @@ -313,6 +329,8 @@ int posix_openpt(int flags)
>  	errno = EIO;
>  	return -1;
>  }
> +EXPORT_SYMBOL(posix_openpt);
> +
>  int open_savefile(const char *path, int save)
>  {
>  	errno = EIO;
> @@ -378,6 +396,8 @@ int open(const char *pathname, int flags, ...)
>      errno = EIO;
>      return -1;
>  }
> +EXPORT_SYMBOL(open);
> +EXPORT_SYMBOL(open64);
>  
>  int mount(const char *path, void *dev,
>            int (*open)(struct mount_point *, const char *, int, mode_t))
> @@ -422,6 +442,7 @@ int isatty(int fd)
>  {
>      return files[fd].type == FTYPE_CONSOLE;
>  }
> +EXPORT_SYMBOL(isatty);
>  
>  int read(int fd, void *buf, size_t nbytes)
>  {
> @@ -440,6 +461,7 @@ int read(int fd, void *buf, size_t nbytes)
>      errno = EBADF;
>      return -1;
>  }
> +EXPORT_SYMBOL(read);
>  
>  int write(int fd, const void *buf, size_t nbytes)
>  {
> @@ -458,6 +480,7 @@ int write(int fd, const void *buf, size_t nbytes)
>      errno = EBADF;
>      return -1;
>  }
> +EXPORT_SYMBOL(write);
>  
>  off_t lseek_default(struct file *file, off_t offset, int whence)
>  {
> @@ -510,11 +533,14 @@ off_t lseek(int fd, off_t offset, int whence)
>      errno = ESPIPE;
>      return (off_t) -1;
>  }
> +EXPORT_SYMBOL(lseek);
> +EXPORT_SYMBOL(lseek64);
>  
>  int fsync(int fd) {
>      errno = EBADF;
>      return -1;
>  }
> +EXPORT_SYMBOL(fsync);
>  
>  int close(int fd)
>  {
> @@ -542,6 +568,7 @@ int close(int fd)
>      errno = EBADF;
>      return -1;
>  }
> +EXPORT_SYMBOL(close);
>  
>  static void init_stat(struct stat *buf)
>  {
> @@ -559,6 +586,7 @@ int stat(const char *path, struct stat *buf)
>      errno = EIO;
>      return -1;
>  }
> +EXPORT_SYMBOL(stat);
>  
>  int fstat(int fd, struct stat *buf)
>  {
> @@ -579,28 +607,34 @@ int fstat(int fd, struct stat *buf)
>      errno = EBADF;
>      return -1;
>  }
> +EXPORT_SYMBOL(fstat);
> +EXPORT_SYMBOL(fstat64);
>  
>  int ftruncate(int fd, off_t length)
>  {
>      errno = EBADF;
>      return -1;
>  }
> +EXPORT_SYMBOL(ftruncate);
>  
>  int remove(const char *pathname)
>  {
>      errno = EIO;
>      return -1;
>  }
> +EXPORT_SYMBOL(remove);
>  
>  int unlink(const char *pathname)
>  {
>      return remove(pathname);
>  }
> +EXPORT_SYMBOL(unlink);
>  
>  int rmdir(const char *pathname)
>  {
>      return remove(pathname);
>  }
> +EXPORT_SYMBOL(rmdir);
>  
>  int fcntl(int fd, int cmd, ...)
>  {
> @@ -635,6 +669,7 @@ int fcntl(int fd, int cmd, ...)
>      errno = ENOSYS;
>      return -1;
>  }
> +EXPORT_SYMBOL(fcntl);
>  
>  DIR *opendir(const char *name)
>  {
> @@ -648,11 +683,13 @@ DIR *opendir(const char *name)
>      ret->has_more = 1;
>      return ret;
>  }
> +EXPORT_SYMBOL(opendir);
>  
>  struct dirent *readdir(DIR *dir)
>  {
>      return NULL;
>  } 
> +EXPORT_SYMBOL(readdir);
>  
>  int closedir(DIR *dir)
>  {
> @@ -664,6 +701,7 @@ int closedir(DIR *dir)
>      free(dir);
>      return 0;
>  }
> +EXPORT_SYMBOL(closedir);
>  
>  /* We assume that only the main thread calls select(). */
>  
> @@ -732,6 +770,7 @@ bool select_read_flag(struct file *file)
>  {
>      return file->read;
>  }
> +EXPORT_SYMBOL(select_read_flag);
>  
>  /* Just poll without blocking */
>  static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds)
> @@ -1044,6 +1083,7 @@ out:
>      remove_waiter(console_w, console_queue);
>      return ret;
>  }
> +EXPORT_SYMBOL(select);
>  
>  /* Wrap around select */
>  int poll(struct pollfd _pfd[], nfds_t _nfds, int _timeout)
> @@ -1136,6 +1176,7 @@ int poll(struct pollfd _pfd[], nfds_t _nfds, int _timeout)
>  
>      return n;
>  }
> +EXPORT_SYMBOL(poll);
>  
>  #ifdef HAVE_LWIP
>  int socket(int domain, int type, int protocol)
> @@ -1149,6 +1190,7 @@ int socket(int domain, int type, int protocol)
>      files[res].fd = fd;
>      return res;
>  }
> +EXPORT_SYMBOL(socket);
>  
>  int accept(int s, struct sockaddr *addr, socklen_t *addrlen)
>  {
> @@ -1166,6 +1208,7 @@ int accept(int s, struct sockaddr *addr, socklen_t *addrlen)
>      printk("accepted on %d -> %d\n", s, res);
>      return res;
>  }
> +EXPORT_SYMBOL(accept);
>  
>  #define LWIP_STUB(ret, name, proto, args) \
>  ret name proto \
> @@ -1180,15 +1223,25 @@ ret name proto \
>  }
>  
>  LWIP_STUB(int, bind, (int s, struct sockaddr *my_addr, socklen_t addrlen), (s, my_addr, addrlen))
> +EXPORT_SYMBOL(bind);
>  LWIP_STUB(int, getsockopt, (int s, int level, int optname, void *optval, socklen_t *optlen), (s, level, optname, optval, optlen))
> +EXPORT_SYMBOL(getsockopt);
>  LWIP_STUB(int, setsockopt, (int s, int level, int optname, void *optval, socklen_t optlen), (s, level, optname, optval, optlen))
> +EXPORT_SYMBOL(setsockopt);
>  LWIP_STUB(int, connect, (int s, struct sockaddr *serv_addr, socklen_t addrlen), (s, serv_addr, addrlen))
> +EXPORT_SYMBOL(connect);
>  LWIP_STUB(int, listen, (int s, int backlog), (s, backlog));
> +EXPORT_SYMBOL(listen);
>  LWIP_STUB(ssize_t, recv, (int s, void *buf, size_t len, int flags), (s, buf, len, flags))
> +EXPORT_SYMBOL(recv);
>  LWIP_STUB(ssize_t, recvfrom, (int s, void *buf, size_t len, int flags, struct sockaddr *from, socklen_t *fromlen), (s, buf, len, flags, from, fromlen))
> +EXPORT_SYMBOL(recvfrom);
>  LWIP_STUB(ssize_t, send, (int s, void *buf, size_t len, int flags), (s, buf, len, flags))
> +EXPORT_SYMBOL(send);
>  LWIP_STUB(ssize_t, sendto, (int s, void *buf, size_t len, int flags, struct sockaddr *to, socklen_t tolen), (s, buf, len, flags, to, tolen))
> +EXPORT_SYMBOL(sendto);
>  LWIP_STUB(int, getsockname, (int s, struct sockaddr *name, socklen_t *namelen), (s, name, namelen))
> +EXPORT_SYMBOL(getsockname);
>  #endif
>  
>  static char *syslog_ident;
> @@ -1197,12 +1250,14 @@ void openlog(const char *ident, int option, int facility)
>      free(syslog_ident);
>      syslog_ident = strdup(ident);
>  }
> +EXPORT_SYMBOL(openlog);
>  
>  void vsyslog(int priority, const char *format, va_list ap)
>  {
>      printk("%s: ", syslog_ident);
>      print(0, format, ap);
>  }
> +EXPORT_SYMBOL(vsyslog);
>  
>  void syslog(int priority, const char *format, ...)
>  {
> @@ -1211,12 +1266,14 @@ void syslog(int priority, const char *format, ...)
>      vsyslog(priority, format, ap);
>      va_end(ap);
>  }
> +EXPORT_SYMBOL(syslog);
>  
>  void closelog(void)
>  {
>      free(syslog_ident);
>      syslog_ident = NULL;
>  }
> +EXPORT_SYMBOL(closelog);
>  
>  void vwarn(const char *format, va_list ap)
>  {
> @@ -1228,6 +1285,7 @@ void vwarn(const char *format, va_list ap)
>      }
>      printk("%s", strerror(the_errno));
>  }
> +EXPORT_SYMBOL(vwarn);
>  
>  void warn(const char *format, ...)
>  {
> @@ -1236,12 +1294,14 @@ void warn(const char *format, ...)
>      vwarn(format, ap);
>      va_end(ap);
>  }
> +EXPORT_SYMBOL(warn);
>  
>  void verr(int eval, const char *format, va_list ap)
>  {
>      vwarn(format, ap);
>      exit(eval);
>  }
> +EXPORT_SYMBOL(verr);
>  
>  void err(int eval, const char *format, ...)
>  {
> @@ -1250,6 +1310,7 @@ void err(int eval, const char *format, ...)
>      verr(eval, format, ap);
>      va_end(ap);
>  }
> +EXPORT_SYMBOL(err);
>  
>  void vwarnx(const char *format, va_list ap)
>  {
> @@ -1257,6 +1318,7 @@ void vwarnx(const char *format, va_list ap)
>      if (format)
>          print(0, format, ap);
>  }
> +EXPORT_SYMBOL(vwarnx);
>  
>  void warnx(const char *format, ...)
>  {
> @@ -1265,12 +1327,14 @@ void warnx(const char *format, ...)
>      vwarnx(format, ap);
>      va_end(ap);
>  }
> +EXPORT_SYMBOL(warnx);
>  
>  void verrx(int eval, const char *format, va_list ap)
>  {
>      vwarnx(format, ap);
>      exit(eval);
>  }
> +EXPORT_SYMBOL(verrx);
>  
>  void errx(int eval, const char *format, ...)
>  {
> @@ -1279,6 +1343,7 @@ void errx(int eval, const char *format, ...)
>      verrx(eval, format, ap);
>      va_end(ap);
>  }
> +EXPORT_SYMBOL(errx);
>  
>  int nanosleep(const struct timespec *req, struct timespec *rem)
>  {
> @@ -1304,6 +1369,7 @@ int nanosleep(const struct timespec *req, struct timespec *rem)
>  
>      return 0;
>  }
> +EXPORT_SYMBOL(nanosleep);
>  
>  int usleep(useconds_t usec)
>  {
> @@ -1317,6 +1383,7 @@ int usleep(useconds_t usec)
>  
>      return 0;
>  }
> +EXPORT_SYMBOL(usleep);
>  
>  unsigned int sleep(unsigned int seconds)
>  {
> @@ -1332,6 +1399,7 @@ unsigned int sleep(unsigned int seconds)
>  
>      return rem.tv_sec;
>  }
> +EXPORT_SYMBOL(sleep);
>  
>  int clock_gettime(clockid_t clk_id, struct timespec *tp)
>  {
> @@ -1364,37 +1432,44 @@ int clock_gettime(clockid_t clk_id, struct timespec *tp)
>  
>      return 0;
>  }
> +EXPORT_SYMBOL(clock_gettime);
>  
>  uid_t getuid(void)
>  {
>  	return 0;
>  }
> +EXPORT_SYMBOL(getuid);
>  
>  uid_t geteuid(void)
>  {
>  	return 0;
>  }
> +EXPORT_SYMBOL(geteuid);
>  
>  gid_t getgid(void)
>  {
>  	return 0;
>  }
> +EXPORT_SYMBOL(getgid);
>  
>  gid_t getegid(void)
>  {
>  	return 0;
>  }
> +EXPORT_SYMBOL(getegid);
>  
>  int gethostname(char *name, size_t namelen)
>  {
>  	strncpy(name, "mini-os", namelen);
>  	return 0;
>  }
> +EXPORT_SYMBOL(gethostname);
>  
>  size_t getpagesize(void)
>  {
>      return PAGE_SIZE;
>  }
> +EXPORT_SYMBOL(getpagesize);
>  
>  void *mmap(void *start, size_t length, int prot, int flags, int fd, off_t offset)
>  {
> @@ -1412,6 +1487,8 @@ void *mmap(void *start, size_t length, int prot, int flags, int fd, off_t offset
>          return map_frames_ex(&first_mfn, n, 0, 1, 1, DOMID_IO, NULL, _PAGE_PRESENT|_PAGE_RW);
>      } else ASSERT(0);
>  }
> +EXPORT_SYMBOL(mmap);
> +EXPORT_SYMBOL(mmap64);
>  
>  int munmap(void *start, size_t length)
>  {
> @@ -1425,6 +1502,7 @@ int munmap(void *start, size_t length)
>      }
>      return 0;
>  }
> +EXPORT_SYMBOL(munmap);
>  
>  void sparse(unsigned long data, size_t size)
>  {
> @@ -1465,6 +1543,7 @@ int nice(int inc)
>      printk("nice() stub called with inc=%d\n", inc);
>      return 0;
>  }
> +EXPORT_SYMBOL(nice);
>  
>  /* Limited termios terminal settings support */
>  const struct termios default_termios = {0,             /* iflag */
> @@ -1512,6 +1591,7 @@ int tcsetattr(int fildes, int action, const struct termios *tios)
>  
>      return 0;
>  }
> +EXPORT_SYMBOL(tcsetattr);
>  
>  int tcgetattr(int fildes, struct termios *tios)
>  {
> @@ -1545,6 +1625,7 @@ int tcgetattr(int fildes, struct termios *tios)
>  
>      return 0;
>  }
> +EXPORT_SYMBOL(tcgetattr);
>  
>  void cfmakeraw(struct termios *tios)
>  {
> @@ -1555,6 +1636,7 @@ void cfmakeraw(struct termios *tios)
>      tios->c_cflag &= ~(CSIZE | PARENB);
>      tios->c_cflag |= CS8;
>  }
> +EXPORT_SYMBOL(cfmakeraw);
>  
>  /* Not supported by FS yet.  */
>  unsupported_function_crash(link);
> @@ -1659,8 +1741,8 @@ unsupported_function_log(int, ftruncate64, -1);
>  unsupported_function_log(int, fchown, -1);
>  unsupported_function_log(int, fchmod, -1);
>  unsupported_function_crash(execvp);
> -unsupported_function_log(int, dup, -1)
> -unsupported_function_log(int, chroot, -1)
> +unsupported_function_log(int, dup, -1);
> +unsupported_function_log(int, chroot, -1);
>  unsupported_function_log(int, chown, -1);
>  unsupported_function_log(int, chmod, -1);
>  unsupported_function_crash(alarm);
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

