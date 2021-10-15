Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCB942EAAB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 09:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209851.366422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbI2L-0006Up-CA; Fri, 15 Oct 2021 07:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209851.366422; Fri, 15 Oct 2021 07:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbI2L-0006Se-8d; Fri, 15 Oct 2021 07:53:53 +0000
Received: by outflank-mailman (input) for mailman id 209851;
 Fri, 15 Oct 2021 07:53:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbI2J-0006SW-BA
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 07:53:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::611])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b54b31b3-7fc5-4067-9dcb-18dfcf5e4430;
 Fri, 15 Oct 2021 07:53:49 +0000 (UTC)
Received: from AM6PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:20b:92::37)
 by DBBPR08MB4744.eurprd08.prod.outlook.com (2603:10a6:10:f6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 07:53:46 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::73) by AM6PR04CA0024.outlook.office365.com
 (2603:10a6:20b:92::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 07:53:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 07:53:46 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Fri, 15 Oct 2021 07:53:46 +0000
Received: from d0de6239896d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1889B60D-8DDC-4563-8B8F-78B41E92B03F.1; 
 Fri, 15 Oct 2021 07:53:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0de6239896d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 07:53:39 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB9PR08MB6714.eurprd08.prod.outlook.com (2603:10a6:10:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 07:53:38 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 07:53:38 +0000
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
X-Inumbo-ID: b54b31b3-7fc5-4067-9dcb-18dfcf5e4430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABdMiD04Gxw5eMEq5p6sZqHLoyqXrjYV0q5rUo713Zs=;
 b=aJSAkANCCBxUxjDTqnXBob4runt7f9iDtuOICjufYot26tqniLa8uZWUDGP/jzAau0xPTWZYOZHkhAGCJOewjZuchGdCUZzBkE7jqJw1eOR7jH7xiPi+wHdHksNE7CPlr+IqRdw48AomlepTR/7zS160ms7xiKAjGGdQKbQX1PA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 60b9c6c90cce7ec8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxs3K7H7hVWe2Or0+ilAd8MYNiRt3QuzCO7ph0pYjnJK0LRl/PH0zz9z2NyK5aaR258oU1r+FiI89xmKrr91tQ6u1a+yiHGrbUAH/FJ+AiXVEjnUQg1rlgzAGxjsZ8VnGxBUwzzbdMINKI34co8Zj3yLFIFZuZgFqFqMnWxJAt25UoXAXkyvoRj/z+kHJ6P0hJ2fGnVi9h37fRxpFv863FjUgqdgv1XiK1Ggj2+m9JeYKEI1MmF3BXq3WjRQPowgBMXrHIRp3TEL3kRO71eqeU+V4OiS+qOfdE/YiT5RCaaE5JNIVyiVmFfJApSs4iMetel5yFGaK1o6XqKKoTzfVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABdMiD04Gxw5eMEq5p6sZqHLoyqXrjYV0q5rUo713Zs=;
 b=b98kvZSQqX0AF8S1wPvgYPe16CQaohtoyMQBE+wN/iOeONV89/o5sa2zke0Dbmdc9BIQcQjSmZzwF72+yVzb7GTbQcfAM9oNvqcupzflSBoX9pEeKVoxps4A0qtre26wmOHZ8kdyZAnGiz0JJgtGQBeeDI06lqEKTR5cLYq5IHuntCGUdt6xhmsuZFic1mBcy5e7bPBNMltRw5qEnXSLyDMadEAhKfOIakPgTZ73Wl4MxW09G5QX+fOYu5EGRCY/fOVJ3ecRhm0dDIRd8Bb09blcPGKSkiGUWFYnaZtG6Y1VTKYhPCSreJuZY1G3+BQQ4GTEcNg1x7rb2+zH+O+gUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABdMiD04Gxw5eMEq5p6sZqHLoyqXrjYV0q5rUo713Zs=;
 b=aJSAkANCCBxUxjDTqnXBob4runt7f9iDtuOICjufYot26tqniLa8uZWUDGP/jzAau0xPTWZYOZHkhAGCJOewjZuchGdCUZzBkE7jqJw1eOR7jH7xiPi+wHdHksNE7CPlr+IqRdw48AomlepTR/7zS160ms7xiKAjGGdQKbQX1PA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, Paul Durrant <paul@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
Thread-Topic: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
Thread-Index: AQHXwQraA42SZeh0QUGI/xX7keuWA6vTrtGAgAACnoA=
Date: Fri, 15 Oct 2021 07:53:38 +0000
Message-ID: <EB6EE7F3-80BD-4717-87C7-C54FAB0FD832@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
 <YWkxT1bVmBT7Av43@MacBook-Air-de-Roger.local>
In-Reply-To: <YWkxT1bVmBT7Av43@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3b40f4a1-37e7-482d-60b3-08d98fb0ea9c
x-ms-traffictypediagnostic: DB9PR08MB6714:|DBBPR08MB4744:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB474498E51436E79AC589D9AA9DB99@DBBPR08MB4744.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Pz4C3YNBonN/0t988/bAIK3vZqANUhcDJu0e9InFgF97vENmPL+IC445l4Bn8SyKnEbleEY8w/sxbeeg+5QUQSfB59wTiuduAYFeV31m1uXtMdSDBe92krPsSe0H14IxbwsniVHn4YzuiNx3hzDFD4tNkog8Xwv6tmUrpgXy29ebJoL5p4u8K0YE+aV+rB+i5VWNHWNBGj9PWcMyDqKR8IzWr/yhziWJMMmX8nBvgDAf0zKEKSYNgdH2HqyvPxUHpWGia6jO89eInkgdchHHMVOy42x4TmkJbSV0fXiV4hV4WxE4OX4GTRffsBpOnyKoUMKRh4/K2/Pvb3Bs7Dn2sbrSO9rl1L5f+gkA79huh44ESPKouHot8XLIF8fPFrvCmaNpiKN9R3rQ18Fp0oiQtlUg6brxyWUYorA1gvYuvYaT2Q6G9tMtgZtC3u1ajwLuzIhH+tKotIef09E3zM/omlzphbW0HAaxgQZA6LhRDKNhe7YjJHIgXGRheNpRKtARjrhr2tIOHVl3+QS7O8ZyiFt/2xn7hPJFM801Ku+zF6Q9anv74vjNEcBmMIa70updmbTo8fGNasCH4Cnqcjn9kL4bnE5roTTm/KautyMvTIriCH/8FaPI3pskTL+anpoAQ9slISneK6ddYsxTBqXg7fPqqloVvYjrICLuc91TkbGPfKbKRvf4dLxh8e3/lO7frR2NnyvkH3cWaNWbBRw6+rGgwCJtMrCodA6FwK5fklJRGI1MPnd0FnvsgBAuOBr+cifhjQNL6ReZ3yN1BLjEPSD4pd8gCvwT8fgreKg40YIq7DDFN0Pqz7vXWJrP3V9s
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(4326008)(36756003)(966005)(508600001)(33656002)(38070700005)(54906003)(2906002)(316002)(53546011)(6506007)(5660300002)(86362001)(38100700002)(66556008)(8936002)(8676002)(2616005)(66476007)(66946007)(91956017)(76116006)(6916009)(64756008)(26005)(66446008)(71200400001)(6486002)(83380400001)(186003)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF4339637CE28D468C128BB93DD6442D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6714
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	610ff8a7-65ad-40e9-6620-08d98fb0e5c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	drE0cFGrRO6bwvLfMHQOELxM/XwoHX0wvXRUswAa29R96X2Lrp6Vbpyc2qtPyziuQHZ42Ii9/B1/JgIVYqSqZXleSJPq8m5tClFBH+OwL1GkdZV0Y7YOlJwsVdEwse80yZ6wuDLgKFXB0SsRs+yFsKbiJUmeHO6mWWC32/bTORywuVx2OggF00S2TKGZkp0XWIQtDkRnOhWSnSpd7smdMOmMmtUCq4Aua8koesiuz6OfjjmdOX+IJ+TfLUrnzhKyJ5Ak28fsQyVZRpd+JL+44ut0Ig8tAenp1v8lVfOz9J/CjBBxDYLaw4UaRmvuz2gTe3e59+vB6imaNcGzwvWGmDeK6SVdk5dFyf6FOVUMjyBSOfGu3Nw9L5Jyoq1E2X27A2v+Dn4GfXoXhPrqxw3cS1gjbZm7e4arAT0e0boiJNTFrnQCfbwYR1jO5RZtlf/bfE5eUVung0b8qj/y6rtRSPRreqVOXmqfG6fCpW9C7GCU+P8MM12978pO0/4ptTJhSf8vUAhmXjRyy2p1Zuvpy01/SlcUIy0Nk36uS7OgUDwiK5yYzNZ9Il7LVUbrJlfpMh8N3xAkFrCDr/3tWfyCTZTBApas7F5dW4a43NVyipyrPmz/31vzW0ZVL3VBGyMvOtHqbK0+WfKlqI5JoKdW91b7i8Qi39CAWFkmpeEMOuQNlGxqLuIrGGUnEQ7Tdg4RGHdTWh7MpE1y6eEa+74kPhk/GVlSfopgU33S/F5r2t9yZoBhQ377T2gicolrU/DtIu4a7abYCEe+UeDB/rQd2ZQHU1PAGZX+HTZcRZppMw0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(316002)(4326008)(54906003)(5660300002)(6506007)(53546011)(356005)(26005)(8936002)(70206006)(70586007)(2616005)(336012)(508600001)(966005)(186003)(8676002)(81166007)(86362001)(47076005)(6512007)(36860700001)(33656002)(36756003)(82310400003)(6862004)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 07:53:46.1800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b40f4a1-37e7-482d-60b3-08d98fb0ea9c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4744

SGkgUm9nZXIsDQoNCj4gT24gMTUgT2N0IDIwMjEsIGF0IDA4OjQ0LCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIE9jdCAxNCwgMjAy
MSBhdCAwMzo0OTo0OVBNICswMTAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gUENJIHN0
YW5kYXJkIGlzIHVzaW5nIEVDQU0gYW5kIG5vdCBNQ0ZHIHdoaWNoIGlzIGNvbWluZyBmcm9tIEFD
UElbMV0uDQo+PiBVc2UgRUNBTS9lY2FtIGluc3RlYWQgb2YgTUNGRyBpbiBjb21tb24gY29kZSBh
bmQgaW4gbmV3IGZ1bmN0aW9ucyBhZGRlZA0KPj4gaW4gY29tbW9uIHZwY2kgY29kZSBieSB0aGlz
IHBhdGNoLg0KPj4gDQo+PiBSZW5hbWUgdnBjaV9hY2Nlc3NfYWxsb3dlZCB0byB2cGNpX2VjYW1f
YWNjZXNzX2FsbG93ZWQgYW5kIG1vdmUgaXQNCj4+IGZyb20gYXJjaC94ODYvaHZtL2lvLmMgdG8g
ZHJpdmVycy92cGNpL3ZwY2kuYy4NCj4+IA0KPj4gQ3JlYXRlIHZwY2lfZWNhbV9tbWlvX3tyZWFk
LHdyaXRlfSBpbiBkcml2ZXJzL3ZwY2kvdnBjaS5jIHRoYXQNCj4+IGNvbnRhaW5zIHRoZSBjb21t
b24gY29kZSB0byBwZXJmb3JtIHRoZXNlIG9wZXJhdGlvbnMsIGNoYW5nZWQNCj4+IHZwY2lfbW1j
Zmdfe3JlYWQsd3JpdGV9IGFjY29yZGluZ2x5IHRvIG1ha2UgdXNlIG9mIHRoZXNlIGZ1bmN0aW9u
cy4NCj4+IA0KPj4gVGhlIHZwY2lfZWNhbV9tbWlvX3tyZWFkLHdyaXRlfSBmdW5jdGlvbnMgYXJl
IHJldHVybmluZyAwIG9uIGVycm9yIGFuZCAxDQo+PiBvbiBzdWNjZXNzLiBBcyB0aGUgeDg2IGNv
ZGUgd2FzIHByZXZpb3VzbHkgYWx3YXlzIHJldHVybmluZyBYODZFTVVMX09LQVkNCj4+IHRoZSBy
ZXR1cm4gY29kZSBpcyBpZ25vcmVkLiBBIGNvbW1lbnQgaGFzIGJlZW4gYWRkZWQgaW4gdGhlIGNv
ZGUgdG8gc2hvdw0KPj4gdGhhdCB0aGlzIGlzIGludGVudGlvbmFsLg0KPj4gDQo+PiBUaG9zZSBm
dW5jdGlvbnMgd2lsbCBiZSB1c2VkIGluIGEgZm9sbG93aW5nIHBhdGNoIGluc2lkZSBieSBhcm0g
dnBjaQ0KPj4gaW1wbGVtZW50YXRpb24uDQo+PiANCj4+IFJlbmFtZSBNTUNGR19TQkRGIHRvIEVD
QU1fU0JERi4NCj4+IA0KPj4gTm90IGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkIHdpdGggdGhp
cyBwYXRjaC4NCj4+IA0KPj4gWzFdIGh0dHBzOi8vd2lraS5vc2Rldi5vcmcvUENJX0V4cHJlc3MN
Cj4+IA0KPj4gU3VnZ2VzdGVkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1
aXNAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2NjogUGF0Y2ggYWRkZWQNCj4+IC0t
LQ0KPj4geGVuL2FyY2gveDg2L2h2bS9pby5jICAgICB8IDUwICsrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+PiB4ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyAgIHwgNjAgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiB4ZW4vaW5jbHVkZS9hc20teDg2L3Bj
aS5oIHwgIDIgKy0NCj4+IHhlbi9pbmNsdWRlL3hlbi92cGNpLmggICAgfCAxMCArKysrKysrDQo+
PiA0IGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQ0KPj4g
DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9pby5jIGIveGVuL2FyY2gveDg2L2h2
bS9pby5jDQo+PiBpbmRleCAwNDZhOGViNGVkLi4zNDBiOGM4YjBlIDEwMDY0NA0KPj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9pby5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2lvLmMNCj4+
IEBAIC0yNjAsMjAgKzI2MCw2IEBAIHVuc2lnbmVkIGludCBodm1fcGNpX2RlY29kZV9hZGRyKHVu
c2lnbmVkIGludCBjZjgsIHVuc2lnbmVkIGludCBhZGRyLA0KPj4gICAgIHJldHVybiBDRjhfQURE
Ul9MTyhjZjgpIHwgKGFkZHIgJiAzKTsNCj4+IH0NCj4+IA0KPj4gLS8qIERvIHNvbWUgc2FuaXR5
IGNoZWNrcy4gKi8NCj4+IC1zdGF0aWMgYm9vbCB2cGNpX2FjY2Vzc19hbGxvd2VkKHVuc2lnbmVk
IGludCByZWcsIHVuc2lnbmVkIGludCBsZW4pDQo+PiAtew0KPj4gLSAgICAvKiBDaGVjayBhY2Nl
c3Mgc2l6ZS4gKi8NCj4+IC0gICAgaWYgKCBsZW4gIT0gMSAmJiBsZW4gIT0gMiAmJiBsZW4gIT0g
NCAmJiBsZW4gIT0gOCApDQo+PiAtICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiAtDQo+PiAtICAg
IC8qIENoZWNrIHRoYXQgYWNjZXNzIGlzIHNpemUgYWxpZ25lZC4gKi8NCj4+IC0gICAgaWYgKCAo
cmVnICYgKGxlbiAtIDEpKSApDQo+PiAtICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiAtDQo+PiAt
ICAgIHJldHVybiB0cnVlOw0KPj4gLX0NCj4+IC0NCj4+IC8qIHZQQ0kgY29uZmlnIHNwYWNlIElP
IHBvcnRzIGhhbmRsZXJzICgweGNmOC8weGNmYykuICovDQo+PiBzdGF0aWMgYm9vbCB2cGNpX3Bv
cnRpb19hY2NlcHQoY29uc3Qgc3RydWN0IGh2bV9pb19oYW5kbGVyICpoYW5kbGVyLA0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGlvcmVxX3QgKnApDQo+PiBAQCAtMzA1
LDcgKzI5MSw3IEBAIHN0YXRpYyBpbnQgdnBjaV9wb3J0aW9fcmVhZChjb25zdCBzdHJ1Y3QgaHZt
X2lvX2hhbmRsZXIgKmhhbmRsZXIsDQo+PiANCj4+ICAgICByZWcgPSBodm1fcGNpX2RlY29kZV9h
ZGRyKGNmOCwgYWRkciwgJnNiZGYpOw0KPj4gDQo+PiAtICAgIGlmICggIXZwY2lfYWNjZXNzX2Fs
bG93ZWQocmVnLCBzaXplKSApDQo+PiArICAgIGlmICggIXZwY2lfZWNhbV9hY2Nlc3NfYWxsb3dl
ZChyZWcsIHNpemUpICkNCj4+ICAgICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsNCj4+IA0KPj4g
ICAgICpkYXRhID0gdnBjaV9yZWFkKHNiZGYsIHJlZywgc2l6ZSk7DQo+PiBAQCAtMzM1LDcgKzMy
MSw3IEBAIHN0YXRpYyBpbnQgdnBjaV9wb3J0aW9fd3JpdGUoY29uc3Qgc3RydWN0IGh2bV9pb19o
YW5kbGVyICpoYW5kbGVyLA0KPj4gDQo+PiAgICAgcmVnID0gaHZtX3BjaV9kZWNvZGVfYWRkcihj
ZjgsIGFkZHIsICZzYmRmKTsNCj4+IA0KPj4gLSAgICBpZiAoICF2cGNpX2FjY2Vzc19hbGxvd2Vk
KHJlZywgc2l6ZSkgKQ0KPj4gKyAgICBpZiAoICF2cGNpX2VjYW1fYWNjZXNzX2FsbG93ZWQocmVn
LCBzaXplKSApDQo+PiAgICAgICAgIHJldHVybiBYODZFTVVMX09LQVk7DQo+PiANCj4+ICAgICB2
cGNpX3dyaXRlKHNiZGYsIHJlZywgc2l6ZSwgZGF0YSk7DQo+PiBAQCAtMzk0LDcgKzM4MCw3IEBA
IHN0YXRpYyB1bnNpZ25lZCBpbnQgdnBjaV9tbWNmZ19kZWNvZGVfYWRkcihjb25zdCBzdHJ1Y3Qg
aHZtX21tY2ZnICptbWNmZywNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYWRkcl90IGFkZHIsIHBjaV9zYmRmX3QgKnNiZGYpDQo+PiB7DQo+PiAgICAgYWRk
ciAtPSBtbWNmZy0+YWRkcjsNCj4+IC0gICAgc2JkZi0+YmRmID0gTU1DRkdfQkRGKGFkZHIpOw0K
Pj4gKyAgICBzYmRmLT5iZGYgPSBFQ0FNX0JERihhZGRyKTsNCj4+ICAgICBzYmRmLT5idXMgKz0g
bW1jZmctPnN0YXJ0X2J1czsNCj4+ICAgICBzYmRmLT5zZWcgPSBtbWNmZy0+c2VnbWVudDsNCj4+
IA0KPj4gQEAgLTQzNCwyNSArNDIwLDggQEAgc3RhdGljIGludCB2cGNpX21tY2ZnX3JlYWQoc3Ry
dWN0IHZjcHUgKnYsIHVuc2lnbmVkIGxvbmcgYWRkciwNCj4+ICAgICByZWcgPSB2cGNpX21tY2Zn
X2RlY29kZV9hZGRyKG1tY2ZnLCBhZGRyLCAmc2JkZik7DQo+PiAgICAgcmVhZF91bmxvY2soJmQt
PmFyY2guaHZtLm1tY2ZnX2xvY2spOw0KPj4gDQo+PiAtICAgIGlmICggIXZwY2lfYWNjZXNzX2Fs
bG93ZWQocmVnLCBsZW4pIHx8DQo+PiAtICAgICAgICAgKHJlZyArIGxlbikgPiBQQ0lfQ0ZHX1NQ
QUNFX0VYUF9TSVpFICkNCj4+IC0gICAgICAgIHJldHVybiBYODZFTVVMX09LQVk7DQo+PiAtDQo+
PiAtICAgIC8qDQo+PiAtICAgICAqIEFjY29yZGluZyB0byB0aGUgUENJZSAzLjFBIHNwZWNpZmlj
YXRpb246DQo+PiAtICAgICAqICAtIENvbmZpZ3VyYXRpb24gUmVhZHMgYW5kIFdyaXRlcyBtdXN0
IHVzdWFsbHkgYmUgRFdPUkQgb3Igc21hbGxlcg0KPj4gLSAgICAgKiAgICBpbiBzaXplLg0KPj4g
LSAgICAgKiAgLSBCZWNhdXNlIFJvb3QgQ29tcGxleCBpbXBsZW1lbnRhdGlvbnMgYXJlIG5vdCBy
ZXF1aXJlZCB0byBzdXBwb3J0DQo+PiAtICAgICAqICAgIGFjY2Vzc2VzIHRvIGEgUkNSQiB0aGF0
IGNyb3NzIERXIGJvdW5kYXJpZXMgWy4uLl0gc29mdHdhcmUNCj4+IC0gICAgICogICAgc2hvdWxk
IHRha2UgY2FyZSBub3QgdG8gY2F1c2UgdGhlIGdlbmVyYXRpb24gb2Ygc3VjaCBhY2Nlc3Nlcw0K
Pj4gLSAgICAgKiAgICB3aGVuIGFjY2Vzc2luZyBhIFJDUkIgdW5sZXNzIHRoZSBSb290IENvbXBs
ZXggd2lsbCBzdXBwb3J0IHRoZQ0KPj4gLSAgICAgKiAgICBhY2Nlc3MuDQo+PiAtICAgICAqICBY
ZW4gaG93ZXZlciBzdXBwb3J0cyA4Ynl0ZSBhY2Nlc3NlcyBieSBzcGxpdHRpbmcgdGhlbSBpbnRv
IHR3bw0KPj4gLSAgICAgKiAgNGJ5dGUgYWNjZXNzZXMuDQo+PiAtICAgICAqLw0KPj4gLSAgICAq
ZGF0YSA9IHZwY2lfcmVhZChzYmRmLCByZWcsIG1pbig0dSwgbGVuKSk7DQo+PiAtICAgIGlmICgg
bGVuID09IDggKQ0KPj4gLSAgICAgICAgKmRhdGEgfD0gKHVpbnQ2NF90KXZwY2lfcmVhZChzYmRm
LCByZWcgKyA0LCA0KSA8PCAzMjsNCj4+ICsgICAgLyogSWdub3JlIHJldHVybiBjb2RlICovDQo+
PiArICAgIHZwY2lfZWNhbV9tbWlvX3JlYWQoc2JkZiwgcmVnLCBsZW4sIGRhdGEpOw0KPiANCj4g
SSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgZm9yIHZwY2lfZWNhbV9tbWlvX3JlYWQgdG8ganVz
dCByZXR1cm4gdGhlDQo+IHJlYWQgdmFsdWUsIG9yIH4wIGluIGNhc2Ugb2YgZXJyb3IsIGF0IGxl
YXN0IHRoYXQgaW50ZXJmYWNlIHdvdWxkIGJlDQo+IHNpbXBsZXIgYW5kIHN1aXRhYmxlIGZvciB4
ODYuDQoNCkkgYW0gbm90IHF1aXRlIHN1cmUgb24gdGhpcyBhcyBvbiBhYnNvbHV0ZSB0byByZWFk
IH4wIGlzIHBvc3NpYmxlIHNvIHRoZQ0KY2FsbGVyIGNhbm5vdCBkaXN0aW5ndWlzaCBiZXR3ZWVu
IHByb3Blcmx5IHJlYWRpbmcgfjAgb3IgYW4gYWNjZXNzIGFsbG93ZWQgZXJyb3IuDQoNCj4gDQo+
IEFsc28gSSB3b3VsZCBkcm9wIHRoZSBtbWlvIHBhcnQgZnJvbSB0aGUgZnVuY3Rpb24gbmFtZS4N
Cg0KT2sgSSB3aWxsIGRvIHRoYXQuDQoNCj4gDQo+PiANCj4+ICAgICByZXR1cm4gWDg2RU1VTF9P
S0FZOw0KPj4gfQ0KPj4gQEAgLTQ3NiwxMyArNDQ1LDggQEAgc3RhdGljIGludCB2cGNpX21tY2Zn
X3dyaXRlKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGFkZHIsDQo+PiAgICAgcmVnID0g
dnBjaV9tbWNmZ19kZWNvZGVfYWRkcihtbWNmZywgYWRkciwgJnNiZGYpOw0KPj4gICAgIHJlYWRf
dW5sb2NrKCZkLT5hcmNoLmh2bS5tbWNmZ19sb2NrKTsNCj4+IA0KPj4gLSAgICBpZiAoICF2cGNp
X2FjY2Vzc19hbGxvd2VkKHJlZywgbGVuKSB8fA0KPj4gLSAgICAgICAgIChyZWcgKyBsZW4pID4g
UENJX0NGR19TUEFDRV9FWFBfU0laRSApDQo+PiAtICAgICAgICByZXR1cm4gWDg2RU1VTF9PS0FZ
Ow0KPj4gLQ0KPj4gLSAgICB2cGNpX3dyaXRlKHNiZGYsIHJlZywgbWluKDR1LCBsZW4pLCBkYXRh
KTsNCj4+IC0gICAgaWYgKCBsZW4gPT0gOCApDQo+PiAtICAgICAgICB2cGNpX3dyaXRlKHNiZGYs
IHJlZyArIDQsIDQsIGRhdGEgPj4gMzIpOw0KPj4gKyAgICAvKiBJZ25vcmUgcmV0dXJuIGNvZGUg
Ki8NCj4+ICsgICAgdnBjaV9lY2FtX21taW9fd3JpdGUoc2JkZiwgcmVnLCBsZW4sIGRhdGEpOw0K
PiANCj4gS2luZCBvZiBsaWtlbHkgaGVyZSwgeDg2IHdvdWxkIGJlIGZpbmUgd2l0aCB0aGlzIGZ1
bmN0aW9uIHJldHVybiB0eXBlDQo+IGJlaW5nIHZvaWQuDQo+IA0KPiBJZiB0aGF0J3Mgbm90IGdv
b2QgZm9yIEFybSwgSSB0aGluayB0aGUgY29tbWVudCBjYW4gYmUgZHJvcHBlZCBhcyBpdCdzDQo+
IGNsZWFyIHRoZSByZXR1cm4gY29kZSBpcyBpZ25vcmVkLiBJdCB3b3VsZCBiZXR0ZXIgdG8gbWF5
YmUgYWRkOg0KPiANCj4gLyogRmFpbGVkIHdyaXRlcyBhcmUgbm90IHByb3BhZ2F0ZWQgdG8gdGhl
IGNhbGxlciAqLw0KDQpJIHdpbGwgcmVwbGFjZSB0aGUgY3VycmVudCBjb21tZW50IGJ5IHRoaXMg
b25lLg0KDQo+IA0KPj4gDQo+PiAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsNCj4+IH0NCj4+IGRp
ZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBj
aS5jDQo+PiBpbmRleCBjYmQxYmFjN2ZjLi5jMDg1MzE3NmQ3IDEwMDY0NA0KPj4gLS0tIGEveGVu
L2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+
PiBAQCAtNDc4LDYgKzQ3OCw2NiBAQCB2b2lkIHZwY2lfd3JpdGUocGNpX3NiZGZfdCBzYmRmLCB1
bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwNCj4+ICAgICBzcGluX3VubG9jaygm
cGRldi0+dnBjaS0+bG9jayk7DQo+PiB9DQo+PiANCj4+ICsvKiBIZWxwZXIgZnVuY3Rpb24gdG8g
Y2hlY2sgYW4gYWNjZXNzIHNpemUgYW5kIGFsaWdubWVudCBvbiB2cGNpIHNwYWNlLiAqLw0KPj4g
K2Jvb2wgdnBjaV9lY2FtX2FjY2Vzc19hbGxvd2VkKHVuc2lnbmVkIGludCByZWcsIHVuc2lnbmVk
IGludCBsZW4pDQo+PiArew0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBDaGVjayBhY2Nlc3Mgc2l6
ZS4NCj4+ICsgICAgICoNCj4+ICsgICAgICogT24gYXJtMzIgb3IgZm9yIDMyYml0IGd1ZXN0cyBv
biBhcm0sIDY0Yml0IGFjY2Vzc2VzIHNob3VsZCBiZSBmb3JiaWRkZW4NCj4+ICsgICAgICogYnV0
IGFzIGZvciB0aG9zZSBwbGF0Zm9ybSBJU1YgcmVnaXN0ZXIsIHdoaWNoIGdpdmVzIHRoZSBhY2Nl
c3Mgc2l6ZSwNCj4+ICsgICAgICogY2Fubm90IGhhdmUgYSB2YWx1ZSAzLCBjaGVja2luZyB0aGlz
IHdvdWxkIGp1c3QgaGFyZGVuIHRoZSBjb2RlLg0KPiANCj4gSXQgZmVlbHMga2luZCBvZiB3ZWly
ZCB0byBoYXZlIGFuIEFybSBzcGVjaWZpYyBjb21tZW50IGluIGNvbW1vbiBjb2RlLA0KPiBidXQg
SSBndWVzcyB0aGVyZSdzIG5vIGJldHRlciBwbGFjZSBmb3IgaXQgdG8gbGl2ZT8NCg0KRm9yIG5v
dyBJIHRoaW5rIEkgY2FuIG1vdmUgaXQgZGlyZWN0bHkgaW50byBhcm0gdnBjaSBjb2RlIGV2ZW4g
dGhvdWdoIGl0IGlzIG5vdCBwZXJmZWN0Lg0KDQpUaGFua3MgZm9yIHRoZSBjb21tZW50cw0KDQpS
ZWdhcmRzDQpCZXJ0cmFuZA0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQo=

