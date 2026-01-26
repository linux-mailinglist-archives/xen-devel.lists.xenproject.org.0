Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBmfDy49d2mMdQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:08:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860EE86715
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:08:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213467.1523937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJWB-0007pc-W7; Mon, 26 Jan 2026 10:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213467.1523937; Mon, 26 Jan 2026 10:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJWB-0007no-TN; Mon, 26 Jan 2026 10:08:23 +0000
Received: by outflank-mailman (input) for mailman id 1213467;
 Mon, 26 Jan 2026 10:08:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0Yd=77=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vkJWA-0007ni-E4
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 10:08:22 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efe121c2-fa9e-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 11:08:19 +0100 (CET)
Received: from BYAPR06CA0044.namprd06.prod.outlook.com (2603:10b6:a03:14b::21)
 by PH7PR12MB9103.namprd12.prod.outlook.com (2603:10b6:510:2f5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 10:08:15 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:14b:cafe::19) by BYAPR06CA0044.outlook.office365.com
 (2603:10b6:a03:14b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.15 via Frontend Transport; Mon,
 26 Jan 2026 10:08:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 10:08:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 04:08:14 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 04:08:13 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 26 Jan 2026 02:08:11 -0800
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
X-Inumbo-ID: efe121c2-fa9e-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8VNmAKY6q/dhYudSog3OcjSwruFHp5yYQ0FnQ1MHL16nCpkMHMISBoPunbyDsIUXAL7Yt0St0cnWAMhNJ1XM7T5pV8mkhh5Cn5IOIcv/Hfvd9ZUfZAGkpQdQ0AWEq/ghZCuGWny2VvFBYnLpuBYoFiNhtu0Jrqj3wMjvsjla5jznYPF/Q5bw10MUnUhnHw5pXOzzWU1WA6JjFKV9vYrNJaSyYNeFadokBukuysbPg2dnKRo3HTaGsIibuMf7/985yQaCYw8+ubkFm73U8DOmcnTdogLdJ3guitNOPcmB6ybWieS5+mCJKXxOqOYY6CUZRVktOP53wcAwA/ySbOWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QN9Krxqu+XkT4/VAup8tVuJ+lrhfh8HF6YERfgMjlvM=;
 b=YIc7g2Rpz96XNC09L7HmiJBpFG2Eewg+g6u499Ki0lN6OZK/Mjrnbv0qnDgJxGCKx0lc14Zt7kdURvW2dJloc97s03yZmegdJinT0y1T9FL11pS6xSKn5D1X/4qxrOnjZbrs9K+CZhYcXZzc7nrUhqEnCIGae++8QS5eGWu3pWqiE2wOpGMaBhiH+3mzmeNdjm95bWTI8IKe57wjKm1qSXto91pu94L/tEpaAzYVh/LlEu/p4djVqCzY9e1F4zhq2NtIM4mvYgO+8rGKDvxSMcatLQ8vQ24Cyn6qaMry1AnJTBrbfF6szDAxgx+RSDpsvL50AQdMiAmWS1rVw5NYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QN9Krxqu+XkT4/VAup8tVuJ+lrhfh8HF6YERfgMjlvM=;
 b=ab6dFA+30zWgQrIoBhffJ08DGUKhwolYVnOSs87HRNWE7BTzv4Sv9KjXHK5RTo3IBoG4VBqfS7pZ4UPqC8DgsB7cjKYw6HFFVdl0+jPopJZS8tDuzuEk+F3xQEf6tPH3NfQDKmNWGxg2oPuryQEzGCo0Xey2JaIFqlGis1RFdDc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <bdce6b74-d6ea-40fe-b7a7-dba62a7535c2@amd.com>
Date: Mon, 26 Jan 2026 11:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: adjust NR_CPUS defaults
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <1caed635-3d9b-47ed-b8fb-d6c391293059@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1caed635-3d9b-47ed-b8fb-d6c391293059@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|PH7PR12MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: e7704686-c1d6-45bf-d922-08de5cc2d1b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWhFREJPTEZaSjA1RmlkanRmLzg4SDdVR1BqTTVlSUFuNEkvd1BJMkJXM2I1?=
 =?utf-8?B?MklWTzM3Q0ZHL0tPZ2ZYbHRTR3VjcDdjbWl2OHlQUjNHY3JidTFRdWhNb2hO?=
 =?utf-8?B?ekMvQ3I0a1V6eTFybk50WTVFc2krVlRjc2FMUzNBWlBKa0pFYVJxTis4RXNi?=
 =?utf-8?B?R3ZYVFo2OUFQcmNGcU9aVnRhUEZOL1JaVURUQXQyUGdoUDJSN3ZNWVRUOW9K?=
 =?utf-8?B?bDVpaUdoM2ZtUXo1MmpFMVNIcHQ1WjRlQ0FVWDdpRkt6TERvZGhxMjdiU1Nl?=
 =?utf-8?B?YVoxUHJRWnZhY3c2S2YzVUZyQlNoV3pIK3BxTWJSS3hQRlRSb2VGVTNlMEtC?=
 =?utf-8?B?Z3lQOVdjQU9jTzZ1MWY0M1RWS0NOeVBGenJ2WnRVdWt4RFBpcFVGczRWa1B6?=
 =?utf-8?B?MzBCcStCOTROeFUzZHVxaFBUQmx3eW1saGxoUU9EVnlVMXVKY2Rqb3lEelFG?=
 =?utf-8?B?R0l5NkpJNmh0U25xL0IzTlZWL1Z6bzZaOU8vN0dEMmEwMDRkMFBNZk5OeTVS?=
 =?utf-8?B?NWVZb0d2T0RZRHltbVFETXVrcDU2aHRLNHJ2ZGtBd2NWczQreCtCb1gyVnoz?=
 =?utf-8?B?OFVIdlhUcnlMRVkvRVpxdEdhL1V6elFsU3N1dEVXREZYazBud2NEMGlna2Rr?=
 =?utf-8?B?QU0zNzdacWtiVGhURkJnRTZNS2IxMEpuM1MwMzNkNWdvRGw0NHE4U2lPN1U5?=
 =?utf-8?B?M1VRMitXcElBRWpJaTd6UXQ2UEgyeDV3azIxa2R2bjluTm1aREFHeXhEcHNX?=
 =?utf-8?B?S0ZlTXNMazNsMnR4R0lZaHhxUml2dWk5Uy83SnFrSXAvUDdidmZnTStML1RS?=
 =?utf-8?B?c2YzYzVBQnFVY0RWdk5oYWJqcDFhY1VxZWdTVml4UHl1eEk4Uk1WTk5QaGhj?=
 =?utf-8?B?RXJrUmJ3Q21HcGlmWHVoMi9lb3BLRWY4U3pwTzZlMkwrb1lMaVF1RGRBNnhm?=
 =?utf-8?B?aTU3QkVUemRIK0x0SWlpOGNNczhBVVcvbTFhZjhVSmxRN25YVDRST3NCRjFz?=
 =?utf-8?B?YmkxRFRrYmE3RVcrcm1aVGt2THh1QS9ZL3Rkbld5NXF5c2FhdTJyZkRTNmhR?=
 =?utf-8?B?NHM5emU4YW5oYmsxUFdIWVFDTk9qbXpvSW9HaEJGQ1R5ajJxUzhLenJPTEt6?=
 =?utf-8?B?S1k1RnhJNWh4WDhhU2haTVg5N3JDZXBsRVo3eFJvOHZRd09zekdUbHhSN3V1?=
 =?utf-8?B?U1A4NituWmpKNHJOcG9QaGNtUzRnaWhJVGU2bVBReDNFczZUSWR6eDFuS3FW?=
 =?utf-8?B?S0g1SmM5bWJTY01DMzdLUnBaSVlDVzA4alovQlVGci9UZ1VPRjZLZnUzRm5N?=
 =?utf-8?B?U1lvaWM0QU0wM3BLUXRUd2lRUVd0Y0NPVUl4Zm9hcEh6aFpOMkhjcXdGdWtB?=
 =?utf-8?B?d0JQdHp5dlBZT1RCU214azhpczNvY29SelZNdWtYUURqdVJYWG40NG1FOFEz?=
 =?utf-8?B?MHo3ZUd0UUt6K0hUTU50T2VrV09SbnorTGo5V2FwRlNuVTBUeUJJUURnNk85?=
 =?utf-8?B?RW5VMTd6WkRhU3U0dzZQSjhJRDUvL0hOQkV3NEVVbS82VllhVVQ2a2s3dHU4?=
 =?utf-8?B?SXIrcURDSEhrYm1rdWRyOS96Z1ZiMy9kYTZtMmxhMUhaWjhQTzhIMll3NVJ2?=
 =?utf-8?B?UDg2SlF2WFlJQXd0dmVrc0hSRzkrdTNqZ3BzTnJONElSa0hUWnh5SmdNMnhi?=
 =?utf-8?B?emN0cVdGNmZqZkpXaDhubDh4K3QrSGQ0aTZ6dFdFNFEydEFzZ3BUMVRjdzY3?=
 =?utf-8?B?ZzFlcWpxbkR6NnhtWC9ObzNqaTJKditzK1h6Mk1mc1dXWlVqVjVEdHBvckdV?=
 =?utf-8?B?eUk2WUxmS1A5azBDa2RpZ3VKZGxsQ1R5Y0F5OVF4UUppRnIrczA1K1FwWHYz?=
 =?utf-8?B?UFRxRjBhNHZEdFVzc0VQUXlNc0tTdXEyOFVTTWpRdTM0OE1RL3NqWldmRzJz?=
 =?utf-8?B?Zk55QS9Qem9xU3UwNUtabm1Ud09xbkttZVJZUzBGU3JtOGVzZDF0ek1kbXZ1?=
 =?utf-8?B?czY5TGUySnF5K0dNSHR2VFYvS2tTNWJNSG9QenhBaWVTeEFhN2VSQis1MU9s?=
 =?utf-8?B?d3VDd0srR2U3cEF2RmFaWHpvem5LbTJWQnBZMFhyYXY0TkFaTXQxN0JadG1B?=
 =?utf-8?B?VnMxa1loUlViN2pSeVlSZThxdSs5WDJPSzRpVUZURFBleXJuR0FSSTB5d3JI?=
 =?utf-8?B?ZmZhSmw5Q1h6SUZxWEs4dHJYWnpTYUkvbmNwSlFNaHMwdXdka2VmM0p2NFUv?=
 =?utf-8?B?eHRDa3ZWRVZVUllTWWJZNnUrcUV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 10:08:14.4047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7704686-c1d6-45bf-d922-08de5cc2d1b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 860EE86715
X-Rspamd-Action: no action



On 14/01/2026 12:33, Jan Beulich wrote:
> Discussion of a RISC-V change revealed that for PPC and RISC-V we don't
> really set any default, but rather rely on internals of kconfig picking
> the lowest of the permitted values in such a case. Let's make this
> explicit, requiring architectures that mean to permit SMP by default to
> explicitly record some sensible value here.
> 
> Leverage the adjustment to the "1" case to simplify all subsequent ones.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

with one question...

> ---
> For not-yet-SMP-capable ports we might go even further and use
> 
>  	range 1 1 if !X86 && (!ARM || MPU)
> 
> at the top. Thoughts? (I've not done this right away as it is liable to
> get unwieldy when we have a larger number of SMP-capable ports.)
> 
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -9,11 +9,11 @@ config NR_CPUS
>  	range 1 1 if ARM && MPU
Why not simply && MPU given that MPU is an ARM specific option in our Kconfig.

~Michal

>  	range 1 16383
>  	default "256" if X86
> -	default "1" if ARM && MPU
> -	default "8" if ARM && RCAR3
> -	default "4" if ARM && QEMU
> -	default "4" if ARM && MPSOC
> -	default "128" if ARM
> +	default "1" if !ARM || MPU
> +	default "8" if RCAR3
> +	default "4" if QEMU
> +	default "4" if MPSOC
> +	default "128"
>  	help
>  	  Controls the build-time size of various arrays and bitmaps
>  	  associated with multiple-cpu management.  It is the upper bound of


