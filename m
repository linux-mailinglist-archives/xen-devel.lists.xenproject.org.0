Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A08C6956
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722476.1126460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GG8-0006gt-Vw; Wed, 15 May 2024 15:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722476.1126460; Wed, 15 May 2024 15:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GG8-0006f7-St; Wed, 15 May 2024 15:09:36 +0000
Received: by outflank-mailman (input) for mailman id 722476;
 Wed, 15 May 2024 15:09:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/K8o=MS=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1s7GG6-0006f1-TO
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:09:35 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260d::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22ab411c-12cd-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 17:09:33 +0200 (CEST)
Received: from AM0PR03CA0079.eurprd03.prod.outlook.com (2603:10a6:208:69::20)
 by PAXPR08MB7336.eurprd08.prod.outlook.com (2603:10a6:102:223::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 15:09:31 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:208:69:cafe::c) by AM0PR03CA0079.outlook.office365.com
 (2603:10a6:208:69::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Wed, 15 May 2024 15:09:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7587.21
 via Frontend Transport; Wed, 15 May 2024 15:09:30 +0000
Received: ("Tessian outbound daa456608199:v315");
 Wed, 15 May 2024 15:09:30 +0000
Received: from a741a34fe2d8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0BA9C8B2-CB1E-4CC5-9F0C-5E3ADFA4B803.1; 
 Wed, 15 May 2024 15:08:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a741a34fe2d8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 May 2024 15:08:36 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DU2PR08MB10279.eurprd08.prod.outlook.com (2603:10a6:10:46e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 15:08:33 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3a3a:3b79:47ad:2313]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3a3a:3b79:47ad:2313%4]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 15:08:33 +0000
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
X-Inumbo-ID: 22ab411c-12cd-11ef-909d-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Sm+y31RBMu6gwEEZ2AFnf0aDjLOC0MqsB3hiBJ9CSMX8o/RtitL28FdJWYCKk/RjMPq/X2Ed/bAEq+qvHeyJbnKjZFKY/NAZNGluAktLVPPX/jl7i2X7PqNceu+/pYZL/Ut+uijapF58OjXAa8+DDPvn5oGzswgv7BTozQgL6KCo9f6w+wk4d0Z79omrfBnY6l3Q3/0VRx5b+Cv6fVG9AMHEToBghRc2DedP7aq/gO55NyhQguWmRmRNAsGsSUCTTxx6ir8JX91DntFxnP/EwhCNUe3jYMU78YdmO47qg+Z0uqprLo2lsOfy8BRXhZIKmj13UNJvij6yE/ri61GAVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/+9rMwEnhWdLab1Y2cQ+a1OelbnrTzOuGzbl5m1z7U=;
 b=NRjART/6JllAJmdbKzy7zFpbqiPGkaToo98CAKDAPqHFRmQq57m1tdWFrCw/RaREW8Q+dUgsq9CplM1OlTGaOlZ0H1ZGnDkpkh0F1ILJhlItX8g0Ogrt1vi7+HAonTnazNI8f7DMsZGBh0/Kiv1flWakeIzZB7iTrsN/vi/2nnXnJJfDNjL5UMIUkYflTZoofYxvs7RmLG//GHqFwjeaL+H4tWaFz/zPl+cVwTMAwdrN2p0Bhd82eEGTlI7C3odsgWJ0aY1XEIY4pHCA6E/zYNj3ajbFbfPZS6DGtt28LumN9I1sC/LqX2/wmGOzjB7WluQa9OaU6qCaoX3YHflW/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/+9rMwEnhWdLab1Y2cQ+a1OelbnrTzOuGzbl5m1z7U=;
 b=JMQ9NoHec/7vgaYYAZMhWEbaw9K2P8e1RRH1P0lQ6tQlFvJijZR0kRtbf/76oW1OTw4g/WUeZhsyZlgWyHlxj8NVMaZLH818zcvXCWsOhhSieanEkvEXFC+7sIaVg30UxPJd7qS5K+1sghVEDVEHvdoLlPQR6vXv9Y41orqfezA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 728256f609e0e07e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDqZa6dtA3XKpy1IMFxjryF35G9wJV0sZBxXxg4aRqcH0Do8Dhk7du/LYuqmu0wTazFoeRSB+ETZ3yuehzEE5rAroq1hXoL1cHLMCmAdUflDvlFcKakWkwQx2N3Gd9t6IzlSLbFDHvi6fU+3aNFGP6n9lk+PtCvcHK4oNtlDDHH7LRjcpcPUrTa6R4dIvGdzpp7c6nF+xsIHdeAIAFWf5gxVN4dNXGWkpV8mKlYt1sxvExyV02T4GRKx+X1GJuMFxoLy2LHxDF9rhdsCLdtuTSWTKWidQaqh2XcxLBBG+XiaHVb0JhFCBxQQsH/uOXujkXVrzq7WCos/y8Z8/m2SDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/+9rMwEnhWdLab1Y2cQ+a1OelbnrTzOuGzbl5m1z7U=;
 b=hD0oxacsan4XDhhOxP2JQCB6CBt+QUwBVQaR+/wyNZ0hmHNtLxLt/t6dsUUTPYW78a8rapy7Nx3CO4vzcBH9Lrzc1W/J5uMc4CS0Lb7Eqt7oRVOoMOyuU+FZ7vhYp6ZaEx6mMfuaefXrDbgTsSVBZw1JVB1PrphB0ywTlg9jRaNr+m/3jVUx9Tfwggq81X9A6RQz2Sj+s8DnRZLhhB0b99Zm+9QMBsuLDFtv1JsfDFF9E5cyh16U/yc4yxza40Jih3UA4Rfali1sTXuK1SLmf+7Qre+udkeW5kV4pZcaBxDf/b09AWgYfLkJkF25QI+jCk3Hn/03wKClEjKxAblxHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/+9rMwEnhWdLab1Y2cQ+a1OelbnrTzOuGzbl5m1z7U=;
 b=JMQ9NoHec/7vgaYYAZMhWEbaw9K2P8e1RRH1P0lQ6tQlFvJijZR0kRtbf/76oW1OTw4g/WUeZhsyZlgWyHlxj8NVMaZLH818zcvXCWsOhhSieanEkvEXFC+7sIaVg30UxPJd7qS5K+1sghVEDVEHvdoLlPQR6vXv9Y41orqfezA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>
Subject: Re: [PATCH v9 04/15] xen/bitops: put __ffs() into linux compatible
 header
Thread-Topic: [PATCH v9 04/15] xen/bitops: put __ffs() into linux compatible
 header
Thread-Index: AQHan55fe9tWwhK0EkCZuWBTgB6qOLGYdCCA
Date: Wed, 15 May 2024 15:08:33 +0000
Message-ID: <69E3438E-1AA0-430B-9D92-B55DC0261D40@arm.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
 <4ef575389520479cee0a79fccfc20e6891594d61.1714988096.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <4ef575389520479cee0a79fccfc20e6891594d61.1714988096.git.oleksii.kurochko@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|DU2PR08MB10279:EE_|AM4PEPF00027A5D:EE_|PAXPR08MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e185af-1bcf-4f28-c594-08dc74f10595
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|7416005|1800799015|366007|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?N0lJK1ltQW5wcFFrTkZpWnJVRUE5RnVJamthREQ5Zm1IbGo2ZFJtL3liMHpX?=
 =?utf-8?B?bkpYdWpaRjdPN215Ym5UbjBtVkpMRE5NNXYzVU8yVHVtWjNXb0huVmV4NHlW?=
 =?utf-8?B?dy9KeER0eWw2aWlGMzZwKzBaZmNtSG1MVHVXbUtUR1d3eFM3ZVBmbUM2bjdo?=
 =?utf-8?B?czFteEZDVXRpSzRUT2RlaDN3KzFDeXJCODYzbWk0RTd6alJiam16TlYycXF4?=
 =?utf-8?B?QUVkcWlZWFcyVGVEMWhpVUpNSi9qbm5zL0hEenhlOFdKazJjWTdtZHhKZ0lZ?=
 =?utf-8?B?MmhLZW12Sm9MRUE0VVlJNWUzbW5aWGZNdE9VZE1ZWHJCNUo4WU9JU1lJNGk5?=
 =?utf-8?B?Z0VlcVFpR3hraGV2RXNiTDhNS0I4d3JtM0RiUXliakdNbllzM1RKYVR1T25Y?=
 =?utf-8?B?VkdzbXQxc3gwdG1Wd3RlQVN0U25RVndOZHNFdFltRElBV1cyNlE4WTNjN0Zs?=
 =?utf-8?B?R3ZUT1Flb1cwMStoM3pyYXlHb0xoWTdWY1ZlRkVZZWdWSGV5aDhmbkdWZVVV?=
 =?utf-8?B?NHVzVHpzQ1JnYjVtMmY5aTlmYjlwOGtEbWUveUJVdWhyTG1kdGg0Vmg2RGht?=
 =?utf-8?B?b05lY0oycFh5Q1dVZy8raEtoM3NEY2U3L1ZaQ2pNaXFsUi9IUFFMUlRGUWR4?=
 =?utf-8?B?OXZqOGc2L1FRRmowb3JZUk9QK2l1aExwcnRucWxwdlcrNmZ2aHFwNWIrTXBt?=
 =?utf-8?B?VnAydmNXbzNqc2xybmVBVTd1TWNPZDVzN0V0REJxanhScE85TFYvMWZoQnFk?=
 =?utf-8?B?TE1PQzcrUTdKTTJlNmVZeGZJZXN0WHRrU0JyVEwvaWYydmF3Z0xNanVMbnp4?=
 =?utf-8?B?Q2dKS3hGSlQweXdBUE9UUExuL2ZPc1FIcHBLYnlPcjl1SGtRVG9LTGdSczN1?=
 =?utf-8?B?UWYzZDhSYXJETjJ3MjA0YkN2NkJMVWxDOUZSSFR2dCtVRmhqdzYwdlk5R0Jk?=
 =?utf-8?B?T2pLdkduSVJhazloQ2tyUTAwTjVxYnZnOWkyRTlqRFJXb3ZjMkpqcVJmT2ox?=
 =?utf-8?B?aDB4S2hQNzdrdHNWa3RvU2p3RjVvdmJuaFp5UWhKQkxVS2orZENhQmgxelRn?=
 =?utf-8?B?c3FjbHJ0ZTJuR2VSWDVEbjRsYXlveXFoYnVnVFFjSWhvYVBxalhIMkZrMlN5?=
 =?utf-8?B?b2J5UlVwVUl2QUNQUkE2THd4Mm13SW9uZ1BFczl4SDd0ZlQrS2ZMOFgvQjd5?=
 =?utf-8?B?QnhCVGdPbXJKT1NURDIyaEpwRVVVUHV3K2oydVlPaDlveWhpemhRWFJCY0o1?=
 =?utf-8?B?R3lQcjcvSlVteEhRSG9CU2tyd3NuaXNiM0prNC9sS3FldGw5RDNKQXljTmND?=
 =?utf-8?B?Y3gyRi9wQzJjVXZPYWxQN3FXMndUdlpwSC80N0dSK1lXOFp0YS8yblFzMkhS?=
 =?utf-8?B?NE5ERkdGRCtsVnQ3dHppQWpOTTR1Q25Ed3d0WC9CdkdJcjZEZUs0Q2xiSmFE?=
 =?utf-8?B?OFI4WWdFWHk3WHhTZVBoc05wYitVRFE4OHlqUmxHNUZFVzNBeWp3Z1NPMU1U?=
 =?utf-8?B?Ti9LbEo2bVQ4eHg5SjVaeFlTVXJJK1g5bUtRQnQ1ZmJTcGlkalk0bFdsWThM?=
 =?utf-8?B?ZzRaaTl5Mk5JOGp3YTFpZVpyMVR6eUlwR2t1bGNsT1hZNWg3T1hYelUyWC83?=
 =?utf-8?B?NTVhdE8rVFRMb0JZRCtLdmo5NzRBLy9zRmZJNnYxUDZTbUdITlhoTXY1ZFZi?=
 =?utf-8?B?VzF6OURIeUZKZmlZQkxOdGFUbk1SS1hlV20zRXkzeTZFbXJOOVl0WXI3emtu?=
 =?utf-8?B?YTYzRFI1TnRKNlNRSENFUFE2TTFmbTFISDl3SERHclcrcTZ3ck1xL1BhcGJO?=
 =?utf-8?B?M0gyZGh4ZmR3dUpSdVBhdz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <78D7E8EFF3274F4B88852585BB58CEF6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e9124b2-f735-4128-bd6d-08dc74f0e375
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017|35042699013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWpQcGdZSmFENExhL0J3RGVWc3Y4R05uNlFyS01WbHdvVkhoK1gwOFl1cWRa?=
 =?utf-8?B?b2NtTWdaSURRVThPU0NKeU12R0MwTWFpOU9FbFV0Nk0wRnk1TU5MNk5vMXZZ?=
 =?utf-8?B?cmNGZUdadU9ZNkJOanZQWllkMk1DdlVKT0E1UzR0YjhwRUxCQjQ0MHdTL2ZG?=
 =?utf-8?B?WHhpa1B3RXVMcHI0a0g5cm9CYTY0L1hYUFI5UkNsQ0Y1Y1d4MjdFbVIxR1Fp?=
 =?utf-8?B?K1IwMGNYWTZwcjZJUGdkbDMzSjRLdE5hT3luV1ZGMlBkUEoxbkdtQkgwV3Mx?=
 =?utf-8?B?SWpIbnZpSVpjMmR3d1NkNlh1OS81SVQwSUZYUFFGVnNrN0VCdHRxcUNUZjNU?=
 =?utf-8?B?d3lJbUlNK2VwcCtRazErT3dYRTBzN1Bqa0QvcXJVYzJ4RXY2R0lxUUkrN1p4?=
 =?utf-8?B?ZUlnZWdvMEFwd1F5Ym4xaHNKOVF2TVViZkJ4S1NkS3ZIZmV5Tm04eUNjVnZZ?=
 =?utf-8?B?OXE1UE51NFZnSDgrZnVWQ21GRlJoSkpTVzBHaTlXUG9ocFNnRklseWFxL3JM?=
 =?utf-8?B?cWduUGlGUWYyZFY1aDRnUTJvb09McEFSL0h4MWQ2RkJrK0M3ZVpCUTh2aG5Q?=
 =?utf-8?B?bU5MQWJ3ejNWYXlFbFN6OEJqdjdEMU5iaTZaMlRKTkFXSzJRUEhqL0dJWFBV?=
 =?utf-8?B?VWJXM2R1aENTT2s0R0gxOUtZbGtEUjE3UDNJVDVCOGZNaEx5eEVpZlhyUkRP?=
 =?utf-8?B?ckR0SFRzSnJVRW9XUG5USjJFeWJlanM1L0VucWRIUnVRZ1pkM0diNWJLWHpP?=
 =?utf-8?B?bjlFdjJvMWE1UFg3eTRuSG83SSsxMklNODNITW5JV0cwb2NwQmE2aVFRdlVY?=
 =?utf-8?B?Wnh1RFpEZE5FU01sTE1ITy9UOU9Ra2htSVRmWk9DNkhLR2RsMWFsc0YrYXNZ?=
 =?utf-8?B?cVBIQzZ5Yi9zaUtJOStYM0VwQ2pnVTIybXAzRjduRGtKRHl4SW9XeGgwaVhB?=
 =?utf-8?B?Um4rSkxvUWxleFVIZ29LUXd4d0N6OHEzM2NtMlR1RVdoQkdxY2JiVUI2TFJY?=
 =?utf-8?B?dzlITUhPZEdjQUhlTEVtVldkbjlxcUhKZEMzZ01iWjVDRlRDdEJVV2c0ZWRs?=
 =?utf-8?B?MU16UkJiSnJDeHJwTDF2RUo1TlpUMnJhdE54S2pXWXFKQ1lQaEdQMCtabjYr?=
 =?utf-8?B?UDRNQURWL2Y3aks4VEhLVlB1bll5dzBvV09oV2w1UWdBeGxqVy9TbXI4bWs2?=
 =?utf-8?B?eTNDYWEzTEZ0a3p1cDNQMVR6TW5oemxyQUcrbllpU3lDU0xOUFZGNUYyanhS?=
 =?utf-8?B?Q1FnME9KVXkxbXZoYzNmdVp3QTJLNGFhTkVYLzB5YmhXR1JBTGpIR3RUYmxL?=
 =?utf-8?B?bkN5NGRjTVhmOUVTSnJkeWI1NkoveHR5aG5kNmZIUFRnZkE0VDJQNG1YdTJF?=
 =?utf-8?B?Wm51MzAxbGJweTJhakZqZFJVVmpML0w5RlFGYkFsMGN6R1p4WkNIZVJMYTNZ?=
 =?utf-8?B?TXpBVkIwZ1dHNzBGSlRoTmN5VXA1SEJQcE1zMm1aWVFPREJGeDFoRHNRVkIv?=
 =?utf-8?B?MHZaTnlWTEdtUUdxNElRYm5NWjVWa2hLd25wTmRBdnU5T0hJQ0kwaWRHT0NJ?=
 =?utf-8?B?dHBucTgrbyt3UUJzeEtLRjNhai9jcXlFYzVHMTlNbVlYOWoxTXNjb1ZXYTBF?=
 =?utf-8?B?eS8wSVRpWklDWTRzQWE4akJQa2Y5NGFVRFIydGZvRnBMY1BBcmhCQlRwR29M?=
 =?utf-8?B?YllIa2EzRENHeWJvK1BzZVkvLzlEZU5vd2RTUkxxaVg5VHBsVVpJaGFRZEJM?=
 =?utf-8?B?NDEwWmpIbTFnY2ZNeEs5WmJ2eVlHWmJZQjdlNFB4eXpFTWtsWW9KZE5aVkRx?=
 =?utf-8?Q?6O2wuimYr1ZdeNLdVp+GRN2cUr54B6mNZrE3o=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 15:09:30.5972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e185af-1bcf-4f28-c594-08dc74f10595
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7336

SGkgT2xla3NpaSwNCg0KPiBPbiA2IE1heSAyMDI0LCBhdCAxMToxNeKAr0FNLCBPbGVrc2lpIEt1
cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGUgbWVu
dGlvbmVkIG1hY3JvcyBleGlzdCBvbmx5IGJlY2F1c2Ugb2YgTGludXggY29tcGF0aWJsZSBwdXJw
b3NlLg0KPiANCj4gVGhlIHBhdGNoIGRlZmluZXMgX19mZnMoKSBpbiB0ZXJtcyBvZiBYZW4gYml0
b3BzIGFuZCBpdCBpcyBzYWZlDQo+IHRvIGRlZmluZSBpbiB0aGlzIHdheSAoIGFzIF9fZmZzKCkg
LSAxICkgYXMgY29uc2lkZXJpbmcgdGhhdCBfX2ZmcygpDQo+IHdhcyBkZWZpbmVkIGFzIF9fYnVp
bHRpbl9jdHpsKHgpLCB3aGljaCBoYXMgdW5kZWZpbmVkIGJlaGF2aW9yIHdoZW4geD0wLA0KPiBz
byBpdCBpcyBhc3N1bWVkIHRoYXQgc3VjaCBjYXNlcyBhcmUgbm90IGVuY291bnRlcmVkIGluIHRo
ZSBjdXJyZW50IGNvZGUuDQo+IA0KPiBUbyBub3QgaW5jbHVkZSA8eGVuL2xpbnV4LWNvbXBhdC5o
PiB0byBYZW4gbGlicmFyeSBmaWxlcyBfX2ZmcygpIGFuZCBfX2ZmeigpDQo+IHdlcmUgZGVmaW5l
ZCBsb2NhbGx5IGluIGZpbmQtbmV4dC1iaXQuYy4NCj4gDQo+IEV4Y2VwdCBfX2ZmcygpIHVzYWdl
IGluIGZpbmQtbmV4dC1iaXQuYyBvbmx5IG9uZSB1c2FnZSBvZiBfX2ZmcygpIGxlYXZlDQo+IGlu
IHNtbXUtdjMuYy4gSXQgc2VlbXMgdGhhdCBpdCBfX2ZmcyBjYW4gYmUgY2hhbmdlZCB0byBmZnNs
KHgpLTEgaW4NCj4gdGhpcyBmaWxlLCBidXQgdG8ga2VlcCBzbW11LXYzLmMgbG9va3MgY2xvc2Ug
dG8gbGludXggaXQgd2FzIGRlY2ljZWQganVzdA0KPiB0byBkZWZpbmUgX19mZnMoKSBpbiB4ZW4v
bGludXgtY29tcGF0LmggYW5kIGluY2x1ZGUgaXQgaW4gc21tdS12My5jDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBPbGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4NCj4g
QWNrZWQtYnk6IFNoYXduIEFuYXN0YXNpbyA8c2FuYXN0YXNpb0ByYXB0b3JlbmdpbmVlcmluZy5j
b20+DQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkZv
ciBTTU1VdjMgY2hhbmdlczoNCkFja2VkLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJt
LmNvbT4NCg0KUmVnYXJkcywNClJhaHVsDQog

