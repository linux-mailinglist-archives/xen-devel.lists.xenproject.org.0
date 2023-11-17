Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBF27EEA95
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 02:09:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634795.990325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nMP-0004T3-R6; Fri, 17 Nov 2023 01:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634795.990325; Fri, 17 Nov 2023 01:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nMP-0004RD-OR; Fri, 17 Nov 2023 01:09:29 +0000
Received: by outflank-mailman (input) for mailman id 634795;
 Fri, 17 Nov 2023 01:09:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3nMO-0004R1-Dy
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 01:09:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3a96ab2-84e5-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 02:09:27 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A0B661C1D;
 Fri, 17 Nov 2023 01:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF649C433C7;
 Fri, 17 Nov 2023 01:09:24 +0000 (UTC)
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
X-Inumbo-ID: f3a96ab2-84e5-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700183365;
	bh=jLGFi7MR1qihu+EiJfw2686JzKVJm6mit3R9c2T1gA4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VFR18JR0WXWlQduu8IsHJ57xiVhr5rkb9OJ6+qTwmNnvzlk+I/sXsQsGWli4t+6GV
	 Qy42dD4eRombPXUILTQVMpfmbj9rY0KgpmbxlisQ/jmFyBPMADhBIAW9ku/7+rKEEt
	 k0EjH1CpuUejQw0ykGURo8qewzfEo1l2tZ0ZTZ3Z8z5maZ3v5YhwutqOMfHQ4Fl0cY
	 RaX5D1mwxQ9G5pYZ8mh3AFDTPnqR4XzLMsXfoJFbcpAMkhwux8/HMrhhAOvKFa+Zbj
	 7guno+VyXje5vc5aMqSUFnXcXv+aXMV7bzxCL4omFZxzx2EeE8ZzP01P0aCZj3V3uj
	 lSwF7YGB4sa5A==
Date: Thu, 16 Nov 2023 17:09:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/6] automation: update tests to use Debian Bookworm
In-Reply-To: <20231116121310.72210-5-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311161709030.773207@ubuntu-linux-20-04-desktop>
References: <20231116121310.72210-1-roger.pau@citrix.com> <20231116121310.72210-5-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2025486830-1700183365=:773207"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2025486830-1700183365=:773207
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 Nov 2023, Roger Pau Monne wrote:
> Switch tests using Stretch to Bookworm, as Stretch is EOL.
> 
> Note the packages are not removed from the Stretch dockerfile, because the
> tests in stable branches will run using the old containers.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> The Bookworm container needs to be updated to contain the required tools before
> pushing this change.

I'll do that after the release just to stay on the safe side


> ---
>  automation/build/debian/bookworm.dockerfile | 5 +++++
>  automation/gitlab-ci/test.yaml              | 4 ++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
> index ae008c8d46e5..7aea081c13a9 100644
> --- a/automation/build/debian/bookworm.dockerfile
> +++ b/automation/build/debian/bookworm.dockerfile
> @@ -46,6 +46,11 @@ RUN apt-get update && \
>          gnupg \
>          apt-transport-https \
>          golang \
> +        # for test phase, qemu-smoke-* jobs
> +        qemu-system-x86 \
> +        # for test phase, qemu-alpine-* jobs
> +        cpio \
> +        busybox-static \
>          && \
>          apt-get autoremove -y && \
>          apt-get clean && \
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 61e642cce0cc..6aabdb9d156f 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -43,7 +43,7 @@
>  .qemu-x86-64:
>    extends: .test-jobs-common
>    variables:
> -    CONTAINER: debian:stretch
> +    CONTAINER: debian:bookworm
>      LOGFILE: qemu-smoke-x86-64.log
>    artifacts:
>      paths:
> @@ -130,7 +130,7 @@
>  build-each-commit-gcc:
>    extends: .test-jobs-common
>    variables:
> -    CONTAINER: debian:stretch
> +    CONTAINER: debian:bookworm
>      XEN_TARGET_ARCH: x86_64
>      CC: gcc
>    script:
> -- 
> 2.42.0
> 
--8323329-2025486830-1700183365=:773207--

