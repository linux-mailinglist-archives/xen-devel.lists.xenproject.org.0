Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFE27E7C5A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630308.983125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R45-0004Yv-1i; Fri, 10 Nov 2023 12:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630308.983125; Fri, 10 Nov 2023 12:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R44-0004Ln-AI; Fri, 10 Nov 2023 12:56:48 +0000
Received: by outflank-mailman (input) for mailman id 630308;
 Fri, 10 Nov 2023 12:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3z-0001y0-6B
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9648dd55-7fc8-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:56:39 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIuvg025691; Fri, 10 Nov 2023 12:56:30 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9j2g0qjw-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:30 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:23 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:23 +0000
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
X-Inumbo-ID: 9648dd55-7fc8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSrOon4KwwEp4TCYidizdf9FwQJjtXY/J2xdVBpfYz5vrlmmHGtEEKyJZRBh8f31MrRczbExVzzEKa8VK77/3B4qOwAnnbt2fCH8tBDuPFbGzobfZ5z7MZLpKFUk7eGk++Du6hd3dqukdNDwTA16Sn8Dw2glMUuL/qQ6+KadTneh3jQx1hBfOgWNKJ0WYzogaQv1xtxVyPaJcj0W1inrzKRihby0g2Q92o9iMQg2H7gaWxNFs3hQ1OWHaoA5ni0J07Rq6eO2/oWsDIK2oKYoPReM7ucgRvuk3aU+WXwVBO4VPedW14vS9d9D8MobiQjXZNATZMsHJdSRfmIXN1NbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vJ5deanoQVE0pywwZGqhgsEzmKwhzWXrEeV9acFX4w=;
 b=JYPTtVt/bNZYxHkKlROgp/JmzXkVt0b4GVggy+/2Z/pkXmN+S0gIdczfvQ9SA3Znu0VEbvztkgtXjNJwytYbLQme1+TAv3EL9afBpYbju5/hMPXkaIMA8PZmDwxa8xYIZKzGfvyg6fYX+gsAE+HYDrpcDeIRJt46cF85syIcTsnXfnToVbW1z44vyQAX2OMLpeHd0fVB9F7Fo8gb/vBZ51Llgny53qaC7wSr6TxB/ycvEoMRY7Po1f1EN39Lmymgv8Ta/0NG6lt1gsJql+Rj1TCGcleR5Myj/WQvDoZtR42KEWthtla9n+27LyUi1CmXOTy0FnS4AHHd9SmG2hCa9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vJ5deanoQVE0pywwZGqhgsEzmKwhzWXrEeV9acFX4w=;
 b=WTHs2uChSEBGrlkn3aGajdBHWSLN6SOmx8gw0utyBWWBRymUYuUlojuvBgMoRbqcxC0uqt9Eu8oZqt7i8nZF4VK8XIIPta7ZGSqZVfVfITlluDQZuQ5h7GtZdKaHPGn4XuS/J0akxwRmat/B3njRvmN7UzohwzjPQliHnTyTIbNqtGKRPCE/yzdKcw9NIuzvv+hnHQGZvIAdihmhp0FkD+dyRMkJEjML+ZHcx6Aanc9IRPZJCwyNN51RS/pGGBTFp+u35QhlGt6VTsMG5INBb8zCR8fNOKX0Vv3knQsqFqA1umJlr96EAyxSK71sbpt3Kg+jK8FIjce9HK1eeZUSaQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v2 16/25] arm: new VGIC: its: Implement basic ITS register
 handlers
Thread-Topic: [XEN PATCH v2 16/25] arm: new VGIC: its: Implement basic ITS
 register handlers
Thread-Index: AQHaE9VNHux7NBgFFEy5VNobPwbK2A==
Date: Fri, 10 Nov 2023 12:56:21 +0000
Message-ID: 
 <5944f5e520cc7de554320d455f05f42090f7075e.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: f5908b83-222f-4748-a28d-08dbe1ec714d
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NcgaXE50IdvPkO4fQYspKwtP4eeGp7sD/j96ERlbSWY8wBqbIfVfCOIyJyHehvycuRflDTInTmaQo5T2Jkxw2sWWOXP59Qp0MXuOwFAxuKYfVPxdV4rIxeYilYlCkzc3U6R4PgRnl6eFH5G0Qfp9pexq/7Ef7z8UZxut7m64dkp3G5yrHjzmB83pomZ31IVEwOd7jfRhlaDmIhqIynnAjXwdiVPAo/PjuyyfeX3JAH6vPu1qL3Dj41DG0EFXyKr/5Z3GXqM60z8iqMbS+abGhkoiwWipov3N6kKQk3MiBkTj6+9bmWTd8BbTZIlcRgCcWKhH0LtcgVr1f0dPTUt+YZ9tM18CGcF6OLc4YO8gVx0ZxHJd71lYDTmKDxUijayCrN5nvOUivx2c3PHYy4Bd8GCLLsyyJc0UyooYRQ10YzUnEinHNh+vPiu35ihQmGUXiF3nC96Ew0aWzHn61nPztsyUF7Ajl7WE/Vx809mxztgJ/qBXoViZ4vha9xntbPvkVqkpFvwJczRdnj6lJ/Q2gcH9g4mnFjKtV0G/e7q26vNnrHLqgfw1VJix9hLUQpy/pksR6cgZ9TBiEdYleCVhAW3qdbFWN6GaVfij7sM57/GQAC422YtlPL1HrO0c+cj/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(30864003)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Ql0uZS8Q/kJzzx5RFJeFQ/QXWCg2aT8lRZ6Swqdf57YIwVkqnwsZ6K3nst?=
 =?iso-8859-1?Q?Xwxn9e9CywbgY2wrrxNpnXsH/KuEEUEy9woGJXIdK7f4c7QPZJdAy68A16?=
 =?iso-8859-1?Q?MiUjnZI/V27unFAuKcKzZmhc73omIpv3Q2ae3KOqNusuyt8snaC4YYOj6T?=
 =?iso-8859-1?Q?54sPXyCVxHsvK41idg+Bk+2a4RWF2w1l+/xB5z15uCnVvjbqjxEDvyjwMJ?=
 =?iso-8859-1?Q?4IiscfxB4QeYSgOOf9ArMwhAxT2T/XqS8J0EcCiEmXf3C3pFYUXEy0FVzF?=
 =?iso-8859-1?Q?uKv5FKJDl3kn90bpteFM4Y2xJFJfy3Oq7qkG5F+CulOxhk4o7MiiW9q+EH?=
 =?iso-8859-1?Q?KUWhGX30TcKKSIvWyO5utEhsyzG1kEvmDFue5B8MpQ6d7+GUP0iukxRMrE?=
 =?iso-8859-1?Q?55vnjSymx0CIAEluu7urhmig8UEarnlxhW9rznrNwpSMcUZ0zL1Hbrf9of?=
 =?iso-8859-1?Q?07eFu1vziA1URx9PQhzm2S7zqsE03749DuCf8biXe5XmRFtWSxr5YSESLP?=
 =?iso-8859-1?Q?rVEFasQuOtoUYgcCU8SY3RfBMrErTKaprdjthPPRUtA+8c/qQJxWHyA2df?=
 =?iso-8859-1?Q?38cfRtEkPlLNKfvlaYS2avXCeLxcfQiEE+66fS00xtrTqfhZEkpeKdtWFQ?=
 =?iso-8859-1?Q?rEMw5de9kZV9UumQ0xDJJFjA3FL2uyL3omZ+fAYRALi2wU2qvSgv3E8Euc?=
 =?iso-8859-1?Q?sJadLnG6j7tLUZIZifB/KlFKoX8PETrFflB0gRnae6gHdiPmlnQOIadpZV?=
 =?iso-8859-1?Q?7kERnN5SYGCHRnlr6voQn3OhlY+jrTDzJ1lnvp4V1sPQFmxvUZkY21YU7W?=
 =?iso-8859-1?Q?/9ZxF/Gi6Tca1GxdHhOGWBO6nGqssS7kQvpmGe0CqmW5EjP5HTeE7ed7qX?=
 =?iso-8859-1?Q?V+2/Fks5NDeTSEJ86nddZpSrz86iTfFifg9ac4hT7DUAAWUiN7hIKTTboW?=
 =?iso-8859-1?Q?9kYAHQbFso65mu2Fxm7Q6WcZMOFn2Z1AwvLykEaVyP1DkeyhwoQWi1aw36?=
 =?iso-8859-1?Q?pESqSDAXAox8x4H1bF6NTzay/FMqgIZk7DKlwaTHQXeEPOvnKomj6Zr2Ve?=
 =?iso-8859-1?Q?RK2fWBIUPfYgh0g1/h5RKReRaZ3P8st1RIkcy0PfFWEYS2g9Ji/4z8kJvp?=
 =?iso-8859-1?Q?CM+hKNcDLSLro0kbuRAW9Nc8n12J2mvJy1yjwdAOhjbXr1so5J3DpeOb3/?=
 =?iso-8859-1?Q?eGJWSsRS8QFYQk6Byq+EMhJfGDkWxOIfVSbLrWV5ZnCpJeegeDSpGVs/Tp?=
 =?iso-8859-1?Q?1uJu/n2xhfFy2WcTU/y3DjQ8QA+vIatypa54dbmyqlGGEJBXDE33PlOq/b?=
 =?iso-8859-1?Q?x/UvoUMDUYEsCZMErdvYKWKVkIKT+KrCqniGHSvADRu/qaLmEGmpUGKKlt?=
 =?iso-8859-1?Q?wLeM+D5rPOCqpShPqm8JKJzMEEDoRBi2fjwT6fUxupfupdR1MFSSLOoDCQ?=
 =?iso-8859-1?Q?WGl5csruU2R2YgvITvj/oU7zUyzgRI5xxiW2CT8u+6c1RKsc96SZ4GZtHj?=
 =?iso-8859-1?Q?zPwLe1fQqqn5HO86wSr0gpmMqqIA5937jYpxZmh2B/E89fcVMAK1fWigao?=
 =?iso-8859-1?Q?jkKcdMY8NRXxmoLzOuMZtMumkyT2HXiKsJU0/0uA37kwSqMvBcPiF7XTjh?=
 =?iso-8859-1?Q?27AxGdXHRgXFJ1a1Ekqf9DoNYfHptQQens3Yhfcksrpg0ZhnfIqSBQUA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5908b83-222f-4748-a28d-08dbe1ec714d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:21.4436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V1NOEhsKqoRJ27pwkXVU5l6AhD79EdWxXGFYXUz61dwZbf6jGEjt9FF8IUsu2kOET/Y3imKShYVzCpJMaNR+Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-ORIG-GUID: o2Jws51yVk5ZDJ5p_K6688AVePtAahNO
X-Proofpoint-GUID: o2Jws51yVk5ZDJ5p_K6688AVePtAahNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Add emulation for some basic MMIO registers used in the ITS emulation.
This includes:
- GITS_{CTLR,TYPER,IIDR}
- ID registers
- GITS_{CBASER,CREADR,CWRITER}
(which implement the ITS command buffer handling)
- GITS_BASER<n>

The registers holding base addresses and attributes are sanitised before
storing them.

Base on Linux commit 424c33830f53f2 by Andre Przywara

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/gic_v3_defs.h |   4 +
 xen/arch/arm/include/asm/gic_v3_its.h  |  60 ++++
 xen/arch/arm/include/asm/new_vgic.h    |  18 +
 xen/arch/arm/vgic/vgic-its.c           | 465 ++++++++++++++++++++++++-
 xen/arch/arm/vgic/vgic-mmio.h          |   7 +
 xen/arch/arm/vgic/vgic.h               |   5 +
 6 files changed, 546 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 3f1f59d1c7..e4e4696de3 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -138,7 +138,11 @@
 #define GIC_BASER_NonShareable       0ULL
 #define GIC_BASER_InnerShareable     1ULL
 #define GIC_BASER_OuterShareable     2ULL
+#define GIC_BASER_SHAREABILITY_MASK  3ULL
=20
+#define GICR_PROPBASER_IDBITS_MASK   (0x1f)
+#define GICR_PROPBASER_ADDRESS(x)    ((x) & GENMASK_ULL(51, 12))
+#define GICR_PENDBASER_ADDRESS(x)    ((x) & GENMASK_ULL(51, 16))
 #define GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT         56
 #define GICR_PROPBASER_OUTER_CACHEABILITY_MASK               \
         (7ULL << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT)
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index 4e857cac1a..b408441c6e 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -36,7 +36,16 @@
 #define GITS_BASER6                     0x130
 #define GITS_BASER7                     0x138
 #define GITS_IDREGS_BASE                0xffd0
+#define GITS_PIDR0                      0xffe0
+#define GITS_PIDR1                      0xffe4
 #define GITS_PIDR2                      GICR_PIDR2
+#define GITS_PIDR4                      0xffd0
+#define GITS_CIDR0                      0xfff0
+#define GITS_CIDR1                      0xfff4
+#define GITS_CIDR2                      0xfff8
+#define GITS_CIDR3                      0xfffc
+
+#define GITS_TRANSLATER                 0x10040
=20
 /* Register bits */
 #define GITS_VALID_BIT                  BIT(63, UL)
@@ -50,6 +59,11 @@
 #define GITS_TYPER_DEVICE_ID_BITS(r)    ((((r) & GITS_TYPER_DEVIDS_MASK) >=
> \
                                                  GITS_TYPER_DEVIDS_SHIFT) =
+ 1)
=20
+#define GITS_IIDR_REV_SHIFT             12
+#define GITS_IIDR_REV_MASK              (0xf << GITS_IIDR_REV_SHIFT)
+#define GITS_IIDR_REV(r)                (((r) >> GITS_IIDR_REV_SHIFT) & 0x=
f)
+#define GITS_IIDR_PRODUCTID_SHIFT       24
+
 #define GITS_TYPER_IDBITS_SHIFT         8
 #define GITS_TYPER_IDBITS_MASK          (0x1fUL << GITS_TYPER_IDBITS_SHIFT=
)
 #define GITS_TYPER_EVENT_ID_BITS(r)     ((((r) & GITS_TYPER_IDBITS_MASK) >=
> \
@@ -61,10 +75,12 @@
                                                  GITS_TYPER_ITT_SIZE_SHIFT=
) + 1)
 #define GITS_TYPER_PHYSICAL             (1U << 0)
=20
+#define GITS_BASER_VALID                (1ULL << 63)
 #define GITS_BASER_INDIRECT             BIT(62, UL)
 #define GITS_BASER_INNER_CACHEABILITY_SHIFT        59
 #define GITS_BASER_TYPE_SHIFT           56
 #define GITS_BASER_TYPE_MASK            (7ULL << GITS_BASER_TYPE_SHIFT)
+#define GITS_BASER_TYPE(r)              (((r) >> GITS_BASER_TYPE_SHIFT) & =
7)
 #define GITS_BASER_OUTER_CACHEABILITY_SHIFT        53
 #define GITS_BASER_TYPE_NONE            0UL
 #define GITS_BASER_TYPE_DEVICE          1UL
@@ -77,6 +93,7 @@
 #define GITS_BASER_ENTRY_SIZE_SHIFT     48
 #define GITS_BASER_ENTRY_SIZE(reg)                                       \
                         ((((reg) >> GITS_BASER_ENTRY_SIZE_SHIFT) & 0x1f) +=
 1)
+#define GITS_BASER_ENTRY_SIZE_MASK      GENMASK_ULL(52, 48)
 #define GITS_BASER_SHAREABILITY_SHIFT   10
 #define GITS_BASER_PAGE_SIZE_SHIFT      8
 #define GITS_BASER_SIZE_MASK            0xff
@@ -84,7 +101,48 @@
 #define GITS_BASER_OUTER_CACHEABILITY_MASK   (0x7ULL << GITS_BASER_OUTER_C=
ACHEABILITY_SHIFT)
 #define GITS_BASER_INNER_CACHEABILITY_MASK   (0x7ULL << GITS_BASER_INNER_C=
ACHEABILITY_SHIFT)
=20
+#define GIC_PAGE_SIZE_4K                0ULL
+#define GIC_PAGE_SIZE_16K               1ULL
+#define GIC_PAGE_SIZE_64K               2ULL
+#define GIC_PAGE_SIZE_MASK              3ULL
+
+#define __GITS_BASER_PSZ(sz)            \
+    (GIC_PAGE_SIZE_ ## sz << GITS_BASER_PAGE_SIZE_SHIFT)
+#define GITS_BASER_PAGE_SIZE_4K         __GITS_BASER_PSZ(4K)
+#define GITS_BASER_PAGE_SIZE_16K        __GITS_BASER_PSZ(16K)
+#define GITS_BASER_PAGE_SIZE_64K        __GITS_BASER_PSZ(64K)
+#define GITS_BASER_PAGE_SIZE_MASK       __GITS_BASER_PSZ(MASK)
+
+#define GITS_BASER_NR_PAGES(r)         (((r) & 0xff) + 1)
+
+#define GITS_BASER_PHYS_52_to_48(phys)					\
+	(((phys) & GENMASK_ULL(47, 16)) | (((phys) >> 48) & 0xf) << 12)
+#define GITS_BASER_ADDR_48_to_52(baser)					\
+	(((baser) & GENMASK_ULL(47, 16)) | (((baser) >> 12) & 0xf) << 48)
+
+#define GIC_BASER_CACHEABILITY(reg, inner_outer, type)			\
+	(GIC_BASER_CACHE_##type << reg##_##inner_outer##_CACHEABILITY_SHIFT)
+
+#define GIC_BASER_SHAREABILITY(reg, type)				\
+	(GIC_BASER_##type << reg##_SHAREABILITY_SHIFT)
+
 #define GITS_CBASER_SIZE_MASK           0xff
+#define GITS_CBASER_VALID               (1ULL << 63)
+#define GITS_CBASER_SHAREABILITY_SHIFT  (10)
+#define GITS_CBASER_INNER_CACHEABILITY_SHIFT    (59)
+#define GITS_CBASER_OUTER_CACHEABILITY_SHIFT    (53)
+#define GITS_CBASER_SHAREABILITY_MASK					\
+	GIC_BASER_SHAREABILITY(GITS_CBASER, SHAREABILITY_MASK)
+#define GITS_CBASER_INNER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, MASK)
+#define GITS_CBASER_OUTER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GITS_CBASER, OUTER, MASK)
+#define GITS_CBASER_CACHEABILITY_MASK GITS_CBASER_INNER_CACHEABILITY_MASK
+
+#define GITS_CBASER_InnerShareable					\
+	GIC_BASER_SHAREABILITY(GITS_CBASER, InnerShareable)
+
+#define GITS_CBASER_ADDRESS(cbaser)	((cbaser) & GENMASK_ULL(51, 12))
=20
 /* ITS command definitions */
 #define ITS_CMD_SIZE                    32
@@ -104,6 +162,8 @@
=20
 #define ITS_DOORBELL_OFFSET             0x10040
 #define GICV3_ITS_SIZE                  SZ_128K
+#define ITS_TRANSLATION_OFFSET          0x10000
+#define GIC_ENCODE_SZ(n, w) (((unsigned long)(n) - 1) & GENMASK_ULL(((w) -=
 1), 0))
=20
 #include <xen/device_tree.h>
 #include <xen/rbtree.h>
diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm=
/new_vgic.h
index 00a5557921..3048f39844 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -122,7 +122,25 @@ struct vgic_its {
=20
     bool enabled;
     struct vgic_io_device iodev;
+    struct domain *domain;
+
+    /* These registers correspond to GITS_BASER{0,1} */
+    u64 baser_device_table;
+    u64 baser_coll_table;
+
+    /* Protects the command queue */
+    struct spinlock cmd_lock;
+    u64 cbaser;
+    u32 creadr;
+    u32 cwriter;
+
+    /* migration ABI revision in use */
+    u32 abi_rev;
+
+    /* Protects the device and collection lists */
+    struct spinlock its_lock;
     struct list_head device_list;
+    struct list_head collection_list;
     paddr_t doorbell_address;
 };
=20
diff --git a/xen/arch/arm/vgic/vgic-its.c b/xen/arch/arm/vgic/vgic-its.c
index 3eceadaa79..5e94f0144d 100644
--- a/xen/arch/arm/vgic/vgic-its.c
+++ b/xen/arch/arm/vgic/vgic-its.c
@@ -27,11 +27,22 @@
 #include "vgic.h"
 #include "vgic-mmio.h"
=20
-static unsigned long its_mmio_read_raz(struct domain *d, struct vgic_its *=
its,
-                              paddr_t addr, unsigned int len)
-{
-    return 0;
-}
+#define COLLECTION_NOT_MAPPED ((u32)~0)
+
+struct its_collection {
+    struct list_head coll_list;
+
+    u32 collection_id;
+    u32 target_addr;
+};
+
+struct its_ite {
+    struct list_head ite_list;
+
+    struct vgic_irq *irq;
+    struct its_collection *collection;
+    u32 event_id;
+};
=20
 /*
  * Find and returns a device in the device table for an ITS.
@@ -48,16 +59,68 @@ static struct vgic_its_device *find_its_device(struct v=
gic_its *its, u32 device_
     return NULL;
 }
=20
+#define VGIC_ITS_TYPER_IDBITS           16
+#define VGIC_ITS_TYPER_DEVBITS          16
+#define VGIC_ITS_TYPER_ITE_SIZE         8
+
+/* Requires the its_lock to be held. */
+static void its_free_ite(struct domain *d, struct its_ite *ite)
+{
+    list_del(&ite->ite_list);
+
+    /* This put matches the get in vgic_add_lpi. */
+    if ( ite->irq )
+    {
+        /* GICv4 style VLPIS are not yet supported */
+        WARN_ON(ite->irq->hw);
+
+        vgic_put_irq(d, ite->irq);
+    }
+
+    xfree(ite);
+}
+
 /* Requires the its_devices_lock to be held. */
 void vgic_its_free_device(struct vgic_its_device *device)
 {
+    struct its_ite *ite, *temp;
     struct domain *d =3D device->d;
    =20
     BUG_ON(!d);
+    /*
+     * The spec says that unmapping a device with still valid
+     * ITTEs associated is UNPREDICTABLE. We remove all ITTEs,
+     * since we cannot leave the memory unreferenced.
+     */
+    list_for_each_entry_safe(ite, temp, &device->itt_head, ite_list)
+        its_free_ite(d, ite);
+
     list_del(&device->dev_list);
     xfree(device);
 }
=20
+/* its lock must be held */
+static void vgic_its_free_device_list(struct domain *d, struct vgic_its *i=
ts)
+{
+    struct vgic_its_device *cur, *temp;
+
+    list_for_each_entry_safe(cur, temp, &its->device_list, dev_list)
+        vgic_its_free_device(cur);
+}
+
+/* its lock must be held */
+static void vgic_its_free_collection_list(struct domain *d,
+                                          struct vgic_its *its)
+{
+    struct its_collection *cur, *temp;
+
+    list_for_each_entry_safe(cur, temp, &its->collection_list, coll_list)
+    {
+        list_del(&cur->coll_list);
+        xfree(cur);
+    }
+}
+
 /* Must be called with its_devices_lock mutex held */
 struct vgic_its_device* vgic_its_get_device(struct domain *d, paddr_t vdoo=
rbell,
                                          uint32_t vdevid)
@@ -119,6 +182,349 @@ void vgic_its_delete_device(struct domain *d, struct =
vgic_its_device *its_dev)
     list_del(&its_dev->dev_list);
 }
=20
+/*
+ * This function is called with the its_cmd lock held, but the ITS data
+ * structure lock dropped.
+ */
+static int vgic_its_handle_command(struct domain *d, struct vgic_its *its,
+                                   u64 *its_cmd)
+{
+
+    return -ENODEV;
+}
+
+#define ITS_CMD_BUFFER_SIZE(baser) ((((baser)&0xff) + 1) << 12)
+#define ITS_CMD_SIZE               32
+#define ITS_CMD_OFFSET(reg)        ((reg)&GENMASK(19, 5))
+
+/* Must be called with the cmd_lock held. */
+static void vgic_its_process_commands(struct domain *d, struct vgic_its *i=
ts)
+{
+    paddr_t cbaser;
+    u64 cmd_buf[4];
+
+    /* Commands are only processed when the ITS is enabled. */
+    if ( !its->enabled )
+        return;
+
+    cbaser =3D GITS_CBASER_ADDRESS(its->cbaser);
+
+    while ( its->cwriter !=3D its->creadr )
+    {
+        int ret =3D access_guest_memory_by_gpa(d, cbaser + its->creadr, cm=
d_buf,
+                                             ITS_CMD_SIZE, false);
+        /*
+         * If kvm_read_guest() fails, this could be due to the guest
+         * programming a bogus value in CBASER or something else going
+         * wrong from which we cannot easily recover.
+         * According to section 6.3.2 in the GICv3 spec we can just
+         * ignore that command then.
+         */
+        if ( !ret )
+            vgic_its_handle_command(d, its, cmd_buf);
+
+        its->creadr +=3D ITS_CMD_SIZE;
+        if ( its->creadr =3D=3D ITS_CMD_BUFFER_SIZE(its->cbaser) )
+            its->creadr =3D 0;
+    }
+}
+
+static unsigned long vgic_mmio_read_its_ctlr(struct domain *d,
+                                             struct vgic_its *its, paddr_t=
 addr,
+                                             unsigned int len)
+{
+    u32 reg =3D 0;
+
+    spin_lock(&its->cmd_lock);
+    if ( its->creadr =3D=3D its->cwriter )
+        reg |=3D GITS_CTLR_QUIESCENT;
+    if ( its->enabled )
+        reg |=3D GITS_CTLR_ENABLE;
+    spin_unlock(&its->cmd_lock);
+
+    return reg;
+}
+
+static void vgic_mmio_write_its_ctlr(struct domain *d, struct vgic_its *it=
s,
+                                     paddr_t addr, unsigned int len,
+                                     unsigned long val)
+{
+    spin_lock(&its->cmd_lock);
+
+    /*
+     * It is UNPREDICTABLE to enable the ITS if any of the CBASER or
+     * device/collection BASER are invalid
+     */
+    if ( !its->enabled && (val & GITS_CTLR_ENABLE) &&
+         (!(its->baser_device_table & GITS_VALID_BIT) ||
+          !(its->baser_coll_table & GITS_VALID_BIT) ||
+          !(its->cbaser & GITS_VALID_BIT)) )
+        goto out;
+
+    its->enabled =3D !!(val & GITS_CTLR_ENABLE);
+
+    /*
+     * Try to process any pending commands. This function bails out early
+     * if the ITS is disabled or no commands have been queued.
+     */
+    vgic_its_process_commands(d, its);
+
+out:
+    spin_unlock(&its->cmd_lock);
+}
+
+static unsigned long vgic_mmio_read_its_iidr(struct domain *d,
+                                             struct vgic_its *its, paddr_t=
 addr,
+                                             unsigned int len)
+{
+    u32 val;
+
+    val =3D (its->abi_rev << GITS_IIDR_REV_SHIFT) & GITS_IIDR_REV_MASK;
+    val |=3D (PRODUCT_ID_KVM << GITS_IIDR_PRODUCTID_SHIFT) | IMPLEMENTER_A=
RM;
+    return val;
+}
+
+static unsigned long vgic_mmio_read_its_typer(struct domain *d,
+                                              struct vgic_its *its,
+                                              paddr_t addr, unsigned int l=
en)
+{
+    u64 reg                        =3D GITS_TYPER_PHYSICAL;
+
+    /*
+     * We use linear CPU numbers for redistributor addressing,
+     * so GITS_TYPER.PTA is 0.
+     * Also we force all PROPBASER registers to be the same, so
+     * CommonLPIAff is 0 as well.
+     * To avoid memory waste in the guest, we keep the number of IDBits an=
d
+     * DevBits low - as least for the time being.
+     */
+    reg |=3D GIC_ENCODE_SZ(VGIC_ITS_TYPER_DEVBITS, 5) << GITS_TYPER_DEVIDS=
_SHIFT;
+    reg |=3D GIC_ENCODE_SZ(VGIC_ITS_TYPER_IDBITS, 5) << GITS_TYPER_IDBITS_=
SHIFT;
+    reg |=3D GIC_ENCODE_SZ(VGIC_ITS_TYPER_ITE_SIZE, 4) << GITS_TYPER_ITT_S=
IZE_SHIFT;
+
+    return extract_bytes(reg, addr & 7, len);
+}
+
+static u64 vgic_sanitise_its_baser(u64 reg)
+{
+    reg =3D vgic_sanitise_field(reg, GITS_BASER_SHAREABILITY_MASK,
+                              GITS_BASER_SHAREABILITY_SHIFT,
+                              vgic_sanitise_shareability);
+    reg =3D vgic_sanitise_field(reg, GITS_BASER_INNER_CACHEABILITY_MASK,
+                              GITS_BASER_INNER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_inner_cacheability);
+    reg =3D vgic_sanitise_field(reg, GITS_BASER_OUTER_CACHEABILITY_MASK,
+                              GITS_BASER_OUTER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_outer_cacheability);
+
+    /* We support only one (ITS) page size: 64K */
+    reg =3D (reg & ~GITS_BASER_PAGE_SIZE_MASK) | GITS_BASER_PAGE_SIZE_64K;
+
+    return reg;
+}
+
+static u64 vgic_sanitise_its_cbaser(u64 reg)
+{
+    reg =3D vgic_sanitise_field(reg, GITS_CBASER_SHAREABILITY_MASK,
+                              GITS_CBASER_SHAREABILITY_SHIFT,
+                              vgic_sanitise_shareability);
+    reg =3D vgic_sanitise_field(reg, GITS_CBASER_INNER_CACHEABILITY_MASK,
+                              GITS_CBASER_INNER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_inner_cacheability);
+    reg =3D vgic_sanitise_field(reg, GITS_CBASER_OUTER_CACHEABILITY_MASK,
+                              GITS_CBASER_OUTER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_outer_cacheability);
+
+    /* Sanitise the physical address to be 64k aligned. */
+    reg &=3D ~GENMASK_ULL(15, 12);
+
+    return reg;
+}
+
+static unsigned long vgic_mmio_read_its_cbaser(struct domain *d,
+                                               struct vgic_its *its,
+                                               paddr_t addr, unsigned int =
len)
+{
+    return extract_bytes(its->cbaser, addr & 7, len);
+}
+
+static void vgic_mmio_write_its_cbaser(struct domain *d, struct vgic_its *=
its,
+                                       paddr_t addr, unsigned int len,
+                                       unsigned long val)
+{
+    /* When GITS_CTLR.Enable is 1, this register is RO. */
+    if ( its->enabled )
+        return;
+
+    spin_lock(&its->cmd_lock);
+    its->cbaser =3D update_64bit_reg(its->cbaser, addr & 7, len, val);
+    its->cbaser =3D vgic_sanitise_its_cbaser(its->cbaser);
+    its->creadr =3D 0;
+    /*
+     * CWRITER is architecturally UNKNOWN on reset, but we need to reset
+     * it to CREADR to make sure we start with an empty command buffer.
+     */
+    its->cwriter =3D its->creadr;
+    spin_unlock(&its->cmd_lock);
+}
+
+static unsigned long vgic_mmio_read_its_cwriter(struct domain *d,
+                                                struct vgic_its *its,
+                                                paddr_t addr, unsigned int=
 len)
+{
+    return extract_bytes(its->cwriter, addr & 0x7, len);
+}
+
+/*
+ * By writing to CWRITER the guest announces new commands to be processed.
+ * To avoid any races in the first place, we take the its_cmd lock, which
+ * protects our ring buffer variables, so that there is only one user
+ * per ITS handling commands at a given time.
+ */
+static void vgic_mmio_write_its_cwriter(struct domain *d, struct vgic_its =
*its,
+                                        paddr_t addr, unsigned int len,
+                                        unsigned long val)
+{
+    u64 reg;
+
+    if ( !its )
+        return;
+
+    spin_lock(&its->cmd_lock);
+
+    reg =3D update_64bit_reg(its->cwriter, addr & 7, len, val);
+    reg =3D ITS_CMD_OFFSET(reg);
+    if ( reg >=3D ITS_CMD_BUFFER_SIZE(its->cbaser) )
+    {
+        spin_unlock(&its->cmd_lock);
+        return;
+    }
+    its->cwriter =3D reg;
+
+    vgic_its_process_commands(d, its);
+
+    spin_unlock(&its->cmd_lock);
+}
+
+static unsigned long vgic_mmio_read_its_creadr(struct domain *d,
+                                               struct vgic_its *its,
+                                               paddr_t addr, unsigned int =
len)
+{
+    return extract_bytes(its->creadr, addr & 0x7, len);
+}
+
+#define BASER_INDEX(addr) (((addr) / sizeof(u64)) & 0x7)
+
+static unsigned long vgic_mmio_read_its_baser(struct domain *d,
+                                              struct vgic_its *its,
+                                              paddr_t addr, unsigned int l=
en)
+{
+    uint64_t reg;
+
+    switch ( BASER_INDEX(addr) )
+    {
+    case 0:
+        reg =3D its->baser_device_table;
+        break;
+    case 1:
+        reg =3D its->baser_coll_table;
+        break;
+    default:
+        reg =3D 0;
+        break;
+    }
+
+    return extract_bytes(reg, addr & 7, len);
+}
+
+#define GITS_BASER_RO_MASK (GENMASK_ULL(52, 48) | GENMASK_ULL(58, 56))
+#define VGIC_ITS_BASER_DTE_SIZE 8
+#define VGIC_ITS_BASER_CTE_SIZE 8
+
+static void vgic_mmio_write_its_baser(struct domain *d, struct vgic_its *i=
ts,
+                                      paddr_t addr, unsigned int len,
+                                      unsigned long val)
+{
+    u64 entry_size, table_type;
+    u64 reg, *regptr, clearbits =3D 0;
+
+    /* When GITS_CTLR.Enable is 1, we ignore write accesses. */
+    if ( its->enabled )
+        return;
+
+    switch ( BASER_INDEX(addr) )
+    {
+    case 0:
+        regptr     =3D &its->baser_device_table;
+        entry_size =3D VGIC_ITS_BASER_DTE_SIZE;
+        table_type =3D GITS_BASER_TYPE_DEVICE;
+        break;
+    case 1:
+        regptr     =3D &its->baser_coll_table;
+        entry_size =3D VGIC_ITS_BASER_CTE_SIZE;
+        table_type =3D GITS_BASER_TYPE_COLLECTION;
+        clearbits  =3D GITS_BASER_INDIRECT;
+        break;
+    default:
+        return;
+    }
+
+    reg =3D update_64bit_reg(*regptr, addr & 7, len, val);
+    reg &=3D ~GITS_BASER_RO_MASK;
+    reg &=3D ~clearbits;
+
+    reg |=3D (entry_size - 1) << GITS_BASER_ENTRY_SIZE_SHIFT;
+    reg |=3D table_type << GITS_BASER_TYPE_SHIFT;
+    reg     =3D vgic_sanitise_its_baser(reg);
+
+    *regptr =3D reg;
+
+    if ( !(reg & GITS_BASER_VALID) )
+    {
+        /* Take the its_lock to prevent a race with a save/restore */
+        spin_lock(&its->its_lock);
+        switch ( table_type )
+        {
+        case GITS_BASER_TYPE_DEVICE:
+            vgic_its_free_device_list(d, its);
+            break;
+        case GITS_BASER_TYPE_COLLECTION:
+            vgic_its_free_collection_list(d, its);
+            break;
+        }
+        spin_unlock(&its->its_lock);
+    }
+}
+
+
+static unsigned long vgic_mmio_read_its_idregs(struct domain *d,
+                                               struct vgic_its *its,
+                                               paddr_t addr, unsigned int =
len)
+{
+    switch ( addr & 0xffff )
+    {
+    case GITS_PIDR0:
+        return 0x92; /* part number, bits[7:0] */
+    case GITS_PIDR1:
+        return 0xb4; /* part number, bits[11:8] */
+    case GITS_PIDR2:
+        return GIC_PIDR2_ARCH_GICv3 | 0x0b;
+    case GITS_PIDR4:
+        return 0x40; /* This is a 64K software visible page */
+    /* The following are the ID registers for (any) GIC. */
+    case GITS_CIDR0:
+        return 0x0d;
+    case GITS_CIDR1:
+        return 0xf0;
+    case GITS_CIDR2:
+        return 0x05;
+    case GITS_CIDR3:
+        return 0xb1;
+    }
+
+    return 0;
+}
+
 static void its_mmio_write_wi(struct domain *d, struct vgic_its *its,
                               paddr_t addr, unsigned int len, unsigned lon=
g val)
 {
@@ -133,28 +539,28 @@ static void its_mmio_write_wi(struct domain *d, struc=
t vgic_its *its,
=20
 static struct vgic_register_region its_registers[] =3D {
     REGISTER_ITS_DESC(GITS_CTLR,
-                        its_mmio_read_raz, its_mmio_write_wi, 4,
+                        vgic_mmio_read_its_ctlr, vgic_mmio_write_its_ctlr,=
 4,
                         VGIC_ACCESS_32bit),
     REGISTER_ITS_DESC(GITS_IIDR,
-                        its_mmio_read_raz, its_mmio_write_wi, 4,
+                        vgic_mmio_read_its_iidr, its_mmio_write_wi, 4,
                         VGIC_ACCESS_32bit),
     REGISTER_ITS_DESC(GITS_TYPER,
-                        its_mmio_read_raz, its_mmio_write_wi, 8,
+                        vgic_mmio_read_its_typer, its_mmio_write_wi, 8,
                         VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
     REGISTER_ITS_DESC(GITS_CBASER,
-                        its_mmio_read_raz, its_mmio_write_wi, 8,
+                        vgic_mmio_read_its_cbaser, vgic_mmio_write_its_cba=
ser, 8,
                         VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
     REGISTER_ITS_DESC(GITS_CWRITER,=20
-                        its_mmio_read_raz, its_mmio_write_wi, 8,
+                        vgic_mmio_read_its_cwriter, vgic_mmio_write_its_cw=
riter, 8,
                         VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
     REGISTER_ITS_DESC(GITS_CREADR,
-                        its_mmio_read_raz, its_mmio_write_wi, 8,
+                        vgic_mmio_read_its_creadr, its_mmio_write_wi, 8,
                         VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
     REGISTER_ITS_DESC(GITS_BASER0,
-                        its_mmio_read_raz, its_mmio_write_wi, 0x40,
+                        vgic_mmio_read_its_baser, vgic_mmio_write_its_base=
r, 0x40,
                         VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
     REGISTER_ITS_DESC(GITS_IDREGS_BASE,
-                        its_mmio_read_raz, its_mmio_write_wi, 0x30,
+                        vgic_mmio_read_its_idregs, its_mmio_write_wi, 0x30=
,
                         VGIC_ACCESS_32bit),
 };
=20
@@ -184,6 +590,17 @@ out:
     return ret;
 }
=20
+#define INITIAL_BASER_VALUE                                               =
     \
+    (GIC_BASER_CACHEABILITY(GITS_BASER, INNER, RaWb) |                    =
     \
+     GIC_BASER_CACHEABILITY(GITS_BASER, OUTER, SameAsInner) |             =
     \
+     GIC_BASER_SHAREABILITY(GITS_BASER, InnerShareable) |                 =
     \
+     GITS_BASER_PAGE_SIZE_64K)
+
+#define INITIAL_PROPBASER_VALUE                                           =
     \
+    (GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, RaWb) |                =
     \
+     GIC_BASER_CACHEABILITY(GICR_PROPBASER, OUTER, SameAsInner) |         =
     \
+     GIC_BASER_SHAREABILITY(GICR_PROPBASER, InnerShareable))
+
 static int vgic_its_create(struct domain *d, u64 addr)
 {
     struct vgic_its *its;
@@ -194,11 +611,25 @@ static int vgic_its_create(struct domain *d, u64 addr=
)
=20
     d->arch.vgic.its =3D its;
=20
+    spin_lock_init(&its->its_lock);
+    spin_lock_init(&its->cmd_lock);
+
     its->vgic_its_base =3D VGIC_ADDR_UNDEF;
=20
+    INIT_LIST_HEAD(&its->device_list);
+    INIT_LIST_HEAD(&its->collection_list);
+    spin_lock_init(&d->arch.vgic.its_devices_lock);
+
     d->arch.vgic.msis_require_devid =3D true;
     d->arch.vgic.has_its            =3D true;
     its->enabled                    =3D false;
+    its->domain                     =3D d;
+
+    its->baser_device_table =3D INITIAL_BASER_VALUE | ((u64)GITS_BASER_TYP=
E_DEVICE
+                                                     << GITS_BASER_TYPE_SH=
IFT);
+    its->baser_coll_table =3D INITIAL_BASER_VALUE |
+        ((u64)GITS_BASER_TYPE_COLLECTION << GITS_BASER_TYPE_SHIFT);
+    d->arch.vgic.propbaser =3D INITIAL_PROPBASER_VALUE;
=20
     vgic_register_its_iodev(d, its, addr);
=20
@@ -241,6 +672,14 @@ void vgic_v3_its_free_domain(struct domain *d)
 {
     struct vgic_its *its =3D d->arch.vgic.its;
=20
+    spin_lock(&its->its_lock);
+    spin_lock(&d->arch.vgic.its_devices_lock);
+
+    vgic_its_free_device_list(d, its);
+    vgic_its_free_collection_list(d, its);
+
+    spin_unlock(&d->arch.vgic.its_devices_lock);
+    spin_unlock(&its->its_lock);
     xfree(its);
     d->arch.vgic.its =3D NULL;
 }
diff --git a/xen/arch/arm/vgic/vgic-mmio.h b/xen/arch/arm/vgic/vgic-mmio.h
index 0a8deb46ba..edf8665cda 100644
--- a/xen/arch/arm/vgic/vgic-mmio.h
+++ b/xen/arch/arm/vgic/vgic-mmio.h
@@ -146,4 +146,11 @@ void vgic_mmio_write_config(struct vcpu *vcpu,
=20
 unsigned int vgic_v2_init_dist_iodev(struct vgic_io_device *dev);
=20
+/* extract @num bytes at @offset bytes offset in data */
+unsigned long extract_bytes(uint64_t data, unsigned int offset,
+			    unsigned int num);
+
+uint64_t update_64bit_reg(u64 reg, unsigned int offset, unsigned int len,
+		     unsigned long val);
+
 #endif
diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
index 791c91ebb3..a14b519f77 100644
--- a/xen/arch/arm/vgic/vgic.h
+++ b/xen/arch/arm/vgic/vgic.h
@@ -80,6 +80,11 @@ bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, uni=
on hsr hsr);
 unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev);
 int vgic_v3_set_redist_base(struct domain *d, u32 index, u64 addr, u32 cou=
nt);
 int vgic_register_redist_iodev(struct vcpu *vcpu);
+u64 vgic_sanitise_field(u64 reg, u64 field_mask, int field_shift,
+			u64 (*sanitise_fn)(u64));
+u64 vgic_sanitise_shareability(u64 field);
+u64 vgic_sanitise_inner_cacheability(u64 field);
+u64 vgic_sanitise_outer_cacheability(u64 field);
 #else
 static inline void vgic_v3_fold_lr_state(struct vcpu *vcpu)
 {
--=20
2.34.1

