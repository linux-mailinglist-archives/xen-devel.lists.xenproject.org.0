Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C870AB5ACE
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983244.1369605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt9M-0000W6-9y; Tue, 13 May 2025 17:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983244.1369605; Tue, 13 May 2025 17:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt9M-0000Tq-4N; Tue, 13 May 2025 17:10:40 +0000
Received: by outflank-mailman (input) for mailman id 983244;
 Tue, 13 May 2025 17:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt6I-0003Uz-CQ
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:07:30 +0000
Received: from 8.mo576.mail-out.ovh.net (8.mo576.mail-out.ovh.net
 [46.105.56.233]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bffd3587-301c-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 19:07:28 +0200 (CEST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.9.153])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjZm441yz28h8
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:07:28 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-j6nvw (unknown [10.111.182.238])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5376C1FDC4;
 Tue, 13 May 2025 17:07:27 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.104])
 by ghost-submission-5b5ff79f4f-j6nvw with ESMTPSA
 id R+r4A098I2hQCwAAwhyZVA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:07:27 +0000
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
X-Inumbo-ID: bffd3587-301c-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-104R005288e3f3d-49dd-4252-a12b-c31cd32c9c22,
                    0F27B6D195039ACFBDF5EC7F2AC12BEA7E98F15C) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
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
Subject: [PATCH v2 22/22] MAINTAINERS: add a section for TrenchBoot Slaunch
Date: Tue, 13 May 2025 20:05:59 +0300
Message-ID: <98bb81298fc94f38ea79975937e7a5aa81157493.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8957659660426982556
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefheduieelieekfffgfffgfedutdevleevvdfhfffgledvgfdtuddtheefieenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehjeeimgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=8CU5n8sNAhVdjlvMK18YMG3nlKQ58o1NvkLmgNfIo+o=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747156048; v=1;
 b=diSlDXfug1mbE2GRfMKugBPijf/YO7XvYtMYpvi+0BRi4FGdonNdHAhyoZ/aIf+mkoHxbNlO
 hXr8umbnvlw477RvgZAMb0uXDh1RM70BdI/NRyUpw5Vv3NeXa7D8NNRM+Y4WDm2B6w3xZ+1sYFa
 DeoWI9bzLk4R3UMUPZ6rbN/oKMS5TpnV7iXgm+4QqShjvCpYSkbPZqx+F85XH6ztGj0bRcEXfae
 JABLnVlg4zIw0mIeikSZIWwiVjAvPpHrV/9FiHjxy5G7/NJTU23caCPOJfE2+YQmAFVvNuPb2za
 Ebr6zRQYHtvNzX46zTnDHUR8H/NrbrliX7uWqAFfMTgLw==

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c11b82eca9..347b3bcbb0 100644
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
+F:	xen/include/xen/slr-table.h
+F:	xen/arch/x86/boot/slaunch-early.c
+F:	xen/arch/x86/efi/fixmlehdr.c
+F:	xen/arch/x86/include/asm/intel-txt.h
+F:	xen/arch/x86/include/asm/slaunch.h
+F:	xen/arch/x86/include/asm/tpm.h
+F:	xen/arch/x86/intel-txt.c
+F:	xen/arch/x86/slaunch.c
+F:	xen/arch/x86/tpm.c
+
 VM EVENT, MEM ACCESS and MONITOR
 M:	Tamas K Lengyel <tamas@tklengyel.com>
 R:	Alexandru Isaila <aisaila@bitdefender.com>
-- 
2.49.0


