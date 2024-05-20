Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1112A8C9A8E
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 11:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725942.1130239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8zWQ-0003k8-U7; Mon, 20 May 2024 09:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725942.1130239; Mon, 20 May 2024 09:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8zWQ-0003iI-RO; Mon, 20 May 2024 09:41:34 +0000
Received: by outflank-mailman (input) for mailman id 725942;
 Mon, 20 May 2024 09:41:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H0dS=MX=epam.com=prvs=187012ae9b=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1s8zWP-0003hq-Oc
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 09:41:33 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 237a7322-168d-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 11:41:32 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K8lF9J012123;
 Mon, 20 May 2024 09:41:27 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3y6n1e5d9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 May 2024 09:41:27 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS8PR03MB9217.eurprd03.prod.outlook.com (2603:10a6:20b:5b1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16; Mon, 20 May
 2024 09:41:24 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7611.013; Mon, 20 May 2024
 09:41:24 +0000
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
X-Inumbo-ID: 237a7322-168d-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxhm+6vaNKYwHefwNWxRrc65D0f1dqGz3mLkHDDK0jUE50eaNkZ0bkk4tzMCQ42/gHJohalCYXOKWvNgjuuzCt0Glv9bAd0x0AoP8UZvoqrHyLosGpizKgNkV4FygpZvraegnfvmEbncolI6QycPcRDjrTreUGbYzwT0EGKFp/OhyhlJEGxkhfUmNs6tQ/rvXh01Re2IKyT0ZZhsBv2MgA40ak2IWo/WFrujF06m/gSmS56SHIdCk2VYFlwow8j2TFRF6xz7NwLvxveAlRSu102+9xltgoMgMQ/HBygefjHtFWjKtyiBIRQA8J8R579kBIWVSOs/cx+aHiKZGQDNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKKzr/TNqZsZXKYVtC1RvRlyBxT4+FNoFnSIEiFpoWk=;
 b=b/Empw2ivvld5dgTqEd0cLsHviE2GlcVX/Tnc9Tdxj26ljsdE5L2bYBNC2thoNwwaybCE+ModwiNZQABDgkbrBq61H27wjgpmmG/Z914/72C02e6Wv/cV09CtqGzX0xuk5KrOYcARH7aHtzLr6RdoTgRKqkNroStegGhDEUcYvA8zDVn4ngtAjRHiBXRQ9S/BgZkUP56TeXuHo3YmMYLtmAuxRv7/AVa2r8wp65xPL0Lgn5ZF5lmD9FrxZJk/7uEBfeb1stkzQRRkW1tTpARSsSzK0GXxWuUMrJSo6vMwPqbw8vZe5HbEu2V6JCd8+pmA149FhkqJnmnlgcHnpZlCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKKzr/TNqZsZXKYVtC1RvRlyBxT4+FNoFnSIEiFpoWk=;
 b=mk8l9iAZBTOE4l7tIWlkGvEHora71OW0Iox4yPxU0yjOpF9/VLH7Nw3HcjHB0x5Akg2KBtlAYw3qm78kusHxiN/YaqwvSdXWONLLnq23gRQgjVW17DY5xfOyUGw7KzbA0fA/Uei1AO4rmn4F/aYwAr3ZgIMn97VuYwTWLYZMiyIlUj+Y40gLsZCNfbAI+J6yNqefVbA1IJc4iGUf81ud2FDGdfqiawE6X4BAYeCqVsb39Ia7tt7NZnu+c8MdBj2LktaIPqN7Eebs1suJIZtuR6YF3k+ACLiz8rUgYAcIsHIphXE2i5bOvkXpyW/aRhZ2UR+FBNHha3riePcQIDbi2Q==
Message-ID: <4b82462c-34cc-44f2-9c3d-c441dae63bd7@epam.com>
Date: Mon, 20 May 2024 12:41:22 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 5/6] x86/MCE: add default switch case in
 init_nonfatal_mce_checker()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
 <01aad263ad60f37ed74138b5abf2733361bb7d25.1715673586.git.Sergiy_Kibrik@epam.com>
 <7cffa5fc-7e23-4acf-98c3-56929025bbd9@suse.com>
 <ea51dc26-e098-457f-a44c-262742b317d5@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <ea51dc26-e098-457f-a44c-262742b317d5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS8PR03MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1d672e-c61f-4fb6-b090-08dc78b1038e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TnVxYTdvZ3lySGlFUUZkREhZYXVDY0VZa2xZUHZ0M05yOUc2R1NHMFJrUllq?=
 =?utf-8?B?QlM5TG41eEFJcUpNV3JGV0dUdytRK3BFL0VWK3d4SW9VejRUdzJWYjAwRHVE?=
 =?utf-8?B?RFllUVZTem9IQ3ZML1crM3ZUWGdCcUNzR3U2SnJRMFdVeXIvL055M2RGcEhO?=
 =?utf-8?B?SC9acVRtVU5xa1BIM3FzWnFNOHNnemZiSEViRWVhV3gyVWpEa2VMMlN2SG90?=
 =?utf-8?B?Nm0yRXRiTkdxeVBZSkdGbS82SzlaMDRFdTBVbWxHQjNIWWR6NzUxeWdaR3Fw?=
 =?utf-8?B?YUIvK2crRVg2QjhmN0ZNaHlDYnhJdWFad3VWUlhublgyMFRJOENXdzZuMGE4?=
 =?utf-8?B?NmZpR0pHdFVBdHdOZVNyRmVlL1U2QlU3SzMzOUFDbEtOeG55a3NvV1dUZlJB?=
 =?utf-8?B?MDdOKzZUcFNUSDIxOVZNUDlmR21lR2VlYzZ5dmZKY2cyUGJSRHYvRjVRTkhk?=
 =?utf-8?B?MCsrMi9seGdCcGN3Qzh4aWlkNkwySEdjeWEwYUE2TWI5RmNoZ0ZrYU9MQkRQ?=
 =?utf-8?B?SFprUVN1UXBTZHB2bXJKVXFERVVqZ2pMU0JOR04vQkRTOGh1aHZCNTJqNVFL?=
 =?utf-8?B?d3JWbTZXWVRRVmNXT3FBRHN6dW54MW9kVjRQWVRZcFJzZVJucWVFZWliTzZ2?=
 =?utf-8?B?cG5ZcEsvdzVrYUFXUUpIdGdWRGZhNjd5S2tDNWtOSTgvK3dYV0U5dlVKODAy?=
 =?utf-8?B?ekdRbndCVjdKdW9MMjFWRUJwNEJpWHpES01raStPSkl5UmEzM2NLMTNTcm41?=
 =?utf-8?B?L29DUjM4WEFaMVFjSjFra2VTWEdoVW4vWFo1RE1FT0JGQ1Y1REpKV0xlQUhh?=
 =?utf-8?B?NHlocjVCNGtUNzA3QWtlQndrNU4wRlo1WmRJNjZJbjJmMUcydm83VHNLUllz?=
 =?utf-8?B?aFJrYVBiSVlPY2NzYkluQ09yUmVJOVhsc0NqamF6NDRoZjBlR1FuK2g1QzJG?=
 =?utf-8?B?QnkraWNvWGNRTjc2VVpYbm9PQm4vcDVha1NSOTZ5aEtTQ0gvOGFvbzRKaWJw?=
 =?utf-8?B?MXJIdlJ2WTBseENva1QvQ0JBT3k5dW9Eb1ExcFBqN0NyY05wSFF6YlRvQ1Nu?=
 =?utf-8?B?M3dFNnBTdFFjWGcwNE4rak1lMXJVTkdBVFdqMWNDL1F4MFp4QWZ1M0lTQ1hT?=
 =?utf-8?B?a1lPZjVESjVGNEVWdFl2dytFWVRyUnM0OEZPZjdrUGtPYUR2clM1T242S0lC?=
 =?utf-8?B?UU5GcjRSelVEaFc4T1AwTm1MN2VWdXh0d0dIZURmTkdZWk93N0RmSUU2RzJt?=
 =?utf-8?B?VmJvODdnVVA4TUprYUpqQS8yZUN1cUpTaWtsV3RjWmJJRjZZZVI2THRVc2tU?=
 =?utf-8?B?SExWVWhqZVJFUEF3cmVxL1ZqMGhxMlNWTENoaGtWeDJobStKdXhTQlFnM2NK?=
 =?utf-8?B?MW51Y2w0eVUvcW9USHFtWnlISElpOTdwNXRESmRUdW9NR1ZaNWVkRmJwbnFC?=
 =?utf-8?B?dnJxRE56c3doUlQvUHJhOHFQak5pMWVaWUpUNERHZnFXV0FOYjFVS3FzZExa?=
 =?utf-8?B?bkkxUHI2U3NWZjFmYTZVSDZFUGhFek96eXYzcm4xUlNzejZHbklneW5NZHBu?=
 =?utf-8?B?ajcyYWlIRkNmZUV4QXlSbU4xUVgxVm03S0dWN3ZPUnVCcGdpYjF0VEd5bDdP?=
 =?utf-8?B?ZEFNSEEvY2xPK2xEdnZsOGlMM2VGcVg3RWxGNkJFdHZBT2loZjNUZW9mejgy?=
 =?utf-8?B?NGF2RFdENXhiZ3h0SjNBTDJxSWxFcjhUd1VpQjhkeW8vSnZWWnVKS1BRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WksrNXZCMUJxdzJrZjluRldlL2NVZklCc2M3VzVrTkhXYldUWUJYS3Bva29V?=
 =?utf-8?B?dzVQaVgxZklPaEFqckNmb1p3SGN1L0NlcUpDYWI0OUpBYW1vSmlkNlVmQlZz?=
 =?utf-8?B?NG1mUDYrVHE1Nm9PTXcwMUpoZFNxV3lVYXprYjBRZnF4QWJvZEY4aktKTzU2?=
 =?utf-8?B?YXE5eHM4b1dFTHBxZmxlN1VRSlE4b204a09UNnFoLzVrQ0lmdGNkcGZ5a0N4?=
 =?utf-8?B?RVhPVDJ1MU9LM1lPT2N0aENsV2xSRmMwT1RabWhNY3hNMlR6UzRUWjNaQnVY?=
 =?utf-8?B?MmNNZ1lzQkJYc3l6MFJFNVVKem9zLytaRFI0dmdxM0dqNEQ3UlJIQ2ZBRytz?=
 =?utf-8?B?ejVqUEd4SnhCdHlLeGFRbU1oRjZXVGJMSC9DVVptT0o3cEpBTjRjNDdnSkVM?=
 =?utf-8?B?dlpMTDRyVVYzUGQxZmQ5UjhLb3pIRytkNEdtWC8zdVVYeFYyUitidDFZMHZF?=
 =?utf-8?B?aXd5MzlndVBqT3VNREIvWXF0dHA0aHR5OEFqdFZLTzV4cVduNnZHUlhDOUF4?=
 =?utf-8?B?WUQ3djVWRDhXcHJnZjZFbENpQVpHcXRJajNwTW1FZFZVYjR4TG1tQVkvRUxk?=
 =?utf-8?B?WUVmczZwYmRucnlzZ0JJUTRXL1drNTQ2MkdzME5IK3l1QnVEeDY3MWhoZWly?=
 =?utf-8?B?clpHR1c1ODIrQkx3aG5rSGlvY28xZnAxOFF1RVd1dDUyOThEbkVYd013akll?=
 =?utf-8?B?bFBMbm1CNnVJUFNRTlNhM09PckVPa2xmbzBPL3EwSnBzTC91UVlkVkdQaWhZ?=
 =?utf-8?B?dDBRaUdLdjBwS00xOTZ4aURSYlFBTVJVREVMY3ZjQjdneWhIZWZHd2VZa0pV?=
 =?utf-8?B?WUZyMTJreVcvR2RINWIzQ0JSelJsR3R5ZXExY1YyRUsxWVdXQmtYY0JKT3Vv?=
 =?utf-8?B?ZjJEYXNQcWtTVGQ2RFpJemk5VEFIckZmUk14N2paV1pDK2EvUnE3dm83ZlJK?=
 =?utf-8?B?S25tM3YvaHdhdkhobUNWZnJML0owa2ZXZ2dwWHpjUWNGSGhWbXA0RXdEZ0pL?=
 =?utf-8?B?Mms4Rm8zaFBWRnFNU2pOMjI1Um5DMTZTZzd0MG1pVUdQZ2p0M2N6dTM0S3Nv?=
 =?utf-8?B?eHUxYmZnVnJHUy9GdXBtSzdkai90ZFU0ZTFCeno2RXdGVjJhODRGNjlkSUpM?=
 =?utf-8?B?bGZRT0hqRHptUjMrSDJDR2VoL2VVVU0rWllZOGxjWFE0VTYvU1BHRUR4cUln?=
 =?utf-8?B?enFzMlJPNDFxMFlzdytqbFM5Q2Y2WWVBZ0p2SWFUR3oxNHBhbm1QZ09qcWxm?=
 =?utf-8?B?ZmJuVHN5azFRd1RxQmFVZk5RR1lnVWpXTVZPcVYrQmcyanVPYkZsdS9tV2N2?=
 =?utf-8?B?REUvbW5oU3lvUmVwRVpESFBEbHFSYTBlVUtZeld5dC9GNUpnYUlqZlVyRXgv?=
 =?utf-8?B?NHpiR1J4V0ppVGpYVkZtK2RtczJqVWpjejErTDNuVGpVblhjRXBHU2NobnE4?=
 =?utf-8?B?aHN3WkV1ejZDdWszU3hIeXZyY3JJRFJrdkFYME0rZTRuVkZUdnBBOHEyalN6?=
 =?utf-8?B?KzZHa1dPby84MERMWDltWkhhdjNxWkVwWWI5UXZaWVFXYkpwWk9ZTk53VHVC?=
 =?utf-8?B?YVVZR1ErckRzUmhsWk9leGNuSXJEN1ZuZzNaamFSMi9VaGJiN2V5V1JrUUpo?=
 =?utf-8?B?UDgwYXI1Wm50clhoNlAwb2ZNZ2gwK3JXSE1sVm03enByNi9ma0FVMDRLNkhT?=
 =?utf-8?B?cVR3K1BpM1pFeVBPWnYvSU9yU2IvT2NNQ0FwT1EvRUgxL1lCSytObjhVdjFj?=
 =?utf-8?B?cWxiYk44SjFxK3NVWCtPUXhWNy9aWDhjSjRYNlovTDUvOUNlZ1BUNFJNNVRI?=
 =?utf-8?B?MmJUalRIdzVXQlYxTFFzYTZZeXdRazJHbmpibkh0RmNVdDNieVF2bCtYSGdh?=
 =?utf-8?B?eXNNM281YW5nMGFydC9rV1lLT2REYXhkcldOdGdOMFcxRzVzdFdlTHJRRTRT?=
 =?utf-8?B?eVEvWWM3RUFCdTRPTTdvbUc2MWdPdUs3QlVBZDhEY1ZzN2dIdEhsK3hXN0hC?=
 =?utf-8?B?aGlRNFhOT1pWeFFEWldtRzhRRjNYb3hDcGVVLy9PTzFmazNhbWZ4T3FLbHF2?=
 =?utf-8?B?bkFrSDYwNk1udzJldWFEMXk4NENwaVBGcjc4Q3J1RWdtSkFRNWtsRm5MV0N0?=
 =?utf-8?Q?0k8wGi2yPfRgU0FfQZeT3Hci/?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1d672e-c61f-4fb6-b090-08dc78b1038e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 09:41:24.4818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/qeVjtISyYyDyPGugP3yr94RRjRQxGovCIC6bdVaGvImAtDy00m1pOC/yrZgc3Mec4w//6I5sXmAZcrHtlqFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9217
X-Proofpoint-GUID: 6VyASyw_ZpWK4H4LG8ivvoNfIGSPlsz2
X-Proofpoint-ORIG-GUID: 6VyASyw_ZpWK4H4LG8ivvoNfIGSPlsz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_05,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=880
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405200080

16.05.24 12:46, Jan Beulich:
>>> --- a/xen/arch/x86/cpu/mcheck/non-fatal.c
>>> +++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
>>> @@ -29,9 +29,13 @@ static int __init cf_check init_nonfatal_mce_checker(void)
>>>   		/* Assume we are on K8 or newer AMD or Hygon CPU here */
>>>   		amd_nonfatal_mcheck_init(c);
>>>   		break;
>>> +
>>>   	case X86_VENDOR_INTEL:
>>>   		intel_nonfatal_mcheck_init(c);
>>>   		break;
>>> +
>>> +	default:
>>> +		return -ENODEV;
>>>   	}
>>>   	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n");
>>>   	return 0;
>> ... converting this to an error return still isn't justified. On one hand it's
>> benign because we still don't check return values from initcalls. Yet otoh it
>> isn't really an error, is it?
> I realize earlier in the function there are error returns, too. I question at
> least the former of them as well. And the latter shouldn't be an error at least
> when the vendor isn't going to be handled in the switch().

I'll just return 0 then, and maybe leave a comment, as this code will 
start to look a bit unnatural to me.

   -Sergiy

