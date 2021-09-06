Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B8B401805
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 10:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179470.325749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNA0O-00032P-5t; Mon, 06 Sep 2021 08:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179470.325749; Mon, 06 Sep 2021 08:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNA0O-0002yw-1x; Mon, 06 Sep 2021 08:29:28 +0000
Received: by outflank-mailman (input) for mailman id 179470;
 Mon, 06 Sep 2021 08:29:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxtw=N4=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mNA0M-0002yq-P2
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 08:29:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::621])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29668a3e-8a1e-4067-a903-58ec13f63491;
 Mon, 06 Sep 2021 08:29:24 +0000 (UTC)
Received: from AS9PR06CA0138.eurprd06.prod.outlook.com (2603:10a6:20b:467::24)
 by PAXPR08MB7185.eurprd08.prod.outlook.com (2603:10a6:102:207::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 08:29:19 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::27) by AS9PR06CA0138.outlook.office365.com
 (2603:10a6:20b:467::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Mon, 6 Sep 2021 08:29:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 08:29:19 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Mon, 06 Sep 2021 08:29:19 +0000
Received: from 7268d7fd9e47.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 08D861F5-D650-4DC4-9101-51D0454602AF.1; 
 Mon, 06 Sep 2021 08:29:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7268d7fd9e47.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Sep 2021 08:29:13 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6576.eurprd08.prod.outlook.com (2603:10a6:102:15a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Mon, 6 Sep
 2021 08:29:05 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 08:29:05 +0000
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
X-Inumbo-ID: 29668a3e-8a1e-4067-a903-58ec13f63491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIvUYbF7S8gDAZN+6fmeLMclWA1FIIhVDIW9rAoYCzI=;
 b=zmMjejXwXcG1V0B8VjDTjLSMvSG5Do4ByGvVk1eifdsqxZjUfmhMA1aBdraH6vbtHdVEZhhXxhzlofRtcoTSqXYmvdFxiTVwtOaZGOefv5Z6qB5YjPNGwpTv3jIM27CcDz9s2uHyeZxGN00WS2cJH4PBKhwWqPKLR1Wb658p9BI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fd24a59af78e937c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mM9kUiyLvgj1Sg+xs0VuwoWaQE9IgxS1fsHVp5dlG5sXl5e03Ixn1iYuIyqlmXJxA7sK13P2NMoOUv0rDscMnepZcRoIwxl0ul46vxsLBLd/I3kl4ECtJ1L5kBIVu56O3PvGKLkdoQfyQVfmqF2cFwYzxC9xPVonN4JlFFVyMNj3DxNWr35YQZAxfLU1dLqyWxQSt6ej9mIieEY/xjYBEAboOVXJvMOIaJjkBfiW0ItJmL1mIv4pqbOyzMMI7ruU4CkkMnhnlv3lOm/rOsAH4XG7pY7A4PZ+yzV21aMJQzfu/AUqFd+fWvTKlID3gmwIwv8DlmHdJ/xKmzlPyUT/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mIvUYbF7S8gDAZN+6fmeLMclWA1FIIhVDIW9rAoYCzI=;
 b=cQEXMJqmWp2d8+DuQAI77ekdflX15VhPCVZmffopdetamqW1AzflX7+oIOLkunBVVAoiRjRdjlKfmIGSXiPgYneHja4NlvEZNtLZnZpOE3K98rMXPpT6lu9SBBWFUJJ7szt3o1CDFg1s20/v78mtGqPcMZvsVyy8+9YIi7B3gZXVx29ktrn22czo46E6rjY1qN5M33pWeETWn5bdwicgD4YTcNIjKxZLu7gdLI53y0ykmoDvhCyFbbI+nPp9VRLGG55wwBKo9JUtz0zARt5mVfwSROD2wvnH2qfdH555Tf8O0APVGCXoA8YF/GvWknxYwkuACwujEwDMG0yZMc213w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIvUYbF7S8gDAZN+6fmeLMclWA1FIIhVDIW9rAoYCzI=;
 b=zmMjejXwXcG1V0B8VjDTjLSMvSG5Do4ByGvVk1eifdsqxZjUfmhMA1aBdraH6vbtHdVEZhhXxhzlofRtcoTSqXYmvdFxiTVwtOaZGOefv5Z6qB5YjPNGwpTv3jIM27CcDz9s2uHyeZxGN00WS2cJH4PBKhwWqPKLR1Wb658p9BI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: Sanitize CTR_EL0 and emulate it if needed
Thread-Topic: [PATCH v3 7/7] xen/arm: Sanitize CTR_EL0 and emulate it if
 needed
Thread-Index:
 AQHXmbPyaqNt71/0B0WMx26sIln5R6uHdm2AgAYrXACAABkoAIAAGG+AgAUlJICAA8aUAA==
Date: Mon, 6 Sep 2021 08:29:04 +0000
Message-ID: <D0CCB87F-1CC1-450B-A612-E4B505B36B5B@arm.com>
References: <cover.1629897306.git.bertrand.marquis@arm.com>
 <a7482653a0c29d68854846f25553f4938a6279b9.1629897306.git.bertrand.marquis@arm.com>
 <14b1639e-c9e4-f8fb-e921-73d7f28681ac@xen.org>
 <98E8FB9D-3372-47D2-92F7-8AD401AC1092@arm.com>
 <6705127a-bde2-36cd-0fed-900eb1eace03@xen.org>
 <CA9E8DFA-E0D8-4C33-A277-E19EFFCAFDC4@arm.com>
 <alpine.DEB.2.21.2109031540470.26072@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109031540470.26072@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b188e162-6490-42e4-4141-08d971106bf2
x-ms-traffictypediagnostic: PAXPR08MB6576:|PAXPR08MB7185:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7185B1D78C8D3A2634D028C49DD29@PAXPR08MB7185.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vS3hw7RjagwvyY0IecFOD5DpcsJs9nAkkBLLaJm60l4V/pfhmGQkWmH7fL5JLixaFSuG+oZDaP5+aNO21zuNNQJcvfMtrbgIsDgS64ZFAQr0aHjDkrXd9dZEh3ndJcnHLRlzDE7N0fiUh00ejayqnuSALwweH6vtdWW/yEffdJQ+kKWGUz2ltsiB/IgF4ZPyaffUTezqEJXPxZWbf6T/QpRt/1RP83aHw8fZw0c53HYzo4qUIJs0YbtMHpmnajBAAlCzfvL5/OmchK4I1EVwPHSkhxJQwHnQxC6wwrTIHUwJHAwtl8XkPLsjYwiIn3tPFMdnQ5r4bBn3QpqQF6VDyTKAlHJvIMqJdWA+OtBcP/UkFnlemSDSKKFclA+P8dEKHUpV86ov9iCbzjxnedxaQsBYCZ3q54ZL+QL/34FUWAcxfxc6mx0UlD/D2E3OsJIs32EApeXg7PLZP3wWtfjJApnZnoWZu1cZ/e5vo1fyNdmNMkQHpT4K/XilC5mQbhXFHgJY8WjsnEbcKWLf+4fPrzINTFMpfMLl5y1+Wxb+sckkf04e0VXNcjgEdd55OlkKuuAqL3l1541OsyS0vX9t2EE4lV7mMVcKFnNky4U0kB5hSNXezj7NZkuEWAEXuCx+55AVsHmEWMOSnSfs650Y8efxuaxs3T7g1kXTZ0rTGJiQ5ZI4Fb54AvyzTILjZbqmJ6x+Si2lQ2SIDVTmG4/21d2GiSv9sXvTzWGAM3iEIenjnIEbQhco16xqXHsljbiW
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(2906002)(86362001)(4326008)(38100700002)(316002)(122000001)(54906003)(26005)(6916009)(2616005)(5660300002)(38070700005)(33656002)(6486002)(478600001)(186003)(53546011)(6506007)(91956017)(66556008)(66476007)(76116006)(66946007)(66446008)(64756008)(8676002)(36756003)(8936002)(83380400001)(6512007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <84D31BB05B88A9479F9D79FD63BC079D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6576
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c849654-0661-4f27-89d8-08d97110637a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EsKaSiSORlrVwgVHogxGgRANhDMusjrWlT+cKNmXvoAgJTOClfKmFCVYC7wy/B2+oTOWyxleHjYt1U9apUm81Pbz8GMcbjfDpWHZv/v51bX22r1T5yrvrbdImy/ksprQ+QwGXrSnyLi9BbWlTCqK9zE05wExNZgN53IxrRufZKESsgjV68Dt0jNYFDW692HP9VslUlLPgAhapEHcbnWPygDDH7y/bIXd4l5pGk1NpScWJ/X31Cu1pFcUUzWCQkveer4IHzUYRi1fmp6qCU5pzlQTOuBivtlkez7Oy9RhMdurvvu77T1spVIxirNCO6c4P0fKe2KXlwGrKsdxeWWckgwP4w6gpeWl18uuasDyuj2oJnAl2ZIFanBXbt4/P/DnGnozJSvjABloT8fC7oFg+3udtOaQJs/VHfTxVPIaxhOkAroRMgWxLkkA6h5ul7ITtlZH2KA+VONLh64eTN0MKIFGiVoRgusSgrJagRn2LLCR7XSD4TtLOARP6UiLntbQ/Sj7Q1ufeGremmyoJYx/6M8UsrVpXgQQO8lqqhirMc4JvDjzpUVEQDhdrJwncmW6hU6OfwuMIzbiPujeH8p2LTR9p3+0ItlXeecz0whtTUj/pMSZ3xlTpX/CY1DTQXzeuTAWyzBzRZ+KhBAvuBhxpbCPuabvABD4DyQEUq7EwsGhnxlkxfc4urJWuRI/6D8mJAyknLkpfcp7M6iy3fDDvA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6506007)(6862004)(53546011)(33656002)(54906003)(83380400001)(2616005)(36860700001)(336012)(8936002)(81166007)(356005)(186003)(26005)(8676002)(4326008)(316002)(107886003)(5660300002)(36756003)(86362001)(6512007)(47076005)(82310400003)(70586007)(70206006)(508600001)(6486002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 08:29:19.3320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b188e162-6490-42e4-4141-08d971106bf2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7185

SGkgU3RlZmFubywNCg0KPiBPbiAzIFNlcCAyMDIxLCBhdCAyMzo0OSwgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgMzEgQXVn
IDIwMjEsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+PiANCj4+PiBP
biAzMSBBdWcgMjAyMSwgYXQgMTU6NDcsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdy
b3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0KPj4+IE9uIDMxLzA4LzIwMjEgMTQ6MTcsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+Pj4+IEhpIEp1bGllbiwNCj4+PiANCj4+PiBIaSBCZXJ0cmFuZCwN
Cj4+PiANCj4+Pj4+IE9uIDI3IEF1ZyAyMDIxLCBhdCAxNjowNSwgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IEhpIEJlcnRyYW5kLA0KPj4+Pj4gDQo+
Pj4+PiBPbiAyNS8wOC8yMDIxIDE0OjE4LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4+
IFNhbml0aXplIENUUl9FTDAgdmFsdWUgYmV0d2VlbiBjb3Jlcy4NCj4+Pj4+PiBJbiBtb3N0IGNh
c2VzIGRpZmZlcmVudCB2YWx1ZXMgd2lsbCB0YWludCBYZW4gYnV0IGlmIGRpZmZlcmVudA0KPj4+
Pj4+IGktY2FjaGUgcG9saWNpZXMgYXJlIGZvdW5kLCB3ZSBjaG9vc2UgdGhlIG9uZSB3aGljaCB3
aWxsIGJlIGNvbXBhdGlibGUNCj4+Pj4+PiBiZXR3ZWVuIGFsbCBjb3JlcyBpbiB0ZXJtcyBvZiBp
bnZhbGlkYXRpb24vZGF0YSBjYWNoZSBmbHVzaGluZyBzdHJhdGVneS4NCj4+Pj4+IA0KPj4+Pj4g
SSB1bmRlcnN0YW5kIHRoYXQgYWxsIHRoZSBDUFVzIGluIFhlbiBuZWVkcyB0byBhZ3JlZSBvbiB0
aGUgY2FjaGUgZmx1c2ggc3RyYXRlZ3kuIEhvd2V2ZXIuLi4NCj4+Pj4+IA0KPj4+Pj4+IEluIHRo
aXMgY2FzZSB3ZSBuZWVkIHRvIGFjdGl2YXRlIHRoZSBUSUQyIGJpdCBpbiBIQ1IgdG8gZW11bGF0
ZSB0aGUNCj4+Pj4+PiBUQ1JfRUwwIHJlZ2lzdGVyIGZvciBndWVzdHMuIFRoaXMgcGF0Y2ggaXMg
bm90IGFjdGl2YXRpbmcgVElEMiBiaXQgYWxsDQo+Pj4+Pj4gdGhlIHRpbWUgdG8gbGltaXQgdGhl
IG92ZXJoZWFkIHdoZW4gcG9zc2libGUuDQo+Pj4+PiANCj4+Pj4+IGFzIHdlIGRpc2N1c3NlZCBp
biBhbiBlYXJsaWVyIHZlcnNpb24sIGEgdkNQVSBpcyB1bmxpa2VseSAoYXQgbGVhc3QgaW4gc2hv
cnQvbWVkaXVtKSB0byBiZSBhYmxlIG1vdmUgYWNyb3NzIHBDUFUgb2YgZGlmZmVyZW50IHR5cGUu
IFNvIHRoZSB2Q1BVIHdvdWxkIGJlIHBpbm5lZCB0byBhIHNldCBvZiBwQ1BVcy4gSU9XLCB0aGUg
Z3Vlc3Qgd291bGQgaGF2ZSB0byBiZSBiaWcuTElUVExFIGF3YXJlIGFuZCB0aGVyZWZvcmUgd291
bGQgYmUgYWJsZSB0byBkbyBpdHMgb3duIHN0cmF0ZWd5IGRlY2lzaW9uLg0KPj4+Pj4gDQo+Pj4+
PiBTbyBJIHRoaW5rIHdlIHNob3VsZCBiZSBhYmxlIHRvIGdldCBhd2F5IGZyb20gdHJhcHBpbmdz
IHRoZSByZWdpc3RlcnMuDQo+Pj4+IEkgZG8gYWdyZWUgdGhhdCB3ZSBzaG91bGQgYmUgYWJsZSB0
byBnZXQgYXdheSBmcm9tIHRoYXQgaW4gdGhlIGxvbmcgdGVybSBvbmNlDQo+Pj4+IHdlIGhhdmUg
Y3B1cG9vbHMgcHJvcGVybHkgc2V0IGJ1dCByaWdodCBub3cgdGhpcyBpcyB0aGUgb25seSB3YXkg
dG8gaGF2ZQ0KPj4+PiBzb21ldGhpbmcgdXNlYWJsZSAoSSB3aWxsIG5vdCBzYXkgcmlnaHQpLg0K
Pj4+PiBJIHdpbGwgd29yayBvbiBmaW5kaW5nIGEgd2F5IHRvIHNldHVwIHByb3Blcmx5IGNwdXBv
b2xzIChvciBzb21ldGhpbmcgZWxzZSBhcw0KPj4+PiB3ZSBkaXNjdXNzZWQgZWFybGllcikgYnV0
IGluIHRoZSBzaG9ydCB0ZXJtIEkgdGhpbmsgdGhpcyBpcyB0aGUgYmVzdCB3ZSBjYW4gZG8uDQo+
Pj4gDQo+Pj4gTXkgY29uY2VybiBpcyB5b3UgYXJlIG1ha2luZyBsb29rIGxpa2UgWGVuIHdpbGwg
YmUgYWJsZSB0byBkZWFsIG5pY2VseSB3aXRoIGJpZy5MSVRUTEUgd2hlbiBpbiBmYWN0IHRoZXJl
IGFyZSBhIGxvdCBtb3JlIHBvdGVudGlhbCBpc3N1ZSBieSBhbGxvdyBhIHZDUFUgbW92aW5nIGFj
Y3Jvc3MgcENQVSBvZiBkaWZmZXJlbnQgdHlwZSAodGhlIGVycmF0YSBpcyBvbmUgZXhhbXBsZSku
DQo+PiANCj4+IEkgYWdyZWUgYW5kIHRoaXMgaXMgd2h5IFhlbiBpcyB0YWludGVkLg0KPj4gDQo+
Pj4gDQo+Pj4+IEFuIG90aGVyIHNvbHV0aW9uIHdvdWxkIGJlIHRvIGRpc2NhcmQgdGhpcyBwYXRj
aCBmcm9tIHRoZSBzZXJpZSBmb3Igbm93IHVudGlsDQo+Pj4+IEkgaGF2ZSB3b3JrZWQgYSBwcm9w
ZXIgc29sdXRpb24gZm9yIHRoaXMgY2FzZS4NCj4+Pj4gU2hvdWxkIHdlIGRpc2NhcmQgb3IgbWVy
Z2Ugb3IgZG8geW91IGhhdmUgYW4gb3RoZXIgaWRlYSA/DQo+Pj4gUGxlYXNlIGNvcnJlY3QgbWUg
aWYgSSBhbSB3cm9uZywgYXQgdGhlIG1vbWVudCwgaXQgZG9lc24ndCBsb29rIGxpa2UgdGhpcyBw
YXRjaCB3aWxsIGJlIHBhcnQgb2YgdGhlIGxvbmdlciBwbGFuLiBJZiBzbywgdGhlbiBJIHRoaW5r
IGl0IHNob3VsZCBiZSBwYXJrZWQgZm9yIG5vdy4NCj4+IA0KPj4gTm90IHN1cmUgaXQgZGVwZW5k
cyBvbiB3aGF0IHRoZSBmaW5hbCBzb2x1dGlvbiB3b3VsZCBiZSBidXQgdGhpcyBpcyBoaWdobHkg
cG9zc2libGUgSSBhZ3JlZS4NCj4+IA0KPj4+IA0KPj4+IFRoaXMgd291bGQgYWxzbyBoYXZlIHRo
ZSBhZHZhbnRhZ2UgdG8gYXZvaWQgc3BlbmRpbmcgdG9vIG11Y2ggdGltZSBvbiByZXNvbHZpbmcg
dGhlIGVtdWxhdGlvbiBpc3N1ZSBJIG1lbnRpb25lZCBpbiBteSBwcmV2aW91cyBhbnN3ZXIuDQo+
Pj4gDQo+Pj4gTm8gbmVlZCB0byByZXNlbmQgYSBuZXcgdmVyc2lvbiBvZiB0aGlzIHNlcmllcyB5
ZXQuIFlvdSBjYW4gd2FpdCB1bnRpbCB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzIGdldCBtb3JlIGZl
ZWRiYWNrLg0KPj4gDQo+PiBPaywgSSB3aWxsIHdhaXQgZm9yIGZlZWRiYWNrIGFuZCBuZXh0IHNl
cmllIHdpbGwgbm90IGluY2x1ZGUgdGhpcyBwYXRjaCBhbnltb3JlLg0KPiANCj4gV291bGQgaXQg
YmUgd29ydGgga2VlcGluZyBqdXN0IHRoZSBwYXJ0IHRoYXQgc2FuaXRpemVzIGN0ciwgd2l0aG91
dCBhbnkNCj4gb2YgdGhlIGVtdWxhdGlvbiBzdHVmZj8gVGhhdCB3YXkgd2UgY291bGQgc3RpbGwg
ZGV0ZWN0IGNhc2VzIHdoZXJlIHRoZXJlDQo+IGlzIGEgbWlzbWF0Y2ggYmV0d2VlbiBDUFVzLCBw
cmludCBhIHVzZWZ1bCBtZXNzYWdlIGFuZCB0YWludCBYZW4uDQoNClRoYXTigJlzIGEgZ29vZCBp
ZGVhLCBpdCBtZWFucyByZW1vdmluZyB0aGUgZW11bGF0aW9uIHBhcnQgYW5kIGp1c3Qga2VlcCB0
aGUgc2FuaXRpemF0aW9uLg0KDQpASnVsaWVuOiB3b3VsZCB5b3UgYmUgb2sgd2l0aCB0aGF0ID8N
Cg0KU2hvdWxkIEkgc2VuZCBhIHY0IG9yIHNob3VsZCB3ZSB1c2UgU3RlZmFub+KAmXMgcGF0Y2gg
ZGlyZWN0bHkgaW5zdGVhZCA/DQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gRm9yIGNsYXJp
dHkgc29tZXRoaW5nIGxpa2UgdGhlIGFwcGVuZGVkLg0KPiANCj4gDQo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vYXJtNjQvY3B1ZmVhdHVyZS5jIGIveGVuL2FyY2gvYXJtL2FybTY0L2NwdWZl
YXR1cmUuYw0KPiBpbmRleCBiMTkzNmVmMWQ2Li5kMjQ1NmFmMmJmIDEwMDY0NA0KPiAtLS0gYS94
ZW4vYXJjaC9hcm0vYXJtNjQvY3B1ZmVhdHVyZS5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02
NC9jcHVmZWF0dXJlLmMNCj4gQEAgLTI3NSw5ICsyNzUsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGFybTY0X2Z0cl9iaXRzIGZ0cl9pZF9hYTY0bW1mcjJbXSA9IHsNCj4gCUFSTTY0X0ZUUl9FTkQs
DQo+IH07DQo+IA0KPiAtI2lmIDANCj4gLS8qIFRPRE86IHVzZSB0aGlzIHRvIHNhbml0aXplIHRo
ZSBjYWNoZSBsaW5lIHNpemUgYW1vbmcgY29yZXMgKi8NCj4gLQ0KPiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGFybTY0X2Z0cl9iaXRzIGZ0cl9jdHJbXSA9IHsNCj4gCUFSTTY0X0ZUUl9CSVRTKEZUUl9W
SVNJQkxFLCBGVFJfU1RSSUNULCBGVFJfRVhBQ1QsIDMxLCAxLCAxKSwgLyogUkVTMSAqLw0KPiAJ
QVJNNjRfRlRSX0JJVFMoRlRSX1ZJU0lCTEUsIEZUUl9TVFJJQ1QsIEZUUl9MT1dFUl9TQUZFLCBD
VFJfRElDX1NISUZULCAxLCAxKSwNCj4gQEAgLTI5NCw3ICsyOTEsNiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGFybTY0X2Z0cl9iaXRzIGZ0cl9jdHJbXSA9IHsNCj4gCUFSTTY0X0ZUUl9CSVRTKEZU
Ul9WSVNJQkxFLCBGVFJfU1RSSUNULCBGVFJfTE9XRVJfU0FGRSwgQ1RSX0lNSU5MSU5FX1NISUZU
LCA0LCAwKSwNCj4gCUFSTTY0X0ZUUl9FTkQsDQo+IH07DQo+IC0jZW5kaWYNCj4gDQo+IHN0YXRp
YyBjb25zdCBzdHJ1Y3QgYXJtNjRfZnRyX2JpdHMgZnRyX2lkX21tZnIwW10gPSB7DQo+IAlTX0FS
TTY0X0ZUUl9CSVRTKEZUUl9ISURERU4sIEZUUl9TVFJJQ1QsIEZUUl9MT1dFUl9TQUZFLCBJRF9N
TUZSMF9JTk5FUlNIUl9TSElGVCwgNCwgMHhmKSwNCj4gQEAgLTYwMCw2ICs1OTYsOCBAQCB2b2lk
IHVwZGF0ZV9zeXN0ZW1fZmVhdHVyZXMoY29uc3Qgc3RydWN0IGNwdWluZm9fYXJtICpuZXcpDQo+
IAkgKi8NCj4gCVNBTklUSVpFX1JFRyhkY3ppZCwgMCwgZGN6aWQpOw0KPiANCj4gKwlTQU5JVEla
RV9SRUcoY3RyLCAwLCBjdHIpOw0KPiArDQo+IAlpZiAoIGNwdV9mZWF0dXJlNjRfaGFzX2VsMF8z
Migmc3lzdGVtX2NwdWluZm8pICkNCj4gCXsNCj4gCQlTQU5JVElaRV9JRF9SRUcocGZyMzIsIDAs
IHBmcjApOw0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2NwdWZlYXR1cmUuYyBiL3hlbi9h
cmNoL2FybS9jcHVmZWF0dXJlLmMNCj4gaW5kZXggMTEzZjIwZjYwMS4uNmU1MWY1MzBhOCAxMDA2
NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2NwdWZlYXR1cmUuYw0KPiArKysgYi94ZW4vYXJjaC9h
cm0vY3B1ZmVhdHVyZS5jDQo+IEBAIC0xMjcsNiArMTI3LDggQEAgdm9pZCBpZGVudGlmeV9jcHUo
c3RydWN0IGNwdWluZm9fYXJtICpjKQ0KPiANCj4gICAgIGMtPmRjemlkLmJpdHNbMF0gPSBSRUFE
X1NZU1JFRyhEQ1pJRF9FTDApOw0KPiANCj4gKyAgICBjLT5jdHIuYml0c1swXSA9IFJFQURfU1lT
UkVHKENUUl9FTDApOw0KPiArDQo+ICAgICBhYXJjaDMyX2VsMCA9IGNwdV9mZWF0dXJlNjRfaGFz
X2VsMF8zMihjKTsNCj4gI2VuZGlmDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Nl
dHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiBpbmRleCAzNzk4YzVhZGUwLi4zM2I3YmZi
NTljIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiArKysgYi94ZW4vYXJj
aC9hcm0vc2V0dXAuYw0KPiBAQCAtNjI3LDcgKzYyNyw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBz
ZXR1cF9tbSh2b2lkKQ0KPiAgICAgICAgIHBhbmljKCJObyBtZW1vcnkgYmFua1xuIik7DQo+IA0K
PiAgICAgLyogV2Ugb25seSBzdXBwb3J0cyBpbnN0cnVjdGlvbiBjYWNoZXMgaW1wbGVtZW50aW5n
IHRoZSBJVklQVCBleHRlbnNpb24uICovDQo+IC0gICAgaWYgKCAoKGN0ciA+PiBDVFJfTDFJcF9T
SElGVCkgJiBDVFJfTDFJcF9NQVNLKSA9PSBDVFJfTDFJcF9BSVZJVlQgKQ0KPiArICAgIGlmICgg
KChjdHIgPj4gQ1RSX0wxSVBfU0hJRlQpICYgQ1RSX0wxSVBfTUFTSykgPT0gSUNBQ0hFX1BPTElD
WV9BSVZJVlQgKQ0KPiAgICAgICAgIHBhbmljKCJBSVZJVlQgaW5zdHJ1Y3Rpb24gY2FjaGUgbm90
IHN1cHBvcnRlZFxuIik7DQo+IA0KPiAgICAgaW5pdF9wZHgoKTsNCj4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVm
ZWF0dXJlLmgNCj4gaW5kZXggNTIxOWZkM2JhYi4uY2E2ZTgyN2ZjYiAxMDA2NDQNCj4gLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLWFybS9jcHVmZWF0dXJlLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9jcHVmZWF0dXJlLmgNCj4gQEAgLTI2Nyw2ICsyNjcsMTQgQEAgc3RydWN0IGNwdWluZm9f
YXJtIHsNCj4gICAgICAgICByZWdpc3Rlcl90IGJpdHNbMV07DQo+ICAgICB9IGRjemlkOw0KPiAN
Cj4gKyAgICAvKg0KPiArICAgICAqIENUUiBpcyBvbmx5IHVzZWQgdG8gY2hlY2sgZm9yIGRpZmZl
cmVudCBjYWNoZSB0eXBlcyBvciBwb2xpY2llcyBhbmQNCj4gKyAgICAgKiB0YWludCBYZW4gaW4g
dGhpcyBjYXNlDQo+ICsgICAgICovDQo+ICsgICAgc3RydWN0IHsNCj4gKyAgICAgICAgcmVnaXN0
ZXJfdCBiaXRzWzFdOw0KPiArICAgIH0gY3RyOw0KPiArDQo+ICNlbmRpZg0KPiANCj4gICAgIC8q
DQo+IEBAIC0zMzksNiArMzQ3LDkgQEAgZXh0ZXJuIHN0cnVjdCBjcHVpbmZvX2FybSBzeXN0ZW1f
Y3B1aW5mbzsNCj4gZXh0ZXJuIHZvaWQgaWRlbnRpZnlfY3B1KHN0cnVjdCBjcHVpbmZvX2FybSAq
KTsNCj4gDQo+ICNpZmRlZiBDT05GSUdfQVJNXzY0DQo+ICsNCj4gK2V4dGVybiBib29sIG1pc21h
dGNoZWRfY2FjaGVfdHlwZTsNCj4gKw0KPiBleHRlcm4gdm9pZCB1cGRhdGVfc3lzdGVtX2ZlYXR1
cmVzKGNvbnN0IHN0cnVjdCBjcHVpbmZvX2FybSAqKTsNCj4gI2Vsc2UNCj4gc3RhdGljIGlubGlu
ZSB2b2lkIHVwZGF0ZV9zeXN0ZW1fZmVhdHVyZXMoY29uc3Qgc3RydWN0IGNwdWluZm9fYXJtICpj
cHVpbmZvKQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaCBi
L3hlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmgNCj4gaW5kZXggMjU3N2U5YTI0NC4uOGM5
ODQzZTEyYiAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaA0K
PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3Byb2Nlc3Nvci5oDQo+IEBAIC03LDkgKzcsMjEg
QEANCj4gI2luY2x1ZGUgPHB1YmxpYy9hcmNoLWFybS5oPg0KPiANCj4gLyogQ1RSIENhY2hlIFR5
cGUgUmVnaXN0ZXIgKi8NCj4gLSNkZWZpbmUgQ1RSX0wxSXBfTUFTSyAgICAgICAweDMNCj4gLSNk
ZWZpbmUgQ1RSX0wxSXBfU0hJRlQgICAgICAxNA0KPiAtI2RlZmluZSBDVFJfTDFJcF9BSVZJVlQg
ICAgIDB4MQ0KPiArI2RlZmluZSBDVFJfTDFJUF9NQVNLICAgICAgIDB4Mw0KPiArI2RlZmluZSBD
VFJfTDFJUF9TSElGVCAgICAgIDE0DQo+ICsjZGVmaW5lIENUUl9ETUlOTElORV9TSElGVCAgMTYN
Cj4gKyNkZWZpbmUgQ1RSX0lNSU5MSU5FX1NISUZUICAwDQo+ICsjZGVmaW5lIENUUl9JTUlOTElO
RV9NQVNLICAgMHhmDQo+ICsjZGVmaW5lIENUUl9FUkdfU0hJRlQgICAgICAgMjANCj4gKyNkZWZp
bmUgQ1RSX0NXR19TSElGVCAgICAgICAyNA0KPiArI2RlZmluZSBDVFJfQ1dHX01BU0sgICAgICAg
IDE1DQo+ICsjZGVmaW5lIENUUl9JRENfU0hJRlQgICAgICAgMjgNCj4gKyNkZWZpbmUgQ1RSX0RJ
Q19TSElGVCAgICAgICAyOQ0KPiArDQo+ICsjZGVmaW5lIElDQUNIRV9QT0xJQ1lfVlBJUFQgIDAN
Cj4gKyNkZWZpbmUgSUNBQ0hFX1BPTElDWV9BSVZJVlQgMQ0KPiArI2RlZmluZSBJQ0FDSEVfUE9M
SUNZX1ZJUFQgICAyDQo+ICsjZGVmaW5lIElDQUNIRV9QT0xJQ1lfUElQVCAgIDMNCj4gDQo+IC8q
IE1JRFIgTWFpbiBJRCBSZWdpc3RlciAqLw0KPiAjZGVmaW5lIE1JRFJfUkVWSVNJT05fTUFTSyAg
ICAgIDB4Zg0KDQo=

