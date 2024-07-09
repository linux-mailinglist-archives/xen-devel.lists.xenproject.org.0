Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF092B387
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 11:18:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756005.1164554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR6zE-0005pl-8n; Tue, 09 Jul 2024 09:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756005.1164554; Tue, 09 Jul 2024 09:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR6zE-0005nv-6D; Tue, 09 Jul 2024 09:18:12 +0000
Received: by outflank-mailman (input) for mailman id 756005;
 Tue, 09 Jul 2024 09:18:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C54Y=OJ=epam.com=prvs=392098eeac=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sR6zC-0005np-Gc
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 09:18:10 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2789a9e6-3dd4-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 11:18:08 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4697R358030622;
 Tue, 9 Jul 2024 09:18:02 GMT
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazlp17013012.outbound.protection.outlook.com [40.93.64.12])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 408h1pb1m0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jul 2024 09:18:01 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS8PR03MB9167.eurprd03.prod.outlook.com (2603:10a6:20b:5c1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 09:17:51 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 09:17:51 +0000
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
X-Inumbo-ID: 2789a9e6-3dd4-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yz43EGyG3yMMh7DInEgY5cMe/pV48HC+taNtbRclx6o9JpOlmVVLy8jKT2PNZl8yqu5sZsP/srEXfWnjcNHW/QkDA0ZOc8MJQNxsf6PLyBkZqtYrh5XyXr2yFI3DnIhTd/VlJbRnZx9yN3fSs9Sc2w3fxzYhEnVGpPx5PhhEcnfP9uwRD9gD25xYlmcYiz7yIqv0xRw/UOIQ5GoNBCcWWMylmn76McvBo04wsIyrAWPIzGlblBUZPnSCSwnU99lgApcYFZFTZcdSkrk8L6tUxtA7EZb7aiEd7tIkt0bIc6FB01aHCHcFzXn4oFGaOi0Q2xojfmuKnSsr3JSYkfRScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh0lkTIZ/mO9Anjsb9m8JxNXWSKDyIWTzOzzar42uFE=;
 b=mG7j5wK6/mEyk9fw5Kfuf0asJfEaulqlVjPh/VNMg4LMwFzzNzC8JQ32p3oiAFwHAHK0JPI+jlz6ww6+W+RrNxrMUGl8Osfe9v1rAyMG/Gp9N7lZ6KrH63nrd65XDKGh7WuapOlx0aTJT+cY0Sx6gsyGmu97cDEXSYiA1o8DZIYLXfweCuygw064IiQvrgme2LCOdSsvbH5Sq1fEGUMb3Sa/Ha5rL2hCh+8Skq2MFtDgE0eqxS5UWe9+ZPTW3VIzTPl84BLnur3wz35UcMtziXd40Wg6DgdzDjkuOiN6+Evt2oD8SDW33/XA6lXx+4B76dscj4tldcJg0rfReGdjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mh0lkTIZ/mO9Anjsb9m8JxNXWSKDyIWTzOzzar42uFE=;
 b=kBOVQIttYF2eM7B7QWSepeaU/zp+pf7kMO8yh95H5R9X6QVwNQwrnnbMuD0iUWPl/ZoxEq4UQobs6EKwLail63s/UZ8H5Q/jMkLuChksuWdSxWr58WI7e62ew0mV/a1VhyDu3pWbNa5knf07v79JnudAqqtwZdgAnz8WyVGYKPk6AFeS2rX+/H/K6IHARUXGYnnrXsBwVcblKYH116DD53Uh4tkyVB5Q+6hLDYi87XTHSIiCc3aVCb0saQS4BRmP4JjYn2+XMOUEBiP7m4+D8Chkg8i0/zfe+Y4FMDh5a1TtX67RrcVegCv/YnaOaS3jAp4Ln2zPbv+MfaNpbWTkYQ==
Message-ID: <0ae3a03d-257a-4e2e-85a2-09a601883634@epam.com>
Date: Tue, 9 Jul 2024 12:17:49 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/2] x86/cpufreq: separate powernow/hwp/acpi
 cpufreq code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1719832871.git.Sergiy_Kibrik@epam.com>
 <0f6e8a602fb3106d6b064582ca50d3d5fd4f1174.1719832871.git.Sergiy_Kibrik@epam.com>
 <22cd30f6-3a66-4dc7-8805-86a6daad5700@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <22cd30f6-3a66-4dc7-8805-86a6daad5700@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0026.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::22) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS8PR03MB9167:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c57f406-c1ac-4ff7-e986-08dc9ff801f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZlhEMFRrNjJxYW1reXYxU21oUVhOQVZZdExod1cxVmp2clhDMHdJNW5lTEF1?=
 =?utf-8?B?bWgySVpuMUhIYXM1MGhkcWlYeUl3S3FlY3VjY2NPMjUvSW54NzBTb2Zpd1lT?=
 =?utf-8?B?NnRwM2tmUEx3bG54T0NrNktVRVhYbUpiODRRQ1pRN2pFbnRNZjB0NmxGZUZV?=
 =?utf-8?B?UEtIbGVOdEJLcVBUMEpKVm9hT3ZBQTRTMkZVZGk5UVVjOVJvTnNTVzAzZnRM?=
 =?utf-8?B?SkJVR2l5bjBOU2pER1RqanFJT3hFMTlNcjlneXl2VG9lbXNwNk9QL3V1cXRp?=
 =?utf-8?B?dCs1WGxGdHRvSno2RFJuTHpyaDhuQ0pkUE9kZFRwVXdvUS9DaW9HRmVnWk5l?=
 =?utf-8?B?ekJKTkgwNThYOUlORHd6NDRtdUtxL0pLU202QWdvR1pKbzVaM1Q1T2pKT2xk?=
 =?utf-8?B?bFdaeXhmL3ZTNG4zS2ZJQ3FiQTJNb1EwU0UyRlo5S2F3Zi8xbkM0cnVzcU9m?=
 =?utf-8?B?N1EyUENmYkdqMzg2aWozcmtUVHhrRnJIenZEVUpvUzVnaXhZaWt1NHQrQ0w0?=
 =?utf-8?B?UFkwVEx1TTVNKzlVQmc2WDZqdGpaelRuT1RQend1VisvNm5aVERhVDNTWmVV?=
 =?utf-8?B?aHUxbm4wWVQvNDgxREhHaWhmd3Z2eDY2VGtPVkhSYklXSW4wdWRKUEJLclAr?=
 =?utf-8?B?Y0g1eG9zWk9DYzVHRzF6dDFnUStJQ3dxdFhwbC9MbFQvN1VSdUhZZUpZZFZ4?=
 =?utf-8?B?MmRXRFV5Q3dRLy8xUFArOFBSTGdNYlNuYk01WXhnVU1ubTRrTjMzUmVCSWRK?=
 =?utf-8?B?QytZKzlWK2RxSjB3cThEaEZlVGcxMlBLSnlzQXZ3d1hqa1hSZEo0SFNtQjdM?=
 =?utf-8?B?Rmd2bU1mR0FiMUUrTXZkZXFIUjlqR1hHWldqbElLQUJJcnNnSWI5cGpxaXhN?=
 =?utf-8?B?dFduc2F5TFg4eVMrUWQrN0JaUm1LSzhzNWRnQkdKRTlSem85cUQyTE9neHJa?=
 =?utf-8?B?ekFvcUprbXVoNTllU3V1cHBITzg4NVp6SHFZdGl0SklkcmI5R3Uza2Z0eEpN?=
 =?utf-8?B?QzhFd2IyQyt6YU5QR09kUmZjR0FYRjhHSG80TCtZOWlINXNsdkVReE5rZzky?=
 =?utf-8?B?b0h4d2QyMzU4ZEhwOENHbEVqWmNVWExNZlZOb2J4SlFHODdWbndDQU5NVmVo?=
 =?utf-8?B?UjF2SWNqeW92cnlDUjdIUGVnK0JoUVJXWlpnVXdELzkvWExQbGRuWWw0SmUy?=
 =?utf-8?B?SkQ5Tm1EZWtOUjllM2c5OUFZaWthcW12MVpTM1FteFdLaFRhdW9tMXdkNjZq?=
 =?utf-8?B?Nmh1SHRkK2Q3NWd5RHB2Q2t4MEFwTU5kV2psd3pFcVhXUGZNdkQ2WFduNU9a?=
 =?utf-8?B?eWduckJSRmlYQTBkV2FrRzB0dHV4Y0Q3eS84UnRSdlNuTERZM2VJdXFQaFB5?=
 =?utf-8?B?aHUra1Mvc3pYQkVnR3JVWnVSTnovN1h5a2NQSlhMNUhWdDhzVjlMV0hSdGJl?=
 =?utf-8?B?R29pbWxmcjlIQ1c0Zk1FM2sxa0FhaTBvVXlCeWUvYjRFZFFKVWpIZHd0S1ll?=
 =?utf-8?B?S1VXd1dmellISktScEI2eEtYQnkvck0wTE83blJiWjVHcUY1VHBBYXROd2Ir?=
 =?utf-8?B?Wnl4S3Z4U0FydGQxemNFRFZCVUN3WWtLSkl4MzJYaTArUStyUE5FM1d5RTFn?=
 =?utf-8?B?RWRJYmk4MHJoQld0OUdlb0wzaGsrSUQ1NDFkMWZJRlh5UzJGWHp5bm5ta2tG?=
 =?utf-8?B?eUlzY2hheStsRlJtQmNTZTU0ZCt4OEJvVXJKbHNPaEZhL3V6OGljUzRsRzhO?=
 =?utf-8?B?TVBTQlRsV2FGcjVUYWJPSnBtcGFGVVNWSmwramFLdmp0QVo5ZnlFS3EyQlM4?=
 =?utf-8?B?bUpsemE0UitzS1BsY3JvQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VnJUeHpBb2hXZXNzTW94Y0lwVjg3T3BJelM0VVM1eno1TXkzZWZ0THMvcldl?=
 =?utf-8?B?U2gzTnM0UWNraitwUEs5Vzhqc0puZmlmdFppWGdsY3hKVkJ0OVN2YzYwc0VK?=
 =?utf-8?B?eVB6eE03bmd1VzI3cjIwT1BXOUpGb3R3KzBVeEVNczJFM0NpL0RxVU45K2hN?=
 =?utf-8?B?cG5HMXJINGFzN2V1cXh3bzVQZ1IzU2FUd2UyVnI0VE1sSHFzYjRKdUxuMFR1?=
 =?utf-8?B?ZS9RS3UzZ3V3REowOENsTFluVEhyWWVSaW9NZklWTCtRejhXZGxTeThRQkov?=
 =?utf-8?B?aGxrR1VzcFJ0VkNiV1dQU3MvY3JqSmpGeDZHbm9ENEltbGFCbWR1WWNIb1pV?=
 =?utf-8?B?S2FkdU53KzlIUXhZS0FkbnFWMWlXUHNOZ3lTWk1pdlZtVDBWeDNqZnBlNnVr?=
 =?utf-8?B?ay9La0FRSXdVY21telpjREhLcThyS0FlVmViZU14NDVmWldYNWRub3VIOFho?=
 =?utf-8?B?N1h6ckNHNE5WVUhpc0hjeFVIc2l4SXVyZWdCbXVKRy9KNDRWeDFMaCtEdk9L?=
 =?utf-8?B?WW1xWVZ1Yy84bUFlNDJFbm0wSDRyQjB0aXliMjRtZmtiUjd2MXhPMHN3RUph?=
 =?utf-8?B?ZW10bG92K1ZFRmsxV1ByVkZmWDRGOU42V0VNQWJIdUlpUDc2UCsrSkJGeDFU?=
 =?utf-8?B?N2w5aXJlZFJaSCtib28rYUM5UDNQdng5Nmx4d09qUzhYQWMyNTd2a2Uwc240?=
 =?utf-8?B?c3JRWEtpT1Fub0dlMkwrRk9EMjg4dE9VVTFpZ3VSclRtcHZYUDlqeXl3a1J5?=
 =?utf-8?B?ZENyWlg4dEVId1JsZG9TME1vS0V6WVlDQi9QS2ZrbXl5UHFqVnBhYWQyVWJN?=
 =?utf-8?B?bUpVWDZkamQrUmp1OFYybm1XbmVmTWlQWTAxNFZTTkJNMkdFdytOWE1hdlBS?=
 =?utf-8?B?SW4wczh2VFlTZHJ4anhIbFhndkV2bW5HRnUwR2dIRWFYQ3h2UVJZWmpMOGJO?=
 =?utf-8?B?L3R0emZCV2xiQmxuVXhVbDR2ZzM1d00yWldIejNYQU1kVkxrQ2VnOGIzQjZK?=
 =?utf-8?B?aWhTMkhiMUM0L3M2eXBNak5VYnJYSlJPeTRMSHhpd0ZmK2VNenpLRkJPNGtD?=
 =?utf-8?B?Y1Vvb3VzWmhFV2dReExPeW43ZWwvaFpvSENTT3N0SHpZMjVvNzZWSzBzbkpi?=
 =?utf-8?B?MjBaUVhRbncwMmRlT0FVM0gyN1pYT1FYYjlQd3hoRlBKVng0Y1YvSnB3NGVD?=
 =?utf-8?B?NEZZSVJiU0pMTTNZelF2bDkyU2JHdk42WUxzeHpvNGNXc3cxTDBEalRTTERP?=
 =?utf-8?B?TkJzRk8xbXFvK2Q4VS9vMithY1FWalZiZ1BHd0EzdGVvS0dLM25aazdRZHBu?=
 =?utf-8?B?OEZaT1djdVczOVREN0dVb2ppVXRPenMwMzNqZUNsbmZLNHlKQ0RCSWNZTzdU?=
 =?utf-8?B?dWRqRUhjOE9lZXZsWmlpV09pMFFYYzIxMGlLMjZVNk9FSHBZcEh6SnIzUjVt?=
 =?utf-8?B?V09BcEhUQkxSdVRPbVRqZ3hyekZ6TDBzZU9UQ0dYejhRWlYwWjFLaHBwdWdv?=
 =?utf-8?B?RWNLSWx4bTFsMm1QemczMUNhWTJIbUJpTU9GU2YvNjBrSHpwRDFjVmFiRWl3?=
 =?utf-8?B?QUtIMmwweUM4OStIVWlNZFM4WlNMcXNZTkcrajZ4NGpVaW9EZklseTNjQk9z?=
 =?utf-8?B?SnB6UkhKTXk4RDZrY3EyWE1rekxKTGVRaGJ5SG9XMThxZnVaSUZxSTlrTEd0?=
 =?utf-8?B?RjgvVXg3SytEV25IRGUrU3FFNHN2Nk1CZGtkOUtiWHJocVVOTXN6N0FWck81?=
 =?utf-8?B?N09FU1NvVC9nc1V3R0QxalB3ZVhLeXVTbzMrRzZTTFZ0REhWUTl4ZWVDcVhV?=
 =?utf-8?B?aENSNGgrbEhiQUxtaGcxbUJNNm1sVW8wa2FBVGJVS1NWazI1ZjN3K3VBNjAr?=
 =?utf-8?B?dzBQWGRqV0tNRDgxdWIwa0FjNHM5a1VJaFVyVXQ0b1NJWG5nY0MzeWptVmt0?=
 =?utf-8?B?RHBBcDVYQ2RzdEZDUDBJUWlXNjVqSTBrVUxIWWpoMGZldGo0ZVJpMVRac1hB?=
 =?utf-8?B?dG5FK3dJNFhtWlRpUGMzb1ZKZWlhQzYwRmZpZmZMNTE4TW1lT2JTamphMkd2?=
 =?utf-8?B?elp3Zlh3ZmU0dEZ4c29nODJXN1lJUlN0MTlUNUd1SmljSys5SUorOGgyZ2c3?=
 =?utf-8?Q?ZRrN1ZiSAYgER5S6D8qANO5b7?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c57f406-c1ac-4ff7-e986-08dc9ff801f8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 09:17:51.4567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iprmgOS7OB0GC1nb7fEzkhKmj52tE1XFXl8nyasbHUezfYFmsrjRejj3AvaOovUCahhJLP6qt2qMvH+pTDLHrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9167
X-Proofpoint-ORIG-GUID: 83m3J2VdG7GsYW7DPZqMlDchcZZUPv1o
X-Proofpoint-GUID: 83m3J2VdG7GsYW7DPZqMlDchcZZUPv1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 suspectscore=0 clxscore=1011 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090062

03.07.24 18:14, Jan Beulich:
> On 01.07.2024 14:19, Sergiy Kibrik wrote:
>> --- a/xen/drivers/acpi/pmstat.c
>> +++ b/xen/drivers/acpi/pmstat.c
>> @@ -255,7 +255,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>>           strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
>>   
>>       if ( !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
>> -                      CPUFREQ_NAME_LEN) )
>> +                      CPUFREQ_NAME_LEN) && IS_ENABLED(CONFIG_INTEL) )
> Wrapping like this is confusing, not just because of the flawed indentation.
> Please can this be
> 
>      if ( !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
>                    CPUFREQ_NAME_LEN) &&
>           IS_ENABLED(CONFIG_INTEL) )
> 
> ? Perhaps the IS_ENABLED() would also better be first (not just here).

sure, will fix that

> 
>> --- a/xen/drivers/cpufreq/utility.c
>> +++ b/xen/drivers/cpufreq/utility.c
>> @@ -379,7 +379,7 @@ int cpufreq_driver_getavg(unsigned int cpu, unsigned int flag)
>>       if (!cpu_online(cpu) || !(policy = per_cpu(cpufreq_cpu_policy, cpu)))
>>           return 0;
>>   
>> -    freq_avg = get_measured_perf(cpu, flag);
>> +    freq_avg = IS_ENABLED(CONFIG_INTEL) ? get_measured_perf(cpu, flag) : 0;
>>       if ( freq_avg > 0 )
>>           return freq_avg;
> Why is this? APERF/MPERF aren't Intel-only MSRs.

yes, it seems to be a mistake..

  -Sergiy

