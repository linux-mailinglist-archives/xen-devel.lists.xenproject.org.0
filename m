Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCE17E8486
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 21:43:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630794.983900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1YKs-0005GS-6h; Fri, 10 Nov 2023 20:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630794.983900; Fri, 10 Nov 2023 20:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1YKs-0005Dl-3j; Fri, 10 Nov 2023 20:42:38 +0000
Received: by outflank-mailman (input) for mailman id 630794;
 Fri, 10 Nov 2023 20:42:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vE0U=GX=epam.com=prvs=56783987ff=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r1YKq-0004yp-H5
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 20:42:36 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aadc3ae5-8009-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 21:42:32 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AAKIjQt010025; Fri, 10 Nov 2023 20:42:27 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9kkysufj-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 20:42:27 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DB3PR0302MB8991.eurprd03.prod.outlook.com (2603:10a6:10:437::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 20:42:23 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%5]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 20:42:23 +0000
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
X-Inumbo-ID: aadc3ae5-8009-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7dj0MfiNhBcQRxOXWlLu+E8hDVjZ4M/bAd97c+F09PNhDkq6PB+58Oi811KA+U5QsX5i6jHY4e4Wt4304XprWFNR+t9Y1qankKjmD2epfw3E0+T3I03rBmXx+NetH7LdEmJiposO5pEv9bvgYxaXpcxjEeAmEcQhS0I/Hc70HsC9gyYkKKtfnbgVfAYQuBB9Ri4B/IiUmb1C6wBt99wQwM2E901Fvxbm98VwtGuGbd3bgD6on+6gRW/ooMP5fDZzdBVJOZ+4pPJ38qj4NF3b7Vi9P/jhzRNv5vANNXd3LCoV9W7jeLSBRXeCCpysC2Nvu92PqBlcLZI8M1/TK4L8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKWARBfkUGbfwrphZNisw+1lvrxJ4IcHq6RYQnSJRuE=;
 b=E26+7tTYs5Vb45W2X5Nga72XsY/IoP4LX8fHXDkAKXZ3PlYsLbh18raJ81iZQQZQaG/38GWH2SXgy2gBvEeLdnZqdHnuRsMrF9Syp6sUTtXkFnx6JHw56Qx26e6vqlouKJmhJrZ2oPAc7YpOr45xmPX4EJsuvW6HLTMltwc6OnCccYKWckVf/AacYqMaMEvVwCHHO6QxqH51Rz8C8qx4VZ+mB/M6aSTQIBFuOQ0SxT7uF34qklJf+YjON8lbkVjz3i2JLNmwaoJEwt5Wods5c9nn9wpyI85lO3qkXITNoBsYlsYXhlxsBvlFiyRjrJeVnRvlISWt5V1ohCRtTDQH0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKWARBfkUGbfwrphZNisw+1lvrxJ4IcHq6RYQnSJRuE=;
 b=BNIe2UUcVtrvYCL9/nRZ8oH+N9+9MFwo/bxvlJYU2vxi9rwIjIG4xzlfR6qCon+lH0nZukftKOSbzv9+QhFxqPaer3/YbFsVYJgh9sEvZUBTrClVJNqeCwwn15h8fE5/XYEv570YZQondgAKe/DiAY7fw5EPdwJ8Eua/iBVIYeKmheCl7ZHRJOWS39KaawYKdE+2nL1vDqojC9LSUul/lIcDMA/S9vCXqhTW26nYOaer9MtkzMifC7lAU1YiOuUq4h6pFMpUrMovytMg3IdavnLWNzZ8lQICWvk7aKYxd/x/xlYya7E1fHHRqv65rv3x4iZupqr0YTRyny0jewleqg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: [PATCH v1 2/7] xen-bus: Do not destroy frontend/backend directories
Thread-Topic: [PATCH v1 2/7] xen-bus: Do not destroy frontend/backend
 directories
Thread-Index: AQHaFBZnKqlUX8wCr0GIKTREthBW5Q==
Date: Fri, 10 Nov 2023 20:42:22 +0000
Message-ID: <20231110204207.2927514-3-volodymyr_babchuk@epam.com>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB3PR0302MB8991:EE_
x-ms-office365-filtering-correlation-id: 5bc8600f-bd49-4902-caac-08dbe22d8aac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eMdTJYD8hdUfjYRSfS49W/otw7oU2rlT7EZkqGf1DooukUiBpoK9jUnSvMo2/4ejhwEJ1TSlJM5alts0x+Q479PTwHvu/NmPcKGtNDr8igBN8spOOATeULQnekd/nSG0cBsaLpkYBK4EUYoxNCb3Q2I9ihpv16U8AJXZzJd5s6DXEJPy8FfmB89UQzL2aL8SR26X5D01s9hhOQz17EZwAez1TlmGPRyZSYhJpsQ/mSuXx6x6bWP8e357/R6lQLBEPgnSLvr9+9AtMnYpFUr1bm373HTNNxO3xRPbXCViW4PZ3zh7opC8t2DMKjryPRiGBzPoDLxkmzJnMCKRxGv8inoZmYazCg58+FR2hId6cZKyJ6IzeqQSLTK+ZSl6VFW+bchrs56QIpf9ZM+wIJyRYmA508cS/a05szLh/0bF0VxCbNuZU8vP6oJPhWF3lsNUP5Tb5RIVjYW0IFDPN2OpOFySCmtbfp1hLEbnIKyu/3R/y1MM8cfQiag8G/oRr6xxJjO3KSO7iblvseXtNjhm01fyIrSOd4Cwrb/L1i94Yel/yY9QjIGBiqLbZRRJSMFgwi1A0Bb3+7teaNnY872SsVvnq8sNd293Ya/wEOnBkRCzXXgpeaBXd10kh+VdzUfB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(41300700001)(2906002)(8936002)(4326008)(86362001)(5660300002)(38070700009)(8676002)(316002)(36756003)(83380400001)(38100700002)(478600001)(2616005)(1076003)(6512007)(6486002)(71200400001)(122000001)(6506007)(55236004)(91956017)(76116006)(66556008)(66446008)(26005)(6916009)(64756008)(66476007)(66946007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?232sTjS/Gy/kngS8P2pcprtA+UZK7UcGFy+3w4XwY9/Z2d5IMTkpNJsuPi?=
 =?iso-8859-1?Q?H549jXIFHIriUBo49FPcfrWlBcMuAJZ5+rW5QAbLuIyPsOORTiGH9uY8Fm?=
 =?iso-8859-1?Q?4wDLlVJ3ZtyN3ka2wNCBxA81WFBu7DpU3AwsW+qi2+BBxv9zkEulL54vDt?=
 =?iso-8859-1?Q?cQJaSp8tXCTRid606zo8o4BucM4j/FBjMxCM0SOREZaHg1oDirJGuJ+GHQ?=
 =?iso-8859-1?Q?JnB5HkpvkRyJxTyERs3+vUfSQHmqVx2x9CwBGptfZQoZ3+n+ey9FYgyPDF?=
 =?iso-8859-1?Q?O28t1Dk+ctp4lJsPL1fUYgJMb+xpTukdOJwYrle8YPsL6EKahj4Dg1ppSr?=
 =?iso-8859-1?Q?/qWkbS8fWu/TEYJJOYBqSdFtLG01lv7cmmlMx3d6YFE/PSgXYNhVuE9hfk?=
 =?iso-8859-1?Q?V4xetBTx4fMNtWiMYVb9EFdesbKJ3DBfB04273IneXS57if8aTVn67FoUA?=
 =?iso-8859-1?Q?bX9BRYvEzFe4AlPSBVawky4teYMX1k4cWOd3iN1Sh4foN9qbgW+LSfcpq8?=
 =?iso-8859-1?Q?yDOK6Z48YRuLJuA4y9KTPfZMB9kVfwzCElNPJMP58rpHRmy5C8uhzy/EnR?=
 =?iso-8859-1?Q?vt1PftvSGswT32dfNZz8vydAILzn7gKLzUUPrGX1ZmWN9dxJSXy036tv4+?=
 =?iso-8859-1?Q?s/YKVH0z0G4GJTcb1Qr60PrjsxFp9gZf6ouBh1LbK+QgJ5hg/Y+A2IgH/n?=
 =?iso-8859-1?Q?HrH8EQD28km+E4tIBI/H+Jizgq5sHkm43C7m2DMdhYVaj734bDr1fdNBoM?=
 =?iso-8859-1?Q?xuqtU9INEGIQntP9OYKDm5tYqIZGZBrFfP5WPwe5xRnwhLbTscYSgc77S5?=
 =?iso-8859-1?Q?lFTYiwV/Ha3u3AMLqcwR0TETi36L0JPj2qdX3iJWrinfl/xJXaqHQjBmwq?=
 =?iso-8859-1?Q?B/RjqymTub57MuhexCXMrmiVCtwGqFKmaEyL6YCzkfeAnDI6NXOiRbvN82?=
 =?iso-8859-1?Q?Asb1aK5hjXS5dn8KVDO6mlYXmRpfrwKjLwTWprZm1Jy08KCHxFV5jXW3iI?=
 =?iso-8859-1?Q?PU5iiuEYj3GPZTOzIQLnzDFkqx2I7218Qxj5YlTxfLrtssX2iHD5csMi2n?=
 =?iso-8859-1?Q?0I16UhrLwyVlhMF61RlyPU3/EF9KwTO/MoRApQVaEngj7LDR+KGG7iFIv2?=
 =?iso-8859-1?Q?y1pkn+9Q2hHyK/Zd/8qdNKDA18CINMF0p9So5kNg+IClF4b+8m4NedWGac?=
 =?iso-8859-1?Q?edpddUbJwiC/NORVfnAeQEMwF3GHQAzpCXXHdMox5VX8dLqm+0UWKyy4+Y?=
 =?iso-8859-1?Q?EsuiJaqqzkba6jBxtvz0Iifx5F25jz2lo4K9NFta5v2svK1kp5TBks4FQQ?=
 =?iso-8859-1?Q?WaUL+QiRuvX41J6Oh6dUx5O0aPMur8ALdlrHp10C5beUmEONP/RhbpNUZt?=
 =?iso-8859-1?Q?vwzWDqeGejx81dmuADqLTlqJAK9ut7mv2xDAalRLg2jCHx/qU0k7q7/BEr?=
 =?iso-8859-1?Q?OUbIkriBBTuj62DiBXncLtTJMZWPN4+8lGVuw3/m935n2WaiX45DAiVR5U?=
 =?iso-8859-1?Q?AU/J3JdqIyQJ2YPimJB3zTo2lQGOLlTxdFsK5ZQ9QXtFjFMqpdIovfSKyK?=
 =?iso-8859-1?Q?rAJIQMtX3IpVI0tmOz4AcBeeBOMXugQ90976pNXmTDEG8RjCy1czQzLSbR?=
 =?iso-8859-1?Q?NY9XSnuXXMFPW9Q5xgRR/O/j4mo9kEdBmTNiG+vEDV6d5dFu6q56qczQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc8600f-bd49-4902-caac-08dbe22d8aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 20:42:22.3490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9kgIgaLSbA0ltG1jaSIk80Pe31b2A3q3L0zvgGTgvkIsDcF81mLGR1gaUpfjxsniawGKFWNA7zylwSu+UkBu6qEdmht3+/gYttvKHfuWA4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB8991
X-Proofpoint-GUID: kKNgRHbizpDH08hwtsCO87z5qaDmoW4x
X-Proofpoint-ORIG-GUID: kKNgRHbizpDH08hwtsCO87z5qaDmoW4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_18,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=631 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100172

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The PV backend running in other than Dom0 domain (non toolstack domain)
is not allowed to destroy frontend/backend directories. The more,
it does not need to do that at all, this is purely toolstack/xl devd
business.

I do not know for what reason the backend does that here, this is not reall=
y
needed, probably it is just a leftover and all xs_node_destroy()
instances should go away completely.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 hw/xen/xen-bus.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 06d5192aca..75474d4b43 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -598,8 +598,9 @@ static void xen_device_backend_destroy(XenDevice *xende=
v)
=20
     g_assert(xenbus->xsh);
=20
-    xs_node_destroy(xenbus->xsh, XBT_NULL, xendev->backend_path,
-                    &local_err);
+    if (xenbus->backend_id =3D=3D 0)
+        xs_node_destroy(xenbus->xsh, XBT_NULL, xendev->backend_path,
+                        &local_err);
     g_free(xendev->backend_path);
     xendev->backend_path =3D NULL;
=20
@@ -754,8 +755,9 @@ static void xen_device_frontend_destroy(XenDevice *xend=
ev)
=20
     g_assert(xenbus->xsh);
=20
-    xs_node_destroy(xenbus->xsh, XBT_NULL, xendev->frontend_path,
-                    &local_err);
+    if (xenbus->backend_id =3D=3D 0)
+        xs_node_destroy(xenbus->xsh, XBT_NULL, xendev->frontend_path,
+                        &local_err);
     g_free(xendev->frontend_path);
     xendev->frontend_path =3D NULL;
=20
--=20
2.42.0

