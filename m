Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AFD9B9646
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 18:10:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829232.1244323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6v95-0008A4-Eq; Fri, 01 Nov 2024 17:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829232.1244323; Fri, 01 Nov 2024 17:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6v95-00087V-Bl; Fri, 01 Nov 2024 17:09:11 +0000
Received: by outflank-mailman (input) for mailman id 829232;
 Fri, 01 Nov 2024 17:09:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1/Ab=R4=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t6v93-00087O-OQ
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 17:09:09 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2415::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fddcf35a-9873-11ef-99a3-01e77a169b0f;
 Fri, 01 Nov 2024 18:09:03 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA1PR12MB6773.namprd12.prod.outlook.com (2603:10b6:806:258::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 17:08:58 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8114.023; Fri, 1 Nov 2024
 17:08:58 +0000
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
X-Inumbo-ID: fddcf35a-9873-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjBiIiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImZkZGNmMzVhLTk4NzMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNDgwOTQzLjQ3NTI0Niwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkUJf3QyrAcmKHwQ0+CSDjFI1U6T5vorJCjCIdNJYib4qqs850NeMoubEwRTcv8rY+VLGmFBRUhjMcTH6CCnDGF+x3YdM9npwM/HFEn3FD5rc5y5QZKGE6xNOTVml8Exmalj851IZmP3Skz2H1H/1Zj7TbFN0pNy0KyK1q0hp2vWMuj9eaCQwJnPIHV4C5qpPitrb/9B193SlmQd1xb7JhiRcCv16+1GMqQZNZ78sE8SWxvNHXjKIYG2YfYd+w2LVJRB4Wo+YS66nNR+JWzustWr4JO/bCZMH2HzLLNzEEiicPJg2CTilgM9UOXdDFKO8EX7lMqzqZ3KiHyGKafErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfAlsY6zQeyYagziqZI6lT4iBOtmU0SYNyJ+YvD4dpA=;
 b=EQh5mzBBLP/GI9IqD91f0+qPf6JIzqHuha6g8K7RERQUau7+SPlJZaj6c6/m0ClrIN5lUAF/A7f/Z+caJAlNefWKOcx4WO6zNVYRg0XyoxqTfXFMGCDL27oVHFxeUsJPB/iFyi/wTVagAimqK0EYPIunze1HRPcVttG9Z3kqQPoEwSyxihuUt5Kf6hIosi7IpxEkYNiQuxjrv/BbRf0sr10ZTz5iyn2Gh3cRZmhEtF5iC73cpHClr64Fxz1ZrE5giIg9wSDQr7iPlDHwLZY5HXXh82sfXsAV47Awh3AjAmHgaiUd+Ypg88BkJw7s721T2WqbMkUyM8vzXNLM80Vxcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfAlsY6zQeyYagziqZI6lT4iBOtmU0SYNyJ+YvD4dpA=;
 b=DDER2pToGmFd3aRFKmSbHR1qzmbMFWIbXskiE1JuYNAByBlLkFEkdcPd0G+TCO4CQE3xGkXKDwjpkzvDwxKeMqzYGLbNa3QLx3IwVNm4zDWAFTSXioT1n8YcYaNmTVimQ+3p28gP6+nRbKcljbx94dNCzhiHa/1l6Ai9crHruCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <cb90cbaa-2b1b-4f9c-b475-39214e471d18@amd.com>
Date: Fri, 1 Nov 2024 17:08:53 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
 <dcfb8c04-78c6-46b4-868b-96bf24d1493d@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <dcfb8c04-78c6-46b4-868b-96bf24d1493d@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::12) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA1PR12MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: ca163622-47fa-42d1-da6d-08dcfa97dfaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXp3UXFQODVNOWJuQ0pqV3JEUktLSDRaT2dXK1ROaFk1amV1TTV2ODVEM0k3?=
 =?utf-8?B?Wk5wKytVcnpOOGZYckJINWJGZ0ErMWU5c2w2UGtXZ0tEcnc5TkJvb2tXdktY?=
 =?utf-8?B?NEFjbDR4VHhRRjV5SjFHNWNRRUhLRXNmRlV1R3ZSZG94R1grMnFCQld1Y2pV?=
 =?utf-8?B?Sk80ZlVvWDRlU1FEaTRRQkFrd1U5T3RqL2U0eEtjNGRmYmZHODZHTHJJdnAv?=
 =?utf-8?B?Z0lhckZFMW0rRVlSaHJuTHJEQkNSWXVrc0M2YzhBUFhiV3h5a00wV2lCWjFD?=
 =?utf-8?B?OFEveitxR0VQOGxDZ2ErT1RRTjR1UUVmNlpvK0VueG1iZWdXTndvTDhidFpQ?=
 =?utf-8?B?Z2d3RFh1OEdnUGVvRlZiZmxKMjAwYit3WllOUEIyZzJFUkhvZzZmaWxQYW1F?=
 =?utf-8?B?dVpmWjB4ZFRCV0M3aWlCU3hUMSszS2svaVVuNi9DNk9xUU1SKzI1UkxWUkZ1?=
 =?utf-8?B?Zkw3cnVVc1VUaUczQ2tGZUhQZEV0bGQxd290NTNaRjU2NE1BN1dETGZXeVBu?=
 =?utf-8?B?SFRtdTlWcU9IaW9CRksxY0lDTUIycGtFMFZDSjVIMG1EanZSck1HaDQwUTNS?=
 =?utf-8?B?RjF0OFljMk9tSUJoQngxd0RmRGlEaURrNGZGK3pwak14RlVDMUduMEQ1TzVU?=
 =?utf-8?B?S3V4blRIbzk0QVIzellMM1hsYWkwa29GOHplWXdFemJMMlg1ZGp3akF5Q0JL?=
 =?utf-8?B?QnBxb211dFdYcThKd3EvZHQxUmdsWSs2ZmgyWXd3RmZpMnRDakR3UTV4QVpB?=
 =?utf-8?B?bmRyY05VRlYycFZMWXhPdDFKbDgzZmNta1R2QWVZRW1XRTBjZFhrZ2hYMFFu?=
 =?utf-8?B?am9ZUVpGU3VEUHpLV21neGVUTFlnSkxkMVRQZWk4OC9lODF5TGR1QTFqMG52?=
 =?utf-8?B?c2VxZGRhQmZkZ1FyWW1KeW1NcVl2QWovb1RtQklvY29tUjR3MmR5OVNCemJN?=
 =?utf-8?B?eHY4TUt2c0YyS0gxWlFwWjVNOG1PakozOTF0MVNTSEVjSzI3RVMxZXJvam1r?=
 =?utf-8?B?aERVYnBwaGppUU9MWlpaMlNuUnQ2Mnd6MGRla3R5KzVHRDl0bXR6aUpWQ1pX?=
 =?utf-8?B?cWZWczFiZW00YndjUy9aWnlQUkwzTFJOaGZHUkUrT1k1dWVINWxBUW9iWm5U?=
 =?utf-8?B?cGxIa3hTVGd2RzFNOWwvQ3FBNG1pTkRKeFpBYVR6QkRtUk1yT21xZldRMm53?=
 =?utf-8?B?UjM4K0VESXc5Q0hMTW92V3VYZ21tczJVcmZsQzlKMVlOaTUzVGRES1d5emtw?=
 =?utf-8?B?cmp6RFdhT2ZLZXFDOWtGYk9LZEJjSG93RVVwdnlwWHZreGZza2p4SlptbHNv?=
 =?utf-8?B?L1pEUjcxcDdFLzZMYjFjL0c3THpVaG1oL2RKOUM2T1JwVjVqRDNsNEMvQVhv?=
 =?utf-8?B?UEVFRGZpSUtVV2FXTXN3bnZEWis3VENzSHVzbFU4QTRkQjZBNlc1SlM0YWI5?=
 =?utf-8?B?eHdqNWhhOXd1cHFDZGVOTk81MnFLZVlPWHd0dXdtNDlmOXFBQnRKK3ZwOFQx?=
 =?utf-8?B?S3ZXa3FMQkhKZUtLcXMzdHQ2c2cxYkZNTDhsNkY4VVV6M1NEWTh3MktPVjF0?=
 =?utf-8?B?YVNHRzU4NzlRVVBkT3k4dUpCZk4vMWNUbWhXcE85YnE5Y1dzYkxmSGllc2hw?=
 =?utf-8?B?L0dIRXpaSDBPVEFMMkoyUGx1T25wdVhKWnh2MnpqbUh4QTMrR2x5N0MvS2tk?=
 =?utf-8?B?T0FZQ3pwNVRFN0hzRWVUcFRtS0lqNEdSYWl2K0d5Z2NBMS94NlFSR1AxQ2FR?=
 =?utf-8?Q?NsXLclAVM0E4ue0nPlFStbqQPVsShpBWwFjY5+U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEpxcVlWUlFwV1Nnc2Y2SWQ1TWdVci8vaC81dEFLOGxOa3c4cFpsZkNUeEg1?=
 =?utf-8?B?bGI0Zm5WV2g5VjdPLzZoSGdjNzZtSFRzQXBHbndjcmJ6WFAwWTZoTTlTWlpV?=
 =?utf-8?B?MjY0TGRLSU51bXBHNmRhTW9hdXJYZitRa25zMTdLaDJ6QWJpQUxMeFBqOVBP?=
 =?utf-8?B?QXJvMldvb0todXlLcStkWnFEb2pGcDV6K2g5MzZUUVRzWmRSejJHanJ3YThr?=
 =?utf-8?B?VnIrc05vS2hNNThmUHY1T3AvZmNVUFBvZHFhWkJnT1gydkdKbitvaXo0TVJI?=
 =?utf-8?B?R0dzUzBrZkhDczJ3NTFqb3JvNXVoa09ycEFublA1OWZNUWdtRGpHUWtYSlZx?=
 =?utf-8?B?bEoxSk1vbDUzN3V3QnZ3QXcveG12MDkwcGdpQ25hY1diaWJXZE05aTNrSkVX?=
 =?utf-8?B?U2YzMERhYjczNDJoNVEvTkRyVzdLV0NZYkRpWllETTkxbUNQdFl2eTBIdXYr?=
 =?utf-8?B?MFpPbm1hMldzbE00bXJOOFB6SWJNVWFJUWJPRzF4Tkw2VEVzbGswbUszdDd5?=
 =?utf-8?B?Lyt5d29UbFUvaDNTTlo5R3RjdUVySUJITHlrUzdyNUc0bUppQlRkWWNEMVdo?=
 =?utf-8?B?VkJUNFdVcHpJUEJJeWhxZTJrMlV0RDRaZHVnSDZWNFozUUVWekF4OVBlQ2U4?=
 =?utf-8?B?VWptY0dtaWNlTGxzd2ZiUkxPa1FRU2tVSUhOcjVaMFg5dXRvT1ZwcnJUZnRu?=
 =?utf-8?B?OWN1eXBiZ0lZZGFuOEFrNWtpTklGUUF1ajMxZENnc2dUaXlIWU5aRGNIQ1Bw?=
 =?utf-8?B?MXFCVTdOSk5aczBmZmI0ZWJvaUp6dTZnS1VoUjNkVXlRZFZEZWJJdE9GSG15?=
 =?utf-8?B?cHFyVUE0bUh3OHRGa05nVEd6RFdoOFdPZFV1N2g0TTVMZnZsWHB3em9VdlE3?=
 =?utf-8?B?TjNDUkZPcGpRNlJBZW1WNjAvTjlBNTVCWEdvcnJqeDh6TWhUUGNHVVQxYlA5?=
 =?utf-8?B?UlAwZHFHMTNiTUtVN0kyT0VqYnNjUWxLemJjK1JaQ0V2Q25FY000M2prcGJO?=
 =?utf-8?B?QjhkOXQzZDNVNVl2UTJQRnQyNUNUbWhPREhiNWY5eWFzSmNhSmFldnIxOWtT?=
 =?utf-8?B?a1M4bGkwOG1mUXVCUEJydytCL3RhRFdGV3A4Vm05VXMvOUpaS0x1YnFPL3R0?=
 =?utf-8?B?RXNBUHIxSHhJMjB5MWZicGYycEErZVNqYm1odStMci9JQ1N2YzhwcGd3d041?=
 =?utf-8?B?SHAva3dKcmVaTEJUakJkMWJ2akhleGJkLzliOW9tZTFZRDBucXUrSUNCSS9G?=
 =?utf-8?B?VVVBdVQ3QmZXNTJ4Q2JGaXRJSnhUK1VsbmpsMGsvcllINWtrUE9mcFRlTTNm?=
 =?utf-8?B?STV0RlQvK0tYZGc1QytvUzJJVzBienRKRUNKOFVIQisrb0MwWFNXdi8ydTcz?=
 =?utf-8?B?U243aSs5cUhIdUpGaWdhZHBvMU1LOE5YU2JyVDVmQzAyZ296WngweXhOcjJD?=
 =?utf-8?B?bGNrTnI5OXh4Y00wc3hGaFVhNnJHaXcyL1owbGxWSVpDakpWTmhRUUEyVkhl?=
 =?utf-8?B?Tyt1bzdSS3lUSys1cURVTTU3RHRPZXQ5eWNSajAwSkI0Nm5iVVdzbWVLVEgz?=
 =?utf-8?B?NnBERkpFQkNnTGpWRzhlS3lRVEpnZVhnV0tuLzI0emhTWEpVcldldzNNZmN3?=
 =?utf-8?B?VWxZYnRhcGJwbHlneVJQNkZFTHc5VWxCblM2Yi9lYlJ4dml3MmxDWGpBakl5?=
 =?utf-8?B?bDhQVDQ0R0ltSGI1dmk4cy9JRGhsclRYZ05Ha1FrRkdRWjNjVnNVZnRpZ0pC?=
 =?utf-8?B?c1VML25SV1JiS2VTOGVBUW1ROHdrL0Q1YWZQMXdOVjFzeHlqaE4zY1UyRFVV?=
 =?utf-8?B?aEVVNHJoNFNQbUF5cHZIaldoSU1nWHUxK2dsdklKR0ZGVzY4SG4rWVdhVCtq?=
 =?utf-8?B?b1VqajdqTHVKNzhZSVR0anVIbzVucTU4ZnloT2VMeW03WDRlSS94OWJGUmhH?=
 =?utf-8?B?RGk2b1lrQnRqTjdQYlB0Rk1Zbi9Sa0xTaGJuRTlRUHZiSHMxS3ZlcGlFNndR?=
 =?utf-8?B?M3l5MTlJdHdwMTN1UUlESThCSm9NNlhoZjBuNEVoUDc5cEtLWE1hYkRlRUJD?=
 =?utf-8?B?ZnYyNFJjdS93eHhScFJLVVIzc01wdFpHcXJrcG5acFBYWW4wZWI1QklTTk1W?=
 =?utf-8?Q?FF0oySFzMo1CNVC3d2wNNo+/A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca163622-47fa-42d1-da6d-08dcfa97dfaa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 17:08:58.1019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNgv99KZDildAQy5aCCeyddety78RRDD2XJhmI/37Fp+Mdo0GfnX75Eh59yLZsByEipZw1/xgDAu+fxgA5s/MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6773


On 01/11/2024 14:11, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 28/10/2024 12:45, Ayan Kumar Halder wrote:
>> Define enable_boot_cpu_mm() for the AArch64-V8R system.
>>
>> Like boot-time page table in MMU system, we need a boot-time MPU 
>> protection
>> region configuration in MPU system so Xen can fetch code and data 
>> from normal
>> memory.
>>
>> To do this, Xen maps the following sections of the binary as separate 
>> regions
>> (with permissions) :-
>> 1. Text (Read only at EL2, execution is permitted)
>> 2. RO data (Read only at EL2)
>> 3. RO after init data and RW data (Read/Write at EL2)
>> 4. Init Text (Read only at EL2, execution is permitted)
>> 5. Init data and BSS (Read/Write at EL2)
>>
>> Before creating a region, we check if the count exceeds the number 
>> defined in
>> MPUIR_EL2. If so, then the boot fails.
>>
>> Also we check if the region is empty or not. IOW, if the start and 
>> end address
>> are same, we skip mapping the region.
>>
>> To map a region, Xen uses the PRBAR_EL2, PRLAR_EL2 and PRSELR_EL2 
>> registers.
>> One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System Control
>> Registers", to get the definitions of these registers. Also, refer to 
>> G1.2
>> "Accessing MPU memory region registers", the following
>>
>> ```
>> The MPU provides two register interfaces to program the MPU regions:
>> - Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
>> PRLAR<n>_ELx.
>> ```
>>
>> We use the above mechanism to create the MPU memory regions.
>>
>> MPU specific registers are defined in
>> xen/arch/arm/include/asm/arm64/mpu/sysregs.h.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1 - 1. Instead of mapping a (XEN_START_ADDRESS + 2MB) as a single 
>> MPU region,
>> we have separate MPU regions for different parts of the Xen binary. 
>> The reason
>> being different regions will nned different permissions (as mentioned 
>> in the
>> linker script).
>>
>> 2. Introduced a label (__init_data_begin) to mark the beginning of 
>> the init data
>> section.
>>
>> 3. Moved MPU specific register definitions to mpu/sysregs.h.
>>
>> 4. Fixed coding style issues.
>>
>> 5. Included page.h in mpu/head.S as page.h includes sysregs.h.
>> I haven't seen sysregs.h included directly from head.S or mmu/head.S.
>> (Outstanding comment not addressed).
>>
>> v2 - 1. Extracted "enable_mpu()" in a separate patch.
>>
>> 2. Removed alignment for limit address.
>>
>> 3. Merged some of the sections for preparing the early boot regions.
>>
>> 4. Checked for the max limit of MPU regions before creating a new 
>> region.
>>
>> 5. Checked for empty regions.
>>
>> v3 :- 1. Modified prepare_xen_region() so that we check for empty 
>> region within
>> this. Also, index of regions (to be programmed in PRSELR_EL2) should 
>> start from
>> 0.
>>
>> 2. Removed load_paddr() as the offset is 0.
>>
>> 3. Introduced fail_insufficient_regions() to handle failure caused 
>> when the
>> number of regions to be allocated is not sufficient.
>>
>>   xen/arch/arm/arm64/mpu/Makefile              |   1 +
>>   xen/arch/arm/arm64/mpu/head.S                | 122 +++++++++++++++++++
>>   xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  27 ++++
>>   xen/arch/arm/include/asm/mm.h                |   2 +
>>   xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 ++++
>>   xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
>>   xen/arch/arm/xen.lds.S                       |   1 +
>>   7 files changed, 195 insertions(+)
>>   create mode 100644 xen/arch/arm/arm64/mpu/head.S
>>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>>   create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
>>   create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
>>
>> diff --git a/xen/arch/arm/arm64/mpu/Makefile 
>> b/xen/arch/arm/arm64/mpu/Makefile
>> index b18cec4836..a8a750a3d0 100644
>> --- a/xen/arch/arm/arm64/mpu/Makefile
>> +++ b/xen/arch/arm/arm64/mpu/Makefile
>> @@ -1 +1,2 @@
>> +obj-y += head.o
>>   obj-y += mm.o
>> diff --git a/xen/arch/arm/arm64/mpu/head.S 
>> b/xen/arch/arm/arm64/mpu/head.S
>> new file mode 100644
>> index 0000000000..9377ae778c
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/mpu/head.S
>> @@ -0,0 +1,122 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Start-of-day code for an Armv8-R MPU system.
>> + */
>> +
>> +#include <asm/mm.h>
>> +#include <asm/arm64/mpu/sysregs.h>
>> +
>> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>> +
>> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>> +
>> +/*
>> + * Macro to prepare and set a EL2 MPU memory region.
>> + * We will also create an according MPU memory region entry, which
>> + * is a structure of pr_t,  in table \prmap.
>> + *
>> + * Inputs:
>> + * sel:         region selector
>> + * base:        reg storing base address (should be page-aligned)
>> + * limit:       reg storing limit address
>> + * prbar:       store computed PRBAR_EL2 value
>> + * prlar:       store computed PRLAR_EL2 value
>> + * maxcount:    maximum number of EL2 regions supported
>> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not 
>> specified it will be
>> + *              REGION_DATA_PRBAR
>> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not 
>> specified it will be
>> + *              REGION_NORMAL_PRLAR
>> + */
>> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, 
>> attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>> +    /* Check if the region is empty */
>> +    cmp   \base, \limit
>> +    beq   1f
>> +
>> +    /* Check if the number of regions exceeded the count specified 
>> in MPUIR_EL2 */
>> +    cmp   \sel, \maxcount
>> +    bge   fail_insufficient_regions
>> +
>> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>> +    and   \base, \base, #MPU_REGION_MASK
>> +    mov   \prbar, #\attr_prbar
>> +    orr   \prbar, \prbar, \base
>> +
>> +    /* Limit address should be inclusive */
>> +    sub   \limit, \limit, #1
>> +    and   \limit, \limit, #MPU_REGION_MASK
>> +    mov   \prlar, #\attr_prlar
>> +    orr   \prlar, \prlar, \limit
>> +
>> +    msr   PRSELR_EL2, \sel
>> +    isb
>> +    msr   PRBAR_EL2, \prbar
>> +    msr   PRLAR_EL2, \prlar
>> +    dsb   sy
>> +    isb
>> +
>> +1:
>> +.endm
>> +
>> +/*
>> + * Failure caused due to insufficient MPU regions.
>> + */
>> +FUNC_LOCAL(fail_insufficient_regions)
>> +    PRINT("- Number of MPU regions set in MPUIR_EL2 is too less -\r\n")
>> +1:  wfe
>> +    b   1b
>> +END(fail_insufficient_regions)
>> +
>> +/*
>> + * Maps the various sections of Xen (described in xen.lds.S) as 
>> different MPU
>> + * regions.
>> + *
>> + * Inputs:
>> + *   lr : Address to return to.
>> + *
>> + * Clobbers x0 - x5
>> + *
>> + */
>> +FUNC(enable_boot_cpu_mm)
>> +
>
> NIT: I would remove this empty line.
Ack
>
>> +    /* Get the number of regions specified in MPUIR_EL2 */
>> +    mrs   x5, MPUIR_EL2
>
> Looking at the spec, the number of regions are only in the first 
> 8-bits. So you want to mask before using it.
yes, I will do it.
>
>> +
>> +    /* x0: region sel */
>> +    mov   x0, xzr
>> +    /* Xen text section. */
>> +    ldr   x1, =_stext
>> +    ldr   x2, =_etext
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>> attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    /* Xen read-only data section. */
>> +    ldr   x1, =_srodata
>> +    ldr   x2, =_erodata
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>> attr_prbar=REGION_RO_PRBAR
>> +
>> +    /* Xen read-only after init and data section. (RW data) */
>> +    ldr   x1, =__ro_after_init_start
>> +    ldr   x2, =__init_begin
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5
>> +
>> +    /* Xen code section. */
>> +    ldr   x1, =__init_begin
>> +    ldr   x2, =__init_data_begin
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>> attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    /* Xen data and BSS section. */
>> +    ldr   x1, =__init_data_begin
>> +    ldr   x2, =__bss_end
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5
>> +
>> +    ret
>> +
>
> NIT: I would remove this empty line.
ack.
>
>> +END(enable_boot_cpu_mm)
>> +
>> +/*
>> + * Local variables:
>> + * mode: ASM
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu/sysregs.h 
>> b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>> new file mode 100644
>> index 0000000000..b0c31a58ec
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __ASM_ARM_ARM64_MPU_SYSREGS_H
>> +#define __ASM_ARM_ARM64_MPU_SYSREGS_H
>> +
>> +/* Number of EL2 MPU regions */
>> +#define MPUIR_EL2   S3_4_C0_C0_4
>
> Do you know why the compiler doesn't support MPUIR_EL2 & co natively? 
> Any chance this is because we may build Xen with the wrong flags for 
> the MPU port?

Yes, you are correct. We need the following change.

|--- a/xen/arch/arm/arch.mk +++ b/xen/arch/arm/arch.mk @@ -9,7 +9,11 @@ 
CFLAGS-$(CONFIG_ARM_32) += -msoft-float CFLAGS-$(CONFIG_ARM_32) += 
-mcpu=cortex-a15 CFLAGS-$(CONFIG_ARM_32) += -mno-unaligned-access +ifeq 
($(CONFIG_MPU),y) +CFLAGS-$(CONFIG_ARM_64) += -march=armv8-r +else 
CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic +endif CFLAGS-$(CONFIG_ARM_64) 
+= -mgeneral-regs-only # No fp registers etc $(call 
cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics) - Ayan |


