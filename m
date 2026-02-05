Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oERxBAazhGk54wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:11:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AEBF4734
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:11:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222109.1530146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo10P-0007bJ-Qx; Thu, 05 Feb 2026 15:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222109.1530146; Thu, 05 Feb 2026 15:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo10P-0007Z1-NW; Thu, 05 Feb 2026 15:10:53 +0000
Received: by outflank-mailman (input) for mailman id 1222109;
 Thu, 05 Feb 2026 15:10:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpzf=AJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vo10O-00077Q-Rb
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 15:10:53 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8daadc0-02a4-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 16:10:47 +0100 (CET)
Received: from SJ0PR03CA0051.namprd03.prod.outlook.com (2603:10b6:a03:33e::26)
 by SA1PR12MB6775.namprd12.prod.outlook.com (2603:10b6:806:25a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 15:10:39 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::28) by SJ0PR03CA0051.outlook.office365.com
 (2603:10b6:a03:33e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Thu,
 5 Feb 2026 15:10:24 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 15:10:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 5 Feb
 2026 09:10:39 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Feb
 2026 09:08:51 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Feb 2026 07:08:50 -0800
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
X-Inumbo-ID: d8daadc0-02a4-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T60FRf5sIHXVGI0iP18IoFVLOOE66d9kLGG+K0FcpHAuaDL0G7hiVTsF7E6McX0Qtbxx9tvZ7EqgFoxaja02VIEC+bV5vrXh2JwV3tGG6ULrrFZJX+Ii/WTDPUBMl9cgvcQ3k8vVNjMtOVSkxj7WV10obIuPuHY0V2FzmBYHkGttTTDvINmmftDu2rR9x3dtuCedY2lgX4x1yAx0OXMeQZdMoUz4jh/Rgx5Qz6fyqgKNlEP6t45hhZiJ9mIDh4Qptv+uBCwg5KbBvJCNIdTIKUsTQVlvY2dGzq0Iq2kbKoHbZf1Uwj/0BHQDHLUV7Xi9UmJhoQFylRNl3V2sKahPiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gt7yWa6UPkmNuHb7BNRgWpsvGQKzSYkIhKZAb2UnqgY=;
 b=mFtXt/jUbOIFmSVAGdNwmk3ViNAObz7TCEAFZX/S24bVCVIjMtKjGvQF5nj/1uyGrjkNmsy2D80CUk1Gl5IzIZ+Rgv/9s4EXmyi5e5fi5rCk8+7atjjA+kcmaX1k2jNIoSW4BUXyKBfy4u4AXajmYSgjYPlVbD61DApsIR0VExJ9OYFYYWkAGrtPy1kzk43D3Jq9/o1AEwIvkdp6vo8jx9Pjveo31R072W12KsLqFDPiKyXyr0dja0lt0LFGHcePNRZmN1NHA29NmKs9aWW0cmP+s3jwDVu/t8ZD0yLeTW3L7Ux6bYSbt620LvRe/zZHo4rR2/K9NM84TMfKHi2Bzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gt7yWa6UPkmNuHb7BNRgWpsvGQKzSYkIhKZAb2UnqgY=;
 b=wrvMIeQMOK6adLAhZ1l44LwoO0bVvQ4H1W/1FlSYLqbZBoNTmPOIe/Sw+V3D/fghBDlPOHNkPcga1ItPBLS9luQW+j0U7uC5TNgIAAEwloFXYUJ2y1JJFQge0PAET3pYZHGI4BZ16bmWNNc5jirZlIXvxqcBSiptZw2uXJmQpfE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <0d91746d-2a58-4770-ac64-f974aa3563b1@amd.com>
Date: Thu, 5 Feb 2026 16:08:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix memory leak in xenmem_add_to_physmap_one
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Xenia Ragiadakou
	<Xenia.Ragiadakou@amd.com>, <xen-devel@lists.xenproject.org>
References: <20260205125820.116555-1-michal.orzel@amd.com>
 <828feb7a-2a5b-4306-8da9-162df9ecfee3@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <828feb7a-2a5b-4306-8da9-162df9ecfee3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|SA1PR12MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: d99224f6-a869-4a09-4f47-08de64c8b91f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzJTVEhjcGowY1YvbitsVGJUc0VsTG80Umd0amVWWTMzUExoNFNkejU2clVi?=
 =?utf-8?B?bithZDV5d0I2V3UxQmVUY2FUb0pkbzBQTFF5OTh2cGJEcFR4NlduUmZJUC9R?=
 =?utf-8?B?K0UwZTdXVy8xZW1VSHFoV0s1Y1MzOHVKWitxWkNmUERNQTA2UG93TDc4bkk5?=
 =?utf-8?B?UkIySVNiSHZQMWxlaEVLOEIzZXJ1ek4yaXpoYUFueTZRRDJreENVQU1LV1BL?=
 =?utf-8?B?anNKM1hsSVU1ajRPM0ZoSll6dEZBUW9SS2xxYlRDbU1WaGpXOXJ4aWZ5YU5k?=
 =?utf-8?B?aXY1ZGRIdG9MT0JWcTZ1RCtqcjI3T3JLV2MvWUpqb0UxclFSL2FtT003Lytt?=
 =?utf-8?B?T1ZWQXlldHJqV2NMWndrY1ovNUt1UGZXUjd4S3dYNHM3cVYvRGdqNjhnUnIw?=
 =?utf-8?B?dEVoTnVKNGh1UzcxeVJTT2FvYXVyK0JIVjRKTjMxY1BMQWZmMzhEeFlNK0Zr?=
 =?utf-8?B?alNxVndJYlV2dWU1VERuYUtQUVgxL05XN0RYNmVLVWRXNXpNS3VjeWFoMU9B?=
 =?utf-8?B?R0p2VzhOZGtmbSs0VnFZK1NSUmR5TWJQdmNtRW1TOGRDY21lOUZzZVVQbmZv?=
 =?utf-8?B?RFViMW51Q3hYclRPT1ZuODl3VjB3c2xpR3YxMTQ1ZS9tZTdWcG9iZEl6ckZk?=
 =?utf-8?B?MmJUbVZsWkhnSDd3R3VkeUM0eC9Rb0J6SVJjYUxqN1ZQZXRVWGt3Nk44MkFO?=
 =?utf-8?B?MmtLek1Xdk5Dd2JFa0FxUzFNSC90Z3U4V0hCd1YvdkI3cjRzSlNlQldneUJa?=
 =?utf-8?B?dC9nNWVjWkNCK3g4eFhmSG5IZVUvdExGK25kRnJXMlpwVFNrdUp1N205bUtY?=
 =?utf-8?B?NXk4blBZNXZ3cStzVkdNOXIzTmRCNEpFczBLMEppZ1RCaSthVFdlZWFKekN4?=
 =?utf-8?B?QmlmUC9CT1Q0cTQzN0FSK2tNVkRTelNOZk9nMXZTeVdzZWpxdmVYQ00rQmw0?=
 =?utf-8?B?Y2Y1Vlk4WTY2MWR1a0FXQVlMWVpuMzRvU09zdWR5Wk9haGlhUEk1ai84L09D?=
 =?utf-8?B?bGdPK0ZlSXdrUkNsUzhVNTI5dE5FNldiSXZFY2d0RDFuZ1RmeXpybFcwNGY5?=
 =?utf-8?B?azlWNEFEWFYzMmNjcTAyb1A1RjhBVkowTDNPQWIvOVJDQ1pQS2FLSkxERXg1?=
 =?utf-8?B?RWlMdXNZRkNlbTVBSWNwVGc4ZmNISnBtMTIvdjd5ZzRPTXlXRnV6bm01dEJa?=
 =?utf-8?B?T1pMSk5rVUJOclp3aXpQckE5cDJkU1pDSGtIbFlaMjVjQjduUkVIRGVRbjBn?=
 =?utf-8?B?WExoV3ROU0UrWXBmOU5WYTliakw0MlE4VFVER242UC83VGx5ZjVZa012TVF4?=
 =?utf-8?B?TEdNcFh2eGwwZG1KZXlpRTZ1bEozWHVIbUVUNElzTG9iYUNCdi9RWGt1VHhx?=
 =?utf-8?B?U2RDWTZiRk14NzJzUFBSTitHYTFtbXVrNWVKRUU3STc2WllEdEIzc0hpR0hj?=
 =?utf-8?B?bENBMEpSbmpqdy80bDFnTmVlaUJrMUJYVXJLMDMzVkhkWm9mMFRLLzRTYkdn?=
 =?utf-8?B?ZDROWlhRcmtOTzNvTFJIeVY4MkFUdmdJMnE2RThHRXo5WlB2Mk0ybUVEMmZR?=
 =?utf-8?B?NGdQVitIUStqSDZQdmpub3dVN0M4Q0h1UHE4MlR2N3hLZW9IMGZUQ1h6OWt4?=
 =?utf-8?B?Y2tnandEemxXSHhVUUlLVmZuRFF6aExYbGZocnIzUEVpSWJVbEpWUXlCL1Iw?=
 =?utf-8?B?TGZZMjluSXpxd1R5ZEI2Y1dzWVhmNmdFRjkvbDhML1MySjF6cmJxUHNGZVli?=
 =?utf-8?B?ZWI4VXFCUVdrWFpjblAycVhJU1pXMVNHb2RJenhmVGQ2OFYxUmxiYkdyalFv?=
 =?utf-8?B?WStWSkhnRHYwZVN6d2lQMU1KWldmNUE2TUVSMWtyZXl2OHhsa01ReUZTZFVs?=
 =?utf-8?B?R0hsZmRXYnhXSkFhWjlVVVpQVzIzMnhEa05FcWw4anpRYlIxTXVRZXExVXAx?=
 =?utf-8?B?ZndzOGRRZWdWSGFucXAxTFkvYW4rT0ZzRzZibU9zdkNXNlRBeEV4WlFXYWhE?=
 =?utf-8?B?R1FtUWc4YzR5NVgwdVZFQlM4bmdEUjVkQmNieDhKZkZhMnhjYXhVaVFtYlRm?=
 =?utf-8?B?RHFlQjk1TW0wbENkZ083RDBXVnd4OTZueno4aXJZVjIvRW10WURuMy9BWm8z?=
 =?utf-8?B?WHpKVXVSejVKYWUxTnJ0WWJ6em02Q1lwdUFmK3BMeDFvYVFDM0R5Rmd5NHRY?=
 =?utf-8?B?UWNrL2hwT0E5eDlFbjRIVzdyaXJwTHI2MURiS1lGbFZtZExKL0JCYmcrY21i?=
 =?utf-8?B?bzRoOGFVK09mNXl2elFFOWs0a1lRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Iqwlpw3u564WSSDcs7r8+2VSlfrVCnLp1FtRe8a36oZqZdl0Vdp6gwRNcJphmB0w/cCNqpSKdlBjBQYqiTfG3t5gD+EjU/9k+DFJsXzGKfSTJQDinCU1cgJldjF+pMn+KDtGGEPVWbs0L7669rDBIal8zEOlxMPKbX/aUZqxBKe0z5YwS7aKs2MhjkJCZd7H713hB85OSn7vvtISfX+wapLVElArLx+eI7WBWvZCGor+q83ogFUKkfyy/uZf1V0+IoUf7HqT76MHjH0Q9dmMNdY4bCLXtopljxuk5ZklcF1OHd8gupk7JKfQ9m5Y88z/8fmjcqjs1pDQMMcTdijSsRyYmAvUs9Je+GKpLe4oMH9Nddx+r5EjASo3iiOoZeH2RAHpO5Ct3+Uz2P9DUauYvW6KIYZJRzdH3sl2isWb6BH/le9q1OaDOLPduLqLZmbe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:10:39.4154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d99224f6-a869-4a09-4f47-08de64c8b91f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6775
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Xenia.Ragiadakou@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 78AEBF4734
X-Rspamd-Action: no action



On 05/02/2026 14:49, Jan Beulich wrote:
> On 05.02.2026 13:58, Michal Orzel wrote:
>> When a guest maps pages via XENMEM_add_to_physmap to a GFN that already
>> has an existing mapping, the old page at that GFN was not being removed,
>> causing a memory leak. This affects all mapping spaces including
>> XENMAPSPACE_shared_info, XENMAPSPACE_grant_table, and
>> XENMAPSPACE_gmfn_foreign. The memory would be reclaimed on domain
>> destruction.
>>
>> Add logic to remove the previously mapped page before creating the new
>> mapping, matching the x86 implementation approach.
>>
>> Additionally, skip removal if the same MFN is being remapped.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> I'm not sure where to point the Fixes tag to.
>> ---
>>  xen/arch/arm/mm.c | 32 +++++++++++++++++++++++++++++---
>>  1 file changed, 29 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 6df8b616e464..b9f1a493dcd7 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -166,10 +166,11 @@ int xenmem_add_to_physmap_one(
>>      unsigned long idx,
>>      gfn_t gfn)
>>  {
>> -    mfn_t mfn = INVALID_MFN;
>> +    mfn_t mfn = INVALID_MFN, mfn_old;
>>      int rc;
>>      p2m_type_t t;
>>      struct page_info *page = NULL;
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>  
>>      switch ( space )
>>      {
>> @@ -244,6 +245,33 @@ int xenmem_add_to_physmap_one(
>>          return -ENOSYS;
>>      }
>>  
>> +    /*
>> +     * Remove previously mapped page if it was present, to avoid leaking
>> +     * memory.
>> +     */
>> +    mfn_old = gfn_to_mfn(d, gfn);
>> +
>> +    if ( mfn_valid(mfn_old) )
>> +    {
>> +        if ( is_special_page(mfn_to_page(mfn_old)) )
>> +        {
>> +            /* Just unmap, don't free */
>> +            p2m_write_lock(p2m);
>> +            rc = p2m_set_entry(p2m, gfn, 1, INVALID_MFN,
>> +                               p2m_invalid, p2m->default_access);
>> +            p2m_write_unlock(p2m);
>> +            if ( rc )
>> +                return rc;
>> +        }
>> +        else if ( !mfn_eq(mfn, mfn_old) )
>> +        {
>> +            /* Normal domain memory is freed, to avoid leaking memory */
>> +            rc = guest_remove_page(d, gfn_x(gfn));
>> +            if ( rc )
>> +                return rc;
>> +        }
>> +    }
> 
> This new code and what follows below it are not inside a single locked region,
> hence the cleanup done above may well have been "undone" again by the time the
> P2M lock is acquired below. That locking may not be apparent in the x86
> variant when merely looking at functions used. There's a large comment,
> though, explaining how we actually (ab)use the simplified locking model
> (compared to what was once intended, but never carried out).
Do you suggest to put the new code and old code in a single locked region?

> 
> Further, doesn't P2M entry type influence what needs doing here, including
> possibly rejecting the request? x86 refuses to replace p2m_mmio_direct entries
> by this means, but seeing that Arm has XENMAPSPACE_dev_mmio, this case may
> need handling, but the handling may need to be different from what you do
> above. (Just to mention: Presumably on Arm it's no different from x86: An MMIO
> page may or may not pass an mfn_valid() check.)
I actually had the following in my initial implementation:
p2m_write_lock(p2m);
mfn_old = p2m_get_entry(p2m, gfn, &p2mt_old, NULL, NULL, NULL);
if ( p2mt_old == p2m_mmio_direct )
{
    p2m_write_unlock(p2m);
    return -EPERM;
}
but realized this is actually a different issue than the one I want to solve and
I don't want to fix two in one go.

~Michal

