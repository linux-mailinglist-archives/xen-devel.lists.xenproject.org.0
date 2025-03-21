Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9807A6C5A8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 23:13:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924552.1327686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvkbk-0005hg-Dr; Fri, 21 Mar 2025 22:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924552.1327686; Fri, 21 Mar 2025 22:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvkbk-0005fR-Ap; Fri, 21 Mar 2025 22:12:52 +0000
Received: by outflank-mailman (input) for mailman id 924552;
 Fri, 21 Mar 2025 22:12:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tvkbi-0005fL-Ka
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 22:12:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f791812-06a1-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 23:12:49 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 107D85C0285;
 Fri, 21 Mar 2025 22:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3634C4CEE3;
 Fri, 21 Mar 2025 22:12:46 +0000 (UTC)
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
X-Inumbo-ID: 9f791812-06a1-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742595167;
	bh=b5wxEeGtNWN3tfdcpmVduxhL32dMjUR1mZpaX15nS+U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fq1jQ4cranFfj8lnPudwNH5lDC0qk/FvO6fYOLWlczK+/lXTUGp7GLalstWot8EMF
	 96c8JyMSZaqGBlErWYTStL7Rc8sh8vYj2QWDYp5+Lk68BW5gSQFGlqxXd58WoI2k1C
	 4K0oXNSHceDnIiDbarSrISuZbyX52N/dThuGKoOEQs5AP1bLK79o0tiiqD1TfFA9Jj
	 RBUw3FBrOEf6UvOE4U3YKPVbDiE8KP/9mMeCzKwf+ujqsAG8y0OPaxeeouxFX4D3BN
	 vZikH6FS+0qZ7ljE6HSbzuDe5vk1xABtli1/GRIxaEWQvsagYpvH83UeILxxUSrAnz
	 XD3KSMAV2Fk7g==
Date: Fri, 21 Mar 2025 15:12:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/4] automation/cirrus-ci: use matrix keyword to
 generate per-version build tasks
In-Reply-To: <20250320152020.88526-2-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503211512360.2325679@ubuntu-linux-20-04-desktop>
References: <20250320152020.88526-1-roger.pau@citrix.com> <20250320152020.88526-2-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-247471004-1742595167=:2325679"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-247471004-1742595167=:2325679
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 20 Mar 2025, Roger Pau Monne wrote:
> Move the current logic to use the matrix keyword to generate a task for
> each version of FreeBSD we want to build Xen on.  The matrix keyword
> however cannot be used in YAML aliases, so it needs to be explicitly used
> inside of each task, which creates a bit of duplication.  At least abstract
> the FreeBSD minor version numbers to avoid repetition of image names.
> 
> Note that the full build uses matrix over an env variable instead of using
> it directly in image_family.  This is so that the alias can also be set
> based on the FreeBSD version, in preparation for adding further tasks that
> will depend on the full build having finished.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v1:
>  - Use FreeBSD_{LEGACY,PRODUCTION,CURRENT} to refer to development release,
>    current release, and current release - 1.
> ---
>  .cirrus.yml | 78 +++++++++++++++++++++++++----------------------------
>  1 file changed, 37 insertions(+), 41 deletions(-)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 490f214f0460..95d2d2d3db2e 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -1,13 +1,9 @@
>  # https://cirrus-ci.org/guide/tips-and-tricks/#sharing-configuration-between-tasks
> -freebsd_13: &FREEBSD_13
> -  freebsd_instance:
> -    image_family: freebsd-13-5
> -freebsd_14: &FREEBSD_14
> -  freebsd_instance:
> -    image_family: freebsd-14-2
> -freebsd_15: &FREEBSD_15
> -  freebsd_instance:
> -    image_family: freebsd-15-0-snap
> +freebsd_versions: &FREEBSD_VERSIONS
> +  env:
> +    FREEBSD_LEGACY:     freebsd-13-5
> +    FREEBSD_PRODUCTION: freebsd-14-2
> +    FREEBSD_CURRENT:    freebsd-15-0-snap
>  
>  freebsd_template: &FREEBSD_ENV
>    environment:
> @@ -24,7 +20,24 @@ freebsd_configure_artifacts: &FREEBSD_CONFIGURE_ARTIFACTS
>        path: xen-config
>        type: text/plain
>  
> -freebsd_full_build_template: &FREEBSD_FULL_BUILD_TEMPLATE
> +task:
> +  name: 'FreeBSD: full build'
> +
> +  # It's not possible to use the matrix keyword in YAML aliases, as they
> +  # keyword usage is restricted to task, docker_builder or pipe.  Attempting to
> +  # use a YAML alias with the duplicated keys doesn't work either. Use an env
> +  # variable so the version can also be appended to the task alias.
> +  << : *FREEBSD_VERSIONS
> +  env:
> +    matrix:
> +      FREEBSD_VERSION: $FREEBSD_LEGACY
> +      FREEBSD_VERSION: $FREEBSD_PRODUCTION
> +      FREEBSD_VERSION: $FREEBSD_CURRENT
> +
> +  alias: freebsd_full_$FREEBSD_VERSION
> +  freebsd_instance:
> +    image_family: $FREEBSD_VERSION
> +
>    << : *FREEBSD_ENV
>  
>    install_script: pkg install -y seabios gmake ninja bash
> @@ -42,7 +55,20 @@ freebsd_full_build_template: &FREEBSD_FULL_BUILD_TEMPLATE
>    build_script:
>      - gmake -j`sysctl -n hw.ncpu` clang=y
>  
> -freebsd_randconfig_template: &FREEBSD_RANDCONFIG_TEMPLATE
> +task:
> +  name: 'FreeBSD: randconfig build'
> +
> +  # It's not possible to use the matrix keyword in YAML aliases, as they
> +  # keyword usage is restricted to task, docker_builder or pipe.  Attempting to
> +  # use a YAML alias with the duplicated `image_family` keys doesn't work
> +  # either. Abstract the version numbers at least.
> +  << : *FREEBSD_VERSIONS
> +  freebsd_instance:
> +    matrix:
> +      image_family: $FREEBSD_LEGACY
> +      image_family: $FREEBSD_PRODUCTION
> +      image_family: $FREEBSD_CURRENT
> +
>    << : *FREEBSD_ENV
>  
>    install_script: pkg install -y gmake python3 bison
> @@ -56,33 +82,3 @@ freebsd_randconfig_template: &FREEBSD_RANDCONFIG_TEMPLATE
>  
>    build_script:
>      - gmake -j`sysctl -n hw.ncpu` build-xen clang=y
> -
> -task:
> -  name: 'FreeBSD 13: full build'
> -  << : *FREEBSD_13
> -  << : *FREEBSD_FULL_BUILD_TEMPLATE
> -
> -task:
> -  name: 'FreeBSD 14: full build'
> -  << : *FREEBSD_14
> -  << : *FREEBSD_FULL_BUILD_TEMPLATE
> -
> -task:
> -  name: 'FreeBSD 15: full build'
> -  << : *FREEBSD_15
> -  << : *FREEBSD_FULL_BUILD_TEMPLATE
> -
> -task:
> -  name: 'FreeBSD 13: randconfig'
> -  << : *FREEBSD_13
> -  << : *FREEBSD_RANDCONFIG_TEMPLATE
> -
> -task:
> -  name: 'FreeBSD 14: randconfig'
> -  << : *FREEBSD_14
> -  << : *FREEBSD_RANDCONFIG_TEMPLATE
> -
> -task:
> -  name: 'FreeBSD 15: randconfig'
> -  << : *FREEBSD_15
> -  << : *FREEBSD_RANDCONFIG_TEMPLATE
> -- 
> 2.48.1
> 
--8323329-247471004-1742595167=:2325679--

