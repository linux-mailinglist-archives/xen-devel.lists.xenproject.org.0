Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6573D7B0F6F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 01:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609170.948081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qldaT-0003SH-N6; Wed, 27 Sep 2023 23:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609170.948081; Wed, 27 Sep 2023 23:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qldaT-0003QF-J6; Wed, 27 Sep 2023 23:04:57 +0000
Received: by outflank-mailman (input) for mailman id 609170;
 Wed, 27 Sep 2023 23:04:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hjpc=FL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qldaS-0003Q9-AU
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 23:04:56 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 437a1dc0-5d8a-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 01:04:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 48FEFCE1B0C;
 Wed, 27 Sep 2023 23:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFCCC433C7;
 Wed, 27 Sep 2023 23:04:47 +0000 (UTC)
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
X-Inumbo-ID: 437a1dc0-5d8a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695855889;
	bh=uiAk5ue/Br3jyQEL/OKpTejQkMNpGbaaeNPmAo+LsOM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J7AzHq2Bl39s/JrJSFl682BoKusQKkeVbB/Rb97oyCo9U2rVVssCgz2zSwjqUYpGK
	 xSSe/OeS6hn8POHUtz+vLRJHlHM7ShJ7tSY4Qnakx4xgDB3R0N1f4g1ONAeSA2waPi
	 K/G1BiMV5NPONTQmVhnnUzlVSxiKIAHKIaq3+vF5YiA/ykWvEFFi9jpTGkTDRHkKL1
	 doiTUca4JqCLRjP+WcTlgwc8f/lxuQAkco1f3ybzy/1GhoHeDHB8wVqai32Dw6bAHT
	 Ak9ylOt6rvHYzyIqEsVnfk2j0rKU3IXPxmi9YRWza7J1lkoT7tv7ITf6ScJm/HEnpD
	 TSFHor3wY6b8A==
Date: Wed, 27 Sep 2023 16:04:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    "community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
In-Reply-To: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 Sep 2023, Henry Wang wrote:
> 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for staging | 6a47ba2f
> 
> https://marc.info/?l=xen-devel&m=168312468808977
> 
> https://marc.info/?l=xen-devel&m=168312687610283

For this issue I suggest to go with this fix unless someone can produce
a better fix before RC2. I don't think we should cut RC2 with this issue
unsolved.

---
[PATCH] xenstored: reset domain connection before XENSTORE_CONNECTED

From: Julien Grall <julien@xen.org>

xenstored will set interface->connection to XENSTORE_CONNECTED before
finalizing the connection which can cause initialization errors on the
guest side. Make sure to call domain_conn_reset(domain) before setting
XENSTORE_CONNECTED.

Signed-off-by: Julien Grall <julien@xen.org>
[stefano: rebase, commit message]
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index a6cd199fdc..9cd6678015 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -989,6 +989,7 @@ static struct domain *introduce_domain(const void *ctx,
 		talloc_steal(domain->conn, domain);
 
 		if (!restore) {
+			domain_conn_reset(domain);
 			/* Notify the domain that xenstore is available */
 			interface->connection = XENSTORE_CONNECTED;
 			xenevtchn_notify(xce_handle, domain->port);
@@ -1031,8 +1032,6 @@ int do_introduce(const void *ctx, struct connection *conn,
 	if (!domain)
 		return errno;
 
-	domain_conn_reset(domain);
-
 	send_ack(conn, XS_INTRODUCE);
 
 	return 0;

