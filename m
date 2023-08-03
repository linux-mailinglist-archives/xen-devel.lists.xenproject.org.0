Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2B276E352
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 10:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576088.901837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTrp-0007pI-3h; Thu, 03 Aug 2023 08:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576088.901837; Thu, 03 Aug 2023 08:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTrp-0007ms-07; Thu, 03 Aug 2023 08:39:33 +0000
Received: by outflank-mailman (input) for mailman id 576088;
 Thu, 03 Aug 2023 08:39:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3G/A=DU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qRTrn-0007mk-PP
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 08:39:31 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42b32575-31d9-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 10:39:29 +0200 (CEST)
Received: from AM0PR04CA0116.eurprd04.prod.outlook.com (2603:10a6:208:55::21)
 by VI1PR08MB5408.eurprd08.prod.outlook.com (2603:10a6:803:130::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 08:39:20 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:55:cafe::e9) by AM0PR04CA0116.outlook.office365.com
 (2603:10a6:208:55::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20 via Frontend
 Transport; Thu, 3 Aug 2023 08:39:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47 via Frontend Transport; Thu, 3 Aug 2023 08:39:19 +0000
Received: ("Tessian outbound f5de790fcf89:v145");
 Thu, 03 Aug 2023 08:39:19 +0000
Received: from 80dc86cb0a2b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 272FC1CD-FB26-4604-B345-2468A09FF1D5.1; 
 Thu, 03 Aug 2023 08:39:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 80dc86cb0a2b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Aug 2023 08:39:08 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9617.eurprd08.prod.outlook.com (2603:10a6:20b:60a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 08:39:04 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 08:39:02 +0000
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
X-Inumbo-ID: 42b32575-31d9-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24UuytHTGu6W1sbBtxfuRtUA8GkKrUW9H/7CxJT7wNM=;
 b=43FsXKkm3bcuHgQTJMLATplBLoOYQzCZKdhXAZKA3vSUOvYS0/plDxNY0xDCbc9GeESPpNAH+BqP9MDj349fseldULRU31duuceQu3nqW/M/wX1hNKYYftFOuEjS+cOcJOwCZpANxlVXs6lIDshI/c2b2UXmdioQMSxLZt+2o+8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 64fe5bd1c2aa6dc6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZ23lFN038n8ZDBXy5oii3/ePupS7J/kaPHidYXZmmEpu8QJ7EGJcLNBO7rR4qBC3hyrmNUtpDymxG+XLW4ToAjW6kC8woT/AP41RqkXWNIyHpfap39HfoiiD/KctQq217kAxjK+uAu3KXGohse9u0eScvXMOE/gBa8oT70uFkUy5jOiJiUbDM4VDTSqzFhFusQBMh1yI28UdOxK7gCpK9n0WrixClNUqV884gPe2lZy/L3x4xxe9g6cxYU1X1/rogNXxeweSk251mg6XFi430/mF5bFZPiroiSlQbjSuzqV52dsBkv0ddaQe9IQMBkMeWRkAVBFhjdqJbJRnAo8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24UuytHTGu6W1sbBtxfuRtUA8GkKrUW9H/7CxJT7wNM=;
 b=adWpHjqwX+wWLqy+zQvB70oD4OAMaWtRvOf61f/K8LGPSaS/9VwLskEPpQabQ/XQOG3Bz+E/aTdG02/IKpHRh21K6liN6+B5W9bdprLdxDAEyVLwgqQxZXb2EqBrW4MGhR8GoCuKyMG3cvrHnWynushMFWeHzV9wLIAFf8fRFe+wiyYbW/up2xd5Nc4rbNAB3lnNbt9oKX33Mr8rftmbM12J4jXURfcWY6FEMX0ivvl0ZANwqdFiJYSO3aIttBnUnOGEOi8wTfWFV1HXGYYSjrtu9Yy9/2N0rERjk01GvZHImvGmOMPpG9QrkCzKZL5IPemGMuC/BxcYbrKQawZOeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24UuytHTGu6W1sbBtxfuRtUA8GkKrUW9H/7CxJT7wNM=;
 b=43FsXKkm3bcuHgQTJMLATplBLoOYQzCZKdhXAZKA3vSUOvYS0/plDxNY0xDCbc9GeESPpNAH+BqP9MDj349fseldULRU31duuceQu3nqW/M/wX1hNKYYftFOuEjS+cOcJOwCZpANxlVXs6lIDshI/c2b2UXmdioQMSxLZt+2o+8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Topic: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Index:
 AQHZxUjDKmzjB69oo0mbnCqJ2MJvKa/XEDgAgAAEZQCAAAGbgIAABJqAgAArPoCAAOPegIAABcoAgAAIA4CAAAcSgIAAAn4A
Date: Thu, 3 Aug 2023 08:39:02 +0000
Message-ID: <BD156163-5EA0-4497-9A44-F32CB257DA4C@arm.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
 <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
 <8c8f2564-935b-e3c8-ad15-348135140a53@amd.com>
 <92AE30B2-B2CE-465F-A6FC-A86961BED85A@arm.com>
 <9d40bd81-dc3a-0288-8f8a-1de62dc30d1d@xen.org>
 <1a364aa9-4549-80b9-4319-d91551f228bd@amd.com>
 <8516a6bb-8321-fc84-c7ce-10a7b41ecb59@xen.org>
 <33DCC5E2-7190-464C-B25A-68BC68CA4021@arm.com>
 <3942c22a-80e1-29bd-4bd8-15d4bc43d220@xen.org>
In-Reply-To: <3942c22a-80e1-29bd-4bd8-15d4bc43d220@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB9617:EE_|AM7EUR03FT009:EE_|VI1PR08MB5408:EE_
X-MS-Office365-Filtering-Correlation-Id: e910746c-1a42-4f4a-364c-08db93fd2122
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 j6dKEaeu9v7FoOJAuYVf50/oruq1Kae+agxyJm9G010LsI0L5T/sqK3L5uMA9zGBKkS+4hRVqbFSqBP3cZD+rYDTEv0qQHzM6iVFjMjyKHd6Qi44aws1GsV6HBQ5oCS8pUrCu5DMkuDfhaWnBiPe/jnk45wvYB9H/nchgBJ5Ss8yp5h/nku++CYOo1q6XzgXVpx2RW4le3WZ5UjT6va/QAh8N/EJ//j9tZpuR7EOO9ap5ns0zi9ehlTuMWKihCBvft309Yu4TkJa7S4sPBcTmkY1NN0H0sLpaPGOx/qHBvsEtfHCbzJ453vJjTyHpxaWcXeDBHW/GRUv4C54C9b2Yccy7fPgnFPpp7DpzEXAlc/Ua1KPS8MEky0guB9KsuwPSinthddRHtqSZuNDNrPNm4xckap24TIHmtGzbih5AG7rl9LclrPdightIQ+sQ1ce+mAqKsoXs4f0I2p8kdrwU+H2D8uB6wjvNFJB8nbFeSCxhEAzCglA6Akc4gxazMKVh5YsZU1tm/oxHyN/2W15Oahqtf1ZSRZaplwCYJbc/Q0e1OHC1edMB+WVVQrHlJqYdkvYMNoQbdjrq0GXQX9puekr8Yc18u4E+k026aeAnMqkpqesixhkm1EdSxwP5dhJpCKHlHGi+dK039SLeC3B5w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199021)(38070700005)(36756003)(86362001)(33656002)(54906003)(478600001)(38100700002)(122000001)(41300700001)(2616005)(83380400001)(186003)(26005)(6506007)(53546011)(8936002)(8676002)(6512007)(6486002)(71200400001)(66556008)(6916009)(5660300002)(4326008)(316002)(66476007)(66446008)(64756008)(2906002)(66946007)(91956017)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C139B71E69A115488FE772A50E08B165@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9617
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1732d8af-f9eb-40af-6bc6-08db93fd1744
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hzkpuR2sqAJyKs1Sk7NDEfc8SAE6dV4RcjSGILTuqa9cBo84kCiRlamgynKv6SCVNfqyBwjiFW55w+g/m1r5DAuXqZIS4ojl1375rDrqEmpCUFJbDfzxkHJVHZVczCqSspUYDOtB9gNEB8f+U+Jy5ig3fDd2exZg+dY22bI8fg7L8w8FRY3WD8CymrQ2GXryArs41PebX9NKq6Ip2fybaxLLsEG4pfIikGOscy/z7ZN1i70N4JQZ/ck5RZozHtyvWnppmokHXGJS/G4qnhUBjjbRax+QVn2q4rHoGdOifnquSXDAmE5hXxmccXtSbOn8oFyxBCwPY2IWso2e7VgSX624G4nMyllfIbGbsRmjrNCXakojlwLaKs0AMvu+lmg06XBakAvIaTYiSl9PJDMdKdcvGPaoyU3wEOcy/CMoZ8M/7GVND3VHAahuKnvAjQiUM+N4tfRqy0Q3jiDAN52y6Fewp/4Qc788ezvoqgp17QKd7MzmvzkKhIjwdUrCpWktTj/3wUAKwy7JFfQdv0KqU8AYuZfjQqCE/zXZ5qHb/tUZSKcJ4CQS7Il6n/4uahx7KssbhqW8dJdrcM6O21NFxTvjNQVNqIXUgaT300H/Lf5n56+RbQ8a6hpzsc36/eYrPVHbA/yTxiu5yrXze+LfM2jlaTF8BqVCCUWFy4uqH45E5A2KFX/rj1Lx5phD/Hy12C7K6GsApZLkCs59Ga54T4p1qH2TNMx3sv+FIPSRmLHVOIvG7x2P131GYFXpr2RF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199021)(82310400008)(40470700004)(46966006)(36840700001)(40460700003)(2616005)(107886003)(53546011)(6506007)(83380400001)(26005)(186003)(336012)(47076005)(36860700001)(316002)(2906002)(70586007)(70206006)(4326008)(5660300002)(6862004)(41300700001)(8676002)(8936002)(6486002)(6512007)(54906003)(478600001)(40480700001)(356005)(81166007)(86362001)(33656002)(36756003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 08:39:19.4175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e910746c-1a42-4f4a-364c-08db93fd2122
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5408

DQoNCj4gT24gMyBBdWcgMjAyMywgYXQgMDk6MjksIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwMy8wOC8yMDIzIDA5OjA0LCBMdWNhIEZhbmNl
bGx1IHdyb3RlOg0KPj4+PiBUaGVyZSBhcmUgc28gbWFueSB0aGluZ3MgdGhhdCBjYW4gZ28gd3Jv
bmcgZHVyaW5nIGVhcmx5IGJvb3QgaW5jbHVkaW5nIHRoZSBlbnRpcmUgYm9vZmR0IHBhcnNpbmcN
Cj4+Pj4gYW5kIGhhdmluZyBlYXJseWNvbiB3b3VsZCBiZSBzbyBkZXNpcmFibGUuDQo+Pj4gSXQg
aXMgbm90IGNsZWFyIHdoYXQgdG8gdGFrZSBmcm9tIHlvdXIgcmVwbHkuIEVhcmxpZXIgeW91IHdl
cmUgY29uY2VybmVkIGFib3V0IHRoZSBlcnJvciBub3Qgc2hvd2luZyB1cCBpbiB0aGUgbG9nIGlm
IHRoZSAuY29uZmlnIGlzIG5vdCBjb3JyZWN0Lg0KPj4+IA0KPj4+IFRoZXJlIGlzIG5vIHJlYWxs
eSBxdWljayBmaXggZm9yIHRoYXQgYXMgYSAuY29uZmlnIG1heSB3b3JrIGZvciBwbGF0Zm9ybSBB
IGJ1dCBub3QgcGxhdGZvcm0gQi4gVGhlIG9ubHkgdmlhYmxlIHNvbHV0aW9uIGlzIGhhdmluZyBh
biBlYXJseSBjb25zb2xlLg0KPj4+IA0KPj4+IEFueXRoaW5nIGVsc2UgbGlrZSBmb3JjaW5nIHRv
IGFsd2F5cyBoYXZlIG9uZSBHSUN2WCBzZWxlY3RlZCBpcyBqdXN0IGEgaGFjayB0aGF0IHdvdWxk
IHdvcmsgZm9yIG9uZSBzZXQgb2YgcGVvcGxlIGJ1dCBub3QgdGhlIG90aGVycy4NCj4+IEkgYWdy
ZWUgd2l0aCB5b3UgaW4gcGFydCwgd2hlbiB5b3Ugc2F5IHRoYXQgaXQgd291bGQgd29yayBmb3Ig
b25lIHNldCBvZiBwZW9wbGUgYnV0IG5vdCB0aGUgb3RoZXJzLCBpc27igJl0IGl0IGFsd2F5cyB0
aGUgY2FzZT8gV2UgYXJlIHByb3ZpZGluZw0KPj4gYSBkZWZjb25maWcgdGhhdCB3b3VsZCBmaXQg
dGhlIG1ham9yaXR5IG9mIHRoZSBwZW9wbGUsIGJ1dCBpdOKAmXMgYWx3YXlzIGEgc2V0IG9mIHRo
ZW0uDQo+IA0KPiBDb3JyZWN0Lg0KPiANCj4+IE1vcmUgc3BlY2lmaWMgdG8gdGhpcyBwYXRjaCwg
d2l0aCB0aGUgcHJvdmlkZWQgS2NvbmZpZyDigJxoYWNr4oCdIGFzIHlvdSBzYXksIGl0IGlzIG5v
dCBvbmx5IHByb3ZpZGluZyB0aGUgc2FtZSB1c2VyIGV4cGVyaWVuY2UgYXMgdGhlIGN1cnJlbnQg
c3RhdGUsDQo+PiBpdCBpcyBkb2luZyBtb3JlLCBpdCBpcyBwcm92aWRpbmcgYSB3YXkgdG8gZXhj
bHVkZSBmcm9tIHRoZSBidWlsZCB0aGUgR0lDdjIgd2hpY2ggaXMgbm90IHBvc3NpYmxlIGN1cnJl
bnRseSwgdGhpcyB3b3JrIGFpbXMgdG8gcHJvdmlkZSBhIG1vcmUNCj4+IGZpbmUgZ3JhbnVsYXIg
Y29uZmlndXJhdGlvbiBzbyB0aGF0IGV4cGVyaWVuY2VkIHVzZXJzIGNhbiByZW1vdmUgZW50aXJl
IG1vZHVsZXMgdGhhdCB0aGV5IGRvbuKAmXQgbmVlZCBpbiB0aGVpciBwbGF0Zm9ybSBzbyB0aGF0
IHRoZXkgZG9u4oCZdCBoYXZlDQo+PiB0byB0YWtlIHRoZW0gaW50byBhY2NvdW50IHdoZW4gZ29p
bmcgdG8sIGZvciBleGFtcGxlLCBzYWZldHkgY3JpdGljYWwgYXVkaXRzLg0KPiANCj4gVGhlcmUg
c2VlbXMgdG8gYmUgc29tZSBtaXN1bmRlcnN0YW5kaW5nIGFib3V0IHRoZSBoYWNrIEkgYW0gcmVm
ZXJyaW5nIHRvLiBUaGlzIGlzIG5vdCBhYm91dCB0aGUgcGF0Y2ggaXRzZWxmIGJ1dCB0aGUgZm9s
bG93aW5nIGxpbmU6DQo+IA0KPiBzZWxlY3QgR0lDVjIgaWYgIUdJQ1YzICYmICFORVdfVkdJQw0K
PiANCj4gTm93IHRoYXQgR0lDdjIgY2FuIGJlIGRlc2VsZWN0aW5nLCBJIHNlZSBubyBwb2ludCB0
byBmb3JjZSBzZWxlY3QgR0lDVjIgaWYgR0lDVjMgaXMgbm90IHNlbGVjdGVkLg0KDQpPayBJIHNl
ZQ0KDQo+IA0KPiBBcyBJIHdyb3RlIGVhcmxpZXIsIHRoZXJlIGlzIHNvIG1hbnkgd2F5IGZvciBz
b21lb25lIHRvIGNyZWF0ZSAuY29uZmlnIHRoYXQgaXMgd3Jvbmcgb3IgZG9lc24ndCBib290IG9u
IHRoZWlyIHBsYXRmb3JtLiBTbyBzb21lb25lIHR3ZWFraW5nIC5jb25maWcgc2hvdWxkIGFsd2F5
cyBiZSBjYXJlZnVsIHdoZW4gc2VsZWN0aW5nL2Rlc2VsZWN0aW5nIG9wdGlvbnMuDQoNClllcyBp
bmRlZWQNCg0KPiANCj4+IEkgYWdyZWUgd2l0aCB5b3UgdGhhdCBlYXJseWNvbiB3b3VsZCBiZSBw
ZXJmZWN0LCBzbyB0aGF0IHdlIGNvdWxkIG1ha2UgdGhlIHVzZXIgcmVtb3ZlIGV2ZXJ5IG1vZHVs
ZSBhbmQgbGV0IGhpbSBrbm93IHF1aWNrbHkgdGhlIGlzc3VlLA0KPj4gYnV0IG9uIHRoZSBvdGhl
ciBoYW5kIGl0IGlzIGEgY29tcGxldGUgbmV3IGZlYXR1cmUgdGhhdCB5b3UgYXJlIHJlcXVlc3Rp
bmcgKGFyZSB5b3U/KSB0byBtYWtlIHRoaXMgcGF0Y2ggZ28gZm9yd2FyZC4NCj4gDQo+IEkgZGlk
bid0IHN1Z2dlc3QgaXQuIEkgd2FzIG1ha2luZyB0aGUgcG9pbnQgdGhhdCBpZiB5b3UgaGF2ZSB0
aW1lLCBpdCBpcyBiZXN0IHRvIHNwZW5kIGl0IHRyeWluZyB0byBlbmFibGUgdGhlIGVhcmx5IGNv
bnNvbGUgcmF0aGVyIHRoYW4gdHJ5aW5nIHRvIHByZXZlbnQgdGhlIHVzZXIgdG8gZGlzYWJsZSBi
b3RoIEdJQy4NCg0KSXQgd2lsbCBiZSBmb3Igc3VyZSBzb21ldGhpbmcgSSB3aWxsIGludmVzdGln
YXRlLCBidXQgaW4gdGhlIG1lYW4gdGltZSB1bmZvcnR1bmF0ZWx5IEkgd29u4oCZdCBoYXZlIHRp
bWUgYXQgbGVhc3QgdW50aWwgT2N0b2Jlcg0KdG8gZXZlbiBzdGFydCBhbiBpbnZlc3RpZ2F0aW9u
Lg0KDQpJIHdvdWxkIGxpa2UgdG8gYXNrIGlmIHlvdSBzZWUgdGhpcyBvbmUgZ29pbmcgZm9yd2Fy
ZHMgb3Igbm90IChhcyBpdCBpcyksIGJlY2F1c2UgSSBoYXZlIGEgc2V0IG9mIHBhdGNoZXMgdG8g
aXNvbGF0ZSBhbmQgS2NvbmZpZy1vdXQNCnRoZSBkb20wbGVzcyBjb2RlLCB0aGF0IGlzIGRlcGVu
ZGluZyBvbiB0aGlzIG9uZSAoZm9yIGEgc21hbGwgYml0KSBhbmQgYmVmb3JlIHNlbmRpbmcgdGhl
bSBJIG5lZWQgdG8gdW5kZXJzdGFuZCBpZiB0aGlzIG9uZSBjYW4NCnNlZSB0aGUgbGlnaHQgb3Ig
bm90Lg0KDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

