Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F1C8A97B7
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 12:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708210.1106879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPJ5-0008E6-Qu; Thu, 18 Apr 2024 10:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708210.1106879; Thu, 18 Apr 2024 10:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPJ5-0008BK-Mw; Thu, 18 Apr 2024 10:47:55 +0000
Received: by outflank-mailman (input) for mailman id 708210;
 Thu, 18 Apr 2024 10:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9OU+=LX=epam.com=prvs=083815c34c=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1rxPJ4-0008BE-4Q
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 10:47:54 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b053ca2-fd71-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 12:47:53 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43I6XnsN014335; Thu, 18 Apr 2024 10:47:43 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3xjnq72407-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Apr 2024 10:47:43 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DB3PR0302MB9064.eurprd03.prod.outlook.com (2603:10a6:10:428::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Thu, 18 Apr
 2024 10:47:40 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7452.049; Thu, 18 Apr 2024
 10:47:40 +0000
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
X-Inumbo-ID: 1b053ca2-fd71-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yi4ysmQqyxJWCQZYSWswvWq1c9tl+xndqDFJF1RTmVEZEc1gLaIyJ47EPyLAKHlyEgO6UfNsj19xE3C5u0aBbWua5dFGTY9L/EboNJeyUM8lyae1FSmU9+Pbf+YMl3ASFWc+bJUxKoznMirkO9hv7X1fJg+Tv5VdG/XlpzdpInWdvxDoTA06hZgGnSeJanq9i03H2265q4zjyu/fRntt+edyAjFX71BQsADdOvg2l2JnJRc1gbBuFIisAq7mkOn/1yq5o6BIMmcSL40A2bbkQG2Vw2LaZ1WgM1TlbF8qiB1XBbYJEURV0QF6vuCIxcruNJuDzGQTPyl291L9ZaR0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDk5kIw2oYsCMB0+djCuWaLw+tKH6hMN4lLH0Oxfk/w=;
 b=KLvzFAw+/JZR96JGWdAy99s7dbN8Bz0G8fvBO+2ZN7ieGHR4Apigdk/w0zH6jIMp+TYUbbRiG7oa8KbyB9/s1fW/RmP8yqtQ4mR8bTfUlD0Qau+TH+QmmbmirMssRbC1ZIKlBfG5ocTttRCY2nUxWZEIIr66x/2r7rE87QPjVvJdBkVqXr65o1uknyP/J2EKgCwIvhF3WU7orGijewXVH86ZCz+60ReWUX/8y/k0FX1o3RuT12YtSP5dn9YuIcUypQF0J3qKGMhJPXjSWHHC76VDno1ETnoDqrMIpD0Y/Z1bz70OKOWnPW6q8z8Cjx/QaT0IQk7K/ddMQPgDNfWZbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDk5kIw2oYsCMB0+djCuWaLw+tKH6hMN4lLH0Oxfk/w=;
 b=sKU+LC2F4e7bb8MXS0iX6ajdXQwSpR6AeKQNNVjikxPRWtDwJSZGLg20QQgAbS55Kvl/+zL08wxuJTxoeud1b9U0xmNcZwmDdxeL/g+6AtMzcU9Nwf+PQlKViL6qijTyctimtRKNAzpBNv4re1ld+NIsGN6ZulTebllZm+xc9hG+yyLh9leFSTMUX/diMI0ySlkkNDIikVebheijaLzOOKIDtfZQaGnuF4qApcd3hqKxm4pEo447HarJhyLRvZdGaVKx5qq0GeRp8LWcatXcL6jbVCA8wUE6FLpV+NgHZClwKSM8LnTw2wylBFlIgl5Y0y2E3mST9VdLq7HQr0Z9sg==
Message-ID: <5b365a50-cfae-4b2a-9a9b-d4899d6feab6@epam.com>
Date: Thu, 18 Apr 2024 13:47:37 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 06/15] x86/p2m: guard altp2m code with CONFIG_VMX
 option
To: Tamas K Lengyel <tamas@tklengyel.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Stefano Stabellini <sstabellini@kernel.org>
References: <20240416063121.3469245-1-Sergiy_Kibrik@epam.com>
 <26950422-3476-4679-8636-405272c279dc@citrix.com>
 <CABfawhnOwWLNe4PPFfdjXViCbUi=gfVZBQs9GH0WcMbDgn5Bfw@mail.gmail.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <CABfawhnOwWLNe4PPFfdjXViCbUi=gfVZBQs9GH0WcMbDgn5Bfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::22) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DB3PR0302MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: ddce05a4-4f28-4aad-076f-08dc5f94f7f0
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZsO8LmbBqsgRbHH0ag1Hj0f6LyDWpktNrHbON95NZP5YTl7AiYdDFJFI03NmgNW+0e0b4oZTfqwM6SBsJd7JIILrmLhs+voaQRNLHSq18D7wqH5ueciy9u9EbjaWe3zCiSREGFXs2rFtjxuCY7J6jbWgtw7PWx8zDiJWbQfM589KxsCF27CRQ6MMYwJUsHFwKvZFNvW+aqMZvAb1z5cwjyZL1JSyNPzPS4lKMxpVPmvadovMwOVXcfyhfbsqWd1qO8FCTrEvFP9WP6Hfw7TVai4hHmAPb8vW5kRgpDSNy+d/0LTeo7Epjm1QJc3OxdG6iFIlBy7twpSaH5pP/OgKztI5wtdBc/PSk5fV0BzUfJaMYG8sB3QqJvg19iWcbDmH/1NWjeHxOku54N9z/5MGMKlprgqROsAgrtcvDBcvq2WaObmvVZsiN3cCExeTeX7mTQQPwWWikzS+UFR47CCKdwYe4UbN5PWDqh//UgGUk3eIywZflziCq3Twz/fuF4iufwK3niIR6wtyJmf3G8jnhx843bYkqBTbQnjFYTOnHx8X2TMhhMFDTTLh+wjLJ13jeJZs/A59DbI5vP1zDjXbGXjO6QAs2cd8HgV1O7zWdgR5kVir4eIOAmG+tv3HwIbOOgOe1CD/rd2/gvcF3LJe9gzpPCwULCk2W8mkSkAxVVw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wmp4bkhDbEh3R3BjN0lSOE0vVmJpRG5aUlNZMlNYNG42cm4wNzBDdndwZDNh?=
 =?utf-8?B?Uy96d1J1RjFmWGRaZFBMTWFSVXBmRTdKNWpHdWNRMWltdWwxYjR3SVhaTmU5?=
 =?utf-8?B?NVlZNGROZFlMcXVZdjhWdFFGaHkrYTBiRjlxM002QnBicHZzUDQ3VDZzNlhR?=
 =?utf-8?B?aUtZUnhQbmw4KzJkR0hFbU5ad2pDM2xybWNnSUpSQTkzanJRbUxCYTBNL2xQ?=
 =?utf-8?B?WVJqdFUycFVrVEN1MWo3RkNISUJ6RGVpRnJmMFA3b2Y3aEtzd2VKRWNkbUNJ?=
 =?utf-8?B?Z1VFUUxQSVZGT1VoVjZJa0RCRGpGcjBVdmpDcHNOb0sySnFxSTB4a3NlK0RD?=
 =?utf-8?B?dEVSZlR1WmQxYU9XeFVYUVdFYk9QSW1ZV0JrV0tNaXJUbjhNWWd5R3BGOWk2?=
 =?utf-8?B?cWl2emREUFcvK1JIbTVFWGxiUXhHZ1NvVHVYTlRkeC9UemNld3JhaUtmcE1m?=
 =?utf-8?B?T3JWQURPZXE2Zlg0aTRVS1ZMQ2hjV0tuY3ZsWnVrNldtYmxpek1WaUMrTEE2?=
 =?utf-8?B?R2pZam9uVElHOWdYVjg4QlBibVBsRHQ4UnE3cnRZaFY5OVU4RFV5eEJyMGVj?=
 =?utf-8?B?cGZuWXIwM3VEcy9ReGJ6Mmx3R2JxY2RRR2RoaXJoRjh2WFJRMnQ0TUpPYVFE?=
 =?utf-8?B?ZitLZjFIMTVoM011TDRmZXRiYjc3d1VSTmd1ZGxndnV2NkNrc1VtVHBTZThL?=
 =?utf-8?B?TC9HMXRYbW5qN0IzbEJVOFZBaVdVNHk2TWRiRUk5YmJzcCtzWktsTEV5Ujkr?=
 =?utf-8?B?d0RiSWhJUzhCR1I5bzY3Z2VvVlp2MkU1a1FjS0xUQ284TW9Zd0hYS21zQStB?=
 =?utf-8?B?TWFlRUtBeDVRTlJ4SU80aUhLTFFaUlB3Mnl2QVFGOHlEK3NoOVpzZVpmUGdw?=
 =?utf-8?B?cmMxdVV0NXRHL0IrS1dic29wOURNdVNwMVFEbnljWlpobVVmV1RhM3Y1cTlV?=
 =?utf-8?B?QVd3amFHS0ZmcCs1NTlGekhPYitlazVBZHBWb1VuUDlkeCtadG1iSTk2VVJN?=
 =?utf-8?B?TDVPeHErZGRFY3pyOC9Ha1lzRGhtRUtsVnBoVWR3bjFqb3Q3YmRkZEUvWldF?=
 =?utf-8?B?NWhXUUxJZ2YrWnpUK2Y2bHg4bnY2RWwyQnRhWTJxZkJxOUlKZlE1M0pWd0Z3?=
 =?utf-8?B?MW9yd2M3WFcxc1cwc0NPdFFvcHBLQTZxRmRjK1VvVmR3TUNBdm1Ic1NnQUov?=
 =?utf-8?B?MEtLRXNESVY4c0FLNGtOeXpjai8xNExLSVlZeDBRQ0lWZmNVejRJenV0WWJX?=
 =?utf-8?B?MzczYVh2WWRMUzhMVUlMMWY0ZGZScVlVOWpLUUFnazRxWXllS3lDUG1TUzZG?=
 =?utf-8?B?ZEM4VEd0eE9WU1Y2TlNrdFZ1OS9iYXNlazNzL0xRRUhoSXZzNHRpbXpBb3h3?=
 =?utf-8?B?cGZaL2p2ZllHNDl2eW02K3MwREZ5aVVUekRQU3JxMlJQaEFzOTFDaDZaUmZG?=
 =?utf-8?B?ZjQvL1lSNXFXYmlsTXhQUVVpdTJoN2ZmMVhJMkhKOTVyNkpVOTREb2c2OTVt?=
 =?utf-8?B?U1pONnZoV2hLeTZvVHlqTkpCaUFIbUNwUGRucUpuUDdWWGRzeGZUbDYvNnd4?=
 =?utf-8?B?Um5idFZuejlYSUgyRDN5alNKT05reUV2YVlYMGV2L21TQ1FEY0gyR3JURXZw?=
 =?utf-8?B?ZHZHWkVCditzemF1VEZHSlNvTHFseldhdDYyc21Ga1JHa1UzdWx0aHZ1S2dj?=
 =?utf-8?B?R0dydEVoRTIxQTB3dXFoNWt0eDlBYWZ6d29NMHJiVGNLaW1NZTBtUmt2ZGs2?=
 =?utf-8?B?eExKWWY1aDQ5L1pyRFZVRnMyUWk0TTc2azVVQURZY25LREVKMHp1c3IvditT?=
 =?utf-8?B?SEhkbkowTTNXV3JxRklRdUZCbWdnWGZ6eE1sN3VyVms5QXRiT1FTeXpHWG0x?=
 =?utf-8?B?bFhtRC9GTlN1UlphRTk0ellsb1hsVHZ3d0p5T1A5cURucEZ4RXRPenVBeURM?=
 =?utf-8?B?S001dTlSQmxwNzdIdm44aU5peGlEeThvNkZPaG5ERW9QUnA1SVI2SHpXV1hX?=
 =?utf-8?B?RW92WWVZc05PNGFtUHAwWHdhck5id240UTRHSUY1UloyNmlPOHVkRHhFdExO?=
 =?utf-8?B?aTh4UTJ4TFBlRGhFRWg3WFNLMjBtR2JyajR4T3orMmpBa1FRQTZJeUZnc0pq?=
 =?utf-8?B?VEFCNk9JeHY2aXUyOWgzRHVTMnF0Yk9sM2RQaHptVnB2NnFwcGVuR1Fmd0Ra?=
 =?utf-8?B?cUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddce05a4-4f28-4aad-076f-08dc5f94f7f0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 10:47:40.1250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YHrvv7uBR3u6DCAR3V6bXQklY/pVzh0zTftRsNl7len6YLN/mQR00W1yOO3MmtN7ASIhD9wPepZ28DwHAHpyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9064
X-Proofpoint-GUID: ZtSusFjPvPBxPoAmbeZpRMlNF7Yb34tz
X-Proofpoint-ORIG-GUID: ZtSusFjPvPBxPoAmbeZpRMlNF7Yb34tz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_08,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 adultscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404180076

16.04.24 20:03, Tamas K Lengyel:
> On Tue, Apr 16, 2024 at 3:29 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 16/04/2024 7:31 am, Sergiy Kibrik wrote:
>>> Instead of using generic CONFIG_HVM option switch to a bit more specific
>>> CONFIG_VMX option for altp2m support, as it depends on VMX. Also guard
>>> altp2m routines, so that it can be disabled completely in the build.
>>>
>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>
>> Altp2m is not VMX-specific.  It's just no-one has wired it up on AMD, or
>> accepted the long-outstanding ARM patchset where it was made to work.
>>
>> If you want to compile it, you probably want CONFIG_ALTP2M.
>>
>> However, it's not even x86 specific.  See the uses in common/monitor.c
> 
> As Andrew said, it is not VMX specific so shouldn't be tied to that.
> Adding a CONFIG_ALTP2M would be OK.
> 
understood. I shall go with CONFIG_ALTP2M option then. Thanks for 
clarification!

   -Sergiy

