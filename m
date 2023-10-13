Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D06A7C8886
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:25:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616661.958824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK22-0002mT-2G; Fri, 13 Oct 2023 15:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616661.958824; Fri, 13 Oct 2023 15:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK21-0002kp-UU; Fri, 13 Oct 2023 15:24:53 +0000
Received: by outflank-mailman (input) for mailman id 616661;
 Fri, 13 Oct 2023 15:24:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cw9=F3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qrK21-0002kj-54
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:24:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a70f1d37-69dc-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 17:24:51 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.222.93])
 by support.bugseng.com (Postfix) with ESMTPSA id 982AB4EE073A;
 Fri, 13 Oct 2023 17:24:49 +0200 (CEST)
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
X-Inumbo-ID: a70f1d37-69dc-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 00/10] arm: address some violations of MISRA C:2012 Rule 8.2
Date: Fri, 13 Oct 2023 17:24:30 +0200
Message-Id: <cover.1697207038.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses some of the violations of Rule 8.2 adding the
missing parameter names.

Federico Serafini (10):
  arm/gic: address violations of MISRA C:2012 Rule 8.2
  arm/cpufeature: address violations of MISRA C:2012 Rule 8.2
  arm/smpboot: address violations of MISRA C:2012 Rule 8.2
  arm/setup: address violations of MISRA C:2012 Rule 8.2
  arm/p2m: address a violation of MISRA C:2012 Rule 8.2
  arm/cmpxchg: address violations of MISRA C:2012 Rule 8.2
  arm/traps: address a violation of MISRA C:2012 Rule 8.2
  arm/vgic-v3: address a violation of MISRA C:2012 Rule 8.2
  arm/domain: address violations of MISRA C:2012 Rule 8.2
  arm/smmu: address violation of MISRA C:2012 Rule 8.2

 xen/arch/arm/arm64/smpboot.c             |  2 +-
 xen/arch/arm/include/asm/arm32/cmpxchg.h |  2 +-
 xen/arch/arm/include/asm/arm64/cmpxchg.h |  2 +-
 xen/arch/arm/include/asm/cpufeature.h    |  8 ++++----
 xen/arch/arm/include/asm/domain.h        |  4 ++--
 xen/arch/arm/include/asm/gic.h           | 12 ++++++------
 xen/arch/arm/include/asm/p2m.h           |  2 +-
 xen/arch/arm/include/asm/setup.h         |  5 +++--
 xen/arch/arm/setup.c                     |  4 ++--
 xen/arch/arm/traps.c                     |  2 +-
 xen/arch/arm/vgic-v3.c                   |  2 +-
 xen/drivers/passthrough/arm/smmu.c       |  6 +++---
 12 files changed, 26 insertions(+), 25 deletions(-)

-- 
2.34.1


