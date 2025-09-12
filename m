Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98616B54077
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 04:37:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121221.1465653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwtew-0001VZ-DY; Fri, 12 Sep 2025 02:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121221.1465653; Fri, 12 Sep 2025 02:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwtew-0001T2-A6; Fri, 12 Sep 2025 02:37:10 +0000
Received: by outflank-mailman (input) for mailman id 1121221;
 Fri, 12 Sep 2025 02:37:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uwteu-0001Ri-QI
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 02:37:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwteu-006Gsu-0U;
 Fri, 12 Sep 2025 02:37:08 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwteu-0054iV-0K;
 Fri, 12 Sep 2025 02:37:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From;
	bh=9W46cm0OnctGte1ilrRzPSK+LoIyzufbhxk4SxDx6G8=; b=1y0YUny45J/V4y+6ADbRHkssZ0
	tw9RUI+V9OPE992NRI1/SwbKTUBTKThTFRExjBqKAy7fEhNnALCYrUuekVRbKD6G55szGLjnz5ZGJ
	ghi79VEfZ/LLI5DcP6ffF633OeZGOpjIVOG92HfkpRIBAwT/Y5CPPWYMh0tTUh1RJ6ps=;
From: dmukhin@xen.org
Date: Thu, 11 Sep 2025 19:37:07 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: Re: [PATCH v3 3/5] CI: Merge categories in
 debian/12-x86_64.dockerfile
Message-ID: <aMOHUzUFRFkxLFyZ@kraken>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
 <20250911231216.1886818-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911231216.1886818-4-andrew.cooper3@citrix.com>

On Fri, Sep 12, 2025 at 12:12:14AM +0100, Andrew Cooper wrote:
> cpio needs to be in Tools (general) now that it's used by the general build
> script.  Merge the rest of the test phase jobs into one group, to avoid being
> overly fine-grain.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Victor Lira <victorm.lira@amd.com>
> 
> Prep for making a Debian Trixie derivative.
> 
> v3:
>  * New
> ---
>  automation/build/debian/12-x86_64.dockerfile | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
> index 3cf99c730b61..4e533ee879fd 100644
> --- a/automation/build/debian/12-x86_64.dockerfile
> +++ b/automation/build/debian/12-x86_64.dockerfile
> @@ -23,6 +23,7 @@ RUN <<EOF
>  
>          # Tools (general)
>          ca-certificates
> +        cpio
>          git-core
>          pkg-config
>          wget
> @@ -52,19 +53,14 @@ RUN <<EOF
>          ocaml-nox
>          ocaml-findlib
>  
> -        # for test phase, qemu-smoke-* jobs
> +        # for test phase, qemu-* jobs
> +        busybox-static
>          expect
> +        ovmf
>          qemu-system-x86
>  
>          # for build-each-commit-gcc
>          ccache
> -
> -        # for qemu-alpine-x86_64-gcc
> -        busybox-static
> -        cpio
> -
> -        # For *-efi jobs
> -        ovmf
>      )
>  
>      apt-get -y --no-install-recommends install "${DEPS[@]}"
> -- 
> 2.39.5
> 
> 

