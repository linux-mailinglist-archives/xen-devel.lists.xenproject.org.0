Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDbCKsrh02mgngcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 18:39:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293423A55E1
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 18:39:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274255.1560423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9myf-0002Dy-UT; Mon, 06 Apr 2026 16:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274255.1560423; Mon, 06 Apr 2026 16:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9myf-00029W-P1; Mon, 06 Apr 2026 16:39:05 +0000
Received: by outflank-mailman (input) for mailman id 1274255;
 Mon, 06 Apr 2026 16:39:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w9mye-00027D-76
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 16:39:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9myd-001MTX-9h
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 18:39:03 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d3e1a7-bab6-0a2a0a5309dd-0a2a4506d52e-0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 18:39:03 +0200
Received: from [52.101.72.89]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d3e1a6-0df0-0a2a45060019-34654859bef8-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 18:39:03 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB6817.eurprd03.prod.outlook.com (2603:10a6:20b:2df::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 16:39:01 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.020; Mon, 6 Apr 2026
 16:39:01 +0000
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
 b=ZKjB98zHVj8wfjTuY6TUHKHh1QvFVyY23V9ezTfIPJSEQLyw7ND3NROq5+cH14soYQMnQznAiQpLmXZiR8KEGIEgBDbhsEoj40THWQF7Q/rvoGNZF1MSEQgOKhq8uUAH+Z22XinxkqYteDy26USDFZ3savB4ibCoYuYYGNuwRl2AMqzbRP0WPZwnBiLI02gMiwxWtZ0TThMls16P7hoW7ja77fT8SOlOhr6FN/QVcirqTA5Q5G9gKbQtRG1o0+wfQH84ItlLgcDvuviY3sfqIwKer/QSP/bkgEZE3fauGnfZmBkAnsbAAPOP/mxgoP4J9kXoeZ/S83Q6YgqbNWZ14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbEO3RVvEwhUUyzboTiopXddvgM7h+yrLsQzWylsC0I=;
 b=rCYfuE/AhGdoovguitZWJIKW9u3vOKLyVQeDIzQXxxjrEe0tA+GQyEpWricIrAi6e03ERW/1idSwmvSgygpCG+u2Yjtikze/ISwaDbzAvMahgGUzef76fkzHJ6uv4Fs5HYhfdZo7SBoYtunNKFEt7vdPbJz6hlVI7jbnWkha83zA/M+M2bDk9bkZ7dgw9bgUb4/0EOD1kO+yqzMhsjEfmPc6XOIVIqgouaMeTE30qTfqW6Ing6FNZui8IUvA25aa2eZK7D5lyxY6TzF2GQjHVdmJdVeCZG/XZN4Ko+/5JwYb5tu7/xo82NqvOaGf7b4ToJRIQBFVpzIglSDNmqc2Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbEO3RVvEwhUUyzboTiopXddvgM7h+yrLsQzWylsC0I=;
 b=QFHWvLObFTWy1nosQLJUaX8xTaLbfo1QOQJMyinUgvYSRLQfnS1uXsgwuDNLR2b6bhy6aAjZeNvOcEWj8Lj5p+f8SlDR5X4ZTCRbu+UBsko/gDRIK7ODRgSmFLfbhzOYUXogXfvG+qk2vilA97dKtLufl1y4b0OCGtfVQGA/QEKtqrTq7PIQsL8gDP1BNIRVHUMhNeHVgBICoqHGpii4PSYfPte7r1Q5j3rOnau7gSOg3uOuQ1rqYWBiVgVP22gzxmQj7aQGG9YJK6nuei7pd4RIWlT2wNJqtLwgBBC+N8+itySvnqhOVPXm5hZSEdaI9TXskSP6vE8D/gFniW66cA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v11 1/6] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Topic: [PATCH v11 1/6] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Index: AQHcxePfx39ACAuRcE2aBj5D+lufNQ==
Date: Mon, 6 Apr 2026 16:39:01 +0000
Message-ID:
 <594def52910bbdac9a30d2e4a397b044411b66a6.1775493499.git.oleksii_moisieiev@epam.com>
References: <cover.1775493499.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1775493499.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB6817:EE_
x-ms-office365-filtering-correlation-id: dabf50da-5c19-4139-4c41-08de93fb021c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|38070700021|22082099003|56012099003;
x-microsoft-antispam-message-info:
 a/txYcaIINzLQsAakcO2ScQeUDcBs3Ycul6CJ+UlOi17XpAhMJM7PUpVkpo5lMTTTDfJPDzdasBzy9jFW0jzOVmWbymn3IfgQHrNQZmJp9LnlxiyCvXUmDRr+m9/esoV+AOoX/L7g5m1MT7k42OmQBCnhuzzJ2sLbd+ocDXyIupcWARlLPg+L48hNG0Dc12qZFpg3K7Ves10g2XOFpa/IP3B/B0yMY+YVJkSYdnGQeGSGxRUFObL27vbUozyH/YavgiwSJu9U8WP9aaDuAhThRtpgYR6yE98DGDS86nl3UXuvznBmcLWNiTaf9wmj73IHYH3NZqjv1qnA7nzicu4xGa7jvGZ2X+KqeA0KglNOwoDbW591qdaBhlQV4z2gDlo9FN5Vke2PnpiD26VV2LVERzfkA0edGog/A9bBOie5sPr9bdGe35X/U1jpUIWCaxqPv09mMiyIkBBMgbWItnZ7ZPQITj13DPZrAmb32VD5R08X4o2A8Cdin69gZJkBQV8BRt9S4wwaLJtnk/Pd0CY7a1Tx8QODGFCRPXgog/4lsBupuyxWj3t9MVybncs134kHb+SkviOvI4tB3RRn5XX8yk8ohW/d+RlBHvfdAyk11aWPv9SEjjEI/pJxarnri/8QWvwNdP7gkkHDl6X+aBeH5oWdWVLUygeuzGhu7sfqx9JfKzafnmwsYukrcGnsn/ZH8HiUUNRiDmSDgFpJlFgSI6EgfkmVcidvj8uJcasGDUniTLpP+toviSXY/hzhPUX9X149Oy/gCl2GOO84q9JrzOc7biFk7OcZdhzOk3iVBA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(38070700021)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y1J6NDl1cFMvbjFJNFZlZTRhWENTVWd5R1RVRTVFVDRJbThIb3BnTy9XeWNw?=
 =?utf-8?B?TkpTUC9YSXQxQWxqRzZ2aWRGRFhxN3J3NnorRnpJcUhpTEE5Rk9zRzUrWWZi?=
 =?utf-8?B?REN0cnlWbnpCYmZTVEtQdzBBblc4QW9vUU9maWVWelpvajNKYjVhNUtaaWd1?=
 =?utf-8?B?YXVLZ245RU0zeERBMEhwT0lrN21TQmNuVmRiemZhb3ozdkVCbFI3OHNSbWRw?=
 =?utf-8?B?L255bzljaStuK2xxTVRBcmZWbUFqNXNOTHZOMWhwN2dyNDdCaUVZNXpsK3J3?=
 =?utf-8?B?MkpNRkhnUFJQK3dPbVI2L0h0cktHMXRuM3g2TVNNTHUza1lSaEdwNkYrY3FE?=
 =?utf-8?B?a0FabmJTajk1RFlOVmJaSFJzZDRlWjMwTnRZL0RRUUtqb1FSVVVZTjcxQmFm?=
 =?utf-8?B?Q3k5ajQ1VjEwYllxVlQ5VmYraTZLanhIcDE2U3NLVWRtLzVXb0JFL2RuTWJX?=
 =?utf-8?B?R2g5cXROdmlVU2pMeG1OMTUramVpckk1dlRLTS9ldzkvZE5MbkRyb2orNEZE?=
 =?utf-8?B?WGw2V2Y3dWljbGh4ck1YNk9WeVpNMnJqN05OcmhyMlhKRWZ2aW1VczlRQkYv?=
 =?utf-8?B?UnRvSTNZZm9DSkZMRGxWdU1FK0FyZ2tlUEdJdktXOFBrZ2FtTTU1bmJFZnRs?=
 =?utf-8?B?NWFSSG5seXZDaFk1YXBjcnlLTXlOOXJOZ1pWamJCOUxpZ1ZReU44TTF4aFVt?=
 =?utf-8?B?SUFqZVlOaWZwcy9PR1QyR0FpZ0FPWm96ZzArbzRnUk8waGZuTlNtT0xReFNF?=
 =?utf-8?B?Q3NnS05rd0lBbEJZV3U3aTBvbHgzNmI5NDJpTDdQYlhiSjlHeCtFOXpxUFdy?=
 =?utf-8?B?akpGNWhIQnVaYXJpOUYrQXEwZGM1VXRaeldpVll2elNPQ3hrRnEydUpRZ0Yv?=
 =?utf-8?B?VFRmWkZiOFNVLzJxUnVtb3hmeURmckVUVnZ4QUp6TXFwZzBweEp0alZvK2ho?=
 =?utf-8?B?cXpMbGxFSTdtY3BwMXRjNysvTk5xcTBmM3cyWnNVYzRneG5adlZrYWQ0cnNY?=
 =?utf-8?B?RVZlcUFLTlcvWlgycWVINFd0WGk5azMySm84cHl6RG80ZGs5Z0QzTkxRWkx2?=
 =?utf-8?B?N1JZZjJTdTNBVVpHQ2I3amI1d0xYcGVQc2tQNnROemJjc0ZNcU9JVmFvZDBG?=
 =?utf-8?B?ZHk2ZS9WN0tyZ3U4bmhML0k4RHRrNWRTRXVRbXdINFlzc25ad3VhTWpEWXNV?=
 =?utf-8?B?R1drUWxsWXA0VFRRNnA1SXg4Zi9TVlpCSWZwWEpNdTZScGxMelJRKy9Ka3Nv?=
 =?utf-8?B?b3hsSTNOR0NKdWtpL3QzdWNTanRvZmdEbHo2cy96MGd3SXc5cGRHRzcyZnVl?=
 =?utf-8?B?MThZWitLN2tueDRjV1IrdWZkS0N5YVk2aEtIN3NWUEVTTEQrMDdDR213cThB?=
 =?utf-8?B?QUo0dzhVNmJtODNFODR4ejZSdDZ0bklydXQwQmU5SURqeVF4U0x1L0owanlz?=
 =?utf-8?B?Wld2ODJJeVI3Q0ZMSTVUQXM0L3ZsLytoMDVZZTAvbk1nMnhXV2U4Rm5Sd3N1?=
 =?utf-8?B?dm1SdXpPYXUrdDRlWjM2SjZlQXJPazN6Z1p4a2hSWmZsTnFnUThaVjNxZjl1?=
 =?utf-8?B?Y2F1YmM3cDhGUjB0QkZ0UXpvRVhGdmdrVThIcVh3dVFVRlpUU3hYYVM1cGh4?=
 =?utf-8?B?QVk2b0VURUZJeStMTldyejFPNUsrSWhpN0NIdTJmcUdZOS9Kam1pYzJMU1F2?=
 =?utf-8?B?TytyeWFrY0NJU3NyeGxnUVlBM2RCRjk1SDhmM2V3T281cW55NmVGdk5uZFp3?=
 =?utf-8?B?cGdmMFhIZlVzSlY5UGJkcnE4bTBmQ21DNnZoakpMZHBMOHk2NmFQVk5PSGZo?=
 =?utf-8?B?Uk9KcjYvOHV3N0J2VmNDNGhQSWhwZGhuZHh3MElSNjhGSnBsSzc0bk5wTkFi?=
 =?utf-8?B?Vjd0VVBCWUtyeGp1Y2U1Vk9qV05sVG91R1hMTjdFKy8ycUszV01hN1Q4R1B5?=
 =?utf-8?B?VkxEN1JnYWRJWXRGVUV6dnZ5c3Z6WUF2dzlpd0hrbHFaOVRyaGdtRUZvSUpj?=
 =?utf-8?B?ZGQ1SFVYSWVzQStwenYvYjlOK2Y3Zy84T0JpUWhiMVdzTE9RVHFQblhXa2pv?=
 =?utf-8?B?eDVMQlprbEwwdFYxc3dVb2h6V1NoNlh0eDcraWNxcGR3d1ZldkZvSE5peDQv?=
 =?utf-8?B?cFVyVFErbkJ1bDcrMW1lMFRIM1g1NktuVjlObWQ0ZWxxTDAzRlJoaHh5YnpG?=
 =?utf-8?B?dzJHWE81bVp0L2dEclBGemNvaWZuQ0FJN0lNTm1hRXFkSnZORDJweE1qSUZB?=
 =?utf-8?B?MW9iZFZiOThWVFhSdDRDWFdlL2QwQ04zL0hSclJpUmFDZ1lJNFIvNnIvTGcv?=
 =?utf-8?B?TGlrb0orQ0RSd0dZOWpSSXhlU0Fzdm53UjlrNDJTZFh5NUQ3dWlLZHZxK2FH?=
 =?utf-8?Q?TPc4zKba/mtU4Wls=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0327011C25F854AB6AA48839287C104@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dabf50da-5c19-4139-4c41-08de93fb021c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 16:39:01.4217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zPsvbWao3jTIlOA/uC4PtatftmIaMeWTXSGp+DD/5a3+QiioRkt9xPZcpGiyrwMWHQGvGpaaz/BZh0pDRO4GCve79J8nxaAF+d5u1zs09Zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6817
X-purgate-ID: tlsNG-16d1c6/1775493543-5DB2B3D8-C3150066/0/0
X-purgate-type: clean
X-purgate-size: 11048
X-Spamd-Result: default: False [-1.08 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,e6508000:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 293423A55E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RnJvbTogR3J5Z29yaWkgU3RyYXNoa28gPGdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tPg0KDQpB
ZGQgY2hhaW5lZCBoYW5kbGluZyBvZiBhc3NpZ25lZCBEVCBkZXZpY2VzIHRvIHN1cHBvcnQgYWNj
ZXNzLWNvbnRyb2xsZXINCmZ1bmN0aW9uYWxpdHkgdGhyb3VnaCBTQ0kgZnJhbWV3b3JrLCBzbyBh
IERUIGRldmljZSBhc3NpZ24gcmVxdWVzdCBjYW4gYmUNCnBhc3NlZCB0byBmaXJtd2FyZSBmb3Ig
cHJvY2Vzc2luZyBhbmQgZW5hYmxpbmcgVk0gYWNjZXNzIHRvIHRoZSByZXF1ZXN0ZWQNCmRldmlj
ZSAoZm9yIGV4YW1wbGUsIGRldmljZSBwb3dlciBtYW5hZ2VtZW50IHRocm91Z2ggU0NNSSkuDQoN
ClRoZSBTQ0kgYWNjZXNzLWNvbnRyb2xsZXIgRFQgZGV2aWNlIHByb2Nlc3NpbmcgaXMgY2FsbGVk
IGJlZm9yZSB0aGUgSU9NTVUNCnBhdGguIEl0IHJ1bnMgZm9yIGFueSBEVC1kZXNjcmliZWQgZGV2
aWNlIChwcm90ZWN0ZWQgb3Igbm90LCBhbmQgZXZlbiB3aGVuDQp0aGUgSU9NTVUgaXMgZGlzYWJs
ZWQpLiBUaGUgSU9NTVUgcGF0aCByZW1haW5zIHVuY2hhbmdlZCBmb3IgUENJIGRldmljZXM7DQpv
bmx5IHRoZSBEVCBwYXRoIGlzIHJlbGF4ZWQgdG8gcGVybWl0IG5vbi1JT01NVSBkZXZpY2VzLg0K
DQpUaGlzIGxldHMgeGwuY2ZnOiJkdGRldiIgbGlzdCBib3RoIElPTU1VLXByb3RlY3RlZCBhbmQg
bm9uLXByb3RlY3RlZCBEVA0KZGV2aWNlczoNCg0KZHRkZXYgPSBbDQogICAgIi9zb2MvdmlkZW9A
ZTZlZjAwMDAiLCA8LSBJT01NVSBwcm90ZWN0ZWQgZGV2aWNlDQogICAgIi9zb2MvaTJjQGU2NTA4
MDAwIiwgPC0gbm90IElPTU1VIHByb3RlY3RlZCBkZXZpY2UNCl0NCg0KVGhlIGNoYW5nZSBpcyBk
b25lIGluIHR3byBwYXJ0czoNCjEpIGNhbGwgc2NpX2RvX2RvbWN0bCgpIGluIGRvX2RvbWN0bCgp
IGJlZm9yZSBJT01NVSBwcm9jZXNzaW5nLiBJZg0Kc2NpX2RvX2RvbWN0bCgpIHJlcG9ydHMgYW4g
ZXJyb3Igb3RoZXIgdGhhbiAtRU5YSU8sIHRyZWF0IGl0IGFzDQphdXRob3JpdGF0aXZlIGFuZCBz
a2lwIHRoZSBJT01NVSBwYXRoLiBBIHJldHVybiBvZiAtRU5YSU8gaW5kaWNhdGVzDQp0aGF0IFND
SSBkaWQgbm90IGhhbmRsZSB0aGUgcmVxdWVzdCBhbmQgaXMgaWdub3JlZCwgYWxsb3dpbmcgdGhl
DQpleGlzdGluZyBJT01NVSBoYW5kbGluZyB0byBydW4gdW5jaGFuZ2VkOw0KMikgdXBkYXRlIGlv
bW11X2RvX2R0X2RvbWN0bCgpIHRvIGNoZWNrIGZvciBkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKCkg
YW5kDQpub3QgZmFpbCBpZiBEVCBkZXZpY2UgaXMgbm90IHByb3RlY3RlZCBieSBJT01NVS4gaW9t
bXVfZG9fcGNpX2RvbWN0bA0KZG9lc24ndCBuZWVkIHRvIGJlIHVwZGF0ZWQgYmVjYXVzZSBpb21t
dV9kb19kb21jdGwgZmlyc3QgdHJpZXMNCmlvbW11X2RvX3BjaV9kb21jdGwgKHdoZW4gQ09ORklH
X0hBU19QQ0kpIGFuZCBmYWxscyBiYWNrIHRvDQppb21tdV9kb19kdF9kb21jdGwgb25seSBpZiBQ
Q0kgcmV0dXJucyAtRU5PREVWLg0KDQpUaGUgbmV3IGR0X2RldmljZV9pc19wcm90ZWN0ZWQoKSBi
eXBhc3MgaW4gaW9tbXVfZG9fZHRfZG9tY3RsIG9ubHkNCmFwcGxpZXMgdG8gRFQtZGVzY3JpYmVk
IGRldmljZXM7IFNDSSBwYXJhbWV0ZXJzIGFyZSBjYXJyaWVkIHZpYSBEVA0Kbm9kZXMuIFBDSSBk
ZXZpY2VzIGhhbmRsZWQgYnkgaW9tbXVfZG9fcGNpX2RvbWN0bCBkbyBub3QgY2FycnkgRFQvU0NJ
DQptZXRhZGF0YSBpbiB0aGlzIHBhdGgsIHNvIHRoZXJlIGlzIG5vIG5vdGlvbiBvZiDigJxTQ0kg
cGFyYW1ldGVycyBvbiBhDQpub24tSU9NTVUtcHJvdGVjdGVkIFBDSSBkZXZpY2XigJ0gZm9yIGl0
IHRvIGludGVycHJldCBvciB0byBza2lwLiBUaGUgUENJDQpwYXRoIHNob3VsZCBjb250aW51ZSB0
byByZXBvcnQgZXJyb3JzIGlmIGFzc2lnbm1lbnQgY2Fubm90IGJlIHBlcmZvcm1lZA0KYnkgdGhl
IElPTU1VIGxheWVyLiBTbyB3ZSBzaG91bGQgbGVhdmUgaW9tbXVfZG9fcGNpX2RvbWN0bCB1bmNo
YW5nZWQ7IHRoZQ0KU0NJL0RULXNwZWNpZmljIHJlbGF4YXRpb25zIGJlbG9uZyBvbmx5IGluIHRo
ZSBEVCBwYXRoLiBBbHNvIFNDSSBoYW5kbGluZw0Kb25seSBleGlzdHMgd2hlbiBEVCBpcyBwcmVz
ZW50Lg0KDQpTaWduZWQtb2ZmLWJ5OiBHcnlnb3JpaSBTdHJhc2hrbyA8Z3J5Z29yaWlfc3RyYXNo
a29AZXBhbS5jb20+DQpTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIE1vaXNpZWlldiA8b2xla3NpaV9t
b2lzaWVpZXZAZXBhbS5jb20+DQotLS0NCg0KKG5vIGNoYW5nZXMgc2luY2UgdjEwKQ0KDQpDaGFu
Z2VzIGluIHYxMDoNCi0gcmVtb3ZlIHVudXNlZCBzY2lfZG9fZG9tY3RsIHN0dWIgZnJvbSBzY2ku
aA0KDQpDaGFuZ2VzIGluIHY5Og0KLSB0cmVhdCBTQ0kgYXMgYSBnYXRlIGZvciBYRU5fRE9NQ1RM
Xyphc3NpZ25fZGV2aWNlOiBhYm9ydCBiZWZvcmUNCklPTU1VIGlmIHNjaV9kb19kb21jdGwoKSBy
ZXR1cm5zIGFuIGVycm9yIG90aGVyIHRoYW4gLUVOWElPLCBpbnN0ZWFkDQpvZiB0cnlpbmcgdG8g
cHJvcGFnYXRlIFNDSSBlcnJvcnMgYWZ0ZXIgYSBzdWNjZXNzZnVsIElPTU1VDQpvcGVyYXRpb24u
IFRoaXMgYXZvaWRzIHBhcnRpYWwgc3VjY2VzcyBhbmQgdGhlIG5lZWQgZm9yIElPTU1VIHJvbGxi
YWNrLg0KLSByZW1vdmUgZWFybHkgcmV0dXJuIGZyb20gZG9fZG9tY3RsKCkgaW4gdGhlIGFzc2ln
bl9kZXZpY2UNCnBhdGggdG8ga2VlcCBSQ1UgaGFuZGxpbmcgaW50YWN0Lg0KLSBjaGFuZ2UgSVNf
RU5BQkxFRCgqKSB0byAjaWZkZWYgaW4gc2NpX2RvX2RvbWN0bCBxdWFyZA0KDQpDaGFuZ2VzIGlu
IHY4Og0KLSBjaGVjayBmb3IgQ09ORklHX0FSTV9TQ0kgdG8gYmUgZWJhYmxlZCBpbnN0ZWFkIG9m
IENPTUZJR19BUk0gYmVmb3JlDQpjYWxsaW5nIHNjaV9kb19kb21jdGwNCi0gcmV3b3JrIHNjaV9k
b19kb21jdGwgY2FsbCB0byBhdm9pZCBleHRyYSBjaGVja3MsIGltcHJvdmVkIGVycm9yDQpoYW5k
bGluZy4NCi0gZG8gbm90IHByb3BhZ2F0ZSByZXQxIGlmIHNjaV9kb19kb21jdGwgcmV0dXJuZWQg
cG9zaXRpdmUgcmV0DQotIHVwZGF0ZWQgY29tbWVudCBpbiBkb21jdGwuYyBjb2RlDQoNCkNoYW5n
ZXMgaW4gdjc6DQotIHVwZGF0ZSBkb21jdGwgdG8gYnVpbGQgb24gYm90aCBBcm0gYW5kIHg4NiBw
bGF0Zm9ybXMNCi0gbW92ZSByZXQxIGRlY2xhcmF0aW9uIHRvIHRoZSB0b3Agb2YgdGhlIGZ1bmN0
aW9uIGFzIHJlcXVpcmVkIGJ5IGNvZGUNCnN0eWxlDQoNCkNoYW5nZXMgaW4gdjY6DQotIGNoYW5n
ZSBpb21tdV9kb19kb21jdGwgYW5kIHNjaV9kb19kb21jdGwgY29tbWFuZCBvcmRlciBhbmQNCmNh
bGwgc2NpX2RvX2RvbWN0bCBmaXJzdCB3aGljaCB3aWxsIHByb2R1Y2UgY2xlYW5lciBjb2RlIHBh
dGguDQpBbHNvIGRyb3BwZWQgY2hhbmdpbmcgcmV0dXJuIGNvZGUgd2hlbiBpb21tdSB3YXMgZGlz
YWJsZWQgaW4NCmlvbW11X2RvX2RvbWN0bC4NCg0KQ2hhbmdlcyBpbiB2NToNCi0gcmV0dXJuIC1F
SU5WQUwgaWYgbWVkaWF0b3Igd2l0aG91dCBhc3NpZ25fZHRfZGV2aWNlIHdhcyBwcm92aWRlZA0K
LSBpbnZlcnQgcmV0dXJuIGNvZGUgY2hlY2sgZm9yIGlvbW11X2RvX2RvbWN0bCBpbg0KWEVOX0RP
TUNUTF9hc3NpZ25fZGV2aWNlIGRvbWN0bCBwcm9jZXNzaW5nIHRvIG1ha2UgY2xlYW5lciBjb2Rl
DQotIGNoYW5nZSAtRU5PVFNVUFAgZXJyb3IgY29kZSB0byAtRU5YSU8gaW4gc2NpX2RvX2RvbWN0
bA0KLSBoYW5kbGUgLUVOWElPIHJldHVybiBjb21kZSBvZiBpb21tdV9kb19kb21jdGwNCi0gbGVh
dmUgIWR0X2RldmljZV9pc19wcm90ZWN0ZWQgY2hlY2sgaW4gaW9tbXVfZG9fZHRfZG9tY3RsIHRv
IG1ha2UNCmNvZGUgd29yayB0aGUgc2FtZSB3YXkgaXQncyBkb25lIGluICJoYW5kbGVfZGV2aWNl
IiBjYWxsIHdoaWxlDQpjcmVhdGluZyBod2RvbShkb20wKSBhbmQgImhhbmRsZV9wYXNzdGhyb3Vn
aF9wcm9wIiBjYWxsIGZvciBkb20wbGVzcw0KY3JlYXRpb24NCi0gZHJvcCByZXR1cm4gY2hlY2sg
ZnJvbSBzY2lfYXNzaWduX2R0X2RldmljZSBjYWxsIGFzIG5vdCBuZWVkZWQNCi0gZG8gbm90IHJl
dHVybiBFSU5WQUwgd2hlbiBhZGRpZ25fZHRfZGV2aWNlIGlzIG5vdCBzZXQuIFRoYXQgaXMNCmJl
Y2F1c2UgdGhpcyBjYWxsYmFjayBpcyBvcHRpb25hbCBhbmQgbm90IGltcGxlbWVudGVkIGluIHNp
bmdsZS1hZ2VudCBkcml2ZXINCg0KIHhlbi9hcmNoL2FybS9maXJtd2FyZS9zY2kuYyAgICAgICAg
ICAgICB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysNCiB4ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vZmlybXdhcmUvc2NpLmggfCAgOCArKysrKysNCiB4ZW4vY29tbW9uL2RvbWN0bC5jICAg
ICAgICAgICAgICAgICAgICAgfCAxNSArKysrKysrKysrKw0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2RldmljZV90cmVlLmMgICB8ICA2ICsrKysrDQogNCBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNl
cnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZmlybXdhcmUvc2NpLmMgYi94
ZW4vYXJjaC9hcm0vZmlybXdhcmUvc2NpLmMNCmluZGV4IGFhOTNjZGE3ZjAuLmE2YzY0N2EwOWQg
MTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vZmlybXdhcmUvc2NpLmMNCisrKyBiL3hlbi9hcmNo
L2FybS9maXJtd2FyZS9zY2kuYw0KQEAgLTEyNiw2ICsxMjYsNDIgQEAgaW50IHNjaV9hc3NpZ25f
ZHRfZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2KQ0K
ICAgICByZXR1cm4gMDsNCiB9DQogDQoraW50IHNjaV9kb19kb21jdGwoc3RydWN0IHhlbl9kb21j
dGwgKmRvbWN0bCwgc3RydWN0IGRvbWFpbiAqZCwNCisgICAgICAgICAgICAgICAgICBYRU5fR1VF
U1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpDQorew0KKyAgICBzdHJ1Y3Qg
ZHRfZGV2aWNlX25vZGUgKmRldjsNCisgICAgaW50IHJldCA9IDA7DQorDQorICAgIHN3aXRjaCAo
IGRvbWN0bC0+Y21kICkNCisgICAgew0KKyAgICBjYXNlIFhFTl9ET01DVExfYXNzaWduX2Rldmlj
ZToNCisgICAgICAgIHJldCA9IC1FTlhJTzsNCisgICAgICAgIGlmICggZG9tY3RsLT51LmFzc2ln
bl9kZXZpY2UuZGV2ICE9IFhFTl9ET01DVExfREVWX0RUICkNCisgICAgICAgICAgICBicmVhazsN
CisNCisgICAgICAgIGlmICggIWN1cl9tZWRpYXRvciApDQorICAgICAgICAgICAgYnJlYWs7DQor
DQorICAgICAgICBpZiAoICFjdXJfbWVkaWF0b3ItPmFzc2lnbl9kdF9kZXZpY2UgKQ0KKyAgICAg
ICAgICAgIGJyZWFrOw0KKw0KKyAgICAgICAgcmV0ID0gZHRfZmluZF9ub2RlX2J5X2dwYXRoKGRv
bWN0bC0+dS5hc3NpZ25fZGV2aWNlLnUuZHQucGF0aCwNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBkb21jdGwtPnUuYXNzaWduX2RldmljZS51LmR0LnNpemUsICZkZXYpOw0K
KyAgICAgICAgaWYgKCByZXQgKQ0KKyAgICAgICAgICAgIHJldHVybiByZXQ7DQorDQorICAgICAg
ICByZXQgPSBzY2lfYXNzaWduX2R0X2RldmljZShkLCBkZXYpOw0KKw0KKyAgICAgICAgYnJlYWs7
DQorDQorICAgIGRlZmF1bHQ6DQorICAgICAgICAvKiBkbyBub3QgZmFpbCBoZXJlIGFzIGNhbGwg
aXMgY2hhaW5lZCB3aXRoIGlvbW11IGhhbmRsaW5nICovDQorICAgICAgICBicmVhazsNCisgICAg
fQ0KKw0KKyAgICByZXR1cm4gcmV0Ow0KK30NCisNCiBzdGF0aWMgaW50IF9faW5pdCBzY2lfaW5p
dCh2b2lkKQ0KIHsNCiAgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpucDsNCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZmlybXdhcmUvc2NpLmggYi94ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vZmlybXdhcmUvc2NpLmgNCmluZGV4IDM1MDAyMTZiYzIuLjVlZTVhMTY2NzQg
MTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZmlybXdhcmUvc2NpLmgNCisr
KyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9maXJtd2FyZS9zY2kuaA0KQEAgLTE0Niw2ICsx
NDYsMTQgQEAgaW50IHNjaV9kdF9maW5hbGl6ZShzdHJ1Y3QgZG9tYWluICpkLCB2b2lkICpmZHQp
Ow0KICAqIGNvbnRyb2wiIGZ1bmN0aW9uYWxpdHkuDQogICovDQogaW50IHNjaV9hc3NpZ25fZHRf
ZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2KTsNCisN
CisvKg0KKyAqIFNDSSBkb21jdGwgaGFuZGxlcg0KKyAqDQorICogT25seSBYRU5fRE9NQ1RMX2Fz
c2lnbl9kZXZpY2UgaXMgaGFuZGxlZCBmb3Igbm93Lg0KKyAqLw0KK2ludCBzY2lfZG9fZG9tY3Rs
KHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIHN0cnVjdCBkb21haW4gKmQsDQorICAgICAgICAg
ICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKTsN
CiAjZWxzZQ0KIA0KIHN0YXRpYyBpbmxpbmUgYm9vbCBzY2lfZG9tYWluX2lzX2VuYWJsZWQoc3Ry
dWN0IGRvbWFpbiAqZCkNCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWN0bC5jIGIveGVuL2Nv
bW1vbi9kb21jdGwuYw0KaW5kZXggMjlhNzcyNmQzMi4uYjNkMTM4MTE4MiAxMDA2NDQNCi0tLSBh
L3hlbi9jb21tb24vZG9tY3RsLmMNCisrKyBiL3hlbi9jb21tb24vZG9tY3RsLmMNCkBAIC0yOSw2
ICsyOSw5IEBADQogI2luY2x1ZGUgPHhlbi94dm1hbGxvYy5oPg0KIA0KICNpbmNsdWRlIDxhc20v
Y3VycmVudC5oPg0KKyNpZmRlZiBDT05GSUdfQVJNDQorI2luY2x1ZGUgPGFzbS9maXJtd2FyZS9z
Y2kuaD4NCisjZW5kaWYNCiAjaW5jbHVkZSA8YXNtL2lycS5oPg0KICNpbmNsdWRlIDxhc20vcGFn
ZS5oPg0KICNpbmNsdWRlIDxhc20vcDJtLmg+DQpAQCAtODMzLDYgKzgzNiwxOCBAQCBsb25nIGRv
X2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpDQog
ICAgIGNhc2UgWEVOX0RPTUNUTF90ZXN0X2Fzc2lnbl9kZXZpY2U6DQogICAgIGNhc2UgWEVOX0RP
TUNUTF9kZWFzc2lnbl9kZXZpY2U6DQogICAgIGNhc2UgWEVOX0RPTUNUTF9nZXRfZGV2aWNlX2dy
b3VwOg0KKyAgICAgICAgLyoNCisgICAgICAgICAqIENoYWluIFNDSSBEVCBoYW5kbGluZyBhaGVh
ZCBvZiB0aGUgSU9NTVUgcGF0aCBzbyBhbiBTQ0kgbWVkaWF0b3INCisgICAgICAgICAqIGNhbiBh
dXRob3Jpc2UgYWNjZXNzLWNvbnRyb2xsZWQgRFQgZGV2aWNlcy4gVW5oYW5kbGVkIGNhc2VzIHJl
cG9ydA0KKyAgICAgICAgICogLUVOWElPLCB3aGljaCBpcyBpZ25vcmVkLiBBbnkgb3RoZXIgU0NJ
IGVycm9yIGFib3J0cyBiZWZvcmUgdGhlDQorICAgICAgICAgKiBJT01NVSBwYXRoIHJ1bnMuDQor
ICAgICAgICAgKi8NCisjaWZkZWYgQ09ORklHX0FSTV9TQ0kNCisgICAgICAgIHJldCA9IHNjaV9k
b19kb21jdGwob3AsIGQsIHVfZG9tY3RsKTsNCisgICAgICAgIGlmICggcmV0IDwgMCAmJiByZXQg
IT0gLUVOWElPICkNCisgICAgICAgICAgICBicmVhazsNCisjZW5kaWYNCisNCiAgICAgICAgIHJl
dCA9IGlvbW11X2RvX2RvbWN0bChvcCwgZCwgdV9kb21jdGwpOw0KICAgICAgICAgYnJlYWs7DQog
DQpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMNCmluZGV4IGY1ODUwYTI2MDcuLjI5
YTQ0ZGM3NzMgMTAwNjQ0DQotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJl
ZS5jDQorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jDQpAQCAtMzc5
LDYgKzM3OSwxMiBAQCBpbnQgaW9tbXVfZG9fZHRfZG9tY3RsKHN0cnVjdCB4ZW5fZG9tY3RsICpk
b21jdGwsIHN0cnVjdCBkb21haW4gKmQsDQogICAgICAgICAgICAgYnJlYWs7DQogICAgICAgICB9
DQogDQorICAgICAgICBpZiAoICFkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKGRldikgKQ0KKyAgICAg
ICAgew0KKyAgICAgICAgICAgIHJldCA9IDA7DQorICAgICAgICAgICAgYnJlYWs7DQorICAgICAg
ICB9DQorDQogICAgICAgICByZXQgPSBpb21tdV9hc3NpZ25fZHRfZGV2aWNlKGQsIGRldik7DQog
DQogICAgICAgICBpZiAoIHJldCApDQotLSANCjIuNDMuMA0K

