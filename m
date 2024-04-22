Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0226C8AC64B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 10:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709791.1108781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryohz-0008S5-PW; Mon, 22 Apr 2024 08:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709791.1108781; Mon, 22 Apr 2024 08:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryohz-0008Ps-Ml; Mon, 22 Apr 2024 08:07:27 +0000
Received: by outflank-mailman (input) for mailman id 709791;
 Mon, 22 Apr 2024 08:07:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyNC=L3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ryohy-0008Pm-K9
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 08:07:26 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2607::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59cc3c58-007f-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 10:07:24 +0200 (CEST)
Received: from AS4PR09CA0027.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::17)
 by PAXPR08MB6560.eurprd08.prod.outlook.com (2603:10a6:102:12d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 08:07:16 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::27) by AS4PR09CA0027.outlook.office365.com
 (2603:10a6:20b:5d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.33 via Frontend
 Transport; Mon, 22 Apr 2024 08:07:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Mon, 22 Apr 2024 08:07:12 +0000
Received: ("Tessian outbound 9fd7e4b543e6:v313");
 Mon, 22 Apr 2024 08:07:12 +0000
Received: from 9dc1e4e88d08.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2FDDA571-6B9D-4C36-9FE9-759CA3492BFE.1; 
 Mon, 22 Apr 2024 08:07:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9dc1e4e88d08.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Apr 2024 08:07:06 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB10855.eurprd08.prod.outlook.com (2603:10a6:150:161::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 08:07:04 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 08:07:03 +0000
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
X-Inumbo-ID: 59cc3c58-007f-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZcrJauMswPQYkB/hUzwqUsQoMaSotiVh2bPqYMzQN7QYKNkWEeYViokutgF6zLTorkrk5hVeQrbRsdNXadaXzkxyGURjXtSMv5SYpwyT/eZLIY8OsqQ/70QPwGC3ouD/kQZvKcQmiPjR0pWX7k9cq7QZWmttXa8VMPuDdWYHhmxo6TBVR97HammwWffBhJT/lTwnur8LdpElT5N6z8JPsDv6ZUW58vEY9vv6URl80l0MvPX0gLTXYOCHXH8hxz+oC+vZvrj+D6D4HZIZXcFS6zGyZ/mZRSyfppbParhO+exBCPnZ/vsmaqP2n0tTxXF+nK8uaKJ4xHOgaSwE3gUkeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7tpRLoA0OHlbCKCS558M+RCfF1lZEW6xmDe19Ne6Cc=;
 b=VXfHKpSasWBAxA14HCynZ6kKBaWD8Z37IHukqxFE+GXW9UxbhuUI3GemS06ZsGOWl1Fvt6Ee3u5I/+XBNyc78+dMkFRW+XQiiBdhKKdmR6PVbU4UpGo1jr5BfM5GkuEMlV0pQFjSqiW1zJnD5IRfJcOqYTkXu5l4GMPDKIqGT5+gpkl/udPNMx7xCrlDhY79iubuFfQ6hqqSIeTHvCW8AinxGpfyGrDgUQCyuQXuZSwx8DIjmeVzdu+Xz8tm9I+hlvgkxvYJ2BMRyKzgP4s409Whh0pN1hBzX1BXDWbbgMmnJjCJhO/Jpi0Pi4ZJd2WWDKJpuKB2Pb/szu0CZedv1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7tpRLoA0OHlbCKCS558M+RCfF1lZEW6xmDe19Ne6Cc=;
 b=nPAUi2jvdvbVG/xoCqdfJrleb6FK4rSa6zzstqNEuPZr+JTF03qM0nmhGsVv5DXwJT9VaKomzn4xJ1qkOoV1oPyv8iiWNpBrBbnhtZr+gr2dhTpZw9vmvnybfO40xuAMaxTd2zfOhs84mGrvVdF1SaM49qN3udX5sXuLXrqKG2s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5857428c717df537
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWL0JA15NjRswOc7azmFksrZXNU9i5Y1cvAMvDLuU7lVqCipa1hXElx5xNPo5A61kvK1CgySrt1ztED/O6RRQ4WI+9UMqgsTQw4wydpTEvpFa+f0QruTs+3yjhVv6lvC5oQX1isFDRqDz1hzsD0NdCF1knQ5a8SkFGU5sp08yy/cvdPfBb9GzN6WZGcrAgJKMP74MkUM6Y59NdmZsK9iU5F1KLA4/KngO4Qgs48oIX18zM/4ZCpdQ0hiDaENYC93nufZZp5YTpUYVcwFMp4eVyWglrg736h9maRNz/tneDc6JPzKh+D8yxdxFcPDja1/U2+4Hle44S05qN8sHRYFVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7tpRLoA0OHlbCKCS558M+RCfF1lZEW6xmDe19Ne6Cc=;
 b=gSgzY096odIpAQ8m4LH4ykLDwNWdHBUShb9uX7IMBMWz8vTDZJPUMcVvHcPERQjHiyF2729/kFOqvyj9Lu1O6LVzEDnC2Yu6fgxc3QwqgPOHb3x6sEyzHPqsgPUJrnbPW7Ez4O42f0GAhqFNOEpkN+nnD1EgyJ1ZbAxS7BQYgQF068aNcVbiaSsu+j73mnyOLehm9Iu0o6Q/ysC2yEqM1rvoLbzlD5pS/BdxT3Ti+G2uL1RpNQDwt9diIjleut0l1MXKqbI9YGy62NcwytMwlrWlsZ3cq4hXNwNbnirdajrV/zJ6PsLRyzxmNjmlDNo+8GTNB1LS6SqqFao41LNhXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7tpRLoA0OHlbCKCS558M+RCfF1lZEW6xmDe19Ne6Cc=;
 b=nPAUi2jvdvbVG/xoCqdfJrleb6FK4rSa6zzstqNEuPZr+JTF03qM0nmhGsVv5DXwJT9VaKomzn4xJ1qkOoV1oPyv8iiWNpBrBbnhtZr+gr2dhTpZw9vmvnybfO40xuAMaxTd2zfOhs84mGrvVdF1SaM49qN3udX5sXuLXrqKG2s=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 12/12] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Topic: [PATCH v3 12/12] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Index: AQHakWRKhhfM1dXXeUO6IItBh4LVR7Fz8i4AgAADG4A=
Date: Mon, 22 Apr 2024 08:07:03 +0000
Message-ID: <9A107B24-E606-4926-BE1C-6FC0C6E86CF7@arm.com>
References: <20240418073652.3622828-1-luca.fancellu@arm.com>
 <20240418073652.3622828-13-luca.fancellu@arm.com>
 <a46e7e41-cbb8-44e8-9c69-533b949f6a4a@amd.com>
In-Reply-To: <a46e7e41-cbb8-44e8-9c69-533b949f6a4a@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB10855:EE_|AM3PEPF00009BA0:EE_|PAXPR08MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afddc87-be64-465b-44df-08dc62a33783
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Unl3OVVXMlNvRUplQ1g0SFg0cHdjQmFFU1M5eGpDNDNZK0dXdkJCKzAvVHpG?=
 =?utf-8?B?WVdXeVNmREZLWGRjbmVQWGluUjFqUi9jTGg3ZUxmRlg2aHpTREVSWVRTL0Zs?=
 =?utf-8?B?SlZVL3U4Qk85c1dJWnNuR1N2Q0FOU01zMHZtRnNydkkwTWZiOU5vNWlsTUZM?=
 =?utf-8?B?NWt1elBLbk1SVThNNTYzVHJ3a05OOERoQlFxMmVBUURBWVdXeXVXalRhOVVu?=
 =?utf-8?B?SDZ1bE5VcXo2cytjYTMwaXNtNTZvdUNLcEJqYjNGK1ZDVkNLWEE0OFRYUjRQ?=
 =?utf-8?B?TnZ3N0F2ZGlIVTNIcWdmZ09FT3JEc2Q2MzZTUEY4aVZTTEN1anNRby83V0kv?=
 =?utf-8?B?dU9ueWlseGFId0lIMisrS0E4ZlVOWEw0bXFIcFZreFN5ZTdiemFOY05KcGFL?=
 =?utf-8?B?cmNGS29scTgwS2pjSGFoUzFkcGc4MFpmUUpPZGlkR3QyL1p1cjh3RkpzUHQy?=
 =?utf-8?B?aXF2UkgvZGxpOVZXdFFwMVIrVFZoT0pSVVNpZDU5dUtaa3k5RklVdVRNd1c1?=
 =?utf-8?B?TjlSZVJOWGtFdUhBWG5FUUZkN3hyVnNUMVBEVWkzdXo4dWVkTUh1NkpaQ2hV?=
 =?utf-8?B?NmNBaFFLVU5TYlIyY0k1cUlLd3lqODJHSTJpSHFXbnJaekhZTVp3dGMxMWND?=
 =?utf-8?B?U3NtMHRLWTNzYktpRzZqNXlmTW9UTFZnWXpwYlpsZnFkbWEwU3BMM1hqeWFS?=
 =?utf-8?B?QWpjanlFb3ZvS1ZRbFZzVjN1YUNjdjcwYTQ3OElhZVI0WEI5ZTRaZlJVdnZO?=
 =?utf-8?B?LzN0SXJlSDhGZWpEY0djWU5aSGg1MkVzRFdVU1BkaEpnL2J2WjFTT2hLMkM1?=
 =?utf-8?B?K1h6Y1RTSFhka0tkK25jWFdPR3ZNcFZMNnFIS1hQSGx3SnEzVlVieEE3M051?=
 =?utf-8?B?UU9jQ0lGb2JIUFpVTE5sRFZqWXpzN0EyamlOQ2ZFcWVLby83cysxNTZCRlN3?=
 =?utf-8?B?cVJhRmcwQXQvSG5QbjNDRkdJNlV1aDdPTXh0UWF4M3M3ZXZxV0tkSzZoVk1L?=
 =?utf-8?B?Kyt6RUhCZ1R1UUdXdzRVSHpYMHpUclhKMDBLOHh3cG04blRLMTBLNGJ3OG5z?=
 =?utf-8?B?a3BqbXFmYVVZT3hDWHRjalpaSWRYZ0lQMFBhekh0M0YzcFdsdHQzazR6WUVN?=
 =?utf-8?B?ZkVxQVh4SGlIUnAvK1gxbGdNQjVRaE5iekZTUjdUVFE4RGhlNEtvaDk3N0NN?=
 =?utf-8?B?bHU1QTRLYnFsK0cwdVQrK29tUG9Fd3NkejNqd2VkdEtDWi9CWjFvYk4rS1Mr?=
 =?utf-8?B?MVRxb3Q0VjVzQmZmcUVSMS9nUXoySDZOeXllLzIvNVF2ZzI4SU0rQVltVkg4?=
 =?utf-8?B?ejFLOFM3RkNiU0YwSjV1aEVTZmNHY1FZeEFwNm1LWncrK2pKUGE4V1dldms3?=
 =?utf-8?B?SE41dzQ3Zmoza3lkZ2VIU1FGV0JuNmtEWERWeldLb3l0ZDNiMFk5d3F3TGE3?=
 =?utf-8?B?MHhCU1JaMUtrbHBobXFaZWJUSjM4UW1rT25hdUNRczdVMTd4SFg5Rjc0OHpT?=
 =?utf-8?B?dng0UW5obEQ1OUZGOXZ4a3FlRzFYU2l4NXBEZC9DZGpMV1pVRU14NktRcDRq?=
 =?utf-8?B?QXJ4WGcrWVpQNzJhN2Y0TkgrVlZLOUs3cjMwNzlBRjNxTURrVzhiODJ5V3RZ?=
 =?utf-8?B?NCtwTEFVSnFndkZkanVoRnplUmRjZUdnRG5FV2dMSUZhTzVoUTJaT3UrMDZl?=
 =?utf-8?B?YVRkbDltRk9QSWdmakd4d3JtMUhSTkV2dmRkRkppZHlGbnExdjNERENiMnA4?=
 =?utf-8?B?bWRlSENkWXF5SEZQVHJnZGticE9QZFA3L0pmcnp5OXkzR002d0ZRc2ZRanVQ?=
 =?utf-8?B?ZWY3WC9nckc2L2ZUMzd3QT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9620D97E256434F9EE681BF80A4EBE5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10855
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51c620d1-f1e9-4985-036b-08dc62a3320e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVhvWU0xZTVtbHFpUytOSlJGRzduTlZjcWtzQnY0aUM0MFBUTTdMQysvcU8v?=
 =?utf-8?B?M3JoT3prcWNwVnJpMTgrK1JvZDFuK0IzMG1JMjQ1eWc1a3FkS1VYdlBPM2NJ?=
 =?utf-8?B?a0M3K1planZNSXVYa1ZuZkp4UnlJT3NjM2JnbTZvNjR1d0p0aC9OdXBNOFI4?=
 =?utf-8?B?S3JPbnowaTY1WVhJNWtBOC91V1I1SW02STBvWEFueGRtSmU2UVVlckxxQmt1?=
 =?utf-8?B?MEI3dkFIbmtmNmJFSzJpZ3R0QnZjUjB6LzZTZVUwa0drYnB2bXFFN1RlZjhz?=
 =?utf-8?B?MWlUbzZ5S1VndVlFS2dweUhEaFJNQlVxVWk4NENwQ2xyRWdmWXptbjJpZjNK?=
 =?utf-8?B?ZExrVWZFdEZ4REp5T2cxLzUwdy91VXFKQTU2dkRQYUdqZThjY1hkd1pJc0Ju?=
 =?utf-8?B?RFkvVGxVWHpyVU9saVhURFI5STNIcDVGSVV2UXg3ZXExTzh3NVJMYjBlYmwy?=
 =?utf-8?B?bHJtNFR4UG9sbEI5c01DdkVieEJyaTlKNFZXUWMzQmJiSXpwRE1oR2ZsMktO?=
 =?utf-8?B?b3IrNzRReldPVG9tbDgrbU00MXNiTWdiVGtYb3NNMDZwWjhKRDZIWml6RTJr?=
 =?utf-8?B?SmZ6NGF2R285QXpNM1ZoZDNGTTJxeG9RaVpCcCtMT3orN3lIVFBwc2VUbXlx?=
 =?utf-8?B?V055NmE0MXZ5UmpNbkVMY3dQN05LVm5MYVh0RVFnNmVOU1ZwM2QyeU8rWjU3?=
 =?utf-8?B?S3I2ZUhzNDJncXhSSlFsWXJOaDQ1dVkycEw0ZWEyMUgya3IxelI4UTNBOFNT?=
 =?utf-8?B?elZhZnJ6ci9iR2Y4a3R2U2EzWlE3Z0Q3dnNIejRjUlAwRjRUVEM2aUxDOTkz?=
 =?utf-8?B?WG0zMUFndTZaN0pORjhjNHJyS1lSeVVzWSs5bVR2ck5ES3JwT3VjR29KMlUz?=
 =?utf-8?B?cUcrcGovc1ZyeHNTTGc5a1cxQkYwRmk1eitoZkZQcXlCeWY1clkzd1pFdFJ4?=
 =?utf-8?B?WG5OeWR4UGhhQ2xsNCs3UGo3dkFOMEJodEQvZzM2Zm0xbHJVRHQ2NGNTL09j?=
 =?utf-8?B?UWxJWWdtNHU1bkNkNVBBQXZqdkI5Sm9DQUkwZ3VDT3ptVTNva0xSWE52eG5Z?=
 =?utf-8?B?SUxoOWpQMW1LaTdEV1U3MEVtWmIwMDFtTnhPWnpQVlZTQUZGWUo2QWJVNmpM?=
 =?utf-8?B?ZGdkdWpiWWh3SlFaMXBHQnVNQ3RVY3dDOGZzYUNpYmFRUUdLNE5pSTBPQS9m?=
 =?utf-8?B?VW40NjFHRVQ3NVNua3Bqbk1tMTNpcHpxVEwyZ1B3REFvYTgwQnJ4NjBXNU9B?=
 =?utf-8?B?SmRON2dYWXRYeEFGWkU1cGlVNWFRaXlHanlpUE5nUjhDeWh1ZW9qblVyQ2VF?=
 =?utf-8?B?V1pBZ0NKdnFySS9yRjNlZkkyR1FhYit6TUtlVC91cExlajYxRFFHOXJybHdp?=
 =?utf-8?B?T3hpVWgyV2o1ZUFYb0RuSEdaaC9leGREczUwTmpTL09xZVFTRnBBWWN5clhH?=
 =?utf-8?B?NG9WSW14b0ZrRTZaSE90RDVxSmQ4bFJsMDBsVmNTQXZ0Ui8wVzI1cy9BYXhY?=
 =?utf-8?B?VGdNOFFjcUFQMnlja051SUt0OVRkOU9OdU9RY1VrY1BieWZKbnFuMFBIY3Ax?=
 =?utf-8?B?Z3owMDd0OEdrQ3BEQlFEaEtKKzlsQjRHSVh2N040RURFMC93RE5Bd2FYRGwx?=
 =?utf-8?B?bjRobHJ5cFlLVEVQNkxtUE1IeU1XZzRpdUpEMDJnUXBEMFZCVUVyQUI5NTQ3?=
 =?utf-8?B?U1FDMS9Xc1h0TEM1dGdZQzVZZVQyNTlYb0pIZTFBVFFxb0pRLzM2SGQydkk0?=
 =?utf-8?B?bnl0S1VrbCtNaGVVTUpoR3BzTU03ZERkSllkeVY3M1FPVjBXZjJ5NmFmUVZE?=
 =?utf-8?B?VDJPNFg3UVNDSmJKN3JyL1VnTmU4L09xdFBsTkF1R0l5U1lOaGt1SzdGeElw?=
 =?utf-8?Q?S+awNhR6DIoAn?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 08:07:12.9683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afddc87-be64-465b-44df-08dc62a33783
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6560

SGkgTWljaGFsLA0KDQo+PiArICAgIGZvciAoIGNlbGxzID0gcmVnLCBpID0gMDsgY2VsbHMgPCBy
ZWcgKyBucl9jZWxsczsgaSsrLCBjZWxscyArPSByZWdfc2l6ZSApDQo+PiArICAgIHsNCj4+ICsg
ICAgICAgIHU2NCBzdGFydCA9IGR0X3JlYWRfbnVtYmVyKGNlbGxzLCBhZGRyY2VsbHMpOw0KPiBX
ZSBzaG91bGQgbm8gbG9uZ2VyIHVzZSBMaW51eCBkZXJpdmVkIHR5cGVzIGxpa2UgdTY0LiBVc2Ug
dWludDY0X3QuDQo+IA0KPj4gKyAgICAgICAgdTY0IHNpemUgPSBkdF9yZWFkX251bWJlcihjZWxs
cyArIGFkZHJjZWxscywgc2l6ZWNlbGxzKTsNCj4+ICsNCj4+ICsgICAgICAgIGR0X2RwcmludGso
IiAgQmFuayAlZDogJSMiUFJJeDY0Ii0+JSMiUFJJeDY0IlxuIiwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgaSwgc3RhcnQsIHN0YXJ0ICsgc2l6ZSk7DQo+IGkgaXMgdW5zaWduZWQgc28gdGhlIGNv
cnJlY3QgZm9ybWF0IHNwZWNpZmllciBzaG91bGQgYmUgJXUNCg0KUmlnaHQsIHNob3VsZCBoYXZl
IGJlZW4gbW9yZSBjYXJlZnVsIHdoZW4gY29weWluZyB0aGUgY29kZSBmcm9tIGFib3ZlDQoNCj4+
IA0KPj4gK3ZvaWQgX19pbml0IHNobV9tZW1fbm9kZV9maWxsX3JlZ19yYW5nZShjb25zdCBzdHJ1
Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBfX2JlMzIgKnJlZywgaW50ICpucl9jZWxscywNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IGFkZHJjZWxscywgaW50IHNpemVjZWxscykN
Cj4+ICt7DQo+PiArICAgIGNvbnN0IHN0cnVjdCBtZW1iYW5rcyAqbWVtID0gJmtpbmZvLT5zaG1f
bWVtLmNvbW1vbjsNCj4+ICsgICAgdW5zaWduZWQgaW50IGk7DQo+PiArICAgIF9fYmUzMiAqY2Vs
bHM7DQo+PiArDQo+PiArICAgIEJVR19PTighbnJfY2VsbHMgfHwgIXJlZyk7DQo+PiArDQo+PiAr
ICAgIGNlbGxzID0gJnJlZ1sqbnJfY2VsbHNdOw0KPj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IG1l
bS0+bnJfYmFua3M7IGkrKyApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHU2NCBzdGFydCA9IG1l
bS0+YmFua1tpXS5zdGFydDsNCj4gZGl0dG8NCg0KV2lsbCBmaXgsIGhlcmUgcGFkZHJfdCBzaG91
bGQgYmUgb2sgaXNu4oCZdCBpdD8NCg0KPiANCj4gUmVzdCBMR1RNOg0KPiBSZXZpZXdlZC1ieTog
TWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCg0KVGhhbmtzLCBJIHdpbGwgc2Vu
ZCB0aGUgbmV4dCBvbmUgc2hvcnRseS4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

