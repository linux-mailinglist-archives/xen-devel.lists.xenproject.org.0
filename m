Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 291D53199D2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 07:01:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84144.157803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lARVz-0004AL-Dp; Fri, 12 Feb 2021 06:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84144.157803; Fri, 12 Feb 2021 06:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lARVz-00049w-AO; Fri, 12 Feb 2021 06:01:15 +0000
Received: by outflank-mailman (input) for mailman id 84144;
 Fri, 12 Feb 2021 06:01:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DDLl=HO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lARVy-00049k-6h
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 06:01:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60bb828b-6fa0-4e17-b5e1-bc7f6fadaf0a;
 Fri, 12 Feb 2021 06:01:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 635A2B1E6;
 Fri, 12 Feb 2021 06:01:12 +0000 (UTC)
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
X-Inumbo-ID: 60bb828b-6fa0-4e17-b5e1-bc7f6fadaf0a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613109672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0v46qQRuE5c4pAwWDjq4Hvrs44PX0xNfVaw3r/wqYzE=;
	b=eyJWTr4jFEUfHoWMr1kClNLREwQz9QTj0mAfBKTo8FIZZwCqU7RRFsLTlmvASzRX3Paw0h
	a4H7RV8cAgE14HCpP3a8oNubwqP2Az+wuERcgt/e+EMvgPRPQwteKLgAiaXm2/wctYsEBe
	dRMiC+IL9Ye52glqAAjj9sGj4uSqSpA=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.11-rc8
Date: Fri, 12 Feb 2021 07:01:11 +0100
Message-Id: <20210212060111.22013-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc8-tag

xen: branch for v5.11-rc8

It contains a single fix for an issue introduced in 5.11: when running
as a Xen guest on Arm systems the kernel will hang during boot.

Thanks.

Juergen

 arch/arm/xen/enlighten.c          | 2 --
 drivers/xen/xenbus/xenbus.h       | 1 -
 drivers/xen/xenbus/xenbus_probe.c | 2 +-
 include/xen/xenbus.h              | 2 --
 4 files changed, 1 insertion(+), 6 deletions(-)

Julien Grall (1):
      arm/xen: Don't probe xenbus as part of an early initcall

