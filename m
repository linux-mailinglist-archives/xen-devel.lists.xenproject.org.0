Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670DA428E56
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 15:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206019.361475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvXq-0002RS-3a; Mon, 11 Oct 2021 13:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206019.361475; Mon, 11 Oct 2021 13:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvXp-0002Oy-W7; Mon, 11 Oct 2021 13:40:45 +0000
Received: by outflank-mailman (input) for mailman id 206019;
 Mon, 11 Oct 2021 13:40:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfEM=O7=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mZvXo-0002Os-W1
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 13:40:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::602])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6531b5c7-ea99-4718-8889-4718465a87f8;
 Mon, 11 Oct 2021 13:40:43 +0000 (UTC)
Received: from AS9PR06CA0107.eurprd06.prod.outlook.com (2603:10a6:20b:465::31)
 by VI1PR0802MB2237.eurprd08.prod.outlook.com (2603:10a6:800:9c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 13:40:40 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::73) by AS9PR06CA0107.outlook.office365.com
 (2603:10a6:20b:465::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Mon, 11 Oct 2021 13:40:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 13:40:40 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Mon, 11 Oct 2021 13:40:39 +0000
Received: from 917aac7338e1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F83C889-A021-403F-971B-25FE28202BA1.1; 
 Mon, 11 Oct 2021 13:40:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 917aac7338e1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 13:40:32 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB8PR08MB4185.eurprd08.prod.outlook.com (2603:10a6:10:aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 13:40:30 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 13:40:30 +0000
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
X-Inumbo-ID: 6531b5c7-ea99-4718-8889-4718465a87f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AKBK0dK2e3t5MfB3yBVn+q6e2oQupJVaYfNAHmraag=;
 b=3/5mj07tNMjkZnFbfoRs51TnylxnFUSGFSNkvNWqFC3gzUS4FCVdBp0LEzi3lLTWgjV1nafRxUxkPe/cpCMafqir2XrC9zO8PkM9NE5VPBmh8HHQH/uyHHL2Gn17/LblU7BX9Q4+3LWv1lqEPvcYfHPAlmMkH26brChVT1/2fFY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 389d13e3fc50dd80
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZRj5fxKEAxDiaYYLFkAn2AJCXMrOu5B4pGBfjH2HAeYJxQbw13WehEJqmqowtn6LMKZdX5X6eu5aZK0NuAKlFDBarFfioi0K+HoT/peuyFwf/6GxkJx4xLlbzMilZ3HbU2xsi9Zb93IterEGt0BJwl4vpK4VXKrtiHvyDsCw/S3piMfRH2otNYXinz1OTt4TsDLNxXdwuuDuC0n5crFn5sJBXGaQocQyPVnUcceBmulLUYd5E6EFr09RpKkx7rEXBZJvPcpBLQdKYMfr3N8eY7wfZCM0w6NoTFLMrK0FKvVaWJbCkp8if76TuRoV4K8lO04C2PZu2qe5HYAll+PqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AKBK0dK2e3t5MfB3yBVn+q6e2oQupJVaYfNAHmraag=;
 b=nKQUhubbhGN8XOiP3IxbfJ/ongaZBDb+hnA/CNTwYxIBdrIn9sz2TTd60NBJujw1dIkaxWeCubaxlurfa2ClhCyQf6vsaowMm9x+3+WJBbZ4c01IP4a7R3slRzOlHYZHiEQToDnzW0tLck1WjBy/7a17DcYZ0mACTa5pP1hmO4uR8A9d9NlDRqYi4Pfm4D2TIsP/Siy8icmans7aR6jMgYCe/LsRr2GxN2n4uVER167ia4jRhSFwwEDwpYPsxcInkeFZCKW6szb4jp1Y6rc7PFzDgIl3vA2FVbJKErLGigSRAfN1YfmJiaTKUuY9cLa8Bljg+9j5jHsFEuueCTBVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AKBK0dK2e3t5MfB3yBVn+q6e2oQupJVaYfNAHmraag=;
 b=3/5mj07tNMjkZnFbfoRs51TnylxnFUSGFSNkvNWqFC3gzUS4FCVdBp0LEzi3lLTWgjV1nafRxUxkPe/cpCMafqir2XrC9zO8PkM9NE5VPBmh8HHQH/uyHHL2Gn17/LblU7BX9Q4+3LWv1lqEPvcYfHPAlmMkH26brChVT1/2fFY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Topic: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Index: AQHXutl5d8zkP9bsD0GXT4+5QPGclKvNtfkAgAAGc4CAABOEAIAABXoA
Date: Mon, 11 Oct 2021 13:40:30 +0000
Message-ID: <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
In-Reply-To: <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e849bd45-7d49-46ed-03bc-08d98cbcb6f8
x-ms-traffictypediagnostic: DB8PR08MB4185:|VI1PR0802MB2237:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2237AB2147A8950B272C6A649DB59@VI1PR0802MB2237.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RmX6hL5Ul31NlUQJmBF6OXXsTiVtGBVe155WzxI94pGFueXm/GIIFUFdzlzx7GPkRoRhJ0r6h1jbgnVf48mqNMWnd5Ph4YbOPNThrulUuBRoSqSQItBsCg1ESQEgGgaPSFaDw2gG0jsP11Riu9vAQICzZinTh7zPh4LWhkKaYfYXYaErmcWcIuymabI4bzUz+EGGGHKlvTdzgAZ+Y2zcYjrQaXHW4VUcVB/O0eko7RbJf8IXlzdFRQebSKmtqFBPvlAMVaJdRIaisKJVCd6sdSAZGqOyT0BjUNti8Tn7SY48OgeYKw5hHPENjXFx0qpInCSW5QRgB+hGHYFX1bnvcUmGJB7Nt4dsJFjtMRnE0EyjvXYJta26exWxIdUz8cZxranyp/xVRlqcWKt5B1diNJSqxXjr7m6rcG6MonNUCY4N5tUMAhPPQzO1LP1NALapiqlVCqatM30mdC4dCiooMujYcyR/zh/GfIFh1GlkkQDO4hu5p0fO2hU5eY80BPxsoi3Lzl8UKPVxPJiRwO4H8zu4Sy6yHLvwEoX0MBPejPRNUMqo86Cieb+YXzb7JFiNTck97RjgSoWyo3Hr6N1GAAEIkkxUXgqtKXRKhxUt2d1eeRTr3xEdl74h9XmrF5TmXXN06v/XYoMDdmoGk1nUBg4Zgk0WiF7WkNjZhCtA1RdCoHUng7CMp07dwRUa2cXb660C/27Rtv0MfENAuxSSnA1RfJh4bkJMHmO5O0x46Hx9g1UVj0nqTP/l8yp6CfC2
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(84040400005)(71200400001)(316002)(26005)(38100700002)(5660300002)(2616005)(110136005)(54906003)(4326008)(6512007)(33656002)(2906002)(186003)(66946007)(6506007)(66446008)(64756008)(122000001)(66556008)(66476007)(38070700005)(8676002)(86362001)(8936002)(53546011)(6486002)(76116006)(508600001)(36756003)(83380400001)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <98FB70549B11CC4EB4FD85805D15E0C8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4185
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	922445c7-539e-4d43-d55d-08d98cbcb14b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hLCAd9nIGQPHp7C0kaoFmUzkQAPTdfakj/vqqqdjNa5k/uyveTr826l/jGmhvZ32VWhZ4eNMFao7WVFZ8nqt+ybh3ITed3qB8TNUyJllt7JB0aGmKmHksOUrzoyCQgMvYmv31mQWWkX5g2o9CnjyZ0EJy7Ls6X07NVuCXYjw5H0x53rZkqHf3TqHU3LD0B4hq7CnS73wnjEA0dgzqO+lEgbXSjZ/7RfLN3kB+s//inlwda5Ax3rjT56Vj1Q05Mjy14q96a+OCiUjlo3Z2GxCo6GZ0ia9ayumWM2ZI/Pzh6n/DRmcgyHohT/ZzlIZkBKJ3UYNIU07xEZjBmXTB6jaOHXFAyFBKJki9KvFYK27c+fpB7M+WumceOjyVh7G+A8vrC8xPhZiH9ISl2fQNlxsxzmy5hResRD6hV4zQo4UOoJFVS7N7vtTERrUdtzW8jtYwvCVQp76GpjExpIcunhVSDYdNTuzl/K9EPbH2rsFBO/nn2oEnPIRTAL4PtRwNAEy3igL0VTK3sSr2Zeb4X/9zucCZKgZtD2FLQHF9DBggdUZae8AyOoW08Yx68no3Cl1sTMV2Ui4f6Xais5edbFYHAA1SxsVUgeTujL6GKpnkDDcQ8yY7rlliQBV9b2kZ0EBN4w7VqMTeybyz/V6OOmAs3TAjh8rGyrl9IOUeay9xuQ3nzkfYAGzeMdhh/1GOwpPchWiZ+ZEvNE/xFyaAkMXrw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(84040400005)(36840700001)(46966006)(8676002)(70586007)(356005)(6512007)(81166007)(186003)(26005)(110136005)(54906003)(86362001)(47076005)(336012)(83380400001)(6506007)(36756003)(2906002)(508600001)(2616005)(107886003)(316002)(82310400003)(6486002)(33656002)(36860700001)(70206006)(4326008)(5660300002)(53546011)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 13:40:40.0483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e849bd45-7d49-46ed-03bc-08d98cbcb6f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2237

SGkgUm9nZXIsDQoNCisgT2xla3NhbmRyIHRvIGhhdmUgYSBiZXR0ZXIgUENJIGV4cGVydCB0aGVu
IG1lLg0KDQo+IE9uIDExIE9jdCAyMDIxLCBhdCAxNDoyMCwgUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBPY3QgMTEsIDIwMjEgYXQg
MTI6MTE6MDRQTSArMDAwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+IEhpIFJvZ2VyLA0K
Pj4gDQo+Pj4gT24gMTEgT2N0IDIwMjEsIGF0IDEyOjQ3LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gV2VkLCBPY3QgMDYsIDIwMjEg
YXQgMDY6NDA6MjdQTSArMDEwMCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+IEFSTSBhcmNoaXRl
Y3R1cmUgZG9lcyBub3QgaW1wbGVtZW50IEkvTyBwb3J0cy4gSWdub3JlIHRoaXMgY2FsbCBvbiBB
Uk0NCj4+Pj4gdG8gYXZvaWQgdGhlIG92ZXJoZWFkIG9mIG1ha2luZyBhIGh5cGVyY2FsbCBqdXN0
IGZvciBYZW4gdG8gcmV0dXJuDQo+Pj4+IC1FTk9TWVMuDQo+Pj4gDQo+Pj4gV2hhdCBpcyB0aGUg
Y2FsIHRyYWNlIG9mIHRoaXMgZnVuY3Rpb24gYWN0dWFsbHkgb24gQXJtPw0KPj4+IA0KPj4+IEFG
QUlDVCBsaWJ4bCB3aWxsIG9ubHkgY2FsbCB4Y19kb21haW5faW9wb3J0X3Blcm1pc3Npb24gaWYg
dGhlcmUgYXJlDQo+Pj4gSU8gcG9ydHMgZXhwbGljaXRseSBkZWZpbmVkIGluIHRoZSBndWVzdCBj
b25maWd1cmF0aW9uLCBvciBpZiBhbnkgb2YNCj4+PiB0aGUgQkFScyBvZiB0aGUgUENJIGRldmlj
ZSBpcyBpbiB0aGUgSU8gc3BhY2UsIHdoaWNoIGlzIG5vdCBwb3NzaWJsZQ0KPj4+IG9uIEFybS4N
Cj4+IA0KPj4gUENJIGRldmljZXMgQkFScyBjYW4gYmUgaW4gdGhlIElPIHNwYWNlIGFzIHRoZSBQ
Q0kgZGV2aWNlcyBhcmUgbm90DQo+PiBBcm0gc3BlY2lmaWMuIFRoZXJlIGlzIG5vdCBpb3BvcnRz
IG9uIGFybSBzbyB0byBiZSB1c2VkIHRob3NlIGNhbiBiZQ0KPj4gaW4gc29tZSBjYXNlcyByZW1h
cHBlZCBhbmQgYWNjZXNzZWQgYXMgTU1JT3Mgb3IgYXJlIG5vdCBwb3NzaWJsZQ0KPj4gdG8gdXNl
IGF0IGFsbC4NCj4+IA0KPj4gQnV0IHRoZSBJTyBzcGFjZSBkb2VzIGFwcGVhciB3aGVuIEJBUnMg
YXJlIGxpc3RlZCBldmVuIG9uIEFybS4NCj4gDQo+IFVyZywgSSB3b25kZXIgd2hldGhlciB0aG9z
ZSBkZXZpY2VzIHdpdGggSU8gQkFScyB3aWxsIHdvcmsgY29ycmVjdGx5DQo+IHVuZGVyIEFybSB0
aGVuLg0KPiANCj4gSG93IGRvIHlvdSBrbm93IHdoZXRoZXIgdGhlIEJBUiBoYXMgYmVlbiByZW1h
cHBlZCBmcm9tIElPIHNwYWNlIGludG8NCj4gTU1JTz8NCg0KV2UgY2Fubm90LCBJIHRoaW5rIHRo
ZSBwbGF0Zm9ybSB3aWxsIGRlZmluZSBpZiB0aGlzIGlzIHRoZSBjYXNlIGFuZCB3aGVyZS4NCkBv
bGVrc2FuZHI6IEkgcmVtZW1iZXIgdGhhdCB0aGlzIHdhcyBkaXNjdXNzZWQgZHVyaW5nIHNvbWUg
b2Ygb3VyDQptZWV0aW5ncyBidXQgSSBoYXZlIG5vIGlkZWEgb2YgdGhlIGRldGFpbHMgaGVyZSwg
Y2FuIHlvdSBoZWxwID8NCg0KPiANCj4gSU1PIGluc3RlYWQgb2YgZmFraW5nIGEgc3VjY2Vzc2Z1
bCByZXR1cm4gdmFsdWUgZnJvbQ0KPiB4Y19kb21haW5faW9wb3J0X3Blcm1pc3Npb24gd2Ugc2hv
dWxkIGF2b2lkIHRoZSBjYWxsIGNvbXBsZXRlbHkgaW4gdGhlDQo+IGZpcnN0IHBsYWNlLCBzcGVj
aWFsbHkgaWYgd2UgbmVlZCB0byBpbnN0ZWFkIGlzc3VlIGEgY2FsbCB0bw0KPiB4Y19kb21haW5f
aW9tZW1fcGVybWlzc2lvbi4NCg0KQXQgdGhlIGVuZCB3ZSB3aWxsIG5ldmVyIGhhdmUgdG8gaXNz
dWUgdGhpcyBiZWNhdXNlIHRoaXMgd2lsbCBuZXZlciBiZSBhIG1hdHRlcg0Kb2Yg4oCcaW9tZW3i
gJ0gcGVybWlzc2lvbiBhcyB0aGVyZSB3b3VsZCBub3QgYmUgYW55IHdheSB0byBjdXQgb24gc29t
ZXRoaW5nIHVuZGVyDQp0aGUgcGFnZS4gSWYgdGhpcyBpcyB0byBiZSBzdXBwb3J0ZWQgb25lIGRh
eSwgaXQgd2lsbCBwcm9iYWJseSBoYXZlIHRvIGJlIGZ1bGx5IGVtdWxhdGVkDQp0byBrZWVwIHRo
ZSBpc29sYXRpb24uDQoNClJpZ2h0IG5vdyBvbiBhcm0geW91IGNhbiBqdXN0IG1ha2UgdGhlIG1v
cmUgc2ltcGxlIGFzc3VtcHRpb24gdGhhdCBpb3BvcnRzIGFyZQ0KanVzdCBub3Qgc3VwcG9ydGVk
Lg0KDQpSZWdhcmRzDQpCZXJ0cmFuZA0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQo=

