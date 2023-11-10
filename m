Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3086E7E7C4C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630306.983114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R43-0004La-VY; Fri, 10 Nov 2023 12:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630306.983114; Fri, 10 Nov 2023 12:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R43-000483-Hk; Fri, 10 Nov 2023 12:56:47 +0000
Received: by outflank-mailman (input) for mailman id 630306;
 Fri, 10 Nov 2023 12:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3y-0001y1-C2
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:42 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95826d2d-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:38 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIeei019156; Fri, 10 Nov 2023 12:56:28 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9kkyram6-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:28 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:22 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:22 +0000
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
X-Inumbo-ID: 95826d2d-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHolDqAoPGsSiuOnDTQzccu5qviOzv0V6YzlUR4TiY4tVkq3B9Iw/na4pYcJ+V+IaA1iQhKotg74XO3VnN1YhqNJtNe3H3q2PrEzjYAOI7UYGiQaGV80C74qtAK3WC+G60RdQy5xAklccCEi4eUKaOPbrLzocAiwcTBrEfl3vMwNM55Qe0yzxaEVVphLbNhU6Bqe12ZP6VAMpc52swTVfVur43ub4uE6gRrMgnT/SClypbZe5rpTG3GzXWP4rB+zUHoauNwcr9CUaVMcpk06fPdW6eil/r4GT+skxAC1Rq6rc1ytfIgg+KQOhGZjNiavT54pbmUmj37Hl11owaGcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g73T9hy9iFNbKytEIvSzNfjBM9cU9v8ai1HR4xSZP1Y=;
 b=HlZVRJu3sJj46pt4PI0uPQW3LUg8UDYjuOtKc4HOz6dl7uWqLrQF9TIkOXWorsM8iPIeFK3MbRoDCqP1d9EYhIxomVlmCuKTDBRFachm44bF7IyVmOsBUM6+7C46E9rzNw5sk7HXdmBEEmxPDXReuTS2xtMDmDEdR6t2x5iKdkyeJqkkxcE21fO6XQZIyLXBn3y910LAFRtQFigt5k4wuqyAgUxHos2OC2DpdVbGQUai3RkFHCd3JYp4QLmBKb3JStEwpm0omgfWP2wvp5MPd9IGe6yt9z2Z8rVcjqycxZ3uEQhiQck6yab1kuvjynxvbNlSkNSvlYn4kGzhl0Awgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g73T9hy9iFNbKytEIvSzNfjBM9cU9v8ai1HR4xSZP1Y=;
 b=rRMA99oiDhKKaPwttM9zQ+sLkt/s1uQMrdnzbSQYI4ffS5+ahiQJJ6cOmlKfzBLsi38tjcEMhjr5ZtFW08b2SJ439HCMsXH9I39ErzGYxpEX3kJhL24SyGFlosv8EjRPZqEKBV5nt+QCjJjB8UCQD+P6slb2ek+DPzro5LOzzMIf7YYRkBcc5uoV1lreUgldrQIxrH0nE0aV0GffvHn+NsDs6fbtWI3ghrTXELtkbjTBViG+DZh09r+QMpe66VA6nS63nLNQ1A2d2t9R69DBxebOLwv6yXNnjwkW9mmOIpitAwJyPNCsjm9oNf0REM+IZzY1GcimQWWGV7jB2+GvoA==
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
Subject: [XEN PATCH v2 14/25] arm: new VGIC: its: Introduce ITS emulation file
 with MMIO framework
Thread-Topic: [XEN PATCH v2 14/25] arm: new VGIC: its: Introduce ITS emulation
 file with MMIO framework
Thread-Index: AQHaE9VNozwFjqvkNU+OWnjzi9IBUg==
Date: Fri, 10 Nov 2023 12:56:20 +0000
Message-ID: 
 <86c18cb30b6dbaff9561c2ec1def9f8389f33ebf.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: af2d4fe7-1c52-4561-1d15-08dbe1ec70e7
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 920bhS4uNTNpIhc9CFRUyV5cYMfIV0ygpaIYqlT1nwMqoMv4agT8WjvwXkBNFAmxdRczTZb5pBZJfYpPHqcSb1oryrsDJAqdzcoDpzYshY4aQs3EplbJAwvBh7kOZsC6+m27th2rWS4w6gIs6rB8xfZa7XhxlxUwsix9J73oOx0G2e3h36hTIsdT1FvhDQGVIz7oUgOER3dpk8oam22/JcXtblqFtrhMbHvlvo2pb/gB57Yjf7Y+JODBXj8kZ/xOKKVYmBReIQmmcGszK/tc5Wniz1AA2kf+XahwXgVxVYv2XBJKR8LmFHsFWcFy2z3ytVQ1CUr8qk2TSKgsIj+Z7gnugAq9/eGDwDibaPjjXJCBZR6bgAmGAay0gnt/cI3hatUz8xB+3+VTrMpav2Gux0cQuW0v+8rGLalYNrinQchcGuuLUTDtibmZ3RsjpyhEe1IJB2wTJ/NaPM8hXCouqydPdp+YJ2NzaGGqgHKMFXc5RXEVLTyeP/HNlwXzo1Pn8nBFw7nQIQGkex6WuIJAq7E81cZUNrKDwkHO3qCxnh5/TUTFj7SGta59IHL6lGReHDlt8ODcmu7kBwOnKHg5CU1eV0xq8NJO6kc4kkxGiZe6kXnpZ2u29+ToM/DNbHwo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(30864003)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?RuRDmU2DMJZRQaAbOtyGFtNUyr/nqGWJK+hpmwHNBoYgKe/pPd0MJvFlkm?=
 =?iso-8859-1?Q?hJoF7X7Bgpyp4zum2HJ3kt7bqwL4c5OXQTTpcS2iyre7dRiHvv5PVM/FJs?=
 =?iso-8859-1?Q?wiLYM0veXZ+JGHxVyZNMHcbPY2VSaQy2iLQZAsSgIJ5u2CuRghmc+ktf/s?=
 =?iso-8859-1?Q?+Gic3bHAli8AUeouRBlmDvHhxizSiSKFi35oex2i4yu/EpdnDxBIOkVwVl?=
 =?iso-8859-1?Q?XAE74Wu8XMU7Y0ztNCXkhqoI30/Dnx6J86fMrJAl7Y95NEL6Ju077JGVS6?=
 =?iso-8859-1?Q?RhLctkXUuYpQAHqnDBoi/ZA9/PL51Tn6q70sDn+fryvVlXxnUbAcmlQyFa?=
 =?iso-8859-1?Q?Sx+p6f2n/LCp4XZz7/QUHAt17p3L92BUDjdTSskTqb8sih79ylcyaOeYYZ?=
 =?iso-8859-1?Q?HM/q8JMvUmsOq57mUeYQsKxXRElOoQNvnD4lZzzPXM9u7aETaBxPx4wHPS?=
 =?iso-8859-1?Q?qNMkSIZOy1WdG8yRyn2L6bjKgulfTt9y5K8p7oYyul8nQRwFP/MGrcII4r?=
 =?iso-8859-1?Q?62rf760y879+xnUjc9ROLNiUTXuSTuMm3JRPzQNzgIv0cmLJ3Xm/9kPxMa?=
 =?iso-8859-1?Q?fApC5+wFBM57eHKa5m6RfifhbdFQqFaLDh+xuLsfA31NAarZ7SFbQ/c5qm?=
 =?iso-8859-1?Q?f/lwAIzcSpzJVul7wtK4wdRgsk5GviP4XeRlsyRuNe/YlV6WliroLpuuAt?=
 =?iso-8859-1?Q?02a4sy3EbeehkwNbqN+/kKcbBwF2K9uRpfx9mL5zqkiKqCmEofEMNZYgSn?=
 =?iso-8859-1?Q?GALQ2DI9zHZ/v3Q/giFRnjCvr6oLpsGiM3xl8NU/5Kxmf1HlGTtNVqohkB?=
 =?iso-8859-1?Q?d0ro860KZ4fp8I9GIQAsRevPFsf4QBV6x8ZLPaQZ4gZ4q8/wOlNf1YVppV?=
 =?iso-8859-1?Q?+h+70DjDBxw5Ar08D+rkYuZyvDzx1493wmDLOtOQY/gs917RBbCh7h7rox?=
 =?iso-8859-1?Q?NgHouBMKD3jIZ+PZTa4bEyUR22zeLuJLfzvBuroQpaVZlLXKZGWDSwPhL5?=
 =?iso-8859-1?Q?XWQu353YI7jdwiHbu5U4uWedJivwJ2qZHOlw6N6ZfbQbFblDwOm+MfbAMp?=
 =?iso-8859-1?Q?UohNAgh8nJat0PXf3IffLHsx6nju/XQnszV0CH6z4y2OcJA9DrTeEwdlk5?=
 =?iso-8859-1?Q?q+xrTpLJbReT3LsVtH+utNRmOKn15H1KAo1Jrdiq6DA+3AcKdHJG8YhilE?=
 =?iso-8859-1?Q?Imz1jdnJBc+DV22kZK3s/LGgXNocMwZZIYDQmgkpEdkUUqJcXHqC1m8eLL?=
 =?iso-8859-1?Q?A4n8yhhinjmMgmvOvXKBJZxeN9BQ9pEEOQXwJ0czX6cF40Ukw5JXj+F+nO?=
 =?iso-8859-1?Q?Rq/zUOtwXPpXry5GJ+3U0d51W1IjZukSiN9UOiLm8OtmeoAtKsG1T2ncdT?=
 =?iso-8859-1?Q?fxcy1DqvjoeIO6pvHXp+Fy2630OJlgXUOG/gJJQ20LqO/arbx0ZJ3xsNMa?=
 =?iso-8859-1?Q?PTNbX0c0xjM4sR0jjA5BuI/CF/EPYBOx7A7NCLGBRMM5dpFDGQsVfVTcB1?=
 =?iso-8859-1?Q?u1Ms86J6xtv9KMmtFMbL+hxe3wUyOOklpf09zkMHrUnVlHbLDmhwOdvY6A?=
 =?iso-8859-1?Q?nKGAk4Y4nQl40+i6fjnwuPl/1p7PAsR+qrlEPli/QjAKgzaGcBDDShu8jY?=
 =?iso-8859-1?Q?XKB13ueg8rr2b3+EAP25vuHo3lG9Wcddx562O5TBhKtEVgDvb/cLfk3A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af2d4fe7-1c52-4561-1d15-08dbe1ec70e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:20.7063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8te8cfwF6UVJd/GRkDyaBtJJ+L1b8gAPYvBwwmPA4Ac7ILDOwx7gjNbGsrU5anGm691YUzyOuqus1HlgAchqKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-GUID: OH3ZP7gXEdpAkyZShRcYZXE7tLCTN1Yo
X-Proofpoint-ORIG-GUID: OH3ZP7gXEdpAkyZShRcYZXE7tLCTN1Yo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

The ARM GICv3 ITS emulation code goes into a separate file, but needs
to be connected to the GICv3 emulation, of which it is an option.
The ITS MMIO handlers require the respective ITS pointer to be passed in,
so we amend the existing VGIC MMIO framework to let it cope with that.
Also we introduce the basic ITS data structure and initialize it, but
don't return any success yet, as we are not yet ready for the show.

Based on Linux commit 59c5ab40989afa by 59c5ab40989afa

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/gic_v3_defs.h |   3 +
 xen/arch/arm/include/asm/gic_v3_its.h  |   1 +
 xen/arch/arm/include/asm/new_vgic.h    |  13 ++
 xen/arch/arm/vgic/vgic-its.c           | 160 +++++++++++++++++++++++++
 xen/arch/arm/vgic/vgic-mmio-v3.c       |  52 +++++++-
 xen/arch/arm/vgic/vgic-mmio.c          |   6 +
 xen/arch/arm/vgic/vgic-mmio.h          |  11 ++
 7 files changed, 245 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/vgic/vgic-its.c

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 1e81687818..3f1f59d1c7 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -112,6 +112,9 @@
 #define GICR_NSACR                   (0x0E00)
=20
 #define GICR_CTLR_ENABLE_LPIS        (1U << 0)
+#define GICR_CTLR_CES                (1UL << 1)
+#define GICR_CTLR_IR                 (1UL << 2)
+#define GICR_CTLR_RWP                (1UL << 3)
=20
 #define GICR_TYPER_PLPIS             (1U << 0)
 #define GICR_TYPER_VLPIS             (1U << 1)
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index f61a37a8fa..4e857cac1a 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -35,6 +35,7 @@
 #define GITS_BASER5                     0x128
 #define GITS_BASER6                     0x130
 #define GITS_BASER7                     0x138
+#define GITS_IDREGS_BASE                0xffd0
 #define GITS_PIDR2                      GICR_PIDR2
=20
 /* Register bits */
diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm=
/new_vgic.h
index b037b6cf61..ec2882dcf1 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -34,6 +34,7 @@
 #define VGIC_MIN_LPI            8192
 #define VGIC_V3_DIST_SIZE       SZ_64K
 #define VGIC_V3_REDIST_SIZE     (2 * SZ_64K)
+#define VGIC_V3_ITS_SIZE        (2 * SZ_64K)
=20
 #define irq_is_ppi(irq) ((irq) >=3D VGIC_NR_SGIS && (irq) < VGIC_NR_PRIVAT=
E_IRQS)
 #define irq_is_spi(irq) ((irq) >=3D VGIC_NR_PRIVATE_IRQS && \
@@ -95,6 +96,7 @@ struct vgic_irq {
 enum iodev_type {
     IODEV_DIST,
     IODEV_REDIST,
+    IODEV_ITS,
 };
=20
 struct vgic_redist_region {
@@ -111,6 +113,16 @@ struct vgic_io_device {
     const struct vgic_register_region *regions;
     enum iodev_type iodev_type;
     unsigned int nr_regions;
+    struct vgic_its *its;
+};
+
+struct vgic_its {
+    /* The base address of the ITS control register frame */
+    paddr_t vgic_its_base;
+
+    bool enabled;
+    struct vgic_io_device iodev;
+    paddr_t doorbell_address;
 };
=20
 struct vgic_dist {
@@ -150,6 +162,7 @@ struct vgic_dist {
     struct vgic_io_device   dist_iodev;
=20
     bool                has_its;
+    struct vgic_its     *its;
=20
     /*
      * Contains the attributes and gpa of the LPI configuration table.
diff --git a/xen/arch/arm/vgic/vgic-its.c b/xen/arch/arm/vgic/vgic-its.c
new file mode 100644
index 0000000000..0ae6048456
--- /dev/null
+++ b/xen/arch/arm/vgic/vgic-its.c
@@ -0,0 +1,160 @@
+/*
+ * Imported from Linux ("new" KVM VGIC) and heavily adapted to Xen.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/sched.h>
+#include <xen/guest_access.h>
+#include <xen/sizes.h>
+#include <xen/err.h>
+#include <xen/list_sort.h>
+#include <asm/page.h>
+#include <asm/new_vgic.h>
+#include <asm/gic_v3_defs.h>
+#include <asm/gic_v3_its.h>
+
+#include "vgic.h"
+#include "vgic-mmio.h"
+
+static unsigned long its_mmio_read_raz(struct domain *d, struct vgic_its *=
its,
+                              paddr_t addr, unsigned int len)
+{
+    return 0;
+}
+
+static void its_mmio_write_wi(struct domain *d, struct vgic_its *its,
+                              paddr_t addr, unsigned int len, unsigned lon=
g val)
+{
+    /* Ignore */
+}
+
+#define REGISTER_ITS_DESC(off, rd, wr, length, acc)                       =
     \
+    {                                                                     =
     \
+        .reg_offset =3D off, .len =3D length, .access_flags =3D acc, .its_=
read =3D rd, \
+        .its_write =3D wr,                                                =
       \
+    }
+
+static struct vgic_register_region its_registers[] =3D {
+    REGISTER_ITS_DESC(GITS_CTLR,
+                        its_mmio_read_raz, its_mmio_write_wi, 4,
+                        VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_IIDR,
+                        its_mmio_read_raz, its_mmio_write_wi, 4,
+                        VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_TYPER,
+                        its_mmio_read_raz, its_mmio_write_wi, 8,
+                        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_CBASER,
+                        its_mmio_read_raz, its_mmio_write_wi, 8,
+                        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_CWRITER,=20
+                        its_mmio_read_raz, its_mmio_write_wi, 8,
+                        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_CREADR,
+                        its_mmio_read_raz, its_mmio_write_wi, 8,
+                        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_BASER0,
+                        its_mmio_read_raz, its_mmio_write_wi, 0x40,
+                        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_IDREGS_BASE,
+                        its_mmio_read_raz, its_mmio_write_wi, 0x30,
+                        VGIC_ACCESS_32bit),
+};
+
+static int vgic_register_its_iodev(struct domain *d, struct vgic_its *its,
+                                   u64 addr)
+{
+    struct vgic_io_device *iodev =3D &its->iodev;
+    int ret                      =3D 0;
+
+    if ( !IS_VGIC_ADDR_UNDEF(its->vgic_its_base) )
+    {
+        ret =3D -EBUSY;
+        goto out;
+    }
+
+    its->vgic_its_base    =3D addr;
+    its->doorbell_address =3D addr + ITS_DOORBELL_OFFSET;
+    iodev->regions        =3D its_registers;
+    iodev->nr_regions     =3D ARRAY_SIZE(its_registers);
+
+    iodev->base_fn        =3D gaddr_to_gfn(its->vgic_its_base);
+    iodev->iodev_type     =3D IODEV_ITS;
+    iodev->its            =3D its;
+    register_mmio_handler(d, &vgic_io_ops, its->vgic_its_base, VGIC_V3_ITS=
_SIZE,
+                          iodev);
+out:
+    return ret;
+}
+
+static int vgic_its_create(struct domain *d, u64 addr)
+{
+    struct vgic_its *its;
+
+    its =3D xzalloc(struct vgic_its);
+    if ( !its )
+        return -ENOMEM;
+
+    d->arch.vgic.its =3D its;
+
+    its->vgic_its_base =3D VGIC_ADDR_UNDEF;
+
+    d->arch.vgic.msis_require_devid =3D true;
+    d->arch.vgic.has_its            =3D true;
+    its->enabled                    =3D false;
+
+    vgic_register_its_iodev(d, its, addr);
+
+    its->doorbell_address =3D addr + ITS_DOORBELL_OFFSET;
+
+    return 0;
+}
+
+/*
+ * For a hardware domain, this will iterate over the host ITSes
+ * and map one virtual ITS per host ITS at the same address.
+ */
+int vgic_v3_its_init_domain(struct domain *d)
+{
+    int ret;
+
+    if ( is_hardware_domain(d) )
+    {
+        struct host_its *hw_its;
+
+        list_for_each_entry(hw_its, &host_its_list, entry)
+        {
+            /*
+             * For each host ITS create a virtual ITS using the same
+             * base and thus doorbell address.
+             * Use the same number of device ID and event ID bits as the h=
ost.
+             */
+            ret =3D vgic_its_create(d, hw_its->addr);
+            if ( ret )
+                return ret;
+            else
+                d->arch.vgic.has_its =3D true;
+        }
+    }
+
+    return 0;
+}
+
+void vgic_v3_its_free_domain(struct domain *d)
+{
+    struct vgic_its *its =3D d->arch.vgic.its;
+
+    xfree(its);
+    d->arch.vgic.its =3D NULL;
+}
diff --git a/xen/arch/arm/vgic/vgic-mmio-v3.c b/xen/arch/arm/vgic/vgic-mmio=
-v3.c
index 2fb44cfe6a..4bf8c21203 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v3.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v3.c
@@ -22,6 +22,16 @@
 #include "vgic.h"
 #include "vgic-mmio.h"
=20
+bool vgic_has_its(struct domain *d)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+
+    if ( dist->version !=3D GIC_V3 )
+        return false;
+
+    return false;
+}
+
 static struct vcpu *mpidr_to_vcpu(struct domain *d, unsigned long mpidr)
 {
     struct vcpu *vcpu;
@@ -381,6 +391,46 @@ static unsigned long vgic_mmio_read_v3_idregs(struct v=
cpu *vcpu, paddr_t addr,
     return 0;
 }
=20
+static unsigned long vgic_mmio_read_v3r_ctlr(struct vcpu *vcpu, paddr_t ad=
dr,
+                                             unsigned int len)
+{
+    struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
+    unsigned long val;
+
+    val =3D atomic_read(&vgic_cpu->ctlr);
+    val |=3D GICR_CTLR_IR | GICR_CTLR_CES;
+
+    return val;
+}
+
+static void vgic_mmio_write_v3r_ctlr(struct vcpu *vcpu, paddr_t addr,
+                                     unsigned int len, unsigned long val)
+{
+    struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
+    uint32_t ctlr;
+
+    if ( !vgic_has_its(vcpu->domain) )
+        return;
+
+    if ( !(val & GICR_CTLR_ENABLE_LPIS) )
+    {
+        /*
+		 * Don't disable if RWP is set, as there already an
+		 * ongoing disable. Funky guest...
+		 */
+        ctlr =3D atomic_cmpxchg(&vgic_cpu->ctlr, GICR_CTLR_ENABLE_LPIS,
+                              GICR_CTLR_RWP);
+        if ( ctlr !=3D GICR_CTLR_ENABLE_LPIS )
+            return;
+    }
+    else
+    {
+        ctlr =3D atomic_cmpxchg(&vgic_cpu->ctlr, 0, GICR_CTLR_ENABLE_LPIS)=
;
+        if ( ctlr !=3D 0 )
+            return;
+    }
+}
+
 bool vgic_lpis_enabled(struct vcpu *vcpu)
 {
     struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
@@ -584,7 +634,7 @@ static const struct vgic_register_region vgic_v3_dist_r=
egisters[] =3D {
 static const struct vgic_register_region vgic_v3_rd_registers[] =3D {
     /* RD_base registers */
     REGISTER_DESC_WITH_LENGTH(GICR_CTLR,
-        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
+        vgic_mmio_read_v3r_ctlr, vgic_mmio_write_v3r_ctlr, 4,
         VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICR_STATUSR,
         vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
index 1c3f861887..7a28be53bc 100644
--- a/xen/arch/arm/vgic/vgic-mmio.c
+++ b/xen/arch/arm/vgic/vgic-mmio.c
@@ -570,6 +570,9 @@ static int dispatch_mmio_read(struct vcpu *vcpu, mmio_i=
nfo_t *info,
     case IODEV_REDIST:
         data =3D region->read(iodev->redist_vcpu, addr, len);
         break;
+    case IODEV_ITS:
+        data =3D region->its_read(vcpu->domain, iodev->its, addr, len);;
+        break;
     }
=20
     memcpy(r, &data, len);
@@ -598,6 +601,9 @@ static int dispatch_mmio_write(struct vcpu *vcpu, mmio_=
info_t *info,
     case IODEV_REDIST:
         region->write(iodev->redist_vcpu, addr, len, data);
         break;
+    case IODEV_ITS:
+        region->its_write(vcpu->domain, iodev->its, addr, len, data);
+        break;
     }
=20
     return 1;
diff --git a/xen/arch/arm/vgic/vgic-mmio.h b/xen/arch/arm/vgic/vgic-mmio.h
index 3566cf237c..0a8deb46ba 100644
--- a/xen/arch/arm/vgic/vgic-mmio.h
+++ b/xen/arch/arm/vgic/vgic-mmio.h
@@ -21,10 +21,21 @@ struct vgic_register_region {
     unsigned int len;
     unsigned int bits_per_irq;
     unsigned int access_flags;
+
+    union {
     unsigned long (*read)(struct vcpu *vcpu, paddr_t addr,
                           unsigned int len);
+    unsigned long (*its_read)(struct domain *d, struct vgic_its *its,
+                    paddr_t addr, unsigned int len);
+    };
+
+    union {
     void (*write)(struct vcpu *vcpu, paddr_t addr,
                   unsigned int len, unsigned long val);
+    void (*its_write)(struct domain *d, struct vgic_its *its,
+                paddr_t addr, unsigned int len,
+                unsigned long val);
+    };
 };
=20
 extern struct mmio_handler_ops vgic_io_ops;
--=20
2.34.1

