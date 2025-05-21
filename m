Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A828ABFE8D
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 22:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992578.1376252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqTY-0004My-PQ; Wed, 21 May 2025 20:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992578.1376252; Wed, 21 May 2025 20:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqTY-0004L3-Mi; Wed, 21 May 2025 20:55:44 +0000
Received: by outflank-mailman (input) for mailman id 992578;
 Wed, 21 May 2025 20:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MrLC=YF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uHqTX-0004Kw-OM
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 20:55:43 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f52f8afc-3685-11f0-a2fb-13f23c93f187;
 Wed, 21 May 2025 22:55:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 69ADAA4AC2A;
 Wed, 21 May 2025 20:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B08C4CEE4;
 Wed, 21 May 2025 20:55:39 +0000 (UTC)
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
X-Inumbo-ID: f52f8afc-3685-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747860941;
	bh=Xnu30nzPoHCTYquH9DLumd1xjLmwbvMzDFpyXfNQjL0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y7atkHtF5SgcW0OLwPM9wvJ91uMrOB1wXjCfBXe0YaZEmc7+iynexxnA8OPhXNLSu
	 qQvC+n89fXJ/9q9qXBPxcm9P5AeG92OoEEzN3wlro35+pivImwJleiWJThRr7/gSJB
	 mhUckIWL/iLUD4AUzKrmzZAubJzBg6dVWNV0/2KQBMzzF8CyprorpjnxpukrgPhhCM
	 TI2lcvw3pdBsiDXxMpzGzjPISebXP0xawF5OnW2a7o/raHfJMTs8f0zvPh8Lsb1dlY
	 iHOjhG0MftVYj+KohfzVvJmV20fHn+HFQZHyg6sKB9Jvry42xtWXuYseeClK/IKDpp
	 k1TMSgx2xBxbA==
Date: Wed, 21 May 2025 13:55:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christopher Clark <christopher.w.clark@gmail.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Daniel Smith <dpsmith@apertussolutions.com>, 
    Rich Persaud <persaur@gmail.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] MAINTAINERS: add a reviewer for Argo
In-Reply-To: <20250521102333.870789-1-christopher.w.clark@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505211355280.147219@ubuntu-linux-20-04-desktop>
References: <20250521102333.870789-1-christopher.w.clark@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 May 2025, Christopher Clark wrote:
> Adding Daniel P. Smith as a reviewer.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> since v1: add to R: role
> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c11b82eca9..517143075d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -222,6 +222,7 @@ F:	tools/libacpi/
>  
>  ARGO
>  M:	Christopher Clark <christopher.w.clark@gmail.com>
> +R:	Daniel P. Smith <dpsmith@apertussolutions.com>
>  S:	Maintained
>  F:	xen/include/public/argo.h
>  F:	xen/include/xen/argo.h
> -- 
> 2.25.1
> 

