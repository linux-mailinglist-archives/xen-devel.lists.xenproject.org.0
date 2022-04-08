Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4AD4F8A7F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 02:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301036.513647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncc3a-0008MX-7O; Fri, 08 Apr 2022 00:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301036.513647; Fri, 08 Apr 2022 00:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncc3a-0008I4-3Z; Fri, 08 Apr 2022 00:00:54 +0000
Received: by outflank-mailman (input) for mailman id 301036;
 Fri, 08 Apr 2022 00:00:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5u+K=US=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ncc3Z-0008HQ-Ew
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 00:00:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3829b66-b6ce-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 02:00:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C7B6161714;
 Fri,  8 Apr 2022 00:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB34BC385A0;
 Fri,  8 Apr 2022 00:00:48 +0000 (UTC)
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
X-Inumbo-ID: f3829b66-b6ce-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649376049;
	bh=c5dS3TwPtb69HRei2wtCh2ZccLHimKYt5cZX8Ct28zU=;
	h=Date:From:To:cc:Subject:From;
	b=j36RiKVYNWyfjjmwg5BkWi5PrlHtH5O9Mh7XQCI9sXXYp6YuPr1f8Ui08Y72Am4ZU
	 Q6x7Cta2LKdlblyGinW9IgFSNP6Nouj9Nck67/Puh6MZstF9yLJCAY4UWjO1e1Nx3u
	 k3qNanO2CDVYHu3M43C35ugC+9arlDOKmE+ERy4rmdueIyA6upcpnl6ng7YWCMmZtY
	 r0bX1sXa11aNwm8Oc9o2lGCZxGtSziMK9gtcKuGhsWy0fj4ThW5gINyUzR4RDkC8KV
	 JkV0ODdZHSFqKKSGcEX5J4bmcW25ivMA6d66MwU7IA7lnRGlD0kc382JkmQbFNrL4R
	 hn0W4hycmeVaQ==
Date: Thu, 7 Apr 2022 17:00:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, anthony.perard@citrix.com, 
    andrew.cooper3@citrix.com
Subject: [PATCH v2] MAINTAINERS: add myself as Continuous Integration
 maintainer
Message-ID: <alpine.DEB.2.22.394.2204071658320.2910984@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I have contributed all the ARM tests to gitlab-ci. After checking with
Doug, I am happy to volunteer to co-maintain Continuous Integration.

Also take the opportunity to remove the stale travis-ci entries.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Doug Goldstein <cardoe@cardoe.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes in v2:
- add Anthony's ack;
- remove the stale travis-ci entries

diff --git a/MAINTAINERS b/MAINTAINERS
index 6a097b43eb..2a47fafe85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -262,11 +262,10 @@ F:	CHANGELOG.md
 
 Continuous Integration (CI)
 M:	Doug Goldstein <cardoe@cardoe.com>
+M:	Stefano Stabellini <sstabellini@kernel.org>
 W:	https://gitlab.com/xen-project/xen
-W:	https://travis-ci.org/xen-project/xen
 S:	Supported
 F:	.gitlab-ci.yml
-F:	.travis.yml
 F:	automation/
 F:	scripts/travis-build
 

