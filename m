Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0647B750152
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 10:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562046.878596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJV6n-0007Xy-I6; Wed, 12 Jul 2023 08:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562046.878596; Wed, 12 Jul 2023 08:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJV6n-0007Uu-FI; Wed, 12 Jul 2023 08:22:01 +0000
Received: by outflank-mailman (input) for mailman id 562046;
 Wed, 12 Jul 2023 08:22:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3yk=C6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qJV6l-0007Uo-Va
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 08:21:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a8d50d7-208d-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 10:21:57 +0200 (CEST)
Received: from DB9PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:10:1da::10)
 by AS1PR08MB7513.eurprd08.prod.outlook.com (2603:10a6:20b:480::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 08:21:20 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::4d) by DB9PR05CA0005.outlook.office365.com
 (2603:10a6:10:1da::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 08:21:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20 via Frontend Transport; Wed, 12 Jul 2023 08:21:20 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Wed, 12 Jul 2023 08:21:19 +0000
Received: from bb0a64eb8c33.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E6F5E07E-8195-47A9-80DC-D7DEFE30E95F.1; 
 Wed, 12 Jul 2023 08:21:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb0a64eb8c33.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Jul 2023 08:21:09 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB7485.eurprd08.prod.outlook.com (2603:10a6:10:355::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 08:21:01 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7%4]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 08:21:01 +0000
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
X-Inumbo-ID: 2a8d50d7-208d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BQLtuBQVS06nZf24d35MEfKsKWAB7NLQOm90mslWl4=;
 b=8rZiu6qKuz3k7Jcs82azTVL5jltJI5ZZQ+LQFXQMsENInH6m9R5owejKK6Cm92PYurkyh+csuPUDTP+tk8ogyghIQNZ2sMKXT6+l+DvvH6y2GDkStwV+1nN9u/+S9RHj2/JzOrNPSK/P8aSsonqXpQhl5A+9APHcMoPcjpCCAFQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d78cf0a40bea129
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hixYCzYVsmQUeTB9NXDAstK+CMCA8L+O+FyxQXkOZtZ2CRJrbJ8VvGIOzjxvKOXdiz7XSqeTSbM11qipJ5N0ZBDiSsEFUPk2PzPWuPME8M7UQ5YREDyM1HSI/Eda0VMrIG/vCC/F4dJZvwIG7sFGkxLCkLgVPMz6uxkvBGk+xVGkHRMCV/GUYsikTkcEYKuOaHd4H+6Qr7NmFUWNZBKoEtVbq7k1V07Ne/ydmrM+UI8zToGzXLJmmR5qvjRIBVD6v6eGcBNgRfet1cFSUyXPXwAzwLEjni+YAWB7dj2kho0/9dP2BjbTQhPuHmMPT75CZeGwjuVG+7yuDb9/DIzFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BQLtuBQVS06nZf24d35MEfKsKWAB7NLQOm90mslWl4=;
 b=CvqyB6qd0IV0y857b/6TzVRNnp9gCabQKlNrk1nV+U0aBYH3OCpCa26Hbh1AhQY8vulz9rFbMU50JKshK3HFjROmmENIGcLpfpt0PmoUo5CHRdC7Q1ob0W7MRrLV1U2y8qNzbG/dxNcTZAjTisI8y5rq3f8ydN3GPpT++wFexy+IItbvzhRcRNLQg90+FA7GDyWG15ghpPLoQfacYIPDXrpHW1JXz4A+xYxqM4ATFqgESRRp7aZ3eyj0blReeMhoRhJkMzZuBBNWrMU1hr7MUPo4YTSTOH6FkFWsIyYGMJTvHZXDdZAvmTsWW9wkA+6Fe3lvJi4H0SlW6jz/OmF56A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BQLtuBQVS06nZf24d35MEfKsKWAB7NLQOm90mslWl4=;
 b=8rZiu6qKuz3k7Jcs82azTVL5jltJI5ZZQ+LQFXQMsENInH6m9R5owejKK6Cm92PYurkyh+csuPUDTP+tk8ogyghIQNZ2sMKXT6+l+DvvH6y2GDkStwV+1nN9u/+S9RHj2/JzOrNPSK/P8aSsonqXpQhl5A+9APHcMoPcjpCCAFQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "julien@xen.org"
	<julien@xen.org>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: Re: [PATCH] docs/misra: add Rule 9.3
Thread-Topic: [PATCH] docs/misra: add Rule 9.3
Thread-Index: AQHZtDVnm2uoBPIrqkmByEz++gKzmq+1yx6A
Date: Wed, 12 Jul 2023 08:21:01 +0000
Message-ID: <AD59BC9A-B2A4-47D7-A010-2FBF08DA3840@arm.com>
References: <20230711202145.2334563-1-sstabellini@kernel.org>
In-Reply-To: <20230711202145.2334563-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB7485:EE_|DBAEUR03FT009:EE_|AS1PR08MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: a34aa621-1ebc-4a77-208d-08db82b0f8b4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Pck7B0wbI7K5SNifbo5SSX3NVR9wGZFWC5Z/dURdErM4ydFTj12vxstLWvOwpok7vPYQhFxFm8RA/O63mJ4Ccde1aifFv2YMvZwEIuw4iZdfNwMTbehBaENfF1tdOLjUQFgXJCPoDSoxoavr0bUT53rf/YxSaYyt9HN368RJuBUInjINIs1DDgWQIH9dLXFnQwq4VVad6Zd+wVNiPBf3x1ZZDxQN2YL+vKXAlNS1492VL97iae2Q880EJuHRJI2kXgwmpgX1Fc4R8wl86jpr42eqQAZrKx6l2wWBY8FusiPfpX7zWrZ3Kofl/2m47Frn2z4uzkHFi9pQm5okvhvQr4Bs4hVDBktuJInX3y4PmV9dZFS9ELDMBkWwiIUDBLd5T3pviGwZsjW0o4E91vkC7JhkgSHbWTfb6FxsIqHbNvmWjE/vo1yOc68usy2uZ1SVH3KetoVKOTru/F98GCgjPc7W7kb6ZOfNToiYO69tQ4HPETd9wFHPf2fAGwCyav8mOs1+m3lvKdtjLwEamehQjPrkoL9Luu56XreTgE9QpQqNWPAsd9eDiJK/APtqTkT96Xfa97hZ0/K9JDnkHtC/8hqC0nqBYdEw/XMtQL3p31mF0XjA+zK192Zf56CT8bN4fUmcvV4OLM8i14afdJaFry9asUeixZl59VXLrk1Cca2dTCelq/Tr2tZ8FNXG9B9t
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(6486002)(6512007)(71200400001)(33656002)(26005)(53546011)(6506007)(36756003)(186003)(2616005)(38070700005)(86362001)(38100700002)(122000001)(6916009)(76116006)(91956017)(4326008)(66946007)(66556008)(66476007)(66446008)(64756008)(41300700001)(4744005)(2906002)(316002)(8676002)(8936002)(5660300002)(54906003)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <527F2F4B96AB4D4895037BFD34784AB1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7485
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b09dd652-082f-4158-c5fb-08db82b0edb1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8h72ZvGySpmg6f3zGpQhU75PypAF+qjFb/1sZ4yBGoK0hdZeWT15A9IVtF8JX0V0Hwi0w3UR14gMGnrl3wcZPvlay3jlYL1tar61/lD05tPlPEE6einW1TnSO1pp1ZGPLGlTztV2RReKVjBkePT0kx8+1Hl7bhbWGSbrWyaJRt+v9bs04WOd5+1uU7Yh6gBjmTjwmDD3COcYRIjSJvO5OlOk46zTcAUEA4BjwwafS/m8qoAiR85NOE+kOmMl576FgMTJ4JFeV8+2VMpWezG2ZyyBSuBlWmEDPg/j7kIidXg+KNBHJB5wz855noiQbVlT19lZ9V9gEL2W/mnjQInDQTggIwKsA1tcpL7DsZ+a8Nc8bbHpo6qbRa940h3FBBpu+meqAKAmt/zvQyTYyhNzk/uu1FirD/bOgWeGWPQZjD57QduZ38QBoCaCpOnwUZEf8feO8x5uspFrBjP3e8TiQ9DYm79Mp68+qLnLEQ4XH7ms6Y0Xa0YNdocTDAH2uu84hMBMERiA4h/FujenJrb2MSYU9OrJg6qgO3K3W5bkUWB2BhGfBope1PLg7f9at8z0e0eG2+3abSSwuvC06QczXbTjnYX4S0NqJfx3tldr2Rqp9iiU2Al5Sai778LifbBRFu9FLEPX299Ai6Xc92c+eromQK8osJwxWEDTpIQoU+wQmbkomPq8RNCqgRqLZlcP3W8ce+PL1gzORHrfMZHeAY5Gm8Xkn/cMLIQowv2aUxKC5f7ECvAwFAGtWobaWmqaDj0oHEcNY+Se8k1h9aEHfQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(6486002)(40460700003)(478600001)(81166007)(54906003)(356005)(82740400003)(8936002)(8676002)(36756003)(2906002)(6862004)(5660300002)(33656002)(86362001)(82310400005)(4326008)(70206006)(40480700001)(316002)(70586007)(41300700001)(36860700001)(26005)(53546011)(6506007)(336012)(47076005)(186003)(2616005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 08:21:20.1466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a34aa621-1ebc-4a77-208d-08db82b0f8b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7513

DQoNCj4gT24gMTEgSnVsIDIwMjMsIGF0IDIxOjIxLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4gDQo+IFNwZWNpZnkgdGhhdCB7fSBpcyBh
bGxvd2VkIGZvciB6ZXJvLWluaXRpYWxpemF0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KDQo+IC0tLQ0KPiBk
b2NzL21pc3JhL3J1bGVzLnJzdCB8IDUgKysrKysNCj4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvcnVsZXMucnN0IGIvZG9jcy9t
aXNyYS9ydWxlcy5yc3QNCj4gaW5kZXggNzJhYTk4NmJjZS4uMjlhNzc3OTM4YSAxMDA2NDQNCj4g
LS0tIGEvZG9jcy9taXNyYS9ydWxlcy5yc3QNCj4gKysrIGIvZG9jcy9taXNyYS9ydWxlcy5yc3QN
Cj4gQEAgLTI4NCw2ICsyODQsMTEgQEAgbWFpbnRhaW5lcnMgaWYgeW91IHdhbnQgdG8gc3VnZ2Vz
dCBhIGNoYW5nZS4NCj4gICAgICAgIGJyYWNlcw0KPiAgICAgIC0NCj4gDQo+ICsgICAqIC0gYFJ1
bGUgOS4zIDxodHRwczovL2dpdGxhYi5jb20vTUlTUkEvTUlTUkEtQy9NSVNSQS1DLTIwMTIvRXhh
bXBsZS1TdWl0ZS8tL2Jsb2IvbWFzdGVyL1JfMDlfMDMuYz5gXw0KPiArICAgICAtIFJlcXVpcmVk
DQo+ICsgICAgIC0gQXJyYXlzIHNoYWxsIG5vdCBiZSBwYXJ0aWFsbHkgaW5pdGlhbGl6ZWQNCj4g
KyAgICAgLSB7fSBpcyBhbHNvIGFsbG93ZWQgdG8gc3BlY2lmeSBleHBsaWNpdCB6ZXJvLWluaXRp
YWxpemF0aW9uDQoNCk5vdCByZWxhdGVkIHRvIHRoaXMgcGF0Y2gsIGJ1dCBob3cgaXMgdGhlIGNv
ZGluZyBzdHlsZSBmb3IgdGhpcz8gSXMgaXQge30gd2l0aG91dCBzcGFjZXMgb3IgeyB9IHdpdGgg
b25lIHNwYWNlPw0KSXTigJlzIG5vdCBzcGVjaWZpZWQgaW4gdGhlIGNvZGluZyBzdHlsZQ0KDQoN
Cj4gKw0KPiAgICAqIC0gYFJ1bGUgOS40IDxodHRwczovL2dpdGxhYi5jb20vTUlTUkEvTUlTUkEt
Qy9NSVNSQS1DLTIwMTIvRXhhbXBsZS1TdWl0ZS8tL2Jsb2IvbWFzdGVyL1JfMDlfMDQuYz5gXw0K
PiAgICAgIC0gUmVxdWlyZWQNCj4gICAgICAtIEFuIGVsZW1lbnQgb2YgYW4gb2JqZWN0IHNoYWxs
IG5vdCBiZSBpbml0aWFsaXplZCBtb3JlIHRoYW4gb25jZQ0KPiAtLSANCj4gMi4yNS4xDQo+IA0K
PiANCg0K

