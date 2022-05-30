Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 695DD538734
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 20:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338723.563533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvk0V-00086l-Nd; Mon, 30 May 2022 18:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338723.563533; Mon, 30 May 2022 18:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvk0V-00083M-Jr; Mon, 30 May 2022 18:20:47 +0000
Received: by outflank-mailman (input) for mailman id 338723;
 Mon, 30 May 2022 18:20:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWjq=WG=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1nvk0T-00083G-V0
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 18:20:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37946ee6-e045-11ec-bd2c-47488cf2e6aa;
 Mon, 30 May 2022 20:20:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A689A60A54;
 Mon, 30 May 2022 18:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69F6C385B8;
 Mon, 30 May 2022 18:20:41 +0000 (UTC)
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
X-Inumbo-ID: 37946ee6-e045-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653934842;
	bh=Hc3v6vdkkxDNH9P1ieO6s1ciu8KhYr8gtAxQLKPMimw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XT441zRAvC/1owmtuGoqO6WhidhsFdKIOSl/NUSDeR9Nnwo49A/AFx2yXKeqSGZaZ
	 l+OHT58o+mv4nGNzIgfCXXPUDXpQi5nWCl8ORKVgG3Pml0Y9dPchWBVw4lFe5ERz7A
	 WKuNyDgyjVQo8HknhY9xUZxW+T0MkpnntiW7EO4OO0+jA7Dx7Ey1YELb40My5wJUrI
	 lxfAupAdGJJUk2Geqs+64zElJAnh9LDEnZrUZ6FAAZw5Dw40aoVVZIQG/GOCZgf0YG
	 l0mBY/aArdY6hkH5JoG/jyFti9BV/c674o3qycEgOYv+/kyFhDzx8Y9m5RlpVbt7rf
	 mDqnU/2szUyng==
Date: Mon, 30 May 2022 11:20:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>, Paul Durrant
 <paul@xen.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH] xen/netback: do some code cleanup
Message-ID: <20220530112040.43871e04@kernel.org>
In-Reply-To: <20220530114103.20657-1-jgross@suse.com>
References: <20220530114103.20657-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 30 May 2022 13:41:03 +0200 Juergen Gross wrote:
> Remove some unused macros and functions, make local functions static.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

# Form letter - net-next is closed

We have already sent the networking pull request for 5.19
and therefore net-next is closed for new drivers, features,
code refactoring and optimizations. We are currently accepting
bug fixes only.

Please repost when net-next reopens after 5.19-rc1 is cut.

RFC patches sent for review only are obviously welcome at any time.

