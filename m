Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /uGvEArC1Wkx9gcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 04:48:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4600C3B64AE
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 04:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275377.1561218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAIx8-0002Sh-RX; Wed, 08 Apr 2026 02:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275377.1561218; Wed, 08 Apr 2026 02:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAIx8-0002QR-Ls; Wed, 08 Apr 2026 02:47:38 +0000
Received: by outflank-mailman (input) for mailman id 1275377;
 Wed, 08 Apr 2026 02:47:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wAIx6-0002QL-5a
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 02:47:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAIx4-00643i-PB
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 04:47:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d5c1b9-5cb7-0a2a0a5109dd-0a2a4502be28-10
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 04:47:34 +0200
Received: from [202.12.124.156] (helo=fhigh-b5-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d5c1c5-42fa-0a2a45020019-ca0c7c9cd8ed-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 04:47:34 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 8A00B7A0010;
 Tue,  7 Apr 2026 22:47:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 07 Apr 2026 22:47:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Apr 2026 22:47:31 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1775616452;
	 x=1775702852; bh=S+ckoboVkyQ99dwh0PNSzJ4p927XjfN5Li5bhcCuPkQ=; b=
	Zd6XHFDhdzT3rtGIMXSBUSVwXu58C673Vgt0pP+8h3Y3+UBpDJGId5KJvHmbTJ3o
	3EmxVz1GiR1u6ejdeUJY6+1RNYDM//S9X1FEot0HTm1Tdh6wy078hWllS6+0IIOJ
	sirm6EEPmvaJb6iCImWtfszoHjpY7G61ka+P20MjtZlX0b3uR9FGo8vk/fNoartZ
	3o200+PIddSClfkeGrW+BLkr3pmHq9uDlFYVP/19CFIpyjKtSvV/+qurxoCMDymu
	0QcItL1s75IMb/Q/SFqDGY6dSP+Cgw+6kHTCfbgpfy5EPzL2WMlSZMRTdOHHA3ax
	DXulCBCYzF8d7BOcyeFh2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775616452; x=1775702852; bh=S+ckoboVkyQ99dwh0PNSzJ4p927XjfN5Li5
	bhcCuPkQ=; b=OSXjuaywefDlEAeNoW5XrE3DIPfIHtVTeXGDQlDY9sy4EzgGcc2
	G7W1Khm29vJKKrAW2jquaBjHkA/TwKiC/gWzMj+nJDHkA810PkpCu8qtPodxRLGX
	oz31HTnW6aOWUiPSt+ffrHV+zf+kNo7uz85AzKTOC/hhmoJbrPFpa1gsTziphXmu
	fF3DTz5CZysd03SEeI/51yFN/kQx2b+J9ROBTzZ7Sa7n2jpR1QyENuTwhimKv36E
	chC8UCWpnrRjtvlVQtn2DIoJNkeHExyasIM1KZB3Xm4CHSdZuArwvjoNcIbeHq+C
	yZTZTcZayzr2FlInN/UgaEIvlYE6RhtTaDg==
X-ME-Sender: <xms:xMHVabjFiu9bXTnWAQum7J8Mr-oLURmk8raCwcDLnN8Zayb-UpGHfA>
    <xme:xMHVae5lhpyM5yE4GMskeWlU5MdNEe0r1P49yko0R1pzFV2se9cfXXTopBzLG6otR
    8C_liA9018FORTyl6m9U5lAaZMVhW_H0FlgcfISerxNR7IkjQ>
X-ME-Received: <xmr:xMHVaTbNR2O2Sy4o1-V2L7StLlB5SKXfIbZWL8qMloNnBIGjQ55oyvawoaRT5SANtgcb7lx8fjopSALJcUOyOK5Gjc-CTVdLjT8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvvdegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvieegfefg
    ieejuedutefhffehjeegjeevuedtgeduteeujeetveevudevieffkeenucffohhmrghinh
    epghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehkvghvihhnrdgsrhhoughskhihsegrrhhmrdgtohhmpd
    hrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgv
    fidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvh
    gvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepsghorhhi
    shdrohhsthhrohhvshhkhiesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:xMHVaT4OWk-IN3ibhJGmP-r2q23DvIxWadZ3XmspcpZVoZyKyVYDTA>
    <xmx:xMHVaWCBYcxwjYre8V8fQW6pPV-SO9aj_NrXZujOdHjDwIjYEbQJUQ>
    <xmx:xMHVaZevPCi15Y2FFDPGnwlqIFVn3gIhvfYcyNkZ-YuPCVFnCpzipA>
    <xmx:xMHVaVK1Bc_5MhTHH2pm8zHx6-w7RgF-ab6FEVEgs9iXyWMmqcXzaw>
    <xmx:xMHVaXMorHxodo9VGu2ENyCZ32wC_LCfEyEwIiF6ov1SSmHyaM3cxHbe>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 8 Apr 2026 04:47:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1
Message-ID: <adXBwU9KAdb2gNeB@mail-itl>
References: <aaBH3EAchUwKhrUA@mail-itl>
 <c2f973a0-fcb5-48ea-9638-cd73fa3e37ce@citrix.com>
 <c712c06f-7fcf-4876-b2d7-f2b7bc6f0dea@suse.com>
 <adIuP7-sNwuOid80@mail-itl>
 <5d068304-837d-4aef-b8a7-87c91ccf96b4@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MOg8fIXj0kDdUuxl"
Content-Disposition: inline
In-Reply-To: <5d068304-837d-4aef-b8a7-87c91ccf96b4@arm.com>
X-purgate-ID: tlsNG-720697/1775616454-45132CD1-6BF24663/0/0
X-purgate-type: clean
X-purgate-size: 16199
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:kevin.brodsky@arm.com,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,s:lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 4600C3B64AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--MOg8fIXj0kDdUuxl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 8 Apr 2026 04:47:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1

On Tue, Apr 07, 2026 at 11:23:17AM +0200, Kevin Brodsky wrote:
> On 05/04/2026 11:41, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Feb 26, 2026 at 02:41:12PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> >> On 26.02.26 14:27, Andrew Cooper wrote:
> >>> On 26/02/2026 1:17 pm, Marek Marczykowski-G=C3=B3recki wrote:
> >>>> Hi,
> >>>>
> >>>> When testing Linux 7.0-rc1 in PV dom0, I hit the following panic
> >>>> sometimes:
> >>>>
> >>>> [  436.849614] ------------[ cut here ]------------
> >>>> [  436.849669] kernel BUG at arch/x86/include/asm/xen/hypervisor.h:7=
8!
> >>>> [  436.849693] Oops: invalid opcode: 0000 [#1] SMP NOPTI
> >>>> [  436.849710] CPU: 3 UID: 0 PID: 4021 Comm: kworker/u25:1 Not taint=
ed 7.0.0-0.rc1.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)
> >>>> [  436.849729] Hardware name: Star Labs StarBook/StarBook, BIOS 8.97=
 10/03/2023
> >>>> [  436.849743] Workqueue: i915_flip intel_atomic_commit_work [i915]
> >>>> [  436.850226] RIP: e030:xen_enter_lazy_mmu+0x24/0x30
> >>>> [  436.850245] Code: 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 65=
 8b 05 b8 e5 02 03 85 c0 75 10 65 c7 05 a9 e5 02 03 01 00 00 00 c3 cc cc cc=
 cc <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90
> >>>> [  436.850270] RSP: e02b:ffffc90045727a68 EFLAGS: 00010202
> >>>> [  436.850283] RAX: 0000000000000001 RBX: ffff8881042fa6d0 RCX: 000f=
ffffffe00000
> >>>> [  436.850296] RDX: 0000000000000001 RSI: ffff88810a5a2980 RDI: 0000=
000000000000
> >>>> [  436.850308] RBP: ffffc90049eda000 R08: ffffc90049edc000 R09: ffff=
c90049edc000
> >>>> [  436.850320] R10: ffffc90049edc000 R11: ffffc90049edbfff R12: ffff=
c90049edc000
> >>>> [  436.850332] R13: ffffc90045727bb0 R14: ffffc90045727b28 R15: 8000=
00000000006b
> >>>> [  436.850356] FS:  0000000000000000(0000) GS:ffff888201e6e000(0000)=
 knlGS:0000000000000000
> >>>> [  436.850371] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>>> [  436.850383] CR2: 00006543dbade250 CR3: 0000000115ef1000 CR4: 0000=
000000050660
> >>>> [  436.850401] Call Trace:
> >>>> [  436.850410]  <TASK>
> >>>> [  436.850420]  vmap_pages_pud_range+0x47c/0x530
> >>>> [  436.850439]  vmap_small_pages_range_noflush+0x1f1/0x2b0
> >>>> [  436.850451]  ? __get_vm_area_node+0x10a/0x170
> >>>> [  436.850465]  vmap+0x79/0xd0
> >>>> [  436.850476]  i915_gem_object_map_page+0x13b/0x210 [i915]
> >>>> [  436.850812]  i915_gem_object_pin_map+0x1e2/0x210 [i915]
> >>>> [  436.851123]  i915_gem_object_pin_map_unlocked+0x2d/0xa0 [i915]
> >>>> [  436.851424]  intel_dsb_buffer_create+0xed/0x1a0 [i915]
> >>>> [  436.851778]  intel_dsb_prepare+0xca/0x1a0 [i915]
> >>>> [  436.852110]  intel_atomic_dsb_finish+0x92/0x350 [i915]
> >>>> [  436.852456]  intel_atomic_commit_tail+0x326/0xd40 [i915]
> >>>> [  436.852769]  process_one_work+0x18d/0x380
> >>>> [  436.852779]  worker_thread+0x196/0x300
> >>>> [  436.852787]  ? __pfx_worker_thread+0x10/0x10
> >>>> [  436.852796]  kthread+0xe3/0x120
> >>>> [  436.852805]  ? __pfx_kthread+0x10/0x10
> >>>> [  436.852815]  ret_from_fork+0x19e/0x260
> >>>> [  436.852824]  ? __pfx_kthread+0x10/0x10
> >>>> [  436.852832]  ret_from_fork_asm+0x1a/0x30
> >>>> [  436.852842]  </TASK>
> >>>> [  436.852847] Modules linked in: snd_seq_dummy snd_hrtimer snd_hda_=
codec_intelhdmi snd_hda_codec_hdmi snd_hda_codec_alc269 snd_hda_codec_realt=
ek_lib snd_hda_scodec_component snd_hda_codec_generic snd_hda_intel snd_sof=
_pci_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic soundwire_in=
tel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_soc_hdac_hda snd=
_sof_intel_hda_mlink snd_sof_intel_hda soundwire_cadence snd_sof_pci snd_so=
f_xtensa_dsp snd_sof snd_sof_utils snd_soc_acpi_intel_match snd_soc_acpi_in=
tel_sdca_quirks soundwire_generic_allocation snd_soc_sdw_utils snd_soc_acpi=
 crc8 intel_rapl_msr soundwire_bus intel_rapl_common snd_soc_sdca snd_soc_a=
vs snd_soc_hda_codec snd_hda_ext_core snd_hda_codec vfat intel_uncore_frequ=
ency_common fat snd_hda_core snd_intel_dspcfg snd_intel_sdw_acpi snd_hwdep =
intel_powerclamp snd_soc_core iwlwifi snd_compress spi_nor iTCO_wdt ac97_bu=
s intel_pmc_bxt ee1004 mtd snd_pcm_dmaengine snd_seq cfg80211 snd_seq_devic=
e pcspkr spi_intel_pci snd_pcm rfkill spi_intel snd_timer snd
> >>>> [  436.852939]  i2c_i801 soundcore i2c_smbus idma64 intel_pmc_core p=
mt_telemetry pmt_discovery pmt_class intel_hid intel_pmc_ssram_telemetry in=
tel_scu_pltdrv sparse_keymap joydev loop fuse xenfs nfnetlink vsock_loopbac=
k vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock zram vmw=
_vmci lz4hc_compress lz4_compress dm_thin_pool dm_persistent_data dm_bio_pr=
ison dm_crypt xe drm_ttm_helper drm_suballoc_helper gpu_sched drm_gpuvm drm=
_exec drm_gpusvm_helper i915 i2c_algo_bit drm_buddy hid_multitouch i2c_hid_=
acpi ghash_clmulni_intel video nvme wmi ttm i2c_hid nvme_core nvme_keyring =
drm_display_helper nvme_auth xhci_pci pinctrl_tigerlake thunderbolt hkdf ce=
c xhci_hcd intel_vsec serio_raw xen_acpi_processor xen_privcmd xen_pciback =
xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_rdac scsi_dh_emc scs=
i_dh_alua uinput i2c_dev
> >>>> [  436.853183] ---[ end trace 0000000000000000 ]---
> >>>>
> >>>> or this:
> >>>>
> >>>> [  548.736884] ------------[ cut here ]------------
> >>>> [  548.736907] kernel BUG at arch/x86/include/asm/xen/hypervisor.h:8=
5!
> >>>> [  548.736923] Oops: invalid opcode: 0000 [#1] SMP NOPTI
> >>>> [  548.736935] CPU: 0 UID: 0 PID: 206 Comm: kworker/0:2 Not tainted =
7.0.0-0.rc1.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)
> >>>> [  548.736949] Hardware name: LENOVO 2347A45/2347A45, BIOS CBET4000 =
Nitrokey-v0.2.0-2608-ga649597 01/01/1970
> >>>> [  548.736962] Workqueue: events delayed_vfree_work
> >>>> [  548.736976] RIP: e030:xen_leave_lazy_mmu+0x44/0x50
> >>>> [  548.736989] Code: 02 03 83 f8 01 75 23 65 c7 05 6c e4 02 03 00 00=
 00 00 65 ff 0d 7d b8 02 03 74 05 c3 cc cc cc cc e8 61 5d fd ff c3 cc cc cc=
 cc <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90
> >>>> [  548.737010] RSP: e02b:ffffc90040607cf0 EFLAGS: 00010297
> >>>> [  548.737018] RAX: 0000000000000000 RBX: ffff888164a70408 RCX: 0000=
000000000000
> >>>> [  548.737029] RDX: 0000000000000000 RSI: 000ffffffffff000 RDI: ffff=
8881069c0000
> >>>> [  548.737039] RBP: ffffc90049681000 R08: ffffc90049681000 R09: 0000=
000000000027
> >>>> [  548.737050] R10: 0000000000000027 R11: fefefefefefefeff R12: ffff=
c90049681000
> >>>> [  548.737060] R13: ffff8881002fd258 R14: 0000000000000000 R15: ffff=
c90040607dac
> >>>> [  548.737079] FS:  0000000000000000(0000) GS:ffff8881f88ee000(0000)=
 knlGS:0000000000000000
> >>>> [  548.737090] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>>> [  548.737099] CR2: 000055576c2e6058 CR3: 000000010d47b000 CR4: 0000=
000000050660
> >>>> [  548.737115] Call Trace:
> >>>> [  548.737123]  <TASK>
> >>>> [  548.737128]  vunmap_pmd_range.isra.0+0x1f1/0x2e0
> >>>> [  548.737142]  vunmap_p4d_range+0x17d/0x290
> >>>> [  548.737151]  __vunmap_range_noflush+0x182/0x1d0
> >>>> [  548.737161]  ? _raw_spin_unlock+0xe/0x30
> >>>> [  548.737171]  remove_vm_area+0x40/0x70
> >>>> [  548.737180]  vfree.part.0+0x1b/0x290
> >>>> [  548.737189]  delayed_vfree_work+0x35/0x50
> >>>> [  548.737198]  process_one_work+0x18d/0x380
> >>>> [  548.737207]  worker_thread+0x196/0x300
> >>>> [  548.737215]  ? __pfx_worker_thread+0x10/0x10
> >>>> [  548.737224]  kthread+0xe3/0x120
> >>>> [  548.737233]  ? __pfx_kthread+0x10/0x10
> >>>> [  548.737242]  ret_from_fork+0x19e/0x260
> >>>> [  548.737250]  ? __pfx_kthread+0x10/0x10
> >>>> [  548.737258]  ret_from_fork_asm+0x1a/0x30
> >>>> [  548.737269]  </TASK>
> >>>> [  548.737274] Modules linked in: vfat fat snd_seq_dummy snd_hrtimer=
 ath9k ath9k_common snd_hda_codec_intelhdmi snd_hda_codec_hdmi ath9k_hw snd=
_hda_codec_alc269 snd_hda_codec_realtek_lib snd_hda_scodec_component snd_hd=
a_codec_generic snd_hda_intel snd_hda_codec mac80211 snd_hda_core snd_intel=
_dspcfg snd_intel_sdw_acpi snd_hwdep ath snd_seq snd_seq_device snd_ctl_led=
 cfg80211 snd_pcm at24 thinkpad_acpi intel_rapl_msr i2c_i801 snd_timer spar=
se_keymap iTCO_wdt intel_rapl_common platform_profile intel_powerclamp inte=
l_pmc_bxt pcspkr i2c_smbus rfkill libarc4 snd soundcore mei_me e1000e mei j=
oydev lpc_ich loop fuse xenfs nfnetlink vsock_loopback vmw_vsock_virtio_tra=
nsport_common vmw_vsock_vmci_transport vsock zram vmw_vmci lz4hc_compress l=
z4_compress dm_thin_pool dm_persistent_data dm_bio_prison dm_crypt i915 i2c=
_algo_bit drm_buddy ghash_clmulni_intel ttm sdhci_pci drm_display_helper sd=
hci_uhs2 sdhci video xhci_pci cqhci wmi cec xhci_hcd ehci_pci mmc_core ehci=
_hcd serio_raw xen_acpi_processor xen_privcmd xen_pciback
> >>>> [  548.737348]  xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_=
dh_rdac scsi_dh_emc scsi_dh_alua uinput i2c_dev
> >>>> [  548.737469] ---[ end trace 0000000000000000 ]---
> >>>>
> >>>> I don't have clear pattern when this happens, one was during host
> >>>> suspend, but the other was during "normal" test run (starting/stoppi=
ng
> >>>> domUs and running stuff around them). Note also one of those is Intel
> >>>> and the other AMD, so it isn't really hardware specific.
> >>>>
> >>>> Slightly more details with links (especially serial0.txt in the logs
> >>>> tab) at
> >>>> https://github.com/QubesOS/qubes-linux-kernel/pull/662#issuecomment-=
3963326188
> >>>>
> >>>> Any idea?
> >>>>
> >>> That looks like the issue Juergen fixed with:
> >>>
> >>> https://lore.kernel.org/xen-devel/20260220123715.834848-1-jgross@suse=
=2Ecom/
> >> No, it doesn't. The fix is already in rc1, and the crash was quite ear=
ly during
> >> boot (before any secondary CPUs were brought up).
> >>
> >> I guess this problem is related to the lazy_mmu_state series [1].
>=20
> That may well be the case - it seems that xen_enter_lazy_mmu() is called
> while already in lazy MMU mode (first splat), and xen_leave_lazy_mmu()
> is called without being in lazy MMU mode (second splat). I expect this
> is something specific to Xen, which I didn't get the chance to test.
>=20
> Looking at the series again I don't see anything obviously wrong, but I
> think the riskiest change is commit 291b3abed657 ("x86/xen: use
> lazy_mmu_state when context-switching") - worth trying to revert it.

With that reverted (on top of 7.0-rc6, didn't updated to rc7 yet), I
still got panic, although might be a bit different one:

[    8.099973] BUG: unable to handle page fault for address: ffff8880080006=
70
[    8.100004] #PF: supervisor write access in kernel mode
[    8.100021] #PF: error_code(0x0003) - permissions violation
[    8.100037] PGD 3a00067 P4D 3a00067 PUD 3a01067 PMD 7cd7063 PTE 80000000=
08000021
[    8.100063] Oops: Oops: 0003 [#1] SMP PTI
[    8.100079] CPU: 0 UID: 0 PID: 226 Comm: kworker/0:2 Not tainted 7.0.0-0=
=2Erc6.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)=20
[    8.100110] Workqueue: events do_free_init
[    8.100126] RIP: 0010:native_set_pte+0x4/0x10
[    8.100145] Code: 00 03 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 =
0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa <48=
> 89 37 c3 cc cc cc cc 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90
[    8.100195] RSP: 0018:ffffc90000c97c48 EFLAGS: 00010287
[    8.100212] RAX: e00c4f3d8b48c03e RBX: ffff888008000670 RCX: e0000000000=
0003e
[    8.100234] RDX: e00c4f3d8b48c13e RSI: e00c4f3d8b48c03e RDI: ffff8880080=
00670
[    8.100260] RBP: e00c4f3d8b48c13e R08: 0000000000000000 R09: 00000000000=
00001
[    8.100282] R10: 0000003b0c274b73 R11: e00000000000013e R12: ffffc90000c=
97cf0
[    8.100304] R13: ffffffffc04ce000 R14: fffc4f3d8b48cfff R15: e0000000000=
0013e
[    8.100327] FS:  0000000000000000(0000) GS:ffff888094e81000(0000) knlGS:=
0000000000000000
[    8.100350] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.100369] CR2: ffff888008000670 CR3: 000000000242e003 CR4: 00000000001=
706f0
[    8.100394] Call Trace:
[    8.100404]  <TASK>
[    8.100413]  __change_page_attr+0x24f/0x350
[    8.100429]  __change_page_attr_set_clr+0x61/0xd0
[    8.100446]  change_page_attr_set_clr+0x103/0x1a0
[    8.100467]  set_memory_nx+0x39/0x50
[    8.100481]  __execmem_cache_free+0x35/0xb0
[    8.100496]  execmem_free+0x9f/0x180
[    8.100510]  ? nft_chain_nat_exit+0xe70/0xe70 [nft_chain_nat]
[    8.100531]  do_free_init+0x2e/0x60
[    8.100545]  process_one_work+0x198/0x390
[    8.100559]  worker_thread+0x1af/0x320
[    8.100573]  ? __pfx_worker_thread+0x10/0x10
[    8.103338]  kthread+0xe3/0x120
[    8.103355]  ? __pfx_kthread+0x10/0x10
[    8.103369]  ret_from_fork+0x19e/0x260
[    8.103384]  ? __pfx_kthread+0x10/0x10
[    8.103397]  ret_from_fork_asm+0x1a/0x30
[    8.103412]  </TASK>
[    8.103421] Modules linked in: xenfs nft_reject_inet nf_reject_ipv4 nf_r=
eject_ipv6 nft_reject nft_redir nft_ct nft_chain_nat nf_nat nf_conntrack nf=
_defrag_ipv6 nf_defrag_ipv4 nf_tables binfmt_misc intel_rapl_msr intel_rapl=
_common ghash_clmulni_intel xen_netfront xen_privcmd xen_gntdev xen_gntallo=
c xen_blkback xen_evtchn fuse loop nfnetlink ip_tables overlay xen_blkfront
[    8.103529] CR2: ffff888008000670
[    8.103542] ---[ end trace 0000000000000000 ]---
[    8.103558] RIP: 0010:native_set_pte+0x4/0x10
[    8.103576] Code: 00 03 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 =
0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa <48=
> 89 37 c3 cc cc cc cc 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90
[    8.103625] RSP: 0018:ffffc90000c97c48 EFLAGS: 00010287
[    8.103641] RAX: e00c4f3d8b48c03e RBX: ffff888008000670 RCX: e0000000000=
0003e
[    8.103664] RDX: e00c4f3d8b48c13e RSI: e00c4f3d8b48c03e RDI: ffff8880080=
00670
[    8.103686] RBP: e00c4f3d8b48c13e R08: 0000000000000000 R09: 00000000000=
00001
[    8.103708] R10: 0000003b0c274b73 R11: e00000000000013e R12: ffffc90000c=
97cf0
[    8.103730] R13: ffffffffc04ce000 R14: fffc4f3d8b48cfff R15: e0000000000=
0013e
[    8.103753] FS:  0000000000000000(0000) GS:ffff888094e81000(0000) knlGS:=
0000000000000000
[    8.103775] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.103794] CR2: ffff888008000670 CR3: 000000000242e003 CR4: 00000000001=
706f0
[    8.103820] Kernel panic - not syncing: Fatal exception
[    8.103929] Kernel Offset: disabled


> If
> that doesn't help, I'd suggest bisecting the following range:
> 58852f24f956..291b3abed657

It will take some time, as the issue doesn't happen every time.

> Sorry for the trouble!
>=20
> - Kevin
>=20
> > FWIW, the issue still happens on 7.0-rc6.
> >
> >> Juergen
> >>
> >> [1]: https://lore.kernel.org/lkml/20251215150323.2218608-1-kevin.brods=
ky@arm.com/

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--MOg8fIXj0kDdUuxl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnVwcEACgkQ24/THMrX
1yx1Mgf/RLh6CgZcJNrf48v+HsYun/qkJTgPqp0IAR/MHLzzHMNtwwiEJDFuCZLQ
U3j0Gs9hb8bMtd6dPwankJQSkibdmZ6StezSEow9MYx6v/wF6syxKC9nQo3pk5El
KoPUIJ6hqXV7nOPt2rP/dDyCjZHreaK6UtW7kuLcg6oO5qV1v70fi3vaVhT1ql23
w6p5BUrjZVPz10H0+iNmIFqhO0/OMTw2JBzIp/UjOtVsN7AXw8lQYp6sb2DuztCy
cHTcO1ULQIDexXtX8MmuhT3nY1ziOGQgEnyYnCjzZV4wy2rba+4pUNrQ+31TA23S
eEabTMMPj3sU48N6Ag+DDuATVa9aiw==
=hUuY
-----END PGP SIGNATURE-----

--MOg8fIXj0kDdUuxl--

