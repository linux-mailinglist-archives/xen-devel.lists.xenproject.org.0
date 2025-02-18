Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A5BA390E0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 03:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891018.1300120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkDTC-0005B5-Qd; Tue, 18 Feb 2025 02:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891018.1300120; Tue, 18 Feb 2025 02:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkDTC-00059Z-Kk; Tue, 18 Feb 2025 02:36:22 +0000
Received: by outflank-mailman (input) for mailman id 891018;
 Tue, 18 Feb 2025 02:36:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qrz8=VJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkDTB-00059T-UB
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 02:36:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 217a8b60-eda1-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 03:36:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4F485C5982;
 Tue, 18 Feb 2025 02:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E194C4CED1;
 Tue, 18 Feb 2025 02:36:15 +0000 (UTC)
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
X-Inumbo-ID: 217a8b60-eda1-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739846176;
	bh=pACt4KoucGGuBXlpBtm9vCYM0blIKGrZSpoJqZkC/1w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=etjNqBdwvLRtVS1iBR2Z4fzGHywyu2CY0kgdmVB0nkV9/MsTVA+pjEy6FS4XTZMsM
	 Oa0wCqt4UBDsvkPtlpvndML2ErfKr8SoJGGZGDnfEU24j5iOwhxwsUtJ1LyciPFJvP
	 zEes3srHZ6/Y+5xt8iGszUXCyrq7jVAntMaXgEFHtJ/915delK83bLGjN/oiqj2b7d
	 61CpE3dfx2IwqgG1VieohISv2kpuUlg0G/XnYL9dggo+0tlYZRVznQRshVRhbBKN36
	 mA4M2yGEvbn575u8pd2sMpI1YaEMh5X/5U/UfvGkoZU6hSykMFsmBBSGPZ637461aE
	 85iVlLdK2Hi4g==
Date: Mon, 17 Feb 2025 18:36:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Oleksandr Andrushchenko <andr2000@gmail.com>, sstabellini@kernel.org, 
    Artem_Mygaiev@epam.com, Luca.Fancellu@arm.com, roger.pau@citrix.com, 
    marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
In-Reply-To: <4f1fcad5-dd6c-471f-9496-023973fa8857@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502171833370.1085376@ubuntu-linux-20-04-desktop>
References: <20250216102108.2665222-1-andr2000@gmail.com> <4f1fcad5-dd6c-471f-9496-023973fa8857@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Feb 2025, Jan Beulich wrote:
> On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
> > 1. Const string arrays reformatting
> > In case the length of items change we might need to introduce a bigger
> > change wrt new formatting of unaffected lines
> > ==============================================================================
> > 
> > --- a/xen/drivers/acpi/tables.c
> > +++ b/xen/drivers/acpi/tables.c
> > @@ -38,10 +38,10 @@
> > -static const char *__initdata
> > -mps_inti_flags_polarity[] = { "dfl", "high", "res", "low" };
> > -static const char *__initdata
> > -mps_inti_flags_trigger[] = { "dfl", "edge", "res", "level" };
> > +static const char *__initdata mps_inti_flags_polarity[] = { "dfl", "high",
> > +                                                            "res", "low" };
> > +static const char *__initdata mps_inti_flags_trigger[] = { "dfl", "edge", "res",
> > 
> > --- a/xen/drivers/acpi/utilities/utglobal.c
> > +++ b/xen/drivers/acpi/utilities/utglobal.c
> >  static const char *const acpi_gbl_region_types[ACPI_NUM_PREDEFINED_REGIONS] = {
> > -	"SystemMemory",
> > -	"SystemIO",
> > -	"PCI_Config",
> > -	"EmbeddedControl",
> > -	"SMBus",
> > -	"CMOS",
> > -	"PCIBARTarget",
> > -	"DataTable"
> > +    "SystemMemory", "SystemIO", "PCI_Config",   "EmbeddedControl",
> > +    "SMBus",        "CMOS",     "PCIBARTarget", "DataTable"
> >  };
> 
> Why in the world would a tool need to touch anything like the two examples
> above? My take is that the code is worse readability-wise afterwards.

I think the output is acceptable: not necessarily better than before,
but also not significantly worse. To me, the main takeaway is that there
are many unavoidable but unnecessary changes.

