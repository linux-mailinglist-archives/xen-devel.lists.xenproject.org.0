Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A309947A54
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 13:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772046.1182483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1savme-0008Db-IX; Mon, 05 Aug 2024 11:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772046.1182483; Mon, 05 Aug 2024 11:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1savme-0008C7-Fj; Mon, 05 Aug 2024 11:21:48 +0000
Received: by outflank-mailman (input) for mailman id 772046;
 Mon, 05 Aug 2024 11:21:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CTh2=PE=epam.com=prvs=4947b23bd1=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1savmc-0008C1-Iw
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 11:21:46 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e54b650c-531c-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 13:21:45 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475ALPhb008784;
 Mon, 5 Aug 2024 11:21:41 GMT
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazlp17013009.outbound.protection.outlook.com [40.93.64.9])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 40tr2493gv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Aug 2024 11:21:41 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS8PR03MB9984.eurprd03.prod.outlook.com (2603:10a6:20b:630::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 11:21:38 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 11:21:38 +0000
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
X-Inumbo-ID: e54b650c-531c-11ef-bc03-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjqQ7aot27l3dJjKdXMiJjkc1tSuO2BZybsGqUeDzWvr+c5LPhKkihZslLuQU35+R2ZhUvVfo8Sa7/SfDqYUMO1ahdOjlCrbB/p6E7hKLAd4/CGJtY5A2jK5yYFM1VXlY8Pg8yE0OH4TIJcR+L97d+yxmpEF8EwPmbmZxWQzCZqeAURB2mKdSHCSqyiKJe12FTlP9Qob1o/SRg1mASm8sKesJ09QP4rlLw/TNzFTghGsyI1tpBNdUjCWjPiBFeqjBGrSMVw0h0aDdHTeAM1589/PxMUEYJF84n8JehtzEJA2TiOQ70vm3hx9yeiIFPYkbPnZomDMS3ECGoOI2TNqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQGh/N2W0lmiqf6q1V5qC0271Vixl035rbiqXEuqGYU=;
 b=Gn3giWeoErbwCd3CLDnh9L6d6pylx19L9+Vyn93dw2QbpvpBxBjc+l3478i/efmIGZgDzgULHIn6PkFHIb51H7sC3rQ1Mo77PoGAo0zNIJhzKjLUETjstpRm/EEP4dzgRl8loZ8w7A1f9FcWV45AAdtqllRoG+UbZnaydp5weBxttzkRznhRq5Sg2/uKzqe2mm73Tb+qquMET7wB7YAoEIyUzD7RNBwCZr8PXkPYX2Xvs+agZ/+i2gZ5JggI/B09rWtbZTLs5gY0G5iVp3YWtU2gMiHm9lpjdKIe3Gf/QuFV8Qd6CJbOgOMdCdGYswO00yzs0UBYYzwzBJ0NpU5L+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQGh/N2W0lmiqf6q1V5qC0271Vixl035rbiqXEuqGYU=;
 b=BES5vjDnmvaIjitfR2GNw7O2iA3g/0LZ0/OHglKQZIrl7ky84Llfle4cXgev9xtooyjxJ0g5KiMifZx7O+js+0xGnIJ9VV6bTVnMxO5ddEr920Y4RF4yAdAKIP30msQ7VAP1V64opb0Y9EYuGPRMQmNu8GgtTXerSzxVQNwCqyMvLIJHsvLANaY6uGccemfCnEjmF8HW/CEe+N0IiV0i5HrJ4CZRyB5iDBcIwgRPmdJChKARQQ+wcAvj2nNGbMwZ8YgcFyVmjguAocQ9uLuWc5Hl692vGABd2FxTjQmQ/qWwNDfPiHY4DNCB0+NU3fO0IsG8UA4lgkMKbaNvWYUNcw==
Message-ID: <32ebe9ac-a9d6-49a3-937e-468d7f2d3ddb@epam.com>
Date: Mon, 5 Aug 2024 14:21:36 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 10/13] x86/vpmu: guard calls to vmx/svm functions
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        xen-devel@lists.xenproject.org
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
 <fda81012adec8c4993acd83076f1a46f2d71d668.1722333634.git.Sergiy_Kibrik@epam.com>
 <1494c80d-9056-4922-a5e1-33cfdb1e41cf@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <1494c80d-9056-4922-a5e1-33cfdb1e41cf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::11) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS8PR03MB9984:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb0f67d-5492-47c1-ba2e-08dcb540c5de
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTJXeTRzc0tsT1d6ZzFTMTVKL0xVRVh1VTZkWm5SejQxMUxZOUVUQTc4MW9T?=
 =?utf-8?B?UzhWWTdwblhXem1sUHFINlY1Zm5aNVAwY0FxR2ZOeHUwMUxDWjJEZDVIbG8z?=
 =?utf-8?B?UUlqbjJQVkFBL3FqeTB1S0ZsVldUdmlaSTJHeE1YcGVRMHNQU0pLaTNuWWNw?=
 =?utf-8?B?bmdsS3VNR0FZOHFtVmtHTlU5OGFnUno5ei9USTBaOE80aFVDTjBHcStYeGM5?=
 =?utf-8?B?cEsrdllRWW8wQ1d3dHFBZGo3YVNqMVE1c0tlNVlLckU5OGdONW43RG56eEx6?=
 =?utf-8?B?TDltS2FiMERxSjY4LzFudi9wWEl1YXpUc0NzUUxObzVGdW92bituamVnMVdX?=
 =?utf-8?B?MG9ORjdzUDlqcy9CcWVTL3dLZWsvNVN0T2N4Wk03UlJSU3pwOVZNN2t0Ync5?=
 =?utf-8?B?OXVLZUtBdkMzeU9JQjFkaDhLUU5WdUViYkpSbFZUVTJLRW1SSFJFN2tURFlu?=
 =?utf-8?B?alQzdE9mOHdzaVF5czBZWGxNdi9TNHhVYVVKakxuWGJDazc0SXJJRlY0TUxD?=
 =?utf-8?B?ZlpNR05GU3pCV2c5enE3ZVJDdWdDRzNaZ09RL3o3b3I1UnpBbE5KSWVMWmRQ?=
 =?utf-8?B?SmJPZXZQemdBOVY5Z1F6MlI2aXhjWnlBT2g4cHdjNmRkdXlPcFZSNEVFRHND?=
 =?utf-8?B?N1JKSnFGWW13MTlNb2szbGRzVzFGTEhWYkN2TUdpWnF2R3A5ZStDRmg2U1pX?=
 =?utf-8?B?dk91MTlQWEF4b1ljSGlUUFhGN2d4ck1tc1Vjc2plMTBBZURaaGVteWpCRFpl?=
 =?utf-8?B?NHd1dFZCMTY0NDhGZDUvWEVzTS83OG9selAydHE2aC96YWx6c0NMcTg3dU5N?=
 =?utf-8?B?VTJ3RHpYUVBUdy9yTzdGNm00bzRwdlYva1dkcnN5NGhnbUw1Nkk5REE1ZEJT?=
 =?utf-8?B?ckl1KzFaMDBFSEY2ZnQ1WFl1a2tZVmpzMXB6NitjWEhoQkRTT1RpQ3ZGYTIy?=
 =?utf-8?B?N1VpbzZxSUZlY2pyU1ZxbEFkT3pMMkFHWS94MGZESFBVblFDWHY3VTJTNlJr?=
 =?utf-8?B?RlJlMnNlYjl5T1hxK3VoTENWWUVad1FMZTFabFptWldSTkhsbEdRVm56MXRp?=
 =?utf-8?B?QjZZMFo3Vk5lR0xIancyeklEckFQcmw3ZlhoYWVNUkMrVnpJSHZFZ01oWjBz?=
 =?utf-8?B?L0RYQVRidk1sNzg2R0RxcWh4WXNBU1IzZ3JhYU4rUzZrVmFHaUp3dHIvVllj?=
 =?utf-8?B?UUp5RHFFNCtkSU9aWTg0Q0JIN2ZVM2l2Q1pIb0Y5eldjQ3RXSjdaS1FEWjEr?=
 =?utf-8?B?bEt5Q2hTR0t6N3pZTUFjaVZHY3dmeEhzUFEvY2pEQ0t3SG9NS2tYVVdaUWVH?=
 =?utf-8?B?VlJZR09yVkRacEhFOVF1MkZ3TktXNG5YaFZ5ZzhrdGVaNTZQbEJCc25kUXpE?=
 =?utf-8?B?bzNKbnE5cmNXYit3cVlxUC9Vc0VXbWhNeDEwaGRpaTk4bzBpWXB5RXlKSU1K?=
 =?utf-8?B?aFo3RUdUaXZXaDVuVjZ0V09SdjZ1c25KbmV2Q2pMaEhlN1k4NzNGckg2aVBo?=
 =?utf-8?B?Y2h0RWx2NVBaZVBDME9KSGY3VnVCb1hsL2hwU2hEVlZmd3htTCtZYUJYbzEr?=
 =?utf-8?B?RVp0eXBvaVBwbzBKN2dyZnVyZ2dGQXRGdmdOaE1zZEJzZUVwZUNCU04vRmho?=
 =?utf-8?B?VXdaTFJOSU1peEdoU1FQcHk0R2NyRzIrWS8vT0ttLzBtZGpzL1gvVWE2aWhD?=
 =?utf-8?B?YWlmOWRxR3VHTGZ4RWdkUnZyd1h5T3dpWk5ucERnK0owRHVvZXNYTVhhZWdY?=
 =?utf-8?B?TnRBaCs4SHk1WU1sSlhDWGNsa2ZHWFFLa25ONEpJT3Y5ak5idEltTSt2RVJX?=
 =?utf-8?B?TUpqN283aW5qS0tiVWcxZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVNFLzFlazBubEwrMWxwcWMwT3VxTDZvWVFFN25yN1NjSDFUVHAvY2dVSm8x?=
 =?utf-8?B?ekNhYlgzZFBITjgvakR6TDhJRnZXTkpnNG93dE9aMnlWSkt4UlpKYlE1c3BF?=
 =?utf-8?B?NkpqUTZyMitObmNUendkNVc0TklqU2R5UmVGUU5HZ3lpQlVObDRsbko5SVdN?=
 =?utf-8?B?VGFsa0xwQURBd2pWSytTQUFKMVh0T3RXdm56SFQxNVloaGIyS0o1cU1WS1Jv?=
 =?utf-8?B?NHRNRkc0VXNxeUhVR28xVk54bDdKclBMVUh5K214cFNSTUtIcG5ieXJISmJF?=
 =?utf-8?B?RU9UcU02QmZyM2VlbTRCZ1E5QXgwMU5sZW01cm5tT1hwaTJ0ZDNrVFdKajBX?=
 =?utf-8?B?NlBHRlNhbXNxNzU2TTg3cXVSTGJab2RkSFpPWmE4R29halNxMWwrQ05scnFI?=
 =?utf-8?B?RytOSDVnTWtwUXlCM2d2aWhpS0oxY3VyL0pvdFQ0Q0NueVhpTW92VTV2OEF0?=
 =?utf-8?B?ZkRhNFYrUjBmTkp4a0JoRHBHRjlQYUZZT0o2cXRtN1pmRkQ2UlhYK2QrRzZj?=
 =?utf-8?B?dTUyTyt0TXI3U1lDSE1GYllpdG15RzdiQU5DV0NUNUZ3UU1FUGhRQUNJOG1t?=
 =?utf-8?B?bFpDejZiNlpja1QxcFZwRTNuMytIdWY2dmI3cGR4QkxlUnIyaFdzWDRjUmUr?=
 =?utf-8?B?SU15U1lRN0ZaYW44STVxTVl3Vm83SE9ON20yN3ZUZ1N5VkdxTHZXRStSSWRH?=
 =?utf-8?B?UnJ4VkdEalFuNkFqT0hHTXQ5MDRtbDJoZUJTQjNuYkh2TG9zNTI3YlY5TGRJ?=
 =?utf-8?B?YWlmQjJ2ZUNOUE9LTGpNdlYrQTRIQXcvS28welJNelhBZXhoUkZ5TnRuUFZU?=
 =?utf-8?B?dEJPckF1RWN5blkzOHBOK0V0Z21PcUpRVnJVTXhRZUp6NGl2UjRONlQ2Q3FF?=
 =?utf-8?B?a1NaSXJESTJRdXVvV0liWkJDSUszNEVkKzdRdnBtY3E1T3Vmb0EwUVpnNVVk?=
 =?utf-8?B?UDFvN1VEbDNvTEt1Z05kUFYwOWdLUVdFNlhHMEpKOEFFRTR0THBNZUt4TkRY?=
 =?utf-8?B?VzlNNGwwbitUWWhEMzRNclpJVWJWeUg3OGZRVEc1SjJQdEhXdHAxMUlBV3pu?=
 =?utf-8?B?VmhJZVRaQnFJcXFxeHZrM1RyNm9YTkxjb1JMVVRmaDM0bEJKM3l5V0dXRDBa?=
 =?utf-8?B?MjFxclhMdHRzS2VwSlJkYkMyb3hkdENoTDVoTDZJaHo4cythZ0lValRiYWZ3?=
 =?utf-8?B?QkZaM0ZKL1EyRzR0ZCtWTnowYmYwc2w0OHZDZ21ZUTRGUmN0YXNRc0htZ0hE?=
 =?utf-8?B?ZFF2ZHpqc3pUWk8ra2VKc0hOQTdHN2ZncTVoOVRmTWZLcVpVdEdiT3hySUlQ?=
 =?utf-8?B?SkVtdDhuVEkweVpnUGtxdW1SUFRyby9WcHovNnB1aVFxendjN2ZvRDZpUXNQ?=
 =?utf-8?B?WDZWNzlrQzhkZUJxRUVTWElEcWw2SytHdktmYUFra3Bqck1hNzFBL3d4N0ZO?=
 =?utf-8?B?ZGIyVHQzVGpJTFJ5SFdoa2lvakVoN2IyQWRuM29QT3dDaXVLbHhaM0VTdUg2?=
 =?utf-8?B?dUZUWUN3Y3d4ejZrR2thSVJFSEg2ZURIUG5CSldKcGVrakVVY3hva20vaHA0?=
 =?utf-8?B?YnlXaCtUVjVJN0E2R2wrZU5NQnJmcEZjbE43SlVVSHhIOHVTNkl0MHJ1bTRu?=
 =?utf-8?B?dFRyL2cvdUJMN0hybUJ2ajhzMnlFRExRbTUxUnJSUDJDaXlsZUZxR1NFaCtw?=
 =?utf-8?B?Q09VbGY0T3hlSFZEK0VMNXpPQTBkWldwREFnbktPS05IQ1grRG1jeGF0Qlox?=
 =?utf-8?B?MG5ublNJRnN4M0QvQVFobGFWY0lkZDFNVW83Q0dhQVNpNkNRZTRFdGNFRUJH?=
 =?utf-8?B?UTFlRlZPWitMWHl4aWtHVWhQTW91UkphVTY4a1A4Yms3dDBxdStCeUdoNFUw?=
 =?utf-8?B?RWprK1o5Q3VuMTgySnZmSmFLcVphZHhqZ2t1aUtsb3R4UjlCeEdxK1VBVzQ3?=
 =?utf-8?B?ZFc2NnJaVkNrWjBybGZwSjlqcnFJQWVPTjUxWmNIMng2Y1VxUmphejFFVE5V?=
 =?utf-8?B?SWRYdW5VdDhoblZ2TUdmQnlYTlRMQU9EN2pYRGxxdENzQUZLQTN2dWJxbWc4?=
 =?utf-8?B?VDMvcGZUUFQzTGF1cnFjd0hJaW5JbW1TdDdyRXBxUW5adk5OcFpqeGo5T3hu?=
 =?utf-8?Q?edymSb9jvs3tWxoGWXKPoAck5?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb0f67d-5492-47c1-ba2e-08dcb540c5de
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 11:21:38.3423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtWA2w4Qh3TFB/SNmElcLDpz7wvxTJW0SWUXZxsvk2x4izTuzSQ1uioLTFoSoIW0AbmhkJ32zourhu2TooaRmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9984
X-Proofpoint-ORIG-GUID: fsftyIa1HtjalZcxnwoPmrmwCtOpIaFW
X-Proofpoint-GUID: fsftyIa1HtjalZcxnwoPmrmwCtOpIaFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-04_14,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=964
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050081

31.07.24 15:29, Jan Beulich:
>> @@ -326,14 +328,14 @@ static inline void __core2_vpmu_load(struct vcpu *v)
>>       if ( vpmu_is_set(vcpu_vpmu(v), VPMU_CPU_HAS_DS) )
>>           wrmsrl(MSR_IA32_DS_AREA, core2_vpmu_cxt->ds_area);
>>   
>> -    if ( !is_hvm_vcpu(v) )
>> +    if ( !is_vmx_vcpu(v) )
>>       {
>>           wrmsrl(MSR_CORE_PERF_GLOBAL_OVF_CTRL, core2_vpmu_cxt->global_ovf_ctrl);
>>           core2_vpmu_cxt->global_ovf_ctrl = 0;
>>           wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, core2_vpmu_cxt->global_ctrl);
>>       }
>>       /* Restore MSR from context when used with a fork */
>> -    else if ( mem_sharing_is_fork(v->domain) )
>> +    else if ( is_vmx_vcpu(v) && mem_sharing_is_fork(v->domain) )
>>           vmx_write_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
>>                               core2_vpmu_cxt->global_ctrl);
>>   }
> Same here. With those dropped (I could do so while committing, as long as you
> agree):
> Reviewed-by: Jan Beulich<jbeulich@suse.com>

oops, these are leftovers from prev. patch versions, not needed anymore ofc.
As there'll be v6 of this patch series I'll fix it then.

   -Sergiy

