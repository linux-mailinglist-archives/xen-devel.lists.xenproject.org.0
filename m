Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHSYGx6AHmq/kAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 09:02:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDCF6294CA
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 09:02:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324479.1590020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUJ8G-0003Cq-AV; Tue, 02 Jun 2026 07:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324479.1590020; Tue, 02 Jun 2026 07:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUJ8G-0003B4-7r; Tue, 02 Jun 2026 07:01:48 +0000
Received: by outflank-mailman (input) for mailman id 1324479;
 Tue, 02 Jun 2026 07:01:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUJ8E-0003Ay-B3
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 07:01:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUJ8D-0026nS-9F
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 09:01:45 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1e7fd4-bab6-0a2a0a5309dd-0a2a4505875c-28
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 09:01:45 +0200
Received: from [52.101.43.16]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1e7fd7-aaa8-0a2a45050019-34652b10e033-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 09:01:44 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB4972.namprd03.prod.outlook.com (2603:10b6:5:1e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 2 Jun 2026
 07:01:41 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 07:01:41 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWZ+5UNW5/5hjd9+4ibsgWgKtHlhNjTclxHqEWh6bU6oTLR7dMOI4obbt/mVg5IE3M6IjbqeG5bQDupDWJLAiDpL3xw+GU83pzNv/jwD+6N0C8us46P/RdGE0rkh4L7n9Ps2WjwNyzgDzc4EDGF95AFDAOcFXy6QlQoWiBdemwdTTUIZtp1blulGc5GBysXtkQ7Bgyei+ENt08KS7t56t3iSKy8lZrbBUrn2hgRWkDEyxw10ybFgG0n9vqOMxIsGI454/yZBBh+FeAhuR9dSv7BurescH07b/ta6U+foZ/hPFrh6YbDHI+EMnxdKg87UPRA1FG7NzwdNHSwoc/6dgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjkYJEE9msaJEOSaFNU/NRAlfzuZPs+GBMk6LOQPqyQ=;
 b=wCKSy7ViArAH0mrLxFP0NCRsxnJX9TU8dtXHHXjf0CshZ0YvTqlGIjT69wt2snTdcsocBqm64VNzG8q0Qbflrqd5ljdkp9ogKyDJnG1+1g5FJoSsN2UjmVJucE3Sl4Qfwryy+Izf/i47W6VWzzczmrpLm0XS3QOTZYYu20zsVy9bR5IJ5Hok7+wPL9odR00/F4lLH5NNkzD8JEGbln5MrHr9j8wl9BG/qLZHgUAf0I9OBN617sgXNVvO3vNR8mzhO4uLdPyoGdMT4JBOlGE9mfa8rYdQkkF6ZFk39E9A7jM4ebVXdSjLpAwV5gSUxR8sbYTHp6zVeJ2iNZbkxdTEwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjkYJEE9msaJEOSaFNU/NRAlfzuZPs+GBMk6LOQPqyQ=;
 b=oJmCb3AVmrgpvRAH/9zqh5PAJA4KUDtKgjKK8Hp/NUs8QwP/NhxqI//NhmhVc+upQHy0OLqt5ybCgXaxZjoYq1sU3UMgdt1cl5wwAXPbCKjCYezqu0uxkA9+/RwVtzjvbU+dQ7a+I/sICd9tu4Y/uXot+L5mK8VeMv/nyY+dX/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 Jun 2026 09:01:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] xen/x86: Change stub page freeing to fix smt=0
Message-ID: <ah5_0vvipY2Wch-x@macbook.local>
References: <20260526203114.40882-1-jason.andryuk@amd.com>
 <ah26nl95MgqhPPAi@macbook.local>
 <5cdfca65-50f8-487a-a146-86e1a68f459c@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cdfca65-50f8-487a-a146-86e1a68f459c@amd.com>
X-ClientProxiedBy: MA3P292CA0072.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: 86da432e-88f9-4940-9c71-08dec074cc6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099006|4143699003|11063799006|22082099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	jYp6A9F9tPvys4KOC9ZXrbxD2l52oHyZwuE2ReMD3p5is/mhDv7f5Msheub4XrNILOFBwCIy0fykxfe6tc/Nq1MWjrq9iMULHb9pDU0UY95b0iZElBtdY6RdEj7p4ObT+dUKrutc6lHunFfAq8cbkTmfOGC1YJpbRrUawLje2J84xkgfDgkkMwykV+TrtlyS4Tl6Js8IzaHKrv1PMix2fNaVyvg/jcp9Og9MQvsTtv8ja/n316mytS+EG0ipvF8uT6TL4HkSsktU9sY09r2GQ3Q7dkMKkZ066kcbjF4eOXxOR+ULEmB9P/csnOrZ2A2wx9mqe6pT5W5n648bEIRQH2bJWogk7txxvg2pQ5Rb0hR3/Os5qXqy77yp8oTTdqp4kVpFDWLdK7NxEp0grWGxY4lamQFtUSrzCWExH1oYKfpKClYSoXRIzt7JUCAZNWwttN3SZguC4qGNPzlsPhvcVX97c9orbENqED/u87RDsnnIvOyekRUr0ntQ+NQ7vTLMzsV6s2zwrgi4bqad6A/wIT6VXz1mfhP/tPRqdsYs/NappbNVzVpkIO4Z1VDfOHNI7arqrZ8Km9Z5yo9AB6IM8YpGQzPFhxBw8wpo64Ipt6CnEnKjZynV2eZQJonnvmg5Oh2O4JDXaSFf0d9gzJJsJr6ISAa1hkDzikVKQetaGpGf3dFFkPv5hYy5Xf/In8SC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099006)(4143699003)(11063799006)(22082099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0F1WmxGRStjS3FKYTN6emJ1bVRXQlY3OXUrbUlheHhpcEVUektSNm8xakl3?=
 =?utf-8?B?Ykp4UmRZa1pLZ3MwQmNodCsyN1JicFpxYS9lcEVadENXYjZLVERScnhiUmo4?=
 =?utf-8?B?R2g4OE16bDFQK3F0a29ZS2paTnpQbDdLb1ZIcVFWS01aQy9ycHpYL3lGcDB0?=
 =?utf-8?B?eU5rTm0rQ2FGOTlaMUVKYzdnV0I0d1o1bngyVmJ4c0xJVTRLTzc4YUR0RHk3?=
 =?utf-8?B?UEVBcC94ZlIwWWIzbHdXVUFvZUUvZnB5bEFYeGVDVTNZdllmWkxsM2Q1TjVC?=
 =?utf-8?B?YzBRaDQ5ZnlwMVpCRGxJSm5sWk5DeGRmWEI2QzZ6Q3llV3BncGIyN1F4cThG?=
 =?utf-8?B?Y0t5ekkrWnN6Q3Q3cGxPRmN1NU4xU2tMcVAvcG51YkFYcmVjaXA2NEtGeC9L?=
 =?utf-8?B?clBkVFZ4QWM5OVl0NXhRcGRiTjVzV3Y5UUdiR1d6WTB1SU1lcHVTbkhqTUZL?=
 =?utf-8?B?SnYybSt5TzBld0ppQ0UrMStJeUt6MVk0VXhxdm9tWnRLTFR0S2pzdlRkTXB3?=
 =?utf-8?B?eFpxZHJ0TjFjM3Q2Q3U4c3o3ajJiVjFaRWwwcFlEYjM4NklBWElwK2s0S0Z5?=
 =?utf-8?B?NGJXcERFUzNXRnMwanBMMDJRQUtzalNMdVd6cW5BY2NTUmhhQ2JoMzZFRHhW?=
 =?utf-8?B?bUZhUW1naDBUMUVRd0t2WElIbnhlVENLRjc2QWY2QXF0TlFVVHU0ckI2V0g4?=
 =?utf-8?B?K0FKN3FBeXp4WHhlYmpyYkVDcGxKV3FvZlllNmNzU2Y2eXZUSk1DWnpYT3RB?=
 =?utf-8?B?TGZDZ3NQTlBkNGlRZ1NRaUtoRHpyclFma2NJRU02N2xRa0VyR2t5dGtwRFMr?=
 =?utf-8?B?bGZOK05tNXJBYjAzeUNIUUFrS1lRRzBzZ3ZidzZ6NFNyMGt6alFvWW03bUI1?=
 =?utf-8?B?dlo2VEhXKzR6LzJIM2FsT0tEeGdmd3BPK0JEWlZvRWFPYXB5MVdxd1pkZWZh?=
 =?utf-8?B?U1JmS1ZEdXN1VzlhL3ZBd0E3VyszUGZMS0I4ZDFjdmt4b25wZ2RrNDY3c1B1?=
 =?utf-8?B?dVZoajhrVmxadEdBOEhtTXEwNXZBR2lzWWpCTStHaFJuSXhsV2RaWXV3dlNv?=
 =?utf-8?B?c0Z4Tkl2U1EyUkpnNUsxRUl2VUx0SnA4bi9OeWE1d1hYM2pWTmFWUVpXbnJK?=
 =?utf-8?B?WFczTWhMNWJ2a3YyYnpZT1VmcXBNMHRsYW1hL2g0Zm5tS2tkenIwc1ZDSXVi?=
 =?utf-8?B?RWx3Wk1CbHhBU3o0WHU1a0hyNTBZdmVKaVNxTVZIRWlMejhzU2czN0VUSm91?=
 =?utf-8?B?cWg1MEtuVUFuVFp5SXRkbnNlSEcva1hRNEFWbHRYdTQ5MlM3UTB4dFJNK05t?=
 =?utf-8?B?UDBWQlBTbFQ4U0VGSmdpZWIvMnNKRzdsWmdWK0dGREI5aktOVklReWNxWEtW?=
 =?utf-8?B?OTFWc2xWVXN0c2xLR0lZOEdZei9obEh3cEdZaVVnYXNScnJoMzZXRkpkVzRl?=
 =?utf-8?B?ZFFzWExJZW1YcnhoN1NyeHV3NEp4QkcyOVVnNkpmaWhqNmVia3p5V2J5aUh4?=
 =?utf-8?B?T1FDd3pBOVlJYzNsVDdBUndMdk9tY2lEQy9hMEliR0xpa0E0cmZoMkZmVWlW?=
 =?utf-8?B?WU9OaVlyRFNMRTVXQ0ovcEhRc1ppZmVTUlV6cVJaTTNJbEtTMm1tQTVtb1lM?=
 =?utf-8?B?WmZUemI1cGZsa2dxeUdsNjExdk1yc0RERzVVTHUzRzB4YnVaQzNvbm1aTVYv?=
 =?utf-8?B?RHNnNWpZb3orTGZPYzZLZGg3LzVSbDBDcHV2RDdJWm93ZWRpa3ZIcTVMRGpZ?=
 =?utf-8?B?UHpITFhtdjZoUmc4YlZ4RHo2S0drM29CWUhra2NOOHloeUliVU5LbkNzS2kw?=
 =?utf-8?B?N1l1RFN1ejdjYklOd3N1RWpjdmZYaWEyV0FQelk4eTBrTGhHUGZiSGs2VW9o?=
 =?utf-8?B?U1B6UEp5ekRHVVlzTDNnYU9hUXgxR1BMc25ISWkxZDZHOStKMzZZalR1eEla?=
 =?utf-8?B?dFVFdTV4R0ZzOXFEaWJOL1ZEcEZkVFNidVRObit3YmZyamlxWU5EMWJpYkRE?=
 =?utf-8?B?dmxyMzV0TndxNXUyR0FBeXJvdmFiTDkrT2ZjamJmLzRWY1FWVGdWV0tNQ1RF?=
 =?utf-8?B?ZW9WanNENTFTTmdMTW82cjZsYXFTak4ydENWandWamdWVGZxRzR5TUxSVWd1?=
 =?utf-8?B?SU5UTXlKTW8yaExWV2pBYXlEUUdLb0NQSU9VRzlQNEY3YnlSRHR2Wm4zZ3Vr?=
 =?utf-8?B?TS8yUFFxbHBnV0h3OElBTVQwTkxwRFBnTHhObFJYeDBBREpqbWxIT0IrSzRt?=
 =?utf-8?B?bVRhVXRTNExnNnRkUng4LzRYK2h2YXdXb25NZjlhNWpTU2V6ZnlTYjRodXZa?=
 =?utf-8?B?Y3JDeDBhQXdwMFBLd2U2dzNKUXhzVGk3eHZ5cVJiS1NFb1p1Y2x5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86da432e-88f9-4940-9c71-08dec074cc6a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 07:01:41.3809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDE1guwbnIfnbIKRSPd3JGM9JLyo5HYjvHJUFChPtmENzafZIx5zDkEMjlUrY32Vu7LbGckHJ4fyoF/oWbNz6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4972
X-purgate-ID: tlsNG-c201ff/1780383705-D937C443-D4D11DA6/0/0
X-purgate-type: clean
X-purgate-size: 5142
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CBDCF6294CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 05:07:52PM -0400, Jason Andryuk wrote:
> On 2026-06-01 13:00, Roger Pau Monné wrote:
> > On Tue, May 26, 2026 at 04:31:14PM -0400, Jason Andryuk wrote:
> > > A single stubs page is initialized with 0xcc and re-used, with multiple
> > > CPUs each using a portion of the shared page.  In cpu_smpboot_free(),
> > > each stubs area is checked against 0xcc.  When all are set to 0xcc, the
> > > page is freed.
> > > 
> > > Booting a system with smt=0, CPU0 is initially setup, allocating the
> > > stubs page and initializing to 0xcc.  When more CPUs are brought up,
> > > CPU1 is initialized and then immediately brough offline as it is the
> > > sibling of CPU0.  Since the page was initially memset with 0xcc,
> > > cpu_smpboot_free() finds all stubs as 0xcc and frees the page.
> > > However, the page is still assigned to CPU0 and continues to be assigned
> > > to other CPUs.
> > > 
> > > Meanwhile the page can be reallocated, which can lead to misbehavior.
> > > The particular instance was the stubs page re-used as a page table which
> > > later faulted when the entry was all 0xcc.
> > > 
> > > Change to initializing the page as 0xd6/STUB_BUF_FREE, and initializing
> > > individual stubs as 0xcc/STUB_BUF_USED.  0xd6 now indicates unused, and
> > > 0xcc indicates used/assigned.  When freeing a CPU, the stub is set to
> > > 0xd6, and the page is freed if all stubs are 0xd6.  Initializing with
> > > STUB_BUF_FREE lets cpu_smpboot_free() a page that was only ever
> > > partially used.
> > > 
> > > 0xd6/UDB is a 1 byte invalid opcode, which is similar to the existing
> > > use of 0xcc.  0xd6 is used to identify bug frames, but the stub addr
> > > (e.g. 0xffff82d07fffe000) fails the is_active_kernel_text() check.  It
> > > should be okay to use here.
> > > 
> > > Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
> > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > ---
> > > It would be nice to use get_page()/put_page() to let count_info handle
> > > reference counting, but they require an owning domain.
> > > 
> > > The listed Fixes introduced the use of 0xcc, but the smt commit may have
> > > made it more problematic.
> > > Fixes: d8f974f1a646 ("x86: command line option to avoid use of secondary hyper-threads")
> > 
> > Speaking with Andrew, we believe it might be easier to simply forego
> > the freeing of the page, possibly something like:
> > 
> > diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> > index ff05955bae40..62c6cbf4b561 100644
> > --- a/xen/arch/x86/smpboot.c
> > +++ b/xen/arch/x86/smpboot.c
> > @@ -990,19 +990,12 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
> >       {
> >           mfn_t mfn = _mfn(per_cpu(stubs.mfn, cpu));
> >           unsigned char *stub_page = map_domain_page(mfn);
> > -        unsigned int i;
> >           memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc, STUB_BUF_SIZE);
> > -        for ( i = 0; i < STUBS_PER_PAGE; ++i )
> > -            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
> > -                break;
> >           unmap_domain_page(stub_page);
> >           destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
> >                                (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1);
> >           per_cpu(stubs.addr, cpu) = 0;
> > -        per_cpu(stubs.mfn, cpu) = 0;
> > -        if ( i == STUBS_PER_PAGE )
> > -            free_domheap_page(mfn_to_page(mfn));
> >       }
> >       if ( IS_ENABLED(CONFIG_PV32) )

I think I've made an oversight in the code above: if all 32 CPUs
sharing the same stubs page are offlined, the reference to the stubs
page is possibly lost (if CPUs are not parked) and a new stubs page
would be allocated if any of those CPUs is brought back online, thus
leaking the previous allocation.  The simplest way to solve this would
be to introduce an array that indexes the stub pages, and replace the
logic in cpu_smpboot_alloc() that figures out whether stubs.mfn is set
for adjacent CPUs.

> > (there might be further cleanup possible if the page is not freed, the
> > above chunk is untested).
> > 
> > It's a single page shared between 32 CPUs, and offlining 32 adjacent
> > CPUs seems very unlikely.  IMO the extra complexity of having to deal
> > with the freeing overshadows the very small memory gain we get from
> > it.
> 
> Hi Roger,
> 
> Yes, I made and tested the same change locally last week.  Well, I retained:
>      per_cpu(stubs.mfn, cpu) = 0;
> 
> Maybe it would be good to save the mfn in case the CPU returns?  But I
> thought per-cpu vars are cleared, so it wouldn't be available anyway?

Depends on whether the CPUs are parked or not (see park_offline_cpus).
I think leaving stubs.mfn is fine, in the parked case we avoid part of
the setup logic by already having the mfn cached (no big deal either
way).

> Also, I was waiting to see if anyone chimed in with other ideas.

Maybe you could assign the page to dom_xen and then use
{get,put}_page(), but again it seems overly complicated.

Thanks, Roger.

