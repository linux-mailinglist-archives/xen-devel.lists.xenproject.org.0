Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INwiJwn0lWlTWwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 18:16:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0BF1582E6
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 18:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235882.1538720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vslAB-0007bM-8o; Wed, 18 Feb 2026 17:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235882.1538720; Wed, 18 Feb 2026 17:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vslAB-0007ZP-5K; Wed, 18 Feb 2026 17:16:35 +0000
Received: by outflank-mailman (input) for mailman id 1235882;
 Wed, 18 Feb 2026 17:16:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4Gf=AW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vslAA-0007ZJ-4I
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 17:16:34 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91e808fa-0ced-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 18:16:32 +0100 (CET)
Received: from BYAPR03CA0007.namprd03.prod.outlook.com (2603:10b6:a02:a8::20)
 by DS0PR12MB8562.namprd12.prod.outlook.com (2603:10b6:8:164::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 17:16:22 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::13) by BYAPR03CA0007.outlook.office365.com
 (2603:10b6:a02:a8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 17:16:22 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 17:16:21 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Feb
 2026 11:16:20 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Feb
 2026 09:16:20 -0800
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Feb 2026 11:16:19 -0600
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
X-Inumbo-ID: 91e808fa-0ced-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkPMFphUQVi9e6Pk/K3A5+59FgvQ8JzLjzkcIvmlODy93rM2AUd35UgQI39oqkLqKHwQhOO2DbBmIe6eoaCH2aKVmVHNrA2a19zlaquW9vCUFoCs1aTni30m+WEN8dmsTSv34Yj37vTuJNoewi76KSOvyzRQOrl44eDAGr1uPnOqfdu/gTgsnNPDFg4VVSTe354aPMuYZv5yqMk4Z2Cwnm4hCVrOR98qXV979wd1X9f8JosMtMniyE1WV/QDQtq71hidhv3cQ1D8gxywKJ/C8P42ftEm3iV7ucHp0Fa+Zscxy7APEzYs11Uu8m8um96oo95t3hqU/oQ7uyX/SdQeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVEs37iEICqA10CmlFdhVS6mAF72WkIANr/RNcX0KiU=;
 b=wq2bOU2ULSnONoHC/Pqa3S5kP4nZUhnCWSqe8G+VxfTu3T2ekfvTrQP9QhgBnh+Ry3wNiCn70b5yxOfwejVrpRzmQirH7OXAXzfjgBqQeK1U8VAQhtrXCN6nMTUZ5CHCccNY/c7eN9JNJU/XnKDuIOFIJZ9I6AbJEntQVwHLTBip/KJ4oU+drzePJb3XbBmUGzClDpwYIksYmETtNTkRmPY+novbTblsIjXQzvpmqHNZgATfhDvlivHzzo1bgQXDCQHGpJ2wdEOoUsurLY6XYEiA1+9thfXO6JBw/+GhAptp7KSXr67i9S89w0dCnLBasqIm42HdtZpLxoYm9ApGfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVEs37iEICqA10CmlFdhVS6mAF72WkIANr/RNcX0KiU=;
 b=Cwk6jgpitCm+Qxia4LtcEo5XRHPrV1FiEi5ImG/myeIuDCnQJLR5FPLEZAjDegW/RhzzCgQvb/iBv4l8VbeRP14cIfirpKIAzChLUbiN1dPNcNzHs5ZwveUNAN2tmKQuw5feh3KFCBBaOcuMdbtVSc4M8dMJ+fKtQYrc8eC0WOY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1e8f9976-b0b6-47b1-88c0-690d4f1589ce@amd.com>
Date: Wed, 18 Feb 2026 18:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: fix unmapped access trapping on GICv2 hardware
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20260205190128.38716-1-stewart.hildebrand@amd.com>
 <f91e0f7e-9afe-40bd-8e44-4aadbdf8e4b0@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f91e0f7e-9afe-40bd-8e44-4aadbdf8e4b0@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|DS0PR12MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 859e8b51-1303-481c-7ea2-08de6f11700c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDFCb1NPZHZtdVU1bGQ0aWdUQmlWUHFzZm5mWHhSYkRZUHgraVY4NEw3MExo?=
 =?utf-8?B?ZnpzYlpFcXJuOE9CNzVRNjhnTkFJYmlINEdwZ05kdjRGZzRDdCt1dldiVTg0?=
 =?utf-8?B?amJSNWZKcTA1YVIyK2RTbTFicEZKdEl2VUNYeWVEalFyQitrak5XWC9HcGlJ?=
 =?utf-8?B?bzkvQVE0SGZHS1N4MUdjUWxyQjdJS0gwOFdLY2NFQ1BsUnpJQWM2TXJYOWUw?=
 =?utf-8?B?RkV0ZzRZZnRKaXhkTXlSTzA3TFFSbXVPK24yN0c1YmdNTlUxc2hqd2h3YjR4?=
 =?utf-8?B?NTlOOTQyVmd4dnpDQzA4RnE0WXVBZzNZd1o4eEhOZEhTSGtSam5ZenZEUFhX?=
 =?utf-8?B?VHZ6YW1OZy9aU2I0bDdNSGROTTFsRjIyOEsxSTd4TXppNWN0VVRLbDFHcE1p?=
 =?utf-8?B?Rlp5NkJyV2ljN0duV1dwZXhPOGFIZjJNdmJPYWhxbWtZL3FxZGpoYm56R3BB?=
 =?utf-8?B?c3pTUG9nZnpLQmswRU4rYnBEN3NxeWE5SVk5TXRSYi94SmkyZHFFcGdrWW1s?=
 =?utf-8?B?MkVabEsvK0l5VkVxNFFPODY2d2xlMDFnalEwWFBNSUx3TERMUnM3NEN1VU1t?=
 =?utf-8?B?OTBnTEhkWmsxQm0vMVoyRlN4SHpCY0dKZFRvRU1lVVJUaTVHbXpXUEZ1b3RE?=
 =?utf-8?B?M3EvUkxwMERhR1BDd0xsRkpkWFV6R2ZsaUdNYlpLZ0Y3Zzh6UUV6ZHVEOXkr?=
 =?utf-8?B?a3NLdm1qWjFCaTZHYXJBNEg0aTZ2NlpWOFdnTlByTVJsbWx6UXRaY0Z4c2NB?=
 =?utf-8?B?WDBWd1ZHSkpGNFB6bHZCVjNIOHZPUDhoN2JTV3llVWRXakp0eVhldzAyU21I?=
 =?utf-8?B?MHZ2cFlJOFg3OXNHVXpKSzJKUzE0ZklwSnE2WVhNM1ZaN09zQk1Yait0ZUFm?=
 =?utf-8?B?ajNmZit4S1FvNE00MWtHMHdGdEdWSGx3U3ArVlNkdEZyMS9Zb0FIL1FKazVO?=
 =?utf-8?B?d1RCSFdqYkdvV3gwZ0FaKzdueG1CUXVZcDhGaGlqV1Z0blB3a25yYnhlck9G?=
 =?utf-8?B?cms2Q3lHUlN2bnZYMlhkSmlsbCtHNWhyR2hUWTIycmllUi9KMW9vU0hvMTVN?=
 =?utf-8?B?UlVyM2RReFlkcVFUcjZTU0ZiNU5IYUw3M0dvUnBHMVU3YzhLakM5M3NQaHQx?=
 =?utf-8?B?MTNlSHljQi9IczdleDI5SjBkcFcxYnM1NDdJb3lrSkM1b0c4dTR0Q2RhT2J5?=
 =?utf-8?B?dFF3K0ZmOU1KVW5aWkZlZzVaUUZXQmZGZ29pM1R6VlFSUWJaTnY2K3BOaEds?=
 =?utf-8?B?VUVJbDdSUlN5MjVVWWovS2RJMTlGY0VWd01JYWlKU0dITTdzNFB4MmFWWXQ1?=
 =?utf-8?B?ajJhS0NVS0YyYjhWTmFKcjlMSk9uYzlmVFhvM0NQYzRJa1c1c3FPclJoMUth?=
 =?utf-8?B?WFNCWlN0WlNGblZHaE9MdXNxcEtKUjU2MXovL0QrNDArNkxNaWdlMmlJRExF?=
 =?utf-8?B?WFQyZVZISTFnbW85eHd1NXdmSU1Ra2FBMDJSYXdkeDVOSlBzeTlyQ1gwUTFC?=
 =?utf-8?B?anR1VXZ5MldQdFRzV1ZqdGZOc29hcEtDY1dFWGkzYncxenoxWkJPc1RkR3d2?=
 =?utf-8?B?M3BoNmF1OGpzVTYvbUorTXd3dnc4Zm4yTWV1MGo3QlNGaGNrVitteC8vN0N6?=
 =?utf-8?B?VnQxMHhvMHBRS1l4b3JoUmxSYTlMQUhVdTliSkJpYkRyL3VwVFp6UHpYWWZV?=
 =?utf-8?B?YndDTlFuekZXY0dPTGdYRENCQUNFaWd4cVhJUi94RzdtR1l1YXVIMG4zZXZM?=
 =?utf-8?B?ZjZDemM3QjlwT0VXa0VpVFhldG1zSjhVQ2xNRjEveFFOSllacXFOSTF3dmJ2?=
 =?utf-8?B?TExnck5hV2R6TEx2Vlk0cFFyY0RwSXdjM0RxL2p1NnBxYmhLc29zQ0JVY0Uz?=
 =?utf-8?B?NDdTK0VSeHNJKzI3RWI1ckkyWmM0Y1M3bCs3RGl5ZG5ETHdGVDRkNFJFaGxJ?=
 =?utf-8?B?ZHAyVmFBSkN5M3VUVE51ZHkwakw2VkgvSzdTaVprSEZQd3BQa1NUZ0ZBUmJi?=
 =?utf-8?B?WWkrTTd6M3Z3TG5jTjBqNE8wdVZZWDJoQTRTT2gvOHBwS0FySGxPYytSVFFP?=
 =?utf-8?B?ams3Mi9NWjZOUlVUWEJXUDFvKzhNMFJPSlVOQlI2OWpTV2VLMGg3eHdvYlpp?=
 =?utf-8?B?N3RaUnlPNndCdDcvRnBTVVNrRU1vb1I5bGJlWFVlMVJPekxJVXVkS1VGNUFI?=
 =?utf-8?B?eU1HUG9lVUZjeHMwRWplL2ZtVWhDcG9GdnZNTnNYaGViSnphR2RjZzhKZEhi?=
 =?utf-8?B?YWxHcEh2b1c1Mjc1eEdGK2t0NElRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X6P0wmkyf8IiEt/nlUUy2Xd2uXAPXevoy6oWn0jHnSoI7MHBJqFvYClf4Z+NaLzxqqkPNgibdw5/krAVfPX6J6AIbaOv4feaRwGN/8aYIG47DeYxJpzhtZzWZ0ccS1woBM2FyyXWOdBMhw4Zgw+jtMFBMibUhajDT0BqzwMFYur4zfWrDwgshCIPIEgCiVDX/Ke6FSI7Dnx6yunwD9G1KVb39/4rk3IffOS1uR5NsLXIvTeSPqBgWH9rYq7CJqQoxrtB042lWeiSvDwMsyuFrMbpnO2/CHST+aTx7a8k04+vcNOmIhEv8w5q9dQXOSxS//ZjnemXC4cWP97UKlyRn8mo+9MJm5Ytr5aJmmawcjyR2WAg3nwfGLk5yIWnUD4RTrRSiiaklhaQ/UIQ1v6SxOQJpArrW+9awci/p9122DGEu0ADdQuuLAahWtxqWfX3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 17:16:21.6841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 859e8b51-1303-481c-7ea2-08de6f11700c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8562
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 0A0BF1582E6
X-Rspamd-Action: no action



On 18/02/2026 15:21, Stewart Hildebrand wrote:
> Gentle ping.
Sorry, I'm quite busy these days.

> 
> To be clear, domU interrupts with vGICv2 are currently broken when
> XEN_DOMCTL_CDF_trap_unmapped_accesses is not set.
> 
> On 2/5/26 14:01, Stewart Hildebrand wrote:
>> Since 4dbcb0653621, the vGICv2 CPU interface is mapped in a deferred
>> manner. On domains with XEN_DOMCTL_CDF_trap_unmapped_accesses unset on
>> GICv2 hardware, the vGICv2 CPU interface fails to be mapped. A visible
>> symptom is that a domU gets stuck at:
>>
>>   [    0.177983] smp: Bringing up secondary CPUs ...
>>
>> Move the 2nd check_p2m earlier so it's prioritized over try_handle_mmio.
>>
>> Fixes: 980aff4e8fcd ("xen/arm: Add way to disable traps on accesses to unmapped addresses")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
I investigated whether the reordering is safe and it looks ok:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


