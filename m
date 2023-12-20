Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8405819D8B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:03:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657631.1026615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuMB-0004tf-KT; Wed, 20 Dec 2023 11:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657631.1026615; Wed, 20 Dec 2023 11:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuMB-0004rM-HT; Wed, 20 Dec 2023 11:03:19 +0000
Received: by outflank-mailman (input) for mailman id 657631;
 Wed, 20 Dec 2023 11:03:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xS+a=H7=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rFuMA-0004rG-9J
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:03:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60db389c-9f27-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 12:03:17 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.218.228])
 by support.bugseng.com (Postfix) with ESMTPSA id EA0924EE0C91;
 Wed, 20 Dec 2023 12:03:14 +0100 (CET)
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
X-Inumbo-ID: 60db389c-9f27-11ee-98eb-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [XEN PATCH 0/7] xen/arm: address violations of MISRA C:2012 Rule 16.3
Date: Wed, 20 Dec 2023 12:03:00 +0100
Message-Id: <cover.1703066935.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses violations of MISRA C:2012 Rule 16.3 on the Arm
code. No fucntional changes are introduced.

Federico Serafini (7):
  xen/arm: gic-v3: address violations of MISRA C:2012 Rule 16.3
  xen/arm: traps: address violations of MISRA C:2012 Rule 16.3
  xen/arm: guest_walk: address violations of MISRA C:2012 Rule 16.3
  xen/arm: mem_access: address violations of MISRA C:2012 Rule 16.3
  xen/arm: v{cp,sys}reg: address violations of MISRA C:2012 Rule 16.3
  xen/arm: mmu: address a violations of MISRA C:2012 Rule 16.3
  xen/arm: smmu-v3: address violations of MISRA C:2012 Rule 16.3

 xen/arch/arm/arm64/vsysreg.c          |  4 ++--
 xen/arch/arm/gic-v3.c                 | 30 +++++++++++++++++++++++++++
 xen/arch/arm/guest_walk.c             |  4 ++++
 xen/arch/arm/mem_access.c             | 12 +++++------
 xen/arch/arm/mmu/p2m.c                |  1 +
 xen/arch/arm/traps.c                  | 18 ++++++++++++----
 xen/arch/arm/vcpreg.c                 |  4 ++--
 xen/drivers/passthrough/arm/smmu-v3.c |  2 ++
 8 files changed, 61 insertions(+), 14 deletions(-)

-- 
2.34.1


