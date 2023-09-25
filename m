Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C76F7AD69D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 13:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607808.946119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkjNa-0007Nv-A0; Mon, 25 Sep 2023 11:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607808.946119; Mon, 25 Sep 2023 11:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkjNa-0007L7-77; Mon, 25 Sep 2023 11:03:54 +0000
Received: by outflank-mailman (input) for mailman id 607808;
 Mon, 25 Sep 2023 11:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LToL=FJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkjNZ-0007Jn-1D
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 11:03:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 357893a2-5b93-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 13:03:51 +0200 (CEST)
Received: from AS4P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::12)
 by AS8PR08MB8393.eurprd08.prod.outlook.com (2603:10a6:20b:569::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 11:03:46 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5e3:cafe::61) by AS4P250CA0022.outlook.office365.com
 (2603:10a6:20b:5e3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 11:03:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.17 via Frontend Transport; Mon, 25 Sep 2023 11:03:45 +0000
Received: ("Tessian outbound 30c9f5e988c5:v175");
 Mon, 25 Sep 2023 11:03:45 +0000
Received: from da5545214619.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0196B650-7416-413E-95C4-263288D3E622.1; 
 Mon, 25 Sep 2023 11:03:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da5545214619.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Sep 2023 11:03:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6539.eurprd08.prod.outlook.com (2603:10a6:10:23f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 11:03:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 11:03:31 +0000
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
X-Inumbo-ID: 357893a2-5b93-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axdkgzcnmGvRCT1eSkQ6qtDz8CiwhIsjf5d6QSt72lE=;
 b=i6gpBH6QGkGYGz2AOfqtZ6zmzqkgaZKBR64j/VaFfNxpIT4inmRUXUdKYQqz6PpOdH8k1bu1mIXRCwGYpiGpY8NjwbSTJIlShGml+4MrXBCA0ZUSj+4fHDf6kEJSVtxDhs5zQV5NefBDWF9vNZaDPTfRV/O4nqWuDL7wwQ8zmzE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b2ab60c376afaec
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQsyLXDmRxSAu6qj+RtS9HkCtHf7Fm3Sy8M6VE3UZjFxrcMgWmm1eBbVw/mtaAp1SCyIDammJ2cVrkv+zVnltAULaK9WsqsDwaN3TCd40sMC/dLuwMBz0VKE70Un+GhSqAjDUOHe94s2NDZNe5DYisGzB47r3crY0tj8mnLxs3ukcxpAEteGaNMrlh42TIuvkOVZDL4lpXlIQ00vmQL1RrOXAJDQ8e5g17YFtXXb4nftq07efvxFF4LdAiX9Mu/FCmbpmVCibBFLoAfpPkHrdtPpGjb/+1GNncjNCsRc4xdsOw6WNNrgXeySheyuBLlRa8On6hUdg9E1k4x8zEu8Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axdkgzcnmGvRCT1eSkQ6qtDz8CiwhIsjf5d6QSt72lE=;
 b=EbkKe1yTPPJ352jcHc2Aq4YH2QPTM/A6YVAhOdPJ2HqKen6HsBv3cL49sR5s1MXoxDKQcUXksg1YY8VS0ObjPYq7FBsXsBQMts+7vcFhEH0gWK8yQWDLo303+wEyIQrO92EXmXOxiN46tDkSVcxfkSPDfToVMDL5z0up/bkoYjMhdpg+uxvlwepX7Y5RiCsXheXXM3pT/TnwBWTK7r3nQn1+kqLIZJA6sShFo5NOO0ulre0hRDOGyqTPdlTuq24hN/DL1Oy9Fi3zCJqHPItC8OW7+6WuVlkfHtFkNLiR9yiLOYl3FiFTj/aHO6sdFE0K5Y+PUPaoWF7wCRHpkXWRmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axdkgzcnmGvRCT1eSkQ6qtDz8CiwhIsjf5d6QSt72lE=;
 b=i6gpBH6QGkGYGz2AOfqtZ6zmzqkgaZKBR64j/VaFfNxpIT4inmRUXUdKYQqz6PpOdH8k1bu1mIXRCwGYpiGpY8NjwbSTJIlShGml+4MrXBCA0ZUSj+4fHDf6kEJSVtxDhs5zQV5NefBDWF9vNZaDPTfRV/O4nqWuDL7wwQ8zmzE=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, "committers@xenproject.org"
	<committers@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "jgross@suse.com"
	<jgross@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
Thread-Topic: Xen 4.18 release: Reminder about code freeze
Thread-Index: AQHZ705Dwyrpd4I60kahQfZlaJ2JtLArFXGAgAACIQCAADDfgIAAGL2A
Date: Mon, 25 Sep 2023 11:03:31 +0000
Message-ID: <695DDA3B-9439-48A1-B0F2-BB459EBF90A8@arm.com>
References:
 <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <6399a816-ac1a-b741-ed52-b5d03b498ee6@suse.com>
 <2AB20BED-9ED9-4713-A39A-59891E09E02C@arm.com>
 <1a056bd6-a918-4c76-82b0-0eded46b23a8@xen.org>
In-Reply-To: <1a056bd6-a918-4c76-82b0-0eded46b23a8@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB6539:EE_|AM7EUR03FT036:EE_|AS8PR08MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9d9a6d-a3ef-42f9-0d19-08dbbdb7165f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XnYeGxjXIJ67/CNrw63JCKTm5OEO+j+Shf0W17HudfZ2aVAt+iN1tMNZYSW4JvPPnRZYyinq3TbCxa0myWRwJeALVhstR2aTeUlVg9C26xKvSbkFezQtUVBGoOBx4Kx3ZtUQdlGWVXkvJWlUfkDHLIDhISUZx58inuCbd8UuHBU4UsKoip4ISL3vZDC9qSfkDeSp3tF/waEYggMlXCJeToJFP7wOR7nWJfdMysyCuolpLturQSnwBl3QUGTMNG7qxeHlscen+RBHHqpvzNHzvpZFnwJOxvoKEoPS0MntM2QdWDe3tyEgK2S2r3q58slq2RQdPBocz8EYtOG7cD1Gp7CC5N2nL6/VGWv25oS0bM6Gm1wQk7Ds5GeW2QHKqngC+LAe+m8IIALqqwO3ejnq+AkM5TPv4cYUgYgGXqVVlMub7EePVX1oGoAf3ZY3A+KWgZXpTtpb1FePcyZsrNcLJW0vW+nVBNO6g+QAJ9PbyVlkYX0PoNQWplkZFxwxXDZsxvyqq34wEAV7xuWpbCWAzZB8dBatTamm5ZEc3jgawG81bMFYW0H/PWV+T4zneEYIVRwkVY+RxfsNFm8CMtRPkktM4hG4iDWtCiayYTghMvUXayNZjKaVcNRUA/QqbcDNdfdX1OZDFAJQTIgEjewn+A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39850400004)(136003)(396003)(230922051799003)(451199024)(1800799009)(186009)(316002)(7416002)(41300700001)(26005)(2906002)(5660300002)(8676002)(478600001)(110136005)(66556008)(91956017)(66446008)(54906003)(64756008)(66476007)(66946007)(76116006)(4326008)(8936002)(6486002)(6506007)(71200400001)(66899024)(53546011)(6512007)(36756003)(2616005)(83380400001)(122000001)(38070700005)(38100700002)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC6A97ECC8C4A345ADA778EA45A68547@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6539
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44c8e557-539e-46b9-52c2-08dbbdb70e4d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WEO0jubuFgxx+t44ISQQAx4zYMQaC3mYxLD8iqV+xnFLS/UE00dzgVJUeq3E0I5vkC0mCII/VzCF+JYw7iqFnlUZu7MuVBRelm9qHYdqC1quxA+0LAmbiIlTb3xx7IMJbyI/fzrCIWPH8UtmAWS+mqO7XqDxTkmf8GjItKUpOVs2SMJIdDYeoAwxph2GIkG+IZeKcOUf47oXSUWCSfAf/0ZmrdWU2K9YBx4+xEPphZCw2hatvGzbz+FTbtPOTGO4EsHq3oN+6keh9v/BLuzJSJcWLc5hiJKtNTiMI6YqeqGDaot92yzy8AfU+qp73j50uvnI0nQgSKq9JrGfbPJbvAUhuELLMeK+nf+cPQp1vYZKiUy9veSYK/2CPm+lsBt2TqYzbPjX70+ccbnvtIk1meWN5qULJ7scOV0T/o22Qxo9tfzgRjn8KmdwmIP5fZk6n7LHiSdOVl8Ku6bF8Dkn9Qw1t43qsP22gOcoM5mFD+zVixkaeaw/PYseFoEkjID1hEXVJsmV3JyOJhEzY3RIH/s6nwlRKacsXV/PYYxgb2C93GPRy06pjKWa1eVwkJ0YwY8En2eMKJPiwBF1c2yQsWQegPN8SqVjlC7QmUWp2uWT5QLRC1zngDsuMh66CL2L6I3z8Sw4nbpHt79RUkvakRTc9wHPTXH3wtnQp7iYzhkQhO1a5pg7BALx1yxlCkCz5JCGQ47w+3j3hTjcxWi1FNEtdVm41EIwnmQI240XR+SMGJ+u65aN8YIs0Sr1E+Rm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(82310400011)(1800799009)(186009)(451199024)(36840700001)(40470700004)(46966006)(36756003)(33656002)(86362001)(40480700001)(53546011)(5660300002)(6512007)(2616005)(2906002)(478600001)(41300700001)(316002)(70206006)(70586007)(54906003)(110136005)(81166007)(6506007)(6486002)(83380400001)(40460700003)(66899024)(47076005)(36860700001)(356005)(4326008)(8676002)(8936002)(82740400003)(336012)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 11:03:45.4425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9d9a6d-a3ef-42f9-0d19-08dbbdb7165f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8393

SGkgSnVsaWVuLA0KDQo+IE9uIFNlcCAyNSwgMjAyMywgYXQgMTc6MzQsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAyNS8wOS8y
MDIzIDA3OjQwLCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gDQo+Pj4gVGhpcywgZm9yIGV4YW1wbGUs
IHdvdWxkIHRoZW4gbGlrZWx5IG1lYW4NCj4+PiB0aGF0IGFsbCBNaXNyYSB3b3JrIG5vdyBuZWVk
cyBxdWV1aW5nIGZvciBhZnRlciB0aGUgdHJlZSByZS1vcGVucyAuLi4NCj4+IOKApkkgYWxzbyB0
aG91Z2h0IGFib3V0IHRoaXMsIHRvIGJlIGhvbmVzdCBJIGFtIHRlbXB0ZWQgdG8gbG9vc2UgdGhl
IGNvbnRyb2wNCj4+IG9yIGF0IGxlYXN0IG9mZmVyIHNvbWUgZmxleGliaWxpdHkgb24gdGhpcyBz
cGVjaWZpYyBwYXJ0LCBhcyBub3JtYWxseSBNSVNSQQ0KPj4gcmVsYXRlZCBjaGFuZ2VzIGFyZSBo
YXJtbGVzcyBhbmQgYWN0dWFsbHkgaGFyZGVuIHRoZSBjb2RlLiBJIGFtIHdvbmRlcmluZw0KPj4g
aWYgdGhlcmUgYXJlIGFueSBvYmplY3Rpb25zIGZyb20gb3RoZXJz4oCmDQo+PiBDb21taXR0ZXJz
LCB3b3VsZCB5b3UgbWluZCBzaGFyaW5nIHlvdXIgb3BpbmlvbiBvbiB0aGlzIG9uZT8gVGhhbmtz
IQ0KPiANCj4gSSBhbSBzcGxpdC4gT24gb25lIGhhbmQsIEkgYWdyZWUgdGhleSBsb3cgcmlzayBh
bmQgd291bGQgYmUgZ29vZCB0byBoYXZlIHRoZW0uIEJ1dCBvbiB0aGUgb3RoZXIgaGFuZCwgdGhl
eSB0ZW5kIHRvIGJlIGludmFzaXZlIGFuZCBtYXkgaW50ZXJmZXJlIHdpdGggYW55IGJ1ZyB3ZSBu
ZWVkIHRvIGZpeCBkdXJpbmcgdGhlIGhhcmRlbmluZyBwZXJpb2QuDQoNClllcywgZ29vZCBwb2lu
dC4NCg0KPiANCj4gU28gSSB3b3VsZCBsZWFuIHRvd2FyZHMgYXQgbGVhc3QgcmVzdHJpY3Rpbmcg
dGhlIG51bWJlciBvZiBNSVNSQSBwYXRjaGVzIHdlIGFyZSBtZXJnaW5nLiBXZSBhbHNvIG5lZWQg
dG8gY29uc2lkZXIgYSB0aW1lIGxpbWl0IHNvIHdlIGRvbid0IGVuZCB1cCB0byBwdXNoIHRoZSBy
ZWxlYXNlIGp1c3QgYmVjYXVzZSBhIE1JU1JBIHBhdGNoZXMgYnJva2UgdGhlIGJ1aWxkLg0KDQpI
b25lc3RseSBJIGFtIGxlc3Mgd29ycmllZCBhYm91dCBicmVha2luZyB0aGUgYnVpbGQgYXMgSSBz
YXcgbm93YWRheXMgY29tbWl0dGVycw0Kbm9ybWFsbHkgcnVuIHRoZSBHaXRsYWIgQ0kgYmVmb3Jl
IHB1c2hpbmcsIGJ1dCBJIDEwMCUgYWdyZWUgd2l0aCB5b3UgYWJvdXQgdGhlIHBvaW50DQp0aGF0
IGluIGN1cnJlbnQgc3RhZ2Ugd2UgbmVlZCB0byBiZSBjYXV0aW91cy4NCg0KPiBJIHdvdWxkIHN1
Z2dlc3QgYW55IE1JU1JBIHBhdGNoZXMgc2hvdWxkIGJlIGNvbW1pdHRlZCBieSB0aGUgZmlyc3Qg
UkMuDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHJhaXNpbmcgdGhpcyBnb29kIHN1Z2dlc3Rp
b24hIFJDMShvciBtYXliZSBldmVuIFJDMikNCnNvdW5kcyBzYWZlLiBJIGNoZWNrZWQgdGhlIGZs
b2F0aW5nIE1JU1JBIHBhdGNoZXMgaW4gdGhlIGxpc3QsIGl0IHNlZW1zIHRoYXQgdGhlcmUgYXJl
DQpub3Qgc28gbWFueSBvZiB0aGVtLCBzbyBJIGd1ZXNzIHRoaXMgc3VnZ2VzdGlvbiBpcyBhY2hp
ZXZhYmxlLg0KDQpBIHNpZGUgbm90ZSBvZiB0aGlzIGlzLCBpZiB3ZSBtYWRlIHRoZSBmaW5hbCBk
ZWNpc2lvbiB0byBjdXQgdGhlIE1JU1JBIHBhdGNoZXMgYnkNClJDMSwgd2UgbmVlZCB0byBmaW5p
c2ggY29tbWl0dGluZyB0aGVzZSBzZXJpZXMgYnkgdGhlIGVuZCBvZiB0aGlzIFdlZG5lc2RheSAo
U2VwIDI3KQ0KRVUgdGltZSwgdG8gZ2l2ZSBPU1NUZXN0IGF0IGxlYXN0IG9uZSBkYXkgdG8gc3lu
YyB0aGUgc3RhZ2luZyB3aXRoIG1hc3Rlciwgc28gdGhhdA0Kd2UgY2FuIHRhZyB0aGUgcmMxLg0K
DQpLaW5kIHJlZ2FyZHMsDQpIZW5yeSANCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1
bGllbiBHcmFsbA0KDQo=

