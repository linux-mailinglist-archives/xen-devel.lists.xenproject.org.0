Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDDKHYDteWkF1AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:05:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2CC9FEB3
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215407.1525603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3MV-0002Xf-A7; Wed, 28 Jan 2026 11:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215407.1525603; Wed, 28 Jan 2026 11:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3MV-0002Uv-6a; Wed, 28 Jan 2026 11:05:27 +0000
Received: by outflank-mailman (input) for mailman id 1215407;
 Wed, 28 Jan 2026 11:05:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl3MT-0002H5-Of
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 11:05:25 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e6f1715-fc39-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 12:05:24 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7226.namprd03.prod.outlook.com (2603:10b6:8:124::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 11:05:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 11:05:19 +0000
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
X-Inumbo-ID: 3e6f1715-fc39-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1wm07pkd8OvyrWSPVbAMBEOc4AAWae7EyFc77DXkPfTvsrtMBDt9N/8Fn7qo7IMzZR/RokkLW+Z0zYN0tQ0/N2Tur0wXWMZPblowRiDy6vi2P/84XvaV3IhRAdfKHkmfnVlYxpqeYuGo1qA1JvNEoecPKbtagCzUl0ctvPqKIVfhjJWC/e+fGvu3YNDFTzTQCxb1gMZwaDN6qvtZVPICHiWnYj71NlV0M4aSYzivgpN6mS2VmEH9fr04lupepeB8KIK43qmk7ECuSdEiTmp7mfJr78DPOPI1oLL0tzeznP1Z7n+oO0HHzRhkLYkrPzLmOC9sZUBWO39WXid5s8cOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwEXH8Rbp648Hl7Vcy1v985tUSIx+/75NB144wvPfV8=;
 b=PZk8dFwI80au+t0ps89ZIpC+UPPSHvSOHp4EUo/swPjBMF/ao0u/1vNqtzHiRq0Y6PbFhgqUv39RthgAi53ApqHAVlNPvszbcFAhOK26L0qZyynMOwd6fchyWU0MIrwnxf/dHzUz6BAaVRBgnWecu3hk94jx6IOkQ0LHBRSPvEHzv2EmCequ9ZE218ZbomuxNRAWQIVDAdQRuLZIXamvyxO5Va+TiCeIQON1HDwM4Bu7jY1AapqZJwBq4xCMBm11gsHM8kTwzxGZqLSzapq7kw0r5fOj/6oxM2Z7m8aH6os8QhRBhS2Kkbq4yMOoonaCvs8DSyRFDkcfq0M/uJnefw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwEXH8Rbp648Hl7Vcy1v985tUSIx+/75NB144wvPfV8=;
 b=obXDicteBkNv/L3vUqkNDaPOZ3TKi3Y4dGDBU3HOSGmbtmXvakokN6GIoIIur0R0WJg57h32PN15Q+C64263F5srBcNHDMoE0fy/Gr+I0NhkZpDwqMyfiW0fpWX45OSdhl7rq7awZsIqwXM/IVfgRPAs8r+2e6wsvrpYN0b5ND4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Cc: James Dingwall <james@dingwall.me.uk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH 1/2] Partial revert "x86/xen: fix balloon target initialization for PVH dom0"
Date: Wed, 28 Jan 2026 12:05:08 +0100
Message-ID: <20260128110510.46425-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260128110510.46425-1-roger.pau@citrix.com>
References: <20260128110510.46425-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0211.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: bf2bf0b4-ed07-4beb-9574-08de5e5d1fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0pacGc3WktNVzVnMFgySDFrampoSnlRb05BMkZCWllBYitaZERqZ0hWdytT?=
 =?utf-8?B?Mmh4ZnVZeWNRblU0RGxKT2ozRDUxL2NzZUdyRll3NHEyOEdkM0JiWmdRenUr?=
 =?utf-8?B?aVk2eFJtdEZrS1pIS3lLZnlrRUZTNURlZkkrZExTRE8vQXVmSzZiR045bDRx?=
 =?utf-8?B?ZG5yUkZndWdPWm9RM1paRmdET05pMVlRbTJvekxQNTcwNzhJMUlrOHl6V29m?=
 =?utf-8?B?eHV4a2tGVU01N3BHNXYrV0ZWZTIrS3JmbWdaMFI1bkovRjJGbFpJaFdmMlFx?=
 =?utf-8?B?QlJSZHpHaDFmcm9yZnBmKzFKY3ZOT243Rm5jVDh2M044MlNiaSt4Q3lidVg0?=
 =?utf-8?B?MFhnelFKSHpDQm1xRysvOEJ6VzNzdTFFQ3VkNmJISWRNSWdzTzI1NHBaWEVB?=
 =?utf-8?B?U0IzTVVPNy9BNU5aN3JhQ3JpODVBYlViSE1LY1BIZWlFNDlScThLZVlxbm5W?=
 =?utf-8?B?bFJRVWRxSEpsbEs5L1BmM2h6a3FtZkN0UlJvT1dxREVydjIyaVRhRVNQNHFk?=
 =?utf-8?B?YXF0ems4eHBCWklsQVkyenA0clpBcDBUMHl6SGlIQmQ0aU5jcWQ1Nm5QaENm?=
 =?utf-8?B?VVF6d1RscG1PenlvcHRZL2JQWWRESWNmc1R3SFBHR1JBNWlVaklnRmVISjZa?=
 =?utf-8?B?T05vM0tZSjFWVEJSME1BQTF5TW9VcDRsakllcFJjOHRML1NMc2lPeWVKaFJK?=
 =?utf-8?B?ZWZISjYyNVdXOGpqYUordUYwNTN0dlZjTFNsdENBQU5teTJiamNyVXZtMXlx?=
 =?utf-8?B?TC9JcGx4RHhSU29WRXVVMkZKYTVGck9kS2l0OFBRR1ltM1Z4VzM2Q3JFVVh2?=
 =?utf-8?B?UVF2N3pZdUJpNFJqdFVscCs1eTdMcTJGcGh2aEt5TXFqTHBSbjBKMStVc29U?=
 =?utf-8?B?RG9NU3dPcUhLWUhyRE5CMjFVV09uSkNLVFZEVm9UT0JjTWcyclFaQTRCYWlP?=
 =?utf-8?B?MDRNaEhSWGd4UEdYdm15NVJaRGlvemVNaW04ekliV0IwWGZkVUY0d1BIV0ps?=
 =?utf-8?B?UlRaYjZMZTlXVnRRZGloU2xJRkl4cTdIMWZXSnlpcTdURTRVL1RoYTEyRThF?=
 =?utf-8?B?SGNvQkNqT2NtS2F2N2Z1MUJVamh4M1RHdzFBVzY4cmlycHl6azl3Tmh3dGY3?=
 =?utf-8?B?SlhINUJkL0lqcUdWOU51enhnZUtqaENDd1hOOFNSa2pNZjNXaVNFcTBHQzMx?=
 =?utf-8?B?dk9jbHk2L0I0Q3FibXg1bEsxemhYZDU1N1lnOGRTUlBjbFpPM09VdlpQWUxi?=
 =?utf-8?B?UWMzT2J4dWZuNUM4SnNrd0xySXFBbEZOYWI2bk9rVjdWMHUrNXpJQXpKazE1?=
 =?utf-8?B?MG9YYVZVMW15T1g5NzhZa3pMdGdJcTBYc0QrQklzYWs5eXlLcG91dVV6M1I3?=
 =?utf-8?B?ZmNlb0JJdGhGWGtTTldPRmIveHVVZTFqOGcwQi9SV1hnbU1OTGFWelp0MFd5?=
 =?utf-8?B?Uml6QjNFYkdHeHJ3U0h0QWVqSEpMTkswRHFLV1lkNGxVamVsYVV1Nkh5UUhn?=
 =?utf-8?B?TElOb3ErRUxBMnREOW5naDJySlVjNW9VS2t3VmtaTXdTOTNIUlFablA3bGVz?=
 =?utf-8?B?OXdBRnJNYS9aeXNwTVkzcVRRSnJYbHNRd0RkTUtoNEF0VzRaNzBId2lHblAz?=
 =?utf-8?B?WXR6VFkxb2pobFN2WHBPeTUyT1NEQnlDVXMzT1ZubHBkOWdxRFJqSzVGZmVZ?=
 =?utf-8?B?QUo3elpWQ2Z4Y1NPNXR2V0F1VkdCSi9iZklFVUZwdzVqaFRDSGJtWTJ0a2k5?=
 =?utf-8?B?Sno2NUhaK3J3VTlPTysrN0Z0alF3b0dLOHhVT0VHVTcybFIwbUV2Z0tjZ2dx?=
 =?utf-8?B?U3NvaThFZlVBZ2JDSGJtSmNSTlN3bzhrWlUwN052Y0pobkY3RG9jck1PREE2?=
 =?utf-8?B?M3pvYkt2T1JoL0kyemZqQlJwdGh1UUJJVm1vSm14OXRTaEhzNlZuUVgzcTk3?=
 =?utf-8?B?VWVsdThZUmc0akFpZVdGOCtBZHhBZTZLRGZzMzdvdnFvQlBDRXM0NHpTYW44?=
 =?utf-8?B?b1NZb2JCMzREckV0K3h4aE1abHF2dTNMQldvQUY2ekNKQThFWVU4Mlp6SHA3?=
 =?utf-8?B?VmVrR3JzajVtRlFuR1pjclJEd1hUVDJsNjl3eDhGZmJyV3A2QjQzcU5yZXh4?=
 =?utf-8?Q?+SuU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDZqMktrblJsdmtCRGxIUWorOXVtV1poRWJhY1VaV0VhY2tWK2F6VkV2MlRh?=
 =?utf-8?B?Zk5ZQld5OUhaait0WDR4a2tFdHdVbGVZY0ZhaloyQzJzTFdQNXE4aUg3cy9V?=
 =?utf-8?B?R0tGQWZsOEIxblRJNlpaZ3pHQlYrQ2w2bE00MFhIaGlqZjJObDlOcTlHdVdL?=
 =?utf-8?B?RWJpLzlxS3U0cW5jU1lWb2VCTnJvL0VnWmRHeTNSZ3pHcmlHMFRkc3pweE1Z?=
 =?utf-8?B?eU02amhvRitGZmFNWXBSV1htbnY3dmd1S2UvRGpLeTR2M0g1K05qZXY3VnZi?=
 =?utf-8?B?VUdEYzIxVWhkS1ovN2pJdDYrZWR6MFViSUlROVhWb2JtOWFzazE2TDBQbzJ4?=
 =?utf-8?B?R2lSM3locVUzOWwwU3BPcm9WVHhUL0VUZXdpNXlQVDJKY0NtMXhmamZFTXZ6?=
 =?utf-8?B?RkdsaFpvUWxDaTFEM1Z1Q2J2UHl4SnRBMmhhSG9rQzNwUHlZYUhTcTdaVllZ?=
 =?utf-8?B?S0tMaGFGNVpZUjZJRzNIYzlCRHBoczNpbXdmS3ZOQmVPcmtPOWpBRXJUR2hm?=
 =?utf-8?B?d2FQU0JyQ0s3YzBDMHpWUVBjalVzRFlIUUNyem9JdStodVNUcVZUQnlIZ3A4?=
 =?utf-8?B?SFNOZFJkSURnVGFCWk5lbHI4Q0RoSVprUHE4VjBmWUNmMDlYVGxnUnlmOFV6?=
 =?utf-8?B?WVU3SEtYRlE0d2FTam03dVVhUmFtYnY4eDl5NVd4TmpKTXoxckFybER3UEUy?=
 =?utf-8?B?Q0F4RytQNkhrczlpa2hxVzBIZTROWGZXTVRrakI4L0xOUjJQb3JLZVJSWEwv?=
 =?utf-8?B?TU53R2RaMEI3SzdaZjFqWUJaTjdLa2drNExsYWxySGF0aWdhaEhuK0R3ZVdD?=
 =?utf-8?B?VEZhZml5T0FWaDJBVGNXU3RhSFpYUHJaQUN3NENTcHRkdDM4RnFacGZUYVRP?=
 =?utf-8?B?eTFTdy9HZWtlRlRJVzMwVGdic0RZblhCd0VGWURYMFBUYm00cTlJYitUYjZX?=
 =?utf-8?B?cC8vTjlYekcyZkhGYm8xajIybEQ2VysyUThDVEl0dGF5cDJzRTVtaGpJU0NB?=
 =?utf-8?B?NDg1MkNCb3B2WFQ5c1JFVm5sVjg3T1h4alJ4NVhsWEJNQXhmUS92N0paY05U?=
 =?utf-8?B?ZEN1K1pzdzI2YnI3S3BOZ002NTdrYjhPVlBjMFhTa2s1SjNKclFYNVdwMlIx?=
 =?utf-8?B?SGtTOCtuNXA2MTNqaktISk9BK0pKTkRES042dHhLaWdoaVM1cDRtaUNHS1Bv?=
 =?utf-8?B?UFJJc1p4UHl0dFpLR0lZdVJCRmgvckxnSWpiQTg5eE5LUG8xVDFBTUdMU2FX?=
 =?utf-8?B?azN6dTRmd1pGbXc3SU01ZG1MeVFZZWhFci9uaTlOdFlZL2JOVmRUN09qNE5H?=
 =?utf-8?B?WVdGUU01enhlczM2aFpCMjNBZlhWZnVoSDUxaTFsaXd6K1NLY24vNStWa0dj?=
 =?utf-8?B?SHEvWGJhWmNTTFh0amFaYVZQWW1oL0hnaEhEL0FSQys1Y2lmMXc4WTB5RzBM?=
 =?utf-8?B?MVplR3NMcUlqM1VzUmpXT1R4amZtanZQSTNpalBtTkl3WDVpbmhoVVcreTZW?=
 =?utf-8?B?Zjc1S1VqZzJkZkZDcnphc01INjhVL1BwbmJOMEtGM0xrVExabEJvcmZwR28v?=
 =?utf-8?B?S2NCMnd2cU5QZ1NqcU9yL1dMQVM4MzViVWQ5d1A0UjhvQ1NzckVPcFE4OElT?=
 =?utf-8?B?UmRxMDQrWHJLUTZUVnlmSGxISTJ4MEdmaWJUekx2L254a3BZR2hvWURERXdl?=
 =?utf-8?B?cjJrVVQvcmRac2YrWVlwc3ZGbG0rdU9ZSXd0cUJnRkFQdVlqb05UMk5DbWFH?=
 =?utf-8?B?Zk5YMkdjTjNjQy93YzF5aUlhWXhsSWx3ZjZNYlFQMkJIN1FzQ3Awb2c4aXV5?=
 =?utf-8?B?ZjBzUExkejJ6ZGIvbmMxY2xXd1RycFd5dkJJNjdTV0Q5ZlM1ak03SlorclJE?=
 =?utf-8?B?K3UzSlU2cmdiU1dLQWIrRUZNSlhDM1UvaDhSQ29FcE12enhSR3AyVUpVS2Zz?=
 =?utf-8?B?TmRoUzd0WXMrYkYvejBjeXN2S2FucnFGL1FoNWhLZ0pPcUNxc3FhMVJha3d2?=
 =?utf-8?B?L3BlZUdvbjl1ZVJsUlNrVVcyVzdXLyt5VUtaK2hRaHFobDQ3cnRDNWZSU290?=
 =?utf-8?B?Um5zTy9sUDBUSm14dE1pUkJ3M3ByWDNSOWFzNFI4Qko0RWlFeDdFU3I4cTdm?=
 =?utf-8?B?WmtYQzZlRCtXOVI3RVRvM3VBQjRSd1RSOUowK0JWdjZMYlREZm9mSGNDdVVl?=
 =?utf-8?B?cm5IcVAvanpIbXRmV3VFUXBqNEQwRXMrQU1wRHBMSlBSSmdTN0lGVkg4VDgr?=
 =?utf-8?B?U3BqUFJCSFR5Vk9vOVRDRDNvLzFPVEhzOTdha2hCMXNKcjhzMDNmUStpUjlk?=
 =?utf-8?B?VVNWMllWZ1l5RXVpRGtjMGtOMlg0czdNMVI0dVVnSHVQVDd3R1dlZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2bf0b4-ed07-4beb-9574-08de5e5d1fd8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:05:19.4042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlrAql39KKVV6jcmDJOO6WS+A5SYjB9G3lx2XfmXMVs+eZx63fk4UQlPIEeAmKOJm51+w3cU5V8vBp7oIl5H+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7226
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,dingwall.me.uk:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:jgross@suse.com,m:roger.pau@citrix.com,m:james@dingwall.me.uk,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AE2CC9FEB3
X-Rspamd-Action: no action

This partially reverts commit 87af633689ce16ddb166c80f32b120e50b1295de so
the current memory target for PV guests is still fetched from
start_info->nr_pages, which matches exactly what the toolstack sets the
initial memory target to.

Using get_num_physpages() is possible on PV also, but needs adjusting to
take into account the ISA hole and the PFN at 0 not considered usable
memory despite being populated, and hence would need extra adjustments.
Instead of carrying those extra adjustments switch back to the previous
code.  That leaves Linux with a difference in how current memory target is
obtained for HVM vs PV, but that's better than adding extra logic just for
PV.

However if switching to start_info->nr_pages for PV domains we need to
differentiate between released pages (freed back to the hypervisor) as
opposed to pages in the physmap which are not populated to start with.
Introduce a new xen_unpopulated_pages to account for papges that have
never been populated, and hence in the PV case don't need subtracting.

Fixes: 87af633689ce ("x86/xen: fix balloon target initialization for PVH dom0")
Reported-by: James Dingwall <james@dingwall.me.uk>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 arch/x86/xen/enlighten.c        |  2 +-
 drivers/xen/balloon.c           | 19 +++++++++++++++----
 drivers/xen/unpopulated-alloc.c |  3 +++
 include/xen/xen.h               |  2 ++
 4 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 53282dc7d5ac..23b91bf9b663 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -470,7 +470,7 @@ int __init arch_xen_unpopulated_init(struct resource **res)
 		 * driver to know how much of the physmap is unpopulated and
 		 * set an accurate initial memory target.
 		 */
-		xen_released_pages += xen_extra_mem[i].n_pfns;
+		xen_unpopulated_pages += xen_extra_mem[i].n_pfns;
 		/* Zero so region is not also added to the balloon driver. */
 		xen_extra_mem[i].n_pfns = 0;
 	}
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 49c3f9926394..8c44a25a7d2b 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -724,6 +724,7 @@ static int __init balloon_add_regions(void)
 static int __init balloon_init(void)
 {
 	struct task_struct *task;
+	unsigned long current_pages;
 	int rc;
 
 	if (!xen_domain())
@@ -731,12 +732,18 @@ static int __init balloon_init(void)
 
 	pr_info("Initialising balloon driver\n");
 
-	if (xen_released_pages >= get_num_physpages()) {
-		WARN(1, "Released pages underflow current target");
-		return -ERANGE;
+	if (xen_pv_domain()) {
+		if (xen_released_pages >= xen_start_info->nr_pages)
+			goto underflow;
+		current_pages = min(xen_start_info->nr_pages -
+		                    xen_released_pages, max_pfn);
+	} else {
+		if (xen_unpopulated_pages >= get_num_physpages())
+			goto underflow;
+		current_pages = get_num_physpages() - xen_unpopulated_pages;
 	}
 
-	balloon_stats.current_pages = get_num_physpages() - xen_released_pages;
+	balloon_stats.current_pages = current_pages;
 	balloon_stats.target_pages  = balloon_stats.current_pages;
 	balloon_stats.balloon_low   = 0;
 	balloon_stats.balloon_high  = 0;
@@ -767,6 +774,10 @@ static int __init balloon_init(void)
 	xen_balloon_init();
 
 	return 0;
+
+ underflow:
+	WARN(1, "Released pages underflow current target");
+	return -ERANGE;
 }
 subsys_initcall(balloon_init);
 
diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
index d6fc2aefe264..1dc0b495c8e5 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -18,6 +18,9 @@ static unsigned int list_count;
 
 static struct resource *target_resource;
 
+/* Pages to subtract from the memory count when setting balloon target. */
+unsigned long xen_unpopulated_pages __initdata;
+
 /*
  * If arch is not happy with system "iomem_resource" being used for
  * the region allocation it can provide it's own view by creating specific
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 61854e3f2837..f280c5dcf923 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -69,11 +69,13 @@ extern u64 xen_saved_max_mem_size;
 #endif
 
 #ifdef CONFIG_XEN_UNPOPULATED_ALLOC
+extern unsigned long xen_unpopulated_pages;
 int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
 void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
 #include <linux/ioport.h>
 int arch_xen_unpopulated_init(struct resource **res);
 #else
+#define xen_unpopulated_pages 0UL
 #include <xen/balloon.h>
 static inline int xen_alloc_unpopulated_pages(unsigned int nr_pages,
 		struct page **pages)
-- 
2.51.0


