Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94734346D2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 10:25:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213679.371971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6uT-0001ql-RQ; Wed, 20 Oct 2021 08:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213679.371971; Wed, 20 Oct 2021 08:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6uT-0001oy-Ny; Wed, 20 Oct 2021 08:25:17 +0000
Received: by outflank-mailman (input) for mailman id 213679;
 Wed, 20 Oct 2021 08:25:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=faDG=PI=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1md6uS-0001os-74
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 08:25:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 404e9880-317f-11ec-8335-12813bfff9fa;
 Wed, 20 Oct 2021 08:25:15 +0000 (UTC)
Received: from DB9PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:10:1d9::27)
 by DB7PR08MB2955.eurprd08.prod.outlook.com (2603:10a6:5:17::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 08:25:04 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::33) by DB9PR02CA0022.outlook.office365.com
 (2603:10a6:10:1d9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Wed, 20 Oct 2021 08:25:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 20 Oct 2021 08:25:04 +0000
Received: ("Tessian outbound 2e7020cc8961:v103");
 Wed, 20 Oct 2021 08:25:03 +0000
Received: from 6a91de061fc4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E4E6FD9B-9224-4C38-92FB-A76E56450FB3.1; 
 Wed, 20 Oct 2021 08:24:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a91de061fc4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Oct 2021 08:24:46 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB7PR08MB3242.eurprd08.prod.outlook.com (2603:10a6:5:1a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 08:24:43 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 08:24:42 +0000
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
X-Inumbo-ID: 404e9880-317f-11ec-8335-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEE0kJ91wZ2EUQDlAMr6kKsHzEWC1mlTqI3sElifiAo=;
 b=hB0w6LS0Us7N2cLHMWCdZIHywr826jpr/bLEJNfmcRyqDcBoCAkL29ZHggxqjZ1ahY9IrYo8byyUdzzKoY+lm6U1CsJkyi+p4HUsC07kEFTWWWdtbbyXIVU8WYdYmcTWTjidkf5VzxU/c/WIf6QY0DElYvfInMNyS6iGYTfTS00=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6d96e6681a6622aa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLlOC5IGKPF7ba+BIUf7mOm26mOOfGilvzdidzsj7XaVN9SjqTWJKRbSPktBMXYObU5mU4b5fLHCdJ1+2m9Hb1LYWAGz44WbfMaG4o/N80PWjDlntVM2tO0fxBJ6z2YewvCQZ7yofetQk41M0eQiPs0fzq57ZN7mCvwr/FZ8bFgTzPLBsymny0jlqE42QHcMdJp/WIdA4/CKRvNApNIvUAzbkBfCjOngcZSKPuZDApJo4RYS7rCDn+IAJU5av8NSg71lheUhPVv3WmyDt9jzZwCKunJjUj6azFGHJpmAYawFhcyN8SvPyQfMQFvf3x0y8uamdsaEVTDCn5fGYtA07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEE0kJ91wZ2EUQDlAMr6kKsHzEWC1mlTqI3sElifiAo=;
 b=Xzx916X6zItikA8kHNiRgYXtULMTlxLqLzuEgInn6o5WTkXDR2hMGc9nN+p6/e950wum5cwsMMH6u6p6D4nGWzYe4hVFwkT2o+QsWQLTL7S3Coy/Qhts0KGnU1RH9w6M0cm8TaWbako+h66AdaWn0gbpVLxL7/VLQMfVGYCrGKxCIen7tsl4KwmxvImcdI9SjX9LZ7s4lIEvaTOiNjCkF2rxCbUgTDP1V/qKK68MLy6ms9WVulHRpwVL0Ws7v/ZPOxtKbvk1Ihy5p5+V6K4x5Mp+GOYecsaMt5NV5mtzJSneBoD86BfOKPw2EbkFJ0jQW46e1ukITglMd1S0rTY/7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEE0kJ91wZ2EUQDlAMr6kKsHzEWC1mlTqI3sElifiAo=;
 b=hB0w6LS0Us7N2cLHMWCdZIHywr826jpr/bLEJNfmcRyqDcBoCAkL29ZHggxqjZ1ahY9IrYo8byyUdzzKoY+lm6U1CsJkyi+p4HUsC07kEFTWWWdtbbyXIVU8WYdYmcTWTjidkf5VzxU/c/WIf6QY0DElYvfInMNyS6iGYTfTS00=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, "Oleksandr_Andrushchenko@epam.com"
	<Oleksandr_Andrushchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix exit
 path
Thread-Topic: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix
 exit path
Thread-Index: AQHXxQOsddT9Ttg6SUi4XsLpyj6SjavbhAEAgAACKICAAAM+gIAABG4A
Date: Wed, 20 Oct 2021 08:24:42 +0000
Message-ID: <67D0191A-A7A6-4124-ACD3-39E3F1494312@arm.com>
References: <cover.1634659471.git.bertrand.marquis@arm.com>
 <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
 <YW/KDHnZHz72mjuQ@MacBook-Air-de-Roger.local>
 <85549220-AF96-4913-B672-ED6795C91C3D@arm.com>
 <YW/Ok38nyeUlneky@MacBook-Air-de-Roger.local>
In-Reply-To: <YW/Ok38nyeUlneky@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d2261889-fe13-4417-f5c3-08d993a31dec
x-ms-traffictypediagnostic: DB7PR08MB3242:|DB7PR08MB2955:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB29554F5998B4EF33F848027F9DBE9@DB7PR08MB2955.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 y1+h2ejOEMbVCqVmEeDZ6l7dJOtzIFE/wI+I7rRod/IZcfRKDgF3xClbtqLaql0lPIajLOXK9NR+FaEcg5MpyAcsrpyRkkUMMifmV1bEfYJwxLfkcalJ4RoUCJL+fjbJ5bzf3lY4OKk4svJFJFu04C6nKYlhPGor7Juzgf3xHYNdrofkAw7OwWBoXdJ9B9NMEDhzVGSgjliebvvzs0JL3bxxUt1DtnnmRhEInDQj8olr/8i23bRXqEnxtbVQrilXNTINMUl8DwxnjH0sJPDOhYkUsHDvaSl5gwN5RBUYt7r4BRs3Pq8iR1yIqB7xu3FyHJy5yEaGHy+2NSdc+nDGRtieeydX1EOlY4+e4LIaasPto6EMTlE1Oobeq2yLJlXAPed/SeGk1zgNSYInZndDMvnGJtdytQ2ZvjXtP3u04KyVqvvOzM+iKvDgrq210LyvKdDIOnXyLiF/QfNCoLICRNWdfyTTD8ETiwzj/7VOsIpWIiIk+I6/rPpLkGKCtCK3XJkXDoM3Hw3QLPchAHqD1HDV2KAJ0b4kYGJoKUnOzyxxfPLvN9Z+CJW0eJ6Dire4iD0F2wJYBGS9vJ/7mMCA+5kmyVKoUBKKWXHPUXi6UILtSHFz3z8HKGLPn7C83OyAR10kfEDiHqKxqTk4RQ5fY+TJxgH/zBL2voAx3sZUO9SQgwkWslV8GJV6r4jzHMadgnvIbqPfCIIPSpeOF6qlPlBl1gCULbvunUTmfNd3HZtZTC44He3d+M5S1o5kpi2L
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6506007)(6486002)(5660300002)(508600001)(91956017)(4326008)(6916009)(76116006)(64756008)(66556008)(66476007)(7416002)(53546011)(186003)(8936002)(26005)(2906002)(86362001)(38100700002)(33656002)(316002)(54906003)(66946007)(2616005)(38070700005)(83380400001)(66446008)(36756003)(6512007)(122000001)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <72F4B476F1D8C847942F51A155D686DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3242
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	165486a3-0707-46ba-ebea-08d993a31143
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QRbP9ZvQ9uWyJXx/Is1F4hlxilF1V3zsCSd2Sddy5l8M2hKL9MEkmr0nOA0HzwuoCeaftsg2+tsCHR0llogtm2RkNYnQ1DplYEtUz8/yKTKL5GBiW0a5DmRGLeYU7f5yJBqZ62JeBzCrPOzIYmfYfAS+jB36wVVPz0LlkQDi228XkvutDdekSgr+cKIAI+e6/9HM44wLGkCi+j/WglXuhXOKUIXBJS5WkQPyL2CFtMoTRz8gXJ5q8jUBnT3UvMeoEpxkZkEspK6496Z9qOsJxJgputzy7jf/kqAbbnpM98gsyB514hNFwsbD3pl7egSGHVJ/4UwtDa7KEVFS+HF0yUHPrCOqzn/A/QNcJMAJPi6FLrXfYf5t0D55TEP4Qmtok6nQ7rpFoLvwYtKA2ac5LSQsL9gyzkwChBNIBPmIdTO0BFAQPgQ2x2LGb4zKowqUNEpfywBAunUgl4WzRWAhZkgp4xx61IJWqSbuSBCrwWREPp4OVmZT1j+zLoW19wsKyLeI4SfENEBBxzsRWHJXqzNYf/kHDMyYy6a7KtYwWafp2LFeXNhCVtRv5mVDbda3tcOpS/3uIEbWf+W5ACeMWwMRebTT7KrxtXvGdi7gFjL5wFrUeXMGAiY5FpC8RUI+qYA5Pr9IFRShPun1UA6RDaotRF8mkSHDxS0Y0nsLxh+8eFos37u0r7h3GLsyICtmBKG14pFVfYvvoi262jIr0A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(33656002)(508600001)(8676002)(6512007)(6506007)(53546011)(47076005)(82310400003)(4326008)(6862004)(356005)(6486002)(336012)(81166007)(186003)(54906003)(86362001)(8936002)(26005)(70206006)(36860700001)(70586007)(83380400001)(36756003)(316002)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 08:25:04.0556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2261889-fe13-4417-f5c3-08d993a31dec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2955

SGkgUm9nZXIsDQoNCj4gT24gMjAgT2N0IDIwMjEsIGF0IDA5OjA4LCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIE9jdCAyMCwgMjAy
MSBhdCAwNzo1NzoxNUFNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGkgUm9n
ZXIsDQo+PiANCj4+PiBPbiAyMCBPY3QgMjAyMSwgYXQgMDg6NDksIFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiBUdWUsIE9jdCAxOSwg
MjAyMSBhdCAwNTowODoyOFBNICswMTAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiBY
ZW4gbWlnaHQgbm90IGJlIGFibGUgdG8gZGlzY292ZXIgYXQgYm9vdCB0aW1lIGFsbCBkZXZpY2Vz
IG9yIHNvbWUgZGV2aWNlcw0KPj4+PiBtaWdodCBhcHBlYXIgYWZ0ZXIgc3BlY2lmaWMgYWN0aW9u
cyBmcm9tIGRvbTAuDQo+Pj4+IEluIHRoaXMgY2FzZSBkb20wIGNhbiB1c2UgdGhlIFBIWVNERVZP
UF9wY2lfZGV2aWNlX2FkZCB0byBzaWduYWwgc29tZQ0KPj4+PiBQQ0kgZGV2aWNlcyB0byBYZW4u
DQo+Pj4+IEFzIHRob3NlIGRldmljZXMgd2hlcmUgbm90IGtub3duIGZyb20gWGVuIGJlZm9yZSwg
dGhlIHZwY2kgaGFuZGxlcnMgbXVzdA0KPj4+PiBiZSBwcm9wZXJseSBpbnN0YWxsZWQgZHVyaW5n
IHBjaV9kZXZpY2VfYWRkIGZvciB4ODYgUFZIIERvbTAsIGluIHRoZQ0KPj4+PiBzYW1lIHdheSBh
cyB3aGF0IGlzIGRvbmUgY3VycmVudGx5IG9uIGFybSAod2hlcmUgWGVuIGRvZXMgbm90IGRldGVj
dCBQQ0kNCj4+Pj4gZGV2aWNlcyBidXQgcmVsaWVzIG9uIERvbTAgdG8gZGVjbGFyZSB0aGVtIGFs
bCB0aGUgdGltZSkuDQo+Pj4+IA0KPj4+PiBTbyB0aGlzIHBhdGNoIGlzIHJlbW92aW5nIHRoZSBp
ZmRlZiBwcm90ZWN0aW5nIHRoZSBjYWxsIHRvDQo+Pj4+IHZwY2lfYWRkX2hhbmRsZXJzIGFuZCB0
aGUgY29tbWVudCB3aGljaCB3YXMgYXJtIHNwZWNpZmljLg0KPj4+PiANCj4+Pj4gdnBjaV9hZGRf
aGFuZGxlcnMgaXMgY2FsbGVkIG9uIGR1cmluZyBwY2lfZGV2aWNlX2FkZCB3aGljaCBjYW4gYmUg
Y2FsbGVkDQo+Pj4+IGF0IHJ1bnRpbWUgdGhyb3VnaCBoeXBlcmNhbGwgcGh5c2Rldl9vcC4NCj4+
Pj4gUmVtb3ZlIF9faHdkb21faW5pdCBhcyB0aGUgY2FsbCBpcyBub3QgbGltaXRlZCBhbnltb3Jl
IHRvIGhhcmR3YXJlDQo+Pj4+IGRvbWFpbiBpbml0IGFuZCBmaXggbGlua2VyIHNjcmlwdCB0byBv
bmx5IGtlZXAgdnBjaV9hcnJheSBpbiByb2RhdGENCj4+Pj4gc2VjdGlvbi4NCj4+Pj4gDQo+Pj4+
IEFkZCBtaXNzaW5nIHZwY2kgaGFuZGxlcnMgY2xlYW51cCBkdXJpbmcgcGNpX2RldmljZV9yZW1v
dmUgYW5kIGluIGNhc2UNCj4+Pj4gb2YgZXJyb3Igd2l0aCBpb21tdSBkdXJpbmcgcGNpX2Rldmlj
ZV9hZGQuDQo+Pj4+IA0KPj4+PiBBZGQgZW1wdHkgc3RhdGljIGlubGluZSBmb3IgdnBjaV9yZW1v
dmVfZGV2aWNlIHdoZW4gQ09ORklHX1ZQQ0kgaXMgbm90DQo+Pj4+IGRlZmluZWQuDQo+Pj4+IA0K
Pj4+PiBGaXhlczogZDU5MTY4ZGMwNSAoInhlbi9hcm06IEVuYWJsZSB0aGUgZXhpc3RpbmcgeDg2
IHZpcnR1YWwgUENJIHN1cHBvcnQNCj4+Pj4gZm9yIEFSTSIpDQo+Pj4+IFN1Z2dlc3RlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0
cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiBD
aGFuZ2VzIGluIHYyDQo+Pj4+IC0gYWRkIGNvbW1lbnQgc3VnZ2VzdGVkIGJ5IEphbiBvbiB0b3Ag
b2YgdnBjaV9hZGRfaGFuZGxlcnMgY2FsbA0KPj4+PiAtIG1lcmdlIHRoZSAzIHBhdGNoZXMgb2Yg
dGhlIHNlcmllIGluIG9uZSBwYXRjaCBhbmQgcmVuYW1lZCBpdA0KPj4+PiAtIGZpeCB4ODYgYW5k
IGFybSBsaW5rZXIgc2NyaXB0IHRvIG9ubHkga2VlcCB2cGNpX2FycmF5IGluIHJvZGF0YSBhbmQN
Cj4+Pj4gb25seSB3aGVuIENPTkZJR19WUENJIGlzIHNldC4NCj4+Pj4gLS0tDQo+Pj4+IHhlbi9h
cmNoL2FybS94ZW4ubGRzLlMgICAgICAgIHwgOSArLS0tLS0tLS0NCj4+Pj4geGVuL2FyY2gveDg2
L3hlbi5sZHMuUyAgICAgICAgfCA5ICstLS0tLS0tLQ0KPj4+PiB4ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9wY2kuYyB8IDggKysrKy0tLS0NCj4+Pj4geGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgICAg
ICAgfCAyICstDQo+Pj4+IHhlbi9pbmNsdWRlL3hlbi92cGNpLmggICAgICAgIHwgMiArKw0KPj4+
PiA1IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQo+Pj4+
IA0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUyBiL3hlbi9hcmNoL2Fy
bS94ZW4ubGRzLlMNCj4+Pj4gaW5kZXggYjc3M2Y5MWYxYy4uMDgwMTY5NDhhYiAxMDA2NDQNCj4+
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUw0KPj4+PiArKysgYi94ZW4vYXJjaC9hcm0v
eGVuLmxkcy5TDQo+Pj4+IEBAIC02MCw3ICs2MCw3IEBAIFNFQ1RJT05TDQo+Pj4+ICAgICAgICoo
LnByb2MuaW5mbykNCj4+Pj4gICAgICAgX19wcm9jX2luZm9fZW5kID0gLjsNCj4+Pj4gDQo+Pj4+
IC0jaWYgZGVmaW5lZChDT05GSUdfSEFTX1ZQQ0kpICYmIGRlZmluZWQoQ09ORklHX0xBVEVfSFdE
T00pDQo+Pj4+ICsjaWZkZWYgQ09ORklHX0hBU19WUENJDQo+Pj4+ICAgICAgIC4gPSBBTElHTihQ
T0lOVEVSX0FMSUdOKTsNCj4+Pj4gICAgICAgX19zdGFydF92cGNpX2FycmF5ID0gLjsNCj4+Pj4g
ICAgICAgKihTT1JUKC5kYXRhLnZwY2kuKikpDQo+Pj4+IEBAIC0xODksMTMgKzE4OSw2IEBAIFNF
Q1RJT05TDQo+Pj4+ICAgICAgICooLmluaXRfYXJyYXkpDQo+Pj4+ICAgICAgICooU09SVCguaW5p
dF9hcnJheS4qKSkNCj4+Pj4gICAgICAgX19jdG9yc19lbmQgPSAuOw0KPj4+PiAtDQo+Pj4+IC0j
aWYgZGVmaW5lZChDT05GSUdfSEFTX1ZQQ0kpICYmICFkZWZpbmVkKENPTkZJR19MQVRFX0hXRE9N
KQ0KPj4+PiAtICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsNCj4+Pj4gLSAgICAgICBf
X3N0YXJ0X3ZwY2lfYXJyYXkgPSAuOw0KPj4+PiAtICAgICAgICooU09SVCguZGF0YS52cGNpLiop
KQ0KPj4+PiAtICAgICAgIF9fZW5kX3ZwY2lfYXJyYXkgPSAuOw0KPj4+PiAtI2VuZGlmDQo+Pj4+
ICB9IDp0ZXh0DQo+Pj4+ICBfX2luaXRfZW5kX2VmaSA9IC47DQo+Pj4+ICAuID0gQUxJR04oU1RB
Q0tfU0laRSk7DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVu
L2FyY2gveDg2L3hlbi5sZHMuUw0KPj4+PiBpbmRleCAxMWIxZGEyMTU0Li44N2UzNDRkNGRkIDEw
MDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TDQo+Pj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni94ZW4ubGRzLlMNCj4+Pj4gQEAgLTEzNCw3ICsxMzQsNyBAQCBTRUNUSU9OUw0KPj4+
PiAgICAgICAqKC5leF90YWJsZS5wcmUpDQo+Pj4+ICAgICAgIF9fc3RvcF9fX3ByZV9leF90YWJs
ZSA9IC47DQo+Pj4+IA0KPj4+PiAtI2lmIGRlZmluZWQoQ09ORklHX0hBU19WUENJKSAmJiBkZWZp
bmVkKENPTkZJR19MQVRFX0hXRE9NKQ0KPj4+PiArI2lmZGVmIENPTkZJR19IQVNfVlBDSQ0KPj4+
PiAgICAgICAuID0gQUxJR04oUE9JTlRFUl9BTElHTik7DQo+Pj4+ICAgICAgIF9fc3RhcnRfdnBj
aV9hcnJheSA9IC47DQo+Pj4+ICAgICAgICooU09SVCguZGF0YS52cGNpLiopKQ0KPj4+PiBAQCAt
MjQ3LDEzICsyNDcsNiBAQCBTRUNUSU9OUw0KPj4+PiAgICAgICAqKC5pbml0X2FycmF5KQ0KPj4+
PiAgICAgICAqKFNPUlQoLmluaXRfYXJyYXkuKikpDQo+Pj4+ICAgICAgIF9fY3RvcnNfZW5kID0g
LjsNCj4+Pj4gLQ0KPj4+PiAtI2lmIGRlZmluZWQoQ09ORklHX0hBU19WUENJKSAmJiAhZGVmaW5l
ZChDT05GSUdfTEFURV9IV0RPTSkNCj4+Pj4gLSAgICAgICAuID0gQUxJR04oUE9JTlRFUl9BTElH
Tik7DQo+Pj4+IC0gICAgICAgX19zdGFydF92cGNpX2FycmF5ID0gLjsNCj4+Pj4gLSAgICAgICAq
KFNPUlQoLmRhdGEudnBjaS4qKSkNCj4+Pj4gLSAgICAgICBfX2VuZF92cGNpX2FycmF5ID0gLjsN
Cj4+Pj4gLSNlbmRpZg0KPj4+PiAgfSBQSERSKHRleHQpDQo+Pj4+IA0KPj4+PiAgLiA9IEFMSUdO
KFNFQ1RJT05fQUxJR04pOw0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvcGNpLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4+PiBpbmRleCAzNWUw
MTkwNzk2Li44OTI4YTFjMDdkIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9wY2kuYw0KPj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4+
PiBAQCAtNzU2LDEwICs3NTYsOSBAQCBpbnQgcGNpX2FkZF9kZXZpY2UodTE2IHNlZywgdTggYnVz
LCB1OCBkZXZmbiwNCj4+Pj4gICAgaWYgKCAhcGRldi0+ZG9tYWluICkNCj4+Pj4gICAgew0KPj4+
PiAgICAgICAgcGRldi0+ZG9tYWluID0gaGFyZHdhcmVfZG9tYWluOw0KPj4+PiAtI2lmZGVmIENP
TkZJR19BUk0NCj4+Pj4gICAgICAgIC8qDQo+Pj4+IC0gICAgICAgICAqIE9uIEFSTSBQQ0kgZGV2
aWNlcyBkaXNjb3Zlcnkgd2lsbCBiZSBkb25lIGJ5IERvbTAuIEFkZCB2cGNpIGhhbmRsZXINCj4+
Pj4gLSAgICAgICAgICogd2hlbiBEb20wIGluZm9ybSBYRU4gdG8gYWRkIHRoZSBQQ0kgZGV2aWNl
cyBpbiBYRU4uDQo+Pj4+ICsgICAgICAgICAqIEZvciBkZXZpY2VzIG5vdCBkaXNjb3ZlcmVkIGJ5
IFhlbiBkdXJpbmcgYm9vdCwgYWRkIHZQQ0kgaGFuZGxlcnMNCj4+Pj4gKyAgICAgICAgICogd2hl
biBEb20wIGZpcnN0IGluZm9ybXMgWGVuIGFib3V0IHN1Y2ggZGV2aWNlcy4NCj4+Pj4gICAgICAg
ICAqLw0KPj4+PiAgICAgICAgcmV0ID0gdnBjaV9hZGRfaGFuZGxlcnMocGRldik7DQo+Pj4+ICAg
ICAgICBpZiAoIHJldCApDQo+Pj4+IEBAIC03NjgsMTAgKzc2NywxMCBAQCBpbnQgcGNpX2FkZF9k
ZXZpY2UodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwNCj4+Pj4gICAgICAgICAgICBwZGV2LT5k
b21haW4gPSBOVUxMOw0KPj4+PiAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4+PiAgICAgICAgfQ0K
Pj4+PiAtI2VuZGlmDQo+Pj4+ICAgICAgICByZXQgPSBpb21tdV9hZGRfZGV2aWNlKHBkZXYpOw0K
Pj4+PiAgICAgICAgaWYgKCByZXQgKQ0KPj4+PiAgICAgICAgew0KPj4+PiArICAgICAgICAgICAg
dnBjaV9yZW1vdmVfZGV2aWNlKHBkZXYpOw0KPj4+PiAgICAgICAgICAgIHBkZXYtPmRvbWFpbiA9
IE5VTEw7DQo+Pj4+ICAgICAgICAgICAgZ290byBvdXQ7DQo+Pj4+ICAgICAgICB9DQo+Pj4+IEBA
IC04MTksNiArODE4LDcgQEAgaW50IHBjaV9yZW1vdmVfZGV2aWNlKHUxNiBzZWcsIHU4IGJ1cywg
dTggZGV2Zm4pDQo+Pj4+ICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCBwZGV2LCAmcHNlZy0+YWxs
ZGV2c19saXN0LCBhbGxkZXZzX2xpc3QgKQ0KPj4+PiAgICAgICAgaWYgKCBwZGV2LT5idXMgPT0g
YnVzICYmIHBkZXYtPmRldmZuID09IGRldmZuICkNCj4+Pj4gICAgICAgIHsNCj4+Pj4gKyAgICAg
ICAgICAgIHZwY2lfcmVtb3ZlX2RldmljZShwZGV2KTsNCj4+PiANCj4+PiB2cGNpX3JlbW92ZV9k
ZXZpY2UgaXMgbWlzc2luZyBhIGNoZWNrIGZvciBoYXNfdnBjaShwZGV2LT5kb21haW4pLCBhcw0K
Pj4+IGl0IHdpbGwgdW5jb25kaXRpb25hbGx5IGFjY2VzcyBwZGV2LT52cGNpIG90aGVyd2lzZSwg
YW5kIHRoYXQgd291bGQgYmUNCj4+PiB3cm9uZyBmb3IgZG9tYWlucyBub3QgdXNpbmcgdnBjaS4N
Cj4+PiANCj4+PiBJdCBtaWdodCBhbHNvIGJlIGdvb2QgdG8gYWRkIGFuIEFTU0VSVCghcGRldi0+
dnBjaSkgdG8NCj4+PiB2cGNpX2FkZF9oYW5kbGVycyBpbiBvcmRlciB0byBtYWtlIHN1cmUgdGhl
cmUgYXJlIG5vIGR1cGxpY2F0ZWQgY2FsbHMNCj4+PiB0byB2cGNpX2FkZF9oYW5kbGVycywgYnV0
IHRoYXQgY2FuIGJlIGRvbmUgaW4gYSBzZXBhcmF0ZSBwYXRjaC4NCj4+IA0KPj4gSSBjYW4gZG8g
Ym90aCBpbiB2MyAodG9nZXRoZXIgd2l0aCB0aGUgY2hhbmdlIG9mIGluIHRoZSBwYXRjaCBuYW1l
KS4NCj4+IA0KPj4gVW5sZXNzIHlvdSB3YW50IHRoZSBBU1NFUlQgaW4gYSBkaWZmZXJlbnQgcGF0
Y2gsIGluIHRoaXMgY2FzZSBJIGRvIG5vdCB0aGluaw0KPj4gSSBjYW4gbWFrZSBhIG5ldyBwYXRj
aCBmb3IgdGhhdC4NCj4+IA0KPj4gQ2FuIHlvdSBjb25maXJtIGlmIEkgc2hvdWxkIG9yIG5vdCBh
ZGQgdGhlIEFTU0VSVCBkaXJlY3RseSBpbiB0aGUgcGF0Y2ggPw0KPiANCj4gSSdtIGZpbmUgd2l0
aCBoYXZpbmcgdGhlIGFzc2VydCBhZGRlZCBoZXJlOiBpbiB3YXNuJ3QgbmVjZXNzYXJ5DQo+IHBy
ZXZpb3VzbHkgYXMgdGhlcmUgd2FzIGEgc2luZ2xlIGNhbGxlciBvZiB2cGNpX2FkZF9oYW5kbGVy
cy4gTm93IHRoYXQNCj4gdGhlcmUgYXJlIG11bHRpcGxlIG9uZXMgd2Ugc2hvdWxkIG1ha2Ugc3Vy
ZSBubyBkdXBsaWNhdGVkIGNhbGxzIGNhbg0KPiBoYXBwZW4uDQoNCk9rIEkgd2lsbCBhZGQgaXQg
dGhlbiBhbmQgc2VuZCB2MyB0aGlzIG1vcm5pbmcuDQoNCj4gDQo+IE9uIGEgZGlmZmVyZW50IG5v
dGUgKGFuZCBub3Qgc29tZXRoaW5nIHRoYXQgc2hvdWxkIGJlIHNvbHZlZCBoZXJlLA0KPiBqdXN0
IHdhbnRlZCB0byByYWlzZSBhdHRlbnRpb24gdG8gaXQpIHRoZXJlJ3MgYW4gZXhpc3RpbmcgVE9E
TyBhYm91dA0KPiB2cGNpX3JlbW92ZV9kZXZpY2UgYmVjYXVzZSBpdCBkb2Vzbid0IGNsZWFuIHRo
ZSAybmQgc3RhZ2UgbWFwcGluZ3MgZm9yDQo+IEJBUnMuIEF0IHNvbWUgcG9pbnQgd2UgbmVlZCB0
byBzb2x2ZSB0aGlzLCBvciBlbHNlIHRoZSByZW1vdmFsIG9mIHRoZQ0KPiBkZXZpY2UgaXMgbm90
IGNvbXBsZXRlLg0KDQpJIHdpbGwgdHJ5IHRvIGtlZXAgdGhhdCBpbiBtaW5kLg0KTWF5YmUgYWRk
aW5nIGEgVE9ETyBpbiB0aGUgY29kZSB3b3VsZCBiZSBhIGdvb2QgaWRlYS4NCg0KVGhhbmtzDQpC
ZXJ0cmFuZA0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQo=

