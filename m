Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B43446622
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 16:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222505.384739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1Oc-0003N1-D7; Fri, 05 Nov 2021 15:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222505.384739; Fri, 05 Nov 2021 15:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1Oc-0003L1-9z; Fri, 05 Nov 2021 15:44:50 +0000
Received: by outflank-mailman (input) for mailman id 222505;
 Fri, 05 Nov 2021 15:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvBC=PY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mj1Oa-0003Kv-NT
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 15:44:48 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d513fee-3e4f-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 16:44:47 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94C3F61108;
 Fri,  5 Nov 2021 15:44:45 +0000 (UTC)
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
X-Inumbo-ID: 4d513fee-3e4f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636127085;
	bh=Yy6HyThmQ15NAkTjlEucZ9OKI+rlfpz7Du/A3lWiud4=;
	h=Date:From:To:cc:Subject:From;
	b=bWkJbwoBy1WSMN9x7ioxt8OVBrBD7pZPi2w6HLG0R12+pE3pOi9VoqIHrkr53yfTs
	 WPODzW5ZLkUDWrmGmSPgLefrK3LpTc6Nv1qHXskeXRC1h1imCUubZHyc7aP8Kz1W+E
	 V1OGVKHLPOzReRtxzHR1+BIyBnFNsr5VbAOoWIwcwMitMSmkPn2o/31kxxaNJ2TRRj
	 /hXpa3PV/eBhrC9s4IlP7XMoD5J3LFgu9lzbuRR+LCGJVNCiukIMZgmohUtFaVgLb2
	 Bl9l/SwwBQdjYTOtq0C53e/ChNr1rYRVQpZZL1mXvHZhZSMO5qwXfMHDr+YTKeNS7J
	 SVVMa1da+VyZg==
Date: Fri, 5 Nov 2021 08:44:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com, 
    Volodymyr_Babchuk@epam.com
Subject: [PATCH v2] MAINTAINERS: add Bertrand to the ARM reviewers
Message-ID: <alpine.DEB.2.22.394.2111050843450.284830@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

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

