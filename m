Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F169F7F75EF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 15:05:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640731.999367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnU-0005Or-5Q; Fri, 24 Nov 2023 14:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640731.999367; Fri, 24 Nov 2023 14:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnU-0005NH-10; Fri, 24 Nov 2023 14:04:44 +0000
Received: by outflank-mailman (input) for mailman id 640731;
 Fri, 24 Nov 2023 14:04:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wuqv=HF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r6WnS-0005N1-2b
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 14:04:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68b2604b-8ad2-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 15:04:40 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.237.167])
 by support.bugseng.com (Postfix) with ESMTPSA id 5ACF24EE073C;
 Fri, 24 Nov 2023 15:04:38 +0100 (CET)
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
X-Inumbo-ID: 68b2604b-8ad2-11ee-9b0e-b553b5be7939
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
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 00/11] xen: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 24 Nov 2023 15:03:15 +0100
Message-Id: <cover.1700832962.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds some of the missing parameter names.
No functional changes are introduced.

Federico Serafini (11):
  xen/console: address violations of MISRA C:2012 Rule 8.2
  xen/aclinux: address violations of MISRA C:2012 Rule 8.2
  xen/cpumask: address violations of MISRA C:2012 Rule 8.2
  xen/dmi: address a violation of MISRA C:2012 Rule 8.2
  xen/domain: address violations of MISRA C:2012 Rule 8.2
  xen/notifier: address violations of MISRA C:2012 Rule 8.2
  xen/iommu: address violations of MISRA C:2012 Rule 8.2
  xen/kernel: address a violation of MISRA C:2012 Rule 8.2
  xen/param: address a violation of MISRA C:2012 Rule 8.2
  xen/perfc: address a violation of MISRA C:2012 Rule 8.2
  xen/serial: address a violation of MISRA C:2012 Rule 8.2

 xen/drivers/char/console.c          |  4 ++--
 xen/include/acpi/platform/aclinux.h |  6 +++---
 xen/include/xen/console.h           |  2 +-
 xen/include/xen/cpumask.h           |  6 ++++--
 xen/include/xen/dmi.h               |  2 +-
 xen/include/xen/domain.h            | 14 +++++++-------
 xen/include/xen/iommu.h             | 13 +++++++------
 xen/include/xen/kernel.h            |  2 +-
 xen/include/xen/notifier.h          |  3 ++-
 xen/include/xen/param.h             |  2 +-
 xen/include/xen/perfc.h             |  2 +-
 xen/include/xen/serial.h            |  2 +-
 12 files changed, 31 insertions(+), 27 deletions(-)

-- 
2.34.1


