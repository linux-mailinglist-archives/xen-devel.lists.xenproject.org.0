Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK/ZH70enml+TgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 22:57:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5DC18CF9E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 22:57:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240289.1541727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv0O3-0007Ws-RF; Tue, 24 Feb 2026 21:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240289.1541727; Tue, 24 Feb 2026 21:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv0O3-0007V5-NZ; Tue, 24 Feb 2026 21:56:11 +0000
Received: by outflank-mailman (input) for mailman id 1240289;
 Tue, 24 Feb 2026 21:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmFV=A4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vv0O2-0007Uz-3C
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 21:56:10 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e09d4c1-11cb-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 22:56:07 +0100 (CET)
Received: from BY5PR04CA0010.namprd04.prod.outlook.com (2603:10b6:a03:1d0::20)
 by PH7PR12MB5784.namprd12.prod.outlook.com (2603:10b6:510:1d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 21:56:00 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::f5) by BY5PR04CA0010.outlook.office365.com
 (2603:10b6:a03:1d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 21:55:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 21:56:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 24 Feb
 2026 15:55:59 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Feb
 2026 15:55:59 -0600
Received: from [172.24.237.99] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 24 Feb 2026 15:55:58 -0600
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
X-Inumbo-ID: 9e09d4c1-11cb-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8dsQXu+dTGVl9tVtdWyJaNfPMeop6p6JDRW4GLQ3/WwsBQZp271g2HlMLafeH5rS8EeWOnRMNOLy0JncPZcNJEH9eZFifXb8F4CVE1t5cVNcg2uKrB4KUA/nSOEnhqV3KCLWy4JekGD/hFi8cTNxdr9ruhaPK4vscBZrdKfZsxpfYx3vheN6xmNCswcUDOCoPArfKEBmecSyix4ZubeLLBzAu/JBX9imKrwLsCita8zJ71J9Ji/uwBG8FrM79sDMZchEDYG1k0qkkMMd9osY44OR4YjE44X9Lya1+KNg8jhYo6uU+8OQ6M8xkj10fC7vOmMRBvlaR5upPX0WYFcaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3nYmhuSQM5uxl0B7FXxUwnkvVqtlRMd60dlCAFdv28=;
 b=o+9JdrjOOlsPW3/9Irjfz6d/0hgzgRMmOhsf0IDPPYPKKc5uLpblIdaIXNuxMkDV+Lw6wEXevULE4T9VSHu9LrOCPI/8tThnOU7OrEYs8gubKL82mOZ6M1ScqR0dMPCOeV8Xw9Og8Cvg3IL7OARZc1GybwgEc4RbY8mva7AMhzx4rEEMVlR3SmpL5D8iV4rXrKHNH4tlhgR1DFWIT7MQDAJJnCO8X6+SP8FWYN5OGrmpw3Fcze+NxbPes34g45sHTpZa+jUNiL69qClg3Mj3xxSaAxRZHbwwMLIeOgigXXUV6dVb1EcD0c62lBLsPfexN7hX1CX3JO4hOnWJNrB5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3nYmhuSQM5uxl0B7FXxUwnkvVqtlRMd60dlCAFdv28=;
 b=HpWiJm/Oa+du2bOnG5kLWg6uE/FRT+DpWW/wGSytekBlS75AZutR4CJYV9RNFmlvRFFyfTRt6PYbgxfm5mzpA6TNUB3+e/WQMUQ2eNXzBQm8QJolSSsawwt0CWRrM00nwThe0cZsHaLhYfOKBRMNK8UFQdz4/VyR6sq9fKGkeuk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <3484f37d-b85f-47d9-8038-e65846a82647@amd.com>
Date: Tue, 24 Feb 2026 16:56:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] vpci/msix: check for BARs enabled in
 vpci_make_msix_hole
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20260224025626.26909-1-stewart.hildebrand@amd.com>
 <c23c84be-d4ac-4ec6-b723-a6a76828a1d6@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <c23c84be-d4ac-4ec6-b723-a6a76828a1d6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|PH7PR12MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3036eb-6eb3-4d0f-891e-08de73ef7f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzlvLzN0ZnRKUVV2d25UeS9SZFpWNUNocTBUc1dWUFBURkRmQ1ZNc21QVFdF?=
 =?utf-8?B?cWdXSUZwUWJlS2l6TE1zTUhUdkh1dzdmYUx1SElleCt2aVUyWE5OcS90U2lu?=
 =?utf-8?B?M0tTM3hHenc1WHRKa1Q0VU5UOFd6bG55UytTamswSkhlOEE0dnVlZjZ0YURE?=
 =?utf-8?B?M0Fkd3NFbXV3MzZYYTdYVzFQOFhPSWxwS3EzN1BFZlR1ZFpPbzZBZW14ZEpB?=
 =?utf-8?B?S3lWMm5VblE3STNubnhna3V3VnhuR2tWUmg1ZGlUWTFOVGp2dDBKb0lxYVRm?=
 =?utf-8?B?WVA4QzZlUU1hTVJWRmI4bGx3ZmorNmJLRWp5QTRoN2VtY2s3VnhYSHFIbndv?=
 =?utf-8?B?VlBjbXpsVzYvdGZHa3c3VzRsVzBMWHlsdzBERVB3czBkMFdDOHZFYmZyVzhH?=
 =?utf-8?B?QXF3ZkN2SHRKVHdTSm00d0NVYlNRVkJ2MlROMTdDSG5VUXNiTkNqSERQSjk5?=
 =?utf-8?B?S01MSUIvMEx4SHdNaGVUdDNwMWVmeFo2QThuVmR6bm1BaENJNU91Sm1lclhW?=
 =?utf-8?B?azViZHhJZzFMRVNHNHVQcERRY2tYd2UrdFM3WkJ6aFp6N0xRSHNkRWNLdTcw?=
 =?utf-8?B?REU4dlFESGdEZXI1M2V6NUt4TTdURVZMNHU4RFlsY3JaSVZhKzZuVjdSQlh2?=
 =?utf-8?B?czFxNmFnVytVQVppUi8xYVE2MTVscTlsTklPS0t5cXJRQzQzcVF0ZC8yT2l4?=
 =?utf-8?B?TzNHYk9seGxqYkc3MlN4dHY0czQ4Sll5UDQyUTBnNXZQVkN1dUoxY1lyVTRV?=
 =?utf-8?B?WnQ2S1dhZzVGY1hMNjZRdUZJZTYzbW9KM0FGdGRQeWdMOGs3bmdMN1djdWZi?=
 =?utf-8?B?a3Y0WStiTk9KUEE1SmNDc25CUytoV1pJZDRzQ3M0eG5wczZBejQ4bGFrQ1VZ?=
 =?utf-8?B?YXVIQ2dWVGM5K1huNTZRa09QTFpEY2x4SHF3SDJKN0QvVDNuU1cyKzluM2dw?=
 =?utf-8?B?UnBLVDk0d25vT1IvOW51QnV1VTI1MTk5eWFxTUpKc3JCZWxZTTN3QU1QRUsz?=
 =?utf-8?B?Zzk1VFZ5ZitNZGZjQlhaRThLclFDNFFCY1lCVHI1RGdxczM3bzN0QzBRSjZs?=
 =?utf-8?B?UmViWEs1Mm5uSFNCRlVibE53b3p2bzlhTVBKNWV4bVlyWXNyZmRXV2xrRkJW?=
 =?utf-8?B?TUdwWTEzOEpCakJ0V3dQaUR5c0Eybkl3emt4UmpYZFVtWUFxcjlxMHJTcUYr?=
 =?utf-8?B?ZS9ITDEyaTZYK1FSTWk3cHQ3R1g1UjVOc2l6bVg4bDQyZ0hzc0xaV3RyZFpC?=
 =?utf-8?B?bi9HbWlWR0RBM2ErWHRNLzgzai9jalo4YkNmYUhnc0RWZW1saXlIbWxZbXJF?=
 =?utf-8?B?YnZ6WkVselordXJlUkl6R2k4THlzQjg0eDhSN1pvL1dlaXBYWUtZcGZoZVpO?=
 =?utf-8?B?d3l3SGhab2s1NTB0S2V0eEdFWWh0T3VvTXJNbXFYbmJKcVVSL05Td1MvcEZj?=
 =?utf-8?B?RmlrVGN1WG0waTNIRlZFbktieWFtT3JNTEsvU1FkUEwyclcrUGRQOTBIMDhU?=
 =?utf-8?B?WnZZMUdqbmM2UWdNOFM5RHBRVEUxWkJENS9FdjMydUltVklSUWM2K0MzZ3d6?=
 =?utf-8?B?OFZheTJ6d1VQckdOaWcwM0VwTVpIY1E3ck01S0JwRExlb2w3ejdzdWJRQ2or?=
 =?utf-8?B?UEdzM3ZYTjNNeFJpcm1MWFFxL3JuOEh3UTlLYVFrZ3pQc2JTaE8wc2MzVmFu?=
 =?utf-8?B?Z0hEdVg1c0dhb2thQy9GU0hhZWMycUl3WXEyWjZWTzJPVjZrOXgvRDc3Nk1s?=
 =?utf-8?B?SmFDY1FyK0FlSFZKSDRQUVRkOEVjWTYvQkdjNVJiUkNVMVJLc3drVTkrY1NL?=
 =?utf-8?B?RnlkZnRobnFzM1V5MmJyQllmZDY0dnBnR05TNUtKT0QydXo0YkFGdWVoVzJV?=
 =?utf-8?B?MHcyc01GUjZxRDdPVlhldE02cnZ6aDBBMmJHY09aQ0lhR2x3WkZHc2t2U0M1?=
 =?utf-8?B?cmxvRG0yVlE2alRsSjRrbUtadzByeHRwVmpSYThZV0tyeHdsTytyZHN0Q2xz?=
 =?utf-8?B?ZnErK25EVUV5Rjc3ZnpvMTArV1ZSWEVnSEZWRmkxOGk5NksvMlNMZWpBd0o3?=
 =?utf-8?B?NjhWM25NQzFtNkJZb3dOcXZPSS9NVGIyaG1iaXlHL0gwekEvNFQ2SGxzUHJj?=
 =?utf-8?B?bjl5ckt1b1UxeWxHZEg2bUh4cUsyYUgwUzJRRURMYjhQZnluZEdwSkFPOWd2?=
 =?utf-8?B?U1g4TExrcXEzWGxtR0NuRUpOVmhqalZZN3pZU3NKbzA5dlpsZUJIakc2TVhw?=
 =?utf-8?Q?9QbBO8XAyR/YzRGzi8uDOHZtmotxMcjkMkoYf3TmEI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xE80uQCYwxSnQ4WO2AzA/SnHqy0Oc9UKZj3DK4ChkMArnkpnw2eESgqQNN5RN3H4F75VeuOgCqfdybfO7tGmADs5N1KFXeSHU0/vDBltT77cG3tApNHb88kzezx8YqTWwamOwmxy5A5K6P5qFeLvTv2PwIlH6RUTKRDXTG1oq3ghTnSLrU+HRaB0Q6iRa9svRrz5Uon8HmYegkcV5RDCLAjgRa8Kf5Tsbdkw0Jw7iFFCDWzU816gWYG2VBcuo+VYRGYbmnxR8of0bUUM5BklViBuJl5hkbyvJTfLgimPuvPZrBBKEIPXW6Eyk/wyCVxgB4C1rPi42jaM9RuTbRJUoYqu/zf/SuZBvxw17QaOlezKOQuyZLuveSlxjqUtgP+8lfpOczFepYwlrkhEX2qjG7kLV/DgEoQbUQknCpT5njRF+mrWB6debVxQfItyybWh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:56:00.2265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3036eb-6eb3-4d0f-891e-08de73ef7f4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5784
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
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url]
X-Rspamd-Queue-Id: 6D5DC18CF9E
X-Rspamd-Action: no action

On 2/24/26 02:34, Jan Beulich wrote:
> On 24.02.2026 03:56, Stewart Hildebrand wrote:
>> A hotplugged PCI device may be added uninitialized. In particular,
>> memory decoding might be disabled and the BARs might be zeroed. In this
>> case, the BARs will not be mapped in p2m. However, vpci_make_msix_hole()
>> unconditionally attempts to punch holes in p2m, leading to init_msix()
>> failing:
>>
>> (XEN) d0v0 0000:01:00.0: existing mapping (mfn: 1c1880 type: 0) at 0 clobbers MSIX MMIO area
>> (XEN) d0 0000:01:00.0: init legacy cap 17 fail rc=-17, mask it
>>
>> vpci_make_msix_hole() should only attempt to punch holes if the BARs
>> containing the MSI-X/PBA tables are mapped in p2m. Introduce a helper
>> for checking if a BAR is enabled, and add a check for the situation
>> inside vpci_make_msix_hole().
>>
>> Move the vpci_make_msix_hole() call within modify_decoding() to after
>> setting ->enabled.
>>
>> Fixes: ee2eb6849d50 ("vpci: Refactor REGISTER_VPCI_INIT")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> Pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/2344925375
>>
>> v1->v2:
>> * new title, was ("vpci/msix: conditionally invoke vpci_make_msix_hole")
>> * move BAR enabled check to inside vpci_make_msix_hole()
>> * introduce vmsix_table_bar_valid() helper
>> * move vpci_make_msix_hole() call within modify_decoding() to after
>>   setting ->enabled
>> * split typo fixup to separate patch
>>
>> v1: https://lore.kernel.org/xen-devel/20250812151744.460953-1-stewart.hildebrand@amd.com/T/#t
>> ---
>>  xen/drivers/vpci/header.c | 26 +++++++++++++-------------
>>  xen/drivers/vpci/msix.c   |  4 ++++
>>  xen/include/xen/vpci.h    |  6 ++++++
>>  3 files changed, 23 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index 739a5f610e91..6a28e07a625b 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -122,19 +122,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>      bool map = cmd & PCI_COMMAND_MEMORY;
>>      unsigned int i;
>>  
>> -    /*
>> -     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
>> -     * can be trapped (and emulated) by Xen when the memory decoding bit is
>> -     * enabled.
>> -     *
>> -     * FIXME: punching holes after the p2m has been set up might be racy for
>> -     * DomU usage, needs to be revisited.
>> -     */
>> -#ifdef CONFIG_HAS_PCI_MSI
>> -    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
>> -        return;
>> -#endif
>> -
>>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>      {
>>          struct vpci_bar *bar = &header->bars[i];
>> @@ -164,6 +151,19 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>              bar->enabled = map;
>>      }
>>  
>> +    /*
>> +     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
>> +     * can be trapped (and emulated) by Xen when the memory decoding bit is
>> +     * enabled.
>> +     *
>> +     * FIXME: punching holes after the p2m has been set up might be racy for
>> +     * DomU usage, needs to be revisited.
>> +     */
>> +#ifdef CONFIG_HAS_PCI_MSI
>> +    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
>> +        return;
>> +#endif
>> +
>>      if ( !rom_only )
>>      {
>>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
>> index 516282205a53..142cfbae59d5 100644
>> --- a/xen/drivers/vpci/msix.c
>> +++ b/xen/drivers/vpci/msix.c
>> @@ -598,6 +598,10 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>>      if ( !pdev->vpci->msix )
>>          return 0;
>>  
>> +    if ( !vmsix_table_bar_valid(pdev->vpci, VPCI_MSIX_TABLE) &&
>> +         !vmsix_table_bar_valid(pdev->vpci, VPCI_MSIX_PBA) )
>> +        return 0;
> 
> What if one is enabled and the other isn't? Doesn't the check need to move ...
> 
>>      /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
>>      for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
>>      {
> 
> ... into the loop,

Yes, will do.

> and then apparently also need mirroring in the hwdom-only
> loop further down?

I don't think that's necessary, the logic there is idempotent, and it's not
dealing with p2m.

Thanks for taking a look.

