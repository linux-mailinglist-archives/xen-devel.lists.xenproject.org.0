Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688184B6F63
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 15:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273262.468379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJz6t-0001z7-NN; Tue, 15 Feb 2022 14:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273262.468379; Tue, 15 Feb 2022 14:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJz6t-0001xB-KG; Tue, 15 Feb 2022 14:47:19 +0000
Received: by outflank-mailman (input) for mailman id 273262;
 Tue, 15 Feb 2022 14:47:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZAEc=S6=linaro.org=vincent.guittot@srs-se1.protection.inumbo.net>)
 id 1nJz6r-0001x3-QA
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 14:47:17 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2af3f7c1-8e6e-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 15:47:16 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id bx31so27102120ljb.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Feb 2022 06:47:16 -0800 (PST)
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
X-Inumbo-ID: 2af3f7c1-8e6e-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W5iOUrZtFrbQaKazLZbRabBpASAbmezehphNEpzXizc=;
        b=JNOLFM6W3xrljvhnC5uCXJipvSeM9PI+wTtkMxZ3lDp+rfeUGd1bCUDdoR3vhtl3cq
         w0LQC7XqGyCdEOD1TdJeeQ0c6NuHzLZ/qDOzWSLLLDCwwtF9j+L7RDrpWASWyaL0pWiC
         /t3+JN7CKczk+wFHo9DM7ymbEYt7axIUysImxgkavobP/MDb/ACQgGR8syhBHNd2qJYF
         MGfyP9xErialFjPIWJ5qU5Ne97vDTIGz3vkxTbz3OCZmEKap1vcIHFUEDBTapLe7eBpR
         y0wiXs9NceAr9LT2jMvMfUPqAnSmDJdhONmnHkh8S6c2V+oiaEKDYZ7cZ0QiksXn4O5s
         Q0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W5iOUrZtFrbQaKazLZbRabBpASAbmezehphNEpzXizc=;
        b=784fTg+HPRj/aV8qE8p0zrJEN7YtMzHbBM+KU4LKUySHBZq1L9CoywfWyol5auQKxp
         4pmsBgA1zuaeUlwr/Z392FEyifw127ukKIzwnO5WTdHT4eY1BGqYoqR9zD89vcpDUga4
         jVWWsaa+iV70AKWnQYjjD8N7yAGujTn5eysKah24Ub4yEnt9TgCFNU0/tTD8u05tkgI7
         Xpk1cgANtAboGmJ64T7ifHVPN45uYCEhwHCredXvw3KTO+ALnpRBpbjD08vhpGeEHQdx
         bKxpswUcyn4Z/P5OMvn2uHAup6afmR+N6EvmH/4nn7iqSGYmnrox5DVQ/LlXbzdSvhrl
         Ml6g==
X-Gm-Message-State: AOAM533IPOUBjZFv3eZw1ix3NjwOzAWKXXovbQiCN+s6DUIn8ekf9Y+l
	Bxwf8YofY4JocRONIsx8HSl18BF+Go8ZjTTVZJlGmA==
X-Google-Smtp-Source: ABdhPJwEPtcWn43YJVDmZMlG3/CWc2insrNdIBPl/s1xka5NlSjPeJUfyd8Tuob4baIzLRqkXdgRJkzr44zGMZgVzNc=
X-Received: by 2002:a05:651c:154a:: with SMTP id y10mr2769324ljp.383.1644936435401;
 Tue, 15 Feb 2022 06:47:15 -0800 (PST)
MIME-Version: 1.0
References: <87h79bgd1m.fsf@linaro.org> <alpine.DEB.2.22.394.2202071419270.2091381@ubuntu-linux-20-04-desktop>
 <87k0e1cl9z.fsf@linaro.org> <alpine.DEB.2.22.394.2202111445290.2091381@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2202111445290.2091381@ubuntu-linux-20-04-desktop>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 15 Feb 2022 15:47:04 +0100
Message-ID: <CAKfTPtCSo0kDwnZyBhRtjaQ9ao+mc5Rzjq=H6jGUpapM-=bRiA@mail.gmail.com>
Subject: Re: Metadata and signalling channels for Zephyr virtio-backends on Xen
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	stratos-dev@op-lists.linaro.org, xen-devel@lists.xenproject.org, 
	AKASHI Takahiro <takahiro.akashi@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Dmytro Firsov <dmytro_firsov@epam.com>, 
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Oleksandr_Tyshchenko@epam.com, Artem_Mygaiev@epam.com, 
	bertrand.marquis@arm.com, Wei.Chen@arm.com, Ed.Doxat@arm.com, 
	Oleksii_Moisieiev@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 12 Feb 2022 at 00:34, Stefano Stabellini
<stefano.stabellini@xilinx.com> wrote:
>
> On Fri, 11 Feb 2022, Alex Benn=C3=A9e wrote:
> > > FYI, a good and promising approach to handle both SCMI and SCPI is th=
e
> > > series recently submitted by EPAM to mediate SCMI and SCPI requests i=
n
> > > Xen: https://marc.info/?l=3Dxen-devel&m=3D163947444032590
> > >
> > > (Another "special" virtio backend is virtio-iommu for similar reasons=
:
> > > the guest p2m address mappings and also the IOMMU drivers are in Xen.
> > > It is not immediately clear whether a virtio-iommu backend would need=
 to
> > > be in Xen or run as a process in dom0/domU.)
> > >
> > > On the other hand, for all the other "normal" protocols (e.g.
> > > virtio-net, virtio-block, etc.) the backend would naturally run as a
> > > process in dom0 or domU (e.g. QEMU in Dom0) as one would expect.
> >
> > Can domU's not be given particular access to HW they might want to
> > tweak? I assume at some point a block device backend needs to actually
> > talk to real HW to store the blocks (even if in most cases it would be =
a
> > kernel doing the HW access on it's behalf).
>
> Yes, it would. Block and network are subsystems with limited visibility,
> access, and harmful capabilities (assuming IOMMU).
>
> If the block device goes down or is misused, block might not work but
> everything else is expected to work. Block only requires visibility of
> the block device for it to work. The same is true for network, GPU, USB,
> etc.
>
> SCMI is different. If SCMI is misused the whole platform is affected.
> SCMI implies visibility of everything in the system. It is not much
> about emulating SCMI but more about mediating SCMI calls.
>
> In other words, SCMI is not a device, it is a core interface. In a Xen
> model, Xen virtualizes CPU and memory and other core features/interfaces
> (timers, interrupt controller, IOMMU, etc). The PCI root complex is
> handled by Xen too. Individual (PCI and non-PCI) devices are assigned to
> guests.
>
> These are the reasons why I think the best way to enable SCMI in
> upstream Xen is with a mediator in the hypervisor as it is currently in
> development. Any chances you could combine your efforts with EPAM's
> outstanding series? You might be able to spot gaps if any, and might
> even have already code to fill those gaps. It would be fantastic to have
> your reviews and/or contributions on xen-devel.
>
> Otherwise, if you have to run the virtio-scmi backend in userspace, why

Just to clarify, this goal is not to run the scmi backend as a linux
userspace app but to run a virtual power coprocessor that will handle
everything which is not system critical and will change from one
product to another which make it quite hard to maintain in the
hypervisor.

I have only looked at the cover letter which mentions the use of SMC
call which will be trapped by Xen before being modified and forward to
ATF. AFAICT, the ATF execution context is quite simple and synchronous
with the request. In our case, we want to be able to manage to I2C
device as an example or to notifies VMs with aynshorous event like
sensor or performance change which virtio-scmi support


> not try to get it to work on Xen :-) It might not be the ideal solution,
> but it could be a good learning experience and pave the way for the
> other virtio backends which definitely will be in userspace
> (virtio-block, virtio-gpu, etc).
>
>
> > >> Currently the demo setup
> > >> is intermediated by a double-ended vhost-user daemon running on the
> > >> devbox acting as a go between a number of QEMU instances representin=
g
> > >> the front and back-ends. You can view the architecture with Vincents
> > >> diagram here:
> > >>
> > >>   https://docs.google.com/drawings/d/1YSuJUSjEdTi2oEUq4oG4A9pBKSEJTA=
p6hhcHKKhmYHs/edit?usp=3Dsharing
> > >>
> > >> The key virtq handling is done over the special carve outs of shared
> > >> memory between the front end and guest. However the signalling is
> > >> currently over a virtio device on the backend. This is useful for th=
e
> > >> PoC but obviously in a real system we don't have a hidden POSIX syst=
em
> > >> acting as a go between not to mention the additional latency it caus=
es
> > >> with all those context switches.
> > >>
> > >> I was hoping we could get some more of the Xen experts to the next
> > >> Stratos sync (17th Feb) to go over approaches for a properly hosted =
on
> > >> Xen approach. From my recollection (Vincent please correct me if I'm
> > >> wrong) of last week the issues that need solving are:
> > >
> > > Unfortunately I have a regular conflict which prevents me from being
> > > able to join the Stratos calls. However, I can certainly make myself
> > > available for one call (unless something unexpected comes up).
> > >
> > >
> > >>  * How to handle configuration steps as FE guests come up
> > >>
> > >> The SCMI server will be a long running persistent backend because it=
 is
> > >> managing real HW resources. However the guests may be ephemeral (or =
just
> > >> restarted) so we can't just hard-code everything in a DTB. While the
> > >> virtio-negotiation in the config space covers most things we still n=
eed
> > >> information like where in the guests address space the shared memory
> > >> lives and at what offset into that the queues are created. As far as=
 I'm
> > >> aware the canonical source of domain information is XenStore
> > >> (https://wiki.xenproject.org/wiki/XenStore) but this relies on a Dom=
0
> > >> type approach. Is there an alternative for dom0less systems or do we
> > >> need a dom0-light approach, for example using STR-21 (Ensure Zephyr =
can
> > >> run cleanly as a Dom0 guest) providing just enough services for FE's=
 to
> > >> register metadata and BE's to read it?
> > >
> > > I'll try to answer the question for a generic virtio frontend and
> > > backend instead (not SCMI because SCMI is unique due to the reasons
> > > above.)
> > >
> > > Yes, xenstore is the easiest way to exchange configuration informatio=
n
> > > between domains. I think EPAM used xenstore to exchange the
> > > configuration information in their virtio-block demo. There is a way =
to
> > > use xenstore even between dom0less VMs:
> > > https://marc.info/?l=3Dxen-devel&m=3D164340547602391 Not just xenstor=
e but
> > > full PV drivers too. However, in the dom0less case xenstore is going =
to
> > > become available some time after boot, not immediately at startup tim=
e.
> > > That's because you need to wait until xenstored is up and running.
> > >
> > > There are other ways to send data from one VM to another which are
> > > available immediately at boot, such as Argo and static shared memory.
> > >
> > > But dom0less is all about static partitioning, so it makes sense to
> > > exploit the build-time tools to the fullest. In the dom0less case, we
> > > already know what is going to run on the target before it is even tur=
ned
> > > on. As an example, we might have already prepared an environment with=
 3
> > > VMs using Yocto and ImageBuilder. We could also generate all
> > > configurations needed and place them inside each VMs using Yocto's
> > > standard tools and ImageBuilder. So for dom0less, I recommend to go v=
ia
> > > a different route and pre-generate the configuration directly where
> > > needed instead of doing dynamic discovery.
> >
> > Even in a full dom0less setup you still need to manage lifetimes someho=
w
> > if a guest reboots.
>
> Sure but that's not a problem: all the info and configuration related to
> rebooting the guest can also be pre-generated in Yocto or ImageBuilder.
>
> As an example, it is already possible (although rudimental) in
> ImageBuilder to generate the dom0less configuration and also the domU xl
> config file for the same domU with passthrough devices.

