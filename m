Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D367E7C5D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630313.983186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R4H-00074t-KU; Fri, 10 Nov 2023 12:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630313.983186; Fri, 10 Nov 2023 12:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R4F-0006VU-QD; Fri, 10 Nov 2023 12:56:59 +0000
Received: by outflank-mailman (input) for mailman id 630313;
 Fri, 10 Nov 2023 12:56:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R42-0001y0-6a
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:46 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96ed9a6d-7fc8-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:56:40 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIeee019156; Fri, 10 Nov 2023 12:56:25 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9kkyram6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:25 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:17 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:17 +0000
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
X-Inumbo-ID: 96ed9a6d-7fc8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsIFmvozHm0rQeX4BQM1f2BEgzG+WHXglKe4qcKEk4v5QaFDxdQlxDqU0GOyktKEBlyMETCTege3Y5a0aFksJZeLds74XrcXQrhYzYqj9xnzz15mkpJFEu3bNf8XzYdshDl5AXnlXafwsYmm28AxusAbZuP3oJSg5DTv1buUeBfHeza/nso9FeMJUkVWVBXeOqOEWYOM/QiVJjb1O4v9krAZSKko9J9syDBgtAs9IxrfCYbW+BtpK0cGacaNgzyIBsMwxgmURd++IyXGMu4tzbTszKSNmX6tnqpHQwutm9WotlchzWb0BCLDpZjeTJLH4xsKEhqMk/Owdtbue+3xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2jlDSOb6c9i5jMeBlUZxpDiIGDmoeGu3EM5435sgIM=;
 b=cPCUTN/VjXCndL+UAznvrUqQmfbvQjBSCgqy7BzcFGJITJPG8erobEqEGrVgFKv+K2/xE0NxNYRGCWby5ttwnDqyL3l1nCehxr1Aa8Eo26zSSkTz9homofmSqoZziNi+1XJHy9GtytzhdyRUouPrLAX7s2eqpszkfk18mMx3Ni1o9pUaqQ1fI+z92ctXz/25b8JNvY1Er2/7kgGl2Fma34j1v3D6Hum395ri3s3Bk1eps8lyPhhhQ2KYBPMP15UExmisqHTDJNXCAdRybAYgno4HGzL3kDkZF2v945mNkaI5EPsAsLZLud1ubEAd6jthHImaSIHxM51kX0DfwqIUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2jlDSOb6c9i5jMeBlUZxpDiIGDmoeGu3EM5435sgIM=;
 b=BfD6mW23sBJv10+uDbM3Bgf08lsMbsc2KNUkskxf2K3SOEPLpmjDfTBiTiKWtVY2NauD4rQdIDcGEqrAYV9Xmr479Ux7XA9G772PGmfAzuknSPzJFD0/9MxZwH1CzhR7dD8rdWx++tru9rh4gXgrqsvbLbWiRiEb46/fItTliCsaXscWaaYshR3H+/mjot2ulqb1C6VaowIPpHk8fQGaIJ/06XL/B0nldRr2+GI/KusuTUsV8QgphYblI7u0b//sSihOeIr23dTDIU7rpGA4GuVF4SZAXszOuI/IfccE6NY1bc/Qz4XvSBV8Gb5iH7/1SjMnQH4kNjO3XYYKFc5Ynw==
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
Subject: [XEN PATCH v2 03/25] arm: new VGIC: Add GICv3 MMIO handling framework
Thread-Topic: [XEN PATCH v2 03/25] arm: new VGIC: Add GICv3 MMIO handling
 framework
Thread-Index: AQHaE9VLDiAyPu1VFkGDdkAk4XVJMQ==
Date: Fri, 10 Nov 2023 12:56:16 +0000
Message-ID: 
 <cfd46345ad96a447c0dccc371f074a47ed612259.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: 4df896b0-e089-4403-186a-08dbe1ec6dba
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CxnlTOxuaZEk7MAN/We4yQQrEM9waDUvPWoZQMJBkhzvo5mMiMFexr7p8xyl5hmFtdFHr1K8owyi1krK//D3vbV2VeehrwRd7imFpQlWjwCX7icMWXYaLaWv1rbS3BHUDlHsqMDYmsnpv7jNNz+XBMy0aiOcmNj519AOPMh1DXaInEls4CI/X1BAbXHLvrXde1xMTRoHY0jVWNL01Yz9ukJAvEfv9LaHeKvjf3BuheeD6VjrhDPfnLIyy+SElflvgs9I4MR+ph0zsu0EOfuxP0F2Ut5wkWD9R+69CrpNWoKwlR+zWq8tJCuW1a4CoSIh4y+ZrgMBuco6S+YfrQt2uke4b2t6cV2paoxb30afz7kfrV/vZzITZtXkhv7JaOpfxstkF9EdU5oCgYhtX//RtuTHXlLPihUjqTq1XoKt99WV5Dbjhe8Ov1eif1yVt8gaqgcZE6OkoxP/M0OxmoSEar6tWhFnYCnyO4S9c2PuwsS6QepVd4DcTqnDBHFaJPr19ATD4JMoqxtu5fPm7QpnI4khDm3mVgGYYJiS8UBuEQGiCejw4VGywUvh0Ho+YCrN1OmDy7ngf6P+WDOWsFEgpvk1FGCFyd3vYDk2sLh6RI4XGwHpSYllfEn2dC3rLsI9oG5vTbiJtLOL+R9dS0QFqA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(30864003)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(66899024)(83380400001)(38070700009)(2004002)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?okrUPanjYNzUEkVRWRxgDLm6FPp8+bWsi0U9qpV9Ar4TCzG/GumWZCzcc+?=
 =?iso-8859-1?Q?8xxuytIiLjydwqyl6eYIykNWFwkHsxpNuJ+vmz8eUi+iU+rrnftn5kkGfG?=
 =?iso-8859-1?Q?0k50FetzHWbtGBvoJvLerpCLcI08YwbnITgso/abOXMLI7Df6SceJU5nSF?=
 =?iso-8859-1?Q?o+SEvnfrOqUrbBpjJaIioa5G2o0gJnhszX4ZJPtamKxBwKKdGVG6ZBbpln?=
 =?iso-8859-1?Q?ESN1fhL9+CG6k4eG2Fr7hUnloUUHiyKjw+1vyxAGyOLTPQzZrZf40IWPwR?=
 =?iso-8859-1?Q?FND+27Vj1MqCkWXINdk9Banqc8w6YDqKy/35elzgZ7+vZxgGAZC2+fyC1U?=
 =?iso-8859-1?Q?n7I1hzpPZmeO5mCG3jOIFvqwCWjo0phUtH+SJ46wTAR+vPz+uMiPKdNNEi?=
 =?iso-8859-1?Q?xo6/GUWvazUD29keIs34jppiZiXBA4+ljktFSayGF3uqSlB5F3s7Pg2si4?=
 =?iso-8859-1?Q?dore71Ymhnz6ZDic/sP1qKYEqOkrTvenuysCUriaUYH18l5HcZNibnkatI?=
 =?iso-8859-1?Q?adXHYH0u/OvpoH9P6zlqydSEYzfR10X4VOJG2vAjBVjGjqLRCEYIOFiBy1?=
 =?iso-8859-1?Q?yQ8UJ4PYrOoTvfrKFdgw6Lw8QNFJrCWJtVt+uAmLN2uFWsO27dptLXTrvL?=
 =?iso-8859-1?Q?DZxvnRgH9IeBzW4fq/jaBzv/RkyQGKI1MQ8t5pRln55Ii760ieXT7S4ne9?=
 =?iso-8859-1?Q?I0lmB9socQp64EvUVbVzpBqft+q6ZGBQck7CgGE6KZ0LOdBYOwEfFrZw+v?=
 =?iso-8859-1?Q?KTD5D4zjB7qj+mVLKkXjM1dYMuAFXp5n3LUW8BEBC90DZkcYreSXw1fPmc?=
 =?iso-8859-1?Q?tZcOjBiAMBZ+I9wh4QpBmFSx0dEehfFSr1jUp0VSOO0XR3uZEXMQ4CL6ao?=
 =?iso-8859-1?Q?vFL2XLXw/xjRoEtj0Co7D787K/sIT6nGVV5L3yUnpEczfWVMXTB8FjLTHT?=
 =?iso-8859-1?Q?b6I802MTo9rNXcqvMXEiJ6BjNnzsD5687zcs6yRJhYvxt3HY1FgN4efndF?=
 =?iso-8859-1?Q?fxXSNZ+5gfFsCSJFk3bra39PbJrVMwgAxACMKXB72Pv4xx7rmSXs4RXS/M?=
 =?iso-8859-1?Q?tZiCY6AeHh2f7H8nHKhZ5ClEjNMLv6SIf4LZwNjHqKLmUdD61gFM4tRWto?=
 =?iso-8859-1?Q?3BDjWX9nR8Ms/5tNBIw3cpAHD1U3sQG/9wicfdyloto0DwL2qDVOD+HNso?=
 =?iso-8859-1?Q?cswf2vlR5ICPNFHJSuol17+Jin6Y1IrCmhLo0k3MtVC55MvuyGCFtZImO+?=
 =?iso-8859-1?Q?L7buGcSi807muAUJknlorHAehAnB+H1YfDeu3LjOY02epU27+DtfbrQxTf?=
 =?iso-8859-1?Q?bE29ZpFDZWdGYzWsWHvWKwJc87Cb0UQnHerCE1144grDQiTrmFu9qPFGvH?=
 =?iso-8859-1?Q?IIvLesLLGRIaPvWgAEhZnoIbvW9PMaUpnk/2T1oHGo9mcp4vc89dzaLGUA?=
 =?iso-8859-1?Q?DenUhiI+aMECljG5PGi5iPt9XZiclFNCNyupxQXsGP3oQfikZ76NW+pN9l?=
 =?iso-8859-1?Q?nQuriBu0FbGfJmKdSPb0/GiFIAnTp/PKo8dsdI8nE8mcmy/Nn+sDQLYCl3?=
 =?iso-8859-1?Q?gTq4NtfsSqqw3MUR3d4HrzP0HW4gj+gYRuYR5ugFmFytQ8wDnbf3wwFTLB?=
 =?iso-8859-1?Q?FWpjeJjkJlP+2yzOwMK1mOxxFr9ZXWfwQacl9nQjEseDTWoyB00OdUTg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df896b0-e089-4403-186a-08dbe1ec6dba
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:16.8564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyIKvqhbxIV9/E/TCJqMRl2RtJRjNECQHS/ojQHeTX2iY0eDW8y94CRzkeveSCcgCkLRBoWL6gMrs1BY7cp5yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-GUID: fN-zLAFXUvUhOCFYKsTUhp7zIJpitx5j
X-Proofpoint-ORIG-GUID: fN-zLAFXUvUhOCFYKsTUhp7zIJpitx5j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=962 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Create a new file called vgic-mmio-v3.c and describe the GICv3
distributor and redistributor registers there.
Also we provide a function to deal with the registration of the
separate redistributor frames per VCPU and allocation of redistributor
regions.

Based on Linux commits:
ed9b8cefa91695 by Andre Przywara
1aab6f468c10a1 by Christoffer Dall
ccc27bf5be7b78 by Eric Auger

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/gic_v3_defs.h |   2 +
 xen/arch/arm/include/asm/new_vgic.h    |  18 +-
 xen/arch/arm/vgic/vgic-init.c          |  10 +-
 xen/arch/arm/vgic/vgic-mmio-v3.c       | 435 +++++++++++++++++++++++++
 xen/arch/arm/vgic/vgic-mmio.c          |   3 +
 xen/arch/arm/vgic/vgic.h               |  15 +
 6 files changed, 475 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/arm/vgic/vgic-mmio-v3.c

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 227533868f..b7059635d7 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -35,6 +35,7 @@
 #define GICD_IROUTER                 (0x6000)
 #define GICD_IROUTER32               (0x6100)
 #define GICD_IROUTER1019             (0x7FD8)
+#define GICD_IDREGS                  (0xFFD0)
 #define GICD_PIDR2                   (0xFFE8)
=20
 /* Common between GICD_PIDR2 and GICR_PIDR2 */
@@ -89,6 +90,7 @@
 #define GICR_INVLPIR                 (0x00A0)
 #define GICR_INVALLR                 (0x00B0)
 #define GICR_SYNCR                   (0x00C0)
+#define GICR_IDREGS                  GICD_IDREGS
 #define GICR_PIDR2                   GICD_PIDR2
=20
 /* GICR for SGI's & PPI's */
diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm=
/new_vgic.h
index 1e76213893..11d8f71851 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -31,6 +31,8 @@
 #define VGIC_MAX_SPI            1019
 #define VGIC_MAX_RESERVED       1023
 #define VGIC_MIN_LPI            8192
+#define VGIC_V3_DIST_SIZE       SZ_64K
+#define VGIC_V3_REDIST_SIZE     (2 * SZ_64K)
=20
 #define irq_is_ppi(irq) ((irq) >=3D VGIC_NR_SGIS && (irq) < VGIC_NR_PRIVAT=
E_IRQS)
 #define irq_is_spi(irq) ((irq) >=3D VGIC_NR_PRIVATE_IRQS && \
@@ -94,6 +96,14 @@ enum iodev_type {
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
@@ -121,11 +131,7 @@ struct vgic_dist {
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
@@ -174,6 +180,8 @@ struct vgic_cpu {
      * parts of the redistributor.
      */
     struct vgic_io_device   rd_iodev;
+    struct vgic_redist_region *rdreg;
+    uint32_t rdreg_index;
     struct vgic_io_device   sgi_iodev;
=20
     /* Contains the attributes and gpa of the LPI pending tables. */
diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index f8d7d3a226..c3b34be192 100644
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
@@ -207,7 +211,7 @@ int vcpu_vgic_init(struct vcpu *v)
     if ( gic_hw_version() =3D=3D GIC_V2 )
         vgic_v2_enable(v);
     else
-        ret =3D -ENXIO;
+        vgic_register_redist_iodev(v);
=20
     return ret;
 }
diff --git a/xen/arch/arm/vgic/vgic-mmio-v3.c b/xen/arch/arm/vgic/vgic-mmio=
-v3.c
new file mode 100644
index 0000000000..b79a63ce3e
--- /dev/null
+++ b/xen/arch/arm/vgic/vgic-mmio-v3.c
@@ -0,0 +1,435 @@
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
+#include <asm/vreg.h>
+
+#include "vgic.h"
+#include "vgic-mmio.h"
+
+static const struct vgic_register_region vgic_v3_dist_registers[] =3D {
+    REGISTER_DESC_WITH_LENGTH(GICD_CTLR,
+        vgic_mmio_read_raz, vgic_mmio_write_wi,
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
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 64,
+        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICD_IDREGS,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 48,
+        VGIC_ACCESS_32bit),
+};
+
+static const struct vgic_register_region vgic_v3_rd_registers[] =3D {
+    /* RD_base registers */
+    REGISTER_DESC_WITH_LENGTH(GICR_CTLR,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_STATUSR,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_IIDR,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_TYPER,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_WAKER,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_PROPBASER,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_PENDBASER,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_INVLPIR,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_INVALLR,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_SYNCR,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
+        VGIC_ACCESS_32bit),
+    REGISTER_DESC_WITH_LENGTH(GICR_IDREGS,
+        vgic_mmio_read_raz, vgic_mmio_write_wi, 48,
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
+static struct vgic_redist_region *vgic_v3_rdist_free_slot(struct list_head=
 *rd_regions)
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
+    ret =3D vgic_check_iorange(rdreg->base, base, SZ_64K, size);
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
index 5d935a7301..1c3f861887 100644
--- a/xen/arch/arm/vgic/vgic-mmio.c
+++ b/xen/arch/arm/vgic/vgic-mmio.c
@@ -619,6 +619,9 @@ int vgic_register_dist_iodev(struct domain *d, gfn_t di=
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
diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
index 2819569f30..a8e3ef5970 100644
--- a/xen/arch/arm/vgic/vgic.h
+++ b/xen/arch/arm/vgic/vgic.h
@@ -73,6 +73,9 @@ int vgic_register_dist_iodev(struct domain *d, gfn_t dist=
_base_fn,
 #ifdef CONFIG_GICV3
 void vgic_v3_fold_lr_state(struct vcpu *vcpu);
 void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int lr);
+unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev);
+int vgic_v3_set_redist_base(struct domain *d, u32 index, u64 addr, u32 cou=
nt);
+int vgic_register_redist_iodev(struct vcpu *vcpu);
 #else
 static inline void vgic_v3_fold_lr_state(struct vcpu *vcpu)
 {
@@ -80,6 +83,18 @@ static inline void vgic_v3_fold_lr_state(struct vcpu *vc=
pu)
 static inline void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq =
*irq, int lr)
 {
 }
+static inline unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *=
dev)
+{
+    return 0;
+}
+static inline int vgic_v3_set_redist_base(struct domain *d, u32 index, u64=
 addr, u32 count)
+{
+    return 0;
+}
+static inline int vgic_register_redist_iodev(struct vcpu *vcpu)
+{
+    return 0;
+}
 #endif /* CONFIG_GICV3 */
=20
 #endif /* __XEN_ARM_VGIC_VGIC_H__ */
--=20
2.34.1

