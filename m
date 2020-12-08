Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFE22D28EA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 11:30:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47311.83778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmaGN-00059w-LL; Tue, 08 Dec 2020 10:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47311.83778; Tue, 08 Dec 2020 10:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmaGN-00059X-IA; Tue, 08 Dec 2020 10:30:31 +0000
Received: by outflank-mailman (input) for mailman id 47311;
 Tue, 08 Dec 2020 10:30:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LMSP=FM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kmaGM-00059O-5k
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 10:30:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 151d3671-09a5-4246-b08e-2b7ab9592ab1;
 Tue, 08 Dec 2020 10:30:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B59CAE65;
 Tue,  8 Dec 2020 10:30:28 +0000 (UTC)
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
X-Inumbo-ID: 151d3671-09a5-4246-b08e-2b7ab9592ab1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607423428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Q1BJsJoq2Z+HC7NwOIC96pWhya7CjvMphLQjJtvQ+Fw=;
	b=dsT2X5h2fPfNfi5dVkUmj6JDeCPD1+Ui48uYBaE8eZeeYsAFBmY5/OImnokqDqAFFMk8+3
	AihZjQ3Wka1T67f+HmInDjFthSZb04KuV4cn1Q6qaTvBhYmlrJ/Vmt9k1Prhzrl+fIryFL
	EeMJRe6iL/Ri65z7L/STo2uqDbU/JH4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: add me as maintainer for tools/xenstore/
Date: Tue,  8 Dec 2020 11:30:26 +0100
Message-Id: <20201208103026.28772-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have been the major contributor for C Xenstore the past few years.

Add me as a maintainer for tools/xenstore/.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dab38a6a14..6dbd99aff4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -584,6 +584,13 @@ F:	xen/include/asm-x86/guest/hyperv-hcall.h
 F:	xen/include/asm-x86/guest/hyperv-tlfs.h
 F:	xen/include/asm-x86/hvm/viridian.h
 
+XENSTORE
+M:	Ian Jackson <iwj@xenproject.org>
+M:	Wei Liu <wl@xen.org>
+M:	Juergen Gross <jgross@suse.com>
+S:	Supported
+F:	tools/xenstore/
+
 XENTRACE
 M:	George Dunlap <george.dunlap@citrix.com>
 S:	Supported
-- 
2.26.2


