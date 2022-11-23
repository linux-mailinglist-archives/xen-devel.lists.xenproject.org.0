Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC83635118
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 08:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447409.703595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxkD2-0007Ci-Kn; Wed, 23 Nov 2022 07:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447409.703595; Wed, 23 Nov 2022 07:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxkD2-0007AH-HS; Wed, 23 Nov 2022 07:30:16 +0000
Received: by outflank-mailman (input) for mailman id 447409;
 Wed, 23 Nov 2022 07:30:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+QIV=3X=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1oxkD1-0007AB-2P
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 07:30:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a537bb77-6b00-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 08:30:05 +0100 (CET)
Received: from AS9PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:20b:46a::35)
 by DB9PR08MB9633.eurprd08.prod.outlook.com (2603:10a6:10:454::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 07:30:07 +0000
Received: from AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::b6) by AS9PR04CA0050.outlook.office365.com
 (2603:10a6:20b:46a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17 via Frontend
 Transport; Wed, 23 Nov 2022 07:30:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT042.mail.protection.outlook.com (100.127.140.209) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 07:30:06 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Wed, 23 Nov 2022 07:30:06 +0000
Received: from c34f26f97d1b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB622778-5187-419C-82E5-82C7200702B1.1; 
 Wed, 23 Nov 2022 07:29:57 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c34f26f97d1b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Nov 2022 07:29:57 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by PAXPR08MB7349.eurprd08.prod.outlook.com (2603:10a6:102:225::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 07:29:52 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f%3]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 07:29:52 +0000
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
X-Inumbo-ID: a537bb77-6b00-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0+yzMfLyTY+gNsbyRQZB9MLCJ1z9Wm5eejJvrqyon4=;
 b=glHREdtWXJGaLqmevVli522vyUL6U+ruLMDgPMK9jSM/EqQEQurgvH0uERQyZRsaxq5OuR7Ubjml+JhVMOikfBx1hyN7eCLtL62oTExIrWGMuSCIlvnXO9XQrdaD7lomJBZkl9Ud7KGusXEfYXaMH63gpHIMqGZdS2oruJIhRjM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cObVkwYXT2Eoghb0er2eCw8k2G1dGF/+OnXER6Lr4RiJ59WUVEh+BjqBxZGRkv67cdQ0DkWg8ZMNS3SJAl4VOw+syCEx9Vu3ZZJBXp+HSXpF+qiT51o4CDQYypV8g+ycjV4BlLVI0LQYJaUYIwV/NKZOZ5f21GEjtJ7NyanvVmmBwenIo0u/T9i09EsFvZ4QSyidI6K1la2JpwoqaFDEyQOGoK+Wxj8lVg1uR8ijmUbW80PEBaf32cpfyiD3urS3jfxktDHqVX/aw0Net34lY7l2Enw9rV8esUa64PCwhLEF8dQQ9RRipUxR/GjZuzy0JNMGBZW2++GDpxf8x1vd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0+yzMfLyTY+gNsbyRQZB9MLCJ1z9Wm5eejJvrqyon4=;
 b=SQ2Fdn2TiesktD9iC6kWIcBo7mn/RQHRhzBI3hfMvFQ4QzbrSAuaIJtW/5l8jd6PiTXAc5PfkF2AvVsUb3nlHaqPLFed8ZIy6yDEdRXT8f6p4HuYsRQAfTFHaD6Ml/DLzsXAHBO5M3WF7qeiEvSt0w5oiozX4ResBRHIqGAlCEREmAKTAfXGANn1otjqf3pzDTiqqlY67gixJvpdRBhGR6mp2BpW/QWDe7Q4/VtJRXPNbb7PeKQf6p8z5WzIYWyDXaX7uB1ZpEG9BONjwoBG6ziDRyHNg/LaHw6CdmOmxZCzY4j27Doy+YvTCI12T/HV926yL/uI7LrXi8diZMPS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0+yzMfLyTY+gNsbyRQZB9MLCJ1z9Wm5eejJvrqyon4=;
 b=glHREdtWXJGaLqmevVli522vyUL6U+ruLMDgPMK9jSM/EqQEQurgvH0uERQyZRsaxq5OuR7Ubjml+JhVMOikfBx1hyN7eCLtL62oTExIrWGMuSCIlvnXO9XQrdaD7lomJBZkl9Ud7KGusXEfYXaMH63gpHIMqGZdS2oruJIhRjM=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <julien@xen.org>
Subject: RE: [PATCH v2] xen/arm: vpl011: Make access to DMACR write-ignore
Thread-Topic: [PATCH v2] xen/arm: vpl011: Make access to DMACR write-ignore
Thread-Index: AQHY/jYHhVkwya4U7kGFhTN8kPwCjK5K3q+AgAAvuICAAQ8v0A==
Date: Wed, 23 Nov 2022 07:29:52 +0000
Message-ID:
 <AS8PR08MB7696F339D76046A5BC2DD603920C9@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20221122054644.1092173-1-jiamei.xie@arm.com>
 <a38b9ebf-c5da-8648-183d-eb5fbb5b22f3@xen.org>
 <1f0d8171-a56e-a7a2-e5c2-0d8d09ee0a1b@amd.com>
In-Reply-To: <1f0d8171-a56e-a7a2-e5c2-0d8d09ee0a1b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 378E34EACE726B48BF5D716C449846CC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|PAXPR08MB7349:EE_|AM7EUR03FT042:EE_|DB9PR08MB9633:EE_
X-MS-Office365-Filtering-Correlation-Id: 56febcdf-9480-442f-3791-08dacd248b65
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qDBLvTmEUvA91zdfUz82Ay807eW9uK7dzgDpFQatRqp+b+54IxHtkQkHoHsxeUSxCTayRiGfNZYq4+dfvID76rTqAMTA9Eu6KBL4y9FMENwNOJFAskFi11gDnj0cD5WvlQw6orXHBih/qmVvYkD/IRVBZBb/bpxdTWu+GnhcqskiecA7IZYvV5v2D863Ua8qe3y6NNBhKai6LC/W/ZwX5W1gG9lZUVdKtmQ3jKLJMPG9Nt2rRFxapL6/Unwc9s0rNIwEvrqhruVRi9SuT9NSvnd7guCtDDqmkgBJqG93Qr2h9NvPQyD+GveoEAz5UJ5OKFvfVQwg+Z8rP4j7u90m9E1zZiKaT+dEojF30kcvJK3vyZ5akYG4SYtlTmsoLoyPPHAGhR1qVDm2E1se/RAdzS5/ToQLOEzZ2l123om2FF9xX6lkC49Azv9NR9gFLAz3nUMUDIjsGHu4KuxScXcs3mtUdLcA0zqp1sem+va5ipzBIIWCfxrb8bSzCXAmEp57ad97iL61R0We7NvsJteWivHGTc2Hi9B6cxSsD8jHa86AOLOYWAOLVXJF1AQmNG1sdRdHR8cdFl21TphoaSRU29qF843g54k7RAAsoRfMxG6i8ST6JDWL+T1AmFBrcU9q1NPExSeJUnyGHw5x+D/mNkekU2EWsq3HqORJgK58aO1TYINyrtTDsu0CLgR5f6Y2lveowJg4XGGO1Pi/Gr+bvvmW3oBfQG/MYibHVAtG2m3xqVrkivjUj460g5tOUKyuxTUEW1kOQfwAQJ32tPVdvQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199015)(38100700002)(83380400001)(5660300002)(122000001)(2906002)(86362001)(38070700005)(4326008)(110136005)(8676002)(8936002)(66446008)(52536014)(53546011)(26005)(64756008)(9686003)(55016003)(7696005)(71200400001)(41300700001)(6506007)(316002)(54906003)(186003)(66556008)(45080400002)(478600001)(76116006)(966005)(66476007)(66946007)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7349
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d923cef-9667-49fb-69e2-08dacd2482c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nV3OcaDzfTfmuDeQ/1Qp6XWthqMtxEA+OmtgPq6gTcC5JVNkqQJihE6LEpNjcY4JiWquHYoMa1K94doskJ3uIVTWufhfuScV8DgizPoXg7P69+xcfXJtPu6LlHnSLdIE4+G+ymtrtZE/0MCO2otadBWc6+1zfl9d/f1UfQ1dcN4jkLheg9euBunFvSJnbZpI1qWaZDZIXY5E2zCnA827T3rkMVX6eoAoLGeQbsXgRzdlK97V2kKd+oXTHc1DeYkRNEVfrkP7M4Y8MXnOJGu6Y5G143cLpE+U84RbC2Vudsjk7/3YeOPVBwQNURav6svWVQJ5jKGA5Iz+lD3yTKGRZFqDVrH41PuhN5iwFkDpad78puBoXV1CGAgv/IdInnQcA7KkhJ7PHk99dIWTrH27pEOjn1c2G5lu68hAoK01DlOnfNew6RFuD1yIO5PQ/N8NcVtcggT7JgnQb5N55HHhcIH6ojDkDkR8Wfei4eX/KNdwfPlOGBMzg0bL3VIlz8ARPavLHlxhcgWWPKbtg2gbhOGvXLIz8n2KZkFRIFgNUI58lbs5Llr8s2dZS9RHzkBP6QmVvFxPWueMDtW6tV5Ar3pwG/Y32uYGub8B3StqQQ4cvVFo8LLd54d8repS9eanZlF/HoKkUp1oqEehZ07oi/4VCv1SssizOxiYA/tDoIwzMaUohVmGM1OtD+yHm0g/4FhEvn6jITStyfMFxS/w51nZBS1Y6nHJVcg0moZHot1qSeQhXN3hlJc08BD37V9iwKH9Ihdnga/cCFodjbQpTQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(2906002)(8936002)(5660300002)(82310400005)(316002)(36860700001)(41300700001)(55016003)(40460700003)(54906003)(52536014)(110136005)(966005)(8676002)(45080400002)(70206006)(81166007)(33656002)(70586007)(4326008)(478600001)(53546011)(86362001)(336012)(47076005)(26005)(7696005)(6506007)(9686003)(186003)(83380400001)(356005)(82740400003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 07:30:06.6435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56febcdf-9480-442f-3791-08dacd248b65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9633

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVy
IDIyLCAyMDIyIDExOjE3IFBNDQo+IFRvOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsg
SmlhbWVpIFhpZSA8SmlhbWVpLlhpZUBhcm0uY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZw0KPiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0
YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzIDxC
ZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXly
X0JhYmNodWtAZXBhbS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHhlbi9hcm06IHZw
bDAxMTogTWFrZSBhY2Nlc3MgdG8gRE1BQ1Igd3JpdGUtDQo+IGlnbm9yZQ0KPiANCj4gSGksDQo+
IA0KPiBPbiAyMi8xMS8yMDIyIDEzOjI1LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4NCj4gPg0K
PiA+IEhpLA0KPiA+DQo+ID4gT24gMjIvMTEvMjAyMiAwNTo0NiwgSmlhbWVpIFhpZSB3cm90ZToN
Cj4gPj4gV2hlbiB0aGUgZ3Vlc3Qga2VybmVsIGVuYWJsZXMgRE1BIGVuZ2luZSB3aXRoDQo+ICJD
T05GSUdfRE1BX0VOR0lORT15IiwNCj4gPj4gTGludXggU0JTQSBQTDAxMSBkcml2ZXIgd2lsbCBh
Y2Nlc3MgUEwwMTEgRE1BQ1IgcmVnaXN0ZXIgaW4gc29tZQ0KPiA+PiBmdW5jdGlvbnMuIEFzIGNo
YXB0ZXIgIkIgR2VuZXJpYyBVQVJUIiBpbiAiQVJNIFNlcnZlciBCYXNlIFN5c3RlbQ0KPiA+PiBB
cmNoaXRlY3R1cmUiWzFdIGRvY3VtZW50YXRpb24gZGVzY3JpYmVzLCBTQlNBIFVBUlQgZG9lc24n
dCBzdXBwb3J0DQo+ID4+IERNQS4gSW4gY3VycmVudCBjb2RlLCB3aGVuIHRoZSBrZXJuZWwgdHJp
ZXMgdG8gYWNjZXNzIERNQUNSIHJlZ2lzdGVyLA0KPiA+PiBYZW4gd2lsbCBpbmplY3QgYSBkYXRh
IGFib3J0Og0KPiA+PiBVbmhhbmRsZWQgZmF1bHQgYXQgMHhmZmZmZmZjMDA5NDRkMDQ4DQo+ID4+
IE1lbSBhYm9ydCBpbmZvOg0KPiA+PiAgICBFU1IgPSAweDk2MDAwMDAwDQo+ID4+ICAgIEVDID0g
MHgyNTogREFCVCAoY3VycmVudCBFTCksIElMID0gMzIgYml0cw0KPiA+PiAgICBTRVQgPSAwLCBG
blYgPSAwDQo+ID4+ICAgIEVBID0gMCwgUzFQVFcgPSAwDQo+ID4+ICAgIEZTQyA9IDB4MDA6IHR0
YnIgYWRkcmVzcyBzaXplIGZhdWx0DQo+ID4+IERhdGEgYWJvcnQgaW5mbzoNCj4gPj4gICAgSVNW
ID0gMCwgSVNTID0gMHgwMDAwMDAwMA0KPiA+PiAgICBDTSA9IDAsIFduUiA9IDANCj4gPj4gc3dh
cHBlciBwZ3RhYmxlOiA0ayBwYWdlcywgMzktYml0IFZBcywgcGdkcD0wMDAwMDAwMDIwZTJlMDAw
DQo+ID4+IFtmZmZmZmZjMDA5NDRkMDQ4XSBwZ2Q9MTAwMDAwMDAzZmZmZjgwMywgcDRkPTEwMDAw
MDAwM2ZmZmY4MDMsDQo+IHB1ZD0xMDAwMDAwMDNmZmZmODAzLCBwbWQ9MTAwMDAwMDAzZmZmYTgw
MywgcHRlPTAwNjgwMDAwOWMwOTBmMTMNCj4gPj4gSW50ZXJuYWwgZXJyb3I6IHR0YnIgYWRkcmVz
cyBzaXplIGZhdWx0OiA5NjAwMDAwMCBbIzFdIFBSRUVNUFQgU01QDQo+ID4+IC4uLg0KPiA+PiBD
YWxsIHRyYWNlOg0KPiA+PiAgIHBsMDExX3N0b3BfcngrMHg3MC8weDgwDQo+ID4+ICAgdHR5X3Bv
cnRfc2h1dGRvd24rMHg3Yy8weGI0DQo+ID4+ICAgdHR5X3BvcnRfY2xvc2UrMHg2MC8weGNjDQo+
ID4+ICAgdWFydF9jbG9zZSsweDM0LzB4OGMNCj4gPj4gICB0dHlfcmVsZWFzZSsweDE0NC8weDRj
MA0KPiA+PiAgIF9fZnB1dCsweDc4LzB4MjIwDQo+ID4+ICAgX19fX2ZwdXQrMHgxYy8weDMwDQo+
ID4+ICAgdGFza193b3JrX3J1bisweDg4LzB4YzANCj4gPj4gICBkb19ub3RpZnlfcmVzdW1lKzB4
OGQwLzB4MTIzYw0KPiA+PiAgIGVsMF9zdmMrMHhhOC8weGMwDQo+ID4+ICAgZWwwdF82NF9zeW5j
X2hhbmRsZXIrMHhhNC8weDEzMA0KPiA+PiAgIGVsMHRfNjRfc3luYysweDFhMC8weDFhNA0KPiA+
PiBDb2RlOiBiOTAwMDA4MyBiOTAxZjAwMSA3OTQwMzhhMCA4YjAwMDA0MiAoYjkwMDAwNDEpDQo+
ID4+IC0tLVsgZW5kIHRyYWNlIDgzZGQ5M2RmMTVjMzIxNmYgXS0tLQ0KPiA+PiBub3RlOiBib290
bG9nZFsxMzJdIGV4aXRlZCB3aXRoIHByZWVtcHRfY291bnQgMQ0KPiA+PiAvZXRjL3JjUy5kL1Mw
N2Jvb3Rsb2dkOiBsaW5lIDQ3OiAxMzIgU2VnbWVudGF0aW9uIGZhdWx0IHN0YXJ0LXN0b3AtDQo+
IGRhZW1vbg0KPiA+Pg0KPiA+PiBBcyBkaXNjdXNzZWQgaW4gWzJdLCB0aGlzIGNvbW1pdCBtYWtl
cyB0aGUgYWNjZXNzIHRvIERNQUNSIHJlZ2lzdGVyDQo+ID4+IHdyaXRlLWlnbm9yZSBhcyBhbiBp
bXByb3ZlbWVudC4NCj4gPg0KPiA+IERpZG4ndCB3ZSBhZ3JlZSB0byBlbXVsYXRlIGFsbCBub24t
U0JTQSByZWdpc3RlcnMgYXMgV0k/IElPVywgdGhlDQo+ID4gZGVmYXVsdCBjYXNlIHNob3VsZCBj
b250YWluIGEgJ2dvdG8gd3JpdGVfaWdub3JlJyByYXRoZXIgcmV0dXJuIDAuDQo+ICsgd2UgYWxz
byBhZ3JlZWQgb24gZW11bGF0aW5nIHRoZSByZWFkcyB0byBub24gc3BlYyBjb21wbGlhbnQgcmVn
aXN0ZXJzIGFzDQo+IFJBWi4NCg0KVGhhbmtzIGZvciByZW1pbmRpbmcgbWUgb2YgdGhpcy4gSSds
bCAgZW11bGF0aW5nIHRoZSByZWFkcyB0byBub24gc3BlYyBjb21wbGlhbnQgcmVnaXN0ZXJzIGFz
DQpSQVogaW4gcGF0Y2ggdjMuDQoNCkJlc3Qgd2lzaGVzDQpKaWFtZWkgWGllDQoNCj4gDQo+ID4N
Cj4gPj4NCj4gPj4gWzFdDQo+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmRldmUNCj4gbG9wZXIuYXJtLmNvbSUyRmRvY3Vt
ZW50YXRpb24lMkZkZW4wMDk0JTJGYyUyRiUzRmxhbmclM0RlbiZhbQ0KPiBwO2RhdGE9MDUlN0Mw
MSU3Q21pY2hhbC5vcnplbCU0MGFtZC5jb20lN0MxMDY1NzAyYjRmZDI0NTdjZGJmODANCj4gOGRh
Y2M4NGI0NWElN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM4
MA0KPiA0NzE2NzYwMDc4NjU4MCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdM
akF3TURBaQ0KPiBMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNE
JTdDMzAwMCU3QyU3QyU3QyYNCj4gYW1wO3NkYXRhPVcxZGJha3c2bGtHa3Y0eWRFbElpJTJCYTd1
VDdlN1B0NWRCM3ZEdFlwUCUyRnFRJTNEJmENCj4gbXA7cmVzZXJ2ZWQ9MA0KPiA+PiBbMl0NCj4g
aHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGbG9yZS4NCj4ga2VybmVsLm9yZyUyRnhlbi0NCj4gZGV2ZWwlMkZhbHBpbmUuREVC
LjIuMjIuMzk0LjIyMTExNjE1NTI0MjAuNDAyMCU0MHVidW50dS1saW51eC0yMC0wNC0NCj4gZGVz
a3RvcCUyRiZhbXA7ZGF0YT0wNSU3QzAxJTdDbWljaGFsLm9yemVsJTQwYW1kLmNvbSU3QzEwNjU3
MDINCj4gYjRmZDI0NTdjZGJmODA4ZGFjYzg0YjQ1YSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgy
ZDk5NGUxODNkJTdDDQo+IDAlN0MwJTdDNjM4MDQ3MTY3NjAwNzg2NTgwJTdDVW5rbm93biU3Q1RX
RnBiR1pzYjNkOGV5SldJam9pDQo+IE1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJ
NklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMA0KPiAwMCU3QyU3QyU3QyZhbXA7c2RhdGE9TzR6
eHVJM0hxUkExYmRyYUdjVlZZOHZWMEhHYnFPSTNuRmElMkYNCj4gY2lDMWNHUSUzRCZhbXA7cmVz
ZXJ2ZWQ9MA0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKaWFtZWkgWGllIDxqaWFtZWkueGll
QGFybS5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIHhlbi9hcmNoL2FybS92cGwwMTEuYyB8IDQgKysr
Kw0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92cGwwMTEuYyBiL3hlbi9hcmNoL2FybS92cGwwMTEuYw0K
PiA+PiBpbmRleCA0MzUyMmQ0OGZkLi5lOTdmZTNlYmU3IDEwMDY0NA0KPiA+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vdnBsMDExLmMNCj4gPj4gKysrIGIveGVuL2FyY2gvYXJtL3ZwbDAxMS5jDQo+ID4+
IEBAIC00NjMsNiArNDYzLDEwIEBAIHN0YXRpYyBpbnQgdnBsMDExX21taW9fd3JpdGUoc3RydWN0
IHZjcHUgKnYsDQo+ID4+ICAgICAgIGNhc2UgRlI6DQo+ID4+ICAgICAgIGNhc2UgUklTOg0KPiA+
PiAgICAgICBjYXNlIE1JUzoNCj4gPj4gKyAgICBjYXNlIERNQUNSOg0KPiA+PiArICAgICAgICBw
cmludGsoWEVOTE9HX0dfREVCVUcNCj4gPj4gKyAgICAgICAgICAgICAgICJ2cGwwMTE6IFdJIG9u
IHJlZ2lzdGVyIG9mZnNldCAlIzA4eFxuIiwNCj4gPj4gKyAgICAgICAgICAgICAgIHZwbDAxMV9y
ZWcpOw0KPiA+DQo+ID4gSU1ITywgdGhpcyBtZXNzYWdlIHNob3VsZCBiZSBwcmludGVkIGp1c3Qg
YWZ0ZXIgdGhlIHdyaXRlX2lnbm9yZSBsYWJlbC4NCj4gPg0KPiA+PiAgICAgICAgICAgZ290byB3
cml0ZV9pZ25vcmU7DQo+ID4+DQo+ID4+ICAgICAgIGNhc2UgSU1TQzoNCj4gPg0KPiA+IENoZWVy
cywNCj4gPg0KPiA+IC0tDQo+ID4gSnVsaWVuIEdyYWxsDQo+ID4NCj4gDQo+IH5NaWNoYWwNCg==

