Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FEF41BFED
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:29:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198665.352282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU27-0006gM-JT; Wed, 29 Sep 2021 07:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198665.352282; Wed, 29 Sep 2021 07:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU27-0006eW-G5; Wed, 29 Sep 2021 07:29:39 +0000
Received: by outflank-mailman (input) for mailman id 198665;
 Wed, 29 Sep 2021 07:29:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVU26-0006On-Py
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:29:38 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88aa1a4e-2a46-4fc1-b404-ca3fd44d6b92;
 Wed, 29 Sep 2021 07:29:37 +0000 (UTC)
Received: from AS9PR06CA0238.eurprd06.prod.outlook.com (2603:10a6:20b:45e::8)
 by VI1PR08MB3373.eurprd08.prod.outlook.com (2603:10a6:803:7b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 07:29:30 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::70) by AS9PR06CA0238.outlook.office365.com
 (2603:10a6:20b:45e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Wed, 29 Sep 2021 07:29:30 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 29 Sep 2021 07:29:30 +0000
Received: ("Tessian outbound 1fd2edb24cb2:v103");
 Wed, 29 Sep 2021 07:29:28 +0000
Received: from 019ffb66a0b4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 684F7AAA-E560-4CE6-AC52-8DACCAE843AD.1; 
 Wed, 29 Sep 2021 07:29:17 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 019ffb66a0b4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 07:29:17 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB5901.eurprd08.prod.outlook.com (2603:10a6:102:ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 07:29:14 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 07:29:14 +0000
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
X-Inumbo-ID: 88aa1a4e-2a46-4fc1-b404-ca3fd44d6b92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pHI4/IPOhsGJdfgmEp9Vt1QPCN0cKeOB0pTCObUcCA=;
 b=FaeuACWmYnlCC+W7fXE+40Lp3SMMTM62kABZ5cx6MLR2Yp1rtOYCCUg7Z6e2JLXPCutV2eUIVb66zzPM5gsiYCOyd0srQe07U07iVkaCFcpSOKC7nqQzBnoON4zfsmPyA+vmlFv1V+h3109UZyMkrua2Eby484woqgBmg0KXXzs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc4f99d7ef2ad4a8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmmV5hfMI3sTO98+md0MUoWinu7Nil/iulIhHFxsfq2MddNTXknUKUq0mZOLFFPpYJanttkv+lvy61w5MTGkjo/ZWxnZFfTE8P2D3LlNAhs5oVKx57K/Q33sIAjKljay6Jg9t7AeiY04wg5yes0KbouKemD0JdAPv0qw4uD0Y6Y05uXyVeJo1itmW0cqYBmZ0MdQFcmiC53NtfYOS0tfEjJ6Vt1grAmjsLRPi4zLEw6CfbLk7Y8oMqrNNMPRYhMAi7PBsGIT05gmHHn+ZQjEw1ZCqqcKmdgQMvt1Q9kRI/IHYtyTHpmSrCK7CuzLwTbrB3IKxNeJMrOVzlJvHIPzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9pHI4/IPOhsGJdfgmEp9Vt1QPCN0cKeOB0pTCObUcCA=;
 b=Nwx1GFp8UVAM22rKkA+P/BgztUw5rM8dSm6X0tZWuZs6pGDcYYAF8NKOV/5P20ctN2VEACDrex9Rd5kRLMVCjUHR8fhR5XgMAatvrpxoq+BsbAcnyo9FSVPXoDwmKrrpoH9+QMEcMsrONG1Gb+ru3SSTOvC7kd8QhizgZlMrkhp3F4mjQ2DIZeY1iWhIDET1FlCARPWQK6pi75bpgHKcET/lyrjkuPvVJyv6chlAgGDTDAv0A91Gv+fWnnbnhLJEDLHy130gb7LSX3eNO2CZZ57Z0Gf2RNk4QgBLYYYztsKPnw+0qEbiGxsgmpcM1qoy7qYIOo2U9nGKiXSKu4Avng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pHI4/IPOhsGJdfgmEp9Vt1QPCN0cKeOB0pTCObUcCA=;
 b=FaeuACWmYnlCC+W7fXE+40Lp3SMMTM62kABZ5cx6MLR2Yp1rtOYCCUg7Z6e2JLXPCutV2eUIVb66zzPM5gsiYCOyd0srQe07U07iVkaCFcpSOKC7nqQzBnoON4zfsmPyA+vmlFv1V+h3109UZyMkrua2Eby484woqgBmg0KXXzs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre
 Przywara <Andre.Przywara@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH v3 03/17] xen/arm: solve compilation error on ARM with
 ACPI && HAS_PCI
Thread-Topic: [PATCH v3 03/17] xen/arm: solve compilation error on ARM with
 ACPI && HAS_PCI
Thread-Index: AQHXtJV6dalQJX/UXEa/GQQbUgx/4qu6njuA
Date: Wed, 29 Sep 2021 07:29:14 +0000
Message-ID: <28B10A6E-6224-41F8-A368-EB8A3503A717@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <b95685e16fccf18580c094a5c57db4b83d5b4a29.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <b95685e16fccf18580c094a5c57db4b83d5b4a29.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a44e69e1-ab0d-4396-c843-08d9831ae01b
x-ms-traffictypediagnostic: PA4PR08MB5901:|VI1PR08MB3373:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3373A187764922DDD863482D9DA99@VI1PR08MB3373.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iRk4KapPK6fdJrZmlPBmy9zQqY5uUm8fTw61FzOv9X9Bc5Tql5haTLqBuObzdBQlpGvPCb/9nMffogun4YULzamTCS8UWvKszzF1gvrH41eBxoxqt9iJ3xDNRvS+Z5Ikc66aEsySm0EcL1iXbYPJIHLBfdF9UtH9WiKMxeD2HQG41zFurR2ttzrmDarnTRq8E7BinbQqvIxne5jYbg7SbggVpk7zvG57iCCLjtILT1QmfDersLZGaLhYXMd7S5QdtA2D3mAmxGcfAogN1+yL4dEnEniX7UNMvfiWctspIpa9xr2h73nIbvYFdCS/W9Iv7sa2uyKz3EeY/7QNQsq2MVunH2oxObYJUag4Ab/G/FrFGZM/3T0gjLs+jcOm6w+kjA32mQHbflhLyVYqfsSzOLtYSBa3FS0ZsvZcG7NUU3lR4HsHhtS/yjPuj83LsijrAMDlBCVWc9IiHdTvI0sXDiIzreHIzQj/vQqdJbaRXPGFE/TKNkLeKJkqSmu4ZNcX1dVf6VPdrUQ0DOlZslcTPLe0p14RZtimjSSJZQKwjPWJpP9GgTyLZXpX3pcX/kvTnGXaUi0XdEnM37ao1+zmGgWD3FidJgw0BJ4+WaDw+cb0ru/xfobhQKCG5hwYhRpNnvBvw2HU134ksUUzXL1/wwUrHlJlb4KZSqlscVs1QCRPkC5gVpZexnq1ZM4ypguR7XMWcTGXP0QSWmihb/Y/A/XupR4bocbyAA49xNJTwIcZtc+Ihh5Batwt7bUgT0BM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8936002)(6862004)(8676002)(64756008)(36756003)(186003)(122000001)(38070700005)(71200400001)(66556008)(66446008)(66946007)(33656002)(91956017)(76116006)(2616005)(66476007)(83380400001)(38100700002)(86362001)(6486002)(37006003)(6636002)(26005)(6506007)(53546011)(54906003)(2906002)(316002)(508600001)(6512007)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F44232FC889CF448D88103632C79D74@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5901
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44b5b92c-676c-4896-a1c9-08d9831ad6c8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XXXXvEaMNZJBSa+6AL04Tb6NVb6PUM4Szy3sny0SE7bsqU95bR5XW2XRf4ZOUbXVtrq21d3uztdqSPHREQ0MWm0/6xo1REveJd645RLOJallp17OQSdJJOqDHXakuEdD+otB25ch1+ikQznnzp80ftnA4I8FOmAJc9/PZGe10a3XZdAhYNSrFoUVclHWCf5v9mmeAXlVRWBrbuQJpiPigDpZF1eP145wGvHgwc4RwB24y/TeoXn2iiHqJijD6OGVm8cq0OJ27pyP8JZnor+qAgM4G2I2LI/nWKzqPXO1YZDcg8ozGxMDeAPf+3GM9TgonGa42iiMmSL56tt+u8vVaLrVbqncwRxo7y6Wiz1h96P9zSob18S+QhC1IT1TYZnSauj4AuHJsmMI29f83WS+d+BMHEvyatF3lCvK7nlsqKBpJNylDnJ4L71M2t0cyPtQD7zCGY09FfzdAEQIA6KhDJA+vI36O2u9r2CagX0kO2oroABRsCHjo+PFVNcWCmE9Lz/uQfSLmg1G3xzuasTwWTvWrSUNXKcqrlX9VgL9cZ9xW6/sQkTSMBgsoM0sZhFe9ECqCrvDRYmsUa7gZXFsyyi+BtkKLYi4AbwQNDsA6Y+8tySrvW7nlxgPhAe+Figss++vmFYfsdpX8Y+3jG+VpGNPfaG3GxI5KQ40OpsVvwWFDRt5/o0b84iXGOakfPC3w/XgrwjvPHfZHvu24J+Wqw==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(6636002)(2906002)(2616005)(82310400003)(33656002)(5660300002)(83380400001)(6862004)(356005)(508600001)(70206006)(70586007)(81166007)(336012)(316002)(54906003)(47076005)(8936002)(8676002)(6486002)(36860700001)(6512007)(186003)(26005)(53546011)(6506007)(4326008)(37006003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 07:29:30.1331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a44e69e1-ab0d-4396-c843-08d9831ae01b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3373

SGkgUmFodWwsDQoNCj4gT24gMjggU2VwIDIwMjEsIGF0IDE5OjE4LCBSYWh1bCBTaW5naCA8cmFo
dWwuc2luZ2hAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBwcmVsaW5rLm86IEluIGZ1bmN0aW9uIGBw
Y2llX2Flcl9nZXRfZmlybXdhcmVfZmlyc3TigJk6DQo+IGRyaXZlcnMvcGFzc3Rocm91Z2gvcGNp
LmM6MTI1MTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYXBlaV9oZXN0X3BhcnNlJw0KPiANCj4g
Q29tcGlsYXRpb24gZXJyb3IgaXMgb2JzZXJ2ZWQgd2hlbiBBQ1BJIGFuZCBIQVNfUENJIGlzIGVu
YWJsZWQgZm9yIEFSTQ0KPiBhcmNoaXRlY3R1cmUuIEFQRUkgbm90IHN1cHBvcnRlZCBvbiBBUk0g
eWV0IG1vdmUgdGhlIGNvZGUgdW5kZXINCj4gQ09ORklHX1g4NiBmbGFnIHRvIGdhdGUgdGhlIGNv
ZGUgZm9yIEFSTS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5n
aEBhcm0uY29tPg0KPiBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPg0KUmV2aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1
aXNAYXJtLmNvbT4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IC0tLQ0KPiBDaGFuZ2UgaW4gdjM6
IEFkZGVkIEFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+DQo+IENoYW5nZSBpbiB2MjogQWRkIGluIGNvZGUgY29tbWVudCAiQVBFSSBub3Qgc3VwcG9y
dGVkIG9uIEFSTSB5ZXQiDQo+IC0tLQ0KPiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyB8
IDMgKystDQo+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+IGluZGV4IDg5OTY0MDMxNjEuLmQ3NzRhNjE1NGUg
MTAwNjQ0DQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+ICsrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+IEBAIC0xMTUwLDcgKzExNTAsOCBAQCB2b2lk
IF9faHdkb21faW5pdCBzZXR1cF9od2RvbV9wY2lfZGV2aWNlcygNCj4gICAgIHBjaWRldnNfdW5s
b2NrKCk7DQo+IH0NCj4gDQo+IC0jaWZkZWYgQ09ORklHX0FDUEkNCj4gKy8qIEFQRUkgbm90IHN1
cHBvcnRlZCBvbiBBUk0geWV0LiAqLw0KPiArI2lmIGRlZmluZWQoQ09ORklHX0FDUEkpICYmIGRl
ZmluZWQoQ09ORklHX1g4NikNCj4gI2luY2x1ZGUgPGFjcGkvYWNwaS5oPg0KPiAjaW5jbHVkZSA8
YWNwaS9hcGVpLmg+DQo+IA0KPiAtLSANCj4gMi4xNy4xDQo+IA0KDQo=

