Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AB55A35D8
	for <lists+xen-devel@lfdr.de>; Sat, 27 Aug 2022 10:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394125.633421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRrDM-0002CF-Fm; Sat, 27 Aug 2022 08:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394125.633421; Sat, 27 Aug 2022 08:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRrDM-0002AR-Bb; Sat, 27 Aug 2022 08:30:48 +0000
Received: by outflank-mailman (input) for mailman id 394125;
 Sat, 27 Aug 2022 08:30:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oRrDL-0002AL-B9
 for xen-devel@lists.xenproject.org; Sat, 27 Aug 2022 08:30:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b768b07-25e2-11ed-bd2e-47488cf2e6aa;
 Sat, 27 Aug 2022 10:30:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BA1E61FA82;
 Sat, 27 Aug 2022 08:30:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F2FF1341F;
 Sat, 27 Aug 2022 08:30:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TEqAITTWCWN+CgAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 27 Aug 2022 08:30:44 +0000
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
X-Inumbo-ID: 8b768b07-25e2-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661589044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QFtJgi7SuZq8TP8XBsbv6JKb1wtY2N+Odb/y/cSybqg=;
	b=mUlKFSVIs4zmpbiR8nLXQSrIJVYUfgdHXWLxI8YOILZ3FHacm95z4rtxzMBf3+4M/r8nc+
	JWKkkTBls+8xHF1fOC5IdJUKlurBA+jvxvQ8WEkxXMwuT9koK3zPOFAF8GqdBFJNB42rrI
	IZLpiUZdd9EcK40/RUZgHn2zDTX2Mq0=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.0-rc3
Date: Sat, 27 Aug 2022 10:30:44 +0200
Message-Id: <20220827083044.5631-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc3-tag

xen: branch for v6.0-rc3

It contains the following patches:

- 2 minor cleanups

- a fix of the xen/privcmd driver avoiding a possible NULL dereference
  in an error case


Thanks.

Juergen

 arch/x86/configs/xen.config                |  1 -
 drivers/xen/privcmd.c                      | 21 +++++++++++----------
 drivers/xen/xen-scsiback.c                 |  2 +-
 drivers/xen/xenbus/xenbus_probe_frontend.c |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

Juergen Gross (1):
      xen/privcmd: fix error exit of privcmd_ioctl_dm_op()

Lukas Bulwahn (1):
      xen: x86: remove setting the obsolete config XEN_MAX_DOMAIN_MEMORY

Wolfram Sang (1):
      xen: move from strlcpy with unused retval to strscpy

