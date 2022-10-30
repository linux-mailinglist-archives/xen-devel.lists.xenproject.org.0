Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB41612AF6
	for <lists+xen-devel@lfdr.de>; Sun, 30 Oct 2022 15:25:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432545.685257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1op9EP-0001gi-DG; Sun, 30 Oct 2022 14:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432545.685257; Sun, 30 Oct 2022 14:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1op9EP-0001eS-AY; Sun, 30 Oct 2022 14:24:09 +0000
Received: by outflank-mailman (input) for mailman id 432545;
 Sun, 30 Oct 2022 14:24:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oc5E=27=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1op9EN-0001eM-U4
 for xen-devel@lists.xenproject.org; Sun, 30 Oct 2022 14:24:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81f613b4-585e-11ed-91b5-6bf2151ebd3b;
 Sun, 30 Oct 2022 15:24:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73FC660EC0;
 Sun, 30 Oct 2022 14:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EBBC433D6;
 Sun, 30 Oct 2022 14:24:00 +0000 (UTC)
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
X-Inumbo-ID: 81f613b4-585e-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667139843;
	bh=jBziqfMkA2cHOCnx8zVMCzIoTtSw4yBB9eg3zJ8ftl0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZV7EOqslGRFszYUY8yMyJK35f9Ddkj1nLEEA7S9SyTpUPM2B52Te5+wzf2tIn5L07
	 fEserVZfrVAPwM3vXPnaojwVi8a7+Emwf0v1miaJyppTUYxUvY1tqeQEUG9TpJLXQA
	 z8jZA5jvHJPE/u+hu5aOcHYlNp1JJk6SVoytwQG3vNmwOY565mArCsUwoID3Y+T5Gi
	 nURB9mwa0Xf8R362SMZ9Lqq3aeftKn7HNp3NxjCSwkErPhG2qfL9MdiLluQa0EGqxK
	 uor9950GjmnBUYynPT+UbIuu9qC0Z0iA6/znMfvaWt9P9DKGNqLR3QTK16urSLWCQl
	 HiEgUDtRi+Htw==
Date: Sun, 30 Oct 2022 15:23:55 +0100 (CET)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    Xen developer discussion <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <Michal.Orzel@arm.com>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
In-Reply-To: <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
Message-ID: <alpine.DEB.2.22.394.2210301523450.3408@ubuntu-linux-20-04-desktop>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com> <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org> <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com> <60b9cc07-c0ec-756b-802b-5fc96f253dbf@xen.org> <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
 <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org> <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com> <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org> <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com> <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-376676523-1667138621=:3408"
Content-ID: <alpine.DEB.2.22.394.2210301503490.3408@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-376676523-1667138621=:3408
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2210301503491.3408@ubuntu-linux-20-04-desktop>

On Fri, 28 Oct 2022, Julien Grall wrote:
> On 28/10/2022 14:13, Bertrand Marquis wrote:
> > > On 28 Oct 2022, at 14:06, Julien Grall <julien@xen.org> wrote:
> > > 
> > > Hi Rahul,
> > > 
> > > On 28/10/2022 13:54, Rahul Singh wrote:
> > > > > > > > > For ACPI, I would have expected the information to be found in
> > > > > > > > > the IOREQ.
> > > > > > > > > 
> > > > > > > > > So can you add more context why this is necessary for
> > > > > > > > > everyone?
> > > > > > > > We have information for IOMMU and Master-ID but we don’t have
> > > > > > > > information for linking vMaster-ID to pMaster-ID.
> > > > > > > 
> > > > > > > I am confused. Below, you are making the virtual master ID
> > > > > > > optional. So shouldn't this be mandatory if you really need the
> > > > > > > mapping with the virtual ID?
> > > > > > vMasterID is optional if user knows pMasterID is unique on the
> > > > > > system. But if pMasterId is not unique then user needs to provide
> > > > > > the vMasterID.
> > > > > 
> > > > > So the expectation is the user will be able to know that the pMasterID
> > > > > is uniq. This may be easy with a couple of SMMUs, but if you have 50+
> > > > > (as suggested above). This will become a pain on larger system.
> > > > > 
> > > > > IHMO, it would be much better if we can detect that in libxl (see
> > > > > below).
> > > > We can make the vMasterID compulsory to avoid complexity in libxl to
> > > > solve this
> > > 
> > > In general, complexity in libxl is not too much of problem.

I agree with this and also I agree with Julien's other statement:

"I am strongly in favor of libxl to modify it if it greatly improves the
user experience."

I am always in favor of reducing complexity for the user as they
typically can't deal with tricky details such as MasterIDs. In general,
I think we need more automation with our tooling.

However, it might not be as simple as adding support for automatically
generating IDs in libxl because we have 2 additional cases to support:
1) dom0less
2) statically built guests

For 1) we would need the same support also in Xen? Which means more
complexity in Xen.

2) are guests like Zephyr that consume a device tree at
build time instead of runtime. These guests are built specifically for a
given environment and it is not a problem to rebuild them for every Xen
release.

However I think it is going to be a problem if we have to run libxl to
get the device tree needed for the Zephyr build. That is because it
means that the Zephyr build system would have to learn how to compile
(or crosscompile) libxl in order to retrieve the data needed for its
input. Even for systems based on Yocto (Yocto already knows how to build
libxl) would cause issues because of internal dependencies this would
introduce.

So I think the automatic generation might be best done in another tool.

I think we need something like a script that takes a partial device tree
as input and provides a more detailed partial device tree as output with
the generated IDs.

If we did it that way, we could call the script from libxl, but also we
could call it separately from ImageBuilder for dom0less and Zephyr/Yocto
could also call it.

Basically we make it easier for everyone to use it. The only price to
pay is that it will be a bit less efficient for xl guests (one more
script to fork and exec) but I think is a good compromise.

Another advantage is that in fully static workflows we could call the
script ahead of time (e.g. from Lopper/ImageBuilder) and still have full
knowledge of the device tree of all the guests which is great from a
safety perspective.


> > I am a bit unsure about this strategy.
> > Currently xl has one configuration file where you put all Xen parameters.
> > The device tree is only needed by some guests to have a description of the
> > system they run on.
> > If we change the model and say that Xen configuration parameters are both in
> > the configuration and the device tree, we somehow enforce to have a device
> > tree even though some guests do not need it at all (for example Zephyr).
> 
> I think my approach was misunderstood because there is no change in the
> existing model.
> 
> What I am suggesting is to not introduce iommu_devid_map but instead let libxl
> allocate the virtual Master-ID and create the mapping with the physical
> Master-ID.
>
> Libxl would then update the property "iommus" in the device-tree with the
> allocated virtual Master-ID.
> 
> Each node in the partial device-tree would need to have a property
> to refer to the physical device just so we know how to update the "iommus".
> The list of device passthrough will still be specified in the configuration
> file. IOW, the partial device-tree is not directly involved in the
> configuration of the guest.
> 
> So far, I don't see a particular issue with this approach because the vMaster
> ID algorithm allocation should be generic. But please let me know if you think
> there are bits I am missing.
>
> For everything else we let the user in control (IPA for mapping, virtual interrupt number) and in this case we switch to a model where we
> automatically generated a vMaster ID.

I think this is a great idea, I only suggest that we move the automatic
generation out of libxl (a separate stand-alone script), in another
place that can be more easily reused by multiple projects and different
use-cases.
--8323329-376676523-1667138621=:3408--

