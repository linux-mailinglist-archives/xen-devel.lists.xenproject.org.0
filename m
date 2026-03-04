Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hUpCDGt0qGm5ugAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 19:05:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8B8205B2D
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 19:05:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245883.1545230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxqa6-0001bc-GI; Wed, 04 Mar 2026 18:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245883.1545230; Wed, 04 Mar 2026 18:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxqa6-0001Zz-DF; Wed, 04 Mar 2026 18:04:22 +0000
Received: by outflank-mailman (input) for mailman id 1245883;
 Wed, 04 Mar 2026 18:04:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YYFb=BE=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vxqa4-0001Zt-JW
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 18:04:20 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ec204cf-17f4-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 19:04:17 +0100 (CET)
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by BY1PR03MB7309.namprd03.prod.outlook.com (2603:10b6:a03:52e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 18:04:11 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:04:10 +0000
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
X-Inumbo-ID: 8ec204cf-17f4-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymcZB7avWz+upqpYod/pq+fsiZAHbbvaCVTsEpDhT5cqoR471dzK7HLSQLP1uujj+TEXkrvwifq93ExuqTI+FEUjiHBhwVP8CxtXysxjr+HpvohW4fG1DAg3uTb9um2wQr2UuK8aehW2PHZwlOWhYaFafwyTytU3/hotGOEFPD1KCCVBkjgMphhjRjafDS9EevXpUyB1JbgAih1SOMC31t88cFRB0iC49Ren5U94oEq87K5VplOMRRfsqbCdCEyHxwCj9k4s/WKxnAwztgEUwvyVlsL4znRJsAgjRu53BGkEq8ue+GrJBUS0XQtJzsca7BqK3LjkLQ2E7rJ+K6g1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dJQeHs9cvZ6btZc71IPUR3teyBS83Ug9Xkx1pLIiw8=;
 b=S2qZFIgmpWqJLigarlfN0L4nDIkuMBqrqEqwFRdnjgD28wUrDZTE0T4GZ5FGHup6DxTzvg7S4eUbHr4sEZqyrk6iGJlJdVv5W64dw/ZEtjXf5tsAQnkyamvVjNX5X+zYlz1Jm5Ikghtdof6JE7DWd2qbh1YYiXENYnNj/hipn9NCHCsEqkox9hPRbkIiiCzg8K8jWHWqvljDfORArFjoE6RXV7cwFGbSM54ZERKHyKTXziTphy7D49QyezvdNoIm7DUCGve7Bo0/Ou9ssHMLUoKzn16IaSckKEv3vdJClhMRPf+h4/Tbv3Jz0haykEItoAqWHFoTK6Xj3Iy4U/N05Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dJQeHs9cvZ6btZc71IPUR3teyBS83Ug9Xkx1pLIiw8=;
 b=xr3I0daXpgNT/0J6/z6cm8j171ODuFaJDF9gKiWBBqaLPgkEvVVLHFSVM/PTkz/SJQ8abCZY3tzMFNFE9oYMebeOhr2VjZfq6CpnjVDziAjKrzIkKXlh9iaz13t/s5taRmfyG5BQXO7osS3kEw2UjH/Cm10esbM0Xv7G68CV6bU=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 01/10] xen/page_alloc: Extract code for consuming
 claims into inline function
Thread-Topic: [PATCH v4 01/10] xen/page_alloc: Extract code for consuming
 claims into inline function
Thread-Index: AQHcq/LTrNW7h1OyYkqbdUVMe4OBY7Weji2g
Date: Wed, 4 Mar 2026 18:04:10 +0000
Message-ID:
 <LV3PR03MB77070CA8CBAD19F6DBB0E975877CA@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <7dd887bc26830d6c50e5bc2606391963e65285a1.1772098423.git.bernhard.kaindl@citrix.com>
 <91d2bd4b-7ca8-45fe-9e60-071d2cf2d327@suse.com>
In-Reply-To: <91d2bd4b-7ca8-45fe-9e60-071d2cf2d327@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|BY1PR03MB7309:EE_
x-ms-office365-filtering-correlation-id: 34ce544f-516d-4bb7-1cdc-08de7a186ff5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 D5or6y0hpUL/bObyAQK5z815Dbb0YvWxfSwFu5vJn5gl+a4tS4un3oR3hNfEF8h1/LfYA17E71XA8aRuusdWiqGX7ehoQIF2qOdbXoPvYZK9fbllLqIcPz7+5yne6Gfu83eTbQeruccn0Q7tzWLj6ZbX6X88/oqgx9ZrDDLlJTZYhWhH6TUSilrRVTNfUs9TCNL1yi4vKWH9r5v5dI401fkxOar+JlzyZqveScfc3TjGFpzgoze0LBfCvzuEGIkI15A8mnn3HA+/wxFp1kamgKAczeCxkq8FkJ+7Gr6dmu8b0O1PKkrRXggFFFgEYP4fGksC3wcgzrq2vrlVoF9fhOkM68jTBT5eTDPlfeDH2kEAE+CKuSddkXC9JNJCBnTed6eadxlHSSgGpxkefnzpM4VnbW96Z0uQWyYa79ffsHr6Og9fGjM8Ge9baqrmS9e2S3R0UqL3RrebR7rQnXuqfD5LdUfMuO+dqg7ruHlA8bjEDlo8W8Fe571vN/ZMP8fb8uuo5EiIk0qNeApS6cBd4QiSN6lFSpjZ2SAf8wwrNaGDz55enQTdjjhTOlMq0QuE3z9sosE+CWS5fR+FmqqwPeuGoSpvNSD6uaMMiufG7VEe3BhVC5wmUJWL+Bp9igG3yaDX8zNugKkUJfgmbcxtSQpQd0YCDxitr02zuprVStYUnHjlNn6bMJL3QyQt7ui3Uf3asgH+VK/vG6Ij/LmDG7y7ZO+a0HnFfBgmEh+s6xSTJhjht2hoJ4R6Bxp9cuGwBKLVxo7NVtUULKAhYFzKIHONu2PQU5Dcmudmi9IagV0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NDNDditqUENmQmR4MlhlSmFyMXJNb3BORzV2RkhOWHFzRnpRTTljVWd2RUpJ?=
 =?utf-8?B?bzdncVNRSkNac3JJdEtwUGlURSsvaU5lVEs5empHY3FOeFRFQ1hheWxHdTVx?=
 =?utf-8?B?NlBWMFhBSVY3c3V5UTRJTE9IZWVFVUNycHJ2UlZwT1BsYWJjUkNiczJPZElR?=
 =?utf-8?B?akFrK2tHQmVUTzJ4MCtNRGQ2bzNFZUZMOUNmV0hlZUxwVG1DSXFaZXg0Nzhq?=
 =?utf-8?B?YW9TTjIvbUFKc0hncEZ5enp1cWQrcy9rbjRZQVVlYU9GNTZNMHY2WHViSWZu?=
 =?utf-8?B?YjBBNExWYnpVVjFWQ3VWb0FIYjZmaW9EWmkxeENLN0RsdHJxeXhGZGhqQjJU?=
 =?utf-8?B?NVlHV1dadGFCVENXUEZQTnI0bm5aeGlPWVBsV0hmcnhwTjRXYzFIQ29KQUUv?=
 =?utf-8?B?NFlvRFFMT25qMGYxUEI2R1J3cVJPUm5USFNKU2h4ckdaMFRDekYzNzltOE0r?=
 =?utf-8?B?SWJlb3IvNWY0cmhzVjkyU0F4V3ZnY3pDY0lKeDVNMS92RzNPcVRTOEtvR3Rv?=
 =?utf-8?B?emtlQ0t5anJsY1EwZlhrWEZrTzRZUnFHa2JndDFGZnNNR2V5YU5vOFlmME5V?=
 =?utf-8?B?cWhNTXZxcmQyR3YrVXpBQll4QzhTc01FMmltTEIzQkpnWEtCRG9ZVXpKQjNo?=
 =?utf-8?B?Z3VBWU4wWlhGY283NlhxRXltVHdqVGsyc2VQc044VVR4NWtPT3JyTTUybDJi?=
 =?utf-8?B?ZDJxS2VnSFpqSVRxMzF4SWoxNDZqWUh4V0FlUmJOYjFpWDVmb3IvVlBUNzFV?=
 =?utf-8?B?anN1VXdRUmd2elVucmdFeVpZdkZSRnZxdzk4MWhPMER6QUg4bGFhY2xoTFBz?=
 =?utf-8?B?S1A0V1E3QlF6SzFHVU54N2hBazBWRjJrbmhYRFpMYXQ4Y25seTJ5YW55VW8v?=
 =?utf-8?B?cUtmKy9vSGozOHRmUXJwbEFIUHpGYko3b1N6Q1JZZW4wMzE4UUJZOFlwbjgx?=
 =?utf-8?B?UmNQekdDZ2lxeTFmSTNKSHc1MTUzbzVhYkxLM0JSV1FaWmhSV2toSTBkVmw4?=
 =?utf-8?B?T1M4TTNlYVp0OFFvaUJyU1M2OEVNNDRkamNiSU1JN1gxWlJEdk96a3ltcngw?=
 =?utf-8?B?aEc1emIyNGh0ZlNLVDBtTlh2QUcwNHhMS2NZUEtETDZ0TmRKTnd0bi9JTFg3?=
 =?utf-8?B?b0M0UzR1OEJoMmJDSE5HcGxmRG5lcko4Uy8wdUFhdFFmaWRsS0I5QkMrWTlZ?=
 =?utf-8?B?cjNQRFBBZWJKTDZvTUVjS3dudndDVS92OFYwOE0zQ1YwTXZWVUk3R0lndEJ1?=
 =?utf-8?B?cVMzVU9RbW43SDdvckJ5NStlR29BV3NJRjExNUpxTjZicFBSaGRHUG8wa1Rr?=
 =?utf-8?B?c3FCalptVjNzMjg4NHlacXVBTjNkQ2lzK0k3NFhTYjZwTlljV0ptZ0NDRWND?=
 =?utf-8?B?VEdncElMMGRyZGlPTEk1Unc2RnBZUkJ2T2tKZ3ZyTDZ2cTUvTG42R1J3bmxK?=
 =?utf-8?B?eGZmTnVDV2FFdVk1SnVzdm9lQk9OWlVvUGFST1o1d0FYRzZ5Y05iZEZtbUhs?=
 =?utf-8?B?b1NIeStQWDgwOXJqWWN2RmxVL1NPSnZscVJqa3c2VjF6VC9NVXJvdlZIQzAx?=
 =?utf-8?B?YVFCUVBvalZ5cUJlb3RqTTdMbmV5dSs5bmxWMmVTWFhUV1N3bXBFQ01OVHZa?=
 =?utf-8?B?YWJJUFZxdFdMbkhZbmR3ZnZJVllaM042Nk0vSytYSVZtSEFTZ0diVUlaWU5q?=
 =?utf-8?B?bngyMkEyQmlsajc4RWlTZ3NQNzBjQUhTbnBSSXhySEtrRnlBd3J4QTVUeTdL?=
 =?utf-8?B?QkVNL3hVZW0ycCszZmY0emw3TG9lNmZxVzVWWVhuMkl4aUdKUmpmY3EyZmI2?=
 =?utf-8?B?M3VPSG51YllFVGZhRDVEeFpZaEF1UkV1RFR5eDNkZWF6MXcrRnpnZEh3U2g0?=
 =?utf-8?B?MjNEQzFNWVNEMmkvS1IrV1NHN1JhZmVocTRaVUpNOTBNOGxYY2RXaVE5cDFv?=
 =?utf-8?B?d01hNWFYNDVubkNaVmdKVy9ZODF6a2NwdUllNUM5M1o5bitMUXR4S2FVRHRQ?=
 =?utf-8?B?TE5JOFU1akxSK1VSR3hlMHhnWVJoaStGcTV6RlFrWmI5NkpHWWR1TGROekFU?=
 =?utf-8?B?VzZGT3Ftc09VckEvY3paek8rWVhNZWRZcFAralZjUWZBMW1qU3RNZ1hEczA3?=
 =?utf-8?B?TGhxcEdjRGlNWUs1OVJxSndOeE9yRGZIQi9vaVRFVmNkZklBeWJSVlp0ZGtp?=
 =?utf-8?B?MlUyVWlBTnduckhCamRXRnVzVU1wUkpOdGtwKzh0ejgvNFdiakV6SklaVldP?=
 =?utf-8?B?RElpeHVyOWZEUEVVNE0vS29ubjBJa3pTNkZabktDNWViajNEcU5wK01zbUJX?=
 =?utf-8?B?ZHJBWDFyS2ZSRFowdGp3bGF6dzNkRWswdEVWREgvTzBBZnpiaStKQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ce544f-516d-4bb7-1cdc-08de7a186ff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 18:04:10.8717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tZ3jdcgUSdYjJfxaAjYBkZZFa5KDc3HXsH8osrov1n5J0/fmh+02NHRWp9RpsaBoudC+4yyfSjvRjVqnuCXoyvyD1xJTliwusmT6RpuweCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7309
X-Rspamd-Queue-Id: 8D8B8205B2D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	URIBL_MULTI_FAIL(0.00)[citrix.com:server fail,LV3PR03MB7707.namprd03.prod.outlook.com:server fail,lists.xenproject.org:server fail];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

PiA+ICtzdGF0aWMgaW5saW5lDQo+IA0KPiBHZW5lcmFsbHkgd2UgcHJlZmVyIHRvIGF2b2lkICJp
bmxpbmUiIGluIC5jIGZpbGVzLiBUaGlzIGlzIGJldHRlciBsZWZ0IHRvIHRoZQ0KPiBjb21waWxl
ci4gRnVydGhlcm1vcmUgd2hpbGUgd2UgaGF2ZSBhIGZldyBleGFtcGxlcyBvZiB0aGlzIGtpbmQg
b2YgbGluZSBzcGxpdCwNCj4gaXQncyBjbGVhcmx5IG5vdCB0aGUgcHJlZmVycmVkIGZvcm0uIFlv
dSdsbCBmaW5kIGFtcGxlIHdlbGwtZm9ybWVkIHN0YXRpYw0KPiBmdW5jdGlvbnMgaW4gdGhpcyBv
bmUgc291cmNlIGZpbGUgYWxvbmUuDQoNCk9rLCBJIHdpbGwgbG9vayBmb3IgdGhlIHByZWZlcnJl
ZCBmb3JtLg0KDQo+ID4gK3ZvaWQgY29uc3VtZV9vdXRzdGFuZGluZ19jbGFpbXMoc3RydWN0IGRv
bWFpbiAqZCwgdW5zaWduZWQgbG9uZyBhbGxvY2F0aW9uKQ0KPiA+ICt7DQo+ID4gKyAgICBpZiAo
ICFkIHx8ICFkLT5vdXRzdGFuZGluZ19wYWdlcyApDQo+ID4gKyAgICAgICAgcmV0dXJuOw0KPiA+
ICsgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZoZWFwX2xvY2spKTsNCj4gDQo+IFdoeSBpcyB0
aGlzIG5vdCB0aGUgZmlyc3QgdGhpbmcgaW4gdGhlIGZ1bmN0aW9uPw0KDQpUaGFua3MsIHdpbGwg
bW92ZSBpdCB1cC4NCg0KPiA+IEBAIC0xMDQ4LDI5ICsxMDc1LDggQEAgc3RhdGljIHN0cnVjdCBw
YWdlX2luZm8gKmFsbG9jX2hlYXBfcGFnZXMoDQo+ID4gICAgICB0b3RhbF9hdmFpbF9wYWdlcyAt
PSByZXF1ZXN0Ow0KPiA+ICAgICAgQVNTRVJUKHRvdGFsX2F2YWlsX3BhZ2VzID49IDApOw0KPiA+
DQo+ID4gLSAgICBpZiAoIGQgJiYgZC0+b3V0c3RhbmRpbmdfcGFnZXMgJiYgIShtZW1mbGFncyAm
IE1FTUZfbm9fcmVmY291bnQpICkNCj4gPiAtICAgIHsNCj4gPiAtICAgICAgICAvKg0KPiA+IC0g
ICAgICAgICAqIEFkanVzdCBjbGFpbXMgaW4gdGhlIHNhbWUgbG9ja2VkIHJlZ2lvbiB3aGVyZSB0
b3RhbF9hdmFpbF9wYWdlcw0KWy4uLl0NCj4gDQo+IE11Y2ggb2YgdGhpcyBjb21tZW50IGlzIGxv
c3QuIFBhcnRzIGhhdmUgYmVlbiBtb3ZlZCwgYnV0IEkgdGhpbmsgYW5vdGhlciBwYXJ0DQo+IChp
biBwYXJ0aWN1bGFyIHRoZSBmaXJzdCBwYXJhZ3JhcGgpIHdhbnRzIHRvIGJlIHJldGFpbmVkIGhl
cmUuIFBsdXMgaW4gZ2VuZXJhbA0KPiB3aGVuIHJlYXJyYW5naW5nIGNvZGUgaXQgaXMgYmVzdCB0
byB0YWtlIHRoZSBvcmlnaW5hbCBjb21tZW50YXJ5IGFzIGlzICh0eXBvDQo+IG9yIGZhY3R1YWwg
Y29ycmVjdGlvbnMgb2YgY291cnNlIGluY2x1ZGVkIGFzIG5lY2Vzc2FyeSkuDQoNCkFjaywgdGhh
bmtzLCBpbmRlZWQsIGl0IGlzIGEgZ29vZCBpZGVhIHRvIGtlZXAgdGhpcyBpbiBwbGFjZSB0byBp
bmZvcm0gcmVhZGVycw0Kb2YgdGhlIGltcG9ydGFuY2Ugb2YgaGF2aW5nIGNsYWltcyByZWxlYXNl
IGFuZCBhdmFpbCBjb3VudGVyIHVwZGF0ZXMgaW4gdGhlDQpzYW1lIGxvY2tlZCByZWdpb24uIEkn
bGwgcmV0YWluIHRoZSBmaXN0IHBhcmFncmFwaCBoZXJlIGFuZCBtYXliZSBvbmx5IG1vdmUNCnRo
ZSAybmQgcGFydCBvZiB0aGUgY29tbWVudCBvdXQgb2YgdGhlIGFsbG9jX2hlYXBfcGFnZXMgY29k
ZSBmbG93Lg0KDQpCZXJuaGFyZA0K

