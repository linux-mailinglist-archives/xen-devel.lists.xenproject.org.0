Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445EBB537F1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 17:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120464.1465392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwjLP-0007Jp-Nk; Thu, 11 Sep 2025 15:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120464.1465392; Thu, 11 Sep 2025 15:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwjLP-0007I4-LC; Thu, 11 Sep 2025 15:36:19 +0000
Received: by outflank-mailman (input) for mailman id 1120464;
 Thu, 11 Sep 2025 15:36:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwjLP-0007Ce-4b
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 15:36:19 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2418::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c2f7502-8f25-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 17:36:13 +0200 (CEST)
Received: from MN2PR11CA0017.namprd11.prod.outlook.com (2603:10b6:208:23b::22)
 by IA0PPF52B16157D.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bce) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 15:36:10 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::7a) by MN2PR11CA0017.outlook.office365.com
 (2603:10b6:208:23b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Thu,
 11 Sep 2025 15:36:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 15:36:10 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 08:36:09 -0700
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
X-Inumbo-ID: 0c2f7502-8f25-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IehtMrj6cehdKeo197EpFyMalbFvgv3iKoLSwdW7+Opqv5bj9HSpF1/HSu5kx41LYg7Yyl2aXsfonDgVBmOOj1eTE6NuNyEqXArkKCP3Ji2G12+ECWrdHglpOVshkqV1/JhCw9FUCRVVZX3nUrp/K0GTVGgDH+FAvjO4TEo52wIAeiQjtU1Z3A9GixIPTvcfAy7PrJ8ZkgAD6HKZ7cSzOFhvZvRsALKlYYux/0XC+GnYCsxysacVxBa4XyVtbCNCY/K2XtoEWu4BmRMxeso5pskXlNqyZiD4oIb4sGyKe74vKPv3o0fZPJg1D7QxMz6rLsgtKC6l3qOVolNIDBnDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILnfP8RABLb+q0Xa/Rg4y+cxoUVc0GUqnq9+CRWXsBA=;
 b=MjNgoS/RiQq1rcRXaSPycZPKm9Zs8EnG0DmdnBQEU0DxXSsVgFqO8sFfY1z2UauUAzjlBjs4b3BiJfxZVrW5hbxwfvhkXBQqDoknJmHUiLlrbvOLwTxUVGHTQLSZl+U2h+0czaziae8Cw9Pj01A4Fa0bzfVNg/BiB3QxbdRVY1NPXfI/swujYH9LIH9Nl/zR/o7wMmh7aCCLXsnmkTUw+rBrc3unOU/IvU5bMrGHVKL9vcxAUoUbl49bBIgSbpOlaltS0/PxKHRgnhcl1i7prXnCfEHSzPEkqIzx2+z04WiL6pAlFA6qWoZ0BzdQ5bVsaBaqCZhP/RgHGBOl/fiLTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILnfP8RABLb+q0Xa/Rg4y+cxoUVc0GUqnq9+CRWXsBA=;
 b=JsRwxDI5C4MJI7f3+hvgtsdfxg6QBhpQgLXmmB4btuoRnRowUpoqnOrrabjlb2QLdQOyuHzjiIOVQlxdO9ppvtBWmEk+8rk/7iw7wNNo2aGhJ1qbGFyHypmnE8eynhpmjrUJFIwyplun8heUS3OTiMqo9yHAmJh+hsCmeRlijBM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Sep 2025 17:36:08 +0200
Message-ID: <DCQ2YNMO668H.CG938HPXECLC@amd.com>
CC: Anthony PERARD <anthony.perard@vates.tech>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] libacpi: Remove CPU hotplug and GPE handling
 from PVH DSDTs
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250911115308.16580-1-alejandro.garciavallejo@amd.com>
 <20250911115308.16580-3-alejandro.garciavallejo@amd.com>
 <daf8c564-80ff-4480-97b4-7c86206ba36e@suse.com>
In-Reply-To: <daf8c564-80ff-4480-97b4-7c86206ba36e@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|IA0PPF52B16157D:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5acaa8-ab95-48e9-e22f-08ddf148ef17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aThxbGcxZks4aG9xcThhSnVEejlGanppNkw3U0c0QmhWcHVWcThmcFNDNmZZ?=
 =?utf-8?B?OXA2KzRnd3JuRmE3SHBnSnNMZGUrQjV1WnBZcS9BYjVsbXYwTjF1VkFwN2p3?=
 =?utf-8?B?VnhRQVRDTFF2OFZWaURnRFFmY2txMnBHbzZrOW1wQmRja3NqUC9jWm9xeWN4?=
 =?utf-8?B?NmFKVE14V2hIc0ROaERTWW15L2RDdnE5K2tES3hwTEhzV0Z6ZHd0cHBQdnlw?=
 =?utf-8?B?eHFJb0owSDlwazdTTU5RNzdVS2k5bVNOY3BUMFNVaXlDNHViMDEwSzdmb0Vm?=
 =?utf-8?B?a1V0WWUzU1Z2eDd5MlY5T1B4NTJHQU1zT0VWWUNlV0MyOVN2ZVlTeWx2MUFa?=
 =?utf-8?B?a2w5STY0ZktIM2tIZGlUaFowVlhGdHNMMnZSVmh4dStOeVZwaVNjSFRLVFlr?=
 =?utf-8?B?UjU2WW5UWm5rQU1Ta3U5Nyt2VjlCTnFmTzZZbWRkcU1OKy94OW9YekdnNEVQ?=
 =?utf-8?B?b21NbmR3cUU0UGZBVm5KdnZxbnBEV2FZcm1RbFF1RjBJRFRLR0JWRnU4bTZk?=
 =?utf-8?B?T1Fob1VPU0QyUXhVcUt5RkhSUktHTEhxREhCVWQ3MjBCbkwxRVVzaVhXcTNH?=
 =?utf-8?B?d2FoV1BEbTdDOGlORTU3Vlpib0FkRTc1UVdKb1cyRDRMZXVoL3RJV2didzVZ?=
 =?utf-8?B?Sm00ZnlzNzVZZmtTTmRrbGRveW1Mb1hadE5wditUR2JZajFEMnJTRmRzOUF5?=
 =?utf-8?B?S1NXdm9HaDlTeHh4UnFkWEYzQTRGSEx5ZXd1eGRQM0JqbW4zVkExckl6a1FF?=
 =?utf-8?B?RC9DY2VzZnRTZzRvb1h0THZ5SitadUpLREs0WEhXTnRzR0MwSFcwaDA0cEVk?=
 =?utf-8?B?aGFsV3NQNGZXdi8rQVNPUm1NWlg0REtPaGpYdFgveGc1MjhUcFBvU2cxTXJl?=
 =?utf-8?B?YkVaNlFyOW52RU4yODVGUWp1VkxHTURGR1VJWFVSdHNIUVBWQ0IwaFFMdkhT?=
 =?utf-8?B?ZnlMbnVJV2cyU0xSNE9aWER6RFBTMm9RK0o2UUpxYzlNNmhPb21wcFJCRnNG?=
 =?utf-8?B?dzdZVWN0aWV4MUx5RitJeUJCS3NieFJhVW5RdVBFckF5OVJIZUxIOUhneS9h?=
 =?utf-8?B?R3V0REZoK3hnUWZlcGFQOUF2NkhlNi9LdlJOclhjMFE3ckpEblVYY0svUkFk?=
 =?utf-8?B?R2ExbEdiWlREOE5iUzJCNExOZldudURFM09vVjFhWFhpRDZGV29YbS9FdGFI?=
 =?utf-8?B?N3RWclRNYnhYd1JTVnQxWlpBa0hnWVV0SkRXbTV0c3dCSTNtcjJLVis1STRz?=
 =?utf-8?B?RVQvNjBIbGxqbmV5YjJwNkJIdWN6amszMVhEQTY3NTRGL3pDSnRqUURnU3JD?=
 =?utf-8?B?bVpGdlR4UEFOTHdIYUVVL2I1bVhWMmlHckdCSjFTaXBWK0N6dkVwbDJMekY4?=
 =?utf-8?B?QkF4RE5DSUJWSnQ3VGJ3QVF2OEN0SXdLWk1hRXdMQmVSWFpaRTVYaWVxQzQy?=
 =?utf-8?B?SEdxUm1xakdMT1M1KzNIdlY1RU83L3dNV0o1a0Z0UThDcDh5NStsc2Z5ZU9B?=
 =?utf-8?B?SldoVCtJbUNUNTFxbUNZUU9ZendzdmJHUC9QUWJSTWx5RlRBUzdsbmxGeXJx?=
 =?utf-8?B?b0JSVlh3UFgza2tEUkJZY3FUZ29RTlJDcThiTGd3a0pZZFlRd0ZhWWEwSXd4?=
 =?utf-8?B?b01JZmxORzBhblliY0ttelRqNmY3QnplbFBmTEplZFVqd2JEMEpDdTBLZnVv?=
 =?utf-8?B?TDJLQXpzSEVqSkVxTk9teGUwU0hmNEs3NS9DbjZ1dHI0c1RmRUllWFhDcW9G?=
 =?utf-8?B?UllnRDgva2loNEdiN1JRVDMrN1ZlK2dENmsrb1V4cVZzbTczVmJnNVFyc3pn?=
 =?utf-8?B?aXRBSUJMeXBDcHFaQitsUUNHaHVVUGJMcFd1cVBBcjd5cDBlamtHSVBEazRF?=
 =?utf-8?B?d1QxRDBGaUd5R2NpLzg5c0VURGdidU1od2U5TStlLzFPK0wweDl1SERYMG9C?=
 =?utf-8?B?dlU3RkRocjI2aFYzR3FwMTVxUytsc3BJWVdCMFRLbXlvcCtPcGZOM1dHMXlB?=
 =?utf-8?B?dEo4WUhqdEhpQ1c0SmxVZ0tZdUxyL3hZODZXRnZwbFFXRnFGVTE0SlF4L2ZT?=
 =?utf-8?Q?rsfply?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 15:36:10.7312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5acaa8-ab95-48e9-e22f-08ddf148ef17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52B16157D

On Thu Sep 11, 2025 at 5:07 PM CEST, Jan Beulich wrote:
> On 11.09.2025 13:53, Alejandro Vallejo wrote:
>> PVH guests have no DM, so this causes the guest to fetch the online CPU
>> bitmap from an unbacked 0xaf00 PIO port when executing the GPE handler.
>>=20
>> Seeing how ACPI CPU hotplug is the only event delivered via GPE, remove
>> the GPE handler in addition to anything ACPI CPU hotplug related.
>>=20
>> This shrinks PVH's DSDT substantially and prevents spuriously executing
>> a large amount of AML with no purpose at all.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks

>
>> ---
>> v2:
>>   * Adjusted commit message
>>   * All other tags except S-by moved to patch 1.
>
> This will want backporting; I expect finding a suitable commit for a Fixe=
s:
> tag is somewhat difficult.
>
> Jan

I'd say it's the patch that needlessly enabled GPE handling on PVH.

Fixes: 062975dc9441("acpi: PVH guests need _E02 method")

Cheers,
Alejandro

