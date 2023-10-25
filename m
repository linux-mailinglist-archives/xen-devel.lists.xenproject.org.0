Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804ED7D67FC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 12:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622802.969977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvau5-00039I-Sh; Wed, 25 Oct 2023 10:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622802.969977; Wed, 25 Oct 2023 10:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvau5-00036f-Nw; Wed, 25 Oct 2023 10:14:21 +0000
Received: by outflank-mailman (input) for mailman id 622802;
 Wed, 25 Oct 2023 10:14:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TDEh=GH=epam.com=prvs=46626b3b1e=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1qvau4-00035s-0W
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 10:14:20 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40e5ab53-731f-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 12:14:17 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39P6fZXm019492; Wed, 25 Oct 2023 10:13:09 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3txjfcj00w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Oct 2023 10:13:08 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by PAVPR03MB9229.eurprd03.prod.outlook.com (2603:10a6:102:32a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.29; Wed, 25 Oct
 2023 10:13:03 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::eecf:7ef0:b4b5:fc42]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::eecf:7ef0:b4b5:fc42%4]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 10:13:03 +0000
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
X-Inumbo-ID: 40e5ab53-731f-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnDPM11Of16DeACkBDn+h0yunzvXfhcvMOQiRoOaJfH2Df9OJNYtRmdoE0uR2R7qgpkmp+QDn/nQ/rFsyuz6TwVuKAQij+ZP46xj1QbAXF49UVDiXkUd4Ah5p9ROmAL17CHYOOe80JAerqqNwRlVEAjGleJ0po2u9Z0wKZ0etH3oqZ2sYd9KTIlNayYfHgWcrQh+cB0tcp6VqWtDlQrKh11KrIfru1m5U94prBF+RkEvHL5GxI7acmYZQfhXc8AcTcW6S4VzNyZ9P6P+XcEBLP5OaP2xt64sGC2Qk0pl6aQsbmMV9aHox5TpNWB725l2AchegXqD/UwhyFKJnIRTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTYEkPoJAbuG/asQRALcXJvaTc2lqBFDVLfqmc8UUZw=;
 b=kNNnswN107PBg/tsBCcNmuDuDEPEsG6fUcULbb48ZEsL6O3pDdADPe7MJBEAN6VIZ1pXjVmBLNuOuzHRThFjlLxLqhbxPIOIv2SyYjQwJvBqEDUrgtOXNvG+1pnNBOBeErFVAsE8i6IuhIU492KxRUCLhik5B+6oEarbSc7/nHiqaE6rrxSlYl5EA97VguvL4FtEu7n43SBhj98lzy2sTZyZJ8PSvou7jGmrtDVDr6zOXi4SHwCp6hO6uk8DisuU7y8dipe3aURxnrMSAncH/F4qn5QDHGcl9AKQVD9XEElUrDUwaDUgF5UmQsk1BzruB6CZSE5+x7cCCgVWq9dNEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTYEkPoJAbuG/asQRALcXJvaTc2lqBFDVLfqmc8UUZw=;
 b=XS3dfR0IBYvEPA2ZVaTuR5oQcpXpdnuhYBGubNQEDCoxKAM766QL9+sOTqQjPD0HPcU8n5kXgOKNn/4aabHtXVUWXpr6i8BKGWpeKAfvVpQW2SSUlLw35omsBrCsRRlHx5GKexYPhLHOkNXFNBm4lgu2dpV3n0OieYHR+u3zr5ZiEv5flSC6sg1cQLhylFGwV0VfCbAu3Pl1L9MSZGYtWA6JKDweRzRsyEi/7IpLkZABUKI65+Fym/xjSRn6Usw8YpjYTs4NAdfartEiKXQ/6PdZ/PTs7kh8RlB2RaSbeqLJ08IzAkeX6CXAIBWFoZhxqyto3S4xlLnS/l4tgseWhA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 3/4] arm/new vgic: Add GICv3 support for NEW VGIC
Thread-Topic: [XEN PATCH 3/4] arm/new vgic: Add GICv3 support for NEW VGIC
Thread-Index: AQHaByvWJmV5C4KQO0yIb07J1Qv6yw==
Date: Wed, 25 Oct 2023 10:13:03 +0000
Message-ID: 
 <102d39655bec312490acd5abda966b66e6962da7.1698225630.git.mykyta_poturai@epam.com>
References: <cover.1698225630.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1698225630.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|PAVPR03MB9229:EE_
x-ms-office365-filtering-correlation-id: d76c6731-f42e-41a0-3458-08dbd542f99b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PvvXhPQXG9Vi1SkBJ3cQNccK3sdJI6RLkiM5Jb436UkL57VFMduYEn+oHCJKK+9X1oQ5EoSo9nicZytlc9oqlfVBY5iu6yNzl2tUUZYccX//gk+tnZBTcVPyJcTZjroKL3EFqyaxMobZObT2dkY6f0/HvI46RlFjWftRdO/p1TdZHB9PdU6M9jdd6LSqicxKmEjuxMBCZcCb8pcC9vKezCa7riZ3572BkI0cImJaOECWmP39x4J3grG7Hs/RIgrP3q6ZA9WhuAtNyzHGBuhf89oqUPOIltrnkeJcRl2i7GAU84/EJfjggyWw/RJ+wXRqOVvIfa7brZmMieZ+x3sMlwTfzLXZvqQmPAxg1+U9PEDXWt2hCGE62fb7zhRvE45oyE27RA7VceIbfa+psQHBHyEHOTOQSSUT182n3rsuwXQjrswhdBrjBpHbbFHLhM+dZjl/PLlGakR1UTp86w1D3Lm2HB3NHo96dO0fVuQZsBlcinmf1T+swC3OP1ab7/Jb1TWEfOsaT19vxfs0CKTJX7q+rEvsPbRbf+7JOwXBjTSgaWNAYVXa2Ac6X4dJH4TOmu+qkiftTq6omUdI9jhkcBLumzrAvRQrl7ijYeg42TbPYSJTQTWKCLtMwvVDJTwSCVO562qABtRyQzcDlQ9wDQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(38070700009)(26005)(66899024)(38100700002)(2906002)(30864003)(41300700001)(86362001)(5660300002)(122000001)(8676002)(8936002)(36756003)(4326008)(2616005)(478600001)(6916009)(66556008)(107886003)(71200400001)(6506007)(64756008)(54906003)(91956017)(316002)(66476007)(76116006)(66946007)(66446008)(83380400001)(6486002)(6512007)(2004002)(559001)(579004)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?zmbMJ0ZRORs/WsnH81ub5/3aIRqiQlnB01H5TfJtuIBIpEq8Pl9eEcauIT?=
 =?iso-8859-1?Q?lfXAyepHlpqi95YiLOkuO916MG9XD98a3fH/FQhHSxZ0kI1fuk6Z6kDwrY?=
 =?iso-8859-1?Q?z9j9tI/BvxkTXyPXsUr7+2QQRb7EsU/A46KUBXSB3twB6J03eEswxtkE8h?=
 =?iso-8859-1?Q?KYnJ8UXI1msg2jVch2aibwdFPyRGn6lHOLZjwzDdyrz3zNLmkzxOjnt776?=
 =?iso-8859-1?Q?O+sG8qomgLD4tssO0WJ2KZLFuhQZWhTHxGVkQqZ7emFNL3HuOLMQnNuCLZ?=
 =?iso-8859-1?Q?EMrA3Gop5O2lQGOXj69uQlWjYCZIPfqLH8RbAffjHxaozntY55hAhig4Zl?=
 =?iso-8859-1?Q?Qzrq++PRUw9+1SH9R9g/9+PHomTE44x83cChif/IdDIUooe8FQN4QWrsWw?=
 =?iso-8859-1?Q?qI3qCKh9/Cn0GS9TVRDB1nTtUQr7lMxoAKf+jLLWKgYa2HFT2Q+2cGRZ2f?=
 =?iso-8859-1?Q?ZzsTsqC3kXP+NYySysbY41+rXO4wCsEzdkZqELNLVock5MAxtmO7jJfPLs?=
 =?iso-8859-1?Q?EcQZw2ik7HOwtD+fElO4Yxl7MFQ6ZpzFzrJSZGoBtDCCokC11g1Hpfzpd+?=
 =?iso-8859-1?Q?D9euneafEMn0BiKWNngcuQFj+pdjrZGyBrD11E2TEhf8MB+wMdDkW/LrS5?=
 =?iso-8859-1?Q?MxNoI2DXAJH4jNHl5AeCcxPCd++E3tfuwhAXgItpwFmvi/oPbNSbGogaD5?=
 =?iso-8859-1?Q?j/GtyXYBVB+nCeUPEgxfKXsYFTCW+zUf1JV0TBc7wiglaLjNIhznV9WIJ+?=
 =?iso-8859-1?Q?khSTqEguJCKUU6B1WJPv34bcd6u0QxRI8dHTdJwyIWhbwW/Q8PhwUQ7clk?=
 =?iso-8859-1?Q?i1PQLHXq1QTDEtjuwO2og5ol2fSHhYpQtaSF/CGHcr/i4an84JwxJgYy43?=
 =?iso-8859-1?Q?n4IhQKE5ViLinqfkyoJLG54T/3oD35fsUgseZLOw63dun9QffAz7cmuEb4?=
 =?iso-8859-1?Q?oOKiqghtNlVyoqGrNesVyg1bcRn8IpzPMMF/yJtHI1LvkZGgTamYXC6xK9?=
 =?iso-8859-1?Q?lMv4x0w8cvR1QVgb63CEYcD87N/if9QlUHICjksuksYX9Hfgv+HF0sToLZ?=
 =?iso-8859-1?Q?ZLme9D69lDdODGIpcA4x6wlBwKx0PMLXBbCvsQ0YkzryqByOckDkzorook?=
 =?iso-8859-1?Q?/Mz9TkT4O4M2ZM79RkSnB831CF6P1spI2vjf/It0Md8d7PqSvKhFQ7HiPx?=
 =?iso-8859-1?Q?EcPfZ4a08TaGwZsUovcENm0MZzMrjJ0Zz3ZHhuYxl4i6K+30NHLILT5rOX?=
 =?iso-8859-1?Q?pf6RqUIZZBWOpUnpEXH3gpP7nx2KAK4GQFMYjhSqkF5QE2l661bX57WdYM?=
 =?iso-8859-1?Q?yOUKMVDuzUGfakC1uPUY/C88eXIXtTKtYc/ZempLyShPOvHsQuCxXz7Vji?=
 =?iso-8859-1?Q?aR1O/4RuA0SY3dmhdT5nwCDcbWLtIHA/KoWhD8gsqduzd9DY2kJ8Wlo3sC?=
 =?iso-8859-1?Q?N0B/AYwVJoHPEx+K1YSF5MhLmW4AbGyfheprl4AJhC1XHveFmO5nHn/nlK?=
 =?iso-8859-1?Q?iLTx9qQovdRqr/IS8gOkWkZ0VvegeC5cf9OS1SBGpUXO1Soif4pqBR1E3M?=
 =?iso-8859-1?Q?EP1Qtl9A0guVF3qKFh+cQuIATv1brfpt2I0GoOZZhPsTxONSnhmGDlAlT5?=
 =?iso-8859-1?Q?BYfQBKvPJRASpteZdwm73PP8heYKUwRUH1duaWvPOAfFFQg4yuoYVENw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d76c6731-f42e-41a0-3458-08dbd542f99b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 10:13:03.2795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h9+wM9NfzOizcIZAWm95NhRO/GPUDdFcQHqU+5p48bGG8qv18tk3lzMO+PVoUCyjeCPoILOwEiIoyOKpASqwYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9229
X-Proofpoint-GUID: JBhHpW5f4GafiXVQFX2POkb4ofQQz0YR
X-Proofpoint-ORIG-GUID: JBhHpW5f4GafiXVQFX2POkb4ofQQz0YR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_01,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310250086

Add support for basic GICv3 functionality to new vgic. The code is
ported from Kernel version 6.0. The distributor, redistributor and
CPU interface are ported and hooked up to the XEN interfaces.
The code is adapted to Xen coding style and conventions.

Remove !NEW_VGIC dependency from GIC_V3 config.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/Kconfig                   |   1 -
 xen/arch/arm/domain_build.c            |  23 +-
 xen/arch/arm/gic-v3.c                  |   9 +
 xen/arch/arm/include/asm/gic_v3_defs.h |  13 +-
 xen/arch/arm/include/asm/new_vgic.h    |  32 +-
 xen/arch/arm/vgic/Makefile             |   2 +
 xen/arch/arm/vgic/vgic-init.c          |  12 +-
 xen/arch/arm/vgic/vgic-mmio-v3.c       | 940 +++++++++++++++++++++++++
 xen/arch/arm/vgic/vgic-mmio.c          |  18 +
 xen/arch/arm/vgic/vgic-mmio.h          |  10 +
 xen/arch/arm/vgic/vgic-v3.c            | 383 ++++++++++
 xen/arch/arm/vgic/vgic.c               |  60 +-
 xen/arch/arm/vgic/vgic.h               |  48 +-
 13 files changed, 1523 insertions(+), 28 deletions(-)
 create mode 100644 xen/arch/arm/vgic/vgic-mmio-v3.c
 create mode 100644 xen/arch/arm/vgic/vgic-v3.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2939db429b..c91011bc15 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -82,7 +82,6 @@ config ARM_EFI
=20
 config GICV3
 	bool "GICv3 driver"
-	depends on !NEW_VGIC
 	default n if ARM_32
 	default y if ARM_64
 	---help---
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 49792dd590..a4c97aa0bf 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2549,7 +2549,12 @@ static int __init make_gicv3_domU_node(struct kernel=
_info *kinfo)
     int res =3D 0;
     __be32 *reg, *cells;
     const struct domain *d =3D kinfo->d;
-    unsigned int i, len =3D 0;
+    unsigned int len =3D 0;
+#ifdef CONFIG_NEW_VGIC
+    struct vgic_redist_region *rdreg;
+#else
+    unsigned int i;
+#endif
=20
     res =3D domain_fdt_begin_node(fdt, "interrupt-controller",
                                 vgic_dist_base(&d->arch.vgic));
@@ -2572,9 +2577,14 @@ static int __init make_gicv3_domU_node(struct kernel=
_info *kinfo)
     if ( res )
         return res;
=20
-    /* reg specifies all re-distributors and Distributor. */
+#ifdef CONFIG_NEW_VGIC
+    len +=3D (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+            vgic_v3_max_rdist_count(d) * sizeof(__be32);
+#else
     len =3D (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
           (d->arch.vgic.nr_regions + 1) * sizeof(__be32);
+#endif
+    /* reg specifies all re-distributors and Distributor. */
     reg =3D xmalloc_bytes(len);
     if ( reg =3D=3D NULL )
         return -ENOMEM;
@@ -2583,12 +2593,19 @@ static int __init make_gicv3_domU_node(struct kerne=
l_info *kinfo)
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_C=
ELLS,
                        vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZ=
E);
=20
+#ifdef CONFIG_NEW_VGIC
+    list_for_each_entry(rdreg, &d->arch.vgic.rd_regions, list)
+        dt_child_set_range(&cells,
+                            GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELL=
S,
+                            rdreg->base,
+                            rdreg->count * VGIC_V3_REDIST_SIZE);
+#else
     for ( i =3D 0; i < d->arch.vgic.nr_regions; i++ )
         dt_child_set_range(&cells,
                            GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS=
,
                            d->arch.vgic.rdist_regions[i].base,
                            d->arch.vgic.rdist_regions[i].size);
-
+#endif
     res =3D fdt_property(fdt, "reg", reg, len);
     xfree(reg);
     if (res)
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 95e4f020fe..cab3f2d943 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1280,8 +1280,13 @@ static int gicv3_make_hwdom_dt_node(const struct dom=
ain *d,
     if ( res )
         return res;
=20
+#ifdef CONFIG_NEW_VGIC
+    res =3D fdt_property_cell(fdt, "#redistributor-regions",
+                            vgic_v3_max_rdist_count(d));
+#else
     res =3D fdt_property_cell(fdt, "#redistributor-regions",
                             d->arch.vgic.nr_regions);
+#endif
     if ( res )
         return res;
=20
@@ -1293,7 +1298,11 @@ static int gicv3_make_hwdom_dt_node(const struct dom=
ain *d,
      * The hardware domain may not use all the regions. So only copy
      * what is necessary.
      */
+#ifdef CONFIG_NEW_VGIC
+    new_len =3D new_len * (vgic_v3_max_rdist_count(d) + 1);
+#else
     new_len =3D new_len * (d->arch.vgic.nr_regions + 1);
+#endif
=20
     hw_reg =3D dt_get_property(gic, "reg", &len);
     if ( !hw_reg )
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 227533868f..e4e4696de3 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -25,6 +25,7 @@
  * Common GICD registers are defined in gic.h
  */
=20
+#define GICD_TYPER2                  (0x00C)
 #define GICD_STATUSR                 (0x010)
 #define GICD_SETSPI_NSR              (0x040)
 #define GICD_CLRSPI_NSR              (0x048)
@@ -35,6 +36,7 @@
 #define GICD_IROUTER                 (0x6000)
 #define GICD_IROUTER32               (0x6100)
 #define GICD_IROUTER1019             (0x7FD8)
+#define GICD_IDREGS                  (0xFFD0)
 #define GICD_PIDR2                   (0xFFE8)
=20
 /* Common between GICD_PIDR2 and GICR_PIDR2 */
@@ -56,6 +58,7 @@
 #define GICD_TYPE_LPIS               (1U << 17)
=20
 #define GICD_CTLR_RWP                (1UL << 31)
+#define GICD_CTLR_DS                 (1U << 6)
 #define GICD_CTLR_ARE_NS             (1U << 4)
 #define GICD_CTLR_ENABLE_G1A         (1U << 1)
 #define GICD_CTLR_ENABLE_G1          (1U << 0)
@@ -89,6 +92,7 @@
 #define GICR_INVLPIR                 (0x00A0)
 #define GICR_INVALLR                 (0x00B0)
 #define GICR_SYNCR                   (0x00C0)
+#define GICR_IDREGS                  GICD_IDREGS
 #define GICR_PIDR2                   GICD_PIDR2
=20
 /* GICR for SGI's & PPI's */
@@ -108,6 +112,9 @@
 #define GICR_NSACR                   (0x0E00)
=20
 #define GICR_CTLR_ENABLE_LPIS        (1U << 0)
+#define GICR_CTLR_CES                (1UL << 1)
+#define GICR_CTLR_IR                 (1UL << 2)
+#define GICR_CTLR_RWP                (1UL << 3)
=20
 #define GICR_TYPER_PLPIS             (1U << 0)
 #define GICR_TYPER_VLPIS             (1U << 1)
@@ -131,7 +138,11 @@
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
@@ -200,7 +211,7 @@
 #define ICH_SGI_IRQ_SHIFT            24
 #define ICH_SGI_IRQ_MASK             0xf
 #define ICH_SGI_TARGETLIST_MASK      0xffff
-#define ICH_SGI_AFFx_MASK            0xff
+#define ICH_SGI_AFFx_MASK            0xffULL
 #define ICH_SGI_AFFINITY_LEVEL(x)    (16 * (x))
=20
 struct rdist_region {
diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm=
/new_vgic.h
index 1e76213893..ed728652de 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -21,6 +21,9 @@
 #include <xen/list.h>
 #include <xen/mm.h>
 #include <xen/spinlock.h>
+#define INTERRUPT_ID_BITS_SPIS  10
+#define INTERRUPT_ID_BITS_ITS   16
+#define VGIC_PRI_BITS           5
=20
 #define VGIC_V3_MAX_CPUS        255
 #define VGIC_V2_MAX_CPUS        8
@@ -31,6 +34,8 @@
 #define VGIC_MAX_SPI            1019
 #define VGIC_MAX_RESERVED       1023
 #define VGIC_MIN_LPI            8192
+#define VGIC_V3_DIST_SIZE       SZ_64K
+#define VGIC_V3_REDIST_SIZE     (2 * SZ_64K)
=20
 #define irq_is_ppi(irq) ((irq) >=3D VGIC_NR_SGIS && (irq) < VGIC_NR_PRIVAT=
E_IRQS)
 #define irq_is_spi(irq) ((irq) >=3D VGIC_NR_PRIVATE_IRQS && \
@@ -94,6 +99,14 @@ enum iodev_type {
     IODEV_REDIST,
 };
=20
+struct vgic_redist_region {
+    uint32_t index;
+    paddr_t base;
+    uint32_t count; /* number of redistributors or 0 if single region */
+    uint32_t free_index; /* index of the next free redistributor */
+    struct list_head list;
+};
+
 struct vgic_io_device {
     gfn_t base_fn;
     struct vcpu *redist_vcpu;
@@ -121,11 +134,7 @@ struct vgic_dist {
         /* either a GICv2 CPU interface */
         paddr_t         cbase;
         /* or a number of GICv3 redistributor regions */
-        struct
-        {
-            paddr_t     vgic_redist_base;
-            paddr_t     vgic_redist_free_offset;
-        };
+        struct list_head rd_regions;
     };
     paddr_t             csize; /* CPU interface size */
     paddr_t             vbase; /* virtual CPU interface base address */
@@ -174,6 +183,9 @@ struct vgic_cpu {
      * parts of the redistributor.
      */
     struct vgic_io_device   rd_iodev;
+    struct vgic_redist_region *rdreg;
+    uint32_t rdreg_index;
+    atomic_t syncr_busy;
     struct vgic_io_device   sgi_iodev;
=20
     /* Contains the attributes and gpa of the LPI pending tables. */
@@ -186,6 +198,9 @@ struct vgic_cpu {
=20
     /* Cache guest interrupt ID bits */
     uint32_t num_id_bits;
+
+    /* GICR_CTLR.{ENABLE_LPIS,RWP} */
+    atomic_t ctlr;
 };
=20
 static inline paddr_t vgic_cpu_base(const struct vgic_dist *vgic)
@@ -198,6 +213,13 @@ static inline paddr_t vgic_dist_base(const struct vgic=
_dist *vgic)
     return vgic->dbase;
 }
=20
+#ifdef CONFIG_GICV3
+struct vgic_redist_region *vgic_v3_rdist_free_slot(struct list_head *rd_re=
gions);
+int vgic_v3_set_redist_base(struct domain *d, u32 index, u64 addr, u32 cou=
nt);
+unsigned int vgic_v3_max_rdist_count(const struct domain *d);
+void vgic_flush_pending_lpis(struct vcpu *vcpu);
+#endif
+
 #endif /* __ASM_ARM_NEW_VGIC_H */
=20
 /*
diff --git a/xen/arch/arm/vgic/Makefile b/xen/arch/arm/vgic/Makefile
index 806826948e..019bfe3d07 100644
--- a/xen/arch/arm/vgic/Makefile
+++ b/xen/arch/arm/vgic/Makefile
@@ -2,4 +2,6 @@ obj-y +=3D vgic.o
 obj-y +=3D vgic-v2.o
 obj-y +=3D vgic-mmio.o
 obj-y +=3D vgic-mmio-v2.o
+obj-$(CONFIG_GICV3) +=3D vgic-v3.o
+obj-$(CONFIG_GICV3) +=3D vgic-mmio-v3.o
 obj-y +=3D vgic-init.o
diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index f8d7d3a226..be35cc33ec 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -107,14 +107,18 @@ int domain_vgic_register(struct domain *d, unsigned i=
nt *mmio_count)
     {
     case GIC_V2:
         *mmio_count =3D 1;
+        d->arch.vgic.cbase =3D VGIC_ADDR_UNDEF;
         break;
+    case GIC_V3:
+        *mmio_count =3D 2;
+        INIT_LIST_HEAD(&d->arch.vgic.rd_regions);
+        break;
+
     default:
         BUG();
     }
=20
     d->arch.vgic.dbase =3D VGIC_ADDR_UNDEF;
-    d->arch.vgic.cbase =3D VGIC_ADDR_UNDEF;
-    d->arch.vgic.vgic_redist_base =3D VGIC_ADDR_UNDEF;
=20
     return 0;
 }
@@ -174,7 +178,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_=
spis)
     if ( dist->version =3D=3D GIC_V2 )
         ret =3D vgic_v2_map_resources(d);
     else
-        ret =3D -ENXIO;
+        ret =3D vgic_v3_map_resources(d);
=20
     if ( ret )
         return ret;
@@ -207,7 +211,7 @@ int vcpu_vgic_init(struct vcpu *v)
     if ( gic_hw_version() =3D=3D GIC_V2 )
         vgic_v2_enable(v);
     else
-        ret =3D -ENXIO;
+        vgic_v3_enable(v);
=20
     return ret;
 }
diff --git a/xen/arch/arm/vgic/vgic-mmio-v3.c b/xen/arch/arm/vgic/vgic-mmio=
-v3.c
new file mode 100644
index 0000000000..4ec6d910af
--- /dev/null
+++ b/xen/arch/arm/vgic/vgic-mmio-v3.c
@@ -0,0 +1,940 @@
+/*
+ * VGICv3 MMIO handling functions
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
+ */
+
+#include <xen/bitops.h>
+#include <xen/sched.h>
+#include <xen/sizes.h>
+#include <asm/new_vgic.h>
+#include <asm/gic_v3_defs.h>
+#include <asm/gic_v3_its.h>
+#include <asm/vreg.h>
+
+#include "asm/domain.h"
+#include "asm/types.h"
+#include "vgic.h"
+#include "vgic-mmio.h"
+
+bool vgic_has_its(struct domain *d)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+
+    if ( dist->version !=3D GIC_V3 )
+        return false;
+
+    return dist->has_its;
+}
+
+struct vcpu *mpidr_to_vcpu(struct domain *d, unsigned long mpidr)
+{
+    struct vcpu *vcpu;
+
+    mpidr &=3D MPIDR_HWID_MASK;
+    for_each_vcpu(d, vcpu)
+    {
+        if ( mpidr =3D=3D vcpuid_to_vaffinity(vcpu->vcpu_id) )
+            return vcpu;
+    }
+    return NULL;
+}
+
+/* extract @num bytes at @offset bytes offset in data */
+unsigned long extract_bytes(uint64_t data, unsigned int offset,
+                            unsigned int num)
+{
+    return (data >> (offset * 8)) & GENMASK_ULL(num * 8 - 1, 0);
+}
+
+uint64_t update_64bit_reg(u64 reg, unsigned int offset, unsigned int len,
+                          unsigned long val)
+{
+    int lower =3D (offset & 4) * 8;
+    int upper =3D lower + 8 * len - 1;
+
+    reg &=3D ~GENMASK_ULL(upper, lower);
+    val &=3D GENMASK_ULL(len * 8 - 1, 0);
+
+    return reg | ((u64)val << lower);
+}
+
+static int match_mpidr(u64 sgi_aff, u16 sgi_cpu_mask, struct vcpu *vcpu)
+{
+    unsigned long affinity;
+    int level0;
+
+    /*
+     * Split the current VCPU's MPIDR into affinity level 0 and the
+     * rest as this is what we have to compare against.
+     */
+    affinity =3D vcpuid_to_vaffinity(vcpu->vcpu_id);
+    level0   =3D MPIDR_AFFINITY_LEVEL(affinity, 0);
+    affinity &=3D ~MPIDR_LEVEL_MASK;
+
+    /* bail out if the upper three levels don't match */
+    if ( sgi_aff !=3D affinity )
+        return -1;
+
+    /* Is this VCPU's bit set in the mask ? */
+    if ( !(sgi_cpu_mask & BIT(level0, ULL)) )
+        return -1;
+
+    return level0;
+}
+
+#define SGI_AFFINITY_LEVEL(reg, level)                                    =
     \
+    ((((reg) & (ICH_SGI_AFFx_MASK << ICH_SGI_AFFINITY_LEVEL(level))) >>   =
     \
+      ICH_SGI_AFFINITY_LEVEL(level))                                      =
     \
+     << MPIDR_LEVEL_SHIFT(level))
+
+static bool vgic_v3_emulate_sgi1r(struct cpu_user_regs *regs, uint64_t *r,
+                                  bool read)
+{
+    struct domain *d  =3D current->domain;
+    struct vcpu *vcpu =3D current;
+    struct vcpu *c_vcpu;
+    u16 target_cpus;
+    u64 mpidr;
+    int sgi;
+    int vcpu_id =3D vcpu->vcpu_id;
+    bool broadcast;
+    unsigned long flags;
+
+    if ( read )
+    {
+        gdprintk(XENLOG_WARNING, "Reading SGI1R_EL1 - WO register\n");
+        return false;
+    }
+
+    sgi         =3D (*r >> ICH_SGI_IRQ_SHIFT) & ICH_SGI_IRQ_MASK;
+    broadcast   =3D *r & BIT(ICH_SGI_IRQMODE_SHIFT, ULL);
+    target_cpus =3D (*r & ICH_SGI_TARGETLIST_MASK);
+
+    mpidr       =3D SGI_AFFINITY_LEVEL(*r, 3);
+    mpidr |=3D SGI_AFFINITY_LEVEL(*r, 2);
+    mpidr |=3D SGI_AFFINITY_LEVEL(*r, 1);
+
+    /*
+     * We iterate over all VCPUs to find the MPIDRs matching the request.
+     * If we have handled one CPU, we clear its bit to detect early
+     * if we are already finished. This avoids iterating through all
+     * VCPUs when most of the times we just signal a single VCPU.
+     */
+    for_each_vcpu(d, c_vcpu)
+    {
+        struct vgic_irq *irq;
+
+        /* Exit early if we have dealt with all requested CPUs */
+        if ( !broadcast && target_cpus =3D=3D 0 )
+            break;
+
+        /* Don't signal the calling VCPU */
+        if ( broadcast && c_vcpu->vcpu_id =3D=3D vcpu_id )
+            continue;
+
+        if ( !broadcast )
+        {
+            int level0;
+
+            level0 =3D match_mpidr(mpidr, target_cpus, c_vcpu);
+            if ( level0 =3D=3D -1 )
+                continue;
+
+            /* remove this matching VCPU from the mask */
+            target_cpus &=3D ~BIT(level0, UL);
+        }
+
+        irq =3D vgic_get_irq(vcpu->domain, c_vcpu, sgi);
+
+        spin_lock_irqsave(&irq->irq_lock, flags);
+
+        if ( !irq->hw )
+        {
+            irq->pending_latch =3D true;
+            vgic_queue_irq_unlock(vcpu->domain, irq, flags);
+        }
+        else
+        {
+            printk(XENLOG_ERR "HW SGIs are not implemented\n");
+            BUG();
+            spin_unlock_irqrestore(&irq->irq_lock, flags);
+        }
+
+        vgic_put_irq(vcpu->domain, irq);
+    }
+
+    return true;
+}
+
+static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr h=
sr)
+{
+    struct hsr_sysreg sysreg =3D hsr.sysreg;
+
+    ASSERT(hsr.ec =3D=3D HSR_EC_SYSREG);
+
+    if ( sysreg.read )
+        perfc_incr(vgic_sysreg_reads);
+    else
+        perfc_incr(vgic_sysreg_writes);
+
+    switch ( hsr.bits & HSR_SYSREG_REGS_MASK )
+    {
+    case HSR_SYSREG_ICC_SGI1R_EL1:
+        return vreg_emulate_sysreg(regs, hsr, vgic_v3_emulate_sgi1r);
+
+    default:
+        return false;
+    }
+}
+
+bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr)
+{
+    switch ( hsr.ec )
+    {
+#ifdef CONFIG_ARM_64
+    case HSR_EC_SYSREG:
+        return vgic_v3_emulate_sysreg(regs, hsr);
+#endif
+    case HSR_EC_CP15_64:
+        printk(XENLOG_ERR
+               "vgic_v3_emulate_reg: HSR_EC_CP15_64 not implemented");
+        BUG();
+        break;
+    default:
+        return false;
+    }
+}
+
+/*
+ * The Revision field in the IIDR have the following meanings:
+ *
+ * Revision 2: Interrupt groups are guest-configurable and signaled using
+ *            their configured groups.
+ */
+
+static unsigned long vgic_mmio_read_v3_misc(struct vcpu *vcpu, paddr_t add=
r,
+                                            unsigned int len)
+{
+    struct vgic_dist *vgic =3D &vcpu->domain->arch.vgic;
+    uint32_t value         =3D 0;
+
+    switch ( addr & 0x0c )
+    {
+    case GICD_CTLR:
+        if ( vgic->enabled )
+            value |=3D GICD_CTLR_ENABLE_G1A;
+        value |=3D GICD_CTLR_ARE_NS | GICD_CTLR_DS;
+        break;
+    case GICD_TYPER:
+        value =3D vgic->nr_spis + VGIC_NR_PRIVATE_IRQS;
+        value =3D (value >> 5) - 1;
+        if ( vgic_has_its(vcpu->domain) )
+        {
+            value |=3D (INTERRUPT_ID_BITS_ITS - 1) << 19;
+            value |=3D GICD_TYPE_LPIS;
+        }
+        else
+        {
+            value |=3D (INTERRUPT_ID_BITS_SPIS - 1) << 19;
+        }
+        break;
+    case GICD_TYPER2:
+        break;
+    case GICD_IIDR:
+        value =3D (PRODUCT_ID_KVM << 24) | (VARIANT_ID_XEN << 16) |
+                (IMPLEMENTER_ARM << 0);
+        break;
+    default:
+        return 0;
+    }
+
+    return value;
+}
+
+static void vgic_mmio_write_v3_misc(struct vcpu *vcpu, paddr_t addr,
+                                    unsigned int len, unsigned long val)
+{
+    struct vgic_dist *dist =3D &vcpu->domain->arch.vgic;
+
+    switch ( addr & 0x0c )
+    {
+    case GICD_CTLR:
+    {
+        bool was_enabled;
+
+        domain_lock(vcpu->domain);
+
+        was_enabled   =3D dist->enabled;
+
+        dist->enabled =3D val & GICD_CTLR_ENABLE_G1A;
+
+        if ( dist->enabled )
+            vgic_kick_vcpus(vcpu->domain);
+
+        domain_unlock(vcpu->domain);
+        break;
+    }
+    case GICD_TYPER:
+    case GICD_TYPER2:
+    case GICD_IIDR:
+        /* This is at best for documentation purposes... */
+        return;
+    }
+}
+
+static unsigned long vgic_mmio_read_irouter(struct vcpu *vcpu, paddr_t add=
r,
+                                            unsigned int len)
+{
+    int intid            =3D VGIC_ADDR_TO_INTID(addr, 64);
+    struct vgic_irq *irq =3D vgic_get_irq(vcpu->domain, NULL, intid);
+    unsigned long ret    =3D 0;
+
+    if ( !irq )
+        return 0;
+
+    /* The upper word is RAZ for us. */
+    if ( !(addr & 4) )
+        ret =3D extract_bytes(irq->mpidr, addr & 7, len);
+
+    vgic_put_irq(vcpu->domain, irq);
+    return ret;
+}
+
+static void vgic_mmio_write_irouter(struct vcpu *vcpu, paddr_t addr,
+                                    unsigned int len, unsigned long val)
+{
+    int intid =3D VGIC_ADDR_TO_INTID(addr, 64);
+    struct vgic_irq *irq;
+    unsigned long flags;
+
+    /* The upper word is WI for us since we don't implement Aff3. */
+    if ( addr & 4 )
+        return;
+
+    irq =3D vgic_get_irq(vcpu->domain, NULL, intid);
+
+    if ( !irq )
+        return;
+
+    spin_lock_irqsave(&irq->irq_lock, flags);
+
+    /* We only care about and preserve Aff0, Aff1 and Aff2. */
+    irq->mpidr       =3D val & GENMASK(23, 0);
+    irq->target_vcpu =3D mpidr_to_vcpu(vcpu->domain, irq->mpidr);
+
+    spin_unlock_irqrestore(&irq->irq_lock, flags);
+    vgic_put_irq(vcpu->domain, irq);
+}
+
+static bool vgic_mmio_vcpu_rdist_is_last(struct vcpu *vcpu)
+{
+    struct vgic_dist *vgic    =3D &vcpu->domain->arch.vgic;
+    struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
+    struct vgic_redist_region *iter, *rdreg =3D vgic_cpu->rdreg;
+
+    if ( !rdreg )
+        return false;
+
+    if ( vgic_cpu->rdreg_index < rdreg->free_index - 1 )
+    {
+        return false;
+    }
+    else if ( rdreg->count && vgic_cpu->rdreg_index =3D=3D (rdreg->count -=
 1) )
+    {
+        struct list_head *rd_regions =3D &vgic->rd_regions;
+        paddr_t end =3D rdreg->base + rdreg->count * VGIC_V3_REDIST_SIZE;
+
+        /*
+         * the rdist is the last one of the redist region,
+         * check whether there is no other contiguous rdist region
+         */
+        list_for_each_entry(iter, rd_regions, list)
+        {
+            if ( iter->base =3D=3D end && iter->free_index > 0 )
+                return false;
+        }
+    }
+    return true;
+}
+
+static unsigned long vgic_mmio_read_v3r_typer(struct vcpu *vcpu, paddr_t a=
ddr,
+                                              unsigned int len)
+{
+    unsigned long mpidr =3D vcpuid_to_vaffinity(vcpu->vcpu_id);
+    int target_vcpu_id  =3D vcpu->vcpu_id;
+    u64 value;
+
+    value =3D (u64)(mpidr & GENMASK(23, 0)) << 32;
+    value |=3D ((target_vcpu_id & 0xffff) << 8);
+
+    if ( vgic_has_its(vcpu->domain) )
+        value |=3D GICR_TYPER_PLPIS;
+
+    if ( vgic_mmio_vcpu_rdist_is_last(vcpu) )
+        value |=3D GICR_TYPER_LAST;
+
+    return extract_bytes(value, addr & 7, len);
+}
+
+static unsigned long vgic_mmio_read_v3r_iidr(struct vcpu *vcpu, paddr_t ad=
dr,
+                                             unsigned int len)
+{
+    return (PRODUCT_ID_KVM << 24) | (VARIANT_ID_XEN << 16) |
+           (IMPLEMENTER_ARM << 0);
+}
+
+static unsigned long vgic_mmio_read_v3_idregs(struct vcpu *vcpu, paddr_t a=
ddr,
+                                              unsigned int len)
+{
+    switch ( addr & 0xfff )
+    {
+    case GICD_ICPIDR2:
+        /* report a GICv3 compliant implementation */
+        return 0x3b;
+    }
+
+    return 0;
+}
+
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
+bool vgic_lpis_enabled(struct vcpu *vcpu)
+{
+    struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
+
+    return atomic_read(&vgic_cpu->ctlr) =3D=3D GICR_CTLR_ENABLE_LPIS;
+}
+
+/* We want to avoid outer shareable. */
+u64 vgic_sanitise_shareability(u64 field)
+{
+    switch ( field )
+    {
+    case GIC_BASER_OuterShareable:
+        return GIC_BASER_InnerShareable;
+    default:
+        return field;
+    }
+}
+
+/* Avoid any inner non-cacheable mapping. */
+u64 vgic_sanitise_inner_cacheability(u64 field)
+{
+    switch ( field )
+    {
+    case GIC_BASER_CACHE_nCnB:
+    case GIC_BASER_CACHE_nC:
+        return GIC_BASER_CACHE_RaWb;
+    default:
+        return field;
+    }
+}
+
+/* Non-cacheable or same-as-inner are OK. */
+u64 vgic_sanitise_outer_cacheability(u64 field)
+{
+    switch ( field )
+    {
+    case GIC_BASER_CACHE_SameAsInner:
+    case GIC_BASER_CACHE_nC:
+        return field;
+    default:
+        return GIC_BASER_CACHE_SameAsInner;
+    }
+}
+
+u64 vgic_sanitise_field(u64 reg, u64 field_mask, int field_shift,
+                        u64 (*sanitise_fn)(u64))
+{
+    u64 field =3D (reg & field_mask) >> field_shift;
+
+    field     =3D sanitise_fn(field) << field_shift;
+    return (reg & ~field_mask) | field;
+}
+
+#define PROPBASER_RES0_MASK                                               =
     \
+    (GENMASK_ULL(63, 59) | GENMASK_ULL(55, 52) | GENMASK_ULL(6, 5))
+#define PENDBASER_RES0_MASK                                               =
     \
+    (BIT(63, ULL) | GENMASK_ULL(61, 59) | GENMASK_ULL(55, 52) |           =
     \
+     GENMASK_ULL(15, 12) | GENMASK_ULL(6, 0))
+
+static u64 vgic_sanitise_pendbaser(u64 reg)
+{
+    reg =3D vgic_sanitise_field(reg, GICR_PENDBASER_SHAREABILITY_MASK,
+                              GICR_PENDBASER_SHAREABILITY_SHIFT,
+                              vgic_sanitise_shareability);
+    reg =3D vgic_sanitise_field(reg, GICR_PENDBASER_INNER_CACHEABILITY_MAS=
K,
+                              GICR_PENDBASER_INNER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_inner_cacheability);
+    reg =3D vgic_sanitise_field(reg, GICR_PENDBASER_OUTER_CACHEABILITY_MAS=
K,
+                              GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_outer_cacheability);
+
+    reg &=3D ~PENDBASER_RES0_MASK;
+
+    return reg;
+}
+
+static u64 vgic_sanitise_propbaser(u64 reg)
+{
+    reg =3D vgic_sanitise_field(reg, GICR_PROPBASER_SHAREABILITY_MASK,
+                              GICR_PROPBASER_SHAREABILITY_SHIFT,
+                              vgic_sanitise_shareability);
+    reg =3D vgic_sanitise_field(reg, GICR_PROPBASER_INNER_CACHEABILITY_MAS=
K,
+                              GICR_PROPBASER_INNER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_inner_cacheability);
+    reg =3D vgic_sanitise_field(reg, GICR_PROPBASER_OUTER_CACHEABILITY_MAS=
K,
+                              GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_outer_cacheability);
+
+    reg &=3D ~PROPBASER_RES0_MASK;
+    return reg;
+}
+
+static unsigned long vgic_mmio_read_propbase(struct vcpu *vcpu, paddr_t ad=
dr,
+                                             unsigned int len)
+{
+    struct vgic_dist *dist =3D &vcpu->domain->arch.vgic;
+
+    return extract_bytes(dist->propbaser, addr & 7, len);
+}
+
+static void vgic_mmio_write_propbase(struct vcpu *vcpu, paddr_t addr,
+                                     unsigned int len, unsigned long val)
+{
+    struct vgic_dist *dist =3D &vcpu->domain->arch.vgic;
+    u64 old_propbaser, propbaser;
+
+    /* Storing a value with LPIs already enabled is undefined */
+    if ( vgic_lpis_enabled(vcpu) )
+        return;
+
+    do
+    {
+        old_propbaser =3D dist->propbaser;
+        propbaser     =3D old_propbaser;
+        propbaser     =3D update_64bit_reg(propbaser, addr & 4, len, val);
+        propbaser     =3D vgic_sanitise_propbaser(propbaser);
+    } while ( cmpxchg64(&dist->propbaser, old_propbaser, propbaser) !=3D
+              old_propbaser );
+}
+
+static unsigned long vgic_mmio_read_pendbase(struct vcpu *vcpu, paddr_t ad=
dr,
+                                             unsigned int len)
+{
+    struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
+    u64 value                 =3D vgic_cpu->pendbaser;
+
+    value &=3D ~GICR_PENDBASER_PTZ;
+
+    return extract_bytes(value, addr & 7, len);
+}
+
+static void vgic_mmio_write_pendbase(struct vcpu *vcpu, paddr_t addr,
+                                     unsigned int len, unsigned long val)
+{
+    struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
+    u64 old_pendbaser, pendbaser;
+
+    /* Storing a value with LPIs already enabled is undefined */
+    if ( vgic_lpis_enabled(vcpu) )
+        return;
+
+    do
+    {
+        old_pendbaser =3D vgic_cpu->pendbaser;
+        pendbaser     =3D old_pendbaser;
+        pendbaser     =3D update_64bit_reg(pendbaser, addr & 4, len, val);
+        pendbaser     =3D vgic_sanitise_pendbaser(pendbaser);
+    } while ( cmpxchg64(&vgic_cpu->pendbaser, old_pendbaser, pendbaser) !=
=3D
+              old_pendbaser );
+}
+
+static unsigned long vgic_mmio_read_sync(struct vcpu *vcpu, paddr_t addr,
+                                         unsigned int len)
+{
+    return !!atomic_read(&vcpu->arch.vgic.syncr_busy);
+}
+
+static const struct vgic_register_region vgic_v3_dist_registers[] =3D {
+    REGISTER_DESC_WITH_LENGTH(GICD_CTLR,
+        vgic_mmio_read_v3_misc, vgic_mmio_write_v3_misc,
+        16, VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICD_STATUSR,
+        vgic_mmio_read_rao, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_IGROUPR,
+        vgic_mmio_read_rao, vgic_mmio_write_wi, 1,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ISENABLER,
+        vgic_mmio_read_enable, vgic_mmio_write_senable, 1,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ICENABLER,
+        vgic_mmio_read_enable, vgic_mmio_write_cenable, 1,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ISPENDR,
+        vgic_mmio_read_pending, vgic_mmio_write_spending, 1,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ICPENDR,
+        vgic_mmio_read_pending, vgic_mmio_write_cpending, 1,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ISACTIVER,
+        vgic_mmio_read_active, vgic_mmio_write_sactive, 1,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ICACTIVER,
+        vgic_mmio_read_active, vgic_mmio_write_cactive,
+        1, VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_IPRIORITYR,
+        vgic_mmio_read_priority, vgic_mmio_write_priority,
+        8, VGIC_ACCESS_32bit | VGIC_ACCESS_8bit),
+    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ITARGETSR,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+        VGIC_ACCESS_32bit | VGIC_ACCESS_8bit),
+    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ICFGR,
+        vgic_mmio_read_config, vgic_mmio_write_config, 2,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_IGRPMODR,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 1,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_IROUTER,
+        vgic_mmio_read_irouter, vgic_mmio_write_irouter, 64,
+        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICD_IDREGS,
+        vgic_mmio_read_v3_idregs, vgic_mmio_write_wi, 48,
+        VGIC_ACCESS_32bit),
+};
+
+static const struct vgic_register_region vgic_v3_rd_registers[] =3D {
+    /* RD_base registers */
+    REGISTER_DESC_WITH_LENGTH(GICR_CTLR,
+        vgic_mmio_read_v3r_ctlr, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_STATUSR,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_IIDR,
+        vgic_mmio_read_v3r_iidr, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_TYPER,
+        vgic_mmio_read_v3r_typer, vgic_mmio_write_wi, 8,
+        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_WAKER,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_PROPBASER,
+        vgic_mmio_read_propbase, vgic_mmio_write_propbase, 8,
+        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_PENDBASER,
+        vgic_mmio_read_pendbase, vgic_mmio_write_pendbase, 8,
+        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_INVLPIR,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_INVALLR,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_SYNCR,
+        vgic_mmio_read_sync, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_IDREGS,
+        vgic_mmio_read_v3_idregs, vgic_mmio_write_wi, 48,
+        VGIC_ACCESS_32bit),
+    /* SGI_base registers */
+    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_IGROUPR0,
+        vgic_mmio_read_rao, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ISENABLER0,
+        vgic_mmio_read_enable, vgic_mmio_write_senable, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ICENABLER0,
+        vgic_mmio_read_enable, vgic_mmio_write_cenable, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ISPENDR0,
+        vgic_mmio_read_pending, vgic_mmio_write_spending, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ICPENDR0,
+        vgic_mmio_read_pending, vgic_mmio_write_cpending,4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ISACTIVER0,
+        vgic_mmio_read_active, vgic_mmio_write_sactive, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ICACTIVER0,
+        vgic_mmio_read_active, vgic_mmio_write_cactive, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_IPRIORITYR0,
+        vgic_mmio_read_priority, vgic_mmio_write_priority, 32,
+        VGIC_ACCESS_32bit | VGIC_ACCESS_8bit),
+    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ICFGR0,
+        vgic_mmio_read_config, vgic_mmio_write_config, 8,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_IGRPMODR0,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_NSACR,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+};
+
+unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev)
+{
+    dev->regions    =3D vgic_v3_dist_registers;
+    dev->nr_regions =3D ARRAY_SIZE(vgic_v3_dist_registers);
+
+    return SZ_64K;
+}
+
+/**
+ * vgic_register_redist_iodev - register a single redist iodev
+ * @vcpu:    The VCPU to which the redistributor belongs
+ *
+ * Register a KVM iodev for this VCPU's redistributor using the address
+ * provided.
+ *
+ * Return 0 on success, -ERRNO otherwise.
+ */
+int vgic_register_redist_iodev(struct vcpu *vcpu)
+{
+    struct domain *d              =3D vcpu->domain;
+    struct vgic_dist *vgic        =3D &d->arch.vgic;
+    struct vgic_cpu *vgic_cpu     =3D &vcpu->arch.vgic;
+    struct vgic_io_device *rd_dev =3D &vcpu->arch.vgic.rd_iodev;
+    struct vgic_redist_region *rdreg;
+    paddr_t rd_base;
+
+    /*
+     * We may be creating VCPUs before having set the base address for the
+     * redistributor region, in which case we will come back to this
+     * function for all VCPUs when the base address is set.  Just return
+     * without doing any work for now.
+     */
+    rdreg =3D vgic_v3_rdist_free_slot(&vgic->rd_regions);
+    if ( !rdreg )
+        return 0;
+
+    vgic_cpu->rdreg       =3D rdreg;
+    vgic_cpu->rdreg_index =3D rdreg->free_index;
+
+    rd_base             =3D rdreg->base + rdreg->free_index * VGIC_V3_REDI=
ST_SIZE;
+
+    rd_dev->base_fn     =3D gaddr_to_gfn(rd_base);
+    rd_dev->iodev_type  =3D IODEV_REDIST;
+    rd_dev->regions     =3D vgic_v3_rd_registers;
+    rd_dev->nr_regions  =3D ARRAY_SIZE(vgic_v3_rd_registers);
+    rd_dev->redist_vcpu =3D vcpu;
+
+    register_mmio_handler(d, &vgic_io_ops, rd_base, VGIC_V3_REDIST_SIZE,
+                          rd_dev);
+
+    rdreg->free_index++;
+    return 0;
+}
+
+static int vgic_register_all_redist_iodevs(struct domain *d)
+{
+    struct vcpu *vcpu;
+    int ret =3D 0;
+
+    for_each_vcpu(d, vcpu)
+    {
+        ret =3D vgic_register_redist_iodev(vcpu);
+        if ( ret )
+            break;
+    }
+
+    if ( ret )
+    {
+        printk(XENLOG_ERR "Failed to register redistributor iodev\n");
+    }
+
+    return ret;
+}
+
+static inline size_t vgic_v3_rd_region_size(struct domain *d,
+                                            struct vgic_redist_region *rdr=
eg)
+{
+    if ( !rdreg->count )
+        return d->max_vcpus * VGIC_V3_REDIST_SIZE;
+    else
+        return rdreg->count * VGIC_V3_REDIST_SIZE;
+}
+
+/**
+ * vgic_v3_rdist_overlap - check if a region overlaps with any
+ * existing redistributor region
+ *
+ * @kvm: kvm handle
+ * @base: base of the region
+ * @size: size of region
+ *
+ * Return: true if there is an overlap
+ */
+bool vgic_v3_rdist_overlap(struct domain *domain, paddr_t base, size_t siz=
e)
+{
+    struct vgic_dist *d =3D &domain->arch.vgic;
+    struct vgic_redist_region *rdreg;
+
+    list_for_each_entry(rdreg, &d->rd_regions, list)
+    {
+        if ( (base + size > rdreg->base) &&
+             (base < rdreg->base + vgic_v3_rd_region_size(domain, rdreg)) =
)
+            return true;
+    }
+    return false;
+}
+
+static inline bool vgic_dist_overlap(struct domain *domain, paddr_t base,
+                                     size_t size)
+{
+    struct vgic_dist *d =3D &domain->arch.vgic;
+
+    return (base + size > d->dbase) && (base < d->dbase + VGIC_V3_DIST_SIZ=
E);
+}
+
+struct vgic_redist_region *vgic_v3_rdist_region_from_index(struct domain *=
d,
+                                                           u32 index)
+{
+    struct list_head *rd_regions =3D &d->arch.vgic.rd_regions;
+    struct vgic_redist_region *rdreg;
+
+    list_for_each_entry(rdreg, rd_regions, list)
+    {
+        if ( rdreg->index =3D=3D index )
+            return rdreg;
+    }
+    return NULL;
+}
+
+/**
+ * vgic_v3_alloc_redist_region - Allocate a new redistributor region
+ *
+ * Performs various checks before inserting the rdist region in the list.
+ * Those tests depend on whether the size of the rdist region is known
+ * (ie. count !=3D 0). The list is sorted by rdist region index.
+ *
+ * @kvm: kvm handle
+ * @index: redist region index
+ * @base: base of the new rdist region
+ * @count: number of redistributors the region is made of (0 in the old st=
yle
+ * single region, whose size is induced from the number of vcpus)
+ *
+ * Return 0 on success, < 0 otherwise
+ */
+static int vgic_v3_alloc_redist_region(struct domain *domain, uint32_t ind=
ex,
+                                       paddr_t base, uint32_t count)
+{
+    struct vgic_dist *d =3D &domain->arch.vgic;
+    struct vgic_redist_region *rdreg;
+    struct list_head *rd_regions =3D &d->rd_regions;
+    int nr_vcpus                 =3D domain->max_vcpus;
+    size_t size                  =3D count ? count * VGIC_V3_REDIST_SIZE
+                                         : nr_vcpus * VGIC_V3_REDIST_SIZE;
+    int ret;
+
+    /* cross the end of memory ? */
+    if ( base + size < base )
+        return -EINVAL;
+
+    if ( list_empty(rd_regions) )
+    {
+        if ( index !=3D 0 )
+            return -EINVAL;
+    }
+    else
+    {
+        rdreg =3D list_last_entry(rd_regions, struct vgic_redist_region, l=
ist);
+
+        /* Don't mix single region and discrete redist regions */
+        if ( !count && rdreg->count )
+            return -EINVAL;
+
+        if ( !count )
+            return -EEXIST;
+
+        if ( index !=3D rdreg->index + 1 )
+            return -EINVAL;
+    }
+
+    /*
+     * For legacy single-region redistributor regions (!count),
+     * check that the redistributor region does not overlap with the
+     * distributor's address space.
+     */
+    if ( !count && !IS_VGIC_ADDR_UNDEF(d->dbase) &&
+         vgic_dist_overlap(domain, base, size) )
+        return -EINVAL;
+
+    /* collision with any other rdist region? */
+    if ( vgic_v3_rdist_overlap(domain, base, size) )
+        return -EINVAL;
+
+    rdreg =3D xzalloc(struct vgic_redist_region);
+    if ( !rdreg )
+        return -ENOMEM;
+
+    rdreg->base =3D VGIC_ADDR_UNDEF;
+
+    ret         =3D vgic_check_iorange(rdreg->base, base, SZ_64K, size);
+    if ( ret )
+        goto free;
+
+    rdreg->base       =3D base;
+    rdreg->count      =3D count;
+    rdreg->free_index =3D 0;
+    rdreg->index      =3D index;
+
+    list_add_tail(&rdreg->list, rd_regions);
+    return 0;
+free:
+    xfree(rdreg);
+    return ret;
+}
+
+void vgic_v3_free_redist_region(struct vgic_redist_region *rdreg)
+{
+    list_del(&rdreg->list);
+    xfree(rdreg);
+}
+
+int vgic_v3_set_redist_base(struct domain *d, u32 index, u64 addr, u32 cou=
nt)
+{
+    int ret;
+
+    ret =3D vgic_v3_alloc_redist_region(d, index, addr, count);
+    if ( ret )
+        return ret;
+
+    /*
+     * Register iodevs for each existing VCPU.  Adding more VCPUs
+     * afterwards will register the iodevs when needed.
+     */
+    ret =3D vgic_register_all_redist_iodevs(d);
+    if ( ret )
+    {
+        struct vgic_redist_region *rdreg;
+
+        rdreg =3D vgic_v3_rdist_region_from_index(d, index);
+        vgic_v3_free_redist_region(rdreg);
+        return ret;
+    }
+
+    return 0;
+}
diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
index 5d935a7301..a96a7f8d96 100644
--- a/xen/arch/arm/vgic/vgic-mmio.c
+++ b/xen/arch/arm/vgic/vgic-mmio.c
@@ -477,6 +477,21 @@ void vgic_mmio_write_config(struct vcpu *vcpu,
     }
 }
=20
+int vgic_check_iorange(paddr_t ioaddr, paddr_t addr, paddr_t alignment,
+                       paddr_t size)
+{
+    if ( !IS_VGIC_ADDR_UNDEF(ioaddr) )
+        return -EEXIST;
+
+    if ( !IS_ALIGNED(addr, alignment) || !IS_ALIGNED(size, alignment) )
+        return -EINVAL;
+
+    if ( addr + size < addr )
+        return -EINVAL;
+
+    return 0;
+}
+
 static int match_region(const void *key, const void *elt)
 {
     const unsigned int offset =3D (unsigned long)key;
@@ -619,6 +634,9 @@ int vgic_register_dist_iodev(struct domain *d, gfn_t di=
st_base_fn,
     case VGIC_V2:
         len =3D vgic_v2_init_dist_iodev(io_device);
         break;
+    case VGIC_V3:
+        len =3D vgic_v3_init_dist_iodev(io_device);
+        break;
     default:
         BUG();
     }
diff --git a/xen/arch/arm/vgic/vgic-mmio.h b/xen/arch/arm/vgic/vgic-mmio.h
index 3566cf237c..c38ef51e6b 100644
--- a/xen/arch/arm/vgic/vgic-mmio.h
+++ b/xen/arch/arm/vgic/vgic-mmio.h
@@ -135,4 +135,14 @@ void vgic_mmio_write_config(struct vcpu *vcpu,
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
+int vgic_check_iorange(paddr_t ioaddr, paddr_t addr, paddr_t alignment,
+		       paddr_t size);
+
 #endif
diff --git a/xen/arch/arm/vgic/vgic-v3.c b/xen/arch/arm/vgic/vgic-v3.c
new file mode 100644
index 0000000000..12963d877e
--- /dev/null
+++ b/xen/arch/arm/vgic/vgic-v3.c
@@ -0,0 +1,383 @@
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
+#include <asm/new_vgic.h>
+#include <xen/guest_access.h>
+#include <asm/gic_v3_defs.h>
+#include <asm/gic_v3_its.h>
+#include <asm/gic.h>
+#include <xen/sched.h>
+#include <xen/sizes.h>
+
+#include "vgic.h"
+
+static struct {
+    bool enabled;
+    /* Distributor interface address */
+    paddr_t dbase;
+    /* Re-distributor regions */
+    unsigned int nr_rdist_regions;
+    const struct rdist_region *regions;
+    unsigned int intid_bits; /* Number of interrupt ID bits */
+} vgic_v3_hw_data;
+
+void vgic_v3_setup_hw(paddr_t dbase, unsigned int nr_rdist_regions,
+                      const struct rdist_region *regions,
+                      unsigned int intid_bits)
+{
+    vgic_v3_hw_data.enabled          =3D true;
+    vgic_v3_hw_data.dbase            =3D dbase;
+    vgic_v3_hw_data.nr_rdist_regions =3D nr_rdist_regions;
+    vgic_v3_hw_data.regions          =3D regions;
+    vgic_v3_hw_data.intid_bits       =3D intid_bits;
+}
+
+/*
+ * transfer the content of the LRs back into the corresponding ap_list:
+ * - active bit is transferred as is
+ * - pending bit is
+ *   - transferred as is in case of edge sensitive IRQs
+ *   - set to the line-level (resample time) for level sensitive IRQs
+ */
+void vgic_v3_fold_lr_state(struct vcpu *vcpu)
+{
+    struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
+    unsigned int used_lrs     =3D vcpu->arch.vgic.used_lrs;
+    unsigned long flags;
+    unsigned int lr;
+
+    if ( !used_lrs ) /* No LRs used, so nothing to sync back here. */
+        return;
+
+    gic_hw_ops->update_hcr_status(GICH_HCR_UIE, false);
+
+    for ( lr =3D 0; lr < used_lrs; lr++ )
+    {
+        struct gic_lr lr_val;
+        uint32_t intid;
+        struct vgic_irq *irq;
+        struct irq_desc *desc =3D NULL;
+
+        gic_hw_ops->read_lr(lr, &lr_val);
+
+        /*
+         * TODO: Possible optimization to avoid reading LRs:
+         * Read the ELRSR to find out which of our LRs have been cleared
+         * by the guest. We just need to know the IRQ number for those, wh=
ich
+         * we could save in an array when populating the LRs.
+         * This trades one MMIO access (ELRSR) for possibly more than one =
(LRs),
+         * but requires some more code to save the IRQ number and to handl=
e
+         * those finished IRQs according to the algorithm below.
+         * We need some numbers to justify this: chances are that we don't
+         * have many LRs in use most of the time, so we might not save muc=
h.
+         */
+        gic_hw_ops->clear_lr(lr);
+
+        intid =3D lr_val.virq;
+        irq   =3D vgic_get_irq(vcpu->domain, vcpu, intid);
+
+        local_irq_save(flags);
+
+        /*
+         * We check this here without taking the lock, because the locking
+         * order forces us to do so. irq->hw is a "write-once" member, so
+         * whenever we read true, the associated hardware IRQ will not go
+         * away anymore.
+         * TODO: rework this if possible, either by using the desc pointer
+         * directly in struct vgic_irq or by changing the locking order.
+         * Especially if we ever drop the assumption above.
+         */
+        if ( irq->hw )
+        {
+            desc =3D irq_to_desc(irq->hwintid);
+            spin_lock(&desc->lock);
+        }
+
+        spin_lock(&irq->irq_lock);
+
+        /*
+         * If a hardware mapped IRQ has been handled for good, we need to
+         * clear the _IRQ_INPROGRESS bit to allow handling of new IRQs.
+         *
+         * TODO: This is probably racy, but is so already in the existing
+         * VGIC. A fix does not seem to be trivial.
+         */
+        if ( irq->hw && !lr_val.active && !lr_val.pending )
+            clear_bit(_IRQ_INPROGRESS, &desc->status);
+
+        /* Always preserve the active bit */
+        irq->active =3D lr_val.active;
+
+        /* Edge is the only case where we preserve the pending bit */
+        if ( irq->config =3D=3D VGIC_CONFIG_EDGE && lr_val.pending )
+        {
+            irq->pending_latch =3D true;
+
+            if ( vgic_irq_is_sgi(intid) )
+                irq->source |=3D (1U << lr_val.virt.source);
+        }
+
+        /* Clear soft pending state when level irqs have been acked. */
+        if ( irq->config =3D=3D VGIC_CONFIG_LEVEL && !lr_val.pending )
+            irq->pending_latch =3D false;
+
+        /*
+         * Level-triggered mapped IRQs are special because we only
+         * observe rising edges as input to the VGIC.
+         *
+         * If the guest never acked the interrupt we have to sample
+         * the physical line and set the line level, because the
+         * device state could have changed or we simply need to
+         * process the still pending interrupt later.
+         *
+         * If this causes us to lower the level, we have to also clear
+         * the physical active state, since we will otherwise never be
+         * told when the interrupt becomes asserted again.
+         */
+        if ( vgic_irq_is_mapped_level(irq) && lr_val.pending )
+        {
+            ASSERT(irq->hwintid >=3D VGIC_NR_PRIVATE_IRQS);
+
+            irq->line_level =3D gic_read_pending_state(desc);
+
+            if ( !irq->line_level )
+                gic_set_active_state(desc, false);
+        }
+
+        spin_unlock(&irq->irq_lock);
+        if ( desc )
+            spin_unlock(&desc->lock);
+        local_irq_restore(flags);
+
+        vgic_put_irq(vcpu->domain, irq);
+    }
+
+    gic_hw_ops->update_hcr_status(GICH_HCR_EN, false);
+    vgic_cpu->used_lrs =3D 0;
+}
+
+/* Requires the irq to be locked already */
+void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int lr)
+{
+    struct gic_lr lr_val =3D { 0 };
+
+    lr_val.virq          =3D irq->intid;
+
+    if ( irq_is_pending(irq) )
+    {
+        lr_val.pending =3D true;
+
+        if ( irq->config =3D=3D VGIC_CONFIG_EDGE )
+            irq->pending_latch =3D false;
+
+        if ( vgic_irq_is_sgi(irq->intid) &&
+             vcpu->domain->arch.vgic.version =3D=3D VGIC_V2 )
+        {
+            uint32_t src =3D ffs(irq->source);
+
+            BUG_ON(!src);
+            lr_val.virt.source =3D (src - 1);
+            irq->source &=3D ~(1 << (src - 1));
+            if ( irq->source )
+                irq->pending_latch =3D true;
+        }
+    }
+
+    lr_val.active =3D irq->active;
+
+    if ( irq->hw )
+    {
+        lr_val.hw_status =3D true;
+        lr_val.hw.pirq   =3D irq->hwintid;
+        /*
+         * Never set pending+active on a HW interrupt, as the
+         * pending state is kept at the physical distributor
+         * level.
+         */
+        if ( irq->active && irq_is_pending(irq) )
+            lr_val.pending =3D false;
+    }
+    else
+    {
+        if ( irq->config =3D=3D VGIC_CONFIG_LEVEL )
+            lr_val.virt.eoi =3D true;
+    }
+
+    /*
+     * Level-triggered mapped IRQs are special because we only observe
+     * rising edges as input to the VGIC.  We therefore lower the line
+     * level here, so that we can take new virtual IRQs.  See
+     * vgic_v2_fold_lr_state for more info.
+     */
+    if ( vgic_irq_is_mapped_level(irq) && lr_val.pending )
+        irq->line_level =3D false;
+
+    /* The GICv2 LR only holds five bits of priority. */
+    lr_val.priority =3D irq->priority >> 3;
+
+    gic_hw_ops->write_lr(lr, &lr_val);
+}
+
+static bool vgic_v3_redist_region_full(struct vgic_redist_region *region)
+{
+    if ( !region->count )
+        return false;
+
+    return (region->free_index >=3D region->count);
+}
+
+/**
+ * vgic_v3_rdist_free_slot - Look up registered rdist regions and identify=
 one
+ * which has free space to put a new rdist region.
+ *
+ * @rd_regions: redistributor region list head
+ *
+ * A redistributor regions maps n redistributors, n =3D region size / (2 x=
 64kB).
+ * Stride between redistributors is 0 and regions are filled in the index =
order.
+ *
+ * Return: the redist region handle, if any, that has space to map a new r=
dist
+ * region.
+ */
+struct vgic_redist_region *vgic_v3_rdist_free_slot(struct list_head *rd_re=
gions)
+{
+    struct vgic_redist_region *rdreg;
+
+    list_for_each_entry(rdreg, rd_regions, list)
+    {
+        if ( !vgic_v3_redist_region_full(rdreg) )
+            return rdreg;
+    }
+    return NULL;
+}
+
+unsigned int vgic_v3_max_rdist_count(const struct domain *d)
+{
+    /*
+     * Normally there is only one GICv3 redistributor region.
+     * The GICv3 DT binding provisions for multiple regions, since there a=
re
+     * platforms out there which need those (multi-socket systems).
+     * For domain using the host memory layout, we have to live with the M=
MIO
+     * layout the hardware provides, so we have to copy the multiple regio=
ns
+     * - as the first region may not provide enough space to hold all
+     * redistributors we need.
+     * All the other domains will get a constructed memory map, so we can =
go
+     * with the architected single redistributor region.
+     */
+    return domain_use_host_layout(d) ? vgic_v3_hw_data.nr_rdist_regions
+                                     : GUEST_GICV3_RDIST_REGIONS;
+}
+
+int vgic_register_redist_iodev(struct vcpu *vcpu);
+
+void vgic_v3_enable(struct vcpu *vcpu)
+{
+    /* Get the show on the road... */
+    vgic_register_redist_iodev(vcpu);
+    gic_hw_ops->update_hcr_status(GICH_HCR_EN, true);
+}
+
+int vgic_v3_lpi_sync_pending_status(struct domain *d, struct vgic_irq *irq=
)
+{
+    struct vcpu *vcpu;
+    int byte_offset, bit_nr;
+    paddr_t pendbase, ptr;
+    bool status;
+    u8 val;
+    int ret;
+    unsigned long flags;
+
+retry:
+    vcpu =3D irq->target_vcpu;
+    if ( !vcpu )
+        return 0;
+
+    pendbase    =3D GICR_PENDBASER_ADDRESS(vcpu->arch.vgic.pendbaser);
+
+    byte_offset =3D irq->intid / BITS_PER_BYTE;
+    bit_nr      =3D irq->intid % BITS_PER_BYTE;
+    ptr         =3D pendbase + byte_offset;
+
+    ret         =3D access_guest_memory_by_gpa(d, ptr, &val, 1, false);
+    if ( ret )
+        return ret;
+
+    status =3D val & (1 << bit_nr);
+
+    spin_lock_irqsave(&irq->irq_lock, flags);
+    if ( irq->target_vcpu !=3D vcpu )
+    {
+        spin_unlock_irqrestore(&irq->irq_lock, flags);
+        goto retry;
+    }
+    irq->pending_latch =3D status;
+    vgic_queue_irq_unlock(vcpu->domain, irq, flags);
+
+    if ( status )
+    {
+        /* clear consumed data */
+        val &=3D ~(1 << bit_nr);
+        ret =3D access_guest_memory_by_gpa(d, ptr, &val, 1, true);
+        if ( ret )
+            return ret;
+    }
+    return 0;
+}
+
+int vgic_v3_map_resources(struct domain *d)
+{
+    int rdist_count, i, ret;
+
+    /* Allocate memory for Re-distributor regions */
+    rdist_count =3D vgic_v3_max_rdist_count(d);
+
+    /*
+     * For domain using the host memory layout, it gets the hardware
+     * address.
+     * Other domains get the virtual platform layout.
+     */
+    if ( domain_use_host_layout(d) )
+    {
+        d->arch.vgic.dbase =3D vgic_v3_hw_data.dbase;
+
+        for ( i =3D 0; i < vgic_v3_hw_data.nr_rdist_regions; i++ )
+        {
+            vgic_v3_set_redist_base(d, i, vgic_v3_hw_data.regions[i].base,
+                                    vgic_v3_hw_data.regions[i].size /
+                                        GICV3_GICR_SIZE);
+        }
+    }
+    else
+    {
+        d->arch.vgic.dbase =3D GUEST_GICV3_GICD_BASE;
+
+        /* A single Re-distributor region is mapped for the guest. */
+        BUILD_BUG_ON(GUEST_GICV3_RDIST_REGIONS !=3D 1);
+
+        /* The first redistributor should contain enough space for all CPU=
s */
+        BUILD_BUG_ON((GUEST_GICV3_GICR0_SIZE / GICV3_GICR_SIZE) <
+                     MAX_VIRT_CPUS);
+        vgic_v3_set_redist_base(d, 0, GUEST_GICV3_GICR0_BASE,
+                                GUEST_GICV3_GICR0_SIZE / GICV3_GICR_SIZE);
+    }
+
+    /* Register mmio handle for the Distributor */
+    ret =3D
+        vgic_register_dist_iodev(d, gaddr_to_gfn(d->arch.vgic.dbase), VGIC=
_V3);
+
+    d->arch.vgic.ready =3D true;
+
+    return 0;
+}
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index b9463a5f27..05e6af4384 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -151,6 +151,28 @@ void vgic_put_irq(struct domain *d, struct vgic_irq *i=
rq)
     xfree(irq);
 }
=20
+void vgic_flush_pending_lpis(struct vcpu *vcpu)
+{
+    struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
+    struct vgic_irq *irq, *tmp;
+    unsigned long flags;
+
+    spin_lock_irqsave(&vgic_cpu->ap_list_lock, flags);
+
+    list_for_each_entry_safe(irq, tmp, &vgic_cpu->ap_list_head, ap_list)
+    {
+        if ( irq->intid >=3D VGIC_MIN_LPI )
+        {
+            spin_lock(&irq->irq_lock);
+            list_del(&irq->ap_list);
+            irq->vcpu =3D NULL;
+            spin_unlock(&irq->irq_lock);
+            vgic_put_irq(vcpu->domain, irq);
+        }
+    }
+
+    spin_unlock_irqrestore(&vgic_cpu->ap_list_lock, flags);
+}
 /**
  * vgic_target_oracle() - compute the target vcpu for an irq
  * @irq:    The irq to route. Must be already locked.
@@ -520,7 +542,14 @@ retry:
=20
 static void vgic_fold_lr_state(struct vcpu *vcpu)
 {
-    vgic_v2_fold_lr_state(vcpu);
+    if ( vcpu->domain->arch.vgic.version =3D=3D GIC_V2 )
+    {
+        vgic_v2_fold_lr_state(vcpu);
+    }
+    else
+    {
+        vgic_v3_fold_lr_state(vcpu);
+    }
 }
=20
 /* Requires the irq_lock to be held. */
@@ -529,7 +558,14 @@ static void vgic_populate_lr(struct vcpu *vcpu,
 {
     ASSERT(spin_is_locked(&irq->irq_lock));
=20
-    vgic_v2_populate_lr(vcpu, irq, lr);
+    if ( vcpu->domain->arch.vgic.version =3D=3D GIC_V2 )
+    {
+        vgic_v2_populate_lr(vcpu, irq, lr);
+    }
+    else
+    {
+        vgic_v3_populate_lr(vcpu, irq, lr);
+    }
 }
=20
 static void vgic_set_underflow(struct vcpu *vcpu)
@@ -851,9 +887,13 @@ struct irq_desc *vgic_get_hw_irq_desc(struct domain *d=
, struct vcpu *v,
=20
 bool vgic_emulate(struct cpu_user_regs *regs, union hsr hsr)
 {
-    ASSERT(current->domain->arch.vgic.version =3D=3D GIC_V3);
-
-    return false;
+    switch ( current->domain->arch.vgic.version )
+    {
+    case GIC_V3:
+        return vgic_v3_emulate_reg(regs, hsr);
+    default:
+        return false;
+    }
 }
=20
 /*
@@ -950,6 +990,8 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_ve=
rsion)
     {
     case XEN_DOMCTL_CONFIG_GIC_V2:
         return VGIC_V2_MAX_CPUS;
+    case XEN_DOMCTL_CONFIG_GIC_V3:
+        return VGIC_V3_MAX_CPUS;
=20
     default:
         return 0;
@@ -957,14 +999,6 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_v=
ersion)
 }
=20
 #ifdef CONFIG_GICV3
-/* Dummy implementation to allow building without actual vGICv3 support. *=
/
-void vgic_v3_setup_hw(paddr_t dbase,
-                      unsigned int nr_rdist_regions,
-                      const struct rdist_region *regions,
-                      unsigned int intid_bits)
-{
-    panic("New VGIC implementation does not yet support GICv3\n");
-}
 #endif
=20
 /*
diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
index c6bc3509a5..aca977a5c9 100644
--- a/xen/arch/arm/vgic/vgic.h
+++ b/xen/arch/arm/vgic/vgic.h
@@ -68,7 +68,53 @@ int vgic_v2_map_resources(struct domain *d);
 int vgic_register_dist_iodev(struct domain *d, gfn_t dist_base_fn,
                              enum vgic_type);
=20
-#endif
+#ifdef CONFIG_GICV3
+void vgic_v3_fold_lr_state(struct vcpu *vcpu);
+void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int lr);
+void vgic_v3_enable(struct vcpu *vcpu);
+int vgic_v3_map_resources(struct domain *d);
+bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr);
+int vgic_v3_lpi_sync_pending_status(struct domain *d, struct vgic_irq *irq=
);
+bool vgic_lpis_enabled(struct vcpu *vcpu);
+u64 vgic_sanitise_field(u64 reg, u64 field_mask, int field_shift,
+			u64 (*sanitise_fn)(u64));
+u64 vgic_sanitise_shareability(u64 field);
+u64 vgic_sanitise_inner_cacheability(u64 field);
+u64 vgic_sanitise_outer_cacheability(u64 field);
+unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev);
+#else
+static inline void vgic_v3_fold_lr_state(struct vcpu *vcpu)
+{
+}
+static inline void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq =
*irq, int lr)
+{
+}
+static inline void vgic_v3_enable(struct vcpu *vcpu)
+{
+}
+static inline int vgic_v3_map_resources(struct domain *d)
+{
+    return 0;
+}
+static inline bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union h=
sr hsr)
+{
+    return false;
+}
+static inline int vgic_v3_lpi_sync_pending_status(struct domain *d, struct=
 vgic_irq *irq)
+{
+    return 0;
+}
+static inline bool vgic_lpis_enabled(struct vcpu *vcpu)
+{
+    return false;
+}
+static inline unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *=
dev)
+{
+    return 0;
+}
+#endif /* CONFIG_GICV3 */
+
+#endif /* __XEN_ARM_VGIC_VGIC_H__ */
=20
 /*
  * Local variables:
--=20
2.34.1

