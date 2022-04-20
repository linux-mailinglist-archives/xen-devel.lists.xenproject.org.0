Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855F0508424
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 10:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309005.524965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh65f-0004mM-SV; Wed, 20 Apr 2022 08:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309005.524965; Wed, 20 Apr 2022 08:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh65f-0004jX-N3; Wed, 20 Apr 2022 08:53:35 +0000
Received: by outflank-mailman (input) for mailman id 309005;
 Wed, 20 Apr 2022 08:53:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TcYK=U6=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nh65d-0004jQ-Rr
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 08:53:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a908776-c087-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 10:53:32 +0200 (CEST)
Received: from AS9PR06CA0082.eurprd06.prod.outlook.com (2603:10a6:20b:464::31)
 by VI1PR0802MB2304.eurprd08.prod.outlook.com (2603:10a6:800:9f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 08:53:28 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::14) by AS9PR06CA0082.outlook.office365.com
 (2603:10a6:20b:464::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Wed, 20 Apr 2022 08:53:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Wed, 20 Apr 2022 08:53:27 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Wed, 20 Apr 2022 08:53:27 +0000
Received: from e103655df317.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 073F469A-7D00-4D90-8ABD-5E6465EEE14C.1; 
 Wed, 20 Apr 2022 08:53:21 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e103655df317.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Apr 2022 08:53:21 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM6PR08MB3175.eurprd08.prod.outlook.com (2603:10a6:209:3f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 08:53:19 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635%7]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 08:53:19 +0000
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
X-Inumbo-ID: 5a908776-c087-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHuLvhDHe0Uvo5t3pxFzHum+9JqXq1sn83pWAijGLCk=;
 b=4lHKwF6Fdon58euinYwsYezuvgM2nj65/6y3Bgs1J3kY8W7VuBFHOyahcdsAVUjWfdgIx5tJ8miCWAp1Y9NM+X9M6h9bdUcDCn+Zbi0uvOPHyL49gYth6bme7Tb0HZJfT3ZyBLsW3nWLho6bvhFjc4NeCkqr1KIpY4g1nrH+b+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 56be8d6473a12e14
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbohvbtBVN+/0XhEoxRXOTHHHEtR9UE0GjpUKgtzJA03HH9AEMxFHoP92tuPJaqY+nOsfBP7nR9LvIFixkWiTioeGGNJiMFteVAVjgO2ihJovh6sZmK87sj4jbckPDtCSmCeAoZc16dQhIv5xVwjpHVAebJTx6PwR2InsK7CjXrffUGDeHZhglT16pvgXt/rrV6QcLOVtm+XZLDiSe6j61clTM/hqBT/G/BEuJ5tMTKELvVx0E7zylQGbFkP1BaYY5QFRsKM+wgQxMt9k/75mRu4Ctyekev7FEAOE8AY+bkTab2Dv9oyJbdTIY0u8QoLWZtVuCMHoFWAEYcrIok+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHuLvhDHe0Uvo5t3pxFzHum+9JqXq1sn83pWAijGLCk=;
 b=WFkfLbDgBoLgErWw87wWSmm2czGOcV29kRubZizHOnIDhNbkCy2i56UkWg20OvvlQWWQBL3hLUidZja+Vw5ipOs17vByPrxxliWjE098eCJU3Si+APNCwCqGft6AO4lhDkQU3I0mHeIjvGPIw8ZHuxUta1u3x/R1S7wi9ImVnjK4dA/Qxxgmi1ut6tfDFuJJjDl7rz03jUU4XuMAwtbNn9QT68J47sAHtToMXo0IvvEM+cvyOWzCassZGcjhu8Jwy97lwYWNRHqtxTRgEpG7krUCwWnsYbP9l8G9YctRkl0+mFLcT6upWAqvyym+qT095UGWYj1+47fEbG6ByYvPUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHuLvhDHe0Uvo5t3pxFzHum+9JqXq1sn83pWAijGLCk=;
 b=4lHKwF6Fdon58euinYwsYezuvgM2nj65/6y3Bgs1J3kY8W7VuBFHOyahcdsAVUjWfdgIx5tJ8miCWAp1Y9NM+X9M6h9bdUcDCn+Zbi0uvOPHyL49gYth6bme7Tb0HZJfT3ZyBLsW3nWLho6bvhFjc4NeCkqr1KIpY4g1nrH+b+M=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 06/13] xen/arm: set up shared memory foreign mapping
 for borrower domain
Thread-Topic: [PATCH v1 06/13] xen/arm: set up shared memory foreign mapping
 for borrower domain
Thread-Index: AQHYNQ8JUHwL/QpeQ0iCIDnkwGGL/6zmznEAgACwWoCAET7aAA==
Date: Wed, 20 Apr 2022 08:53:18 +0000
Message-ID:
 <DU2PR08MB7325B86F6BFFE0232D0CEC42F7F59@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-7-Penny.Zheng@arm.com>
 <c4a3fb77-1cab-aacf-a2a5-3702f9c4ab97@xen.org>
 <b34727d4-1e8d-64fd-9d5e-84ed4255c320@xen.org>
In-Reply-To: <b34727d4-1e8d-64fd-9d5e-84ed4255c320@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EAACE6986DF3764BA84D389A2C375002.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b19bd223-3c99-414a-e0da-08da22ab3cb3
x-ms-traffictypediagnostic:
	AM6PR08MB3175:EE_|VE1EUR03FT040:EE_|VI1PR0802MB2304:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB230425AB0AD312665A4A7A6FF7F59@VI1PR0802MB2304.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uyVh6CwF+Hl1y06AYEdiI6glEh7zG5D8JbZBMX1I/qLkkh/92lC9XrbFXLZanciJivZX72u7zF20F5+M7WRh5eDOzMKmzkYFUIvbn/cOUsbIfoneunu0bWn2cBldYRbzeANmDjeF4mVzcpVKoFjIlzNpALGIYtU3eGsPsIogB8P9Lm+6eC4rH66aA/uhjCz8cCf3wRpSxx/v8HxU5vWdFDFH9nDH41oKi/xS9ZTG4Nq2EjAMcA1HjCDxESxVNhbLtdD1I0JipShyvQfLWri2pDQqBjBJmiiNDXbgwOgg3caNRmlkboefrEZjJ52ljUvgOEtdBiocmCmQ1jmvAFNDk7K/UfXW0as9VJg6IoOXeqKna/qn52QToBuzKMen2P7tqzy8cAJDJBaR4ybArMG/bbnPuXSSSYljnJ1XfAcIBr87UtqwF5uFcujFRiEXTIrkFy1jMIKTFMmrAftchvucHGm386+ktFx9i+3PLw5BnYklEEyyj5n3CYZUjf1iUvtL8R1GGnlskCnvcKqsbB8NzVQVzgWm0ImyQ+6rBlHUmuYD5DbsJzmgSleOQuOmSqzTpYmrB243DhmCVzW9AzWvhArpAplptuwgHAekO6R3vx6K7zxwAUxl1EPNsS5vfbC0fhH4U6+h9cD2sPDiYA0wVEZz20gijE6C8npOxpJKVaKyTFmFRF/U7CwnDACyP0gZSL0j9P/8hfdEbQLqzmW64Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(66556008)(508600001)(64756008)(66446008)(110136005)(6506007)(9686003)(33656002)(26005)(53546011)(66476007)(86362001)(316002)(76116006)(66946007)(54906003)(7696005)(186003)(8936002)(5660300002)(4326008)(38070700005)(38100700002)(2906002)(52536014)(83380400001)(122000001)(55016003)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3175
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52a524af-6f36-4045-3390-08da22ab3768
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wYlYtG5LXKnAlK5opE+WTCGd1NJM975teAQthJUy4Syn5DOPZeUs+PV7qZmVIUMwn7H2FSRSoxM4HxUd8YW1jpnAwBwYDKzpNsC6tWHRyNEANmNGqasLYcM4M1CpmBVJMMu1rfWOVjEFxnlaucv5kFiiBG370XL0G8z3YAQS6G7LGq540TtiKE3AAqMOdi8RyBLXAW+RNDQXehLVl8/sVuMogDnUnYCdB2GfuiJ7eyuHDbWpAgAqc+sb0JmwK99wRzLye608QrVpIRnBdv5ZslrB2pIcLNNnBEDxFvaXWgvg+dhSZUwYlhOisoyoGZeE0/FG9NU6CZOUffWy1E81BBeU7Iqvh76bU8nxIs4Px5xSrL3aEAgUTUa9CyuFzi0+aQlzTabdf+n/+zfn9u5dQUiZLQXpln4OPyFR71eTKqmR72QDKqFmSNzbqqOUeYMcN6DXqa3Z0cW7g9IHhtrE/pmWAbsxCAnmTHHsHAlYyG+tmZSWprzsWIoSV8XJzkTE/3gNyqUcme3HiA5oo2eUeYMGiTam565bEHlL6QTKSCVIbfmyfHEvM9E0ZlHN5IDwEhS4wnWHuvdHowkYd2boVC5c2cSguuSgyiLTdvtySfjIl3bANxl32zYKjZnnQ/YJtbgzwPLKSjxhRcJgmig5Ka+EUacfWPwN+nsGVUtIBWIhX14unOfn0T37ztN4DqOM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36860700001)(8676002)(70586007)(86362001)(70206006)(83380400001)(52536014)(40460700003)(8936002)(5660300002)(55016003)(82310400005)(336012)(356005)(4326008)(186003)(81166007)(47076005)(2906002)(33656002)(107886003)(508600001)(26005)(7696005)(9686003)(6506007)(110136005)(53546011)(54906003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 08:53:27.7957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19bd223-3c99-414a-e0da-08da22ab3cb3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2304

SGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgQXByaWwgOSwgMjAyMiA1OjMxIFBN
DQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogbmQgPG5kQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZA0KPiBNYXJxdWlzIDxCZXJ0cmFu
ZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNo
dWtAZXBhbS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMDYvMTNdIHhlbi9hcm06IHNl
dCB1cCBzaGFyZWQgbWVtb3J5IGZvcmVpZ24NCj4gbWFwcGluZyBmb3IgYm9ycm93ZXIgZG9tYWlu
DQo+IA0KPiBIaSwNCj4gDQo+IE9uIDA4LzA0LzIwMjIgMjM6NTksIEp1bGllbiBHcmFsbCB3cm90
ZToNCj4gPiBPbiAxMS8wMy8yMDIyIDA2OjExLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4gRnJv
bTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+ID4+DQo+ID4+IFRoaXMgY29t
bWl0cyBpbnRyb2R1Y2VzIGEgbmV3IGhlbHBlciBndWVzdF9waHlzbWFwX2FkZF9zaG0gdG8gc2V0
IHVwDQo+ID4+IHNoYXJlZCBtZW1vcnkgZm9yZWlnbiBtYXBwaW5nIGZvciBib3Jyb3dlciBkb21h
aW4uDQo+ID4+DQo+ID4+IEZpcnN0bHkgaXQgc2hvdWxkIGdldCBhbmQgdGFrZSByZWZlcmVuY2Ug
b2Ygc3RhdGljYWxseSBzaGFyZWQgcGFnZXMNCj4gPj4gZnJvbSBvd25lciBkb21fc2hhcmVkLiBU
aGVuIGl0IHdpbGwgc2V0dXAgUDJNIGZvcmVpZ24gbWVtb3J5IG1hcCBvZg0KPiA+PiB0aGVzZSBz
dGF0aWNhbGx5IHNoYXJlZCBwYWdlcyBmb3IgYm9ycm93ZXIgZG9tYWluLg0KPiA+Pg0KPiA+PiBU
aGlzIGNvbW1pdHMgb25seSBjb25zaWRlcnMgb3duZXIgZG9tYWluIGlzIHRoZSBkZWZhdWx0IGRv
bV9zaGFyZWQsDQo+ID4+IHRoZSBvdGhlciBzY2VuYXJpbyB3aWxsIGJlIGNvdmVyZWQgaW4gdGhl
IGZvbGxvd2luZyBwYXRjaGVzLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVu
ZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gPj4gLS0tDQo+ID4+IMKgIHhlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYyB8IDUyDQo+ID4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykNCj4gPj4NCj4g
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+PiBiL3hlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYyBpbmRleCA5ODRlNzBlNWZjLi44Y2VlNWZmYmQxIDEwMDY0
NA0KPiA+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPj4gKysrIGIveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4+IEBAIC03OTgsNiArNzk4LDQ4IEBAIHN0YXRp
YyBpbnQgX19pbml0IGFsbG9jYXRlX3NoYXJlZF9tZW1vcnkoc3RydWN0DQo+ID4+IGRvbWFpbiAq
ZCwNCj4gPj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPiA+PiDCoCB9DQo+ID4+ICtzdGF0aWMg
aW50IF9faW5pdCBndWVzdF9waHlzbWFwX2FkZF9zaG0oc3RydWN0IGRvbWFpbiAqb2QsIHN0cnVj
dA0KPiA+PiBkb21haW4gKmJkLA0KPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVk
IGxvbmcgb19nZm4sDQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBi
X2dmbiwNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIG5yX2dmbnMp
IHsNCj4gPj4gK8KgwqDCoCBzdHJ1Y3QgcGFnZV9pbmZvICoqcGFnZXMgPSBOVUxMOw0KPiA+PiAr
wqDCoMKgIHAybV90eXBlX3QgcDJtdCwgdDsNCj4gPj4gK8KgwqDCoCBpbnQgcmV0ID0gMDsNCj4g
Pg0KPiA+IFlvdSBkb24ndCBuZWVkIHRvIGluaXRpYWxpemUgcmV0Lg0KPiA+DQo+ID4+ICsNCj4g
Pj4gK8KgwqDCoCBwYWdlcyA9IHhtYWxsb2NfYXJyYXkoc3RydWN0IHBhZ2VfaW5mbyAqLCBucl9n
Zm5zKTsNCj4gPj4gK8KgwqDCoCBpZiAoICFwYWdlcyApDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVOT01FTTsNCj4gPj4gKw0KPiA+PiArwqDCoMKgIC8qDQo+ID4+ICvCoMKgwqDCoCAq
IFRha2UgcmVmZXJlbmNlIG9mIHN0YXRpY2FsbHkgc2hhcmVkIHBhZ2VzIGZyb20gb3duZXIgZG9t
YWluLg0KPiA+PiArwqDCoMKgwqAgKiBSZWZlcmVuY2Ugd2lsbCBiZSByZWxlYXNlZCB3aGVuIGRl
c3Ryb3lpbmcgc2hhcmVkIG1lbW9yeSByZWdpb24uDQo+ID4+ICvCoMKgwqDCoCAqLw0KPiA+PiAr
wqDCoMKgIHJldCA9IGdldF9wYWdlc19mcm9tX2dmbihvZCwgb19nZm4sIG5yX2dmbnMsIHBhZ2Vz
LCAmcDJtdCwNCj4gPj4gUDJNX0FMTE9DKTsNCj4gPj4gK8KgwqDCoCBpZiAoIHJldCApDQo+ID4+
ICvCoMKgwqAgew0KPiA+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVJTlZBTDsNCj4gPj4gK8Kg
wqDCoMKgwqDCoMKgIGdvdG8gZmFpbF9wYWdlczsNCj4gPj4gK8KgwqDCoCB9DQo+ID4+ICsNCj4g
Pj4gK8KgwqDCoCBpZiAoIHAybV9pc19yYW0ocDJtdCkgKQ0KPiA+PiArwqDCoMKgwqDCoMKgwqAg
dCA9IChwMm10ID09IHAybV9yYW1fcncpID8gcDJtX21hcF9mb3JlaWduX3J3IDoNCj4gPj4gcDJt
X21hcF9mb3JlaWduX3JvOw0KPiA+PiArwqDCoMKgIGVsc2UNCj4gPj4gK8KgwqDCoCB7DQo+ID4+
ICvCoMKgwqDCoMKgwqDCoCByZXQgPSAtRUlOVkFMOw0KPiA+PiArwqDCoMKgwqDCoMKgwqAgZ290
byBmYWlsX3BhZ2VzOw0KPiA+DQo+ID4gV2hlcmUgd291bGQgd2UgcmVsZWFzZSB0aGUgcmVmZXJl
bmNlcz8NCj4gPg0KPiA+PiArwqDCoMKgIH0NCj4gPj4gKw0KPiA+PiArwqDCoMKgIC8qIFNldCB1
cCBndWVzdCBmb3JlaWduIG1hcC4gKi8NCj4gPj4gK8KgwqDCoCByZXQgPSBndWVzdF9waHlzbWFw
X2FkZF9wYWdlcyhiZCwgX2dmbihiX2dmbiksDQo+ID4+IHBhZ2VfdG9fbWZuKHBhZ2VzWzBdKSwN
Cj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBucl9nZm5zLCB0KTsNCj4gPg0KPiA+IEEgZmV3IHRoaW5nczoNCj4g
PiAgwqAgLSBUaGUgYmVnaW5uaW5nIG9mIHRoZSBjb2RlIGFzc3VtZXMgdGhhdCB0aGUgTUZOIG1h
eSBiZQ0KPiA+IGRpc2NvbnRpZ3VvdXMgaW4gdGhlIHBoeXNpY2FsIG1lbW9yeS4gQnV0IGhlcmUs
IHlvdSBhcmUgYXNzdW1pbmcgdGhleSBhcmUNCj4gY29udGlndW91cy4NCj4gPiBJZiB5b3Ugd2Fu
dCB0aGUgbGF0dGVyLCB0aGVuIHlvdSBzaG91bGQgY2hlY2sgdGhlIE1GTnMgYXJlIGNvbnRpZ3Vv
dXMuDQo+ID4gVGhhdCBzYWlkLCBJIGFtIG5vdCBzdXJlIGlmIHRoaXMgcmVzdHJpY3Rpb24gaXMg
cmVhbGx5IG5lY2Vzc2FyeS4NCj4gPg0KPiA+ICDCoCAtIElJUkMsIGd1ZXN0X3BoeXNtYXBfYWRk
X3BhZ2VzKCkgZG9lc24ndCByZXZlcnQgdGhlIG1hcHBpbmdzLiBTbw0KPiA+IHlvdSBuZWVkIHRv
IHJldmVydCBpdCBpbiBjYXNlIG9mIGZhaWx1cmUuDQo+IA0KPiANCj4gVGhlcmUgaXMgYW5vdGhl
ciBpc3N1ZSBoZXJlLiBndWVzdF9waHlzbWFwX2FkZF9wYWdlcygpIG1heSB1c2Ugc3VwZXJwYWdl
DQo+IG1hcHBpbmcuIFRoZSBQMk0gY29kZSBpcyBjdXJyZW50bHkgYXNzdW1pbmcgdGhlIGZvcmVp
bmcgbWFwcGluZyB3aWxsIGJlDQo+IHVzaW5nIEwzIG1hcHBpbmcgKDRLQikuDQo+IA0KPiBEbyB5
b3UgbmVlZCB0byB1c2Ugc3VwZXJwYWdlIG1hcHBpbmcgaGVyZT8NCj4gDQoNClJpZ2h0IG5vdywg
dGhlcmUgaXMgbm8gdXNlciBjYXNlIG9uIG15IHNpZGUgbmVlZGluZyBzdXBlcnBhZ2UgbWFwcGlu
Zy4NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

