Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B7UHkeQDGp1jAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 18:31:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7485358267A
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 18:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313251.1583470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPNLG-0004nS-Q1; Tue, 19 May 2026 16:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313251.1583470; Tue, 19 May 2026 16:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPNLG-0004lF-ND; Tue, 19 May 2026 16:30:50 +0000
Received: by outflank-mailman (input) for mailman id 1313251;
 Tue, 19 May 2026 16:30:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPNLF-0004kt-KM
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 16:30:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPNLF-001Ck7-0G
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 18:30:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c902f-2eae-0a2a0a5409dd-0a2a450bc8f4-18
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 18:30:48 +0200
Received: from [40.93.194.66]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c9037-212f-0a2a450b0019-285dc242388d-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 18:30:48 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB7141.namprd03.prod.outlook.com (2603:10b6:510:296::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 16:30:43 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 16:30:43 +0000
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
 b=j3F+mgGjl2Vn9YvCLukksoIxxuQsUAYhR9C41mtyj3G33Q91u1beT21HqWmEvVnnWNVTQsgo+BHDIS55a7kLlgkCSAeJeTqPYWweRArNzgpD9Kf6YvGLW10Jf7NUFcq1bJ5+KWFvC3c65i8GyYmH2v4FviRE6gChSbRXz74t65m1ALsgkz7DXvUfyH2XT//e+IyEJk8jaTQfiqHbMXr7Y4sG1th0rHa8jPqgrwFCPaIyUqJIY3he4lT0UhIuaMypehxLETCqn0JnUyGKav8Q7Tt7xIFitkLc/qWcJsDs5JOAwHcCXY+jAFaJIFWKV5ds+6gGqRFSU4Xw3guzX1+kNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqsTliI4tJ/noBkulXoXbRnVYJOKLpwXhKFjf5fAGPw=;
 b=fhLa5Ws2D0lahkEe1E8RY6MfKhbOM6cYfCoDB5EEAlC9hj2fQ8xkfA2z1FLN9+HoWYTDL3xT0PnrB9ldhyEI9M8hgio4sPr1mqateYP8lLiac6L7IKe7Y67DHCqXAGQaVI+aHX28SaqLUEokDa+JIh6IwVlaFjqhFoW/euIfvamrxHgQy1l7ASoG9VnYWUf67pppFdoza4Azk81HWn6gvTSSlJWWX0eij37ozW7Mp0axo9XXrY8zQ07C1jngDahKHa0kJAO0Ov86VeNbTgKAva3msW15lga7lClcxE/sROL1LeYelR6UY04bV8yxdf2HUel2BJoH2HsOB93Rl5xRcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqsTliI4tJ/noBkulXoXbRnVYJOKLpwXhKFjf5fAGPw=;
 b=dwbAS1Dt/71fKowTg6lSWb+pr9VJ3pNpPhEGaeCaLKaNjNmE3rw0QXaM8yA9bErg3ZEJFFBtyrxjZYIKxop0w5cAjuMIgKas7touOGi/zrdKYakh0ZhhjqSbs1RRr2uh1oGx6cykv8D59XDGyhfz5CsNd19tw+39GEp3hVQ/dRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f33d1ad2-2dbf-4aa7-8785-43fee4e74753@citrix.com>
Date: Tue, 19 May 2026 17:30:39 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen/riscv: fix sstc init to write vstimecmp instead of
 stimecmp
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, xen-devel@lists.xenproject.org
References: <1779207317.8631fc262581453bbf619ec5b2062170.19e4105277b000f373@vates.tech>
 <49d0cbe5-1366-4539-9754-371e9507a54d@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <49d0cbe5-1366-4539-9754-371e9507a54d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0288.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: f4169b49-d130-4867-4c28-08deb5c3f916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|4143699003|11063799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dT7OsxEAlFxs4DCKgode3Yv4a5w30enDf2Z0xEhZnOo/nm5q/PujJ2mHBTmsl1T9hd/1krN9+SMwRvhGKB2LSvoWQS6TXAfRYrlFM0pnx4TW/UJp++meIXB/APVdEh1Tw8w5aF+q+o5S7RGmI1n8Rpv+Gw+3qmya/JvN6d/gsZW+DIHKnbBJGByoGQ4kv0JRV/sSoc7isDF6rVoS45uppoaAqKqBCNbhzZwUcsjWTBpnbhKRCLkfP1JsCcGzrwyK8sRBcNw3CyVCySoFNbApCtst8fnCCOdI6ysEGYRH4JCph8o/RrVGfeeoHnJwPQqyiELLz7K7r63ikknOctGYhFWotn2+inMM7dA3A6zIYH0GjZ4SB5HVp/FBpHKANMJXqMHFpWuggWrqlRRhLzdi3KNWo+EQAWbkHAt5iymJ3Lcz+cQ4PFEBb5DUDxDICWZqtQFxFfb5PW4WM4zJ908TivVlFxMsTfEv6cTnClGpNXZgdIsEzqEgOhSetf5asm0Wbnm9cmGyAZBfv7cjKzDXKh1IPcYueyr8P5QEGPmQftFGmYX7tFtXI4lsy3RTaaWOF8ucqShw4p8mMNDqM5St1TnF6y8zIi/JhzKHzHtACJ8YVpGX0YpWLkoYu2xP/Ykgf6vhsVxcBbaaU6BH7VHbjx07OH+stSkTa3Ae9RaP9PQKmx08lrwYz9C9n2lggQSx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjI4bHhKYlYxRzR5aW9wNC81THVFREhxejkwcCswdVYwUWZlZ243K3M5SGps?=
 =?utf-8?B?Zm1vSzI4V2ljYmNoVE5saTVNbG12ZW9rWkFQTWl2VExPakN3NHhuR2I5L25j?=
 =?utf-8?B?aFgzSkdXZjFrYis2bUtLTEozVDQ1bGxSMW9lMXR6T2hTMHJhMEVRaVkxS1pw?=
 =?utf-8?B?Q0FUb0F0SFhSU3BWb2lleTZKUTNOMkVQM3l2WU5nOGxWaitlbVhqY2NqaTJH?=
 =?utf-8?B?YUV0Z2oxc1h3ekNPNU9lNFZINHhZdHF6NjFveWFDamZEQjU4OUYxNWZ6dmhq?=
 =?utf-8?B?aVhaREZJb3dtc3U0YWdiTmhZLytVWDhyTDVzQ2dMSS8rWnNsbTZKYlZHQytM?=
 =?utf-8?B?T0ZPU2hONXRSMVR3UVJ3QmNCelZobnhna2FXazg0S09ZWUZjVGdsWnJuaXZH?=
 =?utf-8?B?SjhYMnp0UVJKUnVGcnFRYkpDZ1QvMzhuMms2NURTVHo1eFdCTzNVTDdlaVlw?=
 =?utf-8?B?MlE1NGVUVVM1V1puVWhySzI3YXpsQmhZUDdpbEtFb1drNjNlc2plejU4dHhQ?=
 =?utf-8?B?TDBuZGFISUZGWkVGK21uQ2FnU1pBck1VaGk5dnJGOVVzMGxtVitJZEd5bkFQ?=
 =?utf-8?B?bE5lM3BlOEllZWoxcWdHV1Ivem5SUmRWT1kwaTFtWjlWTDFmOTZvSHVoU1Y3?=
 =?utf-8?B?MmwvaGR6L2ZNQzRzMHRsNTdzMUZ2ZEJlYjRVT2hHVEY3dXV5QUd1VWxNL3ky?=
 =?utf-8?B?OWJEYjczVUN6SmhSQmZWTUNXUjVQeU5BR2x5U3RMWGQ2Q0piOFRENm5yR3NR?=
 =?utf-8?B?VGUwbGVQQUdZMGV6b0ZZaTlzUjROTnB0TXhvcmJKeWNrNFMvWmx4dUQyakM2?=
 =?utf-8?B?YUZxbTd1QlJJaE52cHZnbk5XeGsvMElzQVdiaFZqNjlqQUsxbUk1Z0ZSSVNm?=
 =?utf-8?B?UXdtZlVPYmRDRHBtM2o2UmxkZ3RDakwrNTBsRmNydzVoQzcwaFR1cElMTFJn?=
 =?utf-8?B?NGVqYis2WUZ2NnVlZEJvd29Pa2k1VXN2RkJuMmIyVXpTYlVLd1N3eWJCRG5h?=
 =?utf-8?B?ckdENTU5ei92Y3habFQ1bWlzVi9QSlkxK1loRS83UHMrN0kreGV4bWx2TTI3?=
 =?utf-8?B?OEF1b1dYYmU2MVJxUzdYUzhLVWhKRkNrVm9rYVpNdmhPRW5IdXltdmVaL3VY?=
 =?utf-8?B?Z1JWYkVpc1VEalVtNlFwN1JqM0xIVmdhZWFhcnVjZk96aWI4TGhaV2txWFFu?=
 =?utf-8?B?S3hrRkJrcDdaWXN5c0NIOExVZjBhUk5icVRrZ3FhV3R3VysvRDlpUHZWclhz?=
 =?utf-8?B?LzF3TGU3QmlxTUQzN0M2K1ZiVVhXTDFiSnZQbTRncy8xYXFYN2tYRzNkMlc1?=
 =?utf-8?B?T2l2M0plOGdHYXg1SXNiOUhtN0wzNjRJREZKVnd6TlJBSEpPS2xMMWJKMFdu?=
 =?utf-8?B?TzgwYXE1eVAzQjh0MnRiZEJaeG5YNDlFOUVvY1pnVkxhK0JlWW9iTS9IRmpw?=
 =?utf-8?B?bndvOTZ5c2QxNFlJbXdwK1ordjM2bzFoQmhXa3ZzWXNKZlE4NlhFMmw3WE9P?=
 =?utf-8?B?bHRybWlCbjVQT1hXcWxvTVVwR2UwclZmaHZJdjR6MDhRODVzMmppZ2pKakdS?=
 =?utf-8?B?WXB4dlRkc3ExbjFvcWgrZWlhcjJtNUhHTEFwSGhxc2Z6S0FpbTl4SUxuU2VZ?=
 =?utf-8?B?QjluTGhndS9IVjdGVHpmQ2c0T0NlM2JBZTdEQS9VL0hxNDFmeDVBbTNUZHZD?=
 =?utf-8?B?Y0JHT1BCZ1V4V0lPZkpjb1RJa1FVRTV0clhUdTVmbERQZ3E1cVo5R1EvbUhK?=
 =?utf-8?B?ZnJLK3ZmeXR4S1ROd3E2WWk2QnZORkk3a2tyMzFzdCsrSDJpSjVxalJsTGlv?=
 =?utf-8?B?YUptZTdGUXpJVUhXRThUK1FQL2pINWpSUWRoSEk3R3BIZVdnUHQ2MkJabEJ1?=
 =?utf-8?B?T2diajdNM3JNOGNUSGhOdGg4MDZSOEVOQVFaQjdFU2craDNyZlZzL3NORmFy?=
 =?utf-8?B?MTg2NzI1WUN6Z1hvLzlOQ0xCcVdjNm9ORWdYV1FGMURiMlNjOVZNa2hnRERh?=
 =?utf-8?B?ZEVqWlhaLy9YUUhQcWd1MzFIdG85VzJPdTJBL0N4QkNxNnlhaUd3MGFNamNE?=
 =?utf-8?B?N285VDZ1KzJzY0daYmZrVHFmUS9uSzNkM2xIMjd5Zmp3cDNVZHlBck41OUg2?=
 =?utf-8?B?K0NFYWg0bVRZWUhnYWdKVWZhaUpNOGdPL0JrZWh5V0ttemJ2TXhGMTZvYlYw?=
 =?utf-8?B?YlFxMlorU0NGRGJESzlPSy95ZjNsV2phWk9lMjM5dUljeWxSM00xZDN0NnVo?=
 =?utf-8?B?SlduV2RFU282ZkdzZmNGLzUxeWl4bXZNaGZkUDhDa0xITzd6czdrRXQ2SHZh?=
 =?utf-8?B?clBZTjYxZVVrTkIybW5sdDRLL3pvZnphWVpZL1I3T1J2WDFSSVo2dUlvNjRE?=
 =?utf-8?Q?NuL+qwcXtljdKJ0E=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4169b49-d130-4867-4c28-08deb5c3f916
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:30:43.6216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+KauG2CKXY8dlF5MUcvoX0+AaYExPzVhMTEdHyqZGB5S1O03DIoOcZi0PM+4InzJp3lCvsmloxR7tBEdmggGYwP5PF28cfV/XVjL8kr5Kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7141
X-purgate-ID: tlsNG-42698a/1779208248-18F66F3B-387F35F0/10/73395122804
X-purgate-type: spam
X-purgate-size: 1126
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:baptiste.le-duc@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,vates.tech,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:mid,citrix.com:dkim];
	DKIM_TRACE(0.00)[citrix.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,wdc.com,gmail.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7485358267A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 5:28 pm, Oleksii Kurochko wrote:
>
>
> On 5/19/26 6:14 PM, Baptiste Le Duc wrote:
>> According to the comment above initializing of CSR_VSTIMECMP should
>> be used instead of CSR_STIMECM.
>
> Probably, it is something wrong with my e-mail app but this line looks
> long enough.
>
> I think we have to follow 80 chars per line.
>
> Nit: s/CSR_STIMECM/CSR_STIMECMP
>
>>
>> Fixes: 25e032730690 ("xen/riscv: allow Xen to use SSTC while hiding
>> it from guests")
>
> Nit: there is no need for empty line between Fixes: and Signed-off-by.
>
>>
>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>
> Nit: it also would be nice to put here what was changed, for example,
> ---
> Changes in v2:
>  - Update the commit message.
> ---
>
> Please don't rush to send a new version of the patch. Probably
> committers will agree to make suggested fixes during commit.
>
> With fixes mentioned above:
>  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

In this case, it's probably easiest for me to fix up on commit to
produce a good example to follow.

~Andrew

