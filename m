Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E442805397
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647697.1011233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAU22-0008F9-3X; Tue, 05 Dec 2023 11:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647697.1011233; Tue, 05 Dec 2023 11:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAU22-0008D1-0P; Tue, 05 Dec 2023 11:56:06 +0000
Received: by outflank-mailman (input) for mailman id 647697;
 Tue, 05 Dec 2023 11:56:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pDPQ=HQ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rAU20-0008Co-JA
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:56:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 439ae457-9365-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 12:56:03 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-79-46-48-173.retail.telecomitalia.it [79.46.48.173])
 by support.bugseng.com (Postfix) with ESMTPSA id 7D1884EE0742;
 Tue,  5 Dec 2023 12:56:02 +0100 (CET)
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
X-Inumbo-ID: 439ae457-9365-11ee-98e5-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 0/6] xen: address violations of MISRA C:2012 Rule 8.2
Date: Tue,  5 Dec 2023 12:55:49 +0100
Message-Id: <cover.1701764980.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds the missing parameter names and makes some
improvements to the coding style as the removal of trailing spaces and
the use of C standard integer types over Linux typedefs.

No functional changes are introduced.

Federico Serafini (6):
  xen/acpi: address remaining violations of MISRA C:2012 Rule 8.2
  x86/mm: address violations of MISRA C:2012 Rule 8.2
  AMD/IOMMU: address violations of MISRA C:2012 Rule 8.2
  x86/page: address violations of MISRA C:2012 Rule 8.2
  x86/mce: address violations of MISRA C:2012 Rule 8.2
  xen/pci: address violations of MISRA C:2012 Rule 8.2

 xen/arch/x86/cpu/mcheck/mce.h             |  2 +-
 xen/arch/x86/include/asm/acpi.h           |  2 +-
 xen/arch/x86/include/asm/mce.h            |  4 ++--
 xen/arch/x86/include/asm/mm.h             | 20 +++++++++----------
 xen/arch/x86/include/asm/page.h           |  6 +++---
 xen/drivers/passthrough/amd/iommu.h       | 17 +++++++++-------
 xen/drivers/passthrough/amd/iommu_init.c  | 24 +++++++++++++----------
 xen/drivers/passthrough/pci.c             |  8 ++++----
 xen/include/acpi/apei.h                   |  5 +++--
 xen/include/acpi/cpufreq/cpufreq.h        |  2 +-
 xen/include/acpi/cpufreq/processor_perf.h | 16 +++++++--------
 xen/include/xen/pci.h                     |  3 ++-
 12 files changed, 59 insertions(+), 50 deletions(-)

-- 
2.34.1


