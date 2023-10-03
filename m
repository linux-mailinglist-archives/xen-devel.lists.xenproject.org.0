Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE70D7B8172
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 15:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612224.952580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo2L5-0001cB-RU; Wed, 04 Oct 2023 13:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612224.952580; Wed, 04 Oct 2023 13:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo2L5-0001Ua-L1; Wed, 04 Oct 2023 13:54:59 +0000
Received: by outflank-mailman (input) for mailman id 612224;
 Tue, 03 Oct 2023 13:19:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RWbB=FR=epam.com=prvs=4640511bd5=andrii_chepurnyi@srs-se1.protection.inumbo.net>)
 id 1qnfJY-0001vL-4B
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 13:19:52 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86e557c0-61ef-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 15:19:49 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 393C1Pdv000731; Tue, 3 Oct 2023 13:19:33 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3tfwm445yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Oct 2023 13:19:32 +0000
Received: from AS8PR03MB9583.eurprd03.prod.outlook.com (2603:10a6:20b:5aa::18)
 by DB3PR0302MB9087.eurprd03.prod.outlook.com (2603:10a6:10:42b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Tue, 3 Oct
 2023 13:19:28 +0000
Received: from AS8PR03MB9583.eurprd03.prod.outlook.com
 ([fe80::529f:7d90:7f52:64aa]) by AS8PR03MB9583.eurprd03.prod.outlook.com
 ([fe80::529f:7d90:7f52:64aa%4]) with mapi id 15.20.6838.028; Tue, 3 Oct 2023
 13:19:28 +0000
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
X-Inumbo-ID: 86e557c0-61ef-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcCUuTR4Cx7UOo4UeYTZNc4lOShvWiE3g2Ns9kth/Mun9By+p9xUz17FMauoiB+eTMJXzDvuUEZdFnb4aw00TbWT70XJxZq2dq0AKpSeHQ7kcmFUDKnX5tIf5kJ2hMPj1Bud3BYWYyAvNXIKfkwvWe9HsehbmLAy9pGEEKmPBrEg8NDbExeh4DdK0yjk2Jy8sAKGtsxVjwHvjZYkS5WDiynqIkiSqW9jTD2SZ2X6qotdPhn+1/6l43tJQCllicluQbcMUn3MXadO4ycKBt+f+8KYLIh7Jihh0TRHkSsu9kpere1q51aRkZqbahGuNt3KNtzJCvi5SBfUYNukfUASIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvHWBTV3qInXaP1KeKLliPIbtWRnBWcHHbJeVQAPXFU=;
 b=Jyiqol+WMW90zHmXgal6/oSEicAUTuw9FCSru7ZMcLL5H2v0WHvXBktOiI6bI4fX3lXL4iX0gTI4SjutDeeu9m0qnoHe0tJeo5ZKuvYnKqaxYOxxh2M4eKzoUjltB134/QsxB91JXzYMS6Mz2Bg3FTow2a/L5D3DWibEgLR8v/OmjrxSaqTUK7QmNej22Xj2b9BSdayV5AIOnYVGa9m29vrxVWOLUtwgJmlDX/LPRH8MnOi1snFOzONeST0XY5ZEmntA8pX+KRLuBDuf4yU7CX686M0mrufqHrzPcZseCLICSuZxH7Pe+sjk41gVrosB1Yk3lrInyrpUHBRlWHNukQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvHWBTV3qInXaP1KeKLliPIbtWRnBWcHHbJeVQAPXFU=;
 b=VyzXoEz032/ygCBfU8o2DxqTE/b8CfisWdtU0CIt9EUvaNGNot8CjtCSxxLpKAMpmQ3L3pwKt99NgWP0a7o+GibbC+7uEtJ+K/CI/mRhRJAGQ9dDtZK52lAsUcai0Xc1pOrdEGZYjlISMqcpn7AQgWGBnOyy/DiNkXZptu+KVfUeZO8MtY70QNANh3SjGWn+oJF/CmHCXo51RHZpdNrayContVOIKhmDMZJUdW2yGS0XmGwTQr2rpDHHt/kSVmitH9zLep0e6Y6eEISDLzKucjBosA3SVQpU6Zrc8ENn3tKnPTJO9Au8QBEdvAUTHBDrewmlgN6oBVUxSSXDQeZ5MA==
From: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        "andrii.chepurnyi82@gmail.com" <andrii.chepurnyi82@gmail.com>,
        Andrii
 Chepurnyi <Andrii_Chepurnyi@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/ioreq: clean data field in ioreq struct on read
 operations
Thread-Topic: [PATCH] arm/ioreq: clean data field in ioreq struct on read
 operations
Thread-Index: AQHZ9fw82LZSu4lXwEi+r3jS4xqDmw==
Date: Tue, 3 Oct 2023 13:19:28 +0000
Message-ID: <20231003131923.2289867-1-andrii_chepurnyi@epam.com>
Accept-Language: uk-UA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9583:EE_|DB3PR0302MB9087:EE_
x-ms-office365-filtering-correlation-id: bc743080-2102-499d-bec6-08dbc4135f6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kPNDpz2xaZt6JDP53QHfVvfSW82b2P9AzoGuPxWPJvItvYGv6MPnfx2I5ePNVpQ4j68N+ccaJXqdWoauvnngB5M7FdM6b8PFJ0ezF3sG3x3Fj/uQ6DRRNocTJaFdcBaAfFwCiYqcI05LEyVw4jGJLK0m85jMAMqgWY7MnCkYyQa12T9huRJr8zKSXlplUwNQrmK8f85clbxilq1U93s930gMvyPYS/4p7q4psD/Rsk6C3+/76wfxsgenqHGE81u3A9ZeRrarqcI+7wYoVVcwYQhDCZ8fI+a4Tupyl+YJqq2ZhcsdE/B0QvwjSGs8Mt9llatJLsPbHdVHLkPkbIrMyjXsVHe5q5PPeUVfDbNlhyEwu3hOpholKID+pxVAysER+tcdKSLPs4xC7vMZwelKCHyFVb5phq2xemBUIEjOAX0Z1LleOg51g7GOfMwqFBJRjxwS2pHKR/sXtVw2w8q2VLCh4o+K10eMBe4GZGN9ky/muagznd9gm5M8ktp0GtSGIijW6DtXO9Wf2wf1qBCLYaPZvnBnd1sU2Sx2EskGQnkqqtyOIgU9sMVN/C3vdbpvfkCTjstNs2A1D3yWo79UTT7OTSxPRuQ6my7fPWYck9woPSRwk2+W3ZNdiNIWQiff
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9583.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(396003)(376002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(107886003)(6486002)(6506007)(2616005)(6512007)(83380400001)(26005)(71200400001)(5660300002)(2906002)(1076003)(66556008)(76116006)(54906003)(6916009)(8676002)(4326008)(66446008)(91956017)(64756008)(66476007)(41300700001)(316002)(8936002)(66946007)(478600001)(36756003)(38070700005)(38100700002)(122000001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Zt4EeDsorfnEPFk6Yn/J23pfHXRuxkXfuYesP+2dRAyQcd1TE/nI1xjT4g?=
 =?iso-8859-1?Q?jaZay3cx0FUoJav+oTXx5IclJdnoICyP00w/LOnaQkSQMjHf5N5+Hxhg1n?=
 =?iso-8859-1?Q?yEG5Anfg8vcL5H8ejqgAqorPEmA7iAn30e2W+OXwhanSum/m7gyzlEINL3?=
 =?iso-8859-1?Q?aaPTsitN5ghqfU3LACDSX0/wcdJs5NymUrqK4jz9nmKCAbLB5yhVU9pBdZ?=
 =?iso-8859-1?Q?AaadhbOgIRMj4VPLGZWyu5X4S8ZZF5o1re8teNCvRKw93bertzPrMsSe0T?=
 =?iso-8859-1?Q?nVHZRh8QQp1fD2RzUuhPOebYCo7kT09mSZGzn2J8MZY+S9FolhBVBp/PTK?=
 =?iso-8859-1?Q?i6BRsYrzrdfW8FXhzXXQgib9uvjWKdaJhbIfDTmfdXnZDEcH6DQDBgralH?=
 =?iso-8859-1?Q?2UoYzhiH/MVXIoC5zLpkYZJ8B2Tg2d1TvIvOJw109hzfXGEOxTwpYZHjif?=
 =?iso-8859-1?Q?PO7Ze6Qh/RcpswhHkgv5QY7Ri/N1xNENpVmpPgWo57P9zWR3SpLRYFGde6?=
 =?iso-8859-1?Q?ZguUEhvrtG4dF96NoJap5GRHiAOHOJ+lA1HygYTgbKW2Jq2vaufVBvkr4o?=
 =?iso-8859-1?Q?iBHe+C7R3l8C0ZNFWpHQq0FKfnCZ4GWTCDVnihAkI4BTlInzJiAWci/knr?=
 =?iso-8859-1?Q?gLtWoEJ4qPOrtPHGfsXu/JfW264aPOHMZcXw3P2TDHpVRhEHkplQ1NXxlK?=
 =?iso-8859-1?Q?crkuCJvr46QEr+tkIlGvkwkY8U4oyy61SyEUxZXUaoPJeDF6ZAnUFhJYa9?=
 =?iso-8859-1?Q?0ABKNgYJE/IiOoMH6MUgf+r5vfXMFY5iBG28RERaudeMVqE1iT1xY4dAce?=
 =?iso-8859-1?Q?H5zXsoHjHZCUIPPW5swhnEAvyC5/tp3QPqbPCrXTKvWod0gi0P4y/0YbrK?=
 =?iso-8859-1?Q?9/kSLVs84jK5hUfFqt23eEAr+wPifnuVIV2rlpPcFr9oKHacZA6fpVqK7M?=
 =?iso-8859-1?Q?Oq2ONUPhrI3t/DdsKC0+qs7SqEQFYi5VlPXEPkl5+qCEFL7v6Rh74o2rxp?=
 =?iso-8859-1?Q?aZ0YcaQIGC1v+gvHO+lRWJhyPVoNBEyeiNMJG+mWNu3D0BZdE3D3FkAspb?=
 =?iso-8859-1?Q?0IIJR3KWlK49PcpU4E1h0klxDI/rJ3ypyP1TjiMk/IJPJANPxJ25jrIzWU?=
 =?iso-8859-1?Q?aZUGNKoNL/ZzqpfN4I2h7n/dhKeGovL111VgaR8x+1cYSZ8RACiUdIJ28a?=
 =?iso-8859-1?Q?ioQeDcRl0UmaTPOgTGlNV38nZkLwdb1x1noMqDhenDVQw0EOg5F3fWWE6g?=
 =?iso-8859-1?Q?bgHgxBzAX6kYqw/mv2DI8nsu/ctTHn4JJwLy78HKzecyRkhxqJGvs1b0ss?=
 =?iso-8859-1?Q?hFK4vVNPWV7NIEFZ+XRvyzhATs7rpHQ9LS+eQYAZmhKUTZP50OlBjX6p3Y?=
 =?iso-8859-1?Q?PeWIvKPInoMqY+ovyhYyfUkBwJ7JthrMorzVizqQakDIHZKcYtGR3MKIBU?=
 =?iso-8859-1?Q?XOc8VL4V6ARAIt92TScwwkoXJV9yLPq8D1Aw8KlGbIfxNtgcLp4ElcU/PS?=
 =?iso-8859-1?Q?vli7SE1f5CSxghhRf3wGFbA3DvyDeabDhx5pO1Up5TtsW94p8iJnVfvalU?=
 =?iso-8859-1?Q?oLELhD/UdOE1CpSI9LcCQDTikBBZahqxeIp6IJhu88GiPu1WK2A4twYvv1?=
 =?iso-8859-1?Q?mnxug2YzdWzpXUCblKKOrK+2JjAfXuR2HHjvz2K8GR4Rl4Fpreo9SPLg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9583.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc743080-2102-499d-bec6-08dbc4135f6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2023 13:19:28.7065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cIV87JqTQBXOFzGH25aqvB00LwVx5IQoY0OpeRSLl5N4GqoKVCRjXxLqEM0EnQfdnfbO1+973ihRMTzuuteI/B/QoI4ZKRHAKjbchWIKN8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9087
X-Proofpoint-GUID: F8Ussfko19Ox-aUjXSExsTt3dlwb66o5
X-Proofpoint-ORIG-GUID: F8Ussfko19Ox-aUjXSExsTt3dlwb66o5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_10,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 bulkscore=0 priorityscore=1501 mlxlogscore=728
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310030097

For read operations, there's a potential issue when the data field
of the ioreq struct is partially updated in the response. To address
this, zero data field during read operations. This modification
serves as a safeguard against implementations that may inadvertently
partially update the data field in response to read requests.
For instance, consider an 8-bit read operation. In such cases, QEMU,
returns the same content of the data field with only 8 bits of
updated data. This behavior could potentially result in the
propagation of incorrect or unintended data to user-space applications.

Signed-off-by: Andrii Chepurnyi <andrii_chepurnyi@epam.com>
---
 xen/arch/arm/ioreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 3bed0a14c0..aaa2842acc 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -80,7 +80,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
=20
     ASSERT(dabt.valid);
=20
-    p.data =3D get_user_reg(regs, info->dabt.reg);
+    p.data =3D (p.dir) ? 0 : get_user_reg(regs, info->dabt.reg);
     vio->req =3D p;
     vio->suspended =3D false;
     vio->info.dabt_instr =3D instr;
--=20
2.25.1

