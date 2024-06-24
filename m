Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DE39153C2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 18:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746840.1154050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLmXz-0000qR-J2; Mon, 24 Jun 2024 16:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746840.1154050; Mon, 24 Jun 2024 16:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLmXz-0000ot-GF; Mon, 24 Jun 2024 16:28:03 +0000
Received: by outflank-mailman (input) for mailman id 746840;
 Mon, 24 Jun 2024 16:28:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzrU=N2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLmXx-0000on-Uj
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 16:28:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8065481-3246-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 18:27:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7BA0E60DDB;
 Mon, 24 Jun 2024 16:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9A8C32789;
 Mon, 24 Jun 2024 16:27:57 +0000 (UTC)
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
X-Inumbo-ID: b8065481-3246-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719246478;
	bh=wUVcB6qL608D0QZzMhjaSO2eR9jtEZ7EHuv07yt+Q6g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uBlfgRF1SAgMrX2dfc1ZnvnMiJP4XGYJOlHCxuf1sX735GHCx700+QKzOWBYqNf0H
	 +GocaFXW8nVXPbzpkwlcHCGQizX+bkq59PpGAcdWww5Y98TdQcjKvcUvssPsBnAQAp
	 YGZf0tIfDK6xfan6XMgLUiUphrbwEpFvH4VzKaVz/l7Lrlokk3bmFx753efaIt3ZWh
	 jmrb4QUlfsoPJnb1dhtfDLPyac02OP+ZZTeapQVW+eajSYqIbc/3mpwMEnu0X0H0lz
	 V9f+Gf54YBF/VpB6838p81lbeX5mWpluAdj2RUsxw1cRnJt3ZLZS+edjb2zMf/sSYI
	 3nKU3J4hZoHAg==
Date: Mon, 24 Jun 2024 09:27:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] MAINTAINERS: Update my email address again
In-Reply-To: <20240624094030.41692-1-anthony.perard@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2406240927390.3870429@ubuntu-linux-20-04-desktop>
References: <20240624094030.41692-1-anthony.perard@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Anthony PERARD wrote:
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

