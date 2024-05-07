Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8068BE4FA
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 15:58:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718140.1120706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4LKX-0006CO-7X; Tue, 07 May 2024 13:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718140.1120706; Tue, 07 May 2024 13:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4LKX-0006A6-4h; Tue, 07 May 2024 13:58:05 +0000
Received: by outflank-mailman (input) for mailman id 718140;
 Tue, 07 May 2024 13:58:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rSc=MK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s4LKW-00067T-DM
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 13:58:04 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20600.outbound.protection.outlook.com
 [2a01:111:f403:260e::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d241ec5b-0c79-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 15:58:03 +0200 (CEST)
Received: from DUZPR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::7) by AS2PR08MB10055.eurprd08.prod.outlook.com
 (2603:10a6:20b:645::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 13:57:57 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::97) by DUZPR01CA0028.outlook.office365.com
 (2603:10a6:10:46b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39 via Frontend
 Transport; Tue, 7 May 2024 13:57:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Tue, 7 May 2024 13:57:57 +0000
Received: ("Tessian outbound af213ececc3d:v315");
 Tue, 07 May 2024 13:57:57 +0000
Received: from 127378893e86.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7C5AB285-C85E-437C-A335-3B533FD96C88.1; 
 Tue, 07 May 2024 13:57:51 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 127378893e86.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 May 2024 13:57:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM9PR08MB6145.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 13:57:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 13:57:45 +0000
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
X-Inumbo-ID: d241ec5b-0c79-11ef-909c-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=h0I1I5DPCO5S9fLGKY5Fl08PlnMxuoblxKmr/3iGAgjXgJFENL99asHSnqIXUAZqVRWq6w9khNgzVFswB2p3kniEJ/TGRKjjlDZYPx7AvwW/OSB+wUKhulJg/NQxUcOZ/ANqj5LqQcqsVlu62kSH8/LjvliqBNFupvDW55hPuxneinNhwtcU5AQOoX4SUeiinj4dEa1ju1a6AwOvaFtBIPh0KfBwddOR2VGwPK0EfGhEcDMqad7yZ6geM5aywyJLSbfmyFSrCkQSNN+DK6OtZu07cY48Lvmr1Dng61JAs5vT+DIvd/yDt4ygqO9qmtz9HSD8Qe0523Pdi6VErunefA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj95v0F4jEBZJBlEeYiyEY3/PdOwE+UuPuzRIxR02Zc=;
 b=bF3iPwx16wtGib6F0x6KTkt7mW48jvHbNHLLlmPDKOoSqMeHbdFwzM4wAcw6NxhcXOwKKsSabrlAbO1yqI01QsT5oiP/0OpWQGO9evqvGaS2a0Jh2bPrV9jkGlw1XYhe5U4G2Zwj7g8OcMFfFJC5emYs8gMxlDiv48PflZ+AZUIlIWhkhWmEzW9B35FNNU5s1Yot+HRS+vhPwjAGdwDLY91u5MIrUUOCcIGogw35v4557nUQ6GjfumUnRcNkntlRZuUot86Js0ns62SlrJsjytQwpID+D1XBjb4ojeYL89KwWmYnoZZj/MBJvysD+inKzXNld1yaJP0ePGMsa/bMeQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj95v0F4jEBZJBlEeYiyEY3/PdOwE+UuPuzRIxR02Zc=;
 b=BRX+Ix4CuzZRtyKVdE6aSo2SO4ugZPKlz+mSUXdw5dfeW8vPTbzKptYHgcbrpWF8MhPHwNS990DBzmijElioBcWUHB/X7PyzvIFcIES2YTleHBuSyu69/WOqc2v1CQiAMH6XsJcU1meew8OWKQ/86oUMT3lg+c9kgDCXBZ9X9Wk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0db1e7dbc6cf367c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xgf96QGKJCQD+b3sow/to73uTTq4selMrsbLRjnDQ2LgFEU5RH/cniGgrQhEOy+DC4DUNsQAXVixdkMpMaYRBTz+mf49Byq9vctbMtmQcFR4/CxnD5bPG6CAo9ulwjgJXEJIsCG5PtUP0JFR2oiQvVdL1/LdJMPD5BcAst3zSjMeoLhC66X9uzAC1D49MzBqcn1OmBrTKg1daQymnexDIeAHmQK0OECWAaoGxfGKIy621mfgKrzFl6rF4jXOThdP5jdM+81dlvz1JYmiQLIh3etTAZgHBxmeRKHEOw56Hiah9oEuvKV43Lewn4/OaGsfHE7Wt2NQd5t5ilZEFoEZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj95v0F4jEBZJBlEeYiyEY3/PdOwE+UuPuzRIxR02Zc=;
 b=X8lfrAE0ck3Vbtqix2uhsOZN8DbuFMl9D+lP1qetVLIJRdqV0w8OlLyh055ae1uLOzmJjhqAkL1OACC0iTQ8kv+rOciUX5ouNaKWpKHKul3LvxTeiY7LR0eP7y0PIGrw5MwV4jxsSnNJyguroGYd8TFxJTMTk1sOtXWT2ds0GzDYqLl9aV3pilumyye4ABO36ZmysFbb0IgLLhmpBqzQi9Zlh8ylzdt4rcIR+Gh1A1NEFomWJQCYhT1x342CGzNM/GtaBRhf78KpzYhLbi50rwi8PJUMY4Eu139LYCc71TQb4VJzfrjbY9gAkml3V/Qsog5tBdSvSWA7mLC/KJXcrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj95v0F4jEBZJBlEeYiyEY3/PdOwE+UuPuzRIxR02Zc=;
 b=BRX+Ix4CuzZRtyKVdE6aSo2SO4ugZPKlz+mSUXdw5dfeW8vPTbzKptYHgcbrpWF8MhPHwNS990DBzmijElioBcWUHB/X7PyzvIFcIES2YTleHBuSyu69/WOqc2v1CQiAMH6XsJcU1meew8OWKQ/86oUMT3lg+c9kgDCXBZ9X9Wk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/7] xen/arm: Wrap shared memory mapping code in one
 function
Thread-Topic: [PATCH 2/7] xen/arm: Wrap shared memory mapping code in one
 function
Thread-Index: AQHalVfkdpwTrVVpI0ikGFOyHt7ILLGKSvyAgAGXWoA=
Date: Tue, 7 May 2024 13:57:45 +0000
Message-ID: <E429579D-8698-4A92-BD9A-CCD686D1720B@arm.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-3-luca.fancellu@arm.com>
 <ef9b0a4d-134c-4eea-927d-5cce0b330aff@amd.com>
In-Reply-To: <ef9b0a4d-134c-4eea-927d-5cce0b330aff@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM9PR08MB6145:EE_|DU2PEPF00028D01:EE_|AS2PR08MB10055:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1fc7b6-0572-4485-155a-08dc6e9db319
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?eWpmZ2JrUmxuVWlZWlFjSGNJWWNFVmVDN0Z4S0Q4SStFWFpsMytFaGhXa0Fu?=
 =?utf-8?B?dC90bncvU05VNld2SFo0MEpuclBid0VxVHBxVUhLemNKY1o3ZGVZQ2ltYkpM?=
 =?utf-8?B?dnROWkF1ZWk0d0RPa2FvcFlwblFzN0l3SGF6ZnVCcldDbzltNWZYdHpkWjZB?=
 =?utf-8?B?d0VENzhpM1lYNGdOb2FKSEk4MTF4MjNLdDRnZlRodms5MzEvU0xyemlVTytW?=
 =?utf-8?B?MkRsdytjNU1MdGdMVU5EVUJ2UEs1QmV6VFRGTGl3RlRBS1k3U0JTekduVkFP?=
 =?utf-8?B?QlFvN2dwMjRZYU9SV0c5blB3R0dUS1h3ZWZSdUh0MTN4WS9TbXJhSGMra1BL?=
 =?utf-8?B?dmtzaUZqUGV4TlhIMWcyZEVTTk5hc0VOeUJ6czM2UTQvUjk0d2g1eTE4R21n?=
 =?utf-8?B?THBLcHRSMndEYVlGRVF6c01LQUY4VWZ1dTJUYTVuOG9hdlludy9zNDhIaWZs?=
 =?utf-8?B?bmIrR3ZpVU9TUWErWUNLczVZQkt0dklsNXpGcjBSZEJvZWlPYkpKNWpoR2hk?=
 =?utf-8?B?ZXF3TXczeHZMVnNYa1BJeGxDdUp0SDhDakdmeTExeDdaa0ptUDRhR3pSbFk2?=
 =?utf-8?B?Ymg2ZWsrZ3JIeC95eG9kYXVRYUZnWEdpN2FYb1VmWDNKb3VUL3dUVFJyWGZt?=
 =?utf-8?B?OGNWaDNsRk55NVpoanZOQkUzSnQveHA1YXZRZXhJM0x0c0c0TkY0SGdORnJv?=
 =?utf-8?B?ZHd3ZHJuMmlNRDlhYjVJS3BhZWJWcSs4MGJ5WEhXcDFqMDYzYUdPaDVQUGNs?=
 =?utf-8?B?RVVSWGpyQVZTZXV4YnBPRyswY0laU242V1IrdmZlMW5nVE1KaHF1SUt6YmRQ?=
 =?utf-8?B?R2d6RzRkYWY4TlpJaFQwSnJBZ3lubEZ0RmVFSG03VGRsRkN6aWtWWWFncGo2?=
 =?utf-8?B?eGRTRXhqeVMvVjdGRUh5cnF2TXVFdFp4WDF0MHBxL2kvZnBLQTVQMkFTR3Rl?=
 =?utf-8?B?VXA5Rk04Ui9QVUE3dzZsTmV6b0dIZ0JWNm9HNDBHMGpsNmVvajZyWDlqd0dm?=
 =?utf-8?B?cFd4NEVkdDB6T0RTd3hhaUY2VkoxVmlGWnYyMzl5dlRnRlMweEtRQUFvc0lM?=
 =?utf-8?B?RUEyNDFTbEFkRktkMXU4Z0RJOEZMVTgwRTk2UmRUU3VkRnArR2RpY3hjeWFL?=
 =?utf-8?B?ZEFSSXh5ZEM2cnNUeHRVRlN0R2lHL29XN0JWYXY1aERSRUhhUGJ2Q1U2ZXJH?=
 =?utf-8?B?Z0dJNGpLbk9zdnVBSWhGZGg1MXhUVVR5WE1QbXdWNzRPd2N6aWNRa0JZUE0x?=
 =?utf-8?B?NzJQcDVRZ1ZGZGRTUlM1SE9iQnBEUHdGSkZBSFloWWs1Rkd2SGxaOEYzNXZW?=
 =?utf-8?B?eDJaRlU2bVVpdGFoUDZKc0NOeVd6Q1ovRlRLUG1RTHY3Vkwva1NkQkVjR0kw?=
 =?utf-8?B?amF1QkRHcXNmWkF0RDgyVnVrL1FRcE5rcTJiRVJuLyswd25XN0Z2L3Mxb0VP?=
 =?utf-8?B?OEhYR01JdXU5T2VUL1daeW1tK0UzWmhObUQyV0dHVG8zelBkRDk5Q3gyMDYw?=
 =?utf-8?B?cGkwaTdacXhwV3VkOVFpVWZSbFhpSW9ublMydG1wNkFYL2Q3V0lVT3g5TUZt?=
 =?utf-8?B?NEQwbEUyTm56eU9mS1VkZmRrOVFBdXNSZW11SjNIMGlwdm5xcHlCTlpSTkpq?=
 =?utf-8?B?UTdlUW5RSlovZ29GUDJFRWQwWXdZSHFJYU01cWFmRGlGdWZYUDBEZkpDWWwz?=
 =?utf-8?B?b04vV2llY2d3NS94ekV6eVZUcWVRcEFwYmIzS3R0dUd1aElvN0daaXdodnBV?=
 =?utf-8?B?anp6TVlyNXVQNlZMRnVSclZkMUZoYlNHdFNOOW5oK0hjSkdkMXFRak12S3di?=
 =?utf-8?B?MGJGMWtGVWx4cjZINWdLdz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5904377BF04B848AF02081B4EF97252@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6145
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b52b9e2-9447-42aa-713c-08dc6e9dac46
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|35042699013|376005|82310400017|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWl0SmI2M0gyaVFLNDdTdnNwU1M5MjU2UXlaaExLRko0dUFvcmRUQ1ZZblpw?=
 =?utf-8?B?Q3dnRk1sR1Z1ZytabEV0OVp6UkdaRGp0QWtkVWhqNmh4dlFmVGl3M201L3Rq?=
 =?utf-8?B?U2U2OXRscmw5b3dVSElxSGNLOW1pK0psaFpySDU3RTdtNTk5Y2pPQUtDRUh4?=
 =?utf-8?B?Ty9EQ0JwZG9zdlZ5NGp6ZkQ5dkgyTE1oT3hOSnJIZjZldUttZVJCTHFPemVO?=
 =?utf-8?B?Ym0zbzdnZW4xSUZ2ZXFHU1EwV04wa05CUFRscU9ucy81ODNVanh1YmtvUllQ?=
 =?utf-8?B?VXd6b3Rib1krUEQ0UXJObk5mUzlQazBSaUF4MkVSRjRYU2I5R3RUSm9IQS9K?=
 =?utf-8?B?T1NBeE0xWVRiNWNIN2RzaGowUUhERGc3ZGoxV3BNclJ1NzlJcEVkcXJSSXpD?=
 =?utf-8?B?T0Z6eWZ2bkt5STdZUU1tVDF5NVMvSnFGSjhTL0dDMkE2Zm9OdWVxZXc2M2h6?=
 =?utf-8?B?QTMzdSsxSmFqd0VHUWVsZi9DMzFYYklEV01NRUxSYWNTbWpUcDFLOHBxa1pv?=
 =?utf-8?B?QkZrS1F5Y2Zjd0l3bDAxelc5RUpOU2F1SW5FbHROVXkvZTdZU3JpWmVEMWZV?=
 =?utf-8?B?c0lkS1V4UGExaXd1S1lLaGlhcW56ZmpxNnozZTZDWjFnTlU2MzU3b29XSXhJ?=
 =?utf-8?B?REpWeWREM0c2akJLOGpoZ1UyRXRObmlyV0N1a3lLU0MyVTJ3eE56MmlnU1Bw?=
 =?utf-8?B?SGViVU1jd253Z0lxZjlEV3A1aC9wejVlenJEejZCN0JDUm5nZHRKazZxdkRx?=
 =?utf-8?B?REk2VC8zQS83TE5ZQ05pYWFWNzdRUllQVkkxNXJaNmdJSXZQNHAycFdIZXRX?=
 =?utf-8?B?YWRoNTBUblVlcTBSWmtJZVFiVUttalJ5c0JSTTFKY2ZZTktmeWFqdWcra2xU?=
 =?utf-8?B?Wlk0QzhLZWhZSzUxS01Lc3ByVFRKb3ZrUmxJVlBoUmkxMHFzdlhMdzYvQ2Fq?=
 =?utf-8?B?dHhkQmZYUUpUM3ZxZ0hRNThIZ0NSWjhQeFhpTVBaallCZGN3ZVk5MkRlREJs?=
 =?utf-8?B?TUdjTEkvZHlsMVY5MUQ3K0ZiT0ZQSXZockFxUnFRWjFYQVdpc2duSStIelB4?=
 =?utf-8?B?Z202U0F5VmVPcnhLU1ZkV3NYd1RvZ0h1aFd6SXp0Wk14V2lMelN0b1ZyWkJE?=
 =?utf-8?B?UkgwT3dQLzYyK3kzeFBuTmpFZ2orTDFRN1kxWGV4Z1FBbzU2eklWTkY1UTc4?=
 =?utf-8?B?OEY1R2JQU0dqMjJUZjY1NWJyakNLNWJpZGdBNEVVQ0R0cVRZaFI5ZkdTKzlp?=
 =?utf-8?B?dEV1cjJONUdmNHFBUmZ4V0tUU20xTWdzaU56bCtqRWZSNWdjb045S2gyUGlY?=
 =?utf-8?B?U1FPNnIvN0ZQSjdvRUR1QnIvcEJzb29raHdQOFhyZllnSXNXTVFuSUZvNERw?=
 =?utf-8?B?VmZ0NGptSnRmSitDa2dxRGNGYlpxYVBaZXVOMWNIVGpNQlJPZnhaWUt1RnZI?=
 =?utf-8?B?dEx2dG5yeVEvZWhSYmhNTnpvWnE1Q09BaGEzYnR0L0tPaTZ6elBpMlZJTGlj?=
 =?utf-8?B?cml4SDF4VDlCejZaZzMybzVxeHVQLysvSy9KYjNZd050cFE0MjNvSVJWamxO?=
 =?utf-8?B?YkVzOE42eUliMXdCeVdOVm5ReGhkWkg0NHE2elh1Z0diMm5wT2ZHWlBTb0w2?=
 =?utf-8?B?OHU1eXZ6ZitCL3RXSVpvVmlyd3BWOFIrTE9hZ2pVcTM4OFFlbi9QSXFJeEsv?=
 =?utf-8?B?SDdYVzF6S2pxUFU4dnIvcWp4SFFDZ2xzK25ydm9UdXFyQUFNazQxK1ZCSmd4?=
 =?utf-8?B?MkV6UmI1ZERCUDFwbGJhTnluS3IrV1NUcW0wRnpGMVpDUkFHVWswTWdWOFRq?=
 =?utf-8?Q?hGoL+y/YvvsA4nXXeQKTBd996rcN9B2D+t2LY=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699013)(376005)(82310400017)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 13:57:57.3454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1fc7b6-0572-4485-155a-08dc6e9db319
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055

SGkgTWljaGFsLA0KDQo+PiANCj4+ICtzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfc2hhcmVkX21l
bV9iYW5rKHN0cnVjdCBkb21haW4gKmQsIHBhZGRyX3QgZ2Jhc2UsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIG93bmVyX2RvbV9pbywNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKnJvbGVfc3Ry
LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3Ry
dWN0IG1lbWJhbmsgKnNobV9iYW5rKQ0KPj4gK3sNCj4+ICsgICAgcGFkZHJfdCBwYmFzZSwgcHNp
emU7DQo+PiArICAgIGludCByZXQ7DQo+PiArDQo+PiArICAgIEJVR19PTighc2htX2JhbmspOw0K
PiBub3QgbmVlZGVkDQo+IA0KPj4gKw0KPj4gKyAgICBwYmFzZSA9IHNobV9iYW5rLT5zdGFydDsN
Cj4+ICsgICAgcHNpemUgPSBzaG1fYmFuay0+c2l6ZTsNCj4gcGxlYXNlIGFkZCBlbXB0eSBsaW5l
IGhlcmUNCg0KV2lsbCBkbw0KPj4gDQo+PiBpbnQgX19pbml0IHByb2Nlc3Nfc2htKHN0cnVjdCBk
b21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbm9kZSkNCj4+IHsNCj4+IEBAIC0y
NDksMzIgKzI5MCwxMCBAQCBpbnQgX19pbml0IHByb2Nlc3Nfc2htKHN0cnVjdCBkb21haW4gKmQs
IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+PiAgICAgICAgIGlmICggZHRfcHJvcGVydHlf
cmVhZF9zdHJpbmcoc2htX25vZGUsICJyb2xlIiwgJnJvbGVfc3RyKSA9PSAwICkNCj4+ICAgICAg
ICAgICAgIG93bmVyX2RvbV9pbyA9IGZhbHNlOw0KPiBMb29raW5nIGF0IG93bmVyX2RvbV9pbywg
d2h5IGRvbid0IHlvdSBtb3ZlIHBhcnNpbmcgcm9sZSBhbmQgc2V0dGluZyBvd25lcl9kb21faW8g
YWNjb3JkaW5nbHkgdG8gaGFuZGxlX3NoYXJlZF9tZW1fYmFuaygpPw0KDQpJIHRoaW5rIEkgd2Fu
dGVkIHRvIGtlZXAgYWxsIGR0XyogZnVuY3Rpb25zIG9uIHRoZSBzYW1lIGxldmVsIGluc2lkZSBw
cm9jZXNzX3NobSwgb3RoZXJ3aXNlIHllcywgSSBjb3VsZA0KcGFzcyBkb3duIHNobV9ub2RlIGFu
ZCBkbyB0aGUgcmVhZGluZyBvZiByb2xlX3N0ciBpbiBoYW5kbGVfc2hhcmVkX21lbV9iYW5rLCBv
ciBJIGNvdWxkIGRlcml2ZQ0Kb3duZXJfZG9tX2lvIGZyb20gcm9sZV9zdHIgYmVpbmcgcGFzc2Vk
IG9yIG5vdCwgc29tZXRoaW5nIGxpa2U6DQoNCnJvbGVfc3RyID0gTlVMTDsNCmR0X3Byb3BlcnR5
X3JlYWRfc3RyaW5nKHNobV9ub2RlLCAicm9sZSIsICZyb2xlX3N0cikNCg0KW2luc2lkZSBoYW5k
bGVfc2hhcmVkX21lbV9iYW5rXToNCklmICggcm9sZV9zdHIgKQ0KICAgIG93bmVyX2RvbV9pbyA9
IGZhbHNlOw0KDQpBbmQgcGFzcyBvbmx5IHJvbGVfc3RyIHRvIGhhbmRsZV9zaGFyZWRfbWVtX2Jh
bmsuDQoNCklzIHRoaXMgY29tbWVudCB0byByZWR1Y2UgdGhlIG51bWJlciBvZiBwYXJhbWV0ZXJz
IHBhc3NlZD8gSSBndWVzcyBpdOKAmXMgbm90IGZvciB3aGVyZSB3ZSBjYWxsDQpkdF9wcm9wZXJ0
eV9yZWFkX3N0cmluZyBpc27igJl0IGl0Pw0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

