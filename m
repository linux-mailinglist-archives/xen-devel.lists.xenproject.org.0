Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 141C549219D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 09:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258399.444930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9kAd-0007sw-VH; Tue, 18 Jan 2022 08:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258399.444930; Tue, 18 Jan 2022 08:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9kAd-0007q7-RY; Tue, 18 Jan 2022 08:48:51 +0000
Received: by outflank-mailman (input) for mailman id 258399;
 Tue, 18 Jan 2022 08:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2vFr=SC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1n9kAc-0007q1-HY
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 08:48:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 746148e6-783b-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 09:48:49 +0100 (CET)
Received: from AM6P195CA0039.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::16)
 by VI1PR08MB2927.eurprd08.prod.outlook.com (2603:10a6:802:21::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Tue, 18 Jan
 2022 08:48:44 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::98) by AM6P195CA0039.outlook.office365.com
 (2603:10a6:209:87::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Tue, 18 Jan 2022 08:48:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 08:48:43 +0000
Received: ("Tessian outbound dbb52aec1fa6:v110");
 Tue, 18 Jan 2022 08:48:42 +0000
Received: from 209a2e7eaef6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 74A3BEE4-9479-4817-BF73-E1F859D8D43A.1; 
 Tue, 18 Jan 2022 08:48:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 209a2e7eaef6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jan 2022 08:48:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3767.eurprd08.prod.outlook.com (2603:10a6:20b:84::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 08:48:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4888.013; Tue, 18 Jan 2022
 08:48:33 +0000
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
X-Inumbo-ID: 746148e6-783b-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rFuzBQEQg1HkDI7xTNGydfivitOZLGznSGA2tORs/s=;
 b=SsYrRFPfFWSUckO1wL/+6btNcTZdoJBIk/P5WxL6zkJc5wxnhPnL5yo7zEV7uOivLv7kVjZ4SxVxD0b7uN/7iV8GI2qaoHGr99e3KY/8V4UgIF31y+hOQZPahIxmtgGrAYKq2ojoFx0uzLL/TjkeRaxVQnEurcUoakHcPKYXGHM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 042febbad23cbbdf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRWOJrsvKSxs7pwFR3WU72EM9yOMy49YVpCTAzN9kZs3T5483lQ6Ih8pkDVGQDWFzj1kp8KLwq0sIDS1uEfQN/Zc6PtC/Iio81KkA/Me161TMA52mFwne7K6YkdBFbVKma6dIUwcqMHhMtFFccT49rF20m8bff+hOit0q9fddUHYHhq71g2yHL0TPzFpzZWMHaTGqDp2jiIKpQCDAz3ZtN0QLbkxlBj/QeDOS9tFJkYvp13LabQadlBgydn94vlqBJmsSwsH8AetFYm+6C9E7BY/nWGangKKk5fISMFJOGsxJsoC0qQTbJNi0UHm08a2vuYLW6KovL7nSDpZhzQzZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rFuzBQEQg1HkDI7xTNGydfivitOZLGznSGA2tORs/s=;
 b=DM8rOvwKR9YIGQ3KSfvvC3B2X+6vxTAz/2U0PSANN/SwiqUO5ZqZfD/3hQCgDjGsvjiZKAfbtmHSdDT84w7d0L/+XRkZZuBrWa/JmtQO635KhxBHICzvmmSnPtYrMFEWf4hcz4zao5S9B+oIFFuyEr+j5qtjttyRvufdQCn3MeBYg5c5TpsLqz2nD+oAaQrTB699mGtnpjdehrT+RJuXbZAxLXjq2yCtRcHjgM/RxR52mHJY8DB1ol/pypWg2Kg4D9ev7hhkK3ioD9tqEWcwUuGQ820YKlojW5Yqq+OmKG5bs1wqYpmC0UNdN6cS+CnvrOs4Nb6QyzbXidP/jF2SHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rFuzBQEQg1HkDI7xTNGydfivitOZLGznSGA2tORs/s=;
 b=SsYrRFPfFWSUckO1wL/+6btNcTZdoJBIk/P5WxL6zkJc5wxnhPnL5yo7zEV7uOivLv7kVjZ4SxVxD0b7uN/7iV8GI2qaoHGr99e3KY/8V4UgIF31y+hOQZPahIxmtgGrAYKq2ojoFx0uzLL/TjkeRaxVQnEurcUoakHcPKYXGHM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Dongjiu Geng <gengdongjiu1@gmail.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
Thread-Topic: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
Thread-Index: AQHYC20k2h7y374id02KJynAohV9hqxnQp6AgAE2BYCAAADaAA==
Date: Tue, 18 Jan 2022 08:48:33 +0000
Message-ID: <9A7FAD16-3D4A-4C22-8288-A4719A993CDD@arm.com>
References: <20220117064003.3367188-1-gengdongjiu1@gmail.com>
 <2a1a0dd5-b8a7-8072-2961-b1fbe9ec746a@xen.org>
 <CABSBigSOjoXABoYoe+SahQyX0P045YjgK3A=7yyxw_aX8nzTqg@mail.gmail.com>
In-Reply-To:
 <CABSBigSOjoXABoYoe+SahQyX0P045YjgK3A=7yyxw_aX8nzTqg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9b1ee88d-083c-4cb2-8d93-08d9da5f54f4
x-ms-traffictypediagnostic:
	AM6PR08MB3767:EE_|VE1EUR03FT040:EE_|VI1PR08MB2927:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB2927085A7DCA62170251B3D79D589@VI1PR08MB2927.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FAz2sj2wSnvp1J50yi2bKySxcE5uQE1X43Tdos5+7+HHuDMW18I8K292bbTgcFwoqShx4re784D/u+zP+9+BWF/hpDbIQBhong91AwQ8XZxj/hjfgFZwEjFNfXYXlqqPl9HTSKPpcg7RxweLemJJDenBo1duYwBn5C8lndsdM/VNg04VkGSzZKv9rreltLnikVQCs63QiazUaUs+2SeZkCYn7PC12pTZW5jmz2D3GB1YN0k71LtVNnW5stBazzRG2tlVJPTRuybL7zPvCV3XOZqw05xOAnIpYWyvYn7GmUnCtCWhjd+6ReoUwcbQwsdxzetCHDLU5/UEOQfJXUEfj8MRorCGTDuVEixScU45H0Hkg6JoFgSEX4/mWcPSZiZc5DOUh3xZqG6VbrCRAUie5c5kMswPQ7l7kvvy2fWurdTepsxVtNfk80qjd+r1nAWfBYSH/Z0HvGP8uDFcZMUYqBHlrGfAnBO1CP+jCs2VB6wKdIGJICqJRXHf8Gxj8XpduQOcR72Jb7TgbT6OvRUqAd53AJ59q8hgrKWv1H6csLfEPrieXoIElCHTDmaSpkvaKnxK/KwIsH2LByfxGSAWLa1ll8TJpCEyFvzPFoOAAjEMbIiV4gjn8oPEGxsHIVF7yWTBjOl6ru4ZjyB95gyiY331tzJcBFpdBqvHEnPrpql7ZtfY6H0yLGlxQfF1uHQp4XnyY41l2p9o80Zlq5f8Kno3VQuitHIoPqSuzA8dmWutOYJGutsTjHL5lQ0FMCUs
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(83380400001)(36756003)(2616005)(122000001)(54906003)(6506007)(186003)(6916009)(91956017)(38070700005)(86362001)(76116006)(6512007)(64756008)(71200400001)(66946007)(66556008)(508600001)(66476007)(2906002)(8676002)(26005)(38100700002)(316002)(53546011)(8936002)(33656002)(66446008)(6486002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5D75D857CF90B48A1DDDF583A08272D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3767
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b83f97b2-b134-4adb-d947-08d9da5f4f1f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	brEKz0pQw0rWf5VXPek1qcHofAJx36zZirqbkb42UGcfcquekidO1BSSAk+vsL+XusVe65B8Du/rvalIGTOrnsEe0xX+tR32WbJcR7KnERlJTukob9B0G7ZVzV6RdWljeKRhGhPMv5W/bfmpr3fpC+FPzFRP0xR0cD9k7pfeDBJF3wJ5uwq83qTIbJ1OVjFdWbeo3b1vFnaqPgFPgql6a9V3tm7Xs2tZLjbJLhJX4JZZDU9MjETenL/EPR7pqYxdYCXiUYBDZrF5PvkmO0qE93WQgehIYBSsBIi9Y34Egg6CFVM04/iUli+56paBHaMj7x4cdE/9/UBlx5FU30CRmD+EfQMlnZEHBqcIgoXFbCnz338em1lKgRgyVg8qjfRbmMLnHFSEtXHUeKwH4zOt441ImLZItkuOZWRFpuCMQXbhzDF+Ic3y9Mgc1vRYO9TCcNjuZv1g+XBMkaGzCfSfBD4WXhBknHIzRaWUSfNBIQWwlx5X7FWHY0g2TwEhj0ayMEIFIXbljV2y6owmKNpEMQszO/zhL68mCANqB6FupLYYqmLg7sJP5ZScLzV5GlR8o41EO3tvHyDQEE06nGaeiC+aDjOPaGbz1BjRVmYBP0qqZlDx17+Qwt9Xevl7V9MIBLx5o03gP2Yx9XERQdbxiBTZqOD/OvhGr+wUBBjrVkJNuW3gKCKCUQ/5L+lx+oHVECb2hLwF5NOCc89DWPn9Yw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(6512007)(86362001)(54906003)(6486002)(5660300002)(2906002)(336012)(356005)(36756003)(70206006)(83380400001)(6506007)(70586007)(6862004)(53546011)(508600001)(26005)(186003)(81166007)(8936002)(82310400004)(33656002)(4326008)(8676002)(36860700001)(47076005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 08:48:43.0603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1ee88d-083c-4cb2-8d93-08d9da5f54f4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2927

SGkgRG9uZ2p1LA0KDQo+IE9uIDE4IEphbiAyMDIyLCBhdCAwODo0NSwgRG9uZ2ppdSBHZW5nIDxn
ZW5nZG9uZ2ppdTFAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+IOS6jjIwMjLlubQx5pyIMTfml6XlkajkuIAgMjI6MTblhpnpgZPvvJoNCj4+IA0K
Pj4gSGksDQo+PiANCj4+IE9uIDE3LzAxLzIwMjIgMTA6NDAsIERvbmdqaXUgR2VuZyB3cm90ZToN
Cj4+PiBJdCB0dXJucyBvdXQgdGhhdCBRRU1VIGhhcyBiZWVuIHN1cHBvcnRpbmcgR0lDdjIgdmly
dHVhbGl6YXRpb24gc2luY2UNCj4+PiB2My4xLjAuIFNvIHJlbW92ZSB0aGUgZGVwZW5kZW5jaWVz
IG9uIEdJQ3YzLg0KPj4gDQo+PiANCj4+IFRlY2huaWNhbGx5LCB0aGUgY3VycmVudCBmb3JtIG9m
IENPTkZJR19RRU1VIGFsbG93cyB0aGUgc2FtZSBiaW5hcnkgdG8NCj4+IGJvb3Qgb24gUUVNVSB3
aXRoIEdJQ3YyIG9yIEdJQ3YzLg0KPj4gDQo+Pj4gSWYgd2Ugd2FudCB0byB1c2UgR0lDdjMsDQo+
Pj4gd2UgY2FuIHNlbGVjdCB0aGUgUUVNVV9MRUdBQ1kgY29uZmlndXJhdGlvbi4NCj4+IA0KPj4g
QUZBSUssIEdJQ3YzIGlzIG5vdCBhIGxlZ2FjeSBmZWF0dXJlLi4uIFNvIGl0IGZlZWxzIGEgYml0
IG9kZCB0byBuYW1lIGl0DQo+PiBsaWtlIHRoYXQgKHNlZSBtb3JlIGJlbG93KS4NCj4gDQo+IExl
Z2FjeSBtZWFucyBRRU1VIHBsYXRmb3JtIG9ubHkgc3VwcG9ydHMgR0lDVjMsIG5vdyBpdCBjYW4g
c3VwcG9ydA0KPiBib3RoIEdJQ3YyIGFuZCBHSUN2My4gVGhlIHNjb3BlIG9mIHN1cHBvcnQgaGFz
IGJlZW4gZXhwYW5kZWQNCj4gTm90IG1lYW4gR0lDdjMgaXMgYSBsZWdhY3kgZmVhdHVyZS4NCg0K
WW91IG1pZ2h0IGJlIG1pc2xlYWRpbmcgYSBiaXQgaGVyZS4NCkluIHRoZSBjdXJyZW50IGNvbmZp
Z3VyYXRpb24sIFhlbiBzdXBwb3J0IEdJQ3YyLCBHSUN2MyBhbmQgdmdpYy4NClRoZSBvbmx5IHRo
aW5nIG5vdCBzdXBwb3J0ZWQgaXMgYWN0dWFsbHkgdGhlIG5ldyBWR0lDIGJ1dCB0aGlzIGlzIGFu
IHVuc3VwcG9ydGVkIGZlYXR1cmUgbm90IGZ1bGx5IGZ1bmN0aW9uYWwgd2hpY2ggc2hhbGwgYmUg
dXNlZCB3aXRoIGNhdXRpb24uDQoNCldoYXQgaXNzdWUgZXhhY3RseSBkbyB5b3UgaGF2ZSBpbiBR
ZW11IGNvbmZpZ3VyZWQgZm9yIGdpY3YyIHdoZW4geW91IHVzZSB0aGUgZGVmYXVsdCBjb25maWd1
cmF0aW9uID8NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPj4gDQo+Pj4gDQo+Pj4gU2lnbmVk
LW9mZi1ieTogRG9uZ2ppdSBHZW5nIDxnZW5nZG9uZ2ppdTFAZ21haWwuY29tPg0KPj4+IC0tLQ0K
Pj4+ICB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcgfCAxMCArKysrKysrKystDQo+Pj4g
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+PiANCj4+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnIGIveGVuL2FyY2gv
YXJtL3BsYXRmb3Jtcy9LY29uZmlnDQo+Pj4gaW5kZXggYzkzYTZiMjc1Ni4uNDFlODJhNDJlZSAx
MDA2NDQNCj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcNCj4+PiArKysg
Yi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcNCj4+PiBAQCAtMTMsNyArMTMsMTUgQEAg
Y29uZmlnIEFMTF9QTEFUDQo+Pj4gICAgICBhdXRvbWF0aWNhbGx5IHNlbGVjdCBhbnkgb2YgdGhl
IHJlbGF0ZWQgZHJpdmVycy4NCj4+PiANCj4+PiAgY29uZmlnIFFFTVUNCj4+PiAtICAgICBib29s
ICJRRU1VIGFhcmNoIHZpcnQgbWFjaGluZSBzdXBwb3J0Ig0KPj4+ICsgICAgIGJvb2wgIlFFTVUg
YWFyY2ggdmlydCBtYWNoaW5lIHN1cHBvcnQgPj0gdjMuMS4wIg0KPj4gDQo+PiBUaGlzIGlzIGEg
Yml0IG1pc2xlYWRpbmcuIEEgdXNlciBtYXkgc2VsZWN0IHRoaXMgdGhpbmtpbmcgdGhhdCB0aGlz
IHdpbGwNCj4+IHNlbGVjdCBHSUN2My4gSG93ZXZlciwgdGhpcyB3aWxsIG5vdC4NCj4+IA0KPj4g
VGhpcyBhbHNvIHJhaXNlcyB0aGUgcXVlc3Rpb24gb2Ygd2hhdCBpcyB0aGUgZGVmYXVsdCBHSUMg
dmVyc2lvbiBpbiBRRU1VDQo+PiAoaS5lLiBpZiB5b3UgZG9uJ3QgcGFzcyBhbnl0aGluZyBvbiB0
aGUgY29tbWFuZCBsaW5lKT8gSWYgdGhpcyBpcyBHSUN2MywNCj4+IHRoZW4gSSBhbSBhZnJhaWQg
dGhhdCB0aGlzIHBhdGNoIHdvdWxkIGJlIGEgbm8tZ28gZm9yIG1lLg0KPj4gDQo+PiBMb29raW5n
IGF0IG92ZXJhbGwgZGlzY3Vzc2lvbiwgeW91IHNlZW0gdG8gcHVzaCB0aGUgcGF0Y2ggb25seSB0
byBhbGxvdw0KPj4gYnVpbGRpbmcgYSB0aW55IFhlbiBmb3IgUUVNVSBhbmQgdGhlIG5ldyB2R0lD
Lg0KPj4gDQo+PiBUaGUgZGVmYXVsdCBYZW4gKGkuZS4gbWFrZSBkZWZjb25maWcpIHdpbGwgYWxz
byB3b3JrIG9uIFFFTVUuIEdpdmVuIHRoYXQNCj4+IHRoZSBuZXcgdkdJQyBpcyBhIHN0aWxsIGlu
IGRldmVsb3BtZW50LCBJIGFtIHNlcmlvdXNseSBjb25zaWRlcmluZyB0bw0KPj4gc2F5IHRoYXQg
aWYgeW91IHdhbnQgdG8gdHJ5IGl0IHRoZW4geW91IGhhdmUgdG8gdXNlIHRoZSBkZWZhdWx0DQo+
PiBjb25maWd1cmF0aW9uLg0KPj4gDQo+PiBARG9uZ2ppdSwgaXMgdGhlcmUgYW55IHJlYXNvbiB3
aHkgeW91IHdhbnQgdG8gdXNlIHRoZSB0aW55IFFFTVUgY29uZmlnDQo+PiByYXRoZXIgdGhhbiB0
aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uPw0KPiANCj4gSGkgSnVsaWVuLCB0aGFua3MgZm9yIHRo
ZSByZXBseSwgSSBkbyBub3QgdXNlIHRoZSB0aW55IFFFTVUgY29uZmlnLiBJDQo+IHVzZWQgdGhl
IGRlZmF1bHQgY29uZmlndXJhdGlvbiBhbmQgc2VsZWN0ZWQgdGhlIHBsYXRmb3JtIGFzIFFFTVUu
DQo+IEJ1dCBRRU1VIHBsYXRmb3JtIG9ubHkgc2xlY3RzIEdJQ1YzLCBzbyBJIHN1Ym1pdCB0aGlz
IHBhdGNoIHRvIHJlbW92ZQ0KPiB0aGUgbGltaXRhdGlvbiBiZWNhdXNlIEkgd2FudCB0byB1c2Ug
VkdJQy4gVkdJQyBjYW4gYWxyZWFkeSBzdXBwb3J0DQo+IEdJQ3YyIG5vdy4NCj4gDQo+PiANCj4+
IEBCZXJ0cmFuZCwgQFN0ZWZhbm8sIHdoYXQgZG8geW91IHRoaW5rPw0KPj4gDQo+PiBDaGVlcnMs
DQo+PiANCj4+IC0tDQo+PiBKdWxpZW4gR3JhbGwNCg0K

