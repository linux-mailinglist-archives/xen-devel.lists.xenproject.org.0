Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA96F549C
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 11:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529044.822960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu8iZ-0003ak-57; Wed, 03 May 2023 09:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529044.822960; Wed, 03 May 2023 09:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu8iZ-0003Y9-1Z; Wed, 03 May 2023 09:24:11 +0000
Received: by outflank-mailman (input) for mailman id 529044;
 Wed, 03 May 2023 09:24:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PgPZ=AY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pu8iY-0003Y3-1Z
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 09:24:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2082.outbound.protection.outlook.com [40.107.7.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41efe7cc-e994-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 11:24:09 +0200 (CEST)
Received: from AM6PR0502CA0072.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::49) by AS2PR08MB9975.eurprd08.prod.outlook.com
 (2603:10a6:20b:62c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Wed, 3 May
 2023 09:23:34 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::f5) by AM6PR0502CA0072.outlook.office365.com
 (2603:10a6:20b:56::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.33 via Frontend
 Transport; Wed, 3 May 2023 09:23:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.22 via Frontend Transport; Wed, 3 May 2023 09:23:33 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Wed, 03 May 2023 09:23:33 +0000
Received: from 0921191df72a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02A1AA8F-D41C-45C9-A4BF-BDEBC6B8812F.1; 
 Wed, 03 May 2023 09:23:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0921191df72a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 May 2023 09:23:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM8PR08MB6356.eurprd08.prod.outlook.com (2603:10a6:20b:36b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 09:23:19 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::bce1:f206:86af:31be]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::bce1:f206:86af:31be%6]) with mapi id 15.20.6363.021; Wed, 3 May 2023
 09:23:19 +0000
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
X-Inumbo-ID: 41efe7cc-e994-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/fSbBTFe3/uzUMdyRg6Fli0XJbqBBbHqOn+Zoz/Qus=;
 b=gPLp8Jd07J+b27HVBb01G5c85sou7BAXnjVa2AtlqlhwMPN6oj/ChUBaD4UxnjSsBAcJZPSW9CyW2EQU9QyQT1PuC4Desocm0r/bEsOJUMk4hbWTNxyGfKFzYdAou1s2ILT31aUnb0G+/u1bxTK+dpzM5RwzLFDvuoQP4pyczg0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 719093a87f3c6ce5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItxQTXveafxQT6qGqiK0sW41uxS+L9SdUTpm65Zrqzd0slDbkkB9S3wdSz+JlNHW2mPxu546Vwm2CckQ/XZAu5T00f/0pyRXxkl8aU+c2YHzYflIdROtIGf8rfw/3Ez34+mf//iZwYjXijiFIZ8G05uU3aDwRSFqwwiy4x+O5fVBPZoRu1zkvk1vS24CKmSh15nks9czTj7kBatcSVpgk3xUXNBwThCZvnE9VAvvLoD+ge4hzHNrTSF9UwOHc0Bevj6kDzbwFDOJP2kqVd2IguxFleoe+Gx46GtvIyyjXGUIkyr2Tkw8TVu3GgXeecvKmUmbNdnMkPY6l1phX0T/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/fSbBTFe3/uzUMdyRg6Fli0XJbqBBbHqOn+Zoz/Qus=;
 b=XguU+roEG5S+n/KMfm+ThVDFzaoACjWpusoETMjuSwUQ+28OezuVXCIIgEVwW63Lv0FHEKdOZyIuS7L6b+usFVXNFaMNfRrpEhL8G5dvNk1/5V5fgJ2lD4VKNVeHwC5REdNBMvwuUkdEiwFyD2SoKSO57jx2f5d7LQmoSmp7XrOkyO/4cI5+1/4TNP1eOalSBuIdG7kkxcWOpRmdp8hMnmcxgxDs2dyfqp9B6OsAOEtgt1VHU0LeE7bX5JQjzJmY/IvBTWTrkktw3ridCqU9xF/vDf+eQTHkaocCdLshsohzLv2YyCSzIMM0e4QVzSna6T71JWKIH0w46HhqiUfDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/fSbBTFe3/uzUMdyRg6Fli0XJbqBBbHqOn+Zoz/Qus=;
 b=gPLp8Jd07J+b27HVBb01G5c85sou7BAXnjVa2AtlqlhwMPN6oj/ChUBaD4UxnjSsBAcJZPSW9CyW2EQU9QyQT1PuC4Desocm0r/bEsOJUMk4hbWTNxyGfKFzYdAou1s2ILT31aUnb0G+/u1bxTK+dpzM5RwzLFDvuoQP4pyczg0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Christian Lindig
	<christian.lindig@cloud.com>
Subject: Re: [PATCH v6 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Topic: [PATCH v6 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Index: AQHZdnKCeDO91wnv7UqBsQsgLvHj6a9HNTmAgAEfoAA=
Date: Wed, 3 May 2023 09:23:19 +0000
Message-ID: <34A79CE8-FEE8-426B-810C-1E928E207724@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-10-luca.fancellu@arm.com>
 <4e6758c0-dd81-4963-8989-d941eba2b257@perard>
In-Reply-To: <4e6758c0-dd81-4963-8989-d941eba2b257@perard>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM8PR08MB6356:EE_|AM7EUR03FT006:EE_|AS2PR08MB9975:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7d314a-72b7-4766-2907-08db4bb81105
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pwdSKhDAs+MaGRnoB1uwi+D+3Nk7oM8LNainJYqONG1yB2KmApys5N6Of5jXhEJLtDG6zGv2mvGwxh5giyypZ8Yg+NYhFh2AEiEcdcI6tb1C/CJUSHSG2XpnkSUbHcmn/2LlybF3jXDlv31yRr0jujibqfC9W1IeTZSnNyWFYXNiHsIyYUQ12royGN6YkIW707RaS53whxJeR1juNgKfwsCow9VhDoRshxrAKu0bW9g1AwXjnD966jG7Uauw+wuMdeUfuhkPgxNJ4ml/YSPt3qTKfFAro7nruxek9NVOXASvRWgZTL9XyCnLX/X6hrJjzZ7eZzhEfsM26DTV0U9ifs1VkRSIoV4NcpFDqx99cabvB1zdq7zB5Bo3/m76lG+Es2HriGKVgQsq63LkPrLAEanGPgVWucicOBJTJfLBaSlxHXD5rF0eOrAWzAKWApbWWJOUim1xJ3p6XpZga/sCOFg6bRR8kVQW5YnAYiWyItkXAGMjwIo/3W+vQsrYJ97fUtJ1ZNphdro5z1ALHQMk8ZCAcYzHF710lE5GrhD4Skr3qSd9t+I6w3gQomPPiiAq0Nmnrl40wNuOm261cPsWXiNl5fx97f+2j5UtGPaJq1T5EpUaPB89o3OKnBrmzUVsREDNrwPutanH51pZVNolIQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(76116006)(91956017)(966005)(71200400001)(6506007)(6486002)(478600001)(2616005)(6512007)(53546011)(26005)(54906003)(186003)(6916009)(38100700002)(7416002)(2906002)(4744005)(36756003)(33656002)(5660300002)(122000001)(66556008)(66446008)(64756008)(66476007)(66946007)(4326008)(41300700001)(8936002)(8676002)(38070700005)(316002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A55BEE214CFBD4C841E48339770822B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6356
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d137c074-f75e-49c3-d7a7-08db4bb808ce
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o+IzolzGAT5eNBQHz1/w8bqG4vLdPEOg6Cd181NTE0XWobbea9tLnDApIqTbDrfGn9WG/l7+kLOkxBJFPvBqn0ADSB5SO571xh+/uB6EAOlnNr2VXNuBlOA2REFYJSUENfKPbjDny5rozebP5chDGj76iTztEY+Jx6umjmj9m3sBuZTpvHG7FSZcq8pULSjVrW86jBG0CGeXzCufbcdBKrK/bJ4Y7MNGWpTU/G7FTGZN0Puihw8Tf48Dwhd6qmrb6JCb/wxVsUAjl4aQOk1RgcjWyMoe8lF5Aw5NqXkELC6jsWmfOY3I1J9m/iYdbzFRw5fDPvJ6HE3S1rtitXpImIW+mdvdxYYMvGHwGljjai1i+yNfr3oIqJVtmIZgebkqFE7GMCrFusNjGZwAy1D54UmQOvCyuyQYKzpHzZIJMrNbZ+BnJxjqmUi/Y1T5aTXaLVB4XDBbU/t3Tnh8BsAUlceYcPg7tImzuKkJ/wnsnbqsMHIJUeA06TcSH//6CJM9Mfte35K3KIrMfOd6Kst6t9twv31tCvkG3W1+EqfUUD7rY98IjB3Bzpg3eGPGE4MPVKTHZtxcy1nxM8eXfkfv4UtQJJDR6hrs2eukqIOxxTygzqOiInru5tB1YU4mh/KnixUMAKaMS5Q9RugVaXLR+RAOziRdx78VdVlFxtWutzCqH0e2jRKMTte3/DXyjDz5fx9jIQcGdRSIW/lbG662yWM1OdDHCZjYoCQS/emzkMo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199021)(36840700001)(40470700004)(46966006)(2616005)(107886003)(478600001)(36860700001)(186003)(4326008)(54906003)(70586007)(70206006)(47076005)(53546011)(26005)(966005)(6486002)(6512007)(336012)(6506007)(316002)(6862004)(34020700004)(40460700003)(8676002)(82740400003)(8936002)(5660300002)(356005)(41300700001)(2906002)(40480700001)(81166007)(4744005)(82310400005)(86362001)(33656002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 09:23:33.3892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7d314a-72b7-4766-2907-08db4bb81105
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9975

DQoNCj4gT24gMiBNYXkgMjAyMywgYXQgMTc6MTMsIEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgQXByIDI0LCAyMDIzIGF0IDA3
OjAyOjQ1QU0gKzAxMDAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvdG9v
bHMvaW5jbHVkZS94ZW4tdG9vbHMvYXJtLWFyY2gtY2FwYWJpbGl0aWVzLmggYi90b29scy9pbmNs
dWRlL3hlbi10b29scy9hcm0tYXJjaC1jYXBhYmlsaXRpZXMuaA0KPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYWM0NGM4YjE0MzQ0DQo+PiAtLS0gL2Rldi9u
dWxsDQo+PiArKysgYi90b29scy9pbmNsdWRlL3hlbi10b29scy9hcm0tYXJjaC1jYXBhYmlsaXRp
ZXMuaA0KPj4gQEAgLTAsMCArMSwyOCBAQA0KPj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wICovDQo+IA0KPiBEbyB5b3UgbWVhbiBHUEwtMi4wLW9ubHkgPw0KPiANCj4gR1BM
LTIuMCBpcyBkZXByZWNhdGVkIGJ5IHRoZSBTUERYIHByb2plY3QuDQo+IA0KPiBodHRwczovL3Nw
ZHgub3JnL2xpY2Vuc2VzL0dQTC0yLjAuaHRtbA0KPiANCj4gDQo+IEJlc2lkZXMgdGhhdCwgcGF0
Y2ggbG9va3MgZmluZToNCj4gUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPg0KDQpUaGFua3MsIEnigJlsbCBmaXggaW4gdGhlIG5leHQgcHVzaCBh
bmQgSeKAmWxsIGFkZCB5b3VyIFItYnkNCg0KPiANCj4gVGhhbmtzLA0KPiANCj4gLS0gDQo+IEFu
dGhvbnkgUEVSQVJEDQoNCg==

