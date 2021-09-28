Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8405341A613
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 05:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197372.350395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV3pT-0003In-FK; Tue, 28 Sep 2021 03:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197372.350395; Tue, 28 Sep 2021 03:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV3pT-0003GB-CR; Tue, 28 Sep 2021 03:30:51 +0000
Received: by outflank-mailman (input) for mailman id 197372;
 Tue, 28 Sep 2021 03:30:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2A=OS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mV3pR-0003G4-WF
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 03:30:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b534ac8-b758-4c59-84d7-2630518686dc;
 Tue, 28 Sep 2021 03:30:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 816C161052;
 Tue, 28 Sep 2021 03:30:47 +0000 (UTC)
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
X-Inumbo-ID: 4b534ac8-b758-4c59-84d7-2630518686dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632799847;
	bh=wMBJSK3gpANuVYGHFbqZg2iREsk5ctDlTZuA9ErKpxI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EQVE3HGbAOxB3aYSrPhi1Lc84XXb1dvkfE07vHPbZAu1mHjC6QIvE98Su+r/3U4+e
	 5pJX8NWR+/6u0rEIsldYIuH34Gi2ZL8aitYYnaGR+zaEiJ1JRkt9bvOjnWo1t7R7Jv
	 Ox5g9ItYuQDgdQqfQDaPjjG/wck4iCQGORWhPAd9Bi7i/oScDsRq6mKDRmoqv0dY3N
	 pEPFOllq77IRqq88VMly6q+viSuuaa0ZoOVRPk2lfNzKaEbRP9WGDKwuldqWHi619b
	 ui4G85FRPTAHfzFAiFbV8qR1MgfTfINLHmGBKk5JK07NHO1zCjiKYNBS8V1l6Ty+ZG
	 JsgbBC2PIQLgA==
Date: Mon, 27 Sep 2021 20:30:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall.oss@gmail.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable
 NUMA
In-Reply-To: <DB9PR08MB6857EB6600193CCB7B77ECC39EA89@DB9PR08MB6857.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2109272030380.5022@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-37-wei.chen@arm.com> <alpine.DEB.2.21.2109232029450.17979@sstabellini-ThinkPad-T480s> <56e0cc0e-7405-74b0-eb4b-07cd9cdae225@arm.com> <alpine.DEB.2.21.2109241237210.17979@sstabellini-ThinkPad-T480s>
 <4e6f7222-59c8-7853-cf2c-076620efa244@suse.com> <CAJ=z9a1wOd6Hct50O_3B5q3o-bvhgMFy+A95gYMPfz-YL8uFDQ@mail.gmail.com> <42eb1303-1b45-5489-eac3-855f4ab35eb5@suse.com> <alpine.DEB.2.21.2109271006480.5022@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857EB6600193CCB7B77ECC39EA89@DB9PR08MB6857.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-487226256-1632799847=:5022"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-487226256-1632799847=:5022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 28 Sep 2021, Wei Chen wrote:
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Sent: 2021年9月28日 1:17
> > To: Jan Beulich <jbeulich@suse.com>
> > Cc: Julien Grall <julien.grall.oss@gmail.com>; Stefano Stabellini
> > <sstabellini@kernel.org>; Wei Chen <Wei.Chen@arm.com>; xen-devel <xen-
> > devel@lists.xenproject.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>
> > Subject: Re: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to
> > enable NUMA
> > 
> > On Mon, 27 Sep 2021, Jan Beulich wrote:
> > > On 27.09.2021 10:45, Julien Grall wrote:
> > > > On Mon, 27 Sep 2021, 10:33 Jan Beulich, <jbeulich@suse.com> wrote:
> > > >
> > > >> On 24.09.2021 21:39, Stefano Stabellini wrote:
> > > >>> On Fri, 24 Sep 2021, Wei Chen wrote:
> > > >>>> On 2021/9/24 11:31, Stefano Stabellini wrote:
> > > >>>>> On Thu, 23 Sep 2021, Wei Chen wrote:
> > > >>>>>> --- a/xen/arch/arm/Kconfig
> > > >>>>>> +++ b/xen/arch/arm/Kconfig
> > > >>>>>> @@ -34,6 +34,17 @@ config ACPI
> > > >>>>>>      Advanced Configuration and Power Interface (ACPI) support
> > for
> > > >> Xen is
> > > >>>>>>      an alternative to device tree on ARM64.
> > > >>>>>>   + config DEVICE_TREE_NUMA
> > > >>>>>> +  def_bool n
> > > >>>>>> +  select NUMA
> > > >>>>>> +
> > > >>>>>> +config ARM_NUMA
> > > >>>>>> +  bool "Arm NUMA (Non-Uniform Memory Access) Support
> > (UNSUPPORTED)"
> > > >> if
> > > >>>>>> UNSUPPORTED
> > > >>>>>> +  select DEVICE_TREE_NUMA if HAS_DEVICE_TREE
> > > >>>>>
> > > >>>>> Should it be: depends on HAS_DEVICE_TREE ?
> > > >>>>> (And eventually depends on HAS_DEVICE_TREE || ACPI)
> > > >>>>>
> > > >>>>
> > > >>>> As the discussion in RFC [1]. We want to make ARM_NUMA as a generic
> > > >>>> option can be selected by users. And depends on has_device_tree
> > > >>>> or ACPI to select DEVICE_TREE_NUMA or ACPI_NUMA.
> > > >>>>
> > > >>>> If we add HAS_DEVICE_TREE || ACPI as dependencies for ARM_NUMA,
> > > >>>> does it become a loop dependency?
> > > >>>>
> > > >>>>
> > > >> https://lists.xenproject.org/archives/html/xen-devel/2021-
> > 08/msg00888.html
> > > >>>
> > > >>> OK, I am fine with that. I was just trying to catch the case where a
> > > >>> user selects "ARM_NUMA" but actually neither ACPI nor
> > HAS_DEVICE_TREE
> > > >>> are selected so nothing happens. I was trying to make it clear that
> > > >>> ARM_NUMA depends on having at least one between HAS_DEVICE_TREE or
> > ACPI
> > > >>> because otherwise it is not going to work.
> > > >>>
> > > >>> That said, I don't think this is important because HAS_DEVICE_TREE
> > > >>> cannot be unselected. So if we cannot find a way to express the
> > > >>> dependency, I think it is fine to keep the patch as is.
> > > >>
> > > >> So how about doing things the other way around: ARM_NUMA has no
> > prompt
> > > >> and defaults to ACPI_NUMA || DT_NUMA, and DT_NUMA gains a prompt
> > instead
> > > >> (and, for Arm at least, ACPI_NUMA as well; this might even be
> > worthwhile
> > > >> to have on x86 down the road).
> > > >>
> > > >
> > > > As I wrote before, I don't think the user should say "I want to enable
> > NUMA
> > > > with Device-Tree or ACPI". Instead, they say whether they want to use
> > NUMA
> > > > and let Xen decide to enable the DT/ACPI support.
> > > >
> > > > In other word, the prompt should stay on ARM_NUMA.
> > >
> > > Okay. In which case I'm confused by Stefano's question.
> > 
> > Let me clarify: I think it is fine to have a single prompt for NUMA in
> > Kconfig. However, I am just pointing out that it is theoretically
> > possible with the current code to present an ARM_NUMA prompt to the user
> > but actually have no NUMA enabled at the end because both DEVICE TREE
> > and ACPI are disabled. This is only a theoretical problem because DEVICE
> > TREE support (HAS_DEVICE_TREE) cannot be disabled today. Also I cannot
> > imagine how a configuration with neither DEVICE TREE nor ACPI can be
> > correct. So I don't think it is a critical concern.
> > 
> > That said, you can see that, at least theoretically, ARM_NUMA depends on
> > either HAS_DEVICE_TREE or ACPI, so I suggested to add:
> > 
> > depends on HAS_DEVICE_TREE || ACPI
> > 
> > Wei answered that it might introduce a circular dependency, but I did
> > try the addition of "depends on HAS_DEVICE_TREE || ACPI" under ARM_NUMA
> > in Kconfig and everything built fine here.
> 
> Ok, I will add "depends on HAS_DEVICE_TREE" in next version, but "|| ACPI"
> will be later when we have ACPI NUMA for Arm : )

Good point :)
--8323329-487226256-1632799847=:5022--

