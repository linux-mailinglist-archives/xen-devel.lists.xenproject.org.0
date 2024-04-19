Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206D08AACB2
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 12:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708945.1108171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlMJ-0002Co-0w; Fri, 19 Apr 2024 10:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708945.1108171; Fri, 19 Apr 2024 10:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlMI-0002AB-Tn; Fri, 19 Apr 2024 10:20:42 +0000
Received: by outflank-mailman (input) for mailman id 708945;
 Fri, 19 Apr 2024 10:20:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iezf=LY=epam.com=prvs=0839d8b339=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1rxlMH-0002A4-AQ
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:20:41 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77d5eccd-fe36-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 12:20:40 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9FY7K000563; Fri, 19 Apr 2024 10:20:35 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2232.outbound.protection.outlook.com [104.47.51.232])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3xkntv076h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 10:20:34 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by VI1PR03MB9899.eurprd03.prod.outlook.com (2603:10a6:800:1c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Fri, 19 Apr
 2024 10:20:27 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 10:20:27 +0000
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
X-Inumbo-ID: 77d5eccd-fe36-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsxZYNM2jqXbOremGt6mJpQzgxyyOibNbNnpuQpD/Cw7oe8rrhmPNNA0QYS+PwU+qNPhqy7/vxGD+WkWJH9tQBGgOV7Onc9RLc4IVwmekWHUI805i7Pqx4qQCxVCt1qjD29EEaOxs6QCnOoBv0iRhXpcn2++eH3r7hm0gMa6nPI14kxsri/ESlXCtXY+AznG06g7HA4DQnCVYpOq4XcF8fPe8Q3TuveCJb3j9fdLUFh0iKuzZKUqjj0sS55ktcA64au72VAOjVpdVvWzQvqykVZ6lDEMsOTqXrxCaK64PygzIHjt9dSbhtTYnVD/kR4PqMzOL4jjxvUcV3B0FmqkFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02/HFPOq031eEhL8VgnnjPiz2m+5PSS3FjnT36FmFyc=;
 b=SlO8lmT8fdyJpvFa0DrFAKAGiAlZ9r0PqRj6PV48ph+9ZSo8PZJ/1u7+LguBqC0w9qsvThTQ0W7oJ+e883xq3Y7kUkg3CiBasvBVyYDPzoKYoC2VJs0nCKu4WCku1OTx9d87NLHEIDVyHw/8I1J6Dyl7wS81BYzSnFhcgckKw9FHNbhW8Kky34w75PFJsubqBicj+llMK1GPkh2tXR/lswE0SRex/PloOB4KoSYSk+LqjPCtpTLGDrzJR1Lowl0iomtTf0nuw/9NP/9tMXnumI3cqeN1V+SXNOgAx53nIPesZ2dhSyDG0ncAyYU/6ou1iF8/LJQ+qetf5csSTc893w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02/HFPOq031eEhL8VgnnjPiz2m+5PSS3FjnT36FmFyc=;
 b=WYiMLl6lrX0+YuhVmTFBcR3u4tiyfce+rZSlzS5vumBjDwWUhOJixMRYGevk04Zz4pyExFtTTdMLauRGn2PG5rcnis2xGrWz81OrpS6FWgIUYm4nr0BJIXMJmHhHHGWcygnvj1esZqk66/IrQ7n6uwaHZHidytt0ZeSTsZiVgNkQFKfeXDrahXrOSLe+BN7ynIBbw9mMsLanTJsBxtCWAvoXsQJIVMMp7vBQFmhgaWf13qE4tc+3E4bl5WYlew5w6xtI7sKhDp+lcGL1oxHjKWN5KHzaKyFxXIzDIFexoMGH+NKjT64SGIysHXrIJE3VXWW8V+dQLuHivstzYlOltw==
Message-ID: <abfd9448-8198-46b1-8ff9-1038ebb8c98a@epam.com>
Date: Fri, 19 Apr 2024 13:20:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 01/15] x86: introduce AMD-V and Intel VT-x Kconfig
 options
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <20240416062052.3467935-1-Sergiy_Kibrik@epam.com>
 <6166e740-3710-4687-ba1f-d4058a2e3d55@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <6166e740-3710-4687-ba1f-d4058a2e3d55@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::27) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|VI1PR03MB9899:EE_
X-MS-Office365-Filtering-Correlation-Id: e62bd934-80c8-4109-e923-08dc605a54ff
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bklLTEJSUHNydzhIM2w5Rzd4UkNjRDhnaU9yNUxmV0RYcVYydXpFTFpXVEc5?=
 =?utf-8?B?SFVBYmx1eWRNa2RNOUVTZkVGMnNzUkw4bzExVGFCUkxtaWYzaHJsQkNYVzUr?=
 =?utf-8?B?REpibVlaZ0FTd09lczgvcEN2VW9pMG1FYmVDTUZxeE5nMHBObzZZQis2eFA4?=
 =?utf-8?B?UlBYckpaZE02ak15L1Q5TmowY0k0eFh5NUdRWnpwUm5wK2FQOFhjR2draEZP?=
 =?utf-8?B?cUxCSHNLWWNNTDhYQ0ZheG16a2ZkRmlXbTYrTy9FWFNrQVJGOEZ1cHBxN1pR?=
 =?utf-8?B?NG1DWExLdllabjZqSStuZk9NT2d0SzVKK0tVNGo2YTd1elFueVoreWhRdU16?=
 =?utf-8?B?UWRQZmViU0JzNmpKeFhDalVaZFRaclZVOWVVREF3QUNhcGJxNk91NzVRNmN0?=
 =?utf-8?B?TFcySlRjVFUxOUdkaDhERVIrUmt5YmxPdnRSNXdjY2NCdnJqWXB4SmwzTnd2?=
 =?utf-8?B?Ymg5Y3NoSjRXT21SemVIaWE2Nk5pdzUxOGJkWk9IRHU4OGVYUDlyOXVrQ0Ur?=
 =?utf-8?B?Zlh4TU5xY3pmSkxLU1FhSmNSOGZaRERKM01HME5mZTUzcDRwcTdvNnV6WHRr?=
 =?utf-8?B?L3NENVB5Y3QvMUlpT0ZDUzNRb0FLcUZEanhLcVV5UjdmdGtPbFZnWTBQUkhM?=
 =?utf-8?B?U283dU5LbWQxbHcwNExNOXUxNGZ5Rk1Fc0lHWWtSbnZveG1HZVdtYWRrZ0hE?=
 =?utf-8?B?Q1VadnRxR2w5R2pBOW42RkRVMUJvQ1krQjlmaFNSWUV1WEpTUUhYTGdqUXFh?=
 =?utf-8?B?WVF6elJZQnJMSDlYWnVxME1GZGwrMklFcnFnWERvbTRpc1lnaWxzRkV6WUd5?=
 =?utf-8?B?TnE0c3htSHpzaEJwc09RbWYvY2k1MFRkM3NPTkxKSjJWaU9VOFMzMGVWQkJz?=
 =?utf-8?B?MzNweWFlYlpuT3ZwcC9NUnl6TjlwVjAvM1U3OGFEYmFKa0lyZFE3dXFMbTJU?=
 =?utf-8?B?TTRyMUxjMGRhdS9TTXp1ZXM1dnE0dzl5ajhaVEVxenNZb0pZd2NUSytOUm0z?=
 =?utf-8?B?alpybENucFB6M01QbjZlM2NZVXFWZ0ZRWmdQcFBRWmVNS1FXNHkwRkRjVUVN?=
 =?utf-8?B?RWpNaVdodG8zeWdLUXdCbzdEU0xlV0pjVzFnSWZrMXZPbElkaVJicWFkVlEy?=
 =?utf-8?B?QkRiNm44S0tsbmNkTUVjVUtnYmp6QktQd1NMK0RWQS9nMmRyWlFjVUZvRVIx?=
 =?utf-8?B?SE05WkRVWGZKSlVSb0N6MEFJRi9STUNqem12ckpvdkRHcUVwNlU4ZXE4QTNK?=
 =?utf-8?B?K2tDdVpCY3hNZFUzdHExRCtUbG9wSzRXNGJSTU0xRHdYYStPN0hNN25zUFIw?=
 =?utf-8?B?eGZ0Q2RiSjExc1VUbDRoUUcxZStONktxeWEzQ2lDQW91dVhCWU15NEZ1Q1dF?=
 =?utf-8?B?b1BJWjkyV0JTTTVsYkNXOXMxK3lIRVRyUXQyK2licWg1V2ZxOFNKYWxhQkhL?=
 =?utf-8?B?OWw4MXBacGhJdUhlTnQvUjB4ZDVVRjUvK2h4UFV0MVVVbXFxYkc2ZnFkUzY5?=
 =?utf-8?B?bHNkOHgvT0lkZUsyNkM2TGR0Z2NtMHpEa2lwUlQ1b0VTdGhwZklrdm42TUkr?=
 =?utf-8?B?RUoycXNsMUVIdFF5N0tmUU5Ea2VsbnBDM2s5czAvN0txVVZqRFQrY09ORGlw?=
 =?utf-8?B?cHVlM29KaU0xNXFIS3dUbndxZkdhSXdFblc0azlvT3FZQ1ZVeW0wU1NCM0lj?=
 =?utf-8?B?VjRwVy92VUtETjJZT3dKeExMNjV1ZFI2R3pUaElyckF0elhVU29jd0RnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MytxZWpPcWVQSytHY2J3YnJFUTN3VGx5VWsrL3JGYkN1MzVKOHdjS1lFcGRQ?=
 =?utf-8?B?NTE0OFBORjBtUDAvUHg0K1BQSUdYMjNlWUpxQzZuZFZERmFHRzlGV0NVVmw4?=
 =?utf-8?B?UUxxTTZLMlR2MmFVVi9KTHRzNzh1b3hTV1NydVVVS3FacGxFSDZYeXNWd3Zp?=
 =?utf-8?B?eEtDS2ozM0JURmVpQjVwUjVoUDdTTjBibjF6M3NqWVM4aEd3RVFFRDdVaEpM?=
 =?utf-8?B?Y2xVWlh0eTllSzB1MCtRQ3NzL05wVTFaOXhGaXQ0aHpxQzJYekNnZ056b1l2?=
 =?utf-8?B?WFNYbUVqbEZ3Y2FCcHY2eWFudFFXQ3ZkZThRakYvci9GOWM2KzJSaUVlakQ0?=
 =?utf-8?B?N0VmZDRFVHJzVjJ5dldFemRvR0grL0Zabm1DSWJQL1gzV0RXRWpwcnJzZjk5?=
 =?utf-8?B?VDFUajhZKzJtRk1rbkZDMDROTjQxZ2pvS0NOeGZMRXRuNG5NSFVxYTQyVkIy?=
 =?utf-8?B?dGJ5RW1RdFZ1SzVwMEFDUHlBM3dsWWVmTXMzbUJ2TEhsQWp4V3NXYUFWKzRI?=
 =?utf-8?B?TklwdHZBcUhKNVhZNmJrb1ZRV1BFTVNiNitkWU5RcHIzMFViMzNnc0hlWnB1?=
 =?utf-8?B?UktMMmtXWUhka1dTMGhxQ1l3dUEwcG53bWFBRnJQSjNqTGRLOGkzM3JKVEl5?=
 =?utf-8?B?bG8wdFZQSWNzWWR3VjVFQXlXLy9pd1N6SWE0K09tditDVE5hZVQ5VHhHSlNR?=
 =?utf-8?B?cU9xN3RMWlZMbzVJMWxKS0ljSHBRYTVmQmJvY1psVmpGY0JiVnpuWVRHUFor?=
 =?utf-8?B?UFdobktRdTRKd1UwblNEWnNBUkR4OVQ3V1RhZE03Zjh5YzVQaHpaejV2azIr?=
 =?utf-8?B?T0pJa2s4dVFiMXVGT3NjR3YvSGlxY1p1ZUNtNUNPZ0VkamZPWmJoODBEdStH?=
 =?utf-8?B?cmdlNGJUMFZJd0lOWVBKOGlEMkYyYVhNd2lLSldIWTlLTlRPeGhZS2N1Z3NR?=
 =?utf-8?B?QTBrb2hSdHVJTnpnZ2ZsYXNHVWVNOXJhOEc4L0dqOU53T1huOHRXeHVtL3Jp?=
 =?utf-8?B?L0dBb0RIUjJuZEVaS3BYVmxnUFBUdkVQbWZqbEhzeGEwUDEyQldVZlpIeTJR?=
 =?utf-8?B?bkY5UmtMSHIxcmFOTE5hRXNZSEhPaGZLYzExR29NejNacVYyT2s5emtBenhw?=
 =?utf-8?B?aFJmTmRYdW9lTEdMaTJOS1FoWFJLRDlIaFVPS2ZBbmNBMGREOEg0Z1hjdUE3?=
 =?utf-8?B?VTA1TjdsYUUyM1V1Z1dEWTZiRmIvd3RGWGVKa1djMzBjbWd3ZHg2REgwTmFD?=
 =?utf-8?B?Y0djNmQ3NU9JSjVxd1dIbGIrOU56Z2VHcWZvYmlHWkRSUUN3OThNWVlJdUh3?=
 =?utf-8?B?cHJnK1h5bmZHMUpHZHBQelNlQXVXMTNUSkd5bXY4a04xV2VVTndRd3pQY2FH?=
 =?utf-8?B?RWp2dVhFbnlSNk4reDlOTi9GZGlmbVZyMk12dHp4NERCV0pDQ2RXM0c3bThh?=
 =?utf-8?B?ak5FdVlHeUpXVG01SDZuM0RTZzJFdUs1T0N5d3NSZFZNQm1HQ09wMytpeGdx?=
 =?utf-8?B?NXA1MmVKR214Z3JNMVpvYjd2SDJaS1JaVDZySVBDaVhQREVlcWF5NHU0bk9o?=
 =?utf-8?B?emg3NnpId09qdUEvNmErTi9wZHRhVU1STUpXdFdrQVBKdDhSU1J4cVB0Ym1z?=
 =?utf-8?B?TU85bUI0L0F5K1FiSklvaHc2bEZidUJJbVFaZVdXZTVGdit4T2pJY0NiVnR5?=
 =?utf-8?B?a1lpWnJuYjI0YUFORnI2aXhncThTcFdkSnlqNFRJVkpoTGpoa0Raa0VyZDNu?=
 =?utf-8?B?LzZ3WGdOQm1mMHp2Zi9iOWQwNXdIcWpQS0hXaUF1NmpjanV4Z2ZtV1BNWFNt?=
 =?utf-8?B?aHliTWJ4UURDanpqVE5GeHpDZDUvOHZBU0JhY3VpdWJCT1VMc3gvTFhOMDBH?=
 =?utf-8?B?M3prRTVMNjl0UnFBRXBLbGVIZzJ0dDZiZS82K1NZcnYwaXF0NXZ2N3k4RXVJ?=
 =?utf-8?B?WTdjY1YvZmpMU21nRzAzZGhKelArVVJwbmJ5NU1DcDlKZVRUTy9tRHBZYnV5?=
 =?utf-8?B?L2N3SWZjQVVNRzUrZXFCUW43RFM2VE44WVB5bVVXankrVndSMmRKKzI2V3ha?=
 =?utf-8?B?bjFZSVg4bkJuMVVOd1ZKK1JGc1FoblpUL2gvM1AzemtYZlg0K3N2UnlpczBz?=
 =?utf-8?B?OGpUU3F3cW1JZnJLQWJTQ3ZkUXhnaEMyZStpMmlqaWo3c25JMDhhZDJlSHlV?=
 =?utf-8?B?V2c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62bd934-80c8-4109-e923-08dc605a54ff
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 10:20:27.0625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lWUg9fZajIpSVUS9L0wUo03hHBd0XhBjmtf+Tq5Dt3U9C6K6O2szoBP/uFs5BLlDqfEOR31aziAQH3C8P3EdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9899
X-Proofpoint-GUID: P51zFiVs4HvP8PdaFiCTnCsoulsCyDE6
X-Proofpoint-ORIG-GUID: P51zFiVs4HvP8PdaFiCTnCsoulsCyDE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_07,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190077

18.04.24 14:16, Jan Beulich:
> On 16.04.2024 08:20, Sergiy Kibrik wrote:
>> From: Xenia Ragiadakou <burzalodowa@gmail.com>
>>
>> Introduce two new Kconfig options, SVM and VMX, to allow code
>> specific to each virtualization technology to be separated and, when not
>> required, stripped.
>> CONFIG_SVM will be used to enable virtual machine extensions on platforms that
>> implement the AMD Virtualization Technology (AMD-V).
>> CONFIG_VMX will be used to enable virtual machine extensions on platforms that
>> implement the Intel Virtualization Technology (Intel VT-x).
>>
>> Both features depend on HVM support.
>>
>> Since, at this point, disabling any of them would cause Xen to not compile,
>> the options are enabled by default if HVM and are not selectable by the user.
>>
>> No functional change intended.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> In the subject tag you say v1, but I think this is a re-post? In which
> case and with it having been a long time since then it would be even
> more so important that a proper revision log is present in each individual
> patch.
> 

well, this patch isn't plain resend, it does have changes since rfc 
version (actually all of them do, hence V1 tag). Anyway, individual 
change log per patch would make things easier a bit, I agree.

>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -120,6 +120,12 @@ config HVM
>>   
>>   	  If unsure, say Y.
>>   
>> +config SVM
>> +	def_bool y if HVM
>> +
>> +config VMX
>> +	def_bool y if HVM
> 
> It was probably me to have requested this form, but meanwhile I've learned
> (on the Linux side) that newer kconfig is capable to dealing with
> 
> config SVM
> 	def_bool HVM
> 
> config VMX
> 	def_bool HVM
> 
> quite fine (i.e. no longer leaving around useless "# CONFIG_... is not set"
> when (in this case) HVM=n. Please double check with the kconfig we use
> whether that's the case there, too, and simplify if so.
> 

seems to work, thanks for pointing this out

>> --- a/xen/arch/x86/mm/Makefile
>> +++ b/xen/arch/x86/mm/Makefile
>> @@ -10,6 +10,7 @@ obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
>>   obj-$(CONFIG_HVM) += nested.o
>>   obj-$(CONFIG_HVM) += p2m.o
>>   obj-y += p2m-basic.o
>> -obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o p2m-pt.o
>> +obj-$(CONFIG_HVM) += p2m-pod.o p2m-pt.o
>> +obj-$(CONFIG_VMX) += p2m-ept.o
> 
> Please can these be kept in alphabetical order?
> 

yes, sure

   -Sergiy

