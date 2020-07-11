Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C314C21C451
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2020 14:53:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juEzW-0003zK-2u; Sat, 11 Jul 2020 12:52:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtAK=AW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1juEzV-0003zF-0W
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2020 12:52:29 +0000
X-Inumbo-ID: 5f9163b8-c375-11ea-90a7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f9163b8-c375-11ea-90a7-12813bfff9fa;
 Sat, 11 Jul 2020 12:52:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 723E5ACC6;
 Sat, 11 Jul 2020 12:52:27 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] xen: branch for v5.8-rc5
Date: Sat, 11 Jul 2020 14:52:24 +0200
Message-Id: <20200711125224.14225-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.8b-rc5-tag

xen: branch for v5.8-rc5

It is just one fix of a recent patch (double free in an error path).

Thanks.

Juergen

 drivers/xen/xenbus/xenbus_client.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

Dan Carpenter (1):
      xen/xenbus: Fix a double free in xenbus_map_ring_pv()

