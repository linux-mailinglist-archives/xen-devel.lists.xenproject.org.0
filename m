Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E107E7C50
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630310.983160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R4A-0005w4-9I; Fri, 10 Nov 2023 12:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630310.983160; Fri, 10 Nov 2023 12:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R49-0005Rf-Jn; Fri, 10 Nov 2023 12:56:53 +0000
Received: by outflank-mailman (input) for mailman id 630310;
 Fri, 10 Nov 2023 12:56:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R40-0001y1-CT
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:44 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 968c33ef-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:40 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIeel019156; Fri, 10 Nov 2023 12:56:31 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9kkyram6-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:30 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:24 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:24 +0000
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
X-Inumbo-ID: 968c33ef-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8KW2a6xEXibdMIUZwRRhmigq3gy+R9e7mbMdzPfYwN+4x7CWpA6LzkDw74rxck+RaVKglLMQEwtfRPI2jhiEI7qTLXnwHffrkrtYNQrKNqK2tg+twiN8QKFyw5JTpw8Gmc1iiAoR/wfdv0OlKIxjZK9vjgiSS7F+aSwq9GHBOPSrrfiMhdrhwccpOjrU+ZyquxyXtyKFZp+G256vL6uW19vuUII3fcauOV0uik5twnXQ0eAMfVsPmrc4U7fhxDwQddx7RM8MeD4sVn/ZUrUJE0Yz31PpxIgnlOo84RcRSekacxjWAG4UfbkjbOIkiBD1F7Xm+PxhUaG9b1hV/khhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+qyDsQa2NT4e9gFoYJ+T5c68j98f1YS+6LB32nWM3A=;
 b=kDv9jsn9vUJn9MNYRasdKk92SYfCpTH8GA0K4YRlewijVYWN8MFvNjurnEEs5W81IijW3zgwVKKQArtJBy/JUpnWSiZaYN/CG6/iEB6knk5/cQP8zh73c7bbF3jx+8RrVliZdFy6XEcJOmA+xjua5Q2j7oVsJg9bZGfm00NPte63r7WtRZSyJltsioQcYzxVPKESdV+Ytg8JEzp3PhuXes57yR59bM45RAzcXZNLEfvLzuEZB+Rr64pEbXczyaN2jKiXDPFSWnZuiC76ta41maVIUEJS5fOlhKxR9aTf9HH/EjeT0iVgd/YUckVKbN5idmwl/5soXmO5N11/1/uwXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+qyDsQa2NT4e9gFoYJ+T5c68j98f1YS+6LB32nWM3A=;
 b=TmtAicJjaSInHvTI0kDK5FmfUMGdQODqjQvI83Vmmic5HFynaiNfnTbalTotZp78xc+UirTHBzeSDLOPtjqbX1/VenMri9nrU+hJ81QLz9t/voEDo4K0weuOusvjvJ/SjSU4sXks/QnEirja48THo/r8vtRcpm4PO/JbFUAUPdkAeksJFFKTkDTVYyJhr0kIX8OVLaOzOXIjXCk34maOZjiIDMOXpKSDIsfjBoqkGHi1XeRAzoWZJXnOEIFTAIqf3kK/YUxLX3Hy0/E6KOHHHHHJhfBUOE1ngUWTjTc9kF2KgmkCZr+yiwDjHJj+1zhKq92T+/rINkE4zAP7zO/jgg==
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
Subject: [XEN PATCH v2 18/25] arm: new VGIC: its: Allow updates of LPI
 configuration table
Thread-Topic: [XEN PATCH v2 18/25] arm: new VGIC: its: Allow updates of LPI
 configuration table
Thread-Index: AQHaE9VORAkqYbrpzkWH9gdi+lifIQ==
Date: Fri, 10 Nov 2023 12:56:22 +0000
Message-ID: 
 <116c9594ca4af704ed40c0945116ed510a3d4e26.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: c2db57ae-5eca-4b1b-6223-08dbe1ec71ce
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 L2B0nuIW06PR5PpBQFpsJ4utet2t9WC1RamTSstjjO8WCo8fd+oihACGW5fx/ltK2hInIetLii/4CpTEIzK0l0QaU2sxRR2+iu12J7MGbtiI7YXiyy4qfLrBSfcGdYT+J8IdVlCsmOQd+ZtrEpC4DV/cfCJH2aU8NDGQuQRuwzp3xKbGdOV8lPBgix+yQZffqjldnajWQAhb/8qp/XTIVpC+MXGfljaMicIEMSTMCRiyDj61kGA05l9cM0ayJIpnC88qjcf3lGLyOXyOL+Mjmzeui2bvdHM2UMdHK3XKBCEmNu1LPJrSRXfg3Bw84iRSZOcVguTUApZrToFZZuB/Ph5TeBpNg0/TmnyHPlAPlw32tlgX5PnVZPPnhwQRYtRNFiyCq+XjKI6TCMD18cgb6W5JdZHUSgGZpiCjjjN93iHpBoWIZGLrSr2AvEY/7yIkaMkR8LiJNZg91sptfD2fA8cHN+QaCLXue1YTq3T9b8i5or4kRw3XbeWFA/FklRAneJG5krVM5iBFTxgc8lkzeS5eQmkYK5f8TwXGNTpi6f8ZuPZ2pZx0TvT08wRSFbNknoVsS92f+KPJdE9fJ381ucb7rzz2KZsBTdJL+0XoO4xC869LYNRTa4NxzzUJyTQY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(15650500001)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?EC/TZ+Su9bRVIHmO2oiZm/GDYou+NgYXa1Wd7ePfZNus4e3fq21G4l0B27?=
 =?iso-8859-1?Q?3NyexES6psU0pZ9aLPac2pNBNyvL4zZQXOA5sQen7hYK447iqIXhnG2mPC?=
 =?iso-8859-1?Q?DPILEsuZjjUKxzGwaMGbGvZ+pihlV/1Cn+ZoRfmrMxmRPPusP8+MZScdRB?=
 =?iso-8859-1?Q?F0iuNZ9qhVTUVZ1cBB8s/zVtwRrdtmf0IaiaNAYSJ2At4oOZ6fzA89FtTC?=
 =?iso-8859-1?Q?6CKCXaODQlINTGye0gX5j1T/yHtODKRaP3Dd83lAiNNeolkuO6a7AI6bL0?=
 =?iso-8859-1?Q?PsB2YnS1mfggNGKfVUotApE31PqI/VKXQ9EtBol+l6CB/W0qmKTLedhaNV?=
 =?iso-8859-1?Q?iX4Zq+/s/H6g6/J5mCCCYE0XRXFXetXIspq5HjyWlMbGaXcA8XXuUVl0nC?=
 =?iso-8859-1?Q?QT/J56j/ACEpxXTTdAagF04Ufz6OFZx8p3n8DSN5J7jfKsfWtR5iCKL3KX?=
 =?iso-8859-1?Q?f/jCxTtZGANzsV3m8rgq84XMl4rANCn88hoj1+5psCO9VEu/jL5lHX84wh?=
 =?iso-8859-1?Q?9ax/H0+hjeRG+L90yOdp3ZCtpUb1xwwhAXcX6PiUBK8Epedh9Ib7MNg+81?=
 =?iso-8859-1?Q?r30YNtRHFaTOq1k3XHqmWINtsYposT1aSx3gUwZ0pUuxO+C5P6x9oaA+Rl?=
 =?iso-8859-1?Q?g0WWBVTtV3NEvOW74a3HfdFw7K80l6tmHzc3beZLTupinnJV9XU1Jbowwl?=
 =?iso-8859-1?Q?hmcJlT8QUQncr11rXMXabEDCzoe5qHs8ObxkO9ANncK9+ln7jvDsSk76Lu?=
 =?iso-8859-1?Q?nVoqO3rAbMLyghwKHNOmaa5CX/kCz44hDfTydN23G6kpjjuGV9xAnwIRdG?=
 =?iso-8859-1?Q?dA6hUSEfVuH+wrjbyBDoqEvNl9/y0jcEwXKOcX1y1ZKaYudbFkanBPri68?=
 =?iso-8859-1?Q?ScHMB9QJ7ag5tt1mFUfmLHVfS0t8muXvGymvGnU1i2I81EgJXRUaZoVlBj?=
 =?iso-8859-1?Q?tt4TlrQ0cLAn8QkUHaZgFbAiyFtn3hM7GHCgXIB/DaG7YGKJCNMtwiRJCl?=
 =?iso-8859-1?Q?EtdFGNDi18kIr/JfY9MZ5e3zseDEIVNizqFzpnNpqu3GFA80qOy6p4v2on?=
 =?iso-8859-1?Q?oGr247/DMX8WnrONN1C4rHzoCL4yNz6Eo6lITEzYj2Pb2wtpUkBUP8dYnY?=
 =?iso-8859-1?Q?wWSIv5Mnlcnw38lIxQW6/zv3NBT2lKmFbxKcXJu9X34m19BGsNzeWACmMS?=
 =?iso-8859-1?Q?Ol3tfnqjWUXHEw/ZHrszTqc4XbV+dvWkqPAtsizh0ril2YmsNI+AUsffAa?=
 =?iso-8859-1?Q?NRSNT5DUgt8i9rJHFcPPT/ZAOWwQKerz1cIPDbKhDc7+7Ae60O6PiCMzht?=
 =?iso-8859-1?Q?AECt99vSxyOpPIz4YoJmZo5G6FECPGolJTSyiY/gA6MsPiV1W+IPPQr/p+?=
 =?iso-8859-1?Q?9AUEjcDbP3VhRMRwyrbWMGTS/cZ2PvAP4zhXQCXuH4Or5/rl7R7IymjWhG?=
 =?iso-8859-1?Q?QoL8l4d6IZi3xrO5MbbAcOiYaa66goZCGHgUCRflKOqtTgussKPfbLwCPr?=
 =?iso-8859-1?Q?D8lg0rwWabjd733NjC+ar19xqnWU/8P7G97J2HrdyzGxnndX7SvKOzoEOn?=
 =?iso-8859-1?Q?h0D0t/mpxewMR2N+u1crygEtD+LxOLdE87VLGfc8o2N8zuqm9QYYTK3GUQ?=
 =?iso-8859-1?Q?PZvNUVJQmZieio3Ixye0b3X3TA7CamKDgkUxoBnyFcBgwdDv122NLt5Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2db57ae-5eca-4b1b-6223-08dbe1ec71ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:22.2075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lV/8XN5JtV5xDyd5ybGW1cQNnoqS2WBCTcU/B3gHayB9wFWBhOuBJlnqiiQtM49HScsaKOFRsrN5Yx60/hNvzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-GUID: ZkmwpVyihCxAPy0swzRY3xH3zcjx1W-y
X-Proofpoint-ORIG-GUID: ZkmwpVyihCxAPy0swzRY3xH3zcjx1W-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

The (system-wide) LPI configuration table is held in a table in
(guest) memory. To achieve reasonable performance, we cache this data
in our struct vgic_irq. If the guest updates the configuration data
(which consists of the enable bit and the priority value), it issues
an INV or INVALL command to allow us to update our information.
Provide functions that update that information for one LPI or all LPIs
mapped to a specific collection.

Based on Linux commit f9f77af9e2a551 by Andre Przywara

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/vgic/vgic-its.c | 48 ++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/xen/arch/arm/vgic/vgic-its.c b/xen/arch/arm/vgic/vgic-its.c
index af19cf4414..6c726dde3a 100644
--- a/xen/arch/arm/vgic/vgic-its.c
+++ b/xen/arch/arm/vgic/vgic-its.c
@@ -63,6 +63,54 @@ static struct vgic_its_device *find_its_device(struct vg=
ic_its *its, u32 device_
 #define VGIC_ITS_TYPER_DEVBITS          16
 #define VGIC_ITS_TYPER_ITE_SIZE         8
=20
+#define GIC_LPI_OFFSET              8192
+
+#define LPI_PROP_ENABLE_BIT(p) ((p)&LPI_PROP_ENABLED)
+#define LPI_PROP_PRIORITY(p)   ((p)&0xfc)
+
+/*
+ * Reads the configuration data for a given LPI from guest memory and
+ * updates the fields in struct vgic_irq.
+ * If filter_vcpu is not NULL, applies only if the IRQ is targeting this
+ * VCPU. Unconditionally applies if filter_vcpu is NULL.
+ */
+static int update_lpi_config(struct domain *d, struct vgic_irq *irq,
+                             struct vcpu *filter_vcpu, bool needs_inv)
+{
+    u64 propbase =3D GICR_PROPBASER_ADDRESS(d->arch.vgic.propbaser);
+    u8 prop;
+    int ret;
+    unsigned long flags;
+
+    ret =3D access_guest_memory_by_gpa(d, propbase + irq->intid - GIC_LPI_=
OFFSET,
+                                     &prop, 1, false);
+
+    if ( ret )
+        return ret;
+
+    spin_lock_irqsave(&irq->irq_lock, flags);
+
+    if ( !filter_vcpu || filter_vcpu =3D=3D irq->target_vcpu )
+    {
+        irq->priority =3D LPI_PROP_PRIORITY(prop);
+        irq->enabled  =3D LPI_PROP_ENABLE_BIT(prop);
+
+        if ( !irq->hw )
+        {
+            vgic_queue_irq_unlock(d, irq, flags);
+            return 0;
+        }
+    }
+
+    spin_unlock_irqrestore(&irq->irq_lock, flags);
+
+    /* GICv4 style VLPIS are not yet supported */
+    WARN_ON(irq->hw);
+
+    return 0;
+}
+
+
 /*
  * Create a snapshot of the current LPIs targeting @vcpu, so that we can
  * enumerate those LPIs without holding any lock.
--=20
2.34.1

