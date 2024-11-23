Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7429D66A4
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 01:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842068.1257516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEdny-00077G-UR; Sat, 23 Nov 2024 00:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842068.1257516; Sat, 23 Nov 2024 00:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEdny-00074q-Qs; Sat, 23 Nov 2024 00:15:18 +0000
Received: by outflank-mailman (input) for mailman id 842068;
 Sat, 23 Nov 2024 00:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tEdny-00074X-5I
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 00:15:18 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0348455d-a930-11ef-a0cc-8be0dac302b0;
 Sat, 23 Nov 2024 01:15:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 83C85A417BD;
 Sat, 23 Nov 2024 00:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA1EC4CECE;
 Sat, 23 Nov 2024 00:15:13 +0000 (UTC)
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
X-Inumbo-ID: 0348455d-a930-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjAzNDg0NTVkLWE5MzAtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzIwOTE1LjkyODk2LCJzZW5kZXIiOiJzc3RhYmVsbGluaUBrZXJuZWwub3JnIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732320914;
	bh=YlHkbIybHaKke3z7OEd0iJd4bQeYwuyD02PPiOGWLs4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sVGMWeJm9w8AJKJbbU8mQFdqfnfin7Bc1PzvYMV31kR68ykKUXZvea+9SisQMIdvD
	 fD7DEDvHkKN+JgM+LlabPuVbjrbeBT/AHy/NFAGysyRwt2tnF6rLtVB/GUkmegth4n
	 HRP/KxOjDWT3dOboZOLwAyYi5gOreIw1OWKaV/IEzVg/eQ/IXE0ikccrFUjmizNoJv
	 nQv5uI9zYq8vGJqal8ci3MecgmGcdNuWB33F9AQkGn9kV98lG6WYTHfw8Q9hvtg7Eg
	 ieYniguknSsul0HwGMKcloIMvUgXZE5OGKEpzy/FMrhtqhPK4j8g7d6XwFnaKKSyHU
	 ftNxWAtmEt3Cw==
Date: Fri, 22 Nov 2024 16:15:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    ayankuma@amd.com
Subject: Re: [PATCH] docs/sphinx: Fix FUSA indexing
In-Reply-To: <20241122164908.3240056-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2411221614530.11605@ubuntu-linux-20-04-desktop>
References: <20241122164908.3240056-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Ayan

On Fri, 22 Nov 2024, Andrew Cooper wrote:
> Sphinx complains:
> 
>   docs/fusa/index.rst:6: WARNING: toctree contains reference to nonexisting document 'fusa/reqs'
>   docs/fusa/reqs/index.rst:6: WARNING: toctree contains reference to nonexisting document 'fusa/reqs/market-reqs'
>   docs/fusa/reqs/index.rst:6: WARNING: toctree contains reference to nonexisting document 'fusa/reqs/product-reqs'
>   docs/fusa/reqs/index.rst:6: WARNING: toctree contains reference to nonexisting document 'fusa/reqs/design-reqs/arm64'
> 
>   docs/fusa/index.rst: WARNING: document isn't included in any toctree
>   docs/fusa/reqs/design-reqs/arm64/generic-timer.rst: WARNING: document isn't included in any toctree
>   docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst: WARNING: document isn't included in any toctree
>   docs/fusa/reqs/index.rst: WARNING: document isn't included in any toctree
>   docs/fusa/reqs/market-reqs/reqs.rst: WARNING: document isn't included in any toctree
>   docs/fusa/reqs/product-reqs/arm64/reqs.rst: WARNING: document isn't included in any toctree
> 
> Fix the toctrees.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> 
> I'm also going to prioritise getting a docs test in Gitlab CI.
> ---
>  docs/fusa/index.rst      | 2 +-
>  docs/fusa/reqs/index.rst | 7 ++++---
>  docs/index.rst           | 1 +
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/fusa/index.rst b/docs/fusa/index.rst
> index 13bf4e8e23f1..5f1e8acfc429 100644
> --- a/docs/fusa/index.rst
> +++ b/docs/fusa/index.rst
> @@ -6,4 +6,4 @@ Functional Safety documentation
>  .. toctree::
>     :maxdepth: 2
>  
> -   reqs
> +   reqs/index
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index 183f183b1f8c..8a4dae6fb249 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -7,6 +7,7 @@ Requirements documentation
>     :maxdepth: 2
>  
>     intro
> -   market-reqs
> -   product-reqs
> -   design-reqs/arm64
> +   market-reqs/reqs
> +   product-reqs/arm64/reqs
> +   design-reqs/arm64/generic-timer
> +   design-reqs/arm64/sbsa-uart
> diff --git a/docs/index.rst b/docs/index.rst
> index ab051a0f3833..1d44796d7296 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -65,6 +65,7 @@ Documents in need of some rearranging.
>     designs/launch/hyperlaunch-devicetree
>     misc/xen-makefiles/makefiles
>     misra/index
> +   fusa/index
>  
>  
>  Miscellanea
> 
> base-commit: c0bf8816c9e2a4701c925d8b23abfda5990a0087
> prerequisite-patch-id: c6d7da051cd408c9f38d32ecdd24807bfbe619d1
> -- 
> 2.39.5
> 

