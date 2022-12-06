Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D4E6447E2
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 16:21:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455182.712741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Zl7-00073I-Ah; Tue, 06 Dec 2022 15:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455182.712741; Tue, 06 Dec 2022 15:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Zl7-00070x-7O; Tue, 06 Dec 2022 15:21:25 +0000
Received: by outflank-mailman (input) for mailman id 455182;
 Tue, 06 Dec 2022 15:21:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A06j=4E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p2Zl6-0006Tv-FK
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 15:21:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4d61173-7579-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 16:21:23 +0100 (CET)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 43FCE21C4D;
 Tue,  6 Dec 2022 15:21:23 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1565F13326;
 Tue,  6 Dec 2022 15:21:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id g/n8A/Ndj2P8QQAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 06 Dec 2022 15:21:23 +0000
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
X-Inumbo-ID: a4d61173-7579-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670340083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kPuCccgoTLlFNCJvR/fqktliZ98ALKfAAhpa4hrTvpI=;
	b=W10qM1Mqu2DObaVhOl6OVXFJfm86NMEOvU4mPtU8/ZaIShyoImwOh9J8JIV2WTR7eGz5Qg
	bIRVp7ODMpcQyLFLjbmPnFQ8PhMmpPGqov/tiNaNKo8zMmhb9WuM4DSfSnNbiqESbQUMcJ
	wYighZ8Mx91Y2hVB8jWiua0MAwOFrR8=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.1-rc9
Date: Tue,  6 Dec 2022 16:21:22 +0100
Message-Id: <20221206152122.17024-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-xsa-6.1-rc9-tag

xen: 2 0-day security fixes for xen-netback driver

It contains 2 zero.day fixes for the xen-netback driver (XSA-423 and
XSA-424).


Thanks.

Juergen

 drivers/net/xen-netback/common.h    |   2 +-
 drivers/net/xen-netback/interface.c |   6 +-
 drivers/net/xen-netback/netback.c   | 223 ++++++++++++++++++++----------------
 drivers/net/xen-netback/rx.c        |   8 +-
 4 files changed, 133 insertions(+), 106 deletions(-)

Juergen Gross (1):
      xen/netback: don't call kfree_skb() with interrupts disabled

Ross Lagerwall (1):
      xen/netback: Ensure protocol headers don't fall in the non-linear area

