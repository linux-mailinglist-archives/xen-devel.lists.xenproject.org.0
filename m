Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B71A7851E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 01:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934942.1336487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzkij-0005CI-H8; Tue, 01 Apr 2025 23:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934942.1336487; Tue, 01 Apr 2025 23:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzkij-00059g-EE; Tue, 01 Apr 2025 23:08:37 +0000
Received: by outflank-mailman (input) for mailman id 934942;
 Tue, 01 Apr 2025 23:08:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4cc=WT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tzkii-00059a-4J
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 23:08:36 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b85154b-0f4e-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 01:08:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 864C261126;
 Tue,  1 Apr 2025 23:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60808C4CEE8;
 Tue,  1 Apr 2025 23:08:31 +0000 (UTC)
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
X-Inumbo-ID: 3b85154b-0f4e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743548911;
	bh=O0DqrMi9IZgLWlhMTuVoVpTy+cO5VFLimM8+bVoSttc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PYD4jZaDt5gNCIoCaDRpTqwCGtzoclfH3/trtwSzLQZADUsKDrENGVSrUua2TMJz/
	 achF67uVWDFmZU9PLIeZK+kT2yEbtQi27llQO8BkgqnS04RydKoH4TcgVYpvt5ucA5
	 X61p4IlTc8UNHeHU5zd7c0XnC4BasNAavL/8PcglTUld6Fl/LMkTPXfPWTB/0gr+uR
	 0yrDHhaVGOsC81H9Yv1e4020c9XjdtguAH8GlCG6Lx+nVzlWtzgGcvIKyGtD9Ac7ea
	 4OKEgwbxQFvxZjkCuGslm2hgXXAB016fzGnxDaznlaooDHi10hRBEb1MLVvu3IwU7C
	 a74bSrs6K1iyQ==
Date: Tue, 1 Apr 2025 16:08:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 01/11] automation/dockers: add to README how to rebuild
 all containers
In-Reply-To: <20250401130840.72119-2-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2504011608030.3098208@ubuntu-linux-20-04-desktop>
References: <20250401130840.72119-1-roger.pau@citrix.com> <20250401130840.72119-2-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1052309063-1743548911=:3098208"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1052309063-1743548911=:3098208
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 1 Apr 2025, Roger Pau Monne wrote:
> Document in the README how to rebuild all containers.  This is helpful when
> populating a local docker registry for testing purposes.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/build/README.md | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/automation/build/README.md b/automation/build/README.md
> index ecc898680c91..6c647b1b2a68 100644
> --- a/automation/build/README.md
> +++ b/automation/build/README.md
> @@ -108,6 +108,13 @@ env CONTAINER_NO_PULL=1 \
>  make -C automation/build opensuse/tumbleweed-x86_64 PUSH=1
>  ```
>  
> +To rebuild all containers the `all` make target can be used, with or without
> +the `PUSH` environment variable:
> +
> +```
> +make -C automation/build all PUSH=1
> +```
> +
>  [BuildKit]: https://docs.docker.com/build/buildkit/
>  [registry]: https://gitlab.com/xen-project/xen/container_registry
>  [registry help]: https://docs.gitlab.com/ee/user/packages/container_registry/
> -- 
> 2.48.1
> 
--8323329-1052309063-1743548911=:3098208--

