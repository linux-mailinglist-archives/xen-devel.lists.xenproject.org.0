Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D38A662DD
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 00:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918214.1322942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKBn-0004Vy-8B; Mon, 17 Mar 2025 23:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918214.1322942; Mon, 17 Mar 2025 23:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKBn-0004T1-4O; Mon, 17 Mar 2025 23:48:11 +0000
Received: by outflank-mailman (input) for mailman id 918214;
 Mon, 17 Mar 2025 23:48:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyhG=WE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tuKBm-0004Sv-Ak
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 23:48:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46f686fd-038a-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 00:48:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6165E5C541B;
 Mon, 17 Mar 2025 23:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BB2C4CEE9;
 Mon, 17 Mar 2025 23:48:06 +0000 (UTC)
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
X-Inumbo-ID: 46f686fd-038a-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742255286;
	bh=AnAiZgZLe56Nq16Fy9NIrz0FywGDUya3kfUpP1Z+XrQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t1AipvxdX3wkuXWa5nBuLg+NumzBuQ2LzjvAu9yF6YAkfo6KLaV7fASY/gyQsnlr0
	 J0OK27ZQBPNLr/l2J/A6H3ktitZcYZFLiK17+BGpoNxfqhsirKRDpKqtTCZIp0gZFy
	 Sh/Us7Iqef72LaUGG7Y9pXm6sEfAXOAhIuhGD3elZpnRb6g6ysS+tL8ODldYPEk7LE
	 r0/t4sSDBBLlqGO8CCDXKFwIdIVMPHxx8T7+DzCTgfAC+uBkZartuMQNj+7jF+tOn5
	 jvQTtkyJ4/R5PBQEdFuTrgnv53N8YiCiY9I49DJw04Yw5wBqpu4SxnfZxkSb4RTo5Y
	 l1OVjUcVImu4Q==
Date: Mon, 17 Mar 2025 16:48:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 7/8] automation/console.exp: do not assume expect is
 always at /usr/bin/
In-Reply-To: <20250317121616.40687-8-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503171647450.3477110@ubuntu-linux-20-04-desktop>
References: <20250317121616.40687-1-roger.pau@citrix.com> <20250317121616.40687-8-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-660235268-1742255287=:3477110"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-660235268-1742255287=:3477110
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 17 Mar 2025, Roger Pau Monne wrote:
> Instead use env to find the location of expect.
> 
> Additionally do not use the -f flag, as it's only meaningful when passing
> arguments on the command line, which we never do for console.exp.  From the
> expect 5.45.4 man page:
> 
> > The -f flag prefaces a file from which to read commands from.  The flag
> > itself is optional as it is only useful when using the #! notation (see
> > above), so  that other arguments may be supplied on the command line.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Do you have a link to a successful Gitlab and Cirrus CI?

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/scripts/console.exp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
> index 310543c33e5e..31ce97b91b63 100755
> --- a/automation/scripts/console.exp
> +++ b/automation/scripts/console.exp
> @@ -1,4 +1,4 @@
> -#!/usr/bin/expect -f
> +#!/usr/bin/env expect
>  
>  if {[info exists env(TEST_TIMEOUT_OVERRIDE)]} {
>      set timeout $env(TEST_TIMEOUT_OVERRIDE)
> -- 
> 2.48.1
> 
--8323329-660235268-1742255287=:3477110--

