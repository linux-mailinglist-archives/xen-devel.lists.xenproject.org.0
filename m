Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC1D81237B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 00:45:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654257.1020978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDYun-0004RM-G7; Wed, 13 Dec 2023 23:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654257.1020978; Wed, 13 Dec 2023 23:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDYun-0004OV-CG; Wed, 13 Dec 2023 23:45:21 +0000
Received: by outflank-mailman (input) for mailman id 654257;
 Wed, 13 Dec 2023 23:45:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVP7=HY=epam.com=prvs=67111d5ab2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1rDYul-0003et-IA
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 23:45:19 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa52f849-9a11-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 00:45:16 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDJ2iKZ012660; Wed, 13 Dec 2023 23:45:04 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uy0y4vams-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 23:45:03 +0000 (GMT)
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8666.eurprd03.prod.outlook.com (2603:10a6:20b:54c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 23:44:58 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 23:44:58 +0000
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
X-Inumbo-ID: aa52f849-9a11-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEAl8RyPV6a3z3UxXq+cAewuXcasPSFXNuJNEOZ0H5fZcZJ7IlMXwCbaOlwnyi+pXqdul2qFAmnsE85Oy1vksVc7KDCkI3Blkao52Y9jCWmnKQJgfajk1iUxlR0dlC6BXAUyU1nBY3Q/8+fa9hVWsf4WcJBwu8WDXb0+PhAGO3SnV89bpOLBEHEsjor32Zh0CJIf98RfB+wGGSFX37fHZZ4Z/hXvTFRv6P5L+JChn+VkM0o/hmCYGN+hP4kQup0pjSFHeQ8r1LGFsr1wZM5l4td3mRihXvUexzk978eSWRZpqk+Gi4nfjuZliIGvlU4dpJwVAsGrwEvXRDCeIbIZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8N7z/YACwnG4WAFTZ48WWNHL71zQbWaz9C/HbJ/rSg4=;
 b=RlIlBFnmG5ezZ8OU0nGgaKxDDq5cXtsapX4KnWslb0f6WyJaKmCoKRKTlIWfp7J+DkkJx0uuokS+WX1DFJwrrpR4lv+OhnCTZCKhNo+aaLNHdqoZS+xOQZ+/Fa53GK6mzE+gsdadczv+DArR2lnXmhKZUgWckeyI9ZZrkE9PFZkOD71RYDsmDJxyg/pQFu8g9DgsB4Jw/R7XK9KjLOAdjUyt5/mZvmujT7KLl8yS3067MSqGEZ3y2XxZKjo7/QPJEYQCy/5w/CT9/gJ0q2/1sXfabWJDtF2Du8EG6gIvGizlCFr+k5+3JakyJJhMBuWrjhQs74hqWE/srzcMwVE6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8N7z/YACwnG4WAFTZ48WWNHL71zQbWaz9C/HbJ/rSg4=;
 b=HabljxAwPla2Idr/nyLTjxnuuWUaA56c9RQ1/LexmTuhYZY6ZJCyhtIkBMkgEumyQ+AdBKHkuj+YKKy5AG/bE3betzkWmppI13fiSrfs0lQ+RItBKtC+AoCloRHmNrir4Xlj4GC5/aKpttjzUBmNr/sUKpZvrBkZ9eToOyUgifQp9FUAdER/8U8/3KCg2Gpl2+sn9BLyo5zCXZvYTIyoYSLHRPh0McEp0FJHIPbaH12vT7/xyvH0NhVGfX8DuKVFe346J8CH+dg6cMkxi5ycrzHhSYsQJjT/u2p2c0Vnpu1yCVs/chIdZlZaYDAOVeeMKDMCnnQmhzEiNan/VcWY/A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
        Anthony PERARD
	<anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Christian
 Lindig <christian.lindig@citrix.com>,
        David Scott <dave@recoil.org>,
        =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [RFC,FUTURE 2/3] tools: libxc: add virtual_sbdf parameter to
 xc_assign_device
Thread-Topic: [RFC,FUTURE 2/3] tools: libxc: add virtual_sbdf parameter to
 xc_assign_device
Thread-Index: AQHaLh5h1p+/0eroN0+FN9vNJqoD+w==
Date: Wed, 13 Dec 2023 23:44:58 +0000
Message-ID: <20231213234345.779722-3-volodymyr_babchuk@epam.com>
References: <20231213234345.779722-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231213234345.779722-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.43.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8666:EE_
x-ms-office365-filtering-correlation-id: b531f16f-b7ab-4881-28f8-08dbfc358458
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +TVcbus1t8Xq089Hl8dEJ8MTTAEjayDFwDo/ceGAhqk7sS+QpYTJj/rOAixog2is7vJTS8OQ9CJXcGWhNjRX31sTfheVNrpkiss64IBJ3pSlb/7BHN0f3vwWLBahQ0p+Vl69JSyPkKNKLMZXUyi5+JpORt0Y3nl1HD6uW+6rd7hNuCSHxIME/9GB+YKrJ99YpE3b8rrtf1MN8jZmXGbXSyTRjMkoOjspr+BO7U8/lbOXWfYeKpS7T0x1Ggb7eiLfybxMgBGh7ae8EDpAPx1ZJhzCSSCJEUFFY5gKLtHE7oyYFMO/fBG+misAqcbrEWdQndTSlOE+heZRfVEbq0ZikQk/9DFoLdLWWeZbEGhJ8w/d+YjXdz0H1XXT5UKva5yV0I/y1mx7V5A3cnyFIMDkKKuQwHod6W1NXdnC5hq/2cuc9SCj0v3W/utYE5gh2R/v8QfHVsWUkJeZgg8rgVIdGPmytdyAm7XdTW2k2wkziajFcvL0MkWoUNgKLiU48DSWfq9HnG7+CeUzLPWpu0enKBLOoJQ82xcFSARRA5fcieKC7NBCVys1u0VopUlgc9xtMMZtubaubtiWTfgxPyZO5S/OvNthjKe/N4K0q6znCj5Af3IcutMezg4ggnY5IN2f
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(1076003)(26005)(2616005)(71200400001)(6506007)(6512007)(55236004)(83380400001)(5660300002)(7416002)(8936002)(41300700001)(2906002)(4326008)(478600001)(6486002)(66556008)(8676002)(76116006)(66946007)(91956017)(316002)(6916009)(54906003)(64756008)(66446008)(66476007)(86362001)(122000001)(38100700002)(36756003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?/JM9ee2v30wqwFP+KWXMttODE3YQRUIjNoY0ZU/rXO7KtJYyriWCGdO1WW?=
 =?iso-8859-1?Q?lN6G6oODVENv93DvrzV6EMQmfZ28ArZerTmuEpjlTajwI6y7EtmzbY8qcV?=
 =?iso-8859-1?Q?9IkbPxnuKEicbYt+WA8HZmn7vR9pLUJ8ET5PZMGDh9Q6BGBqfMZNAqePQZ?=
 =?iso-8859-1?Q?juocmEZRx2YEu5YEpyOBMjQ8h3Z98jgk3wUqeDjJFkNroR4qidlLTpYkeZ?=
 =?iso-8859-1?Q?ohx4Gm5MjZY7LwXC9fnAQPc4TMPGOckExPh+zDOpWql+n30v/GA0fzqI3X?=
 =?iso-8859-1?Q?NGEg1tZcMJNNmubzX6uBOPeey5gVkhLui7VSGGNQiQhd0e9eZ+pIJIva9n?=
 =?iso-8859-1?Q?UcaokZ5kmpr7fqaqRuTGSyQau6yvvuvhMWbBnUuNIYL724XJrnFl5N0gpg?=
 =?iso-8859-1?Q?Wt5PSoMeZKpTV5P+ePRHmGHsbuh4EeP0gClIXXpWFZjLmpCRbf2ySS2y1z?=
 =?iso-8859-1?Q?aNuzfk+UX2Hs+E0FWdphxOaf95zs0Y3CVt69MjEbIzvP4aTkICSVEx0l0H?=
 =?iso-8859-1?Q?Q4GAg3592u98q4Y4uYhm2bi4Q550NWqUOVW0wz/QxaKcGYQf2vf/5pOC68?=
 =?iso-8859-1?Q?IXaM2h47bDq19VlAxjCPSRAlXWTLF/It7bmfkotriKY0g6gVHQe50VRDLx?=
 =?iso-8859-1?Q?EiBtVZzm7G7J8/iPqh/IN/U3Yv5zktisgy7GAWl44JaKP0LUs2wC6s8Or2?=
 =?iso-8859-1?Q?QZeCXJwB/dLhUiNYvxASZKvY8IPTYL4K6SYMf42Lh3B0KbkITey7pdsyUQ?=
 =?iso-8859-1?Q?9bfwe0XTv9uKGqMwnmDMrzYqNjT/VrYXzB6HMm+c+1S/9TrjagMcAyl0v+?=
 =?iso-8859-1?Q?7nPYi67b1E3LZlEH+Ixe+w/RIywNvNAldrhz/oQBDoBp5vqw6MWCyUvTAp?=
 =?iso-8859-1?Q?u4J3yR+zPhqcL9AjK3BQaia40FKdviyuXGXdKw+n7CAjXCErGoz1XNF0Qo?=
 =?iso-8859-1?Q?99L7DfQ0WRdS4GisRNxKPWXfMa7GIbIQqm8euJQrm2DvoDSQJhFhGtjnp7?=
 =?iso-8859-1?Q?gNKTtjdcH2PrRxJWkfLKK3R+LCBuYFgvlH18hVUCAJNHmfFPlM4HbkmTWu?=
 =?iso-8859-1?Q?U5tIu2+GNt7X1GYi8ztXXFGdB80yVgNluBE5iUhgs1wa8NWpblmHs28drn?=
 =?iso-8859-1?Q?FhcpPHOOyY+jpGlV7Xj4ydZIUcFY7uQNkKDt4t0FrzJ3xcGKsyYDUZs7Tx?=
 =?iso-8859-1?Q?Ggu00EuKI/XgYk/tfhzSF3+D+Akg7RM5TxUObdTpOPxWLH0hVsd3czI4kz?=
 =?iso-8859-1?Q?UKqG2/w3VnCd+0jX+s9Ir5PQXJW+8Byh/Vns/IgEBrmqH4S2vzdd4fkTyc?=
 =?iso-8859-1?Q?1+9Sx/ojSsMfClqdlXgem3b7biTdsPL9396NVgqYdY2C5bZsfVOs1n617z?=
 =?iso-8859-1?Q?XtE+d+bmPyOnZVowDIBBwDX4cKu9KiksSuJzi6liv7Af+HfAvUa66gMQ98?=
 =?iso-8859-1?Q?w1reSSTt8nvRu7SNMxoglgl0YHTniHfr+dQWdDYas8rSS0f8+jUBRDJ4Vv?=
 =?iso-8859-1?Q?FC+Rlhvy0Cyq2ScZpNL2uwSKT9d6ZJ0N0Te7mA6Hs1MMVgiidFFtOMZVdI?=
 =?iso-8859-1?Q?MUpLg0sapkkiiZjU03HsyEcckMcixPjVGBMMr/kzYFF82E45J8UvyfAPRW?=
 =?iso-8859-1?Q?WDlqDUS19HbxI+nhgybQyOIhRWxol6TNbp+0yQa64IJ512iK7auOOMRQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b531f16f-b7ab-4881-28f8-08dbfc358458
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 23:44:58.2239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u/yOERxGxfwt0JZo9G71uQDdHuVFpu/Nzku2PDDpLfk3S2eAEdFq0i0gMy0oVeEPiJIpWPklL9jDvdm7usCgOLedO12/pd0D/3i8njv8Uh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8666
X-Proofpoint-GUID: N-KnCT21uJ-hmOONFHBqsIY3oIezIrNn
X-Proofpoint-ORIG-GUID: N-KnCT21uJ-hmOONFHBqsIY3oIezIrNn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312130168

Now, when "assign_device" domctl supports virtual_sbdf option, make it
available to libxc users. This is an optional parameter, if it is not
provided, xc_assign_device() will ask hypervisor to allocate a free
vSBDF.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

--

This clearly breaks libxc API. So I wanted to discuss a proper way of
doing this. Should I introduce a new xc_assign_device() function with
an extra parameter?
---
 tools/include/xenctrl.h             |  1 +
 tools/libs/ctrl/xc_domain.c         | 14 ++++++++++++--
 tools/libs/light/libxl_pci.c        |  4 ++--
 tools/ocaml/libs/xc/xenctrl_stubs.c |  2 +-
 tools/python/xen/lowlevel/xc/xc.c   |  2 +-
 5 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2ef8b4e054..ccc0745c35 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1689,6 +1689,7 @@ int xc_get_hvm_param(xc_interface *handle, uint32_t d=
om, int param, unsigned lon
 int xc_assign_device(xc_interface *xch,
                      uint32_t domid,
                      uint32_t machine_sbdf,
+                     uint32_t *virtual_sbdf,
                      uint32_t flag);
=20
 int xc_get_device_group(xc_interface *xch,
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 2405e39517..ca60b13a89 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1497,18 +1497,28 @@ int xc_assign_device(
     xc_interface *xch,
     uint32_t domid,
     uint32_t machine_sbdf,
+    uint32_t *virtual_sbdf,
     uint32_t flags)
 {
+    int rc;
     struct xen_domctl domctl =3D {};
=20
     domctl.cmd =3D XEN_DOMCTL_assign_device;
     domctl.domain =3D domid;
     domctl.u.assign_device.dev =3D XEN_DOMCTL_DEV_PCI;
     domctl.u.assign_device.u.pci.machine_sbdf =3D machine_sbdf;
-    domctl.u.assign_device.u.pci.virtual_sbdf =3D XEN_DOMCTL_DEV_SDBF_ANY;
+    if (!virtual_sbdf)
+        domctl.u.assign_device.u.pci.virtual_sbdf =3D XEN_DOMCTL_DEV_SDBF_=
ANY;
+    else
+        domctl.u.assign_device.u.pci.virtual_sbdf =3D *virtual_sbdf;
     domctl.u.assign_device.flags =3D flags;
=20
-    return do_domctl(xch, &domctl);
+    rc =3D do_domctl(xch, &domctl);
+
+    if (!rc && virtual_sbdf)
+        *virtual_sbdf =3D domctl.u.assign_device.u.pci.virtual_sbdf;
+
+    return rc;
 }
=20
 int xc_get_device_group(
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96cb4da079..723e577ef5 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -842,7 +842,7 @@ name:
      * so always pass XEN_DOMCTL_DEV_RDM_RELAXED to avoid assignment being
      * unnecessarily denied.
      */
-    rc =3D xc_assign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pci),
+    rc =3D xc_assign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pci), NULL,
                           XEN_DOMCTL_DEV_RDM_RELAXED);
     if ( rc < 0 ) {
         LOG(ERROR, "failed to quarantine "PCI_BDF, dom, bus, dev, func);
@@ -1524,7 +1524,7 @@ out_no_irq:
             rc =3D ERROR_FAIL;
             goto out;
         }
-        r =3D xc_assign_device(ctx->xch, domid, pci_encode_bdf(pci), flag)=
;
+        r =3D xc_assign_device(ctx->xch, domid, pci_encode_bdf(pci), NULL,=
 flag);
         if (r < 0 && (hvm || errno !=3D ENOSYS)) {
             LOGED(ERROR, domainid, "xc_assign_device failed");
             rc =3D ERROR_FAIL;
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenc=
trl_stubs.c
index 3703f48c74..55d257abbb 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1323,7 +1323,7 @@ CAMLprim value stub_xc_domain_assign_device(value xch=
_val, value domid, value de
 	func =3D Int_val(Field(desc, 3));
 	sbdf =3D encode_sbdf(domain, bus, dev, func);
=20
-	ret =3D xc_assign_device(xch, Int_val(domid), sbdf,
+	ret =3D xc_assign_device(xch, Int_val(domid), sbdf, NULL,
 			       XEN_DOMCTL_DEV_RDM_RELAXED);
=20
 	if (ret < 0)
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/=
xc/xc.c
index d3ea350e07..1e210c78b7 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -587,7 +587,7 @@ static PyObject *pyxc_assign_device(XcObject *self,
         sbdf |=3D (dev & 0x1f) << 3;
         sbdf |=3D (func & 0x7);
=20
-        if ( xc_assign_device(self->xc_handle, dom, sbdf, 0) !=3D 0 )
+        if ( xc_assign_device(self->xc_handle, dom, sbdf, NULL, 0) !=3D 0 =
)
         {
             if (errno =3D=3D ENOSYS)
                 sbdf =3D -1;
--=20
2.43.0

