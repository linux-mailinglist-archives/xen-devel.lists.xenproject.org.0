Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2BA72DF90
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547997.855714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KM-0001rk-SU; Tue, 13 Jun 2023 10:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547997.855714; Tue, 13 Jun 2023 10:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KM-0001mW-PM; Tue, 13 Jun 2023 10:32:42 +0000
Received: by outflank-mailman (input) for mailman id 547997;
 Tue, 13 Jun 2023 10:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aRu4=CB=epam.com=prvs=05285d8c61=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1q91KK-0001im-Tp
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:32:41 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e6e6cd6-09d5-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:32:39 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 35DAO5Kd019280;
 Tue, 13 Jun 2023 10:32:37 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3r5yahmgn9-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 10:32:37 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB9706.eurprd03.prod.outlook.com (2603:10a6:10:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 10:32:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51%5]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:32:32 +0000
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
X-Inumbo-ID: 9e6e6cd6-09d5-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7gK6EtpgRxLd4ra5bZalEvFz+1OiQoKhMsz1xt59QtINXG5B/56icHyCzU51QgmAzLKspnqkXNFO86AA8tC/aZFd53EhYUD0zxmWCEhmmrcmDpoaKDwSBqW6NVt745VG9rya1dvg+VSDEn9z3toRmHiO/4Gr6uutpqQcMVJRWhakyj2FGi2xuZl40vWZKOql5OLYWrt/MPjSBIQTrGHbh5xxgVrDNkv/IgwW/85VUK/yQVqwgTH1ZjQTLJDspDC0wFIrwvRFCnxukoLa4oKnYLC4kO9xJXkaXR2gtuHl1C/PKREsuZhnDCq0UypB6RKlw7/9Kgb5hK6wDswDRrylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNyh7b3z00o9nb1EZGxIuBRmA/qLfWrnIQKWvheJ33w=;
 b=Ujx1eTytwFJoH7aMBEAv9ur4TUhUHlygmjX1bcqps7qDGR+Oi+foSBaLGqpyxImfxs+QGGgvYUPWpzm7Pqs6pW44v6Y9UHx+jyUEJ2towLOXnj2lvll891lShUOfsOr9cXk85paGb9hAFF7LuncQHIhupHrJhcgxiUI80dSH4KZP5FALH2iwAnvC0ohR2uSbsRnRd4p30gIlFbTF4XU063p+1ZN/RJqRXTeprRAFhVVAOQV6fdCXBkyvd20eFD4iS1gZorFeIzaStQZJivqP2IMVyyP+Wdw7qooX+FttcYwFnpHpcpSSNdgPvHTCOfN6xjO55JMYA298Xi5KYplDgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNyh7b3z00o9nb1EZGxIuBRmA/qLfWrnIQKWvheJ33w=;
 b=kiBq2YIPOA3t9OnlWZXMNQiajs4UAR+UpQkncmIw3ewQyp9ILYwsAWBmoBvSdADJ2z5pY3XncWH6G6zw6TpK4xVdkfgnUD0iOKfwxmtre6lApPDRNBvYvskKMFHfkBLjbCB5+4AZeVXBRfVMLBHVQCf4OP72GlAIUgrCWj7OKo6lDBWZ4AioTeNErOUYitV60dOXX9nKSCTmUfVP7wQx1x/TyfpCviXKPG3nzEO1ZZPE6bGCI0ie64qWUntYaL1LemqXenNwO6iRgJCISpvwTSKi3tK+LpM50nRXQRPxHtMIKfAxaPXTQcDSxltIPEDebl4mSK3icE0A2otffYqMFg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v7 07/12] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v7 07/12] vpci/header: program p2m with guest BAR view
Thread-Index: AQHZneJan/HM4MlRFEiYjDr8BhS2ig==
Date: Tue, 13 Jun 2023 10:32:28 +0000
Message-ID: <20230613103159.524763-8-volodymyr_babchuk@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.40.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB9706:EE_
x-ms-office365-filtering-correlation-id: 90024425-b506-425a-cabb-08db6bf97f2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uvx9GSZZau2vgf24paxZHo59i6GQzkHP4nPJGGLZp6oC5+isR+8MWv9GicryXxl9QBjrF/eYBR/U+CIPl2cj04p3ocZubZIjUzUBp6WX9Xs6imcoaZSFkzOYwknkMa7gBUTprgT2Cq5UZor17DBNigmMR8Ko8Ra+lI9tMAEwApcVdf3Hv8vkAOOqszYPQHIqp+kCnfgdCjVegBVgdtDhCl2cghoCgALXLAXiSfQ5KQRqju/sVxX+t6phMun2ra+PxBWO6E3jUtDFSFenyRGARskF9usxJ0MOVTPlTXDRmDjdQpHsMDIdEWasyoQb3fiNuCCp3c+RYc/SyT7J0osgi/5YJEESCo1+g6BevYabNLEQCzTedmPkoHcSJEmnRHcAAV6eUBtMzZK8BhgLsWhmhxYoFmOgWG0pGgXI2bQC75mzwQ3M91tDEroWGTEsXHX8PGkXikciRLyyuH6wIqSXByeTCuMU/aEm4d3ThoXsSA1wz0/BpOrGMONmGV7uOj9Jefw7OcolBAaHKTaloGDCAFnNsv+00rAK5yzisDXwVzh9XWQGYcWPZcfX4r39eIY9GNRc0xRcGYgQ6EYF68gvjqDT1Q+N0maI6b5sOM5aNsn/CJPK3exM5opZT1/phz5c
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(91956017)(64756008)(76116006)(66556008)(66446008)(4326008)(6916009)(66476007)(71200400001)(5660300002)(66946007)(41300700001)(8936002)(8676002)(316002)(36756003)(54906003)(83380400001)(478600001)(2906002)(6486002)(38100700002)(6666004)(186003)(6506007)(26005)(1076003)(6512007)(86362001)(55236004)(38070700005)(2616005)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3feZgc9oqmxnSad3oHdp5jZ+tBpdYqzkAbckadCMpUfaLB3tn0jPsmINqs?=
 =?iso-8859-1?Q?GJDOmERe3GMyFoI8ZSXCE8S4lCOggvwGpLNbUST4nEQP+Tl7CoFEDsQLiA?=
 =?iso-8859-1?Q?YI8EJeJI2myspF0vtOBh9YVS29c48jKU3MUPofoLsW6XtyMMUWXWTrqo8P?=
 =?iso-8859-1?Q?oiRgGR3Liyz7kOoZZRNzJYFWHxhUC8ojm8XqltYc1eL4ytzRwE4SfVMBWA?=
 =?iso-8859-1?Q?Hra6XwW8YYSJmh+XhWdH4iVLDPi7hQ40jgjFAjSAiGmj3a+Z9m5wYEWb7m?=
 =?iso-8859-1?Q?BVfalbVi3q9U95InVKDaNLVagb1Z4upjRjRbHJMnVWgjCOxRduv5yFtHzT?=
 =?iso-8859-1?Q?oiuPJjDO9bFb/99ofWDtRTfyah5jt/MzQ9Mil83OEm/NCnRCGdI7vMR6E4?=
 =?iso-8859-1?Q?5J5SP0JHSmm9qXnqNgdmKYhmNKxQH8MBX8fiZD/NFYIaBc3Dj+z1+Aw1wv?=
 =?iso-8859-1?Q?ESJGdWWXtnUx/vi/LG1L6bqMzaAqvve3euwnMpF7aj/zXGJgGqH18x84Zu?=
 =?iso-8859-1?Q?1fmbem5M8ehskOPEaLsooYEc5lHyBlIL3TS9tZ/X3cmwkhUUtJ4TQOdL4Y?=
 =?iso-8859-1?Q?6CiV2X08MWaGvpMFJIhfJl/I3gAuNLi1WSM0iCBBWdv9U6L7mLymh8pGGm?=
 =?iso-8859-1?Q?en3qXaTbBf+nAWqIcFx/7+84/NkyiYLC3t4KuKDhchq2L72mJVUGUImObr?=
 =?iso-8859-1?Q?32NB3jPrLwdvp00TTt7DeM5fT+EBHc8one5Lm3oVq8RsGvjkI1o2eyOfAP?=
 =?iso-8859-1?Q?B+89Bm/nRPJmecPYep7ncsa7C5lgEpGXpj9gEJPjRur6i9a7OH+gqczMLH?=
 =?iso-8859-1?Q?TWYW+iH3jq++6IA3BJIRPe9RaSatRKi7aPj9Eq2FgGz6xe98WWMjxXokMy?=
 =?iso-8859-1?Q?JbSX0aXjHrMAEFTK0GvEQock1HZu4rOQR2bcOby96D1fUvxpBe7sqxXupW?=
 =?iso-8859-1?Q?ADYNKp6p8GgWpq44s2Ba3QRZ/0P4rqjJzrwfkQ8+wlRXJD+n7WSmyKKA5h?=
 =?iso-8859-1?Q?4VbDmNwH63fZ3z2BaYbbETlBhMjWZN/dmwYz4G8a69FcRv1jhoi53pFuBt?=
 =?iso-8859-1?Q?MH8RIBLkxqnRD68CiR+2Xx/wtI77Rdk20oUgjrAtnEhBg7VKkFNq5uL6lC?=
 =?iso-8859-1?Q?BqL2JeWlEFFVSgxZhsQ+xCZdjEDD+KVjYPDa00BlZD+6kcU9dKLftlJ7ve?=
 =?iso-8859-1?Q?kDuZTXUaRbg5CmyLAGSy8tcFqlxkWzesAjwYCxk5l94HdrGSOBCqHUT50v?=
 =?iso-8859-1?Q?+DURlN16Uu/9AQWQXAZaGMvlJHY7sXSgaMXUbPs9Fi4mmgVpe0lSwITrnz?=
 =?iso-8859-1?Q?1XecXvJ/8nOTAoqBM+bUY71EjWPTujMpCYXKHlq+m+kbaygs/dX8RuCJMX?=
 =?iso-8859-1?Q?ypC/pwYl9M7la11Dpsoo7RkyTJ49mpHAFu8iYCL0RSvW+psVl5U+r9CkV6?=
 =?iso-8859-1?Q?2jqQouPO6J9YnrZgp9w2KqeXR6FEtBcwuJts9Vevlo8ZMhYyu20oVm9kzT?=
 =?iso-8859-1?Q?3yfw6nfgNpsWuiE0PUfBegF3uCH3J0lBUyXCZrkL19KexSP6QmHefWQrtZ?=
 =?iso-8859-1?Q?LVUn2lgt6eK1ugMy47ZdiDYvdnaBEly5IjYedXlDbVQ3Bdnf1lNsccav9j?=
 =?iso-8859-1?Q?5NO4AY6OhnB4NiA3TAH6Fz2knbzWIgy2R1W4+7JQW8bnjOgvGicr2XPg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90024425-b506-425a-cabb-08db6bf97f2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:32:28.7428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E6Ax67teC/MtbBieUF9pH4vkD1EiGib29MvIzFW4ufY49Lm9zOfOcJIReZwCBuM0tWX5xWLKmYVr3g8apky/b3N935lhZ7L5Po3qEd4DULo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9706
X-Proofpoint-GUID: kKPw5AViXivcgLUhkDPKgHMjM4MBYCo7
X-Proofpoint-ORIG-GUID: kKPw5AViXivcgLUhkDPKgHMjM4MBYCo7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306130093

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Take into account guest's BAR view and program its p2m accordingly:
gfn is guest's view of the BAR and mfn is the physical BAR value as set
up by the PCI bus driver in the hardware domain.
This way hardware domain sees physical BAR values and guest sees
emulated ones.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
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
 xen/drivers/vpci/header.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 8e722857d6..0524fbd220 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -30,6 +30,7 @@
=20
 struct map_data {
     struct domain *d;
+    const struct vpci_bar *bar;
     bool map;
 };
=20
@@ -41,8 +42,21 @@ static int cf_check map_range(
=20
     for ( ; ; )
     {
+        /* Start address of the BAR as seen by the guest. */
+        gfn_t start_gfn =3D _gfn(PFN_DOWN(is_hardware_domain(map->d)
+                                        ? map->bar->addr
+                                        : map->bar->guest_reg));
+        /* Physical start address of the BAR. */
+        mfn_t start_mfn =3D _mfn(PFN_DOWN(map->bar->addr));
         unsigned long size =3D e - s + 1;
=20
+        /*
+         * Ranges to be mapped don't always start at the BAR start address=
, as
+         * there can be holes or partially consumed ranges. Account for th=
e
+         * offset of the current address from the BAR start.
+         */
+        start_gfn =3D gfn_add(start_gfn, s - mfn_x(start_mfn));
+
         /*
          * ARM TODOs:
          * - On ARM whether the memory is prefetchable or not should be pa=
ssed
@@ -52,8 +66,8 @@ static int cf_check map_range(
          * - {un}map_mmio_regions doesn't support preemption.
          */
=20
-        rc =3D map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
-                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s))=
;
+        rc =3D map->map ? map_mmio_regions(map->d, start_gfn, size, _mfn(s=
))
+                      : unmap_mmio_regions(map->d, start_gfn, size, _mfn(s=
));
         if ( rc =3D=3D 0 )
         {
             *c +=3D size;
@@ -62,8 +76,8 @@ static int cf_check map_range(
         if ( rc < 0 )
         {
             printk(XENLOG_G_WARNING
-                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
-                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
+                   "Failed to %smap [%lx, %lx] for %pd: %d\n",
+                   map->map ? "" : "un", s, e, map->d, rc);
             break;
         }
         ASSERT(rc < size);
@@ -165,6 +179,7 @@ bool vpci_process_pending(struct vcpu *v)
             if ( rangeset_is_empty(bar->mem) )
                 continue;
=20
+            data.bar =3D bar;
             rc =3D rangeset_consume_ranges(bar->mem, map_range, &data);
=20
             if ( rc =3D=3D -ERESTART )
@@ -224,6 +239,7 @@ static int __init apply_map(struct domain *d, const str=
uct pci_dev *pdev,
         if ( rangeset_is_empty(bar->mem) )
             continue;
=20
+        data.bar =3D bar;
         while ( (rc =3D rangeset_consume_ranges(bar->mem, map_range,
                                               &data)) =3D=3D -ERESTART )
         {
--=20
2.40.1

