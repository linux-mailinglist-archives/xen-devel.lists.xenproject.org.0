Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA8E8C3D18
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 10:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720742.1123650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Qye-0002aP-Hl; Mon, 13 May 2024 08:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720742.1123650; Mon, 13 May 2024 08:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Qye-0002Yt-Do; Mon, 13 May 2024 08:24:08 +0000
Received: by outflank-mailman (input) for mailman id 720742;
 Mon, 13 May 2024 08:24:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNkj=MQ=epam.com=prvs=1863cc35df=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1s6Qyc-0002Yl-86
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 08:24:06 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 282e210f-1102-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 10:24:04 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44D7jQRZ003252;
 Mon, 13 May 2024 08:23:54 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3y21neveyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 08:23:54 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by GV1PR03MB9871.eurprd03.prod.outlook.com (2603:10a6:150:89::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 13 May
 2024 08:23:50 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%5]) with mapi id 15.20.7587.015; Mon, 13 May 2024
 08:23:50 +0000
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
X-Inumbo-ID: 282e210f-1102-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9Kbs2Y6VmuCgB0Uq1WmxyJy//nTW4sS07dczJHoT5Ec5psaAa44xj22OaCmJ8pMiZdxhLNww0d/YbQ49mMWeMcVGcoMRXotRGg3a2/fORai64Flat5XcMs3F+ru+FSYZBbo9SyCd1eE1EknzJ9txBOpQpRO9wNf2eEfsIwuPFTKfMZ2OhSGpzMVZldKfaCEZDTMz6qH7cgYTeYYStbMTi9yc19s5uIshpWd5CXyJXMTZ1/EkcKYSe+XF6CvqOxL4F1PWI+5icietUbGhOPrNI30W+HbRbjQEkcxrHPunNw/CHn8nPctVMsKVTNZrGO5yvXseh77lEEu5ODaXHXtRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEULfpCmMCJg0XTKwtUmzCcb2/gt8CF9ru/uB20YN4Q=;
 b=PlrtcsfBF72ckJFhZ5amE8frDual9Xylz+XSMzZZd06ykrwVpMmFqe7TvAZ849oTYPapWzThdbYuala6hS+pm1sZ1zscbN+Cl/Ihl/H36GVJtgeSAmPpbMOukaNi3zhXfZ7me7XMcAA8Hz4DKi5HzfVFHrFLiA9FziORC5H4DAKu2rYbc3a8c94N1Ap0wiafxJW5yW5wYJeWu3RFNQViGFx32OwS9lrz/K0cPVTBj8k34T4acBNKcRBYXPtC3P6YSj9y8kXIza5vVSy28Yj8RufiglIAdZyySw0t0+0beSk7X6OOYAXfPRE2dpLCrq3lrbksd8a+bUWUV0rW0/4x4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEULfpCmMCJg0XTKwtUmzCcb2/gt8CF9ru/uB20YN4Q=;
 b=iznXe32d2GCGfVBt6+Kwmz6GhTUVe0QzHsLQ2Fo/hF69SwUkKJiQTRsp5CEs9m1paTCETC1bzfnxnnSrpcAHJSpx7wiEwJkvc6BYnhwrQhQkn4JcJ2Drr8B3OKqTIkf91xorb0zejk3kTdmAa5tBG1yVK1oJDCu4qP886uIoiRjhuesI1eiblLaV5VBpJa2D/I4t/fH9bg5MPf8KybUYbHyPOBECDdUli0tn4+y5WiqpZSr6bx3DrfvqDKP652v4kzTZhNazadsnueAim38K0J1M2QWTxJEH+ucQbxbPRwCRE0gQ4fsOIUCIk2OScGXEJHzOhj1bNCjzi3tcnl7quQ==
Message-ID: <f1ec85fb-a418-471c-8dc2-6321cd94d7e3@epam.com>
Date: Mon, 13 May 2024 11:23:48 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/5] x86/intel: move vmce_has_lmce() routine to
 header
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
 <e759fc187f2e3f23f42666b2a8461ae851591d50.1714640459.git.Sergiy_Kibrik@epam.com>
 <12d7600c-ccfa-430c-9c62-a2402b9620b8@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <12d7600c-ccfa-430c-9c62-a2402b9620b8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::25) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|GV1PR03MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: 28894c40-ab8b-4a33-cb77-08dc7326049f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SEJSd3dMRnB5ZDUxdWI2SHl5NGl5aE03ekZPaWxkdHRrNXk4M1FJV0hlbmp2?=
 =?utf-8?B?ZmpEMnJzRUt2YUxTYXZPU0lUMFpaZS8wZG1lOTVJZWx6Rkx1V0pXV2MvRWxu?=
 =?utf-8?B?c0dJTGxlK2s4SGRQdmgwelZXTnJoSTBYcldWd3pmNDBYRDhXc252NnY1UHIy?=
 =?utf-8?B?WW1YSVcrSSs1M2F2QThGdnAvdHZGY1EwZXY4V0Z5Z0dnTW0vYkdndUhHRDUr?=
 =?utf-8?B?L0JabE1QUnFXbmpoaEZxUGJMV3YyMFJhdlFFemNpRlI4V2FkV3VYN3BxOXN4?=
 =?utf-8?B?dnVORlMwUFQwbTFLNUJ4d21kSjVBY0w1WklHVC9LQ2IvWHNCd0dUSnp6NnE1?=
 =?utf-8?B?dEJUcm1sRWVVb3Ezc2pwZnk0algxMHdGUFh2K2toNlkyR1JZYjRkYzRoTmUw?=
 =?utf-8?B?T21KbUx2OGJLZ2c5b1p5bEdzY1VocnJuSTA1SVQwZVRER3ZQYXdrNVlyVURZ?=
 =?utf-8?B?ZFY5LzVCRkpCMjVOUUQwRTRBbU56VnJyeVArenRSeXdjYVJQeXBjSHdPOTBt?=
 =?utf-8?B?Y0x3bENZK3UvL0FLS1dRMTc4cVpVUlBlaHFqRUNaUS9CZjFqYWZWNXAvK3oz?=
 =?utf-8?B?VTBiMGp5UUFlUFJrcG9sbDZCTENtSTdMclEycEVlcUxFN0w1QTJYb2g5VklD?=
 =?utf-8?B?empwMnA3RDlUOTNzczRkaHJSVkt5VUlxSktmTFlseE8vbTV2VzhDWVdrSUZD?=
 =?utf-8?B?L2tWNVpPU0FJenpQRDlVK1ZHRitrZXdScUtxTmZTcFNVL2NuUlN2WDJHa3JZ?=
 =?utf-8?B?dGtxQUpRRDVDTkhnNU5TSlYvTUFDUFY4cHBXZm0yN1l2SjJQRFltcWhod01J?=
 =?utf-8?B?Q0FMZ21qN3gzY1ZLL0YrdXJrTStQeTVFOEo2TkRRUTg3cm8zQlpNRFN2ODZw?=
 =?utf-8?B?UE9vbFYvalVQZHN3ZHdSSFMyK3d4TEN4K0FSZ21Odk0xdVVxSy9HNzF4M1Bp?=
 =?utf-8?B?R09Xa0xKYWJlRHBHM0RQb3NYWWtNMlhOMlhVMEZBWElyQlRMeHFyNld2VFlE?=
 =?utf-8?B?eEVCWTZCRnp3T1JkeThNZUtGQjlPYk8zWC9teElDdzV4UXFMRFVDWmpZblZj?=
 =?utf-8?B?cnNzTWtKYldLbHlOeFZHeEI4OCt2STlocnN6N2xxZmlsblRIa1d4VmNHa1h2?=
 =?utf-8?B?ZlBoUVdQc0pJTzdMWjlDSy8xTFlmOVlCR09RWEhJWGlZUk02Wis0bHJLcDFJ?=
 =?utf-8?B?b25BTUNvS0pxZTVpMHRwZnRlUTdUV2VLSHZEMmZ6cks2S1ZEREFwYy8zd3BH?=
 =?utf-8?B?V0ZmODBNWnhiT3M0b0lPb1lBbjF6NlFZNzM0U2lvd3kvbDlvM3hjL0NFYmpQ?=
 =?utf-8?B?ajVFUnpXMXZxTk9kMUd0YW45cGw1U1E2NC8yVDN5cjRrMHZqNy9EbUVVVzdI?=
 =?utf-8?B?cURrTmNEeEpwMldBVklNTDh0cDBzT0l0YlV2Z1hrNklUc0pMVXNONXVzdnlZ?=
 =?utf-8?B?aTdxdFhBZWtBYkZkMGVNNm14dzRTalQ0K0xGSWFJYjMwelVycHBhZFJuQnlS?=
 =?utf-8?B?MkdOK053MEhJeUdaTTIzMml5bUp5MHRPMmxicVVaanplMDd4TWtCWDJGRHlo?=
 =?utf-8?B?eS90MzExdStid3hsQzNIb0VzM2J2b2w5TTRYaDFJbER6d3dJbzZKZWZBMDJk?=
 =?utf-8?B?alI1ZjZwRG45S3V6WTN1YjQ1YVF3Q09TaUY2dWJWakw4T01ONVk0UTdtVzBN?=
 =?utf-8?B?ZWVkVEVzMW9QY0d2c3FzbUFvUytHenNmM2U0WmE4WlgyV21pTUJHS2Z3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RTZ2Ty9lcXlnNHEvQWNVZ0hDcktNeklUUEFTcCs3emZTczRNUUtYUkpRZ216?=
 =?utf-8?B?TmtseGk1dTdnVnNLMDl0U1dRcmh4Sm9yT0FCOHd6NHZwMUlHZFdKM3BMMHlO?=
 =?utf-8?B?ZWFuWmlrVGl4TFM4STZCTnhONThCcFZYbjZFcEN1Z0RUcG44NHhxcnpjVWY0?=
 =?utf-8?B?cmozdVA0NlZ1WUU1czVyeGNlbDdTSHBQZmRxSE1XZmVxeU1NOVRDZVp2ZDMw?=
 =?utf-8?B?UkNtN0Z2Tk0xZWRkQ2NKRGg4dGtubDdEUE12aDhWSTAxc3ZjNUtYZlZCT3F6?=
 =?utf-8?B?S1JkK2VTb2JoN1UzZSt2dFZSSm9mN3JOckNKU25HQ3puc2hlRFhGOC80UlBK?=
 =?utf-8?B?U1JKY0M5bXVrL1NrMU41UDU4RjJqSUUxZzNIcW0rYmZjMEg2VUpLeVl4dTBz?=
 =?utf-8?B?eVpDVHpnbDV2L3JtQUZQTkhIVmNXbm5hR0ZZMTlBSmtzU2JvSHl2dnk4LzJx?=
 =?utf-8?B?VUNvVWcwM3h5Z3dHa2NnOGZFNjEwZmFqSU1sMy9HWjIyZXRGZ2t2VU4vR0Jl?=
 =?utf-8?B?amFlYWNBMUhaeEpvSkZIM0tnbzNJcEdLWTB6UnR4ZWxTeGUvODU4WU5tSXpL?=
 =?utf-8?B?TkdVeWpPcnVIb0gvM3prVGZPTTR0LzUweml5QWtVLzdodVMzcHh1cUswcnFK?=
 =?utf-8?B?clZWRDdLRG4zaHArZzF0bFhJN0REZDQ4YkJ1QWhPbUNvek9EQzhtOHBNNFR1?=
 =?utf-8?B?c1Jma0xjbllXajJMT1cvNGtmZ2MrODNoamp5SnNzK29tc1JVQ3YxUGVwTWNy?=
 =?utf-8?B?SVU2Um4zY2ZJdFBIK3dJMXgwQ2M2ekp6K0lQdG9hNm5USFg1WVd3Z0pzS1I2?=
 =?utf-8?B?WVhncFdXQ3JzdmpYckVsbk5XVmJPZWk2aktwRG9PM3NWRXNvUnJra0JEcUtl?=
 =?utf-8?B?WXFOSUloZisyZ0NyQkFtTWZWZ1A5ZVJlTi9lalpwRlg0RVFoTVMwRmVUU1A3?=
 =?utf-8?B?WUx2d0NMU1ZaMzBpemZBTVVaMzk2aHB1TmVpYWFqUDlpSEJqWHNkZUl2NUpR?=
 =?utf-8?B?bUtZZmRkMHNkWVlZM0p5N3gxYklrQkhleExucDEzUzM1cURvU2FiUEJLRENu?=
 =?utf-8?B?cVRRRlg0aXZXMUJRemJOdVd3T3hIeWpDTzN4Z2tPRXdhdXJITjVCbnRmU1E2?=
 =?utf-8?B?SllxMWlrd1p3a2ZVdS9WdEdxbXc2OWY1ZUs1dnlMM2M3L0toYjR2TXJLRExD?=
 =?utf-8?B?b2dNdlNnV1l2QkVBeDdlalZMZnEwRDMxbWFrRVAxejlpQ2tLTlF6ZmVWbFFk?=
 =?utf-8?B?SG9mQUgreXh2MVRXU2R5VFRkQ05FUHVKMDdyNXRKYnUrZzJNS0oyU2pWbHdM?=
 =?utf-8?B?cVBlZ3dLL2xmblRsMmlzQUJXdFg1eHdDZzdOZFBuaGszS1lzSXhHd3pHWG8z?=
 =?utf-8?B?TFk3NCtpVG9ML3NnY3Bob1NzU0ZOMmJZUTBRYXJ1emN1U0N5SCttNEh0NXpT?=
 =?utf-8?B?TEpVd0lnM1VxcEV2bjRNOHNBSStGcG5tMGJOalVrMU5abVRxMFV4NG5Pd09w?=
 =?utf-8?B?eU9KOTA4bFhMcnEyWnlJQjcyMXBmRUlWSkk1bmNUaHMzZXhuMlRZZjZUc3hM?=
 =?utf-8?B?cXNUaENwUU94NWFvVGVxWEpTbGZ2VzJFdzVVSUtEMzg5ai8waG9kcHZJY3ox?=
 =?utf-8?B?ZlZGZ2dwVEpNckdjNEpGaDNIdGZVaHh6VE4vWVB0SGFkRzNOZERVMUJFRnpu?=
 =?utf-8?B?MkV5ejJZQU5IaDQ4WmdpTU9tald4RTZHaHQ4dnhsU0FnN2w5R3VnUkwvVkxP?=
 =?utf-8?B?Tkk2NHEvU0VIQ25yN0hSZW0zMGM2L3MvRTV3T2dCc1JFUE55Z3o1NFRRaG5q?=
 =?utf-8?B?Vi94VWF6STJBTHV1cU1WT3I4TEZacUQzcW12L0NYSWRBbUtNblNycWw4dG42?=
 =?utf-8?B?TUVNNWFDZ1pwSmJIMVJrdUNhSE01L2xHRjV4R2IrdzY0bFNQajlTcUNtaXhV?=
 =?utf-8?B?VzAwSGFycUsyUUZyTTVBcXZQSmplMUQrNzcyRXdnWTRNb2JrTHB4YUJ2bnlH?=
 =?utf-8?B?WlcrTUlmbFM5ei9DWmJqQkV2TmZSdFNVeWFoNXZZR3N3Q25ZdXZHTzJQVUxL?=
 =?utf-8?B?WXorRVdTOFcwcit2OFBLR2lReUE0VVBLOHBFK2dEUDVYbXdDRWgvanZXNDJV?=
 =?utf-8?B?ZkowVjluMDNZNXdCUjZOMFdyeXIxcDkyZTI4bzJudmZQNlpNYUgwT0xCNmNL?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28894c40-ab8b-4a33-cb77-08dc7326049f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 08:23:50.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tL9HAZpvDwCg14+IodsfXGrDfQQOOolQ/4ahkZZ5dPrDrgf/YuzrF5MfA7SIXUYAyxiiy8g8FjFWodaPIKwNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB9871
X-Proofpoint-GUID: 5QQ1J6aVwzro1-bxjw-54KRrWOR7K49j
X-Proofpoint-ORIG-GUID: 5QQ1J6aVwzro1-bxjw-54KRrWOR7K49j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_05,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130051

06.05.24 14:18, Jan Beulich:
> On 02.05.2024 11:14, Sergiy Kibrik wrote:
>> Moving this function out of mce_intel.c would make it possible to disable
>> build of Intel MCE code later on, because the function gets called from
>> common x86 code.
>>
>> Add internal check for CONFIG_INTEL option, as MCG_LMCE_P bit is currently
>> specific to Intel CPUs only.
> My previously voiced concern regarding this was not addressed. If ...

I misunderstood you comment to v1 patch.
I'll drop checks for CONFIG_INTEL, I see now that we don't really need one.

   -Sergiy

