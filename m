Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFiPDYLteWkF1AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:05:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A214F9FEBC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:05:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215406.1525594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3MT-0002J8-Tu; Wed, 28 Jan 2026 11:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215406.1525594; Wed, 28 Jan 2026 11:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3MT-0002HB-QQ; Wed, 28 Jan 2026 11:05:25 +0000
Received: by outflank-mailman (input) for mailman id 1215406;
 Wed, 28 Jan 2026 11:05:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl3MS-0002H5-7W
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 11:05:24 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b51d612-fc39-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 12:05:19 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7226.namprd03.prod.outlook.com (2603:10b6:8:124::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 11:05:15 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 11:05:15 +0000
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
X-Inumbo-ID: 3b51d612-fc39-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJwEwPl6aeNXCyXLnS5uC0EHzQRmo9FBjmkKVqkO1AHxZfYkErKwj+qszLB9y6GaxKG45ohfKzUjDkX1ymg5ie9+J1BMMFIo/SuKRqToOW10tJltkHjPhNO2h0EpGBt5vm6mWxcuoN6/2iqd7EcmiMjFKIKf53J8OOu1e7miPj7JHmMex9x7FLgckFRHrX8x/whsEnsoH8jz07Y+fdwF/p+8cdDFjoNlPnW7OOIVwJ/tXsWuo+OSUDSZ36nXCf45wDWN3dcyGN/euYUb+lNabdoEe2MvXh+7+WmIcut12VWJ2z69yqBZ/+oUrPMpsR+uGVSxW+RmMrfpwpEqJ00vvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNRNTDhSJ/Z5mN7bx1YPGYYKFU8XdjmwmtfOvBT5Eo0=;
 b=mC5LBK+d77hB40bDnRSVVGir4VtoKlhb7mpnj4Gv4EW+5DVXUydrdxdwhteS16Xw2VgYvy6sgfv0ZNar12pq9JsiHO33AXA+5MpPjM5uumuMiRQj1BrH/V5HTez7CxEq86wanmLaFSxNubDNcS+GrSCTPEdAxJ20CjzAdIMzUDFsiJSwKWsmX1X8bRAYfTrZ9QKmuPDsVVGC/uMhqGs6MRj2SfYn1jJ+rs+nFYcgD7AYrEpJxzvPTwGoiY9au1CCbS61wvZ8hijGcFK11Yao2x8W4cPZhxNyW72F7lcQUXmmHdFb1lyrko8GFo1wHxbOrJ6NmcN3b2loN9OBT4Gqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNRNTDhSJ/Z5mN7bx1YPGYYKFU8XdjmwmtfOvBT5Eo0=;
 b=y1H4wDScxpL6xZX09V+0dskUBEqaVTVAtYvXoUOLW0IjzF6oJ8DTfBhyslN1LiUiYg6DvdFuek2ibOnLuqDT0/3r3N0bn+EvQPQbo0b/aOAUoWvd08wA5miUxhLQCOU019DgK90IxVojfNoMaXPYR56STHdxiZ4jbjp6DIneidk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/2] xen/balloon: fix balloon driver initial target
Date: Wed, 28 Jan 2026 12:05:07 +0100
Message-ID: <20260128110510.46425-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0183.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: e5244a43-e8cb-436a-cd61-08de5e5d1d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NE9jK0oyaXArWjRsNkw3eTk0MElwVzZtYjY1L2ZmZ2dKLzNJTHk1T2h3WTlC?=
 =?utf-8?B?REpVQ0ROTllBMGhrRVYrcHJ2UjAveE9PVWxNV3Y4ZDNDb2F0YTNoTXlNaUhF?=
 =?utf-8?B?NlI3U2tqbmtNQnJ2R3BpUXRjNEw3K1ZudFJ1NzBvVGZaMzlLd25RU2FYUUlK?=
 =?utf-8?B?RlMrZW95TVVwakRvdzNaRjZFOFZFakpBaHJOOFN1OWlvQzVLU1ZMVXlHVktH?=
 =?utf-8?B?bjVzSENOcG1zdEd5TU1lSThHVXh2VWFZaUYvRFhZSWRnOGR5b1d4Qmg2MkRE?=
 =?utf-8?B?dVgxbjJpZkZ1cytueER3UzlINnlSWm1kbXV3Qk5CdXZ5dGZ3WXhKVzVaSXZJ?=
 =?utf-8?B?MklwOFVFZHpjWEJYQ0pPa3FCL0I0OE5NZXR0ZS90SDBTUU5kcjd5MzlDSW44?=
 =?utf-8?B?d0ZzMzluN2xrOW4zbjlEZDNjYkRpaFNWTUJFYmdEZXFPMGRyZFUrcjg4VnZ1?=
 =?utf-8?B?M1BpSis2ZjBoNVdrOVlQeFFYRXh6bkowYnc2cnZ1ZU5aVDc1ZERRK2tZVDQy?=
 =?utf-8?B?RGJwbkFReElYTWZ2cTBBbFhhZDZhaUM3UVdsYkNYTCtMMU1wOGdhNHRBK3JU?=
 =?utf-8?B?UWtlZUdUTzdWMUJWOFhSc2xXcjkvRTRmMytMNjkwVXJxY3IvS3owRjNxbDRB?=
 =?utf-8?B?ODdybDVpcEJ3OVVvSDhoY0ZUZ05LeHFqOVBKcHJndGhCRjJDSjBxeDduWFZt?=
 =?utf-8?B?UE1OczR1RDl2dzFJRGZjZ3dzVTlKbU0xUmhOUkJrR3JRc0tadTl2VlpWakJ0?=
 =?utf-8?B?elFqKzhWT2FjWmVyNmZBV0RiRHQrOCt1K0wzTHB4bURGRlJtZUIzaHJpRHpD?=
 =?utf-8?B?NUxONE52aU9qVk9kLzhzaHRxdGhqMUV6bGxBUTVkbWZjUkkrR0g0VXpXWFJv?=
 =?utf-8?B?akQwT1RibGdLRWRaNm5VTzRBSCtLQXZ4Yks5N0ttclN3emN1Y05ObkRCYy8w?=
 =?utf-8?B?bndzOTVqZUJHaE5DM0I1OS9KZFFlaHlTYm5VNnpYQzRTZUFIUE5XSSs1cFpv?=
 =?utf-8?B?MEJEclpsckIrekFOQVcyRXk0Y1pkNHJ0Uk9KQUtOdDNrRm9RQlhwZ2VOdlp2?=
 =?utf-8?B?R0NCNHl2N0pGVW5Jb1BKT05EQWtPa3FIcHNQNXRoWWZBczBQWm5iS2c0NUpD?=
 =?utf-8?B?bVZ1ZUQvV2p5aFZOQUdML3NsUE5UQ1BmVmR0OTA2SUp4cjdvYUV3b1VUOVZq?=
 =?utf-8?B?dzl5TXk1TERpWEF0ZHd6bmladEE3VUlHbllYbHVzT3pMbUcvOGZ3TjNBM1U5?=
 =?utf-8?B?aStOUmVCbGN5NUNBbHNtaTZnZWdwNFBKTUhMTi96VEVtK3BQUjRSL0dLVUNC?=
 =?utf-8?B?WUFSMVBxMjlxczhpL3g3VnVYVnBVbkovRjExTkl6NThCNkZ5anRpek41NjFP?=
 =?utf-8?B?T0RBZEhOVWV2QVJ6dzVLKzhCOU9uR2pHT0pXT1BnMTloYzFObUlPK0s2ZzNY?=
 =?utf-8?B?VzdDWXhUQ25WZzM1US9PcXN5TkNBdXV4L3kyMjB6ODZZVVhKd2t5RzZ0MVZr?=
 =?utf-8?B?T28veXFadFA0Lzg1VDNVMW0rSmNsbTYvQmtPVSthQzZmQThpak1PRFFQcDFE?=
 =?utf-8?B?U0FnREd4Wmg2akZQS3Q5OXM2cVg2ci9VRndlNCs4dkdBNkx1alpYY3lHdEUv?=
 =?utf-8?B?c2JIMzVQeDRXV0hhekJyempxSWJQaDlHYW0xRElmYis2MTFZUytNcDZTKzJE?=
 =?utf-8?B?TjZjUVN6Y2t4WjU4QXBVa04vbjZObk42L29rVmJHRWtmR3o4OFM4MkdBcXdo?=
 =?utf-8?B?WGllejlwRnRhcmZQakxhZFQzSktZNkxZZHZnZW5NTFllVEZQOUFBWVV0M3FI?=
 =?utf-8?B?MlROTW1UNGlubGdUUnN5bnZ2TkhibE03U1gvYW1md2V3Vll0N0YxQXRuZXk5?=
 =?utf-8?B?NFZVU3NJT3ZBb2RwZWliOGRTODcyUmVLeUNKbzEvYzYyNUw1cFVNbm1qWU5H?=
 =?utf-8?B?TGtoQi9zQ0tqeEF3Tm55eFlaYk5qcG5FV0R1UFRZak84SmxxeXBoZitBRlFw?=
 =?utf-8?B?MFZMMEQxUlg5WFFleGlwa2VGLzk3ekdncjRIR2kvMmVxMldQQno4MDEwMzJw?=
 =?utf-8?B?aWVrU0JCT3VmOWd2Q2oybEl1b3h0UWlEclBhd1BEMFU1WVRtL3FSdmhNY1Rm?=
 =?utf-8?Q?RRVk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFJGT284Z2xtSTAwT1p2eXNQUms3Rjh0bURsZ3B0NVNpRXFUT0tldlErczdN?=
 =?utf-8?B?YmxmaFIzR2RrVGR1L0FKSmZzYU5IV1N0dUxzWUszVFkvNXEzOTFpaXB0TFBQ?=
 =?utf-8?B?ZUw4MnV3cEtmRk1qMmdPT08yUTJHNWQ5RTN2bVNXbWR6N29QYXdzckVuekVR?=
 =?utf-8?B?RmgrZ0xIU1FMT1pJZWNCRisvYWEvSUR3cjlRREwwaW5Zc08wNk96eVlaOWhV?=
 =?utf-8?B?T0trTVRhc0RmWlZWcitpL1U0WnI3blVpWnhYZWlJRlJBbS9iUnJxb2RRUUxZ?=
 =?utf-8?B?MUdWd3VDQmFvbEJ4Z0xMdlJrNGoxTDVrRHh6YnJlYU5YZGtFM2h1NFVHQ1ly?=
 =?utf-8?B?cm5ubmQ4Sk9KSFVmbzNnUVBNZDl1SkxGeWJuMVlQV2hJK1h1dm12Qks5eHdR?=
 =?utf-8?B?NnVSS0l6ZXZrYmE2VGlaYjR3SjBYUFFuMVFDMUw1R0NvYXQrejZHZktPVG9n?=
 =?utf-8?B?MklRNlNVOHdxWDhzZForS0pER29ORDl6aVplNi9KM0laMWZaQ0NIZXdBMERY?=
 =?utf-8?B?OTZSb05hVm1Jd1VWSk9vTXR1SXpjWTMvTk9wSWxwZC9zOVo0QmdqMk16V2t4?=
 =?utf-8?B?ajBsNkRaZHFNM0xwTFNwL2I3RG16c0d6V2wwWWZQOUtMMHZGRmlSdVN1UVEx?=
 =?utf-8?B?aW9VdFpQeVZNRVVFSXU2eW5ZNVZ6MWg0RDRVQUtyOFpHYTBzUGthczE5cnh1?=
 =?utf-8?B?Sk9SVUVmK0pQc1Q4UVM1czlIYmtjb2ZpT0ZHeW5NQVNUMmpuRS9FUm8vRE00?=
 =?utf-8?B?UzdMRnkxcUdoWWVzVlZ2elFxTUI5bktVSklsejJnaFJsOE1nWFIzSkxzd1RW?=
 =?utf-8?B?alZ6dExFeWY4VFV1d3hZdlhFVkp2WnRXQmVDazNnOHFiOUtpRnlaK29oVXFE?=
 =?utf-8?B?ckJ0NXlnbmlwK2kyaG9CeDdWMTUrSjgwaVZiL3pPUWUwUTdHcTFvNnU2T0ZU?=
 =?utf-8?B?RnpWNHZiUGxnd2tsMU4xR1lteEZSZlVKR3ZYcWNUdWc0QTZJL3U0SHJZSm1v?=
 =?utf-8?B?dmtjVFkvcHVPdlpaRDc1ZjJTSWEzeWpaRGozZEJ0U0p1MzlRaUNRUDJLWFN6?=
 =?utf-8?B?aTJ3aDZ4c3lLTUhUK0tNWUFYZG1CYSthL3RpVm9oTXBUaU94NmQ2L1BOakda?=
 =?utf-8?B?NUJaTDhFQS90UUtmZ3FrZloxcnJ5dWVlN0FydkJFY29nKzd4anpQaVB6STQ1?=
 =?utf-8?B?a2dFZk5sSGVJYVpET3VkNGhaczdzZm9vTjI5TjZRTmRROWRhNDh6YUFGUFk0?=
 =?utf-8?B?d283SXR1MVRDcjhrcXoxL0FJYVhlaWpHcUJRd3RJcGtKYzdUV05XbTB0UHQv?=
 =?utf-8?B?akhzbUhhbjlJSmRsb2xlRnZSQ2lRbkVrenZuNFlpNWE1RGpIM2lqZ3BLaU5S?=
 =?utf-8?B?NkhYRm9IU0MwQU9zZGdFS0JJaW80Vm9TTys4NHRQWFN6M0g2NzFIb2RyU0Vt?=
 =?utf-8?B?c2NtVmw0dnZCaFZEdk82UWQrTHRwUVhEQnBISUJSRittVnNza1dWUXFuemNL?=
 =?utf-8?B?em1RbVRvTkN5MlRvR2ZPM2dodm9QZ0RxbVI1TU1rNWdsemtLT2RVUEhXazhx?=
 =?utf-8?B?ZGZTNm1LRkVQN0FTUEtYRllKRWtvT1dIejNuVTZyUjVlenJhN1pVd3NjZWNG?=
 =?utf-8?B?cGtOQktZNE9LQnkvc2dDRFhvT0ZtMkgyQUdKMTRVRC9rSllDeW5xRkJ3Rit6?=
 =?utf-8?B?eTduMmQ5b3ZJRmhleTErdEV0R3d2QjcrY2xrRFc3SUh0VGdjVEhPRmQ4ZE1M?=
 =?utf-8?B?elh1U2IranFDL244ak1YdVhrbDhobkR6YkJwVTgzM21XdTY2cnhseUlKdDJy?=
 =?utf-8?B?N0l0eTYydDZWVUtOdmdRaC92NE02UW84a2J0QTd6VDU5MGptOU1kMHpHNzlY?=
 =?utf-8?B?QWFPSXhQVFJlQWc4bllIYzUwVG5ESTd5V3IwT0t2dzU5bHpqTjJkSGNpOFEx?=
 =?utf-8?B?Zk5JVEN4ekRKeGFQUlk3bVptYVpxWWRkbmpzVUxadlllQ0JJZFQ5S1BhVUF5?=
 =?utf-8?B?eVF2VHNYM21MVUc4OTgwVmxTSytUSnU4YTAxMkJFZ1Ixejl0Q05hMWptNmk4?=
 =?utf-8?B?dHMvZlAwcXlIWjlnNFRoMTg1SjZ6dnQwTGZyNXRDZEpUYVRmTjhzaEtxYS9Z?=
 =?utf-8?B?UXhzZEtReDM2a3RJK2F0VFdZcjJtVGxXMzJCQWRidXZxREphaW9BeGVyUGN4?=
 =?utf-8?B?SWxIUDZUSzZUSzZiTnZGTTRSdEthUFEyek92Z1JrS1dhSE5qY0FMYmlNaFpC?=
 =?utf-8?B?UEI4MkJ4MFlUMDBtd2pxSjNIQzFrTWk1OVlYUWRDSXRjV3h3M0pHRXdXMjBm?=
 =?utf-8?B?c2pUSGdqait2VUxwQ3BHRm42eisraG9OSHJTdWQxa1lWSU1wUW42QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5244a43-e8cb-436a-cd61-08de5e5d1d42
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:05:15.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unTCsNUaPPgM5IcMr+s1ZBRL3sqkAN8eQR4jT3e9Fz5KVvssI40B8SaBwlOr6gnjkqp/LldZjJ6DqLAnrGeKlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7226
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A214F9FEBC
X-Rspamd-Action: no action

Hello,

The fist patch is a bugfix to revert to the previous way of setting the
balloon memory target for PV domains.  The new way is off by ~97 pages
on domUs, because page at PFN 0 and the ISA range are ignored by Linux,
but populated from Xen's perspective.

Second patch aims to improve the initial memory target used by dom0.
With this new approach the target set by the balloon driver matches
exactly the target Xen by the toolstack when late-initializing it.

Thanks, Roger.

Roger Pau Monne (2):
  Partial revert "x86/xen: fix balloon target initialization for PVH
    dom0"
  xen/balloon: improve accuracy of initial balloon target for dom0

 arch/x86/xen/enlighten.c        |  2 +-
 drivers/xen/balloon.c           | 26 ++++++++++++++++++++++----
 drivers/xen/unpopulated-alloc.c |  3 +++
 include/xen/xen.h               |  2 ++
 4 files changed, 28 insertions(+), 5 deletions(-)

-- 
2.51.0


