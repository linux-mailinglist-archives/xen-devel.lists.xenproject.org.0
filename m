Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F0D916505
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 12:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747547.1154987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM3CD-0007YO-Dl; Tue, 25 Jun 2024 10:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747547.1154987; Tue, 25 Jun 2024 10:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM3CD-0007WQ-A6; Tue, 25 Jun 2024 10:14:41 +0000
Received: by outflank-mailman (input) for mailman id 747547;
 Tue, 25 Jun 2024 10:14:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=075v=N3=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sM3CC-0007WK-IR
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 10:14:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bada7cc0-32db-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 12:14:38 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-17-171-46.retail.telecomitalia.it [87.17.171.46])
 by support.bugseng.com (Postfix) with ESMTPSA id A83A64EE0738;
 Tue, 25 Jun 2024 12:14:36 +0200 (CEST)
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
X-Inumbo-ID: bada7cc0-32db-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/3] address violation of MISRA C Rule 13.6
Date: Tue, 25 Jun 2024 12:14:18 +0200
Message-Id: <cover.1719308599.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to address several violations of Rule 13.6 which states the
following: The operand of the `sizeof' operator shall not contain any expression
which has potential side effects.

Alessandro Zucchelli (3):
  common/kernel: address violation of MISRA C Rule 13.6
  xen/event: address violation of MISRA C Rule 13.6
  common/softirq: address violation of MISRA C Rule 13.6

 xen/common/kernel.c     | 5 +++--
 xen/common/softirq.c    | 3 ++-
 xen/include/xen/event.h | 8 +++++---
 3 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.34.1


