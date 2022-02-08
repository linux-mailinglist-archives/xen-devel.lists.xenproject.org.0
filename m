Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E798D4AD26A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 08:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267619.461367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHL91-0008Hu-5g; Tue, 08 Feb 2022 07:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267619.461367; Tue, 08 Feb 2022 07:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHL91-0008G7-2R; Tue, 08 Feb 2022 07:42:35 +0000
Received: by outflank-mailman (input) for mailman id 267619;
 Tue, 08 Feb 2022 07:42:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=co3W=SX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nHL90-0008G1-4h
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 07:42:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acf2fee5-88b2-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 08:42:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 997AE1F37C;
 Tue,  8 Feb 2022 07:42:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 51BC513310;
 Tue,  8 Feb 2022 07:42:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6UiREugeAmJuKgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Feb 2022 07:42:32 +0000
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
X-Inumbo-ID: acf2fee5-88b2-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644306152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RkNVJ8B50ZJGLSJsqgFPrNnsyQy6qOKAOEmYrLaw3oU=;
	b=eddlgDv8TnhY8YtMap9NK02ImSBXAh/JBx2Ts438iP7aS+v58Ua0GrnTDviKSk2P0zdvga
	Jn25nqZbJxS52lxXkd9xQF+Mu2dAnpT8OGw4HEVhfZM39FER9VKHf6oLn0fKEn/TJg8A/X
	Nex1jCoezOeQv/HAoMInxwsDxYp6ERI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen/public: add comment to struct xen_mem_acquire_resource
Date: Tue,  8 Feb 2022 08:42:30 +0100
Message-Id: <20220208074230.7901-1-jgross@suse.com>
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
---
 xen/include/public/memory.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 383a9468c3..86513057f7 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -662,6 +662,11 @@ struct xen_mem_acquire_resource {
      * two calls.
      */
     uint32_t nr_frames;
+    /*
+     * Padding field, must be zero on input.
+     * The lowest bit was named XENMEM_rsrc_acq_caller_owned in a previous
+     * version and should not be reused in future.
+     */
     uint32_t pad;
     /*
      * IN - the index of the initial frame to be mapped. This parameter
-- 
2.34.1


