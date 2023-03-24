Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3306C7D42
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 12:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514274.796367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pffi7-0002Jc-Fj; Fri, 24 Mar 2023 11:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514274.796367; Fri, 24 Mar 2023 11:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pffi7-0002HB-Cu; Fri, 24 Mar 2023 11:35:55 +0000
Received: by outflank-mailman (input) for mailman id 514274;
 Fri, 24 Mar 2023 11:35:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jsbp=7Q=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pffi5-0002H5-UZ
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 11:35:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07e4699e-ca38-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 12:35:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8D40F1FE1E;
 Fri, 24 Mar 2023 11:35:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5EC61133E5;
 Fri, 24 Mar 2023 11:35:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ClvZFReLHWSCaAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Mar 2023 11:35:51 +0000
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
X-Inumbo-ID: 07e4699e-ca38-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679657751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xWc83XLUl9PJ7QiVshXSwTcQnyqEwM++XJAI9HPUk/s=;
	b=UHFHTfcEihfGAPO/fnNY6qr3FjRWSOFYD0i7rgHXpo8vQFZECiMTJBG2mEmwoeLuDSDQZx
	Fl9hzOQun6QljdjhpmpOLsFTdpYOmV+E5miLje2qvr8VhTt7EuwOq8vrr0RUBi19gd5MhS
	TqrIY3EXq1KfX6Ru6cET7Cs/8IuS4uU=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.3-rc4
Date: Fri, 24 Mar 2023 12:35:50 +0100
Message-Id: <20230324113550.8218-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.3-rc4-tag

xen: branch for v6.3-rc4

It contains two fixes:

- a build warning fix for a patch which went into rc3
- a fix for avoiding concurrent accesses to the Xen PV console ring page


Thanks.

Juergen

 arch/x86/xen/enlighten_pvh.c |  2 +-
 drivers/tty/hvc/hvc_xen.c    | 19 +++++++++++++++++--
 2 files changed, 18 insertions(+), 3 deletions(-)

Jan Beulich (1):
      x86/PVH: avoid 32-bit build warning when obtaining VGA console info

Roger Pau Monne (1):
      hvc/xen: prevent concurrent accesses to the shared ring

