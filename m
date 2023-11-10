Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488637E7C51
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630309.983150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R48-0005QR-ER; Fri, 10 Nov 2023 12:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630309.983150; Fri, 10 Nov 2023 12:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R47-0005Am-IA; Fri, 10 Nov 2023 12:56:51 +0000
Received: by outflank-mailman (input) for mailman id 630309;
 Fri, 10 Nov 2023 12:56:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R40-0001y0-6Z
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:44 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 961ccc77-7fc8-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:56:40 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIuva025691; Fri, 10 Nov 2023 12:56:25 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9j2g0qjw-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:25 +0000
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
X-Inumbo-ID: 961ccc77-7fc8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGvA/t2f94c/luHukq+n5yhivan/BrS5nFOp4FOmiaHHs+AgR1GrZwO2wwMy5yYGlTzEBAS8SZMPNM3Sboh/GYSlfB695dfdw9HEhdtZr/3UmNNN1kNo1wmiq25/FBjnMuYFn6y/VtCndyDL10C3eqYXmP9nkBgCNMOwZOaRrc2/FrLV6TopNShX2eUP35gKLFv1U1pMm+Btno27UGiNiQFGqFFcKlBTZpz80z1JpLKrECHvSrhdJ+1JWRrauCLt9g3HX+CJ+NDac3eMce0VqgceTlMvLl2SIQoyZfUprp/6LzwsM83EirKgD4CxbStuCzdgSqxodtkhbIM4GSIuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BO6CE7jJalbeGAgdrTFV8nvHA8V1OULfNTQToPec3E=;
 b=S5LuMvMCuJfbgSvqkGpDC+Lwgj6PsjgIYNQu/pXCQHajiLBZ50NJxWeKSjBD+GXMGDlez/23z62m4PtpP2xYexb8DuoAf2YPobgg996VsPuVBQu65mIMc5jKxllfnncH9d3ZmWtBozSIx+BNIGmg7mcUK/FTjB6w9oADuz2ZS0B47KlmPwjLboWnXzhDUIcuBDww0WSKNMhJtWrkMwzMavM7KOMjfg+18K1hXAQypn/gEXq0Wn2odxdf5HHqHJfqZNw3OIsI+o9CFsydpe/QUD+jjN4EliYeoQI0J7RDul4n7WlvQy55r2QXnTiAysmKlDl/OpcR0YHMBRwcPuo+wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BO6CE7jJalbeGAgdrTFV8nvHA8V1OULfNTQToPec3E=;
 b=EKEeJGDCLw/bKdYVsMEC+fdc7TRTeMJQHPi+ARQmKebVLFYZl5H33/LuELJ/LGEN83uCgd6JbOSH3WsJBqOIWOrkOgqngUq9xjqkUlbrIWxcOgTwYjufx+bPRUXAob3yD+qtMtq2I/1lVfqLjjVIPzFP0byk9WCosRbkoBU3VmJNOskrvDeauN7CvyXewfNc+07LSzxpy71g/9jy6XJarAi1BV3QHuz2e7FCbUzhqQzXYUjIQJpCFmnC1Tht2vdZwXQK26IQgABjFBBoFNVwsvJZVI3KgrApEWx3YYUuPhWEEoDzG/hABw197MA+YBlRFkHjZU5aWp0DM7VbOXnGkA==
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
Subject: [XEN PATCH v2 06/25] arm: new VGIC: Add GICv3 IDREGS register handler
Thread-Topic: [XEN PATCH v2 06/25] arm: new VGIC: Add GICv3 IDREGS register
 handler
Thread-Index: AQHaE9VLeDi6QUYO20y4T5ZlvdbpBQ==
Date: Fri, 10 Nov 2023 12:56:18 +0000
Message-ID: 
 <7c563e5745c14123c8124e765bfff1345ad73c6b.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: aaf61761-28bb-4a91-73dc-08dbe1ec6e57
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qpCXGix4xYfv4cNyjkYxJDMiDudvZ8CH659vynCNVf0+0H2NcPJMDIwAMtXuAF5M9ilfTKfqJNtnnjKvHjav64kExvQDaMn2M6T2DVyR6EqCCCCmbf9g0eAz+AfBFOExdLLes/nbqbdQPfHZBA3PUvQ5Yyj1nu7ocm9uhtynlerQcK/zCISaWvByuv8qli4FoxRJ4U6O/M1IiKOPd4xexYbA4z/72s/aO8MZipxqbxVixYT6zUfonJyVbcPoSMdDD1pwHLtQ1W+qCgW2P2GVpSH4KEU0DxWTelaWTVOu+qq5/Zx1TVadfuI4GPo6tEUOvti3YugxnmWz3Qvzye8ocqYuH2xwOvweTVcvmoJR8jPA7wR+dgN9KriR9WPJFHWKlHDgHon8Gq+9GWpVrf53zyOZ2ColgouxsnSbeUNSln/FifhKF1dBa8sX/bZkbFqpbFTV6h5Rhzbc7WNzH1K62O3VNSL9Z+KOEGlGiTKDZsONcOzpfmy5WydxzKCh/1tc0WRmEqmkGVWVZYgX3gqPqCFk6V0blBmHlKiFjInZq+sRtMaQlHmyLbPcQBv8DjUc0999n1k3if4tNKFi4b1kXage10vfPMsW/Qf0rFtgBoo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?QLW/D/QU0LQlBdIFj1yTIS+ji1mQR1NBnq/GywTh4LPncYs5wSSPoUYX/Z?=
 =?iso-8859-1?Q?RW5r4zd0gvFcgbMq+YnTHaU7g+8D3xCsK5RpjiBOh0VceJWidj40QNsJsg?=
 =?iso-8859-1?Q?ExZa24LRPtEAmMV7BvaCPnm7EvHReZFjv0ThaU2H0nYsk4Oyz3nD8/R19b?=
 =?iso-8859-1?Q?7JkMgQ2rD4CmFWIKwI5eM2qu33+edok3fuRXX4hbWGgdVgVKTQJZDu4wgB?=
 =?iso-8859-1?Q?MKIx6lvIJNesZFKM55Fbi1QeDfwXU2vte0jQ6mh/ROy6heHalFHQCqvtQC?=
 =?iso-8859-1?Q?NAxbKUi2RxPxMMIfxDTkKVkGFw4FHatGl1hzEtrA5UiojQAjm3CURUBayg?=
 =?iso-8859-1?Q?p4Y0SsYa9NfF8IN2XI43laegtL3CVGWDP2b8Dx9jd201U9Vb7SaCS5b7Jg?=
 =?iso-8859-1?Q?pkuZD6V+BQgXJMMBEUPXXr63cJFhI4xYaNTXyFkMwkTQ2PqqM8V9jGC07K?=
 =?iso-8859-1?Q?dI5OY8pUUvzfJTSL4YbmFVpCdDgmjdV7O8GyOl133xKT24UVKmVTDdHoqw?=
 =?iso-8859-1?Q?1Eb0bkwZzi4WB3RPN/dux8uBYxWnEMCE41MqoZ2+BcWz7gpBwzUNnKJ7QO?=
 =?iso-8859-1?Q?BaJuCx/UwkZcDm+iWPcVXMT3bOLdr5TTuj6+ApngVBVHaCSk6+6nr+Rkg0?=
 =?iso-8859-1?Q?q4/6pauudYBg6IYt84k7hMGto4lYycl02JmLqjsI7Pq1ZgAhHOZQQHGYPJ?=
 =?iso-8859-1?Q?fzX/BYMpkaKzz6M7o8VD3n0ZrC6CJRkyzoyie5hvDXwug9LWk7d4V8gHbv?=
 =?iso-8859-1?Q?xZsw+WrcnpPA2jF8Do4sCGXanvbSoeuhwUN986oufhGeZNlJJHnvzTnzyp?=
 =?iso-8859-1?Q?vLh88bOyf+BwKpFNLDGFN5Vy8ujBzln8tjmebxJb5vqJ0JyvfSPFfv8oRs?=
 =?iso-8859-1?Q?7u8P7DuEht1GTSjYKhmMHiTD1OF67s1oaQmViocwCS1KjWtM1ydZvb8fmU?=
 =?iso-8859-1?Q?CncNN6cnPOHjU9euVnRa0K7DbLxTngHBAGFtRoAhq7YbyMta7G8MMViQDZ?=
 =?iso-8859-1?Q?CznPKcd7B8yxaYLH6mGj1lcF4GKthYUtMAdIaLX2xRxuyp27C+zAb4lwdg?=
 =?iso-8859-1?Q?95H0ypMir2nYcUYlwbiBmRxKejikSCmGcGJmeys5uKmXXX/qVhlyOHddju?=
 =?iso-8859-1?Q?7kqvKM+ja4t9HrFg76KgtbqVqizGxPSX0boa0wZHLGatb4deQQKVwsOhA4?=
 =?iso-8859-1?Q?g7WgVdj6GjCaxtqu7N5/4KNFFvE2AXKz0UwbrsTGY+qCGXm6s0ZWfQ9wP7?=
 =?iso-8859-1?Q?cgGvHKnfGnLhyrfc+JtbssAr97drc0zWvLm03nJhXFtCrVBVSYPpOspy3Y?=
 =?iso-8859-1?Q?jS7v1iVZrS7SiNWugDxomtS6yQ2NI4XFdhURNA5cdEu8lLlDqVQDpbzWWo?=
 =?iso-8859-1?Q?Wd4tllIM+h8YhZRUneJlWC0LnuWfgvsgfzNEBxkgW8mCOSjkstKbykNXgU?=
 =?iso-8859-1?Q?EWDamH/lnGB9kedblTDX3ONfLXO3NHrjGRoChJ47De1fuFsWwJg8u2sHBs?=
 =?iso-8859-1?Q?kqc7WUAXblFlCyqGmRdC/9zIeK5zP4Dex2/6y8OHi+dViQVNJu7T9jLYIi?=
 =?iso-8859-1?Q?wSc+w589A+12xFHD7+WucujGQQ434+yP8uuGO85xRIka0Gl1TtyUnfFWKU?=
 =?iso-8859-1?Q?3T2HhC5H1nAZwwhcUW6AHRvXMq8xynFj+0rfsVeja0KebI2HjSIbw1wQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf61761-28bb-4a91-73dc-08dbe1ec6e57
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:18.0617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ajst6DjVWkcKMj/7LgAyeF3Opcd0rawNRTa+1Y7ThkfTOxaZMtiUkNO2Di9zSX7UJp967XcK76iwk+Mmncz3Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-ORIG-GUID: ziJpkV0cqFYKprtbIa06v7z8F_fOUAqd
X-Proofpoint-GUID: ziJpkV0cqFYKprtbIa06v7z8F_fOUAqd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=906
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

We implement the only one ID register that is required by the
architecture, also this is the one that Linux actually checks.

Based on Linux commit 54f59d2b3a0a3d by Andre Przywara

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/vgic/vgic-mmio-v3.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vgic/vgic-mmio-v3.c b/xen/arch/arm/vgic/vgic-mmio=
-v3.c
index 707a38c727..ccdf3b9456 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v3.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v3.c
@@ -152,6 +152,19 @@ static unsigned long vgic_mmio_read_v3r_iidr(struct vc=
pu *vcpu, paddr_t addr,
            (IMPLEMENTER_ARM << 0);
 }
=20
+static unsigned long vgic_mmio_read_v3_idregs(struct vcpu *vcpu, paddr_t a=
ddr,
+                                              unsigned int len)
+{
+    switch ( addr & 0xfff )
+    {
+    case GICD_ICPIDR2:
+        /* report a GICv3 compliant implementation */
+        return 0x3b;
+    }
+
+    return 0;
+}
+
 static const struct vgic_register_region vgic_v3_dist_registers[] =3D {
     REGISTER_DESC_WITH_LENGTH(GICD_CTLR,
         vgic_mmio_read_v3_misc, vgic_mmio_write_v3_misc,
@@ -196,7 +209,7 @@ static const struct vgic_register_region vgic_v3_dist_r=
egisters[] =3D {
         vgic_mmio_read_raz, vgic_mmio_write_wi, 64,
         VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICD_IDREGS,
-        vgic_mmio_read_raz, vgic_mmio_write_wi, 48,
+        vgic_mmio_read_v3_idregs, vgic_mmio_write_wi, 48,
         VGIC_ACCESS_32bit),
 };
=20
@@ -233,7 +246,7 @@ static const struct vgic_register_region vgic_v3_rd_reg=
isters[] =3D {
         vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
         VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICR_IDREGS,
-        vgic_mmio_read_raz, vgic_mmio_write_wi, 48,
+        vgic_mmio_read_v3_idregs, vgic_mmio_write_wi, 48,
         VGIC_ACCESS_32bit),
     /* SGI_base registers */
     REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_IGROUPR0,
--=20
2.34.1

