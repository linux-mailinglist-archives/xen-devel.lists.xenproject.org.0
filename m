Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109DD4C2F87
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 16:24:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278411.475646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFyc-00024W-Kw; Thu, 24 Feb 2022 15:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278411.475646; Thu, 24 Feb 2022 15:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFyc-00022G-Hv; Thu, 24 Feb 2022 15:24:18 +0000
Received: by outflank-mailman (input) for mailman id 278411;
 Thu, 24 Feb 2022 15:24:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l9RI=TH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nNFyb-0001zs-Gk
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 15:24:17 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d41fd7f9-9585-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 16:24:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3CE5021634;
 Thu, 24 Feb 2022 15:24:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 016E613AFF;
 Thu, 24 Feb 2022 15:24:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id j9QPOh+jF2LzXAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 24 Feb 2022 15:24:15 +0000
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
X-Inumbo-ID: d41fd7f9-9585-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645716256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CMUX6zu06GtcQAZGr8gKrme0g9ECkJiXojjlwJeMzfg=;
	b=uy+k4qRi50QdZ5Z+iHf8EnFwcBfaF1+pZebYjYK8D3ChuTiWmxmw9+LAbtl+AXQe0YYv4u
	S4ZP0CG/9eZJW6T8dwffnDjKDkFc1B90UQDAelRyMVv31DqcNaZDUmJTDifokRpI7yhIAP
	915Ko18NwsfHUcC1+2uIz5FCKEvzXio=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] xen/public: add comment to struct xen_mem_acquire_resource
Date: Thu, 24 Feb 2022 16:24:14 +0100
Message-Id: <20220224152414.27948-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7c7f7e8fba01 changed xen/include/public/memory.h in an incompatible
way. Unfortunately the changed parts were already in use in the Linux
kernel, so an update of the header in the kernel would result in a build
breakage.

As the change of above commit was in a section originally meant to be not
stable, it was the usage in the kernel which was wrong.

Add a comment to the modified struct for not reusing the now removed bit,
in order to avoid kernels using it stumbling over a possible new meaning
of the bit.

In case the kernel is updating to a new version of the header, the wrong
use case must be removed first.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- only add comment instead of reverting commit 7c7f7e8fba01 (Jan Beulich)
V3:
- make pad field comment more specific
---
 xen/include/public/memory.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 383a9468c3..2d0817eab1 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -662,6 +662,13 @@ struct xen_mem_acquire_resource {
      * two calls.
      */
     uint32_t nr_frames;
+    /*
+     * Padding field, must be zero on input.
+     * In a previous version this was an output field with the lowest
+     * bit named XENMEM_rsrc_acq_caller_owned. Future versions of this
+     * interface will not reuse this bit with the field being zero on
+     * input.
+     */
     uint32_t pad;
     /*
      * IN - the index of the initial frame to be mapped. This parameter
-- 
2.34.1


