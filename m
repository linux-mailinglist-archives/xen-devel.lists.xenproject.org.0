Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD20433776
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:44:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213268.371445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpPF-0005Af-7x; Tue, 19 Oct 2021 13:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213268.371445; Tue, 19 Oct 2021 13:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpPF-000587-3j; Tue, 19 Oct 2021 13:43:53 +0000
Received: by outflank-mailman (input) for mailman id 213268;
 Tue, 19 Oct 2021 13:43:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJzt=PH=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mcpPD-00057f-Jh
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:43:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.52]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 971d4afa-30e2-11ec-8313-12813bfff9fa;
 Tue, 19 Oct 2021 13:43:50 +0000 (UTC)
Received: from AM6P192CA0097.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::38)
 by VI1PR08MB3856.eurprd08.prod.outlook.com (2603:10a6:803:c4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 13:43:48 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::33) by AM6P192CA0097.outlook.office365.com
 (2603:10a6:209:8d::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 13:43:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 13:43:47 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Tue, 19 Oct 2021 13:43:47 +0000
Received: from ddb141f13b82.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 89BC8929-12C1-4253-9195-E2095B08F15D.1; 
 Tue, 19 Oct 2021 13:43:40 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ddb141f13b82.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Oct 2021 13:43:40 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB7PR08MB3372.eurprd08.prod.outlook.com (2603:10a6:10:4f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 13:43:37 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 13:43:37 +0000
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
X-Inumbo-ID: 971d4afa-30e2-11ec-8313-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfF4aGzbao5s2QskKfQB8lsOjZ3y/bfjYyciZvbA2rY=;
 b=6oHmzTXSn20XIQ2o7FhSDtYbVrCI8v5n+Ij2F7Na9un+owkMhGb9gtectawICQFvFe5pSAWUUr95IYbaPpa7YLmAIm7rGF/Gn/u84CQfAizKSJ4fVFpzbmLAwGX6N/nmAGfCwfk9H/rYj1/lK/iE/SREHPeYb1WkSZzn2p8nQIg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 708c69ec7b2c79e2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfJNdKV7C7rdLFAXGssU+VezxhdFyqAr7Q2IGDwKeU21N9J0Pq13K75EvuT8i4dEQ/VmZ5vMRLLUDlib1vCrGaNulbOsM5Vq2hKL0i0AT8GKd1S2bvau1pypPjifgCsMuAp/OpDPxjKeLBYmBzcTtPPVJ5zbp6uIFpRv0/5sCAnhTReRYUXLs4Oy6iC4/kzipCanGiaXHicHIinjCXyG5lXWhCIVPBmDYXgUk5iH9APR+vTrT8lOhoqjUEP1Oji0W5/8MTnx1DEPbAbj1qqNAVJKVp+gPFW8ecnx/iEqN7PjWb11LNGbEA8WxJN7gaChkaySS/bxFtylbnE8MTwEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfF4aGzbao5s2QskKfQB8lsOjZ3y/bfjYyciZvbA2rY=;
 b=Nk3hAozjSJL0i3h8cXxMU8dmCVrcT9/B+KCn54PwLeW8PRmLdSicU75ZaqdOqxwBO7jURyNpSu68uhhS70oNPJ1CPZ1dHjhOzQZ6n7NkKCXaV4Lvf695uvdruDz20EZlU6lcwAIHgw33wf7uuVJiDc2LCkpWZ8+ozMmKk14je5VsZ2OcklRjq2wcsTvgLOc13aLUBBZDcEXlljF5MmWQ+xKiL4s5IuTnt5BWnHAFQ6mHCYQxwGXHFneL3O5S7N3RvyRcG/3SCzxvQ0zrUIXTcEA3Gv7ps2REnADE2ELJSr476T99Dhb0+lBef2Vf6lCNbugp2BmgkCMrSTePToR0OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfF4aGzbao5s2QskKfQB8lsOjZ3y/bfjYyciZvbA2rY=;
 b=6oHmzTXSn20XIQ2o7FhSDtYbVrCI8v5n+Ij2F7Na9un+owkMhGb9gtectawICQFvFe5pSAWUUr95IYbaPpa7YLmAIm7rGF/Gn/u84CQfAizKSJ4fVFpzbmLAwGX6N/nmAGfCwfk9H/rYj1/lK/iE/SREHPeYb1WkSZzn2p8nQIg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "iwj@xenproject.org"
	<iwj@xenproject.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] xen/vpci: Remove __hwdom_init for vpci_add_handlers
Thread-Topic: [PATCH 2/3] xen/vpci: Remove __hwdom_init for vpci_add_handlers
Thread-Index: AQHXxNXruySz06Rv/0aNVGzqN8rSbavaQv2AgAAKnwCAAAdagA==
Date: Tue, 19 Oct 2021 13:43:37 +0000
Message-ID: <84BB039D-6EAD-4B4E-A56F-5961D8F9EEDA@arm.com>
References: <cover.1634639117.git.bertrand.marquis@arm.com>
 <33b03be7eeea521953790542eb31d5a1386d2b81.1634639117.git.bertrand.marquis@arm.com>
 <116f5313-f2a3-376b-a0a3-af0d14d82125@suse.com>
 <YW7FXibf4DRS2TPa@MacBook-Air-de-Roger.local>
In-Reply-To: <YW7FXibf4DRS2TPa@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fa571c42-bea4-413d-1178-08d993067a35
x-ms-traffictypediagnostic: DB7PR08MB3372:|VI1PR08MB3856:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB38565AEF1F17E1B71A6CD7399DBD9@VI1PR08MB3856.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gQQGhlQ9pcWPxjzAOoLwYQuegvpJFUqk4BE9PEvTgwe1KLox2bkYWNsySgaDfVbJ+1HLQzXm6Rjgn0KzRggNhdU0oiqJZSFJzcgb2H0vYntvBKei3DRyqlPVJnrlNNiJ36ZZvD6YAWLodxEhcsytFrZTwkE+Tj6snya37lauRJ3Ch2M7qu0GhIIyn2tTQ1nvL6O84ErIOvLavw1yMG4cc00NYIKEsDX1LaZrpFjRyU9HS4oCRsmiXE55krC68vP9aWEUP3JjfIlPozGz2mSYbRzfRUgrlxzan7AbSJgPgXa1TYS31mUYes1CVlDc3cB2txkFZxMU1LvMjCj7F1eYlTKq1qDNx9t0hUoaI0VH0Bb7Hd/hCJd9XWPuL8PSjVNGAnPoLcpu06Mf692jIEnj5sTAJL6A/8288kRr5VVL40TKDiHdOnwW7Kb5KKZMHaMeu/qjx/6tDX2yzGSWJFpwUynKCpytTeQn8G0Y0zfjCUS1DYNjr0c6kFkPJu8MwHWmBD7VPxcQIqlvApqEZfMrsMqtd6g0tyJcYuSXL0i24YvVvQtJKfPX10pNX/zjNSfT2pwcrJH5Arqrhy1M00QYvUkmH3/xXnpZnsGBUy9aq91tfGrfyzPTv/W2oqwxOItu28qUSZQ7F3UxtyeQBnlsNNvsowLCn00BM6yQW/Y/FpKPP98/ztKdE4oWUz2SNcRZcp1WJDBij6G3M+3sJJ0ntb3LLFX0psqyHPDURVIPxbyJxKvnY4B9RSLLrshO8rWV
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(26005)(86362001)(6506007)(53546011)(122000001)(38100700002)(83380400001)(2906002)(6486002)(36756003)(6916009)(38070700005)(6512007)(66446008)(66476007)(5660300002)(316002)(8676002)(8936002)(76116006)(66946007)(64756008)(508600001)(91956017)(4326008)(66556008)(54906003)(33656002)(71200400001)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1004D46FFA6F2F4FB61E3BF2B058AB58@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3372
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	63ea2487-935d-4846-302f-08d9930673f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LNgliARpXNOOTkPOLifMGa69X8o49Gwqvo65vRHwQKbDByqsRvv4znuAWgd4R7XXTKFW7upCOmvkssuQQ/qlQBeIuETJ+coQieT9u6N/c2ldHly3JS2CyyyFQGDf2GFSIDbYR3Gh4Iz6hSsTKb/Uk3NJXm3JySHmBqqQ0k8vIFyGzSomKQtKnTypc03PYH6jL2gWKsH6yRcagoqxsHERxZtZhoYGbwAnnQPDQq6ncZ9pVsF+2K3Hwvp7IRPEOqwyoCo6mdO+ogBtG75hokevLfV36u6t6cGBm0KZ22B2D0GdOX28A2u7LWGFkAmM5eyKcY2pWB2qyhEBnTVu34cGcOrOrtKmpgjhZmUEvhPd/0dJLmcK7T0swGuUdNmLlxON5DQWfYUkmyAaaxlMGszGW2RfT2+VlVfcgDvV0srqzN6rncdnj4czf+d7lpBRAj6z0jZwkBY3iDHdTbtjq3ZGkjdLWWD+WyB6hXUw/Oq5HfbJWVDKpDr8whdp5nsJ8H64gKN0vti4iWL1bT1DoS2zG1rZMLPQBf6W9vrikCi+hUO8LBu6MyTjLtE0puRwzk7jYO9XUQuCT2khmI6+TTB+aVPc7krOPod8LJJx1j2lnWXkw6GRtkk6hDnKZBIgBGZoA4vjuZHSc5wMCJJzCgWLtM/PUkZMyo9ZYnPFBQw97kbsQ1WmaYeaC1Swx6sRfpG6dF1CDT8Po5CSpi3Xga7mPA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(336012)(36860700001)(47076005)(356005)(2906002)(82310400003)(36756003)(6862004)(316002)(53546011)(6506007)(8676002)(81166007)(2616005)(4326008)(6486002)(26005)(86362001)(508600001)(33656002)(186003)(70586007)(5660300002)(8936002)(54906003)(70206006)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 13:43:47.7931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa571c42-bea4-413d-1178-08d993067a35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3856

SGksDQoNCj4gT24gMTkgT2N0IDIwMjEsIGF0IDE0OjE3LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIE9jdCAxOSwgMjAyMSBhdCAw
MjozOToxN1BNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDE5LjEwLjIwMjEgMTI6
NDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92
cGNpLmMNCj4+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4+IEBAIC01NCw3ICs1
NCw3IEBAIHZvaWQgdnBjaV9yZW1vdmVfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+
ICAgICBwZGV2LT52cGNpID0gTlVMTDsNCj4+PiB9DQo+Pj4gDQo+Pj4gLWludCBfX2h3ZG9tX2lu
aXQgdnBjaV9hZGRfaGFuZGxlcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4gK2ludCB2cGNp
X2FkZF9oYW5kbGVycyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+IA0KPj4gQSBmdW5kYW1lbnRh
bCByZXF1aXJlbWVudCB3aGVuIGFsdGVyaW5nIHNlY3Rpb24gYXR0cmlidXRlcyBpcyB0bw0KPj4g
YWxzbyBjaGVjayB0aGF0IGFsbCByZWZlcmVuY2VkIGVudGl0aWVzIGFyZSBhcHByb3ByaWF0ZWx5
IHBsYWNlZC4NCj4+IEFmYWljdCB0aGlzIGlzIG5vdCB0aGUgY2FzZSBmb3IgX19zdGFydF92cGNp
X2FycmF5W10sIGFuZCB5b3UnbGwNCj4+IG5lZWQgdG8gYWxzbyBhZGp1c3QgbGlua2VyIHNjcmlw
dHMgdG8gZGVhbCB3aXRoIHRoYXQuDQo+IA0KPiBJbmRlZWQsIHdlIG5lZWQgdG8ganVzdCBrZWVw
IHRoZSBDT05GSUdfTEFURV9IV0RPTSBwbGFjZW1lbnQgaW4NCj4gLnJvZGF0YS4NCg0KSSB3aWxs
IGFsc28gbmVlZCB0byByZW1vdmUgdGhlIHRlc3QgZm9yIENPTkZJR19MQVRFX0hXRE9NIGluIHRo
ZXJlDQphbmQgb25seSB0ZXN0IGZvciBDT05GSUdfSEFTX1ZQQ0kuDQpUaGlzIHdpbGwgYmUgYXBw
bGllZCB0byBib3RoIGFybSBhbmQgeDg2IGxpbmtlciBzY3JpcHQuDQoNCj4gDQo+PiBGdXJ0aGVy
DQo+PiB5b3UnZCBoYXZlIHRvIGNoZWNrIHRoYXQgYWxsIGZ1bmN0aW9ucyByZWZlcmVuY2VkIGJ5
IHRoYXQgYXJyYXkNCj4+IGFyZW4ndCBfX2h3ZG9tX2luaXQuIEluIHRha2luZyBhbiBleGFtcGxl
IChpbml0X21zaSgpKSBJJ20NCj4+IGFjdHVhbGx5IHN1cnByaXNlZCB0byBmaW5kIGl0J3Mgbm90
IG1hcmtlZCBfX2h3ZG9tX2luaXQuIFNvDQo+PiBtYXliZSBhbGwgaXMgZmluZSBhcyBmYXIgYXMg
dGhlc2UgYXJlIGNvbmNlcm5lZC4NCj4gDQo+IE15IGJhZCwgSSd2ZSBmb3Jnb3QgdG8gbWFyayB0
aGUgaW5pdGlhbGl6ZXJzIHVzZWQgYnkNCj4gUkVHSVNURVJfVlBDSV9JTklUIGFzIF9faHdkb21f
aW5pdC4gSSB0aGluayB0aGVyZSdzIG5vIG5lZWQgZm9yIGENCj4gY2hhbmdlIHRoZXJlLg0KDQpU
aGFua3MgZm9yIHRoZSBjb25maXJtYXRpb24gaGVyZS4gSSBjaGVja2VkIGluIHRoZSBjb2RlIGFu
ZCBkaWQgbm90IGZpbmQNCmFueXRoaW5nIGFuZCB3YXMgbG9va2luZyBhZ2Fpbi4gQnV0IEkgZGVm
aW5pdGVseSBtaXNzZWQgdGhlIGxpbmtlciBzY3JpcHQuDQoNCkkgd2lsbCBzZW5kIGEgdjIgc3F1
YXNoaW5nIHRoZSAzIHBhdGNoZXMgdG9nZXRoZXIgYW5kIG1vZGlmeWluZyB0aGUgbGlua2VyDQpz
Y3JpcHRzLg0KDQpUaGFua3MNCkJlcnRyYW5kDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCg==

