Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ACE7E7081
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 18:41:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629755.982166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r191M-0005oA-1K; Thu, 09 Nov 2023 17:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629755.982166; Thu, 09 Nov 2023 17:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r191L-0005lc-UD; Thu, 09 Nov 2023 17:40:47 +0000
Received: by outflank-mailman (input) for mailman id 629755;
 Thu, 09 Nov 2023 17:40:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s8mG=GW=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1r191K-0005lW-FI
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 17:40:46 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1aee46c4-7f27-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 18:40:44 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-5L460Km6PnyedQrezQIKcA-1; Thu, 09 Nov 2023 12:40:37 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 301F8185A784;
 Thu,  9 Nov 2023 17:40:37 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 401981C060BA;
 Thu,  9 Nov 2023 17:40:34 +0000 (UTC)
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
X-Inumbo-ID: 1aee46c4-7f27-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699551642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eKl6/4hR8zE/zb1SF9S/dcAaIWjFtbCJnudDKpnfbyc=;
	b=RaMwtEWax0WFBxMxKzpJOK1CFkz9MIDr5PwjiUqy6E4az+c5WZrM2qg07CD2TTf1PWJjQO
	skcx0TWt6YhUlDlOxXGDuzX+OvompuBt7UCR8Ahxgt4d6WqpzNcPiqQorJj04EnUVzy8uz
	de0ZfJ0EA5ULPX1sKkkMSyvW0EyuY3U=
X-MC-Unique: 5L460Km6PnyedQrezQIKcA-1
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] include/hw/xen: Use more inclusive language in comment
Date: Thu,  9 Nov 2023 18:40:34 +0100
Message-ID: <20231109174034.375392-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Let's improve the wording here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/xen/interface/hvm/params.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/xen/interface/hvm/params.h b/include/hw/xen/interface/hvm/params.h
index a22b4ed45d..9bcb40284c 100644
--- a/include/hw/xen/interface/hvm/params.h
+++ b/include/hw/xen/interface/hvm/params.h
@@ -255,7 +255,7 @@
  * Note that 'mixed' mode has not been evaluated for safety from a
  * security perspective.  Before using this mode in a
  * security-critical environment, each subop should be evaluated for
- * safety, with unsafe subops blacklisted in XSM.
+ * safety, with unsafe subops blocked in XSM.
  */
 #define HVM_PARAM_ALTP2M       35
 #define XEN_ALTP2M_disabled      0
-- 
2.41.0


