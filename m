Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE8B473F8F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 10:34:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246484.425088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4Cm-0007P2-QY; Tue, 14 Dec 2021 09:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246484.425088; Tue, 14 Dec 2021 09:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4Cm-0007N5-NN; Tue, 14 Dec 2021 09:34:40 +0000
Received: by outflank-mailman (input) for mailman id 246484;
 Tue, 14 Dec 2021 09:34:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXUZ=Q7=epam.com=prvs=298265c1fe=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1mx4Ck-0007JG-RD
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 09:34:39 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32c13a6e-5cc0-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 10:28:30 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BE943EF004675;
 Tue, 14 Dec 2021 09:34:35 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cxraag3uw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 09:34:34 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB6976.eurprd03.prod.outlook.com (2603:10a6:102:e4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 09:34:28 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 09:34:28 +0000
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
X-Inumbo-ID: 32c13a6e-5cc0-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioRt2ZPrDGCVT0oIn/POaFjHyH08hqjuqE8K7AQlE9ayLBu4LuBziJZz376LzDE8Jf/ONKzdiMIMZqaUCwPPe3KpaaowHxEyW/TwBmVzfNZECl+gGfxp25p7eUQsMV4DGWMkMOD62Y8o908hjWfBHArknZsY55aTqVxhOWBMOiia74m/3fLaLHpbcShE1MgqddUAPLtoSIPRytg2d4w0NqzWhPZ0HIP1f+UHmOqQZ2gBvz9SM1NUTtGnBsaOKQdicrdZLTQYYbqjDm6j2E1FXf6v87+uYMKJQ7ALvp/Bl7Nt1EljoNaT+KSXdWWMMdeGdG5HbBRaZAezQ2UZTG3nrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaUWZPBTg2O+gyl1uMnhO6Ep5oxml8YVCINnTiUgzaw=;
 b=dABaXNHdHUTNEz9oop758mpIX/ug6s88TrCMljKHqgOeyJagwmq0EiZu1okpBIsBQfgKcTB1sA2Ik+Gr2GFJ9ceB/fEXdB9ubPorsIZs78hpEhbvLkd1EF+fAXtZIws6NrN/Q5Ls1BlLyCjA6i8GJ1mAqRcB+WEEv6W+5nTfiJFoUms30IRkCXWtmAtitbuEVyNkvLIs6qzvfIf2dj0a/ugoH61MK/SENrwEcgHWStQI8PDSfSmrHRm4jClLvneyzEBimSWUPUK2IqM3UDNo4dcPkheRn86WdhvCihBKxLXfnCC0Z+toDrvAS8iZCJ2QZ49piq8PBXTKpqHap4K1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaUWZPBTg2O+gyl1uMnhO6Ep5oxml8YVCINnTiUgzaw=;
 b=ADKHM96IC1fMqOM8lI/kVaRaXO7mlw5mSQfwMwdLQtvh86W/0dz3lasrfW6+lev+irLXGpGZIupnJUS+AsfS+WZGO1GDUBn0qV5hrvVaW07w/Fu1mWYWH8adH5t2WV2NE/XR73QlwjaDvPdJ2BkVyx/wnrc8Po1EKT8/tZTw39hEbyWF0H7lpmGOLgqNAidTua2zBg3ZiX0+8bG0vl8Hj20KDra/IUlWZpEFslP0Mao3PZsM8jH3gqfnXzEu3fXUwVFMAfbYsYfW9KSL4+TgCsjssQevvFbXBstA4+Fkui8POhRkEn55+Jkru9exjYR0h8/Z+1lSDEkHAaV33VvGZg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>
Subject: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
Thread-Topic: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
Thread-Index: AQHX8M3K+4k+NJRDpU6TSJ1TAn9Owg==
Date: Tue, 14 Dec 2021 09:34:28 +0000
Message-ID: 
 <7aa3e21a3285b3af92ad87a4b039b4bd7696ac88.1639472078.git.oleksii_moisieiev@epam.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1639472078.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f4502bb-2d5e-491a-a663-08d9bee4ed06
x-ms-traffictypediagnostic: PA4PR03MB6976:EE_
x-microsoft-antispam-prvs: 
 <PA4PR03MB69764BCDE36592A8CE2714D3E3759@PA4PR03MB6976.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cIalWWULnWtDp2xml+AbZba8QPmRDeawiRzkuWRg1Ii115PWr3Cl85ZpuGwHFOOhslcqfAEupzuUG0WxWeOEzth2mmV0jo7jnBUtStORjVIGsMBly7bluZAZr7/6re0i02f5qpBxyHyug79rUAsaSDZHtnj7M3r8/jt0Nm2s8njNe1FhliMnahTD84mM4S+/MUqO/C2yUhxboTDg7xHg67CHixsjRybEEq25sp0vpzDOeyvKeI4Aw21aD6SjXBWrk/G1fLy6IzNh38rQYa1xMV+HIGNIcBNI41s9WY7bAMK5m7lhxKo3IlthLExLrLVuZR6NqA2JHP5JvAHoZzcbq7u643FwGsxqdikk1MnW2+2pFgzYBt78snO6IpoL1l/najT2esrg1aCQQaSeNSdSWPiEP3rYt98QXmWYMeDXK5JlA99yhgHdjyw2z+YCwQrBZjxx+PX9B+DJ7vsG9Hms6g19h9/Xnd0CpxXthTr5fn/19IoWqOg8zQOmHPpjWa5k0DtupRat3gbplqPm9Idw98CoKBmWIFIxB9AkyaizHH2+Y4Ieete6sIO/AwwnUzpN4eKk/9qwyq7WEbkh1kR88RcVjMB3H7vwFJiNH600BIIlC7NFax9Vd7T5OE6aSyntF/k7LMWpvGKAk2xrqonSu71L7AIWEUbiGswTCqJCMM1KBkt+ORgFJ8pXzAfx+nCxT8N6Hnep942uVTreprZ2fw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(64756008)(66556008)(66946007)(26005)(66446008)(76116006)(5660300002)(91956017)(508600001)(86362001)(83380400001)(186003)(6916009)(4326008)(2906002)(6486002)(38070700005)(8936002)(2616005)(36756003)(71200400001)(8676002)(38100700002)(122000001)(6512007)(6506007)(316002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?eOxrMUCJPjffCraXnBT9TP1oAwa0JFYeXrCeaC+qkGIWuQrmsGKeQ1b7hT?=
 =?iso-8859-1?Q?6M1cJxCIFh//+WnE9T4oQBKLg+lyrDhNepW8KMugwFRtbQ0Mi/kr//ND/X?=
 =?iso-8859-1?Q?+zHvEEMehTXdXwPwCOTstxpI/7/Skd0C4wZIyxlfoE6vrP7/be1WpGn3OI?=
 =?iso-8859-1?Q?ngog3jnBONmPtW4vCDBHrkdDhRsw3lT0Zjz9i6I1Pv8Ti8knmQ88JOy43B?=
 =?iso-8859-1?Q?cHJBBBxXHGU1cpGNBWEmxkDQ7mVCv3XZ7DowVEdyrRwisp+4gitkdFuW3v?=
 =?iso-8859-1?Q?I74HSaz5mk1D0UNgZ1OgX78PjHv3SYyfj52d/a1aCG6FqqHypeOziSKAk3?=
 =?iso-8859-1?Q?pAha94+eFAXtS5kn4Oh9y456D4FqVpk+mexH6ZM5eflr0BdZFlNl2iunGX?=
 =?iso-8859-1?Q?8KSo/Xz/vBEeutdUq9BcwZY2E4kEmxBMy2AJvWF974e+GcRmQ86p1GbCBQ?=
 =?iso-8859-1?Q?bL9CgoF8PkfwJ753pjUWaLw7vKt41ubkzHQ87KXY15wvJlTuLxRjJuYTDa?=
 =?iso-8859-1?Q?7TCV4vTVAB+VtfLHI8eOPIhEMXoLjTraYhqY2NVdv/5HfiiKJwBxawiGja?=
 =?iso-8859-1?Q?PoLSxZk68BFYEubxrRivjddyQD3KOm2Mldkt/Lfl+pPxSDTvjWq+o+KcdT?=
 =?iso-8859-1?Q?lTM2WaYv6n9Ve9Pn9Kw4lixebyV2LWXVJmYooTd6k7zci/nY4IwgmNjxaV?=
 =?iso-8859-1?Q?TTly39djEErUmAqq+dHethEU+B3iI9d7jcrpvgf6PxJX+ikye0bPqvwYvH?=
 =?iso-8859-1?Q?mEkoqEy6kT8wfa3h8R2WEmHYWRKlAm+HoIKq/BAUGcxMWVDxpK8gNFR/D6?=
 =?iso-8859-1?Q?G21WsDeGYH/RM8Fg+kTxJxs3+4E3BeMD7pEf2IcUCZxT5QR3Yqj02+U8IO?=
 =?iso-8859-1?Q?TwrZwzmNsSVJM4XmUWwUjqYRv+AKd+Io03ZvnyxOImOHKRS1KZnJ/PVyk1?=
 =?iso-8859-1?Q?42FT8oNi9vgdi0vMVnP96mX3lbFijcWWh4mbgHCZ+wkqNTFF0oqu7BHr9E?=
 =?iso-8859-1?Q?380Px/2AU6HJlK/TTZ9f+bgAdBmXYYOV6MJAyjFco6BiE0sda1Ev63Dnv9?=
 =?iso-8859-1?Q?eQ2/WpVvY5hQGaImXX5WBu04z4wiv17rLllJzeDhmhOnL4FE/NvdouMPBD?=
 =?iso-8859-1?Q?Q7gxpTrvdi1Ae7ceYuepxZs4e2+6u4FJ26fF5QYNS6dNelwyiKpvgXaBFM?=
 =?iso-8859-1?Q?xd1mTwxA5/q4qSozn9WE/nSzFBugmvEcscZxx6O/IO3NDArrPgctZRhI6K?=
 =?iso-8859-1?Q?kRA7vQw2C82Az3jBjDEbIbz+37Xxe/R+wyR177yj7qPWK0oYByz0Mt15vn?=
 =?iso-8859-1?Q?UR3Q3irPR54M5JvCfX2U7GohwXz6UUj+AgzrKF+vNRHkSShL3O3nUqUuN8?=
 =?iso-8859-1?Q?G8J6HdicUHNTfA+RfGM1zHGKnP4QXS5xmmojJjJ2/koES02VHlobn6ya7M?=
 =?iso-8859-1?Q?JjpE8iHCvlkkuS8sjQ88pTdyXq+QZWOeNaF84zPDBlUB+Tqr/Hm9Ir0MeU?=
 =?iso-8859-1?Q?sn8/+bPVPESCWuIlXzNENJLp7Rsu9ybictygrivlcHptBhUR/6p9GeJ8dJ?=
 =?iso-8859-1?Q?0QB2Gtudj/wTjrtUcodjgYluf74De1g0SdO8Nhjhmrf9ILQtYSTmfqwI/S?=
 =?iso-8859-1?Q?T8gqVJ2Rq+XTaHXeZUQHX8am8wFVxkDH1m04K67215K7v7NR3A7IX1qdT5?=
 =?iso-8859-1?Q?WyLe8eE4K6FzPcSTB1pev8VpCD5AjZyPqR3P7YMv8tk1xt3an0DBcLg5GI?=
 =?iso-8859-1?Q?fqJj458lzwxCZcJji2E6/IECk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4502bb-2d5e-491a-a663-08d9bee4ed06
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 09:34:28.7467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r7YxAtrBr9WWk+vi/f6p0876oeSKYUkkyMVot8BKyQm4wFjFqtC+Wd10LtwjYqKSMEMhAOe1rUOCFOL8THi6VPguFrXzB6lcx54nNaKwSKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6976
X-Proofpoint-ORIG-GUID: R9AhTlzDXLwOEHHLJle-r0h0shZq5sZ4
X-Proofpoint-GUID: R9AhTlzDXLwOEHHLJle-r0h0shZq5sZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_05,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112140054

This enumeration sets SCI type for the domain. Currently there is
two possible options: either 'none' or 'scmi_smc'.

'none' is the default value and it disables SCI support at all.

'scmi_smc' enables access to the Firmware from the domains using SCMI
protocol and SMC as transport.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 docs/man/xl.cfg.5.pod.in         | 22 ++++++++++++++++++++++
 tools/include/libxl.h            |  5 +++++
 tools/libs/light/libxl_types.idl |  6 ++++++
 tools/xl/xl_parse.c              |  9 +++++++++
 4 files changed, 42 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index b98d161398..92d0593875 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1614,6 +1614,28 @@ This feature is a B<technology preview>.
=20
 =3Dback
=20
+=3Ditem B<sci=3D"STRING">
+
+B<Arm only> Set SCI type for the guest. SCI is System Control Protocol -
+allows domain to manage various functions that are provided by HW platform=
.
+
+=3Dover 4
+
+=3Ditem B<none>
+
+Don't allow guest to use SCI if present on the platform. This is the defau=
lt
+value.
+
+=3Ditem B<scmi_smc>
+
+Enables SCMI-SMC support for the guest. SCMI is System Control Management
+Inferface - allows domain to manage various functions that are provided by=
 HW
+platform, such as clocks, resets and power-domains. Xen will mediate acces=
s to
+clocks, power-domains and resets between Domains and ATF. Disabled by defa=
ult.
+SMC is used as transport.
+
+=3Dback
+
 =3Dback
=20
 =3Dhead2 Paravirtualised (PV) Guest Specific Options
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2bbbd21f0b..30e5aee119 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -278,6 +278,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE 1
=20
+/*
+ * libxl_domain_build_info has the arch_arm.sci field.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index 2a42da2f7d..9067b509f4 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -480,6 +480,11 @@ libxl_tee_type =3D Enumeration("tee_type", [
     (1, "optee")
     ], init_val =3D "LIBXL_TEE_TYPE_NONE")
=20
+libxl_sci_type =3D Enumeration("sci_type", [
+    (0, "none"),
+    (1, "scmi_smc")
+    ], init_val =3D "LIBXL_SCI_TYPE_NONE")
+
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -564,6 +569,7 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
     ("apic",             libxl_defbool),
     ("dm_restrict",      libxl_defbool),
     ("tee",              libxl_tee_type),
+    ("sci",              libxl_sci_type),
     ("u", KeyedUnion(None, libxl_domain_type, "type",
                 [("hvm", Struct(None, [("firmware",         string),
                                        ("bios",             libxl_bios_typ=
e),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 117fcdcb2b..c37bf6298b 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2747,6 +2747,15 @@ skip_usbdev:
         }
     }
=20
+    if (!xlu_cfg_get_string (config, "sci", &buf, 1)) {
+        e =3D libxl_sci_type_from_string(buf, &b_info->sci);
+        if (e) {
+            fprintf(stderr,
+                    "Unknown sci \"%s\" specified\n", buf);
+            exit(-ERROR_FAIL);
+        }
+    }
+
     parse_vkb_list(config, d_config);
=20
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
--=20
2.27.0

