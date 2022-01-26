Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865EA49C029
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 01:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260619.450415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCWDv-0006Sr-JR; Wed, 26 Jan 2022 00:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260619.450415; Wed, 26 Jan 2022 00:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCWDv-0006R1-GJ; Wed, 26 Jan 2022 00:31:43 +0000
Received: by outflank-mailman (input) for mailman id 260619;
 Wed, 26 Jan 2022 00:31:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pz6t=SK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nCWDu-0006Qv-UO
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 00:31:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53ff2914-7e3f-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 01:31:40 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6FBCA614B7;
 Wed, 26 Jan 2022 00:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D068C340E0;
 Wed, 26 Jan 2022 00:31:38 +0000 (UTC)
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
X-Inumbo-ID: 53ff2914-7e3f-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643157098;
	bh=aGYf0SYL39xCNKZLO3G8tWZmf9aqLIQk1+Fmix7xf+4=;
	h=Date:From:To:cc:Subject:From;
	b=M4bTQU4k7OOhzwbM5rAE0mNfJvCL/FPPQ97SMVDKKLr2iHQctGkL8VNb1odpfHld/
	 ax3QjAwExxmyeXGqGG1wuqrYpOZIvgqRUCDDqytUJqBuhN6Fpnu73xOuno1eh08qA5
	 G6wsRrv6JUeduu8p5Y8UWv2e05+YUO5abpkB5JrJ6yH3nQvBytxuk3GMW0UzRyMlWh
	 Tm08VTPtRjh8t0UqPkJSdUY10wrfkqlq1405fUFP2ggGH0Us2syWkwrpF+dKzuiDpO
	 7i7PotC+DDc56PD/c7OAUpieZD5eTUwUQItoOiEcLSl0KZbQZ3VhqkPsCVP/dGpnJR
	 WMrMQMK5Pmq2w==
Date: Tue, 25 Jan 2022 16:31:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, anthony.perard@citrix.com, 
    andrew.cooper3@citrix.com, wl@xen.org
Subject: automation: remove python-dev from unstable-arm64v8.dockerfile
Message-ID: <alpine.DEB.2.22.394.2201251629430.27308@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Debian unstable doesn't have the legacy python-dev package anymore.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

diff --git a/automation/build/debian/unstable-arm64v8.dockerfile b/automation/build/debian/unstable-arm64v8.dockerfile
index 4409f596e1..5c73458d9d 100644
--- a/automation/build/debian/unstable-arm64v8.dockerfile
+++ b/automation/build/debian/unstable-arm64v8.dockerfile
@@ -15,7 +15,6 @@ RUN apt-get update && \
         zlib1g-dev \
         libncurses5-dev \
         libssl-dev \
-        python-dev \
         python3-dev \
         xorg-dev \
         uuid-dev \

