Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 921FAA1D744
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 14:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877910.1288078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcPUr-0007zO-Rj; Mon, 27 Jan 2025 13:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877910.1288078; Mon, 27 Jan 2025 13:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcPUr-0007xG-OD; Mon, 27 Jan 2025 13:49:49 +0000
Received: by outflank-mailman (input) for mailman id 877910;
 Mon, 27 Jan 2025 13:49:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0bb=UT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tcPUq-0007x9-6l
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 13:49:48 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2607::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 919244ad-dcb5-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 14:49:46 +0100 (CET)
Received: from DU2PR04CA0080.eurprd04.prod.outlook.com (2603:10a6:10:232::25)
 by DB9PR08MB8292.eurprd08.prod.outlook.com (2603:10a6:10:3dc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 13:49:36 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::2f) by DU2PR04CA0080.outlook.office365.com
 (2603:10a6:10:232::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.22 via Frontend Transport; Mon,
 27 Jan 2025 13:49:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8
 via Frontend Transport; Mon, 27 Jan 2025 13:49:35 +0000
Received: ("Tessian outbound 3f086efbd534:v554");
 Mon, 27 Jan 2025 13:49:35 +0000
Received: from L5e1b1e800378.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F76D4DD-30B3-4CB3-B44F-D3BC953EC67C.1; 
 Mon, 27 Jan 2025 13:49:24 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5e1b1e800378.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Jan 2025 13:49:24 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AM0PR08MB5299.eurprd08.prod.outlook.com (2603:10a6:208:18d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 13:49:21 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 13:49:21 +0000
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
X-Inumbo-ID: 919244ad-dcb5-11ef-a0e6-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ezP/MHPLh0t6+21H+8ewSZbEJVCBfP1J50+kxod5MSKldAsYa5qjfHJpvqClVGewk6XwuP/hL9XpWFalRaoBkdVgyifEhEIxSb3CRmkwD6DrtITEIwwTy/crYyJGbfU5dyCQOtLgmCnCPthCBiaZ7Pj38RNS0kqdA9aUTh01zKXfsKgrOl2+wMX3tE7qpLjytbev9IveUeLDkyEeIiKacEUltw7Nz8WIB+PYXfUmxYWYPkrId49BocYTpgMtaQwcKOoWSRzL7NHbeZMwBcaZufkICS0vi9jnqZg1EmS68/6RHxnc4mmybG0G7YZ/KJbQ5sLTFTKXOBey9LEt1Gn6Vg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDVONlOaMzAAscepU/LvtBClbG9Ra6Jrow4jwK4hiYk=;
 b=H/w0keL1NPSFkoVD+kMG/9S6mWVILOMcNGFx9jcOTmZSQptZDmiYtS58lAHdFYBxSwKeXZ+f/F0RFTvGrEOyG/5VUpDQOdy0Ju0eIOMrpPe1KyBeix0oIUzhE2LjQxR20uGvt2Fk70VFwv9Y3QuPTL0kWTFC0pbLG9+q74lCU6K2wHfDxnflMGXU69gXsFe6nNsZ1UycCqzehU1pyurPKzvAHN228+HYEftcg/CzJIrFK8dZe0rNWlz2uO86AuV4sOo9wlmp5bTNQhlj/ImPmBoJTcuMIJirPmL4AvX1uqHCBrDyUxBzqR78KEACOk3spSw/wCILLfaTxVN9fjJFPA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDVONlOaMzAAscepU/LvtBClbG9Ra6Jrow4jwK4hiYk=;
 b=l9ZXrGKzjn1QCW5fsoy5d5vpLk68/GRGl8c8uTOG6PjozrbyePTf1ekaqgTP8iBvbYgNqbHJ5uYb16ZX5UJcVwwlxEVqjdegUfZLzIU6lnV7KYTNsggauMAMtLMoffkAIIlXsYhbMnaj6+KFGZlI2oaXSThwsTI7BdzEE52eEmM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 105e37ae198f7235
X-TessianGatewayMetadata: UB0iCwI2A+4kZnBGoebtohqdR19MaoYFPOnjXpmtbvvhyKrVfMsCfHE6Zt4a6wEnJk+EvvgjX86jabpzXx/v0udzRgsdL15NQcOqJmdSRj8bB+NVsfrVkjjvfequVw8/SlOmOrx79mJk7/TfM1oO+p0te77ML2EvBYQCknDCQpo=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cou9TVYqDwtqhyP2ZFLhZXVJMRVf27VNTBeElRtd38Dq8DqVQru4hqSWrlx9PLV84Cm7PXVJjqha0Cdrkvg+X6zShtKC2MfflfMORP4jKC4AQWEoN7zrLq8Z/oXyj+iLZ19JJy1vtW9ObL7MooGsAid6nVG9GztBDtVKzzfdD95QsCTOnaG2U8ue85ldxk60psTSgk6u2nscK1nQEDIFjCKDVy1f535wKI3zonwYQ9VcrN9gHjzkScmoFKowhAhmGsfYf0wZQccP7P+IdtuiBaXvG66qALK8s4my5PSNu+scaLiUqLaZ/hagZcVUSk0Y4JgaujYAfnl2IF2l/pYFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDVONlOaMzAAscepU/LvtBClbG9Ra6Jrow4jwK4hiYk=;
 b=gcGqOlwylvnlQorEcR+BScvUvfzR3bElsJqm9jaCbt8mv2zJQ5/vqUpo6gVRvqV6ADQwDy+1m6njZXxfjU+ZZRT3Kz7YRf1lY+QMHjcAqy8nwUI5lpLqWW/jcT+g+CNkf3IjrQo1v6OLF/gy9R6aw3s32+qUUDdBibB/u2FihPZLWAANu19ft+lEVT1ciFMNlzRlUg5659F5FkUFs7V3vDoFxrpH/V3E6BaLobW/bXvBHA9STzb6rMQmgGi0s3tB0TUFkOEeNMa1V2kj8Z/ckhPGItfLIL48P9cUrlttGi/GucVqB/imx3h7nTntyaLko5mez/BxJcC8A3ZxaQsYiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDVONlOaMzAAscepU/LvtBClbG9Ra6Jrow4jwK4hiYk=;
 b=l9ZXrGKzjn1QCW5fsoy5d5vpLk68/GRGl8c8uTOG6PjozrbyePTf1ekaqgTP8iBvbYgNqbHJ5uYb16ZX5UJcVwwlxEVqjdegUfZLzIU6lnV7KYTNsggauMAMtLMoffkAIIlXsYhbMnaj6+KFGZlI2oaXSThwsTI7BdzEE52eEmM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>
Subject: Re: [for-4.20][PATCH 1/2] device-tree: bootfdt: Fix build issue when
 CONFIG_PHYS_ADDR_T_32=y
Thread-Topic: [for-4.20][PATCH 1/2] device-tree: bootfdt: Fix build issue when
 CONFIG_PHYS_ADDR_T_32=y
Thread-Index: AQHbcKi0NT74rrzyi0qViFqbxBUYTLMqoxIA
Date: Mon, 27 Jan 2025 13:49:21 +0000
Message-ID: <0093AD65-878F-47FE-B7E8-7CD562AD01F8@arm.com>
References: <20250127104556.175641-1-michal.orzel@amd.com>
 <20250127104556.175641-2-michal.orzel@amd.com>
In-Reply-To: <20250127104556.175641-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AM0PR08MB5299:EE_|DU2PEPF00028D0F:EE_|DB9PR08MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a904a3-020c-4b0a-23b0-08dd3ed96f85
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WG5qZUxxd0xyN2xtNStFT1hoNldPRDh3WXllTGZnSURFTmdyaWZWZlZzQTBS?=
 =?utf-8?B?UytWMjhNQ1pDa0RwT0doaTFDa2x6MXhKQS9uRStITjhVT3RLTG1nRFdrTExy?=
 =?utf-8?B?MEtZUTZqNXhaL05PbHlVZFdxV1A5dHV5ZEswN0NtSnlCRWpVdjlvR1k4Vjho?=
 =?utf-8?B?TUZqdEZ0b0kyLzhYMWxvVVo2OWV1TW4vMUY5cWNQb3F4djlGQlhmYzcrcE1w?=
 =?utf-8?B?K3dUUW9iQ09NeXdJeDBzbWRzemVxRFhyaVlSZnpOOHU0eFJRdGk2VEVRM1dX?=
 =?utf-8?B?Wlloc3RjYXl6Y0hoRjVEZmNHaGlWTTF5RExTZGc3cjJqcStIMmdYb2pqT3pt?=
 =?utf-8?B?QzNybW1OTE15RVplQ2l5QmtZNVVFWVgvOWoxWlQ3UjhybVZGdFRENVhraGh4?=
 =?utf-8?B?WnpPaFhYWHJPWG4xa2pLUWdzQVhLTmFHUENiK2ZPaWxTNkRzbHE5UFNEd284?=
 =?utf-8?B?by85OEVkbjhpVXp4eWhjLzZ5ZWNoK3JDMDB4ZDFzWm5TcUtSU0VFYzdydjNl?=
 =?utf-8?B?OFB1WE1SNTl0WGkxNHNjdzU0aEFoWWJndCtqc21kVTJLL2NIalZwblJocCs4?=
 =?utf-8?B?cHVMOGV3TGN4OVVvUVNMaURFTVdPRGgvTEZNdUVoc0pmNXVBTUdoK1pOaVZI?=
 =?utf-8?B?WnNjRitmZFlZaDl2NHkwRHMxYzFUZ2JacWtpdXZhamZSSkxFS2tIQ2dnTE9N?=
 =?utf-8?B?WEVSdTlhSEVnT1FLTVlVaklvZ0dzZWpkeE9JY0NyOTQ5TFRENGtBZEV1aHVk?=
 =?utf-8?B?ZHVWbkxQNjRjY0I1MCtWaE9VemdycnJaazFmOW5pQnRoTTR4WkdLd1U4T2wx?=
 =?utf-8?B?S3BkS2VON0VSR0ZkTVArUVNKK09hVUZGQy9KVC8zd2FCM3EycytUYmtCQzUz?=
 =?utf-8?B?aFpiR3pzUE1IUkx3ZlNpemRWN3JJRGNmdEhJaldoOVNiYnZxRE1LKzg1Ykkr?=
 =?utf-8?B?STBRd3VpcldKNW81NExDRXB2QUV4dVY3TVVUOTJBWThYSW1YVitvVGFHRVQ3?=
 =?utf-8?B?Wm8zb2hDVm4xNW0vQXpka2VnTExrdTFBRFVFVFlBYjBia1lpd3hxSWZ3bWkz?=
 =?utf-8?B?cUtBcklRaVhaNnFtRWFsVDUxL2RHSElmNzZPNzFlMHRqaklwUmo1V2ZIV09V?=
 =?utf-8?B?ZnR2b1dRemowYUJKLzlwS2RHTFhzVDdkUFM4YkVOQjV0QUtHMHNZeTlyYWVB?=
 =?utf-8?B?M0gwUU00TDRUNnQ4YnlESk5UK05HTkFsK3QzY3lJZVN2cUpHOFMzeEpJY2ZZ?=
 =?utf-8?B?QnVrbjlNL2pUVzVVMXFKQUJCVG9Ja3BwNUlmNVdVaWVqYk5JbnNOandhNXZY?=
 =?utf-8?B?cDRPWFU0RHRYWkxwU0xKUjlJaDBEWWlKRmNNNy95dzF1N2RFMWZEVHVWWTEz?=
 =?utf-8?B?cGhYK1BvNjF0ZDFuUEhYcERGS2JzcVRvZzA0R2FMTEd5clpjdmJLbUhtZS95?=
 =?utf-8?B?dFYyWnhybE8rd2p4K0FTS3hlS1dJRnh2ZTZjR0VqZlZMZDRtRDV6YjBCTytq?=
 =?utf-8?B?YnYxRGc0MXR2bTVtd3BPbUFmdEJDWlJTSXJnbTIwbnB4bzJkWURIWFNkZmJh?=
 =?utf-8?B?WHNEa3NNNFZhNmJrNFlQUWFZV0FDVW8renF6a1lJWGRHRldRbUdGVjhMVW1C?=
 =?utf-8?B?aDBEamQvU0Q1MjE0M3VnWEtKU09SNzh1VU4yWklhbUVBVmRxTGYvbGFsaHFz?=
 =?utf-8?B?QlN2VGlpVWk5aUtUaUV0WW5SaER0cWJOMnJJbGJmV0RTUzBGWXRWcmllSUhv?=
 =?utf-8?B?ejFTdXRnVldLR0IybFhGUmxhS2p1UVpQU1F6SzVsS3lYZHlYMmd6M09ma3NX?=
 =?utf-8?B?ek8zU3VKb0cweVUxK29vWGNqZnJZU1RoOXYyTVk5bVZOc3ZFTmFSaHNLK3da?=
 =?utf-8?B?Zm04aVhnR1JrVGtIRm5WdE1HWllRUVNCR215TWFWallhOG50MGR0OEJLbDVB?=
 =?utf-8?Q?QQ+5U3oo4ATZL79bDvUo0xrbKmdHuYQm?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <73CC14FA2788DE42B40E1F85AE8E8607@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5299
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a496d90b-cfd8-4f5c-623b-08dd3ed9671d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RktDVFJQeUt5TWxGWUY2aWQ0Wnd2d1ZXY1lWeFF0TFNGbU9tNGM0M2FhS0hV?=
 =?utf-8?B?dE5XcVJxQnc5VHRBMHp3YVpxaXU2WTUrc29GUG1LdCtITHgyVUpXUVRTamFY?=
 =?utf-8?B?OVJWemR5NERCVDIzaE1KN210NHZJT1RhY2l6WTZ2MXU2OVhuVGluMElQb1JH?=
 =?utf-8?B?bnYyUE83OUhCUWUrdU5oekw1UkVnMExhcndURjJ0WGFrYkRqd0RMaXFMMXdi?=
 =?utf-8?B?VXBYNkwzcVNCdUxrRU0zd1lOaVo4d00wM1hHWEM5S0MxVWhLVHFMaldFcHl4?=
 =?utf-8?B?VzU2ZUJ6WFpxTmxhbWNhRmE1N1dlTTA2MFo0VjFacXJhaExnNUgvZTVndHhH?=
 =?utf-8?B?bWp3YTdjOXhOVlNLUER5emFLMW9VM2d6V3MrenJtSWJYVHQ1SGpVdFZKMW1M?=
 =?utf-8?B?YllxUkVvYXVpYVB4WHg2bk5FUnhEcFU4ZlFIWTVDQmNSd3liN2E5eXcrZkxO?=
 =?utf-8?B?K3o3UVpPSlh6MEFrOGNLazZ2bExRd25kNFQ3QTdXRVVtMEk3WXJkbGNRR011?=
 =?utf-8?B?NzBkSTVNVTRqM3A2ZHA2R1ZmMU5YVUQ0dHUzNE5BVU01QUpIZjdRME1jdU9a?=
 =?utf-8?B?TWlIdlZDN01TM0h2THZtTDZ3Ni9YN2RyeWlCNS9qT2twQ3R6VHRYTDd5OGNx?=
 =?utf-8?B?UnZUT0NtcmxGeDZZTThtREhLdDVpRytWbFRMTkpqN2g0Q0ttRzk0WTU4R1A2?=
 =?utf-8?B?U21zZ0hwdEZZd2N0dUUyZHJJSjMzS1VHMFlldHZvWSttMURYTjYxQTRTbzVG?=
 =?utf-8?B?eVBacmljSnlIL2ZqZUl1WlFxL1Q1bm1ZTDV3a3crZVE4djZxOHlXVHMwanM1?=
 =?utf-8?B?Qklva2xXYUYyRUVjL2Q1RndWY1MzQWt6NUUybWNuYlBWdUZhemJnZlU4SDhy?=
 =?utf-8?B?WTE5b0didnVjR3d5RDFrWHZkcFNVK1gvUWF0UENwVE1qYmM2YitXQzVlMXRF?=
 =?utf-8?B?SGlqZGNQRy9XZWVQU0FQc1FWdGlnY2pPM3YwWi93S0JRcUt0M0VkQ3EvQ0pu?=
 =?utf-8?B?U2RlOTRDV3p0V3BaOU1MeXZpOVZsbnVGZ1ZZZDhlWHYyT0FONGFRYmJ2ZW5Z?=
 =?utf-8?B?NGFBT2Z0eExydEJubnZIb0N3UlBEdC92anFpdDZLYldHZStqRkRwUkN6SVA5?=
 =?utf-8?B?eG1OS2I0cVhkaSsxLzUzOGxxN01xT2tMaHN1dS80MGNRdG8yQnh2dWxlT3oz?=
 =?utf-8?B?cFlVenl5bmJDbnBNQkdScGppWnk2ck56RTAxYUl5QmRGY0lKRlcvZDVva3FX?=
 =?utf-8?B?NFdrZ0FvZ0dieTZobnNMZlRqamxvU2srT0lRTmJZaTdmTmJDZ3loZFV0V3U4?=
 =?utf-8?B?QXJ1cWFBVlBJZDZaaHRVQVAzVk5BQ2YzTHFVK1ZCWFEwMDNaNVg5SUFZQWpL?=
 =?utf-8?B?ZStXMjFZT2RTNndoR2g3MVBpRHYzeTczMW5HTVdLL0p5T3dVSUJtZ2VieVRv?=
 =?utf-8?B?N3JYWHNuV2VpZ1dCdy9ma1cyUVl6OTZYN0VuSG1jSWpsWUVJWUZEYmRUckJl?=
 =?utf-8?B?emN4aDM1TW9pa05ldjI1MkU3QjFBRDU1ZFBXR2tEYVJ4UkJKNkxJazEza3lO?=
 =?utf-8?B?TWVKNUtiUmNjdDg4dnByUkEwdkZFNkdEUUFPTFMxZ1VCVHc1QzE1MDlhbmNn?=
 =?utf-8?B?Mk5hZkppYUJIVUordE1EY0VTM2FMTUdkaXZMYmFERFhnRy9zMUlVZmM4VDRO?=
 =?utf-8?B?cUZmdTlISHZOa3ZvMW9BYXBmaEUrLzBvNVpLZzkyenN5b2V2UklZaTlsSm9o?=
 =?utf-8?B?clE1ZVJ4UkVJRGxLZlBnUGMxOTJpWEFYTTdNVFhLeCtRekk1VlRnNzE2SDBs?=
 =?utf-8?B?UlVybXFra2VtK2RiekdMd3NUMFR0NUJ4Uy8rcUtzbzJ2UW5ld21JaVZUR2ZB?=
 =?utf-8?B?REVLZHA0dGlVVWg4RHJzVlIrMGZDbUtFQ0xaMkx6WVU5eEZWN3cvQXNEaU1t?=
 =?utf-8?B?dG12THJrUjY1dGp3UUo0YXB4OER4ZnQ5bGxuUFhRY3JlcjdMd24ydkh5YkVR?=
 =?utf-8?Q?35+1mQAJQ1X7cmjNg2qsKftuaAcdQ0=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 13:49:35.6300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a904a3-020c-4b0a-23b0-08dd3ed96f85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8292

SGkgTWljaGFsLA0KDQo+IE9uIDI3IEphbiAyMDI1LCBhdCAxMDo0NSwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBBcm0zMiwgd2hlbiBDT05GSUdf
UEhZU19BRERSX1RfMzIgaXMgc2V0LCBhIGJ1aWxkIGZhaWx1cmUgaXMgb2JzZXJ2ZWQ6DQo+IGNv
bW1vbi9kZXZpY2UtdHJlZS9ib290ZmR0LmM6IEluIGZ1bmN0aW9uICdidWlsZF9hc3NlcnRpb25z
JzoNCj4gLi9pbmNsdWRlL3hlbi9tYWNyb3MuaDo0NzozMTogZXJyb3I6IHN0YXRpYyBhc3NlcnRp
b24gZmFpbGVkOiAiIShhbGlnbm9mKHN0cnVjdCBtZW1iYW5rcykgIT0gOCkiDQo+ICAgNDcgfCAj
ZGVmaW5lIEJVSUxEX0JVR19PTihjb25kKSAoeyBfU3RhdGljX2Fzc2VydCghKGNvbmQpLCAiISgi
ICNjb25kICIpIik7IH0pDQo+ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fg0KPiBjb21tb24vZGV2aWNlLXRyZWUvYm9vdGZkdC5jOjMxOjU6IG5vdGU6
IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnQlVJTERfQlVHX09OJw0KPiAgIDMxIHwgICAgIEJVSUxE
X0JVR19PTihhbGlnbm9mKHN0cnVjdCBtZW1iYW5rcykgIT0gOCk7DQo+IA0KPiBXaGVuIENPTkZJ
R19QSFlTX0FERFJfVF8zMiBpcyBzZXQsIHBhZGRyX3QgaXMgZGVmaW5lZCBhcyB1bnNpZ25lZCBs
b25nLA0KPiB0aGVyZWZvcmUgdGhlIHN0cnVjdCBtZW1iYW5rcyBhbGlnbm1lbnQgaXMgNEIuIEZp
eCBpdC4NCj4gDQo+IEZpeGVzOiAyMjA5YzFlMzViNDcgKCJ4ZW4vYXJtOiBJbnRyb2R1Y2UgYSBn
ZW5lcmljIHdheSB0byBhY2Nlc3MgbWVtb3J5IGJhbmsgc3RydWN0dXJlcyIpDQo+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IC0tLQ0KDQoNCkFw
YXJ0IGZyb20gSnVsaWVu4oCZcyBjb21tZW50cyBmb3Igd2hpY2ggSeKAmWxsIGxlYXZlIHlvdSBi
b3RoIHRvIGFncmVlIG9uIGEgc29sdXRpb24sIEnigJl2ZSByZXByb2R1Y2VkDQp0aGUgaXNzdWUg
YW5kIHRlc3RlZCB0aGF0IHlvdXIgY2hhbmdlIGlzIGZpeGluZyBpdCBhbmQgaXTigJlzIG5vdCBi
cmVha2luZyBhIGRpZmZlcmVudCBzZXR1cCAoZS5nLiA2NCBiaXQpLg0KDQpSZXZpZXdlZC1ieTog
THVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KVGVzdGVkLWJ5OiBMdWNhIEZh
bmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg==

