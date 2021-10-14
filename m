Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B61F42D42D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 09:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209042.365377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mavYR-0001AM-MX; Thu, 14 Oct 2021 07:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209042.365377; Thu, 14 Oct 2021 07:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mavYR-00017q-JA; Thu, 14 Oct 2021 07:53:31 +0000
Received: by outflank-mailman (input) for mailman id 209042;
 Thu, 14 Oct 2021 07:53:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCUr=PC=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mavYP-00017U-Fz
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 07:53:29 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b95ed533-64e9-43ac-9fb3-edc97d29aac3;
 Thu, 14 Oct 2021 07:53:28 +0000 (UTC)
Received: from DB7PR03CA0103.eurprd03.prod.outlook.com (2603:10a6:10:72::44)
 by VI1PR08MB3632.eurprd08.prod.outlook.com (2603:10a6:803:79::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Thu, 14 Oct
 2021 07:53:24 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::fc) by DB7PR03CA0103.outlook.office365.com
 (2603:10a6:10:72::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 07:53:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 07:53:24 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Thu, 14 Oct 2021 07:53:23 +0000
Received: from 75f9ea936d07.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E9E109EE-7488-44BA-AEE2-9E84F1E65DEA.1; 
 Thu, 14 Oct 2021 07:53:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 75f9ea936d07.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Oct 2021 07:53:13 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR08MB2822.eurprd08.prod.outlook.com (2603:10a6:6:1d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 14 Oct
 2021 07:53:09 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.030; Thu, 14 Oct 2021
 07:53:08 +0000
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
X-Inumbo-ID: b95ed533-64e9-43ac-9fb3-edc97d29aac3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3hniK8TgyhjX7ZotJXolx+f+dUXjT+7XaYxcvNbHb8=;
 b=Ku/yMFiBZbQvNcRpcP9x+zXbG07yC/cw/j28V+/D6/FNAf+Xrj7GAyvSa55kcSwcIVZu0mrHggQZKCf+ZiQa5hLEL2HTAt41LUR6AmHkUBm+oKm2fHpGV2zuc5wpm+bJI7NvUqt+aang5ECsejebR6uZYenUMXnIOdgKzqtnFDM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f53ed9ee73b09798
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJZoMH4s6vV/A4CJYHwolLLbBYoNu5I9lcIoAh/XzEdshSFYES1nW1HBoKlUpoIhbgxLwxZKCjKkQS2bfRKYxHExG5OE8KRNRhBVdvT0qVLAHPUlqRCNJWHyHS25sE4boz6Tdf0XguSPpeHieLMXNOxP79nxpx9oeZl/IY+Z514rIS/ciOLOQwH5dLp57XFrrVULwyO0mClDy8u+5NhNMkMzp1tuflfT1WBK1uvS5JxJw/0RAhB/B4OogXH+G5POcGgwNqoPW2iT7P0g1s8OV44UkFZRqggP71JWKntQi9sLUITF3JsZOQ8MIERO58j3eK0bk6psRLRMbrTCcT7YwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3hniK8TgyhjX7ZotJXolx+f+dUXjT+7XaYxcvNbHb8=;
 b=CI+16kZUFJnnwoO8w/DD9QQWXmQ/QEBwrL/plza/Z2jaa9YelEfa/QB1lYfAz7/GmhhL/8B1Hg2DmrI9cb5YWdDbWs5Un/giMYZAjHCPCadKrGHGGT4dkDggewPeNZttcMsjyc4Odw4pBYC2PGgeT6miQ+j3nZU/NO0CtX6NKAur87bYP3EBzGBEoKaB1pwK0FwdKcw5AKXidlrV2/dBQCjIxzzMJkoltf/x1S81+uXgIBNXDysVELhmqyUEN8hm9Fm5XnMUZO7yLTZYZjS6wYg1ldJ/9+8Lq1/BTDbuEo5Z91eDqMjzn/6xWkR6eBTabMPW9hhWYjGUDe9gcKHr0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3hniK8TgyhjX7ZotJXolx+f+dUXjT+7XaYxcvNbHb8=;
 b=Ku/yMFiBZbQvNcRpcP9x+zXbG07yC/cw/j28V+/D6/FNAf+Xrj7GAyvSa55kcSwcIVZu0mrHggQZKCf+ZiQa5hLEL2HTAt41LUR6AmHkUBm+oKm2fHpGV2zuc5wpm+bJI7NvUqt+aang5ECsejebR6uZYenUMXnIOdgKzqtnFDM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<Michal.Orzel@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre
 Przywara <Andre.Przywara@arm.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
Thread-Topic: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
Thread-Index:
 AQHXutmFlM61oLukkkqK7dSQSsVJ1qvNjrkAgAGmMoCAAW6PgIAAEkkAgAAWnQCAABTUgIAADMyAgACBoYCAAKKsAIAAGQ0A
Date: Thu, 14 Oct 2021 07:53:08 +0000
Message-ID: <2E52D99F-7980-483E-A9B7-643C93BE3E2E@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
 <9217a6b8-fc53-a049-7cd3-7458b574424b@arm.com>
 <YWaZKX44IOfIBtX6@MacBook-Air-de-Roger.local>
 <8F9D6B9C-58CB-4000-995A-95517EE72A3B@arm.com>
 <YWa7eGr3D8Ax8VUX@MacBook-Air-de-Roger.local>
 <9C5C0FE2-67EA-4CD7-893B-82C156F5F77A@arm.com>
 <e88892cf-e0c3-c39c-dce8-bfe2d25a5b53@suse.com>
 <alpine.DEB.2.21.2110131113212.9408@sstabellini-ThinkPad-T480s>
 <291330d4-73c4-7893-7735-23c21ba04ccb@suse.com>
In-Reply-To: <291330d4-73c4-7893-7735-23c21ba04ccb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d9f73750-f54d-4022-91ae-08d98ee7b2f2
x-ms-traffictypediagnostic: DB6PR08MB2822:|VI1PR08MB3632:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB36325A50527A322121AAA8E99DB89@VI1PR08MB3632.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zpcJJ0zUMXuwC8JwKAJVYtxxlXswqbQGWeKtp5E1dNOjFANyTVyPVaSitMz9RhztWSA2ODieL4SRm4wF7dQNUOWnSCLFiAYTdERyDx2+Zzq6ktikJR4XKGvTkKv3B1iwOV66oXVcbQYrJ+DO+q35ZpH9bOpJQOoxbGQP1EVi6UbRTnllMJuMl65I+sbNscekLRb57ki4sN62ftyGNWZmKdOCXireFm3Ac6FX4R/SaUYzwbOSjxqFizHodQhMPBkNNWhRINS492fGCjT/7IXUUpTh6JjyIYoZGA7+jWYB+n5gcV91J0WIgXLu4+pUcg/849FCxDaBJlIoAS3bQVXNkhRdFOfaodPr0mOIqtUIYkfQAQG5LSrudb7CFiz2Bp07bB3KJzDwlQgIFYDFxq9jjQg+KSDcOzrznGnPnHtIvQoxC0ETxoKzLFuv4Y09lr2UrcSob1F5R/15blid/v49+AFBPAz0HIOkx8S5iUhTX6WuGXdpZxmkxARltshLnH/1LM/xtOa0ineGdQjoYpCZqXf0LMUVqDh9l6QGycqLzhd/KMIR8APvGFfTxlJI9xgj5VBY8m9Jzxrp1MKOqbemqAp2FZElPMrnRmdmzKuoiPSyl9BIHr6B2SUKjmyZgIoPsqej9k2vgZlFc5aZB48NeUaRqLMYbrg2W4KPNR7M9SjqpD2yuS/2ZdwF7bSwkojGs7uC5NJpkMbQikJxEdVtYHzsow1zri/1ecu4Lt3UTsNcght1LlO9EUsaGNzKvR581CAjLJ3rH+BBEfD2vSGlSteFGix7lGKYOmf7u6SMN1TpWccxq2/xhnd8rltn9BJHXxjgHOU/lwJMGkNzbAsWrNCHFeCNzxATp69UGIAFi7g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(33656002)(2906002)(6512007)(122000001)(71200400001)(86362001)(38100700002)(7416002)(4326008)(186003)(91956017)(64756008)(66446008)(36756003)(66946007)(2616005)(26005)(316002)(54906003)(76116006)(66556008)(66476007)(8676002)(53546011)(6506007)(8936002)(83380400001)(6486002)(38070700005)(6916009)(508600001)(966005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C5F1E288DB03D479308C702D21F6B12@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2822
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5ee88600-fec9-44fe-99c8-08d98ee7a9f4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FlXmOja18m28a00DITXjTNplve98OX0RDE3KvDtPiF1lbplw+8ZDCMViwyM6a0Pr8PikTeGOJGWQPpn5GOKvas7+BTsh9/yN5U6aBBT+Pug5N3stDGUbVyq5FF4sonkM1/SFLagrqlsuz/CeLKMe/T/3IC7eP4r1UhjzIKDj0Clv6/BcB0R+7zoh1L1svphy6va05vLmGKcV+qgvEwv28yzUnq4iClQQErfs1YwXZtoQlMBlpNi0GzFnqxCPUCEIKYKpof6QQ2pdHA6QY7iTSKCQh5DQbWO0cLj8P/GrC3lZiyEQQleemAZxcN6IAB+4iJ5bQY6SoYdI/lTjFn4rxdzvfCno98uaCW6duU/NeNlon9z516vgtk6cSafY69wdxFqHJaUItwKfRiWz8nkgupZSqCoKt1+9QzQKwsQ2+TVyOK/kRkNEcuovdWaUzCw20k7eIfvFRHpJvI6Xci0CGvjN/2zwTRnsL5T0I5En15XTCNmf8AYhd536ou6eVpUK/ON643WrBXXX82AIuSOfIYqeXvmkIPZmMBGnz3pQYmvHyyhXOa3iedjtey+LAe/JCKDeGbPLF/Py01qYZHZf4LcDyeY5OO6PoWgNdCnUqD8EE8BnIFdpOtJdSmTKyJo6HzFL8I/V7vqRlTq+xq9xInhyf81rQDaa+Ii9GQHL0HUfmMv2HfMzudkQITGBf1cxRxq2/ef9gK3A4+JLIz1sBhFmUQ5HQr5glsAlO0MBUqGudqgccT8mQh3c6RXZtoXGY6yhTpEpD33uayJyx7MstmMAzaa5nXk+Y/UgJBbDJJOXOJVEyyAXRjp81pLSBIcp
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(33656002)(53546011)(8676002)(8936002)(6506007)(107886003)(6512007)(186003)(316002)(336012)(36756003)(81166007)(47076005)(6486002)(5660300002)(356005)(70206006)(36860700001)(70586007)(82310400003)(2616005)(2906002)(83380400001)(4326008)(966005)(508600001)(6862004)(86362001)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 07:53:24.0396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f73750-f54d-4022-91ae-08d98ee7b2f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3632

SGksDQoNCj4gT24gMTQgT2N0IDIwMjEsIGF0IDA3OjIzLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTMuMTAuMjAyMSAyMjo0MSwgU3RlZmFubyBTdGFi
ZWxsaW5pIHdyb3RlOg0KPj4gT24gV2VkLCAxMyBPY3QgMjAyMSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4gT24gMTMuMTAuMjAyMSAxNDoxMSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+
IE9uIDEzIE9jdCAyMDIxLCBhdCAxMTo1NiwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOg0KPj4+Pj4gSWYgdlBDSSBmb3IgQXJtIG9uIDQuMTYgaXMgbm90IGdv
aW5nIHRvIGJlIGZ1bmN0aW9uYWwsIHdoeSBzbyBtdWNoDQo+Pj4+PiBwcmVzc3VyZSBpbiBwdXNo
aW5nIHRob3NlIHBhdGNoZXMgc28gZmFzdD8gSSB1bmRlcnN0YW5kIHRoZSBuZWVkIHRvDQo+Pj4+
PiByZW1vdmUgc3R1ZmYgZnJvbSB0aGUgcXVldWUsIGJ1dCBJIGRvbid0IHRoaW5rIGl0J3Mgd29y
dGggdGhlIGNvc3Qgb2YNCj4+Pj4+IGludHJvZHVjaW5nIGEgYnJva2VuIGludGVyZmFjZSBkZWxp
YmVyYXRlbHkgb24gYSByZWxlYXNlLg0KPj4+IA0KPj4+ICsxDQo+Pj4gDQo+Pj4+IFdlIGRpZCBu
b3QgcHVzaCB0aGF0IGZhc3QsIHRob3NlIGhhdmUgYmVlbiBvbiB0aGUgbWFpbGluZyBsaXN0IGZv
ciBhIHdoaWxlICh0aGlzIGlzIHRoZSA1dGggdmVyc2lvbiBvZiB0aGUgc2VyaWUpLg0KPj4+PiBQ
Q0kgcGFzc3Rocm91Z2ggaXMgYSBiaWcgY2hhbmdlIHJlcXVpcmluZyBsb3RzIG9mIHBhdGNoZXMg
YW5kIHdlIGRlY2lkZWQgdG8gcHVzaCBpdCBwaWVjZSBieSBwaWVjZSB0byBtYWtlDQo+Pj4+IHRo
ZSByZXZpZXcgZWFzaWVyLg0KPj4+IA0KPj4+IDUgdmVyc2lvbnMgZm9yIGEgc2VyaWVzIGxpa2Ug
dGhpcyBvbmUgd2FzIHRvIGJlIGV4cGVjdGVkLiBJbW8gaXQgaGFzDQo+Pj4gYmVlbiB3cm9uZyBp
biB0aGUgcGFzdCB0byBydXNoIGluIG5ldyBmZWF0dXJlcyAoZXZlbiBpZiBleHBlcmltZW50YWwN
Cj4+PiBvbmVzKSB2ZXJ5IGNsb3NlIHRvIHRoZSBmcmVlemUsIGFuZCBpdCBoYXMgbWlzbGVhZCBw
ZW9wbGUgdG8gdGhpbmsNCj4+PiB0aGV5IGNhbiBkZWxheSB3b3JrIHVudGlsIHZlcnkgKHRvbz8p
IGxhdGUgYSBwb2ludCBpbiB0aW1lLg0KPj4gDQo+PiANCj4+IEhpIFJvZ2VyLCBKYW4sDQo+PiAN
Cj4+IExldCBtZSB0YWtlIGEgZmV3IG1pbnV0ZXMgdG8gY2xhcmlmeSBhbmQgcHJvdmlkZSBjb250
ZXh0IGZvciB0aGlzIHdvcmsuDQo+PiANCj4+IA0KPj4gSSBkb24ndCB0aGluayBhbnlvbmUgInB1
c2hlZCBoYXJkIiBhbnkgb2YgdGhlIEFSTSBzZXJpZXMgY2xvc2UgdG8gdGhlDQo+PiByZWxlYXNl
LiBJIHNlbnQgIm9uZSIgZW1haWwgaW4gcHVibGljIGFzIGEgcmVtaW5kZXIgb2YgdGhpbmdzIHRo
YXQgbmVlZA0KPj4gcmV2aWV3aW5nOg0KPj4gaHR0cHM6Ly9tYXJjLmluZm8vP2w9eGVuLWRldmVs
Jm09MTYzMzczNzc2NjExMTU0DQo+PiANCj4+IEkgZGlkIHNlbmQgYSBjb3VwbGUgb2YgcHJpdmF0
ZSBlbWFpbHMgdG8gSmFuIGJ1dCB0aGV5IHdlcmUgdG8gc3luY2hyb25pemUNCj4+IG91cnNlbHZl
cyByYXRoZXIgdGhhbiBwdXNoOyBKYW4sIEkgaG9wZSB5b3UgZGlkbid0IHRha2UgdGhlbSB0aGUg
d3JvbmcNCj4+IHdheS4NCj4gDQo+IERlZmluaXRlbHkgbm90LCBubyB3b3JyaWVzLg0KPiANCj4+
IEF0IHRoZSBzYW1lIHRpbWUgaXQgaXMgY2VydGFpbmx5IHRydWUgdGhhdCBhbGwgdGhlIHBlb3Bs
ZSBpbnZvbHZlZCBoZXJlDQo+PiB3b3JrZWQgdmVyeSBoYXJkIHRvIGdldCB0aGVzZSBzZXJpZXMg
cmVhZHkgZm9yIDQuMTYuIE9jdCAxNSBpcyB0aGUgWGVuDQo+PiBQcm9qZWN0IGZlYXR1cmUgZnJl
ZXplLiBJdCBpcyBhbHNvIHRoZSBkZWFkbGluZSBmb3IgbWFueSBvZiB1cyB3b3JraW5nDQo+PiB3
aXRoIHVwc3RyZWFtIFhlbiBQcm9qZWN0IHRvIHVwc3RyZWFtIGZlYXR1cmVzIGFuZCByZXBvcnQg
YmFjayB0byBvdXINCj4+IG1hbmFnZW1lbnQuIEkga25vdyBpdCBkb2Vzbid0IGFmZmVjdCB5b3Ug
Z3V5cyBkaXJlY3RseSwgYnV0IHlvdSBjYW4NCj4+IGltYWdpbmUgdGhhdCBhcyBlbXBsb3llZXMg
b2Ygb3VyIHJlc3BlY3RpdmUgY29tcGFuaWVzIHdlIGZlZWwgcHJlc3N1cmUNCj4+IHRvIGNvbXBs
ZXRlIG91ciBvYmplY3RpdmVzIGluIHRoZSBnaXZlbiB0aW1lZnJhbWUuIE9mIGNvdXJzZSB3ZSBu
ZWVkIHRvDQo+PiBtYWtlIHN1cmUgdG8gZG8gdGhhdCB3aXRob3V0IGNvbXByb21pc2luZyBxdWFs
aXR5IGFuZCB3aXRob3V0DQo+PiBvdmVyZXh0ZW5kaW5nIHVwc3RyZWFtIHJldmlldyBjYXBhY2l0
eS4NCj4+IA0KPj4gDQo+PiBUaGUgQVJNIFBDSSBzZXJpZXMgYXJlIHB1YmxpYyBzaW5jZSBEZWMg
MjAyMCwgcHVzaGVkIHRvIGEgZ2l0bGFiIGJyYW5jaA0KPj4gZm9yIHRlc3Rpbmc6IGh0dHBzOi8v
Z2l0bGFiLmNvbS94ZW4tcHJvamVjdC9mdXNhL3hlbi1pbnRlZ3JhdGlvbi8tL3RyZWUvaW50ZWdy
YXRpb24vcGNpLXBhc3N0aHJvdWdoDQo+PiBJIGhlbHBlZCBjcmVhdGluZywgbWFuYWdpbmcgYW5k
IHRlc3RpbmcgdGhlIGJyYW5jaC4NCj4+IA0KPj4gU28sIEkgY2FuIHNlZSB3aHkgQmVydHJhbmQg
ZmVlbHMgbGlrZSB0aGV5IGhhdmUgYmVlbiBhcm91bmQgZm9yIGEgd2hpbGU6DQo+PiB3ZSBoYXZl
IGJlZW4gZGVhbGluZyB3aXRoIHRoZXNlIHBhdGNoZXMgZm9yIGFsbW9zdCBhIHllYXIsIGV2ZW4g
aWYgZnJvbQ0KPj4gYSB4ZW4tZGV2ZWwgcGVyc3BlY3RpdmUgd2UgYXJlICJvbmx5IiBhdCB2ZXJz
aW9uIDUuDQo+IA0KPiBJJ20gYWZyYWlkIHRoYXQgYW55dGhpbmcgbm90IG9uIHhlbi1kZXZlbCBk
b2Vzbid0IHJlYWxseSBjb3VudDsgdGhlIGxpc3QNCj4gaXMgdGhlIG9ubHkgIm9mZmljaWFsIiBj
aGFubmVsLiBJU1RSIHRoYXQgZm9yIGNlcnRhaW4gYXNwZWN0cyB0aGVyZSdzIGENCj4gcGxhbiBH
ZW9yZ2UgaGFzIHRvIG1ha2UgdGhpcyBtb3JlIHByb25vdW5jZWQgLyBmb3JtYWwgaW4gc29tZSBv
ZiB0aGUgZG9jcw0KPiB3ZSBoYXZlLg0KPiANCj4gTWFraW5nIGludGVybmFsbHkgc2V0IGRlYWRs
aW5lcyBpcyBhIGZ1bGx5IHVuZGVyc3RhbmRhYmxlIGFzcGVjdC4gQnV0DQo+IHN0YXJ0aW5nIHRv
IHBvc3QgaW4gU2VwdGVtYmVyIGZvciBhIG1pZC1PY3RvYmVyIGRlYWRsaW5lIGlzIHB1dHRpbmcN
Cj4gb25lc2VsZiBhdCByaXNrLCBJIHdvdWxkIHNheSwgZm9yIGEgKHNldCBvZikgc2VyaWVzIHRo
aXMgaW52b2x2ZWQuIEkgc2VlDQo+IG5vIHByb2JsZW0gd2l0aCBhbnlvbmUgZG9pbmcgc28sIGFz
IGxvbmcgYXMgdGhleSBhY2NlcHQgdGhhdCByaXNrIHJhdGhlcg0KPiB0aGFuIGV4cGVjdGluZyB0
byBnZXQgYXdheSBieSBlaXRoZXIgZXh0cmFvcmRpbmFyeSBlZmZvcnRzIGJ5IG90aGVycw0KPiAo
cmV2aWV3ZXJzKSBvciByZWxheGF0aW9uIG9mIHdoYXQgaXMgcGVybWl0dGVkIHRvIGdvIGluLg0K
PiANCj4gT2YgY291cnNlIHRoZXJlJ3MgdGhlIG9wcG9zaXRlIHByb2JsZW0gb2YgZmVlZGJhY2sg
dGFraW5nIHVudXN1YWxseSAoSSdtDQo+IGluY2xpbmVkIHRvIHNheSB1bmR1bHkpIGxvbmcgdG8g
YXJyaXZlLCBsaWtlIHdpdGggdGhlIGdwYWRkcl9iaXRzDQo+IGFkZGl0aW9uIHN0aWxsIGZhY2lu
ZyB2YWd1ZSAvIHVuY2xlYXIgb3Bwb3NpdGlvbiBieSBBbmRyZXcuDQo+IA0KPj4gTXkgc3VnZ2Vz
dGlvbiBpcyB0byBhY2NlcHQgdGhlIFRPRE8gZm9yIHBhdGNoICM4IFsxXSBidXQgSSBhZ3JlZSB3
aXRoDQo+PiBSb2dlciB0aGF0IHdlIHNob3VsZG4ndCBpbnRyb2R1Y2UgYmFkIGludGVyZmFjZXMs
IGVzcGVjaWFsbHkgYXMgdGhleQ0KPj4gaW1wYWN0IHg4NiB3aGljaCBpcyBub3QgInRlY2ggcHJl
dmlldyIuIFNvIEkgdGhpbmsgd2Ugc2hvdWxkIHJldmVydA0KPj4gcGF0Y2ggIzcgKHRoaXMgcGF0
Y2guKSBJJ2xsIHJlcGx5IHdpdGggbW9yZSBkZXRhaWxzIGluIHNlcGFyYXRlIHNob3J0ZXINCj4+
IGVtYWlsLg0KPj4gDQo+PiBbMV0gaHR0cHM6Ly9tYXJjLmluZm8vP2w9eGVuLWRldmVsJm09MTYz
NDEyMTIwNTMxMjQ4DQo+IA0KPiBGV0lXIEkgYWdyZWUgd2l0aCBib3RoIHByb3Bvc2FscyAoYWNj
ZXB0YW5jZSBvZiBUT0RPIGFuZCByZXZlcnQpLg0KDQpJIHdhbnQgdG8gc2F5IGFnYWluIHRoYXQg
bm90aGluZyBJIHNhaWQgd2FzIG1lYW50IGFzIGEgY3JpdGljIGFuZCBJIGFtIHZlcnkNCmdyYXRl
ZnVsIG9mIGFsbCByZXZpZXdzIGFuZCBjb21tZW50cyB0aGF0IHdlIGhhdmUgKGV2ZW4gaWYgc29t
ZSBvZiB0aGVtDQphcmUgaW1wbHlpbmcgd29yayBvciBwdXNoaW5nIHN0dWZmIGluIHRoZSBmdXR1
cmUpIGFzIHdlIHdhbnQgdG8gZG8gdGhpcyByaWdodC4NCg0KV2Ugd2lsbCBkbyB0aGUgZm9sbG93
aW5nIGJlZm9yZSB0aGUgZW5kIG9mIHRoZSBkYXkgdG9kYXk6DQotIHNlbmQgYSByZXZlcnRpbmcg
cGF0Y2ggZm9yIHBhdGNoIDcNCi0gc2VuZCB1cGRhdGVkIHZlcnNpb24gb2YgcGF0Y2ggOCBoYW5k
bGluZyBhbGwgcGVuZGluZyBjb21tZW50cw0KDQpXZSB3aWxsIHRyeSB0byAobm90IHN1cmUgYXMg
c29tZSBjaGFuZ2VzIG1pZ2h0IGJlIG1vcmUgY29tcGxleCkNCi0gc2VuZCBhbiB1cGRhdGVkIHZl
cnNpb24gb2YgcGF0Y2ggMTANCi0gdHJ5IHRvIGZpbmQgYSBzb2x1dGlvbiBhY2NlcHRhYmxlIGZv
ciBwYXRjaCAxDQoNClRoYW5rcyBldmVyeW9uZSBmb3IgdGhlIHN1cHBvcnQgaGVyZSBhbmQgdGhl
IGh1Z2UgYW1vdW50IG9mIHRpbWUNCnNwZW50IG9uIHJldmlld2luZyBhbGwgcGF0Y2hlcyB0aGF0
IHdhcyBwdXNoZWQgKGFuZCB0aGVyZSB3YXMgYSBsb3Qgb2YgdGhlbSkuDQoNCk92ZXIgdGhlIG5l
eHQgbW9udGggQXJtIGlzIGNvbW1pdHRlZCB0byBwdXQgYSBsb3QgbW9yZSBlZmZvcnQgaW4gcmV2
aWV3aW5nIGFuZA0KdGVzdGluZyBwYXRjaGVzIHB1c2hlZCB0byB4ZW4tZGV2ZWwuIFdlIG5vdyBo
YXZlIGFuIGludGVybmFsIENJIHRoYXQgd2lsbCBoZWxwDQp1cyBhIGxvdCBhbmQgYWxsIHBlb3Bs
ZSBpbiBBcm0gWGVuIHRlYW0gd2lsbCBzdGFydCB0byBoYXZlIGRlZGljYXRlZCB0aW1lIHRvIHJl
dmlldw0KdXBzdHJlYW0gcGF0Y2hlcyBhbmQgaGVscCB0aGUgY29tbXVuaXR5Lg0KWGVuIGlzIGEg
YmlnIHBhcnQgb2YgQXJtIHN0cmF0ZWd5IGFyb3VuZCBhdXRvbW90aXZlIGFzIHRoZSByZWZlcmVu
Y2UgVHlwZSAxDQpoeXBlcnZpc29yIGFuZCB3ZSB3aWxsIG5vdCBkaXNhcHBlYXIgc29vbiA6LSkN
Cg0KSWYgdGhlcmUgYXJlIGFueSBvdXRzdGFuZGluZyBzZXJpZSBvciBwYXRjaGVzIGZvciB3aGlj
aCB5b3Ugd291bGQgbGlrZSB1cyB0byBoZWxwDQpPbiByZXZpZXcsIHBsZWFzZSBkbyBub3QgaGVz
aXRhdGUgdG8gcGluZyBtZSBhbmQgSSB3aWxsIHNlZSBob3cgd2UgY2FuIGhlbHAgKGV2ZW4NCmlm
IGl0IGlzIG9ubHkgdG8gZG8gc29tZSB0ZXN0aW5nKS4NCg0KVGhhbmtzIGFnYWluIGV2ZXJ5b25l
IGZvciB0aGUgaGVscC4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQpQUzogSSB3aWxsIHN0YXkgY29u
bmVjdGVkIG9uIElSQyBpZiBzb21lb25lIG5lZWRzIHRvIGNvbnRhY3QgbWUuDQoNCj4gDQo+IEph
bg0KDQo=

