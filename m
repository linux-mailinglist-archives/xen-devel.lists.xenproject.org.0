Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA72973D182
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 16:33:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554853.866267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDQni-0007Rj-OO; Sun, 25 Jun 2023 14:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554853.866267; Sun, 25 Jun 2023 14:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDQni-0007Pr-LY; Sun, 25 Jun 2023 14:33:14 +0000
Received: by outflank-mailman (input) for mailman id 554853;
 Sun, 25 Jun 2023 14:33:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E8ji=CN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qDQnh-0007Pl-91
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 14:33:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3610cfde-1365-11ee-b237-6b7b168915f2;
 Sun, 25 Jun 2023 16:33:12 +0200 (CEST)
Received: from DUZPR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::19) by AS2PR08MB9151.eurprd08.prod.outlook.com
 (2603:10a6:20b:579::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 14:33:07 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c3:cafe::51) by DUZPR01CA0011.outlook.office365.com
 (2603:10a6:10:3c3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.32 via Frontend
 Transport; Sun, 25 Jun 2023 14:33:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.15 via Frontend Transport; Sun, 25 Jun 2023 14:33:07 +0000
Received: ("Tessian outbound 52217515e112:v142");
 Sun, 25 Jun 2023 14:33:07 +0000
Received: from a39d50f82303.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 41B70822-4154-4A81-83EC-A10492C83223.1; 
 Sun, 25 Jun 2023 14:32:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a39d50f82303.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 25 Jun 2023 14:32:59 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB7642.eurprd08.prod.outlook.com (2603:10a6:102:260::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 14:32:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6521.026; Sun, 25 Jun 2023
 14:32:55 +0000
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
X-Inumbo-ID: 3610cfde-1365-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFYCUJMn7nLyfNMjYqJvs8tm3Wlt9BfMr+Bf/klKkAw=;
 b=MseqwgH34eE4dhXggna7g1NTn9UdwixNc2JYw+ubNA2IEe+dAfe91JoLffo4+uzLTZJOE6DkZADQVM5Kjham+NufoEnc3QqPR73tAI27TSD9uCuGh13FLJJimtkE68AX46jLAp4UC3RjfpsCVkQqFZhN0WRaOHe/YvaW4A9o74A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 497fefe026710c5f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aD685B64IjB4USQwS3FIiUy7WaChX+itV7A8OIeoYEs83WlM5HA/GDbW6U5lHFBh2M1tOFOmhJ7xwbrDXYcPNov0QCPfMAm43IG/K1zV67Y8QrZRyI+ZGr00Tse72mMlpM5UCXu/6u7/8qi9epSQcsrU6aaQLUAvshHQQQZ41nt8o8mzCUu8MpNah7vxdD0AwRJ9VdVHhiuc/V5W8YIHnzVEbZRDV/co2CsbNijYPyj0YkvDBgLE8eUCDckcZdxqF7uSRkF9zGgM+GaJVWZnrmeJLRWidWz4PwY3nB06sVpSBt6mFfqD2JV08b67tZEatfb9HyoyMfqaum8qx1eyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFYCUJMn7nLyfNMjYqJvs8tm3Wlt9BfMr+Bf/klKkAw=;
 b=PC4X5QKSTwbuLr7frIwRoNulCrzMdp149A4rRwB9czqX1A2iJF/+ThYBpBuLqP6EMh6LfhIbMsdIvu1SOAE1KzeEZ8P2PcnnWdUjXB0DJr2Yejgq8xjOygDwImObGTo2wwMpLN8yLRIgaA+lIOYclhLdvENZ+vn0AVhlpg4TyjvNBaGwoEb+fpQMXoD7GPnMu8pYFCIPv97SrAWX6XJ/Ev+QDj5PDpG7NAdTT9cKwdhaMuaAL9mOjv2xy0+q5AVKawdJVmDg+i2N6Cwcd8z01uCBW1yLcVNcp4OVgxlHDT+QX+SedUCnlAgW/o87kM72o/8iLdH/gyjJhvQ/gEcS8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFYCUJMn7nLyfNMjYqJvs8tm3Wlt9BfMr+Bf/klKkAw=;
 b=MseqwgH34eE4dhXggna7g1NTn9UdwixNc2JYw+ubNA2IEe+dAfe91JoLffo4+uzLTZJOE6DkZADQVM5Kjham+NufoEnc3QqPR73tAI27TSD9uCuGh13FLJJimtkE68AX46jLAp4UC3RjfpsCVkQqFZhN0WRaOHe/YvaW4A9o74A=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: "stewart.hildebrand@amd.com" <stewart.hildebrand@amd.com>
Subject: xen summit 2023 design session: Upstreaming PCIe passthrough on ARM
Thread-Topic: xen summit 2023 design session: Upstreaming PCIe passthrough on
 ARM
Thread-Index: AQHZp3HuskwJAQrEp0CUJDcD40iX2A==
Date: Sun, 25 Jun 2023 14:32:55 +0000
Message-ID: <63D0DFC4-258D-43A1-9D99-3E46220CBD24@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PA4PR08MB7642:EE_|DBAEUR03FT023:EE_|AS2PR08MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a229f1-0f8a-4fcb-330f-08db758917d7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 n+Tij93I/CxPhQ/3Uxib26ijL404q3kR1if7zGnIXJnNp0q5PpuLuEsHD2CHhn/+SQKtGMPDZ3LGj5/R8Wa9JjO1tUJShMo5Fezp0++GkYtMndGJc/QuifJrclUDS+Xucu9g6XWyaBgey13i9iVVs0ITQ4E5gKWshHb2eyNVyz9FGKeYoW9Cb/dFxnqRTJ2pC2TLofq6tuQnV9LRn2VkUrO2eXw/Vm9+zkH3EK8slegXph8aNM7XOcEur0p6iINzrQvV4kH/0Qj1cqGCSNhhgrpLgfSyydHUkmRTxBKOYilQbM1HDwBAEtM3sgnIbQowy0M/wqsTd+RN9U/pDsapuhzORe0bPW4VKVnzGlMrtPHMUUK+Ke6x+yEdAKRBC/I8BD0B4DKJ7cjIVS5fXerRYdjBzZkINjiHk9T3I9k1XW3yqngMYnm/fh7KhMAexKlrTNd/cDH4S2Gm2k+DLxjIBbvb43JZ47NIhcTwke3KH8evY/NIwGXCInWkaNUujuGjrGfruoQbYrO72DAArWVmdZlMnjqcWpMWRHEQjIYMNurcbDdMI+AxRXEbKgt0jDz+WGPURWiA4xBTFoqC4vXrpw3BbDlCFDIbP77vMIGwpq5syoQF5y8RpvjqjFOmCRara4Ups1qZHwltrJnQ06W9jg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(5660300002)(4326008)(6916009)(33656002)(316002)(66476007)(66946007)(66556008)(66446008)(64756008)(478600001)(36756003)(91956017)(76116006)(66899021)(8676002)(8936002)(2906002)(86362001)(38070700005)(41300700001)(6486002)(71200400001)(6512007)(6506007)(26005)(186003)(122000001)(38100700002)(83380400001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <02C68DD8F6F3C14982A77ED4DF1D7BD1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7642
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db2daca3-0076-48eb-5695-08db7589109b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	enhOulpHuAMUQEkUKYGpDej8NJ/5ehhbaWTerN8WlLOZhhxQJItwnxNAVPp2RzNhy9z3R6sAMzJEE/jbT0u5c5lZMxmY40d1UisMFOuVZn5q7nwUD7OS0Of8m5fVknA+dJrBvVD+Gh2VE/AcuvWiKSUKRzKlpvceiLGcUo1Y0+eyfC1Gxh3sCgiSKBQko+flGQnhJtTAbun+ZMEcG2ReJABqplBADMKB0hVFzopozDewzZmMbI+lSV9Dk4+32XOirN2Aty3WM9Nqw75LbZol0kuO91NE0ZbRkq1znmroHWKFGIsTOUL2QHDCr+ZtMw+AUYy4wvpi6ZW/rP2rLssfMCRK2FsvcCWH2sKMk2vqlwP5DIc6Trz1XoxiWsnbb3BMTMLf9eTGDsTibtPcoWqcuAIX4DvO3CDWtHHlRmBwWIpdJdpRDXJCDfOzIhGEsd7qv4zAO8U629TcsBZQY29xatFEqqZVyl/EufJWQ0hA3mITeuRf/UCEY8oim78X/qYpCvxa0KMd6kLEXApyI78nHsVIk3UfJGnPi242pD6nvbEDLK7EVWG0s/XYjG8dQCAFAiOGdmQ1w95gGDT3louJrU8imCwp8Ookc3t3EXdts3/3TOvkc1qL2sAP3YucJlQFLGeHBbsZyX6MVFFQnS5l/+V+pOHuBDGzOgudoxWHkNFdAZQbSxUrs3NLgoyWgzoGFpgqOjesShu79nTTA/6TNQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199021)(46966006)(36840700001)(66899021)(82310400005)(36860700001)(36756003)(33656002)(70206006)(356005)(5660300002)(6916009)(86362001)(8936002)(8676002)(41300700001)(81166007)(4326008)(40480700001)(316002)(70586007)(82740400003)(47076005)(6506007)(26005)(6512007)(2906002)(186003)(6486002)(478600001)(83380400001)(336012)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2023 14:33:07.4005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a229f1-0f8a-4fcb-330f-08db758917d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9151

LSBCZXJ0cmFuZDogd2UgYXJlIHRhbGtpbmcgYWJvdXQgdGhlIHdvcmsgZm9yIFBDSSBwYXNzdGhy
b3VnaCBvbiBBUk0gKGFuZCBQVkggW1N0ZWZhbm9dKQ0KLSBTdGVmYW5vOiB0aGUgcHJvYmxlbSBp
cyB0aGF0IGl0J3MgdGFraW5nIGEgbG90IG9mIHRpbWUgdG8gbWVyZ2UgdGhlIHNlcmllLCBob3cg
dG8gbWFrZSBwcm9ncmVzcz8NCiAgU3Rld2FydCBpcyBhbGxvY2F0ZWQgb24gdGhhdCwgb3JpZ2lu
YWwgd29yayBmcm9tIGVwYW0gYW5kIGFybSwgdGhlIGZlYXR1cmUgd29ya3MsIGlzIG5vdCBwZXJm
ZWN0LCBidXQgaXQncyB0ZXN0YWJsZS4NCi0gSmFuOiBtYWluIHByb2JsZW0gaXMgdGhlIGxvY2sN
ClsuLi5dDQotIFJvZ2VyOiB0aGUgbGFzdCBzdGF0dXMgaXMgbG9va2luZyBnb29kLCBtYXliZSBq
dXN0IGEgY291cGxlIG9mIGRlYWRsb2NrDQotIFN0ZWZhbm86IFNvbWUgcHJvYmxlbSBjb21lcyBh
bHNvIGZyb20gdGhlIGZhY3QgdGhhdCBjb250cmlidXRvciBhbmQgbWFpbnRhaW5lciBzaG91bGQg
c3luYw0KLSBKYW46IFJvZ2VyOiBbdGVjaG5pY2FsIGRpc2N1c3Npb24gYWJvdXQgbG9ja3MgaW4g
cGNpIHN0cnVjdHVyZXMsIGxvY2sgaW52ZXJzaW9uXQ0KLSBKYW46IFdlIHNob3VsZCBub3QgaW50
cm9kdWNlIHRvbyBtYW55IGxvY2tzDQotIFN0ZWZhbm86IEJlcnRyYW5kOiBhZ3JlZSwgd2Ugc2hv
dWxkIGV4dGVuZCBjdXJyZW50IGxvY2tzDQotIFJvZ2VyOiBNYXliZSBwZXIgZG9tYWluIGxvY2tz
IGlzIHRoZSBiZXN0IG9uZSBmb3Igbm93DQotIEJlcnRyYW5kOiBJIGFncmVlIG9uIHRoYXQsIHBh
cnRpYWxseSwgZXZlbiBpZiBpdCBpcyBub3QgaWRlYWwsIGJ1dCBmb3Igbm93IGl0IGNvdWxkIGJl
IG9rLg0KLSBSb2dlcjogSSB3b3VsZCBsaWtlIHRoZSBzZXJpZSByZWJhc2VkDQotIFN0ZWZhbm86
IHllcyBJIGNhbiBnZXQgdGhlIHBlb3BsZSB3b3JraW5nIG9uIHRoYXQgdG8gcmViYXNlIGFuZCBz
eW5jIGJldHdlZW4gdGhlbS4gd2hlbiBJIHdhcyByZXZpZXdpbmcgdGhlIGxvY2tpbmcsIGl0IHdh
cyBkaWZmaWN1bHQgdG8gcmV2aWV3IHdpdGhvdXQgdGhlIG90aGVyIHBpZWNlcy4NCi0gUm9nZXI6
IFRoZXJlIGlzIGEgc2xvdyB0dXJuIGFyb3VuZCBpbiB0aGUgbWFpbGluZyBsaXN0DQotIEJlcnRy
YW5kOiBDYW4gU3Rld2FydCBoZWxwIG9uIHRoZSBsb2NrIHByb2JsZW0gYW5kIGNvZGUgY2hhbmdl
cz8gDQotIFN0ZWZhbm86IEkgaGF2ZSAyIGFjdGlvbnMsIHN5bmMgd2l0aCBlcGFtIHRvIGhhdmUg
dGhlIHJlYmFzZSwgYW5kIHN5bmMgd2l0aCBTdGV3YXJ0IHRvIGFkZHJlc3MgaW4gYSBmYXN0IHBh
Y2UgdGhlIGNvbW1lbnRzIGNvbWluZyBmcm9tIHRoZSBtYWlsaW5nIGxpc3QNCiAtIEJlcnRyYW5k
OiB3ZSBuZWVkIHRvIG1hbmFnZSB0byBoYXZlIHRoZSBsb2NraW5nLiBXZSBuZWVkIHRvIGNvbnRp
bnVlIHJldmlldyBhbHNvIGluIGNvZGUgZnJlZXplLCBiZWNhdXNlIHdlIGNhbiByZXZpZXcgZXZl
biBpZiB3ZSBkb24ndCBjb21taXQuIFNvIG91ciBnb2FsIGlzIDQuMTkuDQogLSBKYW46IEkgdXN1
YWxseSB0ZW5kIHRvIG5vdCBzZW5kIHBhdGNoZXMgYXBhcnQgZnJvbSBidWdmaXhlcyBvbiBjb2Rl
IGZyZWV6ZSwgYnV0IGluIHRoaXMgY2FzZSBpdCBjYW4gYmUgb2sgYmVjYXVzZSB0aGlzIGZlYXR1
cmUgaXMgc3R1Y2sgZnJvbSBhIGxvbmcgdGltZS4NCg0KDQpTb3JyeSBidXQgSSB3YXNu4oCZdCBh
YmxlIHRvIHRha2UgbW9yZSByZWZpbmVkIG5vdGVzLg0KDQpDaGVlcnMsDQpMdWNh

