Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 230DF80F138
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 16:38:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653192.1019555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4pf-0000h4-Q4; Tue, 12 Dec 2023 15:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653192.1019555; Tue, 12 Dec 2023 15:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4pf-0000cI-L2; Tue, 12 Dec 2023 15:38:03 +0000
Received: by outflank-mailman (input) for mailman id 653192;
 Tue, 12 Dec 2023 15:38:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0UEi=HX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rD4pd-0000ZS-UU
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 15:38:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ddb39f5-9904-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 16:37:59 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-82-60-45-193.retail.telecomitalia.it [82.60.45.193])
 by support.bugseng.com (Postfix) with ESMTPSA id F1CEE4EE0737;
 Tue, 12 Dec 2023 16:37:58 +0100 (CET)
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
X-Inumbo-ID: 6ddb39f5-9904-11ee-9b0f-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [XEN PATCH 0/4] xen: address violations of MISRA C:2012 Rule 8.2
Date: Tue, 12 Dec 2023 16:37:38 +0100
Message-Id: <cover.1702394721.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds the missing parameter names to address violations of
MISRA C:2012 Rule 8.2. No functional changes are introduced.

Federico Serafini (4):
  xen/compat: address violations of MISRA C:2012 Rule 8.2
  x86/asm: address violations of MISRA C:2012 Rule 8.2
  xen/drivers: address violations of MISRA C:2012 Rule 8.2
  xen/iommu: address leftover violation of MISRA C:2012 Rule 8.2

 xen/arch/x86/include/asm/amd.h       | 2 +-
 xen/arch/x86/include/asm/debugreg.h  | 4 ++--
 xen/arch/x86/include/asm/flushtlb.h  | 3 ++-
 xen/arch/x86/include/asm/hap.h       | 2 +-
 xen/arch/x86/include/asm/iommu.h     | 2 +-
 xen/arch/x86/include/asm/microcode.h | 2 +-
 xen/drivers/char/ehci-dbgp.c         | 4 ++--
 xen/drivers/video/vga.c              | 2 +-
 xen/include/xen/compat.h             | 5 +++--
 xen/include/xen/iommu.h              | 2 +-
 xen/include/xen/video.h              | 2 +-
 11 files changed, 16 insertions(+), 14 deletions(-)

-- 
2.34.1


