Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E6A147488
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 00:15:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuldC-0000GD-Nw; Thu, 23 Jan 2020 23:11:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2QE7=3M=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iuldA-0000G8-PY
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 23:11:21 +0000
X-Inumbo-ID: a552cc2c-3e35-11ea-9fd7-bc764e2007e4
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a552cc2c-3e35-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 23:11:12 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 145B5650;
 Thu, 23 Jan 2020 18:11:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 23 Jan 2020 18:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=q1/3ve
 KfauzspCcwuso7PZoMKHgNuOL/IMy2RSP5OvQ=; b=dO421cyas6srNmGxH0h7uT
 9sVeqvPseau5BeTNniAjRWotbWmmgrbC51sg9IsCj3kgy95Sc0owp6Bs19TCW92t
 JINdhOaC4Dc3Rod9YHGTlSJOsYgEzj6bp1Dfq8wJj5Yq/DnPme1gK9Vij6A0KMfc
 1p3kvdtRoSV/729Zwy4RQ8bq2yXLi1Gu4L24+AOY+udlsH2fp658ldNUiDySgoEZ
 nTioE+E1moWzDNzpzMvXDsz1vXDdamiGt06VpWVyvUom+uDjYdVUa+BtSx+aTpbs
 LoECguYs1NKZCw6b/q5EEt4+niNyHM2g7tjd0ZSa13ARPcyU2j5Rt+9OMT+l/teA
 ==
X-ME-Sender: <xms:DigqXm5OL-vXK6Bcr-ldveLAkVIuwa2XsUuOdVqSC5sOuI8riG-Ggg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvdefucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtreertddtje
 enucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceo
 mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuff
 homhgrihhnpehquhgsvghsqdhoshdrohhrghenucfkphepledurdeihedrfeegrdeffeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmh
 grrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:DigqXkIuKPagYGbBCphSbBp4Bx89gb-vw42GmYcU1XGiDj624qthDA>
 <xmx:DigqXgfrLYuE6i2bahAS9o17oxWa5r9sizmzwjzzdEyMQChLvlPz2w>
 <xmx:DigqXndlKE9fSIZqwmEpWcJb2wGu4WyeymIbmCVqFaMYmEN2EfZXBw>
 <xmx:DigqXmRWEAZH1RL9v6DXWD_57e25XvZ-AufdSJ5vlJgpPVAFvRDrEw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F3BB3060ACE;
 Thu, 23 Jan 2020 18:11:09 -0500 (EST)
Date: Fri, 24 Jan 2020 00:11:07 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: tosher 1 <akm2tosher@yahoo.com>
Message-ID: <20200123231107.GI1314@mail-itl>
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
 <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
 <20200122190133.GS2507@mail-itl>
 <409698033.2707956.1579722613556@mail.yahoo.com>
 <20200122195831.GB1314@mail-itl>
 <972998214.522226.1579818994322@mail.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <972998214.522226.1579818994322@mail.yahoo.com>
Subject: Re: [Xen-devel] HVM Driver Domain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============1215962742051878862=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1215962742051878862==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8PmjN3crGoJ4VbbS"
Content-Disposition: inline


--8PmjN3crGoJ4VbbS
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="JCIJwDXlZmsNNBnR"
Content-Disposition: inline
Subject: Re: [Xen-devel] HVM Driver Domain


--JCIJwDXlZmsNNBnR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 10:36:34PM +0000, tosher 1 wrote:
>=20
>=20
> I wasn't able to make the HVM driver domain work even with the latest Xen=
 version which is 4.14. I see the 'xendriverdomain' executable in the /etc/=
init.d/ directory, but it doesn't seem to be running in the background.=20
>=20
> On the other hand, I see the official "Qubes OS Architecture" document (h=
ttps://www.qubes-os.org/attachment/wiki/QubesArchitecture/arch-spec-0.3.pdf=
) defines the driver domain as the following.
>=20
> "A driver domain is an unprivileged PV-domain that has been securely gran=
ted access to certain PCI device (e.g. the network card or disk controller)=
 using Intel VT-d." - Page 12
>=20
> Moreover, section 6.1 reads "The network domain is granted direct access =
to the networking hardware, e.g. the WiFi or ethernet card. Besides, it is =
a regular unprivileged PV domain."
>=20
> Maybe you guys later moved to the HVM driver domain from PV. Would you pl=
ease share the Xen config you use for the network driver domain?

Yes, that PDF is quite outdated, we use HVM now.

As for the configs, as said before, we use libvirt, with some extra
patches, so the config won't be directly useful for you. I'm attaching
both libvirt XML for the driver domain, and also converted to XL (using
virsh domxml-to-native), may be inaccurate.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--JCIJwDXlZmsNNBnR
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="sys-net.xl"

name = "sys-net"
uuid = "f8716f60-6be1-43b5-9bcb-b2c8c0910e5b"
maxmem = 400
memory = 400
vcpus = 2
pae = 1
acpi = 1
apic = 1
viridian = 1
rtc_timeoffset = 0
localtime = 1
on_poweroff = "destroy"
on_reboot = "destroy"
on_crash = "destroy"
sdl = 0
vnc = 1
vncunused = 0
vncdisplay = -5900
pci = [ "0000:00:1f.6", "0000:04:00.0" ]
parallel = "none"
serial = "none"
builder = "hvm"
cmdline = "root=/dev/mapper/dmroot ro nomodeset console=hvc0 rd_NO_PLYMOUTH rd.plymouth.enable=0 plymouth.enable=0 xen_scrub_pages=0 nopat iommu=soft swiotlb=8192"
boot = "dc"
nestedhvm = 0
disk = [ "format=raw,vdev=xvda,access=rw,backendtype=phy,target=/dev/qubes_dom0/vm-sys-net-root-snap", "format=raw,vdev=xvdb,access=rw,backendtype=phy,target=/dev/qubes_dom0/vm-sys-net-private-snap", "format=raw,vdev=xvdc,access=rw,backendtype=phy,target=/dev/qubes_dom0/vm-sys-net-volatile", "format=raw,vdev=xvdd,access=ro,backendtype=phy,target=/var/lib/qubes/vm-kernels/4.19.86-1/modules.img" ]
usb = 1
usbdevice = "tablet"


--JCIJwDXlZmsNNBnR
Content-Type: text/xml; charset=utf-8
Content-Disposition: attachment; filename="sys-net.xml"

<domain type='xen' id='1'>
  <name>sys-net</name>
  <uuid>f8716f60-6be1-43b5-9bcb-b2c8c0910e5b</uuid>
  <memory unit='KiB'>409600</memory>
  <currentMemory unit='KiB'>409600</currentMemory>
  <vcpu placement='static'>2</vcpu>
  <os>
    <type arch='x86_64' machine='xenfv'>hvm</type>
    <loader type='rom'>hvmloader</loader>
    <cmdline>root=/dev/mapper/dmroot ro nomodeset console=hvc0 rd_NO_PLYMOUTH rd.plymouth.enable=0 plymouth.enable=0 xen_scrub_pages=0 nopat iommu=soft swiotlb=8192</cmdline>
    <boot dev='cdrom'/>
    <boot dev='hd'/>
  </os>
  <features>
    <acpi/>
    <apic/>
    <pae/>
    <viridian/>
    <xen>
      <e820_host state='on'/>
    </xen>
  </features>
  <cpu mode='host-passthrough'>
    <feature policy='disable' name='vmx'/>
    <feature policy='disable' name='svm'/>
    <feature policy='disable' name='smap'/>
  </cpu>
  <clock offset='variable' adjustment='0' basis='localtime'/>
  <on_poweroff>destroy</on_poweroff>
  <on_reboot>destroy</on_reboot>
  <on_crash>destroy</on_crash>
  <devices>
    <emulator type='stubdom-linux'/>
    <disk type='block' device='disk'>
      <driver name='phy' type='raw'/>
      <source dev='/dev/qubes_dom0/vm-sys-net-root-snap'/>
      <backingStore/>
      <target dev='xvda' bus='xen'/>
    </disk>
    <disk type='block' device='disk'>
      <driver name='phy' type='raw'/>
      <source dev='/dev/qubes_dom0/vm-sys-net-private-snap'/>
      <backingStore/>
      <target dev='xvdb' bus='xen'/>
    </disk>
    <disk type='block' device='disk'>
      <driver name='phy' type='raw'/>
      <source dev='/dev/qubes_dom0/vm-sys-net-volatile'/>
      <backingStore/>
      <target dev='xvdc' bus='xen'/>
    </disk>
    <disk type='block' device='disk'>
      <driver name='phy' type='raw'/>
      <source dev='/var/lib/qubes/vm-kernels/4.19.86-1/modules.img'/>
      <backingStore/>
      <target dev='xvdd' bus='xen'/>
      <readonly/>
    </disk>
    <console type='pty' tty='/dev/pts/1'>
      <source path='/dev/pts/1'/>
      <target type='xen' port='0'/>
    </console>
    <input type='tablet' bus='usb'/>
    <input type='mouse' bus='ps2'/>
    <input type='keyboard' bus='ps2'/>
    <graphics type='qubes'/>
    <video>
      <model type='vga' vram='16384' heads='1' primary='yes'/>
    </video>
    <hostdev mode='subsystem' type='pci' managed='yes'>
      <driver name='xen'/>
      <source>
        <address domain='0x0000' bus='0x00' slot='0x1f' function='0x6'/>
      </source>
    </hostdev>
    <hostdev mode='subsystem' type='pci' managed='yes'>
      <driver name='xen'/>
      <source>
        <address domain='0x0000' bus='0x04' slot='0x00' function='0x0'/>
      </source>
    </hostdev>
  </devices>
</domain>


--JCIJwDXlZmsNNBnR--

--8PmjN3crGoJ4VbbS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4qKAsACgkQ24/THMrX
1yzrPAf/bcpuyS6Qff74tMg0qV60Wucmx8NPY/zBuxDNPsV63Xr8wJAKb4A6D01z
N2rlVz8Z3amkGdUiExFyLi+fLgsmxLIQlzLLSObKbc/BHyLotX9/D51cN5tYttzN
4j5cwUOUFQDp5rMkytLJSvyTPleHwcT0eANBgghAf+jj1gUeUELQKDoA/O4ue1CX
nYiGJ9yffcBHuaspgQLE7hqOGPfE1qhf+aUnU921ZaNeAaCS0QGJvGUiPfk+YXqa
y63r+JloTY6TQIMr0QjlmNfDvsV6NepcQUm3ClwMgJKpuwH/1oC8vvhUAYIMLV3O
xKKn7fZtWUTsRl4kLTC/VGwt0Dd+4Q==
=0ahZ
-----END PGP SIGNATURE-----

--8PmjN3crGoJ4VbbS--


--===============1215962742051878862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1215962742051878862==--

