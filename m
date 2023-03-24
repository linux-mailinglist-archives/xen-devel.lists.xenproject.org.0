Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B040E6C873A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 22:05:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514451.796692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfoar-0004Cx-Om; Fri, 24 Mar 2023 21:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514451.796692; Fri, 24 Mar 2023 21:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfoar-00049s-LE; Fri, 24 Mar 2023 21:05:01 +0000
Received: by outflank-mailman (input) for mailman id 514451;
 Fri, 24 Mar 2023 21:05:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WRj=7Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pfoaq-00049m-AZ
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 21:05:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8891f680-ca87-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 22:04:59 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B9A162CAD;
 Fri, 24 Mar 2023 21:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20539C4339B;
 Fri, 24 Mar 2023 21:04:55 +0000 (UTC)
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
X-Inumbo-ID: 8891f680-ca87-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679691897;
	bh=afzTv3TkWPe+7R0O7/i7NDO9pC4jgi+CtKCjc+lB4JY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=u/sEfWEH+lFIWLcfqhOeMbvjHVP0CWWluIG+LoDuwPUx7yL46KixH7XQHFJOiehKh
	 ZEMzQDtNrwdiaJgmi5tfWaJzVci9KwlBmiJTJdtF8WYFmXqaItMUUtrwSAv9C52ugM
	 7e33UI2X58s0KD4O5sNHACb1QUM6rZKM4Ur2q1ZqfCwB5KBmcdwKYAyAVlybmwITwj
	 /HbudLVs2/0r+cmhad6f0KdUF8/xS6ajFYDRVqTHyNGt1if2HreKDzmAWY/ePn34Ax
	 4GZX8nRPDLyRjIHWcqdNgekk7P09voA4YEXeod1kQ+zr75bZnKvTHEevGiIeOuhhOp
	 WFVFq5gUWjJsA==
Date: Fri, 24 Mar 2023 14:04:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] CI: Minor updates to buster-gcc-ibt
In-Reply-To: <20230324200658.3245418-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2303241404320.4066@ubuntu-linux-20-04-desktop>
References: <20230324200658.3245418-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Mar 2023, Andrew Cooper wrote:
>  * Update from GCC 11.2 to 11.3
>  * Use python3-minimal instead of python
>  * Use --no-install-recommends, requiring ca-certificates, g++-multilib and
>    build-essential to be listed explicitly
> 
> The resulting container is ~50M smaller
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I assume you have tested this successfully.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> ---
>  automation/build/debian/buster-gcc-ibt.dockerfile | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/automation/build/debian/buster-gcc-ibt.dockerfile b/automation/build/debian/buster-gcc-ibt.dockerfile
> index 441d9a9ab37a..96ab4fe8a2f1 100644
> --- a/automation/build/debian/buster-gcc-ibt.dockerfile
> +++ b/automation/build/debian/buster-gcc-ibt.dockerfile
> @@ -4,10 +4,12 @@ ENV DEBIAN_FRONTEND=noninteractive
>  ENV USER root
>  
>  RUN apt-get update && \
> -    apt-get --quiet --yes install \
> +    apt-get --quiet --yes --no-install-recommends install \
>          bison \
>          build-essential \
> +        ca-certificates \
>          flex \
> +        g++-multilib \
>          libc6-dev-i386 \
>          libgmp-dev \
>          libisl-dev \
> @@ -19,7 +21,7 @@ RUN apt-get update && \
>  RUN mkdir /build
>  WORKDIR /build
>  
> -RUN wget -q https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz -O - | tar xJ --strip=1
> +RUN wget -q https://ftp.gnu.org/gnu/gcc/gcc-11.3.0/gcc-11.3.0.tar.xz -O - | tar xJ --strip=1
>  RUN wget -q https://xenbits.xen.org/people/andrewcoop/gcc-11.2-Add-fcf-check-attribute-yes-no.patch -O - | patch -p1
>  RUN ./configure \
>          --prefix=/opt/gcc-11-ibt \
> @@ -53,13 +55,14 @@ RUN mkdir /build
>  WORKDIR /build
>  
>  RUN apt-get update && \
> -    apt-get --quiet --yes install \
> +    apt-get --quiet --yes --no-install-recommends install \
>          bison \
> +        build-essential \
>          checkpolicy \
>          flex \
>          gawk \
>          make \
> -        python3 \
> +        python3-minimal \
>          && \
>          apt-get autoremove -y && \
>          apt-get clean && \
> -- 
> 2.30.2
> 

