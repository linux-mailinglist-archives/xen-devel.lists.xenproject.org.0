Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HfoYDWOW92l0jQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 03 May 2026 20:39:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EC54B701D
	for <lists+xen-devel@lfdr.de>; Sun, 03 May 2026 20:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299396.1573938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJbhh-0002ut-CK; Sun, 03 May 2026 18:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299396.1573938; Sun, 03 May 2026 18:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJbhh-0002sV-6N; Sun, 03 May 2026 18:38:09 +0000
Received: by outflank-mailman (input) for mailman id 1299396;
 Sun, 03 May 2026 18:38:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wJbhf-0002sP-5j
 for xen-devel@lists.xenproject.org; Sun, 03 May 2026 18:38:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJbhb-00EyDe-Jc
 for xen-devel@lists.xenproject.org; Sun, 03 May 2026 20:38:05 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69f795f2-2eae-0a2a0a5409dd-0a2a450a942a-6
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 20:38:05 +0200
Received: from [52.101.84.87]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69f7960c-56b3-0a2a450a0019-3465545772e9-3
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 20:38:04 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DB9PR03MB7323.eurprd03.prod.outlook.com (2603:10a6:10:1fc::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 18:38:03 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.20.9870.023; Sun, 3 May 2026
 18:38:02 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLc4q5dFvGM0YTsnHMAiAU9QURkGxvifYr/Q6ET5Qdwz1zqrg2K6O07Ez+YKV0sctJ6qAqy54b/ztsPNiTAWNHGfY8UQj0DmYtrYjRD3aNUq7NyG2NLEAJdRSsqxHWH/9yqNbtR7/TDWsMiH6pyFIHjsmOZ6I2UTzILjgMpEiCVxu7e2BNniBcOidgtFAcY+fqLPSbuRZCzsUretC5OWCOta7sIo/f79Lp+Ch739veqYGQgeSe073ltCbqa19HgBar1HQTo5QrnRNsO1XLJJfSEJ0RCn1lXzXeocCdPDc/4ojQO9ZLZxdPoezV+sf1xDFTUq00ClxXYmsJ0Sa6pKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBi9RZgg+KAKbV99g5KWNq/L+nyJTJhanarj1Z/mYPI=;
 b=u0/A02PNyrIh8OhPWXC2tjSLM9MCVUr+bR8+i/KIG/uUx+qZaunUUigJPvvVb/uZuR4lhsynv429ggzE7tFoyRW7qz6mvOMsb0W3Y6d15smwjZJJTsCqJmB4JIxBwd57F7hRHOvSb6j+hWdsKwJKfty4ItkW9aBJ10LzcHI5fQA3pfAhYwGOYRQscXJGscReeToR4xLKZGJu9oLybmNvlHblggWppitSqlvr7iJHQzKmsSKrpsSYN6qVGahHmvez7EmXeW4X+fDUnX9cxqshdlpe3QtbxOwsWmPDLDP4QQUNqkxZWbdAxWrHmueGohyWLQqNBGZpSMbY7KVI7LRu9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBi9RZgg+KAKbV99g5KWNq/L+nyJTJhanarj1Z/mYPI=;
 b=dlimKn3rHKBKXnVfjyly5mJXyC5/diffx6OQp4AP5FS8n8OJH1EWYhGGTR4aR4Px615OOzvUAYAA9/3SwJSLhVHaVJi/ZmpjSiqJtG3kJjXqLUS9E6LaGchP0QmKdqJqzPGBt3+9DomjVrZteqVSi1Go0tPYFfHD24QrV/BIvZquJ+zWdt2E/zT0Aes2YwEnj4rt8njIXiyYGk37OJmiYtYf0armuncrexdohb5C53pvBH22Nd+NL2EIdyRVwlixG4dukjpm8ooAmZ9bfhlUN+5+8w2Q8K2KNZj7IlsoME9xlt69fQXStir5DlKnYC9IyPhyBpXaaafQa8+NZg9NYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <c8d683f1-eba2-4ec9-beca-84e6b5e80914@epam.com>
Date: Sun, 3 May 2026 20:38:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/23] xen/arm: vsmmuv3: Add dummy support for virtual
 SMMUv3 for guests
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <97aa20fdcec324bb58c6869ddcba5fcf29bf75b3.1774918270.git.milan_djokic@epam.com>
 <1dcec397-a265-4972-8f2c-fd10c6e0b6ad@xen.org>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <1dcec397-a265-4972-8f2c-fd10c6e0b6ad@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0289.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::18) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|DB9PR03MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: a84d04b1-ae78-4164-9eb9-08dea9431b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xc3fbEBqgGBxsL4QqNFLuAXJErTAINibWhb+Om6VJcTAm50gRAzlUKn1y8+6XwhSdmxXbhq1jotJBuiQjCC56iTb2TvVXFJNsK4JFRr7dF6oBDLPtg8R8/PXBKC9iRto3s1FrcX94smvuooT5ZepAYj2W9fxsBU3/Vr2fHYBT4iYGxCVPaWSZc5C2t9FjgHaj50GsMUqBA5y+trsLAhl+VojLLUdr0ojnX/YMrQJmxMUk/e+tfGGlB2XRZruMN3fJTlqV0/skPqe11bHNCd2Bn2MAn98ZySs4c/8fM9+78noNJTQKgfLw7Ma6XvLHQK6Hgpw48g0Ne2jZ2dOO0ap1TOMKHK6O+Gsgvr8vN1lUt2c3ECmc6zEBjaUUqDNQpsD2nhk9QA+Vd41xzbvs96LZ87fxnJ8jIa3pjtypCjqmFzo4Mbdg0YPJkJfZMygsalCN2y6yzN32Q6aT2zpLZTNskxDf440xGm+FYDNjlIlmwAt0culFPtVclSMMbm6qxAzPNOJGMaTCKQLMRhIGX1Ab8ZQyLNvpegjLA8w4lwfZL53m28RbIF3CcwmUb4w7hEg7qMgBIGxNLPUvyNyWQDiPxcpa+Y2S5hhl78AgdZFybjVmHfw2xuTJvBksGzgWqmSv/bXo8LHOADuZrXDEM9DxSE9gRZaNOo5ZTSQqjVyAyMcPzEi4gkUHMWUMbFgw+iA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2FKNy9iTXEwMDdnUWJmSy9xWG5rallNaVJVcEpMOFBvV3JxZW90a0thZkEx?=
 =?utf-8?B?TlduTlE1VHpZYU9nYlluRytZV3pOeEFXRTJ6NU12cTFXb00xUjlpV0wybUlk?=
 =?utf-8?B?dFJNUFJYaGdGOGVZRGtrU3ZIVS8vMlpBSW51VEEyeW85TDZVZkNBUTFvS0RT?=
 =?utf-8?B?S3lWOFFqdTRITzdhQ0RqblhTUXU4emxDSGd5VnZCUzE5S2tRWXFvdWV2c3Vy?=
 =?utf-8?B?Q3JRZFJZa1ZzNjlGSkdSZ0ZseTIxbUJHSnNZNlBIWDY3OVYrU2MwTHBRM09l?=
 =?utf-8?B?ZXJMS2dYbmc2WVZIcUttbHpGZlh3d1diUVBCSHdZN3QvZlVGNEFGOVd5MUlh?=
 =?utf-8?B?eVZCMWpoY2tGNDdxR25TU2paRTRZQ0tpRkY0OTE0UjlzUUpNOSthWkhOTlRr?=
 =?utf-8?B?T0V0ZFBnN0w2WThOak5mY0dwS2QvNUhLbDQ1ZjQ1ek1PWjBwWlk3OGpaRGJN?=
 =?utf-8?B?MzdLSDg3Y0VFbCt4bEVDdElXSWZDNEdHRUZ3ODBad1R0cUNFK1pTZlkxQVYv?=
 =?utf-8?B?Qnk0Q3ZrZTdIeFBTdlkvb0tDajJvQkFMK1NWbEUyVGZYbVdKOEtzTmF3SXRG?=
 =?utf-8?B?YXdMM21OcXd2ZFE0THIzMlRwTGlGMHBiLzBkRGk0cFQvL1B2ZU1hR08yRlhF?=
 =?utf-8?B?ajZzeVZza29HeVBwUWppNnoyK2IyV0ZjeXVnQ0pyTFI3SjZDUjZaWDU1ZVpH?=
 =?utf-8?B?Z3dweDhVUU12ZUZYcGFXN2N3bjhnZnh4WWlsSDVZYlVMaDJLb3FjRmFuOUJH?=
 =?utf-8?B?aW1QRkpOZ09CbWRKM09XREoxclM4aG9hUVVxdDl5SVZOMVRmcVJoeUI3cW42?=
 =?utf-8?B?Q3BhRHdoOWsyaTZmL0h0ZnlSQzQ3YzlWRjNOV1VtUzhxRjNERTFIaDlPeCsv?=
 =?utf-8?B?OUIwaTBqSVZOQTJ5VDFwc3JXSGE3SXJwN0lDVDhyL21lUGFwaU1TNHArVDE1?=
 =?utf-8?B?dXZmYWdRMHhOL25zbXUrNDBjNlR6RTBDOTg2ZFN0V1YzMEoyRlBoQWt5VXlI?=
 =?utf-8?B?MzJ3REZkU3lQWThENVlqaDhPanNmU1Qza2RwaVlGVEN4aDh2TVBJa3pRclJD?=
 =?utf-8?B?ekpKNlA2SWM1aXl6NlkySytyYVQ0ZFA1cTB0L3RTanNtYkQxbXEvSXFEUzdz?=
 =?utf-8?B?QStXRkZGR0IwZzZhdk9SeU1yaWNaL29mV0FKejJzRW80bGRRbzNsMmlsazlV?=
 =?utf-8?B?a3FBMnJUSjdBVUlVRHJvRS9VcktSY01SYVVGK2VSckpvTDBZK1ZNd3Z6OWdL?=
 =?utf-8?B?aUtsd2ViTEMxMno3MVl4WHdnNFRobTl6VitwaHo5WUkyUTR5L2QxdjllZjda?=
 =?utf-8?B?L09keW1TcnpvYlBiOUtrcTloUldrRXUzTjUzcXhaTmNzbk5WRHFIaVIyb1M1?=
 =?utf-8?B?enBjd3BjWnJ5QkNoRGFQbUpTWGdHVFE0T2FsL2Y1bytTWVIzL2FEM1dQeTdr?=
 =?utf-8?B?MEtMSHBHNFFiaFhKMG1FNlF2Y01jOGlOd2k2dmFXaE9jcFNnM2VUNkNGWklE?=
 =?utf-8?B?UVQ0MnhseUdSbU0veEI2VDcyNmdRQTIwNjB2SThVYXNvSW01L1hrdVNOeTd5?=
 =?utf-8?B?WnF5L3lwaE5Yb0V4cHBSM0dFVFhhazJiL1FFZVJQVDM5MXFSRWxXMFNmVG5B?=
 =?utf-8?B?Q3ZUb2NYMlQ5Vy9CbmJyZmErNzVLMmhlYjd6L1N2bFZYUERwOVhxdzBtN3Mz?=
 =?utf-8?B?eVJBU1drckIrQ3JEbUR2QnVTVHFHU0NtVjc0YlRjeFhrT0tHVU5mMkFnc0t5?=
 =?utf-8?B?WTBrUURqYlFRcUsybTh2NFVoNVhFZ3QrQjdyOVZSUlRRLzliTUZqQ1BwMW1P?=
 =?utf-8?B?RGc1bmRZM2QzaTdaK3hkdW81SzVXTWRJNytSdW9ZVDhyWHFwMFJ1TEhMQTc2?=
 =?utf-8?B?ZmJ6V0xXUCsxWGlrc1oxTW5UOTM2QTBlOURyVFZvVGtuYzRrdXlDVThzK0RN?=
 =?utf-8?B?S3k4Mm5mcXdzL3RseXlDZkhCR1p6bDg4a2J2VlZuVyt2eGxreW9HdHVhbHE2?=
 =?utf-8?B?TCtRS0tmZ1hjckJwZzgrcnF1MUwwOFVSZ0M1R3FjalRyV1hFdCtydEc5eE56?=
 =?utf-8?B?aW5MTU5MYWZnREdoWDN0c3BwaFo5cVFzc09nUWtQRWM5SkRvbzl3QVFTQ2pY?=
 =?utf-8?B?d2xWS1JzT3c5US9JNGh1VlJDS0s2RmVVZUw3QXlXQU5hYTJ1SEd4RkNock9I?=
 =?utf-8?B?VGdOUlo3SHBFYmJ5ZzlTSllFeEFwdTBlYjZDdTV0S1hhbkgyYU9USGZCTC9M?=
 =?utf-8?B?OWZBV0RCenZJMzRweUdZMFlJSitaTjVSSHJKWHhlL3VZSHhnV1VlSlBGL3Y2?=
 =?utf-8?B?THBydWwzeHQ0d1ZkVlVDaGYxTDg3bVZlVzdxZ1c1bXFvUVowZ3gzZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a84d04b1-ae78-4164-9eb9-08dea9431b96
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2026 18:38:02.7099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNW4LqfEVwJuwsDH4U4jtFkFsi0ULt2UHtO1+4DT3WOLQhudbMj9dfyJ2nKuSqV854kH2kRu52KohxAnZDX9Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7323
X-purgate-ID: tlsNG-4011c0/1777833485-CE7758B7-114FAA22/0/0
X-purgate-type: clean
X-purgate-size: 17478
X-Rspamd-Queue-Id: 48EC54B701D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Hi Julien,

On 4/14/26 09:09, Julien Grall wrote:
> Hi Milan,
> 
> On 31/03/2026 10:52, Milan Djokic wrote:
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> domain_viommu_init() will be called during domain creation and will add
>> the dummy trap handler for virtual IOMMUs for guests.
>>
>> A host IOMMU list will be created when host IOMMU devices are probed
>> and this list will be used to create the IOMMU device tree node for
>> dom0. For dom0, 1-1 mapping will be established between vIOMMU in dom0
>> and physical IOMMU.
>>
>> For domUs, the 1-N mapping will be established between domU and physical
>> IOMMUs. A new area has been reserved in the arm guest physical map at
>> which the emulated vIOMMU node is created in the device tree.
>>
>> Also set the vIOMMU type to vSMMUv3 to enable vIOMMU framework to call
>> vSMMUv3 domain creation/destroy functions.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/arch/arm/domain.c                  |   3 +-
>>    xen/arch/arm/include/asm/domain.h      |   4 +
>>    xen/arch/arm/include/asm/viommu.h      |  20 ++++
>>    xen/drivers/passthrough/Kconfig        |   8 ++
>>    xen/drivers/passthrough/arm/Makefile   |   1 +
>>    xen/drivers/passthrough/arm/smmu-v3.c  |   7 ++
>>    xen/drivers/passthrough/arm/viommu.c   |  30 ++++++
>>    xen/drivers/passthrough/arm/vsmmu-v3.c | 124 +++++++++++++++++++++++++
>>    xen/drivers/passthrough/arm/vsmmu-v3.h |  20 ++++
>>    xen/include/public/arch-arm.h          |   7 +-
>>    10 files changed, 222 insertions(+), 2 deletions(-)
>>    create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.c
>>    create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.h
>>
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 241f87386b..b982d79b3b 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -643,7 +643,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>            return -EINVAL;
>>        }
>>    
>> -    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE &&
>> +         config->arch.viommu_type != viommu_get_type() )
>>        {
>>            dprintk(XENLOG_INFO,
>>                    "vIOMMU type requested not supported by the platform or Xen\n");
>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>> index 758ad807e4..61108d0068 100644
>> --- a/xen/arch/arm/include/asm/domain.h
>> +++ b/xen/arch/arm/include/asm/domain.h
>> @@ -126,6 +126,10 @@ struct arch_domain
>>        void *sci_data;
>>    #endif
>>    
>> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
>> +    struct list_head viommu_list;     /* List of virtual IOMMUs */
>> +#endif
>> +
>>    }  __cacheline_aligned;
>>    
>>    struct arch_vcpu
>> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
>> index 4598f543b8..2a6742de73 100644
>> --- a/xen/arch/arm/include/asm/viommu.h
>> +++ b/xen/arch/arm/include/asm/viommu.h
>> @@ -5,9 +5,21 @@
>>    #ifdef CONFIG_ARM_VIRTUAL_IOMMU
>>    
>>    #include <xen/lib.h>
>> +#include <xen/list.h>
>>    #include <xen/types.h>
>>    #include <public/xen.h>
>>    
>> +extern struct list_head host_iommu_list;
>> +
>> +/* data structure for each hardware IOMMU */
>> +struct host_iommu {
>> +    struct list_head entry;
>> +    const struct dt_device_node *dt_node;
>> +    paddr_t addr;
>> +    paddr_t size;
>> +    uint32_t irq;
> 
> You don't seem to use ``irq`` in this patch. What is this meant to be
> used for?
> 

This field will be used for vIOMMU event queue creation for the hardware 
domain in a later patch (xen/arm: vsmmuv3: Add support for event queue 
and global error). The emulated IRQ and MMIO region for the hardware 
domain vIOMMU will match those of the host IOMMU.

>> +};
>> +
>>    struct viommu_ops {
>>        /*
>>         * Called during domain construction if toolstack requests to enable
>> @@ -35,6 +47,8 @@ struct viommu_desc {
>>    int domain_viommu_init(struct domain *d, uint16_t viommu_type);
>>    int viommu_relinquish_resources(struct domain *d);
>>    uint16_t viommu_get_type(void);
>> +void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>> +                            const struct dt_device_node *node);
>>    
>>    #else
>>    
>> @@ -56,6 +70,12 @@ static inline int viommu_relinquish_resources(struct domain *d)
>>        return 0;
>>    }
>>    
>> +static inline void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>> +                                          const struct dt_device_node *node)
>> +{
>> +    return;
>> +}
>> +
>>    #endif /* CONFIG_ARM_VIRTUAL_IOMMU */
>>    
>>    #endif /* __ARCH_ARM_VIOMMU_H__ */
>> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
>> index 3c174bc87b..9c48e7415e 100644
>> --- a/xen/drivers/passthrough/Kconfig
>> +++ b/xen/drivers/passthrough/Kconfig
>> @@ -40,6 +40,14 @@ config ARM_VIRTUAL_IOMMU
>>    	help
>>    	 Support virtual IOMMU infrastructure to implement vIOMMU.
>>    
>> +config VIRTUAL_ARM_SMMU_V3
>> +	bool "ARM Ltd. Virtual SMMUv3 Support (UNSUPPORTED)"
>> +	depends on ARM_SMMU_V3 && ARM_VIRTUAL_IOMMU
>> +	help
>> +	 Support for implementations of the virtual ARM System MMU architecture
>> +	 version 3. Virtual SMMUv3 is unsupported feature and should not be used
>> +	 in production.
>> +
>>    endif
>>    
>>    config AMD_IOMMU
>> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
>> index c3783188e3..c8f0a5f802 100644
>> --- a/xen/drivers/passthrough/arm/Makefile
>> +++ b/xen/drivers/passthrough/arm/Makefile
>> @@ -3,3 +3,4 @@ obj-$(CONFIG_ARM_SMMU) += smmu.o
>>    obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
>>    obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
>>    obj-$(CONFIG_ARM_VIRTUAL_IOMMU) += viommu.o
>> +obj-$(CONFIG_VIRTUAL_ARM_SMMU_V3) += vsmmu-v3.o
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>> index 19e55b6c9b..87612df21d 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -93,6 +93,7 @@
>>    #include <asm/platform.h>
>>    
>>    #include "smmu-v3.h"
>> +#include "vsmmu-v3.h"
>>    
>>    #define ARM_SMMU_VTCR_SH_IS		3
>>    #define ARM_SMMU_VTCR_RGN_WBWA		1
>> @@ -2727,6 +2728,9 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
>>    	list_add(&smmu->devices, &arm_smmu_devices);
>>    	spin_unlock(&arm_smmu_devices_lock);
>>    
>> +    /* Add to host IOMMU list to initialize vIOMMU for dom0 */
> 
> The indentation looks odd. Is this correctly aligned?
> 

Yes, it's wrong, will fix it.

>> +	add_to_host_iommu_list(ioaddr, iosize, dev_to_dt(pdev));
>> +
>>    	return 0;
>>    
>>    
>> @@ -3058,6 +3062,9 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>>    
>>    	platform_features &= smmu->features;
>>    
>> +	/* Set vIOMMU type to SMMUv3 */
>> +	vsmmuv3_set_type();
>> +
>>    	return 0;
>>    }
>>    
>> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
>> index 7ab6061e34..53ae46349a 100644
>> --- a/xen/drivers/passthrough/arm/viommu.c
>> +++ b/xen/drivers/passthrough/arm/viommu.c
>> @@ -2,12 +2,42 @@
>>    
>>    #include <xen/errno.h>
>>    #include <xen/init.h>
>> +#include <xen/irq.h>
>>    #include <xen/types.h>
>>    
>>    #include <asm/viommu.h>
>>    
>> +/* List of all host IOMMUs */
>> +LIST_HEAD(host_iommu_list);
> 
> I don't quite follow why this is part of the common code. That said, why
> do we need to register the host IOMMU? Wouldn't it be simpler to go
> through the list of pIOMMU in the vSMMU v3 implementation?
> 

``host_iommu_list`` is part of the generic code to allow reuse for other 
IOMMU types in the future. For example, it can be reused for Renesas 
IPMMU, rather than duplicating it.
As for why we need to register IOMMUs, it seems more suitable to create 
this list at initialization and add IOMMUs with the necessary properties 
when the pIOMMU is probed.
We can't reuse the same list from the SMMU driver because vIOMMU needs 
raw DT properties (address, size), which I don't think we can extract 
from the host driver list.


>> +
>>    const struct viommu_desc __read_mostly *cur_viommu;
>>    
>> +/* Common function for adding to host_iommu_list */
>> +void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>> +                            const struct dt_device_node *node)
> 
> Is this supposed to only be called during __init? If so, this will help
> to justify the ...
> 
>> +{
>> +    struct host_iommu *iommu_data;
>> +
>> +    iommu_data = xzalloc(struct host_iommu);
>> +    if ( !iommu_data )
>> +        panic("vIOMMU: Cannot allocate memory for host IOMMU data\n");
> 
> ... panic(). If not, then this function needs to return an error.
> 

Yes, this is called during init, on pIOMMU driver probe 
(arm_smmu_device_probe())

>> +
>> +    iommu_data->addr = addr;
>> +    iommu_data->size = size;
>> +    iommu_data->dt_node = node;
>> +    iommu_data->irq = platform_get_irq(node, 0);
>> +    if ( iommu_data->irq < 0 )
>> +    {
>> +        gdprintk(XENLOG_ERR,
>> +                 "vIOMMU: Cannot find a valid IOMMU irq\n");
> 
> Shouldn't you free the allocated memory? That said, why is it ok to
> ignore the vIOMMU in this case?
> 

Yes, this is missing. We ignore the host IOMMU with an invalid IRQ 
because event queue emulation won't work in this case.

>> +        return;
>> +    }
>> +
>> +    printk("vIOMMU: Found IOMMU @0x%"PRIx64"\n", addr);
>> +
>> +    list_add_tail(&iommu_data->entry, &host_iommu_list);
>> +}
>> +
>>    int domain_viommu_init(struct domain *d, uint16_t viommu_type)
>>    {
>>        if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> new file mode 100644
>> index 0000000000..6b4009e5ef
>> --- /dev/null
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> @@ -0,0 +1,124 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>> +
>> +#include <xen/param.h>
>> +#include <xen/sched.h>
>> +#include <asm/mmio.h>
>> +#include <asm/viommu.h>
>> +
>> +/* Struct to hold the vIOMMU ops and vIOMMU type */
>> +extern const struct viommu_desc __read_mostly *cur_viommu;
> 
> Why is this defined in the C file? Shouldn't this be defined in
> ``viomum.h``? That said, looking at the use, I think we want to
> introduce a helper to set the cur_viommu and not export ``cur_viommu``.
> 

I will introduce a helper, set function for ``cur_viommu``. After this 
is done, there's no need to move its definition to ``viommu.h``, since 
it should remain private to the vIOMMU code.

>> +
>> +struct virt_smmu {
>> +    struct      domain *d;
>> +    struct      list_head viommu_list;
>> +};
>> +
>> +static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>> +                              register_t r, void *priv)
>> +{
>> +    return IO_HANDLED;
>> +}
>> +
>> +static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
>> +                             register_t *r, void *priv)
>> +{
>> +    return IO_HANDLED;
>> +}
> 
> I undertand that both helpers are meant to be updated in a later patch.
> However, I think it makes quite difficult to know whether the code is
> complete by the end of the series. I would strongly recommend adding
> 'BUG_ON("unimplemented");' so we can easily grep whether there is
> anything missing by the end.
> 

Sure, I'll add BUG_ON() for the unimplemented functions.

>> +
>> +static const struct mmio_handler_ops vsmmuv3_mmio_handler = {
>> +    .read  = vsmmuv3_mmio_read,
>> +    .write = vsmmuv3_mmio_write,
>> +};
>> +
>> +static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
>> +{
>> +    struct virt_smmu *smmu;
>> +
>> +    smmu = xzalloc(struct virt_smmu);
>> +    if ( !smmu )
>> +        return -ENOMEM;
>> +
>> +    smmu->d = d;
>> +
>> +    register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
> 
> I can't seem to find a place where the number of handler supported is
> incremented (see domain_io_init()) for the vIOMMU. Are you sure we
> always have enough space today?
> 

I'll fix this. The handler count should be incremented during domain 
creation if vIOMMU is enabled.

>> +
>> +    /* Register the vIOMMU to be able to clean it up later. */
>> +    list_add_tail(&smmu->viommu_list, &d->arch.viommu_list);
>> +
>> +    return 0;
>> +}
>> +
>> +int domain_vsmmuv3_init(struct domain *d)
>> +{
>> +    int ret;
> 
> Coding style: newline missing.
> 
>> +    INIT_LIST_HEAD(&d->arch.viommu_list);
>> +
>> +    if ( is_hardware_domain(d) )
>> +    {
>> +        struct host_iommu *hw_iommu;
>> +
>> +        list_for_each_entry(hw_iommu, &host_iommu_list, entry)
>> +        {
>> +            ret = vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size);
>> +            if ( ret )
>> +                return ret;
>> +        }
>> +    }
>> +    else
>> +    {
>> +        ret = vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
>> +        if ( ret )
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +int vsmmuv3_relinquish_resources(struct domain *d)
>> +{
>> +    struct virt_smmu *pos, *temp;
>> +
>> +    /* Cope with unitialized vIOMMU */
>> +    if ( list_head_is_null(&d->arch.viommu_list) )
>> +        return 0;
>> +
>> +    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list )
>> +    {
>> +        list_del(&pos->viommu_list);
>> +        xfree(pos);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct viommu_ops vsmmuv3_ops = {
>> +    .domain_init = domain_vsmmuv3_init,
>> +    .relinquish_resources = vsmmuv3_relinquish_resources,
>> +};
>> +
>> +static const struct viommu_desc vsmmuv3_desc = {
>> +    .ops = &vsmmuv3_ops,
>> +    .viommu_type = XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3,
>> +};
>> +
>> +void __init vsmmuv3_set_type(void)
>> +{
>> +    const struct viommu_desc *desc = &vsmmuv3_desc;
>> +
>> +    if ( cur_viommu && (cur_viommu != desc) )
>> +    {
>> +        printk("WARNING: Cannot set vIOMMU, already set to a different value\n");
>> +        return;
>> +    }
>> +
>> +    cur_viommu = desc;
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.h b/xen/drivers/passthrough/arm/vsmmu-v3.h
>> new file mode 100644
>> index 0000000000..e11f85b431
>> --- /dev/null
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>> +#ifndef __ARCH_ARM_VSMMU_V3_H__
>> +#define __ARCH_ARM_VSMMU_V3_H__
>> +
>> +#include <asm/viommu.h>
>> +
>> +#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
>> +
>> +void vsmmuv3_set_type(void);
>> +
>> +#else
>> +
>> +static inline void vsmmuv3_set_type(void)
>> +{
>> +    return;
>> +}
>> +
>> +#endif /* CONFIG_VIRTUAL_ARM_SMMU_V3 */
>> +
>> +#endif /* __ARCH_ARM_VSMMU_V3_H__ */
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index d4953d40fd..ebac02ed63 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -330,7 +330,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>    #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>>    #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
>>    
>> -#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
>> +#define XEN_DOMCTL_CONFIG_VIOMMU_NONE       0
> 
> I am generally against trying to align values because this is just
> introducing unnecessary churn in the code.
> 
>> +#define XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3     1
>>    
>>    struct xen_arch_domainconfig {
>>        /* IN/OUT */
>> @@ -456,6 +457,10 @@ typedef uint64_t xen_callback_t;
>>    #define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..127 */
>>    #define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
>>    
>> +/* vsmmuv3 ITS mappings */
> 
> What is ITS stand for in this context?
> 

This is wrong, should be MMIO mappings instead of ITS. I'll fix this.

>> +#define GUEST_VSMMUV3_BASE     xen_mk_ullong(0x04040000)
>> +#define GUEST_VSMMUV3_SIZE     xen_mk_ullong(0x00040000)
> 
> If I am not mistaken, you are reserving 256KiB. However, looking at the
> SMMU spec (section 6.1, ARM IHI 0070 H.a), the minimum is 128 KiB. Are
> you intending to expose additional features?
> 

You're correct, there are no additional features exposed. The size was 
chosen during the early implementation, but I don't think we need to 
reserve more than the architectural minimum at this point.

>> +
>>    /*
>>     * 256 MB is reserved for VPCI configuration space based on calculation
>>     * 256 buses x 32 devices x 8 functions x 4 KB = 256 MB
> 
> Cheers,
> 

Best regards,
Milan

