Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F047F3EC175
	for <lists+xen-devel@lfdr.de>; Sat, 14 Aug 2021 10:45:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166973.304785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEpH8-0001vz-4E; Sat, 14 Aug 2021 08:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166973.304785; Sat, 14 Aug 2021 08:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEpH8-0001tb-0g; Sat, 14 Aug 2021 08:44:18 +0000
Received: by outflank-mailman (input) for mailman id 166973;
 Sat, 14 Aug 2021 08:44:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jipu=NF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mEpH6-0001tV-Pn
 for xen-devel@lists.xenproject.org; Sat, 14 Aug 2021 08:44:16 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68403981-3de4-4b07-91b9-3f932e4a5d3d;
 Sat, 14 Aug 2021 08:44:15 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 886D82226B;
 Sat, 14 Aug 2021 08:44:14 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4E2C91374B;
 Sat, 14 Aug 2021 08:44:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id vqbyEF6CF2GlIAAAGKfGzw
 (envelope-from <jgross@suse.com>); Sat, 14 Aug 2021 08:44:14 +0000
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
X-Inumbo-ID: 68403981-3de4-4b07-91b9-3f932e4a5d3d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1628930654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DAVLXJ0IXAU+QKBWPzDuqylSvV4KktT+rntSNNfQix8=;
	b=rzhbBDyrjPOoX6CN8W3ohduzsy4YgQucxquaCeO6AM5nDMhzZo1sRWLUYhvtPWWR0Jtayw
	G7s+oVT63M++To0bNMmlxDf7JxcmssSr2tHw/R4YwA4G6DTycrslS2rq4Wdnfi2tsd/yA/
	8m2EKOZEzKUVNBUP3sKSnXXOPyzBxe8=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.14-rc6
Date: Sat, 14 Aug 2021 10:44:13 +0200
Message-Id: <20210814084413.12168-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.14-rc6-tag

xen: branch for v5.14-rc6

It contains a small cleanup patch and a fix of a rare race in the Xen
evtchn driver.

Thanks.

Juergen

 drivers/xen/events/events_base.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

Colin Ian King (1):
      xen/events: remove redundant initialization of variable irq

Maximilian Heyne (1):
      xen/events: Fix race in set_evtchn_to_irq

