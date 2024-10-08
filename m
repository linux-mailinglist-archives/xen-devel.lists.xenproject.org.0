Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665919950C6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 15:56:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813142.1225949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syAgg-00083c-SB; Tue, 08 Oct 2024 13:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813142.1225949; Tue, 08 Oct 2024 13:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syAgg-000825-PV; Tue, 08 Oct 2024 13:55:42 +0000
Received: by outflank-mailman (input) for mailman id 813142;
 Tue, 08 Oct 2024 13:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gcc3=RE=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1syAge-00081z-Tq
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 13:55:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id feefcaaf-857c-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 15:55:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57018DA7;
 Tue,  8 Oct 2024 06:56:06 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.77.92])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D97EF3F58B;
 Tue,  8 Oct 2024 06:55:35 -0700 (PDT)
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
X-Inumbo-ID: feefcaaf-857c-11ef-99a2-01e77a169b0f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: add myself as maintainer for arm tee
Date: Tue,  8 Oct 2024 15:54:58 +0200
Message-ID: <e853549e25d26264e1a470336a98c48d22b799eb.1728395637.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With Tee mediators now containing Optee and FF-A implementations, add
myself as maintainers to have someone handling the FF-A side.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb0ebf093965..2450b0f9ff9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -516,6 +516,7 @@ F:	stubdom/
 
 TEE MEDIATORS
 M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+M:	Bertrand Marquis <bertrand.marquis@arm.com>
 S:	Supported
 F:	xen/arch/arm/include/asm/tee
 F:	xen/arch/arm/tee/
-- 
2.47.0


