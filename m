Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FB62316B3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 02:22:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Zpi-0007Ke-V4; Wed, 29 Jul 2020 00:20:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uy70=BI=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1k0Zph-0007KZ-6Q
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 00:20:33 +0000
X-Inumbo-ID: 4fac5cd6-d131-11ea-a968-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4fac5cd6-d131-11ea-a968-12813bfff9fa;
 Wed, 29 Jul 2020 00:20:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B93A1FB;
 Tue, 28 Jul 2020 17:20:30 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9A513F71F;
 Tue, 28 Jul 2020 17:20:29 -0700 (PDT)
From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Subject: Re: dom0 LInux 5.8-rc5 kernel failing to initialize cooling maps for
 Allwinner H6 SoC
To: Christopher Clark <christopher.w.clark@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CA+wirGqXMoRkS-aJmfFLipUv8SdY5LKV1aMrF0yKRJQaMvzs6Q@mail.gmail.com>
 <1c5cee83-295e-cc02-d018-b53ddc6e3590@xen.org>
 <CA+wirGpFvLBzYRBaq8yspJj8j9-yoLwN88bt079qM5yqPTwtcA@mail.gmail.com>
 <02b630bd-22e0-afde-6784-be068d0948ae@arm.com>
 <CA+wirGoG+im2mwb2ye6j4MpcVtfQ-prhhmVgdBTosus7hjeu=w@mail.gmail.com>
 <e091c32f-d121-d549-a2fa-f906d28ff8f1@arm.com>
 <alpine.DEB.2.21.2007281054520.646@sstabellini-ThinkPad-T480s>
 <CACMJ4GYWBNV5O4otbDj2Lx3Qq6sFPWm8bX4CRABEU3g1izQraQ@mail.gmail.com>
Autocrypt: addr=andre.przywara@arm.com; prefer-encrypt=mutual; keydata=
 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
 i4aIXCH3Wv6K
Organization: ARM Ltd.
Message-ID: <6b55a50a-70c1-991b-d780-f6829b0c87e8@arm.com>
Date: Wed, 29 Jul 2020 01:18:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACMJ4GYWBNV5O4otbDj2Lx3Qq6sFPWm8bX4CRABEU3g1izQraQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alejandro <alejandro.gonzalez.correo@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/07/2020 19:52, Christopher Clark wrote:

Hi Christopher,

wow, this quickly got out of hand. I never meant to downplay anyone's
work here, but on this particular platform some things might look a bit
different than normal. See below.

> On Tue, Jul 28, 2020 at 11:16 AM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>>
>> On Tue, 28 Jul 2020, André Przywara wrote:
>>> On 28/07/2020 11:39, Alejandro wrote:
>>>> Hello,
>>>>
>>>> El dom., 26 jul. 2020 a las 22:25, André Przywara
>>>> (<andre.przywara@arm.com>) escribió:
>>>>> So this was actually my first thought: The firmware (U-Boot SPL) sets up
>>>>> some basic CPU frequency (888 MHz for H6 [1]), which is known to never
>>>>> overheat the chip, even under full load. So any concern from your side
>>>>> about the board or SoC overheating could be dismissed, with the current
>>>>> mainline code, at least. However you lose the full speed, by quite a
>>>>> margin on the H6 (on the A64 it's only 816 vs 1200(ish) MHz).
>>>>> However, without the clock entries in the CPU node, the frequency would
>>>>> never be changed by Dom0 anyway (nor by Xen, which doesn't even know how
>>>>> to do this).
>>>>> So from a practical point of view: unless you hack Xen to pass on more
>>>>> cpu node properties, you are stuck at 888 MHz anyway, and don't need to
>>>>> worry about overheating.
>>>> Thank you. Knowing that at least it won't overheat is a relief. But
>>>> the performance definitely suffers from the current situation, and
>>>> quite a bit. I'm thinking about using KVM instead: even if it does
>>>> less paravirtualization of guests,
>>>
>>> What is this statement based on? I think on ARM this never really
>>> applied, and in general whether you do virtio or xen front-end/back-end
>>> does not really matter.
> 
> When you say "in general" here, this becomes a very broad statement
> about virtio and xen front-end/back-ends being equivalent and
> interchangable, and that could cause some misunderstanding for a
> newcomer.
> 
> There are important differences between the isolation properties of
> classic virtio and Xen's front-end/back-ends -- and also the Argo
> transport. It's particularly important for Xen because it has
> priortized support for stronger isolation between execution
> environments to a greater extent than some other hypervisors. It is a
> critical differentiator for it. The importance of isolation is why Xen
> 4.14's headline feature was support for Linux stubdomains, upstreamed
> to Xen after years of work by the Qubes and OpenXT communities.

He was talking about performance. My take on this was that this seems to
go back to the old days, when Xen was considered faster because of
paravirt (vs. trap&emulate h/w in QEMU). And this clearly does not apply
anymore, and never really applied to ARM.

>>> IMHO any reasoning about performance just based
>>> on software architecture is mostly flawed (because it's complex and
>>> reality might have missed some memos ;-)
> 
> That's another pretty strong statement. Measurement is great, but
> maybe performance analysis that is informed and directed by an
> understanding of the architecture under test could potentially be more
> rigorous and persuasive than work done without it?

You seem to draw quite a lot from my statement. All I was saying that
modern systems are far too complex to reason about actual performance
based on some architectural ideas.
Also my statement was in response to some generic statement, but of
course in this particular context. Please keep in mind that we are
talking about a 5 US$ TV-box SoC here, basically a toy platform. The
chip has severe architectural issues (secure devices not being secure,
critical devices not being isolated). I/O probably means SD card at
about 25MB/s, the fastest I have seen is 80MB/s on some better (but
optional!) eMMC modules. DRAM is via a single channel 32bit path. The
cores are using an almost 8 year old energy-efficient
micro-architecture. So whether any clever architecture really
contributes to performance on this system is somewhat questionable.

So I was suggesting that before jumping to conclusions based on broad
architectural design ideas an actual reality check of whether those
really apply to the platform might be warranted.
Also I haven't seen what kind of performance he is actually interested
in. Is the task at hand I/O bound, memory bound, CPU bound?
The discussion so far was about the CPU clock frequency only.

>>> So just measure your particular use case, then you know.
> 
> Hmm.

Is this questioning the usefulness of actual performance measurement? He
seems to be after a particular setup, so keeping an eye on the *actual*
performance outcome seems quite reasonable to me.

>>>> I'm sure that the ability to use
>>>> the maximum frequency of the CPU would offset the additional overhead,
>>>> and in general offer better performance. But with KVM I lose the
>>>> ability to have individual domU's dedicated to some device driver,
>>>> which is a nice thing to have from a security standpoint.
>>>
>>> I understand the theoretical merits, but a) does this really work on
>>> your board and b) is this really more secure? What do you want to
>>> protect against?
>>
>> For "does it work on your board", the main obstacle is typically IOMMU
>> support to be able to do device assignment properly. That's definitely
>> something to check. If it doesn't work nowadays you can try to
>> workaround it by using direct 1:1 memory mappings [1].  However, for
>> security then you have to configure a MPU. I wonder if H6 has a MPU and
>> how it can be configured. In any case, something to keep in mind in case
>> the default IOMMU-based setup doesn't work for some reason for the
>> device you care about.

It's even worse: this SoC only provides platform devices, which all rely
on at least pinctrl, clocks and regulators to function. All of this
functionality is provided via centralised devices, probably controlled
by Dom0 (or just one domain, anyway). The MMC controller for instance
needs to adjust the SD bus clock to the storage array dynamically, which
requires to reprogram the CCU. So I don't see how a driver domain would
conceptually work, without solving the very same problems that we just
faced with cpufreq here.

And of course this device does not have an IOMMU worth mentioning: there
is some device with that name, but it mostly provides scatter-gather
support for the video and display devices *only*.
The MMC controller has its own built-in DMA controller, so it owns the
*whole* of memory, including Xen's very own one.

>> For "is this really more secure?", yes it is more secure as you are
>> running larger portions of the codebase in unprivileged mode and isolated
>> from each other with IOMMU (or MPU) protection. See what the OpenXT and
>> Qubes OS guys have been doing.
> 
> Yes. Both projects have done quite a lot of work to enable and
> maintain driver domains.

Which don't work here, see above. Besides, I was genuinely interested in
the actual threat model here. What do we expect to go wrong and how
would putting the driver in its own domain help? (while considering the
platform's limitations)

Cheers,
Andre

