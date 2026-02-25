Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M2PNgPonmk/XwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 13:16:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31BA197222
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 13:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240676.1541978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDn9-0000FN-FM; Wed, 25 Feb 2026 12:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240676.1541978; Wed, 25 Feb 2026 12:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDn9-0000C2-CF; Wed, 25 Feb 2026 12:14:59 +0000
Received: by outflank-mailman (input) for mailman id 1240676;
 Wed, 25 Feb 2026 12:14:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dz9A=A5=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vvDn7-0000Bw-UU
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 12:14:57 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98bde931-1243-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 13:14:57 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB8382.namprd03.prod.outlook.com (2603:10b6:208:543::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 12:14:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 12:14:53 +0000
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
X-Inumbo-ID: 98bde931-1243-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLFMXvCBvNrYZIDe3wsVAWJ+Th/FM6xAQbRqUTsWBF+RyUGECjoPrMS2QH+ssMfe4bpgq7+UetTXg0i/j12lmTzL8DOXohtDcn7K0f8XnIZ12+oGgye6xeZuRwoBI1CYg703uDpagmEijH3oQ3EBb4jHtOPXSIoA93aeM9LhcEp4ruxkVjEmfOFguhHekkY7iXUfKZHgrEQveH1meKTA32B3ulsRrSa7Ohh/8RCOthSumCULBU4FHEOhgUXmUqH3+VLkVoNJJYIM0RGmewuCVxVPTaM416m4g3iLFSj1jtLyFmCNq15HdIHZacZ+0wS4FkJCuHPfmIECbkSGZHMvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJbLflT1H1pA49mG1130YzMZbQNUbdmlmar74HDj+Ys=;
 b=OjMzov9M1wNZC47i8orwAz6PTWeh9RzbK2hffcz0QA5YRl97e0HtLvo/iL/bzL3NTv+luGtYPp5HTzea6BtfgSQovHIpXAbPdl6nxvREqd1DnbtQU8yDhwFXYEBuU4gfrHJgvTXlx1kfPIiNsDGL4sSlWlHj7bHyP0RH+Zb+QiPQo6641bSpIETqBzYW2dPpCT4kZL8qU1RigB+DRau6FsRxwE8/hgGYtCR2relOf4xSiuvCHBHgXDodxIJHyBMEWoQHaIQfky5ridoh2gejnUR81O4KbNeLzwJToMED6krH62XkWuw2jTBdA1ReuQm0T/eaXdG/OCSfXSwyD7MAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJbLflT1H1pA49mG1130YzMZbQNUbdmlmar74HDj+Ys=;
 b=sRVV08NWFxQyR0irxaRd61ZmPV5GA0FYOpu+7ryfzgpW+YMo/DIyWMOcmkUkCtzAESuGohSfq/NDdJjIWkxMZIGR5bldpfkPFdNlFIvpEIy6h8gQypFG0ft+pUEUEk35NZCkQHK1jsfB148iRQz4dtCV3PtV6vaP48EDuKkZ1os=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <278f711d-7c61-4a47-868e-ab05b9426e40@citrix.com>
Date: Wed, 25 Feb 2026 12:14:49 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH 09/12] x86/shadow: Rework write_atomic() call in
 shadow_write_entries()
To: Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-10-andrew.cooper3@citrix.com>
 <0148ea9f-6486-44a1-b4dd-47af7c978351@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0148ea9f-6486-44a1-b4dd-47af7c978351@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0189.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB8382:EE_
X-MS-Office365-Filtering-Correlation-Id: 319cd410-9cf5-429d-4528-08de74677b25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	GkSNnS5ntkTDHooS2jEb0tKpPsmW5ZJtqcgFmU0i9rCuxfGg6nQ+hGZw/3xxyJzklg8Ai/qvzD1KMdMsgo++lxsuBrioLjc1D57oL/aO4gO7KNgCZGEIJgDSzilybYeHV8vaJy5YF1EdFd/tyhYy2YcRty801Pg/2/Em1CEdG2qXPuKZ3/4zcveDoJlNIiNrlu16NCAEpCZCxXvPRwAyJXEHbQ5lqEcj9XctxoQw1C7Rty/wMwnNl/p1wHrnOcRYi4P2syoVtsgmQ77b0+jW3DLR44BvPGHZBYM4lCH/d4O1wxZRIHybJsCPoiF57ftfNdEzFxOn31I3zWSIsGSgzx4Yun/yYvE8vcqD5V3pa40IRQw/xLghwemVf2foPYDzFSbiMD7zzJ1kGAK6ny7qEhEfmoiDAcfok+nOX7yWThslJtYJskuOwr34jW9VLUDFhMMtQXf8ac+yDZ7JepsGlKGE+hOUkCwXDO12Ey6nklVFYu6FlolXdOCvL5Ffi2Y32IWRkoRO7ZQ++TSARoKlBglXt4zkLX+NZ1J8E8Uy3m/GiMiI4g3adSJUVoKnp1VkwLmNqocMcMPBvWjEwIRAyk8RMQuoTWGWoNIXu4oQ7PnBVkF9P8GfGwYyzO1TlkGXprQzA+uPNCD6nN5se+wV8H0n5BxaNOFjVMtH9WD64FhsGHUxl10DsXp3YMpSxLqvPLX2HyV2O3UvhVsxVJOI1lGoikJvapRRTes9LRwKrFk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFlHRkpUNnRZRllRMHJQSUF6MHNaU21qMURoMzFEd3pHSnU0alRoNjBGU2J3?=
 =?utf-8?B?RitobkQvM0Qrb3JDQkxKNjRpTFBrV0U2UStZN2luQUo0dmtPZisxSGNINjdX?=
 =?utf-8?B?TU4vSVlMZHBGdGtJMWYzTnJIN3M3UGlWWXljU25IcGdYK3NmRzJSQ1phTThU?=
 =?utf-8?B?bkFQbGpNWGxvRzJYQzBRVENFRUlUekVmZzloWkYvU2IwN0VvNDFVbzFqZGF6?=
 =?utf-8?B?QkFhV21nTkw1bHJMOVpkWnprSG45cEU3Q2RkQy9ZcTF6Q0dyZlpLelpOUGRO?=
 =?utf-8?B?UlBDQVR6Y1ZuaTJSMEdBZnBadjFGQTc1SFBzSGNtdEtmd0h2QlpJeXNjc0U1?=
 =?utf-8?B?Q2dUeGFzVFRkUDZwV0FzSEpPNzlKUTArWDdEU0daZEtZaFZOeElXcWdHL0dn?=
 =?utf-8?B?emk5NVMvTHlCbmpPSVQ3R0lvTXZ0TmRSOVJMRDlYWEVJOEd0cWI2eWxiTGZv?=
 =?utf-8?B?STI5NXJlbUFyWXAzTU9VOWxEc1RIUWhUZUc0dkUxQkkrVGhhOU1pNTYzcVNM?=
 =?utf-8?B?TCtBUHBFUTdjR1liNjRJT2ZzaWFkRFAwUVJ3NmJkbmJWUW1zcUhPYVRydHcr?=
 =?utf-8?B?WHNOclEyVzVDS2srSkhFOEIxRnR5TmVsb0JZcHdFMWdRWmRKRC9PeW9sejFk?=
 =?utf-8?B?ZG1GNmJ4Skt6VTMybVRydzArZVR0MXQ0TTlWSHhJRHcvWGJVOFNDV21hMTRM?=
 =?utf-8?B?NlNKYjlkRkh5MWNJNjFpRk5FWERXekdOcDJCMHlnbkp4UlUrWDRqblRHaktz?=
 =?utf-8?B?aGZORHN0QkYxKzdTdlBrS1V4TFJwNytmY2x2QkovT0FrMTNjVnRvRVNhRmJR?=
 =?utf-8?B?WDZ0RDR2NWJYUlhjQXoxVTllNDVjOTFDNk0xNUowRUh3R3Jmak9sYlZPSDgw?=
 =?utf-8?B?M2NybVNkTkMyMzBEUkgzTXBrZm43RlNhTi9kM0FHQmpaeC9rL1ZPdEVMa3F4?=
 =?utf-8?B?ZTF4Nk4rYTNkUFZ2VEFMbjhvQ3ArMGpmMFMwTlVnUXY2WlY0QmozempxUlNN?=
 =?utf-8?B?RitNNjc4ZFN2TE5OTzhDZC9tNExaYkNCWkNoRjlaNWwwblh0QkFpTEhSdmtq?=
 =?utf-8?B?YUtXd3pBT3NoR2d0NXQ0MEE4Z2s3NDU5MlJvYWN2WXFLQ3A5L3Y2ZkFWN3k1?=
 =?utf-8?B?Z1QwNWlDYVNJUFJnRkhpTkM0eDUzTXFXRzdnTUV5a01nU0JlamtqLys3QlE3?=
 =?utf-8?B?NDJnTkRKSW1QeEQxZW5xVm9LbjE2NXN3ZTQ5aWRaYVpsVU9WQ05FZG0vMXVG?=
 =?utf-8?B?TlM0V2tSWXhGbEd5K0ppRWMwdU5zN2tCOXVac3hwL21HQmNsTFBXdHFWK2sz?=
 =?utf-8?B?THhodzAxNEhxcS9lckltRzdkM2VTazlZeDIyWkpzNEhVSUFpaHRwUldMMmdj?=
 =?utf-8?B?dkhlUlR2dU42dm8wU3NGdXB5YnF1YzZXblVsSm5CREVKN0Flek9jSlk3VWhV?=
 =?utf-8?B?RnRUVTVQUEM3N094blJYanFib2RNZlJnZEVSWnRacUdrc3B0WjJaN3B3T1lt?=
 =?utf-8?B?RUJmOUxXOGhMU0J4eXRJelpxbHMxNEQ1bEpmQTUxeTRmTTdyaWNINDVpandR?=
 =?utf-8?B?NmZQVXhnYTUvZE9nRi9OSmQxSTAxR2JiTnByWjlSRmJ3aTNUdGhNdnJBNDIv?=
 =?utf-8?B?MDZMM0VRVzg4YUo2eVg1ZkE2cGJGTVl2UFdVZzJFdzZvZjJMdlo1ek5MelFO?=
 =?utf-8?B?ZTlqNjgyV3pFNUJnQnFxYkErWGhEQ2xsNmZhSnpiWVZOL3FJT24vMytZUUxT?=
 =?utf-8?B?VXdkU2xoa0w1UkhoSXMxaDY4NllQd3kvZFh6TlZoakJ6UFU3RlpKYzIrVGpG?=
 =?utf-8?B?dWxTNHRjL2VmK0pZS0lLbUtUbTZ5ZlMxSUFBNGJZQjJQZHdUSEllMWJVcVdJ?=
 =?utf-8?B?UlJRd3grU0srR2JuUUhXOFNzNkIyQ1J3VHFFeU53bWNVbkZMWkkwSlIyUXVC?=
 =?utf-8?B?Y0lpVWVWM1JmL3VTM1R1bWV3UVk3NjR0c3JmVmQrRHNPWHBpT2RibnUrTHZY?=
 =?utf-8?B?YTE2Rnk5Rm9TLzAyRXBHMFBteGNWVUVRa3ZzdGJMeFk3c1I1WEhteUJjSnNz?=
 =?utf-8?B?bEhKVGFBYjVQREZxQ0JISGdTUXdSeVVUMWFRa2Z5eUtERTFjQmZXK2xTeU1z?=
 =?utf-8?B?b0t1R3M2c2c4ejN3MXhBbHg3TU1qWEl5MzVZZG5Zay9ldy9SN3RGSldmQ2Qw?=
 =?utf-8?B?U3I2UjZCeDZMeVV3aU11U2NPMVB0WUhJNExwMVFwL3JWN3ZOdVpGWitJTTND?=
 =?utf-8?B?S0M0dys1dll1bjllbEZhSUJmamFnaXZ2QVkweW9Oa1h1d1hkaHl6c1l3UkI0?=
 =?utf-8?B?K3JBN3IwT0JwMzU4VndOb05tanp2RUlyeGRIOGdjbXhHSnRucE10RTg0TlJG?=
 =?utf-8?Q?Hv7v+lYfLIaQP7J0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 319cd410-9cf5-429d-4528-08de74677b25
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 12:14:53.0571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqnhTgefO+Tq6AojVryEyZPDKn/VedgwnO1uWgOhvMqyVhZP4bCnZw5rGm17vPK7hrokrMwWopD0H0ty9JbVpNt2iNa18DjALE+yTndcFQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8382
X-Rspamd-Server: lfdr
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,m:roberto.bagnara@bugseng.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C31BA197222
X-Rspamd-Action: no action

On 23/02/2026 7:26 am, Roberto Bagnara wrote:
> On 20/02/26 22:46, Andrew Cooper wrote:
>> Eclair complains of a side effect in a sizeof() expression (R13.6).
>
> I disagree with comments of the form "Eclair complains"

We use the same phrasing with other tools too, but I can change it to
"reports" which I suppose is a more neutral term.

>
> Note that in recent versions of MISRA C that rule is no longer
> mandatory.  More generally, note also that, IMHO, switching to
> a more modern version of MISRA C would simplify compliance.

Ok.  Making things simpler for compliance sounds like a good thing. 
What would this entail?

Presumably we've got to adapt to all changes in this newer revision of
MISRA C.

~Andrew

