Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09DF738ADF
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 18:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552935.863221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0ZJ-0001hp-Bw; Wed, 21 Jun 2023 16:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552935.863221; Wed, 21 Jun 2023 16:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0ZJ-0001fr-8Q; Wed, 21 Jun 2023 16:20:29 +0000
Received: by outflank-mailman (input) for mailman id 552935;
 Wed, 21 Jun 2023 16:20:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=30K1=CJ=citrix.com=prvs=529504c83=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qC0ZH-0000tN-J3
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 16:20:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86bd7a0c-104f-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 18:20:25 +0200 (CEST)
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
X-Inumbo-ID: 86bd7a0c-104f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687364425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FeiN0tZrNokVbRAYwlZ3w177gJNyDQjG2lOR1qJ+z1Q=;
  b=MkhyOWrv9TaxZVBygKMdBLdLrLwnKQBsHJiU6rfkA8TEBuP0ZEHENoa9
   T5ktPqX8V589HZNlo+Yi8CEAHIeooYftehwn0NnQrN62iBpsAX2kOjBeU
   mGOmckreAkDYyVB63NvRrRqE0buVQzNOzaxVT07yIQw0AYl3XAb8KeplK
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112968615
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:aK77MKLbiVy/ipZGFE+R75UlxSXFcZb7ZxGr2PjKsXjdYENSgWAEx
 2MfWjuGMvyMajOmfNwjYY63/EgF6MTVmN4xHFRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4AZnPawjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5VXDwS3
 PkZdAwoZxCj3fCqxuiBRNRz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJ8EwBbG/
 z+uE2LROy1AafLO4gi/3nPyo83NrzPqV4tMG+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwVXdZKAvA5wA6Iw6vQpQ2eAwAsTDRMddgnv88eXiEx2
 xmCmNaBLT5ytLyYT1qN+7HSqim9UQAONnMLbyIASQoD4vHgrZs1gxaJScxseIaqivXlFDe2x
 CqFxBXSnJ1K05RNjf/iuwma3XT1/MOhohMJChv/fD/4sip8ZdKZQoWoyQLJ8fAaFoikUQzU1
 JQboPRy/NziHLnUynzSGrVSReHzjxqWGGaC2AAyRvHN4xzooif+Jt4IvVmSMW8zaq45lSnVj
 Fg/UO+7zLtaJzOUYKB+eOpd4Ox6nPG7RbwJuh05B+eig6SdlyfdpkmCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1ln9klT2LGMChn07PPV+iiJm9E+1tDbdzRrphsPPsTPv9r
 r6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5U/SwJ3GSI/QDtJI6aIkdscl3lNw/w9ehHgo
 ivsBSe1CTPX2RX6FOl9QiA/NOy3Acok9hrW/0UEZD6V5pTqWq73hI93Snf9VeN/nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:nKWhJaqIi8UpSiAqhMSQJjMaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-Talos-CUID: 9a23:HPgsfGzPI65Ukn8vPBLsBgU2R515W3jckEv1Kk+YU3R1TuevR2KPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AGmrBSQ7stVpQweutcoSAkZDuxoxR3/7zJhEmo68?=
 =?us-ascii?q?qupehFy5CKyaShWq4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,261,1681185600"; 
   d="scan'208";a="112968615"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 3/3] Config.mk: evaluate XEN_COMPILE_ARCH and XEN_OS on first use
Date: Wed, 21 Jun 2023 17:19:59 +0100
Message-ID: <20230621161959.1061178-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621161959.1061178-1-anthony.perard@citrix.com>
References: <20230621161959.1061178-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

With GNU make 4.4, the number of execution of the command present in
these $(shell ) increased greatly. This is probably because as of make
4.4, exported variable are also added to the environment of $(shell )
construct.

So, to avoid having these command been run more than necessery, we
will use a construct to evaluate on first use.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Config.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Config.mk b/Config.mk
index c529b1ba19cd..5fbdbc4500d2 100644
--- a/Config.mk
+++ b/Config.mk
@@ -19,13 +19,13 @@ or       = $(if $(strip $(1)),$(1),$(if $(strip $(2)),$(2),$(if $(strip $(3)),$(
 
 -include $(XEN_ROOT)/.config
 
-XEN_COMPILE_ARCH    ?= $(shell uname -m | sed -e s/i.86/x86_32/ \
+XEN_COMPILE_ARCH    ?= $(eval XEN_COMPILE_ARCH := $(shell uname -m | sed -e s/i.86/x86_32/ \
                          -e s/i86pc/x86_32/ -e s/amd64/x86_64/ \
                          -e s/armv7.*/arm32/ -e s/armv8.*/arm64/ \
-                         -e s/aarch64/arm64/)
+                         -e s/aarch64/arm64/))$(XEN_COMPILE_ARCH)
 
 XEN_TARGET_ARCH     ?= $(XEN_COMPILE_ARCH)
-XEN_OS              ?= $(shell uname -s)
+XEN_OS              ?= $(eval XEN_OS := $(shell uname -s))$(XEN_OS)
 
 CONFIG_$(XEN_OS) := y
 
-- 
Anthony PERARD


