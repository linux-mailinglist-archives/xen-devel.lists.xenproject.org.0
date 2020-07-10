Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77C321AE10
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 06:28:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtkcJ-0004Ir-Ia; Fri, 10 Jul 2020 04:26:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFc2=AV=in.bosch.com=manikandan.chockalingam@srs-us1.protection.inumbo.net>)
 id 1jtkcF-0004Im-U4
 for xen-devel@lists.xen.org; Fri, 10 Jul 2020 04:26:30 +0000
X-Inumbo-ID: 8255d0c1-c265-11ea-8f56-12813bfff9fa
Received: from de-out1.bosch-org.com (unknown [139.15.230.186])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8255d0c1-c265-11ea-8f56-12813bfff9fa;
 Fri, 10 Jul 2020 04:26:24 +0000 (UTC)
Received: from fe0vm1650.rbesz01.com
 (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
 by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 4B30Nb1jhdz4f3lwb;
 Fri, 10 Jul 2020 06:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=key1-intmail; t=1594355183;
 bh=0flT9FbF1bnILmJA1WrUz6hc6gUFrxwO0XIL8WgUsdU=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=TRK7CCrDxpsJj2Y0PHDvyM/XO8LfkrOwtCb3fA7WsbWlbpHClJ6b6P8wreQO0xLFN
 GEVlmdVUT1WR2UmW+t9iT1tCjc4ZwjoVKGxM4EY5oaG861/F6netRdL/xC4MX4xCF9
 gnXxbFKF3WoCyuK3sEgBzkN4OzZc/9Ms5V2jYTqY=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 4B30Nb1Mbsz1DF;
 Fri, 10 Jul 2020 06:26:23 +0200 (CEST)
X-AuditID: 0a3aad15-e97ff700000001dd-fc-5f07edef2019
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id 8E.D4.00477.FEDE70F5;
 Fri, 10 Jul 2020 06:26:23 +0200 (CEST)
Received: from FE-MBX2016.de.bosch.com (fe-mbx2016.de.bosch.com [10.3.231.22])
 by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 4B30Nb0csrzvl6;
 Fri, 10 Jul 2020 06:26:23 +0200 (CEST)
Received: from SGPMBX2022.APAC.bosch.com (10.187.83.37) by
 FE-MBX2016.de.bosch.com (10.3.231.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Fri, 10 Jul 2020 06:26:22 +0200
Received: from SGPMBX2022.APAC.bosch.com (10.187.83.37) by
 SGPMBX2022.APAC.bosch.com (10.187.83.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Fri, 10 Jul 2020 12:26:20 +0800
Received: from SGPMBX2022.APAC.bosch.com ([fe80::2d4d:b176:b210:896]) by
 SGPMBX2022.APAC.bosch.com ([fe80::2d4d:b176:b210:896%6]) with mapi id
 15.01.1979.003; Fri, 10 Jul 2020 12:26:20 +0800
From: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [BUG] Xen build for RCAR failing
Thread-Topic: [BUG] Xen build for RCAR failing
Thread-Index: AdZUKc5JeR7gPpESR52uLkZK1kYwOwAEsnEAAAD8OlAAAEBtgAABZtcgAANXdAAAh1iJgA==
Date: Fri, 10 Jul 2020 04:26:20 +0000
Message-ID: <427f99fc7de04946957c2896e39fdb78@in.bosch.com>
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
 <1D0E7281-95D7-482E-BF6D-EE5B1FEE4876@arm.com>
 <ab84437081a346d6bf0f73581382c74e@in.bosch.com>
 <D84A5DA7-683C-480B-8837-C51D560FC2E1@arm.com>
 <139024a891324455a13a3d468908798d@in.bosch.com>
 <C3BCAA62-51EF-49DD-B978-6657BC6D5A21@arm.com>
In-Reply-To: <C3BCAA62-51EF-49DD-B978-6657BC6D5A21@arm.com>
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.204]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsXCZbVWVvf9W/Z4g/1POS2WLtnMZHFmeQ+z
 xZKPi1kcmD3WzFvD6HF092+mAKYoLpuU1JzMstQifbsEroxZt48wFhzmq1i0dw1TA2MDTxcj
 J4eEgInE7uWrGLsYuTiEBGYwSczatBfK2c0osXb7MjYI5wOjxNFdMM5nRoln/xewQDiHGCWa
 2t4ygQxjEwiR2Lf3BjuILSKgL/H75g9WEJtZwENi1dU9jCC2sICuRNe52VA1ehJbF/azQthh
 Enf+bwCrYRFQlXj/7A0biM0rYC2xY+lNZohlm5gkWna2gzVzAiXOvVoP1swoICux6OYkFohl
 4hK3nsxngvhOQGLJnvPMELaoxMvH/1ghbEWJN182sUPU60ncmDqFDcLWlli28DUzxGJBiZMz
 n7BMYJSYhWTsLCQts5C0zELSsoCRZRWjaFqqQVmuobmJoV5RUmpxlYGhXnJ+7iZGSAyK7mC8
 0/1B7xAjEwcjMAQ5mJVEeA0UWeOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ86rwbIwTEkhPLEnN
 Tk0tSC2CyTJxcEo1MMloamxe8WXLtWfrQ44t/nd8ubavlpPiUomV9uc2n1u3yIShKLZ6X/TO
 5HPsil17paZoZ54NOb3NUsDryN4pUw96p84IU1X+33L94JTtU6fP3W7X3s8UsvJOlcbKT5az
 +TnEhGXYMk52ZhflLdghU3DcS03hW6PFl9UVLceat3v4CpcwXK1Y7nQ+wsj2jnlX1qx73i9e
 d+//+yU2z+f/CxMj8+N3LeManv+Yoz65S2r5npMLbon/ub3k97yq2y4Lr8p9kp1uXb8/dt1y
 84rvcXdu9s95lZnDVzz7mXy6RSGPuezECV43FwtLylRtzJRR0pnNNGUt49sbmR9/32W3fKvX
 kXri2Ykp8Qv28k2YsjJdiaU4I9FQi7moOBEAg0TE2zADAAA=
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

Hello Bertrand,

I couldn't find dunfell branch in the following repos
1. meta-selinux
2. xen-troops
3. meta-renesas [I took dunfell-dev]

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
From: Bertrand Marquis <Bertrand.Marquis@arm.com>=20
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


