Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FD87E7C4B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630307.983137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R46-0004we-EH; Fri, 10 Nov 2023 12:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630307.983137; Fri, 10 Nov 2023 12:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R45-0004oA-Oi; Fri, 10 Nov 2023 12:56:49 +0000
Received: by outflank-mailman (input) for mailman id 630307;
 Fri, 10 Nov 2023 12:56:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3z-0001y1-CI
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95c9fe29-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:38 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIeej019156; Fri, 10 Nov 2023 12:56:29 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9kkyram6-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:29 +0000
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
X-Inumbo-ID: 95c9fe29-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rv5kwpzvWw0XEwFyhoIpk7RN9jo9m3jLv4QF0shKKK8EUbHsSfCtYZXX1szT1Nbn2TOoMHQ83w4NxD99RJYOvbFQf4ofePrWxegooPs2gXMQqLYhbD0VJe+j6LquXYLuJ/LSZz5zzH37jzGLHCfq3WzQ20yJeBEVLv/Huk6Pj22QDeGamWmTGzEJ3ZU/yNpM22BhOanZN/W1TrZWMluWpANHna4ENYXpyixapGnPzrfUiOiKnQnM8jKa+IvxGvYnvcXbol3m5Rbiyf844JqWlVFmVaZqPf/auEM4FjegiRxaRUVBB3ar74b7GEHXqoLR02OsaqiEB4FIUfQiy8WKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47n0bB5G3TmN3uYlmHnSquD6nIz7tCxZvB5mgkD08G8=;
 b=EItLHzpLvFaGBlgAA09EQzcliE0UdEaS6MrJrMrYhHZyUoFlY3nvcYKc7dcoQFGnv+YOU9Fl2gdgkuzFR3hUGNB+XNs1dX5H9Oc5nGrtXEGqoG9pJAckq1/lfJFvzqU3ibMh6z1urzpZgihmU7u3QCt8aHeQ7MNMTdEWCxp56qmvWbPwhg60yLwcOL/nxyLQpOz9BZIaLPj802OhVbajx9PbPNqGJrtnSaC2O2UTnuzes/R/cZkCcs/G+KFWgPSMK6TtFtL38vjO0v0mjcb2f0XqWUrFOc60KSiwU+4+9fHmsXFrdC1YTsDKvrZojB0MohwjKftNoI4vMppwXqPQIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47n0bB5G3TmN3uYlmHnSquD6nIz7tCxZvB5mgkD08G8=;
 b=Gfu8kWR9/aQ/SiaePsN3t57R9QUmko6Ek1w03uuOhZbU4YNAasbzGnMQbXsyQbLQOMly4iFoYPykce6up0tM/trCDtEBs9+CLFFsW+vVk/88p9Ce7Hjpm3lnwTDp+ZuKt3lTrSg0TZqNkmQM1LM49M0te9M95gXlFyiFH2R6sdWm5vqilx0GTp+fQf77M3ILNJoqp7GOwFoaoE3KyxXi/80TtZhNAyF8pEkS5+V6MJFVubwmN3RpPQzwnTo7vzSUrj9z8uvq26Fr2kYcaNkJMl2Fcac+gWlvcxb11mrkwAxAG1xR2gm72xV6gnRnv2WNAPAjia/wk9N7JlQfT4Vhzw==
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
Subject: [XEN PATCH v2 15/25] arm: new VGIC: its: Introduce ITS device list
Thread-Topic: [XEN PATCH v2 15/25] arm: new VGIC: its: Introduce ITS device
 list
Thread-Index: AQHaE9VNnykDJMuRjky7h0IUhySwAQ==
Date: Fri, 10 Nov 2023 12:56:21 +0000
Message-ID: 
 <0bbd5eb62605243e1ea437e8ca113f8851b1e49e.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: fe251b08-cd6c-4d7e-2eb7-08dbe1ec7119
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rm8YD+fj78vuOQklbNVMmVV1xtnfdddBvvt9deEL5N3kF7VVeqYXU3M209qQtFrgzuTgYOMdJqhzvrtj18dB1zOmYylbDps635/iGYQBB2GimVXJY441lma7WWwy3LT5VcMhd+uE+d5B62OEu6dbpkEjvMF0pQrWPtAvErJLaKWrvPGUlRwoVkfSxgZC0FqOLDANoctkSsE/XL7/NPesBzkfvja4lOPw/hXXgpBPevcRgz8dqwZbZHVKnek53JKlIBpNBkMt3Bm78MHZdRa0yBpMKJz3XyQp6LiiAJNsUhukZDXIe7m6gpLJ7vnTMPKTlpz2h2IXa50pAB6I3ZJOZ94B8ww78/P+dtkHYz6HJHBM8VtVNpPsZ92XBo5pUxDMxNW2Pf+2S+MFmjES3hJ+qwP8Nj4UcLb2B08MTiokAEBjA/UpF0UgWJJK6E3zG4YjriUQKn3Lqv/6dy775+Pu89cbE9SnoLjYxSYLI3IeyEIRwplFFKOGntiJ6omg76cbLMrOP7KdejDDQTH1V8f0+zb/+FRGcoqb9P/sdEexxNio/1TNY1U2l+6n+c26anHNs5BQ5faJWgolZBokR8E37K8tI7B/WfO2OcIkK4R9vj3bNHxgY8u92qcoMP72A1Vq
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?1XIAeqnq/mUGWl82vNpI9HCVs+nBRHO2WTl6V81eLR8cRk3LuNBhjBXESQ?=
 =?iso-8859-1?Q?qY//rG9tKe1FyTk6Kh3/iQfeE7llo1+XbX+tJTCLHsELtIFbSBX8DgIhJJ?=
 =?iso-8859-1?Q?KXQc3FtbgqmtjDGtWONK1SF4BdHE/cgF9Zj/JTyDN4j/NnZ2W02NYvapen?=
 =?iso-8859-1?Q?CcFRdPPSZ18qGiIpqwS+cZ0a3XoUVRfmZlTSZyUOMLsiM7S0w5GFDs39LK?=
 =?iso-8859-1?Q?h9DZyyGGJmMHDZjYEkWEbhT5lm6Asw3nzGROvVTUSkJlRc/TrVV96l4qKn?=
 =?iso-8859-1?Q?uvgkndUAnXCHjniSOXLddsUITYTnAbikjMGKpUyJevlBKmixEVBOOROUJ+?=
 =?iso-8859-1?Q?ewWbsdPAzRcUBxwJ6qvwEJghK+ng4vC0Zq2e+U19e6eR15YqlmM4FQ+fwb?=
 =?iso-8859-1?Q?Su4kwCFiogrebUocyD4UpHrRizuikB6PBrDHGvuOv/w5vD69TpP66WHSIv?=
 =?iso-8859-1?Q?cdi8eVsKpxDNaT3k5DVBNwd8ggS16WLfGGIQRqylMUlRozLKX8N5v0Lrya?=
 =?iso-8859-1?Q?sEcuUO6ztK0/jYSilwfZowmlHsuz7TsrTiRmYO2gMzYlPrv/hfe372jU2t?=
 =?iso-8859-1?Q?VGaciPuUkr8QghTwggYia3EMlcO5+hO+fYxIG0eK9HKtCyopVqifFSRKGr?=
 =?iso-8859-1?Q?txLM0oY63DGC6IFejzftSPlAP7LUUNZWQSN9y5Uqfg3UoKsavUVM+9DOW0?=
 =?iso-8859-1?Q?MtTbXgr1G5XUDHtBkjsV1Tx9w+k+pEORd6I5CyAp3fwRUD+AtVdP3lcPP6?=
 =?iso-8859-1?Q?Zgako1QcgL8S8MmNnzOy/Y07et6U5ObAwP9zyMkiFBjhedu0G2Gar2qWAi?=
 =?iso-8859-1?Q?7ZeErc33ZWnG4/MSa2S/Q3oH27oafBR0o2HnKsdeW1vxi2reO6tjoVpwu0?=
 =?iso-8859-1?Q?fTUWDJaD6G0lLklztifm6dMgxNvV5qmhZ3zsz1O6Etn62OchvCwEiIxJ+7?=
 =?iso-8859-1?Q?MaUncAIqoLu+CQww3NPRPMylHm40Z1yn+s9Azwou/YfDs3JUwv1iACOh/6?=
 =?iso-8859-1?Q?RpLxKPMl/x+KhFU6GkB57NhysrMobaFgD5Ww54ZgOHscXRzReg4WVGxhVt?=
 =?iso-8859-1?Q?8OjnZ+gc1AlM0tACD/0qN2x6oFkXwJGvgJIxHLokWYKU+9eLam1VfbM8hC?=
 =?iso-8859-1?Q?3NzK5l1jxkZ+MN9VS8kUFS5om01ALCoEkyxv9DL/e35JqBPSOOkJDNZSyI?=
 =?iso-8859-1?Q?8Yl/tSaqdpcqXVjF2FQhrwBbsDmTH0NQM3Ynyg+pcVTSOMxKCyMKuHbNf3?=
 =?iso-8859-1?Q?YRnTVUP+rrMwQnhsXfoS8RwfgxUXhVf7sXxxEWX+YNLsz7ZPGGUZNNhJA7?=
 =?iso-8859-1?Q?kck4SvyMqn17eodNkS49Qr4k5SWpK5EbWFUsUiA9AqlI3BWAKEQ5CmOE2y?=
 =?iso-8859-1?Q?w2eGnxoXTCpUbpjPX0DblFLQime72B2EHtz+TiSDt5FlIXCSqG5cKsvqrz?=
 =?iso-8859-1?Q?+9tURNFePPqRfvJjIoTiMlBWRB08RYfqQAHByJki8Vu3aAEsWmvGnB80PQ?=
 =?iso-8859-1?Q?oBSMmGTx772AnwU2VHn3QYxu9HEYS3cm6lM2x+QAZRCixo94C+M4kvK0mS?=
 =?iso-8859-1?Q?flRlEAW1zT9eaVxyTtRTEt3oC++dsyqUZUF6hJT4qWLI6m+nTgKgBmmGHG?=
 =?iso-8859-1?Q?S3rHC32KZaVYHQNyWbog2dpsXelMhXUdUPTqWCTnvQe35L1OMuJq5O6g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe251b08-cd6c-4d7e-2eb7-08dbe1ec7119
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:21.0861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aapjjt0FJULk8po+iNdaDZdKTzbnq/ZZt/eta47B4f86PSPreICQeChE32YhA1IYAiLaIT2jtDoLgXO+J+VPtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-GUID: 5-rVATPLu5VKnS0Jwqq74gdizvQZxjDB
X-Proofpoint-ORIG-GUID: 5-rVATPLu5VKnS0Jwqq74gdizvQZxjDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=993 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Add the vgic_its_device structure and the list of devices to the vgic_its.
Implement the functions to allocate, free, add and delete the device from
the list. Add the function to find the device in the list by the device id.
And make them avaliable to the HW ITS code.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/new_vgic.h | 27 +++++++++
 xen/arch/arm/vgic/vgic-its.c        | 86 +++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm=
/new_vgic.h
index ec2882dcf1..00a5557921 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -122,9 +122,26 @@ struct vgic_its {
=20
     bool enabled;
     struct vgic_io_device iodev;
+    struct list_head device_list;
     paddr_t doorbell_address;
 };
=20
+struct vgic_its_device {
+    struct list_head dev_list;
+    struct domain *d;
+
+    /* the head for the list of ITTEs */
+    struct list_head itt_head;
+    u32 num_eventid_bits;
+    void* itt_addr;
+    struct host_its *hw_its;
+    paddr_t guest_doorbell;             /* Identifies the virtual ITS */
+    uint32_t host_devid;
+    uint32_t guest_devid;
+    uint32_t eventids;                  /* Number of event IDs (MSIs) */
+    uint32_t *host_lpi_blocks;          /* Which LPIs are used on the host=
 */
+};
+
 struct vgic_dist {
     bool                ready;
     bool                initialized;
@@ -171,6 +188,7 @@ struct vgic_dist {
      * GICv3 spec: 6.1.2 "LPI Configuration tables"
      */
     uint64_t            propbaser;
+    spinlock_t          its_devices_lock; /* Protects the its_devices list=
 */
=20
     /* Protects the lpi_list and the count value below. */
     spinlock_t          lpi_list_lock;
@@ -227,6 +245,15 @@ static inline paddr_t vgic_dist_base(const struct vgic=
_dist *vgic)
     return vgic->dbase;
 }
=20
+#ifdef CONFIG_HAS_ITS
+struct vgic_its_device *vgic_its_alloc_device(int nr_events);
+void vgic_its_free_device(struct vgic_its_device *its_dev);
+int vgic_its_add_device(struct domain *d, struct vgic_its_device *its_dev)=
;
+void vgic_its_delete_device(struct domain *d, struct vgic_its_device *its_=
dev);
+struct vgic_its_device* vgic_its_get_device(struct domain *d, paddr_t vdoo=
rbell,
+                                         uint32_t vdevid);
+#endif
+
 #endif /* __ASM_ARM_NEW_VGIC_H */
=20
 /*
diff --git a/xen/arch/arm/vgic/vgic-its.c b/xen/arch/arm/vgic/vgic-its.c
index 0ae6048456..3eceadaa79 100644
--- a/xen/arch/arm/vgic/vgic-its.c
+++ b/xen/arch/arm/vgic/vgic-its.c
@@ -33,6 +33,92 @@ static unsigned long its_mmio_read_raz(struct domain *d,=
 struct vgic_its *its,
     return 0;
 }
=20
+/*
+ * Find and returns a device in the device table for an ITS.
+ * Must be called with the its_devices_lock mutex held.
+ */
+static struct vgic_its_device *find_its_device(struct vgic_its *its, u32 d=
evice_id)
+{
+    struct vgic_its_device *device;
+
+    list_for_each_entry(device, &its->device_list, dev_list)
+        if ( device_id =3D=3D device->guest_devid )
+            return device;
+
+    return NULL;
+}
+
+/* Requires the its_devices_lock to be held. */
+void vgic_its_free_device(struct vgic_its_device *device)
+{
+    struct domain *d =3D device->d;
+   =20
+    BUG_ON(!d);
+    list_del(&device->dev_list);
+    xfree(device);
+}
+
+/* Must be called with its_devices_lock mutex held */
+struct vgic_its_device* vgic_its_get_device(struct domain *d, paddr_t vdoo=
rbell,
+                                         uint32_t vdevid)
+{
+    struct vgic_its *its =3D d->arch.vgic.its;
+    struct vgic_its_device *device;
+
+    if ( !its )
+        return NULL;
+
+    device =3D find_its_device(its, vdevid);
+    if ( !device )
+        return NULL;
+
+    return device;
+}
+
+/* Must be called with its_devices_lock mutex held */
+struct vgic_its_device *vgic_its_alloc_device(int nr_events)
+{
+    struct vgic_its_device *device;
+
+    device =3D xzalloc(struct vgic_its_device);
+    if ( !device )
+        goto fail;
+
+    INIT_LIST_HEAD(&device->itt_head);
+
+    device->host_lpi_blocks =3D xzalloc_array(uint32_t, nr_events);
+    if ( !device->host_lpi_blocks )
+        goto fail_host_lpi;
+
+    return device;
+fail_host_lpi:
+    xfree(device);
+fail:
+    return NULL;
+}
+
+/* Must be called with its_devices_lock mutex held */
+int vgic_its_add_device(struct domain *d, struct vgic_its_device *its_dev)
+{
+    struct vgic_its *its =3D d->arch.vgic.its;
+    if ( !its )
+        return -EINVAL;
+
+    list_add_tail(&its_dev->dev_list, &its->device_list);
+
+    return 0;
+}
+
+/* Must be called with its_devices_lock mutex held */
+void vgic_its_delete_device(struct domain *d, struct vgic_its_device *its_=
dev)
+{
+    struct vgic_its *its =3D d->arch.vgic.its;
+    if ( !its )
+        return;
+
+    list_del(&its_dev->dev_list);
+}
+
 static void its_mmio_write_wi(struct domain *d, struct vgic_its *its,
                               paddr_t addr, unsigned int len, unsigned lon=
g val)
 {
--=20
2.34.1

