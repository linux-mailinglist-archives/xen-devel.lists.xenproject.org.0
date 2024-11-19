Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B09D271C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 14:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840091.1255876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOQk-000074-GQ; Tue, 19 Nov 2024 13:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840091.1255876; Tue, 19 Nov 2024 13:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOQk-0008VV-Dj; Tue, 19 Nov 2024 13:38:10 +0000
Received: by outflank-mailman (input) for mailman id 840091;
 Tue, 19 Nov 2024 13:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=neHs=SO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tDOQi-0008VP-Jl
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 13:38:08 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2418::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fa4641d-a67b-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 14:38:02 +0100 (CET)
Received: from SN7PR04CA0085.namprd04.prod.outlook.com (2603:10b6:806:121::30)
 by SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Tue, 19 Nov
 2024 13:37:58 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:121:cafe::b5) by SN7PR04CA0085.outlook.office365.com
 (2603:10b6:806:121::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Tue, 19 Nov 2024 13:37:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 13:37:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 07:37:57 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 19 Nov 2024 07:37:56 -0600
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
X-Inumbo-ID: 7fa4641d-a67b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxODo6NjFkIiwiaGVsbyI6Ik5BTTEyLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjdmYTQ2NDFkLWE2N2ItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDIzNDgyLjY1MDYzNCwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5JU4ooAE6dMvNiJ47w+fkfKs6xAGLGtvQNIQ7muodu5koP41dfNhwGYV39LgWo4TgQazOaCBqG3/FGMx8ny1YArp6a9rZJdSgZwtcJv0gWVMG8gpyZ3P+s2ofI4BhBMgXILdpVCnPGfiXjSFiPOHZ25xNOIgYRQ41Ee2NgnmUFkptBQ0GjyhpqdzCzPcLC4h7hF/xwxSrnimsRd1MIkKWt1peTsJ2eTarOzLlf8hOyFc4a83jZuIazByZoAl9TdvimGX0t6BfwfgIJgCE64fovTlFMTufIop2vO0tb8DCHe9GLRqRGiRfICHYF/pq1dokmSJW3KCfeddsDW3LoT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6jS/mGGbv7bHeCzXkQuZNpDzTDa2a0olbskBDw3l0c=;
 b=xDZzjRxJU10o7vbAHF8orkJNaXHK7EregMqesWJ4d9Exc2SIUVnCaflB07iIGZ2O31HY5kOgoZIdo0B1l2bMhvNN4qAj4UionrUMkRWTeoUKu2JhCjNUTs26k1q3TjkHqewWltm/mDVNE7ePbgvc3dJ+NbPaMF4wZoddhX3CPSnbQNL1LjFq/gpAnjOvTGRLB4WZy6uqgIX9Ro6BLGXVskxyfrmVwdijDQobyQfo93+y/6k5p3MrI0SFn+XUpSptJCqKEdpJ9l4hsFg6TiB68ywYzTiwZU0JMW7I/kE2tmx7QPOfTNVuzacd5sEOL7oXxTMyaZ3LS216HK63E/slEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6jS/mGGbv7bHeCzXkQuZNpDzTDa2a0olbskBDw3l0c=;
 b=xWf5aQ8STP+WSPelz73F3wp7nhf+YMsB77/xa59LU6arQDYiY7z9IWM4P+HJ5qtmcB43zFQla/eSaAX2IiGHf8UWp/BfNpbBGRnc2/9LKIf5YdH82Zf9qrm9fZuayTXAboAOl31gGvg53MlHfg+WdFvyXOz/oqNs/Kl77saF+yk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <436bfece-0b75-4da3-82bd-a9ad17f599e6@amd.com>
Date: Tue, 19 Nov 2024 14:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bootfdt: Unify early printing of memory ranges endpoints
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
References: <20241119115141.72770-1-michal.orzel@amd.com>
 <D9477A55-6B55-4CDC-B92D-3FB898DBC505@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <D9477A55-6B55-4CDC-B92D-3FB898DBC505@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|SN7PR12MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b17e12e-826e-46b0-afed-08dd089f6172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkE4YjFnMFY2RW9RaW5Wa2RIY0xBbW1QU3JtVG9wblVubm96MXpsOFl0OTg2?=
 =?utf-8?B?ekxJQjAySXk3NXBEVlNRR3F6Z0x0SlRQM3ZPNVZOR2lqSm5RNmtUZGNraVJL?=
 =?utf-8?B?VFNwc2Z0K2FuSi8rVWVpMXBXUFY2SmhIUk9sWDF2aEtMbnVlTlJQek9hbHor?=
 =?utf-8?B?UTF4RFB6Nk9mY3B3OGxsNEsyOVdyb0FBRHJTYk8rZERMNVJLN3ArYXRKMGFC?=
 =?utf-8?B?V0FKajRsazNSMHdNclR4cEFiZG9IclB4ZjljNUNpbzJNMHFLb0szMG5ZNEly?=
 =?utf-8?B?K3dVZXcvSzAvaldkWmdDVTM1eHVxTGphR2tqeno4dytibXgxRzA4YUJURXRa?=
 =?utf-8?B?RklBMytKYkpEVFdVZ0pKU0JONldqc2wyU0FnU1BGQnRpRDZHUEtzSnYrNTI0?=
 =?utf-8?B?eS9icXRKd3Z6Ulg1NGg4N25MVHE4YWNsR3ovNXd2T20yZGlhTHlkdzArb3Bn?=
 =?utf-8?B?eFBVQThKdUZCZXVzVmpPM01aTlFyL1I2TEUwNC85Y2wrREhESlJCVmtWcjVV?=
 =?utf-8?B?azM2a3pXaHRMbXFKSENtbXZTeTlJSjJUTUg4SGhQdkU4QUdERXZKakttamhN?=
 =?utf-8?B?VmVFT1FZOU5ZMjJ6OFV2Rlp5bGZtOFgxT3EyMzJuNG9LUVF1NUFSMDcwcTNq?=
 =?utf-8?B?a0ZMWEdWeFNuUEUxaFRDRHlzODljWm12RG15RUxxNks1M0grWnJucUpmVXBz?=
 =?utf-8?B?L0IxK0hLT0JLV0dWLzV0d1FKSkozQVRQMEJJem1wdUh3OUJON0hhUEFGc0F3?=
 =?utf-8?B?Wk8vNW9vV2h1Y0t3ZDJIMXNUcDRaYWpQQW9jZTVERFJZMUwyMWN3aU9adGVh?=
 =?utf-8?B?enZYV0htTlUxNXJoT2NwT3V4MnNMVUZ5YmE2Y0czN2FRc2p6cW93bU1PUzdC?=
 =?utf-8?B?K3dPdnNpZmVYT1JrdTg1TUI1L1FsblBTOGxoUTYxOC9tTDVaYXp2NmxxWjZ4?=
 =?utf-8?B?QlpkVldlMithN3ZsdmdCTVRrMktZbkc3Tzl3YjBqcmNXMkl5YlE5Z3RwR0FR?=
 =?utf-8?B?NVNORkplVkdZNVZMR3Bzb3hJSEZidVl6ekNLQW9nMm1OR2E5YStySHI2MmNY?=
 =?utf-8?B?MkdMRFdPU05WSGVvUkphSEw2QWRPVzNvYW5TOVd0VU1tWW9KaTBnTldtbkVv?=
 =?utf-8?B?UitxZFppK0gzb0VPbjA3TGlRenN5dUVnY0s2bWIwZDNidUdmVFZMcGJrOWg2?=
 =?utf-8?B?dU1TODljeG1XaE1DUGR3b0dSc2g3ZU5qMXJHWnozRTZ6SklqeGdjU1lIMEJG?=
 =?utf-8?B?eHdFdTF6TXpveE85dzJIS04vUWhvajltZEdNQ2I4Z1RNRGg0R0pLTGpIZ1la?=
 =?utf-8?B?dVFuWjM0Mkx1dEtxSnAxMGhRT1M0UURFOU5VVElmY2hhanFBQThzUS9BNGJG?=
 =?utf-8?B?RmRZK3RObVpOaU0xdkV1Y2YzNjJyM3ZydjVRTEM1OUhJN2Q2Nk9nZ1B0dDR5?=
 =?utf-8?B?cHdIVFZaeDROc0tHOHU4d1h4Nnhielk0VVlNeFdsWHVqcDliQTdYY0p4Q2lh?=
 =?utf-8?B?QzYvV3p4S0xpcUNDTlQwNC8yTG1nUSs4YW5SakdpWHNDWHc0bnJhbnptL0x2?=
 =?utf-8?B?eU5oVnlWa2xjbGI3VG1RMDZDOVg0Q1RqUHdjc2xTKzEwYWVua0ZaZ1hVUytW?=
 =?utf-8?B?SUhXWGdJTTE0TU9JQVUyNE5zd25oRkExK0dXSUgyRk1keEhhNTczQU1Uczc2?=
 =?utf-8?B?Sno3V0V0d01jS09KaG96ZmpHem5jZy9XT2J2ekV0bzYvUGE3VENYY1l6bkpk?=
 =?utf-8?B?QzYyTXArelc4S1k2Vy96VnhuNnZING1NSFpDaHZOUjNBT1BoN0M0dkdHL2pS?=
 =?utf-8?B?aU5vMmRlM0xodzdrWTlSUUs0blJTYjJpNVJDQnAwYnJLQ3IzSFYwVkR1bHYx?=
 =?utf-8?B?ZWEwWFBURUR6clg4aGpsd1lCeE5PcW5zL01zdzdIU1kxNnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 13:37:58.3269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b17e12e-826e-46b0-afed-08dd089f6172
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7835



On 19/11/2024 14:32, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
>> On 19 Nov 2024, at 11:51, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> At the moment, when printing memory ranges during early boot, endpoints
>> of some ranges are printed as inclusive (RAM, RESVD, SHMEM) and some
>> as exclusive (Initrd, MODULE). Make the behavior consistent and print
>> all the endpoints as inclusive.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
> 
> Looks good to me!
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Outside early boot there are other places where we print exclusive ranges,
> do you know if there is any general style we should apply or does it depend on
> case by case?
Yes, there are other places where we print ranges with endpoints exclusive or inclusive
but at least they are grouped together. Here it was quite confusing to find lines next to
each other with different styles. I don't think there is any specific style we should adhere to.

~Michal

