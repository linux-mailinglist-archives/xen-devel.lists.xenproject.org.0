Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F6B9C0157
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 10:42:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831587.1246915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8z21-0001Z2-Qs; Thu, 07 Nov 2024 09:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831587.1246915; Thu, 07 Nov 2024 09:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8z21-0001Vt-NV; Thu, 07 Nov 2024 09:42:25 +0000
Received: by outflank-mailman (input) for mailman id 831587;
 Thu, 07 Nov 2024 09:42:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWgB=SC=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1t8z20-0001Vn-Ei
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 09:42:24 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 957ead5d-9cec-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 10:42:21 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAWPR03MB9860.eurprd03.prod.outlook.com (2603:10a6:102:2ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Thu, 7 Nov
 2024 09:42:18 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 09:42:18 +0000
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
X-Inumbo-ID: 957ead5d-9cec-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6YzIwMDo6NCIsImhlbG8iOiJEVVpQUjgzQ1UwMDEub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijk1N2VhZDVkLTljZWMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTcyNTQxLjAxODg1Niwic2VuZGVyIjoiZ3J5Z29yaWlfc3RyYXNoa29AZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JM7M/jZ4xo1bf+kazui9cGGZ6hmQ09CvRlkGyeQNf+nX11UwnKFqrZ73oEjXt7ldNK5AF8udwide8AvJsyPH29mqtHfoKfh+Ykmv5IE7l7o1qLsEztq/+3J0sYF+khlHD5SiOHBQ4T6i7mbxtVLlvS9eI7t/Wqh8GjVPFHbFcMBiacYQ7W5LRZRDHWbGSSWLCufAbPgVb6c4Xp8Z3lG0eOA6kJSrJBcauJAX0d2biOAMf00a9Rj1XjTFBfZaZm4eQGU7g/sFC3QCB1YMaOxaBCcdYL/V4ZxNdA18n/p8GXt0A1cFDdb4FApK2WmxiVV3XpLrejfzPO1edWV8mp7dxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFiayGjTBRcI7cQ0abKObLDf+rLXE69e44c4qw3gLHU=;
 b=JO3Nl23BCXMJKTehje+UCT69j4YQMpFt9tyKx7bTb6qbWjWmSxEhNLynrKm05/ui1V7gNMxMxQ84arY3dESYwZemislK4lfU6RSjntZyP/97kgq7BkFNfMxekmQvuoC2yqjK1vL4f2xfPFeDbRktAcGGIeos7tNAGL7E/UuBBkN8/ki/cJnEdDp6Z5E1IBHWrqvPQBCOQmEU8YNd2IDbUngaPamNnM/eE6Pja2H6Dox+6zWH0/NI7y0qO7RxJ3gboLXvBMG7Z/rtNprzVlJ+YoIxhzNKMEctG6Dg+Lq58hzCNHAJPRWznpyyGmVqABAOCGSmL6M4ENS0KNv+nZb53Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFiayGjTBRcI7cQ0abKObLDf+rLXE69e44c4qw3gLHU=;
 b=ICkdR24ZJSZSJ0IMMPbaTSteFze2jszyC2xt44lhKShtfdI1Yc3WR87Ghb7/nwLx7+o1FhDb4u0XN3aO2XI86Vjmz8twCpXJWB/JVZV9TAHoMeslqUJGziU25DRNpOUo0n05lgLDCQuBdBhDlRGGUWPqQGRoW2+/DEoylQBiaEG38BROlF7hHKjfSauW8wH13NIe3DUysGsXdlW3phQ5sCVJC4jsHrSP/GUTbqQpmIuyRWw2FmcBEX2Ip3JEJmM3Olcyta0wc70Yq2sPSSz42zs9BlAXlTV4e8FzUcEDNgCgh/NKEHIRMsCm/EM48RDkLBbLo2SR+M609XTI/vP3DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <e6bfae0a-4d8d-4d41-9046-30400da45cc0@epam.com>
Date: Thu, 7 Nov 2024 11:42:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
To: Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
 <FA4FF581-69EA-46C0-A0D4-D327B167A4D6@arm.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <FA4FF581-69EA-46C0-A0D4-D327B167A4D6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::6) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PAWPR03MB9860:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1728dc-c972-4139-5956-08dcff10784f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzJNNi9ZWmVCYXY2N0RZMUpoQWdlcjZZQmIvY3lUVzlhKzR0RUMzS2RPdldl?=
 =?utf-8?B?dTM5MExlQWM5RjJTc1pETFFCbllSbDhnSFdkVnBMMEZxY09hREtpV29VaFFX?=
 =?utf-8?B?eHNLWGZzcC8vanN4ankxTU4wcTVhRzJmd09jRXB6SGp6QlJmdXFlL2pwbTJU?=
 =?utf-8?B?dHlsajBHODYzUEhmTFpNdk5SbDZYMFVoSU9kUFJmdlpORjZYaCt1QWJjaU15?=
 =?utf-8?B?YjY2UGdhQmdxMTROZTNMK3ZuYWJzR1dLYnRYSnluUjN2dWJFd1YxdXNiU2Zr?=
 =?utf-8?B?MTIrZlBrWEEzVzMxNzc1dTRNSTcrekJLN3F6RHd6OVNIZUNkUGEwUDlFdDE1?=
 =?utf-8?B?bVdLM2lUWDZHaDFPSjFNQzBnc2tialZ5UFN1T0FWd1FOUWhtVmxXS1l3RzI2?=
 =?utf-8?B?OFR1bXhhNER4REF1UU1HaGZCaUZNN1J1R212WFdSVHYwQ09CMVN6MnFMRlli?=
 =?utf-8?B?NHptTlFreU9yZDY5OW9PZHVUc2RCdjVIZ0RjVUJudEZ2d3dQU1MxclhEbnVH?=
 =?utf-8?B?QmtDTWYrSVpLWHZBV1JPWTFURnA5VEthVy85UWNuMzNxakNnNU1sNFRFSGRr?=
 =?utf-8?B?VzYweHZPM2NKK0lRL3E3RG81TmhVVFZtcXF5SWU2ME95b0pFblNhRVZLUFNo?=
 =?utf-8?B?RnorTXRyQ0xYQTV0aDdTZGtnbm9GQU8xNkdwdFF3YXRnRTdFaVdvNFFnYXhu?=
 =?utf-8?B?VmwrcFV3eEZoaDlHalJodzNVQVlwaElhZmRjdytkWmJ2LzE0QUwwRitFdDhC?=
 =?utf-8?B?SlA3cFY4TGVwRnBtQytEMXRLclVKS09uTDhXSnl4YnNXamZMOG12Y0IwRDFT?=
 =?utf-8?B?VnVxMnN1V0ZEYkhiV0J6MVdPTERNd3BtVEVvcnN5aVZwV1ZTZmdWRUtkdnpm?=
 =?utf-8?B?TlozTEptcTEzbG1GN2JJc2txdU8xQmRLYi96Zkc1SHFrOGFqbStLaFpKbyt6?=
 =?utf-8?B?YlQ1UmZaYmhyUTF3MlFLclQ5ak14akhTVHRRWXByejlrMXhKRCt3YUY4dnFj?=
 =?utf-8?B?TWExbUkrNVNqeUQ1YXowZ0pudnhUSDlXZkJydUpoYWd0MVVORWsyakQ1VTh4?=
 =?utf-8?B?RWkyQ3ByYktQMjlFZE5HRW1WTEo5ZkNEajJqSkpGbnVqU0lYWDV0a2hmRGxT?=
 =?utf-8?B?YVBkdWhLNTRWK1VqVDBVN2I4bjNhbEZvdTMwK3Fad2N6ZWM2T0lxWDNVNitR?=
 =?utf-8?B?aytrbkJ1MkRVZnplVitNd3gvQ293SVNnM0VtbERJYkg4a0RBQ2dFU0ZnNkRD?=
 =?utf-8?B?VkpzOEh0bFh2TzdQYzliZ1lMZXMwWEtqU2Foc1p3NjB5ckpRdXY4bUdnOTNN?=
 =?utf-8?B?WTFxMkxKanZMeDA3dEJQRHBaR21RYWZGQlVrNnRVeUxZUTM5ZkZQM1prdjlt?=
 =?utf-8?B?R2VuNk5VRUpqN3VDWHhNVk5aQ0ZCMTJlbzRscjBCcnRGdTh6KytOcXlEUzJy?=
 =?utf-8?B?S1RDTmFuZU14VWhnQTlxb2lMS2JueE1MbVRWS2RIb1lBYWh0U21SU2xKeWtW?=
 =?utf-8?B?TEFCeVJBYVZNMysxTVNCbEY0cEJORVVpaUQ3OWNqZEFFKzJaWkdRcjUwMnh6?=
 =?utf-8?B?bkY1SHJSNjlVQmxtS2M2MXV6TkhmK3ZoanlDK0NHZHZOZDRDWHIzQVh5ZitM?=
 =?utf-8?B?M0R2MVVIUE1uMlUwdUQ4cjBWUkVzQnJUS3Fub2pnZ3phdThrTE9iTXdsVGNG?=
 =?utf-8?B?TllwOHlFSTdSVVM4NE8zQlZBd0V3R3M4bHpGeFNzN2p0MWYwVFVSMHhrQm4v?=
 =?utf-8?Q?U4FUmrLYjBpZyZQlgrFaEukLs8P3BPwLIYeg5Vw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXpieEhtcWNGeEtOeXFXaXJ0cTZlR1VIZEpyZFdvdmxMY25TdDBRR09ZRUJx?=
 =?utf-8?B?MjZlTk15cHFMMlNJd2Vvc3dRcTUwbGVrUkZWdEJOalVhZGpHRk8zWFZ0R2lY?=
 =?utf-8?B?VGl6OGM2L2FwWWZSQlZORHAxSzB3UmhnNGlQYmUvQyt1SThJcDkwUmFIZGEw?=
 =?utf-8?B?M1dYRmEvbSt5RlNzcFhxWmF1OVFzbFo1YU9SREhCSytSR1hhQjNJaEpSNWZE?=
 =?utf-8?B?MXJ4bWFUVk1jNmtnNk5iMVJHMHZmQnR5ZUNhOHZDRWFOUTB4V0Qzd0lTODlJ?=
 =?utf-8?B?R3dyT3F4YkhIelp3TEFjRVhyZ0NKaUJHYm9Kb1BRdlV6NjhHWENyRmpGQzMx?=
 =?utf-8?B?SHl1dWFQd0VkR21jSW02YW05MkFTUGMvUHBCbWpSMzVndDdaS3VmL0wrQk5D?=
 =?utf-8?B?NWJEOUdmOEZpMEswNmJuQzJkOWwwZnNaRTNZL01qZk9SRTVubjZBSzVHdlA1?=
 =?utf-8?B?bnJvVXpBM29KTmlWdXhSKzEvWG9oNVN2RFhCSjAzUTdPQlRuWGNXTHNJbWVs?=
 =?utf-8?B?dGszS2x5OXI4Uk0rc3RLd1ZLZS9ZajVZZisyWXFveWNLcktXalNZTkRoT2hy?=
 =?utf-8?B?K0pNdkFhODRiSlFvMzFtUTB0Z1djK29XU2hydHRqWTV1b0ZjcXV0dUNqWUJV?=
 =?utf-8?B?OG8vYVhQSU1zOFlONW84ekxSRWNFUEh1WjVlLzR0bWRVVk1xQmJjMVhVNXhW?=
 =?utf-8?B?TG8vNEl3WUFrOHk5ZGt2V09EUGxvdXpyMEtFK0dvTXNoT01YcVV5U0lwTDNl?=
 =?utf-8?B?RmRKVlArU0pPZWpWd2ZSa084RzlhUHBsTW5nbGFvL0VHc0hBSGhEYUczYnhW?=
 =?utf-8?B?NzRZN3RDVjRpcEpINVY3a2JkVjhlNk1PMkpkTTdGVUJqYmV6VU5xblI1QVNT?=
 =?utf-8?B?bUtzeXVYcXo0ZnpCMmNyV3YrMlUrcTQrRjhVWG8yZmRsc0d5bUxKL1VFY2Uw?=
 =?utf-8?B?NWU3UEk4a010UFpZTTdBazFnRWdlcUdZUjU1Z3ZCdCt1dEdUaldBMmVaY2Qz?=
 =?utf-8?B?TE0rYVBRTTZiaXFTc3locVpZc0M4OGZXcGRqT2hJMGtJOWlGKzVneWh5VG1W?=
 =?utf-8?B?R0R5RDVYNmY4N01jN01Tai9WUllWZkJKTDlydHdIY0VnVDVnTHlOL054Z2U3?=
 =?utf-8?B?MHJEcHl1cWg3eXdnT3ltZVRHdS9HaGUyUm8yYkdmR0tRRjAyc2l3VlloTXAw?=
 =?utf-8?B?QkMwSGtLbmk4YXRrNE1YaTVXVEYvdCtUdXNGdzhrb0VXMXZXcGlWZ1BOVjAv?=
 =?utf-8?B?bGhJVmJ1YzEzWGM2WDRUUjN0RDdaYlJhZE5pUnBUOXMvS0tmbnZrdlliaTNZ?=
 =?utf-8?B?QngrejQzZDdXRXBNNm5tZ1VQL3hnanhic1M3ODUrOEZVY2lMOWFhUVJjRW9q?=
 =?utf-8?B?V2FsVC9FZEZiZUNKb3FaR2NvbW1wbjVCS0drRWErVE5rQkdGWlZLK3N1Mi9l?=
 =?utf-8?B?blFmaUQ1QVpkemlrZi9yaEt5SmdrTUs5VkxNSmNGT0lJZVhqZTcxaUhXdVBX?=
 =?utf-8?B?Q2UxYUN4K1cyQlI1NnIxRUE3SEdwV1poTlY1emdEVFROblRSaGtockZiMFpY?=
 =?utf-8?B?NmJ5OCthYUd6M3M5NkNDN3F0NS94cXNLc3FKYkFLNWMxekZnSm1aSS94VUpL?=
 =?utf-8?B?NExsa1lhSWVNUzRIRmVRVytuREtaeHh0WFV6OFNoZjZJZnJ0RlYzYVBDTG5T?=
 =?utf-8?B?amlRRnZMMHNJOXdrRzhqaEJrUHVYTUN2aEJRSTBJc3dWN2cwWXE4Q2xqeWdy?=
 =?utf-8?B?Y2UwZVBubU9weEFHeks3WGl6ZDFXRVh4eXhYa3VDQk41amo5V2JWMk43Tmhn?=
 =?utf-8?B?Mks3S2JpbGxQUUdnQ3M3R2RHNTBRUWdyT3BvNFA4OU1KMmNFc0ZZM1p1U2tj?=
 =?utf-8?B?NnFLMmNCZENCVjFrTGZDVG9nR1I2d0c2UktOaDdCTSswM2lIcGFRcStTUDlr?=
 =?utf-8?B?S3VKTnBWNHZ5ekdpQlo2dHNxc2dOVnRHSWE5ai9jK3FBMi9hTFh1aXVCbEM5?=
 =?utf-8?B?U2VlZ3RRVlhOTkJkQ1Axamp2R0VLTFJqU3VTeTM0OFI4N1E5S1kxTGZneStr?=
 =?utf-8?B?Sk9ydWdLdWtiV0pnejVhY3JTdnpSWFhWS2VDMlJHYzEwQVNKeU50WkdpUlZQ?=
 =?utf-8?B?dndkS09tcnVUenJEc0xmeThOSGdjTGpSbExETGxUakpPNG0yUnE0a3ZXWElT?=
 =?utf-8?B?blE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1728dc-c972-4139-5956-08dcff10784f
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 09:42:18.4253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phT5XIM8OaneUQrNkf1laEjXpVEuhy0/7mEC5sBLgqs488e9gpWhu6kYcLUKBxicC02VBZoklMyqSXxuy5pGLWharznCgmNXbW+ifPuaLl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9860



On 06.11.24 17:16, Luca Fancellu wrote:
> Hi Michal,
> 
>> So we have 2 separate issues. I don't particularly like the concept of introducing MEMBANK_NONE
>> and the changes below look a bit too much for me, given that for boot modules we can only have
>> /memreserve/ matching initrd.
>>
>> Shawn patch fixes the first issue. AFAICT the second issue can be fixed by below simple patch:
>> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
>> index 927f59c64b0d..d8bd8c44bd35 100644
>> --- a/xen/common/device-tree/bootfdt.c
>> +++ b/xen/common/device-tree/bootfdt.c
>> @@ -586,6 +586,10 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>>
>>      add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
>>
>> +    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
>> +    if ( ret )
>> +        panic("Early FDT parsing failed (%d)\n", ret);
>> +
>>      nr_rsvd = fdt_num_mem_rsv(fdt);
>>      if ( nr_rsvd < 0 )
>>          panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
>> @@ -594,10 +598,14 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>>      {
>>          struct membank *bank;
>>          paddr_t s, sz;
>> +        const struct bootmodule *mod = boot_module_find_by_kind(BOOTMOD_RAMDISK);
>>
>>          if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
>>              continue;
>>
>> +        if ( mod && (mod->start == s) && (mod->size == sz) )
>> +            continue;
> 
> Ok I see, we skip the /memreserve/ entry if it matches the ramdisk, fair enough, I don’t have
> a strong opinion on how we do that, the important thing is just to unblock the users experiencing
> this issue.

Don't know if my opinion would matter here, but Luca's patch looks more generic and logically solid for me.
While handling only "ramdisk" somewhere in the middle  - looks more like a hack.

Any way, it's up to you.

BR,
-grygorii

