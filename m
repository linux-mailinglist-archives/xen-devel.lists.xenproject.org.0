Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDmQBU6uw2nAtAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 10:43:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7950F322628
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 10:43:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261817.1554577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Klh-0000wy-Pt; Wed, 25 Mar 2026 09:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261817.1554577; Wed, 25 Mar 2026 09:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Klh-0000vS-Ls; Wed, 25 Mar 2026 09:43:17 +0000
Received: by outflank-mailman (input) for mailman id 1261817;
 Wed, 25 Mar 2026 09:43:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w5Klg-0000vG-Fl
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 09:43:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Klf-00C0sr-Ex
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:43:15 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c3ae2b-2eae-0a2a0a5409dd-0a2a450b9f0a-16
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 10:43:15 +0100
Received: from [52.101.70.88]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c3ae31-ef63-0a2a450b0019-3465465836fb-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 10:43:15 +0100
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by FRWPR03MB11006.eurprd03.prod.outlook.com (2603:10a6:d10:173::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 09:43:10 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 09:43:10 +0000
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
 b=NCQedOq13nrgNjKlKYiOtD5VhSbv8UM1kUkAXwcjno6KMdsTxmO4I71uM/0x5BoFnX2BbXpcpXjwqEh4HJyVzQL9mc6lLP3yzpuIyKy7SHPRFvcdwB7kyHUjVbQ4Y7Bv64FDHjDqG8KjHURZoAlmDB1VoUKHczUSqBL4sVKKuCo7qTN/lzvgtbeoZhLXF0h6U/wu6Y824vMNwSz0cA/dIb9sra7izHfDdDDjTdF2rzQK+9Sm2IargMkejRSoKDPJsteie7ZmnLlpmiDoYZmcCzAGP6NPbn3jPmsBz3gs0HwhCoWdR6rNZeSy2UKlnRhTADMpHI/xvZiqx0k7Efi6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2RzNEiGKAjfQItZJJS0IgLaCJFzP3I0sfxeBqJoMco=;
 b=xELKRIpOElDT7hsI3BQEiIZXaiH0ik6vRCwTOu2HHA9WQkIkVgvbl3r8geeQ5W28FDI9rSHbSHMQHDAm7+ccCjdyGOO0hjIChlCyzGTOYEQ4VjFPaMKKpUGBbru65KA0w7KLDPvKMhGOkHQoYiZvf0/d1/XCp5N9GbBrZPYv4x1gIJVtk0ba462m5WgoDuWCyAjv1MwwrVwVdX7/4q14qdTPWTJQ2X3XC+W6evfgHH9BlL6MXiBrIWPjYn86r2CiH7/v3b0Jl1GzjoXc0CaaZrrDOiWFj1V0OBz91PHYk8cxKwRXDC3qea+y5PcNxwKayq8eehEw7zQ1ZzFshCoo7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2RzNEiGKAjfQItZJJS0IgLaCJFzP3I0sfxeBqJoMco=;
 b=I53C4YQbxRQ0OusH7DKek5u5dZjp7zmIp91H4S8/acKLFFXG8INbdrfH31MXscm5eUvMCM28mQFO4m6XS/k5F7FpeQsl0rQbTYoYG1Jblce3z6JkBkVpOvzwBDS4nNA8pI1qKedeIVMeavhS80SqJwYzU8uYKJ7hgP9Xp/E64hstYltxW/HBOOk82Eowj3Nch98E7gljSah2zvUlklGUyCFFb17hT5PFruhI9HoY+Hog4db+oAKoHiQCMhfP8JUJtlVI9tSeLlG7r5px8Q2AzqzqJb25elRqarE44AXR4RshqxI4u/KNkhu7hL0hilypR+zw5dp0PWMkZKOmIcGnZw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Oleksii
 Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH] xen/sched: validate RTDS putinfo period and budget
Thread-Topic: [PATCH] xen/sched: validate RTDS putinfo period and budget
Thread-Index: AQHcvDvK8gNVwMujB0ygdi3PmK3CFw==
Date: Wed, 25 Mar 2026 09:43:10 +0000
Message-ID:
 <1a235cca6f37ee3d3f03132675247edfc19953cd.1774431761.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|FRWPR03MB11006:EE_
x-ms-office365-filtering-correlation-id: c3d06d77-e928-4351-f766-08de8a52ed49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 kcVK2xTp31jYmna+AbgF3D11lXRCvvqiudtvi00r0+HMwVeYRLAycJG7H8igr+0xiOKJUw/o1X9Oxqs/difG5vnu7emkrET2nVJxyYZ3Urr2FK1lBmTE6p4hfMOnYy6CMBRbwz98avfeKr99psq+RJDuo8ZtREmctDDY0eEvxaAUzNbcHJtTcFCkZLQAIf+vMaVhVIiHy7HVPvywBU9lolH5Cy3Eeu1f0AoaX482sXGxCpmg7Xr9qoEdOX5cvDqaQ57pr6vOCLlSaYXVYAHliVEVeHq3L1r7JrhqkszH4mrSANBmWbzfS/rjEdyfFD5lpLQhIBKYP7CJF41CYpmfd1I4WJe45ff/40zB4G8AwNElvBI1jOG1176+ccc6Fr1Kol7zRd4nV/4R6xBeMnwlDaLKVjkJMUe7K1TuEV8doy12yoCv0eZbFiVrbyiKkpMs6KJYh4fdoIgWLFdU+3A68I9jzR7ImCpy6RGAAKDDkDv0enq86MR6BnGTWlAOAUgr5I5V7Gs5i7bzqEAhaVSTJZHVKtctcIUFJF1WkRR37TvJIEx0Qmu74etGmkYPX+Uizi8TuA3TC6CjwJ9XKU4NH6ho2upXJ/Dq7nmZ69upiyW9gIPyIsPQGf6cBk0H54ui/oha1GoK0DErwvp0SP9xTO0IG5me3gnMJJLinPBqcpqYrJogmUwF3uqNRKx00o/6GozTDEEDaUPk+y9oxSo0b7v5YkZz4WGFJTPO9W7ZzS4lKCy08tuemP8a+HEyouzoTDS84yFYexmUUcgS+A7Hwc+IbBvrlHjUmAJRi/KjpDU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nYaLI2MgEUK/Hk9KiUYLtBBuBt7fmLmQLcCQig7p7o8v6oS0NxX8BJtYdS?=
 =?iso-8859-1?Q?D5OnwtlLKuLtHxfA/79bIdsPAajT3kxCCehA/15+lVrsQX3zZet6+LXGoS?=
 =?iso-8859-1?Q?JMJH8TuIwTq4KG5FbsqkJs2b1Isf0mcfIBjWXWpaKy1oCdJLwhfE8l5dvu?=
 =?iso-8859-1?Q?wFlbtoP4kY/fjYSABs4brDAX6ehxnY6xPjjC4jjje7RMhv49vvIdXgBYM7?=
 =?iso-8859-1?Q?yEPETC79mi+wdCBAUN53Aust1yjWc9yohlg1kPnemOFbN/u/O4EMRFSZzJ?=
 =?iso-8859-1?Q?jzDuVolpnuD3Loj1N/I3j+7VLCh9rmbiWYD7RnvZrdTT1di8RIdo3tRXBp?=
 =?iso-8859-1?Q?5/8IbvxatbLkWNxLG1b28APlqHo5f5g7nsz8XNMAkPysO05MimESMVIZun?=
 =?iso-8859-1?Q?oO5Qo744vi7OfDKXApkOFi6iY85m6hWIdBJcO5b1xYtBxvx/I8rrYr6dzK?=
 =?iso-8859-1?Q?metQ3bVLTIag5Q0Df2vHkLOB0Zgqv4eDx7hC6CVBqZg7LWEdDxi5IRtZcJ?=
 =?iso-8859-1?Q?8//lQXyk9fnISZmtvl4D0Sje28KfpIs+8zrrdJd35GlLQdRaKNhltjCcGD?=
 =?iso-8859-1?Q?pyzdGBAxCOlKq8+5rbErnuW4Wb3aJU+gFy6PahSsdThPdL2h4EY7u3VNPh?=
 =?iso-8859-1?Q?7Mi99poZq+wqpzJ1eVW9Q+gbfia7vWHgUFqpt/TiBxFqgAM+2tSUKb+YBT?=
 =?iso-8859-1?Q?oF9EnRDJdnSibPIWDLAa2Yrvr+Mkaoc7jU+2379vOI7fzaHDuO7F8dhXHF?=
 =?iso-8859-1?Q?Zd04P72hRDhxFpBqBELYJT8fx6lBgxfBILuQRzrEngxM8oAxHoTeQe7Sk7?=
 =?iso-8859-1?Q?3xEOLsu9IR79oT50tbjCsg0SmuI3/nroYIY7hsOLrj1tIikyD3ZC0+UZEq?=
 =?iso-8859-1?Q?IVLK1lfnI5e7dra19aYw2Z5IFsmcoTfKVl98TYJ6OdiTwXM3X8EZZGcXbK?=
 =?iso-8859-1?Q?WgS75i/WSY1Di8B8QT3ZnXhBKzbVU4oLD6wL2WsmBQ4Z4wP5zcNb210TkF?=
 =?iso-8859-1?Q?4P1jUft7r3KVpb+Bx5+43rZktbP/3efzqxQw8lzppJw/BazDRopblpYNQZ?=
 =?iso-8859-1?Q?V8sHX6NaNnz7xuRRinaC5kwQ5B/prlZqnXe+1HgRJ1vbC9W69+WiSwk461?=
 =?iso-8859-1?Q?BhiR8Ddc9m95lL8p0sTq0QYN0PvU6a0BmkUihgW3+3r5BofLYSDAGuasX/?=
 =?iso-8859-1?Q?VCaiMPuHFiD8IU2sMM5MfhjX2pBjHqNMrPJ0KLKamZGZ9Oa9YjEutmqEUr?=
 =?iso-8859-1?Q?QLlo02v1osgOIQQgHR2FnATOWYXSEF48C2qXOpii46woiQNE+kUimEtkVl?=
 =?iso-8859-1?Q?DkTzIgkwOP/zt32GY/xn++RR5nJ+ZKwEysZdgB2kJ+8ozZlb+r6wF/xFib?=
 =?iso-8859-1?Q?dZ9FN5mzRc7dmvAwgpznBcbwi0PGGKaDOVTfBR8KOq9snViB+SQryv0XzE?=
 =?iso-8859-1?Q?ydXjJMk3t8VaB1SjQfxatMVP38Zg5WepSaGOTTys4ws68befrcBKPGVxDH?=
 =?iso-8859-1?Q?YVpCsXbtXAvYpoN6JtkeIFCtWg7lrXwgVIJkPJNMnazWnCEB+tQBGnfX+k?=
 =?iso-8859-1?Q?1KsDEX5Ra7F4yBQm6tcCkK2POCsZKqeyvSaN4VgnSTTMUkAzyDtioNnZkp?=
 =?iso-8859-1?Q?uWCsj/YvAbuWN2GbDwjZVKzNUGrSTYSECLlxH3kRZJXLOlj6h6x3ZqmZvd?=
 =?iso-8859-1?Q?FwL6s2OjLnasWXyRSGdHskwoX0tNN0HB/NwlaobxnXo/TJdB1Y+n735QEd?=
 =?iso-8859-1?Q?UbY0xxquCUDER3wFKfc7smiSrKwszD9B5o/4XRNZYSs/JCVrHSkVfHXNhL?=
 =?iso-8859-1?Q?V3bgxiGiZPv3nU+vkvfZxOrSZ8eSF0I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d06d77-e928-4351-f766-08de8a52ed49
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 09:43:10.5547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QKiwsN9VNYtHJLjR7r+peqU4bezwtOJ+83uS4aQnEoBItMuc5rcpWyl5KB3BcD0ALeUizXwSi+j9RNtulO851D2alXlmm5/rO54fLX1IVS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR03MB11006
X-purgate-ID: tlsNG-42698a/1774431795-9A0B1112-C0021055/0/0
X-purgate-type: clean
X-purgate-size: 1424
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:Oleksii_Moisieiev@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 7950F322628
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

 xen/common/sched/rt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 7b1f64a779..62188f37c6 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1388,7 +1388,10 @@ rt_dom_cntl(
         op->u.rtds.budget =3D RTDS_DEFAULT_BUDGET / MICROSECS(1);
         break;
     case XEN_DOMCTL_SCHEDOP_putinfo:
-        if ( op->u.rtds.period =3D=3D 0 || op->u.rtds.budget =3D=3D 0 )
+        if ( op->u.rtds.period > RTDS_MAX_PERIOD ||
+            op->u.rtds.budget < RTDS_MIN_BUDGET ||
+            op->u.rtds.budget > op->u.rtds.period ||
+            op->u.rtds.period < RTDS_MIN_PERIOD )
         {
             rc =3D -EINVAL;
             break;
--=20
2.43.0

base-commit: a7bf8ff218ca05eb3674fdfd2817f6cff471e96a
branch: amoi_rtds_SCHEDOP_putinfo=

