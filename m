Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBJcF53Eu2n1ngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:40:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73B02C8D7D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:40:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256879.1551355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39rk-0004TC-3c; Thu, 19 Mar 2026 09:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256879.1551355; Thu, 19 Mar 2026 09:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39rk-0004RS-0K; Thu, 19 Mar 2026 09:40:32 +0000
Received: by outflank-mailman (input) for mailman id 1256879;
 Thu, 19 Mar 2026 09:40:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAdu=BT=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w39ri-0004Qs-CW
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 09:40:30 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7d9ecbf-2377-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 10:40:25 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA1PR03MB6321.namprd03.prod.outlook.com (2603:10b6:806:1b4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 09:40:15 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 09:40:16 +0000
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
X-Inumbo-ID: a7d9ecbf-2377-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3WmXYXzRFldYY7SaXCtWvVXeM+MpyTeQYLwtbHHgLt6SpRjweSZutuuaT16tirQQYrK9fKPTVvsFWL4fAysyLhWTFttBm3Kk6atN6yKhWdkLBcjy8e1psUxAIuE8x5amtBMHzJdWkLNB279mSQ1+SKOjulGFkz37UUb7LCsJDlrnBdsusn6JVJ/vlAhPeVPlDSKW8bYMfSmqZNBfGNp/mkaJSV8zMpq9YLFg6NxoZt6upVg5HIC6zoNE4iMP5yAzOKcFUcPYs62Pz0UqgvlV+GkMRX0Uni24nXbII/U5TUCKwghceAWtMaPzwTpkedN3H+GGCgMiU/D2NL62utyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TjSp0R+1uGwYCPITivKPWItXdn3pkd514fk+WaY+iI=;
 b=jEad4CtoQ0aq3RctmxiyHlwva1t1xEBBziTKb6HWRiptajzWHXMxL1tvB4l28X4l8uZMEh7VeaJ5PQZHiNYHXUofRS3utOZ7D+5QakPVzY/COLNQfcYX3ehVwdiS3vmHYwtlQcHHMI9ULd2Z7vv10CHI4dKaEJKvFyBJRZS8bug7++gZheqJmHCV4JXvtrL4VlueiLLUPZIgcahfQlvFt4boXLwWoKb0Y2Y9BMzpfaJrKyokpGzao03ItHlLZBifYpF1dmpYD/Q8VLb4vgjM6Gs/jYr7ZGX6YzDHiwMj8iQgqtpOMjXX/Ho8SfL7ENo4/ItJmlvFrU/+7cUsn57rPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TjSp0R+1uGwYCPITivKPWItXdn3pkd514fk+WaY+iI=;
 b=xlkTYqBBbNcEO9Jr91/uD3uy7ElSkl8LffmqOXDh0xDXFgZgDIdqGmJLtFkhcTK4g1nXWvgI0kJMhiGwuyvFJ67/05n2rC5FwZtok7daK321Ih+2Pk3Cqkjpe3I/VK9UaOxABXypAernP/eV/0npGN1hc2Vnw14mCoIk5j1qvsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fe7df584-31b4-464c-adcb-dd90c0a4f47e@citrix.com>
Date: Thu, 19 Mar 2026 09:40:12 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/ucode: Exclude Zen6 from entrysign mitigations
To: Jan Beulich <jbeulich@suse.com>
References: <20260316120605.661823-1-andrew.cooper3@citrix.com>
 <03b9bdde-ad5f-40e7-afe0-107a471fc0a2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <03b9bdde-ad5f-40e7-afe0-107a471fc0a2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0489.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3dc::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA1PR03MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: a5033903-203b-47fc-31c3-08de859b8680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	OKcx4TwALgZgKNU1tCP1AGFVMcN11459Ht9mWdrvGaIEv8c4So+4lo5WrRKoR+QmqSaUJ82p5bGU2QBIOXD2gNFA+qhcGrApXZmCszCvlHYix88gypV2AhYbjQOkavn7PC7Nvh8XKckw35IqaQAtMhC2Fpl3nh/TJFw3W89p2h0y0nQu+Fq2adLAuQ8kGQziCEOCQBw2SPuevqE5imicYz+Ns27lFSF/Hxg8asbk4wT1033CA96+k0AxfoQqiJYkFtpO1rIvrozm3mY2YsTicZDf0hlp1f5wYH21Rfv4K93hTwg3KnW1yYfnwggN65+rExLqQB6+25fwiC9yAQFhoKWGzi1a7yEzw075HXeHcJhholDujOY7GwUtlTPPFf9bNi8Q+cnLmmf/4Hz+N5yg+azXeRqPBYqVT1fxIf/f94twU9Bx9rNL+bQceV5nAs3jcHeQkSJMdw+nxvvrAY+cs3ZwCotlFYZIV8nalabIvYAI4Cwh2EHRhVsDz7e5e8qMR3gLYI2ejYGKTh7BjgdjjxWEDvzUHzwTi0E27y9Ec1lO04oPTfcjQHNMGuMGzpve1ZiEs2DFYmD2zFzlAgmygRUyLZmbNPh8LqgW0xeo6raL+5U1OhrY6Qdcb/niCu8crTWcaAkMcwalxvqIx3kYKUgaxnM6WQPaPgFFLLDad36QUjCM2E5PA6ctAUGMLMYbOxgisuTLoTCT3OTo9ATmbjwrX8vnhwgDOxckYaepgFI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djJuZVQ1d01QaFI1YWdNaUpsNkM5VUFoZTVzYkdVdW1MaDcyVWRUeER5aFRW?=
 =?utf-8?B?ckhMUmZEaG5va1VLWGpscGlxWXgwVURKQlVUZlpyQktNbTRxQWJpVUp3dEdr?=
 =?utf-8?B?dk04eTBGYjlkU2RmSFVlT2NjdGhQaFNxUXJqSXNqVzZzaEI3OHZtRXNQZkF5?=
 =?utf-8?B?YlBPdlVQT29ld3Uwbm1wekZ2RStOVDFUNUkyRlpPTE5tVnFUR1JQK0NZL0M2?=
 =?utf-8?B?ZzBVMDFmdzNEMk5sbXJjMEs4bjMreXhPLzRNSUVxRUZTUVc1NW5uMzRBMzls?=
 =?utf-8?B?bFlkU3dpV1drZkkva3hKMFlHcStpTFFKVGJPTkVJWVJrRkd3SkZxWUxseEFR?=
 =?utf-8?B?QmQ5QTdTYUx1OXJlV0xpRXk5RDJseU15NDcrM09Bckg1MmxZWWJaUlUzWHVT?=
 =?utf-8?B?UEkvcGQwOFFLeUFYclR3cmhseWNIblZsRG1QZGdTMGpTSGFZRnlQZUs0eEwx?=
 =?utf-8?B?YXhhd0ZTZlV2ZlJXTEtyREtTcUVtSFBIQjdkeWticWRkSC84aTNOaE9Id09X?=
 =?utf-8?B?NVZQbFIwVTltYlNUMmdpMkNGWHVtWkVRNXdsN1JoR1liRisxcVh2UE9VZmpQ?=
 =?utf-8?B?SW5BcjZvaGV0elpXMzhRNEt6OExPc3MrOWMzek1vL3Q1ZjVSanMvRWxBVS9a?=
 =?utf-8?B?YVlUWGNLNlVETU1ML3ZmWE5DQ3NOUGJaMFRTV2grZ0g2REtJV2pxSFQrODZV?=
 =?utf-8?B?TjlVOFBOaWZVU1ZCSk8xZUJYSTNxaUxVelMvL2FML1Z6VVhuaXp1OStGYjBD?=
 =?utf-8?B?VVZUR0JGU0s0VUNBT1R3L0Z3YTdIN0grdkN6ZzN6TkFJN3M1cHkrdWY0bFRz?=
 =?utf-8?B?d0R4MGFmOEVMbkI2amZMU2RMUVpMNE85TjlqWkFocGpuZ29VRG54ZVdDSFNK?=
 =?utf-8?B?YWk5VGJES3FFMUhOM1hHVklTR0hHSnROaFBSZjhtWEh4MEVEY1p6L0E5ZzFS?=
 =?utf-8?B?V2R1dnFUd1lRSmcrZWl6d1E1N1Fnc1Q2YnR0ek5NU25xOVZya1Byc0w0MVBT?=
 =?utf-8?B?TnVlUmVNM29pNE9XaVJnQThsT01tclFjc3h1UWxIQ1VyZlU3NUJWQnhIWG93?=
 =?utf-8?B?Y0l0QWhrWFpLZUlUSHJ3S0ZoZXVhT2NCV3lkNldOcWN6UnRueXlOSXN0MGdO?=
 =?utf-8?B?SzhJbS8zdWRKYVZZM3dKSFlURUE4WkNlejhwdjRuV1BNaUFUNzZqQkMzZWhm?=
 =?utf-8?B?S1p3azZtU3YvUGpuNFcvQVYzTmY5V1pPV2kyS3ZId2thOE1QdkIybHJtTXdB?=
 =?utf-8?B?KzVSaG1kak1ra2JldVNyeHVPTDhDbTliWlF1bmp6RHRVaWZOMkE1K0drMFZq?=
 =?utf-8?B?U29tWkI3R2JGUlJieldWdjV4Yk9UeFlYSUJScnE0VFZXWDV2S1FBRlViQ3cr?=
 =?utf-8?B?ZElweE96LytFdTlFMDFNcmtoYkt1VTFmYVFTSG1aZzB4K3VSTWwvUkVhVEJM?=
 =?utf-8?B?OUxSc1NHWXF1dWN0R1U3d3Y4cHlvd3pJQUdZNHVFTktMVm1WdUwrNGowY0Ez?=
 =?utf-8?B?WlZ4NFJ1TXZJczRySTFSRWcwb0VIWUdnc3VrdmpvSUxKREVnZUU5UTU1dFFl?=
 =?utf-8?B?U0IxOTJYdGhMQlc1R0tEN203VDNScjhBbDE4b2tqdXVGb2JObU4xK1RDMUFy?=
 =?utf-8?B?am1yWXdqVUhzcTl6aGZNNnJqRndhWXdNbDNHM0p5TWpPVTlMRXd5b2RjRDVY?=
 =?utf-8?B?TXZoM2RTOFVndVN2SWc2M1NvUlhZa3VKbVVyRmpIaTd1Mk9NYlZVbTY2ampV?=
 =?utf-8?B?RVEzNExLbWJHQ0NyS05HMXdXOGcvUUZ3Y0FwaHFFNVd3aTFyaGU3ZjFVejJW?=
 =?utf-8?B?ZHprRWNtVzU1M2p5L0RjZ1RPbFM0Mm5lTmxWam9SSU1PWFZQZ0VuWHFhaG1E?=
 =?utf-8?B?cnRneG00ZVMvcUNiNkpJRXNlWkZNVHZLVUxWcTZmVFZTTGVJMGNBRmNqN1Zy?=
 =?utf-8?B?Skt6YWtnbnViS0MwbElZaCt1Wm4zc1NUZzZINVArRkxvZkdHNkVVRzcyN2xY?=
 =?utf-8?B?cDhQby9qK2c4bnUyUFhBamdKNjBCK1RjcGRtUnBMVFVJb3lvUjNYZFJ5cE1W?=
 =?utf-8?B?aDFURmtNNENQMVUxK09BWnFScTNPbm1ob1hVWGNHNmpZanRTVnNkYnhVald3?=
 =?utf-8?B?MDVmNWphOW1iem0xeS95bXFNTUUweFBvZGt3ZVBFNW0vWTBmQnMxU0I4Z25s?=
 =?utf-8?B?a1cydTd6NWhtbDNhSHNxbFJoTVkzZmtrOHJRcDR6Ry9uYkFEOHJ1bS9aVFAx?=
 =?utf-8?B?YXFYckNvNHZIK1phWElYQ21xbktjOXJzNURqQVlERXpod25yRHB5QXVKcWJa?=
 =?utf-8?B?OWp3d1MxQU52OVl4VnVSUDYzaTErMXJqZEUvbEpzSmRVRGlPbm5xdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5033903-203b-47fc-31c3-08de859b8680
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:40:16.2761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mV+wz+IyX/2YS7dtzbA0FMQu9+kBHQqd7z+6PyChcRRnQmuXXU+q95mxvKqw6lb659xJ2+FStvlfgTH5p8HfDDDGhFxLWUcCj3TLqB6MWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6321
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B73B02C8D7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 9:38 am, Jan Beulich wrote:
> On 16.03.2026 13:06, Andrew Cooper wrote:
>> Family 0x1a covers both Zen5 and Zen6, but the latter is not believed to be
>> vulnerable to entrysign.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> This does want backporting, but it depends on 8e4775d118c327 which collects
>> leaf 7a1 early enough to be used in this way.  So, it should hold off for the
>> moment until the FRED backports are finalised.
> Okay.
>
>> --- a/xen/arch/x86/include/asm/amd.h
>> +++ b/xen/arch/x86/include/asm/amd.h
>> @@ -59,6 +59,8 @@
>>   * For Zen3 and Zen4 (Fam19h) the heuristic is the presence of AutoIBRS, as
>>   * it's Zen4-specific.
>>   *
>> + * For Zen5 and Zen6 (Fam1ah) the heuristic is the presence of FRED.
>> + *
>>   * The caller is required to perform the appropriate vendor/family checks
>>   * first.
>>   */
>> @@ -66,6 +68,8 @@
>>  #define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
>>  #define is_zen3_uarch() (!boot_cpu_has(X86_FEATURE_AUTO_IBRS))
>>  #define is_zen4_uarch()   boot_cpu_has(X86_FEATURE_AUTO_IBRS)
>> +#define is_zen5_uarch() (!boot_cpu_has(X86_FEATURE_FRED))
>> +#define is_zen6_uarch()   boot_cpu_has(X86_FEATURE_FRED)
> A more general remark here: This, I think, is one of the (rare) cases where
> we may want to use the raw CPU policy, for the distinction to remain
> unaffected by "cpuid=" command line options. Thoughts?

Yes, that's the plan, but raw is still collected too late right now. 
This is on the todo list.

~Andrew

