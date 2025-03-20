Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B32A6AA8B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 17:04:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922856.1326671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIN4-0000nZ-Hd; Thu, 20 Mar 2025 16:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922856.1326671; Thu, 20 Mar 2025 16:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIN4-0000ko-ES; Thu, 20 Mar 2025 16:03:50 +0000
Received: by outflank-mailman (input) for mailman id 922856;
 Thu, 20 Mar 2025 16:03:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0MG=WH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tvIIw-0004Bj-Ao
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:59:34 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50ccaa15-05a4-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:59:33 +0100 (CET)
Received: from PR0P264CA0245.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::17) by
 AM8PR08MB6498.eurprd08.prod.outlook.com (2603:10a6:20b:364::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 15:59:29 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:100:0:cafe::4b) by PR0P264CA0245.outlook.office365.com
 (2603:10a6:100::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.35 via Frontend Transport; Thu,
 20 Mar 2025 15:59:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 15:59:28 +0000
Received: ("Tessian outbound f3153901b1f1:v597");
 Thu, 20 Mar 2025 15:59:28 +0000
Received: from L17f38f339348.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 92A5BA11-F161-41FD-BB07-C3E39A24D99C.1; 
 Thu, 20 Mar 2025 15:59:21 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L17f38f339348.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Mar 2025 15:59:21 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AM8PR08MB6467.eurprd08.prod.outlook.com (2603:10a6:20b:316::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 15:59:17 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 15:59:16 +0000
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
X-Inumbo-ID: 50ccaa15-05a4-11f0-9ea0-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=r9n30UP0K28oY9TOF7dK+yKMagZMZd9nNLzw9qs8xjxsT0sFxZ4d/LmL/8TMWS2OEhoKSp09MlIWev/cK0Nj+b9OPJVehCT5F6Jg8k+eu0Mxc3W2kGOYXelmyvM0vI3+zvISBXaV92y73Odz7HNBVey3HeS4KFFTdZbCCPGDXaIIT8chhAWgt9pzOgTX83niXlXs7HW8rznnVpCMvJ6cbZLQs09C43h/3YHzdJTx1p4eiqwb2oBC21R64e2skJzXWrpqemw7BEJM2oLgrLS+kn9yYIqCcOxByHq4OoNVqlnKN5t71iaCzPk8cMoqomUJHYYqVLK77N83LqZCPnp3Iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVBQh5x4TD7YlHeTnLaaSSOlB6hti02fJP49NGmdcuc=;
 b=BQ1C1tOjP9NP+hx2UgwmFofFVd3CaBD2sPQBfdVFfwp8REwuRB43ZxsB6F7ft8YfSdabIJRggU3opzfKNiQltxlgtjgC+tUs7H5Ptx8rQD6cvaCjHU7ZqqMyb3pf7NFA1U2F1H6llWLa7NQ43jvpmldixwycNI8PPbwzpSSpjHLSg+aKMeLKPg8czn7NakSTRHiLWCzFa2Bl3Y9IGsYW4vaSsD8l5/jEG6F6Wjk/M40TJ94uTlayg9TMY/SytCfXwCJF7mSYOE7GIBRFqa9b5sNnbOlMjDZu8vpe8A6MS98Eyw9r10C+3CZwYoTCJHiLFsRIeNUwB7fkZbkFTduD4g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVBQh5x4TD7YlHeTnLaaSSOlB6hti02fJP49NGmdcuc=;
 b=D933fxtaVZL76tTww0D/IGKJ2tx5Mx+zlc0jgfE+4Bz0g8KHV7oKFV2NlRTBM5AxbEsv2EzVuQWoUYzQfARopU+5VbEEA/l45N7xV5Hl9b0LBd1ggLBrXUqS19N6E03haNSejEegFIVxN6E5rgMB13+f8gGhJITlVaE45Sl7S/o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba9b400ce7d172dd
X-TessianGatewayMetadata: 1FJr3d8XpMquHCDdCI4yi9bRTIRtCJDxdC9xB2mp3lLdn4YJz/oiEZrDe04L5qv3AWEYViPcoYV+rb1pIJiWoQe16gFIE+cS+bJLgZhrAAUYQ44vKkF995KYt7etF56DA7mXdb+FfXPdf7MBTZA0M/YyvuinbGuKCZMcVWm07e4=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIKrCfvSal/Lgf/ImSaY56BUuANST4ym1TwzYRK4YJ8Q/ZRmxcF2noR6oaZp5DzP0OhfDDkUFSnfA99QKLDxShpruvtLKoopon3+Rcxy+8bJqZxk4zta+bdwrDye4yLzrPoNrboIdRT1GO/6TB9feHfhh20j6YcR9HgK3YZ/Tg8p0/ECdvHHWBdcVss6rUquu44pcPFRWyD3b4l3bLuOR4kSlHT6bEkVhP3KhrUCPifqsuQdSv3N8WxFAJEZlyUu+gYldgIXJiPvpZ1eAuHoqUhHtZTiQV1h9scuR9goO0nwNWiIiNVOTypLO2jEkDjz6YpHsWJEiwx834JK9aznjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVBQh5x4TD7YlHeTnLaaSSOlB6hti02fJP49NGmdcuc=;
 b=hu3+glA3ukyc6pT0YV5Qtr3Mw75y5bFn2dg0rK2diOrkfm1PZufRvp3ar4A3H7MgtKvPyegi4f5D9kW4JQSeas+K0thE4d3vExZw3NVbA0WlJlE+88jnWJ+xOBQQ6+EAt7T5s86paaT0Y06ikPYfUBJ0gxTfJlWs3yVYg9EEqcp8A14f5GTfrSpLcENuMuDaNg7MT9EMjBbeILJtumgho/Av0Fnn6eWJyW5/9gbiPZ24oUgxYuxXtNtTbHI/Z47iL+ZNNhOyhq7hQ269/e/aRrWWOu/BVo5r2UqlBbmAnfvqaozKcNN7v7yBSbYGn0PzgJ+vbHAVhvwlFoVMTTg0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVBQh5x4TD7YlHeTnLaaSSOlB6hti02fJP49NGmdcuc=;
 b=D933fxtaVZL76tTww0D/IGKJ2tx5Mx+zlc0jgfE+4Bz0g8KHV7oKFV2NlRTBM5AxbEsv2EzVuQWoUYzQfARopU+5VbEEA/l45N7xV5Hl9b0LBd1ggLBrXUqS19N6E03haNSejEegFIVxN6E5rgMB13+f8gGhJITlVaE45Sl7S/o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v2 4/5] xen/arm: ffa: Add indirect message between VM
Thread-Topic: [PATCH v2 4/5] xen/arm: ffa: Add indirect message between VM
Thread-Index: AQHbkcvpt0PUM4qxV0mEdDt9tLfY+rN8POUAgAABhwA=
Date: Thu, 20 Mar 2025 15:59:16 +0000
Message-ID: <C6225B5D-D9DC-46E9-B879-A3075D49B81E@arm.com>
References: <cover.1741617888.git.bertrand.marquis@arm.com>
 <2265f8a8c22034c629025f384acb4f33a4235387.1741617888.git.bertrand.marquis@arm.com>
 <CAHUa44Hcto=kFLpkKBFbH9ucjp+aAERrAFoqbnYjP-_iLqXoJA@mail.gmail.com>
In-Reply-To:
 <CAHUa44Hcto=kFLpkKBFbH9ucjp+aAERrAFoqbnYjP-_iLqXoJA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AM8PR08MB6467:EE_|AM2PEPF0001C70F:EE_|AM8PR08MB6498:EE_
X-MS-Office365-Filtering-Correlation-Id: a5db7af6-52d2-460c-797b-08dd67c83200
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Y2Z4WHp1L1Q2a04xZTFEbXNRSE1MOUl3eDd6eGZkZUJxemdwdmNydjdXVVhQ?=
 =?utf-8?B?R2ZzNExLNmlxNXBEZmFkTE1YUFg1QVF3ZFNrMTMyWDFEdmRESG01SHBPakxV?=
 =?utf-8?B?a2h4Z2VGcGFQN2p1K2Q4S0d6UnV4TEZEU1JTQTlpSW8zRU5SSlNhMWE1TUw3?=
 =?utf-8?B?QmJwUTJmNEdmWXBWQThlcWtsMVUzNnVBL0FqUlpyK0ZOYWg1QU9qS0xwTTY4?=
 =?utf-8?B?azRQOGp4ZURTdVc1MXFJT1F0OFZwVE44eDdRMjNIWEczVyt5RGdFOUl2NnlW?=
 =?utf-8?B?RmVaUWNSTWpSRXRUdTdlNkxxbUxoNVdZK0srSFF4SmdRWDgvWjZlc1hYam1N?=
 =?utf-8?B?MkptbXJha2EyMkhWcU80MjdEbWNEcFJxUFR5TDc1TFdhM09DNnIyNmwzUCs1?=
 =?utf-8?B?c3VtKzArSktta0tlMDVpQWxhOEpLSzZWQXVIbFNldVVRU1pyVzB3U0k0b1dW?=
 =?utf-8?B?YURSZTBuWXZISjFMZFFqQ2JGY2hOTW5qRzdncGk0amcrL3RscXlzYmlYdE9k?=
 =?utf-8?B?cUpYaDk1dE5VbEpLQWhJUGRsWnowUXRNcFBPQTd6bCtFMFhtdWNNajB4RytN?=
 =?utf-8?B?QkVHR0xBWFRLUnk2SnpPZEw0N2tJdjN2ZXBrZnZBampneWk1aVF5Q0ZoNDds?=
 =?utf-8?B?M1JNQkUzTmdSenhpczhvTjJqalU0SG55Y1UvUWhka2E2N0lKMVdFOU90elVV?=
 =?utf-8?B?cWNGUG1jdVJRRHF5ZWsxL05sL3pscTFOeWtDZ09NaG94Qk56SEFnTmlHZVJP?=
 =?utf-8?B?VU1aUVgxUEQ2TzkzUS94aHVVbmdqT2MyYzhpdktQZHZpMXJLdjF3Yy9SMWhj?=
 =?utf-8?B?Q1c4dFNQaXN5Zm00UG9sTkJ1RTFKbzVQdml3QklBc2lzTEg4ZWxqbGowU0V0?=
 =?utf-8?B?bFNxN2E1U29CN0RzY2tVOStoS2xXc2EzMk0xM0FkL1QreWs2ckhnNld4bU1L?=
 =?utf-8?B?bDRjYTlXc2JTdS9kWWFuU3YvMll5TElRbG1pQmx0ZnBWOGVCbDdkVDl2dTFY?=
 =?utf-8?B?VFZVUVF0VDc3Z2I0OExYRjZ2TTZ0bzRhSVg1QXZqZ2REbmsyZ1dqSFVwQS9t?=
 =?utf-8?B?Rkd2eHAvZk1Ja1pyRGdiSVUvd3VvQU5haTJTajExOGlXdk1hckM0OWxNMXg2?=
 =?utf-8?B?UnkvNUZLbVB4WnZ3R2k1N0pGMEdvUHVPVXhTa29LN1M3elVoUzlKQklCRTAw?=
 =?utf-8?B?U2hpRTdYenNRSjVpRHdyNnRqWUFpTFc2cnNLVmFjanl2Q2hCM1JHZWMvTm5i?=
 =?utf-8?B?Nk1LemUyaTdJcGlCWDJpLzVMa2J5Z2ZLU09MY284Y0dGNTVhSEhrOHdaZ0xY?=
 =?utf-8?B?RXNlN0NMelBKM005UDFwVEU2MmxOR2dNRzA3aWQ2NkI3bEJ5enl1ZDJtTEhm?=
 =?utf-8?B?MFp1eFJPVitSMnZqN2dmWlVnWm4rMkZ6aEtRN1dpY1VYZ0pkdlZjT1N5MERS?=
 =?utf-8?B?NUxKTitUNC9wSXNGUE8rRmtiWVoxbWdvc1VzQWlmeDQ3azNISDRVdkFpUzVN?=
 =?utf-8?B?TU56WUlPR041ZkRPY0hBd1p0YndIWUFRSmtaN0hIaCtkWkVkbExsTEVwbHZu?=
 =?utf-8?B?SUhteHd0UG9ld2pPWjBYRkY4V0d1aDl5cTdjL1RGcWFqeUpLZ253SjhZenBG?=
 =?utf-8?B?ZzFUUUdSLzIwSDZvVWVJR3RpRWp2UGRORkRCZ2k0MzVwOEJNRkhPRGFZNXdL?=
 =?utf-8?B?czFFa2c5MGtoN0JVVUNYcjQyZ0lWMzU4MlNCVkxLUUpZMEFKN1J0dzVMdGtX?=
 =?utf-8?B?b3NWZFUvZ3krTTBtallxdUhpc0J4VWtVZFpWbXN0S085dktRLytxRk4xWTVX?=
 =?utf-8?B?WEdESEVJdVdraFdMNm9ZTVJ4S1BTTEEzdHU5WUUvY3ExUG5BZHpad0hQWSt1?=
 =?utf-8?B?Z2E2akxSNW5McjFnSjJ0UnBQUDZneXVrVTN4ODB1bVJOQndSbTZuR1ZrNHlh?=
 =?utf-8?Q?bVJpdq4xnAlPGE4HIXV88A2C2zYUkvSc?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BEA8F660348A84FB81A625FF5ACF694@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6467
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b51105f-eb06-4061-8518-08dd67c82ac2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|82310400026|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmdEcGJBaXRPVy81YkQzNElOcVFORlJ2WFJpYjdkM2RFODI0RC9Gd0JTKzVm?=
 =?utf-8?B?WlFUVE1PTHUwUzJSZXB3TzJQVGtCMXNic2ZGb0w0TXlJZE9SSW9hWlZPRTdw?=
 =?utf-8?B?eVpGdWlDTUQ2OFB1alo3SWVzV3JKSjRwbFBXdnhNOFFueGVVeTNuSEJyYlFp?=
 =?utf-8?B?QVViNlhzL2thcEJFZkUxU0U5VUVHSVF2cjdqZnVMNmd6VkNId1ROeHoyc0Iw?=
 =?utf-8?B?cVJyT0ErVld1T0JaYVBaV1VSUGZWNEpmNDNIUHhoTTVlY2dJcFZLSUJtamtJ?=
 =?utf-8?B?OXZhU3hUUUxUV1ZXV2ROWXJjUEF0VEdsREdUejE3UGN5WlNyVjFncndCaEJY?=
 =?utf-8?B?STZxOUswT3Jlc05GY1RWbXVhTG4rVXhCZVF2QW9yaWZQMk1iaHFrNEpaT3k3?=
 =?utf-8?B?VW9UVEFpZlpBaWVnQUtpSDV6RUxwcG1RZUpJRU9OdlpxemtLZnJHemV2S2VY?=
 =?utf-8?B?U1VnbXF4ZEU0S2hGWUV5cmlKSlV5NW5WcUprMGZoczF4SWdDekFJWXZzaXZY?=
 =?utf-8?B?UWQ2d1dxZllWQW5tRVdacVk4bU5iWVNFUXBFOHQ5Wmt2aTQvZHdKcU5aVndx?=
 =?utf-8?B?M0lUTUs1UzJKSnk5QzNlNVZTeUUyUklNRmpBd2gwOEx0Y2d1S28zcEY4d25q?=
 =?utf-8?B?bTlZSzRXcnpqa09DYjZLeWRFanNPeTlEQTR3ejlQckUzdENnL3A3YWF0V0dz?=
 =?utf-8?B?TFFKSVF1Z0ZkM0JUYmJIR2tTZGpvdGsyRHprSWN5aEFRQ01EK1c2a2JucSty?=
 =?utf-8?B?QlJjeGJwZ0xZZHNRUTB4L2lncnpnMU5zSy9EUVl2QzErakxIbFN2RzM0aURM?=
 =?utf-8?B?WDJ0aHFxNkFLdkozOHJIQXM3ZFdXUzV6TkgrU1BrNnNrOG1KUUR4UkNhZnBr?=
 =?utf-8?B?aTNxNENWTW5RczZkbVVIaitGbE9adHQvUTBFdVRFOExqMlFLcU1uQjRaY0ti?=
 =?utf-8?B?YU5VaWw2d0xNRGJaeEN3M0RURGt1cE51cks0cy95M3R1enpQSmhyV3pxdStM?=
 =?utf-8?B?V3lnYnF1ZHZXRXVOQVIrRHFZQUsybjYzem95MEppVkhmQ1ZyeDcvbXY4eTB3?=
 =?utf-8?B?aG53SlN3Wk50aERxdnNjbEVzS1pNWFZ2Y0dsZ3ovT3V3eEV3YXl3a0lDcXNY?=
 =?utf-8?B?WmF3d2dzcHN2QVlvMkJqVW05ZENVazlDWDhiSXhoR256TkNqRDFSU0lveDlR?=
 =?utf-8?B?d2tIVmk0TzQzaC9DUGFRUkdLOXhIQzMyd0lISi94RFJpMlorbjVLUmQwUHBH?=
 =?utf-8?B?ckdKOVFqaUVzQWVGNmVvNHMzdTI4anVyZnFEK3l4YmtJQVF0Y0hiT1A3cHZo?=
 =?utf-8?B?L29IOXFYZG9YSG1vZlBjUzJBYWx6ZUdKcWYweklZRkZLaS9tZ0pGWUxxZ3I5?=
 =?utf-8?B?T0lxOEN1OUV5dzhUQlNMVFBJWlp1T0VHbHRqUHc4b0JIaVNPM1hLTExyR1Ez?=
 =?utf-8?B?TXUxVFRmdVIvY05VZUZFQ1dlSURHZTNZT2gzZDEzRzNyUzR0VVFVcXNTOGlL?=
 =?utf-8?B?alVvd1Y4R1V3SmNGU2Q5SlRmTnFFY3dUTmcxbEl0YVhKVkJEU2xSV0I1dWdh?=
 =?utf-8?B?eTdzM2JSOWxSOU8raTdsdXVpWWU1MWsvYUFMWGNyeWZJWE85OW4zRjNJWS9k?=
 =?utf-8?B?TzR1dHlwSi90Rnd4OHVBdVNOSGxOOFE5elVBS3czbE11dzBOT3JLR1FUNEdG?=
 =?utf-8?B?MmloK2FrT0Rjd0lhZ3JCS2UxMlRJdks4dEhyUFFzUmdlOTI2aGd3K3huNk9j?=
 =?utf-8?B?SUxuVG5DbFZwajJvMGZQNUUrTXhxbFVrMzFtaERuaXpVbkFnNHhtNXE3QmFr?=
 =?utf-8?B?UDAyc0g2UmZQUU5pRCtndXNNdEU2ZE5CZHloZVF3ZGVncWRsbXBIZi91VzZh?=
 =?utf-8?B?aDJhc1I0V3hZOGpCcTM1emFXV0g4SEc1SnRLNDd4dHoxQ2JzKzJld1k2Z0hm?=
 =?utf-8?B?VU85eHk4Qk1BQ3dCbGg2RGwzTlJzaUNob1kzMFJMOFhRckZoOXpKSzdUUVFu?=
 =?utf-8?Q?JaJwKU4NnwGF9gNBkjU2ZzQZRFYh4w=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 15:59:28.4927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5db7af6-52d2-460c-797b-08dd67c83200
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6498

SGkgSmVucywNCg0KPiBPbiAyMCBNYXIgMjAyNSwgYXQgMTY6NTMsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMzo1MeKAr1BNIEJlcnRyYW5kIE1hcnF1aXMNCj4g
PGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IEFkZCBzdXBwb3J0IGZv
ciBpbmRpcmVjdCBtZXNzYWdlcyBiZXR3ZWVuIFZNcy4NCj4+IFRoaXMgaXMgb25seSBlbmFibGVk
IGlmIENPTkZJR19GRkFfVk1fVE9fVk0gaXMgc2VsZWN0ZWQuDQo+PiANCj4+IFNpZ25lZC1vZmYt
Ynk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+IC0tLQ0K
Pj4gQ2hhbmdlcyBpbiB2MjoNCj4+IC0gU3dpdGNoIGlmZGVmIHRvIElTX0VOQUJMRUQNCj4+IC0t
LQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfbXNnLmMgICAgIHwgOTYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oIHwg
IDQgKysNCj4+IDIgZmlsZXMgY2hhbmdlZCwgOTIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX21zZy5jIGIveGVu
L2FyY2gvYXJtL3RlZS9mZmFfbXNnLmMNCj4+IGluZGV4IGVlNTk0ZTczN2ZjNy4uMzM2ZDViYmY2
NGY2IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfbXNnLmMNCj4+ICsrKyBi
L3hlbi9hcmNoL2FybS90ZWUvZmZhX21zZy5jDQo+PiBAQCAtOTYsOSArOTYsNiBAQCBpbnQzMl90
IGZmYV9oYW5kbGVfbXNnX3NlbmQyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gICAg
IHVpbnQxNl90IGRzdF9pZCwgc3JjX2lkOw0KPj4gICAgIGludDMyX3QgcmV0Ow0KPj4gDQo+PiAt
ICAgIGlmICggIWZmYV9md19zdXBwb3J0c19maWQoRkZBX01TR19TRU5EMikgKQ0KPj4gLSAgICAg
ICAgcmV0dXJuIEZGQV9SRVRfTk9UX1NVUFBPUlRFRDsNCj4+IC0NCj4+ICAgICBpZiAoICFzcGlu
X3RyeWxvY2soJnNyY19jdHgtPnR4X2xvY2spICkNCj4+ICAgICAgICAgcmV0dXJuIEZGQV9SRVRf
QlVTWTsNCj4+IA0KPj4gQEAgLTEwNiwxMCArMTAzLDEwIEBAIGludDMyX3QgZmZhX2hhbmRsZV9t
c2dfc2VuZDIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgc3JjX2lkID0gc3Jj
X21zZy0+c2VuZF9yZWN2X2lkID4+IDE2Ow0KPj4gICAgIGRzdF9pZCA9IHNyY19tc2ctPnNlbmRf
cmVjdl9pZCAmIEdFTk1BU0soMTUsMCk7DQo+PiANCj4+IC0gICAgaWYgKCBzcmNfaWQgIT0gZmZh
X2dldF92bV9pZChzcmNfZCkgfHwgIUZGQV9JRF9JU19TRUNVUkUoZHN0X2lkKSApDQo+PiArICAg
IGlmICggc3JjX2lkICE9IGZmYV9nZXRfdm1faWQoc3JjX2QpICkNCj4+ICAgICB7DQo+PiAgICAg
ICAgIHJldCA9IEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTOw0KPj4gLSAgICAgICAgZ290byBv
dXRfdW5sb2NrX3R4Ow0KPj4gKyAgICAgICAgZ290byBvdXQ7DQo+PiAgICAgfQ0KPj4gDQo+PiAg
ICAgLyogY2hlY2sgc291cmNlIG1lc3NhZ2UgZml0cyBpbiBidWZmZXIgKi8NCj4+IEBAIC0xMTgs
MTMgKzExNSw5NiBAQCBpbnQzMl90IGZmYV9oYW5kbGVfbXNnX3NlbmQyKHN0cnVjdCBjcHVfdXNl
cl9yZWdzICpyZWdzKQ0KPj4gICAgICAgICAgc3JjX21zZy0+bXNnX29mZnNldCA8IHNpemVvZihz
dHJ1Y3QgZmZhX3BhcnRfbXNnX3J4dHgpICkNCj4+ICAgICB7DQo+PiAgICAgICAgIHJldCA9IEZG
QV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTOw0KPj4gLSAgICAgICAgZ290byBvdXRfdW5sb2NrX3R4
Ow0KPj4gKyAgICAgICAgZ290byBvdXQ7DQo+PiAgICAgfQ0KPj4gDQo+PiAtICAgIHJldCA9IGZm
YV9zaW1wbGVfY2FsbChGRkFfTVNHX1NFTkQyLA0KPj4gKyAgICBpZiAoIEZGQV9JRF9JU19TRUNV
UkUoZHN0X2lkKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIC8qIE1lc3NhZ2UgZm9yIGEgc2Vj
dXJlIHBhcnRpdGlvbiAqLw0KPj4gKyAgICAgICAgaWYgKCAhZmZhX2Z3X3N1cHBvcnRzX2ZpZChG
RkFfTVNHX1NFTkQyKSApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgcmV0ID0gRkZB
X1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4gKyAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4gKyAgICAg
ICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgcmV0ID0gZmZhX3NpbXBsZV9jYWxsKEZGQV9NU0dfU0VO
RDIsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICgodWludDMyX3QpZmZhX2dldF92bV9p
ZChzcmNfZCkpIDw8IDE2LCAwLCAwLCAwKTsNCj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4gKyAg
ICB9DQo+PiANCj4+IC1vdXRfdW5sb2NrX3R4Og0KPj4gKyAgICAvKiBNZXNzYWdlIGZvciBhIFZN
ICovDQo+PiArICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdfRkZBX1ZNX1RPX1ZNKSApDQo+PiAr
ICAgIHsNCj4gDQo+IEkgd291bGQgbW92ZSB0aGlzIGJsb2NrIGludG8gYSBoZWxwZXIgZnVuY3Rp
b24gdG8gaXNvbGF0ZSB0aGUgbmVlZGVkDQo+IGNsZWFudXAgZXRjLCBidXQgdGhhdCBtaWdodCBi
ZSBtb3JlIGEgbWF0dGVyIG9mIHRhc3RlIHNvIGRvIGFzIHlvdQ0KPiBwcmVmZXIuDQoNClllcyB0
aGF0IHdvdWxkIGJlIGJldHRlci4gV2lsbCBkby4NCg0KPiANCj4+ICsgICAgICAgIHN0cnVjdCBk
b21haW4gKmRzdF9kOw0KPj4gKyAgICAgICAgc3RydWN0IGZmYV9jdHggKmRzdF9jdHg7DQo+PiAr
ICAgICAgICBzdHJ1Y3QgZmZhX3BhcnRfbXNnX3J4dHggKmRzdF9tc2c7DQo+PiArICAgICAgICBp
bnQgZXJyOw0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCBkc3RfaWQgPT0gMCApDQo+PiArICAgICAg
ICB7DQo+PiArICAgICAgICAgICAgLyogRkYtQSBJRCAwIGlzIHRoZSBoeXBlcnZpc29yLCB0aGlz
IGlzIG5vdCB2YWxpZCAqLw0KPj4gKyAgICAgICAgICAgIHJldCA9IEZGQV9SRVRfSU5WQUxJRF9Q
QVJBTUVURVJTOw0KPj4gKyAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4gKyAgICAgICAgfQ0KPj4g
Kw0KPj4gKyAgICAgICAgLyogVGhpcyBpcyBhbHNvIGNoZWNraW5nIHRoYXQgZGVzdCBpcyBub3Qg
c3JjICovDQo+PiArICAgICAgICBlcnIgPSByY3VfbG9ja19saXZlX3JlbW90ZV9kb21haW5fYnlf
aWQoZHN0X2lkIC0gMSwgJmRzdF9kKTsNCj4+ICsgICAgICAgIGlmICggZXJyICkNCj4+ICsgICAg
ICAgIHsNCj4+ICsgICAgICAgICAgICByZXQgPSBGRkFfUkVUX0lOVkFMSURfUEFSQU1FVEVSUzsN
Cj4+ICsgICAgICAgICAgICBnb3RvIG91dDsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAg
ICAgIGlmICggZHN0X2QtPmFyY2gudGVlID09IE5VTEwgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAg
ICAgICAgICAgIHJldCA9IEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTOw0KPj4gKyAgICAgICAg
ICAgIGdvdG8gb3V0X3VubG9jazsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIGRz
dF9jdHggPSBkc3RfZC0+YXJjaC50ZWU7DQo+PiArICAgICAgICBpZiAoICFkc3RfY3R4LT5ndWVz
dF92ZXJzICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICByZXQgPSBGRkFfUkVUX0lO
VkFMSURfUEFSQU1FVEVSUzsNCj4+ICsgICAgICAgICAgICBnb3RvIG91dF91bmxvY2s7DQo+PiAr
ICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICAvKiBUaGlzIGFsc28gY2hlY2tzIHRoYXQgZGVz
dGluYXRpb24gaGFzIHNldCBhIFJ4IGJ1ZmZlciAqLw0KPj4gKyAgICAgICAgcmV0ID0gZmZhX3J4
X2FjcXVpcmUoZHN0X2QpOw0KPj4gKyAgICAgICAgaWYgKCByZXQgKQ0KPj4gKyAgICAgICAgICAg
IGdvdG8gb3V0X3VubG9jazsNCj4+ICsNCj4+ICsgICAgICAgIC8qIHdlIG5lZWQgdG8gaGF2ZSBl
bm91Z2ggc3BhY2UgaW4gdGhlIGRlc3RpbmF0aW9uIGJ1ZmZlciAqLw0KPj4gKyAgICAgICAgaWYg
KCBkc3RfY3R4LT5wYWdlX2NvdW50ICogRkZBX1BBR0VfU0laRSA8DQo+PiArICAgICAgICAgICAg
ICAgIChzaXplb2Yoc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4KSArIHNyY19tc2ctPm1zZ19zaXpl
KSApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgcmV0ID0gRkZBX1JFVF9OT19NRU1P
Ulk7DQo+PiArICAgICAgICAgICAgZmZhX3J4X3JlbGVhc2UoZHN0X2QpOw0KPj4gKyAgICAgICAg
ICAgIGdvdG8gb3V0X3VubG9jazsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIGRz
dF9tc2cgPSBkc3RfY3R4LT5yeDsNCj4+ICsNCj4+ICsgICAgICAgIC8qIHByZXBhcmUgZGVzdGlu
YXRpb24gaGVhZGVyICovDQo+PiArICAgICAgICBkc3RfbXNnLT5mbGFncyA9IDA7DQo+PiArICAg
ICAgICBkc3RfbXNnLT5yZXNlcnZlZCA9IDA7DQo+PiArICAgICAgICBkc3RfbXNnLT5tc2dfb2Zm
c2V0ID0gc2l6ZW9mKHN0cnVjdCBmZmFfcGFydF9tc2dfcnh0eCk7DQo+PiArICAgICAgICBkc3Rf
bXNnLT5zZW5kX3JlY3ZfaWQgPSBzcmNfbXNnLT5zZW5kX3JlY3ZfaWQ7DQo+PiArICAgICAgICBk
c3RfbXNnLT5tc2dfc2l6ZSA9IHNyY19tc2ctPm1zZ19zaXplOw0KPj4gKw0KPj4gKyAgICAgICAg
bWVtY3B5KGRzdF9jdHgtPnJ4ICsgc2l6ZW9mKHN0cnVjdCBmZmFfcGFydF9tc2dfcnh0eCksDQo+
PiArICAgICAgICAgICAgICAgc3JjX2N0eC0+dHggKyBzcmNfbXNnLT5tc2dfb2Zmc2V0LCBzcmNf
bXNnLT5tc2dfc2l6ZSk7DQo+PiArDQo+PiArICAgICAgICAvKiByZWNlaXZlciByeCBidWZmZXIg
d2lsbCBiZSByZWxlYXNlZCBieSB0aGUgcmVjZWl2ZXIqLw0KPj4gKw0KPj4gK291dF91bmxvY2s6
DQo+PiArICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihkc3RfZCk7DQo+PiArICAgICAgICBpZiAo
ICFyZXQgKQ0KPj4gKyAgICAgICAgICAgIGZmYV9yYWlzZV9yeF9idWZmZXJfZnVsbChkc3RfZCk7
DQo+PiArICAgIH0NCj4+ICsgICAgZWxzZQ0KPj4gKyAgICAgICAgcmV0ID0gRkZBX1JFVF9JTlZB
TElEX1BBUkFNRVRFUlM7DQo+PiArDQo+PiArb3V0Og0KPj4gICAgIHNwaW5fdW5sb2NrKCZzcmNf
Y3R4LT50eF9sb2NrKTsNCj4+ICAgICByZXR1cm4gcmV0Ow0KPj4gfQ0KPj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaCBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3By
aXZhdGUuaA0KPj4gaW5kZXggMWY1MDY3ZDVkMGM5Li4zNDBkYjIyOTQ1M2MgMTAwNjQ0DQo+PiAt
LS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wcml2YXRlLmgNCj4+ICsrKyBiL3hlbi9hcmNoL2Fy
bS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4gQEAgLTM4MCw2ICszODAsMTAgQEAgaW50IGZmYV9oYW5k
bGVfbm90aWZpY2F0aW9uX3NldChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncyk7DQo+PiANCj4+
ICNpZmRlZiBDT05GSUdfRkZBX1ZNX1RPX1ZNDQo+PiB2b2lkIGZmYV9yYWlzZV9yeF9idWZmZXJf
ZnVsbChzdHJ1Y3QgZG9tYWluICpkKTsNCj4+ICsjZWxzZQ0KPj4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCBmZmFfcmFpc2VfcnhfYnVmZmVyX2Z1bGwoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICt7DQo+PiAr
fQ0KPiANCj4gU2hvdWxkbid0IHRoaXMgZ28gaW4gdGhlIHByZXZpb3VzIHBhdGNoICJ4ZW4vYXJt
OiBmZmE6IEFkZCBidWZmZXIgZnVsbA0KPiBub3RpZmljYXRpb24gc3VwcG9ydCI/DQo+IA0KDQpE
ZWZpbml0ZWx5IHllcy4gSSB3aWxsIG1vdmUgaXQgYmFjay4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0K
DQo+IENoZWVycywNCj4gSmVucw0KPiANCj4+ICNlbmRpZg0KPj4gDQo+PiB2b2lkIGZmYV9oYW5k
bGVfbXNnX3NlbmRfZGlyZWN0X3JlcShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdWludDMy
X3QgZmlkKTsNCj4+IC0tDQo+PiAyLjQ3LjENCg0KDQo=

