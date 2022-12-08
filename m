Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2255664672F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 03:44:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456760.714575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p36sZ-0004a5-VW; Thu, 08 Dec 2022 02:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456760.714575; Thu, 08 Dec 2022 02:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p36sZ-0004XA-SU; Thu, 08 Dec 2022 02:43:19 +0000
Received: by outflank-mailman (input) for mailman id 456760;
 Thu, 08 Dec 2022 02:43:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R/A3=4G=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p36sX-0004Gw-QW
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 02:43:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 112e4f00-76a2-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 03:43:17 +0100 (CET)
Received: from AM5PR1001CA0020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::33)
 by DB9PR08MB8484.eurprd08.prod.outlook.com (2603:10a6:10:3d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 02:43:13 +0000
Received: from VI1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::66) by AM5PR1001CA0020.outlook.office365.com
 (2603:10a6:206:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Thu, 8 Dec 2022 02:43:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT041.mail.protection.outlook.com (100.127.145.15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.16 via Frontend Transport; Thu, 8 Dec 2022 02:43:12 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Thu, 08 Dec 2022 02:43:12 +0000
Received: from c0b548fb4f1d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 13A13E75-0CE1-4CA2-A88B-08857E2C80C5.1; 
 Thu, 08 Dec 2022 02:43:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0b548fb4f1d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Dec 2022 02:43:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9462.eurprd08.prod.outlook.com (2603:10a6:10:42e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Thu, 8 Dec
 2022 02:43:04 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%8]) with mapi id 15.20.5880.011; Thu, 8 Dec 2022
 02:43:04 +0000
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
X-Inumbo-ID: 112e4f00-76a2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBPTVFzLQrfS4xhhW6TWMwFY4/05ykZBU1XbPVbqd/A=;
 b=SBGQiPtYg4szPwwOvnNok9ZDh4n80sl7ufjDTgi9PeaROi/496z2FmOK+7VofR4ftPu9rZW11K23StTBV4tuzAajsy6KcpANDn5RSZWU9cS4EKn1p0Sqt3+igMIJn0v36jWeo6xKlQDV4ubB6ddng2GmTHv2GdSt4iadMEGjsxQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/xf3EVbR9NGtgJbWpffeI8H++bKE6V4x19QOk5ganoHe+F5mkeiimwdYo+orZQ5Y2SfyGQSPffroi+UMjcYH2EwikJSI81JIHsJLj+u45NDYw22kgvakXcqHmdUe3qqe4uxtR9GNPchnWbpBR+6W563VkPKRgi11qvvK2j+CyJIu+kDKThPz+ErK85FE226HzBra3fp5vmOZ2X2d3zRYbwbo/g+hRFcw2zL3s43Pb37/eJgYnv5D6ZWIdz1eXP4P5QRURtG7JJ/FX2rGzADlNdvns0s+e8qd6rARIIxvcXmY8ZIkIgUYcG7ANaZNRl0g8fQ5HG4n+PbCIGu64JNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBPTVFzLQrfS4xhhW6TWMwFY4/05ykZBU1XbPVbqd/A=;
 b=iNXDjhygLm5Y2RVA9cO7qlEYPkhdPq3q+3bDQpudGZhsQXh+8IjvWBAWdHSw/8mBQYKzuzk922viYkdsNy8lLwAM6NYBxilXviHlSwWGiRrnlELAk/rNU2EhnswDkY/N722DSM/oI8wLF7TtFUTA9eDFQxib9s+VKeoPInG7kUcFfpdjaPaUtGKshFQmmmNuB/ITc20pgycd1EICvE+lBW1vo2xJ8r0cO8LNZ5GlGBKvUQVG4h58NKeFIIfZ8wzicgVmEujAnpKG484JPupq0VTawVCn5SEY4tzgLgMxplnLPC5+hm8DE/PVNgjW0OKEb5rvfdzc8M5tGUrvhXMMdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBPTVFzLQrfS4xhhW6TWMwFY4/05ykZBU1XbPVbqd/A=;
 b=SBGQiPtYg4szPwwOvnNok9ZDh4n80sl7ufjDTgi9PeaROi/496z2FmOK+7VofR4ftPu9rZW11K23StTBV4tuzAajsy6KcpANDn5RSZWU9cS4EKn1p0Sqt3+igMIJn0v36jWeo6xKlQDV4ubB6ddng2GmTHv2GdSt4iadMEGjsxQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Community Manager
	<community.manager@xenproject.org>
Subject: RE: [PATCH v6 0/2] Final changelog changes for 4.17
Thread-Topic: [PATCH v6 0/2] Final changelog changes for 4.17
Thread-Index: AQHZBXmOXDTsmT5y6EunF6VB79BAYa5i5rKAgABrV3A=
Date: Thu, 8 Dec 2022 02:43:04 +0000
Message-ID:
 <AS8PR08MB7991085586E1E5D127BD0F74921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221201113910.1984744-1-Henry.Wang@arm.com>
 <7724f0e2-4e38-9c49-b49b-16df28743d8a@xen.org>
In-Reply-To: <7724f0e2-4e38-9c49-b49b-16df28743d8a@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C48D207F3F399D4B948E37B0E4E7E6AE.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9462:EE_|VI1EUR03FT041:EE_|DB9PR08MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd70954-80cd-4539-1229-08dad8c5f340
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bcapkoq0nBny7Aw8rDHrebSlOFG9m+HvVgc1StztovVS09mgHPsZRJpKJ2nPrJxkCuSnT/YQx+g0hApn5AZdkcL2aHfgKgOJ881dGlmIen6fa1oRdlgyqPO1CK9vC8dm48Z85H+JzX4u/mRBe2B1MsQuDHagmIpZEofFdztpHgguyM/Q+CeTFMb+lt7uSik2+FcYpsbfJ6mVSl4RcyvXfkY5b7ki//DC3XR41KentYKh15OMeXpapBGHGdLXWUwKpWFLL0GKRthaNpvTiO1wAqGSHMxxNd4ocs+g+Neyeq0rLcdlashOx6KEKfFRgUzRzGvTku+OaJ5wiwHFsyMuOAuGEj5SAwGOeZfrhzVLgYORCbaPqaR5mZMX6o+N/G+cZp1aEqFkifG3x6lcju8iof4FLg73mISqdxrxsZSTLS511+e3U1hBAxBOikT19T4yRPFwKPqTS26+R4Yu1UeRHA/pbXzdGU5JtVbtUOkusrhtqDZX5VMC3NaDSvw0/7EfgOe7ojhtPEOQBQe+Zi1rjq7ums9syx1NqmWOqVM3fQg6uE8MMGcvS3d4cLapcd0/LxyGeiMgfoojGaG4XZ8DTZGi5wwddOZ8DpFf8DIyxDhBLv7PJq0ELRU1ty7wyw50ZRlieYxllIOO7cu+dF9sQySEAgAltkPDTQFZHsZeisYzHfi5bztT8u5RfnmWey2nwXQSSImOJlEi4WWqiGwneagoQhIWX7YoSzQRblxruGQyQf97VOhagLkbE/v2BPst+95CDzF8JeCIFlDVGvCvdTkSAXYBu20AZo+6bpg74xH7KRhRe766NjjaQGYteu4C
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(9686003)(7696005)(26005)(2906002)(966005)(53546011)(6506007)(86362001)(54906003)(38100700002)(55016003)(52536014)(83380400001)(5660300002)(33656002)(110136005)(8936002)(316002)(186003)(71200400001)(66556008)(66946007)(66476007)(66446008)(76116006)(478600001)(4326008)(8676002)(64756008)(38070700005)(41300700001)(122000001)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9462
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0389992d-2feb-46bf-6448-08dad8c5ee32
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gK0N3yePnGOAkBrqJJ3Rhzf13R9XnF2QbvkEsCiGUYyerr9Hl+HTJUwjcpVAzIzvdtg4jgEGqeQ9HxEYbcfY2eDVubXdVRpMJnI0AwUoKcAj+7HSGnkquxc3T+9i6k7349InSR2nBDKwrsav5r1w4f8AAfG9yWrzy3hpZ7iqsBlIP0WL/jvjQQKRkGIOzGfwnPRSm2KykK1PHozBpa+E5XzMmlxvqR+7eNQgeoRDj0dGS7zwzgFuJ+1wXqntpJlDEkNEZagYAdwpLCXfVmG7nIaYVLwdz/YsqFJS9gWsqXj+wvvrAczmEvtIwgfUAjxQz1/GSF7MzSrjwlfGmCd9Z+SRrN64JMVsA1UQIX+d9xU663PRjdLCiLSDxiHioltzZkILrFV73mgC6aSekT/RhyBXg45meJ0diLIZbSPaGJEYKP9WhXJ0IElSCnyedU78txgXUzmi9tKwkyuZ4i4FMTii3vjHpw3DCCLB6pfupeOElIS3Vez9jFEBWnhD1kHYEkI0PweMl+4o66Z6aF7AvI+KG+MoH1H7MNobJicjBCbs8bCbKfJ+OTaHw5uGooQcb6XI/xF4JKt3HugMWI/Va0Q5KMjXdmoZd9CpUm7Jp20BIEwSMkGPl5NAGahPXOH+kd6gvuxx7d1lLmGUL/em9Rp6QcZzUe5W8dOIfRE3g5QMBkVniV1lozm1miLAw6RWhO11oca9YsjpwgMwVs5jGXAeoke9OsbnJChq35tzlQ/UUOSCI9QtckffsP+nsPHDxGC0NsdY7P0gTyqUbhHrrpZgWWk37ZB0heQrAtjuWvYKiSx8IIwbeMcgFkP5EtPl
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(316002)(54906003)(110136005)(36860700001)(478600001)(2906002)(40480700001)(966005)(70206006)(6506007)(8676002)(70586007)(26005)(83380400001)(4326008)(7696005)(9686003)(186003)(41300700001)(81166007)(336012)(356005)(47076005)(86362001)(40460700003)(5660300002)(52536014)(55016003)(82310400005)(53546011)(8936002)(33656002)(82740400003)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 02:43:12.6472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd70954-80cd-4539-1229-08dad8c5f340
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8484

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjYgMC8yXSBGaW5hbCBjaGFuZ2Vsb2cgY2hhbmdlcyBmb3IgNC4xNw0KPiANCj4g
SGksDQo+IA0KPiBPbiAwMS8xMi8yMDIyIDExOjM5LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+IEhp
IGFsbCwNCj4gPg0KPiA+IFRoZXNlIHR3byBwYXRjaGVzIHNob3VsZCBiZSB0aGUgZmluYWwgY2hh
bmdlbG9nIGNoYW5nZXMgZm9yIDQuMTcuDQo+ID4NCj4gPiBUaGUgZmlyc3QgcGF0Y2ggc2V0cyB0
aGUgcmVsZWFzZSBkYXRlIGFuZCB0YWcgb2YgNC4xNyByZWxlYXNlIGFuZA0KPiA+IHNob3VsZCBi
ZSAiYmFja3BvcnRlZCIgdG8gdGhlIHN0YWdpbmcvc3RhYmxlLTQuMTcuDQo+ID4NCj4gPiBUaGUg
c2Vjb25kIHBhdGNoIHN0YXJ0cyBhIG5ldyB1bnN0YWJsZSBzZWN0aW9uLCBzbyBzaG91bGQgYmUg
aW4NCj4gPiB1bnN0YWJsZSBtYXN0ZXIvc3RhZ2luZyBvbmx5Lg0KPiA+DQo+ID4gVGhhbmtzLg0K
PiA+DQo+ID4gSGVucnkNCj4gPg0KPiA+IEhlbnJ5IFdhbmcgKDIpOg0KPiA+ICAgIENIQU5HRUxP
RzogU2V0IDQuMTcgcmVsZWFzZSBkYXRlIGFuZCB0YWcNCj4gPiAgICBDSEFOR0VMT0c6IFN0YXJ0
IG5ldyAidW5zdGFibGUiIHNlY3Rpb24NCj4gDQo+IEkgaGF2ZSBjb21taXR0ZWQgdGhlIHR3byB0
byBzdGFnaW5nIGFuZCBvbmx5IHRoZSBmaXJzdCBvbmUgdG8gc3RhZ2luZy00LjE3Lg0KPiANCj4g
SSBoYXZlIGFsc28gdGFnZ2VkIGFsbCBRRU1VLXRyYWQsIFFFTVUgYW5kIE1pbmktT1MgdHJlZSBp
biBwcmVwYXJhdGlvbg0KPiBmb3IgdGhlIHJlbGVhc2UuDQoNClRoYW5rIHlvdSBzbyBtdWNoIGZv
ciB5b3VyIHRpbWUgYW5kIGVmZm9ydCBpbiBkb2luZyB0aGVzZS4NCg0KPiANCj4gVGhlIFhlbiB0
cmVlIG9ubHkgbmVlZCB0aGUgcGF0Y2ggWzFdIGFuZCB0aGVuIEkgY2FuIHRhZyBhZnRlciBhIGxh
c3QNCj4gcHVzaCB0byBzdGFibGUuDQoNCkkgZ2F2ZSBteSByZWxlYXNlLWFjayBpbiBjYXNlIHlv
dSBuZWVkIGl0Lg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0K
PiBbMV0NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjIxMjA3MTk1OTA3
LjIzNjA2LTEtDQo+IGp1bGllbkB4ZW4ub3JnL1QvI3UNCj4gDQo+IA0KPiAtLQ0KPiBKdWxpZW4g
R3JhbGwNCg0K

