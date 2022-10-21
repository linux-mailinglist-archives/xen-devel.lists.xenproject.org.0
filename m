Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FCC607418
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 11:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427484.676588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloNA-0000pB-HV; Fri, 21 Oct 2022 09:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427484.676588; Fri, 21 Oct 2022 09:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloNA-0000nO-EV; Fri, 21 Oct 2022 09:31:24 +0000
Received: by outflank-mailman (input) for mailman id 427484;
 Fri, 21 Oct 2022 09:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MvAv=2W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oloN8-0000nI-Og
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 09:31:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f2a7e7a-5123-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 11:31:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 652C71F8DD;
 Fri, 21 Oct 2022 09:31:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 342AC13A0E;
 Fri, 21 Oct 2022 09:31:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xHtcC+hmUmOLegAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 21 Oct 2022 09:31:20 +0000
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
X-Inumbo-ID: 1f2a7e7a-5123-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666344680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=66VORuuRGgtD11eadp0v6/ucFeH/DC5nWV02hBdGj8Q=;
	b=nIpBl5ZWwNpjsyS/76Q2FZw5hcYWY9KeI/OnSeX2yPJ0sexktUJsAHlXR+z1ifMPoig0SE
	JwpD8lrlQw5BZa1zIxkJy7JL8Ll/MrsPRunY68YUI2reiVaE4Q7knXfXUcHQyi7JBF6Tdn
	+kDDAH1NVDi0bhjBFAB+mSJnwDLc4rY=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.1-rc2
Date: Fri, 21 Oct 2022 11:31:19 +0200
Message-Id: <20221021093119.25978-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.1-rc2-tag

xen: branch for v6.1-rc2

It contains just 2 fixes for the new "virtio with grants" feature.


Thanks.

Juergen

 drivers/xen/grant-dma-ops.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

Oleksandr Tyshchenko (2):
      xen/virtio: Handle cases when page offset > PAGE_SIZE properly
      xen/virtio: Convert PAGE_SIZE/PAGE_SHIFT/PFN_UP to Xen counterparts

