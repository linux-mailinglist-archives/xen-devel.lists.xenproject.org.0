Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215438B6DB4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 11:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714653.1115917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1jSK-0004zY-Tp; Tue, 30 Apr 2024 09:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714653.1115917; Tue, 30 Apr 2024 09:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1jSK-0004xr-QO; Tue, 30 Apr 2024 09:07:20 +0000
Received: by outflank-mailman (input) for mailman id 714653;
 Tue, 30 Apr 2024 09:07:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z1GF=MD=epam.com=prvs=18503a8626=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1s1jSJ-0004xl-4a
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 09:07:19 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a35fac3-06d1-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 11:07:16 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U7mHAd006658;
 Tue, 30 Apr 2024 09:07:05 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3xt96wc4hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Apr 2024 09:07:05 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DB9PR03MB7275.eurprd03.prod.outlook.com (2603:10a6:10:1fe::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.23; Tue, 30 Apr
 2024 09:07:02 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7544.018; Tue, 30 Apr 2024
 09:07:01 +0000
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
X-Inumbo-ID: 0a35fac3-06d1-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPBKQXiQHI5K3D3E0+KQqj82OzGwxZcIsVk4FlnLmFdkLySuyz2m2O8aqjwWMcamxLyb2mr7Hgrn3PVL4II8QjDYncxSLDt20BQh45p1lEedelCVobwGH6LcbPo3G+cHr6Hn0c+toQPi5rfV137TxkzaMi0auEjRqytfeNmzj0mQiM0UD089uOwTv3pgGgAW7yBR7emJPEbqPaQ/fiWVJM5Bt9AbKXi+wnUlmIt1UpDmQESBE20ZCAavXHxX32PMXuZOyg4+D+Exe8hxGUS5h/zkt8ShZbDLZ6pJp3O4ayOE0FhE50QKfknawSw0V/ymvHr4RzxgznAIzUUCQAOuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40zcA97ST9wQF7hGAJgPg3VXMck8koPpSmG8zTQcNMk=;
 b=J+wNU/9Y5cvW53d23ZXwIyi2anR/Kgj2K7RsgicjGxoHA7CE+Uli+Ymyap6wHZorfe59JnAag/PYH0PrsWxybRkXpLwu1NchKWQmTWH9Y5Y1cEhA4aubddB4y6FA/76NOKfg+/X4PKy4impMat7Qtj26thetHMbqUBxwyPlgzSeE8soxbV38a9yWh66QbeGNyaF4+XezDvUafR2/NJvclrIhWEbxRnsduhpJVVc2k1Xsz8BlZFfAtaYfamPRB9oK+uC8gYjRKzzwbEDwTD0kX50bhlh8TfHlGuNNF2fxxsDDKEdLoiE84O8aPrtJ0yHJS4UGVt3WpXTIjH0u990Zjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40zcA97ST9wQF7hGAJgPg3VXMck8koPpSmG8zTQcNMk=;
 b=gkcf4/2vMSm5ZOqkwPcUnnUjoOvOr0O7JolB0ch0uDUdYuQ/SvixuzkWthMTfdhDJv4v2RLsyL6W4Vgk0Cgjx/VXUAbqRr31k9MXrSIpkWscfO1XIXtp9P7ruVmbfYZzHAwuSezZZHGVuzJK7TeGLWs1IZrr5zdabaV2BKn9QJ+DygeUH6Y3A8VwLZ2MOBzahX3y3k57op0Wcpu/dkffLT76BEC0hbYfUqhn1//BkX5ExPoEW3A/g81gapgYUuLsJV5/oi+geyijYHxLY/hunTt+RDhVcQkhDKfRp96wHP76lsFmVbabrjVScaSHL3JBvUffJ6Dv75eBofbwTIgHbA==
Message-ID: <20d0751a-5d59-4c89-8cd2-31e3e161590c@epam.com>
Date: Tue, 30 Apr 2024 12:07:00 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 1/7] x86/vpmu: separate amd/intel vPMU code
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
 <a708db7fe06d131256ed2c75f518efce3d078fbb.1713860310.git.Sergiy_Kibrik@epam.com>
 <87f9b33e-146c-4a59-a1cc-e58bbee8647b@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <87f9b33e-146c-4a59-a1cc-e58bbee8647b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DB9PR03MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a6b8a2-175d-4384-e487-08dc68f4e5d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Uk9pejNha01YbG1YSFhrYlBCTzB1dDFDd1FXVWFTdGRvaHVBemNWak5jN3dD?=
 =?utf-8?B?L2ErVHRsWlZ4TWFaQmQ4Q1hsY3VGZU5BUlNHSUlpSGFzeFlqYWpONEUzbmRC?=
 =?utf-8?B?cGVkZTJSckFTR0Z1OWhJUGc5b2pvQkNFekRLWTJHZ3RVRzV2cDlDNFM0VGU1?=
 =?utf-8?B?a2xnbXFKUXpDalFNZ0tENWxmUGxmVHNOWFgvcU5YclAvOUZyMkFLeTFBWm95?=
 =?utf-8?B?Y1BjcjRSLzNTWnJTMmNBdUVOL1pVcWNVTHU2NWZMM1o0aXdJUnBaQW1KaGlL?=
 =?utf-8?B?MnNJbWd3UUxSd3llNmU5VTFyTWY0TE95U1JOcFljYTgvK0tjNTF0SWg3WFI3?=
 =?utf-8?B?U3lmdE1tclN6eWcxSkZXdHZVUEJCdUsrL3V2NDhpaEY5SkdXaVhXanR2SnBp?=
 =?utf-8?B?NDB1b0lMOGN3dEY5eXQ2QTFRT1JXS3U2UW5oY1JKTi9hQXJ1emZoUDdBYXMw?=
 =?utf-8?B?OWVod3hBby91OUtNOHRwMkNCblQzVXlkNnQwRVlHUkp0WHllZVJaaFkvVVMy?=
 =?utf-8?B?MmxlR3BUR3R0QUszbHlNSFBDOXQwMkNTMGNqWm1rbm5SaVZwaUlhbFJhSmJ2?=
 =?utf-8?B?T21tTy9rK29EcnpqQ2VuU3dGUDZtazNQUzlwWklFZ3ZiOGVDRnRFWEJ6Q1di?=
 =?utf-8?B?elRicWNsWEZPSTlJM01ybm0xbGlPNExZT2hMUFV2OWJ6L2JTeldRK3NleG5M?=
 =?utf-8?B?a0dFL3dwWk9zZGlqSUNrOXZJU29vajRCWE56VEhoaUg5eXhuMTJKRC9MTm9G?=
 =?utf-8?B?cGQ4ays2Nm5EUTRpcjJ4MnU3UjMzY3NuaEhwUlFGZm51MnZZTzRySFN0MjNm?=
 =?utf-8?B?M0JYZEJrVWRSUXVhWmFkSkJ0cWtPYWVSL05JYmtHUVcvaUNRVitxVWU4cjQ4?=
 =?utf-8?B?VndFTFpyRHFTSkw2Rmt3VE9mdGRyMkt0U29NVWNvWWd4Y3dFalB6QjVFWTA0?=
 =?utf-8?B?MkpWWDdKc1NVZm51eDAvY2tRRmVyU0RKcTNGR3F0QzNRb2dqVHFIaVhHbGdo?=
 =?utf-8?B?R0dwN0pkdTJGaHQyL29IYUNBdGFtNnUwdkd0aHNueWJQN0JsTHkxQU8xOWwr?=
 =?utf-8?B?YlY1MlluMk9xRTNvUUNCUzFTNEZVYThSZW9yeGx4cEdjQUsxeGtSWlJoZkRQ?=
 =?utf-8?B?OWhOS3FJSzdzV3BmVDVyZ3FkWnlFVWRuWGl6VWg4UUgyU2pGQnY3ZVl5amc5?=
 =?utf-8?B?TmlDTExXODZNL3RlUVBOc3JMTm9xRjNVNkNwb1dMdldLaWdMb0k0TWlHNmZL?=
 =?utf-8?B?ekhtUk1Yb3pLYm1td3VPazhwYU1Gd29NS2Z5UzV1MjBvNDVVOVd6N1laTjJF?=
 =?utf-8?B?aHRhWGJRanZxZG5mNlAwNmNqazkrTk8yZS9yN1VaYStpV09rK2tkRlVHQXM0?=
 =?utf-8?B?SHEzWW4vZE5EbHFhVXZuUzJGdGI0eGVtcjdQNmlKNzZRdjAwQSszVFlaaERS?=
 =?utf-8?B?VlZMajYrbjlxTk9yYUsraiszVkZYOTJpOGNMekRMQkMwQjNaZEpZZWZ6K3E4?=
 =?utf-8?B?UDBWT0tObHFIRDlDdDBUMHVXemxnRFU1bTR2VUx2c3RtZXVlQjE1OG8rbnFw?=
 =?utf-8?B?U1UvaXN3Q0hPT0tUd2xocUMxVUxIME5xc2owM0Vic2pXaWVQaGhiaWthUk80?=
 =?utf-8?B?d216VlZCQnAveTlWaUJHVThKZWN1MkdJWGgvZ29iR2gxaUV1OHNKWXpMRjBW?=
 =?utf-8?B?M3Y1ZEx0R2dqUnNwd3IveGsvR0ZvdXY4aVRMOTVaNWdSR2RlN0tPREhRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aFhmVk1YajIrSEpJSFJQb3pBZ1A0a3ZqeUY4c2sycFk1anc1WWVQbnhiSHND?=
 =?utf-8?B?YjJUNkd2cVpLVDAzRVE1OVgzZFp5RUpheFlOTHlCR1FpK0FCL0FESTd3QmdT?=
 =?utf-8?B?MGdNWitkU3I0dVQ4ZndoOEtiOVJNbS9HaU1Bd3d0aUdMemZ3RC9hTTJiQ1hS?=
 =?utf-8?B?azZIdG9NRVJCM3JWek9HWFRWaGpPSEphTXA1d0FyWGhKZC9JQThjVE1IR1JF?=
 =?utf-8?B?RVhDTmRRcnBtc0V2R3VLYk1qRHRpQ2MzYzd4SHNjV3JvSFJDMWsrMVh2dnhm?=
 =?utf-8?B?SVBhcldDRWo3OC9GTTVBdE9HZ01mSk92SzNJaGhROU9VNWxPcWJUemhPd2JB?=
 =?utf-8?B?ZmpIZCtIRzdlUzVCSHlyaTRKZjlhK0g4Nm1VZ21aNjEzT0FTTmRUS3lNUGdv?=
 =?utf-8?B?UEplUm5NQ0JkcHZuRjN2YkhCMFBQb1BHRnRjaysvN2VjV0t6a0lDd3djQ0Ro?=
 =?utf-8?B?Z2ZNeGFKSkhHU09ZTlBNUDRJcmJIQjR3Y1lXcE44anpJU1ZGZE9xckwzUjI0?=
 =?utf-8?B?VDM3R0lWazg0RGU5czFTVHR3eURBbGFSSmlwbWJmeDVCeEVON0E5KzlhYWUy?=
 =?utf-8?B?aEZMSUZwTWJRMXlwTzFDMG5pM05sSXAzME5QMWtDcUU1MXdueDc5MzkrN0dM?=
 =?utf-8?B?dG56aUZ2N0kzRVMrOWZENVdUN3FkOEFXWCtYQWZOcG9JQysvWnUwaVpCR3pw?=
 =?utf-8?B?ZFA1cWdOeFpNUWRGdXNlUWZVWFljYWV1S0NZT1RvRUhFRzdSOUczY0tVSkdF?=
 =?utf-8?B?MDJWUzNIMzkwRGlYTDZBZTVQVTJnY1JSVjltODd0TjZGdkNtam1tMzlwTlF4?=
 =?utf-8?B?MHFiT294clc4MGxGb0NvUzliakpVenRsUW45T3F3cnpqMmVDbm1paStLR1pJ?=
 =?utf-8?B?VnV5WUFPN3duZkxybk02aXVxMklBQmdCTDRXMU5xcldGa1ZCdGJkMXJta3Vi?=
 =?utf-8?B?aXZDQ1dldnpOOFVpOStPbWcrRjhVSVRIVTBObHk1NDI4SHZldW54bVVZQjVD?=
 =?utf-8?B?UnhEQUo0V2EyWkxGbDNFazhhWkViVVRQRERHTTVEU0FaTUFKNk5yQ1VNekY3?=
 =?utf-8?B?ZDFzSHJaN1orWGFDamFSNXlFa2J2OEo1VVdOL0xiS2FNSWZ6MHJXdnN3aXlt?=
 =?utf-8?B?cUIwR2VJWkJDRGRhYS90UWNETHJBV0hhVTJYSms2T0dGRzN6WC9vSU45MXFI?=
 =?utf-8?B?ZWdLZ0hzdEhEYTQ3RUR5bTdqNXZlRXlFV0dnQ1k2K01mZUJDMzJpbC9FRmtU?=
 =?utf-8?B?YjV1VjZsNEVJTGMwQTZ4azYxdTlRQit3Sk9JT0NtMVVnbTZHZUNsaU5JVXpG?=
 =?utf-8?B?L09VYVV5aTluZnc3ZmJHelpEektSQVYyVWExMWpXTUpZTy9KVTh0TTBYRFpY?=
 =?utf-8?B?aHc2eE5sNFFjMXdNNTJudTVDMHgwQjRGZ3ZYUElTZ3k4Q1lreUJhQm5JU0l6?=
 =?utf-8?B?SW9SMmVLZFVyR0E1M0E3Z3p4T2RCTFRtRXFqelFNUnFHN3M0bWwrMUp6akl1?=
 =?utf-8?B?S3pnWSs1SlBEMnBPd0p0SUFVWktRVm1OLzJNVDdrYmNZYU5Rb3JIKzZOdUsv?=
 =?utf-8?B?SXBMWWt1SEwzTWxvT0JGN0xsbXppdk1pdjU3M3YxOVQra2Qyc3NJVlMrUGpz?=
 =?utf-8?B?a2dTVmRVaTFFV2o5WmV1NE94N0gzSWhhSmZRd0FINW9HcGlXdStnK2IydEk0?=
 =?utf-8?B?K2FiK2t6ZmY4V09jWnV1UWU1ZGpzV0tXS3E0d0lwaHlhVWl2V2doUEFEeGll?=
 =?utf-8?B?NG0wOTdDU2xtbDd6bndGd0FPdzF2M1gxT2JhNlUyRUpSY3I5US91NnlyU3d6?=
 =?utf-8?B?R2Z3d0tTc0MwNlVhMHhuc1dmQ1lQMDRqaXFqYSt0Q3BXN0xIY2JZZ0I2bDZj?=
 =?utf-8?B?QlJ3eUtWY2QwblVrMkxES1NvaGYrTDJXL0liN1lWY3ZWMVZPdk5BMUtJakY1?=
 =?utf-8?B?aW9ERFE5RXFCK0QybkJiNEdla1JQMzhyRElSUVRLaXg0VXVpZ2t2NTZNL3NK?=
 =?utf-8?B?SHJ5NEdXOUIzTWYvZjVYcVNIeHVBajNBWGhGQnZwbWY5MmRHTkNRQ2hvTEhz?=
 =?utf-8?B?TGlLYktuNjNzY3ZCQm95N01XMWFyTFR3QWN0ZWZHdFU4ai9QdFQ4VW5JQ0V0?=
 =?utf-8?B?ZTIvSDMrUVhIUDI0c0FJOUhVMU5Ic2lVQnltQldIUXI0OVg1dG9RZ2JwUFZl?=
 =?utf-8?B?anc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a6b8a2-175d-4384-e487-08dc68f4e5d5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 09:07:01.9036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XGd4UrRx3PlsRnOaKVZC9UYDAP9euGsv7mealrYQjBeOo2KxED8qf5gnXUdG4vf3I6ZV2dmUAn04JXtQ/3jUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7275
X-Proofpoint-GUID: hA0gs9dh0WYIdvSZvtBZ_PWqIAlMGGtZ
X-Proofpoint-ORIG-GUID: hA0gs9dh0WYIdvSZvtBZ_PWqIAlMGGtZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_04,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=874 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300065

29.04.24 18:28, Jan Beulich:
> Any reason you don't follow the approach used in patch 7, putting simple
> #ifdef in the switch() in vpmu_init()? That would avoid the need for the
> three almost identical stubs.

I didn't want to put that many preprocessor statements into this small 
switch() block (4 #ifdef/#endif-s per 15 LOC) but if it's ok I'll do it.

   -Sergiy

