Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82119510A6F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 22:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314161.532121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njRn1-0006fl-DW; Tue, 26 Apr 2022 20:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314161.532121; Tue, 26 Apr 2022 20:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njRn1-0006dN-9e; Tue, 26 Apr 2022 20:28:03 +0000
Received: by outflank-mailman (input) for mailman id 314161;
 Tue, 26 Apr 2022 20:28:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1njRmz-0006dH-OK
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 20:28:01 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ec61c00-c59f-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 22:27:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC8AAB822B1;
 Tue, 26 Apr 2022 20:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F91C385AD;
 Tue, 26 Apr 2022 20:27:33 +0000 (UTC)
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
X-Inumbo-ID: 4ec61c00-c59f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651004853;
	bh=8+xdsPhWMfI5r99cdhsKwN+dtPwe0XNRTrWsh2XN7lY=;
	h=Date:From:To:cc:Subject:From;
	b=UXo0GsTvo7XDBlxfetK5/LEdGG0fjPXB8UNsm9WdHR4YTu5T/XhijPnl8h0KOv5vU
	 aPjpKYrMz4RkA8qGyotXhXVhCVYZaSZre0xDt3TkafdTFQ0ZicA1LcHTgy3iFT8IyC
	 fL29+5nDmfyqLqRc8DCKQ7ti8xEsyvzBCQV4tcfeoZalw6FbC0W47ixoXWQ23HOGSa
	 D2bhgmhQWHea1oEp3T3yXRBS8vuhKmYEL4GrqC6iVIw0r0TYHJYqDz8429l7ecxZvI
	 UEra3OTMACMLrIaelFUrUthBWd9/12BEET/AdoQMR3hUy1u7kPs9CMa056Nlk6/F0G
	 eYaWQy22ccQqA==
Date: Tue, 26 Apr 2022 13:27:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, julien@xen.org, rahul.singh@arm.com, 
    Bertrand.Marquis@arm.com
Subject: [PATCH] MAINTAINERS: add Rahul as SMMU maintainer
Message-ID: <alpine.DEB.2.22.394.2204261323430.915916@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add Rahul as ARM SMMU maintainer. Create a new explicit entry for "ARM
SMMU" also with Julien which is the original contributor of the code and
continues to maintain it.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>


diff --git a/MAINTAINERS b/MAINTAINERS
index 2a47fafe85..ba0d1c0c1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -248,6 +248,12 @@ F:	xen/drivers/passthrough/arm/
 F:	xen/include/public/arch-arm/
 F:	xen/include/public/arch-arm.h
 
+ARM SMMU
+M:	Julien Grall <julien@xen.org>
+M:	Rahul Singh <rahul.singh@arm.com>
+S:	Supported
+F:	xen/drivers/passthrough/arm/smmu.c
+
 ARM SMMUv3
 M:	Bertrand Marquis <bertrand.marquis@arm.com>
 M:	Rahul Singh <rahul.singh@arm.com>

