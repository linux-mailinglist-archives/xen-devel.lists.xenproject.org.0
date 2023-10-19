Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9167E7CECCC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 02:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618841.963033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtGx5-0001h5-1y; Thu, 19 Oct 2023 00:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618841.963033; Thu, 19 Oct 2023 00:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtGx4-0001el-V6; Thu, 19 Oct 2023 00:31:50 +0000
Received: by outflank-mailman (input) for mailman id 618841;
 Thu, 19 Oct 2023 00:31:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWKy=GB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qtGx2-0001ef-PL
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 00:31:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1dea820-6e16-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 02:31:45 +0200 (CEST)
Received: from DBBPR09CA0047.eurprd09.prod.outlook.com (2603:10a6:10:d4::35)
 by AS8PR08MB10069.eurprd08.prod.outlook.com (2603:10a6:20b:636::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 00:31:16 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::f8) by DBBPR09CA0047.outlook.office365.com
 (2603:10a6:10:d4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Thu, 19 Oct 2023 00:31:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24 via Frontend Transport; Thu, 19 Oct 2023 00:31:15 +0000
Received: ("Tessian outbound d9a8e74be042:v215");
 Thu, 19 Oct 2023 00:31:14 +0000
Received: from b6a31603b37d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A94DF694-BAED-4E67-9597-C55AC06F6D14.1; 
 Thu, 19 Oct 2023 00:31:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b6a31603b37d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Oct 2023 00:31:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9709.eurprd08.prod.outlook.com (2603:10a6:102:2e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Thu, 19 Oct
 2023 00:31:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 00:31:06 +0000
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
X-Inumbo-ID: e1dea820-6e16-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XB11fqzmtvd8YESLLwZC7CPpWnuIQnr5I90/nWqd54=;
 b=np7VX8V17s8i9GjSBUSqwC4a/fmFUdbuO+v29MD/AA0iS9W14gtY+XvG45Go/4OwRL/MJOxtbAi+T0Hk37s+U/41iaWaFsyfwbSKeVuPdrM92NJQBzDszy+7duBKyqOXzx3oFzFsxaiewnfmROboV1pMP4M/N4HLOYAtt8ivhZs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d763437a03b6cea8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1ng+XsFsNTu/9n3evkSU7USa3KKymdN0hmZci+29w4FYgasVhgep3KpSRACGH0aPFFH0OW2v7h2K3aBPOGpUviVTEduuttV8Q//gbjFzel8J3xWwpRisw97BSorYLTGFT61PCl0egMfOuD6c0zXC6qhUNKIBRXZD2CrR0QmiHr7Bja5qi1A3ghI5Z0ZK48O1xlYrSrP4JegOcc1BZSLTExLEBaV3wgXI8qgaqsZstOvUeAvGlr22xcfn3Lx8DBqeSX0FyM715We4rmmN2Bjy0pvO7a79OWMCmpPRV521ZLgy0YLNHmOXLO5f6qmkwB6bf/3P4NzoalxnycAymqnCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XB11fqzmtvd8YESLLwZC7CPpWnuIQnr5I90/nWqd54=;
 b=K4gxcpUyczcwlnEuftqkjE0ENQ6aGd1nMM8CMXCfbBjtKwDvWMsSvhQn0LCCVBbXT3z55By60FeTfB+XvlgN3U9Dv6qkcJ1tJstF7H3RjSIk5bEi+79MS0IX81/6FTNC59eL44LiMWqJ6ca7/f9vJ4SxL0kAEAO/7iZxHory1ErRTkifcXaSnjuTLih5quyUJAAKzUOkcJOPL1Ka/kXvWKCzkUZBA/NrB8IaJMpfnZO1J5G0H4YaNnvcxxUOVq5nBzEAIJqE6zA1U4hRvlXZfarSfs+R6ov+0C9zMDiPJ+5MVujAYZhVx0zuzsSwkPYeLM07gGUOftSKVx8fMeblDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XB11fqzmtvd8YESLLwZC7CPpWnuIQnr5I90/nWqd54=;
 b=np7VX8V17s8i9GjSBUSqwC4a/fmFUdbuO+v29MD/AA0iS9W14gtY+XvG45Go/4OwRL/MJOxtbAi+T0Hk37s+U/41iaWaFsyfwbSKeVuPdrM92NJQBzDszy+7duBKyqOXzx3oFzFsxaiewnfmROboV1pMP4M/N4HLOYAtt8ivhZs=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH for-4.18 0/5] automation: cleanup hardware based tests
Thread-Topic: [PATCH for-4.18 0/5] automation: cleanup hardware based tests
Thread-Index: AQHaAesURD9oNP+b9UWLmiwv0WSMc7BQIgkAgAAhKAA=
Date: Thu, 19 Oct 2023 00:31:06 +0000
Message-ID: <73D6E742-172F-4442-8866-7215BB10D1CC@arm.com>
References:
 <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
 <12f20d5a-3306-441b-823e-cdfb7008ec5d@citrix.com>
 <alpine.DEB.2.22.394.2310181531200.965337@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310181531200.965337@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB9709:EE_|DBAEUR03FT009:EE_|AS8PR08MB10069:EE_
X-MS-Office365-Filtering-Correlation-Id: 49e2aa7b-7907-43b2-5e83-08dbd03ab42d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d29JRNnL4/IWuDe+6z8zSBDDb1SfcTdFdAlKGEoslTuYJy8S8pfNQdLK1ban/xerbI4DvyJt6N5jkvwamXEtDocTQqzPCl0Nnf8bbTN8QFJ+uBFc8bz4fzFfArS6Lcw5VPGKeb7RQhcqPrDHj/VR6mQfoZtdiQS4phKG9IQCCnI7fctKxZiwcTkxrhQ/uiPXZGIwDLQ03+5Dk4hFkd0x0wjP5F7V4C5jMcAGwCamkbUWjselaE+bFrkENFyXGi70346UlY1qwd/R4ks+CvAF0jwiORb1KyuTFg3bdIJ9JzbOliSXacBNHXt8T7Nt5rQpwl47b1ESjkscgol/MpLZ1+l40+IPei9R2vZMqik5e95AFYG8pDqeBpVCD66Eva8la3UT3EySdYWXlsBqUN+G/BlsAM385Ixe/rABuMHWNW4g5OUhKhx0E6SjdwBDtE0x0JTQV691pBUDmxOa335ftW2jAsFZ4u+dy/rzbchPtPB3tRtGrjoOfE8gaxZCDGrVkaqEC3Jmi1otim/zNagM6eGu0r7ZzoIEePxH2A9r6r10mr5cV5XgoWOQjlz+gyVByBalcMSvqCAHEg7MD7/Hh+q1dOBMQE9ykFXIbGarHGSIWSaoMxgfv5vab4AVIVfMwm1DudjycigxH33hHbOeFg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(39860400002)(396003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(83380400001)(41300700001)(38100700002)(64756008)(91956017)(36756003)(38070700005)(2616005)(122000001)(6512007)(2906002)(478600001)(6486002)(66476007)(66556008)(66446008)(86362001)(4326008)(54906003)(66946007)(8936002)(6506007)(5660300002)(8676002)(53546011)(76116006)(316002)(33656002)(71200400001)(966005)(110136005)(66574015)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A5ECE0FE81A7A4FBC54B808880C8C04@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9709
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d60ffac0-c2a6-4fcf-75d8-08dbd03aaeb5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hK6B8//X6EJ+OClN7qSXSH0WnBKqiJ7jRlkLaP9VLeZhtsuvn5FQ2UAwFMn05o5zJTS7lGRlF0uorq+TgoelpsQCqH9+iCo/l6xfCmCIceQkzAcMdJrmpP+Kv51CjUFcWxroonl8eTuMIbnT84LTqVRKcQVMfseK7fJl0xlMTvKPib1BYEnZSYYwdhg9ZTcDsClK1SMBnSvG8dNXCG9YpkxTDZPg/g14jK6M+EthbhU6dJfpRn+54PTnshSAkarRdjorbOndy+apGpO+qcHAnbx6pp4w36lwuH6wKZfVvvP/2CtVU3wUdwGHrYfs46XHXwCexZPXYPfZNpmT9dVAotihbWSUer0lXhf9878W2k+EhQIwDF6GljsjOLET+S7lY17jqBADoh+2pYpthEMjQK1Ugs6JUkLFDzuVKcmU7nU0S7SsQ3VyVrxBol/zKYSZgvy42wzAkKCAaqR4K58vs/vJyXyrUYkjLKzwetGBthc8VTPPUGrF8DsbECNARAMuqXRKh6mCGujtWgR1AYqpWfJMlVDm7fuedgaLWHAvCbG2q0xjAByKwOXDJe4gohwwTwrbWCwohrrQ5JlkadLA0VvwHi4oyCwZgeHpx7fQPA1/hFABKXFAfHzUv7TxCsEHufvGWKgRrceRvjuwlWniSMl3r5X8DhBSvtE12zqSOPMZ5hb+RM5rU3UoQj19QU0i5JDsNznyy7qDNH8OMl3hfFBt4ATrEV7mPdbFxMfX2Hc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(356005)(82740400003)(36756003)(33656002)(47076005)(26005)(336012)(66574015)(83380400001)(6512007)(2616005)(81166007)(53546011)(86362001)(107886003)(36860700001)(478600001)(6506007)(2906002)(40480700001)(41300700001)(54906003)(316002)(6486002)(5660300002)(70206006)(70586007)(110136005)(4326008)(40460700003)(966005)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 00:31:15.1828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e2aa7b-7907-43b2-5e83-08dbd03ab42d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10069

SGksDQoNCj4gT24gT2N0IDE5LCAyMDIzLCBhdCAwNjozMiwgU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgMTggT2N0IDIwMjMs
IEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwNi8xMC8yMDIzIDM6MDUgYW0sIE1hcmVrIE1h
cmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+PiBXaGlsZSB3b3JraW5nIG9uIHRlc3RzIGZv
ciBNU0ktWCwgSSBkaWQgZmV3IGNsZWFudXBzIG9mIGh3LWJhc2VkIGdpdGxhYiB0ZXN0cywNCj4+
PiBncmVhdGx5IHJlZHVjaW5nIGZhbHNlIHBvc2l0aXZlIG1lc3NhZ2VzIGluIHRoZSB0ZXN0IG91
dHB1dC4NCj4+PiANCj4+PiBBZnRlciBhcHBseWluZyB0aGlzIHNlcmllcywgdGhlIHRlc3RzLWFy
dGlmYWN0cy9hbHBpbmUvMy4xOCBjb250YWluZXIgbmVlZHMgdG8NCj4+PiBiZSByZWJ1aWx0Lg0K
Pj4+IFRlc3QgcnVuIHdpdGggY29udGFpbmVyIHJlYnVpbHQgKG9uIG15IHJlcG8pOg0KPj4+IGh0
dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvbWFybWFyZWsveGVuLy0vcGlwZWxp
bmVzLzEwMjc0Njc3NjENCj4+PiANCj4+PiBDYy1pbmcgSGVucnkgZm9yIHJlbGVhc2UgYWNrLg0K
Pj4+IC0tLQ0KPj4+IENjOiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+Pj4gQ2M6
ICBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+DQo+Pj4gQ2M6ICBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4gDQo+Pj4gTWFyZWsgTWFyY3p5
a293c2tpLUfDs3JlY2tpICg1KToNCj4+PiAgYXV0b21hdGlvbjogaW5jbHVkZSByZWFsLXRpbWUg
dmlldyBvZiB0aGUgZG9tVSBjb25zb2xlIGxvZyB0b28NCj4+PiAgYXV0b21hdGlvbjogaGlkZSB0
aW1lb3V0IGNvdW50ZG93biBpbiBsb2cNCj4+PiAgYXV0b21hdGlvbjogY2xlYW51cCB0ZXN0IGFs
cGluZSBpbnN0YWxsDQo+Pj4gIGF1dG9tYXRpb246IGltcHJvdmUgY2hlY2tpbmcgZm9yIE1TSS9N
U0ktWCBpbiBQQ0kgcGFzc3Rocm91Z2ggdGVzdHMNCj4+PiAgYXV0b21hdGlvbjogZXh0cmFjdCBR
RU1VIGxvZyBpbiByZWxldmFudCBoYXJkd2FyZSB0ZXN0cw0KPj4gDQo+PiBBY2tlZC1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IA0KPiANCj4+IEhl
bnJ5IC0gdGhpcyB3aWxsIGJlIGEgZ29vZCBpbXByb3ZlbWVudCB0byB0YWtlLiAgSXQncyBvbmx5
IHRoZSB0ZXN0DQo+PiBsb2dpYywgd2l0aCBHaXRsYWIgYmVpbmcgaGFwcHkgd2l0aCB0aGUgcmVz
dWx0Lg0KPiANCj4gSSdsbCBsZWF2ZSBpdCB0byBIZW5yeS4NCg0KSSBhbSBoYXBweSB0byBpbmNs
dWRlIHRoaXMgYXMgaW4gNC4xNyB3ZSBkaXNjdXNzZWQgdGhhdCBDSSBjaGFuZ2VzIHdvbuKAmXQg
YmUNCmJsb2NrZWQuDQoNClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdA
YXJtLmNvbT4NCg0KDQo+IEFuZHJldywgaWYvd2hlbiB5b3UgZW5kIHVwIGNvbW1pdHRpbmcgdGhl
IHNlcmllcywgcGxlYXNlIGFsc28gdXBkYXRlIHRoZQ0KPiBjb250YWluZXIsDQoNClBsZWFzZSBh
bnkgb2YgeW91IHR3byBkbyB0aGF0IDopIFRoYW5rIHlvdS4NCg0KS2luZCByZWdhcmRzLA0KSGVu
cnkNCg0KDQo=

