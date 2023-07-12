Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B212750308
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 11:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562105.878678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJW7C-0001MT-AK; Wed, 12 Jul 2023 09:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562105.878678; Wed, 12 Jul 2023 09:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJW7C-0001Jr-7S; Wed, 12 Jul 2023 09:26:30 +0000
Received: by outflank-mailman (input) for mailman id 562105;
 Wed, 12 Jul 2023 09:26:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3yk=C6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qJW7B-0001Jl-E6
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 09:26:29 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d709627-2096-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 11:26:27 +0200 (CEST)
Received: from AM6P194CA0033.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::46)
 by AS8PR08MB6294.eurprd08.prod.outlook.com (2603:10a6:20b:29a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 09:26:21 +0000
Received: from AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::2b) by AM6P194CA0033.outlook.office365.com
 (2603:10a6:209:90::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 09:26:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT021.mail.protection.outlook.com (100.127.140.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.22 via Frontend Transport; Wed, 12 Jul 2023 09:26:20 +0000
Received: ("Tessian outbound f9124736ff4f:v145");
 Wed, 12 Jul 2023 09:26:20 +0000
Received: from fb51bc4c5138.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 55259188-0679-4994-9260-EBADA5DC5A1D.1; 
 Wed, 12 Jul 2023 09:26:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb51bc4c5138.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Jul 2023 09:26:09 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAVPR08MB9553.eurprd08.prod.outlook.com (2603:10a6:102:314::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Wed, 12 Jul
 2023 09:26:07 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7%4]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 09:26:06 +0000
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
X-Inumbo-ID: 2d709627-2096-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRt9e1uXosEYbKTEU+cTJMbucibKq6c3u0VLjz6C7O8=;
 b=f+X7h3o/Vct3Vi3clhGQ0v2AKmWI1dMPByRxoX7UQzcqROWiIyNiyW7+/+pHmm/Whx2YUyT5OETQyBY9r2GpGIM+1wA9YRDUH6r/AM9eXye/e0wJ0w3gGXzxU18/jzUgNsFBPmbyjq/kKzmQGOY2TXUbxjlOm+qKrL4UcJO7egg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ff1c62b460e3303
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TStLri7e7q/fn+2mnMyBWUJPy0jc2M5JFWPdSxjG2GZEfyYQE6SBSEJBAgiTapREOe4BFlxn0WBaffMz98ORu55w3M55lOVSQu6opUeTPDTWXAT/9tAkDzImzVPdJi9GJhvGpGQldSMy0WM1gfoInFbLKeEGgLLx9dpy/MQa5gbsJWwe1dkY7MFoFRkq9QLzlmQPNfUT4adLDOe6x4DJeb/D7QFYQoZF8+5JbCeBHUQWyMi24c+nYx0mUqxHNPEWc9zaUivkYxAtR/gpGDRwnRervHojHB6dAr3ibVwSE+fo1yTfEUN4Q4kDtyfq2mlLKUADldPG/w1//ZEUagCpcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRt9e1uXosEYbKTEU+cTJMbucibKq6c3u0VLjz6C7O8=;
 b=R7Lh6V6XBDMpeoTGNVmNLboanKCHfbppRMn3STdud1CqBgWMnqLB9MRs3bfaOggiNUC551vctMB9j0+WCfPGnH8kuZlsvAQ/Aat55SE67kbwOWaXwEes96dZNDyxN3a/tfWyVYgQTy2ctc+e45hidANuHA8vTR1GTrv+9yTiMyGfKW5ul56IeC54SdHD3rKNm3uohP+1xQwE71reEEy8VAUm9mScQ+AVxriixry74z5x13KNEeFh1ucL1Jg4KVaw0tQxPKXS+cXmshLbPiHRU/SB8dRvsxtMJT46xGieVkzzMzqafMsXXhu5MLLaX0d71TPonYlYcN9ttSDRBMyzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRt9e1uXosEYbKTEU+cTJMbucibKq6c3u0VLjz6C7O8=;
 b=f+X7h3o/Vct3Vi3clhGQ0v2AKmWI1dMPByRxoX7UQzcqROWiIyNiyW7+/+pHmm/Whx2YUyT5OETQyBY9r2GpGIM+1wA9YRDUH6r/AM9eXye/e0wJ0w3gGXzxU18/jzUgNsFBPmbyjq/kKzmQGOY2TXUbxjlOm+qKrL4UcJO7egg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"julien@xen.org" <julien@xen.org>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] docs/misra: add Rule 9.3
Thread-Topic: [PATCH] docs/misra: add Rule 9.3
Thread-Index: AQHZtDVnm2uoBPIrqkmByEz++gKzmq+1yx6AgAARUgCAAADeAA==
Date: Wed, 12 Jul 2023 09:26:06 +0000
Message-ID: <144EE5A6-4896-4029-B8F4-8614925AC89F@arm.com>
References: <20230711202145.2334563-1-sstabellini@kernel.org>
 <AD59BC9A-B2A4-47D7-A010-2FBF08DA3840@arm.com>
 <c9016145-c325-75bf-08cb-c1ff7855bc33@suse.com>
In-Reply-To: <c9016145-c325-75bf-08cb-c1ff7855bc33@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAVPR08MB9553:EE_|AM7EUR03FT021:EE_|AS8PR08MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: d06a4e82-dd94-4bef-e402-08db82ba0dbd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C6fR/tBTACqcDLhCJdJkln4u1iillJathZxKFXw+NhVrlj2apZdW7squC+nftvwsATRsnhSbjqT1yhOH+cG7Q/4yqyY0GtMM3Wp99Xcjr25ih6mIevkNvZoyT8YuIjcGsjxvXwqW0YsSSwuIk+vcDAoTtnI05vQpNLU+uwgNHMXL+DJFFb+gfxYEmzJ8UwLflhxtB7ZzT94qI57eHOZPgffdIaZ/VK1ruDN4H7mEENaKqjWiqdwNiOzAWpbyOsbRzy/iCT3MEAVe1Uuf/dUXKtzgDwN8/Cs4iWTIxcXQhhG7xmv3uQb5nLu73KA2kGF5e5cQ6VQphhnKtya3yQ/eY9MKgW2PPlfe5dRIHKhygkOtz7iETaeTcxmLZzOnV+/FatnRAkT+13fPWXTXsVts1heu2gVPu5Bs51HgYHQTBx0JL/Q56nyVIJv6Eg0wd9spHOxNdYrYmYs1dER7rg7Itx+wubfLZtgp36RTypmzqjKr4zwmebLjGS0Il4eq3CJ52ybT0ykg42zAQWVY48BGL/fpA0AF3DoJUTVN+RZZ+51/GAhPY9x0cn+MeCh0MZfK3iUaYLq4xYvM6RU95ASTn0yhPF0XV9YdYgh79niCjzvHK6NjI5EdIkVsx3GJSUXj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199021)(54906003)(76116006)(6486002)(71200400001)(478600001)(91956017)(6506007)(53546011)(186003)(26005)(6512007)(2906002)(66946007)(122000001)(64756008)(5660300002)(66476007)(4326008)(6916009)(316002)(66556008)(38100700002)(41300700001)(66446008)(8676002)(8936002)(86362001)(38070700005)(33656002)(36756003)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <65EBC67082DA284EA2F6EDE0EB63EBB4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9553
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47758a50-64c4-4d78-4d81-08db82ba052c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N794fDdzkdNfad/MM0X0CnSbrgA24V5rNrNk44hb7kuV2OwEql4n68frOoJ6/PMvox9sjuqEUR5SUnmzGdjFUUwbBLF1q54PIOnKBiTQq5wUaVZBJTURDg3oaP3iLpgav5ae4QN+aBUSjErZI4IrgvcLVO32OVK3pxJBrUyTusc7SE8a37PjU/KrvkSyeyMHrEBBGRCyxi2S6051oWdRhPGTHs2ZaRLdKzRmBrgFd7WB6v2uWF3AygP7Zvy8xncakE29xJS0h3EG/HjsvFl/5Wy/lQ7BlS/AwzANIT171NGu7Uw23mm6XZKAgtTFuI+nNLZozlNHCZAGx4NCsDlCYuznm2i2Ss0wqqZH0HpeieLCjrNeeLClVBhZuozOJszCxb7dHfxS87Rx13cSHQkxRA1W3EbgADr9Y7bd0yCu1jRomedZaqxGknCmhTJ/ofNypnQm0DbEZ8WsqnGSvyjcIWfbwNQoD6brCHHc7kaPV1hCOVDjEUcovXnBuhiyMGBOz7+A0sr2qikwDpJXds/56CgXs68NKN8mDIcTAGcNq440Oz9bra1w47qCrcHhDi+qZU4JHUjyTqZ7vLqRpd7VitGbzwkxvqIv0Y+9XWWZWotMWyyZx31tGsvdZ0D8hEfWvZ2iXNpWoyOX+lsnbpXHOjlvCrYkycW9reOb045o+cwlppL4AcsvU1pRhm937l9scqznSuO2cWxjyhSpBN6LI/pey4eADO3rsdNgnGNPv6s=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(316002)(47076005)(41300700001)(6862004)(8676002)(8936002)(6512007)(5660300002)(26005)(6506007)(336012)(53546011)(2616005)(40480700001)(2906002)(356005)(86362001)(81166007)(54906003)(36860700001)(36756003)(478600001)(6486002)(33656002)(82310400005)(82740400003)(70206006)(70586007)(4326008)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 09:26:20.8508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d06a4e82-dd94-4bef-e402-08db82ba0dbd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6294

DQoNCj4gT24gMTIgSnVsIDIwMjMsIGF0IDEwOjIyLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTIuMDcuMjAyMyAxMDoyMSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAxMSBKdWwgMjAyMywgYXQgMjE6MjEsIFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gRnJvbTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4+PiANCj4+PiBTcGVjaWZ5
IHRoYXQge30gaXMgYWxsb3dlZCBmb3IgemVyby1pbml0aWFsaXphdGlvbi4NCj4+PiANCj4+PiBT
aWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQu
Y29tPg0KPj4gDQo+PiBSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBh
cm0uY29tPg0KPiANCj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cj4gDQo+Pj4gLS0tIGEvZG9jcy9taXNyYS9ydWxlcy5yc3QNCj4+PiArKysgYi9kb2NzL21pc3Jh
L3J1bGVzLnJzdA0KPj4+IEBAIC0yODQsNiArMjg0LDExIEBAIG1haW50YWluZXJzIGlmIHlvdSB3
YW50IHRvIHN1Z2dlc3QgYSBjaGFuZ2UuDQo+Pj4gICAgICAgYnJhY2VzDQo+Pj4gICAgIC0NCj4+
PiANCj4+PiArICAgKiAtIGBSdWxlIDkuMyA8aHR0cHM6Ly9naXRsYWIuY29tL01JU1JBL01JU1JB
LUMvTUlTUkEtQy0yMDEyL0V4YW1wbGUtU3VpdGUvLS9ibG9iL21hc3Rlci9SXzA5XzAzLmM+YF8N
Cj4+PiArICAgICAtIFJlcXVpcmVkDQo+Pj4gKyAgICAgLSBBcnJheXMgc2hhbGwgbm90IGJlIHBh
cnRpYWxseSBpbml0aWFsaXplZA0KPj4+ICsgICAgIC0ge30gaXMgYWxzbyBhbGxvd2VkIHRvIHNw
ZWNpZnkgZXhwbGljaXQgemVyby1pbml0aWFsaXphdGlvbg0KPj4gDQo+PiBOb3QgcmVsYXRlZCB0
byB0aGlzIHBhdGNoLCBidXQgaG93IGlzIHRoZSBjb2Rpbmcgc3R5bGUgZm9yIHRoaXM/IElzIGl0
IHt9IHdpdGhvdXQgc3BhY2VzIG9yIHsgfSB3aXRoIG9uZSBzcGFjZT8NCj4+IEl04oCZcyBub3Qg
c3BlY2lmaWVkIGluIHRoZSBjb2Rpbmcgc3R5bGUNCj4gDQo+IEluIHRoZSBhYnNlbmNlIG9mIGFu
eXRoaW5nIHdyaXR0ZW4gZG93biwgSSdtIGluY2xpbmVkIHRvIGluZmVyIGJvdGgNCj4gZm9ybXMg
YXJlIGFjY2VwdGFibGUuDQoNCjopIEkgc2VlLCB0aGF04oCZcyB3aGF0IEkgd2FzIHdvcnJpZWQs
IGFueXdheSB5b3UgYXJlIHJpZ2h0ISANCkkgaGF2ZSBhIFdJUCBmb3IgY2xhbmcgZm9ybWF0IHRo
YXQgd291bGQgZ2VuZXJhdGUgc29tZSBkaXNjdXNzaW9uLCBidXQgYXQgbGVhc3QgSSBob3BlIGl0
IHdpbGwgY2xhcmlmeSBtYW55IG9mIHRoZXNlIHNtYWxsDQp0aGluZ3MgdGhhdCBtYWtlIG91ciBj
b2RlYmFzZSBsZXNzIHVuaWZvcm0sIG1ha2luZyB1cyB3cml0ZSBkb3duIHNvbWUgcnVsZXMgDQoN
Cj4gDQo+IEphbg0KDQo=

