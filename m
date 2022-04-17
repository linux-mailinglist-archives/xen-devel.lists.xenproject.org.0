Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E950470D
	for <lists+xen-devel@lfdr.de>; Sun, 17 Apr 2022 10:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306529.521665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ng05H-0005GZ-Ae; Sun, 17 Apr 2022 08:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306529.521665; Sun, 17 Apr 2022 08:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ng05H-0005Du-6t; Sun, 17 Apr 2022 08:16:39 +0000
Received: by outflank-mailman (input) for mailman id 306529;
 Sun, 17 Apr 2022 08:16:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ljwx=U3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ng05G-0005Dn-IR
 for xen-devel@lists.xenproject.org; Sun, 17 Apr 2022 08:16:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b355ab92-be26-11ec-8fbe-03012f2f19d4;
 Sun, 17 Apr 2022 10:16:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6DBB81F756;
 Sun, 17 Apr 2022 08:16:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3667D13216;
 Sun, 17 Apr 2022 08:16:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v4REC+HMW2LTXAAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 17 Apr 2022 08:16:33 +0000
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
X-Inumbo-ID: b355ab92-be26-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650183393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8hA3P47WmX5/EGYFrm5XFq7kqAZ1F4M1ZIzKycvSpTo=;
	b=o9CfhqReKWVWM271Udk/wEwqeAl4nvA017R8Kqn4LvU5KbDTv58bxQJTwxW4AEW8mE81UB
	gNwJKgLmswA4e/exU6isnZravzoepT3FO4n33kSn8/Cv+sMdiPa4viOh3buEA2fSRfm5W2
	jx9l/HVrSPG5OiTgDV/c0y3en01EPVY=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.18-rc3
Date: Sun, 17 Apr 2022 10:16:32 +0200
Message-Id: <20220417081632.11230-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.18-rc3-tag

xen: branch for v5.18-rc3

It contains just a single cleanup patch for the Xen balloon driver.


Thanks.

Juergen

 drivers/xen/balloon.c           | 54 ++++++++++++++++++-----------------------
 drivers/xen/unpopulated-alloc.c | 33 -------------------------
 2 files changed, 23 insertions(+), 64 deletions(-)

Juergen Gross (1):
      xen/balloon: don't use PV mode extra memory for zone device allocations

