Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D4789826F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 09:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700705.1094254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHqv-0004LS-LV; Thu, 04 Apr 2024 07:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700705.1094254; Thu, 04 Apr 2024 07:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHqv-0004Ji-IE; Thu, 04 Apr 2024 07:49:41 +0000
Received: by outflank-mailman (input) for mailman id 700705;
 Thu, 04 Apr 2024 07:49:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WQJu=LJ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rsHqu-00044w-34
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 07:49:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2f0cd43-f257-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 09:49:38 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-59-164-46.retail.telecomitalia.it [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 40D6E4EE073C;
 Thu,  4 Apr 2024 09:49:37 +0200 (CEST)
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
X-Inumbo-ID: e2f0cd43-f257-11ee-a1ef-f123f15fe8a2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 0/2] xen: address violations of MISRA C:2012 Rule 16.3
Date: Thu,  4 Apr 2024 09:49:27 +0200
Message-Id: <cover.1712215939.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address violations of MISRA C:2012 Rule 16.3 by adding fallthrough, break and
return at the end of the switch-clauses.

Federico Serafini (2):
  xen/sched: address violations of MISRA C:2012 Rule 16.3
  vsprintf: address violations of MISRA C:2012 Rule 16.3

 xen/common/sched/core.c    | 1 +
 xen/common/sched/credit2.c | 2 +-
 xen/common/vsprintf.c      | 6 +++++-
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.34.1


