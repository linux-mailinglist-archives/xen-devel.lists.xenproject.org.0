Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E49EC2CC2F4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 18:04:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42911.77224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkVY2-0002C8-Io; Wed, 02 Dec 2020 17:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42911.77224; Wed, 02 Dec 2020 17:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkVY2-0002Bj-FS; Wed, 02 Dec 2020 17:04:10 +0000
Received: by outflank-mailman (input) for mailman id 42911;
 Wed, 02 Dec 2020 17:04:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19jX=FG=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kkVY0-0002Be-98
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 17:04:08 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.46]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 184c0ddd-a64c-467b-877b-f0a92e5155aa;
 Wed, 02 Dec 2020 17:04:06 +0000 (UTC)
Received: from AM6P191CA0038.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::15)
 by VE1PR08MB5679.eurprd08.prod.outlook.com (2603:10a6:800:1a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 17:04:04 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::e) by AM6P191CA0038.outlook.office365.com
 (2603:10a6:209:7f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 17:04:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 17:04:04 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71");
 Wed, 02 Dec 2020 17:04:04 +0000
Received: from e298a24661a6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2B00524A-EDAC-4327-B89B-E8F6A0B5DC13.1; 
 Wed, 02 Dec 2020 17:03:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e298a24661a6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Dec 2020 17:03:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB3995.eurprd08.prod.outlook.com (2603:10a6:10:b2::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 2 Dec
 2020 17:03:57 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 17:03:57 +0000
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
X-Inumbo-ID: 184c0ddd-a64c-467b-877b-f0a92e5155aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gQavw2fe5+oEYN5S7XHA8Tere3wHB4YJJKzmopc4uU=;
 b=wspkC6L0G0zq5begiOtVewMTTuO8el2T7azeF5/IQmeuN90b/ZADIYpraIy4h/lA5LRGZs33rNcpnaZDInm67qmbQn6i2hWwjd1yEnXXrLweYf6nWdkjTvRVylqKcJ5pe1A0Vb+txqGoPFzU30btsZCS1+beW4xNnMbhpvar26k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a2231e60c3015f5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLDy+jFlfZHyBdlhSVwxCvet8RL4xDy+233hXCZ1EQTwF6XG4C8NLcI3n1c3fWgpXONg32DwUOJc/oC+2o1GcFAGpSUiZMkYjIHBSdVG6eIpdz/jQpWu51t38LLVYEA3gVMz7e1buVms1/iARsqiuuTEUdznRlH4nw9FmImYU8cYXkv1dnXj4wmh3vt7NH3k52PlRcbgkOmoEDZijY1cWrqG0USRnr23pLRO0JTubrKDT1mbdpmbxr4wMKzlDxfyjJSMydWhDORV2KKnvCxfF9A20aGMNreyVeYDunp1DOxF67OTpqX5r9pE+r/D9CopiMLwZuyIM8yv1ZwD7J9NHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gQavw2fe5+oEYN5S7XHA8Tere3wHB4YJJKzmopc4uU=;
 b=F/Wb3rUPAKNEA/ANufcX3MsdjnB0XpnA3x8rKysdxMrxZcyRNlHVoeIQIqrnHC2CN3N09icbNxrnu+GATVA6snUmuyNcbeOI/L5xv72ABJq1CEj9Unoj9GBTLNeU7CGZlHgcVN0yHkHZVlkiT4nYrLHbaAz+7sn7TG7lHlpsIjEeO81Q6sT4vbDnce1UY4T+19hDjkp2V/uEgUYvQyMU7uX8Hr4RTKkTU2X3NSBpIFHlbIYFCE8wQfOIw9gd/llum3aNDziOYWyeAqUpRmcwf01AeAniFEk0096UlDuGDCUXzqf3Hpl+iJPabbHiUBVY7JGBEcc489Cb//wuEbNCzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gQavw2fe5+oEYN5S7XHA8Tere3wHB4YJJKzmopc4uU=;
 b=wspkC6L0G0zq5begiOtVewMTTuO8el2T7azeF5/IQmeuN90b/ZADIYpraIy4h/lA5LRGZs33rNcpnaZDInm67qmbQn6i2hWwjd1yEnXXrLweYf6nWdkjTvRVylqKcJ5pe1A0Vb+txqGoPFzU30btsZCS1+beW4xNnMbhpvar26k=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/irq: Propagate the error from init_one_desc_irq()
 in init_*_irq_data()
Thread-Topic: [PATCH v2] xen/irq: Propagate the error from init_one_desc_irq()
 in init_*_irq_data()
Thread-Index: AQHWxXrf7kDHq9oT70mf9BS7rS/4g6nkD0iA
Date: Wed, 2 Dec 2020 17:03:57 +0000
Message-ID: <E9377A57-0AA0-4B5B-87B0-B65FEF655C59@arm.com>
References: <20201128113642.8265-1-julien@xen.org>
In-Reply-To: <20201128113642.8265-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1cdc200e-3491-4d1b-c892-08d896e44616
x-ms-traffictypediagnostic: DB8PR08MB3995:|VE1PR08MB5679:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5679511213AFAC0EB365F0C19DF30@VE1PR08MB5679.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SbAp61UzIKLNt06wCs+HYSBiACd9d4Vo3Nz1VFly1ZV/QvoBomktex05RicvaG0LJGjac8056QETk/V0GcyxbPb6j2ILSUQ/U8vmU/vC6rQpRTL6CWo3Pn2Ng7ijsbdOEcta4NS6rjb8/CYtxUhmcZEx4SQrhb54Q0i/7gvRV0PCPS+R/nSbq9NdB8vL8EqpXKIb6i2a2pGQ3b6nCca7rqj3VYKzdH0RjiTrgFNpcvf7e67lRIxc4Bm1x/QmP7HwqTIxVzRNtr+NPQ1g5PMiJsZewvoXJ7QLM6+pTFXN6mc+aJfaZsfQYICWfYH+y0Ozj9aGBagMm5kogyzbbwBWViA5SpaP47P1l+hQrZ4i8aLjVrvYhmJghbsOohQy1WZE
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(2906002)(316002)(71200400001)(6512007)(6506007)(478600001)(8676002)(53546011)(6486002)(33656002)(2616005)(8936002)(83380400001)(54906003)(6916009)(5660300002)(64756008)(66446008)(66946007)(76116006)(91956017)(66476007)(66556008)(36756003)(26005)(86362001)(186003)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?Qm5PeFlKUW1SSTVUYytTTWVLYU5IbUErMGN3UFd0dStFQXVlRmRha2kvb0lQ?=
 =?utf-8?B?d3RjRWYvYnZpdTZNWTI5NHdEN0hmbUVGcVZVRytYUThWNzdtQUFvcXE0Mjdt?=
 =?utf-8?B?a3NBbU5yMHRneGN5YUlVNlFHTllXMHhhVWJ0cjFSN3BIMmg3a1Foc2N0Q3BJ?=
 =?utf-8?B?NVlORzU4ajQrcVQzMkNIU0hOWlU2VW5kQVFqZ3B1VitRaFpPM1BKQndwYlI0?=
 =?utf-8?B?bjBlWTFJZUZsTW1vVCs1YVppSDFMaVc2R3F1TTJpcGEybzJkNkFnQXY3cTlE?=
 =?utf-8?B?bStvbWRRY2x5QVJFVzNIMkFITE51dXBjWkNOWUdzaUlVSFl1VWNGUTBVTkcw?=
 =?utf-8?B?RVYxRmc1cmJVSjEvLzdTTkh5ZW5DWDdQeWwrS2J0a2trZituTHdkTzlwbnhx?=
 =?utf-8?B?aTFzdlZwbm56aWlMNzdvSE9UNHVDY2xIclQ0L0h5bFNjRzluQStDT2ZwOFZh?=
 =?utf-8?B?M2tkb0ZxMUdlN1dPUFgvMkE2d3JTRnlJS2ZKMW13ekRPb01PdVY5YWNGRnRP?=
 =?utf-8?B?NVRIdHRMYWVBTHR4NmJYdVNRdWZXQSswRGtzS3FHYkg1WG02WFhlemlPN0hy?=
 =?utf-8?B?eVJNVVBiaUVjTTUvQW1UbHl4NGV2UnBsNUF4VnJWOHkwdmM2OWgzQTVMZDl1?=
 =?utf-8?B?VTNRT2daZGJ2Q2wxdWpFWEhvcHNDY0FpNVVlOUZLaWdDaXJYTUFYQ1FnOGFt?=
 =?utf-8?B?NTBzRmNEeXZWVmdHZzI5bVU3V2pCMzQyRyt1ajlpbWZETHJ2TXN0UThZbHNF?=
 =?utf-8?B?cTUvVDVCelpaZzdDM3lZWDBVYUxIQTcvSlhWZitMTWoxWW9pa0FiaTF3bzNR?=
 =?utf-8?B?MGQrNzE3ZGRtWkVwQXp2MzA5bE16WURGYmNBVmc2aUhRQ2s2U3BpajRuUTdP?=
 =?utf-8?B?WkpSYlR3eENZM29OTEJxWEZjRjFjT3h4ak1CTW42cnVGTHNpdWdHczRhYk9Y?=
 =?utf-8?B?NXpCSW9XTG9BWHhaZWRmcFZxY0hxNXYrVlZwTHo2WkNieHQ1NElpYktpSHdt?=
 =?utf-8?B?RFVUdWwwdzVtb0NQUG9tQ0ROTUI3eElUQXZoQVRBN3ZiZmM0ZWdqOGliQWVC?=
 =?utf-8?B?c0krR1lzeFFVUjZBSmtVTnJnT1VrOGRUYlJ1R2EwUkFOQkpuK09INkxlKzVv?=
 =?utf-8?B?dGVPeTZ1WUV1THNvUFpKamZONGNEOFFlb1Y4RDJhZCsveDN2Tnp1UXZ1Tm91?=
 =?utf-8?B?b0NXQVZybGEzbUFSUzZ6OWtoRDNCTWFmMHg5NTU4eGxkNmd4cDhNaWw0OW14?=
 =?utf-8?B?eGxSMWhncHVZV05GY2dzZjU2UnVUU0JFNzdhV3hzTlY3NU16VXdLMHJTSU1B?=
 =?utf-8?Q?wQO3abEOBBHvW/iiKSs/3abemEFdwuDExc?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAD069E0108CCC45A5128FE864EFB985@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3995
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0ff46910-cf80-4246-843d-08d896e44201
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0WECtJ9ab4NriLlLjCkgs52PHiQHyKOgh9KB3Tp0rwpS59IVAvOKAkjLmRiDTlrh4xE/B5xhEoodyy0LUyLTcBG+eZWmibomMO+00x3w6kLyxu8v1V+qfoRovyCuoRQ4qY+i9FnuUA6mcoPOxfTjSIHE1gUmXxrQBsimudpe/T9gvZcg/el0wk7wonO0esqQUp7cTBEczLeRJloMEwH9/OOLnKHbKH5wudhpn/hU41f1Ix9kIzQ+oUy/5tRD2lTh5wXXwAOHE8FHyAc6IuG66O5XTWhwXPU7D80FZCFpLrg9nTyi7Sk3Pz+ESqNNWyd4UJoliG8hOpvEFd2N14Do1aYLgklxAkkPA2o8XqLA5d+/D6XfiAv8CdakygpuRr4ssx+5wLnCF/CyBxHZcEU3eA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966005)(336012)(54906003)(4326008)(36906005)(186003)(82310400003)(316002)(2906002)(6512007)(26005)(36756003)(33656002)(81166007)(478600001)(53546011)(70586007)(356005)(6506007)(70206006)(8676002)(6862004)(2616005)(86362001)(83380400001)(82740400003)(5660300002)(8936002)(6486002)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 17:04:04.4773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdc200e-3491-4d1b-c892-08d896e44616
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5679

DQoNCj4gT24gMjggTm92IDIwMjAsIGF0IDExOjM2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBpbml0X29uZV9kZXNjX2lycSgpIGNhbiByZXR1cm4gYW4gZXJyb3IgaWYgaXQgaXMg
dW5hYmxlIHRvIGFsbG9jYXRlDQo+IG1lbW9yeS4gV2hpbGUgdGhpcyBpcyB1bmxpa2VseSB0byBo
YXBwZW4gZHVyaW5nIGJvb3QgKGNhbGxlZCBmcm9tDQo+IGluaXRfeyxsb2NhbF99aXJxX2RhdGEo
KSksIGl0IGlzIGJldHRlciB0byBoYXJkZW4gdGhlIGNvZGUgYnkNCj4gcHJvcGFndGluZyB0aGUg
cmV0dXJuIHZhbHVlLg0KPiANCj4gU3BvdHRlZCBieSBjb3Zlcml0eS4NCj4gDQo+IENJRDogMTA2
NTI5DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29t
Pg0KPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1bCBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pg0KDQpSZXZpZXdlZC1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0u
Y29tPg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IC0tLQ0KPiAgICBDaGFuZ2VzIGluIHYy
Og0KPiAgICAgICAgLSBBZGQgUm9nZXIncyByZXZpZXdlZC1ieSBmb3IgeDg2DQo+ICAgICAgICAt
IEhhbmRsZQ0KPiAtLS0NCj4geGVuL2FyY2gvYXJtL2lycS5jIHwgMTIgKysrKysrKysrKy0tDQo+
IHhlbi9hcmNoL3g4Ni9pcnEuYyB8ICA3ICsrKysrKy0NCj4gMiBmaWxlcyBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9pcnEuYyBiL3hlbi9hcmNoL2FybS9pcnEuYw0KPiBpbmRleCAzODc3NjU3YTUyNzcuLmI3
MWIwOTllNmZhMiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2lycS5jDQo+ICsrKyBiL3hl
bi9hcmNoL2FybS9pcnEuYw0KPiBAQCAtODgsNyArODgsMTEgQEAgc3RhdGljIGludCBfX2luaXQg
aW5pdF9pcnFfZGF0YSh2b2lkKQ0KPiAgICAgZm9yICggaXJxID0gTlJfTE9DQUxfSVJRUzsgaXJx
IDwgTlJfSVJRUzsgaXJxKysgKQ0KPiAgICAgew0KPiAgICAgICAgIHN0cnVjdCBpcnFfZGVzYyAq
ZGVzYyA9IGlycV90b19kZXNjKGlycSk7DQo+IC0gICAgICAgIGluaXRfb25lX2lycV9kZXNjKGRl
c2MpOw0KPiArICAgICAgICBpbnQgcmMgPSBpbml0X29uZV9pcnFfZGVzYyhkZXNjKTsNCj4gKw0K
PiArICAgICAgICBpZiAoIHJjICkNCj4gKyAgICAgICAgICAgIHJldHVybiByYzsNCj4gKw0KPiAg
ICAgICAgIGRlc2MtPmlycSA9IGlycTsNCj4gICAgICAgICBkZXNjLT5hY3Rpb24gID0gTlVMTDsN
Cj4gICAgIH0NCj4gQEAgLTEwNSw3ICsxMDksMTEgQEAgc3RhdGljIGludCBpbml0X2xvY2FsX2ly
cV9kYXRhKHZvaWQpDQo+ICAgICBmb3IgKCBpcnEgPSAwOyBpcnEgPCBOUl9MT0NBTF9JUlFTOyBp
cnErKyApDQo+ICAgICB7DQo+ICAgICAgICAgc3RydWN0IGlycV9kZXNjICpkZXNjID0gaXJxX3Rv
X2Rlc2MoaXJxKTsNCj4gLSAgICAgICAgaW5pdF9vbmVfaXJxX2Rlc2MoZGVzYyk7DQo+ICsgICAg
ICAgIGludCByYyA9IGluaXRfb25lX2lycV9kZXNjKGRlc2MpOw0KPiArDQo+ICsgICAgICAgIGlm
ICggcmMgKQ0KPiArICAgICAgICAgICAgcmV0dXJuIHJjOw0KPiArDQo+ICAgICAgICAgZGVzYy0+
aXJxID0gaXJxOw0KPiAgICAgICAgIGRlc2MtPmFjdGlvbiAgPSBOVUxMOw0KPiANCj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9pcnEuYyBiL3hlbi9hcmNoL3g4Ni9pcnEuYw0KPiBpbmRleCA0
NTk2Njk0NzkxOWUuLjNlYmQ2ODQ0MTVhYyAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2ly
cS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYw0KPiBAQCAtNDI4LDkgKzQyOCwxNCBAQCBp
bnQgX19pbml0IGluaXRfaXJxX2RhdGEodm9pZCkNCj4gDQo+ICAgICBmb3IgKCBpcnEgPSAwOyBp
cnEgPCBucl9pcnFzX2dzaTsgaXJxKysgKQ0KPiAgICAgew0KPiArICAgICAgICBpbnQgcmM7DQo+
ICsNCj4gICAgICAgICBkZXNjID0gaXJxX3RvX2Rlc2MoaXJxKTsNCj4gICAgICAgICBkZXNjLT5p
cnEgPSBpcnE7DQo+IC0gICAgICAgIGluaXRfb25lX2lycV9kZXNjKGRlc2MpOw0KPiArDQo+ICsg
ICAgICAgIHJjID0gaW5pdF9vbmVfaXJxX2Rlc2MoZGVzYyk7DQo+ICsgICAgICAgIGlmICggcmMg
KQ0KPiArICAgICAgICAgICAgcmV0dXJuIHJjOw0KPiAgICAgfQ0KPiAgICAgZm9yICggOyBpcnEg
PCBucl9pcnFzOyBpcnErKyApDQo+ICAgICAgICAgaXJxX3RvX2Rlc2MoaXJxKS0+aXJxID0gaXJx
Ow0KPiAtLSANCj4gMi4xNy4xDQo+IA0KPiANCg0K

