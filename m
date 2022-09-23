Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D9F5E75F3
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 10:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410670.653776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obeEE-00074E-3D; Fri, 23 Sep 2022 08:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410670.653776; Fri, 23 Sep 2022 08:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obeEE-00072G-0Q; Fri, 23 Sep 2022 08:40:10 +0000
Received: by outflank-mailman (input) for mailman id 410670;
 Fri, 23 Sep 2022 08:40:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MVNC=Z2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1obeED-00072A-9e
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 08:40:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51d5564f-3b1b-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 10:40:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BA0F61F8F8;
 Fri, 23 Sep 2022 08:40:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87BE413AA5;
 Fri, 23 Sep 2022 08:40:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WKTDH+dwLWOFDwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 23 Sep 2022 08:40:07 +0000
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
X-Inumbo-ID: 51d5564f-3b1b-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663922407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rHriJ3NiytpyFePfxwPTupKD7kpksa8DfqgHNohg5XY=;
	b=qBhdPuZMJvpGdI1lyEB4pOocaOy1Ou/vvUOqh3djGykOdY5oW8WV0vNbdP0/UW3Zonnf+s
	06GdKAKed1rqO3QguSUqrgm61XairkzRS9PSIOYj4OBTt6WeSpJfekCXVU7A7T7k5A3yFX
	8GgZtsqQBDX67HThGEspy/dci6Y6Nm8=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.0-rc7
Date: Fri, 23 Sep 2022 10:40:07 +0200
Message-Id: <20220923084007.22001-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc7-tag

xen: branch for v6.0-rc7

It contains only a single fix for an issue in the xenbus driver
(initialization of multi-page rings for Xen PV devices).


Thanks.

Juergen

 drivers/xen/xenbus/xenbus_client.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

Juergen Gross (1):
      xen/xenbus: fix xenbus_setup_ring()

