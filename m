Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E17E7C52
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630305.983107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R43-00046c-6A; Fri, 10 Nov 2023 12:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630305.983107; Fri, 10 Nov 2023 12:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R42-0003xK-LF; Fri, 10 Nov 2023 12:56:46 +0000
Received: by outflank-mailman (input) for mailman id 630305;
 Fri, 10 Nov 2023 12:56:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3y-0001y0-64
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:42 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96644d25-7fc8-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:56:39 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIeem019156; Fri, 10 Nov 2023 12:56:32 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9kkyram6-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:31 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:25 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:25 +0000
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
X-Inumbo-ID: 96644d25-7fc8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8K0++DB6FDAmKoodfzo77guBfpDH4ZClDrvfuJLhNYc3G52jI+kNwULGGtEBqWPVE9TWAqqR2R4t0YE0PtZMnlud9jKxofXKSAo1pEut1kPaQI27FZRgAuxkdUQNFnEe+9230LnNlb0JNiFOpX2jryY+ClAOGrZY8EdHuGZ9hrHK/+TvJFSkl8kfRPS/A0SvHbUaRaryPDbB7l+RmxL/nq+rZaMuRYquFQS/Pye7cEGoKC30iWKTf0tAX2tIsDmh3v7N6EzM0fQ2/a8BNX8Xb7OIMQgALDrJ3lSlX6va7MK2lVUWs4BZtPJLPNvuHzbX9BpgXYWzZ8dU0zYhERCNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AzYgyWYOamJy7GvHjg0RF9EEsQKL3zTFRWpYK3zu7E=;
 b=VFlwZk41fKH8FBqZTd7QsbRex4gr20qX7qXePy8WFj9THl/DG6LhnIEOunEK9CsiZboMz7JIOg65xQ3OifFtUZI5E9rvNinmoBox3NSogNj4ogAXHusTS3KJW8EZl6rf6y3iv4/zzsGqUG8YSAioHECOb8HxITT+HEqZqDA6yxnK/2C6I4uMyJOti3P84biJmJZVEoVGxIqFWYRN8bAid95imyfTJDa6qMs+sg6+zucCuZPh9VUmJdzBDJKPXTNYJORvXU3i003BJRb1ATEIoBH1GZmjBc7x8uvD2EUKP8dm9JrPd+qScBlGlzNZlnw8wrvSbWyr8v+U0i6djATeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AzYgyWYOamJy7GvHjg0RF9EEsQKL3zTFRWpYK3zu7E=;
 b=At1lufd+rzPWVrUMrppcQ+OQN1GRfSffBsqbxrzM7fTRGQAinzw6uLTMzw56xDUzuehRFIxIQ8FJC4SCtwltLjJJOAukgT82lMfb9MfHxvDJaw0/gPLLnntgDJxbmhFaTirt1Auw1LYzeyNWiSXCB3RMnn9ESy4dQqeA/BQKHy7KYXybxZ/sJ/qb1IZgN96/t7q9pK4Kb6MQTC+vdI1s3R8A1EwiSWfT4dfHZshgP/cnoVXzhp6+EHnc6eSnFxykQij8jkZzmdb9WOrnh3OzczKNVPXmb7HanS/vwW9DvJPXBp7McTiA/Dq6EvisvK7wFPJeUsmZgmS4m5EwQRxZmw==
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
Subject: [XEN PATCH v2 21/25] arm: new VGIC: its: Implement MSI injection in
 ITS emulation
Thread-Topic: [XEN PATCH v2 21/25] arm: new VGIC: its: Implement MSI injection
 in ITS emulation
Thread-Index: AQHaE9VOmjckIYPQPEGT+3z3jWwEZg==
Date: Fri, 10 Nov 2023 12:56:23 +0000
Message-ID: 
 <6bb112c2232169798e5110f710cb394071848e74.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: a2246fe7-5184-457d-bc8c-08dbe1ec728a
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iS5mV7BWfFibvAKhPuyaZovC+NDnL8aIn71qyQflUa3Vevdn8RiPPA3ehvfkDZUaU7EsICw8WNIIv2cYD5Pyr4ROAU5ruMwVIHqbSbmJTbkopJoOBuClO+nSjMmdj2ydK7bkhuL8VzNP7VEmajj+o4nhMEfFBSw8iFrwRZEvpDKPDEGL6o452NXu20TiQ8uJRfmjiB0eXjtUFDCdjb3zXVp80AgIPpoFSt6yu+Co6aXIV/jhpt3Nx2hR+mVQZCNpBSlqjQKN/RHCizoINjHlxbX00n1SYVahGKPwMoCgTzvuE/MzOhwhJDM2n5aHugJL/Q0rs8TV8a63WWCwkL8moFCUgMmtDKfhQbrVokTuQVkAtHHgRw/XPgDyewm54ymBPLnWLY93KDb+UxoASL/5hKn/ox6sHljIQfvsJHlkkEr+GnI5b536O7hSgTmqH5k4UAsD5NMexq1zGdCBaLmhdJIpRTu2RzKcVrNwug1wVXDxStJrugQxA/VZyio0zh8WaUsQD/VOMXHH+k9jpT1ULrqu5fSckUcCgGwMAb3qkMnNG8Gv50xeExUjkGFiighxg+4qsnEzDJCN9UDnwYss4ZksjhPSkcvjZPCMU8eLDjogU0HZjwCtuwhFn++lEf7i
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?4K4llUywAaHNaoemyqCkK3lJf1Scb2WUiyBa534Hp7tkoevFLvjA81Zel0?=
 =?iso-8859-1?Q?GBkMC1FZXLw11qOLM2QGAZo1NjDqEtHK+JNXJOiLGlmbjHrRkpcEABv8Ij?=
 =?iso-8859-1?Q?YBPk5MSXyrE7p6lPsR2W2C4zVu5A1o6lBHG5tit1ySEsizcixCW8b9nFB3?=
 =?iso-8859-1?Q?V+GJu6ReaZBvuuOW0uS1Dqsejdwxl19nRCgEPpmUmWDdqrAhUIXULnRqvo?=
 =?iso-8859-1?Q?IG3Kr+kGiGFE+Ph/fh7Sx+tyAwAsAMelA4Q3paSUAqZn3B3fU4j72rQPAZ?=
 =?iso-8859-1?Q?EgwMEdMKn+LRSxkn35vFE8vQsqyvW+aqZRDHfOdj1z739W75zXYKthdr/5?=
 =?iso-8859-1?Q?QVNvyd1wV1CN4ucuUa859J/u3X+UOJdOcmUDRzkNgQRZHvVS0gz49KlWEJ?=
 =?iso-8859-1?Q?Vhw16bjjRLeluh1R5PKZt9Rd0wmu61oa4AGfa5rIepQpkwgEFvI+CYPtRA?=
 =?iso-8859-1?Q?zO/LS5Q398DkTlfYx/LruqypkBThwEId7MWSsy6uxdg7jQkMdvUsYBavCC?=
 =?iso-8859-1?Q?erDoWGCqDlnQCgdqBonIDeyXTfqU1axgkZlJ/DDIVLdGJnQAgcuieYLWuW?=
 =?iso-8859-1?Q?IAv2gu8KfOdC3ew1GDB4RZFGr9idRVKUVKt32kHMGbVPdmlZPJaho3W6KR?=
 =?iso-8859-1?Q?p/ufmXfRTzG/xescVZwWKH5u2oMnr4I/Qd6YQvEcBHvwhmt8e2xw6DRtzD?=
 =?iso-8859-1?Q?pYTEld1kuQlSaGojleKIFx1bRNRspm2Gfa7RaZFviqhSZd9O3or+wi/FpF?=
 =?iso-8859-1?Q?zVe5W/BCDmG/zANk7CZvOePAY+KDcigGTOzce6/qNpxLn08dpV+G8itwUM?=
 =?iso-8859-1?Q?3ZmcnFPJm4qvdBDtoSxEJQ4CcpCoOc264M47YGOnqu6N1JyKc/86WWtR1b?=
 =?iso-8859-1?Q?Io2M6gSJj8kH3hCH8WFsnJWtpr0gmHgGWcgU69CNXnCQFZpxt3jb1vUtSD?=
 =?iso-8859-1?Q?Th0g1mlZpgEq4CyX5wWZi5W2Ecw8PYOTMwsgkyVANOcHwwYJwvx6vtYzEe?=
 =?iso-8859-1?Q?RofauojtyQwAJK9BqiWbBRryRUMZaaDDddel+MXqYfkbPXjDZvatfuG+ge?=
 =?iso-8859-1?Q?rLFDESvNWvE9NY9GPEsJ2HzY9KmvTblJQqvQqqTCsNDmZEwZAu89POCx56?=
 =?iso-8859-1?Q?qhvquMhhp0uUOQtwQgOfPJGPN8KQ2e8dBLNjwtsrSubnwPJdbtRc5VRM1P?=
 =?iso-8859-1?Q?/nae+Xz4v7z/GR3SrlrTK/risdN8dXDfq7NlB7iLa14GYwdXgMTkyM0O3P?=
 =?iso-8859-1?Q?b/5SPoExKbuDLg/uVQ1LpmXbjOxwwHxAQyi/iSdjhs+VAHnuZJO39a14hf?=
 =?iso-8859-1?Q?E56Dq1ZE08Cv+a/qEMykBb30ZKyXm/RsR30xOTUJrVXAmn6m8ekSqReSJw?=
 =?iso-8859-1?Q?l511sEOo8dk1ReamKg2rhd8bv6+5WRUt1sVr6ClPrZoHeJqtozOrxQTxZv?=
 =?iso-8859-1?Q?63d9fkslcpRMjZtmwXx/V7cRRBls0bAeyM4Q1Pn1pjRyoOTQitIcPeHgEk?=
 =?iso-8859-1?Q?Y9UaY+5oUQ8e5EFrqUyfMHnaRYXovHRSc3CLDxCpxUXI2hn14hpGAeWsGz?=
 =?iso-8859-1?Q?NCTBtyWZPlIec/3DlGW+0AfYbr0URUWTy7dGio/MvYnx06qsWOIX4SNpq9?=
 =?iso-8859-1?Q?Zv1jdVS+JjPjufeHPutnpTndZtZVLui6uz5bff36YjZu+D4H0qGfi+Gg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2246fe7-5184-457d-bc8c-08dbe1ec728a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:23.3222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cA15oGbc2TWv4jJsf3rw3pPhvoK7TKmZ3350Ohg60IJTxO6xW+yhV1cqZwMaosJWc8/IP15rgGKdpBRpErf4bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-GUID: NZn16RH7nLNGCMn3zAF7raMFcYfsfYDa
X-Proofpoint-ORIG-GUID: NZn16RH7nLNGCMn3zAF7raMFcYfsfYDa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=982 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Implement handling of the ITS INT command.
With the help of the IO bus framework we learn the corresponding
ITS from the doorbell address. We then use our wrapper functions to
iterate the linked lists and find the proper Interrupt Translation Table
Entry (ITTE) and thus the corresponding struct vgic_irq to finally set
the pending bit.

Based on Linux commit 2891a7dfb6c4a by Andre Przywara

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/vgic/vgic-its.c | 112 +++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/xen/arch/arm/vgic/vgic-its.c b/xen/arch/arm/vgic/vgic-its.c
index 9a30087d3d..9534b26334 100644
--- a/xen/arch/arm/vgic/vgic-its.c
+++ b/xen/arch/arm/vgic/vgic-its.c
@@ -557,6 +557,81 @@ static u32 max_lpis_propbaser(u64 propbaser)
     return 1U << min(nr_idbits, INTERRUPT_ID_BITS_ITS);
 }
=20
+int vgic_its_resolve_lpi(struct domain *d, struct vgic_its *its, u32 devid=
,
+                         u32 eventid, struct vgic_irq **irq)
+{
+    struct vcpu *vcpu;
+    struct its_ite *ite;
+
+    if ( !its->enabled )
+        return -EBUSY;
+
+    ite =3D find_ite(its, devid, eventid);
+    if ( !ite || !its_is_collection_mapped(ite->collection) )
+        return E_ITS_INT_UNMAPPED_INTERRUPT;
+
+    vcpu =3D d->vcpu[ite->collection->target_addr];
+    if ( !vcpu )
+        return E_ITS_INT_UNMAPPED_INTERRUPT;
+
+    if ( !vgic_lpis_enabled(vcpu) )
+        return -EBUSY;
+
+    vgic_its_cache_translation(d, its, devid, eventid, ite->irq);
+
+    *irq =3D ite->irq;
+    return 0;
+}
+
+int vgic_its_inject_cached_translation(struct domain *d, struct vgic_its *=
its, u32 devid, u32 eventid)
+{
+	struct vgic_irq *irq;
+	unsigned long flags;
+	paddr_t db;
+
+	db =3D its->vgic_its_base + GITS_TRANSLATER;
+	irq =3D vgic_its_check_cache(d, db, devid, eventid);
+	if (!irq)
+		return -EWOULDBLOCK;
+
+	spin_lock_irqsave(&irq->irq_lock, flags);
+	irq->pending_latch =3D true;
+	vgic_queue_irq_unlock(d, irq, flags);
+
+	return 0;
+}
+
+/*
+ * Find the target VCPU and the LPI number for a given devid/eventid pair
+ * and make this IRQ pending, possibly injecting it.
+ * Must be called with the its_lock mutex held.
+ * Returns 0 on success, a positive error value for any ITS mapping
+ * related errors and negative error values for generic errors.
+ */
+static int vgic_its_trigger_msi(struct domain *d, struct vgic_its *its,
+                                u32 devid, u32 eventid)
+{
+    struct vgic_irq *irq =3D NULL;
+    unsigned long flags;
+    int err;
+
+	if (!vgic_its_inject_cached_translation(d, its, devid, eventid))
+		return 1;
+
+    err =3D vgic_its_resolve_lpi(d, its, devid, eventid, &irq);
+    if ( err )
+        return err;
+
+    /* GICv4 style VLPIS are not yet supported */
+    WARN_ON(irq->hw);
+
+    spin_lock_irqsave(&irq->irq_lock, flags);
+    irq->pending_latch =3D true;
+    vgic_queue_irq_unlock(d, irq, flags);
+
+    return 0;
+}
+
 static u64 its_cmd_mask_field(u64 *its_cmd, int word, int shift, int size)
 {
     return (le64_to_cpu(its_cmd[word]) >> shift) & (BIT(size, ULL) - 1);
@@ -868,6 +943,27 @@ void vgic_its_delete_device(struct domain *d, struct v=
gic_its_device *its_dev)
     list_del(&its_dev->dev_list);
 }
=20
+void vgic_vcpu_inject_lpi(struct domain *d, unsigned int virq)
+{
+    /*
+     * TODO: this assumes that the struct pending_irq stays valid all of
+     * the time. We cannot properly protect this with the current locking
+     * scheme, but the future per-IRQ lock will solve this problem.
+     */
+    struct vgic_irq *p =3D vgic_get_irq(d, d->vcpu[0], virq);
+    unsigned int vcpu_id;
+
+    if ( !p )
+        return;
+
+    vcpu_id =3D ACCESS_ONCE(p->target_vcpu->vcpu_id);
+    if ( vcpu_id >=3D d->max_vcpus )
+          return;
+
+    vgic_put_irq(d, p);
+    vgic_inject_irq(d, d->vcpu[vcpu_id], virq, true);
+}
+
 /*
  * MAPD maps or unmaps a device ID to Interrupt Translation Tables (ITTs).
  * Must be called with the its_lock mutex held.
@@ -1173,6 +1269,19 @@ static int vgic_its_cmd_handle_movall(struct domain =
*d, struct vgic_its *its,
     return 0;
 }
=20
+/*
+ * The INT command injects the LPI associated with that DevID/EvID pair.
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_int(struct domain *d, struct vgic_its *its,
+                                   u64 *its_cmd)
+{
+    u32 msi_data  =3D its_cmd_get_id(its_cmd);
+    u64 msi_devid =3D its_cmd_get_deviceid(its_cmd);
+
+    return vgic_its_trigger_msi(d, its, msi_devid, msi_data);
+}
+
 int vgic_its_inv_lpi(struct domain *d, struct vgic_irq *irq)
 {
     return update_lpi_config(d, irq, NULL, true);
@@ -1288,6 +1397,9 @@ static int vgic_its_handle_command(struct domain *d, =
struct vgic_its *its,
     case GITS_CMD_MOVALL:
         ret =3D vgic_its_cmd_handle_movall(d, its, its_cmd);
         break;
+    case GITS_CMD_INT:
+        ret =3D vgic_its_cmd_handle_int(d, its, its_cmd);
+        break;
     case GITS_CMD_INV:
         ret =3D vgic_its_cmd_handle_inv(d, its, its_cmd);
         break;
--=20
2.34.1

