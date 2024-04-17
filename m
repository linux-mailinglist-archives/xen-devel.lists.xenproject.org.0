Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB3E8A86A9
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 16:51:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707602.1105658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6dB-0004Af-Ni; Wed, 17 Apr 2024 14:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707602.1105658; Wed, 17 Apr 2024 14:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6dB-00048r-KE; Wed, 17 Apr 2024 14:51:25 +0000
Received: by outflank-mailman (input) for mailman id 707602;
 Wed, 17 Apr 2024 14:51:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCN8=LW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rx6d9-00048l-IC
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 14:51:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4417f8b-fcc9-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 16:51:21 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id 8B7384EE073C;
 Wed, 17 Apr 2024 16:51:19 +0200 (CEST)
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
X-Inumbo-ID: f4417f8b-fcc9-11ee-94a3-07e782e9044d
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH] automation/eclair_analysis: substitute deprecated service
Date: Wed, 17 Apr 2024 16:51:16 +0200
Message-Id: <4850cedd9680e521cfac350930b24af19cdf1ab8.1713338908.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The service STD.emptrecd is in the process of being removed in favour
of STD.anonstct.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/toolchain.ecl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
index 71a1e2cce029..86e9a79b5231 100644
--- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
+++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
@@ -44,8 +44,8 @@
 -doc_end
 
 -doc_begin="See Section \"6.19 Structures with No Members\" of "GCC_MANUAL"."
--config=STD.emptrecd,behavior+={c99,GCC_ARM64,specified}
--config=STD.emptrecd,behavior+={c99,GCC_X86_64,specified}
+-config=STD.anonstct,behavior+={c99,GCC_ARM64,specified}
+-config=STD.anonstct,behavior+={c99,GCC_X86_64,specified}
 -doc_end
 
 -doc_begin="See Section \"6.18 Arrays of Length Zero\" of "GCC_MANUAL"."
-- 
2.34.1


