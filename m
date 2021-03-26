Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC4834AB5A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 16:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101904.195219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPoGS-0004rM-KW; Fri, 26 Mar 2021 15:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101904.195219; Fri, 26 Mar 2021 15:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPoGS-0004qz-H9; Fri, 26 Mar 2021 15:20:44 +0000
Received: by outflank-mailman (input) for mailman id 101904;
 Fri, 26 Mar 2021 15:20:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+hki=IY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lPoGR-0004qu-BD
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 15:20:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe2e66c8-3235-4c5b-b6b7-dd79748c642c;
 Fri, 26 Mar 2021 15:20:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2305AC6A;
 Fri, 26 Mar 2021 15:20:41 +0000 (UTC)
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
X-Inumbo-ID: fe2e66c8-3235-4c5b-b6b7-dd79748c642c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616772041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NrmGcC2ZP4daaG+xsdVC0fXaJPEx+1DgPs02v8goGVk=;
	b=oYHzOIoZx/tDcWlR8XF59Mu1DXAWuKbd3PrNwGqf5RsX+jeA76c6bWgafJsnjYDQdY3ufP
	+iYWV/UJtcW4rQSGsiQr/EBX5jsXb02cEE5BTcMqSqNa3M580tXot57+nxt8dIqaJREsko
	jynVEWOae0sYyUgkvTmRfnM9H5WXNGk=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.12-rc5
Date: Fri, 26 Mar 2021 16:20:41 +0100
Message-Id: <20210326152041.25735-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc5-tag

xen: branch for v5.12-rc5

It contains a small series with a more elegant fix of a problem which
was originally fixed in rc2.

Thanks.

Juergen

 arch/x86/include/asm/xen/page.h | 12 ------------
 arch/x86/xen/p2m.c              |  7 ++-----
 arch/x86/xen/setup.c            | 16 ++++++++++++++--
 drivers/xen/Kconfig             |  4 ++--
 4 files changed, 18 insertions(+), 21 deletions(-)

Roger Pau Monne (2):
      xen/x86: make XEN_BALLOON_MEMORY_HOTPLUG_LIMIT depend on MEMORY_HOTPLUG
      Revert "xen: fix p2m size in dom0 for disabled memory hotplug case"

