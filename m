Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7ED894C94
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 09:24:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.699996.1092460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVK-0003l4-DA; Tue, 02 Apr 2024 07:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699996.1092460; Tue, 02 Apr 2024 07:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVK-0003jT-A9; Tue, 02 Apr 2024 07:24:22 +0000
Received: by outflank-mailman (input) for mailman id 699996;
 Tue, 02 Apr 2024 07:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tdu6=LH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rrYVI-0003jD-Vq
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 07:24:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 051b12de-f0c2-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 09:24:19 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-59-164-46.retail.telecomitalia.it [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id B720E4EE0739;
 Tue,  2 Apr 2024 09:24:18 +0200 (CEST)
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
X-Inumbo-ID: 051b12de-f0c2-11ee-afe5-a90da7624cb6
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [XEN PATCH 0/7] xen: address violations of MISRA C:2012 Rule 16.3
Date: Tue,  2 Apr 2024 09:22:03 +0200
Message-Id: <cover.1712042178.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses some violations of Rule 16.3 by adding the missing
break statements and pseudo-keyword fallthrough.

Federico Serafini (7):
  xen/domctl: address a violation of MISRA C:2012 Rule 16.3
  console: address a violation of MISRA C:2012 Rule 16.3
  xen/sched: address a violation of MISRA C:2012 Rule 16.3
  xen/evtchn: address a violation of MISRA C:2012 Rule 16.3
  xen/sched: address a violation of MISRA C:2012 Rule 16.3
  xen/vm-event: address a violation of MISRA C:2012 Rule 16.3
  vsprintf: address violations of MISRA C:2012 Rule 16.3

 xen/common/domctl.c        | 1 +
 xen/common/event_channel.c | 1 +
 xen/common/sched/core.c    | 1 +
 xen/common/sched/credit2.c | 2 +-
 xen/common/vm_event.c      | 1 +
 xen/common/vsprintf.c      | 6 +++++-
 xen/drivers/char/console.c | 2 ++
 7 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.34.1


