Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76EE2169EC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 12:19:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jskgc-0002qB-6S; Tue, 07 Jul 2020 10:18:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gHK=AS=in.bosch.com=manikandan.chockalingam@srs-us1.protection.inumbo.net>)
 id 1jskga-0002q6-So
 for xen-devel@lists.xen.org; Tue, 07 Jul 2020 10:18:48 +0000
X-Inumbo-ID: 3da8f758-c03b-11ea-8d45-12813bfff9fa
Received: from de-out1.bosch-org.com (unknown [139.15.230.186])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3da8f758-c03b-11ea-8d45-12813bfff9fa;
 Tue, 07 Jul 2020 10:18:46 +0000 (UTC)
Received: from si0vm1948.rbesz01.com
 (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
 by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 4B1JLY2tqfz1XLDQx;
 Tue,  7 Jul 2020 12:18:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=key1-intmail; t=1594117125;
 bh=0flT9FbF1bnILmJA1WrUz6hc6gUFrxwO0XIL8WgUsdU=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=BX0qJ13YDqU+ICX8fYGlMS1GZJtOWlEyDuNJq5XlFzDYtfu/WR8Vcle+xv7JVpGLJ
 EmQ5nbcnBtXs5FiFNIii/QvFbmUHNwwlEZmGdT5LTMp938Dppi28SKztVI7mNyaZI4
 L778NlMPadPJSuUV3Fd+HPfR4C6xr6D8ZLNnBDoQ=
Received: from si0vm2083.rbesz01.com (unknown [10.58.172.176])
 by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 4B1JLY2WT5z1hw;
 Tue,  7 Jul 2020 12:18:45 +0200 (CEST)
X-AuditID: 0a3aad17-4b9ff7000000186c-e8-5f044c052dbe
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm2083.rbesz01.com (SMG Outbound) with SMTP id 83.F6.06252.50C440F5;
 Tue,  7 Jul 2020 12:18:45 +0200 (CEST)
Received: from FE-MBX2057.de.bosch.com (fe-mbx2057.de.bosch.com [10.3.231.162])
 by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 4B1JLY1p7zz6CjZP2;
 Tue,  7 Jul 2020 12:18:45 +0200 (CEST)
Received: from SGPMBX2024.APAC.bosch.com (10.187.83.44) by
 FE-MBX2057.de.bosch.com (10.3.231.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Tue, 7 Jul 2020 12:18:44 +0200
Received: from SGPMBX2022.APAC.bosch.com (10.187.83.37) by
 SGPMBX2024.APAC.bosch.com (10.187.83.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Tue, 7 Jul 2020 18:18:42 +0800
Received: from SGPMBX2022.APAC.bosch.com ([fe80::2d4d:b176:b210:896]) by
 SGPMBX2022.APAC.bosch.com ([fe80::2d4d:b176:b210:896%6]) with mapi id
 15.01.1979.003; Tue, 7 Jul 2020 18:18:42 +0800
From: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [BUG] Xen build for RCAR failing
Thread-Topic: [BUG] Xen build for RCAR failing
Thread-Index: AdZUKc5JeR7gPpESR52uLkZK1kYwOwAEsnEAAAD8OlAAAEBtgAABZtcg
Date: Tue, 7 Jul 2020 10:18:42 +0000
Message-ID: <139024a891324455a13a3d468908798d@in.bosch.com>
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
 <1D0E7281-95D7-482E-BF6D-EE5B1FEE4876@arm.com>
 <ab84437081a346d6bf0f73581382c74e@in.bosch.com>
 <D84A5DA7-683C-480B-8837-C51D560FC2E1@arm.com>
In-Reply-To: <D84A5DA7-683C-480B-8837-C51D560FC2E1@arm.com>
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.214]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRmVeSWpSXmKPExsXCZbVWVpfVhyXeYNpGYYulSzYzWZxZ3sNs
 seTjYhYHZo8189Ywehzd/ZspgCmKyyYlNSezLLVI3y6BK2NT82S2gjP8FSsaO5kbGP/wdDFy
 cEgImEjc2xraxcjFISQwg0li0oKvjF2MnEDOfkaJ9Y/tIRIfGCX29H5jh3A+MUo0vv3NDOEc
 ZJS4v2sLC0gLm0CIxL69N9hBbBEBfYnfN3+wgtjMAh4Sq67uARsrLKAr0XVuNlSNnsTWhf2s
 ELabxPuetcwgNouAisSW+9fAangFrCV61xxmhVh2nlFi+vZ3bCAJTqDE6oZGsCJGAVmJRTcn
 sUAsE5e49WQ+E4gtISAgsWTPeWYIW1Ti5eN/rBC2osSy+avYIer1JG5MncIGYWtLLFv4mhli
 saDEyZlPWCYwSsxCMnYWkpZZSFpmIWlZwMiyilG0ONOgLNfIwMJYrygptbjKwFAvOT93EyMk
 /sR3MP7v+KB3iJGJg/EQowQHs5IIb682Y7wQb0piZVVqUX58UWlOavEhRmkOFiVxXhWejXFC
 AumJJanZqakFqUUwWSYOTqkGprqJEYu+L//8gylqS1pspdP5d/zTbFSOZjoaf9123mr+BFG/
 xSu383Bbq57d4M+tMnuDZupKZf172t99OaXNn4t+ylB4OEf/soVki9leq2lzNG68m2YWrDNZ
 Wt3vxe5TaaYy32ytqy8ZfYs6e93yS+WL+MVvOHJuiglzl5nmeFpt3qH0xrj086vN2e+e9VmZ
 uxSrF9xt1s24alLnJuHEdmDynQcvb3GzcdzYLnPk+87yJXIeollbTLZNef9hrtLck/rbr39j
 5ZC+dTFdSfdcwZfi+Q+OTig5uIr3Q1eegntf1a2bNXe/O3Xfij69OmURh4tnubHh+rdu/5pu
 33/U/jLgYNyehJkdjm9tn5aeT1ZiKc5INNRiLipOBABYejiALgMAAA==
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

Thank you. I will try a fresh build with dunfell branch. All layers in the =
sense [poky, meta-openembedded, meta-linaro, meta-rensas, meta-virtualisati=
on, meta-selinux, xen-troops] right?

Also, Can I use the same proprietary drivers which I used for yocto2.19[R-C=
ar_Gen3_Series_Evaluation_Software_Package_for_Linux-20170427.zip] for this=
 branch?

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
Sent: Tuesday, July 7, 2020 3:03 PM
To: Manikandan Chockalingam (RBEI/ECF3) <Manikandan.Chockalingam@in.bosch.c=
om>
Cc: xen-devel@lists.xen.org; nd <nd@arm.com>
Subject: Re: [BUG] Xen build for RCAR failing

Hi,

> On 7 Jul 2020, at 10:28, Manikandan Chockalingam (RBEI/ECF3) <Manikandan.=
Chockalingam@in.bosch.com> wrote:
>=20
> Hello Bertrand,
>=20
> Thanks for your quick response. I tired switching to dunfell branch and b=
uild gives parse error as below.
>=20
> bitbake core-image-weston
> ERROR: ParseError in /home/manikandan/yocto_2.19/build/meta-virtualizatio=
n/classes/: not a BitBake file
>=20
> Is there any additional changes required here?

I do not have this on my side when building using dunfell.
You might need to restart from a fresh build and checkout (you need dunfell=
 branch on all layers).

Bertrand


