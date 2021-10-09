Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431B427887
	for <lists+xen-devel@lfdr.de>; Sat,  9 Oct 2021 11:41:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205090.360347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZ8qk-00019R-2n; Sat, 09 Oct 2021 09:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205090.360347; Sat, 09 Oct 2021 09:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZ8qj-00017d-VN; Sat, 09 Oct 2021 09:41:01 +0000
Received: by outflank-mailman (input) for mailman id 205090;
 Sat, 09 Oct 2021 09:41:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ysgi=O5=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mZ8qj-00017X-Cc
 for xen-devel@lists.xenproject.org; Sat, 09 Oct 2021 09:41:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.41]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ecdfa06-00f8-4c44-8784-84243e11fde7;
 Sat, 09 Oct 2021 09:40:57 +0000 (UTC)
Received: from DB6P193CA0016.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::26) by
 VI1PR0802MB2416.eurprd08.prod.outlook.com (2603:10a6:800:bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Sat, 9 Oct
 2021 09:40:54 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::93) by DB6P193CA0016.outlook.office365.com
 (2603:10a6:6:29::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Sat, 9 Oct 2021 09:40:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Sat, 9 Oct 2021 09:40:54 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Sat, 09 Oct 2021 09:40:54 +0000
Received: from a6033bcd3b57.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1032F2A4-FF04-4183-AF7A-9BCFB0736FDF.1; 
 Sat, 09 Oct 2021 09:40:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6033bcd3b57.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 09 Oct 2021 09:40:48 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR0801MB1920.eurprd08.prod.outlook.com (2603:10a6:800:8f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Sat, 9 Oct
 2021 09:40:47 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::41d6:b115:3b22:2cd]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::41d6:b115:3b22:2cd%2]) with mapi id 15.20.4587.024; Sat, 9 Oct 2021
 09:40:46 +0000
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
X-Inumbo-ID: 0ecdfa06-00f8-4c44-8784-84243e11fde7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxCN7YUiHa2aOxcQyZRnG4XEruW3sn6G6+e8TIJaOKU=;
 b=67Pw0k8Qr1m33ZKp+1xzmH3I9ZbrXv1mfi9PHkboMz2i9ENF1KxigJL+Lqfwdqy56ENCfPZE1yUBefEtDBtnbZET/ydouuPjOrrWPbY67ycvj6Cz2ckN6+Zan2ozIbfZKQ5xt+p1YHBa3Opiuy0RQkpFVaImo44/lovsHIUg2j8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Byq2Jt7SleFq6/Z/SeFLbb/k7Gd1HVuFLN8FNvs+s2i8FReyw3s9zuTNmEMD0FbaCVIS/GUVXVx2tWtxSsqv+lvB7Jd4um07CsBi8TydNOHrvgqD3p7iQVqOlQMpoP+OkgYjtZ61o1a6OAhDA/tvof6RQBtnF40GHuq6UYoQtuz0vnOrBZtBJ+418LoWHkrRaJhmCrhfzsK3rm5GniopMfUqJTzPSg+J+/PCn1kWhbzpsMS2Yhnz4ZN0COqFLVGVOEFs8knzK3bsD8orZ1WmngM6PzKVLnGUsUESjBDOT93abvCMxa2pBUd57h1FWx1pDlGA03AmubeWxirCd+uyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxCN7YUiHa2aOxcQyZRnG4XEruW3sn6G6+e8TIJaOKU=;
 b=NREAm9FwMNtaION5V+6rrFWu4X71lEywatvo4w0FWln95cMZUzFg+P8hFvevl4ez5o0F9CMegTipD+CREaerXoIRl0FsCpUxVAbpC6JXLobvwAdSZbpqGTn5MuIuQ6kZte4I/EOG0W8dexB7wJjJnPdb2JtG0gK2+IGJ19r/T36jp/Zk4PKpvGevXD8Vwwf8PJpfWw6eBw4I1CuSx4p18DSM9j4tM7LcBJzcEuhkg/AlVp/ZJgAPupCWlpcj7zDvf0WkOuO9JhvFhnJio6Y/nVvvlkgwSIAuZopSqOz2AZ/0LG7HtzVrZID9e1a39srSGD80U3MYnSNqWc5P2EZtTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxCN7YUiHa2aOxcQyZRnG4XEruW3sn6G6+e8TIJaOKU=;
 b=67Pw0k8Qr1m33ZKp+1xzmH3I9ZbrXv1mfi9PHkboMz2i9ENF1KxigJL+Lqfwdqy56ENCfPZE1yUBefEtDBtnbZET/ydouuPjOrrWPbY67ycvj6Cz2ckN6+Zan2ozIbfZKQ5xt+p1YHBa3Opiuy0RQkpFVaImo44/lovsHIUg2j8=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH 10/11] xen/arm: device assignment on 1:1 direct-map domain
Thread-Topic: [PATCH 10/11] xen/arm: device assignment on 1:1 direct-map
 domain
Thread-Index: AQHXsCjEx0HGlBpA+Em1L92CXDXaB6uxe3AAgBj87fA=
Date: Sat, 9 Oct 2021 09:40:46 +0000
Message-ID:
 <VE1PR08MB5215A1D5695F388F17C367D4F7B39@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-11-penny.zheng@arm.com>
 <c6730ec5-53c7-9bf2-4620-eefbc7c7c4a3@xen.org>
In-Reply-To: <c6730ec5-53c7-9bf2-4620-eefbc7c7c4a3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F3A293D88EA6F3478F74228BB23FCC65.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4bb6bfb0-bb61-4729-ddcf-08d98b08e3ac
x-ms-traffictypediagnostic: VI1PR0801MB1920:|VI1PR0802MB2416:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2416BCB62146C3B950040650F7B39@VI1PR0802MB2416.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HmYxuEzF838lJwMOSDyT3ljCC2cve8H8Cx0CaGNvUEmfJUHXQz77vfeKziutUMsw3KTzzsbNzllELX/yhbYuXUW8+Ewfh4k49oow0aL7kcstXlpsq0o+Cle7toMJmmMZn1B1PVVUDcrXqZ7/3ozo3MsMGI6rO90BKAFcUhCOUQF3cKDokHZ2Uff8Sc3vBPuLqm74vWVTP0HVOpuC7K/h6HQvg5usVv20O7iyk3W3nhxGVx6//q5Mc2ZiwXBxs7yfAHgpx/OP/HjXjHVNCEMzBWb7ccF8od5pe+6vvgBFWKxAxD7noywQ15AoF5s5LJTkN1ESt80XgA4MVl4ZUpkFjJReaIpHJk4DHfW+fOGz/bw//yPQZ03l4x+grAUEjipANyEXp2jS4CaR+8RBr1ULYKHSl3byyKrQn7Z/QcnsNJHOlq6O6UmJrH8JN/eUVd7d/oX8SZKAQUe+B68i8lg0kR6QU254OZroEsouV/7vY1S00jN21EV/DX6onUZ0O6TeMdDtZzfUNMOXWdSFekKeA4fAqR8kGcwXMZ8nclIA2cehrYuBws7jVgicC7SZyaksv698Yvd+02sGEPcOGjMwMaQlqt7UzM4pBZnv1YiJ3cNnU5Cblthlj7v/m1mEiHKdQbXgjByOVZus5jMXZMx8a0HFhNPqn5QfHpRuJO6n1Rr63Lr1Ohnmjq7PQG2kCVUYJr0UjfOrneMCgzpTQ2P/jg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(122000001)(66446008)(66476007)(64756008)(53546011)(66556008)(76116006)(9686003)(55016002)(52536014)(2906002)(7696005)(86362001)(83380400001)(6506007)(33656002)(110136005)(508600001)(316002)(4326008)(38100700002)(8676002)(5660300002)(38070700005)(54906003)(8936002)(186003)(71200400001)(26005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1920
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ed65b07a-fde1-4df4-562c-08d98b08df2b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ae0W4pzU47NCe7n1WSOZll235WnOFSBjQ8BteaMC0O/Tw9v2Il4AOYD9RybsofBxGLJu/h3IM0H0JhH97WPzBa4QA8bptnR1TKR62tGDmqwosS/gzNtAV90qg6NFCFqYyvXZ5cwQKCqQc7H5DKZ96nY1VPem/N694iHv+Lpry5vhDOeb0tvuT6Qi+kLOgdhLjp8x12ky8dKO5xmFyinbs08WcreTcKBEFRTIVQdD8+Dbjx8ICFtjoHOHh6jBMw8YlayaLozEP8W0FFqUDARnl/rE6pS44S5jNOXaiUTpS66NEnr3eVFtsa6wxCyzs41+2c67wc46V31hOeCQA9rBk/bLfz4aRtq/4IEkbuW2H8Vd4SFhr8t6h8OHlBKh3QIEr9ZQQlFox1cnAW/gKg9jmAOH+4rMYeGCv7IYX5zSjuobUiUkHutLPbV4e6rA3qpett1llTIxfNc1Uqr0hNkF0tbniyzy/4/aHjn7W8TCt43KHdMSghXnYdaR2xICS0ogvRu2lrdb+uYVTN5r3v8h/Z7HE044dO53VE2XNwNULST0Qy0b8DUOIpJZW3Oi4VPDIOAAtxlybl6RG5ASeSNnB7/6Nra/ueTDyDv3QoSwOriJV5B/57wGqV62UStMop4cX5Jqugy+NmBYVNVmYf/2tfLBCqrpdR6jyDQ+zTP0UPGET06nXMenBSh+PBbhyu0V+ibsp0A5k10/mGs+WuJdwQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(83380400001)(82310400003)(6506007)(336012)(26005)(186003)(4326008)(55016002)(9686003)(54906003)(316002)(86362001)(110136005)(7696005)(5660300002)(52536014)(47076005)(508600001)(53546011)(2906002)(8676002)(8936002)(33656002)(81166007)(356005)(70586007)(70206006)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2021 09:40:54.5322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb6bfb0-bb61-4729-ddcf-08d98b08e3ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2416

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAyMywg
MjAyMSA3OjI3IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENo
ZW4NCj4gPFdlaS5DaGVuQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMTAvMTFdIHhl
bi9hcm06IGRldmljZSBhc3NpZ25tZW50IG9uIDE6MSBkaXJlY3QtbWFwDQo+IGRvbWFpbg0KPiAN
Cj4gSGksDQo+IA0KPiBPbiAyMy8wOS8yMDIxIDA4OjExLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4g
PiBVc2VyIGNvdWxkIGRvIGRldmljZSBwYXNzdGhyb3VnaCwgd2l0aA0KPiA+ICJ4ZW4sZm9yY2Ut
YXNzaWduLXdpdGhvdXQtaW9tbXUiIGluIHRoZSBkZXZpY2UgdHJlZSBzbmlwcGV0LCBvbg0KPiA+
IHRydXN0ZWQgZ3Vlc3QgdGhyb3VnaCAxOjEgZGlyZWN0LW1hcCwgaWYgSU9NTVUgYWJzZW50IG9y
IGRpc2FibGVkIG9uDQo+IGhhcmR3YXJlLg0KPiANCj4gQXQgdGhlIG1vbWVudCwgaXQgd291bGQg
YmUgcG9zc2libGUgdG8gcGFzc3Rocm91Z2ggYSBub24tRE1BIGNhcGFibGUNCj4gZGV2aWNlIHdp
dGggZGlyZWN0LW1hcHBpbmcuIEFmdGVyIHRoaXMgcGF0Y2gsIHRoaXMgaXMgZ29pbmcgdG8gYmUg
Zm9yYmlkZGVuLg0KPiANCj4gPg0KPiA+IEluIG9yZGVyIHRvIGFjaGlldmUgdGhhdCwgdGhpcyBw
YXRjaCBhZGRzIDE6MSBkaXJlY3QtbWFwIGNoZWNrIGFuZA0KPiA+IGRpc2FibGVzIGlvbW11LXJl
bGF0ZWQgYWN0aW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55
LnpoZW5nQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMgfCAxMiArKysrKysrKy0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4gaW5kZXggYzky
ZTUxMGFlNy4uOWE5ZDI1MjJiNyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPiBAQCAt
MjA3MCwxNCArMjA3MCwxOCBAQCBzdGF0aWMgaW50IF9faW5pdA0KPiBoYW5kbGVfcGFzc3Rocm91
Z2hfcHJvcChzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0KPiA+ICAgICAgIGlmICggcmVzIDwg
MCApDQo+ID4gICAgICAgICAgIHJldHVybiByZXM7DQo+ID4NCj4gPiArICAgIC8qDQo+ID4gKyAg
ICAgKiBJZiB4ZW5fZm9yY2UsIHdlIGFsbG93IGFzc2lnbm1lbnQgb2YgZGV2aWNlcyB3aXRob3V0
IElPTU1VDQo+IHByb3RlY3Rpb24uDQo+ID4gKyAgICAgKiBBbmQgaWYgSU9NTVUgaXMgZGlzYWJs
ZWQgb3IgYWJzZW50LCAxOjEgZGlyZWN0LW1hcCBpcyBuZWNlc3NhcnkgPiArDQo+ICovDQo+ID4g
KyAgICBpZiAoIHhlbl9mb3JjZSAmJiBpc19kb21haW5fZGlyZWN0X21hcHBlZChraW5mby0+ZCkg
JiYNCj4gPiArICAgICAgICAgIWR0X2RldmljZV9pc19wcm90ZWN0ZWQobm9kZSkgKQ0KPiANCj4g
ZHRfZGV2aWNlX2lzX3Byb3RlY3RlZCgpIHdpbGwgYmUgYWx3YXlzIGZhbHNlIHVubGVzcyB0aGUg
ZGV2aWNlIGlzIHByb3RlY3RlZA0KPiBiZWhpbmcgYW4gU01NVSB1c2luZyB0aGUgbGVnYWN5IGJp
bmRpbmcuIFNvIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBjb3JyZWN0IHRvDQo+IG1vdmUgdGhpcyBj
aGVjayBhaGVhZC4gSW4gZmFjdC4uDQo+IA0KPiA+ICsgICAgICAgIHJldHVybiAwOw0KPiA+ICsN
Cj4gPiAgICAgICByZXMgPSBpb21tdV9hZGRfZHRfZGV2aWNlKG5vZGUpOw0KPiANCj4gLi4uIHRo
ZSBjYWxsIHNob3VsZCBhbHJlYWR5IGJlIGEgTk9QIHdoZW4gdGhlIElPTU1VIGlzIGRpc2FibGVk
IG9yIHRoZQ0KPiBkZXZpY2UgaXMgbm90IGJlaGluZCBhbiBJT01NVS4gU28gY2FuIHlvdSBleHBs
YWluIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8NCj4gcHJldmVudCBoZXJlPw0KPiANCg0KSWYgdGhl
IElPTU1VIGlzIGRpc2FibGVkLCBpb21tdV9hZGRfZHRfZGV2aWNlIHdpbGwgcmV0dXJuIDEgYXMg
ZXJybm8uIA0KU28gd2UgY291bGQgbm90IG1ha2UgaXQgdG8gdGhlIHhlbl9mb3JjZSBjaGVjay4u
Lg0KDQpTbyBJIHRyaWVkIHRvIG1vdmUgYWxsIElPTU1VIGFjdGlvbiBiZWhpbmQgeGVuX2ZvcmNl
IGNoZWNrLg0KDQpOb3csIGRldmljZSBhc3NpZ25tZW50IHdpdGhvdXQgSU9NTVUgcHJvdGVjdGlv
biBpcyBvbmx5DQphcHBsaWNhYmxlIG9uIGRpcmVjdC1tYXAgZG9tYWlucywgc28gdGhpcyBjb21t
aXQgYWxzbyBhZGRzDQppc19kb21haW5fZGlyZWN0X21hcHBlZCBjaGVjayB0b2dldGhlciB3aXRo
IHhlbl9mb3JjZSBjaGVjay4NCg0KPiA+ICAgICAgIGlmICggcmVzIDwgMCApDQo+ID4gICAgICAg
ICAgIHJldHVybiByZXM7DQo+ID4NCj4gPiAtICAgIC8qIElmIHhlbl9mb3JjZSwgd2UgYWxsb3cg
YXNzaWdubWVudCBvZiBkZXZpY2VzIHdpdGhvdXQgSU9NTVUNCj4gcHJvdGVjdGlvbi4gKi8NCj4g
PiAtICAgIGlmICggeGVuX2ZvcmNlICYmICFkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKG5vZGUpICkN
Cj4gPiAtICAgICAgICByZXR1cm4gMDsNCj4gPiAtDQo+ID4gICAgICAgcmV0dXJuIGlvbW11X2Fz
c2lnbl9kdF9kZXZpY2Uoa2luZm8tPmQsIG5vZGUpOw0KPiA+ICAgfQ0KPiA+DQo+ID4NCj4gDQo+
IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

