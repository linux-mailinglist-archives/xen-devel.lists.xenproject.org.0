Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F14450554
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 14:24:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225912.390244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmbxX-00011Z-RK; Mon, 15 Nov 2021 13:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225912.390244; Mon, 15 Nov 2021 13:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmbxX-0000z5-N2; Mon, 15 Nov 2021 13:23:43 +0000
Received: by outflank-mailman (input) for mailman id 225912;
 Mon, 15 Nov 2021 13:23:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z40d=QC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mmbxV-0000yj-Q5
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 13:23:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3df339a0-4617-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 14:23:39 +0100 (CET)
Received: from AM6PR08CA0014.eurprd08.prod.outlook.com (2603:10a6:20b:b2::26)
 by VI1PR08MB4446.eurprd08.prod.outlook.com (2603:10a6:803:fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 13:23:34 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::cf) by AM6PR08CA0014.outlook.office365.com
 (2603:10a6:20b:b2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Mon, 15 Nov 2021 13:23:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Mon, 15 Nov 2021 13:23:34 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Mon, 15 Nov 2021 13:23:34 +0000
Received: from e6e10de3a365.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AD29F369-6E0C-40B2-B3C7-808CEA599E2B.1; 
 Mon, 15 Nov 2021 13:23:28 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e6e10de3a365.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Nov 2021 13:23:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6072.eurprd08.prod.outlook.com (2603:10a6:20b:296::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 13:23:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 13:23:24 +0000
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
X-Inumbo-ID: 3df339a0-4617-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtTxbtnCB2KB/902wzp+iv0ZDTex8678qXIJkh4APrw=;
 b=Hp4w7KZQ7QyQrdFjJgCoIeZg4Y7Vc/GJH/9EPMDBbwqhMAn2JlV+b/zo+UvfWzrxVL2M4TjRfxWPPqxI8fCNkEUCz8lvaET6kwIAN+3eYYFJdN7oTJ7jvRUWH4ZoM41AJR71MeGAoLlsxtdWS6ZaWwrqSS7VmQyZzFqoc2CFci8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 61ffe66cb9152273
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbQkG965492pcFqUvt1aTc9v5hI2D60PfDRuozTYl7BfcqUU1g3pNrIgub02yyhfXguSlcZnBIJPMX6MjuCGuJ7kl0sj8VY2tkupYRHhaGSn/HFO1YZfviqpkdkdny3lVLyeGZB5izqAH3lFptWzerrPONixgauwpIeEE9Q6b0IClkPdzIZcJb9vZSXcd45nO8hnDGos48e508OHoG159awlZ6J8lx4AvXlCoOyAud1NhWFhW9GUCOZfpI/RyiJj7dwWyRwWgG0RytTjRAw/orUji4PTDAYYTn1eLVzgw5sBgvPBhNc0MCQ1Etd9IHn80gP6jyaSb7muom9e+avdgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtTxbtnCB2KB/902wzp+iv0ZDTex8678qXIJkh4APrw=;
 b=Hyu9Pu0IwbdfcYM08ozGlY6YeNpopESh5SREzm70YoEps/Yoys+NUJPz5I3rWe8+fXa1we6/AfkjaO+YttFhZHRdLGPRP8XkgCXqKthL5BbO0d2CCOQoQyKTFfC5NP6jsmaWAF/W7y3BRhkJdPI3xh2jGuHxJdtsQSv1eE0vqDTMMyDjpT4DEj1/60aIhPa1qinPCqiSzcRcVJ1HVQooizizper1Q14gLY5pWM9tug/B6SPmdrj0oBHBTwOlaxerTp9RDLYhF1hR4rfusQdQX4KZtnKqiXy0DrOmLHPzWSjoqT0IWYzqoNHALS8BMYO+g6w8sCq2y/ftO1QhF6f5Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtTxbtnCB2KB/902wzp+iv0ZDTex8678qXIJkh4APrw=;
 b=Hp4w7KZQ7QyQrdFjJgCoIeZg4Y7Vc/GJH/9EPMDBbwqhMAn2JlV+b/zo+UvfWzrxVL2M4TjRfxWPPqxI8fCNkEUCz8lvaET6kwIAN+3eYYFJdN7oTJ7jvRUWH4ZoM41AJR71MeGAoLlsxtdWS6ZaWwrqSS7VmQyZzFqoc2CFci8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH for-4.16 1/4] domctl: introduce a macro to set the grant
 table max version
Thread-Topic: [PATCH for-4.16 1/4] domctl: introduce a macro to set the grant
 table max version
Thread-Index: AQHX2hrekOwfuxb0lUKAubErloiStawEk7kA
Date: Mon, 15 Nov 2021 13:23:24 +0000
Message-ID: <592D3B64-E0FC-44BC-8438-7034DACA88BD@arm.com>
References: <20211115121741.3719-1-roger.pau@citrix.com>
 <20211115121741.3719-2-roger.pau@citrix.com>
In-Reply-To: <20211115121741.3719-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f47a1984-d4d1-45f4-0dd1-08d9a83b202d
x-ms-traffictypediagnostic: AS8PR08MB6072:|VI1PR08MB4446:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB44466C0C4509AB64F24054379D989@VI1PR08MB4446.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c9yaM0OPIjBqHBF/klGSumxoqkAclzkXngad2IaTxdRvaqHacKC/EOYHfNR2lU+E9GXCjpYfKa3HJadUJvoHY4PQ9/Hq2utmWoNkVXFaVQTf6uy5OGU0l99LwD8sM4SJbK12esbZAuFpnvRk59XZtSHBiki3VByX2rte4WCs6n6KhjpE+EAUP7EVyTcf1gXbjs1aSJ9wHGVDabi92hNI19joswSPViRHhpSleeIXEQsfXNcnppOn4n13c1RARAy+jjQitQ2S+rqepluGTEK6COiwHoCOzuTKzw5Pu81XuCHylk6tj1XwBpT3AxIoOzkrV/OIfqxBWRsTy4c5HJdwcuPt0iLljWQjkiyU7cc+kW/WQyNLgw6lkaXefjGrqvanWl+SLyBt11KTTuoH6s1KGwUD9zQH2g3SWdngv4TC5TRPm5nvtqmgHLAi/po49TfnhlwLBloUfvY5Aekz4w7BN0o2spMZqj2bNliwwygCSG/oAx3F79e9ByUIHAXxyIPOxreOG8CJRzki/4VYGjCRgmBleOnJIQiwCgErnAfvkT0FB2FYUfH5DLXMRx6tBc6ccXcyj+Wz8nSZi6CFQiRUQCyg97JWGJcfdODrf7C/UpBmdY61grkH7sedtn02EmKfykuzL77nssEQVG/O5M5Wi22sDwrdtuCz+OKiulmdHitLV4MQgXr45n2UrC7C8xGsebxjiKw6m+UlWglG4uF4Rvy7Vr0VYgCSKj9VODRBCRK9snMIppEQt6kMCmSSVqBP
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(91956017)(54906003)(71200400001)(8936002)(64756008)(66446008)(76116006)(86362001)(66946007)(2616005)(316002)(66556008)(66476007)(6916009)(6506007)(53546011)(5660300002)(4326008)(2906002)(7416002)(8676002)(38070700005)(36756003)(83380400001)(186003)(38100700002)(508600001)(122000001)(6486002)(26005)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C3532723E9FC147A4F0E77DD4DE19B9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6072
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dadc2083-6134-4897-6e42-08d9a83b1a46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gwMBp1MNNb3+9COv1yNlfvJeSJ+TZAtejdq/mSbpZ9DrGbryoF1rG/nNbrzDW+UBebrdQf5SCq9FxqXv20Zm7jdlX6iTh9LagNF2Kt6uJ0gjPoDgBTqBR1CAPs9JsxMGdsvisk8L6xAZxpCgVDBFayyMRXj7n6KRckz5H2KzMH58DNpI8bhxLV9pZ5Y0oa7XPv3ZLJaE37MFtGc0sE2wMUru37f5G4f3nnzuITJ1Uq7AOcot7+qdcYfh/nsh8Ps3teYaWBI8Auyyrnd/nLzJ6ozQYq0gJckyypfvcIBAc+J5WKwvg1sRAB27zzPSgvZiM8QkM2eWL+ToZRGxriaY87z/M7AaRQbcVhi4jgi32suLF+Nz66twBAMIPsFQJ60m/uCxbnriPk5BF0V32aObbSGtzK+BVnvsv0g7rM/rwHk0ihdmO/5XkA4ttQr5qRSegHb4Hp2VHhPSQ15ji0pT/E+F25i/FhppWnC4jM9gyz2hSkCMLgOsC8EeA+9nT4NXyvewetiKWOa5No08Z8d+Nrxg/Zac9XaucIQa51901IV5sJ/gVXnpmX5Q4+zciRtf7gMncsus3cjWhcDF1ltXOGmJiQzqDk8JdxfRsQVFTQbG2JMq1YyIbmP6ZVdsOX9192b0Pt11FwDvJUQ0ZFTH9nuUY3GI7GF6xkHc/QPHU7dtKE6r3PhrPW6CEuQNuwb2JyuRvxOF2CoZNaDWmZ4ZgA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(81166007)(6506007)(53546011)(2616005)(336012)(6512007)(83380400001)(5660300002)(8676002)(356005)(86362001)(6486002)(36756003)(47076005)(8936002)(33656002)(82310400003)(508600001)(70586007)(70206006)(2906002)(54906003)(6862004)(26005)(316002)(4326008)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 13:23:34.4906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f47a1984-d4d1-45f4-0dd1-08d9a83b202d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4446

SGkgUm9nZXIsDQoNCj4gT24gMTUgTm92IDIwMjEsIGF0IDEyOjE3LCBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFN1Y2ggbWFjcm8ganVzdCBjbGFt
cHMgdGhlIHBhc3NlZCB2ZXJzaW9uIHRvIGZpdCBpbiB0aGUgZGVzaWduYXRlZA0KPiBiaXRzIG9m
IHRoZSBkb21jdGwgZmllbGQuIFRoZSBtYWluIHB1cnBvc2UgaXMgdG8gbWFrZSBpdCBjbGVhcmVy
IGluDQo+IHRoZSBjb2RlIHdoZW4gbWF4IGdyYW50IHZlcnNpb24gaXMgYmVpbmcgc2V0IGluIHRo
ZSBncmFudF9vcHRzIGZpZWxkLg0KPiANCj4gRXhpc3RpbmcgdXNlcnMgdGhhdCB3aGVyZSBzZXR0
aW5nIHRoZSB2ZXJzaW9uIGluIHRoZSBncmFudF9vcHRzIGZpZWxkDQo+IGFyZSBzd2l0Y2hlZCB0
byB1c2UgdGhlIG1hY3JvLg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuDQo+
IA0KPiBSZXF1ZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClJl
dmlld2VkLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQoN
CkNoZWVycw0KQmVydHJhbmQNCg0KPiAtLS0NCj4gQ2M6IElhbiBKYWNrc29uIDxpd2pAeGVucHJv
amVjdC5vcmc+DQo+IA0KPiBHaXZlbiBpdCdzIGEgbm9uIGZ1bmN0aW9uYWwgY2hhbmdlIChvciBh
dCBsZWFzdCB0aGF0J3MgdGhlIGludGVudGlvbikNCj4gaXQgc2hvdWxkbid0IGhhdmUgYW55IGlt
cGFjdCBvbiB0aGUgcmVsZWFzZSwgaXQncyBqdXN0IHN5bnRhY3RpYw0KPiBzdWdhci4NCj4gLS0t
DQo+IHRvb2xzL2hlbHBlcnMvaW5pdC14ZW5zdG9yZS1kb21haW4uYyB8IDIgKy0NCj4gdG9vbHMv
bGlicy9saWdodC9saWJ4bF9jcmVhdGUuYyAgICAgIHwgMiArLQ0KPiB0b29scy9vY2FtbC9saWJz
L3hjL3hlbmN0cmxfc3R1YnMuYyAgfCAzICsrLQ0KPiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMgICAgICAgICAgfCA0ICsrLS0NCj4geGVuL2FyY2gveDg2L3NldHVwLmMgICAgICAgICAgICAg
ICAgIHwgMiArLQ0KPiB4ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggICAgICAgICAgfCAxICsN
Cj4gNiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRvbWFpbi5jIGIvdG9v
bHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRvbWFpbi5jDQo+IGluZGV4IDYwNDY5MTYxYmQuLmIy
MDVhNzllZTYgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2hlbHBlcnMvaW5pdC14ZW5zdG9yZS1kb21h
aW4uYw0KPiArKysgYi90b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMNCj4gQEAg
LTg5LDcgKzg5LDcgQEAgc3RhdGljIGludCBidWlsZCh4Y19pbnRlcmZhY2UgKnhjaCkNCj4gICAg
ICAgICAgKi8NCj4gICAgICAgICAubWF4X2dyYW50X2ZyYW1lcyA9IDQsDQo+ICAgICAgICAgLm1h
eF9tYXB0cmFja19mcmFtZXMgPSAxMjgsDQo+IC0gICAgICAgIC5ncmFudF9vcHRzID0gMSwNCj4g
KyAgICAgICAgLmdyYW50X29wdHMgPSBYRU5fRE9NQ1RMX0dSQU5UX3ZlcnNpb24oMSksDQo+ICAg
ICB9Ow0KPiANCj4gICAgIHhzX2ZkID0gb3BlbigiL2Rldi94ZW4veGVuYnVzX2JhY2tlbmQiLCBP
X1JEV1IpOw0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9jcmVhdGUuYyBi
L3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfY3JlYXRlLmMNCj4gaW5kZXggYjY4NTVjN2I0Ni4uZGNk
MDlkMzJiYSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9jcmVhdGUuYw0K
PiArKysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX2NyZWF0ZS5jDQo+IEBAIC02MjksNyArNjI5
LDcgQEAgaW50IGxpYnhsX19kb21haW5fbWFrZShsaWJ4bF9fZ2MgKmdjLCBsaWJ4bF9kb21haW5f
Y29uZmlnICpkX2NvbmZpZywNCj4gICAgICAgICAgICAgLm1heF9ldnRjaG5fcG9ydCA9IGJfaW5m
by0+ZXZlbnRfY2hhbm5lbHMsDQo+ICAgICAgICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gYl9p
bmZvLT5tYXhfZ3JhbnRfZnJhbWVzLA0KPiAgICAgICAgICAgICAubWF4X21hcHRyYWNrX2ZyYW1l
cyA9IGJfaW5mby0+bWF4X21hcHRyYWNrX2ZyYW1lcywNCj4gLSAgICAgICAgICAgIC5ncmFudF9v
cHRzID0gYl9pbmZvLT5tYXhfZ3JhbnRfdmVyc2lvbiwNCj4gKyAgICAgICAgICAgIC5ncmFudF9v
cHRzID0gWEVOX0RPTUNUTF9HUkFOVF92ZXJzaW9uKGJfaW5mby0+bWF4X2dyYW50X3ZlcnNpb24p
LA0KPiAgICAgICAgICAgICAudm10cmFjZV9zaXplID0gUk9VTkRVUChiX2luZm8tPnZtdHJhY2Vf
YnVmX2tiIDw8IDEwLCBYQ19QQUdFX1NISUZUKSwNCj4gICAgICAgICB9Ow0KPiANCj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jIGIvdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsX3N0dWJzLmMNCj4gaW5kZXggZWNhMGI4YjMzNC4uNWI0ZmU3MmM4ZCAx
MDA2NDQNCj4gLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMNCj4gKysr
IGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMNCj4gQEAgLTE5OSw3ICsxOTks
OCBAQCBDQU1McHJpbSB2YWx1ZSBzdHViX3hjX2RvbWFpbl9jcmVhdGUodmFsdWUgeGNoLCB2YWx1
ZSB3YW50ZWRfZG9taWQsIHZhbHVlIGNvbmZpZw0KPiAJCS5tYXhfZXZ0Y2huX3BvcnQgPSBJbnRf
dmFsKFZBTF9NQVhfRVZUQ0hOX1BPUlQpLA0KPiAJCS5tYXhfZ3JhbnRfZnJhbWVzID0gSW50X3Zh
bChWQUxfTUFYX0dSQU5UX0ZSQU1FUyksDQo+IAkJLm1heF9tYXB0cmFja19mcmFtZXMgPSBJbnRf
dmFsKFZBTF9NQVhfTUFQVFJBQ0tfRlJBTUVTKSwNCj4gLQkJLmdyYW50X29wdHMgPSBJbnRfdmFs
KFZBTF9NQVhfR1JBTlRfVkVSU0lPTiksDQo+ICsJCS5ncmFudF9vcHRzID0NCj4gKwkJICAgIFhF
Tl9ET01DVExfR1JBTlRfdmVyc2lvbihJbnRfdmFsKFZBTF9NQVhfR1JBTlRfVkVSU0lPTikpLA0K
PiAJfTsNCj4gDQo+IAlkb21haW5faGFuZGxlX29mX3V1aWRfc3RyaW5nKGNmZy5oYW5kbGUsIFN0
cmluZ192YWwoVkFMX0hBTkRMRSkpOw0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+IGluZGV4IDE5NDg3Yzc5
ZGEuLmQwMmJhY2JjZDEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
Yw0KPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gQEAgLTI5ODYsNyArMjk4
Niw3IEBAIHZvaWQgX19pbml0IGNyZWF0ZV9kb21Vcyh2b2lkKQ0KPiAgICAgICAgICAgICAubWF4
X2V2dGNobl9wb3J0ID0gLTEsDQo+ICAgICAgICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gLTEs
DQo+ICAgICAgICAgICAgIC5tYXhfbWFwdHJhY2tfZnJhbWVzID0gLTEsDQo+IC0gICAgICAgICAg
ICAuZ3JhbnRfb3B0cyA9IG9wdF9nbnR0YWJfbWF4X3ZlcnNpb24sDQo+ICsgICAgICAgICAgICAu
Z3JhbnRfb3B0cyA9IFhFTl9ET01DVExfR1JBTlRfdmVyc2lvbihvcHRfZ250dGFiX21heF92ZXJz
aW9uKSwNCj4gICAgICAgICB9Ow0KPiANCj4gICAgICAgICBpZiAoICFkdF9kZXZpY2VfaXNfY29t
cGF0aWJsZShub2RlLCAieGVuLGRvbWFpbiIpICkNCj4gQEAgLTMwOTQsNyArMzA5NCw3IEBAIHZv
aWQgX19pbml0IGNyZWF0ZV9kb20wKHZvaWQpDQo+ICAgICAgICAgLm1heF9ldnRjaG5fcG9ydCA9
IC0xLA0KPiAgICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gZ250dGFiX2RvbTBfZnJhbWVzKCks
DQo+ICAgICAgICAgLm1heF9tYXB0cmFja19mcmFtZXMgPSAtMSwNCj4gLSAgICAgICAgLmdyYW50
X29wdHMgPSBvcHRfZ250dGFiX21heF92ZXJzaW9uLA0KPiArICAgICAgICAuZ3JhbnRfb3B0cyA9
IFhFTl9ET01DVExfR1JBTlRfdmVyc2lvbihvcHRfZ250dGFiX21heF92ZXJzaW9uKSwNCj4gICAg
IH07DQo+IA0KPiAgICAgLyogVGhlIHZHSUMgZm9yIERPTTAgaXMgZXhhY3RseSBlbXVsYXRpbmcg
dGhlIGhhcmR3YXJlIEdJQyAqLw0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMg
Yi94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPiBpbmRleCBlYzZlNjg2ZmFjLi5kYTQ3Y2RlYTE0IDEw
MDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPiArKysgYi94ZW4vYXJjaC94ODYv
c2V0dXAuYw0KPiBAQCAtNzU1LDcgKzc1NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZG9tYWluICpfX2lu
aXQgY3JlYXRlX2RvbTAoY29uc3QgbW9kdWxlX3QgKmltYWdlLA0KPiAgICAgICAgIC5tYXhfZXZ0
Y2huX3BvcnQgPSAtMSwNCj4gICAgICAgICAubWF4X2dyYW50X2ZyYW1lcyA9IC0xLA0KPiAgICAg
ICAgIC5tYXhfbWFwdHJhY2tfZnJhbWVzID0gLTEsDQo+IC0gICAgICAgIC5ncmFudF9vcHRzID0g
b3B0X2dudHRhYl9tYXhfdmVyc2lvbiwNCj4gKyAgICAgICAgLmdyYW50X29wdHMgPSBYRU5fRE9N
Q1RMX0dSQU5UX3ZlcnNpb24ob3B0X2dudHRhYl9tYXhfdmVyc2lvbiksDQo+ICAgICAgICAgLm1h
eF92Y3B1cyA9IGRvbTBfbWF4X3ZjcHVzKCksDQo+ICAgICAgICAgLmFyY2ggPSB7DQo+ICAgICAg
ICAgICAgIC5taXNjX2ZsYWdzID0gb3B0X2RvbTBfbXNyX3JlbGF4ZWQgPyBYRU5fWDg2X01TUl9S
RUxBWEVEIDogMCwNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCBi
L3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPiBpbmRleCAxYzIxZDRkYzc1Li5iODVlNjE3
MGIwIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4gKysrIGIv
eGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oDQo+IEBAIC05OSw2ICs5OSw3IEBAIHN0cnVjdCB4
ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiB7DQo+IA0KPiAvKiBHcmFudCB2ZXJzaW9uLCB1c2UgbG93
IDQgYml0cy4gKi8NCj4gI2RlZmluZSBYRU5fRE9NQ1RMX0dSQU5UX3ZlcnNpb25fbWFzayAgICAw
eGYNCj4gKyNkZWZpbmUgWEVOX0RPTUNUTF9HUkFOVF92ZXJzaW9uKHYpICAgICAgKCh2KSAmIFhF
Tl9ET01DVExfR1JBTlRfdmVyc2lvbl9tYXNrKQ0KPiANCj4gICAgIHVpbnQzMl90IGdyYW50X29w
dHM7DQo+IA0KPiAtLSANCj4gMi4zMy4wDQo+IA0KDQo=

