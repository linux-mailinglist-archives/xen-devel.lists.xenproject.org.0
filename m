Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732968188DE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 14:49:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656830.1025289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFaTE-0003sr-UH; Tue, 19 Dec 2023 13:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656830.1025289; Tue, 19 Dec 2023 13:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFaTE-0003qH-R5; Tue, 19 Dec 2023 13:49:16 +0000
Received: by outflank-mailman (input) for mailman id 656830;
 Tue, 19 Dec 2023 13:49:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUif=H6=epam.com=prvs=6717fc9f42=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1rFaTD-0003q9-N0
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 13:49:15 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63c86e7c-9e75-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 14:49:13 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BJCqlo0006134; Tue, 19 Dec 2023 13:48:59 GMT
Received: from eur02-am0-obe.outbound.protection.outlook.com
 (mail-am0eur02lp2232.outbound.protection.outlook.com [104.47.11.232])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3v2nus4efd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Dec 2023 13:48:59 +0000 (GMT)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB7328.eurprd03.prod.outlook.com
 (2603:10a6:102:109::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 13:48:55 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::3776:9f2d:8305:b645]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::3776:9f2d:8305:b645%6]) with mapi id 15.20.7091.028; Tue, 19 Dec 2023
 13:48:55 +0000
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
X-Inumbo-ID: 63c86e7c-9e75-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foTd+PCEqtexpJ5Pxg+zlJOBP0TcXfvWnK+LpYyrJh7m6SgmYBNXhTqRDD4L+QJoSIFGsuWleDZE7uBXNPzsX+UXOwK0l/ygY8adhVZqNUUtuJq05w+fTkFiHLuAir3L2C/HYD2b4nX2LCDKdx8CzpJ9UpILRTZiW/+LkeE1WTIJRcNAZ33ZyEXlpgBJys9gqKPX/WVZqUJgovBUMO0QOfUgiYHjMDe4POvHF0Bi8FmV6yhh5EC22VOd7BKv1P8kgW/SuwM95lieA880kl/plFw325zdvH48t5/HkQYbjWQrgwAeU5WYRtqlZbdkjftm3NnczSeKhjAvOF97HN9qNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQUx5CAm0avy2+p0DgAFA5Au4J5PpEX0kulG5SVNslA=;
 b=k5LvdGcGVm91s94ieljCMSavrHkAvgbnxeSqZP8fg5JX/QRux9s6bQstIs2HRJcuD5f3LZgQa6g3qXOCC+OlmSR6GAnXJ9jqVVenDYgwH79CU6/15OlsuCLMJNwxbp0MTM8PJ9pUrRwmggi/J2/VwSCrvglux8wZCNOwyNzfqAIfyYp8QdeBgsANTyzp1znXKRjFfBDRgQ+WdbJ3nJzHQL5zXf1y0oTBUnhB5v7y3osvWtlggZ8XC6Os355D8iP3reUuMuitMAhFI4J1CKmWRoeSTcyBPtBDOdRoyRSHZ60Rbx176SIwX6yWGVXYxV5pSavjuc+7mU9GIdvvBo3OhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQUx5CAm0avy2+p0DgAFA5Au4J5PpEX0kulG5SVNslA=;
 b=PUwezdhJlLduD6JrUKiB4/FOteejIzseyqzd3xrCOtP3AshiFdyQGXqmoWEvwQBt+Uvbq8ahQtlPhl1Ia/B1DYIWg1BcdFl1Ix2j6YUUdf4gi0HIJVlSv+rMg32HRY3CuE/vrBxmPv5duprF18BUdadjETb/omqt8LPbksu3wla7Y+IqNVGh1/VY1N22RPHTtD0xj5AL7q9K+suQ8qehIngPWQf5NJBVs7aX8jqz8WgrinzvXU5kv44RCsBa9LSW/UEpxjIojb4SQCL4JH5Jb1oM/KCo2DmRkyxaOOaQfsSDXi9T2ug7tV9uY31j6G9SWqlij7W/wEhXTy1RFum5BA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Wei Liu <wl@xen.org>,
        Anthony
 PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Andrew
 Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Thread-Topic: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Thread-Index: AQHaMoIbfIb6LpTMIEGFPPk7JAqgfQ==
Date: Tue, 19 Dec 2023 13:48:55 +0000
Message-ID: 
 <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB7328:EE_
x-ms-office365-filtering-correlation-id: ef262839-5c18-44d4-e8b3-08dc00993e73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sAmeg+vC04nalkgRrQoGxLf0j5oqs1fdDk2mthvXZOTYqvkUpgHNaefgbjFYgXe+VADxrbu0GDFYDz4ZMhCFfNpUT5jhVO2JWtelcwwnqm5Qr0X7Cs7ORAsu6tTuFGIJwGAQOO5ArjAGGaLRzlAVGV2hFI49iNom9fGIMzRZZ492WqLXcl8wWvdZcoLWGBAvh5FEjDX2tFgC7wLNEDx6lzLO8yBQEA2e3e7cnfTwFVKDWaqSSSAaeohsfePvQ1EFHhBlNOjJTKGtl5PMAqPtq/1NnGXVxgJfScyRpUXwT0R4KC79uAxVWIJZGVUcfjjzYQnIVcP5LLVAOUr/ccQC2u8rslFDuOicphRzwnxZUM+p4wYXhaNlBn5YJ5635HNWB6EvcHfs9dK/jEZadKNqPcroHK2vxLk8UvURkWFW4tSoAzFZSlHXAiimI1sDKsINhExVHr7150+g7HxktH62iM6GAJirqXIWH/t5S50TPB0qqZSGlOxxHoSG3L28bfSQWeczZdp8Kh1pifi6yb729QaCdLPzNEV8BsW3oOLx6osJqYgzaY+mJJpNNm8hnbOVgSjheNLWshHMZrl6T8TjPPy+tJa/VJ9R97EunGtm4ms=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(86362001)(36756003)(66476007)(91956017)(71200400001)(478600001)(76116006)(6916009)(6506007)(66946007)(64756008)(54906003)(66446008)(66556008)(41300700001)(38070700009)(26005)(107886003)(6512007)(38100700002)(122000001)(83380400001)(2616005)(7416002)(2906002)(966005)(6486002)(5660300002)(316002)(8936002)(4326008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?fqsXQb/rqx65118SaXyAwI8rKaHKZNB7wU5eiIq6ww0xH6D507JsH0lemy?=
 =?iso-8859-1?Q?wWElaOVFNlR3k86bZlaN/s4eCzdCyyB3frdbgDW0fLriDPC9ghCN4tYEXW?=
 =?iso-8859-1?Q?mW9qN2CptZ0gCUhG5AypplzPT3XC8Z+QBaN5VXmYHfaCR8LlwTv9Lu3BC2?=
 =?iso-8859-1?Q?r7OA45+pKv5Bg2ow5GImr69Kyp02NSGL+4uHZC7cnFt21N+yX/gXWb39j0?=
 =?iso-8859-1?Q?mOYjObr33t0jrMVcWZB/m1uu2ROJ3A4ydraaCRmaJM3/wivRGU7A+HprGZ?=
 =?iso-8859-1?Q?SUA8PFE/lxHHdlcjmZQeBPdmGO8sibU2hsgL1kI7wudm9fsWQCvdZOE4Vs?=
 =?iso-8859-1?Q?wyftEpROO6b6UssVhWWHsNyD6pfyGGJRWPV1idSsjknvACYQzBUSs12qgc?=
 =?iso-8859-1?Q?g9EZLCkNcRoah2Xt1iSdux/qVaMsPhzMes522lOwCwywjy+fwgeIYbAZWk?=
 =?iso-8859-1?Q?iYeCZZRtwx4S6AL22LbLVtWgoE4xIULdKC5fb1X+1iSLQbPJWDBe4qrFUb?=
 =?iso-8859-1?Q?8L9QY9Mz7+xyM/lL3jBVf3m5VbMR/VqpDgcJHfyKWLH5VZP+x8kMYAzBb7?=
 =?iso-8859-1?Q?9RvN+dmV9w4dtWNbP2Y3yG0yMcBMfQ3o4WqVvuOeI5Q0v9Zvyx+H89rj36?=
 =?iso-8859-1?Q?nZVF9LV1xDhiUp1ZrrfJ5hPczBp+KYTmGJa6xwcOl2YtIwbz2WjKEEk/BX?=
 =?iso-8859-1?Q?Q6bkdZ44Wv1SUbhJDri/7EcB5hEYVBhpV4hbK7sD3ncwqFsKEeo4129GDs?=
 =?iso-8859-1?Q?kjDxPF3Bqlsbf+GtBkaM+aV1L1lVEc1sNpZ5JtKLUpYH8OemZ2zVjlyHOG?=
 =?iso-8859-1?Q?Wru2EQklSxqAkNH4HTzH9txyQYIBN9Gskh+3wDQ0tQ7xu/L2FquR3jzdki?=
 =?iso-8859-1?Q?Io0yf7jFxr8NSGJTUpJIpworKELuhnj8jj0DbR85DBmpTWy/0UlsduIY1N?=
 =?iso-8859-1?Q?dtKS2d+50hhYT9tY0cAv3yxrlVF/hiyBEdCJ2hARm2bvnDscHuP2mpynhb?=
 =?iso-8859-1?Q?+hqyzenUgSJzLqNXqxQfNRdJ7qSjKGibmcz7Q3DW4MrR5q0UnyeXNix3kf?=
 =?iso-8859-1?Q?d6+t9wY1liBNPqNR7t9gyaGEY18AY4nvM51zTLPoxf5NbzJ5BezfAes3al?=
 =?iso-8859-1?Q?rDvP+k8OzoWJRgBPqxlJ0eCEhNBgb0Vo/RADtu3+jNrGamFMMruKqfkykr?=
 =?iso-8859-1?Q?nkGmT8gQidbUFO0WiuSRGlhXwApZv1SIMT6csOV1PGmMJtNtvKPTvhCK1W?=
 =?iso-8859-1?Q?fLnIYzr3bPrBURVE59WrI9M+XLhR7JuicfmU80m+DC/a2R/QMHylX/tvbv?=
 =?iso-8859-1?Q?b234KreB6rrpGAZgHCsFlNO0QnvaRWmAbW49f8wQ/uvRlv8EY3jj7yKBD4?=
 =?iso-8859-1?Q?93dqADBfQDpE55AKBhHIYJW1eBrKKKGQQo+opz56J2aJXPgpKZNzSQghru?=
 =?iso-8859-1?Q?Sb5Jf5G5PBScbeKFnpX4XYcTaIBE3cRTcyQn4WO9Eb7BPkjpu+CfJbQhuy?=
 =?iso-8859-1?Q?aam/3ASYwA8Q4WeZ/dzcP5YJdRog5aUUoADMkRzZwSOWvIoTuZd6Uvi2Xs?=
 =?iso-8859-1?Q?c9XFidbhlHi5gnvC1t0KuC+7HeRh9E4odDXoNaGN9Lls0Drwn/Z1LDk6l3?=
 =?iso-8859-1?Q?QUj9hfFUqum5VzOcPLXqFWvam7NsREiUmL0Eyr40IXBna1jlG5bJr7iw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef262839-5c18-44d4-e8b3-08dc00993e73
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2023 13:48:55.7477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NEmthT0DP8vLFPdZOuIE/ki4TCxrpu41YlMJIH8feBeQxugHSQ+511X6v9qOvP6PCu/6iSBiIKPiz2uKKMtOmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7328
X-Proofpoint-GUID: LnYZzPKakv_FuVdGfy9X6s-yeTftP5d8
X-Proofpoint-ORIG-GUID: LnYZzPKakv_FuVdGfy9X6s-yeTftP5d8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=731 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312190102

This patch adds the ability for the device emulator to inject MSI
interrupts into guests. This is done by adding a new DM op to the device
model library.

It is not possible to reuse already existing inject_msi DM op, because
it does not have a devid parameter, which is required for translation of
MSIs to interrupt numbers on ARM.

This approach was successfully tested on a virtio-pci setup with QEMU
backend emulating block devices with following changes from the mainline
Xen:

This branch was taken as a base for virtio-pci:
https://github.com/xen-troops/xen/tree/xen-4.18-xt0.2

With added new VGICv3 from here:
https://github.com/Deedone/xen/tree/new_vgic_v2
(although it should also work with the current VGIC)

And patches from this branch to allow for proper ITS emulation in guests:
https://github.com/stewdk/xen/commits/pcie-passthrough-arm-vpci-v11

The main purpose of this RFC is to get some feedback on the addition of
the new DM op. Is it the right approach or should we somehow modify the
existing inject_msi DM op to be compatible with ARM?

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 tools/include/xendevicemodel.h               |  4 ++++
 tools/libs/devicemodel/core.c                | 19 +++++++++++++++++++
 tools/libs/devicemodel/libxendevicemodel.map |  5 +++++
 xen/arch/arm/dm.c                            | 15 +++++++++++++++
 xen/arch/arm/include/asm/new_vgic.h          |  2 ++
 xen/arch/arm/vgic/vgic-its.c                 |  2 +-
 xen/include/public/hvm/dm_op.h               | 10 ++++++++++
 7 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.=
h
index 797e0c6b29..e28710a6a5 100644
--- a/tools/include/xendevicemodel.h
+++ b/tools/include/xendevicemodel.h
@@ -236,6 +236,10 @@ int xendevicemodel_inject_msi(
     xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr,
     uint32_t msi_data);
=20
+int xendevicemodel_arm_inject_msi(
+    xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr, uint32_=
t devid,
+    uint32_t data);
+
 /**
  * This function enables tracking of changes in the VRAM area.
  *
diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
index 8e619eeb0a..d15ffa46fb 100644
--- a/tools/libs/devicemodel/core.c
+++ b/tools/libs/devicemodel/core.c
@@ -448,6 +448,25 @@ int xendevicemodel_set_irq_level(
     return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
 }
=20
+int xendevicemodel_arm_inject_msi(
+    xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr, uint32_=
t msi_data,
+    uint32_t devid)
+{
+    struct xen_dm_op op;
+    struct xen_dm_op_arm_inject_msi *data;
+
+    memset(&op, 0, sizeof(op));
+
+    op.op =3D XEN_DMOP_arm_inject_msi;
+    data =3D &op.u.arm_inject_msi;
+
+    data->addr =3D msi_addr;
+    data->devid =3D devid;
+    data->data =3D msi_data;
+
+    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
+}
+
 int xendevicemodel_set_pci_link_route(
     xendevicemodel_handle *dmod, domid_t domid, uint8_t link, uint8_t irq)
 {
diff --git a/tools/libs/devicemodel/libxendevicemodel.map b/tools/libs/devi=
cemodel/libxendevicemodel.map
index f7f9e3d932..8dceba5056 100644
--- a/tools/libs/devicemodel/libxendevicemodel.map
+++ b/tools/libs/devicemodel/libxendevicemodel.map
@@ -44,3 +44,8 @@ VERS_1.4 {
 		xendevicemodel_set_irq_level;
 		xendevicemodel_nr_vcpus;
 } VERS_1.3;
+
+VERS_1.5 {
+	global:
+		xendevicemodel_arm_inject_msi;
+} VERS_1.4;
diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index 5569efa121..b42f11e569 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -27,6 +27,7 @@ int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_set_ioreq_server_state]           =3D sizeof(struct xen_=
dm_op_set_ioreq_server_state),
         [XEN_DMOP_destroy_ioreq_server]             =3D sizeof(struct xen_=
dm_op_destroy_ioreq_server),
         [XEN_DMOP_set_irq_level]                    =3D sizeof(struct xen_=
dm_op_set_irq_level),
+        [XEN_DMOP_arm_inject_msi]                   =3D sizeof(struct xen_=
dm_op_arm_inject_msi),
         [XEN_DMOP_nr_vcpus]                         =3D sizeof(struct xen_=
dm_op_nr_vcpus),
     };
=20
@@ -112,6 +113,20 @@ int dm_op(const struct dmop_args *op_args)
         break;
     }
=20
+    case XEN_DMOP_arm_inject_msi:
+    {
+        const struct xen_dm_op_arm_inject_msi *data =3D
+            &op.u.arm_inject_msi;
+
+        if ( d->arch.vgic.its =3D=3D NULL )
+        {
+            rc =3D -EINVAL;
+            break;
+        }
+        vgic_its_trigger_msi(d, d->arch.vgic.its, data->devid, data->data)=
;
+        break;
+
+    }
     case XEN_DMOP_nr_vcpus:
     {
         struct xen_dm_op_nr_vcpus *data =3D &op.u.nr_vcpus;
diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm=
/new_vgic.h
index dfc434ab41..dedc294ce9 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -275,6 +275,8 @@ int vgic_its_add_device(struct domain *d, struct vgic_i=
ts_device *its_dev);
 void vgic_its_delete_device(struct domain *d, struct vgic_its_device *its_=
dev);
 struct vgic_its_device* vgic_its_get_device(struct domain *d, paddr_t vdoo=
rbell,
                                          uint32_t vdevid);
+int vgic_its_trigger_msi(struct domain *d, struct vgic_its *its,
+                                u32 devid, u32 eventid);
 #else
 static inline void vgic_enable_lpis(struct vcpu *vcpu)
 {
diff --git a/xen/arch/arm/vgic/vgic-its.c b/xen/arch/arm/vgic/vgic-its.c
index fd5aaf4a70..706987d93a 100644
--- a/xen/arch/arm/vgic/vgic-its.c
+++ b/xen/arch/arm/vgic/vgic-its.c
@@ -608,7 +608,7 @@ int vgic_its_inject_cached_translation(struct domain *d=
, struct vgic_its *its, u
  * Returns 0 on success, a positive error value for any ITS mapping
  * related errors and negative error values for generic errors.
  */
-static int vgic_its_trigger_msi(struct domain *d, struct vgic_its *its,
+int vgic_its_trigger_msi(struct domain *d, struct vgic_its *its,
                                 u32 devid, u32 eventid)
 {
     struct vgic_irq *irq =3D NULL;
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.=
h
index fa98551914..a7d72e4389 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -444,6 +444,15 @@ struct xen_dm_op_nr_vcpus {
 };
 typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
=20
+#define XEN_DMOP_arm_inject_msi 21
+
+struct xen_dm_op_arm_inject_msi {
+    uint64_t addr;
+    uint32_t data;
+    uint32_t devid;
+};
+typedef struct xen_dm_op_arm_inject_msi xen_dm_op_arm_inject_msi_t;
+
 struct xen_dm_op {
     uint32_t op;
     uint32_t pad;
@@ -463,6 +472,7 @@ struct xen_dm_op {
         xen_dm_op_set_mem_type_t set_mem_type;
         xen_dm_op_inject_event_t inject_event;
         xen_dm_op_inject_msi_t inject_msi;
+        xen_dm_op_arm_inject_msi_t arm_inject_msi;
         xen_dm_op_map_mem_type_to_ioreq_server_t map_mem_type_to_ioreq_ser=
ver;
         xen_dm_op_remote_shutdown_t remote_shutdown;
         xen_dm_op_relocate_memory_t relocate_memory;
--=20
2.34.1

