Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39970704145
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 01:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534887.832347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyhDh-0005B8-DB; Mon, 15 May 2023 23:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534887.832347; Mon, 15 May 2023 23:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyhDh-00059E-9s; Mon, 15 May 2023 23:03:09 +0000
Received: by outflank-mailman (input) for mailman id 534887;
 Mon, 15 May 2023 23:03:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l5iH=BE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pyhDf-000598-GL
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 23:03:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5c39d9b-f374-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 01:03:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF75762379;
 Mon, 15 May 2023 23:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2032C433D2;
 Mon, 15 May 2023 23:03:02 +0000 (UTC)
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
X-Inumbo-ID: a5c39d9b-f374-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684191783;
	bh=FVn1KlANsBOdkLG6bSWMVJ/BL+zPiYygRD/WPFRChJ4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EiWnajuJi2YByKn/dtI8VMzgGHM4sdd8akBbjr99F2JHIlO/DhhWKZZkEH3c1AzRv
	 llA606dTUM9Kuh5boX9CPwTDfeH4ZjMyVHxD7AE+52Urxm96CaTxlwjBogAmLFvuSo
	 3BZ4MDd5fot6aRr0LHls+9EbZ6t/dPZaXdezocGj5Bzce/BznanYxxTZ5tZ286mx1N
	 JRn4t4ZASD1GlVUiOwy+7VA2y6xziJduU+9QApIPhkzp6kkko6wgiJnoT1kXw4aX3g
	 fyRgkA1Dm3yvu6LpX/Kk/8cybWc2oc+1pCpEAMTQXh+IMZpy5sACay5WeGDjKJuxlJ
	 FIPbO8Vp8AZtg==
Date: Mon, 15 May 2023 16:03:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Olaf Hering <olaf@aepfle.de>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: provide example for downloading an existing
 container
In-Reply-To: <20230502201444.6532-1-olaf@aepfle.de>
Message-ID: <alpine.DEB.2.22.394.2305151533320.4125828@ubuntu-linux-20-04-desktop>
References: <20230502201444.6532-1-olaf@aepfle.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 May 2023, Olaf Hering wrote:
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Given that opensuse-tumbleweed is still broken (doesn't complete the Xen
build successfully) even after these patches, I suggest we use a
different example?


> ---
>  automation/build/README.md | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/automation/build/README.md b/automation/build/README.md
> index 2d07cafe0e..8ad89a259a 100644
> --- a/automation/build/README.md
> +++ b/automation/build/README.md
> @@ -12,6 +12,12 @@ can be pulled with Docker from the following path:
>  docker pull registry.gitlab.com/xen-project/xen/DISTRO:VERSION
>  ```
>  
> +This example shows how to pull the existing container for Tumbleweed:
> +
> +```
> +docker pull registry.gitlab.com/xen-project/xen/suse:opensuse-tumbleweed
> +```
> +
>  To see the list of available containers run `make` in this
>  directory. You will have to replace the `/` with a `:` to use
>  them.
> 

