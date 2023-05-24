Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9B570F2ED
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 11:35:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538929.839320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1ktj-0008Hw-3P; Wed, 24 May 2023 09:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538929.839320; Wed, 24 May 2023 09:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kti-0008Ek-WD; Wed, 24 May 2023 09:35:11 +0000
Received: by outflank-mailman (input) for mailman id 538929;
 Wed, 24 May 2023 09:35:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1kth-0008Ee-Ev
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 09:35:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4447c46b-fa16-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 11:35:06 +0200 (CEST)
Received: from AM5PR0402CA0009.eurprd04.prod.outlook.com
 (2603:10a6:203:90::19) by AS8PR08MB9242.eurprd08.prod.outlook.com
 (2603:10a6:20b:5a1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 09:34:38 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::73) by AM5PR0402CA0009.outlook.office365.com
 (2603:10a6:203:90::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Wed, 24 May 2023 09:34:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 09:34:37 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Wed, 24 May 2023 09:34:37 +0000
Received: from a58fd8093b79.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B8DE8E2A-B3E3-4AB1-9987-71492F0F336D.1; 
 Wed, 24 May 2023 09:34:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a58fd8093b79.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 09:34:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9935.eurprd08.prod.outlook.com (2603:10a6:10:401::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 09:34:24 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 09:34:23 +0000
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
X-Inumbo-ID: 4447c46b-fa16-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRFR/mOq552L5wgb1XLOo2zPC3fxeM/Ns4sXOcT08VM=;
 b=Burklm+NhqoJGnraMp1mNOIyvgQvFlA8EfLoL/aOzumn3Q57i3GqMFIGXe0BnQck03XFm315WcVGltMDAtzpdJ/6zCrhWdGmOKKvLD9YaXAGxfJinrvb5bioDBtvdOyhWV8DkBlzxKvP//PdVvGf7+Muwny9QrlwShUJsKU+gfc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 983b534f4a6f0110
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwHOFCOwuxmOagW2vH0jRfYjqY1hFeLMWchi06dTuk13RYuOG0nbwavgtDAkbEHl9S97PsQNivqWX0cWrhUkobc2ki9wJXdpb9wStvh0YeKld72EQ0GMe39agpfwjYqETl411VrYti+mDjuhj9FXHq9sUfdpzdvnR1JYi1BzC/kVCyd04i4+QqT0TINknbIsb11vgaAko071G4FoKxEUyDV+X9dQU629MQwM0ICUtXBgyR98Kc5Cr8IxXmsfVDUkLUEfy/i8G8pXwCSVU7KzFb2bkI2tWzScGShnoT7jW9BcJ4x+ImZAm9xd3cucV90NBw+0cgSUL7m8nxi3VcPoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRFR/mOq552L5wgb1XLOo2zPC3fxeM/Ns4sXOcT08VM=;
 b=KYlFxgEfyZvsFk1aCdIrL12LUlrJPKJhT+J1gfA1yicdfToGVRnWET673v0C5zzMOXActlAnco7rWqE21+QvAJ3GAtr7j/BXu9iHJf0GfCVp7R5v9MBxQ/n+Qw5MPDzod1nHfLpuIH57KatwpUZyrHDIlOmzphOuMxonM+Lgx+wpMFIP0Nz1IjLcTYHIxLpAtfWmG+O6P0gbMtGi9oSk7ypMnOZxyYy5UdAViZYOQ44//zQcP09SsElxc2YJU04TKaesmQsqGbCbdsVcC6i0JX6TbeyOi/kSrmOFqy23sMocDkjyMFzVzfVZPp3ba5SRISHAdguoAnl51l+OhYcvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRFR/mOq552L5wgb1XLOo2zPC3fxeM/Ns4sXOcT08VM=;
 b=Burklm+NhqoJGnraMp1mNOIyvgQvFlA8EfLoL/aOzumn3Q57i3GqMFIGXe0BnQck03XFm315WcVGltMDAtzpdJ/6zCrhWdGmOKKvLD9YaXAGxfJinrvb5bioDBtvdOyhWV8DkBlzxKvP//PdVvGf7+Muwny9QrlwShUJsKU+gfc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 12/15] build: avoid Config.mk's CFLAGS
Thread-Topic: [XEN PATCH 12/15] build: avoid Config.mk's CFLAGS
Thread-Index: AQHZjZZXWyxFq0oXWE+6zQEJ2UT2c69pKp4A
Date: Wed, 24 May 2023 09:34:23 +0000
Message-ID: <6F4AA7BA-C515-4DE0-92CF-D8234C8B852D@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-13-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-13-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9935:EE_|AM7EUR03FT063:EE_|AS8PR08MB9242:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2346f8-57bd-4c7f-4a05-08db5c3a177b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kZsUH4qlL7A95IdoKPxEjod/5KQ3XhNoKEL3bIQBe7xd0HvyvM9ECBVc2tKettCzxplMNrJJTrkGL19GnS/V2KkTDD0ye2wklq/3am+xzAj+QmGVEQRpuy/76nB3L45oU3iB5kPNYh/i7b8vIceO1pATAeU8RMk1m09I6QggNBwOZ9gm17qoxRx5hJYz+qWt/Ntb30HLvejDR8OhgitTP9S5wO4DRjqA1irTrdEkLcD4EvpWhN/C/2HZzE4v13DI84Ui4vGjlqFD3zgZvcL9y981EonXxPZZIrFMp5Hvm5Sp3phhPq15vjfFlgFr8Jif26jOXvwpDVZN28jFqV0UmNjs6dfC4fVnW8/Y9F5ChUOQxpQuhmyEBoGmcnqOOxhIXFNUDB2QDOOuAcvjc5U+ddnnZPiIvbq/+/VOkPTDmB5l9sF/Z3qHI/ANHDmcktDg3+FJ3U0lbA1DjSv3qlK/0zQWKOm79V5t4WyxsuvmqwO2gbERB+67f+zMECsK46wAHzkkzmvXbL6W4GVy3U9pZCoQlTooNIpYDs8haohMrHlkC+hqREcAKjwyge1RxBkviqqubbFBMFwu1ENwya5fVpnz1hmUlqWw5Mz6vC11Fly6no3Rw9klsq2DjOMcR4W0OlsmJ0tP13smnms+5nEknA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199021)(6916009)(66556008)(66446008)(66946007)(66476007)(64756008)(4326008)(76116006)(91956017)(6486002)(41300700001)(71200400001)(316002)(54906003)(5660300002)(8936002)(8676002)(478600001)(38070700005)(86362001)(38100700002)(122000001)(26005)(33656002)(6506007)(6512007)(7416002)(186003)(53546011)(83380400001)(2906002)(4744005)(2616005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B76962B08763F34294433149BD29DAE2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9935
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	16f1af64-c036-4de6-417a-08db5c3a0f25
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DFk4Z/yajKu0ityyvxuBdpB9W0LSl0HIqYGw5PZKSXZOOV1ZG11NZQUXDwVh0+qNyN2BnCPv0a7KLX2H8Iub0Yy+wgT6lycJtRYK2tNXEWi+U2ApDReHXALH37gMi7xop1M/etpu8pkV/iyMl8YV6hGRqfNlUOOt3x8U3u18Vq2Wo8ez3/htGqlsjUUdA46bvDq+rmU2zb52ubLg3kKP964BeoH2Y7nIEARh3xT0YndFR8Amp7iRzumuwDkqeooRBWwq51NlMPOmgHt4vL2Uz7Fa6WkhgTyFpegYJW4aCD4lgOJAWf+ZEqh0s6JpMArwSZYH5Sx6OKGyl3k/VMd0g3RUl8Wi30ViV6zipB9SmyekID7Uaa0rlF9MOUgo0VZibfEz5BxhtDOM5wWm32yyIeoo3QZfnRzfEhAKZcfxFYiIheMgR1fpDf3bZKzftiK4cpLuTjN6cXful4EhvHh1bitb161MWudBYoYiseNU/LsSROVBHgYp1J/GAU5FrX+ST1IJnDOvfCGw+aR/ivfK2QlpV4okSG2pIh0K9O991qVd95GVad8/ezY19XLXVV7wwU/3GG06Di3Gb7eg2PGO8gU3GKtIZ34B1+zBic1PsdKURdDOwAnmCqWnAuWBz35ixQb0h3W3K5daRbLLlT2Au5AO9SMt98qt8z1t3byKo2IulosgBq67HERrZ4ca94sxU6FShbru0Syuw0tOnldUSk4TCIlH3AFtT7yF4iJ6e7sO2wzIXbuuGT2gwP/f80kn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(33656002)(47076005)(53546011)(83380400001)(81166007)(356005)(82740400003)(26005)(6512007)(36756003)(6506007)(107886003)(2616005)(40480700001)(40460700003)(186003)(2906002)(336012)(478600001)(316002)(70206006)(4326008)(70586007)(6486002)(86362001)(41300700001)(5660300002)(6862004)(8676002)(8936002)(82310400005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 09:34:37.4246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2346f8-57bd-4c7f-4a05-08db5c3a177b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9242

DQoNCj4gT24gMjMgTWF5IDIwMjMsIGF0IDE3OjM4LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBUaGUgdmFyaWFibGUgJChDRkxBR1MpIGlz
IHRvbyBvZnRlbiBzZXQgaW4gdGhlIGVudmlyb25tZW50LA0KPiBlc3BlY2lhbGx5IHdoZW4gYnVp
bGRpbmcgYSBwYWNrYWdlIGZvciBhIGRpc3RyaWJ1dGlvbi4gT2Z0ZW4sIHRob3NlDQo+IENGTEFH
UyBhcmUgaW50ZW5kZWQgdG8gYmUgdXNlIHRvIGJ1aWxkIHVzZXIgc3BhY2VzIGJpbmFyaWVzLCBu
b3QgYQ0KDQpOSVQ6IHMvdXNlL3VzZWQvDQoNCkJ1dCBJ4oCZbSBub3QgYSBuYXRpdmUgc3BlYWtl
ciBzbyBJIG1pZ2h0IGJlIHdyb25nIG9uIHRoaXMNCg0KPiBrZXJuZWwuIFRoaXMgbWVhbiBwYWNr
YWdlciBuZWVkcyB0byB0YWtlcyBleHRyYSBzdGVwcyB0byBidWlsZCBYZW4gYnkNCj4gb3ZlcnJp
ZGluZyB0aGUgQ0ZMQUdTIHByb3ZpZGVkIGJ5IHRoZSBwYWNrYWdlIGJ1aWxkIGVudmlyb25tZW50
Lg0KPiANCj4gV2l0aCB0aGlzIHBhdGNoLCB3ZSBhdm9pZCB1c2luZyB0aGUgdmFyaWFibGUgJChD
RkxBR1MpLiBBbHNvLCB0aGUNCj4gaHlwZXJ2aXNvcidzIGJ1aWxkIHN5c3RlbSBoYXZlIGNvbXBs
ZXRlIGNvbnRyb2wgb3ZlciB3aGljaCBDRkxBR1MgYXJlDQo+IHVzZWQuDQo+IA0KPiBObyBjaGFu
Z2UgaW50ZW5kZWQgdG8gWEVOX0NGTEFHUyB1c2VkLCBiZXNpZGUgc29tZSBmbGFncyB3aGljaCBt
YXkgYmUNCj4gaW4gYSBkaWZmZXJlbnQgb3JkZXIgb24gdGhlIGNvbW1hbmQgbGluZS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29t
Pg0KPiAtLS0NCj4gDQo+IE5vdGVzOg0KPiAgICBUaGVyZSdzIHN0aWxsICQoRVhUUkFfQ0ZMQUdT
X1hFTl9DT1JFKSB3aGljaCBhbGxvd3MgdG8gYWRkIG1vcmUgQ0ZMQUdTDQo+ICAgIGlmIHNvbWVv
bmUgYnVpbGRpbmcgWGVuIG5lZWRzIHRvIGFkZCBtb3JlIENGTEFHUyB0byB0aGUgaHlwZXJ2aXNv
cg0KPiAgICBidWlsZC4NCj4gDQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZh
bmNlbGx1QGFybS5jb20+DQpUZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVA
YXJtLmNvbT4NCg0KDQoNCg==

