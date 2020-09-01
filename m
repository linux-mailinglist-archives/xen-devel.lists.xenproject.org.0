Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DDF2638B1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 23:53:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG81q-00007o-Ll; Wed, 09 Sep 2020 21:53:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WRqj=CS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kG81p-00007c-55
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 21:53:21 +0000
X-Inumbo-ID: 890b7005-438b-4c3d-a92a-600149c84c7b
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 890b7005-438b-4c3d-a92a-600149c84c7b;
 Wed, 09 Sep 2020 21:53:15 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 089Lr1Sg039182
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 9 Sep 2020 17:53:07 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 089Lr130039181;
 Wed, 9 Sep 2020 14:53:01 -0700 (PDT) (envelope-from ehem)
Message-Id: <202009092153.089Lr130039181@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Date: Tue, 1 Sep 2020 15:02:17 -0700
Subject: [PATCH 02/11] gitignore: Remove entries duplicating global entries
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

As "config.cache", "config.log" and "config.status" already have global
matching patterns, remove these subdirectory entries.

"autom4te.cache/" similarly had a global match, so remove those
duplicates.

"*.py[ocd]", "*.tmp" and "*.bin" were present, go after their duplicates
too.

"docs/txt/" covers "docs/txt/misc/*.txt" and "docs/txt/man/*.txt".

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
 .gitignore | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/.gitignore b/.gitignore
index 429a484ecc..0f0e79b6d1 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,6 +1,5 @@
 .hg
 .*.cmd
-.*.tmp
 *.orig
 *~
 *.swp
@@ -58,11 +57,7 @@ docs/txt/
 extras/mini-os*
 install/*
 stubdom/*-minios-config.mk
-stubdom/autom4te.cache/
 stubdom/binutils-*
-stubdom/config.cache
-stubdom/config.log
-stubdom/config.status
 stubdom/cross-root-*
 stubdom/gcc-*
 stubdom/gmp-*
@@ -94,11 +89,7 @@ stubdom/vtpm/vtpm_manager.h
 stubdom/xenstore
 stubdom/zlib-*
 tools/*/build/lib*/*.py
-tools/autom4te.cache/
 tools/config.h
-tools/config.log
-tools/config.status
-tools/config.cache
 config/Tools.mk
 config/Stubdom.mk
 config/Docs.mk
@@ -128,7 +119,6 @@ tools/debugger/gdb/gdb-6.2.1.tar.bz2
 tools/debugger/gdbsx/gdbsx
 tools/debugger/xenitp/xenitp
 tools/firmware/*/biossums
-tools/firmware/*.bin
 tools/firmware/*.sym
 tools/firmware/*bios/*bios*.txt
 tools/firmware/etherboot/gpxe/*
@@ -213,8 +203,6 @@ tools/security/secpol_tool
 tools/security/xen/*
 tools/security/xensec_tool
 tools/tests/depriv/depriv-fd-checker
-tools/tests/x86_emulator/*.bin
-tools/tests/x86_emulator/*.tmp
 tools/tests/x86_emulator/32/x86_emulate
 tools/tests/x86_emulator/3dnow*.[ch]
 tools/tests/x86_emulator/asm
@@ -272,7 +260,6 @@ xen/arch/x86/asm-macros.i
 xen/arch/x86/boot/mkelf32
 xen/arch/x86/boot/cmdline.S
 xen/arch/x86/boot/reloc.S
-xen/arch/x86/boot/*.bin
 xen/arch/x86/boot/*.lnk
 xen/arch/x86/efi.lds
 xen/arch/x86/efi/check.efi
@@ -325,7 +312,6 @@ tools/firmware/rombios/_rombios_.c
 tools/firmware/rombios/rombios.s
 tools/firmware/rombios/rombios.sym
 tools/include/xen-foreign/checker.c
-tools/include/xen-foreign/structs.pyc
 tools/include/xen-foreign/x86_32.h
 tools/include/xen-foreign/x86_64.h
 tools/include/xen-foreign/arm32.h
@@ -337,7 +323,6 @@ tools/libxc/_*.[ch]
 tools/libxl/_*.[ch]
 tools/libxl/testidl
 tools/libxl/testidl.c
-tools/libxl/*.pyc
 tools/libxl/libxl-save-helper
 tools/libxl/test_timedereg
 tools/libxl/test_fdderegrace
@@ -382,6 +367,4 @@ tools/xenstore/xenstore-watch
 tools/xl/_paths.h
 tools/xl/xl
 
-docs/txt/misc/*.txt
-docs/txt/man/*.txt
 docs/figs/*.png
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




