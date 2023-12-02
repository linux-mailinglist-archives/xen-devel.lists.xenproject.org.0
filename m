Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC669801978
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645838.1008328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9En1-0004ZA-Pe; Sat, 02 Dec 2023 01:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645838.1008328; Sat, 02 Dec 2023 01:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9En1-0004Pb-Eh; Sat, 02 Dec 2023 01:27:27 +0000
Received: by outflank-mailman (input) for mailman id 645838;
 Sat, 02 Dec 2023 01:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9Emz-000272-JR
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:25 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1b1c5c7-90b1-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 02:27:24 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B20exWa004068; Sat, 2 Dec 2023 01:27:13 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2040.outbound.protection.outlook.com [104.47.11.40])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uqt8mg1hm-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:13 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:08 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:07 +0000
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
X-Inumbo-ID: f1b1c5c7-90b1-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsTiag/Nyo8pa7Cp19bBLPah6EcvNwpz9qqJWOKb6wSn6n/lTDKOzxee37RRRXIoYVLuxCTz4HEYUmA8sL8QzfANiGU6hkgwB+wtKpQh15KL672PUnTIqoJwM7aiO1qnvBFdWFeHUHu8myHqV7GZgqjjHpcuDVAp/YhOY3OOnNI5gtiFxQVwJI86VRhuvFK4ivdl3z/64ntNRhPQ9HbUww+qirnuTwUSMa4aeYkhN2EvQ6snpeJbWVZy1HoC2tcxVHma+iMvxwtcXKnBz5bZdeOsErsS7P34C1sSgjB9Kc4wP9WH5yWpe2LRfzTR0MSesE/5Bj6nHwoe93rq3oJrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjuf4AqZ+uhh774QaAreURssqr1arEGYp9N8KZKWT+c=;
 b=N/0vUNF85upo7GnfXXQPL07ngpb9gzQPeLlv+SYOXV3l4RQZAGfUPly/ldYqM4McwCBsp7ZgxFFr+fcArYrQMzYaVQ2ZDWkoOO1BQ02HjJC0VaGrNexf5Z1JBk5ujjqjqMODvUCu/xdzZIqA2QKkP+jaVfJNQGc5euqltpXqw0PGL4lbUCyCqJg3koJ+Djn3abcCg0bFzyw6sH+TQqDwY5Pe8Of1D6oZz9mXcMcGuxB0l1ad9KyiAWoJ3SsqXzi0RFrbNmyOAnGP3UJCRSDCA2TiAI2inZ53LsbYAIS1nJeTL3eT9IFM1V8MfZHwAcvLTwZywnSuIK5HBpAaOun6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjuf4AqZ+uhh774QaAreURssqr1arEGYp9N8KZKWT+c=;
 b=pvDY/UgvjFb130NHJBqlyDf818MizzZBGe4VaNObNhzWFw0Fbs0EWkJyRKbL1srBPOyT+sbXvaLVvhnxwNXuxMI8DOVo2g1eZJ9RixdKM71SqAl0BpXfQn3tnUpKQFwcIMS8tn1ygYwj43EA6+LNisvbuK1rgCXbHeNHjzggu43h8pwejkTKGLnkOixJGtRXTq1quTwJaFnTv+gW71SN/gdeaq8dYJQRdlLmVTyY92fGVAaah/yLHJcfaNbihqp6SbAUnaaNic3CeM5dcamPBwdOsr7P7mouqisq/h7oR6AsGfPBZnDH9YZDYo9SOmR53ntn4SNVIjgUxx8PB2xqzQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 08/17] rangeset: add RANGESETF_no_print flag
Thread-Topic: [PATCH v11 08/17] rangeset: add RANGESETF_no_print flag
Thread-Index: AQHaJL6oAOK+50zr5Ea10ElGDBGzrQ==
Date: Sat, 2 Dec 2023 01:27:04 +0000
Message-ID: <20231202012556.2012281-9-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: d63231e4-0d73-4807-e57d-08dbf2d5ccb0
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bfujD/gXSTsGuZxF+1V9JRKOHyLwRq8rQjOHQQ180quws1TZu/x0opCGLWdmu/0quYEaS3svecZwyufC0uZQna5lpjmUApQukhzmjTzJniAbK/ssE6ahCMZlxA1/i3vtYRuFip1MvU5Z2GDQ7+atk0sh3883ZDTSGjFnRmbGdisLoMX+bLNz+f8+CJfk+WaWjHeiUKKsV1jOfOfEOtlp7XCzzXcQZ1XbeJlBKj7SsGRu2eCpDKB0ozwa+Mw33KRKRJ1Nk/odRTUgGMC7u5fhhHL24J6ki3yEqRnxknxV5i2z4NXA6rh9mxXU61YnxSn9MHcDZ/qtzZ2JbnhBK3fp+c9XJk1kcJUsxjonS73zMuGzRknsQUCmUn6W20HPA2k/yVu33LIoTbSMSUdQlSqHfSeOSiwTxVkuxkTSJje7i7WtjNBcnvjuBy/6DTw3ppvCnkHsiz3jW7ztvQjbtDDzDHezbQt3VwnfOzmqMZulBTClQ7yVFw5+7Jl1TiNFZP8Lvw5Kv3qDEv123ecQt9VkjnrnOhT2G2ZwadnS+8nG8HHx8LXGySoEqo0L/JRQiUyqml9ICY1hqu8eRC/nT0VUqyRnOmz2l5dknbPTeoKrJeztvOaVufeQsIoAMIEw38Vd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(107886003)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(6666004)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?VaCPbk407zia+di7zjrgr8/yQ7gcnxIMTlnigGXqh+dQClnR8ON/RGzYDi?=
 =?iso-8859-1?Q?jkzaM/Jevlw17Ek+19IRkJAOWfXiLoBM38NTpIw2QkQX5Sr/10c7u3ayea?=
 =?iso-8859-1?Q?zIutHENRI9p2kqSIADqJniYYr30nE4sGOSpzlbpZFkVbaayytuNPLvOQTd?=
 =?iso-8859-1?Q?Z34097aFpdMdYxGoRGW7ZyJTI2DC2uOU+uX+x3kl9VSAPpmxYkbs3JJayY?=
 =?iso-8859-1?Q?tMgrT7Ua57GI6m+Qjr785P9RPHiTRbZnuP+2dD+GPJKaBvc1ehCHGY9IZq?=
 =?iso-8859-1?Q?93kx2UPhPkQC1H8L16QEQE8fhOXSohqwL596W6+1W3kn0Wx04JIbitkO/w?=
 =?iso-8859-1?Q?O5POAbIS7gNahhbhZW/jmolNAHoHoSN+XO5jkkYnPOkUKHRSuMMePBPQeJ?=
 =?iso-8859-1?Q?YT88TNY3bDtuZXTdq+ZYdebYDHtMT4fLts54tZV0mWzqxTIuYRzAKImEco?=
 =?iso-8859-1?Q?JfbnaiX0WammfBZylgfloFwCNpXOgZaBDyMupdM59dZ/Gskc7APnjgsSMR?=
 =?iso-8859-1?Q?zRMYK2Zavh2lcaJEHUiKI9lqYIhmkoZv/R9V5hjxbyAGUSsRAOSPrbz0xO?=
 =?iso-8859-1?Q?Jgd7VMXAyl0I2+9KzT/58ooLpRLlKz9mxolzb0coHpNehyq/ESFltYVNp/?=
 =?iso-8859-1?Q?J6Cxez+Rkvu6aw4/cTLegyNyu0wDYeOWKSDLitKHdCfbe/3RLSL2PBW1Ws?=
 =?iso-8859-1?Q?S+2pGZ7CFgOczDtUOGjujXSNyqUxZOqbW5evPQ3BRZFR8w0vtUuX4zD/pv?=
 =?iso-8859-1?Q?2rkbHT7kXKXMo+NmjyFB9Ts1Sy98rQOHsXinJXUhcbhKk19s3W97ovbCPY?=
 =?iso-8859-1?Q?dqTblt1uq6Vocn1VGhOFFr/0rQsN8dKT1UYAmb88Zc/Ai4hYQKAEEfOnGI?=
 =?iso-8859-1?Q?TsiiHTh3VX68hqClPyqbjk+IdX0MD7B8ppYHVwtCrg7pDnYKV2g6OYowQv?=
 =?iso-8859-1?Q?h4UF/FXoYG/skJn8Lw7nI2uaKSoxz5cmVxp5b56A7C2ohe0r0x9fOwqY8W?=
 =?iso-8859-1?Q?dAAfhLuVV6D3YrudgwBq7y/a3RALuvAcuBVBCV17X+GdN8TvIt7AeaTG0B?=
 =?iso-8859-1?Q?a2k5XIPgelng8MdE1WodU7Rh/WSZ4XO3iFiThz874gjJqddAi8tPxL+ShF?=
 =?iso-8859-1?Q?F+huqfe2vJP8eLEjCcy3HI/XwMnvtQR3zLimaRgHqkktLoCyr791uTJovx?=
 =?iso-8859-1?Q?SlcEL2oR7R8oBAsREi8uvYZW6HIbUJYhi9oOnGHPcL5jAEJl56AE9OveKB?=
 =?iso-8859-1?Q?JswLfc4/wiSRJxK92whpnv+kliJF52kDk3xFavHl2LGqBoCrC35krwzMP1?=
 =?iso-8859-1?Q?thVIOHCDvakUgos4R16K2+KqDf4vjW1Qs5y+ydtsP9sjbKzhIO8cVj190l?=
 =?iso-8859-1?Q?hJ2a6ODumX7aL7mxBI6RCytDf016oTPFBlZExLfCn9o69C0NxMA0daRLNK?=
 =?iso-8859-1?Q?kdGzLYKrINm21/D4qCr+QmTqF21CJIrhDdjZwqMgnr9fIjrtKV183DmGMh?=
 =?iso-8859-1?Q?lewLGRSAua1HtHuI0FHtLB2IQIZjGeEXua9cSMyyeaASDW+H3JpAQ3oAqX?=
 =?iso-8859-1?Q?OFFXWXZLZqTQVEzNovTWFJSjBTKCu60RkkgT3aW06Qwia6xFoGowld+p59?=
 =?iso-8859-1?Q?wtnwv4xdiIjxCz+uIRFIZtD56LOXLiH5T3ZSbD8Kwn5dFepBSwfWLtZg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d63231e4-0d73-4807-e57d-08dbf2d5ccb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:04.7658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qZefivLQ10rNr+I3opfWEfd/HHOvkfZVL6SBoP1WbOaOJBXBGDaaE9PgjNi9j8Ih3GFhH1fD4fzyEkm6MS3A2o+iHmMgw0vLysiUyCE7+wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-ORIG-GUID: M-rz3I0bjEPDnKG-omNko7Zd3fxZyvrC
X-Proofpoint-GUID: M-rz3I0bjEPDnKG-omNko7Zd3fxZyvrC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are range sets which should not be printed, so introduce a flag
which allows marking those as such. Implement relevant logic to skip
such entries while printing.

While at it also simplify the definition of the flags by directly
defining those without helpers.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Since v5:
- comment indentation (Jan)
Since v1:
- update BUG_ON with new flag
- simplify the definition of the flags
---
 xen/common/rangeset.c      | 5 ++++-
 xen/include/xen/rangeset.h | 5 +++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 16a4c3b842..0ccd53caac 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -433,7 +433,7 @@ struct rangeset *rangeset_new(
     INIT_LIST_HEAD(&r->range_list);
     r->nr_ranges =3D -1;
=20
-    BUG_ON(flags & ~RANGESETF_prettyprint_hex);
+    BUG_ON(flags & ~(RANGESETF_prettyprint_hex | RANGESETF_no_print));
     r->flags =3D flags;
=20
     safe_strcpy(r->name, name ?: "(no name)");
@@ -575,6 +575,9 @@ void rangeset_domain_printk(
=20
     list_for_each_entry ( r, &d->rangesets, rangeset_list )
     {
+        if ( r->flags & RANGESETF_no_print )
+            continue;
+
         printk("    ");
         rangeset_printk(r);
         printk("\n");
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 8be0722787..87bd956962 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -49,8 +49,9 @@ void rangeset_limit(
=20
 /* Flags for passing to rangeset_new(). */
  /* Pretty-print range limits in hexadecimal. */
-#define _RANGESETF_prettyprint_hex 0
-#define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
+#define RANGESETF_prettyprint_hex   (1U << 0)
+ /* Do not print entries marked with this flag. */
+#define RANGESETF_no_print          (1U << 1)
=20
 bool __must_check rangeset_is_empty(
     const struct rangeset *r);
--=20
2.42.0

