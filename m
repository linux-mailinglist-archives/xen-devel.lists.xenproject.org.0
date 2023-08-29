Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621AA78D04C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592517.925329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80E-0000yP-E6; Tue, 29 Aug 2023 23:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592517.925329; Tue, 29 Aug 2023 23:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80D-0000rG-VU; Tue, 29 Aug 2023 23:20:05 +0000
Received: by outflank-mailman (input) for mailman id 592517;
 Tue, 29 Aug 2023 23:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb80B-0007EX-F9
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:20:03 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93f9ed1d-46c2-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 01:20:02 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TKDecm030691; Tue, 29 Aug 2023 23:19:52 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3sshtetfcp-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:52 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:45 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:45 +0000
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
X-Inumbo-ID: 93f9ed1d-46c2-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Icmb26UvD1z+KWlMUVemiuBpEtTYvaSNQp3kEVorW1qDpwi8uAjXlH5RUgTvJsIiXvI/kyfrax+hO9o3MxQyoGKMi5eEMInmiYt6VQctTAZ1X5U0KO6YQnigHIjTA41jP8cbpIYhxvp67zi4BySnfI8Aj3F4ZIVUWa5Bl2uw41rXZYRwOvgqDvpE/kTKX9KnaMFEzF3ydTpKpxeEGsUDW16pr+GRikRlgYrv7Z2Nbz7rPytGSPzZkGsMFb06jkW2dD3AWcMFLNhFBacwBuULat1zCwA2ZhW29yBom9eCIiwJcB0es3AgVrTC/VEZ0nIy/++LWUBD0PwelNIepABoJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjS0nFuqFuSdf3gFcW5nJsYmqeDtBC3mtmNRbovyY70=;
 b=Ziex8bShAWZYMFItYPTilQGCa0ODoINaSB0WQnA64C700hGGjnM6tYOHb3u9n24Z60FIZStAnRTeicxc+eQksfsxuXBngCQU0iwS6mOV8MZgtr8/vEZnLrCJQtpKM09rAiDeK3ShuVmMtqYwNx3u07lQWIKxhs+dWlLDeTEVEiE/u7E9d4MvyzExYDHnnXtuU8uQA+hX9p1Z1WMMdkukc0SIbD9i9BgA4t8M9T8p+jbjxWY/Z4K2mRGljwaKRCzAqHFBftgf8spxl6znICtv5SqTvWwyDmhpY9z8gAW3Ktu0ZyKEAOAus45fA0WA00nRqMNNAfvGxvfzFp30EOS8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjS0nFuqFuSdf3gFcW5nJsYmqeDtBC3mtmNRbovyY70=;
 b=f/b2FGT43zNP2gXa1t+OzlJMFdUSSxaT5mhTmllAggFLCnYZh45BHPzK9A2W7TwQ/uBGCPNgVsi7XkBn9MTSImZL4roYTfQzL/OvoY5ZibzS54GFhQDXpKmi8JIAtPXziWLvnRLw5jM6Ie3BY/7rNcurcfmPmjdnhUAtYmjzuZLxGAoUR7nzn+nEnzp6rwJOdYSJJc1NIUHM758jtJrdSr2Rpof97+6ZaY3KNNJjz/Co/JPlrgjha6VfuYBRoc/m1ESZpV3cqpMW8sc/CdJfEwpb2selKXACnTlUEPjm71zlk/y68lvDuLa5NTkU/8DrNvO6CMpEYGmUOmMz8MMakw==
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
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v9 07/16] rangeset: add RANGESETF_no_print flag
Thread-Topic: [PATCH v9 07/16] rangeset: add RANGESETF_no_print flag
Thread-Index: AQHZ2s9LxSREsqGkPUWRRkHWekAfhA==
Date: Tue, 29 Aug 2023 23:19:43 +0000
Message-ID: <20230829231912.4091958-8-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: adf7c655-f039-41a8-0595-08dba8e66e99
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KgVX92iPgIByspsHr9hFTisn4c7Z+2+BcslYMswnbeedK4t2VW+WLsl94qjgdyw1RY32ecQCd3YAW8rPnZ7oA7CEupq4WsYSwNjkXcgNtpCAQbkWL+jDnKB1kIvjm9R3sy1wenCzxMUgfG0ERllcazBf4oT47zR5KFO25Fz9vazPx3z3GDFK8cnvEuY/FcOWOV/1C0eod9Cnf+9It0LHlzStke7Sl3dhbNWZQjD5RrE2KdRuVNL3VjgANehQmrGMIeCbCBdxIuFcLtZ8V6Lck/scNu+2pKapQXlXJkSc7RhhIv/L1H7jq6/12iFIXPXbkiIuxOGlRo7OZamAw8FNC2uPRVsa9MtO4ijXW8hsCavGgAwLue4lqQSpHgBOpdtv4C7Hods5VLrU8ADex7FhDU+a37iYdoH2bpAxC3XxtYcmXTTOKMtcU1KINOVQpiP2SL/GQhXiJkv0Ssb6L4F4ijZ1SiA7NzUM626BsuWQElD4buQl9lqpwC9ja/a8tq11y9b6ILT2fmB/01NVfmDKll6QVLrhZohQU6jSKsroaRhkl8WQVvg8zeirxc8eA8cg/z2LIWJcY9as4sxB9uSDFyKM0SKE46zwgyv8J7XycNZX0zLP62uLdEZIBswE5Jao
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(26005)(2906002)(6916009)(64756008)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?2/qme8rgsetRaGl4VbBjMRw8phHCEvzFd1ZSJMX/I3gsCQvCU+Yu3Vmp/x?=
 =?iso-8859-1?Q?h800mVJXBignmogGzFyG1uxrbk6j7nKMItX2KQ2YnyxlsQD1ASkTWCaoar?=
 =?iso-8859-1?Q?HFi/pEGY9wW3XDTHIA/lpJmQNsR6iqngL3Wp3guwyITT+1fvZ6Fm5boMpk?=
 =?iso-8859-1?Q?H9LWDgfUUuNHLgPF9E0WT5FZ4ik3V13CLHkXkfmiyO77eVg7CQw+kcMmMi?=
 =?iso-8859-1?Q?HoRB5dHl0r7v/cOfajFd6QY/QwpV9aVo4Lm1gcYeBL/TX/3jhvmvW0rsdt?=
 =?iso-8859-1?Q?Q62JPBNDSDviVVM0UTtY4iI8pHZIUuFVubJTdrkgktliKbtBgnSv+Ksp9c?=
 =?iso-8859-1?Q?jjhmGYM7sECd3vLgbVbVYa2vb9rBEwfJ4Aj+4OH/ERkJwPlxGZGLfC1bcD?=
 =?iso-8859-1?Q?INLr9w8SluZHEVvqkz9aoZwUJGUGcCbvu6RfbEGizjRe6sLR45DN32EmZv?=
 =?iso-8859-1?Q?s5SuK/lq1IBqf4eiUXn1Wk4/k8UFRHZQovQbr48UM8rtagLh5FC13qLVxU?=
 =?iso-8859-1?Q?SkPYhSpVLHTbJSYYFq5w16aEwY/cEV0ajUQspLoCnjetXClBOdmeWZ8Jci?=
 =?iso-8859-1?Q?HOjDbPg6x+0tYb4+Ld/Y1ntZSH2hux7xU6iIjA9M2W7elbB/YcPeweCZMJ?=
 =?iso-8859-1?Q?sRXCIzcT79Me3dH7eJHWXoJ7nXmslg1L62NpXqmV5KGO6xiPtkVKhdBdES?=
 =?iso-8859-1?Q?tqb21LvTk9YO5mBR1cdyAm18bK7mPL8W/bBws22aeNCnVBvGBKrQtSCZ/V?=
 =?iso-8859-1?Q?uICre19axwz/+cVdD4MQEWrTwKutXwuE0faVdG1AAZhjkGwh8YIY4bTSKG?=
 =?iso-8859-1?Q?5pIpJsFzSa9jv9nt8DKmcIcC+QwUa0tYZi18Bf4WpFHUUV5vKJztM11rQz?=
 =?iso-8859-1?Q?daw7X/yeP8zlyRqeY0uBLTYv5IiLWzUkWZ19/XbRTObYNsuLZnRAUVV5qV?=
 =?iso-8859-1?Q?/TiB7HkOCfabS28iWLpMRd8jjwnoUXSk4kWKO3buSICpWnwsXKydg6YzQg?=
 =?iso-8859-1?Q?tUsWYyNzMRCqK2HkelWpc30AP+CH1eNbg6OKShAhqX/tCUIKO5WKIFzOua?=
 =?iso-8859-1?Q?SzaJORjPcxhObhf1UBHTIm6alYdt40YHOv/VzC2wn+74ggRsvdmXBeuToF?=
 =?iso-8859-1?Q?FgwH1xPvwMij0fyTwvNXxbbnzsXsZPQmdRQpjDwCDMXHrhe2sPnJP4v+33?=
 =?iso-8859-1?Q?tGzax+ecRDkiwqCiYxqQXToWNdRDl4rirO/oDZ4q8V9GuZ6f0FMGJxnWZh?=
 =?iso-8859-1?Q?9PQjh5vmB1/CcxnYjaTn+30sUquLfO+kEVz0l0nXQ9VxrhUPsFYeSXg1DE?=
 =?iso-8859-1?Q?l5FfvLqmSda/G99qDLHr8Xt75MZ56yahT4vDpc/E0V46aBUxEYr4BRloTO?=
 =?iso-8859-1?Q?7eZYHv5P7JdKvMkOljYg9NaHjCdZlo9oefbVKMcBL9RxmRisEFSk8JKlCB?=
 =?iso-8859-1?Q?CIduvpNAyRanSNIdbC6GAbDKJvBXpILvwJIpv5T8Lb4zuGNNMHvnLAsEP+?=
 =?iso-8859-1?Q?GB9zFzCN0cued1/wmUJ5RMFHI1cTBqhLOsS+j/ZT57KY+wWxgxA4QU72Nk?=
 =?iso-8859-1?Q?UvfB2MfoX2Eyd76uximD7ouc0ZkRQBk3XS7LTrSCnf3eATB1BClund35M8?=
 =?iso-8859-1?Q?uPKOiW6aWDAWmDiP7VwvGSth5gTyyfTEJWa5h5eBm8eLPGj5BlvwAzbw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf7c655-f039-41a8-0595-08dba8e66e99
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:43.9995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lHGgbFX6fwHUGgQlP8fjXDF/Xa7c9e2fgZ1sYi6st461q9y+zA+OY1nRTbGijdpyq5dFAqCcmlShldztNfcFs3ILo8Q92rRNr/3FYKTp+rs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: 8qJZuI2FK85W5VOYOAUcscNkg3AgoQFz
X-Proofpoint-GUID: 8qJZuI2FK85W5VOYOAUcscNkg3AgoQFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are range sets which should not be printed, so introduce a flag
which allows marking those as such. Implement relevant logic to skip
such entries while printing.

While at it also simplify the definition of the flags by directly
defining those without helpers.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
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
index f3baf52ab6..35c3420885 100644
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
index 135f33f606..f7c69394d6 100644
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
 bool_t __must_check rangeset_is_empty(
     const struct rangeset *r);
--=20
2.41.0

