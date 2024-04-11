Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC668A0CD2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 11:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703814.1099696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rur5S-0004Ci-1c; Thu, 11 Apr 2024 09:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703814.1099696; Thu, 11 Apr 2024 09:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rur5R-0004AW-Ty; Thu, 11 Apr 2024 09:51:17 +0000
Received: by outflank-mailman (input) for mailman id 703814;
 Thu, 11 Apr 2024 09:51:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RFZQ=LQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rur5R-0004A8-4f
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 09:51:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2612::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08bdbefa-f7e9-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 11:51:14 +0200 (CEST)
Received: from AS9PR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::13) by AS8PR08MB9480.eurprd08.prod.outlook.com
 (2603:10a6:20b:61f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 09:51:09 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:540:cafe::4a) by AS9PR01CA0004.outlook.office365.com
 (2603:10a6:20b:540::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.21 via Frontend
 Transport; Thu, 11 Apr 2024 09:51:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Thu, 11 Apr 2024 09:51:08 +0000
Received: ("Tessian outbound dc0a9029eb2c:v300");
 Thu, 11 Apr 2024 09:51:07 +0000
Received: from 3150ad1cb4e2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F2063E9B-EEBA-423D-957F-D19E6158F798.1; 
 Thu, 11 Apr 2024 09:50:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3150ad1cb4e2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Apr 2024 09:50:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB7884.eurprd08.prod.outlook.com (2603:10a6:10:3b0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 09:50:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 09:50:51 +0000
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
X-Inumbo-ID: 08bdbefa-f7e9-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jpoZsgzUeg2jrse0biJerdQuQA2LOJ4T++214VDJT9nvbpHR3EcAjAub//MS/HRAdol/mI0rijHjsUI+GBvZo7DI6sozeS0UNhE7vJO3NQHSRgkLhRHbQApEaOk4ymlN0x2TdBK2sLe1CTEMfM+mhNe8IydHSWXl9HO7Djwigh6YK6OiYCHkjfawrufUVsnttlj+ZgNtnOk9vm2QROQ1KbdpGawvXOhmXvQKVhLwmXIvz8OQBWq5wAhih6NjfzJk2iHfeSH/ouQ2fdRVlJC9hyNYmDgsl3zWBjS1/d/ckKia3KGVWcFCBgArhUuZXF4IEEGv21snyNCsY/Z0OHRDww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCE8QvsEwiQeefXH2IOEu+LdEJgeMDHIVnqCoS5DHmo=;
 b=er2ILm3vRwfDX3SufZYpTM6i/oyaGmYew5fGOTFrzUKhqdiNfIEGN0sElbb0HtsTPI4tDPpECZwmWMObChFGB8v7XabjywYDedwxxKQXZf/kPjWoerA4OGmpIitgp3bG18d5lGru/8vaILlp7xCOVjWocFmvbleAmObL8eoZa0oq/zmjWUcX8ORAxsTZIQYfCEzZjxvn9BWiwcZZxzChEzNOjNTPdr1VRDN5b19UsVw/q1Qfkq4Y8CabUnr5XzH00K81lBAZ4pW36Yv0tK0CESYr+yJ1Dau2mvkReI0AGRkModjWIQipWaD5l4tLWGtJEMF2sa6GmvttzZqJ12x6/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCE8QvsEwiQeefXH2IOEu+LdEJgeMDHIVnqCoS5DHmo=;
 b=hQKlUDZqwRWGqDofQ9Rlq33VCbaLep0VFprznA7iYMZpIhZ+aUlReMULsh9WrpJ14IYRScxwFeB2Q2fuAvH6hzEI1aM9lnf+lIisL/4K34RTFWv/9rljF9nhmuA3zS5oEQ2jRry7fUGr6oC2HpemUbB5WUvufh8fWtju8+k+1jA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3acdce9dd74609d8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0ybR/N63Puz6e+XV2Za72ntLfE6E9iFRnCLmzidomh/qNdbiKBzEMNxWcAYmvAeUd8Hh+ZVG4CjTpXBQXaq9pp0/PjiwuMkNz/Yu3gtZ0rdmzzG2OTwhZe+i1AMldBz6NMoBNjS1aq1xr/j1Hy6OU4ud6yV4SMaNl4OK9CwCTlG1PqTTRjcdZ+ibHYLZv4mJQyZZHidPLEYZXrpPTXUGzb5nH8+bTe0irGoz6HGyOIrYfDcG84OHWJNqm5eLr0ZnDeyzdKWgTciBpU0JEVPUcC2WAI47BWxrMVVtOyr3SKikC6hkdRBY9yhjWWSWMX1inQ3QzsoM7tduBjccd0TBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCE8QvsEwiQeefXH2IOEu+LdEJgeMDHIVnqCoS5DHmo=;
 b=AWYpEjuptvx83JOzr5e+NOUaV9DBtLQ1yQJJheGRVql66DesV9UuTodF7cQqJa4hlXb8yoKpcKihhvwU/XX+YD0hjWiJDRLHvI9wzfuGAuTSuVuID1zjcRnfxve8aS54oYPI5Xvf+jVJIh8QWcjZvAaVwHMi7QGwxjQ7OLQG7xy3IucD9ygqq7fV+dekQGpr6+ZPkQhVmDeaGF3tgseKz8ZKJ5AcjwqL/ATwIGkRjnbWq3Sl1oH0u9KWOZx67UcvjARgwx59ZhpUlh4rEva4e+Qd5x3Zhk/E9FY8WEyjHnDicws6Km9aLKfjvbObRW3vMZZ8CQlcpfRj/ToGrrbBpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCE8QvsEwiQeefXH2IOEu+LdEJgeMDHIVnqCoS5DHmo=;
 b=hQKlUDZqwRWGqDofQ9Rlq33VCbaLep0VFprznA7iYMZpIhZ+aUlReMULsh9WrpJ14IYRScxwFeB2Q2fuAvH6hzEI1aM9lnf+lIisL/4K34RTFWv/9rljF9nhmuA3zS5oEQ2jRry7fUGr6oC2HpemUbB5WUvufh8fWtju8+k+1jA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 12/13] xen/device_tree: Introduce function to merge
 overlapping intervals
Thread-Topic: [PATCH v2 12/13] xen/device_tree: Introduce function to merge
 overlapping intervals
Thread-Index: AQHainObwzEJT+Mf6kG9My8yFKsem7Fi1oaA
Date: Thu, 11 Apr 2024 09:50:51 +0000
Message-ID: <C42AED6D-CD32-4829-82B1-F4213E1FD294@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-13-luca.fancellu@arm.com>
In-Reply-To: <20240409114543.3332150-13-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB7884:EE_|AMS0EPF0000019D:EE_|AS8PR08MB9480:EE_
X-MS-Office365-Filtering-Correlation-Id: 22cc4c27-6061-45d7-9896-08dc5a0ce95c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NuQLX/g1TRduONSGnPrH5k1hMHrFgSKhXfSNyNe+q+jrdFrlpQNv22YwzIIWfqkJ6rLTlrHCSc3jfZQEIvszZ9JnLdqoIl8nbghFHcXwmfOlB2yOgB6ACwyOieW//A/vCfp5wg0fx6PXdulH08tGeVxpG6mPKNJU6uL6TViaHlAA2XsyhVp9jtp8gAZw0Zx/4VnnSzgzv119BUIbu/av+rSRFyIvdVv8BFZi1DRvR29I7uvFZ40YaLs/4ne4qU2WA+JRl96pHO3PlPRb8HnUxfTHSINpAyWb26ouzocSP0lsLCRY2dSKoJpPiaD9OBKjW74NeIF+q3o2mCtnQVzrLPZnppsi965EzApxJKLzZWP5bZKlJJSCMJemZ/UZkYFqyBMzrqClRk75Vn24AMAjd1GQREM1O3S/VIv4+sqOD0kIj6zS8RqQpUs7Vy6AJ+n/jfDEhC+8xSbmO12JKhpje4Je29sN13JYhX4+H2YfIvJ9GXdFw83YIjj5DMZ9zBhrLO0Kitpbl+PSBwsxqzuL5aSxka/maeApC/9uAhSSGo2SXBs3WCwsNsrDY4nlrO6tzphKYSHmm+vSBykaTqcR1i5D5YvQc/F4JOt35LaI/Ry1jbGtjaMe+gLNrGldqKLi3g7lh69OHwR0a9mAHO/1t5Uim+Lj2oiNNuTf8IWY/6vs+rKMqx3uUqtbdN2XtTdyzqdf2oVaW/doASLa3QQa9HcrTJpD1xAe+Qmm2MuGTdU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A4857D5EA68FF4A85B91ED741D94A84@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7884
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3b794793-8854-48ec-4a5d-08dc5a0cdf82
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Br6Em3Uuke5l5541y6FehOQ69HValTmraSjml+/qtMgH4/EmZ7Vxnqj3iUvUqcH/H4IOlMEXqMDllxr3mRwNLjM+jYEBwKZ76CztChqcpK+iMdib2k1WbWMJL55W1XE2bvZytLVic4PW5SNRkxfzwhzYF/J13w1e+/0zzEMCz5daRA0cIGt3WG90jzbV3IMu3AEO9lGHHhiEvK5MYtv53mTVOX1L45QZIF+LcMRUra2mLKJLZzpJeuKb3RJFTKRxaPqWYuGl1ba6buyHPvyHU65+pVSab4mPWUlUgyT4L6MYVFhETHUjJMcwq+edPYcCvauE1UPXACafAPnD2T0d9w4UWbQh8QCJ3ywdWJpMvm5puGqhUwB5Aaj+q8Ol+eYVbSe3AZaM3aV3GrXlMwWk5/1Jb/m1X9e417NTjnliRHnHzPJtwwd6nw9jtNSWSbydnKBdOiaW1geDFD1wvT6Swb607fEgHxhz02Tls3V/19e75yBrOl6EGsDjkrPk7KQI9BBzdrlcdndmaKYNP3cmANczjCZRxjfq7sLalFlr6ipTgDez/n9cQpYAxVWnx3cbIFeqMX0O/IZJR+8huunk7zMswKX19gSse0wePBNrHrp6f/2cnNfi9m1qzAQLlbm1OP1IePwS2GiqVNNJ70UcH9oL6c8oOEbe/yw10SOFQSAzKmge2KGpKCtDH87DEE8Z2ZFTJSsCsq9LyTTi0QiDrJjlKQtomUn1KiJyuggFw/99r3gDQLCX6ZIh3sNAdrSh
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 09:51:08.0409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22cc4c27-6061-45d7-9896-08dc5a0ce95c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9480

DQoNCj4gT24gOSBBcHIgMjAyNCwgYXQgMTI6NDUsIEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFuY2Vs
bHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBJbnRyb2R1Y2UgYSBmdW5jdGlvbiB0aGF0IGdpdmVu
IGFuIGFycmF5IG9mIGNlbGxzIGNvbnRhaW5pbmcNCj4gKGFkZHJlc3Msc2l6ZSkgaW50ZXJ2YWxz
LCBtZXJnZXMgdGhlIG92ZXJsYXBwaW5nIG9uZXMsIHJldHVybmluZw0KPiBhbiBhcnJheSB3aXRo
IG5vIG92ZXJsYXBwaW5nIGludGVydmFscy4NCj4gDQo+IFRoZSBhbGdvcml0aG0gbmVlZHMgdG8g
c29ydCB0aGUgaW50ZXJ2YWxzIGJ5IGFzY2VuZGluZyBvcmRlcg0KPiBhZGRyZXNzLCBzbyB0aGUg
c29ydCgpIGZ1bmN0aW9uIGFscmVhZHkgaW5jbHVkZWQgaW4gdGhlIGNvZGViYXNlDQo+IGlzIHVz
ZWQsIGhvd2V2ZXIgaW4gdGhpcyBjYXNlIGFkZGl0aW9uYWwgZGF0YSBpcyBuZWVkZWQgZm9yIHRo
ZQ0KPiBjb21wYXJlIGZ1bmN0aW9uLCB0byBiZSBhYmxlIHRvIGV4dHJhY3QgdGhlIGFkZHJlc3Mg
ZnJvbSB0aGUNCj4gaW50ZXJ2YWwuDQo+IFNvIGFkZCBvbmUgYXJndW1lbnQgdG8gdGhlIHNvcnQo
KSBmdW5jdGlvbiBhbmQgaXRzIGNvbXBhcmUNCj4gY2FsbGJhY2sgdG8gaGF2ZSBhZGRpdGlvbmFs
IGRhdGEgYW5kIGJlIGFibGUgdG8gcGFzcywgaW4gdGhpcw0KPiBjYXNlLCB0aGUgYWRkcmVzcyBs
ZW5ndGguIEluIGNhc2UgdGhlIGFyZ3VtZW50IGlzIG5vdCBuZWVkZWQsDQo+IE5VTEwgY2FuIGJl
IHByb3ZpZGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5j
ZWxsdUBhcm0uY29tPg0KPiAtLS0NCg0KSGkgYWxsLA0KDQpJ4oCZdmUganVzdCBzcG90dGVkIGFu
IGlzc3VlIHdpdGggdGhlIGFsZ29yaXRobSwgdGhlIGZpeCBpcyB0aGlzIG9uZToNCg0KZGlmZiAt
LWdpdCBhL3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYyBiL3hlbi9jb21tb24vZGV2aWNlX3RyZWUu
Yw0KaW5kZXggMjQ5MTRhODBkMDNiLi4yNjIzODVhMDQxYTggMTAwNjQ0DQotLS0gYS94ZW4vY29t
bW9uL2RldmljZV90cmVlLmMNCisrKyBiL3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYw0KQEAgLTIz
NjAsNiArMjM2MCwxMCBAQCBpbnQgX19pbml0IGR0X21lcmdlX292ZXJsYXBwaW5nX2FkZHJfc2l6
ZV9pbnRlcnZhbHMoX19iZTMyICpyZWcsIGludCAqbnJfY2VsbHMsDQogICAgICAgICAgICAgX19i
ZTMyICp0bXBfbGFzdF9jZWxsX3NpemUgPSBsYXN0X2NlbGwgKyBhZGRyY2VsbHM7DQogDQogICAg
ICAgICAgICAgZHRfc2V0X2NlbGwoJnRtcF9sYXN0X2NlbGxfc2l6ZSwgc2l6ZWNlbGxzLCBuZXdf
c2l6ZSk7DQorDQorICAgICAgICAgICAgLyogTGFzdCBpbnRlcnZhbCB1cGRhdGVkLCBzbyB0aGUg
ZW5kIGlzIGNoYW5nZWQgKi8NCisgICAgICAgICAgICBlbmRfbGFzdCA9IHN0YXJ0X2xhc3QgKyBz
aXplX2xhc3Q7DQorDQogICAgICAgICAgICAgLyoNCiAgICAgICAgICAgICAgKiBUaGlzIGN1cnJl
bnQgaW50ZXJ2YWwgaXMgbWVyZ2VkIHdpdGggdGhlIGxhc3Qgb25lLCBzbyByZW1vdmUgdGhpcw0K
ICAgICAgICAgICAgICAqIGludGVydmFsIGFuZCBzaGlmdCBsZWZ0IGFsbCB0aGUgcmVtYWluaW5n
IGVsZW1lbnRzDQoNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KTm93LCBJ
IHdvdWxkIGxpa2UgdG8gd3JpdGUgc29tZXRoaW5nIGFib3V0IHRoZSBhbGdvcml0aG0gdG8gZWFz
ZSB0aGUgcmV2aWV3ZXJzLA0KdGhlIHByb2JsZW0gaXMgdGhhdCB3ZSBoYXZlIHNvbWUgaW50ZXJ2
YWxzIGFuZCB3ZSB3b3VsZCBsaWtlIHRvIG1lcmdlIHRoZSBvdmVybGFwcGluZw0Kb25lcywgYSBz
aW1wbGUgYWxnb3JpdGhtIGNhbiBiZSBmb3VuZCBoZXJlOiBodHRwczovL3d3dy5pbnRlcnZpZXdi
aXQuY29tL2Jsb2cvbWVyZ2UtaW50ZXJ2YWxzLw0KDQpMaW1pdGF0aW9uIG5vdyBpcyB0aGF0IHdo
ZW4gbWVyZ2luZyB0aGUgaW50ZXJ2YWxzLCB3ZSBkb27igJl0IHdhbnQgdG8gZXhjZWVkIHRoZSBz
cGFjZSBuZWVkZWQNCnRvIHN0b3JlIHRoZSBpbmZvcm1hdGlvbiwgZm9yIGV4YW1wbGU6DQoNCnNp
emVjZWxsczogMSAobWVhbmluZyBvbmUgX19iZTMyLCA0IGJ5dGUpDQpJbnQxOiBzdGFydCAweDAs
ICAgICAgICAgICAgICAgICBzaXplIDB4RkZGRkZGRkYNCkludDI6IHN0YXJ0IDB4RkZGRkZGRkYs
ICBzaXplIDB4MTAwMA0KDQpXZSBjYW7igJl0IG1lcmdlIHRoZW0gYmVjYXVzZSB0aGUgbmV3IHNp
emUgd291bGQgYmUgb3ZlciA0IGJ5dGUuDQoNCkR1cmluZyB0aGUgZGV2ZWxvcG1lbnQgb2YgdGhp
cyBhbGdvcml0aG0gSeKAmXZlIHByb3RvdHlwZWQgaXQgaW4gUHl0aG9uLCBJ4oCZbGwgYXR0YWNo
IG15IHNjcmlwdCBoZXJlDQpzbyB0aGF0IGl04oCZcyBlYXNpZXIgdG8gdW5kZXJzdGFuZDoNCg0K
IyEvdXNyL2Jpbi9lbnYgcHl0aG9uMw0KDQpkZWYgbWVyZ2VfaW50ZXJ2YWxzX2lucGxhY2UoaW50
ZXJ2YWxzLCBzaXplX2xpbWl0KToNCiAgICBtZXJnZWQgPSBpbnRlcnZhbHNbOl0NCiAgICBsYXN0
X2lkeCA9IDANCiAgICBpID0gMQ0KICAgIGNvdW50ID0gbGVuKG1lcmdlZCkNCg0KICAgIGlmIGNv
dW50ID09IDE6DQogICAgICAgIHJldHVybiBtZXJnZWQNCg0KICAgIGxhc3RfY2VsbCA9IG1lcmdl
ZFtsYXN0X2lkeF0NCiAgICBzdGFydF9sYXN0ID0gbGFzdF9jZWxsWzBdDQogICAgc2l6ZV9sYXN0
ID0gbGFzdF9jZWxsWzFdDQogICAgZW5kX2xhc3QgPSBzdGFydF9sYXN0ICsgc2l6ZV9sYXN0DQoN
CiAgICB3aGlsZSBpIDwgY291bnQ6DQoNCiAgICAgICAgc3RhcnRfY3VycmVudCA9IG1lcmdlZFtp
XVswXQ0KICAgICAgICBzaXplX2N1cnJlbnQgPSBtZXJnZWRbaV1bMV0NCiAgICAgICAgZW5kX2N1
cnJlbnQgPSBzdGFydF9jdXJyZW50ICsgc2l6ZV9jdXJyZW50DQogICAgICAgIG92ZXJsYXAgPSBl
bmRfbGFzdCA+PSBzdGFydF9jdXJyZW50DQogICAgICAgIG5ld19zaXplID0gbWF4KGVuZF9sYXN0
LCBlbmRfY3VycmVudCkgLSBzdGFydF9sYXN0DQogICAgICAgICNwcmludCgoZiJsYXN0ICh7c3Rh
cnRfbGFzdH0se2VuZF9sYXN0fSksIg0KICAgICAgICAjICAgICAgIGYiIGN1cnIgKHtzdGFydF9j
dXJyZW50fSx7ZW5kX2N1cnJlbnR9KSwiDQogICAgICAgICMgICAgICAgZiIgbmV3c2l6ZToge25l
d19zaXplfSINCiAgICAgICAgIyAgICApKQ0KDQogICAgICAgICMgSWYgdGhlIGN1cnJlbnQgaW50
ZXJ2YWwgZG9lc24ndCBvdmVybGFwIHdpdGggdGhlIGxhc3Qgb25lLCBvciBldmVuIGlmDQogICAg
ICAgICMgdGhleSBvdmVybGFwIGJ1dCB0aGUgY29tcHV0ZWQgbmV3IHNpemUgd291bGQgYmUgb3Zl
ciB0aGUgaW1wb3NlZA0KICAgICAgICAjIGxpbWl0LCB0aGVuIGFkdmFuY2UgdGhlIGxhc3QgZWxl
bWVudCBieSBvbmUgcG9zaXRpb24NCiAgICAgICAgaWYgKG5vdCBvdmVybGFwKSBvciAob3Zlcmxh
cCBhbmQgbmV3X3NpemUgPiBzaXplX2xpbWl0KToNCiAgICAgICAgICAgICNwcmludCgiYWR2YW5j
ZSBsYXN0IikNCiAgICAgICAgICAgIGxhc3RfaWR4ICs9IDENCiAgICAgICAgICAgIGxhc3RfY2Vs
bCA9IG1lcmdlZFtsYXN0X2lkeF0NCiAgICAgICAgICAgIHN0YXJ0X2xhc3QgPSBsYXN0X2NlbGxb
MF0NCiAgICAgICAgICAgIHNpemVfbGFzdCA9IGxhc3RfY2VsbFsxXQ0KICAgICAgICAgICAgZW5k
X2xhc3QgPSBzdGFydF9sYXN0ICsgc2l6ZV9sYXN0DQogICAgICAgIGVsc2U6DQogICAgICAgICAg
ICAjcHJpbnQoIm1lcmdlIikNCiAgICAgICAgICAgICMgU2V0IG5ldyBzaXplIGZvciB0aGUgbGFz
dCBlbGVtZW50LCBtZXJnaW5nIHRoZSBsYXN0IGludGVydmFsIHdpdGgNCiAgICAgICAgICAgICMg
dGhlIGN1cnJlbnQgb25lDQogICAgICAgICAgICBtZXJnZWRbbGFzdF9pZHhdID0gKHN0YXJ0X2xh
c3QsIG5ld19zaXplKQ0KICAgICAgICAgICAgIyBVcGRhdGUgbGFzdCBlbGVtIGludGVydmFsIGVu
ZA0KICAgICAgICAgICAgZW5kX2xhc3QgPSBzdGFydF9sYXN0ICsgbmV3X3NpemUNCiAgICAgICAg
ICAgICMgVGhlIGN1cnJlbnQgaW50ZXJ2YWwgKGkpIGlzIG1lcmdlZCB3aXRoIHRoZSBsYXN0LCBz
byByZW1vdmUgaXQgYW5kDQogICAgICAgICAgICAjIHNoaWZ0IGxlZnQgYWxsIHRoZSByZW1haW5p
bmcgaW50ZXJ2YWxzDQogICAgICAgICAgICBtZXJnZWQgPSBtZXJnZWRbOmldICsgbWVyZ2VkW2kr
MTpdDQogICAgICAgICAgICAjIE5vdyB0aGUgYXJyYXkgaGFzIGxlc3MgZWxlbWVudCBzaW5jZSB3
ZSBtZXJnZWQgdHdvIGludGVydmFscw0KICAgICAgICAgICAgY291bnQgLT0gMQ0KICAgICAgICAg
ICAgIyBOZXh0IGl0ZXJhdGlvbiBuZWVkcyB0byBzdGFydCBmcm9tIHRoZSBjdXJyZW50IGluZGV4
LCBza2lwDQogICAgICAgICAgICAjIGluY3JlbWVudA0KICAgICAgICAgICAgY29udGludWUNCiAg
ICAgICAgaSArPSAxDQoNCiAgICByZXR1cm4gbWVyZ2VkDQoNCg0KZGVmIHByaW50X2ludGVydmFs
KGludGVydmFscyk6DQogICAgcHJpbnQoIlsiLCBlbmQ9JycpDQogICAgZm9yIGludGVydmFsIGlu
IGludGVydmFsczoNCiAgICAgICAgcyA9IGludGVydmFsWzBdDQogICAgICAgIHN6ID0gaW50ZXJ2
YWxbMV0NCiAgICAgICAgcHJpbnQoZiIgKHtzfSx7c3p9KSAiLCBlbmQ9JycpDQogICAgcHJpbnQo
Il0gLT4gIiwgZW5kPScnKQ0KICAgIHByaW50KCJbIiwgZW5kPScnKQ0KICAgIGZvciBpbnRlcnZh
bCBpbiBpbnRlcnZhbHM6DQogICAgICAgIHMgPSBpbnRlcnZhbFswXQ0KICAgICAgICBlID0gaW50
ZXJ2YWxbMF0gKyBpbnRlcnZhbFsxXQ0KICAgICAgICBwcmludChmIiAoe3N9LHtlfSkgIiwgZW5k
PScnKQ0KICAgIHByaW50KCJdIikNCg0KDQpkZWYgbWFpbihhcmd2KToNCiAgICBsaW1pdD0yMA0K
DQogICAgIyBBcnJheSBvZiBpbnRlcnZhbHMgKHN0YXJ0IGFkZHJlc3MsIHNpemUpDQogICAgI2Jh
bmtzID0gWygwLDIpLCAoNSwxKSwgKDAsMTApLCAoMTAsNyksICgyLDYpXQ0KICAgIGJhbmtzID0g
WygwLDIwKSwgKDIwLDUpLCAoMTAsMTUpLCAoNSwxNSldDQoNCiAgICBmb3IgaW50ZXJ2YWwgaW4g
YmFua3M6DQogICAgICAgIGlmIGludGVydmFsWzFdID4gbGltaXQ6DQogICAgICAgICAgICByYWlz
ZSBFeGNlcHRpb24oZiJ7aW50ZXJ2YWx9IHNpemUgPiBsaW1pdCAoe2xpbWl0fSkiKQ0KDQogICAg
IyBTb3J0IGJ5IHN0YXJ0IGFkZHJlc3MgYXNjZW5kaW5nIG9yZGVyDQogICAgYmFua3Muc29ydChr
ZXk9bGFtYmRhIGE6IGFbMF0pDQoNCiAgICBwcmludCgiSU4gKHNvcnRlZCkgWyhzdGFydCxzaXpl
KV0gLT4gWyhzdGFydCxlbmQpXSIpDQogICAgcHJpbnRfaW50ZXJ2YWwoYmFua3MpDQoNCiAgICBi
YW5rcyA9IG1lcmdlX2ludGVydmFsc19pbnBsYWNlKGJhbmtzLCBsaW1pdCkNCg0KICAgIHByaW50
KCJPVVQgWyhzdGFydCxzaXplKV0gLT4gWyhzdGFydCxlbmQpXSIpDQogICAgcHJpbnRfaW50ZXJ2
YWwoYmFua3MpDQoNCg0KaWYgX19uYW1lX18gPT0gIl9fbWFpbl9fIjoNCiAgICBtYWluKHN5cy5h
cmd2WzE6XSkNCg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

