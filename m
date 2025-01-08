Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1186EA065F0
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 21:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867726.1279292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVcUR-0000bu-M0; Wed, 08 Jan 2025 20:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867726.1279292; Wed, 08 Jan 2025 20:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVcUR-0000Z4-JC; Wed, 08 Jan 2025 20:17:19 +0000
Received: by outflank-mailman (input) for mailman id 867726;
 Wed, 08 Jan 2025 20:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/V3S=UA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tVcUQ-0000Yy-Hz
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 20:17:18 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8da55d9e-cdfd-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 21:17:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8584FA4191C;
 Wed,  8 Jan 2025 20:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8EAC4CED3;
 Wed,  8 Jan 2025 20:17:13 +0000 (UTC)
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
X-Inumbo-ID: 8da55d9e-cdfd-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736367434;
	bh=6Y7mj0SSgau3aq+NCVzuNqEQFQXMu0eSs9g1ZmEoy1k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SCddbubU8ajMflB0RjN8iTnqkD1WkDJ4HY22sShExDqK6uZLzGSvCveXLqCn9hUze
	 ALZ63ZEq0HweQZj2iYUCxT1LpI5R6Y3i3zTTVJAb2ex0t9sJpcuRD41TPNnZke8zmP
	 yocIBKyqKVyfruM4h3cjRCu5LjSsWKwDS+XU59BS21pR/LGeCslUrjoFqTDhrjB63b
	 KATqykAmlPa1ehibQF01/B3MdsSXzTSV751JmbmmhqW9fE4w+a4ce2gO1clXX0EkDy
	 ObtVfO8xNrHhCKSpuVoQMooiKy4UjNwzdJoJIK3bkh4vitVfTLAGI/9gNIRIZve+ZN
	 jXpXwAPv36qnw==
Date: Wed, 8 Jan 2025 12:17:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH for-4.20] CI: Update Fedora to 41
In-Reply-To: <Z36KL4Sss_QuUQim@l14>
Message-ID: <alpine.DEB.2.22.394.2501081217080.133435@ubuntu-linux-20-04-desktop>
References: <20250108124316.1107121-1-andrew.cooper3@citrix.com> <Z36KL4Sss_QuUQim@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Jan 2025, Anthony PERARD wrote:
> On Wed, Jan 08, 2025 at 12:43:16PM +0000, Andrew Cooper wrote:
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

