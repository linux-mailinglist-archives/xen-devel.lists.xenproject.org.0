Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76CE41699C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 03:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194737.346987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTaMY-0006d3-Gp; Fri, 24 Sep 2021 01:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194737.346987; Fri, 24 Sep 2021 01:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTaMY-0006bD-Dd; Fri, 24 Sep 2021 01:50:54 +0000
Received: by outflank-mailman (input) for mailman id 194737;
 Fri, 24 Sep 2021 01:50:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTaMW-0006b6-VL
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 01:50:53 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.82]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8c91eb0-1cd9-11ec-ba97-12813bfff9fa;
 Fri, 24 Sep 2021 01:50:51 +0000 (UTC)
Received: from AM6PR0202CA0070.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::47) by AM6PR08MB4519.eurprd08.prod.outlook.com
 (2603:10a6:20b:74::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 24 Sep
 2021 01:50:42 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::11) by AM6PR0202CA0070.outlook.office365.com
 (2603:10a6:20b:3a::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Fri, 24 Sep 2021 01:50:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 01:50:41 +0000
Received: ("Tessian outbound c21c48fbc857:v103");
 Fri, 24 Sep 2021 01:50:41 +0000
Received: from 78c69ab509bc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6E32DF7-C28D-4F9B-A04A-FD16B412C41B.1; 
 Fri, 24 Sep 2021 01:50:30 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 78c69ab509bc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 01:50:30 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6091.eurprd08.prod.outlook.com (2603:10a6:10:1f4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 01:50:27 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.013; Fri, 24 Sep 2021
 01:50:27 +0000
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
X-Inumbo-ID: d8c91eb0-1cd9-11ec-ba97-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAJTHXmx2Vg3cZkJVMmD+DJrwl2pCfGVpxRJ5AcTaaA=;
 b=0i/iF7FkpTAwBH269U7vR/uDf7g+eEdICjMcet33ErhorIDjY2khYLPKmCeYfqWqJmRiuSx59CRwjtppBzBaSdpJcPgcyL/DvFw7XsapTLVtYOuxX55PwS0ri+z8q/FL4C9DuCpDEoikHQL4RJaDQ2cWMXEcfCVpuIskogXC83w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvpGZhy9AQRA8f4HO1smWWmnKkmGanVHH2IqfK+GeRERDwBQWqv2J7LBiFFcJMwxpaAUOd8FenMN84UxJouWpQmhnuI+vZUoVoFWSHA2xcCJbjTKFQ6WIA3VxpgJWaw37SG7WHPpUzl7NGUoYNGLUclbaw1m6UVx+mOdp3kDIuBF8DC0pAU/kEkVJSs38wgw3vQ2MR9QLi2NinIIFmOib3TGFr5gXWwJEutUzNY6Lyv9+w7MR3uqWp7/xILd/LS57w7RcrVBKHBao3FHd9lcyEx9dPrGWIMDzNDiW9lLt97sMWL0qkJIr5xYOOudpQYl4Nqwv2facs2S5PnXvv2i6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LAJTHXmx2Vg3cZkJVMmD+DJrwl2pCfGVpxRJ5AcTaaA=;
 b=VqZqOoTU3F5magoW4NBiMGLeqTEgNDet6i5fKKROQblQ4HVbq7DRAI1muF+kYnBEd5xU6SlqHO/Eld3ya1D4OGKHwkg/s+Wr09avq99Kxrf+m0+lqWWtXgTdsU6vYHysPIhOY2BbezxY3QNsDUQRuB23Lm2pmpYwwf/ZDBkjkQb1/RxjuLQu/1WkuZA9L5HdN9c7lYDMKUBpNgofGtXlu2jQCJbsmv9xzyybawLck0PuH7fA3TJBpemz01zh74/KpYdqsCnaZkhbzLb8nvc2BoqjgUFOU8t/arjHdDWLwUs/DR5JQTGXf35vH4irFlVj7tnmpJbvmzOIgtBR+htNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAJTHXmx2Vg3cZkJVMmD+DJrwl2pCfGVpxRJ5AcTaaA=;
 b=0i/iF7FkpTAwBH269U7vR/uDf7g+eEdICjMcet33ErhorIDjY2khYLPKmCeYfqWqJmRiuSx59CRwjtppBzBaSdpJcPgcyL/DvFw7XsapTLVtYOuxX55PwS0ri+z8q/FL4C9DuCpDEoikHQL4RJaDQ2cWMXEcfCVpuIskogXC83w=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
Thread-Topic: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
Thread-Index: AQHXsHMGx8xGhif/FUCDSa9NS/fSLquyTCAAgAAfquA=
Date: Fri, 24 Sep 2021 01:50:26 +0000
Message-ID:
 <DB9PR08MB6857017D740D8408A2C30CB39EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-5-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231652340.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231652340.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 79EB525EA391BE4182C09CC50462CB94.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ff0d81f0-f066-40a4-dbb2-08d97efdb74f
x-ms-traffictypediagnostic: DBBPR08MB6091:|AM6PR08MB4519:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4519349540103D92CEB2B0CA9EA49@AM6PR08MB4519.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Yl/yCqNk6YPoIZ4ARbmcLUmmDleGtEtP3D2atw1JMy5BRRPHBFwXugXzsCQLTXmogOhVBGwi79W+yOCxro7G9hy3x/dagulBgv4p3rmS0TBkw7PX+kM7XsRhMn+0sBpokEtDzaiY51RVi7YwW2pdwSYJZjByk8mp1QuuRTO0P01VDr6o5ZDKp7+iuB+Z2OVKbCFiz4/aoOjYntI1ZMxG5RNLL1gs1afLj78whkJIRtXEnz+nO8BWo7Cfpbk6hLqVvFA6OENC7koqcJVYVxLb0jCP6y2k8ZT+zryfJ6NMOZyL1RKvNLiyamyeKaRWyjUuImo0WriGzV/qAogc812zXtVR9wlODzEWjnYKu9jn3HzRAjfupz6N3ZTS5U18SdtoGC9jSEarhihXaod5sqS92GyuxsxnxEY3zU45J1oPWKgHWFa4ZNQMn68ZE6JpjcbFXOj7No0cHI5IVTOT1g/Jg8wVru25cZ9Ru7MJfZawELf6Jt/E8wtYe/2fbXHTFujXVJj/FsCAsl+cQCVZdNUuaVS37mojVrZ8hvtq7LejCcHkGOCd1CC2mVyea2U8Co40cU0rvbdxvzXs+hMVoTovZ2PInnmvKhQHKDsxI0j235wWs2VfaViDksVhSVKb8Sm7fwK3pdYwAY/58p4fLz2IeaUXK2/emf+0k+6mfH4gPaO9yTm+JApMHGix1HoqgVIBW9ik8ngX8irv4r+hf4/8ww==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(6506007)(53546011)(54906003)(66556008)(83380400001)(8676002)(9686003)(66446008)(7696005)(4326008)(86362001)(2906002)(38070700005)(64756008)(316002)(8936002)(186003)(66946007)(66476007)(71200400001)(55016002)(52536014)(33656002)(76116006)(122000001)(26005)(508600001)(38100700002)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6091
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d02deeda-2261-4467-cb21-08d97efdae98
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OmW231Hsuo0YBrCAI3WB7WrpReSr9OuEy/EgHe3M5qHrgd4la4sgO7y0HRbbeRuGI8y2Hu6ouK8irXdBdWAfJDHI815Q97GNpVMnj8h1Cz73XIuql7EJCKZkT7zQvuHK5OrwWOY2Phlhl9JCuMEtbVTYfpNn0XXisfiwxLOmtNRZu7xsO3F/6qCwtiMpfOwcowrvySJszIPD/2Afs+fX9ncYM2nlyoBMV4NfLyhBgv+ONLzSyRLsJKgzAOu2hC6STsBgjZ15YtRttaE7qmBtYegOQfq73IyODyjp6fhX6gV08QJgIDVrwQim5uLmlU/WW5nRw+2YZJvcn3M7IJyNSGjatr800Nv0Eh3b7VJG2RpZGe+rIcx3e53zgYmlw9QhfagB/wzRlqBbuP5qkTJfhXJlO8ozFrvGLu6zH8BWNVAFu4VC8EjoZTBrO/oS2xY8DVit2GBV7j+iIOnmRKt+5Jue6ozA8LMJfAFXVk6swp59TC4miqX+xe1ZEaikhKn+LTx9+HLbXPYGYZU3mrEFlAm3La8MEk0OamViWauGnOXt7RJF12RfI0f0fG7RFNAkWCPU2zXp+nlBvIbDA9YrmE3WdZsDjbtN8zbwsA4wTYbuvtH4Y7UujREjaVa4wbuEGMP4gXG6xkccX0kxDM6+QEMw9zDvGvr881dc+UmmvBfqqnAha2e9SRd8iWhwbuYvOccUV1doJ9K/h7829eMW7w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2906002)(52536014)(86362001)(5660300002)(316002)(54906003)(508600001)(4326008)(6862004)(33656002)(47076005)(36860700001)(82310400003)(55016002)(83380400001)(9686003)(81166007)(356005)(26005)(8676002)(8936002)(53546011)(6506007)(70206006)(70586007)(186003)(336012)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 01:50:41.5476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0d81f0-f066-40a4-dbb2-08d97efdb74f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4519

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jnU
wjI0yNUgNzo1Ng0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDQvMzddIHhlbjogaW50cm9kdWNlIGFuIGFyY2ggaGVs
cGVyIGZvciBkZWZhdWx0IGRtYQ0KPiB6b25lIHN0YXR1cw0KPiANCj4gT24gVGh1LCAyMyBTZXAg
MjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4gSW4gY3VycmVudCBjb2RlLCB3aGVuIFhlbiBpcyBy
dW5uaW5nIGluIGEgbXVsdGlwbGUgbm9kZXMgTlVNQQ0KPiA+IHN5c3RlbSwgaXQgd2lsbCBzZXQg
ZG1hX2JpdHNpemUgaW4gZW5kX2Jvb3RfYWxsb2NhdG9yIHRvIHJlc2VydmUNCj4gPiBzb21lIGxv
dyBhZGRyZXNzIG1lbW9yeSBmb3IgRE1BLg0KPiA+DQo+ID4gVGhlcmUgYXJlIHNvbWUgeDg2IGlt
cGxpY2F0aW9ucyBpbiBjdXJyZW50IGltcGxlbWVudGF0aW9uLiBCZWN1YXNlDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gdGhlICAgICAgICAgICAgICAgICAgICBeQmVj
YXVzZQ0KPiANCj4gPiBvbiB4ODYsIG1lbW9yeSBzdGFydHMgZnJvbSAwLiBPbiBhIG11bHRpcGxl
IG5vZGVzIE5VTUEgc3lzdGVtLCBpZg0KPiA+IGEgc2luZ2xlIG5vZGUgY29udGFpbnMgdGhlIG1h
am9yaXR5IG9yIGFsbCBvZiB0aGUgRE1BIG1lbW9yeS4geDg2DQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiwNCj4gDQo+ID4g
cHJlZmVyIHRvIGdpdmUgb3V0IG1lbW9yeSBmcm9tIG5vbi1sb2NhbCBhbGxvY2F0aW9ucyByYXRo
ZXIgdGhhbg0KPiA+IGV4aGF1c3RpbmcgdGhlIERNQSBtZW1vcnkgcmFuZ2VzLiBIZW5jZSB4ODYg
dXNlIGRtYV9iaXRzaXplIHRvIHNldA0KPiA+IGFzaWRlIHNvbWUgbGFyZ2VseSBhcmJpdHJhcnkg
YW1vdW50IG1lbW9yeSBmb3IgRE1BIG1lbW9yeSByYW5nZXMuDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeIG9mIG1lbW9yeQ0KPiANCj4gPiBUaGUgYWxsb2NhdGlvbnMg
ZnJvbSB0aGVzZSBtZW1vcnkgcmFuZ2VzIHdvdWxkIGhhcHBlbiBvbmx5IGFmdGVyDQo+ID4gZXho
YXVzdGluZyBhbGwgb3RoZXIgbm9kZXMnIG1lbW9yeS4NCj4gPg0KPiA+IEJ1dCB0aGUgaW1wbGlj
YXRpb25zIGFyZSBub3Qgc2hhcmVkIGFjcm9zcyBhbGwgYXJjaGl0ZWN0dXJlcy4gRm9yDQo+ID4g
ZXhhbXBsZSwgQXJtIGRvZXNuJ3QgaGF2ZSB0aGVzZSBpbXBsaWNhdGlvbnMuIFNvIGluIHRoaXMg
cGF0Y2gsIHdlDQo+ID4gaW50cm9kdWNlIGFuIGFyY2hfaGF2ZV9kZWZhdWx0X2RtYXpvbmUgaGVs
cGVyIGZvciBhcmNoIHRvIGRldGVybWluZQ0KPiA+IHRoYXQgaXQgbmVlZCB0byBzZXQgZG1hX2Jp
dHNpemUgZm9yIHJlc2VydmUgRE1BIGFsbG9jYXRpb25zIG9yIG5vdC4NCj4gICAgICAgICAgIF4g
bmVlZHMNCj4gDQoNCkkgd2lsbCBmaXggYWJvdmUgdHlwb3MgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAt
LS0NCj4gPiAgeGVuL2FyY2gveDg2L251bWEuYyAgICAgICAgfCA1ICsrKysrDQo+ID4gIHhlbi9j
b21tb24vcGFnZV9hbGxvYy5jICAgIHwgMiArLQ0KPiA+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL251
bWEuaCB8IDUgKysrKysNCj4gPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9udW1hLmggfCAxICsNCj4g
PiAgNCBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L251bWEuYyBiL3hlbi9hcmNoL3g4Ni9udW1h
LmMNCj4gPiBpbmRleCBjZTc5ZWU0NGNlLi4xZmFiYmU4MjgxIDEwMDY0NA0KPiA+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9udW1hLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvbnVtYS5jDQo+ID4gQEAg
LTM3MSw2ICszNzEsMTEgQEAgdW5zaWduZWQgaW50IF9faW5pdCBhcmNoX2dldF9kbWFfYml0c2l6
ZSh2b2lkKQ0KPiA+ICAgICAgICAgICAgICAgICAgICsgUEFHRV9TSElGVCwgMzIpOw0KPiA+ICB9
DQo+ID4NCj4gPiArdW5zaWduZWQgaW50IGFyY2hfaGF2ZV9kZWZhdWx0X2RtYXpvbmUodm9pZCkN
Cj4gDQo+IENhbiB0aGlzIGZ1bmN0aW9uIHJldHVybiBib29sPw0KPiBBbHNvLCBjYW4gaXQgYmUg
YSBzdGF0aWMgaW5saW5lPw0KPiANCg0KWWVzLCBib29sIHdvdWxkIGJlIGJldHRlci4gSSB3aWxs
IHBsYWNlIGEgc3RhdGljIGlubGluZSBpbiBhc20vbnVtYS5oLg0KQmVjYXVzZSBhcm0gd2lsbCBo
YXZlIGFub3RoZXIgc3RhdGljIGlubGluZSBpbXBsZW1lbnRhdGlvbi4NCg0KPiANCj4gPiArew0K
PiA+ICsgICAgcmV0dXJuICggbnVtX29ubGluZV9ub2RlcygpID4gMSApID8gMSA6IDA7DQo+ID4g
K30NCj4gPiArDQo+ID4gIHN0YXRpYyB2b2lkIGR1bXBfbnVtYSh1bnNpZ25lZCBjaGFyIGtleSkN
Cj4gPiAgew0KPiA+ICAgICAgc190aW1lX3Qgbm93ID0gTk9XKCk7DQo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPiBp
bmRleCA1ODAxMzU4YjRiLi44MDkxNjIwNWU1IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9jb21tb24v
cGFnZV9hbGxvYy5jDQo+ID4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPiBAQCAt
MTg4OSw3ICsxODg5LDcgQEAgdm9pZCBfX2luaXQgZW5kX2Jvb3RfYWxsb2NhdG9yKHZvaWQpDQo+
ID4gICAgICB9DQo+ID4gICAgICBucl9ib290bWVtX3JlZ2lvbnMgPSAwOw0KPiA+DQo+ID4gLSAg
ICBpZiAoICFkbWFfYml0c2l6ZSAmJiAobnVtX29ubGluZV9ub2RlcygpID4gMSkgKQ0KPiA+ICsg
ICAgaWYgKCAhZG1hX2JpdHNpemUgJiYgYXJjaF9oYXZlX2RlZmF1bHRfZG1hem9uZSgpICkNCj4g
PiAgICAgICAgICBkbWFfYml0c2l6ZSA9IGFyY2hfZ2V0X2RtYV9iaXRzaXplKCk7DQo+ID4NCj4g
PiAgICAgIHByaW50aygiRG9tYWluIGhlYXAgaW5pdGlhbGlzZWQiKTsNCj4gPiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEu
aA0KPiA+IGluZGV4IDMxYTZkZTRlMjMuLjlkNTczOTU0MmQgMTAwNjQ0DQo+ID4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLWFybS9udW1hLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL251
bWEuaA0KPiA+IEBAIC0yNSw2ICsyNSwxMSBAQCBleHRlcm4gbWZuX3QgZmlyc3RfdmFsaWRfbWZu
Ow0KPiA+ICAjZGVmaW5lIG5vZGVfc3RhcnRfcGZuKG5pZCkgKG1mbl94KGZpcnN0X3ZhbGlkX21m
bikpDQo+ID4gICNkZWZpbmUgX19ub2RlX2Rpc3RhbmNlKGEsIGIpICgyMCkNCj4gPg0KPiA+ICtz
dGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBhcmNoX2hhdmVfZGVmYXVsdF9kbWF6b25lKHZvaWQp
DQo+ID4gK3sNCj4gPiArICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAjZW5kaWYg
LyogX19BUkNIX0FSTV9OVU1BX0ggKi8NCj4gPiAgLyoNCj4gPiAgICogTG9jYWwgdmFyaWFibGVz
Og0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L251bWEuaCBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvbnVtYS5oDQo+ID4gaW5kZXggM2NmMjZjMmRlZi4uODA2MGNiZjNmNCAxMDA2
NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L251bWEuaA0KPiA+ICsrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvbnVtYS5oDQo+ID4gQEAgLTc4LDUgKzc4LDYgQEAgZXh0ZXJuIGludCB2
YWxpZF9udW1hX3JhbmdlKHU2NCBzdGFydCwgdTY0IGVuZCwNCj4gbm9kZWlkX3Qgbm9kZSk7DQo+
ID4gIHZvaWQgc3JhdF9wYXJzZV9yZWdpb25zKHU2NCBhZGRyKTsNCj4gPiAgZXh0ZXJuIHU4IF9f
bm9kZV9kaXN0YW5jZShub2RlaWRfdCBhLCBub2RlaWRfdCBiKTsNCj4gPiAgdW5zaWduZWQgaW50
IGFyY2hfZ2V0X2RtYV9iaXRzaXplKHZvaWQpOw0KPiA+ICt1bnNpZ25lZCBpbnQgYXJjaF9oYXZl
X2RlZmF1bHRfZG1hem9uZSh2b2lkKTsNCj4gPg0KPiA+ICAjZW5kaWYNCj4gPiAtLQ0KPiA+IDIu
MjUuMQ0KPiA+DQo=

