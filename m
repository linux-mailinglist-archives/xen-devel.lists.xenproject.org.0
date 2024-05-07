Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB318BE492
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 15:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718128.1120676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4L80-0002fx-JX; Tue, 07 May 2024 13:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718128.1120676; Tue, 07 May 2024 13:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4L80-0002d2-GO; Tue, 07 May 2024 13:45:08 +0000
Received: by outflank-mailman (input) for mailman id 718128;
 Tue, 07 May 2024 13:45:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rSc=MK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s4L7z-0002cw-6Q
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 13:45:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02eadff9-0c78-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 15:45:06 +0200 (CEST)
Received: from AS4P190CA0003.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::8)
 by GV1PR08MB8355.eurprd08.prod.outlook.com (2603:10a6:150:a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 7 May
 2024 13:44:59 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::5d) by AS4P190CA0003.outlook.office365.com
 (2603:10a6:20b:5de::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39 via Frontend
 Transport; Tue, 7 May 2024 13:44:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Tue, 7 May 2024 13:44:59 +0000
Received: ("Tessian outbound 85e363419cbe:v315");
 Tue, 07 May 2024 13:44:58 +0000
Received: from 082676b6661e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B8041C56-2D6F-4BDA-A6BC-1158593B2F67.1; 
 Tue, 07 May 2024 13:44:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 082676b6661e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 May 2024 13:44:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB8910.eurprd08.prod.outlook.com (2603:10a6:102:33b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 13:44:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 13:44:46 +0000
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
X-Inumbo-ID: 02eadff9-0c78-11ef-909c-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OJXePcf35FueMV6ZOAEI7ig+WXHOg9TGJ7sntuwZ1tZcBH2q27OjCvnl6tZK3lF9nUNxQOk/P9+mlRUgmSWItaw5unRYBZxJTo1n0gY68r62TWD0Ega+YGDkk64MBombLbOku4Yk7W2yuCYocFI9CKZebQgygK7wkkcVf4SwR3764RwbgEp+jeWm2hqixw/CdhOMrYUx4JZ+t8OIAv4IjXwh9mYa0iaI6RyHD22wMR6B5wZ0hpfvy/jKnBURqGyRcl0rdwdrRk0h8bAXuG0qfj6oCY2ltJqj0APKW+J8KrJBhoUb9nGIoFXGOP4QoW7tem37zYabpE1qUgmxhS7Svg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RurwdJ6fzazxDFFVx47I1keTCoWhiTFJ/e3dKHXsu6g=;
 b=VLJ3U7Mwr+LC4KS1GC7K8XDpkXyqf7es6dpXeBED2clj/+evEIiBOfRVUzspwQ8acvMBGtfcvkDo7c7D+Wf6n9SHhjuVUpr38j8eJSAOiuMp8ZYBELrqCBGAXQ/KJfNnwuU7idgTsPvy9e3BLSTCX/bcC7tnVk2LitlxCGqVqlzEZvj0eRkR2bFWlx0gjf8hhtxutOeHYSnIFIU1aScuSA5PvUwxxw1iB860gH40Mk2EDpH/ZP8IEqKF0kylB4EKhmBJUnJktMhNKQYNF4Q0hLZQiw15sIJjjfiqA3iLta+5V8ka6n6v+2U1Uke7oDWPZT7OkxdwoiZJilLxw7Pg5w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RurwdJ6fzazxDFFVx47I1keTCoWhiTFJ/e3dKHXsu6g=;
 b=CUofkBkx/AlyjdEWsDW4ujCscL3guRnQRsep5XtS3gcvdR1xMwIjD/jmZjl/KCKSTFKgJ1AsUtcnf/BfEM9sT9n0b2luZlOgK5FwsB5N66rIcb7SNVo068Z826xsxm/lyhsVQhjO7uiW4yFHvn3NZD27gtnxmYpWQA3j6KnWHZ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f77c75a8c54e75a9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ic7cO5u1K+lz3eATedlvmNIwgxyAUQWTz/UjvmdbnivTE7OEsjkwIgfWj3pbYG+Ww/z5zgRng3ZFpxoOjhzkh4y9Tn1zE6Rnm7uyWDU/734kjkyQ0XSkOtat3w8yKq8ezEyvXcav0/efcAOdvm254BWTEJv4WFuUE/DN+HNwchAGYPo9u7uw5j2drrDJDtK6kYlVDrhj2ct+DKqMKmyHoPWhoqhW7VNvQ3qKYA96NSZdK5XXDO+qBA97wjtUXY6nFUpfIBvuMXMUZAvwSa23jXJzc7DwlWyb2baCNKrghMa99KPQEuE6GFwiH6isgbiuoQUH5YhOdVTXxreisAh9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RurwdJ6fzazxDFFVx47I1keTCoWhiTFJ/e3dKHXsu6g=;
 b=hmn60C74V5Wm0RuLDpJwXHqhAIsRhaBMYYevz54jlJCnpLNuv6Me5QDNj7LF1xdWv3UHaIf+rcoXdS0kGkVvDH1HbCmDItsdTdMiCVXXjeoaU9q7wjWIXVCd4Ih25cRbKIoBvXHpZRyAxCAMDEFNeTYi+vaVaFyKvWqId/uAcz2SaOlWucxja+7CdSEhvCQps6qVj4fh5qv4rpfN2CdsEiwSeh6rTbsw+I/MU19LFUnsM0+vSYP2GXFIC4ea+MW7YKDWhAbF/A8s+conNK/r+SrZ3A3Y+dl59FNSDupv4R4IisGKLgxoviAEFwJiZSRl6NMkbqksMrmkT3JjrSuZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RurwdJ6fzazxDFFVx47I1keTCoWhiTFJ/e3dKHXsu6g=;
 b=CUofkBkx/AlyjdEWsDW4ujCscL3guRnQRsep5XtS3gcvdR1xMwIjD/jmZjl/KCKSTFKgJ1AsUtcnf/BfEM9sT9n0b2luZlOgK5FwsB5N66rIcb7SNVo068Z826xsxm/lyhsVQhjO7uiW4yFHvn3NZD27gtnxmYpWQA3j6KnWHZ8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/7] xen/arm: Lookup bootinfo shm bank during the mapping
Thread-Topic: [PATCH 1/7] xen/arm: Lookup bootinfo shm bank during the mapping
Thread-Index: AQHalVftWBiV4yp+FUmOns8otkWCO7GKRsoAgAGX6oA=
Date: Tue, 7 May 2024 13:44:45 +0000
Message-ID: <882A5390-64AC-4FB6-AA53-4CE466CF9062@arm.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-2-luca.fancellu@arm.com>
 <28322f07-99fc-4428-bcf2-b8c2af04d38b@amd.com>
In-Reply-To: <28322f07-99fc-4428-bcf2-b8c2af04d38b@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB8910:EE_|AM4PEPF00027A67:EE_|GV1PR08MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: e275f028-ce93-4579-603e-08dc6e9be338
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RTZ3UGdRU2pHdGRoK1BzbFY2cE82aUxLb2d4VDhtc1FWZXh5emFZWmJ0WStR?=
 =?utf-8?B?MWtPelIybzlIb1Q1Wk44M0tPZisyZDFua3d1TzdzeG8rUytkZEt4SGFuZU5V?=
 =?utf-8?B?OEpTVEcyVk9EUjhuUStaVXVlTzI3TWZ3bW5uMitmQlAzeEVjRU9TeGZMZERr?=
 =?utf-8?B?SytIekRvbHFvU1ZXb2hTMUg5eWxMTnYwY0ZzVjFTSVIxSTRja2oyT09HZDd5?=
 =?utf-8?B?SnRTQ2RQMzk2VTNwMEgxQVhlV2J2VDBVb2owOW80cUFlNXBISFJSdXZUTGwy?=
 =?utf-8?B?ZnZ6OFVDQWhmaXFVV2s5SjIwV08zUEN4M2VQK3NlRTFScHBoSWxOeUlqQUNo?=
 =?utf-8?B?RFdQRVdYLzk0UFduUEVHaloyNjZHcWNlWDQ2T2lNVEdNRzJzaTRpSWszMGh6?=
 =?utf-8?B?N1paVWVwTEZ0L25FRFByZWViNU1KMkYvT1NkMEhJUDZBT2NMYXJXMW50dWpy?=
 =?utf-8?B?S2xnZEpjNkcvclJjSWVIZHFoSEkvV0wzOS9JVTN3OGlnR2ZDRXh2Rk9CQTdS?=
 =?utf-8?B?NlNFUCtDYWNDSHpYZGp5bHJhL0hEZms0blpKWWxwZmNkakFTcUhTeFNzTkd0?=
 =?utf-8?B?eW5YMGZnbWVHVVhza09JV2JmbS9ya0FkaXpJOFFnNGRTU1IvTGsxSms4MmZx?=
 =?utf-8?B?MnRlZ0hONVMrRUlOQjExSENCU0E1OThwdUwvV0kzcWhhU0Rlamo4NjVlYVha?=
 =?utf-8?B?WEJsdGlZMm1IR2d0ZzF3SklqMTV5TDgrUmtXbW5NVVRCdVlhSEhGK245Rnlw?=
 =?utf-8?B?a3NHKzRVaGkvM0JaTmkwSzkrekR1bHhHNHh1TDJ4aHpoSWsyUCtveVd3ei9x?=
 =?utf-8?B?QnFKNDNrenJyYXNWekVHNFR0MW5PWDAxSlphUDFJMjE0WTZsUjFKZzVrZW8x?=
 =?utf-8?B?dnc0RVR6UlN5ZWRsK0VpWExKMEJuZFVvbnhCVXZsZWx2QWxpb3pNOFRQOU5H?=
 =?utf-8?B?bUlhck1QL2VqYi9EK3dyQW5Qb1VYNzQ0eGhUcGV2VjFQbHBZT1dyYUlZUlMw?=
 =?utf-8?B?UEdlTkZiOTRiNGxYb1AzRDNSMU9XNWsrTEJkbmFwbUJ5SysrL2tQSG4weHk0?=
 =?utf-8?B?SXNFamtBMkZsMDg4VWhnK2ZGYWNpOHdheVJQYkxDTGJ2VmNTdWVnQWhQZy9n?=
 =?utf-8?B?WFFTSGFVTnZDOVUrS0RLMWoyeW1icXprWnhYWUNmNWMraDcvRnFIbmU4Q0NT?=
 =?utf-8?B?YkxLUnJhYXE4RWFITHlRMVd2bWo2NEFSNi9QTGFHM3hhWXQyUkYyTGFtbXln?=
 =?utf-8?B?MzNEYllLZ3h5NlRVVU0vcWtvMndOQjV1SUhMWFNHblBWVCtwOEZBNW44enlk?=
 =?utf-8?B?N3NlNVVUek8vOWZLdzJNVE16ZmMrZHNya2o2REY2UmI3WmxPbExoemlRSFdy?=
 =?utf-8?B?dXA3aWhnVG4zSUgxVzRoV29Sc3R3RWpvQnYvVVhocDlGOHBkT2FJRDBTVk9W?=
 =?utf-8?B?MVg1blJoL25Jd0hIdFpibkNUZEdFemhJUlI1bXpxR3hLMk9TeEs3ZUFKUStD?=
 =?utf-8?B?bnVLUmxNNHJKY09reFRkbHJ3N3U5Z08yNW1lQ1hNWlpXZms1Q0liN3NyOVpq?=
 =?utf-8?B?cVB4R3FjdVo4a1BmOFlmOWV6RGd2VGtmUyswVmJHYnhkbjVOZXJ3Tjlqdjd6?=
 =?utf-8?B?cUZPUUNqdkh5T3BJRCt6ejgyNFYzWkppOVQzQXhETWpLSG1hWVhzL1lkd1B1?=
 =?utf-8?B?UVlTdDJaNXkrdnlRNms3UlgvS2lTNU9oTWNqTkFSZ0FoSlZERU13SU9FdEZI?=
 =?utf-8?B?MzArdnBYbVVJbjRpTmgwUGp2YjZoSnB2angvVjA5Sk5BZFl5TXMyd21wOWE4?=
 =?utf-8?B?UVNaTEhuTHc4Vmg2S2lQdz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0EE7CB667B56F47A604BDAAB23E5ACF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8910
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aacf5cdf-5dc4-43b4-8673-08dc6e9bdb76
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|35042699013|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z21PVnB4ZXVMekJXVFl2WjBzY2xSYzFXVzYrSSt0L25WQmVDMXRtTTJ4Q09t?=
 =?utf-8?B?aStOZS9MUGh0ZS9EVk1PNHltdW9TZXBLcVliYWtqU1NqdEtiZkxUOUxrQ285?=
 =?utf-8?B?ZnJKY2JVUFN5ZTEyOGc5aDJ0b3ltOG9aK0pHK1ZBV3cwRTRYSXBheWNJT2lZ?=
 =?utf-8?B?eEFiNEtuVDJ5S2VZYVlub3ZNZVR3UlJFNHl4ODBkZXNRcWRCazVRMmxzaFZP?=
 =?utf-8?B?TU1LRGVLenRyZmVCZ0tYMkl0UnFYN0xTSnZrRmxHMER5cGhHaFNyYzQraHFE?=
 =?utf-8?B?WHljV1Y0QWlRaURqYWJsUlo3TkJQMzM5eE1XS05hQUVrT1dyQS9vdjVCL2Mz?=
 =?utf-8?B?dlY4N1FJa0M0TkE3SCtWNWJsQUpHWXNEdS9NVlRxQTM1bitrSzV0V2FPVTF1?=
 =?utf-8?B?U0VNOTJENUp6a0ZvQjh3WklmRW5VRjE0Um9Nck9zRVY3TnRwRlppTnNKSUpC?=
 =?utf-8?B?YUpYdVZJUUcxVmE2WnBuUThKSHk2OUpxUEs1amliUGhBbldjYTRHOHlpRGJV?=
 =?utf-8?B?SkE4em9Bc1RkMnJvNFhQdEhnSTkrYzlkeGlRY2lWRGFxYWxWaUtlV3FoMHFE?=
 =?utf-8?B?VFpnVjlMSDdSSmtwbVUrNnVqdDBnaGJjUFRDeDdqTHRocG1xV3N6Yzh2YXJ5?=
 =?utf-8?B?Q1JhQ3FzdmpXNW5OK1AvWEY0YUtReEtaRXRWOXV2Y0o3NjdIdDNtRTN2OUlD?=
 =?utf-8?B?MGV5cm00RmJXT2ZvWEU3UWMvN2RNeG9MUnFack0zbnAveFRiME5zUEU5cW5q?=
 =?utf-8?B?Y3ZmWERkRXBrd3NqSzRhdEVxcUNOR0JWYXF5NnRSc0xIaVp2WW1ZNlMrNm1Z?=
 =?utf-8?B?elRVNGJ0MDJUTjN3aHY1MUs1SlpQTGZoK28rWHUrQnJlVU9uZUlrSUpUZlQ2?=
 =?utf-8?B?dzhpdkpXOUJVazJvbU9LejJFWWJLOTNNajlXeWl6clYwMHMzbWFRRG41Um0y?=
 =?utf-8?B?Zjk1ZkxJYzc5czJSdUNEeWVBeEU3YlB3ZUtaU3V5YXI1OFQ4Y3pPbkJvOTR1?=
 =?utf-8?B?Z3RydFFLZk9jbGt6S0JFSy9YNVZSdG8weTV1Uk9zdHkxVDlYc1lJS2xXMXdL?=
 =?utf-8?B?NU0wL09haWFGak93dWpyMUFxVEY2Znc5ZndsY1NvM01CQ1RtWCt1WmluU0Ur?=
 =?utf-8?B?TWR5QzVDN2srZ2xwTkhKd0xwOThzMGN4TkkwVk5iZ1hlYkJxKzVidVBUZWJq?=
 =?utf-8?B?TkZ5cXV3OTQxOW5NSUE2RVVLZnFRdkVuMzhKQ3JNRWZFQ21ZWDJSalcxUndl?=
 =?utf-8?B?T0RzcXRRK1RmRTN2RSs5UmRUcGIwVGVnOHdpL0M4UlgraGg5RTdyZGkyNWdC?=
 =?utf-8?B?NVA1b1g4aUZkV1hzZ3o4NkJsL1I0U0pqSFF2Vll6ZFFpemg3T2Rqc1pVWGpK?=
 =?utf-8?B?V09SVFBkSnJ1S0ZUY25FMXVSQ25UeUJLY3hJMmt3WGxpeTN4dFhvUTFsaG1t?=
 =?utf-8?B?M2FDdE53RVllSFRiL0hSM2hvNzcwcWpYcHg5NlBEUlhxVnYwN1d1L1RCOVU0?=
 =?utf-8?B?MjE0Y1YvTUFWb3lMd1hIRnFtVjJ0R25nck1EcUpGemIvN0xkcTR2cGpOUWFC?=
 =?utf-8?B?d1lwU2RxWS9UYzYyek5VbHhHU0x6VUlLWEpaQkhKZkVVZVhrd1R1bFpHZ0R6?=
 =?utf-8?B?Ym9jVndxOGgyOGFFQ0tSS2pMKzMyMytLT2JOWG5qR0ZFMWVlVXR3bnErcUFt?=
 =?utf-8?B?VHlORnNlSjlBU3kvL3dWVStDNXBtdWQvQWU5K2hpcHhhSWdPWCtFSHkvRitj?=
 =?utf-8?B?MVFuRHVTYTRtUktXeG01cGRnL0FGYXNCUkhoYmdXL2twaFE1Ym1LdVNMZW5K?=
 =?utf-8?B?djNGa3R3cmFVQnM5UjI2UFYvV2VQNXBOYk9CbVpsbFhPcHE4NnZvZUQ3d2pm?=
 =?utf-8?Q?Ys0tNTt8fbr6+?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699013)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 13:44:59.0251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e275f028-ce93-4579-603e-08dc6e9be338
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8355

SGkgTWljaGFsLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQo+IE9uIDYgTWF5IDIwMjQs
IGF0IDE0OjI0LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPiB3cm90ZToNCj4g
DQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyMy8wNC8yMDI0IDEwOjI1LCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4gDQo+PiANCj4+IFRoZSBjdXJyZW50IHN0YXRpYyBzaGFyZWQgbWVtb3J5IGNvZGUg
aXMgdXNpbmcgYm9vdGluZm8gYmFua3Mgd2hlbiBpdA0KPj4gbmVlZHMgdG8gZmluZCB0aGUgbnVt
YmVyIG9mIGJvcnJvd2VyLCBzbyBldmVyeSB0aW1lIGFzc2lnbl9zaGFyZWRfbWVtb3J5DQo+IHMv
Ym9ycm93ZXIvYm9ycm93ZXJzDQoNCldpbGwgZml4DQoNCj4gDQo+PiBpcyBjYWxsZWQsIHRoZSBi
YW5rIGlzIHNlYXJjaGVkIGluIHRoZSBib290aW5mby5zaG1lbSBzdHJ1Y3R1cmUuDQo+PiANCj4+
IFRoZXJlIGlzIG5vdGhpbmcgd3Jvbmcgd2l0aCBpdCwgaG93ZXZlciB0aGUgYmFuayBjYW4gYmUg
dXNlZCBhbHNvIHRvDQo+PiByZXRyaWV2ZSB0aGUgc3RhcnQgYWRkcmVzcyBhbmQgc2l6ZSBhbmQg
YWxzbyB0byBwYXNzIGxlc3MgYXJndW1lbnQgdG8NCj4+IGFzc2lnbl9zaGFyZWRfbWVtb3J5LiBX
aGVuIHJldHJpZXZpbmcgdGhlIGluZm9ybWF0aW9uIGZyb20gdGhlIGJvb3RpbmZvDQo+PiBiYW5r
LCBpdCdzIGFsc28gcG9zc2libGUgdG8gbW92ZSB0aGUgY2hlY2tzIG9uIGFsaWdubWVudCB0bw0K
Pj4gcHJvY2Vzc19zaG1fbm9kZSBpbiB0aGUgZWFybHkgc3RhZ2VzLg0KPiBJcyB0aGlzIGNoYW5n
ZSByZWFsbHkgcmVxdWlyZWQgZm9yIHdoYXQgeW91IHdhbnQgdG8gYWNoaWV2ZT8gQXQgdGhlIG1v
bWVudCB0aGUgYWxpZ25tZW50IGNoZWNrcw0KPiBhcmUgZG9uZSBiZWZvcmUgZmlyc3QgdXNlLCB3
aGljaCByZXF1aXJlcyB0aGVzZSB2YWx1ZXMgdG8gYmUgYWxpZ25lZC4gRkRUIHByb2Nlc3Npbmcg
cGFydCBkb2VzIG5vdCBuZWVkIGl0Lg0KDQpUaGF04oCZcyB0cnVlLCBidXQgaXQgd291bGQgc2Vw
YXJhdGUgYmV0dGVyIHRoZSBwYXJzaW5nIHBhcnQsIGluIHRoZSBlbmQgd2hhdCBpcyB0aGUgcG9p
bnQgb2YgZmFpbGluZyBsYXRlciBpZiwgZm9yIGV4YW1wbGUsDQpzb21lIHZhbHVlIGFyZSBwYXNz
ZWQgYnV0IG5vdCBhbGlnbmVkPyANCg0KPiANCj4+IA0KPj4gU28gY3JlYXRlIGEgbmV3IGZ1bmN0
aW9uIGZpbmRfc2htKCkgd2hpY2ggdGFrZXMgYSAnc3RydWN0IHNoYXJlZF9tZW1pbmZvJw0KPiBD
YW4gd2UgbmFtZSBpdCBmaW5kX3NobV9iYW5rKCkgb3IgZmluZF9zaG1fYmFua19ieV9pZCgpPw0K
PiBJIGFncmVlIHRoYXQgaXQncyBiZXR0ZXIgdG8gdXNlIGEgdW5pcXVlIElEIHJhdGhlciB0aGFu
IG1hdGNoaW5nIGJ5IGFkZHJlc3Mvc2l6ZQ0KDQpZZXMgZWl0aGVyIG5hbWVzIGFyZSBnb29kIGZv
ciBtZSwgSSB3b3VsZCB1c2UgZmluZF9zaG1fYmFua19ieV9pZA0KDQo+IA0KPj4gc3RydWN0dXJl
IGFuZCB0aGUgc2hhcmVkIG1lbW9yeSBJRCwgdG8gbG9vayBmb3IgYSBiYW5rIHdpdGggYSBtYXRj
aGluZyBJRCwNCj4+IHRha2UgdGhlIHBoeXNpY2FsIGhvc3QgYWRkcmVzcyBhbmQgc2l6ZSBmcm9t
IHRoZSBiYW5rLCBwYXNzIHRoZSBiYW5rIHRvDQo+PiBhc3NpZ25fc2hhcmVkX21lbW9yeSgpIHJl
bW92aW5nIHRoZSBub3cgdW5uZWNlc3NhcnkgYXJndW1lbnRzIGFuZCBmaW5hbGx5DQo+PiByZW1v
dmUgdGhlIGFjcXVpcmVfbnJfYm9ycm93ZXJfZG9tYWluKCkgZnVuY3Rpb24gc2luY2Ugbm93IHRo
ZSBpbmZvcm1hdGlvbg0KPj4gY2FuIGJlIGV4dHJhY3RlZCBmcm9tIHRoZSBwYXNzZWQgYmFuay4N
Cj4+IE1vdmUgdGhlICJ4ZW4sc2htLWlkIiBwYXJzaW5nIGVhcmx5IGluIHByb2Nlc3Nfc2htIHRv
IGJhaWwgb3V0IHF1aWNrbHkgaW4NCj4+IGNhc2Ugb2YgZXJyb3JzICh1bmxpa2VseSksIGFzIHNh
aWQgYWJvdmUsIG1vdmUgdGhlIGNoZWNrcyBvbiBhbGlnbm1lbnQNCj4+IHRvIHByb2Nlc3Nfc2ht
X25vZGUuDQo+PiANCj4+IERyYXdiYWNrIG9mIHRoaXMgY2hhbmdlIGlzIHRoYXQgbm93IHRoZSBi
b290aW5mbyBhcmUgdXNlZCBhbHNvIHdoZW4gdGhlDQo+PiBiYW5rIGRvZXNuJ3QgbmVlZCB0byBi
ZSBhbGxvY2F0ZWQsIGhvd2V2ZXIgaXQgd2lsbCBiZSBjb252aW5pZW50IGxhdGVyDQo+PiB0byB1
c2UgaXQgYXMgYW4gYXJndW1lbnQgZm9yIGFzc2lnbl9zaGFyZWRfbWVtb3J5IHdoZW4gZGVhbGlu
ZyB3aXRoDQo+PiB0aGUgdXNlIGNhc2Ugd2hlcmUgdGhlIEhvc3QgcGh5c2ljYWwgYWRkcmVzcyBp
cyBub3Qgc3VwcGxpZWQgYnkgdGhlIHVzZXIuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2Eg
RmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+IC0tLQ0KPj4geGVuL2FyY2gvYXJt
L3N0YXRpYy1zaG1lbS5jIHwgMTA1ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LQ0KPj4gMSBmaWxlIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQ0K
Pj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3N0YXRpYy1zaG1lbS5jIGIveGVuL2Fy
Y2gvYXJtL3N0YXRpYy1zaG1lbS5jDQo+PiBpbmRleCAwOWY0NzRlYzYwNTAuLmY2Y2Y3NGU1OGE4
MyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9zdGF0aWMtc2htZW0uYw0KPj4gKysrIGIv
eGVuL2FyY2gvYXJtL3N0YXRpYy1zaG1lbS5jDQo+PiBAQCAtMTksMjkgKzE5LDI0IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBfX21heWJlX3VudXNlZCBidWlsZF9hc3NlcnRpb25zKHZvaWQpDQo+PiAg
ICAgICAgICAgICAgICAgIG9mZnNldG9mKHN0cnVjdCBzaGFyZWRfbWVtaW5mbywgYmFuaykpKTsN
Cj4+IH0NCj4+IA0KPj4gLXN0YXRpYyBpbnQgX19pbml0IGFjcXVpcmVfbnJfYm9ycm93ZXJfZG9t
YWluKHN0cnVjdCBkb21haW4gKmQsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFkZHJfdCBwYmFzZSwgcGFkZHJfdCBwc2l6ZSwNCj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICpucl9i
b3Jyb3dlcnMpDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtZW1iYW5rIF9faW5pdCAqZmluZF9z
aG0oY29uc3Qgc3RydWN0IG1lbWJhbmtzICpzaG1lbSwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpzaG1faWQpDQo+PiB7DQo+PiAt
ICAgIGNvbnN0IHN0cnVjdCBtZW1iYW5rcyAqc2htZW0gPSBib290aW5mb19nZXRfc2htZW0oKTsN
Cj4+ICAgICB1bnNpZ25lZCBpbnQgYmFuazsNCj4+IA0KPj4gLSAgICAvKiBJdGVyYXRlIHJlc2Vy
dmVkIG1lbW9yeSB0byBmaW5kIHJlcXVlc3RlZCBzaG0gYmFuay4gKi8NCj4+ICsgICAgQlVHX09O
KCFzaG1lbSB8fCAhc2htX2lkKTsNCj4gSXMgaXQgcmVhbGx5IG5lY2Vzc2FyeT8gRm9yIGV4YW1w
bGUsIGJlZm9yZSBjYWxsaW5nIGZpbmRfc2htKCksIHN0cmxlbiBpcyB1c2VkIG9uIHNobV9pZA0K
DQpTbywgSSBndWVzcyBJIGRpZCB0aGF0IHRvIGhhdmUgbW9yZSByb2J1c3QgY29kZSwgaW4gY2Fz
ZSBzb21lb25lIGNoYW5nZXMgdGhlIGNvZGUgaW4gdGhlDQpmdXR1cmUgYW5kIHBlcmhhcHMgcmVt
b3ZlcyBzb21ldGhpbmcgd2UgcmVseSBvbi4gSWYgeW91IG9iamVjdCB0byB0aGVtIEkgd2lsbCBy
ZW1vdmUgdGhvdWdoLA0KaGVyZSBhbmQgdGhlIG90aGVyIHJlbGF0ZWQgcG9pbnRzIGJlbG93Lg0K
DQo+IA0KPj4gKw0KPj4gICAgIGZvciAoIGJhbmsgPSAwIDsgYmFuayA8IHNobWVtLT5ucl9iYW5r
czsgYmFuaysrICkNCj4+ICAgICB7DQo+PiAtICAgICAgICBwYWRkcl90IGJhbmtfc3RhcnQgPSBz
aG1lbS0+YmFua1tiYW5rXS5zdGFydDsNCj4+IC0gICAgICAgIHBhZGRyX3QgYmFua19zaXplID0g
c2htZW0tPmJhbmtbYmFua10uc2l6ZTsNCj4+IC0NCj4+IC0gICAgICAgIGlmICggKHBiYXNlID09
IGJhbmtfc3RhcnQpICYmIChwc2l6ZSA9PSBiYW5rX3NpemUpICkNCj4+ICsgICAgICAgIGlmICgg
c3RybmNtcChzaG1faWQsIHNobWVtLT5iYW5rW2JhbmtdLnNobWVtX2V4dHJhLT5zaG1faWQsDQo+
PiArICAgICAgICAgICAgICAgICAgICAgTUFYX1NITV9JRF9MRU5HVEgpID09IDAgKQ0KPiBXaHkg
bm90IHN0cmNtcD8gQUZBSUNTIGl0J3MgYmVlbiB2YWxpZGF0ZWQgbWFueSB0aW1lcyBhbHJlYWR5
DQo+IA0KPj4gICAgICAgICAgICAgYnJlYWs7DQo+PiAgICAgfQ0KPj4gDQo+PiAgICAgaWYgKCBi
YW5rID09IHNobWVtLT5ucl9iYW5rcyApDQo+PiAtICAgICAgICByZXR1cm4gLUVOT0VOVDsNCj4+
IC0NCj4+IC0gICAgKm5yX2JvcnJvd2VycyA9IHNobWVtLT5iYW5rW2JhbmtdLnNobWVtX2V4dHJh
LT5ucl9zaG1fYm9ycm93ZXJzOw0KPj4gKyAgICAgICAgcmV0dXJuIE5VTEw7DQo+PiANCj4+IC0g
ICAgcmV0dXJuIDA7DQo+PiArICAgIHJldHVybiAmc2htZW0tPmJhbmtbYmFua107DQo+PiB9DQo+
PiANCj4+IC8qDQo+PiBAQCAtMTAzLDE0ICs5OCwyMCBAQCBzdGF0aWMgbWZuX3QgX19pbml0IGFj
cXVpcmVfc2hhcmVkX21lbW9yeV9iYW5rKHN0cnVjdCBkb21haW4gKmQsDQo+PiAgICAgcmV0dXJu
IHNtZm47DQo+PiB9DQo+PiANCj4+IC1zdGF0aWMgaW50IF9faW5pdCBhc3NpZ25fc2hhcmVkX21l
bW9yeShzdHJ1Y3QgZG9tYWluICpkLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhZGRyX3QgcGJhc2UsIHBhZGRyX3QgcHNpemUsDQo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdCBnYmFzZSkNCj4+ICtzdGF0aWMgaW50
IF9faW5pdCBhc3NpZ25fc2hhcmVkX21lbW9yeShzdHJ1Y3QgZG9tYWluICpkLCBwYWRkcl90IGdi
YXNlLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCBtZW1iYW5rICpzaG1fYmFuaykNCj4+IHsNCj4+ICAgICBtZm5fdCBzbWZuOw0KPj4gICAg
IGludCByZXQgPSAwOw0KPj4gICAgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMsIG5yX2JvcnJvd2Vy
cywgaTsNCj4+ICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOw0KPj4gKyAgICBwYWRkcl90IHBi
YXNlLCBwc2l6ZTsNCj4+ICsNCj4+ICsgICAgQlVHX09OKCFzaG1fYmFuayB8fCAhc2htX2Jhbmst
PnNobWVtX2V4dHJhKTsNCj4gSXMgaXQgcmVhbGx5IG5lY2Vzc2FyeT8gSXNuJ3Qgc2htX2Jhbmsg
YWxyZWFkeSB2YWxpZGF0ZWQ/IEl0J3Mgbm90IHZlcnkgY29tbW9uIHRvIGhhdmUgTlVMTCBjaGVj
a3MgaW4gaW50ZXJuYWwgZnVuY3Rpb25zLg0KPiANCg0KWy4uLl0NCg0KPj4gDQo+PiBAQCAtNDQw
LDYgKzQzMSwyNiBAQCBpbnQgX19pbml0IHByb2Nlc3Nfc2htX25vZGUoY29uc3Qgdm9pZCAqZmR0
LCBpbnQgbm9kZSwgdWludDMyX3QgYWRkcmVzc19jZWxscywNCj4+ICAgICBkZXZpY2VfdHJlZV9n
ZXRfcmVnKCZjZWxsLCBhZGRyZXNzX2NlbGxzLCBhZGRyZXNzX2NlbGxzLCAmcGFkZHIsICZnYWRk
cik7DQo+PiAgICAgc2l6ZSA9IGR0X25leHRfY2VsbChzaXplX2NlbGxzLCAmY2VsbCk7DQo+PiAN
Cj4+ICsgICAgaWYgKCAhSVNfQUxJR05FRChwYWRkciwgUEFHRV9TSVpFKSApDQo+PiArICAgIHsN
Cj4+ICsgICAgICAgIHByaW50aygiZmR0OiBwaHlzaWNhbCBhZGRyZXNzIDB4JSJQUklwYWRkciIg
aXMgbm90IHN1aXRhYmx5IGFsaWduZWQuXG4iLA0KPj4gKyAgICAgICAgICAgICAgIHBhZGRyKTsN
Cj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIGlm
ICggIUlTX0FMSUdORUQoZ2FkZHIsIFBBR0VfU0laRSkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAg
ICBwcmludGsoImZkdDogZ3Vlc3QgYWRkcmVzcyAweCUiUFJJcGFkZHIiIGlzIG5vdCBzdWl0YWJs
eSBhbGlnbmVkLlxuIiwNCj4+ICsgICAgICAgICAgICAgICBnYWRkcik7DQo+PiArICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBpZiAoICFJU19BTElHTkVE
KHNpemUsIFBBR0VfU0laRSkgKQ0KPiBXaGF0IHNlbnNlIGRvZXMgaXQgbWFrZSB0byBjaGVjayBm
b3Igc2l6ZSBiZWluZyBhbGlnbmVkIGJlZm9yZSBjaGVja2luZyBmb3Igc2l6ZSBiZWluZyAwPyBJ
dCB3b3VsZCBwYXNzIHRoaXMgY2hlY2suDQoNClllcywgYnV0IGluIHRoZSBlbmQgd2UgYXJlIGRv
aW5nIHRoYXQgdG8gcHJpbnQgYSBkaWZmZXJlbnQgZXJyb3IgbWVzc2FnZSwgc28gaXQgd291bGQg
cGFzcw0KZm9yIDAgYW5kIGl04oCZcyB0b3RhbGx5IGZpbmUsIGJ1dCBpbiB0aGUgZW5kIGl0IHdp
bGwgZmFpbCBhZnRlcndhcmRzLiBJIGRvbuKAmXQgc2VlIGZ1bmN0aW9uYWwgZGlzcnVwdGlvbnMN
CmhhdmluZyB0aGlzIG9uZSBiZWZvcmUgdGhlIG90aGVyLCB3aGF0IGlzIHRoZSBjb25jZXJuIGhl
cmU/DQoNCj4gDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHByaW50aygiZmR0OiBzaXplIDB4JSJQ
UklwYWRkciIgaXMgbm90IHN1aXRhYmx5IGFsaWduZWRcbiIsIHNpemUpOw0KPj4gKyAgICAgICAg
cmV0dXJuIC1FSU5WQUw7DQo+PiArICAgIH0NCj4+ICsNCj4+ICAgICBpZiAoICFzaXplICkNCj4+
ICAgICB7DQo+PiAgICAgICAgIHByaW50aygiZmR0OiB0aGUgc2l6ZSBmb3Igc3RhdGljIHNoYXJl
ZCBtZW1vcnkgcmVnaW9uIGNhbiBub3QgYmUgemVyb1xuIik7DQo+PiAtLQ0KPj4gMi4zNC4xDQo+
PiANCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

