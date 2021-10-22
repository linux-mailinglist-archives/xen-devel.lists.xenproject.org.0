Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D97D437B39
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 18:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215219.374271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxrT-0007Ht-Cw; Fri, 22 Oct 2021 16:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215219.374271; Fri, 22 Oct 2021 16:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxrT-0007Fo-9o; Fri, 22 Oct 2021 16:57:43 +0000
Received: by outflank-mailman (input) for mailman id 215219;
 Fri, 22 Oct 2021 16:57:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TWKL=PK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mdxrS-0007Fi-GG
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:57:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b209892-3359-11ec-83cb-12813bfff9fa;
 Fri, 22 Oct 2021 16:57:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BB42611BD;
 Fri, 22 Oct 2021 16:57:40 +0000 (UTC)
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
X-Inumbo-ID: 2b209892-3359-11ec-83cb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634921860;
	bh=1a0ELAvtHtixYsdtjamTsgX3oCvwUqbGOt+TmP0/jOs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mWAZRzlTE9Crlyv+pp8FNvdLwVZoMmSG95+6G9GtRYuwqRw9OEw1XTrUJYjuZlZZT
	 hLkGiEuokyDmG8/lQRoIwmKEz/tPZVmjxMA1TajmOFZRllCb7hL2Kynj1qdZbcYFWG
	 EVRIFufcHVITnM1L5QAQaTmr1OuW60s3GdlQ7kiDNBTpcyH2UD8ydGZQjV1GvlCea/
	 EC9oHdN1Ed/WUO3npFKNk7pA8H8DMdApx4tXUNiA8++2fvnzOyGtcks8YVC0NOHhgc
	 90lGThErLVhyqJFOBCHPJfcCObhxz/0zC5dvodN4+jrkXQOfVaS5eUCAIY+BS5icQJ
	 ts9KlzR+1PI+A==
Date: Fri, 22 Oct 2021 09:57:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>
cc: xen-devel@lists.xenproject.org, wl@xen.org, iwj@xenproject.org, 
    sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation: actually build with clang for
 ubuntu-focal-clang* jobs
In-Reply-To: <20211022163644.547018-1-anthony.perard@citrix.com>
Message-ID: <alpine.DEB.2.21.2110220957220.2311@sstabellini-ThinkPad-T480s>
References: <20211022163644.547018-1-anthony.perard@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Oct 2021, Anthony PERARD wrote:
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/build.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index d177da1710d7..08a43146aba8 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -429,12 +429,12 @@ ubuntu-focal-gcc-debug:
>      CONTAINER: ubuntu:focal
>  
>  ubuntu-focal-clang:
> -  extends: .gcc-x86-64-build
> +  extends: .clang-x86-64-build
>    variables:
>      CONTAINER: ubuntu:focal
>  
>  ubuntu-focal-clang-debug:
> -  extends: .gcc-x86-64-build-debug
> +  extends: .clang-x86-64-build-debug
>    variables:
>      CONTAINER: ubuntu:focal
>  
> -- 
> Anthony PERARD
> 

