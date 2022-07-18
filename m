Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C2F578C8E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 23:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370122.601785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDY5s-0004Fw-QB; Mon, 18 Jul 2022 21:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370122.601785; Mon, 18 Jul 2022 21:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDY5s-0004D9-LV; Mon, 18 Jul 2022 21:15:56 +0000
Received: by outflank-mailman (input) for mailman id 370122;
 Mon, 18 Jul 2022 21:15:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+2m=XX=epam.com=prvs=91983e950e=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oDY5q-00043p-WC
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 21:15:55 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd82502e-06de-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 23:15:53 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IImA9S005163;
 Mon, 18 Jul 2022 21:15:46 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3hcrm7v72d-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jul 2022 21:15:46 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6288.eurprd03.prod.outlook.com (2603:10a6:800:134::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 21:15:43 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::3db3:dad:7bd7:4488]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::3db3:dad:7bd7:4488%7]) with mapi id 15.20.5417.035; Mon, 18 Jul 2022
 21:15:43 +0000
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
X-Inumbo-ID: cd82502e-06de-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJG1DGNKi9gfpF8N52wXZBhhGY05kaI7qCegqq3FsOo+4fX2622YUdbd0M4OvqEFr2teKJyVGLoRWim9kDKopmNEqDSbnOwzHm208QAMpZ7hyVtsS/6yPfEjq5l5lHt8MgnDAQ/65R2pnjrSPod9M735RXz6qgc5w2Gv0TBItunyT536cuRN5LHHBVlb3QxMi0wrRWED4IZ/toarO9YTindgefNXIM4sMi0d62C6Ye/6Nq+RY8/FBSig929HvS3xuHQeE9NTSh6lMbCZWyi2AftmnZFjEMTb6RLyah7ZLROHLfbZAUSmBjntW/xxvHLxTYhFsWzwCLq5GyK3lfGaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksdanVPgWNjcEsmDWclgKo/WTZPT/811BmuA9N3cIiA=;
 b=cgCvelgaB24g4mDSKCvZBy22/GyMf+Wfr0bMEytInxrTK0LFsoezjff2OrwRCFhWLHvavSyJ95bsD2v4fWtqIwNo5m/j4bRlodC5QZgnTrXrJ2EA4yiSXuahQAtLlA6cGCYw5Efuc7p5ZcXUUj7piJEVs1q/BGMxp9Jsz5+KCzufySfN/IodOBgKZZPQLYs0AasIzHzgp0cRxxBaUFXSl7wxfU363gi1QYrO1cGN3T3zV9KRqm9t5IQ9t1CN983WQrUW+Q7WLrCyWqRNf1F94LNReA01SyGroctezJgkPAaMVC7wO9qMx75gAqees8VL2yrI+grb3f4XiJb0GaQbVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksdanVPgWNjcEsmDWclgKo/WTZPT/811BmuA9N3cIiA=;
 b=HSHBprWcvOvJ47W6C0lBrTpdIkkJdm26woGD9bmN+V6SQJQPwN8gXcbJws5djKolitb3myJOzIc9dvaVG+/r/W+ZdP86PKOTpR/jAMHLO7Gw85QAFYy9z8NIOTMUSf4XOCOfXDRzP/eDi1Z23BGYHCJY1zcFSESu5dRijeWYk5V9X5ttaTO+1YX92YDrRIZlYi5xwxJPepMNCuPE2ZYJFi1O6pkYygrHpSVgmHuEL2eOzA2Z4Mm9nHvLs+oPfF6olWhbdlGNc627jf0H1dsSv1qLklZP52bDbHfPHMGVdH3m0GhchY8Aaqi3VccnVnIogrUs7y8B2FnAoLjDfiCSkg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Thread-Topic: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Thread-Index: AQHYmuuJ09LC1x/2uEWs942YY/fNVA==
Date: Mon, 18 Jul 2022 21:15:43 +0000
Message-ID: <20220718211521.664729-5-volodymyr_babchuk@epam.com>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.36.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b6ad0bd-8b6f-4062-f850-08da6902ac80
x-ms-traffictypediagnostic: VI1PR03MB6288:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wkk1l0uiIodJdZSFcOiVERfckDFR8Yr7VSL7MQLmrMwutCMorXqL/FDEo2tqgmFFGDbDnCvHwm8JrdVqF8qYNXrTwPjFRJPuUaef9puETzrcheQr5WSDtNyTvu5JpnPN6bWsG0VMd9ar2RUpftENUSRKfWtFSM0py5aa3mgWLQPitXJOYKCfpgahfXE6QEnhT0DgCUtW2hBoWklKjQA6FJ9JanwMPdx5mVHFkYV/vUnOFP70q9yVNHIbpJ0ZGzl0ckSVdPVmQdJjreGQQ9J1whxaUrD+VQCP47KR/YzfR4xsRGeNFp2VS4x4To766mpN8tOZz5dfwrGk4gmglatme3oRz0p08dddEOGAoSztgNjPZMoeeCYtfaap5rOJwjYOdePO74HttHUAbcoLvs4cTVW8XaI287AaxMFy+G5sV+JgyJ4jLCNeG/kR93LGIwXdKMqb6GvEiiCpyId6v6LKkco+YnYn/h1F5gWczSxq1owMlFgqh/nVIgJ1XM60MzMpvgL9JhtdW9heq3Duv0UHQPHz7Arz5ybnbhy0dQIZEDfGQ/0AdbhDbb+se5dg0is+L8svGks/jVCmd8VT1BVnVgwOvIf9L0M9eadBaFJVRiKdgc1eZhQavpbEDH1dmZoRBzOgST431ZeElwzopavmWyyoPKptt+cfYtLqpU0PlDn8ft58ZXgsipietxCXPaorxw6tUFpgctGARaKsP3Y4rLBHheguTiq155ntPZI68ggCkMqQdv0dd7P1qvWoPbTGdQ2/a6C0BThfCF7Lz64hPhV+M6HCnMgNd5q6GMc/qGol+yLEPT2ib4Z8e8pyMazm
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(2906002)(5660300002)(8936002)(36756003)(186003)(4326008)(4744005)(86362001)(91956017)(64756008)(66946007)(66556008)(8676002)(66446008)(66476007)(76116006)(122000001)(6506007)(478600001)(316002)(2616005)(6512007)(6916009)(26005)(54906003)(6486002)(55236004)(1076003)(41300700001)(38070700005)(83380400001)(38100700002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?4Svz0KfunChTd57mLSFOpDKd5yMV9+ZRNItyhJLxVpGCrlUMjKXHieZWf0?=
 =?iso-8859-1?Q?/1AUWtBlUTEfi9Stn3v8K7tKwc5aF0P6P2A9UjdGjQOEfxykEicGyxI7d2?=
 =?iso-8859-1?Q?tOIx/tzAk08ursWR0Zt2UFAmjDV9OR2uU8p5g6iEpmAU5idVVSHlD/7e31?=
 =?iso-8859-1?Q?jkWP+vPKJFZ3tM0FlxQbivzbdQi6ERKOHRubU1tzx41yw0EFQWAvzyWQHn?=
 =?iso-8859-1?Q?0xAsattOk3MlpDo1ZRBWrcYqfgS4987bhWXDKdbNHLO3ZIEkRol1vk5/+5?=
 =?iso-8859-1?Q?6FkaGTbrz0vHAfliGkIDTcoE5MFGTz3uKxQLbudxQhHolSusuihXxjQtmA?=
 =?iso-8859-1?Q?n06B6fow/r8ziWsI9BAdG0HvMQv8Scz017yBXw/p2zunM+4JPUEJhIVVoo?=
 =?iso-8859-1?Q?45YmYy0GFMVkz8fumuGjIBqvTFExPGS+MW3hYy+Jp4rb3unNCQAscObZ8/?=
 =?iso-8859-1?Q?NlFJKTn0Gu4hvgQb+kiCY2W7T18+RX804IgeYdibbWkoLfeiNA9DffECni?=
 =?iso-8859-1?Q?8KDKQFNRg2QGijWUV+EY2o9r/S2baT+N9ZyPluNgmpsjvmWKUmeIvdlYH9?=
 =?iso-8859-1?Q?oUz/N2HoYAzy/zhZX/mKiN+iJ1IK7aqJROxfcxRLqkAyodMWeAb8ioYjqv?=
 =?iso-8859-1?Q?V/zsXWBSaTke7JKDgoSpbYyKeY9oAHpUWbos6Igwf5plESv3EOuUjwFC9r?=
 =?iso-8859-1?Q?/V7DR49HSlBeuhlTzI/e6JEvRMd4W+WJyAI3f8gVRT39+KTCOatJA+lsz0?=
 =?iso-8859-1?Q?+KzVKe+E+4OuoEC2EFjdssRGBGAmxsymJ/76KMxjNsHsQx7LXecqG2Qsso?=
 =?iso-8859-1?Q?fCR8QkxscTK5+sboYNbaw1aKSaD3HwF7Tx9BTUp/w53nEoaq3rg1HfdYjK?=
 =?iso-8859-1?Q?wvWdZp3SBk7b39Ff8rtuHdjLVF4wvdXUB3iOotRX0vK24NEUjzycv/nxxT?=
 =?iso-8859-1?Q?z3HLXnwScczXy4kagNUF8BB4kbZepV2Xc/sVoeAtxWZBHUYPtSq7MsEDgW?=
 =?iso-8859-1?Q?ERq/4e8XAn2bBaq5bxOVrgSqO9GBXODG9dokbl/T13tMd8Sppm/llgqt52?=
 =?iso-8859-1?Q?HJWE19rIPYAGk1eG3H4gk38F6b0KB8+h7Jh3xBpCiS9AoEB0gxi9OD8zRM?=
 =?iso-8859-1?Q?K7GkQQ+pnezSqSHNM+zdmxzx5rSj0g23z3s5PvyL2thzdAuxjoP9bkuwTX?=
 =?iso-8859-1?Q?uNuUElNiylpS+bcDfmjFkOaUeC7p61AWJKtvKFeFi7wcE8vO05V+sGalRL?=
 =?iso-8859-1?Q?/X3a2YdIg5CKhO170bPe48FDcWYXZTXTL/sPKcMZ06QoMEeGiFQTuAE9pA?=
 =?iso-8859-1?Q?pzyzaJ2ZSe37FlDJvRixeTbAYZSnswZR9m9oc8TFODinBVnaee0MT4fFNJ?=
 =?iso-8859-1?Q?QlhdAHGT2zi2dS+y3JiwsAJQrOTE+HOHHFqS1KxAAwzEvANdrYwaDgt6W7?=
 =?iso-8859-1?Q?Wxxx8wd1iq0C8DHVABnB7jLE53RR5OCWoVOXqjMDA3w2Gft6V2Z2QDKO1D?=
 =?iso-8859-1?Q?GAtyjRT3paZsin2h4xSYQanXk86MMtRlpIw7QGy8EniE9sPVTacGxaTeZ6?=
 =?iso-8859-1?Q?Gc3nx8IR3Mvwq7IRDA/jzV9VDERjln6NyYEctnevDUfqXKRwLRE3H0QJzN?=
 =?iso-8859-1?Q?JFk48sieUo9J4DS6RdJxRIVRtsj2J/C8N8PGYSLIRyaRE3VUamyLOuhA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6ad0bd-8b6f-4062-f850-08da6902ac80
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 21:15:43.0705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m5Y/+4oGldBqyz6pxv1P4ShlkkJHqCi4tvgK2Y/HMUi9wdBgX0HbqZOD/ZyVSsIkPgJkj39I+WiPO+sxHvM50y8gwEYhxbuCEhi6QqHrt4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6288
X-Proofpoint-GUID: 8Kx16ohB7z4_SSKC517HlrJP1tRIWTjY
X-Proofpoint-ORIG-GUID: 8Kx16ohB7z4_SSKC517HlrJP1tRIWTjY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_20,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=962 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180089

Patch b4f211606011 ("vpci/msix: fix PBA accesses") introduced call to
iounmap(), but not added corresponding include.

Fixes: b4f211606011 ("vpci/msix: fix PBA accesses")

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/drivers/vpci/vpci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1559763479..674c9b347d 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -19,6 +19,7 @@
=20
 #include <xen/sched.h>
 #include <xen/vpci.h>
+#include <xen/vmap.h>
=20
 /* Internal struct to store the emulated PCI registers. */
 struct vpci_register {
--=20
2.36.1

