Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0FC21F2DA
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 15:43:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvLCw-0007sz-KT; Tue, 14 Jul 2020 13:42:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ad9T=AZ=in.bosch.com=manikandan.chockalingam@srs-us1.protection.inumbo.net>)
 id 1jvLCu-0007su-IE
 for xen-devel@lists.xen.org; Tue, 14 Jul 2020 13:42:53 +0000
X-Inumbo-ID: e7706d9c-c5d7-11ea-b7bb-bc764e2007e4
Received: from de-out1.bosch-org.com (unknown [139.15.230.186])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7706d9c-c5d7-11ea-b7bb-bc764e2007e4;
 Tue, 14 Jul 2020 13:42:48 +0000 (UTC)
Received: from si0vm1948.rbesz01.com
 (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
 by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 4B5hXk500Gz1XLFs0;
 Tue, 14 Jul 2020 15:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=key1-intmail; t=1594734166;
 bh=D8zwxoergcrtek4NXmGatgUgF/p/9IbmioM2WmJFroQ=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=SwcreMK9QwlVLBUgS120siOB+ZMsz2rWPIfKuSE0RTcDzya+7N8hJF7An1z6/X3bC
 AmmcENXQ7gjPANHAS+yI1gpPGIrDHWokdt/PnH8Xix9vgEdFSz0Z3qi1RDVGAcJtwu
 6MzJ4wLJ3fHeezafsEiauFRaSTIHhd7Q2whTZgjE=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
 by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 4B5hXk4Znlz1jG;
 Tue, 14 Jul 2020 15:42:46 +0200 (CEST)
X-AuditID: 0a3aad15-e97ff700000001dd-57-5f0db65648bc
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id 00.BC.00477.656BD0F5;
 Tue, 14 Jul 2020 15:42:46 +0200 (CEST)
Received: from FE-MBX2066.de.bosch.com (fe-mbx2066.de.bosch.com [10.3.231.171])
 by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 4B5hXk331Zz6CjZNx;
 Tue, 14 Jul 2020 15:42:46 +0200 (CEST)
Received: from SGPMBX2024.APAC.bosch.com (10.187.83.44) by
 FE-MBX2066.de.bosch.com (10.3.231.171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Tue, 14 Jul 2020 15:42:45 +0200
Received: from SGPMBX2022.APAC.bosch.com (10.187.83.37) by
 SGPMBX2024.APAC.bosch.com (10.187.83.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Tue, 14 Jul 2020 21:42:44 +0800
Received: from SGPMBX2022.APAC.bosch.com ([fe80::2d4d:b176:b210:896]) by
 SGPMBX2022.APAC.bosch.com ([fe80::2d4d:b176:b210:896%6]) with mapi id
 15.01.1979.003; Tue, 14 Jul 2020 21:42:44 +0800
From: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [BUG] Xen build for RCAR failing
Thread-Topic: [BUG] Xen build for RCAR failing
Thread-Index: AdZUKc5JeR7gPpESR52uLkZK1kYwOwAEsnEAAAD8OlAAAEBtgAABZtcgAANXdAAAh1iJgADaJ12w
Date: Tue, 14 Jul 2020 13:42:44 +0000
Message-ID: <67b4454424c4485fb59d542d052aaf2d@in.bosch.com>
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
 <1D0E7281-95D7-482E-BF6D-EE5B1FEE4876@arm.com>
 <ab84437081a346d6bf0f73581382c74e@in.bosch.com>
 <D84A5DA7-683C-480B-8837-C51D560FC2E1@arm.com>
 <139024a891324455a13a3d468908798d@in.bosch.com>
 <C3BCAA62-51EF-49DD-B978-6657BC6D5A21@arm.com> 
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.210]
Content-Type: multipart/mixed;
 boundary="_002_67b4454424c4485fb59d542d052aaf2dinboschcom_"
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsXCZbVWVjdsG2+8wfqvchZLl2xmsjizvIfZ
 YsnHxSwOzB5r5q1h9Di6+zdTAFMUl01Kak5mWWqRvl0CV8bdW42sBfeyKx7dOcHSwNid3MXI
 ySEhYCLRcmM2cxcjF4eQwAwmiRvvHrJAOPsZJXYsv80KUiUk8JFR4uvLMojEZ0aJL11nmSCc
 Q4wS07qOMINUsQmESOzbe4MdxBYR0Jf4ffMHWDezgIfEqqt7GEFsYQFdia5zs6Fq9CS2LuwH
 quEAsqMkfkzQBgmzCKhKNF1pAivnFbCWWP+uD+qizUwSTz/+YQJJMArISiy6OYkFYr64xK0n
 85kg/hGReHjxNBuELSrx8vE/VghbUeLR/VVMEPUxEncabrNALBCUODnzCcsERrFZSEbNQlI2
 C0kZRFxP4sbUKWwQtrbEsoWvmSFsJ4nj779Bxc0kDhxdCRTnArIPMEqs/N8OVaQoMaX7IfsC
 Rs5VjKJpqQZluYbmJoZ6RUmpxVUGhnrJ+bmbGCGRLLqD8U73B71DjEwcjIcYVYBaH21YfYFR
 iiUvPy9VSYSXh4s3Xog3JbGyKrUoP76oNCe1+BCjNAeLkjivCs/GOCGB9MSS1OzU1ILUIpgs
 EwenVAOThCivw0nRBsZbx+73epgbzY5InTLnzfS8WRuUZeNEj7QJ3bmge8jVr+FZu7blhbdH
 DMqk/pVkJp3PPntpY8sCPp1ycREL8QaOjQcvblRWuT43J6va0Ued3ZQhenJl6vWdTs7btmmU
 sqauuPuY99G+UL/UNBveu/G3rx6NWrP1/Z87K9OPTz9gcK562oHTdjttJPlty//FtTBG3fM+
 LZ5YwPWnNXneS87pdeI9W4vXKq0xcLwdaKz+Z/GV9YmrmLjuC17fWeJ7PH/S0wXxNvGWFxhc
 7D7fmhgRdUdg8+ni/ouWSrPun0h9vDWf2UbxzKlFnw13VrJYlusvPsxu9TJ5vrX4ojadw7E/
 3EsjmAOUWIozEg21mIuKEwEAW0i9XwMAAA==
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
Cc: nd <nd@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_002_67b4454424c4485fb59d542d052aaf2dinboschcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Bertrand,

I succeeded in building the core minimal image with dunfell and its compati=
ble branches [except xen-troops (modified some files to complete the build)=
].

But I face the following error while booting.

(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Timer: Unable to retrieve IRQ 0 from the device tree
(XEN) ****************************************

My Build Configuration:
BB_VERSION           =3D "1.46.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "aarch64-poky-linux"
MACHINE              =3D "salvator-x"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "3.1.1"
TUNE_FEATURES        =3D "aarch64 cortexa57-cortexa53"
TARGET_FPU           =3D ""
SOC_FAMILY           =3D "rcar-gen3:r8a7795"
meta                =20
meta-poky           =20
meta-yocto-bsp       =3D "tmp:39d7cf1abb2c88baaedb3a627eba8827747b2eb9"
meta-rcar-gen3       =3D "dunfell-dev:2b3b0447fbc6c360a43a13525ae63a253fe3e=
5b7"
meta-oe             =20
meta-python         =20
meta-filesystems    =20
meta-networking      =3D "tmp:cc6fc6b1641ab23089c1e3bba11e0c6394f0867c"
meta-selinux         =3D "dunfell:7af62c91d7d00a260cf28e7908955539304d100d"
meta-virtualization  =3D "dunfell:ffd787fb850e5a1657a01febc8402c74832147a1"
meta-rcar-gen3-xen   =3D "master:60699c631d541aeeaebaeec9a087efed9385ee42"

May I know the reason for this error? Am I missing something here? Attachin=
g complete logs for reference.

Mit freundlichen Gr=FC=DFen / Best regards

 Chockalingam Manikandan

ES-CM Core fn,ADIT (RBEI/ECF3)
Robert Bosch GmbH | Postfach 10 60 50 | 70049 Stuttgart | GERMANY | www.bos=
ch.com
Tel. +91 80 6136-4452 | Fax +91 80 6617-0711 | Manikandan.Chockalingam@in.b=
osch.com

Registered Office: Stuttgart, Registration Court: Amtsgericht Stuttgart, HR=
B 14000;
Chairman of the Supervisory Board: Franz Fehrenbach; Managing Directors: Dr=
. Volkmar Denner,=20
Prof. Dr. Stefan Asenkerschbaumer, Dr. Michael Bolle, Dr. Christian Fischer=
, Dr. Stefan Hartung,
Dr. Markus Heyn, Harald Kr=F6ger, Christoph K=FCbel, Rolf Najork, Uwe Rasch=
ke, Peter Tyroller

-----Original Message-----
From: Manikandan Chockalingam (RBEI/ECF3)=20
Sent: Friday, July 10, 2020 9:56 AM
To: 'Bertrand Marquis' <Bertrand.Marquis@arm.com>
Cc: xen-devel@lists.xen.org; nd <nd@arm.com>
Subject: RE: [BUG] Xen build for RCAR failing

Hello Bertrand,

I couldn't find dunfell branch in the following repos 1. meta-selinux 2. xe=
n-troops 3. meta-renesas [I took dunfell-dev]

Mit freundlichen Gr=FC=DFen / Best regards

 Chockalingam Manikandan

ES-CM Core fn,ADIT (RBEI/ECF3)
Robert Bosch GmbH | Postfach 10 60 50 | 70049 Stuttgart | GERMANY | www.bos=
ch.com Tel. +91 80 6136-4452 | Fax +91 80 6617-0711 | Manikandan.Chockaling=
am@in.bosch.com

Registered Office: Stuttgart, Registration Court: Amtsgericht Stuttgart, HR=
B 14000; Chairman of the Supervisory Board: Franz Fehrenbach; Managing Dire=
ctors: Dr. Volkmar Denner, Prof. Dr. Stefan Asenkerschbaumer, Dr. Michael B=
olle, Dr. Christian Fischer, Dr. Stefan Hartung, Dr. Markus Heyn, Harald Kr=
=F6ger, Christoph K=FCbel, Rolf Najork, Uwe Raschke, Peter Tyroller

-----Original Message-----
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
Sent: Tuesday, July 7, 2020 5:18 PM
To: Manikandan Chockalingam (RBEI/ECF3) <Manikandan.Chockalingam@in.bosch.c=
om>
Cc: xen-devel@lists.xen.org; nd <nd@arm.com>
Subject: Re: [BUG] Xen build for RCAR failing



> On 7 Jul 2020, at 11:18, Manikandan Chockalingam (RBEI/ECF3) <Manikandan.=
Chockalingam@in.bosch.com> wrote:
>=20
> Hello Bertrand,
>=20
> Thank you. I will try a fresh build with dunfell branch. All layers in th=
e sense [poky, meta-openembedded, meta-linaro, meta-rensas, meta-virtualisa=
tion, meta-selinux, xen-troops] right?

right

>=20
> Also, Can I use the same proprietary drivers which I used for yocto2.19[R=
-Car_Gen3_Series_Evaluation_Software_Package_for_Linux-20170427.zip] for th=
is branch?

I have no idea what is in that but i would guess it will probably not work =
that easily.
You might need to get in contact with Renesas to get more up-to-date instru=
ctions on how to build that.

Bertrand


--_002_67b4454424c4485fb59d542d052aaf2dinboschcom_
Content-Type: text/plain; name="built-u-boot-xen-bootup-error.txt"
Content-Description: built-u-boot-xen-bootup-error.txt
Content-Disposition: attachment;
	filename="built-u-boot-xen-bootup-error.txt"; size=6480;
	creation-date="Tue, 14 Jul 2020 13:38:45 GMT";
	modification-date="Tue, 14 Jul 2020 13:38:45 GMT"
Content-Transfer-Encoding: base64

WyAgICAwLjAwMDE0OV0gTk9USUNFOiAgQkwyOiBSLUNhciBIMyBJbml0aWFsIFByb2dyYW0gTG9h
ZGVyKENBNTcpDQpbICAgIDAuMDA0NTg1XSBOT1RJQ0U6ICBCTDI6IEluaXRpYWwgUHJvZ3JhbSBM
b2FkZXIoUmV2LjIuMC42KQ0KWyAgICAwLjAxMDExOV0gTk9USUNFOiAgQkwyOiBQUlIgaXMgUi1D
YXIgSDMgVmVyLjIuMA0KWyAgICAwLjAxNDc4N10gTk9USUNFOiAgQkwyOiBCb2FyZCBpcyBTYWx2
YXRvci1YIFJldi4xLjANClsgICAgMC4wMTk4MTRdIE5PVElDRTogIEJMMjogQm9vdCBkZXZpY2Ug
aXMgSHlwZXJGbGFzaCgxNjBNSHopDQpbICAgIDAuMDI1MzI1XSBOT1RJQ0U6ICBCTDI6IExDTSBz
dGF0ZSBpcyBDTQ0KWyAgICAwLjAyOTM2OF0gTk9USUNFOiAgQkwyOiBBVlMgc2V0dGluZyBzdWNj
ZWVkZWQuIERWRlNfU2V0VklEPTB4NTMNClsgICAgMC4wMzUzODRdIE5PVElDRTogIEJMMjogRERS
MzIwMChyZXYuMC40MCkNClsgICAgMC4wNTA3MjJdIE5PVElDRTogIEJMMjogW0NPTERfQk9PVF0N
ClsgICAgMC4wNTk0OTddIE5PVElDRTogIEJMMjogRFJBTSBTcGxpdCBpcyA0Y2gNClsgICAgMC4w
NjIxOTJdIE5PVElDRTogIEJMMjogUW9TIGlzIGRlZmF1bHQgc2V0dGluZyhyZXYuMC4yMSkNClsg
ICAgMC4wNjc2MzVdIE5PVElDRTogIEJMMjogRFJBTSByZWZyZXNoIGludGVydmFsIDEuOTUgdXNl
Yw0KWyAgICAwLjA3Mjk5Ml0gTk9USUNFOiAgQkwyOiBQZXJpb2RpYyBXcml0ZSBEUSBUcmFpbmlu
Zw0KWyAgICAwLjA3ODAyM10gTk9USUNFOiAgQkwyOiB2MS41KHJlbGVhc2UpOmFmOWY0MjkNClsg
ICAgMC4wODI0MTBdIE5PVElDRTogIEJMMjogQnVpbHQgOiAwNzowNzoyMiwgSnVsIDE0IDIwMjAN
ClsgICAgMC4wODc1OTddIE5PVElDRTogIEJMMjogTm9ybWFsIGJvb3QNClsgICAgMC4wOTEyMzhd
IE5PVElDRTogIEJMMjogZHN0PTB4ZTYzMjUxMDAgc3JjPTB4ODE4MDAwMCBsZW49NTEyKDB4MjAw
KQ0KWyAgICAwLjA5NzYyM10gTk9USUNFOiAgQkwyOiBkc3Q9MHg0M2YwMDAwMCBzcmM9MHg4MTgw
NDAwIGxlbj02MTQ0KDB4MTgwMCkNClsgICAgMC4xMDQyMzNdIE5PVElDRTogIEJMMjogZHN0PTB4
NDQwMDAwMDAgc3JjPTB4ODFjMDAwMCBsZW49NjU1MzYoMHgxMDAwMCkNClsgICAgMC4xMTEyMTdd
IE5PVElDRTogIEJMMjogZHN0PTB4NDQxMDAwMDAgc3JjPTB4ODIwMDAwMCBsZW49MTA0ODU3Nigw
eDEwMDAwMCkNClsgICAgMC4xMjIxNzldIE5PVElDRTogIEJMMjogZHN0PTB4NTAwMDAwMDAgc3Jj
PTB4ODY0MDAwMCBsZW49MTA0ODU3NigweDEwMDAwMCkNClsgICAgMC4xMzIwMzNdIE5PVElDRTog
IEJMMjogQm9vdGluZyBCTDMxDQoNClUtQm9vdCAyMDE4LjA5IChKdWwgMTIgMjAyMCAtIDE5OjA5
OjEzICswMDAwKQ0KDQpDUFU6IFJlbmVzYXMgRWxlY3Ryb25pY3MgUjhBNzc5NSByZXYgMi4wDQpN
b2RlbDogUmVuZXNhcyBTYWx2YXRvci1YIGJvYXJkIGJhc2VkIG9uIHI4YTc3OTUgRVMyLjArDQpE
UkFNOiAgMy45IEdpQg0KQmFuayAjMDogMHgwNDgwMDAwMDAgLSAweDA3ZmZmZmZmZiwgODk2IE1p
Qg0KQmFuayAjMTogMHg1MDAwMDAwMDAgLSAweDUzZmZmZmZmZiwgMSBHaUINCkJhbmsgIzI6IDB4
NjAwMDAwMDAwIC0gMHg2M2ZmZmZmZmYsIDEgR2lCDQpCYW5rICMzOiAweDcwMDAwMDAwMCAtIDB4
NzNmZmZmZmZmLCAxIEdpQg0KDQpNTUM6ICAgc2RAZWUxMDAwMDA6IDAsIHNkQGVlMTQwMDAwOiAx
LCBzZEBlZTE2MDAwMDogMg0KTG9hZGluZyBFbnZpcm9ubWVudCBmcm9tIE1NQy4uLiBPSw0KSW46
ICAgIHNlcmlhbEBlNmU4ODAwMA0KT3V0OiAgIHNlcmlhbEBlNmU4ODAwMA0KRXJyOiAgIHNlcmlh
bEBlNmU4ODAwMA0KTmV0OiAgIA0KRXJyb3I6IGV0aGVybmV0QGU2ODAwMDAwIGFkZHJlc3Mgbm90
IHNldC4NCmV0aC0xOiBldGhlcm5ldEBlNjgwMDAwMA0KSGl0IGFueSBrZXkgdG8gc3RvcCBhdXRv
Ym9vdDogIDAgDQo9PiBzZXRlbnYgZXRoYWRkciBkZTphZDpiZTplZjowMTowMg0KPT4gc2V0ZW52
IGlwYWRkciAxOTIuMTY4LjIuNTENCj0+IHNldGVudiBzZXJ2ZXJpcCAxOTIuMTY4LjIuMTENCj0+
IHRmdHAgMHg0QTAwMDAwMCByOGE3Nzk1LXNhbHZhdG9yLXgteGVuLmR0Yg0KZXRoZXJuZXRAZTY4
MDAwMDAgV2FpdGluZyBmb3IgUEhZIGF1dG8gbmVnb3RpYXRpb24gdG8gY29tcGxldGUuLi4uLiBk
b25lDQpVc2luZyBldGhlcm5ldEBlNjgwMDAwMCBkZXZpY2UNClRGVFAgZnJvbSBzZXJ2ZXIgMTky
LjE2OC4yLjExOyBvdXIgSVAgYWRkcmVzcyBpcyAxOTIuMTY4LjIuNTENCkZpbGVuYW1lICdyOGE3
Nzk1LXNhbHZhdG9yLXgteGVuLmR0YicuDQpMb2FkIGFkZHJlc3M6IDB4NGEwMDAwMDANCkxvYWRp
bmc6ICoNCkFSUCBSZXRyeSBjb3VudCBleGNlZWRlZDsgc3RhcnRpbmcgYWdhaW4NCj0+IHRmdHAg
MHg0QTAwMDAwMCByOGE3Nzk1LXNhbHZhdG9yLXgteGVuLmR0Yg0KVXNpbmcgZXRoZXJuZXRAZTY4
MDAwMDAgZGV2aWNlDQpURlRQIGZyb20gc2VydmVyIDE5Mi4xNjguMi4xMTsgb3VyIElQIGFkZHJl
c3MgaXMgMTkyLjE2OC4yLjUxDQpGaWxlbmFtZSAncjhhNzc5NS1zYWx2YXRvci14LXhlbi5kdGIn
Lg0KTG9hZCBhZGRyZXNzOiAweDRhMDAwMDAwDQpMb2FkaW5nOiAjIyMjIyMNCiAgICAgICAgIDIu
MiBNaUIvcw0KZG9uZQ0KQnl0ZXMgdHJhbnNmZXJyZWQgPSA4MDc4MyAoMTNiOGYgaGV4KQ0KPT4g
dGZ0cCAweDQ4MjAwMDAwIEltYWdlDQpVc2luZyBldGhlcm5ldEBlNjgwMDAwMCBkZXZpY2UNClRG
VFAgZnJvbSBzZXJ2ZXIgMTkyLjE2OC4yLjExOyBvdXIgSVAgYWRkcmVzcyBpcyAxOTIuMTY4LjIu
NTENCkZpbGVuYW1lICdJbWFnZScuDQpMb2FkIGFkZHJlc3M6IDB4NDgyMDAwMDANCkxvYWRpbmc6
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjDQogICAgICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KICAgICAgICAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiAgICAgICAg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjDQogICAgICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KICAgICAgICAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiAgICAgICAg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjDQogICAgICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KICAgICAgICAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiAgICAgICAg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjDQogICAgICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KICAgICAgICAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiAgICAgICAg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjDQogICAgICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KICAgICAgICAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiAgICAgICAg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjDQogICAgICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KICAgICAgICAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiAgICAgICAg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjDQogICAgICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KICAgICAgICAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiAgICAgICAg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjDQogICAgICAgICAjIyMjIyMjIyMjIyMNCiAgICAgICAgIDIuMyBNaUIvcw0KZG9u
ZQ0KQnl0ZXMgdHJhbnNmZXJyZWQgPSAyMTE1NjM1MiAoMTQyZDIwMCBoZXgpDQo9PiB0ZnRwIDB4
NDgwMDAwMDAgeGVuDQpVc2luZyBldGhlcm5ldEBlNjgwMDAwMCBkZXZpY2UNClRGVFAgZnJvbSBz
ZXJ2ZXIgMTkyLjE2OC4yLjExOyBvdXIgSVAgYWRkcmVzcyBpcyAxOTIuMTY4LjIuNTENCkZpbGVu
YW1lICd4ZW4nLg0KTG9hZCBhZGRyZXNzOiAweDQ4MDAwMDAwDQpMb2FkaW5nOiAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KICAgICAg
ICAgMi4xIE1pQi9zDQpkb25lDQpCeXRlcyB0cmFuc2ZlcnJlZCA9IDg1MzMyOCAoZDA1NTAgaGV4
KQ0KPT4gYm9vdGkgMHg0ODAwMDAwMCAtIDB4NEEwMDAwMDANCiMjIEZsYXR0ZW5lZCBEZXZpY2Ug
VHJlZSBibG9iIGF0IDRhMDAwMDAwDQogICBCb290aW5nIHVzaW5nIHRoZSBmZHQgYmxvYiBhdCAw
eDRhMDAwMDAwDQogICBVc2luZyBEZXZpY2UgVHJlZSBpbiBwbGFjZSBhdCAwMDAwMDAwMDRhMDAw
MDAwLCBlbmQgMDAwMDAwMDA0YTAxNmI4ZQ0KDQpTdGFydGluZyBrZXJuZWwgLi4uDQoNCiBYZW4g
NC4xMi40LXByZQ0KKFhFTikgWGVuIHZlcnNpb24gNC4xMi40LXByZSAobWFuaWthbmRhbkApIChh
YXJjaDY0LWxpbnV4LWdudS1nY2MgKFNvdXJjZXJ5IENvZGVCZW5jaCAyMDE4LjA1LTcpIDcuMy4x
IDIwMTgwNjEyKSBkMA0KKFhFTikgTGF0ZXN0IENoYW5nZVNldDogVHVlIEp1bCA3IDE1OjEzOjQw
IDIwMjAgKzAyMDAgZ2l0OjE5ZTBiYmINCihYRU4pIFByb2Nlc3NvcjogNDExZmQwNzM6ICJBUk0g
TGltaXRlZCIsIHZhcmlhbnQ6IDB4MSwgcGFydCAweGQwNywgcmV2IDB4Mw0KKFhFTikgNjQtYml0
IEV4ZWN1dGlvbjoNCihYRU4pICAgUHJvY2Vzc29yIEZlYXR1cmVzOiAwMDAwMDAwMDAwMDAyMjIy
IDAwMDAwMDAwMDAwMDAwMDANCihYRU4pICAgICBFeGNlcHRpb24gTGV2ZWxzOiBFTDM6NjQrMzIg
RUwyOjY0KzMyIEVMMTo2NCszMiBFTDA6NjQrMzINCihYRU4pICAgICBFeHRlbnNpb25zOiBGbG9h
dGluZ1BvaW50IEFkdmFuY2VkU0lNRA0KKFhFTikgICBEZWJ1ZyBGZWF0dXJlczogMDAwMDAwMDAx
MDMwNTEwNiAwMDAwMDAwMDAwMDAwMDAwDQooWEVOKSAgIEF1eGlsaWFyeSBGZWF0dXJlczogMDAw
MDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwDQooWEVOKSAgIE1lbW9yeSBNb2RlbCBGZWF0
dXJlczogMDAwMDAwMDAwMDAwMTEyNCAwMDAwMDAwMDAwMDAwMDAwDQooWEVOKSAgIElTQSBGZWF0
dXJlczogIDAwMDAwMDAwMDAwMTExMjAgMDAwMDAwMDAwMDAwMDAwMA0KKFhFTikgMzItYml0IEV4
ZWN1dGlvbjoNCihYRU4pICAgUHJvY2Vzc29yIEZlYXR1cmVzOiAwMDAwMDEzMTowMDAxMTAxMQ0K
KFhFTikgICAgIEluc3RydWN0aW9uIFNldHM6IEFBcmNoMzIgQTMyIFRodW1iIFRodW1iLTIgSmF6
ZWxsZQ0KKFhFTikgICAgIEV4dGVuc2lvbnM6IEdlbmVyaWNUaW1lciBTZWN1cml0eQ0KKFhFTikg
ICBEZWJ1ZyBGZWF0dXJlczogMDMwMTAwNjYNCihYRU4pICAgQXV4aWxpYXJ5IEZlYXR1cmVzOiAw
MDAwMDAwMA0KKFhFTikgICBNZW1vcnkgTW9kZWwgRmVhdHVyZXM6IDEwMjAxMTA1IDQwMDAwMDAw
IDAxMjYwMDAwIDAyMTAyMjExDQooWEVOKSAgSVNBIEZlYXR1cmVzOiAwMjEwMTExMCAxMzExMjEx
MSAyMTIzMjA0MiAwMTExMjEzMSAwMDAxMTE0MiAwMDAxMTEyMQ0KKFhFTikgDQooWEVOKSAqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQooWEVOKSBQYW5pYyBvbiBDUFUg
MDoNCihYRU4pIFRpbWVyOiBVbmFibGUgdG8gcmV0cmlldmUgSVJRIDAgZnJvbSB0aGUgZGV2aWNl
IHRyZWUNCihYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCihY
RU4pIA0KKFhFTikgUmVib290IGluIGZpdmUgc2Vjb25kcy4uLg0K

--_002_67b4454424c4485fb59d542d052aaf2dinboschcom_--

