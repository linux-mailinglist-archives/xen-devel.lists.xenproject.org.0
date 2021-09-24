Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B8F416B09
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 06:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194899.347270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTd3C-00010q-2M; Fri, 24 Sep 2021 04:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194899.347270; Fri, 24 Sep 2021 04:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTd3B-0000yO-VW; Fri, 24 Sep 2021 04:43:05 +0000
Received: by outflank-mailman (input) for mailman id 194899;
 Fri, 24 Sep 2021 04:43:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTd3A-0000yA-PE
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 04:43:04 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::602])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e6246c1-dab2-47f6-8b44-e04de3ba071c;
 Fri, 24 Sep 2021 04:43:03 +0000 (UTC)
Received: from DB7PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:10:52::33)
 by AM6PR08MB3445.eurprd08.prod.outlook.com (2603:10a6:20b:43::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 24 Sep
 2021 04:43:01 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::1b) by DB7PR02CA0020.outlook.office365.com
 (2603:10a6:10:52::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 04:43:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 04:43:01 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Fri, 24 Sep 2021 04:43:00 +0000
Received: from b18ee790f46c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E81CFE4F-46D0-41EB-887A-9F7C157F981F.1; 
 Fri, 24 Sep 2021 04:42:50 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b18ee790f46c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 04:42:50 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBAPR08MB5622.eurprd08.prod.outlook.com (2603:10a6:10:1af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 04:42:49 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 04:42:49 +0000
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
X-Inumbo-ID: 9e6246c1-dab2-47f6-8b44-e04de3ba071c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00S8jcIrVFBN1uvTM84xghtlh7RjwXB42v2XnvIPF7c=;
 b=sSYyRMYy2rgj/viXEr6D5ecS7CgsZT49QaE/fl94zdjSIufpEa5NuObXt2im6Z3mkWwbEOHak66WS9L5iibJWvlykwiYOubWLGXgBjWl+1zNsylLNWp9i7mc7zNzrfp4dDfyDHV+rA8BUCy5ZTNydYrjtHR+QrG4lPShIWkneBk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAjnapZeGk/eal9QCSPtSol+JN/cpq+xf4emWUKkSJs0eyhjkFG7er8EOkGxQqklQ3/YoURdCKVq4lOPVAANatOL7et9Qnz2Jeunj43T2W3OD4RPo9UID2ejg4H53Uwkq1eHLkiF1v/dd0VY8UzppI/DRQxSCyUgpyaFrsScHHk8aXSzOtCREhgFJg6H75h1mdYnhOU8vx1e2/0/iuCMuKb8RQZ6yfWd7P2UuVTk5MT5PTZWIlUYAcunpoF0OapOW5LoJZbpJqLX0+4K2GcIhom8Uq4CB8oIbIPYa7dmybftRuT5svsH0j55eD3kKDpJV4qn/SPl1tNaD73d0z/lig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=00S8jcIrVFBN1uvTM84xghtlh7RjwXB42v2XnvIPF7c=;
 b=F7QI23EDhSjlKUSspSI3qJGVxzzbJWSITbXr5Pmjr3B6aurbVGCwqQSvB9/MrZc+r8kjkPeYIppO0ga/jJWDRoPD6PuZjPQyWxAfOIKoNfDZ0zN+Nx1UhozH4pxh/Y8sBVZ74aX/V1Mm4j3ps8CBnQUr86qQAY8VEdX2ku7bpWChYVBg2vy/PNOSj7oacaMb7wBVhsCpy37NkBtKKQK9u/PXUNSB9rQwCPY80bZNPLjGvPbE9wAwxKkjLV0Yd2NXLNsycAIjRd/yxptHTBBj1CMqCuEUKT5+FQd84uHUe3HS3ZT0bEjSvXkRVeRa2KgRrQ+EoKFmceP6SDEcKF1vag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00S8jcIrVFBN1uvTM84xghtlh7RjwXB42v2XnvIPF7c=;
 b=sSYyRMYy2rgj/viXEr6D5ecS7CgsZT49QaE/fl94zdjSIufpEa5NuObXt2im6Z3mkWwbEOHak66WS9L5iibJWvlykwiYOubWLGXgBjWl+1zNsylLNWp9i7mc7zNzrfp4dDfyDHV+rA8BUCy5ZTNydYrjtHR+QrG4lPShIWkneBk=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 24/37] xen/arm: implement two arch helpers to get memory
 map info
Thread-Topic: [PATCH 24/37] xen/arm: implement two arch helpers to get memory
 map info
Thread-Index: AQHXsHM4IX7m67p9UE2HNfweaKhzBauycKqAgAArlfA=
Date: Fri, 24 Sep 2021 04:42:48 +0000
Message-ID:
 <DB9PR08MB68578A23A896A06B788EC5929EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-25-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231905180.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231905180.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6B792F6B4C29E443A934A2AFFB43AB3A.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4e8291dd-9121-440e-06a4-08d97f15ca18
x-ms-traffictypediagnostic: DBAPR08MB5622:|AM6PR08MB3445:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB344557BE16A67180DA5F0DE19EA49@AM6PR08MB3445.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YXS6r6jU5rzz3sAG/zyu/xwFTezm9k/MciRh3lW9zrRoPV2/IdoaNDec7Rowl3YiXo+P6D/brmLSnWZjyx/sfZdErRVIsXer+PXM2AcWRJDZA/uNg4AP4ldBfltKt4jzSzRtAf0KA1NXrnlFFZL0cloFBI0cJuAw+LnUHcvW53HWN7+62zu7fJK8JZnEZWSawf46HH8A6GbhX3E0MzWVoaC4Q3Pd1373NikB0zC9b0Aod6gaNlLGcC061jnc/HG01rBmYDA6HdkLmHwgxnwnWnz6ivpJrnssx44ZltxaBYimzSe3n2Mjtud62glUZtiG/6z5o/Hwaw+aVU3w7uy+CVCEs78ZK98Y3Lz9tais/D4FGHb2Nhyr1Y6LbiSHL0Jz+8jTPqnCkZ4KmDTtaMnlpup3oAojDrsQJ0Em2rAgulgh+imBLE3gu2cUkdOuQyXjEyfrkbpqFj3+VGPYKmqGbtmXC69nhRYvushbZLM6TVJAWRNAkV2r7EXhjvkOMWgOKhTo7SbdpMBelNl9mQbB7PZZv6atRjoF7YmNBf+Dnz3LgEiDt+8ZPsdh5gZxnFWk4iPcMVXHmjmUdSz13rqGUI1gEDom/v/nKNrat0elpHKFxrlW/tb8esw+G0HQUGCFyxttH3L3QNhlshs5k1dy66tlj9b+wMFei+Zt017PZSxVwSKcSqn4pUXw78ECrNT26woujilGwyd5IFi95PxxDw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(38100700002)(71200400001)(33656002)(6916009)(122000001)(54906003)(2906002)(316002)(4326008)(86362001)(5660300002)(38070700005)(6506007)(8936002)(55016002)(26005)(53546011)(7696005)(186003)(52536014)(8676002)(83380400001)(9686003)(76116006)(64756008)(66946007)(66476007)(66446008)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5622
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bf7cb980-1b4d-43d0-3d13-08d97f15c2e0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9/YBvCU6oKHuMS8r213u2wFioeAEXtqkjz1JmjVFHjzOSjBJyQWqT43H7VG4wa7Mws2yhHDAvHVrVLuSbaXQ3ccKEYttXt85IVg9JPaPZ4NOT7XmakneLvAwX2ZrvDGYax32Am2JspnzK4ltszmPsUkK7+rD8aF0MT8ohY+2XKVvozxo3qGvOHY5kWAHyuRA22pN360K8labJN8pAj+b6O1tnasl07MPS1XBpLS6igX4Z9LeMofk5LeWIddUeEuZUsVUXda9JBKFYErpHMDsNn00meItMMQLQ2h661omwPhI1XJv+iX7sIKfcD649NNsghBGbDgNJRDKtDGiQhu00dbF7rpTbDd/GBwXKQrqbxzJWE9SpXFeMAfD1m9LbmEJFOhZeFh/+QLjbHvLNElPEofcPdjocAzfPkwuoch4tS75Vt7Lp306vsYAqN5B4qK32WrO3pEj11R65+cVcTvLyvMjAkchPDyCQwfk3Tf6Crub5iRJfpFSIfCw+kpfJRpO5kj2xSrnq2xFlkeIUvrQvlETPAAuKsGt/WVtuMnASwH5OKNzRtz+u3LLHFN2g57m7XVlgIndQUMtu1/jg7aak/J6BgVeNswxWBvDZ1WAZm5IYTDkZP5F0U4JXDLvQ/ndaXbuwL0b6m3U5BoJV27XBZVlrIQzfNZPKat4JC/lV4Bn6f5544H+4K3V8H80oGS6nuQwws3zDhZb8cGcuNYhYw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(508600001)(52536014)(356005)(86362001)(5660300002)(82310400003)(81166007)(4326008)(70206006)(336012)(33656002)(7696005)(47076005)(53546011)(2906002)(55016002)(8676002)(6862004)(316002)(54906003)(8936002)(6506007)(9686003)(70586007)(36860700001)(186003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 04:43:01.1168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8291dd-9121-440e-06a4-08d97f15ca18
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3445

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBTZW50OiAyMDIxxOo51MIyNMjVIDEwOjA2
DQo+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZzsgc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVsaWVuQHhlbi5vcmc7
DQo+IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCAyNC8zN10geGVuL2FybTogaW1wbGVtZW50IHR3byBhcmNoIGhlbHBlcnMg
dG8gZ2V0DQo+IG1lbW9yeSBtYXAgaW5mbw0KPiANCj4gT24gVGh1LCAyMyBTZXAgMjAyMSwgV2Vp
IENoZW4gd3JvdGU6DQo+ID4gVGhlc2UgdHdvIGhlbHBlcnMgYXJlIGFyY2hpdGVjdHVyZSBBUElz
IHRoYXQgYXJlIHJlcXVpcmVkIGJ5DQo+ID4gbm9kZXNfY292ZXJfbWVtb3J5Lg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4g
IHhlbi9hcmNoL2FybS9udW1hLmMgfCAxNCArKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9udW1hLmMgYi94ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4gaW5kZXggM2YwODg3MGQ2OS4uMzc1
NWIwMWVmNCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4gKysrIGIv
eGVuL2FyY2gvYXJtL251bWEuYw0KPiA+IEBAIC02NywzICs2NywxNyBAQCB1aW50OF90IF9fbm9k
ZV9kaXN0YW5jZShub2RlaWRfdCBmcm9tLCBub2RlaWRfdCB0bykNCj4gPiAgICAgIHJldHVybiBu
b2RlX2Rpc3RhbmNlX21hcFtmcm9tXVt0b107DQo+ID4gIH0NCj4gPiAgRVhQT1JUX1NZTUJPTChf
X25vZGVfZGlzdGFuY2UpOw0KPiA+ICsNCj4gPiArdWludDMyX3QgX19pbml0IGFyY2hfbWVtaW5m
b19nZXRfbnJfYmFuayh2b2lkKQ0KPiA+ICt7DQo+ID4gKwlyZXR1cm4gYm9vdGluZm8ubWVtLm5y
X2JhbmtzOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtpbnQgX19pbml0IGFyY2hfbWVtaW5mb19nZXRf
cmFtX2JhbmtfcmFuZ2UodWludDMyX3QgYmFuaywNCj4gPiArCXBhZGRyX3QgKnN0YXJ0LCBwYWRk
cl90ICplbmQpDQo+ID4gK3sNCj4gPiArCSpzdGFydCA9IGJvb3RpbmZvLm1lbS5iYW5rW2Jhbmtd
LnN0YXJ0Ow0KPiA+ICsJKmVuZCA9IGJvb3RpbmZvLm1lbS5iYW5rW2JhbmtdLnN0YXJ0ICsgYm9v
dGluZm8ubWVtLmJhbmtbYmFua10uc2l6ZTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiAr
fQ0KPiANCj4gVGhlIHJlc3Qgb2YgdGhlIGZpbGUgaXMgaW5kZW50ZWQgdXNpbmcgc3BhY2VzLCB3
aGlsZSB0aGlzIHBhdGNoIGlzIHVzaW5nDQo+IHRhYnMuDQo+IA0KPiBBbHNvLCBnaXZlbiB0aGUg
aW1wbGVtZW50YXRpb24sIGl0IGxvb2tzIGxpa2UNCj4gYXJjaF9tZW1pbmZvX2dldF9yYW1fYmFu
a19yYW5nZSBzaG91bGQgZWl0aGVyIHJldHVybiB2b2lkIG9yIGJvb2wuDQoNCkkgd2lsbCBmaXgg
dGhlbSBpbiBuZXh0IHZlcnNpb24uDQo=

