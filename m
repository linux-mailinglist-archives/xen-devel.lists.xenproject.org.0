Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495BE46E23A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 07:05:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242668.419683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvCWj-0008Ls-AZ; Thu, 09 Dec 2021 06:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242668.419683; Thu, 09 Dec 2021 06:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvCWj-0008JU-4K; Thu, 09 Dec 2021 06:03:33 +0000
Received: by outflank-mailman (input) for mailman id 242668;
 Thu, 09 Dec 2021 06:03:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAzj=Q2=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1mvCWg-0008JO-Q1
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 06:03:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b996bdb1-58b5-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 07:03:27 +0100 (CET)
Received: from DB6PR0601CA0039.eurprd06.prod.outlook.com (2603:10a6:4:17::25)
 by AS8PR08MB6152.eurprd08.prod.outlook.com (2603:10a6:20b:298::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Thu, 9 Dec
 2021 06:03:24 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::54) by DB6PR0601CA0039.outlook.office365.com
 (2603:10a6:4:17::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Thu, 9 Dec 2021 06:03:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 06:03:24 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Thu, 09 Dec 2021 06:03:24 +0000
Received: from f9209bb38731.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 041B3678-C39A-46B7-A2F0-06EB170CB82E.1; 
 Thu, 09 Dec 2021 06:03:18 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9209bb38731.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Dec 2021 06:03:18 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com (2603:10a6:803:3d::28)
 by VI1PR08MB3167.eurprd08.prod.outlook.com (2603:10a6:803:47::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 9 Dec
 2021 06:03:16 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::8124:9971:1db2:b704]) by VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::8124:9971:1db2:b704%7]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 06:03:15 +0000
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
X-Inumbo-ID: b996bdb1-58b5-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdCAXFgHsMOjyszWPKP8rGU4d8W89l5YnT6AcW7WDno=;
 b=3oOJly1jvCDqxY362zjjW6WRcdTcBteZRdbAvkAusXAHxs3pAkYzd6LHM8dbq4LRXpkpGJUd9acCwJhnUfor2WPqdgwJnAho/iRrmX5FTmDVuwgG4Fv2XKoel0Rfd2l+n++7PZTXsbm0T9JXQVmfxeiAQTmOEeTaeDw5b8y0XSc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mm0YIs8UuPqK6qUp1z/beCOVeCLqmqydjGZH8whbfJhHEcR9s84ogQKeLvJceLnEshS28SijC6D045NEMQTP/JMYkcjMfiJ+rjof8d5dcznHeiYszFI07oeNg1HGhXFfeCwHazSJ0jzcW50lgU77Tmjx8v3B8Ssbzp/7QEjT5sSySr1yL+FrIyOt9FCVHU/YM8NLG6lUtSYrlnOc7GDfTsRjrzWjNyD6eI5al/LM/HM/d4J8WSGFCS5Y3llpYIuk4Yl2eNUdHVSvEEuO/iv/ZVRRVzwso+WifrTKxGdg1Va0Nc8wQ4lrUIoSHZFGbPQ5PQcB+6KQnQ5kcJ+quTxI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdCAXFgHsMOjyszWPKP8rGU4d8W89l5YnT6AcW7WDno=;
 b=Sma2IonGFeh/cCIo+2fbDRBkdXdw3/nWcCw07ijNV6oy2ikt1eQu8HljThchcS5q3Ovt2gY3uabiQKAkM6RiR88elXxoyffmJZOZQnFMDJExgf2H8kjxtHIg4BIzngGUSxqPbK/hwAYYlwqExZN5TFcYMEs412dPJNE5pmtReIAS38w84I7483crCoc7TD4E6v/TcwTEMbPry9gflFCcyYAR0vUiFjKv/fKOcFra7PwGmwVyGZW84hgmm0/bUryNmfyXmtwC4lPGq7vC4Ph7N8RBHbw1/lJ+bbhrhpt9C8EqimSo7pdKzuqh6wNI3UKS/xM2yewxh7311pvR7Gc3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdCAXFgHsMOjyszWPKP8rGU4d8W89l5YnT6AcW7WDno=;
 b=3oOJly1jvCDqxY362zjjW6WRcdTcBteZRdbAvkAusXAHxs3pAkYzd6LHM8dbq4LRXpkpGJUd9acCwJhnUfor2WPqdgwJnAho/iRrmX5FTmDVuwgG4Fv2XKoel0Rfd2l+n++7PZTXsbm0T9JXQVmfxeiAQTmOEeTaeDw5b8y0XSc=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <Julien.Grall@arm.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
Subject: RE: [PATCH V6 2/2] libxl: Introduce basic virtio-mmio support on Arm
Thread-Topic: [PATCH V6 2/2] libxl: Introduce basic virtio-mmio support on Arm
Thread-Index: AQHX7FUosCx1FrdSC0GOBgwOnMcEG6wpo4aA
Date: Thu, 9 Dec 2021 06:03:14 +0000
Message-ID:
 <VI1PR08MB3056D4987059BCF1B63AD89F92709@VI1PR08MB3056.eurprd08.prod.outlook.com>
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
 <1638982784-14390-3-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1638982784-14390-3-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9BF145D2DD175440BC1F4473C08B0753.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4295dcfd-944b-45e0-4455-08d9bad99c4a
x-ms-traffictypediagnostic:
	VI1PR08MB3167:EE_|DB5EUR03FT006:EE_|AS8PR08MB6152:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB615285A96D7B1DD1A46EE0AC92709@AS8PR08MB6152.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1265;OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KIK5wEL2oOxkUnasKNKjLozjKQCF4W4L/prUGOBYGsivLQt6cXKq/YOuBN5kplZmwMDVZ6IZdvf/gZWCjgtpjIAac5/6FbiicRJmpciy7t505u925zfLK2uNi1f40L0s7tEEZopzrr54dh5Ilo30BNdur5hVtOv76GyB4RDc3qMf2eShy5grufwpEZD8f3CYnGQG1JxuYTQLkDivnsX1Bd/vhSTjj0KZr3xWLTMr3Wz+DvYWdGKRTCSVTa8dUNILPaGQra6daDj5pJ9p8wH3bNGQaxuKVQa/yZ674QGXA76MNlV43QqfOD5CB+t7hLYkHthi4oIIwlfMT4NvJcs5f1hBVgbLGeCc81x9xQnMxjhGFrrV/wb+omc9h9xAbpQKePiWhQpS7dTDOjf446iAqLlUbLa3asqztQ5JSBxTRttIjY6JA5PNcAfBStSRYoRYCiY44UQwSgSMT30bErVcnkm0+Oob1ViZesTs1ZxYXKPgIs3ztBoGxcUZKCt+p5MlDBZ2vrKKUKXASUJupIU2iJLsSC9ZzBowYBxXAg8R67FDTmGLvVfAZ4k0fknNVbTW7kn72JoXtikA3HKKch2/524JykjT+92TrEQZJkVYh07I3TwInoEpaEcT+ZJw1JsY5Dioi/b78G1UiVywm5pwElSl9Yh/TV8QkKJ0sVjcEYhSOcEekIg6B1BdJA+vQ4BIMBv6kGcNtSec17rDo16GcA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3056.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(33656002)(86362001)(76116006)(5660300002)(66446008)(6506007)(54906003)(53546011)(4326008)(508600001)(9686003)(66556008)(71200400001)(64756008)(38070700005)(66476007)(55016003)(52536014)(26005)(2906002)(8676002)(8936002)(122000001)(7696005)(38100700002)(83380400001)(316002)(110136005)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3167
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a30b5501-7bac-4e22-5489-08d9bad99724
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0ZI1aRqCBtiPc9yvok6oAE8dcI86+muC3nimFt/e56ox5hjVv3xduU/Fnn9pOCEWKLHRTtnsYN8Z+WZXyCDg8tOy3XoMxFoHUcTqmleOmLr463chpRgLe3pq8aDHpPkewogqtHfLfZzMA3aHEMU4XmCeAmsluraahwbU5A7c3T3f5sOo/XDHsEqUfVXYIMTQNPMJxXxOr1AmHXXAssDuj23ZwX39R71ZvwPU5xn+wUd5W5XccFDwNJxC+qiuOBUDMofiZkUmb1xt+3NpwerAZ0r7BiFPkWW5a3leOK7k22tUP2v21ctEc9bLN9WfCtZYf2MXT38nS9+TB2qxU3MBKuIzPTkTJquwe9Pu1dAwWqmNqOQLDaD2UOHgXaFXanpf7QGTmOKt3YbOeMlTFac24OuK0/pg0atf6hdBEQzzawuNo7oW9mpIEosx1MsZE2hgnhyIvIlC7lF/3ZwVM4iUo4DCFT62SYqTbTSvdoRYIalAjQvexd7GIfr2Q3dk2RobAEx0aSSm0AaMA7AZaNJ42KC2OPpVFiVnE+MfxBsXRKuneWLA7TJdAYK67rcB8ZpryMfgN76DbOgoWCl2imk9cT13Czvl4OzpPsfKPbfUPs8fvMX9Q3nTJpLwgU6nRZToccmQPn5kUw0nO5aSLe0dzxgGpe7Mh09REynmOgVxBE+QB4i7tIwFmq2wYtSjumNgWUYChDSVnq1nyQfYBEi44u8YP1WfJX2Qch3SESmHEpcm8Qhr5gkL4bmxqLadxX0hUENnZgAMgUisv4DL/NLlhQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(186003)(6506007)(53546011)(36860700001)(336012)(107886003)(81166007)(7696005)(26005)(86362001)(83380400001)(110136005)(54906003)(70586007)(356005)(5660300002)(40460700001)(8676002)(2906002)(52536014)(508600001)(316002)(70206006)(9686003)(47076005)(33656002)(8936002)(55016003)(4326008)(82310400004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 06:03:24.2262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4295dcfd-944b-45e0-4455-08d9bad99c4a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6152

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGVuLWRldmVsIDx4ZW4t
ZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+IE9sZWtz
YW5kciBUeXNoY2hlbmtvDQo+IFNlbnQ6IDIwMjHlubQxMuaciDnml6UgMTowMA0KPiBUbzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBKdWxpZW4gR3JhbGwgPEp1bGllbi5H
cmFsbEBhcm0uY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFudGhvbnkNCj4gUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PjsNCj4gU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47DQo+IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJf
QmFiY2h1a0BlcGFtLmNvbT47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNA
YXJtLmNvbT47IE9sZWtzYW5kciBUeXNoY2hlbmtvDQo+IDxvbGVrc2FuZHJfdHlzaGNoZW5rb0Bl
cGFtLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIFY2IDIvMl0gbGlieGw6IEludHJvZHVjZSBiYXNp
YyB2aXJ0aW8tbW1pbyBzdXBwb3J0IG9uIEFybQ0KPiANCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4gDQo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBoZWxwZXJz
IHRvIGFsbG9jYXRlIFZpcnRpbyBNTUlPIHBhcmFtcw0KPiAoSVJRIGFuZCBtZW1vcnkgcmVnaW9u
KSBhbmQgY3JlYXRlIHNwZWNpZmljIGRldmljZSBub2RlIGluDQo+IHRoZSBHdWVzdCBkZXZpY2Ut
dHJlZSB3aXRoIGFsbG9jYXRlZCBwYXJhbXMuIEluIG9yZGVyIHRvIGRlYWwNCj4gd2l0aCBtdWx0
aXBsZSBWaXJ0aW8gZGV2aWNlcywgcmVzZXJ2ZSBjb3JyZXNwb25kaW5nIHJhbmdlcy4NCj4gRm9y
IG5vdywgd2UgcmVzZXJ2ZSAxTUIgZm9yIG1lbW9yeSByZWdpb25zIGFuZCAxMCBTUElzLg0KPiAN
Cj4gQXMgdGhlc2UgaGVscGVycyBzaG91bGQgYmUgdXNlZCBmb3IgZXZlcnkgVmlydGlvIGRldmlj
ZSBhdHRhY2hlZA0KPiB0byB0aGUgR3Vlc3QsIGNhbGwgdGhlbSBmb3IgVmlydGlvIGRpc2socyku
DQo+IA0KPiBQbGVhc2Ugbm90ZSwgd2l0aCBzdGF0aWNhbGx5IGFsbG9jYXRlZCBWaXJ0aW8gSVJR
cyB0aGVyZSBpcw0KPiBhIHJpc2sgb2YgYSBjbGFzaCB3aXRoIGEgcGh5c2ljYWwgSVJRcyBvZiBw
YXNzdGhyb3VnaCBkZXZpY2VzLg0KPiBGb3IgdGhlIGZpcnN0IHZlcnNpb24sIGl0J3MgZmluZSwg
YnV0IHdlIHNob3VsZCBjb25zaWRlciBhbGxvY2F0aW5nDQo+IHRoZSBWaXJ0aW8gSVJRcyBhdXRv
bWF0aWNhbGx5LiBUaGFua2Z1bGx5LCB3ZSBrbm93IGluIGFkdmFuY2Ugd2hpY2gNCj4gSVJRcyB3
aWxsIGJlIHVzZWQgZm9yIHBhc3N0aHJvdWdoIHRvIGJlIGFibGUgdG8gY2hvb3NlIG5vbi1jbGFz
aGVkDQo+IG9uZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xl
a3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+IC0tLQ0KPiBQbGVhc2Ugbm90ZSwgdGhpcyBp
cyBhIHNwbGl0L2NsZWFudXAvaGFyZGVuaW5nIG9mIEp1bGllbidzIFBvQzoNCj4gIkFkZCBzdXBw
b3J0IGZvciBHdWVzdCBJTyBmb3J3YXJkaW5nIHRvIGEgZGV2aWNlIGVtdWxhdG9yIg0KPiANCj4g
Q2hhbmdlcyBSRkMgLT4gVjE6DQo+ICAgIC0gd2FzIHNxdWFzaGVkIHdpdGg6DQo+ICAgICAgIltS
RkMgUEFUQ0ggVjEgMDkvMTJdIGxpYnhsOiBIYW5kbGUgdmlydGlvLW1taW8gaXJxIGluIG1vcmUg
Y29ycmVjdCB3YXkiDQo+ICAgICAgIltSRkMgUEFUQ0ggVjEgMTEvMTJdIGxpYnhsOiBJbnNlcnQg
ImRtYS1jb2hlcmVudCIgcHJvcGVydHkgaW50byB2aXJ0aW8tDQo+IG1taW8gZGV2aWNlIG5vZGUi
DQo+ICAgICAgIltSRkMgUEFUQ0ggVjEgMTIvMTJdIGxpYnhsOiBGaXggZHVwbGljYXRlIG1lbW9y
eSBub2RlIGluIERUIg0KPiAgICAtIG1vdmUgVmlydElPIE1NSU8gI2RlZmluZS1zIHRvIHhlbi9p
bmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oDQo+IA0KPiBDaGFuZ2VzIFYxIC0+IFYyOg0KPiAgICAt
IHVwZGF0ZSB0aGUgYXV0aG9yIG9mIGEgcGF0Y2gNCj4gDQo+IENoYW5nZXMgVjIgLT4gVjM6DQo+
ICAgIC0gbm8gY2hhbmdlcw0KPiANCj4gQ2hhbmdlcyBWMyAtPiBWNDoNCj4gICAgLSBubyBjaGFu
Z2VzDQo+IA0KPiBDaGFuZ2VzIFY0IC0+IFY1Og0KPiAgICAtIHNwbGl0IHRoZSBjaGFuZ2VzLCBj
aGFuZ2UgdGhlIG9yZGVyIG9mIHRoZSBwYXRjaGVzDQo+ICAgIC0gZHJvcCBhbiBleHRyYSAidmly
dGlvIiBjb25maWd1cmF0aW9uIG9wdGlvbg0KPiAgICAtIHVwZGF0ZSBwYXRjaCBkZXNjcmlwdGlv
bg0KPiAgICAtIHVzZSBDT05UQUlORVJfT0YgaW5zdGVhZCBvZiBvd24gaW1wbGVtZW50YXRpb24N
Cj4gICAgLSByZXNlcnZlIHJhbmdlcyBmb3IgVmlydGlvIE1NSU8gcGFyYW1zIGFuZCBwdXQgdGhl
bQ0KPiAgICAgIGluIGNvcnJlY3QgbG9jYXRpb24NCj4gICAgLSBjcmVhdGUgaGVscGVycyB0byBh
bGxvY2F0ZSBWaXJ0aW8gTU1JTyBwYXJhbXMsIGFkZA0KPiAgICAgIGNvcnJlc3BvbmRpbmcgc2Fu
aXR5LdGBaGVja3MNCj4gICAgLSBhZGQgY29tbWVudCB3aHkgTU1JTyBzaXplIDB4MjAwIGlzIGNo
b3Nlbg0KPiAgICAtIHVwZGF0ZSBkZWJ1ZyBwcmludA0KPiAgICAtIGRyb3AgV2VpJ3MgVC1iDQo+
IA0KPiBDaGFuZ2VzIFY1IC0+IFY2Og0KPiAgICAtIHJlYmFzZSBvbiBjdXJyZW50IHN0YWdpbmcN
Cj4gLS0tDQo+ICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jICB8IDEzMQ0KPiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gIHhlbi9pbmNsdWRlL3B1Ymxp
Yy9hcmNoLWFybS5oIHwgICA3ICsrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMzYgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0
L2xpYnhsX2FybS5jIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9hcm0uYw0KPiBpbmRleCBlZWYx
ZGUwLi5kNDc1MjQ5IDEwMDY0NA0KPiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5j
DQo+ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMNCj4gQEAgLTgsNiArOCw1NiBA
QA0KPiAgI2luY2x1ZGUgPGFzc2VydC5oPg0KPiAgI2luY2x1ZGUgPHhlbi9kZXZpY2VfdHJlZV9k
ZWZzLmg+DQo+IA0KPiArLyoNCj4gKyAqIFRoZXJlIGlzIG5vIGNsZWFyIHJlcXVpcmVtZW50cyBm
b3IgdGhlIHRvdGFsIHNpemUgb2YgVmlydGlvIE1NSU8gcmVnaW9uLg0KPiArICogVGhlIHNpemUg
b2YgY29udHJvbCByZWdpc3RlcnMgaXMgMHgxMDAgYW5kIGRldmljZS1zcGVjaWZpYyBjb25maWd1
cmF0aW9uDQo+ICsgKiByZWdpc3RlcnMgc3RhcnRzIGF0IHRoZSBvZmZzZXQgMHgxMDAsIGhvd2V2
ZXIgaXQncyBzaXplIGRlcGVuZHMgb24gdGhlDQo+IGRldmljZQ0KPiArICogYW5kIHRoZSBkcml2
ZXIuIFBpY2sgdGhlIGJpZ2dlc3Qga25vd24gc2l6ZSBhdCB0aGUgbW9tZW50IHRvIGNvdmVyIG1v
c3QNCj4gKyAqIG9mIHRoZSBkZXZpY2VzIChhbHNvIGNvbnNpZGVyIGFsbG93aW5nIHRoZSB1c2Vy
IHRvIGNvbmZpZ3VyZSB0aGUgc2l6ZSB2aWENCj4gKyAqIGNvbmZpZyBmaWxlIGZvciB0aGUgb25l
IG5vdCBjb25mb3JtaW5nIHdpdGggdGhlIHByb3Bvc2VkIHZhbHVlKS4NCj4gKyAqLw0KPiArI2Rl
ZmluZSBWSVJUSU9fTU1JT19ERVZfU0laRSAgIHhlbl9ta191bGxvbmcoMHgyMDApDQo+ICsNCj4g
K3N0YXRpYyB1aW50NjRfdCB2aXJ0aW9fbW1pb19iYXNlOw0KPiArc3RhdGljIHVpbnQzMl90IHZp
cnRpb19tbWlvX2lycTsNCj4gKw0KPiArc3RhdGljIHZvaWQgaW5pdF92aXJ0aW9fbW1pb19wYXJh
bXModm9pZCkNCj4gK3sNCj4gKyAgICB2aXJ0aW9fbW1pb19iYXNlID0gR1VFU1RfVklSVElPX01N
SU9fQkFTRTsNCj4gKyAgICB2aXJ0aW9fbW1pb19pcnEgPSBHVUVTVF9WSVJUSU9fTU1JT19TUElf
RklSU1Q7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB1aW50NjRfdCBhbGxvY192aXJ0aW9fbW1pb19i
YXNlKGxpYnhsX19nYyAqZ2MpDQo+ICt7DQo+ICsgICAgdWludDY0X3QgYmFzZSA9IHZpcnRpb19t
bWlvX2Jhc2U7DQo+ICsNCj4gKyAgICAvKiBNYWtlIHN1cmUgd2UgaGF2ZSBlbm91Z2ggcmVzZXJ2
ZWQgcmVzb3VyY2VzICovDQo+ICsgICAgaWYgKCh2aXJ0aW9fbW1pb19iYXNlICsgVklSVElPX01N
SU9fREVWX1NJWkUgPg0KPiArICAgICAgICBHVUVTVF9WSVJUSU9fTU1JT19CQVNFICsgR1VFU1Rf
VklSVElPX01NSU9fU0laRSkpIHsNCj4gKyAgICAgICAgTE9HKEVSUk9SLCAiUmFuIG91dCBvZiBy
ZXNlcnZlZCByYW5nZSBmb3IgVmlydGlvIE1NSU8gQkFTRQ0KPiAweCUiUFJJeDY0IlxuIiwNCj4g
KyAgICAgICAgICAgIHZpcnRpb19tbWlvX2Jhc2UpOw0KPiArICAgICAgICByZXR1cm4gMDsNCj4g
KyAgICB9DQo+ICsgICAgdmlydGlvX21taW9fYmFzZSArPSBWSVJUSU9fTU1JT19ERVZfU0laRTsN
Cj4gKw0KPiArICAgIHJldHVybiBiYXNlOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdWludDMyX3Qg
YWxsb2NfdmlydGlvX21taW9faXJxKGxpYnhsX19nYyAqZ2MpDQo+ICt7DQo+ICsgICAgdWludDMy
X3QgaXJxID0gdmlydGlvX21taW9faXJxOw0KPiArDQo+ICsgICAgLyogTWFrZSBzdXJlIHdlIGhh
dmUgZW5vdWdoIHJlc2VydmVkIHJlc291cmNlcyAqLw0KPiArICAgIGlmICh2aXJ0aW9fbW1pb19p
cnEgPiBHVUVTVF9WSVJUSU9fTU1JT19TUElfTEFTVCkgew0KPiArICAgICAgICBMT0coRVJST1Is
ICJSYW4gb3V0IG9mIHJlc2VydmVkIHJhbmdlIGZvciBWaXJ0aW8gTU1JTyBJUlEgJXVcbiIsDQo+
ICsgICAgICAgICAgICB2aXJ0aW9fbW1pb19pcnEpOw0KPiArICAgICAgICByZXR1cm4gMDsNCj4g
KyAgICB9DQo+ICsgICAgdmlydGlvX21taW9faXJxKys7DQo+ICsNCj4gKyAgICByZXR1cm4gaXJx
Ow0KPiArfQ0KPiArDQo+ICBzdGF0aWMgY29uc3QgY2hhciAqZ2ljdl90b19zdHJpbmcobGlieGxf
Z2ljX3ZlcnNpb24gZ2ljX3ZlcnNpb24pDQo+ICB7DQo+ICAgICAgc3dpdGNoIChnaWNfdmVyc2lv
bikgew0KPiBAQCAtMjYsOCArNzYsOCBAQCBpbnQgbGlieGxfX2FyY2hfZG9tYWluX3ByZXBhcmVf
Y29uZmlnKGxpYnhsX19nYyAqZ2MsDQo+ICB7DQo+ICAgICAgdWludDMyX3QgbnJfc3BpcyA9IDA7
DQo+ICAgICAgdW5zaWduZWQgaW50IGk7DQo+IC0gICAgdWludDMyX3QgdnVhcnRfaXJxOw0KPiAt
ICAgIGJvb2wgdnVhcnRfZW5hYmxlZCA9IGZhbHNlOw0KPiArICAgIHVpbnQzMl90IHZ1YXJ0X2ly
cSwgdmlydGlvX2lycSA9IDA7DQo+ICsgICAgYm9vbCB2dWFydF9lbmFibGVkID0gZmFsc2UsIHZp
cnRpb19lbmFibGVkID0gZmFsc2U7DQo+IA0KPiAgICAgIC8qDQo+ICAgICAgICogSWYgcGwwMTEg
dnVhcnQgaXMgZW5hYmxlZCB0aGVuIGluY3JlbWVudCB0aGUgbnJfc3BpcyB0byBhbGxvdyBhbGxv
Y2F0aW9uDQo+IEBAIC0zOSw2ICs4OSwzNSBAQCBpbnQgbGlieGxfX2FyY2hfZG9tYWluX3ByZXBh
cmVfY29uZmlnKGxpYnhsX19nYyAqZ2MsDQo+ICAgICAgICAgIHZ1YXJ0X2VuYWJsZWQgPSB0cnVl
Ow0KPiAgICAgIH0NCj4gDQo+ICsgICAgLyoNCj4gKyAgICAgKiBWaXJ0aW8gTU1JTyBwYXJhbXMg
YXJlIG5vbi11bmlxdWUgYWNyb3NzIHRoZSB3aG9sZSBzeXN0ZW0gYW5kDQo+IG11c3QgYmUNCj4g
KyAgICAgKiBpbml0aWFsaXplZCBmb3IgZXZlcnkgbmV3IGd1ZXN0Lg0KPiArICAgICAqLw0KPiAr
ICAgIGluaXRfdmlydGlvX21taW9fcGFyYW1zKCk7DQo+ICsgICAgZm9yIChpID0gMDsgaSA8IGRf
Y29uZmlnLT5udW1fZGlza3M7IGkrKykgew0KPiArICAgICAgICBsaWJ4bF9kZXZpY2VfZGlzayAq
ZGlzayA9ICZkX2NvbmZpZy0+ZGlza3NbaV07DQo+ICsNCj4gKyAgICAgICAgaWYgKGRpc2stPnZp
cnRpbykgew0KPiArICAgICAgICAgICAgZGlzay0+YmFzZSA9IGFsbG9jX3ZpcnRpb19tbWlvX2Jh
c2UoZ2MpOw0KPiArICAgICAgICAgICAgaWYgKCFkaXNrLT5iYXNlKQ0KPiArICAgICAgICAgICAg
ICAgIHJldHVybiBFUlJPUl9GQUlMOw0KPiArDQo+ICsgICAgICAgICAgICBkaXNrLT5pcnEgPSBh
bGxvY192aXJ0aW9fbW1pb19pcnEoZ2MpOw0KPiArICAgICAgICAgICAgaWYgKCFkaXNrLT5pcnEp
DQo+ICsgICAgICAgICAgICAgICAgcmV0dXJuIEVSUk9SX0ZBSUw7DQo+ICsNCj4gKyAgICAgICAg
ICAgIGlmICh2aXJ0aW9faXJxIDwgZGlzay0+aXJxKQ0KPiArICAgICAgICAgICAgICAgIHZpcnRp
b19pcnEgPSBkaXNrLT5pcnE7DQo+ICsgICAgICAgICAgICB2aXJ0aW9fZW5hYmxlZCA9IHRydWU7
DQo+ICsNCj4gKyAgICAgICAgICAgIExPRyhERUJVRywgIkFsbG9jYXRlIFZpcnRpbyBNTUlPIHBh
cmFtcyBmb3IgVmRldiAlczogSVJRICV1DQo+IEJBU0UgMHglIlBSSXg2NCwNCj4gKyAgICAgICAg
ICAgICAgICBkaXNrLT52ZGV2LCBkaXNrLT5pcnEsIGRpc2stPmJhc2UpOw0KPiArICAgICAgICB9
DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgaWYgKHZpcnRpb19lbmFibGVkKQ0KPiArICAgICAgICBu
cl9zcGlzICs9ICh2aXJ0aW9faXJxIC0gMzIpICsgMTsNCj4gKw0KPiAgICAgIGZvciAoaSA9IDA7
IGkgPCBkX2NvbmZpZy0+Yl9pbmZvLm51bV9pcnFzOyBpKyspIHsNCj4gICAgICAgICAgdWludDMy
X3QgaXJxID0gZF9jb25maWctPmJfaW5mby5pcnFzW2ldOw0KPiAgICAgICAgICB1aW50MzJfdCBz
cGk7DQo+IEBAIC01OCw2ICsxMzcsMTMgQEAgaW50IGxpYnhsX19hcmNoX2RvbWFpbl9wcmVwYXJl
X2NvbmZpZyhsaWJ4bF9fZ2MgKmdjLA0KPiAgICAgICAgICAgICAgcmV0dXJuIEVSUk9SX0ZBSUw7
DQo+ICAgICAgICAgIH0NCj4gDQo+ICsgICAgICAgIC8qIFRoZSBzYW1lIGNoZWNrIGFzIGZvciB2
cGwwMTEgKi8NCj4gKyAgICAgICAgaWYgKHZpcnRpb19lbmFibGVkICYmDQo+ICsgICAgICAgICAg
IChpcnEgPj0gR1VFU1RfVklSVElPX01NSU9fU1BJX0ZJUlNUICYmIGlycSA8PSB2aXJ0aW9faXJx
KSkgew0KPiArICAgICAgICAgICAgTE9HKEVSUk9SLCAiUGh5c2ljYWwgSVJRICV1IGNvbmZsaWN0
aW5nIHdpdGggVmlydGlvIE1NSU8gSVJRDQo+IHJhbmdlXG4iLCBpcnEpOw0KPiArICAgICAgICAg
ICAgcmV0dXJuIEVSUk9SX0ZBSUw7DQo+ICsgICAgICAgIH0NCj4gKw0KPiAgICAgICAgICBpZiAo
aXJxIDwgMzIpDQo+ICAgICAgICAgICAgICBjb250aW51ZTsNCj4gDQo+IEBAIC03ODcsNiArODcz
LDM5IEBAIHN0YXRpYyBpbnQgbWFrZV92cGNpX25vZGUobGlieGxfX2djICpnYywgdm9pZCAqZmR0
LA0KPiAgICAgIHJldHVybiAwOw0KPiAgfQ0KPiANCj4gKw0KPiArc3RhdGljIGludCBtYWtlX3Zp
cnRpb19tbWlvX25vZGUobGlieGxfX2djICpnYywgdm9pZCAqZmR0LA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgYmFzZSwgdWludDMyX3QgaXJxKQ0KPiArew0K
PiArICAgIGludCByZXM7DQo+ICsgICAgZ2ljX2ludGVycnVwdCBpbnRyOw0KPiArICAgIC8qIFBs
YWNlaG9sZGVyIGZvciB2aXJ0aW9AICsgYSA2NC1iaXQgbnVtYmVyICsgXDAgKi8NCj4gKyAgICBj
aGFyIGJ1ZlsyNF07DQo+ICsNCj4gKyAgICBzbnByaW50ZihidWYsIHNpemVvZihidWYpLCAidmly
dGlvQCUiUFJJeDY0LCBiYXNlKTsNCj4gKyAgICByZXMgPSBmZHRfYmVnaW5fbm9kZShmZHQsIGJ1
Zik7DQo+ICsgICAgaWYgKHJlcykgcmV0dXJuIHJlczsNCj4gKw0KPiArICAgIHJlcyA9IGZkdF9w
cm9wZXJ0eV9jb21wYXQoZ2MsIGZkdCwgMSwgInZpcnRpbyxtbWlvIik7DQo+ICsgICAgaWYgKHJl
cykgcmV0dXJuIHJlczsNCj4gKw0KPiArICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9yZWdzKGdjLCBm
ZHQsIEdVRVNUX1JPT1RfQUREUkVTU19DRUxMUywNCj4gR1VFU1RfUk9PVF9TSVpFX0NFTExTLA0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEsIGJhc2UsIFZJUlRJT19NTUlPX0RFVl9T
SVpFKTsNCj4gKyAgICBpZiAocmVzKSByZXR1cm4gcmVzOw0KPiArDQo+ICsgICAgc2V0X2ludGVy
cnVwdChpbnRyLCBpcnEsIDB4ZiwgRFRfSVJRX1RZUEVfRURHRV9SSVNJTkcpOw0KPiArICAgIHJl
cyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGdjLCBmZHQsICZpbnRyLCAxKTsNCj4gKyAgICBp
ZiAocmVzKSByZXR1cm4gcmVzOw0KPiArDQo+ICsgICAgcmVzID0gZmR0X3Byb3BlcnR5KGZkdCwg
ImRtYS1jb2hlcmVudCIsIE5VTEwsIDApOw0KPiArICAgIGlmIChyZXMpIHJldHVybiByZXM7DQo+
ICsNCj4gKyAgICByZXMgPSBmZHRfZW5kX25vZGUoZmR0KTsNCj4gKyAgICBpZiAocmVzKSByZXR1
cm4gcmVzOw0KPiArDQo+ICsgICAgcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYXJjaF9pbmZvICpnZXRfYXJjaF9pbmZvKGxpYnhsX19nYyAqZ2MsDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgeGNf
ZG9tX2ltYWdlICpkb20pDQo+ICB7DQo+IEBAIC05ODgsNiArMTEwNyw3IEBAIHN0YXRpYyBpbnQg
bGlieGxfX3ByZXBhcmVfZHRiKGxpYnhsX19nYyAqZ2MsDQo+IGxpYnhsX2RvbWFpbl9jb25maWcg
KmRfY29uZmlnLA0KPiAgICAgIHNpemVfdCBmZHRfc2l6ZSA9IDA7DQo+ICAgICAgaW50IHBmZHRf
c2l6ZSA9IDA7DQo+ICAgICAgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmNvbnN0IGluZm8gPSAm
ZF9jb25maWctPmJfaW5mbzsNCj4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4gDQo+ICAgICAgY29u
c3QgbGlieGxfdmVyc2lvbl9pbmZvICp2ZXJzOw0KPiAgICAgIGNvbnN0IHN0cnVjdCBhcmNoX2lu
Zm8gKmFpbmZvOw0KPiBAQCAtMTA5NCw2ICsxMjE0LDEzIEBAIG5leHRfcmVzaXplOg0KPiAgICAg
ICAgICBpZiAoZF9jb25maWctPm51bV9wY2lkZXZzKQ0KPiAgICAgICAgICAgICAgRkRUKCBtYWtl
X3ZwY2lfbm9kZShnYywgZmR0LCBhaW5mbywgZG9tKSApOw0KPiANCj4gKyAgICAgICAgZm9yIChp
ID0gMDsgaSA8IGRfY29uZmlnLT5udW1fZGlza3M7IGkrKykgew0KPiArICAgICAgICAgICAgbGli
eGxfZGV2aWNlX2Rpc2sgKmRpc2sgPSAmZF9jb25maWctPmRpc2tzW2ldOw0KPiArDQo+ICsgICAg
ICAgICAgICBpZiAoZGlzay0+dmlydGlvKQ0KPiArICAgICAgICAgICAgICAgIEZEVCggbWFrZV92
aXJ0aW9fbW1pb19ub2RlKGdjLCBmZHQsIGRpc2stPmJhc2UsIGRpc2stPmlycSkgKTsNCj4gKyAg
ICAgICAgfQ0KPiArDQo+ICAgICAgICAgIGlmIChwZmR0KQ0KPiAgICAgICAgICAgICAgRkRUKCBj
b3B5X3BhcnRpYWxfZmR0KGdjLCBmZHQsIHBmZHQpICk7DQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0u
aA0KPiBpbmRleCA5NGIzMTUxLi42ZGM1NWRmIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS9w
dWJsaWMvYXJjaC1hcm0uaA0KPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaA0K
PiBAQCAtMzk4LDYgKzM5OCwxMCBAQCB0eXBlZGVmIHVpbnQ2NF90IHhlbl9jYWxsYmFja190Ow0K
PiANCj4gIC8qIFBoeXNpY2FsIEFkZHJlc3MgU3BhY2UgKi8NCj4gDQo+ICsvKiBWaXJ0aW8gTU1J
TyBtYXBwaW5ncyAqLw0KPiArI2RlZmluZSBHVUVTVF9WSVJUSU9fTU1JT19CQVNFICAgeGVuX21r
X3VsbG9uZygweDAyMDAwMDAwKQ0KPiArI2RlZmluZSBHVUVTVF9WSVJUSU9fTU1JT19TSVpFICAg
eGVuX21rX3VsbG9uZygweDAwMTAwMDAwKQ0KPiArDQo+ICAvKg0KPiAgICogdkdJQyBtYXBwaW5n
czogT25seSBvbmUgc2V0IG9mIG1hcHBpbmcgaXMgdXNlZCBieSB0aGUgZ3Vlc3QuDQo+ICAgKiBU
aGVyZWZvcmUgdGhleSBjYW4gb3ZlcmxhcC4NCj4gQEAgLTQ4NCw2ICs0ODgsOSBAQCB0eXBlZGVm
IHVpbnQ2NF90IHhlbl9jYWxsYmFja190Ow0KPiANCj4gICNkZWZpbmUgR1VFU1RfVlBMMDExX1NQ
SSAgICAgICAgMzINCj4gDQo+ICsjZGVmaW5lIEdVRVNUX1ZJUlRJT19NTUlPX1NQSV9GSVJTVCAg
IDMzDQo+ICsjZGVmaW5lIEdVRVNUX1ZJUlRJT19NTUlPX1NQSV9MQVNUICAgIDQzDQo+ICsNCj4g
IC8qIFBTQ0kgZnVuY3Rpb25zICovDQo+ICAjZGVmaW5lIFBTQ0lfY3B1X3N1c3BlbmQgMA0KPiAg
I2RlZmluZSBQU0NJX2NwdV9vZmYgICAgIDENCj4gLS0NCj4gMi43LjQNCj4gDQoNCltKaWFtZWkg
WGllXSANCkl0IHdvcmtzIGZpbmUgYXMgYmVmb3JlLg0KDQpUZXN0ZWQtYnk6IEppYW1laSBYaWUg
PEppYW1laS54aWVAYXJtLmNvbT4NCg0KQmVzdCB3aXNoZXMNCkppYW1laSBYaWUNCg0KDQo=

