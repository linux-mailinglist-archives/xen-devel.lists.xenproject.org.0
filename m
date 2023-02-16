Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74ED698917
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 01:07:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496286.766954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSRnh-0007lN-JE; Thu, 16 Feb 2023 00:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496286.766954; Thu, 16 Feb 2023 00:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSRnh-0007jV-GW; Thu, 16 Feb 2023 00:07:01 +0000
Received: by outflank-mailman (input) for mailman id 496286;
 Thu, 16 Feb 2023 00:06:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXCi=6M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pSRnf-0007jP-8l
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 00:06:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1e7ce79-ad8d-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 01:06:56 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A01C561589;
 Thu, 16 Feb 2023 00:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9EFC433D2;
 Thu, 16 Feb 2023 00:06:52 +0000 (UTC)
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
X-Inumbo-ID: d1e7ce79-ad8d-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676506013;
	bh=w7BuKMhDKY7mGJ2kGBUrPMqDaSm/Ii4hzKc4wooO//A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LIH43egt0Pc+86fkozBSFkHBlr7UfbWwf6v0BEsxgg0z76ZnvwimuR/tKnQa3oOgc
	 bWGNuxevSn96sHUGJEFOCv4E7K2BnArVRCC9uqn6q7mGMRmsoHiuKKuohnWdIs4rg7
	 tU7aKBv61SzJ5zDyt+JM5sQto6oc4ZHtM0a7jjMTUmWr3TZksJ1rPzF5Ee57++4dg5
	 7UH7XaXBC17lb+Dis8K+KYY5bQRnAipBVzOoC4Y4X9T0CIwKUksPTorav6T2DiL08t
	 BaW5lvWhnOhIMHT4ss0RaTz4LjboVxo/Xl0ctec7pA7GxwYulQhO5a6CNenQiP+6WD
	 DdXyCWKkEV3lg==
Date: Wed, 15 Feb 2023 16:06:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: anthony.perard@gmail.com, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/4] automation: Remove clang-8 from Debian unstable
 container
In-Reply-To: <1e8ec592-4a5b-4c74-5a0b-dbf3ea60b084@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2302151605410.2127160@ubuntu-linux-20-04-desktop>
References: <20230215120208.35807-1-anthony.perard@citrix.com> <20230215120208.35807-2-anthony.perard@citrix.com> <6fa7fa56-d30a-e66e-b46f-5e7daffeb487@citrix.com> <Y+0ILtUb+yrVWKxf@l14> <6c455c45-18d3-584e-bc8a-a1d22a68fcd3@citrix.com>
 <1e8ec592-4a5b-4c74-5a0b-dbf3ea60b084@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-329596572-1676506013=:2127160"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-329596572-1676506013=:2127160
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 15 Feb 2023, Andrew Cooper wrote:
> On 15/02/2023 4:31 pm, Andrew Cooper wrote:
> > On 15/02/2023 4:28 pm, Anthony PERARD wrote:
> >> On Wed, Feb 15, 2023 at 12:26:40PM +0000, Andrew Cooper wrote:
> >>> On 15/02/2023 12:02 pm, Anthony PERARD wrote:
> >>>> First, apt complain that it isn't the right way to add keys anymore,
> >>>> but hopefully that's just a warning.
> >>>>
> >>>> Second, we can't install clang-8:
> >>>> The following packages have unmet dependencies:
> >>>>  clang-8 : Depends: libstdc++-8-dev but it is not installable
> >>>>            Depends: libgcc-8-dev but it is not installable
> >>>>            Depends: libobjc-8-dev but it is not installable
> >>>>            Recommends: llvm-8-dev but it is not going to be installed
> >>>>            Recommends: libomp-8-dev but it is not going to be installed
> >>>>  libllvm8 : Depends: libffi7 (>= 3.3~20180313) but it is not installable
> >>>> E: Unable to correct problems, you have held broken packages.
> >>>>
> >>>> clang on Debian unstable is now version 14.0.6.
> >>>>
> >>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> >>> Yeah that's because clang 8 is way obsolete, and http://apt.llvm.org
> >>> only supports Clang 15 and later now.
> >>>
> >>> In hindsight, it was a mistake to take unstable-llvm-8.list in the first
> >>> place.
> >>>
> >>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> I just realize that this change is going to break gitlab testing in the
> >> staging-4* branches. So I guess this mean that we will have to backport
> >> this patch, or at least the gitlab-ci part.
> > I don't think it will.  The currently cached container is still "good"
> > for the older branches to use, but we ought to backport the change
> > nevertheless.
> >
> > Given that the container is un(re)buildable anyway, we're not losing
> > anything, I don't think.
> 
> Ah, so.  Applying just this patch won't break older trees.
> 
> But applying this patch, and patch 3, then rebuilding the the debian
> unstable container will break older branches, because there will no
> longer be anything called clang-8 in the container.
> 
> This demonstrates even more that referencing the compiler by exact
> version is a mistake.  As is using names like unstable.
> 
> As I said up front when we added CI of this form, we were always going
> to retrofit some changes to all branches (including the security-only
> branches) to keep this working.  These chicken are coming back to roost.

Yes. Like you said, I think we should backport this patch (or just the
part of it affecting .gitlab*) to the stable trees.
--8323329-329596572-1676506013=:2127160--

