Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2306DFF7C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 22:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520378.807908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmgrT-0001Jz-Om; Wed, 12 Apr 2023 20:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520378.807908; Wed, 12 Apr 2023 20:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmgrT-0001HW-Lm; Wed, 12 Apr 2023 20:14:35 +0000
Received: by outflank-mailman (input) for mailman id 520378;
 Wed, 12 Apr 2023 20:14:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+hK=AD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pmgrS-0001HQ-7v
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 20:14:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a292907b-d96e-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 22:14:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D2B763232;
 Wed, 12 Apr 2023 20:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BA9C433EF;
 Wed, 12 Apr 2023 20:14:29 +0000 (UTC)
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
X-Inumbo-ID: a292907b-d96e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681330470;
	bh=Nuluv8nBOkGlpny4WJ71/qwluqzH+ARqb7rxaDBOxIQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Tg6RQ7lPQa6yC5/X/KzV4OMvhJChlXUxBtjOpEH7+R2nXAzM2be3HC8AfF9OBjJqg
	 nl3pLN26fPrlyX80s8elIMSGSKON9MMigQydFBNh036wqXpGTo+3jfY8uQTVmZpOzL
	 tiduPIwDi5qH6BeP0f32VYwAr54/KLm2QAZrTbE08FTf+I/KSq+/fsqGYk6BqRRrL9
	 1UrhcDWssyQgYjLw3YGw3HttltKmzsSNjjohdeVGtve2Gfuk8fn3UIW16ecEXysPqt
	 3bsdExDzVRhNZPzKI298AAjeqF6XBloTF4iBeDQZ0+M5PygnfYdXYmjun6pQOODLYW
	 BbTetaWnMqlbg==
Date: Wed, 12 Apr 2023 13:14:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <Michal.Orzel@arm.com>
Subject: Re: [PATCH] CI: Update FreeBSD to 13.2
In-Reply-To: <20230412183356.2986459-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2304121314210.15580@ubuntu-linux-20-04-desktop>
References: <20230412183356.2986459-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2103527278-1681330470=:15580"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2103527278-1681330470=:15580
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 12 Apr 2023, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <Michal.Orzel@arm.com>
> 
> Successful run:
>   https://cirrus-ci.com/task/6232358978846720
> ---
>  .cirrus.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index b133afb74057..9bb6cce4ead3 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -23,7 +23,7 @@ task:
>  task:
>    name: 'FreeBSD 13'
>    freebsd_instance:
> -    image_family: freebsd-13-1
> +    image_family: freebsd-13-2
>    << : *FREEBSD_TEMPLATE
>  
>  task:
> -- 
> 2.30.2
> 
--8323329-2103527278-1681330470=:15580--

