Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF58D9C3F86
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:25:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833874.1249102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUPN-0003Fx-S8; Mon, 11 Nov 2024 13:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833874.1249102; Mon, 11 Nov 2024 13:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUPN-0003Db-PL; Mon, 11 Nov 2024 13:24:45 +0000
Received: by outflank-mailman (input) for mailman id 833874;
 Mon, 11 Nov 2024 13:24:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHe6=SG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tAUPM-0003DV-T2
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:24:45 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2407::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e1ee07b-a030-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 14:24:41 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CY5PR12MB6408.namprd12.prod.outlook.com (2603:10b6:930:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:24:37 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 13:24:37 +0000
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
X-Inumbo-ID: 4e1ee07b-a030-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwNzo6NjAwIiwiaGVsbyI6Ik5BTTAyLUJOMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjRlMWVlMDdiLWEwMzAtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzMxNDgxLjE3MzEyNiwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIz0rNWhHUuJm25H3avVuvEmPcnb383JNqSUunoh9xVmDolZ0RHrGYWQO0y3aSljNtd2b505FI8ecwW1tvS8w4kWxXQTsy0ydSdqhE0hxzzINX6Vh958tdPmYKzFOUVniDZiQuO24LQ8WMlDX74D18BKGBhygpRx5ICsRTC9d3h05Tm5ZD6lghvbtGEuQ4tNz0kZlLm0tR0JCMe/LllQcQZekJ/sSyBdUEpxtiRG4V4x//UDIw/pL5uWih37bpq9K1MFuBRWOrLqkknRPqqbRj6+0HLjcNUGH/IOKqAYnZZNzTA74Z1XMqqDVv/pAEpTeZ7dbqJLm7zCcfJCRFLUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXHNFALuEV2daFMczbBeHtKOYxvpnm6eXAZYP6+tHlQ=;
 b=Exx7QnBpgo3LWadjH200LV1B53+MLQhReV3WZndd1tq0NBUaMKkvcTZNs6bcD4ppKxPtoVnf6+XOhfRll5SCVmo/8K/EV5DZFgiRLf0hywqtzH9I3+9OhT0TFakmlHPODTOgdu7s3Df72lXIEvQgWg4McGk2FtyQDJRUXjihRVrDNKTgKjgNHHX+RrgNfriY9Xq85JKKXaILPutsVJrE2YA4+iMXx8X5pBhEO4HKQTGRrXwg6NuHlF0ytHfpZFP7p36hIAh+C+wi1K+DWLKumbQg3h5fTqpuHFceBdwDL1nI2RctJHrUTgdql022Yi3lW9uym6dfHLKyVxvPAjyt2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXHNFALuEV2daFMczbBeHtKOYxvpnm6eXAZYP6+tHlQ=;
 b=hmU/gB4jIGQopXZEFrO/JapjTPw4ZjC6v7kvv9nENxwjYK6NFuo4Aq1VNAxLZwHHLOyWkiwiTXaVsKbt6qm5XziLI/Q9Ru1EVGhC7vS9SJok70R0+Kv362S8M69G+yWP39NA4YXpnAkF0c9RoqWX5XEV9KzueKC2sT8xWA1Mqno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2ca98e9c-1a4b-43a2-b707-097dc5093e39@amd.com>
Date: Mon, 11 Nov 2024 13:24:32 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen/mmu: enable SMMU subsystem only in MMU
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>
References: <20241108195918.856412-1-ayan.kumar.halder@amd.com>
 <80ac1e78-5259-43d2-8b18-d5bd3abdca1b@xen.org>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <80ac1e78-5259-43d2-8b18-d5bd3abdca1b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0064.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::17) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CY5PR12MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a907f06-e529-42f9-c258-08dd02543088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmpRNll4Y3dkR3V1a1I5NVF6bnphRWJSVUI3SURPNys3VzhiNU1yUkx0WktJ?=
 =?utf-8?B?WkgvdUYyQ1JWZFVlNXg2VkppNjVpeVFnOER3aVBieUh2QkFjU3F6TjhXQ01h?=
 =?utf-8?B?S243ZmtuNTNudmhvcm8xU1YvZllvOHVZay8xWFhndEx6ckpnMDhjcHJLbkhS?=
 =?utf-8?B?dTdUYzRHaEF6b3BGTEkwVDdBWDh6T2dGbm9pVWQwYzlVdWo3ZGZkSEtOU2NC?=
 =?utf-8?B?MFBYajFTVGFFRzVjOGVGd1diZ2xNbWVSS2FHUmZYWGRzdFVucDlUS0tpNFhy?=
 =?utf-8?B?dG5YTCtBRllpODNtMlFULzJmclRtQ0grdWVUTGtYZXlMVFhTQW1WQ1JlaFVK?=
 =?utf-8?B?UFp5K2ZrMytHd0RFdU82MGEvSm4rUlE3cEdFcXh1YTZ0Q1dsaXU4SEcrTjN6?=
 =?utf-8?B?SkJuWEM4ZTdnZ25HVGo3SDRZd3JjdzJJWFhsRFpHenBTSVR0ck01TjE3QmdP?=
 =?utf-8?B?c2FKOWEwSUtuL3U0ckRTUlNOd25aZlVGRkk1OFhXVmhzNUhaa1FERi9uamVT?=
 =?utf-8?B?dE9DNXV0MjhzQzZoR3R4cGRqNDA1d0UvRUtvdTVJSTFiMjJQMnNId1J0Q3Ba?=
 =?utf-8?B?cTZ2TWRkRXZWbHUrVUxRc1A2aTBwNUd5emNoZy9SYXcyclNEdlI1bUk2Q2pX?=
 =?utf-8?B?R2d3aWFmQlczREF4VVVnSVZSUnVDNDI5WFdNQ3dENWRwNXkzUC9wbGJTT1cx?=
 =?utf-8?B?MU1VNkZRb1laSURQK212Qmd6YUt4M0VNM1Z0VERzTklrc25rNHVHY0lKZjd0?=
 =?utf-8?B?V2VSYUd0MU01L2ZBamtKNy9sNUpTMXY3TEY0SEs1MDFCamFGMk1wRkk1dG1P?=
 =?utf-8?B?TER0VlMvRkZtRFdpSkJ4dTkyWWtFbVBLck5EbkpOU213VTVEMGFrOHFhVkZC?=
 =?utf-8?B?OFJxWWxzU2RRWmxyN0FrNHRMOEx2Rjg0R0MvRkhmZndzWWxUZ2wrcE5NNUc1?=
 =?utf-8?B?dFdRTmRzWnVFekF4d2lOTlc4emdMbEo2QlB3Q3BWWnhYS0QxNjdiaTZ3RWE0?=
 =?utf-8?B?T1dGaEwzc2lTTkU1N2V5dGdWVGduVDB1T3NFbFpQOUZQUmxnNTdabXFYVkNk?=
 =?utf-8?B?Nkp4ZDd3a1dXQ0R5VUx2L29XY1gySEw1N2xBby9CdEN5RjBKOWRhSWhOMGJL?=
 =?utf-8?B?RHJRYTRxWUxHOXNJaVRFWmZyeHZJN0JYZGtwalFtRzJWM09wZzlXZG8yVnE5?=
 =?utf-8?B?K3lyS2RhcFJXam1Jc3N4L1ZLRFVEeXppVEp1TlZPc3NEOWVuOU55Zk0vZVE0?=
 =?utf-8?B?YU1QZTF2Mklla0xxWm4xZ2ZlMmdOd2RTOU1naU9DdmVCOW4xeFp4UE0xZVgr?=
 =?utf-8?B?S3pYMitSaDhLWkJGeVg4Q0NtMnFJOHRVWm5UTlA1bHdYM2RwNWRTb25OK2gw?=
 =?utf-8?B?U1lxN1ZCWUR0amljRTE5SktKYm9BRlJlRnRsdFZuejBqYVhtSitQb2VLdXlD?=
 =?utf-8?B?c3g2TEZpSnRYc3l3ZldMZkVKRU9WQ2dIQ1dvbUFDRm1rQnprWkcrR2dWdWJk?=
 =?utf-8?B?K2dJck5wQ3cwU2tXcU9oQ0o3TjUrNm1OM3ZYNVR5eEdJUFVGeXI1U3E4RG5m?=
 =?utf-8?B?V0l5ck1wQ2w3QU4vUElSY25Xem5YdkRtYk5UVURpeEcvYXU0OW01YzhNYUJ4?=
 =?utf-8?B?cEJCNkhoak9teS9vRHlSOEdCbXdweElFdFZST3NzVW42RVZDV0RoWjNPSzBk?=
 =?utf-8?B?U0FvTi83ZkJ5TDA3UnFKaDllcHFSNGJzZ2lZU1Z2VTlJSFY4ZHRtL2RnVWdl?=
 =?utf-8?Q?/DSBfthkjR8ir7sNfw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2VDd2lWSFp1aVBRdFNXNkZpWVRJWGZJd2Q5K0t2V0M5SzlTbEFEaGVHN0V0?=
 =?utf-8?B?RU9rTDY1VjkzQXNVME1xRzlKbElrTnNOby9TSVJmL2g0NDM4VHhOdFVBMytY?=
 =?utf-8?B?VGpCVnozRGNJc0xEM25FOHVCbVhQN3Q3NXdHL0VMNUEvTFZ2ak5IY3Z1S0lo?=
 =?utf-8?B?VmRHaDh6NjUvTzk3WlBoaVF5NGNFc21sM0w2VnVreWNLcG82UDVlYlNuQlYx?=
 =?utf-8?B?RG5nWWtJM1c5TktiVlZ3WWRISGk3RjdOR1ZqMDUrL1ZTQXBuMlRxWWk1ZzV6?=
 =?utf-8?B?M3lrNlBxRUR6cHBLcnFPUEVpTkwvVTNMVldzY3RhN29wOHByQVpocWoxb2I4?=
 =?utf-8?B?ZFJZRTRpdnBFQ0F6WmtJTWhRQmZ0S0lScVoxRndnRkxCeEJpYTRlM1ppMkdi?=
 =?utf-8?B?OTE3bnFQUEcvUnFqeFhYVXNadEJIemRwUXRzQ2p1Q1NJQXYyVWhudGMvVVN5?=
 =?utf-8?B?MnhDZGRZTFN2K1N5K2dTZ2pvblRaSEhVWDNxYWlDUUlZWEJHUWNmcmF4Sk4x?=
 =?utf-8?B?dG0vUWx5eVFiRkZveXBLa2ZwLzcxTlhUWnB2ZVVQNmE1R0k3cWxQY21Pb043?=
 =?utf-8?B?SmpDRnhGQlU4WFhjalJIWjAzL1hVa2VzUTgvQmJLNU1iek53UEFvSUl4L2xn?=
 =?utf-8?B?TlREWFV1U0F2WWVJYWI4Lzd5dnR6ZHVVQkJ2Rm01UitvbVZKQnBmTWJCZE8x?=
 =?utf-8?B?SnVQWlJsU3k5WUtranQ1UFpGb0F6aEo1cjdneSt1bERpbzRtKytRc3pWb01K?=
 =?utf-8?B?TVlMWHpmSXNiNlYwRllnRnVnRXBZeTgvVy93VU9QY2creUoxZXhuRnZ3M3RW?=
 =?utf-8?B?WXJmQ3YybC9pbGFKOFVQbkMxQnpBNmhTei9sMmI1Q2hPNGZLNFRsYU5hSGFH?=
 =?utf-8?B?SUhtb2plRWZVaGxJRlZ3N2FqY0F0YVpBaDBrTmpBWGxGd0JhQ1Z6OWlqN3lK?=
 =?utf-8?B?NkhOZmMySEtOWGI4UDBRZmw4aFoyUER5NGo3REJKWmtldUV0OFZrZjNqTEww?=
 =?utf-8?B?MHpDdk9TTkxEZWlOK1hrcXBIcVNuaEZ3WlE4UUhCRXZIdi9zQmR1MUZDb3g4?=
 =?utf-8?B?SDltMTJyZ2VkU2hsb2pPTEtTSHR2L0ZQUWQ3a1Z1TnBMRE1Vd0dxc0VpZVd4?=
 =?utf-8?B?OFBnZ0ZmbmRValVhdTc3MFZSMEd6aEJGd1JqT3NEM280Y1ZvYzdnaVV2azg4?=
 =?utf-8?B?V3AwWEpiVzgwQnVvQksvYW5iQ2lJMG9DRXozdE5FTThubDRXYkovRVd0MWdN?=
 =?utf-8?B?dU44ajMrZWRjRDExTGh0MHFwdWdGWkdwN0hqOWx5c1BEUmZCd05iQnRwczV5?=
 =?utf-8?B?QUUwWG4yU2kvSVExdnVraVRkT01RVXJ6aURmM25ubFpYblJ2M1JaUE9Pakdj?=
 =?utf-8?B?cHpYbkJ3WmJrSWRrc3R5dnh1QnFZU2lEdVp1bDVhL1RCNXRFbWJxMTY2ZU9a?=
 =?utf-8?B?dGVWWUJXT21ySTVDcXlIMjV4cndEQlQweDNxZDNIc202M3drWktaSStxUjhE?=
 =?utf-8?B?cWNCNnZURkw1b1NFdUhrNTZZVUozVVo3WWpYaGlpU3JDcWE0OWJBZmIyQ2NW?=
 =?utf-8?B?cTBDeDVNcmozSDBFQkVhUk9yMnB5OGRDNzgrNzdOMHYxY0FETzJhQ0lCdk5H?=
 =?utf-8?B?clZPalNHS2o2bVloNGkyNzZ0d0ZoekdZb1lMTXQ2TzQ1SzUvT1hoKy9oUVUr?=
 =?utf-8?B?dnhBcXRJbW1hUVRUaW41NkEvRDgwUGdHQW5kTDZBWGdMMGM4K1FvQnBlNGdM?=
 =?utf-8?B?Wm5lUHNTc2pWTitLZlpEaG40c2FoYzB0aDFaaHlhQXh0Z0o4aTFHVFRFa0NY?=
 =?utf-8?B?WWs4Q2w4TTRZSkY3d0d2MjN6a0VxUVFoSmVsK1F1TnlSUWw4YjRKbjJjbkNW?=
 =?utf-8?B?RGQ3Zy9TWG5IRHJpNUhPU3lOSlNpeS9NMkI3anJkbUI3QWdZNzJ1eFgzeGpG?=
 =?utf-8?B?dE5qR2pCVW8zS1hUaGFxWHRBUTF0UEw0eEZFWkRwYXBnbWo3UUQrRW1FVzdR?=
 =?utf-8?B?WDBMS2o2RExqeXRIaFFYTjZqQzBFMEFmelFOZ2ovbCtDb3RuUlFwMkpqV042?=
 =?utf-8?B?aXJEM29KYzJ0RFVWMFBLeDZLQlZGV0h4dGZNRzQ1eFY3M3d5eGVYZWkyQmd1?=
 =?utf-8?Q?L1aS4tZZz5+NjwXRu4P/LqOz6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a907f06-e529-42f9-c258-08dd02543088
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 13:24:37.2733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zu7ufQHEYC+wp455ViDaA00BViQdkxgLrkLG3hL5lNRNjzUCsiSTb1NoA9DrWTij9kuovyXSOeeC6445h5rDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6408


On 11/11/2024 11:12, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 08/11/2024 19:59, Ayan Kumar Halder wrote:
>> From: Penny Zheng <Penny.Zheng@arm.com>
>>
>> In Xen, SMMU subsystem is supported for MMU system only. The reason 
>> being SMMU
>> driver uses the same page tables as MMU.
>> Thus, we make it dependent on CONFIG_MMU.
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@arm.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/Kconfig            | 2 +-
>>   xen/drivers/passthrough/Kconfig | 3 ++-
>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 15b2e4a227..3699e148e9 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -16,7 +16,7 @@ config ARM
>>       select HAS_DEVICE_TREE
>>       select HAS_PASSTHROUGH
>>       select HAS_UBSAN
>> -    select IOMMU_FORCE_PT_SHARE
>> +    select IOMMU_FORCE_PT_SHARE if MMU
>
> Realistically, everything under drivers/passthrough is MMU specific. 
> So does it actually make any sense to select HAS_PASSTHROUGH right now?

Actually we are able to assign devices to different DomUs (eg UART1 to 
domU1) as long as the device isn't behind an IOMMU. So in our case, the 
passthrough device tree has this node

         uart@9c0b0000 {
             compatible = "arm,pl011\0arm,primecell";
             reg = <0x00 0x9c0b0000 0x00 0x10000>;
             interrupt-parent = <0x01>;
             interrupts = <0x00 0x07 0x04>;
             clock-names = "uartclk\0apb_pclk";
             clocks = <0x06 0x07>;
             xen,path = "/uart@9c0b0000";
             xen,reg = <0x00 0x9c0b0000 0x00 0x10000 0x00 0x9c0b0000>;
             xen,force-assign-without-iommu;
         };
So, should we still disable HAS_PASSTHROUGH for MPU ?

- Ayan

>
>>     config ARCH_DEFCONFIG
>>       string
>> diff --git a/xen/drivers/passthrough/Kconfig 
>> b/xen/drivers/passthrough/Kconfig
>> index 78edd80536..75ad403dd3 100644
>> --- a/xen/drivers/passthrough/Kconfig
>> +++ b/xen/drivers/passthrough/Kconfig
>> @@ -5,6 +5,7 @@ config HAS_PASSTHROUGH
>>   if ARM
>>   config ARM_SMMU
>>       bool "ARM SMMUv1 and v2 driver"
>> +    depends on MMU
>>       default y
>>       help
>>         Support for implementations of the ARM System MMU architecture
>> @@ -15,7 +16,7 @@ config ARM_SMMU
>>     config ARM_SMMU_V3
>>       bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
>> -    depends on ARM_64 && (!ACPI || BROKEN)
>> +    depends on ARM_64 && (!ACPI || BROKEN) && MMU
>>       help
>>        Support for implementations of the ARM System MMU architecture
>>        version 3. Driver is in experimental stage and should not be 
>> used in
>
> Cheers,
>

