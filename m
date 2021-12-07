Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A554D46B9D1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 12:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240918.417695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYLp-0005AW-PX; Tue, 07 Dec 2021 11:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240918.417695; Tue, 07 Dec 2021 11:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYLp-00057f-L7; Tue, 07 Dec 2021 11:09:37 +0000
Received: by outflank-mailman (input) for mailman id 240918;
 Tue, 07 Dec 2021 11:09:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCv=QY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1muYLn-00057J-Im
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 11:09:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2837c193-574e-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 12:09:34 +0100 (CET)
Received: from AM6PR02CA0010.eurprd02.prod.outlook.com (2603:10a6:20b:6e::23)
 by AM0PR08MB3249.eurprd08.prod.outlook.com (2603:10a6:208:5d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 7 Dec
 2021 11:09:32 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::d9) by AM6PR02CA0010.outlook.office365.com
 (2603:10a6:20b:6e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Tue, 7 Dec 2021 11:09:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Tue, 7 Dec 2021 11:09:31 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Tue, 07 Dec 2021 11:09:30 +0000
Received: from ca3d5c1756bb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 513755DB-74CB-47B6-B770-ED7ACB67EB65.1; 
 Tue, 07 Dec 2021 11:09:24 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca3d5c1756bb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Dec 2021 11:09:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3527.eurprd08.prod.outlook.com (2603:10a6:20b:41::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 11:09:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 11:09:21 +0000
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
X-Inumbo-ID: 2837c193-574e-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5W4jhjXE0pUfFxe3bFaW6DhQ/KFCgOnVkFN6av+2vo=;
 b=mXNk5DBwNwYeFOXC0NUAH7NcZoanN3Bjx4AblVmEVNOloYNpeQ5Lgo0iaa7gZkQKHyLlJEcgfXdIGf19fX4QCrtM5dzsV/yIBcSj4o6wScK1BeciJAliY3K8KpShBfZwyaM+4VWU+TB+0F7ZUZsAQGuFHS3cVKMCb4GSLCilmiA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: aadd79e56fcfc2d5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kf90PygAarGevg9PmQUAFTw96wmhQQE8Nw0mcIbQOiZ9oCa2y/FFHJBe4yzvHXab/8H91eAbMJtquZUHuiOm2yHe7YTlUJRMQTiRdyefw7GP/dFRCYiggrEAxijcOnjz9qaZRdKWIMbKR3BMPGXnbmn4DBKQeVdfRu9R0uX7ygz9VOA8sYVOrtVavhzC/0aKtjXrd0dRvY2Yrd8i+1F6TjkyEbp08Bxy4VPVV1VzR27vplhTrcvjve6K0Oxyk3bpRLrI1qXgFayR0Ws1e7lgOEo4fsO1eEzVXaU2/dV/5289b1I1riRwuoYpqSqtMB6ZuZfu+XeqzN6y3ibLX0kLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5W4jhjXE0pUfFxe3bFaW6DhQ/KFCgOnVkFN6av+2vo=;
 b=ZDv5wf7TuzUzYD0ScykN54PDW9n9vauMO3myLkTsoLRNDDUaITYoAHaMmMb6EUAWf5knSpR+uQ//FNGM7lwBF5eKN/MzaPqVtV+hDjfX2oS5KZMCsNj2oUH1harnCSUuO5F6Lj7tkYN7Kggs86utMtoR4CF9ghieHnkQzPCOAXfAear6+b3WOIK2ooRCkXNPt91vLoPqiuB2Eng2KE+w3HZQc2TwNFrMbk+Jehdz3pbjdWQ4WtUBD2A6+fKJRkXD9B22LZ+d5JEkuUPJ/H2WQcNcO77Yj7XYhxmgJA7Rjyw3HEoy+W4gInAyTTTN++b+35ntGl/G9xq44BNLDg9gMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5W4jhjXE0pUfFxe3bFaW6DhQ/KFCgOnVkFN6av+2vo=;
 b=mXNk5DBwNwYeFOXC0NUAH7NcZoanN3Bjx4AblVmEVNOloYNpeQ5Lgo0iaa7gZkQKHyLlJEcgfXdIGf19fX4QCrtM5dzsV/yIBcSj4o6wScK1BeciJAliY3K8KpShBfZwyaM+4VWU+TB+0F7ZUZsAQGuFHS3cVKMCb4GSLCilmiA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Add Kconfig parameter for memory banks number
Thread-Topic: [PATCH] xen/arm: Add Kconfig parameter for memory banks number
Thread-Index: AQHX6rc42wI+YjLuYkGkEA4OiS5od6wlsWWAgAEqHQCAAATSgA==
Date: Tue, 7 Dec 2021 11:09:20 +0000
Message-ID: <A6E7CDAA-E4AD-4AC3-8745-216FDC4DD8BF@arm.com>
References: <20211206153730.49791-1-luca.fancellu@arm.com>
 <f439d5c4-aa6c-4066-3941-e497b67aeae1@xen.org>
 <C96E90F4-611E-4765-9627-EDE75A952E10@arm.com>
In-Reply-To: <C96E90F4-611E-4765-9627-EDE75A952E10@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6ef98d4d-75e7-43a7-f1ea-08d9b9720b24
x-ms-traffictypediagnostic:
	AM6PR08MB3527:EE_|VE1EUR03FT017:EE_|AM0PR08MB3249:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3249D6642CDE75008EE793FB9D6E9@AM0PR08MB3249.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hDBJ1w+deii3ozY1ERnBGl6MtH18Jwtt99tvimLgPnu5B4aHHAZdX2FsAvHm0Uk1I1Cpt7g5LNnk7eg4CHsIxjGsL9PTrdXNFJQVuUj/Zl//KqTFKcrpsiTU47d5r8hkMPJv8msRsoqzR7npjsWlx/EqGAvhljK2z9FK6shuDUewpwRCIYBe8dmuUoYiY/tazQNiFs+aG0rz4bgCjRZUodIRSpSpD4NSY1Qm0gVOEXLnag5rodCtHVQG9AQ/ZEIasGxAwT4ydDmZRHa5OMTTcfN6kkqQoUw6quT2miYdeqzz975h8LH/1nQPiYmsQebNqABmINUU9KxbmNE0pkHw2LmEEz9jqUHyr25cbCOn8wOI+iJYoc6vjQer7K1x8uR3+EGDLafH+6bypS2d/YLyGsU/GgfsV3wAfcCY/UQC65xrDnblMB0+3bapehsJFsQXtmn4tsIXZ5yMcQRWA8vMy1jtKf0WnV50/zP6kRT2YkVEZAAsJEbC9OY6PMj7OBQT+X3DAbTcH/UH1v4MwnmCdifondHBX93CqCAC7e371hiiAn2J+T4sXXx0yLXTo1Y4DSwgD1vkN89+BiSE4QVn30aoKDOhmDe7mbIwDWMjbAqDkzb5/fOpl5J/HWf3bcc4dUF/wtMfnctFqkLcNan1wGwmqQlPXYqlQSTJoCpfRPpGffWBpHN3yXouCSP+D4GA4BW3YF+FGr2Gh3HcPQ7jyienG9M4T8kit+cIg6Bng/r9K7OAST+Q/WSmax2b6Tmk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(8936002)(8676002)(71200400001)(37006003)(38100700002)(4326008)(6486002)(54906003)(15650500001)(6862004)(122000001)(6512007)(33656002)(76116006)(316002)(91956017)(66556008)(508600001)(66446008)(36756003)(66946007)(38070700005)(6506007)(66476007)(64756008)(186003)(2616005)(53546011)(26005)(6636002)(83380400001)(5660300002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <34D17E8596C36D48A1755BB8CF11B3CE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3527
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6f884785-88b9-4d18-4fb2-08d9b97204f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AqK+dt4+0+znISaKGKeYw7/7fiLFLocjqThd7YZ9+iWKNLCpdHdceko/Wj3KgzPEarF6vSmehvqs2Rx0WXgmki8UvxNOxzE/Pc4aurEqTRjIo5OWiZRpPDNPF+mdbN0zO3qhbihohAyXgXP2Ay8YytIYWt2mtboUdzVsD0JVuIrP5MKeIyTayQ8bK6VY9+TeKVKbcv9ggYhfMEqUDRldgjdRUfn+qiL9aXkEmaYYATrabPdrl2vzHTaejeNtzkGvR25rL1dUyvZ7HX0ait+6tzoycw/65+0Uk9/Z0hkQXO+ieTMz/nncS/pgxlxi6rxdvlMxkn605z4LpEz1yg82432I860bkaaM7NekQuxyPPZnOFPHrxAA8QolROKfaa7CR6MKoWZtt7uaBOCn5uWV0Dv8WghfoKOK32GMRjH04Jlqch6uLgGb6/StBNY1DJInB30IBqR4ZenSUaaa3rNKM0QmPWzkeUgS76Lhy+2e4WOZxnET6zxKrY5/AhwyW6hTk/fr25ceOWgi11XjaXVv186m42SkOL8fJj2/n6kD3KQ7pRpcGYzKUFb5NgqTiRTw51BH2EMgISqoq2p4rv/7EK7DQYELnk5PwizpEwD5Las/sZU4BzwtXNQtkJ5iga2MdOp9iyjkKG+8pPJmud1z1xhDKtjXskKbLj2kDygreZZpsASusjgMiftoV77vieMEddqEwN9n9/olxUo71EAhwQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36860700001)(2616005)(86362001)(8936002)(336012)(6636002)(186003)(6506007)(5660300002)(6862004)(356005)(107886003)(82310400004)(81166007)(4326008)(83380400001)(53546011)(6486002)(8676002)(15650500001)(37006003)(2906002)(70586007)(33656002)(316002)(26005)(508600001)(54906003)(47076005)(70206006)(6512007)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 11:09:31.2610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef98d4d-75e7-43a7-f1ea-08d9b9720b24
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3249

SGksDQoNCj4gT24gNyBEZWMgMjAyMSwgYXQgMTA6NTIsIEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFu
Y2VsbHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiA2IERlYyAyMDIxLCBhdCAx
NzowNSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+PiANCj4+IEhpIEx1
Y2EsDQo+PiANCj4+IE9uIDA2LzEyLzIwMjEgMTU6MzcsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+
Pj4gQ3VycmVudGx5IHRoZSBtYXhpbXVtIG51bWJlciBvZiBtZW1vcnkgYmFua3MgaXMgZml4ZWQg
dG8NCj4+PiAxMjgsIGJ1dCBvbiBzb21lIG5ldyBwbGF0Zm9ybXMgdGhhdCBoYXZlIGEgbGFyZ2Ug
YW1vdW50DQo+Pj4gb2YgbWVtb3J5LCB0aGlzIHZhbHVlIGlzIG5vdCBlbm91Z2ggDQo+PiANCj4g
DQo+IEhpIEp1bGllbiwNCj4gDQo+PiBDYW4geW91IHByb3ZpZGUgc29tZSBpbmZvcm1hdGlvbiBv
biB0aGUgc2V0dXA/IElzIGl0IHVzaW5nIFVFRkk/DQo+IA0KPiBZZXMgaXQgaXMgYSBwbGF0Zm9y
bSB3aXRoIDMyZ2Igb2YgcmFtLCBJ4oCZdmUgYnVpbHQgWGVuIHdpdGggQUNQSSBzdXBwb3J0IGFu
ZCBpdOKAmXMgc3RhcnRpbmcgdXNpbmcgVUVGSStBQ1BJLg0KPiANCj4+IA0KPj4+IGFuZCBwcmV2
ZW50cyBYZW4NCj4+PiBmcm9tIGJvb3RpbmcuDQo+PiANCj4+IEFGQUlLLCB0aGUgcmVzdHJpY3Rp
b24gc2hvdWxkIG9ubHkgcHJldmVudCBYZW4gdG8gdXNlIGFsbCB0aGUgbWVtb3J5LiBJZiB0aGF0
J3Mgbm90IHRoZSBjYXNlLCB0aGVuIHRoaXMgc2hvdWxkIGJlIGZpeGVkLg0KPiANCj4gVGhlIGNv
ZGUgdGhhdCBpdOKAmXMgZmFpbGluZyBpcyB0aGlzLCBpbnNpZGUgZWZpX3Byb2Nlc3NfbWVtb3J5
X21hcF9ib290aW5mbyjigKYpIGluIHRoZSBhcmNoL2FybS9lZmkvZWZpLWJvb3QuaDoNCj4gDQo+
ICNpZmRlZiBDT05GSUdfQUNQSQ0KPiAgICAgICAgZWxzZSBpZiAoIGRlc2NfcHRyLT5UeXBlID09
IEVmaUFDUElSZWNsYWltTWVtb3J5ICkNCj4gICAgICAgIHsNCj4gICAgICAgICAgICBpZiAoICFt
ZW1pbmZvX2FkZF9iYW5rKCZib290aW5mby5hY3BpLCBkZXNjX3B0cikgKQ0KPiAgICAgICAgICAg
IHsNCj4gICAgICAgICAgICAgICAgUHJpbnRTdHIoTCJFcnJvcjogQWxsICIgX19zdHJpbmdpZnko
TlJfTUVNX0JBTktTKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgIiBhY3BpIG1lbWluZm8g
bWVtIGJhbmtzIGV4aGF1c3RlZC5cclxuIik7DQo+ICAgICAgICAgICAgICAgIHJldHVybiBFRklf
TE9BRF9FUlJPUjsNCj4gICAgICAgICAgICB9DQo+ICAgICAgICB9DQo+ICNlbmRpZg0KPiANCj4+
IA0KPj4+IENyZWF0ZSBhIEtjb25maWcgcGFyYW1ldGVyIHRvIHNldCB0aGUgdmFsdWUsIGJ5IGRl
ZmF1bHQNCj4+PiAxMjguDQo+PiANCj4+IEkgdGhpbmsgWGVuIHNob3VsZCBiZSBhYmxlIHRvIGJv
b3Qgb24gYW55IHBsYXRmb3JtIHdpdGggdGhlIGRlZmF1bHQgY29uZmlndXJhdGlvbi4gU28gdGhl
IHZhbHVlIHNob3VsZCBhdCBsZWFzdCBiZSBidW1wZWQuDQo+PiANCj4+PiBTaWduZWQtb2ZmLWJ5
OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQo+Pj4gLS0tDQo+Pj4geGVu
L2FyY2gvYXJtL0tjb25maWcgICAgICAgIHwgOCArKysrKysrKw0KPj4+IHhlbi9pbmNsdWRlL2Fz
bS1hcm0vc2V0dXAuaCB8IDIgKy0NCj4+PiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBi
L3hlbi9hcmNoL2FybS9LY29uZmlnDQo+Pj4gaW5kZXggZWNmYTY4MjJlNGQzLi44MDVlM2M0MTdl
ODkgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcNCj4+PiArKysgYi94ZW4v
YXJjaC9hcm0vS2NvbmZpZw0KPj4+IEBAIC0yNSw2ICsyNSwxNCBAQCBtZW51ICJBcmNoaXRlY3R1
cmUgRmVhdHVyZXMiDQo+Pj4gICBzb3VyY2UgImFyY2gvS2NvbmZpZyINCj4+PiArY29uZmlnIE1F
TV9CQU5LUw0KPj4+ICsJaW50ICJNYXhpbXVtIG51bWJlciBvZiBtZW1vcnkgYmFua3MuIg0KPj4+
ICsJZGVmYXVsdCAiMTI4Ig0KPj4+ICsJaGVscA0KPj4+ICsJICBDb250cm9scyB0aGUgYnVpbGQt
dGltZSBzaXplIG1lbW9yeSBiYW5rIGFycmF5Lg0KPj4+ICsJICBJdCBpcyB0aGUgdXBwZXIgYm91
bmQgb2YgdGhlIG51bWJlciBvZiBsb2dpY2FsIGVudGl0aWVzIGRlc2NyaWJpbmcNCj4+PiArCSAg
dGhlIG1lbW9yeS4NCj4+IA0KPj4gTlJfTUVNX0JBTktTIGlzIGdvaW5nIHRvIGJlIHVzZWQgYnkg
bXVsdGlwbGUgaW50ZXJuYWwgc3RydWN0dXJlIGluIFhlbiAoZS5nLiBzdGF0aWMgbWVtb3J5LCBy
ZXNlcnZlZCBtZW1vcnksIG5vcm1hbCBtZW1vcnkpLiBTbyBob3cgY291bGQgYW4gYWRtaW4gZGVj
aWRlIHRoZSBjb3JyZWN0IHZhbHVlPw0KPj4gDQo+PiBJbiBwYXJ0aWN1bGFyIGZvciBVRUZJLCB3
ZSBhcmUgYXQgdGhlIG1lcmN5IG9mIHRoZSBmaXJtd2FyZSB0aGF0IGNhbiBleHBvc2UgYW55IGtp
bmQgb2YgbWVtb3J5IG1hcCAodGhhdCdzIHdoeSB3ZSBoYWQgdG8gaW5jcmVhc2UgdGhlIG9yaWdp
bmFsIG51bWJlciBvZiBiYW5rcykuDQo+PiANCj4+IFNvIG1heWJlIGl0IGlzIHRpbWUgZm9yIHVz
IHRvIG1vdmUgb3V0IGZyb20gYSBzdGF0aWMgYXJyYXkgYW5kIHJlLXRoaW5rIGhvdyB3ZSBkaXNj
b3ZlciB0aGUgbWVtb3J5Lg0KPj4gDQo+PiBUaGF0IHRoaXMgaXMgcHJvYmFibHkgZ29pbmcgdG8g
dGFrZSBzb21lIHRpbWUgdG8gZ2V0IGl0IHByb3Blcmx5LCBzbw0KPj4gSSB3b3VsZCBiZSBPSyB3
aXRoIGJ1bXBpbmcgdGhlIHZhbHVlICsgYSBjb25maWcgZ2F0ZWQgVU5TVVBQT1JURUQuDQoNCg0K
TG9va2luZyBhdCB3aGF0IHdlIGhhdmUsIHRoZSBtZW1vcnkgaXMgYWN0dWFsbHkgZnJhZ21lbnRl
ZCBieSBBQ1BJIGJ1dCBhIGxvbmcgdGVybSBzb2x1dGlvbiBjb3VsZCBiZSB0byBtYWtlIHRoZSBj
b2RlIGEgbGl0dGxlIGJpdCBtb3JlIHNtYXJ0IGFuZCB0cnkgdG8gbWVyZ2UgdG9nZXRoZXIgYWRq
YWNlbnQgYmFua3MuDQoNCkkgd291bGQgc3VnZ2VzdCB0byBqdXN0IGluY3JlYXNlIHRoZSBleGlz
dGluZyBkZWZpbmUgdG8gMjU2IHRvIGZpeCB0aGUgY3VycmVudCBpc3N1ZSAod2hpY2ggbWlnaHQg
YmUgZW5jb3VudGVyZWQgYnkgYW55Ym9keSB1c2luZyBBQ1BJKSBhbmQgcHV0IGEgY29tbWVudCBp
biB0aGUgY29kZSBmb3Igbm93IHdpdGggYSBUT0RPIGV4cGxhaW5pbmcgd2h5IHdlIGN1cnJlbnRs
eSBuZWVkIHN1Y2ggYSBoaWdoIHZhbHVlIGFuZCB3aGF0IHNob3VsZCBiZSBkb25lIHRvIGZpeCB0
aGlzLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg0KPiANCj4gSSBjYW4gZG8gdGhhdC4NCj4gDQo+
IENoZWVycywNCj4gTHVjYQ0KPiANCj4+IA0KPj4+ICsNCj4+PiBjb25maWcgQUNQSQ0KPj4+IAli
b29sICJBQ1BJIChBZHZhbmNlZCBDb25maWd1cmF0aW9uIGFuZCBQb3dlciBJbnRlcmZhY2UpIFN1
cHBvcnQgKFVOU1VQUE9SVEVEKSIgaWYgVU5TVVBQT1JURUQNCj4+PiAJZGVwZW5kcyBvbiBBUk1f
NjQNCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oIGIveGVuL2lu
Y2x1ZGUvYXNtLWFybS9zZXR1cC5oDQo+Pj4gaW5kZXggOTVkYTBiN2FiOWNkLi43ODVhOGZlODE0
NTAgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oDQo+Pj4gKysr
IGIveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oDQo+Pj4gQEAgLTYsNyArNiw3IEBADQo+Pj4g
I2RlZmluZSBNSU5fRkRUX0FMSUdOIDgNCj4+PiAjZGVmaW5lIE1BWF9GRFRfU0laRSBTWl8yTQ0K
Pj4+IC0jZGVmaW5lIE5SX01FTV9CQU5LUyAxMjgNCj4+PiArI2RlZmluZSBOUl9NRU1fQkFOS1Mg
Q09ORklHX01FTV9CQU5LUw0KPj4+ICAgI2RlZmluZSBNQVhfTU9EVUxFUyAzMiAvKiBDdXJyZW50
IG1heGltdW0gdXNlZnVsIG1vZHVsZXMgKi8NCj4+PiANCj4+IA0KPj4gQ2hlZXJzLA0KPj4gDQo+
PiAtLSANCj4+IEp1bGllbiBHcmFsbA0KDQo=

