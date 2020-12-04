Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED072CECC1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44410.79549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8xN-0006Q6-AH; Fri, 04 Dec 2020 11:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44410.79549; Fri, 04 Dec 2020 11:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8xN-0006Pf-4q; Fri, 04 Dec 2020 11:08:57 +0000
Received: by outflank-mailman (input) for mailman id 44410;
 Fri, 04 Dec 2020 11:08:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCoV=FI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kl8xK-0006Pa-GA
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:08:54 +0000
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e819146b-636c-4bf6-bf38-840aa4604e32;
 Fri, 04 Dec 2020 11:08:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E2F855C0116;
 Fri,  4 Dec 2020 06:08:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 04 Dec 2020 06:08:52 -0500
Received: from mail-itl (unknown [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id C68AC240057;
 Fri,  4 Dec 2020 06:08:50 -0500 (EST)
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
X-Inumbo-ID: e819146b-636c-4bf6-bf38-840aa4604e32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pE2wbx
	tydrzwQsmeEJiqEhudgsi/298pIjDCfrCe31k=; b=RA2fCGRA+2UCP/UlmO0o6i
	6KpC3gbmIoVy7pySCWRP9FrEZLpVXkx4S/LZLjyO9Ih2Bw1ZHZPRnxKMeExPUwwA
	bbspdFpjfSZeMQyqhRJrFFbu7yNSGj/cYv2hCnCXmSNfTIDFR/4LgW2f36Onc0BZ
	EQUD9nFpU8AJQI4QZe+uzfOBsr78rsq+RKBzMqNq1oe3RA2xbFBP4DE7u8SNoXaX
	P96MILn+Ldl8lVHWhMjetOzQ3VkNoJzDIisTpuGWCG2b3xpA1xJMzzVAyb8sSj7b
	DhmhHfry6VhTd1OWnctqxQF6orQhkpgsAhtw76jgKCN7zyMYos8T4dsnZ9Ncik3Q
	==
X-ME-Sender: <xms:wxjKX7aLi9mDY1DnK2m0WV8_t6q-Qu4gvHR-27MFbWQiHsRg1FEt6w>
    <xme:wxjKX6YcruexLR9PhWmOIrNDpE8P6KIbmYFkJHyDAtDHW6c3J3997WxYPKZCvH3ZV
    q6M1ZryFiwQZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeikedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
    durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:wxjKX9-uR2dIjUi9EXEAJGWujLIw7jFU_9x4qJt1kXkL3-CKECziuw>
    <xmx:wxjKXxo7GT0NEcLK4IaXaF_rfslDyYrNOmSHGUIH9MIfvPbuCEt1iw>
    <xmx:wxjKX2pKE_PXD3oDPpVwtWWdg015qxxEeXAz51zfB2ta1pXIxH36sQ>
    <xmx:xBjKX_kXmOM-s69NFQAlxjPr0KM0eAOevxNE4SEtslw9Rxjno9lfnA>
Date: Fri, 4 Dec 2020 12:08:47 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org
Subject: Re: GPF on 0xdead000000000100 in nvme_map_data - Linux 5.9.9
Message-ID: <20201204110847.GU201140@mail-itl>
References: <20201129035639.GW2532@mail-itl>
 <20201130164010.GA23494@redsun51.ssa.fujisawa.hgst.com>
 <20201202000642.GJ201140@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lKkRBIzN5W0l28vM"
Content-Disposition: inline
In-Reply-To: <20201202000642.GJ201140@mail-itl>


--lKkRBIzN5W0l28vM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: GPF on 0xdead000000000100 in nvme_map_data - Linux 5.9.9

On Wed, Dec 02, 2020 at 01:06:46AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Dec 01, 2020 at 01:40:10AM +0900, Keith Busch wrote:
> > On Sun, Nov 29, 2020 at 04:56:39AM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > I can reliably hit kernel panic in nvme_map_data() which looks like t=
he
> > > one below. It happens on Linux 5.9.9, while 5.4.75 works fine. I have=
n't
> > > tried other version on this hardware. Linux is running as Xen
> > > PV dom0, on top of nvme there is LUKS and then LVM with thin
> > > provisioning. The crash happens reliably when starting a Xen domU (wh=
ich
> > > uses one of thin provisioned LVM volumes as its disk). But booting do=
m0
> > > works fine (even though it is using the same disk setup for its root
> > > filesystem).
> > >=20
> > > I did a bit of debugging and found it's about this part:
> > >=20
> > > drivers/nvme/host/pci.c:
> > >  800 static blk_status_t nvme_map_data(struct nvme_dev *dev, struct r=
equest *req,
> > >  801         struct nvme_command *cmnd)
> > >  802 {
> > >  803     struct nvme_iod *iod =3D blk_mq_rq_to_pdu(req);
> > >  804     blk_status_t ret =3D BLK_STS_RESOURCE;
> > >  805     int nr_mapped;
> > >  806=20
> > >  807     if (blk_rq_nr_phys_segments(req) =3D=3D 1) {
> > >  808         struct bio_vec bv =3D req_bvec(req);
> > >  809=20
> > >  810         if (!is_pci_p2pdma_page(bv.bv_page)) {
> > >=20
> > > Here, bv.bv_page->pgmap is LIST_POISON1, while page_zonenum(bv.bv_pag=
e)
> > > says ZONE_DEVICE. So, is_pci_p2pdma_page() crashes on accessing
> > > bv.bv_page->pgmap->type.
> >=20
> > Something sounds off. I thought all ZONE_DEVICE pages require a pgmap
> > because that's what holds a references to the device's live-ness. What
> > are you allocating this memory from that makes ZONE_DEVICE true without
> > a pgmap?
>=20
> Well, I allocate anything myself. I just try to start the system with
> unmodified Linux 5.9.9 and NVME drive...
> I didn't managed to find where this page is allocated, nor where it gets
> broken. I _suspect_ it gets allocated as ZONE_DEVICE page and then gets
> released as ZONE_NORMAL which sets another part of the union to
> LIST_POISON1. But I have absolutely no data to confirm/deny this theory.

I've bisected this (thanks to a bit of scripting, PXE and git bisect
run, it was long, but fairly painless) and identified this commit as the
culprit:=20

commit 9e2369c06c8a181478039258a4598c1ddd2cadfa
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Tue Sep 1 10:33:26 2020 +0200

    xen: add helpers to allocate unpopulated memory
   =20
I'm adding relevant people and xen-devel to the thread.
For completeness, here is the original crash message:

general protection fault, probably for non-canonical address 0xdead00000000=
0100: 0000 [#1] SMP NOPTI
CPU: 1 PID: 134 Comm: kworker/u12:2 Not tainted 5.9.9-1.qubes.x86_64 #1
Hardware name: LENOVO 20M9CTO1WW/20M9CTO1WW, BIOS N2CET50W (1.33 ) 01/15/20=
20
Workqueue: dm-thin do_worker [dm_thin_pool]
RIP: e030:nvme_map_data+0x300/0x3a0 [nvme]
Code: b8 fe ff ff e9 a8 fe ff ff 4c 8b 56 68 8b 5e 70 8b 76 74 49 8b 02 48 =
c1 e8 33 83 e0 07 83 f8 04 0f 85 f2 fe ff ff 49 8b 42 08 <83> b8 d0 00 00 0=
0 04 0f 85 e1 fe ff ff e9 38 fd ff ff 8b 55 70 be
RSP: e02b:ffffc900010e7ad8 EFLAGS: 00010246
RAX: dead000000000100 RBX: 0000000000001000 RCX: ffff8881a58f5000
RDX: 0000000000001000 RSI: 0000000000000000 RDI: ffff8881a679e000
RBP: ffff8881a5ef4c80 R08: ffff8881a5ef4c80 R09: 0000000000000002
R10: ffffea0003dfff40 R11: 0000000000000008 R12: ffff8881a679e000
R13: ffffc900010e7b20 R14: ffff8881a70b5980 R15: ffff8881a679e000
FS:  0000000000000000(0000) GS:ffff8881b5440000(0000) knlGS:0000000000000000
CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000001d64408 CR3: 00000001aa2c0000 CR4: 0000000000050660
Call Trace:
 nvme_queue_rq+0xa7/0x1a0 [nvme]
 __blk_mq_try_issue_directly+0x11d/0x1e0
 ? add_wait_queue_exclusive+0x70/0x70
 blk_mq_try_issue_directly+0x35/0xc0l[
 blk_mq_submit_bio+0x58f/0x660
 __submit_bio_noacct+0x300/0x330
 process_shared_bio+0x126/0x1b0 [dm_thin_pool]
 process_cell+0x226/0x280 [dm_thin_pool]
 process_thin_deferred_cells+0x185/0x320 [dm_thin_pool]
 process_deferred_bios+0xa4/0x2a0 [dm_thin_pool]UX
 do_worker+0xcc/0x130 [dm_thin_pool]
 process_one_work+0x1b4/0x370
 worker_thread+0x4c/0x310
 ? process_one_work+0x370/0x370
 kthread+0x11b/0x140
 ? __kthread_bind_mask+0x60/0x60<
 ret_from_fork+0x22/0x30
Modules linked in: loop snd_seq_dummy snd_hrtimer nf_tables nfnetlink vfat =
fat snd_sof_pci snd_sof_intel_byt snd_sof_intel_ipc snd_sof_intel_hda_commo=
n snd_soc_hdac_hda snd_sof_xtensa_dsp snd_sof_intel_hda snd_sof snd_soc_skl
snd_soc_sst_
ipc snd_soc_sst_dsp snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi =
snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine elan_i2c snd_hda_codec=
_hdmi mei_hdcp iTCO_wdt intel_powerclamp intel_pmc_bxt ee1004 intel_rapl_msr
iTCO_vendor
_support joydev pcspkr intel_wmi_thunderbolt wmi_bmof thunderbolt ucsi_acpi=
 idma64 typec_ucsi snd_hda_codec_realtek typec snd_hda_codec_generic snd_hd=
a_intel snd_intel_dspcfg snd_hda_codec thinkpad_acpi snd_hda_core ledtrig_a=
udio
int3403_
thermal snd_hwdep snd_seq snd_seq_device snd_pcm iwlwifi snd_timer processo=
r_thermal_device mei_me cfg80211 intel_rapl_common snd e1000e mei int3400_t=
hermal int340x_thermal_zone i2c_i801 acpi_thermal_rel soundcore intel_soc_d=
ts_iosf
i2c_s
mbus rfkill intel_pch_thermal xenfs
 ip_tables dm_thin_pool dm_persistent_data dm_bio_prison dm_crypt nouveau r=
tsx_pci_sdmmc mmc_core mxm_wmi crct10dif_pclmul ttm crc32_pclmul crc32c_int=
el i915 ghash_clmulni_intel i2c_algo_bit serio_raw nvme drm_kms_helper cec =
xhci_pci
nvme
_core rtsx_pci xhci_pci_renesas drm xhci_hcd wmi video pinctrl_cannonlake p=
inctrl_intel xen_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xe=
n_evtchn uinput
---[ end trace f8d47e4aa6724df4 ]---
RIP: e030:nvme_map_data+0x300/0x3a0 [nvme]
Code: b8 fe ff ff e9 a8 fe ff ff 4c 8b 56 68 8b 5e 70 8b 76 74 49 8b 02 48 =
c1 e8 33 83 e0 07 83 f8 04 0f 85 f2 fe ff ff 49 8b 42 08 <83> b8 d0 00 00 0=
0 04 0f 85 e1 fe ff ff e9 38 fd ff ff 8b 55 70 be
RSP: e02b:ffffc900010e7ad8 EFLAGS: 00010246
RAX: dead000000000100 RBX: 0000000000001000 RCX: ffff8881a58f5000
RDX: 0000000000001000 RSI: 0000000000000000 RDI: ffff8881a679e000
RBP: ffff8881a5ef4c80 R08: ffff8881a5ef4c80 R09: 0000000000000002
R10: ffffea0003dfff40 R11: 0000000000000008 R12: ffff8881a679e000
R13: ffffc900010e7b20 R14: ffff8881a70b5980 R15: ffff8881a679e000
FS:  0000000000000000(0000) GS:ffff8881b5440000(0000) knlGS:0000000000000000
CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000001d64408 CR3: 00000001aa2c0000 CR4: 0000000000050660
Kernel panic - not syncing: Fatal exception
Kernel Offset: disabled


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--lKkRBIzN5W0l28vM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl/KGMAACgkQ24/THMrX
1yyq/wf+Oj7E49JnpUC4yd/NdOWLI89rsYqR6UvBjYlR8QUh+FtVBoPdtfKKGm+A
Btb4LYgmHqT2oO9y86ZugGpP+MQbjIBva5MpR3TrbVsK4GZGaPKBQjkssRMnXBug
rvdNZEGUaylOJry8DzGiYo3/5kGzXhM7HNhNuvdkbGvwKdsQLbM6NBr3kOMbzktH
mquqn3uiLD1Inn6+8UtO2NPo0U5RSS1/h/ac/3v0/1ZXQh5ryW65e+y+WJuaKgdT
Nt5Scuz1FziTMxCeGp3E+sW1PHkS405VFL/XBntzD2A21HiJFtyMwlJZRbzD/Sw6
tQfHwvC25Bi6hxCe8p0N6gyUUxkRbQ==
=tfVN
-----END PGP SIGNATURE-----

--lKkRBIzN5W0l28vM--

