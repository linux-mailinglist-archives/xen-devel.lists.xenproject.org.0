Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11F47D0882
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 08:31:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619665.965130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtj2i-0005pl-2t; Fri, 20 Oct 2023 06:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619665.965130; Fri, 20 Oct 2023 06:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtj2h-0005nl-Vr; Fri, 20 Oct 2023 06:31:31 +0000
Received: by outflank-mailman (input) for mailman id 619665;
 Fri, 20 Oct 2023 06:31:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mrC=GC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qtj2g-0005nd-2E
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 06:31:30 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c8ccb4c-6f12-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 08:31:28 +0200 (CEST)
Received: from DU2PR04CA0033.eurprd04.prod.outlook.com (2603:10a6:10:234::8)
 by AS8PR08MB9292.eurprd08.prod.outlook.com (2603:10a6:20b:5a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 06:31:25 +0000
Received: from DB1PEPF00039234.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::9b) by DU2PR04CA0033.outlook.office365.com
 (2603:10a6:10:234::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 06:31:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039234.mail.protection.outlook.com (10.167.8.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24 via Frontend Transport; Fri, 20 Oct 2023 06:31:24 +0000
Received: ("Tessian outbound a024c74d4d6d:v215");
 Fri, 20 Oct 2023 06:31:24 +0000
Received: from 8eca8df7ce1e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C4D646C4-D377-47B7-B7DD-079F6842AB86.1; 
 Fri, 20 Oct 2023 06:31:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8eca8df7ce1e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Oct 2023 06:31:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9636.eurprd08.prod.outlook.com (2603:10a6:10:45c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 06:31:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 06:31:10 +0000
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
X-Inumbo-ID: 4c8ccb4c-6f12-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5YkSlNS4BRoK2MoVktqNF9yXh+lq3mAp/fl6So8/gU=;
 b=y3o25u4gN/XQnlHw0BDn4arh3ctcXZD0MNrjgMAQWpZrQu0RW1KzlL7OMzINkOcs94uw9BbmDlhaAiVxULqn5X+ovgJEgc20IBxKH1DEwDQOsGd+I+t5cgPs//HE14GZiqJ8wrCZWP2qMxI3f1CtKVbUZ/P1QFfhxMd4ymhGwJ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ec728330a93003b2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aS2ZcnxRNvDyvfS/9SslW7bpRUQQg2bO4DMpO0NFmJvcvx5VObtDIbVj93Y7swEPXFPEPY3LKmvMnT8eiTA/vbW0gKtvCB1QP8tvRJZ3eADKnYlvrBMspUO7S/WevZFc1RV/ROiwXv95HEmBBrmxirnMrZ4+W4yDwJm+odA4vNXICdPOesNmQBduVqZM2hnLugJAkH9YDlbVrrQNVTLa9Eiclo2duB2AEK1Hk8mOOOH4/pI1aekdwfi1JBJiPhwSn14mh45kiBcwy4B6K9mairPgErRy0+Tt8xxQBuzxdrsCMcHvBQwp+uqEeNRjZ+P42RA4awD0+eAfdi/r2+vyuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5YkSlNS4BRoK2MoVktqNF9yXh+lq3mAp/fl6So8/gU=;
 b=EzKkY2EPeqsbprP5ZAasXhtWYAJ0ttDCwil5fdk5O1iyK3Z4n+YnkPFwvBKmXS6HP5VfbTu5rJBBTFi/8CcWhHb7Z186rbR9Mmsphl1p0BxinFEnZJ9LHVT3zItYXKiqg4t19tFkxvwf8buSaITDqxjHmv9eUDayyP0bZeNFVeh5jxmD/aAK0HCUKABgxC4mEDxEp9Cus4ElUNZaZRQ0+qnLZQKuNgFni5Gbztz2DYr4OvAQkkgVry2hJdVxRBlx4Ru1NV18C+s0EgsQOQ3Te9237KqbYLoVhHt40Lt01xDiwTrJm/6Un5UpoFn361RixP3DHF/4TdFAYyc/a68nNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5YkSlNS4BRoK2MoVktqNF9yXh+lq3mAp/fl6So8/gU=;
 b=y3o25u4gN/XQnlHw0BDn4arh3ctcXZD0MNrjgMAQWpZrQu0RW1KzlL7OMzINkOcs94uw9BbmDlhaAiVxULqn5X+ovgJEgc20IBxKH1DEwDQOsGd+I+t5cgPs//HE14GZiqJ8wrCZWP2qMxI3f1CtKVbUZ/P1QFfhxMd4ymhGwJ8=
From: Henry Wang <Henry.Wang@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH 1/3] CHANGELOG.md: Mention the MISRA-C improvement in 4.18
 dev cycle
Thread-Topic: [PATCH 1/3] CHANGELOG.md: Mention the MISRA-C improvement in
 4.18 dev cycle
Thread-Index: AQHaAkwZpuNxj+yPc0utTQUv+u0QObBRScQAgACb2ICAAFMagIAAAKgA
Date: Fri, 20 Oct 2023 06:31:10 +0000
Message-ID: <E09C7FDD-5A45-4B11-8461-E85EDBA978AC@arm.com>
References: <20231019052050.1032492-1-Henry.Wang@arm.com>
 <20231019052050.1032492-2-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2310190911020.1945130@ubuntu-linux-20-04-desktop>
 <B8B61F24-CE9D-4924-992D-A8C43EB22956@arm.com>
 <f8b782372150321e26ed77c1b5fcfa04@bugseng.com>
In-Reply-To: <f8b782372150321e26ed77c1b5fcfa04@bugseng.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB9636:EE_|DB1PEPF00039234:EE_|AS8PR08MB9292:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b777eae-c891-4b78-14f0-08dbd1362ece
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BsHvFj0Z9CIqZy0AQyMfWIZKXrAbZLKyMMGHS0iCvYOPaUDVSFtRLhxNbEgBXAMCWEChLkail4aX7ejoQSYHyBhoRg7A3/3ZTAZMzgPQpYBvhCCKp4saawHGUAMxZVupRyxBQQa6KHgEH+iOBqlvciHCoruLVvrhlUGzLrUWCnKaU5jsDAjUt6nh9pvotRNMOpWuq+pDWfvRIPP03aAgoe0ZUi1fZLmX6wdlcjPnVcFlMkXeUsrZOfBgT7u8OAw8M7OWOEFt0H4kvBEF7AEj5WkzrQoJORh0v4vIDAsbhCec4Zulp9CpSgmO2aJotumbYn0V4gNUtdrc8rNM9vsNERiym9nW9skLPr5goQNQcaYl5ZxaM8c3JacpXCYlXMayI9apPJ38uSiSejfADgC2Ev7/FvVAoHCy7OmuauyR3v6E8jiJOp5etCuVwIGA97/JSCO3q8dKf5Pv5r6Agx49ueiH6cFJE+LF3aGeWvtpb2z3oBYM4g1LvJfBcZBId4RSOCE2MYVXgwgZ5fyik/iLLnleq2dTE0epAGDfbRYsMR/jZE/rf1V7B6RC16VMa7bg9JELFPkwnnjjOQm3mhZTMnAOkI0e7vgrby/QgAzVQGfTl35GbAUgvx6Oj23kh0OtMQaHlG1tVyZif93ZpJ7yX7iEjbA26EdVTlNpKudkQGMRV0RZogAO1Z0P3kNzTEYtqsqKUiIjr1VxIwj5U9tx4vyYzFMnwpohzg4QhY8FyrI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(33656002)(26005)(53546011)(83380400001)(38100700002)(2616005)(6512007)(36756003)(122000001)(86362001)(38070700009)(2906002)(5660300002)(71200400001)(7416002)(76116006)(41300700001)(91956017)(6506007)(64756008)(66556008)(54906003)(66446008)(66476007)(6916009)(316002)(66946007)(8936002)(6486002)(478600001)(966005)(8676002)(4326008)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <59FC40350E040B45834059F63CE114A1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9636
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b24afb1-a69e-4a9e-4742-08dbd136261c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hWOfpNVZfcVhbytHCHo9neePWVeIoW3SLpWSJX+1/UmZcklvL7M0g6/+9pufP07pPU4f5/EXRKziSvulcAVG0E33/NhYWS3Ycm1RuQZNHYu74QLRd4UDB415FPPWFMSZFFitdPwi0uYNbnI1hZaTZdJi0CkcNVJOutHk/aMHmbg+wnbsuGqJkLf0cgSJt6nvQxbNKIxTYmkqRlZw8xAT6kJf2m7ZyFzC1v9G3X2se3xkHEqy+mRBmg9q5n+JLpb42U3q4ooodW9dZ4tZc5ZvqNfiGjCUJAnC9fZeVyyjwMOCUX6Qryy2sQtV5rjygaiDfvC4LABFO7hZAOMSCBuxLHTAlWgQI/9yk1I2grr0Cze+BknbNy7yDFOXcfDtAaRRfscUXmxQlHXp93Sc7cO/kaVDCIDuJUftSFu815wOM0aCZpomBt3IOXg6kOG+6q+jnTjM0/IBIZ3MhMBK3dMpKo9gJf2DNs564PsONDOpYDP7ou/MD2FxwQF5TtWM+K+Sqj4N3qXDXwRmeuELC/d38j93s7bcn21P4M7xRJZ+mpD0+pEP6973bPDCzkbaPDN3SsDrraG50224GfCAaguA/E4cqb3jbq20fCNREBnHIae87uIhKkCIldFOh+Yz7ieAH5KH641/YoOCdYMHQx55Aj1j3tBl6b7RzR3U8qqMbCCF98JoO2XwlUfWlT5SQOhx2AS9vECFezPUZqykZhdXHipE0xYJOkh4J6Q6js77ozDcd3S3r0ZtNrMgvLMBeZln3ezeVcMFe7Uafzf8irfuhJquvTDHWRxpshBu77738UqpG92hFYBc3z9owmsp3yBoEPfPxAJO/ESeIE99FelAGQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799009)(186009)(82310400011)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(8936002)(8676002)(316002)(6862004)(54906003)(70586007)(4326008)(70206006)(26005)(86362001)(40460700003)(478600001)(5660300002)(40480700001)(966005)(6486002)(36756003)(6506007)(41300700001)(33656002)(53546011)(6512007)(336012)(83380400001)(2616005)(82740400003)(356005)(81166007)(36860700001)(47076005)(2906002)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 06:31:24.6754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b777eae-c891-4b78-14f0-08dbd1362ece
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9292

SGkgTmljb2xhLA0KDQo+IE9uIE9jdCAyMCwgMjAyMywgYXQgMTQ6MjgsIE5pY29sYSBWZXRyaW5p
IDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyMC8xMC8yMDIz
IDAzOjMxLCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gSGkgU3RlZmFubywNCj4+PiBPbiBPY3QgMjAs
IDIwMjMsIGF0IDAwOjEzLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+IHdyb3RlOg0KPj4+IE9uIFRodSwgMTkgT2N0IDIwMjMsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4+Pj4g
LS0tDQo+Pj4+IENIQU5HRUxPRy5tZCB8IDEgKw0KPj4+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykNCj4+Pj4gZGlmZiAtLWdpdCBhL0NIQU5HRUxPRy5tZCBiL0NIQU5HRUxPRy5tZA0K
Pj4+PiBpbmRleCAxNjVjNWNhZjliLi40N2U5OGYwMzZmIDEwMDY0NA0KPj4+PiAtLS0gYS9DSEFO
R0VMT0cubWQNCj4+Pj4gKysrIGIvQ0hBTkdFTE9HLm1kDQo+Pj4+IEBAIC0zMyw2ICszMyw3IEBA
IFRoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tlZXAgYSBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFj
aGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykNCj4+Pj4gICBub2RlcyB1c2luZyBhIGRldmljZSB0cmVl
IG92ZXJsYXkgYmluYXJ5ICguZHRibykuDQo+Pj4+IC0gSW50cm9kdWNlIHR3byBuZXcgaHlwZXJj
YWxscyB0byBtYXAgdGhlIHZDUFUgcnVuc3RhdGUgYW5kIHRpbWUgYXJlYXMgYnkNCj4+Pj4gICBw
aHlzaWNhbCByYXRoZXIgdGhhbiBsaW5lYXIvdmlydHVhbCBhZGRyZXNzZXMuDQo+Pj4+ICsgLSBU
aGUgcHJvamVjdCBoYXMgbm93IG9mZmljaWFsbHkgYWRvcHRlZCA3MiBydWxlcyBvZiBNSVNSQS1D
Lg0KPj4+IEkgY291bnRlZCB0aGVtIGFnYWluLCB0aGV5IGFyZSA3MSB0b2RheS4gV2UgaGF2ZSBh
Y2NlcHRlZCAzIG1vcmUNCj4+PiByZWNlbnRseSBidXQgZm9yIHRoZSBDSEFOR0VMT0cubWQgSSB3
b3VsZCBzdGljayB3aXRoIHdoYXQgaXMgb24NCj4+PiBkb2NzL21pc3JhL3J1bGVzLnJzdA0KPj4g
VGhhbmtzIGZvciB0aGUgcG9pbnRlciBvZiB0aGUgZG9jLCBJIGNoZWNrZWQgdGhlIGRvYyBhbmQg
bm90aWNlZCB0aGF0DQo+PiB3ZSBhY3R1YWxseSBzdXBwb3J0IDY1IHJ1bGVzIGFuZCA2IGRpcmVj
dGl2ZXMgKDY1KzY9NzEgc28geW91IGFyZSBjb3JyZWN0KSwNCj4+IGJ1dCB0byBhdm9pZCB0aGUg
Y29uZnVzaW9uLCB3b3VsZCB5b3UgbWluZCBtZSB3cml0aW5nIGluIHRoaXMgd2F5Og0KPj4gIlRo
ZSBwcm9qZWN0IGhhcyBvZmZpY2lhbGx5IGFkb3B0ZWQgNiBkaXJlY3RpdmVzIGFuZCA2NSBydWxl
cyBvZiBNSVNSQS1D4oCdPw0KPj4gS2luZCByZWdhcmRzLA0KPj4gSGVucnkNCj4gDQo+IEp1c3Qg
ZHJvcHBpbmcgdGhpcyBzbWFsbCBzdWdnZXN0aW9uOiB0aGUgZ2VuZXJhbCB0ZXJtIHVzZWQgYnkg
TUlTUkEgdG8gaW5kaWNhdGUgZWl0aGVyDQo+IGEgUnVsZSBvciBhIERpcmVjdGl2ZSBpcyBHdWlk
ZWxpbmUsIHNvIGl0J3MgYWxzbyBjb3JyZWN0IHRvIHNheSB0aGF0IDcxIEd1aWRlbGluZXMgaGF2
ZSBiZWVuDQo+IGFkb3B0ZWQuDQoNCkNvcnJlY3QsIEkgd3JvdGUgc2VwYXJhdGVseSBqdXN0IHRv
IHNpbXBseSBrZWVwIHNvbWUgY29uc2lzdGVuY3kgYmV0d2VlbiB0aGUgd29yZGluZyB0aGF0DQp3
ZSBhbHJlYWR5IGRpZCBmb3IgNC4xNywgc2VlIFsxXS4NCg0KWzFdIGh0dHBzOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPUNIQU5HRUxPRy5tZDtoPTE2NWM1Y2Fm
OWJlYWZmNzJkYTRlYTA3ZDMyNjc0MzUwMGY0NzA0NjY7aGI9SEVBRCNsNTUNCg0KS2luZCByZWdh
cmRzLA0KSGVucnkNCg0KPiANCj4gLS0gDQo+IE5pY29sYSBWZXRyaW5pLCBCU2MNCj4gU29mdHdh
cmUgRW5naW5lZXIsIEJVR1NFTkcgc3JsIChodHRwczovL2J1Z3NlbmcuY29tKQ0KDQo=

