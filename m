Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E4FA01096
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 00:03:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864651.1275868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTqh9-00068t-Ij; Fri, 03 Jan 2025 23:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864651.1275868; Fri, 03 Jan 2025 23:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTqh9-00066V-Fs; Fri, 03 Jan 2025 23:03:07 +0000
Received: by outflank-mailman (input) for mailman id 864651;
 Fri, 03 Jan 2025 23:03:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79/6=T3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tTqh8-00066P-72
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 23:03:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e25f51bd-ca26-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 00:03:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ABDAD5C60E1;
 Fri,  3 Jan 2025 23:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A26C4CEDD;
 Fri,  3 Jan 2025 23:03:00 +0000 (UTC)
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
X-Inumbo-ID: e25f51bd-ca26-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735945381;
	bh=oGgHVA7oDmbhDnB8E00B6FTmhfAf4WxQop48Lc/8JVw=;
	h=Date:From:To:cc:Subject:From;
	b=S8Ut1KYc76gfDpje+0swVU3gDGagTOzFSGlqWBLzU/eoI8RVZ1qlQ9XIe1dnM8B9p
	 XDPSzcqKhJ6kxd6N/9EWdHX8zh/UK9jGurd9vwcxZqbmig4EfCWqI8hBUdY1rlEFsp
	 N++EwxDn11QiAjZE3bk4k9FNvyazZL9Xb27Wb0npJx3eKA5a+ppEXFQhPs+1Qp/QMT
	 G575vQGy0+beSRZpuWhTz8+7DiECQYAsA913yE8EbclslVXotrnOQtmwc/wwFw9QdN
	 rjBSaZlRDVPgPAFgJOYMtlVnzhn4HAGu1k3cdZhrkqGhhzx5Y9ipyBRRkWeWXBgoaQ
	 WLE+umt3QQfMw==
Date: Fri, 3 Jan 2025 15:02:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: linux-kernel@vger.kernel.org
cc: sstabellini@kernel.org, jgross@suse.com, xen-devel@lists.xenproject.org
Subject: [PATCH] xen: update pvcalls_front_accept prototype
Message-ID: <alpine.DEB.2.22.394.2501031501420.16425@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 drivers/xen/pvcalls-front.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/pvcalls-front.h b/drivers/xen/pvcalls-front.h
index f694ad77379f..881ef14660bc 100644
--- a/drivers/xen/pvcalls-front.h
+++ b/drivers/xen/pvcalls-front.h
@@ -12,7 +12,7 @@ int pvcalls_front_bind(struct socket *sock,
 int pvcalls_front_listen(struct socket *sock, int backlog);
 int pvcalls_front_accept(struct socket *sock,
 			 struct socket *newsock,
-			 int flags);
+			 struct proto_accept_arg *arg);
 int pvcalls_front_sendmsg(struct socket *sock,
 			  struct msghdr *msg,
 			  size_t len);
-- 
2.25.1


