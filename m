Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F6952D13
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 12:59:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777994.1188064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seYBk-0002qi-Em; Thu, 15 Aug 2024 10:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777994.1188064; Thu, 15 Aug 2024 10:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seYBk-0002oM-Bi; Thu, 15 Aug 2024 10:58:40 +0000
Received: by outflank-mailman (input) for mailman id 777994;
 Thu, 15 Aug 2024 10:58:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KwPb=PO=epam.com=prvs=49579c5ae1=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1seYBj-0002oG-9R
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 10:58:39 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51e057fd-5af5-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 12:58:36 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47F7Kfgh000656;
 Thu, 15 Aug 2024 10:58:32 GMT
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazlp17011024.outbound.protection.outlook.com [40.93.65.24])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 411d6xrta0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2024 10:58:32 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by GVXPR03MB10248.eurprd03.prod.outlook.com (2603:10a6:150:14f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Thu, 15 Aug
 2024 10:58:29 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7849.021; Thu, 15 Aug 2024
 10:58:28 +0000
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
X-Inumbo-ID: 51e057fd-5af5-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHQ/K8qlIePHYe82M2hs5bqXapyeGBk2j5PDKHrhPhhUmLaiLV6qfHkI2xm6NJ1uJrD1V8CUPUqM2VLUVoOjWj18Tsdah2Ib9MMgGUE/aRwa0C6xdFwByHZKCqFMPkH0hsrjMRmjPeYxzpkeTbp+uhXok6ntQBFp/+dSGhmmT2oMX5XM+jBKHoJyJb+Jb30/pIGD3PBdufUZAEAvJ3SKdE6Qkz8XR1DKXAoIqw6QZ9UfJbASAPvIFNpOQ/uNVidalMixvgg/Avk8qt+oPORNTd3MMkpYqgWvm2j9k53VhivhI92WC7Og/NQq0I0vof9pgD190S+AHyFayNk0Kv29lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKxH7aa2GrKVRhD1ZvHaoi4ab6IDzGSaKTdodVbDS6A=;
 b=DDe9njKuzJaN8h3g+O6d6KwqhQmWHtAF2FTQf8qfkE7c2oulgO5Bzgk0jDbmRTpyUNNM0lWKQMVmQYzOdMJp1PN4feL0Rg9m+VRu6t+0GZsz8hE9m8bCY0rG7k+5mDOmEgSlfKTQUdFQXCnRSdQRP+PyRj/pFrYNr0zICUEigVOAwUfxVseseCKSxKp1L4rb9BrxEFORe3Amu1J3ItKhyvbrO2T6RSZS7FJFzuDHkaO971lb6s3kqGUfwEi7NuHRjW0Ka3BNkkYXnFc70fYMJABNMX3f6Py9jnnEtPLZ4AG3WfZQNBLa6Umwi3Om5RDoFlgy9+o7Ns0tuhdHPivShQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKxH7aa2GrKVRhD1ZvHaoi4ab6IDzGSaKTdodVbDS6A=;
 b=I3s9V3aQXUynajj8k/SK7xNe503lhwCksusd7gHsGCCJM+TS8FHF8Qn7+REWFfC3ObhZSwpe2uPlQMz1AnlfxIKK91btxbUfQLyZKTCSd3yYVfLMB/p6mMhFsr9gmT8ep6Ka0cQe1LDkMMcDloDFX2VWZBNh0M4SVjguSKQclbJt+YIf85PdSGjS/TrCNq5HXqZ8A2n2Ram8vIdWcx+H/xGbame38zjHvmIFX1T0rm3raCItt1gMJzn6W8HxHtCwxH+G/QwmqqxkEDtmsvrinIk7cYL/WjONVf7YuavxFojunZOXcIPV39VmvHD3QmtnR5Hm52TxDCMwkyScESs7vw==
Message-ID: <f7d80727-93f8-44d9-ba5b-8c5d6b63351e@epam.com>
Date: Thu, 15 Aug 2024 13:58:27 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 1/2] x86/intel: optional build of intel.c
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
 <25e80b9271607da56abf9d4193e4d91b3d00bd9c.1723196909.git.Sergiy_Kibrik@epam.com>
 <7d390391-4ae2-442e-90a3-d8d242d7ae6f@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <7d390391-4ae2-442e-90a3-d8d242d7ae6f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|GVXPR03MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: 423aae7d-20d2-4f9b-e34c-08dcbd1931cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHphOHIwWkg5MmFMYTdPeHhNcFJwUFk2ajNnWjltUWVsQVhNb29lTTV6amgr?=
 =?utf-8?B?T1BYUXZNWHgrL0lMT2ZLWlF3NlNDTHlPTWFFOUFzd1VsVTIxYTY1Y2FXV1V6?=
 =?utf-8?B?am85THlJdW85dm1NWit0cjZnUnM3WWlIQXRLNkVLa04vbmMzYXFIaXRGemNV?=
 =?utf-8?B?RVZSWlBIUzlaYVlPNmdEMlB0WVIrSXcwL1FtU0FycW1zcW5CREJRdGkyS1Na?=
 =?utf-8?B?ZVdiVUJSSVZxcTNGT0RHUUdlZmw5Ums4dHMrcXJIUkVSUjBiTXkrdnZrL3VF?=
 =?utf-8?B?Z1Ywd0FoUEF5YzllNlpVZzF4d28xYnFKVXR5Yyt6c2s5akRobTF2U2IwbHNH?=
 =?utf-8?B?Y1N6THdpTlN5YUhwenJSMGhiNlNjZW1JUmdaVGpKRThuejRnOVhCcFFzM0tu?=
 =?utf-8?B?cFVlZ2tHY25MdDk1QjNJbGh4bGdPS2dDNStwdnpEcHkyQ3VmZ2JjVWh1d0N6?=
 =?utf-8?B?Ni8wblFaSFhScGZBbXhwR0VsSDgxT0xONkxVVEFuZFl1NENOT3ozL1JDak0w?=
 =?utf-8?B?R0xuRGF1ZkYzbHI0MDE5clhyTjJSYkRabDJlYUNyb1RranV6elFwdUNmcEYx?=
 =?utf-8?B?MlE0TXB6MWw5T2NwMTNjSVZIOThtTWtVWlI1bTNwVDNZQm9ZNDAyczE4cVky?=
 =?utf-8?B?c3ZzUXovclMyT3V4OUpnYURpYjF1d0kreEx3b3MwS3V2MDBWalpzVWR0b2s0?=
 =?utf-8?B?TWY5aVFEWVdqS3hkNmNBZFZnWHhhOUZSTnZhbmxNNVM5c0YxWEwzaU9JMW1J?=
 =?utf-8?B?d3JFTTA1RmlVVlFNSldiMGU5ZjZVWUhwV2hYYXpYanlNeUFOWWFmVjdZNkFq?=
 =?utf-8?B?dkkvWmV5d1k1aFdSbkJDLzZJRnVsZzNBU1hQQlh1NU5rWW0zVWRwM0ZkSzJY?=
 =?utf-8?B?bzhFUjU5cTBMUU5Md2F6MjRsRm1RWWlrUjdCVUJtMytZVTlNMHVha2Y4Mlkw?=
 =?utf-8?B?UHFaZU5xVXJqbzdmc2U1bnlOU1NRR1FtdVZCbU8rY29nc0tNQ0lSSWVObGQ5?=
 =?utf-8?B?b2VSL3hKRDJqNlR2QWY2MmplbUtaaHhaczdVSW5FMGRDN1lsQSt3L1Rsd0No?=
 =?utf-8?B?TUE2NG4yUUJyek1BMnpsNkpPVG1lR3dIaGFlN2o3eGNxM2dKSkJOQXBqMHQz?=
 =?utf-8?B?LzE0Y0QrVjkwQkppazlKU3BhWWZWaXVDQlN1clo5SzRXR1F6VXVGa1VvKzg3?=
 =?utf-8?B?Y1V6ODhGUmFxM1lFTTU4RExCYUZVZDlBaGQ0UkU2aFRtNTJFUXQrRWxkTm9w?=
 =?utf-8?B?TFR4UHNMMFkwa1V2aWg0dDYvMG5wTlA0bDJTaGxIRUkvMnlHdDcxNVFmMHc4?=
 =?utf-8?B?eTd0cW1VR1ArLyt5U05rWFg5akRZdFQ5MEJKM2hpSGNIcFRML04yWkpZd0pC?=
 =?utf-8?B?QzN4LzRQZ0FVZkhkWDN4cWY3cXY4OVAxR0ZEOTZhRXQya2M5NDFKTzFsT1Zm?=
 =?utf-8?B?MzMvMmJHK1orYmljWFJYdGtFNFR5MmdtUFoxUGxuUHRnRmJzNDAzTS8ySEdI?=
 =?utf-8?B?WmVEZXZ4Qm96MEViLzlHZ3JIZE9MZThjczV5ejM1YXlKU3J1c3dSQUIwSHRC?=
 =?utf-8?B?cmMwL0ZMdUY1Q0luUzJOQ21ac0kra2tFZE5EcjBWdHNtcEdCY25Na3kvU3Bj?=
 =?utf-8?B?c0lNSmMzL2NzRWQvUHhzWVFwT1ZycHE4NGIyL2Y3N0NoSmRKTkxsUjQyV0th?=
 =?utf-8?B?QStibUlVWU5BRnd5K2t4OUNaWVRBWGZLRlhqTG5uOHpBa1VQUDVrd2ZsNmY3?=
 =?utf-8?B?RytoM1NFK1k1SDBYMExPamVtNW5ubkFQcGhXVEM5dzZZOVROWUxpR1N5WW82?=
 =?utf-8?B?RTdYUUd0aUxEWC9tK2k4UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cyswNE9TWEkxS3AzMm1QSlJHcnJ5TmdsYzBWbDBLeVZPQ21MVUdkK2RuRzhB?=
 =?utf-8?B?cUJ5S1lWbzdiQXlEbTQ4a3c5T0h6SUYwVFp2Ky8vU2VuM3puTjJrR0ZIRmFk?=
 =?utf-8?B?bmJTSlQ3VmhSWDRJdVlMWGtJczdObmJyZWZDUGxTeWhCSncydEZEajFOb2E5?=
 =?utf-8?B?QTRRRmQrbC8vbWwxV0dqbFE2QkxscEtqNzZ1ay9qSkxGcXhUcXdsbEtsOXgy?=
 =?utf-8?B?MEVyTW8rU3B0b1ZwdVpkQ2k0cnVHa3ByUVVGcExlVkFOUWZJRFh2cjdvaVpa?=
 =?utf-8?B?YjVQVWN0WFlpSmxYb3JoQzU1bE1xVzh4aTNBV01sNWJpTWd6NnIzWk1qNzlz?=
 =?utf-8?B?WXo5ckRhdWRiNzUrand0M2VxeUZnSm44ZDZtNC9LUUVuVHk0d3hBd1dYbFlp?=
 =?utf-8?B?NTR5b1JIcEVzbTJWMmJ5NlNNKzFseW1USFlNczNHVVFEVUZQa1JjbzJscGgy?=
 =?utf-8?B?RGI4aXlyYzVNbStzU3VleHZWSmpzN3BROU1VdmppMFFyMTZ0Mjg4K3lEajVV?=
 =?utf-8?B?ZXBwNmlyT0tmaXJEdldEalpZbzRsRlhOWnVUcTdnZy9VS25aK2F2VEdkUFV0?=
 =?utf-8?B?YVpIVlpHNXQyS0w2dU43dFBsNS8yYmlWcUFZcTJZM005VmxGQWhNQlZpZjVr?=
 =?utf-8?B?MjVhb3d5WjU1YnE3cDB2Qit3Zmt5S3hXMFlGQUdtZldvTjNyVE9lekZ5K0RF?=
 =?utf-8?B?b1I5VDFXazRDaHFGSnRSQ3dMVXd2cFNkeXZCM3JqVTV3aDEydkpldXJBU212?=
 =?utf-8?B?K1ptMFBxQkYxenJXTGxGeGNZTGVLV1FNRi9JRDJzSTFhUkw2YWxva00xYzAw?=
 =?utf-8?B?QWx6dlJ0TjdvdFAvYWZFUTE2WHVIa2tnbzdkZDdidjE1NFVaRDM4MDM4ems3?=
 =?utf-8?B?RTd5OVk0Rm5ub3htSkdLWm1XOW5Vb1AwNWlKZ0xLSmVoLzliZ3pOd0ptVXhE?=
 =?utf-8?B?SG5IWVJ2QW1rdHRONmdxN24wY2dFTStBdlNSTHJuVkh4a0Q1eDRIRnJ5NUk2?=
 =?utf-8?B?V3V3SGxaczVITEk3Q2Y1K2o4QlcvTkJxY08wV3hFR1ZCcFhyTUN5Vlpxdm83?=
 =?utf-8?B?ZC9BVFdBdG1pZ2gyVXI5YVZsS01tSkcvaEd3L3J1MVA4MVhlUHZmTW8waG51?=
 =?utf-8?B?elpBbVgzZGlUVkdLT1RweCtyYU92Ukg5dngwN3Zqb2Z5U0drejRSdHBsRWFL?=
 =?utf-8?B?amVWQmRFSllsMUlpdkFNWVhlUmJDTElyMUZWZmxkWUx6OXQ1NDdOV0QwYWtE?=
 =?utf-8?B?Sk5hdlZRODBjakp2cUF1b3Q5K2ZEUWJPWkZ5aEthempwbnlZZEdQTG4rNC8x?=
 =?utf-8?B?bXZlVkR5Y3R6Q0d5SG9nNTRRYmVLMHl4WDhkS0JWNzgxdkJIZHNWQklIbVY3?=
 =?utf-8?B?aFNiQmI2cEJPTUY3MWE3ajJKNTlSVU9BS2VwOXo0L21seWdycnhjTVVPZ1Jw?=
 =?utf-8?B?Y2E0d1oxZjFvQUJZc0lLOHIxVnljZWJzODhLRUMxOEJpQXFiNk5nMURBMzBB?=
 =?utf-8?B?WHlBM3NwdWNncDN5VkxtWjRNMzQ4M1QxMG9LeU9NazYvTHJFeDFWcnlJVDhl?=
 =?utf-8?B?ZTNNUGl4MGJwMUp6RkthOURsVHowUDFDLzd4RHhKMkJxbWJodzdLcHBqQzQ2?=
 =?utf-8?B?ZlhPSEJyTzJjZXVvdEhILzRRT1RxK1NHNnZ6bjB3dXRYbHp5bXZFTmluK2Jm?=
 =?utf-8?B?US93bHZqOWovMWRlZTN4NjhsNDVZNTdxM3owTHJIaGNrUFdDdTVKVXpuWkdt?=
 =?utf-8?B?NGUvR2ZhdGNlRFgrNE5PWGZLREc4Q2NoWjJlaVFZbGJIYmIveWMxM3NybkYx?=
 =?utf-8?B?VlRlZmdYMlIyUkQxMG5FQUZ6bFlBVWhKZWhFTVVUMDg2eVR1TXBJMzMxZ3VK?=
 =?utf-8?B?MGg4ZEdzWGEvbGFoUWZpbnRwQlF0Vml0RUhZNmdtYmxyblpJVFY4enhWZGlO?=
 =?utf-8?B?RnFNbXE2ZVFpSTBJOWFRK1dEVjArL3E1cTZmdy9WaER2cXU5aW1hNnVtQ21Y?=
 =?utf-8?B?d0k4NmJTWDBmNEFpNzBreTdhZm1lKzhFbUF6Q296bm5oa2R0cGRrOU5NeVY1?=
 =?utf-8?B?Y29FUW9WZ2lBdlkvckZhM0pGMmlxcEl5ZFM0c0I4U25SaUN4SmdkK3ZDejVi?=
 =?utf-8?B?YlVYc3l5bzJlN045d3J3bVhkQTd4NnBsT3ZKWHgyUERibnRhaVdmSzdJQjIx?=
 =?utf-8?B?V1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 423aae7d-20d2-4f9b-e34c-08dcbd1931cb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 10:58:28.8489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9Q9XXn2yNr6QLkJFDqfFveX+FhQVu1jScaJidnpI4cTef4SmaoFLrVWWzVJyJTcmdlCpuxmmjybBwFADVsAmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10248
X-Proofpoint-GUID: 9wRPWBnnSx2vtveBxpnZkK4PaXBOkaqZ
X-Proofpoint-ORIG-GUID: 9wRPWBnnSx2vtveBxpnZkK4PaXBOkaqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_03,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408150079

13.08.24 10:40, Jan Beulich:
> I'm okay-ish with the simple stubbing out for update_mcu_opt_ctrl(), but
> set_in_mcu_opt_ctrl() imo requires more work. The call sites in spec_ctrl.c
> shouldn't give the wrong impression of having some effect. Imo in
> init_speculation_mitigations() an #endif wants to move down, while all of
> gds_calculations() wants to be compiled out. And that likely extends to
> further Intel-only functions there (with an early bail-out keyed to
> boot_cpu_data.x86_vendor != X86_VENDOR_INTEL). Which overall likely means
> there wants to be another separate patch dealing with that. (And then
> maybe a counterpart one for AMD.)

Thanks for a suggestion, indeed there are many routines there that can 
be put under CONFIG_{AMD,INTEL}.

   -Sergiy

