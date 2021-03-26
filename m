Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A25834A9CA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 15:35:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101876.195153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnY2-000783-0y; Fri, 26 Mar 2021 14:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101876.195153; Fri, 26 Mar 2021 14:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnY1-00077e-Tq; Fri, 26 Mar 2021 14:34:49 +0000
Received: by outflank-mailman (input) for mailman id 101876;
 Fri, 26 Mar 2021 14:34:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPnY0-00077Z-S7
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:34:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPnY0-0000N9-RM
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:34:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPnY0-0004uk-Qa
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:34:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPnXx-0002u4-Ei; Fri, 26 Mar 2021 14:34:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=QqJI5eBJti3okSfZ0BENAHRAGswSef7Wxc78tuAYsm4=; b=obHJitTIRbdXJ/JGE8c0hQsQcd
	okIZCDar9AfqcraDesFPrgy+w6+6zCNb7kBZQi2HEi9v0TlcMC9kpnRD3p4TEOasxuZGbuRUVw6O6
	fpzGOCbN9VPSAN7jvU8mnv2S1fbb1Yfdtgdk8loNcf7MkUXjVuOR2oUCCJY6IRz12J+w=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.61701.287453.961124@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 14:34:45 +0000
To: committers@xenproject.org
CC: xen-devel@lists.xenproject.org
Subject: [ANNOUNCE] Xen 4.15 release update
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I think all outstanding blockers have been addressed (although, not
necessarily in an ideal way), or will be today.

Please commit *all code changes* with a release ack
*by the end of today*.

I intend to cut a final RC on Monday (29th of March).  I hope to
release very soon after Easter (late in the week of the 5th of April).

The tree will continue to be open until the middle of next week for
docs and tests updates.  Apart from that code changes will not get
release acks unless they are low risk *and* fix serious bugs.

Ian.

