Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA5C7E7C54
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630302.983084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R40-0003V3-90; Fri, 10 Nov 2023 12:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630302.983084; Fri, 10 Nov 2023 12:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3z-0003IE-Q3; Fri, 10 Nov 2023 12:56:43 +0000
Received: by outflank-mailman (input) for mailman id 630302;
 Fri, 10 Nov 2023 12:56:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3w-0001y1-Bj
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:40 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94bb3bf0-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:37 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIuvc025691; Fri, 10 Nov 2023 12:56:27 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9j2g0qjw-6
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
X-Inumbo-ID: 94bb3bf0-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5bVoaHtf9hbfKEfPq+WKJEeFvOK9PVEaZ731Bk8Q92uFWHuIezEtaPZc2JXmBaEt18pWYEkQo344KBoKRHNGDSSYklg3BOKCOe4iA3sqKLyXA5X77ycK43qFKUwkvctIoTvUbZVWF49nXpdrYvjM96xo9Rc2J+4PN3JsaTtGQi2iZINqPp1D885T/zPLdjDQU9QKC/peyQhq8cmtxX01wxbSSMmJlThXT06P4YDpU4AoKDS1vR03qnjrBdAXlXRJ/0ObMaZISjrbjaVJnp6q+R05oEDjWkNey6fveQAwGXH+DXGRRwYt7shoZTJYbE9HyGTbmMvN3Y1wXrJ7bk9hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBDVOyba/BI30WH6KKbB8Uk/B+zX3ZAsejH38vpaBkc=;
 b=ZoaDWZ9GamKaLk2O5bkA8irxeorDFJcIVW13Uhi9gqFd5Od7pvWSZTQqpR+JBzu+apIQmHN9nuSjtuB/lodUfb6BxVVIKbeU7JB+IqXcRL775gI48zExEmhCTPypab+y3CtnHC4DwpIHJdj7FaUuChUcIiNJj8AKrErxuK7uUMAKoxKslSAHGQm76j2GTlST/4bUTSFjED1KF8BERahDqmYbGYcFyMHJKt3vyijWLtF0gbMvTN2XSDdHnpSi5vokOaz53F4p74ErulR9tCojAnfQX9u+901E8piqBIZE/UKJdXdHYso/mHO8EBfNSYRoZwP4OfU8vVst19Me5MX3FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBDVOyba/BI30WH6KKbB8Uk/B+zX3ZAsejH38vpaBkc=;
 b=qxkN6sMV1jhWw7E2lLql/Ynf8bmJ/jUjlImF/IaWOF1rNESiKqiY1G/fIPITWLm1wgwnl1G0bqdVFRRp18oLmYK73CFS4JcvklGDOISftUiZj7Y3RC3graXOg/dL9xmB5lUXmf7pMb5m0sFef1gNLRFzuGgCVHn2bLT8pkRNqb6aCyjXGWV8jJDTHavqQBIVuBnSl0pj8onVI5cR7/B5izrt+rqoGv0XOmgSTbD6bJVVqyfuZKyNmtnXZWkgGPeM3LUoijBbKxxveNYlkcrtCXbspBAgT01Q4C7g5W3FnMBLZTR1JzELfgAtOBW9EjswuIiCg5qh3c7w6yYgtBkOxA==
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
Subject: [XEN PATCH v2 09/25] arm: new VGIC: vgic_init: implement
 map_resources
Thread-Topic: [XEN PATCH v2 09/25] arm: new VGIC: vgic_init: implement
 map_resources
Thread-Index: AQHaE9VMePQXqYRQtUG5KTRNHOZuvw==
Date: Fri, 10 Nov 2023 12:56:19 +0000
Message-ID: 
 <c89e43a412d1805dc988d1b8145695f85da3e112.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: 2c58c5b2-7f8c-48cc-7889-08dbe1ec6fbf
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PkzxPl5B/QmsrBEsUDDqpZkFYvOvdWfIS8Xrfo9nD/dZMUO3UjNImN5SiGZlhpUyittFr0ZlwnU/GtqqrY9bUn/ntU9Ix6/3ZwQWlhPR5p9lXpEy/yTgf6ESdjW7KrFcFWZBKiUUmPH5XsaBTausPgDyqyV1WGZkRrM9jEtEftNgZH60uUsHw8YRFV1k2J/3rDN0RGdSLQiBQdDNnAAkmjxg8v4icaS2cGmJPAyi9LA+gXMX5gwArGYto/2d81nRPHtxytq6ZAPuVdAlPSok9mCybDt6v8a183J6rJJX3snHlNoFvS7zDFmgwq7/QWLI78URg6kaZa8B/rnlr3RfNL5tbqfmcNGui/ysnG4rWFQS+6lg1ViSbdvHbItUH3Lq8k1VIYOTVQo5gWfUx9fT9+AQK8rGRSryLnLp5/GkxiLaXJk5woy9UbnlaMTnepPjNjof7tpPZu/Cxx/ha13eAbIBU2PfQ68I8WUCJgsfF50L8lD5fBbGi2WqcEkhmJ87KdS0W5ttbs3g86NEoLaGQLbOkVBVsa7pyTimztHG0GfLm/x/q0Av9JFacOZybX8pNnK+Wiok84rrQfgumSraP6yYPe/Q9ipITU/QYL5reLg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?fJyGsfRLBczsfPEqRRa01ztgP+UAGIMwOTGEQf7Pv33x6Trhfg62bMDB9t?=
 =?iso-8859-1?Q?K6a14T4ohBzRngFwqc+TFOzW1zBcPwBsQQ+dfRYM9KE/dx1v6iMz6R0WXQ?=
 =?iso-8859-1?Q?9rCzp7Fbv8Mvxl66zTVrwmturERReYr/gWNc73Xz1vJ1Z7l6rQOxnfdziE?=
 =?iso-8859-1?Q?mSie03C3Gyth78IdhVWtF+3lQq2mO96kCLtOzMA9ZQX6VMIujhPt0nfGVf?=
 =?iso-8859-1?Q?kdBPnoGB0udy80aJxQwDOsCtulYxaafAtJvbZUP0Tbp6f1m0M4wms3eYGj?=
 =?iso-8859-1?Q?WtUJv1mLfQcxazNcGg4+m6RwigG82kh58cudJBgDDJLP4vt6vhMQDDcmnO?=
 =?iso-8859-1?Q?QUMMeCGCNhQTkyZvnmnnAhl9iObXcWgdGcEudQ3mCbPAGzRIj8pwPWEAPd?=
 =?iso-8859-1?Q?VRoU9cdvFmphhRlJKl4SbKkzLycGTEknoiSfdXv8cwMAiCWqs1iOC3WqrW?=
 =?iso-8859-1?Q?m/TAXS1PW8tP8u8+QQctSbc0nvAMAN71YMCvQq3m2wM8lDwgEvmffvwgrB?=
 =?iso-8859-1?Q?ecxnpuIGOkxzYfEXORjiayrZwHXEmykiANu2PQKxPqszYKzzECESEZi6/o?=
 =?iso-8859-1?Q?YaTGTJMT3+AeNzes+ZB/Nxn49fkj3JFuJCd77PGq5Epw3jagGxWIxVHyCR?=
 =?iso-8859-1?Q?ak3ZkLNmGKwqHoEoqeurzBAlV+AdbTYP+ZVGD3QjRF8bKvr2QOPMmuqcbd?=
 =?iso-8859-1?Q?ZvuSjQO8gAjDF4fbh1aZF4Aa3sfQA7vj6qQV6mAAaXSKdfu25+mgqJ5mxA?=
 =?iso-8859-1?Q?g/DccID8MmJhdAbNJMOzNdvVLNrw6nXPf5+7ipLF4p6cF5bnJVk9uN5+rY?=
 =?iso-8859-1?Q?YTSFJpF9EDLQGGz/3XA7q969yeiJfHHOoYWW0K7V84bnnQXbvZUKRUR0Ao?=
 =?iso-8859-1?Q?fSF9xmeOPc2XsnqPC5ghPrvfhhEm6xUtDLPNtpzZ5vp7y22FY3Ra/ixni1?=
 =?iso-8859-1?Q?EgTkAnxtokrjPVoA4T2+IrQx1/opJUC4YVGWvBrIJ5nrGN8iMFpTH4ZLGO?=
 =?iso-8859-1?Q?x2Mif8ZJ5sk8WuSdcFsm8YELAqHrTTbqpfI/kMcNzZ+753rFsXKt2sGgHp?=
 =?iso-8859-1?Q?TLfnUlkjC5Bdw32F8hP4UHrqLfGlQpKi6ZLbTiGz9R6ZfRK9jx+SR78t1D?=
 =?iso-8859-1?Q?GYmxW+QAiZ1L9g9PDxGMhsMzz9cy0Tip5jYzxgIIsOAONhCOAPwc4424BQ?=
 =?iso-8859-1?Q?egvYi9ZPAcdXu9+3u4m/PqrbSmN0QnFq2Gr8BqPtbGJnFVx8JlDaJgiMLn?=
 =?iso-8859-1?Q?WPpGREuvDEEKZ8dJtDG29Er8rcBLWrdZ+rPEIkm45wBNyzYtKlZsZB9F3W?=
 =?iso-8859-1?Q?p3v4hjs2LLTuA2HrvWVH+3Z/QzIch5LJgfjOMQ1E+DptxlmUghjS688SYO?=
 =?iso-8859-1?Q?J3Eh9PLRw65bmPZbJ14RWF6S4CWB9G6NGsuNR5EW2RGHp3TjxD3QZpICsj?=
 =?iso-8859-1?Q?AHCgioaN3Z4mDCxkegLjDxKb9MSPn6OL87l7h0BMnqP+hGc/9gI2+noutE?=
 =?iso-8859-1?Q?78IwCWYrbjopCFpOKdZKJE+CV87/hrpraz+Q28fuQrSbG8sO4tDPEaMXxu?=
 =?iso-8859-1?Q?l9+kbl+t/x3wq7obLgB4NtlLSt7gsqBLWH20q+QtDSamT+tOdYSjQOQSiU?=
 =?iso-8859-1?Q?2ZbCaOizXW+NCbaZ+SzKnFeqeXrHSfq3BmorP6a/z8bkcvSQ4nd3vpWQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c58c5b2-7f8c-48cc-7889-08dbe1ec6fbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:19.0708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qHB946+1kfUjcY0U/ZYmcQXwJYpYASYLrVJoA30wclSDYG5DwNY/EPpQ0zLxbgMW4rHHJSmrRKXC8A6aequnIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-ORIG-GUID: GE0xtHXiOjiNtZbiYNHVHIKMpUx1L2Id
X-Proofpoint-GUID: GE0xtHXiOjiNtZbiYNHVHIKMpUx1L2Id
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=714
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

map_resources is the last initialization step needed before the first
VCPU is run. At that stage the code stores the MMIO base addresses used.
Also it registers the respective register frames with the MMIO framework.

This is based on Linux commit b0442ee227e826af by Eric Auger

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/vgic/vgic-init.c |  2 +-
 xen/arch/arm/vgic/vgic-v3.c   | 85 +++++++++++++++++++++++++++++++++++
 xen/arch/arm/vgic/vgic.c      | 13 +-----
 xen/arch/arm/vgic/vgic.h      |  5 +++
 4 files changed, 93 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index c3b34be192..ca13cf385c 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -178,7 +178,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_=
spis)
     if ( dist->version =3D=3D GIC_V2 )
         ret =3D vgic_v2_map_resources(d);
     else
-        ret =3D -ENXIO;
+        ret =3D vgic_v3_map_resources(d);
=20
     if ( ret )
         return ret;
diff --git a/xen/arch/arm/vgic/vgic-v3.c b/xen/arch/arm/vgic/vgic-v3.c
index b018ee6040..470bb63147 100644
--- a/xen/arch/arm/vgic/vgic-v3.c
+++ b/xen/arch/arm/vgic/vgic-v3.c
@@ -14,11 +14,33 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 #include <asm/new_vgic.h>
+#include <asm/gic_v3_defs.h>
 #include <asm/gic.h>
 #include <xen/sched.h>
=20
 #include "vgic.h"
=20
+static struct {
+    bool enabled;
+    /* Distributor interface address */
+    paddr_t dbase;
+    /* Re-distributor regions */
+    unsigned int nr_rdist_regions;
+    const struct rdist_region *regions;
+    unsigned int intid_bits; /* Number of interrupt ID bits */
+} vgic_v3_hw_data;
+
+void vgic_v3_setup_hw(paddr_t dbase, unsigned int nr_rdist_regions,
+                      const struct rdist_region *regions,
+                      unsigned int intid_bits)
+{
+    vgic_v3_hw_data.enabled          =3D true;
+    vgic_v3_hw_data.dbase            =3D dbase;
+    vgic_v3_hw_data.nr_rdist_regions =3D nr_rdist_regions;
+    vgic_v3_hw_data.regions          =3D regions;
+    vgic_v3_hw_data.intid_bits       =3D intid_bits;
+}
+
 /*
  * transfer the content of the LRs back into the corresponding ap_list:
  * - active bit is transferred as is
@@ -204,3 +226,66 @@ void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgi=
c_irq *irq, int lr)
=20
     gic_hw_ops->write_lr(lr, &lr_val);
 }
+
+unsigned int vgic_v3_max_rdist_count(const struct domain *d)
+{
+    /*
+     * Normally there is only one GICv3 redistributor region.
+     * The GICv3 DT binding provisions for multiple regions, since there a=
re
+     * platforms out there which need those (multi-socket systems).
+     * For domain using the host memory layout, we have to live with the M=
MIO
+     * layout the hardware provides, so we have to copy the multiple regio=
ns
+     * - as the first region may not provide enough space to hold all
+     * redistributors we need.
+     * All the other domains will get a constructed memory map, so we can =
go
+     * with the architected single redistributor region.
+     */
+    return domain_use_host_layout(d) ? vgic_v3_hw_data.nr_rdist_regions
+                                     : GUEST_GICV3_RDIST_REGIONS;
+}
+
+int vgic_v3_map_resources(struct domain *d)
+{
+    int rdist_count, i, ret;
+
+    /* Allocate memory for Re-distributor regions */
+    rdist_count =3D vgic_v3_max_rdist_count(d);
+
+    /*
+     * For domain using the host memory layout, it gets the hardware
+     * address.
+     * Other domains get the virtual platform layout.
+     */
+    if ( domain_use_host_layout(d) )
+    {
+        d->arch.vgic.dbase =3D vgic_v3_hw_data.dbase;
+
+        for ( i =3D 0; i < vgic_v3_hw_data.nr_rdist_regions; i++ )
+        {
+            vgic_v3_set_redist_base(d, i, vgic_v3_hw_data.regions[i].base,
+                                    vgic_v3_hw_data.regions[i].size /
+                                        GICV3_GICR_SIZE);
+        }
+    }
+    else
+    {
+        d->arch.vgic.dbase =3D GUEST_GICV3_GICD_BASE;
+
+        /* A single Re-distributor region is mapped for the guest. */
+        BUILD_BUG_ON(GUEST_GICV3_RDIST_REGIONS !=3D 1);
+
+        /* The first redistributor should contain enough space for all CPU=
s */
+        BUILD_BUG_ON((GUEST_GICV3_GICR0_SIZE / GICV3_GICR_SIZE) <
+                     MAX_VIRT_CPUS);
+        vgic_v3_set_redist_base(d, 0, GUEST_GICV3_GICR0_BASE,
+                                GUEST_GICV3_GICR0_SIZE / GICV3_GICR_SIZE);
+    }
+
+    /* Register mmio handle for the Distributor */
+    ret =3D
+        vgic_register_dist_iodev(d, gaddr_to_gfn(d->arch.vgic.dbase), VGIC=
_V3);
+
+    d->arch.vgic.ready =3D true;
+
+    return 0;
+}
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index 946877bbac..2f9644dc18 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -968,23 +968,14 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_=
version)
     {
     case XEN_DOMCTL_CONFIG_GIC_V2:
         return VGIC_V2_MAX_CPUS;
+    case XEN_DOMCTL_CONFIG_GIC_V3:
+        return VGIC_V3_MAX_CPUS;
=20
     default:
         return 0;
     }
 }
=20
-#ifdef CONFIG_GICV3
-/* Dummy implementation to allow building without actual vGICv3 support. *=
/
-void vgic_v3_setup_hw(paddr_t dbase,
-                      unsigned int nr_rdist_regions,
-                      const struct rdist_region *regions,
-                      unsigned int intid_bits)
-{
-    panic("New VGIC implementation does not yet support GICv3\n");
-}
-#endif
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
index 0e0cf7b213..7dbadf7501 100644
--- a/xen/arch/arm/vgic/vgic.h
+++ b/xen/arch/arm/vgic/vgic.h
@@ -74,6 +74,7 @@ int vgic_register_dist_iodev(struct domain *d, gfn_t dist=
_base_fn,
 #ifdef CONFIG_GICV3
 void vgic_v3_fold_lr_state(struct vcpu *vcpu);
 void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int lr);
+int vgic_v3_map_resources(struct domain *d);
 bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr);
 unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev);
 int vgic_v3_set_redist_base(struct domain *d, u32 index, u64 addr, u32 cou=
nt);
@@ -85,6 +86,10 @@ static inline void vgic_v3_fold_lr_state(struct vcpu *vc=
pu)
 static inline void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq =
*irq, int lr)
 {
 }
+static inline int vgic_v3_map_resources(struct domain *d)
+{
+    return 0;
+}
 static inline unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *=
dev)
 {
     return 0;
--=20
2.34.1

