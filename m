Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO4AIDIhwWmTQwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:17:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A582F10D5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:17:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259212.1552519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dHA-0007d2-Dj; Mon, 23 Mar 2026 11:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259212.1552519; Mon, 23 Mar 2026 11:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dHA-0007aT-AJ; Mon, 23 Mar 2026 11:16:52 +0000
Received: by outflank-mailman (input) for mailman id 1259212;
 Mon, 23 Mar 2026 11:16:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIW0=BX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1w4dH9-0007aM-7g
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 11:16:51 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c82c1006-26a9-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 12:16:48 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB6995.namprd03.prod.outlook.com (2603:10b6:510:12f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 11:16:42 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 11:16:26 +0000
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
X-Inumbo-ID: c82c1006-26a9-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTsgLp5VlSz8eHreozwGWQSNbBe+MbIKFTF3VsdbcsiLQ8PIZHfxaPedoF31+Oi+NzI8Pr8z3LQOMWQKQm/JYu3pkIUA/aTSm0ihc4+yt6OmMLxLslaCKJWOm1s1rntKbKVBfvYY0rG68nbodpNe/XCvtX7i37b+CljjfkacK+IoHxyHT7NGbNXp15KU1bF9S7nWMAh00qxISPGu7AP/sQ/t6UgmhVhWt1JqKQ7TALnCtjaY9XguQ36FEVfzJc+RKES1jQaDYI9Oz9XvJHltieLlKgaqKnnCYhlx8NDiW8BKuXn3fE3DYfjacHz0MTdj3+gAzWdT47rLmWVyiLBiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAUfQ8s+1FGN6f2MApaLd8d/AGOLqbmY+xkVDnQuE4Q=;
 b=G3XVkBiG6aoo2IL0ryfefvgMfDx2FCWKn+24m7wtYY1Mnr5glwv5AR5LojA2TzSNK58jacTCDIS8xCN8wnjExdOMEhE1u/T9rhhWUgdeIlynoH5OHHAaqO7ayyd7gK0vBIFXUR+gufpmF3jLG7wQ3G35S1Qed8zqG4KQ2XKJQa9puXphi6QM5c1zHdqRMJ2ElQhj1BzDoxeB/mew3+WA/3R9usi5WtzFKmuf5Hat5ACCBNhJxNns85rv50zvf3rEnJMTV0pePTOAhG8Jec8mHfSzUVkhi6AXzzAX4AtWk5Olji8pjp5770aXTYQLcCNMKrG0XMi21StY6lJxvGJVYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAUfQ8s+1FGN6f2MApaLd8d/AGOLqbmY+xkVDnQuE4Q=;
 b=CR8tjewR/UUendkEyzEWvPYDPcXyULQLyhcYALJko8zaN/FUO2U2ZTAxSs+qBs9sQ/AGXwNd44Rup+RJ4H39NQ9x+wkyReue9nMznrIJWSnWWkO4LdLPyZjw3EILnDxDX6kHLs1nRKW41GYrryUl3V7kLwEpuvXBzYqHvQtMpYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 Mar 2026 12:16:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/S3: restore MCE (APs) and add MTRR (BSP) init
Message-ID: <acEhF0NnlImMHwiO@macbook.local>
References: <12fbad10-78ad-4679-a1db-3995e34da094@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12fbad10-78ad-4679-a1db-3995e34da094@suse.com>
X-ClientProxiedBy: MR1P264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: f53e2779-4ee6-4faf-7d64-08de88cd9f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|7053199007|18002099003;
X-Microsoft-Antispam-Message-Info:
	U8LfSXpZCKGbWvhPbk+yEl/uM45yRtHlVk/1UCmSEKC0+jGPhBkRspZNynyD8c8N9KipQwHFE9pLhx23+aqj5/SI7eRjWg6tETfxMp/Zvd5BHtKpKsmK/lgZP34dokhQiRtDMErVItOvO7HbmPer59/4Elq5OoSH7BdqgXHPoexhqedFOy20lAnxqmr3aGI8Zo9zMWRMqbP7Czad4AqTFIWOqeGLnGPH20QftrxZvyb/jQ9GkofBISHxwP0a6RDfGkjuEL4X77ys7phn7tJSkBHZgyZ73DPqRvUXkb2OC82F2ow7X2atx09wIRuH7cNG7k/+wL1QqZyNWMqbHXmV/0f8XMg+0DsX5U1TjKfha6R5PC9fnYMX/Htcy6L37tx0O8cmM1QxORfeiANnxPvedMqVwJbNkH7/Yf0Y243BR6qQ5jQjw8ByaKq5371zlrUBnjY4WZKKk65wk7ZZ3SCmv8tADNCPrWTpyDtCzndPD8P14Xv/PYBhjkx7ePmvSz/akK7sb7MMfOLD3sC+2iulwqyT4IQjM4rHf1mr603YW+4YlvNJ7uDaXgGRk/+sLEmnArQlWeTNL5XCTg2Q0rSM+cCux+S8Tf7dj82ZSSWibutGhz0pNRMZ/9yFcVTAlR+xm+wMwdz2nbk/bhEhsEDrgbRPnx80cMT7DRT186hWjBX+6jOshZRJuh0T/6KiQ4MtsqV3UF2a1XzbwGEr4iwmaTHcTa6MABCKL5wKwGZ8c2k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(7053199007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUV3YVlsR25aaFVyaUdCNXNvMWp3UmFxVFkvOHNIaFdhY2JqbTRvdk5wMUNn?=
 =?utf-8?B?RHZtb2JQc1VYYmtOVkVGc3lXMmRVVjkwN2hxVTkyMGVibHpyWHR6WmswNG9n?=
 =?utf-8?B?ZGV0eDhQeEpOVmsvSUYxUm4zVDB4TndPREkwWjNESmFUSTJpNC9LMWhsVjc5?=
 =?utf-8?B?dXVkTVhQZ1lkclVoRFFUZ1BWbmc4WFRvc3BVOC9XWXhTRE9oNXZ2YU50dlhR?=
 =?utf-8?B?bjlsOW9vMzJMbzNkUG1aVkdLUmhyUURLOWVrOUVUNllaclhMS1pTdnZmcnlT?=
 =?utf-8?B?SHJVVkdHbm5ZSWFqZ01nOEY3Rm5jd2w0NDloNTd2Tkh6L3p6OUlGZ1RBdFJS?=
 =?utf-8?B?U3VqZzRmS09sWk16TU5ndzRSd0dBalQyMG9NWUFFVnBqM3daSE9YTnBwZWY2?=
 =?utf-8?B?RU1qTHhVYTJuM0txUC85M0c4ZzRIMGxubi9VZ2kwUEo4WFBlaS9qcnVta2tF?=
 =?utf-8?B?cUtwczhNMmVoR2FYbGNyQys4MTRBTHlZbEZCbzlvdTROS3U2Z3BYK2lIQWdq?=
 =?utf-8?B?ckxZaitqbDEvU2h0aXNXZkdqanFuZ2JNVlBUVm9kREtuVjB0Y1VwY3N4eDhJ?=
 =?utf-8?B?RUxPT3lYZE1aL0o3WG15aTZOWVFmTW9zdmNwNUVNYWxmL2VDbm93SUxPRUdD?=
 =?utf-8?B?ZGxwdmNiUGdtV0pYQkdqZ1lkVVBod3RqRHpmKzViOEVCRWdaV010MWlJckds?=
 =?utf-8?B?ZXdwZk5RN1ZSb25xVHZPNjVaRCtId3dOdUJmSGVzQXBiRUpuL0lXaElVTzhP?=
 =?utf-8?B?L0MwWjhZTXV6U3J6c1VEdkQwR3JwNnNtNUpBRml1Nmd5OGZKaG5lV2ZrSE85?=
 =?utf-8?B?WmU1Q3FzZzF3aHVlWlNROEJ4OEJLb1F2SnJKTGJuQzBLWHEvaWM1c3hUZDJu?=
 =?utf-8?B?eW4vYmo4WHJHbnZKRkFqei9FTHVQUjdGNm05bmVoQ2Q1VmpDdVdIdmZZaGVO?=
 =?utf-8?B?WWpjek5pUUJ2ZkVoWGRsVUtGYnVRWmJkVEdBM2kvWEVSSWppNExpVGMrRFg2?=
 =?utf-8?B?bzYvanlRbEJQamt3dTBRZTNNQjdEdFNJdzd6eVNDbjFYdnFXNUdoUjYwSDdM?=
 =?utf-8?B?enkxRklQWVE5eXVuQXlOZVZ0MlV6eVdUZURFV3RqQkVIQWFqMnl2NnpoSXRj?=
 =?utf-8?B?dWZIbFFaQVBhTjNQY1R3WXhEQ3h3NWpvN0VkYTFTK293bHJCL1pZbTY5d0Zh?=
 =?utf-8?B?Z1VMQmxSTi9yOTd4Rnpwbmp6YnREOFByU3JuMW5GbklWejM2YkxtQldGZEZY?=
 =?utf-8?B?R1U3SEFrYXUyblRCbW0vUzE2RTZzVDF0cngrREh0S2hUZVpxQ1UwUW9FZVFB?=
 =?utf-8?B?MzJvTDJ5ek9BOXA5VUpMR3dXSWJFckdoOUUrQmk4djNGWVMydU0xUWF2dllN?=
 =?utf-8?B?OTR6Z08vVUNKQXNmWnRwRVVZcmYzMitPMlgvczdQRXpWWWhoS0pUcU1OclhS?=
 =?utf-8?B?RFdmWWJSc1Vxa01EQStDYjAxUzFnK0ZwaExkOXVSSjJ3SzFHaFVySkpHK2Vk?=
 =?utf-8?B?aGxqZHkyeTlkajk1a2hXd0EvWGcvN2gxcTlaU3ZmdjNPcWV5RmNsM1lIMDdy?=
 =?utf-8?B?aGQ4VXJHK205dzBEZXNLTHdRbHRxTlJnYnF2amdocDdrMDExMDhYbFdTb2lQ?=
 =?utf-8?B?MXY2NWU4QmRjaHB5amFteEg2Ni8vSFhrRmhTaTg2b1cwOWc0YU5sT1l0dDdG?=
 =?utf-8?B?SnhRREZnR3k1T2xvWExqUGtEM2lJbkpoclppZ01xZ0ZkTjBGS1M3c21aWHNi?=
 =?utf-8?B?SUtkbkhpWGZtQ1l3NUpoN3RMUmpqZEwwVHI3WGZweXYybE0wVlhqVXVNdTdl?=
 =?utf-8?B?R1AybWRPaXNJMlJjelc0SGZUOEgrSmw2ZGhCK3ExRFR2WlV0YjVURk9Wb29k?=
 =?utf-8?B?bnBhL05qTFhSMXJXdVlRN0dWRTBLNkYwNkxXU3l3MFNZc0EzWURVYUN5bHFO?=
 =?utf-8?B?aFJNN0JMUjJSWmRTQWd0V3ZlSHZZSm1uNE5mSEcrYVMreEJSa2dUTHlQTjM5?=
 =?utf-8?B?dlFqQmp1NEdLeTR4UDVUQjNBTzU3VDVaRU9tSjQ0bm1FZ29aZENyM1hPTzVh?=
 =?utf-8?B?aEtocGk1dGE5REcrajVHbndxTEU2NmVDeEFSYjFnNVA2SEJBTWxGdnoySjFh?=
 =?utf-8?B?U0dROXVRaENRc3Q2Y2pldGRvbWtYakcxdmp1Q1RDSEVVUDJxd0Z2S24xVTVv?=
 =?utf-8?B?V3dLTjNYa3Fxc3FyaVg3OGJ0YmdqTmkyL3NRcWVSVGxTTlN5NndsdDN3b3Rj?=
 =?utf-8?B?SzY5TWxicER1QUd3ZkMvRHoydktPQ2pkK0tCa1hYRGZ2SnFwZithcUcrRTB2?=
 =?utf-8?B?ZHdnQXh4eUtzZlZFQWhYNkpTYzVPdFVKWVVDMVdrVExZUXgzYXBTUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53e2779-4ee6-4faf-7d64-08de88cd9f81
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:16:26.1085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0Jk6JpmMpZJqbz2XIX0tPuJRg9wvAClAWLyfupy1CdZgO7Vrz6Wfts+X2leA9D59oomT1bs7Bg7OOeTGayWww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6995
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,invisiblethingslab.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E2A582F10D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 04, 2026 at 02:39:01PM +0100, Jan Beulich wrote:
> MCE init for APs was broken when CPU feature re-checking was added. MTRR
> (re)init for the BSP looks to never have been there on the resume path.

I'm not sure the statement about MTRR init is correct, AFAICT
mtrr_aps_sync_end() will also re-init the MTRRs on the BSP, and hence
the added mtrr_ap_init() seems to duplicate what's already done in
mtrr_aps_sync_end().

> Fixes: bb502a8ca592 ("x86: check feature flags after resume")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Sadly we need to go by CPU number (zero vs non-zero) here. See the call
> site of recheck_cpu_features() in enter_state().
> 
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -642,16 +642,21 @@ void identify_cpu(struct cpuinfo_x86 *c)
>  			       smp_processor_id());
>  	}
>  
> -	if (system_state == SYS_STATE_resume)
> -		return;
> +	if (system_state == SYS_STATE_resume) {
> +		unsigned int cpu = smp_processor_id();
>  
> +		if (cpu)
> +			mcheck_init(&cpu_data[cpu], false);
> +		else /* Yes, the BSP needs to use the AP function here. */
> +			mtrr_ap_init();

For symmetry with the BSP path, is it really needed to init MCE so
early for the BSP by calling it directly in enter_state(), or could it
also be done here?

Thanks, Roger.

