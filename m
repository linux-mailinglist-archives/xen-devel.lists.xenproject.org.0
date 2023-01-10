Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2267A6644A0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 16:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474783.736132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGV9-0001nv-Rx; Tue, 10 Jan 2023 15:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474783.736132; Tue, 10 Jan 2023 15:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGV9-0001mQ-Nb; Tue, 10 Jan 2023 15:25:23 +0000
Received: by outflank-mailman (input) for mailman id 474783;
 Tue, 10 Jan 2023 15:25:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Y9r=5H=citrix.com=prvs=367aabe44=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pFGPK-0005Fu-9l
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 15:19:22 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2648f661-90fa-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 16:19:20 +0100 (CET)
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
X-Inumbo-ID: 2648f661-90fa-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673363960;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1vxXrw+ay3HT99goYjfDAu2oDeD/VzXJvgzuA0z439k=;
  b=BFjmJjSMMtyf2feYHUvQz3HVeZR8VZDgt75a1kIiXvkjmXLdAsSpEHGB
   DicRcv+pzhLsE76AzSAtRbldUGJXTMlXiBh/TNqEGzihp4b3fYlEhuQKw
   sFuylNQhPT6kNkKWq7t5/iAV5g0yZzUrj8rNnxr3Buo7Zgiq3OFiTZZcu
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92366405
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CRPCiaqOfry98Q54OLmzdnqhhyNeBmIeZRIvgKrLsJaIsI4StFCzt
 garIBmEaf3ZZjH0KdpxOtvj/U4DuJ7Ry4cxHAZrrXg9ESIaopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5weHziFNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGkiTw6bnufu+rT4WNllpMMNd86xGIxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw9
 zidoTqlWkxy2Nq32AGU3Cur2df0nCbVCbMWGbyc2aNRuQjGroAUIEJPDgbqyRWjsWahX/pPJ
 kpS/TAhxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmOS6aGyF77LMlzXxKxgcD2gsPiheaQRQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7fa1UwYnY1RfHNEghBHFb9Fb28GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510kvO6RYW9Ca2JN4Amjn1NmOmvpnkGiam4hj6FraTRuftnZ
 cfznTiEUR729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eP2WZJhcp9caAHmRrlgvMu5TPD9r
 4432z2il08OD4UTo0D/reYuELz9BSFnXsir9pUKL7brz8gPMDhJNsI9CIgJI+RN95m5XM+Sl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:dJU/Y634c0bgCnZ56wzLpwqjBAkkLtp133Aq2lEZdPWaSK2lfq
 eV7ZImPH7P+VEssRQb8+xoV5PsfZqxz/JICMwqTNSftOePghrVEGgg1/qe/9XYcxeOidK1rJ
 0QDZSWaueRMbEKt7ef3ODiKadY/DDvysnB7ts2jU0dLz2CDZsO0+4TMHf/LqQZfmd77LMCZe
 uhz/sCiTq8WGgdKv+2DmMCWIH41qf2vaOjTx4aJgItrDKDhzOw6LL8DnGjr2wjegIK77c+0H
 TP1zf07KW7s/2911v12mLJ445N8eGRuudrNYijitU1Nj6psAquaYh7MofyxAwInA==
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="92366405"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH] tools: Fix build with recent QEMU, use "--enable-trace-backends"
Date: Tue, 10 Jan 2023 15:18:54 +0000
Message-ID: <20230110151854.50746-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The configure option "--enable-trace-backend" isn't accepted anymore
and we should use "--enable-trace-backends" instead which was
introduce in 2014 and allow multiple backends.

"--enable-trace-backends" was introduced by:
    5b808275f3bb ("trace: Multi-backend tracing")
The backward compatible option "--enable-trace-backend" is removed by
    10229ec3b0ff ("configure: remove backwards-compatibility and obsolete options")

As we already use ./configure options that wouldn't be accepted by
older version of QEMU's configure, we will simply use the new spelling
for the option and avoid trying to detect which spelling to use.

We already make use if "--firmwarepath=" which was introduced by
    3d5eecab4a5a ("Add --firmwarepath to configure")
which already include the new spelling for "--enable-trace-backends".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index 9e28027835..4906fdbc23 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -218,9 +218,9 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
 	mkdir -p qemu-xen-build; \
 	cd qemu-xen-build; \
 	if $$source/scripts/tracetool.py --check-backend --backend log ; then \
-		enable_trace_backend='--enable-trace-backend=log'; \
+		enable_trace_backend="--enable-trace-backends=log"; \
 	elif $$source/scripts/tracetool.py --check-backend --backend stderr ; then \
-		enable_trace_backend='--enable-trace-backend=stderr'; \
+		enable_trace_backend='--enable-trace-backends=stderr'; \
 	else \
 		enable_trace_backend='' ; \
 	fi ; \
-- 
Anthony PERARD


