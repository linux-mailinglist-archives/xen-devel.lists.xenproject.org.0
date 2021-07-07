Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EABF3BE35A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 09:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151968.280801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m11Z1-00063z-6a; Wed, 07 Jul 2021 07:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151968.280801; Wed, 07 Jul 2021 07:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m11Z1-00061W-2y; Wed, 07 Jul 2021 07:01:43 +0000
Received: by outflank-mailman (input) for mailman id 151968;
 Wed, 07 Jul 2021 07:01:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dzvn=L7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m11Z0-00061Q-9g
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 07:01:42 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4f17736-32a3-4535-9d4d-fd3f24a92d18;
 Wed, 07 Jul 2021 07:01:41 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8ED6D2001A;
 Wed,  7 Jul 2021 07:01:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 619F013768;
 Wed,  7 Jul 2021 07:01:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id BjeeFlRR5WAkDwAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 07 Jul 2021 07:01:40 +0000
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
X-Inumbo-ID: b4f17736-32a3-4535-9d4d-fd3f24a92d18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1625641300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z/e1G+gloDaAJuCz1ic3rY8b4Q6mwDzhQzHZUcYRM20=;
	b=EDS83y1O8+1gXi+Y6G9NBCc00pHQ33+jQ/Yt+dj1A18BKAHI/ThqLjlCMlGeQocmRg+/5v
	+NgnPQSLq0Yo6nQ2aSEEaDwzhTj0ItTlAQQy0OIwKorBcpfgcrgiOA7mXY+35/TVU8GNmC
	ynosbRpR++FY2H6x3nHmn3WMH497pDk=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.14-rc1
Date: Wed,  7 Jul 2021 09:01:39 +0200
Message-Id: <20210707070139.27901-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.14-rc1-tag

xen: branch for v5.14-rc1

It contains only two minor patches this time: one cleanup patch and
one patch refreshing a Xen header.

Thanks.

Juergen

 drivers/xen/pcpu.c                |   6 +-
 drivers/xen/xen-balloon.c         |  28 ++--
 drivers/xen/xenbus/xenbus_probe.c |  15 +-
 include/xen/interface/io/ring.h   | 278 +++++++++++++++++++++-----------------
 4 files changed, 177 insertions(+), 150 deletions(-)

Juergen Gross (1):
      xen: sync include/xen/interface/io/ring.h with Xen's newest version

YueHaibing (1):
      xen: Use DEVICE_ATTR_*() macro

