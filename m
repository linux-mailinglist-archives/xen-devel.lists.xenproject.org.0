Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9DB59FC3F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 15:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392641.631129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqoz-00044K-AP; Wed, 24 Aug 2022 13:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392641.631129; Wed, 24 Aug 2022 13:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqoz-00041u-7M; Wed, 24 Aug 2022 13:53:29 +0000
Received: by outflank-mailman (input) for mailman id 392641;
 Wed, 24 Aug 2022 13:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EISj=Y4=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oQqox-0003fz-PA
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 13:53:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 11544bd4-23b4-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 15:53:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 693EA1042;
 Wed, 24 Aug 2022 06:53:29 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81CC93FAF5;
 Wed, 24 Aug 2022 06:53:24 -0700 (PDT)
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
X-Inumbo-ID: 11544bd4-23b4-11ed-9250-1f966e50362f
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 00/10] xen/arm: smmuv3: Merge Linux fixes to Xen
Date: Wed, 24 Aug 2022 14:53:04 +0100
Message-Id: <cover.1661331102.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series merge the applicable Linux fixes to Xen.

Rahul Singh (10):
  xen/arm: smmuv3: Fix l1 stream table size in the error message
  xen/arm: smmuv3: Fix endianness annotations
  xen/arm: smmuv3: Ensure queue is read after updating prod pointer
  xen/arm: smmuv3: Move definitions to a header
  xen/arm: smmuv3: Remove the page 1 fixup
  xen/arm: smmuv3: Remove the unused fields for PREFETCH_CONFIG command
  xen/arm: smmuv3: Change *array into *const array
  xen/arm: smmuv3: Remove unnecessary oom message
  xen/arm: smmuv3: Fix fall-through warning for Clang
  xen/arm: smmuv3: Avoid open coded arithmetic in memory allocation

 xen/drivers/passthrough/arm/smmu-v3.c | 452 ++------------------------
 xen/drivers/passthrough/arm/smmu-v3.h | 386 ++++++++++++++++++++++
 2 files changed, 420 insertions(+), 418 deletions(-)
 create mode 100644 xen/drivers/passthrough/arm/smmu-v3.h

-- 
2.25.1


