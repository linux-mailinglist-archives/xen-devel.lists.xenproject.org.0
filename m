Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CF24B83FB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:25:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273831.469112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGYs-0002Sx-P3; Wed, 16 Feb 2022 09:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273831.469112; Wed, 16 Feb 2022 09:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGYs-0002R4-LH; Wed, 16 Feb 2022 09:25:22 +0000
Received: by outflank-mailman (input) for mailman id 273831;
 Wed, 16 Feb 2022 09:25:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXi8=S7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nKGYr-0002Qy-9P
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:25:21 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe05::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bad6778-8f0a-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 10:25:19 +0100 (CET)
Received: from DU2PR04CA0087.eurprd04.prod.outlook.com (2603:10a6:10:232::32)
 by DB9PR08MB7115.eurprd08.prod.outlook.com (2603:10a6:10:2c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Wed, 16 Feb
 2022 09:25:16 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::65) by DU2PR04CA0087.outlook.office365.com
 (2603:10a6:10:232::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Wed, 16 Feb 2022 09:25:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 09:25:16 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Wed, 16 Feb 2022 09:25:16 +0000
Received: from a015a75e0a35.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4CE8AF34-3DB5-492C-A371-7600F14D041A.1; 
 Wed, 16 Feb 2022 09:25:09 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a015a75e0a35.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Feb 2022 09:25:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB5240.eurprd08.prod.outlook.com (2603:10a6:20b:ec::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 09:25:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.4995.014; Wed, 16 Feb 2022
 09:25:07 +0000
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
X-Inumbo-ID: 5bad6778-8f0a-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERvVUvPQYrt93/XLk61uDEFALhwDIgk3XgZP011Jyg0=;
 b=PnQSdPg+1TOWC8dBTZaSMbVJXZ7B4el/G6FAGbes1VYXD9/uPiOc0vH6NgHisMD/IoD/gI98UZQlLIiZkO0p2QNkmazen0Jw3eXIXL5Jz3R2zly2Xybm92ntm8iXnz9Zu8I90bgVWnMtoXdmDesGMcVG348i2vaCsMpc6gemL9w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a65327a62a2ce8a6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMn3EojuW8uCH99oY/OIY0SKPYE5hTXyaZLzoVwHida1iWPUIwlI+T1nlLSYoZ015rBdUlV98Py8hAgwgThzU6H7peta4LOYZp3xxXAVuLzYddyuZyWTaeyAl70npnLySuwudwZMbQSdeLhK26BdzurY4jP2lHJr9eQ2O0IVk22sSsVqCKJQxGnLZxQqmITrY5P0ZbGknKo4xPz0atkCENCr04IL2w7iRXH3a8KIaZfNvFooPqtV2500hhwv0uY3HFkfHl7wr/4nCCGAAFzIJkYB/gGSSGCI5/n438GlrsEjmdqBRXfUC3ihpoLfvPAi12Om9ypa0YyFrZ+d611lqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERvVUvPQYrt93/XLk61uDEFALhwDIgk3XgZP011Jyg0=;
 b=WbJxZ3ME2ZzE2CXQh3hgWo+Gv5WDlcBQ3T9x6hf8/MDtfo2pB0GAUxEQ9/IyoS9FcC0GpVHqtf8q8rhK3BxGYqbXzaB2uznF0Mv/hVXFR29anBdJS0X5bHwCTflHWXR/vcerBV0J1S1GUvqrCerlkRmkbHdKaqIg528U2Q9NrYdNOIg7zN1QvdHqBiLVfeXJ2s/qKHgpS/rGZoToJWPMPvQ71qIHOTrtSL0msk1nC7AvBQFsrhqvrkFmeHKcGfkv9jFHeZmPiXMqKlLcKqo3PPC6uXxmfgDJZ1mLS7//mvN9Sg7Qdw2EQQwsFcwAbyNKOyt/GjdZ+DThfs5y4Sm9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERvVUvPQYrt93/XLk61uDEFALhwDIgk3XgZP011Jyg0=;
 b=PnQSdPg+1TOWC8dBTZaSMbVJXZ7B4el/G6FAGbes1VYXD9/uPiOc0vH6NgHisMD/IoD/gI98UZQlLIiZkO0p2QNkmazen0Jw3eXIXL5Jz3R2zly2Xybm92ntm8iXnz9Zu8I90bgVWnMtoXdmDesGMcVG348i2vaCsMpc6gemL9w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] lib: extend ASSERT()
Thread-Topic: [PATCH v2] lib: extend ASSERT()
Thread-Index: AQHYE4sUwaOwwc8tCU249z99fRIDqqyVNw0AgADQBoA=
Date: Wed, 16 Feb 2022 09:25:07 +0000
Message-ID: <3F58400B-5151-42F2-8F39-109DDF50EE1E@arm.com>
References: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
 <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
In-Reply-To: <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: aa437432-4161-4266-651c-08d9f12e3dfe
x-ms-traffictypediagnostic:
	AM6PR08MB5240:EE_|DB5EUR03FT029:EE_|DB9PR08MB7115:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7115F6ACD4AFAF22A0AE9CD29D359@DB9PR08MB7115.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TP+lNWot5ZJTyVuDq+aNL1smdPwITR5WC1DBQEEObXY0GtIfPurpDbAF/7f+V8ygG3pW7RgMbEMiL1ib2P/0UHE1aAjM8XfVvre0qxXJsNFI/VvSbLJiyJU14oJZOcP/COCeKa+5yHTTjbxcgPuwM03Q/N8HNjBtpMuxwQ7iuITmOzZFnfZHSmPL3e9kOS/8YU8qssN5UH1db16Dyet0U4Rt/wkobJ172+UTWZk6WkTDhrF7Dg3cv52gJs33faDuPqT15zVfmb5IzdeYF0Mbr19D2z6KMW6BQ9Lh3xLfFZiAjHU7NZiOde4MmmYIk4s5MOTGdqQXX6QZKbK/F/LkST7GNWPcs3xrZeOnw506MrL9GMLIK2OaFlJXr/8m7IWJyMU+COdh1IkQZqSh3SvqvtmnQaBQfNTU+fqGN8q5ZP/FBUQ6bCjcXDkXRsSwg/wCWxqNAFWqCPkkWWdO03KXqpqoCubodpUl6hkwo189fBGTnOC9jhPNg/fdyzss/w1fTdeo4sYbVkLQgCGDl2FjVVtIVTD9A89Hs6Ijfj3foa/J/yekUvcn3Q0GWncEOkNz2gZkGPXZQyu/RyBaJ6kONRq+vgDCE90blK02kP1AA7UTrq6sjtspwc+/nRFnblM6knggBBbn76yNecLS0dHGM73q5kyZrDpIW6XQ9JjpGXggkjaDKfWAhvjtX8rxmhuhtTXPsEeAcm/r5z8ep4PKWrgw1iDN+Kvd4qT4otVOzIebVzLjJ2eGOwa1wW7GKo68
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(6506007)(66446008)(4326008)(8936002)(76116006)(53546011)(6512007)(26005)(2616005)(83380400001)(186003)(2906002)(508600001)(71200400001)(91956017)(38100700002)(66946007)(66556008)(54906003)(6916009)(33656002)(122000001)(38070700005)(8676002)(66476007)(86362001)(64756008)(316002)(36756003)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D5AE8AA7A8A7B46BEED08BCE5324284@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5240
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d34d5492-80ad-4403-6572-08d9f12e38b1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u+B47gOEDbTZ1E08XwMDK0Redpu/sQrxLLqwBtfRPOl0/X57h/49145YjgtLtn/4ZJijfnJUu3iXzcNtRWPgYRff0H7qbUgVg9DZZ2siB21WIh8gcMu0l752A+wC0XOMS1BgZwNNPKEtsEJE0TxfC6VshPwij0qfsemH/9jQ8eJDYveRwX5MBKS1fvxmOk6jCqa4ec40Plf4DLnxP2vXPFKRnYwsjY3RL5plTqRo0hxAL4mEEs1GJRBuhdYNWCY8H3/DO2TvZ8+i7Bd+/8wUMBnrFMhpSF5ouvNzD+oUgQ2DuH9jiDkd8an10bq6AI9VWMkrewa6LI1xnLG84081h2/c0fT4fIt26yD+Zg6K5YDp7tQNsQ+APZOlU9EL62oCVfYA8OkLs05LVpnOWrpL7pNcl+OyrHYE1bLNLgn+OWjwEXLF09RyJh1geDkF9aJXUnbB1DydaG8faMJJT3A+0UOQRTk57dlQtOdbrXWX5l8um4k8FJAPP168dLvKgz3XBXs3o7+lf1zr83jZ0CCBsEbjiSsvXevO/MYjuZcBl/madahwq3aHh5QD2PmlDAJKLGhd6ztKg0Mrd2sj/tx+NzGolSOSBfna4P7PS2jeNjm2pG1ALCXjW4CNp2atKCcHr/hDVs3Ukpo2443RkPmbwEuAi3qvLESIc5a3d46JrthhzdX2qS9Jm0pllcguj4HV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(6862004)(2616005)(316002)(356005)(81166007)(6486002)(107886003)(4326008)(26005)(70206006)(70586007)(186003)(336012)(33656002)(2906002)(86362001)(53546011)(8676002)(6512007)(54906003)(36860700001)(40460700003)(508600001)(82310400004)(8936002)(83380400001)(6506007)(5660300002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:25:16.0507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa437432-4161-4266-651c-08d9f12e3dfe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7115

SGkgSmFuLCBKdWxpZW4sDQoNCj4gT24gMTUgRmViIDIwMjIsIGF0IDIxOjAwLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+ICgrIEJlcnRyYW5kKQ0KPiANCj4gSGkg
SmFuLA0KPiANCj4gT24gMjcvMDEvMjAyMiAxNDozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBU
aGUgaW5jcmVhc2luZyBhbW91bnQgb2YgY29uc3RydWN0cyBhbG9uZyB0aGUgbGluZXMgb2YNCj4+
ICAgICBpZiAoICFjb25kaXRpb24gKQ0KPj4gICAgIHsNCj4+ICAgICAgICAgQVNTRVJUX1VOUkVB
Q0hBQkxFKCk7DQo+PiAgICAgICAgIHJldHVybjsNCj4+ICAgICB9DQo+PiBpcyBub3Qgb25seSBs
b25nZXIgdGhhbiBuZWNlc3NhcnksIGJ1dCBhbHNvIGRvZXNuJ3QgcHJvZHVjZSBpbmNpZGVudA0K
Pj4gc3BlY2lmaWMgY29uc29sZSBvdXRwdXQgKGV4Y2VwdCBmb3IgZmlsZSBuYW1lIGFuZCBsaW5l
IG51bWJlcikuDQo+IA0KPiBTbyBJIGFncmVlIHRoYXQgdGhpcyBjb25zdHJ1Y3Qgd2lsbCBhbHdh
eXMgcmVzdWx0IHRvIGEgbWluaW11bSA1IGxpbmVzLiBXaGljaCBpcyBub3QgbmljZS4gQnV0IHRo
ZSBwcm9wb3NlZCBjaGFuZ2UgaXMuLi4NCj4gDQo+PiBBbGxvdw0KPj4gdGhlIGludGVuZGVkIGVm
ZmVjdCB0byBiZSBhY2hpZXZlZCB3aXRoIEFTU0VSVCgpLCBieSBnaXZpbmcgaXQgYSBzZWNvbmQN
Cj4+IHBhcmFtZXRlciBhbGxvd2luZyBzcGVjaWZpY2F0aW9uIG9mIHRoZSBhY3Rpb24gdG8gdGFr
ZSBpbiByZWxlYXNlIGJ1aWxkcw0KPj4gaW4gY2FzZSBhbiBhc3NlcnRpb24gd291bGQgaGF2ZSB0
cmlnZ2VyZWQgaW4gYSBkZWJ1ZyBvbmUuIFRoZSBleGFtcGxlDQo+PiBhYm92ZSB0aGVuIGJlY29t
ZXMNCj4+ICAgICBBU1NFUlQoY29uZGl0aW9uLCByZXR1cm4pOw0KPj4gTWFrZSBzdXJlIHRoZSBj
b25kaXRpb24gd2lsbCBjb250aW51ZSB0byBub3QgZ2V0IGV2YWx1YXRlZCB3aGVuIGp1c3QgYQ0K
Pj4gc2luZ2xlIGFyZ3VtZW50IGdldHMgcGFzc2VkIHRvIEFTU0VSVCgpLg0KPj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gLS0tDQo+PiB2MjogUmVu
YW1lIG5ldyBtYWNybyBwYXJhbWV0ZXIuDQo+PiAtLS0NCj4+IFJGQzogVGhlIHVzZSBvZiBhIGNv
bnRyb2wgZmxvdyBjb25zdHJ1Y3QgYXMgYSBtYWNybyBhcmd1bWVudCBtYXkgYmUNCj4+ICAgICAg
Y29udHJvdmVyc2lhbC4NCj4gDQo+IGluZGVlZCBjb250cm92ZXJzaWFsLiBJIGZpbmQgdGhpcyBx
dWl0ZSBjb25mdXNpbmcgYW5kIG5vdCBzb21ldGhpbmcgSSB3b3VsZCByZXF1ZXN0IGEgdXNlciB0
byBzd2l0Y2ggdG8gaWYgdGhleSB1c2UgdGhlIGxvbmdlciB2ZXJzaW9uLg0KPiANCj4gVGhhdCBz
YWlkLCB0aGlzIGlzIG1haW5seSBhIG1hdHRlciBvZiB0YXN0ZS4gU28gSSBhbSBpbnRlcmVzdGVk
IHRvIGhlYXIgb3RoZXJzIHZpZXcuDQo+IA0KPiBJIGhhdmUgYWxzbyBDQ2VkIEJlcnRyYW5kIHRv
IGhhdmUgYW4gb3BpbmlvbnMgZnJvbSB0aGUgRnVzYSBHcm91cCAoSSBzdXNwZWN0IHRoaXMgd2ls
bCBnbyBiYWNrd2FyZCBmb3IgdGhlbSkuDQoNClRoYW5rcyBhbmQgaGVyZSBpcyBteSBmZWVkYmFj
ayBpbiByZWdhcmRzIHRvIEZ1c2EgaGVyZS4NCg0KTW9zdCBjZXJ0aWZpY2F0aW9uIHN0YW5kYXJk
cyBhcmUgZm9yYmlkZGluZyBjb21wbGV0ZWx5IG1hY3JvcyBpbmNsdWRpbmcNCmNvbmRpdGlvbnMg
KGFuZCBxdWl0ZSBhIG51bWJlciBhcmUgZm9yYmlkZGluZyBzdGF0aWMgaW5saW5lIHdpdGggY29u
ZGl0aW9ucykuDQpUaGUgbWFpbiByZWFzb24gZm9yIHRoYXQgaXMgTUNEQyBjb3ZlcmFnZSAoY29u
ZGl0aW9uL2RlY2lzaW9ucyBhbmQgbm90IG9ubHkNCmNvZGUgbGluZSkgaXMgbm90IHBvc3NpYmxl
IHRvIGRvIGFueW1vcmUgZG93biB0byB0aGUgc291cmNlIGNvZGUgYW5kIGhhcyB0byBiZQ0KZG9u
ZSBkb3duIHRvIHRoZSBwcmUtcHJvY2Vzc2VkIGNvZGUuDQoNCk91dCBvZiBGdXNhIGNvbnNpZGVy
YXRpb25zLCBvbmUgdGhpbmcgSSBkbyBub3QgbGlrZSBpbiB0aGlzIHNvbHV0aW9uIGlzIHRoZSBm
YWN0IHRoYXQNCnlvdSBwdXQgc29tZSBjb2RlIGFzIHBhcmFtZXRlciBvZiB0aGUgbWFjcm8gKHRo
ZSByZXR1cm4pLg0KDQpUbyBtYWtlIHRoaXMgYSBiaXQgYmV0dGVyIHlvdSBjb3VsZCBwdXQgdGhl
IHJldHVybiBjb2RlIGFzIHBhcmFtZXRlcg0KaW5zdGVhZCBvZiBoYXZpbmcg4oCccmV0dXJuIENP
REXigJ0gYXMgcGFyYW1ldGVyLg0KDQpBbiBvdGhlciB0aGluZyBpcyB0aGF0IFhlbiBBU1NFUlQg
YWZ0ZXIgdGhpcyBjaGFuZ2Ugd2lsbCBiZSBxdWl0ZSBkaWZmZXJlbnQgZnJvbQ0KYW55IEFTU0VS
VCBmb3VuZCBpbiBvdGhlciBwcm9qZWN0cyB3aGljaCBjb3VsZCBtYWtlIGl0IG1pc2xlYWRpbmcg
Zm9yIGRldmVsb3BlcnMuDQpNYXliZSB3ZSBjb3VsZCBpbnRyb2R1Y2UgYW4gQVNTRVJUX1JFVFVS
TiBtYWNyb3MgaW5zdGVhZCBvZiBtb2RpZnlpbmcgdGhlDQpiZWhhdmlvdXIgb2YgdGhlIHN0YW5k
YXJkIEFTU0VSVCA/DQoNClJlZ2FyZHMNCkJlcnRyYW5kDQoNCj4gDQo+PiAtLS0gYS94ZW4vY29t
bW9uL21lbW9yeS5jDQo+PiArKysgYi94ZW4vY29tbW9uL21lbW9yeS5jDQo+PiBAQCAtODI2LDEx
ICs4MjYsNyBAQCBpbnQgeGVubWVtX2FkZF90b19waHlzbWFwKHN0cnVjdCBkb21haW4NCj4+ICAg
ICAgdW5pb24gYWRkX3RvX3BoeXNtYXBfZXh0cmEgZXh0cmEgPSB7fTsNCj4+ICAgICAgc3RydWN0
IHBhZ2VfaW5mbyAqcGFnZXNbMTZdOw0KPj4gIC0gICAgaWYgKCAhcGFnaW5nX21vZGVfdHJhbnNs
YXRlKGQpICkNCj4+IC0gICAgew0KPj4gLSAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+
PiAtICAgICAgICByZXR1cm4gLUVBQ0NFUzsNCj4+IC0gICAgfQ0KPj4gKyAgICBBU1NFUlQocGFn
aW5nX21vZGVfdHJhbnNsYXRlKGQpLCByZXR1cm4gLUVBQ0NFUyk7DQo+PiAgICAgICAgaWYgKCB4
YXRwLT5zcGFjZSA9PSBYRU5NQVBTUEFDRV9nbWZuX2ZvcmVpZ24gKQ0KPj4gICAgICAgICAgZXh0
cmEuZm9yZWlnbl9kb21pZCA9IERPTUlEX0lOVkFMSUQ7DQo+PiBAQCAtOTIwLDExICs5MTYsNyBA
QCBzdGF0aWMgaW50IHhlbm1lbV9hZGRfdG9fcGh5c21hcF9iYXRjaChzDQo+PiAgICAgICAqIGNh
bGwgZG9lc24ndCBzdWNjdW1iIHRvIGRlYWQtY29kZS1lbGltaW5hdGlvbi4gRHVwbGljYXRlIHRo
ZSBzaG9ydC1jaXJjdXQNCj4+ICAgICAgICogZnJvbSB4YXRwX3Blcm1pc3Npb25fY2hlY2soKSB0
byB0cnkgYW5kIGhlbHAgdGhlIGNvbXBpbGVyIG91dC4NCj4+ICAgICAgICovDQo+PiAtICAgIGlm
ICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApDQo+PiAtICAgIHsNCj4+IC0gICAgICAgIEFT
U0VSVF9VTlJFQUNIQUJMRSgpOw0KPj4gLSAgICAgICAgcmV0dXJuIC1FQUNDRVM7DQo+PiAtICAg
IH0NCj4+ICsgICAgQVNTRVJUKHBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSwgcmV0dXJuIC1FQUND
RVMpOw0KPj4gICAgICAgIGlmICggdW5saWtlbHkoeGF0cGItPnNpemUgPCBleHRlbnQpICkNCj4+
ICAgICAgICAgIHJldHVybiAtRUlMU0VROw0KPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpYi5o
DQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgNCj4+IEBAIC00OSwxMSArNDksMTMgQEAN
Cj4+ICAjZW5kaWYNCj4+ICAgICNpZm5kZWYgTkRFQlVHDQo+PiAtI2RlZmluZSBBU1NFUlQocCkg
XA0KPj4gKyNkZWZpbmUgQVNTRVJUKHAsIC4uLikgXA0KPj4gICAgICBkbyB7IGlmICggdW5saWtl
bHkoIShwKSkgKSBhc3NlcnRfZmFpbGVkKCNwKTsgfSB3aGlsZSAoMCkNCj4+ICAjZGVmaW5lIEFT
U0VSVF9VTlJFQUNIQUJMRSgpIGFzc2VydF9mYWlsZWQoInVucmVhY2hhYmxlIikNCj4+ICAjZWxz
ZQ0KPj4gLSNkZWZpbmUgQVNTRVJUKHApIGRvIHsgaWYgKCAwICYmIChwKSApIHt9IH0gd2hpbGUg
KDApDQo+PiArI2RlZmluZSBBU1NFUlQocCwgZmFpbHNhZmUuLi4pIGRvIHsgXA0KPj4gKyAgICAg
ICAgaWYgKCAhY291bnRfYXJncyhmYWlsc2FmZSkgfHwgdW5saWtlbHkoIShwKSkgKSB7IGZhaWxz
YWZlOyB9IFwNCj4+ICsgICAgfSB3aGlsZSAoIDAgKQ0KPj4gICNkZWZpbmUgQVNTRVJUX1VOUkVB
Q0hBQkxFKCkgZG8geyB9IHdoaWxlICgwKQ0KPj4gICNlbmRpZg0KPj4gIA0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

