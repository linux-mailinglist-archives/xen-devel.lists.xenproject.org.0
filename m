Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AINwAg2qqmnjVAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:18:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0CD21E925
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:18:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247566.1546135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vySGO-0001Lg-C0; Fri, 06 Mar 2026 10:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247566.1546135; Fri, 06 Mar 2026 10:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vySGO-0001JI-8c; Fri, 06 Mar 2026 10:18:32 +0000
Received: by outflank-mailman (input) for mailman id 1247566;
 Fri, 06 Mar 2026 10:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfUi=BG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vySGM-0001JC-Dz
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 10:18:30 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d13999ba-1945-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 11:18:28 +0100 (CET)
Received: from BN9PR03CA0610.namprd03.prod.outlook.com (2603:10b6:408:106::15)
 by IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 10:18:24 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::87) by BN9PR03CA0610.outlook.office365.com
 (2603:10b6:408:106::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 10:18:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 10:18:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Mar
 2026 04:18:23 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Mar
 2026 04:18:23 -0600
Received: from [10.71.193.38] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 6 Mar 2026 04:18:22 -0600
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
X-Inumbo-ID: d13999ba-1945-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsMPAvc714BoDP31KokAY6Hchxukt089s6vIp/SqO/DqMWGuVKwIiH1eQqxcUMp+I5LTQw4MTZ64LKhhIF88p4AlGdNN3mHt/UxC4FEZvcTJMWZXQT060MSFu1i030MlR9rfmUkRhig3iPoRKkEwRApmxyA/CFq+22iH4Y9hvOmcwCamqEMy4ygbhJCGQGEfNbClkIMdAe1smXpLxMC8YpuM85G4WnDuxjzpMSNp4vue4GSxmMVD2gz1irHBIwSOlN3d6C8TKoSeYqOJrhIdRzNxwkPMpIbbhzyDZCk2xARJJjcfAgMsyVajMTM9GuGrm79N0y/udnOuI17rl3qBOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHJpJPaHeMHdAig7u/9nZjXOciwLCEHjlAbgze5OIEU=;
 b=E2bmtWgfoGARZLv+97nr56GW0YPLKXWOWWErD2ewoVsyVEblMyjh5YKOu5DNsUVwM3iPVep+ESEWnPOSOIfVpL1sodZBjc70VtbMTJHzvh4GLmEorPlA2qdiWC/p9zeXB/iSyX0oieOaNMDJIf0pRQRUuLg3q4Z+HkKiVjXQ4m89rzmObEpu6LS2oawS6yDXhhG1bkNlIvBYzlwTApoexAlnrqU/Bl/fKlmAayOua/aA8QMRZZhotciE5Y5Rb1aALENMIoeAqD2OLWGiIbEitcj+PbuNTgDyp3i9kzljQI5435nSreu+6poN2xmP0VNBaUTWlhZYc3F+NA8wcC5Jcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHJpJPaHeMHdAig7u/9nZjXOciwLCEHjlAbgze5OIEU=;
 b=J+PwdjOBGUE9TcMCntrvBzGUNQlucsW3rZwMgwhIuMeGjn2yiE7ttG/pfBCnojFbzi7wnTXNT6Nsn7QIrODDxCbEbnnSV+ojZOcS2J1d8uN0mSm+4DzckkgXeE/x39Ka1X3uhX7GtP75fy0HDyaTWSPq4DdCzcTlq1Mpgu4Uui0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <35c87e08-9b4b-4d1b-841b-17273aca4ace@amd.com>
Date: Fri, 6 Mar 2026 10:18:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm/gic: Optimize lr_mask type based on GIC version
To: Andrew Cooper <andrew.cooper3@citrix.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260305195745.2595017-1-ayan.kumar.halder@amd.com>
 <4d81d177-f1ce-49e6-8a40-fd16c0b4e0b9@citrix.com>
 <a28b7631-f760-44d1-ae66-3f957e9b04b5@amd.com>
 <03c91d39-86af-43c4-a14f-c6514b778344@citrix.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <03c91d39-86af-43c4-a14f-c6514b778344@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 339dfdcf-e850-4260-1065-08de7b69b339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|30052699003;
X-Microsoft-Antispam-Message-Info:
	DaXK4007siBxVnfx6k/XgrbTGfuN6teBRp51osLVNEdu3mCVQaj3axOUuD1qRb0D1mIs0hY/yBAyq+tfk/b1oREcD0y9qCFlsKXn+OTYKcMHxtvS2PGYCImK3de2ogOJQ1KnbRYxaKd6RGpzS/npa2YO6cT3GjveWQNojKgLNYETPxkS8LWxvcBD5idwasmRwRQsN/qHpT9obWNf0Ye4kV+AUgGuuWztqvP8LPQZFv+Ql+4bJnq72qAp2G50P32rDHTXk2pu4YRlMmXOSolj4RavYWPxZnv46m7Y5Ju3Cs9xIcTKWAQwJ6jOz8l4myShufiUsvssJ9oxUbI36wBOXaA+ZXGajzzQ+co6aBK93TWDjcTU9KNm59CAeotExWSY1WYXXgYSEyzGh4aESPx8D8hPvbrFNtq8DHITkKSyUSaeRli9SYco1TUqTyu3RvbBv/hxP4qdQkkl2PYhACSaHGomVeTJB/UeZkdWehaG+kbS9nOh9Qm8DGSJbuk39hc7e8UH1k5OZgbJKdsuGWK9rngYqt5ColdJCXsd0KdBr25BHZACb3FrSLQC3mzZ2LJdbw2zT9xudUIpI69rBaKDfbvbMTf3lt08YeROrYDmW+2QkkRxsh8Li25rnjeLXkzvVKfHhomoUjrvvtWGBTHx72vQmrrL+PyjCArlF8Uf3huYWpFNULDRKJq/TXyS69QR3SGqdb0MI5CA7BjtQVYWcLnldgpy2Xfi/1JmsMR9g/lmpL3V8beSFmDhmxLHbeBlhiAST33Gkbc8Qr1zHlVieA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(30052699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NElyCCOjy9YVKapH6Kov+1jW3eb6JrYRm74fUikaVLKFcb6P2Ji9L4YaOgV3sFh6Bv6+tRF3Gx/ARz7oKyxo7BiG0UZizmARdkMoBTws9RZ1MJ/fyN9riPGWVwSDhha8YmoU80FGHdS5UmTK5k1tGB/CejRVyB7CVlsZuh/TpvoDylhAqN7VAKBJw6s/1HQPmiYIsgtWJAVFYDBihQ4oyPEcNh8W96BeJ1rFC11h6hxx2SmDhgvMG5bRqOIG3x9eKRclT8fMpT7QK+nJyLKSkZv/OKvORD2aVi640kiwXkf/5l9EEbdEVC5jDfB8S8KfAtNgrWJLDmNklidbZ0odA5/aelWkyI79qwCRFrqRBkjZzLJxdqWL92JEWNey/+ICSq6AFaXK9aan4le7o3sovwdhcJ8uavm3RrhP0mIFzzb81mnle0fhuHF0vxkwyVz0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:18:24.1402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 339dfdcf-e850-4260-1065-08de7b69b339
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312
X-Rspamd-Queue-Id: 6B0CD21E925
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Andrew,

On 06/03/2026 10:02, Andrew Cooper wrote:
> On 06/03/2026 9:59 am, Halder, Ayan Kumar wrote:
>> Hi Andrew,
>>
>> On 05/03/2026 23:01, Andrew Cooper wrote:
>>> On 05/03/2026 7:57 pm, Ayan Kumar Halder wrote:
>>>> The lr_mask bitmap tracks which List Registers (LRs) are in use for
>>>> virtual interrupt injection. Previously, lr_mask always used uint64_t
>>>> (8 bytes) to support the maximum number of LRs across both GIC
>>>> versions.
>>>>
>>>> However, GICv2 and GICv3 have different hardware limits:
>>>> - GICv3: ICH_VTR_EL2[3:0] encodes LR count -> max 16 LRs (4 bits)
>>>> - GICv2: GICH_VTR[5:0] encodes LR count -> max 64 LRs (6 bits)
>>>>
>>>> This patch introduces conditional compilation to optimize lr_mask size:
>>>> - CONFIG_GICV3=y: Use uint16_t (2 bytes) - sufficient for 16 LRs
>>>> - CONFIG_GICV3=n: Use uint64_t (8 bytes) - required for 64 LRs
>>>>
>>>> With this, parameter 'lr' in gicv3_ich_read_lr(), gicv3_ich_write_lr()
>>>> cannot have a value > 15. Thus, it should not possible to hit the
>>>> BUG() in the default case.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> What does this actually get you?
>>>
>>> Because it doesn't actually eliminate the BUG()s you reference.
>> As lr is obtained from lr_mask, see the snippet from gic_find_unused_lr()
>>
>>          for_each_set_bit ( used_lr, *lr_mask )
>>          {
>>              struct gic_lr lr_val;
>>
>>              gic_hw_ops->read_lr(used_lr, &lr_val);
>>              if ( lr_val.virq == p->irq )
>>                  return used_lr;
>>          }
>>
>> If lr_mask is 16 bits, then used_lr should not exceed 15. That is my
>> thinking.
> Sure, but what does that actually get you?
Right now, it just gives me a justification why a certain code path 
(invoking BUG()) will never be executed. My aim here is to reduce the 
chances hitting this runtime BUG(). However ...
>
> It doesn't get you a compiled difference.  It can't DCE the boundary checks.

if there can be a better approach, I am open for it.

- Ayan


