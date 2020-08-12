Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B422427F1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 11:56:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5nTw-0000XO-S2; Wed, 12 Aug 2020 09:55:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rnXN=BW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k5nTv-0000Wc-84
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 09:55:39 +0000
X-Inumbo-ID: ee43593f-25d8-473c-9728-f88a27570c80
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee43593f-25d8-473c-9728-f88a27570c80;
 Wed, 12 Aug 2020 09:55:38 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id k8so1345027wma.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2020 02:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lDUAzQ1oJy7PFmryfuc7OfGKGaMTx/e+9bB0gY1fjxI=;
 b=I1V6xQVSpM0Bh1vViU8ICFTiObKdqERid7V/3buAZOeN3D6c3LNZwEh0xplO52r9m+
 oPfsBJPPbh9g4vgPPQUYUHMUfGQRwER9tzyFxzWkJtX1c9d/IkSUgP7+BwBEbjzh5QOW
 VYFPiRKEcf3U0A4yHLW4e3m7+79gID2aqa/GOSO83f4lu0+7mif19tjHg3cPCGUaLMiS
 CgArjpWnLiQPgqYG/tUbFB7ODr4e6CBmm/YjipGrDmu4HEdSwiKHNyEVUs2BoW+Rs8RG
 gfuFg+R7XNnB0cYGvr6i/QqO7cRFesqKPBecv5XcuL7b29qwAJjn5v+1Gn3sfzKnf3Ns
 NVtw==
X-Gm-Message-State: AOAM5336ZeZX254B9y/Zv32q6DxmDokjyNRie08i08bO5VWp3Xlr+wPm
 BZROxqnpYZZRveU7StZaDyBJZp0Y
X-Google-Smtp-Source: ABdhPJxyrjsxlXtyZGruI+Gj/Iy4FwS+X5tptIdOp0k/eM+hZFitwwGJaKgC+q+/fwgK9IgYMZp1Gw==
X-Received: by 2002:a1c:1d91:: with SMTP id d139mr8137035wmd.144.1597226136905; 
 Wed, 12 Aug 2020 02:55:36 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id v8sm3033618wmb.24.2020.08.12.02.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 02:55:36 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools: bump library version numbers
Date: Wed, 12 Aug 2020 09:55:34 +0000
Message-Id: <20200812095534.107510-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Wei Liu <wl@xen.org>
---
 tools/libfsimage/common/Makefile  | 2 +-
 tools/libvchan/Makefile           | 2 +-
 tools/libxc/Makefile              | 2 +-
 tools/libxl/Makefile              | 4 ++--
 tools/xenstat/libxenstat/Makefile | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/libfsimage/common/Makefile b/tools/libfsimage/common/Makefile
index 8c8ba09f12d2..060f029ca94d 100644
--- a/tools/libfsimage/common/Makefile
+++ b/tools/libfsimage/common/Makefile
@@ -1,7 +1,7 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/libfsimage/Rules.mk
 
-MAJOR = 4.14
+MAJOR = 4.15
 MINOR = 0
 
 LDFLAGS-$(CONFIG_SunOS) = -Wl,-M -Wl,mapfile-SunOS
diff --git a/tools/libvchan/Makefile b/tools/libvchan/Makefile
index 913bcc888462..d99a6137e17f 100644
--- a/tools/libvchan/Makefile
+++ b/tools/libvchan/Makefile
@@ -15,7 +15,7 @@ $(LIBVCHAN_OBJS) $(LIBVCHAN_PIC_OBJS): CFLAGS += $(CFLAGS_libxenstore) $(CFLAGS_
 $(NODE_OBJS) $(NODE2_OBJS): CFLAGS += $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
 vchan-socket-proxy.o: CFLAGS += $(CFLAGS_libxenstore) $(CFLAGS_libxenctrl) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
 
-MAJOR = 4.14
+MAJOR = 4.15
 MINOR = 0
 
 CFLAGS += -I../include -I.
diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
index fae5969a737c..955cd5ab185d 100644
--- a/tools/libxc/Makefile
+++ b/tools/libxc/Makefile
@@ -1,7 +1,7 @@
 XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-MAJOR    = 4.14
+MAJOR    = 4.15
 MINOR    = 0
 
 ifeq ($(CONFIG_LIBXC_MINIOS),y)
diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 38cd43abae1c..0e8dfc61935b 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -5,10 +5,10 @@
 XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-MAJOR = 4.14
+MAJOR = 4.15
 MINOR = 0
 
-XLUMAJOR = 4.14
+XLUMAJOR = 4.15
 XLUMINOR = 0
 
 CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
diff --git a/tools/xenstat/libxenstat/Makefile b/tools/xenstat/libxenstat/Makefile
index 03cb212e3b87..ab980852da7b 100644
--- a/tools/xenstat/libxenstat/Makefile
+++ b/tools/xenstat/libxenstat/Makefile
@@ -18,7 +18,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 LDCONFIG=ldconfig
 MAKE_LINK=ln -sf
 
-MAJOR=4.14
+MAJOR=4.15
 MINOR=0
 
 LIB=src/libxenstat.a
-- 
2.20.1


