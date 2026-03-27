Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIyjGtxqxmmkJwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 12:32:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF073343810
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 12:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265438.1556359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w65Pq-000323-OO; Fri, 27 Mar 2026 11:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265438.1556359; Fri, 27 Mar 2026 11:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w65Pq-0002zl-KJ; Fri, 27 Mar 2026 11:31:50 +0000
Received: by outflank-mailman (input) for mailman id 1265438;
 Fri, 27 Mar 2026 11:31:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w65Po-0002zf-V9
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 11:31:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w65Po-0081Im-B2
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 12:31:48 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c66aa2-5cb7-0a2a0a5109dd-0a2a450ac24a-6
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 12:31:48 +0100
Received: from [52.101.66.97]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69c66aa3-1772-0a2a450a0019-3465426124f0-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 12:31:48 +0100
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by DB3PR0302MB9182.eurprd03.prod.outlook.com (2603:10a6:10:430::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Fri, 27 Mar
 2026 11:31:46 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 11:31:46 +0000
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
 b=PvkBtO7ZPPyi4ktds2t0fZYUvo8SP/Q2pdHFO9qzlfR6zr10kXqnJOcXg7EM8pT7PX3nLVZpqDV6WXjkQHonjbb7bc8Ibp20aERqtyfY27N80X67ZNmXlnwplCpSzUR/0snCfmvwJVX0KwFccDXWkbnNTyGNrn8eitnEVG/eG0Q/UziRqBpxzKTPGzkgeB1eDotVnVKJ2ChneCsarll82mwd9RspjMV4QzKUh/nsgzdZpaa5nq6Tfg1ZJs1YF7KkyOx9Jf20ZPQTQtc/sTCzZmbqtWoAdDvqQLY3pTlXVUBMZoqOb4qJaGkS8Xodi+X889lRmTjGrJrhKfbYp/F8Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzNxvYqU5Nk3XBoeZ1EiMkn0Wrn2aF/uhbEso1rQ8Ms=;
 b=zTNxvc2D7T9dg3kH/kBdj5fpAArIHgU4n/iTqKXXCzVrVwqEHgvEp/4jjm1YNATg5OZ1faX8+2Gepr9Fe1SV61NEnP72m3WUXNA2TWaBQPV0J5IBrx5LbOXbzLBfaBe5a4Tdxovmr3cjmE4qb0X6gySJ6iUWwScUrD6J+laT5Qvmr94Q5UVPseHzhBjAT0C7TcdX6YuSMN0nVQKkQdUKLdxdByYY72vCs2323h0loukLZgkXWMWUp1IwyD90XSH0fP5+qmrMkW5mJb9o5GHrWZrVc2JOz+c9/TshM9tLqJRgI8PPEp/EYKZ+kcyI96/N6CM9eJA21Jz3fOzdercjJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzNxvYqU5Nk3XBoeZ1EiMkn0Wrn2aF/uhbEso1rQ8Ms=;
 b=poXW08Gw9B0m2tTvFmOYc707QgqaWkqr0hNQQrn3o475otGTdv0ztf8tKtoiWsrxNJ2KhM89cQgb+eNSoUBIRI3Jx0XEXEVt981w7VwbeasqAUqUHrHr0k0C0lQFX+Radrxy77yWhpcp69kCUxAVP1Fo0aj4ExPOPD3oAmOiXZZSbEYk0LBwfWwk4Aze7sVKINMG4i1pF7lngJkbvjL/weUFvFcPlyoWFb6q74gW3kYFpwCU8w2kPEXVL9Xdrj41f6054ezkBm/EBhLRl0W9xayEVrOGkMVtejCNlM8I8ssukpC+N78rKsAWsE3Lr9SmpNej39HMKJpgnb5Y7Q0huQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Oleksii
 Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v3] xen/sched: validate RTDS putinfo period and budget
Thread-Topic: [PATCH v3] xen/sched: validate RTDS putinfo period and budget
Thread-Index: AQHcvd1L1b1gojMWXUypwX1G4oeCmQ==
Date: Fri, 27 Mar 2026 11:31:45 +0000
Message-ID:
 <06fbc96288c6aba60369914c2cdbc656ca32fcf8.1774611038.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|DB3PR0302MB9182:EE_
x-ms-office365-filtering-correlation-id: 7ba6c45b-97bf-41de-9c59-08de8bf46d92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 bOzRRMnTKbj56MjYiuOPySDefE+npRLqql+bLdfa2xEWqpRGN23crU1wT5gZH2yaABw85+q+dLDZ1GLuWyb88G1T+ZKnnBR9sUswSljuj8iA+ldLPkyoGjcQW42uxqSu9q8PhS4HJKcEucxP9h/V60BNRjR25E+Uq+mvLHNqUvf3IqUSWQuB2evolEAH/2rIgdDHGJBG464d8viQhhDLCpSCQZCrg/1vY+Qu+8agrFF0ZgMKkymAghLCHI/W1O5QvSgZymIxwrL6mAXmYl54qGpNZge7BHXLiUuhMk/a1YYK3oLVjvASiV5DdVuBEs1jzluYa0fGkCb00u/ehrfFItv05xRMe7s6iR6cH64tk+kC2V8jVjIlZ5sZkuVoRL5FSLO3449KGEVQXbYJIY8wrtigYBPdAXAqt5lsItxq+mw+n0dNjsFVssqyH7U6hVgrIxm5ND5r6hhgAj5qEMEFO7Mur0BszaRdse1oB+IDhs7L80fX4eL7r7LtmiHPMBbZ3vDB077eLMv/NGoRn1mDGR5XOdz+Qj0mC4D5V4G0vzvr7IzwwNIzcg869C64XGUXdjQcGamMRm1/pYyUM24zKz81vF67Hxg31qxJ9GovFsxCefsFkTQtQeSZ4sjIsli8JwoWa9e4HssXLcVQuoCqc5nBfK+3J6Fa1kVOYaRoBq2W5H48V+ShZsiFLwCcYe+AIKY9Zi1iyJdpGP8jiFBE/N/bxxrJzaAPmO/lwWcE5p3ywu0M8Ixfyy+OXLAELef29Ie4+SgqS28cxtGuUKkXbbTAjpW/u05MC3SC0Sska4A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kGQcGQaWMRNdOyOLVQPXK6EyDFHbJ/PGlwLUL3y9j5Ol5mGCA11uXk3qKd?=
 =?iso-8859-1?Q?Vglksa1k8yYDyIoNCmoxgeZe6UTFUej09AXM9PavAo1+Fet8QpQHCugYea?=
 =?iso-8859-1?Q?eXJWaekGSmq+2gUkU4PrLDS6jPskquHTRmYK9O/Z5EVrYEoGWdWPLWFw+7?=
 =?iso-8859-1?Q?dbAJ22R37l6vmoMbEnbR6Cxh7r9ZWbN8KeUA/ldkv5FOUWxDdAvelFMJUc?=
 =?iso-8859-1?Q?Hy1BuVjo7VmYU141JreoVmB+VZSoxbJg0X77aKZPPSPjsfciAY7oDTmUJ5?=
 =?iso-8859-1?Q?J+MmSHw/T+K4ltP6UOjPP/75O32hhkledv6hguXd2x7SCj0yzJXIcfms2V?=
 =?iso-8859-1?Q?ZRX5DmCm+gK8zsFJAbVCsvM2QKCCGSar/oxKMsSEpSxNzRvW4Kxye9zyw0?=
 =?iso-8859-1?Q?9mGDNEZyOeGP5P4GyJXac5zauNcLYa5WXXlm+WWpsiB+5LrTZaGuPp/MGM?=
 =?iso-8859-1?Q?wddSaPYLJyucBf+WLjYgnOGCSOaEBkILFpiEbHmt4yLmWHU3LSjVgINrz1?=
 =?iso-8859-1?Q?aRlWmPQRg/Tu24KyGAhH+psKxRzupQn0piw/SvT3N2/XKyMRjTUXt/1dtE?=
 =?iso-8859-1?Q?DQP3oThUmJh9XTKTkfKD/n97PwN5RYeQKFOsyuhD+M1wNZaC4fW5p8BVW2?=
 =?iso-8859-1?Q?ZX2P9lbZMWR11dbcNYUgH23qdRgZeuTmmPMaMM6XZtRB7nrwJWyzSmc+fQ?=
 =?iso-8859-1?Q?+D9IKYDa9fPCK+eoVqtjv789Gl6R7R4zq1UcSJqrBcrko9yFrDX4iiEWds?=
 =?iso-8859-1?Q?757GjqKZSkDZQugV/droIfPPsf7mn0dvYGnr1HovwNJ6LhCVAqIiCGOxHU?=
 =?iso-8859-1?Q?Vqi4hvtWluErTTg3ZWvAtg3fGhA2/PvOz/JLgv359bDFw42876ze6rdyze?=
 =?iso-8859-1?Q?5MicHb/5ZAXhv6cuOpaheazwZAYY+6mUN+lgtuwmdn0D/08Cdg/3Pbtw2A?=
 =?iso-8859-1?Q?f+spxaAM/obYE0JHHczG5T6mXwGZEtZqe5kP4z+aqa6tMC/Ar7KsgMdFtN?=
 =?iso-8859-1?Q?6mcCgI6IjpZczxxwaZ4FXY3Vy29ulbpOKGRNKwyLftCDKSjpnk7dEpeWH9?=
 =?iso-8859-1?Q?Qci76LFKs+BYQEgi6JdbrvflO9/wbHu4FZhF96XeiazTfH+cnr7h3XqwJm?=
 =?iso-8859-1?Q?meUcJ67jqkMYedDQlUcbQVvP37R1d0kP/DTBJ7uGVJm1sy/LfYmP0B5tYS?=
 =?iso-8859-1?Q?6u7T/BhB9CptBrsf/CCT9f6HIxt3fPrUj9mk9Tjx1Rgu+mM6N8ANWab8yT?=
 =?iso-8859-1?Q?rZdKwtFOxYKKEO28ETzhFjcdY3hLBx+Qc1rrRaOmwluI8X7Ufz8lCEiphV?=
 =?iso-8859-1?Q?4fwsQMvKZSlMqmWYTffz7P2aHUs7UK1dknDg/AzZlPuVqA1+lAnt86aQJF?=
 =?iso-8859-1?Q?Q7sDp0KFiJBowNMv0YXQcpb77RCDKI/uEbNLGYH0DCB8yA2eG6vkEQnygo?=
 =?iso-8859-1?Q?enZo5Vkmg2cohohci3KFaaCbLkj4FW79I1XIrXBUqVuRMLquLxDLWpwQjQ?=
 =?iso-8859-1?Q?bf1BpMYpiWyJz4d/GaRS6OSulirPscDVHYybF695O3227xZ84VVpMJMKRq?=
 =?iso-8859-1?Q?GcL+PronebZn0RO69HZp9nql1y79OtHeMC89r3k5nBr58+1AqSrMMFFGol?=
 =?iso-8859-1?Q?tcI0z3N6OZHDjXLdyD7ygBPUgjJVwqADvox0qLPDg83aMn4zGiv44/CNRY?=
 =?iso-8859-1?Q?o08zU0zvsa05rmm76P+98ztPkbQJv624YAz5ZoiuaclxG1hdatcwEG+hji?=
 =?iso-8859-1?Q?JI5EKgGbkPKMZQDlhcxce+qdeCb+FmDgvJqczRkU/g4bP35DCVKVSM+La0?=
 =?iso-8859-1?Q?yH8w+HUYqicUgUQdJYG+oLRbHv737bg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba6c45b-97bf-41de-9c59-08de8bf46d92
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 11:31:45.9204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ueJDqU5wBhP8D1jAM3kaTORxwbWl3PMcf1Sb5G0mnARTCWCLXGtLlTLMjzVVslPycs8EbniCWuPaLmOtyHO88drLSK1WbdYG9WbKu+UEFiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9182
X-purgate-ID: tlsNG-4011c0/1774611108-BE691900-B97CB0CA/0/0
X-purgate-type: clean
X-purgate-size: 3271
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
X-Rspamd-Queue-Id: BF073343810
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

Changes in v3:
- changed rt_validate_params input to get struct instead of
period and budget
- improved code readability

Changes in v2:
- introduce rt_validate_params helper function to check period and budget

 xen/common/sched/rt.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 7b1f64a779..c161bf7f78 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1362,6 +1362,23 @@ out:
     unit_schedule_unlock_irq(lock, unit);
 }
=20
+static int
+rt_validate_params(struct xen_domctl_sched_rtds *rtds,
+                   s_time_t *period, s_time_t *budget)
+{
+    s_time_t p =3D MICROSECS(rtds->period);
+    s_time_t b =3D MICROSECS(rtds->budget);
+
+    if ( p > RTDS_MAX_PERIOD || b < RTDS_MIN_BUDGET ||
+         b > p || p < RTDS_MIN_PERIOD )
+        return -EINVAL;
+
+    *period =3D p;
+    *budget =3D b;
+
+    return 0;
+}
+
 /*
  * set/get each unit info of each domain
  */
@@ -1388,17 +1405,16 @@ rt_dom_cntl(
         op->u.rtds.budget =3D RTDS_DEFAULT_BUDGET / MICROSECS(1);
         break;
     case XEN_DOMCTL_SCHEDOP_putinfo:
-        if ( op->u.rtds.period =3D=3D 0 || op->u.rtds.budget =3D=3D 0 )
-        {
-            rc =3D -EINVAL;
+        rc =3D rt_validate_params(&op->u.rtds, &period, &budget);
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
@@ -1440,14 +1456,9 @@ rt_dom_cntl(
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
+                rc =3D rt_validate_params(&local_sched.u.rtds, &period, &b=
udget);
+                if ( rc )
                     break;
-                }
=20
                 spin_lock_irqsave(&prv->lock, flags);
                 svc =3D rt_unit(d->vcpu[local_sched.vcpuid]->sched_unit);
--=20
2.43.0

base-commit: a7bf8ff218ca05eb3674fdfd2817f6cff471e96a=

