Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1884416D3E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 09:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194997.347446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTg6P-00013W-IK; Fri, 24 Sep 2021 07:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194997.347446; Fri, 24 Sep 2021 07:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTg6P-00011M-Ex; Fri, 24 Sep 2021 07:58:37 +0000
Received: by outflank-mailman (input) for mailman id 194997;
 Fri, 24 Sep 2021 07:58:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTg6O-00011G-59
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 07:58:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36dd8904-1d0d-11ec-baad-12813bfff9fa;
 Fri, 24 Sep 2021 07:58:34 +0000 (UTC)
Received: from DB6PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:6:2d::16) by
 DB6PR0802MB2229.eurprd08.prod.outlook.com (2603:10a6:4:86::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Fri, 24 Sep 2021 07:58:31 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::80) by DB6PR07CA0006.outlook.office365.com
 (2603:10a6:6:2d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.9 via Frontend
 Transport; Fri, 24 Sep 2021 07:58:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 07:58:31 +0000
Received: ("Tessian outbound 010023020eef:v103");
 Fri, 24 Sep 2021 07:58:30 +0000
Received: from 7a150549a02d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 57D04B7E-F877-42D8-A7A3-B0B4719A2269.1; 
 Fri, 24 Sep 2021 07:58:21 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a150549a02d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 07:58:21 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB7PR08MB3404.eurprd08.prod.outlook.com (2603:10a6:10:4c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 07:58:16 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 07:58:16 +0000
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
X-Inumbo-ID: 36dd8904-1d0d-11ec-baad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPOKGE2c7b+0EaNxWhyU8qdtwe1wc73sG+KhY52GqZM=;
 b=Smb/S1q9RhToQ2kmCk9E/k/CNACHeHEx3j//PLZmzOwpUbV1QvMAcMQrNSgLc5FAubymptVNQADgnsekt2gzb8h6cjfuEqpSk37jijYujshMpqeyl4OcN5XCJOnHCU7J8KPiD0GNQMwXueYqvZ8ItIIil3ajcDZOne2kAk4rwSk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUft3LcFVvbOtORL2WTEPsXlnRNWnPEEptHlIPGSJ645ReprVLcFNIYcUTvtCCpcrRDGA5oQbZKRK2THgSrmAowyY1tZHENSp2q15Qbnqjn/knL7FlcT/6bZG0ZI8pWyyrti6RjRvrpXkNZ6lZcUz6Nh/45AiRQuUVuDo+chTheLNuqKJWxeDas8pa7Q+88o13dl6fptGEBj85nAn7pi6czGUSRNntPVvXM4rYZwLC1wJO0X1M+/sOv8Hc3OUTJrwcRyKAUWr9i2Q7tFkNNI64AUiW8jVPGwd7CL7KIDD2KCXNT43TKvLYHC4VXnTWJ7jT10gMNpr6XHNW0WaL+Ozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LPOKGE2c7b+0EaNxWhyU8qdtwe1wc73sG+KhY52GqZM=;
 b=DaYy+RMH08D6CDeg+3SynvK7dqaj7XZIevbydUe+SSqE5L+/5KV3lLD7NHWo9PyMIAJzY/stVgW1MdWPkOoHMA4UjcauPGS2S+dnx2nuy9lm8m0xKtj75KHYKL7QirGzurMj1toi8g4JXB5bQhfHXMKe+IrzZdSHHb0JzoAUNuM2mXAp6Q/65NwLqJHrMr2IRmgDQYo+EoVqaBZt8zLUA5QQ7HyIrfwNB0A5bH2DSapO3Js9Tjj394mvMh2LBtvr5RHLCW8PJWWJmKRgPpPB4IxjFRrwhOdvqJYRa1tLxgbWy+XjscxkYjT0srRPed5jQFSoBnw5mpepi4YPdKlB6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPOKGE2c7b+0EaNxWhyU8qdtwe1wc73sG+KhY52GqZM=;
 b=Smb/S1q9RhToQ2kmCk9E/k/CNACHeHEx3j//PLZmzOwpUbV1QvMAcMQrNSgLc5FAubymptVNQADgnsekt2gzb8h6cjfuEqpSk37jijYujshMpqeyl4OcN5XCJOnHCU7J8KPiD0GNQMwXueYqvZ8ItIIil3ajcDZOne2kAk4rwSk=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 32/37] xen/arm: unified entry to parse all NUMA data from
 device tree
Thread-Topic: [PATCH 32/37] xen/arm: unified entry to parse all NUMA data from
 device tree
Thread-Index: AQHXsHM2z1sQ26jXekKStLWrlrd1WKuyhFCAgABOShA=
Date: Fri, 24 Sep 2021 07:58:15 +0000
Message-ID:
 <DB9PR08MB6857E6B6BDE4D55F7D468DDF9EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-33-wei.chen@arm.com>
 <alpine.DEB.2.21.2109232007160.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109232007160.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0365E1471FCB5243A4E4F359521A6FD0.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 74837a7c-3057-47ae-d484-08d97f3119f0
x-ms-traffictypediagnostic: DB7PR08MB3404:|DB6PR0802MB2229:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2229E1643C880E4EC92DD8B49EA49@DB6PR0802MB2229.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RqLipg38+tX5rHVftjfPMcwn7C4LU3svZS4B1U1aOqAmtE/NovKX2j7SpnbKASlo0UFyYF8ubdp1d2e8poNjpk3sQyi5cm34T3vW7PtfbAz4F98hY/JRYNsiWxWvbGCM/XP0gyqS1yGsU3hmKc8gavQMf+yet2SEwF9yKSzIIOaxeOIgrbYRov70k+cAHpeiv8TPfwGq++cnwxAleSsQ6rON8ypp1CNwpfgIqrdgnFUadSiGYXVSRMHRJPtMCIRfdEIbsWLqMCJ6993XeUgO5MjOCo0kD9dCHgc1D9t+VkUPru2ReV3ReVcbm6F+K3HukxdXZZ5fhRTHTFitLc/QLGst6S2xibRGOQwtRf4OL8ytpa0OjxHIoDf0Z1K2dYPYIs7kZo4zBISFdJ7IOqBsHLMuoUwZUKovhNDXE5Oo4B+fPUCbeZ9cbZz+x3bite5g9Xmne/VLjZkZT0u0QQzNo+8RLYRbYMd6ZANZiQZX8v+cG1mvp2BIWUwQ5SLmK1MDYx7I8ri/lgCGJb6KSq/VU559rOFsVNWFgvta6wkJJrm35W7kAFMpJFjOhHV+UI3umJYOQuK79zKqHEzEXwxIu8Y9y22G3qOhj6O/XX+ODMw6acihRbCUJaGLY5qJ4BQz1YsR1B5+nos49UMpV5mftxvy7jwz4v78rtTF9r8fma4nnL4b55533i743i3YtOvH7jUMm6XHsIcV0Yi4zYRHfA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(86362001)(83380400001)(66476007)(64756008)(66556008)(508600001)(38100700002)(26005)(8676002)(66946007)(122000001)(71200400001)(38070700005)(6506007)(76116006)(33656002)(66446008)(5660300002)(55016002)(8936002)(54906003)(316002)(4326008)(186003)(2906002)(7696005)(52536014)(53546011)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3404
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	baa974ae-af3d-41fd-cd6e-08d97f3110bd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wHVYtJx/U4yI91cjHt/3xvA51u63bEFB1F4apiGjeABvP3Vv2fLTFGK+utgIdRtyxqXGOLFMDfP/vir/ASINWfwUz+oFp2HmpP3bSRHTpbATHb590fQVa5Ga3XUKeP+f2GcwXuXut/EnBclQ7rOg26traVM/uXLUcKgKZQJ1LrRyDMnJBr3uNjpvR7E7dNhla6E2qLG5mq5Z4bf4Bz6bMCkjD2+RewC/meOXB4JOLcHiCZ/M4zRCpXnjwwGIcoA+njxtTfjdmk4XBGvNxsKszKvMzawF1tMRoYjjFR6iR+tZqz3JUY1/OfcHJx6m/ACqnFT/Wlfs7qHboQ0u/aZjuclUyJOifR/RxfRMkjzTTgwoPLaxBCIqyc9HZklGmbSo4NT2VmRorL3bOHRiL/Cr93pNEQyqamyp6MNkdVhtc11kpAzIHZF5ahl4ZwhuvOl0HG7ZCXXaizVIiiURg71wbjHeP2u+/uhHr9wMMxOtlV4Pm+UANIs8j0YxjgM7fVDufLEoq5lBOgCHGgH3HyUpxqVE90LpYwxlP7IwwJ8eVFi3JMMrq4BpctZ7B4lS2LQyqUsBYh8up9Ggczbf8LOYSApch0+ZrSBaBI8GLH1gGEhvwCxAFCJgHqfTY+Vr40wECR4XCTaFd7BU4ByULzloyKVBVoynktXK106//PJ88CWEiSXwXhE/aBy7g0HB1Ar3ry+tPlp2WdaasV0GBqQGmQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(52536014)(8676002)(8936002)(83380400001)(81166007)(36860700001)(54906003)(6862004)(9686003)(508600001)(47076005)(4326008)(55016002)(86362001)(33656002)(26005)(70586007)(70206006)(336012)(186003)(5660300002)(2906002)(6506007)(7696005)(316002)(53546011)(356005)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 07:58:31.4904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74837a7c-3057-47ae-d484-08d97f3119f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2229

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jnU
wjI0yNUgMTE6MTcNCj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxp
ZW5AeGVuLm9yZzsNCj4gQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMyLzM3XSB4ZW4vYXJtOiB1bmlmaWVkIGVudHJ5IHRv
IHBhcnNlIGFsbCBOVU1BIGRhdGENCj4gZnJvbSBkZXZpY2UgdHJlZQ0KPiANCj4gT24gVGh1LCAy
MyBTZXAgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4gSW4gdGhpcyBBUEksIHdlIHNjYW4gd2hv
bGUgZGV2aWNlIHRyZWUgdG8gcGFyc2UgQ1BVIG5vZGUgaWQsIG1lbW9yeQ0KPiAgICAgICAgICAg
XiBmdW5jdGlvbiAgIF4gdGhlIHdob2xlDQo+IA0KPiA+IG5vZGUgaWQgYW5kIGRpc3RhbmNlLW1h
cC4gVGhvdWdoIGVhcmx5X3NjYW5fbm9kZSB3aWxsIGludm9rZSBoYXMgYQ0KPiA+IGhhbmRsZXIg
dG8gcHJvY2VzcyBtZW1vcnkgbm9kZXMuIElmIHdlIHdhbnQgdG8gcGFyc2UgbWVtb3J5IG5vZGUg
aWQNCj4gPiBpbiB0aGlzIGhhbmRsZXIsIHdlIGhhdmUgdG8gZW1iZWRlZCBOVU1BIHBhcnNlIGNv
ZGUgaW4gdGhpcyBoYW5kbGVyLg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIGVt
YmVkDQo+IA0KPiA+IEJ1dCB3ZSBzdGlsbCBuZWVkIHRvIHNjYW4gd2hvbGUgZGV2aWNlIHRyZWUg
dG8gZmluZCBDUFUgTlVNQSBpZCBhbmQNCj4gPiBkaXN0YW5jZS1tYXAuIEluIHRoaXMgY2FzZSwg
d2UgaW5jbHVkZSBtZW1vcnkgTlVNQSBpZCBwYXJzZSBpbiB0aGlzDQo+ID4gQVBJIHRvby4gQW5v
dGhlciBiZW5lZml0IGlzIHRoYXQgd2UgaGF2ZSBhIHVuaXF1ZSBlbnRyeSBmb3IgZGV2aWNlDQo+
ICAgXiBmdW5jdGlvbg0KPiANCj4gPiB0cmVlIE5VTUEgZGF0YSBwYXJzZS4NCj4gDQo+IEFoLCB0
aGF0J3MgdGhlIGV4cGxhbmF0aW9uIEkgd2FzIGFza2luZyBmb3IgZWFybGllciENCj4gDQoNClRo
ZSBxdWVzdGlvbiBhYm91dCBkZXZpY2VfdHJlZV9nZXRfbWVtaW5mbz8NCg0KPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgeGVu
L2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiA+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaCAgICAgIHwgIDEgKw0KPiA+
ICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+IGIveGVuL2FyY2gvYXJtL251bWFf
ZGV2aWNlX3RyZWUuYw0KPiA+IGluZGV4IGU3ZmE4NGRmNGMuLjZhM2ZlZDAwMDIgMTAwNjQ0DQo+
ID4gLS0tIGEveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+ICsrKyBiL3hlbi9h
cmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gPiBAQCAtMjQyLDMgKzI0MiwzMyBAQCBzdGF0
aWMgaW50IF9faW5pdA0KPiBmZHRfcGFyc2VfbnVtYV9kaXN0YW5jZV9tYXBfdjEoY29uc3Qgdm9p
ZCAqZmR0LCBpbnQgbm9kZSkNCj4gPg0KPiA+ICAgICAgcmV0dXJuIDA7DQo+ID4gIH0NCj4gPiAr
DQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IGZkdF9zY2FuX251bWFfbm9kZXMoY29uc3Qgdm9pZCAq
ZmR0LA0KPiA+ICsgICAgICAgICAgICAgICAgaW50IG5vZGUsIGNvbnN0IGNoYXIgKnVuYW1lLCBp
bnQgZGVwdGgsDQo+ID4gKyAgICAgICAgICAgICAgICB1MzIgYWRkcmVzc19jZWxscywgdTMyIHNp
emVfY2VsbHMsIHZvaWQgKmRhdGEpDQo+IA0KPiBQbGVhc2UgYWxpZ24gcGFyYW1ldGVycw0KPiAN
Cg0KT0sNCg0KPiANCj4gPiArew0KPiA+ICsgICAgaW50IGxlbiwgcmV0ID0gMDsNCj4gPiArICAg
IGNvbnN0IHZvaWQgKnByb3A7DQo+ID4gKw0KPiA+ICsgICAgcHJvcCA9IGZkdF9nZXRwcm9wKGZk
dCwgbm9kZSwgImRldmljZV90eXBlIiwgJmxlbik7DQo+ID4gKyAgICBpZiAocHJvcCkNCj4gDQo+
IGNvZGUgc3R5bGUNCj4gDQoNCk9LDQoNCj4gDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgbGVu
ICs9IDE7DQo+ID4gKyAgICAgICAgaWYgKCBtZW1jbXAocHJvcCwgImNwdSIsIGxlbikgPT0gMCAp
DQo+ID4gKyAgICAgICAgICAgIHJldCA9IGZkdF9wYXJzZV9udW1hX2NwdV9ub2RlKGZkdCwgbm9k
ZSk7DQo+ID4gKyAgICAgICAgZWxzZSBpZiAoIG1lbWNtcChwcm9wLCAibWVtb3J5IiwgbGVuKSA9
PSAwICkNCj4gPiArICAgICAgICAgICAgcmV0ID0gZmR0X3BhcnNlX251bWFfbWVtb3J5X25vZGUo
ZmR0LCBub2RlLCB1bmFtZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBh
ZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzKTsNCj4gDQo+IEkgcmVhbGl6ZSB0aGF0IHdpdGggdGhl
IGluY2x1c2lvbiBvZiAnXDAnIGluIHRoZSBjaGVjaywgdGhlIHVzYWdlIG9mDQo+IG1lbWNtcCBz
aG91bGQgYmUgc2FmZSwgYnV0IEkgd291bGQgcHJlZmVyIGlmIHdlIHVzZWQgc3RybmNtcCBpbnN0
ZWFkLg0KPiANCg0KT2ssIEkgd2lsbCB1c2Ugc3RybmNtcCBpbiBuZXh0IHZlcnNpb24uDQoNCj4g
DQo+ID4gKyAgICB9DQo+ID4gKyAgICBlbHNlIGlmICggZmR0X25vZGVfY2hlY2tfY29tcGF0aWJs
ZShmZHQsIG5vZGUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIm51bWEt
ZGlzdGFuY2UtbWFwLXYxIikgPT0gMCApDQo+ID4gKyAgICAgICAgcmV0ID0gZmR0X3BhcnNlX251
bWFfZGlzdGFuY2VfbWFwX3YxKGZkdCwgbm9kZSk7DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIHJl
dDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArLyogSW5pdGlhbGl6ZSBOVU1BIGZyb20gZGV2aWNlIHRy
ZWUgKi8NCj4gPiAraW50IF9faW5pdCBudW1hX2RldmljZV90cmVlX2luaXQoY29uc3Qgdm9pZCAq
ZmR0KQ0KPiA+ICt7DQo+ID4gKyAgICByZXR1cm4gZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZShm
ZHQsIDAsIGZkdF9zY2FuX251bWFfbm9kZXMsIE5VTEwpOw0KPiA+ICt9DQo+ID4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9udW1h
LmgNCj4gPiBpbmRleCA3Njc1MDEyY2I3Li5mNDZlOGUyOTM1IDEwMDY0NA0KPiA+IC0tLSBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9u
dW1hLmgNCj4gPiBAQCAtMjMsNiArMjMsNyBAQCB0eXBlZGVmIHU4IG5vZGVpZF90Ow0KPiA+ICAj
ZGVmaW5lIE5SX05PREVfTUVNQkxLUyBOUl9NRU1fQkFOS1MNCj4gPg0KPiA+ICBleHRlcm4gdm9p
ZCBudW1hX3NldF9kaXN0YW5jZShub2RlaWRfdCBmcm9tLCBub2RlaWRfdCB0bywgdWludDMyX3QN
Cj4gZGlzdGFuY2UpOw0KPiA+ICtleHRlcm4gaW50IG51bWFfZGV2aWNlX3RyZWVfaW5pdChjb25z
dCB2b2lkICpmZHQpOw0KPiA+DQo+ID4gICNlbHNlDQo+ID4NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0K
PiA+DQo=

