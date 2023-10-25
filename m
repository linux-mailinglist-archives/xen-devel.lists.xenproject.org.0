Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96417D67F7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 12:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622789.969932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvat4-00006x-Dq; Wed, 25 Oct 2023 10:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622789.969932; Wed, 25 Oct 2023 10:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvat4-0008Tj-9a; Wed, 25 Oct 2023 10:13:18 +0000
Received: by outflank-mailman (input) for mailman id 622789;
 Wed, 25 Oct 2023 10:13:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TDEh=GH=epam.com=prvs=46626b3b1e=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1qvat2-0008QC-V4
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 10:13:16 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bb9725e-731f-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 12:13:14 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 39P5WSp1021904;
 Wed, 25 Oct 2023 10:13:01 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3txdmxk51v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Oct 2023 10:13:01 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by AS2PR03MB10033.eurprd03.prod.outlook.com (2603:10a6:20b:640::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 10:12:58 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::eecf:7ef0:b4b5:fc42]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::eecf:7ef0:b4b5:fc42%4]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 10:12:58 +0000
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
X-Inumbo-ID: 1bb9725e-731f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrZ6p7qHNL4NiJKNJ5/HCCnxFYkBJ0MOMja801BxMy2sjejqRmk272xomF+4lJ/PyZUs+iGYRYVW7NzrnUTswWIBhJCNElR++DruqUswE2RuOq2ycvNEJse9YvDJWubDdUkn9HTw1BNJDJIPnCczEGGJ7Pc0ye0vdFVhzM3Km5W0dea1T1eAYCN1vCRjl1Tb048AyYmTn0LxQ/xIIAFK7IYoaEkihT+F1a/7MnC7aG+75n1LSNOwkOcVqbTRf8FeMYDjIsrTVjKn8lQ46gF6a/8qM7F/V+gmXc9JViTuFzxfgkEc14TYK6FfbKinY2TbF7w7CL+iDjvl6/TMUwYdFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hr0rMAO4qbwLSU58X19M+biIMWvRcuWcrbTqZFk1N7A=;
 b=IaU2xDk2bx+KO9PQPingGPbSQRsNbmXft5JRwva7rj4fW9LTfWngmQUT6rphnZRWXChk1TYz2QN0yibIJVPbYzpWsLR23JPNpq4e6wXilR+wEqXWW7+glI4U5NccP9Vg/7TBUMiXhcZDL47jYnKXjRACgfW+bjv7q0MnoIxuo194hjDUe1EWkICswO5dH+7cgTbpfSeug3x/eoiJKXrMdNZjcM7qZQCTtbx6NCDe+zEdtuKBgIYmalMxjFeJsYlm0IDz9lFJBNrvPWrF8Ujb347px4Cg0AoEqGYkH38Dw16j7uye4Q5ZWrYO7ymBrEV/YOkgsE6wOOsQIgEByYvRXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hr0rMAO4qbwLSU58X19M+biIMWvRcuWcrbTqZFk1N7A=;
 b=HOCV4VKeFdpOur0WCtfkWNAubDH2i4+Iw+xWtP2OJzN+OhnDe8L1T7/gFfV9N/twZTXp4FuxAsIK2dF+Id7S/d/V6RZ9WM0DkUL5Xmfb19EjRCvUeRTxsQXpmyq0KF/N+TCb8ManQIQlcNW1npy2WpEN5CaPyjN5gaN2xmYXMWwj29btyAjStuBi0AO/yzgvawCJCc6S4qESSsFnCUoJ8Dd2+RkMGuuXKiE0VB06f+TZ/y5L1bKdeuI4Ktmns0WrQJRxMVHXk+9Hu4324AyNOS9RWMCrLGinrb26xdC8T/npJTk7J4W9RSfxmGnwdKSdtdhHyyaS94mWULXipC7Mgg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 0/4] arm: Add GICv3 support to the New VGIC
Thread-Topic: [XEN PATCH 0/4] arm: Add GICv3 support to the New VGIC
Thread-Index: AQHaByvTuljbytuX4USmsHR+sMhC6g==
Date: Wed, 25 Oct 2023 10:12:57 +0000
Message-ID: <cover.1698225630.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|AS2PR03MB10033:EE_
x-ms-office365-filtering-correlation-id: dd5f1333-30f0-4bdf-0fd4-08dbd542f648
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YmwGoQYGjxOXkDB3aTy0BFm8RmcqOlkcN+RpYzW4iLpVUE2fE+KLGX+axQ7eVthuaBy+hY6NQyRPESLA9/JGVALc+kJU1PASiFSfX9jU2Ek/srMG/+reissOlNuWlWOMfR340x4rZSAtw8efk/PrMePHPfJyD+C3cCf7fDJbp+klYil48fC+zGwOEFMDxgk25A/cwSvBu5fUxtgKWVX/DwuOGLgmbv/8T/j7bsa+zWs6k8KTWn54mx1ktZoFYVZzhBD6UwP3PYkKHekYpDW6h77bFKT7RDmD26moLakVP27JzLEIyxwDVz20NZI1Zt0j0KPbUSNjOkKMtOE7tW2yeZMhIkSKjnDwhFcnkfJ7YX+/dhJxFz1faRFXnanwX5JqasDf94X3QGvkWFUC48UXMdlITplwelBCM54T6ulhfLyvQ+eFXIUpBP2D0FS5nZ11veTc99iGIUVRM8CHqlzEg1A1c3uGuc7Dm/J11GPqxvzW6ZziNVbt9pYt8kBhjJxWxu4Bl1cMrF4ffokqaIStgJ5CbgK3noOFK7xRjagwPfjRyi4bg0EYFtr3wJMeouT5kdRAm5LYDe7CnEnX81XpQzjb8vRjrg5Z3oMERYf92DIPozXqQi7ET2ucPn+XGv1p
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(86362001)(2906002)(91956017)(38100700002)(54906003)(41300700001)(66446008)(66476007)(122000001)(316002)(76116006)(66946007)(66556008)(6916009)(71200400001)(6506007)(6486002)(2616005)(107886003)(478600001)(6512007)(83380400001)(64756008)(4326008)(36756003)(5660300002)(8676002)(8936002)(26005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?CoX8i8jd+8tdw8iY7IfMuoLXXnY6M0U93I/HnJSSEVB/4chxnfxnlvlE8m?=
 =?iso-8859-1?Q?EBZINlfquwV80Z1eK+j3DDd+SrsRwbo/CoZQoW8VlZfsDbPqaNeZokIOA3?=
 =?iso-8859-1?Q?oi305FUPvmCuVrVBV2A19hZoUjHzkceN/B9KlHaOJ399JaL3tkMHRb2e79?=
 =?iso-8859-1?Q?dIzoOYs1MnxH6Cc1TrqFvqJwdMtX794Fji6EZ6Zjrz//XvRvoWUQuMKFAZ?=
 =?iso-8859-1?Q?stzjkaNrk8S7T5czka2oLS4pzLEpbUSwl4i/MvsXIvdUAWIIZ/b8pHQZXv?=
 =?iso-8859-1?Q?iFH4FyhmHoJUl0hH3hSNU+UzKVzjqKBV5acJGNFdJAkq9Vly9Jyokmt4SB?=
 =?iso-8859-1?Q?5IgIT5E1P5ySvagufqbzw1FI7N3IEVBZcelaFjOFNhthiAVeK9x+MtFJzm?=
 =?iso-8859-1?Q?Im0mTnnJ7QtjtqcnjAR+9ic/hQcnso+Z6Fe9HePHXlTR0DDElZaxIQyGVQ?=
 =?iso-8859-1?Q?O17CTRvnFLHrK7QgcXPJR9uBsDkpvqEiria3jBSzrLXZE51z+HVISHLyA2?=
 =?iso-8859-1?Q?UGb3JNqmFjNBvo6Wayb0hVYTz9Stt6PzL4NVn0Aig5SSx34hW+oDwSArpo?=
 =?iso-8859-1?Q?ksPbUpqOBb1lQ3MxZ5gOFFO9nvbiGaLm4bQypBWQiuToacWCj6vmMFG6rL?=
 =?iso-8859-1?Q?bHwlbRKDmUm1yiqmszmWCzwGA3irCJxMzVss+ekEyvp0ntndA1rxWc5iyB?=
 =?iso-8859-1?Q?5yCV6Of6Z0a9c3S14/Rk74LH5mbdL8iQ14Ii95Yu7k7FtwlRLLYGlmIpFH?=
 =?iso-8859-1?Q?J8t5kahiJ+o2kxu3aAH9T4uu5Ea1S/gLlow5TYjebdu3PMcZavCMwT96Wz?=
 =?iso-8859-1?Q?9ydmaUvsO7ss0VUcjevxAFRg4DkBTyfB1gZkE7zQGolg/ombkatCWycZ8X?=
 =?iso-8859-1?Q?WK+T0N3V9DnA41yTIa6XhB/tnZx/ikuDSl827Zrjwptf8MpfcgTvPOc8nh?=
 =?iso-8859-1?Q?ImFlIjzMavUCaY7gUSoi4POCIu3+towcmc+l6T4pPmhxkQkH4zjb6qw6R5?=
 =?iso-8859-1?Q?G0Y0zB5yT2jasgbBryp3R0zy+1i2DpEzv+rzNWHvD5gyGbsSzZK3TO4g+j?=
 =?iso-8859-1?Q?YIvw7LjBLmMhDf+/v+F+Q9PqdOSJSwkgCate1aW5H4Bwlxo8Z/cqIPEZVb?=
 =?iso-8859-1?Q?1XM1twV72O1h9lgL+oz/xH92nqef7oGTi/2fAv7AgcQhY+YjzcxQNqMGZK?=
 =?iso-8859-1?Q?24MAj6yNWLmjhgUexY4dipD1VCRLv7pa7L27QNir7qu9ByV68U6dzV6x1P?=
 =?iso-8859-1?Q?MSAGugIRmH5glSVjgFfwOh2SDtClsaq7CcE7M8wg7tyKrWqRYa1qpJnHGV?=
 =?iso-8859-1?Q?X201OwAJivu6Yoy3Xz9KA+PYNl1DOl99mu0a14S6B16nX7//K4qj7m82Rb?=
 =?iso-8859-1?Q?8q/qKSlJO7vfIAex8mvNUyFIzXBqQJcJW8v5gY28SPEnmUYGLsndY+dWaw?=
 =?iso-8859-1?Q?h9ITXOD9nD5FBoR3mlClD2pEwbnvqPTYYbgACRjacGDB6LOuT0TUCk4lK0?=
 =?iso-8859-1?Q?nMBp5lwy9ZLh1oEBdQS7dGlOJUaLpLFFuMuNP26F+QOqis8M6NwpMZvfIQ?=
 =?iso-8859-1?Q?wYPkheg/25F7FMrsVwpppj3SR/cyl9UlvGI3y8pG7wMf6eWjOlfXdrpteG?=
 =?iso-8859-1?Q?szKP5z2ZY5bOAn8SJ+Ji8uBJW/NM81YFA62RS2RMBDY58hEtPOE40umQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5f1333-30f0-4bdf-0fd4-08dbd542f648
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 10:12:57.9385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hBBajdXTuDqYpPPx5tFSvesxYg1kKPKVi+T/SdxzhInLPfuGh3Lh55knNLSIhuPUXAiaPF/DGrgJPsOPEs4vlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10033
X-Proofpoint-ORIG-GUID: ol57qDdlYoAMWelcfDiJ-LRRhRCji0cC
X-Proofpoint-GUID: ol57qDdlYoAMWelcfDiJ-LRRhRCji0cC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_01,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=396 bulkscore=0
 clxscore=1011 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310250088

Hi All.

This patch aims to add GICv3 support to the New VGIC. It adds support for
the GICv3 distributor, redistributor, sysreg and ITS interfaces. This will
allow Xen to emulate level-triggered interrupts with GICVb3 and will make
the NEW_VGIC more complete and usable.

The bulk of the code is taken from the Linux Kernel v6.0 and adapted to the
existing Xen codebase.

For the NEW_VGIC config the !GIC_V3 dependency is removed.
For the HAS_ITS config the deprecated flag is removed and NEW_VGIC dependen=
cy
is added.

Original non-ported changes are:
- Moving the GICv3 distributor base to fix the new_vgic's intid calculation=
.
- Moving the get/put irq to a wider scope to properly integrate the ITS.

Mykyta Poturai (4):
  arm/gicv3: Move guest dist base
  arm/vgic: Move get/put irq to a wider scope
  arm/new vgic: Add GICv3 support for NEW VGIC
  arm/new vgic: Add ITS support to NEW_VGIC

 xen/arch/arm/Kconfig                   |    5 +-
 xen/arch/arm/domain_build.c            |   23 +-
 xen/arch/arm/gic-v3-its.c              |   28 +
 xen/arch/arm/gic-v3-lpi.c              |   11 +
 xen/arch/arm/gic-v3.c                  |    9 +
 xen/arch/arm/include/asm/gic_v3_defs.h |   13 +-
 xen/arch/arm/include/asm/gic_v3_its.h  |   82 +
 xen/arch/arm/include/asm/new_vgic.h    |   96 +-
 xen/arch/arm/include/asm/vgic.h        |    6 +
 xen/arch/arm/vgic/Makefile             |    3 +
 xen/arch/arm/vgic/vgic-init.c          |   19 +-
 xen/arch/arm/vgic/vgic-its.c           | 1945 ++++++++++++++++++++++++
 xen/arch/arm/vgic/vgic-mmio-v3.c       | 1027 +++++++++++++
 xen/arch/arm/vgic/vgic-mmio.c          |   24 +
 xen/arch/arm/vgic/vgic-mmio.h          |   21 +
 xen/arch/arm/vgic/vgic-v3.c            |  383 +++++
 xen/arch/arm/vgic/vgic.c               |   60 +-
 xen/arch/arm/vgic/vgic.h               |   51 +-
 xen/include/public/arch-arm.h          |    2 +-
 19 files changed, 3774 insertions(+), 34 deletions(-)
 create mode 100644 xen/arch/arm/vgic/vgic-its.c
 create mode 100644 xen/arch/arm/vgic/vgic-mmio-v3.c
 create mode 100644 xen/arch/arm/vgic/vgic-v3.c

--=20
2.34.1

