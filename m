Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A093976D0FB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 17:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575059.900797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRDPp-0002Ll-Kw; Wed, 02 Aug 2023 15:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575059.900797; Wed, 02 Aug 2023 15:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRDPp-0002K6-H2; Wed, 02 Aug 2023 15:05:33 +0000
Received: by outflank-mailman (input) for mailman id 575059;
 Wed, 02 Aug 2023 15:05:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWG=DT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qRDPn-0002K0-O6
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 15:05:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0464b31d-3146-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 17:05:28 +0200 (CEST)
Received: from AM6PR01CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::40) by AS8PR08MB6005.eurprd08.prod.outlook.com
 (2603:10a6:20b:298::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 15:05:22 +0000
Received: from AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::5b) by AM6PR01CA0063.outlook.office365.com
 (2603:10a6:20b:e0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44 via Frontend
 Transport; Wed, 2 Aug 2023 15:05:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT033.mail.protection.outlook.com (100.127.140.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.44 via Frontend Transport; Wed, 2 Aug 2023 15:05:21 +0000
Received: ("Tessian outbound 95df046a2e2c:v145");
 Wed, 02 Aug 2023 15:05:21 +0000
Received: from 6bcb336d501e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B5C8649B-675E-42B4-85E4-7C0C06DEF681.1; 
 Wed, 02 Aug 2023 15:05:10 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6bcb336d501e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Aug 2023 15:05:10 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB8646.eurprd08.prod.outlook.com (2603:10a6:20b:55d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 15:05:07 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 15:05:07 +0000
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
X-Inumbo-ID: 0464b31d-3146-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghsrb5yPr7B3yO8mr2dFhlWwYP0lbcf1aRChOIn058w=;
 b=JBZ+HxjJ5FZ+WmQwowRb4Rh4FMPcoEi7WF5wBqX/UjDmGS8c47I5gwpHsDimf+Jl0bhinLLpgofasE4uCY9dryEtGrr/8Hvh0jmbE3IxbLYZU7mfO0+oaOq9x08eWOSOPHCwqiBmjTfvIkYq6Ixn+7zGnRfj6jl1dH97R6K0Mmo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 836e7222c394a90c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQCvr41PHvNW7SfBb943XQfNFBm68ApKaaR+AAkD9D6vd/uG43D3y+OJoDMToaTjqCckrgONXlsULwufQL95Jt6DV6M+xumDAZz18w/CJvmxEpu025bshRxpqu6/h1g0NAt4EMLGiSJpXudtR0kUCyVcvHV2wBm7i3mrxWoXAiO4FArggWwEe2cJrPfaOlE4x8p0uKG3hvvAs7DKUanXspZooFVYWSyxYRw1MyGfQ5+MQPOdG+JVDGZBqzrARenQTltI21ozL3axkJ7NamdI9bC2mQfjxBmeRoxUSNpd4npV0nd5e13S2Mvz66SfCLdK7piLNSOrYiZoMqJOrqoSFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghsrb5yPr7B3yO8mr2dFhlWwYP0lbcf1aRChOIn058w=;
 b=cOPcQCrjmKc/N6m/gkNlTjrIuCRHt4CbZxazFEKAnJgISWmrOPCRprsTSI/dbfuC16lpf9wsPpPI7RH+SIj1/VJDGcgPQiVfBRgoyhuVLRqzbYXOlp1+HBeme/JcEcW4AGU38913rQy+zkcCx4JpOIX4synKdfO3jb1XvnErOKiXjlrhcbmBQRhrmDy9f4uzE1CQ5AKJ4ws/btIpHt/KjaWpJbKrlkcYnRgAnOoBS4S7xUxn7PHzfCGTUs0KEfPVH7PySerFvuq+uwxzZnwoM8T5D42w9BJex9VueD1KVNhvkfu9tuasTSe/skLpFh9YbBiNDgRoAGHR/fZaICwOAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghsrb5yPr7B3yO8mr2dFhlWwYP0lbcf1aRChOIn058w=;
 b=JBZ+HxjJ5FZ+WmQwowRb4Rh4FMPcoEi7WF5wBqX/UjDmGS8c47I5gwpHsDimf+Jl0bhinLLpgofasE4uCY9dryEtGrr/8Hvh0jmbE3IxbLYZU7mfO0+oaOq9x08eWOSOPHCwqiBmjTfvIkYq6Ixn+7zGnRfj6jl1dH97R6K0Mmo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Topic: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Index: AQHZxUjDKmzjB69oo0mbnCqJ2MJvKa/XEDgAgAAEZQCAAAGbgIAABJqA
Date: Wed, 2 Aug 2023 15:05:06 +0000
Message-ID: <92AE30B2-B2CE-465F-A6FC-A86961BED85A@arm.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
 <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
 <8c8f2564-935b-e3c8-ad15-348135140a53@amd.com>
In-Reply-To: <8c8f2564-935b-e3c8-ad15-348135140a53@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB8646:EE_|AM7EUR03FT033:EE_|AS8PR08MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: a86d7b37-bcd1-444a-be7e-08db9369e455
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XZC4xWo2mk6RXvMco4tKlWQqdbl2EKjA4rIyFID+u0uFs8CPfXQcLj5gQ2OHCJHN7X14kd5UkvYYFp2756xLGPllRWAdOieFdfzLUhkt7njI6fqCyxz2ZkEcqG45KoGFiThi6jVi5qilE018GQYutplnAeT0XBJdpwxnZuijYrucMeA1v+vJzt0qG4lSVjTqXmjwdp70D1SczC6Z4KWRKweRijQhH79TezjWH0mZJkVzbV7Bna7KPsmcl/N5DYMzKn1bjpIV1/u4mC9wO9sCyBGUOFuHClBfC3t8b0bBNokJZlfbj2a5JV1qNJSOWaQocH4tk/1VZOSuqzXeNSvUsdxOEqpnXZ8iFbQ0GlYVX1md2lh31/bcFmBXiW/r1S5VZDoQMa7++CeHq3ZzwaJoDQ/DprGQNB+eDSDpLo+h5WLWDD3C0TypxssfS/TOI7GBzG/7XX9LwWfDWxNnbTkmEHSwnLVNCu0lK2Y6yUeiPe079o5sLXa8U+yHg7llZZTYY1idl1XHgFXU3AfMUK+/jGtFgLc/iOxHBjUlnl9l5x8xu5c/bQxPTYiFIsLWWR6EwABzlVaezqLzdL/chwTSzSqm1bwQXCBtnpdwywyqfmC2UUAVu5dSh/SNdtzptsTDoHlGKyfqkR+L0PMHkmvSYg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(8936002)(8676002)(5660300002)(26005)(41300700001)(66899021)(2906002)(83380400001)(38070700005)(36756003)(2616005)(478600001)(54906003)(122000001)(38100700002)(316002)(86362001)(6506007)(53546011)(64756008)(6486002)(76116006)(71200400001)(66946007)(66556008)(66476007)(91956017)(66446008)(33656002)(4326008)(6916009)(186003)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <68FCCAAB4848A4428056140E271D6B2D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8646
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d52c6dfa-ba13-4e46-64f8-08db9369db74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hRrfNR+KvCKf7YYyj/ry6Cj+M+zZtLaORjzPGccd3YmdkNhFaVhmjlt7dt2wHDC2sLKZR+Zh1YDF+v5+uT1qpBdTHos6GxTVLguQHfzEzPl08oLxF3gP2Ngjx8vMieXrCrHufjTwUs7Is/cesTaORRLb97lwkruO1p+HYWC3cBJx95YlXdn6HEBU4YjY9KO6M6Ik2CI9r+pDJC5zEGazv7p5QRK1bDxKBew/3AnWIGmp0nRhPecbH1Sgi99qy/kr9r9kACsgJyz8sMpcAtA1wXeVnzwiu8lwG7hmJ21NtDrBidoTo996W36Hz78wbo/bitPNJhDJasCiY4DDmyGHmzQg4Q/Bt6tGQK4tmZHDL/lwZrRtYtzxbiu0k3r4m3e1HbJ5aNpt7s09SpgKIfVcsXspPfr2na+angI5jSP/G4xIe/+J2u79uFyT4fJoCtAIe8S0JQo3CFhCXU+WnUOcJM+PrWE8F9gyFKpiU3Tub53qOkdcmaANqX4ddg1mlxCLPynmdKvuRENDR+IgpoGlG+vK+RlsyqToNqFYQ8SgFpdvdMgsZ4jxKE+xc4le64Sr7bNY9eabOWVdZDKNt3YlV7HdohMNR9uWafjx159G5/viSVC8FKPNiLXqb/hUfXDSN61pdxaB0UkWnyd9dubkKjMUvCqqHzsJBHygODnZGXtCWZG1HiUgoQiSnliIio2VW5QOM7BvEmM6PBpYIh88y9gFs/ujpxUyFpnCeEB+pHEROCvPYN5gI+K5FZvdSjx0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(8936002)(8676002)(5660300002)(26005)(41300700001)(107886003)(66899021)(36860700001)(2906002)(83380400001)(6862004)(47076005)(36756003)(40460700003)(336012)(2616005)(40480700001)(478600001)(54906003)(81166007)(316002)(86362001)(6506007)(53546011)(82740400003)(6486002)(356005)(70586007)(70206006)(33656002)(4326008)(186003)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 15:05:21.3949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a86d7b37-bcd1-444a-be7e-08db9369e455
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6005

DQoNCj4gT24gMiBBdWcgMjAyMywgYXQgMTU6NDgsIE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVs
QGFtZC5jb20+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiAwMi8wOC8yMDIzIDE2OjQyLCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiAyIEF1ZyAyMDIzLCBhdCAxNToy
NiwgTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4g
SGkgTHVjYSwNCj4+PiANCj4+PiBPbiAwMi8wOC8yMDIzIDE1OjUzLCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4+PiANCj4+Pj4gDQo+Pj4+IEludHJvZHVjZSBLY29uZmlnIEdJQ1YyIHRvIGJlIGFi
bGUgdG8gY29tcGlsZSB0aGUgR0lDdjIgZHJpdmVyIG9ubHkNCj4+Pj4gd2hlbiBuZWVkZWQsIHRo
ZSBvcHRpb24gaXMgYWN0aXZlIGJ5IGRlZmF1bHQuDQo+Pj4+IA0KPj4+PiBJbnRyb2R1Y2UgS2Nv
bmZpZyBWR0lDVjIgdGhhdCBkZXBlbmRzIG9uIEdJQ1YyIG9yIEdJQ1YzIGFuZCBjb21waWxlcw0K
Pj4+PiB0aGUgR0lDdjIgZW11bGF0aW9uIGZvciBndWVzdHMsIGl0IGlzIHJlcXVpcmVkIG9ubHkg
d2hlbiB1c2luZyBHSUNWMg0KPj4+PiBkcml2ZXIsIG90aGVyd2lzZSB1c2luZyBHSUNWMyBpdCBp
cyBvcHRpb25hbCBhbmQgY2FuIGJlIGRlc2VsZWN0ZWQNCj4+Pj4gaWYgdGhlIHVzZXIgZG9lc24n
dCB3YW50IHRvIG9mZmVyIHRoZSB2R0lDdjIgaW50ZXJmYWNlIHRvIGd1ZXN0cyBvcg0KPj4+PiBt
YXliZSBpdHMgR0lDdjMgaGFyZHdhcmUgY2FuJ3Qgb2ZmZXIgdGhlIEdJQ3YyIGNvbXBhdGlibGUg
bW9kZS4NCj4+Pj4gDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFu
Y2VsbHVAYXJtLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IHhlbi9hcmNoL2FybS9LY29uZmlnICAgICAg
ICB8IDEzICsrKysrKysrKysrKysNCj4+Pj4geGVuL2FyY2gvYXJtL01ha2VmaWxlICAgICAgIHwg
IDQgKystLQ0KPj4+PiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAgNCArKysrDQo+Pj4+
IHhlbi9hcmNoL2FybS9naWMtdjMuYyAgICAgICB8ICA0ICsrKysNCj4+Pj4geGVuL2FyY2gvYXJt
L3ZnaWMuYyAgICAgICAgIHwgIDIgKysNCj4+Pj4gNSBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9LY29uZmlnIGIveGVuL2FyY2gvYXJtL0tjb25maWcNCj4+Pj4gaW5kZXggZmQ1N2E4MmRk
Mjg0Li5kYzcwMmYwOGFjZTcgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9LY29uZmln
DQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+Pj4+IEBAIC03OCw2ICs3OCwxNCBA
QCBjb25maWcgQVJNX0VGSQ0KPj4+PiAgICAgICAgIFVFRkkgZmlybXdhcmUuIEEgVUVGSSBzdHVi
IGlzIHByb3ZpZGVkIHRvIGFsbG93IFhlbiB0bw0KPj4+PiAgICAgICAgIGJlIGJvb3RlZCBhcyBh
biBFRkkgYXBwbGljYXRpb24uDQo+Pj4+IA0KPj4+PiArY29uZmlnIEdJQ1YyDQo+Pj4gU28sIG5v
dyBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBkZXNlbGVjdCBib3RoIEdJQyBkcml2ZXJzIGFuZCBY
ZW4gd291bGQgbm90IGNvbXBsYWluIHdoZW4gYnVpbGRpbmcuDQo+Pj4gVGhpcyBtZWFucyB0aGF0
IFhlbiB3b3VsZCBmYWlsIG9uIGJvb3Qgd2l0aG91dCBhbnkgbWVzc2FnZSBhcyBpdCBoYXBwZW5z
IGJlZm9yZSBzZXJpYWwgZHJpdmVyIGluaXRpYWxpemF0aW9uLg0KPj4+IFNpbmNlIGhhdmluZyBH
SUMgZHJpdmVyIGJ1aWx0IGluIGlzIGEgbXVzdC1oYXZlIEkgdGhpbmsgd2UgbmVlZCB0byBtYWtl
IHN1cmUgdGhhdCBhdCBsZWFzdCBvbmUgaXMgZW5hYmxlZC4NCj4+IA0KPj4gSGkgTWljaGFsLA0K
Pj4gDQo+PiBJIHRyaWVkIGFuZCBJIGhhZDoNCj4+IA0KPj4gU3RhcnRpbmcga2VybmVsIC4uLg0K
Pj4gDQo+PiAtIFVBUlQgZW5hYmxlZCAtDQo+PiAtIEJvb3QgQ1BVIGJvb3RpbmcgLQ0KPj4gLSBD
dXJyZW50IEVMIDAwMDAwMDAwMDAwMDAwMDggLQ0KPj4gLSBJbml0aWFsaXplIENQVSAtDQo+PiAt
IFR1cm5pbmcgb24gcGFnaW5nIC0NCj4+IC0gWmVybyBCU1MgLQ0KPj4gLSBSZWFkeSAtDQo+PiAo
WEVOKSBDaGVja2luZyBmb3IgaW5pdHJkIGluIC9jaG9zZW4NCj4+IChYRU4pIFJBTTogMDAwMDAw
MDA4MDAwMDAwMCAtIDAwMDAwMDAwZmVmZmZmZmYNCj4+IChYRU4pIFJBTTogMDAwMDAwMDg4MDAw
MDAwMCAtIDAwMDAwMDA4ZmZmZmZmZmYNCj4+IChYRU4pDQo+PiAoWEVOKSBNT0RVTEVbMF06IDAw
MDAwMDAwODQwMDAwMDAgLSAwMDAwMDAwMDg0MTVkMDAwIFhlbg0KPj4gKFhFTikgTU9EVUxFWzFd
OiAwMDAwMDAwMGZkNmM1MDAwIC0gMDAwMDAwMDBmZDZjODAwMCBEZXZpY2UgVHJlZQ0KPj4gKFhF
TikgTU9EVUxFWzJdOiAwMDAwMDAwMDgwMDgwMDAwIC0gMDAwMDAwMDA4MTRmMWEwMCBLZXJuZWwN
Cj4+IChYRU4pICBSRVNWRFswXTogMDAwMDAwMDA4MDAwMDAwMCAtIDAwMDAwMDAwODAwMTAwMDAN
Cj4+IChYRU4pICBSRVNWRFsxXTogMDAwMDAwMDAxODAwMDAwMCAtIDAwMDAwMDAwMTg3ZmZmZmYN
Cj4+IChYRU4pDQo+PiAoWEVOKQ0KPj4gKFhFTikgQ29tbWFuZCBsaW5lOiBub3JlYm9vdCBkb20w
X21lbT0xMDI0TSBjb25zb2xlPWR0dWFydCBkdHVhcnQ9c2VyaWFsMCBib290c2NydWI9MA0KPj4g
KFhFTikgUEZOIGNvbXByZXNzaW9uIG9uIGJpdHMgMjAuLi4yMg0KPj4gKFhFTikgRG9tYWluIGhl
YXAgaW5pdGlhbGlzZWQNCj4+IChYRU4pIEJvb3RpbmcgdXNpbmcgRGV2aWNlIFRyZWUNCj4+IChY
RU4pIFBsYXRmb3JtOiBHZW5lcmljIFN5c3RlbQ0KPj4gKFhFTikNCj4+IChYRU4pICoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4+IChYRU4pIFBhbmljIG9uIENQVSAw
Og0KPj4gKFhFTikgVW5hYmxlIHRvIGZpbmQgY29tcGF0aWJsZSBHSUMgaW4gdGhlIGRldmljZSB0
cmVlDQo+PiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+
PiAoWEVOKQ0KPj4gKFhFTikgTWFudWFsIHJlc2V0IHJlcXVpcmVkICgnbm9yZWJvb3QnIHNwZWNp
ZmllZCkNCj4gSGF2aW5nIGVhcmx5IHByaW50ayBlbmFibGVkIGFsbCB0aGUgdGltZSBpcyBub3Qg
Y29tbW9uIGFuZCBub3QgZW5hYmxlZCBpbiByZWxlYXNlIGJ1aWxkcyBGV0lLLg0KPiBTbyBpbiBn
ZW5lcmFsLCB1c2VyIHdvdWxkIGp1c3Qgc2VlICJTdGFydGluZyBrZXJuZWwiIGZyb20gdS1ib290
IGFuZCBoYWQgdG8gZGVidWcgd2hhdCdzIGdvaW5nIG9uLg0KPiANCj4+IA0KPj4gV291bGRu4oCZ
dCBiZSBlbm91Z2ggdG8gc3VnZ2VzdCB0aGUgdXNlciB0aGF0IGF0IGxlYXN0IG9uZSBHSUMgbmVl
ZHMgdG8gYmUgc2VsZWN0ZWQ/IEluIHRoZSBoZWxwIGl0DQo+PiBhbHNvIHN0YXRlcyDigJxpZiB1
bnN1cmUsIHNheSBZIg0KPiBJIGFsd2F5cyB0aGluayBpdCBpcyBiZXR0ZXIgdG8gbWVldCB0aGUg
dXNlcnMgbmVlZHMgYnkgcHJldmVudGluZyB1bndpc2UgbWlzdGFrZXMgbGlrZSB1bnNlbGVjdGlu
ZyBib3RoIGRyaXZlcnMuDQo+IEFzIGFsd2F5cywgaXQgaXMgdXAgdG8gbWFpbnRhaW5lcnMuDQoN
CkFueXdheSBJIHVuZGVyc3RhbmQgeW91ciBwb2ludCwgZG8geW91IHRoaW5rIHNvbWV0aGluZyBs
aWtlIHRoYXQgY291bGQgYmUgb2s/IEnigJl2ZSBjaGVja2VkIGFuZCBpdCB3b3JrcywgaXQNCmNv
bXBpbGUgb25seSBpZiBhdCBsZWFzdCBvbmUgR0lDIGRyaXZlciBpcyBlbmFibGVkDQoNCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQppbmRl
eCAyNjRkMmYyZDRiMDkuLjg1YjRhN2YwODkzMiAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9z
ZXR1cC5jDQorKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KQEAgLTEwOTYsNiArMTA5Niw5IEBA
IHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQsDQog
DQogICAgIHByZWluaXRfeGVuX3RpbWUoKTsNCiANCisgICAgLyogRG9uJ3QgYnVpbGQgaWYgYXQg
bGVhc3Qgb25lIEdJQyBkcml2ZXIgaXMgZW5hYmxlZCAqLw0KKyAgICBCVUlMRF9CVUdfT04oIShJ
U19FTkFCTEVEKENPTkZJR19HSUNWMykgfHwgSVNfRU5BQkxFRChDT05GSUdfR0lDVjIpDQorICAg
ICAgICAgICAgICAgICB8fCBJU19FTkFCTEVEKENPTkZJR19ORVdfVkdJQykpKTsNCiAgICAgZ2lj
X3ByZWluaXQoKTsNCiANCiAgICAgYXJtX3VhcnRfaW5pdCgpOw0KDQo+IA0KPiB+TWljaGFsDQoN
Cg==

