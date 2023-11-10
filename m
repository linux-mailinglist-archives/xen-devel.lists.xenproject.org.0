Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D607E8485
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 21:43:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630795.983907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1YKs-0005Ln-H8; Fri, 10 Nov 2023 20:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630795.983907; Fri, 10 Nov 2023 20:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1YKs-0005Gk-C1; Fri, 10 Nov 2023 20:42:38 +0000
Received: by outflank-mailman (input) for mailman id 630795;
 Fri, 10 Nov 2023 20:42:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vE0U=GX=epam.com=prvs=56783987ff=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r1YKq-0004yp-O6
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 20:42:36 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abc769dc-8009-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 21:42:33 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AAKIjQv010025; Fri, 10 Nov 2023 20:42:29 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9kkysufj-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 20:42:28 +0000
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
X-Inumbo-ID: abc769dc-8009-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLzbX+PFHfdrpRDvIHh/f7PsfqIacoGaQkRrO8MspJ5r/z10EryU2zR+5nyrvcHJQCBsz0/r3gbmLGZUZ7yUq97zUChu/gqEbyZmHbOQAONo3RsEW7Gsd0EPgbQQH2eU7rGXyCN9zFge89C4yGwxKVUVRf7unl4j3e8xc1gEaLWWJ+UEJUNIAE5E5j5Yi/ddgbi0iVjudVo4cWDrpGpJ79wsw0f1ulc9QSbZSFOCKXhEOzNhrO3TPOW/QRaWzRbS0z1dzEW5J81lJy16206Lsv2LuKBzu3fm5nQjFpKsrkkPICvAi8cOfjB4omcw39tv2BawW/FqnSF8gtOqE3CtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvW436DHGoKHwxC73icUcWiaYr0+vXQ+sVSK+d7PBeg=;
 b=NrMHJiUYnSClmG816XDXYmI+1IUU4zufT0z6svvjtdu1QeBk62D1ii5RTukXffD2d71xf4fflD0v8oXrMHlv2yAPHt9uTlZa5K6NxrYUcJq0QUSk+cEw7SFkccb1og6dxPStbiZklI0Hay2jCX9/legUw4We41hUni8yUZ/ylAnS6dp8IlkAm+rMovF3xg5Wi3cY/NNAsONBpZAmqi2pQwTncLep+/+1Jo4nbYAcJ3OkUKFgPHNC3TRFKxB8jlrto2KQldF2rWR56hIYWIeBPN1lVhEC915R5J6S1u8Xo3tdo8+JLpQOBO6lNoVyYwgOcLCIWhIxcaDHMlNAimXsrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvW436DHGoKHwxC73icUcWiaYr0+vXQ+sVSK+d7PBeg=;
 b=G5tIeKCiYONkoAE1+JYYUJ8NQL6C51brQmsEYkH9Cw1e3xv/uztgaTFhoA9E+2hD2FNnrr+4btYXxuBbsmYw2Y8/8TJBg5XCLEPIg45AUTpW2NhxksSa+ZOiL0sejg8UWXNoVAh8dGl55Hd4EHXvEdEoIBl8mzejuVrsd8QRvyeQn2yTq5CXJtn2kBMfsWYpM4XcHTV1IpI4qOeqWCV4MrsXhPcjU0AO44eVBNVEQjpiPIsGABn8bkuHGSugb10M45wNdiyiTmcfaKqjK1ANCpomSn5uZqVBjhxeSL7jYMB5FHhIJyPR9Tw34fQjp93rINYjTFi2IBj7BYROcvMUaQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: [PATCH v1 4/7] xen_pvdev: Do not assume Dom0 when creating a
 directrory
Thread-Topic: [PATCH v1 4/7] xen_pvdev: Do not assume Dom0 when creating a
 directrory
Thread-Index: AQHaFBZoMLHgqbm5ZUeTIEOOIKOHAA==
Date: Fri, 10 Nov 2023 20:42:23 +0000
Message-ID: <20231110204207.2927514-5-volodymyr_babchuk@epam.com>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB3PR0302MB8991:EE_
x-ms-office365-filtering-correlation-id: 42f2e465-0743-49e9-3ba7-08dbe22d8b1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9AnWrnyU4cpyeXaqz6rMYJVaIi2R7rkJocbJGcGqLL/P9pMFO09TbONg8nbvbqKlBEVi9s2QfMrLWBzlfs72oo9KgiM0zgdkoVDSbkRadklanWodmrcZDHlPTiGvL3VxmSKBoX7pQcvVg2qRjSir4tFENXtcvLNHZI6NhX+wn6tZQnzTYqFE4SJi18cURyQpeB8GISrnBWJmWtIEdZ3pBKImEQDCt3fqWkNP6oXvLv12Q3Fzk1UtSP2Iegx/54fZ8XwrZnkAWQQSWZ5fyl0hWfg4TviHVZOZgw+bhEkdLZsxmrA+W1eAyzpMzzeP6cUpidYkT7BtcodF67mWVcSeugY3cRqLKgEnfUzRLM8s/O7SGe/IaItckBw52iXnqw6zDWRwFUUkDkG0J+uzHzDjVB2YbSC27yVatJzlwYxh37sf+Q/kkW+KMAHIpJ9kI1tTpu4uWc7EaRHXIHIgu4TX+mgYYDe14t6LqVCoJR2k7sSS9oCCBLKw9HGK+qtL7qGe4A6N5f8F4Gue3tHUVCDUq9SmeIgKhVKZt+lfb1JOfuw7v/Kf7dfRVRYIlk02YzOTd3Aj5c/MgJ/0iw+5NbN0508KKdwcGegDvtpjHICRhLTzjLhdQkEhmHem4siC2Xu5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(41300700001)(2906002)(8936002)(4326008)(4744005)(86362001)(5660300002)(38070700009)(8676002)(316002)(36756003)(83380400001)(38100700002)(478600001)(2616005)(1076003)(6512007)(6486002)(71200400001)(122000001)(6506007)(55236004)(91956017)(76116006)(66556008)(66446008)(26005)(6916009)(64756008)(66476007)(66946007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?6jAyKfAeJlgQWEybzi/BOuxfXmGcsnT+2Da9xE9MkpQRhUhA9osB1o72SR?=
 =?iso-8859-1?Q?p2hgyoBs4RrEI20M4b0tBPTpfJDlxW+mjMLUtt5SdCu8nSlhROpMP4CG/I?=
 =?iso-8859-1?Q?SggdmlJjrU0coEDa+Yc0wQ+BZQkmgUGUJUFkg6WOhXdmWDqW77eF38/8g0?=
 =?iso-8859-1?Q?FKkaNfIkthwudliq7E+16Na1DiM+msitgNicGE/KIejRESmAn/yMw3O5TD?=
 =?iso-8859-1?Q?QPvSxBMHsa6hD1DVb2A7hdaybzU/0l2JmcJ44fuAFVh1mvAxSIfSyoyZ+9?=
 =?iso-8859-1?Q?/bNapeCg+OzrSYwwYl51/Jkukxorj3TxM/BEnIL1yKOGd3FqOTaOI9c0jx?=
 =?iso-8859-1?Q?jnoqN9s9lPArIvJFqsEvvohfYzOQMZYOcu4dA0wmdC+RNy1Iwx/R+CPaL5?=
 =?iso-8859-1?Q?kV6ZFVkF7z4sb+ddTB8X5JWewm5PmxqosUOFe7WpsPOLkdIryRzj+m7Uxt?=
 =?iso-8859-1?Q?5GJxWGae5sGYhdg1RfelzdeU17keHI58Yk9pFc7bUTl+8eUKU9zGro+PCe?=
 =?iso-8859-1?Q?xnS6K/bg9tiJwvcUrVwN3sk+R+eQc5e68eKVnhEhmFFj+BtjXCsWHEzc5g?=
 =?iso-8859-1?Q?dBEquK3aGM73HxFMJm5LuZufugIZaEOnuuCQKj1jy5j3M8RZS13QyuWV9i?=
 =?iso-8859-1?Q?2DNzMBmzb0a0PlhPCuZfyR9YGuhXp1bdJGl7VvC4HpIBdMBTpjGU9fa4df?=
 =?iso-8859-1?Q?vKLajxhLD1YW1QWl5KfNFGdwmUDEGLT9Kh+MiqIWMdgPs3YvbZbqaihraz?=
 =?iso-8859-1?Q?NZ1+qU5LUDy6kAIBAak+JsrFHWClRlLr1ZY7wSXh9ELP0ge+Dqh5H0vDAW?=
 =?iso-8859-1?Q?CQu3lORxo53f/WS4TMdDbzHE7oZxyLKoIAoOPdbWRODF0hKv0EX08UxfJy?=
 =?iso-8859-1?Q?cTytG5g8fNs0ZoInzjCqKKbBAv8VtN5WreBAupvqfSlPetOLf0AIC0JBUO?=
 =?iso-8859-1?Q?tRagy7e2YtWykNujZfXujbJ5MLQ/Dck9KIq9XTQ8fKh7j1j1aNhpWtYVkK?=
 =?iso-8859-1?Q?jMdv3YYXZlckRXmiYHUvTIiN7Svt0LcfOHcpfyIMv/+cM5fiiji/dUfa3X?=
 =?iso-8859-1?Q?V+Xf4yjX+ne3iYoKQluj6dSZmJIsPTTq3Z0jSF9kfiYdFT4MzGVbsjL3OO?=
 =?iso-8859-1?Q?3EaPJZ7jfGr0EvJC5k36/DmC9pWaEillI7If/hH6EGTG296HNdsW7FQNwY?=
 =?iso-8859-1?Q?v3MV9i6e3cm6PrGwU3lL203YtBkMKsCuiEbl8XMycyexdYGm8gTYTJqAQx?=
 =?iso-8859-1?Q?/DN/CWvuSurktyfLsRP0fABKTS3CFcRCjyBHy2psid3ahP44j3e2uPZTml?=
 =?iso-8859-1?Q?ZkOMUI6dnhdnRwZhX6Jl2KWZ2J7YbVEQNh5v7yZEJfIGoxJFX2oXExY6md?=
 =?iso-8859-1?Q?EpAlhPRKxGNH2eiHMfpRq0AImF1+Vbjs3htas8RoyjRQnQbQL09pqoA+W+?=
 =?iso-8859-1?Q?eQDO2pvns1VtmFXvWtsqeeVlgkfatTfjOhaQZR/R8yMcBtfhITnaTuzstS?=
 =?iso-8859-1?Q?bcng2phJV6gDafbt1sM+7PRgGfPB0hBSScCWKGZ9yFFypzCm16YIYGL+bn?=
 =?iso-8859-1?Q?hvReQTvG3CVF6nQTNGGNOw8jKn0HaiNSapWC0PpvUaEkFzZypLVnlS1sPb?=
 =?iso-8859-1?Q?eIX4LsXjapL+zkSZp1DbBd0nOoodhH4zqeB+9bPgoUJnAh4LfRNgRA9g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f2e465-0743-49e9-3ba7-08dbe22d8b1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 20:42:23.2225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fOncCzEfv+h6yDb8uPraSPueoRoUPP85zBDlMuxCDhfgt4gtBqdtx6Y2sEGhkSqsVvfcfTdKOUFOUlLdCV++GPCyk1lQUUtIdY7v6xsUBdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB8991
X-Proofpoint-GUID: w1g9lBFxP7b-80B2x1nYalgPezXtntVp
X-Proofpoint-ORIG-GUID: w1g9lBFxP7b-80B2x1nYalgPezXtntVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_18,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=593 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100172

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Instead of forcing the owner to domid 0, use XS_PRESERVE_OWNER to save
the previous owner of the directory.

Note that for other than Dom0 domain (non toolstack domain) the
"driver_domain" property should be set in domain config file for the
toolstack to create required directories in advance.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 hw/xen/xen_pvdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index c5ad71e8dc..42bdd4f6c8 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -60,7 +60,8 @@ void xen_config_cleanup(void)
=20
 int xenstore_mkdir(char *path, int p)
 {
-    if (!qemu_xen_xs_create(xenstore, 0, 0, xen_domid, p, path)) {
+    if (!qemu_xen_xs_create(xenstore, 0, XS_PRESERVE_OWNER,
+                            xen_domid, p, path)) {
         xen_pv_printf(NULL, 0, "xs_mkdir %s: failed\n", path);
         return -1;
     }
--=20
2.42.0

