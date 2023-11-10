Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 905C17E7C63
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 14:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630368.983234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1RFC-0007ur-E3; Fri, 10 Nov 2023 13:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630368.983234; Fri, 10 Nov 2023 13:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1RFC-0007rW-Ap; Fri, 10 Nov 2023 13:08:18 +0000
Received: by outflank-mailman (input) for mailman id 630368;
 Fri, 10 Nov 2023 13:08:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R43-0001y0-6p
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:47 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97bdc968-7fc8-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:56:41 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACHn4o029609; Fri, 10 Nov 2023 12:56:30 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3u93ptjrxk-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:29 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM0PR03MB6244.eurprd03.prod.outlook.com
 (2603:10a6:20b:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21; Fri, 10 Nov
 2023 12:56:26 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:26 +0000
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
X-Inumbo-ID: 97bdc968-7fc8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWTY9vk7dTTeZkGbBbQCKUseRvHC9ZMktD1o0BlK/YJH3ayxw96emMrTDkldGuUx2dOyLHJFGVSR5tjJreBFhExwBupzEq/3u99RG9C7owTo0MStcw1UF+F8GQ/jHyQVp6qhwzLDlVt2KggiaxuIPREotK590pLb/HsF2/jGF8pmWUwvk5cdvvXga1iGSu3BGJcIyl66dS2H4bkOYUNZfqW/E3k0mIvFLcONGrxk48I6U8TtGPxmvRKf0XcVpy1lqWphLcZmyKH8SqIt26r/klttypGKfGkGQhfuKkrHjQ48IgdLNCtsGY9o05h4tR0YhmebOAqJNpuhE7wWG8tF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TkmTLEQVHA1r1cVFkXW4q/O26dCX6I43k5x/u2XgFQ=;
 b=mJsCjq1AtracdpTcoMr14WCj8zros1Z1QwBuL+2TRn7YVVgwwmrq2EiONvQyiSMNyPgFyU/801G7465TwJ26hyR+5wNZg4agbvNHqVax5ReA5cPIlohTGSq/QWZlC/iTD6x3MD1+t62/YiqNvqKf3RbxybE/KZ4bDgHtS3yATjDPgVOCi2jx9KmMKRXv+scTnzWmLtUoAfAw81dA+FuGt9X8/X5/7Pz3ghzR8PGCRy1+fe/GT7dahjKuzEev/H1V5yVvaINIpSqj8ypbPEFqLBihJfs0kszhHKpB/xeAATaarFwYQEKwjetzKp3NEog4odNJiPSzPy7BNxYKncawVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TkmTLEQVHA1r1cVFkXW4q/O26dCX6I43k5x/u2XgFQ=;
 b=UeduFmBNRQwvTaHpPaT5TAye0klznATFuJsqpzgiAg/32Z75mOW0BJVZZQ70wbxZr9txK8ZBSUzUNps9fG80npk1Y9UJaU1MxLrL6qtZqQeqHan5SebE7XJ841kLjN0qEs4b8LCY4VAYB+8rlcU4QZTYeoYhr8U5BZetfJCWqyCIr8qx6407E8w/M5ITsK7/auszgpRmu1VO6G9Rp5l+N3IezTWwTPG8PipARD//cDyRli46LlcY9/vIgssfkOqJ7NOYssJeHRMyTNLgsT9W2ybLjG6a3p1/TVgwcX0QNeW3b5YILWlymSh6s9zk19CqxAPubtscXg54th5XEpvFMg==
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
Subject: [XEN PATCH v2 24/25] arm: new VGIC: its: Wire new ITS into the build
 system
Thread-Topic: [XEN PATCH v2 24/25] arm: new VGIC: its: Wire new ITS into the
 build system
Thread-Index: AQHaE9VPZ7cPBIWT6UCB5x9GhgF0Kw==
Date: Fri, 10 Nov 2023 12:56:24 +0000
Message-ID: 
 <9fb487465f44f84f8d4358900df7e4d4d0bdbfd7.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM0PR03MB6244:EE_
x-ms-office365-filtering-correlation-id: 751e9753-3996-4767-05dd-08dbe1ec7315
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /tw2qn0NA6QIrHckqs76Ejmc/XeI3GC+h/edAIqRAHgmZjfoHdd383n5EudFUZtG4BLsucIBHrkJAaqDJySf5D9rSHmmoN2bJnkAYt0Svwmzp5BaZlysUGlD7HF7jeuR9yzhPhAzoRdH/5SU0hv7bsyOxhU+8li84qW5kvXuhdrXWva+Za8hbkVmsgi0fvjEQl71o9hXq5ufPAV/c2VWSn8n5zmk4dxN695KUDP3bsA12kOrS4MZHd5CMv1eWBRTWh9ubArsHBwk5LuUEYYMvGPW+s0m/0Qf0BypXkZXGq3O6dYcdUhiGkcVb2HeCwb5MjyiEak1YqX7/TwJyBdD2vAHPYujI1FwclTb7TnVrHEwbVV63luM/ZMBHVph73FjO1S1bqkw4jZYEKGlJVDduRljj2gf81NN3gc+vYMNsajdq7GyUuASZ1VDcTTF+kC9vUi/hE8/TiVxPwk7aY/uJC45uHVFg2r2znlSybOrusWx0dyA1GXFqpN/ibbB0yc/sWX0ZGlHKyTJ8NqdnJ76+ly1uBtN42ZShXek/R55HubuBxo1D81zMDdunouniBdrdI7xdK649NDJxuwitA0Wf9NjPLRG54PhMYcBD6gUGp+FGWesJs7B2v/9PJW2yksL
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(5660300002)(41300700001)(2906002)(83380400001)(26005)(8676002)(4326008)(8936002)(122000001)(54906003)(64756008)(316002)(6916009)(2616005)(38100700002)(76116006)(66556008)(66476007)(91956017)(66446008)(66946007)(38070700009)(6512007)(6506007)(478600001)(6486002)(36756003)(71200400001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?f2wXy2j/0piI09iMfEEUYu9z+8IqqWEkCMiCHCynijzzZieJvF6jEjYX5O?=
 =?iso-8859-1?Q?sUfga54ZHKRsiVvG+vhr/LyLPypb1Tva688nYJSZ1GK30QCt8Kai6HAiFb?=
 =?iso-8859-1?Q?4QlcxiDB0EcKQ64p+bPbkaXGbf5CiSjmMYqDUQeWQExv3fDEfi8aodpJli?=
 =?iso-8859-1?Q?09jn/hDh8+vZd7lIE5P0CfZ8kV+BJf3Dw9FHUdDtTaW3fraY3BwZvFLlSt?=
 =?iso-8859-1?Q?3vkLbRNOGIpKgcKEWm94x08L7VCW6aGzkeQdPwSUoXfuS0lWgytK4630kW?=
 =?iso-8859-1?Q?akua5UzxH96L3im2gVmXZ43sciFgqltwPpYnFuGnFR1U5Vc0VFwlJgO4Yq?=
 =?iso-8859-1?Q?4yLIxau8CxL43ehxhHFp5b1mZJN5j6RpsKThI8ax7IZ6zbrjfagNO8rr8b?=
 =?iso-8859-1?Q?32v2f5ki8tsQ08nkqJwBlHl/aHdJa3B9WcFIO8Big0ei7S94CWO2Q1/KX2?=
 =?iso-8859-1?Q?8V+BGVqFXWWZpODpLBqAwN0mii7+gnO2sd9nuZof/RILL/tS7vUKJPNz9P?=
 =?iso-8859-1?Q?D0lJ+AovVVidOJkDD9eZrF6GS5LCZDxkHD0X/6K7fka2lLWJRmg9OZTelD?=
 =?iso-8859-1?Q?s3h2gpNyg5ydusrx0NQAluA1xM5jlNsM/53ZK6VekDGT+nQCZs0S4Xja/J?=
 =?iso-8859-1?Q?O9vf1209z7kFrP6UgALgWVBvVFRffdJM08lwAKgBcP/M31v6zDAkbXB23r?=
 =?iso-8859-1?Q?gldELiwV5qGQ2VCiSnl2KmNrTyT9BfmR/YUg/mMiaUu2Vl6O2H5FGUSInS?=
 =?iso-8859-1?Q?g2xULxTiw5h4aQzMfm9V2jrDe1uMQPa+7wdRtFK5GccHDXmYl/IDmDx6Tw?=
 =?iso-8859-1?Q?357MWqVPzsLbYgR+YiYfk3n8Wui+j1VtZ3uTqREr/SyyfmXfJVsb4ZMzKH?=
 =?iso-8859-1?Q?KZcuO8PeMXg3cncTSqvrRVITOvu05JW+sSAYK8trsDKty8RLTkFgu2zc4J?=
 =?iso-8859-1?Q?2Ggh0cohIeh3WwHGmiW3yRt5XE+OFsYLz2yMSFKo+bORq9ze1zesIUJ5/P?=
 =?iso-8859-1?Q?LLX/0xxuELaTA21Pk806VD6kBpHyCHACwoGjGlHLb1qfd32H1kIu9rSbRV?=
 =?iso-8859-1?Q?GOdANK0sycfzUSap1wLsf/sj/VgXVdcmoOzE2AYWPTlwZ7s1w3YGS6uR1m?=
 =?iso-8859-1?Q?5/Z/o5DTZuamU4i6nu+RmFxPkKQrdIYJQh5FTdcJ6nsAw3sruoy1UWEOHP?=
 =?iso-8859-1?Q?fhj6GLwKkjCqab24MUiHF7WFjghLU9kDrgu/4GhEJxoo9wsGd4ss7aWBzh?=
 =?iso-8859-1?Q?owkXvXzbrwoXeyizyjIgYRmgO2u5jAS2fXa9kweF+oapgmy8QV+8pQf2sq?=
 =?iso-8859-1?Q?wNJ0hD6xIrK782ifd5LK0+3r0/rw9Q/tJ22tw5fc863ouLoHO8/Bbax/jY?=
 =?iso-8859-1?Q?WDzgLbnzutO57TS65lSXIobzhgCyXaelA4TTA+Nwn6SRUGl3n1tNDxIXZR?=
 =?iso-8859-1?Q?CMgz+tCqGIoe/Kksrr80fPCp9/Z7ecCTusBPOEjfYi4EQP0OsGddygSEXc?=
 =?iso-8859-1?Q?OVF/xLdDfv/Nuos5s1KrxIE80Dfdl/n9BAVfDfZOn02rhpA8bcPbyABOij?=
 =?iso-8859-1?Q?timHWR75DBXMt/Pmq3ewZM9rgWWVu7cbdFm607y+NDG/qiUA26ClcJoA5D?=
 =?iso-8859-1?Q?NpBFAWp6mmjxSFFMmcce5Py7oUw853PVuREmqfPXuXygGwpjD0fkjvAA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 751e9753-3996-4767-05dd-08dbe1ec7315
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:24.2742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KOpVS5IHZX5Vxbx/IU+eiqApYPqgbHHhIpFn9hEUnoyoVsaGfkMSo/rQwSn3M2Fn072by5r+7KMaeo7oGeQFtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6244
X-Proofpoint-ORIG-GUID: LGpLdLLlK9UrjPtc8liztQabBI6vERCK
X-Proofpoint-GUID: LGpLdLLlK9UrjPtc8liztQabBI6vERCK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 mlxlogscore=667
 mlxscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Add vgic-its.o to the build system.
Remove the dependency on !NEW_VGIC from CONFIG_HAS_ITS.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/Kconfig       | 4 ++--
 xen/arch/arm/vgic/Makefile | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index c91011bc15..d803793b09 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -90,8 +90,8 @@ config GICV3
 	  If unsure, use the default setting.
=20
 config HAS_ITS
-        bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORT=
ED
-        depends on GICV3 && !NEW_VGIC && !ARM_32
+        bool "GICv3 ITS MSI controller support (UNSUPPORTED on old VGIC)" =
if UNSUPPORTED || NEW_VGIC
+        depends on GICV3 && !ARM_32
=20
 config OVERLAY_DTB
 	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
diff --git a/xen/arch/arm/vgic/Makefile b/xen/arch/arm/vgic/Makefile
index 21a71d2502..fe6821c724 100644
--- a/xen/arch/arm/vgic/Makefile
+++ b/xen/arch/arm/vgic/Makefile
@@ -5,3 +5,4 @@ obj-y +=3D vgic-mmio.o
 obj-y +=3D vgic-mmio-v2.o
 obj-$(CONFIG_GICV3) +=3D vgic-mmio-v3.o
 obj-y +=3D vgic-init.o
+obj-$(CONFIG_HAS_ITS) +=3D vgic-its.o
--=20
2.34.1

