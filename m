Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CDC5100F9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 16:52:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314004.531854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njMYI-0006Cd-1X; Tue, 26 Apr 2022 14:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314004.531854; Tue, 26 Apr 2022 14:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njMYH-00069n-Tu; Tue, 26 Apr 2022 14:52:29 +0000
Received: by outflank-mailman (input) for mailman id 314004;
 Tue, 26 Apr 2022 14:52:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vuZH=VE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1njMYG-00069h-9j
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 14:52:28 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe08::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ad96b47-c570-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 16:52:23 +0200 (CEST)
Received: from AS9PR06CA0290.eurprd06.prod.outlook.com (2603:10a6:20b:45a::8)
 by DB6PR0801MB1943.eurprd08.prod.outlook.com (2603:10a6:4:74::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 14:52:25 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::fc) by AS9PR06CA0290.outlook.office365.com
 (2603:10a6:20b:45a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Tue, 26 Apr 2022 14:52:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 14:52:24 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Tue, 26 Apr 2022 14:52:23 +0000
Received: from ac1be0867598.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 556E669F-F083-49C6-A3B8-7631CD5D9CE1.1; 
 Tue, 26 Apr 2022 14:52:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac1be0867598.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Apr 2022 14:52:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7424.eurprd08.prod.outlook.com (2603:10a6:10:36f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 14:52:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 14:52:16 +0000
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
X-Inumbo-ID: 7ad96b47-c570-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xychuhd/drgQfE8IV6MMGuwhLrsZ1KRNAdZ4b7LeQUs=;
 b=lfqic7eNpdrC1m4voZIcTFznlPZxcqc2IXVT0l5NicQB1H91dy+GpnokMV+XbZz92xGD7XvVHfBlE0QR/mw+HShJn6siV2n+2zZpE9c2sna8xFviXCFieHhbUol06hS5C3aVdhpk0XGJ9Y5aEEcggP0TxsXmC6amT23YvxXvEKo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8302540c7c34612
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSZhzj73L1LiOPnmmqUxPkD4qiTQU3boAH7leeVA2IwQQ5XJebMdEpIldMzwYCt7XqdKq9NehZKNhreomLxC6zHbSRf3bQ2/fXkpkC8BdxUlFFS627HIaOCVMxfDOBmdC/d45HTkeSUZS2XOvukZD8QkN1qurtTetQVaaL2BFMK0gunaCeA+Fah4+eLsDIUuf5XdnEirhVyAR7HFe0rwqQFX5Qr4JHC8ZtkPzbt4Dr2Cl2Cv3RW/+gDPontT0HKf18zgOjUBcs+oLefjEib9Y0EF8mGlCHKlg/vzWMsITSmA7NhgfNhPlOj2+KiKxJbDamYjv5zc1NGVM1BOuW5K8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xychuhd/drgQfE8IV6MMGuwhLrsZ1KRNAdZ4b7LeQUs=;
 b=YCgQ9KiuU/1KvP/JA+gaha585e/5WdnVrQEaYP3E9M5fV6+pN7Io+fdYxUGeACcnoBSMaJHOBU+lFWLEfEWpY3wQjC157zmdDfRt/Po80+y6vtBsv0+s2O4fQfdwLqpjYamS7X4EvYXumzmtMtv0ygQCSngJ9wNS0JYH/G3yiPuwWDF4Hyj+NgFFWaBZAEw+ru6sqwmTRV1xkDYtcQl2wndr1Hh5yzqQqo11en7syIW6aijRuIcJTgOIKm3F852OSsxhUgRC9jTKrjdhKGdYDebQlmfDxvB83jUmawHvpNlbi3ZhxVpGKjgd0C4edA+hPQyurJu2ETkC+6xQo9RMEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xychuhd/drgQfE8IV6MMGuwhLrsZ1KRNAdZ4b7LeQUs=;
 b=lfqic7eNpdrC1m4voZIcTFznlPZxcqc2IXVT0l5NicQB1H91dy+GpnokMV+XbZz92xGD7XvVHfBlE0QR/mw+HShJn6siV2n+2zZpE9c2sna8xFviXCFieHhbUol06hS5C3aVdhpk0XGJ9Y5aEEcggP0TxsXmC6amT23YvxXvEKo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH RFC] EFI: strip xen.efi when putting it on the EFI
 partition
Thread-Topic: [PATCH RFC] EFI: strip xen.efi when putting it on the EFI
 partition
Thread-Index: AQHYWJHILrDj2EEGDUWtEVYmIvMHMK0CII4AgAAczYCAAAvxgA==
Date: Tue, 26 Apr 2022 14:52:16 +0000
Message-ID: <9B9C6B2C-9E2A-4F8D-8C7D-951E6166A892@arm.com>
References: <394c1b94-beaf-bdcb-c333-65dd9987be54@suse.com>
 <DFF300CA-944E-47D9-9674-6858790D45C2@arm.com>
 <07281533-7967-bf67-d68c-3ce1bd5de157@suse.com>
In-Reply-To: <07281533-7967-bf67-d68c-3ce1bd5de157@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a84f447a-91e0-4aae-424a-08da27945fe5
x-ms-traffictypediagnostic:
	DB9PR08MB7424:EE_|VE1EUR03FT010:EE_|DB6PR0801MB1943:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB19439CAD7EB213BF51C867489DFB9@DB6PR0801MB1943.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fEaxlqkO6JC3AJMmOEMcGaMuO0XSfZX/KpFN/qZsgvMMfQokcRdrLsNso1AAhv/EnbPaXMoaU2E/PTpgQ7ogzJZZTCCjA43/KxKEdO7Jw/clYoSwTDxWoLF3ttREgpQ+k+02sWrO5kWpprXK8nKkIoytivUT4QcfwZRBD0AhsZHr2O2i4HW0aSOkCO/RX3vC2kkI83vqeWiGfujPpYfpXi1xOZ1/NIy0qxJuoQFx4HkcXjaVLzahkcTpgJ30qFEe7xxJZ41nKryJ9XynusYEAeIBZaIG5rvepV/2+XWOb+CDekkocL5tsNb0qQiS/GBZF8B5XkbiputeGPKpSSS5UUvt8OeL9OAU3SPxBHiDjeLUp4aiyeRtFEFM4BigmjBEuFktrVQQqoJsbrpXO2ZklqsP3KnfQMkR0VsPoqkkuk283QjKfMTM+r4ieiznRI9VD/LaIj1bCrLQS/AyzY7G7Q5F00pK7nPUjAvzxZ/QxnLyW2Aav41ZVxapRQsHQG8jmL6Ry/taJ6E/umLxSJAcQSN4i2TrzSFFOy20JWCQycn9Wf1MlrVrrR1pl8bbNcDSERm4xEqjcKspahhLSl1+gAQUgOoyJ4tHB8rom2OuhZ3T9qgy9dWHicKmlXOoYcNtvsL4Vn7nJAcb8WmR4g0EZLpBUjIZlQ7g4AKgQXVCktwxQ+a/sXaXLEvpB9p67e5hnEB/a5prssofNfHPH227117l9MjLJJX7uHQyrHYtg/Jqb9YwjY4MAoty0czsR+VD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(316002)(6512007)(26005)(8936002)(86362001)(5660300002)(66446008)(33656002)(186003)(53546011)(6506007)(2616005)(36756003)(64756008)(38100700002)(2906002)(122000001)(508600001)(38070700005)(6486002)(71200400001)(66556008)(4326008)(8676002)(66476007)(66946007)(91956017)(76116006)(54906003)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D595F9A2481E3243B38594C795C488B2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7424
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2f1f1007-3e67-4b0b-47a8-08da27945b20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QjgugFWTFiPvP5j0FojpsBaJAIu/ZNLdzj4oNMAceMbgmsr4qmft7N2KBzYuLhgQgTWG003u2F24Kahp5H3c3+c71raRA5Ddc8lb5lzpGK8aiJ+0+c0IuCzGC/mq3n70MsD6R7f7F6ee1DgL0/WjVUhPoTuRNBG8cFRV7s4rTCPj3kF5TfXtkEjv4DzrfA4zKFm67+X9f22/sqVIG2FgYUwVaZDg0Fz++SzTCdWij7j6A4xg2Ngh95M7KB5GjQPzuYsyEWIs8LQAPnuMMjEBqMc+eKACzm9YvU6d4C95pp+revzEtv0XjYd3jWIjIU/GN+yNzeUjAZ1bXpon3oFEMDzs7jHWkJqe6MbJkhfR3lReOQ6AiXnbJJEOZW8RJ8sOyMBcPiKODDlN6bm7k4DU/x+Hh7cN3ofn++wfk1M7Fg6o6bTXbphMBEk/ta/xgn+BtnbJpW8bu3Sy9IcbemR8m/43PKIBQTvXScLF6gf0G3flG5N4AOgZuArDJ760Hzkdmi+YPKTMeqNcj9+Q2nLNBVEk9keA89Ygm5teLUHS5qFXsoshGcJsySNcw4aufhlZpMnDmqIpkhRqDsWjsH1T0C/DoCX9HxJrBtgkTIg00d5RZi0/fQ/OWS4baXzwdtgvbOjCufd1YLL1vD2EGzz5bUY4t3GryiHiB2FiMWqjAQ6ap2mOrMaaG63fkXMGmc4A
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(356005)(2906002)(53546011)(70586007)(70206006)(81166007)(82310400005)(33656002)(54906003)(36860700001)(6506007)(4326008)(6512007)(6862004)(8676002)(26005)(86362001)(40460700003)(8936002)(47076005)(508600001)(186003)(5660300002)(336012)(316002)(83380400001)(2616005)(6486002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 14:52:24.2443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a84f447a-91e0-4aae-424a-08da27945fe5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1943

SGkgSmFuLA0KDQo+IE9uIDI2IEFwciAyMDIyLCBhdCAxNTowOSwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDI2LjA0LjIwMjIgMTQ6MjYsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKYW4sDQo+PiANCj4+PiBPbiAyNSBBcHIgMjAyMiwgYXQg
MTE6NDYsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4g
V2l0aCBkZWJ1ZyBpbmZvIHJldGFpbmVkLCB4ZW4uZWZpIGNhbiBiZSBxdWl0ZSBsYXJnZS4gVW5s
aWtlIGZvciB4ZW4uZ3oNCj4+PiB0aGVyZSdzIG5vIGludGVybWVkaWF0ZSBzdGVwIChta2VsZjMy
IHRoZXJlKSBpbnZvbHZlZCB3aGljaCB3b3VsZCBzdHJpcA0KPj4+IGRlYnVnIGluZm8ga2luZCBv
ZiBhcyBhIHNpZGUgZWZmZWN0LiBXaGlsZSB0aGUgaW5zdGFsbGluZyBvZiB4ZW4uZWZpIG9uDQo+
Pj4gdGhlIEVGSSBwYXJ0aXRpb24gaXMgYW4gb3B0aW9uYWwgc3RlcCAoaW50ZW5kZWQgdG8gYmUg
YSBjb3VydGVzeSB0byB0aGUNCj4+PiBkZXZlbG9wZXIpLCBhZGp1c3QgaXQgYWxzbyBmb3IgdGhl
IHB1cnBvc2Ugb2YgZG9jdW1lbnRpbmcgd2hhdCBkaXN0cm9zDQo+Pj4gd291bGQgYmUgZXhwZWN0
ZWQgdG8gZG8gZHVyaW5nIGJvb3QgbG9hZGVyIGNvbmZpZ3VyYXRpb24gKHdoaWNoIGlzIHdoYXQN
Cj4+PiB3b3VsZCBub3JtYWxseSBwdXQgeGVuLmVmaSBpbnRvIHRoZSBFRkkgcGFydGl0aW9uKS4N
Cj4+PiANCj4+PiBNb2RlbCB0aGUgY29udHJvbCBvdmVyIHN0cmlwcGluZyBhZnRlciBMaW51eCdl
cyBtb2R1bGUgaW5zdGFsbGF0aW9uLA0KPj4+IGV4Y2VwdCB0aGF0IHRoZSBzdHJpcHBlZCBleGVj
dXRhYmxlIGlzIGNvbnN0cnVjdGVkIGluIHRoZSBidWlsZCBhcmVhDQo+Pj4gaW5zdGVhZCBvZiBp
biB0aGUgZGVzdGluYXRpb24gbG9jYXRpb24uIFRoaXMgaXMgdG8gY29uc2VydmUgb24gc3BhY2UN
Cj4+PiB1c2VkIHRoZXJlIC0gRUZJIHBhcnRpdGlvbnMgdGVuZCB0byBiZSBvbmx5IGEgZmV3IGh1
bmRyZWQgTWIgaW4gc2l6ZS4NCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+Pj4gLS0tDQo+Pj4gUkZDOiBHTlUgc3RyaXAgMi4zOCBhcHBl
YXJzIHRvIGhhdmUgaXNzdWVzIHdoZW4gYWN0aW5nIG9uIGEgUEUgYmluYXJ5Og0KPj4+IC0gdGhl
IG5ldyBmaWxlIHBvc2l0aW9ucyBvZiB0aGUgc2VjdGlvbnMgZG8gbm90IHJlc3BlY3QgdGhlIGZp
bGUNCj4+PiBhbGlnbm1lbnQgc3BlY2lmaWVkIGJ5IHRoZSBoZWFkZXIgKGEgcmVzdWx0aW5nIGxv
b2tzIHRvIHdvcmsgb24NCj4+PiBvbmUgRUZJIGltcGxlbWVudGF0aW9uIHdoZXJlIEkgZGlkIGFj
dHVhbGx5IHRyeSBpdCwgYnV0IEkgZG9uJ3QNCj4+PiB0aGluayB3ZSBjYW4gcmVseSBvbiB0aGF0
KSwNCj4+PiAtIGZpbGUgbmFtZSBzeW1ib2xzIGFyZSBhbHNvIHN0cmlwcGVkOyB3aGlsZSB0aGVy
ZSBpcyBhIHNlcGFyYXRlDQo+Pj4gLS1rZWVwLWZpbGUtc3ltYm9scyBvcHRpb24gKHdoaWNoIEkg
d291bGQgaGF2ZSB0aG91Z2h0IHRvIGJlIG9uDQo+Pj4gYnkgZGVmYXVsdCBhbnl3YXkpLCBpdHMg
dXNlIG1ha2VzIG5vIGRpZmZlcmVuY2UuDQo+Pj4gT2xkZXIgR05VIHN0cmlwIChvYnNlcnZlZCB3
aXRoIDIuMzUuMSkgZG9lc24ndCB3b3JrIGF0IGFsbCAoIkRhdGENCj4+PiBEaXJlY3Rvcnkgc2l6
ZSAoMWMpIGV4Y2VlZHMgc3BhY2UgbGVmdCBpbiBzZWN0aW9uICg4KSIpLg0KPj4+IA0KPj4+IC0t
LSBhL3hlbi9NYWtlZmlsZQ0KPj4+ICsrKyBiL3hlbi9NYWtlZmlsZQ0KPj4+IEBAIC00NjEsNiAr
NDYxLDIyIEBAIGVuZGlmDQo+Pj4gLlBIT05ZOiBfYnVpbGQNCj4+PiBfYnVpbGQ6ICQoVEFSR0VU
KSQoQ09ORklHX1hFTl9JTlNUQUxMX1NVRkZJWCkNCj4+PiANCj4+PiArIyBTdHJpcA0KPj4+ICsj
DQo+Pj4gKyMgSU5TVEFMTF9FRklfU1RSSVAsIGlmIGRlZmluZWQsIHdpbGwgY2F1c2UgeGVuLmVm
aSB0byBiZSBzdHJpcHBlZCBiZWZvcmUgaXQNCj4+PiArIyBpcyBpbnN0YWxsZWQuIElmIElOU1RB
TExfRUZJX1NUUklQIGlzICcxJywgdGhlbiB0aGUgZGVmYXVsdCBvcHRpb24NCj4+PiArIyAtLXN0
cmlwLWRlYnVnIHdpbGwgYmUgdXNlZC4gT3RoZXJ3aXNlLCBJTlNUQUxMX0VGSV9TVFJJUCB2YWx1
ZSB3aWxsIGJlIHVzZWQNCj4+PiArIyBhcyB0aGUgb3B0aW9uKHMpIHRvIHRoZSBzdHJpcCBjb21t
YW5kLg0KPj4+ICtpZmRlZiBJTlNUQUxMX0VGSV9TVFJJUA0KPj4+ICsNCj4+PiAraWZlcSAoJChJ
TlNUQUxMX0VGSV9TVFJJUCksMSkNCj4+PiArZWZpLXN0cmlwLW9wdCA6PSAtLXN0cmlwLWRlYnVn
DQo+Pj4gK2Vsc2UNCj4+PiArZWZpLXN0cmlwLW9wdCA6PSAkKElOU1RBTExfRUZJX1NUUklQKQ0K
Pj4+ICtlbmRpZg0KPj4+ICsNCj4+PiArZW5kaWYNCj4+IA0KPj4gVGhpcyBkb2VzIHNvdW5kIHZl
cnkgY29tcGxleCBhbmQgdXNpbmcgY29tYmluYXRpb24gb2YgaWZkZWYgYW5kIGlmZXEgb24gYW4g
ZXh0ZXJuYWwgdmFyaWFibGUgaXMgbm90IGRvbmUgYW55d2hlcmUgZWxzZS4NCj4+IA0KPj4gSG93
IGFib3V0IHNwbGl0dGluZyBpbnRvIGEgdmFyaWFibGUgdG8gdHVybiBzdHJpcCBvbiBvciBvZmYg
YW5kIGxldCB0aGUgdXNlciBvdmVycmlkZSBhIGxvY2FsIHZhcmlhYmxlIHNldHRpbmcgdXAgdGhl
IHN0cmlwIG9wdGlvbnMgaWYgaGUgd2FudHMgdG8gPw0KPj4gDQo+PiBTb21ldGhpbmcgbGlrZToN
Cj4+IA0KPj4gRUZJX1NUUklQX09QVElPTiA/PSAi4oCUc3RyaXAtZGVidWciDQo+PiANCj4+IEFu
ZCB0aGVuIGp1c3QgdXNpbmcgSU5TVEFMTF9FRklfU1RSSVAgdG8gc3RyaXAgb3Igbm90IGR1cmlu
ZyB0aGUgX2luc3RhbGwgcGhhc2UgDQo+IA0KPiBUaGlzICJqdXN0IHVzaW5nIElOU1RBTExfRUZJ
X1NUUklQIiBpcyB3aGF0IHdlIGhhdmUgd2l0aCB0aGUgcHJlc2VudA0KPiB2ZXJzaW9uIGFzIHdl
bGwsIGFuZCBJJ20gbm90IHJlYWxseSBsb29raW5nIGZvcndhcmQgdG8gaGF2ZSB0d28NCj4gc2Vw
YXJhdGUgdmFyaWFibGUgdG8gYWN0IHVwb24uIEl0IHdhcyBmb3IgdGhpcyBwYXJ0aWN1bGFyIHJl
YXNvbiB0aGF0DQo+IEkgdG9vayBMaW51eCdlcyBtb2R1bGUgaW5zdGFsbGF0aW9uIHByb2Nlc3Mg
YXMgYSAidGVtcGxhdGUiLg0KDQpZb3UgbmVlZCAyIHZhcmlhYmxlcyBvbmx5IHdoZW4geW91IHdh
bnQgdG8gY2hhbmdlIHRoZSBkZWZhdWx0IG9wdGlvbi4NCkFueXdheSB1cCB0byB5b3UgYnV0IEkg
dGhpbmsgdGhpcyBpcyBhIGJpdCB1bnVzdWFsIGFuZCB1c2luZyBpZmRlZiBmb3Igbm9uDQppbnRl
cm5hbCB2YXJpYWJsZXMgaXMgbm90IHNvbWV0aGluZyBJIHdvdWxkIGRvLg0KDQo+IA0KPj4gT25l
IHdhbnRpbmcgdG8gdXNlIG5vIHNwZWNpZmljIG9wdGlvbiB3b3VsZCBoYXZlIHRvIHBhc3MgSU5T
VEFMTF9FRklfU1RSSVA9MSBFRklfU1RSSVBfT1BUSU9OPeKAnOKAnSBmb3IgZXhhbXBsZS4NCj4g
DQo+IFRoaXMgcGFydGljdWxhciBleGFtcGxlIHdvdWxkbid0IHN0cmlwIGFueXRoaW5nIGFpdWks
IGFuZCBoZW5jZSB3b3VsZA0KPiBuZWVkbGVzc2x5IHRvdWNoIHRoZSBiaW5hcnkgKGFuZCBwZXJo
YXBzIG1ha2UgY2hhbmdlcyB0byBpdCBqdXN0IGFzIGENCj4gc2lkZSBlZmZlY3Q6IEZvciBleGFt
cGxlIEknbSBvYnNlcnZpbmcgdGhlIHN0cmluZyB0YWJsZSBncm93aW5nLCB3aGljaA0KPiBJIGhh
dmUgeWV0IHRvIGludmVzdGlnYXRlIGluIGJpbnV0aWxzKS4NCg0KVGhlIGV4YW1wbGUgd2FzIG5v
dCBtZWFudCB0byBiZSB1c2VmdWwgYnV0IGp1c3QgdG8gc2hvdyBob3cgYW4gZW1wdHkNCm9wdGlv
biBjb3VsZCBiZSBhY2hpZXZlZCBhcyBvdGhlciB1c2UgY2FzZXMgd2hlcmUgcXVpdGUgb2J2aW91
cy4NCg0KQmVydHJhbmQNCg0KPiANCj4gSmFuDQoNCg==

