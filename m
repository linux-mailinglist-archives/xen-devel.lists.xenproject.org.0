Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB167C8892
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:25:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616674.958910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK2H-0005HL-2q; Fri, 13 Oct 2023 15:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616674.958910; Fri, 13 Oct 2023 15:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK2G-0005B4-Mf; Fri, 13 Oct 2023 15:25:08 +0000
Received: by outflank-mailman (input) for mailman id 616674;
 Fri, 13 Oct 2023 15:25:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cw9=F3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qrK2E-0002kj-Te
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:25:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aed9cfbb-69dc-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 17:25:04 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.222.93])
 by support.bugseng.com (Postfix) with ESMTPSA id 929B34EE073C;
 Fri, 13 Oct 2023 17:25:02 +0200 (CEST)
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
X-Inumbo-ID: aed9cfbb-69dc-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 08/10] arm/vgic-v3: address a violation of MISRA C:2012 Rule 8.2
Date: Fri, 13 Oct 2023 17:24:38 +0200
Message-Id: <d508f7bcbc1f6e98b0115774c7b570769b3554ce.1697207038.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697207038.git.federico.serafini@bugseng.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter name, no functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/vgic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 05a009409a..cc38327701 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -360,7 +360,7 @@ read_unknown:
 
 static uint64_t vgic_sanitise_field(uint64_t reg, uint64_t field_mask,
                                     int field_shift,
-                                    uint64_t (*sanitise_fn)(uint64_t))
+                                    uint64_t (*sanitise_fn)(uint64_t field))
 {
     uint64_t field = (reg & field_mask) >> field_shift;
 
-- 
2.34.1


