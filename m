Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8014D98FA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 11:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290724.493151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU4cC-0006Pl-Kx; Tue, 15 Mar 2022 10:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290724.493151; Tue, 15 Mar 2022 10:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU4cC-0006Ni-Hl; Tue, 15 Mar 2022 10:41:20 +0000
Received: by outflank-mailman (input) for mailman id 290724;
 Tue, 15 Mar 2022 10:41:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG/1=T2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nU4cB-0006Na-8g
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 10:41:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 710ef813-a44c-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 11:41:17 +0100 (CET)
Received: from AM6P194CA0056.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::33)
 by VI1PR08MB2672.eurprd08.prod.outlook.com (2603:10a6:802:1c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Tue, 15 Mar
 2022 10:41:13 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::39) by AM6P194CA0056.outlook.office365.com
 (2603:10a6:209:84::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28 via Frontend
 Transport; Tue, 15 Mar 2022 10:41:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Tue, 15 Mar 2022 10:41:12 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Tue, 15 Mar 2022 10:41:12 +0000
Received: from b0a174fb6fab.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 260E6020-10AB-4DBB-AC02-C62AF9C83E0A.1; 
 Tue, 15 Mar 2022 10:41:03 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b0a174fb6fab.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Mar 2022 10:41:03 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com (2603:10a6:803:df::16)
 by AM8PR08MB6468.eurprd08.prod.outlook.com (2603:10a6:20b:360::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Tue, 15 Mar
 2022 10:40:59 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::479:b7f8:ba2a:4a74]) by VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::479:b7f8:ba2a:4a74%5]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 10:40:58 +0000
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
X-Inumbo-ID: 710ef813-a44c-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szTfdxs5M/Msha/s8hkQD54iMpyHA5nPfE70MdCR6yQ=;
 b=aluFm55kuVGGqJ0Rw/5dX+tfR/vG/NtXPB/djS/YBZOFovUu6bVQMMS1l9mdXZkPcBoyVNJEwtEjoAvzw9Q6ZrDup06wX9KGGpP1PMgkba6dZ+/9eyZGFrZoU9+n1XlySawHxgNmvXbSHnrsrcJZvMfpBOWB2qO/ZFH3OGH2YXQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28b81b67bc7919e9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OU7/qBCfuLoKud40tZs1UZWaaxsc3O1clDAELOFv4VrkUDduTxsjjUhtkAb+bUJbb+FjctuIMq1QSUdY9K8RyuusnakPK8f4ORmW8MEDoK/QgmAgn4oSGo2A7f07SQWQ7Qpc9zjhNu7fGqISJnpXLSLyIAPEYckzqnR3NmQwwGB55Gf/oTqRQhy+UIkGKxnPAKfYodI2bLggMNh6YtHuYp9zy//XETMQ9avbqBGMrf+F/RnAOI0pWezSdzyo67zNpc680fPYzpHxomaxa13wzxpP8pQLcOJ2ODh4bNZBvnTaIu5AwftKYf0D8co6fRwUCY4wFSc2Uqo41ugAcqN/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szTfdxs5M/Msha/s8hkQD54iMpyHA5nPfE70MdCR6yQ=;
 b=mIqTtt6sHCHS9r/fgCzt1oZr1D4msHGi5hKVmbPv4tnawtas4XZl2jJ/PjxmEce9IJvOD7IZBL+4GKrTW5SkES1MIs4eUGuiLJZyqQOdz8I7kOqcr6+VKp+leX13shqo6qSbLIuLn6KF9UovEO5iU6RDlebdpP8I4YeNwWFUisIzbYTDUR0woShd48Lrfd1kBv5vvcLBWL92Za2okfLmgk49u0yfWqSbVuFmkqpV0HLq+EJznYGWgMViXT0RoKRe+XsqSZjSh2kwdhIE+4cmYrWMHU3uAQCDUV4TZmpR2us+oHoqHkfgKZwn1ifefE0iKLDFQimtLTqYHcIjubkWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szTfdxs5M/Msha/s8hkQD54iMpyHA5nPfE70MdCR6yQ=;
 b=aluFm55kuVGGqJ0Rw/5dX+tfR/vG/NtXPB/djS/YBZOFovUu6bVQMMS1l9mdXZkPcBoyVNJEwtEjoAvzw9Q6ZrDup06wX9KGGpP1PMgkba6dZ+/9eyZGFrZoU9+n1XlySawHxgNmvXbSHnrsrcJZvMfpBOWB2qO/ZFH3OGH2YXQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [XEN][RFC PATCH v3 11/14] xen/arm: Implement device tree node
 addition functionalities
Thread-Topic: [XEN][RFC PATCH v3 11/14] xen/arm: Implement device tree node
 addition functionalities
Thread-Index: AQHYMyVzdRh4vWYAmEuwX+X13mbNP6zATAOA
Date: Tue, 15 Mar 2022 10:40:57 +0000
Message-ID: <C32F96D8-8602-48EA-B676-645C792642F0@arm.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-12-fnu.vikram@xilinx.com>
In-Reply-To: <20220308194704.14061-12-fnu.vikram@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: be96289a-1a22-4eb7-1e6b-08da0670533b
x-ms-traffictypediagnostic:
	AM8PR08MB6468:EE_|VE1EUR03FT040:EE_|VI1PR08MB2672:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB2672A8FA57C201F1149C1F3EE4109@VI1PR08MB2672.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zKWyLGOVnSfDx+wuoH35kspDSZJWVc8iGXNvkMt7uUeRKEz1yFxW4Zax53sxrr+1cfe1900/rqpsc3CHG3k9pcq3KAyydykBk9+58fkHXqlahq2knykDcasf8Q1SEweh+pBLQVCAu9f+bZmuY3rwfhOaLcibOOo/dwZsUm/AmeuaAMbTspXAZZ/ptqKO7nKX/gIBLhuPrdp13p4IE7XMVXdUgIASuFqUJXt8Gxe32v/Xe+jP/JUamfL/svNEqBvbjc0/XEoudJ3xiWizr7Qh8qbgv7ke+RcMBvjqlxV8IIVPEhWfGTe7twzt48EuyiSH2e2BcrBUTW0j/M7EPyPoEqcRmZJ7ebrdJ2isY3qhctP6QXyDqrWw0ukgGajdOQCBo83TGKJnIhFF5cVNh8lgP6vquIOj2wOMhymWag91QqglWHclWM8LWveCeQimzYFWHqsv3QvSvPfZWAhg8xui39cVUEgmYut3V6io89SAW1Jh2mTbEfPg7XoB10z319GDrbNy83tz+48+Dop4qWneHH2qaBI6QnvyGZLOmJw1WcKgaIJQBcd28rMnilVvOHApgIKUEm+oI25Q/TzVtzG0zjPXCIEx/9VaeCPZNsOlbk+HJ8HppNTgSJHYPFQ8QblbzfDEWrChCCC5JohLLGYSErv8fwAxGCmM5I0H9FQZrtgkbw0tIdkso/tJHbkG+QIQbHpdFCn+Qf2yVQaFmfWz8mebSk5g779l0UhpmrZ5Y2TEEW3XFLpAStjDUyCbD6ae
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3967.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(2616005)(186003)(2906002)(5660300002)(8936002)(6512007)(6506007)(33656002)(36756003)(71200400001)(508600001)(6486002)(83380400001)(38070700005)(86362001)(91956017)(54906003)(76116006)(6916009)(316002)(38100700002)(122000001)(4326008)(8676002)(66946007)(66556008)(66446008)(66476007)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC39EFF40FE22E418E5F8C4C437F8B28@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6468
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	42dd75aa-3547-4cc8-9c98-08da06704a85
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	prC2XO7v2tkd0VtwGAnRnXX9cr93j9VnEvL7EvnCD8ZxylIexbFvtWXrDIUqMpWY/NQNjpaIlVUEdyLCviPvQ2d1e6KiqqzRcHqFMmq0SQMb3udcx7lxbDcYsNnWqH0JRsIw6BOFHuzaroTzDTx+maYNm6zCpURF/UFTJQxRoBj6TIPzwCaTdGgeV+EmBmA2tx9gE6dmXtiHX3sKRJflV/LqgzvMc23t+YfTK1drGzfd/EiyY5FO3es9IIQJHSTyoSrikSiTolmOQ/VAanNHmOclvXE0/HIvncThhYo7tIe3CSgJg406g2YYVzEJsrjy9yWpDBTJrClXFxD7HupKaHLm1rRJ7qqXyhE0aZ1ASrrk2S12k25e+utaCZls5t4pv6GuIvG3WZCe8jDTf9svPGkm7ZNaaMzcv1GxFl4wsDN55xRtcDWC4mRmIDxICL0Yqz6WDzIzTy2IgkuhUZRXXfrL11LFQpkR1Ske0OFC77NiFIR9fv1AqkXgCVk46NZpuiQSI0ZG9qpZYSR5U1ph4Nlq09Gb4uHAxJ4Fvps+jCy7mRLLe/EOnfF4lVJL30ptm/GIKa0LeoN8h0oq7+3M8F04dQaMeeGLlevLvyXX4OSGGQpV3+h3tIooep6LPeNC5Ehzj7IPzxH05t2K6HerWKs4jRoYNeuWWQoGzULiU8v5omkrqjU06Ze3I2tJDb+q
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(83380400001)(356005)(336012)(81166007)(26005)(186003)(2906002)(6862004)(36756003)(5660300002)(8936002)(33656002)(4326008)(8676002)(70206006)(70586007)(6486002)(82310400004)(86362001)(6512007)(316002)(40460700003)(2616005)(47076005)(36860700001)(508600001)(6506007)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 10:41:12.7739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be96289a-1a22-4eb7-1e6b-08da0670533b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672

DQo+IA0KPiArc3RhdGljIGludCBkdF9vdmVybGF5X2FkZF9ub2RlKHN0cnVjdCBkdF9kZXZpY2Vf
bm9kZSAqZGV2aWNlX25vZGUsDQo+ICsgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwYXJl
bnRfbm9kZV9wYXRoKQ0KDQpDb25zdCBzaG91bGQgYmUgaW5kZW50ZWQgYXQgdGhlIHNhbWUgbGV2
ZWwgb2Ygc3RydWN0DQoNCj4gKy8qDQo+ICsgKiBBZGRzIGRldmljZSB0cmVlIG5vZGVzIHVuZGVy
IHRhcmdldCBub2RlLg0KPiArICogV2UgdXNlIGR0X2hvc3RfbmV3IHRvIHVuZmxhdHRlbiB0aGUg
dXBkYXRlZCBkZXZpY2VfdHJlZV9mbGF0dGVuZWQuIFRoaXMgaXMNCj4gKyAqIGRvbmUgdG8gYXZv
aWQgdGhlIHJlbW92YWwgb2YgZGV2aWNlX3RyZWUgZ2VuZXJhdGlvbiwgaW9tZW0gcmVnaW9ucyBt
YXBwaW5nIHRvDQo+ICsgKiBoYXJkd2FyZSBkb21haW4gZG9uZSBieSBoYW5kbGVfbm9kZSgpLg0K
PiArICovDQo+ICtzdGF0aWMgbG9uZyBoYW5kbGVfYWRkX292ZXJsYXlfbm9kZXModm9pZCAqb3Zl
cmxheV9mZHQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMy
X3Qgb3ZlcmxheV9mZHRfc2l6ZSkNCj4gK3sNCj4gKyAgICBpbnQgcmMgPSAwOw0KPiArICAgIHN0
cnVjdCBkdF9kZXZpY2Vfbm9kZSAqb3ZlcmxheV9ub2RlOw0KPiArICAgIGNoYXIgKipub2Rlc19m
dWxsX3BhdGggPSBOVUxMOw0KPiArICAgIGludCAqKm5vZGVzX2lycSA9IE5VTEw7DQo+ICsgICAg
aW50ICpub2RlX251bV9pcnEgPSBOVUxMOw0KPiArICAgIHZvaWQgKmZkdCA9IE5VTEw7DQo+ICsg
ICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpkdF9ob3N0X25ldyA9IE5VTEw7DQo+ICsgICAgc3Ry
dWN0IGRvbWFpbiAqZCA9IGhhcmR3YXJlX2RvbWFpbjsNCj4gKyAgICBzdHJ1Y3Qgb3ZlcmxheV90
cmFjayAqdHIgPSBOVUxMOw0KPiArICAgIHVuc2lnbmVkIGludCBuYWRkcjsNCj4gKyAgICB1bnNp
Z25lZCBpbnQgbnVtX2lycTsNCj4gKyAgICB1bnNpZ25lZCBpbnQgaSwgaiwgazsNCj4gKyAgICB1
bnNpZ25lZCBpbnQgbnVtX292ZXJsYXlfbm9kZXM7DQoNCkFsbCB1bnNpZ25lZCBpbnQgY2FuIHN0
YXkgaW4gdGhlIHNhbWUgbGluZQ0KDQo+ICsgICAgdTY0IGFkZHIsIHNpemU7DQo+ICsNCj4gKyAg
ICBmZHQgPSB4bWFsbG9jX2J5dGVzKGZkdF90b3RhbHNpemUoZGV2aWNlX3RyZWVfZmxhdHRlbmVk
KSk7DQo+ICsgICAgaWYgKCBmZHQgPT0gTlVMTCApDQo+ICsgICAgICAgIHJldHVybiAtRU5PTUVN
Ow0KPiArDQo+ICsgICAgbnVtX292ZXJsYXlfbm9kZXMgPSBvdmVybGF5X25vZGVfY291bnQob3Zl
cmxheV9mZHQpOw0KPiArICAgIGlmICggbnVtX292ZXJsYXlfbm9kZXMgPT0gMCApDQo+ICsgICAg
ew0KPiArICAgICAgICB4ZnJlZShmZHQpOw0KPiArICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4g
KyAgICB9DQo+ICsNCj4gKyAgICBzcGluX2xvY2soJm92ZXJsYXlfbG9jayk7DQo+ICsNCj4gKyAg
ICBtZW1jcHkoZmR0LCBkZXZpY2VfdHJlZV9mbGF0dGVuZWQsIGZkdF90b3RhbHNpemUoZGV2aWNl
X3RyZWVfZmxhdHRlbmVkKSk7DQo+ICsNCj4gKyAgICByYyA9IGNoZWNrX292ZXJsYXlfZmR0KG92
ZXJsYXlfZmR0LCBvdmVybGF5X2ZkdF9zaXplKTsNCj4gKyAgICBpZiAoIHJjICkNCj4gKyAgICB7
DQo+ICsgICAgICAgIHhmcmVlKGZkdCk7DQo+ICsgICAgICAgIHJldHVybiByYzsNCj4gKyAgICB9
DQo+ICsNCj4gKyAgICAvKg0KPiArICAgICAqIG92ZXJsYXlfZ2V0X25vZGVzX2luZm8gaXMgY2Fs
bGVkIHRvIGdldCB0aGUgbm9kZSBpbmZvcm1hdGlvbiBmcm9tIGR0Ym8uDQo+ICsgICAgICogVGhp
cyBpcyBkb25lIGJlZm9yZSBmZHRfb3ZlcmxheV9hcHBseSgpIGJlY2F1c2UgdGhlIG92ZXJsYXkg
YXBwbHkgd2lsbA0KPiArICAgICAqIGVyYXNlIHRoZSBtYWdpYyBvZiBvdmVybGF5X2ZkdC4NCj4g
KyAgICAgKi8NCj4gKyAgICByYyA9IG92ZXJsYXlfZ2V0X25vZGVzX2luZm8ob3ZlcmxheV9mZHQs
ICZub2Rlc19mdWxsX3BhdGgsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG51
bV9vdmVybGF5X25vZGVzKTsNCj4gKyAgICBpZiAoIHJjICkNCj4gKyAgICB7DQo+ICsgICAgICAg
IHByaW50ayhYRU5MT0dfRVJSICJHZXR0aW5nIG5vZGVzIGluZm9ybWF0aW9uIGZhaWxlZCB3aXRo
IGVycm9yICVkXG4iLA0KPiArICAgICAgICAgICAgICAgcmMpOw0KPiArICAgICAgICBnb3RvIGVy
cjsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICBub2Rlc19pcnEgPSB4bWFsbG9jX2J5dGVzKG51bV9v
dmVybGF5X25vZGVzICogc2l6ZW9mKGludCAqKSk7DQoNCllvdSBjYW4gdXNlIHh6YWxsb2NfYnl0
ZXMgYW5kIHJlbW92ZSB0aGUgbWVtc2V0IGJlbG93IGhlcmUgYW5kLi4uDQoNCj4gKw0KPiArICAg
IGlmICggbm9kZXNfaXJxID09IE5VTEwgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgcmMgPSAtRU5P
TUVNOw0KPiArICAgICAgICBnb3RvIGVycjsNCj4gKyAgICB9DQo+ICsgICAgbWVtc2V0KG5vZGVz
X2lycSwgMHgwLCBudW1fb3ZlcmxheV9ub2RlcyAqIHNpemVvZihpbnQgKikpOw0KPiArDQo+ICsg
ICAgbm9kZV9udW1faXJxID0geG1hbGxvY19ieXRlcyhudW1fb3ZlcmxheV9ub2RlcyAqIHNpemVv
ZihpbnQpKTsNCg0KSGVyZQ0KDQo+ICsgICAgaWYgKCBub2RlX251bV9pcnEgPT0gTlVMTCApDQo+
ICsgICAgew0KPiArICAgICAgICByYyA9IC1FTk9NRU07DQo+ICsgICAgICAgIGdvdG8gZXJyOw0K
PiArICAgIH0NCj4gKyAgICBtZW1zZXQobm9kZV9udW1faXJxLCAweDAsIG51bV9vdmVybGF5X25v
ZGVzICogc2l6ZW9mKGludCkpOw0KPiArDQo+ICsgICAgcmMgPSBmZHRfb3ZlcmxheV9hcHBseShm
ZHQsIG92ZXJsYXlfZmR0KTsNCj4gKyAgICBpZiAoIHJjICkNCj4gKyAgICB7DQo+ICsgICAgICAg
IHByaW50ayhYRU5MT0dfRVJSICJBZGRpbmcgb3ZlcmxheSBub2RlIGZhaWxlZCB3aXRoIGVycm9y
ICVkXG4iLCByYyk7DQo+ICsgICAgICAgIGdvdG8gZXJyOw0KPiArICAgIH0NCj4gKw0KPiArICAg
W+KApl0NCj4gK2VycjoNCj4gKyAgICBzcGluX3VubG9jaygmb3ZlcmxheV9sb2NrKTsNCj4gKw0K
PiArICAgIHhmcmVlKGR0X2hvc3RfbmV3KTsNCj4gKyAgICB4ZnJlZShmZHQpOw0KPiArDQo+ICsg
ICAgaWYgKCBub2Rlc19mdWxsX3BhdGggIT0gTlVMTCApDQo+ICsgICAgew0KPiArICAgICAgICBm
b3IgKCBpID0gMDsgaSA8IG51bV9vdmVybGF5X25vZGVzICYmIG5vZGVzX2Z1bGxfcGF0aFtpXSAh
PSBOVUxMOyBpKysgKQ0KPiArICAgICAgICB7DQo+ICsgICAgICAgICAgICB4ZnJlZShub2Rlc19m
dWxsX3BhdGhbaV0pOw0KPiArICAgICAgICB9DQo+ICsgICAgICAgIHhmcmVlKG5vZGVzX2Z1bGxf
cGF0aCk7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgaWYgKCBub2Rlc19pcnEgIT0gTlVMTCApDQo+
ICsgICAgew0KPiArICAgICAgICBmb3IgKCBpID0gMDsgaSA8IG51bV9vdmVybGF5X25vZGVzICYm
IG5vZGVzX2lycVtpXSAhPSBOVUxMOyBpKysgKQ0KPiArICAgICAgICB7DQo+ICsgICAgICAgICAg
ICB4ZnJlZShub2Rlc19pcnFbaV0pOw0KPiArICAgICAgICB9DQo+ICsgICAgICAgIHhmcmVlKG5v
ZGVzX2lycSk7DQo+ICsgICAgfQ0KDQpJIHNlZSB5b3UgdXNlIHRoaXMgb3BlcmF0aW9uIHF1aXRl
IGEgYml0IGluIHRoaXMgbW9kdWxlLCBwZXJoYXBzIHlvdSBjYW4gY3JlYXRlIGEgZnVuY3Rpb24g
dG8NCmRvIHRoYXQNCg0K

