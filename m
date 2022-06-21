Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191BD552AEE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 08:21:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352966.579838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3XEz-0001p0-C5; Tue, 21 Jun 2022 06:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352966.579838; Tue, 21 Jun 2022 06:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3XEz-0001n7-8o; Tue, 21 Jun 2022 06:19:57 +0000
Received: by outflank-mailman (input) for mailman id 352966;
 Tue, 21 Jun 2022 06:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VA9I=W4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3XEx-0001n1-Ue
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 06:19:56 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a4406eb-f12a-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 08:19:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B2D611FD7B;
 Tue, 21 Jun 2022 06:19:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 674BB13A88;
 Tue, 21 Jun 2022 06:19:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PlLmFwljsWLiRwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Jun 2022 06:19:53 +0000
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
X-Inumbo-ID: 2a4406eb-f12a-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655792393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HHS8XoF+R1u8s5svpxcVHVvoIwH1iD1DpcdKbGMjXis=;
	b=gFgsTTR2/H96nB0WMFb+fAdAZ1GVCP2sjYfUjcs3V42HYABcIVB13/BTn2QqoW2JQlGvi0
	caHnRgncv07t6uA6D0MfU8+uADAjQMjdfaXNSjoEf86bhMjCS73BBpYz0GRuiEam3QT1Fk
	Iaa3Eu78mBxVgowd0ekkJSBKEhAEtrs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] maintainers: add me as reviewer for Mini-OS
Date: Tue, 21 Jun 2022 08:19:52 +0200
Message-Id: <20220621061952.6673-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm the main contributor for Mini-OS since several years now.

Add myself as reviewer.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0b0d88ea4..8a99526784 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -419,6 +419,7 @@ F:	xen/test/livepatch/*
 MINI-OS
 M:	Samuel Thibault <samuel.thibault@ens-lyon.org>
 R:	Wei Liu <wl@xen.org>
+R:	Juergen Gross <jgross@suse.com>
 S:	Supported
 L:	minios-devel@lists.xenproject.org
 T:	git https://xenbits.xenproject.org/git-http/mini-os.git
-- 
2.35.3


