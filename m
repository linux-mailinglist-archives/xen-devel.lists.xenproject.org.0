Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBE58B96FD
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 10:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715669.1117462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2SFj-0003S4-8f; Thu, 02 May 2024 08:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715669.1117462; Thu, 02 May 2024 08:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2SFj-0003P7-5d; Thu, 02 May 2024 08:57:19 +0000
Received: by outflank-mailman (input) for mailman id 715669;
 Thu, 02 May 2024 08:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=216C=MF=epam.com=prvs=1852dd919c=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1s2SFh-0003P1-9Y
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 08:57:17 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f82d6c2c-0861-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 10:57:15 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4427mjg8010110;
 Thu, 2 May 2024 08:57:04 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3xv6s0g6uj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 May 2024 08:57:04 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by VI1PR03MB9939.eurprd03.prod.outlook.com (2603:10a6:800:1ce::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.27; Thu, 2 May
 2024 08:57:00 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 08:57:00 +0000
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
X-Inumbo-ID: f82d6c2c-0861-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nK3B0hBj2B9sZldpdWjD9odigTiylzTpKbZ0967gs6nZZAMd/VXqtirktlM/OuPL+YN5PAUQMEm1tmqzycfMwKp7x4UZ+Zh3EjkMqegXbnf89nDHLu54ePdUhVV9Q9eSzwddOxhR3qTez7DSs6bu6X9D9gvd9volPMGnjNhw3q3aDIuANoEVJh9Q/lAe1CWY4IliKVGfvehp5D43kC8DnczgUTm0uN7abT5n8i4sYydx+/NJ5OjTirB7XSQKYGTf1Hq9wq25QcsWlnkt4lK1qeyX0RC1zBW9WXQBUjznlTUwg9nAGSHTXU7yAczc9R6+i6RuzF/ngp0RDjGJCiB5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nILuJksBCbpy8EVtH9xQtajrWAAhX1Jwrb90HNRwaF8=;
 b=B+JwxXIDGr2p/lGUT2MEIA4N2GJSiiGnClXh2u87GDTZ09iv/H3YwWlIZrWM5//HkcTxGNRz7uLBoyGomIdoct4e+Nr2qVN9ea2B+XnYv4ebDHn+U6MMOZE/6yOIYZbQdse+P0XdGACYW0PrwYCAJeIB+X+GYI9DxgE/HPyaJI0a92C/846crYc2fJrCYZ6eywfkwb5PztHhoYZUJaudqe8UWkjSBkfrHR9I6IYXFVE3TtCyr8bSUJYTvUBe7kPHuNxDwblGr5n8HdsF/AtonmiGali9crloVI6NaeSIocwo5Jn/X3yIyknmGenk0JfBXFvbASdEVKWUTMKBFJNwlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nILuJksBCbpy8EVtH9xQtajrWAAhX1Jwrb90HNRwaF8=;
 b=nxmaUOc1GWG4v7HCyzUHI6ibZ8BfvVK4wSpkLOzlH6n2ziNqLKjT9wvnIBASlVX3bLuWRopUjrd++v0TATZU2rpp5y+xGOX76OMvmkPDv76nBBQQjCJPJLc7hZlZ8JIXEIwOhAa5uJCbTP9FARREHgSueHx8kMqGqsrNJMPSBiHsxdKWmKLEdG3XdmwokasXID0YPHAktseMRpMB+l78KYGJDikZMb4dV9SmeYGvRnu+crWQPybGw8bSQeBcYpByXhZb7zvi5NplPJnjs2HuWLeqfgf0s0+b+4JukjJGrnuAqTv+oQm92nCY/My7NH8ItcHlLqu75rVtukhnchBcow==
Message-ID: <4e7680b2-d165-4f35-9af2-3c2878eb59e4@epam.com>
Date: Thu, 2 May 2024 11:56:58 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 4/7] x86/MCE: guard lmce_support/cmci_support
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
 <d5fa50b3056b96f3046be39ed682a8b347f1b425.1713860310.git.Sergiy_Kibrik@epam.com>
 <79834875-d26e-42c7-9ffa-868a84a07dfb@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <79834875-d26e-42c7-9ffa-868a84a07dfb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|VI1PR03MB9939:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a2980c-ac5c-418e-ac35-08dc6a85d456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NlZyY1ZxOGM5V0hFbDZzb29TUjdTajUrZDVCQlVlY0JLYStnYnNYd0FSZjhB?=
 =?utf-8?B?ZEJLS29Ha28xd1o3MTV6bWlkT3VUbmxwL3JFYllOdnNuSDIvTjZrQjZmNmFX?=
 =?utf-8?B?U0E0UFhGUXRSUlJsc2Z4Tk83eFpRWVBTN09FY1ZNejY2bUQ0NXE5THR2L3ZS?=
 =?utf-8?B?Nm5Mc3hVYWdKbUFkMDRjM2xhUDdzbGNvVzd4cFowTWxIUUZibTdBY1p3c2Ir?=
 =?utf-8?B?aGVZQ3VteDFpUDU1blZVZzZVTnc2TXNyL1ZVV0ZaUTJkRDZZaHlzeHU5RTFT?=
 =?utf-8?B?MktlUVZKOUVZS0R3S05sLzd4OFJKRmZzWTNlaG5OK3ZoNGs0ZG9oaVFjM2pt?=
 =?utf-8?B?OFRIbGhIV1ExbUhNKytaeEpUNmxwaVYzTE1vbnduajQ5YVd5V1FZZVp2M05B?=
 =?utf-8?B?UkJvSmZOV1Vrcllvbm5qNkdQSzYvakF3N01STVVIeHpxWjF4UEYySVhqZW9l?=
 =?utf-8?B?ZVJNUXErRnlGY05GSXRjVnM1aGtSdE1BN2VIU3kyOS8zSHk2a015cnBIWTNR?=
 =?utf-8?B?SnQ1TXRBVWZqTkdkVmxMOWk5T0FuSGI0bnpMcTBnUGRDd3AycXlSMWZ4Y1ZS?=
 =?utf-8?B?aWZ4NlVyaTVNU2pQVWx3NUZlVm4xWTU1NDJxUXhJZzMzR2VaL3F4Z1pwS3JF?=
 =?utf-8?B?ZXhMS21aOUQ4dUVFTk1NNnNYd243TkY0M3hRNkJNMnlDcTM5am9yMjVlRCtC?=
 =?utf-8?B?TTd0cGFOb3FkWHhVYVNTUXpLaVpNMzFubHdDaGx2RGFoVzJKYlpEZnFJTnJp?=
 =?utf-8?B?blJnN2pYUzFMei9JL1dMeW40aTVtZmhZWTR4V0VpNGE3aWVXU3dMUHRsVGwr?=
 =?utf-8?B?WjhxYUlIWHJkWVc1VlZtY3JJZlNmRUoxYWJVSEdkbUZlT0NCenRMRFlXUlNM?=
 =?utf-8?B?SmtIRTljR3dOTzIvUjNRVFdzL05ZZVROM1RqNkxsV1lDM1kzUXZrYms0S2Nk?=
 =?utf-8?B?ZjRVQ0FFS3lLWnlTUzczWnh1TnZhQTVMa01aVk9Bb3Y2aWlWbWIyazlwcXJJ?=
 =?utf-8?B?WGNCbVhHQmIwYjVUMHBpaGIrODlOZHlxeTVqQ096TE1xTlJDYkh5alBMYVRy?=
 =?utf-8?B?Kysvc3c1TURkRmZ5cGNDaTJTUjRXVno3U3ZSK2w0c2J0cEM3TWpJL2Q0QVVF?=
 =?utf-8?B?T0N6QWprMlRkTktEWDdkSFdwR09QRW5mTDNiL0tyOGtYbmJtK2VzQWVnR2dR?=
 =?utf-8?B?MlVyR2poc2N3U05maTI4WEVTZDBxMGJIdWdablpiRUdzWUptL1hBbTVPajZC?=
 =?utf-8?B?c01aTkd6RTJDazVtQ3JsZy9acDYyMlFzbkJ6U1ZTMXFzV3d6UGFNYlVlWWdB?=
 =?utf-8?B?cHorbE1PT0thc0Y1WVRIMm96c1U1SzJxZWlYVGM5d0R2SU1JbkVWZmI4WVpX?=
 =?utf-8?B?dWUxYkcrZmJhaHVmenhiSHpma3crNlF4Wm5kaEE2ZFNsQzBkcTFEdXNmVFBi?=
 =?utf-8?B?TWtnL1Z6Z0lLNzNGanJvWXErTmlYVkFaWTh2M3FBUGh3RkE4RFI2QmZ4UHVF?=
 =?utf-8?B?KzEzUDdDdDh6MzlqS3BKR2tGODhDSXJrVTdGQU4wVTluTXRaNnhiazRPMk9U?=
 =?utf-8?B?OXlnN1NRU283TkFpVXFoVmVHT0taSUdVT2xnRFpTbEVHaDlFUFMvUDl4NHpT?=
 =?utf-8?B?QzlkN1NWYkkwMUt6SHM0M0JlcnNUSlV0cHhIQlhkY2JLdUNXLzRuVWZud1Bp?=
 =?utf-8?B?NEhWTGpUWGpxSFpXMEM1TkJYNm9UUkFaRGtaUncxeVN5NWRSR1U5amdnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ajlzSXdQT090Mnp2bFczdzNZS1lDSUZNaUtlTk1IcTFXbUgzYVF0eCtOQUFu?=
 =?utf-8?B?NVZUTThpN21tblBjczQweXlYUjlEM3gxL01TYUxydWFaTks3R0owUnJKVm1u?=
 =?utf-8?B?SXRwYmNXcXN3SW14YTBTUlRGejdLeGV0WXBab3hCdkNaeU9BeE54MVpnc1Ex?=
 =?utf-8?B?alQ5UkM3SkNlUktHT2lrVnppaVI1cFpJM0E3YzlkMlpDVGtrT2syajRVdllx?=
 =?utf-8?B?TG83d2NvbmVsaXhGVk53Y2E2SmRtd3dneWxUcVN3Nk55OXNXMmpQWlNBQlZi?=
 =?utf-8?B?NVoyR2tjWXRzeWlWZ1pLTmVKRlpTRmt2NDQwQXdZTW5JQi8yRWtUUEVOdnhR?=
 =?utf-8?B?dGE4R1FjemorTDdUa1JXM1BaNnRTMDVvbWNzK08wT2ZPWmNoSjVrc3h2UHk4?=
 =?utf-8?B?QlhwQzd3UTNBRDRjSWJZa3ZmdnlKaXdZM09tKzJJRjlkMmNSTWsvZ2V5aW1R?=
 =?utf-8?B?RUV1aGpMVUMwV283SEczTmZFNEw1V050ZFh0VnU3c0pUbXZvVzlrNkJOMEZa?=
 =?utf-8?B?cXNua1FZQmhOK054VzgrYlFmMUtzTTFwU3lpeGFpWjRkL3R0MVpHRUJiWHRL?=
 =?utf-8?B?ZXBYZnBXUE54OXh6dmFYNXNDWDdRdjFFRUprYkpuSHNTcnQvUkxXQmdKZ1JN?=
 =?utf-8?B?QklCOUVDcXVuYllsTEZ2WWdrYTJ4QUZ0SWNlTG9IWHorSkZFd0YvbUtBRmY2?=
 =?utf-8?B?NGhvaC9pdytOeXQzQ3RaZmVEUnNQKzZPVU85NTd6RXpOcWJPZytsNTdaUGhI?=
 =?utf-8?B?SXdBWXk2bjhzUkkra0ZTUW9IajlGekJ3V1ZoWElneXFMU1NHdkhGQWhDbGtm?=
 =?utf-8?B?WVhvdm1nNWlYd3ZNYlcxYmxBek9vaFdNOEx4ZkdsSy9RVVpFc092TnF3YlNw?=
 =?utf-8?B?LzNoWmJLaFNYQTZRTlhoMitBd2RqekNLWkNCUWhzVDFVdCtFU3VjejJlZ0ZX?=
 =?utf-8?B?US9hUUp3M1NpUVFHYlFCVkU5VUZISTZIOGV0cGJIL2F3WEFQczNpNldpME1l?=
 =?utf-8?B?dUc2TXZPakJmMllPRHJTYzA5a3NhNzVNMUNiMTlpZ25mUXlRYUM1bFhzMEZn?=
 =?utf-8?B?UDZaOGRtNEJxeUtiMnhKOVlLaitLWHUrQXhhTDYvWEJKcXZ4anBYV25NUi82?=
 =?utf-8?B?aitnaEtucS9RMG9xKzRjVFVkRWZhQXlhdG5PRjJ0WkcvSTlidVB0VXdmbXFV?=
 =?utf-8?B?M2J3OVpDL0Uxc05oMTI2bVhYSDJ1YTU2cS9HZzBsMWdySnRpMmFPMkhPZjRT?=
 =?utf-8?B?bGwycFhsUWU2RGhBZWZvYXJoVmowQ2ZSNFF3WmFFcC8vQ1FzSmdCS0hGWGsx?=
 =?utf-8?B?Q1EvWkN5TnRnTlZ5dGtlU1hoRG1DNXBjMFZubXdOTEVobVVyMHRRUnFuKzlL?=
 =?utf-8?B?eUNZb2pvYzdiSHdSUm8xWDZWZUE1NWd4d0RCNVZyckpnUzk1bEVOWVpzODN2?=
 =?utf-8?B?Vm12b0ZSVFgwZlAwNUJhaEZoMGRSZjhkMGJiLzBHTDRVTHdaamw2dDlSYVVk?=
 =?utf-8?B?TUs0YjB4QkFhait2bmx1K1hRL2trREk2RVpIcUM2UU5kZjUvMVJadWk5dnlP?=
 =?utf-8?B?TXJSckpyT1Bma1ZDZzhsMVo0NThuNHpuV29ORFMzM3VEVXAvdzBlVWp5NGlL?=
 =?utf-8?B?RG1tWjhKR3BpOGZ1UUM0R2YwSWlkeVI5NUJsVlp1Ukk0R2JXcTVaSHJYQkpo?=
 =?utf-8?B?NGU4US9RMWFFajVFY2JoM0ZyV0VzaGdzSnh4OUVTaGlpQWw1dzBIMjFwVlFJ?=
 =?utf-8?B?b1VWVHloZE9FREluazFXM1VXNDZ3bkZiQk80VGI0a0drRm00M0N6RUlYdUdR?=
 =?utf-8?B?ODZ5RXFJOWFvVk40dnMrN1BqcW1udmltZmM4cDBwT1NyTmdwTzdLWFdlRzRn?=
 =?utf-8?B?QURKVzBtRU05OVRNS0VDMy9MQjlqbkpRUlV1b3VwZ3N0T25aTkozRW1HUi9r?=
 =?utf-8?B?WHREaHFCdEVIMWJQSUtYYnk0THRrcXovNGtKaFNlancwNDV2K0hQcG9QTmhK?=
 =?utf-8?B?NVh0U29zaUx1UndHYnhFQXZEbkRIYXVUWE9qVU1kMUFydXN1dVNJRTMvUEsy?=
 =?utf-8?B?QTZnOElmTWxjajFOWUwyK2RRZkUweUVOMFNTaGcyZUtoa0J2TDRxak1nZzdw?=
 =?utf-8?B?TFlabWFZaDJtYWFkakx2VllqVllWWk1wOFlzWm8xdDVNTXlKYjkxNHdlb2FE?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a2980c-ac5c-418e-ac35-08dc6a85d456
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 08:57:00.7652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWHTtPiHKI+qfOTimgY10A7DKcJG+WzFkQ9nl7iz4D4knHcHIKfZ3WDamuUd+m9DHcs26jDGiEEL+FpiXirmkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9939
X-Proofpoint-GUID: 3kQenP0jxiSRuPn8jKw8KxYjcg8xAhwo
X-Proofpoint-ORIG-GUID: 3kQenP0jxiSRuPn8jKw8KxYjcg8xAhwo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-05-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405020054

29.04.24 18:42, Jan Beulich:
> On 23.04.2024 10:54, Sergiy Kibrik wrote:
>> Guard access to Intel-specific lmce_support & cmci_support variables in
>> common MCE/VMCE code. These are set in Intel-specific parts of mcheck code
>> and can potentially be skipped if building for non-intel platform by
>> disabling CONFIG_INTEL option.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> See comments given for patch 2.
> 

I'll squash this patch into patch 7 then, as they depend on each other

   -Sergiy

