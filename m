Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E3134A87A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:46:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101827.195016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmn5-0008Vc-EJ; Fri, 26 Mar 2021 13:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101827.195016; Fri, 26 Mar 2021 13:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmn5-0008V4-AB; Fri, 26 Mar 2021 13:46:19 +0000
Received: by outflank-mailman (input) for mailman id 101827;
 Fri, 26 Mar 2021 13:46:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MLVS=IY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPmn3-0008UZ-PM
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:46:17 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5fc831d-1c0b-4342-9a7f-7425274862da;
 Fri, 26 Mar 2021 13:46:17 +0000 (UTC)
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
X-Inumbo-ID: a5fc831d-1c0b-4342-9a7f-7425274862da
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616766376;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=750BMnBsidY80ANFlQktnM1w+1rQ3ybeQkufZpAghn4=;
  b=TZMvWj0O1E3YwZuCFVwagHwZjSRZD4AIYmTIZkQpHIXx6e1p2g8D/Mhn
   zTZhJzOrLBXuwFibzu9S+wMCe94XU2UsvDGQcsPVQD4E4qRe4geAovYSk
   c3tuBd3bJlWFlpXYawN/Fn6MqAvCuYB+0Xpz/b0YjAiM6afHDniGue8hm
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9HTa7ZgJV2gwEqSwH9fNVeNx5YLj7AaT3A0h+5xI/FI8nNtqz5xbPWGUNn4Dpr78MvEaJjm6KS
 HiU6Ib+oa3mAw5yed0TWIiqWzSvFwQ6dHq4cS1F9+n4K5rNS0SC+lzCl3W8IC4TYBGV9WHV0kb
 i8y1fdVHP6yi86wAaBlnPQs5SRw+ZK/dIGElo7pPZIVNomaLFFzEuUD0gc5XXwCJXd9T4dykNU
 sNiucjK9a/bDjLEFh01u4G4CcbNmKtTbOC7BrfiN7hBx75mtI7u3uds8Rn+ujGJlwPcqfOs0oM
 RLw=
X-SBRS: 4.0
X-MesageID: 41661002
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rw327q3F47EXEdsJmsCrfAqjBWByeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035Qd2+ksFJ2lWxTrv3btEZF64eLZslndMgDd1soY76
 dvdKBiFMb9ZGIRse/W6BS1euxO/PCp66at7N2x815IbSVHL55t9B14DAHzKDwSeCBjCYAiHJ
 SRouprzgDQGkg/VciwCnkbU+WrnbSi+K7OWhIaGwUhrDCHkDLA0tXHOiKF1RQTWS4n+8ZBzU
 H5lWXCh5mLgrWA5TL3k0TS6JlXn9WJ8Ko/OOW8zvI7Bx+ppgKhZIFKU6CPsjYvsIiUmSoXue
 iJmTgMFYBe7G7QY3GUrHLWqnbd+Qdr0VDO4xu5hmbuusPwTj5SMbs+uatpNiH3xmBlmfMU6t
 Mt40up86B5IDmFoQHGo//PbB1unlrcmwtYrccjy0ZxfKFbVKVctuUkjSVoOaZFJg3WwqY9Ht
 JjCcnNjcwmC2+yXjTism5jzMfEZAVLIj62BkwLusmi2zNLhnxOz0wB2MwFnnsbnahNM6V52w
 ==
X-IronPort-AV: E=Sophos;i="5.81,280,1610427600"; 
   d="scan'208";a="41661002"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [PATCH 2/2] CI: Add zstd/etc libraries to build environments
Date: Fri, 26 Mar 2021 13:45:58 +0000
Message-ID: <20210326134558.7751-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210326134558.7751-1-andrew.cooper3@citrix.com>
References: <20210326134558.7751-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

zstd compression support is new in 4.15, but isn't currently tested anywhere
in CI.

bzip2/zlib was missing in some cases, so add those as well.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Doug Goldstein <cardoe@cardoe.com>

For 4.15.  Add build time testing for a currently untested feature.  This
should have been part of the series which included 8169f82049efb but I don't
think it really qualifies for a Fixes: tag.

RFC for two reasons.  First, this needs extending to other containers when
I've finished chasing package names, and the CI runs haven't completed yet.
---
 .cirrus.yml                              | 2 +-
 automation/build/alpine/3.12.dockerfile  | 2 ++
 automation/build/ubuntu/focal.dockerfile | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index fdb1c9c94d..05e72b92db 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -4,7 +4,7 @@ freebsd_template: &FREEBSD_TEMPLATE
     APPEND_LIB: /usr/local/lib
     APPEND_INCLUDES: /usr/local/include
 
-  install_script: pkg install -y seabios gmake
+  install_script: pkg install -y seabios gmake zlib bzip2 zstd
                                  pkgconf python libiconv bison perl5
                                  yajl lzo2 pixman argp-standalone
                                  libxml2 glib git
diff --git a/automation/build/alpine/3.12.dockerfile b/automation/build/alpine/3.12.dockerfile
index 8631d221db..8d61f3860b 100644
--- a/automation/build/alpine/3.12.dockerfile
+++ b/automation/build/alpine/3.12.dockerfile
@@ -38,6 +38,8 @@ RUN \
   apk add xz-dev && \
   apk add yajl-dev && \
   apk add zlib-dev && \
+  apk add bzip2-dev && \
+  apk add zstd-dev && \
   \
   # qemu build deps
   apk add bison && \
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index 6c4565745b..0558519a97 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -30,6 +30,8 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
+        libzstd-dev \
+        libbz2-dev \
         # libc6-dev-i386 for Xen < 4.15
         libc6-dev-i386 \
         libnl-3-dev \
-- 
2.11.0


