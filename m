Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F1058FEC5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 17:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384668.620091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM9l2-0003AU-Hg; Thu, 11 Aug 2022 15:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384668.620091; Thu, 11 Aug 2022 15:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM9l2-00037l-E7; Thu, 11 Aug 2022 15:06:00 +0000
Received: by outflank-mailman (input) for mailman id 384668;
 Thu, 11 Aug 2022 15:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ia3o=YP=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oM9l0-00037e-R7
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 15:05:58 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a30c134-1987-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 17:05:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35337B82123
 for <xen-devel@lists.xenproject.org>; Thu, 11 Aug 2022 15:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE96C433C1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Aug 2022 15:05:54 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q30so21634801wra.11
 for <xen-devel@lists.xenproject.org>; Thu, 11 Aug 2022 08:05:54 -0700 (PDT)
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
X-Inumbo-ID: 1a30c134-1987-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660230354;
	bh=yKKaOYUKrifIPrRUrtxQh6ZRjjz6BisGvn5YGjkLbls=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UYoE2bk+tRiUqJfhbbugLO6JRDOi3P8f2SbDxHMwCmVmpotu2i6cpt8zHbdmcCZXG
	 4bzTu5F9GlaDJLzpxe7z15eUmvr/FxrwhtWBu0ZYRZvSO6cIttqojfo7mOASo+/CNs
	 pn7ae3RCROcPFJ2+ZnYbBlpCyY7gZnZWCU3uj7HO6C70O03FArQcOrOvo2kuBaBbZU
	 P34stAUeZUWG4ZE3LVCCYwPHKM1fTxJlL/9RpTie3VgkByxIIMYXR/b1iXEZFJpKxi
	 QWug4N2wlazGxQMLRfqNAFQy82UUleGvVzg0krkmObbT4ONHJc5C7dpUmZIew/CIG1
	 r1Kipz9hgrXtg==
X-Gm-Message-State: ACgBeo31ZyR9KVnGoyu27iaQZxTVpRf5cyMStRhdCtvnCfrqfoZBw+fA
	hklnQrm/WUfN7yepgFa/hJJDBLZ2OkWzX8AuQu4=
X-Google-Smtp-Source: AA6agR5hGh2rrGWzyVcuKHPvIT0Fs9py0KLfZqb5kS98qufoMWbqCba+sGvY9JMXix8pHTbSRHokf9S1KSC0hqFZ3XY=
X-Received: by 2002:adf:d238:0:b0:21e:c972:7505 with SMTP id
 k24-20020adfd238000000b0021ec9727505mr20869668wrh.536.1660230352569; Thu, 11
 Aug 2022 08:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220804081253.GA1219098@leoy-ThinkPad-X240s> <D6DDAE40-A8EF-4230-A292-401FBA085EE0@arm.com>
 <EA8A294E-856D-4579-B26E-55F6B7EB477C@arm.com> <20220811141707.GB868014@leoy-huanghe.lan>
 <26D200AA-0CCF-4778-A748-36CE448C6AB9@arm.com>
In-Reply-To: <26D200AA-0CCF-4778-A748-36CE448C6AB9@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 11 Aug 2022 17:05:41 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG_koV05iMEX9NgibdLNqVxB-2kwUj+bMXD-2CToQgn3g@mail.gmail.com>
Message-ID: <CAMj1kXG_koV05iMEX9NgibdLNqVxB-2kwUj+bMXD-2CToQgn3g@mail.gmail.com>
Subject: Re: Question: Enable LINUX_EFI_MEMRESERVE_TABLE_GUID in EFI
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "leo.yan@linaro.org" <leo.yan@linaro.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Jerome Forissier <jerome.forissier@linaro.org>, 
	Marc Zyngier <maz@kernel.org>, Rahul Singh <Rahul.Singh@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Aug 2022 at 16:59, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>
> Hi Leon,
>
> > On 11 Aug 2022, at 15:17, Leo Yan <leo.yan@linaro.org> wrote:
> >
> > Hi Bertrand, Rahul,
> >
> > On Fri, Aug 05, 2022 at 12:05:23PM +0000, Bertrand Marquis wrote:
> >>> On 5 Aug 2022, at 12:44, Rahul Singh <Rahul.Singh@arm.com> wrote:
> >
> > [...]
> >
> >>>> Looked into the code, the GICv3 driver tries to create persistent
> >>>> reservations for pending pages, and the persistent reservation table
> >>>> can be used by kexec/kdump.  For the persistent reservations, it
> >>>> relies on MEMRESERVE EFI configuration table, but this table is not
> >>>> supported by xen.efi, I think this is the reason for the above oops.
> >>>
> >>> Yes, you are right above warning is observed because Xen does not support
> >>> memreserve efi table. I also observed a similar warning on the N1SDP board.
> >>>>
> >>>> I checked that if I boot a host Linux (without Xen), then the EFI has
> >>>> provided MEMRESERVE configuration table, I can get below log:
> >>>>
> >>>> #  dmesg | grep MEMRESERVE
> >>>> [    0.000000] efi: TPMFinalLog=0x807f9ef0000 ACPI 2.0=0x807fa0d0018 ... MEMRESERVE=0x807f8141e98
> >>>>
> >>>> Just want to confirm, is anyone working on enabling MEMRESERVE EFI
> >>>> configuration table for Xen?  And welcome any comments and
> >>>> suggestions!
> >>>>
> >>
> >> No I do not think anybody is working on this at the moment.
> >> If you want to work on adding support for this in Xen, we can provide support
> >> and help on reviewing and testing as we have several targets on which we
> >> observe this (N1SDP and Ava).
> >
> > Thanks for your quick response.
> >
> > I took time to look into the code, below are my conclusions.
> >
> > For a normal UEFI boot flow, UEFI will invoke Linux kernel's EFI stub,
> > and the EFI stub will install MEMRESERVE EFI configuration table.
> > This is accomplished in the Linux function install_memreserve_table().
> >
> > Secondly, Xen passes DT to kernel, it synthesizes ACPI compatible
> > nodes in the device tree and finally kernel parses DT and create the
> > ACPI table.  In this case, Xen doesn't invoke Linux EFI stub.
> >
> > To be honest, I have very less knowledge for Xen and APCI; just based on
> > reading code, I think it's hard for Xen to invoke Linux kernel's EFI
> > stub, this is because Xen needs to provide the EFI runtime services, and
> > I don't think it's feasible for Xen to pass through UEFI's runtime
> > service to Linux kernel.  If we implement the EFI runtime services for
> > Xen, then this would introduce a big implementation.
> >
> > So another option is we simply add MEMRESERVE EFI configuration table
> > into device tree, just like Xen does for other ACPI tables (e.g.
> > RSDP?).  And then in Linux kernel, we need to parse the DT binding and
> > initialize the corresponding variables in kernel, so we need to add
> > support in the Linux source drivers/firmware/efi/fdtparams.c.
> >
> > Before I proceed, just want to check which option would be the right
> > way to move forward?  And I am open for any other solution and welcome
> > suggestions.
>
> When Xen is started using EFI, Linux is then started purely using device tree
> there is a standard way to define reserved memory to linux using the device
> tree and Xen should decode the Memreserve entry from EFI and add the
> corresponding entry in the device tree that we give to linux.
>

This is not what MEMRESERVE is used for. Specifying reservations for
the current boot is straight-forward. What MEMRESERVE does is specify
a reservation that survives kexec and is passed on to the next
kernel(s), as the table is anchored in a structure that is created by
the EFI stub on the first boot. This is needed for the GICv3 on some
platforms, as memory that Linux reserves for its interrupt tables can
never be released again, even across kexec, which means that the GICv3
will be DMA'ing into that memory if the kexec kernel wants it or not)

I'd strongly recommend against doing any of the things Xen does for
ACPI boot today: both the ACPI spec and the kernel documentation about
ACPI support in the arm64 port is 100% clear that EFI boot is the only
supported boot method. Issues like this one would have never popped up
if those rules were adhered to. (/pedantic mode off)

In your case, this is a matter of allocating a structure of the right
type and size, and making it available via the configuration table
array in the EFI system table that the dom0 kernel receives from Xen
at boot.

Please don't add DT entries for this - we should be able to cover this
using the existing pseudo-EFI boot flow that Xen uses today.

-- 
Ard.

