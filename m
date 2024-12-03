Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3E19E1939
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 11:27:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847876.1262921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQ7k-0001Zd-Gv; Tue, 03 Dec 2024 10:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847876.1262921; Tue, 03 Dec 2024 10:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQ7k-0001Xy-D2; Tue, 03 Dec 2024 10:27:20 +0000
Received: by outflank-mailman (input) for mailman id 847876;
 Tue, 03 Dec 2024 10:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaGl=S4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tIQ7j-0001Xl-7M
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 10:27:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2613::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b484b63-b161-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 11:27:17 +0100 (CET)
Received: from AM0PR04CA0066.eurprd04.prod.outlook.com (2603:10a6:208:1::43)
 by DU0PR08MB7740.eurprd08.prod.outlook.com (2603:10a6:10:3bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Tue, 3 Dec
 2024 10:27:11 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:208:1:cafe::4c) by AM0PR04CA0066.outlook.office365.com
 (2603:10a6:208:1::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 10:27:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 10:27:11 +0000
Received: ("Tessian outbound 5b75617ec243:v514");
 Tue, 03 Dec 2024 10:27:11 +0000
Received: from Lda6a7b59695f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AA03A824-059A-454E-85D0-20A45B86EA7C.1; 
 Tue, 03 Dec 2024 10:26:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lda6a7b59695f.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Dec 2024 10:26:59 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAXPR08MB6703.eurprd08.prod.outlook.com (2603:10a6:102:138::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Tue, 3 Dec
 2024 10:26:56 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 10:26:56 +0000
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
X-Inumbo-ID: 2b484b63-b161-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=urmZ2jO+jYWCI0vX0JuRa5xlO48tXlHjrGInW4CVWd+QTNaPqkNuz8vNMIeeaxlCSvqa1DUdtkNS5cYPg5OedeHV4srVOmFCK9Yz2LbqSzUocaUc1RnVErP76xDRcNL4mJeqWidzoJQ4JnkjGw1LmVlHeC0icdQG4HCKSRP6urEVZlVwpBFq6or75QIpMoo5pPWpvdg2zOmPSCAcQ2IJqvoH7ItQzzpM+F/ZX5sWEuV9t2V8p0m05Ex/gFT2qoZjPg3Qs9DIOUML6aJzhXxi2AbCbQ5Z+vHbf8ZIZrvHlDyR6MZ36CCHmMd1ue/Y1hg6kJSU+4JWSf1Xbz7dYwMF2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CB/1zE4sssgW4K4RAwcWrfF175IqUSsEX0VuPOdf5o=;
 b=M5mh+ihrGYhEoxibbASbS4TOMm9ylXByURgC1+rYOo9ei4dv7t2fZZiDMcJZUn+ffv10ADq7bv1aB2Jm5gK3U2wyvPE6xBUFkcUfbc61rKl3DUBPpgXXUxkKg9rKVwlkAARsCLe4a0Qv7LuUcSi1uz3cxyhxIqe7BE5i4JcfRPpDQ/lGHv+8Hyp449VUEkxBV60i0BSmmbBe6QEuaKE6T6//yQ4MMA3FJtY7uecgrOeoOPEzfHT5sMcD4kHUow7pvZZTk3zxKKzppX764JODGYFYmprjTAhju32yDEpUt4eLM6DhFOleW2nhwZgrx+uJSqgQT4798ZHFDne5DxcWaA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CB/1zE4sssgW4K4RAwcWrfF175IqUSsEX0VuPOdf5o=;
 b=T2OPCMgdYqhTFQVSC4FaUO9hNWzUvi29nzm7DOJPRp+BsSaLmMN+nL9nNSgN3cegqLx6YEGUl+lTTjp/WEjV4gzhQdzoWknfYiS76K2zp0Nug+4EVn9pIG9R7/lLVxm7yNm3j/yPMPP5ozIbKppxBFGWxzMewMmH8iGShqgLyxQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f195fc99f087e75c
X-TessianGatewayMetadata: JmkbBzTWxWj72fUsSzYPbATjdL41XE6eO7yw1XXI+ZF1VB/34g1y7b17dHhZpDrLoTP9u9EoWWD0c4S6qQskGp8vcMfsyudaihqfgYpmY1Z62NHXgXDv5lvPDOjmxoeu6TXP0X4CHpZ/j7vw1uOQ3rUh2Hch8YaiURjpkHI5kqI=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VolOVbnvtTQF0a2F5UOsJcVci+2nsL603VoUrtz5FTUO60zwb3iR3Yg+EmC+81quePjilbiMaeBvR7XHH3KdKzGTqCtkCf+bAmg3uQ/vAwgBQnOm0OmrkPBpUFE0tYSJofWLDeTPcE03sXyx1XELvI0DfHJ9r0LDqzlnEXqabV0JcMn575NWgj55f6VHnxLEYZHxG43iJbOqmQF0MMlEvwhaMvuezmiJHNmqLSLJfAqPhMrUOBwCKpLsN6GHzZNMxla8KC8sjB44LD6L89VhPjEFmLTWS8Mb+ae/8+lutUTHFjegu6NkEk4tr8i0BL4u+4UosZvOzdYD3oTBCzU2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CB/1zE4sssgW4K4RAwcWrfF175IqUSsEX0VuPOdf5o=;
 b=NC3KRuy5zc3iWksG0roTIzyumq5QpT7z/4JVQ91gm3Z1cuq/6MJjyVh9ouHXhs+q2wgjZU5qukEK2rboddrS9ahzZ0TEGUmipx7qOwB7KiH1xWPgr7ECzIU9n+NK4rSPNImwouxkrmKPzC+vPdcsK69AkRaPE8NIY8eavysR1wExJr18xvnFra2VuCshWg1mreZIXexskzM+uSNdW5wIzjZGuVDVQ8TSrv5i4Ar+X86qi214wy7IamSfqtz1lakJXNvYt/YrEd8BZSCNvz6pduQr9zNgA9fjXQZNsqwXab7JMUiRsmLb8WBMw6Wr7aLp9Z/ksiZ8XZq6H5bCyhTkow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CB/1zE4sssgW4K4RAwcWrfF175IqUSsEX0VuPOdf5o=;
 b=T2OPCMgdYqhTFQVSC4FaUO9hNWzUvi29nzm7DOJPRp+BsSaLmMN+nL9nNSgN3cegqLx6YEGUl+lTTjp/WEjV4gzhQdzoWknfYiS76K2zp0Nug+4EVn9pIG9R7/lLVxm7yNm3j/yPMPP5ozIbKppxBFGWxzMewMmH8iGShqgLyxQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] xen/mpu: Map early uart when earlyprintk on
Thread-Topic: [PATCH v2 1/2] xen/mpu: Map early uart when earlyprintk on
Thread-Index: AQHbRWz5mao3stJzR02TMW5lND/1eLLUUMKA
Date: Tue, 3 Dec 2024 10:26:56 +0000
Message-ID: <88BFD6BF-A7EF-49D6-B817-2737FB28F28D@arm.com>
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
	DBAPR08MB5798:EE_|PAXPR08MB6703:EE_|AMS0EPF000001A3:EE_|DU0PR08MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: ee693a66-ec35-48e1-8c8b-08dd13850c4b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?eTZyWk5wRytEMUZyVkRoeEhySHJveVJmMi9MRDl0UkpZNWx1Q0FLZ2VIVXVr?=
 =?utf-8?B?K29pazFZc05wYUhsUWd6ZmxmM25JTE51OXp4UU13MDJNczkxN1AwR2kyVStR?=
 =?utf-8?B?QTdURG9sanJISGxkTnlUVkIzUE55S3dWNkNRcDladFg1Snc2TVZFVnJzejF6?=
 =?utf-8?B?b2ltdGJNU3NSb3M5WWJEZ0p5dWJZM3NoNVIwL2JWcEJKa3ZqV3M2K29sU1lE?=
 =?utf-8?B?OTk4U1dRV0EwZGZWQ1ZFS1UwallCeTN3ZUlHZUdBWjZZbmlPWS9CVUJNS3pV?=
 =?utf-8?B?cENxMjdHOVZnK2VUTlNQUm1HaXN2ZGk4SlNYeHlob3NJVnZHOTV6UDd5VjdF?=
 =?utf-8?B?YkpMamhWQVRhdVMvS2xXQ2UrdzhzVnBqVFcwdGtFUGNkQm1NeUdBWUVmRWVF?=
 =?utf-8?B?a2RETThjOUM1My9RdlIzcmVweThnT1lsSTB1bnRjemIxSnBVZWNIMi9CUzR5?=
 =?utf-8?B?WkF4eGQ4V0pWMUJzZUx5Zk50bnhrbzROemhxcHUzbXJjVHRpRnR3NmYxamZw?=
 =?utf-8?B?T21MZnpEcnlVcDBqeXAwQmlocU5wSVlUSzZmMEtkVUVhL1pBOGFVcGJNMldn?=
 =?utf-8?B?OEdOS3JLSE5RWG1WUXJTcW1CQ2I2bURUOEd2enhMYmhuWHBKcUo2d3p4QXZI?=
 =?utf-8?B?dVkwek5jU1Fza3lUN2JkL0xqTVpLSy9jby9aL1ZDRkZiM29RQmFTeElWT2xl?=
 =?utf-8?B?eGJUQURqY1B5enNLYXZ5Zy9lbytLM0haVlpGM0c1QzhZUG13ZmlSbEpoUlkw?=
 =?utf-8?B?YjRIaDcybWtXWVU5VUhJcnQyMTBNSll2YlFiN3kraUcvcnRZeWZhSmRIUFo2?=
 =?utf-8?B?V1JpQnBhbFpjODNhRjFJdkFCQnpFa3ZpbFBTbURtaDErb3A1Y0Nnak1LeXhs?=
 =?utf-8?B?d295MzduZ3lrS1lHbk1mLy84RlRIMVZOdHJtdVFMczFPTURVSm0yQ3BRM1JT?=
 =?utf-8?B?ckZmZkxZVWdudFNpNTA2WGRWeC91UmdXenFaSHRhU3JRRzNmQzJER2xoKzZC?=
 =?utf-8?B?VnVnRGlid1kzTnRTMmVWNGpNTFc5OGVKbE5yMWdvWDJtTklxaGQ1aCtVeWt5?=
 =?utf-8?B?M3RVakRLUU5CYlFFVEJWMyt2VmlWWTFWc05PM0hqYjFSazRydUdWTEpTL2Vr?=
 =?utf-8?B?WmJ3a1dmZlhpeTJiTnh2REhEQnJHTzFOeFhmRzhHMURMNTNQZ05Bejg2eVYy?=
 =?utf-8?B?UnBpQkd1aERCN0NwVXNRZTJpcms5NVQrTDltQVM0QWU2dSszVVhESFYxbWFX?=
 =?utf-8?B?QUFZUlhOTXpDQWpBdEE5OGoxWktncEtBeEF0YlFwdStWNGFaa1VZOUdIWUdy?=
 =?utf-8?B?d0xNcGZIWlczcHpQTWhRNURxMEFkRnd4RW4rbDRsSkRFTlV6VXl0TnVua1o1?=
 =?utf-8?B?dy9lelpKOU41NUZWcUhRZlBoeWRCdnpnaTVac2ZaOTUvTmZIdmhIOVBubWZk?=
 =?utf-8?B?RDZTWEh3dFIzOSt4L0c4TmNidEdITGtFVEVoSW1BRHdaOVZYVStVRTBSMitK?=
 =?utf-8?B?Z0lTaW1ZcDRvVTJMcUx2MUxXUlBQVkZtdDFHcnR4bEZSRW91RmJQcnhWYVk4?=
 =?utf-8?B?aThzVmtIa3BCZ1FsRSsxV3Njc3o4Y1NBd2JqYmZ6UU9pcDI2cFk0ZEhCS0lP?=
 =?utf-8?B?VlphQWxJT3BkUmlWQ3U3UTE1akZZUk0wUy8xdlhMUUZvcXl0Y1pNVXROeklS?=
 =?utf-8?B?aVpGUFY3TFhkUlZhODhER0pET1gwa2Z1eG9SaTlrT1E3bUFNRnlIMHFtNHEx?=
 =?utf-8?B?RXJveW0rQzJoK05pTlVGcEsybzJDZGtRVEdRcnhOMVArTStNeWRwZXlhSlpP?=
 =?utf-8?B?OU9MeUkwSVFLaVhZc1VabTRSekdHamVtejBRS01wakZRVE9ZcWJSN01vckc5?=
 =?utf-8?B?QVZRd28vWUZGSmdsT1JLR0M3ZHJXUjRwZ2dqTktsWCtPTGc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C779D2DF51F25A4D861B47ED6F8D93F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6703
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88d49e39-2008-48a8-416b-08dd1385032c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWlzZmVRNk5tbE1JVTZWaW14azRuenY0V3ZFcG5BTTA1ZWUzYWs4SmI2bDVC?=
 =?utf-8?B?NmtpVWxXdjN6SEVVdVNTR1FpSG9SWnZrRFJnRHVxSFh0SUtVTk5yTnBnWStq?=
 =?utf-8?B?QjQzSGVtUWU4VjQvVHFoOG14cER2NEllM2xtc21GRlc2VDZFbVZMSmxxOVAw?=
 =?utf-8?B?WWFTWHRsN2x6SUNsOGxGcUJpRmFobythRWlSQlowMWpOS3ZaaXY4cWh2eFFQ?=
 =?utf-8?B?aGtsOUVxa2luRWpoNG5Dalh2VTlXZms4QnJSSi90K1IzY29WeE9oaDFOZXYr?=
 =?utf-8?B?MXoxb1k2UDdSa3BRUUpQN0ZEQm9CWEVYSVphekdWYXNzdWRBU3lrbFVheVln?=
 =?utf-8?B?cGEzYTNJUVRCdFd4Y1RKeHRLVXpXNW8xS3B1L2F2U3pCbE1XQzF3MzRaWS9Q?=
 =?utf-8?B?SFIwNTdwbm55WEltTFB0NVdaUnZWWnFvT2tEUGRVY1BmalJmR0RHNzQwdEVM?=
 =?utf-8?B?YVFFNEJHakk0QzN0eWtaVGM2Mmx5cWpYbWc1LzMvQnZjY3lJOU1STjByc2Zl?=
 =?utf-8?B?ZENMUXlZbU5qZGVxamR3dXhQcHFlb1lsK3R4amlFcktycGp3WjR5azI2NXND?=
 =?utf-8?B?ZUNncVBoL05BKzB4OVEyVU5YSUlxbGhvc0I1KzRkdWhkUkZpL2FEMkI4MTAy?=
 =?utf-8?B?ZG00MjFjMmczUE1rdno5bmpsZjBLYktxSDVhbDZvNzJ6UktCZ2pTYzNFR3JE?=
 =?utf-8?B?UkwzYTN4emJqVUpndy82akcyOVhjeFZXWWh1QVNsc0JRTWlza3pGRDVwSThp?=
 =?utf-8?B?NzNkMmdsY2VRdGtlODRGVy9wcmh1cDVGcTRuUzQ1WHhxVGo4Z2taOGVMN1ly?=
 =?utf-8?B?NU1QUkdCZFA2TFZyUnV5eEt6Qlk1d2JORVZDZmRtcm4zRUJ4UnUwVWtwbXl3?=
 =?utf-8?B?ZkxOaE1OYWJOMmFzbEVZd0xhTktYRkxRUnZEcVNyRFVWUGxtSjEwby9XU20z?=
 =?utf-8?B?RXhIUXFwYjBlUS9EV3p2cER3K1VLOTdkRXJRUTV6QmJjdTQ4S0crTmlTZDlN?=
 =?utf-8?B?cWc1bThrWXl2MlVoSDdzcFFDWlR1QUc2ck9LV3lsU2cxU3lkLzVLRFFHQW11?=
 =?utf-8?B?NUQ0Y3cvYk5MZlB2OEMxZU5uNEtwQmMzK1cwbHlsa0x6NzNjcEpHU20yV203?=
 =?utf-8?B?eFg0QXd4Vm1lMlRoVzdCdG9haTdKcnhnYWpEL0U5T0haNldpSjJsRGJJY3o2?=
 =?utf-8?B?d1RPRGR4dEVUSm5yZTdPYm5qQWtINGQ5bERmTFlucXdubHFoVlFFTXJ4NDZH?=
 =?utf-8?B?Q3V0NUxDcVFseko5NFNDMUN4VkR4L0NuQTVMOHMzdTZaOVlqL2JabWJ5Zjd6?=
 =?utf-8?B?WjBoOEkxZkFBbFc2WDM3Zmw3KzkvU1VGRVdrUGhQL2RlZUJNR1huOWdjNC9m?=
 =?utf-8?B?U3BNWTk0WEJpU3F2QnZFQ0RXcXNya3M1bXJzcVZkUGpwOHZYY0hpbVk4dHor?=
 =?utf-8?B?OTc1czQyakZSZkhFTnUvTHRWRzYrNC95d2g5d2R6aWVVSXloUnRGbVJ1aUNX?=
 =?utf-8?B?R2ErZDc0V01hbDVMMm4wUzFWV2d5OWJlQjFnSEo4elcvMmN2Qkd4VnZuQmNl?=
 =?utf-8?B?UUR2Q0JvdjR2d09CaHU4YmgrZjNWRTk1dzNteWNQb285ZHN1YmJCNnNiL3hj?=
 =?utf-8?B?RlJoSVV0a2NldTNvOHpta1hIZUlwNGRQdDduVzB2cHE0UkxlQU5lSGhkS3VP?=
 =?utf-8?B?ZHY3YVVrTElEbEFJZ042Tm8yRlVudzlPenFHRlF2SVZFMW9qQmorbDdjL2Zy?=
 =?utf-8?B?SzhCRitYMEdaZUJMUmVycGwzN1FvTjZxTGZHYllXQ1hQdkRmN1J0SDdGQ21H?=
 =?utf-8?B?ZmUrd3ZKaDZZYTlTMk1UalR4ak1sa0NHUFkvSm51T3hjZEtiRFREOW5LS2U5?=
 =?utf-8?B?OHlTKzR5MjVNN1cyNlphOS9DeUlIM29iayt2TytsbWxQeW5GMXRRUGo2bHdv?=
 =?utf-8?Q?cQ6JTyr4a1zu76oCzrO+YsNhG3QTqKLR?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 10:27:11.3865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee693a66-ec35-48e1-8c8b-08dd13850c4b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7740

SGkgQXlhbiwNCg0Kc29ycnkgSSd2ZSBqdXN0IHNwb3R0ZWQgc29tZSBpc3N1ZXMgd2hpbGUgY29t
cGlsaW5nDQoNCg0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Vhcmx5
X3ByaW50ay5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Vhcmx5X3ByaW50ay5oDQo+IGlu
ZGV4IDQ2YTVlNTYyZGQuLjYwNmFhZWRkNmUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9lYXJseV9wcmludGsuaA0KPiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vZWFybHlfcHJpbnRrLmgNCj4gQEAgLTE1LDYgKzE1LDI5IEBADQoNCnlvdSBuZWVkIHRvIGlu
Y2x1ZGUNCg0KI2luY2x1ZGUgPGFzbS9hcm02NC9tcHUuaD4NCg0KaW4gb3JkZXIgdG8gc2VlIE1Q
VV9SRUdJT05fQUxJR04gd2hpY2ggb3RoZXJ3aXNlIHdpbGwgYmUgemVybyBmb3IgdGhlIHByZXBy
b2Nlc3Nvcg0KDQo+IA0KPiAjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USw0KPiANCj4gKyNpZiBk
ZWZpbmVkKENPTkZJR19NUFUpDQo+ICsNCj4gKy8qDQo+ICsgKiBGb3IgTVBVIHN5c3RlbXMsIHRo
ZXJlIGlzIG5vIFZNU0Egc3VwcG9ydCBpbiBFTDIsIHNvIHdlIHVzZSBWQSA9PSBQQQ0KPiArICog
Zm9yIEVBUkxZX1VBUlRfVklSVFVBTF9BRERSRVNTLg0KPiArICovDQo+ICsjZGVmaW5lIEVBUkxZ
X1VBUlRfVklSVFVBTF9BRERSRVNTIENPTkZJR19FQVJMWV9VQVJUX0JBU0VfQUREUkVTUw0KPiAr
DQo+ICsvKg0KPiArICogVXNlci1kZWZpbmVkIEVBUkxZX1VBUlRfQkFTRV9BRERSRVNTIGFuZCBF
QVJMWV9VQVJUX1NJWkUgbXVzdCBiZSBhbGlnbmVkIHRvDQo+ICsgKiBtaW5pbXVtIHNpemUgb2Yg
TVBVIHJlZ2lvbi4NCj4gKyAqLw0KPiArDQo+ICsjaWYgKEVBUkxZX1VBUlRfQkFTRV9BRERSRVNT
ICUgTVBVX1JFR0lPTl9BTElHTikgIT0gMA0KICAgICAgICAgICBe4oCUIFRoaXMgbmVlZHMgdG8g
YmUgQ09ORklHXyoNCg0KDQo+ICsjZXJyb3IgIkVBUkxZX1VBUlRfQkFTRV9BRERSRVNTIG11c3Qg
YmUgYWxpZ25lZCB0byBtaW5pbXVtIE1QVSByZWdpb24gc2l6ZSINCj4gKyNlbmRpZg0KPiArDQo+
ICsjaWYgKEVBUkxZX1VBUlRfU0laRSAlIE1QVV9SRUdJT05fQUxJR04pICE9IDANCiAgICAgICAg
ICAgXuKAlCBUaGlzIG5lZWRzIHRvIGJlIENPTkZJR18qDQoNCg0KT25jZSB0aGVzZSBhcmUgYWRk
cmVzc2VkIGFuZCB0YWtpbmcgY2FyZSBhbHNvIG9mIEp1bGllbidzIGNvbW1lbnQ6DQoNClJldmll
d2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20gPG1haWx0bzpsdWNh
LmZhbmNlbGx1QGFybS5jb20+Pg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

