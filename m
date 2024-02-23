Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 780A3860E13
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 10:36:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684705.1064735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRy8-0005yv-0X; Fri, 23 Feb 2024 09:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684705.1064735; Fri, 23 Feb 2024 09:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRy7-0005xP-Tx; Fri, 23 Feb 2024 09:35:47 +0000
Received: by outflank-mailman (input) for mailman id 684705;
 Fri, 23 Feb 2024 09:35:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hL0v=KA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rdRy6-0005xJ-4F
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 09:35:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea80ec04-d22e-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 10:35:44 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.196])
 by support.bugseng.com (Postfix) with ESMTPSA id B75ED4EE073F;
 Fri, 23 Feb 2024 10:35:42 +0100 (CET)
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
X-Inumbo-ID: ea80ec04-d22e-11ee-98f5-efadbce2ee36
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	consulting@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 0/2] address some violations of MISRA C Rule 17.7
Date: Fri, 23 Feb 2024 10:35:35 +0100
Message-Id: <cover.1708680104.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 17.7 states: "The value returned by a function having non-void
return type shall be used". Therefore the functions that are subject to this
series are refactored to address these concerns.

Nicola Vetrini (2):
  xen/console: drop return value from consoled_guest_rx/tx
  xen/cpu: address MISRA C Rule 17.7

 xen/common/cpu.c            | 31 +++++++++++++++++++------------
 xen/drivers/char/consoled.c | 17 +++++------------
 xen/include/xen/consoled.h  |  4 ++--
 3 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.34.1

