Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDtFN136gGn9DQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 20:26:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFDCD080C
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 20:26:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219042.1527909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmzY3-0001no-QO; Mon, 02 Feb 2026 19:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219042.1527909; Mon, 02 Feb 2026 19:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmzY3-0001lE-Nc; Mon, 02 Feb 2026 19:25:23 +0000
Received: by outflank-mailman (input) for mailman id 1219042;
 Mon, 02 Feb 2026 19:25:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=or01=AG=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vmzY2-0001l8-K2
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 19:25:22 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e84af554-006c-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 20:25:19 +0100 (CET)
Received: from SJ0PR03CA0139.namprd03.prod.outlook.com (2603:10b6:a03:33c::24)
 by CH1PPF84B7B0C96.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::618) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Mon, 2 Feb
 2026 19:25:12 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::72) by SJ0PR03CA0139.outlook.office365.com
 (2603:10b6:a03:33c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Mon,
 2 Feb 2026 19:25:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 19:25:11 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Feb
 2026 13:25:09 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Feb
 2026 13:25:08 -0600
Received: from [172.29.134.248] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 2 Feb 2026 13:25:08 -0600
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
X-Inumbo-ID: e84af554-006c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvPaJymNv9kZAR7wyLAH8lkNWQ2Dnj/bJQXAfGB4rWeDBVZILVSszxjK3MlkN+eBS07Ecxm7cmNbDj3YeWhbrw8RZepfisvvEAK49/GYWecWk59y/wqJ+V0EBsUdhKHPMqcSsCe7FDTARqsuzx+kfTl4KloJpmLuUmsfG5G3JlpYaJgrqUB+py8kBfhiJPqTrxjn59DQ1Xr5IyOr2bvCerGfsrDwurnDVf3m/4kuD4Bnh0iObsPcdUCTAOauzcoyBakPOQ/H2b+JVoNdvEVig74xZoFPO58vGZ4svSo7p01JnZXle2kTjChWgpzTwk0iMh7r46biVLk6E563xiM00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eP6TObi5ievRRwMq0Abe8fB/0Bu1EJ+pbuVvoJVO4Dc=;
 b=FMvkVKmlllKk80zPdLnPENjazHTaieGeBoA/zq26mEJH7KXeBb8pzh8qom/0tXuR7srJxWfYZgIFmBzHJQ0xe+LZ1RNrI0LCRhZGAt7hf97pWps1Qn+44vt+gFkrKIA8UPl/eYuphEhDOCg/1Ne6t08ji0M8ca1oqzHDt5MjQw4HPoqTLQxno23pRoNbLBGg+XZx7SoS3wrhBr5IqYuuCwtVuAvA8KyN7i5Re1yAgOifmZzjcXgZiq85+tZ+aHSKzpJKOzxf+66MC2DAxUYbq7PvuVR91S5zOGfE1TO8CyGl38mYIT1QEFS05Qnk5YaIQGhoFjUwWWmFVOswV0ZGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eP6TObi5ievRRwMq0Abe8fB/0Bu1EJ+pbuVvoJVO4Dc=;
 b=4GbQbbgisdhRqFmJttki0KX6rGb0Gblxb9NrlwitTocxYO6i9M6LKQ1QwM3BGQhWsJVva4KIVFjA07m1Aeahu2UT0pe0/FpD4KCPui6tnikQizeYZy9BgVRmCdzFPv22ZaXr0RaSGCoL/NyQl0CcgTiBbSQsg4iH1GMCip8Dir0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <6e246a66-e5a0-435b-9be6-60f48b15b524@amd.com>
Date: Mon, 2 Feb 2026 14:25:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] x86/PCI: avoid re-evaluation of extended config
 space accessibility
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <a0b10d39-daae-4fc0-af42-a3794a96f9f5@suse.com>
 <b63b0f9e-93cd-4b55-a7c0-f8eab9df1947@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <b63b0f9e-93cd-4b55-a7c0-f8eab9df1947@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|CH1PPF84B7B0C96:EE_
X-MS-Office365-Filtering-Correlation-Id: f16ef799-0391-479c-2305-08de6290c8ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3FNbW4ycjBKdFJndUpjajNGL1YzNThmb05BYUZUWDUzbENuV3dSZzhSSEgz?=
 =?utf-8?B?Z0UyQklIUUkrV3R2Y0M3S1dXejN1NVZpM0RnYWpQc016aFZHYnU2R2FJY3pV?=
 =?utf-8?B?VDAwMGVvR2EzT2JhY255M2s4cHV3OUMyUXJrS2tuYUFHNWx6WnhmL0RQczBW?=
 =?utf-8?B?aHAxY05CWk50Wld1cGpiK0FKRVc5cmRPSG4zZ3luWWNObklST3JobTNDOCtH?=
 =?utf-8?B?eXlKanUxTVZFc3p0T1cvOUI1Nm82RXd0L2J0SllQTnZYRVJvU2lhNmM4VUpD?=
 =?utf-8?B?T3RXL2crdFNleVBpQWRmTUY0WXZXc1V2SzJjZ2sxQXdPZEo0NU5xQW8wZmhH?=
 =?utf-8?B?VFQ2cUxIQkMxcGNWbXZpaURzK0pZL3FxOVQ0dElJTEt2cnBFQjZLM1MrTzE0?=
 =?utf-8?B?SEl6MGhKUnE0SE9CM3BwQ0ZobVdHMGxyV1FLdUt2S2s3dzB4eFdkcWY0SlVj?=
 =?utf-8?B?Vzd2WmhNSWVxVURSQm5lUDVnSEdpR1o0UG1qY1pBcTJIbWNwTmp3eS9BamtV?=
 =?utf-8?B?ZGNTbEZjTkIxRW1VRWVGZ1E0empuU29sUG5ZSFZkWWRlYXVUYThVRlpVMnFu?=
 =?utf-8?B?cmRMWXZvTXd5dThJVFpCR2JNamphaWpQVEdkRnZ1S0NkenhiZEFtS1JES25m?=
 =?utf-8?B?YjJSZmhrallaa1VqZ2tJSWtRUXV2UGtxRCtnVzdnbzBTOWRWeTRIbk9CYVd1?=
 =?utf-8?B?UDdxMkZvV3YzSmpPbm1QQWdQSnFYZjV2ck1FRFc1NFJtR3dMRk51dDNsWDZ5?=
 =?utf-8?B?UEpNZE1SSXQ1YXJaTGhvT1V2Rzlzemk5cXgvTDM0VS83VHZNaUVCUjlVZHF5?=
 =?utf-8?B?a3U0ajRqNnN3TGtmTitLTDBKcjdMcWRtNjROd1ZpdytJZFB0Z1dXVmxZdVJM?=
 =?utf-8?B?amRWTXB5UmsyTHNZcDFXbzdWSFlEaE1Mb2JJOVo2Z2pTeitTN3J3UHlNdjh2?=
 =?utf-8?B?T3pXM3c5WkhWcjNTNW9jaVNjV3JMNmV4THRuN2FTU3NvbHZ5ODkxeWdBWHc3?=
 =?utf-8?B?Ykh0SFpWMXhrZThFV1RndWdtQUIwOTJITzR5aDFYK3ZLRGJFcTZEMHdzaEow?=
 =?utf-8?B?cm9QNjZhZ25icHJsOUZTMVJQeUpyU3pMbkZ0VVRKTXdPZmFsR01ENWdsQStj?=
 =?utf-8?B?UnZIMnN0U3ZZWmx2aFNQLzc5ZlRlOTNZenBRc0RtQ0FXZXpKSWI0bWlJNXFm?=
 =?utf-8?B?cm1XQjRVUzcyRjV2L0ZQWTkwQ1dpaFQwWTRISEM1Nk1DM1B0cEZ4N1RmOENG?=
 =?utf-8?B?U3dvam5WWWVBRUp4MEFkdXZ3WkNLRVJJYVFLSDRDM1RGNDhqelZtYmRxczNQ?=
 =?utf-8?B?WHNlWEdQR3liekUySnJ2dzVYZk9QMERzUFVZdUFzSUN6R2F4KzJGeUtlbzRE?=
 =?utf-8?B?L0greW9oOFl2dkx1U0U3M2pTN3I0aG5yd1M1MG5uWlhCRCtkSUc2SmNVOTFl?=
 =?utf-8?B?Ukoxd205dFZnMTk0RmJoRVNieTZOOXRRS1UvQmNUKzg0UVV3UjRBRmpqZ0la?=
 =?utf-8?B?OW9ZVzNzK1U0NVZ4N1ZQcllTM0RqWXEzOThlOVdVbktWcGJlSklBdHEwNXY3?=
 =?utf-8?B?YmN3emNsMHRabnIxSXRrdEpWQUc1clN1WUhoajlzOWd4SHRhNmxDVTZ5d2sw?=
 =?utf-8?B?d2pHbGVZdk5YUlVMa3grcW5DR0s5OERmN0k4U2pUVjQ1NDF3UnllSTVYcm1J?=
 =?utf-8?B?SWlrNmNzZEVUUWJLR1plclVtTGZkMENnNUNVUGRVUkFjM2NPNmRUMDNONm1p?=
 =?utf-8?B?QnBldW9lcTJXbDBhOGVYUEg5MnhyU3NzQlFHWHNMRlE2TUY3VEY5aGNWL1A5?=
 =?utf-8?B?V3hrdlZhdTE2aWRMZjkzRGZ3a1JuU2xmcFhrUGxaclpNY0RTQitZOXpvMjRv?=
 =?utf-8?B?T2QySVBPOGppUFkzUXhhVUVTVEJqc0hBeDBIaFg2MCtuME41VVp5WU9ibFVW?=
 =?utf-8?B?VXBPbWZzM1ZZMHI2bGdCakw1bE9WOHdXK1JWcWNXcVQ2VXJiYlp6NDlvZkhB?=
 =?utf-8?B?V2hLMFRTYkVLTVM2dXY5V2srZnM5Vm5MY2o2RkNWRjJ3L3hFdzEvdWZRc083?=
 =?utf-8?B?UU15emxqdTFEejZkZVVUcnF5aWNWYm93cEhwMGFCejViUUQzNlY0T0YvMWJz?=
 =?utf-8?B?a3BtWDdzZytZejdMK1ZmUmJHSGYydXhuNk80alBOY3Q3RzFKS1RZZENjdndo?=
 =?utf-8?B?Y0dyT3hyMHUxSGp1RzBUNnVyS3BVMFVlem9HbmxDU01IL2MzOTVrMjBSdkdD?=
 =?utf-8?B?MWZSOG12empLeXRuQjBnNktUOEVRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wYtpvMKYsB77bFzbiGa8denaGWZ4oUgRyKKg1f8mAg7jISksN1+YUhCtBGhKB6wE+MBqoGUF/0c0DzsdmzL8VhPYZg3KVo3tvspVpTsXNxjvorlkFpx2zPmzbf7os9iDmvf7eiQF8WSPxSXjv3b5MM8364MV/ZMSolUCCLW8YlJ2jaxhnB/YjASxnr5eOnsoE1kJgSn23ahROARVOokjAHE4++g6lc5ec0gOFp35pWPGiQTZUAw8K63Czv+CmdgTPMedLWF4gd3+U8VLbonc1t3eyrWN/o279dGZHgR4kvKu1IY2ZWFwF0Q3w7dU5owqqRKWU723Hbku7W6vZRKqvsfUkrmoqKg0r9NvWUvG9UTRwV9FzcitNHLLtc5tmN1saCBOGU7/mmPExl4l+isyqxMdlKsSvwXYw30c9EybSxqIkonVvrg5Tf7DaVIhQxfb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:25:11.6002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f16ef799-0391-479c-2305-08de6290c8ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF84B7B0C96
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 2AFDCD080C
X-Rspamd-Action: no action

On 2/2/26 03:51, Jan Beulich wrote:
> On 29.01.2026 14:10, Jan Beulich wrote:
>> @@ -160,10 +161,13 @@ int pci_mmcfg_arch_enable(unsigned int i
>>      return 0;
>>  }
>>  
>> -void pci_mmcfg_arch_disable(unsigned int idx)
>> +int pci_mmcfg_arch_disable(unsigned int idx)
>>  {
>>      const typeof(pci_mmcfg_config[0]) *cfg = pci_mmcfg_virt[idx].cfg;
>>  
>> +    if ( !pci_mmcfg_virt[idx].virt )
>> +        return 1;
> 
> Afaict this is what causes CI (adl-*) to say no here:
> 
> (XEN) [    4.132689] PCI: Using MCFG for segment 0000 bus 00-ff
> (XEN) [    4.132697] ----[ Xen-4.22-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
> (XEN) [    4.132700] CPU:    12
> (XEN) [    4.132702] RIP:    e008:[<ffff82d0405779bd>] pci_mmcfg_read+0x19e/0x1c7
> (XEN) [    4.132708] RFLAGS: 0000000000010286   CONTEXT: hypervisor (d0v0)
> (XEN) [    4.132711] rax: 0000000000300000   rbx: ffff808000300100   rcx: 0000000000000000
> (XEN) [    4.132714] rdx: ffff808000300100   rsi: 0000000000000000   rdi: ffff8304959ffcec
> (XEN) [    4.132716] rbp: ffff8304959ffd18   rsp: ffff8304959ffce8   r8:  0000000000000004
> (XEN) [    4.132718] r9:  ffff8304959ffd2c   r10: 0000000000000000   r11: 0000000000000000
> (XEN) [    4.132720] r12: 0000000000000100   r13: 0000000000000004   r14: ffff8304959ffd2c
> (XEN) [    4.132723] r15: ffff808000000000   cr0: 0000000080050033   cr4: 0000000000b526e0
> (XEN) [    4.132725] cr3: 0000000492a30000   cr2: ffff808000300100
> (XEN) [    4.132727] fsb: 0000000000000000   gsb: ffff8881b9a00000   gss: 0000000000000000
> (XEN) [    4.132729] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) [    4.132733] Xen code around <ffff82d0405779bd> (pci_mmcfg_read+0x19e/0x1c7):
> (XEN) [    4.132734]  48 39 d3 72 ea 4c 01 e3 <8b> 03 89 c3 4d 85 f6 74 0d 41 89 1e b8 00 00 00
> (XEN) [    4.132744] Xen stack trace from rsp=ffff8304959ffce8:
> (XEN) [    4.132745]    0000000300000286 ffff830495bd8010 0000000000000003 ffff830495bd8010
> (XEN) [    4.132749]    ffff8304959ffdd0 ffff82d0405fa7ef ffff8304959ffd30 ffff82d040576877
> (XEN) [    4.132753]    000000000000000c ffff8304959ffd58 ffff82d04039b81d ffff8304959ffe28
> (XEN) [    4.132756]    0000000000000003 ffff830495bd8010 ffff8304959ffd80 ffff82d0405fa90b
> (XEN) [    4.132760]    ffff8304959ffdc8 ffff830495bd8010 ffff830498019650 ffff8304959ffdb8
> (XEN) [    4.132764]    ffff82d0403983e0 ffff830498019650 ffff8304959ffe28 ffff82d0405fa7ef
> (XEN) [    4.132767]    0000000000000018 ffffc9004002b900 ffff8304959ffdf8 ffff82d04039feba
> (XEN) [    4.132771]    ffff82d0405fa7ef ffff8304959ffe28 0000000000000000 ffffc9004002b900
> (XEN) [    4.132774]    0000000000000000 ffff8304959bb000 ffff8304959ffe78 ffff82d0405ff666
> (XEN) [    4.132778]    ffff82d0405713b8 00000000ffffffff 00a0fb0081f456e0 ffff8304959b3010
> (XEN) [    4.132782]    00000000c0000000 00000001ff000000 ffff8304959fff08 0000000000000040
> (XEN) [    4.132785]    000000ec00000001 ffff8304959fff08 ffff8304959a4000 0000000000000021
> (XEN) [    4.132789]    0000000000000000 ffffc9004002b900 ffff8304959ffef8 ffff82d0405711b2
> (XEN) [    4.132792]    0000000000000000 ffff888100456938 ffff8881001470b8 0000000000000018
> (XEN) [    4.132795]    0000000000000000 ffff8304959ffef8 ffff82d0406213f9 ffff8304959a4000
> (XEN) [    4.132799]    0000000000000000 ffff8304959a4000 0000000000000000 0000000000000000
> (XEN) [    4.132802]    ffff8304959fffff 0000000000000000 00007cfb6a6000d7 ffff82d0402012d3
> (XEN) [    4.132806]    0000000000000000 00000000ffffffff ffff8881001470b8 ffff888100b88900
> (XEN) [    4.132809]    ffffc9004002b900 ffff8881001470b8 0000000000000283 ffff888100456938
> (XEN) [    4.132813]    ffff888100065410 0000000000000000 0000000000000021 ffffffff81f7842a
> (XEN) [    4.132816] Xen call trace:
> (XEN) [    4.132819]    [<ffff82d0405779bd>] R pci_mmcfg_read+0x19e/0x1c7
> (XEN) [    4.132822]    [<ffff82d040576877>] F pci_conf_read32+0x55/0x5e
> (XEN) [    4.132826]    [<ffff82d04039b81d>] F pci_check_extcfg+0xb1/0x13b
> (XEN) [    4.132831]    [<ffff82d0405fa90b>] F physdev_check_pci_extcfg+0x11c/0x121
> (XEN) [    4.132833]    [<ffff82d0403983e0>] F drivers/passthrough/pci.c#iterate_all+0xa2/0xe2
> (XEN) [    4.132836]    [<ffff82d04039feba>] F pci_segment_iterate+0x4e/0x74
> (XEN) [    4.132839]    [<ffff82d0405ff666>] F do_physdev_op+0x362a/0x4161
> (XEN) [    4.132842]    [<ffff82d0405711b2>] F pv_hypercall+0x6be/0x838
> (XEN) [    4.132845]    [<ffff82d0402012d3>] F lstar_enter+0x143/0x148
> (XEN) [    4.132847] 
> (XEN) [    4.132848] Pagetable walk from ffff808000300100:
> (XEN) [    4.132851]  L4[0x101] = 0000000000000000 ffffffffffffffff

FWIW, I can reproduce this on my test machine.

> There is an important comment in pci_mmcfg_arch_disable():
> 
>     /*
>      * Don't use destroy_xen_mappings() here, or make sure that at least
>      * the necessary L4 entries get populated (so that they get properly
>      * propagated to guest domains' page tables).
>      */
> 
> Hence it is wrong to bypass
> 
>     mcfg_ioremap(cfg, idx, 0);

Indeed, restoring this call resolves it.

