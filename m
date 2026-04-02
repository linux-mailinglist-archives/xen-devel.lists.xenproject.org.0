Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPDZD5gNzmmnkgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 08:32:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8C238483B
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 08:32:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271121.1559411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8BbX-0003NK-Bq; Thu, 02 Apr 2026 06:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271121.1559411; Thu, 02 Apr 2026 06:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8BbX-0003Km-8n; Thu, 02 Apr 2026 06:32:35 +0000
Received: by outflank-mailman (input) for mailman id 1271121;
 Thu, 02 Apr 2026 06:32:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w8BbV-0003Ke-Tu
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 06:32:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8BbV-0056TE-A8
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:32:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ce0d7f-5cb7-0a2a0a5109dd-0a2a450ab40a-8
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:32:32 +0200
Received: from [52.101.56.45]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ce0d7f-ee98-0a2a450a0019-3465382d165a-4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:32:32 +0200
Received: from DS7PR03CA0173.namprd03.prod.outlook.com (2603:10b6:5:3b2::28)
 by DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Thu, 2 Apr 2026 06:32:27 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:5:3b2:cafe::b9) by DS7PR03CA0173.outlook.office365.com
 (2603:10b6:5:3b2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Thu,
 2 Apr 2026 06:32:27 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.0 via Frontend Transport; Thu, 2 Apr 2026 06:32:27 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Apr
 2026 01:32:26 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Apr 2026 01:32:25 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GX7x/VnYTFxVDSGk8exq3wko2W9s3YW/uTpmw3eCoe1UcEtFiNIs/Eq4BNfetno14JycswZlUx7vYJ9YM2k3CizM+G4nIw8G3XwgAR0E4MH/m87ISFk3xACvSsg7Cmc4Hq1pAcWn51Q+mD+q80tD9lvnDw+liGjT40cx21s2PtkyijTfBQCN9tS3tcDbq27mUY5zw4UunPPX1ETjViIJT63YA3fa2uCJXvmegSM624fKItWEStgQuH9H1TuMotmhA2qP1dbN+37UK77Hg5PH1H48wgsVrOZSIzc2bxcQALGeU5gop61dZ2rQ/vg0R7xkBf6E+aPRs+LDojZwk8NaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yf/Fj9NGf9DFpMm0y6U37tUWNDfvgAqG/ER6cYBwdM=;
 b=X+WLmrQx4W/HjtgxDDFPx4N8dYiVOOxm9bfhcp4AxhNb7OakcWEAcjOY8jWG2YBSaIdqyMgw+7un/v/8i4J2w1k8IysZ7lM6XoVX2SRzoq+SBDownYd2YktMNKz2cqzU/FF61iCI8ggA1vFxfFYfK7SgUn0K7dHG/hYGWJD2xiT2zLGDC16HgRH8JroB3LlXhhInjcehs6BpOG54ZiaUudi47jA+8g82nuETnabuoNJN1O8RGwuTLhw4BXenTLpWrErdFMCnWOpstcBhOqxk2o2xXSPks5GkuaZh3VivOE1zVN98wrYWDvA1zFHMJiCyZ27vWpMtYBfeKElRtnKP2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yf/Fj9NGf9DFpMm0y6U37tUWNDfvgAqG/ER6cYBwdM=;
 b=3BDpkhFTWagmodImbQK0JrIGzyu2xmhifuQjG7OUE7vfayA2EwxnZfHPGTap2pBuThpqynyH+hFVHmIPVMFyzp1WqS3lOwFy0ToxeYNBgopPu9HluTLFNVExVphQD5h0t/K5IXbgMqbLdUj3fnUGE5DJw49aLxFgNEL167XC7Yc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <bc80e004-25a5-449f-b4dc-a6afb8dc54c7@amd.com>
Date: Thu, 2 Apr 2026 08:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm: vpci: Move content of xen/arch/arm/vpci.h to
 arch header
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
References: <20260401145816.169557-1-michal.orzel@amd.com>
 <20260401145816.169557-4-michal.orzel@amd.com>
 <e21642ec-ad45-4a61-8482-768ee666f438@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <e21642ec-ad45-4a61-8482-768ee666f438@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|DS7PR12MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: ea30c74f-5bfb-4ea8-1dd4-08de90819bea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	I8SiPHXfsr4GtcjRG8WObaGmipr17DDfx7iEy1G0AWPnHRnsvFpspRFBmxN5cTocGmjp6cjn2YgRTIqR3YLscDK0GBP1Vk9+98y8UDdJIJzd4V+1T1y1TOpLNpF3KMQnEVBQJzmhDJ6aJWoLZsWQLaqlOl6dE6RCf+oyxLLOB/YanlXJghIrLb3LYOkyWmsrLV5TZFBoyeSUtxyu4saAlGP9yQj7jGAyHB1saRMtEqaq04VL5ms+gvqkyfPtgUvr79kRqDhXezSRCB/UqG5+MupJJBGrmNwZRr60Yw3DctB7nF8ULQ2xv+J9VEoy407D4JfbEBj9evv3kGcR/0gV64uQzpXi5vlILsRv8AJ8JOg1VQwbK6REtx7hYeTuHwBgyQS48YfXvuNsiZCycncvWFGPEOkCtyb90QE0u7KVzVDkrBxgSKX4LDGSWwux39wQto6Cvy7OwT7Bjd3hdZgd8yoy6OruYM5cXk+H7z+AWhyl+xTxK/K/ld624idTPDcSXz8Zdu9jtyIA52p8atwh9KRfLjTp5sTm4KO8RIxrirUA44dqtH5iAfSY+9nUyYdclqkrTorBQyuFnpdoCJDDIJwHFc/2EV6zYY5v+u/NCfDNeWSSDJXYaEnSD2IGALYgnGypvmOq3HwzfbSJoFYtDGdE3Pba3++kkuZmnhNnIWujkynv0N/qRz6Ep37PuJzhb42mXeTxU4rRttWAzOYAQkQ5U1ryoHYgIfW2rX5Z8xU/NdQsILNbMEVKelWlm2L0jHopgxmIX5dwRSQfoIgBlg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aokqyNAL0ooDn7IOE36lPnh+XZQT2U3MedEYYfvRRp1aDSR75/aVlhrm7IlXocUn8425z/UbTQ1H4kWWesh0UrYxP8WVGGl9uWzqJ5+sRvnMMdnXMPi1Kh1JI35XLfUjRDhb6idZ94RUMaQqAEH0HqgBZXWzZdzm8g/NwaT03lxBXYhAiVVrqXuEENWgES7zcUh/PE6PR2XaZz5+PzEJfR8oIw+Ae+ozzLczeUIS+16MK0PfQ06cAAkiCcLqes6zDV6Py26BJdzfUSLs8fC7tNNgdRvsUWTYXBo+RIHY0SAFI7ly1n7xzTCnd/zOFbbmyA1HMjBfMu3FUlhSQAUR1BJix1tNmYJkC84JBgUTCImyGHum6BQdlmQ22HJqJNpkL2nDuMToYPXxqsT1rfdgvfh8ep2AzmGCjCbPi21lsF84JfPWnZPVIYuylFyCyNVM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 06:32:27.3620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea30c74f-5bfb-4ea8-1dd4-08de90819bea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814
X-purgate-ID: tlsNG-4011c0/1775111552-C481C0B1-5DC809E6/0/0
X-purgate-type: clean
X-purgate-size: 1957
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:rahul.singh@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 9C8C238483B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

+Rahul

On 02/04/2026 04:44, Julien Grall wrote:
> Hi Michal,
> 
> On 01/04/2026 15:58, Michal Orzel wrote:
>> Move domain_vpci_init() and domain_vpci_get_num_mmio_handlers()
>> declarations from the private xen/arch/arm/vpci.h into the public
>> xen/arch/arm/include/asm/vpci.h, and remove the now redundant
>> private header.
> 
> Can you provide a brief explanation why we don't couldn't include 
> "vpci.h" from "arch/arm/vpci.c"? Such approach would ...
Yes, we could but I think it's better not to use local headers if the main ones
under include already exists. This matches the x86.

> 
>>
>> Update domain.c to include <asm/vpci.h> instead of the removed private
>> header.
>>
>> This ensures the declarations are visible where the functions are
>> defined, resolving a MISRA C Rule 8.4 violation.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> I'm moving a file with GPL2+ license to a file with GPL2-only. I consider this
>> ok in this case becase the copyright on a file with just prototypes does not
>> make any sense and a license text was most likely blindly copy-pasted like for
>> most of the files in that era.
> 
> ... avoid the licensing discussion. I am in the opinion that it is ok to 
> move from GPLv2+ to GPLv2 because the license says "either version 2 of 
> the License, or (at your option) any later version". But I remember not 
> everyone agrees on this interpretation and we never solved the 
> discussion on whether we need to request permission from the original 
> copyright holder.
> 
> Alternatively, I see this file was only modified by two companies (EPAM 
> and Arm). I see one employee of each company are already CCed. So you 
> could confirm with them if the change is fine.
The header was introduced by Rahul Singh from Arm and Oleksandr Andruschenko
from EPAM. @Rahul, @Bertrand, @Volodymyr - are you ok to move this file to
GPL2-only?

~Michal


