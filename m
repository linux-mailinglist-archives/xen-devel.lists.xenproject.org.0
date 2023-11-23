Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAD17F5963
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 08:37:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639366.996654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64HE-0004iX-Vh; Thu, 23 Nov 2023 07:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639366.996654; Thu, 23 Nov 2023 07:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64HE-0004gF-S4; Thu, 23 Nov 2023 07:37:32 +0000
Received: by outflank-mailman (input) for mailman id 639366;
 Thu, 23 Nov 2023 07:37:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FfzT=HE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r64HD-0004g4-0N
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 07:37:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 275135b7-89d3-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 08:37:28 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 404964EE073C;
 Thu, 23 Nov 2023 08:37:26 +0100 (CET)
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
X-Inumbo-ID: 275135b7-89d3-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v5 0/3] address violations of MISRA C:2012 Rule 10.1
Date: Thu, 23 Nov 2023 08:37:15 +0100
Message-Id: <cover.1700724350.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains the leftover patches from [1] with the rename
s/ISOLATE_LOW_BIT/ISOLATE_LSB/ applied. All the already committed patches from
the aforementioned series are dropped.

[1] https://marc.info/?l=xen-devel&m=169841347803987

Nicola Vetrini (3):
  arm/bitops: encapsulate violation of MISRA C:2012 Rule 10.1
  xen/pdx: amend definition of PDX_GROUP_COUNT
  x86_64/mm: express macro CNT using ISOLATE_LSB

 xen/arch/arm/include/asm/bitops.h |  4 ++--
 xen/arch/x86/x86_64/mm.c          | 12 ++++++------
 xen/include/xen/pdx.h             |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.34.1

