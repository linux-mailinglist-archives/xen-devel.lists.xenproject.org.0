Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37CC50093F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 11:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304560.519214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nevPb-0005mw-4P; Thu, 14 Apr 2022 09:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304560.519214; Thu, 14 Apr 2022 09:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nevPb-0005kZ-0L; Thu, 14 Apr 2022 09:05:11 +0000
Received: by outflank-mailman (input) for mailman id 304560;
 Thu, 14 Apr 2022 09:05:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNZz=UY=citrix.com=prvs=096427a9b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nevPZ-0005kR-NH
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 09:05:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9ee07ad-bbd1-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 11:05:08 +0200 (CEST)
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
X-Inumbo-ID: f9ee07ad-bbd1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649927108;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yzod/7steHfeWcaKgLP3jqGVaacdsKwxS8qllhLhHzw=;
  b=KZ9ZtK6yYNmZ287fdevWpjcFxKwORpQ6ZO6burzDbm+lHIV03ufoTn2+
   78J7xDI+gIUCH69kYmMt76KrIK9gfSaz28gYcTDd8bQ/ZdmviEEjGGQ+8
   s4tMYXlJ69oAJ6M0xtdMNnpfyudCKZBu2w1F5snoZRcMz6ticHMF3sfpb
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68342880
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Vl++FKBitjXQ9xVW/yzjw5YqxClBgxIJ4kV8jS/XYbTApD8k3jZVz
 DRODW3SOv2NMGWkL9p0YNu+8BkHuJSDn4VjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jg3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhu0
 8p1q5qoTDw5N4SWo8gjA0EFDn1HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4eRqqEN
 5pBAdZpRAXsYhRmZ2ssM6p9vduQi2e4SG1XmV3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0RMFPK/M88AS22qP9uT21ODhcEyMdUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPQ1
 JTjs5LAhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGAufh8wbJpfImKBj
 KrvVeV5vs470JyCN/EfXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3CbSgOXiGrdROdTjn7xETXPjLliCeTcbbSiIOJY3rI6W5LW8JE2C9o5loqw==
IronPort-HdrOrdr: A9a23:+Z4KDKp31CE47tFumba4hbIaV5pIeYIsimQD101hICG9E/b5qy
 nKpp8mPHDP5Qr5NEtLpTniAsi9qA3nmqKdiLN5VYtKNzOLhILHFu9f0bc=
X-IronPort-AV: E=Sophos;i="5.90,259,1643691600"; 
   d="scan'208";a="68342880"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/debug: Drop unnecessary include of compile.h
Date: Thu, 14 Apr 2022 10:04:56 +0100
Message-ID: <20220414090456.10965-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

compile.h changes across incremental builds, but nothing in debug.c uses it.
This avoids debug.c getting rebuilt on every incremental build.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/debug.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
index d90dc9305697..d16f6e6f8d5d 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -15,7 +15,6 @@
  */
 
 #include <xen/sched.h>
-#include <xen/compile.h>
 #include <xen/mm.h>
 #include <xen/domain_page.h>
 #include <xen/guest_access.h>
-- 
2.11.0


