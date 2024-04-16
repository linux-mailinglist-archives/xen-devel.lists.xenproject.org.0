Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767988A6909
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 12:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706870.1104308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwgPP-0006Qn-4u; Tue, 16 Apr 2024 10:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706870.1104308; Tue, 16 Apr 2024 10:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwgPP-0006Nv-1i; Tue, 16 Apr 2024 10:51:27 +0000
Received: by outflank-mailman (input) for mailman id 706870;
 Tue, 16 Apr 2024 10:51:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g64T=LV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rwgPO-0006Np-4Q
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 10:51:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41cf2e76-fbdf-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 12:51:21 +0200 (CEST)
Received: from AS4P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::9)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 10:51:14 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::fc) by AS4P191CA0019.outlook.office365.com
 (2603:10a6:20b:5d9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 10:51:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Tue, 16 Apr 2024 10:51:09 +0000
Received: ("Tessian outbound 9fd7e4b543e6:v313");
 Tue, 16 Apr 2024 10:51:09 +0000
Received: from d5659d21d859.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4E10D15C-8420-48B9-BD7B-24C1CA93C0B6.1; 
 Tue, 16 Apr 2024 10:51:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d5659d21d859.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Apr 2024 10:51:02 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PR3PR08MB5580.eurprd08.prod.outlook.com (2603:10a6:102:8c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Tue, 16 Apr
 2024 10:50:58 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 10:50:58 +0000
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
X-Inumbo-ID: 41cf2e76-fbdf-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ip/L2eWKlxDc5Wnx9kXqnt/zLqGy+wwsNE0DLMWGYXRH7URXnzn8uA/okbxeAqSEHjkIe9SfPEc6QjaZGN059Ta/qsgdFgc3Yp1kBaYBx09QewIi+g3RakM4xhLc19qdlkfIQ9+zg3K1j1RHtE6FW0tiEZT8llDfC7arppwb9roDVl5VxDkNek9Oh8MYjqJaJBg0DeIDjD+eZXpLXsVxWFqaCz4oY1m/Fbul2YO2/4IenR4A59o9PK+RtiRNeM3VGKB6fVI4sDDU8xSHfUrhpkPYfi4Wk+UTYFZOZpL9poBQ2iO3krlTONWFpQtRPER8IqrRNuh+mTd8lYq9X/HffQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neRZvndPX0u2DeLE1jSqCQeaw2sJrkftqxSv6eqwZPQ=;
 b=lynN4Dcz5yrQ0QLiFG0GEKn32DJXnT2Od/fPNIWTTbSJUJINRFjk36FIxez7y/gsaoktV7w1Xgk5/g97t2wYGWY02sWoQNriuBNr6zMRKjHKq7sahu8oMxayxsV2NwakrxxNkjHIZZ7C+yfrVSN/XuedYrKossx2xhfZlb4URQGj6dVeVo7vaKlm+2GLlFXwYRo/hI+VmbnGU9SYFvpzX+WR/09K+6hq3xx+hP6YDRB/SbeWRP626GBQGXrenJsDrcqjTCxqmF0bGIXALDGBXuSETby8nzXvx8XBmCFPSM5BKzaG0fjFPBefCxeNelK/S3kkOo7s6B6wV0/Sgmiy9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neRZvndPX0u2DeLE1jSqCQeaw2sJrkftqxSv6eqwZPQ=;
 b=UTGFNkz0nAM4mG36Flr98rMlbR8CFkELK6J3R/McMltAZNxxGLKfkdHcWz4/0jPsH8ADYM0gBuGpL7zptE/lNmfPhWG3v3E+fOxo4715/OgbqA8ythnJhIoTst6fUzamwjGGZN5YaB6Cdqw9JqMMaaY7y1I3TNxmcy42rUvPtGc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea29b0c28fa5b082
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lL4dPCxuCk2MEYJRDkPYhDOuuAEkyRjCBW5EbGwx1x+pLUvL9k0jGNeyRqElACHSs2Dmf/OSuteTo7kn0/EVLm45txpvNYHTYHDQHAbwpJUO/4rZqp4U/UN3ZcpGPU2whmpIfUTkD0iEuXOry8VzgHxQ0RPAnWGuiNK+KGIyWgs2NyvVViiR9ajdgXKC81UHlIs7a6LUZdiej/mw8DK/BFy7W6OaVlaQJ0tjL0qmLVyW7saxRImojGJGsOp1XbnH7QufCxJ1gKAD21AJOPxecGdi7KFdsDkDopSGUv9VBiWvAGU2nNIYlzgDG6naKF4e5H3bsbp1w1u9YFa9G51Cnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neRZvndPX0u2DeLE1jSqCQeaw2sJrkftqxSv6eqwZPQ=;
 b=UPKLFmvmC0rtxswcIqZivoC9iJjQLdkTZhzT04BACC+XnH+kxzi4CrI90W2puDeF25hHjoiCuWquCtETnUkPmNsOyVb7vtrc3NztLpXcCYmLtAkFWBG0lwaHs5rF4AAM/8s4NNCoDYQs29Cy9DAxd0BnouFpmFaoWApmEvHRch/Y//uyysWsHS7H4xvwhWVKpmrDac91Kio7FyaZpcjRGAQF+tVO2/A2pYKjtFJqkq0qA9XMIpuSwL4LZhUHg01Bu8o0aBmCohCmwiW7VZbgf7nTTb2g0St0Ko6KYh2wBfj29Q/cn3DaVqJLIVqFFX9NLW4+lHTEFJL569CqYot96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neRZvndPX0u2DeLE1jSqCQeaw2sJrkftqxSv6eqwZPQ=;
 b=UTGFNkz0nAM4mG36Flr98rMlbR8CFkELK6J3R/McMltAZNxxGLKfkdHcWz4/0jPsH8ADYM0gBuGpL7zptE/lNmfPhWG3v3E+fOxo4715/OgbqA8ythnJhIoTst6fUzamwjGGZN5YaB6Cdqw9JqMMaaY7y1I3TNxmcy42rUvPtGc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 13/13] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Topic: [PATCH v2 13/13] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Index:
 AQHainSZ45I8T1wdtkSTioIgDqTSKbFptBmAgADFXACAACfggIAAAloAgAACHgCAAB0rAA==
Date: Tue, 16 Apr 2024 10:50:58 +0000
Message-ID: <3832D45E-39E2-4302-A4A7-AD0F5FA256C0@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-14-luca.fancellu@arm.com>
 <7b09184a-111d-4a38-baec-53f01ec6ed03@xen.org>
 <39165767-26EA-4849-9C02-12393933139E@arm.com>
 <74cfa4fe-2ee8-4700-be90-4227704f96d1@xen.org>
 <F1BB5F9C-0683-420C-AB77-BBE88AB16347@arm.com>
 <cf9fb8b0-a8d2-4d30-a669-db1c09acc49b@xen.org>
In-Reply-To: <cf9fb8b0-a8d2-4d30-a669-db1c09acc49b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PR3PR08MB5580:EE_|AMS0EPF000001B0:EE_|GV1PR08MB10792:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7908e0-8f0d-48c4-35e2-08dc5e032053
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vWofRkDoAUT9F3BinGAR5pZVt1B2IzfC7jG5gvXIWslMFUZKLiWmZU1fcjvquDg+eLARQ9KgtIGPaeE/AYhTrgQLxFRolPyktYqYV7NDRtp1YNp+ksmPKmJiofUX/FC8d/PiFUTjTBAUQ5joZouHS5B5U/HJDUIlGHVtUG01ivJref4BdscF4rqxH/JVz+yh5zmNuwZWkFy8m26D6dqHtoDzVKtr0xVlfi93lpm2KjLuv9LCIN65TqxhPEMBsxM9/PiFR2j7JPNghczRlx2iDOpQmJsfU3owquMtETN5gTHuedCaanpEk0jIGy4VUH3RLoF3YcclCzGEWrv8T7kgXE5j6TvURnMrQf546PECppfYr6PBYf6YCHYqZ5foUdFZCDH3akFc+E6DZHbpKaWm55CKJUilorXWQy/RBa0C8la5OnsW/l3jA0XdxZ51YTyMlL/lC62OxV1IBaidXTlWNFu+n5xL1UWLyzTbXt40gSVNtcB26ZOeMJW6OxNAO7FLaYsqssTxf+7udwOQUVNw8kLNBU/2CK4MJ8pfHNDNTFmvpXv7qwLc/Izah0Wk/tuwgb35fBguUvzLus31Fcz6kXVLrf5UoNDCEGscCTJ6Pt0uRYLHEgdBMtgvNef1pVXLsK/ESFUwqZWs/6MueF77R38b1EuQW3TJfdj8quGJzNKkH7QzsO735UZymjQt5uxLofKIFBZE3qt+dZ8N5KSW7R32DGtvQXlhGzseuorD8tk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <498E514C154F814DA70C9F3654BA127C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5580
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1753abb5-02e5-4ab3-258e-08dc5e03195a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jVDgsUVFPCQqClvHcFSv0koWpiUXNGlUodKVjWSwLu2ebheiTB/kpe+mgrjZcEofRt/TWCMp8nhSydYr1q47uKWYu9KIlLHbp8deYg3fldLk6Vqa4NoXtB9qLSJh4YOPOXjvbuP5X4qsgYdcKXkFPo4bcC9kaiZrQW2JPxca+JjYhaRXxiJL95Oeymi2qY2+kC1ebnqyrzbLaY9zH5I2d/6G/Ac3P8aYlkHfTk+ihy8FPogaNvFHwN90dTf5mmx4K1VujA7jlDY7ArJ32/SwLBIH62WckPfkdnWhI0OzXf1/QMfp/qJ1vAmeZbjXWTkSNpCsA44c7JYaI9Wu8c9IOdx0gHvy49EacFDDfe54X3QIbnnGrHpJIhczFE3PolvgOKL6CjIRSL2iaZe2jEPyqfa+gtfM7dZyxueoWBPFqyVu88BNXU5JXgQboZTG7cpagKDOyEKSandGyivCNr/dY/2jJ620AWtpKJ702//xdlZqIzW8XShEcsM55jZpcBEzz+pOctgTS0sYpODoUeoYvNYDCYDboV5YbwJaOfIqk+WDEDWnxt4VXslzHmQqo1m8rwkQj6ZnK3A1odXD0ijRP1KKAyg8iiOFXOBRf4kao62Rv+oIegHOjZZyZCXL6mcOXfisXBCAUJQjelxZY1gBWVGOsmjUyQA+DJBvt/oc1Qo1sP93lMc/JpF1+FJrFD9XupUA8D86L+5HaOaxOnFgoirz/nt4VRrl49rHwsQWXrVax88jbRYDWED34RrZtdUQ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 10:51:09.9379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7908e0-8f0d-48c4-35e2-08dc5e032053
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792

DQoNCj4gT24gMTYgQXByIDIwMjQsIGF0IDEwOjA2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTYvMDQvMjAyNCAwOTo1OSwgTHVjYSBGYW5j
ZWxsdSB3cm90ZToNCj4+PiBPbiAxNiBBcHIgMjAyNCwgYXQgMDk6NTAsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0KPj4+IE9uIDE2LzA0LzIw
MjQgMDc6MjcsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+IEhpIEp1bGllbiwNCj4+PiANCj4+
PiBIaSBMdWNhLA0KPj4+IA0KPj4+Pj4gT24gMTUgQXByIDIwMjQsIGF0IDE5OjQxLCBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gSGkgTHVjYSwNCj4+
Pj4+IA0KPj4+Pj4gT24gMDkvMDQvMjAyNCAxMjo0NSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+
Pj4+PiBDdXJyZW50bHkgWGVuIGlzIG5vdCBleHBvcnRpbmcgdGhlIHN0YXRpYyBzaGFyZWQgbWVt
b3J5IHJlZ2lvbnMNCj4+Pj4+PiB0byB0aGUgZGV2aWNlIHRyZWUgYXMgL21lbW9yeSBub2RlLCB0
aGlzIGNvbW1pdCBpcyBmaXhpbmcgdGhpcw0KPj4+Pj4+IGlzc3VlLg0KPj4+Pj4+IFRoZSBzdGF0
aWMgc2hhcmVkIG1lbW9yeSBiYW5rcyBjYW4gYmUgcGFydCBvZiB0aGUgbWVtb3J5IHJhbmdlDQo+
Pj4+Pj4gYXZhaWxhYmxlIGZvciB0aGUgZG9tYWluLCBzbyBpZiB0aGV5IGFyZSBvdmVybGFwcGlu
ZyB3aXRoIHRoZQ0KPj4+Pj4+IG5vcm1hbCBtZW1vcnkgYmFua3MsIHRoZXkgbmVlZCB0byBiZSBt
ZXJnZWQgdG9nZXRoZXIgaW4gb3JkZXINCj4+Pj4+PiB0byBwcm9kdWNlIGEgL21lbW9yeSBub2Rl
IHdpdGggbm9uIG92ZXJsYXBwaW5nIHJhbmdlcyBpbiAncmVnJy4NCj4+Pj4+IA0KPj4+Pj4gQmVm
b3JlIHJldmlld2luZyB0aGUgY29kZSBpbiBtb3JlIGRldGFpbHMsIEkgd291bGQgbGlrZSB0byB1
bmRlcnN0YW5kIGEgYml0IG1vcmUgdGhlIHVzZSBjYXNlIGFuZCB3aGV0aGVyIGl0IHNob3VsZCBi
ZSB2YWxpZC4NCj4+Pj4+IA0KPj4+Pj4gRnJvbSBteSB1bmRlcnN0YW5kaW5nLCB0aGUgY2FzZSB5
b3UgYXJlIHRyeWluZyB0byBwcmV2ZW50IGlzIHRoZSBmb2xsb3dpbmcgc2V0dXA6DQo+Pj4+PiAg
MS4gVGhlIEd1ZXN0IFBoeXNpY2FsIHJlZ2lvbiAweDAwMDAgdG8gMHg4MDAwIGlzIHVzZWQgZm9y
IFJBTQ0KPj4+Pj4gIDIuIFRoZSBHdWVzdCBQaHlzaWNhbCByZWdpb24gMHgwMDAwIHRvIDB4NDAw
MCBpcyB1c2VkIGZvciBzdGF0aWMgbWVtb3J5DQo+Pj4+IFNvIGZhciwgaXQgd2FzIHBvc3NpYmxl
IHRvIG1hcCBndWVzdCBwaHlzaWNhbCByZWdpb25zIGluc2lkZSB0aGUgbWVtb3J5IHJhbmdlIGdp
dmVuIHRvIHRoZSBndWVzdCwNCj4+Pj4gc28gdGhlIGFib3ZlIGNvbmZpZ3VyYXRpb24gd2FzIGFs
bG93ZWQgYW5kIHRoZSB1bmRlcmx5aW5nIGhvc3QgcGh5c2ljYWwgcmVnaW9ucyB3ZXJlIG9mIGNv
dXJzZQ0KPj4+PiBkaWZmZXJlbnQgYW5kIGVuZm9yY2VkIHdpdGggY2hlY2tzLiBTbyBJ4oCZbSBu
b3QgdHJ5aW5nIHRvIHByZXZlbnQgdGhpcyBiZWhhdmlvdXIsIGhvd2V2ZXIgLi4uDQo+Pj4+PiAN
Cj4+Pj4+IFRoZSB1bmRlcmx5aW5nIEhvc3QgUGh5c2ljYWwgcmVnaW9ucyBtYXkgYmUgZGlmZmVy
ZW50LiBYZW4gZG9lc24ndCBndWFyYW50ZWUgaW4gd2hpY2ggb3JkZXIgdGhlIHJlZ2lvbnMgd2ls
bCBiZSBtYXBwZWQsIFNvIHdoZXRoZXIgdGhlIG92ZXJsYXBwZWQgcmVnaW9uIHdpbGwgcG9pbnQg
dG8gdGhlIG1lbW9yeSBvciB0aGUgc2hhcmVkIHJlZ2lvbiBpcyB1bmtub3duICh3ZSBkb24ndCBn
dWFyYW50ZWUgdGhlIG9yZGVyIG9mIHRoZSBtYXBwaW5nKS4gU28gbm90aGluZyBnb29kIHdpbGwg
aGFwcGVuIHRvIHRoZSBndWVzdC4NCj4+Pj4gLi4uIG5vdyBoZXJlIEkgZG9u4oCZdCB1bmRlcnN0
YW5kIGlmIHRoaXMgd2FzIHdyb25nIGZyb20gdGhlIGJlZ2lubmluZyBvciBub3QsIHNoYWxsIHdl
IGVuZm9yY2UgYWxzbyB0aGF0DQo+Pj4+IGd1ZXN0IHBoeXNpY2FsIHJlZ2lvbnMgZm9yIHN0YXRp
YyBzaGFyZWQgbWVtb3J5IGFyZSBvdXRzaWRlIHRoZSBtZW1vcnkgZ2l2ZW4gdG8gdGhlIGd1ZXN0
Pw0KPj4+IA0KPj4+IE5vdGhpbmcgZ29vZCB3aWxsIGhhcHBlbiBpZiB5b3UgYXJlIHRyeWluZyB0
byBvdmVyd3JpdGUgbWFwcGluZ3MuIFNvIEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgZW5mb3JjZWQu
IEhvd2V2ZXIsIHRoaXMgaXMgYSBtb3JlIGdlbmVyYWwgcHJvYmxlbS4gQXQgdGhlIG1vbWVudCwg
dGhpcyBpcyBwcmV0dHkgbXVjaCBhcyBtZXNzIGJlY2F1c2UgeW91IGNhbiBvdmVyd3JpdGUgYW55
IG1hcHBpbmcgKGUuZy4gbWFwIE1NSU8gb24gdG9wIG9mIHRoZSBSQU0pLg0KPj4+IA0KPj4+IEkg
dGhpbmsgdGhlIGVhc2llc3Qgd2F5IHRvIGVuZm9yY2UgaXMgdG8gZG8gaXQgaW4gdGhlIFAyTSBj
b2RlIGxpa2UgeDg2IGRvZXMgZm9yIGNlcnRhaW4gbWFwcGluZ3MuDQo+Pj4gDQo+Pj4gQW55d2F5
LCBJIGRvbid0IHRoaW5rIHRoZSBwcm9ibGVtIHNob3VsZCBiZSBzb2x2ZWQgaGVyZSBvciBieSB5
b3UgKHRoaXMgaXMgbGlrZWx5IGdvaW5nIHRvIGJlIGEgY2FuIG9mIHdvcm1zKS4gRm9yIG5vdywg
SSB3b3VsZCBjb25zaWRlciB0byBzaW1wbHkgZHJvcCB0aGUgcGF0Y2hlcyB0aGF0IGFyZSB0cnlp
bmcgdG8gZG8gdGhlIG1lcmdlLg0KPj4+IA0KPj4+IEFueSB0aG91Z2h0cz8NCj4+IFllcyBJIGFn
cmVlIHdpdGggeW91LCBJ4oCZbGwgZHJvcCB0aGUgcGF0Y2ggdGhhdCB0cmllcyB0byBkbyB0aGUg
bWVyZ2UsIEkgd2FzIHRoaW5raW5nIGFib3V0IGNoZWNraW5nIHRoYXQgdGhlIGd1ZXN0IHBoeXMg
c3RhdGljIG1lbSByZWdpb24gaXMNCj4+IGluc2lkZSB0aGVzZSBib3VuZGFyaWVzOg0KPj4gI2Rl
ZmluZSBHVUVTVF9SQU1fQkFOS19CQVNFUyB7IEdVRVNUX1JBTTBfQkFTRSwgR1VFU1RfUkFNMV9C
QVNFIH0NCj4+ICNkZWZpbmUgR1VFU1RfUkFNX0JBTktfU0laRVMgeyBHVUVTVF9SQU0wX1NJWkUs
IEdVRVNUX1JBTTFfU0laRSB9DQo+PiBhbmQgYWxzbyB0aGF0IGRvZXNu4oCZdCBvdmVybGFwIHdp
dGggKHN0cnVjdCBrZXJuZWxfaW5mbykubWVtLCBkb2VzIGl0IHNvdW5kcyByaWdodCB0byB5b3U/
DQo+IA0KPiBJIGRvbid0IGZ1bGx5IHVuZGVyc3RhbmQgd2hhdCB5b3Ugd2FudCB0byBkby4gQnV0
IGFzIEkgd3JvdGUgYmVmb3JlLCB0aGUgb3ZlcmxhcHMgaGFwcGVuIHdpdGggbWFueSBkaWZmZXJl
bnQgcmVnaW9ucyAod2hhdCBpZiB5b3UgdHJ5IHRvIHVzZSB0aGUgR0lDIERpc3RyaWJ1dG9yIHJl
Z2lvbnMgZm9yIHRoZSBzaGFyZWQgbWVtb3J5PykuDQo+IA0KPiBTbyBpZiB3ZSB3YW50IHNvbWUg
b3ZlcmxhcHMgY2hlY2ssIHRoZW4gaXQgaGFzIHRvIGJlIGdlbmVyaWMuDQoNCkFmdGVyIGEgY2hh
dCBpbiBNYXRyaXggbm93IEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuLCB0aGFua3MsIEkgd2ls
bCBqdXN0IGRyb3AgdGhlIHBhdGNoIDEyIGFuZCB1cGRhdGUgdGhpcyBvbmUuDQoNCkNoZWVycywN
Ckx1Y2ENCg0K

