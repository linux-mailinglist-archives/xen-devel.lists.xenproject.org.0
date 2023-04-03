Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DC96D4DAE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 18:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517537.803021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjN2t-0007uT-7X; Mon, 03 Apr 2023 16:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517537.803021; Mon, 03 Apr 2023 16:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjN2t-0007rY-4B; Mon, 03 Apr 2023 16:28:39 +0000
Received: by outflank-mailman (input) for mailman id 517537;
 Mon, 03 Apr 2023 16:28:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L93W=72=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pjN2r-0007KG-So
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 16:28:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95cbb07e-d23c-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 18:28:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 163CF21EEC;
 Mon,  3 Apr 2023 16:28:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C8A5B13416;
 Mon,  3 Apr 2023 16:28:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SzKZL7T+KmTtXgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 03 Apr 2023 16:28:36 +0000
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
X-Inumbo-ID: 95cbb07e-d23c-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680539317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=221NmFTRmK1PFAHtiBP2d1/nR5dmCSk7Sk74pCThNJQ=;
	b=YegnYhORMyDnRciHjmFHW0hridB1GwSWIr7sp9x6vZe6gEmxyWp/09cWdROCKDz5gIFDQf
	xhWiKsrzneX7RzVcXgd3jMji8mHElRvxRsHn4ub8UYk6asn2WwrY+hSCRibOX5+iFi1SPg
	mDwiWinrWYxP6pURfCjjz8hvGe+aFwk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] xen: update CONFIG_DEBUG_INFO help text
Date: Mon,  3 Apr 2023 18:28:23 +0200
Message-Id: <20230403162823.30681-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230403162823.30681-1-jgross@suse.com>
References: <20230403162823.30681-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the help text of the CONFIG_DEBUG_INFO option to be a little
bit more specific.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- expand help text, especially mentioning INSTALL_EFI_STRIP
  (Jan Beulich)
---
 xen/Kconfig.debug | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index e0d773d347..e6e609f813 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -15,8 +15,14 @@ config DEBUG_INFO
 	bool "Compile Xen with debug info"
 	default DEBUG
 	help
-	  If you say Y here the resulting Xen will include debugging info
-	  resulting in a larger binary image.
+	  Say Y here if you want to build Xen with debug information. This
+	  information is needed e.g. for doing crash dump analysis of the
+	  hypervisor via the "crash" tool.
+	  Saying Y will increase the size of the xen-syms and xen.efi
+	  binaries. In case the space on the EFI boot partition is rather
+	  limited, you may want to make use of the INSTALL_EFI_STRIP make
+	  variable when building the hypervisor, in order to strip xen.efi
+	  before installing it to the EFI partition.
 
 if DEBUG || EXPERT
 
-- 
2.35.3


