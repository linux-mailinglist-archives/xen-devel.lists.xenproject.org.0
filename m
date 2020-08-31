Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539FB2638B9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 23:54:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG82h-0000VK-MW; Wed, 09 Sep 2020 21:54:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WRqj=CS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kG82f-0000Uk-Ua
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 21:54:13 +0000
X-Inumbo-ID: 171bf353-2020-4b4e-9d8f-5c3ef9e21acf
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 171bf353-2020-4b4e-9d8f-5c3ef9e21acf;
 Wed, 09 Sep 2020 21:54:09 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 089Lrr9Q039235
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 9 Sep 2020 17:53:59 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 089Lrrug039234;
 Wed, 9 Sep 2020 14:53:53 -0700 (PDT) (envelope-from ehem)
Message-Id: <202009092153.089Lrrug039234@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Mon, 31 Aug 2020 16:20:45 -0700
Subject: [PATCH 08/11 RFC] gitignore: Create .gitignore file for stubdom/
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
 KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
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

stubdom/ is a significant portion of the remaining targeted matches in
the global .gitignore file.

Slashes were left at the start of all filenames.  Entries without slashes
match files in subdirectories, entries with a slash anywhere are a
specific path.  I feel it is more consistent to have leading slashes on
all full paths.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
 .gitignore         | 32 --------------------------------
 stubdom/.gitignore | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 32 deletions(-)
 create mode 100644 stubdom/.gitignore

diff --git a/.gitignore b/.gitignore
index 18339f3bab..3fea6c6b15 100644
--- a/.gitignore
+++ b/.gitignore
@@ -51,38 +51,6 @@ build-*
 dist/*
 extras/mini-os*
 install/*
-stubdom/*-minios-config.mk
-stubdom/binutils-*
-stubdom/cross-root-*
-stubdom/gcc-*
-stubdom/gmp-*
-stubdom/grub-*
-stubdom/include
-stubdom/ioemu
-stubdom/ioemu/
-stubdom/libs-*
-stubdom/libxc-*
-stubdom/libxencall-*
-stubdom/libxenevtchn-*
-stubdom/libxenforeignmemory-*
-stubdom/libxengnttab-*
-stubdom/libxentoolcore-*
-stubdom/libxentoollog-*
-stubdom/lwip-*
-stubdom/lwip/
-stubdom/mini-os-*
-stubdom/mk-headers-*
-stubdom/newlib-1.*
-stubdom/newlib-x86*
-stubdom/ocaml-*
-stubdom/pciutils-*
-stubdom/pkg-config/*
-stubdom/polarssl-*
-stubdom/stubdompath.sh
-stubdom/tpm_emulator-*
-stubdom/vtpm/vtpm_manager.h
-stubdom/xenstore
-stubdom/zlib-*
 tools/*/build/lib*/*.py
 config/Tools.mk
 config/Stubdom.mk
diff --git a/stubdom/.gitignore b/stubdom/.gitignore
new file mode 100644
index 0000000000..d763921ba2
--- /dev/null
+++ b/stubdom/.gitignore
@@ -0,0 +1,32 @@
+/*-minios-config.mk
+/binutils-*
+/cross-root-*
+/gcc-*
+/gmp-*
+/grub-*
+/include
+/ioemu
+/ioemu/
+/libs-*
+/libxc-*
+/libxencall-*
+/libxenevtchn-*
+/libxenforeignmemory-*
+/libxengnttab-*
+/libxentoolcore-*
+/libxentoollog-*
+/lwip-*
+/lwip/
+/mini-os-*
+/mk-headers-*
+/newlib-1.*
+/newlib-x86*
+/ocaml-*
+/pciutils-*
+/pkg-config/
+/polarssl-*
+/stubdompath.sh
+/tpm_emulator-*
+/vtpm/vtpm_manager.h
+/xenstore
+/zlib-*
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




