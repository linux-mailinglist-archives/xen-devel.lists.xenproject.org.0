Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F0562BBF3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 12:29:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444263.699281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovGbE-0003mH-A7; Wed, 16 Nov 2022 11:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444263.699281; Wed, 16 Nov 2022 11:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovGbE-0003jf-7I; Wed, 16 Nov 2022 11:29:00 +0000
Received: by outflank-mailman (input) for mailman id 444263;
 Wed, 16 Nov 2022 11:28:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Po/4=3Q=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ovGbD-0003jZ-4e
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 11:28:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc1db4f7-65a1-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 12:28:57 +0100 (CET)
Received: from FR3P281CA0198.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a5::20)
 by GV2PR08MB8319.eurprd08.prod.outlook.com (2603:10a6:150:b5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Wed, 16 Nov
 2022 11:28:54 +0000
Received: from VI1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a5:cafe::56) by FR3P281CA0198.outlook.office365.com
 (2603:10a6:d10:a5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Wed, 16 Nov 2022 11:28:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT031.mail.protection.outlook.com (100.127.144.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 16 Nov 2022 11:28:54 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Wed, 16 Nov 2022 11:28:53 +0000
Received: from fd6b90dfea7d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D0496274-C3AD-46B6-B7B1-6032BC9B673D.1; 
 Wed, 16 Nov 2022 11:28:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd6b90dfea7d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Nov 2022 11:28:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6333.eurprd08.prod.outlook.com (2603:10a6:102:15b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.8; Wed, 16 Nov
 2022 11:28:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%7]) with mapi id 15.20.5834.007; Wed, 16 Nov 2022
 11:28:45 +0000
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
X-Inumbo-ID: dc1db4f7-65a1-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qbm9MgyO+1iy9mSZzdDFuFTFGBBD4tlpyWTfCKXxgNQ=;
 b=d0GzbecN/CNHHsv/fQY6u3D0ZClWxIePwbg3jFH5B0QBaoFAsqMx6cW7VXgw3dOtLBkOTL4JQiseOK7YIdoz2+LWW16uybMeyY1Sgizt1Rbz7fT0ZYEc7gsUW8WpaIlAJ4yQ5vgjRVPUnZjQg6vCLKZI23ksYqjew9zN9/O1kkI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ai2fB9zuLBCEX2kMOpyN15QgtoY+IuNOa4gbGI1g6O6hrWdG9+QbEDRFicwjWNlHBYGVeztWr7Mqgy5HwVQbUN21QvvHOpIfsWwlbd0plgIABcsC46Nmeat+pKilVEWOyQ/kHPD6rGNSQpDsqpUlSrlt72Yyht6hehL5zu2QndiOT0hXJfWfR3ZHFxeW37/LKLLiH2dmkOG5xwaJbMlTl/VMLcuw8bDfTuby6NB7f3+UnXU1C8SHJqCchSLLS/EXYrrjJavGiNyVflL8/9uT5Kgk3YHfC8fW1XKajJ17PjfcjA2oqeod7RDxjUG9ijQqUioMKzbK+nkYRaoWWYaeMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qbm9MgyO+1iy9mSZzdDFuFTFGBBD4tlpyWTfCKXxgNQ=;
 b=blpEB8hNEIFge2GYOOUq5vdAr2KwuKEXbRwVYHgkKVaoxAwhZZ3MdpTUG9joV/YJGBYEgZa0WLjWFJBL8RVLf4ffe1EoM75uzjL/w/1iKx+snO/Jre3FR/I3vn5OQ8kiSu1v6y1QD8lnyAQTipY7XWi7M6RCA/liVv/X+UPxZNbt3my34UYaqjtu8e2L6o3Z7pHE74IoI2RJ9IFsKR8f5eRwlpnl0eh3aLA2rS5i3UZSE8qiVvWXtNmusOXb7V/PgSwETA/y6fXrk4AKbsk106ADVapFjjGv5tIbLrNlxiuIj37LzlJTLd2zv1hvLLiOAoAYKopkrc2+7msFfo4M3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qbm9MgyO+1iy9mSZzdDFuFTFGBBD4tlpyWTfCKXxgNQ=;
 b=d0GzbecN/CNHHsv/fQY6u3D0ZClWxIePwbg3jFH5B0QBaoFAsqMx6cW7VXgw3dOtLBkOTL4JQiseOK7YIdoz2+LWW16uybMeyY1Sgizt1Rbz7fT0ZYEc7gsUW8WpaIlAJ4yQ5vgjRVPUnZjQg6vCLKZI23ksYqjew9zN9/O1kkI=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH for-4.17] x86/spec-ctrl: Fill in whitepaper URL
Thread-Topic: [PATCH for-4.17] x86/spec-ctrl: Fill in whitepaper URL
Thread-Index: AQHY+HJMoGDeJbhqNEaV7yqbAICZiK4/pLgAgAHGmUA=
Date: Wed, 16 Nov 2022 11:28:45 +0000
Message-ID:
 <AS8PR08MB799192FCA6B9D5B09BB6862392079@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221114214358.17611-1-andrew.cooper3@citrix.com>
 <780da682-806e-6ada-eadb-018579d0e808@suse.com>
In-Reply-To: <780da682-806e-6ada-eadb-018579d0e808@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 596C5BE9EEB1854395198CC428E9C209.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB6333:EE_|VI1EUR03FT031:EE_|GV2PR08MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: 55314d24-a645-4181-f3b5-08dac7c5be53
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XicCHzbOLLyHECu44R8K8QBXhERoBvIGtGZk/VALN67e78QRdAm3nqr8YVl/kpZtIX4pGZ8frfSaFd3BKd8hr2G62N7u+20pCf9kF9exxEg5xG3oWQQ+dtCiQlXmL0Ssbs5Ogn3OUwmrzjqjhk78cLXElzet3B/cztYtidNhUgrVmnyiZTk2df76S0Gp3BBu52l3X6eySIMULwp5DCl5JrYTQ2YZdFhjOOGkX6sWBha7iBZ16SDlR10ggbVStoCXe5a6Dk3my1YAZTodeF9TAhaOZEphnsHbQqIwwQ2bAEZ4rX1tZaWcFPfOKATaU5waNRh8QO3CucnpvP5qLMR/pBIRwQG7kS5tIz+/KLm0MFKXwxXylXeapfQqxCAHxLMGBGX//Cz3zdlocxMvViBdwfS11Ba9Sjp1JeuMc6JGBQfsbtMrT26Atao/pW1Tp1BBluGQwAcxCj8ee9uuHWirhkX7biRZfgJZw0JYqxcVv0QEY6iCqPlLo/niWwhORBHknVzXzPZjCO/x/SdgpjDXOiU7t4VTnEBdK3vyny0DUwWViLqK+r8V0ZRyZfFKepmTbKSNgzw/0DiKtMQ8rArkQk8RditmzNAjoHk5+7wUq7kX1fuk3xFKL5wbJm+JJVto/wdKfj7zep9MxyZ1I0YLOk27t/A27rH9XjsEUBrD2bFp/eIUZWZrBwTc+aqvj7JYYXg32ZKvvIWkMro62x7/X8PlhdbghtULLGerk7nSQrKqDNxwnk/0NXUuIqcyKb/mrpsL5ScewUJuaT0JFxnvjQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199015)(86362001)(4326008)(8676002)(33656002)(55016003)(41300700001)(186003)(66476007)(66556008)(66446008)(66946007)(76116006)(4744005)(8936002)(52536014)(2906002)(5660300002)(9686003)(110136005)(26005)(7696005)(71200400001)(478600001)(54906003)(6506007)(316002)(38100700002)(64756008)(122000001)(53546011)(38070700005)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6333
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e7a99fb-d2e7-47ee-632b-08dac7c5b8fc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KpD+CJru4Wm1Pht2OzTQJ7OgpqssF1AUOQjfLpumzkUrFuAIEin+RbQG18FscbOUW5MKqsBqItcZe8Miv9UVrzYHcNhU/yluJYkbJ433eLcQK6fIg/Qejy9fIVk3104tBn+AQUFzMAbiS72j4fS4s5uLJxP3zBfDrIuMMsQ5+AEVh05de89c4+eh8jfK3xNCZm8dVF3g9LY3LhmJPgJesCw2P12Xx/UMeQBsKABmFo/SMYzmG6LYdg+tG6p1goZGfzLPauPImuIYUMpTQFi37q3fh/+JdbMPwvwu4oiczVfGLyxDJE4wbz59j/vjBnlkX04WrJ671ft8iaQ4OSbw5MTrUs04kEAis9mASX7FUba+YRUa43UNNxLBT2EiFIQOSGEf8vjKIRboDvAOJbiFG+DCintgSXPA/46yOE7qckc0eKZTU0cxS2HOtkzLmWaAKsmAnCIIjm+jn6yM+BntfOstfD5NrLOHWfeR0WF569prrPFZHoE9Yw5gtnmeKHsw/4V2qeHmraDTSpcYpysxG0Z0sOrTWMgRKtwLOxmL2GLH8zogiy08Jkj090DHx9r1uJ3lQSGhFxqHC6UV8pYa4CD4ifkEQQaPkg2KlRRCoCaFv0LB2LAFixlHJVOsEwKfjYLC5nnhDNcrT2536GNZ2uHNz+b9s5n4BaEbPrPEjh09r/a4unLlYJojfmogIPNAkBTtEwEUexOFV1c8J+iLwQZeZYpjqjPrsEyKnZWcYZuThqg6mMJ270u5dTT5C1Bby6gbX67zSoOWx42grbxHYg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(52536014)(8936002)(4744005)(2906002)(41300700001)(356005)(33656002)(316002)(110136005)(54906003)(8676002)(36860700001)(4326008)(83380400001)(478600001)(70586007)(70206006)(47076005)(55016003)(82310400005)(40460700003)(336012)(186003)(81166007)(40480700001)(7696005)(53546011)(26005)(6506007)(9686003)(86362001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 11:28:54.0910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55314d24-a645-4181-f3b5-08dac7c5be53
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8319

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBmb3ItNC4x
N10geDg2L3NwZWMtY3RybDogRmlsbCBpbiB3aGl0ZXBhcGVyIFVSTA0KPiANCj4gT24gMTQuMTEu
MjAyMiAyMjo0MywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gPiAuLi4gbm93IHRoYXQgd2UgYSBs
aW5rIGF2YWlsYWJsZS4NCj4gPg0KPiA+IEZpeGVzOiA5ZGVhZjJkOTMyZjAgKCJ4ODYvc3BlYy1j
dHJsOiBFbmFibGUgWmVuMiBjaGlja2VuYml0IikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiANCj4gQWNrZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmVsZWFzZS1hY2tpbmcgdGhpcyBzZWVpbmcg
c2Npc3NvcnMgbGluZSBjb21tZW50IGZyb20gdGhlIG9yaWdpbmFsDQpwYXRjaCAiSWYgbm90LCBp
dCBjYW4gZ28gaW50byA0LjE4IGFuZCBnZXQgYmFja3BvcnRlZC4iLiBIb3BlZnVsbHkNCnRoaXMg
cmVsZWFzZS1hY2sgd2lsbCBvZmZsb2FkIHNvbWUgbWFpbnRlbmFuY2UvYmFja3BvcnQgZWZmb3J0
IGZvcg0KeDg2IG1haW50YWluZXJzLg0KDQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxI
ZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg==

