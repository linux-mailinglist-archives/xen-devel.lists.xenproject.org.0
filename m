Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C927C75A378
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566257.884861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb4-0001xw-Fm; Thu, 20 Jul 2023 00:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566257.884861; Thu, 20 Jul 2023 00:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb4-0001lG-4w; Thu, 20 Jul 2023 00:32:46 +0000
Received: by outflank-mailman (input) for mailman id 566257;
 Thu, 20 Jul 2023 00:32:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMHb1-0001JI-5H
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:32:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef7930b0-2694-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 02:32:42 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JMeiB8017190; Thu, 20 Jul 2023 00:32:40 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rxgyx9k43-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jul 2023 00:32:40 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7783.eurprd03.prod.outlook.com (2603:10a6:20b:407::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 00:32:33 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6588.035; Thu, 20 Jul 2023
 00:32:33 +0000
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
X-Inumbo-ID: ef7930b0-2694-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSEuixspl4E2XEB56BGXbHZXRo4kb6jXMQAXgyLmNUE9vkTINhe7m6luyKjgijja+aiHWfjuFtNQ1BByFjlRrVicA2+7p9SqmkRDtrgO3+uxiq5WeghW3SpZwKE5XwASXhwXckWO14+ZgtFyWe+l9yNxup1ZkHYiBYYWCkoE+b801hBZlf2kybXPh1hWDoYwD2So0zudO5turdYPXdG7pCA19aOOYnYANU1f2dz51g/kr77hvFmzjFOcmCmDvq7mkxeNgW2zTLBcvQTF84xIuDxH1Lfx8NQKWkuEwNT1J2++5p36L/fmbAJwPlly3HM019fsYwJCfCKtSHtw2L2LUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnyVf/Quc1OthOHa0YYbOyyYyHBFi9n/oxj2Krygg6Y=;
 b=mM4C+h2U1tqNWIRHFXzDEpV2J6p5+d21YvbuSmYPKDICPIYj7XkmXnQziVtsQeAVFgJRM+Jdd1s1M4WPtccgXKyLCHRssaeuhIt2BgTz/p/KgDMMAp4OTqJSx+Ls74VlsbaC3QVRBPkQJ6jNBNdCZf8bZooUlEp9gVVvKX15XFHL5g7uFbcKabGVSos0eC3xOjFQ0u8roxvIPMUo9gtworAOF8g4C/S0xBNMO3T4+F5rUPmlU9Pttl5JxON2yILcI0tgs7voajnJp3oXAcljcCMq5tQNpELSKuveKkkYSLgNeqkAY8C3zyjJSJ55GgBP4bZzNjUaAmrKG7hhWe5y9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnyVf/Quc1OthOHa0YYbOyyYyHBFi9n/oxj2Krygg6Y=;
 b=BxrKeQvrH7h/FwkxuK8ToDD09fsF6psZJw7cOl+3dU/PrHWNPOCFmTeszWRjBPaXXK1H4pmF8yUsfxrxdMoJ4vHIp7oWfBOjRCUdBzSggYAaWvC9V2NNcVsSOWFPan3hdZZJrSRstmXAniMuQsROjEr53RjQJWhIczFSgV408ynpwfvTQz97crpMZs6LAIkCqYQdFEL3462x0d8prEfuDkazABjsh+b18TCo8ldP8loIynOHkJqv/r9QtCVs9/JMXsxDjlndfCrQBY3EAjuPwGAe2oTh9wsjShmG9f+ggLDoQJLfGhOqZebJANLnSa8EwWgUkbH9In4VlHYJuroI5g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v8 06/13] rangeset: add RANGESETF_no_print flag
Thread-Topic: [PATCH v8 06/13] rangeset: add RANGESETF_no_print flag
Thread-Index: AQHZuqGsAISBZpl7eEC6l+liOUz9ag==
Date: Thu, 20 Jul 2023 00:32:32 +0000
Message-ID: <20230720003205.1828537-7-volodymyr_babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7783:EE_
x-ms-office365-filtering-correlation-id: d09c8808-874f-4f42-e819-08db88b8cf63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NPmnq0ySwCmiCn7Px5F95uf8HA3AJITLpfPTnSGVBO26nPxxOzay2MCT2SWtYfkBQOD7BzMAMczY/BjFZ72NHL8anyOjW5wnpYZBlUdfyTejiiNwXiABfvYEBBWP3kQFLtb2AJ8WfBn7LpMWIZUgYC1CoZsU7Pz93R17zUYXeoTDvaBLb5aUtKDbnaXKgL5aMnx8au+KT88IGlLXaMwCSsbAhzszOCMFO55VoGok8TKAYBr7UVvSf6ZpFCgrqibenOBkBO/LeIUdCzAKYxTCoDuLs5JZPkhmxmWtOX//39m9UECwcBF/8z4rSBj1b8GcjJVrCQHNpbtSo5MJ39VXt2IwvQY/mQNfu12LdUSt0EjJe5ccagkB3yO7ezzxNsq0al89WZWzgFeem36k3qpZZf/fQBVJbx7G7ZfWtEw7kLPd3fDRviaPWieCbZ+VhbSF2PwjHgXzjlrXyh5fFA2SCiFODhJ/FRA/fmQhMHvi2PN8EXeGGCJG1UxAvh8CaC57PHoB5lR5QsOdZk8MYlxaVovgaN01JFciFHCiCWxJUD3jA7cXTs50mw6FlYMWemOEOz3IxDERpFuelUNOsHqkm64aMMoeN4C3kZHw4ZBJO7nrcpDAnJ+1ZPTKM3bQ3uOZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(55236004)(26005)(1076003)(6506007)(41300700001)(316002)(83380400001)(2616005)(186003)(6512007)(6486002)(122000001)(478600001)(66946007)(54906003)(71200400001)(4326008)(64756008)(38070700005)(66556008)(76116006)(66476007)(91956017)(6916009)(38100700002)(86362001)(5660300002)(66446008)(8936002)(8676002)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?UY5sNfrWZwe8mPRTL1fI8l3/3uBmZ4viGlzjrgH5NMfGnEpq/p3sYzz+EP?=
 =?iso-8859-1?Q?oJ2vsXDa1RgsLwNYEZd+O7emIHPQXxqM76Ko/vJZ7JNWE538QtVklVN/qM?=
 =?iso-8859-1?Q?/wm7KqEoaFrbGqczMzak6YQFhJ6BBimqtS3VaKpZKCHHR6tmMQ/QdZqNZN?=
 =?iso-8859-1?Q?uU6u44O7W08rrg0p0/r3fNGYd9n44/Ji241/u2clPl+a6mMcCOgrHhzKJw?=
 =?iso-8859-1?Q?qGVlPRx4nnIVf2QggYKaKxNK2uu0xyjoACvwnp00hwbUPFC2WknERWkuAK?=
 =?iso-8859-1?Q?5btVqHl2fSC8XY4mn7n9T+v9fygTflQ/V6ElqEGcH98a2kIKPQhU1I6xW2?=
 =?iso-8859-1?Q?BIyV4LmeOqET+9VK91KF58dNJPJquZgzdjofpM1VfLhpNGIW9L64i2judo?=
 =?iso-8859-1?Q?LmQbRf+4k3PT9/4od0z6P1ZkkQeMm67R0t2wczy/QeAOJwaoEduVqZlXQW?=
 =?iso-8859-1?Q?iPW2k6iMRDAEAnfz9VGelZwlDUDgnH5iaI6Isx4WJsvhrvad5tviQodczz?=
 =?iso-8859-1?Q?2wONMLC5ukPw9O7qByMYlj3mrXpPBHA7PMp0tzYiNmXTcRiTBdXfsYVJrU?=
 =?iso-8859-1?Q?cdmfBm7ENPbQ0A5ZBl8CijKFibdsF39ZF0fre3RKvNI7xHn2rcHOT4Kd/k?=
 =?iso-8859-1?Q?T1yNE/iD7g6plKgw3q3liFIAE45CH8bGSnz98vgYeqQLKo7NxiHtVAU5t8?=
 =?iso-8859-1?Q?Dg4wzieEmYBqSRwAf8nghSR3QB0686sI4UPWvG7LhLjXQgnbNVr5GbEqXl?=
 =?iso-8859-1?Q?c9efXY/3eL/U20WaREkO+1GO4h06m/2XOc/TjDRiulnqQQp1p8fM+n4lqR?=
 =?iso-8859-1?Q?MhQcJHzmbCIA7q3v8mPwmn+bokzi5UsbPIokiJfTemZuExrrQkzo8uRLXi?=
 =?iso-8859-1?Q?w1V9ORvvhsOBk/cMFDn1nY2hYxaRriuACt1cbMr0I3j6ih8R7mOEa4E1J2?=
 =?iso-8859-1?Q?8/dMKRgSeLr21iFJpSt65Nr/buwPsvgXp0Rw6RCq/Iu8oVnXr/+0arpOKV?=
 =?iso-8859-1?Q?ClwE8Wr4YI1DiwWHpa2yTaONYPn2Db0EY1xb3gGG96i4nUR71a1bblhVDF?=
 =?iso-8859-1?Q?CYPIbfnx8mo6daprYObQ6cPlylS9ZJWL21ad6HisCHTs20yKHpLaCgWIM/?=
 =?iso-8859-1?Q?P3vAxmUWVwObgOh25vNDB6F/miZ5coY8h3FWup9xUEzASxMAwLgHCiUjdz?=
 =?iso-8859-1?Q?UI591k7GflDpl3dWwwsG8YHzXrp2NOAAeiDwo9opnjLkY62tq9bCSpXmRh?=
 =?iso-8859-1?Q?rUeaGP1AerdPS8QSGdU0h9hr/84hcfpeUpcQBtCuWgAfb0J/CPe8Ajoirk?=
 =?iso-8859-1?Q?DxiZCaOuMJRf/upYEFoKNXoiTb8sPi++aDJZRyt5o6FgtICH6MFo8yOITz?=
 =?iso-8859-1?Q?4rXxGoIJWAa+366XDhtQpbdIWaocIMKODyJtNFhVqpIdVN4pUmg5CwyGWa?=
 =?iso-8859-1?Q?maMEMzqjODfIdcnCiX97BvnzeWvpT7iIKdyzKwxBtXOwd2VZ6R8PkBTyGb?=
 =?iso-8859-1?Q?2/yMlJ3EfTW74u1kYmz8JJc2gPFWuIYsEbqXm7DqC1R2qF+w9osUbj7eNd?=
 =?iso-8859-1?Q?ylq7Pc1OSL//SRECjCh8w3aX2mRXNWm3gOMPa2tPAOt4pdhPxHY8r/MLPY?=
 =?iso-8859-1?Q?Q8Jj5F0arJ5r0SY3l7FmhEhi89NBgV6IUTslhtOxedlXEErCc/VqLz5A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d09c8808-874f-4f42-e819-08db88b8cf63
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:32:32.6433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uz0QoHWLPj7IXhUmPUqWMrtT2H0W8ncZN1vSFhbVOWoAurBpxD4Tl1v9gva1xOD+yCfQ1mSNy/Yl3ma4f4Czf/DDvyuW1wbs9svYXSBVfc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7783
X-Proofpoint-ORIG-GUID: wSC_5BsEzDIb_Nbf8daHlVd-fT0giIVi
X-Proofpoint-GUID: wSC_5BsEzDIb_Nbf8daHlVd-fT0giIVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200002

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
index a6ef264046..f8b909d016 100644
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

