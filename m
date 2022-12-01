Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72C763F996
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 22:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451197.708850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0qqi-0005nQ-NG; Thu, 01 Dec 2022 21:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451197.708850; Thu, 01 Dec 2022 21:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0qqi-0005jR-Jl; Thu, 01 Dec 2022 21:12:04 +0000
Received: by outflank-mailman (input) for mailman id 451197;
 Thu, 01 Dec 2022 21:12:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DAsL=37=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p0qqg-0004Lw-R4
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 21:12:02 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc94c44c-71bc-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 22:12:02 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D554B82027;
 Thu,  1 Dec 2022 21:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB68C4347C;
 Thu,  1 Dec 2022 21:11:58 +0000 (UTC)
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
X-Inumbo-ID: cc94c44c-71bc-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669929120;
	bh=A9ROI7OMpzgNMQTim+Pje0Jhlkdcbvy53108chFofB0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hYqz5LaQyNomgHC0OCI6OP08YdoKXEUTGwkB5sFs/UXzEgsbBBcJ+KUr8yJzCJMXW
	 G9OXaDAVZTmAZg6sbzBY+XIK9XJp6dQzTtAT48WGg+fJxQYqZ2x5NReHS5203Luf6U
	 hOZ/u6Yoy4V2Bqy0Wr0w1sZgxlO9Zh+osir2I/qRvnOCIu3eCyRPRl/xzTkEp4q1ix
	 OBZiOnb7OkRofdQb4k3/uEdAZAfLgZ08doOt5ndtwbLQ1DstexggGl9O1EYbPi5Qv3
	 yCdTcsFgHjD5uMO7XMz8VIn3+8jReAIAqdMuQWXKB6WlqMwKMLw/F4YAWy8Ji0pPRx
	 uKy4wSW8COpSA==
Date: Thu, 1 Dec 2022 13:11:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v6 0/3] Yocto Gitlab CI
In-Reply-To: <cover.1669904508.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2212011311410.4039@ubuntu-linux-20-04-desktop>
References: <cover.1669904508.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Tested-by: Stefano Stabellini <sstabellini@kernel.org>


On Thu, 1 Dec 2022, Bertrand Marquis wrote:
> This patch series is a first attempt to check if we could use Yocto in
> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
> 
> The first patch is introducing a container template from which container
> files can be generated for all combinations we want to support (qemu
> arm, arm64 and x86 targets and hosts x86_64 and arm64).
> It is also introducing a generic build script (build-yocto.sh) that is
> used to create, build and run a Yocto project.
> 
> The second patch is adding a way to easily clean locally created
> containers.
> 
> The third patch is introducing some gitlab CI templates and jobs so that
> we can test a Xen source tree in gitlab-CI using Yocto.
> 
> This has been tested on a x86 host machine and on an arm host machine
> (with mk_dsdt.c fix).
> 
> Changes in v6:
> - fix qemux86 errors on arm hosts
> - added some comments
> - fix Makefile to not call docker a lot during each parse
> - several fixes and improvments described in each patch
> 
> Changes in v5:
> - automatic cleanup of generated docker files using INTERMEDIATE
> - typo fixes
> - rebase on Stefano's next branch
> - remove clean rule cleaning all containers
> 
> Changes in v4:
> - rework the container generation to support multiple hosts
> - rework the container generation to use a single template for all
>   docker files (make process is generating the docker files).
> 
> Changes in v3:
> - limit number of jobs in yocto
> - do not copy build script inside container
> - add patch from Michal to create gitlab jobs
> 
> Changes in v2:
> - remove gitignore patch which was merged
> - add a --dump-log support in build-yocto.sh script and use it during
>   container creation to see the error logs.
> 
> 
> *** BLURB HERE ***
> 
> Bertrand Marquis (2):
>   automation: Create Yocto docker images
>   automation: Add a clean rule for containers
> 
> Michal Orzel (1):
>   automation: Add CI test jobs for Yocto
> 
>  .gitignore                                 |   1 +
>  automation/build/Makefile                  |  26 +-
>  automation/build/yocto/build-yocto.sh      | 356 +++++++++++++++++++++
>  automation/build/yocto/yocto.dockerfile.in | 114 +++++++
>  automation/build/yocto/yocto.inc           |  44 +++
>  automation/gitlab-ci/test.yaml             |  45 +++
>  6 files changed, 583 insertions(+), 3 deletions(-)
>  create mode 100755 automation/build/yocto/build-yocto.sh
>  create mode 100644 automation/build/yocto/yocto.dockerfile.in
>  create mode 100644 automation/build/yocto/yocto.inc
> 
> -- 
> 2.25.1
> 

