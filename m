Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B342D89FCDB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 18:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703425.1099101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruaq7-0003vr-2A; Wed, 10 Apr 2024 16:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703425.1099101; Wed, 10 Apr 2024 16:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruaq6-0003sx-VK; Wed, 10 Apr 2024 16:30:22 +0000
Received: by outflank-mailman (input) for mailman id 703425;
 Wed, 10 Apr 2024 16:30:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oh3E=LP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ruaq6-0003sr-54
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 16:30:22 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2606::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e0e8f59-f757-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 18:30:18 +0200 (CEST)
Received: from DB7PR05CA0054.eurprd05.prod.outlook.com (2603:10a6:10:2e::31)
 by PAVPR08MB9038.eurprd08.prod.outlook.com (2603:10a6:102:32d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 16:30:15 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::6a) by DB7PR05CA0054.outlook.office365.com
 (2603:10a6:10:2e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 16:30:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 16:30:14 +0000
Received: ("Tessian outbound ff4e98f65004:v300");
 Wed, 10 Apr 2024 16:30:14 +0000
Received: from 5a8b2ed38bed.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 90A731B7-CE20-429E-9D74-8F5665CA2F90.1; 
 Wed, 10 Apr 2024 16:30:08 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a8b2ed38bed.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Apr 2024 16:30:08 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB9PR08MB8386.eurprd08.prod.outlook.com (2603:10a6:10:3d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 16:30:05 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 16:30:05 +0000
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
X-Inumbo-ID: 9e0e8f59-f757-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HhO3WjL5eLzLkRPE9a0uH7Ciod2HJzfcsC2moDBfCPZaYXotgIcouIRpJiNMULQa94LLbgqIAf76imRViYDiDTDegcdcwl51s9VV/0KyrybVVDYrlDrRamoG3es1FhTuN+1QToP9wEHQnl49dg/1L6fc+OBbrX6JmJe4TqffGQQPC/qSZGWXQyWcGRlckZ6Q0gq1ylNggOx1CUJXFTHx2OHHK2bERJXwfmbvG2hDtXptavIbU9pkKaA1DU3ZgKpUSJvZIto7I4iuGllNHqlTqnCbt4Qp3cY+lir+2ovLGGCw7OflhXkI5zEFRsI70kyWErLfBbpVean5YAzl1pp0Qw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTx7pGz53t+jPfJUg35n+hHGsol3nmtxMgmVz3opd8A=;
 b=hXyvi41gurRInDTb190Qns0i0uuA6CsLePB6rwEMyrfFTx1ef5mzV2NvMjSlEKTYUxlGr6zjmMdXqhvnjEDH6/M2CHgGb3YpxrODSF+LXWFQBYX4rh5MRwYe5ctTxWcTcPC4rTu8nzOICn0Ld32kF2ayylduxWalEHo+n9AVmxPetIfGdm03OzHv/aXK2oWge21Gereup0qwxsxqlgBS98zUtAXE795fzhNCnkOyLqi8aotu2i+StJ8NmJSFwJGJewd4hdXjOgseVi1WCxjn7r/5orRsWZG6Ee1fxXcefPRO9N+wlzd6yCL7F27QYXGG6Az75Adcr25vpa9TB7cTXA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTx7pGz53t+jPfJUg35n+hHGsol3nmtxMgmVz3opd8A=;
 b=Az2+Mb4QuDUkmgbNISxvBqRRWLVGfNMCaFf+Urpa1QZCgOe/6dg9fALtZZV3CpJPEWhTzpMHcfS1G64OlD/Axm+NEbj7KrtsObTHx/zAQCBykkpInfAXelsMQlWShKQnoFeomp/GClLAMijhHzy2BAxFs0Ts+NrYTNp4jmXNbOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 197d455c9c07f677
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/RwzzH9cYJZ9fvB7ywUjrJqoIYCBKusfRR5QwFpA05dTAezEjt7arAOMfaoFuSq0QoOiPZy5U6ZYo9WhmXYqu5AfrjgmhmXByOEQiBidPsuOtFk02bQ7srdAkBosJtFA9WQLSQqmlZnAzTzPUdyky/3ml12t3PNp41SZ1r5wU9kHJW57PbpgFXbxdkE1n5CAI+5VgqZixm1c/q/jYfvzUGM0B6rgTnJNQ05qkOfZ1kn1MLYiNoVQ9KanmdvDTmYuOuL+2+PlSzjzbt5ZLGSYn1PP0N6AYWvb9/wLktiz72QPerHTFb8L8XdEt0H6B0WLNvvC1i6W91yiEq8cBBukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTx7pGz53t+jPfJUg35n+hHGsol3nmtxMgmVz3opd8A=;
 b=G/KLcW1p2bjxjO4WG57a19wnrB24aHYlB28SqLJa6GcjUBZrxadAYwJI3NFpnVJkmW8cnH+iiUOugRMc8iBlH4VQ0NO21iuEeKL4Iu/e/GHeDtYdcKh2c3sPgvRbwPJ2gD4pADVJmnpxoyh6vZ6rN/BcBCWUi5pMyUogp+L0NXF9VAZMA1shVJDHHCBbK3zDZI1QMVOTgeR9EWil4xKWAZsWeMuUgqihC6nAMOz6SFH7jPklZ7fsxQoOP/aHZczjtuchUzw9k1DtI3sbVN6h6vByW8h71pp7BjOtgCXYLONcXrwNmBgb1J/9pl5fG8F8G2TxY4ZpjoiYkV8NLIa6gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTx7pGz53t+jPfJUg35n+hHGsol3nmtxMgmVz3opd8A=;
 b=Az2+Mb4QuDUkmgbNISxvBqRRWLVGfNMCaFf+Urpa1QZCgOe/6dg9fALtZZV3CpJPEWhTzpMHcfS1G64OlD/Axm+NEbj7KrtsObTHx/zAQCBykkpInfAXelsMQlWShKQnoFeomp/GClLAMijhHzy2BAxFs0Ts+NrYTNp4jmXNbOk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v1 5/5] xen/arm: ffa: support notification
Thread-Topic: [XEN PATCH v1 5/5] xen/arm: ffa: support notification
Thread-Index: AQHaipO/QuGF8TXkikCEHPNBW62gObFhpwaAgAAMdQA=
Date: Wed, 10 Apr 2024 16:30:05 +0000
Message-ID: <BC039B3A-5796-4D5F-9E18-4A54DAE368F5@arm.com>
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
 <20240409153630.2026584-6-jens.wiklander@linaro.org>
 <CAHUa44EeCeX6nbY+FG_WUK6n-GMBFFYS9khpHF59fH8BSiW01Q@mail.gmail.com>
In-Reply-To:
 <CAHUa44EeCeX6nbY+FG_WUK6n-GMBFFYS9khpHF59fH8BSiW01Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB9PR08MB8386:EE_|DB1PEPF00039231:EE_|PAVPR08MB9038:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 D1Xmw+Q2M5Uy4HlFVkt+vHtnTMD4nl8X1U4wPJ7NxOZZGVphZZVTqKvGT8HeEwgRBjfqfBUQoM8y7NLNSXSrp9kOOHY4D+Ocxe6vtDeeVkAWxriHofVNad5dzv0eIDXlvpibNjo3eF0U7EUrbA/LkgtN3PuuEoMFWF1M08OXspcyVwZDdCpsPTwtuiHVEcrEFGzYbEj3aQ3g/xQJEkQJZbMdKavti+xcAdiOVzn0W7NaPYd3aF43AyUiSg7oiyM5qNN7XeuyYb41pQggCh6gqiY0xruY780rtS0tIzJHWCyDDrzjO/EXNcWEocDIerG94mCdxVIT/irR2O5c5QQXEOQQCMYerdxt0ly1hoticoweiKQTrvak22vggn/NkbCRrb4JSUKORv2QTWTY5ptH1Z1ieR7K0jf8yfC40yxTl/XmDfWrqMStxmtAgI9lTr+naboYNWkbFHXAiqMUFd9Z9G2dNwgxaiOnTuEvBT8KehL/BcKnBt9nAv3jv5+i3rY0omOXoQqQHXiYcq8DVfOwRoWCoypSxhIdXzSCrEiSfa7v0nwyZ8O1rH+5+KXzODtAnGUbi9hk3v0XwzAR3g9EwNPIF+5WX7dnfO9ujD48wH5cwYtQqsAi6ihytUw1zEd2sR9CO4J2uTsCF1DY9pxHGKEJXGMqeNmwZ+lj0GDH/1Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A19905389A735F4190DBDBFFDEAC07AF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8386
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 483d0713-a26d-4b4b-eead-08dc597b8057
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bKYYG1ySpwzObxTCb79GOOvGCOg0XBazgbfGBD3B/6CyAiAEs0BDmM3Q0lT41wZx1Qs6+bcwJDityuZdpa680BLU4TMRIAMunOANewAU0SfHeT6vbCOMAA6gK12uz82qMB1lMcIx82gv0YXs8ekmFSi1WvqZd6igp5KNCdM8/5Qwr3+KqQNGjjmPE5/3fT5FdO/dZheVRq75kGgcEpjqDLkxFK/RNQ/0DmtbyHy7YJMwrOXD2prrIDq8dGicMjfofIog8SyMQ2Op0OjC2v+uGDAbF1xTLbXVdVPPRXcru1Ra1SJE0pH2LSMkKTBNnR0Lo4Hycb76NCUb9SiqSngz6BZPTfjDEZVRc50w1NhbkCKJyWDyhmx9YAWVx3Kcc19Ivbcqc4erW4GXBMurRXUTlXF8dpZJ/qwnmArqGL/fuUlEpP3ffpPcJkpn5EF6y8SFQ7TOWqVguMArZnaxfzdcU5a1kjhT+X6G6RH4C4iXbwLTZqGya2DL55qx/9G5jPbmrc1YLXraL1enbdYiaWsv630h5Mzjhm8ibZiMkz8NKHZYTQAF96sydRcdYtQNWOfO7u7AK/PUgQuAlOKWGs87klIaAwUPcntq2XIXm4i+26WyUcAc+Fnlrg2WD2vjdJEOnU2f844CaMiqUOWQiz/8V4Aw0ODljfABSd8lPyTBIoPVii0uqM8GdESsdRBcHFQ+cQvhWcYHs6anXxBi8j7CjAJ+YFfaSaaccfurAudxF2Shv7+o3EGuKlztMpHL1vf0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 16:30:14.8863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 483d0713-a26d-4b4b-eead-08dc597b8057
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9038

SGkgSmVucywNCg0KPiBPbiAxMCBBcHIgMjAyNCwgYXQgMTc6NDUsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgQXByIDksIDIw
MjQgYXQgNTozNuKAr1BNIEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xhbmRlckBsaW5hcm8ub3Jn
PiB3cm90ZToNCj4+IA0KPj4gQWRkIHN1cHBvcnQgZm9yIEZGLUEgbm90aWZpY2F0aW9ucywgY3Vy
cmVudGx5IGxpbWl0ZWQgdG8gYW4gU1AgKFNlY3VyZQ0KPj4gUGFydGl0aW9uKSBzZW5kaW5nIGFu
IGFzeW5jaHJvbm91cyBub3RpZmljYXRpb24gdG8gYSBndWVzdC4NCj4+IA0KPj4gR3Vlc3RzIGFu
ZCBYZW4gaXRzZWxmIGFyZSBtYWRlIGF3YXJlIG9mIHBlbmRpbmcgbm90aWZpY2F0aW9ucyB3aXRo
IGFuDQo+PiBpbnRlcnJ1cHQuIFRoZSBpbnRlcnJ1cHQgaGFuZGxlciByZXRyaWV2ZXMgdGhlIG5v
dGlmaWNhdGlvbnMgdXNpbmcgdGhlDQo+PiBGRi1BIEFCSSBhbmQgZGVsaXZlciB0aGVtIHRvIHRo
ZWlyIGRlc3RpbmF0aW9ucy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogSmVucyBXaWtsYW5kZXIg
PGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+DQo+PiAtLS0NCj4+IHhlbi9hcmNoL2FybS90ZWUv
TWFrZWZpbGUgICAgICB8ICAgMSArDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jICAgICAgICAg
fCAgNTggKysrKysrDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jICAgfCAzMTkgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9w
cml2YXRlLmggfCAgNzEgKysrKysrKysNCj4+IDQgZmlsZXMgY2hhbmdlZCwgNDQ5IGluc2VydGlv
bnMoKykNCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5j
DQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL01ha2VmaWxlIGIveGVuL2Fy
Y2gvYXJtL3RlZS9NYWtlZmlsZQ0KPj4gaW5kZXggZjAxMTJhMmY5MjJkLi43YzBmNDZmN2Y0NDYg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL01ha2VmaWxlDQo+PiArKysgYi94ZW4v
YXJjaC9hcm0vdGVlL01ha2VmaWxlDQo+PiBAQCAtMiw1ICsyLDYgQEAgb2JqLSQoQ09ORklHX0ZG
QSkgKz0gZmZhLm8NCj4+IG9iai0kKENPTkZJR19GRkEpICs9IGZmYV9zaG0ubw0KPj4gb2JqLSQo
Q09ORklHX0ZGQSkgKz0gZmZhX3BhcnRpbmZvLm8NCj4+IG9iai0kKENPTkZJR19GRkEpICs9IGZm
YV9yeHR4Lm8NCj4+ICtvYmotJChDT05GSUdfRkZBKSArPSBmZmFfbm90aWYubw0KPj4gb2JqLXkg
Kz0gdGVlLm8NCj4+IG9iai0kKENPTkZJR19PUFRFRSkgKz0gb3B0ZWUubw0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiBp
bmRleCA1MjA5NjEyOTYzZTEuLmNlOTc1N2JmZWVkMSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNo
L2FybS90ZWUvZmZhLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+IEBAIC0z
OSw2ICszOSw5IEBADQo+PiAgKiAgIC0gYXQgbW9zdCAzMiBzaGFyZWQgbWVtb3J5IHJlZ2lvbnMg
cGVyIGd1ZXN0DQo+PiAgKiBvIEZGQV9NU0dfU0VORF9ESVJFQ1RfUkVROg0KPj4gICogICAtIG9u
bHkgc3VwcG9ydGVkIGZyb20gYSBWTSB0byBhbiBTUA0KPj4gKyAqIG8gRkZBX05PVElGSUNBVElP
Tl8qOg0KPj4gKyAqICAgLSBvbmx5IHN1cHBvcnRzIGdsb2JhbCBub3RpZmljYXRpb25zLCB0aGF0
IGlzLCBwZXIgdkNQVSBub3RpZmljYXRpb25zDQo+PiArICogICAgIGFyZSBub3Qgc3VwcG9ydGVk
DQo+PiAgKg0KPj4gICogVGhlcmUgYXJlIHNvbWUgbGFyZ2UgbG9ja2VkIHNlY3Rpb25zIHdpdGgg
ZmZhX3R4X2J1ZmZlcl9sb2NrIGFuZA0KPj4gICogZmZhX3J4X2J1ZmZlcl9sb2NrLiBFc3BlY2lh
bGx5IHRoZSBmZmFfdHhfYnVmZmVyX2xvY2sgc3BpbmxvY2sgdXNlZA0KPj4gQEAgLTE5NCw2ICsx
OTcsOCBAQCBvdXQ6DQo+PiANCj4+IHN0YXRpYyB2b2lkIGhhbmRsZV9mZWF0dXJlcyhzdHJ1Y3Qg
Y3B1X3VzZXJfcmVncyAqcmVncykNCj4+IHsNCj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZCA9IGN1
cnJlbnQtPmRvbWFpbjsNCj4+ICsgICAgc3RydWN0IGZmYV9jdHggKmN0eCA9IGQtPmFyY2gudGVl
Ow0KPj4gICAgIHVpbnQzMl90IGExID0gZ2V0X3VzZXJfcmVnKHJlZ3MsIDEpOw0KPj4gICAgIHVu
c2lnbmVkIGludCBuOw0KPj4gDQo+PiBAQCAtMjQwLDYgKzI0NSwzMCBAQCBzdGF0aWMgdm9pZCBo
YW5kbGVfZmVhdHVyZXMoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgICAgIEJV
SUxEX0JVR19PTihQQUdFX1NJWkUgIT0gRkZBX1BBR0VfU0laRSk7DQo+PiAgICAgICAgIGZmYV9z
ZXRfcmVnc19zdWNjZXNzKHJlZ3MsIDAsIDApOw0KPj4gICAgICAgICBicmVhazsNCj4+ICsgICAg
Y2FzZSBGRkFfRkVBVFVSRV9OT1RJRl9QRU5EX0lOVFI6DQo+PiArICAgICAgICBpZiAoIGN0eC0+
bm90aWYuZW5hYmxlZCApDQo+PiArICAgICAgICAgICAgZmZhX3NldF9yZWdzX3N1Y2Nlc3MocmVn
cywgRkZBX05PVElGX1BFTkRfSU5UUl9JRCwgMCk7DQo+PiArICAgICAgICBlbHNlDQo+PiArICAg
ICAgICAgICAgZmZhX3NldF9yZWdzX2Vycm9yKHJlZ3MsIEZGQV9SRVRfTk9UX1NVUFBPUlRFRCk7
DQo+PiArICAgICAgICBicmVhazsNCj4+ICsgICAgY2FzZSBGRkFfRkVBVFVSRV9TQ0hFRFVMRV9S
RUNWX0lOVFI6DQo+PiArICAgICAgICBpZiAoIGN0eC0+bm90aWYuZW5hYmxlZCApDQo+PiArICAg
ICAgICAgICAgZmZhX3NldF9yZWdzX3N1Y2Nlc3MocmVncywgRkZBX05PVElGX1BFTkRfSU5UUl9J
RCwgMCk7DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAgZmZhX3NldF9yZWdzX2Vy
cm9yKHJlZ3MsIEZGQV9SRVRfTk9UX1NVUFBPUlRFRCk7DQo+PiArICAgICAgICBicmVhazsNCj4g
DQo+IFdpdGggdGhlIHJlY2VudGx5IHBvc3RlZCBrZXJuZWwgcGF0Y2gNCj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjQwNDEwLWZmYV9ucGlfc3VwcG9ydC12MS0zLTFhNTIyMzM5MWJk
MUBhcm0uY29tLw0KPiB3ZSBuZWVkIHRvIGRlY2lkZSB3aGljaCBmZWF0dXJlIGludGVycnVwdCB0
byByZXR1cm4gc2luY2UgdGhlIGtlcm5lbA0KPiB3aWxsIG9ubHkgaW5zdGFsbCBhIGhhbmRsZSBm
b3IgdGhlIGZpcnN0IGl0IGZpbmRzLiBSaWdodCBub3cgSSBwcm9wb3NlDQo+IHRvIHRvIG5vdCBy
ZXBvcnQgRkZBX0ZFQVRVUkVfU0NIRURVTEVfUkVDVl9JTlRSLiBXaGVuIHRoZSB0aW1lIGNvbWVz
DQo+IHRvIHVzZSBhIHNlY29uZGFyeSBzY2hlZHVsZXIgd2UnbGwgbmVlZCB0byByZXBvcnQgdGhl
IFNSSSBpbnN0ZWFkLg0KDQoNCldlIGp1c3QgaGFkIGEgbWVldGluZyB3aXRoIFN1ZGVlcCB0byBk
aXNjdXNzIHRoYXQgbWF0dGVyIGFuZCBoZSBhZ3JlZWQgdGhhdA0KaGUgd291bGQgcmVnaXN0ZXIg
dGhlIGludGVycnVwdCBoYW5kbGVyIGZvciBhbGwgdGhlIGludGVycnVwdHMgYXZhaWxhYmxlIHNv
IHRoYXQNCndlIGNhbiBrZWVwIGEgbW9kZWwgd2hlcmUgd2Ugd2lsbCBnZW5lcmF0ZSBTUklzIG9u
bHkgdG8gYSBzZWNvbmRhcnkgc2NoZWR1bGVyDQphbmQgTlBJIGZvciBub3RpZmljYXRpb24gaW50
ZXJydXB0cyAoc28gdGhhdCB0aGUgVk0gZG9lcyBub3QgZG8gYSBJTkZPX0dFVCB3aGVuDQpub3Qg
cmVxdWlyZWQpLg0KDQpXZSB3aWxsIGhhdmUgdG8gcmVwb3J0IGJvdGggYXMgYW55IFZNIGNvdWxk
IGFjdCBhcyBzZWNvbmRhcnkgc2NoZWR1bGVyIGZvciBTUHMNCmluIHRoZW9yeSAod2UgbWlnaHQg
bmVlZCBhdCBzb21lIHBvaW50IGEgcGFyYW1ldGVyIGZvciB0aGF0KSBidXQgZm9yIG5vdyB0aG9z
ZQ0Kc2hvdWxkIG9ubHkgYmUgZ2VuZXJhdGVkIHRvIERvbTAgaWYgdGhlcmUgYXJlIHBlbmRpbmcg
bm90aWZpY2F0aW9ucyBmb3IgU1BzLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg==

