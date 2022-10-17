Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F77B600C84
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 12:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424314.671641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okNRr-0002ZO-NN; Mon, 17 Oct 2022 10:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424314.671641; Mon, 17 Oct 2022 10:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okNRr-0002Vv-KV; Mon, 17 Oct 2022 10:34:19 +0000
Received: by outflank-mailman (input) for mailman id 424314;
 Mon, 17 Oct 2022 10:34:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD8j=2S=citrix.com=prvs=282fc9ee0=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1okNRp-0002Vp-FO
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 10:34:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e8addec-4e07-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 12:34:15 +0200 (CEST)
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
X-Inumbo-ID: 3e8addec-4e07-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666002855;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zuRl5uDWWEC+LzOlFFzqCUms5TW9MwdybAmeZKgC3pM=;
  b=A/Y3LYeanDJ0NUkOKm8lDuuo+GJM2C9gxTEJhrZLuvEWk/ius4xRFSxS
   t8i+T+R+Qc/aPLw5nw70XKp19zrzt4uzsWU2pq4LfB6xeNxynQONF4cpC
   UCu0dlhSKINpa1coeEVw2PQ7YggRxDhV1pnUNoej/jY9P9re29mVarzmb
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 81995746
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nILxCqB97j/FFRVW/yLjw5YqxClBgxIJ4kV8jS/XYbTApGgi1DVSm
 mIcCD+BOfyKZjH0L9FzPoyzoxsEu5eGy9RkQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K2t4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2ksP4YH2dctHVhS9
 PwkLjsHcjCNrOCflefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+Oi0YYuIJYDULSlTtnrE+
 VjF4TTTPg4XLYy1yAW03E+GpuCayEsXX6pNTeblp5aGmma72Wg7GBAQE1yhrpGRqkO4QcMZF
 EUS9QInt610/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3q2WpiyRCHIJFHMDZRMCRgEZw9fIoqhm23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3Y1Q/HNFBz3oRZPmLy8BxknfS9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CK6JP4YTP8YtKFLblM2LWaJ39zm3+HXAbIllY
 cvLGSpSJSxy5VtbIMqeGL5GjO5DKtEWzmLPX5HrpymaPU6lTCfNE98taQLWBshgtfPsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBhXs6p85UJLb7SSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 xlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:Ww4ngK1FKhXIRgRgS+/OIwqjBL4kLtp133Aq2lEZdPRUGvb3qy
 nIpoV+6faUskd2ZJhOo7C90cW7LU80lqQFhLX5X43SPzUO0VHAROoJgLcKqweQfBEWndQ96U
 4PScdD4aXLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.95,191,1661832000"; 
   d="scan'208";a="81995746"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>, Anthony PERARD <anthony.perard@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH for-4.17] tools: Workaround wrong use of tools/Rules.mk by qemu-trad
Date: Mon, 17 Oct 2022 11:34:03 +0100
Message-ID: <20221017103403.63218-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

qemu-trad build system, when built from xen.git, will make use of
Rules.mk (setup via qemu-trad.git/xen-setup). This mean that changes
to Rules.mk will have an impact our ability to build qemu-trad.

Recent commit e4f5949c4466 ("tools: Add -Werror by default to all
tools/") have added "-Werror" to the CFLAGS and qemu-trad start to use
it. But this fails and there's lots of warning that are now turned
into error.

We should teach qemu-trad and xen.git to not have to use Rules.mk when
building qemu-trad, but for now, avoid adding -Werror to CFLAGS when
building qemu-trad.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    for 4.17:
        - fix the build, as detected by the push-gate

 tools/Makefile | 1 +
 tools/Rules.mk | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/tools/Makefile b/tools/Makefile
index 0c1d8b64a4..9e28027835 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -159,6 +159,7 @@ qemu-traditional-recurse = \
 	set -e; \
 		$(buildmakevars2shellvars); \
 		export CONFIG_BLKTAP1=n; \
+		export BUILDING_QEMU_TRAD=y; \
 		cd qemu-xen-traditional-dir; \
 		$(1)
 
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 34d495fff7..6e135387bd 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -141,9 +141,12 @@ endif
 
 CFLAGS_libxenlight += $(CFLAGS_libxenctrl)
 
+# Don't add -Werror if we are used by qemu-trad build system.
+ifndef BUILDING_QEMU_TRAD
 ifeq ($(CONFIG_WERROR),y)
 CFLAGS += -Werror
 endif
+endif
 
 ifeq ($(debug),y)
 # Use -Og if available, -O0 otherwise
-- 
Anthony PERARD


