Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0527469128C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 22:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492936.762713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQEJ8-00060L-M1; Thu, 09 Feb 2023 21:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492936.762713; Thu, 09 Feb 2023 21:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQEJ8-0005yQ-J0; Thu, 09 Feb 2023 21:18:18 +0000
Received: by outflank-mailman (input) for mailman id 492936;
 Thu, 09 Feb 2023 21:18:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HO9m=6F=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pQEJ7-0005yK-Ch
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 21:18:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43a39313-a8bf-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 22:18:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 36FF261B9A;
 Thu,  9 Feb 2023 21:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4DFC433D2;
 Thu,  9 Feb 2023 21:18:12 +0000 (UTC)
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
X-Inumbo-ID: 43a39313-a8bf-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675977493;
	bh=TwrkKixYUqMGSHQPsVFoLPt/9m66xB78HwuINd6WUfI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mpZjpjgwArJcU3nB8W+YxNaWJkrrnYb8fC0uOBjUOY5b3ij4BGJLKTeyG66u1rN1b
	 Obi4a5ty06j1cs+jqVUj1KgXdXcCj8FFjhRX8rukTt0UZyuN/xZmUjJ3wk4XbC6neZ
	 I3qC3Ih29JfRYN31XDJIIZmCDpzBTA+8vkgiw1tr1FArObQVyLMXpYhrJhxIU57sg3
	 La7Yfa50YiqMWS1qqsU149jKPmISmhE6PgamDaM4ysKMIofMiDtVzseZppiOi840BX
	 l6ald6KXkY/oYYbR66+9oKC2FtQQ1+pdoaNskdCwBlecNeIDdH3c5lSfh20nmTAHkF
	 fxXwp8EbBHDtw==
Date: Thu, 9 Feb 2023 13:18:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, julien@xen.org, 
    sstabellini@kernel.org, wl@xen.org
Subject: Re: [PATCH v4 2/2 RESEND] xen/public: fix 9pfs documentation of
 connection sequence
In-Reply-To: <20230209112338.26287-3-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2302091318040.4661@ubuntu-linux-20-04-desktop>
References: <20230209112338.26287-1-jgross@suse.com> <20230209112338.26287-3-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Feb 2023, Juergen Gross wrote:
> The documented connection sequence in xen/include/public/io/9pfs.h has
> a bug: the frontend needs to wait for the backend to have published its
> features before being able to allocate its rings and event-channels.
> 
> While correcting that, make it clear that there might be multiple
> rings and event-channels by adding "(s)".
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> V4:
> - patch split off (Julien Grall)
> ---
>  xen/include/public/io/9pfs.h | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/include/public/io/9pfs.h b/xen/include/public/io/9pfs.h
> index 617ad9afd7..a0ce82d0a8 100644
> --- a/xen/include/public/io/9pfs.h
> +++ b/xen/include/public/io/9pfs.h
> @@ -114,14 +114,26 @@
>   *
>   *    *Front*                               *Back*
>   *    XenbusStateInitialising               XenbusStateInitialising
> - *    - Query virtual device                - Query backend device
> - *      properties.                           identification data.
> - *    - Setup OS device instance.           - Publish backend features
> - *    - Allocate and initialize the           and transport parameters
> - *      request ring.                                      |
> - *    - Publish transport parameters                       |
> - *      that will be in effect during                      V
> - *      this connection.                            XenbusStateInitWait
> + *                                          - Query backend device
> + *                                            identification data.
> + *                                          - Publish backend features
> + *                                            and transport parameters.
> + *                                                         |
> + *                                                         |
> + *                                                         V
> + *                                                  XenbusStateInitWait
> + *
> + *    - Query virtual device
> + *      properties.
> + *    - Query backend features and
> + *      transport parameters.
> + *    - Setup OS device instance.
> + *    - Allocate and initialize the
> + *      request ring(s) and
> + *      event-channel(s).
> + *    - Publish transport parameters
> + *      that will be in effect during
> + *      this connection.
>   *                 |
>   *                 |
>   *                 V
> @@ -129,8 +141,8 @@
>   *
>   *                                          - Query frontend transport
>   *                                            parameters.
> - *                                          - Connect to the request ring and
> - *                                            event channel.
> + *                                          - Connect to the request ring(s)
> + *                                            and event channel(s).
>   *                                                         |
>   *                                                         |
>   *                                                         V
> -- 
> 2.35.3
> 

