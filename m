Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F1C7AE1FE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 00:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608176.946514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuWY-0003Xj-Rr; Mon, 25 Sep 2023 22:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608176.946514; Mon, 25 Sep 2023 22:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuWY-0003W2-PA; Mon, 25 Sep 2023 22:57:54 +0000
Received: by outflank-mailman (input) for mailman id 608176;
 Mon, 25 Sep 2023 22:57:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2iti=FJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qkuWX-0003Vu-6T
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 22:57:53 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2ee107b-5bf6-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 00:57:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4856BCE0FE6;
 Mon, 25 Sep 2023 22:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE088C433C9;
 Mon, 25 Sep 2023 22:57:42 +0000 (UTC)
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
X-Inumbo-ID: f2ee107b-5bf6-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695682663;
	bh=ubs8DgxEOLPBMofipdq4CnUZopelQ6Rz8agd/79KMl4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g+Dmld+iPy0kAk1VR0odTrAx0NlQDJ+CJ/UJiv4rwoutmYiS3dB+COZgw1RcvbdUB
	 m1IPV+yqpMaeYPGV5+ZsbeHtqx1oRafrcok6Vqalj7ICOkax50PYvAVS34eVo96lC2
	 wfn7PB7SJFc3svWyQLFQ4rrXbaYS4++jkdTgHNizRDSAxw7ZKeESEIJTsqYxW8ePHO
	 2nI9huhzqjuFW4sCvROoXgk2B8W1b3oA5boJUk/eHiFSxxppQul28hD5mLOfDBB8oD
	 ANQ1NSPbytg2XWDzpHJr5Z5lQa9KpeYRYQPK4jZU9SiobufX/9O0YILhYVhv9UcF80
	 ueLO/NAESYSHg==
Date: Mon, 25 Sep 2023 15:57:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Shawn Anastasio <sanastasio@raptorengineering.com>
cc: xen-devel@lists.xenproject.org, 
    Timothy Pearson <tpearson@raptorengineering.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/3] automation: Drop ppc64le-*randconfig jobs
In-Reply-To: <76d21ac8a0de7d5ebac8b39a8d552b931a6302a3.1695681330.git.sanastasio@raptorengineering.com>
Message-ID: <alpine.DEB.2.22.394.2309251557350.1403502@ubuntu-linux-20-04-desktop>
References: <cover.1695681330.git.sanastasio@raptorengineering.com> <76d21ac8a0de7d5ebac8b39a8d552b931a6302a3.1695681330.git.sanastasio@raptorengineering.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 Sep 2023, Shawn Anastasio wrote:
> Since ppc64le is still undergoing early bringup, disable the randconfig
> CI build which was causing spurious CI failures.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Reported-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/build.yaml | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 1619e9a558..32af30cced 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -563,24 +563,6 @@ debian-bullseye-gcc-ppc64le-debug:
>      KBUILD_DEFCONFIG: ppc64_defconfig
>      HYPERVISOR_ONLY: y
>  
> -debian-bullseye-gcc-ppc64le-randconfig:
> -  extends: .gcc-ppc64le-cross-build
> -  variables:
> -    CONTAINER: debian:bullseye-ppc64le
> -    KBUILD_DEFCONFIG: ppc64_defconfig
> -    RANDCONFIG: y
> -    EXTRA_FIXED_RANDCONFIG:
> -      CONFIG_COVERAGE=n
> -
> -debian-bullseye-gcc-ppc64le-debug-randconfig:
> -  extends: .gcc-ppc64le-cross-build-debug
> -  variables:
> -    CONTAINER: debian:bullseye-ppc64le
> -    KBUILD_DEFCONFIG: ppc64_defconfig
> -    RANDCONFIG: y
> -    EXTRA_FIXED_RANDCONFIG:
> -      CONFIG_COVERAGE=n
> -
>  # Yocto test jobs
>  yocto-qemuarm64:
>    extends: .yocto-test-arm64
> -- 
> 2.30.2
> 

