Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F499BDFF8
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 09:06:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830598.1245656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8b2g-0002MU-9z; Wed, 06 Nov 2024 08:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830598.1245656; Wed, 06 Nov 2024 08:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8b2g-0002Ke-58; Wed, 06 Nov 2024 08:05:30 +0000
Received: by outflank-mailman (input) for mailman id 830598;
 Wed, 06 Nov 2024 08:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lQG8=SB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1t8b2e-0002KX-Jw
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 08:05:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2613::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df8ddcb7-9c15-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 09:05:23 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DBAPR03MB6392.eurprd03.prod.outlook.com
 (2603:10a6:10:192::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 08:05:20 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%6]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 08:05:19 +0000
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
X-Inumbo-ID: df8ddcb7-9c15-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjA1IiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImRmOGRkY2I3LTljMTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODgwMzIzLjUyMzg0OSwic2VuZGVyIjoibXlreXRhX3BvdHVyYWlAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ap00gm3mPYT9snOiWYVhUFaatO7l4FNowGNkOLER71OeihbI5nqtHSVaddIB63Fgi7+/eoODMx9451XefuQ5J7CkpUM43c/inP6bXGrxviB4+2REUXNGK6HwvV6ICYiIMfjjANyj4PwNfJ2ttorcenWe9kIZj2BEGm/ElZzN112pshJXMMh5HhMp3F3HwA7nWstx7MQbWGuU5KqqBW9XK8Y+Z1mZJLpiLs9ecbdvmK2QaGAhS2XBlNOTctszySyZ1saBtlAlCMtkHD30HcrRjok4BuWLOg5SZCKOIoK9uuqhYBGBpjxxS5UvlGcXNepqenyIYC/3AB5rOkmA4fZftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pn7wSdWlSZGzjxlyLqWviHvXcweDVYrt/uwijGWzxoY=;
 b=vQycoSpeTCT9hVW0yvThGLjuYCQOzNTVtkREeErYCroewT9Zfj7LBC016fUYGI5FmNyU9uYvQJap5ew4xk1Cox/4Pv2QW0gUAmeExBf0dO9+mHczVcThJpKzQecFdoMf/5p4sArK9uB0PPCRj77qdTJqbvw6JJDwRUYhDrs/VVTi0Na8ez1GyJ7yr8IB5W6Z10wC5vhKW5K9nnzFGBn2toGiQvPT0+SpwkRAudUBE0m8WsT3SHbfO56pH74/uzQy3SB9FrK3cY9iRtXQNxocoXFC5WcouQJtR25UBACDTIy5rRhYYlE0Sb3aXotv0KTNjI1kBWznCiI570kBgKJ1ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pn7wSdWlSZGzjxlyLqWviHvXcweDVYrt/uwijGWzxoY=;
 b=DnpEM8qayArSNIuAlpQa3RQcoaigbNJjFlAib8/8Pd7NJcS1hOk8EDbcpNvjjBWvl3LhoCtowrLBWaUJJ28KNPiJwDF+Mg322EuFUHtTmXsJ9GSOa3hKRlfR0vFPmoxXxntkwJlXvdNsknCFrAGP1kR6AbpNfBdFED4qgpN+oivXKWMOj8s7/K7C7I48zWNATq2o15xzcZ2oNLTVT6Rtv6eyp5gIkR5MKjCu4RPjk8AyOFbI3U9CT576XCfGauLjR/4y2M4AxzwryfT4y4pAENdJtKbRvPtmA2G0DQw2eNYDTRNP/jIb9zhjIj89K1eecLfzXT7Am2BaWpMHszMSjg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] xen/vpci: Fix UB in mask_write
Thread-Topic: [XEN PATCH] xen/vpci: Fix UB in mask_write
Thread-Index: AQHbMCKf4QVge+H9k02dX4ZlwzpGqA==
Date: Wed, 6 Nov 2024 08:05:19 +0000
Message-ID:
 <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DBAPR03MB6392:EE_
x-ms-office365-filtering-correlation-id: 4bd54490-b9b6-41b5-03fc-08dcfe39c1d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/9ruNTZZFrF5oXayaD81E5yJPHAg+DW5oqI1L8l0+dIdNx50ByMyXjOZpb?=
 =?iso-8859-1?Q?DqnATnEkrjVcjzmhP11OO6PNAubLcXyABjrNiuZMXUCE8MBSCDTbYF6Moj?=
 =?iso-8859-1?Q?Sk2KEPv64d9Dq0eCnWPl+J/M6ovissRh+p7jxcBKIVE4feB1cncM8DdLI2?=
 =?iso-8859-1?Q?Rd5qWqc+yLe5c/tcik4RgXKcIqapfJ3kwo4c05Rx41lKtK4Dk6UdsxLAd2?=
 =?iso-8859-1?Q?ScsJwc8W5TSJfCDGClPGIj+WD039FJq+xp0y8Ji+nak1jVWY+Gs+horX6c?=
 =?iso-8859-1?Q?Kja1h0307LRlC+i9pfgOpGX8jqXrNxXtrYhLLvwM4FLQUi7DYR5bvz3uwU?=
 =?iso-8859-1?Q?kjs8Fl55vDIAAw91WMy4o5UkWUvhyADByBj/fdnuRBI/RdI6Onso/lzoax?=
 =?iso-8859-1?Q?V/t3lH8lNXbOcao7qjSB57sa5RiPsXv//AYwuV36qHYlNItVoCenDHRYQX?=
 =?iso-8859-1?Q?/icsTQPIh+SWHYSdH4HcRhln/A1T5vzEwPZTHwMzjzol0tddAhEjMJ1E+V?=
 =?iso-8859-1?Q?lOngitMJJKZqB8TFxCOryAsn9bxhvtFvajhL8cjUmm4hJZeFm1KWL9aP6L?=
 =?iso-8859-1?Q?Z8C8Xy5sONKyY9o/T92sh+NTJ4rd4eYh2W31J8W5Gp/OKgU8L/W7EwSmZH?=
 =?iso-8859-1?Q?1wvq68PCwsAfgomxMMnMyBBhX7sVIIE3G9WyB3pNdRrvUsT7Zn/BOHGLyt?=
 =?iso-8859-1?Q?xkiqTgFFy+bRqDxtbY7CmduiKj4tuhDIUnN0HDkgtTVpnT2CnjRjuHwI9H?=
 =?iso-8859-1?Q?BJjFMUQZjHkGQLRTDuZwxKL1M4imyoYp0ua4S5E0FU5HA1XHxW2kwKzrR7?=
 =?iso-8859-1?Q?rQIxJPDSGANv+pOqN8r7kdx5Vab2Cr3O+slpMK2L5CHexJ8MBPrclqQ63C?=
 =?iso-8859-1?Q?caOuQAjvvqhIlva1Z/NPEERe4bVxpkCkUlt6Vo71oVAA7NSO01tIAamvuh?=
 =?iso-8859-1?Q?608OwL27j99Bfnnj+sDefQRSUwrhFtHTp7CQ8GEBC4wCFnEDTadnm6r8D4?=
 =?iso-8859-1?Q?3FKekU/u1f4ivomDMYyzEn+myxpKfso/0RFmuqZUbkw6LpmIBA3DL28eH7?=
 =?iso-8859-1?Q?EENVeRTq+OCY6OzCgYBIL1pS/UUKyZ/aJl+je9HF10L7JknYD5PGVM2bfD?=
 =?iso-8859-1?Q?V0iTM9MRfnWPuvuy4vbFIsFjY/tps8i8+jQCahg8GnNewc7D4A7740+ejA?=
 =?iso-8859-1?Q?gPaCqW6Rrj57ywLGf2DyBnBep25rSX+DIubQPXlao6xtpsTlmI6ibgw5v1?=
 =?iso-8859-1?Q?Q+RBJgiLEIy8bnV2IG6qpP/IzYpANkzubj56DPME//SCW+vZe7jyUDyIPH?=
 =?iso-8859-1?Q?sLps3AXe1Qu1WwEMqLIieEg4i4+eMk+u1fuYML01/oalYqbL+0Rpr2fVqr?=
 =?iso-8859-1?Q?22hWmQQkEe+0F6ZLGS0qK39hngwciwPhAlCjzrfnr+0N+rEirV9ro=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+YRCoEDfla31ikfxBKZ5aR3BNEH/Nl/YVSXVHErzp9k6wKkae7MBDvqW2f?=
 =?iso-8859-1?Q?GHsANpUl2l2oCt7RGN5x+7EN0xRTeuSNQsCUgNNf23etTOnmGh5gOiWG4h?=
 =?iso-8859-1?Q?7TUAlf1tABdP7SG3SzCv6WLACwXGFxgzclEEpa04r3/2nntN7l8GXC61c7?=
 =?iso-8859-1?Q?/XmGMIIDd1PvRupZ49nExAMpyeP++3vn1KDOCNSkNVutyQfb/uUxG2TU9y?=
 =?iso-8859-1?Q?vur7FEbVKvVqJhy8GP2DcPFXFJ6oBlD8ZmPtoA5Q/vm+wNZ2WvtXv8BzlU?=
 =?iso-8859-1?Q?Ab1ZKj8PHW9jq+po5HjZy9+JDWxPMVaBZkPq6oRGoGzAqs79+NKrxj8umJ?=
 =?iso-8859-1?Q?NbIEJa8za/iVg9QHD0KGPbGdAwujVRMrkQ4XiDlw59y5TH3gRl2VfT+GMX?=
 =?iso-8859-1?Q?ih/ofHKC2xIxVRFyfbZ75+ZY3dI+Cz16l8fDBBH9mZgT7n91oLI0A9QkzE?=
 =?iso-8859-1?Q?pBfIm6FxlGKmygLukYH8fGw7k7PfP73WXEdayuEM768ITe4iAhbU0njBWy?=
 =?iso-8859-1?Q?HJns3bHmtCVkvcCLQugK+aQ/gUplO6uUfR32Bf+RH4txCdj1aWMqB3uyJw?=
 =?iso-8859-1?Q?VHa6x9Tn76vOcGXGA9AQfBE/BSmzNilYQd/+TqhIz10XGkpIf9N3hopWpe?=
 =?iso-8859-1?Q?F/Wa8+03bgU/pUhV3nw22h6+dsH5f1D/RsuFiL94UC3TqTFvoSA+yxukzb?=
 =?iso-8859-1?Q?FdLONpMm/70Fj6kS3IPVFU/XWLrmj5BYbK8oDnaQQ1yf+I361wDwi9tdWF?=
 =?iso-8859-1?Q?7JL4UqsU9xf4gBASuZfy3zjUVXHcJbQCR+FFBY6bGi/gGQ6i82GumjqUTy?=
 =?iso-8859-1?Q?7VBwJ0PT5eFQ0jIYC4uVErZpkh+gJ8geDvB3wXmnipbucbzrSYAdzhQt6L?=
 =?iso-8859-1?Q?nQy7F5DMD1F90bX/5/HTKGcnPtGG63piNGXFoxgiLVD8fHAjgTpgI7lzTp?=
 =?iso-8859-1?Q?fFyc7tENoFsY71ChiuwJ7BKGC5Dw0qDvDNRkN1+3D6zc1QPJ5EmiUWlIFL?=
 =?iso-8859-1?Q?GhWefFm2EClk05Lnbll2H9HhDnD3LOuC0lFg4jE23FMWUdU//vZpeujA5c?=
 =?iso-8859-1?Q?AHNfYlI6NOtQfreP4vcYnbSu55l2CFH8qAtJg1xU4ZYrsQJnnL/rsdp7rX?=
 =?iso-8859-1?Q?7+MKlZgRd5+JoFWSwgMbqWqll+1N1YvgvzHDip/s+t9jCgcvSaYWOEFcpS?=
 =?iso-8859-1?Q?/klu3NpsX51UeK+0GJYfXY+6MjWFiLQ0Bz/xVaB2GqsYoIqBbPz1NEQTSb?=
 =?iso-8859-1?Q?ATKsRRiqPL+IQieFcxDVzHq36s71EUJIq9NyrbIlg97NrPwiqaIrO6cp5K?=
 =?iso-8859-1?Q?IOEddEIWgjaRO18Tdzk+Qw/fe00ZRDNSm8igooHAWn37XVr3/2DNIVAZXQ?=
 =?iso-8859-1?Q?9i/84K2ngHnjImTz4JF4IB3+IrljAk3iTqSdzCVNNu0Lqyc+zY6r0yQOhX?=
 =?iso-8859-1?Q?1S338J/ui0MrSZw1AixohwNv3alrLn2FSjN7ZzasT9vNtmR5x/mFnwo89U?=
 =?iso-8859-1?Q?GGnUCcbNBcePdZqDF3PA3MmaayrHjZ3ay0SVdIIoLxorq9EM5pk2pMwnzv?=
 =?iso-8859-1?Q?a9jyukgsBow1W0c5DMqHQVOKCRdb25Gr51utELWQndVGzdZKmvF3fr640S?=
 =?iso-8859-1?Q?GwTsil+aVuWq6FsieuFv9yymt8dr4WMkXzT09dzA379uuUAkrM9nhLFg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd54490-b9b6-41b5-03fc-08dcfe39c1d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 08:05:19.8212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AdXTMO7xQ+RXl/b10ch7gf9QFcvHev3tZwBgqVXgLLw7+YRZ+ZbjN+kSiUllxszbNutTeldAkXA/TYNAWfApSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6392

During the construction of dmask value, it gets shifted by
(32 - msi->vectors) bits. If msi->vectors is 0, the result of the shift
becomes undefined due to shifting by a size of the type. While this
works fine on x86, on ARM the resulting mask becomes 0xFFFFFFFF, which
is incorrect.

Fix this by adding an explicit check for msi->vectors =3D=3D 0.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/drivers/vpci/msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 7bda47e7fc..787296fd42 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -172,7 +172,7 @@ static void cf_check mask_write(
     struct vpci_msi *msi =3D data;
     uint32_t dmask =3D msi->mask ^ val;
=20
-    if ( !dmask )
+    if ( !dmask || msi->vectors =3D=3D 0 )
         return;
=20
     if ( msi->enabled )
--=20
2.34.1

