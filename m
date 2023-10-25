Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9972B7D67F6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 12:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622788.969927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvat4-0008Te-3v; Wed, 25 Oct 2023 10:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622788.969927; Wed, 25 Oct 2023 10:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvat4-0008QN-0q; Wed, 25 Oct 2023 10:13:18 +0000
Received: by outflank-mailman (input) for mailman id 622788;
 Wed, 25 Oct 2023 10:13:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TDEh=GH=epam.com=prvs=46626b3b1e=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1qvat2-0008QC-B7
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 10:13:16 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ae304a9-731f-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 12:13:13 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39P93PdS023707; Wed, 25 Oct 2023 10:13:06 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ty025r8hk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Oct 2023 10:13:05 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by AS2PR03MB10033.eurprd03.prod.outlook.com (2603:10a6:20b:640::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
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
X-Inumbo-ID: 1ae304a9-731f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OI/yEBc9ICcHZtZSCDNE9NnFUV7+4ZUksXhqs1C/fzVcaOiVRzbqKlSx4MZF6moQZ/e0ehZF5n+Kr0XvOIw9OX9+oWQNnYYXRePmFdETWUvhRcKbebxVmIBVLtycogI9mjBLMhVCAppgnRnCznQavkubCPL/W4UJi2AxVyWKQoh13nBQ61dWXla8o7VLDkksY/XiKHVguOdyLb76NRMZd0ioAoS6xc9sroqxIKMEosTtZwSFMauXCe00umcFXlEUx2rv86VnBeblrT5aktFTzQVo0v6X5MZwWogk0Zdy0gk2wwgY/dufiMeaoIbQTMupp5+aR132EABpjPv2rguPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0hasQCTewak0M/WsWi1DBsXRVxcba50BJ6CoGzHE18=;
 b=TTLUTjaC6izjrBpKTT1qAgelF/bxkEKzMJ+E9RmBA2B43fZMeO6Dig2X7iMwyg9ZiwFHhvRlm6zNO1n6vR8LzpYBRONupkNAfMmRqzMo1fYuQD/M8Dk68GpXcX64vA2VwtE0LCdS2dXDns82tWKkoc0IYcPUMhVx3Baf3Je47QI23hF4Z8UMENz0Pkyb+srSNlT8AzhfWtXhvrs8p8FEuUu2Lw29ssZvl/p/dHAYD+MlrnDv/FTc0mCr0ygRmNVA4DEqN23LvXaJiUhbgl60oN5QLuGz9Kd/289Kgu4uLZiKOS3fQwRdqvmouj1t7Jely99oHAMxyOazkquwRYij+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0hasQCTewak0M/WsWi1DBsXRVxcba50BJ6CoGzHE18=;
 b=dFSk0z0uJsssQtZIMdtATWrqql8SK/ydTVXHKh7vWI6vgUzTllRcd7KAugRU0xh6UFYIu+4/JrVNIhNc3xc3zh+9DwfKFixOZwVXVJHaHa7/ulQqPMCE0hslMmbLXmd2thdREqatlheCZgcCJDmL69IAAawgWWnf5PkmBD1N6maEjj5rkj3+nkTdWZqyCSz5mOjfkLsWF2ipulfYQFbgNPhc++tNeb1vQsK/SK8e1bmEW+HrgaYQeGJAhkdnAngXajYD4GzIxcAr0D7s9LIbPFEadJcwTvTnPY8aLyuyLZll5avczHmvECxs+uJy9Hg10uRuq8oGPefQ3O8m12Xfeg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 2/4] arm/vgic: Move get/put irq to a wider scope
Thread-Topic: [XEN PATCH 2/4] arm/vgic: Move get/put irq to a wider scope
Thread-Index: AQHaByvWBiq1Qvud1EWAf+t452eM0w==
Date: Wed, 25 Oct 2023 10:13:02 +0000
Message-ID: 
 <89ca664d00a3cdcf3f68d8ae0c4a6c7b76965120.1698225630.git.mykyta_poturai@epam.com>
References: <cover.1698225630.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1698225630.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|AS2PR03MB10033:EE_
x-ms-office365-filtering-correlation-id: 1768e6df-5532-41d1-37a9-08dbd542f95d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xkI/K//eG/Ws6WAmB+DVsNNatEmtD+QTDO2mML5hSVZlTHxmXEbmSEnonyybKLH9etescKh/W+0BLDaVJXUljptB0rr80IIhroq9n6sjbSBthNGRENj5CLCIy7pZZTpWrsz6baaLE3UKWebAxNqc4x+B1TMuraJnGfyHIRvtLvrNZBbte8cCLqyH7OQB3+llZjTFY4a7MwuYcXpa7WEIyq5Mh8bXIeUFojLTU22if6n0tKuW4bw+TxMd3qp1xViuHHCnZAlzcx1ZIo3o472nZ0cN2JzsfDCwKV8aucZbCjb5YueF/88/ASCA+bNfJzqoFRBHgYfs1/ZTGxPpL69MzQOyd9rVPl8wOYajh4JPTrV+um3BHb+wTpWwbKnlCSX04iYDjgdPw8aHCozKnb2pdldaNmfjhF4h8U6ptg+TRh4JgJ5ODyTbEcDqwJmB/GVUbEV9Thd+iQbuGtwA/i4HeV5RtiyAOdmX2zNp377G6MewrmT9aLanJqknAGgrQ1Bw93/epaZV33g91mCRGcfz0iw+1FL4ttBQldayT36240CFBdAhhHOLu/UVkQkQ/mFm8t8KfT+Ze6IELfBa69/cFVVMP0htRmxn3VCg6cYq0pcQLPAVwBqLoHorRZmy7cqU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(86362001)(2906002)(91956017)(38100700002)(54906003)(41300700001)(66446008)(66476007)(122000001)(316002)(76116006)(66946007)(66556008)(6916009)(71200400001)(6506007)(6486002)(2616005)(107886003)(478600001)(6512007)(83380400001)(64756008)(4326008)(36756003)(5660300002)(8676002)(8936002)(26005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ns5+Q8kwzju1fo0QNqfGU1qNqpEa6FZGcj2UVaqDX2iAmjVSBgHHsA50/R?=
 =?iso-8859-1?Q?4HBOKKpLFs9CLUD081eTIuu/aEyLlBrg2t0dnDEzaJyrRXpDDm0gjphucL?=
 =?iso-8859-1?Q?6W50w3ji2ieY7wWxRHBOtDlaY0F+sNO/OLWIUrqfBJAXaEDmdA+uPBrmvq?=
 =?iso-8859-1?Q?c9X1Bb5kgMK+s7tRwqr5RzHgmFeTohwM2N2IAgO196oaCYfsGn7LNjyhB2?=
 =?iso-8859-1?Q?0077pJU7YuaqPwSLdiSX4gamPwF3RyCMqPIJHzrt9kiLoUz3r7cVuQNwLV?=
 =?iso-8859-1?Q?SWaYiOF7u+mjZrahYLBu5LpmCzIDf87wFER3On5nu6sEVJLCcdYi7UGkME?=
 =?iso-8859-1?Q?luN8VJT0FwMxByIH3rl4apMmTj+ZVMx6m9d3kTSyMAaroooYM/l11IIvsL?=
 =?iso-8859-1?Q?sqmnepKmTyH9ANVe9xRQU4/9JRYM5CO2ZchWk8V1EORMCVB51JFAnsm1js?=
 =?iso-8859-1?Q?HylTcGOorhBrcfL4aUmm0AzEO2V2zQ6FYCqyIMgg9VTNiYVDdkGDL8uChx?=
 =?iso-8859-1?Q?aetZW1iKZmUnPKqbv1i+klJnsYGHhYEFEznMn/uH9ei069jbp9vwcOo/7w?=
 =?iso-8859-1?Q?CED+dlw/KcK9VSKjhQZU1nqAM6q95ca3/slyDaMyYrai4ssOTJvUylwCqp?=
 =?iso-8859-1?Q?dPwOXEfuZ0xwxKFtRqk+xMyQFaI1qun9HVTm7jgbMD/CGhR7IP9r9Olbwl?=
 =?iso-8859-1?Q?4t9y06shYuDlJQwjOWupqcH8ACfM1nVXwdKizzfri62hTrIr/Dpn0nB9s4?=
 =?iso-8859-1?Q?kEln1Yl1pYOszkauDy4BxMA8BTIwobWIAqGGRGg2iAaD1snXhBkLlycWgv?=
 =?iso-8859-1?Q?89860GiX7H2efiHHa6W04bcqjDXlJkot18oWFQq8GZ3R8CxkfGJL4Z67oS?=
 =?iso-8859-1?Q?mHWpEptfTXEBw8C6YG5NZdKEhBXyCewoyGt5LAGbg7zINKGjuO75ic4lQL?=
 =?iso-8859-1?Q?dj45rVFxbjrd4vmdabFEJ2ynEfRks4P+gTvuzSva2sMZtVab8OUKXjwhPd?=
 =?iso-8859-1?Q?7sFb/qKzIvvl69HSV4+hJRgrHjCAvGIOMcTAD+M4DARqjmeUAc2krWrhRf?=
 =?iso-8859-1?Q?HLxQahyt8QYBJI5HhdQLpWLYK5/MxlKQjD9L+5XSj5cguoKMSgn6cQo91s?=
 =?iso-8859-1?Q?nze2gexXucAkXwYPUE/auwAzBxdfl7XMGYwmI+De+5gVrmHCerKXVqLXRl?=
 =?iso-8859-1?Q?4WiQi8YHnhQA2ibBccfjSol07MNU8n0DRTkbFa1fkA/P7x78ZYxymFrYoy?=
 =?iso-8859-1?Q?oY1iw/qUaIZEA/sjZqFMuVXExoaHvlT54V+9hQMPJKFinBdXUalcCUBnTg?=
 =?iso-8859-1?Q?FWoZpLJXzJWSR9cLR194UsuyAP4gO/NsCAhCtym4pyQPU7h7WtWDMSS1iN?=
 =?iso-8859-1?Q?2y0GmoaXK6I/F1WziDa6VCiC/gSqle0vnh69NXejc1tvs7LQxsIn+v9y1L?=
 =?iso-8859-1?Q?TWXotbEHRe6ADHtgOGvfWsdPKzfMjl1DoavnFicYg1w9hhmpooRsJD27WP?=
 =?iso-8859-1?Q?cMwAif7W825SotMUi+0pOf1RcaEB5ItlaNuDeqNeMheFNfp8/q6Y+yk7Ll?=
 =?iso-8859-1?Q?bP7Ht+uUfkEV83aGFdM8lhcEewG7kWgvfE7oMzsFt3uot5Bv8E9bWupWuY?=
 =?iso-8859-1?Q?ev43mkLXQdZbHoAFcBnH+yxrNkseerrZEcyCu40oyFcrjnTfeqEn9oQw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1768e6df-5532-41d1-37a9-08dbd542f95d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 10:13:02.9566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6JAuyBJS03iusiJwsRIbRlwPfk9sKsMOQmbi24bAR2EMRKWxeEccLanpdo9bcO5a85toJr8nVcr/2woyE+Abpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10033
X-Proofpoint-ORIG-GUID: azudyZhk4km5IehQ_6g_Y1jADpHND25B
X-Proofpoint-GUID: azudyZhk4km5IehQ_6g_Y1jADpHND25B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_01,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=768 phishscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310250088

We will need GICv3 code to access get/put irq to inject LPIs for new
VGIC similar to how the old one uses irq_to_pending now. So move
get/put irq to the same header file.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/vgic.h | 6 ++++++
 xen/arch/arm/vgic/vgic.h        | 3 ---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 922779ce14..7216ce82b7 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -387,6 +387,12 @@ void vgic_sync_from_lrs(struct vcpu *v);
=20
 int vgic_vcpu_pending_irq(struct vcpu *v);
=20
+#ifdef CONFIG_NEW_VGIC
+struct vgic_irq *vgic_get_irq(struct domain *d, struct vcpu *vcpu,
+                              uint32_t intid);
+void vgic_put_irq(struct domain *d, struct vgic_irq *irq);
+#endif
+
 #endif /* __ASM_ARM_VGIC_H__ */
=20
 /*
diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
index 534b24bcd3..c6bc3509a5 100644
--- a/xen/arch/arm/vgic/vgic.h
+++ b/xen/arch/arm/vgic/vgic.h
@@ -45,9 +45,6 @@ static inline bool vgic_irq_is_mapped_level(struct vgic_i=
rq *irq)
     return irq->config =3D=3D VGIC_CONFIG_LEVEL && irq->hw;
 }
=20
-struct vgic_irq *vgic_get_irq(struct domain *d, struct vcpu *vcpu,
-                              uint32_t intid);
-void vgic_put_irq(struct domain *d, struct vgic_irq *irq);
 void vgic_queue_irq_unlock(struct domain *d, struct vgic_irq *irq,
                            unsigned long flags);
 void vgic_kick_vcpus(struct domain *d);
--=20
2.34.1

