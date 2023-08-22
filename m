Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E78C783C1D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 10:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588267.919786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYN4a-0002v7-M4; Tue, 22 Aug 2023 08:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588267.919786; Tue, 22 Aug 2023 08:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYN4a-0002s5-I6; Tue, 22 Aug 2023 08:49:12 +0000
Received: by outflank-mailman (input) for mailman id 588267;
 Tue, 22 Aug 2023 08:49:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hUC=EH=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qYN4Y-0002rF-Ox
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 08:49:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1229f55-40c8-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 10:49:07 +0200 (CEST)
Received: from DU7PR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::16) by AS4PR08MB7999.eurprd08.prod.outlook.com
 (2603:10a6:20b:582::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:49:04 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:50e:cafe::5f) by DU7PR01CA0035.outlook.office365.com
 (2603:10a6:10:50e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:49:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.15 via Frontend Transport; Tue, 22 Aug 2023 08:49:03 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Tue, 22 Aug 2023 08:49:03 +0000
Received: from 178e3dfe1f74.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F171F036-B525-413D-A4DC-4E26439CEF12.1; 
 Tue, 22 Aug 2023 08:48:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 178e3dfe1f74.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Aug 2023 08:48:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9988.eurprd08.prod.outlook.com (2603:10a6:20b:642::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:48:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 08:48:20 +0000
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
X-Inumbo-ID: c1229f55-40c8-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvNcUCCjHhQiKEMqkLpckhqgQAIi/m3zc2iIKsFud7k=;
 b=NrOWHHfm6b4MYIrFuQTaoFc1eKnnrrlTqHYLFCTBsVgkgsMb8CfkPTjhhiJNZAdUebdap+SViaxLnULW4fQfTllS0648hq/fquBdWMbHySx/PnQb7Vgu0YOdt8YZRORrHl+oKSBclO6iKgIgxMZQTGA+v0pdqvOpKvhvNbDHbtE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ca13b3051e153e6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDPI7Ma9eKZk+TwUd/rzqYn+/d4kxkTku93Tq4dKlH8nQaFszO71iuMSU6W+se0tDO72jpYW/E8uEKp1RZp2twz1mZJQASk8naz5lfDfFxsJi0+tVFgn+xd8yak8g7ve7DkpUjufQdnGVsir5n+J1bGQ3xUje7gmBfSHzX+XkAkSY5gBiSPximX4zHgl0cEP5i0DD+PrSwMa0HEGH4WAkIRX9Y5cnaA0y3z1tC97ChR4noq0WXOQbNRwsGGEQ9M4+QtspHHFEl8FfUOeexRjcpKsBMRJj5uPjNUjy0G+sFk5flbD52ear+GoQi8dr/NI85yM1l33mxkjsW7zcDbr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvNcUCCjHhQiKEMqkLpckhqgQAIi/m3zc2iIKsFud7k=;
 b=i1Vc7aJcpCYIHbWS3W05tezT0u2ri4WRk/LgSX41Xk1022NpE0zY3RXj1wAgFrZzf5FUIZ5JGxnoQ7xk5tPvFj4/X8rB6/36MTkZUYZ75rYN6+F7p1zQ7u+TQ+/th1O72HHp8AGAjtoNDSVWYYn9LinzApr+1dDrUqKaZdCzhxeHlf+7DH67I1mrmX8TrSdRHy4TfrH46X+aGa49jvjw2h/aRiQD6IvONlGt1yPU1KoKlrm7NYjJX1XigQ6J5/ctvxDtKdtKUjMAphhLbFsVd+EvJbpFF7wzXqFlSnjDPHgXhM2eLRmEp2H/wOpjQk+rZje8h/fFCHrMxVXSPQtKzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvNcUCCjHhQiKEMqkLpckhqgQAIi/m3zc2iIKsFud7k=;
 b=NrOWHHfm6b4MYIrFuQTaoFc1eKnnrrlTqHYLFCTBsVgkgsMb8CfkPTjhhiJNZAdUebdap+SViaxLnULW4fQfTllS0648hq/fquBdWMbHySx/PnQb7Vgu0YOdt8YZRORrHl+oKSBclO6iKgIgxMZQTGA+v0pdqvOpKvhvNbDHbtE=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v5 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Thread-Topic: [PATCH v5 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Thread-Index: AQHZzmeUay8NQ4kvrE+CkZdRGQuMz6/1UcMAgABNUICAAGaFgIAACFcA
Date: Tue, 22 Aug 2023 08:48:20 +0000
Message-ID: <AAA444BB-00F4-44D6-A8E1-5C84A4EB8092@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-14-Henry.Wang@arm.com>
 <67f4015f-fb63-f097-ce1b-ea6264232a1e@xen.org>
 <FA20A514-B1D2-4FBA-97F4-93981E1F0636@arm.com>
 <3413dc3c-f343-4e88-aa08-d5a0634c1ef4@xen.org>
In-Reply-To: <3413dc3c-f343-4e88-aa08-d5a0634c1ef4@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9988:EE_|DBAEUR03FT034:EE_|AS4PR08MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: a97bb484-2d2c-4163-3000-08dba2eca341
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Jh7hrho2TZKOhB9AxPEkfJYJBDR3VdQpu1YXcGilNyfG5wnZluOvES+YGLzMOgJ82XEsvyCyWI8wkCgbk0g7AP+EdM57MQiib59/ClVTYRBQbSpzqLiHliL6m+Y/q1tWHM5dm6DYg4+CmEfHsrebsJcuJBlTEWiclD4nZ36Mp69XqMiStKKN4UCHeUa42cEPGMXNU0KHqrq35y8/fz/T8GFKi1Lz+kxTfNWlc4d32E2+EreBj6OaV3qTBF18OJbVqYTQ3JooqlrxftVnaEs9nBPb67w+8kyRMPE9ykxiJkNh1grJkCZ8FlYn6pBr2tbCaYVVPABD9prgWkUy+tZxAHiuEbg6y0tFCPC5K2g3ypw3HEFS+m4qPVVXb2Zr9Eb7z7QN6Bcj0fpwjHr/cNfOAkd1qArPlgKpgGxHtezTKdcJAl4IWWjMwsUFx9ZhysRmgzEEnvbEklNZtK2D57CMfF4PW6JU0XMl4/LV5ArGzgfw5tbB7y3LtKXjrsJVaWDoA9IBPU6EIRlnpRSz7thGGr2na3WzCkZFqs+oSDmI2foQJALNU5I/De5vb2BQ6S5ZUkIzeFLnylbKal9ONFXjWiTUlWDmTau312R2zW6JV7UlPmw3QMLjtkhuv62ZT+hn8RzqjByUzg6ok4GcK72tNw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(54906003)(76116006)(66446008)(6916009)(66476007)(66556008)(64756008)(316002)(66946007)(6512007)(91956017)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(122000001)(478600001)(71200400001)(38070700005)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(86362001)(5660300002)(26005)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEA8DB7E01BC8D4BB03DA665A2292CD7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9988
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	72691f4f-5727-46b7-d7f4-08dba2ec8980
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S7NaQivnXcPQ05wZJau8C9mU/kTgvOWAs25IiCF4XaQA3uiPqfLo6i+Y/xRTHAVZ6Pgd7XdoO19/Wgg21JG29Fnlh63tU+Y0OFxXcCkSZCmct2xvZtrmayu/xpfQuk8IQT7i/GDvDJfBro77IluOOIvZevWtP3oYw4spve9GHM0XISjkU3lBHJOAOpnHdJfoxefnfsnECAVpyCUEsfELmeSBwlLcej/fly5NRrH/J6HFKNOb8pMILIPcZc3SzmhwVVZZST491ya8P5XpBPK7Ifv4CqcxQ+EZvUp7aqM4rZg4VXYAHOVERLjm+DvXcb90rTR80oQ0vhjVzViFO/QGIRg8xgrS41cB3kWVyA3pI9/lG5I6xr6K8dEM3EcKECaw0hJhL2Ptnt0BbWvXb/HkOEnCHGoMO6aF+/h4ItKJn+5oM66FFj1nfdD2SPmQT6ChhDB45Z4hM9Uq61+l7dL8qGR4n7cxvs4TLWn1PxgDRaDeTfUOyRgdWyKI2hOcHGxb5saDXYtsPMzizwjKiaemlBOFZ2a8TuAkvA3pGEESZmQmh9L7LpPjlmlv7HsE7uVEV9TW3B4nHcpICvj6hgcxKCrqdGnbPtNkXT/s3NANZ57DAPjL7VosxlB/0Hoj7xQQEZnMV1XNOP/wFMaOjecdnaj+6HAYR4Z9cNnfMWOocyOlAQdE5y2gnQkrwtDEpqsY9M314QXtHqhoP96RP1ObdO4lwvGr6eUMx5mYgjx5KfhUio+jzZFOrmwxzFj7LcVn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(1800799009)(186009)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(54906003)(70206006)(70586007)(316002)(6512007)(8676002)(8936002)(2616005)(6862004)(4326008)(40460700003)(36756003)(41300700001)(82740400003)(356005)(81166007)(478600001)(53546011)(6506007)(6486002)(40480700001)(83380400001)(2906002)(86362001)(47076005)(36860700001)(336012)(5660300002)(26005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:49:03.7997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a97bb484-2d2c-4163-3000-08dba2eca341
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7999

SGkgSnVsaWVuLA0KDQo+IE9uIEF1ZyAyMiwgMjAyMywgYXQgMTY6MTgsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gT24gMjIvMDgvMjAyMyAwMzoxMSwgSGVucnkg
V2FuZyB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4gDQo+IEhpLA0KPiANCj4+PiBPbiBBdWcgMjIs
IDIwMjMsIGF0IDA1OjM0LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+
PiANCj4+PiBIaSwNCj4+PiANCj4+PiBPbiAxNC8wOC8yMDIzIDA1OjI1LCBIZW5yeSBXYW5nIHdy
b3RlOg0KPj4+PiBGcm9tOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4+Pj4g
U01NVSBzdWJzeXN0ZW0gaXMgb25seSBzdXBwb3J0ZWQgaW4gTU1VIHN5c3RlbSwgc28gd2UgbWFr
ZSBpdCBkZXBlbmRlbnQNCj4+Pj4gb24gQ09ORklHX0hBU19NTVUuDQo+Pj4gDQo+Pj4gIm9ubHkg
c3VwcG9ydGVkIiBhcyBpbiBpdCBkb2Vzbid0IHdvcmsgd2l0aCBYZW4gb3IgdGhlIEhXIGlzIG5v
dCBzdXBwb3J0aW5nIGl0Pw0KPj4gSSB0aGluayBjdXJyZW50bHkgdGhlcmUgYXJlIG5vIGhhcmR3
YXJlIGNvbWJpbmF0aW9uIG9mIE1QVSArIFNNTVUsIGJ1dA0KPj4gdGhlb3JldGljYWxseSBJIHRo
aW5rIHRoaXMgaXMgYSB2YWxpZCBjb21iaW5hdGlvbiBzaW5jZSBTTU1VIHN1cHBvcnRzIHRoZSBs
aW5lYXINCj4+IG1hcHBpbmcuIFNvIHdvdWxkIGJlbG93IHJld29yZCBsb29rcyBnb29kIHRvIHlv
dToNCj4+IOKAnEN1cnJlbnRseSB0aGUgaGFyZHdhcmUgdXNlIGNhc2Ugb2YgY29ubmVjdGluZyBT
TU1VIHRvIE1QVSBzeXN0ZW0gaXMgcmFyZWx5DQo+PiBzZWVuLCBzbyB3ZSBtYWtlIENPTkZJR19B
Uk1fU01NVSBhbmQgQ09ORklHX0FSTV9TTU1VX1YzDQo+PiBkZXBlbmRlbnQgb24gQ09ORklHX01N
VS4iDQo+IA0KPiBJIHJlYWQgdGhpcyBhcyB0aGVyZSBtaWdodCBiZSBNUFUgc3lzdGVtIHdpdGgg
U01NVSBpbiBkZXZlbG9wbWVudC4gV2hhdCB5b3Ugd2FudCB0byBleHBsYWluIGlzIHdoeSB3ZSBj
YW4ndCBsZXQgdGhlIGRldmVsb3BwZXIgdG8gc2VsZWN0IHRoZSBTTU1VIGRyaXZlciBvbiBhbiBN
UFUgc3lzdGVtLg0KPiANCj4gRnJvbSBteSB1bmRlcnN0YW5kaW5nIHRoaXMgaXMgYmVjYXVzZSB0
aGUgZHJpdmVycyBhcmUgZXhwZWN0aW5nIHRvIHVzZSB0aGUgcGFnZS10YWJsZXMgYW5kIHRoZSBj
b25jZXB0IGRvZXNuJ3QgZXhpc3QgaW4gdGhlIE1QVSBzeXN0ZW0uIFNvIHRoZSBkcml2ZXJzIGFy
ZSBub3QgcmVhZHkgZm9yIHRoZSBNUFUuDQoNCkkgYWdyZWUuDQoNCj4gDQo+Pj4gDQo+Pj4gQWxz
bywgSSBhbSBub3QgZW50aXJlbHkgY29udmluY2VkIHRoYXQgYW55dGhpbmcgaW4gcGFzc3Rocm91
Z2ggd291bGQgcHJvcGVybHkgd29yayB3aXRoIE1QVS4gQXQgbGVhc3Qgbm9uZSBvZiB0aGUgSU9N
TVUgZHJpdmVycyBhcmUuIFNvIEkgd291bGQgY29uc2lkZXIgdG8gY29tcGxldGVseSBkaXNhYmxl
IEhBU19QQVNTVEhST1VHSC4NCj4+IEkgYWdyZWUsIGRvIHlvdSB0aGluayBhZGRpbmcgYmVsb3cg
YWRkaXRpb24gZGlmZiB0byB0aGlzIHBhdGNoIG1ha2VzIHNlbnNlIHRvIHlvdT8NCj4gDQo+IEkg
dGhpbmsgaXQgc2hvdWxkIGJlIGEgcmVwbGFjZW1lbnQgYmVjYXVzZSBub25lIG9mIHRoZSBJT01N
VSBkcml2ZXJzIHdvcmtzIGZvciB0aGUgTVBVLiBTbyBJIHdvdWxkIHJhdGhlciBwcmVmZXIgaWYg
d2UgYXZvaWQgYWRkaW5nICJkZXBlbmRzIG9uIiBvbiBhbGwgb2YgdGhlbSAoZXZlbiBpZiB0aGVy
ZSBhcmUgb25seSAzKSBmb3Igbm93Lg0KDQpJIGFtIGEgYml0IGNvbmZ1c2VkLCBJIHJlYWQgeW91
ciBhYm92ZSBleHBsYW5hdGlvbiB0byB0aGUgY29tbWl0IG1lc3NhZ2UgYXMgeW91DQphZ3JlZSB3
aXRoIHRoZSBpZGVhIHRoYXQgbWFraW5nIFNNTVUgZHJpdmVyIG5vdCBzZWxlY3RhYmxlIGJ5IE1Q
VSBzeXN0ZW0uIElmIHdlDQpyZXBsYWNlIHRoaXMgd2l0aCDigJxzZWxlY3QgSEFTX1BBU1NUSFJP
VUdIIGlmIE1NVeKAnSwgdGhlIFNNTVUgZHJpdmVyIHdpbGwgYmUNCnNlbGVjdGFibGUgYnkgTVBV
IHN5c3RlbS4NCg0KQnV0Li4uDQoNCg0KPiANCj4+IElmIHNvIEkgZ3Vlc3Mgd291bGQgYWxzbyBu
ZWVkIHRvIG1lbnRpb24gdGhpcyBpbiBjb21taXQgbWVzc2FnZS4NCj4gDQo+IERpZCB5b3UgY29u
ZmlybSB0aGF0IFhlbiBNUFUgc3RpbGwgYnVpbGQgd2l0aG91dCBIQVNfUEFTU1RIUk9VR0g/DQoN
CuKApnRoaXMgaXMgYSBnb29kIGNhdGNoLCBubyBNUFUgaXMgbm90IGJ1aWxkYWJsZSB3aXRob3V0
IEhBU19QQVNTVEhST1VHSCwgd2UNCndpbGwgaGF2ZToNCg0KYGBgDQpJbiBmaWxlIGluY2x1ZGVk
IGZyb20gLi9pbmNsdWRlL3hlbi9zY2hlZC5oOjEyLA0KZnJvbSAuL2luY2x1ZGUveGVuL2lvY2Fw
Lmg6MTAsDQpmcm9tIGFyY2gvYXJtL3AybS5jOjM6DQphcmNoL2FybS9wMm0uYzogSW4gZnVuY3Rp
b24gJ3AybV9zZXRfd2F5X2ZsdXNoJzoNCi4vaW5jbHVkZS94ZW4vaW9tbXUuaDozNjY6NDA6IGVy
cm9yOiAnc3RydWN0IGRvbWFpbicgaGFzIG5vIG1lbWJlciBuYW1lZCAnaW9tbXUnDQozNjYgfCAj
ZGVmaW5lIGRvbV9pb21tdShkKSAoJihkKS0+aW9tbXUpDQp8IF5+DQouL2luY2x1ZGUveGVuL2lv
bW11Lmg6MzcxOjM2OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ2RvbV9pb21tdScNCjM3
MSB8ICNkZWZpbmUgaW9tbXVfdXNlX2hhcF9wdChkKSAoZG9tX2lvbW11KGQpLT5oYXBfcHRfc2hh
cmUpDQp8IF5+fn5+fn5+fg0KYXJjaC9hcm0vcDJtLmM6NjE3OjEwOiBub3RlOiBpbiBleHBhbnNp
b24gb2YgbWFjcm8gJ2lvbW11X3VzZV9oYXBfcHQnDQo2MTcgfCBpZiAoIGlvbW11X3VzZV9oYXBf
cHQoY3VycmVudC0+ZG9tYWluKSApDQp8IF5+fn5+fn5+fn5+fn5+fn4NCkluIGZpbGUgaW5jbHVk
ZWQgZnJvbSAuL2luY2x1ZGUveGVuL3NjaGVkLmg6MTIsDQpmcm9tIC4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vZ3JhbnRfdGFibGUuaDo3LA0KZnJvbSAuL2luY2x1ZGUveGVuL2dyYW50X3RhYmxlLmg6
MjksDQpmcm9tIGFyY2gvYXJtL2RvbWFpbi5jOjQ6DQphcmNoL2FybS9kb21haW4uYzogSW4gZnVu
Y3Rpb24gJ2FyY2hfZG9tYWluX2NyZWF0aW9uX2ZpbmlzaGVkJzoNCi4vaW5jbHVkZS94ZW4vaW9t
bXUuaDozNjY6NDA6IGVycm9yOiAnc3RydWN0IGRvbWFpbicgaGFzIG5vIG1lbWJlciBuYW1lZCAn
aW9tbXUnDQozNjYgfCAjZGVmaW5lIGRvbV9pb21tdShkKSAoJihkKS0+aW9tbXUpDQp8IF5+DQou
L2luY2x1ZGUveGVuL2lvbW11Lmg6MzcxOjM2OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g
J2RvbV9pb21tdScNCjM3MSB8ICNkZWZpbmUgaW9tbXVfdXNlX2hhcF9wdChkKSAoZG9tX2lvbW11
KGQpLT5oYXBfcHRfc2hhcmUpDQp8IF5+fn5+fn5+fg0KYXJjaC9hcm0vZG9tYWluLmM6ODgwOjEx
OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ2lvbW11X3VzZV9oYXBfcHQnDQo4ODAgfCBp
ZiAoICFpb21tdV91c2VfaGFwX3B0KGQpICkNCnwgXn5+fn5+fn5+fn5+fn5+fg0KQ0MgYXJjaC9h
cm0vc2h1dGRvd24ubw0KQ0MgbGliL3N0cmxlbi5vDQpDQyBhcmNoL2FybS9zbXAubw0KQ0MgYXJj
aC9hcm0vc21wYm9vdC5vDQpDQyBjb21tb24veG1hbGxvY190bHNmLm8NCkNDIGxpYi9zdHJuY2Fz
ZWNtcC5vDQptYWtlWzJdOiAqKiogW1J1bGVzLm1rOjI0NzogYXJjaC9hcm0vcDJtLm9dIEVycm9y
IDENCm1ha2VbMl06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uDQpgYGANCg0K
S2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGll
biBHcmFsbA0KDQoNCg==

