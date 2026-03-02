Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAJZGsmtpWmpDgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:33:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A167B1DBE7B
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244343.1543783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5G8-0003BP-EU; Mon, 02 Mar 2026 15:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244343.1543783; Mon, 02 Mar 2026 15:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5G8-00038v-BM; Mon, 02 Mar 2026 15:32:36 +0000
Received: by outflank-mailman (input) for mailman id 1244343;
 Mon, 02 Mar 2026 15:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OlTG=BC=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vx5G7-00038p-3u
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:32:35 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 053da25b-164d-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 16:32:29 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM4PR03MB6910.namprd03.prod.outlook.com (2603:10b6:8:45::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.21; Mon, 2 Mar 2026 15:32:23 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 15:32:22 +0000
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
X-Inumbo-ID: 053da25b-164d-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygBhNx6CZ0JUoXJHLOOj5oSdWIskgbL2/921NrTywXf28Jw5QO25znUzUJ8b5nj4OsfNAmIM6MzQ2myA83Jq5iKhfQPIRqvo6teA1LdWJcmWV+16h/0veX4WW2A5UEkCAzLNziyiEzTBoBTnrD/Ew6iN41uXwqbp2x+ssl5IumKfsPYdDvKI1I6KOpVR9lB5evCMKjVZqJK/8w18HGA8lSyxnLEJes8YZ9iMiZHLdda6LIKCwUnFzMT2dmpFZelosqdUxshHZaMfhm6Fj/zdfDE2hjMxfEQlyyoaSPHu+GhHwlXHK5euPlp/R5ReOk4Z41Ma+Syu5RCMQtTxTRGYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxurID/PMQliVdMIOqTPv+iWoH0RGormiilKlBtxqpo=;
 b=ss3N2kApwRRv9mBiOQ966o0zTdNDv2sh1KWXAgDbWUEEh5J5i8z0UNo6VwQZjMC2Q+84HVdvFhbdJXYDYKxLDoFpTPALkCCnCzGSm2Vh3AaFazzMiB5Whl81Wyuwn2N/2p6brnSUBST3dE7/FiJDZzzHAJznFVpx6BsWVtkRNmQnz2wxnPI1ClG266b0N8cn+aGmu/ubX4e4PdcMkkys/6/xKdGIABslaKNoo6dMawOv203rbIYAlOncj4F+6J7h3zA6G3eC7SFT7gVDG2kYMOXaI5wzxu5vKLkxy5Qp2Mdf99S6QKBpN0FzloT7FUjzrqeRAIkupxAImvhN4T1dNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxurID/PMQliVdMIOqTPv+iWoH0RGormiilKlBtxqpo=;
 b=LCMjJa7ILc2+AJnMD5jzW4dse+dppLuEsXgWBAUZvc54cbpPKylqLBUJ3sC1BHNh6zIerXMG6qz0jVrpwnXUz09cJb9QwF9dpQaCT2wC72DLu+NnT9EXjPqmGy7q/YS0ZZ11HiaD93fvGaw7V91N+wvySOXo3/fqdWL2aNdSpTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d4708f47-836c-466c-93d9-2e7f4ae22608@citrix.com>
Date: Mon, 2 Mar 2026 15:32:19 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 05/14] x86/traps: Move traps_init() earlier on boot
To: Jan Beulich <jbeulich@suse.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-6-andrew.cooper3@citrix.com>
 <b54f129c-71dd-45e9-8f31-4df322e30af2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b54f129c-71dd-45e9-8f31-4df322e30af2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM4PR03MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 8837b078-b654-4121-76e8-08de7870e618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	WQx+d1V6XwWtur+xZY5/vaJ4+iOIH/c2DB4Vs6Uzv1J5T8CG+MrJpli1DKpqrvRM9JY82XtTv9OBF6uyvHZZ+Gl+pMjdJNrfW3DvVRs5ksM7uVlnXACGZxpk4oBamwYlrD1oVehqTadrQwhxxEmrRNV898NvoRaLGcJpFHR9QF7V3BlSxYt3qi1nq2C3c7XmygAIVYhsP62VX5IA/q+G4CF32QQFdMi9q6EP+LYnQLPvpSBackOW2N5friyCHXIvyFopDXVTIFcAC8VNeCI+8gNBaQyXJQ6KsZTivVpEJLLpCUjOHX1MGET8EOvnrFb8kpaLACx/QwRjneNHqkhpLJv0mz9aT6d4yaw8f/56Nw+3UAxmVT6fmk1kz/ZzU/bdpaPIHTxchx5aFX47/Vx2e7kvXUxr67yKrMt72yfAZ5GaX4MwtHLW2uN25KgTjTbuWtcEXbb0oDhjHhbBc/o0wXaQV8rdhazUCHedZsQyAO8S16wHsZMrME4KeGpz9pjN1T9qrbpoaXtN/khGf/kWMFTb70FbLIj0XUhOnDHo6qjA0Mt+Wf8QOjgPtHzFhAY8MQh0e4jUujEwcgWKEkzrfLhvRI4kKMTegJQuJEVPMO89E/60HW4vIV9jnDoBtwvrJe62OPofTGmVmiiZ3fc8sDs5lM2y+RD/Lk8y5Fr8MuhQhC77P56JwD8btjfQODVj2SP7e/MZtYtAHiZPr7o+wDlxDVo4dX7OIOzxL1wrgIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE9DbDVtM0tObHJMRUtEaUpNdXRqeHJseUZ4WE0zL3FQNGtJL2tjamtjWG82?=
 =?utf-8?B?MExXTXl1Q0ZKaWJ6VXIxbVdDcHdvUzlFdzMvVkFlYzRVYnBwa3JWZm9pRFdZ?=
 =?utf-8?B?a2JLUWVTRkVUZG9rVytSajNwRmJTekRhbWVnazRiQTg5Yjh1L3U0MllPejdm?=
 =?utf-8?B?eFIwNTRZVkl6S3Q2a0cySkMxSVg4OWQxTDEzQlVRR3Y1dzNTa1NncFdFdnJR?=
 =?utf-8?B?M21hamc2dGMwVXp2S2w1YUt5SGZVUnBpQ21DWGQyd21PYWowekhPK2ZyOE5C?=
 =?utf-8?B?Nkl5ZFNjQkVLenU0ZjNBRmR0N2ZhQ0w3SW5hVXp6b25rdjNEdzJPamltVHhD?=
 =?utf-8?B?ZHFFdDVISE5OSE0wcXpYWDNaOHFML05Pd0sxcVdnOHdrSjZzaE1MYVFrekFt?=
 =?utf-8?B?ajhvc3lMYlZKREF2TzNJbHNoL1pMZEZ5L0lSV2tBWm8rb3FQUVR4VkluU0NT?=
 =?utf-8?B?QmprR0EwQW43Qll3TGg1b2ZSaEp1RW5Pdk1WeFlHSTlyS1RUOFJxRm5aTHlR?=
 =?utf-8?B?SXpHT2krYUxOWUN4QVlzK0FoNjl4K0lCVUlkdXRTV0RyN3dLbEU4eHgrS3ZD?=
 =?utf-8?B?Y2k4bksvQmxJSmR4V2U5bGd4QU56VXEwYTQvSGUxQ3JxTFZQV1BpaTZhSmdE?=
 =?utf-8?B?SGNvQnU5b1V3c1k2VmxuZWplV3Zsb21yTnZvUW9TNkpJdGNuWE02TkxpUlBz?=
 =?utf-8?B?VzVwM0RibjRLcWEyQURmUW4raGE4aGJ5WlVlNGpIeWgzckw4MUJOeWQwSlQx?=
 =?utf-8?B?TnNOSEsvd2pzQm1iZFpGeTQ5WjBCTVhlcVRvLzlyOXhqZkNtNTcwM1hBTWdH?=
 =?utf-8?B?MlA5T01rQ3o3NmlrR1FZb1dVVGlJSGRMa0hSNFc1TVExNm5pdlNlUGxCcm55?=
 =?utf-8?B?N1ZTT1lUWUFjNklHQ1ZZYUhpMTIrekdJaFlKZk1nLyt6TWFrenVtR1ZnSWl2?=
 =?utf-8?B?cEZ1RXl3c1B2bUhYZEl3TXNDMTd2R3ZOTmsxaDluN2VpbDNqRVNEbXhIM3dS?=
 =?utf-8?B?UTluOGZJVTRlZDdNOURyL2dZbDVOZWZBSFgwUS9HN3JLbTEyYWNoN1l0UTVQ?=
 =?utf-8?B?NnpGc3VYYnVxMjlCdkdBSWw2clIvNjUrSGgyUXlxTGRWYVpvMmZlWUlUZHFU?=
 =?utf-8?B?SmRQS0pUSmxxclltMzZocHJnZnNIK1dQcEllM05EdGkzQkFxdkRwQ0FkYkJz?=
 =?utf-8?B?N3dYczJ4R1BZV2JvQ25sakU0UzZ3OTdCdHB0dE1Xa3MxSGdlQUZPSi9TNUJi?=
 =?utf-8?B?VlNRQkY0amZ5dWpNbWErampaQ2VnZFdZK0xJMlBteHBhenh4RGszWkUybDhu?=
 =?utf-8?B?SFRPWTNhQWlaNkhqRmNlY1IzWU52cXZwbXZ1NjM3TlU3SldTNzlBazNWaGFC?=
 =?utf-8?B?N3BYQU5XZWNBajlrcWlWQUNzdlB5b2orZE43aEI4VkM0T1hsVlcrazRVbzJ0?=
 =?utf-8?B?cllJcU5TK2RWeUdvbUFkL29VM2FtWFcwT2UrQ1BoTHJLczBVR3BoUTNlZ0pv?=
 =?utf-8?B?d2NLKzhsSmhhbjVOMnViQlR1UTZJV0gzcGhWNVFSOUVmb0Q1ZnZNbUUvMkNn?=
 =?utf-8?B?VStiem1CNGl4c05ta29QeEJWQm1DY1JnNW0vNWR3cTVFc05xZWhFaXc3eW85?=
 =?utf-8?B?YnNvcElQMHpvUzdDZEZYWFpJKytKNnVjcWpOVnA5bFJwVzg0czJKYWNsbjNv?=
 =?utf-8?B?aTdzN1MrYlZlalhuVHdlODVDNW1ycWNROTJUc2VkV2FvQjJzVDNXTHBQZVFQ?=
 =?utf-8?B?bmtJNk93WGdWU0pTS1I5a2NRMWYwRnhPU2l3ZHVUMkF0bWdVdksxempOdXVV?=
 =?utf-8?B?dHVRbnN3bjNpTUJkT01malpCMlpJUThkSUlkMGZNaHRwS2hwNWZPSk9ncXNF?=
 =?utf-8?B?ZFVPUzBOZ1BNdFVxdkdTeVhqTnlzSlpDWjJiU1FSOUxNODAybDJJZVZKb2xi?=
 =?utf-8?B?eCtOV081SDNMZmFCNEFJQ3IxMVhsNTBnR1kvZEc3YTljc2NMRlhrS1NiZDBG?=
 =?utf-8?B?dU9kRUhOSTdJS1JTTHQxd1RLcUJIZEdqcVE1aFZZWGk5ZTk4cDBXTkdhZkNW?=
 =?utf-8?B?Z0J0Tm95R0Jtckw2VkhJa0FLSjgwL3lpRHlmbmZrWWM5MDdzOE9xQStGb1R5?=
 =?utf-8?B?NmYvMVBBYlRtdktESkRsV2tWWk0yeWhtelhqTU1Od0Q5M01SYU9mWG5pSzdY?=
 =?utf-8?B?NEJzRHpNbWRLSnp2YkpKMlFWeENuN3VOR2FHb3hqNjhUeEs1RmcxanlRbHA3?=
 =?utf-8?B?cWVaaUVLbTB0dWFlU0Z6cTUxNmxFQlJpQjJoRTRQMzhGT3VjaGpkSGlCbFNB?=
 =?utf-8?B?dnZRNjVJa2xBbnpWZHVFUU1kU3Q3SG9JdUFUQ2hJOTlFbm9RMlRaQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8837b078-b654-4121-76e8-08de7870e618
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:32:22.6725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsRFWt1ww3ZVKhB/kRsRJW+dkYbAEe1S6jrAnw5f89J8/sjsbYdrBvqqcOyuB1bgUVuXB34snxKJ01JZ0L9jWqwXwm9++UTsJ+HHOwQPIhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6910
X-Rspamd-Queue-Id: A167B1DBE7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Action: no action

On 02/03/2026 11:39 am, Jan Beulich wrote:
> On 28.02.2026 00:16, Andrew Cooper wrote:
>> We wish to make use of opt_fred earlier on boot, which involves moving
>> traps_init() earlier, but this comes with several ordering complications.
>>
>> The feature word containing FRED needs collecting in early_cpu_init(), and
>> legacy_syscall_init() cannot be called that early because it relies on the
>> stubs being allocated, yet must be called ahead of cpu_init() so the SYSCALL
>> linkage MSRs are set up before being cached.
>>
>> Delaying legacy_syscall_init() is easy enough based on a system_state check.
>> Reuse bsp_traps_reinit() to cause a call to legacy_syscall_init() to occur at
>> the same point as previously.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> Irrespective ...
>
>> @@ -359,7 +363,13 @@ void __init bsp_traps_reinit(void)
>>   */
>>  void percpu_traps_init(void)
>>  {
>> -    legacy_syscall_init();
>> +    /*
>> +     * Skip legacy_syscall_init() at early boot.  It requires the stubs being
>> +     * allocated, limiting the placement of the traps_init() call, and gets
>> +     * re-done anyway by bsp_traps_reinit().
>> +     */
>> +    if ( system_state > SYS_STATE_early_boot )
>> +        legacy_syscall_init();
> ... I wonder if simply pulling this out of this function wouldn't be slightly
> neater. To me at least, syscall/sysenter are only a remote from of "trap".

I'm not a massive fan of how we (well, Linux) uses "traps" when it's
different from x86 term of the same name.

But, setting up the syscall stub has always been part of traps_init(),
and for FRED it's combined.


As noted, this changes again as FRED gets plumbed in, so really you need
to look at patch 8.  I'm not a massive fan of how it's ended up, but I
can't think of anything simpler.

~Andrew

