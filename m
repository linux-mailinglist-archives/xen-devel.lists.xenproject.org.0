Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281B6A6C5AB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 23:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924562.1327695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvkcF-0006Be-KZ; Fri, 21 Mar 2025 22:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924562.1327695; Fri, 21 Mar 2025 22:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvkcF-000690-Hp; Fri, 21 Mar 2025 22:13:23 +0000
Received: by outflank-mailman (input) for mailman id 924562;
 Fri, 21 Mar 2025 22:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tvkcD-00066d-SS
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 22:13:21 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b215e75c-06a1-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 23:13:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BC96EA496A6;
 Fri, 21 Mar 2025 22:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D1FC4CEE3;
 Fri, 21 Mar 2025 22:13:17 +0000 (UTC)
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
X-Inumbo-ID: b215e75c-06a1-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742595198;
	bh=eXWcI/Qwt6nIJfbp6MHdeEDoSZYeN+qnHu7/2K/E2Lg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=efpZr8FbKL5WmTr8/IoAi51Rn7yk2zD2VvUqP+fXEEKNhNGkK5F4vtGjZbmz50Z7t
	 Wj9VUP6HD7z/znRZCfj7SC1/o21SBSvpmXPwhsFmIyxbJL5TGtJVHcmZArJV7lKGZu
	 cj77Pw4avEePF2lU0SdbwM/A7zrK7lAfs1kP8lILUo4wuJbKY+RDD4/tGEE11FQsEU
	 VkT4vSj9g6yz6Jqn8ZOV6wjcKE+Gndw1ku/ENG3GI67WZRMnoSZefDxvZx4tXXHIW5
	 Il+uVu/04zmqKxcgcFNUzhC0jTvBYIVMAa6l4TjQz0aAq8J+1/TwcEhv/3fT+dnAR/
	 6gUeBKAaFPRrg==
Date: Fri, 21 Mar 2025 15:13:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/4] automation/cirrus-ci: build XTF
In-Reply-To: <20250320152020.88526-3-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503211513110.2325679@ubuntu-linux-20-04-desktop>
References: <20250320152020.88526-1-roger.pau@citrix.com> <20250320152020.88526-3-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1332075721-1742595198=:2325679"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1332075721-1742595198=:2325679
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 20 Mar 2025, Roger Pau Monne wrote:
> In preparation for using the XTF selftests to smoke test the FreeBSD based
> Xen builds.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Changes since v1:
>  - Use production version.
> ---
>  .cirrus.yml | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 95d2d2d3db2e..a6e4a5d0308b 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -12,6 +12,12 @@ freebsd_template: &FREEBSD_ENV
>      CIRRUS_CLONE_DEPTH: 1
>      CIRRUS_LOG_TIMESTAMP: true
>  
> +freebsd_template_latest: &FREEBSD_ENV_PRODUCTION
> +  << : *FREEBSD_VERSIONS
> +  freebsd_instance:
> +    image_family: $FREEBSD_PRODUCTION
> +  << : *FREEBSD_ENV
> +
>  freebsd_configure_artifacts: &FREEBSD_CONFIGURE_ARTIFACTS
>    always:
>      rename_script:
> @@ -82,3 +88,21 @@ task:
>  
>    build_script:
>      - gmake -j`sysctl -n hw.ncpu` build-xen clang=y
> +
> +task:
> +  name: 'FreeBSD: XTF build'
> +  alias: xtf
> +
> +  << : *FREEBSD_ENV_PRODUCTION
> +
> +  clone_script:
> +    - pkg install -y git
> +    - git clone --depth 1 https://xenbits.xen.org/git-http/xtf.git
> +
> +  install_script: pkg install -y gmake
> +
> +  build_script:
> +    - cd xtf
> +    - cc --version
> +    - git rev-parse HEAD
> +    - gmake -j`sysctl -n hw.ncpu` LLVM=y
> -- 
> 2.48.1
> 
--8323329-1332075721-1742595198=:2325679--

