Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D707E7C59
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630312.983177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R4D-0006Uv-Sn; Fri, 10 Nov 2023 12:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630312.983177; Fri, 10 Nov 2023 12:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R4C-0006Kl-Km; Fri, 10 Nov 2023 12:56:56 +0000
Received: by outflank-mailman (input) for mailman id 630312;
 Fri, 10 Nov 2023 12:56:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R41-0001y1-Ci
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:45 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 968078c6-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:40 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIuvb025691; Fri, 10 Nov 2023 12:56:26 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9j2g0qjw-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:26 +0000
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
X-Inumbo-ID: 968078c6-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvvFHBt08JO68HN7bS3Hof2SYwY/O00FDSgU5K8GfXIaTUWOsRaGG9Ev5K7JCE1tSscWL52tsNaFS+aPlfA7VHcMv5gcaPKv5x5bW0gHg4F0sFZRubApRVQxo6AFNDswTK7movwwZ+XOLxX82rB3inUDroMUZ9Ccz04rk1Y2jZKtpcTPL1emBRvRSqSyXPpBHPRd+D1GkJKGwqmvMviVnle/2/H9nVoF4mQQ9tSvOz8VxTYwAu48PrBzYrdXs610vBG3QIfiRJBZDIBu0y6Y2+Bg+V9TEvO0wQFfqvE4GgaGxhAl3VAXKCuv7Gj7MBCZ1MDvo+NgUVMunxxQANI4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LH4NgNUrJb7AxU4A2c+rBJ2vFrRhnJveRhbmQXTv6fw=;
 b=SxazRw60CKtbVwqbewk/IkWTyBZGNghINtv3xghoJXZRbXWsziXgPATZdbNhCz3X3AVpx7VYme4BvmkTk15Zvobw1v/4PiiLgAwNW6lsFu8nxd3lBiwsetlevC8DzlYRUn6L2d3P23kLCIl2q8C0+dSYk/IxOaXYHOhKAKdRm+NmEfyRcquKexFI9P5Xap4DSETS2A2BSuTn4qU7qjis3jE9kEgzsP+rcdFAWTA9Mqa4jd7mm2Zkvo2aBDTPRyFizWc/Rkf9aMO34fTCLEA6oczEWnaTDweioMeXqflzUoJuyobi2t2VtmTWsZfRwZTF6decyG2ecxDYGlzLDxAv8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LH4NgNUrJb7AxU4A2c+rBJ2vFrRhnJveRhbmQXTv6fw=;
 b=UutzairtowihEfQvkt8uXL404ZOdD375UtaCJr4q364m7Dl3c8s8NrQuLL2zuB7dvdugssSdpJX93CFktt7tADZR1SixAORNjfe9MaiCSS04kjqTNbnSW9p+RPuRONSH0qzuhFJx0OLQ3YV8ZH4fZCa6L2vFzzgbl3Td0oyWtOl9zvaUZTrcS3wMXz6tehUigIpDBKdTB5AblOHmw4id6uPdJUvoFf/dc5eIgw9EF2Q8rE0wwtzqrJBOL+LMLimK4/2PhfW2aaFnMgvhJflE14TQX71MCRU+9L1eajXHcnzDTi04FWKa0Rr5XcXRsbH7eI3oVWyrJXDSPTyAU5CNZw==
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
Subject: [XEN PATCH v2 07/25] arm: new VGIC: Add GICv3 IROUTER register
 handlers
Thread-Topic: [XEN PATCH v2 07/25] arm: new VGIC: Add GICv3 IROUTER register
 handlers
Thread-Index: AQHaE9VLou6qA6symUe+SqqE2YPjzQ==
Date: Fri, 10 Nov 2023 12:56:18 +0000
Message-ID: 
 <db07985e055865947ebeee6f1392c33e48120db4.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: abf56879-3d2a-46e2-acac-08dbe1ec6e90
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +d9qAtnqYZ7C/VzIhfI+yfOAOHZlElwqyqTMxs7+OCoFk8j5BTx9DyCX1WzY3B5wIrms8WQq+iynL0LM7iweDfNIoEClFgvQOzu507Vr1pU0waBuqpHf55Gx/KJPynee/0WMGplG2iwGknlk0GnCg7ee3EONug36z2i3eLOWCWzYSTAmfwqss83HpEwH/+E9DU/GsFZMzrJ94qta8G/Iz9mCSaL5Am6d2mBZpm4lNl0mhdgAVKltfGgYG2Sy6GhN5sh1MBV3a9yJdAM9nbeAmFqfrVS8Dm6YA9zj0D4AAggZVfi3JgIb3+mcbj5IUg9Ohk0CuT9gnKj4364POosv6gbPILiLG/3iPIZMvu+eWSXrV4+peSYK32wxbauAJmVXbm4PnoU6BOVGlq5J44zFI32dJwXsHY9nP522nRtreYRnDEtnmhGu6U1VhLQOzeKvCYA6uspQubju4Z7K6cA4yrXe9vszGj9CMSGwn1dVQrAa+C7sHIalKA32ixLfxeXtZXzC0CpQ+qgrN1hurlgHXGNgOI6aOGqxugOQI1piWfE8VmUAbghV3d9HEoq/EE4MNq6XTWbmJ9x4Gcu5DVOmLcJfOr+BtBU1DcwqhAH76e54ozcDUCxr10dVEaUcFW4y
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?YinFnRPE/5XM8TMG+RC7xubF8VmO30iOrbRWT/Xutl/O6q52oRIGUbmDAN?=
 =?iso-8859-1?Q?opwMcC/sKIfPOwTKsbywsf5ZsHhaTy3eTks3bzGpBZxDLLbCDfyZnZeHdp?=
 =?iso-8859-1?Q?L71zL5bFAC+Zw5Hr9qd+MQNR/3JsL5VaLPdZcddQisp2wuQ9rZWof3rFTI?=
 =?iso-8859-1?Q?m0DoNHonxKw+uGNqTb8rgHSyXknJB8Q2wzppbwfcQ3TMzLabLvuadXHeLt?=
 =?iso-8859-1?Q?SUvrV5oLebwBqU+Q2iLL5cy0zE3YrVqMtdOQCxXjD+09H7fPjWSx7lGS/5?=
 =?iso-8859-1?Q?KaErOZFnkKR8M+K4J2W0r+mzcx47iB3KVzBrH5O5szB34qjkXEJF0I3qxu?=
 =?iso-8859-1?Q?BkwCFSNqkApMplYWeqSrKm0NyfCP76BeS9DVfloTg8BZgfXsn0570o1F2U?=
 =?iso-8859-1?Q?3/dFxRf77NAF3Xv2pvaw+I4oj+JUOJgAPkXwt4MppE6XUVdq9TRZdGaPDB?=
 =?iso-8859-1?Q?0Li3gjkiGOwq7QSWKbi7GpH4d1pooRmTW7CYJ8V39iCGZQjDIfD9QrtXHo?=
 =?iso-8859-1?Q?1CZ8SSNW3brlM023AHOuDt3ndbpMzN5mAqOYDEvGuuWCO4TD2LFM8zs9ex?=
 =?iso-8859-1?Q?1IBmPTEYO9DRAGxrcPOLy2sk0/CG8dT+RU7IANHooPzwfNOAmm47w95dd8?=
 =?iso-8859-1?Q?f/Nr3bglI7lyL7hjCefqzHVk+SCXQdRJtT6AaD9rFat+KUL8fBvpVOyxJV?=
 =?iso-8859-1?Q?dejInEdCyBRMKzPfbMxNl1QZgFTK8+mC+RCEFtxVrMF4Qzn2ZMt0u4lSVB?=
 =?iso-8859-1?Q?M3Uo/inGZEYr8DfqqOPQNTRGse8vL0xnoxSSkNdt4wE+tQ0VvLok9Vw/Sz?=
 =?iso-8859-1?Q?gaom5kqkbTIL6411rgITdtV3e9SiMfjONDZRJZIfeygQdb0UYuuhvFkkrT?=
 =?iso-8859-1?Q?6WyWjoe/8l1b0vXN0hgi12gW4PV1uutm7VxKH8JXLaAK243/G7ifxFEr87?=
 =?iso-8859-1?Q?aq3LRgYbSzeJ09zB47Qqy8CdISJNBFYmHOwBKDJdrQY4aI3yE4XYx2RCS7?=
 =?iso-8859-1?Q?qTmH5AptjFtnlYDVIhtMr0xzkLgLxFPy/AytPtmNGiT/yPQITZkXuV2yM8?=
 =?iso-8859-1?Q?9rOE29x8zVRUjWulW7Mvfpc06bzC+LdNRS2rNmY2oROEA0C7JNR0GTFLDz?=
 =?iso-8859-1?Q?uy8xk9/rKIeEnItibuO4VowdNOmvUVxuFNUpOg5NgyKGHcXwTzg1GYMWqa?=
 =?iso-8859-1?Q?OhazMJqwimulUVzEoaAeR5S2JnVrBgjJd5sQL99hjXCopoNxnvkH5tzvG2?=
 =?iso-8859-1?Q?yN43AvSKmQil6yR79f5OCDoYunJUehY9Eym9t/7DMg3uTety1fEs5ZYBAy?=
 =?iso-8859-1?Q?mpEPMSgaKgIPhbN5sGSAZITnAQcDO7/U3HkJPZ3OaRs2IIndFY0pM5cSZI?=
 =?iso-8859-1?Q?EwsTjxrPNA2ly5U2UV8GMGwv0G9D32ixUG7HOQaUjigr0aQGZ8aDg1fImF?=
 =?iso-8859-1?Q?RdJz3Ei0ptbgiJmKAMX+p8nJMR4/dVSCPRnf0P7YJed7GXunYOX+MCZghM?=
 =?iso-8859-1?Q?LmsElnF/Ls/pvOCwXQ56FwaLX1ugr13L4UhfFI/4ZJiEGa5muda2cRkEOJ?=
 =?iso-8859-1?Q?Ps00X93KkEaXAq5EOwtyuUmhw2dUQKe9yUKX4S96SrvAkBEbhsPP91juOT?=
 =?iso-8859-1?Q?2Lrr8mX2vK/+zuBSLDDZ5PklqqbB8TWEVMeyTsPwaUyGh2gjlAdxtLTQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf56879-3d2a-46e2-acac-08dbe1ec6e90
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:18.4267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TXMV9z3B58K+PF7vXxNKopjHfIrpNjs5jTuXvxcHwOqiKXNm7v8BYNEcxV02qoUoRsfVk5TLq5KuOvBfxnb5/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-ORIG-GUID: o6iGCl1vHwd9BVrGE0bIHk8fV3Vwwvtk
X-Proofpoint-GUID: o6iGCl1vHwd9BVrGE0bIHk8fV3Vwwvtk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Since GICv3 supports much more than the 8 CPUs the GICv2 ITARGETSR
register can handle, the new IROUTER register covers the whole range
of possible target (V)CPUs by using the same MPIDR that the cores
report themselves.
In addition to translating this MPIDR into a vcpu pointer we store
the originally written value as well. The architecture allows to
write any values into the register, which must be read back as written.

Since we don't support affinity level 3, we don't need to take care
about the upper word of this 64-bit register, which simplifies the
handling a bit.

Based on Linux commit 78a714aba03039 by Andre Przywara

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/vgic/vgic-mmio-v3.c | 59 +++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic/vgic-mmio-v3.c b/xen/arch/arm/vgic/vgic-mmio=
-v3.c
index ccdf3b9456..3d892a68cb 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v3.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v3.c
@@ -22,6 +22,19 @@
 #include "vgic.h"
 #include "vgic-mmio.h"
=20
+static struct vcpu *mpidr_to_vcpu(struct domain *d, unsigned long mpidr)
+{
+    struct vcpu *vcpu;
+
+    mpidr &=3D MPIDR_HWID_MASK;
+    for_each_vcpu(d, vcpu)
+    {
+        if ( mpidr =3D=3D vcpuid_to_vaffinity(vcpu->vcpu_id) )
+            return vcpu;
+    }
+    return NULL;
+}
+
 /* extract @num bytes at @offset bytes offset in data */
 unsigned long extract_bytes(uint64_t data, unsigned int offset,
                             unsigned int num)
@@ -98,6 +111,50 @@ static void vgic_mmio_write_v3_misc(struct vcpu *vcpu, =
paddr_t addr,
     }
 }
=20
+static unsigned long vgic_mmio_read_irouter(struct vcpu *vcpu, paddr_t add=
r,
+                                            unsigned int len)
+{
+    int intid            =3D VGIC_ADDR_TO_INTID(addr, 64);
+    struct vgic_irq *irq =3D vgic_get_irq(vcpu->domain, NULL, intid);
+    unsigned long ret    =3D 0;
+
+    if ( !irq )
+        return 0;
+
+    /* The upper word is RAZ for us. */
+    if ( !(addr & 4) )
+        ret =3D extract_bytes(irq->mpidr, addr & 7, len);
+
+    vgic_put_irq(vcpu->domain, irq);
+    return ret;
+}
+
+static void vgic_mmio_write_irouter(struct vcpu *vcpu, paddr_t addr,
+                                    unsigned int len, unsigned long val)
+{
+    int intid =3D VGIC_ADDR_TO_INTID(addr, 64);
+    struct vgic_irq *irq;
+    unsigned long flags;
+
+    /* The upper word is WI for us since we don't implement Aff3. */
+    if ( addr & 4 )
+        return;
+
+    irq =3D vgic_get_irq(vcpu->domain, NULL, intid);
+
+    if ( !irq )
+        return;
+
+    spin_lock_irqsave(&irq->irq_lock, flags);
+
+    /* We only care about and preserve Aff0, Aff1 and Aff2. */
+    irq->mpidr       =3D val & GENMASK(23, 0);
+    irq->target_vcpu =3D mpidr_to_vcpu(vcpu->domain, irq->mpidr);
+
+    spin_unlock_irqrestore(&irq->irq_lock, flags);
+    vgic_put_irq(vcpu->domain, irq);
+}
+
 static bool vgic_mmio_vcpu_rdist_is_last(struct vcpu *vcpu)
 {
     struct vgic_dist *vgic    =3D &vcpu->domain->arch.vgic;
@@ -206,7 +263,7 @@ static const struct vgic_register_region vgic_v3_dist_r=
egisters[] =3D {
         vgic_mmio_read_raz, vgic_mmio_write_wi, 1,
         VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_IROUTER,
-        vgic_mmio_read_raz, vgic_mmio_write_wi, 64,
+        vgic_mmio_read_irouter, vgic_mmio_write_irouter, 64,
         VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICD_IDREGS,
         vgic_mmio_read_v3_idregs, vgic_mmio_write_wi, 48,
--=20
2.34.1

