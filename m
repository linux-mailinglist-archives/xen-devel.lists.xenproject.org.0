Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2540D93769B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 12:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760971.1170947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUkoH-0003GR-GA; Fri, 19 Jul 2024 10:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760971.1170947; Fri, 19 Jul 2024 10:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUkoH-0003DO-Cr; Fri, 19 Jul 2024 10:25:57 +0000
Received: by outflank-mailman (input) for mailman id 760971;
 Fri, 19 Jul 2024 10:25:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VB7D=OT=epam.com=prvs=39308c3d2f=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sUkoG-0003DI-6A
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 10:25:56 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 467f01bb-45b9-11ef-8776-851b0ebba9a2;
 Fri, 19 Jul 2024 12:25:53 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J9xwrA015214;
 Fri, 19 Jul 2024 10:25:43 GMT
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazlp17011026.outbound.protection.outlook.com [40.93.65.26])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 40fe09h99e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jul 2024 10:25:43 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PA6PR03MB10405.eurprd03.prod.outlook.com (2603:10a6:102:3d4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 10:25:40 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7741.033; Fri, 19 Jul 2024
 10:25:40 +0000
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
X-Inumbo-ID: 467f01bb-45b9-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnAggtMaLfnm/kmHQz8ADUMiQusZjkwK0DzIwm495dpynXQS9CdIjKklwpXjTfFYomf05PVLiUY+oYTULaEv7AojRaPakrLVop45vAWssd1Q9gMlDt9YZYzzg5Xs0yG3yFoGjipUTSyg5TCKtt+AMtewKHsCFUGewMAY85lKH5XKr4bIBSt9sMV9tnTwBXmtl5BS+OhqOgBocRFP9mi1BVYJVvZYxibV2QDeFSCZ4UnXNoqSLqkqwVkhUT1S3q6GwEgVTA1mwrZLMrE9+4q4TH2N5WVn/uBoUnmWm6Bx/RLD8jiDBW537vJOCo4b0AtbUqc8/Atko8AmIHg1at5Yvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXNt+dP5yqQ5aS8tLzvcmScu7fdKdFrX4XddTGOPoNI=;
 b=RTsEc8HU5c9RTo2/H8S1z53SQV306AEOaVsYi7VST5eYc8LsULYPjHW6qroNkhYot3bDvRbcq/zefGv+gi4ayVZsDgzfNgRAVlORQOvzcN/TbZz+WobQhcwN8CW6CKyPK4NnUiux4V6dhSS4b1tX9Nw5bXML5aglSPyNOcL4zJTXrSYLtjd8YBF0O8m5+97qqz31YYNumFzJXty0PiztfQnHhwp7RSkos6MCeyh2EYmoEk8Dy67zdFlElp0HSw7S6UXbiBOjjs2IOGOAXRDNrwb4yp/GxTIC4wy49itt/EEnP/6vp/mtNOxA4szLw1sppHuIdzXBdddHlD42JXMZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXNt+dP5yqQ5aS8tLzvcmScu7fdKdFrX4XddTGOPoNI=;
 b=pXsaGcRxS0o0Cz8NZuEW7GcZWb6sKmGQoxKXHFuJi9YhNhU5Weknmbo6xfjdibdxFr7Yr4dPFBGWRXyCwXH/VTX6NTQNOt3ZysoH7ZcWiDsFcPp4OMhzH8Au5B5yoL4nSAkM4fsBS0qwlqoC7z0PPnPIugd9Go67cjzmdepQCIUCWCi5cXFbu+uoMqYcvoS1I3PN8Flv4n9urqw5/r9sbSLqv8/NOfZvOwXSgtOpbrC0FT/wUSshXOEqZJCEB2oE9TYDL3GPMfX6xmwMUTPSQl05gyhNulYjyKRAA0VCWUnhytXdH7CL/bOvoqOZyXJ0Vmi3qDzxNDnpHi/UiIZXlw==
Message-ID: <8969dd83-2fd7-4afe-9809-d6ebd342f8f8@epam.com>
Date: Fri, 19 Jul 2024 13:25:37 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 02/14] x86/altp2m: add static inline stub for
 altp2m_vcpu_idx()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <952cb307528f16fc36a3fadbe26d83bc6805f81e.1720501197.git.Sergiy_Kibrik@epam.com>
 <f917837a-e9ee-4d55-b158-208de57ee034@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <f917837a-e9ee-4d55-b158-208de57ee034@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::19) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PA6PR03MB10405:EE_
X-MS-Office365-Filtering-Correlation-Id: 01831d08-d22f-42dc-2a2d-08dca7dd2325
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sk9ybys0V2NXUnVyMHFmT0ZxVkl1dmwvNHJ2aVYxdlNRL3ZacTZOdGdaeGg1?=
 =?utf-8?B?bHBaTWt1MXkrczRsRGRnQ3NleHFWK0MxNE1pdmdSSzZwNlA1Y1JlbEkzRlVJ?=
 =?utf-8?B?SkFHV2JkVEFUYTBaV0xFVnFCbThNSlp5M1UwTVdoU002K2ZkM1BkNHRVenps?=
 =?utf-8?B?Lzc5RzlLeWdEKzNYMm03N0dDemtoS2s0RSttajMzTnhJU0dzZHUxODVuam1Q?=
 =?utf-8?B?NytVUEpyaFNqY3pORW0wbnNxQ0N3anpra0poMnMxamsxUit6cTlqY0VEaFNt?=
 =?utf-8?B?dDNIK0U0aGc2ZmloUGtyMTNqZjFWTmsxcDB3MmRJZWhHYjdEUjk1aVIrbnc0?=
 =?utf-8?B?Q0JCWjZDK01PZ2VNYmpTMnFSTW9RYzM3NDBWL0QzeDhHcHNiMDhSb3ExSE50?=
 =?utf-8?B?UTBNMVVsS2tjcElrWVZCdnpKc0UwYUpUeHV1T0E2amU0VUpFMFNqUHIwM0sr?=
 =?utf-8?B?cVk3MWdFQW15eGttQmJTWWEzU1BnMDNDNGRaTk1XUnlqUUxGMFpWMFo2bVdU?=
 =?utf-8?B?dktBMU91ZGJkNXIramdoOWlMNVRqQmQ2REdHMTduUFlrcnU1SlB6MWdEL01l?=
 =?utf-8?B?aHpCQUp0dTMwOUZUZVZBM1kxbGd0UEp1TzN3dVBlVG94Vm52eThtdzk5Mm9K?=
 =?utf-8?B?bzNEK3hvUDd5S1BMZUVGZ2xydC83M3hFWmk4Ni9od1FBVUl2aUMzaHA0MDM1?=
 =?utf-8?B?am1GbDh6TlJnMkUwc20vVEx0TTF0ODRyRlNiRGlOc2l1VDJKM3Y5ZDBIMnVN?=
 =?utf-8?B?Q1hSSnNXcjBIekdmVCtIdjVLUnBFb1BHMXU1VzlMN2lHZWt6M1pnNFR4V1hD?=
 =?utf-8?B?WHFqQ20wL3h2ZFJnZzRoNzVrZEVUY1NVZWRQajYyYXh3VTZGeTFoTm5QR2RS?=
 =?utf-8?B?THlIckZkM21DN2R3NHAyOFlqWlg4WWdDemg2MDNWbE5rcExHZjFyY0cvL3I5?=
 =?utf-8?B?MzRLZlA2SzR4Q1VWemdSWmlsRjBVSzNGN2xNM2h1TDhKM2JMTUJrRjE3bGZ6?=
 =?utf-8?B?djZZNW9VY0QvTUtUK083OVVsQUdNRDFjUG4rQ0d6eW5wdkxrc21LV055Y0NY?=
 =?utf-8?B?YjVkWHVvYWlROFhGZ05VYnBuQkpFVXhaaEpSd3NCbTFkNUo5cXl2d291bFU3?=
 =?utf-8?B?M1F1NlRvSTNRc20yeWt0UGdqeVJ1czhDSEdpVGhkbWIrZlFxTDlEMzNqTmtR?=
 =?utf-8?B?UzdweHdJZTZNQStUSFZJenViRkI1ZW9qWWxWTTJqTlU0Z0hiTE4wVlM1Qzkw?=
 =?utf-8?B?Y0Q5SG5EZUpDeWhPTVFoOGJoU296bVJrSk9tbElkSWdmcW5la3pCdGJ0SkM0?=
 =?utf-8?B?RFVrNTlhSVBoV1VYdFNYaEpyOVZWdGxQUUkyS0RBck9KdHpPVWlFS0tGa0xU?=
 =?utf-8?B?SWxhYzhOdTZyZ0FWcUtJSzZUbEhBeVRaR2dwQ3d1WEJIY3hPWkVqejlrcUc4?=
 =?utf-8?B?UXloOEVrMXlSUm9pNUNsVHV0bDVGVkUwSzVVMUExMy8wenl6VVR0UStCdlRp?=
 =?utf-8?B?d1ZWVkVaL3ZQMFhyNUhPWmVjZUYzWWxpNks2RWJTVDVhWktGaG5ZNzgrZFc4?=
 =?utf-8?B?Y0pkSUZnbWx1Y0M4RnFmdGIvQmYvaUVMaTd3Q08yRm42OWVlRXVRSXJpVjVk?=
 =?utf-8?B?YS9kWFh3Uk1laE1XU21MeitsRVRWRFZrdWNCaks0TE9QNWlqVHdzOEtOM3VO?=
 =?utf-8?B?ZEZJTEdkWk9VMFB5SnJuRENjUGl5NUpKVStxcC82akcwNW9MSWFHVDB3dUZB?=
 =?utf-8?Q?NsBWMIR3eGVHpou41I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1lNTmpoY3hYQmNlOUVJeWdmRDVadTlGUXpNSG0vM2VjRFpsWDR6WXZGanRC?=
 =?utf-8?B?eXlmYWdmb3RXQU9iZHJSRi9tYnVMZzk4a01VTFJwbmhxbnNEeWxDUlFVN3Nt?=
 =?utf-8?B?MU41RklHWjRRSVFjQUFkNjU0WjUyN0JXelorNVVvRmdyaEZIVGtvRnd2Y3F2?=
 =?utf-8?B?SFM1LzV3Vk9maDhBeVNERklEWER6ODAycnVRc1JieUdOdnZtVTFMZTVzbFZx?=
 =?utf-8?B?bC8xK2JZM2o5Yk1NVXJZSWFOdStyTEVyZ3RNblQwZUhDNXRvV0hYaW9uSEhi?=
 =?utf-8?B?UEVMMElRTVZONkVleHEvR3dCbkUwMGkyZHc3NjRHNDhtbTNKZE83OEp1Rnoy?=
 =?utf-8?B?YVFHcWVlUTdNQ2REK3E2RkpROGQrZkUzazgwTzFPUlcrYTVpQU9naEwzNnFo?=
 =?utf-8?B?dHN5U0c4Q25nbk5DWnJhOGt3Q2owMlAzaFJwWDdmNFlIdUNxYU1jUGUrMmcv?=
 =?utf-8?B?TXFvNVkrV2xwbUROTXBnRm5YWTFxU0hmeXhEVmxTc2xTMTc4NVRhNlk4VU5i?=
 =?utf-8?B?R21VVjlKeldGYXdYeWVkNnRsbU1RcEd0aFdsSFpHZkJwekNxdGdrQk1BcVpi?=
 =?utf-8?B?T2xMZlRlRHBnbjYrNnkzZDZORXlOSktXSkZYeUtES1M2M2VYc1lNSkVTanl1?=
 =?utf-8?B?b3lOZDk2MDdIVEYyR0RaSnFOTTU4WXpENVR2aWN0SFFqdU5PTkhUZ2JqZmRw?=
 =?utf-8?B?V3VQQy9YU3NLakpUSFFZcDZObVY5OUhWVkZCM1FGd2w2bndzMC9MWm1yNjg3?=
 =?utf-8?B?V3owWVVQbUpQeUNkVTdIUjNOdnFXQ01IUGVGczlXL2drVmpkN2gwKzFUZmNY?=
 =?utf-8?B?M3Z6RjkvMzRhSHY1VEo2N3VJSHhYc3VQeGRYcDJSMWxXckpxbjAxY1BwS2x4?=
 =?utf-8?B?SVpaTzhzN3hSdlNYMW5LK3RiNlppUzI1YlVIeGZmTjFIajBaU1NiYnhQa0hz?=
 =?utf-8?B?dGxBNSsrRENqdlRFb1pKSGY0bHVWUWhmRWc1R1BNWkNwOSs5SkdwZkZKR1dQ?=
 =?utf-8?B?K1VVOVlXTUZFM0R2b1FZN09weHovbk43bmpRRklzcnNuSFdOWGlyNVdiMHIw?=
 =?utf-8?B?NXo4azQ0ZXdJL0F2REQxMDVSeEw4MmZuVUVpU3FzcDRsZ3lKZUhPMm1JcVRI?=
 =?utf-8?B?a2lYNG5aQUFUMG5iODlCVFVKQlFqUEhoMnluUWZiVTQrMmw2cGNpUkhGTkpw?=
 =?utf-8?B?azhzN0VyK21PZ2ZUbnVvMTk0QkUyazFCcDMxVFBRYWFYTCs4bXhvZkdPZkUw?=
 =?utf-8?B?REdzOWtvRjVTWjVIcjFpMks3bThDb3lQNzFQR05pSmlpUkdEL3ovSm5EM0N1?=
 =?utf-8?B?d3VlT2h2YjVDSVZXZHJrSzlIbDJMMDBZQ0VDbi9GSjU5LzFBS01mNVovL3l1?=
 =?utf-8?B?UjJoOElXTXQ4aU4xLzh2cWVIdkoxaXQ5U3VCTXVrV0NwWFFtbHpxYndhalJa?=
 =?utf-8?B?U20zZ3BYWnI2ZEozSk9CWmUyV1BlM0xQWWtPSlBsTVoyQ2dQTWIxQXhKTHpz?=
 =?utf-8?B?VWZTeHFyc2cvSFlnelJjMzFrZzlBenVUTDJXSUlKMk85TzdSTnVFZkdVTEdQ?=
 =?utf-8?B?NzBqRXVkbFczOFVvSGc0YVp1ZWsxOWVUdzFvVWRVUWI1NnYzMkl2VkJCcW80?=
 =?utf-8?B?d256bUlTNmxuUVdlSGVvOU5qQjlLU2hnT1FhczhYV2EvbkszaXZWVHIzWUk3?=
 =?utf-8?B?cXpuRmkrc1k2SUI4ZVllQVNpaVF0Y1AvNzVTWXpYQXJkekZDQU9qOUpPcERJ?=
 =?utf-8?B?alhlTTNYbnR6NXlKMFFtMEQrZVpZaHhwU0haaTFxY05pc3pEWHBNTVNMMGt5?=
 =?utf-8?B?eWpKUGlhTzBNenZnYWoxSTdIa0Z3VFdNakhZSWc3RnpzNzJ3ZnhrY1hUaVE4?=
 =?utf-8?B?OXNPU3NXMU1zdWtsL0F3cHJ0M1RPZVRZNHlBZlo1N2d6Z0xVb1Rhbldqak1O?=
 =?utf-8?B?WWczOXZRaElGUEE4YVlOSk5kSzBCL0tWWW5US3ZIbG11ejJtQWw4QzNQZ3g5?=
 =?utf-8?B?NFpYbFhrOUhRam9ZeHhXMW1mSmF0NWs3emJsZmxsUXkxOXJNdHh4QWo5N2sz?=
 =?utf-8?B?NDFoNENlbkNvajJuN1JFOXpBbDJqMDZielpVMUJFYjBDSkgxOVBJdjRaUzNL?=
 =?utf-8?B?bklMZEFpdlM4eWh2KzNuTlgxOWtJd0VDRE9xRVM3cHd2UGQ0c0ZRcU5lTGV2?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01831d08-d22f-42dc-2a2d-08dca7dd2325
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 10:25:40.0516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0IGj88/LvUnbt/tWh2ZfWPTy8YgKOXwY1YIu/hrDPAHn0GKl3peTbA1JHx+GIfSJYRbhLLFe7WQpDcoS2wSXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10405
X-Proofpoint-GUID: mFbFllk85recyBwOmZdgkJtnlPHHfe47
X-Proofpoint-ORIG-GUID: mFbFllk85recyBwOmZdgkJtnlPHHfe47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1011 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407190080

09.07.24 10:09, Jan Beulich:
> On 09.07.2024 07:48, Sergiy Kibrik wrote:
>> The stub just returns 0 due to implementation of  p2m_get_mem_access() for
>> x86 & ARM expects it to be 0 when altp2m not active or not implemented.
>>
>> The separate stub is favoured over dynamic check for alt2pm availability
>> inside regular altp2m_vcpu_idx() because this way we retain the possibility
>> to later put the whole struct altp2mvcpu under CONFIG_ALTP2M.
>>
>> The purpose of the change is later to be able to disable altp2m support and
>> exclude its code from the build completely, when not supported by target
>> platform (as of now it's implemented for Intel EPT only).
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Yet what doesn't become clear is why 0 is a valid value to return. On the
> surface 0 is a valid index when altp2m is enabled. In which case it
> couldn't be used (without clarification) when altp2m is disabled.
> 

I looked into it a bit more and found your concerns to be valid -- 
indeed altp2m_vcpu_idx() should not return valid index when altp2m not 
supported. In fact it seems that this routine should not even be called 
when altp2m is not active -- all but one call sites check 
altp2m_active() first, and there's stub in include/asm-generic/altp2m.h 
to block accidental calls to it.

So I think about falling back to v2 of this patch i.e. to guard that one 
out of line call in hvm_monitor_check_p2m() but with better patch 
description:

https://lore.kernel.org/xen-devel/01767c3f98a88999d4b8ed3ae742ad66a0921ba3.1715761386.git.Sergiy_Kibrik@epam.com/

would that be acceptable ?

   -Sergiy

