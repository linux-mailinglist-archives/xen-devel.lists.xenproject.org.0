Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF88923A4CF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 14:30:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2Zbv-00007x-LP; Mon, 03 Aug 2020 12:30:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPY3=BN=3mdeb.com=norbert.kaminski@srs-us1.protection.inumbo.net>)
 id 1k2Zbt-00007R-IF
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 12:30:33 +0000
X-Inumbo-ID: 1eb3501e-d585-11ea-908e-bc764e2007e4
Received: from 4.mo2.mail-out.ovh.net (unknown [87.98.172.75])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1eb3501e-d585-11ea-908e-bc764e2007e4;
 Mon, 03 Aug 2020 12:30:31 +0000 (UTC)
Received: from player796.ha.ovh.net (unknown [10.108.57.50])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 7CBEA1DE840
 for <xen-devel@lists.xenproject.org>; Mon,  3 Aug 2020 14:30:24 +0200 (CEST)
Received: from RCM-web4.webmail.mail.ovh.net (85-222-117-222.dynamic.chello.pl
 [85.222.117.222]) (Authenticated sender: norbert.kaminski@3mdeb.com)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 9F70714E43909;
 Mon,  3 Aug 2020 12:30:18 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 03 Aug 2020 14:30:18 +0200
From: norbert.kaminski@3mdeb.com
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: fwupd support under Xen - firmware updates with the UEFI capsule
In-Reply-To: <20200728221645.GO1626@mail-itl>
References: <497f1524-b57e-0ea1-5899-62f677bfae91@3mdeb.com>
 <39be665c-b6c8-23e3-b18b-d38cfe5c1286@suse.com>
 <bbe85f76-0999-1150-3d48-c7f9e1796dac@citrix.com>
 <20200728221645.GO1626@mail-itl>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <82c27cf6dd6dfac3fb5ce38b335fa997@3mdeb.com>
X-Sender: norbert.kaminski@3mdeb.com
X-Originating-IP: 85.222.117.222
X-Webmail-UserID: norbert.kaminski@3mdeb.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 243194383087999326
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrjeeggdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvffujghffgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpehnohhrsggvrhhtrdhkrghmihhnshhkihesfehmuggvsgdrtghomhenucggtffrrghtthgvrhhnpeevgffgfeffteeivdetffekkeefueevjeejvddvfedtfffhtdeikeffuedvveetgeenucffohhmrghinhepfehmuggvsgdrtghomhenucfkpheptddrtddrtddrtddpkeehrddvvddvrdduudejrddvvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeliedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehnohhrsggvrhhtrdhkrghmihhnshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.07.2020 00:16, Marek Marczykowski-Górecki wrote:
> On Tue, Jul 28, 2020 at 10:01:33PM +0100, Andrew Cooper wrote:
>> On 28/07/2020 21:00, Jan Beulich wrote:
>> > On 28.07.2020 09:41, Norbert Kaminski wrote:
>> >> I'm trying to add support for the firmware updates with the UEFI
>> >> capsule in
>> >> Qubes OS. I've got the troubles with reading ESRT (EFI System
>> >> Resource Table)
>> >> in the dom0, which is based on the EFI memory map. The EFI_MEMMAP is not
>> >> enabled despite the loaded drivers (CONFIG_EFI, CONFIG_EFI_ESRT) and
>> >> kernel
>> >> cmdline parameters (add_efi_memmap):
>> >>
>> >> ```
>> >> [    3.451249] efi: EFI_MEMMAP is not enabled.
>> >> ```
>> >
>> > It is, according to my understanding, a layering violation to expose
>> > the EFI memory map to Dom0. It's not supposed to make use of this
>> > information in any way. Hence any functionality depending on its use
>> > also needs to be implemented in the hypervisor, with Dom0 making a
>> > suitable hypercall to access this functionality. (And I find it
>> > quite natural to expect that Xen gets involved in an update of the
>> > firmware of a system.)
>> 
>> ERST is a table (read only by the looks of things) which is a 
>> catalogue
>> of various bits of firmware in the system, including GUIDs for
>> identification, and version information.
>> 
>> It is the kind of data which the hardware domain should have access 
>> to,
>> and AFAICT, behaves just like a static ACPI table.
>> 
>> Presumably it wants to an E820 reserved region so dom0 gets indent
>> access, and something in the EFI subsystem needs extending to pass the
>> ERST address to dom0.
> 
> I think most (if not all) pieces in Xen are already there - there is
> XENPF_firmware_info with XEN_EFW_EFI_INFO + XEN_FW_EFI_CONFIG_TABLE
> that gives address of the EFI config table. Linux saves it in
> efi_systab_xen.tables (arch/x86/xen/efi.c:xen_efi_probe().
> I haven't figured out yet if it does anything with that information, 
> but
> the content of /sys/firmware/efi/systab suggests it does.
> 
> It seems ESRT driver in Linux uses memmap just for some sanity checks
> (if the ESRT points at memory with EFI_MEMORY_RUNTIME and appropriate
> type). Perhaps the check (if really necessary) can be added to Xen and
> in case of dom0 simply skipped in Linux.
> 
> Norbert, if you're brave enough ;) I would suggests trying the (Linux)
> patch below:
> 
> -----8<-----
> diff --git a/drivers/firmware/efi/esrt.c b/drivers/firmware/efi/esrt.c
> index e3d692696583..a2a5ccbb00a8 100644
> --- a/drivers/firmware/efi/esrt.c
> +++ b/drivers/firmware/efi/esrt.c
> @@ -245,13 +245,14 @@ void __init efi_esrt_init(void)
>  	int rc;
>  	phys_addr_t end;
> 
> -	if (!efi_enabled(EFI_MEMMAP))
> +	if (!efi_enabled(EFI_MEMMAP) && !efi_enabled(EFI_PARAVIRT))
>  		return;
> 
>  	pr_debug("esrt-init: loading.\n");
>  	if (!esrt_table_exists())
>  		return;
> 
> +	if (!efi_enabled(EFI_PARAVIRT)) {
>  	rc = efi_mem_desc_lookup(efi.esrt, &md);
>  	if (rc < 0 ||
>  	    (!(md.attribute & EFI_MEMORY_RUNTIME) &&
> @@ -276,6 +277,7 @@ void __init efi_esrt_init(void)
>  		       size, max);
>  		return;
>  	}
> +	}
> 
>  	va = early_memremap(efi.esrt, size);
>  	if (!va) {
> @@ -331,7 +333,8 @@ void __init efi_esrt_init(void)
> 
>  	end = esrt_data + size;
>  	pr_info("Reserving ESRT space from %pa to %pa.\n", &esrt_data, &end);
> -	if (md.type == EFI_BOOT_SERVICES_DATA)
> +
> +	if (!efi_enabled(EFI_PARAVIRT) && md.type == EFI_BOOT_SERVICES_DATA)
>  		efi_mem_reserve(esrt_data, esrt_data_size);
> 
>  	pr_debug("esrt-init: loaded.\n");
> ----8<-----
I've built the kernel with your patch. Unfortunately it doesn't bring 
expected
sysfs directories. We still need some changes here.

---
Best Regards,
Norbert Kamiński
Embedded Systems Engineer
GPG key ID: 9E9F90AFE10F466A
3mdeb.com

