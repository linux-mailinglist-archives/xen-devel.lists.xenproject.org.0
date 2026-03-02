Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F9MLTWjpWngCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 15:48:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2469B1DB21A
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 15:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244271.1543709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx4Yt-00024D-TB; Mon, 02 Mar 2026 14:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244271.1543709; Mon, 02 Mar 2026 14:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx4Yt-000223-QQ; Mon, 02 Mar 2026 14:47:55 +0000
Received: by outflank-mailman (input) for mailman id 1244271;
 Mon, 02 Mar 2026 14:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OlTG=BC=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vx4Ys-00021v-BQ
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 14:47:54 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c718f7ea-1646-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 15:47:48 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV4PR03MB8283.namprd03.prod.outlook.com (2603:10b6:408:2da::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 14:47:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 14:47:44 +0000
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
X-Inumbo-ID: c718f7ea-1646-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lk0l+qY9hr2oIpYOWZtB/razWGAC6pzilt7De7ajta4Z80TIy9AZd+AVmgUVWzzWL/Cys8ijVnZe0FBhWYPRq9CjAXN0JckWfG/y/GlrVOW9v6jE8S4rl0qcVtBGL3ikDMuqyn6mpe+0vkl+vKVM+G+vLq9GTsQxclH5CPnphwLYklgd2XSC5Wf5zwNYwKDveMhtfytZ2FFkNa2Qyl/bC7RJv4BSXOIOb8jRp2STvEcvntxnbSLqDL0PXjQHUBOJcdobe/8MPTGeOcFyl5FiV9W6uJeBHjFkUNC8GCe3E6AGSIQoORO5mLKpXr8zWPd5ftwzrNZ5nf4fjIU3KVEOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUgR0VA1hI3ReBjqil9zWhw2fV2myELZil2IMNxGz2E=;
 b=yzn6VaV6KTfI6fWEoL52IvgTGuEtyxPfqYAOJ0KKPHSGBpK+LMQh5GMnFztkglDv/Pe1C9e/jWgKuj95LrIUS1tqnTESkwSMjwpJ+ZqIt6ob3sGodfsZrw3YdbBuoo81ew574au/de4d9tW/92scbbs4M3Iwt52Lvf8oSuiQx06iqL4DqVgCCOGlkj6avo0DLKoUlWXwR5/Ae5mdycL0Qua1JkVRVG5mw2TWHwGVFDd7WP11V3s3qGVL/GQxlOCwocekcrKxuEdoadjElRgBc4rgzaT7nti8Y77TgKHBecEHbX+S9EwP/gMf+uUgJbQVujGSvCk9uEG6l45EzYoSNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUgR0VA1hI3ReBjqil9zWhw2fV2myELZil2IMNxGz2E=;
 b=xY8vP6H4UO3YYzhqMeZfkOFJmvx/5viIohabCsZ/alC9ai549wlvfgnwvvPXmgE/KaHYbARBQ6485NQuiVItFtHNT4h2ZQmlOyA9so/ozy9dv839viHZNwVwIajxuZ9/Edv6hbrBjd1NvyO9uSnyECuam6Sb33G2FhALOoFtCuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ba50a431-db37-4314-baad-e03edb84b396@citrix.com>
Date: Mon, 2 Mar 2026 14:47:41 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 02/14] docs/guest-guide: Describe the PV traps and
 entrypoints ABI
To: Jan Beulich <jbeulich@suse.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-3-andrew.cooper3@citrix.com>
 <4052793e-094d-449b-af97-e2d068836366@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <4052793e-094d-449b-af97-e2d068836366@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0034.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV4PR03MB8283:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6b6e7f-a237-4a7b-79c6-08de786aa9d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	NkfcPSBy+VfHocfs0hOs2xkLYhC1+UlE8MRuvNqDBMZ6B3bc6A4j7i/l4r/86sjfcXrZMakbN8era7bztwJDrgojrWGB9UkCg4/eQTBX78awXzNf5r7buZhIcmwBxJan+eknLaLtCQmbJeUm7IXeFs0gGX8wkMEyl2KqJVEIo6JQupsWk8l5mcF5dhEslzmuzvYeH4BQow6P12J9hOZCBn+2ChiVlZr6RafVALn5I78zoFfrcJBr2gz/4M2XcGKJsaHJsDt4X2C27HJAvu+gY08+SqLHWQSdmk1eFB6TjKFqiYokOMsctysq6osJUT3N0WaJ63ex2/jzAefwFpt0saus3LtNfwjbCPSjALeFVs17lL6kYEOezrwPje0RNuuVjjWlDzJKOH5+WHIhf+Uy3QWMQtBRbEKI1l0cSIq7f4k4oJ5bJpRi51rVNrjK+fN58maKSiClp6VkiJyELYRhVfANrXQx6nMJPEdc5JpsauFi7MQ7GThSycLeOw9490ru/dW5Ck1iHH6vpW3rWA5sjL4XkYUoMaqVZamDqLVoetlNj875YONGkYvpQMAPXsysDck7r8yq3szD9WRFwRuHPx4FrZvBB8mFbnK9JFJ8MZT95aKZ/0da/5FM9MLui0OcQMQGeOl7T+cBvh3vVLxYhNO6y9ItO3oxmRxkWM9Iad78HCvk2/PlHKMweUkJv1BPVuu550CfQeI0KhO4AjtJ3cNQQeX5rsMgtKGPqNSgzM0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDJneXAvRDZZRWNKOTYzSURPaStvTUI2UE5rRlVoZEIrSG1QUjU3ZFMrYmll?=
 =?utf-8?B?bXRZOUJoRXBWVHlQUjJncVB4c2c1b0pJeDBJWU14d3F2cHZJZzQ3N1ZzL0w0?=
 =?utf-8?B?VmNORnpYZm03VS8vUVMzTXd4b0xDSWtzd1VGaVU0QlptcFpacXQ3bGdBdXdn?=
 =?utf-8?B?ZVo2elhWeW5iS1laRE9EanFMbkMwMS9zOEFPQVlCdHZLM2dsM3NYaEJ0TzhU?=
 =?utf-8?B?RjJZenRrVnhPcGhwVjRuUHJjOWZJczhTRXJTbldCUTNBcUV5WEV1b1JEcUpE?=
 =?utf-8?B?UGlFVmxVU3dOcmhyVVJVTHdqL2RGL244L3Rla09ISTRNNGxETnZRTWVIcjdv?=
 =?utf-8?B?eGpZRzJ6MHgxUXZGaFNNaFBXVGxlT0h1SjJ2NDZtVGgzaWZ2Qnp2aFN6RVRH?=
 =?utf-8?B?ZGxVMDErSEdVOHFjZ0YzWTdTWkxQOVVxUk15MlB0OEFSdSsyYXVMUktXZnJw?=
 =?utf-8?B?QXYzaE9iVDk3cFNVOUpia1QzcWpYSitnd3VQQmZ6MEFsKzNXVHhhV2JmSWkw?=
 =?utf-8?B?OG1iNTFnbW1pZ2dDTmVFKzNYTVhYQjZEZ3Z5RjNzdGlNMFVSNUZQZVdvMVly?=
 =?utf-8?B?MnRCYWx5YjZiNExEaGVnZjZybVFDbkQ3VnNVRTFiZVI4cVNYQURyMUY2WXdq?=
 =?utf-8?B?clZrUzhCUTZSenhmQzFxb3Rybno1NnE3MnAwS2k4UkV4K3ZiTFp5My9KREtE?=
 =?utf-8?B?cUVPZ2RqUXhoODk4QUNUVElxOHQ0SHNOemIzL1lIRjY5SjVkTjliM0JDVWZy?=
 =?utf-8?B?WEVycmN5MElqSjZaekZOM1hQY1RkMks4dUk1R1pPSnFqbHB1QU1LV28xdVpk?=
 =?utf-8?B?VWRYZUx3Z3hCb2VGeGRuSkt5TjRaSnRObS9FNjkrV2tJalI3UDEyM3QwdGdp?=
 =?utf-8?B?blZnRFJzRmtMM0l5Uis2M1RsbXBmV2xEdUIxMm9XMVZlQnRibVpKZHVERU1y?=
 =?utf-8?B?K3NORFdxcnBteEUvSWsyb2lKcjg4S1Z5WjYvK21OOHE5ZWJOaUQxVlJaejA0?=
 =?utf-8?B?djJDRnl6OUMyZkMrTVFiTCtkMTRIYUU5UmthN0gzblg2VFdZY3djT0puYVp2?=
 =?utf-8?B?TGdDdkNkWkVGcGhSS3lQQ3c0RTVzVDMxaURYTHFLRnY0K2tPYkdTRy9uWG4y?=
 =?utf-8?B?KzE1U0VVSDRiMUR4U1hOb3ZXeWdFWVhCN1B2ZG9mSW4xZnJFUFVqdWF0aTI5?=
 =?utf-8?B?L0xOcDZkcno1RmVXMERIUWxaYXlTV0Viamw5aTdaUlZ4a0Z6bitkMzBCdWJX?=
 =?utf-8?B?TTVrOXFpM0owNWpNSDF0ZTZUSm0zRDdBMnpZdWhMQUcvL0cwdnlodzB0cVE2?=
 =?utf-8?B?MnpYbjBNUW5oYVJ5UlB6VGFodlRQVEpXek5sb200bWVhQ3pHazZoQ0lCcTlQ?=
 =?utf-8?B?QlprQVBaZVI0dE5GNVBJeWt6VjFvNzJMQithVmdZRm9lcmlUUW90c21EMW9W?=
 =?utf-8?B?eTlqbVA3SlRFbmxzNGpPTnBkVkVVaDllSjdkV3VVQ2w1Z3ErQ0tKNmxYK3VJ?=
 =?utf-8?B?NFJudnVRS2FrMkRwNGZ5MEcrdXNsZGZBYk0vQWxyVWVnK2d2RlI0Qm0xVVBi?=
 =?utf-8?B?dVRKaFVidjNmeTVlam9KRUdLaGxqR2VXWGdBbjVmT1hUVkErWEtsc0tNYUZr?=
 =?utf-8?B?YVNyeFUzUDhkdEFWcWxLWWkzclZURUxnTUZzUjIrSEZhOVRIQVFpNnZEZ1ky?=
 =?utf-8?B?OHp2M2RZdjZVaXlmVml1RzFpRTJuTlh1OVJPSTNhdDJYR0FtclhFdGRlaXJy?=
 =?utf-8?B?clo1bis3RzNlUVJGSG5iK0ZlSkh1akFzcnBkakREK050VllQc0VORlNKRmVC?=
 =?utf-8?B?TUlJOUs2SlNxMHlCS3p0LzFVMUhJNGUzenZCa3hQOHRvaTVsYllTUGNZaWxU?=
 =?utf-8?B?dUQ3V1ZvZ295UzFPVGVjOGVPTGtPcHVISTN1MDhtNUdzM25HWVN3NzdHVkV1?=
 =?utf-8?B?bGlOYzBmWGRmV0FTNWVwNkN0elJrdGh3aDV0WHoraU42U20wclFVMHBwMTZz?=
 =?utf-8?B?a0lLN3RoSlk0aVhybS8yZDdNV0M0OGtvMkdackZ4YkxacVd5YUNMdENsaDE4?=
 =?utf-8?B?NjZuMjczeHZEWVJ1NThtZWxYUktKbExUZ211MXpHbUR4aGdUdTFhRmd2M1Uy?=
 =?utf-8?B?RFdZeFFZc09VcWJkMnQvS2ZUWGlCWWJ6NzFpcloxYTF1Z0xDTFRGK1VOZFJX?=
 =?utf-8?B?Y1h0OTRUOWlLL1ZZQnpRK0xSQ2F4K2RuUDI2dmd6dTJydmkrb2lRYzJMaG45?=
 =?utf-8?B?RFZ5Qy9qV0tOTDZnTUw4eEVnY1F5ODQwYU1zdEpneWl0S1FHZy85bkh4SFFi?=
 =?utf-8?B?ZnplemVFNlFRc1BTQk4wUHRWRjZiQzhZdGN4RFFSUW9BZEs4MkVaQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6b6e7f-a237-4a7b-79c6-08de786aa9d2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:47:44.5098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 591JOMu4Pbp/HGz4uWZmX/m5eN4upOhJs0W9drrdR2FGZ6lUB3Hy9fGqnNdOXNOpIk5qHBS/X2yqwPiBiwVrI9Paokh+ierGIS5OhsZU6XI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8283
X-Rspamd-Queue-Id: 2469B1DB21A
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
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 02/03/2026 11:19 am, Jan Beulich wrote:
> On 28.02.2026 00:16, Andrew Cooper wrote:
>> ... seeing as I've had to thoroughly reverse engineer it for FRED and make
>> tweaks in places.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- /dev/null
>> +++ b/docs/guest-guide/x86/pv-traps.rst
>> @@ -0,0 +1,123 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +PV Traps and Entrypoints
>> +========================
>> +
>> +.. note::
>> +
>> +   The details here are specific to 64bit builds of Xen.  Details for 32bit
>> +   builds of Xen, are different and not discussed further.
> Nit: Stray comma?

Yes.  From a sentence refactor.  Will drop.

>
>> +PV guests are subject to Xen's linkage setup for events (interrupts,
>> +exceptions and system calls).  x86's IDT architecture and limitations are the
>> +majority influence on the PV ABI.
>> +
>> +All external interrupts are routed to PV guests via the :term:`Event Channel`
>> +interface, and not discussed further here.
>> +
>> +What remain are exceptions, and the instructions which cause a control
>> +transfers.  In the x86 architecture, the instructions relevant for PV guests
>> +are:
>> +
>> + * ``INT3``, which generates ``#BP``.
>> +
>> + * ``INTO``, which generates ``#OF`` only if the overflow flag is set.  It is
>> +   only usable in compatibility mode, and will ``#UD`` in 64bit mode.
>> +
>> + * ``CALL (far)`` referencing a gate in the GDT.
>> +
>> + * ``INT $N``, which invokes an arbitrary IDT gate.  These four instructions
>> +   so far all check the gate DPL and will ``#GP`` otherwise.
>> +
>> + * ``INT1``, also known as ``ICEBP``, which generates ``#DB``.  This
>> +   instruction does *not* check DPL, and can be used unconditionally by
>> +   userspace.
>> +
>> + * ``SYSCALL``, which enters CPL0 as configured by the ``{C,L,}STAR`` MSRs.
>> +   It is usable if enabled by ``MSR_EFER.SCE``, and will ``#UD`` otherwise.
>> +   On Intel parts, ``SYSCALL`` is unusable outside of 64bit mode.
>> +
>> + * ``SYSENTER``, which enters CPL0 as configured by the ``SEP`` MSRs.  It is
>> +   usable if enabled by ``MSR_SYSENTER_CS`` having a non-NUL selector, and
>> +   will ``#GP`` otherwise.  On AMD parts, ``SYSENTER`` is unusable in Long
>> +   mode.
> The UD<n> family of insns is kind of a hybrid: They explicitly generate #UD,
> and hence do a control transfer. Same for at least BOUND. It's not quite clear
> whether they should be enumerated here as well.

UDn and BOUND are strictly faults, not traps.  They're type 3 (hardware
exception) and provide no instruction length.

The simplest implementation of UDn is nothing.  The decoder already
needs a signal for "not an instruction I know" which is wired into #UD. 
All the manual does by defining these "instructions" is promise that
nothing else will be allocated in that opcode space.

BOUND is weird.  I'm not sure what more can be said about it.

Either way, #UD and #BR are not interestingly different from e.g. #PF
from a PV guest's point of view.

>
>> +Xen's configuration
>> +-------------------
>> +
>> +Xen maintains a complete IDT, with most gates configured with DPL0.  This
>> +causes most ``INT $N`` instructions to ``#GP``.  This allows Xen to emulate
>> +the instruction, referring to the guest kernels vDPL choice.
>> +
>> + * Vectors 3 ``#BP`` and 4 ``#OF`` are DPL3, in order to allow the ``INT3``
>> +   and ``INTO`` instructions to function in userspace.
>> +
>> + * Vector 0x80 is DPL3 in order to implement the legacy system call fastpath
>> +   commonly found in UNIXes.
> Much like we make this DPL0 when PV=n, should we perhaps make vectors 3 and 4
> DPL0 as well in that case (just for formality's sake)? Maybe 4, like 9, would
> even want to be an autogen entry point then?

We could, but does that gain us anything?

For 0x80, we get another vector to use for regular interrupts, but that
doesn't work for the vectors below 0x10.

~Andrew

