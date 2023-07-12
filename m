Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CEE750784
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 14:05:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562437.879098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJYaa-0007Lr-Nk; Wed, 12 Jul 2023 12:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562437.879098; Wed, 12 Jul 2023 12:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJYaa-0007Ji-L2; Wed, 12 Jul 2023 12:05:00 +0000
Received: by outflank-mailman (input) for mailman id 562437;
 Wed, 12 Jul 2023 12:04:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3yk=C6=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qJYaZ-0007Ja-Ap
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 12:04:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 50d39f25-20ac-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 14:04:56 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6D44D75;
 Wed, 12 Jul 2023 05:05:37 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E32F3F67D;
 Wed, 12 Jul 2023 05:04:54 -0700 (PDT)
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
X-Inumbo-ID: 50d39f25-20ac-11ee-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] docs: Fix style in misc/arm/silicon-errata.txt table
Date: Wed, 12 Jul 2023 13:04:40 +0100
Message-Id: <20230712120440.1815240-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the right border of the silicon-errata.txt table

Fixes: 1814a626fb58 ("xen/arm: Update silicon-errata.txt with the Neovers AT erratum")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misc/arm/silicon-errata.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
index 1925d8fd4ee0..a7abcc1ba16c 100644
--- a/docs/misc/arm/silicon-errata.txt
+++ b/docs/misc/arm/silicon-errata.txt
@@ -56,6 +56,6 @@ stable hypervisors.
 | ARM            | Cortex-A73      | #858921         | ARM_ERRATUM_858921      |
 | ARM            | Cortex-A76      | #1165522        | N/A                     |
 | ARM            | Cortex-A76      | #1286807        | ARM64_ERRATUM_1286807   |
-| ARM            | Neoverse-N1     | #1165522        | N/A
+| ARM            | Neoverse-N1     | #1165522        | N/A                     |
 | ARM            | Neoverse-N1     | #1286807        | ARM64_ERRATUM_1286807   |
 | ARM            | MMU-500         | #842869         | N/A                     |
-- 
2.34.1


