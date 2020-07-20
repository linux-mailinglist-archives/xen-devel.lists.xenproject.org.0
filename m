Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F7F225B71
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 11:25:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxS2h-0004D0-Ak; Mon, 20 Jul 2020 09:25:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdB1=A7=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1jxS2f-0004Cp-El
 for xen-devel@lists.xen.org; Mon, 20 Jul 2020 09:25:01 +0000
X-Inumbo-ID: e23b1fec-ca6a-11ea-9f74-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e23b1fec-ca6a-11ea-9f74-12813bfff9fa;
 Mon, 20 Jul 2020 09:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595237100;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SLZ3JUl1GKSwslnsYU09bBRQlWFBZdz0wz8wzZsV5Ms=;
 b=NOdr5PPXTGgkzRZBTkLJpn7Jt4X/QVHcQ2XEBzq97cxy7JNZlhhpOnbd
 gOYsRhSzIbRlwJUb2lJInU9HOwvAsxDs552Frz9JoAkvMxHW8JYeGGr7H
 HqILXzNEeFkLOlhSdWFrSL5R9z2H8fM1SX0cD9yKcInzm6dWwyDICjAVM k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: gvsyrebKPOEOE096nZOmBT0ZW4O/maVmc7xSQfdsRmJPMjervanTLUy4Oh/9dDf4jwN6D8oEm3
 pF3hI13kWj7ghzh9lTqQq9hPNWcUbix+ATkdm3e/SR62y21LTHJQmjCSvqe5JjXFIMpgzsb6ms
 ZufstZR9sTEbP62rKRBvpCjfYc8W0L4gcCYBNpi+dbDJ1QPXCHQsT/N33XLBsZKFouhQQlehtq
 Nio0e8/40v0ZtTMSl34SHas4mD6uz7yLnrQaNwdjM6lFT55GaTlBl+AAjzWUkq/Og7CNakavL+
 IjQ=
X-SBRS: 2.7
X-MesageID: 22739429
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="22739429"
From: Christian Lindig <christian.lindig@citrix.com>
To: 'Elliott Mitchell' <ehem+xen@m5p.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>, "paul@xen.org" <paul@xen.org>
Subject: Re: [PATCH 2/2] tools/ocaml: Default to useful build output
Thread-Topic: [PATCH 2/2] tools/ocaml: Default to useful build output
Thread-Index: AQHWXLQfZqk/9n2Ez0iUq9XU56BN2qkQJXHN///oGACAACWpQQ==
Date: Mon, 20 Jul 2020 09:24:56 +0000
Message-ID: <1595237096474.23865@citrix.com>
References: <20200718033242.GB88869@mattapan.m5p.com>
 <1595234320493.39632@citrix.com>,<000d01d65e74$3deda4d0$b9c8ee70$@xen.org>
In-Reply-To: <000d01d65e74$3deda4d0$b9c8ee70$@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Edwin Torok <edvin.torok@citrix.com>,
 "wl@xen.org" <wl@xen.org>, "dave@recoil.org" <dave@recoil.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

=0A=
I think this would at least force a clean-up and open the project to wider =
set of OCaml developers. This might lead to a situation where the OCaml xen=
store is not readily available for the consumers of Xen and I don't know wh=
o wants it how much. But I would prefer a situation where the OCaml xenstor=
e can be built against a system with Xen libraries installed rather than on=
ly within the Xen tree. This would help to modernise the OCaml xenstore cod=
e base not just in terms of the build system but tackle long-standing probl=
ems like improving the code around select/poll which is inefficient. =0A=
=0A=
-- C=0A=
=0A=
________________________________________=0A=
From: Paul Durrant <xadimgnik@gmail.com>=0A=
Sent: 20 July 2020 10:00=0A=
To: Christian Lindig; 'Elliott Mitchell'; xen-devel@lists.xen.org=0A=
Cc: Ian Jackson; Edwin Torok; wl@xen.org; dave@recoil.org=0A=
Subject: RE: [PATCH 2/2] tools/ocaml: Default to useful build output=0A=
=0A=
> -----Original Message-----=0A=
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Chr=
istian Lindig=0A=
> Sent: 20 July 2020 09:39=0A=
> To: Elliott Mitchell <ehem+xen@m5p.com>; xen-devel@lists.xen.org=0A=
> Cc: Ian Jackson <Ian.Jackson@citrix.com>; Edwin Torok <edvin.torok@citrix=
.com>; wl@xen.org;=0A=
> dave@recoil.org=0A=
> Subject: Re: [PATCH 2/2] tools/ocaml: Default to useful build output=0A=
>=0A=
>=0A=
>=0A=
> > Time for a bit of controversy.=0A=
>=0A=
> OCaml outside Xen has moved to a different model of building based on dun=
e which is fast, declarative=0A=
> and reliable. The OCaml xenstore is stagnating because nobody with OCaml =
experience wants to touch it=0A=
> anymore.=0A=
=0A=
It is still the default. Would you suggest that we change this and make C x=
enstored the default for 4.15, deprecating oxenstored=0A=
with a view to subsequently purging it from the tree in the 4.16 dev cycle?=
=0A=
=0A=
  Paul=0A=
=0A=
> It would be beneficial for the health of the OCaml xenstore to split it o=
ut such that it=0A=
> could be worked on independently. You might argue that Make is still appr=
opriate for building OCaml=0A=
> projects but the OCaml community has moved through several build systems,=
 starting from Make, and=0A=
> learned the hard way that this is not an easy problem. After years of mor=
e-or-less successful build=0A=
> system the consensus is that dune is right one and it has resulted in com=
bination with the Opam=0A=
> package manager the ecosystem to flourish. Alternatively, it would be pos=
sible to move OCaml xenstore=0A=
> to dune within the Xen tree but it would create a dependency on it.=0A=
>=0A=
> -- C=0A=
=0A=
=0A=

