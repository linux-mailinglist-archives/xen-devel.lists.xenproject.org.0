Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7E97C794A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616074.957872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3sA-0003cX-1I; Thu, 12 Oct 2023 22:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616074.957872; Thu, 12 Oct 2023 22:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s9-0003VC-TO; Thu, 12 Oct 2023 22:09:37 +0000
Received: by outflank-mailman (input) for mailman id 616074;
 Thu, 12 Oct 2023 22:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3s8-00016v-2F
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:36 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05e6990a-694c-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 00:09:34 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CKqPBf007501; Thu, 12 Oct 2023 22:09:32 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpr7cr8ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:31 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8758.eurprd03.prod.outlook.com (2603:10a6:20b:53e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Thu, 12 Oct
 2023 22:09:26 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:26 +0000
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
X-Inumbo-ID: 05e6990a-694c-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIVHukI6DY1jicziqQA9sKEXzCbKwJItULBXDfw44l8oTiQd5UHj30XkQKSbUTW8xg6GEHKcT8bOmQcZ8tOw+OGYaJj+ZE+01P2bvsgGRdd52Xxg2eMw0D3tH5v2KrxP0XtiCx+EWdlA1AyFXwuidafbQM/sWfebTMwkiddtFC8p60aehW40hmaQT51zolfQZtfrFBGIqFnCRIevtF9bVquTEkMuVIOp0EtlXXawbY0XBacWKTXqb4JvQP+/FBfC8nLte/Fw7d3Eo8l9ZbUvCRpHaA+G8tmQBbTOlXgtiqTBEwkAXah1K5xc4fw2mdpk2ecZ9kN/rXW7Iq5ktwZj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYZ7tRQPfqclo5BluXN3478d5t09C8GyH1jJk/ns/pQ=;
 b=KqrHHCJpc/jme8Af4CSo1RhMS+PGbY5aUbVpjnYoMiKZWpuZpGcu2f+qUq3pz+7Q2Oag2C0YM88EYBt59g+OVKUNg5UAP3Kei26k0Q6e70c7QdM29nqyZKceklaN/oNGOhtHa/sKxynqdetdbMppnQ8h+GtKnvYyRcuZgyklGh5XhUXgiyeB0S/2bWTHjapdwBs8k+cEDfn7vNwzGRIAUExvUqLrCsUx2ntkqNuVW1ADX664CbvC62mcuTW3tHLW42x1+LyhXryti8+VgZDOwiON0wzqVVCoPtCLSthqOf87vYrTvKryQJPHftm9I1I4N9uMlJF3/owqFoFNcpD3OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYZ7tRQPfqclo5BluXN3478d5t09C8GyH1jJk/ns/pQ=;
 b=A020tdTt/LnAUbUdlSAH1lxTPi/QJYGDVuOQVJanlU3vs/JZWOtpNj9qkEpjAid6Ef5RmEPZzZhV2qQG9a5tjbPO+jzVAH0raaSvqX9fAsFpcgjYUnqRMci3sH1z+u2OEJEpRnm2CZGKUQpxMapD62fwTeB2/FmxgkuFW45vPiWApvU1idW6Yh+1TNSXiQVFoRSaR1sMH06otWPzFFdjA5mgZTswSpJCQBwdT2OPvrNsyKKooIHsPqCIQZ7zhwOkPay34XF2sliyu5vbrwjn/SlqwNfHjE9kY+xHr5PlO1s1v+TrmYZcZR2YArBj++fOWTDSAySS+aJAglxljJPYgw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v10 11/17] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v10 11/17] vpci/header: program p2m with guest BAR view
Thread-Index: AQHZ/Vi+CbAsU1ux6EmeYOWm6y793A==
Date: Thu, 12 Oct 2023 22:09:17 +0000
Message-ID: <20231012220854.2736994-12-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8758:EE_
x-ms-office365-filtering-correlation-id: ba9fd60f-357f-4ec3-554a-08dbcb6fe5cb
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0GRauQs9UdBcf+2FeoY+B2HQCuG43gxyIhOjyDowXYEcNfk0hlJ/aKue/3A0HCKxM2KX+P8gnVsy/IzXt0uBLb7Fid52HoqSGQjUmQNAB4s1O1GYjeUMTfXmjykeyVZiutDTCYSHXdfoXGBMOFNYKaAwL9GQ49bkirmTfB4uDvx3dPzOPCuRS7G9VCT7wDoYn35Adg0/rmIhZNkF9Yqtv7jKRrZdeoAwFITbZZf5u5yMYLlcQnDMT4ikJ26H2LBoCs834JrNZiwiHpT8mfnURgyjk3k/9xTQpy1gFrgNbQphO5hHpDbNjxZGXLUs388Ltyb8MJM2Buo8iq8oWP/8C3O4F80qcRtuVOO4uacNTEiU4ffMfyfeMh8WOGWKFUBFm/ZMeEiMjtraVCwMiC+zqTVdhIKERnbyErX/HyvnWY4OX0lJjqJT3AFzs8yPfdo4/Rd+AN9aKvjC1/gY6FZSpYN3kojyy8D1FH0DtluWgTDC5JUgKgweUD+J141lS+VQDuVN1UK9ysqVHVYdq8E4c2KRJ2zsPVZQmBzpvt0KSOsHkKaa47jbP+6lSQSWXuxQFOFQ3KVKD1F+HVZ0vPQGAdeRZElgdL0KJ903vGArriU4WX6B8Z9k1kFPG2ic3ByK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38070700005)(6916009)(5660300002)(41300700001)(316002)(83380400001)(86362001)(122000001)(38100700002)(66446008)(71200400001)(6486002)(26005)(1076003)(2616005)(107886003)(54906003)(478600001)(76116006)(66556008)(66946007)(66476007)(64756008)(91956017)(2906002)(8936002)(8676002)(36756003)(6512007)(6666004)(55236004)(6506007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?XkdPP6w69Br1ezKwLvmKg0TNdeSoy5aeVIY8gCgMpw7OMIQ93E0OaUIvfE?=
 =?iso-8859-1?Q?fy0j68io7fpp+4Nyg+8jxZJpKuryyVBJtEhc2BHXOPGOGjnNg/gIbF6Br8?=
 =?iso-8859-1?Q?Jx+gRjU9ZiJwHB+rxit1Lt8RLcRnkAFstXOa1d87OBcoYAW46NjzAmNfLP?=
 =?iso-8859-1?Q?woHaQ+uKSZ6rDOlXJeS7qAqh31nMAKftbATSTI6eS8EUExvtaXLj2IIEbe?=
 =?iso-8859-1?Q?S8RF6aXhjcRkjlVFRco0THy9kGsDtlQ1BlBDqlRtDIlSVD5/14o/hkQFuO?=
 =?iso-8859-1?Q?MU9vU0LQvGwROWIdh6prHWTL1uZbKoyr8mU7AsS/r9eLdMY8XSY8qGI4l5?=
 =?iso-8859-1?Q?f4k+dmH2nvNZ8TF6+gaycgFL3UUCPHGzaf40i92bXYXjgQomxVxXMSxFXB?=
 =?iso-8859-1?Q?jjOcuPe5lsqT8gfmYHqEXbcl5bjPzAduuj2BHdt/3t9JnkEM0wx1MrzQn7?=
 =?iso-8859-1?Q?v5obzlFLdX2egODtVUmfeBO7/rWIzB8AEHUE569kVLhIAyrQaf6D6kRDEj?=
 =?iso-8859-1?Q?st14XlzL6gJy/nVaRkFlIaqxSuC5GidsaCXOMap9PnC2tMREeVGeW0fdPZ?=
 =?iso-8859-1?Q?s8mE/g96wfj5G29KJigv76LuFpYojL4F9BX0OU1n/NuuWGqSb245asqyd8?=
 =?iso-8859-1?Q?dFci5sLHnc7Nw/jd6Fvh9STCqs9tcvn959WXXJXdqmreM0MgeN/gzB9W9c?=
 =?iso-8859-1?Q?uM47gAcNj0AiccGswBX742b6ds6aMjk+1BA68nrt4IY1KDy44M3pu31IAe?=
 =?iso-8859-1?Q?/+zo4B5IdUHPHj2wcYmoUmrbKfwpa7vdZTTilkEMlzzyI3bBJs39i0o2D2?=
 =?iso-8859-1?Q?vWAdRQHAeKMRDc+4gErx2lKsvVSMBTkwC3zHEZOCtTGi/TGvRbZ5yMPPlT?=
 =?iso-8859-1?Q?UXmRDkCW3/usJRLmanhrUK3Qtelo2L1dRu9jCa8gB3K0UbVZs1lqw1Bnyt?=
 =?iso-8859-1?Q?V1hRgT751z0Xe2d53Ems5hXAYEi7V/pOpD+L/2PPPPkfcOWmRYObNRAkTQ?=
 =?iso-8859-1?Q?kinJ+glsIL2lwalvKBHxiHZJqYGtX1pTc0tbt53IMdob2h7jPxFCyhVFge?=
 =?iso-8859-1?Q?SP5Lt/TgmTFy8mbZp12DMCejj/0ZCwRb1SVInMwhqHMyyNldNYXb/Eqdfe?=
 =?iso-8859-1?Q?eyI/7fP2br/cHrIOD0E5dkMr3+Wn9M1nRrLVFdI3rwKyytjiJO8JfNhvda?=
 =?iso-8859-1?Q?wDteJYfkprq0+mpvDNgB2GyUeo3sU7TA4M+TfI5QZ6ukbra1JA/Hm7L/+C?=
 =?iso-8859-1?Q?0CFWlLGxtUQuJ4guuo2UJQPH0Bif7fFNmPewaV6wmuf02TIXg1bPW/KaYn?=
 =?iso-8859-1?Q?oIF1j95PvokIO7K78j3NqXL8dEvcTkZXO/iw1MfUfYyu9QJbMAdEvd25r5?=
 =?iso-8859-1?Q?mkap/zlDxdI/pYsMJ7ih3CV6Kkxc1145I3W2nABIUjiIAhK+jOqRxkQ8M+?=
 =?iso-8859-1?Q?2pX7w9qovufQ+FCAHLMr3MqAAutCZ2q9O6wGex5jUzirQXUdnwoIyLjUVe?=
 =?iso-8859-1?Q?tnYKVxlrRsediZRjsToZdNVg0ziXKY5GmEfrXeVBzQRFb8AOcG7QZdPmDU?=
 =?iso-8859-1?Q?NxuJ06Q4kjPiGvsLL82pYLklJMh/AujXjq2VBWHU/GGGKgbwjNdokCNDOy?=
 =?iso-8859-1?Q?5uzQlXSAF2mOUIU25VIGehmc5kriZNJXYH9CwmLPSrWYboKOe7azJpfw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9fd60f-357f-4ec3-554a-08dbcb6fe5cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:17.8144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rKKv0KTbESFSDGLgxlXR0Z7G/OyxDxb3d+nDK3y+WccxkgA3pS5nTkth/ud3p+ZOPJl9+LUUnOZ236JBLkfMePS82DNFzyM3gRUMEJGiyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8758
X-Proofpoint-GUID: N4wJ2Hy__vRSZRsiASKSz8UtEKzNkYHK
X-Proofpoint-ORIG-GUID: N4wJ2Hy__vRSZRsiASKSz8UtEKzNkYHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120186

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Take into account guest's BAR view and program its p2m accordingly:
gfn is guest's view of the BAR and mfn is the physical BAR value.
This way hardware domain sees physical BAR values and guest sees
emulated ones.

Hardware domain continues getting the BARs identity mapped, while for
domUs the BARs are mapped at the requested guest address without
modifying the BAR address in the device PCI config space.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
In v10:
- Moved GFN variable definition outside the loop in map_range()
- Updated printk error message in map_range()
- Now BAR address is always stored in bar->guest_addr, even for
  HW dom, this removes bunch of ugly is_hwdom() checks in modify_bars()
- vmsix_table_base() now uses .guest_addr instead of .addr
In v9:
- Extended the commit message
- Use bar->guest_addr in modify_bars
- Extended printk error message in map_range
- Moved map_data initialization so .bar can be initialized during declarati=
on
Since v5:
- remove debug print in map_range callback
- remove "identity" from the debug print
Since v4:
- moved start_{gfn|mfn} calculation into map_range
- pass vpci_bar in the map_data instead of start_{gfn|mfn}
- s/guest_addr/guest_reg
Since v3:
- updated comment (Roger)
- removed gfn_add(map->start_gfn, rc); which is wrong
- use v->domain instead of v->vpci.pdev->domain
- removed odd e.g. in comment
- s/d%d/%pd in altered code
- use gdprintk for map/unmap logs
Since v2:
- improve readability for data.start_gfn and restructure ?: construct
Since v1:
 - s/MSI/MSI-X in comments
---
 xen/drivers/vpci/header.c | 53 ++++++++++++++++++++++++++++-----------
 xen/include/xen/vpci.h    |  3 ++-
 2 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 5c056923ad..efce0bc2ae 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -33,6 +33,7 @@
=20
 struct map_data {
     struct domain *d;
+    const struct vpci_bar *bar;
     bool map;
 };
=20
@@ -40,11 +41,21 @@ static int cf_check map_range(
     unsigned long s, unsigned long e, void *data, unsigned long *c)
 {
     const struct map_data *map =3D data;
+    /* Start address of the BAR as seen by the guest. */
+    unsigned long start_gfn =3D PFN_DOWN(map->bar->guest_addr);
+    /* Physical start address of the BAR. */
+    mfn_t start_mfn =3D _mfn(PFN_DOWN(map->bar->addr));
     int rc;
=20
     for ( ; ; )
     {
         unsigned long size =3D e - s + 1;
+        /*
+         * Ranges to be mapped don't always start at the BAR start address=
, as
+         * there can be holes or partially consumed ranges. Account for th=
e
+         * offset of the current address from the BAR start.
+         */
+        mfn_t map_mfn =3D mfn_add(start_mfn, s - start_gfn);
=20
         if ( !iomem_access_permitted(map->d, s, e) )
         {
@@ -72,8 +83,8 @@ static int cf_check map_range(
          * - {un}map_mmio_regions doesn't support preemption.
          */
=20
-        rc =3D map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
-                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s))=
;
+        rc =3D map->map ? map_mmio_regions(map->d, _gfn(s), size, map_mfn)
+                      : unmap_mmio_regions(map->d, _gfn(s), size, map_mfn)=
;
         if ( rc =3D=3D 0 )
         {
             *c +=3D size;
@@ -82,8 +93,9 @@ static int cf_check map_range(
         if ( rc < 0 )
         {
             printk(XENLOG_G_WARNING
-                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
-                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
+                   "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
+                   map->map ? "" : "un", s, e, mfn_x(map_mfn),
+                   mfn_x(map_mfn) + size, map->d, rc);
             break;
         }
         ASSERT(rc < size);
@@ -162,10 +174,6 @@ static void modify_decoding(const struct pci_dev *pdev=
, uint16_t cmd,
 bool vpci_process_pending(struct vcpu *v)
 {
     struct pci_dev *pdev =3D v->vpci.pdev;
-    struct map_data data =3D {
-        .d =3D v->domain,
-        .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
-    };
     struct vpci_header *header =3D NULL;
     unsigned int i;
=20
@@ -184,6 +192,11 @@ bool vpci_process_pending(struct vcpu *v)
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
+        struct map_data data =3D {
+            .d =3D v->domain,
+            .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
+            .bar =3D bar,
+        };
         int rc;
=20
         if ( rangeset_is_empty(bar->mem) )
@@ -234,7 +247,6 @@ bool vpci_process_pending(struct vcpu *v)
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
                             uint16_t cmd)
 {
-    struct map_data data =3D { .d =3D d, .map =3D true };
     struct vpci_header *header =3D &pdev->vpci->header;
     int rc =3D 0;
     unsigned int i;
@@ -244,6 +256,7 @@ static int __init apply_map(struct domain *d, const str=
uct pci_dev *pdev,
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
+        struct map_data data =3D { .d =3D d, .map =3D true, .bar =3D bar }=
;
=20
         if ( rangeset_is_empty(bar->mem) )
             continue;
@@ -311,12 +324,16 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
      * First fill the rangesets with the BAR of this device or with the RO=
M
      * BAR only, depending on whether the guest is toggling the memory dec=
ode
      * bit of the command register, or the enable bit of the ROM BAR regis=
ter.
+     *
+     * For non-hardware domain we use guest physical addresses.
      */
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
         unsigned long start =3D PFN_DOWN(bar->addr);
         unsigned long end =3D PFN_DOWN(bar->addr + bar->size - 1);
+        unsigned long start_guest =3D PFN_DOWN(bar->guest_addr);
+        unsigned long end_guest =3D PFN_DOWN(bar->guest_addr + bar->size -=
 1);
=20
         if ( !bar->mem )
             continue;
@@ -336,11 +353,11 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
             continue;
         }
=20
-        rc =3D rangeset_add_range(bar->mem, start, end);
+        rc =3D rangeset_add_range(bar->mem, start_guest, end_guest);
         if ( rc )
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
-                   start, end, rc);
+                   start_guest, end_guest, rc);
             return rc;
         }
=20
@@ -357,7 +374,7 @@ static int modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
             {
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove overlapping range [%lx, %lx]=
: %d\n",
-                        &pdev->sbdf, start, end, rc);
+                        &pdev->sbdf, start_guest, end_guest, rc);
                 return rc;
             }
         }
@@ -425,8 +442,8 @@ static int modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
             for ( i =3D 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
             {
                 const struct vpci_bar *remote_bar =3D &tmp->vpci->header.b=
ars[i];
-                unsigned long start =3D PFN_DOWN(remote_bar->addr);
-                unsigned long end =3D PFN_DOWN(remote_bar->addr +
+                unsigned long start =3D PFN_DOWN(remote_bar->guest_addr);
+                unsigned long end =3D PFN_DOWN(remote_bar->guest_addr +
                                              remote_bar->size - 1);
=20
                 if ( !remote_bar->enabled )
@@ -511,6 +528,8 @@ static void cf_check bar_write(
     struct vpci_bar *bar =3D data;
     bool hi =3D false;
=20
+    ASSERT(is_hardware_domain(pdev->domain));
+
     if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
     {
         ASSERT(reg > PCI_BASE_ADDRESS_0);
@@ -541,6 +560,10 @@ static void cf_check bar_write(
      */
     bar->addr &=3D ~(0xffffffffULL << (hi ? 32 : 0));
     bar->addr |=3D (uint64_t)val << (hi ? 32 : 0);
+    /*
+     * Update guest address as well, so hardware domain sees BAR identity =
mapped
+     */
+    bar->guest_addr =3D bar->addr;
=20
     /* Make sure Xen writes back the same value for the BAR RO bits. */
     if ( !hi )
@@ -791,6 +814,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
         }
=20
         bars[i].addr =3D addr;
+        bars[i].guest_addr =3D addr;
         bars[i].size =3D size;
         bars[i].prefetchable =3D val & PCI_BASE_ADDRESS_MEM_PREFETCH;
=20
@@ -813,6 +837,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
             rom->type =3D VPCI_BAR_ROM;
             rom->size =3D size;
             rom->addr =3D addr;
+            rom->guest_addr =3D addr;
             header->rom_enabled =3D pci_conf_read32(pdev->sbdf, rom_reg) &
                                   PCI_ROM_ADDRESS_ENABLE;
=20
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 18a0eca3da..c5301e284f 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -196,7 +196,8 @@ int vpci_msix_arch_print(const struct vpci_msix *msix);
  */
 static inline paddr_t vmsix_table_base(const struct vpci *vpci, unsigned i=
nt nr)
 {
-    return vpci->header.bars[vpci->msix->tables[nr] & PCI_MSIX_BIRMASK].ad=
dr;
+    return
+        vpci->header.bars[vpci->msix->tables[nr] & PCI_MSIX_BIRMASK].guest=
_addr;
 }
=20
 static inline paddr_t vmsix_table_addr(const struct vpci *vpci, unsigned i=
nt nr)
--=20
2.42.0

