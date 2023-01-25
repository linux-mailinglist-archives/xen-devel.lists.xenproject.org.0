Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0AF67B198
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 12:37:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484285.750840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKe5s-00007p-Gz; Wed, 25 Jan 2023 11:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484285.750840; Wed, 25 Jan 2023 11:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKe5s-0008WJ-Dh; Wed, 25 Jan 2023 11:37:32 +0000
Received: by outflank-mailman (input) for mailman id 484285;
 Wed, 25 Jan 2023 11:37:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Be9=5W=citrix.com=prvs=3821facd5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pKe5r-0008V8-37
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 11:37:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4fed201-9ca4-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 12:37:29 +0100 (CET)
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
X-Inumbo-ID: a4fed201-9ca4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674646649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RfCE76XoGdXJb6w1WTkggE9lANZ0qxu5K2hgVoiyY8I=;
  b=DfxOwbzVT2qA95jF3gL0Kq4Bna2n321vYKHLDpLdc7wu6k6DnGy7qSRB
   JrfDO2ovPc+kzU+nd0Kp1IgSa4bfG/NdomUMA3U7Cm3jADCadq7zjRmlX
   X6Uci5RTrvEBdGqzE1dS6nhObNiXisAaHh6QSwqRhIMPY+DD/ym2iNUYp
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93075483
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:yPRC8KPVAj519NjvrR1ql8FynXyQoLVcMsEvi/4bfWQNrUp0g2YBn
 WdOWmiEbPfYZWv8KIsgaYjj90lSvZ/czodiHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5AFmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0stKKGZv7
 M5HFGoqPkuFqtmZ4fGXUdA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3RHZoIwhbDz
 o7A11b1JgE+PsGc8CSi1kmxi76SvxjlYbtHQdVU8dY12QbOlwT/EiY+V1ShpuKiolWjQN8ZI
 EsRkgI3oK0vsUCmUNT5dxu/pnGCo1gbQdU4O+Qi5RuE0Kb8/weTDW9CRTlEAPQsrsQ2WDcpx
 HeAmNevDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nZslnOL64iJvyAz6Y/
 tyRhHFg3fNJ15dNjvjluwmd2FpAu6QlUCYY2yzQf3uXsT8jQ97+YaGTxnmYwe15edPxoka6g
 FAInM2X7eYrBJ6LlTCQTOhlIIxF98ppIxWH3wcxQsBJGyCFvif6INsOuG0WyFJBaJ5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmO2vpnkGia24hTqFfK0QfUYXZ
 /+mnT6EVypyNEie5GPeqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiHJFOdYagDXNr5phE9hnOky2
 48PX/ZmNj0FCLGuCsUp2dB7wa82wYgTWsmt9p0/mh+rKQt6AmAxY8I9Mpt4E7GJa599z7+Sl
 lnkAx8w9bYKrSGfQel8Qiw5OeyHsFcWhS5TABHAyn75hyh6PNf0vM/ytfIfJNEayQCq9tYsJ
 9FtRilKKq4npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:QPddUK4JEDstzmnoCwPXwKvXdLJyesId70hD6qkRc3xom6mj/P
 xG88536faZslwssRIb+OxoRpPufZq0z/cc3WB7B9uftWfd1leVEA==
X-IronPort-AV: E=Sophos;i="5.97,245,1669093200"; 
   d="scan'208";a="93075483"
Date: Wed, 25 Jan 2023 11:37:14 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, <qemu-devel@nongnu.org>
Subject: Re: [XEN PATCH v2 0/3] Configure qemu upstream correctly by default
 for igd-passthru
Message-ID: <Y9EUarVVWr223API@perard.uk.xensource.com>
References: <cover.1673300848.git.brchuckz.ref@aol.com>
 <cover.1673300848.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1673300848.git.brchuckz@aol.com>

On Tue, Jan 10, 2023 at 02:32:01AM -0500, Chuck Zmudzinski wrote:
> I call attention to the commit message of the first patch which points
> out that using the "pc" machine and adding the xen platform device on
> the qemu upstream command line is not functionally equivalent to using
> the "xenfv" machine which automatically adds the xen platform device
> earlier in the guest creation process. As a result, there is a noticeable
> reduction in the performance of the guest during startup with the "pc"
> machne type even if the xen platform device is added via the qemu
> command line options, although eventually both Linux and Windows guests
> perform equally well once the guest operating system is fully loaded.

There shouldn't be a difference between "xenfv" machine or using the
"pc" machine while adding the "xen-platform" device, at least with
regards to access to disk or network.

The first patch of the series is using the "pc" machine without any
"xen-platform" device, so we can't compare startup performance based on
that.

> Specifically, startup time is longer and neither the grub vga drivers
> nor the windows vga drivers in early startup perform as well when the
> xen platform device is added via the qemu command line instead of being
> added immediately after the other emulated i440fx pci devices when the
> "xenfv" machine type is used.

The "xen-platform" device is mostly an hint to a guest that they can use
pv-disk and pv-network devices. I don't think it would change anything
with regards to graphics.

> For example, when using the "pc" machine, which adds the xen platform
> device using a command line option, the Linux guest could not display
> the grub boot menu at the native resolution of the monitor, but with the
> "xenfv" machine, the grub menu is displayed at the full 1920x1080
> native resolution of the monitor for testing. So improved startup
> performance is an advantage for the patch for qemu.

I've just found out that when doing IGD passthrough, both machine
"xenfv" and "pc" are much more different than I though ... :-(
pc_xen_hvm_init_pci() in QEMU changes the pci-host device, which in
turns copy some informations from the real host bridge.
I guess this new host bridge help when the firmware setup the graphic
for grub.

> I also call attention to the last point of the commit message of the
> second patch and the comments for reviewers section of the second patch.
> This approach, as opposed to fixing this in qemu upstream, makes
> maintaining the code in libxl__build_device_model_args_new more
> difficult and therefore increases the chances of problems caused by
> coding errors and typos for users of libxl. So that is another advantage
> of the patch for qemu.

We would just needs to use a different approach in libxl when generating
the command line. We could probably avoid duplications. I was hopping to
have patch series for libxl that would change the machine used to start
using "pc" instead of "xenfv" for all configurations, but based on the
point above (IGD specific change to "xenfv"), then I guess we can't
really do anything from libxl to fix IGD passthrough.

> OTOH, fixing this in qemu causes newer qemu versions to behave
> differently than previous versions of qemu, which the qemu community
> does not like, although they seem OK with the other patch since it only
> affects qemu "xenfv" machine types, but they do not want the patch to
> affect toolstacks like libvirt that do not use qemu upstream's
> autoconfiguration options as much as libxl does, and, of course, libvirt
> can manage qemu "xenfv" machines so exising "xenfv" guests configured
> manually by libvirt could be adversely affected by the patch to qemu,
> but only if those same guests are also configured for igd-passthrough,
> which is likely a very small number of possibly affected libvirt users
> of qemu.
> 
> A year or two ago I tried to configure guests for pci passthrough on xen
> using libvirt's tool to convert a libxl xl.cfg file to libvirt xml. It
> could not convert an xl.cfg file with a configuration item
> pci = [ "PCI_SPEC_STRING", "PCI_SPEC_STRING", ...] for pci passthrough.
> So it is unlikely there are any users out there using libvirt to
> configure xen hvm guests for igd passthrough on xen, and those are the
> only users that could be adversely affected by the simpler patch to qemu
> to fix this.

FYI, libvirt should be using libxl to create guest, I don't think there
is another way for libvirt to create xen guests.



So overall, unfortunately the "pc" machine in QEMU isn't suitable to do
IGD passthrough as the "xenfv" machine has already some workaround to
make IGD work and just need some more.

I've seen that the patch for QEMU is now reviewed, so I look at having
it merged soonish.

Thanks,

-- 
Anthony PERARD

