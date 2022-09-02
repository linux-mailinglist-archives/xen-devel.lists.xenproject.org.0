Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9E15AB17E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 15:35:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397698.638349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6pH-0008RY-G5; Fri, 02 Sep 2022 13:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397698.638349; Fri, 02 Sep 2022 13:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6pH-0008PI-CJ; Fri, 02 Sep 2022 13:35:15 +0000
Received: by outflank-mailman (input) for mailman id 397698;
 Fri, 02 Sep 2022 13:35:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Z99=ZF=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oU6pF-0008PC-TL
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 13:35:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 11cd76da-2ac4-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 15:35:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E68A4ED1;
 Fri,  2 Sep 2022 06:35:17 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D35F63F766;
 Fri,  2 Sep 2022 06:35:10 -0700 (PDT)
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
X-Inumbo-ID: 11cd76da-2ac4-11ed-934f-f50d60e1c1bd
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 00/10] xen/arm: smmuv3: Merge Linux fixes to Xen
Date: Fri,  2 Sep 2022 14:34:52 +0100
Message-Id: <cover.1662123432.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series merge the applicable Linux fixes to Xen.

Bixuan Cui (1):
  xen/arm: smmuv3: Change *array into *const array

Christophe JAILLET (1):
  xen/arm: smmuv3: Avoid open coded arithmetic in memory allocation

Gustavo A. R. Silva (1):
  xen/arm: smmuv3: Fix fall-through warning for Clang

Jean-Philippe Brucker (2):
  xen/arm: smmuv3: Fix endianness annotations
  xen/arm: smmuv3: Move definitions to a header

Robin Murphy (1):
  xen/arm: smmuv3: Remove the page 1 fixup

Zenghui Yu (2):
  xen/arm: smmuv3: Fix l1 stream table size in the error message
  xen/arm: smmuv3: Remove the unused fields for PREFETCH_CONFIG command

Zhen Lei (1):
  xen/arm: smmuv3: Remove unnecessary oom message

Zhou Wang (1):
  xen/arm: smmuv3: Ensure queue is read after updating prod pointer

 xen/arch/arm/include/asm/system.h     |   1 +
 xen/drivers/passthrough/arm/smmu-v3.c | 742 ++------------------------
 xen/drivers/passthrough/arm/smmu-v3.h | 672 +++++++++++++++++++++++
 3 files changed, 708 insertions(+), 707 deletions(-)
 create mode 100644 xen/drivers/passthrough/arm/smmu-v3.h

-- 
2.25.1


