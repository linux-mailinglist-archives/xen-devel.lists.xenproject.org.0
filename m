Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3B17CF06D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 08:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618904.963193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMrl-0008Kl-7x; Thu, 19 Oct 2023 06:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618904.963193; Thu, 19 Oct 2023 06:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMrl-0008HO-4j; Thu, 19 Oct 2023 06:50:45 +0000
Received: by outflank-mailman (input) for mailman id 618904;
 Thu, 19 Oct 2023 06:50:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWKy=GB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qtMrj-0008HG-4r
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 06:50:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1a5def1-6e4b-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 08:50:41 +0200 (CEST)
Received: from DUZPR01CA0198.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::29) by AS8PR08MB9669.eurprd08.prod.outlook.com
 (2603:10a6:20b:617::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 06:50:37 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::38) by DUZPR01CA0198.outlook.office365.com
 (2603:10a6:10:4b6::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24 via Frontend
 Transport; Thu, 19 Oct 2023 06:50:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24 via Frontend Transport; Thu, 19 Oct 2023 06:50:37 +0000
Received: ("Tessian outbound 80b6fe5915e6:v215");
 Thu, 19 Oct 2023 06:50:37 +0000
Received: from afb6420e87eb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8044B631-0417-4B15-A58E-D057E0CD070E.1; 
 Thu, 19 Oct 2023 06:50:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id afb6420e87eb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Oct 2023 06:50:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB7622.eurprd08.prod.outlook.com (2603:10a6:102:240::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 06:50:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 06:50:27 +0000
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
X-Inumbo-ID: d1a5def1-6e4b-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cw6xe0r1s92aBf//64/3zcwoPi4+vK+WGG0omTcQyDU=;
 b=hG5ya5jJZPFO/ROVsl7qW8tvcRmNgPRyVXiF8UDCKGDoDaeHmiKc19rHBnAMcaS1EF4M5VAkp0QNVvqLNZ8qVqOhqNDMyzO9uZyFtq4Jaf30Ma9nKFffXyMY0BPVul/XqH5LQh0a631eEbUhYFIcpxqI4xeSHN/tlfuvVYYJ4q4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: efd11cd465f2e542
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K433CnoVVSnZHD00PLgFwj4SYPQhRZKhNN/C/RPKjGRd/BjOIvOzBhMW9QOW8Nb4ryAI/BIyC6vO1kFRyU4SPU+fweJO7aN3Gkn75mkhZibD96t/2Yz67+HRHDOj52B+yyGF4FI9tMb5a48AlHCo8+NVsgOysGVA+ODszv8huuT5wy+C0+UOgOcGiUfYxA+2L+3N7VJE/BgkQ1Dj988yncQ0FSpK1Rlpn3C3s7OhTMvs0qEGJk5kuDdT7SJaPSvimy5Bvp+7DGqlBEPm3EfbnMt/puNPX5qLiRF/wkbFbgKPZ0mTSUCtSLA3ZTa/lbs54XZ2lrUulfEcqirKtQFwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cw6xe0r1s92aBf//64/3zcwoPi4+vK+WGG0omTcQyDU=;
 b=eTKMU6cQqiFjl4vXpzXhuf5pwCVMMcPaOSOazpgHc11SVIz34ZHpEOdVL0Ovm1TTwtwV2g3onzxvJrSHAZBauZPayhDqd8iYwdzwzvZ0DFy7TUAI6/mVTAtiACccbUoK0PZycP0m5AlnFXYe3ZQ5u5fJ7MF3uhHYcyzxTv2862vbvoluSYqpxmVyyw9TvlOOf+RLKgRSSBeoUwSRiogqICr4LsQUUu4VaFqfa4wKjeGvJ38BQYSQmXMTuOTUHJwyWySEASaA/Ct3LDmPe3egVVAhrTMbSF1/ruAJy1oLdvVdKiFeleKg8x3rcP5cuEC1Vjc1FR3eT+YRqK0NOaO+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cw6xe0r1s92aBf//64/3zcwoPi4+vK+WGG0omTcQyDU=;
 b=hG5ya5jJZPFO/ROVsl7qW8tvcRmNgPRyVXiF8UDCKGDoDaeHmiKc19rHBnAMcaS1EF4M5VAkp0QNVvqLNZ8qVqOhqNDMyzO9uZyFtq4Jaf30Ma9nKFffXyMY0BPVul/XqH5LQh0a631eEbUhYFIcpxqI4xeSHN/tlfuvVYYJ4q4=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: [PATCH] console: make input work again for pv-shim
Thread-Topic: [PATCH] console: make input work again for pv-shim
Thread-Index: AQHaAdOTgwKy6u3JYkmo1XFC1IQNE7BP1l0AgADS4QCAAAQigA==
Date: Thu, 19 Oct 2023 06:50:27 +0000
Message-ID: <4187FE85-AF9C-4A52-ADF4-495B12C18B84@arm.com>
References: <ed275abf-351f-5237-7e19-a3856f6d4272@suse.com>
 <f2b51b47-fdeb-45a6-92c7-5b21da1855fe@xen.org>
 <0f6a604e-7201-ea2d-cea3-89a3b9b08919@suse.com>
In-Reply-To: <0f6a604e-7201-ea2d-cea3-89a3b9b08919@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB7622:EE_|DBAEUR03FT035:EE_|AS8PR08MB9669:EE_
X-MS-Office365-Filtering-Correlation-Id: 60cbda1d-fad8-4ce7-0e01-08dbd06fb365
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YVhrP5g8BjzagPLHV7XIjnXmeuouZs94OgbXYjpqUh9NEJkhrp7I39FGTB7FGP5/PCO15pw1YwOaGNfKwt+M1wi9jIsA4rSsyRas0/+oR2A0EGs0OOcokOiAky8LzLiZF69sL1ikPXZI7K75R/BgQkZ+RDyNqKT8Sus9VnK0hJDuWakctVTP079iijAOA8mR1clhGkAZZBIKKpD4egCORUrb6g2nEalQZpNMrjxwLlMRaeT71h5SNQoAXOvze8hIIW005mlhz/u/VBOEYCcInyAUdcP+fYXW3Q4CLpKoJmx9YRFiKxmMh9A42eYsDmE5RN8kOTZqxUsXcToYcDPoRgX/76I5+5+ZzafTrgzLpawtUdt2kDLHQ21WNZBTthlNNiJ2NOVFnrizSFfgQtDT1i2lxLqOeSBB3XgZu8xNwN9c6raeJYaotvmHXV82THREeXkJ3XpIRiQjTWllCaaAVUY5XKXGVQ+3kOHOGpNHOJvKeFt2ZwIHqBaVpoN5hxW0xlli9bBpoTHodWf6yLLV8oCWbK1U4s5wCKFnxdNX+St0caimw1Y0mp8j3pgRgp61hTAOdtY2h7Beym4MKjISUGSfb4NlmkVdb9JfMlKvDGtkdxFMp0vZzs7aFRblsxB8BhEcMaBUehbB3SARV4PFzQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(83380400001)(38100700002)(4744005)(91956017)(2616005)(122000001)(36756003)(38070700005)(6512007)(316002)(66476007)(66556008)(41300700001)(6916009)(66946007)(86362001)(54906003)(76116006)(64756008)(5660300002)(8936002)(6506007)(4326008)(8676002)(2906002)(478600001)(53546011)(71200400001)(33656002)(6486002)(66446008)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1733BEA36E131846B88D399A061AAD03@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7622
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8348240d-9f28-43c4-c30e-08dbd06fadc7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ccfOYJSY7qeuVCJX6qVgmuMXyiGo5KlDn3N81c+s5OzRDmxJ4WmBjz6JyS/cLuEMfx8uHXv3MtzolUJ34KIrnufq6ZlF5seNKvUmur8aX9NADnyk3kWMrmhgCumlGFtuOASOml90EA6uh7mszSNvuXQMH3lKk1dARIwAr13Go9Zec53FUjgf24eymQbK3yQEkY+6QS/Vy02KNzSzKvCWG36Rh/UV9SdrkrJSHYVvR0eDlP/iSGswDZokkNYDkjsZa9zwUiCC6GvVAHOeas3nD2e5VSf9kXMaviL8KInPQpOU0qAgY1+IGZkdo0npv4yXX+4wMN4Rsw0PWgZK01TVagM/zz1EX8sPBgjcH+0yX8QdAK9OAefI03lQp9l8tFStM1Si+j92lbzKoy7DgbNaRNhAqAqyfdNR4y+KGwl2/Zis/aBO9lH1RBXeWBu0VZpGQ3iiMaPhzF5cjwkL97Q26Ke/ICI452xtOTplMn/sW+dQl/nxM3uCWZvgfDX65ehrM16+F2DMUtGl8syIeyMRDhknnmL4RD4DN5eDyTJWxECW91k+j1LNxuWoYbKNB8sBXFsGxgQC4BbUy5XHzO5l5pXJ/ge4TOieQDklmoz1oQizf2sOgYsKP91orgmgDBNQADuDujwDy85q9uDJAtGBm3bs0i6O4TM0NT9k5Z+6EDp0RVntSHOeJtDp0tsFMTFz3AyJEgPo/B+Uihkv6vb7tCw3Fg/tYq8YTMBQNz+vWkLxUhH86OFMHa0y1Z/qOjIk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(186009)(1800799009)(82310400011)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(6862004)(40460700003)(6506007)(316002)(8936002)(26005)(2616005)(36860700001)(6512007)(4744005)(4326008)(8676002)(70586007)(54906003)(83380400001)(70206006)(47076005)(53546011)(2906002)(82740400003)(478600001)(6486002)(41300700001)(81166007)(356005)(5660300002)(40480700001)(33656002)(36756003)(86362001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 06:50:37.2592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cbda1d-fad8-4ce7-0e01-08dbd06fb365
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9669

SGkgSmFuLA0KDQo+IE9uIE9jdCAxOSwgMjAyMywgYXQgMTQ6MzUsIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPj4gQWxzbywgc2hvdWxkIHdlIGNvbnNpZGVyIGl0
IGZvciB4ZW4gNC4xOD8gKEkgbm90aWNlIHRoZXJlIGlzIG5vIGZvci00LjE4IA0KPj4gdGFnKS4N
Cj4gDQo+IE9mIGNvdXJzZSB3ZSBzaG91bGQsIGFzIGl0J3MgYSByZWdyZXNzaW9uLiBJIHByb2Jh
Ymx5IHNob3VsZCBoYXZlIGFkZGVkDQo+IHRoZSB0YWcsIGRlc3BpdGUgbXkgZGlzbGlrZSBmb3Ig
c3VjaC4gSW50ZW50aW9uIHdhcyBpbW8gbmV2ZXJ0aGVsZXNzDQo+IGNsZWFyLCBieSBtZSBoYXZp
bmcgQ2MtZWQgSGVucnkuDQoNCkkgdGhpbmsgSeKAmXZlIHByb3ZpZGVkIHRoZSByZWxlYXNlLWFj
ayBmb3IgdGhpcyBwYXRjaCBzbyBwbGVhc2Uga2luZGx5IGNvbW1pdA0KdGhpcyB0byBmaXggdGhl
IHN0YWdpbmcgOikgVGhhbmsgeW91IHZlcnkgbXVjaCENCg0KS2luZCByZWdhcmRzLA0KSGVucnkN
Cg0KPiANCj4gSmFuDQoNCg==

