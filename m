Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50C808387
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 09:48:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649606.1014300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBA3D-0004Sf-19; Thu, 07 Dec 2023 08:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649606.1014300; Thu, 07 Dec 2023 08:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBA3C-0004Qb-U5; Thu, 07 Dec 2023 08:48:06 +0000
Received: by outflank-mailman (input) for mailman id 649606;
 Thu, 07 Dec 2023 08:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZB3o=HS=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rBA3C-0004QV-9G
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 08:48:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 555867a1-94dd-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 09:48:03 +0100 (CET)
Received: from Dell.bugseng.com (unknown [78.210.131.21])
 by support.bugseng.com (Postfix) with ESMTPSA id 090BC4EE073A;
 Thu,  7 Dec 2023 09:48:01 +0100 (CET)
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
X-Inumbo-ID: 555867a1-94dd-11ee-9b0f-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 0/5] xen: add parameter names and remove function declarations
Date: Thu,  7 Dec 2023 09:47:49 +0100
Message-Id: <cover.1701936906.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds the missing parameter names and remove useless function
declarations. No functional changes are introduced.

Federico Serafini (5):
  x86/acpi: remove acpi_pic_sci_set_trigger()
  xen/acpi: address violations of MISRA C:2012 Rule 8.2
  x86/mm: remove compat_subarch_memory_op()
  x86/mm: address violations of MISRA C:2012 Rule 8.2
  AMD/IOMMU: address violations of MISRA C:2012 Rule 8.2

 xen/arch/x86/include/asm/acpi.h           |  1 -
 xen/arch/x86/include/asm/mm.h             | 19 +++++++++---------
 xen/drivers/passthrough/amd/iommu.h       | 17 +++++++++-------
 xen/drivers/passthrough/amd/iommu_init.c  | 24 +++++++++++++----------
 xen/include/acpi/apei.h                   |  5 +++--
 xen/include/acpi/cpufreq/cpufreq.h        |  2 +-
 xen/include/acpi/cpufreq/processor_perf.h | 16 +++++++--------
 7 files changed, 45 insertions(+), 39 deletions(-)

-- 
2.34.1


