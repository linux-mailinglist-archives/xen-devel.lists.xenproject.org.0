Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DA27F3FDE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:15:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638489.995057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iNn-0001wd-JF; Wed, 22 Nov 2023 08:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638489.995057; Wed, 22 Nov 2023 08:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iNn-0001tY-Fh; Wed, 22 Nov 2023 08:14:51 +0000
Received: by outflank-mailman (input) for mailman id 638489;
 Wed, 22 Nov 2023 08:14:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9zcJ=HD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5iNm-0001tQ-CT
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:14:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33b45aea-890f-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 09:14:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 64664218E4;
 Wed, 22 Nov 2023 08:14:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DB62139FD;
 Wed, 22 Nov 2023 08:14:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Of3fAXe4XWWdTwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Nov 2023 08:14:47 +0000
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
X-Inumbo-ID: 33b45aea-890f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700640887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YJk8saYbOPgsoRFARhQbEABdOYtcveDgy8HVbqMFVqE=;
	b=ucm7HWRyAA269usUymbJQcj9FHol/jJNJMKF20SxSnBe5CfLG2Wnmq9Hy+kPLNODhO1n4u
	/4KIWxSkXh+7lxn671bhPygZ2V/7diq7620+MO8UnOItNJe6lh1S82PRhiLhabxj2mLzBz
	dwQqxrzZ/vqiaddl21oxvXGpnpu7bTM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] config: update Mini-OS commit
Date: Wed, 22 Nov 2023 09:14:45 +0100
Message-Id: <20231122081445.22581-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: *
X-Spam-Score: 1.84
X-Spamd-Result: default: False [1.84 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-0.99)[-0.990];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.87)[94.26%]
X-Spam-Flag: NO

Update the used commit for Mini-OS in order to be able to use the
9pfs frontend.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 29c29f8d7f..2c43702958 100644
--- a/Config.mk
+++ b/Config.mk
@@ -226,7 +226,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
 QEMU_UPSTREAM_REVISION ?= master
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
-MINIOS_UPSTREAM_REVISION ?= 5bcb28aaeba1c2506a82fab0cdad0201cd9b54b3
+MINIOS_UPSTREAM_REVISION ?= b08019f0b2fbc30c75169a160acb9fd9af5d68f4
 
 SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
 SEABIOS_UPSTREAM_REVISION ?= rel-1.16.2
-- 
2.35.3


