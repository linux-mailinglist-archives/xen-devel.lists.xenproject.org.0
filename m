Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B03A9DF4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143280.264128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlQ-0005I9-EN; Wed, 16 Jun 2021 14:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143280.264128; Wed, 16 Jun 2021 14:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlQ-0005GM-7x; Wed, 16 Jun 2021 14:43:32 +0000
Received: by outflank-mailman (input) for mailman id 143280;
 Wed, 16 Jun 2021 14:43:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltWlO-000505-KG
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:43:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlN-0004Ce-C3; Wed, 16 Jun 2021 14:43:29 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlN-0007D0-2m; Wed, 16 Jun 2021 14:43:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=iF2lVk0Jwa+VHF6NCrh9tPc8M6wsYLGVp6TwRt8NLek=; b=udJarbdoYk7AMrC4FmVk4POvy
	bzqzvtUJQkdDGklBjlLj878ADH/RCHrO3d0917hfJI/L7vIfX1n6vNDQ3o+vKWsv3xthaN+QdhIj5
	KKQeHNIzVLOwKJaOM0yqKioyitnkKtSb707ANXl/BCdkbPebKTTuYCm1eTg3TIWkE8HCQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 01/10] MAINTAINERS: Add myself as reviewers for tools/xenstore
Date: Wed, 16 Jun 2021 15:43:15 +0100
Message-Id: <20210616144324.31652-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616144324.31652-1-julien@xen.org>
References: <20210616144324.31652-1-julien@xen.org>

I would like to help reviewing Xenstored patches. It is more convenient
to find them if I am CCed.

Signed-off-by: Julien Grall <julien@xen.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 39750bb75db5..dd8c011456cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -628,6 +628,7 @@ XENSTORE
 M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>
 M:	Juergen Gross <jgross@suse.com>
+R:	Julien Grall <julien@xen.org>
 S:	Supported
 F:	tools/xenstore/
 
-- 
2.17.1


