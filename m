Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24466B9781
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509632.785761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RC-0004xf-EK; Tue, 14 Mar 2023 14:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509632.785761; Tue, 14 Mar 2023 14:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RC-0004s6-AA; Tue, 14 Mar 2023 14:15:38 +0000
Received: by outflank-mailman (input) for mailman id 509632;
 Tue, 14 Mar 2023 14:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQyL=7G=citrix.com=prvs=430d4338b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pc5RA-0004aK-MC
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:15:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af7f90c4-c272-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:15:34 +0100 (CET)
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
X-Inumbo-ID: af7f90c4-c272-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678803334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C0d3uxwMv1ov6KcfS5c7XJ6RUpKJXLIQRNm/aiuPRhQ=;
  b=GLGGJStEgr947sAazjsV46aQxlzy+EGfbKfCQz8KDvLeL4ptXKqK7unp
   e4RjmNg+a6DMuB3an7O22NDM3ntyA0mUo15zLGPAZ4iI/qGGrYDLyYv8E
   rR7GNaAMYe55H+QfIBeAt4fSXiKIaDIaoSa+spm8zELizwI9cYhtLzKdo
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100695473
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:+whBGqP1iDsp+LzvrR27l8FynXyQoLVcMsEvi/4bfWQNrUpz1jFWy
 WceD2+DMq3bMWLxc9sna423pExUvJbQz95gSQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5wBmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vYmEWxq8
 P5AESBXZROGi+ya2pDjUOY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXSHZsEwxrH/
 Qoq+UypIT4GL/i57Qab0WCmo97SnyTLdKs7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasoRo0S9dWVeog52mlz6PO5g+DC2ssTzhfaccnvss7WTwr0
 FCSm9rjQzdotdWopWm1r+nO62noYG5McDFEPHVfJecY3zX9iJFinh/rS9Q7Kb7vhd7wFT/c2
 RLStidr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5eJFcFg
 2eJ42u9AaO/21P7BZKbm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzzxhzyvtgY
 83GKJ/E4ZMm5UNPnVKLqxo1i+d3lkjSO0uKLXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5nekhy
 P4Gb5Hi40wGAIXDjtz/rdZ7waYicSJqWvgbaqV/Koa+H+aRMDpxU66Ike5/JtwNcmY8vr6gw
 0xRk3RwkDLX7UAr4y3QApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:2K8jCqwLB7s/RBTtDKsUKrPw8L1zdoMgy1knxilNoH1uA7elfq
 WV98jzuiWbtN98YhwdcJO7Sc29qArnlKKduLNwAV7AZniFhILLFvAb0WKK+VSJcREWkNQtsJ
 uIGJIQNDSfNzRHZInBkW6F+nsbsb+62bHtr933i11qSRhua6lm5Qs8MACGCUd7LTM2ZqbRUK
 Dsn/Z6mw==
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="100695473"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bernhard Kaindl
	<bernhard.kaindl@citrix.com>
Subject: [PATCH 2/7] tools/misc: Drop xencons
Date: Tue, 14 Mar 2023 14:15:15 +0000
Message-ID: <20230314141520.3652451-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a python script which has it's shebang modified by be python3, but
was never converted to be python3 compatible.

The most recent reference I can find to this script (which isn't incidental
adjustments in the makefile) is from the Xen book, fileish 561e30b80402 which
says

  %% <snip>  Alternatively, if the
  %% Xen machine is connected to a serial-port server then we supply a
  %% dumb TCP terminal client, {\tt xencons}.

So this a not-invented-here version of telnet.  Delete it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/misc/Makefile |  2 -
 tools/misc/xencons  | 92 ---------------------------------------------
 2 files changed, 94 deletions(-)
 delete mode 100755 tools/misc/xencons

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 1c6e1d6a0471..233a7948c050 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -12,7 +12,6 @@ CFLAGS += $(CFLAGS_libxenstore)
 # Everything to be installed in regular bin/
 INSTALL_BIN-$(CONFIG_X86)      += xen-cpuid
 INSTALL_BIN-$(CONFIG_X86)      += xen-detect
-INSTALL_BIN                    += xencons
 INSTALL_BIN                    += xencov_split
 INSTALL_BIN += $(INSTALL_BIN-y)
 
@@ -44,7 +43,6 @@ INSTALL_PRIVBIN                += xenpvnetboot
 TARGETS_ALL := $(INSTALL_BIN) $(INSTALL_SBIN) $(INSTALL_PRIVBIN)
 
 # Everything which only needs copying to install
-TARGETS_COPY += xencons
 TARGETS_COPY += xencov_split
 TARGETS_COPY += xenpvnetboot
 
diff --git a/tools/misc/xencons b/tools/misc/xencons
deleted file mode 100755
index 8bd3178eab4e..000000000000
--- a/tools/misc/xencons
+++ /dev/null
@@ -1,92 +0,0 @@
-#!/usr/bin/env python
-
-##############################################
-# Console client for Xen guest OSes
-# Copyright (c) 2004, K A Fraser
-##############################################
-
-import errno, os, signal, socket, struct, sys
-
-from termios import *
-# Indexes into termios.tcgetattr() list.
-IFLAG  = 0
-OFLAG  = 1
-CFLAG  = 2
-LFLAG  = 3
-ISPEED = 4
-OSPEED = 5
-CC     = 6
-
-def __child_death(signum, frame):
-    global stop
-    stop = True
-
-def __recv_from_sock(sock):
-    global stop
-    stop = False
-    while not stop:
-        try:
-            data = sock.recv(1024)
-        except socket.error, error:
-            if error[0] != errno.EINTR:
-                raise
-        else:
-            try:
-                os.write(1, data)
-            except os.error, error:
-                if error[0] != errno.EINTR:
-                    raise
-    os.wait()
-
-def __send_to_sock(sock):
-    while 1:
-        try:
-            data = os.read(0,1024)
-        except os.error, error:
-            if error[0] != errno.EINTR:
-                raise
-        else:
-            if ord(data[0]) == ord(']')-64:
-                break
-            try:
-                sock.send(data)
-            except socket.error, error:
-                if error[0] == errno.EPIPE:
-                    sys.exit(0)
-                if error[0] != errno.EINTR:
-                    raise
-    sys.exit(0)
-
-def connect(host,port):
-    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM, 0)
-    sock.connect((host,port))
-
-    oattrs = tcgetattr(0)
-    nattrs = tcgetattr(0)
-    nattrs[IFLAG] = nattrs[IFLAG] & ~(BRKINT | ICRNL | INPCK | ISTRIP | IXON)
-    nattrs[OFLAG] = nattrs[OFLAG] & ~(OPOST)
-    nattrs[CFLAG] = nattrs[CFLAG] & ~(CSIZE | PARENB)
-    nattrs[CFLAG] = nattrs[CFLAG] | CS8
-    nattrs[LFLAG] = nattrs[LFLAG] & ~(ECHO | ICANON | IEXTEN | ISIG)
-    nattrs[CC][VMIN] = 1
-    nattrs[CC][VTIME] = 0
-
-    if os.fork():
-        signal.signal(signal.SIGCHLD, __child_death)
-        print "************ REMOTE CONSOLE: CTRL-] TO QUIT ********"
-        tcsetattr(0, TCSAFLUSH, nattrs)
-        try:
-            __recv_from_sock(sock)
-        finally:
-            tcsetattr(0, TCSAFLUSH, oattrs)
-            print
-            print "************ REMOTE CONSOLE EXITED *****************"
-    else:
-        signal.signal(signal.SIGPIPE, signal.SIG_IGN)
-        __send_to_sock(sock)
-
-if __name__ == '__main__':
-    if len(sys.argv) != 3:
-        print sys.argv[0] + " <host> <port>"
-        sys.exit(1)
-    connect(str(sys.argv[1]),int(sys.argv[2]))
-- 
2.30.2


