Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AF85F8145
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 01:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418353.663127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogwtx-0006T8-7i; Fri, 07 Oct 2022 23:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418353.663127; Fri, 07 Oct 2022 23:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogwtx-0006Pf-58; Fri, 07 Oct 2022 23:37:09 +0000
Received: by outflank-mailman (input) for mailman id 418353;
 Fri, 07 Oct 2022 23:37:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FwH6=2I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ogwtv-0006PW-CF
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 23:37:07 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f357f94f-4698-11ed-9377-c1cf23e5d27e;
 Sat, 08 Oct 2022 01:37:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8F653B82477;
 Fri,  7 Oct 2022 23:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB729C433D6;
 Fri,  7 Oct 2022 23:37:01 +0000 (UTC)
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
X-Inumbo-ID: f357f94f-4698-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665185823;
	bh=Fx92Kd7vOkHb9hMJxKf9wpeSGLssJpRdqrhZafJUckA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FZTTzhRCVxXmwNn3k88Ctc+jiXRctfZFGcV441irl/LYB/zz8baek81f8bYyRaWg5
	 5972v6N8PtbZ1CFKK6gKzCAyZ4OYb3mxBe+WqwQN3l5rV9eFJXjawXggfoSqjyfWmX
	 3QAvXKEqp2v/vn8w0IIJY/2TIyIb39Wec8JNDd5OSKpxhSpPSxCkokh4nWZWgblp2V
	 DQhBpr5eAouXuWoKxxGxCQUMJsHEyMpQ/y+dw0xQXbr4QRIhMfH7klLi6GoqdyPBY1
	 oHEgbEhLAcN56tApHnZwjhQsWLSdvWLvkxZZ3sE8WSF0kIvl4Rqh1CWdB88I3C2x+q
	 upn99qiX6LO+w==
Date: Fri, 7 Oct 2022 16:36:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Doug Goldstein <cardoe@cardoe.com>, 
    michal.orzel@amd.com
Subject: Re: [PATCH v1 0/4] Yocto Gitlab CI
In-Reply-To: <cover.1661352827.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2210071618300.3690179@ubuntu-linux-20-04-desktop>
References: <cover.1661352827.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Aug 2022, Bertrand Marquis wrote:
> This patch series is a first attempt to check if we could use Yocto in
> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
> 
> The first patch is making sure build-yocto.sh is not catched by
> gitignore.
> 
> The second patch is creating a container with all elements required to
> build Yocto, a checkout of the yocto layers required and an helper
> script to build and run xen on qemu with yocto.
> 
> The third patch is creating containers with a first build of yocto done
> so that susbsequent build with those containers would only rebuild what
> was changed and take the rest from the cache.
> 
> The fourth patch is adding a way to easily clean locally created
> containers.
> 
> This is is mainly for discussion and sharing as there are still some
> issues/problem to solve:
> - building the qemu* containers can take several hours depending on the
>   network bandwith and computing power of the machine where those are
>   created
> - produced containers containing the cache have a size between 8 and
>   12GB depending on the architecture. We might need to store the build
>   cache somewhere else to reduce the size. If we choose to have one
>   single image, the needed size is around 20GB and we need up to 40GB
>   during the build, which is why I splitted them.
> - during the build and run, we use a bit more then 20GB of disk which is
>   over the allowed size in gitlab
> 

So I tried to build one of the build containers on my x86 workstation
with the following:

  make yocto/kirkstone-qemuarm64

but I get an error from the build:

  21:30:20 build qemuarm64: Error
  22:00:38 run qemuarm64: Error
  22:00:41 Build Complete (2 errors)
  The command '/bin/sh -c /home/$USER_NAME/bin/build-yocto.sh $target' returned a non-zero code: 2

Anyone else is having a better luck than me?


I don't think it is a problem if it takes a long time to build the build
containers because they are not built often and they are not built as
part of the gitlab-ci runs.

The issue could be the resulting container size. I wasn't aware of a
limit in gitlab -- I would like to try if there is a way around the
limit (either by changing a setting, or potentially switching to a
premium account.) However I need to be able to complete a container
build first :-)

How did you find out about the 20 GB limit? I couldn't find it in the
docs. The only info I could find states that there is no hard limit on
registry.gitlab.com.

Cheers,

Stefano

