Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9867475A373
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566261.884903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb8-00036E-2d; Thu, 20 Jul 2023 00:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566261.884903; Thu, 20 Jul 2023 00:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb7-0002qw-O1; Thu, 20 Jul 2023 00:32:49 +0000
Received: by outflank-mailman (input) for mailman id 566261;
 Thu, 20 Jul 2023 00:32:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMHb3-0001JI-Nt
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:32:45 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0ca61cf-2694-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 02:32:44 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JMeiBA017190
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:42 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rxgyx9k43-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:42 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7783.eurprd03.prod.outlook.com (2603:10a6:20b:407::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 00:32:34 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6588.035; Thu, 20 Jul 2023
 00:32:34 +0000
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
X-Inumbo-ID: f0ca61cf-2694-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrLH6BhKTdUsOIh5Cn8RGZLmKJzxnMZJ2Y1k3U7xK0hR/+6EhVcpd5+/b7S/0/hoSuxkCFpKGNya1eyESmKv5D0QtGAsDzWELY9bEz5JS1vj53tJojDCna8hPoYXo0ENIEMehej7N17OV+RZGeG/GKFrbeiHH54EQCzLtmvLNJMcNvYcc1wWiXRJHtVskJvHUXinbCVffT8ImAYfbLfQKvw6CYGecqSmNPksficjpHGGkrh9g5GS5c4ci7y6pi7RPVH+1q/z1FbuvjLT2vlpUOJU3MNPC4vGsYqdB5hqzGwgFCV2pYTBNbzMFKjd9FzwGcc/ejK1YV4ujbh/jd4iCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4qMyvBtfNRc4aBSfSbMUWMhpLQYprUCPRNweR/SKGA=;
 b=SmWOL6VyRR6aisYAoFC4foFiR1bUD5S00WuF63OLs1XBAdGSM7O98Q7S3nL+p5xkfQ9+kvHwZiCBmejOZa7sWJ5HckEgNPtYDYy7q9ZzzeO/ioBJJFOqIBROy4Hjo0cx/ICbd/lYLUqtkSmjLB9iKyN4qqQOy7lXX+sU8aMEJuDLf2FN2jA2Cw+lmQ6e893+/INYlJRvTCm1nV2vKVOz7EUvo2hZ5/LU8ZWy0eH4PPTwgTpFAs73j3IbyMN2mY4+0LJFhqDp1G1SDr8rv8TJ1AjZzmRU6TDvBD1/W+PhUTNhb2c3aYJkJz3sw4B6ld3mJ7CASx4iFUqiusyQ2QNz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4qMyvBtfNRc4aBSfSbMUWMhpLQYprUCPRNweR/SKGA=;
 b=N8QDd1XQw+ZnMRbWvaozaOmrAo3GbDrL1WldcZPU9USh79lRBR/7zoMbzR+rDa62/DTeW/d2eO8j8GAMgOZnr0mq+Dom27Ccnx8gDuSnx1YJpv99Y25pAHzBxpUFEAcVOCMUOM6LTOGzVThqvqh49/5ApgDliwaXmrho7QMgPUvZh7Mo5I+RudroUmR9VKAr46sBYDU555ZYTLHGY64RlsH464dTkqTVVal6FvIdejWLHH7z1bFsHDZa90CuqDhejy+qgz/khlX4lh9eWENJbDwZd4MGJ9Y008retZjeGX8+ee0fLQFb0RJ1Z+UjSFskc4lfhiVHBEcSit13Us+viw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: [PATCH v8 08/13] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v8 08/13] vpci/header: program p2m with guest BAR view
Thread-Index: AQHZuqGsvPRRGO0LlUKscysi74kMlA==
Date: Thu, 20 Jul 2023 00:32:33 +0000
Message-ID: <20230720003205.1828537-9-volodymyr_babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7783:EE_
x-ms-office365-filtering-correlation-id: e473c0ba-1993-432a-40b3-08db88b8d001
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jK/sLJLxamYos2oW3q92xo8y9iSq8/9sIruG+eYYFPU6eyu+SdVCq3Mt4RIXr7kypkzimXa5k6iCtv6/TzXiy/U6XHQoePAUmBly+pyxMBRawbZjaxMT/vyWnieebXV09nc9GcEYOz81598fUEDFzpVtCuOu05I70+v1C6+88Bg+xUlPK9zc2+Un2e57Lpt+hf22hRX+ofCL+MPYYt1ejHWFThDr7UIl+5XnZLwOOhcN6yq5zakB9x13ah2d0X5/e7qA1zqxIFilnp4IytR0MHO3QGwptJRLoijs97y1oZf8+SW2IEZoHKGnKqPHZoX81JEeblkugFk10bGN1XMFFW36n17bjaDR1YbPSH79m5Rv8wpu0MFHBVTAZIsb7KIt0mwlkSTkiHbMRmAz1w1osQ+YV/PPk3OeKpJlxZyXPV6hQcA/2hrZ53g9XaWa8ILC6RC9IPWYR0+VQLn97Mq6ANWjFDDV2rckfkHLTjFlwRwYysJMr74MgLncJqjgqGF6dXWNlsPoFT02PBwpWm0W919s+VMi9/Nks+oJ0iY+UEuii2AQhcsF1tkSDEvVycq15wy95xXqUOewi8lakadZ+qWRF+N9urjhoRcispiIq0re3Hejv5fq6BuWVe5401a0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(55236004)(26005)(1076003)(6506007)(41300700001)(316002)(83380400001)(2616005)(107886003)(186003)(6512007)(6486002)(122000001)(478600001)(66946007)(71200400001)(4326008)(64756008)(38070700005)(66556008)(76116006)(66476007)(91956017)(6916009)(38100700002)(86362001)(5660300002)(66446008)(8936002)(8676002)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ITM6ytIAruRUjzvQlxuOsyhDyFE+eaUuACsPV3X8bHVaen/Gg/3mIicHjE?=
 =?iso-8859-1?Q?wGoQU2HATLd37nk4ZDC89r5w3E1EkU+khYqu0Jvoxrbpn/5GSfF1hkXq95?=
 =?iso-8859-1?Q?UBVrNmb8zTHnH6OeNgV5FvzbPGCEfm/MNEfvKGRlfkLtZbH2irud2ZmTUr?=
 =?iso-8859-1?Q?HdkbDpjLFS/1afZRWEiw+/dsts2hYPw5qtD1VRRw7SjHrMKGvH7NoEM2EM?=
 =?iso-8859-1?Q?y1otqVb264P3I6XLgCNGRPOpwBpc+obEif8QvLrP/HXtuxIPY4RdrNka8Y?=
 =?iso-8859-1?Q?mc3SMBzYQxz2ciN3b64UkkbXuXkF3QUphLzvcJEYrnC/zfnTUDTNUK9KO5?=
 =?iso-8859-1?Q?XI9Gt4e9/Jz/QvCoVcwg8N8lgbTbBkOAdwM+wBLoRXtA4V1sSA1hVcr0z9?=
 =?iso-8859-1?Q?MoDX3OMyw9HhKqaZ38hSgJJUF4RI8gTt2B0MF3HH/on33KvXDSV/o7Ofym?=
 =?iso-8859-1?Q?D4Cp5ERjJxa3vuVtGDqYbMJOUUtP3mNLYUUfzjYwRedNQk/1fJb4UhGFw1?=
 =?iso-8859-1?Q?DjfrxZ237SQLnftI88h1sgDy0z2BGRhsQmU7poxwZ3hQDIxuOKWvmUK5v5?=
 =?iso-8859-1?Q?75LzHsqunlSYdQLjDAkn9j466D27yDRx9XXR2DC+x71xaFHkA22MdDnPVX?=
 =?iso-8859-1?Q?rsefBtfLsapthiDQavSzjFDpK3htVFsn/WuhG5vw4qgkjtKuiMyJPEU4W2?=
 =?iso-8859-1?Q?LGaBdZCY/IuGzHjRH+6VAe1MzBDKaUEChKyF3vMqNVO3HcmOlP31fBeT3D?=
 =?iso-8859-1?Q?qwJcd9Vf3ufQkPFQI7DLrzA88WlE+uYVFNSP9QE0qfmctqLqfEZXQ+tQNa?=
 =?iso-8859-1?Q?0WnBcwU4ZiOh+oMJXiWa50jrbNxRTY1zCJIvgaLyZxEg5jLbTa11pTsegb?=
 =?iso-8859-1?Q?6RzOM22B18ER6ysa3otCXej+2FcpAoPOAhFK9XLhuV9/y3zGfKLQH2V9mW?=
 =?iso-8859-1?Q?RwiT8cZ5YVI2eyCbsyvedn9kvw8bgY6G6AUlU1lU9ms2UuT4FE+dODdPe2?=
 =?iso-8859-1?Q?OM1p4WM3VsSOeJ0yhlIOjvjCACDJYsKpQxtV+k9wqk0biLdUc+4XkLVm+i?=
 =?iso-8859-1?Q?ogkWVAOxAOLKxOijeE/rOMwR+YnXC6cbMc/QbZWOq3izWWlfbBRSqOLtQv?=
 =?iso-8859-1?Q?AMrExLbb0BPzC7o3w+44t5N/1EibNX3u9fES7U8268AJHMoWROOrNY++3v?=
 =?iso-8859-1?Q?x2r1x4ljuYM1FDSmxPH5CB+HHy5ek4CFHJ6Ok1ND2hrdcUMFEhbp0kgoKQ?=
 =?iso-8859-1?Q?JBPH7WG1fjFGAvIi3dIGYB1XrfL0fWVCNFIYhuZuGNQkisVjqjKtcwRIH2?=
 =?iso-8859-1?Q?hXxBIvPtOiFigfG+jMhiNkBjw0nl/K1p7Ro3Y9arseRuvSPLbX6gKJobxg?=
 =?iso-8859-1?Q?JVSeQQoI4Vrt+ynQvh1oVgflw3u+dCn5fcnYt5gap6axfAkS1NEheVP3eM?=
 =?iso-8859-1?Q?u1HfHieKKW/da6mFlUA89/7P2HwtnKTalzJFjPu6zoQGFfqQ2zr7y1MrWC?=
 =?iso-8859-1?Q?q7WVZvYJKiR4hr4fnX1AYj1Jh00ZdA/sUDcWknqmJnK8Kl79lanevyM6pF?=
 =?iso-8859-1?Q?jTuByJWCtXqMNThX2mW06QPptUXEc3s6AWJrM4t6XZ7V/yhiENAxr5qPCV?=
 =?iso-8859-1?Q?l4W9ZkJSn40KQMXcdpgCZ5Qq5uqdRL0Pr9qY3mw0UunEnOyJt5gMe6eQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e473c0ba-1993-432a-40b3-08db88b8d001
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:32:33.2421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yeyPkEV1rHLodU8l+XJTj1Fhts+L6tlnUYju8BkhNVvqcL56MvK/COAhv9+OjINEliTl2ZQmAULxtLFuLeBzvSiPThR2XIMtZP73LxL7ETs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7783
X-Proofpoint-ORIG-GUID: 0FRUiznFJ4kRDzCYwm57OU7wA6uC2nrp
X-Proofpoint-GUID: 0FRUiznFJ4kRDzCYwm57OU7wA6uC2nrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200002

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
index eb07fa0bb2..e1a448b674 100644
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
@@ -228,6 +243,7 @@ static int __init apply_map(struct domain *d, const str=
uct pci_dev *pdev,
         if ( rangeset_is_empty(bar->mem) )
             continue;
=20
+        data.bar =3D bar;
         while ( (rc =3D rangeset_consume_ranges(bar->mem, map_range,
                                               &data)) =3D=3D -ERESTART )
         {
--=20
2.41.0

