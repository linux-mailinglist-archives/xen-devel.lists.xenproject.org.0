Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA297DD955
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 00:46:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626040.975947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxyQQ-0001ru-Q0; Tue, 31 Oct 2023 23:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626040.975947; Tue, 31 Oct 2023 23:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxyQQ-0001oe-ME; Tue, 31 Oct 2023 23:45:34 +0000
Received: by outflank-mailman (input) for mailman id 626040;
 Tue, 31 Oct 2023 23:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YC+N=GN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qxyQO-0001oY-Hm
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 23:45:32 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91aeb79b-7847-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 00:45:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 57544CE0B54;
 Tue, 31 Oct 2023 23:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB17FC433C8;
 Tue, 31 Oct 2023 23:45:24 +0000 (UTC)
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
X-Inumbo-ID: 91aeb79b-7847-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698795925;
	bh=kqcos7j4JEeU3V0Tg7bZ4SAjEc3N05yDC/sQYDPXH8Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BWh3pufIOOHwi8/0bBu8pFLaNcDIZuz0/hvH3Bz+qtexNLjRJmkr6YQmjThMV8c7e
	 LbKIk3ZhP+Z0QlQahAhm0a7fwCOwxaqEdb6A2LZoYAB6jPOxSyyIOiv5La7DHZ+mov
	 ESxsbLc6MtB1wr5svguMNrvbEreBBbR249hdRF9K4Srppz19/3EI4mlfPrF11awJ7A
	 7acGQXLNcdMAB4aeN5t/P1Y0ekX1AkxAl5aMe5lg49MH5gdrbDj7Hf6NlFMBkKJ0xD
	 u+St03xGhA22qubV2ZH1cYG3UmhBXWwP1dl7z8agZSG+TS8JoVJMHjjJaiMR34dQ8y
	 V84jylqm64mdA==
Date: Tue, 31 Oct 2023 16:45:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mario Marietto <marietto2008@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, brchuckz@netscape.net
Subject: Re: exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma]
 *ERROR* Device 14450000.mixer lacks support for IOMMU
In-Reply-To: <CA+1FSih0hORYZf6Hfmf=nY4jkHPvFSgGfc1tJfzN6smnKxcsxA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2310311625260.1795129@ubuntu-linux-20-04-desktop>
References: <CA+1FSiip1U0_EskJNgV3pSZPTCNOiTbpHosRLsy-6t1QQGd8Dw@mail.gmail.com> <alpine.DEB.2.22.394.2310311557520.1795129@ubuntu-linux-20-04-desktop> <CA+1FSih0hORYZf6Hfmf=nY4jkHPvFSgGfc1tJfzN6smnKxcsxA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1696713199-1698794776=:1795129"
Content-ID: <alpine.DEB.2.22.394.2310311626490.1795129@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1696713199-1698794776=:1795129
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2310311626491.1795129@ubuntu-linux-20-04-desktop>

Unfortunately there is no easy solution.

Do you know the version of the SMMU available on the platform? If it is
a SMMUv3 you can try to use the nested SMMU patch series to enable a
virtual SMMU in Dom0: https://marc.info/?l=xen-devel&m=166991020831005
That way, Xen can use the SMMU to protect VMs, and Dom0 can also use the
SMMU for its own purposes at the same time.

Alternatively, you can dig into the details of the exynos-drm driver to
see what exactly is the dependency on the IOMMU framework in Linux and
remove the dependency. Unfortunately none of us in this thread are
expert on exynos-drm so it would be difficult to advise on how to do
that. For example, I don't know how you could debug the x11 problem you
described because I don't typically work with x11 or with the exynos. If
there is an open source mailing list for exynos-drm development they
might be able to advise on how to remove the IOMMU dependency there.

The final option, which is a gross hack, would be to let Dom0 use the
IOMMU for its own gain. Xen doesn't use the IOMMU. If you do that you
lose freedom from interference between the VMs and you cannot run driver
domains or directly assign devices to DomUs. But if you are running a
research project you might be OK with that. To get it to work, you need
to hack Xen so that it remaps the IOMMU to Dom0 to let Dom0 program it
directly. The attached patch (untested) would be a place to start. You
also need to pass iommu=false to the Xen command line to prevent Xen
from using the iommu itself.

Cheers,

Stefano


On Wed, 1 Nov 2023, Mario Marietto wrote:
> I'm aware of the presence of that post. I'm working on the same
> project with the guy who explained the problem. Unfortunately,the
> solution proposed does not work well. Xen is working,but the screen is
> still black.
> 
> On Wed, Nov 1, 2023 at 12:04 AM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> >
> > Hi Mario,
> >
> > I am adding xen-devel and a couple of other Xen maintainers that might
> > know how to help make progress on this issues.
> >
> > Replies inline below.
> >
> >
> > On Tue, 31 Oct 2023, Mario Marietto wrote:
> > > Hello,
> > >
> > > We are a team of linux enthusiasts who are trying to boot Xen on a
> > > Samsung XE303C12 Chromebook aka "snow"
> > > following the suggestions in the slide show presentation here:
> > >
> > > https://www.slideshare.net/xen_com_mgr/xpds16-porting-xen-on-arm-to-a-new-soc-julien-grall-arm
> > >
> > > This device uses an exynos5250 SOC dual core 1.7 GHz with 2 MB RAM, it is
> > > a Samsung armv7 chip with virtualization extensions.
> > >
> > > In particular, we have it working fairly well both on the bare metal with
> > > a recent 6.1.59 Linux LTS kernel and also with a recent 5.4.257 LTS
> > > kernel with KVM, the older LTS kernel version is used to test KVM because
> > > support for KVM on arm v7 was removed from Linux around kernel version
> > > 5.7. So we know we have the hypervisor mode enabled because we were able
> > > to use it with KVM.
> > >
> > > For Xen, we are using the latest Debian build of Xen 4.17 for the Debian
> > > armhf architecture:
> > >
> > > (XEN) Xen version 4.17.2-pre (Debian 4.17.1+2-gb773c48e36-1)
> > > (pkg-xen-devel@xxxxxxxxxxxxxxx
> > > xxxxxxxx) (arm-linux-gnueabihf-gcc (Debian
> > > 12.2.0-14) 12.2.0) debug=n Thu May 18 19:26:30 UTC 2023
> > >
> > > The Linux kernel is a custom build that adds the Xen config kernel
> > > options (CONFIG_XEN_DOM0, etc) on top of a kernel that works well on the
> > > same Chromebook model on the bare metal. I can provide the config options
> > > of the kernel that was used if that is helpful.
> > >
> > > Our method of booting is to have u-boot boot the Xen hypervisor and load
> > > the device tree after adding the dom0 to the otherwise unaltered device
> > > tree from the Linux kernel using u-boot fdt commands to add a /chosen
> > > node, as described on the Xen wiki and in the pages linked from there. We
> > > have also tried adding and loading an initrd.img using the device tree
> > > /chosen node but that made no difference in our tests.
> > >
> > > We actually have the Linux LTS kernel version 6.1.59 working as dom0 with
> > > Xen using the same version of u-boot that we used for KVM, but with a big
> > > problem.
> > >
> > > The problem we see is that when booting the 6.1.59 kernel version as dom0
> > > with Xen, the screen is totally dark and the only way to access the
> > > system is remotely through ssh. Logs indicate most everything else is
> > > working, such as the wifi card so we can access it remotely via ssh and a
> > > USB optical mouse lights up when connected so USB is also working.
> > > Obviously, the disk is also working. The Chromebook is configured to boot
> > > from the device's SD card slot by turning on Chrome OS developer mode
> > > options to enable booting from the SD card slot.
> > >
> > > The mystery is that when booting the exact same 6.1.59 kernel on the bare
> > > metal instead of booting it as dom0 on Xen, it boots up with full access
> > > to the screen and we can interact with the system using the X.org windows
> > > system. But booting as dom0 with Xen, the screen is totally dark and the
> > > only access we have to the system is through the network via ssh. Also,
> > > when booting the 5.4.257 kernel with KVM in hypervisor mode, the screen
> > > works and we can interact with the system through the X.org windows
> > > system.
> > >
> > > Exploring the log file,we have seen the errors below :
> > >
> > >
> > > With Xen (or in bare metal):
> > >
> > > devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for
> > > DMA mapping operations
> > > devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops
> > > 0xc0d96354)
> > > devuan-bunsen kernel: exynos-drm exynos-drm: bound 14450000.mixer (ops
> > > 0xc0d97554)
> > > devuan-bunsen kernel: exynos-drm exynos-drm: bound
> > > 145b0000.dp-controller (ops 0xc0d97278)
> > > devuan-bunsen kernel: exynos-drm exynos-drm: bound 14530000.hdmi (ops
> > > 0xc0d97bd0)
> > > ...
> > > devuan-bunsen kernel: Console: switching to colour frame buffer device 170x48
> > > devuan-bunsen kernel: exynos-drm exynos-drm: [drm] fb0: exynosdrmfb
> > > frame buffer device
> > > devuan-bunsen kernel: [drm] Initialized exynos 1.1.0 20180330 for
> > > exynos-drm on minor 0
> > >
> > > In this case,the kernel is able to use the exynos-drm kernel to start
> > > the fb0 device. But with Xen we get this error with exynos-drm:
> > >
> > > devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for
> > > DMA mapping operations
> > > devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops
> > > 0xc0d96354)
> > > devuan-bunsen kernel: exynos-mixer 14450000.mixer:
> > > [drm:exynos_drm_register_dma] *ERROR* Device 14450000.mixer lacks
> > > support for IOMMU
> > > devuan-bunsen kernel: exynos-drm exynos-drm: failed to bind
> > > 14450000.mixer (ops 0xc0d97554): -22
> > > devuan-bunsen kernel: exynos-drm exynos-drm: adev bind failed: -22
> > > devuan-bunsen kernel: exynos-dp: probe of 145b0000.dp-controller
> > > failed with error -22
> > >
> > >
> > > Any ideas why booting the same Linux kernel that results in a working
> > > X.org display on the bare metal instead as dom0 on Xen would cause the
> > > display to remain dark, but most other basic functions would work, such
> > > as network, disk, and USB ? thanks.
> >
> > I think the issue is that Linux 6.1.59 is using the IOMMU to get the GPU
> > to work. When running on top of Xen, the IOMMU is not available to
> > Linux. That's because the IOMMU is used by Xen to enforce protection
> > between VMs.
> >
> > It might help to rebuild Linux without IOMMU support (remove the driver
> > from the kconfig) so that Linux cannot attempt to use the IOMMU.
> >
> > Also see
> > https://marc.info/?l=xen-users&m=169844593525492
--8323329-1696713199-1698794776=:1795129
Content-Type: text/x-diff; name=dom0-iommu.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2310311645230.1795129@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: attachment; filename=dom0-iommu.patch

ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KaW5kZXggNDk3OTJkZDU5MC4u
NzRmYzU1NDM2NCAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYw0KKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQpA
QCAtMTExOSwyNSArMTExOSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCB3cml0
ZV9wcm9wZXJ0aWVzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxf
aW5mbyAqa2luZm8sDQogICAgIGNvbnN0IHN0cnVjdCBkdF9wcm9wZXJ0eSAq
cHJvcCwgKnN0YXR1cyA9IE5VTEw7DQogICAgIGludCByZXMgPSAwOw0KICAg
ICBpbnQgaGFkX2RvbTBfYm9vdGFyZ3MgPSAwOw0KLSAgICBzdHJ1Y3QgZHRf
ZGV2aWNlX25vZGUgKmlvbW11X25vZGU7DQogDQogICAgIGlmICgga2luZm8t
PmNtZGxpbmUgJiYga2luZm8tPmNtZGxpbmVbMF0gKQ0KICAgICAgICAgYm9v
dGFyZ3MgPSAma2luZm8tPmNtZGxpbmVbMF07DQogDQotICAgIC8qDQotICAg
ICAqIFdlIGFsd2F5cyBza2lwIHRoZSBJT01NVSBkZXZpY2Ugd2hlbiBjcmVh
dGluZyBEVCBmb3IgaHdkb20gaWYgdGhlcmUgaXMNCi0gICAgICogYW4gYXBw
cm9wcmlhdGUgZHJpdmVyIGZvciBpdCBpbiBYZW4gKGRldmljZV9nZXRfY2xh
c3MoaW9tbXVfbm9kZSkNCi0gICAgICogcmV0dXJucyBERVZJQ0VfSU9NTVUp
Lg0KLSAgICAgKiBXZSBzaG91bGQgYWxzbyBza2lwIHRoZSBJT01NVSBzcGVj
aWZpYyBwcm9wZXJ0aWVzIG9mIHRoZSBtYXN0ZXIgZGV2aWNlDQotICAgICAq
IGJlaGluZCB0aGF0IElPTU1VIGluIG9yZGVyIHRvIGF2b2lkIGV4cG9zaW5n
IGFuIGhhbGYgY29tcGxldGUgSU9NTVUNCi0gICAgICogYmluZGluZ3MgdG8g
aHdkb20uDQotICAgICAqIFVzZSAiaW9tbXVfbm9kZSIgYXMgYW4gaW5kaWNh
dG9yIG9mIHRoZSBtYXN0ZXIgZGV2aWNlIHdoaWNoIHByb3BlcnRpZXMNCi0g
ICAgICogc2hvdWxkIGJlIHNraXBwZWQuDQotICAgICAqLw0KLSAgICBpb21t
dV9ub2RlID0gZHRfcGFyc2VfcGhhbmRsZShub2RlLCAiaW9tbXVzIiwgMCk7
DQotICAgIGlmICggaW9tbXVfbm9kZSAmJiBkZXZpY2VfZ2V0X2NsYXNzKGlv
bW11X25vZGUpICE9IERFVklDRV9JT01NVSApDQotICAgICAgICBpb21tdV9u
b2RlID0gTlVMTDsNCi0NCiAgICAgZHRfZm9yX2VhY2hfcHJvcGVydHlfbm9k
ZSAobm9kZSwgcHJvcCkNCiAgICAgew0KICAgICAgICAgY29uc3Qgdm9pZCAq
cHJvcF9kYXRhID0gcHJvcC0+dmFsdWU7DQpAQCAtMTE5NSwxOSArMTE4MCw2
IEBAIHN0YXRpYyBpbnQgX19pbml0IHdyaXRlX3Byb3BlcnRpZXMoc3RydWN0
IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywNCiAgICAg
ICAgICAgICBjb250aW51ZTsNCiAgICAgICAgIH0NCiANCi0gICAgICAgIGlm
ICggaW9tbXVfbm9kZSApDQotICAgICAgICB7DQotICAgICAgICAgICAgLyog
RG9uJ3QgZXhwb3NlIElPTU1VIHNwZWNpZmljIHByb3BlcnRpZXMgdG8gaHdk
b20gKi8NCi0gICAgICAgICAgICBpZiAoIGR0X3Byb3BlcnR5X25hbWVfaXNf
ZXF1YWwocHJvcCwgImlvbW11cyIpICkNCi0gICAgICAgICAgICAgICAgY29u
dGludWU7DQotDQotICAgICAgICAgICAgaWYgKCBkdF9wcm9wZXJ0eV9uYW1l
X2lzX2VxdWFsKHByb3AsICJpb21tdS1tYXAiKSApDQotICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOw0KLQ0KLSAgICAgICAgICAgIGlmICggZHRfcHJvcGVy
dHlfbmFtZV9pc19lcXVhbChwcm9wLCAiaW9tbXUtbWFwLW1hc2siKSApDQot
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KLSAgICAgICAgfQ0KLQ0KICAg
ICAgICAgcmVzID0gZmR0X3Byb3BlcnR5KGtpbmZvLT5mZHQsIHByb3AtPm5h
bWUsIHByb3BfZGF0YSwgcHJvcF9sZW4pOw0KIA0KICAgICAgICAgaWYgKCBy
ZXMgKQ0KQEAgLTIzNzIsMTYgKzIzNDQsNiBAQCBzdGF0aWMgaW50IF9faW5p
dCBoYW5kbGVfbm9kZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVs
X2luZm8gKmtpbmZvLA0KICAgICAgICAgcmV0dXJuIDA7DQogICAgIH0NCiAN
Ci0gICAgLyoNCi0gICAgICogRXZlbiBpZiB0aGUgSU9NTVUgZGV2aWNlIGlz
IG5vdCB1c2VkIGJ5IFhlbiwgaXQgc2hvdWxkIG5vdCBiZQ0KLSAgICAgKiBw
YXNzdGhyb3VnaCB0byBET00wDQotICAgICAqLw0KLSAgICBpZiAoIGRldmlj
ZV9nZXRfY2xhc3Mobm9kZSkgPT0gREVWSUNFX0lPTU1VICkNCi0gICAgew0K
LSAgICAgICAgZHRfZHByaW50aygiIElPTU1VLCBza2lwIGl0XG4iKTsNCi0g
ICAgICAgIHJldHVybiAwOw0KLSAgICB9DQotDQogICAgIC8qDQogICAgICAq
IFRoZSB2R0lDIGRvZXMgbm90IHN1cHBvcnQgcm91dGluZyBoYXJkd2FyZSBQ
UElzIHRvIGd1ZXN0LiBTbw0KICAgICAgKiB3ZSBuZWVkIHRvIHNraXAgYW55
IG5vZGUgdXNpbmcgUFBJcy4NCg==

--8323329-1696713199-1698794776=:1795129--

