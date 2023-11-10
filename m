Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A60E7E7C4D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630299.983051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3x-0002cx-BH; Fri, 10 Nov 2023 12:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630299.983051; Fri, 10 Nov 2023 12:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3x-0002Se-6F; Fri, 10 Nov 2023 12:56:41 +0000
Received: by outflank-mailman (input) for mailman id 630299;
 Fri, 10 Nov 2023 12:56:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3v-0001y0-5t
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:39 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93eee4b2-7fc8-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:56:35 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIuvd025691; Fri, 10 Nov 2023 12:56:28 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9j2g0qjw-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:27 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:21 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:21 +0000
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
X-Inumbo-ID: 93eee4b2-7fc8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RA2RnrvW+EUyLfp/seqNTbfZQD+HllClxQpdD5raPdsNB7R5KOjyfjEJl4l2Te+y2ua2hAs7sAUlZu1AgV2AJS+cOrdFfbNmHAWVNiCe75JlSiUL/JaVK8OMKLlUSZmxQQLXc063qOheCbYOl/+g5QfJM/LVbNGtX4gsfIN1lOIxjgaWJaQBrPKJBzuec2SE09gQTk7IMTLMbGNsvFSgpPFO9dmemrmS0dq9NShF/SOtM9QKAMSQEEcQf+1k4EyBq+1uYirytajDJefK6YC74T6i+xXe2D5iaoUqk0rwe+QWSoNk8Ofodru1En6nSmNAlv7MgLkoxGWYbDOTgQCfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfknAyVbOV3k83G7QQT0Ng9GKon0GixOx1/IoSh2cog=;
 b=A2zPt+dCn0CfV12FoUsMbCTm1zpPCA1Ro9TzeKn7zWPfhGlXbKaLSYsXc0LhpRVDuxMFd/rwHbRKieJHX+BaIdebMcb046L4QKKA35phXnXD0LYm+ZQw7Df4p1EYEsD5Sywp1dSoM6Dr4Ze/ypYnI1HWPtEaI6w936tgij0b6KKHz1bAT2dnKZhRlen/v9Ub+lrDbTWUo4rbgaazkw32v12pG5yHbLZF+Pj/GR/TH3pcOIxDjAvyZ3PD6tBwxTMf/aRr0keJv+qdivX9wsNwbQ0SYQH0SkDhf0UU9YG+l6nkIzCWS1HalJ4iZXDiRFRvc0Pk8EpQuq8vK57lWU2nJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfknAyVbOV3k83G7QQT0Ng9GKon0GixOx1/IoSh2cog=;
 b=gsKMP8leoDMVzcuJ0whbz37FOkyL82LDh67dN9S1yv5emLdq24yI07tsgpg9uh2rC0snpba5VOnc2kDPfHhPqP2ql+Oojc4iFZYOrBIEquV5uRtki1zdGkvytTTvu3MkCG/IZTbwntnnm7OVxVj8Ir9m7XfVhqXSRgYnEjavdcWaTF8FEktlg+dQqMDrvojoE5d51Eib2Fdj8RsE7e9riWcyLvdOneiOEpsJQnafmiFztcqZqIInQKP/2zxsWwkQrwphFa36vGxt2lgKPhncj9aWUKh7vrVJcpn+NP9F32aGuGzBvVARw44Lc+xIT4Ze2pInx9UVeM0tXb3lyOWMIA==
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
Subject: [XEN PATCH v2 11/25] arm: new VGIC: Add alternative redist region
 storage
Thread-Topic: [XEN PATCH v2 11/25] arm: new VGIC: Add alternative redist
 region storage
Thread-Index: AQHaE9VMKrSrAG80rkWu3ywErkCXJw==
Date: Fri, 10 Nov 2023 12:56:19 +0000
Message-ID: 
 <c34ecad9ad13f97d0d4680a2f0c51fa2a7b4871a.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: d5e38e5b-f027-4703-6035-08dbe1ec7028
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 njVjzRlEbJNg513Y949S68kLcaBYQghHaVDo/pIj5L1uTkkJ+H66b3gjMORkzU/dCaVHuvKmitIvzzH3bSZNuhVuwvGcFHHJlqu1du9noUjIo/ApeiGNeicNxG86/Pv16IK/+ZGEIaxk2wfpwWBYZYu3WgIP0v7kpwIqyUlwt/t3/sNDZmgPz6ha4yXlrpTw/LcDaWPXIhrKNokACMhQaGSx2z0ASBWb0dChGdgYjMZlOk9F/8niRxHJ4RKr+Qsn4yl2kNX8CsxMrbOuHPX2KKt/986fTTgFboN5U3XEGrbfHDu5KvXHn1ShMMh2gVx3oDG2CZV6b9FkfWgZJQp2v6tUaAqS4PN+1QvPVu+yMO+ihjYg/aUJVQ4f56bC1WDXR3DWcN4uwlzlDfxRspM+0qB8ceuSTF78zD9d3tHRo+OEJK3yl7UK/OLXyMnGPYQRbu/UND7rm0Cq4cZZSdXTMfiH7DPi28jRNcvWOq4m0z32cNBfMjA10ORwFZ6+Tl7y8UeOy+UgvdDssyPT9clqQay7wjcv0WcD0nj7BSDR87xsX75kf447sw/nZhiUes+NAR5+kdQthmXgavw3pCIytTuUpyUZGTu/zexVoqvu+1HZGLX3gMxYN9mt8cvt8uQG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Xqx1cVDnzGqacjSCtsYEGgZKJBzvO2wYKF3erN3mXoS7A2BVJBL1mxnKJc?=
 =?iso-8859-1?Q?Ly304WSN7rtHXdMKe08Nosm4nAcXnbr2uA4e8AVNx9Kl/LKl2cgpBwlnGP?=
 =?iso-8859-1?Q?VfBdvcj5aYvvbX1hjaOfhhzUqs/1N6hTWlwUoJnM7RWq/hndYfrsRkwI2j?=
 =?iso-8859-1?Q?SV72P3b9+N2txHsa4llfCWZiABZZVRm+bAXeM7bnZFw6pT3aPTxdXfy5Xk?=
 =?iso-8859-1?Q?RxpScGOGnoz5fZDfkioMJ/xG5HgvkMOjRU3H0CFkZVWokva9hqaxJMhYyh?=
 =?iso-8859-1?Q?dE9G4k34T7pXafhhbonwpQtdi6g+VasKM0esoQHWFoQglpFCeu+xxNWBPZ?=
 =?iso-8859-1?Q?qgbGy8CuDsct/4v+6eymKL30VNKFE42rjKV2ri9JL0LNPlYO0FX/WL1GIR?=
 =?iso-8859-1?Q?ZfaRLica4VtPsTbUBxEPzBn9s/NTJOZ3cD+koiuCG6m8RBkjOBxx1991A/?=
 =?iso-8859-1?Q?DTAdd2NgyK6qcf+CkIq89dJVLd8C/q+LOb83BXRVrLQsf97ZG6GRyHCGXu?=
 =?iso-8859-1?Q?9ivbjkZw2BGennoqseq+Q7XymFuJsqQbfM1t3gfZ2thMO+XT7FQR4MYT2P?=
 =?iso-8859-1?Q?JxHsWUWsVH70zjBll1fMa/GTkC7Obvj0LcxlXjfwVyWH1iaDDpSH8RdJGd?=
 =?iso-8859-1?Q?5OLjpRgqlzTyXRoUFWbO3q8u5h0CTrgvaqxSqDPXV1ibntk/kDnoWasg44?=
 =?iso-8859-1?Q?ANN44wdrMmf+I1C2EDzT2sPoKFDD4ZHYZdLRJtqU9BB6I6zJnwXBV5MgNP?=
 =?iso-8859-1?Q?ATZ7Xieh+7o5SqO0+c5jzKsfeBE1u7FFh726PXIAg+iEfdQ6bmVaGmz5Gb?=
 =?iso-8859-1?Q?GwI+zA+Idq2gUgfw9C+6XNiLJuSYlqlvFUoaHDOH8342LJnxFGseXMkFxT?=
 =?iso-8859-1?Q?whomadt9zC/3acX8+EZu84ninIcwBgfNN08bmzIOxUQrb3UxIhYjGES+DR?=
 =?iso-8859-1?Q?ukRXzvwMe39H9fWQWzcPERrePlsRdnzC3z/nKGdNmw3A4/M3nLJVtYpfm/?=
 =?iso-8859-1?Q?dXvYxN8EzzAfGDAENef4op5yJEXJ86IlaiiqkrmpFGHlj/OFUU03QpYv3N?=
 =?iso-8859-1?Q?Ju7g5OgHah0yCw9QFcPVuQraILwzy+iRz6mBCsUk2imDnIoLWl7bhurSEq?=
 =?iso-8859-1?Q?BbHlzM65EH7h3nCrQ46i++8Mu2Ln2+mLTz0DpjaOU+yUY0z9AlN/WJyM7Q?=
 =?iso-8859-1?Q?STqWViQDkyMuHD2EtZiO0rfXpKM3seS4/lfnSqNdfm27OMLbNE9M2MP4W/?=
 =?iso-8859-1?Q?++0oWKUvLheIcyP3U5VythO8sAjnEdBN3Jxg6c2d5aU71YWIcTdvr88Yq7?=
 =?iso-8859-1?Q?uxry8Ccc0UHMr+UAwqX/jmcUGfnoakc/P3uuzUoe1Qj3mZFDL+gfvfEEig?=
 =?iso-8859-1?Q?zLPAkYRsoPBqLQf5JzUvtuDwU6RURutCs4zthA0AyiTAffNcCizvKO926m?=
 =?iso-8859-1?Q?5KC+NEiMBCE1FCZZOsT6SwjSQux39NGfWxgwEZxH/JYiNlvOgWSj5YzAIT?=
 =?iso-8859-1?Q?Iu3Cty+8L0zEdmDs3Z7iIi+1Ja2JL/qGIzi3VIEN2lsSfIIY/9xg54WGlo?=
 =?iso-8859-1?Q?55yT52QhlHDSBc58LIGGNDdIJ6bQiIm7sTM3oKwPVoLMPpXz7s+fJTC74e?=
 =?iso-8859-1?Q?eSWitiUBARNhIp+gVBuqZY/B7kPDRcslLnVagAIxYcaS72ygB2OdOLBA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e38e5b-f027-4703-6035-08dbe1ec7028
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:19.6495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d7oGc3Sh2VU/tPQ5AMz8IEOAVDUJJhrU5+jEn6N0iRPKyASmyBd85gVSOHa2hmnZaitqv9LojiQnrGALX8Oe4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-ORIG-GUID: 6scE0qSUuU3Iv047aeFKDrMXG_n1zH0s
X-Proofpoint-GUID: 6scE0qSUuU3Iv047aeFKDrMXG_n1zH0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=656
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Guests DT creation requires redist regions to be stored in the specific
variables in struct vgic_dist. But in new VGIC a linked list is used for
that. To not clutter the DT creation code with ifdefs, add alternative
storage for redist regions in struct vgic_dist.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/new_vgic.h | 5 +++++
 xen/arch/arm/vgic/vgic-v3.c         | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm=
/new_vgic.h
index 11d8f71851..9eafab45ff 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -21,6 +21,7 @@
 #include <xen/list.h>
 #include <xen/mm.h>
 #include <xen/spinlock.h>
+#include <asm/gic_v3_defs.h>
=20
 #define VGIC_V3_MAX_CPUS        255
 #define VGIC_V2_MAX_CPUS        8
@@ -136,6 +137,10 @@ struct vgic_dist {
     paddr_t             csize; /* CPU interface size */
     paddr_t             vbase; /* virtual CPU interface base address */
=20
+    /* for compatibility with guests DT creation*/
+    uint32_t nr_regions;
+    struct rdist_region *rdist_regions;
+
     /* distributor enabled */
     bool                enabled;
=20
diff --git a/xen/arch/arm/vgic/vgic-v3.c b/xen/arch/arm/vgic/vgic-v3.c
index 682d57b476..8b700609f0 100644
--- a/xen/arch/arm/vgic/vgic-v3.c
+++ b/xen/arch/arm/vgic/vgic-v3.c
@@ -257,6 +257,10 @@ int vgic_v3_map_resources(struct domain *d)
     /* Allocate memory for Re-distributor regions */
     rdist_count =3D vgic_v3_max_rdist_count(d);
=20
+    /*For compatibility with hwdom dt node creation*/
+    d->arch.vgic.nr_regions =3D rdist_count;
+    d->arch.vgic.rdist_regions =3D xzalloc_array(struct rdist_region, rdis=
t_count);
+
     /*
      * For domain using the host memory layout, it gets the hardware
      * address.
@@ -268,6 +272,8 @@ int vgic_v3_map_resources(struct domain *d)
=20
         for ( i =3D 0; i < vgic_v3_hw_data.nr_rdist_regions; i++ )
         {
+            d->arch.vgic.rdist_regions[i].base =3D vgic_v3_hw_data.regions=
[i].base;
+            d->arch.vgic.rdist_regions[i].size =3D vgic_v3_hw_data.regions=
[i].size;
             vgic_v3_set_redist_base(d, i, vgic_v3_hw_data.regions[i].base,
                                     vgic_v3_hw_data.regions[i].size /
                                         GICV3_GICR_SIZE);
@@ -276,6 +282,8 @@ int vgic_v3_map_resources(struct domain *d)
     else
     {
         d->arch.vgic.dbase =3D GUEST_GICV3_GICD_BASE;
+        d->arch.vgic.rdist_regions[0].base =3D GUEST_GICV3_GICR0_BASE;
+        d->arch.vgic.rdist_regions[0].size =3D GUEST_GICV3_GICR0_SIZE;
=20
         /* A single Re-distributor region is mapped for the guest. */
         BUILD_BUG_ON(GUEST_GICV3_RDIST_REGIONS !=3D 1);
--=20
2.34.1

