Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE50367E4D5
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 13:14:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485548.752853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLNc6-0003Cx-IY; Fri, 27 Jan 2023 12:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485548.752853; Fri, 27 Jan 2023 12:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLNc6-00039n-FR; Fri, 27 Jan 2023 12:13:50 +0000
Received: by outflank-mailman (input) for mailman id 485548;
 Fri, 27 Jan 2023 12:13:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JKSU=5Y=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pLNc5-00039M-AW
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 12:13:49 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe13::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c75c16a-9e3c-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 13:13:46 +0100 (CET)
Received: from DB9PR05CA0014.eurprd05.prod.outlook.com (2603:10a6:10:1da::19)
 by AS8PR08MB9072.eurprd08.prod.outlook.com (2603:10a6:20b:5c0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 12:13:44 +0000
Received: from DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::78) by DB9PR05CA0014.outlook.office365.com
 (2603:10a6:10:1da::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Fri, 27 Jan 2023 12:13:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT064.mail.protection.outlook.com (100.127.143.3) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.17 via Frontend Transport; Fri, 27 Jan 2023 12:13:43 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Fri, 27 Jan 2023 12:13:43 +0000
Received: from 0bf3a71630ea.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5236DC4F-651A-4ADB-B12F-61ED2305E6A1.1; 
 Fri, 27 Jan 2023 12:13:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0bf3a71630ea.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Jan 2023 12:13:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR3PR08MB5625.eurprd08.prod.outlook.com (2603:10a6:102:89::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 12:13:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 12:13:29 +0000
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
X-Inumbo-ID: 0c75c16a-9e3c-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxm2NaW8a7M+SYSIA1DsK65dUhGmuldvYGg8PctsAig=;
 b=JClBxeRDcTQ82BNk83eqTcYlabi22bbAxiYdCRxlOE5cSRt8j1R7rC8AInNyNXz5+YF+YRYDt/hkSgFO3+cFipLDGghsMb54VQ4/TCG/Ki4WbgC0nW5guFOPEh5+oAz4gLgYEV2vUqbbuBFviRSmYLNhWds5V7zD6Me4AGeakbQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHI66ulJ/oDBPhEdj3f86neOoZ4//KfaIgCiE+tGjc0J3RQHJ+HgMil1XJtxqLNhME1LFY3/m45BHu1ZOQUr3frME8sUx3Gdj+1JFbETqq6uiLATELgvzx5ZoUf5lgF/S+kDL51e6opP8hf0uWuXYmpA0dBscI5uTjwgW4jW9eaykIcp/Y8fqX6cHlstUmPRvNsaj3mhRcSxtAheJdj+604aORUKFb1XVB45vAfd7iqXiThuZ6TtJ9YZ8E5FldKdeXYheazjl0UknZykoLM/dinSL6Vgm33UqJG7Wg+xoDzyr1PYuiSr4owjOTeJIbQ2ViRb15gAqzUsAgnYU5il3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxm2NaW8a7M+SYSIA1DsK65dUhGmuldvYGg8PctsAig=;
 b=AtMj6M6Ob8mOca0IAmxI6GXKBBYwAQhOpXTnozY1MwAg+AHQSMlXTaCgrCvMyWBdWhNPQXKzHOZscvSoaYB1U+JofjgkHq+tYZXKE7y5PDTmtmd//fZDbczKC3hq2myFqEpzKGh4l/6Kn9HVubkiOHOd7ILDVknHqVxmj20Fu1d2kwlzxgGHXujI04G2dTusXio8D1q00wPx13AstkzuJw6weslg0dycdq75EkxW0Hc9C2Q2gPJVxRIHXe/NXlArn4xVd4ZR98n3FVtt7JlXT3iM9gNN6DliZYPKOMuCLNyhz7DsRRksGrcD2JUf9IwzodiendXiNDwFUfpgU2tznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxm2NaW8a7M+SYSIA1DsK65dUhGmuldvYGg8PctsAig=;
 b=JClBxeRDcTQ82BNk83eqTcYlabi22bbAxiYdCRxlOE5cSRt8j1R7rC8AInNyNXz5+YF+YRYDt/hkSgFO3+cFipLDGghsMb54VQ4/TCG/Ki4WbgC0nW5guFOPEh5+oAz4gLgYEV2vUqbbuBFviRSmYLNhWds5V7zD6Me4AGeakbQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <julien@xen.org>
Subject: RE: [PATCH 3/3] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
Thread-Topic: [PATCH 3/3] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
Thread-Index: AQHZKU4fKh9kG5Xa7kmVEqYgCVpcz66nH76AgAbPKgCABD7DYIAAEFuAgAAAmkA=
Date: Fri, 27 Jan 2023 12:13:29 +0000
Message-ID:
 <AS8PR08MB799123266FEC2B60BDD3409592CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-4-Henry.Wang@arm.com>
 <d9861060-22ba-5fce-eef6-a7f2ef01526a@amd.com>
 <25264dca-acf6-7ad1-e8a5-a1b893eab30d@xen.org>
 <AS8PR08MB7991A2641FCF28C39F0D2FD692CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <b1e2c76f-4d93-647e-ae3e-f83724cbd1e0@amd.com>
In-Reply-To: <b1e2c76f-4d93-647e-ae3e-f83724cbd1e0@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6C9A3BCDC87C604880D5EE023BDC60F7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PR3PR08MB5625:EE_|DBAEUR03FT064:EE_|AS8PR08MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a16ddd-d78f-4e64-703e-08db005fef3f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7eAYfDp4+Y0JovXWGgXYQphOaPtpYDB3S7+PztV380u4ChAvb0rTK3f5WfZl7+R375XVcKbpz254KmYsyUV+bIig+KHDWpaSfbAMLFykqn5rBAGcH31TkI9rJ5wUAxnSY1GHYJwByW5NnJzOv/uSFYQjBdpnt5vhW5Ld7TxgRX/KXiQuNDqZr99Z/EA9JAYcTcOsEyadfl7+1pDOL+0Mh2hs2QZLHvmn2iu4jtma2K3BgVTC4EmrhonYZ2WhvbYl2AdBaejfi48nxiarYpBoXtvuTJi+zoBnPNUztTWtF3XVtr2u04A+tXjNgUK5uXcWzEDhK5yfeRej2g8nrzJAXCnLmlyKXZ+tjejbNe56FR1FjIc2Jh33OTCuHHJ9O8J5oLqY3hK8x+k9x85CconG6MeJ+Ci6KZsRXMpxbUcn1ckrmvgVGDkJarGAkg0d21FijF0L0x9ct+RJTXKMMt/edCKNFPMz9aCDII45Pq6of8X0P39Y9MmuNh0EG4ROGp+DnsurrGE4ShWlsAHSEB/6zgjWwEQKQA1rkwMFUUhELAeY07QfE7l17N6mDM43CIh5q01byuEJUUcbhh20efzIkyqnpobNroNPU8q/vZGSQK+dppTXoEd6qZ+imC/GZlEsg880BX1KH75ARnaNTUzJWQkm4Gzspcl2NnB8y2cTneJoUVVURhXhbfARR/8LiM/8uOclCx82rjM31uxtRYhckg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199018)(8936002)(2906002)(38100700002)(478600001)(33656002)(5660300002)(186003)(53546011)(7696005)(9686003)(26005)(55016003)(38070700005)(52536014)(86362001)(41300700001)(71200400001)(83380400001)(76116006)(4326008)(6506007)(66946007)(66446008)(64756008)(66556008)(66476007)(122000001)(8676002)(316002)(110136005)(54906003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5625
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0a00c396-32d5-482d-3743-08db005fe69c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dZHJzKR/9orEYcw7WrnzylDiG7MH5VJDrF/3+vbgR5DQpOSznMw0D3BJ3wOWBI97ORFygr1nlsUosq9+ezPjMXldtP4kVtsa4FVdky9qnHkviELePdNj0i6uI79pI+8GHmlYc7kXJ7p+hKFckPrZa+B1n9jUbkTPGwI6kE4GZrUfzuruHKCLtbi7vOvsK5k42sr67XYiVDe8zALHQ24Dyohy8/8FE27qmFnAQ6EM82Kb31cfzzgFBJXcHpFsZ2nwdr0mshWczJUEZaQoC+Ic4GMyiFQAkI4Vx6oxtu+gJtdbF9XNtK8VdSKbYYyy0H9oEo4yvKUR+aEM50z8Mi3QSZnIDx2Az2c3JqKc+tARb1XzNz4GaXHBfWCSjvL25GDrUDNPYAT3JyrEUsRBi2fPZdUqVjn2Frlz1HkXsK6IytFwkznMHP4JaHTxNNkSs8BEAgQhbUY5VLljmFDFaBwZOp92cCrhnGiXe/xUbR/MONY9ZF9/+bdpIsOy+Sv1Zw/cN7WdFpQ8FGE/Fql8ZW4sQVpR51EkahcznrF6af84lZKrGdREPDeu6hw4saXTnEpNOL7IUK5aR8ZAUm9nnS+V9KF1i3GgYJ4QfrdSwzjvFCumel/IWIq6IPNwg8uNLyPz4SHWX1aS2pP3jzu+mNnQ7jhBhu3GX+IT9NuGfrD/cKcZ0i+8p50ALxuGSBiSCspBzAWg3zpGQdYKDIP2TWoWzw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199018)(46966006)(36840700001)(40470700004)(2906002)(5660300002)(52536014)(36860700001)(41300700001)(336012)(47076005)(8936002)(53546011)(478600001)(9686003)(186003)(26005)(316002)(4326008)(6506007)(82740400003)(70586007)(33656002)(356005)(83380400001)(81166007)(40480700001)(86362001)(7696005)(55016003)(40460700003)(8676002)(82310400005)(110136005)(54906003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 12:13:43.8706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a16ddd-d78f-4e64-703e-08db005fef3f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9072

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy8z
XSB4ZW4vYXJtOiBDbGVhbi11cCBpbiBwMm1faW5pdCgpIGFuZA0KPiBwMm1fZmluYWxfdGVhcmRv
d24oKQ0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAyNy8wMS8yMDIzIDEyOjE1LCBIZW5yeSBX
YW5nIHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBIaSBNaWNoYWwsDQo+ID4NCj4gPj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pg0KPiA+Pj4+IC0gICAgQlVHX09OKHAybV90ZWFyZG93
bihkLCBmYWxzZSkpOw0KPiA+Pj4gQmVjYXVzZSB5b3UgcmVtb3ZlIHRoaXMsDQo+ID4+Pj4gICAg
ICAgQVNTRVJUKHBhZ2VfbGlzdF9lbXB0eSgmcDJtLT5wYWdlcykpOw0KPiA+Pj4geW91IG5vIGxv
bmdlciBuZWVkIHRoaXMgYXNzZXJ0LCByaWdodD8NCj4gPj4gSSB0aGluayB0aGUgQVNTRVJUKCkg
aXMgc3RpbGwgdXNlZnVsIGFzIGl0IGF0IGxlYXN0IHNob3cgdGhhdCB0aGUgcGFnZXMNCj4gPj4g
c2hvdWxkIGhhdmUgYmVlbiBmcmVlZCBiZWZvcmUgdGhlIGNhbGwgdG8gcDJtX2ZpbmFsX3RlYXJk
b3duKCkuDQo+ID4NCj4gPiBJIHRoaW5rIEkgYWxzbyBwcmVmZXIgdG8gaGF2ZSB0aGlzIEFTU0VS
VCgpLCBiZWNhdXNlIG9mIHRoZSBleGFjdGx5IHNhbWUNCj4gPiByZWFzb24gYXMgSnVsaWVuJ3Mg
YW5zd2VyLiBJIHRoaW5rIGhhdmluZyB0aGlzIEFTU0VSVCgpIHdpbGwgaGVscCB1cyB0bw0KPiA+
IGF2b2lkIHBvdGVudGlhbCBtaXN0YWtlcyBpbiB0aGUgZnV0dXJlLg0KPiA+DQo+ID4gTWF5IEkg
cGxlYXNlIGFzayBpZiB5b3UgYXJlIGhhcHB5IHdpdGgga2VlcGluZyB0aGlzIEFTU0VSVCgpIGFu
ZCBJIGNhbg0KPiA+IGNhcnJ5IHlvdXIgcmV2aWV3ZWQtYnkgdGFnPyBUaGFua3MhDQo+IFllcywg
eW91IGNhbiA6KQ0KDQpUaGFuayB5b3UgdmVyeSBtdWNoISBBbmQgYWxzbyB0aGFuayB5b3UgZm9y
IHlvdXIgZGV0YWlsZWQgcmV2aWV3IDopDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+
IH5NaWNoYWwNCg==

