Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625646E1E43
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 10:29:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521041.809302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnEoE-0006VS-EF; Fri, 14 Apr 2023 08:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521041.809302; Fri, 14 Apr 2023 08:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnEoE-0006St-BQ; Fri, 14 Apr 2023 08:29:30 +0000
Received: by outflank-mailman (input) for mailman id 521041;
 Fri, 14 Apr 2023 08:29:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tlWx=AF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pnEoC-0006Sn-RU
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 08:29:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 779515b0-da9e-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 10:29:26 +0200 (CEST)
Received: from AS8P251CA0021.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::18)
 by DB9PR08MB6747.eurprd08.prod.outlook.com (2603:10a6:10:26e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 08:29:24 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::d5) by AS8P251CA0021.outlook.office365.com
 (2603:10a6:20b:2f2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.33 via Frontend
 Transport; Fri, 14 Apr 2023 08:29:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.10 via Frontend Transport; Fri, 14 Apr 2023 08:29:24 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Fri, 14 Apr 2023 08:29:23 +0000
Received: from 637f994ace9a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FB9D403E-7790-49E2-BBC3-657557A7E860.1; 
 Fri, 14 Apr 2023 08:29:16 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 637f994ace9a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Apr 2023 08:29:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB10366.eurprd08.prod.outlook.com (2603:10a6:10:40a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 08:29:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 08:29:09 +0000
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
X-Inumbo-ID: 779515b0-da9e-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5KpCr7vPoauzdSPAbufVUBQVHs8SNd1pw2IL59R4QU=;
 b=FAozWIco6QGXzWntBUnO4WKiBWOgwJwA4MWYhHb4W8P71Abxh8rbKTL6YT4LSMbx3OB92VFjsiXGW9sUkSk0ZPKiWdkcgvGFn/ju9J4/FLxXjzEeAvI3GdBvu2FPbOF+/g0eimHipQE/Pw2lcZ2gqikSvn8kcC1Wz2YQ5SQVvz8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: af4b43025101a2e4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRt15dowCb6DVE7BlkGaMCGJ06VCHQFi7Lx5ta2xrUGT15Km38+6qcB0USQbKgGz2kqr7CQuce3jB/dyokAr2I/9VyasI3TPgB+yj/6qxBFFRiDHSy+kALTLiDSt7a/cp4zxZIeN3Q//aTJZRo9iXxD3SSRgSZXDqGxhCY/VNMzkPiJyt9cfr0vvgDzAfd3X+JXtYzy2USUFdxKtu7jDh++wWDQ5VMP2NPWY2RaGfLxXtXqhKPWaPpyz15nXrY2sQ7YQbzmoO+4LnHnALs8AMwo/6rusEpN4mmv9dW3n7v6t/0BC9KA/Vx5eGYFCgpp+V17xnJEr+cSXiPMBrNy8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5KpCr7vPoauzdSPAbufVUBQVHs8SNd1pw2IL59R4QU=;
 b=CWxEd6l6Ys9G2yseBI4C8Q7zPyLGs8DR5bHcXVB9quU1aMr/F+H+c18Cr5YZWRDiHfW6YSi8SRpL1s1ljbSC/NPXmxIzOrta00iB6uuoggemsqXPmx5NINqeCBtNf8iGXur2JtnvxjtQ+wPN7CeXLF93rO2nFM3c+WJ8XWR/ldVPGyfzKI47P693eOC3rJAYjqjEBxZgG5eBarZMyN9Yiq2wB0LHydyf6ZTzp8gxKZ8BtzboNTnmrmyb3znQ7EeIW+D5UJi7/MR6ZeadUz8OQ0CsovcICtpaF4eNPY6kkBvGvsmv/Z598BGpxoyVTny91PrOOwAZ/cMHc4vRw536OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5KpCr7vPoauzdSPAbufVUBQVHs8SNd1pw2IL59R4QU=;
 b=FAozWIco6QGXzWntBUnO4WKiBWOgwJwA4MWYhHb4W8P71Abxh8rbKTL6YT4LSMbx3OB92VFjsiXGW9sUkSk0ZPKiWdkcgvGFn/ju9J4/FLxXjzEeAvI3GdBvu2FPbOF+/g0eimHipQE/Pw2lcZ2gqikSvn8kcC1Wz2YQ5SQVvz8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Julien Grall <julien@xen.org>, Marc Bonnici <Marc.Bonnici@arm.com>, Achin
 Gupta <Achin.Gupta@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v8 11/22] xen/arm: ffa: send guest events to Secure
 Partitions
Thread-Topic: [XEN PATCH v8 11/22] xen/arm: ffa: send guest events to Secure
 Partitions
Thread-Index: AQHZbdfNbAtCLjIaYEG04chauCctrq8pOrmAgAE9V4CAAAKNgA==
Date: Fri, 14 Apr 2023 08:29:06 +0000
Message-ID: <9732C6EB-3346-408D-B267-9CCCE081B661@arm.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-12-jens.wiklander@linaro.org>
 <d354fee8-4d02-fe5f-1ff1-15f96efeb13f@xen.org>
 <CAHUa44FM5yQ+e=ruPhTxFttGTE1HQvruX-7XAiqVnW4b-mQgcw@mail.gmail.com>
In-Reply-To:
 <CAHUa44FM5yQ+e=ruPhTxFttGTE1HQvruX-7XAiqVnW4b-mQgcw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB10366:EE_|AM7EUR03FT063:EE_|DB9PR08MB6747:EE_
X-MS-Office365-Filtering-Correlation-Id: 79df069b-04d3-4e42-6f06-08db3cc25a88
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FcRLf50Y/01/r/9qeW7r4ntaZrDOFFoDFw1jYznHkQ93cblxDcbEYuGn2XYhgwmW+MySIWzSZt2ruPE89Z8qEyVgpU7GYXvHdIDR6lug3WCD6ZU2Ga7eOhXXKnUuDnuIIPIMliqgNiSrORYYf+OY+UkSNo9SqsCagsS+SlGyHhcQWTEyGvXd1MYN9EgjUphw8llEEHpQbvR1OrQtn3YVUdT1sbThZzzUJ7snVwHvIsMkT1enx4zAkUk5aT1xNBfRnOslL20aJ+HmEtWNGZh1gRzKu1/AQ1ZKm1KEeFnyZ9YFzC4rBx9A+Nv0u9u33eXGHOWnqwJoWWrmYeejGKrFWWVFZuasoO95xosxQS+t/s0XSDycK/LJ6QAup9bI0LbPA1C4ig5dbxY1MDUw94unDbWmhVhdS4TCufA0K5hFvDmwHywwus98WnYahFHfybg5+auAUKGW/hTsJHahS9lDKl4Eu90N/C2IiYtCRUHqzzQd1LH/8N3f+VE8Fpta7fFKetW+jy0biflciCenOL7LEOmWw0Q1T0q+mideaOjvokwD3kwdPEjTzOpx9OcRewdxOpuaNXabsus99vWJ0HYmqgIs86xcnQmYS5t9ucewALq00D1X917asKj0Sp1kDi7nnarDmIHziBaLcB+8YmnTKg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199021)(4326008)(316002)(6486002)(6916009)(2906002)(86362001)(2616005)(36756003)(8676002)(8936002)(33656002)(186003)(5660300002)(6506007)(6512007)(53546011)(38100700002)(122000001)(38070700005)(83380400001)(71200400001)(6666004)(41300700001)(54906003)(478600001)(91956017)(76116006)(66446008)(66476007)(66946007)(66556008)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <640B96E36F413347AF23CB1C6598A7E6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10366
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d190ecf-9413-43f0-8930-08db3cc2502e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hc4sryTN767UroML+SB9gIefwmynRbGt7CYaq0F1pyF9qXDqt10n1Y5sMfBioo0VmXnHL6LkFG94FV5aATPLOyhZs+Zw+ZpYm/IZ726XKDngLX4WUUorZm8aV+1ergI1B3JhICJZtN5Qt65byck+fkZFpVj3GEl6iS5jMMd5rc9Ehcr7e+YQ3KwDPE9j+ZR851XWzHBjAHp+haz6cfpaJlFt89KHQPdsPhJwtrgx7L+RjFFLcnmnPNTGcP0ohmLP5Bm1EfuHTuq+9rkA88kM1rKblISapQG4AsujPPmyHiGuoKPp+Bzj56H2xNCs1e2HLtj7+0xqw1/Nl1bmdIdRvL6bSwhZIkx4/CgxbFrIItmOWOl31qJ7J9V+6sb0hT4genCj1yAZqwNalqbKRpL/oDZC1jdMyeAb8lwxb6hwYbV8lYUiVUPrt3REyuiMqq4H9FmnyyCiX36sCKyrem/vPf+qUk5TFPHAAFNH8RbxegTiHbaDDFg/1H1xmX3M/GBPYlamogPYVHGhjcUJlt918Vw89/5sR1LjUlYXdmIUq9/8OIXo1ATNgJ9q9hMGXF7qtPQvDFiihW437mTfbn6z3Ia/Ve0AuvHOhRNr0Dh4GWuYJkZAdkEvE8RryGlsCs7g1YTDcJTZYt3O8C5cwhkIPGiw9eJpCkhKNT+6xk54ytiIfqYcG7EjGdTHxclQ5VFi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(40470700004)(46966006)(36840700001)(107886003)(40460700003)(6512007)(26005)(186003)(6506007)(53546011)(54906003)(40480700001)(33656002)(478600001)(81166007)(356005)(2906002)(8676002)(8936002)(6862004)(36860700001)(83380400001)(41300700001)(336012)(5660300002)(47076005)(2616005)(82310400005)(316002)(4326008)(70206006)(70586007)(82740400003)(86362001)(6486002)(6666004)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 08:29:24.2488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79df069b-04d3-4e42-6f06-08db3cc25a88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6747

SGkgSmVucywNCg0KPiBPbiAxNCBBcHIgMjAyMywgYXQgMTA6MTksIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gVGh1
LCBBcHIgMTMsIDIwMjMgYXQgMzoyNOKAr1BNIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
IHdyb3RlOg0KPj4gDQo+PiBIaSwNCj4+IA0KPj4gT24gMTMvMDQvMjAyMyAwODoxNCwgSmVucyBX
aWtsYW5kZXIgd3JvdGU6DQo+Pj4gK3N0YXRpYyBpbnQzMl90IGZmYV9kaXJlY3RfcmVxX3NlbmRf
dm0odWludDE2X3Qgc3BfaWQsIHVpbnQxNl90IHZtX2lkLA0KPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgbXNnKQ0KPj4+ICt7DQo+Pj4gKyAgICB1aW50
MzJfdCBleHBfcmVzcCA9IEZGQV9NU0dfRkxBR19GUkFNRVdPUks7DQo+Pj4gKyAgICBpbnQzMl90
IHJlczsNCj4+PiArDQo+Pj4gKyAgICBpZiAoIG1zZyA9PSBGRkFfTVNHX1NFTkRfVk1fQ1JFQVRF
RCApDQo+Pj4gKyAgICAgICAgZXhwX3Jlc3AgfD0gRkZBX01TR19SRVNQX1ZNX0NSRUFURUQ7DQo+
Pj4gKyAgICBlbHNlIGlmICggbXNnID09IEZGQV9NU0dfU0VORF9WTV9ERVNUUk9ZRUQgKQ0KPj4+
ICsgICAgICAgIGV4cF9yZXNwIHw9IEZGQV9NU0dfUkVTUF9WTV9ERVNUUk9ZRUQ7DQo+Pj4gKyAg
ICBlbHNlDQo+Pj4gKyAgICAgICAgcmV0dXJuIEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTOw0K
Pj4+ICsNCj4+PiArICAgIGRvIHsNCj4+PiArICAgICAgICBjb25zdCBzdHJ1Y3QgYXJtX3NtY2Nj
XzFfMl9yZWdzIGFyZyA9IHsNCj4+PiArICAgICAgICAgICAgLmEwID0gRkZBX01TR19TRU5EX0RJ
UkVDVF9SRVFfMzIsDQo+Pj4gKyAgICAgICAgICAgIC5hMSA9IHNwX2lkLA0KPj4+ICsgICAgICAg
ICAgICAuYTIgPSBGRkFfTVNHX0ZMQUdfRlJBTUVXT1JLIHwgbXNnLA0KPj4+ICsgICAgICAgICAg
ICAuYTUgPSB2bV9pZCwNCj4+PiArICAgICAgICB9Ow0KPj4+ICsgICAgICAgIHN0cnVjdCBhcm1f
c21jY2NfMV8yX3JlZ3MgcmVzcDsNCj4+PiArDQo+Pj4gKyAgICAgICAgYXJtX3NtY2NjXzFfMl9z
bWMoJmFyZywgJnJlc3ApOw0KPj4+ICsgICAgICAgIGlmICggcmVzcC5hMCAhPSBGRkFfTVNHX1NF
TkRfRElSRUNUX1JFU1BfMzIgfHwgcmVzcC5hMiAhPSBleHBfcmVzcCApDQo+Pj4gKyAgICAgICAg
ew0KPj4+ICsgICAgICAgICAgICAvKg0KPj4+ICsgICAgICAgICAgICAgKiBUaGlzIGlzIGFuIGlu
dmFsaWQgcmVzcG9uc2UsIGxpa2VseSBkdWUgdG8gc29tZSBlcnJvciBpbiB0aGUNCj4+PiArICAg
ICAgICAgICAgICogaW1wbGVtZW50YXRpb24gb2YgdGhlIEFCSS4NCj4+PiArICAgICAgICAgICAg
ICovDQo+Pj4gKyAgICAgICAgICAgIHJldHVybiBGRkFfUkVUX0lOVkFMSURfUEFSQU1FVEVSUzsN
Cj4+PiArICAgICAgICB9DQo+Pj4gKyAgICAgICAgcmVzID0gcmVzcC5hMzsNCj4+PiArICAgIH0g
d2hpbGUgKCByZXMgPT0gRkZBX1JFVF9JTlRFUlJVUFRFRCB8fCByZXMgPT0gRkZBX1JFVF9SRVRS
WSApOw0KPj4gDQo+PiBUaGlzIGxvb3Agc2VlbXMgcG90ZW50aWFsbHkgdW5ib3VuZGVkIHRvIG1l
LiBDYW4geW91IGFkZCBhIGNvbW1lbnQNCj4+IGV4cGxhaW5pbmcgd2h5IHRoaXMgaXMgZmluZT8N
Cj4gDQo+IEluIHRoZSBGRi1BIDEuMSBzcGVjaWZpY2F0aW9uDQo+IChodHRwczovL2RldmVsb3Bl
ci5hcm0uY29tL2RvY3VtZW50YXRpb24vZGVuMDA3Ny9lLz9sYW5nPWVuKSBUYWJsZQ0KPiAxOC4y
NiBhdCBwYWdlIDMzMCBpdCBzYXlzIHRoYXQgRkZBX1JFVF9JTlRFUlJVUFRFRCBhbmQgRkZBX1JF
VF9SRVRSWQ0KPiBzaG91bGQgYmUgaGFuZGxlZCBpbiB0aGlzIHdheS4gV2hlbiBsb29raW5nIGF0
IHRoaXMgZnJvbSB0aGUNCj4gaHlwZXJ2aXNvcidzIHBvaW50IG9mIHZpZXcgaXQgaXMgdHJvdWJs
ZXNvbWUgc2luY2UgdGhlcmUgaXNuJ3QgYW55DQo+IGd1YXJhbnRlZSB0aGF0IHdlJ3JlIHByb2dy
ZXNzaW5nLg0KPiANCj4gV2Ugc2hvdWxkIGJlIGFibGUgdG8gcnVsZSBvdXQgRkZBX1JFVF9JTlRF
UlJVUFRFRCBzaW5jZSBub24tc2VjdXJlDQo+IGludGVycnVwdHMgc2hvdWxkIGJlIG1hc2tlZCBh
dCB0aGlzIHBvaW50LiBJJ20gbm90IHN1cmUgaWYNCj4gRkZBX1JFVF9SRVRSWSBjYW4gYmUgYXZv
aWRlZCBlbnRpcmVseSwgYnV0IHdlIHNob3VsZCBiZSBhYmxlIHRvIHB1dCBhDQo+IGxpbWl0IG9u
IGhvdyBtYW55IHRpbWVzIHdlJ3JlIHByZXBhcmVkIHRvIHJldHJ5Lg0KDQpUaGUgZmFjdCB0aGF0
IGludGVycnVwdHMgYXJlIG1hc2tlZCBpbiBYZW4gZG9lcyBub3QgbWVhbiB0aGV5IHdpbGwgYmUg
aW4gc2VjdXJlLg0KSW4gZmFjdCB3aGF0IHdlIHNob3VsZCBkbyB3aGVuIElOVEVSUlVQVEVEIGlz
IHJlY2VpdmVkIGlzIHNvbWV0aGluZyB3ZSBoYXZlDQp0byBjbGVhciB1cCBidXQgd2Ugc2hvdWxk
IHVubWFzayBpbnRlcnJ1cHQgdG8gcHJvY2VzcyB0aGVtIGluIFhlbiBiZWZvcmUgcmV0cnlpbmcg
SSB0aGluay4NCg0KPiANCj4gSG93IGFib3V0IHNldHRpbmcgYSBsaW1pdCBvZiBtYXggMTAgcmV0
cmllcyBhbmQgdHJlYXRpbmcNCj4gRkZBX1JFVF9JTlRFUlJVUFRFRCBhcyBhbiBlcnJvcj8gT3Ig
aXMgaXQgYmV0dGVyIHRvIG5vdCBsb29wIGF0IGFsbA0KPiBhbmQgdHJlYXQgYWxsIGJ1dCBGRkFf
UkVUX09LIGFzIGVycm9ycz8gV2hhdCBkbyBvdGhlcnMgdGhpbms/DQoNCkkgd291bGQgc3VnZ2Vz
dCB0byBkbyBhIG1heCByZXRyeSBmb3IgYm90aCBjYXNlcyBhbmQgYWRkIGEgVE9ETyBpbiB0aGUg
Y29kZS4NCldlIHdpbGwgbmVlZCB0byBkZWZpbmUgYSBnZW5lcmljIHdheSB0byBoYW5kbGUgdGhv
c2UgY2FzZXMgYnV0IGF0IHRoaXMgc3RhZ2UNCklOVEVSUlVQVEVEIHNob3VsZCBiZSBjb25zaWRl
cmVkIFRPRE8uDQpSRVRSWSB3aWxsIHByb2JhYmx5IHN0YXkgd2l0aCBhIGxpbWl0IGhlcmUsIGlu
IHRoZSBjYXNlIG9mIGEgZ3Vlc3QgbWVzc2FnZSBib3RoDQpvZiB0aG9zZSBwb3NzaWJpbGl0aWVz
IGNvdWxkIGp1c3QgYmUgcmV0dXJuZWQgdG8gdGhlIGd1ZXN0Lg0KDQoNCkRvIHlvdSBhZ3JlZSA/
DQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gVGhhbmtzLA0KPiBKZW5zDQo+IA0KPj4gDQo+
Pj4gKw0KPj4+ICsgICAgcmV0dXJuIHJlczsNCj4+PiArfQ0KPj4+ICsNCj4+IA0KPj4gQ2hlZXJz
LA0KPj4gDQo+PiAtLQ0KPj4gSnVsaWVuIEdyYWxsDQoNCg0K

