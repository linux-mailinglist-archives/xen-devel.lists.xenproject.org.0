Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B590173D84E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 09:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555344.867053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDgRR-0006yc-Hq; Mon, 26 Jun 2023 07:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555344.867053; Mon, 26 Jun 2023 07:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDgRR-0006wC-F3; Mon, 26 Jun 2023 07:15:17 +0000
Received: by outflank-mailman (input) for mailman id 555344;
 Mon, 26 Jun 2023 07:15:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCbL=CO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qDgRQ-0006w4-2Y
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 07:15:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 319d0d87-13f1-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 09:15:13 +0200 (CEST)
Received: from DB7PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:10:52::39)
 by PAWPR08MB10134.eurprd08.prod.outlook.com (2603:10a6:102:35d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 07:14:42 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::99) by DB7PR02CA0026.outlook.office365.com
 (2603:10a6:10:52::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 07:14:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.15 via Frontend Transport; Mon, 26 Jun 2023 07:14:41 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142");
 Mon, 26 Jun 2023 07:14:41 +0000
Received: from e2089ff5a2e3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3D035F21-0893-44E4-9A95-EC1A0A3CFD95.1; 
 Mon, 26 Jun 2023 07:14:35 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e2089ff5a2e3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Jun 2023 07:14:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB8172.eurprd08.prod.outlook.com (2603:10a6:150:7c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 07:14:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 07:14:31 +0000
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
X-Inumbo-ID: 319d0d87-13f1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOdHiVsKiJmrNqD6scxTR2DQE/gaMOpqsMK4cj8vyOs=;
 b=iGQMDdNhZ5VDtgzDqXwQpim3mhcmuNtkRnMiVHF9YIoWp+DyH8Ce5GoXB+RWeEo+SlI947nFbfD0EQlYCqykkQEYT9poA8FnNt2Ox4exbEY21R5xcoEtHmmb1vSJIjFikLtWrORhBlrW3q1nb8l2cyG/AVLC9vIlS9iN+f/sISc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNuQ36XD+b9TitBo4TkwJhVRUv8N3Ibm7VzY9a97qFP3NzE5rEH8bXavcI/5GISmTYq66VrSGn9YbN0bZxKw2gmKMFjbnRsV8ouvur9sNyuVD0LSwAnsndTSsrXs8ySaOzIRF4d5gmSn+teOeRT7Ttwow8rHkcfHVkRQXcXWfIGuwE8KytXInF7pAHYCd0tGQ4ufDfTRk9cqyfs9DYjXsbAzUykL+Dl2ClGHyPZ2rQm7AabCyKvX73Q7xCxUWToyEH8JPrgegUK01J5vxku3CMCnAHZLxPBLcIXdmIy8XoVtX71mWEnwiSti+p1hftWQRIfro9CryL0LX7rzwf68tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOdHiVsKiJmrNqD6scxTR2DQE/gaMOpqsMK4cj8vyOs=;
 b=kFhAf5G7k4H/XAuov8W3quADubs5JUhuLr/nQakmBBxiEBua9h/VF82cl5P+bqJW6Dnp9C+20/yaqDffXaYAEVenB5bg9IXLzJ1/cpi2obVlCsUPdHugXbnW9+AJ4E/7FIppsX7+Z3cnlvzwfTIoLM23zMd0qS1UWhEc01ykRyOJpD7PFZR0PR2O4Ik7pqZElaFBbYT2GZ2I31zU07uosadhj8xWJWAWx0Cni54ib+FF3hWwW6czGoeOLtYW2+Ems+9VnsXBxRL8nytXS08xiEIvgm6Q9hjLX/gVo0zeD4IEoLncgTTekVlzKLd3YW4OqPqZt7x/F7wq9YjedMKj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOdHiVsKiJmrNqD6scxTR2DQE/gaMOpqsMK4cj8vyOs=;
 b=iGQMDdNhZ5VDtgzDqXwQpim3mhcmuNtkRnMiVHF9YIoWp+DyH8Ce5GoXB+RWeEo+SlI947nFbfD0EQlYCqykkQEYT9poA8FnNt2Ox4exbEY21R5xcoEtHmmb1vSJIjFikLtWrORhBlrW3q1nb8l2cyG/AVLC9vIlS9iN+f/sISc=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 1/9] xen/arm: Check Xen size when linking
Thread-Topic: [PATCH 1/9] xen/arm: Check Xen size when linking
Thread-Index: AQHZp6aLOomj+n7mMk6Gpm2cByrsNq+cmVMwgAASAYCAAABpAA==
Date: Mon, 26 Jun 2023 07:14:31 +0000
Message-ID:
 <AS8PR08MB799123C0EAE9E1A75D896E3F9226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-2-julien@xen.org>
 <AS8PR08MB799128C9EFC82CBA0151B2009226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <90c07118-a028-2abc-8252-f9807a2e99f1@xen.org>
In-Reply-To: <90c07118-a028-2abc-8252-f9807a2e99f1@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C164512DE0B609479A287CE6D7EE4032.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB8172:EE_|DBAEUR03FT052:EE_|PAWPR08MB10134:EE_
X-MS-Office365-Filtering-Correlation-Id: 441eb7a5-b47b-42ea-b75c-08db761502e3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 elMwxUhHcCx4r5mPXHgLvdxNtr1rwpopxPyk5asvQ/5kqaMhTM7+JC9fNf6mUZyFGBBVs6CFrbol7Bckrt2X8XhY3iPxLyfUrIj6fekbT0yC6qC8OGtUyHkT1Yga0SM2RhZ7TFo8VaACm9p2Wc93iqhQR4V+cAc8cJy5fHiGcllxflw89YqgNrRz2GTXfRbhc4wmDRRrIfXDDmhH+7/lsaDtPgjBC/KlPCXo11caf9xWFzVpJTLi810OJtpFCDSAUArOlHTnW4twoQDYwdTRJnmCCB/vbNogvgdB5kPESbo8JW663pLXzhDAvBbRIem6N78ZLTvtLWtWA/aUMqr+W/MfA83nWlC9tPr3XtigtGp/KHM1af28Hg4UhR03IxUN7o9ByCdAZuzxTZTuZh2uDuAwrG9iJbZsoZPtstVYcSISFNFb/2cwQZgMx2hFexNTcSjeYEyHeK6dL2oHZoJPcIAMFHf+B+64pZ0HI5JHCUCDY9fqoBY9gR0XYYavIqPQcbq2Fwgk7ZOcf2tnDyjAaNFz4Gwpb1YQ0ONL4bIE819dF8XdRm31rjXsb0kYvS5cAkYeRQWXknwlskBtCAq6tlByyBHMlpZrTC0GbmVi9bhhfz6nzgwYvkkFuK9a8H/6
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199021)(2906002)(4744005)(38070700005)(7696005)(71200400001)(38100700002)(83380400001)(122000001)(26005)(9686003)(53546011)(186003)(55016003)(41300700001)(110136005)(54906003)(86362001)(478600001)(316002)(76116006)(66556008)(64756008)(66446008)(4326008)(66946007)(66476007)(33656002)(6506007)(5660300002)(52536014)(8676002)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8172
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ed17f61-418f-46e8-5b0a-08db7614fcc4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5j8EangdyoskUOatDCaul7sjaRug4+AQwHh/nsM3Rl2OEy4zz7CSV9MMYMAFzVHHpZi23faQ9dxP63qK1EtjQSDILsuxZuCx93yMfBqAmwtMhrx8tHcv5fwYH7MhbZ8nLVmopDbRZp2FFNnGLwi4Fy04gDVb2tFCExuZ8m9JmlSJQabQMHeSnWGyPdlGHuyfaL/yh96d7f5od4zPJ2Lzj3nymQC7pPrquoZMYi3h9Znj/eVNfn8XAZ6uw/cIF+UBEDBpqxwvNZd9k9GFO1uWDGnENiZbsmdZtGzg7YQOuiOM+l+CzL3ir/XO8w06xq3W2fISgJUacbfapjrRQ+hb7+FmipKHSjnxf4osorYUsJsVLy8wny16uhQALBteVH+wySinlWG7NhQrXa92HkZoM5kZykr4HZR7x6Kd+auIx9+hfkBafo6AhLXqg9G0ZdCPKLFQ7mwbOhH8O9htKhpc2NSLv5DjkgUUNKaoQhHx9kvpq9Dmzn/inwt3IQC2Bu/jf9vpJwJh+BxM02JSXJKAbsBXE0BbFYjvmrv1dd7Fg03SG9ya75Ch4k5ur4ZGvXri5l+s642ZcFOjKelNzHHcVgVMfEUkWRXStk9rTtF40q0zEBxKkWf54QaKQESF2Dnj+A/RdkBNtl3fTnboI4/u0AfebmUBg7Brquj3/tGk0zk8ctwdqThxg9ZTa+RQx5TO1tOgSiRIiUpa5s1Ria7q490uFhsxUgpFEsmIGqEWlA0UgOmgZF8MmVXl12U22RGB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(82310400005)(36860700001)(33656002)(40460700003)(52536014)(70206006)(356005)(5660300002)(55016003)(8936002)(8676002)(41300700001)(86362001)(81166007)(40480700001)(4326008)(316002)(70586007)(82740400003)(107886003)(47076005)(6506007)(9686003)(26005)(53546011)(2906002)(4744005)(478600001)(186003)(7696005)(54906003)(110136005)(336012)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 07:14:41.7769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 441eb7a5-b47b-42ea-b75c-08db761502e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10134

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS85XSB4ZW4v
YXJtOiBDaGVjayBYZW4gc2l6ZSB3aGVuIGxpbmtpbmcNCj4gDQo+IE9uIDI2LzA2LzIwMjMgMDc6
MTUsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4gSGkgSnVsaWVuLA0KPiANCj4gSGkgSGVucnksDQo+
IA0KPiANCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gU3ViamVjdDogW1BB
VENIIDEvOV0geGVuL2FybTogQ2hlY2sgWGVuIHNpemUgd2hlbiBsaW5raW5nDQo+ID4+DQo+ID4+
IFRoZSBsaW5rZXIgd2lsbCBoYXBwaWx5IGxpbmsgWGVuIGlmIGl0IGlzIGJpZ2dlciB0aGFuIHdo
YXQgd2UgY2FuIGhhbmRsZQ0KPiA+PiAoZS5nIDJNQikuIFRoaXMgd2lsbCByZXN1bHQgdG8gdW5l
eHBlY3RlZCBmYWlsdXJlIGFmdGVyIGJvb3QuDQo+ID4NCj4gPiBJIGZvdW5kIHRoaXMgYSBsaXR0
bGUgYml0IG1pc2xlYWRpbmcgYmVjYXVzZSB3aGVuIEkgbG9va2VkIGZvcg0KPiA+IFhFTl9WSVJU
X1NJWkUsIEkgYW0gaGF2aW5nOg0KPiA+DQo+ID4gI2RlZmluZSBYRU5fVklSVF9TSVpFICAgICAg
ICAgICBfQVQodmFkZHJfdCwgTUIoOCkpDQo+IA0KPiBJIHRoaW5rIHlvdSBsb29rZWQgYXQgdGhl
IHRyZWUgd2l0aCBteSBzZXJpZXMgYXBwbGllZCBiZWNhdXNlIHBhdGNoICM5DQo+IHdpbGwgYnVt
cCB0aGUgcmVzZXJ2ZWQgc2l6ZS4gVGhlIHZhbHVlIGluIHRoZSBjb21taXQgbWVzc2FnZSBtYXRj
aCB0aGUNCj4gY3VycmVudCB2YWx1ZSBpbiBzdGFnaW5nLg0KDQpZZWFoIGV4YWN0bHksIEkgc3Rh
cnRlZCBteSByZXZpZXcgZnJvbSBwYXRjaCAjMSBhbmQgd2hlbiBJIHNhdyBwYXRjaCAjOSBJDQpy
ZWFsaXplZCB0aGUgc2l6ZSBpcyBidW1wZWQgdGhlcmUsIGJ1dCB0aGUgZW1haWwgd2FzIGFscmVh
ZHkgc2VudCB0aGVuLi4uLg0KDQpTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbi4NCg0KS2luZCByZWdh
cmRzLA0KSGVucnkNCg==

