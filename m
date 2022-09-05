Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57EC5AD777
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 18:31:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398952.639949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVF00-0007Ro-7Q; Mon, 05 Sep 2022 16:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398952.639949; Mon, 05 Sep 2022 16:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVF00-0007PS-39; Mon, 05 Sep 2022 16:31:00 +0000
Received: by outflank-mailman (input) for mailman id 398952;
 Mon, 05 Sep 2022 16:30:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkdn=ZI=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVEzy-0007PM-QW
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 16:30:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1db73b5a-2d38-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 18:30:56 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97C9F139F;
 Mon,  5 Sep 2022 09:31:01 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90A8C3F534;
 Mon,  5 Sep 2022 09:30:54 -0700 (PDT)
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
X-Inumbo-ID: 1db73b5a-2d38-11ed-a016-b9edf5238543
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 00/10] xen/arm: smmuv3: Merge Linux fixes to Xen
Date: Mon,  5 Sep 2022 17:30:35 +0100
Message-Id: <cover.1662394710.git.rahul.singh@arm.com>
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

 xen/drivers/passthrough/arm/smmu-v3.c | 741 ++------------------------
 xen/drivers/passthrough/arm/smmu-v3.h | 672 +++++++++++++++++++++++
 2 files changed, 708 insertions(+), 705 deletions(-)
 create mode 100644 xen/drivers/passthrough/arm/smmu-v3.h

-- 
2.25.1


