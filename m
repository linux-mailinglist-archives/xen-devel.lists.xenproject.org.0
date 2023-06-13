Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B7C72DF97
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548004.855765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KT-0003I6-9H; Tue, 13 Jun 2023 10:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548004.855765; Tue, 13 Jun 2023 10:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KT-00038l-3S; Tue, 13 Jun 2023 10:32:49 +0000
Received: by outflank-mailman (input) for mailman id 548004;
 Tue, 13 Jun 2023 10:32:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aRu4=CB=epam.com=prvs=05285d8c61=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1q91KR-0001im-Vd
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:32:47 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a31f06d3-09d5-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:32:47 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 35DAO5Kc019280;
 Tue, 13 Jun 2023 10:32:36 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3r5yahmgn9-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 10:32:36 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB9706.eurprd03.prod.outlook.com (2603:10a6:10:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 10:32:31 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51%5]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:32:31 +0000
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
X-Inumbo-ID: a31f06d3-09d5-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mh3OJYNOrQqDWGMn0p4qXJhuQldj5G3a7bxCGuGeR61CN8BC+SRruhkxd0YbVIT2xA3RqK9B6mO1utJZ7MoABUyYyIlEI0FylcPgwEo8+BWMQtm1wOjGKg2i/R9/yatlpFSZL86v/Tklk8KsIbNLrlTg/2MKBnwZhqfW4D0qNOEIlgi1URhIO0ECHBs7/aWbjbnQRI6j69ST6zqhz/9vMTrc76GmXc1OH+eUbH5mgBO9xi+UiAAPWrFF1ipZAUAnTkfeqkk+tTiCwqSpQCl+qsC7Sd8ZGfqojM1B444A4OIcOr7VbWw7KxSnxxXVljOSIrOQVouZgVAjqXZdg7Pe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WsGRZX+9SxqmlaHATzo+AnAiyqkWEn+UGBnfXu9ZjA=;
 b=d8jQDbtfqnLRbwTEg2suZ481FQKEhAKgQ+WHWNbNH9flxjC8BvIlgSFbrqE/Hckkebozckpp5sNWNp71iS9NxQCfMUntg1FrHBivBNv5d9oVqXef8Fdfe+HzCBuzIOnsX5SbEP5p+Zeu4OuQPuRQv9geOhppI1S1OmYVCrhMvQcqiWiV8VoGNNUIfBaSfhcu7lSjUIluUBn977R7qp+nS3ol/NlBpuMQdJhqtIHlVHtZYhmJyBeNIcfRcJ1wWVLAnhUOfiiqisQ9lwcRk+FGRCghI6HkF9FPkCYhEOB6KkiseWpi7FavDQDhbPh6MZINhD0Enyd+icb7BmT8qNHV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WsGRZX+9SxqmlaHATzo+AnAiyqkWEn+UGBnfXu9ZjA=;
 b=UMpIS4N3rEmoX3rNAATik6X8rdzD2Znajw2oxSBMzfx+KTp880w4FrTF+oeauOvJZdLJ/QgnCZGtNola/8qeo3auKJ4UWjcw3TR5g0Py9EllOBrspEcoBRLqikuJ9ZCz6sghIqe+OnvZyrQzrJGb5skhvh1tOCfKwBybdj5zv0n3HFig7SJ+cOf4yMAktsv7V9zX5E/poYOTWyHD659f8f0r2BDXSkQSW7Fol4xZYDOwOOEBV7CZ10B2MPbhGxLLrCRVtrwVu+aioOKksNi9UzApr+3RKC19+iM2IvFu54PdM+220nen2GqMrrPMyyEtFlFqtoK08x4fKzBJS9K6Sw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v7 05/12] rangeset: add RANGESETF_no_print flag
Thread-Topic: [PATCH v7 05/12] rangeset: add RANGESETF_no_print flag
Thread-Index: AQHZneJZjMgYCyM9JEyUhR2V92gItA==
Date: Tue, 13 Jun 2023 10:32:28 +0000
Message-ID: <20230613103159.524763-6-volodymyr_babchuk@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.40.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB9706:EE_
x-ms-office365-filtering-correlation-id: 13944d3c-7e36-4be3-ad8a-08db6bf97e8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OucIsoztlVcf+B/fz0iNYuMyH/YYFfICS5tSTx7tA6dvF1kwEPZhPwXUEhSic7y4F97TrIrXSIvrfPBz6FDdnYDQ+r4ArE/I5FVKCWlxD0IcqMoO9dtobLRoJAxLW+CpHAUHixq7as0VJcPyO9ILmHUhYIdWtUKkedwsYxgKvqkADl7JUxoS8W/SN21exW0Y6ulAWH2316HcRXpS7N/aUfBnKu7sTNxUka8SUcVQfHHBaxjLbVuPSzhdpuGOdWlSa/ZkUkZc2sdV6VUNeFnmHCCKGyTUSg1GGU7mP/fgLJfgWMUb4uxyoHHS6TNMFAFHf9k6X8ncRG8KEzFzNf5wXlfH3Oa9wIC2XhgyXHhp403OD9Uvi11GK4r+o9Q4Bg9NSOok6zm3UGrdDWEnBZ0w56MlpwzcDCN90+4rv64bKkVg/SM6nGz0xQpIVQeU6WMWHs+jNwLpzbSedLPsdPxPBSMYxK3jWDcdqUhiWakW9P8PlS2kBeeC4fZbyfuoCjDus6tR4zm4BCuv9Y5yOdqL5PMgpFPbCxLSuDZODZOiw6LvSNZTUxM5l30GTHt3mBkd2DHd7G8rbOvW0NlhNP6j+mFAngtXuye1aFwg9n3DcVW1DWyhcJfJGQISbXB4Ww+h
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(91956017)(64756008)(76116006)(66556008)(66446008)(4326008)(6916009)(66476007)(71200400001)(5660300002)(66946007)(41300700001)(8936002)(8676002)(316002)(36756003)(54906003)(83380400001)(478600001)(2906002)(6486002)(38100700002)(6666004)(186003)(6506007)(26005)(1076003)(6512007)(86362001)(55236004)(38070700005)(2616005)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?vVn0VKHXIIjiw/fsXKbNX6+3G1pE8klVFmFehye80d/ybVQ5LHbsHdAdGd?=
 =?iso-8859-1?Q?3X5AyE4bOw8s6tuGi189uFiwtaYMyiHYkRBcRLuVLANSCHhAT75wkGxM20?=
 =?iso-8859-1?Q?hBVx6yFtORXyyFUAGHB6Nb/2PmymaE3+kSs26Jje1i/s9e9Tp8qIe+Pw4X?=
 =?iso-8859-1?Q?TbOa7FxXjsV2Vu2z+uq5BUNofulReG/qZy/lJ3UX4Ceq/+KgrFFIzmdudc?=
 =?iso-8859-1?Q?npLs7HLTfBUtb2uMinPtG5I2HXhEkwfeQUBwzCXBheKyjSh13V/qQ4sN2d?=
 =?iso-8859-1?Q?fEEozpHoTUVcIxK8dk4ObS2BPcwe06f0brYwjWbCbUxWArEh1vtVBHkG6p?=
 =?iso-8859-1?Q?Uat5JNRizGkGK8QI31A7tQP+9VAeZU6cc7VJ2KE8R9IzHdx9yQ/lsMy3DW?=
 =?iso-8859-1?Q?5FvYxJlJ3kYhirif1NDKx9+OCgz1Nbswpfn4Q4Z7xouEjezy8oChZkM1UY?=
 =?iso-8859-1?Q?Q6sMdFQGldgiOe/JOhCbF4OhrWLABt5KQMNqS5MeW2JMh8c+0De6fj5oZ5?=
 =?iso-8859-1?Q?tYlagdvX/LpeVwSEOEAnFDeHphHYNk3oJ9eqH2i8EQIL/2cqhFZwNYhvem?=
 =?iso-8859-1?Q?snYj7/uMMxbXYv3LaGXLe3hmSKV4jjZAoSq2LDDg2fQFYgBHaaFjyq2+cX?=
 =?iso-8859-1?Q?SsSYTK6jwBQgbao+LZnUByCgm/Kj0ICgrSSB48uIwveW8gsJ3iuEbbRN2A?=
 =?iso-8859-1?Q?UnIjyOl3+odyB/rTvlFlDz5blqCQPy1YkwbMuBbz3pTFpigFXKb+bIAgOy?=
 =?iso-8859-1?Q?w2fNOve5F4OOOuMgoks95cOwgvIsWwNQpngK7kP/tXAgfgmuTB6AcS5ZIq?=
 =?iso-8859-1?Q?2XKRtSKmzl232ZBN9+nQzHHTOzQXT8m+s5nJxDeoEsfag3fAs8Tow2jbea?=
 =?iso-8859-1?Q?7rjtLb2K1qAJGfwX7nDLPZjOKN4dzMI/rexY4y9sZ3QBMtibWCcA6tofa8?=
 =?iso-8859-1?Q?y/wzh1AjYfpHnJ1XeaI4/yvrj4i/B0UCCdn6fbwyHRE5a1DBrfUWEWxfGD?=
 =?iso-8859-1?Q?r6Zxsh/+URnJ+oLBWnAZdOPIzLnkueyIEomQyTQ9gqph8cxVS6JpWhaXX0?=
 =?iso-8859-1?Q?u3kwp3L33w/lJIQWxGIlwy1rNUD3LXdR8K/UafeZK6/Baq1XJJGi9SokVx?=
 =?iso-8859-1?Q?wHgpLjSZLH3e/t4iCEgDMsSTz4zh/L4nN5Nvgphh+m6EYPd3bQ5DbaqzqN?=
 =?iso-8859-1?Q?sIed1oSfQCfd947CWdZRXTmqH/OlIIbGEd+YSXnoxpi5TRiHtVt1O9UsVh?=
 =?iso-8859-1?Q?yTCg9pkIvP0LEwTBlGpE/tnDUtNP99d3STgpH393HZXq7jGCuHfVosXx8K?=
 =?iso-8859-1?Q?79DdgnWwAM9/TIo9yd/ylHP8CxC83ejuUMXUaCXoOHZojZ6kxDC2Cum3pz?=
 =?iso-8859-1?Q?ki587YuCy2hB92MvtAT7zm04SZ+bUWIZemI9CzeW/RtMdwOzKxfBQJWTLj?=
 =?iso-8859-1?Q?mFqIvmYp0+E4bjEX2dbRR4XCQiUcOmifeLgk5hnPaBoTLxffL4HbhoGhMm?=
 =?iso-8859-1?Q?w46f635O3W1mYWexb6gq5ipubdKOQW8zh28eAuWl9HeFNvZJ3wihqwIKlU?=
 =?iso-8859-1?Q?EFVJHs8dona/9dWfywGLKqrQqU73AFcZolfBTOpM1Wpos36Ao/wsASPSpI?=
 =?iso-8859-1?Q?LMLD5g5Axq/qYUausATnMmE+jzG5sBo7tzuaEryi7yk7A4ga4O7ur0uQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13944d3c-7e36-4be3-ad8a-08db6bf97e8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:32:28.0750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EoEJzxgnM2aQbNxQfHKjHKCEfm47/L1RUmQvJlU6yahpVvXIm842Gmbqqp2FILbUTWKTfoWqJdNaz1ml87JbDnq7FyYS8Rn4aiG9efb/HyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9706
X-Proofpoint-GUID: GX3CMhzyxVkk6O3d-QmWlAGUMRY5ot46
X-Proofpoint-ORIG-GUID: GX3CMhzyxVkk6O3d-QmWlAGUMRY5ot46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306130093

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
2.40.1

