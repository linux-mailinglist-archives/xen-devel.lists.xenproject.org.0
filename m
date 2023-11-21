Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270607F38FA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 23:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638304.994742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5YxB-00070Q-9X; Tue, 21 Nov 2023 22:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638304.994742; Tue, 21 Nov 2023 22:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5YxB-0006sm-51; Tue, 21 Nov 2023 22:10:45 +0000
Received: by outflank-mailman (input) for mailman id 638304;
 Tue, 21 Nov 2023 22:10:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/eqD=HC=epam.com=prvs=5689374ac6=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5Yx9-0006PS-Le
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 22:10:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf526bfa-88ba-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 23:10:42 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ALJcd1E031085; Tue, 21 Nov 2023 22:10:36 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2233.outbound.protection.outlook.com [104.47.51.233])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uh0hhgrv3-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 22:10:35 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8836.eurprd03.prod.outlook.com (2603:10a6:10:40c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 22:10:29 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 22:10:28 +0000
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
X-Inumbo-ID: cf526bfa-88ba-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/nCgCGfDFB+pyl2Msj2sfxyVSL0n32Dm8DxFyF2p0ObjzcPj8Lg6v5aWlUuyq5VT8fVd4UswncalgIrzw92R/7uUs4lcZpFmYcds+uppvGqW/KWmUWg8CJqV6ecCm4+WQhlSbLMU05AabCV/ztQjxcYk6xHr90XV7JJks+zHsTC4ptspemH2CFx5DAD4WvyZ8lPVbeYAn+WL3UXUv5sIWTX9cGCeqEgs98dxeYf0GPazrvuzzU5XnxP61oyiSb8DbhDG9tXzMVfOj1xj63bboAc9WydcqRRy/j5bqO4eoFP38Gme2fHiVOk87qrRwbddW5YNYi+lw0NnBbO3Swp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+d1SEM81t/9S27BacM21vX5GsG+JjE3MpWm4AA9xKg=;
 b=oZ8DOJx3Vvp8MG46/jrzRmCBKzeq8v5YxpsPsGpG6v4ygrz4GhviapdO/fuvfVTg+pBE2C9JpQf+hYCnYdf+raJ+rjkic+Cvj+YKu5K7yHFLGpqNp2uW1KvWSdw5lbvPRVHRcjP+qr4ZNIHxB/XROA7LVRJ9MVJ629R1NV8Hz1lIpU86P3m0VStqQRa308i8nbJkkfBCWeROJzqHNFovzHJ1naVdHRLcGe6DoTOxPwgT2cVYw56WWec5Vzemu4/BNSbrjfc7h2ZFib7r4742b6QN56JQErIqH4/xw3jtin4sczBfTYMiLSBGmwkP4aArDOiblYVIbM1QPTxjCtCblw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+d1SEM81t/9S27BacM21vX5GsG+JjE3MpWm4AA9xKg=;
 b=jxjQTw2fJojzkMJ+iXQhd6rUfoZPejwMN6y6/+dnTuTSgUOinNrZij7hYwdLjogCVG7qCpdvtAXAAFKBgIAYcS/k3Im5NZf7e/qS2zHX+6yAlBXqzBYG7YI9J8MOqYoKB2FQBYcPn+iDWUCIGso3e8zzCPMUS8/9IKPbzKwPbFkh/zOE+ewb6MPFYgagBnNr4kvCvA3lK4pGoa2jt6rjbLKCaBDWmbECmZAGkhzghEgkCFMAI/NwGJWfoYJ06uReEVslG8lGjJ+DbdDZLBG69MeMiVeCAxm4A4dM9O4B+sFpTkrPh91VJn0buMWgDT2Ki+Q3habrdhdZXX9/mmSyRw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: David Woodhouse <dwmw@amazon.co.uk>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Topic: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Index: AQHaHMeIsCU+MAEGAkSnPoa9ThBNzw==
Date: Tue, 21 Nov 2023 22:10:28 +0000
Message-ID: <20231121221023.419901-5-volodymyr_babchuk@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8836:EE_
x-ms-office365-filtering-correlation-id: 545a00d4-deca-4314-2d77-08dbeadeabd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cIHSB6AFD2DGneJBmtsW5+mDO6ubkuXeZx/61Yg/DQcHfi/ZGJxgb5SwMMnmcVjCHmzRKmVHTKyglKEm2lUkl1MQTefLh6UOJ/DBGTJgSDgELQv2mgEI1fnTvUX0HzD6xE+mQ8TKo6mSMZVZO2Z5uPo1y//EE4FJm2UnXrAD816+ngKA6v7ZqJTUEnBcEUNT3vW2LxeejMEbhing4ACKHjduUMW8ktbisJB13xshjD67HF7/BSa4ZK/dcz15YMZO1InyPbj9ox8HEeKVT+uZxihT0s5kAjpc1K/TzUEVURChGxfw8qQ8bgoVAi7cKehOxNoAqg1HsLlHtMnFLvF1K2VHj2tGrvmHMBlVJkPDiBcNVdVpUcIMxSqzvHqF01Ts01v7ANwKQTTVkx9FxzCnjtkArmtodbgzwMY34Y2cVo79sWzY12fE8/9qhEauZizOeRlF1SEULC5HeYuifjOOR+FHNE0JZq2h8Y0EQsXaCtUB9iCf4Fj46n+3Om/hvyXjsJCao2FpyYb9LIn0SrXDgFeblmMZUKUMVWga/7SNqYY2gezy9NX+poY0EO33pZfYQzrr7Yyxiy/t5NJSqfuDexPk7XOk/qyUort6K/nPBhM1h/IGcH61swxuUT12oPRd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(41300700001)(86362001)(36756003)(4744005)(5660300002)(2906002)(38070700009)(122000001)(6512007)(2616005)(6506007)(55236004)(6486002)(83380400001)(71200400001)(1076003)(478600001)(26005)(38100700002)(91956017)(66556008)(66446008)(316002)(66946007)(6916009)(64756008)(54906003)(4326008)(8676002)(66476007)(76116006)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?G4Jv0XESz3TozlyoYvkV0ymZDP24gPbUsPL/Z0eJvav2WndcnaVdXxA+rT?=
 =?iso-8859-1?Q?BW7OcZ81/7qKmBnKvymh4sZ2bNQt8Y+l9kerXfpjXGpAZsgzOXG/GIWM3O?=
 =?iso-8859-1?Q?pButV0nFSyB0T8SQrxi61qMbx1XUEVRpjLPk6txiqtsPDcBEKUSV2tXTKY?=
 =?iso-8859-1?Q?U9h788j1iT3vy6EB1G8CoI/Yy0TYBuiE7kC0EhylLznD1cX6mlHhhC/3YC?=
 =?iso-8859-1?Q?48hkNe2tfVntJgG8Mhaq1XOXZXv0xrtLm/4dM3e05WUsbjWzS41xzG2ZzG?=
 =?iso-8859-1?Q?3lyBYmg/sSqShcFY7tSSIkfMyhyOT4IHdAUqcbZURNUGjhyaZtDQ9OGGqt?=
 =?iso-8859-1?Q?ORhETj0nio53802GQPs5HAcfTrEyxA0KpeJGKDXnBOR5bSy8moMn4bcnB2?=
 =?iso-8859-1?Q?86ClVwwuIkB6jibiKxmqhLRBLkz8nUJtdxHRq35l+767ffN9qQqLHrDrxR?=
 =?iso-8859-1?Q?fgc6zarRAgJg8tsq4kZJy4cnlJg4ZBJjTBw7wRGXKg53QekooJsr+YqA4u?=
 =?iso-8859-1?Q?v09qc7fxDDO0vTY4K5wxF5RKfclVThBbHOg+/9lqSYU2vOsbjESUpPE2XK?=
 =?iso-8859-1?Q?ez4zKQuKzcziAQ3aT7Bog6/HAyn4MCL63Dp8tMKZchh988UKtjgZcWjV04?=
 =?iso-8859-1?Q?zhPx5I9kqj01xdKW4MGhPdxicy8wamQ8c6ZZEkatWC7ECOy1vLBivEsD4h?=
 =?iso-8859-1?Q?22x2zHFzum1s4MTg84vqEHKgykE7zYwPAQO6gDj+YEfEJqPyKkrRmRKT09?=
 =?iso-8859-1?Q?G4bSJtwwmfQL/J58nIhsNGaF2gAQG/kTuqEV9go3X3ucRl3qMaDTGtv3RF?=
 =?iso-8859-1?Q?qD5k9b/YJV3bR8ZCxPkXNa5AksLPPBk/QF40WC2t2SO6PQ4wCbCi09GwPJ?=
 =?iso-8859-1?Q?zuEZ+3fGShDfPIcwfcATJfpDtDObWOY+pUQxl1mx9mfYrKeRWKU2NFAv3o?=
 =?iso-8859-1?Q?809sPYiuzTOpz/XwGQqQGHf8GvaSF84WNUhI2lP/3GcqkCoh+AnUDvv8y0?=
 =?iso-8859-1?Q?wHlG2DplClHlMzEwfKziwpBHazU1KM9XGOJXxfQLYmwTz/WS6ZdKpT9awO?=
 =?iso-8859-1?Q?1vVsgIU2xQ3IxvzNGsvhJX2HfONphuMQbOrYtp3tPO2/LpbW1dELnMnqis?=
 =?iso-8859-1?Q?5aMERlasr23+ISHGfDKfGDRNrWxYSr7PQQhoEeUF4WbpLh1kEkOm4I1Irv?=
 =?iso-8859-1?Q?0tEPVBC8tygZYx6HkO7itMYB7fOEDPFbxlfyHVflA0hKWAaoC/hmkluigt?=
 =?iso-8859-1?Q?apfW5cORQLz5VrKNYTt+tzM+Cbf1eF3fObvoFsfP0xnX4pVhnOyNwV233b?=
 =?iso-8859-1?Q?92wMwXlMnmQL4UK9k4+XI2jtIZVXzXUxfcLRfbScsdpL2gAj1d+l47SDv4?=
 =?iso-8859-1?Q?PxIoHC5ER4V7WAdOrAPN4MrieRDg6FnzS7EXfkV2bwPfOb+YWQdybDoHp1?=
 =?iso-8859-1?Q?V6BdFupayKmJmipgzD+HbEUc/mZwtKe2cCEMOX9U0xPyPBhETN8o7OSldq?=
 =?iso-8859-1?Q?hB3/ruhQMK3f0EDfraCBwZcM3SCXtk1B2F0ReR8Fl3uS52TTNJ+uLhVxtr?=
 =?iso-8859-1?Q?eGIRkLIlV1NKb44NgnIHwig9xw1U5HjYzp0E+Gl8I3MmiXH1NOIyOP44Sz?=
 =?iso-8859-1?Q?PkrXWMuPx25d+G/1XVT4S/UNni2GQmsdJxKePi15DehtvZcGRyXREhmQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545a00d4-deca-4314-2d77-08dbeadeabd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 22:10:28.1210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uW7UMPLSQQyji7xe6iFZORqUN6bSmHCUVn3iypn1D7SnJKcRFUufVAjZgj0QSB2t3lCuX4ZMqEB0rWUkeBtdMb34Uy5q+W89uSv6PYk06x8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8836
X-Proofpoint-GUID: Qg0I4U_gvcCHDfg6Jlr6NmZzciR1x0UY
X-Proofpoint-ORIG-GUID: Qg0I4U_gvcCHDfg6Jlr6NmZzciR1x0UY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_12,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=624 bulkscore=0 impostorscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210173

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Instead of forcing the owner to domid 0, use XS_PRESERVE_OWNER to
inherit the owner of the directory.

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

