Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5EC6B5232
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 21:50:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508602.783423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pajgt-0003UD-2a; Fri, 10 Mar 2023 20:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508602.783423; Fri, 10 Mar 2023 20:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pajgs-0003S9-Vq; Fri, 10 Mar 2023 20:50:14 +0000
Received: by outflank-mailman (input) for mailman id 508602;
 Fri, 10 Mar 2023 20:50:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Voiz=7C=web.de=tachyon_gun@srs-se1.protection.inumbo.net>)
 id 1pajgs-0003Rp-3P
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 20:50:14 +0000
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25df256d-bf85-11ed-956e-85ef70e17bfa;
 Fri, 10 Mar 2023 21:50:10 +0100 (CET)
Received: from [92.76.123.40] ([92.76.123.40]) by web-mail.web.de
 (3c-app-webde-bs42.server.lan [172.19.170.42]) (via HTTP); Fri, 10 Mar 2023
 21:50:09 +0100
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
X-Inumbo-ID: 25df256d-bf85-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678481410; i=tachyon_gun@web.de;
	bh=kofX78trZyZ/LLQtVmWdt3LHtiH28opQxs4KLeQkSEQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PT6Ma0hvhBx6J9j2GFG+VsVkU+wjHgqMvHmpCsO5k2jQofLCuoaMsnmG5x8XhXm76
	 ZciE0ef20gun11P5g0giwdkLxQk42UVTvpLOlSwvYa+/yXdwXkCq0lt0OVhRLHG8J2
	 PD56ywxWGDZDmdFP8ucPOws8jAEoNnkhjb8me66RLkBrIb6tSEnB4Rv/oGm05tB744
	 XNYwLruM2QOuBCFnHC1lqkzytnSeQcI7LAwxg0OltAUlMyhb+wjg4xBbfVOypgOGv5
	 atZeUN0zKw4aTJFrb75iipjHBKlu5ThGaqwXioC4K31XM7XQnqpQTYl3VzudvvKGyu
	 N1I/SY0I39d/w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
MIME-Version: 1.0
Message-ID: <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
From: Denis <tachyon_gun@web.de>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from Xen
 4.0.1
Content-Type: multipart/mixed;
 boundary=rehcsed-43214fbe-ed75-4212-bbbe-72788c4167ec
Date: Fri, 10 Mar 2023 21:50:09 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:57k6mzFGSgkOL+u9RcYa98B4+iCNmTbw3yGkcH141BnSpkG4UtxobGo8JL2iJvFtcMaIg
 Jx7VhGTXwmZaYIMksHhLsAXNcC0NcxQ77X2OiasvIhvzptjFccm2piUpT8tBGdSpmMT91ZEEwOZh
 KTl9fcQGHKee2KD1gEVPt6XZ9xwYHy4NtLwrm1uQAU/cUUyrN5qjnaRNqXV03ikOVH1HIT0Tm23r
 nWVukHKswJYIfO7cDfSXG5CR4l2W+atOaO2ORR905v6UeKZCx9dnOuVm61EVZKodgCyUo3lUcoE8
 u8=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5LoIKhQ4gzs=;34hrCwEpk3jI3C9LiD7Y4i0plsb
 GbHTLu4Hk57G7PER3KPvt17A6VRRpyD37rCRwtzvyVRqHWEeADdDffgbANMT9jwezRYC2n60I
 y45rEEDy0ATy1hDfbovHKp46N9ygIF9IDGh6vptbqu8+1kqWggPZA50897zDqCSraZdsweigy
 ib27f1lVpbXPtxbsbKLpq35LqzcgMhS/v/sL19YJrAchxBz8lO7J5v0nmLC1WK+v71QT0CFR0
 k3MYbR3XJp6WUp1YtynB30MOTftvrFU9NimXxAgx0oHEcenkwVU6xwdaBKR18leqJj1KXdfnb
 tPNkU63W21NC0Gi8GPxuawEn9Q0bTxAOYAS1tK9eIXhvgTsydFCnxqCNWP0e7ObPSR49xMWoJ
 3dt4z73cqEOGDqXRypaPbd5+JFq54teP+UffTS/T6Dy+hyoq6373qfwL6qTRt9F1Gvk0Swpvx
 bYjrv4MYLuFXJKKb/ZAyISq1iAdoibhahtyHhOC+5ifLNKdDeVnNforLQBIUgmhEtcZm7o7Kz
 Dz8aOc5JY2zYC67ug9L+GTVqXZhmf9PtdQEvB0196X9oLLSM2BCsmQ43CTV4GVYMwZiZU0V7j
 bZkbATjZy45WAaoobvIi0+gMCQTKgph1kc+v7EDCJ1RNvTX5vCQ7E8ElhdXNf35vZGVIAtfXT
 1vPH16MuauHBKSyTwZy788/KuOZj1mBh+ZuVntww7DMO5vo7z+G7u91gRnfqXq3MtymMhpZQ6
 9xuViStYAnvhLkVczB955Nfuy2VFeY7gWc002WODIJov95hIXJq143TMVbvcs0tfUz0SxpVaJ
 /pCeh4WIF3yQ96LjNb1Tsr84fMQPABs9gUoWF4g6vJnPg=

--rehcsed-43214fbe-ed75-4212-bbbe-72788c4167ec
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10=2E03=2E2023 09:51, Jan Beulich wrote:
> Betreff: Re: [help] Xen 4=2E14=2E5 on Devuan 4=2E0 Chimaera, regression =
from Xen 4=2E0=2E1
>
> On 09=2E03=2E2023 21:37, Andrew Cooper wrote:
> > On 09/03/2023 7:34 pm, tachyon_gun@web=2Ede wrote:
> >> Subject:
> >> [help] Xen 4=2E14=2E5 on Devuan 4=2E0 Chimaera
> >> From:
> >> tachyon_gun@web=2Ede
> >> Date:
> >> 09/03/2023, 7:34 pm
> >>
> >> To:
> >> xen-devel@lists=2Exenproject=2Eorg
> >>
> >>
> >> Hello=2E
> >>
> >> Following the advice of Andrew Cooper (thanks for helping out) over o=
n
> >> OFTC=2Enet in #xen, I'll post this here=2E
> >> If this is the wrong place, please move it to the right section of yo=
ur
> >> mailing lists=2E
> >> =C2=A0
> >> I got some problems running Xen 4=2E14=2E5 on Devuan 4=2E0=2E
> >> =C2=A0
> >> The=C2=A0AMD-Vi and I/O virtualisation are=C2=A0not being enabled whe=
n booting up
> >> the host system with Xen=2E
> >> =C2=A0
> >> Hardware used:
> >> Mainboard: Gigabyte GA-890FXA-UD5, BIOS=C2=A0version F6 (2010=2E11=2E=
24, the
> >> latest version)
> >> CPU:=C2=A0AMD Phenom=C2=A0II X4 910e
> >> Memory: 16GB
> >> Storage: 2TB Crucial MX500
> >> =C2=A0
> >> A short snippet of what I see when invoking "xl dmesg":
> >> =C2=A0
> >> (XEN) No southbridge IO-APIC found in IVRS table
> >> (XEN) AMD-Vi: Error initialization
> >> (XEN) I/O virtualisation disabled=C2=A0
> >> =C2=A0
> >> What I would like to see (taken from Xen=C2=A04=2E0=2E1 running on De=
bian
> >> Squeeze, in use since 2011):
> >> =C2=A0
> >> (XEN) IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-23
> >> (XEN) Enabling APIC mode: =C2=A0Flat=2E =C2=A0Using 1 I/O APICs
> >> (XEN) Using scheduler: SMP Credit Scheduler (credit)
> >> (XEN) Detected 2611=2E936 MHz processor=2E
> >> (XEN) Initing memory sharing=2E
> >> (XEN) HVM: ASIDs enabled=2E
> >> (XEN) HVM: SVM enabled
> >> (XEN) HVM: Hardware Assisted Paging detected=2E
> >> (XEN) AMD-Vi: IOMMU 0 Enabled=2E
> >> (XEN) I/O virtualisation enabled
> >> =C2=A0
> >> My question would be if this is=C2=A0"normal" behaviour due to older =
hardware
> >> being used with newer versions of Xen (compared to the old 4=2E0=2E1)=
 or if
> >> this is=C2=A0a bug=2E
> >> If the latter, has this been addressed already in newer version (4=2E=
14+)?
>=20
> No, the code there is still the same=2E The commit introducing the check
> (06bbcaf48d09 ["AMD IOMMU: fail if there is no southbridge IO-APIC"])
> specifically provided for a workaround: "iommu=3Dno-intremap" on the Xen
> command line=2E Could you give this a try? (As per below this could be
> what we want to do "automatically" in such a situation, i=2Ee=2E without
> the need for a command line option=2E But you then still would face a
> perceived regression of interrupt remapping being disabled on such a
> system=2E)
>=20
> The other possible workaround, "iommu=3Dno-amd-iommu-perdev-intremap",
> is something I rather wouldn't want to recommend, but you may still
> want to give it a try=2E
=20
Thanks for your reply=2E

I added the lines you suggested and it seems that "AMD-Vi: IOMMU 0" and
"I/O virtualisation" is enabled again=2E

There are only minor differences in the "xl dmesg" output=2E
In the one with "iommu=3Dno-amd-iommu-perdev-intremap",=20
the line "No southbridge IO-APIC found in IVRS table" is listed=2E

Though I yet have to test a HVM domU with passthrough=2E

I'll attach the two "xl dmesg" files and a third one from the old version =
of Xen=2E

> >> I'll attach some log files (hypervisor=2Elog, dom0=2Elog, xl_info=2El=
og,
> >> lspci_vvv=2Elog, acpi=2Edmp, ivrs=2Edat, ivrs=2Edsl)=2E
> >> =C2=A0
> >> Thank you for your time=2E
> >=20
> > Let me braindump the investigation so far before I forget it=2E
> >=20
> > Xen requires that there is an IVRS special-device record describing an
> > IO-APIC 00:14=2E0=2E  This check failing is the source of the "No
> > southbridge" message, and the cause of the IOMMU(s) being turned off=
=2E
> >=20
> > The MADT and IVRS tables agree that there is one IO-APIC in the system=
,
> > but that's the northbridge IO-APIC, not the southbridge=2E
> >=20
> > The block diagram for the southbridge does have a PIC/IO-APIC as part =
of
> > the PCI bridge, so honestly I was expecting the MADT to describe 2
> > IO-APICs=2E  But OTOH, I could see this legitimately not existing in
> > configurations where the PCI bridge isn't in use=2E
> >=20
> > `xl dmesg` does have a few unknown irqs, so there might be something
> > down in the southbridge really generating interrupts=2E  Or there migh=
t be
> > a IRQ misconfiguration elsewhere, and this is just a red herring=2E
> >=20
> > However, a consequence of the northbridge and southbridge being separa=
te
> > chips means that all southbridge IO is fully encapsulated by the IOMMU
> > in the northbridge=2E
> >=20
> > So irrespective of whether there is ah IO-APIC operating properly in t=
he
> > southbridge, and whether or not it's properly described, I think Xen's
> > insistence that there must be an IVRS special-device entry for it is b=
ogus=2E
> >=20
> >=20
> > Furthermore, Xen's decisions are monumentally stupid=2E  It takes a
> > specifically safe (IOMMU-wise) system, and because it can't figure out=
 a
> > partial aspect of interrupt handling the southbridge, decided that the
> > system can't be safe (a false conclusion) and turns the IOMMU off full=
y
> > to compensate, which makes the system concretely less safe=2E

Also, thank you Andrew for bringing this in=2E

> So this touches once again the area of the fuzzy split between the IOMMU
> being disabled as a whole (meaning DMA+interrupt remapping off) vs only
> one of the two being off (where presently we are unable to turn off just
> DMA remapping)=2E Indeed the original Linux commit, which our change was
> inspired by, results in merely interrupt remapping getting turned off
> (afaict), and that hasn't changed=2E (Would be nice to have this confirm=
ed
> for the system in question, i=2Ee=2E without Xen underneath Linux=2E) It=
 would
> certainly be possible for us to do so too - it might be a one line chang=
e:
=20
Could you elaborate on that one?
Should I test something else?

> @@ =2E=2E=2E @@ static int __init cf_check parse_ivrs_table(struct
>      if ( !error && !sb_ioapic )
>      {
>          if ( amd_iommu_perdev_intremap )
> -            error =3D -ENXIO;
> +            iommu_intremap =3D false;
>          printk("%sNo southbridge IO-APIC found in IVRS table\n",
>                 amd_iommu_perdev_intremap ? XENLOG_ERR : XENLOG_WARNING)=
;
>      }
>=20
> but only if there aren't any earlier decisions that need undoing, and
> only if all subsequent code will properly honor that turning off of
> intremap=2E I'll try to get to doing the necessary audit some time next
> week=2E
=20
Denis
--rehcsed-43214fbe-ed75-4212-bbbe-72788c4167ec
Content-Type: application/octet-stream
Content-Disposition: attachment;
 filename="hypervisor_iommu=no-amd-iommu-perdev-intremap.log"

(XEN) Xen version 4.14.5 (Debian 4.14.5+86-g1c354767d5-1) (pkg-xen-devel@lists.alioth.debian.org) (x86_64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110) debug=n  Fri Nov  4 19:25:46 UTC 2022
(XEN) build-id: 888699a351d5cbf2705344205565dd20479f1b14
(XEN) Bootloader: GRUB 2.06-3~deb11u5
(XEN) Command line: placeholder dom0_mem=768M,max:768M iommu=no-amd-iommu-perdev-intremap iommu=debug loglvl=all guest_loglvl=all
(XEN) Xen image load base address: 0xcf400000
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN)  VBE/DDC methods: V2; EDID transfer time: 1 seconds
(XEN) Disc information:
(XEN)  Found 1 MBR signatures
(XEN)  Found 1 EDD information structures
(XEN) CPU Vendor: AMD, Family 16 (0x10), Model 4 (0x4), Stepping 3 (raw 00100f43)
(XEN) Xen-e820 RAM map:
(XEN)  [0000000000000000, 000000000009b7ff] (usable)
(XEN)  [000000000009f800, 000000000009ffff] (reserved)
(XEN)  [00000000000f0000, 00000000000fffff] (reserved)
(XEN)  [0000000000100000, 00000000cfceffff] (usable)
(XEN)  [00000000cfcf0000, 00000000cfcf0fff] (ACPI NVS)
(XEN)  [00000000cfcf1000, 00000000cfcfffff] (ACPI data)
(XEN)  [00000000cfd00000, 00000000cfdfffff] (reserved)
(XEN)  [00000000e0000000, 00000000efffffff] (reserved)
(XEN)  [00000000fec00000, 00000000ffffffff] (reserved)
(XEN)  [0000000100000000, 000000042fffffff] (usable)
(XEN) ACPI: RSDP 000F6100, 0014 (r0 GBT   )
(XEN) ACPI: RSDT CFCF1000, 0044 (r1 GBT    GBTUACPI 42302E31 GBTU  1010101)
(XEN) ACPI: FACP CFCF1080, 0074 (r1 GBT    GBTUACPI 42302E31 GBTU  1010101)
(XEN) ACPI: DSDT CFCF1100, 7BE3 (r1 GBT    GBTUACPI     1000 MSFT  3000000)
(XEN) ACPI: FACS CFCF0000, 0040
(XEN) ACPI: SSDT CFCF8DC0, 088C (r1 PTLTD  POWERNOW        1  LTP        1)
(XEN) ACPI: HPET CFCF9680, 0038 (r1 GBT    GBTUACPI 42302E31 GBTU       98)
(XEN) ACPI: MCFG CFCF96C0, 003C (r1 GBT    GBTUACPI 42302E31 GBTU  1010101)
(XEN) ACPI: MATS CFCF9700, 0034 (r1 GBT                    0             0)
(XEN) ACPI: TAMG CFCF9770, 0202 (r1 GBT    GBT   B0 5455312E BG 53450101)
(XEN) ACPI: APIC CFCF8D00, 00BC (r1 GBT    GBTUACPI 42302E31 GBTU  1010101)
(XEN) ACPI: IVRS CFCF99F0, 00C0 (r1  AMD     RD890S   202031 AMD         0)
(XEN) System RAM: 16380MB (16773676kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000430000000
(XEN) Domain heap initialised
(XEN) found SMP MP-table at 000f46f0
(XEN) DMI 2.4 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x808 (32 bits)
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) ACPI:             wakeup_vec[cfcf000c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x03] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x04] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x05] lapic_id[0x05] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x06] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x07] lapic_id[0x07] disabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0x00] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x01] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x02] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x03] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x04] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x05] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x06] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x07] dfl dfl lint[0x1])
(XEN) ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-23
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x10b9a201 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at e0000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) AMD-Vi: Found MSI capability block at 0x54
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 8 CPUs (4 hotplug CPUs)
(XEN) IRQ limits: 24 GSI, 808 MSI/MSI-X
(XEN) No SSBD controls available
(XEN) CPU0: 800 ... 2600 MHz
(XEN) CPU0: AMD Fam10h machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware hints:
(XEN)   Hardware features:
(XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN)   Xen settings: BTI-Thunk RETPOLINE, SPEC_CTRL: No, Other: BRANCH_HARDEN
(XEN)   Support for HVM VMs: RSB
(XEN)   Support for PV VMs: RSB
(XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Platform timer is 14.318MHz HPET
(XEN) Detected 2611.821 MHz processor.
(XEN) alt table ffff82d040451290 -> ffff82d04045c334
(XEN) AMD-Vi: IVRS Block: Found type 0x10 flags 0x3e len 0x90 id 0x2
(XEN) AMD-Vi: Using IVHD type 0x10
(XEN) AMD-Vi: ACPI Table:
(XEN) AMD-Vi:  Signature IVRS
(XEN) AMD-Vi:  Length 0xc0
(XEN) AMD-Vi:  Revision 0x1
(XEN) AMD-Vi:  CheckSum 0xac
(XEN) AMD-Vi:  OEM_Id AMD
(XEN) AMD-Vi:  OEM_Table_Id RD890S
(XEN) AMD-Vi:  OEM_Revision 0x202031
(XEN) AMD-Vi:  Creator_Id AMD
(XEN) AMD-Vi:  Creator_Revision 0
(XEN) AMD-Vi: IVRS Block: type 0x10 flags 0x3e len 0x90 id 0x2
(XEN) AMD-Vi: IVHD Device Entry: type 0x3 id 0 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0 -> 0x2
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x10 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x3 id 0x100 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0x100 -> 0x101
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x28 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x30 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x38 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x400 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x68 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x3 id 0x500 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0x500 -> 0x503
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x88 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x3 id 0x90 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0x90 -> 0x92
(XEN) AMD-Vi: IVHD Device Entry: type 0x3 id 0x98 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0x98 -> 0x9a
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0xa0 flags 0xd7
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0xa3 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0xa4 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x43 id 0x600 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0x600 -> 0x6ff alias 0xa4
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0xa5 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x3 id 0xb0 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0xb0 -> 0xb2
(XEN) AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0xd7
(XEN) AMD-Vi: IVHD Special: 0000:00:14.0 variety 0x2 handle 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0
(XEN) AMD-Vi: IVHD Special: 0000:00:00.1 variety 0x1 handle 0x8
(XEN) No southbridge IO-APIC found in IVRS table
(XEN) AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) AMD-Vi: using 256-entry cmd ring(s)
(XEN) AMD-Vi: IOMMU 0 Enabled.
(XEN) AMD-Vi: Using global interrupt remap table is not recommended (see XSA-36)!
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 2
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) Allocated console ring of 32 KiB.
(XEN) mwait-idle: does not run on family 16 model 4
(XEN) HVM: ASIDs enabled.
(XEN) SVM: Supported advanced features:
(XEN)  - Nested Page Tables (NPT)
(XEN)  - Last Branch Record (LBR) Virtualisation
(XEN)  - Next-RIP Saved on #VMEXIT
(XEN) HVM: SVM enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) alt table ffff82d040451290 -> ffff82d04045c334
(XEN) CPU1: No irq handler for vector 27 (IRQ -2147483648)
(XEN) CPU2: No irq handler for vector 27 (IRQ -2147483648)
(XEN) Brought up 4 CPUs
(XEN) CPU3: No irq handler for vector 27 (IRQ -2147483648)
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 0
(XEN) Adding cpu 3 to runqueue 0
(XEN) MCA: Use hw thresholding to adjust polling frequency
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Xenoprofile: AMD IBS detected (0x1f)
(XEN) HPET: 0 timers usable for broadcast (3 total)
(XEN) NX (Execute Disable) protection active
(XEN) Dom0 has maximum 648 PIRQs
(XEN) *** Building a PV Dom0 ***
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x3a00000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000418000000->000000041c000000 (172699 pages to be allocated)
(XEN)  Init. ramdisk: 000000042e29b000->000000042ffff6a4
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff83a00000
(XEN)  Init. ramdisk: 0000000000000000->0000000000000000
(XEN)  Phys-Mach map: 0000008000000000->0000008000180000
(XEN)  Start info:    ffffffff83a00000->ffffffff83a004b8
(XEN)  Xenstore ring: 0000000000000000->0000000000000000
(XEN)  Console ring:  0000000000000000->0000000000000000
(XEN)  Page tables:   ffffffff83a01000->ffffffff83a22000
(XEN)  Boot stack:    ffffffff83a22000->ffffffff83a23000
(XEN)  TOTAL:         ffffffff80000000->ffffffff83c00000
(XEN)  ENTRY ADDRESS: ffffffff82c3d1c0
(XEN) Dom0 has maximum 4 VCPUs
(XEN) AMD-Vi: Setup I/O page table: device id = 0, type = 0x6, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x10, type = 0x2, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x28, type = 0x2, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x30, type = 0x2, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x38, type = 0x2, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x68, type = 0x2, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x88, type = 0x7, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x90, type = 0x7, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x92, type = 0x7, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x98, type = 0x7, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x9a, type = 0x7, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa0, type = 0x7, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa3, type = 0x7, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x5, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa5, type = 0x7, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xb0, type = 0x7, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xb2, type = 0x7, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.0
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.1
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.2
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.3
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.4
(XEN) AMD-Vi: Setup I/O page table: device id = 0x100, type = 0x1, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x101, type = 0x1, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x400, type = 0x1, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x500, type = 0x1, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x501, type = 0x1, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x502, type = 0x1, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x503, type = 0x1, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x7, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x7, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x7, root table = 0x42e218000, domain = 0, paging mode = 3
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 612kB init memory
(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:00.2
(XEN) PCI add device 0000:00:02.0
(XEN) PCI add device 0000:00:05.0
(XEN) PCI add device 0000:00:06.0
(XEN) PCI add device 0000:00:07.0
(XEN) PCI add device 0000:00:0d.0
(XEN) PCI add device 0000:00:11.0
(XEN) PCI add device 0000:00:12.0
(XEN) PCI add device 0000:00:12.2
(XEN) PCI add device 0000:00:13.0
(XEN) PCI add device 0000:00:13.2
(XEN) PCI add device 0000:00:14.0
(XEN) PCI add device 0000:00:14.3
(XEN) PCI add device 0000:00:14.4
(XEN) PCI add device 0000:00:14.5
(XEN) PCI add device 0000:00:16.0
(XEN) PCI add device 0000:00:16.2
(XEN) PCI add device 0000:00:18.0
(XEN) PCI add device 0000:00:18.1
(XEN) PCI add device 0000:00:18.2
(XEN) PCI add device 0000:00:18.3
(XEN) PCI add device 0000:00:18.4
(XEN) PCI add device 0000:01:00.0
(XEN) PCI add device 0000:01:00.1
(XEN) PCI add device 0000:04:00.0
(XEN) PCI add device 0000:05:00.0
(XEN) PCI add device 0000:05:00.1
(XEN) PCI add device 0000:05:00.2
(XEN) PCI add device 0000:05:00.3
(XEN) PCI add device 0000:06:06.0
(XEN) PCI add device 0000:06:06.1
(XEN) PCI add device 0000:06:06.2
--rehcsed-43214fbe-ed75-4212-bbbe-72788c4167ec
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="hypervisor_iommu=no-intremap.log"

(XEN) Xen version 4.14.5 (Debian 4.14.5+86-g1c354767d5-1) (pkg-xen-devel@lists.alioth.debian.org) (x86_64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110) debug=n  Fri Nov  4 19:25:46 UTC 2022
(XEN) build-id: 888699a351d5cbf2705344205565dd20479f1b14
(XEN) Bootloader: GRUB 2.06-3~deb11u5
(XEN) Command line: placeholder dom0_mem=768M,max:768M iommu=no-intremap iommu=debug loglvl=all guest_loglvl=all
(XEN) Xen image load base address: 0xcf400000
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN)  VBE/DDC methods: V2; EDID transfer time: 1 seconds
(XEN) Disc information:
(XEN)  Found 1 MBR signatures
(XEN)  Found 1 EDD information structures
(XEN) CPU Vendor: AMD, Family 16 (0x10), Model 4 (0x4), Stepping 3 (raw 00100f43)
(XEN) Xen-e820 RAM map:
(XEN)  [0000000000000000, 000000000009b7ff] (usable)
(XEN)  [000000000009f800, 000000000009ffff] (reserved)
(XEN)  [00000000000f0000, 00000000000fffff] (reserved)
(XEN)  [0000000000100000, 00000000cfceffff] (usable)
(XEN)  [00000000cfcf0000, 00000000cfcf0fff] (ACPI NVS)
(XEN)  [00000000cfcf1000, 00000000cfcfffff] (ACPI data)
(XEN)  [00000000cfd00000, 00000000cfdfffff] (reserved)
(XEN)  [00000000e0000000, 00000000efffffff] (reserved)
(XEN)  [00000000fec00000, 00000000ffffffff] (reserved)
(XEN)  [0000000100000000, 000000042fffffff] (usable)
(XEN) ACPI: RSDP 000F6100, 0014 (r0 GBT   )
(XEN) ACPI: RSDT CFCF1000, 0044 (r1 GBT    GBTUACPI 42302E31 GBTU  1010101)
(XEN) ACPI: FACP CFCF1080, 0074 (r1 GBT    GBTUACPI 42302E31 GBTU  1010101)
(XEN) ACPI: DSDT CFCF1100, 7BE3 (r1 GBT    GBTUACPI     1000 MSFT  3000000)
(XEN) ACPI: FACS CFCF0000, 0040
(XEN) ACPI: SSDT CFCF8DC0, 088C (r1 PTLTD  POWERNOW        1  LTP        1)
(XEN) ACPI: HPET CFCF9680, 0038 (r1 GBT    GBTUACPI 42302E31 GBTU       98)
(XEN) ACPI: MCFG CFCF96C0, 003C (r1 GBT    GBTUACPI 42302E31 GBTU  1010101)
(XEN) ACPI: MATS CFCF9700, 0034 (r1 GBT                    0             0)
(XEN) ACPI: TAMG CFCF9770, 0202 (r1 GBT    GBT   B0 5455312E BG 53450101)
(XEN) ACPI: APIC CFCF8D00, 00BC (r1 GBT    GBTUACPI 42302E31 GBTU  1010101)
(XEN) ACPI: IVRS CFCF99F0, 00C0 (r1  AMD     RD890S   202031 AMD         0)
(XEN) System RAM: 16380MB (16773676kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000430000000
(XEN) Domain heap initialised
(XEN) found SMP MP-table at 000f46f0
(XEN) DMI 2.4 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x808 (32 bits)
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) ACPI:             wakeup_vec[cfcf000c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x03] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x04] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x05] lapic_id[0x05] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x06] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x07] lapic_id[0x07] disabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0x00] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x01] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x02] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x03] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x04] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x05] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x06] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x07] dfl dfl lint[0x1])
(XEN) ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-23
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x10b9a201 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at e0000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) AMD-Vi: Found MSI capability block at 0x54
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 8 CPUs (4 hotplug CPUs)
(XEN) IRQ limits: 24 GSI, 808 MSI/MSI-X
(XEN) No SSBD controls available
(XEN) CPU0: 800 ... 2600 MHz
(XEN) CPU0: AMD Fam10h machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware hints:
(XEN)   Hardware features:
(XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN)   Xen settings: BTI-Thunk RETPOLINE, SPEC_CTRL: No, Other: BRANCH_HARDEN
(XEN)   Support for HVM VMs: RSB
(XEN)   Support for PV VMs: RSB
(XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Platform timer is 14.318MHz HPET
(XEN) Detected 2611.810 MHz processor.
(XEN) alt table ffff82d040451290 -> ffff82d04045c334
(XEN) AMD-Vi: IVRS Block: Found type 0x10 flags 0x3e len 0x90 id 0x2
(XEN) AMD-Vi: Using IVHD type 0x10
(XEN) AMD-Vi: ACPI Table:
(XEN) AMD-Vi:  Signature IVRS
(XEN) AMD-Vi:  Length 0xc0
(XEN) AMD-Vi:  Revision 0x1
(XEN) AMD-Vi:  CheckSum 0xac
(XEN) AMD-Vi:  OEM_Id AMD
(XEN) AMD-Vi:  OEM_Table_Id RD890S
(XEN) AMD-Vi:  OEM_Revision 0x202031
(XEN) AMD-Vi:  Creator_Id AMD
(XEN) AMD-Vi:  Creator_Revision 0
(XEN) AMD-Vi: IVRS Block: type 0x10 flags 0x3e len 0x90 id 0x2
(XEN) AMD-Vi: IVHD Device Entry: type 0x3 id 0 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0 -> 0x2
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x10 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x3 id 0x100 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0x100 -> 0x101
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x28 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x30 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x38 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x400 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x68 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x3 id 0x500 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0x500 -> 0x503
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0x88 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x3 id 0x90 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0x90 -> 0x92
(XEN) AMD-Vi: IVHD Device Entry: type 0x3 id 0x98 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0x98 -> 0x9a
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0xa0 flags 0xd7
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0xa3 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0xa4 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x43 id 0x600 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0x600 -> 0x6ff alias 0xa4
(XEN) AMD-Vi: IVHD Device Entry: type 0x2 id 0xa5 flags 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x3 id 0xb0 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0xb0 -> 0xb2
(XEN) AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0xd7
(XEN) AMD-Vi: IVHD Special: 0000:00:14.0 variety 0x2 handle 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0
(XEN) AMD-Vi: IVHD Special: 0000:00:00.1 variety 0x1 handle 0x8
(XEN) AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) AMD-Vi: using 256-entry cmd ring(s)
(XEN) AMD-Vi: IOMMU 0 Enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping disabled
(XEN) nr_sockets: 2
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) Allocated console ring of 32 KiB.
(XEN) mwait-idle: does not run on family 16 model 4
(XEN) HVM: ASIDs enabled.
(XEN) SVM: Supported advanced features:
(XEN)  - Nested Page Tables (NPT)
(XEN)  - Last Branch Record (LBR) Virtualisation
(XEN)  - Next-RIP Saved on #VMEXIT
(XEN) HVM: SVM enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) alt table ffff82d040451290 -> ffff82d04045c334
(XEN) CPU1: No irq handler for vector 27 (IRQ -2147483648)
(XEN) CPU2: No irq handler for vector 27 (IRQ -2147483648)
(XEN) Brought up 4 CPUs
(XEN) CPU3: No irq handler for vector 27 (IRQ -2147483648)
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 0
(XEN) Adding cpu 3 to runqueue 0
(XEN) MCA: Use hw thresholding to adjust polling frequency
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Xenoprofile: AMD IBS detected (0x1f)
(XEN) HPET: 0 timers usable for broadcast (3 total)
(XEN) NX (Execute Disable) protection active
(XEN) Dom0 has maximum 648 PIRQs
(XEN) *** Building a PV Dom0 ***
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x3a00000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000418000000->000000041c000000 (172699 pages to be allocated)
(XEN)  Init. ramdisk: 000000042e29b000->000000042ffff6a4
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff83a00000
(XEN)  Init. ramdisk: 0000000000000000->0000000000000000
(XEN)  Phys-Mach map: 0000008000000000->0000008000180000
(XEN)  Start info:    ffffffff83a00000->ffffffff83a004b8
(XEN)  Xenstore ring: 0000000000000000->0000000000000000
(XEN)  Console ring:  0000000000000000->0000000000000000
(XEN)  Page tables:   ffffffff83a01000->ffffffff83a22000
(XEN)  Boot stack:    ffffffff83a22000->ffffffff83a23000
(XEN)  TOTAL:         ffffffff80000000->ffffffff83c00000
(XEN)  ENTRY ADDRESS: ffffffff82c3d1c0
(XEN) Dom0 has maximum 4 VCPUs
(XEN) AMD-Vi: Setup I/O page table: device id = 0, type = 0x6, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x10, type = 0x2, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x28, type = 0x2, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x30, type = 0x2, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x38, type = 0x2, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x68, type = 0x2, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x88, type = 0x7, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x90, type = 0x7, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x92, type = 0x7, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x98, type = 0x7, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x9a, type = 0x7, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa0, type = 0x7, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa3, type = 0x7, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x5, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa5, type = 0x7, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xb0, type = 0x7, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xb2, type = 0x7, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.0
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.1
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.2
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.3
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.4
(XEN) AMD-Vi: Setup I/O page table: device id = 0x100, type = 0x1, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x101, type = 0x1, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x400, type = 0x1, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x500, type = 0x1, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x501, type = 0x1, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x502, type = 0x1, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x503, type = 0x1, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x7, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x7, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x7, root table = 0x42e21a000, domain = 0, paging mode = 3
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 612kB init memory
(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:00.2
(XEN) PCI add device 0000:00:02.0
(XEN) PCI add device 0000:00:05.0
(XEN) PCI add device 0000:00:06.0
(XEN) PCI add device 0000:00:07.0
(XEN) PCI add device 0000:00:0d.0
(XEN) PCI add device 0000:00:11.0
(XEN) PCI add device 0000:00:12.0
(XEN) PCI add device 0000:00:12.2
(XEN) PCI add device 0000:00:13.0
(XEN) PCI add device 0000:00:13.2
(XEN) PCI add device 0000:00:14.0
(XEN) PCI add device 0000:00:14.3
(XEN) PCI add device 0000:00:14.4
(XEN) PCI add device 0000:00:14.5
(XEN) PCI add device 0000:00:16.0
(XEN) PCI add device 0000:00:16.2
(XEN) PCI add device 0000:00:18.0
(XEN) PCI add device 0000:00:18.1
(XEN) PCI add device 0000:00:18.2
(XEN) PCI add device 0000:00:18.3
(XEN) PCI add device 0000:00:18.4
(XEN) PCI add device 0000:01:00.0
(XEN) PCI add device 0000:01:00.1
(XEN) PCI add device 0000:04:00.0
(XEN) PCI add device 0000:05:00.0
(XEN) PCI add device 0000:05:00.1
(XEN) PCI add device 0000:05:00.2
(XEN) PCI add device 0000:05:00.3
(XEN) PCI add device 0000:06:06.0
(XEN) PCI add device 0000:06:06.1
(XEN) PCI add device 0000:06:06.2
--rehcsed-43214fbe-ed75-4212-bbbe-72788c4167ec
Content-Type: application/octet-stream
Content-Disposition: attachment;
 filename="hypervisor_old_xen_iommu=debug_loglvl=all_guest_loglvl=all.log"

(XEN) Xen version 4.0.1 (Debian 4.0.1-2) (waldi@debian.org) (gcc version 4.4.5 (Debian 4.4.5-10) ) Wed Jan 12 14:04:06 UTC 2011
(XEN) Bootloader: GRUB 1.98+20100804-14
(XEN) Command line: placeholder dom0_mem=768M,max:768M iommu=debug loglvl=all guest_loglvl=all
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN)  VBE/DDC methods: V2; EDID transfer time: 1 seconds
(XEN) Disc information:
(XEN)  Found 2 MBR signatures
(XEN)  Found 2 EDD information structures
(XEN) Xen-e820 RAM map:
(XEN)  0000000000000000 - 000000000009a000 (usable)
(XEN)  000000000009f800 - 00000000000a0000 (reserved)
(XEN)  00000000000f0000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 00000000cfcf0000 (usable)
(XEN)  00000000cfcf0000 - 00000000cfcf1000 (ACPI NVS)
(XEN)  00000000cfcf1000 - 00000000cfd00000 (ACPI data)
(XEN)  00000000cfd00000 - 00000000cfe00000 (reserved)
(XEN)  00000000e0000000 - 00000000f0000000 (reserved)
(XEN)  00000000fec00000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 0000000430000000 (usable)
(XEN) ACPI: RSDP 000F6100, 0014 (r0 GBT   )
(XEN) ACPI: RSDT CFCF1000, 0044 (r1 GBT    GBTUACPI 42302E31 GBTU  1010101)
(XEN) ACPI: FACP CFCF1080, 0074 (r1 GBT    GBTUACPI 42302E31 GBTU  1010101)
(XEN) ACPI: DSDT CFCF1100, 7BE3 (r1 GBT    GBTUACPI     1000 MSFT  3000000)
(XEN) ACPI: FACS CFCF0000, 0040
(XEN) ACPI: SSDT CFCF8DC0, 088C (r1 PTLTD  POWERNOW        1  LTP        1)
(XEN) ACPI: HPET CFCF9680, 0038 (r1 GBT    GBTUACPI 42302E31 GBTU       98)
(XEN) ACPI: MCFG CFCF96C0, 003C (r1 GBT    GBTUACPI 42302E31 GBTU  1010101)
(XEN) ACPI: MATS CFCF9700, 0034 (r1 GBT                    0             0)
(XEN) ACPI: TAMG CFCF9770, 0202 (r1 GBT    GBT   B0 5455312E BG 53450101)
(XEN) ACPI: APIC CFCF8D00, 00BC (r1 GBT    GBTUACPI 42302E31 GBTU  1010101)
(XEN) ACPI: IVRS CFCF99F0, 00C0 (r1  AMD     RD890S   202031 AMD         0)
(XEN) System RAM: 16380MB (16773672kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000430000000
(XEN) Domain heap initialised
(XEN) found SMP MP-table at 000f46f0
(XEN) DMI 2.4 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x808
(XEN) ACPI: ACPI SLEEP INFO: pm1x_cnt[804,0], pm1x_evt[800,0]
(XEN) ACPI:                  wakeup_vec[cfcf000c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
(XEN) Processor #0 0:4 APIC version 16
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
(XEN) Processor #1 0:4 APIC version 16
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
(XEN) Processor #2 0:4 APIC version 16
(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x03] enabled)
(XEN) Processor #3 0:4 APIC version 16
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x04] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x05] lapic_id[0x05] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x06] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x07] lapic_id[0x07] disabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0x00] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x01] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x02] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x03] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x04] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x05] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x06] dfl dfl lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x07] dfl dfl lint[0x1])
(XEN) ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-23
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x10b9a201 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base e0000000 segment 0 buses 0 - 255
(XEN) PCI: MCFG area at e0000000 reserved in E820
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Detected 2611.858 MHz processor.
(XEN) Initing memory sharing.
(XEN) HVM: ASIDs enabled.
(XEN) HVM: SVM enabled
(XEN) HVM: Hardware Assisted Paging detected.
(XEN) AMD Fam10h machine check reporting enabled
(XEN) AMD-Vi: IOMMU 0 Enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Total of 4 processors activated.
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) TSC is reliable, synchronization unnecessary
(XEN) Platform timer appears to have unexpectedly wrapped 10 or more times.
(XEN) Platform timer is 14.318MHz HPET
(XEN) Allocated console ring of 32 KiB.
(XEN) do_IRQ: 1.231 No irq handler for vector (irq -1)
(XEN) Brought up 4 CPUs
(XEN) microcode.c:73:d32767 microcode: CPU1 resumed
(XEN) do_IRQ: 2.231 No irq handler for vector (irq -1)
(XEN) do_IRQ: 3.231 No irq handler for vector (irq -1)
(XEN) microcode.c:73:d32767 microcode: CPU2 resumed
(XEN) HPET's MSI mode hasn't been supported when Interrupt Remapping is enabled.
(XEN) microcode.c:73:d32767 microcode: CPU3 resumed
(XEN) ACPI sleep modes: S3
(XEN) MCA: Use hw thresholding to adjust polling frequency
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) *** LOADING DOMAIN 0 ***
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x1706000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000420000000->0000000424000000 (180224 pages to be allocated)
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff81706000
(XEN)  Init. ramdisk: ffffffff81706000->ffffffff833dc600
(XEN)  Phys-Mach map: ffffffff833dd000->ffffffff8355d000
(XEN)  Start info:    ffffffff8355d000->ffffffff8355d4b4
(XEN)  Page tables:   ffffffff8355e000->ffffffff8357d000
(XEN)  Boot stack:    ffffffff8357d000->ffffffff8357e000
(XEN)  TOTAL:         ffffffff80000000->ffffffff83800000
(XEN)  ENTRY ADDRESS: ffffffff8152f200
(XEN) Dom0 has maximum 4 VCPUs
(XEN) Scrubbing Free RAM: ..........................................................................................................................................................done.
(XEN) trace.c:89:d32767 calc_tinfo_first_offset: NR_CPUs 128, offset_in_bytes 258, t_info_first_offset 65
(XEN) Xen trace buffers: disabled
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input to Xen)
(XEN) Freed 176kB init memory.
(XEN) traps.c:2308:d0 Domain attempted WRMSR 00000000c0010004 from 00003fe1:84091c70 to 00000000:00000000.
(XEN) traps.c:2308:d0 Domain attempted WRMSR 00000000c0010000 from 00000103:888f741f to 00000000:00430076.
(XEN) traps.c:2308:d0 Domain attempted WRMSR 00000000c0010048 from 00000000:00780000 to 00000000:00780400.
(XEN) traps.c:2308:d0 Domain attempted WRMSR 00000000c0010048 from 00000000:00780000 to 00000000:00780400.
(XEN) traps.c:2308:d0 Domain attempted WRMSR 00000000c0010048 from 00000000:00780000 to 00000000:00780400.
(XEN) traps.c:2308:d0 Domain attempted WRMSR 00000000c0010048 from 00000000:00780000 to 00000000:00780400.
(XEN) PCI add device 00:00.0
(XEN) PCI add device 00:00.2
(XEN) PCI add device 00:02.0
(XEN) PCI add device 00:05.0
(XEN) PCI add device 00:06.0
(XEN) PCI add device 00:07.0
(XEN) PCI add device 00:0d.0
(XEN) PCI add device 00:11.0
(XEN) PCI add device 00:12.0
(XEN) PCI add device 00:12.2
(XEN) PCI add device 00:13.0
(XEN) PCI add device 00:13.2
(XEN) PCI add device 00:14.0
(XEN) PCI add device 00:14.3
(XEN) PCI add device 00:14.4
(XEN) PCI add device 00:14.5
(XEN) PCI add device 00:16.0
(XEN) PCI add device 00:16.2
(XEN) PCI add device 00:18.0
(XEN) PCI add device 00:18.1
(XEN) PCI add device 00:18.2
(XEN) PCI add device 00:18.3
(XEN) PCI add device 00:18.4
(XEN) PCI add device 01:00.0
(XEN) PCI add device 01:00.1
(XEN) PCI add device 04:00.0
(XEN) PCI add device 05:00.0
(XEN) PCI add device 05:00.1
(XEN) PCI add device 05:00.2
(XEN) PCI add device 05:00.3
(XEN) PCI add device 06:06.0
(XEN) PCI add device 06:06.1
(XEN) PCI add device 06:06.2
--rehcsed-43214fbe-ed75-4212-bbbe-72788c4167ec--


