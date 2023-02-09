Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99CB691289
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 22:17:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492929.762702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQEH6-0005Gd-A9; Thu, 09 Feb 2023 21:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492929.762702; Thu, 09 Feb 2023 21:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQEH6-0005EH-70; Thu, 09 Feb 2023 21:16:12 +0000
Received: by outflank-mailman (input) for mailman id 492929;
 Thu, 09 Feb 2023 21:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HO9m=6F=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pQEH4-0005E7-SX
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 21:16:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6455f47-a8be-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 22:16:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CB8E61BBE;
 Thu,  9 Feb 2023 21:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4643FC433D2;
 Thu,  9 Feb 2023 21:16:02 +0000 (UTC)
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
X-Inumbo-ID: f6455f47-a8be-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675977363;
	bh=tdg3Xf6UaRzZYsb0hyMnspMERa1wzVeI/TLAqHpLSyc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pROLccJ9n8N9OlrR+drGROH+VB2DyyQZO2ra8VE1P5wXiLjvIRASFrHGqyYjVJwfj
	 ttWox9dJ/LjKqGO+y4kTzSpNBoUx1NCP+nGsPT4G1QpY/WCQJBH5sGae1FbfrSf6TK
	 2QXiztYB1/HsDlTl0znC9Ek5BK6YnlbzPZjkxCDYq20WNVwDfUHeDJsISt3gvMiKFz
	 QRAXAAfuye9mIeFVDqeEKnCpIdD0RqlnbUvqRizN9ArTQp66kEmapjmTjP81vlRL+g
	 MSnPahc9lz8Zonsm+8+X5EWbGRDfBXb/D2C8WbdMRzc+1AqFG1kjzqVxV2505Cbq+3
	 W4MDSTKeRK6mQ==
Date: Thu, 9 Feb 2023 13:16:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, julien@xen.org, 
    sstabellini@kernel.org, wl@xen.org
Subject: Re: [PATCH v4 1/2 RESEND] xen/public: fix 9pfs Xenstore entry
 documentation
In-Reply-To: <20230209112338.26287-2-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2302091315550.4661@ubuntu-linux-20-04-desktop>
References: <20230209112338.26287-1-jgross@suse.com> <20230209112338.26287-2-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Feb 2023, Juergen Gross wrote:
> In xen/include/public/io/9pfs.h the documentation regarding the
> Xenstore entries isn't reflecting reality: the "tag" Xenstore entry
> is on the frontend side, not on the backend one.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> V4:
> - patch split off (Julien Grall)
> ---
>  xen/include/public/io/9pfs.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/include/public/io/9pfs.h b/xen/include/public/io/9pfs.h
> index 5dad0db869..617ad9afd7 100644
> --- a/xen/include/public/io/9pfs.h
> +++ b/xen/include/public/io/9pfs.h
> @@ -64,12 +64,6 @@
>   *
>   *         Host filesystem path to share.
>   *
> - *    tag
> - *         Values:         <string>
> - *
> - *         Alphanumeric tag that identifies the 9pfs share. The client needs
> - *         to know the tag to be able to mount it.
> - *
>   *    security-model
>   *         Values:         "none"
>   *
> @@ -106,6 +100,12 @@
>   *         map a page with information to setup a share ring. One for each
>   *         ring.
>   *
> + *    tag
> + *         Values:         <string>
> + *
> + *         Alphanumeric tag that identifies the 9pfs share. The client needs
> + *         to know the tag to be able to mount it.
> + *
>   ******************************************************************************
>   *                              State Machine
>   ******************************************************************************
> -- 
> 2.35.3
> 

