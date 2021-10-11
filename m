Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63468429566
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 19:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206390.361953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZyuR-0005tB-Hw; Mon, 11 Oct 2021 17:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206390.361953; Mon, 11 Oct 2021 17:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZyuR-0005qQ-Es; Mon, 11 Oct 2021 17:16:19 +0000
Received: by outflank-mailman (input) for mailman id 206390;
 Mon, 11 Oct 2021 17:16:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfEM=O7=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mZyuQ-0005qJ-2O
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 17:16:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 464a91e4-de34-41e7-942e-03e53dbfcbe1;
 Mon, 11 Oct 2021 17:16:16 +0000 (UTC)
Received: from AS9PR06CA0278.eurprd06.prod.outlook.com (2603:10a6:20b:45a::18)
 by PA4PR08MB6224.eurprd08.prod.outlook.com (2603:10a6:102:e7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 17:16:04 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::2d) by AS9PR06CA0278.outlook.office365.com
 (2603:10a6:20b:45a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 17:16:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 17:16:03 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Mon, 11 Oct 2021 17:16:03 +0000
Received: from 9a9064d71580.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A4DBB567-8EC3-4ABF-883D-5BC41B1BB1B7.1; 
 Mon, 11 Oct 2021 17:15:56 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a9064d71580.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 17:15:56 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB8PR08MB5162.eurprd08.prod.outlook.com (2603:10a6:10:ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 17:15:55 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 17:15:55 +0000
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
X-Inumbo-ID: 464a91e4-de34-41e7-942e-03e53dbfcbe1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mM3MTGZH6O0S1A/We/x/P7r+HM/9ijRYcpIeZ3LYKCc=;
 b=nvSHF8dfFNkBGi1yQwJ1DEthvVLR/EhgZyiEFRPeqIK1gTs1IxJx2aYYxMZJNItz6VsWBjlPcZiU9gNradJi04jPYX5fhh1z3G8mXHriuMfK8emRgmX/cb0sGfue9n8urJtLm3AK9NQ2S9oGcXZzDZfRn3EXeDPCWC1CPC7nimM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7cd45d50211fa4e0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6EfxPcw0gNC7JwPRNnWV/G6qQ4jNIiggVEOqOzN/k+n4sKel9OcRXDQSt5Rg4RjutK0GC+8djH0/vBmYaIKmsDkm4L/gmTwhq+HKBJbinGn0FFU/y/sR3gYwPp2Ak4wXzSXScsniOyW3SBjT9PhlMSwTdMX2XxaPdYJnD/Tu5JtkNhW2GP4wV+4Eca8+UpZH/6q547ZJOiogDtEVK6aHvNXXHgjN/do6MJ0uuNvS3OSQa3dIdpCH7IarVTmbVMuEvp1h4Z0cbh2WLI7HXsRhfikvN94kX7YLNOc41fq66U99P+QQmURiR5p5TW/ul0jfz0WR4jgW0ZkVhg1JXnbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mM3MTGZH6O0S1A/We/x/P7r+HM/9ijRYcpIeZ3LYKCc=;
 b=ipVOGubJLnQG954UEKXEldqLm+Ya2znTFplEZDqSHBDlXY6ut6zHjrUgL2nCosoIfcKuAvUVi27NNMf1cvUpfEECcAgP2WuACCl0PHYjS3eEXuEQIx5kCgNFyfsJbayoC/HKRVN7fYWKJWbxjAhwctVuNcfJ+kD3+MQcpfP2Q7cclF0DwjtX8UQ/R+IL508ri7DLR0Fw0Xt7nBbsw8Jm2I1PTKiVwLGWawbAlneDnEkXb/Gdn0j4goJzeb8OopVn+ePG0JZqBv4ew3U4xXn9ShZCTyB9V4xcAkRS5IYmTX2M/6tjK9Zmo1R5a/Y0eV4gyWNDPHK03h+EPdz2eM+HnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mM3MTGZH6O0S1A/We/x/P7r+HM/9ijRYcpIeZ3LYKCc=;
 b=nvSHF8dfFNkBGi1yQwJ1DEthvVLR/EhgZyiEFRPeqIK1gTs1IxJx2aYYxMZJNItz6VsWBjlPcZiU9gNradJi04jPYX5fhh1z3G8mXHriuMfK8emRgmX/cb0sGfue9n8urJtLm3AK9NQ2S9oGcXZzDZfRn3EXeDPCWC1CPC7nimM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Rahul Singh
	<Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXutl3YqS5dHXsYk6KpdKt4d14RavNphKAgABZ5QCAAAISgIAABoqAgAAJBQA=
Date: Mon, 11 Oct 2021 17:15:55 +0000
Message-ID: <AF7AB609-3E79-4017-A296-CC7C87E1705F@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWQXF2vDaWQvi+bT@MacBook-Air-de-Roger.local>
 <4F406854-4F90-48F6-8470-6CCB60A3CB77@arm.com>
 <e199bfe2-0bcc-989f-fd4a-ecf44a3cd1ac@epam.com>
 <YWRpuUtHkyA4RY5H@MacBook-Air-de-Roger.local>
In-Reply-To: <YWRpuUtHkyA4RY5H@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4a1d469c-e3cd-466b-c168-08d98cdace0a
x-ms-traffictypediagnostic: DB8PR08MB5162:|PA4PR08MB6224:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6224DC5E9D1BC2B9ADBB675C9DB59@PA4PR08MB6224.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jnV4/Ld9N6T7M/7vvegwVMmaAvBIIhLEv6Hhwk0gX5KJbJQPEmywvSyNT++A1Zav6XtXER/rZeBea5mpqRMT12dxf/KCeMAvFKy58qTfq3asKmICR85qsEHJWos0JOB0PRBbBpCzO5cmJguFuELVFk6y3Kj4OJgy3jHqIed+64VibGiiEaF76k6YJjwFjITXzSnzSfeTDrZ3uBXeB903yNAlcq+n+vStRUhcf6wnHF1tta/bv+uBz8JG7Np9fij5w7+F5kDGIxgZQl0wD1jfLfthanU+1hhfVX+d4uLkuoqSorGTX0j+6BVygWWh4+P2SgdEQXPcH8DAbhoHuBlu/XDVZii7bDYPjDc1SAzSG+CHXQjfupxl81Ag3ew++CHnYbmfbtiHkUR0YTTcpRfPFjpGiIQ3CqQbjlP9i9ITWPaKOaP1PIvN9PI4aFawI3q8npBOtlHC9SFWbhp380jrYm2Svc3uJf8r1R5un1FFr/ugCxaYzbG/rOoBxb0sHWT5Soypmyi0T1UCUUN8SuNRDMH1/1zgw9Q6mo8MOqJhStLPtmaET4igBKOZrZmQrPiky9hLjp0f2xV0U6IG2znCGTym6sYE8rB5PTVCevw03yldJ4zyLD0Vh+hUYnX+sJwSpsx8dMLB0GzSTwxkrp/ZxG1uPFbdC2n4CqIcqpjGMpRo5U5XZNeehUkeg265J6TTrQbm1DDaBw+U4rMGb7F/UEhy/FeqHH3/UoSUDMpXWD4Z0qoyXBoJpHmclZ+EN3ID
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(91956017)(8676002)(6486002)(26005)(71200400001)(4326008)(2906002)(54906003)(6916009)(76116006)(36756003)(122000001)(66476007)(66946007)(508600001)(66446008)(38100700002)(66556008)(64756008)(38070700005)(33656002)(83380400001)(7416002)(5660300002)(2616005)(86362001)(53546011)(6506007)(316002)(8936002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E939567DDAAC91449A07C26A37CF5256@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5162
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a2e87bc-e711-4b92-4c6f-08d98cdac906
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RAn3YZbOTB+Nr/+OceW+avuT8cfWVzQ2nm8trHcqQ1lGcb1XaJGG9U8qRXQUYX5vv9WX5JsVsNQp3pyLOIhOUm5jNFRQYOY6tbpAxgMkSaXYO7BlqK3KauN6J9F1jbprqCUoq1erRHRzzGTTzxmQ8zwUNmkH7J4nhYLdWUl+Aj1MdSD0pLV02GKHi8Z7whzpQSwfzad75GqRd0sGXXrXN58aEGEOnU4e0AmV6yZL+DeS1l7wWS8Qh3dvXAAWDiOMlSqSzw7/eZorPbIIGkDycc8Zjk4Lx3MHdFglASJccOnxT4XOH6E47p0aHjvlHLwalwpSsjmSHx756hm0fNp1b/DbIW4a7OGixFojpyxzWgqo5XUW16T4jlipJYnwaU6dgcAiu85aaFulg3urnY3M6iPULaOn4RWXSdSVruHfCSd7IvwNUlo8oeDOIvE8zOE14L65yklGoTH0akN+h+s8FKYSAJU7An71HVHX8qno+am4pR7hqmE/iJ1KZ5S1ybtCjbO0b+C3qK+W4J5LJVouY6mxVBXyXKr1TF74fiJ38pVj3dnEdMzGsLzIgR4/l67EEO2sPnvIDLq2WUIgr3hNs4I3WC0CrbsAiswWYj45HhJhiccVNeUiBovuBlRlwRMD/XdP1sgXdlYJujpmwE3+UBeMc535S17aMG7pewurs21woXgY443uYlxVfSqfkf+FKA8cAj7KOGEAgiFq4VDEeA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(8676002)(6512007)(356005)(70586007)(2906002)(86362001)(33656002)(36860700001)(4326008)(81166007)(53546011)(36756003)(186003)(82310400003)(6486002)(6506007)(5660300002)(8936002)(336012)(508600001)(2616005)(26005)(6862004)(83380400001)(47076005)(316002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 17:16:03.6522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1d469c-e3cd-466b-c168-08d98cdace0a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6224

SGkgUm9nZXIsDQoNCj4gT24gMTEgT2N0IDIwMjEsIGF0IDE3OjQzLCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIE9jdCAxMSwgMjAy
MSBhdCAwNDoyMDoxNFBNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+
IA0KPj4gDQo+PiBPbiAxMS4xMC4yMSAxOToxMiwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+
PiBIaSBSb2dlciwNCj4+PiANCj4+Pj4gT24gMTEgT2N0IDIwMjEsIGF0IDExOjUxLCBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBPbiBX
ZWQsIE9jdCAwNiwgMjAyMSBhdCAwNjo0MDozNFBNICswMTAwLCBSYWh1bCBTaW5naCB3cm90ZToN
Cj4+Pj4+IFRoZSBleGlzdGluZyBWUENJIHN1cHBvcnQgYXZhaWxhYmxlIGZvciBYODYgaXMgYWRh
cHRlZCBmb3IgQXJtLg0KPj4+Pj4gV2hlbiB0aGUgZGV2aWNlIGlzIGFkZGVkIHRvIFhFTiB2aWEg
dGhlIGh5cGVyIGNhbGwNCj4+Pj4+IOKAnFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZOKAnSwgVlBD
SSBoYW5kbGVyIGZvciB0aGUgY29uZmlnIHNwYWNlDQo+Pj4+PiBhY2Nlc3MgaXMgYWRkZWQgdG8g
dGhlIFhlbiB0byBlbXVsYXRlIHRoZSBQQ0kgZGV2aWNlcyBjb25maWcgc3BhY2UuDQo+Pj4+PiAN
Cj4+Pj4+IEEgTU1JTyB0cmFwIGhhbmRsZXIgZm9yIHRoZSBQQ0kgRUNBTSBzcGFjZSBpcyByZWdp
c3RlcmVkIGluIFhFTg0KPj4+Pj4gc28gdGhhdCB3aGVuIGd1ZXN0IGlzIHRyeWluZyB0byBhY2Nl
c3MgdGhlIFBDSSBjb25maWcgc3BhY2UsWEVODQo+Pj4+PiB3aWxsIHRyYXAgdGhlIGFjY2VzcyBh
bmQgZW11bGF0ZSByZWFkL3dyaXRlIHVzaW5nIHRoZSBWUENJIGFuZA0KPj4+Pj4gbm90IHRoZSBy
ZWFsIFBDSSBoYXJkd2FyZS4NCj4+Pj4+IA0KPj4+Pj4gRm9yIERvbTBsZXNzIHN5c3RlbXMgc2Nh
bl9wY2lfZGV2aWNlcygpIHdvdWxkIGJlIHVzZWQgdG8gZGlzY292ZXIgdGhlDQo+Pj4+PiBQQ0kg
ZGV2aWNlIGluIFhFTiBhbmQgVlBDSSBoYW5kbGVyIHdpbGwgYmUgYWRkZWQgZHVyaW5nIFhFTiBi
b290cy4NCj4+Pj4+IA0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNp
bmdoQGFybS5jb20+DQo+Pj4+PiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPg0KPj4+Pj4gLS0tDQo+Pj4+PiBDaGFuZ2UgaW4gdjU6DQo+Pj4+
PiAtIEFkZCBwY2lfY2xlYW51cF9tc2kocGRldikgaW4gY2xlYW51cCBwYXJ0Lg0KPj4+Pj4gLSBB
ZGRlZCBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPg0KPj4+Pj4gQ2hhbmdlIGluIHY0Og0KPj4+Pj4gLSBNb3ZlIGFkZGl0aW9uIG9mIFhFTl9E
T01DVExfQ0RGX3ZwY2kgZmxhZyB0byBzZXBhcmF0ZSBwYXRjaA0KPj4+Pj4gQ2hhbmdlIGluIHYz
Og0KPj4+Pj4gLSBVc2UgaXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQoKSBpbiBwbGFjZSBvZiBw
Y2lfcGFzc3Rocm91Z2hfZW5hYmxlZCB2YXJpYWJsZQ0KPj4+Pj4gLSBSZWplY3QgWEVOX0RPTUNU
TF9DREZfdnBjaSBmb3IgeDg2IGluIGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZygpDQo+Pj4+
PiAtIFJlbW92ZSBJU19FTkFCTEVEKENPTkZJR19IQVNfVlBDSSkgZnJvbSBoYXNfdnBjaSgpDQo+
Pj4+PiBDaGFuZ2UgaW4gdjI6DQo+Pj4+PiAtIEFkZCBuZXcgWEVOX0RPTUNUTF9DREZfdnBjaSBm
bGFnDQo+Pj4+PiAtIG1vZGlmeSBoYXNfdnBjaSgpIHRvIGluY2x1ZGUgWEVOX0RPTUNUTF9DREZf
dnBjaQ0KPj4+Pj4gLSBlbmFibGUgdnBjaSBzdXBwb3J0IHdoZW4gcGNpLXBhc3N0aG91Z2ggb3B0
aW9uIGlzIGVuYWJsZWQuDQo+Pj4+PiAtLS0NCj4+Pj4+IC0tLQ0KPj4+Pj4geGVuL2FyY2gvYXJt
L01ha2VmaWxlICAgICAgICAgfCAgIDEgKw0KPj4+Pj4geGVuL2FyY2gvYXJtL2RvbWFpbi5jICAg
ICAgICAgfCAgIDQgKysNCj4+Pj4+IHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgIHwgICAz
ICsNCj4+Pj4+IHhlbi9hcmNoL2FybS92cGNpLmMgICAgICAgICAgIHwgMTAyICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4+IHhlbi9hcmNoL2FybS92cGNpLmggICAgICAg
ICAgIHwgIDM2ICsrKysrKysrKysrKw0KPj4+Pj4geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNp
LmMgfCAgMTggKysrKysrDQo+Pj4+PiB4ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oICB8ICAg
NyArKy0NCj4+Pj4+IHhlbi9pbmNsdWRlL2FzbS14ODYvcGNpLmggICAgIHwgICAyIC0NCj4+Pj4+
IHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oIHwgICA3ICsrKw0KPj4+Pj4geGVuL2luY2x1
ZGUveGVuL3BjaS5oICAgICAgICAgfCAgIDIgKw0KPj4+Pj4gMTAgZmlsZXMgY2hhbmdlZCwgMTc5
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQg
eGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2Fy
bS92cGNpLmgNCj4+Pj4+IA0KPj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9NYWtlZmls
ZSBiL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0KPj4+Pj4gaW5kZXggNDRkN2NjODFmYS4uZmI5Yzk3
NmVhMiAxMDA2NDQNCj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0KPj4+Pj4gKysr
IGIveGVuL2FyY2gvYXJtL01ha2VmaWxlDQo+Pj4+PiBAQCAtNyw2ICs3LDcgQEAgaWZuZXEgKCQo
Q09ORklHX05PX1BMQVQpLHkpDQo+Pj4+PiBvYmoteSArPSBwbGF0Zm9ybXMvDQo+Pj4+PiBlbmRp
Zg0KPj4+Pj4gb2JqLSQoQ09ORklHX1RFRSkgKz0gdGVlLw0KPj4+Pj4gK29iai0kKENPTkZJR19I
QVNfVlBDSSkgKz0gdnBjaS5vDQo+Pj4+PiANCj4+Pj4+IG9iai0kKENPTkZJR19IQVNfQUxURVJO
QVRJVkUpICs9IGFsdGVybmF0aXZlLm8NCj4+Pj4+IG9iai15ICs9IGJvb3RmZHQuaW5pdC5vDQo+
Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2Rv
bWFpbi5jDQo+Pj4+PiBpbmRleCAzNjEzOGMxYjJlLi5mYmI1MmY3OGYxIDEwMDY0NA0KPj4+Pj4g
LS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9t
YWluLmMNCj4+Pj4+IEBAIC0zOSw2ICszOSw3IEBADQo+Pj4+PiAjaW5jbHVkZSA8YXNtL3ZnaWMu
aD4NCj4+Pj4+ICNpbmNsdWRlIDxhc20vdnRpbWVyLmg+DQo+Pj4+PiANCj4+Pj4+ICsjaW5jbHVk
ZSAidnBjaS5oIg0KPj4+Pj4gI2luY2x1ZGUgInZ1YXJ0LmgiDQo+Pj4+PiANCj4+Pj4+IERFRklO
RV9QRVJfQ1BVKHN0cnVjdCB2Y3B1ICosIGN1cnJfdmNwdSk7DQo+Pj4+PiBAQCAtNzY3LDYgKzc2
OCw5IEBAIGludCBhcmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4+ICAg
ICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSAmJiAocmMgPSBkb21haW5fdnVhcnRfaW5pdChk
KSkgKQ0KPj4+Pj4gICAgICAgICBnb3RvIGZhaWw7DQo+Pj4+PiANCj4+Pj4+ICsgICAgaWYgKCAo
cmMgPSBkb21haW5fdnBjaV9pbml0KGQpKSAhPSAwICkNCj4+Pj4+ICsgICAgICAgIGdvdG8gZmFp
bDsNCj4+Pj4+ICsNCj4+Pj4+ICAgICByZXR1cm4gMDsNCj4+Pj4+IA0KPj4+Pj4gZmFpbDoNCj4+
Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4+IGluZGV4IGM1YWZiZTJlMDUuLmY0Yzg5YmRlOGMgMTAw
NjQ0DQo+Pj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4+ICsrKyBi
L3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4+Pj4gQEAgLTMwNTMsNiArMzA1Myw5IEBA
IHZvaWQgX19pbml0IGNyZWF0ZV9kb20wKHZvaWQpDQo+Pj4+PiAgICAgaWYgKCBpb21tdV9lbmFi
bGVkICkNCj4+Pj4+ICAgICAgICAgZG9tMF9jZmcuZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfaW9t
bXU7DQo+Pj4+PiANCj4+Pj4+ICsgICAgaWYgKCBpc19wY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCgp
ICkNCj4+Pj4+ICsgICAgICAgIGRvbTBfY2ZnLmZsYWdzIHw9IFhFTl9ET01DVExfQ0RGX3ZwY2k7
DQo+Pj4+IEkgdGhpbmsgSSdtIGNvbmZ1c2VkIHdpdGggdGhpcy4gWW91IHNlZW0gdG8gZW5hYmxl
IHZQQ0kgZm9yIGRvbTAsIGJ1dA0KPj4+PiB0aGVuIGRvbWFpbl92cGNpX2luaXQgd2lsbCBzZXR1
cCB0cmFwcyBmb3IgdGhlIGd1ZXN0IHZpcnR1YWwgRUNBTQ0KPj4+PiBsYXlvdXQsIG5vdCB0aGUg
bmF0aXZlIG9uZSB0aGF0IGRvbTAgd2lsbCBiZSB1c2luZy4NCj4+PiBJIHRoaW5rIGFmdGVyIHRo
ZSBsYXN0IGRpc2N1c3Npb25zLCBpdCB3YXMgZGVjaWRlZCB0byBhbHNvIGluc3RhbGxlZCB0aGUg
dnBjaQ0KPj4+IGhhbmRsZXIgZm9yIGRvbTAuIEkgd2lsbCBoYXZlIHRvIGxvb2sgaW50byB0aGlz
IGFuZCBjb21lIGJhY2sgdG8geW91Lg0KPj4+IEBPbGVrc2FuZHI6IENvdWxkIHlvdSBjb21tZW50
IG9uIHRoaXMuDQo+PiBZZXMsIHdlIGRvIHRyYXAgRG9tMCBhcyB3ZWxsLiBUaGUgRG9tMCB0cmFw
cyBhcmUgbm90IGluIHRoaXMgc2VyaWVzLCBidXQNCj4+IGFyZSBpbiBtaW5lIGFzIGl0IG5lZWRz
IG1vcmUgcHJlcGFyYXRvcnkgd29yayBmb3IgdGhhdC4gUGxlYXNlIHNlZSBbMV0NCj4gDQo+IFRo
ZW4gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgc2V0IFhFTl9ET01DVExfQ0RGX3ZwY2kgZm9yIGRv
bTAgaGVyZSwgaXQNCj4gc2hvdWxkIGluc3RlYWQgYmUgZG9uZSBpbiB0aGUgcGF0Y2ggd2hlcmUg
ZG9tMCBzdXBwb3J0IGlzIGludHJvZHVjZWQuDQoNCk9rIEkgd2lsbCBjaGVjayB0byByZW1vdmUg
dGhpcyBhbmQgaW5jbHVkZSB0aGUgY2hhbmdlIGluIHY2Lg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoN
Cj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCg==

