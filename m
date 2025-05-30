Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75081AC8FDD
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001025.1381309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzgS-000315-34; Fri, 30 May 2025 13:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001025.1381309; Fri, 30 May 2025 13:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzgR-0002yM-Vi; Fri, 30 May 2025 13:22:03 +0000
Received: by outflank-mailman (input) for mailman id 1001025;
 Fri, 30 May 2025 13:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKze9-0003ZU-3n
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:19:41 +0000
Received: from 13.mo583.mail-out.ovh.net (13.mo583.mail-out.ovh.net
 [87.98.182.191]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bca85697-3d58-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 15:19:38 +0200 (CEST)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.17.88])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4b83k15sPTz1khX
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:19:37 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-nz9zm (unknown [10.108.42.21])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BCE5DC2659;
 Fri, 30 May 2025 13:19:36 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.95])
 by ghost-submission-5b5ff79f4f-nz9zm with ESMTPSA
 id w/UMHGiwOWi8HAgAWBo3Rw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:19:36 +0000
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
X-Inumbo-ID: bca85697-3d58-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-95G001fe63952f-1568-4af4-bba7-78aaf58620e7,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v3 22/22] MAINTAINERS: add a section for TrenchBoot Slaunch
Date: Fri, 30 May 2025 16:18:04 +0300
Message-ID: <113264e01d44acfe2af59cf220fe7124ab49b9e4.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12711691424670921884
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhephfehfeehudeileeikeffgfffgfefuddtveelvedvhfffgfelvdfgtddutdehfeeinecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkeefmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=lkr/y2WetCt+mF/LprSnrtNgrDqTmRaZK+50RlJ14fY=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611177; v=1;
 b=Qj8nEN04nWAX/lCMM0PYYSItWTnqFv6X+uS/dBFXXu+N/lXoWi849ayCOI8STFzhUPkuiMdh
 HmcifkPc0oUzP6THKQsImSddJ3BbAjivl3bBYqP6KF/LRFKx3aCPa/NzB47Qcg1MKY9OIXhLmwb
 usHB+fQu8X5iAjcT4iYyVkmjCnlMkkuNForfsFnQhZiiRKe/Ny2qY7t93EEreTWJv/wgDolFMAx
 PvPxy2PIG4Y11Ru1hqiME1Vmhxi3e+gtdCPv8Gpdl8ug0Q26O4vKNxgs56C7BUF0A7pHosEjs7I
 BLHtDd7vESx5b5uG9dPKOPilSMPao7W8jIjw4y/PKS06g==

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c11b82eca9..5b1e67401a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -542,6 +542,21 @@ F:	*/configure
 F:	*/*.ac
 F:	tools/
 
+TRENCHBOOT SECURE LAUNCH
+M:	Daniel P. Smith <dpsmith@apertussolutions.com>
+R:	Ross Philipson <ross.philipson@oracle.com>
+R:	Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
+S:	Supported
+F:	xen/arch/x86/boot/slaunch-early.c
+F:	xen/arch/x86/efi/fixmlehdr.c
+F:	xen/arch/x86/include/asm/intel-txt.h
+F:	xen/arch/x86/include/asm/slaunch.h
+F:	xen/arch/x86/include/asm/tpm.h
+F:	xen/arch/x86/intel-txt.c
+F:	xen/arch/x86/slaunch.c
+F:	xen/arch/x86/tpm.c
+F:	xen/include/xen/slr-table.h
+
 VM EVENT, MEM ACCESS and MONITOR
 M:	Tamas K Lengyel <tamas@tklengyel.com>
 R:	Alexandru Isaila <aisaila@bitdefender.com>
-- 
2.49.0


