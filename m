Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DEC437F0C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 22:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215258.374342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me0k3-000171-0k; Fri, 22 Oct 2021 20:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215258.374342; Fri, 22 Oct 2021 20:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me0k2-000153-Sd; Fri, 22 Oct 2021 20:02:14 +0000
Received: by outflank-mailman (input) for mailman id 215258;
 Fri, 22 Oct 2021 20:02:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TWKL=PK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1me0k1-00014Q-M4
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 20:02:13 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 108c70a5-2baa-48fc-8ec7-8fd2fcfd6c2a;
 Fri, 22 Oct 2021 20:02:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2713E60FE7;
 Fri, 22 Oct 2021 20:02:12 +0000 (UTC)
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
X-Inumbo-ID: 108c70a5-2baa-48fc-8ec7-8fd2fcfd6c2a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634932932;
	bh=mXZyIPTbpRa8UpDESV+24yb8tsC39xOyc6Fd/9GCVQM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GUSBqhP1lYcKut1fHXRdJ69dI5qEIM6zPw6vDIPEW5vHaIJmcCoEv3rjKtRuy1sRm
	 drp+vM1lsWIeG9DkHu3lp+//oKR1A0KWkoswt809ld+TF63UwD9PakwJxJCNtrAEmb
	 V++tJ6tSmz0g73fya1/gZ+KY5paLI5eoGObfxSuqXPoQvHkUTs24DBMESINpEsXmbJ
	 pHVKlhKO9Y7ZwknKKOfcqQduruVcD4qI77CWv+XzWgdnS+ZGMqSm5dZGq6HP1MrZGL
	 HIrLT4RGcX6yZ47Jb31QQz97AlMmfJ+NDHobHl2m41RtzxqO3jUEjJPTRm/yAuf0Av
	 ix2v4SaQjzpzA==
Date: Fri, 22 Oct 2021 13:02:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, iwj@xenproject.org, cardoe@cardoe.com, 
    wl@xen.org, andrew.cooper3@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
In-Reply-To: <YXKw0jfDkJ5RrvXX@perard>
Message-ID: <alpine.DEB.2.21.2110221218470.2311@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s> <20211021230839.10794-2-sstabellini@kernel.org> <YXKw0jfDkJ5RrvXX@perard>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Oct 2021, Anthony PERARD wrote:
> On Thu, Oct 21, 2021 at 04:08:38PM -0700, Stefano Stabellini wrote:
> > diff --git a/automation/tests-artifacts/kernel/5.10.74.dockerfile b/automation/tests-artifacts/kernel/5.10.74.dockerfile
> > new file mode 100644
> > index 0000000000..f2dbbecf74
> > --- /dev/null
> > +++ b/automation/tests-artifacts/kernel/5.10.74.dockerfile
> > @@ -0,0 +1,38 @@
> > +FROM debian:unstable
> > +LABEL maintainer.name="The Xen Project" \
> > +      maintainer.email="xen-devel@lists.xenproject.org"
> > +
> > +ENV DEBIAN_FRONTEND=noninteractive
> > +ENV LINUX_VERSION=5.10.74
> > +ENV USER root
> > +
> > +RUN mkdir /build
> > +WORKDIR /build
> > +
> > +# build depends
> > +RUN apt-get update && \
> > +    apt-get --quiet --yes install \
> > +        build-essential \
> > +        libssl-dev \
> > +        bc \
> > +        curl \
> > +        flex \
> > +        bison \
> > +        libelf-dev \
> > +        && \
> > +    \
> > +    # Build the kernel
> 
> You could start a new docker "RUN" step to build the kernel.

OK


> > +    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
> > +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> > +    cd linux-"$LINUX_VERSION" && \
> > +    make defconfig && \
> > +    make xen.config && \
> > +    cp .config .config.orig && \
> > +    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
> 
> This command line could be replaced by:
>     sed -i '/XEN/s/=m$/=y/' .config
> But I guess Kconfig don't mind duplicated symbols.

Yeah the latter overwrites the former


> > +    make -j$(nproc) bzImage && \
> > +    cp arch/x86/boot/bzImage / && \
> > +    cd /build && \
> > +    rm -rf linux-"$LINUX_VERSION"* && \
> 
> 
> > +    apt-get autoremove -y && \
> > +    apt-get clean && \
> > +    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> 
> This apt cleaning stuff should be done right after `apt install`, and
> thus before starting to build the kernel, I think.

OK

> Any any case:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks Anthony!

