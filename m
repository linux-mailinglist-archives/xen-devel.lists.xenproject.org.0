Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C637C66A0E6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 18:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477506.740239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGO5E-0007P3-O8; Fri, 13 Jan 2023 17:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477506.740239; Fri, 13 Jan 2023 17:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGO5E-0007Lk-Kn; Fri, 13 Jan 2023 17:43:16 +0000
Received: by outflank-mailman (input) for mailman id 477506;
 Fri, 13 Jan 2023 17:43:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Kou=5K=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pGO5C-0007LO-68
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 17:43:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2042.outbound.protection.outlook.com [40.107.14.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf9b033a-9369-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 18:43:11 +0100 (CET)
Received: from DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) by AS8PR08MB9410.eurprd08.prod.outlook.com
 (2603:10a6:20b:5a9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 17:43:04 +0000
Received: from DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c2:cafe::b9) by DUZPR01CA0067.outlook.office365.com
 (2603:10a6:10:3c2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 17:43:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT012.mail.protection.outlook.com (100.127.142.126) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 17:43:04 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132");
 Fri, 13 Jan 2023 17:43:04 +0000
Received: from bd75016779ac.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E26E6BE6-1B3C-4763-9B35-805A38E04C15.1; 
 Fri, 13 Jan 2023 17:42:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd75016779ac.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 17:42:53 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB10172.eurprd08.prod.outlook.com (2603:10a6:20b:628::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 17:42:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 17:42:50 +0000
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
X-Inumbo-ID: bf9b033a-9369-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RAPshMN3xIQ1BrKS7cc5QTA8+y3tTA+a4KJWLglJ1w=;
 b=WaobxEtpcWB/1wlsU26S8P9ZVSJUDuUFMQENvFc4Hu54G6jJf9JTexiqysV7foViWA1Rv4G6+Y6J5PPCyldaURpuP79Emo3/bZhqY0chnPGyj6cXdfCltuRjiVbSFvmkDHWQkAjg6n1mNRrfParTrJ5S4PqZbhahTCEEwAdVqrc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8660c8561e6f19b6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISmhEMfLjKafYYT5czq91XzkEVPxU3fiDmOnR6J2s2gphUc7hknNxqL4/lnwQ8eeoD+J9xJnsKr2r+ZG3TE3V4KTVJ0BtuYhwXN5bHMljUKfHmNp8km4MHD5Yl1f5Vf6F+dN1uyJuBCeHA31kKsVjWSDgpRhn/Sdvm4HwmrgH6lGCtP6LqZlDXYuuSvIpAMZWA+HSBByJxy6R+Ds9vAoAHsibSWkJ12le3IBJ7FfRzk7OjEOIezAVny8VTv3aUizPJp1q7TVfsgZSS7bGxP9RIlJUeqqI9Hbfxk0t4L/7m0glJ1/ikbfgyTo00Fjms+EbYWW9ljbY+TSSH6jIoFLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RAPshMN3xIQ1BrKS7cc5QTA8+y3tTA+a4KJWLglJ1w=;
 b=TKoHptZz3yH0CudI0SoiVnAlQ67dQqjBCN9MozmJgmrZVQghet0ZueDVTS5tIO18uz/J86ScUEW6xoN7hToy4G9JKM9hNtYc0aOSw11OE+qGS6KneiTpvZjhXw7jvzGNg+y8Ft2lREidUj0+bBSpzsDlo3vHTPlSkoX+8zA8IFxdJ9elWV0srr8EWP73Ll9ZKxdYbz1/hGeTWW9HnMVzR6NiTnFbE/gmo2PcnFIsPnvSOd60j4xvqidQgnMvcPWuwyH/ZNgq8BQITL2BhTcRRIxm7mQc0HQhyGYLpkl8I7mymH3mRSiyN0ZSkrGqvKexjFHIfvrRftopC4F4IHxvxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RAPshMN3xIQ1BrKS7cc5QTA8+y3tTA+a4KJWLglJ1w=;
 b=WaobxEtpcWB/1wlsU26S8P9ZVSJUDuUFMQENvFc4Hu54G6jJf9JTexiqysV7foViWA1Rv4G6+Y6J5PPCyldaURpuP79Emo3/bZhqY0chnPGyj6cXdfCltuRjiVbSFvmkDHWQkAjg6n1mNRrfParTrJ5S4PqZbhahTCEEwAdVqrc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 14/14] xen/arm64: smpboot: Directly switch to the
 runtime page-tables
Thread-Topic: [PATCH v4 14/14] xen/arm64: smpboot: Directly switch to the
 runtime page-tables
Thread-Index: AQHZJzoPSgWN5vNZ70iPu83PQrLhuK6cnmWA
Date: Fri, 13 Jan 2023 17:42:49 +0000
Message-ID: <8A0AD684-FB21-46B3-A0C9-DE0BF67030D0@arm.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-15-julien@xen.org>
In-Reply-To: <20230113101136.479-15-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB10172:EE_|DBAEUR03FT012:EE_|AS8PR08MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7e3c85-0ee0-4342-f887-08daf58d9fb6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OI8sq1OgFmUBxQcTP6taKBqY5EwUdRKy9DRohTByYryy5ewUxaNFXvWzf0dGQtUi24R/gYG4WhmfLEM4FtNk3w05p1EQXu2Jli28mTU2XSrySsEMIM34u5G1JNfGauoGW79HQgZ0UXLQ3bT0mYi+pRRSi5bdL2nDNNcUFikZich30EUfi+7IGwSqXglah1R4BIlwE3CnEXd+1RwazQc1nqdSg/GFWQs1P4tPvnQuZUjcmnIdNY4GP2HbtHtOqajkqwOWf8jJ09a+LBlfZdEX4dlK5fWrwfNpR5JmoUgRHLC4rd2VbZYY1Bea90jwanrNF+BqpS8oUrc8rr+APDMtCsecSNUHLtiFIsmYOrn/Cwqm/fOJdDjQ2GxkemjS1QsKkWhFeARCvhbZLlbv32M1cnj7DSGe4ehC14LCR8flujoGzH3crphmXaP3wZlzJfVFGPIxhfURkLMfch/k34oW2H5k1Po4Pl+q8QTX2rz7ttHRVinmxqj7CP48xPA2d+Wn5NvXWj/2JXEFDAfm2kI6le27xqvNycIasuCk/VP4Hw8Iv0oFvmhNoHJxG2VQCw6/BnGR5NUnobcgmQOcolLcVgmiCsVugFhSHlGTqtHWGiOCFo7ifnx6QFVt2Ag9t2KV8fYSV1HZ0qGr8d8xWVGEHnBZ1lmOy9BTbQJ1CIemoWG+JK6lDFcXyGxgBIEQRdO9YxRcPO7S70I3ETlI/sZGE2+Fbq2H7W9iWG4neqZjbx59YXxJRln0ZfG/NyoJ+31NgHYH0TyIXTa4SwxGKz53rrLR4RnMhOh5rnkBbwPJ7wk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199015)(6512007)(6916009)(54906003)(316002)(6486002)(36756003)(33656002)(71200400001)(122000001)(26005)(38070700005)(38100700002)(186003)(2616005)(86362001)(53546011)(6506007)(8676002)(4744005)(5660300002)(2906002)(66946007)(478600001)(66556008)(64756008)(41300700001)(66476007)(76116006)(8936002)(4326008)(66446008)(91956017)(45980500001)(414714003)(473944003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D638175A4F42D1408630DC62195C5145@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10172
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8cc7704-515f-4340-6392-08daf58d969c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rqHSI0dzQF6/UO3abVyxO/ZLy+83SgqT0by0nEUhjweKWnZV5D+9P+iOd6gLuSGpEOXfD09V0p2PnNltl8KmAMSSox9RE26xuF4KuyU/XSQmuFI+FuEqUltWQ8yH0fYfw4DKITpPeazNY5fc5UhK3nbSPlMrIHD6jnV+KKU3umyEogqVn7GPs3kwe05k2Ds2h4ZdXK4+DZlGHDAa9TJlZMGwxD7lWTOAeUrj+05qP3HOgolM1wj6/uIeNmNUr8AZTLOr/JvSfFdX/5Tf2utr0FC000oIxH1uwCHH9rCMCxySn2+qM45oUIoyuOEwIZROwHjGwxjOE9NNG9DDSZyNKUoYPJFet5xeWuFZgB2rc/9jrWnr/IACGSshLgwrYPTQnGoq01p9UY+os90793dYnmhmxk5Aaj9PFslOJWr3Q7D3wpduNC2H2Cu1s55axrV6z0E8qjqhPNAUxwdfkhJCK2DEoYGH4KVY/L+mJmw4wac3Z/SZkV6qutQai+cPLJqPe0zBTJ7x9yMaRbhIta3Xf8es4QU6E8Xe0UBQ5NDLkoRZEZ8GIGG34qXqRDwhNCFPR7SnMJcjicx1rMvSfaFxJDyoIPjqHOZXl9/dmBwl1ahoPzLxE5SClDS0lXR1RX2n8ZXF/6Rmsz9OPuiaHeAGbXPFFmS5cnEB2SHJSet0fZFjSdrdOQ+7tk0Tx/6FS83kHxvsUq2bd3TALJP8pziTwhbsUE/zF3gXNWALkuPyiYbi41u9Ja1P1S6Wl+E/J5Vr
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(6506007)(6862004)(4326008)(8676002)(8936002)(70586007)(5660300002)(70206006)(41300700001)(26005)(2616005)(356005)(2906002)(54906003)(36756003)(33656002)(316002)(86362001)(6486002)(40460700003)(478600001)(47076005)(40480700001)(53546011)(6512007)(336012)(82310400005)(186003)(81166007)(82740400003)(107886003)(36860700001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 17:43:04.5108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7e3c85-0ee0-4342-f887-08daf58d9fb6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9410

DQoNCj4gT24gMTMgSmFuIDIwMjMsIGF0IDEwOjExLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBTd2l0Y2hpbmcgVFRCUiB3aGlsZSB0aGUgTU1VIGlzIG9uIGlzIG5vdCBzYWZlLiBO
b3cgdGhhdCB0aGUgaWRlbnRpdHkNCj4gbWFwcGluZyB3aWxsIG5vdCBjbGFzaCB3aXRoIHRoZSBy
ZXN0IG9mIHRoZSBtZW1vcnkgbGF5b3V0LCB3ZSBjYW4gYXZvaWQNCj4gY3JlYXRpbmcgdGVtcG9y
YXJ5IHBhZ2UtdGFibGVzIGV2ZXJ5IHRpbWUgYSBDUFUgaXMgYnJvdWdodCB1cC4NCj4gDQo+IFRo
ZSBhcm0zMiBjb2RlIHdpbGwgdXNlIGEgZGlmZmVyZW50IGFwcHJvYWNoLiBTbyB0aGlzIGlzc3Vl
IGlzIGZvciBub3cNCj4gb25seSByZXNvbHZlZCBvbiBhcm02NC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IC0tLS0NCj4gICAgQ2hhbmdl
cyBpbiB2NDoNCj4gICAgICAgIC0gU29tZWhvdyBJIGZvcmdvdCB0byBzZW5kIGl0IGluIHYzLiBT
byByZS1pbmNsdWRlIGl0Lg0KPiANCj4gICAgQ2hhbmdlcyBpbiB2MjoNCj4gICAgICAgIC0gUmVt
b3ZlIGFybTMyIGNvZGUNCj4gLS0tDQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNh
LmZhbmNlbGx1QGFybS5jb20+DQoNCknigJl2ZSBhbHNvIGJ1aWx0IGZvciBhcm0zMi82NCBhbmQg
dGVzdCB0aGlzIHBhdGNoIChzbyB0aGlzIHNlcmllKSBvbiBmdnAsIG4xc2RwLCByYXNwYmVycnkg
cGk0LCBKdW5vLA0KYm9vdGluZyBEb20wIGFuZCBjcmVhdGluZy9ydW5uaW5nL2Rlc3Ryb3lpbmcg
c29tZSBndWVzdHMsIG9uIGEgZmlyc3Qgc2hvdCBldmVyeXRoaW5nIHdvcmtzLg0KDQpUZXN0ZWQt
Ynk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KSeKAmXZlIGxlZnQg
dGhlIGJvYXJkcyB0byB0ZXN0IGFsbCBuaWdodCwgc28gb24gTW9uZGF5IEkgd2lsbCBiZSAxMDAl
IHN1cmUgdGhpcyBzZXJpZQ0KSXMgbm90IGludHJvZHVjaW5nIGFueSBpc3N1ZS4NCg0KDQo=

