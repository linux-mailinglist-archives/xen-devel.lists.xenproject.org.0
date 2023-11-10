Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468367E7C5C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630311.983171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R4C-0006LP-NH; Fri, 10 Nov 2023 12:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630311.983171; Fri, 10 Nov 2023 12:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R4B-0005uQ-NR; Fri, 10 Nov 2023 12:56:55 +0000
Received: by outflank-mailman (input) for mailman id 630311;
 Fri, 10 Nov 2023 12:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R41-0001y0-6Z
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:45 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 969e15bc-7fc8-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:56:40 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIeef019156; Fri, 10 Nov 2023 12:56:26 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9kkyram6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:26 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:20 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:20 +0000
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
X-Inumbo-ID: 969e15bc-7fc8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDoMlsltv1Id5HvBr6cJHeq4tVbHIE0zBAXvg5Qfy/oidW93shzwlOyqDmik3oRqdi29W16GlJngUIeWkg2ya62JDWAB94QN2UDKWmZMyPRDJ2mCFqmvF6HU9N1v6mgPUgQ41aP4cFenJDvaE4/j+FCFaAlOPrBi1K7YWNaToHDZKmhOFEXbxj/D6Ba9MlM56xDZf/deDqgmsoPaU2iDTDHVXGeFE/aPVknurNJUuV0N1W614ONSOI9T7yvZI8Thnp1yQkYgFmPON+TkV45KyL10PK4ZzqKLib/Ycjaepy6KHYAxW0IuA2xYHahjxkPsK+O3kHzNbEkf3LwcMFqJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsuUkMvf5gI06/kh6Aitv9g+GlzsqEZAOIWBAFgXeMY=;
 b=bZxCZQy/qzCEKWnbvx2bGBXUxp6XfIMBiVn5vKUByHC7Le5zVjGXewyAlPIKAsVdmgsJywZsZRUj6NCS0Ohhf8sdpROWEZjN+G3yybbuDo617Md0NVmLbw42XWpOBuzW822XutQTEpzPqL2TiIOzd98WrAxU2JTRuGjhNTf+Qe3jQN3V2rScBgSoDk2Y/MOxfEdWadgeznd0owZFkkDdcchCi7o1ZY3E8Gs22PwiI+4T7G8FfbG2fl/yit8mi3NYf7wGNQH1Matuck8INIKc/QsJvq1qUw5sBg2xsoEOKudlaOIODqp6ZLemeVeckuY9cOcM0PO0U1A+SPCeEJXoGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsuUkMvf5gI06/kh6Aitv9g+GlzsqEZAOIWBAFgXeMY=;
 b=jaHFayV9G2AsrzkbQk3JXidD97APvOKlPa8GrBZB7FXbCeYk3+acbv3FvdmybI6VKl2Tosh+Pdd+R3O6ySSET+F+E+YA9hk843l6QN0S8ymzU31uamD4ZBM9xMZro/9eB2BH45EoAfdZk5e6VOD0cKuF3O8LftwQwtXRGkdsAiDqtOombBPceiIW1xIDCoI5BXONr/yXoBEM/vr3jWUM3MpxgXz/vDbVGE7HTO/RliOff5GWmMZq0zIfgEQjd6IIviv6o0agBFoSeMBkN/pUqDXnz4H+cROeEqk4+Nl02Let88FW2WRZEFBlErJ4hh94R6q06ENPzQn8uhZfw8Z5vA==
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
Subject: [XEN PATCH v2 08/25] arm: new VGIC: Add GICv3 SGI system register
 trap handler
Thread-Topic: [XEN PATCH v2 08/25] arm: new VGIC: Add GICv3 SGI system
 register trap handler
Thread-Index: AQHaE9VMyTFmCIij9kWiuYpeUQUfzA==
Date: Fri, 10 Nov 2023 12:56:18 +0000
Message-ID: 
 <8819e1bd76ea4ef2c7057e3d91badd476921c1b0.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: b67e61ff-d329-415f-a27d-08dbe1ec6f88
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eR9KgbFXUe54FBb92xOc4XYQb7oIXU7MCcObfCZ7hj72K3GXGa74SarO5oagGC7ovLEq0dVSCpPJDcgNsDIkRxZ0m2Zh29c5rV7VlVkr7jQODXwrWzDjX4z8srgHao2cUg28Ql+XEgn8ZogrbfaEEEudpaiezFA/AfGPWu4z7NUUy19mqY4pP5W4RS0oq6x6P3VMIZjNmdfg7eGPnDmv2qEG1DgvJxxGOm0prLZ2UF3M3NAngxjYFSp4CfG+/w6z8iBihQB+e48v++x/NakFEqTNIeV+GOdWX66BHQu+rA2sqnr6QONkDFBsoJOVKJo6lt5PFBwLk3C+fnmXlNNPiFOzJDR/dIWS7yqqkkGm4MKulVkSENPv+13q1z4qJKq4NqSc/89hVYkiMvRp2Dfega3z1kGuzgXTtfSvxbfMsa/SsvQClZfPsNyTTgXlugziHOdnvRvdu5gEiuTkNhSOUq3GUtfH3dudOqUuB9R/ih2ecdG8HjkhYqRlWBHJ+GBrrHeUY9YGiXLIkhUuhBuM4006Y499owGCi4todKPPgX9ibrn6ZrzRoHTITVOFWHLh2RBwyZYnQmqar+hE1eaE2KfoWs1uQ1p3o4WYplusZmT21sSqMrfnSiD+eTXg+9m6IvbzjDYlYgV5U94SH8j5CpjaP+8hncf9Ld/tKO31TeM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(66899024)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3+GSE4qJeIbMgHkYbKCL29Zb67ceo+3nwWp0oB+nfOp7I9zuCYarUHst9K?=
 =?iso-8859-1?Q?Kj/xjOZII//n/6cuXl3J4qzjnv7CUxjFHoFIC0XImDos3GkPSUm+cN2Qp1?=
 =?iso-8859-1?Q?xPL41kYkogvN4SuBekfZx7JpFghRDkHGy3ZozH00DYZLRo0SUvTc5M7bym?=
 =?iso-8859-1?Q?awIFif9S5or/KdUnaEO3a50u+qbzj+C0ejW0PEX8dispI2B7dns7DKQH+f?=
 =?iso-8859-1?Q?hy9BwQh/pl5UskQrrZdnFkCjBDwjE0SHlIuLL7KcPZpTGcyKJrMy8wiMqi?=
 =?iso-8859-1?Q?Dd+VnoYRKd7TsUubEuxNZea45FPaKjpMc86aS03gYqd8ZxjLcyei46mA4V?=
 =?iso-8859-1?Q?2L9B053R27HFaOFY2Pidp/mCnYP9flcyZhKmwcT19vs2Q1shwJeRL9Nosi?=
 =?iso-8859-1?Q?a2XJFHn0b/2SP7twxFyuk3/I9JqzZqXKYhEb85soKEGM0QnfebBRu972fi?=
 =?iso-8859-1?Q?Y0iVSvxpKCgHm4COxcdu04AOB40hjad9TrbYbimtkRexSiQ+SSskLga8n8?=
 =?iso-8859-1?Q?vXyeS2TlsG+lOMDSp0yfeYi9u1KPaHnlrSQGNGaMtRqjDzmJBjUkwftpyF?=
 =?iso-8859-1?Q?PHzsNFPl5+gZuGgPhf/bOQHwElS04Ox7ak1YZjS+vdXL7KOohfTvH7NZ0y?=
 =?iso-8859-1?Q?7vVSe2D7bn1bCoQA15tm+Nw8KqJatq9ud3tUMfdqNQSvOcDZypzori1QdP?=
 =?iso-8859-1?Q?/X7osdDZhtl/2ry6WMZqv1a9g4gNnyIXEFjtAY7Tg9qV4z4BV7j5foHxUm?=
 =?iso-8859-1?Q?pI2fLF9EgSretKJqCxYIJWhhkp1Gu5VdIeFvVQyx6AS8OtDZjFcUSivH+C?=
 =?iso-8859-1?Q?jewUcagAZPblGAa63h8Fx5kVkj5/0QSkMu85r8fwpYvk3QfpSoPhwJ4qYv?=
 =?iso-8859-1?Q?cEXIj00byGyoy6SiyK0YvYgyBH9HsEOL773clw9PrU/1ykxVQDeEdGxLBw?=
 =?iso-8859-1?Q?khBHi6r7RonD3aRxchj6+cfQa/yqnNdD/eM5u+N/0HrT3RxDI/I6TLQtKo?=
 =?iso-8859-1?Q?vHQ+HcjFiHr5lIH4npxEvkrvzxbLqrqhuLqWc77LZY09jpiYizM/D9Peep?=
 =?iso-8859-1?Q?/JWhn+dDOXmRWYrN8SQoELe4QHj/EF7UEL3kUB5MP9IZHq7f5XPDgrpI5Z?=
 =?iso-8859-1?Q?XplOnYUBVbOVI4zLYv69mEF64u7Kd1v7ZQPXW+9FivuHnyHU0mVPgAtOB4?=
 =?iso-8859-1?Q?nGo+jA/t90d7kQJRS661ku5hGFiv/VkaU9MJiqv4u5XW0B2j448DdxwMay?=
 =?iso-8859-1?Q?g9j1PtVBZBvhbD/9kldIStoM7Uiv6P60qex4DEDvYtGAS/J7xXuLel4G2y?=
 =?iso-8859-1?Q?kXObSRA+T1mB8dkQROObxqx+bDuXN5N2v6UM7dWs7i46Tv9fZN6mQrngK4?=
 =?iso-8859-1?Q?O8hjWUMgOlo+cLPEnjp+fALBrPwAF0HrTT5WpLIOrYkDD+YtF+Up8e2vPl?=
 =?iso-8859-1?Q?Kbg9c47m03gcaLDiPDnBBFbnz0TZ0A5dO1D67HKmiSV0bjvLlImY/fudmD?=
 =?iso-8859-1?Q?SpCjben6DfB6VIIZUhTAH2a2IUH9pgP1S/FY0oxZvfZIA3aRjIOASmWUy+?=
 =?iso-8859-1?Q?0wx+nsedNmI/WT6mcXl4DqVCtVUtIee59r1DYNAbcoe6QrJbfmY1fCYM+G?=
 =?iso-8859-1?Q?AWCcbWxEwvyvKBrPE9rLYsHKyr+eE9IGSeK1TuodFNHjN5LMVG3hcPvQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67e61ff-d329-415f-a27d-08dbe1ec6f88
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:18.7631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BKkbniO+WhjZynZ9VqKW7c/DklKNxlvUHA0vy7Qpdc3S8Sf3rsTtoZG0cyjaeW6Jy/jsANMwdYwCx9rn434Ygw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-GUID: Psa6Il3WoqtBmCIJYySScdTGoJoGFJQJ
X-Proofpoint-ORIG-GUID: Psa6Il3WoqtBmCIJYySScdTGoJoGFJQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

In contrast to GICv2 SGIs in a GICv3 implementation are not triggered
by a MMIO write, but with a system register write. Xen knows about
that register already, we just need to implement the handler and wire
it up to the core Xen/ARM code.

Base on Linux commit 621ecd8d2123bc13 by Andre Przywara

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/gic_v3_defs.h |   2 +-
 xen/arch/arm/vgic/vgic-mmio-v3.c       | 147 +++++++++++++++++++++++++
 xen/arch/arm/vgic/vgic.c               |  10 +-
 xen/arch/arm/vgic/vgic.h               |   5 +
 4 files changed, 160 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index e0d536e887..1e81687818 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -204,7 +204,7 @@
 #define ICH_SGI_IRQ_SHIFT            24
 #define ICH_SGI_IRQ_MASK             0xf
 #define ICH_SGI_TARGETLIST_MASK      0xffff
-#define ICH_SGI_AFFx_MASK            0xff
+#define ICH_SGI_AFFx_MASK            0xffULL
 #define ICH_SGI_AFFINITY_LEVEL(x)    (16 * (x))
=20
 struct rdist_region {
diff --git a/xen/arch/arm/vgic/vgic-mmio-v3.c b/xen/arch/arm/vgic/vgic-mmio=
-v3.c
index 3d892a68cb..19ebf723ee 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v3.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v3.c
@@ -42,6 +42,153 @@ unsigned long extract_bytes(uint64_t data, unsigned int=
 offset,
     return (data >> (offset * 8)) & GENMASK_ULL(num * 8 - 1, 0);
 }
=20
+static int match_mpidr(u64 sgi_aff, u16 sgi_cpu_mask, struct vcpu *vcpu)
+{
+    unsigned long affinity;
+    int level0;
+
+    /*
+     * Split the current VCPU's MPIDR into affinity level 0 and the
+     * rest as this is what we have to compare against.
+     */
+    affinity =3D vcpuid_to_vaffinity(vcpu->vcpu_id);
+    level0   =3D MPIDR_AFFINITY_LEVEL(affinity, 0);
+    affinity &=3D ~MPIDR_LEVEL_MASK;
+
+    /* bail out if the upper three levels don't match */
+    if ( sgi_aff !=3D affinity )
+        return -1;
+
+    /* Is this VCPU's bit set in the mask ? */
+    if ( !(sgi_cpu_mask & BIT(level0, ULL)) )
+        return -1;
+
+    return level0;
+}
+
+#define SGI_AFFINITY_LEVEL(reg, level)                                    =
     \
+    ((((reg) & (ICH_SGI_AFFx_MASK << ICH_SGI_AFFINITY_LEVEL(level))) >>   =
     \
+      ICH_SGI_AFFINITY_LEVEL(level))                                      =
     \
+     << MPIDR_LEVEL_SHIFT(level))
+
+static bool vgic_v3_emulate_sgi1r(struct cpu_user_regs *regs, uint64_t *r,
+                                  bool read)
+{
+    struct domain *d  =3D current->domain;
+    struct vcpu *vcpu =3D current;
+    struct vcpu *c_vcpu;
+    u16 target_cpus;
+    u64 mpidr;
+    int sgi;
+    int vcpu_id =3D vcpu->vcpu_id;
+    bool broadcast;
+    unsigned long flags;
+
+    if ( read )
+    {
+        gdprintk(XENLOG_WARNING, "Reading SGI1R_EL1 - WO register\n");
+        return false;
+    }
+
+    sgi         =3D (*r >> ICH_SGI_IRQ_SHIFT) & ICH_SGI_IRQ_MASK;
+    broadcast   =3D *r & BIT(ICH_SGI_IRQMODE_SHIFT, ULL);
+    target_cpus =3D (*r & ICH_SGI_TARGETLIST_MASK);
+
+    mpidr  =3D SGI_AFFINITY_LEVEL(*r, 3);
+    mpidr |=3D SGI_AFFINITY_LEVEL(*r, 2);
+    mpidr |=3D SGI_AFFINITY_LEVEL(*r, 1);
+
+    /*
+     * We iterate over all VCPUs to find the MPIDRs matching the request.
+     * If we have handled one CPU, we clear its bit to detect early
+     * if we are already finished. This avoids iterating through all
+     * VCPUs when most of the times we just signal a single VCPU.
+     */
+    for_each_vcpu(d, c_vcpu)
+    {
+        struct vgic_irq *irq;
+
+        /* Exit early if we have dealt with all requested CPUs */
+        if ( !broadcast && target_cpus =3D=3D 0 )
+            break;
+
+        /* Don't signal the calling VCPU */
+        if ( broadcast && c_vcpu->vcpu_id =3D=3D vcpu_id )
+            continue;
+
+        if ( !broadcast )
+        {
+            int level0;
+
+            level0 =3D match_mpidr(mpidr, target_cpus, c_vcpu);
+            if ( level0 =3D=3D -1 )
+                continue;
+
+            /* remove this matching VCPU from the mask */
+            target_cpus &=3D ~BIT(level0, UL);
+        }
+
+        irq =3D vgic_get_irq(vcpu->domain, c_vcpu, sgi);
+
+        spin_lock_irqsave(&irq->irq_lock, flags);
+
+        if ( !irq->hw )
+        {
+            irq->pending_latch =3D true;
+            vgic_queue_irq_unlock(vcpu->domain, irq, flags);
+        }
+        else
+        {
+            printk(XENLOG_ERR "HW SGIs are not implemented\n");
+            BUG();
+            spin_unlock_irqrestore(&irq->irq_lock, flags);
+        }
+
+        vgic_put_irq(vcpu->domain, irq);
+    }
+
+    return true;
+}
+
+static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr h=
sr)
+{
+    struct hsr_sysreg sysreg =3D hsr.sysreg;
+
+    ASSERT(hsr.ec =3D=3D HSR_EC_SYSREG);
+
+    if ( sysreg.read )
+        perfc_incr(vgic_sysreg_reads);
+    else
+        perfc_incr(vgic_sysreg_writes);
+
+    switch ( hsr.bits & HSR_SYSREG_REGS_MASK )
+    {
+    case HSR_SYSREG_ICC_SGI1R_EL1:
+        return vreg_emulate_sysreg(regs, hsr, vgic_v3_emulate_sgi1r);
+
+    default:
+        return false;
+    }
+}
+
+bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr)
+{
+    switch ( hsr.ec )
+    {
+#ifdef CONFIG_ARM_64
+    case HSR_EC_SYSREG:
+        return vgic_v3_emulate_sysreg(regs, hsr);
+#endif
+    case HSR_EC_CP15_64:
+        printk(XENLOG_ERR
+               "vgic_v3_emulate_reg: HSR_EC_CP15_64 not implemented");
+        BUG();
+        break;
+    default:
+        return false;
+    }
+}
+
 /*
  * The Revision field in the IIDR have the following meanings:
  *
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index 97ca827fc4..946877bbac 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -865,9 +865,13 @@ struct irq_desc *vgic_get_hw_irq_desc(struct domain *d=
, struct vcpu *v,
=20
 bool vgic_emulate(struct cpu_user_regs *regs, union hsr hsr)
 {
-    ASSERT(current->domain->arch.vgic.version =3D=3D GIC_V3);
-
-    return false;
+    switch ( current->domain->arch.vgic.version )
+    {
+    case GIC_V3:
+        return vgic_v3_emulate_reg(regs, hsr);
+    default:
+        return false;
+    }
 }
=20
 /*
diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
index b3bba7b5f3..0e0cf7b213 100644
--- a/xen/arch/arm/vgic/vgic.h
+++ b/xen/arch/arm/vgic/vgic.h
@@ -74,6 +74,7 @@ int vgic_register_dist_iodev(struct domain *d, gfn_t dist=
_base_fn,
 #ifdef CONFIG_GICV3
 void vgic_v3_fold_lr_state(struct vcpu *vcpu);
 void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int lr);
+bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr);
 unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev);
 int vgic_v3_set_redist_base(struct domain *d, u32 index, u64 addr, u32 cou=
nt);
 int vgic_register_redist_iodev(struct vcpu *vcpu);
@@ -88,6 +89,10 @@ static inline unsigned int vgic_v3_init_dist_iodev(struc=
t vgic_io_device *dev)
 {
     return 0;
 }
+static inline bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union h=
sr hsr)
+{
+    return false;
+}
 static inline int vgic_v3_set_redist_base(struct domain *d, u32 index, u64=
 addr, u32 count)
 {
     return 0;
--=20
2.34.1

