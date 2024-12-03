Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60039E2503
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 16:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848050.1263076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIVEN-0005tx-TE; Tue, 03 Dec 2024 15:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848050.1263076; Tue, 03 Dec 2024 15:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIVEN-0005ql-Pi; Tue, 03 Dec 2024 15:54:31 +0000
Received: by outflank-mailman (input) for mailman id 848050;
 Tue, 03 Dec 2024 15:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaGl=S4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tIVEM-0005cM-1F
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 15:54:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f403:2612::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dff4cade-b18e-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 16:54:27 +0100 (CET)
Received: from DU2PR04CA0320.eurprd04.prod.outlook.com (2603:10a6:10:2b5::25)
 by DB9PR08MB8652.eurprd08.prod.outlook.com (2603:10a6:10:3d0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Tue, 3 Dec
 2024 15:54:22 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::14) by DU2PR04CA0320.outlook.office365.com
 (2603:10a6:10:2b5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Tue,
 3 Dec 2024 15:54:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 15:54:20 +0000
Received: ("Tessian outbound 206fab1c37e0:v514");
 Tue, 03 Dec 2024 15:54:19 +0000
Received: from L4a802d8ed828.4
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E0882D8A-D090-4D06-A751-12B2DE7CCE90.1; 
 Tue, 03 Dec 2024 15:54:09 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L4a802d8ed828.4 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Dec 2024 15:54:09 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by GVXPR08MB7848.eurprd08.prod.outlook.com (2603:10a6:150:16::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Tue, 3 Dec
 2024 15:54:06 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 15:54:06 +0000
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
X-Inumbo-ID: dff4cade-b18e-11ef-a0d3-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B+Qtbw9oyaE1lAGPzMT8VEuxeodYK3+iD8E8i8mzZHzIJG0rak/4Nq8uOcK43qjz2WoG9z7vmgi6uGcVXWFtUR1eDSsZNl3wvY548zcxhTnIiMFsqHIWn1aVZ2cjBzoNwtSyVAWT6DQ8NtoUYVPkpgUQHXCA1DVb3dipaRJNJo8NyPStC4bIpg/PI5b8McY2KcReOfOOu3NSPxdyxjt+E9jVWalMTQJzxDuyT38gPYTvQYoSxgKF+tgg/jeUpGzYtrOJUy8b/8DZpwuIEFCuc6v6vYzFVFIWTP4OYjg1QYOLneChs40hZW0PEl3GMoyuu09vFR2mmvmuxHyJiUubgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfdpysEpVYmCg3juruySqhZcoVCTgjl+WYsJi5jecUg=;
 b=HzRZDY+EKrekH28A5cb6io+E772meaZ2nIOGhYKfGLamFaWlj2r+16x5dwra1MdO9od8SSsyVeI7EmhUQhTArZki4Pd1WFsA39L1y3w7juEfcKKZEkeG51wr9IatpfbRKUUtKsLsTq0x4IAhUAjZd94BJhYfgAJLKptevSd5Y7vYlR06hkmYpEEB05/9U0F0oKywKs78KzRdMmQR9SjSQ/OWSSWOA9lC1+oOFJzwTtZv8ouBQUfqY7k9JhI/J/Qr9zoP45g1I2hKo40t2PVRSPCjTkTxDwp7tKxofXfMAn9+mPmBvftAYRltJfdb+5hYuyaAMoRGDgTC4knJjA0k/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfdpysEpVYmCg3juruySqhZcoVCTgjl+WYsJi5jecUg=;
 b=WJtcuHKeANc8/OaKx5RJYSepl12CmXhA47sJE8MneE4gakqms/zDRCHYVzg9eBAJTIv8egzn/bm/N2zGfCMppkd4O+ktbrx8749y5JSXLCDBsmwl6OCOb2fENurWmI2Xeg0HWxeJ4UiKeS+5lmGNoQ44mdOUw042mrQvM0gCDvE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 010ef2828509d02d
X-TessianGatewayMetadata: 9+hyyYhcfGB19mYMjSpKybmbsakIIFk2A9XZHmqADX7lE02beVJIhn26qWYMejnJMSXO3wdk6UeKTKkv6jamCFLtrQN4qjnxOW9xQNPqz2gBltPjPqQKqb3wl5//oySxxVfy1K4yp115D86yitSiphYIMnVGhs55QjVWFPu1kIE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsea1hoiotbjsIDRX8p9Uqc9TC7iEmhbjUYia4Hs2UCnojkNqbwvsIxq5/PBa/7hhQlMPIQUd9uPyTTHXGSgcaHtCUgW/WFvca/uipz+4LUaNj87WEgclvrpI0OJboUoebELudunZ39qa+Z5xL9pyntwD2Zx43cJtNExJMfg78ls3t3o9/6++bVNa67bAn0rkYTH9R/vu/MILHb1W2pxKrdr3HwmM/Umy0MV7+26c09oR+dveinEeCxTEAECs9eeWqUdLzQFlDFiv69qWpKFKXv+Xo3qq6cCIvLY3XgiD2TJuOs2pu0736tcdPWGaLM7VE9yb3KWdIE5ojWF2NDwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfdpysEpVYmCg3juruySqhZcoVCTgjl+WYsJi5jecUg=;
 b=r6RIGH0S/DPl1KjRO64beuU35tBncyL1SCdUG139WJtUUCARGscPsEgPWIU+JvaFKjq6HzSasGuhtCJXoreE+0iobVpz9EEP2e4U83Q3dHR+QWvhkpcCHXxyECfyORcIGwDWhbEORVBMA7c2n1Rmeygkwn4XdeCeyvNX5cSQ7aJM2qQQYBQFhg4KHoawhCcnnI6cJKP9kvTvNSvgiKtP1enI9JhPLV4HffC07tOLiUFerlQ4tc6gJupfNotXGn8bQqVHJpm4lZh16wvXuFuKty3CvL0xZmDFKGwQJPVJYv11pVvDVin8ZNnrGqmzWbBpMB26SVXXa5FjvKW2fhipHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfdpysEpVYmCg3juruySqhZcoVCTgjl+WYsJi5jecUg=;
 b=WJtcuHKeANc8/OaKx5RJYSepl12CmXhA47sJE8MneE4gakqms/zDRCHYVzg9eBAJTIv8egzn/bm/N2zGfCMppkd4O+ktbrx8749y5JSXLCDBsmwl6OCOb2fENurWmI2Xeg0HWxeJ4UiKeS+5lmGNoQ44mdOUw042mrQvM0gCDvE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] xen/mpu: Map early uart when earlyprintk on
Thread-Topic: [PATCH v2 1/2] xen/mpu: Map early uart when earlyprintk on
Thread-Index: AQHbRWz5mao3stJzR02TMW5lND/1eLLUrCiA
Date: Tue, 3 Dec 2024 15:54:05 +0000
Message-ID: <433175CF-550A-4AF8-9422-5411D0107653@arm.com>
References: <20241127183906.485824-1-ayan.kumar.halder@amd.com>
 <20241127183906.485824-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20241127183906.485824-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|GVXPR08MB7848:EE_|DB1PEPF00050A00:EE_|DB9PR08MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: 98007401-c0c8-46b8-8d63-08dd13b2c029
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VmdKMUpsTFJqOThkaWRrTHRnK1pveGY3NlRBc0RnM25QVUhGRVFiK3dmQ2FG?=
 =?utf-8?B?RlN0SkZHbHVNY3o2SFpOU2xEWC9yTHFQcmJYY3hHb3NMMEJVM0czMnN1RWhQ?=
 =?utf-8?B?NEFBM1N5MSt2My9zelB2SXZXUEhtbVcrSU5ZM3JnZU9RZ1ZVSUl4MHozTUNx?=
 =?utf-8?B?RHU2U3BJQVR5TFJLbU5kc1R2SDZSVUgyTkkvVWVQZDdPNG9HMXMva1FrRVlz?=
 =?utf-8?B?TlJmR3ZsK0E1Y2Rqa0drVUUxMTFabHdnaXVYV2V3akpYdFFCb3dST3JXc0pp?=
 =?utf-8?B?TFhNSDg4bDNjb2hveTJqVGYvSGU3T3JnVEhvc0QrZEp6d2c1VE9rVTUydVds?=
 =?utf-8?B?WXZTcHJhZDB6S2VZZDZxZ3JQMXNicFduaFdoWjM1RFRxSjkvV2dXWjU1TVNL?=
 =?utf-8?B?dkp3NjlGZlVSN2lkUEszbGpZQjJHV2t3WEtuRU5pOEU3V3hwN1hPNzcrZWJv?=
 =?utf-8?B?V29mUVd1L285aUduSENKeWx3ZEdxWGJHOEM3T0FRR2NkNmVodHFrdDdLS2lz?=
 =?utf-8?B?TFRwUjVRVCt2azNuMXA4T3R3ZzZzVDlZZURvY0N1bC9QZ0RFd0ttcXA4c3k2?=
 =?utf-8?B?RktudUgwRXNpelU2SFYxWTNrRzBrM1h1YjhDSmtkbFZnWUNnM0xPY2RHSXpt?=
 =?utf-8?B?Z1Zxb21admxlV3RCSkRmWlZqeE9Yb2MwRFRRVnB2Rnc3dnJKMWdlSjZHb0ps?=
 =?utf-8?B?WHYvRTN0SS9EQlZoL2F0ZGU3Z0g0Zlg0Z2xTdlM2TUJoUnh1SEdRV2hqT1Fy?=
 =?utf-8?B?bUx6bkI2QTVJR2wrUEJBd21sWlZkQ0cyVGhUZnQ4YkJaYnNlNjNPMEZJSGFw?=
 =?utf-8?B?MlFTYkl5OStGMnJBN2I4Y2VyYVIzWG9rWC84Y3FhTE5Mc0wrYm1vdlpsYjlo?=
 =?utf-8?B?YXhCV2Rsb3U0c0lCVGtSK2dFeU1xTzRMSjJjQVVkVStDMkt1YlBWY2xqSG14?=
 =?utf-8?B?dUlCK0FkS2NlVU9rWnlKR0o3R21VZ0dFaWhhaHBYYVphQVBKSWVtY3g1akIx?=
 =?utf-8?B?U0ozVjd4U2JzRDJYNnFiRlU5Y3RBbDJEaDlybzd4S3RZVUhzM3pjTEZDY005?=
 =?utf-8?B?NmZqcklMODZKTmUvdG5XNGo2blJ2Q2FaMGIxcjJuY1I2dU1IVk9WODZ4b2Vk?=
 =?utf-8?B?YTB1emxxZWtSRVJUM2R4VEd5R2tCa1VnNVNQbmJXRmFTcGlKRTZicFJpTzFl?=
 =?utf-8?B?ekZ1Q2lzYW53OVJNd2dvdzZIZ0hPNGRtV0ZFRFVlMEhmampJVmRDRjFaWGtv?=
 =?utf-8?B?UHk4NDcrVlpzeGdlVFRja1BmMFN4RlJkSG1kQnR5R05GZzlMaURIMzhKd1ht?=
 =?utf-8?B?ZXFGRGlTVld0Ui85b0xiZElzRFpyOSswTFlwczZJUVMzUW56L1RSY0V1QUJD?=
 =?utf-8?B?a3h1ZzdKdm5yK1VJVFlWZ05sSGhrN2tLUzU3VDdRa0YrWC9EVHBIUGF2MWNF?=
 =?utf-8?B?QUtFREg2WHhicS90OGhoeXFFYlpyMUE4eTIzQ1dOUzFiUDZBcjQwaHplMmZv?=
 =?utf-8?B?cldsZTB0dUJHUENOanB6VERESHhTU3BnRFBZNml4bEZkT1ovMndnUys5aGpU?=
 =?utf-8?B?S2s2OG4vaUNyKzYwN1d4bXEyZE9XRVhwZTd3bDU4WjYzMkhGbS9IeGhHK3BX?=
 =?utf-8?B?Z056Tnk1MytLNThEb3pnVkUxUjNpMnY3VkVlUTFhTUx0dk1lRVoyZHFYMHRF?=
 =?utf-8?B?UmEyTXUzSkpDSDVnbzY5S0MyVUVFUUZMYXdSV0Npa1NQWXNFYUlVRnY5aVpI?=
 =?utf-8?B?bzdmUkNUcDVaYUw1aDRSMzhCQVl0VG9YRHpPclFQWm11TmZvVWRJSUgrMTFQ?=
 =?utf-8?B?RXJxYzRRTS8vWW9mR2V1VkhGV2lrVW0va0tlZzh5b2pWYnFsZjhBN09ZTXY3?=
 =?utf-8?B?V283bjBzUXBwbDBUSHl4ZEZzNmJ0M3JQcU84amVOdEdscEE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <45A5BC4B562B364EA12F102AC074CECF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7848
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	909c3cb3-2a82-4153-52fc-08dd13b2b7ae
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elVibk9Fd3V4TTBNaHNyS2tEbTFrOHU4cFRyY3NMbEV6RGk0aXZvUnpHNlFF?=
 =?utf-8?B?czA5U3pZdS9wVGJQbzB1a0FYa2tya3JZcVlnM1ZsbUM3S00vZlA5ZlE5NC8y?=
 =?utf-8?B?YW14dVJaeElCaURTbWlSemtpak1JV1cxbS9rbWJpZzlUd1Y0YStETktOUU1l?=
 =?utf-8?B?MUdVTHFYd3NHMXJ6QXJOenJmWi80ZzArUDhGVmhpRG5kMjFoV2pZTHdxYktB?=
 =?utf-8?B?WFArMGJUaFB4UFo3UktTMkxwZDhWS1ROM1kxNzdrVWFQaHpsZXQ0eXN4NndM?=
 =?utf-8?B?c3dGSi9GNTV2ZVdkVFpmTXR5am9FQ0pBcWRrVDB5YlNLTUJoNGorSHd1bGhn?=
 =?utf-8?B?a0VqZHJheWpWT0k3M3RhMy84QzhZSk1VUSsxQlY0UXJ1Uyt4aTVXbVFBejlB?=
 =?utf-8?B?ejZEYkp3WG1sQ2F3VEhqYUZ5SlRBeEs0RGI1a2s0M2hHSlV1bXVZNnFZTXFi?=
 =?utf-8?B?aFRwVHVRVGhxZU81NHdjOFlFWENidGY2Tm5uK3k1N0psNVprdXp4em5ybjlI?=
 =?utf-8?B?MnlrdUc4VXc4OE03eGREY1cxZUxlSGVaUFNnZDNQQ1pCMm9hcEVEYWFoOU5j?=
 =?utf-8?B?emZuckswMitJVnk3SU0wTW9zVkdORWpCNHpvT094SkZDY0pGYU4zTEpOL3Az?=
 =?utf-8?B?ekp0TFcvSy9TVU0yaGZOL0ZHYjZsYXlkU29ZQUJvNmk0Rmd2dFcxakFUOWRK?=
 =?utf-8?B?U3FPZ3gxOUw2TjB4VlRram1jL0xWRU00aW9uOStBanJoTHBGRjhIdWkyTzhK?=
 =?utf-8?B?M2RtK1dkNFljd0t3NCtYSDlGUTF4VXZZc0xzd2RUWXZlZHhrdWUxcVpvaWg1?=
 =?utf-8?B?WU0yaVFuQXVlUzl0Wm5xb1RwK2p6ck1xemVuK3lSUzV6dHdNM1VoL2dUZG9M?=
 =?utf-8?B?S29mV3ZCdWh3UEI5TjZJSElramlFZ3RSajV4aWVsR25nSk9PcmJwL3JielI1?=
 =?utf-8?B?anBUMEdkdVF0Wlk2RlNsYyt3UnRjVDRWbG1oLzJZQW14R0tlOTJIR0VJc2ZH?=
 =?utf-8?B?MmoyTHovTVBoWGJoeWgxTjRlYTRJTTJlUnlUMjh1UHp0SnBCdmdwMzdjOU5j?=
 =?utf-8?B?MGFxd0hSWFNFTHFHaEdLVXNuRmkyeHZXL2sxTGRlSTBvKzhmRHozTTB1REhL?=
 =?utf-8?B?Z1hpK0J1OGh1NHZRczA1eXdVbEtHYkVBTUdqZUdyRDVsVmFuOVBkSjlKNnVL?=
 =?utf-8?B?bkFORityRXM1YnRvUXl5K2RGODhoS2NvblZmMHBYMCs4dFhDZDQ2aTdnQi9L?=
 =?utf-8?B?VjluUGJmOUx3c01FczA5ZnA1QVRGMWo1emZ1S25BdlI0UEdpTUI5VEg4Rmpz?=
 =?utf-8?B?RVhEaDRwU3hVdTBZZkUrRGN0Yyt0UUZpRUIyVU44RnBsTE1xaWtWM0Y1TVEz?=
 =?utf-8?B?aXVnZWxCdHFSMzdqVGxnWEJKT2YwdlFBbUQrR1g0bTZMMFc2M2lMRlpIZE1Y?=
 =?utf-8?B?c2hwR0EwcUJsc2Q4RkJWZ2p6RGxobUk5eUNmblFWbWhUQzFGOE1pa3RTVjJE?=
 =?utf-8?B?WFRjNGNhclF1RUF0cHBuVHduYTArUlJ5bm8vdmpQaEgyVXY0TG1Uc2svTzlT?=
 =?utf-8?B?d0Z3dUJFMExSMndkNHN5ZG9DaUlmZ0E4SVlxeWxSS0FSQUNiNld2eG5VaWtJ?=
 =?utf-8?B?VEJ3MnhZTUJIQlJkbEk5aTRTaWZBRjk4MkRHM2t4MnlCOFBxRWVER05Ib29M?=
 =?utf-8?B?M1hEQ0grSXRDNXN2ZVRLbGw4OWljdUV5LzdFRWNYU0VlSkNlLy80d0VuUlNZ?=
 =?utf-8?B?TTdBQjB3MWE4QTFYTFdJMk5lOWZjbTdaQnRENGFjcDVOWW16R255TU8xNjY4?=
 =?utf-8?B?YkZrRkhJUDUzYlBZWklyMTVKaDgxNUhwb3REdWU4TXJ2eFNFWVVTNm94d2N3?=
 =?utf-8?B?Q0YySjNYdDU2M0F3YVdiL2ZNR0ZZd25tY0VzKy9yQ1RkNzZmSFZwZVRwNzU5?=
 =?utf-8?Q?CpwDrivwlOmO3U+Y6dEiCJVskJSMofQd?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 15:54:20.4283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98007401-c0c8-46b8-8d63-08dd13b2c029
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8652

SGkgQXlhbiwNCg0Kc29ycnkgZm9yIHRoZSBzZXBhcmF0ZSBtZXNzYWdlLCBJJ3ZlIHNwb3R0ZWQg
YW5vdGhlciB0aGluZyB3aGVyZSBJ4oCZbSBpbiBkb3VidA0KDQo+IE9uIDI3IE5vdiAyMDI0LCBh
dCAxODozOSwgQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+IHdy
b3RlOg0KPiANCj4gQ09ORklHX0VBUkxZX1VBUlRfU0laRSBpcyBpbnRyb2R1Y2VkIHRvIGxldCB1
c2VyIHByb3ZpZGUgcGh5c2ljYWwgc2l6ZSBvZg0KPiBlYXJseSBVQVJULiBVbmxpa2UgTU1VIHdo
ZXJlIHdlIG1hcCBhIHBhZ2UgaW4gdGhlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSwNCj4gaGVyZSB3
ZSBuZWVkIHRvIGtub3cgdGhlIGV4YWN0IHBoeXNpY2FsIHNpemUgdG8gYmUgbWFwcGVkLg0KPiBB
cyBWQSA9PSBQQSBpbiBjYXNlIG9mIE1QVSwgdGhlIG1lbW9yeSBsYXlvdXQgZm9sbG93cyBleGFj
dGx5IHRoZSBoYXJkd2FyZQ0KPiBjb25maWd1cmF0aW9uLiBBcyBhIGNvbnNlcXVlbmNlLCB3ZSBz
ZXQgIEVBUkxZX1VBUlRfVklSVFVBTF9BRERSRVNTIGFzIHBoeXNpY2FsDQo+IGFkZHJlc3MuDQo+
IA0KPiBFQVJMWV9VQVJUX0JBU0VfQUREUkVTUyBhbmQgRUFSTFlfVUFSVF9TSVpFIHNob3VsZCBi
ZSBhbGlnbmVkIHRvIHRoZSBtaW5pbXVtDQo+IHNpemUgb2YgTVBVIHJlZ2lvbiAoaWUgNjQgYml0
cykgYXMgcGVyIHRoZSBoYXJkd2FyZSByZXN0cmljdGlvbnMuIFJlZmVyIEFSTQ0KPiBEREkgMDYw
MEEuZCBJRDEyMDgyMSBBMS4zICJBIG1pbmltdW0gcHJvdGVjdGlvbiByZWdpb24gc2l6ZSBvZiA2
NCBieXRlcy4iLg0KPiANCj4gVUFSVCBpcyBtYXBwZWQgYXMgbkduUkUgcmVnaW9uIChhcyBzcGVj
aWZpZWQgYnkgQVRUUj0xMDAgLCByZWZlciBHMS4zLjEzLA0KPiBNQUlSX0VMMiwgIi0tLTAxMDAg
RGV2aWNlIG1lbW9yeSBuR25SRSIpIGFuZCBEb2MgSUQgLSAxMDI2NzBfMDEwMV8wMl9lbg0KPiBU
YWJsZSA0LTMsIEFybXY4IGFyY2hpdGVjdHVyZSBtZW1vcnkgdHlwZXMgKG5HblJFIC0gQ29ycmVz
cG9uZHMgdG8gRGV2aWNlIGluDQo+IEFybXY3IGFyY2hpdGVjdHVyZSkuIEFsc28sIGl0IGlzIG1h
cHBlZCBhcyBvdXRlciBzaGFyZWFibGUsIFJXIGF0IEVMMiBvbmx5DQo+IGFuZCBleGVjdXRpb24g
b2YgaW5zdHJ1Y3Rpb25zIGZyb20gdGhlIHJlZ2lvbiBpcyBub3QgcGVybWl0dGVkLg0KPiANCg0K
Wy4uLl0NCg0KDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvbXB1L2hlYWQuUyBi
L3hlbi9hcmNoL2FybS9hcm02NC9tcHUvaGVhZC5TDQo+IGluZGV4IGY2OTJmYzc0NDMuLjg2ZTQw
MTlhMGMgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9tcHUvaGVhZC5TDQo+ICsr
KyBiL3hlbi9hcmNoL2FybS9hcm02NC9tcHUvaGVhZC5TDQo+IEBAIC0xMSw4ICsxMSwxMCBAQA0K
PiAjZGVmaW5lIFJFR0lPTl9URVhUX1BSQkFSICAgICAgIDB4MzggICAgLyogU0g9MTEgQVA9MTAg
WE49MDAgKi8NCj4gI2RlZmluZSBSRUdJT05fUk9fUFJCQVIgICAgICAgICAweDNBICAgIC8qIFNI
PTExIEFQPTEwIFhOPTEwICovDQo+ICNkZWZpbmUgUkVHSU9OX0RBVEFfUFJCQVIgICAgICAgMHgz
MiAgICAvKiBTSD0xMSBBUD0wMCBYTj0xMCAqLw0KPiArI2RlZmluZSBSRUdJT05fREVWSUNFX1BS
QkFSICAgICAweDIyICAgIC8qIFNIPTEwIEFQPTAwIFhOPTEwICovDQo+IA0KPiAjZGVmaW5lIFJF
R0lPTl9OT1JNQUxfUFJMQVIgICAgIDB4MGYgICAgLyogTlM9MCBBVFRSPTExMSBFTj0xICovDQo+
ICsjZGVmaW5lIFJFR0lPTl9ERVZJQ0VfUFJMQVIgICAgIDB4MDkgICAgLyogTlM9MCBBVFRSPTEw
MCBFTj0xICovDQoNClNob3VsZCB0aGlzIHBvaW50IHRvIEFUVFI9MCBpbnN0ZWFkPyBGcm9tIHdo
YXQgSSBzZWUgb24gWmVwaHlyLCB0aGUgcGwwMTEgaXMNCm1hcHBlZCB3aXRoIG5HblJuRSwgb24g
UjgyIHRoaXMgd29ya3MgZmluZSBiZWNhdXNlIGl0IHdpbGwgdHJlYXQgYWxsIGRldmljZSBtZW1v
cnkgYXMNCm5HblJuRSwgYnV0IEnigJltIG5vdCBzdXJlIHRoYXQgdGhpcyB3aWxsIHdvcmsgd2Vs
bCBvbiBvdGhlciBBcm12OC1SIGFhcmNoNjQgcGxhdGZvcm1zLg0KDQpJIHdhcyB0cnlpbmcgdG8g
Y2hlY2sgaG93IExpbnV4IG1hcHMgcGwwMTEgYnV0IEnigJltIGtpbmQgb2YgbG9zdCwgc28gbWF5
YmUgaWYgYW55b25lIGhhcw0KbW9yZSBleHBlcmllbmNlIGlzIG1vcmUgdGhhbiB3ZWxjb21lIHRv
IGNvbnRyaWJ1dGUgdG8gdGhlIGRpc2N1c3Npb24uDQoNCkNoZWVycywNCkx1Y2ENCg0K

