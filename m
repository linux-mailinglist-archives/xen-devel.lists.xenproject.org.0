Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30B4445B6C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 22:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221885.383801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mijqz-0005k6-2d; Thu, 04 Nov 2021 21:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221885.383801; Thu, 04 Nov 2021 21:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mijqy-0005hx-Vt; Thu, 04 Nov 2021 21:00:56 +0000
Received: by outflank-mailman (input) for mailman id 221885;
 Thu, 04 Nov 2021 21:00:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqP1=PX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mijqx-0005hr-Al
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 21:00:55 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c4f3916-3db2-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 22:00:54 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D51906124A;
 Thu,  4 Nov 2021 21:00:52 +0000 (UTC)
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
X-Inumbo-ID: 4c4f3916-3db2-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636059653;
	bh=rkWwZl1orBqN8GfHdUHU+9HlIMR3FOjWj6Imce2oXAs=;
	h=Date:From:To:cc:Subject:From;
	b=GkzOdtO+C5ccaeaxqlYOxjDvwtp76j/WEvVfy1AAaJnDyxpiIEJVJP12PXMK5eDR5
	 i3JgNVEzMmvhLU3po+/0yiAIvKJ9RfX7CdOhjJrnznjPVe5QylnesrHRjORQgDoZb4
	 IUoXFyq9xWc7ufKBindizRoeo7qD/B+i+Xpd6Cx6WEjFeLQkyf/K4rXh3xXynA1/+E
	 PjDnFzHJOWPvyz9Of+6vztZIPqRdw6SE9CQPqacH+sFxtODiczwsRLRRhbXVXcThEk
	 X22khIgNidiAn0WxdZ2wa87brgtfmDnk6tTNPaGDuf2HLvTPwXSWWnzpYYBu8fVBBx
	 9LzsxGKRsgVtg==
Date: Thu, 4 Nov 2021 14:00:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com, 
    Volodymyr_Babchuk@epam.com
Subject: [PATCH] MAINTAINERS: add Bertrand to the ARM reviewers
Message-ID: <alpine.DEB.2.22.394.2111041357580.284830@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 9be4ad653a..4956db1011 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -232,6 +232,7 @@ ARM (W/ VIRTUALISATION EXTENSIONS) ARCHITECTURE
 M:	Stefano Stabellini <sstabellini@kernel.org>
 M:	Julien Grall <julien@xen.org>
 R:	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
+R:	Bertrand Marquis <bertrand.marquis@arm.com>
 S:	Supported
 L:	xen-devel@lists.xenproject.org
 F:	docs/misc/arm/

