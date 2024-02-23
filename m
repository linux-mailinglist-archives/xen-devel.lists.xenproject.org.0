Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54085862096
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 00:23:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684990.1065321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdesR-00013u-6I; Fri, 23 Feb 2024 23:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684990.1065321; Fri, 23 Feb 2024 23:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdesR-00012M-27; Fri, 23 Feb 2024 23:22:47 +0000
Received: by outflank-mailman (input) for mailman id 684990;
 Fri, 23 Feb 2024 23:22:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdesP-00012G-Lh
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 23:22:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71040861-d2a2-11ee-98f5-efadbce2ee36;
 Sat, 24 Feb 2024 00:22:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 34596CE2F27;
 Fri, 23 Feb 2024 23:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B08C433C7;
 Fri, 23 Feb 2024 23:22:39 +0000 (UTC)
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
X-Inumbo-ID: 71040861-d2a2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708730560;
	bh=YE1QDpgyw5X4rwqnczvC39zy2K4+xIdimH9zq6pXTc8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VMfQQsqr9XgiRWnIcMdNPvJzmO102BqmCgG+JW7FybR7nzb/Hz55Z8mED5idfNKvJ
	 aXbDVHC+1J1T3iWVgMiVm6Xb8JeM3ckNf3x4KK70sK23JMPjOFEmfj2ivTIEAeX09K
	 mQkUn63wwPx81/92C5Mv9yaR9Hb6uaNJADvGAMT8GvXjakwE+tDpryIpDO3CCZBcxm
	 CYgfwKHn2D1G3NfxTUZec0b/ehRXkEJtl6Aff9rEutsfQPv5tHA9CbEw2IEp0YPl8C
	 QRrmGcp5mpp5KgtqsXEP7PNvQDXPM4GyEIWinhHJ1LarzkhGWnoE+E0oiaU7+DBbvD
	 ho9RtFCoNhbPw==
Date: Fri, 23 Feb 2024 15:22:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Olaf Hering <olaf@aepfle.de>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: remove bin86/dev86 from tumbleweed
 image
In-Reply-To: <20231213202515.30587-1-olaf@aepfle.de>
Message-ID: <alpine.DEB.2.22.394.2402231522020.754277@ubuntu-linux-20-04-desktop>
References: <20231213202515.30587-1-olaf@aepfle.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Dec 2023, Olaf Hering wrote:
> https://build.opensuse.org/request/show/1126240
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Hi Olaf,

Do you have a successful gitlab pipeline with this patch applied that
you can give me as proof of testing and success?


> ---
>  automation/build/suse/opensuse-tumbleweed.dockerfile | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
> index 38f6fda2ff..f00e03eda7 100644
> --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> @@ -11,13 +11,11 @@ RUN zypper ref && zypper dup -y --no-recommends
>  RUN zypper install -y --no-recommends \
>          acpica \
>          bc \
> -        bin86 \
>          bison \
>          bzip2 \
>          checkpolicy \
>          clang \
>          cmake \
> -        dev86 \
>          diffutils \
>          discount \
>          flex \
> 

