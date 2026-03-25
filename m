Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKOPLFT+w2lXvQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:25:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAA1327E0D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262616.1555053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Q64-0003Aa-9u; Wed, 25 Mar 2026 15:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262616.1555053; Wed, 25 Mar 2026 15:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Q64-00038Z-7G; Wed, 25 Mar 2026 15:24:40 +0000
Received: by outflank-mailman (input) for mailman id 1262616;
 Wed, 25 Mar 2026 15:24:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w5Q62-00038T-DV
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:24:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Q60-00DBoZ-7G
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:24:37 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c3fe2b-2eae-0a2a0a5409dd-0a2a4503afd4-32
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:24:37 +0100
Received: from [52.101.65.93]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c3fe35-1947-0a2a45030019-3465415db9bd-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:24:37 +0100
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AS4PR03MB8748.eurprd03.prod.outlook.com (2603:10a6:20b:577::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Wed, 25 Mar
 2026 15:24:33 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:24:33 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efz0eJqv2/gpDxgljYecXGTKyotVSX6asoogrk3GsazDpnnVc0ItMiygJkXq/LpZrOkfk9bO03L0br+zunFfWkLRWXsErSq4Y8GIsv3z0E5JKcAHCQ8NfGjrme4C0Qgdf7/43uBPcS362W/sjAMqKQBJfPmre53WXVYZagQKS/odz1GFGb76CG+qzgPN4ZCsiOV6zaB5rAMRZWIuccIH9ej/ao1PhbT02cGCzijHMxK4LZbMLN/XZmSjRXrz/ZoFTfVULeQAJqEkgZnrmL3jr5LE7a26c3f60wBveqiKxoBJWY5hUSWvHbyEkNcyQE+ynw8d3swz/IwFto26sTMXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gl5DzkLvkUsbuZvmclALmkdH0Fa/jxNkKUyFXrbC4EU=;
 b=pw8Bj2ruSfFd+mu718ta6Q4G3tT90E360ulqP1kePEiHvYmmRZjUyEkDdb3fHf0ZzBA2KMEW33uGSVyTb0A/9HmquJgkjDJ5bRTmVNXEXpiHAKF3n5VCs2PgmXgNKrQ/muVsWa31j+sU4QZCU6Gr2T4UvJPF4vY4PxwWfp8I5DPwNyGkyKM7DuT4BOKt4+heJ7EYi+XTUZhEWf3CeOOnoiNKprVJobVgnFUe69+tAuhSRDxAfvgWy0lVTAG9swOmmthzKY9PZEEJSZWQMq3wwvsTXVsnlDLQQ4yFRhO5kLG5mAX0shZNMGoIq3sUjEQWnU3jwDgk2ZRWHoBU5S37mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gl5DzkLvkUsbuZvmclALmkdH0Fa/jxNkKUyFXrbC4EU=;
 b=X7D8FaPELbGOR0EilBzKr9a6AWhoSKsjURaoUvYBzzR6mBhoQ7ZuBdIz30bsEtkP2qOipJqS2YLLTIegQN0CbR8l2iZD7jQT7TwiraqBvumTmbJAReuZtht16zAcq1FNLj2qAJV4R8P0F3xnjs7GAffBD4ixOVLKzHHSYeWF6s/AupzVvMvWjp6tuD4ulS+PZLWqK6eSuB5jIITB5Eyozq0xpVWT0zBN5GVg03qEj04WQ9UNjWvEtH/WuZ41H4hJBI5Eqhv2QUupHXp5RaSkuv+H/31t1Gvz3ETj4bzfIGAUDUhHx/QjqZyhE/Q7NMIwpve3GHjmVBY/iwUwsZmkjA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Oleksii
 Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v2] xen/sched: validate RTDS putinfo period and budget
Thread-Topic: [PATCH v2] xen/sched: validate RTDS putinfo period and budget
Thread-Index: AQHcvGt7K20iwhRjJ0mqKQswQ8Pmwg==
Date: Wed, 25 Mar 2026 15:24:33 +0000
Message-ID:
 <c629e66ebf05d620423babf1e4e98866c1f75357.1774452210.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AS4PR03MB8748:EE_
x-ms-office365-filtering-correlation-id: 7b72d2e6-5f5e-457d-d7c6-08de8a829e08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 2EYD+R9mcrFfeN8GLKAUbsem2rhskaTsPY3dRBC+bZrLygloo/buD/YxY9FQXJPI7tXZpb1VJFLbTvo6XV9mcxYKQw82Gk86U+HZavj7pgRtcaTtpdNh2Zp1bIqt2x4no8c9ZF4QkBUy6j2g/RveGEjM7dxORC66K/jZxLJ9qXdKmMF+sMKn5TiBWPxAsq1uX2onjNC1UMETuQDVkqEjlUE6g9YQ5rlA2yYMF0PHV0Ph/9w+rkv7hNwLgy9l6j6a3/sit23zmB0dSrteYYeogZNj9Ty3uSo/r7SodEOL/9Cy0CWTcD4JcKIFqGkXab5+weCnwwGFTLf8u/gjJKurWI9dgTLWIxOxIXuK9PgEBHDk7WFOphKSjMzxLJQa22MT1kgnRzmqTOGIJwJf4KAU4wVTmNika0eYdXFAi0Rq7NcST0B/ttgvX61SHXTTOeJNf0tqJsYYmVFGIbdGbTwlqKhBkwOqVqs6kdV3i6LCNCn2pNLymsid65OAzrAhY2RhOuGKls+lIAQd3lcnWn5BP+NOenBKZtQ3YLVMDEKdbt9cC5cLX8QJo+hw/FUXdrfooUk7VotzxqTMfg4vNOXdW35FQ6L+6EDKZjo3uJJ0rozIWVhfJptoJLoZbfItOfc1Q7UEALcJ9pRoxTbWXEbGtMiY3t4+TesKWJa5INEXnemzQzUlg5+KJVlNWt1ZUrxR5GHO3i4xPaQ9HHz4E8vcrhrmcD9K5NVKB4i9+cktrwCMIwNtSJd0bUQOXZkW08jzh5H91tj1LO8msxCUZG01+O+ISLMo+kZoKcWU3OepDJg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?EAKFTXpEnk6ILP8cu/bhV26Y6pJyhlEnQl9IUR+LxUMmRdgg1wCsCRJYKW?=
 =?iso-8859-1?Q?pJXGv+qva4qZJA6EuEzNUALF34U+o3ozfv99/tM5u8xFUzuhzGe7vW6OUb?=
 =?iso-8859-1?Q?noR4eX6NUaOIuXSvfQJVJlI3NqEX5Hha/UyDQsHKPEfpySyaPychsKFm/X?=
 =?iso-8859-1?Q?ORDUyVY+jCEj5FNk8w09qjYOuGszx1V6tbBNCJT/KG2EnyN/LQKcoMhqIP?=
 =?iso-8859-1?Q?prlc59BIPNpPyBaSNSQa8HZiLFhTdXxk0/STAzB9OAntr1eKJE7Rffy0iy?=
 =?iso-8859-1?Q?8T3MJb336rBlCuWcfGb8j3rmSNLPxsXrf3HnNcBSgkPXaNDglAlNOUkEEk?=
 =?iso-8859-1?Q?vaLJIwHIjtoVMHOMG8k1nptWQi/wDYAESU4iN5/iKkv8b+1jA/If56cofj?=
 =?iso-8859-1?Q?5iAKJAWES8E9Qi1ZvnYhS8Y+HVrx1lyZAqGKGuIhiY98IMlPPyFC04iBa6?=
 =?iso-8859-1?Q?wRKvJ0aYNg1TWp6+MB4oboLgylYCLLKT6auYYejVqUz5zzXAhM3SqnUbrJ?=
 =?iso-8859-1?Q?JNwY2HmcCbD/IYPg3DCVHPhbJI15fsE28q+7jzlQBqgrOefPM8E1heyLtJ?=
 =?iso-8859-1?Q?NgPxTdYPD5nlpLrUi8UkB+5vlLsA11t3eni5ikcs/ArSsTa5bfDFRHCWW9?=
 =?iso-8859-1?Q?Ojal94vG2ZFUDpm8kaNL5rs0kcj/79UAS/N+Wq+pqaLqp1NFJ0Qk/MrwdM?=
 =?iso-8859-1?Q?Why16J2K7doIUYUIjwpJn8HWY0GTk2EmYkFjZWWXuyEAj8ObtLRhZsLe3f?=
 =?iso-8859-1?Q?944uX+9E5rcIhfdo+Hll1GtMbZaDLolze+xbnYCLLy6I4z7ssLrLM2m+4R?=
 =?iso-8859-1?Q?bKNzkPOGoF18AXwArH12jh9h+8GCx1NLz7zz+oAG/TMlinKi9WGscMk7vy?=
 =?iso-8859-1?Q?SEzlya7gbVdRA+K5Eu/V6UxhIWDzpMx/WmHhe+JZ77/BQbAlWPWa9vTp0g?=
 =?iso-8859-1?Q?HFAnKK0slClsS8aV3k+7O4o/uQQSlp90qu6MYKUE6LQaQzRlRGhx7+fFED?=
 =?iso-8859-1?Q?kWaIcI+g6R4+luTBwTSomYtN2A2Kita66ZyER7koBfLlsciP43ABN3pFkt?=
 =?iso-8859-1?Q?xHXJ69YEDM0kTN+B9+fgzbT3JWwcOd7u/8+ghydy4xPnZUej3TWXcEX1BU?=
 =?iso-8859-1?Q?XDZN9JZgc81sRkPJFlJ9T0T0gjJ7leLzDSrz9+4Sa6qm7on/ZeRCfl/iOf?=
 =?iso-8859-1?Q?5rMYOGWSDX+UzXMMVJwlRuDcs2EZn9pqmQJXLa36q/1vJlSKp+7kWgxEWy?=
 =?iso-8859-1?Q?f+G8mx8mzBClRiFZ2ufBvHnhWcr0v4qsi259lM3SRFL78EjQyDtFLwXZb7?=
 =?iso-8859-1?Q?26DNmt3RViZEuG1gk8xEJELvRmsGY1Pn6lYVOHzXjjmhvs8R46avR6EcuM?=
 =?iso-8859-1?Q?ctsquqgUgizzwKafq9EVGq+YdfYILXInPWhHKAuoLMeEq+HB3uSTeW62uU?=
 =?iso-8859-1?Q?B9Vaurzrkx4dfV1I5mGARP8q08wG6FJU4sZ2Xu461Epx4XxWWq+qJ91X7F?=
 =?iso-8859-1?Q?Gp2a65zn70PHrZDY+eXUr2H668VXRWVZGAdqn6ggZPUwbUozKJs9ctrdx5?=
 =?iso-8859-1?Q?aPdbpaSrVxUQk4zu/YDyNbyrRUSeCXsPHFd/Qdc4IQfocnMhydCbWCn+Xd?=
 =?iso-8859-1?Q?mOIOmyMD3EOkR/yyNTeOmqAVV/DRP02R7+5AyZlilfcphbx7e2ue/xM9Rt?=
 =?iso-8859-1?Q?NiLy73uq8NYtd2SDxdgW3PqYQd6UNXT9bHNYd+I8D5T5ncnw5h4DHRlK2B?=
 =?iso-8859-1?Q?OC3MDR+7e/QMdu+R0KmGg/jQPxtbAGm61zwVkg6ggDLDEpOEpVDNQtRgIJ?=
 =?iso-8859-1?Q?SP8o4kl9UI4Xc4cp874BMkO1Daz5zic=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b72d2e6-5f5e-457d-d7c6-08de8a829e08
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 15:24:33.4341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qGv2PxfLjNAri2iJZhVc8t7fUIphN5h3cvaHDnl5s6LM7pi0f8t/HNh/QWliJDOsLrVlXoQZK/VNEW1eAgJpP87n5Au/mp6iGSWjnstoknk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8748
X-purgate-ID: tlsNG-33051d/1774452277-EB28772C-2C90C4A9/0/0
X-purgate-type: clean
X-purgate-size: 3332
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:Oleksii_Moisieiev@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1DAA1327E0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RTDS domain-wide XEN_DOMCTL_SCHEDOP_putinfo path only checks for
zero values before applying period and budget to all vCPUs in the
domain.

This is weaker than the per-vCPU XEN_DOMCTL_SCHEDOP_putvcpuinfo path,
which already rejects values below the minimum, above the maximum, and
cases where budget exceeds period.

Use the same validation rules for putinfo as for putvcpuinfo, so
invalid domain-wide updates are rejected with -EINVAL instead of being
applied inconsistently.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v2:
- introduce rt_validate_params helper function to check period and budget

 xen/common/sched/rt.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 7b1f64a779..645b091de7 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1362,6 +1362,20 @@ out:
     unit_schedule_unlock_irq(lock, unit);
 }
=20
+static int
+rt_validate_params(uint32_t period_us, uint32_t budget_us,
+                   s_time_t *period, s_time_t *budget)
+{
+    *period =3D MICROSECS(period_us);
+    *budget =3D MICROSECS(budget_us);
+
+    if ( *period > RTDS_MAX_PERIOD || *budget < RTDS_MIN_BUDGET ||
+         *budget > *period || *period < RTDS_MIN_PERIOD )
+        return -EINVAL;
+
+    return 0;
+}
+
 /*
  * set/get each unit info of each domain
  */
@@ -1388,17 +1402,17 @@ rt_dom_cntl(
         op->u.rtds.budget =3D RTDS_DEFAULT_BUDGET / MICROSECS(1);
         break;
     case XEN_DOMCTL_SCHEDOP_putinfo:
-        if ( op->u.rtds.period =3D=3D 0 || op->u.rtds.budget =3D=3D 0 )
-        {
-            rc =3D -EINVAL;
+        rc =3D rt_validate_params(op->u.rtds.period, op->u.rtds.budget,
+                                &period, &budget);
+        if ( rc )
             break;
-        }
+
         spin_lock_irqsave(&prv->lock, flags);
         for_each_sched_unit ( d, unit )
         {
             svc =3D rt_unit(unit);
-            svc->period =3D MICROSECS(op->u.rtds.period); /* transfer to n=
anosec */
-            svc->budget =3D MICROSECS(op->u.rtds.budget);
+            svc->period =3D period;
+            svc->budget =3D budget;
         }
         spin_unlock_irqrestore(&prv->lock, flags);
         break;
@@ -1440,14 +1454,11 @@ rt_dom_cntl(
             }
             else
             {
-                period =3D MICROSECS(local_sched.u.rtds.period);
-                budget =3D MICROSECS(local_sched.u.rtds.budget);
-                if ( period > RTDS_MAX_PERIOD || budget < RTDS_MIN_BUDGET =
||
-                     budget > period || period < RTDS_MIN_PERIOD )
-                {
-                    rc =3D -EINVAL;
+                rc =3D rt_validate_params(local_sched.u.rtds.period,
+                                        local_sched.u.rtds.budget,
+                                        &period, &budget);
+                if ( rc )
                     break;
-                }
=20
                 spin_lock_irqsave(&prv->lock, flags);
                 svc =3D rt_unit(d->vcpu[local_sched.vcpuid]->sched_unit);
--=20
2.43.0

base-commit: a7bf8ff218ca05eb3674fdfd2817f6cff471e96a
branch: amoi_rtds_SCHEDOP_putinfov2=

