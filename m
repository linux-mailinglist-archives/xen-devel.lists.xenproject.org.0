Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCFE70F070
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538839.839119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jhD-0007qo-Ty; Wed, 24 May 2023 08:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538839.839119; Wed, 24 May 2023 08:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jhD-0007o0-R4; Wed, 24 May 2023 08:18:11 +0000
Received: by outflank-mailman (input) for mailman id 538839;
 Wed, 24 May 2023 08:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1jhC-0007nu-KY
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:18:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84753e40-fa0b-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 10:18:09 +0200 (CEST)
Received: from AS9PR06CA0754.eurprd06.prod.outlook.com (2603:10a6:20b:484::8)
 by GV1PR08MB7378.eurprd08.prod.outlook.com (2603:10a6:150:22::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 08:18:03 +0000
Received: from AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::13) by AS9PR06CA0754.outlook.office365.com
 (2603:10a6:20b:484::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 08:18:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT050.mail.protection.outlook.com (100.127.141.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 08:18:02 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Wed, 24 May 2023 08:18:02 +0000
Received: from 8feac114bdd0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8E22CF17-804B-4FD3-AFD8-74F175F15312.1; 
 Wed, 24 May 2023 08:17:54 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8feac114bdd0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 08:17:54 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM7PR08MB5464.eurprd08.prod.outlook.com (2603:10a6:20b:10a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 08:17:53 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 08:17:53 +0000
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
X-Inumbo-ID: 84753e40-fa0b-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/xsYqdaGGe0ZwXsZb3e+Z0gZ7qyQu6w8n7yJgQBAFw=;
 b=ekiGj7HOFk1UF45ybNoA82JICE/VPRImE0c51L1GyzzKq4h5DzjItymyvof1V7i9QcQlr4mLWgoNmsQr0Q5QPiZluQ508cyCd/cAEh7BRtj14aCMVzrFzYeC1jlTYLD4vNVJyAEwrimghbrbLwmkrMVsOkZRDRO72MWGlG9Geog=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f3e921affead396
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzVRCVJA8+BbQ/EZwLl9l6lcqts61gxQGagyDvDjLO6g0CYABKbnbdBYeWXJBADKZ5qfSFse8q1ASsElI/2r7J/JV6/NcnfnYDWgujXy/BfybHPZRZ7jFfY11VdNGp3YSvUeNAhkvkqbYzD+kVMfCR2bOH0jvWfdStc3e6yAqr4a9lfckCMUlrQSEYOQCS0O0nM8HYCBcrg601ka5dNBqg6J9omDH+UUSQ4BjyYHxg3XJyoj3X636WOf3RDoLbkDIMLNSa17VTdc+xAgMMDXc5iOp+5zvTVU+qc44twDHJGoWMrN+0nauI4a7yh7bRmlwmppyN/RKl04UjL17bjMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/xsYqdaGGe0ZwXsZb3e+Z0gZ7qyQu6w8n7yJgQBAFw=;
 b=YeWUDbmTWYUfCGMZutuYu85fm0c3/fNhLJCTPRn5EAz1aISd7gGotV46w2zSohdSXpZ++iSWv4/zVzSyWY0+CdkCodkE/5Pa2RiVfXigglBfhazlNq4UkccL9npPMIWq/8SC3AeQ1dSemJUmR5b03l9zC1nzm2rJYWh8pbJDIUT/qqzWszLLtLFc88pC8hGi+VizUbWl0HLQb2JojMbUG2xsVECOWqyaABGKOg1AlcDpPVclKoiLN96RroMwW1HgvNS78SDENEhm7KxrJP1/2Bs9/ze3bH4fzchWYHOw6sTsiGtBZYVsquDrldnpGjdr2YG+pojuI6MgK3BaVRvHEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/xsYqdaGGe0ZwXsZb3e+Z0gZ7qyQu6w8n7yJgQBAFw=;
 b=ekiGj7HOFk1UF45ybNoA82JICE/VPRImE0c51L1GyzzKq4h5DzjItymyvof1V7i9QcQlr4mLWgoNmsQr0Q5QPiZluQ508cyCd/cAEh7BRtj14aCMVzrFzYeC1jlTYLD4vNVJyAEwrimghbrbLwmkrMVsOkZRDRO72MWGlG9Geog=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH 02/15] build: rework asm-offsets.* build step to use
 kbuild
Thread-Topic: [XEN PATCH 02/15] build: rework asm-offsets.* build step to use
 kbuild
Thread-Index: AQHZjZUYHIYuuKOi9UK9bl3DPb8C/K9pCpGAgAAGCYCAAASnAA==
Date: Wed, 24 May 2023 08:17:53 +0000
Message-ID: <CCBA4DD9-80EA-4B1E-8C60-3340793F3484@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-3-anthony.perard@citrix.com>
 <CBAF4CF3-C7DD-4071-9321-5EC7BEA1D432@arm.com>
 <ee97f251-a780-82be-b607-7cc7783a950f@suse.com>
In-Reply-To: <ee97f251-a780-82be-b607-7cc7783a950f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM7PR08MB5464:EE_|AM7EUR03FT050:EE_|GV1PR08MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 399768ef-12b6-4cd9-7ed5-08db5c2f6491
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uIindZ9qzNtpmdvdkETIGUxb7RryR+aOEYXcuHH94s5WVUiBJ766hxSboCSov+JWksbHVps7yIpVuaFCnscQPsliPNXhjmw9vpApKxXcWTCPjkjxx5VyQLy6u2L+f6KLSZ8oEbpLAWklE35ZDDQZ2f7oZACct2Dv9T+gGM3G4GUoqi0Yd/D4TNTkNAyCbRNg4zzHfruitwApyxgJTum4AEtq46Qpk0ObAUldiXaIAIHrrLfalK4k1wbOeBuwxkoJ+bdx6+gaPmrQUQZ2JJqpZD9NVvjdHj/rhDQWEclYG+lcQarA+tcJTrs5FgLoEg0DTkHPu5xHkmztlR9kphj9OdkxHP1giheoM76znZYr7UaDrjBPGPji1R5grhtKLyguxGdx3a7cWtwK6QEfcmQKeu1HgjXa1WCksyzZeAXTqx0x9YEMf6SsHSVByFd26hicywULUVM3uaTKicVh556JvrqsiAeg7yCf823EvkekCeRXhRtPk+Q4EB+EwyV8PFwDSEMdxbvsL+dGA4+BILq9rOyKuEeO0sOJ1YMkSPbBrhUqz8jb51f9N9gs7OgBhnzhEPgusr7Tg1zOF1ceEbfHyCGvlwAueri8rPkAUki+P3OuRCD83rOv/VycW2Ir9b3TGNfVx5tbp9iH1pq/DZ0WqQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(71200400001)(41300700001)(66446008)(64756008)(91956017)(76116006)(66946007)(66556008)(66476007)(2906002)(26005)(186003)(478600001)(6486002)(6916009)(316002)(4326008)(5660300002)(54906003)(8936002)(8676002)(6512007)(53546011)(36756003)(2616005)(6506007)(83380400001)(86362001)(38070700005)(122000001)(33656002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8332CE21A9C0C244882086B91C98052D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5464
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9fb8ec2c-0202-4815-d4b1-08db5c2f5f20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t4WzeIP/m+tWqDqo6agwA64CBHUtSxcfW8wq0HI72tJVRcoS1+T+Y2/o//PO5PE5cLNVVahiD0kZvGXM8gXsSrAt0C6EU21T1z5vRJq9eWYBLqJHtRjiAYzMdG0liD9r0bNoBj1M8MWZx8UuBaGqia5MGmCrApZetAaMUAAjkTrPkcJQ8xu6kJLWINDKcqkCiH07/c35cmZxzvSnG1DQXqvJIRRRFSk1D74PmGW/AThe19ftl+GiWjDVd+dYm5fZL3sjMhRq1rvtuUQ+a7jV0lu1VpWmLa24/90Vo+b0Ln3oWZ3VzYg4Wf7cC5H1+6LfCY16GZ+MTf+RlxRRh1wu3YGa2KCA44F31Ci4c2fvtuxVfTRqUBGwwo6XCTmiUT7sVABVqtVV58jHTEaFcz5Z3IsrNUpm/cwttZmGigbmk82090WxQAyfmkoVd8kVLGTnxwUzO3wMU0KQfkA4eku2wx47+yQrTyK3dDxSN5BxdtIbJo7EF4m8QJwfMNuHrIVvJJW31UGWN/iUTAufmi/GmpPqphq58J1mYZykZdjnKFJco8vU9jG+NX2NqaHw8EJ7Wb98iM66H1/CMEnnnJXwPbA7NcLS+kX7kk9K6HJkB0xJR5UdOHN9E1e1Xu0lBLNQYUCTx0GIpwa5Uckqt+jGsplweF7WfrMCzyCwqzMi+cF7Zd9n8h6ksr76r1qvX47waor1h3Gw25Wbe/lL1x4+3voUfDa5ymlk3021v0+9asD3K1P3gTKtutecif6M1TV2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(33656002)(6506007)(26005)(82740400003)(356005)(81166007)(40460700003)(53546011)(6512007)(107886003)(186003)(2616005)(36860700001)(47076005)(36756003)(83380400001)(336012)(2906002)(40480700001)(316002)(70586007)(70206006)(4326008)(6486002)(41300700001)(86362001)(54906003)(82310400005)(478600001)(6862004)(8676002)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 08:18:02.2907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 399768ef-12b6-4cd9-7ed5-08db5c2f6491
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7378

DQoNCj4gT24gMjQgTWF5IDIwMjMsIGF0IDA5OjAxLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjQuMDUuMjAyMyAwOTozOSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAyMyBNYXkgMjAyMywgYXQgMTc6MzcsIEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPiB3cm90ZToNCj4+PiBJbnN0ZWFkIG9mIGhhdmluZyBhIHNw
ZWNpYWwgJChjbWRfYXNtLW9mZnNldHMucykgY29tbWFuZCwgd2UgY291bGQNCj4+PiBwcm9iYWJs
eSByZXVzZSAkKGNtZF9jY19zX2MpIGZyb20gUnVsZXMubWssIGJ1dCB0aGF0IHdvdWxkIG1lYW4g
dGhhdA0KPj4+IGFuIGh5cG90aGV0aWNhbCBhZGRpdGlvbmFsIGZsYWdzICItZmx0byIgaW4gQ0ZM
QUdTIHdvdWxkIG5vdCBiZQ0KPj4+IHJlbW92ZWQgYW55bW9yZSwgbm90IHN1cmUgaWYgdGhhdCBt
YXR0ZXIgaGVyZS4NCj4+PiANCj4+PiBCdXQgdGhlbiB3ZSBjb3VsZCB3cml0ZSB0aGlzOg0KPj4+
IA0KPj4+IHRhcmdldHMgKz0gYXJjaC8kKFRBUkdFVF9BUkNIKS8kKFRBUkdFVF9TVUJBUkNIKS9h
c20tb2Zmc2V0cy5zDQo+Pj4gYXJjaC8kKFRBUkdFVF9BUkNIKS8kKFRBUkdFVF9TVUJBUkNIKS9h
c20tb2Zmc2V0cy5zOiBDRkxBR1MteSArPSAtZzANCj4+PiBhcmNoLyQoVEFSR0VUX0FSQ0gpL2lu
Y2x1ZGUvYXNtL2FzbS1vZmZzZXRzLmg6IGFyY2gvJChUQVJHRVRfQVJDSCkvJChUQVJHRVRfU1VC
QVJDSCkvYXNtLW9mZnNldHMucyBGT1JDRQ0KPj4+IA0KPj4+IGluc3RlYWQgb2YgaGF2aW5nIHRv
IHdyaXRlIGEgcnVsZSBmb3IgYXNtLW9mZnNldHMucw0KPj4gDQo+PiBUaGUgc29sdXRpb24gYWJv
dmUgc2VlbXMgY2xlYW4sIG1heWJlIEkgYW0gd3JvbmcgYnV0IC1mbHRvIHNob3VsZCBub3QgbWF0
dGVyIGhlcmUgYXMgd2UgYXJlDQo+PiBub3QgYnVpbGRpbmcgb2JqZWN0cyB0byBpbmNsdWRlIGlu
IHRoZSBmaW5hbCBidWlsZCwgaXNu4oCZdCBpdD8gQW5kIGdjYyBkb2N1bWVudGF0aW9uIHN0YXRl
cyBqdXN0Og0KPj4gDQo+PiDigJxJdCBpcyByZWNvbW1lbmRlZCB0aGF0IHlvdSBjb21waWxlIGFs
bCB0aGUgZmlsZXMgcGFydGljaXBhdGluZyBpbiB0aGUgc2FtZSBsaW5rIHdpdGggdGhlIHNhbWUN
Cj4+IG9wdGlvbnMgYW5kIGFsc28gc3BlY2lmeSB0aG9zZSBvcHRpb25zIGF0IGxpbmsgdGltZS4i
DQo+PiANCj4+IEnigJl2ZSBhbHNvIHRlc3RlZCB0aGlzIHBhdGNoIGFuZCBpdCB3b3JrcyBmaW5l
LCBJIGhhdmUgdG8gc2F5IGhvd2V2ZXIgdGhhdCBJIHByZWZlcnJlZA0KPj4gYSBtb3JlIHZlcmJv
c2Ugb3V0cHV0LCBzbyB0aGF0IHBlb3BsZSBjYW4gY2hlY2sgaG93IHdlIGFyZSBpbnZva2luZyB0
aGUgY29tcGlsZXIsDQo+PiBidXQgSSBndWVzcyBub3cgaXTigJlzIG1vcmUgY29uc2lzdGVudCB3
aXRoIHRoZSBvdGhlciBpbnZvY2F0aW9ucyB0aGF0IGRvZXNu4oCZdCBwcmludA0KPj4gdGhlIGNv
bXBpbGVyIGludm9jYXRpb24uDQo+IA0KPiBJZiB5b3Ugd2FudCBpdCBtb3JlIHZlcmJvc2UsIHlv
dSBjYW4gcGFzcyBWPTEgb24gdGhlIG1ha2UgY29tbWFuZCBsaW5lLg0KPiAoT2YgY291cnNlIHRo
YXQnbGwgYWZmZWN0IGFsbCBjb21tYW5kcycgb3V0cHV0LikNCg0KWWVzIEkgaGF2ZSB0byBzYXkg
dGhhdCBhZnRlciBzZW5kaW5nIHRoZSBtYWlsLCBJ4oCZdmUgY2hlY2tlZCB0aGUgTWFrZWZpbGUg
YW5kIEnigJl2ZSBmb3VuZCB0aGUgY29tbWVudA0KDQojIFRvIHB1dCBtb3JlIGZvY3VzIG9uIHdh
cm5pbmdzLCBiZSBsZXNzIHZlcmJvc2UgYXMgZGVmYXVsdA0KIyBVc2UgJ21ha2UgVj0xJyB0byBz
ZWUgdGhlIGZ1bGwgY29tbWFuZHMNCg0KVGhhbmsgeW91IGZvciBwb2ludGluZyB0aGF0IG91dA0K
DQoNCj4gDQo+IEphbg0KDQo=

