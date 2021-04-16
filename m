Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E287036250B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 18:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111904.213979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXQyV-0001Pe-W9; Fri, 16 Apr 2021 16:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111904.213979; Fri, 16 Apr 2021 16:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXQyV-0001PE-Sa; Fri, 16 Apr 2021 16:05:43 +0000
Received: by outflank-mailman (input) for mailman id 111904;
 Fri, 16 Apr 2021 16:05:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZDfs=JN=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lXQyU-0001Or-Cz
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 16:05:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.52]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c10c664-d123-4823-8b7d-b9f1a868642b;
 Fri, 16 Apr 2021 16:05:37 +0000 (UTC)
Received: from AM6P192CA0046.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::23)
 by AM6PR08MB3176.eurprd08.prod.outlook.com (2603:10a6:209:46::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 16:05:35 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82::4) by AM6P192CA0046.outlook.office365.com
 (2603:10a6:209:82::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 16:05:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 16:05:35 +0000
Received: ("Tessian outbound 4ee49f77c636:v90");
 Fri, 16 Apr 2021 16:05:35 +0000
Received: from 960b9dbb921f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6329339-139F-4889-84A6-E250668077F9.1; 
 Fri, 16 Apr 2021 16:05:29 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 960b9dbb921f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 16 Apr 2021 16:05:28 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3609.eurprd08.prod.outlook.com (2603:10a6:10:42::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Fri, 16 Apr
 2021 16:05:27 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d%7]) with mapi id 15.20.4020.023; Fri, 16 Apr 2021
 16:05:27 +0000
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
X-Inumbo-ID: 6c10c664-d123-4823-8b7d-b9f1a868642b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KFReuE0FmVr3GvtQBInnd0NKFlbfuUdNy9x3RKwJ6g=;
 b=iAuoDfk+pOn7svbsemv8D1y9ZxRdzIhoJ/ztW+gbXbj2KNZPxLoCBOlBVpDHppqxAlA7EmNqugM/Epuf921zo3T7xga4AjgPmDl0VPA6vwR8oibZ1hiqRdytdFbaVLO6ZUWVN7lvaPCpBbVhXYc8H38/4T6oQJjsmTE5shuBjQE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9be9b89c10df6db4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuKpRaLkTCFwnM5nbDYbaBJZ7KRNfcTv9yMNTNNtK2Pq4W2lNtfNSNTCcHwXm3ZKYYp472ItpgT5EkUBJ0+IRa/VnDJje0XyHz+1uWK/v+d4JTxzO+cEDTgk1/coQ0htdRofqY71F6mpnKLj+xb50a+rCajBzBTWUQK1mq9MAUgpxZPqkDoceTFVo+Lz9S1Ilh43iuxE2xEUoeRkVseTIaulMyOlwuNdckURPFeV4OvHO6Xw6WxuftB7NzFsFJ075VxDXRwH7aMOB1v9VehySUVrz3oqMjagHRQ5ZZqCTuMPtdFQs3tuLitKGHOGN2a8V48H7VHqffilpbbOTjE6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KFReuE0FmVr3GvtQBInnd0NKFlbfuUdNy9x3RKwJ6g=;
 b=ktDQtScD5ROVsUQN3YQ+5sGTqsP57aJHwugM8rgHUvTg3l/LCS0qUVFUfWa7M2+otOJYFhJcLmRQJFXdidav/CyFMikKmwMBbzcaEnd0R8vzdMJDo5LCqsM9eHTitjb1BNzuUphxLZrXKkrsMggo1dZD9DBqJMObZKAkaYuh55QpYuZfh3iu50plfyjcY9BBAyViiej1EmT4PWDWuGMziLrFjPFywWIqgSQ4E6xWOtR7TkSHSmHdmee+qeGulGuH/iVy6SsH1yMhardVIKwxZT9WBIMEV7v5e8/7zjZvRq+YWTsQlMOQq7lVNdlehA/arhqarvEG/qwD9Nu5XYfcXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KFReuE0FmVr3GvtQBInnd0NKFlbfuUdNy9x3RKwJ6g=;
 b=iAuoDfk+pOn7svbsemv8D1y9ZxRdzIhoJ/ztW+gbXbj2KNZPxLoCBOlBVpDHppqxAlA7EmNqugM/Epuf921zo3T7xga4AjgPmDl0VPA6vwR8oibZ1hiqRdytdFbaVLO6ZUWVN7lvaPCpBbVhXYc8H38/4T6oQJjsmTE5shuBjQE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
Thread-Topic: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
Thread-Index: AQHXMrMxW8Hpcs9A7Ei4/6fuLjr236q3NfuAgAAHXICAAAYsgIAAC7YA
Date: Fri, 16 Apr 2021 16:05:26 +0000
Message-ID: <4C9CE5FC-551A-4F26-B975-FC7F33877FF2@arm.com>
References:
 <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com>
 <6e75d112-6cc1-4b7c-9751-4064b3250dbf@xen.org>
 <E2FE265F-B7A4-45C3-BA9C-3EF9109F8B5E@arm.com>
 <8569c856-8838-e5d1-b653-e7eb476dacdc@xen.org>
In-Reply-To: <8569c856-8838-e5d1-b653-e7eb476dacdc@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 96b44b8d-a36a-4bf5-bca5-08d900f1783d
x-ms-traffictypediagnostic: DB7PR08MB3609:|AM6PR08MB3176:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3176DF8031A36F67A9C0ED72FC4C9@AM6PR08MB3176.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xstj2cs7nTa345REmqlhpyScrfN/2xgQnRvIAGu76kGq1d2GfY3XTNUP8Uht6HUw3Uge/lWJyVfDVSzPfM+Hy8DO3fiZHD5zW8tG7IteWtFy5FB3JiMUY3e/Ize3p93me1mxvGLNTQyiBCVoS7TZilLnrC1HVAZRRhXp32YQnc6wU6m48PzqS+0xeNRHbwui3QHVZYrj2F+g0DD6Zsd92uXI6VeutU08D6o3obj6BzRCS7IIsbxAa665dA+7674K/eLtP01K9VpucVoledWVPV19LhY2XSLrv1uR1Wslm3wB9T5WnJNN1Azbnhzse/8g7KQ7jBL5MD8d19y36G/j0Nm/We+IKff1LX1GYyE5hm6YRLQiRm8/ZPeH6Kw9xsf6ySOUp/hW2U5IPhKyezF/8cD6SgCaoCjaWzPHlSE8oHJbObcRxzCfZ46R3D2OgnDMdsMPEgYNIJZH2+6hNdLXQYGEnL/sq16sAofTvL21RLUdWdB87f4Uow0Pkw3DKrcZR6Fsv5wWUbrLnFOJEo6Z2eJAdrQR4g2Ct2UDBCPF0A3AHVlmr65pTBaQ4ep9h5oHWnwiA5ZTBZvFiGps+keV3AQFgtq+SC2n4k20oUry/t2ZKYqZKSeq4xxLAJjDgPJblUT63fXNM3ZIC09RrehNzJpwl3VjbhgupSclpmbmhRc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(64756008)(36756003)(66556008)(66946007)(66476007)(186003)(66446008)(4326008)(122000001)(8676002)(54906003)(26005)(6512007)(2906002)(5660300002)(316002)(38100700002)(91956017)(2616005)(478600001)(76116006)(33656002)(53546011)(71200400001)(6506007)(6486002)(83380400001)(8936002)(6916009)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?alYrMkNlWjdORXk5bjBYUnR3UmM4aVNDL0lNUGxZVWQrRm81aTF5UFVkZjli?=
 =?utf-8?B?NFF2YVZKTnBpbXhEK0Y4OWhGQ0xvenp4SG1iNmVOdzN1Nkx4ZThFSWFMbm1u?=
 =?utf-8?B?TS93eEM1b1hRVlRhN1paeWdVaDllL1N4cUNObUlTdHlJeXNraEYvQk9YMG5L?=
 =?utf-8?B?WHczcEYzS2dwNVpDTHMrZnRuTlhFaXVlSGdBcUpNRlBWaTl3TFNsck9NVEwy?=
 =?utf-8?B?WFJ3VmpoMXlvdDMyZDdrL2NuaGtVZlMrTGZPZ3NFT1dMc0RFcmNQallNdHZN?=
 =?utf-8?B?UHhETklHSzE1NzlMM3ZLcVhJQ0dQaUlMUW9xVkNoMXovZ3FkbXhudXFIWWNk?=
 =?utf-8?B?SGY1N0pKanljR2R5cU9wUWV1ekhoNDY0S2ZraC9Ka0dOeURjaDRoRTEwaFBE?=
 =?utf-8?B?c2lkeGhISzZBR3ZFU2RCT2FId1dJL3lYMjcrKzhvL3dZa2ZRcEMzOEtVV0ZB?=
 =?utf-8?B?M3FsZGRXckZpRnVBckduc25qV0c0RFpmYmRSTy9PUmFtWFdZNmk2SE8vQ250?=
 =?utf-8?B?RzhKdUlWRVdlczl4RFNqeGx6Tk5HRW41NGxqZ0FPQVJSTlhIL0l3ZitpUTJk?=
 =?utf-8?B?NFZpajV2T3hLSFpFN1ZlaWFqN1VTWUVHVzhuQW4wci91Y0R1L1NScmVpVWlW?=
 =?utf-8?B?R2MwRFdvak56aVJQNDFFZVI3bUhUWVRFTkIyS0FHYmpJb2sxY2VtVFpVc1Vo?=
 =?utf-8?B?NnA0cEQxTUFoNFQrMTZiWVZZMVRER01XNjdzZ0Q2UUZGbWxqRG0yVldENkZV?=
 =?utf-8?B?ckJMdC9UU3orblpXeXpnc3UyOGJwcnVNa1FYSnRyYjg4MkdVTmxYVVdGZVB6?=
 =?utf-8?B?UjRIbW8xQjkycUVaWFF1QzdScG5kL05xRmZhMEVzTmNBMERZb05zTVJjV1hO?=
 =?utf-8?B?WmRtMkVKQWQrMU1JN1pmb0JjZWVoWkdYdWJEMFBibWhGQUhqWmhMcTYrMXRM?=
 =?utf-8?B?RWg0R2V2R1Y1ay8zTjlMY1NXMzBBUGo5TjluKzBScm1taGtYMXhnV0hTd1Ju?=
 =?utf-8?B?NStRNGRKY2x4YTZwa2lnaW8xaFhvUmJOVGxZNUxMTXJDVlVjcGswRkdiZjB4?=
 =?utf-8?B?K0lMSGhjQTJ1b05oK0ZBeXdWR3hDQnYwbStPZXpqVUwwemVWeFMyQ05vbm1Y?=
 =?utf-8?B?c0NCYWdiQytCV0c0UkVHNklCdEFHS3pxZ1NKTkNGQ3AwUTBDS1cvUVVsZ25o?=
 =?utf-8?B?MTVRdHkrU1V2M3kvdXVqamVWM3FpVXpod1dIZ3JJSmxSbGtrc2FnUXh2RnJK?=
 =?utf-8?B?S25iNjRhKzc0WEthWDZpSzV4UDdkUG1TQjRrNHJpWDNUZW1paE1YT0xBTG9t?=
 =?utf-8?B?akxMQzJidVllSXQ2Y21uUlh2MWMwOG5HcWswb3ZyUzhJbndhUHVZTnlOUi8r?=
 =?utf-8?B?N1g4enhiNnBvSHJjaFBkalRCS082cWFIZlVHTFNxTVhLTkJzTFlLOXpIbTN6?=
 =?utf-8?B?T3VSdlhFdUpENXQ0azRrK2tkSGh6cjBzVVB3OElBaXZPdlJCY01KckNMVWZW?=
 =?utf-8?B?TkwrSDhwNEdvTTlzV2RUSnNGOXl3R0k0eHZmQThUQ2R5RE9YYnFRN1JTcU1p?=
 =?utf-8?B?a0w4NngxdGhReGYvM0xpLzV3YklJZ3k5TjlVU3ZNU2V4bTRMdlVUVHJuRHc3?=
 =?utf-8?B?czdoMnhiSVc1Ym1kRmk1NFZzbUY5ak9hMUNuTjZzb2xrSlNydzZRL0RYVWYw?=
 =?utf-8?B?N3VLZkh2K3ppLzg1V2wreW5JQURGSkdhSXJ5aGhRZ01FY0Q4eVpPRGgvTEo4?=
 =?utf-8?Q?kc82D1IMlNOJ4hYuT+wp63HojLE1tgY+CWo8xX/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01A9DE35E919BA428FD72EF31933D049@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3609
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c4fbbdf-be2c-443c-5ea5-08d900f1733f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hLnsiBgf9ay62PJEw2BkAiksZ3JYHC3tFbVkOrv+Grh18vhMeYNpF4oPmP1B1kQw0SEMyObKOYf4KKGhy+c+1F4DmC5ObBWED0e6SoH8igI6nvEj6JO91s48Zd2hXVd+SJ7jWi1mnCtzkQhEufgUI1VRk1Ar6gsP1ehHRbbpoUZB8uGtuAXye+KIdE5aTkhYH4AAKvNOBPUWE1PWZN5kXwPdTooyLqMZNfyHq5Xx9DM7iuNnPHKtTbS9lNWOAwWpBxXFjqNkV9oBvbDSzTOqTOzxvKddqmb7OFQu4SSal8bIEeKFjmacz3BMFpR4yzfLE713DZYVcY0bwmebiq63g69qkMBqpFMMA8lgQRBHSyvDrDEBNC8u+HiH5PgCPLNn4OtGTWnhSUuKhJWH1zBzqCAMIszezkq+YkGSyWx2+vg+wU5W35lPFf/1gGTqw7fXp71PoJe+JRRd1yJGv0bMk7WEZ5xCgaMlmbs/3s2mkuqUz22fPYpp8Boqc3UYZMlENcwWPcMTzNSXe4G3cIR+5JXfPkzaKRcNkrMBoDmRC+Y0XGtMEG8yGuDSkZAqDVjADhRcB4CsdBae+g3WaS2Wr0hygvSJBDmfWSleW04qKWQR9lYs/AalEhBLh5IFCyncMYcjise1TCSg9H6U8o09k6U1+vmgxlj8i8z36Ty/M/Y=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(36840700001)(46966006)(8936002)(5660300002)(54906003)(33656002)(6486002)(316002)(86362001)(356005)(83380400001)(53546011)(36756003)(336012)(47076005)(6506007)(26005)(2616005)(8676002)(70206006)(36860700001)(82740400003)(478600001)(82310400003)(6512007)(186003)(107886003)(6862004)(70586007)(81166007)(2906002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 16:05:35.3486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b44b8d-a36a-4bf5-bca5-08d900f1783d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3176

SGkgSnVsZWluDQoNCj4gT24gMTYgQXByIDIwMjEsIGF0IDQ6MjMgcG0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxNi8wNC8yMDIxIDE2OjAx
LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4gDQo+IEhpIFJhaHVsLA0KPiAN
Cj4+PiBPbiAxNiBBcHIgMjAyMSwgYXQgMzozNSBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGksDQo+Pj4gDQo+Pj4gT24gMTYvMDQvMjAyMSAxMjoy
NSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+IFJldmVydCB0aGUgY29kZSB0aGF0IGFzc29jaWF0
ZXMgdGhlIGdyb3VwIHBvaW50ZXIgd2l0aCB0aGUgUzJDUiBhcyB0aGlzDQo+Pj4+IGNvZGUgY2F1
c2luZyBhbiBpc3N1ZSB3aGVuIHRoZSBTTU1VIGRldmljZSBoYXMgbW9yZSB0aGFuIG9uZSBtYXN0
ZXINCj4+Pj4gZGV2aWNlLg0KPj4+IA0KPj4+IEl0IGlzIG5vdCBjbGVhciB0byBtZSB3aHkgdGhp
cyBjaGFuZ2Ugd2FzIGZpcnN0IGFkZGVkLiBBcmUgd2UgbWlzc2luZyBhbnkgZmVhdHVyZSB3aGVu
IHJldmVydGluZyBpdD8NCj4+IFRoaXMgZmVhdHVyZSB3YXMgYWRkZWQgd2hlbiB3ZSBiYWNrcG9y
dGVkIHRoZSBjb2RlIGZyb20gTGludXggdG8gZml4IHRoZSBzdHJlYW0gbWF0Y2ggY29uZmxpY3Qg
aXNzdWUNCj4+IGFzIHBhcnQgb2YgY29tbWl0ICJ4ZW4vYXJtOiBzbW11djE6IEludGVsbGlnZW50
IFNNUiBhbGxvY2F0aW9u4oCdLg0KPj4gVGhpcyBpcyBhbiBleHRyYSBmZWF0dXJlIGFkZGVkIHRv
IGFsbG9jYXRlIElPTU1VIGdyb3VwIGJhc2VkIG9uIHN0cmVhbS1pZC4gSWYgdHdvIGRldmljZSBo
YXMgdGhlDQo+PiBzYW1lIHN0cmVhbS1pZCB0aGVuIHdlIGFzc2lnbiB0aG9zZSBkZXZpY2VzIHRv
IHRoZSBzYW1lIGdyb3VwLiANCj4gDQo+IElmIHdlIHJldmVydCB0aGUgcGF0Y2gsIHRoZW4gaXQg
d291bGQgbm90IGJlIHBvc3NpYmxlIHRvIHVzZSB0aGUgU01NVSBpZiB0d28gZGV2aWNlcyB1c2Ug
dGhlIHNhbWUgc3RyZWFtLWlkLiBJcyB0aGF0IGNvcnJlY3Q/DQoNCk5vLiBJZiB3ZSByZXZlcnQg
dGhlIHBhdGNoIHdlIGNhbiB1c2UgdGhlIFNNTVUgaWYgdHdvIGRldmljZXMgdXNlIHRoZSBzYW1l
IHN0cmVhbS1pZCB3aXRob3V0IGFueSBpc3N1ZSBidXQgZWFjaCBkZXZpY2Ugd2lsbCBiZSBpbiBh
IHNlcGFyYXRlIGdyb3VwLlRoaXMgaXMgc2FtZSBiZWhhdmlvdXIgYmVmb3JlIHRoZSBjb2RlIGlz
IG1lcmdlZC4NCiANCj4gDQo+PiBUaGlzIGNvZGUgd2FzIHJlbW92ZWQgZnJvbSBMaW51eA0KPj4g
bGF0ZXIgcG9pbnQgaW4gdGltZSB3aGVuIElPTU1VIGdyb3VwIGhhbmRsaW5nIGlzIGRvbmUgYnkg
TGludXggY29kZSBub3QgYnkgYSBzcGVjaWZpYyBJT01NVSBkcml2ZXIuDQo+IA0KPiBSaWdodC4u
Li4gQnV0IExpbnV4IHN0aWxsIHN1cHBvcnQgdGhhdCBvcHRpb24uIElzIHRoYXQgY29ycmVjdD8N
Cg0KWWVzIExpbnV4IHN1cHBvcnQgSU9NTVUgZ3JvdXBzIGhhbmRsaW5nIGF0IExpbnV4IGNvZGUg
bGV2ZWwgYW5kIG5vdCBieSBldmVyeSBJT01NVSBkcml2ZXIuIA0KVGhhdCB3aHkgSSB0aG91Z2gg
d2hlbiB3ZSBhZGQgdGhlIHN1cHBvcnQgZm9yIElPTU1VIGdyb3VwIGF0IFhFTiBsZXZlbCB3ZSBj
YW4gYWRkIHRoaXMgZnVuY3Rpb25hbGl0eS4NCg0KPiANCj4+IFRoZXJlZm9yZSBJIHRoaW5rIGl0
IGlzIG9rIHJldmVydCB0aGUgY29kZS4NCj4gDQo+IEkgYW0gb2sgd2l0aCB0aGUgcHJpbmNpcGxl
IG9mIChwYXJ0aWFsbHkpIHJldmVydGluZyBwYXRjaCB0byB1bmJsb2NrIHRoZSBzaXR1YXRpb24u
IEJ1dCBJIGhhdmUgdG8gYWRtaXQsIEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB3aHkgdGhpcyBp
cyByZXZlcnRlZCByYXRoZXIgdGhhbiBmaXhlZC4NCg0KQXMgSSBtZW50aW9uIGVhcmxpZXIgSSBy
ZXZlcnRlZCB0aGlzIHBhdGNoIHVudGlsIHdlIGhhdmUgcHJvcGVyIHN1cHBvcnQgZm9yIElPTU1V
IGdyb3VwcyBmb3IgQVJNLiBPbmNlIHdlIGhhdmUgSU9NTVUgZ3JvdXAgc3VwcG9ydCBmb3IgQVJN
IHdlIGNhbiBhZGQgdGhpcyBmdW5jdGlvbmFsaXR5Lg0KDQpSZWdhcmRzLA0KUmFodWwNCj4gDQo+
IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

