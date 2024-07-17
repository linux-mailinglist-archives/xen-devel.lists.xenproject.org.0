Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3794F933EB7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 16:39:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759998.1169711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU5nY-0000av-S2; Wed, 17 Jul 2024 14:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759998.1169711; Wed, 17 Jul 2024 14:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU5nY-0000Yu-PZ; Wed, 17 Jul 2024 14:38:28 +0000
Received: by outflank-mailman (input) for mailman id 759998;
 Wed, 17 Jul 2024 14:38:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXng=OR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sU5nX-0000Yo-BM
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 14:38:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 390d13e2-444a-11ef-bbfd-fd08da9f4363;
 Wed, 17 Jul 2024 16:38:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22672613F1;
 Wed, 17 Jul 2024 14:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C25C2BD10;
 Wed, 17 Jul 2024 14:38:22 +0000 (UTC)
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
X-Inumbo-ID: 390d13e2-444a-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721227103;
	bh=Y6fSfjD+oJ5cBIvz8rr+h4WuI796IQTx3xbuwh7cAX0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LIvEaQPa66yfclldGRbQpBIBZ9LKVOiLc7c4c0CAmq/Bv+GpVgQ5rv7dPCXmZHd1M
	 0YMgG4rI8HdUN+bJ+XhZHzffybYVLp6I/qolaHRqTfN2CiqjymFk9PNe5kuJU5uQUj
	 AEBi+0WTTvIa40XtxcHOxFJZwQ+ue012DZRt+I11PzRqYcApeCkIqCm8Je+JIV1yJA
	 rAzrlPky96qodQwE4aC6AUOUfGnl3KVtKBHpzPC8meOcqOdz6J6ul9KW72mJahEJ4t
	 r2yCC25SbJnQQJeXM5jznooLXjCvE1V3GkmYe2DjOgM5wjmEif4VWxuANRgM4cdwxM
	 Zl97w90b4Vedg==
Date: Wed, 17 Jul 2024 07:38:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Olaf Hering <olaf@aepfle.de>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: adjust paths to docker files in
 documentation
In-Reply-To: <20240717101239.21051-1-olaf@aepfle.de>
Message-ID: <alpine.DEB.2.22.394.2407170738150.3635@ubuntu-linux-20-04-desktop>
References: <20240717101239.21051-1-olaf@aepfle.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Jul 2024, Olaf Hering wrote:
> Use new location of dockerfiles.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/build/README.md | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/build/README.md b/automation/build/README.md
> index 12a2b4af18..bd0c0e0418 100644
> --- a/automation/build/README.md
> +++ b/automation/build/README.md
> @@ -100,12 +100,12 @@ such as openSUSE Tumbleweed. Login with the gitlab.com credentials.
>  
>  ```
>  docker login registry.gitlab.com/xen-project/xen
> -make -C automation/build suse/opensuse-tumbleweed
> +make -C automation/build opensuse/tumbleweed-x86_64
>  env CONTAINER_NO_PULL=1 \
>    CONTAINER=tumbleweed \
>    CONTAINER_ARGS='-e CC=gcc -e CXX=g++ -e debug=y' \
>    automation/scripts/containerize automation/scripts/build < /dev/null
> -make -C automation/build suse/opensuse-tumbleweed PUSH=1
> +make -C automation/build opensuse/tumbleweed-x86_64 PUSH=1
>  ```
>  
>  [BuildKit]: https://docs.docker.com/build/buildkit/
> 

