Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23629207C5E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 21:48:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joBMu-0000sQ-Jj; Wed, 24 Jun 2020 19:47:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z21m=AF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1joBMt-0000sL-Ne
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 19:47:35 +0000
X-Inumbo-ID: 8c9edffe-b653-11ea-8135-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c9edffe-b653-11ea-8135-12813bfff9fa;
 Wed, 24 Jun 2020 19:47:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CAEDF2077D;
 Wed, 24 Jun 2020 19:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593028054;
 bh=NOgQrDFdeF9VVQe8qfEGZAUE9YhmFpPlPbe+DFvvKiA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=1Dddk7Djth11RdmvLKWQj9ZvWq7QJuAYOQxXnNv81dGGx5j0vr5QY4RMd1hdnwkBr
 cCDfsQ2k0vLqdSZigTUnyyXZvaX6Gsgl+hRonOXJ+5WuwtLfKljldSWBdU62uABjry
 TgrwqpBRJSu6q2KDyFSx+mdC+KpC11A9/29okNg8=
Date: Wed, 24 Jun 2020 12:47:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: UEFI support in ARM DomUs
In-Reply-To: <473beeda-15e6-dd69-e140-b4084bea3ead@epam.com>
Message-ID: <alpine.DEB.2.21.2006241247200.8121@sstabellini-ThinkPad-T480s>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <alpine.DEB.2.21.2006191020110.12730@sstabellini-ThinkPad-T480s>
 <c5905f40-6d0a-358f-35e4-239e88ace7d8@epam.com>
 <94bfe57c-c1be-62b4-3799-b90415264487@xen.org>
 <4ece84cf-dd68-6eb4-a0e2-e9008d264ba5@epam.com>
 <1a44c645-8c9a-93ce-8466-35c87eb4fca5@xen.org>
 <alpine.DEB.2.21.2006221419200.8121@sstabellini-ThinkPad-T480s>
 <271a4db0-5ce5-ba25-65e7-107c040f5069@epam.com>
 <a122102d-c023-0379-5d2c-b7b08d262844@epam.com>
 <alpine.DEB.2.21.2006241000260.8121@sstabellini-ThinkPad-T480s>
 <473beeda-15e6-dd69-e140-b4084bea3ead@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 24 Jun 2020, Oleksandr Andrushchenko wrote:
> On 6/24/20 8:05 PM, Stefano Stabellini wrote:
> > On Wed, 24 Jun 2020, Oleksandr Andrushchenko wrote:
> >> On 6/23/20 8:31 AM, Oleksandr Andrushchenko wrote:
> >>> On 6/23/20 4:20 AM, Stefano Stabellini wrote:
> >>>> On Mon, 22 Jun 2020, Julien Grall wrote:
> >>>>>>>> For the first part (__XEN_INTERFACE_VERSION__) I think we can provide it
> >>>>>>>> via
> >>>>>>>>
> >>>>>>>> CFLAGS or something. This can also be done for the location of Xen
> >>>>>>>> headers.
> >>>>>>> __XEN_INTERFACE_VERSION__ should work through the CFLAGS. An alternative
> >>>>>>> would be to allow the user to specify through the Kconfig.
> >>>>>> You mean specifying via Kconfig something like "0x00040d00"?
> >>>>> Possibly yes.
> >>>>>
> >>>>>> And what about the headers? How will we provide their location if we decide
> >>>>>> not to include those
> >>>>>>
> >>>>>> in the tree?
> >>>>> I would do through Kconfig as well.
> >>>> If we specify the external location of the Xen headers via Kconfig, it
> >>>> seems to me that we should be able to detect the interface version
> >>>> automatically from any Makefile as part of the build. No need to ask the
> >>>> user.
> >>>>
> >>>> However, if Oleksandr is thinking of using the Xen headers for the
> >>>> hypercalls definitions, then I think we might not need external headers
> >>>> at all because that is a stable interface, as Julien wrote. We could
> >>>> just define our own few headers for just what you need like Linux does.
> >>> This is a good idea: I'll try to get the minimal set of headers from Linux
> >>>
> >>> instead of Xen as those seem to be well prepared for such a use-case. This
> >>>
> >>> way we'll have headers in U-boot tree and guarantee that we have a minimal
> >>>
> >>> subset which is easier to maintain. I'll keep you updated on the progress
> >> We've managed to strip the headers and remove __XEN__ and the rest definitions
> >>
> >> we were talking about. So, these are now the minimal required set of headers
> >>
> >> that allows U-boot to build serial and block drivers. Please take a look at [1]
> >>
> >> Pull request for comments is at [2]
> > I think this is the right approach. There is no build-dependency on Xen
> > anymore, is that correct?
>
> No dependency

Great!

