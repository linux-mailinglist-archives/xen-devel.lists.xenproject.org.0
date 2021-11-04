Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F4444529A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 13:04:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221459.383178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mibSu-0001ge-GI; Thu, 04 Nov 2021 12:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221459.383178; Thu, 04 Nov 2021 12:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mibSu-0001ed-Bg; Thu, 04 Nov 2021 12:03:32 +0000
Received: by outflank-mailman (input) for mailman id 221459;
 Thu, 04 Nov 2021 12:03:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=93tI=PX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mibSs-0001eM-6g
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 12:03:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38d9d1a5-3d67-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 13:03:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4CB701FD33;
 Thu,  4 Nov 2021 12:03:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 105FD13C68;
 Thu,  4 Nov 2021 12:03:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aZWdAhDMg2HJfQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 04 Nov 2021 12:03:28 +0000
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
X-Inumbo-ID: 38d9d1a5-3d67-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1636027408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=a9R4E0HB2xLDp4LWHws5TWDAPG+j3kmu84UPTEalP5k=;
	b=nzFIHgQVNLTTLwftyBNwFVgPa60mMmMxGnUZ/DIvWa3G/nv/hrOi03fa0bl6QVSVPPfPE4
	zD8/gDhKCf0BlAdCDzw7elKYeIps45ImfSpKIYN+GPVprmRG4Ocos8mm6QAB+4FAacDCXD
	LJYzjWuzIMG13UMUe/rsrZhEIyD3yio=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Community Manager <community.manager@xenproject.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH-for-4.16 0/2] next try for disabling build of qemu-trad
Date: Thu,  4 Nov 2021 13:03:22 +0100
Message-Id: <20211104120324.9668-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another try to disable building qemu-traditional per default.

Juergen Gross (2):
  configure: modify default of building rombios
  tools: disable building qemu-trad per default

 CHANGELOG.md         |   3 +
 stubdom/configure    |   8 ---
 stubdom/configure.ac |   8 +--
 tools/configure      | 131 ++++++++++++++++++-------------------------
 tools/configure.ac   |  80 +++++++++++---------------
 5 files changed, 92 insertions(+), 138 deletions(-)

-- 
2.26.2


