Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628584F6B6D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 22:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300119.511726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncCFE-0002dl-6d; Wed, 06 Apr 2022 20:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300119.511726; Wed, 06 Apr 2022 20:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncCFE-0002bX-3d; Wed, 06 Apr 2022 20:27:12 +0000
Received: by outflank-mailman (input) for mailman id 300119;
 Wed, 06 Apr 2022 20:27:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ncCFC-0002bR-KA
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 20:27:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee89518f-b5e7-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 22:27:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 50066B8252B;
 Wed,  6 Apr 2022 20:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07EFC385A5;
 Wed,  6 Apr 2022 20:27:06 +0000 (UTC)
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
X-Inumbo-ID: ee89518f-b5e7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649276827;
	bh=z0aMA9z9JdtH2ebddpqbNR2kb/h3I9KravvKflFK/vA=;
	h=Date:From:To:cc:Subject:From;
	b=bfBeMIOd6hdm8+RBdjBmXy6mKLBQLeI/NQQUWfKuWdmUWP4RpPisFfTXkWihAIiA7
	 68Jb8Uy1UBRVexu7JPCcE66GHfPpnAcignFhyXKW4CXpDbZImPsTM32elgjWom6nfM
	 C1uqBlZHEqwbVgBMcZMNjCV1vH8M9ffIxBcLJTooDCUeCMnMdi0mGumWMN9RU4lPmd
	 mZKj2wT4QVOk430A3gNNKAqcQ4DcR+NXovLHUhitXR+zU//WTZXi9HeQCfadxN/U6a
	 eOuMA3/mXazMdeS65L4aeiCbeNcJcV6ALbC/YXq6YKgprtrQlyeBX5Ugx8TLflkFAJ
	 kqODvD5WW2pUA==
Date: Wed, 6 Apr 2022 13:27:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: cardoe@cardoe.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    andrew.cooper3@citrix.com, anthony.perard@citrix.com
Subject: [PATCH] MAINTAINERS: add myself as Continuous Integration
 maintainer
Message-ID: <alpine.DEB.2.22.394.2204061323490.2910984@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I have contributed all the ARM tests to gitlab-ci. After checking with
Doug, I am happy to volunteer to co-maintain Continuous Integration.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Doug Goldstein <cardoe@cardoe.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 6a097b43eb..cc87d5bbf1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -262,6 +262,7 @@ F:	CHANGELOG.md
 
 Continuous Integration (CI)
 M:	Doug Goldstein <cardoe@cardoe.com>
+M:	Stefano Stabellini <sstabellini@kernel.org>
 W:	https://gitlab.com/xen-project/xen
 W:	https://travis-ci.org/xen-project/xen
 S:	Supported

