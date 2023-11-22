Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C31B7F4024
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:32:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638512.995115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ieM-0001Th-Es; Wed, 22 Nov 2023 08:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638512.995115; Wed, 22 Nov 2023 08:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ieM-0001RT-CH; Wed, 22 Nov 2023 08:31:58 +0000
Received: by outflank-mailman (input) for mailman id 638512;
 Wed, 22 Nov 2023 08:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9zcJ=HD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5ieL-0001RN-J1
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:31:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 981fdeca-8911-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 09:31:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 099591F85D;
 Wed, 22 Nov 2023 08:31:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B0ABA139FD;
 Wed, 22 Nov 2023 08:31:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mVHRKXq8XWXAWAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Nov 2023 08:31:54 +0000
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
X-Inumbo-ID: 981fdeca-8911-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700641915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WNhNMS6GfERY2fdXHxREhOBl3zkUHstZfa5puZf/0sM=;
	b=XDCskOTTH7fu73SgpEOMIkosqsxumzKlHiwMkaHTkhclbJa0krzXi4N24+lZiAhH75vwzh
	SyHO2KEo/peAtNBey72iJerDHHkVlcYN+PZ6DhHpfl/vkpCqVit/uOmmEFPk1oCE9kFC64
	b3jJRLWETVHPSmVWmqrhBWc5HulXgd8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/2] tools: add two local .gitignore files
Date: Wed, 22 Nov 2023 09:31:51 +0100
Message-Id: <20231122083153.24101-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.71
X-Spamd-Result: default: False [3.71 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-0.99)[-0.994];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[30.00%]
X-Spam-Flag: NO

After a new build on my system (OpenSUSE Leap 15.5) "git status" will
print out:

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        tools/pygrub/pygrub.egg-info/
        tools/python/xen.egg-info/

This small patch series fixes that by adding the related entries to
local .gitignore files, while moving the existing global entries for
those directories to them.

Juergen Gross (2):
  tools/pygrub: add .gitignore file
  tools/python: add .gitignore file

 .gitignore              | 4 ----
 tools/pygrub/.gitignore | 2 ++
 tools/python/.gitignore | 4 ++++
 3 files changed, 6 insertions(+), 4 deletions(-)
 create mode 100644 tools/pygrub/.gitignore
 create mode 100644 tools/python/.gitignore

-- 
2.35.3


