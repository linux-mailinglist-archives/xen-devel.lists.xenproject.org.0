Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39295A2AC74
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 16:30:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882990.1293081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3p3-00020X-43; Thu, 06 Feb 2025 15:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882990.1293081; Thu, 06 Feb 2025 15:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3p3-0001yk-0i; Thu, 06 Feb 2025 15:29:45 +0000
Received: by outflank-mailman (input) for mailman id 882990;
 Thu, 06 Feb 2025 15:29:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUPl=U5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tg3p1-0001ye-EW
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 15:29:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f403:2614::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e1b2b6b-e49f-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 16:29:40 +0100 (CET)
Received: from PA7P264CA0496.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3da::10)
 by PR3PR08MB5802.eurprd08.prod.outlook.com (2603:10a6:102:8a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 15:29:34 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:102:3da:cafe::f1) by PA7P264CA0496.outlook.office365.com
 (2603:10a6:102:3da::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Thu,
 6 Feb 2025 15:29:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Thu, 6 Feb 2025 15:29:33 +0000
Received: ("Tessian outbound e4b26383420a:v567");
 Thu, 06 Feb 2025 15:29:33 +0000
Received: from Lf19a897d9fdf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 987BDE13-F630-4C50-8119-29F48A392ED8.1; 
 Thu, 06 Feb 2025 15:29:26 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf19a897d9fdf.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 06 Feb 2025 15:29:26 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AM8PR08MB6482.eurprd08.prod.outlook.com (2603:10a6:20b:367::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Thu, 6 Feb
 2025 15:29:24 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 15:29:24 +0000
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
X-Inumbo-ID: 2e1b2b6b-e49f-11ef-b3ef-695165c68f79
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Yuh8pDyZzLI1kTdI1OZa20bymCe3WgQD8P1YAswpI0biTe4MVbcWm6MY00t4L0LJwQ1QG0t/pS9OxB7ZYv1Fzr3EAx7VJg6SX6vQBc+f4+ZA2vifpL0UFCMWbO5bo1khEWTwVltO5nkn1QgIok+Ca+4zFEd5QQ/7SYW5pPFqPpS/oDOwElzSqdoV4sw9ctG6eCCR75YpoTlDzxbMCVMozfI5sGvNQd4XxIgYAasCjBr7gy4FgvWm2CgjlX4NdOfqioUUEUtemrNrmtR9aa5Gi96F3YSwyWDAfDxA/yt2TVQahoFzBey+14CoBECDVNjpzsWXz43nL0vV0yj1kzSc6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huj16y1bu6hqHcyAWGUZc22s2RUyRzBgHKeFkjnyqzw=;
 b=ZRevKG0+nTE+qQroDyuIDbyazYgUXRY/3Jp+01Xvodxh0rQDP3qsbpeUzw5VeDGOphBpD8Eyu5ectrssEu9dJSc+OnPVKwf4EqGgyDLYECEN5V/btDFXmTofwIQUyJqfEJ9ci4V+2APXFtp75MLYJ6gr1+3vm0Qr27pRt0cYiXkV2iUdzQ5rtCHhfBg28JXLp5xHcU957Veh8/OKXOq0qiYGTgQu0Rk0BogB08MXHQlyQXfuDo0Jgm8LMdoEybdOxuZ4QFeIXVnf3T6ELdf9N0Y/bg9ho9eaKdJkIo0w2j9U6FFFLgZNS8CriNKU5PC19eWu+e6H5+fBKWNjbs9BnQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huj16y1bu6hqHcyAWGUZc22s2RUyRzBgHKeFkjnyqzw=;
 b=ruQGNsyo6MlH3Oo1lzAUZotHXJ7jue6yes24d+H3v1UfsksZWOTHzG5GQraAvPjjZx11NW2Qv8AxuM69XxSr96ZV0zvmhe14YAUAnagb1gZhyAgtteM4Vm25cqsS1fhn/8XMnX9yAsYQRJn/6FBphnw0sKt9KpdFw2Gv9zm25hk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 330e11e8b2ceaa99
X-TessianGatewayMetadata: Up7wV5OcSWPJ/weJGgirWFPWDvxUmuhVhulHd7STtEG2KfGnhSxl7PVBQDSfgTXRM/Uq78+6xgfm4yD1xb008HrRcprVf1t6i0YWRQd04Z7cksRkC88DolbrE8ZHwtcCW+RfZI5AkhmUETA0fAST4Nmrlam4LWJ9RGhklsDqhOU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2tkdnXVhyNeAhjxRuLdp9msu56dK4k1gQYr9tzFIIkSIzUv+aRu9T4Z1JqnvJWZd9UVx7Z5NAb+yVZY1Riyn6cUtr/5NK1QqHrM60Smth+E4Cqzgw/O886X4WHx8S8ZylGuLGDEV2uj69Gcju015Z3VNVpdj2hGlCacNSFCfYBngaqlAUwO2nzCWans1cCgxHFIxiKmh5Qc8XwPluP5LAPZ3Oa0WQg0qcgUDwNxFuN41ELKYRIimBgK8nK8kJshJ9CHRB3hfc0Ffz/wRTBm/gpq5VmTWoGoPBZoyw1TH/k96vhbj2kGwrcbtCHN+6VUdoh4RfrvgFPfc+Rq13VsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huj16y1bu6hqHcyAWGUZc22s2RUyRzBgHKeFkjnyqzw=;
 b=JlI7V2AXIpVaxH1Ks6NYW2O81cpnLVjtlFgz73kqzZGenE17P2B4pvjwpqueBHiOhmb+WD5SITj6X88GKgC4WRIW3kKahIUT32p2ae+M/s1Vw+cXHmNwSs4J1lY0vkrbhT93m2Mdxs013jLfuNHPjvMOZmVLNzZDkxB71ZaJISbYP+MaJvBtSJ0jd8taliM3e0o5yYg7/KFRFX/F5HjmNL5WUXyQ8LCaV99fiptxm+ITsXMo4gGAJGt6+or6LwyI5o1e2R63QkjkyPgokR0Pwr0cWZbsq8/HaZMBDLgtxIFbEYrpBs5/1yXc7T8QA63qSXFvR8zWHZT0l1pDu4XB+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huj16y1bu6hqHcyAWGUZc22s2RUyRzBgHKeFkjnyqzw=;
 b=ruQGNsyo6MlH3Oo1lzAUZotHXJ7jue6yes24d+H3v1UfsksZWOTHzG5GQraAvPjjZx11NW2Qv8AxuM69XxSr96ZV0zvmhe14YAUAnagb1gZhyAgtteM4Vm25cqsS1fhn/8XMnX9yAsYQRJn/6FBphnw0sKt9KpdFw2Gv9zm25hk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/5] xen/arm: mpu: Create boot-time MPU protection regions
 (arm32)
Thread-Topic: [PATCH 4/5] xen/arm: mpu: Create boot-time MPU protection
 regions (arm32)
Thread-Index: AQHbdzpwCM+ehcObakK8dTLv1bfPm7M6aTOA
Date: Thu, 6 Feb 2025 15:29:23 +0000
Message-ID: <1A45084E-DCB3-4014-A95D-0C82286ED025@arm.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
 <20250204192357.1862264-5-ayan.kumar.halder@amd.com>
In-Reply-To: <20250204192357.1862264-5-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AM8PR08MB6482:EE_|AMS1EPF00000045:EE_|PR3PR08MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c502e5a-2397-4b8b-ee35-08dd46c30ed4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?THBCS2ZBZ0xzQ1FIQk11Tk0xQzZZUUtlRjZ2MWZZcDl3NmlMa2ZPdHJUK1lB?=
 =?utf-8?B?Ylk3TE9zSC9OV2NzQzlBbjAyeFYwKzBZN05KWnlKaTVlK3BKcHBPZGdhMTd3?=
 =?utf-8?B?dVpXSWpreVFObzd5WktMVnEycXBoV2VQUDhXcXo1QkV2djM2YnlMK3JkOXEr?=
 =?utf-8?B?VU5OOC9UakpqSnRXL28yd0c5WlhWZnhTb0RvYVdNOGZ4OVExQ2hwRzNYMkU5?=
 =?utf-8?B?VG5qZUJTLzJJZHhhQjF4b3pPS1ZsSmJpTk54RHI0ajN2ZldZU1NRRUg4WmtP?=
 =?utf-8?B?K2hlTnh0OHJnWWNKRU9hUUFWdmRtNXBkeFhjVE02RFE3cU00T010eXdscDBw?=
 =?utf-8?B?T3NlLzFNZ254UGtGOStlU3AzWDk3RE9PQTMrVGdaTTNKbzM0ZEFvVjZSUzJD?=
 =?utf-8?B?YVM1TVJveEhJUUNvMTJhQlpuNHZSUlBQUnN6N0dUZ0xaTGZ2T1Z6cGlMQ1VY?=
 =?utf-8?B?L3dXR1dWZSt5alQ3SjVsa29ZUlBBeloxTk5Xa2xFeXQ0SlRDNnYwUDQ3TlhM?=
 =?utf-8?B?M3pPc2pmMmNyV1ppQUVKRnR2WHRjSWRxV2Y5WlhCekVmN1pTNjZ2SjhnM3k1?=
 =?utf-8?B?TnhYTE1lN3Z5R0phcGF5WlRERGl5QWV2VFpxbitGYnplWCtpSEtCci9xU2Jw?=
 =?utf-8?B?ckcrOGhvRFM5Z1B2enUrd2hlV3ErYXpvTFVUTHpDbUowM3hjSm4xNFcycjNL?=
 =?utf-8?B?SzhBS1V3akNFQzR5Y01IcFFoYTM3YVA1YU1LQUtHaitpTGFXRWtid0QxdFAz?=
 =?utf-8?B?V0VBREdwWXdXUWtQM29BM0k5cHRkNlY3eGRwQ3NscU9NUXFkYzhmNmtRaTIr?=
 =?utf-8?B?dFNxOHJUQm4raXJIc3BFMlhqRXBXc3VmNXJZQldKbFVicDdYWWtTdW1zdlZF?=
 =?utf-8?B?dmJTRE41d21PdCtwN1R1aW5ZVzFtRWZNQXJ6SDNlK3BYWGxYVFRFRnh6NmlM?=
 =?utf-8?B?NXYvUjRwdWs2MUlBK2RUc2UwN2pxbDZDc0hmV1Q3dGxhSjdFTmVZb3ZTemov?=
 =?utf-8?B?R3RnQ1ZJeUg2SUpuclpaaDVJU3hpRWNSb0EvZDZMSXFuUTEzdmRzTnowSXA3?=
 =?utf-8?B?cUp6Tzl3N2JpY3JyUmRSaEtKcVBvZUpGWGF4UXBXVHRwMnZ2S3ZUNTVZNHY5?=
 =?utf-8?B?VENwUlRVYXY3WmE3VDAyR1RRNUdVcGJONEJaaHlybmFMYUZRV25hSE5LTTJW?=
 =?utf-8?B?UDRRM0dpMUxZWWVWRVAvR1ZjVEhWRjI3NFkwNTlUelltcS9pZWo0ZUdFNlZN?=
 =?utf-8?B?YWtKSGJiNjgwbGFvSVpncnRPa2JndkdxY0pKUGlCams5NXdvV1d4UnVPOFBk?=
 =?utf-8?B?RFovMmdRaEV5ME9wcWxVSm1lbk5mUTdzMzZpUnQxTU1uSFpjVE1XUUlkajNU?=
 =?utf-8?B?cjNISXRMU2dDSEVBcXZEeVZxZTVOc21ZaWdpLzIzOGg4Qit1b0w1TWF2bytV?=
 =?utf-8?B?WU14RUhTMGpaNEJKendLcU05dktsdmJacjRxSW5JdW0xeGY0VnRLcHZFbHli?=
 =?utf-8?B?UWNlODFnQTNKUmxER1YreUdKS1pXK3RZVnIwYkoya0EwUjhBSnNNajJpSVM4?=
 =?utf-8?B?T3owd1JVMCtkMXR4WUJtaVFnaU5tdnFxWGxiRmNxRC9UeFYwT0J1NmMvb3Qr?=
 =?utf-8?B?VytoQmwwcU9ITTlKVGxIQWdoMEVxZFNmNTFaSDFOY2ZxdityNUo4WGZKVUJL?=
 =?utf-8?B?ZWFyUHVReGtVY0xabSsrV1dtdkFDdkd2aTUxdkVuRWoyS0pDSTJiTENWbEMx?=
 =?utf-8?B?eW52Zjd4Y1hsdzlFSFY3MU0zRWY4NU1LYUxXb1BicjAyWVRLczBlcytsb1lJ?=
 =?utf-8?B?dTFtSTVwN09aSHMrWXBWL1I5L24rMW5YOU5KZU1PM3FrUkErUXVHazkxbUxa?=
 =?utf-8?B?SjVqWDgzM1lRbm1iSUhNVG9LTVlkdEwvZ1dKeUhDZWdSZ2kxOE1ROXcvckdW?=
 =?utf-8?Q?XdYIg+zKiYqVTwL9fPoVO8Jw+hkv0IWK?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <37F797B18B5E6242B48957B4F4B88368@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6482
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a574014-ac14-4a95-b955-08dd46c308fa
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|82310400026|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ak9JZnpqcHl3QVQxSnJmcmtKNGtnTzNURkdISlRjS2ZEeUpwK05VajJuN3dW?=
 =?utf-8?B?ZytUTGxqTS9TbmpXSHVic2orUlFYTWhiNmF5NGx0WVZKU1RvRXYzenhuMWhE?=
 =?utf-8?B?MGdZUVBUVThZeS9oRkxUbmgzcFB0VnhpWG1tMVhyWVFRV1BvZ25WQk1zYlhE?=
 =?utf-8?B?YldYbG1jaU9YTEd0YzRTUW92VFo4K1VDeUhMV25meFZ4MmJKL2hRUGp1WTJC?=
 =?utf-8?B?b2c5R0tianpHTTJjNFhmZEJoajBHUzNoY0dCUC8yNTZjc3ZlMmlxQ1p2RmhH?=
 =?utf-8?B?aSszVGxSWkY0Q216TldKcEhubG5Udm1XOVBvYmN2VWVEYW9mbFhYVGhmUUYy?=
 =?utf-8?B?UkFKUlZGcUdKRUwzMjNrRWhSTTdOSTRmc3dqZEJrZzBReUNUYVdSSCt2MmY1?=
 =?utf-8?B?WHFrdEdPUlREUU0wdjcrckJXc0dlS0U2VkFET2x0ZVluNHNyVVhwS3J1QWRo?=
 =?utf-8?B?SWdaS0N2aFBiSkJuNWdXOUYyOXpmOVdDV2Z3NVZDcmcyZmpoSEE4TnlOQ2Rv?=
 =?utf-8?B?MFYydGxGVWRicEl5SDRzeHo2ZDZXbGRNU1cxZzF5TjRDQVZVWnIvRlB5dkNP?=
 =?utf-8?B?cmV2RXNRMzIwYk82ZGtZN0hxdURmeWRmVW1Cbi9qZ2lrUmNrTjQwSWRKTzZ2?=
 =?utf-8?B?MERtVEJocU9ocFJQVXdsbjE2c0M3eUdLVHdobmltSGw5K3B1c1gwcjlZUHpt?=
 =?utf-8?B?aDhDT1VBQVQzRlM2QVQwQzNvTXhQREovRVk2bmxvSTVEN2dteHlmelVLVjFL?=
 =?utf-8?B?ckptRDZwc1psY1cyRFBISzk4SXlsMEpBSFFIYjBJcmRNZTR2aWlwUkNzS25L?=
 =?utf-8?B?Z1o0YzBmckl1cmRINUl4RnZkcGE0MzVPdkhBckNrT24zUzJQR0xpZXZFa05K?=
 =?utf-8?B?TGJjOThyaXZlV1V5ZFYvVXhiMHFlVHZyYlJMQXlqcVdLWE9xVHNQS0dhdlBB?=
 =?utf-8?B?SyticGRBd2FRaEg1MzhPdStmRWxjUDBHNTcyT3c3Qitvbmg1OUkrNWhqRXA4?=
 =?utf-8?B?ZFl1R0NHb1pTYVVieG5CM2dDQ2ozbVJOZVJLMGFsanM0YUVicXlSR1czT1lL?=
 =?utf-8?B?eTNGL3JwSm1pZlBqU2xSeTdvVS9MTkcrdmpQZWo5dG42TkxWN0RDazhqbll1?=
 =?utf-8?B?TUZQOUMzMDBlQjRMbjNRRGpGT3VUa282NW8rZjIrV1MweUlBUFhxSE9vU0hl?=
 =?utf-8?B?VEVzaVJqTmRXMXZBMVBoWmJkcEpCdllXQTVzdXN2NlE5bGVhdVZkMFU0azlu?=
 =?utf-8?B?c2NoMlVwL3ZJWXk0a1lnamw1UFpmY2QvZVFoSW5GdnY0d0UyMm9mcGsrMEJ1?=
 =?utf-8?B?ME0vdi9nWWh2a2VxcUNPVzBhbEplRzYzOXZxTytDQ2FGNUNBSVAxUUthUU1V?=
 =?utf-8?B?NktjOWY5aHFrZjJuS1R1cGRodmRlbHI4Nmgyem05Z251TXFma0trVFlBd1BB?=
 =?utf-8?B?WC9KdWVBbWF0Z3NneUlsSlEyc0NMY2hmWlZBdkVyN0pxaW9FVGdRSjNQQm9o?=
 =?utf-8?B?QzRrdmdqVGEyMklwMTRrbWhYcTlXNkdtOUJnNVV4RXpqOWM1dlM1bS81U1c2?=
 =?utf-8?B?bTlqYktWTDZuTWRZbHBnN0F4L1ZjVC8wZ0pNN3p5dWVWTmV3alZtd0s4OWN1?=
 =?utf-8?B?OHE1bVh5cHl6ZHYzOTN3MGswQUNiL05DQ1hONTZXd1dzTVJJcUx2KzVaWWdJ?=
 =?utf-8?B?WGI4MURhMVVWYm1hb1FXNWdpZno3dWMxcmJSZDFtcWljR2VqVFBHZllrbFZS?=
 =?utf-8?B?QmJldlh4dytQenhtTnJWWFRtcXlBMHRBekVOKzRGT1lDN1Y2NU8wRGUxTC82?=
 =?utf-8?B?SStGczJESnZzV05razRETCtJaXhwYmI2dS9XdndWbWdmVmJOQzJueVh1VitB?=
 =?utf-8?B?ZThESjNjbGdUYkhseU50dDBZTGIwdkNmVmxsMFBQL2JRb2lmSXhhZGVMTkhO?=
 =?utf-8?B?L3FHWm9EQ3NuQlVRbHRzdW96R0U1bjhEQ0tmQVNrLzMxVGtwcGdYQTRhNkZN?=
 =?utf-8?Q?Xu0J4OZ4HXKCyp+8HhrBnhCWvgOG88=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(82310400026)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:29:33.7256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c502e5a-2397-4b8b-ee35-08dd46c30ed4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5802

SGkgQXlhbiwNCg0KPiBPbiA0IEZlYiAyMDI1LCBhdCAxOToyMywgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gRGVmaW5lIGVuYWJsZV9i
b290X2NwdV9tbSgpIGZvciB0aGUgQXJtdjgtUiBBQXJjaDY0Lg0KPiANCj4gTGlrZSBib290LXRp
bWUgcGFnZSB0YWJsZSBpbiBNTVUgc3lzdGVtLCB3ZSBuZWVkIGEgYm9vdC10aW1lIE1QVSBwcm90
ZWN0aW9uDQo+IHJlZ2lvbiBjb25maWd1cmF0aW9uIGluIE1QVSBzeXN0ZW0gc28gWGVuIGNhbiBm
ZXRjaCBjb2RlIGFuZCBkYXRhIGZyb20gbm9ybWFsDQo+IG1lbW9yeS4NCj4gDQo+IFRvIGRvIHRo
aXMsIFhlbiBtYXBzIHRoZSBmb2xsb3dpbmcgc2VjdGlvbnMgb2YgdGhlIGJpbmFyeSBhcyBzZXBh
cmF0ZSByZWdpb25zDQo+ICh3aXRoIHBlcm1pc3Npb25zKSA6LQ0KPiAxLiBUZXh0IChSZWFkIG9u
bHkgYXQgRUwyLCBleGVjdXRpb24gaXMgcGVybWl0dGVkKQ0KPiAyLiBSTyBkYXRhIChSZWFkIG9u
bHkgYXQgRUwyKQ0KPiAzLiBSTyBhZnRlciBpbml0IGRhdGEgYW5kIFJXIGRhdGEgKFJlYWQvV3Jp
dGUgYXQgRUwyKQ0KPiA0LiBJbml0IFRleHQgKFJlYWQgb25seSBhdCBFTDIsIGV4ZWN1dGlvbiBp
cyBwZXJtaXR0ZWQpDQo+IDUuIEluaXQgZGF0YSBhbmQgQlNTIChSZWFkL1dyaXRlIGF0IEVMMikN
Cj4gDQo+IEJlZm9yZSBjcmVhdGluZyBhIHJlZ2lvbiwgd2UgY2hlY2sgaWYgdGhlIGNvdW50IGV4
Y2VlZHMgdGhlIG51bWJlciBkZWZpbmVkIGluDQo+IE1QVUlSX0VMMi4gSWYgc28sIHRoZW4gdGhl
IGJvb3QgZmFpbHMuDQo+IA0KPiBBbHNvIHdlIGNoZWNrIGlmIHRoZSByZWdpb24gaXMgZW1wdHkg
b3Igbm90LiBJT1csIGlmIHRoZSBzdGFydCBhbmQgZW5kIGFkZHJlc3MNCj4gYXJlIHNhbWUsIHdl
IHNraXAgbWFwcGluZyB0aGUgcmVnaW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXlhbiBLdW1h
ciBIYWxkZXIgPGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+DQo+IC0tLQ0KDQpXaXRoIHRoaXMg
b25lIHRoZXJlIGlzIHF1aXRlIHNvbWUgZHVwbGljYXRpb24gbm93IGJldHdlZW4gYXJtNjQvbXB1
L2hlYWQuUw0KYW5kIGFybTMyL21wdS9oZWFkLlMsIGRvIHlvdSB0aGluayBpdCBpcyBuZWNlc3Nh
cnk/DQoNCj4geGVuL2FyY2gvYXJtL2FybTMyL21wdS9oZWFkLlMgICAgICAgICB8IDE2NCArKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY3ByZWdz
LmggICAgIHwgICA0ICsNCj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9jcHJlZ3MuaCB8
ICAyMSArKysrDQo+IDMgZmlsZXMgY2hhbmdlZCwgMTg5IGluc2VydGlvbnMoKykNCj4gY3JlYXRl
IG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9hcm0zMi9tcHUvaGVhZC5TDQo+IGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1L2NwcmVncy5oDQo+IA0KPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL21wdS9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJt
MzIvbXB1L2hlYWQuUw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAw
Li40YWFkM2M2YjVkDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTMy
L21wdS9oZWFkLlMNCj4gQEAgLTAsMCArMSwxNjQgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCj4gKy8qDQo+ICsgKiBTdGFydC1vZi1kYXkgY29kZSBm
b3IgYW4gQXJtdjgtUiBNUFUgc3lzdGVtLg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlIDxhc20v
ZWFybHlfcHJpbnRrLmg+DQo+ICsjaW5jbHVkZSA8YXNtL2FybTMyL3N5c3JlZ3MuaD4NCj4gKw0K
PiArLyogQmFja2dyb3VkIHJlZ2lvbiBlbmFibGUvZGlzYWJsZSAqLw0KPiArI2RlZmluZSBTQ1RM
Ul9FTHhfQlIgICAgQklUKDE3LCBVTCkNCg0KVGhpcyBpcyB0aGUgc2FtZSBhcyBhcm02NA0KDQo+
ICsNCj4gKyNkZWZpbmUgUkVHSU9OX1RFWFRfUFJCQVIgICAgICAgMHgxOCAgICAvKiBTSD0xMSBB
UD0xMCBYTj0wICovDQo+ICsjZGVmaW5lIFJFR0lPTl9ST19QUkJBUiAgICAgICAgIDB4MUQgICAg
LyogU0g9MTEgQVA9MTAgWE49MSAqLw0KPiArI2RlZmluZSBSRUdJT05fREFUQV9QUkJBUiAgICAg
ICAweDE5ICAgIC8qIFNIPTExIEFQPTAwIFhOPTEgKi8NCj4gKyNkZWZpbmUgUkVHSU9OX0RFVklD
RV9QUkJBUiAgICAgMHgxMSAgICAvKiBTSD0xMCBBUD0wMCBYTj0xICovDQoNCnRoZXNlIGFyZSB0
aGUgc2FtZSBhcyBhcm02NCBidXQgc2hpZnRlZCByaWdodCBieSAxLCB3ZSBtaWdodCB3YW50IHRv
IGFzayB0aGUgbWFpbnRhaW5lcnMNCmFib3V0IHdoYXQgaXMgYmV0dGVyIGhlcmUNCg0KDQo+ICsN
Cj4gKyNkZWZpbmUgUkVHSU9OX05PUk1BTF9QUkxBUiAgICAgMHgwZiAgICAvKiBOUz0wIEFUVFI9
MTExIEVOPTEgKi8NCj4gKyNkZWZpbmUgUkVHSU9OX0RFVklDRV9QUkxBUiAgICAgMHgwOSAgICAv
KiBOUz0wIEFUVFI9MTAwIEVOPTEgKi8NCg0Kc2FtZSBhcyBhcm02NA0KDQo+ICsNCj4gKy8qDQo+
ICsgKiBNYWNybyB0byBwcmVwYXJlIGFuZCBzZXQgYSBFTDIgTVBVIG1lbW9yeSByZWdpb24uDQo+
ICsgKiBXZSB3aWxsIGFsc28gY3JlYXRlIGFuIGFjY29yZGluZyBNUFUgbWVtb3J5IHJlZ2lvbiBl
bnRyeSwgd2hpY2gNCj4gKyAqIGlzIGEgc3RydWN0dXJlIG9mIHByX3QsICBpbiB0YWJsZSBccHJt
YXAuDQo+ICsgKg0KPiArICogc2VsOiAgICAgICAgIHJlZ2lvbiBzZWxlY3Rvcg0KPiArICogYmFz
ZTogICAgICAgIHJlZyBzdG9yaW5nIGJhc2UgYWRkcmVzcw0KPiArICogbGltaXQ6ICAgICAgIHJl
ZyBzdG9yaW5nIGxpbWl0IGFkZHJlc3MNCj4gKyAqIHByYmFyOiAgICAgICBzdG9yZSBjb21wdXRl
ZCBQUkJBUl9FTDIgdmFsdWUNCj4gKyAqIHBybGFyOiAgICAgICBzdG9yZSBjb21wdXRlZCBQUkxB
Ul9FTDIgdmFsdWUNCj4gKyAqIG1heGNvdW50OiAgICBtYXhpbXVtIG51bWJlciBvZiBFTDIgcmVn
aW9ucyBzdXBwb3J0ZWQNCj4gKyAqIGF0dHJfcHJiYXI6ICBQUkJBUl9FTDItcmVsYXRlZCBtZW1v
cnkgYXR0cmlidXRlcy4gSWYgbm90IHNwZWNpZmllZCBpdCB3aWxsIGJlDQo+ICsgKiAgICAgICAg
ICAgICAgUkVHSU9OX0RBVEFfUFJCQVINCj4gKyAqIGF0dHJfcHJsYXI6ICBQUkxBUl9FTDItcmVs
YXRlZCBtZW1vcnkgYXR0cmlidXRlcy4gSWYgbm90IHNwZWNpZmllZCBpdCB3aWxsIGJlDQo+ICsg
KiAgICAgICAgICAgICAgUkVHSU9OX05PUk1BTF9QUkxBUg0KPiArICoNCj4gKyAqIFByZXNlcnZl
cyBcbWF4Y291bnQNCj4gKyAqIE91dHB1dDoNCj4gKyAqICBcc2VsOiBOZXh0IGF2YWlsYWJsZSBy
ZWdpb24gc2VsZWN0b3IgaW5kZXguDQo+ICsgKiBDbG9iYmVycyBcYmFzZSwgXGxpbWl0LCBccHJi
YXIsIFxwcmxhcg0KPiArICoNCj4gKyAqIE5vdGUgdGhhdCBhbGwgcGFyYW1ldGVycyB1c2luZyBy
ZWdpc3RlcnMgc2hvdWxkIGJlIGRpc3RpbmN0Lg0KPiArICovDQo+ICsubWFjcm8gcHJlcGFyZV94
ZW5fcmVnaW9uLCBzZWwsIGJhc2UsIGxpbWl0LCBwcmJhciwgcHJsYXIsIG1heGNvdW50LCBhdHRy
X3ByYmFyPVJFR0lPTl9EQVRBX1BSQkFSLCBhdHRyX3BybGFyPVJFR0lPTl9OT1JNQUxfUFJMQVIN
Cj4gKyAgICAvKiBDaGVjayBpZiB0aGUgcmVnaW9uIGlzIGVtcHR5ICovDQo+ICsgICAgY21wICAg
XGJhc2UsIFxsaW1pdA0KPiArICAgIGJlcSAgIDFmDQo+ICsNCj4gKyAgICAvKiBDaGVjayBpZiB0
aGUgbnVtYmVyIG9mIHJlZ2lvbnMgZXhjZWVkZWQgdGhlIGNvdW50IHNwZWNpZmllZCBpbiBNUFVJ
Ul9FTDIgKi8NCj4gKyAgICBjbXAgICBcc2VsLCBcbWF4Y291bnQNCj4gKyAgICBiZ2UgICBmYWls
X2luc3VmZmljaWVudF9yZWdpb25zDQo+ICsNCj4gKyAgICAvKiBQcmVwYXJlIHZhbHVlIGZvciBQ
UkJBUl9FTDIgcmVnIGFuZCBwcmVzZXJ2ZSBpdCBpbiBccHJiYXIuKi8NCj4gKyAgICBhbmQgICBc
YmFzZSwgXGJhc2UsICNNUFVfUkVHSU9OX01BU0sNCj4gKyAgICBtb3YgICBccHJiYXIsICNcYXR0
cl9wcmJhcg0KPiArICAgIG9yciAgIFxwcmJhciwgXHByYmFyLCBcYmFzZQ0KPiArDQo+ICsgICAg
LyogTGltaXQgYWRkcmVzcyBzaG91bGQgYmUgaW5jbHVzaXZlICovDQo+ICsgICAgc3ViICAgXGxp
bWl0LCBcbGltaXQsICMxDQo+ICsgICAgYW5kICAgXGxpbWl0LCBcbGltaXQsICNNUFVfUkVHSU9O
X01BU0sNCj4gKyAgICBtb3YgICBccHJsYXIsICNcYXR0cl9wcmxhcg0KPiArICAgIG9yciAgIFxw
cmxhciwgXHBybGFyLCBcbGltaXQNCg0KVXAgdG8gaGVyZSB0aGlzIGlzIHRoZSBzYW1lIGFzIGFy
bTY0DQoNCj4gKw0KPiArICAgIG1jciAgIENQMzIoXHNlbCwgUFJTRUxSX0VMMikNCj4gKyAgICBp
c2INCj4gKyAgICBtY3IgICBDUDMyKFxwcmJhciwgUFJCQVJfRUwyKQ0KPiArICAgIG1jciAgIENQ
MzIoXHBybGFyLCAgUFJMQVJfRUwyKQ0KPiArICAgIGRzYiAgIHN5DQo+ICsgICAgaXNiDQoNCmhl
cmUgd2UgaGF2ZSBzb21ldGhpbmcgc3BlY2lmaWMgZm9yIGFybTMyIGZvciB3aGF0IGl0IGNvbmNl
cm4gdGhlIHJlZ2lzdGVyIHdyaXRlLA0KbWF5YmUgd2UgY291bGQgZG8gc29tZXRoaW5nIGFyb3Vu
ZCB0aGF0IGFyZWEgdG8gaGF2ZSBhIGNvbW1vbiBjb2RlIHRoYXQNCmNhbGxzIHNwZWNpZmljIGFy
Y2gtcmVsYXRlZCBtZXRob2RzIHRvIHdyaXRlIHRoZSByZWdpc3RlcnMgb24gYXJtMzIgYW5kIGFy
bTY0Lg0KDQo+ICsNCj4gKyAgICBhZGQgICBcc2VsLCBcc2VsLCAjMQ0KPiArDQo+ICsxOg0KPiAr
LmVuZG0NCj4gKw0KPiArLyoNCj4gKyAqIEZhaWx1cmUgY2F1c2VkIGR1ZSB0byBpbnN1ZmZpY2ll
bnQgTVBVIHJlZ2lvbnMuDQo+ICsgKi8NCj4gK0ZVTkNfTE9DQUwoZmFpbF9pbnN1ZmZpY2llbnRf
cmVnaW9ucykNCj4gKyAgICBQUklOVCgiLSBTZWxlY3RlZCBNUFUgcmVnaW9uIGlzIGFib3ZlIHRo
ZSBpbXBsZW1lbnRlZCBudW1iZXIgaW4gTVBVSVJfRUwyIC1cclxuIikNCj4gKzE6ICB3ZmUNCj4g
KyAgICBiICAgMWINCj4gK0VORChmYWlsX2luc3VmZmljaWVudF9yZWdpb25zKQ0KDQpzYW1lIGFz
IGFybTY0DQoNCj4gKw0KPiArLyoNCj4gKyAqIEVuYWJsZSBFTDIgTVBVIGFuZCBkYXRhIGNhY2hl
DQo+ICsgKiBJZiB0aGUgQmFja2dyb3VuZCByZWdpb24gaXMgZW5hYmxlZCwgdGhlbiB0aGUgTVBV
IHVzZXMgdGhlIGRlZmF1bHQgbWVtb3J5DQo+ICsgKiBtYXAgYXMgdGhlIEJhY2tncm91bmQgcmVn
aW9uIGZvciBnZW5lcmF0aW5nIHRoZSBtZW1vcnkNCj4gKyAqIGF0dHJpYnV0ZXMgd2hlbiBNUFUg
aXMgZGlzYWJsZWQuDQo+ICsgKiBTaW5jZSB0aGUgZGVmYXVsdCBtZW1vcnkgbWFwIG9mIHRoZSBB
cm12OC1SIEFBcmNoNjQgYXJjaGl0ZWN0dXJlIGlzDQoJCQkJCQkJCQkJICAgIF7igJQgdGhpcyBu
ZWVkcyB0byBiZSB1cGRhdGVkDQoNCj4gKyAqIElNUExFTUVOVEFUSU9OIERFRklORUQsIHdlIGlu
dGVuZCB0byB0dXJuIG9mZiB0aGUgQmFja2dyb3VuZCByZWdpb24gaGVyZS4NCj4gKyAqDQo+ICsg
KiBDbG9iYmVycyB4MA0KPiArICoNCj4gKyAqLw0KPiArRlVOQ19MT0NBTChlbmFibGVfbXB1KQ0K
PiArICAgIG1yYyAgIENQMzIocjAsIEhTQ1RMUikNCj4gKyAgICBiaWMgICByMCwgcjAsICNTQ1RM
Ul9FTHhfQlIgICAgICAgLyogRGlzYWJsZSBCYWNrZ3JvdW5kIHJlZ2lvbiAqLw0KPiArICAgIG9y
ciAgIHIwLCByMCwgI1NDVExSX0F4eF9FTHhfTSAgICAvKiBFbmFibGUgTVBVICovDQo+ICsgICAg
b3JyICAgcjAsIHIwLCAjU0NUTFJfQXh4X0VMeF9DICAgIC8qIEVuYWJsZSBELWNhY2hlICovDQo+
ICsgICAgbWNyICAgQ1AzMihyMCwgSFNDVExSKQ0KPiArICAgIGlzYg0KPiArDQo+ICsgICAgcmV0
DQo+ICtFTkQoZW5hYmxlX21wdSkNCj4gKw0KPiArLyoNCj4gKyAqIE1hcHMgdGhlIHZhcmlvdXMg
c2VjdGlvbnMgb2YgWGVuIChkZWNzcmliZWQgaW4geGVuLmxkcy5TKSBhcyBkaWZmZXJlbnQgTVBV
DQo+ICsgKiByZWdpb25zLg0KPiArICoNCj4gKyAqIENsb2JiZXJzIHIwDQo+ICsgKg0KPiArICov
DQo+ICsjZGVmaW5lIE5PUk1BTF9NRU1fU0laRSAgICAgICAgIDB4MDAxZmZmZmYgICAgLyogMk1C
IC0gMSAqLw0KDQp0aGlzIGlzIG5vdCB1c2VkIGhlcmUNCg0KPiArDQo+ICtGVU5DKGVuYWJsZV9i
b290X2NwdV9tbSkNCj4gKyAgICAvKiBHZXQgdGhlIG51bWJlciBvZiByZWdpb25zIHNwZWNpZmll
ZCBpbiBNUFVJUl9FTDIgKi8NCj4gKyAgICBtcmMgICBDUDMyKHI1LCBNUFVJUl9FTDIpDQo+ICsg
ICAgYW5kICAgcjUsIHI1LCAjTlVNX01QVV9SRUdJT05TX01BU0sNCj4gKw0KPiArICAgIC8qIHgw
OiByZWdpb24gc2VsICovDQo+ICsgICAgbW92ICAgcjAsICMwDQo+ICsNCj4gKyAgICAvKiBYZW4g
dGV4dCBzZWN0aW9uLiAqLw0KPiArICAgIGxkciAgIHIxLCA9X3N0ZXh0DQo+ICsgICAgbGRyICAg
cjIsID1fZXRleHQNCj4gKyAgICBwcmVwYXJlX3hlbl9yZWdpb24gcjAsIHIxLCByMiwgcjMsIHI0
LCByNSwgYXR0cl9wcmJhcj1SRUdJT05fVEVYVF9QUkJBUg0KPiArDQo+ICsgICAgLyogWGVuIHJl
YWQtb25seSBkYXRhIHNlY3Rpb24uICovDQo+ICsgICAgbGRyICAgcjEsID1fc3JvZGF0YQ0KPiAr
ICAgIGxkciAgIHIyLCA9X2Vyb2RhdGENCj4gKyAgICBwcmVwYXJlX3hlbl9yZWdpb24gcjAsIHIx
LCByMiwgcjMsIHI0LCByNSwgYXR0cl9wcmJhcj1SRUdJT05fUk9fUFJCQVINCj4gKw0KPiArICAg
IC8qIFhlbiByZWFkLW9ubHkgYWZ0ZXIgaW5pdCBhbmQgZGF0YSBzZWN0aW9uLiAoUlcgZGF0YSkg
Ki8NCj4gKyAgICBsZHIgICByMSwgPV9fcm9fYWZ0ZXJfaW5pdF9zdGFydA0KPiArICAgIGxkciAg
IHIyLCA9X19pbml0X2JlZ2luDQo+ICsgICAgcHJlcGFyZV94ZW5fcmVnaW9uIHIwLCByMSwgcjIs
IHIzLCByNCwgcjUNCj4gKw0KPiArICAgIC8qIFhlbiBjb2RlIHNlY3Rpb24uICovDQo+ICsgICAg
bGRyICAgcjEsID1fX2luaXRfYmVnaW4NCj4gKyAgICBsZHIgICByMiwgPV9faW5pdF9kYXRhX2Jl
Z2luDQo+ICsgICAgcHJlcGFyZV94ZW5fcmVnaW9uIHIwLCByMSwgcjIsIHIzLCByNCwgcjUsIGF0
dHJfcHJiYXI9UkVHSU9OX1RFWFRfUFJCQVINCj4gKw0KPiArICAgIC8qIFhlbiBkYXRhIGFuZCBC
U1Mgc2VjdGlvbi4gKi8NCj4gKyAgICBsZHIgICByMSwgPV9faW5pdF9kYXRhX2JlZ2luDQo+ICsg
ICAgbGRyICAgcjIsID1fX2Jzc19lbmQNCj4gKyAgICBwcmVwYXJlX3hlbl9yZWdpb24gcjAsIHIx
LCByMiwgcjMsIHI0LCByNQ0KPiArDQo+ICsjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USw0KPiAr
ICAgIC8qIFhlbiBlYXJseSBVQVJUIHNlY3Rpb24uICovDQo+ICsgICAgbGRyICAgcjEsID1DT05G
SUdfRUFSTFlfVUFSVF9CQVNFX0FERFJFU1MNCj4gKyAgICBsZHIgICByMiwgPShDT05GSUdfRUFS
TFlfVUFSVF9CQVNFX0FERFJFU1MgKyBDT05GSUdfRUFSTFlfVUFSVF9TSVpFKQ0KPiArICAgIHBy
ZXBhcmVfeGVuX3JlZ2lvbiByMCwgcjEsIHIyLCByMywgcjQsIHI1LCBhdHRyX3ByYmFyPVJFR0lP
Tl9ERVZJQ0VfUFJCQVIsIGF0dHJfcHJsYXI9UkVHSU9OX0RFVklDRV9QUkxBUg0KPiArI2VuZGlm
DQo+ICsNCj4gKyAgICBiICAgIGVuYWJsZV9tcHUNCj4gKyAgICByZXQNCj4gK0VORChlbmFibGVf
Ym9vdF9jcHVfbW0pDQoNClRoaXMgb25lIGlzIGVxdWFsIHRvIGFybTY0IGFwYXJ0IGZyb20gdGhl
IHJlZ2lzdGVycyB4WSAtPiByWSwgYnV0IEnigJltIG5vdCBzdXJlIHdlIHdvdWxkDQp3YW50IHRv
IGNvbnNvbGlkYXRlIHRoYXQuDQoNCj4gKw0KPiArLyoNCj4gKyAqIExvY2FsIHZhcmlhYmxlczoN
Cj4gKyAqIG1vZGU6IEFTTQ0KPiArICogaW5kZW50LXRhYnMtbW9kZTogbmlsDQo+ICsgKiBFbmQ6
DQo+ICsgKi8NCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9jcHJlZ3Mu
aCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9jcHJlZ3MuaA0KPiBpbmRleCBhZWM5ZThmMzI5
Li42MDE5YTJjYmRkIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY3By
ZWdzLmgNCj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NwcmVncy5oDQo+IEBAIC0x
LDYgKzEsMTAgQEANCj4gI2lmbmRlZiBfX0FTTV9BUk1fQ1BSRUdTX0gNCj4gI2RlZmluZSBfX0FT
TV9BUk1fQ1BSRUdTX0gNCj4gDQo+ICsjaWZkZWYgQ09ORklHX01QVQ0KPiArI2luY2x1ZGUgPGFz
bS9tcHUvY3ByZWdzLmg+DQo+ICsjZW5kaWYNCj4gKw0KPiAvKg0KPiAgKiBBQXJjaDMyIENvLXBy
b2Nlc3NvciByZWdpc3RlcnMuDQo+ICAqDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vbXB1L2NwcmVncy5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9jcHJl
Z3MuaA0KDQp4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1L2FybTMyL21wdS5oPyBXaGVyZSB5
b3UgZGVmaW5lIGFsbCB0aGUgTVBVIHJlZ2lzdGVycyBidXQgd2l0aA0KYSB0cmFuc2xhdGlvbiBm
cm9tIHRoZSBhYXJjaDY0IG5hbWUgdG8gdGhlIGFybTMyPyBOb3Qgc3VyZSBhYm91dCB0aGF0LCBi
ZXR0ZXIgYXNrIGEgbWFpbnRhaW5lci4NCg0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRl
eCAwMDAwMDAwMDAwLi5iZDE3YThjNzVhDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL21wdS9jcHJlZ3MuaA0KPiBAQCAtMCwwICsxLDIxIEBADQo+ICsj
aWZuZGVmIF9fQVNNX0FSTV9NUFVfQ1BSRUdTX0gNCj4gKyNkZWZpbmUgX19BU01fQVJNX01QVV9D
UFJFR1NfSA0KPiArDQo+ICsjZGVmaW5lIEhNUFVJUiAgICAgICAgICBwMTUsNCxjMCxjMCw0DQo+
ICsNCj4gKy8qIENQMTUgQ1I2OiBNUFUgUHJvdGVjdGlvbiBSZWdpb24gQmFzZS9MaW1pdC9TZWxl
Y3QgQWRkcmVzcyBSZWdpc3RlciAqLw0KPiArI2RlZmluZSBIUFJTRUxSICAgICAgICAgcDE1LDQs
YzYsYzIsMQ0KPiArI2RlZmluZSBQUkJBUl9FTDIgICAgICAgcDE1LDQsYzYsYzMsMA0KPiArI2Rl
ZmluZSBQUkxBUl9FTDIgICAgICAgcDE1LDQsYzYsYzgsMQ0KPiArDQo+ICsjZGVmaW5lIE1QVUlS
X0VMMiAgICAgICAgICAgICAgIEhNUFVJUg0KPiArI2RlZmluZSBQUlNFTFJfRUwyICAgICAgICAg
ICAgICBIUFJTRUxSDQo+ICsNCj4gKyNlbmRpZg0KPiArDQo+ICsvKg0KPiArICogTG9jYWwgdmFy
aWFibGVzOg0KPiArICogbW9kZTogQVNNDQo+ICsgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwNCj4g
KyAqIEVuZDoNCj4gKyAqLw0KPiAtLSANCj4gMi4yNS4xDQo+IA0KPiANCg0K

