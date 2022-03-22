Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DFA4E3BF3
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 10:53:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293350.498331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWbBd-0008Uz-GL; Tue, 22 Mar 2022 09:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293350.498331; Tue, 22 Mar 2022 09:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWbBd-0008Rx-D0; Tue, 22 Mar 2022 09:52:21 +0000
Received: by outflank-mailman (input) for mailman id 293350;
 Tue, 22 Mar 2022 09:52:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FDwX=UB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nWbBc-0008Rr-Dl
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 09:52:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c23a0125-a9c5-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 10:52:17 +0100 (CET)
Received: from DB7PR05CA0051.eurprd05.prod.outlook.com (2603:10a6:10:2e::28)
 by DB9PR08MB6425.eurprd08.prod.outlook.com (2603:10a6:10:261::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 22 Mar
 2022 09:52:15 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::88) by DB7PR05CA0051.outlook.office365.com
 (2603:10a6:10:2e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23 via Frontend
 Transport; Tue, 22 Mar 2022 09:52:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 09:52:15 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Tue, 22 Mar 2022 09:52:15 +0000
Received: from 9f3a72d45ea7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FC1BC426-EAE8-45D4-B800-B919A303416F.1; 
 Tue, 22 Mar 2022 09:52:04 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f3a72d45ea7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Mar 2022 09:52:04 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DBBPR08MB4347.eurprd08.prod.outlook.com (2603:10a6:10:c8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Tue, 22 Mar
 2022 09:52:01 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 09:52:01 +0000
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
X-Inumbo-ID: c23a0125-a9c5-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyWIPJUwwu0XabSFph4lDMkqweAQuNqdV4dcG/Oq0Nk=;
 b=m6DV7+FuSeiWos7F26a4QUrTuo18EReVhj7smLFMT/ZwOWjLFHHWyc6oY3AKkFizmK0Fi4P3+QB5b0xSBu8X/WegmiWhfELTw0ASt4bLOreppSKCyR7F0W9YevDlTlySa6OhNGeofpRRuEOIXbhmIDQb7hvyziy4kCsCzfm6Syg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 34cde4fd0bd10b86
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOqFaRfFC2CcZOXArxiuMG3V2T3StYa5nLNKpeyBw9UH2439H8MqqRyfpuHJFlVdHmQ+NLdIgIZunFxwSKp6LKoS6HtRieSDI1U3TEreh4oEDh5NbfahLn2xZgx5EY71bb8RQIfrrwi17KEUun91iQkj+rNci8Pg5A3VJiqG5QT3W4M7AIFm9/FnAWVArh6Y9FWiDlP1XMHF3V7KnpMa6IuHxtajkLc2HoL06llVTk4PFp7ng2fdOwnuPzPjON9Hy466YAH0tUiDoU2qQwRU5N+qS/RVsY/Dzqra6X2wbKHQK8ZcrfFyea+z6btDV/hJoJ+Fl/eKVmIMxLv65u2nQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyWIPJUwwu0XabSFph4lDMkqweAQuNqdV4dcG/Oq0Nk=;
 b=EyMWbdKbxbVzHK27qsynf14AMioTwVrEzsH7Mna1aJdSf7AlBx4P1kl0ec4NbXITGiXBeC4onkiyNGYGfJkKIQGvTeCBESFrSXmng9A2FgpiD4VmvkX1Wa1LWxHKUxgykC2jEP67iLCYE7mseD8RJKNDjP4fJJqLH0ifpGcvtrUe9WuXQjRP60b0puMJnWWV5b5yi3dOYx7HqfjgJ0ZVsO/jA4mBCVSbE+HGB/twY6ZRQhgSZxD/2gqy/oQ9kOejPB1GoPG4IDOgJeQqi1+hg03iEP3TCyIda0i1u9qIUP1I22YDrlvbUQ7wOYX9QScoUZYYDbSfJDHncuuGqJRtog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyWIPJUwwu0XabSFph4lDMkqweAQuNqdV4dcG/Oq0Nk=;
 b=m6DV7+FuSeiWos7F26a4QUrTuo18EReVhj7smLFMT/ZwOWjLFHHWyc6oY3AKkFizmK0Fi4P3+QB5b0xSBu8X/WegmiWhfELTw0ASt4bLOreppSKCyR7F0W9YevDlTlySa6OhNGeofpRRuEOIXbhmIDQb7hvyziy4kCsCzfm6Syg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index: AQHYOtySiWfuTiIQkkqv44WbBvDftKzFUCoAgASzLoCAAAqAAIABIWCA
Date: Tue, 22 Mar 2022 09:52:01 +0000
Message-ID: <AE272A2A-EA5B-4217-AECE-80AE04207B55@arm.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
 <274f81b0-c164-4437-3d05-243e147330a9@xen.org>
 <0FA7F6D7-0B40-4B75-9752-7FE48D0FCA5C@arm.com>
 <9f3d7713-4e4b-58f8-d7a1-b42ef152a7ab@xen.org>
In-Reply-To: <9f3d7713-4e4b-58f8-d7a1-b42ef152a7ab@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 06a0e1e4-43fd-4a73-c7bb-08da0be9a51e
x-ms-traffictypediagnostic:
	DBBPR08MB4347:EE_|DB5EUR03FT041:EE_|DB9PR08MB6425:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB642544891994A7DDC5FCE72DE4179@DB9PR08MB6425.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3r66RJ8+iCVQjDjAskLDAVCCBjTiqLInVY1GGL4yEXN024e4AaukMWXjvMNSim6E/t+uzqxcLWIXxuoUE8Vy858Bq++ZbJZYc0z5281RlUX5heHdbvaF7vgp9rl8Nhoivk146w+AUzSEmXQzv+8RMhqPMhYHTfa6gwc7LYHoIpW1xRkd6eN73+oa4F/5EMip4Z4aHK5gKN6tNtdFFTWZ+gtS9LFHK6zOFg2QuEbJyU/OkdH3qbO2bk0e9KfLZr4zQIlZ1IycWn37ls9IPO272GH03vqIFv6Y/1A6KjF8Li8eDebfmFWRHEyuJL+ezhxIU8pFtxeI2w4D46H40lmbIDCk46MdoYDdbWwpbAU9jfj9rl5NwNmoVV8Ej0LO8Gj6iER6xrr+47M4HDmfWEyPOqYOZjrd6ts2Xeld3ntA9WiN6l9aU+frEVzZVukZBrTgVX7v7chUF2sDGko//l+ZczUfsgcpiqIW2oC0RWlGWVYmI1ueCU6np+JejcP3szBR6sievO7mL9Kq9mLy7IjV7cFtFEYb8tehrzYanj9haCSS6uchTFgE5OoPKkggrM9Iqjx0gkfjJNrQAeGPs0LJywcgW0u9a5IwoLbhxB5BtP+5zMiyHLKQ1ERyN+CXuhpmGOufg+ISA/i9pN0VWZ6c/AyeqLBK+T9gLhvgNHzmi2YVdPi14Ks8iB+IhGkPetpHdGxJE+7kgb50G5401W606m8RTWeiOLraV1NXoMiBTSnWFJSAsmft/WB4bxE5ojZbCsdBOC+TCGx9j73HJBbEwpHv6iiVHkKGP3rwW8eeGOyb4T/X6+8nT7lNt6S96OfSicOKA+n+EPRPd1SThOldRA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(86362001)(83380400001)(8676002)(66476007)(26005)(186003)(4326008)(91956017)(54906003)(66556008)(36756003)(966005)(6486002)(76116006)(316002)(66446008)(6916009)(71200400001)(66946007)(64756008)(5660300002)(8936002)(38100700002)(508600001)(122000001)(6512007)(7416002)(6506007)(33656002)(2906002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CA90853724D1E4CBB0DDF4158E25B9C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4347
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	165c8859-ed90-41a9-9f6f-08da0be99d11
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QTfp70gTwq0Fc5woVAFktkgtB/cn6mdq6WUDMllxuBMOzlj2FaNC+zU+A72LZpMjIn2Zn5yrxU9XggcoJjc+aHHS+f3B+9uuuanbicMQVQHHiStW4N4/FNNVvt0gktCEU9yqXpLIF4JO/ZmS6lFb92E3+Uw3oNBGTEfbqks4zepeJ/rq3BLFVs48Buo+piYnxAxkJuasecZU1KCuYO0dP4MHqMlW6KDAJZGIbjfGG36mfO8sO64/GbYLYshkMM81ti7xAwuYffoMUtIf32SR83x1tZneEhsZUfIPOzksyOmq3n0R1S8RUKkHsOJCHqgXhd2rSMR6EPb2q6HTezXpeTFGW/znvbz5H6ofWmdZ2e27bFwz3anbQPN0qrtTfBxUZvBebJHnioXavuYnaXcvsQMf+7/uY+bKmkRgnZ7cpvwepHmr2yv7eWha33Zyir5gjrMLkLR5XQgwOh6QfUPoNzfkDuvB1Smdruepxsb2aYnDqkCCOCfRo6TtZDqwO2P87lJd59nHo2nG7RDAzO2DnZPTXhnj9xbgVcVv3DnkVtURedcwjALZDJFsujGMfO2lMAChCfKU4DvCjV0eFVrEk3wZ7QJk8Nrxo56Cb26bSnOvWSSPQkKQrYrPBDgms1x4dBLWQMpbsRxkXIX1pBCbH1z4k+5kJSqAEt/JRuzIX07fsdQYftn+tnMJt3fZeAoKLPQQ/1OgCiOa20Qu4nkSaZiMDnJiOe1b7x1+ANMae+rpBqKDsiYwIzxxVE1Qv96IJIOGo8MSi75IWdFHSZFkWg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36860700001)(47076005)(36756003)(336012)(107886003)(83380400001)(26005)(33656002)(2906002)(81166007)(356005)(186003)(2616005)(40460700003)(86362001)(54906003)(6506007)(6512007)(8936002)(5660300002)(316002)(6486002)(966005)(70586007)(70206006)(6862004)(82310400004)(4326008)(508600001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 09:52:15.1819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a0e1e4-43fd-4a73-c7bb-08da0be9a51e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6425

Pj4+IA0KPj4+IENhbiB5b3UgZG9jdW1lbnQgd2h5IHRoaXMgaXMgbmVjZXNzYXJ5IG9uIHg4NiBi
dXQgbm90IG9uIG90aGVyIGFyY2hpdGVjdHVyZXM/DQo+PiBIaSBKdWxpZW4sDQo+PiBJIHJlY2Vp
dmVkIHRoZSB3YXJuaW5nIGJ5IEp1ZXJnZW4gaGVyZTogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9jb21tZW50LzI0NzQwNzYyLyB0aGF0IGF0IGxlYXN0IG9uIHg4NiB0aGVyZSBjb3VsZCBi
ZQ0KPj4gc29tZSBwcm9ibGVtcyBpZiBjcHUwIGlzIG5vdCBpbiBjcHVwb29sMCwgSSB0ZXN0ZWQg
aXQgb24gYXJtIGFuZCBpdCB3YXMgd29ya2luZyBmaW5lIGFuZCBJIGRpZG7igJl0IGZpbmQgYW55
IHJlc3RyaWN0aW9uLg0KPiANCj4gV2hhdCBleGFjdGx5IGRpZCB5b3UgdGVzdCBvbiBBcm0/DQo+
IA0KDQpJIGhhdmUgdGVzdGVkIHN0YXJ0L3N0b3Agb2Ygc29tZSBndWVzdCwgbW92aW5nIGNwdXMg
YmV0d2VlbiBjcHVwb29scywgY3JlYXRlL2Rlc3Ryb3kgY3B1cG9vbHMsIHNodXRkb3duIG9mIERv
bTANCg0KDQpbIGZyb20geW91ciBsYXN0IG1haWwgXQ0KPj4+IA0KPj4+IElmIGRvbTAgbXVzdCBy
dW4gb24gY29yZTAgYW5kIGNvcmUwIGlzIExpdHRsZSB0aGVuIHlvdSBjYW5ub3QgYnVpbGQgYSBz
eXN0ZW0gd2hlcmUgZG9tMCBpcyBydW5uaW5nIG9uIGJpZyBjb3Jlcy4NCj4+PiBJZiB0aGUgbGlt
aXRhdGlvbiBpcyBub3QgdGhlcmUsIHlvdSBjYW4gYnVpbGQgc3VjaCBhIGNvbmZpZ3VyYXRpb24g
d2l0aG91dCBhbnkgZGVwZW5kZW5jeSB0byB0aGUgYm9vdCBjb3JlIHR5cGUuDQo+PiBUaGlzIG1p
Z2h0IG5vdCBiZSBjb21wbGV0ZWx5IGNsZWFyIHNvIGxldCBtZSByZXBocmFzZToNCj4+IEluIHRo
ZSBjdXJyZW50IHN5c3RlbToNCj4+IC0gZG9tMCBtdXN0IHJ1biBvbiBjcHVwb29sLTANCj4gDQo+
IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0aGlzIHJlc3RyaWN0aW9uLiBJbiBmYWN0LCB3aXRoIHRo
aXMgc2VyaWVzIGl0IHdpbGwgYmVjb21lIG1vcmUgYSBwcm9ibGVtIGJlY2F1c2UgdGhlIGNwdXBv
b2wgSUQgd2lsbCBiYXNlZCBvbiBob3cgd2UgcGFyc2UgdGhlIERldmljZS1UcmVlLg0KPiANCj4g
U28gZm9yIGRvbTAsIHdlIG5lZWQgdG8gc3BlY2lmeSBleHBsaWNpdGVseSB0aGUgY3B1cG9vbCB0
byBiZSB1c2VkLg0KPiANCj4+IC0gY3B1cG9vbC0wIG11c3QgY29udGFpbiB0aGUgYm9vdCBjb3Jl
DQo+PiAtIGNvbnNlcXVlbmNlOiBkb20wIG11c3QgcnVuIG9uIHRoZSBib290IGNvcmUNCj4+IElm
IGJvb3QgY29yZSBpcyBsaXR0bGUsIHlvdSBjYW5ub3QgYnVpbGQgYXMgc3lzdGVtIHdoZXJlIGRv
bTAgcnVucyBvbmx5IG9uIHRoZSBiaWcgY29yZXMuDQo+PiBSZW1vdmluZyB0aGUgc2Vjb25kIGxp
bWl0YXRpb24gKHdoaWNoIGlzIG5vdCByZXF1aXJlZCBvbiBhcm0pIGlzIG1ha2luZyBpdCBwb3Nz
aWJsZS4NCj4gDQo+IElNSE8gcmVtb3ZpbmcgdGhlIHNlY29uZCByZXN0cmljdGlvbiBpcyBhIGxv
dCBtb3JlIHJpc2t5IHRoYW4gcmVtb3ZpbmcgdGhlIGZpcnN0IG9uZS4NCg0KSSBzZWUgeW91ciBw
b2ludCwgbXkgY29uY2VybiBhYm91dCBtb3ZpbmcgRG9tMCBvbiBhbm90aGVyIGNwdXBvb2wsIGRp
ZmZlcmVudCBmcm9tIGNwdXBvb2wwLCBpcyB0aGF0IHdlIGdpdmUgdGhlDQpvcHBvcnR1bml0eSB0
byBkZXN0cm95IHRoZSBjcHVwb29sMCAod2UgY2Fu4oCZdCBsZXQgdGhhdCBoYXBwZW4pLCBvciBy
ZW1vdmUgZXZlcnkgY3B1IGZyb20gY3B1cG9vbDAuDQoNCkNoZWVycywNCkx1Y2ENCg0KDQo=

