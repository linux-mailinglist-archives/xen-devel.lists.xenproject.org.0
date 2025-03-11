Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB80A5D26B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 23:17:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909469.1316406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts7uT-0004On-Q8; Tue, 11 Mar 2025 22:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909469.1316406; Tue, 11 Mar 2025 22:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts7uT-0004Lm-NG; Tue, 11 Mar 2025 22:17:13 +0000
Received: by outflank-mailman (input) for mailman id 909469;
 Tue, 11 Mar 2025 22:17:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+I6a=V6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ts7uR-0003Zb-IV
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 22:17:11 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 911a4cf0-fec6-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 23:17:06 +0100 (CET)
Received: from AS4P190CA0030.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::20)
 by AM8PR08MB5809.eurprd08.prod.outlook.com (2603:10a6:20b:1db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 22:17:02 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::92) by AS4P190CA0030.outlook.office365.com
 (2603:10a6:20b:5d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Tue,
 11 Mar 2025 22:17:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Tue, 11 Mar 2025 22:17:01 +0000
Received: ("Tessian outbound ae00a21450c4:v585");
 Tue, 11 Mar 2025 22:17:01 +0000
Received: from L06c021940419.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BBE84A74-988D-4404-8119-C47C5D8366B6.1; 
 Tue, 11 Mar 2025 22:16:54 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L06c021940419.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Mar 2025 22:16:54 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DU2PR08MB7342.eurprd08.prod.outlook.com (2603:10a6:10:2f1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Tue, 11 Mar 2025 22:16:52 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 22:16:52 +0000
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
X-Inumbo-ID: 911a4cf0-fec6-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=i8QcXMU2GsZDtK2poDGWghU3yoJIyG6lX5/K2D6TZGoWXHPuHG8qBpvVHJ7ozhjVMuZ3gNlzuGI/4CjApjUIgKWbL/JAYXw6GBbND6pzENLqMKnbUgcnGncUGGfrnTN+1/AbdRLJILBnAe8Brq5AyFK+b0PloT7A4veY7iHACpOsNyJsd+MJoL7AJurAyIBv+pf9xetAZLV4cHNObCNZNTQ2y8D69Cj/Er7dT/hYIdvQFUNMRy1ZPt4VZjbN3SgMiqJsCaPW7vsA/WISHKRyMCaEiRBr5BbRvq8hB6JRxnWOhXgUC+cONtxHlM1t65copNCMd4LbLOdOF1zVeHk0Vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/n23ikcJuIIN6XWtWA+dMZseR61xTCjqPd4Es8OcOlg=;
 b=x5t5ZC1wex2y/7Umg9mOE8TqlG/nmcR6MdeU0PXqUvQs4KaVebXzwfaitmd5Dc0fH/7/6j+NkgCHiUJ2I8tgLdjg600BzdLLTF9fdYueFowzYWX01vYiuTr0IdwCFk+4WnCh3DfqwD6UJVnDvAwZp39B7BU/DdjwX2urC2BYd++AM1/PEC4gaMa+azy27auTqvJn1eG8YHug4rqcEm+YsuzLlAn/J9+GNRDAAdfVvsV5g9i5o/qp38AXAXyCrhZJgJR5oyP/AqQTvQXEcoTWvY2ZC1pZaxi+WMNbK7LKa5/GkX0+gGBvMoarvvv0QmhOKdLD3l7SEVn40XTeAAQe7w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/n23ikcJuIIN6XWtWA+dMZseR61xTCjqPd4Es8OcOlg=;
 b=o3dtCLb/kXLa0MiViV60rVpNaA85sRRZhm7sfdyqJUNGJEMo06fqieQN1Acjc3i3LMOzjmLtB6v20fNx+A8yqswlsFEyU5O0usmV1iBbIqV83UzdgoHcCyvDjsW+8mE/v2Yc10DDBdpcrOaPOU91k7oc1tTdzoTHmtdJorB5/dc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0403e2c968953791
X-TessianGatewayMetadata: aHFma6JoBEXlcD34cdpz3Ap+/p4g9S8XuI1D3J0FDiBmbg24IFOR6+gIcW2lkItReYoO5cnySR/uA4xaqhh8eoDY7NAPSvasRsYqvYc3KVXBf0P+q52xOokwEgtBSm+8A7S9ZA5zbEatMGGbwqSIJzwFw1i3yID/tt3FPg/44Tg=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNIMhEqrymVNFq0Vh/Lp67d4gvU8l4D16jP6fZkqy5Z673b0Y7/7O2qKiSTruJxLizrXBKldjBXdvm13BglExsr5cHU1SKppbDlzAbi3d2LSqtFO0p3txbEnTimt2Hcunf1T3qxDGhN4OvkGTDQ//1uQBhBl90BUj/cChJsOD6agodErY3qu239kJAzlfbgAxvMy2ZkSxQzhtCX9dHYeHB0+B3FtZ9T0PXyU307VhHKxFt2FKspTvgXaoyXrzleA0GLDD28+XeveaenCP5IPPOrdbXjFJLXYJzcZHie+MPcH8kR50p17wPZzdFVUt1orTdcurRNAGdv7Qc6Z185i1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/n23ikcJuIIN6XWtWA+dMZseR61xTCjqPd4Es8OcOlg=;
 b=aKIx1vP93+oPqZCE0z8FHM1zJNb4FZzgxe2WRIY7M3/qQRqKaEIaADidoCmcJnHSJ2HducT+jUfMAlKiAAOalTzv8fhD7NTDsHBT3rhfJvcoR5S6xhE94SuIK3eTWidkOph/+sT3zSqyLTJ1ckry28eHQ2X7XajDVz2V/Wq1Fy6Jgd4KHpydqHA7OLiMgIZs7sE+k+KFzFuZaT2pdlRmyxwV3qZ/hhBftRDnFIh7e9/JWhl22Bhb9qwj4RRVGTVrs4sD0x0+tJpfDBhtAqONNd8in62SSgmPhHXiXtkyzigIRvb3y9zSYDY1uZ+D/4i2Cr8DMO8XjicDwLNpe377zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/n23ikcJuIIN6XWtWA+dMZseR61xTCjqPd4Es8OcOlg=;
 b=o3dtCLb/kXLa0MiViV60rVpNaA85sRRZhm7sfdyqJUNGJEMo06fqieQN1Acjc3i3LMOzjmLtB6v20fNx+A8yqswlsFEyU5O0usmV1iBbIqV83UzdgoHcCyvDjsW+8mE/v2Yc10DDBdpcrOaPOU91k7oc1tTdzoTHmtdJorB5/dc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH] x86/IDT: Fix IDT generation for INT $0x80
Thread-Topic: [PATCH] x86/IDT: Fix IDT generation for INT $0x80
Thread-Index: AQHbkswH4SMPnoeIB0qA1i1YYjL24bNugNeA
Date: Tue, 11 Mar 2025 22:16:51 +0000
Message-ID: <8D6654FA-E648-49DF-B9E4-84DD5729DA2E@arm.com>
References: <20250311212248.3630583-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250311212248.3630583-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DU2PR08MB7342:EE_|AMS0EPF000001AE:EE_|AM8PR08MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 298c812c-a388-40e6-2d27-08dd60ea72a2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RkFacncwVk03SFVZdXQ1Skp3VUpEOTVXMW5SUHZKd0JQQXYzeS94Q1JOTHox?=
 =?utf-8?B?UDdXS0s1S3pYdTZCSXExZ2E5TVI2bFNzc25SaFhUK1M4TWZBVCtkTW9TVElC?=
 =?utf-8?B?cUtzTk1kanJ0WVJyMDNsd09IenhmK3ZLemlhVVN5N0FwSml6VkFVbDRaQS9W?=
 =?utf-8?B?RjI0NnZBZWVad3BmOStsQjVVanUxcW1DZkh2ZEtkaW85MVlENnA3d2FRMmFL?=
 =?utf-8?B?SCtScHFIU1hwdjMvM2ZiVStNYWZOSll5dmNKS3JxWk9pd05aZWs3VHc5a08x?=
 =?utf-8?B?dXNxQ0h6Z1dLQ1RJZmFWbW5USENqU3BLcnN6Zmg5ZjVwcTZkNmRDSGQzYjRr?=
 =?utf-8?B?NkxVQWZKeHJGZ0dtRWYyTU5GSi9vV2lkYXBlNVNobEtFYWdacm9XT1VETEVH?=
 =?utf-8?B?cHZFQUdtYzV6VG5qTzJhaHNrSWFLbnZ1clRXWm9ab1UwbkFPenpYWVk3UVlH?=
 =?utf-8?B?aWZmVk1jWGtDZ3pXTFY5Vm1SeWxGVTQ1WkxIclRTMXBvVzhYbStOdU1wNTFR?=
 =?utf-8?B?NVQxejBFU1ZqTDNtRUlva3B6MjEyVXdNUnhoeXg1eDFxRzgyL3Z1bmo4aE5q?=
 =?utf-8?B?SHp5aGV2MmY5Slp6ZUFvdSs1S2NWaU9jT1UwZFZ4NlJLMzVPcnVKbFBwdTVJ?=
 =?utf-8?B?MFBTMVlJOTcvZlZGSjVXLzNBTUcwM21hSFJPcHFBOS92ZTJoK0lBQXk3SjNV?=
 =?utf-8?B?cmV3eXBiV0FPOEJwODF4aHR5bjRPVkhiNVRnL0cvMmk0VkhLSWlKNXpGVTFk?=
 =?utf-8?B?VEdUc3FkSTc2dXhwTlFWSnF6b2RraURCWDY0YmFmVHZrdHBvc2MxenZRZlpS?=
 =?utf-8?B?aGFoeVVLLzBSSkMwdjMrSmJNeUVjbDRvRXZxRFQzc2lEYUozUXFVS090UmZD?=
 =?utf-8?B?MTJLck5GOW05NTVKMlc3ZWpsVEJ5L3lrWFhPVlo2clg4WVRmeHcyUlV6Rm1H?=
 =?utf-8?B?MVphWlQxWWo5WVZiR3BzOFFsTzV1eDdEOHJwSGk3K3JPZWtscmFWYWVYQWh0?=
 =?utf-8?B?c1FGbjQ5R0ZtOXEvRDliQnRtWGhzcHJDWWhqeG1zb3dtVzZqdElqdEQwQnhF?=
 =?utf-8?B?UmduSU9nSlcvb2hoM01vNTJRYkdQeGNGV0kzR3NNT2RoZnZYbytuOHhFWjEx?=
 =?utf-8?B?WVMxSlpsNm0zQ0IzYzNuaEd0Szg4NCtmMVRhZWhQeEJ1T3dhclJRanpROG5Q?=
 =?utf-8?B?RjdDeFQzUURRc2RkL0kwUHovWEJRMUE3dk16cjcrZWtzSk1yK01OdWl1TGlz?=
 =?utf-8?B?dHNMc2V1Y3ZLbVBuYXYxbmtBMXozVGViMHJuREIxR3BCS3hxSzc0cHZiWitE?=
 =?utf-8?B?Zyt1VjFVTm82ZThqUVIvSGdEZUZkdE1ERE54NzRVYk5XS0RWK1czVFZRb2Q3?=
 =?utf-8?B?MXRyL3dVR3EyUEJQNWkxRWdYVmdQcE1NNHNPSVBVeUVURzVjcHd0U2hsY1NI?=
 =?utf-8?B?OVF2RnNjdk1oK0Q4U21hSGFRWXV3NkpoUEdyUjBJalRXZnlNakNaV3V1YXBR?=
 =?utf-8?B?Sit0TWZKd1RiU0UvbVkySjIwMGFHSGMwOUtIWnZoTFFKVFBIcjdrWitpMkRJ?=
 =?utf-8?B?OVovcUJkQTA4S0M1bkVLNEdKSmt4eXI5c0Jvay9Wb0xLVkVPNis0TDBmRnQ0?=
 =?utf-8?B?NGs1UXdDeFgvWlp1eTNKNFdJcjBrTVJ4TGRjcmY1SzV6aDNqcFVDMGJzMjZQ?=
 =?utf-8?B?enBVMlBERWwvMEFZY3c1ZTNwaEhPaEtWR0tta003TFZTSC9vejFpUUsxb04v?=
 =?utf-8?B?cWNOM1Rhb2VQS0NkVkxaTGtoNDFONGtCanNXbFErcDZDU3ovdE9yT1k2Y2py?=
 =?utf-8?B?QUJ3NVlBUXZ0d3YwWWp5ZThBelE2T3FMb1lVczMrRzJNMXJBYkwrRy9lOFJn?=
 =?utf-8?B?MjU3Q295OGppNnUyaTFOUVFPWjlJTWZialdZa245MnFiMG02c2RpaENHQVFj?=
 =?utf-8?Q?AsbqF2Wq6ZxgfnDQN6EuLb6Htyja7S4k?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5ED563C2D8D56D44AE8799C06BB19834@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7342
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:5:1c::25];domain=DB7PR08MB2987.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b68213d3-dab2-4287-c517-08dd60ea6cc9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXJXSld5SWRHLys5RHcyU0tqWWlETkNsWHNBeGtLMmxoTStEMmVwWkFSUXJK?=
 =?utf-8?B?aDU4NTB6QUoyV1h4RXR0c2V2VWtqSFdhQkRWL0ovQXZsTWNFUUx0eHdFdCth?=
 =?utf-8?B?Q1FBOHBHU216U2c2K1NpQ29OMGRXTTV5eFJzWGc0RW0wZURIck9GVjlZbSt2?=
 =?utf-8?B?ZGlGSzhnL2FTVGwzN1JoVmdOSjFvRWE4eEE1T2pTaFJkU2h0UlRCNGZ4ejBM?=
 =?utf-8?B?RU1zK0txOFFUUFNYL3VjOVRFeXMyK3gvWjBTUGh5R3BoLzhKY21OeDFoQ2dX?=
 =?utf-8?B?MHBwcEVhVHZ2endxK2p0WWZDUHRkYmo0VW84alVlNGdzdWFxSERVNGVmckUx?=
 =?utf-8?B?aElJTkhINWJsb0o5Y2dtQjVuY2tZVHhKK3pWMzNtUnhxY2h4UUU5WGhYZERT?=
 =?utf-8?B?OUZ6Y2JpNXgzakRCYmcyMHNSSStyVHpodjlDVVlHR3kyQ3p2MnVsa0hndGYz?=
 =?utf-8?B?bGExVDdPZEQyZWNzZDk1RHJJQ1dkc3hpUUE3STUyMHZvQWxEV3JMZTczaS9M?=
 =?utf-8?B?MnR6UmFaRi9IQmRKTUpKTVB0dURCTUlRVXpWa25wQldmRGE4bVcwUE9ML0tX?=
 =?utf-8?B?Y0g2Mmc5N2txdVZJMkpzQXh1YlF5SCtMK0hHSHJlN2xyOVJWNDFNVTBNZEtq?=
 =?utf-8?B?RE9pSUw2eWNmOW1NNE9IWm1Mc1FENWF0VFFWL0Rwbk5XUXBTdVVaeHJ3dzhP?=
 =?utf-8?B?aGRranRiSExoRlRHSXEvMHNEMnVoNVVhcVc1NGVoeStGNkNjVEs5QlVuVFJy?=
 =?utf-8?B?OW1wM1dIUThldHV3NWFQd2QxVnZsa2lJYk5hWnNCQzFOTXlFWnV4YVVka2Qw?=
 =?utf-8?B?Ymh1dElIZXZ6aUk1bE85SElBL1cySmxpdEpDVXNvOWJ5aU1iSVJoc0xkNDVH?=
 =?utf-8?B?ME1UQjVPeTB3eEw5M1pUWnFzalEzL2FwdGIxYlVCTUx0Vkowd0dTUHIzanM5?=
 =?utf-8?B?L3pIWU45b2VzSGlzdkgwY3hKSjlENXZ5a3ZpcnU1OGR3cnFyWUlMQ3NTTjhX?=
 =?utf-8?B?UW9aRHphOEtzdk8rQnRzRlpDZEhmbDZyZHVhcXZlckJIS1ZPUU9yZG9wSFR6?=
 =?utf-8?B?Wjc5Y3BwL0VWb0JrY1VwY0w4M3BvbE00NmttdUhoYzhlKy9zTVI3TXc4K3cz?=
 =?utf-8?B?QW5MbUZ0TDZaM3QwZkR1aEN1SS9vRkJyWVM4Z1lDdmlHNzdyTVlNTG9iK1U2?=
 =?utf-8?B?azBibk9ad2lmVFR1eG1RK0hYa2pXYWhQd3BmV3FNT29vMWRnQ3VoUy9XNUxv?=
 =?utf-8?B?Ti90WHZsV1djQjJlYUU5bW9NN0d2d25lWFhNeTN3b1RQYTNpMXFFalJ5YVlO?=
 =?utf-8?B?UnlRTWdBa0E4QlRRb2JkVDRXNTkrRWQrTmVTdCtGOXltZDRSN0FHOElwZ0ZV?=
 =?utf-8?B?ZjROM1BxQkVwSEV6WHB2azlhRmV4K3h0YTdRU2xhRy9BczRkNjVPVG9waHpq?=
 =?utf-8?B?TUFNTzhaVDRsQnhxeTBNV0d2aTF4bktvaUpGM2pnZkwxQnlDRFBYdHBYTUo1?=
 =?utf-8?B?RHIxcC9NVzFhREJ4YnBZZlRPWVhUL0VHZjV4c1cyUFJHN1pvUFB4UW9zRjBZ?=
 =?utf-8?B?WU5rUHQ1S2lrYVFnL29KOEtvWlM1aHFLQWJaSGRONDlpaWhNL2Y5UHoyVGVk?=
 =?utf-8?B?Y21CVUlkV3g2ZG5HR283UVpuaGRkb1hOYm9UVnN1cXBQVWRFd3pnckQrZkJM?=
 =?utf-8?B?blNDZ0dBVWZ4a3kyUDZUOE04YU45bXMxVmpNc0g5RUN0WWY3OHRyVU52MnZ6?=
 =?utf-8?B?SkEyRGdScldtWnBRZGZNZ0dFazdzQ3A5Y3E1MWs4a293enAyZkFaL0lldlVD?=
 =?utf-8?B?dTRWQ0h5ODkxUW5QWnE2YldVcndNTU9VRWM2eno1T2NtT2l4WktiUm81NnBh?=
 =?utf-8?B?a1dGUUl0a0Vtb2kvOWJZRGwzRlFwYVZzOVlsSEhRay8rYmM4K0MyOGNmaVZD?=
 =?utf-8?B?TEQ3cHZDdWJhcWRMc3c5d1I4K2dLZnpsK2UwVSs1eFdOY1FNRTJoT0xKNjFT?=
 =?utf-8?Q?PecZxfgbL0TD68L5JdxPSW0osZJk3k=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 22:17:01.7698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 298c812c-a388-40e6-2d27-08dd60ea72a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5809

SGkgQW5kcmV3LA0KDQo+IE9uIDExIE1hciAyMDI1LCBhdCAyMToyMiwgQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBXaGVuIFBWIGlzIGVuYWJs
ZWQsIGVudHJ5X2ludDgwIG5lZWRzIHRvIGJlIERQTDMsIG5vdCBEUEwwLg0KPiANCj4gVGhpcyBj
YXVzZXMgdGhlIFhTQS0yNTkgUG9DIHRvIGZhaWwgd2l0aDoNCj4gDQo+ICAtLS0gWGVuIFRlc3Qg
RnJhbWV3b3JrIC0tLQ0KPiAgRW52aXJvbm1lbnQ6IFBWIDY0Yml0IChMb25nIG1vZGUgNCBsZXZl
bHMpDQo+ICBYU0EtMjU5IFBvQw0KPiAgRXJyb3I6IFVuZXhwZWN0ZWQgZmF1bHQgMHg4MDBkMDgw
MiwgI0dQW0lEVFsyNTZdXQ0KPiAgVGVzdCByZXN1bHQ6IEVSUk9SDQo+IA0KPiAoQ2xlYXJseSBJ
IGhhdmUgYSBidWcgaW4gWFRGJ3MgcmVuZGVyaW5nIG9mIHRoZSBlcnJvciBjb2RlIHRvby4pDQo+
IA0KPiBSZXBvcnRlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pg0KDQpJ4oCZdmUgcnVubmVkIFhURiBvbiB0aGlzIG9uZSBhbmQgSSBjb25maXJtIGl0IHNvbHZl
cyB0aGUgaXNzdWU6DQoNClRlc3RlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBh
cm0uY29tPg0KDQoNCg==

