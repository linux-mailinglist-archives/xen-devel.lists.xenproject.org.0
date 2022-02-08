Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1974AD64B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 12:24:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268217.462008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHObT-0004fI-Du; Tue, 08 Feb 2022 11:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268217.462008; Tue, 08 Feb 2022 11:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHObT-0004cg-Aj; Tue, 08 Feb 2022 11:24:11 +0000
Received: by outflank-mailman (input) for mailman id 268217;
 Tue, 08 Feb 2022 11:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kNDV=SX=epam.com=prvs=4038445554=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1nHObS-0004ca-7s
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 11:24:10 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0d4b2f0-88d1-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 12:24:08 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218BNfSe008589;
 Tue, 8 Feb 2022 11:23:59 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3qkv801c-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 11:23:59 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PR2PR03MB5292.eurprd03.prod.outlook.com (2603:10a6:101:1b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 11:23:55 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::9025:6fcc:a1c:eb26]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::9025:6fcc:a1c:eb26%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 11:23:55 +0000
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
X-Inumbo-ID: a0d4b2f0-88d1-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NO1nHYU5Shh3YqrtMThoWiR8p6PVMhfH6IQgW5KzlwAyJeF/3eCkCocXaZoHYzNUGbYshJfLPKK+Fxr48q2i+jQAmSTnAhcKyPPcB6r3lD5IfUh4+4Jd7AEN9USmevdgwzEe+UoS8R9a9Fh1DJJ5QyLiJxddqE0gNgLA+lZwWIpt0bPfv8MKs01sIxGly5/BEXjMRaZDnkJ6xQujtfLenDjbd7FOex+MuZsrDtNVDIFeNFI1pyyrNq5kzx5jsrI95daWvLs8z5hVh3k2yhTxB6f2ZwQ0siG8Ho20JbeGL8pY1/x/Sgvz5bM/ZTRO6RzrTtvcljM6bB1km5Z5bItU6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mry2wGJogdUgfwuOoSU5+mvvtEAqCj4dHvaLR3FDZI=;
 b=EsmD33/PzCP3My/U4QOxJXHuODRC3UBE4Io9qmi+URD/074yieOixiJ9MvPobGhjO4/wQhJ2dZQxfKmFpxWS3TExhOWJuxYQWaFrGLVPbBOGauhMdW/3ScRqzTKdvtUqjcIdrOFSSE6J84JZvWgQfO1MDnsVbIX5g8VuXU7qDpXjNhvc7AQKEeFTYwzG8VEAcvPkdhbGydxur51Uv9sdi6S1sOq08vDzzWBfsuAMZjKCHWwV1mjoqXTIAN2cYkPVSb0KOGxZUmbqn8lLGrVjkZZqjQuxb989MY+kBUxku52qoQ2kPfxnwlJJady7Ki2TbZHeicBSL3Iqgn5nzFsJVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mry2wGJogdUgfwuOoSU5+mvvtEAqCj4dHvaLR3FDZI=;
 b=VwcjpxxuCsf7AREb50M2L5/GYhJrwYNj74iz/00o1dTpQGC0z384HV/9u3YUj7rnZAeaNE+m0JtS4Uy+sK6d05alfZtouyH7NkFKGP81EZZ/c97AWESscTKxkpmhWZNeQ7K1L89qWoIibv+DO++JTPcMn2NPiuDAnoni8cY3YGotuYbacSuWya16Jr6YvYzVCNxQJCdlaS2UTfRkmHQVhCWKfKQ9XryckxkviBIegPQqzaAaPwjsScvxPBHRwgHFyLowG0t87qubh9EDZ6O+zWJ/RvOecI1rWAMQ3qHiI0PWhm7AaOgGah5PcZ0btn5yaqsuU4x3V/kJjQXHX7/ycw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
Subject: [PATCH] xen/serial: scif: add support for HSCIF
Thread-Topic: [PATCH] xen/serial: scif: add support for HSCIF
Thread-Index: AQHYHN5b+zcSsmlMWk6M2sxqYcvKKw==
Date: Tue, 8 Feb 2022 11:23:55 +0000
Message-ID: <20220208112304.1191924-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38c9efca-73a4-4778-8806-08d9eaf57e2d
x-ms-traffictypediagnostic: PR2PR03MB5292:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR2PR03MB5292F0C8463ED33E15497858E62D9@PR2PR03MB5292.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nPU5XPs7prKj0uouIDqQha+E3pSdGFVJDfR1qUYLznXP0Sf27Fx9Wspw189Cp1Mpd4xtRdGS+9rlsZk7INsZfxlzJDeAOFq9uP6EpM3VAuDQVQMViu2bQwk21Pha9QF40D7WzEJrwnye/hhnTOjEvmcesmcIaGNhg5DEhW1PI4CQ1M8SeDfma1bY0jFH8UZSzKlpjc1U9gx1n97spU3BQSbeXE5LBevMcuXEQfFlxnVwx7GdAr8AHrrQwOrL1hlXi3ytPJkeT3nA/xt9vWjSEz/xkWoghv2IqtcKyH/d9PaZDULFSUcwrYRKOrpbcjlL6FCg898y38bVrerukl5VZnLJE1JQo8Wa4yvC1/c4K4BuWXRDVLTO3D34JRl89fG5UYozpnd/XnAuMiW8TOdPcYS4gcOtFRS6FFAxW257yKqqZoXbQ+tFSsmIFqPJ8Wo4a6AIqKMSmJ9NKv+3134xpR8sEaBCr9YrKiu+9E4obnMU84WThlGATlLnvUjdGU6EniAjFN/6QV+CeCsp69jIS7i7EjVpWSvooiN/iYp/GUCfa51p1Wpx81ozSAa7s+i9D7xyuAy3XJgcHPS8X9YA68UIJ8UQ7ZO5kLiOIwOXay+WWou5ekvuFgxm+6/4EUaVIZcxgwFb2X6EWCcBEpTUEyWHtGtSZvLsbTZC4k4Ce5etlE0UqWFvoJudfJpRWg9b56f1od1PLrYuol8KHfaBaA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(76116006)(66556008)(186003)(26005)(36756003)(4326008)(64756008)(66446008)(66476007)(8676002)(8936002)(83380400001)(71200400001)(2616005)(6486002)(107886003)(508600001)(38070700005)(1076003)(86362001)(91956017)(55236004)(5660300002)(316002)(122000001)(54906003)(110136005)(6512007)(6506007)(38100700002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?qTo9A0HUXZCCPjyT/+REYyPuNCDDjn84/11nlGTc24KXxFK+jp3MQqo36p?=
 =?iso-8859-1?Q?Zq0Fy5WmO4dVRajKJD9Yu4hdHdMDfjdYzJRGattE6R4PsTdr4buQja0rkj?=
 =?iso-8859-1?Q?x8Otw6OYAxHd2vDVlJvpui3hosLfjPSKpcJb1SycixxpZ4KeKTAKKV5iiJ?=
 =?iso-8859-1?Q?VH7wA9P3kxcoB60EUzt/+lRSyCHq28jO9PTmGaz4H55JvqPoGMKRIJCiI6?=
 =?iso-8859-1?Q?P8jpmf0GXeyyzMsE8ZUCWY/az0th6os+IMN6n5hEEd/N0KkKHMF3xgLD1Z?=
 =?iso-8859-1?Q?BG/jJwDJaAzKfScSEAvNCZRGpR32zXafMh/speiEi40RYWzH/1vZhbo2Fy?=
 =?iso-8859-1?Q?35qVvzO++viYCxFOgRBP8al/Bk7eyJTI7e/HSE7JZKa8xCwQG0Gmwl2NRT?=
 =?iso-8859-1?Q?xjqO/WcAgfPLHlWGWZbZPQsXvW3GCpzjvhqCmp213qjUtNZ4DnECkUDNUx?=
 =?iso-8859-1?Q?TYRPTjf3MQWZDkRdFTvwkzGyAE9vAFlX8rEx7Txk7ntGzZNl+6mSpuiUnB?=
 =?iso-8859-1?Q?pFOSFK9G69kxzDrsv+a6TqyyhQUfOKf7LFcx0J6p2t4aDNnid7jCkUmVCt?=
 =?iso-8859-1?Q?7A7WY1QS+YSBlWkHDRi0WwVdqZoHBnlZzkTALPl4+0slYOgHYCHNPmBxok?=
 =?iso-8859-1?Q?NvlJPjT9SKSMPek3pITiMH+heqVwWN29IBB/CYOKmZfgJ6wKU0cwQkCo3Z?=
 =?iso-8859-1?Q?WROimmXcxJ7do6oILlwOxYgL+JInR1WV1HKlsCtbcmlsUG0StkhW0lsFYw?=
 =?iso-8859-1?Q?GXgEEjwQRUMkKwK4aEsZH7pEwE1Bg9CiH4QxU4yp+c3bvKKXavhERwZPQi?=
 =?iso-8859-1?Q?DNcpCG+cH1khzp0LNGDKMleoLKQp+OmUzOwrnpg83Vya/x6j9VLGTSNQyz?=
 =?iso-8859-1?Q?2a8xPNz3Jv99Vvrhquef84weqiORLO9d+eOjTeXCuTSOoUtGVdPZNRVJo3?=
 =?iso-8859-1?Q?Q5pqsSN0HhUGMlvgrbIrhm6gbXO8U7T2gE2aZUrXPenmmL41o+YakmNkkv?=
 =?iso-8859-1?Q?ix42AfyxwBMck3E8sITvWlFSA01bkAdnSpJfsBb0G7/MlZ0K63tHvdTfJp?=
 =?iso-8859-1?Q?ZgKb+PlbitH/NiB3GQAj6xwJH0gAR4F54d4z64ujneVI8yeTOIpFPuGXP8?=
 =?iso-8859-1?Q?GnNic1FBpPzrj8lqO9udS7MCB/B/IDXSAO+Em5DNK5uF760SWnORCfYPYT?=
 =?iso-8859-1?Q?NiLh+DWjpp+5Ua2BTcH/N907ho9oCnlQWBDwvjA9/BrlPPM8qN3orovBtB?=
 =?iso-8859-1?Q?yZ9A3AGaYDr++ZOUZnfMuZIMKjJ3Y+iKRPlYwOiu7uqYQI6jaHjuRWUNEU?=
 =?iso-8859-1?Q?KlC3y/MHeBn4mGZbLRLxG/L0PnIyEQvSAAQvjPduLQROlKTizEn2J05g46?=
 =?iso-8859-1?Q?K9+NxMr5TF/pjZ8uR7bbHyyfklYGywvScyoN2gFZPlOZjQHFpYxatNaKZ0?=
 =?iso-8859-1?Q?x8z229+MWOJqt+/Fh9fKVZQX0HWHpKzL2KVudoRYVrdbAl1Sl651qAks6P?=
 =?iso-8859-1?Q?p5cb6L9HqCIKEGSdlNZZf7UfM4o1c4mN8sB0SfOXXjrSj7Caa9PjabV1Y1?=
 =?iso-8859-1?Q?URWxyhJIMiFy2SQsjPTK5dzpua8yDhS2k9pkYDep8RoCdNY6DusG6HQfG8?=
 =?iso-8859-1?Q?m7SswWibRAbGSi8wF2CxwwituHJJwdSvfG5OJFL5JaAoXI1J9zMqjyXsww?=
 =?iso-8859-1?Q?OzeLWAiV7cFpfKkZlyl7HVjvAcqPOthwRWXEbmBO0kFWqnZ31CwCfJ3xsY?=
 =?iso-8859-1?Q?NXFBmeEgQ4hWg6EzatE8AAz5g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c9efca-73a4-4778-8806-08d9eaf57e2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 11:23:55.3655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7+G65dJQue2RaOPe4AFrB99rz4M0VyWlCHHgRBJALj9Efgr9fEldRicbC2ZIGruwcmjrNHMXRrkv4tAQshJ1xF5COjzBeeKi4UKNpncWlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5292
X-Proofpoint-GUID: 3c9aA9IStlOokxtOc4gbybqRWxQh1aU_
X-Proofpoint-ORIG-GUID: 3c9aA9IStlOokxtOc4gbybqRWxQh1aU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_03,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080068

HSCIF is a high-speed variant of Renesas SCIF serial interface. From
Xen point of view, they almost the same, only difference is in FIFO
size.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---

V2:
 - Updated header of the file as per Oleksandr's suggestion
 - Added Oleksandr's R-b tag
---
 xen/drivers/char/scif-uart.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
index ee204a11a4..2fccafe340 100644
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -1,8 +1,8 @@
 /*
  * xen/drivers/char/scif-uart.c
  *
- * Driver for SCIF(A) (Serial communication interface with FIFO (A))
- * compatible UART.
+ * Driver for (H)SCIF(A) ((High-speed) Serial communication interface
+ * with FIFO (A)) compatible UART.
  *
  * Oleksandr Tyshchenko <oleksandr.tyshchenko@globallogic.com>
  * Copyright (C) 2014, Globallogic.
@@ -47,6 +47,7 @@ enum port_types
 {
     SCIF_PORT,
     SCIFA_PORT,
+    HSCIF_PORT,
     NR_PORTS,
 };
=20
@@ -88,6 +89,17 @@ static const struct port_params port_params[NR_PORTS] =
=3D
                         SCASCR_BRIE,
         .fifo_size    =3D 64,
     },
+    [HSCIF_PORT] =3D
+    {
+        .status_reg   =3D SCIF_SCFSR,
+        .tx_fifo_reg  =3D SCIF_SCFTDR,
+        .rx_fifo_reg  =3D SCIF_SCFRDR,
+        .overrun_reg  =3D SCIF_SCLSR,
+        .overrun_mask =3D SCLSR_ORER,
+        .error_mask   =3D SCFSR_PER | SCFSR_FER | SCFSR_BRK | SCFSR_ER,
+        .irq_flags    =3D SCSCR_RIE | SCSCR_TIE | SCSCR_REIE,
+        .fifo_size    =3D 128,
+    },
 };
=20
 static void scif_uart_interrupt(int irq, void *data, struct cpu_user_regs =
*regs)
@@ -288,6 +300,7 @@ static const struct dt_device_match scif_uart_dt_match[=
] __initconst =3D
 {
     { .compatible =3D "renesas,scif",  .data =3D &port_params[SCIF_PORT] }=
,
     { .compatible =3D "renesas,scifa", .data =3D &port_params[SCIFA_PORT] =
},
+    { .compatible =3D "renesas,hscif", .data =3D &port_params[HSCIF_PORT] =
},
     { /* sentinel */ },
 };
=20
--=20
2.34.1

