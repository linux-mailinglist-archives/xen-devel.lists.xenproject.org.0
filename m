Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8837A56AED2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 01:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363173.593602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9aZO-0004Xp-7M; Thu, 07 Jul 2022 23:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363173.593602; Thu, 07 Jul 2022 23:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9aZO-0004Uc-41; Thu, 07 Jul 2022 23:06:02 +0000
Received: by outflank-mailman (input) for mailman id 363173;
 Thu, 07 Jul 2022 23:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tNfF=XM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o9aZM-0004To-Tk
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 23:06:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ca17637-fe49-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 01:05:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C2BA062566;
 Thu,  7 Jul 2022 23:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958C0C3411E;
 Thu,  7 Jul 2022 23:05:56 +0000 (UTC)
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
X-Inumbo-ID: 5ca17637-fe49-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657235157;
	bh=dtDnyWtSQJjQ8WCmaFr9PdN8QwjA48vU0zaGYtPsEPo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NN/O8oZFpyzr+vqMgi7GBQVoLX2AhRd4reAFYvV+sl2dQ/+/FqCk6bbmd1bCu/Niy
	 HuMU2406JWd375D5ubJENg7Dj3hnWkdGm3EXeyHLpa8S3HDlnQPg7ufmejANecIQuA
	 x4+KHgUDoMElxLNWJd2ccsgxASKj0ED+1O+79yPlRY1z0ivb8mMckO79Kfz0wIi23c
	 LgOnTdDYWIRWCfmnMHJ/OZwC535RqPlNBeTdULLwP2NCgy5+UqhBIwy845e+6srxoA
	 7pN2HnEAG2/PsMgvS5lgBBh+zsRiusQtgJgYG8v8c1eJ5k4yQbo8BGLcV7VO1Q798w
	 LkvisH/VIZMrQ==
Date: Thu, 7 Jul 2022 16:05:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] automation: Remove XEN_CONFIG_EXPERT leftovers
In-Reply-To: <20220707203803.798317-2-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207071546060.2354836@ubuntu-linux-20-04-desktop>
References: <20220707203803.798317-1-burzalodowa@gmail.com> <20220707203803.798317-2-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Jul 2022, Xenia Ragiadakou wrote:
> The EXPERT config option cannot anymore be selected via the environmental
> variable XEN_CONFIG_EXPERT. Remove stale references to XEN_CONFIG_EXPERT
> from the automation code.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/build/README.md      | 3 ---
>  automation/scripts/build        | 4 ++--
>  automation/scripts/containerize | 1 -
>  3 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/automation/build/README.md b/automation/build/README.md
> index 2137957408..00305eed03 100644
> --- a/automation/build/README.md
> +++ b/automation/build/README.md
> @@ -65,9 +65,6 @@ understands.
>  - CONTAINER_NO_PULL: If set to 1, the script will not pull from docker hub.
>    This is useful when testing container locally.
>  
> -- XEN_CONFIG_EXPERT: If this is defined in your shell it will be
> -  automatically passed through to the container.
> -
>  If your docker host has Linux kernel > 4.11, and you want to use containers
>  that run old glibc (for example, CentOS 6 or SLES11SP4), you may need to add
>  
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 281f8b1fcc..21b3bc57c8 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -91,6 +91,6 @@ for cfg in `ls ${cfg_dir}`; do
>      echo "Building $cfg"
>      make -j$(nproc) -C xen clean
>      rm -f xen/.config
> -    make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg} XEN_CONFIG_EXPERT=y defconfig
> -    make -j$(nproc) -C xen XEN_CONFIG_EXPERT=y
> +    make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg} defconfig
> +    make -j$(nproc) -C xen
>  done
> diff --git a/automation/scripts/containerize b/automation/scripts/containerize
> index 8992c67278..9d4beca4fa 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -101,7 +101,6 @@ exec ${docker_cmd} run \
>      -v "${CONTAINER_PATH}":/build:rw${selinux} \
>      -v "${HOME}/.ssh":/root/.ssh:ro \
>      ${SSH_AUTH_DIR:+-v "${SSH_AUTH_DIR}":/tmp/ssh-agent${selinux}} \
> -    ${XEN_CONFIG_EXPERT:+-e XEN_CONFIG_EXPERT=${XEN_CONFIG_EXPERT}} \
>      ${CONTAINER_ARGS} \
>      -${termint}i --rm -- \
>      ${CONTAINER} \
> -- 
> 2.34.1
> 

