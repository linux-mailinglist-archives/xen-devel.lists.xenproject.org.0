Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6BE729662
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 12:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545810.852409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Z51-0007UT-E4; Fri, 09 Jun 2023 10:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545810.852409; Fri, 09 Jun 2023 10:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Z51-0007R6-B7; Fri, 09 Jun 2023 10:10:51 +0000
Received: by outflank-mailman (input) for mailman id 545810;
 Fri, 09 Jun 2023 10:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1HUa=B5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q7Z4z-00074H-Tl
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 10:10:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e81dfdb9-06ad-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 12:10:49 +0200 (CEST)
Received: from AM6P192CA0094.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::35)
 by GVXPR08MB7895.eurprd08.prod.outlook.com (2603:10a6:150:17::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 10:10:16 +0000
Received: from AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::a7) by AM6P192CA0094.outlook.office365.com
 (2603:10a6:209:8d::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.27 via Frontend
 Transport; Fri, 9 Jun 2023 10:10:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT058.mail.protection.outlook.com (100.127.140.247) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.29 via Frontend Transport; Fri, 9 Jun 2023 10:10:15 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Fri, 09 Jun 2023 10:10:15 +0000
Received: from 5851d6929970.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83374FCE-01C1-4DD1-8057-AFAEB7461237.1; 
 Fri, 09 Jun 2023 10:10:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5851d6929970.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Jun 2023 10:10:09 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VI1PR08MB5455.eurprd08.prod.outlook.com (2603:10a6:803:135::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 10:10:05 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%4]) with mapi id 15.20.6455.037; Fri, 9 Jun 2023
 10:10:05 +0000
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
X-Inumbo-ID: e81dfdb9-06ad-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WB6SQNBRWIkjfM8eI97XnBZEBH+3QYHy6iLNKMT4L8c=;
 b=rLwVyR166O53zVwOf26k08248yYcYYMrBL0x2OkH+rVdh8pGKe9mGrdWDTeYONeoJ/YpbSJYmjDlLSEXJp+BLaZTeqhL8bfS+1puhkE9NG+ZZFpJrUjMGvc00I8C6x/uU89Hf0lkA8/rJbCQAqAplASdaf2HGF7ecAdzc/xPnwY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: af53128548eff236
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqcYNDg89ZxH+eRGh3+pdjGoeOFQx1D0xJ1A4oRNuGbGOwCFp1njdOKudn9nUWkqAZeW7Nap1pjewBjyKgJCaveu2LMrWCdB+361cws6neODVRFMM8nQLHUGecNEN5mTmpUJncFI+0daV4j1tQzL65nK2R+1Nvu1Y8NbQeQCpL9TfxKKehSDZJZ9aPof1bwJ+OaKTirPj7yMC58HktRZMjaA8HqaEApO3nvL/UOhM2sfwff6zXR5trXSMwlswPWYN0kdabuwbKfTXPdJt1TdTSIZ2DfzIR3Zpvc3NYUla/ibEHG4YMCtPmbxoUrlcHVP6qRYRVGvcKKRH/LG5tSRlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WB6SQNBRWIkjfM8eI97XnBZEBH+3QYHy6iLNKMT4L8c=;
 b=mHYMaDPNbAJ9CE4RLefJblT/8S2a1iEzYUKv4JzorcqNYPHxUdi99xHWkVpTDYmv//L5/1kzCNS9TWPT0hFmyJIdmGL9NJepgwZ1TltAcKI1zMBlKNxEXIvEUMy9a/KF1bcd06p98/ZHyZDE6Umz+clImdhbdajEaBDQN2rGp1FV2IOlpP9Yi183tvG1qvKZvYos2qBDOTC2YVpw8cT3TE5YQt8gKdjkd+UdNGK9lkO7IbmiNd/4hl8fvBgh6NQ+AFZ+qXseULmVw94Lj099fXy7LSQ+KusgAmf1kMOBiN4OfogLpR49Y6leSWo0rIOI8WjCqUw6ulkT+NVKx010gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WB6SQNBRWIkjfM8eI97XnBZEBH+3QYHy6iLNKMT4L8c=;
 b=rLwVyR166O53zVwOf26k08248yYcYYMrBL0x2OkH+rVdh8pGKe9mGrdWDTeYONeoJ/YpbSJYmjDlLSEXJp+BLaZTeqhL8bfS+1puhkE9NG+ZZFpJrUjMGvc00I8C6x/uU89Hf0lkA8/rJbCQAqAplASdaf2HGF7ecAdzc/xPnwY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools: Move MASK_INSR to common-macros.h
Thread-Topic: [PATCH] tools: Move MASK_INSR to common-macros.h
Thread-Index: AQHZmjBTIpVZOkjuH06O82Z2wJSQ2a+BTMwAgADy7ICAAAD5AA==
Date: Fri, 9 Jun 2023 10:10:05 +0000
Message-ID: <57CC0EF8-1C97-4B0D-8FAD-8BEFD2929973@arm.com>
References: <20230608174014.2500954-1-andrew.cooper3@citrix.com>
 <9BAB3408-676E-4801-BCE1-4DB7BE081ADB@arm.com>
 <8c69d867-0c71-a6b2-39b7-30e82a71f97a@citrix.com>
In-Reply-To: <8c69d867-0c71-a6b2-39b7-30e82a71f97a@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VI1PR08MB5455:EE_|AM7EUR03FT058:EE_|GVXPR08MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b703e9-417a-4915-3ac9-08db68d1b8bf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PvhW5Cs41lafRnkiGRQRqsp8Of6cOVJUczHw4Oh1xiEQj68wwzy3yn+QK8lFX11MouRF0HZ6qaOWsUvPacd3aTxDJFYUX1RBGMYbEOZdVG038PZtJBfvdhOq2aIze2fiRkti1t+go+Od++bjZ5aw+b37/emHjahPbk5K1RMyhQc3QWWvG1qHXq9bfQU2QoNQY0qstjHnVfEm7TxN5IqJaG5a+TcTb+ds4JdV4T+yQ/IkK7gK56i5NGPIO09XGFAOA0yK0t2LHe3FSebJAdYYflcApRHJzGFeT8NkZLzmNBl+gFTLDBZde9PMdznOkebQAZgSjwjG3xvrMN5yp4LLSF8k89Z8iLY8D1/OZyI0XhZzfhSlJHOEm7zSLa3nzx4wHnUCBA8lI9oYwQjzmm0V8pfiNBkNrYB3pFgf0lrOjl5Yx4TWfG4YbuQAkECRBqMMcmEl2Kq/AtpFz84HtWEnf/7T5k9mAByGMOXDA1zGRfLWHn8YCXguXswiH9oBykyxLo8Tj8a1fZjBUg9gr5mqV6UrSMEvM3xRp6S/ZxN8Vf0SuTyUo8Sc6kmkh3EORI95UaGkyXXQTTmKS29j9Ck1NJMsUZ1zNEoAM2gyzCAjiUTWfFl8oVqeBeb7bBUFehxRZ+PcpmJPs27rPPidqyJevQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199021)(186003)(8936002)(8676002)(478600001)(54906003)(6486002)(41300700001)(316002)(5660300002)(91956017)(66946007)(26005)(66476007)(4326008)(66556008)(71200400001)(6916009)(66446008)(76116006)(53546011)(6506007)(6512007)(64756008)(2616005)(2906002)(38100700002)(38070700005)(122000001)(33656002)(86362001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D502457659ECA40B6A06E8D39F8342D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5455
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	141bce50-fd24-4ab1-6c5b-08db68d1b23f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q+z/pAgpHpORtwQSTv952nPkObeVh3R3Qi6YxmciQ5lSrGkY8F+Bkj/rGUtBd9e2sB+8w4hlGUFb2PnZHIoDI6M7H4xFASGNMSiZAGqDWo29T4U67meW799jM5gvNMoOLQ7cjoXaYgQCdePKVewyf9+ABkviJNcz5boh/S7qCIMQRBKiBnC612VJlwpeNK8JS0ughU4Zb/q9WVXoodF254PTf/pj0kVv1r43sNUCmbLI1vTO18wJQBv/wnO97IkE4B3Lj5xDpPuB049HC0WWr7tVhivalzAlUuD8Zu14B7DF1VNe66WmM3cr1Ao5V5JgyZLTFLA1P+rh/FM36SUmZKf7UAY4S5zL2ad7huH4gCka/nSDSCW7SOD/Fp6aKP8AP10op8sJ270BVV9A1BEZmyTQUKR9GX+olHcC+sPNiMi53N9qiR62XDTwmArqoEcmUdjjbzOoiNDcK62SCZ2rKuVFoK5hpvrUejrTlL9MYz5unuVF0V/mFO0FiS7wQyB48kReB69Z4qVw8f6e0OdLvt8V+X0geuBsUM8h5+vqXwIL26bEZ0v5JbqHEG3ROAbGYWckbMMNrq364/5wdRPdttLu7oaySPo3GWWW+QlTxgw1ZqLtqxfF77cRsntNgTxTR0o3haWbkFOe4CX1G5RfCnKUVo+yGUYuKj8v2NB5yf0BercW61S+Tfn7VCx8S419xrC8CcMmP9hy4vEuW4kPmWi3ZJR8HYif8+5Dj9wZQ8fnpO3npA4sTq3s3ji/Sd2h
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(70206006)(70586007)(6862004)(8676002)(5660300002)(8936002)(36756003)(4326008)(54906003)(478600001)(40460700003)(316002)(41300700001)(6486002)(40480700001)(53546011)(82740400003)(81166007)(356005)(2616005)(6512007)(186003)(6506007)(26005)(47076005)(36860700001)(86362001)(82310400005)(2906002)(336012)(33656002)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 10:10:15.9425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b703e9-417a-4915-3ac9-08db68d1b8bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7895

DQoNCj4gT24gOSBKdW4gMjAyMywgYXQgMTE6MDYsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gMDgvMDYvMjAyMyA4OjM3IHBtLCBMdWNh
IEZhbmNlbGx1IHdyb3RlOg0KPj4+IE9uIDggSnVuIDIwMjMsIGF0IDE4OjQwLCBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4+PiANCj4+PiBNQVNLX0VY
VFIoKSBhbmQgTUFTS19JTlNSKCkgYXJlIGEgbWF0Y2hpbmcgcGFpci4gIEtlZXAgdGhlbSB0b2dl
dGhlci4NCj4+PiANCj4+PiBGaXhlczogNTZhN2FhYTE2YmZlICgidG9vbHM6IGFkZCBwaHlzaW5m
byBhcmNoX2NhcGFiaWxpdGllcyBoYW5kbGluZyBmb3IgQXJtIikNCj4+IEkgZG9u4oCZdCB0aGlu
ayB0aGlzIHBhdGNoIGlzIGZpeGluZyBhIGJ1ZzoNCj4+IA0KPj4gIyMjIEZpeGVzOg0KPj4gDQo+
PiBJZiB5b3VyIHBhdGNoIGZpeGVzIGEgYnVnIGluIGEgc3BlY2lmaWMgY29tbWl0LCBlLmcuIHlv
dSBmb3VuZCBhbiBpc3N1ZSB1c2luZw0KPj4gYGBnaXQgYmlzZWN0YGAsIHBsZWFzZSB1c2UgdGhl
IGBGaXhlczpgIHRhZyB3aXRoIHRoZSBmaXJzdCAxMiBjaGFyYWN0ZXJzIG9mDQo+PiB0aGUgY29t
bWl0IGlkLCBhbmQgdGhlIG9uZSBsaW5lIHN1bW1hcnkuDQo+IA0KPiBUaGF0IGEgcG9vciBleHBs
YW5hdGlvbi4uLg0KPiANCj4gRml4ZXM6IGlzIGFib3V0IGNvcnJlY3Rpb25zIHRvIHRoZSBwYXRj
aCwgbm90IGJ1Z3MuDQo+IA0KPiA1NmE3YWFhMTZiZmUgaXMgdW5saWtlbHkgdG8gYmUgYmFja3Bv
cnRlZCwgYnV0IGlmIGEgZG93bnN0cmVhbSB3ZXJlIHRvDQo+IGJhY2twb3J0IHlvdXIgU1ZFIHBh
dGNoZXMsIEZpeGVzOiBpZGVudGlmeSBhbGwgb3RoZXIgcGF0Y2hlcyB0aGV5IG5lZWQNCj4gdG8g
dGFrZS4NCj4gDQo+IEZpeGVzOiB3YXMgc3BlY2lmaWNhbGx5IGludmVudGVkIHRvIGxldCB0b29s
aW5nIChwYXJ0aWFsbHkpIGF1dG9tYXRlIHRoZQ0KPiB0YXNrIGlmIGZpbmRpbmcgbmV3IHBhdGNo
ZXMgdG8gYmFja3BvcnQsIGJhc2VkIG9uIHdoYXQgaGFkIGFscmVhZHkgYmVlbg0KPiBiYWNrcG9y
dGVkLg0KDQpPayB0aGlzIG1ha2VzIHNlbnNlLCBzbyB0aGF0IGEgdG9vbCBjYW4gZWFzaWx5IHVu
ZGVyc3RhbmQgd2hlcmUgdG8gcHV0IHRoZSBmb2N1cy4NCg0KPiANCj4gQ29uY3JldGUgYnVncyBh
cmUgdGhlIG1ham9yaXR5IHJlYXNvbiBmb3IgYSBGaXhlcyB0YWcsIHN1cmUsIGJ1dCBub3QgdGhl
DQo+IG9ubHkgcmVhc29uLiAgSW4gdGhpcyBjYXNlLCBhIGRvd25zdHJlYW0gYWJzb2x1dGVseSBk
b2Vzbid0IHdhbnQgdG8gZ2V0DQo+IGludG8gYSBwb3NpdGlvbiB3aGVyZSB0aGVzZSBtYWNyb3Mg
YXJlbid0IHRvZ2V0aGVyIGluIGEgcGFpciwgYmVjYXVzZSBpdA0KPiB0aGVyZSB3aWxsIGJlIGEg
Y2FzZSBpbiB0aGUgZnV0dXJlIHdoZXJlIGl0IGNhdXNlcyBhIGJ1aWxkIGVycm9yLg0KPiANCj4+
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pg0KPj4gQnV0IGl0IG1ha2VzIHNlbnNlLCBzbyANCj4+IA0KPj4gUmV2aWV3ZWQtYnk6IEx1Y2Eg
RmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4gDQo+IFRoYW5rcy4gIEFzIHlvdSd2
ZSBhbHJlYWR5IGluZGljYXRlZCB0aGF0IHlvdSdyZSBvayB3aXRoIGZpeGluZyB1cA0KPiB4ODYt
ZW11bGF0ZS5oIGluIHYyLCBJJ2xsIHJldGFpbiB0aGlzLg0KDQpzdXJlLCB0aGFua3MgZm9yIGZp
eGluZyBpdA0KDQo+IA0KPiB+QW5kcmV3DQoNCg==

