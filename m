Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468526EBD38
	for <lists+xen-devel@lfdr.de>; Sun, 23 Apr 2023 07:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524926.815951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqSPE-0005tw-34; Sun, 23 Apr 2023 05:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524926.815951; Sun, 23 Apr 2023 05:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqSPD-0005r5-VR; Sun, 23 Apr 2023 05:36:59 +0000
Received: by outflank-mailman (input) for mailman id 524926;
 Sun, 23 Apr 2023 05:36:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jp6u=AO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pqSPB-0005qz-To
 for xen-devel@lists.xenproject.org; Sun, 23 Apr 2023 05:36:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da7f4043-e198-11ed-8611-37d641c3527e;
 Sun, 23 Apr 2023 07:36:54 +0200 (CEST)
Received: from AM6PR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::16) by PAWPR08MB9068.eurprd08.prod.outlook.com
 (2603:10a6:102:330::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Sun, 23 Apr
 2023 05:36:51 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::ae) by AM6PR01CA0039.outlook.office365.com
 (2603:10a6:20b:e0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32 via Frontend
 Transport; Sun, 23 Apr 2023 05:36:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.18 via Frontend Transport; Sun, 23 Apr 2023 05:36:51 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Sun, 23 Apr 2023 05:36:50 +0000
Received: from 144686ff64e6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 98DA1B89-C652-46D1-A6F7-613B01CC3A71.1; 
 Sun, 23 Apr 2023 05:36:45 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 144686ff64e6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 23 Apr 2023 05:36:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9324.eurprd08.prod.outlook.com (2603:10a6:10:41f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Sun, 23 Apr
 2023 05:36:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.032; Sun, 23 Apr 2023
 05:36:42 +0000
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
X-Inumbo-ID: da7f4043-e198-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNWTjDvMEVcE72DbqkZ3VeLOC1bIZOdNtEBHrdX2ho0=;
 b=jtfiQAtBRoEBzBlZqKrJdq/YUuXdoYwfhQ7jfeBzywqBiI4rTK5rPZbEqw3RBJ0knoeQWlj9OFSflE5egcXMQdRhWbBcMDB+1BuqAKK2LV6xfUuZAq4RqmpxElWWuR5Dq9Uzx0QNQmQWy7W0BtAxlzfu1uGfy2CiItOKXie5WJI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6ohWziq5y2xc8PFRhEscMmexQ+blJ+Km+g46oRlir7dqYsUhAPvFf2WhCeDMwKtOpPPoE4tflpUNU3UdSOX3UTfIHJayD4UUOCL3w0jxGq9w8pxLrR+mikQU9RNwewywvPjcRyJIGuQ0mgc43XlKLWGB7LElPc12vR2fsGmyKfcpQ6dvYBMyO8Bly9uNYGocKm1eQgiDNjYo1jxr3c/l2EfCF7aGYUAH5hEtG+uY9W/YZR7GvGPvP4CN6X9TUxh0Z+ipEO5qu9jwin8+KhXfT7E+Nqd2PjDkpTZyzZm/oaUKhiC2HL4mNJ8gaxAWU0rEQ4fAILwl6gLpO/juEDkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNWTjDvMEVcE72DbqkZ3VeLOC1bIZOdNtEBHrdX2ho0=;
 b=nKafVI0zyzFIvifOPKfsT2THQQ3frTQ2xJx3aYgwcAxhUaGGx+HAmTPEhrVoyhFFwFh8UZAvkomKE3KZovbjwSuQggfbzefR0icyjlz0nZTrBfhNrz5VL9i5sZAcqlmtELm8QpiAnnjUltoRfdlPtwR/Q3gsM1nhOpgS5Lp2pqUOiFE0RAM38D4kDN5xEjwI/i5Rs3O5P2qqvuw3Aum/wqDvHIsjskz1R4tS9+1ZE801a14R1JlTNGyUVW3FuJZs5+TSCH8/Pex86+hwY1usXBeWOq7uXnkCuuQKEYwX6EtG7F5vLbKEDW/3STrIiMGsFH5Jq5wzHP5mMF3yLJUzpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNWTjDvMEVcE72DbqkZ3VeLOC1bIZOdNtEBHrdX2ho0=;
 b=jtfiQAtBRoEBzBlZqKrJdq/YUuXdoYwfhQ7jfeBzywqBiI4rTK5rPZbEqw3RBJ0knoeQWlj9OFSflE5egcXMQdRhWbBcMDB+1BuqAKK2LV6xfUuZAq4RqmpxElWWuR5Dq9Uzx0QNQmQWy7W0BtAxlzfu1uGfy2CiItOKXie5WJI=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 03/17] xen/arm: implement node distance helpers for Arm
Thread-Topic: [PATCH v3 03/17] xen/arm: implement node distance helpers for
 Arm
Thread-Index: AQHZc3rmCrt50C+BaEmmIgaK9uo9ea80IxGAgAFPzpCAABDqgIAC3lpQ
Date: Sun, 23 Apr 2023 05:36:42 +0000
Message-ID:
 <AS8PR08MB7991576C75D0D4482595E7E292669@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
 <20230420112521.3272732-4-Henry.Wang@arm.com>
 <ac54e04c-58b7-d0c9-2443-bb09258c8bc8@suse.com>
 <AS8PR08MB79912F294EDAC48F835FBB7A92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bdf33169-4e29-8c50-ff76-16d05df81a14@suse.com>
In-Reply-To: <bdf33169-4e29-8c50-ff76-16d05df81a14@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A5FC215D96C98549A01D59CE5228927C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9324:EE_|AM7EUR03FT040:EE_|PAWPR08MB9068:EE_
X-MS-Office365-Filtering-Correlation-Id: 6010b7e4-2b39-4f5f-9c76-08db43bcbd47
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pr9QPEHDmdjnMB1ut6FkARwlEa/NTzMuLvatT0agdSViR1TdVgoYFTMVaeZqq5auIKLFeai6KUFCxy5RQxvTpadXx4BvhQ5FiDkXIdzWHWofFaBizFMIrLqjCL4tnEma1BqqRX9WM6aGOuHjJIlY/AMKBvrMGh0OxbqHGV80qPDp8J9EtydG/HULAZwQO1AIr9+OJYH39iEo+HKdVYQRjw57+T8HFfUNxhUo5Ou23Rahrp4Au366r/N8frFzGj5R+ANmnRL4XJ1beS6BB4MBuiArEUDv0vhnBaJe4xCwN0A8es6yxcOFKwbQA4rkkKktLeWzPM74Cjx4vp+R2qlDLvc5T+nnbKHW/ds6yRdU6LDfw+JEOcPWZ2iixJBZshzXEwV/J5Spq3nlHMcTSWP5dyn905qNHZx8kgcKEXHOvOOs8fAnyLbbycj0uf7wsj/gBOS7iW5NqoMs6wL+QlFD3qV2dbccArD1FMe+bADapduBddDb1zGZcCSf98i+vG65YqwXBRkxvZrY5tNVTVc+bd1XOec2ktVdD1hgXpaJrERcTLtWAATaHh4Zfq48W7fFbq97088kslFLhtMJ3jYgp8xBjl+3hn65j1kLJxzIv7dRzIlSNt7y70Nfs8Fr4IUU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199021)(316002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(86362001)(478600001)(71200400001)(55016003)(7696005)(8936002)(8676002)(38100700002)(52536014)(122000001)(5660300002)(54906003)(83380400001)(26005)(2906002)(9686003)(41300700001)(6506007)(38070700005)(33656002)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9324
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	63be9fd7-2342-4ef0-951e-08db43bcb818
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3Ky2JtIWC2KOpJcttu/MhwCCQAKOexm9Q8a3PLyLnWr/e4xbOBoxAfGXfKyl8+3pscAaynoJ6AFuUP3oWcoSzw22cvyimIDmNf+Cruhu8C03cUhQtP9gJsKLb+XRRpk8YlYaLD/rpEkF9K/9L+pu6ObrUXGCiCzBSLXzTkxJyKSHYzdsAFw9GNdYwIr01PU0yVlaBTXloLBN2g0aBFIleDeuHPeKfQc5BIHJmGgUhxGbO4sdu962aeC7yeBEnw+lQatcD1aoKFwoOPwCC+czC8Mfb2XOHbfJiE9o7tWX+GORVjFDXD5A4yvLSEXB0gjjgreFsvY97LcAf3310qbUJkYMhIHX7+uKer+Ms810AM9D/XyTEUnOD+21L0Yoj2JoXhMsPY5bJ+oVouymc+oNeUUSr0zONLJqZvpDwXbZPMqvqWBaZDZOJlPX67906dcEuGjhqMtsYIOWT0I91/69ke9bSByZoD5nBBvaFn5E35bnUDwd9OH6GZ+RzZR/ILCwSJiUQTuQMEoJZJ8kh6XA15pgJP8jh9GTuU1d51zKNKFAIjfiRQAw93wrn+z6GhTspSVns7jB5AfO0MBm5OOpZP1mepTzFBqiT6k5gkW6tJ+ku2H2ghPMfkz2e3iQ2qo2rDV5Q1hy1maKhH4ugQx7I3rORKuEQAZXwNr0NdBWkBQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(36840700001)(46966006)(8936002)(336012)(5660300002)(8676002)(52536014)(6862004)(36860700001)(47076005)(2906002)(83380400001)(9686003)(40480700001)(478600001)(55016003)(7696005)(54906003)(186003)(4326008)(316002)(6506007)(70586007)(41300700001)(70206006)(26005)(33656002)(86362001)(81166007)(82740400003)(356005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2023 05:36:51.0619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6010b7e4-2b39-4f5f-9c76-08db43bcbd47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9068

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwMy8xN10g
eGVuL2FybTogaW1wbGVtZW50IG5vZGUgZGlzdGFuY2UgaGVscGVycyBmb3INCj4gQXJtDQo+ID4+
IEhvd2V2ZXIsIGxvb2tpbmcgYXQgdGhlIGNvZGUgYmVsb3csIGRvbid0IHlvdSBtZWFuIHRvIGhh
dmUgdGhlIGFycmF5DQo+ID4+IHByZS1zZXQgdG8gYWxsIE5VTUFfTk9fRElTVEFOQ0U/DQo+ID4N
Cj4gPiAuLi5JIGFtIGEgYml0IHB1enpsZWQgYWJvdXQgd2h5IHByZS1zZXR0aW5nIHRoZSBhcnJh
eSB0byBhbGwNCj4gPiBOVU1BX05PX0RJU1RBTkNFIG1hdHRlcnMgaGVyZSwgYXMgSSB0aGluayB0
aGUgbm9kZSBkaXN0YW5jZSBtYXAgd2lsbA0KPiA+IGJlIHBvcHVsYXRlZCB3aGVuIHBhcnNpbmcg
dGhlIGRldmljZSB0cmVlIGFueXdheSBubyBtYXR0ZXIgd2hhdCB0aGVpcg0KPiA+IGluaXRpYWwg
dmFsdWVzLg0KPiANCj4gRnJvbSB0aGlzIHBhdGNoIGFsb25lIGl0IGRvZXNuJ3QgYmVjb21lIGNs
ZWFyIHdoZXRoZXIgaW5kZWVkIGFsbCBhcnJheQ0KPiBzbG90cyAoYW5kIG5vdCBqdXN0IG9uZXMg
Zm9yIHZhbGlkIG5vZGVzKSB3b3VsZCBiZSBwb3B1bGF0ZWQuIEkgdGhpbmsNCj4gdGhlIGNvZGUg
aW4gdGhlIHBhdGNoIGhlcmUgd291bGQgYmV0dGVyIG5vdCBtYWtlIGl0c2VsZiBkZXBlbmRlbnQg
b24NCj4gYmVoYXZpb3Igb2YgY29kZSBhZGRlZCBzdWJzZXF1ZW50bHkgKHdoaWNoIG1heSBjaGFu
Z2U7IHJlY2FsbCB0aGF0IGENCj4gc2VyaWVzIG1heSBiZSBjb21taXR0ZWQgaW4gcGllY2VzKS4N
Cg0KQ29ycmVjdCwgSSBhZ3JlZS4gSSBhZGRlZCBhIG51bWFfaW5pdF9kaXN0YW5jZSgpIGZ1bmN0
aW9uIChpbiBwYXRjaCAjMTIpIHRvDQpzZXQgYWxsIHZhbHVlcyB0byBOVU1BX05PX0RJU1RBTkNF
LiBUaGUgbnVtYV9pbml0X2Rpc3RhbmNlKCkgd2lsbCBiZQ0KY2FsbGVkIGluIHRoZSBiZWdpbm5p
bmcgb2YgbnVtYV9pbml0KCkuDQoNCj4gDQo+ID4+PiArdW5zaWduZWQgY2hhciBfX25vZGVfZGlz
dGFuY2Uobm9kZWlkX3QgZnJvbSwgbm9kZWlkX3QgdG8pDQo+ID4+PiArew0KPiA+Pj4gKyAgICAv
KiBXaGVuIE5VTUEgaXMgb2ZmLCBhbnkgZGlzdGFuY2Ugd2lsbCBiZSB0cmVhdGVkIGFzIHJlbW90
ZS4gKi8NCj4gPj4+ICsgICAgaWYgKCBudW1hX2Rpc2FibGVkKCkgKQ0KPiA+Pj4gKyAgICAgICAg
cmV0dXJuIE5VTUFfUkVNT1RFX0RJU1RBTkNFOw0KPiA+Pg0KPiA+PiBXb3VsZG4ndCBpdCBtYWtl
IHNlbnNlIHRvIGhhdmUgdGhlICJmcm9tID09IHRvIiBzcGVjaWFsIGNhc2UgYWhlYWQgb2YNCj4g
Pj4gdGhpcyAocmF0aGVyIHRoYW4gZnVydGhlciBkb3duKSwgdGh1cyB5aWVsZGluZyBhIHNlbnNp
YmxlIHJlc3VsdCBmb3INCj4gPj4gZnJvbSA9PSB0byA9PSAwPyBBbmQgZWxzZSByZXR1cm4gTlVN
QV9OT19ESVNUQU5DRSwgdGh1cyBoYXZpbmcgYQ0KPiA+PiBzZW5zaWJsZSByZXN1bHQgYWxzbyBm
b3IgYW55IGZyb20vdG8gIT0gMD8NCj4gPg0KPiA+IENvdWxkIHlvdSBwbGVhc2UgZWxhYm9yYXRl
IGEgYml0IG1vcmUgYWJvdXQgd2h5IDAgbWF0dGVycyBoZXJlPw0KPiANCj4gV2hlbiBOVU1BIGlz
IG9mZiwgdGhlcmUncyBvbmx5IG9uZSBub2RlIC0gbm9kZSAwLiBIZW5jZSAwIGhhcyBzcGVjaWFs
DQo+IG1lYW5pbmcgaW4gdGhhdCBjYXNlLg0KPiANCj4gPiBBcyBmcm9tIG15IHVuZGVyc3RhbmRp
bmcsDQo+ID4gKDEpIElmIGZyb20gPT0gdG8sIHRoZW4gd2Ugc2V0IHRoZSBkaXN0YW5jZSB0byBO
VU1BX0xPQ0FMX0RJU1RBTkNFDQo+ID4gd2hpY2ggcmVwcmVzZW50cyB0aGUgZGlhZ29uYWwgb2Yg
dGhlIG1hdHJpeC4NCj4gPiAoMikgSWYgZnJvbSBhbmQgdG8gaXMgaW4gdGhlIG1hdHJpeCByYW5n
ZSwgdGhlbiB3ZSByZXR1cm4NCj4gPiBub2RlX2Rpc3RhbmNlX21hcFtmcm9tXVt0b10uDQo+IA0K
PiBQcm92aWRlZCB0aGF0J3Mgc2V0IGNvcnJlY3RseS4gSU9XIHRoaXMgaW50ZXJhY3RzIHdpdGgg
dGhlIG90aGVyIGNvbW1lbnQNCj4gKHdoaWNoIHJlYWxseSBJIG1hZGUgb25seSBhZnRlciB0aGUg
b25lIGhlcmUsIGp1c3QgdGhhdCB0aGF0J3Mgb2YgY291cnNlDQo+IG5vdCB2aXNpYmxlIGZyb20g
dGhlIHJlcGx5IHRoYXQgSSBzZW50KS4NCj4gDQo+ID4gKDMpIE90aGVyIGNhc2VzIHdlIHJldHVy
biBOVU1BX05PX0RJU1RBTkNFLg0KPiANCj4gQW5kIHdoZW4gTlVNQSBpcyBvZmYsIGl0IHNob3Vs
ZCBiZSBOVU1BX05PX0RJU1RBTkNFIGluIF9hbGxfIG90aGVyDQo+IGNhc2VzLA0KPiBpLmUuIC4u
Lg0KPiANCj4gPiAgICAgIC8qIFdoZW4gTlVNQSBpcyBvZmYsIGFueSBkaXN0YW5jZSB3aWxsIGJl
IHRyZWF0ZWQgYXMgcmVtb3RlLiAqLw0KPiA+ICAgICAgaWYgKCBudW1hX2Rpc2FibGVkKCkgKQ0K
PiA+ICAgICAgICAgIHJldHVybiBOVU1BX1JFTU9URV9ESVNUQU5DRTsNCj4gDQo+IC4uLiB0aGlz
IHJldHVybiBpcyB3cm9uZyBpbiB0aGF0IGNhc2UgKGV2ZW4gaWYgaW4gcmVhbGl0eSB0aGlzIGxp
a2VseQ0KPiB3b3VsZG4ndCBtYXR0ZXIgbXVjaCkuDQoNClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0
aW9uISBJIHRoaW5rIEkgbm93IHVuZGVyc3RhbmQgOikgV291bGQgdGhpcyBkaWZmIGJlbG93DQps
b29rIGdvb2QgdG8geW91IHRoZW4/IEFwcHJlY2lhdGUgeW91ciBwYXRpZW5jZS4NCg0KdW5zaWdu
ZWQgY2hhciBfX25vZGVfZGlzdGFuY2Uobm9kZWlkX3QgZnJvbSwgbm9kZWlkX3QgdG8pDQogew0K
LSAgICAvKiBXaGVuIE5VTUEgaXMgb2ZmLCBhbnkgZGlzdGFuY2Ugd2lsbCBiZSB0cmVhdGVkIGFz
IHJlbW90ZS4gKi8NCisgICAgaWYgKCBmcm9tID09IHRvICkNCisgICAgICAgIHJldHVybiBOVU1B
X0xPQ0FMX0RJU1RBTkNFOw0KKw0KKyAgICAvKiBXaGVuIE5VTUEgaXMgb2ZmLCBhbnkgZGlzdGFu
Y2Ugd2lsbCBiZSB0cmVhdGVkIGFzIHVucmVhY2hhYmxlICgweEZGKS4gKi8NCiAgICAgaWYgKCBu
dW1hX2Rpc2FibGVkKCkgKQ0KLSAgICAgICAgcmV0dXJuIE5VTUFfUkVNT1RFX0RJU1RBTkNFOw0K
KyAgICAgICAgcmV0dXJuIE5VTUFfTk9fRElTVEFOQ0U7DQoNCiAgICAgLyoNCiAgICAgICogQ2hl
Y2sgd2hldGhlciB0aGUgbm9kZXMgYXJlIGluIHRoZSBtYXRyaXggcmFuZ2UuDQogICAgICAqIFdo
ZW4gYW55IG5vZGUgaXMgb3V0IG9mIHJhbmdlLCBleGNlcHQgZnJvbSBhbmQgdG8gbm9kZXMgYXJl
IHRoZQ0KLSAgICAgKiBzYW1lLCB3ZSB0cmVhdCB0aGVtIGFzIHVucmVhY2hhYmxlIChyZXR1cm4g
MHhGRikNCisgICAgICogc2FtZSwgd2UgdHJlYXQgdGhlbSBhcyB1bnJlYWNoYWJsZSAoMHhGRikN
CiAgICAgICovDQogICAgIGlmICggZnJvbSA+PSBBUlJBWV9TSVpFKG5vZGVfZGlzdGFuY2VfbWFw
KSB8fA0KICAgICAgICAgIHRvID49IEFSUkFZX1NJWkUobm9kZV9kaXN0YW5jZV9tYXBbMF0pICkN
Ci0gICAgICAgIHJldHVybiBmcm9tID09IHRvID8gTlVNQV9MT0NBTF9ESVNUQU5DRSA6IE5VTUFf
Tk9fRElTVEFOQ0U7DQorICAgICAgICByZXR1cm4gTlVNQV9OT19ESVNUQU5DRTsNCg0KICAgICBy
ZXR1cm4gbm9kZV9kaXN0YW5jZV9tYXBbZnJvbV1bdG9dOw0KIH0NCg0KS2luZCByZWdhcmRzLA0K
SGVucnkNCg0KPiANCj4gSmFuDQo+IA0K

