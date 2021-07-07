Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7EF3BEC76
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 18:43:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152631.281959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1AdS-0005Mf-AK; Wed, 07 Jul 2021 16:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152631.281959; Wed, 07 Jul 2021 16:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1AdS-0005Jk-57; Wed, 07 Jul 2021 16:42:54 +0000
Received: by outflank-mailman (input) for mailman id 152631;
 Wed, 07 Jul 2021 16:42:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DB7Z=L7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m1AdQ-00050s-Gl
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 16:42:52 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e92e19ae-7689-4d7b-9a37-40a289bc10fa;
 Wed, 07 Jul 2021 16:42:46 +0000 (UTC)
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
X-Inumbo-ID: e92e19ae-7689-4d7b-9a37-40a289bc10fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625676166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9bieze8oe0vLOiThGwS2ip9BrjWxM8RHuxHeePgyKcQ=;
  b=Kz76DANIirRMFc8ZAkXaHY21Q/n+cR81I/uPPCmXAizq4azpPtdYulZa
   8IhxXkTlj7P5gyaP3tRNqhiNs42OobO2+6IdWn93XZYDYvO+xyvh30c4z
   91bErclaLJld+Rj7OkQxbkOCzw0Ug/IQH5D7NOdW16b8DGw+Haax7tOtK
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: D+YyPLM+VAE1LGQ2GgDoi6cCNhUgtu9tronggcAUkg2GZfEyrBgQgVLIbSvjcbaY/6VuaaiE0k
 wt0hV8dqoWU14ZCDTF0+9m1Y1uxvDNC6Er7cW4csTPvEwoQHMZmh8ja5xJbCfNY8nDzy3V/P/C
 72LPYU/QU23j7oW+QnxeSzcQaIUftMMDHF0uBkRdFHlty8PWG9LNtE9WGrIlG7aHfhPh0r5MdX
 Mg0K/I8jK6zpE7UCo5u4eVKcg9BZWrxPCY6cMRFGy65VJxXDtC2t68/Q5A6pa52OmFyHLFYzEz
 Lc0=
X-SBRS: 5.1
X-MesageID: 47750435
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2S62UaDg8EF4UFDlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.84,220,1620705600"; 
   d="scan'208";a="47750435"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 2/2] automation: Check if ninja is available before building QEMU
Date: Wed, 7 Jul 2021 17:40:01 +0100
Message-ID: <20210707164001.894805-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707164001.894805-1-anthony.perard@citrix.com>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

ninja is now required to build the latest version of QEMU, some
container still don't have ninja and attempting to add it breaks the
build for different reasons, so QEMU will be skip on those containers.

Failures:
- ubuntu/xenial:
    fatal: ninja version (1.5.1) incompatible with build file ninja_required_version version (1.7.1).
- debian/unstable-i386: (debian-unstable-32)
    /build/tools/flask/policy/Makefile.common:115: *** target pattern contains no '%'.  Stop.
- suse/opensuse-tumbleweed:
    failed to build iPXE
- debian/unstable:
    update of the container fails with:
        The following packages have unmet dependencies:
         clang-8 : Depends: libstdc++-8-dev but it is not installable
                   Depends: libgcc-8-dev but it is not installable
                   Depends: libobjc-8-dev but it is not installable
                   Recommends: llvm-8-dev but it is not going to be installed
                   Recommends: libomp-8-dev but it is not going to be installed

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/scripts/build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 46b6903d2922..d8c77e244cda 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -46,7 +46,9 @@ if ! test -z "$(ldd /bin/ls|grep musl|head -1)"; then
 fi
 
 # Qemu requires Python 3.5 or later
-if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 5); exit(not(res))"; then
+# QEMU requires ninja
+if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 5); exit(not(res))" \
+        || ! type ninja; then
     cfgargs+=("--with-system-qemu=/bin/false")
 fi
 
-- 
Anthony PERARD


