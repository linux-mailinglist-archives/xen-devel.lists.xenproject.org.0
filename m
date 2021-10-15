Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D77842EE87
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210162.366912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKCl-0007C1-7S; Fri, 15 Oct 2021 10:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210162.366912; Fri, 15 Oct 2021 10:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKCl-00079u-4Q; Fri, 15 Oct 2021 10:12:47 +0000
Received: by outflank-mailman (input) for mailman id 210162;
 Fri, 15 Oct 2021 10:12:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbKCk-00079o-G1
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:12:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d887e701-db77-4a2d-b05a-784fb6902e8e;
 Fri, 15 Oct 2021 10:12:45 +0000 (UTC)
Received: from AM5PR0202CA0007.eurprd02.prod.outlook.com
 (2603:10a6:203:69::17) by VI1PR08MB2638.eurprd08.prod.outlook.com
 (2603:10a6:802:1f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 15 Oct
 2021 10:12:42 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::83) by AM5PR0202CA0007.outlook.office365.com
 (2603:10a6:203:69::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 10:12:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 10:12:41 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Fri, 15 Oct 2021 10:12:41 +0000
Received: from 78d4ed326ada.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 28225B74-60B2-434F-AF29-B430C90A1C03.1; 
 Fri, 15 Oct 2021 10:12:35 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 78d4ed326ada.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 10:12:35 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB9PR08MB6825.eurprd08.prod.outlook.com (2603:10a6:10:2af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 10:12:33 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 10:12:33 +0000
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
X-Inumbo-ID: d887e701-db77-4a2d-b05a-784fb6902e8e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHihjhMyBnsJlRDO5BLNNL2M+R+5vHhW9efdHWLCojk=;
 b=mjyqeEp9YQ3IEY+PezXLTzDDFHIozsDotq0LumQjSi3+xJoZkLGClG3ehB5XztoPuCUyx4Jo4BGdTJlSkXF3rsMV+pTlvNRcp+CAwQjrfMEVhERFpRnhaZ7lUPMaMeO1vvnCRYv2IMErTr79Rxabp0ZYvacQ6oda4fPnitVaS9Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4bb9e850a702bb5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktIYFkUVsoASGlGfh0RzgcL+lSeGu77ddKtpn/EOaxUS6REpmAbYApchqL1r3kJwIC+tTX7lmKiKC7w58X4AouRwuuRStkVktQgsuz/qbZT2DTa0ll7EzA+wGR8aQH6tL32Ep9oHjTa7+ET30zxKpq2z/cRQSgNZEPHb/1HvN7RCfCO+uooj5PBh08DJJsp/RbubrZq1/5FjIIfKXga9wvtgLoGwllcvsmXeDtnjRJCf5JmnJO4SnGXWrV/73az96kfJuohbh8GVTAHQIGIz/azUxdlHPNiONEhhLFmC0I1q7kj/wO2qcHbDg/my31dUyV9KY0gapbxdXY1Vg2EVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHihjhMyBnsJlRDO5BLNNL2M+R+5vHhW9efdHWLCojk=;
 b=KN9jxrAWrFhRPjv4Bgqsru2nO3gfL872He0HQdU0VbHI8vN5tTIMkAF487MeD0LOlNNiZwX7ILmOL/5jEwiuehdYxkC34varuhHT2yZztkXIvZQnWf4FrS+xHTCbXQDYVDxKa6fvwnVn/8vQpOra1tQfShbEpEf7r/KGhR3dHZoCwka8u5v/4z5Jt1c//CdQjEXc67xy4HJl4uBUAS5FjV/Ly/UkWvhT+6qzcXDynCOFXj3w3xZes3xWLbumM8GOpbrURMYOo3/qgDkjb+AOtb4GyVpxnFtHb0t3VDY4+zsBYb8zTcwdOzswzsydlHWNih3ZHor3S4OEUkZxNrsGBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHihjhMyBnsJlRDO5BLNNL2M+R+5vHhW9efdHWLCojk=;
 b=mjyqeEp9YQ3IEY+PezXLTzDDFHIozsDotq0LumQjSi3+xJoZkLGClG3ehB5XztoPuCUyx4Jo4BGdTJlSkXF3rsMV+pTlvNRcp+CAwQjrfMEVhERFpRnhaZ7lUPMaMeO1vvnCRYv2IMErTr79Rxabp0ZYvacQ6oda4fPnitVaS9Y=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, Paul Durrant <paul@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
Thread-Topic: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
Thread-Index: AQHXwQraA42SZeh0QUGI/xX7keuWA6vTrtGAgAACnoCAACGIAIAABUmA
Date: Fri, 15 Oct 2021 10:12:33 +0000
Message-ID: <5CD14C43-2131-487F-B4D8-ECE5B2F07A14@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
 <YWkxT1bVmBT7Av43@MacBook-Air-de-Roger.local>
 <EB6EE7F3-80BD-4717-87C7-C54FAB0FD832@arm.com>
 <YWlPohYpgxs3gRlc@MacBook-Air-de-Roger.local>
In-Reply-To: <YWlPohYpgxs3gRlc@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ca89365b-7cec-4f22-2b6d-08d98fc4531c
x-ms-traffictypediagnostic: DB9PR08MB6825:|VI1PR08MB2638:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB26386FC90A941866C820F1B79DB99@VI1PR08MB2638.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sIpL3fUct7tcFsHEwp2WN89Sl8Hke9C4+g3rr17aKzfuwt8XaFRT4HeXp3rfSigtq9Y6bBKBR+nx1fmaKxio9Ld5Ed0PZvXamMvaOEKC4eI5gijaOvUDdj3He5eD3EyA7mUB4n3wUpWTBiZhZg72VcIH5SYIlnK7IMmPVl/Vzhg0ww2FnRDjp4HPPxpbd72ONT1fCwXsQOLTfdpXKnnl3xJjHAh6rN3gHt2Gt8lNaopZWtTwwukQD3RogCWmEZsBvFN7xw4mycdw0e/7c2Zthydy+v6CiIjYpX1GHm3QxwBOzt1IwfMMG46tK4kVAur1BSwQOmmYto3Aih0FW/nZIwBW6aUedCBXW9xl+OBnJ3xZZFFrgkg4CjyPT4+aM7L19s26kdlIuTwTcu0YttQfPOMPU3rFPx6kAYs6Mp9vR6eEuOJ6UbDphTM1lCsNxWCOa/tWEyXkKCgQ5PTSd70X8AUGnjg3KEElducVTx1T3dWDgIOVVL6JRwKsm2Y+dKdtoqUl/UCrMGVwqdK3DGxLUq1iRMq30OglFpkU2ykwIjH/NiD7DgXkmkzSdTWD6jMT3nbqt8DDXSrLh4Qs5Tf1y07FXwklwcM4nP0GjXwdiEMmNfzMChNQfe57ezdNQna2/PpOTTo5KyJkCWnLQik8trQbOKlIwYSvKl5K1Rj12KZjXrPHlzH9XgNW2JHLHf8VjUbZ+i7Rp3vHlX/9vyIk+vm7zgH92kGtHPo+oTZIsGE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(316002)(53546011)(4326008)(86362001)(76116006)(54906003)(36756003)(508600001)(6512007)(2906002)(71200400001)(6506007)(66556008)(38070700005)(38100700002)(8936002)(122000001)(5660300002)(6916009)(26005)(64756008)(66476007)(66946007)(8676002)(83380400001)(6486002)(33656002)(66446008)(91956017)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A65083CB1E1B864B8715F912EBEBB5E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6825
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c562b7a-b456-4a45-1cbd-08d98fc44e4a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cbOnEBX7Zc+Le2myO/zIOlTIrBLqy9cV8lHpqnbujhN9UB9JY8yTfLZE2PzRfeiKfvLvWNQ6vX9ZryE/GOtAaP6W+Eigqp10VfK3kCIl7Xj6YtC/5YNXX7OGFTS7gjV/e3DNlJRpQtXNdW6qgkm5E+9cRtPLk8IGs4IhiHHxwWg8tRGRVrjACf/+HwFs2u7XxMdoPT4K0up5kqotq0zgYngyUJaC+GvWEUInLl5iVigeNfIa7PWnx0vIfQbdG9tVUKruK6WhWdJopnkoyjO9iHfNCUvZRGwkj2txeTS5zmJ+/cXJu11z7YvGUGTncK2o31oDhK0enjmM/++pTmS7kSrcBfeHSlC+IHLNJ5Nq0Ff8HTgi5jo15GLskyb5qtzDb+4IfHvdanx4lfPEDzv0yAhwcr4vW/KUAoI3V1o5R4Q3HJ6n0LQLHm4Aa1FUCUDxjk/3SoIZ7AcqN+/0tUjGEfPppYj1+oAH6ze25zy9qCIP5j/yiGnkzM6l/i695hoA6Y6PAjLrJPCyqkdBdyYAo6q8XY7djOAXLQkEtNom+7GCJjP6PlIaTG4den3s93r9ciRCe/ULCBHpD/De83w3Cs5w6CK98lKbqeN4pOQaaAsRvvo7Ru3guXF5wSrQsBzJAUB1H6OKZaF/qaZ9DhPzXMILoHrEkm/vPzsRGhz/taQleVWa6jYBibMtgTqpWkfs
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(81166007)(33656002)(2616005)(47076005)(356005)(86362001)(2906002)(336012)(6862004)(70206006)(6512007)(8936002)(5660300002)(70586007)(53546011)(8676002)(6486002)(83380400001)(36860700001)(82310400003)(54906003)(4326008)(186003)(6506007)(26005)(316002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:12:41.8403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca89365b-7cec-4f22-2b6d-08d98fc4531c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2638

SGkgUm9nZXIsDQoNCj4gT24gMTUgT2N0IDIwMjEsIGF0IDEwOjUzLCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIE9jdCAxNSwgMjAy
MSBhdCAwNzo1MzozOEFNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+IE9uIDE1
IE9jdCAyMDIxLCBhdCAwODo0NCwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+IHdyb3RlOg0KPj4+IE9uIFRodSwgT2N0IDE0LCAyMDIxIGF0IDAzOjQ5OjQ5UE0gKzAxMDAs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+IEBAIC00MzQsMjUgKzQyMCw4IEBAIHN0YXRp
YyBpbnQgdnBjaV9tbWNmZ19yZWFkKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGFkZHIs
DQo+Pj4+ICAgIHJlZyA9IHZwY2lfbW1jZmdfZGVjb2RlX2FkZHIobW1jZmcsIGFkZHIsICZzYmRm
KTsNCj4+Pj4gICAgcmVhZF91bmxvY2soJmQtPmFyY2guaHZtLm1tY2ZnX2xvY2spOw0KPj4+PiAN
Cj4+Pj4gLSAgICBpZiAoICF2cGNpX2FjY2Vzc19hbGxvd2VkKHJlZywgbGVuKSB8fA0KPj4+PiAt
ICAgICAgICAgKHJlZyArIGxlbikgPiBQQ0lfQ0ZHX1NQQUNFX0VYUF9TSVpFICkNCj4+Pj4gLSAg
ICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsNCj4+Pj4gLQ0KPj4+PiAtICAgIC8qDQo+Pj4+IC0g
ICAgICogQWNjb3JkaW5nIHRvIHRoZSBQQ0llIDMuMUEgc3BlY2lmaWNhdGlvbjoNCj4+Pj4gLSAg
ICAgKiAgLSBDb25maWd1cmF0aW9uIFJlYWRzIGFuZCBXcml0ZXMgbXVzdCB1c3VhbGx5IGJlIERX
T1JEIG9yIHNtYWxsZXINCj4+Pj4gLSAgICAgKiAgICBpbiBzaXplLg0KPj4+PiAtICAgICAqICAt
IEJlY2F1c2UgUm9vdCBDb21wbGV4IGltcGxlbWVudGF0aW9ucyBhcmUgbm90IHJlcXVpcmVkIHRv
IHN1cHBvcnQNCj4+Pj4gLSAgICAgKiAgICBhY2Nlc3NlcyB0byBhIFJDUkIgdGhhdCBjcm9zcyBE
VyBib3VuZGFyaWVzIFsuLi5dIHNvZnR3YXJlDQo+Pj4+IC0gICAgICogICAgc2hvdWxkIHRha2Ug
Y2FyZSBub3QgdG8gY2F1c2UgdGhlIGdlbmVyYXRpb24gb2Ygc3VjaCBhY2Nlc3Nlcw0KPj4+PiAt
ICAgICAqICAgIHdoZW4gYWNjZXNzaW5nIGEgUkNSQiB1bmxlc3MgdGhlIFJvb3QgQ29tcGxleCB3
aWxsIHN1cHBvcnQgdGhlDQo+Pj4+IC0gICAgICogICAgYWNjZXNzLg0KPj4+PiAtICAgICAqICBY
ZW4gaG93ZXZlciBzdXBwb3J0cyA4Ynl0ZSBhY2Nlc3NlcyBieSBzcGxpdHRpbmcgdGhlbSBpbnRv
IHR3bw0KPj4+PiAtICAgICAqICA0Ynl0ZSBhY2Nlc3Nlcy4NCj4+Pj4gLSAgICAgKi8NCj4+Pj4g
LSAgICAqZGF0YSA9IHZwY2lfcmVhZChzYmRmLCByZWcsIG1pbig0dSwgbGVuKSk7DQo+Pj4+IC0g
ICAgaWYgKCBsZW4gPT0gOCApDQo+Pj4+IC0gICAgICAgICpkYXRhIHw9ICh1aW50NjRfdCl2cGNp
X3JlYWQoc2JkZiwgcmVnICsgNCwgNCkgPDwgMzI7DQo+Pj4+ICsgICAgLyogSWdub3JlIHJldHVy
biBjb2RlICovDQo+Pj4+ICsgICAgdnBjaV9lY2FtX21taW9fcmVhZChzYmRmLCByZWcsIGxlbiwg
ZGF0YSk7DQo+Pj4gDQo+Pj4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgZm9yIHZwY2lfZWNh
bV9tbWlvX3JlYWQgdG8ganVzdCByZXR1cm4gdGhlDQo+Pj4gcmVhZCB2YWx1ZSwgb3IgfjAgaW4g
Y2FzZSBvZiBlcnJvciwgYXQgbGVhc3QgdGhhdCBpbnRlcmZhY2Ugd291bGQgYmUNCj4+PiBzaW1w
bGVyIGFuZCBzdWl0YWJsZSBmb3IgeDg2Lg0KPj4gDQo+PiBJIGFtIG5vdCBxdWl0ZSBzdXJlIG9u
IHRoaXMgYXMgb24gYWJzb2x1dGUgdG8gcmVhZCB+MCBpcyBwb3NzaWJsZSBzbyB0aGUNCj4+IGNh
bGxlciBjYW5ub3QgZGlzdGluZ3Vpc2ggYmV0d2VlbiBwcm9wZXJseSByZWFkaW5nIH4wIG9yIGFu
IGFjY2VzcyBhbGxvd2VkIGVycm9yLg0KPiANCj4gSG93IGRvIHlvdSByZXBvcnQgYW4gYWNjZXNz
IGFsbG93ZWQgZXJyb3Igb24gQXJtIGZvciB0aGUgUENJIGNvbmZpZw0KPiBzcGFjZT8NCg0KVGhp
cyBkb2VzIG5vdCBnbyB0aGF0IGZhci4gSW4gdGhlIGN1cnJlbnQgY2FzZSB0aGlzIGlzIGFjdHVh
bGx5IGFuIHVuYWxpZ25lZA0KYWNjZXNzIHRvIG1taW8gd2hpY2ggd2lsbCB0cmlnZ2VyIGFuZCBl
eGNlcHRpb24gYmVmb3JlIHJlYWNoaW5nIHRoZSBQQ0kgY29uZmlnIHNwYWNlLg0KDQo+IA0KPiBB
dCBsZWFzdCBvbiB4ODYgSSBkb24ndCB0aGluayB3ZSBjdXJyZW50bHkgaGF2ZSBhIHdheSB0byBw
cm9wYWdhdGUNCj4gc3VjaCBlcnJvcnMsIG5laXRoZXIgYSBwbGFuIHRvIGRvIHNvIHRoYXQgSSdt
IGF3YXJlLg0KDQpUaGUgYmVoYXZpb3VyIG9uIHg4NiB3aWxsIG5vdCBjaGFuZ2UgYXMgd2Ugd2ls
bCBpZ25vcmUgdGhpcy4NCg0KUmVnYXJkcw0KQmVydHJhbmQNCg0KPiANCj4gVGhhbmtzLCBSb2dl
ci4NCg0K

