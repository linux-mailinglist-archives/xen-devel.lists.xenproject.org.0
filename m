Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5997EEDA7
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 09:41:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634876.990435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uP8-0004fk-1l; Fri, 17 Nov 2023 08:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634876.990435; Fri, 17 Nov 2023 08:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uP7-0004dz-VH; Fri, 17 Nov 2023 08:40:45 +0000
Received: by outflank-mailman (input) for mailman id 634876;
 Fri, 17 Nov 2023 08:40:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Lb0=G6=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r3uP6-0004ds-6R
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 08:40:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe68d6d3-8524-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 09:40:43 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.77.7])
 by support.bugseng.com (Postfix) with ESMTPSA id 047914EE0744;
 Fri, 17 Nov 2023 09:40:40 +0100 (CET)
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
X-Inumbo-ID: fe68d6d3-8524-11ee-98dc-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 0/5] xen: address some violations of MISRA C:2012 Rule 8.2
Date: Fri, 17 Nov 2023 09:40:04 +0100
Message-Id: <cover.1700209834.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds the missing parameter names to address violations of
MISRA C:2012 Rule 8.2. No functional changes are introduced.

Federico Serafini (5):
  xen/common: address violations of MISRA C:2012 Rule 8.2
  xen/serial: address violations of MISRA C:2012 Rule 8.2
  xen/sort: address violations of MISRA C:2012 Rule 8.2
  xen/vmap: address violations of MISRA C:2012 Rule 8.2
  xen/xalloc: address violations of MISRA C:2012 Rule 8.2

 xen/common/efi/runtime.c       |  2 +-
 xen/common/rangeset.c          |  6 +++---
 xen/common/spinlock.c          |  8 ++++----
 xen/common/stop_machine.c      |  4 ++--
 xen/common/tasklet.c           |  5 +++--
 xen/common/timer.c             |  4 ++--
 xen/include/xen/rangeset.h     |  4 ++--
 xen/include/xen/serial.h       | 30 +++++++++++++++---------------
 xen/include/xen/sort.h         |  4 ++--
 xen/include/xen/spinlock.h     |  2 +-
 xen/include/xen/stop_machine.h |  2 +-
 xen/include/xen/tasklet.h      |  7 ++++---
 xen/include/xen/timer.h        |  4 ++--
 xen/include/xen/vmap.h         |  6 +++---
 xen/include/xen/xmalloc.h      |  2 +-
 15 files changed, 46 insertions(+), 44 deletions(-)

-- 
2.34.1


