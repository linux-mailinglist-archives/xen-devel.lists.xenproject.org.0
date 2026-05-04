Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAI8HciP+GkVwgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:23:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D52484BCDBD
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:23:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299733.1574280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsKd-0005aT-8G; Mon, 04 May 2026 12:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299733.1574280; Mon, 04 May 2026 12:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsKd-0005Z4-5b; Mon, 04 May 2026 12:23:27 +0000
Received: by outflank-mailman (input) for mailman id 1299733;
 Mon, 04 May 2026 12:23:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wJsKb-0005Yu-NP
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:23:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsKb-005qLq-3B
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:23:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f88fb2-bab6-0a2a0a5309dd-0a2a45098874-38
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:23:24 +0200
Received: from [52.101.43.0]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f88fba-2497-0a2a45090019-34652b00fc8e-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:23:24 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6522.namprd03.prod.outlook.com (2603:10b6:303:125::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:23:17 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 12:23:17 +0000
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
 b=CYYd4Xn1DQWMxx6fwrlaLb8VTfdhyM1RuJQvDZ/ra48wFQNxmo9RGey8a+abVQGRZGr6AhaAFZLDoMsT2/pYCwR3At4QQ10GN9qAuhSXP9EO/vXEv4clTYsXXMJv8zrM2Nkn7AC/Fp8qMTtJpsbi2k2WxrXDmJJp3s4xGuON9bi0a2vCTykbz6D397em3D6PDTPLZOlsXQtAEweNGMNsrBLpDT9GoweGw10eFvb8yduvdkY+2S4yh0iXvbvLfzEMihJNVRbR0Rvg0RnyFZOFPFtJdAhAUxjRE3h7QOMmEdxmsp/MLYYiK7vXUiMIrPw53hSIhFEgkahSeussFwwR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GomDykBq408lyJL8ud2XmrL8OIhvktO9VLyenyVpQzI=;
 b=Dm5LvH/5WA3BN4D2dief14THMAUIWb6SL5zoohCQFBJM7mnTvyaG6UZFDQ9BLGm7f9xSgyZRf3/fS0VBLpemS7CXbu+uq0aP6mpuIB9dUkplxG7OjSt2BJvFp0VR5Mt/iIA1WR0MAh7BHtJln+B/pWc9NBPcL/9kcohzmqdPUc4rhGJAaapf+fbNNGhWsyqUD9nNIRheqwZXYSfV0Bxb8Sve+LPgNO4PJp3DaSR6Pj5r+kG539F17gHYetH+V/b8xaF3t7Rb6CvwFBl4/SZ5eCz7P9cR5kFG11oQMUkQEaH0k33Typz1GNdDVe3XJhhcY7fh6mg8upDPoF3LZ1nt4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GomDykBq408lyJL8ud2XmrL8OIhvktO9VLyenyVpQzI=;
 b=PA6kYVjiGvm7IAoWzZW3MG9UFF1dQhr/CTGE+cMPq56A3bhfskdzGZNGVPQRwV3exyI3x02tTj0XmGMsOJ3wJPqoBRE4L7R1kOyhSfkuxZw9hZmf6Fvt537v9BjLhtsfVMclLWK3zGq5xhVkVow8DTlbiCS6jLcRZQ5g+6idlTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 4 May 2026 14:23:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Alexey Gerasimenko <x1917x@gmail.com>,
	Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 11/17] hvmloader: allocate MMCONFIG area in the MMIO hole
Message-ID: <afiPsnPYJCtm7VmH@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-12-thierry.escande@vates.tech>
 <afHPdxc72FDGnQoq@macbook.local>
 <f6521590-e51c-4f00-bcf8-faee79a5d3a5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6521590-e51c-4f00-bcf8-faee79a5d3a5@suse.com>
X-ClientProxiedBy: BN8PR04CA0056.namprd04.prod.outlook.com
 (2603:10b6:408:d4::30) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: 1927999c-d389-4537-b75e-08dea9d7ebc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9nopWrCKDkSYcb/5IawlsMDK428d36IsLWYaWNZihL4E0smE1Jy8xq3rLBcHh9Hz8GY1zviUoYDE/fTo7IjGecS8rGpHt0KrWvDFjB5hBwyRZu1sXVJej3PgcP05b2Z40ZoXUSpbBu+oiOSepkhk/KfOeWM8bgIw2XymlAgHV8buvT4cnf6EK2BXRcu0jr6ilYxioxj5j40qdsiR9Jq9HVI/7grEh7xPo14vb0cvKyAMr73RD0v6heaVAanEUtm5Rv7s6zb0ZDuwePBszAF/VG6BZhtSPURlA1d3gWWBCfL8qnUK+mp5vhrAKkgkt4KzY+IcW1YkAtAXHmL0zn4pjR8s4ESeNwk4EVyqDgGbynV17xmx39JIjwFe2h8MdNQEGoYZKZVS748tI/2CbGPtMyGWCHtAFK5x2BRtGgIg0N3XJmgVt0c9Z/86d4j/YE8hETHygJr8xZeQOikLE5LepILzzafshoEcgpZZcd32wvcBr7PZjsT4/k7gLrCDzsb3/9+WlFEPg4mCl/oa14hZDcOUZoVT0r8nerZFkYQwn3F2uMwSxHV7ufwRzJ5Blow8kYURKMrnEvCMOz893iPPuXnrw+yAv7TqTPLC7Ai5Ub41jLBXwek79j96N3CQ4yzPu4/FhdvWeMrVABP46fgnZepHNuEMxBkAynrkc3IUm9fhWkA5j5FBAS7pMT+CeEhn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFdGZk1hZ3hkQUI2alp1bU9OYWdXQm00aE9IM1hsSkVWYkRVNUtTeE9MUGJ4?=
 =?utf-8?B?Yk4zSDRoTmxSZEk1U3ZWeWhoU1ZOSFVOVlY2VHQ3aENKc3FaNUZReVJFR2Yv?=
 =?utf-8?B?dW81WmdRWC9rT2VubDE1OXViRktzSDlMOVg4ZFkyNThlYzBmcDEyKzRYRTdS?=
 =?utf-8?B?KytPVHkzNVdub25yWFpPNHJnWVBYaytRcXpUVVRmVFZQNjhvRjBQWjk1eHBV?=
 =?utf-8?B?NGVuUE1JK096VkNyM1hOQURubGdqejI1Z1UwMUxPL2F2aW1tc05PNzl3V0F4?=
 =?utf-8?B?UjZqeXdUY05remRsQjc4NkJUS0dvaDF0VktHbWxMV3RiZGx5M2xVVDBPR0R6?=
 =?utf-8?B?R0hwQzcvSXJxSk9yd3NHQURVbHJJK3kzR3JFTGVreGZqcWNuMW1qVDJEUXdU?=
 =?utf-8?B?bGhHbGdjckQ3M2V2ZnY0c3AxYmNQam4wNFhrR2xNbGsyT0RGNG42cWQ5KzZo?=
 =?utf-8?B?eVN6MDRVUitZSXVRMnAzdzFzWEdEQllNcVNMMkdMV3UvNWhNbld4SjVMUHli?=
 =?utf-8?B?YWt4YkpnN3Q5WGZ5Z2F6V0RQMFRUMnBxT0dUcHpKeG1LNnZVWnlmOVFaL0lE?=
 =?utf-8?B?VGFJMWdKc0RCYXF0UnkwUVZONXBJTDMxY3VRK1ltSk5iRFpLcGp3M2NxNkJK?=
 =?utf-8?B?emhxaHFka1hWSVVoV1JlaEFzZWRWRllWN0tTREd6aFVEcTR0YXRkT1h4ends?=
 =?utf-8?B?dmZmeTd4c2lSb0l5cjFveFNwUnZ0ZlczZUJGR1R0aXVDYXNseERKMTRDT0RX?=
 =?utf-8?B?NFZCQzhldGk4UFpvQnJZMEg4U2tzVE5RRGdnNkczTjlVU1BxRkpSaGI1Qms4?=
 =?utf-8?B?TWZLWnphanJrM090RmZ1dVZzc2VXeUdRVTJybmZ5QkJoSzZwVXh4Yksyb0dD?=
 =?utf-8?B?clhOWCtIdEJSaTJYNXhCc2JKTk1wZXE1ZFNRbk9peCtwT1RPYk1Ha3RLZ2d4?=
 =?utf-8?B?M1R4WTZiK01PaHFITFFTR0Fla1dYMlA2QU40Z0NoNzhBeTFWVm56VytjNHdm?=
 =?utf-8?B?a3dXUjE5MEl0eEM5cDRsYjNXcVJITjUwK1dveWVaYUJJVmF3ZUwrcE85WTZN?=
 =?utf-8?B?UktCa0c3QlBiUjFNRkIrdVBGQ2ZYbXpOMjBjamVxK0dYV0MreGFPSVFPUmxU?=
 =?utf-8?B?THFIWWxEUW9NV2pucUFhdmhqd2d1YUY5b1FVSy9oN0dlQS9yZWMrL3V6b0Q0?=
 =?utf-8?B?QjdzemVKeDNSYkJORzdPZ3RmMU1YVlhHSnlVQ25FeDJSOGJIeG5VT044SDBM?=
 =?utf-8?B?OGhMTFRlWndRRjd5Y2hEakVDcGZTOHFENWlIaDhNakNSN1dyTkkvZ3FwaWFJ?=
 =?utf-8?B?bm9DVXlKaTZsSE5WeHBMOE1HWW1MZVd3UDRraEtPUFBHZXBOeGZFR2VkdDNT?=
 =?utf-8?B?cHRtTDFtY3hIYk9oTTJHa3FRdDRUR3dIdGNvbTZ3ZEdUbUszNVpLT3dEeFlZ?=
 =?utf-8?B?R0g5UkVjcDh1Mm1QRGY1dy9BU3M5OVZjaTdia0JYY1g4aUEvTGN5eUtRcnBT?=
 =?utf-8?B?WW9LTkpCUGlDc3ozdDBieml6eDUzeFNsQUNFTTF3NFJoZXk0aElnVUo2cUYr?=
 =?utf-8?B?N290Z0NjL1lGT05XQUExaDd6SjBablVPT09JRk9WK2lZV3NENVR5ZHlsdXhN?=
 =?utf-8?B?SzU3aXJlY3ZKQTNWaU5VMTUvQk5ScEZCMDdSS0g0dUE4L2UxV2xIbDcwUk9y?=
 =?utf-8?B?SmNxQ1F6V1VsU3hnWERmRUt4NEdjdDdvUEhicGFzWFl1cDVUWXhZQVZlSThN?=
 =?utf-8?B?ODVPUDNOdXNtcTNOMnVEVVkvNjVUSU1tNzV1Z0F6djJ0QVZoYkJQbS9BcURE?=
 =?utf-8?B?TDhRSmllVUZ1L2V1TU1xQXhIczZJcDRkbjJWdWhoVHFrbzRKNWoybklEQ2Vl?=
 =?utf-8?B?Y0RlaXFnR092aWNYcUdnVzNoVkRuMXVPY2hHQkZ0T1FKSGdpeFdOamViZ1F5?=
 =?utf-8?B?TjNUTExQSDB0TDFXc0JwNmJ3U0hPZzlJeERlY0Y1VllHY0NpZlk1dEkyOURZ?=
 =?utf-8?B?RzAvVG1yZWN6VHdQalVka0JLK0JVUGFleHdjaC9vU1luclZrbC93cFA0Mjky?=
 =?utf-8?B?MmlUVWdSZEFMdTVoVFR1N2hsQkhGM3E0ZCtrYzVHc0VXemFJekMrU0lWRHFy?=
 =?utf-8?B?YWNkYksyL2ZFVjFUZEsrNHRuQ0h1UWZkbGFtSXVZVzBnNTZMUzFTTVcxV2dC?=
 =?utf-8?B?MXZIcTlWNjBJazFId3ZmVHBkYXlIbXM4MUFaWmNmKzZTdFVENS9LS0dUL2dp?=
 =?utf-8?B?bUpBWHNEd2NqUFpLVjRqbUxFYTFsdGg1OHdvaDQ2SzhaTmNlcnE2Lzhwd0hR?=
 =?utf-8?B?U0ZtRlF0ck9RYXFlUENSeTlPZGpsR1FIbjFpclNWb1ZtVzdVMkFMUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1927999c-d389-4537-b75e-08dea9d7ebc6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 12:23:17.4611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsSK5AnMQ3FeAN5jmx4wXhtvDu2q0CM3oD+OKk01PK9bzObUSl9V41BM6IhDTyztiw83efk0qMChsjix8Gp7Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6522
X-purgate-ID: tlsNG-bad1c0/1777897404-9236CA53-E77E88C8/0/0
X-purgate-type: clean
X-purgate-size: 2928
X-Rspamd-Queue-Id: D52484BCDBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,m:thierry.escande@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Mon, May 04, 2026 at 01:11:44PM +0200, Jan Beulich wrote:
> On 29.04.2026 11:29, Roger Pau Monné wrote:
> > On Fri, Mar 13, 2026 at 04:35:04PM +0000, Thierry Escande wrote:
> >> --- a/tools/firmware/hvmloader/pci.c
> >> +++ b/tools/firmware/hvmloader/pci.c
> >> @@ -413,6 +413,58 @@ void pci_setup(void)
> >>          pci_devfn_decode_type[devfn] |= PCI_COMMAND_MASTER;
> >>      }
> >>  
> >> +    /*
> >> +     *  Calculate MMCONFIG area size and squeeze it into the bars array
> >> +     *  for assigning a slot in the MMIO hole
> >> +     */
> >> +    if ( is_running_on_q35 )
> >> +    {
> >> +        /* disable PCIEXBAR decoding for now */
> >> +        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR, 0);
> >> +        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR + 4, 0);
> >> +
> >> +        switch ( PCI_MAX_MCFG_BUSES )
> >> +        {
> >> +        case 64:
> >> +            bar_data = PCIEXBAR_64_BUSES | PCIEXBAR_ENABLE;
> >> +            bar_sz = MB(64);
> >> +            break;
> >> +
> >> +        case 128:
> >> +            bar_data = PCIEXBAR_128_BUSES | PCIEXBAR_ENABLE;
> >> +            bar_sz = MB(128);
> >> +            break;
> >> +
> >> +        case 256:
> >> +            bar_data = PCIEXBAR_256_BUSES | PCIEXBAR_ENABLE;
> >> +            bar_sz = MB(256);
> >> +            break;
> >> +
> >> +        default:
> >> +            /* unsupported number of buses specified */
> >> +            BUG();
> >> +        }
> >> +
> >> +        addr_mask = ~(bar_sz - 1);
> >> +
> >> +        for ( i = 0; i < nr_bars; i++ )
> >> +            if ( bars[i].bar_sz < bar_sz )
> >> +                break;
> >> +
> >> +        if ( i != nr_bars )
> >> +            memmove(&bars[i+1], &bars[i], (nr_bars-i) * sizeof(*bars));
> >> +
> >> +        bars[i].is_mem    = 1;
> >> +        bars[i].devfn     = PCI_MCH_DEVFN;
> >> +        bars[i].bar_reg   = PCI_MCH_PCIEXBAR;
> >> +        bars[i].bar_sz    = bar_sz;
> >> +        bars[i].addr_mask = addr_mask;
> >> +        bars[i].bar_data  = bar_data;
> >> +
> >> +        mmio_total += bar_sz;
> >> +        nr_bars++;
> >> +    }
> > 
> > I think it might be best if the ECAM fake BAR is the first element in
> > the bars array, so we ensure it's the first item to consume memory
> > from the low MMIO hole.  Not sure how that will work with the current
> > sorting of the resources based on their size, but it's imperative for
> > hvmloader to attempt to position ECAM ahead of the other device
> > resources IMO.
> 
> Why would this be?

I would assume it's best to have ECAM access in the low 4G (for 32bit
OSes) at the expense of some 32bit BARs possibly not fitting in the
32bit space.  But the ECAM space could be placed above 4G, and 32bit
OSes might not care much about extended address space capabilities.

Should is_64bar be set for the MCFG "fake" BAR?

Thanks, Roger.

