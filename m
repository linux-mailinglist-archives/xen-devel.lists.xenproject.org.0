Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D086F7E7C56
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630304.983098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R41-0003rg-Uz; Fri, 10 Nov 2023 12:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630304.983098; Fri, 10 Nov 2023 12:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R41-0003jW-CV; Fri, 10 Nov 2023 12:56:45 +0000
Received: by outflank-mailman (input) for mailman id 630304;
 Fri, 10 Nov 2023 12:56:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3x-0001y0-5v
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:41 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 955dff4d-7fc8-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:56:38 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIuvh025691; Fri, 10 Nov 2023 12:56:31 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9j2g0qjw-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:31 +0000
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
X-Inumbo-ID: 955dff4d-7fc8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqZ15/rfG7fUg7DWQvFcGgAW4ZsygIPMMMMH2NnpQ2QbD9HTg8fSrvTTdXe7jmM+uIQrsZbhrAld4MiDbYfBOLhXKvvITC+X2Za6WHC7pny/cYdb3sh5qqqnS1rSLS0cJf4sYzIjjuVtNYPn0AwpGRE2lbdjg4HySewK7S4qRqmkfKAJ1ihVBbeZa0qx5S7A6jnO3L2F/qULaZm5Vs6gHrabRlrvJvbB4v+P7/lMKdtnF0mTvk2u9ma4M61hwpK6bjSIARan0/8d/qDVkbI/ldB+V6s9AMe6QmPxHs53m30MojvQsDb2v2rzwfPjYUPxjMUMwzECWH7mjtoTRaxOkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laODZ4Gs+y5E4svUvsfAqE5Iuee5D06nD4w3sS8JL40=;
 b=XglTUcfubP67CF3FVgVD//4DcSaDO5sIZ2vcV89JAWCR5gV8bWX9Pr+q4LkhQMt6V2fy1CaoZ4GOtSEcVbOGzOPPDTaplVSacty3sLcboTR1ywLPfhiDs3Qm5MhHQiPLYZolhdie1EJWE+NyDYLzd9uDo8CNmnGxq2reKcBKmmD3ZD8tJR0WY/2G3XwVdyve9Y4NVzFlFwWfbeIt99W1AOoCaKZ3cDWq43Qc7oFg/RnZLtLD62p61sbKwo71W5DzJMECRK/H1h64FrBl+m4GklrrTUthItvtiS/H3HXUAwxPoYS1DzhPWxWq+GofzZJMeuGfG/LrhQ3E89bwAjPx3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laODZ4Gs+y5E4svUvsfAqE5Iuee5D06nD4w3sS8JL40=;
 b=fmyaQZ6MGWsRQn9ye21lXhGFq7RqE8A+azUklOujl22FT0T/eD/FZ3/zJey3dT1q0j4n4o+w7DXMcEwVXv+XL53ymLz0dwDmXW2bGZ2Fp6qrAtceB78sNCr5t0ggOKuoL4/5l7jDxmN7rF7YQ/AD2MGO6VfhxiTrEfyvpfFcMouI0IduFbFX1IU3YSw75bkleei2zfNb+zUNOKRdOZX9bXIUD5bzyLfnOQvaIvg9iAP5jng6sxfjmSAkh4azV5+xWBOVZDCtNpEqMNg7IktmugVOooI+ycW+Aa5MuXvHGHHjkNET/jtnVLhLgBORHBcYkoUteyusqwZQoz4dWGsG7g==
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
Subject: [XEN PATCH v2 19/25] arm: new VGIC: its: Add LPI translation cache
 definition
Thread-Topic: [XEN PATCH v2 19/25] arm: new VGIC: its: Add LPI translation
 cache definition
Thread-Index: AQHaE9VOswsQu2Pw50ypJgIWmh5TYw==
Date: Fri, 10 Nov 2023 12:56:22 +0000
Message-ID: 
 <8d747db93eb3a2afd4895d8e20b163dcd707bb33.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: 81c3897b-eec6-410e-fd19-08dbe1ec7209
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3wmlamY3LNFeJ/yJ9+OnohN32gDRJyW9df1JCS98Cb9XNjuosKkTkeGbCq88Z5h68vc1QaixcqKyWsZxEzQipSd0CgHSCR2r675Pc/3J+myzlahiuh4HgJHWvjH01lykZP5JO1OqoqJbRjOPJzBfDuCcf3MUdPpwkbmLF+78c1zB7oDQ2PdmoGQhhcPfsgpcQYjOGRuKp/C3unlp9YBdB6i+neW3Vrl5f+b+w/AZOgvcwPQCA+wLUyh5MP9HRetjy3m0P9mR4MHUh1a+vbUScGrE+R7/AlOl9VDD5J/g+1bph+gKhsND/Gyfhe3q3mtOFXSBHIsHwNo3xZCJb/G2vOBcOazv6vN0Vp3qcZgMogNpxgBV+hlOepPsdhJYdhWbaMAU9j39VGc5/LU2zquB2IQz0cMiU8xiGjo3ItRSWjEpd3CDMZ+YEObWgyIDBbUZSnVZSZoakWJbMtXLBfPs2ni8WWOmO39R1IejZ5BR7zydZqXiwWCVOFeSUXlM8PNmJ9x8LTcwf2UEYIJhqg671eA1igcR7JrWFF+1O4cRjO9H4kB14LbkZZ4OhGYof4AP2MK3wxn8gaJiuagiIeO02OkhfItFnJHp/y9zbgNMXvAj0+LQCc031ADk/gHdSgLx
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?R/riGC6Flf7VgFyhYhrprFxVbRlR5DC2sEkQwjqFyz/I8xqCKMJIZMbQIU?=
 =?iso-8859-1?Q?VBpiJJcRpHV41U5BkNMFRk1Lk97C0i8jovEn8qKXaU3oPXlBjismK7zEUo?=
 =?iso-8859-1?Q?hW9CpgHrRaDWQrC/cwocMQArMdmtzuemnoruOWmEDNjkdTDgRRW7BE2bsZ?=
 =?iso-8859-1?Q?EnWsA2ankLazK8L5v2/miOarBjLOeMh6gToTiIZMsCjambbQkRvVTacGbO?=
 =?iso-8859-1?Q?HJ0a9UEcaI/xmZw6jvbaJ9GNOs4+10vzq8e6iWHctvk6LPQfgvrGmjAfcO?=
 =?iso-8859-1?Q?dpfNwV/cBYVFS96R4opmex4rF48nB47RliktO3e7uFVnWb0HREXpmzKk73?=
 =?iso-8859-1?Q?N308Sa2ARBg1QMVjzQe/ikljoReGFswwqcxAnvo+ASmPTd8AyuZ7ObaeNx?=
 =?iso-8859-1?Q?TywGzolJRU00bkIZEmQllzu0sKY2guf1sXAQzvTwjDeU18Qmdp59MgZcdj?=
 =?iso-8859-1?Q?DkvN99V3qTupL5poY9h3t6WfTC9TNr1wUD7clsLx/qJyD94OyZvm4X5rlk?=
 =?iso-8859-1?Q?CKDV5CTGBDhs7nFY/+K3UKjGQorwTquQuhBCzyTrjJic9r/pn3+Ur9J6sZ?=
 =?iso-8859-1?Q?Q5mVoCAqVvGfLOspxRjMpCRGsja4MmIC11NnWjKhRc4zdsbYJSuZwl6LW1?=
 =?iso-8859-1?Q?itXb/fMMv2J/7SJkUcS/QtR5ZjKzqeXM8ELb1SQ4uxYlhM9WphUuYeqnud?=
 =?iso-8859-1?Q?3Lp7CeCaMAw/1trNAJsy59MVIv2yORaH3JkfwaqQRSfvILJq4oZZwxYa/8?=
 =?iso-8859-1?Q?v0ELSsHlyeFAKM8LY2KL8UVxvij0VpNgHKc6ra2hd5X9uYvVQ28h1Yvkeh?=
 =?iso-8859-1?Q?RU3UXghzL2qkf+aaYl/5zZjM/Hfbhx6xLDZHhXICYtmfKWJgdfLG7a4wDX?=
 =?iso-8859-1?Q?D55o4qnVq5f1GEx2N+uXKEhTQXfXfu7VkhCpchCu/wKomyxK1NGBASyXnl?=
 =?iso-8859-1?Q?vMzC5B1TSaI0Uek8kbRImfZjQn+FuG/CpxBTwQMrlSudIub3iAyS8iM9k4?=
 =?iso-8859-1?Q?pDKAYFGLYf02qHmwbQmER7BFUNh5milkpBDOF9t2osNm4SmnYWLj2DFLWK?=
 =?iso-8859-1?Q?8AAUHBZLEYGfFkAN/3tk3+YbRPVEvt9g532TytIllz6AZAKTEGPfmwofXe?=
 =?iso-8859-1?Q?1p668FDjiMcv7U3aaI2Gx3vpgSS/0BJmTAKTqINqpz5DzHdPmB1ZfA9VDs?=
 =?iso-8859-1?Q?xJYAEGLgD3sr0UKEfgT1UBfhlXWfZvMlfTujBmdKUslh04VBJU4c5yh6Yb?=
 =?iso-8859-1?Q?TKV/7guD0SqsvJkfNH9HC/UKzmhFIuEXBWpHNnSBPJaN2kM3lmRpXWR0hY?=
 =?iso-8859-1?Q?AdUXtVNJrOsurtX8/8JOa73YdvXlaKLgFM+mesjMXcEjtSYoC3p9CIzqUZ?=
 =?iso-8859-1?Q?JutJxvuEJn94rIh1GRfhhQHp+J9P5iB6fD9tiYXc4Dy/nZcc5G/crC8xLd?=
 =?iso-8859-1?Q?bDfPLWVjQ+r/hajQMUScW10rWHhPEJ4LYrDhcWA1Xl0HJy9Y9TplFFK69+?=
 =?iso-8859-1?Q?wAJMiWrjtu4n7eEcUcWn+kVDwBGhjw36NZlbva/aFG5RqL7Ujj9TGomuTG?=
 =?iso-8859-1?Q?R8SDdwTNYHPWGV+8XZtAtFzvjhvafqL0mRh20hEmFqBFXGX+55FDKerrOu?=
 =?iso-8859-1?Q?F3DZnGwju0rDBKnZAMz0McuiOM09NpeyJnlZKW/Ww80E4+osjG6Z9ubg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c3897b-eec6-410e-fd19-08dbe1ec7209
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:22.5551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uNK0bznj8zP6nR6nMReRLu7c8VqlDBFpFryMu5ht1liYiBjHpBkynuHRj+hUMAGEVa0kRQY4ICVU/jOT9bJp5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-ORIG-GUID: bVLGMpNT3R9t2aZ8pVMOFwQdxOhkIXFl
X-Proofpoint-GUID: bVLGMpNT3R9t2aZ8pVMOFwQdxOhkIXFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=835
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Add the basic data structure that expresses an MSI to LPI
translation as well as the allocation/release hooks.

Implement cache invalidation, lookup and storage.

The size of the cache is arbitrarily defined as 16*nr_vcpus.

This is based on Linux commits 24cab82c34aa6f, 7d825fd6eaa7467,
89489ee9ced8 and 86a7dae884f38 by Marc Zyngier

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/new_vgic.h |   3 +
 xen/arch/arm/vgic/vgic-its.c        | 195 ++++++++++++++++++++++++++++
 2 files changed, 198 insertions(+)

diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm=
/new_vgic.h
index d0fd15e154..b038fb7861 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -212,6 +212,9 @@ struct vgic_dist {
     spinlock_t          lpi_list_lock;
     struct list_head    lpi_list_head;
     unsigned int        lpi_list_count;
+
+    /* LPI translation cache */
+    struct list_head	lpi_translation_cache;
 };
=20
 struct vgic_cpu {
diff --git a/xen/arch/arm/vgic/vgic-its.c b/xen/arch/arm/vgic/vgic-its.c
index 6c726dde3a..48dfa09115 100644
--- a/xen/arch/arm/vgic/vgic-its.c
+++ b/xen/arch/arm/vgic/vgic-its.c
@@ -44,6 +44,14 @@ struct its_ite {
     u32 event_id;
 };
=20
+struct vgic_translation_cache_entry {
+    struct list_head entry;
+    paddr_t db;
+    u32 devid;
+    u32 eventid;
+    struct vgic_irq *irq;
+};
+
 /*
  * Find and returns a device in the device table for an ITS.
  * Must be called with the its_devices_lock mutex held.
@@ -152,6 +160,144 @@ int vgic_copy_lpi_list(struct domain *d, struct vcpu =
*vcpu, u32 **intid_ptr)
     return i;
 }
=20
+void __vgic_put_lpi_locked(struct domain *d, struct vgic_irq *irq)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+
+    if ( !atomic_dec_and_test(&irq->refcount) )
+    {
+        return;
+    };
+
+    list_del(&irq->lpi_list);
+    dist->lpi_list_count--;
+
+    xfree(irq);
+}
+
+static struct vgic_irq *__vgic_its_check_cache(struct vgic_dist *dist,
+                                               paddr_t db, u32 devid,
+                                               u32 eventid)
+{
+    struct vgic_translation_cache_entry *cte, *fcte;
+
+    list_for_each_entry(cte, &dist->lpi_translation_cache, entry)
+    {
+        /*
+         * If we hit a NULL entry, there is nothing after this
+         * point.
+         */
+        if ( !cte->irq )
+            break;
+
+        if ( cte->db !=3D db || cte->devid !=3D devid || cte->eventid !=3D=
 eventid )
+            continue;
+
+        /*
+         * Move this entry to the head, as it is the most
+         * recently used.
+         */
+        fcte =3D list_first_entry(&dist->lpi_translation_cache,
+                                struct vgic_translation_cache_entry, entry=
);
+
+        if ( fcte->irq !=3D cte->irq )
+            list_move(&cte->entry, &dist->lpi_translation_cache);
+
+        return cte->irq;
+    }
+
+    return NULL;
+}
+
+static struct vgic_irq *vgic_its_check_cache(struct domain *d, paddr_t db,
+					     u32 devid, u32 eventid)
+{
+	struct vgic_dist *dist =3D &d->arch.vgic;
+	struct vgic_irq *irq;
+
+	spin_lock(&dist->lpi_list_lock);
+	irq =3D __vgic_its_check_cache(dist, db, devid, eventid);
+	spin_unlock(&dist->lpi_list_lock);
+
+	return irq;
+}
+
+static void vgic_its_cache_translation(struct domain *d, struct vgic_its *=
its,
+                                       u32 devid, u32 eventid,
+                                       struct vgic_irq *irq)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+    struct vgic_translation_cache_entry *cte;
+    unsigned long flags;
+    paddr_t db;
+
+    /* Do not cache a directly injected interrupt */
+    if ( irq->hw )
+        return;
+
+    spin_lock_irqsave(&dist->lpi_list_lock, flags);
+
+    if ( unlikely(list_empty(&dist->lpi_translation_cache)) )
+        goto out;
+
+    /*
+     * We could have raced with another CPU caching the same
+     * translation behind our back, so let's check it is not in
+     * already
+     */
+    db =3D its->vgic_its_base + GITS_TRANSLATER;
+    if ( __vgic_its_check_cache(dist, db, devid, eventid) )
+        goto out;
+
+    /* Always reuse the last entry (LRU policy) */
+    cte =3D list_last_entry(&dist->lpi_translation_cache, typeof(*cte), en=
try);
+
+    /*
+     * Caching the translation implies having an extra reference
+     * to the interrupt, so drop the potential reference on what
+     * was in the cache, and increment it on the new interrupt.
+     */
+    if ( cte->irq )
+        __vgic_put_lpi_locked(d, cte->irq);
+
+    vgic_get_irq_kref(irq);
+
+    cte->db      =3D db;
+    cte->devid   =3D devid;
+    cte->eventid =3D eventid;
+    cte->irq     =3D irq;
+
+    /* Move the new translation to the head of the list */
+    list_move(&cte->entry, &dist->lpi_translation_cache);
+
+out:
+    spin_unlock_irqrestore(&dist->lpi_list_lock, flags);
+}
+
+void vgic_its_invalidate_cache(struct domain *d)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+    struct vgic_translation_cache_entry *cte;
+    unsigned long flags;
+
+    spin_lock_irqsave(&dist->lpi_list_lock, flags);
+
+    list_for_each_entry(cte, &dist->lpi_translation_cache, entry)
+    {
+        /*
+         * If we hit a NULL entry, there is nothing after this
+         * point.
+         */
+        if ( !cte->irq )
+            break;
+
+        __vgic_put_lpi_locked(d, cte->irq);
+        cte->irq =3D NULL;
+    }
+
+    spin_unlock_irqrestore(&dist->lpi_list_lock, flags);
+}
+
 /* Requires the its_lock to be held. */
 static void its_free_ite(struct domain *d, struct its_ite *ite)
 {
@@ -184,6 +330,8 @@ void vgic_its_free_device(struct vgic_its_device *devic=
e)
     list_for_each_entry_safe(ite, temp, &device->itt_head, ite_list)
         its_free_ite(d, ite);
=20
+    vgic_its_invalidate_cache(d);
+
     list_del(&device->dev_list);
     xfree(device);
 }
@@ -351,6 +499,8 @@ static void vgic_mmio_write_its_ctlr(struct domain *d, =
struct vgic_its *its,
         goto out;
=20
     its->enabled =3D !!(val & GITS_CTLR_ENABLE);
+    if ( !its->enabled )
+        vgic_its_invalidate_cache(d);
=20
     /*
      * Try to process any pending commands. This function bails out early
@@ -742,6 +892,48 @@ out:
     return ret;
 }
=20
+/* Default is 16 cached LPIs per vcpu */
+#define LPI_DEFAULT_PCPU_CACHE_SIZE 16
+
+void vgic_lpi_translation_cache_init(struct domain *d)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+    unsigned int sz;
+    int i;
+
+    if ( !list_empty(&dist->lpi_translation_cache) )
+        return;
+
+    sz =3D d->max_vcpus * LPI_DEFAULT_PCPU_CACHE_SIZE;
+
+    for ( i =3D 0; i < sz; i++ )
+    {
+        struct vgic_translation_cache_entry *cte;
+
+        /* An allocation failure is not fatal */
+        cte =3D xzalloc(struct vgic_translation_cache_entry);
+        if ( WARN_ON(!cte) )
+            break;
+
+        INIT_LIST_HEAD(&cte->entry);
+        list_add(&cte->entry, &dist->lpi_translation_cache);
+    }
+}
+
+void vgic_lpi_translation_cache_destroy(struct domain *d)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+    struct vgic_translation_cache_entry *cte, *tmp;
+
+    vgic_its_invalidate_cache(d);
+
+    list_for_each_entry_safe(cte, tmp, &dist->lpi_translation_cache, entry=
)
+    {
+        list_del(&cte->entry);
+        xfree(cte);
+    }
+}
+
 #define INITIAL_BASER_VALUE                                               =
     \
     (GIC_BASER_CACHEABILITY(GITS_BASER, INNER, RaWb) |                    =
     \
      GIC_BASER_CACHEABILITY(GITS_BASER, OUTER, SameAsInner) |             =
     \
@@ -763,6 +955,8 @@ static int vgic_its_create(struct domain *d, u64 addr)
=20
     d->arch.vgic.its =3D its;
=20
+    vgic_lpi_translation_cache_init(d);
+
     spin_lock_init(&its->its_lock);
     spin_lock_init(&its->cmd_lock);
=20
@@ -829,6 +1023,7 @@ void vgic_v3_its_free_domain(struct domain *d)
=20
     vgic_its_free_device_list(d, its);
     vgic_its_free_collection_list(d, its);
+    vgic_lpi_translation_cache_destroy(d);
=20
     spin_unlock(&d->arch.vgic.its_devices_lock);
     spin_unlock(&its->its_lock);
--=20
2.34.1

