Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D2D575B21
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 08:01:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367916.599090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCENF-00040q-7D; Fri, 15 Jul 2022 06:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367916.599090; Fri, 15 Jul 2022 06:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCENF-0003xM-41; Fri, 15 Jul 2022 06:00:25 +0000
Received: by outflank-mailman (input) for mailman id 367916;
 Fri, 15 Jul 2022 06:00:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oCEND-0003xG-Di
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 06:00:23 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68f05f50-0403-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 08:00:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 311301FB88;
 Fri, 15 Jul 2022 06:00:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F310E13AC3;
 Fri, 15 Jul 2022 06:00:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lNAKOnMC0WKtaQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 15 Jul 2022 06:00:19 +0000
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
X-Inumbo-ID: 68f05f50-0403-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657864820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z/F3cQT+cH3GAtGr2gCyZOGo26FZMuBzzs2I/si0ezY=;
	b=rGKKnreJ2+t4MDodt8pguFR1rgCvsfX1QkMDJ5fOY8QpvqNN34RAtJ7bdHc30HgaSbjFsg
	Jfs+tEMU6ymU/z9Ud4OUmXRcRke4uzTjB7ACeOZ3DnpVpf0T8f7qtMONlTjSi5YiR6gjgF
	O+FFdTw0aK/W8Xs/T1WOEfHgdVKyGdg=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v5.19-rc7
Date: Fri, 15 Jul 2022 08:00:19 +0200
Message-Id: <20220715060019.5197-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19a-rc7-tag

xen: branch for v5.19-rc7

It contains a single patch for fixing an issue in the Xen gntdev driver
causing inappropriate WARN() messages.

Thanks.

Juergen

 drivers/xen/gntdev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Demi Marie Obenour (1):
      xen/gntdev: Ignore failure to unmap INVALID_GRANT_HANDLE

