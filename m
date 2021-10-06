Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBC342445F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 19:35:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202972.358000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAof-0002ez-OS; Wed, 06 Oct 2021 17:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202972.358000; Wed, 06 Oct 2021 17:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAof-0002cG-KS; Wed, 06 Oct 2021 17:34:53 +0000
Received: by outflank-mailman (input) for mailman id 202972;
 Wed, 06 Oct 2021 17:34:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mYAoe-0002cA-5R
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 17:34:52 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.74]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4cef376-26cb-11ec-bf8a-12813bfff9fa;
 Wed, 06 Oct 2021 17:34:50 +0000 (UTC)
Received: from DB9PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:10:1db::20)
 by DB7PR08MB3001.eurprd08.prod.outlook.com (2603:10a6:5:23::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 17:34:47 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::ed) by DB9PR06CA0015.outlook.office365.com
 (2603:10a6:10:1db::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Wed, 6 Oct 2021 17:34:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Wed, 6 Oct 2021 17:34:47 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Wed, 06 Oct 2021 17:34:47 +0000
Received: from cd1f953a2f77.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83AFD11C-6476-49D7-BDBB-6D1AB3815E45.1; 
 Wed, 06 Oct 2021 17:34:40 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd1f953a2f77.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Oct 2021 17:34:40 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6743.eurprd08.prod.outlook.com (2603:10a6:20b:399::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 17:34:39 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 17:34:39 +0000
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
X-Inumbo-ID: b4cef376-26cb-11ec-bf8a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0tVOAYFws4w5ave92WBSKB//qoMdO2J2APb3OThhXk=;
 b=ax98qRSnByL5RYkuUMfaGwbPdOUixpo40JHojj6kngzpbAdp61nXVT2KozPnJcaMSRkIWWcaqup37p7gnGPzkWsKVpt3oqgpsAm/P37o4U5TG1Gr9M4Eb9cwyue/+GD/yoET91Hx0Ql/7QWGY9UecJCF7k+etCy3mmVdkzyBv50=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d9830dec7dbe2d89
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+TqKsouKbyXJO48Ah5sABbeWydHvuuVz1gF19lZW4W7/7v0tt2PdrJB0SyLn5lVi4hl+JV3oPZfChpNXUVJ1KAPTqfTJJRWoHyhtgpRFbwA/pUBKjz+1kDc0z16jAmA6giMa8jg4O62iU0Wz7+x7gB1stcXp5Gk6/PBojn6ZJODJUoA9B65nnfVAoHJTKJ/UGS2ogSW0gWza9E69LzlwvztYS5OvEoYhT604ZidipxsYlthPo/2vXhQiTJu4Qh2HRi1KKRbMnNDEqXxpp8F5xZ7vl+LFnmBXxs5/+HZ19agnuH7UnKi0RsCyviJMftT7K+Vj1jIWfiIxTWhHzVruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0tVOAYFws4w5ave92WBSKB//qoMdO2J2APb3OThhXk=;
 b=eCIqM9V/LSUU/QrcTYV2pgVa0dn7jBx3anO6jIiC7/nadNd4RjG6FoTUcH559+sEuRCvLLY4DUaTB9bfZDvT9suXczTOvKjnQoEJ1ysv2GuQzJtsKVwkl/huBhG1GwseWorD1JDBiWyNp/tdQwLU5EsPnJ9sSyJZ3UYztsg5Qp8DRTft+EABPiMRZvNwvlbp2mdb3lVA9mnJvCBegkKwwr1squlLhfwRhC/4LdJS95atooKQogR0oJJ41Y6P6K4ZrlN46bHoiBq2+V24D2YGvEq54OSfBMFLXwbvzpX7cGOZ5O9K2QTDkKeM+YZHyuKhZenEfjEZ6kTh+iMRrSqe/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0tVOAYFws4w5ave92WBSKB//qoMdO2J2APb3OThhXk=;
 b=ax98qRSnByL5RYkuUMfaGwbPdOUixpo40JHojj6kngzpbAdp61nXVT2KozPnJcaMSRkIWWcaqup37p7gnGPzkWsKVpt3oqgpsAm/P37o4U5TG1Gr9M4Eb9cwyue/+GD/yoET91Hx0Ql/7QWGY9UecJCF7k+etCy3mmVdkzyBv50=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Topic: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Index:
 AQHXuRciClWhjFX7R0aQhsW/aixhyqvDkJEAgACf3oCAAL5hgIAAzJaAgAAXDgCAAALtgIAABFYAgABk+IA=
Date: Wed, 6 Oct 2021 17:34:37 +0000
Message-ID: <5ADA6C46-A69D-459F-868C-DA579FEC36E2@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
 <3ad42008f534671ae7f5b25da91253ce7cd4a3e9.1633340795.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2110041714410.3209@sstabellini-ThinkPad-T480s>
 <11F169C6-39A4-40F3-8E75-39B8C2CCF022@arm.com>
 <alpine.DEB.2.21.2110051421520.3209@sstabellini-ThinkPad-T480s>
 <8B848F95-977F-4DF4-B315-CFEA610BC1C3@arm.com>
 <24925.33634.554859.2131@mariner.uk.xensource.com>
 <BFC5AD62-3DA7-498F-8B6E-AB4C8CAA9731@arm.com>
 <24925.35194.369692.94259@mariner.uk.xensource.com>
In-Reply-To: <24925.35194.369692.94259@mariner.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xenproject.org; dkim=none (message not
 signed) header.d=none;xenproject.org; dmarc=none action=none
 header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e974641f-00c4-42db-4ccc-08d988ef9791
x-ms-traffictypediagnostic: AS8PR08MB6743:|DB7PR08MB3001:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB300182E278ACD4F598F4DB42FCB09@DB7PR08MB3001.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LghTm4AukYUNtI0Y6pZpop21GYMlb9T8FOMPIXKODaHwKHEQW6hzEJtvmqaF8f6m+BeGns4kIUTNVkhKgoavorEQ1o37oAbrN9U8p8yrACNThWqxbQ1PYEoHkKQKq4TND1+w9bcwTr0TWqrPt2maNgQIMIkzm2QwQpvlA1X9r2rrFlY/Bv7qKEaSGIMSVleCliRebzl1vUnrEYBNuVUdy+GYQ927cN8XV7JKdQvneHJJNoLQi/8TewFaKOosgT10+hFzzqbZOBbkBI/Xck/j2j+D1u4EmChwHvjsFcvilrMr5CDldp8PfZzkTAH4rnZ/sVHNYg7xAeIC1acmA68P0WOy7uY9/K5GJWx41Q70VL3WTY+6fB0axg2rvayT8M0skrglFkMwO/l9aoKz9s/yK/p1PEjc9tg5fBkVuF8Rj51rfk9kTEqS2QjHuerPheV+OrtLHhFRj8lhuTp/86aq5lmEEouShRskCKN6M60Htrv2pst5IS08cYsBRUwTgCKuiYA2Q3W+xUAxm3g9OAviu9EX3jtmjnIx8yi23Rx3SUXTK4Y1MZGlCSbJsxTS6u2v881vwtNZWzxCRS+/CdZphVu1kIY+dOWs5b5sW6QlRusIxpERlyXS8MDINOJGCnzicRIDJkSVHs/rh2dzFpQw7aJVC3Omra759Zk76sL0gP7kLqjS9lJxKJJ8Zf22IaCruV2u7Ay9KEaxS6opL8J+/Ux63nE485X5VAJxnyEGszVfBpbOKL9xXa6dLuGrtDP4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(6916009)(6512007)(71200400001)(86362001)(6486002)(38070700005)(8936002)(316002)(66946007)(38100700002)(83380400001)(122000001)(53546011)(36756003)(33656002)(5660300002)(6506007)(66476007)(2616005)(26005)(66446008)(91956017)(76116006)(64756008)(186003)(8676002)(2906002)(508600001)(4326008)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A53861E93E21941A04C90E028F88AFF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6743
Original-Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a7acae48-f11c-4ff4-ec6e-08d988ef92c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I73NSbYRn6d+o3jp3bhR/AcoMbYmRIZzPEm8CDYbEKv6EtWG9T01tBuXmyIjpaFZYGg5drElyOgPwS6VILw1frYFw8B/P///eQRl2w/NzvXPu4Lku+JYs+F/qx+R5Sv7GJ+mUwpn+RQ0yFsjypzOwTawBIFBjc16S/LcqHMGh6nhmGWPSJzY4XyP1ZoNsYhnsPT7SaICmgtXYahHuzVmuQLDpMQ5jP74lrvEaiz203L+QMRWACYHMNr3u5O4cq0+hylk0bwVhfqF3FJCoypc5x1/LRMgKwevJJ0n+5cjouKcAPkTiC0db2KvshHH9NFoZB7uA06UM/A9fbW8OX4qq7+dhBb1/3M1Xacdmq0ORhd/9e5hClerA0cMT/ukZTSYiiRMium1kD5De77AGgoG16GgX2dAxi+YV/03dPNjCNkrtaiIUK64WQhSjZDFCoCE5gI3WS1fBzxtagYYKVuUuk0V3gRS2eQk2I6UX78weq4/ovrPFGczr8qwjpKRJnuDWTDXTHjvGwAkosv40vyMg6HGjO4CN8acmR5BD9YBc1IwqOpcR/9rB/TqW/O4/wiKfC7mfzXw0C0238wJV2Qrr5enh6F8myQ+AVQtDLkYul+ReEIsWeL3wjam7nXAtf7GQKGrrsfUKVk3stOM5m3YnArKHRkn41rv/8+6NVOY9iB+VzmyE0cZ7/GpmjlEg53vHmUJ6hTrNiQrPMgpiEpNHQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(6506007)(107886003)(2906002)(81166007)(5660300002)(86362001)(6486002)(82310400003)(4326008)(33656002)(8936002)(6862004)(6512007)(54906003)(70206006)(53546011)(356005)(47076005)(83380400001)(70586007)(8676002)(336012)(26005)(36860700001)(36756003)(508600001)(186003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 17:34:47.1009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e974641f-00c4-42db-4ccc-08d988ef9791
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3001

SGkgSWFuLA0KDQo+IE9uIDYgT2N0IDIwMjEsIGF0IDEyOjMzIHBtLCBJYW4gSmFja3NvbiA8aXdq
QHhlbnByb2plY3Qub3JnPiB3cm90ZToNCj4gDQo+IFJhaHVsIFNpbmdoIHdyaXRlcyAoIlJlOiBb
UEFUQ0ggdjQgMTMvMTRdIGFybS9saWJ4bDogRW11bGF0ZWQgUENJIGRldmljZSB0cmVlIG5vZGUg
aW4gbGlieGwiKToNCj4+IEhpIElhbgkNCj4+PiBXaGF0IGlzIHdyb25nIHdpdGggcHV0dGluZyBp
dCBpbg0KPj4+IGxpYnhsX19hcmNoX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQNCj4+PiB3
aGljaCBJIHRoaW5rIGV4aXN0cyBwcmVjaXNlbHkgZm9yIHRoaXMga2luZCBvZiB0aGluZyA/DQo+
PiANCj4+IEFzIHdlIGhhdmUgdG8gc2V0IHRoZSBhcmNoX2FybS52cGNpIHRvIGZhbHNlIGZvciB4
ODYgYW5kIEFSTSBJDQo+PiB0aG91Z2h0IGl0IGlzIHJpZ2h0IHRvIG1vdmUgdGhlIGNvZGUgdG8g
Y29tbW9uIGNvZGUgdG8gYXZvaWQNCj4+IGR1cGxpY2F0aW9uLg0KPj4gDQo+PiBBcmUgeW91IHN1
Z2dlc3RpbmcgdG8gcHV0ICINCj4+IGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT5h
cmNoX2FybS52cGNpLCBmYWxzZSnDr8W8xZNpbg0KPj4gbGlieGxfX2FyY2hfZG9tYWluX2J1aWxk
X2luZm9fc2V0ZGVmYXVsdCgpIGZvciB4ODYgYW5kIEFSTQ0KPj4gZGlmZmVyZW50bHkuDQo+IA0K
PiBJJ3ZlIGdvbmUgYmFjayBhbmQgcmVyZWFkIHRoZSB3aG9sZSB0aHJlYWQsIHdoaWNoIEkgcHJv
YmFibHkgc2hvdWxkDQo+IGhhdmUgZG9uZSB0byBzdGFydCB3aXRoLi4uLg0KPiANCj4gU286DQo+
IA0KPj4+PiAjaWYgZGVmaW5lZChfX2FybV9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKSAgICAg
ICAgICAgICAgICAgIA0KPj4+PiAgIC8qICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgDQo+Pj4+ICAgICogRW5hYmxlIFZQQ0kgc3VwcG9ydCBmb3IgQVJNLiBWUENJIHN1cHBvcnQg
Zm9yIERPTVUgZ3Vlc3RzIGlzIG5vdCAgICANCj4+Pj4gICAgKiBzdXBwb3J0ZWQgZm9yIHg4Ni4g
ICAgICAgICAgICAgICAgICAgICAgICAgIA0KPj4+PiAgICAqLyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgDQo+Pj4+ICAgaWYgKGRfY29uZmlnLT5udW1fcGNpZGV2cykgICAgICAg
ICAgICAgICAgICAgICAgICANCj4+Pj4gICAgIGxpYnhsX2RlZmJvb2xfc2V0KCZiX2luZm8tPmFy
Y2hfYXJtLnZwY2ksIHRydWUpOyAgICAgICAgICAgDQo+Pj4+ICNlbmRpZiANCj4gDQo+IEkgdGhp
bmsgdGhpcyBsb2dpYyBwcm9iYWJseSBvdWdodCB0byBiZSBpbiBsaWJ4bCwgbm90IGluIHhsLg0K
DQpJIHdpbGwgbW92ZSB0aGUgY29kZSB0byAibGlieGxfYXJtLmMidG8gYXZvaWQgI2lmZGVmIGlu
IGNvbW1vbiBjb2RlIGFuZCBhbHNvICB0byBhdm9pZCBzZXR0aW5nIHRoZSB2cGNpIGZvciB4ODYN
Cg0KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMgYi90b29scy9saWJz
L2xpZ2h0L2xpYnhsX2FybS5jDQppbmRleCBlMzE0MGE2ZTAwLi4yYmUyMDhiOTliIDEwMDY0NA0K
LS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9hcm0uYw0KKysrIGIvdG9vbHMvbGlicy9saWdo
dC9saWJ4bF9hcm0uYw0KQEAgLTEwMSw2ICsxMDEsMTIgQEAgaW50IGxpYnhsX19hcmNoX2RvbWFp
bl9wcmVwYXJlX2NvbmZpZyhsaWJ4bF9fZ2MgKmdjLA0KICAgICAgICAgcmV0dXJuIEVSUk9SX0ZB
SUw7DQogICAgIH0NCiANCisgICAgLyogRW5hYmxlIFZQQ0kgc3VwcG9ydC4gKi8NCisgICAgaWYg
KGRfY29uZmlnLT5udW1fcGNpZGV2cykgew0KKyAgICAgICAgY29uZmlnLT5mbGFncyB8PSBYRU5f
RE9NQ1RMX0NERl92cGNpOw0KKyAgICAgICAgbGlieGxfZGVmYm9vbF9zZXQoJmRfY29uZmlnLT5i
X2luZm8uYXJjaF9hcm0udnBjaSwgdHJ1ZSk7DQorICAgIH0NCisNCiAgICAgcmV0dXJuIDA7DQog
fQ0KDQo+ICBXZSB0cnkNCj4gdG8gbWFrZSB0aGUgbGlieGwgQVBJICJkbyB0aGUgcmlnaHQgdGhp
bmciIGJ5IGRlZmF1bHQuICBJbiB0aGlzIGNhc2UgSQ0KPiB0aGluayB0aGF0IG1lYW5zIHRvIGVu
YWJsZSBWUENJIChpKSBvbiBwbGF0Zm9ybXMgd2hlcmUgaXQncyBhdmFpbGFibGUNCj4gKGlpKSBp
ZiB0aGUgZ3Vlc3QgaGFzIFBDSSBwYXNzdGhyb3VnaCBkZXZpY2VzLiAgSXMgdGhhdCByaWdodCA/
DQoNClllcyB5b3UgYXJlIHJpZ2h0IFZQQ0kgd2lsbCBiZSBlbmFibGVkIGZvciBndWVzdCB3aGVu
IGd1ZXN0IGhhcyBQQ0kgcGFzc3Rocm91Z2ggZGV2aWNlIA0KYXNzaWduZWQgYW5kIFZQQ0kgc3Vw
cG9ydCBpcyBhdmFpbGFibGUuICANCj4gDQo+IFNvcnJ5IHRvIGFzayB0aGVzZSBxdWVzdGlvbiBu
b3csIGFuZCBwbGVhc2UgZm9yZ2l2ZSBteSBpZ25vcmFuY2U6DQo+IA0KPiBJcyBWUENJIGluaGVy
ZW50bHkgYW4gQVJNLXNwZWNpZmljIEFCSSBvciBwcm90b2NvbCA/DQoNCkFzIG9mIG5vdyBWUENJ
IGZvciBET01VIGd1ZXN0cyBpcyBvbmx5IGltcGxlbWVudGVkICBmb3IgQVJNLg0KIA0KPiAgV2hl
biBtaWdodCBhbg0KPiBhZG1pbiB3YW50IHRvIHR1cm4gaXQgb24gZXhwbGljaXRseSA/DQoNCkl0
IHdpbGwgYmUgZW5hYmxlZCBkeW5hbWljYWxseSB3aGVuIGFkbWluIGFzc2lnbiBhbnkgUENJIGRl
dmljZSB0byBndWVzdC4NCg0KPiANCj4gSG93IGRvZXMgdGhpcyBhbGwgcmVsYXRlIHRvIHRoZSAo
bm9uLWFyY2gtc3BlY2lmaWMpICJwYXNzdGhyb3VnaCINCj4gb3B0aW9uID8NCg0KVlBDSSB3aWxs
IGJlIGVuYWJsZWQgb25seSB3aGVuIHRoZXJlIGlzIGFueSBQQ0kgZGV2aWNlIGFzc2lnbmVkIHRv
IGd1ZXN0IHRoZXJlZm9yZSBJIHVzZWQgDQoiZF9jb25maWctPm51bV9wY2lkZXZz4oCdIHRvIGVu
YWJsZSBWUENJLg0KDQpSZWdhcmRzLA0KUmFodWwNCg0KPiANCj4gSWFuLg0KDQo=

