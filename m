Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CCA7E7C58
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630295.983022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3v-00023B-Mm; Fri, 10 Nov 2023 12:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630295.983022; Fri, 10 Nov 2023 12:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3v-00020b-Hl; Fri, 10 Nov 2023 12:56:39 +0000
Received: by outflank-mailman (input) for mailman id 630295;
 Fri, 10 Nov 2023 12:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3t-0001y0-H5
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:37 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9300c536-7fc8-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:56:34 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIuvX025691; Fri, 10 Nov 2023 12:56:21 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9j2g0qjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:21 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:16 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:16 +0000
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
X-Inumbo-ID: 9300c536-7fc8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESPjaDO/HhFX35Rcc/hs05aNIlEvWybjwv25zHJ6i2Q0aGcX7EhYfQkKCHoezYhtAQcgQ70Teubb61HKBgxgope1rj2mn/BdRxmqDJ1Ge8cVq/Vgkocc+FUNM/1cH3Xc8fHyYPExUXjLSC7ec3yzgvqnbazW+zE4kE+pgWdsKDYNoGZw429fGjFVChlslt1XN3gLdicsoLjJhiOli2/2Zb8S6DKLsd/25LvfMxmcXuiAOC5tQhzMwvZ2njev4FcvfkOIbeGc6WT0R4i7D4cMjMjLcLKbsO77Q24+KFl2Dmcit8GXhXqHQLOfae3eV7vm5czfHC5bMIWJkA7CWkQKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fv2sSS1E8IyyC05BS/b/6K+ysUBbf+47kNcRVhgAkhk=;
 b=goDXh49b1gCLm7bTXz5Qtsv6FGqVjnMnwjPxE6NjpJvFNcbb+NoLdbWVLqYMjapq3m0KGMiNoY8ENGa5U8rYff42hOxohS9LfLnq2S1cxM0/sYtEVsut7vpkQeTsfgV6pMYfnBThYwjgm3DGd50ySwsgy+hxpvrJXSqaXy4aawDljAEu0NO4pCPX3F6oV+/uCg5A3rz4vBetQCTdl6lTwlUmt1FXOQBi8nPCVThiYpDbS9G7m5FCS84cRu5BxO3p9ZTo4i1FXIJYLxLJHgRpHK9/JF53txdPdxuxiuLAI00bhjkdedJWw/4kxd5sN3TgaqA+X1HGZPW2jqhVDw0USA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fv2sSS1E8IyyC05BS/b/6K+ysUBbf+47kNcRVhgAkhk=;
 b=r358BQOMZmKsGK0iyJB7HFkxPXv1m4hsLguLMoI4wZXIXsmjPhqq2FweAUEg33Kcx7Cs3BcEW27LJomBCNZUwlNzUG7jQmAeBXin/6RWOuAjujCSaYONzQaNT7VB+3kItBaxeYhGF3U+l95d1G6FgfnuVkOylAt8DVz9AReBBPUt+vv35YgRp8/XfSZGzymdmb15AheLzv8aV23rnPLFauZjD91HeM2FtMcl3kPeocWuh/3t99mJC/920JOsKTr1vlltYmDPEf0W3dhcjP1khFdsVhWXpyB04ey9Uoffff/u9iOPXHcq6jf6VeI+XVw5OKieZAb9pX3UQUNrPyuuiw==
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
Subject: [XEN PATCH v2 02/25] arm: new VGIC: Add GICv3 world switch backend
Thread-Topic: [XEN PATCH v2 02/25] arm: new VGIC: Add GICv3 world switch
 backend
Thread-Index: AQHaE9VK1uiKTlA4P0ytsVfgwtVF7g==
Date: Fri, 10 Nov 2023 12:56:16 +0000
Message-ID: 
 <dd7d39a04dc44af8e589e891d92e9d5f19d3861b.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: 88ed8580-64fb-4807-cde8-08dbe1ec6d4e
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zXAl6yu48qNpAOPDiiHOm+jYILFkTjfBugt2u5N0ejSlDLpX9KeFj+iRqYszUKnfMXTxVLzyqp7XpYsYGTsSUJy6tX3f7wjPDXgTIl8dCoTHbYOPL5KnAUQCYLaKUvBMjazlf+BfSeF1qri8KlnqMGFCQvW5SQiWlyNn6r8XAqkE/LE5qFZD0oReFCAzuX+nYysmCoLIjPJDj15cnUefy4bAplR3st6czxPuH5/CEOycP+LxKHgV/Qy9B1V6lOd/yOkQzp7WpS/xTPJPm561s1mfht3+wwsrBe6tI8iAWR/4bXqX6OEGA5jApDvhEnjWCCrGRAkSZ9vYhByoUJUDh8illBGc0W2ttdMmUgkCrkNd4KmUkLYjGDhHloHZ3L5gYXOcHtKqbJjixg2rc2+DJK23JAXUEdlPGUHq5Eobgz0fPGJmf5WeBK03sk2nh1IA0kVfwXJOzpB7Vxjam6cvYh6ZJNI/wV+ZyKekm58SVP/1VXAQB2wyfty4lBS06EqfMhjiDykI/NM6B5ZHb1pT08SL63z+nqFC9HhfTDO8Yg/1NEkPZv8zvGzMO9HGgvoqpc2hBwj0xj/Sy1MO0x7zZ1uX8Q6u/KNQTWNrulbmMvGM7oNCc+t6ov91z4Y4rA7R
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?WpkGSQU45JR/IYs05aMOCeIZULHUcDPkvZpyQBJ1AQtP0KYCyqplkHdoNn?=
 =?iso-8859-1?Q?8Mj7/WKrMD7zeBO2hoWJyVEhuPB6iXWa04CLfs7+2egbe2J6lAT5RVpsQi?=
 =?iso-8859-1?Q?NDq5YM+8RIzeoK7x4Muu4ZoTXlmQVm+BmFhX8QJfwwYkP1tSghAGALFhBK?=
 =?iso-8859-1?Q?KCl46U8f0zGIZnVwLMDM66MWmIhGL/mzYrr/y6wal93BZkcjpfMVMbDOAW?=
 =?iso-8859-1?Q?4dRpR1N4hKHGZ79K67vl4SlxL9j8mC8rMUNNlOkhicFF2C3S3UzAWEZj6F?=
 =?iso-8859-1?Q?05v6YXlXbXlZR1wh8Hqn+HrrXYcpi6sdxPjBDOp+XCTyJFFkiLHKfJWqZC?=
 =?iso-8859-1?Q?bv9T6c19XyapFx680/Md9YHG3hUzrwcvI3W4YqnvaOcUZnbXft0q96qZQi?=
 =?iso-8859-1?Q?69ciXwymTpTcbegI90G/z8Gkk7kP0keioYYIaxIv90fcSbdTyEQJWVPZjf?=
 =?iso-8859-1?Q?xjcR8pxw0rARGUodZrYX5VM9SVT3M9n9PZLmnzKGjeUab41lbRxACATPxP?=
 =?iso-8859-1?Q?sak88XPuM+xz1Tzs07a/d+0uoyusPvC0DLz4SSesFEMlybCAotfoCOHpld?=
 =?iso-8859-1?Q?cqhFlTH44AratdRX0qWrZWJrFCI+Wy13KCfFjfjUUXeAV5lXujy3e3+qMk?=
 =?iso-8859-1?Q?wDkiwOqOHEbgXxEvHUEGExR3Gfd+ex/FXJB0KbocC9UD0O/KhiTpXuD7vZ?=
 =?iso-8859-1?Q?IMsNGel6+CItrc+JCD08k7IQ3Ct/QbwQ04lxwr4tVG4sJk35jjzu2gVcXk?=
 =?iso-8859-1?Q?pEtxfApwHnMW+5fqPdfqVsOOebVPY6I3A9eRA8H2+XRYz1vlgDtBp4C6LH?=
 =?iso-8859-1?Q?XUhBCEoaIwcj66aVaq+zmsoZIlxSulJgzDtxsIpb1mIvZNObNrvwvZ9hQM?=
 =?iso-8859-1?Q?8Uxgk+Jr0RR+OTrsq36AMdoXRMwq9O3LfKUzG4R5cI3VA/Pi5GKUHznD+Q?=
 =?iso-8859-1?Q?4xr1E9e1VtBNVoF+xg6xxtzHHidcqqg2wGwy+PsNf3BOlcNcb57jpVpYho?=
 =?iso-8859-1?Q?xxWcNPAGamAmvpWNxJ5YsRwusAFV6yQLjrWBAI36aUYtSHE8A3ELn8ctR9?=
 =?iso-8859-1?Q?85imCnDS+B0wMbltj7pPp4+jmtgFtzMTnpmSQaA3giVsXE29H8inia03fy?=
 =?iso-8859-1?Q?vjNw0XIZxgiZ/4QjbZgtB9aVWyXrHyqvT4u5bVBbyWVe57IociqY4BeLSb?=
 =?iso-8859-1?Q?QnZ6HvGXm0+sUkBQeb9noyCbdTr+SZ59pLbnSpX8pAcIpJUuU023Xh7R5S?=
 =?iso-8859-1?Q?MBqmGhfjLlBU8CVds/FtBh9Wzl4ytmrY1SGwLD2r9GC51FkU9nMOXvpbgV?=
 =?iso-8859-1?Q?bDvJ802nyMtiuwGDGsXRHeRj3JNIq2FihTsdKuTMRaeUl3THobm14ssx9M?=
 =?iso-8859-1?Q?ETVETRs46tRSH/3LZfBgUPPaN2XHiMBtjuL7jdjsmgNJV0VkFRMinsdYpE?=
 =?iso-8859-1?Q?58taAfDd4397YeSOLy+K4vcvNYqUG/0H0kA8vXcNZYObPKxxv++aTyA/iS?=
 =?iso-8859-1?Q?I4J0/leH0O36lguBrqH+ni/9EQ0Tyx96wWDq/f2RLVa82w6P9cjV3W/Y7M?=
 =?iso-8859-1?Q?CIUnUQgO/xuvmK+i66/QV7SYdn/TJdlk5su2sWRPE4YxP/UCs5W8xJ+2F7?=
 =?iso-8859-1?Q?we8L4ffy2OQpP2kwYiOxcrYtp0wb0Lynz0gvHZSS5pAE3SqS82dDkDdQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ed8580-64fb-4807-cde8-08dbe1ec6d4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:16.4974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BfIsKDZxwvaE3SIXIDKF6rnXbA2rZYb+mCR6mHWZccs4IF2t1B2EQGAU6oS4JnxgZPj+EUFMaauiFQDkCKFOhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-ORIG-GUID: co0qNPOKd4oPybfeeLtcO5E_Hyh4lAB9
X-Proofpoint-GUID: co0qNPOKd4oPybfeeLtcO5E_Hyh4lAB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=892
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

As the GICv3 virtual interface registers differ from their GICv2
siblings, we need different handlers for processing maintenance
interrupts and reading/writing to the LRs.
Implement the respective handler functions and connect them to
existing code to be called if the host is using a GICv3.

This is based on Linux commit 59529f69f5048e0 by Marc Zyngier

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/vgic/vgic-v3.c | 206 ++++++++++++++++++++++++++++++++++++
 xen/arch/arm/vgic/vgic.c    |  18 +++-
 xen/arch/arm/vgic/vgic.h    |  13 ++-
 3 files changed, 234 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/vgic/vgic-v3.c

diff --git a/xen/arch/arm/vgic/vgic-v3.c b/xen/arch/arm/vgic/vgic-v3.c
new file mode 100644
index 0000000000..b018ee6040
--- /dev/null
+++ b/xen/arch/arm/vgic/vgic-v3.c
@@ -0,0 +1,206 @@
+/*
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
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include <asm/new_vgic.h>
+#include <asm/gic.h>
+#include <xen/sched.h>
+
+#include "vgic.h"
+
+/*
+ * transfer the content of the LRs back into the corresponding ap_list:
+ * - active bit is transferred as is
+ * - pending bit is
+ *   - transferred as is in case of edge sensitive IRQs
+ *   - set to the line-level (resample time) for level sensitive IRQs
+ */
+void vgic_v3_fold_lr_state(struct vcpu *vcpu)
+{
+    struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
+    unsigned int used_lrs     =3D vcpu->arch.vgic.used_lrs;
+    unsigned long flags;
+    unsigned int lr;
+
+    if ( !used_lrs ) /* No LRs used, so nothing to sync back here. */
+        return;
+
+    gic_hw_ops->update_hcr_status(GICH_HCR_UIE, false);
+
+    for ( lr =3D 0; lr < used_lrs; lr++ )
+    {
+        struct gic_lr lr_val;
+        uint32_t intid;
+        struct vgic_irq *irq;
+        struct irq_desc *desc =3D NULL;
+
+        gic_hw_ops->read_lr(lr, &lr_val);
+
+        /*
+         * TODO: Possible optimization to avoid reading LRs:
+         * Read the ELRSR to find out which of our LRs have been cleared
+         * by the guest. We just need to know the IRQ number for those, wh=
ich
+         * we could save in an array when populating the LRs.
+         * This trades one MMIO access (ELRSR) for possibly more than one =
(LRs),
+         * but requires some more code to save the IRQ number and to handl=
e
+         * those finished IRQs according to the algorithm below.
+         * We need some numbers to justify this: chances are that we don't
+         * have many LRs in use most of the time, so we might not save muc=
h.
+         */
+        gic_hw_ops->clear_lr(lr);
+
+        intid =3D lr_val.virq;
+        irq   =3D vgic_get_irq(vcpu->domain, vcpu, intid);
+
+        local_irq_save(flags);
+
+        /*
+         * We check this here without taking the lock, because the locking
+         * order forces us to do so. irq->hw is a "write-once" member, so
+         * whenever we read true, the associated hardware IRQ will not go
+         * away anymore.
+         * TODO: rework this if possible, either by using the desc pointer
+         * directly in struct vgic_irq or by changing the locking order.
+         * Especially if we ever drop the assumption above.
+         */
+        if ( irq->hw )
+        {
+            desc =3D irq_to_desc(irq->hwintid);
+            spin_lock(&desc->lock);
+        }
+
+        spin_lock(&irq->irq_lock);
+
+        /*
+         * If a hardware mapped IRQ has been handled for good, we need to
+         * clear the _IRQ_INPROGRESS bit to allow handling of new IRQs.
+         *
+         * TODO: This is probably racy, but is so already in the existing
+         * VGIC. A fix does not seem to be trivial.
+         */
+        if ( irq->hw && !lr_val.active && !lr_val.pending )
+            clear_bit(_IRQ_INPROGRESS, &desc->status);
+
+        /* Always preserve the active bit */
+        irq->active =3D lr_val.active;
+
+        /* Edge is the only case where we preserve the pending bit */
+        if ( irq->config =3D=3D VGIC_CONFIG_EDGE && lr_val.pending )
+        {
+            irq->pending_latch =3D true;
+
+            if ( vgic_irq_is_sgi(intid) )
+                irq->source |=3D (1U << lr_val.virt.source);
+        }
+
+        /* Clear soft pending state when level irqs have been acked. */
+        if ( irq->config =3D=3D VGIC_CONFIG_LEVEL && !lr_val.pending )
+            irq->pending_latch =3D false;
+
+        /*
+         * Level-triggered mapped IRQs are special because we only
+         * observe rising edges as input to the VGIC.
+         *
+         * If the guest never acked the interrupt we have to sample
+         * the physical line and set the line level, because the
+         * device state could have changed or we simply need to
+         * process the still pending interrupt later.
+         *
+         * If this causes us to lower the level, we have to also clear
+         * the physical active state, since we will otherwise never be
+         * told when the interrupt becomes asserted again.
+         */
+        if ( vgic_irq_is_mapped_level(irq) && lr_val.pending )
+        {
+            ASSERT(irq->hwintid >=3D VGIC_NR_PRIVATE_IRQS);
+
+            irq->line_level =3D gic_read_pending_state(desc);
+
+            if ( !irq->line_level )
+                gic_set_active_state(desc, false);
+        }
+
+        spin_unlock(&irq->irq_lock);
+        if ( desc )
+            spin_unlock(&desc->lock);
+        local_irq_restore(flags);
+
+        vgic_put_irq(vcpu->domain, irq);
+    }
+
+    gic_hw_ops->update_hcr_status(GICH_HCR_EN, false);
+    vgic_cpu->used_lrs =3D 0;
+}
+
+/* Requires the irq to be locked already */
+void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int lr)
+{
+    struct gic_lr lr_val =3D { 0 };
+
+    lr_val.virq          =3D irq->intid;
+
+    if ( irq_is_pending(irq) )
+    {
+        lr_val.pending =3D true;
+
+        if ( irq->config =3D=3D VGIC_CONFIG_EDGE )
+            irq->pending_latch =3D false;
+
+        if ( vgic_irq_is_sgi(irq->intid) &&
+             vcpu->domain->arch.vgic.version =3D=3D VGIC_V2 )
+        {
+            uint32_t src =3D ffs(irq->source);
+
+            BUG_ON(!src);
+            lr_val.virt.source =3D (src - 1);
+            irq->source &=3D ~(1 << (src - 1));
+            if ( irq->source )
+                irq->pending_latch =3D true;
+        }
+    }
+
+    lr_val.active =3D irq->active;
+
+    if ( irq->hw )
+    {
+        lr_val.hw_status =3D true;
+        lr_val.hw.pirq   =3D irq->hwintid;
+        /*
+         * Never set pending+active on a HW interrupt, as the
+         * pending state is kept at the physical distributor
+         * level.
+         */
+        if ( irq->active && irq_is_pending(irq) )
+            lr_val.pending =3D false;
+    }
+    else
+    {
+        if ( irq->config =3D=3D VGIC_CONFIG_LEVEL )
+            lr_val.virt.eoi =3D true;
+    }
+
+    /*
+     * Level-triggered mapped IRQs are special because we only observe
+     * rising edges as input to the VGIC.  We therefore lower the line
+     * level here, so that we can take new virtual IRQs.  See
+     * vgic_v2_fold_lr_state for more info.
+     */
+    if ( vgic_irq_is_mapped_level(irq) && lr_val.pending )
+        irq->line_level =3D false;
+
+    /* The GICv2 LR only holds five bits of priority. */
+    lr_val.priority =3D irq->priority >> 3;
+
+    gic_hw_ops->write_lr(lr, &lr_val);
+}
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index b9463a5f27..97ca827fc4 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -520,7 +520,14 @@ retry:
=20
 static void vgic_fold_lr_state(struct vcpu *vcpu)
 {
-    vgic_v2_fold_lr_state(vcpu);
+    if ( vcpu->domain->arch.vgic.version =3D=3D GIC_V2 )
+    {
+        vgic_v2_fold_lr_state(vcpu);
+    }
+    else
+    {
+        vgic_v3_fold_lr_state(vcpu);
+    }
 }
=20
 /* Requires the irq_lock to be held. */
@@ -529,7 +536,14 @@ static void vgic_populate_lr(struct vcpu *vcpu,
 {
     ASSERT(spin_is_locked(&irq->irq_lock));
=20
-    vgic_v2_populate_lr(vcpu, irq, lr);
+    if ( vcpu->domain->arch.vgic.version =3D=3D GIC_V2 )
+    {
+        vgic_v2_populate_lr(vcpu, irq, lr);
+    }
+    else
+    {
+        vgic_v3_populate_lr(vcpu, irq, lr);
+    }
 }
=20
 static void vgic_set_underflow(struct vcpu *vcpu)
diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
index 534b24bcd3..2819569f30 100644
--- a/xen/arch/arm/vgic/vgic.h
+++ b/xen/arch/arm/vgic/vgic.h
@@ -70,8 +70,19 @@ void vgic_v2_enable(struct vcpu *vcpu);
 int vgic_v2_map_resources(struct domain *d);
 int vgic_register_dist_iodev(struct domain *d, gfn_t dist_base_fn,
                              enum vgic_type);
+#ifdef CONFIG_GICV3
+void vgic_v3_fold_lr_state(struct vcpu *vcpu);
+void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int lr);
+#else
+static inline void vgic_v3_fold_lr_state(struct vcpu *vcpu)
+{
+}
+static inline void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq =
*irq, int lr)
+{
+}
+#endif /* CONFIG_GICV3 */
=20
-#endif
+#endif /* __XEN_ARM_VGIC_VGIC_H__ */
=20
 /*
  * Local variables:
--=20
2.34.1

