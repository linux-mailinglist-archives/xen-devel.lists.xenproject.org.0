Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A3A6C1235
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 13:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511891.791277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peEuI-0004H6-8U; Mon, 20 Mar 2023 12:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511891.791277; Mon, 20 Mar 2023 12:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peEuI-0004Eu-5n; Mon, 20 Mar 2023 12:46:34 +0000
Received: by outflank-mailman (input) for mailman id 511891;
 Mon, 20 Mar 2023 12:46:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=39Nd=7M=web.de=tachyon_gun@srs-se1.protection.inumbo.net>)
 id 1peEuH-0004Eo-84
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 12:46:33 +0000
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bdcd39a-c71d-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 13:46:29 +0100 (CET)
Received: from [92.76.123.191] ([92.76.123.191]) by web-mail.web.de
 (3c-app-webde-bap20.server.lan [172.19.172.20]) (via HTTP); Mon, 20 Mar
 2023 13:46:28 +0100
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
X-Inumbo-ID: 3bdcd39a-c71d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679316388; i=tachyon_gun@web.de;
	bh=l/cNGqnVuYZkqvKSq8AyaZo6WjrxLCuuhzL4hhL47Oo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KqVIWJjbr3ZlwbVUcL0A/THvE2Va4q7kircE6FIC2xXa7iU96wVIKnTPqW+iPExYw
	 6dEMX7oHQJ2UkD/H7deDFFJsQHLLsWeVQFoLguH+e3jUGZE/EH2iJgwUEqhJguEfb8
	 wAD0y64LkSbnXuE3QlQ7JNxlsVa3zE0H7rb5+AgDq88ebOnMXGns2Sd6dE06FWxhg8
	 pZKkQLy3jQcQ935m9tjK3dbTZHxqEhRqGbED1Y/J4Hc2ssbk3IraQdLgMsBmU3JtEB
	 PUEy5kIZ2SLfR4LO30+pXoufbqpYLCMGZDeb4zQYVIGn5WAf87oV/St94s3bGKpZkN
	 8FzityoXVqebg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
MIME-Version: 1.0
Message-ID: <trinity-3058fb41-1250-49d2-88bc-4fbf3ef196f0-1679316388437@3c-app-webde-bap20>
From: Denis <tachyon_gun@web.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from Xen
 4.0.1
Content-Type: multipart/mixed;
 boundary=rehcsed-13d9dd57-108b-435f-b80f-c82a81507656
Date: Mon, 20 Mar 2023 13:46:28 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <f68e2621-2858-38b2-f989-32178e9f5ab2@citrix.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
 <e5a4689e-27e1-6992-65f8-c59b669aeaf1@citrix.com>
 <trinity-b7bc2797-26a7-455a-8080-8d33234171c9-1679254738309@3c-app-webde-bap20>
 <f68e2621-2858-38b2-f989-32178e9f5ab2@citrix.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:OYzs3+KLPfOPmpFi1d0KgdBnxe8HID6WPRXOXCh+EK+O9h8kd2PpVL4shIact0mKys4ir
 W21Y+bCSdL9N5Am7FWqIBILNc/QE0QB+I/qf75uHF2HbMm/inX2gXGr3Hikuh13aC1UxQtVZ+92L
 rNspvQyYHrbQcQKqJnyHm6pVfvZYDG8g1pRcoFQEopY1Y0vus7LG3AVjA37msUxcjGiShpX00LXP
 ctMCOPzRZk90hMdkDzWZqOT4DlOx5PROvYJWRKXNXx8866TpW+iBtIkfLPY6ZjvRt1oN3lsbsVo6
 DQ=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5h7jsF0OYmA=;AQQV2xwnhWXL7KEOzRDZ2ECCCxU
 Ii11wuNbIpUWRYAuHMOS2t3ESQgIY5H9l7fxIkXyPffNc7tDtkYG3eJdCXt+yZHzmoQhCk9S4
 H7wYJXwXKo0/+gvhHC//LQJ6hFlwu9L/DTp3w4xRhy6a0CuQBh5b6ytKuUMQBNNg7/NEOG4oI
 NkErbNQMY0JlHQg+c52KOd21Hpt+NsFLkLICcaQauJXihxboA//lONvJo/ucOq/TrlLiZAUuH
 K09cgm2TO9Q+V93BvTjWC6BNZYFlG4xLVUWi8aZCl1sIqVGDUMPTvEDGSF1plNZUwy8MDGfVe
 42f6G/HpvfdOSMICX42FcFgbah4TyMk+ULdVEggDCFyXz+S6RdZ+lxQ1LaWWWo3JC/eletaHd
 skEVNZY8jTVSquDCUj+4qHLer6IMD9xGxCP89pZV+b0W7wxM+B1voO12KozejowRdI6TV5pA1
 CHNTUHnEwcnt/a0yka/9Q/9Sif/kBg7DS336XHj1kx77DaGwjFdX7H36AhRQamA74GeQdgVi4
 baVJiJbz/fvlGKhIjrUPJZ2Di7cA8M0pK4lHF3bsgPdWJ9WPLuWyMP6Vy42i1Osv0J0q3GDD1
 bCg+o4aRNWYfOXc7urUPw48RJhe+NnDoC3Ao+UfAAK4sYjHf3FTnAp7dTsj+zKyFJwJSiyYFb
 A9KCVYS1Dpr8LyiU+ep3QjKplL2o4GrWP0q8o4tR7XSM2rAMffLPpuuOpUsWa70MOtO4/+RXU
 zltqC4ek0OXIAOoTzGQGcs0bR232Vdbf3LRAODFqhlVZxUWf9wbCLAK6rA29sa3K5tPpMnfnl
 NfJfSSw1w3n2Qv27IN0Z3yYaylOV11ELixTS4pGDOidbM=

--rehcsed-13d9dd57-108b-435f-b80f-c82a81507656
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20=2E03=2E2023 12:01, Andrew Cooper wrote:
> On 19/03/2023 7:38 pm, Denis wrote:
> > On 14=2E03=2E2023 16:11, Andrew Cooper wrote:
> >> On 14/03/2023 2:53 pm, Denis wrote:
> >>> On 14=2E03=2E2023 07:37; Jan Beulich wrote:
> >>>> On 14=2E03=2E2023 02:15, Denis wrote:
> >>>>> On 13=2E03=2E2023 10:36, Jan wrote
> >>>>>> On 10=2E03=2E2023 21:50, Denis wrote:
> >>>>>>> Should I test something else?
> >>>>>> =2E=2E=2E there was no request for any further testing here, for =
the moment=2E
> >>>>> ah=2E=2E=2Esorry, going by "Would be nice to have this confirmed f=
orthe system
> >>>>> in question, i=2Ee=2E without Xen underneath Linux" I thought I co=
uld test
> >>>>> something which might help shed some light on all of this=2E
> >>>> Well, yes, that Linux-without-Xen test would still be useful to hav=
e
> >>>> results from=2E I didn't account for this in my earlier reply becau=
se
> >>>> I had asked for it before already, and I did take "something else"
> >>>> for meaning anything that might have turned up as useful from the n=
ew
> >>>> data you had provided=2E
> >>> What tests could I do or what info should I provide to help?
> >> Can you please rebuild Xen with this patch:
> >>
> >> diff --git a/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> >> b/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> >> index 2fdebd2d74c9=2E=2E747eae25f56c 100644
> >> --- a/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> >> +++ b/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> >> @@ -1033,7 +1033,7 @@ static int __init parse_ivrs_table(struct
> >> acpi_table_header *table)
> >> =C2=A0=C2=A0=C2=A0=C2=A0 const struct acpi_ivrs_header *ivrs_block;
> >> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long length;
> >> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int apic;
> >> -=C2=A0=C2=A0=C2=A0 bool_t sb_ioapic =3D !iommu_intremap;
> >> +=C2=A0=C2=A0=C2=A0 bool_t sb_ioapic =3D 1;
> >> =C2=A0=C2=A0=C2=A0=C2=A0 int error =3D 0;
> >> =C2=A0
> >> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(!table);
> >>
> >> which should cause the behaviour to revert back to that of Xen 4=2E0=
=2E1=C2=A0
> >> (i=2Ee=2E it will fully ignore the checks relating to the southbridge=
 ioapic)=2E
> >>
> >> Confirm that with this, and booting Xen simply with `iommu=3D1` that =
full
> >> DMA remapping and interrupt remapping is considered active=2E
> >>
> >>
> >> Then, can you play around with passing the soundblaster through to VM=
s=2E=C2=A0
> >> Looking at the LSPCI you provided, it only supports legacy line inter=
rupts=2E
> >>
> >> Does the device work fine, or do you get a bunch of errors on `xl dme=
sg`
> >> about IO page faults (which is a generic "IOMMU said no to something"
> >> message)?
> > Sorry, it took my awhile to get it done=2E
> >
> > The relevant things are enabled again, passthrough works (even the PCI=
 Audigy2)=20
> > and the devices are recognzied in the HVM domU=2E
> >
> > As you suspected, there are a few IO page faults at the end of the boo=
t process
> > (from my limited understanding it's maybe related to=20
> > "00:14=2E0 SMBus: Advanced Micro Devices, Inc=2E [AMD/ATI] SBx00 SMBus=
 Controller (rev 41)")
> >
> > I'll attach the "xl dmesg" output file=2E
>=20
> Do you have this file?
>=20
> If they're only at the end of boot and not later around passthrough,
> then they might be from other functionality in the Southbridge=2E

Sorry, my bad, forgot to attach it :(

After booting, the messages appear only ant the end, yet when running the =
HVM domU,
a few lines pop up there as well=2E

Also, the domU in question seems to use more CPU that it did on the old sy=
stem=2E
I don't know if this is a downside of the newer Xen versions and the chnge=
s made
over time=2E=20
=20

Denis
--rehcsed-13d9dd57-108b-435f-b80f-c82a81507656
Content-Type: text/plain
Content-Disposition: attachment; filename=xl_dmesg_patched_iommu.txt

(XEN) Xen version 4.14.5 (Devuan 4.14.5+86-g1c354767d5-1) (pkg-xen-devel@lists.alioth.debian.org) (x86_64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110) debug=n  Fri Nov  4 19:25:46 UTC 2022
(XEN) build-id: 0f2f44d0ec7833c8466e02314aff674d56788116
(XEN) Bootloader: GRUB 2.06-3~deb11u5
(XEN) Command line: placeholder dom0_mem=768M,max:768M iommu=1,debug loglvl=all guest_loglvl=all
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
(XEN) Detected 2611.812 MHz processor.
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
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 2
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) ..no 8254 timer found - trying HPET Legacy Replacement Mode
(XEN) ..no HPET timer found - reverting Legacy Replacement Mode
(XEN) ..MP-BIOS bug: 8254 timer not connected to IO-APIC
(XEN) ...trying to set up timer (IRQ0) through the 8259A ...  failed.
(XEN) ...trying to set up timer as Virtual Wire IRQ... works.
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
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8010140 flags 0x8 I
(XEN) CPU1: No irq handler for vector 20 (IRQ -2147483648)
(XEN) CPU2: No irq handler for vector 20 (IRQ -2147483648)
(XEN) Brought up 4 CPUs
(XEN) CPU3: No irq handler for vector 20 (IRQ -2147483648)
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
(XEN) AMD-Vi: Setup I/O page table: device id = 0, type = 0x6, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x10, type = 0x2, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x28, type = 0x2, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x30, type = 0x2, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x38, type = 0x2, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x68, type = 0x2, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x88, type = 0x7, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x90, type = 0x7, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x92, type = 0x7, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x98, type = 0x7, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x9a, type = 0x7, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa0, type = 0x7, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa3, type = 0x7, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x5, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa5, type = 0x7, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xb0, type = 0x7, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xb2, type = 0x7, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.0
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.1
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.2
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.3
(XEN) AMD-Vi: Skipping host bridge 0000:00:18.4
(XEN) AMD-Vi: Setup I/O page table: device id = 0x100, type = 0x1, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x101, type = 0x1, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x400, type = 0x1, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x500, type = 0x1, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x501, type = 0x1, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x502, type = 0x1, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0x503, type = 0x1, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x7, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x7, root table = 0x42e205000, domain = 0, paging mode = 3
(XEN) AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x7, root table = 0x42e205000, domain = 0, paging mode = 3
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
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8000140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf80f0160 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8100160 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8000140 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8110160 flags 0x8 I
(XEN) AMD-Vi: IO_PAGE_FAULT: 0000:00:14.0 d0 addr 000000fdf8070140 flags 0x8 I
--rehcsed-13d9dd57-108b-435f-b80f-c82a81507656--


