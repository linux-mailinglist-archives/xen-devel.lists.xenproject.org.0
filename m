Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90AB4501FD
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 11:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225729.389848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYsq-0003og-Mt; Mon, 15 Nov 2021 10:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225729.389848; Mon, 15 Nov 2021 10:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYsq-0003lw-JN; Mon, 15 Nov 2021 10:06:40 +0000
Received: by outflank-mailman (input) for mailman id 225729;
 Mon, 15 Nov 2021 10:06:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z40d=QC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mmYso-0003lm-DW
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 10:06:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7d00::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7cc03ef-45fb-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 11:06:36 +0100 (CET)
Received: from AM6PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:20b:92::40)
 by PA4PR08MB6045.eurprd08.prod.outlook.com (2603:10a6:102:ef::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Mon, 15 Nov
 2021 10:06:33 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::3c) by AM6PR04CA0027.outlook.office365.com
 (2603:10a6:20b:92::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Mon, 15 Nov 2021 10:06:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Mon, 15 Nov 2021 10:06:33 +0000
Received: ("Tessian outbound 892d2780d3aa:v109");
 Mon, 15 Nov 2021 10:06:33 +0000
Received: from 041f24789442.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE625DB4-E362-45C7-875C-F59A4932E5E0.1; 
 Mon, 15 Nov 2021 10:06:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 041f24789442.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Nov 2021 10:06:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6120.eurprd08.prod.outlook.com (2603:10a6:20b:299::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.22; Mon, 15 Nov
 2021 10:06:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 10:06:20 +0000
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
X-Inumbo-ID: b7cc03ef-45fb-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFw2j1tjf25NBA1dYggn3WSIt5R0FrngJH9QcQcSJho=;
 b=Vn4+lZVtUhDfRrkb//UUrVH4h9a7TY16LKw7ZWeSjmnlyVZqKJyVX7UnH1Rh3nqUwqyL5v2ECLQ3UAtq2i39HjkaQyXi/ZAm+kxQ8piSj01ey9JEAyc8T9XyrRavD0N0s5TqnN6OgG/TFo+xLxR8vFhbGynTY5FipgHWF9ZTbQA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 436493fee11f8302
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrkq12iBx/RKwpHwd3IJlG86tGiigHb2mVQoCyc5Jc05ntMnj/cXvz5qGiZgsfCnLUDcmwbedBFwAmPS1EpvXIik5zpfuXshU/KcWPt5+qv68gWLqhkDK+UbL32INnAZc/ODK3nA8x2w06rB8Mh1Vo8Vu4b5SVpRNki31EB3Ftopn6Y9jCBP28GV6kliGI5Nz5orR9r8ldLNj8XSGBslf993P9H61y0CSifT6iIqmTNrOxYdCZPyxfwD5DsH/ebafjpwlcDYE7pXM7R2Zbtk9G5GKm1i1Wb1fJYDrW5g0J0Wl/0/p8ifLzDF+Qu0zHgdlaqAob5BgIhEewlnViaFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFw2j1tjf25NBA1dYggn3WSIt5R0FrngJH9QcQcSJho=;
 b=YFJoej2vH4gZTXk3EpRYEDugmcUysoNUowAHyo9wE7GokT36tQgWM3LKr8Vf1BxLPDgMgEbThxYcSkBdnNIB7wo5O7Ae87ZZ4ynjUa3ytEWlxFkBgqwPxrMP9qj061SrG1EKOpShus60h7UBGmPnxJI14M7lydjLgUbf3ls8iDwI+4906936qggtvgnkOCW/1IEEbCwgAoM3joPr+GYnws/GxY0Rvm3fx7g2Mmvxux4NSIJqO0xZhceediBsHcApbFNuoTeq2Eowzj3vJAealCwyGi6pd2e2KbaRWTxPlvri1VcxzMaEGkibPZUkd363WSplz93aaxohgBMDw+NXGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFw2j1tjf25NBA1dYggn3WSIt5R0FrngJH9QcQcSJho=;
 b=Vn4+lZVtUhDfRrkb//UUrVH4h9a7TY16LKw7ZWeSjmnlyVZqKJyVX7UnH1Rh3nqUwqyL5v2ECLQ3UAtq2i39HjkaQyXi/ZAm+kxQ8piSj01ey9JEAyc8T9XyrRavD0N0s5TqnN6OgG/TFo+xLxR8vFhbGynTY5FipgHWF9ZTbQA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: Julien Grall <julien.grall.oss@gmail.com>, Henry Wang
	<Henry.Wang@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ACPI/UEFI support for Xen/ARM status?
Thread-Topic: ACPI/UEFI support for Xen/ARM status?
Thread-Index:
 AQHX133CsQ6+s6pLvkyQczdSyBF05qv/ZG4AgACk+gCAAAUHAIAADdAAgAAM2gCAADyfAIAADw8AgAAGlgCAAAfxAIAAIj8AgAO8VYA=
Date: Mon, 15 Nov 2021 10:06:20 +0000
Message-ID: <E6611A60-F092-4D47-8756-7A6A33840B5F@arm.com>
References: <YY3tSAFTCR4r2FaI@mattapan.m5p.com>
 <AM9PR08MB62428F41C4F998AD676C027C92959@AM9PR08MB6242.eurprd08.prod.outlook.com>
 <YY6L5JQPn0s3c6Jp@mattapan.m5p.com>
 <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
 <YY6bsu8/y/LeMfg3@mattapan.m5p.com>
 <40474f12-e269-f251-99b1-cb5b0a317bb2@xen.org>
 <YY7ZVPQSTapB7Jnj@mattapan.m5p.com>
 <CAJ=z9a0EooNfXyrNB82_4yT9qnz5fxEJtVN6oUbVyCzjU4hEKA@mail.gmail.com>
 <YY7rfIWPC1PwidMA@mattapan.m5p.com>
 <CAJ=z9a1=V+MKD0a9aTCBvy-1nxKj4TC7ZOg82oBYn1vmfsu23g@mail.gmail.com>
 <YY8O4GOfYg4Bz2CW@mattapan.m5p.com>
In-Reply-To: <YY8O4GOfYg4Bz2CW@mattapan.m5p.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 681e4a6a-8009-46aa-9f85-08d9a81f9a3b
x-ms-traffictypediagnostic: AS8PR08MB6120:|PA4PR08MB6045:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB60459FF1051D56BD2F92BEDA9D989@PA4PR08MB6045.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 alBWehHlaHSSFuOFHcyf3TBfpaK81On4nToP98P9uNND5lrztLo6HzzCkLIv9CaeBEM5Xuyn2Q/aruVlqMeYYylK/rRq8R7lev+w0yJvV9CNTvuGYzSVJ9jvYO4K+BBoXPwBh3UV8+bOGDZe9poxAkBdg16oB1gUKj4jahxsSjU8H2CRucFLJpFUX5ei+xpKUG22rF7Cq4sTVaSY3xeymW/Yr+G9xG8RzJP/Dbebki4aZL5ALxdaTsamZdLWqxJFDwUK+/kJUZ0OXdNy6pwN9lzd7GxdEn8b7cN0FoApA0NM70nNfNVyXoOVpEr1lWhZib3EfPRK9K68BsIcFF/Tdvf1W6h6Ebt7LN7Tjm4jAMqJgiecw0PXSPuzK8iU2nkyXWORp+YF7MKY7RzrSsw1JPgmxgtlxetC1RiQEFRYkIXwutEagRkreoEYPYfZaU3jZ3rBoNuDspiN3YUG+Wf5VKLYdli/dSfGN8m5/PqOrY32+dVav2vbhbxg7Rhw5ncdsiZrOd6Ux5yuGYedr2fAx2xF6pT6UM0wYhrK/2Qxk1e6kt6AnOrXvttNgAr5cvxW7ES1lTA7iABizWopyNEsmsv/SCse7/Hzemnz2vYcBXrakiblyF+2MI8TmSVb2MMPrazh6AZBR+T7SPTKSRMESpnGIzec1MKs/c9DWlOoDJURQ5afZxAnobSYb20FD75MFueS2EqpbmpK+jxRfkaZoaD79dN4tcSS7p5JPvVv5NFUqvDh5n8TOggiXSdMmquG
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(76116006)(86362001)(91956017)(2616005)(83380400001)(2906002)(6512007)(66946007)(6486002)(54906003)(8676002)(5660300002)(8936002)(66476007)(508600001)(36756003)(316002)(71200400001)(4326008)(6506007)(53546011)(66556008)(64756008)(66446008)(122000001)(26005)(38100700002)(38070700005)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F57EA136CF978D459F33591909510D79@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6120
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	99567cef-4533-4db1-c0e4-08d9a81f9286
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8BiW/q88n2d++jqIVRC+vYRMbVbt1vqjZKFwiGBIHQuCsZYGwR/7BMpueIF109bOdhJmRm8c30+MNrcKpMQS0t5TWc4j5AtZi/ZoJiXuTATtyF8btbKKyvaiyNSDEIjYyzk7y/osXTxKCEfGylHHE2ef8lLflOetJamJrfokhekwnHI0fWlKJl+VgvIcrj3oxi/2k6lnAj88cVbP8DJ11In3XKkHUDjYd54N077Ux6HhyBCm9AkCEQytVyLf5yws8o5Y3Bx6BZogTwYPLLsYIxC+4r8v37GnF/NFN03MstxIwxO+84YHY6E07szJVaq7IppNaRpKXzzzkOqyP3aHl2FQM/CW6fdpAle8oGoKRSkCf4/Ffw2grkG40LAeAcVaa4H7k4+KBRlKnJPlF/GmOoZbtJSevOxWwUGsdgjHvxzd3ucvjJrBB/S4LBbcbUJPKnnXvr5QY6IIExCydvwbyiAv4iPyfsG4C6wmSQzWnned0k38retnRHDhweXD361BQCKugGRiz1ou4tN3TfVg2kjAn1hofQeWS8196ah9Tny7DvDmHdHIhS4I2SO+lmQl3SF1lhgI0SrhKq9bY1Dmba79yGO6xp0Njgtdqyqz14Um0mG2LY2crDUtxtwVWUgoIGuqWoatM1Nm86SnkRo0Ai3y4q0Mg6Vkgne0tRs7zdLzN5yLQBIOFjzX0d3l6sqt+73F7EUHKqZnTxiiOSOkSw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(47076005)(36860700001)(53546011)(54906003)(8936002)(82310400003)(5660300002)(26005)(6506007)(186003)(8676002)(36756003)(6862004)(4326008)(6486002)(70586007)(2616005)(70206006)(2906002)(33656002)(81166007)(336012)(316002)(86362001)(356005)(6512007)(83380400001)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 10:06:33.4087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 681e4a6a-8009-46aa-9f85-08d9a81f9a3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6045

SGkgRWxsaW90dCwNCg0KPiBPbiAxMyBOb3YgMjAyMSwgYXQgMDE6MDMsIEVsbGlvdHQgTWl0Y2hl
bGwgPGVoZW0reGVuQG01cC5jb20+IHdyb3RlOg0KPiANCj4gT24gRnJpLCBOb3YgMTIsIDIwMjEg
YXQgMTE6MDA6NTRQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gT24gRnJpLCAxMiBO
b3YgMjAyMSBhdCAyMjozMiwgRWxsaW90dCBNaXRjaGVsbCA8ZWhlbSt4ZW5AbTVwLmNvbT4gd3Jv
dGU6DQo+Pj4+IE15IHByZWZlcmVuY2UgaXMgdG8gaW50cm9kdWNlIGEgcGVyLXBsYXRmb3JtIHF1
aXJrIChJIGJlbGlldmUgU3RlZmFubyB3YXMgaGFwcHkNCj4+Pj4gd2l0aCB0aGlzKS4gVGhlIGFk
dmFudGFnZSBpcyB3ZSBjb3VsZCBnZXQgQUNQSSBzdXBwb3J0IGZvciB5b3VyIGJvYXJkIGhvcGVm
dWxseQ0KPj4+PiBtZXJnZWQgcXVpY2tlci4NCj4+PiANCj4+PiBUaGlzIGNvdWxkIGJlIHdvcmth
YmxlIGFzIGEgdGVtcG9yYXJ5IHdvcmthcm91bmQuICBMb25nZXIgdGVybSBJIHN1c3BlY3QNCj4+
PiBpdCBtaWdodCB3ZWxsIGJlIHJhdGhlciBiZXR0ZXIgdG8gKmZ1bGx5KiB0YWNrbGUgdGhlIGlz
c3VlICpub3cqLg0KPj4+IE90aGVyd2lzZSB0aGlzIHNlZW1zIGxpa2VseSB0byB0dXJuIGludG8g
YSBkYXRhYmFzZSBvZiBib2FyZC1zcGVjaWZpYw0KPj4+IGhhY2tzIGZvciBodW5kcmVkcyBvciB0
aG91c2FuZHMgb2YgZGV2aWNlcy4NCj4+IA0KPj4gQXMgdXN1YWwsIHlvdSBoYXZlIHRvIGZpbmQg
YSBiYWxhbmNlIGJldHdlZW4gY29zdCB2cyBiZW5lZml0cy4NCj4+IA0KPj4gSWYgeW91IGxvb2sg
YXQgdGhlIERldmljZS1UcmVlIHNpZGUsIHdlIGRvbicgdCBoYXZlIG1hbnkgcGxhdGZvcm1zDQo+
PiByZXF1aXJpbmcgcXVpcmtzLg0KPj4gSW4gcGFydGljdWxhciwgdGhlIERNQSBpcyBzbyBmYXIg
c3RyaWN0bHkgbGltaXRlZCB0byBhIHNpbmdsZSBwbGF0Zm9ybSAoUlBJKS4NCj4+IFNvIEkgd291
bGQgYmUgc3VycHJpc2VkIGlmIHdlIHN1ZGRlbmx5IHJlcXVpcmUgdG9ucyBvZiBxdWlya3Mgd2hl
biB1c2luZw0KPj4gQUNQSS4NCj4gDQo+IFByZXNlbnRseSB0aGUgRE1BIHF1aXJrIHdvdWxkIGJl
IHRoZSBvbmx5IGNvbnN1bWVyLCBidXQgdGhlcmUgd2lsbCBsaWtlbHkNCj4gYmUgb3RoZXIgY29u
c3VtZXJzIGxhdGVyLiAgTWlnaHQgdGhlcmUgYmUgZmV3IGRldmljZS10cmVlIHF1aXJrcyBkdWUg
dG8gYQ0KPiBzaG9ydCBsaXN0IG9mIHBsYXRmb3Jtcz8gIE1pZ2h0IGZ1bGwgQUNQSSBzdXBwb3J0
IHZhc3RseSBpbmNyZWFzZQ0KPiBYZW4vQVJNJ3MgdGFyZ2V0IGF1ZGllbmNlPyAgKHBhcnRpYWxs
eSBBQ1BJIHNvIGNvbXBsZXggdG8gc3VwcG9ydCBzbyBtYW55DQo+IHZhcmllZCBkZXZpY2VzKQ0K
DQpXZSBoYXZlIGJlZW4gbG9va2luZyBhdCB0aGUgcG9zc2liaWxpdHkgdG8gaGF2ZSBBQ1BJIHN1
cHBvcnQgaW4gWGVuLg0KVGhlIG1haW4gcHJvYmxlbSB3aXRoIHRoYXQgaXMgdGhlIGNvc3QgaW4g
bGluZXMgb2YgY29kZSBpbiBYZW4gd2hpY2ggd291bGQgYmUgaGlnaA0KYW5kIGFzIGEgY29uc2Vx
dWVuY2UgdGhlIG1haW50ZW5hbmNlIGNvc3Qgd291bGQgYmUgaGlnaC4NClNvIGlmIGFueXRoaW5n
IGlzIGRvbmUgaXQgbXVzdCBzdGF5IHByb3Blcmx5IGxpbWl0ZWQgdXNpbmcgaWZkZWZzIHRvIG1h
a2Ugc3VyZSBwZW9wbGUNCm5lZWRpbmcgYSDigJxzbWFsbOKAnSB4ZW4gY2FuIHN0aWxsIGhhdmUg
b25lLg0KDQpOb3cgSSBhbSBvbiB0aGUgc2FtZSBzaWRlIGFzIEp1bGllbiwgSSB3b3VsZCBiZSB2
ZXJ5IGhhcHB5IHRvIGhlbHAgcmV2aWV3aW5nIGlmIHlvdQ0KZGVjaWRlIHRvIGRvIHRoZSB3b3Jr
IDotKQ0KDQo+IA0KPiBJIGRvIGNvbmNlZGUgYSBkZXZpY2UtcXVpcmsgaXMgcmVhc29uYWJsZSBm
b3IgdGhlIHNob3J0LXRlcm0uICBQcmVzZW50bHkNCj4gSSBkb24ndCBrbm93IHdoZXJlIHRvIGxv
b2sgZm9yIGJldHRlciBtYXRjaGluZyB0YXJnZXRzLCBzbyBJJ20gdHJhcHBlZCBpbg0KPiBhIGNh
dmUgd2l0aCBubyBsaWdodC4NCg0KV2hhdCBpcyB5b3VyIG5lZWQgZXhhY3RseSA/IEEgdGFyZ2V0
IHdpdGggZnJhbWUgYnVmZmVyIHN1cHBvcnQgPw0KDQpSZWdhcmRzDQpCZXJ0cmFuZA0KDQo+IA0K
PiANCj4gLS0gDQo+IChcX19fKFxfX18oXF9fX19fXyAgICAgICAgICAtLT0+IDgtKSBFSE0gPD0t
LSAgICAgICAgICBfX19fX18vKV9fXy8pX19fLykNCj4gXEJTICggICAgfCAgICAgICAgIGVoZW0r
c2lnbXNnQG01cC5jb20gIFBHUCA4NzE0NTQ0NSAgICAgICAgIHwgICAgKSAgIC8NCj4gIFxfQ1Nc
ICAgfCAgX19fX18gIC1PICNpbmNsdWRlIDxzdGRkaXNjbGFpbWVyLmg+IE8tICAgX19fX18gIHwg
ICAvICBfLw0KPiA4QTE5XF9fX1xffF8vNThEMiA3RTNEIERERjQgN0JBNiA8LVBHUC0+IDQxRDEg
QjM3NSAzN0QwIDg3MTRcX3xfL19fXy81NDQ1DQoNCg==

