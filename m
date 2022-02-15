Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 345CE4B6EE9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 15:33:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273239.468346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJyt6-0007fM-SU; Tue, 15 Feb 2022 14:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273239.468346; Tue, 15 Feb 2022 14:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJyt6-0007cT-O9; Tue, 15 Feb 2022 14:33:04 +0000
Received: by outflank-mailman (input) for mailman id 273239;
 Tue, 15 Feb 2022 14:33:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZAEc=S6=linaro.org=vincent.guittot@srs-se1.protection.inumbo.net>)
 id 1nJyt4-0007cJ-CS
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 14:33:02 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d54d249-8e6c-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 15:33:01 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id r20so1420966ljj.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Feb 2022 06:33:01 -0800 (PST)
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
X-Inumbo-ID: 2d54d249-8e6c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HrHSQ3nTYehA0h9uNSx7m9elOEWCoHpUSrruiXVY27g=;
        b=LM2yFePKdmzF7JQFBE06YEaKWxWcHBD740QCyI2TlM2aPr4Ox+6JjZUrlqCq4o20rS
         SMIAEx8BUqLs3RQEGE64DD2YxpEai8q89XbPFJGBI2BzqSGkgYpSzw+OuRiBEsNFnSlo
         wrkdEYvgO1P/FbrEbT7jzaro6JLXCTq5PO0Y4IZvdXc6ekadgkTq4z1jBKFAFXVkfQds
         B++nRCrMqNYBbrqq2Hz+GoGQXy0S5Bet+3Ya5S+iKvy0dBaYpeAEs0d7TNg77FXMTVE9
         f2Wyl/Ns30pkd0FK+F3SxeKDwmEwrlFesCBVnZfvTu4V0MxFqXlwLSk7QSTWmzDzplii
         e8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HrHSQ3nTYehA0h9uNSx7m9elOEWCoHpUSrruiXVY27g=;
        b=a9Juvx6FoFabAKKdptiK9FcYmcPLTBB1F8m+IuH+dpIA0f4MJ4RMgqDioyweL2PdcU
         JtgIyHv4neYOcxRneD/USMYGT7N2im1AOmakHj6qPNlFwD4xW4fCoiRO9ErNpSHyMKmJ
         2e9ZN7TydDbVEcDyU8ayE9jNcg9gJ6kdDsWxrsSEiNStrHETOFycBxt2cebfL2sJUB3y
         6PnMk4FZ9ZeElM649xiV99FhY/vGiHCO9BAZmq1O/hGeznwOm8Yi+4xXrbg/+NRFFVms
         652mVy7j2zKgkfnlU1ZQZZu6MaXISmYuwtPynFqvOjXQcM65dB0ZT4+YAxwMWNJqJdTN
         ISbg==
X-Gm-Message-State: AOAM531py0ivphXd/TGEkJG1e6js/FsTgx3pZsI1PAzfW+Ddx/PFXRmT
	op4uC0ON0Ish35GnFRkolphGcWdR5533OMDgMqo/CQ==
X-Google-Smtp-Source: ABdhPJxIJIf+iUPRUnKiaWp7NYCsg3V9hISC8jr8evbeUYGek/drbWuaaTfez4YjoAzWOLKPjRy6n2jWFR+qxjU7ewk=
X-Received: by 2002:a2e:6e0c:: with SMTP id j12mr625564ljc.92.1644935580518;
 Tue, 15 Feb 2022 06:33:00 -0800 (PST)
MIME-Version: 1.0
References: <87h79bgd1m.fsf@linaro.org> <alpine.DEB.2.22.394.2202071419270.2091381@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2202071419270.2091381@ubuntu-linux-20-04-desktop>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 15 Feb 2022 15:32:48 +0100
Message-ID: <CAKfTPtB1ONsxA1Rch8AO+UrPRZsHrCgF1_-F-kh9U_Xu2M47aA@mail.gmail.com>
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

Hi Stefano,

On Tue, 8 Feb 2022 at 01:16, Stefano Stabellini
<stefano.stabellini@xilinx.com> wrote:
>
> On Mon, 7 Feb 2022, Alex Benn=C3=A9e wrote:
> > Hi Stefano,
> >
> > Vincent gave an update on his virtio-scmi work at the last Stratos sync
> > call and the discussion moved onto next steps.
>
> Hi Alex,
>
> I don't know the specifics of virtio-scmi, but if it is about power,
> clocks, reset, etc. like the original SCMI protocol, then virtio-scmi is

virtio-scmi is one transport channel that support SCMI protocol

> likely going to be very different from all the other virtio frontends

The virtio-scmi front-end is merged mainline

> and backends. That's because SCMI requires a full view of the system,
> which is different from something like virtio-net that is limited to the
> emulation of 1 device. For this reason, it is likely that the
> virtio-scmi backend would be a better fit in Xen itself, rather than run
> in userspace inside a VM.

Not sure what you mean when you say that SCMI requires a full view of
the system. If you are referring to the system wide resources which
reset or power up/down the whole SoC, this is not really what we are
targeting here. Those system wide resources should already be handled
by a dedicated power coprocessor. In our case, the IPs of the SoC will
be handled by different VMs but those IPs are usually sharing common
resources like a parent PLL , a power domain or a clock gating reg as
few examples. Because all those VMs can't directly set these resources
without taking into account others and because the power coprocessor
doesn't have an unlimited number of channels, we add an SCMI backend
that will gather and proxy the VM request before accessing the
register that gates some clocks IP as an example or before powering
down an external regulator shared between the camera and another
device. This SCMI backend will most probably also send request with
OSPM permission access to the power coprocessor once aggregating all
the VMs ' request
We are using virtio-cmi protocol because it has the main advantage of
not being tied to an hypervisor

In our PoC, the SCMI backend is running with zehyr and reuse the same
software that can run in the power coprocessor which helps splitting
what is critical and must be handled by power coprocessor and what is
not critical for the system (what is usually managed by linux directly
when their no hypervisor involved typically)

>
> FYI, a good and promising approach to handle both SCMI and SCPI is the
> series recently submitted by EPAM to mediate SCMI and SCPI requests in
> Xen: https://marc.info/?l=3Dxen-devel&m=3D163947444032590
>
> (Another "special" virtio backend is virtio-iommu for similar reasons:
> the guest p2m address mappings and also the IOMMU drivers are in Xen.
> It is not immediately clear whether a virtio-iommu backend would need to
> be in Xen or run as a process in dom0/domU.)
>
> On the other hand, for all the other "normal" protocols (e.g.
> virtio-net, virtio-block, etc.) the backend would naturally run as a
> process in dom0 or domU (e.g. QEMU in Dom0) as one would expect.
>
>
> > Currently the demo setup
> > is intermediated by a double-ended vhost-user daemon running on the
> > devbox acting as a go between a number of QEMU instances representing
> > the front and back-ends. You can view the architecture with Vincents
> > diagram here:
> >
> >   https://docs.google.com/drawings/d/1YSuJUSjEdTi2oEUq4oG4A9pBKSEJTAp6h=
hcHKKhmYHs/edit?usp=3Dsharing
> >
> > The key virtq handling is done over the special carve outs of shared
> > memory between the front end and guest. However the signalling is
> > currently over a virtio device on the backend. This is useful for the
> > PoC but obviously in a real system we don't have a hidden POSIX system
> > acting as a go between not to mention the additional latency it causes
> > with all those context switches.
> >
> > I was hoping we could get some more of the Xen experts to the next
> > Stratos sync (17th Feb) to go over approaches for a properly hosted on
> > Xen approach. From my recollection (Vincent please correct me if I'm
> > wrong) of last week the issues that need solving are:
>
> Unfortunately I have a regular conflict which prevents me from being
> able to join the Stratos calls. However, I can certainly make myself
> available for one call (unless something unexpected comes up).
>
>
> >  * How to handle configuration steps as FE guests come up
> >
> > The SCMI server will be a long running persistent backend because it is
> > managing real HW resources. However the guests may be ephemeral (or jus=
t
> > restarted) so we can't just hard-code everything in a DTB. While the
> > virtio-negotiation in the config space covers most things we still need
> > information like where in the guests address space the shared memory
> > lives and at what offset into that the queues are created. As far as I'=
m
> > aware the canonical source of domain information is XenStore
> > (https://wiki.xenproject.org/wiki/XenStore) but this relies on a Dom0
> > type approach. Is there an alternative for dom0less systems or do we
> > need a dom0-light approach, for example using STR-21 (Ensure Zephyr can
> > run cleanly as a Dom0 guest) providing just enough services for FE's to
> > register metadata and BE's to read it?
>
> I'll try to answer the question for a generic virtio frontend and
> backend instead (not SCMI because SCMI is unique due to the reasons
> above.)
>
> Yes, xenstore is the easiest way to exchange configuration information
> between domains. I think EPAM used xenstore to exchange the
> configuration information in their virtio-block demo. There is a way to
> use xenstore even between dom0less VMs:
> https://marc.info/?l=3Dxen-devel&m=3D164340547602391 Not just xenstore bu=
t
> full PV drivers too. However, in the dom0less case xenstore is going to
> become available some time after boot, not immediately at startup time.
> That's because you need to wait until xenstored is up and running.
>
> There are other ways to send data from one VM to another which are
> available immediately at boot, such as Argo and static shared memory.
>
> But dom0less is all about static partitioning, so it makes sense to
> exploit the build-time tools to the fullest. In the dom0less case, we
> already know what is going to run on the target before it is even turned
> on. As an example, we might have already prepared an environment with 3
> VMs using Yocto and ImageBuilder. We could also generate all
> configurations needed and place them inside each VMs using Yocto's
> standard tools and ImageBuilder. So for dom0less, I recommend to go via
> a different route and pre-generate the configuration directly where
> needed instead of doing dynamic discovery.
>
>
> >  * How to handle mapping of memory
> >
> > AIUI the Xen model is the FE guest explicitly makes grant table request=
s
> > to expose portions of it's memory to other domains. Can the BE query th=
e
> > hypervisor itself to discover the available grants or does it require
> > coordination with Dom0/XenStore for that information to be available to
> > the BE domain?
>
> Typically the frontend passes grant table references to the backend
> (i.e. instead of plain guest physical addresses on the virtio ring.)
> Then, the backend maps the grants; Xen checks that the mapping is
> allowed.
>
> We might be able to use the same model with virtio devices. A special
> pseudo-IOMMU driver in Linux would return a grant table reference and an
> offset as "DMA address". The "DMA address" is passed to the virtio
> backend over the virtio ring. The backend would map the grant table
> reference using the regular grant table hypercalls.
>
>
> >  * How to handle signalling
> >
> > I guess this requires a minimal implementation of the IOREQ calls for
> > Zephyr so we can register the handler in the backend? Does the IOREQ AP=
I
> > allow for a IPI style notifications using the global GIC IRQs?
> >
> > Forgive the incomplete notes from the Stratos sync, I was trying to typ=
e
> > while participating in the discussion so hopefully this email captures
> > what was missed:
> >
> >   https://linaro.atlassian.net/wiki/spaces/STR/pages/28682518685/2022-0=
2-03+Project+Stratos+Sync+Meeting+Notes
>
> Yes, any emulation backend (including virtio backends) would require an
> IOREQ implementation, which includes notifications via event channels.
> Event channels are delivered as a GIC PPI interrupt to the Linux kernel.
> Then, the kernel sends the notification to userspace via a file
> descriptor.

