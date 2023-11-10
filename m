Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4DE7E7C57
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630298.983046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3w-0002SN-VU; Fri, 10 Nov 2023 12:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630298.983046; Fri, 10 Nov 2023 12:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3w-0002NV-Oq; Fri, 10 Nov 2023 12:56:40 +0000
Received: by outflank-mailman (input) for mailman id 630298;
 Fri, 10 Nov 2023 12:56:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3u-0001y1-BP
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:38 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 948ff425-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:36 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACHn4n029609; Fri, 10 Nov 2023 12:56:29 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3u93ptjrxk-2
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
X-Inumbo-ID: 948ff425-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3XnCIBLRva6oLDOEJO3/1Gx17lxVJrof+SDvS9VuXhSoAdJW233UDT3jEh2GxwJql2rqlmHxe4KhoQdt6lSd9cB6UMYSopihvgCvARICrfr0dUzkp0uvML4pS0oWu4fontCf2WVMtlXEEyg9nWX197/loTN7FNWVTDAG63CqlLGmChcf0Zd8/vrlk3VP3ETwrxjOuJ4DvqGJtFEj0hr4pVOpYvsQmf/AMIIlRo7wh4pB9Q6PTm97kv4bF8yC+u9rtNLuTC0EA3Gjr7yK/VErReKDM7VMmBbipe4Kly9W8ycg6iOplOPfISFqK6DnFgHQFsy4MEe2BdZ/C1lc+MeZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15Ru6p3LMyODkoJGnBcHsi/MdAVNxVqs6BxYDcJDskw=;
 b=PpSVBVwje95PZVHbr1rKKuj0vqm83mHF0y+zWSFbk9D3WAaL+aCto4eN8Y5BPXAQNHx18nECmyxcPzwl6L2226lcZDbEOPwssMOS8Z8XANZZHGtu/Mf1S/8TclwG4OGkYl1+9x46CQd8oVF3THBoh3M6P8YB9Y0MqeLgyeMHEhrmcJt6KTxv3g7OfFPNPp48i700+s8xwm8+Fwf8gjYO4R4JS+3nFZ85Y46cNKJOyGB5m7qDsWZtxQPemvYIek+wzaAmIl6Bes9lxW2Htcbgoss6brOzNjBugVaGCkHPif30z/EbUCSP9YNQY7o1rARVt/Ep30YlZaaKrqdNFu4I3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15Ru6p3LMyODkoJGnBcHsi/MdAVNxVqs6BxYDcJDskw=;
 b=BCBuDbVxRHdCgum/mdmDmUDeX1Z3SkJjwpSoOkRFx67FrtUMt7CbIneP8SK5b3jZdGXTLblYNPVYYEX8u2IK0uyxNk4c0aiHDkd8ScDxBNyvdTl2t7HkhjRQqIqmK7++5VFAvC2ZM6NqHPEJkTbivmCzOZl/ZpH4Dlwd07E/KqWwXVtwHfFg8sbdhJtqudJMZu+LoMLZfrv5vl7AApUJD0BMBmeeVS+F+BcpnxWtXfPDGu1rRzJiMWavNiMTlkR2aM4+ibNctct94yQtZxt0jdpfSoc0AQ3HABrDr8V9lpjbSIneWfISJfXIcNdj1ODSG33bBJ+hNkKHEHlXbobb4A==
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
Subject: [XEN PATCH v2 23/25] arm: new VGIC: its: Enable ITS emulation as a
 virtual MSI controller
Thread-Topic: [XEN PATCH v2 23/25] arm: new VGIC: its: Enable ITS emulation as
 a virtual MSI controller
Thread-Index: AQHaE9VPXAWKwT607Ue2PXRr/Vo1Xw==
Date: Fri, 10 Nov 2023 12:56:23 +0000
Message-ID: 
 <bcc29d8c5da6749db370808529d48d790c30b290.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM0PR03MB6244:EE_
x-ms-office365-filtering-correlation-id: 5eece678-bc2b-41be-a476-08dbe1ec72f3
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eXztD9PHLeKPg/c2aCQdsr9BZfuaofeVRqwLL+xGLTARw766dkt+rCoKv713AKAWwE+GeewY3ul8H4i8RQdtBUxE9cUprLw3EG4f85hOSecNiuFb+9J7AXLjRIV1CSspnnyWQ+rjWL3Hmc1LpmEWY+OMYD548+VdKDtXXuyiuoyf1+fHLbGwjWTTh9SJpvYTP2UCSx8Iszc8ov7tHiHm0au1LJnzRMglcr6CSfPi1ci4DHonlcD+nYtgrg9VVl8YkfZb/IqPVF6LuCh+nQsZ+UUPADXCgN8GgWvSYf8GhCQq0B3/SfbiFTU0bEHg+WDZPVmtAcaYRPJ6PtwTSzM7g7NHyaZKfoLHt1sj+gqth4ftDyYCY0RN0HitmbeV78gbPFtFMVPFzQa+X17ec8G29A1Bjv5ZvKdfw8M2HqwE/mSynEzSRl95vSjyczN4GkhPCDfzvVENTYVdyBfga4dY0bySHz0EQd1zl5iV2Yv5trnEyFwfdV+bJAlzqFtoEhcpkpnwj5q+1kT4mw8E3cnBsuTt6x8Flq/6ZrftWincUWsp4FpzzuKhw1QVLDDWWbVGs1X497zpdD8j8loZzNoAdulnkuQckDhpuVviR5J4s0c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(5660300002)(41300700001)(2906002)(83380400001)(26005)(8676002)(4326008)(8936002)(122000001)(54906003)(64756008)(316002)(6916009)(2616005)(38100700002)(76116006)(66556008)(66476007)(91956017)(66446008)(66946007)(38070700009)(6512007)(6506007)(478600001)(6486002)(36756003)(71200400001)(86362001)(6666004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?NkFuv2l6hE0HsbDu2y0BUCxxl8IuuM+BNwgPOp8CfVDTLvA1iX3pUAz/uR?=
 =?iso-8859-1?Q?BEs6yeDsbrDKVguOKOwBcOG0YK8SsBNwoL3ncyVSa9hIt2d934G2gwLkOh?=
 =?iso-8859-1?Q?OP2LAKH5yUDZZU3Fm5VoUzrwIarmcByfaR2bcK0v2qd2FE23yfCP2ooDgD?=
 =?iso-8859-1?Q?bIi5Lgo7qvbXJxekmFdTb1zxmbFhuiQYeW7xywcDcoMrcSLzH6BUaPmuHE?=
 =?iso-8859-1?Q?zKpc6Sy5uvg6iG1P5kjba1aVuBwYp9bFHLQlmqciHTu/+/bO8Ud+bAL3Oa?=
 =?iso-8859-1?Q?oXmFw3U/15z+nSUebTymIZxY8iiOJHELFQ7PS66zPa42TNiBTZXyoQsCP8?=
 =?iso-8859-1?Q?oanFDARnnZJ4JfEOsKYnHnayg1W11V2GBNMq6HlhgaO0uhD3vVBalj50cu?=
 =?iso-8859-1?Q?LzJyRT46SxOFduDEZOZkWB8CxKEpMapA8XEjoxSRSbcj7qCQaywmLzjpYc?=
 =?iso-8859-1?Q?gfE94Sw1ERjs16Vi22+ecd42FuZydoAJG3KZmOZFVIIZy0v5XYrhld75JR?=
 =?iso-8859-1?Q?Qlp+hi6l7DPqi93VZm54fNlRxhRp+Fm/PnQKPswIAhnBCNiGMEC4IdfdqO?=
 =?iso-8859-1?Q?6LXk3ftRy6GSO+16fQ47JsSbqXNSyfXF1HT6BnyzD5yvjr4Z1TL8N5xbJG?=
 =?iso-8859-1?Q?SDYD7oVIu0ygFxb/pbD6z2oRayJW/fS/ByBlPztuMBiJJupDSkII0PIF5z?=
 =?iso-8859-1?Q?VOLZcRw03tE2ctrCXsJsTOaPZx1/Fcx0s33VUdi1hpKPrxT5fWb3Twd5zG?=
 =?iso-8859-1?Q?csxdOFO0Zxc4BHn6upOeYVI25wRwRPxeiOVTs7F4gc8uxmJBW0A0YLfV9I?=
 =?iso-8859-1?Q?6ucCcO1UMSJwLsVnonW6IYMP3//eFsvG237n/3QjqkQsJVwZjman8iukr7?=
 =?iso-8859-1?Q?SIZTx/XIaUS61O49pChllK9XdO3c6ssHVhseHL7GseuJSZyXVYq8ac6X+f?=
 =?iso-8859-1?Q?iT6eJ48sAy2RJfCQW52WDoWAdUNAJ9iIe3gr9eiwVuO0xkmtadXBU5efnn?=
 =?iso-8859-1?Q?vIrau2fbBhdjRq9cz42I5ShyVIpQEueQ6ImXigN8OlZXExjt22gtyCeYIx?=
 =?iso-8859-1?Q?nLRz0/PdJd63rxus3OT1UJcO07FmJfzXVv/o9r0HRV5SuqyrM++R2RqAjJ?=
 =?iso-8859-1?Q?mR4BbY6SK4EVdmZGMZdagIV2B1k6JvRRrEPegh9GBmWAiT2+DaMdYlC6Hd?=
 =?iso-8859-1?Q?uudDVLg+u0ZnYuHUXQeO736TPVnx9nAKA0ZbkLBC2SteRpdWQQKHr74+yo?=
 =?iso-8859-1?Q?7gRhjd/UbXsYBiWQaCrifVmHgWgrij+mEY0E1/tZg7lyOrLDqPJiHt1iSt?=
 =?iso-8859-1?Q?IDi9+2k0FB0ks+zWHP/w3lk1VbvRIO9TfwAm2vsL9ewaMuLYPjmsIU45yL?=
 =?iso-8859-1?Q?TfMBO9PGZF1aGwzw8K+q1NcI5d0BCBv6D8zrMc5ervZ3byE3rnSg3HNiCN?=
 =?iso-8859-1?Q?MD2mhSNd5Nr0Viq74uQPWfrg/Cj+vWJTgOmHFTark9eNZDD0Is5WC9eKqZ?=
 =?iso-8859-1?Q?Yhzq12bZZWI9/gd5OeWtrTm9HuUhZkLXERF8ZyyDr3EQfWQKhejoTxOqNi?=
 =?iso-8859-1?Q?0BppLx2vc/M3N3h9CX/OwtqFn4EfZrtuJVvC1+r98rqSanXL+wS6JYzcba?=
 =?iso-8859-1?Q?YJjFrhUOpOOB8oDxb3GtFKEUvhV30yRMBdIU9ZzfuBKVC61hxISBQiUQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eece678-bc2b-41be-a476-08dbe1ec72f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:23.9501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EF7OsO29C2KF9BWTHx2YeT3TgS2LNvtGYdi72AjTNOX3eil/jRJot3vaDmohqq2R0yPv3OPVB5IuBFDcOhDqIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6244
X-Proofpoint-ORIG-GUID: 2wucOZ7wNj0rsTgxhzcWowTMjUbQjAJ5
X-Proofpoint-GUID: 2wucOZ7wNj0rsTgxhzcWowTMjUbQjAJ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 mlxlogscore=590
 mlxscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Now that all ITS emulation functionality is in place, we advertise
the ITS device to the guest.

Based on Linux commit 0e4e82f154e38 by Andre Przywara

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/vgic/vgic-init.c    |  7 +++++
 xen/arch/arm/vgic/vgic-its.c     |  2 +-
 xen/arch/arm/vgic/vgic-mmio-v3.c | 44 ++++++++++++++++++++++++++++++--
 xen/arch/arm/vgic/vgic-mmio.h    |  5 ++++
 4 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index 96f6669d38..fb27e440fc 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -18,6 +18,7 @@
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <asm/new_vgic.h>
+#include <asm/gic_v3_its.h>
=20
 #include "vgic.h"
=20
@@ -173,8 +174,14 @@ int domain_vgic_init(struct domain *d, unsigned int nr=
_spis)
     }
=20
     INIT_LIST_HEAD(&dist->lpi_list_head);
+    INIT_LIST_HEAD(&dist->lpi_translation_cache);
+    dist->lpi_list_count=3D0;
     spin_lock_init(&dist->lpi_list_lock);
=20
+    ret =3D vgic_v3_its_init_domain(d);
+    if ( ret )
+        return ret;
+
     if ( dist->version =3D=3D GIC_V2 )
         ret =3D vgic_v2_map_resources(d);
     else
diff --git a/xen/arch/arm/vgic/vgic-its.c b/xen/arch/arm/vgic/vgic-its.c
index 9534b26334..3b097bd0c4 100644
--- a/xen/arch/arm/vgic/vgic-its.c
+++ b/xen/arch/arm/vgic/vgic-its.c
@@ -168,7 +168,7 @@ static int update_lpi_config(struct domain *d, struct v=
gic_irq *irq,
     return 0;
 }
=20
-static int vgic_v3_lpi_sync_pending_status(struct domain *d, struct vgic_i=
rq *irq)
+int vgic_v3_lpi_sync_pending_status(struct domain *d, struct vgic_irq *irq=
)
 {
     struct vcpu *vcpu;
     int byte_offset, bit_nr;
diff --git a/xen/arch/arm/vgic/vgic-mmio-v3.c b/xen/arch/arm/vgic/vgic-mmio=
-v3.c
index 0e3835d38a..84aa8568dc 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v3.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v3.c
@@ -29,7 +29,7 @@ bool vgic_has_its(struct domain *d)
     if ( dist->version !=3D GIC_V3 )
         return false;
=20
-    return false;
+    return dist->has_its;
 }
=20
 static struct vcpu *mpidr_to_vcpu(struct domain *d, unsigned long mpidr)
@@ -211,6 +211,29 @@ bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, u=
nion hsr hsr)
     }
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
+
 /*
  * The Revision field in the IIDR have the following meanings:
  *
@@ -234,7 +257,15 @@ static unsigned long vgic_mmio_read_v3_misc(struct vcp=
u *vcpu, paddr_t addr,
     case GICD_TYPER:
         value =3D vgic->nr_spis + VGIC_NR_PRIVATE_IRQS;
         value =3D (value >> 5) - 1;
-        value |=3D (INTERRUPT_ID_BITS_SPIS - 1) << 19;
+        if ( vgic_has_its(vcpu->domain) )
+        {
+            value |=3D (INTERRUPT_ID_BITS_ITS - 1) << 19;
+            value |=3D GICD_TYPE_LPIS;
+        }
+        else
+        {
+            value |=3D (INTERRUPT_ID_BITS_SPIS - 1) << 19;
+        }
         break;
     case GICD_TYPER2:
         break;
@@ -365,6 +396,9 @@ static unsigned long vgic_mmio_read_v3r_typer(struct vc=
pu *vcpu, paddr_t addr,
     value =3D (u64)(mpidr & GENMASK(23, 0)) << 32;
     value |=3D ((target_vcpu_id & 0xffff) << 8);
=20
+    if ( vgic_has_its(vcpu->domain) )
+        value |=3D GICR_TYPER_PLPIS;
+
     if ( vgic_mmio_vcpu_rdist_is_last(vcpu) )
         value |=3D GICR_TYPER_LAST;
=20
@@ -422,12 +456,18 @@ static void vgic_mmio_write_v3r_ctlr(struct vcpu *vcp=
u, paddr_t addr,
                               GICR_CTLR_RWP);
         if ( ctlr !=3D GICR_CTLR_ENABLE_LPIS )
             return;
+
+        vgic_flush_pending_lpis(vcpu);
+        vgic_its_invalidate_cache(vcpu->domain);
+        atomic_set(&vgic_cpu->ctlr, 0);
     }
     else
     {
         ctlr =3D atomic_cmpxchg(&vgic_cpu->ctlr, 0, GICR_CTLR_ENABLE_LPIS)=
;
         if ( ctlr !=3D 0 )
             return;
+
+        vgic_enable_lpis(vcpu);
     }
 }
=20
diff --git a/xen/arch/arm/vgic/vgic-mmio.h b/xen/arch/arm/vgic/vgic-mmio.h
index 12f4d690f6..32fc7a6ba2 100644
--- a/xen/arch/arm/vgic/vgic-mmio.h
+++ b/xen/arch/arm/vgic/vgic-mmio.h
@@ -156,6 +156,7 @@ uint64_t update_64bit_reg(u64 reg, unsigned int offset,=
 unsigned int len,
 #ifdef CONFIG_HAS_ITS
 int vgic_its_inv_lpi(struct domain *d, struct vgic_irq *irq);
 int vgic_its_invall(struct vcpu *vcpu);
+void vgic_its_invalidate_cache(struct domain *d);
 #else
 static inline int vgic_its_inv_lpi(struct domain *d, struct vgic_irq *irq)
 {
@@ -166,6 +167,10 @@ static inline int vgic_its_invall(struct vcpu *vcpu)
 {
     return 0;
 }
+
+static inline void vgic_its_invalidate_cache(struct domain *d)
+{
+}
 #endif
=20
 #endif
--=20
2.34.1

