Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22E0947A20
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 13:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772026.1182474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1savRl-0003hd-TU; Mon, 05 Aug 2024 11:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772026.1182474; Mon, 05 Aug 2024 11:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1savRl-0003eP-Ql; Mon, 05 Aug 2024 11:00:13 +0000
Received: by outflank-mailman (input) for mailman id 772026;
 Mon, 05 Aug 2024 11:00:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CTh2=PE=epam.com=prvs=4947b23bd1=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1savRk-0003dz-PZ
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 11:00:12 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2078a23-5319-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 13:00:11 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4758xPjS031315;
 Mon, 5 Aug 2024 11:00:06 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2232.outbound.protection.outlook.com [104.47.51.232])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 40tuqa0dst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Aug 2024 11:00:06 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DU0PR03MB9801.eurprd03.prod.outlook.com (2603:10a6:10:44b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 11:00:03 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 11:00:03 +0000
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
X-Inumbo-ID: e2078a23-5319-11ef-bc03-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVFBbJqtYWln+TFpuaDu8ppQakcYR0z486WB1YDFsDSnoaA/9xV1GaWXfQWqxFIedj4IS2xTKyv14nMoXJTuMHCgEpfuk8Ksi9x24cfqhHJnMCOjf8tMNuoYJ5aT38g4W3MbXVl9QXbEdrYREh3miW/MmlYR1UyYOQ3TCuK+d+QaTvFBN+5GynOGDhpAHyH22jriyDLjOTsRzZfcA84/RTnhSzXG2TJdJdxYwh05vt+a8p5yH/1AoKrpGfuo4llyAGdSOE2UCgjBnnwywqiFnlhXy5lX46NYJw2wMQydIX0g2c2iGh9QO+yVd8JxZBWf9j3JM6o6FxgamWA0pOx1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/j1ooJXuqNaX7jLUIrC2BUpsx9/yYjNSUWWlkZRGOM=;
 b=vDvuiiZDyhpLf3YdPujU60PX4l5mM7mhLgpXR0IpDMf/gs+ce9XQLBNTgOS12J4C/VM/nD2cX4q0e5/gjGvh7Qxxxwr1z2AWQaEp81UdBIr8sBW7mXBClvVrNk3vc3Nef/1v7a5QpJZg8V5GwoTvRRAZeeBr7+cWic1vFHKknKTPZ/IO8I3zN85EPpUQ3fj1DDfBK0XeXJuc70sJdIcH+Wnrpop4H2j34SGE1zos0Hq7/pVHqEIZBClbHpTFE/jVa1mDNTQmQSWxCaUqEx+Xdodx07KIMpflIdlHjupSjf9RUPNsUJNKSSlHSoq2QT630pw+ysOSeuqKJ6ACOxmAjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/j1ooJXuqNaX7jLUIrC2BUpsx9/yYjNSUWWlkZRGOM=;
 b=QCvzrO21Xkz79ntRPY5n18iU3uvxH4nCwzvBVysrSfp+56tLUbqZqbmFv2q/OJKk422GzHZHY0EGJ7BQupxUS9+72hbPx9zHKAxOIyAUp0nF3/TApV3t8DqAQQ4izmMpF++sj7Hs5AmD6Mnq9gXLxGVwfu1CMg513PsbcSsWHLGmBy4NTu0FeNm9w9uIhA/WcxzI7hB817MmHORakZaH094wniOj8BPBvRBeB1xBKhPMd5PjJHinGJh7XL82yEqLblN/3O1cec8K14aMF2ojh4UJ7LCdOd8O72gzALHO7I12KddbS+J4kV+I/jjHnON50ZdmN6JCf0PUJrgN9iZdBA==
Message-ID: <95a15330-d7ed-4162-8af7-d807551ed711@epam.com>
Date: Mon, 5 Aug 2024 14:00:01 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 13/13] x86/hvm: make AMD-V and Intel VT-x support
 configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        xen-devel@lists.xenproject.org
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
 <827008e4af26814e4cd4bf6abbb92c77fc136aa8.1722333634.git.Sergiy_Kibrik@epam.com>
 <b9356c61-d927-45cf-857d-e9c80e9587eb@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <b9356c61-d927-45cf-857d-e9c80e9587eb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::10) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DU0PR03MB9801:EE_
X-MS-Office365-Filtering-Correlation-Id: dd93c850-ac4f-4ebe-2b9b-08dcb53dc234
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vk14Y1piaDBWWlR5cXZ6a3NuNS83ZERvZUtsenBhdDFGSmo1MG8yWmRoOEpC?=
 =?utf-8?B?RE5UYldUdWh3cGFXcUUyZ2JjWDJyWWYva056VjVwRHcwSk0rbnF3dmNkdUYx?=
 =?utf-8?B?cGNZRy9qWG8yNE02Nm03VEozU1JjY2M4UXJjZHVTTFRPaEdZTkZlRmhBU2J4?=
 =?utf-8?B?OUNUekRPaHc2NTlsM2dhRHV4UEY5ZS84K1BkeTRheXkySm12b2tGNER2Qi9t?=
 =?utf-8?B?d2twUnRxYUNzRWQzaENob1NKbk9STzBaVHRLTS9HQUJEMUVmdjZ4czRITVFo?=
 =?utf-8?B?OVRIbzlmM1E5dDVzOFJreXZrOGMyRXJuMVNIRU1MVTEyQkxMekFZMndyVlBy?=
 =?utf-8?B?VDd4RVRNa2ltdDJ0ek5OOUNTTHBneE5uSWoyWXlxWmFPZG9ZTkIySHNLb1Zn?=
 =?utf-8?B?VHFGaWU1RmNtWVZWTkNCOVdtVWdxWlVYdis1aFhQQTBXc3pEcTlMTXhDRytF?=
 =?utf-8?B?VHR5ZGxLY3cyeFkzTmxFTFRlaXVDRlZ3cEdoMXpBSTJpMC8vb1BFL0g5SFla?=
 =?utf-8?B?SWJDdU5MaHhSc0FwQnhLWEx1Q1Z6eGhWWEtsREVqaXUyN2R0SDdUNnpmbE4z?=
 =?utf-8?B?NGVFU0IxMFY1c0tsOXkxeUZSTEpQSmNsa2pOT3VNSHkwUzlKSnlMZ0tTMlFL?=
 =?utf-8?B?UDd5TE41RS9ZRmdRS01UajV3VVc5TU9GcUppek9CVnN2aE4wY2RlVVZGbW1h?=
 =?utf-8?B?a3pUSCtTRFBWblkrV3g0cG1qbXJSRURJb0ZzcTNxNVpWL1g1bXhDenhaeWxZ?=
 =?utf-8?B?TFlHK2NYSVhTTlNkQ3RDQmxteDhqcUkwRGVzelpiYWErcEppL3ZYTEdoc2E0?=
 =?utf-8?B?QkVGSG54OHUzR3YyNUQ1Skl1SExpMjRQR2dtSEZJbzlqSnhFYWs2SFJhWUVI?=
 =?utf-8?B?RW1rTkVVanpKRzY5Nm9pNG5yYXRNYllLQzhBd2hRL1J4L2N2NStFYTU2anht?=
 =?utf-8?B?NHlJT1ZFS1ZwVUEzWmpiTVllanh4WE1FUnpZWlRJWTZicUlyVmJBdVM4ejlF?=
 =?utf-8?B?eXlHcngxK3F6WFpLaFNYbU1NSE1YYjZmaDFSRzNOVG84R3lZbVRkMkIzZ2Vh?=
 =?utf-8?B?U2V1YTQxQzFjSWtMMWdhN3VLQnJOZTV4OGQ2bTVCNHlCS0xhenprWkkwbWIx?=
 =?utf-8?B?bm9vU1lhRkVvcVlNbGQ3cnVtN2d3ck9vOXRLaG5qZEU1V1hyM2xRSklZSjlK?=
 =?utf-8?B?SFNxSWM4bkNQdUNTN0ZYR2V2YTZremtkRDBYRmIyLzRqQXlTOFg1NUNWVURu?=
 =?utf-8?B?ekxuMTRld0pLQ2VsSzhuY3RZbjQrdVpCK2EzMC9WejVyWVdzOERLRksvL0Rp?=
 =?utf-8?B?M0wyUGdsN3BlYUd5bEdRQStTcnhTQ1hTMWgwOXBwb3huODI2K3MrcHJRRWpH?=
 =?utf-8?B?WkMxVGxlaU53Ty9Senh1STE1S0RETVBiOEl1ZDh2QkVkMW1sMXRleDdpT08z?=
 =?utf-8?B?a0UyNlB0YkI0NjJhT3NTM2hIMGdLNklsM3BQRlFWWEJRVC9RRDRUY0diKzN6?=
 =?utf-8?B?NXhSUkFQTndkc01heFZzalFhMXpMcDFLdEw1WStPVUJ1YXZXalArZitvSk44?=
 =?utf-8?B?bXJIdElQaWV6STlYSzZiWHk0VkR2VWY5M3cxVm01TWxHdHkxSVI5MjhMZndD?=
 =?utf-8?B?Z1RLQUNIMUo5S0VzMXNUSVFmWEMrbmNpT0w2YTVKWjhGOC8va09FTG9vbHZV?=
 =?utf-8?B?S2pWYnZJbVdOQy92Zjl2VWNvYXg4c1RhOWU4dFlOMFJJS1NRbG9qNzB6ck0z?=
 =?utf-8?B?cCtXd0JoKzZmS29GMzNTUk1teDFPVEhNY29lbTM1NGh1T05KazVlNlMxaTNW?=
 =?utf-8?B?M0VJWjkwa2JlQThlSmpCUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnIyU3lSQnZVTW5CNUZUQ1J3QStIWlROWXZaNzhHUGxad2VWRU9NL2w5VnpG?=
 =?utf-8?B?TGVlcklVSmcveWVrdG50ZUJOQTNxMkZMWkRTNGt3MmZKMmpaSENjR0pPNmx2?=
 =?utf-8?B?Mk9CWmc5bEN6Mk11dlBrVVFpL1JuYm9haysxSzZYTUxheUlvN1YvWWVjRGsz?=
 =?utf-8?B?M1o5NlF0SmprSXE3QXczTkdTNWpqUlIzWmdhSUltcElBUURtQWVXTmtQWTYr?=
 =?utf-8?B?VUc5UTRBZmxrY0ZkNFk2REI2enNXRFI5T3c4a2t6YXJVeVY0eWhRL0w0N1N5?=
 =?utf-8?B?RlNETUU5NDYrOEphZjY5RWxRRGNnZkd3MWhSNW5DcnY2ZldhT01xVU5xc016?=
 =?utf-8?B?VlI5dmlTQkRpRWQ3M2F3VXNnb0ZRM2pVODFUY0hLOXhwbmtqSXQrM25kSnps?=
 =?utf-8?B?MHREWmlKTExybGw4cmlNSVZFa2ZmYnd2OUF2ZDN0RnFNSnJYa3RVTU9uV3Bx?=
 =?utf-8?B?YXVPdmEyMkhpMlUycHFuRDI0a1U3eDZrK2ZwbUxiS3MyWmVLVi9JdFJ1YWFC?=
 =?utf-8?B?VW1TNUNRRzRHRThvTUpDY29ZREFDMVZtaHJyeGhtN2xWMmR0VkxKVG9rbzlE?=
 =?utf-8?B?MnB5Y3Fzc3VSMXhjSDJmbWhWbU1LM0JtVnV0ZGZqaXFKL01NUWM3YVBYM3Mv?=
 =?utf-8?B?R2M5UFVSQkFGeEVmaW1aZkQ5Zk1ibGVoUXRLYzdSSDhkVFJuTm5rdmRnbU55?=
 =?utf-8?B?MEU1WHFjKzhydzN0ODdaTklCVldVQXFSdVVneXR5bjRuU3dWMERLcklPSVVs?=
 =?utf-8?B?Zkx2MDk5N015VlpxakhqNmFsbUZrc3hNZ09QeWEwdFVicDk4QkFqVGtkOVNP?=
 =?utf-8?B?cXVPMGU3SzhIOHA1bjI1amRnd1FGdjNlRmlpaHU0QlArcEhFdDhwdlFXQUFC?=
 =?utf-8?B?bTY5VDdBS2dpckJMaG9jR0RsbmxwakNzNFIyZFlrMjl1S3hLeXZIR282Y2J5?=
 =?utf-8?B?WmxIc1JEODFGeEsza0FPUTZSdFptSEdhTzExNFNsWGIyRmx2QnlRM0lhaUw0?=
 =?utf-8?B?NHVXYVd0NVVlL3A2MnBEdnl6eEU3eFRpOXZPVlorRnpIL0c5cy9ERDdnS1FX?=
 =?utf-8?B?RDNiYlpUZ25FenRkQ0pqS24vR25LTWo0QnpnQVdLR2tYOTl2ZmJpZVBkb0pZ?=
 =?utf-8?B?Um02S0xRWkRnWnFEbmdPZVQweElIbFgrVkVxTjQ5TUN3cDFhTFByeWlDR2lr?=
 =?utf-8?B?SFhEUjVJaFBBY05ncEVhVDRDZEgvYncraUc1ZVo3MmJHbkhYeGE3eTNMQk5t?=
 =?utf-8?B?STYxNUxVM2ZrME5xQ2E3NmNKZ3ROdlJnZlFwUzg5aUNBbnppcHBCNEUvV1pt?=
 =?utf-8?B?MVZaMGJjZ1B2MmZoUGV3NjJ2elk2d3BUckkvK2dlWVJZZUxDWVFzU0F4TU9i?=
 =?utf-8?B?NXd6WGNDSkFkNWhnM0gxSFQwYzR4M2k5dDlFdFhlVFJab3pXb090Ujh1N3FX?=
 =?utf-8?B?bk53WVN3WVBGWnZEaFRJTi9BTlFDK1NydXJTUFNlR21IbXlOTklva2FZNFVh?=
 =?utf-8?B?bjIxQlZadDJQQVBCcUxtOTFCRVVuQ0l2T3NIME9vS0duOXpTZm44RitlQUlJ?=
 =?utf-8?B?TEFYbnVKajlXZnpQWkFSSDVsN09xek9oMWQ3M3U0QU9PVGQ2S1gzaXdRcmNT?=
 =?utf-8?B?NytTNHY0R0RSWXpVWU42MFpNOFEvT3RTUUVacjk3OEFLWDcxOFV2MWVKZHVV?=
 =?utf-8?B?a2JCWC9zNUJ6UEdiQUlvYjhKOFJFY0JlMFpzNDBjb0dUSUJjVzd4eWZXVHVX?=
 =?utf-8?B?MExHRVdtYm82bTZ0WGpMdkVyVTNTZnlnKzg5dVJGelZCWW9RaGg4clRLb283?=
 =?utf-8?B?UzZlWDAyYlpBcHJNdWJNZGFKUGZGckZIT1hZakswZkZLZWEzMWxuREFhbkgv?=
 =?utf-8?B?NFhMK05Id2EyOEpjd2FGNCs0cE5FOW5PWGFGUEpHV3k3TWtkVEZ1QmFWZ3Mr?=
 =?utf-8?B?RlE1YWpvK3dHdjlyQXIrLzI0eEhEMzJlZHFIemI4UUdVS0hIczh0Qk45UDNs?=
 =?utf-8?B?Z1hIdHY1MUFlTmErRnY0TitVT2xyT29wYnJYS0tlNlV2NUxEKzA5aHBrc3JQ?=
 =?utf-8?B?ZjkydStkVUh6WTB4UVZ6MzNQdVd2dTZtTGRXZ3k0Rkg2M0hjaXd3RnRWTFJ2?=
 =?utf-8?Q?yeMF0UcO16GFqUmmCEuNj+0SV?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd93c850-ac4f-4ebe-2b9b-08dcb53dc234
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 11:00:03.6523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2aVGpV5uk/o/LCCx3HA5m6QvCsmv/KWan0bgu6UdeZU2tLsPzsmLv4il5zvYcKjkJavnCYN0IrGWaUs77IsvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9801
X-Proofpoint-ORIG-GUID: 3HUv8IrJHWXxr_GIJFHVxbw4Hq55gg9t
X-Proofpoint-GUID: 3HUv8IrJHWXxr_GIJFHVxbw4Hq55gg9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-04_14,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=892 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050079

01.08.24 14:39, Jan Beulich:
> On 30.07.2024 12:41, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -123,11 +123,25 @@ config HVM
>>   	  If unsure, say Y.
>>   
>>   config AMD_SVM
>> -	def_bool HVM
>> +	bool "AMD-V" if EXPERT
>> +	depends on HVM
>> +	default HVM
>> +	help
>> +	  Enables virtual machine extensions on platforms that implement the
>> +	  AMD Virtualization Technology (AMD-V).
>> +	  If your system includes a processor with AMD-V support, say Y.
>> +	  If in doubt, say Y.
>>   
>>   config INTEL_VMX
>> -	def_bool HVM
>> +	bool "Intel VT-x" if EXPERT
>> +	depends on HVM
>> +	default HVM
>>   	select ARCH_IOREQ_COMPLETION
>> +	help
>> +	  Enables virtual machine extensions on platforms that implement the
>> +	  Intel Virtualization Technology (Intel VT-x).
>> +	  If your system includes a processor with Intel VT-x support, say Y.
>> +	  If in doubt, say Y.
> 
> Despite my earlier ack: It appears to make little sense to use "default HVM"
> when there's also "depends on HVM". "default y" would be more clear imo, even
> if just slightly.
> 

indeed, I'll fix it in v6 series

   -Sergiy

