Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B267E7C5E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630314.983202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R4L-0007r5-Q5; Fri, 10 Nov 2023 12:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630314.983202; Fri, 10 Nov 2023 12:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R4J-0007Am-Oa; Fri, 10 Nov 2023 12:57:03 +0000
Received: by outflank-mailman (input) for mailman id 630314;
 Fri, 10 Nov 2023 12:56:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R42-0001y1-Ck
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:46 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96cbe06d-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:40 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIuvZ025691; Fri, 10 Nov 2023 12:56:24 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9j2g0qjw-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:23 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:18 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:18 +0000
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
X-Inumbo-ID: 96cbe06d-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmfMeDiLhV50Jd17E0cA7jEFlvs14Z8ha/cIB3Y5MAeJ2WxdX9d4KQ847V3L/TXBEt/CK2X98ooWv3idvTOHtY/sKOOeC6rahTtBgeXZ8LD0NhGJnfvJ0ez3niG+boCI0Nfc090GYw+uOOTwwgSTyXpl+KG8262xCoHqhniQteY+TM1jrwdwx6Gm7/+SQ5ediseMWslw6STjLbvU323Nhuu9A0jf8Voo1uk9VRDcp8iMLU5R32KAZf2GzLZwQQIwUjvoLaqqz9VhzTaM6Hiv9BeFvW54hSoZWI1ssaltzaiS6Ksrp6pGkCymLCR3jUhjpZq/0tkPqwFVmQcY+xOsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5jdN5uXcsNiZFC3fCVZlqgLJLq+GNIYO2Q9vhRpzs4=;
 b=Lxlb/Ai+1G4CkRgeyOocmc1Kw2+mI5Pu66T/BN0hvC05zewUZygxv1b1A++RHvieiTYLOoWq02yY7+uMHhJ6o90sRaKZWLgfNVfLbci1ES+kpMVra8MDT0I7v96TYnvPumoRNNqUNBoKEeLfHa0ECfSptdxzcrP1lNp1l5u64m7XKmggty16VI0dPnJG+ZWeqCNAM3rFnTWwZhijRtuM7zu4a7nu++ERSKnN2sNNAsFVZhumAHU3oI5Iu9cVjNnJ7Dz91wr73kXdKye69yoD02Dt/1+f1yoHq65orEoif3CNPWf8lGNsV6sQmMzceb2uzT/Y1D9gIogDbR+eUc/GtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5jdN5uXcsNiZFC3fCVZlqgLJLq+GNIYO2Q9vhRpzs4=;
 b=lu3re+7kF1jLfxjAoZeIv/sBC7OJJNv+e9gFmYaQPn/Zii0oSqXFdk13b5uxKwaV+nVe6p+7XJX7V4bD2hZhlUCZwHQyL2B+/Xnl9MiNK/amwpLq6Hvix41yNVzPK92jPYS0PoCV+usUeLOA6d+yVf73hl92SdatiXIfB8DqEmNGcLwx0lj+4CohXQjnBACJJG4F0PyXV6coUjbQwy+4gTh62BAYull27OaD3jsRTwX7rnqSpFpt0jFQmmz/bhh7mHXVjsJPSULJizMaZcodTfDpCuQn08LJXE/NDZdtLH2hADxQhWqScFFbZIdGL+xUihFgUqalGLqD3y2YCB+oog==
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
Subject: [XEN PATCH v2 05/25] arm: new VGIC: Add GICv3 redistributor IIDR and
 TYPER handler
Thread-Topic: [XEN PATCH v2 05/25] arm: new VGIC: Add GICv3 redistributor IIDR
 and TYPER handler
Thread-Index: AQHaE9VL00f8rSPwJ0KirkGhv4uq5Q==
Date: Fri, 10 Nov 2023 12:56:17 +0000
Message-ID: 
 <e07041f75b4cdf6141a1a939855f9721f15d692b.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: 0f7f8033-a143-46f9-2709-08dbe1ec6e2a
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 efwsLLG2yZFY6Z8jyywI3ZQPhNMVYHJKLdQeDsLVLGjwKCxy4HJ3EUh6u6rWnWEVKf8NhyvSF8kCeXv83ZiGlcPKFAH05AhYTiCMTMsJV6UphkmX71hzf+D/XRKI8c1F9uvUAHG0eGUpzmQ3dFveFPK1R/bLAw2XG5yQh/PjGKDXaKNE68DbTB9V8DjGF26109mq1BHZqyZIf0Z8Blb19k9R9Zu9tuECBM+ZB4EN7JmQwM2uq7rVNFQ6wxSfH+TIMHNW2fB77yuNnXpnf7uKrMwMQB/kIe33QQGCLRqEOyPP1o+HRG2CRxO+yPqBzxuwBpA8SNh+EJsegW93IxjFspsmT/DbdvdtIFbTtVAQfAqo//G1aeN47Hbg5yjAc6c6UFE/fn6MlZWVwDLsiS+md2cZBuzxYZTiSfvPbKJCmRvKeeuQ7ZrJMMIR6bGeqhuGKcS10p0cfxIrLDC5CsOQpmTAvV0uLGPhjVK5tqulZPo0UGDovlhyYDYbWWbkXzQC1co9ZX5PJIF8JkCHa74el3/etnmHq8us73pgNFdxhaZZfsadMwQskTqg1d2JjZWKUDE07tROfZOPJ6pkj2nEjifA/vzmzug3OC6P3o2KzhypjIFxRLdwwftvVgCmxV9+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?hZh1ks05FwnMIzJLppAdA70WnCx89WQTWvXJjZ9pBd4kJLCn9ca1v/tg8u?=
 =?iso-8859-1?Q?j5uoO0uC/ys670+SCySOOS+SzPgpuYW3R3NwTa4U5Cx+Hew66JJlqumm/7?=
 =?iso-8859-1?Q?TaaxMLDg1v9siK4OUoSG7yj5MLuCFrxrMIim2qqTVzUfV1TgUMXWHBc2Na?=
 =?iso-8859-1?Q?xaNxH6Z/r/nBAxojo22PQK9g3/j2TsjLCvuXrq92ERJIHQWGH5ECU/ns1k?=
 =?iso-8859-1?Q?Fizq/fbzM8ohtrLO593D4YOCbJdrQVWLNo4eNzUQKymsviWZwChMY9pPC5?=
 =?iso-8859-1?Q?H/D+OFLevEv4+CoG09BkvgROUlOLTw3TSGT0Mr7vVY9kxAhdeNnbRcKygW?=
 =?iso-8859-1?Q?PfkRim0HjqkaqnLzQKReDHty71Xv/8WD3bPIQptYunbnUboK+VuhZkH+2F?=
 =?iso-8859-1?Q?nAEv6smi5M8XvRbXUVdU1jDleRhZHoAFPJonC/pBWp1WNgTsu0uTmDxmL0?=
 =?iso-8859-1?Q?FsuMjnpEc/OOaPwWhdz3fB0I+MxvPTIPakEvzgZg8Ssuq4+uz/UTqkY7u5?=
 =?iso-8859-1?Q?kejBVFJRFCM+aSM2MuoY8oxHN+68dC/8SV2IJanuEb4i1HPKIgWkd/SKe7?=
 =?iso-8859-1?Q?AguBl5BlmPi9+HPm5TNCys0kBVYLuFfNsnAR5nOkKyZmi5oEcya/NS/wD5?=
 =?iso-8859-1?Q?+ZToq8p9Q6UHFaTzQ6oJ8IGcjsZb0NNip9P0zdlu7eju5HwLOaxzyoPUS+?=
 =?iso-8859-1?Q?UG5gUQZ5J7d4doDPPEm+I9QknMWL8SxZRGCOdlSZ0/DfvCXJjkeLC+hmXJ?=
 =?iso-8859-1?Q?QpcIcy8bqqUsSUnlXiqQAZZQ0Oj2h470eLeaM0qFfJJYP5fGfCfIMfSTVT?=
 =?iso-8859-1?Q?NWrROyydoCiE7piK39Xpz3qDPHxby0Z67TvrIeJYB6dmwXMQEoJNhN5Ate?=
 =?iso-8859-1?Q?AI5XynQaZPvV+PHHDvQug00Fl2esPeObTN0bIrDt5L/GRN5eG2DnalawLL?=
 =?iso-8859-1?Q?m1rK1AsSdyrgrwCwogyn36XNeFYIycghX3RL8w2wEYQNngdsKRoiCHDi3v?=
 =?iso-8859-1?Q?Fwq4oJ0hKjZLQECzgLwnBf+3crdGn3bMTGygVRtaJOc2PSac3gjGPbGh8o?=
 =?iso-8859-1?Q?Ss+Q9ACP8UQrrjo1ukH/KYmGPAed/7EY6VqU97X8eH53wLXA5ZhEjUp2cS?=
 =?iso-8859-1?Q?OWIXcNEkVHrYotwvNhc5KVVzErpzubVSoVC5iSQIaH5c6wBCK0/aHf+ean?=
 =?iso-8859-1?Q?QKa98jGoakJEC1Nv7p6tsbVWFvxPjr6f8lgtOHhKNEHYPDFG6LtUCbr467?=
 =?iso-8859-1?Q?o8LQ3F8lVZt9d5DxCCIpaOD6RzXXy2V00qaiACqJRtfId36ZUPUK5lKTwc?=
 =?iso-8859-1?Q?ymWW7HjX3alCSOXaBu2Waa4jcJAQDqIAkw1+gu3JDOKsCbg9P2+r6lDM3u?=
 =?iso-8859-1?Q?BDZFwlXRnxGFYNeMqKAjFU86SKPKKytxx5oZHSHLfwfngIol4Zp+84f0DC?=
 =?iso-8859-1?Q?0hoOp1yNJScj+lRleCMFbCopvg1UY32c38ltFndY54mNjOrMcXClf3iD2z?=
 =?iso-8859-1?Q?SMzLcw5MFYUeFTfuy50NF/ZK+n2gw+5rQhe6HvmvZfaAXr2XNGtXDubcMK?=
 =?iso-8859-1?Q?sS5bJF3bjGC6an2H6KQXAKsxGQF6qCPmqROXFVLhkvrNOQvF2UeN3N6FXs?=
 =?iso-8859-1?Q?ZGgGSZJOJkHpomdzUWViV9jM9vcjwV8jes442SV2rRMi9andtsBVZw5A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7f8033-a143-46f9-2709-08dbe1ec6e2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:17.6259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DqkaOknF/vZrURWnSXlUj4ySUD6kW3a5aL18z9ub0S278IHmP3D2VIzh+WiFUvNhMDnVkD7XcajTFr95DGtx3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-ORIG-GUID: YkRQIsWeqjlxtxDB-HdRWnhZtjNIiqKL
X-Proofpoint-GUID: YkRQIsWeqjlxtxDB-HdRWnhZtjNIiqKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=994
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

The redistributor TYPER tells the OS about the associated MPIDR,
also the LAST bit is crucial to determine the number of redistributors.

Based on Linux commit 741972d8a69ce74 by Andre Przywara

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/vgic/vgic-mmio-v3.c | 65 +++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vgic/vgic-mmio-v3.c b/xen/arch/arm/vgic/vgic-mmio=
-v3.c
index beb3d6ad2a..707a38c727 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v3.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v3.c
@@ -22,6 +22,13 @@
 #include "vgic.h"
 #include "vgic-mmio.h"
=20
+/* extract @num bytes at @offset bytes offset in data */
+unsigned long extract_bytes(uint64_t data, unsigned int offset,
+                            unsigned int num)
+{
+    return (data >> (offset * 8)) & GENMASK_ULL(num * 8 - 1, 0);
+}
+
 /*
  * The Revision field in the IIDR have the following meanings:
  *
@@ -91,6 +98,60 @@ static void vgic_mmio_write_v3_misc(struct vcpu *vcpu, p=
addr_t addr,
     }
 }
=20
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
 static const struct vgic_register_region vgic_v3_dist_registers[] =3D {
     REGISTER_DESC_WITH_LENGTH(GICD_CTLR,
         vgic_mmio_read_v3_misc, vgic_mmio_write_v3_misc,
@@ -148,10 +209,10 @@ static const struct vgic_register_region vgic_v3_rd_r=
egisters[] =3D {
         vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
         VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICR_IIDR,
-        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
+        vgic_mmio_read_v3r_iidr, vgic_mmio_write_wi, 4,
         VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICR_TYPER,
-        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+        vgic_mmio_read_v3r_typer, vgic_mmio_write_wi, 8,
         VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICR_WAKER,
         vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
--=20
2.34.1

