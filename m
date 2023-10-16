Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D6F7CACF9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:08:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617728.960637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPCE-0003Xi-Og; Mon, 16 Oct 2023 15:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617728.960637; Mon, 16 Oct 2023 15:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPCE-0003Ug-Lu; Mon, 16 Oct 2023 15:07:54 +0000
Received: by outflank-mailman (input) for mailman id 617728;
 Mon, 16 Oct 2023 15:07:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4UvS=F6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qsPCC-0003UO-Hm
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:07:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5e3baf6-6c35-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 17:07:50 +0200 (CEST)
Received: from DB8P191CA0020.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::30)
 by DB4PR08MB9216.eurprd08.prod.outlook.com (2603:10a6:10:3f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:07:46 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::fb) by DB8P191CA0020.outlook.office365.com
 (2603:10a6:10:130::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Mon, 16 Oct 2023 15:07:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Mon, 16 Oct 2023 15:07:46 +0000
Received: ("Tessian outbound ab4fc72d2cd4:v211");
 Mon, 16 Oct 2023 15:07:46 +0000
Received: from a78082433673.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9A0475F1-6FC2-4643-9719-20D29345F128.1; 
 Mon, 16 Oct 2023 15:07:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a78082433673.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Oct 2023 15:07:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB9934.eurprd08.prod.outlook.com (2603:10a6:10:402::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 15:07:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:07:31 +0000
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
X-Inumbo-ID: c5e3baf6-6c35-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjQ5gsb+dvp+Dq+LLJ0NqXE5Ux566qyUYzoq8dTtpQc=;
 b=7M4XKsDOd4Prc+VWi5ZU5qJVKqM+z24c4EBz9txNckrAkXCbmGmW62I7fRgAe0HqAWIWlV7tSt0yK1UEduLppyMV3B6Go5zCshtvsP4jJkA6qYpLPUZJbGRRtE83ewgrA8SuygR0CZZj2XDqWfB4VMQK3cw3c3q0tRdKJFimCgU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ffb9fb81c46bfda6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odyBNrkaeNojTx1uqY9+oJYFqaoK7BoRn0v6BCg0PEJB9SQpk1o5j5wt/QCJNSXbCkxGKU8OYUgkurgE+PWD6xD212tl2mF7bR8nLF4W0HFGVTV98fkDxIscvKHbpvXb2vmiijl1vRSxROYqveR3YZTdtibdNKdzWQTiv1miOW4vbMYnTF1Ze7l+1Lo+NFIuv6E1SYF1DKG80ZBjbYcnNQAGHXkPojmIG9nKYZPN4V5WZpqPDxkeOOxrQNwPqDb8/1SKd2DUVD08h+tuXX07JoeLR/w1hdAJ5iSE2zW9otY1/codBYGA+i7O89YpZcHmN4EQ+imXDAxkKqtZHIv5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjQ5gsb+dvp+Dq+LLJ0NqXE5Ux566qyUYzoq8dTtpQc=;
 b=h7xAdn1rdo+eTdxF3N6Ml8XFDWJXcoQakp3Es1neXB7EFoZ8V/jRc3StI2NISyPEwFzM1T1ggleuSPPdvsbsi4PeNGPfu1VtqBgvRFJs33mQ7ojlQQk1qFraM5PZuTIYKmiKgNBVt5+CuAiT/LkUofV5gfH8fjZk2XrcBnZbKjj+GEA2SGAPqHj54+ExkaOqTtFqX+Pu0aLz5zbsj6gd5JJnuEtagkMVccYzkSBtLB5iC9gvZv7I9iA0L5dOAcBunyh77Fnbr2uBEKh/PVTgNOZLZ7Wgew5TpCmPhAxRjmvvPcrqAKxVnX1EOYfWPpg0RfC1/LBU3hMT47fJ36OcYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjQ5gsb+dvp+Dq+LLJ0NqXE5Ux566qyUYzoq8dTtpQc=;
 b=7M4XKsDOd4Prc+VWi5ZU5qJVKqM+z24c4EBz9txNckrAkXCbmGmW62I7fRgAe0HqAWIWlV7tSt0yK1UEduLppyMV3B6Go5zCshtvsP4jJkA6qYpLPUZJbGRRtE83ewgrA8SuygR0CZZj2XDqWfB4VMQK3cw3c3q0tRdKJFimCgU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Alexey Klimov <alexey.klimov@linaro.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	"leo.yan@linaro.org" <leo.yan@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Topic: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Index:
 AQHZ/dCeetLGz4GvX0qAhZnpE9HtkrBMHj+AgABWt4CAAAGagIAAA68AgAADAgCAAAYrgIAABd6A
Date: Mon, 16 Oct 2023 15:07:31 +0000
Message-ID: <794B0D71-70A7-4546-98E0-EC01573E0D89@arm.com>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
 <20231013122658.1270506-3-leo.yan@linaro.org>
 <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com>
 <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
 <8BCB97B4-CBDD-43D9-B0F8-7F637B8BE559@arm.com>
 <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com>
 <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com>
 <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org>
In-Reply-To: <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB9934:EE_|DBAEUR03FT043:EE_|DB4PR08MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b930f54-9c32-410b-cfb7-08dbce59a7b2
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vzUm0hiIFOImebwi4xSRnVziYWQkpV4n+U8Yy+TQtf+aCaXwzsX7VkGPkc9VQLZ3qWBwfvDD+L30fkjH8HVK45cudTU8jQ/fGAMZ7183ilfb3EirkQ+cOXS3YUVO1QeSV57uau2Vk2xPwqxkFEpk+QgY1icBGYuj9KUhH5jjNXYHdrWckb0NQpY0PRPzbGFU0hL+iReaqPiSZPB8rxBQLzhQhX6egnUMznGr6ZvNaznG7mrzCEOGTm8GEOuEaHOzBmqvABYt0PwJmFIXBYJi84i9NXj4IAW6yNUXteZTU/lz8z1wHzcXzCmL/gLXw/Kcc71BCOV3PIyDe+lx5s+hOAYPiqG/r0KOTguwQPGNE/63WYMcvRkSF58ESBLRZKkBL06eMZAe2OdTTM032RhbnhDq01QJAJxQOyIHaEfA6pe+/rqJbhmB8ZR2c/Cpb9dGU2qNMkNJ91H4BrXXqqnR4VhTX6IZmFnyiA6LrZhygI6wJWf5lwrga1+xNMyv0bycMLAgu7apK4hlLNuDffB+qO/s2g7XIWY0My50lo4j6Pjv2bQTwdLpXdI39eW4f0/f6kSihtEX5I4QC9rwWIx0H/CpcYFxCszAQLZLDI+wM1+toFm255rPdNunc+OpQ0s6GBOcgLnLAWGLEM3lyfueN59CGAOH1ELehQNUEuN3zlI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(136003)(366004)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(2616005)(71200400001)(6506007)(6512007)(53546011)(66476007)(54906003)(83380400001)(41300700001)(478600001)(5660300002)(4326008)(6486002)(2906002)(8676002)(8936002)(66946007)(76116006)(316002)(6916009)(66446008)(91956017)(66556008)(64756008)(122000001)(38070700005)(86362001)(38100700002)(36756003)(33656002)(147533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB577C195C9F8746BC70C137F36CCF99@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9934
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d77393a-d172-47d4-e040-08dbce599ef9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MKLsgpFmV3uw5Ha3FNbPOaXfIQaZYt67yFlWLI0qgdvHQ04Tiqxw4PRfjKM2oJnqy4NNmObgzEzoViE5d5bXLSPkq8zTHUnoZX0SXJWyGFa6Gb6GOvdIg0Xdl+HSpwun/jPZR9wF7Xpacl1ZPVGHuUYu1dTpJgeuB4vzn2sMYEx6jYAjePVM8aOyLQZqh6wtvMJgTP5m7FFKLL7Ukwbhjc0D6gNbd/wPG5Zqm0q48fUV+g1gZaBozFFs6weiySorQ5jqp4B2ea3uuPXzPgqGXEkqQBhe/Pf8oQkW7GV+66GO13mPhz2SNoeBkUtnHUNZ7ThJm+Q/taQm4oaYsdffAMqp30gtOaf6xpcyrvJWwWmJOfFNG7vmesIFr8ZzNcLFOsSkrls22YIs+m1w2CTKTFkW6CfeAG6J3e8Bxwefbq4Ark8ee1HSLCjyL8vpd6f4eOh2Ajku1hmnIBZk6oE+axYSq3GGlr51JJsBSOIISuDJb+1KpURqu0bNNDkXpHjU0wwSLiygfWEx8w7BcO87B4QF26qgvYvdcAdhynkkVuHCuSJendtbB6jlsixagkbMVScsZnW+jRAGhz66yU0aSmhXWtAdj9URzxvRsjp+Q1FNMHSdPlOcnitgr67yK14pKTbLjDIGW6EyGB3WcQvYZf1ro4sHYrGqQUl/rGClJuBV3K6P/q/DqHZgoc2yGnWSamfObNxLQZw5neXpCD5ai58t2Zy6zktD+esXLu7iWpR59X2KsvbMZb/2MKIM/V1oPk1Qja++W7MB9V00RqDoKg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39850400004)(230922051799003)(1800799009)(451199024)(82310400011)(186009)(64100799003)(40470700004)(46966006)(36840700001)(6506007)(40480700001)(53546011)(5660300002)(40460700003)(2906002)(26005)(36756003)(2616005)(336012)(83380400001)(33656002)(82740400003)(356005)(81166007)(86362001)(6512007)(36860700001)(47076005)(478600001)(6486002)(41300700001)(316002)(54906003)(70586007)(70206006)(4326008)(6862004)(8936002)(8676002)(147533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:07:46.3825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b930f54-9c32-410b-cfb7-08dbce59a7b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9216

SGksDQoNCj4gT24gMTYgT2N0IDIwMjMsIGF0IDE2OjQ2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IENDIEhlbnJ5DQo+IA0KPiBIaSBBbGV4ZXksDQo+IA0KPiBP
biAxNi8xMC8yMDIzIDE1OjI0LCBBbGV4ZXkgS2xpbW92IHdyb3RlOg0KPj4gT24gTW9uLCAxNiBP
Y3QgMjAyMyBhdCAxNToxMywgTHVjYSBGYW5jZWxsdSA8THVjYS5GYW5jZWxsdUBhcm0uY29tPiB3
cm90ZToNCj4+PiANCj4+PiANCj4+PiANCj4+Pj4gT24gMTYgT2N0IDIwMjMsIGF0IDE1OjAwLCBC
ZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4+PiAN
Cj4+Pj4gSGkNCj4+Pj4gDQo+Pj4+ICtMdWNhIGFuZCBSYWh1bA0KPj4+PiANCj4+Pj4+IE9uIDE2
IE9jdCAyMDIzLCBhdCAxNTo1NCwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6
DQo+Pj4+PiANCj4+Pj4+IA0KPj4+Pj4gDQo+Pj4+PiBPbiAxNi8xMC8yMDIzIDA5OjQ0LCBNaWNo
YWwgT3J6ZWwgd3JvdGU6DQo+Pj4+Pj4gSGksDQo+Pj4+PiANCj4+Pj4+IEhpLA0KPj4+Pj4gDQo+
Pj4+Pj4gT24gMTMvMTAvMjAyMyAxNDoyNiwgTGVvIFlhbiB3cm90ZToNCj4+Pj4+Pj4gDQo+Pj4+
Pj4+IA0KPj4+Pj4+PiBPbiBBRExpbmsgQVZBIHBsYXRmb3JtIChBbXBlcmUgQWx0cmEgU29DIHdp
dGggMzIgQXJtIE5lb3ZlcnNlIE4xIGNvcmVzKSwNCj4+Pj4+Pj4gdGhlIHBoeXNpY2FsIG1lbW9y
eSByZWdpb25zIGFyZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+ICBEUkFNIG1lbW9yeSByZWdpb25zOg0K
Pj4+Pj4+PiAgICBOb2RlWzBdIFJlZ2lvblswXTogMHgwMDAwODAwMDAwMDAgLSAweDAwMDBmZmZm
ZmZmZg0KPj4+Pj4+PiAgICBOb2RlWzBdIFJlZ2lvblsxXTogMHgwODAwMDAwMDAwMDAgLSAweDA4
MDA3ZmZmZmZmZg0KPj4+Pj4+PiAgICBOb2RlWzBdIFJlZ2lvblsyXTogMHgwODAxMDAwMDAwMDAg
LSAweDA4MDdmZmZmZmZmZg0KPj4+Pj4+PiANCj4+Pj4+Pj4gVGhlIFVFRkkgbG9hZHMgWGVuIGh5
cGVydmlzb3IgYW5kIERUQiBpbnRvIHRoZSBoaWdoIG1lbW9yeSwgdGhlIGtlcm5lbA0KPj4+Pj4+
PiBhbmQgcmFtZGlzayBpbWFnZXMgYXJlIGxvYWRlZCBpbnRvIHRoZSBsb3cgbWVtb3J5IHNwYWNl
Og0KPj4+Pj4+PiANCj4+Pj4+Pj4gIChYRU4pIE1PRFVMRVswXTogMDAwMDA4MDdmNmRmMDAwMCAt
IDAwMDAwODA3ZjZmM2UwMDAgWGVuDQo+Pj4+Pj4+ICAoWEVOKSBNT0RVTEVbMV06IDAwMDAwODA3
ZjgwNTQwMDAgLSAwMDAwMDgwN2Y4MDU2MDAwIERldmljZSBUcmVlDQo+Pj4+Pj4+ICAoWEVOKSBN
T0RVTEVbMl06IDAwMDAwMDAwZmE4MzQwMDAgLSAwMDAwMDAwMGZjNWRlMWQ1IFJhbWRpc2sNCj4+
Pj4+Pj4gIChYRU4pIE1PRFVMRVszXTogMDAwMDAwMDBmYzVkZjAwMCAtIDAwMDAwMDAwZmZiM2Y4
MTAgS2VybmVsDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBJbiB0aGlzIGNhc2UsIHRoZSBYZW4gYmluYXJ5
IGlzIGxvYWRlZCBhYm92ZSA4VEIsIHdoaWNoIGV4Y2VlZHMgdGhlDQo+Pj4+Pj4+IG1heGltdW0g
c3VwcG9ydGVkIGlkZW50aXR5IG1hcCBzcGFjZSBvZiAyVEIgaW4gWGVuLiBDb25zZXF1ZW50bHks
IHRoZQ0KPj4+Pj4+PiBzeXN0ZW0gZmFpbHMgdG8gYm9vdC4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFRo
aXMgcGF0Y2ggZW5sYXJnZXMgaWRlbnRpdHkgbWFwIHNwYWNlIHRvIDEwVEIsIGFsbG93aW5nIG1v
ZHVsZSBsb2FkaW5nDQo+Pj4+Pj4+IHdpdGhpbiB0aGUgcmFuZ2Ugb2YgWzB4MCAuLiAweDAwMDAw
OWZmX2ZmZmZfZmZmZl0uDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBGaXhlczogMWM3OGQ3NmI2NyAoInhl
bi9hcm02NDogbW06IEludHJvZHVjZSBoZWxwZXJzIHRvIHByZXBhcmUvZW5hYmxlL2Rpc2FibGUi
KQ0KPj4+Pj4+IEkgZG9uJ3QgdGhpbmsgYSBmaXhlcyB0YWcgYXBwbGllcyBoZXJlIGdpdmVuIHRo
YXQgMlRCIHdhcyBqdXN0IGEgbnVtYmVyIHdlIGJlbGlldmVkIGlzIGVub3VnaA0KPj4+Pj4+IGFu
ZCBhbGwgb2YgdGhpcyBpcyBwbGF0Zm9ybSBkZXBlbmRlbnQuDQo+Pj4+Pj4gVGhpcyBjYW4gYmUg
ZHJvcHBlZCBvbiBjb21taXQgaWYgY29tbWl0dGVyIGFncmVlcw0KPj4+Pj4gWGVuIG1heSBoYXZl
IGJvb3RlZCBvbiB0aGF0IHBsYXRmb3JtIGJlZm9yZSBoYW5kLiBTbyB0aGlzIHdvdWxkIGJlIGNv
bnNpZGVyZWQgYSByZWdyZXNzaW9uIGFuZCB0aGVyZWZvcmUgYSB0YWcgd291bGQgYmUgd2FycmFu
dC4NCj4+Pj4+IA0KPj4+Pj4gQUZBSUNULCB0aGUgY29tbWl0IGlzIG9ubHkgcHJlc2VudCBvbiB0
aGUgdXBjb21pbmcgNC4xOC4gU28gdGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgWGVuIDQuMTcgYm9v
dGVkIG91dC1vZi10aGUtYm94IG9uIEFETGluaz8gSWYgdGhlIGFuc3dlciBpcyB5ZXMsIHRoZW4g
d2UgbmVlZCB0byBhZGQgYSBGaXhlcyB0YWcuIEJ1dCB0aGUgY29ycmVjdCBvbmUgd291bGQgYmUN
Cj4+Pj4+IA0KPj4+PiANCj4+Pj4gQFJhaHVsIG9yIEx1Y2E6IGNvdWxkIHlvdSBnaXZlIGFuIGFu
c3dlciBoZXJlID8NCj4+Pj4gSSBrbm93IHlvdSB1c2VkIFhlbiBvbiBhbiBBVkEgcGxhdGZvcm0g
YnV0IHdhcyBpdCBib290aW5nIG91dCBvZiB0aGUgYm94ID8NCj4+PiANCj4+PiBJIGNhbuKAmXQg
c2F5IGZvciBYZW4gNC4xNywgYnV0IG91ciBuaWdodGx5IGpvYiBoYXMgcnVuIHN1Y2Nlc3NmdWxs
eSBvbiBBVkEgZm9yIHRoZSBjb21taXQgNzMwNDA2YWI4MTA5NDExNWQ5ZmI1Y2EwMGJhOGQ1M2Nl
YzEyNzliMw0KPj4+IChkb2NzL21pc3JhOiBhZGQgZGV2aWF0aW9ucy5yc3QgdG8gZG9jdW1lbnQg
YWRkaXRpb25hbCBkZXZpYXRpb25zLikNCj4+PiANCj4+PiBXZSBhcmUgbm90IGFwcGx5aW5nIGFu
eSBwYXRjaCBmb3IgaXQgdG8gcnVuIG9uIEFWQS4NCj4+IE1vc3QgbGlrZWx5IGl0IGlzIGJlY2F1
c2UgeW91ciBVRUZJL0JJT1MgZmlybXdhcmUgaXMgMi54LCBmb3IgaW5zdGFuY2UNCj4+IDIuMDQu
MTAwLjA3Lg0KPj4gVGhpcyBmaXggaWYgZm9yIEFWQSBtYWNoaW5lIHdpdGggb2xkZXIgVUVGSSBm
aXJtd2FyZSAxLjA3LjMwMC4wMy4NCj4gDQo+IE9PSSwgd2h5IG5vdCB1cGRhdGluZyB5b3VyIGZp
cm13YXJlPyBJIHdhcyBleHBlY3RpbmcgdGhhdCBpdCB3b3VsZCBhbHNvIGNvbnRhaW4gb3RoZXIg
Y3JpdGljYWwgZml4ZXMuDQo+IA0KPiBXaXRoIHRoaXMgaW4gbWluZCwgSSBhbSBub3cgbW9yZSBp
biB0d28gbWluZCB0byBhc2sgdG8gbWVyZ2UgdGhpcyBwYXRjaCBpbiBYZW4gNC4xOC4gT24gb25l
IGhhbmQsIEkgdW5kZXJzdGFuZCBpdCB3aWxsIGhlbHAgdG8gYm9vdCBvbiBBVkEgbWFjaGluZSB3
aXRoIGFuIG9sZGVyIGZpcm13YXJlLiBCdXQgb24gdGhlIG90aGVyIGhhbmQgdGhpcyBpcyBjaGFu
Z2luZyB0aGUgbWVtb3J5IGxheW91dCBxdWl0ZSBsYXRlIGluIHRoZSByZWxlYXNlLiBUaGUgcmlz
ayBzZWVtcyBsaW1pdGVkIGJlY2F1c2UgWGVuIGlzIG5vdCBsb2FkZWQgYXQgdGhlIHRvcCBvZiB0
aGUgdmlydHVhbCBhZGRyZXNzIHNwYWNlICh0aGVyZSBpcyB0aGUgZGlyZWN0bWFwIGFmdGVyd2Fy
ZHMpLg0KPiANCj4gSGVucnkgKGFzIHRoZSByZWxlYXNlIG1hbmFnZXIpIGFuZCBvdGhlcnMsIGFu
eSBvcGluaW9ucz8NCg0KV2l0aCB0aGUgbmV3IGluZm9ybWF0aW9uLCBJIHRoaW5rIGl0IHNob3Vs
ZCBiZSBzdGF0ZWQgdGhhdCBpdCBpcyBmaXhpbmcgYW4gaXNzdWUgb24gQVZBIHBsYXRmb3JtcyB1
c2luZyBhbiBvbGQgZmlybXdhcmUgYW5kIHBsYXRmb3JtcyB3aXRoIGFuZCB1cC10by1kYXRlIGZp
cm13YXJlIGFyZSBub3QgaW1wYWN0ZWQuDQpJdCBpcyBhbiBpbXBvcnRhbnQgaW5mb3JtYXRpb24g
dG8ga2VlcCBpbiBtaW5kIHRoYXQgdGhpcyBpcyBub3QgYSBmaXggdG8gYmUgYmFja3BvcnRlZCBm
b3IgZXhhbXBsZSAoYW5kIGZvciBtZSB0aGUgZml4ZXMgdGFnIHNob3VsZCBub3QgYmUga2VwdCku
DQoNCk9uIHdoZXRoZXIgb3Igbm90IGl0IHNob3VsZCBnbyBpbiB0aGUgcmVsZWFzZSwgSSBhbSBu
b3QgcXVpdGUgc3VyZSB0aGF0IG1ha2luZyBhIGNoYW5nZSBpbiB0aGUgbGF5b3V0IGF0IHRoYXQg
c3RhZ2UgaXMgYSBnb29kIGlkZWEgdW5sZXNzIGl0IGlzIGZpeGluZyBhIGNyaXRpY2FsIGlzc3Vl
ICh3aGljaCBpcyBub3QgdGhlIGNhc2UgaGVyZSkuDQpTbyBpIHdvdWxkIHZvdGUgbm8gYnV0IG5v
dCBnbyBhZ2FpbnN0IGlmIHNvbWVvbmUgYXJndWUgdG8gaGF2ZSBpdCBpbi4NCg0KQ2hlZXJzDQpC
ZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg0K

