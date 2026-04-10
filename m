Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNH4C2Ln2GmmjggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:04:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF1F3D6834
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278881.1563591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAbJ-0006WL-5y; Fri, 10 Apr 2026 12:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278881.1563591; Fri, 10 Apr 2026 12:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAbJ-0006VK-2R; Fri, 10 Apr 2026 12:04:41 +0000
Received: by outflank-mailman (input) for mailman id 1278881;
 Fri, 10 Apr 2026 12:04:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wBAbH-0006VA-6h
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:04:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBAbG-004zc4-Gv
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 14:04:38 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d8e747-e002-0a2a0a5209dd-0a2a450686b8-42
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:04:38 +0200
Received: from [52.101.66.133]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d8e756-0df0-0a2a45060019-346542851bc8-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:04:38 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by DU5PR03MB10218.eurprd03.prod.outlook.com (2603:10a6:10:51a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 10 Apr
 2026 12:04:36 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.020; Fri, 10 Apr 2026
 12:04:35 +0000
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
 b=A9qV6vMYaPb+lico7rk13WEc9b9ynlFC7TZ9luiE1UL5J0dh3SSlpWd0GcGonDA1su1Dzp8GE3i35IzkWkL6rMGnwyXPqGweORPHFjhKF1JWba8WYr2QrXisU2Dvi8+oRCsr1QAhpHOARka6LaXUPpi4BotmLAR39UUzMa9ABUsK0BKRjMnA8Eld5mcOD8PXsSRCx+7AmHELfref/KzASR1fxABhpVgy9dd0I3dMBSkadxSNA9JVfX/aIjkUSw7ndxiWmovG5CeSb69AQBoI2I+ITd9Xb3heHUcyHny+AsWeNIR+g917ltK6Vt6gMyHJ2neADoovQtR8uX7mvYf6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ocYjMX8B4d+THjQiKydpZOLUXpSsq8+97VyZcMyask=;
 b=d7Hnr+pG51o2n0uIR4VItNQ4f3miDqjHCb55w1fIzrH+eMUvbvjn2YLLUFCw4lbnznVyM2gSC+ALiZbyNlEtUf/gxd0w0/5075Ya/35mWFIOprdzxYzZjTi6bCc1Sa4uJWPrToWqMcbWuolgpa+ljXfDQITa0LbnVt/pzOhv1EsJ/3Gh53Px429tiKcQe43hxDcACbdqwimFSK4iMEjYp+k5aX174arYBqnkr+Zgbc3Ku2m+Ku+HJ+KgJT7GG6cZHtYGQdN8/TKrmM6s7tBuxSDgvKcLpVCLCq7Y36xWCeEpKJb6esTRpWkzeEwEvCSBBlbIFBp/v/drtjHTTNbKdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ocYjMX8B4d+THjQiKydpZOLUXpSsq8+97VyZcMyask=;
 b=apqymPJrLz8qwpMniwxipzgCWfL7jeiuVQ5dcOmQe5E1rnTo2IaxQquwF1S1R1vCHe+edDLo5lvh9KHin3t+dgLOlSSwNwDtuo+NnKM9zKXOUaGzdPc3idulC/kVOHVJvthATrm/8W+Dr6ZsEO8hNdhPYRFWfn5HrJQRc4T3gsN6S2SPKNxoMI3h+cYeRZ6yeVxL49p/EmW8vVvDrkkVufN7QKzgb3KmVGSLPRLWmYqG2LM6PR7LOPNS0kBtInDAPV/4oh6VkOPYe76X8OTQakNsCkybhB834v1juY+CHpQ6oO9OvMSyeNs1z4/mieIzQxUY+XsXphyb77AGHExX8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <66b7eaff-f7b9-4737-b32b-ca9ff7b661c1@epam.com>
Date: Fri, 10 Apr 2026 15:04:33 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>
 <775bc23d-7cd4-43b4-9e5f-0c70204b4262@suse.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <775bc23d-7cd4-43b4-9e5f-0c70204b4262@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0040.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::24) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|DU5PR03MB10218:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e0fb9b-b6fb-42db-7006-08de96f9552b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0lqYcGQ8TNEA3dAs6cmns114fiN8QDmHdBvl2OMIRin4zoT5KTL/iFn9nh2QYkM7lsgutUnHgMOn3eYJ0xwfFXRJu1WWc+vgU8Yx0WOF8IAw4uz2V2cEsDWrJ34FVfbMBtJz82CUzvOq2fUhYG7MvX6p+aW1L0xBQHIWRdo7X8N+J7/kMVKduFkWZes8tivPmung99SLw6rhc85VREUYfgQO0zDnyU7/Qj9gkCtHcukl6aInfTAs4Rx3JZtdy00LZTqgMDbvKfyE7xHDvvfc9Wu46BahPzhunTmL90uuFZjQz0vayB4RDsJfvaVifXiG//rtdX+cLt77BadClJj17fIXJ7HWmEY+XZ33kx2qqy+aCBuFgNQfl6Wau2OEvyCSTfWy1dpdQ5MBJfdMKK9Aj45jd8jFMKGZYHvdsQtb4EBQ5yGJAJgoxKIVbRobIZkXKbdcD/atmWvlnmoaXNpBc2BSN8ZlRVLfsOP8XUfiRROHGdv4MUm27mTSYZTw9tu7yvs8nJkAdCSs+7qksw6B7mBrCYWOJX4xF8DEbAx5Bs+79YdX7bLllrzOQ6p1aYgmMIezmwk09Ejp7jLcaPsbI7BQZGUSgcMfEKtse73IodWjytFnc4jYdeERRALaTSCkR/eslcVxzoNHi9WZNytJh8Wg9Ro4um/WoOM4xRtVLf8YZiTEqL5FY/Ra4mL+tNBOPxgtnfnPIXqsZvcxlwCgArZrcuVrFBlW5bDtYS4Kz/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3hCZGZ6THJaeVF0cm90blBwTFhDY3VtQlpJdWpHcnY5K1VQMSt6Tk80Rzd0?=
 =?utf-8?B?QmF0OU0xc2hXT2xYdnNJaEJTMlMxTWZFU2UxUTVOaE9KalcreW9Eb3U5ZE5m?=
 =?utf-8?B?bUtsR0NyZmFsbm93L1dnSzRNc0kyZHEzYWdPUHRLK1g2VHptQ2dpYXI4NFhq?=
 =?utf-8?B?NVNUZHJUdmZUMzdrWHo2bHV5OVFxa0JvMHBJTHdTNExYeFFxaXoxNkQ1UlU5?=
 =?utf-8?B?REt2RFQ3cW5LL2xLVnV5ZUpLdzNNTmtBRVRQMXM0RkxYbmZnRXM5bVlxV2RN?=
 =?utf-8?B?ek5MWmx1aDN2K2N4ajNNSk52NFQvWWM5R1VGSS9TbGZ4RFUyL0E0aW5XU3dj?=
 =?utf-8?B?NkpDQk8rMHFTQUFFWUFSSWpyN0lYZTl1TXdRQVp3OFZDRUVGYk41N0xuUnJr?=
 =?utf-8?B?QWpOcEgwS3hmSWg2dXBMb2Irem5VbWRhSUwwQ2N5M0dFeDdHQkRWa1J2K25y?=
 =?utf-8?B?cW9TTURTOFBxWXE5Qy9CUTA5Y215T0ZwaUxraHNwNnUyTFcwZnhTZzVZbGZB?=
 =?utf-8?B?Y0N2MW5YMHRWaDJPMEN0OHFFWGlyc3MxeE85QVpCaEFZSHdOMmFuRGJuZUZP?=
 =?utf-8?B?SytpcXowMmUyMllzN3c1bGlkK3FsSHd4MWVTTWE5N0NwSUVZV2YvMEtidXNK?=
 =?utf-8?B?c0IwMnNUcW0wRFl0QUd5NWY1b2RiTjJtQ1lOQzN5YUNIN2ViZHl1UEJrUS9y?=
 =?utf-8?B?SlF2S1lTZTB0M1lXWTVNUmhINm9hMlZoamE5TWxLRnlpZ28wSE9qREVaajd3?=
 =?utf-8?B?Y29VRFpBUUp3WHlmWGlxdGNaWkZGUU51YVpudzI1V0RjSEZyZGVuSUlUWEVv?=
 =?utf-8?B?MXQxcENLMXc2em0xVXJjSU0yL1VLTDJIeTdOQ0RHSVdERGlvZFZNTVpKNWdy?=
 =?utf-8?B?TjQ2ZTJuZ3JkR3J5V3ZoSEFhV3lBbVhpcFNwMTA0TG9KMGkycGNWNFAzQ3JY?=
 =?utf-8?B?aVBmaDdJalhPRjdObHRjdTA0cHBTOFBaaEtSY3Z3anNPenFheHhLZm5raXQ0?=
 =?utf-8?B?UHhtOTM2UmlseS9GeGMxai9HbXhzTkd1aXBrQ2lkRTNuTDhiWUVqUzZxRlNC?=
 =?utf-8?B?OG1nV1VSTHMrSy8wU3hNcUU2Ym9QSWFSeU5mSzRPeENTZEdKdVdRWHB2MHdK?=
 =?utf-8?B?dVFlQ0ZOYnF4V2xkSjQyemJ5M0Q3ekNBTnlqNDFSTlBIelpQZlVSQmovMUFa?=
 =?utf-8?B?NG4rczYzYUZvTWpMV0RBNFBEeG1SUzB3blhEQzZWK1VBOUZwUHVrWnBIa1Fa?=
 =?utf-8?B?Z05aNy9wZ3JzTkorOUNZdTNpSm5ybEpzalVoZkMzZmJ3K0FmdjZlTGtEYkJ5?=
 =?utf-8?B?YzAxa2U3TmdTT3JqcGRLUnJkMUdRRHdkcW5NcVNpNTh6bldNc0I0eTFwRGZQ?=
 =?utf-8?B?bkNQYXI2NHUyNTY4OG9CMFhJS2s2TktBU2JPb1E0a0tsVlc3K1hwOE1BZmhK?=
 =?utf-8?B?N0RreTl2WllrS3loTTRQcTVvRlBVSzQwWURjdVdHY1R3aTN2NjFXa21jU2dP?=
 =?utf-8?B?Ti81Y04wM1ZQMjdOTDUrMjRSb09lV2c1c0ljZkh2QlFwajhOcjlKZ05QbGN6?=
 =?utf-8?B?Q1NPMlpuR0tCYU5lV0svdWY0YlFvdHh6T3RvZmpUaXR0bHNmR2tFRWNzYmt5?=
 =?utf-8?B?STlFV3paZ3NrdmpiRVJjcUExeCtCL3FYVmZFZU5TWjIxd1Z0WVZjL1dzYnd3?=
 =?utf-8?B?ODI3TDJzazlKMksybDJhdk5vSUVyNFJHTXQyUTFvc3lPb2lJVGZ1RzVOVzlJ?=
 =?utf-8?B?R1ZHYkhaK2FIVmtLczZDaklSNjFHS1pCcWU3SmRZYU5LcDh2MEIvTGhDbG1H?=
 =?utf-8?B?VTYrK1lZbzZkamtMbkVGUG9FUkhkTHhVWEh0TnN3RUJIWkhwb3U0M3NXOHFM?=
 =?utf-8?B?b1Ezc082L2d6UDcxUWZrbDFXZ3FRVWFPQVpXcEVnRjZ6cWpENjc0UEpkYTFJ?=
 =?utf-8?B?YnRUYitobWF4UmlKTkZSNzNISFExNjVTaEtOZyswQ2RaRHh1NEljb2MzaFN1?=
 =?utf-8?B?YU0xd2g3R2o0cWIwT05PYmdPV3AvVzVacEZ1cFdEMERTNlN2eVRiUXZhK2lv?=
 =?utf-8?B?S0ZsdkF1NUhMYUlVRzBoNHdITk5hVmJNdExUN0U5UlZ2MzJJbThMODJSYUI4?=
 =?utf-8?B?NWFYcjd6TmVjRHBEMk15dDhBU0F0ZFVBcittZU9wOERJeUJLZUV5ZGx1emJL?=
 =?utf-8?B?UHdsWmJDL2dQaytsRUhIZ2hDQzRDUUZ0bjdnSThiYmE4YUUxUGdtbnEvSXNR?=
 =?utf-8?B?TTQvN1lqU3hDZVgxRVg2TWhzK1NBNitsQmhzaFV6aHR2VUw1OWg3Y2xQUXlp?=
 =?utf-8?B?cmt1TU9RaG1ENlZSN2VxeGJBdXVsQm9OcFVIKzk5THoxREJGbFNaa1Y5K3ZJ?=
 =?utf-8?Q?wChHV/oxIHid8ImY=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e0fb9b-b6fb-42db-7006-08de96f9552b
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 12:04:35.4870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71Wg4KfiEf3jbSZDHRnLTQbwMr646VEnjP7sKQ8CrZTCKYl+9l9DLrkMdraZ/0/nhwxN0P6Nwz+oTmdK+JvnJKKhbP3JURtuqgp9f/HHIqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10218
X-purgate-ID: tlsNG-16d1c6/1775822678-ADB2B3D8-7DDE14B1/0/0
X-purgate-type: clean
X-purgate-size: 895
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8AF1F3D6834
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Juergen,

During our safety certification analysis work, we identified this as a 
potential
issue. While we haven't encountered this problem in practice yet, it 
could occur
in the future, so I believe it should be addressed proactively.
--
Oleksii.


On 10/04/2026 13:14, Jürgen Groß wrote:
> On 03.04.26 11:29, Oleksii Moisieiev wrote:
>> In RTDS, removing the last eligible pCPU can kill repl_timer.
>> When a pCPU is later re-added, rt_switch_sched() reinitializes the
>> timer object, but pending entries may already exist in replq.
>
> Did you experience this behavior?
>
> I'm asking because I don't see how this could happen. A CPU can't be
> removed from a cpupool as long as there are domains in that cpupool.
> So how would replq contain entries after the last CPU of the cpupool
> has been removed?
>
> But maybe I'm missing something.
>
>
> Juergen

