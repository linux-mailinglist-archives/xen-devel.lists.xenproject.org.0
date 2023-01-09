Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C36AD6634D4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 00:09:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474081.735010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF1Fu-0008NT-MJ; Mon, 09 Jan 2023 23:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474081.735010; Mon, 09 Jan 2023 23:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF1Fu-0008I1-HK; Mon, 09 Jan 2023 23:08:38 +0000
Received: by outflank-mailman (input) for mailman id 474081;
 Mon, 09 Jan 2023 23:08:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=szyx=5G=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pF1Ft-0008EZ-2c
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 23:08:37 +0000
Received: from sonic314-20.consmr.mail.gq1.yahoo.com
 (sonic314-20.consmr.mail.gq1.yahoo.com [98.137.69.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88dcb11c-9072-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 00:08:34 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Mon, 9 Jan 2023 23:08:30 +0000
Received: by hermes--production-ne1-7b69748c4d-bgkrh (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 21a3ec8339abfccbadeaea4f5ef812e7; 
 Mon, 09 Jan 2023 23:08:28 +0000 (UTC)
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
X-Inumbo-ID: 88dcb11c-9072-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673305710; bh=H7TDF5iwsM6S2zN42hlPdvBls2tMhLzS10FXdEhr034=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=WyvKkHyI9WmtiUVWL7RhhUB2bUuuMOWtxhbuujprdUVNbGvFlmrbWeQzZtBVFRXQgzXd6YnHv2TQS2sBLkRMwIgDa5aqK9SvPrToX4Y/17QGKsWYCSxkt0OayOddFM1WABQUulp7lITjKI4gkwjR7nOSBzwba+7aDqNLtAdjgSs5z/A8iZ49bCblGt1VtS4X2uZQlAkW32/oIhW9JTQcaNpYKJLxJkKkeKg56uwCLNkgUd8poCFD8cuQgr6nvgkzMRMW8Q8mKelbtkN9JSaD/XnBt5U0pLPQFK+W5d0dPDriK7c6AYbSs42yCWMAlqzdioTBUl3yZhdHpjO1g+6MQw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673305710; bh=PrWJ3S59N3HCaCyYCnpa2+rJpwHbO8m3Bitt+4YB6Pl=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=fqOl1PKOUnvafKXce0G+T+Z4srjLJB9XxRyHnUQ8MGKq2fMTtlJXVK0YJ1vdp1lizY5OKQYfenBVE4QrbjmJRKdxe+GB/DEloJKCfLtlNCJCfS8wYZRZVffSNqWQFz2M+cvlzVMAhbdnGVarD8ejTY1oRd829SubqXoo9z3mfbD2WkHgUwoU+otrn3GcgFYXgsQp0Biw2jld9+O1ok//129gr4jAB0IYMRW0JPzupP1qTCV23XrnBNk6pOb1ybmV9I0jMgOhnnFPoUmcb5fsf4DlFeZzcfV3eGnFPsormfBeH2R9KoTMOvO8hbz4FDS0AP+kmqFRVLSbt7EyAR386A==
X-YMail-OSG: mLmWokQVM1nd4ulBj7SEMVyO0AKJcP1LGJB6Lv13bPdjONFUJyA758Q9z_tDvsH
 EaDw22J.X0QvmLKE_mEjNj7qxrjMsyecS4dHtX887JN2s.F67n2v6gtN5hfAonv9_Hh_FFvgp8oQ
 jS3_wxawPyqqes6WtJD_LEyj5cp062RlelUHhwDNAOfvO0wJvAK5gddv1jPCBOp2k3qsnFAwXDJy
 bIdrF5ZVGqj0EY7zMNO1L217sOJG7C0ce93pPqq8ZN8wmWddaobqSE5to5qU1VPwgmx_whKvc0W0
 3OuPoBxEJlmoFWcxmxldRkuZ3iMRN_m_ulxeifYEFWvwRhKYpCW3iKqiN4WUXQiJnD7YSA9lM.w8
 wU117bcrPFaefV2usS6GwtsS00yMXb5wXHt36QdZEcEOOIsdyA6w37V4Y6OnhCJTTTn2UP.KCWT9
 xUBmMfOQhpY66zDS7ueObfX4zUKYVfiPIiCsb8a1KME0yM9DUn9gN94hLBLudRF7Ff.XJvHqz0Dk
 0AIafvTAmrnWG6TGE_YRk_NXBET5Z.1QfHGUMFrb44Ja46mnvG9AGkxF7aR1kI6tqAacEmSv11xi
 hHYNH.lNLG8zOTHJp3bK5qhcjL2ddwF5TCWJG5.oGI__XD8fY8NH3r5s0nwaVBwzQyO5LG9JJ1vr
 vNEHIEdpfA7bGrJQmpBBCR0PZc5EPJk8FLtK97R98mloQkpHLj2voIX3X.mzIuq1_SbTELlFWq5_
 yOlnlGPtsQ.NZFnp7GgM1eT0Ctzu9_o6gnZXThutfUlIjFSWGyqrUTblPwnkkj_RgKZJFNJlfS5x
 ooB6jC_rl_jqPAoyQfGwXGe8vVXoqfcDi0KY59SPa3fMKM47UcYKFcP2kyYAwfEk7wO6iAVXESht
 66ZEJ3QwpIpDyb50sKrmeoHq8HRG1mVy0M4Ehrrj_TsSCmr_Dh2TJofZa5BOIWTUr76XoyTxX2E_
 o55GdOJzZelXPoA3LwyyPqTCfgMFK_h4PBsP26t5pdqgMTeDZJMqL55_ZAplg1RRXbN5hMK1lE1O
 oJx1XuMIo6rXqfacFyuL2QRNC1LS.f2tdptbb5MJZAztcv3HAuL6MWktNQE2nw_mOzy0vxBb7x.G
 29JDig4Ewv.chBkitUygFDVDaq9_HlTH9AST8pfIcJvU.covWzj1kj_41bmOKYWodw9mCz3s9h_O
 8ki1eEWd7jWlikN2HXovImwVRDKHArsGADRRUp_aN5Zf2wTCvlxFNXkv5clU2Cl1TOhepa7M9ahp
 s2TUzlijxNCugcBwdjA1Wtm3Rk4MK0aO_AkAEZNRVYQbYcckAv3hcAFCpW3caKDhaj0jtesM38sv
 Frf9JiWkGaJ8T6OhzIoyOzRZh07qV_7g9V9GDiNk1cQCXsUwg7Tpl0dHoTonAkx13KeeEqRHg9Dm
 YyhOQY2OdWZqrHBWY3eGvfOcSSeyX8sryJu3SYP57D7xeBfXaXBdFAL3_Wh7nT1sVnTFoYr3.Jhx
 zWOpuLZaJMoFWglaYK9hj37HxgmUz0.3p3ZYNrVSp.uNHaVFj2EwnYFiOqL0PEOYhWmInLx79iV0
 lej49k1a.ZuL3JW.OXeX34kc1bR8JSXDRdetiN2Z4wW3UuMtcfWsHWtCEkNk2S3C2e1hQZeiZU.O
 w1qQSI8tNFVpm53pRrDaGkcdvvm0FZQzx_VldD43HZ9wryrfhZf7hQwnK0DV.F4bNJqdXClUgKt5
 tZfM5wr0LWLxnBiEi2Mw.72n1ts2Osm2nCpApGhndNcsOqX70TITAjq_HATkcUYhboyPyBicquz9
 Mg1xNs3r0yTPmLUGqXfewaGWWnk_zP5GGqkl4tUzlMBhpk6YAD8wJRcR0P6RvFaq3vPDCFs9wxWh
 6.Ua7Y375zpt39PjJM7Qgf3Wot0DOzjzJtjRjYEQQiIqLtY9GXvBxk_YEYf2kU2C68L46TyipzRb
 jFmFcx2ftRjxPbwvYGRDtlfI1IQ4nmPzBpddLhnwreQv4Hl3_mehcKQ8NOrDz159BFn8y7dItGt0
 EuHt4B5jtFCcih2nxvqMPgrewfuenVk309ZkY3wJ1RTEUzCU7Evb6vi3Lrpx.24Fti30A1bHZkZd
 MTNfK6XGF22HHvR9aUDEbs0L1pLES8jSkMrULYY4310P0OmJdkSzmvGqqXt3b6cadjxv2Frq7Kso
 99hfHXfW9npPnBprkYHbO5HAC5tMc5LtX9SfMUpfFDbU6GKp6pDCeIJxVJyzbpaZbyD0JhRwZwhE
 X_w--
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	qemu-devel@nongnu.org
Subject: [XEN PATCH 0/3] Configure qemu upstream correctly by default for igd-passthru
Date: Mon,  9 Jan 2023 18:08:10 -0500
Message-Id: <cover.1673300848.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1673300848.git.brchuckz.ref@aol.com>

Sorry for the length of this cover letter but it is helpful to put all
the pros and cons of the two different approaches to solving the problem
of configuring the Intel IGD with qemu upstream and libxl in one place,
which I attempt to do here. Of course the other approach involves a
patch to qemu [1] instead of using this patch series for libxl.

The quick answer:

I think the other patch to qemu is the better option, but I would be OK
if you use this patch series instead.

Details with my reasons for preferring the other patch to qemu over this
patch series to libxl: 

I call attention to the commit message of the first patch which points
out that using the "pc" machine and adding the xen platform device on
the qemu upstream command line is not functionally equivalent to using
the "xenfv" machine which automatically adds the xen platform device
earlier in the guest creation process. As a result, there is a noticeable
reduction in the performance of the guest during startup with the "pc"
machne type even if the xen platform device is added via the qemu
command line options, although eventually both Linux and Windows guests
perform equally well once the guest operating system is fully loaded.

Specifically, startup time is longer and neither the grub vga drivers
nor the windows vga drivers in early startup perform as well when the
xen platform device is added via the qemu command line instead of being
added immediately after the other emulated i440fx pci devices when the
"xenfv" machine type is used.

For example, when using the "pc" machine, which adds the xen platform
device using a command line option, the Linux guest could not display
the grub boot menu at the native resolution of the monitor, but with the
"xenfv" machine, the grub menu is displayed at the full 1920x1080
native resolution of the monitor for testing. So improved startup
performance is an advantage for the patch for qemu.

I also call attention to the last point of the commit message of the
second patch and the comments for reviewers section of the second patch.
This approach, as opposed to fixing this in qemu upstream, makes
maintaining the code in libxl__build_device_model_args_new more
difficult and therefore increases the chances of problems caused by
coding errors and typos for users of libxl. So that is another advantage
of the patch for qemu.

OTOH, fixing this in qemu causes newer qemu versions to behave
differently than previous versions of qemu, which the qemu community
does not like, although they seem OK with the other patch since it only
affects qemu "xenfv" machine types, but they do not want the patch to
affect toolstacks like libvirt that do not use qemu upstream's
autoconfiguration options as much as libxl does, and, of course, libvirt
can manage qemu "xenfv" machines so exising "xenfv" guests configured
manually by libvirt could be adversely affected by the patch to qemu,
but only if those same guests are also configured for igd-passthrough,
which is likely a very small number of possibly affected libvirt users
of qemu.

A year or two ago I tried to configure guests for pci passthrough on xen
using libvirt's tool to convert a libxl xl.cfg file to libvirt xml. It
could not convert an xl.cfg file with a configuration item
pci = [ "PCI_SPEC_STRING", "PCI_SPEC_STRING", ...] for pci passthrough.
So it is unlikely there are any users out there using libvirt to
configure xen hvm guests for igd passthrough on xen, and those are the
only users that could be adversely affected by the simpler patch to qemu
to fix this.

The only advantage of this patch series over the qemu patch is that
this patch series does not need any patches to qemu to make Intel IGD
configuration easier with libxl so the risk of affecting other qemu
users is entirely eliminated if we use this patch instead of patching
qemu. The cost of patching libxl instead of qemu is reduced startup
performance compared to what could be achieved by patching qemu instead
and an increased risk that the tedious process of manually managing the
slot addresses of all the emulated devices will make it more difficult
to keep the libxl code free of bugs.

I will leave it to the maintainer of the code in both qemu and libxl
(Anthony) to decide which, if any, of the patches to apply. I am OK with
either this patch series to libxl or the proposed patch to qemu to fix
this problem, but I do recommend the other patch to qemu over this patch
series because of the improved performance during startup with that
patch and the relatively low risk that any libvirt users will be
adversely affected by that patch.

Brief statement of the problem this patch series solves:

Currently only the qemu traditional device model reserves slot 2 for the
Intel Integrated Graphics Device (IGD) with default settings. Assigning
the Intel IGD to slot 2 is necessary for the device to operate properly
when passed through as the primary graphics adapter. The qemu
traditional device model takes care of this by reserving slot 2 for the
Intel IGD, but the upstream qemu device model currently does not reserve
slot 2 for the Intel IGD.

This patch series modifies libxl so the upstream qemu device model will
also, with default settings, assign slot 2 for the Intel IGD.

There are three reasons why it is difficult to configure the guest
so the Intel IGD is assigned to slot 2 in the guest using libxl and the
upstream device model, so the patch series is logically organized in
three separate patches; each patch resolves one of the three reasons
that cause problems:

The description of what each of the three libxl patches do:

1. With the default "xenfv" machine type, qemu upstream is hard-coded
   to assign the xen platform device to slot 2. The first patch fixes
   that by using the "pc" machine instead when gfx_passthru type is igd
   and, if xen_platform_pci is set in the guest config, libxl now assigns
   the xen platform device to slot 3, making it possible to assign the
   IGD to slot 2. The patch only affects guests with the gfx_passthru
   option enabled. The default behavior (xen_platform_pci is enabled
   but gfx_passthru option is disabled) of using the "xenfv" machine
   type is preserved. Another way to describe what the patch does is
   to say that it adds a second exception to the default choice of the
   "xenfv" machine type, with the first exception being that the "pc"
   machine type is also used instead of "xenfv" if the xen platform pci
   device is disabled in the guest xl.cfg file.

2. Currently, with libxl and qemu upstream, most emulated pci devices
   are by default automatically assigned a pci slot, and the emulated
   ones are assigned before the passed through ones, which means that
   even if libxl is patched so the xen platform device will not be
   assigned to slot 2, any other emulated device will be assigned slot 2
   unless libxl explicitly assigns the slot address of each emulated pci
   device in such a way that the IGD will be assigned slot 2. The second
   patch fixes this by hard coding the slot assignment for the emulated
   devices instead of deferring to qemu upstream's auto-assignment which
   does not do what is necessary to configure the Intel IGD correctly.
   With the second patch applied, it is possible to configure the Intel
   IGD correctly by using the @VSLOT parameter in xl.cfg to specify the
   slot address of each passed through pci device in the guest. The
   second patch is also designed to not change the default behavior of
   letting qemu autoconfigure the pci slot addresses when igd
   gfx_pasthru is disabled in xl.cfg.  

3. For convenience, the third patch automatically assigns slot 2 to the
   Intel IGD when the gfx_passthru type is igd so with the third patch
   appled it is not necessary to set the @VSLOT parameter to configure
   the Intel IGD correctly.

Testing:

I tested a system with Intel IGD passthrough and two other pci devices
passed through, with and without the xen platform device. I also did
tests on guests without any pci passthrough configured. In all cases
tested, libxl behaved as expected. For example, the device model
arguments are only changed if gfx_passthru is set for the IGD, libxl
respected administrator settings such as @VSLOT and xen_platform_pci
with the patch series applied, and not adding the xen platform device to
the guest caused reduced performance because in that case the guest
could not take advantage of the improvements offered by the Xen PV
drivers in the guest. I tested the following emulated devices on my
setup: xen-platform, e1000, and VGA. I also verified the device that is
added by the "hdtype = 'ahci'" xl.cfg option is configured correctly
with the patch applied. I did not test all 12 devices that could be
affected by patch 2 of the series. These include the intel-hda high
definition audio device, a virtio-serial, device, etc. Once can look
at the second patch for the full list of qemu emulated devices whose
behavior is affected by the second patch of the series when the guest
is configured for igd gfx_passthru. These devices are also subject
to mistakes in the patch not discovered by the compiler, as mentioned
in the comments for reviewers section of the second patch. 

[1] https://lore.kernel.org/qemu-devel/8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz@aol.com/

Chuck Zmudzinski (3):
  libxl/dm: Use "pc" machine type for Intel IGD passthrough
  libxl/dm: Manage pci slot assignment for Intel IGD passthrough
  libxl/dm: Assign slot 2 by default for Intel IGD passthrough

 tools/libs/light/libxl_dm.c | 227 +++++++++++++++++++++++++++++-------
 1 file changed, 183 insertions(+), 44 deletions(-)

-- 
2.39.0


