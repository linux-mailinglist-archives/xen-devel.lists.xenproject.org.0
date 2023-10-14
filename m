Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 811437C9213
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 03:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616997.959429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrTQx-0006aP-Gn; Sat, 14 Oct 2023 01:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616997.959429; Sat, 14 Oct 2023 01:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrTQx-0006Xp-E1; Sat, 14 Oct 2023 01:27:15 +0000
Received: by outflank-mailman (input) for mailman id 616997;
 Sat, 14 Oct 2023 01:27:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUN7=F4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qrTQw-0006Xj-G9
 for xen-devel@lists.xenproject.org; Sat, 14 Oct 2023 01:27:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc760180-6a30-11ee-98d4-6d05b1d4d9a1;
 Sat, 14 Oct 2023 03:27:12 +0200 (CEST)
Received: from DUZPR01CA0332.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::18) by AS2PR08MB8453.eurprd08.prod.outlook.com
 (2603:10a6:20b:559::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Sat, 14 Oct
 2023 01:27:08 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::25) by DUZPR01CA0332.outlook.office365.com
 (2603:10a6:10:4b8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30 via Frontend
 Transport; Sat, 14 Oct 2023 01:27:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Sat, 14 Oct 2023 01:27:07 +0000
Received: ("Tessian outbound ee9c7f88acf7:v211");
 Sat, 14 Oct 2023 01:27:07 +0000
Received: from db4bbe6061ab.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 544F0810-952E-4096-897E-7D28AD888E1B.1; 
 Sat, 14 Oct 2023 01:27:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db4bbe6061ab.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 14 Oct 2023 01:27:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5615.eurprd08.prod.outlook.com (2603:10a6:800:1b3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Sat, 14 Oct
 2023 01:26:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Sat, 14 Oct 2023
 01:26:56 +0000
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
X-Inumbo-ID: cc760180-6a30-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8q18G9Wznw6Or3DTp9DVU8ApKymBLhY1B9Ayz8T0tEY=;
 b=0sI74IoKZwwbSnq69ASVNuN78UFqPvW08EU/Zshq8/CvnGvbeT9M5JgJY7OMkywQG9PFD5zAs7S7n1Kv+W7D4jIyEjUaWauxhsxr3r7y/yPK538EFF4lGO4YnWUpKAJRW1Deabe1628ENtG79Pf+F/3XDbQpQJJmBk6iBaCCWR0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f3c2dccfe749ffc8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWf9psib8aPHrmop3/Z8JuaswsEtk7CCgrMqbG+3SoPk6Qk96616QZYpnyS4OMXrxvSTXhuRkhK0i9+iwMA9fDlR3yI3sRFhbr01Jnj4g6tobaYG+6tJK43RxrFDD8J8Y8BXjRM0H5jsyxm4LTpjKngT1LnmcS2h0+jP+JikPWMSu0cP0ATtQWXc/E5IKhrrW48LE4sSVe3y8iiYgk24bKF1Ra4K/xPl3IHUOXJj4+htf1Uxy3VEGSAGoo3ShB7qqtcxybYpE0fqBFtXoHDSHlhuMBUUccP413GJ3Nk76jyhr3BE5COVBk7tb5CbNt4hnaNrYdbkDSdL1jKvpLD5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8q18G9Wznw6Or3DTp9DVU8ApKymBLhY1B9Ayz8T0tEY=;
 b=WHWk4f1lCa/6b0IwJE6FsceZyK0/CbC110sZ52/HwUBgY+NBMsuBk6pfDlVOtjsQ7PYr71awRW67K8AR97kiTWm0CvM6KBzcGB0epebhKf+8Un3XO+MrDVZIRvEn/CL7engbHBTLdXaEm2vziwGNu1YlssxB8e5LSaR13U1pxwEIXuwMKtS4kS9yYVFwMuJR8hr3sDdz+6ShKEerM/vG+nQUqpxIKgD/yUHcjDyr4UkGudQOl4wOnN6yu3qkrcsichJubguA0dI834SzcS9W3xvcqMc6iGcrM53BfAf/6QscYX50lLugtPr68zc3sBzfDHh2XmL8Y7bzSN8nyuYP7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8q18G9Wznw6Or3DTp9DVU8ApKymBLhY1B9Ayz8T0tEY=;
 b=0sI74IoKZwwbSnq69ASVNuN78UFqPvW08EU/Zshq8/CvnGvbeT9M5JgJY7OMkywQG9PFD5zAs7S7n1Kv+W7D4jIyEjUaWauxhsxr3r7y/yPK538EFF4lGO4YnWUpKAJRW1Deabe1628ENtG79Pf+F/3XDbQpQJJmBk6iBaCCWR0=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v7 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Topic: [PATCH v7 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Index: AQHZ+kyDxYKGSy7Hi0WFFm+WJG77tLBID9YAgAB2kIA=
Date: Sat, 14 Oct 2023 01:26:55 +0000
Message-ID: <4607C809-7625-4C8E-A26E-8B8F641CEB29@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-9-Henry.Wang@arm.com>
 <af6a376c-a224-45d7-9972-d69ee44239d6@xen.org>
In-Reply-To: <af6a376c-a224-45d7-9972-d69ee44239d6@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VE1PR08MB5615:EE_|DB5PEPF00014B97:EE_|AS2PR08MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: 0968898c-77db-439d-02df-08dbcc54ae0d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tNQRTe4sVk/aLHqiQdQwsEE2L2877OOMcCt8RH71HxUyz4G7R+LBAU/O5bzf/vVOfqdbZzsskddd3mCAmjqGXA12ux2K5Fq7Rtk7Rr9rLxtSx6rCFuL/qPc+pG4l+PDTs69wcoYhHbAlwiXOIq9OHyDVD8RvoS2JzR9XGWnw4BNNmqITubNd0P723diOwtszKzjk7y7VI30jstjSPKMi++nEdkQw7kLeiCCtBZljSyrdELsiPrkJKjsoz9r86uYgcG/n5KPgqhpk0ORrSwnAuz+5fiOwW7nJ4Yj8g8mCyZvB3HE3ac26tV6Lg36+29jmAiSR+J42d8h+GFDrvbiXud06LPx5yQZT2YV1axnsgRC5461injzQuuQcq0DwNc2mHlljFGCBalXr1AyfADPr5oHf2Hd2mZirY2N6oCM/yvi3T+QlKAKjAdCsUBAYuE9lm/S2Bt/+Aw0f6qBQVfroheX/SEGhJYUxUXKeICACT7f9z23m4P2KzJc3T4KKBxTzloyD+8S7u4T4P5Tdaf+n7hJJ5xBoFOKGrn+1HJ8oNVlN/mOTPW3a1xn10Xl8aek48MwOnpNGcCUkcsYlFoKMEK/rNB1qSxH3fY0E7lYLyHYoRcBOQWiFm4VeYrvwpvHobwIzSr/zB07iCSqBxBj5cQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(122000001)(86362001)(33656002)(36756003)(38070700005)(83380400001)(2906002)(38100700002)(71200400001)(5660300002)(8676002)(4326008)(53546011)(76116006)(54906003)(66476007)(6916009)(64756008)(6512007)(66556008)(316002)(6506007)(66446008)(66946007)(91956017)(41300700001)(966005)(8936002)(6486002)(478600001)(2616005)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <675E24BA21C9634F9C86B1293459C522@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5615
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08ba8fad-0cea-44ad-f4fc-08dbcc54a738
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iJjvz2kOZ954r3sa83WeTTOCubD1p7mRFxEB/KLEtmj4Bevs94oPVaek44OnMtCPhLlYM4KNPs20nlPWOZz+DOCmu9fiavLjpNro28ottshbMK7jov/Q7CdfJ6el8pRncRL7ppgvz6laKHkIjk/nivQ6Gx9aLCWU3BAU4qiQfGc0zZrsEPgCaMqr8D21e6x2XKSAX7IemxN7QyWZ70N80vj4fbaoXTCkTDV+5bzP8CbZLLj5HDKQN/wKT+8L9PP/NUX1mz2X39yaHQuBslJm/S+eHR8g0sv6Jox85h0IMCGgMH6HgjXAVb883yUaAQVS0scoz7fr1+P5m60dVz5dgy9/MYGuSZa+Z7STXjhZFnZyzeRp6ILBOW2RecqrscqDvO+vajM2QbFM+nNa6R1S7do4OgULojGUMoYf/8F8hGkg+P5H78J/i8WlwLWu540lQ0VnyiXa8KaUIEftgAZZW9CcK0cdJgPLVCNbKdGyK65On+KOPPcoeWoK2mWv1eTyu/aKoVOM4o2g+882TSklhnjmhJLSXr3pi2FTH3LwDdLqAjr/bc50upwk8IgDct3NzH7RL918hdI77IpEyAXDVuq3WseZ8agRyDrvYQQnXA57boCCpq2xUhSme4E5nhmxNykTbRzaA618FCAoEJkL9p8BVwCqkmIMJctueXEMgIPGxwJl6Hmt4dgBFUV87XNL8prOjkCK0txBm1zxh7P5+sX/BcSKLnmJ5WABHMZH6Fk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799009)(46966006)(36840700001)(40470700004)(40460700003)(36860700001)(2906002)(47076005)(36756003)(86362001)(33656002)(40480700001)(82740400003)(81166007)(356005)(966005)(26005)(6486002)(336012)(8936002)(4326008)(8676002)(83380400001)(6862004)(478600001)(6512007)(53546011)(6506007)(41300700001)(316002)(5660300002)(70206006)(54906003)(70586007)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 01:27:07.2464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0968898c-77db-439d-02df-08dbcc54ae0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8453

SGkgSnVsaWVuLA0KDQo+IE9uIE9jdCAxNCwgMjAyMywgYXQgMDI6MjIsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAwOS8xMC8y
MDIzIDAyOjAzLCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gRnJvbTogUGVubnkgWmhlbmcgPHBlbm55
LnpoZW5nQGFybS5jb20+DQo+PiBDdXJyZW50IFAyTSBpbXBsZW1lbnRhdGlvbiBpcyBkZXNpZ25l
ZCBmb3IgTU1VIHN5c3RlbSBvbmx5Lg0KPj4gV2UgbW92ZSB0aGUgTU1VLXNwZWNpZmljIGNvZGVz
IGludG8gbW11L3AybS5jLCBhbmQgb25seSBrZWVwIGdlbmVyaWMNCj4+IGNvZGVzIGluIHAybS5j
LCBsaWtlIFZNSUQgYWxsb2NhdG9yLCBldGMuIFdlIGFsc28gbW92ZSBNTVUtc3BlY2lmaWMNCj4+
IGRlZmluaXRpb25zIGFuZCBkZWNsYXJhdGlvbnMgdG8gbW11L3AybS5oLCBzdWNoIGFzIHAybV90
bGJfZmx1c2hfc3luYygpLg0KPj4gQWxzbyBleHBvc2UgcHJldmlvdXNseSBzdGF0aWMgZnVuY3Rp
b25zIHAybV92bWlkX2FsbG9jYXRvcl9pbml0KCksDQo+PiBwMm1fYWxsb2Nfdm1pZCgpLCBhbmQg
c2V0dXBfdmlydF9wYWdpbmdfb25lKCkgZm9yIGZ1cnRoZXIgTVBVIHVzYWdlLg0KPj4gV2l0aCB0
aGUgY29kZSBtb3ZlbWVudCwgZ2xvYmFsIHZhcmlhYmxlIG1heF92bWlkIGlzIHVzZWQgaW4gbXVs
dGlwbGUNCj4+IGZpbGVzIGluc3RlYWQgb2YgYSBzaW5nbGUgZmlsZSAoYW5kIHdpbGwgYmUgdXNl
ZCBpbiBNUFUgUDJNDQo+PiBpbXBsZW1lbnRhdGlvbiksIGRlY2xhcmUgaXQgaW4gdGhlIGhlYWRl
ciBhbmQgcmVtb3ZlIHRoZSAic3RhdGljIiBvZg0KPj4gdGhpcyB2YXJpYWJsZS4NCj4+IFNpZ25l
ZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPj4gU2lnbmVkLW9m
Zi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBIZW5y
eSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IA0KPiBTb21lIHJlbWFya3MgYWJvdXQgc29t
ZSBvZiB0aGUgY29kZSBub3QgbW92ZWQ6DQo+ICogc3RydWN0IHAybV9kb21haW46IFRoZSBidWxr
IG9mIHRoZSBmaWVsZHMgc2VlbXMgdG8gYmUgTU1VIHNwZWNpZmljLiBTbyBkZXBlbmRpbmcgb24g
dGhlIG51bWJlciBvZiBjb21tb24gZmllbGRzIHdlIGVpdGhlciB3YW50IHRvIHNwbGl0IG9yIG1v
dmUgdGhlIHN0cnVjdHVyZSB0byBwMm1fZG9tYWluLiBJIHdvdWxkIGJlIG9rIHRvIHdhaXQgdW50
aWwgdGhlIE1QVSBjb2RlIGlzIHByZXNlbnQuDQo+ICogcDJtX3R5cGVfdDogSXQgaXMgbm90IHll
dCBjbGVhciBob3cgdGhpcyB3aWxsIGFwcGx5IHRvIHRoZSBNUFUuIEkgYW0gb2sgdG8gd2FpdCBi
ZWZvcmUgbW92aW5nIGl0Lg0KDQpBZ3JlZSB3aXRoIGJvdGggaGVyZSwgbGV04oCZcyBjb250aW51
ZSB0aGUgZGlzY3Vzc2lvbiBpbiB0aGUgYWN0dWFsIE1QVSBwYXRjaCBmb3IgUDJNDQp0aGVuLCBi
dXQgSSBhbSB0aGVuIGEgYml0IGNvbmZ1c2VkIGFib3V0Li4uDQoNCj4gKiBwMm1fY2FjaGVfZmx1
c2hfcmFuZ2UoKTogSSBleHBlY3QgdGhlIGNvZGUgd2lsbCBuZWVkIHNvbWUgY2hhbmdlIGJlY2F1
c2UgeW91IG1heSBnZXQgbGFyZ2UgY2h1bmsgb2YgbWVtb3J5IGZvciB0aGUgTVBVLg0KPiAqIHAy
bV9zZXRfd2F5X2ZsdXNoKCkvcDJtX3RvZ2dsZV9jYWNoZSgpOiBUaGlzIHdhcyBhIGdpYW50IGhh
Y2sgdG8gc3VwcG9ydCBjYWNoZSBmbHVzaCBvcGVyYXRpb25zIHZpYSBzZXQvd2F5LiBUbyBtYWtl
IGl0IGVmZmljaWVudCwgd2UgdHJhY2sgdGhlIHBhZ2VzIHRoYXQgaGF2ZSBiZWVuIHRvdWNoZWQg
YW5kIG9ubHkgZmx1c2ggdGhlbS4gRm9yIHRoZSBNUFUsIHRoaXMgd291bGQgbm90IHdvcmsuIENh
biB3ZSBhdHRlbXB0IHRvIG5vdCBlbXVsYXRlIHRoZSBpbnN0cnVjdGlvbnM/DQoNCuKApnRoZXNl
IHR3byByZW1hcmtzIGhlcmUsIGRvIHlvdSBleHBlY3QgbWUgdG8gZG8gc29tZSBjaGFuZ2VzIHdp
dGggdGhlc2UgdGhyZWUNCmZ1bmN0aW9ucyBpbiB0aGlzIHBhdGNoPyBPciB3ZSBjYW4gZGVmZXIg
dGhlIHJlcXVpcmVkIGNoYW5nZXMgdG8gdGhlIE1QVSBwYXRjaCBmb3INClAyTT8gDQoNCkkgdGhp
bmsgSSBhbSBoaWdobHkgbGlrZWx5IHRvIG1ha2UgYSBtaXN0YWtlIGhlcmUgYnV0IEkgdG9vayBh
IGxvb2sgYXQgdGhlIE1QVQ0KaW1wbGVtZW50YXRpb24gWzFdIGFuZCBpdCBsb29rcyBsaWtlIHRo
ZSBNUFUgY29kZSBjYW4gdXNlIHRoZXNlIHRyZWUgZnVuY3Rpb25zDQp3aXRob3V0IGNoYW5nZXMg
LSBwcm9iYWJseSBiZWNhdXNlIHRoZXNlIGZ1bmN0aW9ucyBhcmUgc2ltcGx5IHVzZWQgYnkNCigx
KSBkb21jdGwgYW5kIHdlIG9ubHkgaGF2ZSBkb20wbGVzcyBEb21VcyBvbiBNUFUNCigyKSB0cmFw
IGhhbmRsZXJzDQp3aGljaCBtZWFucyB0aGVzZSBmdW5jdGlvbnMgYXJlIHNpbXBseSBub3QgY2Fs
bGVk4oCmDQoNClNvIG1heWJlIG1vdmluZyB0aGVzZSB0aHJlZSBmdW5jdGlvbnMgdG8gbW11L3Ay
bS5jIHdvdWxkIGJlIGEgZ29vZCBpZGVhIGZvcg0KdGhpcyBwYXRjaD8NCg0KPiANCj4+IC0tLQ0K
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wMm0uaCBiL3hlbi9hcmNo
L2FybS9pbmNsdWRlL2FzbS9wMm0uaA0KPj4gaW5kZXggOTQwNDk1ZDQyYi4uYTk2MjJkYWM5YSAx
MDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wMm0uaA0KPj4gKysrIGIv
eGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3AybS5oDQo+PiBAQCAtMTksNiArMTksMjIgQEAgZXh0
ZXJuIHVuc2lnbmVkIGludCBwMm1fcm9vdF9sZXZlbDsNCj4+ICAjZGVmaW5lIFAyTV9ST09UX09S
REVSICAgIHAybV9yb290X29yZGVyDQo+IA0KPiBZb3Ugc2VlbSB0byB1c2UgUDJNX1JPT1RfT1JE
RVIgdG8gYWxsb2NhdGUgcDJtLT5yb290IGluIGFybS9wMm0uYy4gSG93ZXZlciwgYXMgSSBtZW50
aW9uZWQgYmVmb3JlLCBJIGRvbid0IHRoaW5rIHRoZSBkZWZpbnRpb24gb2YgcDJtLT5yb290IGlz
IHN1aXRhYmxlIGZvciB0aGUgTVBVLiBJIHRoaW5rIHRoZSB0d28gZnVuY3Rpb25zIHVzaW5nIHAy
bS0+cm9vdCBzaG91bGQgYmUgbW92ZWQgaW4gbW11L3AybS5jIGFuZCBQMk1fUk9PVF9PUkRFUiBz
aG91bGQgYmUgbW92ZWQgaW4gbW11L3AybS5oLg0KDQpTdXJlLCB3aWxsIGZvbGxvdyB0aGF0LCBz
b3JyeSBmb3IgbWlzc2luZyB0aGlzIHBhcnQuDQoNCj4gDQo+PiAgI2RlZmluZSBQMk1fUk9PVF9M
RVZFTCBwMm1fcm9vdF9sZXZlbA0KPiANCj4gUDJNX1JPT1RfTEVWRUwgZG9lc24ndCBzZWVtIHRv
IG1ha2Ugc2Vuc2UgZm9yIHRoZSBNUFUuIFRoZSBvbmx5IHVzZSBpbiBhcmNoL2FybS9wMm0uYyBz
ZWVtcyB0byBiZSBpbiBkdW1wX3AybV9sb29rdXAoKSB3aGljaCBpcyBjYWxsaW5nIGFuIE1NVSBz
cGVjaWZpYyBmdW5jdGlvbi4gU28gSSB0aGluayB0aGlzIHdhbnRzIHRvIGJlIG1vdmVkIGluIHRo
ZSBNTVUgY29kZS4NCg0KV2lsbCBkbyBpbiB2OC4NCg0KPiANCj4+ICsjZGVmaW5lIFAyTV9ST09U
X1BBR0VTICAgICgxPDxQMk1fUk9PVF9PUkRFUikNCj4gDQo+IFNlZSBhYm92ZS4NCj4gDQo+IEFs
c28gTklULCBJIHdvdWxkIHN1Z2dlc3QgdG8gdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gdXNlIDFV
IGFuZCBhZGQgc3BhY2UgYmVmb3JlL2FmdGVyIDw8Lg0KDQpTb3VuZHMgZ29vZCwgd2lsbCBkbyBp
biB2OC4NCg0KPiANCj4+ICsNCj4+ICBzdHJ1Y3QgZG9tYWluOw0KPj4gICAgZXh0ZXJuIHZvaWQg
bWVtb3J5X3R5cGVfY2hhbmdlZChzdHJ1Y3QgZG9tYWluICopOw0KPj4gQEAgLTE1Niw2ICsxNzIs
MTAgQEAgdHlwZWRlZiBlbnVtIHsNCj4+ICAjZW5kaWYNCj4+ICAjaW5jbHVkZSA8eGVuL3AybS1j
b21tb24uaD4NCj4+ICArI2lmZGVmIENPTkZJR19NTVUNCj4+ICsjaW5jbHVkZSA8YXNtL21tdS9w
Mm0uaD4NCj4+ICsjZW5kaWYNCj4+ICsNCj4+ICBzdGF0aWMgaW5saW5lIGJvb2wgYXJjaF9hY3F1
aXJlX3Jlc291cmNlX2NoZWNrKHN0cnVjdCBkb21haW4gKmQpDQo+PiAgew0KPj4gICAgICAvKg0K
Pj4gQEAgLTE4MCw3ICsyMDAsMTEgQEAgdm9pZCBwMm1fYWx0cDJtX2NoZWNrKHN0cnVjdCB2Y3B1
ICp2LCB1aW50MTZfdCBpZHgpDQo+PiAgICovDQo+PiAgdm9pZCBwMm1fcmVzdHJpY3RfaXBhX2Jp
dHModW5zaWduZWQgaW50IGlwYV9iaXRzKTsNCj4+ICArdm9pZCBwMm1fdm1pZF9hbGxvY2F0b3Jf
aW5pdCh2b2lkKTsNCj4+ICtpbnQgcDJtX2FsbG9jX3ZtaWQoc3RydWN0IGRvbWFpbiAqZCk7DQo+
PiArDQo+PiAgLyogU2Vjb25kIHN0YWdlIHBhZ2luZyBzZXR1cCwgdG8gYmUgY2FsbGVkIG9uIGFs
bCBDUFVzICovDQo+PiArdm9pZCBzZXR1cF92aXJ0X3BhZ2luZ19vbmUodm9pZCAqZGF0YSk7DQo+
IA0KPiBJIGRvbid0IG11Y2ggbGlrZSB0aGUgaWRlYSB0byBleHBvcnQgc2V0dXBfdmlydF9wYWdp
bmdfb25lKCkuIENvdWxkIHdlIGluc3RlYWQgbW92ZSBjcHVfdmlydF9wYWdpbmdfY2FsbGJhY2so
KSAmIGNvIHRvIG1tdS9wMm0uYz8NCg0KWWVhaCBnb29kIGlkZWEsIHRoYW5rIHlvdSBmb3IgdGhp
cyBzdWdnZXN0aW9uIDopIHdpbGwgZG8gaW4gdjguDQoNClsxXSBodHRwczovL2dpdGxhYi5jb20v
eGVuLXByb2plY3QvcGVvcGxlL2hlbnJ5dy94ZW4vLS9jb21taXRzL21wdV92NS8/cmVmX3R5cGU9
aGVhZHMNCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0g
DQo+IEp1bGllbiBHcmFsbA0KDQo=

