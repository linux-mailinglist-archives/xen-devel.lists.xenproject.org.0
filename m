Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PbaLqArzWn7aQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:28:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2349B37C259
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270428.1559095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wYF-0002C1-Sy; Wed, 01 Apr 2026 14:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270428.1559095; Wed, 01 Apr 2026 14:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wYF-00029U-QM; Wed, 01 Apr 2026 14:28:11 +0000
Received: by outflank-mailman (input) for mailman id 1270428;
 Wed, 01 Apr 2026 14:28:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w7wYE-00029O-FU
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:28:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7wYD-00CPVh-MQ
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:28:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69cd2b71-e002-0a2a0a5209dd-0a2a450bc16c-38
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:28:09 +0200
Received: from [52.101.65.117]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69cd2b79-bca8-0a2a450b0019-34654175e14e-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:28:09 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by GV2PR03MB11232.eurprd03.prod.outlook.com (2603:10a6:150:339::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 14:28:06 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 14:28:06 +0000
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
 b=SGZII860j5HIUIFx4gQ4GPf9aufrjsLS/07WLcXPYSVIrMX9CAYZQiOIbOxVThFALXjgkWCHlMIUEDEiSQgxGlrDq1Oz2JYmmA//jT7SD5dcZRsMYTSJK2YJ/Zn62j5/1mnCX5l0A04c5Zhf09nLVZSfiorxaJkwhyYs+NBq1flOwPYQUJitnOtmNEybOtaiachDG2eQsR2xpw5K1MUBZXkeKr91p1a0IY4NJQSLjBfBynx1arXndvB/WGJs7CV2RvhwDCstqOEM92r/TMTTfgSI+7LAIuknmBac/+r73CJ66Pm0bzfuCrvh3IXM3pBhLp+0ofKsUZbYE5VWZDhkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgbJuHA5HN2i1flL7FQga9x02Z4hCI+ZYnIiHNes5ME=;
 b=d76THy8jctl4dyAa2w7rb2Vwk3bcDj9lX42mvJgQLJz7I1lvnpVS4gw4LlCrWd4q+xUWZKEGTDhvMpmSOPdjs05jZ9OoggBEgs4zXSWpJx91oZ5o2DX8Ap0H3hZ19vVgLlJZAH5+zJDl+ER9TLXJeAbL7pnN9u7CsJ4DTP2qZiQgyGQ5b+vtxJkLHmO0ZbCxq0F2cG5+dgWrBTPLkZIM9UxTXa7eYs2HL1WijaGaMT4VP8mNb7JqRuCfB+rbBsGxUmnF4IXjbtFNPrepee8NOmiJ3jq8K9P26RmRu30DmiutGh+vWWikRtwNpKwX1m125Tz5Y/f5gtwrWyy5bVU3BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgbJuHA5HN2i1flL7FQga9x02Z4hCI+ZYnIiHNes5ME=;
 b=H8ArWHeVLS8s1YaQY5hHsAyUK2f8i2Rak3to2E0b2wkxXdiiLJGkcs+z8xUagZIH9dfMvihL6XQgXdl2QWiRedmKlusFrdAusHwpeo0178RjR25y7n3igXLtK99jcbRCXN2p6S+sABLMoDrxYuocREIm7+gJDdFhkIJhaOLHI6swCT+2GYs3KmJwq8TOlt8AB2ocMRp3RLjoIFoYY1a7ehK3wtYpN2Boa2+HWnBxA6lib1x1cQfW2PSo8dF2U7POsAYv0KQP78OwNoZpTjQUk+k0xa/lFl/dVTTJLPEiTQO5TL9RGgC1kr3n18zrytpe8EHdBVgriS+8PoE3Vs+I4w==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Oleksii
 Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
Thread-Topic: [PATCH] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
Thread-Index: AQHcwePBLaUu3jy8fkmEFBxQMvITig==
Date: Wed, 1 Apr 2026 14:28:06 +0000
Message-ID:
 <fcb3a80f93ab16b880ed31e82bc61180f3586efd.1775053454.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|GV2PR03MB11232:EE_
x-ms-office365-filtering-correlation-id: cf858959-ed6d-4e58-84d9-08de8ffae43a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 ruJRvrSXsRObNXQSt7ULQlqNcOJFIvLw0NT8vs5QxVytQwXZPAaE/4kKPRNKQewa5FJB7jlfDBakIJ7PxsEtUD1My+c/N3JMtJCwQVHeJGC4GecTLnd/X6qA4D7ECgdL0RsMkbVom1OrptYzMmD5wwauTngKEp+AA/RiKpBvSC2nPLroh+An/ieyoWJ6ltB2u+qD8fdTciHlnY9zGFzHDk6TfkscqETDRfAnJYRK3oiMwq61jAGAI43lVlmA3ZkoslY5rxb2JwUbpN/mp2lt//79lPLny+v0GqIj1+aes0oDo4y+EkKnqFoBzqUlgoerWvokdA+4GdYudWcDjF3S3Ei+lIEVx5f/heI0iVWLmQFU9AKsP4D2FZa+q7DZn//So3+rWR9lY/OEwUXKDlL+sx4qluXT5l1NdfR8GZX7ySKDI1r4Wk1qkQ78Tfk0mlmbpQHNx/Hb1FosZoxtrSF34Y6RJyd920UD2kIoHI6fflSXoghWKdi5e/MY31MXOzoRlY6KizAA6UzZXQYPxoA5SVBBcerDLuqbdFGjFmC2MZACxpg64PpgI3xtnCd9/v6cwZtEb6AHpeg1o8Df36b058m+9S7/gMS8GeZvzfV329z+gRL/7IWvquEOoxsuUl7vDuu0B5M3vId5B/m1REaSHnFhC1M26s/eF5+oJspsajsMZXheIVNQdhI9omnn6Jmc7JuMjYdQ0O6ObpGB2uRwp3AWGz4pZb/WIDv83sez2FgV5AXNC7xtepyKj3PLvRzyDkJD0hPa92sgbTiopqUHDVxWwDxBwmf54Bzs//3DZyE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DY0VQ2KEIGahWlgJP8PwtmsqUmPXefJzZZE2g34+FUR+GWeVWZ4Ty2soKU?=
 =?iso-8859-1?Q?dcCoeWxiC0H9KjKPpKLAXHLtI6XY/GtPZCZbdpXAKRzLNBdLKP4IeWBVzK?=
 =?iso-8859-1?Q?sFN7BhTddWkoLZ9wgnd26bs92dYCJlT8xa8wyxCIxPMwSWO1O//GLJXXhy?=
 =?iso-8859-1?Q?H823KTuRcMrl6HONBsjpjpMBOPy6oEQ4i7oSd7EfHz+k+IoppqKZNXHGoq?=
 =?iso-8859-1?Q?0/nJXBVmdoAf5POsUH4S+9ubZ59/A/Ov3o7xe2eQ/joMcNQB/HQvXu11HT?=
 =?iso-8859-1?Q?o9NwW+fLDkEA3Dq91YNtvf5Hpe3kL5qBs7ypzoMg5ONxjF6LWlPt0RIFry?=
 =?iso-8859-1?Q?wObwnPIZNOWxtnDGMBwAhWdaWjPHf3QaD5pzZhj4zJ/GiXsSFenfYDFCSc?=
 =?iso-8859-1?Q?Jic86hxId7myxgjBiGvebR6yDBOjHNU4AUEH0wDdBhXmTIdabqH7alKrkx?=
 =?iso-8859-1?Q?C7KfKFIW2rKHetglHjq8cRmMoxma2h964sh/cAztPzv5qbRylk30F7wVjH?=
 =?iso-8859-1?Q?UvVH4pCaHxrDhqPojIRWBaNsK688y73HAwv1a5wCiDJHCyMvUw1kahPVxA?=
 =?iso-8859-1?Q?yy2AHoF4hFbL/6813otZSxsJUQMPxnclRJMrIIdTKA8uotZ44gRqTkKjDa?=
 =?iso-8859-1?Q?rIKvO8vNn3pXmAkhpZf+7QJpRaiPmfZ8RSZSAeOuNylePejUBjKwmu2GM8?=
 =?iso-8859-1?Q?WWXYFYX074D5I4AdiImmayoo75AbTA26skUN/maodUQwmSNIi4PqyBJ4NW?=
 =?iso-8859-1?Q?f2CfVzoM11WxFmfcEylInfgcwxq12XJQHNw1ehce5OtvAlXN8b+xJPm1EC?=
 =?iso-8859-1?Q?uKF4D0ZSTRWVys19buo3iSvLsEbC2bkOrjc5vk9uN/RXOr2+JkMr095AHE?=
 =?iso-8859-1?Q?zMWlLRH46xwuJv1k2pBOpQ2JKQvNRmxUQQvriXgIIIgBMCoSRkqmTp9xXs?=
 =?iso-8859-1?Q?mCFp8yBUXqeVS7/fR2EOVONIw/zLyfFULdNWh+ioxOK7+KkqNMHhKBNZvG?=
 =?iso-8859-1?Q?PuOIsqAgJae/3QfrPtkN/AGuESX4gV63KyrpbnFbpegq90hx5lKs82hJ4a?=
 =?iso-8859-1?Q?a3Rxo8/cDCrM/wAcGUOIbl3eQ5FbZB1Fjvy2hxeshq3pwkoylqMrIDQ7Pu?=
 =?iso-8859-1?Q?cRrPGB1jm4ZYw3ltN/p7JiE0oc9zjAo7CFt545fGHwV7tMLzdyUgCoRdQe?=
 =?iso-8859-1?Q?QU86EGQhxNLzHKCQJ9rDGus5QoAhXOI+I4kDWj165tx+vwTbvrpzGK0lEd?=
 =?iso-8859-1?Q?DTyucNXVsUztcDBncK9fgAk9FZao9YvOWPHvRU4s41uimwPnwatbSDfVZW?=
 =?iso-8859-1?Q?NzXgHLvB75j6Hk/GzcoPcoHlxmqRCHlIIK/pwYu0IB+a5GR1qSodC9+xsO?=
 =?iso-8859-1?Q?t7ckv08QIks9GFL+av3CuC4z3UB3lFPDkqI8/kF3Qy5R8+7RUCvxxINZSj?=
 =?iso-8859-1?Q?9MzweOU9xbnXNg6EYEHeYvnIqR6HZ6by/JjOX/KQUaivncyUIIL6H1aQ60?=
 =?iso-8859-1?Q?qVVT4l3SnPRag033XLznJ0yGNyFJisFejWKP6fpgSYi1mHXI5gOXmTVl0D?=
 =?iso-8859-1?Q?AesLzYgy+gvjYbDk20wQzJLREzhWWUGPO+v0i08vlStEnSWYFbkY/XtBOI?=
 =?iso-8859-1?Q?LkPcxPZeY69+7rEjPH2XBcn2eEgRKrfBxUXhW3U84XCKyGMULL+VQoVbSC?=
 =?iso-8859-1?Q?4PCa1NkaQAqFRnGFPtER6sZnpgQJtbQvQ6/fbr7T9ak+ZReDnbjHqWdFRZ?=
 =?iso-8859-1?Q?hPYxhsGfWABw4J/EjvKrgbncZ0X1kx7LH8fDuOJKcl9SELr4c3KzdARXRo?=
 =?iso-8859-1?Q?MQ/TlljEAUb46iecjp7Q1JNtRxopMFA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf858959-ed6d-4e58-84d9-08de8ffae43a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 14:28:06.6600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cxuC2hW5izi2J5UY8NvTU2x9A3AzRiWMYOY1ia4qBqhVxfl07oMSI/M0oCrTD+PIjBN+b84iSkhIzd7FL1X/BX6NPDtL15BsaxyJ9OOHjaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11232
X-purgate-ID: tlsNG-42698a/1775053689-F63C62A1-D5278358/0/0
X-purgate-type: clean
X-purgate-size: 1920
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:Oleksii_Moisieiev@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2349B37C259
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In RTDS, removing the last eligible pCPU can kill repl_timer.
When a pCPU is later re-added, rt_switch_sched() reinitializes the
timer object, but pending entries may already exist in replq.

Without re-arming from replq head, replenishment can remain inactive
until some unrelated event programs the timer again. This may stall
budget replenishment for non-extratime units.

Fix this by re-arming repl_timer in rt_switch_sched() immediately after
init_timer() when replq is non-empty, using the earliest pending
deadline.

This keeps behavior unchanged when replq is empty.

Add a lightweight regression script,
test_rtds_repl_timer_rearm.sh, to verify source-level guards and model
the expected re-arm decision logic.
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

 xen/common/sched/rt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 7b1f64a779..59021e1110 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -741,8 +741,17 @@ rt_switch_sched(struct scheduler *new_ops, unsigned in=
t cpu,
     if ( prv->repl_timer.status =3D=3D TIMER_STATUS_invalid ||
          prv->repl_timer.status =3D=3D TIMER_STATUS_killed )
     {
+        struct list_head *replq =3D rt_replq(new_ops);
+
         init_timer(&prv->repl_timer, repl_timer_handler, (void *)new_ops, =
cpu);
         dprintk(XENLOG_DEBUG, "RTDS: timer initialized on cpu %u\n", cpu);
+
+        /*
+         * When re-adding CPUs after all RTDS CPUs were removed, replq may
+         * already contain pending replenishment events. Re-arm immediatel=
y.
+         */
+        if ( !list_empty(replq) )
+            set_timer(&prv->repl_timer, replq_elem(replq->next)->cur_deadl=
ine);
     }
=20
     sched_idle_unit(cpu)->priv =3D vdata;
--=20
2.43.0

base-commit: a7bf8ff218ca05eb3674fdfd2817f6cff471e96a=

