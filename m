Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6D19C449D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 19:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834081.1249573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAYs2-0006W0-8F; Mon, 11 Nov 2024 18:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834081.1249573; Mon, 11 Nov 2024 18:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAYs2-0006SP-4f; Mon, 11 Nov 2024 18:10:38 +0000
Received: by outflank-mailman (input) for mailman id 834081;
 Mon, 11 Nov 2024 18:10:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHe6=SG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tAYs0-0006Ov-C1
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 18:10:36 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2413::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d05420b-a058-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 19:10:32 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MN0PR12MB5737.namprd12.prod.outlook.com (2603:10b6:208:370::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Mon, 11 Nov
 2024 18:10:28 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 18:10:28 +0000
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
X-Inumbo-ID: 3d05420b-a058-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjFlIiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjNkMDU0MjBiLWEwNTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzQ4NjMyLjU2OTkyOCwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUi6NVmjzZkkFJSSZ6Vm6rWuZCSllXkES6/2f5ywYrmMdbLz0jdZIIVeZU4U9GSP2U7R+SCzWuXsQDKU4HV4Cv4SntBvPCT43sul2R5ZQrxLKYStfDXHeZdjOHh0p5YGTA37BvnC76KLISW2zb9EnrJixYtw2WQOBL1LzewcnBtv1BH0RGL5zltPsxgMnbKTG2WBrmAzQ74fgDFwYwk3dS8aJAOv9cv3mKiDnlB8iSSYKxkrJrrO9qU/ewFYqYjFy2x4En81rumjNkVf+wNlqtCf7q2YFDIRn1h7Qbckycd/HuaXADEwf9bHnEBTseRzmwb4T1E9GjlTx7mSh8URqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtD2GnUK0+mfyB1eRGsmdswnzuPIbcl55K42OhSdq8Y=;
 b=DyYxly6ibQCSfqCpUOox9JL5WN9+sgrZ3wJ1s9EzD4N6EIFOATnLbTYGDImm44Puw4sOxYB1T1ASovB5mXYSI3iqAaVwGBIpHv7iAjWZwaDYKHBTQakCkkZBW5X02gI+ZDjOOMlNbIlgw/MOcPXTlTsU628gM/uWTfxxaNZwtsD/kH78nGrZg81Pvt+uFqkdzRwntf6EVB6B4Oh9+Qs24n/VYNie0E24/5Cy1+0DL9K329XlSe0gWM0eQgI6a8k94MqYF0g1c7jc2w6+B8OmXBSnRAfn3YW/Zgr+LvMDsNzzAiFoa9p4+io4cPZTuMlSrX8kYn7rszwZs9HuWI9Olg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtD2GnUK0+mfyB1eRGsmdswnzuPIbcl55K42OhSdq8Y=;
 b=XoxFpRprI99JBorgIHEd2TfYWidICf8aEy/QDNTjqPMkPQyDMk5JwJi57lkcAAhYK4WfVFL8P5kKvmpAHVu09xqz1mMeFaA9Mvk98364qIoVDIVQ7yjmTYUzYip70tmwPcPRQ9cw0X5dHa4XJaqB9SuQMqdoYX4ngEze7UO9sBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2e70b890-f755-4f37-a283-bd261ec3b8e0@amd.com>
Date: Mon, 11 Nov 2024 18:10:22 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen/mmu: enable SMMU subsystem only in MMU
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Rahul Singh <Rahul.Singh@arm.com>
References: <20241108195918.856412-1-ayan.kumar.halder@amd.com>
 <80ac1e78-5259-43d2-8b18-d5bd3abdca1b@xen.org>
 <2ca98e9c-1a4b-43a2-b707-097dc5093e39@amd.com>
 <6dc2ebd8-d206-479b-ac3a-83ed59c7109f@xen.org>
 <86862f6e-caf3-4a5a-a650-b9bac74b83d3@amd.com>
 <9D3DF4D9-F88E-4419-A048-3B3EC534033B@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <9D3DF4D9-F88E-4419-A048-3B3EC534033B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::32) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MN0PR12MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: a570b4fb-a4de-4919-1de9-08dd027c1f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTRUVy9SN0JZcElBOVFNY0w1UnQwbGdORkxtODI3QU04OHN5WURZTTFXLzJm?=
 =?utf-8?B?YkNSQnppQW5kWWZwVDlaaC9wN2NWMHFxNzZNYzRSM2x0T0hFVTBabHJTYm11?=
 =?utf-8?B?Qi9jU016WDVYWDFUUWVZc29VWnRGaGdjbUhWL29hTTBSbGozc1NldFFJQncz?=
 =?utf-8?B?SEVCWlZUVURSNFJKY0J2VXdvRjdSV0toWm5jREEvYWJrUHc5NHRBelVIQlFP?=
 =?utf-8?B?bGRMbWlrRG9pb0srdnJoak04d21QYWNXdGNUd2NDVm1oUXpWM0gyRzFKZ2Ft?=
 =?utf-8?B?ZnJBZTJRaU9mSTR0OHRvMVF6RmFYRmJldFRlWVJ3TXhRUUtlU05YaU1ERzd6?=
 =?utf-8?B?MVIvVW42L0RCQjRxKys2c0pCM1NFQVNwU3cyRGJHWU8zVEhKOUM4UWwrY0x3?=
 =?utf-8?B?VGhoWjRMMTdWUlNGOFZPVE9MaU9kbnRvQzUzbEtQYjRaSWxia0Fqei8rRlNx?=
 =?utf-8?B?bnZDaHZyOHVFWUR5VnR5anVPYmh4NEdaUVA2enhpZ09mYS84QUdLUlNqZ1Vt?=
 =?utf-8?B?TFlQdGxOdnpKN2wwdXVnaEVJMzFMZnNqOXhkQnFMU1U1OFpqaVNUMVBubWVt?=
 =?utf-8?B?K0U2Z1I2RGlGR1p1MTBPTDdKbFdyUXZpUG56TFYxaUI2YysvcHBGcVo5Tm5F?=
 =?utf-8?B?R0RSSWIrU0dUcU02NTRpc3BpeG1ITkhNZU90bDRFTitTRithN1JiQ2lqVHVp?=
 =?utf-8?B?N3hleWFCSk5UWVpSRndGN3NMZGdyYnJjNWtod3h3R3BmZHRSOVVOck9BcGYx?=
 =?utf-8?B?UTdsQzdDWkpqR3FyUU1HRFVDMUE5VTRXREYvR05HS0RqbGt1VGtRS2NubnRa?=
 =?utf-8?B?YU9HSUdzM1Vzb3RJcFNIamdlR256cTVQR2dLaVlFbm9KV05vTnoyYVpYN3hH?=
 =?utf-8?B?SVNNSk9nMmtGOE9WWE91T0UzcXZzcG5laFZYYzFIOEhscS9QU2J5dENGenhQ?=
 =?utf-8?B?Y2hzRVlWcmNjOE9wUE1LNnZPNTdsVmlScGg2L29CcGhscFJrMitPcFZKWWx0?=
 =?utf-8?B?cFZoNzE5a2h4OG9aR2pTcnZUVGdpRVZxME5la0RTaVBubXBFUFJjSnVzM1cr?=
 =?utf-8?B?aUJqUzNmR21icUVCQU4vbm9QcStBRGRhRUpWUEFSRzhjQlVIamFIR0h5TkpT?=
 =?utf-8?B?aVFaQXhBRXJDZ09JL0ZaNXNacFNlaXJUaXY1clRLR1B3eUMvc0d5UVJ0WWQ4?=
 =?utf-8?B?cEExVVNzbDRsUDU3MGFhODJpVzJockRXNXhLeGZlcEdkdHhOVTBFOTd1UWRZ?=
 =?utf-8?B?MVlPemVFak5ycDBTQnZ1L1pFQ3FxeVR0a2VveEo5Mmp5YWFZK1Bkc2ZtLzQ4?=
 =?utf-8?B?ZlRUZXZmdkVRM1VOaWFZU081TjI4ZEFES2JxM2pDam1HUGtuelFJQmhObi95?=
 =?utf-8?B?bG1HSTRjRWFwVVVUMVREMlhHajJaZmQ1ZCtxYnhNbkJVOVhoc3Y5T2dtc21S?=
 =?utf-8?B?ZFkySEhGazV5b1FwVXNpWks1b3l5dmtBTFcvcllwKzZxNjRpQWx6M2NCQmRn?=
 =?utf-8?B?UzZTbEZtaVdLYnhkZy9kSFZ1UGo2NnFjVjFndXJEWEtOVllaV1F0TFNnejBz?=
 =?utf-8?B?NTB6UVNrS0ptcUg3b1o1SVh4MHNHd2dyank5cTh3RFgzUEFpRnIrMnh5VzZT?=
 =?utf-8?B?R1pLTThGZHJNdjh2SXJwNWxMMEUvamczbzdOTy9CSjQvRE5HaXgvNVZicFFR?=
 =?utf-8?B?SDZxVG92NG9NZ1VFUlhDYXBzMUhwd3NHMnA3cW05K1lhdDhFZ2pMcHVoVzFh?=
 =?utf-8?Q?jDAgPr/Gs373cy05MymnWSKdxyfrisAmcTkcoqZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjB6NU5vRkl4alpuUDJoMFllRVFRRkU1eCtFdTI2SVh1QjZOdmpNd3BRMWx4?=
 =?utf-8?B?MkNxbXBobTRPMURhUHFlYUt0THg2M3JhZVN0MFpIRiswc095Tlh5QmZMUkI0?=
 =?utf-8?B?UFFLekJBTExNeWdNWnRsUlBMK2tOdnBxaVV2Tm5ERjhoNGNMWFp0S0ZKZHFK?=
 =?utf-8?B?UDBxSzlseHQ4SnRTMGdvaHppc0ZRZkpLWHMzNFo4Y003ZTlUSHROYnpTejJU?=
 =?utf-8?B?RjdsUSsxditYSTlneWNMSVJYbE56bG1nUE1xRElPQW5zV0xsSDArTHdtQ3dE?=
 =?utf-8?B?VHVPQUViYllYVjU2VjdGODZVZ09PSnIwWHREcHJ0RU5FRTRBMXlJRDNlcjRp?=
 =?utf-8?B?Um5nTUlqbEV6WHhhNGJHZGpEREdkemxIOEViaUxGY2E5d3VPSnFJRG5sMU9M?=
 =?utf-8?B?OHRMQW9nR3lzZWNUS1dsYVhtQ2ZZcVVMZEluSzVNWC9FYnoyY21ZVTlmdzM4?=
 =?utf-8?B?WFBXdjFTNURUeEU0RHliV0dyWkcyR29KczJtcm9lUWduZzhwK0VuR2M2SG9U?=
 =?utf-8?B?cGFiQ1NXWHBvOWl4akk5ODV5RUFwODQ0MzJrcmFUQUlFSzJqNnZxRmlsZDhV?=
 =?utf-8?B?Z2ZCYzNoZE1meGJZVitIaHRQdWpNNUFHUWJybUpQU2RIVHcwY1NXNGdReDhF?=
 =?utf-8?B?a3IyZkh0Q05xSHIyMmlVSHE2YS9ORi9ibFFqYXVxZkh2YlFIaGUwYVNGSlRP?=
 =?utf-8?B?c3lrNnc0WXBseGlXb3doSGtnZWgvclQ3cGxlekZ1em02V3NjbWhOZjUwOHF5?=
 =?utf-8?B?Wk1NN201WFVxUC82UG5VOENIaUhlZWExNWpZYnNZL1FtbFJTR1FWWDZlRGZS?=
 =?utf-8?B?RzdXaG9BTCtMUHdIdWRJek5SZXdKRnR1anpqTE5jMmJSSmVsZFd4b2tQdWh2?=
 =?utf-8?B?aDEzYU96V1dXRVE3dGlheTRJbWE1U2Jpc3RKZ05Ub3BGVmRidnBJSFFFNWlx?=
 =?utf-8?B?Mkh0UHlFUWhsaXpXN1oyTDFSN240R2xhVWtReVd1NGJ2VllNRmpaSGxFcmZ2?=
 =?utf-8?B?bEFsOXZNN08vMGJGZFpzZXJjbWlaMGtlWmE5MXB6M210Zy9QTXRGMU10VXdj?=
 =?utf-8?B?cUx2WXdUc21BbjI1a1FnaE5jWTdyeFBJMU5zelZrN0tLNE5FTDhYbCtUYUZW?=
 =?utf-8?B?UXhLYXhzb2dWcGVxaEdYdWhCSitCbGNsNHovQ0x1blVnd09HWXZXZTR4N1NY?=
 =?utf-8?B?aEhkUlpsR0ZsUXlhZTNjRjFWdTlCRDczNHhPdlE4YThNMGI4NW4rdTVMb2Rh?=
 =?utf-8?B?d1BJdGtZWWdJekdlaE1PSGsvWk9rVy9OdFRhWUxWZjVyY0g5QWQ4Q2gyMDBh?=
 =?utf-8?B?VVBqN2dDY2NyelVrdUdJTkxhSWFYdnJmQkg3RzhKWUgvcHhTTDA2eEpod0Vr?=
 =?utf-8?B?eloyTG0ramRHRVNnclIzcXJlZm56dWo0bFNZcG9TWnA4RU9hUEJNZFNEdVFj?=
 =?utf-8?B?ekptSUU5M3RnaTk2RVFXeFlTQlk3VXk0amZDUG85TGtVM21PR1dmWE5sckpo?=
 =?utf-8?B?UUc4SlQzcWpRcWlxLzl3VDd0TUpmVnZaREdBY3luMThOeityanZXT1RBTk40?=
 =?utf-8?B?NXM4VG83blVZRk14OVV6UU9hdkFjNzFxeWxQbGxQMC9XWWtVVTV1SXlOcmUy?=
 =?utf-8?B?aHBlb3phS0dBcnVRVEVNWmhpSzl1QWRmWlM1ekQxMFhEZDBPQUFueE4xUzdQ?=
 =?utf-8?B?MkswRG9OTzFxOXE5dDFFLzFYVURkSm5sbGRTOE0zdndDSjJlcnlBR2h0bENn?=
 =?utf-8?B?MU5pVFFGb1ZLZ3FmZXAvVG9LSmRhVW9iSmhTY2V4ZjI3OG5EbGtKRlpLVE0r?=
 =?utf-8?B?a1M3elU1Zm9WQWtVdllwWnBmdDVQMXpMbEZ1cUJlTmloVkxiSDF2RERWMjFm?=
 =?utf-8?B?bElGVk5NdHI2dW9uV1UvSEVFbkwvbTBnVkVTU2FtVVNSeTBuWWMwSWlkQUN0?=
 =?utf-8?B?SDhIZm94T1RJMlNkcDFqckpWNnNvZUZkejlzaE9qNlRrY0VUbGordFd6K25m?=
 =?utf-8?B?ZWoydHdEd1NuM3ptYlA4VTRHWVhGay93Uk5tcGoxZmVRcHJCanFGM3pOelJ4?=
 =?utf-8?B?RVZqQlF4REs3UlFnZlgwcnUvOTJKYU1Zc0hXM0ZKb0RGRFlLdXdqYlBGdmZv?=
 =?utf-8?Q?dIZLdHISNN+n213LUE9pzR07j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a570b4fb-a4de-4919-1de9-08dd027c1f1c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 18:10:27.9611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67RRJuozKvmmCO0x1sByTqVKdvXINKjiDKIkrmUORzvVl54EUVvyFpvbi78tI/7KRYgvLxuEFrmgEbsAmpbDpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5737

Hi Luca/Julien,

On 11/11/2024 16:33, Luca Fancellu wrote:
> Hi Ayan,
>
>
>> On 11 Nov 2024, at 16:00, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>>
>> On 11/11/2024 13:45, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>> On 11/11/2024 13:24, Ayan Kumar Halder wrote:
>>>> On 11/11/2024 11:12, Julien Grall wrote:
>>>>> Hi,
>>>> Hi Julien,
>>>>> On 08/11/2024 19:59, Ayan Kumar Halder wrote:
>>>>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>>>>>
>>>>>> In Xen, SMMU subsystem is supported for MMU system only. The reason being SMMU
>>>>>> driver uses the same page tables as MMU.
>>>>>> Thus, we make it dependent on CONFIG_MMU.
>>>>>>
>>>>>> Signed-off-by: Penny Zheng <Penny.Zheng@arm.com>
>>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>>> ---
>>>>>>    xen/arch/arm/Kconfig            | 2 +-
>>>>>>    xen/drivers/passthrough/Kconfig | 3 ++-
>>>>>>    2 files changed, 3 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>>>> index 15b2e4a227..3699e148e9 100644
>>>>>> --- a/xen/arch/arm/Kconfig
>>>>>> +++ b/xen/arch/arm/Kconfig
>>>>>> @@ -16,7 +16,7 @@ config ARM
>>>>>>        select HAS_DEVICE_TREE
>>>>>>        select HAS_PASSTHROUGH
>>>>>>        select HAS_UBSAN
>>>>>> -    select IOMMU_FORCE_PT_SHARE
>>>>>> +    select IOMMU_FORCE_PT_SHARE if MMU
>>>>> Realistically, everything under drivers/passthrough is MMU specific. So does it actually make any sense to select HAS_PASSTHROUGH right now?
>>>> Actually we are able to assign devices to different DomUs (eg UART1 to domU1) as long as the device isn't behind an IOMMU. So in our case, the passthrough device tree has this node
>>>>
>>>>           uart@9c0b0000 {
>>>>               compatible = "arm,pl011\0arm,primecell";
>>>>               reg = <0x00 0x9c0b0000 0x00 0x10000>;
>>>>               interrupt-parent = <0x01>;
>>>>               interrupts = <0x00 0x07 0x04>;
>>>>               clock-names = "uartclk\0apb_pclk";
>>>>               clocks = <0x06 0x07>;
>>>>               xen,path = "/uart@9c0b0000";
>>>>               xen,reg = <0x00 0x9c0b0000 0x00 0x10000 0x00 0x9c0b0000>;
>>>>               xen,force-assign-without-iommu;
>>> So how devices will be protected on an MPU systems?
>>>
>>>>           };> So, should we still disable HAS_PASSTHROUGH for MPU ?
>>> While it may work, a lot of code in drivers/passthrough is IOMMU specific (see all the function named iommu_*). So I find really odd that you disable IOMMU_FORCE_PT_SHARE but all the rest is still present...
>>>
>>> I think we need some consistency. If you are planning to do device passthrough without any protection, then I don't think you need any code within drivers/passthrough/ (at least for platform devices).
>>>
>>> Overall, for this patch, I think it would be better to simply select HAS_PASSTHROUGH when MMU is enabled. We can revisit device passthrough once we have the patches on the ML.
>> Yes, this makes sense. I will wait for Luca to confirm as well.
> It makes sense to don’t compile all that stuff, anyway we are using some functions from drivers/passthrough/device_tree.c to pass the pl011 to the guests, we will try to handle them later in the series then.

Agreed.

Actually, MPU does not use much from drivers/passthrough. However, if 
you disable CONFIG_HAS_PASSTHROUGH for MPU, then we need to add a bunch 
of #if-def in the arm specific common code.

Please have a look at "xen/arm: Enclose all iommu related access within 
CONFIG_HAS_PASSTHROUGH" and let me know if you still prefer to disable it.

- Ayan


