Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57756986CAB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 08:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804925.1215900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiAQ-0001T6-Dv; Thu, 26 Sep 2024 06:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804925.1215900; Thu, 26 Sep 2024 06:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiAQ-0001QA-Ar; Thu, 26 Sep 2024 06:39:58 +0000
Received: by outflank-mailman (input) for mailman id 804925;
 Thu, 26 Sep 2024 06:39:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCv=QY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1stiAN-0001Q4-QB
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 06:39:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f403:2613::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 238a2eb8-7bd2-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 08:39:54 +0200 (CEST)
Received: from DB9PR02CA0005.eurprd02.prod.outlook.com (2603:10a6:10:1d9::10)
 by DU5PR08MB10611.eurprd08.prod.outlook.com (2603:10a6:10:519::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Thu, 26 Sep
 2024 06:39:44 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::c9) by DB9PR02CA0005.outlook.office365.com
 (2603:10a6:10:1d9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20 via Frontend
 Transport; Thu, 26 Sep 2024 06:39:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Thu, 26 Sep 2024 06:39:43 +0000
Received: ("Tessian outbound 245dacdadcd4:v465");
 Thu, 26 Sep 2024 06:39:43 +0000
Received: from L71e769cbe82e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 07946D38-A1CC-49AB-BCE5-E170C87E5E1D.1; 
 Thu, 26 Sep 2024 06:39:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L71e769cbe82e.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Sep 2024 06:39:37 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAWPR08MB9757.eurprd08.prod.outlook.com (2603:10a6:102:2e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Thu, 26 Sep
 2024 06:39:30 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8005.010; Thu, 26 Sep 2024
 06:39:30 +0000
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
X-Inumbo-ID: 238a2eb8-7bd2-11ef-a0ba-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IHaj5xjbZm9AAd3Eue1pfQjKnqtBIe26e4+tRns/lm1qtPyxpqMcDy8W12Au6bkCd8KQ6ownUwmZoC2U6YoJAYIbhdiaNXWIASY/MMLhb5I0ojYCq8Dw4jDuS5nEfvZzmXdZK7/xLqL0pGOGS4kVkpbkd8yffRJPeRDfFRcsVsVKw7/uV1fnwkQEUd3llpJhkXNaGaPJAep3wy7C2/+WXVoNUaICUSIendU/hk6XYEs2Y/YqK/3hEMCTHRtwDjXq7OB8AEXwUn6idfLecl7lgIn9hxVbAXvkE2Yt3va177VjJTa8FhNra4VBw/3cHY6SM7g6LpHBwGFOeVF/vzhBNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BE/oRQVztHkwyKm4hxB/UyEZ4Ge4eaF9P3R7Ai6Aa3U=;
 b=HJVJe2H0DmCp5qxYmgtOJrkw2CAmQC48WT82aDW/wN9ex/d1k4wMhJC5x7xRDBbl4xIFiBR+hH5hTAtvwIXRVA1zhmzGClEphjlu75cgWVXloTJ8XYYBruowmswnPEwNh3ZYe6Rz1H64YhdlWXGouEZF9chqTYYqUbjjM8k2nVFmM7FBDDk7EYz7527OKhcaPFiL5z/JdBGQ7bgLt21o8q2hViLSnLa86jcHxpFqU0n/BBv1nihxxXWhv5//gU9mSNU+IpounX0bJD817gEBp89Wb2jN+ORJWB0cem45/bF9cyetAK71D+qF9T3ILfuzoSmX1db6Ndvh2l7+SfUHww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BE/oRQVztHkwyKm4hxB/UyEZ4Ge4eaF9P3R7Ai6Aa3U=;
 b=lME3tA7GU26i7OGuAUrqp0rGlFycUi5dDNkizpV2MiB7RuzZuOAbPUu0lhZUFdoXRRBV3wog6AIJQKFVl8M7DJNMZ4YAK8IukO1vEIiKzH4w+CW5bKSbcDEE/tIrqSAE5bMjZK3+SBxdT3haY+1aTbXyYTGrt3FEwyfqIoibUUU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00a8efee53f563f5
X-TessianGatewayMetadata: 8Rekk1osqk3vJvJ1JHfCz2IhlB4CjMRGX1TsmJfaOoTLxKa/ZvDbd1tBxw6N8C2PuudrXVAHpE4pZLofZWRIq41LYUAnwgrtz3hdENTD6H0+oelt2nMvcPd9oOybneWT6QyOM5Cu+d1vTthK0l4Fx5Q3FpSV87xTLngRQFRcrWQ=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNd/ChfkuO5WDLZHDuIKyvL+wrmRzaxNEk4mc0mf72BVtMwcse7aBbDbtUlc5SpkKbuE6dn80FpGV7BaYECihJy94BWNuxZTdKxD7Ha28KR4yWLuMnz06dtg+HjgC0QW4+9ugY3diRlEz/R9emMVilmpvAA8sU8n8tsNKRGaxYVOb+xDLtltCzRccQtv5DjtYo5PwfuIhpR7fPHncfKcIYOButjRqLZ1baYT3vlO4NVqdaidhgdtDRpa6BTYR+B6eH7+oSfJW/R9zwQW0X8eNA4s6gR1OH6pOu0eUUksRPM/KeDgQJi+bUf4h1C6nfPCDZovPn3jubY0FmArLzQIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BE/oRQVztHkwyKm4hxB/UyEZ4Ge4eaF9P3R7Ai6Aa3U=;
 b=rK6svKf/JliThm77K/QaBNU8zl1f9DsPiUzkQ70UCkFLFAObRch7vCWaC4t1tx3kTAMxl8TtIdKXgJXsRV31R2ZAbHZftDhAziKUFBJcf5Rul52g9BDYabhyq79HRSYJf76dEobP1TtIXml6bM2awGDDgv717GJS7lWVJ5RLsPg9lf/FHE2OzdoZ5gd3MjBYRMkaH1SzBfAK0la0/jAuAEyu8KkJzh9ZQyMGyRp5j7WjpPyXuaXW4QglAQRC1yET+Oh6Wjmu8heGK4zsfroKLM37Rtw4Wv53F175eM2+12lugbz+Xrez9lV85u6VI+4SBXdU+Trfbrk8rUJ2Aipmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BE/oRQVztHkwyKm4hxB/UyEZ4Ge4eaF9P3R7Ai6Aa3U=;
 b=lME3tA7GU26i7OGuAUrqp0rGlFycUi5dDNkizpV2MiB7RuzZuOAbPUu0lhZUFdoXRRBV3wog6AIJQKFVl8M7DJNMZ4YAK8IukO1vEIiKzH4w+CW5bKSbcDEE/tIrqSAE5bMjZK3+SBxdT3haY+1aTbXyYTGrt3FEwyfqIoibUUU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 04/10] xen/arm: ffa: Fine granular call support
Thread-Topic: [PATCH 04/10] xen/arm: ffa: Fine granular call support
Thread-Index: AQHbCo5KX65uygb9tUuG+eWGxSrgRrJjyouAgAGIQ4CAA2/dAIAA5doA
Date: Thu, 26 Sep 2024 06:39:30 +0000
Message-ID: <9A475B9D-A7BA-40C2-9603-66F9ED6A931C@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <bb7e497fa2b03e0176b5013a05f342f3ea5ea296.1726676338.git.bertrand.marquis@arm.com>
 <0a537da2-4f2b-49a2-9e6b-6acc1a9aaabc@xen.org>
 <CAHUa44EC-0YNnWmD1-+sWDHqY=WsKVxV0N2N3a-Lc=AaTkMGUg@mail.gmail.com>
 <aa0ea808-4767-4180-8522-c436eab7dc47@xen.org>
In-Reply-To: <aa0ea808-4767-4180-8522-c436eab7dc47@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAWPR08MB9757:EE_|DB3PEPF0000885B:EE_|DU5PR08MB10611:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb0908a-f3c7-4656-5496-08dcddf601a9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZVpyUnRqaGVQSmFSZDFPUWxKVEdWL3l4ZUZ5eERTazdFS2xYVFhocmI4eDEx?=
 =?utf-8?B?citBTW9FQWRXN25HOEVNZWp0ZWUxSWFmTUFZeFFwWkdKZlkraUh0d3NxaEpu?=
 =?utf-8?B?S0FwcUZWSmVWTXJwZWlKMGZnWnJvOUNVcUhJOFhjZEd6eUlwN2NTY2s3UU1Y?=
 =?utf-8?B?UHRwUkdpQkZXanNNSVZlanFVbHlTb1FlU1g3enVkeFVwL2docmwveHhzUW51?=
 =?utf-8?B?c2l2VHlBU3I4ZjAzcjhJSTlBcjFHcDlKVXdWNEsxemxoRkx3eFhXajlhTjRY?=
 =?utf-8?B?Ums2SHlmeWtTSkM2ZkswRVlYZE5LUnZmTGQrSHUzRDNWTENONmVFdFcraDVK?=
 =?utf-8?B?cm5VODc1dTk4MjNBUFFjNmhkeStMNVI5QjNBTmFqK2tGTnVNem92Y0lGQm9X?=
 =?utf-8?B?STJEYU1VWWd2aVhScGIwOEhBZTh5bnRQZk9WVjFTbTd4TEpGZlNsRlhKUk5U?=
 =?utf-8?B?bzFBYVNWVE52dDlOMDBHNVVtVVVKTlY1Z21sRnJONjBTTWRJc3J2eENaWTFV?=
 =?utf-8?B?YittSWJIUXl4Q1I1aGY4WjlveGNYUXNwSEtMeE1vSXRTeWgyQU1PczVpZHNy?=
 =?utf-8?B?WnFFV0FkSmlLQXV2ZHhLVEtBOE1CbnkrdC9hYlR1SWFHUlNCSHJuK0dYbGI5?=
 =?utf-8?B?dmFUb0ZTVTZRY0FNWmdjWk40bHc2VWs5emRKamhycDNIbHkyQ2JRUHVnWUxZ?=
 =?utf-8?B?RjhzZW5idmNWVGVuMTFrUWpUYWt2dk1LenV0cjRrZTMzU3RBazZjY2t3Nk1D?=
 =?utf-8?B?Z2pYaEdsenF2cUU2UGlWRWE3MEk4bXVtY3c5K01zaUsyZlRyMFc0eWFiakxF?=
 =?utf-8?B?SVVCV3RHVmpXOFdKS0N0WkdqOGgzU2FmWjdrM2ladUJrVVJULzJCMUM2RlNI?=
 =?utf-8?B?OUc5VGQ0eXFwdGZnbm5aeGQ2b2g2SVNaMjVxRTNZcStLbE9GamE4MHRXWkow?=
 =?utf-8?B?aVh0NVNzOTZ1RDI0cTlkOTRmZzZjWjdlbnVzMXBjaXovUnVnNDRuZDlHL2lV?=
 =?utf-8?B?NHh5MTBRTzVNbkpVMmFOQStTNzUvR1Jidkdob3MweVNwVWNWOWNrUTB3VE1r?=
 =?utf-8?B?bXM4ZlpMZSt2d3h2MWNObVdvQUpWZzhoR1pLNy81b1F1VmczbENBcFAxTmFC?=
 =?utf-8?B?cjl6dVhlMThockVhT0hPVlZPWW1oS2xkdDhSVEZvRnFGYzhnNW1lNGorbVFE?=
 =?utf-8?B?Ykk2Q3c4WVh0YjNGWks3OGdNM25JTW9hYmVhN0d0dGI4NkJWeXFKeEp3QTJr?=
 =?utf-8?B?d25WZDNZQ1gySXZJYzZEZk9mVzlsWk1yOW9tMk41N3hUMlFVUllSOERmd1dw?=
 =?utf-8?B?VElxQVcvaTAvbmVVR0pHZWQ1ckZaRXFXeXY0ZXl6UTkzRzhTZlYzVmExUXVw?=
 =?utf-8?B?eUhjVmZLeVFUNVgveWd0SmQ4T3JSQVJQZGVINHJyck5vZERnZHowa2VYVjJM?=
 =?utf-8?B?YjlFZXl2c1RMMzhzd0Q0WHM0Wk5YSWJvTVYzUjNGWUpHb1RZdjZLeXNWZm5u?=
 =?utf-8?B?d0MxQ0E5akRyNDlhMVU4emVmNHR0b2hWb3lRZTFEbUsrWE40K01jT1h1cWtF?=
 =?utf-8?B?Vmx2Njd6Z2t2Q20yYnVnUzlJTHg3dGlIbjkrTlBESUdWM3ZwSDc2akljQ09J?=
 =?utf-8?B?VExLVmlDZURLZEdaM2Vnc1RhdmY5RkloWFY2UXY2aTQyT3ZzMXNBQnZzcW9L?=
 =?utf-8?B?NGxYNTh0a25UdngrMFR1RjVWY1hQMm84WkpPRGkwa09CYWlZK25NbFVJVHN3?=
 =?utf-8?B?bzVMYnNyaC8xY0NVWTY1SWRmVVRtOHVZVU5iQVljTkloUXoxeVNaQ2VjTEVr?=
 =?utf-8?B?ZU1xYVFXbDNvNDFrSlRJUmE2akNma21YdzNZNDA5Z3VHQ2VXZmd5ZUdRVDMx?=
 =?utf-8?B?djA0L1pWMEdSbUNPSWtVVGlod09VVUZpUUJNcVd6cXVvVHc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <21373D3F6D5BE24A948B2404C00A48D2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9757
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	272e4589-746b-40a2-f56d-08dcddf5f9a8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0FwZFQ3UGdlKzJIeGtBalhiTlJQcVVuZGJqZHk2dzB4QzJ5RmFGeXBwNUhp?=
 =?utf-8?B?NW5YUFpGRkYzRmFyTktQV3lkWkZvU0VxNHV6THVzZUJzeERRNUtEdEMrZjlv?=
 =?utf-8?B?REpOLzVaMW01QmpkbDF1LzhldUwxRG9vNTVTSi8xakF0cXdmVEFRNU9WUmhN?=
 =?utf-8?B?MFV1RDNSbHVnbWtpMDNwcnJjOUJ0SzVYRWNaY3U3N2ZySHNTdWdiMkNpdTMr?=
 =?utf-8?B?cEdSNUFTQnlSUmx4RFdFREhHZDVpVGtuTUxXTFNwbUJoUVJ0MCs4V0xEUGh5?=
 =?utf-8?B?NjFYSU9sZjM1ODdsTDNaRjVFNjZqL1lPY1NVakZzb2JKYlc1blBYN3RWanJm?=
 =?utf-8?B?VGNkaVdUUnZrRG9KTElvSkZVL1BFN1lkaVU5QmZBSUdFSW1RMVBEalVFak8x?=
 =?utf-8?B?WTc5by9OZ0o5S1FRbXc3b2loaEVmYWc0SnFYa1dvcWRBcU11dExuSURZZXFn?=
 =?utf-8?B?dkRpQVpqMEUxckhGSzRoV1RmZHpaOEg2TmZhVkk2STh0ME96SThpL1dYcVQ0?=
 =?utf-8?B?RFJTbVVISWNTL3NmTlk3RWkwZlRFT1E0TzRBMkpXenNkVnRIR3JnNWRnRmQ4?=
 =?utf-8?B?WDZqdTAwa2pmK29BSU9yMG0wMGh6NVN2RWZQSTQ2RTBKOXlxUmxySlJhQ0JD?=
 =?utf-8?B?elZVNXlTK1lCRHZLUW5WdDAwRVpURTNVRkUxNkx1UjNNR1FVcWhFb0RjbnpH?=
 =?utf-8?B?OXZneFNlR0t2eXJmMTYva01PbE93azhNSUZUNnZGWnNUc0hVQ0oxemU2TWJC?=
 =?utf-8?B?TjNXMkxDSkdkdDRiRlJCVXlpTVhZZThQREJkcjNyblI5TXN4aERHQmc5MzQ4?=
 =?utf-8?B?N2FVY3NxWGh2R0JvelJXNStXSmY0R202NEZnSldMYTBDNENJamRSeDdpaWNZ?=
 =?utf-8?B?b0lETXl6M2QreEJpSlhFS3VTTFh1VUtnaEt3N05xcmdKV3RXRFhhRVRoY0gx?=
 =?utf-8?B?dXJtOGhRKzRaVTNQcjNGTnc3NTdyMHRQa1B6ZDI2SFdEcjNDSUdERkFBU24r?=
 =?utf-8?B?Qjh1dktnY0hoZDVqaVowMUFEazBwYVJNWnRWdEdSNlNxRDI2d0UxK3M0NjZv?=
 =?utf-8?B?bHBzOHBWZnhpVUQyZmYwQzFtZFJqUTRYMm95UC91QXZHdjRWd3ExSURyLzJk?=
 =?utf-8?B?elBNemQ5cXdLQ25vWHhwNUNrNWFjRTFjTXFOMEdaa3Iwb0hNSTR5cXlvU3d1?=
 =?utf-8?B?OUJESUY1NXpWK2xsaW1nbFdNMHNzOGJHMmV0V3NxbW0wVkZFWUgvdmw2SEZN?=
 =?utf-8?B?NTNnbGFsN0VqSGJ6YXp5TVdxa1pUaXpiREpEa2tlcUFzWVJkcU9IWEkrOTdt?=
 =?utf-8?B?V1ZzdEVodzd2MEpYQ09GR2Qvd3FidVZndU1UZGxPK25JSjlheG1SOEJERlNV?=
 =?utf-8?B?alRYbVN2bEluL3BlQVV6UFN2bkI1aWxKbEJVWFprd2NEcnZ6RGMvMUZLUkV4?=
 =?utf-8?B?KzJmeXJpY3FQR2F4U0o5VTVXQ2FvcXFmN0c2Ty9iaFIvVDBmM2lOUU1sanpE?=
 =?utf-8?B?YWQ0NlY0QThTenJCVmtUc2pDZzRtY1hVdnpranJVREhUdzdzT1hYK24wVjhi?=
 =?utf-8?B?Y1NkaTVuempMRnV3Qng0bzJNcXdmM2pqVnNKejhUT3lBTEd4SW9LZmZPZG5P?=
 =?utf-8?B?bjN2d2RGeFVLSnZnK3YvdUpCb0wvRlpwSEM0cEwrT2VES3NGMlBCKzBLQlVz?=
 =?utf-8?B?S2JYaFYvcERzbEh2WEZ4ekJuTkZJSkpMc2tqdFQ2eENSYS8vU2VmQUt5MTVI?=
 =?utf-8?B?VWVoRDNGWHdSWEdUL2poSC9xc09qb25zMUMvbHVMRFNUNjVNQml0Z3ZkQnI4?=
 =?utf-8?B?S0dhbzY5ZTVyTWczUllrNVZiaUtoYXpialRZcjMxZ2NmZTZxREMwdXowV2JB?=
 =?utf-8?B?d1hPME1CL2xEaWZjblB2akFFMHMyTlRxdm5tSmhjZ2ZWL2hvSlV2QnpnNTV4?=
 =?utf-8?Q?pook27zAM/iwNAcKXzCXjKB0SyWOOIdA?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 06:39:43.9023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb0908a-f3c7-4656-5496-08dcddf601a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10611

SGkgSnVsaWVuLA0KDQpJIHdpbGwgYW5zd2VyIGFmdGVyIHRvIHlvdXIgcHJldmlvdXMgY29tbWVu
dHMgYnV0IEkgd2FudGVkIHRvIGp1bXAgaW4gb24gdGhpcyBzdWJqZWN0IGZpcnN0Lg0KDQo+IE9u
IDI1IFNlcCAyMDI0LCBhdCAxODo1NiwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3Jv
dGU6DQo+IA0KPiANCj4gDQo+IE9uIDIzLzA5LzIwMjQgMTM6MjcsIEplbnMgV2lrbGFuZGVyIHdy
b3RlOg0KPj4gSGksDQo+IA0KPiBIaSwNCj4gDQo+PiBPbiBTdW4sIFNlcCAyMiwgMjAyNCBhdCAz
OjA04oCvUE0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4g
SGkgQmVydHJhbmQsDQo+Pj4gDQo+Pj4gT24gMTkvMDkvMjAyNCAxNDoxOSwgQmVydHJhbmQgTWFy
cXVpcyB3cm90ZToNCj4+Pj4gQ3JlYXRlIGEgYml0bWFwIHRvIHN0b3JlIHdoaWNoIGZlYXR1cmUg
aXMgc3VwcG9ydGVkIG9yIG5vdCBieSB0aGUNCj4+Pj4gZmlybXdhcmUgYW5kIHVzZSBpdCB0byBm
aWx0ZXIgd2hpY2ggY2FsbHMgZG9uZSB0byB0aGUgZmlybXdhcmUuDQo+Pj4+IA0KPj4+PiBXaXRo
IHRoaXMgZW5hYmxlZC4gYWxsb3cgRkYtQSBzdXBwb3J0IHRvIGJlIGFjdGl2YXRlZCBmb3IgZ3Vl
c3QgZXZlbiBpZg0KPj4+IA0KPj4+IFR5cG86IHMvLi8sLyBJIHRoaW5rLg0KPj4+IA0KPj4+PiB0
aGUgZmlybXdhcmUgZG9lcyBub3Qgc3VwcG9ydCBpdC4NCj4+PiANCj4+PiBDYW4geW91IGV4cGxh
aW4gd2h5IHlvdSB3YW50IHRvIGRvIHRoaXM/DQo+Pj4gDQo+Pj4gVGhlIFRFRSBtZWRpYXRvciB3
YXMgZGVzaWduZWQgdG8gaW50ZXJwb3NlIHdpdGggdGhlIEhXLiBXaXRob3V0IHRoZSBIVw0KPj4+
IGl0IGRvZXNuJ3QgZW50aXJlbHkgbWFrZSBzZW5zZSB0byB0cnkgdG8gdXNlIGl0Lg0KPj4+IA0K
Pj4+IEl0IHdvdWxkIGFsc28gbm90IHdvcmsgaWYgdGhlIGhvc3Qgc3lzdGVtIGlzIHVzaW5nIE9Q
LVRFRSBhbmQgZXhwb3NlIHRvDQo+Pj4gc29tZSBWTSBGRi1BLiBTbyBpdCBmZWVscyB0aGF0IHRo
ZSBtZWRpYXRvciBtYXkgbm90IGJlIHRoZSByaWdodCBwbGFjZQ0KPj4+IHRvIGhhbmRsZSB0aGlz
IGNhc2UuDQo+PiBUaGF0J3MgYSBnb29kIHBvaW50LCBidXQgYWxsIHRoZSBGRi1BIGhhbmRsaW5n
IHNob3VsZCBiZSBpbiB0aGUgc2FtZQ0KPj4gbW9kdWxlIHNpbmNlIHRoZXJlJ3MgYm91bmQgdG8g
YmUgY29kZSBhbmQgc3RhdGUgdG8gc2hhcmUuIFRoZSBwcm9ibGVtDQo+PiBpcyB0aGF0IEZGLUEg
dHJpZXMgdG8gYmUgYSBURUUgbWVkaWF0b3Igd2hpbGUgaXQncyBhYm91dCB0byBiZWNvbWUNCj4+
IG1vcmUgdGhhbiB0aGF0LiBXZSBjYW4gd29yayBhcm91bmQgaXQgYnkgcHJvYmluZyB0aGUgT1At
VEVFIG1lZGlhdG9yDQo+PiBmaXJzdCwgYnV0IGl0J3MgYWRkaW5nIGFub3RoZXIgZXhjZXB0aW9u
IG9yIHNwZWNpYWwgY2FzZS4gV291bGQgaXQNCj4+IG1ha2Ugc2Vuc2UgdG8gbW92ZSB0aGUgRkYt
QSBtZWRpYXRvciBvdXQgb2YgdGhlIFRFRSBtZWRpYXRvciBmcmFtZXdvcmsNCj4+IGFuZCBlc3Rh
Ymxpc2ggaXQgc2VwYXJhdGVseT8NCj4gDQo+IEkgZG9uJ3QgcGFydGljdWxhcmx5IHdhbnQgdG8g
aGF2ZSB0aGUgRkYtQSBtZWRpYXRvciBvdXQgb2YgdGhlIFRFRSBtZWRpYXRvci4gQXQgdGhlIG1v
bWVudCwgaXQgaXMgdW5jbGVhciB0byBtZSBob3cgbXVjaCBvZiB0aGUgU01DIGhhbmRsaW5nIGNv
ZGUgY2FuIHJlYWxseSBiZSBzaGFyZWQgYmV0d2VlbiBhIGRvbWFpbiB0YWxraW5nIHdpdGggdGhl
IGhvc3QgZmlybXdhcmUgYW5kIGFuIGVtdWxhdGVkIHZlcnNpb24uIEFyZSB3ZSBqdXN0IGdvaW5n
IHRvIGVuZCB1cCB0byBoYXZlICJpZiBmaXJtd2FyZSB0aGVuIHRvIHRoaXMgZWxzZSBkbyB0aGF0
Ij8NCg0KV2Ugd2lsbCBuZWVkIHRvIGhhdmUgYSBkZWJhdGUgb24gaG93IHRvIGhhbmRsZSBPcHRl
ZSBNZWRpYXRvciB2ZXJzdXMgRkYtQSBvbmNlIHdlIGhhdmUgRkYtQSBzdXBwb3J0IGJldHdlZW4g
Vk0uDQpJbiB0aGlzIGNhc2Ugd2UgY291bGQgaGF2ZSBjYXNlcyB3aGVyZSB0aGUgZmlybXdhcmUg
YW5kIHNlY3VyZSB3b3JsZCBkb2VzIG5vdCBzdXBwb3J0IEZGLUEgYW5kIG9wdGVlIGlzIHVzaW5n
IHRoZSBjdXJyZW50IHByb3RvY29sIGJ1dCBzb21lb25lIHdhbnRzIHRvIHVzZSBGRi1BIGJldHdl
ZW4gVk1zLiBNeSBndXRzIGZlZWxpbmcgcmlnaHQgbm93IGlzIHRoYXQgd2UgY291bGQgKGFuZCBw
cm9iYWJseSBzaG91bGQpIG5vdCBhbGxvdyB0aGlzIHVzZSBjYXNlIGFzIGl0IHdvdWxkIGJlIHJl
YWxpc3RpYyB0byBzYXkgdGhhdCBhIGZpcm13YXJlIHN1cHBvcnQgRkYtQSBhdCBzb21lIHBvaW50
IHdvdWxkIG5vdCBzdXBwb3J0IHRoZSBvbGQgb3B0ZWUgcHJvdG9jb2wuDQoNCkF0IHRoZSBzdGF0
dXMgb2YgdGhpcyBwYXRjaCAoYW5kIGkgZG8gbm90IHBsYW4gdG8gcHVzaCBWTSB0byBWTSBzdXBw
b3J0IGluIGFueXRoaW5nIGVsc2UgdGhhbiBhbiBSRkMgaW4gdGhlIG5leHQgd2Vla3MpLCBJIHRo
aW5rIEZGLUEgc2hvdWxkIHN0YXkgYXMgYSBURUUgbWVkaWF0b3IgYW5kIEkgd2lsbCByZXZlcnQg
dGhlIGNoYW5nZSBlbmFibGluZyBGRi1BIHN1cHBvcnQgaW4gWGVuIHdoZW4gdGhlIGZpcm13YXJl
IGRvZXMgbm90IHN1cHBvcnQgaXQgYXMgd2UgZG8gbm90IG5lZWQgdGhhdCBiZWZvcmUgVk0gdG8g
Vk0gRkYtQSBzdXBwb3J0IGlzIGFkZGVkLg0KDQpOb3cgZXZlbiB3aXRoIHRoYXQgY29tZXMgYSBx
dWVzdGlvbjogV2hhdCB0byBkbyBpZiB0aGUgZmlybXdhcmUgc3VwcG9ydHMgRkYtQSBidXQgc2Vj
dXJlIHdvcmxkIGhhcyBvcHRlZSBidXQgdXNpbmcgdGhlIG9sZCBwcm90b2NvbC4NClNob3VsZCB3
ZSBwcm9iZSBvcHRlZSBmaXJzdCBhbmQgRkYtQSBzZWNvbmQgPw0KDQpDaGVlcnMNCkJlcnRyYW5k
DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0KDQo=

