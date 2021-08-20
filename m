Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526B13F2960
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 11:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169388.309411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0zz-0002Co-18; Fri, 20 Aug 2021 09:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169388.309411; Fri, 20 Aug 2021 09:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0zy-0002A0-Ts; Fri, 20 Aug 2021 09:39:38 +0000
Received: by outflank-mailman (input) for mailman id 169388;
 Fri, 20 Aug 2021 09:39:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aok1=NL=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mH0zx-00029r-LT
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 09:39:37 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 22d96068-bebb-4776-9e54-07b8a04534a3;
 Fri, 20 Aug 2021 09:39:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B881B1042;
 Fri, 20 Aug 2021 02:39:35 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.15.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A3023F40C;
 Fri, 20 Aug 2021 02:39:34 -0700 (PDT)
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
X-Inumbo-ID: 22d96068-bebb-4776-9e54-07b8a04534a3
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com,
	christopher.w.clark@gmail.com
Subject: [PATCH] xen/public: arch-arm: Add mention of argo_op hypercall
Date: Fri, 20 Aug 2021 11:39:24 +0200
Message-Id: <20210820093924.9991-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1ddc0d43c20cb1c1125d4d6cefc78624b2a9ccb7 introducing
argo_op hypercall forgot to add a mention of it in the
comment listing supported hypercalls. Fix that.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/include/public/arch-arm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 64a2ca30da..6b5a5f818a 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -128,6 +128,8 @@
  *    * VCPUOP_register_vcpu_info
  *    * VCPUOP_register_runstate_memory_area
  *
+ *  HYPERVISOR_argo_op
+ *   All generic sub-operations
  *
  * Other notes on the ARM ABI:
  *
-- 
2.29.0


