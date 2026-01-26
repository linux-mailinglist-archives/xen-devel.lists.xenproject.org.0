Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOcoIrVCd2mMdQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:32:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F071786FD8
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:32:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213531.1523996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJtA-00063X-Sh; Mon, 26 Jan 2026 10:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213531.1523996; Mon, 26 Jan 2026 10:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJtA-000619-Pv; Mon, 26 Jan 2026 10:32:08 +0000
Received: by outflank-mailman (input) for mailman id 1213531;
 Mon, 26 Jan 2026 10:32:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0Yd=77=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vkJt9-000613-FT
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 10:32:07 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40c27301-faa2-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 11:32:06 +0100 (CET)
Received: from BL1P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::23)
 by LV3PR12MB9166.namprd12.prod.outlook.com (2603:10b6:408:19c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Mon, 26 Jan
 2026 10:31:59 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::a6) by BL1P223CA0018.outlook.office365.com
 (2603:10b6:208:2c4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 10:31:45 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 10:31:59 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 04:31:59 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 04:31:59 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 26 Jan 2026 04:31:57 -0600
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
X-Inumbo-ID: 40c27301-faa2-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOUXqN5Z3OOElaVcMN60Bfnn8JsrgpDXRqYHvYqjsiD084LH0eJmxA8xAsX+cSwkeZ/n1YIxrq3qbF1Rjcprbjuk/OnPJHE4P5oBbeS2d4RW62KqvYx6cDcRnpgm4k9cu54QqJnHXwbA66864fiQCExEcZYJm2y6TAhqUz5mwyzeZ4BuY3Dyaq199bh+5LjUDDZ/7Us9paIzFnB+VLtb7Aw4EpRzIq/8Ts/L9WrEUjpCRLOLGD8sJhO4ILqPjvwT5ReDE1ogMppaGOzhpOuPJ7kwKEBzBlwwAXGhZrecNQwDilUaNRBkFKUQ1CxRN5R4G8NLRX/XqSgv7z+WLIbJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hax5IQVpzAukgGgzVYkk6unbzvHGMAyZVzacTxzeBA=;
 b=x5/BxbysGJZC4kYbuUxCU1i8HNK3En7UEBu0PGjHq4G9biywKZ+590663P17JWqjyK6S9YC9wxUxg3mwY0P+ya95sJYSNr08CJolQXVWveM30Vs7vQZ99YOgr9BaIUhkpMFdmBEj1k2VYQ4SOPfPdAa7JP26wz5a8fxNgI69Dk7yDLSz4lYmlXQXvxFdWCSwVmmaEz/elDNsswMrKnduUBHTyB8Hta525yCNF6c2I5MWVh122mLn0qWbHnUQWaA+iTGxhJys3X3fgQTVRFBPyzPLFUasswQpENPlkk9z4YJ4ueyZSpiCnzHfIfjE9IOUurN7P0Sfq5oEUEODNsZ0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hax5IQVpzAukgGgzVYkk6unbzvHGMAyZVzacTxzeBA=;
 b=MGWj9trIBJsen1zFic334/8xiN3dwoSWYws2d/YNfn5WX4hyfJWKrNLPNPRSZEHz+SGUQfPrDXPp1DUJ2WHY4MRCcjEdvZK4irz1tImAPE5ZMInufTMsMhXFfzYiab4yT8AGo+mFowYuK7sHsd3NRT7NBO7gsL7G6LRX72mDMfw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <2a4e34cd-dc68-45fb-9646-eb9a0d4929eb@amd.com>
Date: Mon, 26 Jan 2026 11:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: adjust NR_CPUS defaults
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1caed635-3d9b-47ed-b8fb-d6c391293059@suse.com>
 <bdce6b74-d6ea-40fe-b7a7-dba62a7535c2@amd.com>
 <6f4901b7-3121-4dce-bdeb-da3644e719c3@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6f4901b7-3121-4dce-bdeb-da3644e719c3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|LV3PR12MB9166:EE_
X-MS-Office365-Filtering-Correlation-Id: a698c4fa-b8ac-4e3b-97e4-08de5cc6233f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RG0vU2JEUVlQYUY3VEdVY1ZPVk9INzhiTFFXYjF5cEZISUlML2luNm0waGhH?=
 =?utf-8?B?Q29XSitYR09kT0VGZXZYTUFyVDlYVUs3ZFU3TTc4OURVVExiUXBFVmxqak1S?=
 =?utf-8?B?OWRhWnErbWJ6MEw0RTFwbVIwVENkQVNQalREYUwvMElkZ1dFY1h5Qlhab2Q1?=
 =?utf-8?B?Z3MrL0NKN3NNb2tyWFd5K0djY0E2WFEyeDVKYXloUitUOG5wYmlMbEh6WXZw?=
 =?utf-8?B?b0cwNlQ1dFY5MW40R2tOYmxua1FFd0FIK2RnVjBkNFJYTGFQRXJvNUI2QkZT?=
 =?utf-8?B?SE9UV1piSkxLRnVmMFlqYVNVZ2FnNDJ4UDkwUEZZQmhkRytXWE5mNTJEdzRN?=
 =?utf-8?B?KzVNdStGUXF1WFRWYVorTlpKdWNUbEtUUGQ5MFR4TVlzQTd1dDdvV1hRRUNY?=
 =?utf-8?B?UExsOTBvbkJYaEtHZlgwK2MrRHpNY3Y4azc2T21Cb1QvV1JHckRkV3BWWXZG?=
 =?utf-8?B?M29FS1pRUm9pZnB2c0NqZjVJWm1rUitsdkR5OXkyQllXR1VlRUFhb2d1NE1V?=
 =?utf-8?B?a0JLU2ZqMXg3WGlnSUhHNXYyTXpEZGYxM3A1T1RnWHI4ZzdQSi8zdW1FNnhR?=
 =?utf-8?B?TkxCQ0pacjNOVzJOZXZEMGh0NUhacWlGc2wwZmRFNkx1ZDRmM1JjbXpxRHRS?=
 =?utf-8?B?YU5nZVQvQ2xPMGJscWdEN3orL2JSeWI4R1kyQzN3aVRtWkNRbUd4bVpuM0kv?=
 =?utf-8?B?VnVuNTVhSHErWERWQkpvVTB1TG9ET3BKamZoNnJURnJVMTB2aDBJNGtMS2Jh?=
 =?utf-8?B?ZHVGeDNpd2ZFbm1WU0xWYTBKQU9HbUdIQWVUTk1aZjEwUitJTkd3UHJ6d3hZ?=
 =?utf-8?B?dUZXcXZHaFZickg0eWg2aUtFd0RMc0RvRlRMWUpGU29zcmJFTytOWUVVcE1u?=
 =?utf-8?B?SFR3OTdaTnh4cnFMR3l3bUViLzVXbE9nTFZDeE9XVC9mSDZSc213SnUwYVho?=
 =?utf-8?B?VWg0b2ptck5OTURsdG9uWS9lUjFQaEozQW9wbWFFMDZWcUdmK21sRUx5ZHk2?=
 =?utf-8?B?VmpKbEZHQkdlQ1E2cEZZc2FoZjRiays5ZHc2ZHZXRkZtaUZsUEVEZStvdjUv?=
 =?utf-8?B?Y2RPOTRGMFFwcy9tUGJaMXpKUHNFSDNvVE1vaXVuZHZUS0RXQlhqVkJMVllG?=
 =?utf-8?B?S3FVanV0ZXA3MWZ6bGdVVkl2WkJtVVNjOHFFYjZYUlhkb3BxMm5iVkFFdW5r?=
 =?utf-8?B?ajFYUXErUEZoNkVJNG9HbUt1QUN2SnRuSXR4dlpkSlIrVlBwZGJxaFVNeDNt?=
 =?utf-8?B?d2kwQlhiYjQzbGxMQ3ZnM2ZuMFl0TjRTZWwxa3F0OEtHZFpUSnJBQ0tEZkNq?=
 =?utf-8?B?cVdYZWx5dHVwU1ZDYjVkSFFZRTFpNW85ZVZXV3RXUlJxNWNSekdpYVRsak5Y?=
 =?utf-8?B?S0dJY1VQZjFnRWVNYm1kMEhlS1VCaENiTk9qL21HZHpWSE9pRWJvQlkrTVo3?=
 =?utf-8?B?MnFXZHl1Y1FuSkxoWGhQaVhXeDM1cXA0N09ySVVnblpxbmVXRVdaYjJ1b2xR?=
 =?utf-8?B?UUhSWXVUOUxxMm5oU2htaG1HYTlWeVUrSmREVnlMbGJPK1d4cjlKbEZBaEVa?=
 =?utf-8?B?d2o1c2tOYVBwTm5XRG5lRHd3RFE2dnczaFYvMVdjNk1FVyt6VlcvMnhkTkor?=
 =?utf-8?B?d0J4ZU9PMlZjQm13SWxuUlFicERFV09sUEF3MC9xaUhuUnNERHlEZHlTVUc1?=
 =?utf-8?B?UHI1Z2dDNkZOVzRjZWUxS3pjTmQrRDhUaDFGeUxjd1EwamZiZTVlL3NCWEJq?=
 =?utf-8?B?KzQwUXZ6SUlpTmdBWkR1Y3gwMEVORStkcmlNaHpkMGFMUk5Kc0JhWFhlWnZn?=
 =?utf-8?B?U1pwdnJlcVZEUGJBSnRHUUhFaUxNL1plSGNwc3RzanE5d3F6UmJQM3BqRUFj?=
 =?utf-8?B?WFBRWmNjY1BFaXVycGxXTUlZdm5aa2pxWGRHaWt5N0xTWUZWWkZwSHZ2cTJi?=
 =?utf-8?B?YnIxaWhaSllqMCtDR00yYlRZODlSOXZXTUp6NTl1em5Cb2FvUnpkUUUzeHVM?=
 =?utf-8?B?YUZ0bUFicVkyWWhFU0tZU1BIeGNkY1o2Q0lBWE01Y05CRFd4NFRNSE9kTzVW?=
 =?utf-8?B?ZUJtb0NvUHZwVVh3WjJVWWthQ1RINTI1dDlPRjRGL2dGT1MxNmRtRTZhN1FW?=
 =?utf-8?B?M0p2a3lSRzdzbnZ6MzZRVlhtdGRnVTdXMHJEbVlOYWo5a0ZYdStIWlFKS3Nt?=
 =?utf-8?B?WGxYQkNwWHQwRFRPT0hET3ZNYWEwejJkemtoeWZibW02YW9lNGtQY1o4OUY5?=
 =?utf-8?B?VU5mcC9VU2o5b0hqMDFMb2VZQmtBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 10:31:59.7369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a698c4fa-b8ac-4e3b-97e4-08de5cc6233f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email]
X-Rspamd-Queue-Id: F071786FD8
X-Rspamd-Action: no action



On 26/01/2026 11:13, Jan Beulich wrote:
> On 26.01.2026 11:08, Orzel, Michal wrote:
>> On 14/01/2026 12:33, Jan Beulich wrote:
>>> Discussion of a RISC-V change revealed that for PPC and RISC-V we don't
>>> really set any default, but rather rely on internals of kconfig picking
>>> the lowest of the permitted values in such a case. Let's make this
>>> explicit, requiring architectures that mean to permit SMP by default to
>>> explicitly record some sensible value here.
>>>
>>> Leverage the adjustment to the "1" case to simplify all subsequent ones.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Thanks.
> 
>> with one question...
>>
>>> ---
>>> For not-yet-SMP-capable ports we might go even further and use
>>>
>>>  	range 1 1 if !X86 && (!ARM || MPU)
>>>
>>> at the top. Thoughts? (I've not done this right away as it is liable to
>>> get unwieldy when we have a larger number of SMP-capable ports.)
>>>
>>> --- a/xen/arch/Kconfig
>>> +++ b/xen/arch/Kconfig
>>> @@ -9,11 +9,11 @@ config NR_CPUS
>>>  	range 1 1 if ARM && MPU
>> Why not simply && MPU given that MPU is an ARM specific option in our Kconfig.
> 
> Good question, to be answered by whoever put this here. I guess the anticipation
> may have been that "MPU" might end up meaning something else on another arch, at
> some future point?
Except for this specific case, there is no other use of MPU in non-arch Kconfig
or code, so it's difficult to say. I would be more willing to tie it to Arm, so
that we don't need ARM/CONFIG_ARM before MPU/CONFIG_MPU.

~Michal


