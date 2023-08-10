Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C967770E8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 09:04:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581831.911254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTziD-0004ZQ-2b; Thu, 10 Aug 2023 07:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581831.911254; Thu, 10 Aug 2023 07:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTziC-0004X4-W9; Thu, 10 Aug 2023 07:04:00 +0000
Received: by outflank-mailman (input) for mailman id 581831;
 Thu, 10 Aug 2023 07:03:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCzd=D3=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qTziB-0004Wy-Km
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 07:03:59 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cd4f256-374c-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 09:03:47 +0200 (CEST)
Received: from DUZPR01CA0080.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::9) by AS2PR08MB9074.eurprd08.prod.outlook.com
 (2603:10a6:20b:5fc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 07:03:51 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46a:cafe::f2) by DUZPR01CA0080.outlook.office365.com
 (2603:10a6:10:46a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 07:03:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Thu, 10 Aug 2023 07:03:51 +0000
Received: ("Tessian outbound f5de790fcf89:v145");
 Thu, 10 Aug 2023 07:03:51 +0000
Received: from e2dff860498e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 616B723D-C73C-4945-AC2A-9676F1961407.1; 
 Thu, 10 Aug 2023 07:03:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e2dff860498e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Aug 2023 07:03:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6620.eurprd08.prod.outlook.com (2603:10a6:10:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Thu, 10 Aug
 2023 07:03:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 07:03:37 +0000
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
X-Inumbo-ID: 0cd4f256-374c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvrWNyjbDpTmZnf0vMth/aapfAQuIjJ3bnmuNzS6s7s=;
 b=ZaHwD+I2aLK/WTynV/c1W/Fr6+0C6NyUyjfbmTxA1ygr4Fv5gyCLxCO6f3YXKlEGtB4MtAW9dgfStoqNeyZnqbFONP1LlrDf30TY7ksbY7yKVXwAU6n4rKUXAxhdFCf1IB+RpOyHPqH2GbPb596ZVJf9d1QMYFWcLDixexK7tto=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1dbbf9236ecb5e2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFEoPCioU7bzNWFE7cD+VB14kUd4zNXkj3+3nyfH/Qjx2QZW26HNcCKbnp1q2KmsYM3MZCz/fMthbaOCYF1FgaDj5VVdKdHaNsVjIHP0Qjuof3CpCn55PXLDcqz9HqeXqObhvmKmk6LCMVzQWjfvREJ6E8T+7Gen8U7C02giKfASKKdiiqhO808JS/f2D9258YxHBfPpQDgKK0AzmgWtI7cj4qAhpwQMKk+p1JS+w9VMOuyZ70N/ogIvCi4j8NU4J+p+t2pjEckYa1JxIM3tt9yMjENHJrDt9d2vdTTAM4d9iIqfsAkfYmck5660lkL+JoSF0mDmILxo9oZdgMClYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvrWNyjbDpTmZnf0vMth/aapfAQuIjJ3bnmuNzS6s7s=;
 b=CNEHI2ttBmIJW1tnpL11OeO33bdUhSisF4HMJSkaRlmO6UwHfrPCIyAvF0SbPk/bndVDcJLhzGPwcea5U/3JaS2eMjgzBlJliqoOlP6L2XHcrzaBLj/5oosRdwhmUD+/2Zftswe0C3SCB9CKPLW9SX79fGztcIDoc4kIp+Gv/tg6aQpcYdPAY4eT69yRGvcmxqKRbDUollu1IkMCUwyP/FjnE3rUcLpRM+1Dq8PdCJwJeQI5pVHntyNitOB6G8rOX6BMFGhhl0B3WMSRu5xJwjiCFNmm+s+a9Nv65CXs4olajnpWlQrv/7rq3aVA6HN5UyojDVI7aYgnoWEqNDk5ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvrWNyjbDpTmZnf0vMth/aapfAQuIjJ3bnmuNzS6s7s=;
 b=ZaHwD+I2aLK/WTynV/c1W/Fr6+0C6NyUyjfbmTxA1ygr4Fv5gyCLxCO6f3YXKlEGtB4MtAW9dgfStoqNeyZnqbFONP1LlrDf30TY7ksbY7yKVXwAU6n4rKUXAxhdFCf1IB+RpOyHPqH2GbPb596ZVJf9d1QMYFWcLDixexK7tto=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v4 03/13] xen/arm64: prepare for moving MMU related code
 from head.S
Thread-Topic: [PATCH v4 03/13] xen/arm64: prepare for moving MMU related code
 from head.S
Thread-Index: AQHZxCqG6oYnCgdHhkmb5cGeqRWv6K/h7S6AgAE7/YA=
Date: Thu, 10 Aug 2023 07:03:36 +0000
Message-ID: <5F1FD746-ECC0-4C46-B946-E86E7DB6FAFE@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-4-Henry.Wang@arm.com>
 <e3bae060-a78c-44ad-a79f-3faf998279b0@xen.org>
In-Reply-To: <e3bae060-a78c-44ad-a79f-3faf998279b0@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB6620:EE_|DBAEUR03FT051:EE_|AS2PR08MB9074:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f55b1cf-2a2f-4772-55fc-08db996ff3bb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /HGGNC7KbemEG9OUuTo8xhAwFdC3/epSF4SwvCxOePgA9Ad1ozPrx0U/Gjc3ASx74gBQ8ArC0Z2eZqIBAR2XWfWoePQHBUkxP06HGlOvDkXDQVGqqN9OtwZJMMwjGfFaRKXXCV6sYA/11++qunVcvQQNY79JgNoBqZPDEWcNUqEbMIeV52LFp2lsUD5n268rIl2uqH8kEfnfTNPW4D5tBydGUwJE2DRcHfGQ+JTubkVQkabcNMZTlutyGNawhepidi9VxRkzKWt5ILucm+lb5HlC/MDTcTGJ21XrDsf+5JJbhF1M05Kxfa18YkDkxRCHZSFMIBrHFqtFmGON6YDyonaEE07rNW6yWAE56wngdMjv47iw+BOU+MgQvBn/qjdUZTcU13NSmR//KZJKqS3v7OArh4PGz4okmRnoGjY7nGvNkqkTBHrCAMiBWpy0Sa6440LLJH2V2hMd7+luyER/OIEmg/dCg+qt9iswL50Onp88hezuuieUpsI6dIFu6OaaFKOyUdAVD8GHIwjOCeLWJMt2PTzwdSIrphUJKwvCS964gnpmuNP2dTk/WIn+3iRDpm4sewM5y3FIFW/Rr1WfcMcQs2ztqk39DXAUdoi0EpD8LxHggKlvuzWhmUoCjumRXT5X5kGcAOzNmk9GEVeTXQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(1800799006)(186006)(451199021)(83380400001)(478600001)(122000001)(2616005)(66899021)(6512007)(38070700005)(6506007)(53546011)(26005)(66476007)(76116006)(91956017)(66556008)(66946007)(8676002)(66446008)(64756008)(4326008)(2906002)(316002)(6916009)(6486002)(71200400001)(38100700002)(36756003)(54906003)(41300700001)(8936002)(33656002)(86362001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B62A891F5FDFD4084FA4E075B610FB3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6620
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a03bd32a-7512-4b97-fbb8-08db996feb37
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kWJDWk6iVH6gpLhoBdCnztCLfcxwRo85ygXMHbumFESrcIEToC08fm8V7LeY0kE3IgvNdXxZpQ1kday7A+ouKLcDwsfiyJ43G48QHsQDZSS3Fipa6u5jyR1dFDHw7ivzdugxlW6Yc0wU/1hbKd1AHUY+MBT1UDq2yuJhbW79Vlh70A/XSLJuZ8Jm63zUxHJi1lM+TQPqalHub/cJHwvulwQkw//keme9KyJqEXs27osuzovDLaY04oJ6AltEHNI/yhOl0nIi4/Z0XEtQbkJs6dQqiNoDKenWuRnuxQTmt3EbfE4Eq67WQwqwQYPj4567jFf6TN1mza/PycAyairEDb1uZW3Cycr8JueqN3VtyEhkCkWagQwDW/ZiorHyDXoswzkGmMQJI6kX3FMvdHV6Uuo5f1CJrv6l4Exy3onOI0Txjv9mV9Sr/9b4V4RifiCZnvBltrpoVAIqWfS9rusryGX/7zYNqtSJjeaG9xnUuQzsWAROdc6wc7GK5qlnVPYk4VlVg1Es0FqS/RCxgj8meEgakEzIQwrX8HBVCGStycXGk7Vp5uOBAx7onZlxx2RhZFEt4zMng2gDXZuSzPGpH9zFwQd4GY5pd733va/iywGrod/7h7+xd5LrXbgHRM2/kzYsHjjl7u3bk6CbeCneWErJGB2sHC7H74UVrpbFZdhnIiQtoKnk2u0L4fXLh8HDXXPpN7F6pVvbxOqUPrau8tQ6tOTKi+oc3ckDAAovZso=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(82310400008)(451199021)(1800799006)(186006)(40470700004)(36840700001)(46966006)(86362001)(478600001)(83380400001)(2906002)(66899021)(40480700001)(2616005)(54906003)(40460700003)(36756003)(36860700001)(6862004)(8936002)(82740400003)(6506007)(26005)(53546011)(316002)(8676002)(5660300002)(33656002)(6512007)(41300700001)(81166007)(6486002)(47076005)(4326008)(356005)(70206006)(70586007)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:03:51.2461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f55b1cf-2a2f-4772-55fc-08db996ff3bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9074

SGkgSnVsaWVuLA0KDQo+IE9uIEF1ZyA5LCAyMDIzLCBhdCAyMDoxMiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBIZW5yeSwNCj4gDQo+IE9uIDAxLzA4LzIw
MjMgMDQ6NDQsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+PiBGcm9tOiBXZWkgQ2hlbiA8d2VpLmNoZW5A
YXJtLmNvbT4NCj4+IFdlIHdhbnQgdG8gcmV1c2UgaGVhZC5TIGZvciBNUFUgc3lzdGVtcywgYnV0
IHRoZXJlIGFyZSBzb21lDQo+PiBjb2RlIGFyZSBpbXBsZW1lbnRlZCBmb3IgTU1VIHN5c3RlbXMg
b25seS4gV2Ugd2lsbCBtb3ZlIHN1Y2gNCj4+IGNvZGUgdG8gYW5vdGhlciBNTVUgc3BlY2lmaWMg
ZmlsZS4gQnV0IGJlZm9yZSB0aGF0IHdlIHdpbGwNCj4+IGRvIHNvbWUgaW5kZW50YXRpb25zIGZp
eCBpbiB0aGlzIHBhdGNoIHRvIG1ha2UgdGhlbSBiZSBlYXNpZXINCj4+IGZvciByZXZpZXdpbmc6
DQo+PiAxLiBGaXggdGhlIGluZGVudGF0aW9ucyBhbmQgaW5jb3JyZWN0IHN0eWxlIG9mIGNvZGUg
Y29tbWVudHMuDQo+PiAyLiBGaXggdGhlIGluZGVudGF0aW9ucyBmb3IgLnRleHQuaGVhZGVyIHNl
Y3Rpb24uDQo+PiAzLiBSZW5hbWUgcHV0cygpIHRvIGFzbV9wdXRzKCkgZm9yIGdsb2JhbCBleHBv
cnQNCj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPj4gU2ln
bmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IA0KPiBXaXRoIG9uZSBy
ZW1hcmsgYmVsb3c6DQo+IA0KPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1h
em9uLmNvbT4NCg0KVGhhbmtzISBJIGhhdmUgdGFrZW4gdGhpcyB0YWcgd2l0aC4uLg0KDQo+IA0K
Pj4gDQo+PiAgLS8qIFByaW50IGVhcmx5IGRlYnVnIG1lc3NhZ2VzLg0KPj4gKy8qDQo+PiArICog
UHJpbnQgZWFybHkgZGVidWcgbWVzc2FnZXMuDQo+PiArICogTm90ZTogVGhpcyBmdW5jdGlvbiBp
cyBvbmx5IHN1cHBvc2VkIHRvIGJlIGNhbGxlZCBmcm9tIGFzc2VtYmx5Lg0KPiANCj4gSSByZWFs
aXplIHRoZSB3b3JkaW5nIGlzIGp1c3QgYSBjb3B5IG9mIHdoYXQgSSB3cm90ZSBlYXJsaWVyIG9u
LiBCdXQgSSB3b3VsZCB1c2UgJ211c3QnIGFzIHRoaXMgaXMgYSBzdHJvbmdlciB0aGFuICdpcyBz
dXBwb3NlZCB0bycuDQoNCuKApnRoaXMgZml4ZWQgbG9jYWxseS4NCg0KPiANCj4gVGhpcyBjYW4g
YmUgZGVhbHQgb24gY29tbWl0IGlmIHRoZXJlIGlzIG5vdGhpbmcgZWxzZSB0byBjaGFuZ2UuDQoN
CkVpdGhlciB3YXkgd29ya3MgZm9yIG1lLCBtYXliZSB5b3UgY2FuIGFkZCB0aGlzIHBhdGNoIHRv
IHlvdXIgcXVldWUNCmZvciB5b3VyIG5leHQgcm91bmQgb2YgY29tbWl0dGluZy4gSWYgSSBkb27i
gJl0IHNlZSB0aGlzIHBhdGNoIGJlaW5nIGNvbW1pdHRlZA0KYnkgdGhlIHRpbWUgd2hlbiBJIHNl
bmQgdjUsIEkgd2lsbCBrZWVwIHRoaXMgcGF0Y2ggaW4gdGhlIHY1IHNlcmllcyBhbmQgc2VuZA0K
aXQgd2l0aCB5b3VyIFJldmlld2VkLWJ5IHRhZy4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0K
PiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQoNCg==

