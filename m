Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1F342D5A3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 11:04:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209124.365477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawep-0004q9-Dn; Thu, 14 Oct 2021 09:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209124.365477; Thu, 14 Oct 2021 09:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawep-0004o5-9I; Thu, 14 Oct 2021 09:04:11 +0000
Received: by outflank-mailman (input) for mailman id 209124;
 Thu, 14 Oct 2021 09:04:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCUr=PC=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mawen-0004ny-BJ
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 09:04:09 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::61e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e57da790-d7b6-4c25-a7d2-3e8125ef714d;
 Thu, 14 Oct 2021 09:04:08 +0000 (UTC)
Received: from DB6P18901CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::28)
 by HE1PR08MB2779.eurprd08.prod.outlook.com (2603:10a6:7:35::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Thu, 14 Oct
 2021 09:03:51 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::19) by DB6P18901CA0018.outlook.office365.com
 (2603:10a6:4:16::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 09:03:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 09:03:51 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Thu, 14 Oct 2021 09:03:51 +0000
Received: from ed3cea30973c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0DC61AA-F500-43FE-AB16-C4DA868C2A1F.1; 
 Thu, 14 Oct 2021 09:03:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed3cea30973c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Oct 2021 09:03:40 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0801MB1863.eurprd08.prod.outlook.com (2603:10a6:4:76::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Thu, 14 Oct
 2021 09:03:38 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.030; Thu, 14 Oct 2021
 09:03:38 +0000
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
X-Inumbo-ID: e57da790-d7b6-4c25-a7d2-3e8125ef714d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLGDjAc3JFjg+hdZbpcgepDYy0QyW8sv7eG82AXkwws=;
 b=gjwWO2ClpTM097XPoupAVbplALEffaFqX3ZJvTiDnxsEnddfSETU9+6336EVBaf7yMyICRSOMeFpzcTqZumB1adrcuVmI+1M2o8Jf3Mwrv5QNV5cfnCfzm6jFJf0cv3vX9PGKup1T5Pkgyq6C6hwcwSV/y/VUeM5yWyIoc8e91I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28fcb08830d55b90
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2J7sioixSCxYNv4VXENMDxvkhIntPhTl4t5tDTa129nqBkZth1kj1z5VZoVul9qZObhFFP+8ChEVeNY4UTFUKPLvuu3i5mP6BHXWLVHzgmCCY3t8fPS8JF2qpF46MJWmOLZgTIx0VcnzT9/w7Rej09bzGaymd1v8Dlu71YIjTIplHYpuq+z8j/Q7+aXPTcXgJW/u1hh0DvjgUu21XWpun3kPKtCkj7pd0CZ+mhUFLDVgQcf1g+kJZpfdemyvhuq+rfmGFmRB3AAs4eqQLn7cCAes8iGQxmndiyWyembZyND+iZYLFuiMyoS4mk8VRABPFA9IQP6jXjnd80PuR08Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLGDjAc3JFjg+hdZbpcgepDYy0QyW8sv7eG82AXkwws=;
 b=mhFg3pxSZG1gP+uElGUKNWiAcMdn+CseZwV2qw2VRlQOamQGVa1H4qM0+5kEmrGjNxI1yxJtiodJsmAyw+nBSmdMCP+k3mb44ukV7+5mMRL1ZZ3o91EfyhOMepP7fdIw7kcg6VE0hmfcrbuKn3U42dlyiJir6wExg56n/he80zt4xpBH7aecy74GF1k42/BUpurU9N3bI0LxzqZHR59D4pc32a4jXJJQUk5ryQRMT6jJDcFzb7pkrPT9ruGEc5LcLAx6L+ZWvMOdEgIdp8p/e82Rp6ZmSKSy+Mg9e2pWw2NO6TCi5n5eJGR9BZWz8QSBAeWwAY4w1gHBoEhFxLPjCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLGDjAc3JFjg+hdZbpcgepDYy0QyW8sv7eG82AXkwws=;
 b=gjwWO2ClpTM097XPoupAVbplALEffaFqX3ZJvTiDnxsEnddfSETU9+6336EVBaf7yMyICRSOMeFpzcTqZumB1adrcuVmI+1M2o8Jf3Mwrv5QNV5cfnCfzm6jFJf0cv3vX9PGKup1T5Pkgyq6C6hwcwSV/y/VUeM5yWyIoc8e91I=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Rahul Singh <Rahul.Singh@arm.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index:
 AQHXutl3YqS5dHXsYk6KpdKt4d14RavQp5+AgABHSICAAB7yAIAABuOAgABGSACAALogAIAAKekA
Date: Thu, 14 Oct 2021 09:03:38 +0000
Message-ID: <72660561-2D8C-4D02-831B-E446A55B82F7@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWaco/UvA4xFE1xW@MacBook-Air-de-Roger.local>
 <6d75f604-6938-b185-61e1-a6684d9fca14@suse.com>
 <2b943774-072e-20a1-b97c-d88b24adf340@epam.com>
 <ed4876ca-7384-42a8-6fba-e73c1840402a@suse.com>
 <alpine.DEB.2.21.2110131223210.9408@sstabellini-ThinkPad-T480s>
 <fa345819-068d-0049-f0e8-8b96379b4247@suse.com>
In-Reply-To: <fa345819-068d-0049-f0e8-8b96379b4247@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3b46f26a-06c0-4599-8bac-08d98ef18aa6
x-ms-traffictypediagnostic: DB6PR0801MB1863:|HE1PR08MB2779:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB2779D1A1032F97CC946D6E649DB89@HE1PR08MB2779.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZcK79Iu02M1pz80nRkzIWT8J2CvdBgcyfPQ+yGt4GHW2aoKBHa7VJZOYUvMzgm+yRCffiNhd1iWYxzC86b9OpgOjMNAo6QtFGCwR4QrscKSpZi+ocIwT800Ut+m02nON4pYj+VoWFrFl1DHZCtBf6BZGJo95GJkbAJsm3bHORmKmM8sEKDd9loTadQmaF5gKyfWW0u3Y5HDsmWGNXqvELF8dgU0/ByTr85PNh3NBvUoRfgLjfP6OMHE6Orm4D5oYfK2nCOrQyMTC8ezmSzPC9tca9SukXYsX2keGstJXH1s1hf4ZQtvyPQp90IvRbv9EbcvT2N6cQU5iaF100gr8aiBaVH/aieeZBl4PlCmfBoytM9KLXFTcQHZQMc+bnYNr/COU6yYxTNeG7tVFmt9X7ABt0SVu7fiddKLrMFtZaJQWItSOcY/m8qzSEDgZRqkBeYjfQlOh05D3rwc/AGeEW/oP6fGRwGQs9ohX2MqEds+sYyLBNms5vYacdLLvcBT/9nAJZqT0Wr1wmtdMFxg9nteIKOc60FAY2gsr4TIhG12kPj0FkT9eqHbtvBOhCaKyn/HiQgE3bIlxVihVWv6wAqDoE2mbhEa5VePIEKJJeBK+a2c+phscwQ+329JE1Xu+MvBIE+YxnWJf4wryrjVkyuZwKooz0wo80ljib/HRmJQg75MIVyRuqoAuhgA8doomS7Alg9FYi10CP2e/FleNsBDR7BCaoNOuH1a8APpIDeVjRUzsFpP6ZPZIH2rk6den8qWHqHnS134ePnie4Gw5c9ZBlFLdGAB6RVTzWbGyUDWYy7A3bnshycPoTl8Y89H+wqPOz16Yv+tlfdZHbSIsYg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(53546011)(66446008)(966005)(508600001)(86362001)(6506007)(66476007)(6512007)(66556008)(91956017)(8676002)(66946007)(76116006)(26005)(36756003)(54906003)(64756008)(6486002)(83380400001)(8936002)(33656002)(4326008)(6916009)(316002)(186003)(2906002)(7416002)(2616005)(71200400001)(122000001)(38100700002)(5660300002)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AB0C09E1C757C4CA2FB86567794039E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1863
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e60852fb-0179-40ca-3cde-08d98ef18321
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fl3elmZY3h6CM8ebusSnqU9xuIcdNDwzzqaB/BHT5D69nkcoxwEeNY+y5LNa4e0t7emmZP26vYA/DzfGK7tsfAOfbqo3MI/OPBALAi6+HABGeWOAQjxxuRsk6s0B6/7a/gslbm+CxihMv99+i/TKiiGOUYyLOIzrQCFjQpDDId00iBKArZAln09GyKlXvm5/TEoSXCNNNI+I3/tj56gEAr8EsDKlGViTvN5Zl5f90qBqnJp2mcKcCDx4BByA0LmdIXA5lCikgGyonn92gVNwFRqbPVk1rLUQ32flvrEAWxPNPMiTlax6mI0UBP/LAB6Rxl3rCQivUGB/LeP/CAx+f0AqGo42/BweMdiNn/QLcS/xRrT1DlV1RR4j59TlcM8W6js5hrUiHFwsml7F9xEwKQiCc9xQgXnDxYvd1lxoUiXYIgKDlrd0IwMcP9ofsIpKoUye4CQX/e5RZz8FPSspYeOcQLtv35EEb8+/yJ6AF1glyV8zzrVxiOn5E6HBb16EUCTesCd+2zmVwkqgdNcBgkrTuEvlEZXhCgrKVYQ7EXaRML5RaRfezK6GWlEyPNL1VImQE3Ar6yWHhDnt8tIYcVzv1ulM1hwRybXz6peIE34k967lF9gc/+ZCscD5tXsfI8ZrrTSXy9t9AT3KuzQNiaILzBGrmtgzuhB6DQSJMn2Fd8InwQsZhilnh8l2YOR7K/Bkvj3rRPD6Ce5CTg0TcIEhvVL7kA6Ni/HF0qvWZr+y2qxnY/N0xNigGsBlb2q8JksTEM6ZhnVxe4A8RFNYsRBhtDx/pKFFAUa0CZaS2HTi864MACYbb9yih43+rbRa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(8936002)(316002)(82310400003)(186003)(336012)(107886003)(2906002)(70586007)(5660300002)(36860700001)(33656002)(54906003)(508600001)(6512007)(36756003)(6506007)(4326008)(2616005)(53546011)(966005)(8676002)(6486002)(47076005)(81166007)(70206006)(83380400001)(356005)(6862004)(86362001)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 09:03:51.3978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b46f26a-06c0-4599-8bac-08d98ef18aa6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2779

SGkgSmFuLA0KDQo+IE9uIDE0IE9jdCAyMDIxLCBhdCAwNzozMywgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDEzLjEwLjIwMjEgMjE6MjcsIFN0ZWZhbm8g
U3RhYmVsbGluaSB3cm90ZToNCj4+IE9uIFdlZCwgMTMgT2N0IDIwMjEsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+IE9uIDEzLjEwLjIwMjEgMTY6NTEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4+PiBPbiAxMy4xMC4yMSAxNjowMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBP
biAxMy4xMC4yMDIxIDEwOjQ1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4+IE9uIFdl
ZCwgT2N0IDA2LCAyMDIxIGF0IDA2OjQwOjM0UE0gKzAxMDAsIFJhaHVsIFNpbmdoIHdyb3RlOg0K
Pj4+Pj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS92cGNpLmMN
Cj4+Pj4+Pj4gQEAgLTAsMCArMSwxMDIgQEANCj4+Pj4+Pj4gKy8qDQo+Pj4+Pj4+ICsgKiB4ZW4v
YXJjaC9hcm0vdnBjaS5jDQo+Pj4+Pj4+ICsgKg0KPj4+Pj4+PiArICogVGhpcyBwcm9ncmFtIGlz
IGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkNCj4+
Pj4+Pj4gKyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgYXMgcHVibGlzaGVkIGJ5DQo+Pj4+Pj4+ICsgKiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcg0KPj4+Pj4+PiArICog
KGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4NCj4+Pj4+Pj4gKyAqDQo+Pj4+Pj4+
ICsgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxs
IGJlIHVzZWZ1bCwNCj4+Pj4+Pj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91
dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQo+Pj4+Pj4+ICsgKiBNRVJDSEFOVEFCSUxJ
VFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlDQo+Pj4+Pj4+
ICsgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLg0KPj4+Pj4+
PiArICovDQo+Pj4+Pj4+ICsjaW5jbHVkZSA8eGVuL3NjaGVkLmg+DQo+Pj4+Pj4+ICsNCj4+Pj4+
Pj4gKyNpbmNsdWRlIDxhc20vbW1pby5oPg0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsjZGVmaW5lIFJF
R0lTVEVSX09GRlNFVChhZGRyKSAgKCAoYWRkcikgJiAweDAwMDAwZmZmKQ0KPj4+Pj4+PiArDQo+
Pj4+Pj4+ICsvKiBEbyBzb21lIHNhbml0eSBjaGVja3MuICovDQo+Pj4+Pj4+ICtzdGF0aWMgYm9v
bCB2cGNpX21taW9fYWNjZXNzX2FsbG93ZWQodW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50
IGxlbikNCj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4gKyAgICAvKiBDaGVjayBhY2Nlc3Mgc2l6ZS4gKi8N
Cj4+Pj4+Pj4gKyAgICBpZiAoIGxlbiA+IDggKQ0KPj4+Pj4+PiArICAgICAgICByZXR1cm4gZmFs
c2U7DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAgICAvKiBDaGVjayB0aGF0IGFjY2VzcyBpcyBzaXpl
IGFsaWduZWQuICovDQo+Pj4+Pj4+ICsgICAgaWYgKCAocmVnICYgKGxlbiAtIDEpKSApDQo+Pj4+
Pj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiArICAgIHJldHVy
biB0cnVlOw0KPj4+Pj4+PiArfQ0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICtzdGF0aWMgaW50IHZwY2lf
bW1pb19yZWFkKHN0cnVjdCB2Y3B1ICp2LCBtbWlvX2luZm9fdCAqaW5mbywNCj4+Pj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmVnaXN0ZXJfdCAqciwgdm9pZCAqcCkNCj4+Pj4+Pj4g
K3sNCj4+Pj4+Pj4gKyAgICB1bnNpZ25lZCBpbnQgcmVnOw0KPj4+Pj4+PiArICAgIHBjaV9zYmRm
X3Qgc2JkZjsNCj4+Pj4+Pj4gKyAgICB1bnNpZ25lZCBsb25nIGRhdGEgPSB+MFVMOw0KPj4+Pj4+
PiArICAgIHVuc2lnbmVkIGludCBzaXplID0gMVUgPDwgaW5mby0+ZGFidC5zaXplOw0KPj4+Pj4+
PiArDQo+Pj4+Pj4+ICsgICAgc2JkZi5zYmRmID0gTU1DRkdfQkRGKGluZm8tPmdwYSk7DQo+Pj4+
Pj4+ICsgICAgcmVnID0gUkVHSVNURVJfT0ZGU0VUKGluZm8tPmdwYSk7DQo+Pj4+Pj4+ICsNCj4+
Pj4+Pj4gKyAgICBpZiAoICF2cGNpX21taW9fYWNjZXNzX2FsbG93ZWQocmVnLCBzaXplKSApDQo+
Pj4+Pj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsgICAgZGF0YSA9
IHZwY2lfcmVhZChzYmRmLCByZWcsIG1pbig0dSwgc2l6ZSkpOw0KPj4+Pj4+PiArICAgIGlmICgg
c2l6ZSA9PSA4ICkNCj4+Pj4+Pj4gKyAgICAgICAgZGF0YSB8PSAodWludDY0X3QpdnBjaV9yZWFk
KHNiZGYsIHJlZyArIDQsIDQpIDw8IDMyOw0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsgICAgKnIgPSBk
YXRhOw0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsgICAgcmV0dXJuIDE7DQo+Pj4+Pj4+ICt9DQo+Pj4+
Pj4+ICsNCj4+Pj4+Pj4gK3N0YXRpYyBpbnQgdnBjaV9tbWlvX3dyaXRlKHN0cnVjdCB2Y3B1ICp2
LCBtbWlvX2luZm9fdCAqaW5mbywNCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJlZ2lzdGVyX3Qgciwgdm9pZCAqcCkNCj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4gKyAgICB1bnNpZ25l
ZCBpbnQgcmVnOw0KPj4+Pj4+PiArICAgIHBjaV9zYmRmX3Qgc2JkZjsNCj4+Pj4+Pj4gKyAgICB1
bnNpZ25lZCBsb25nIGRhdGEgPSByOw0KPj4+Pj4+PiArICAgIHVuc2lnbmVkIGludCBzaXplID0g
MVUgPDwgaW5mby0+ZGFidC5zaXplOw0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsgICAgc2JkZi5zYmRm
ID0gTU1DRkdfQkRGKGluZm8tPmdwYSk7DQo+Pj4+Pj4+ICsgICAgcmVnID0gUkVHSVNURVJfT0ZG
U0VUKGluZm8tPmdwYSk7DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAgICBpZiAoICF2cGNpX21taW9f
YWNjZXNzX2FsbG93ZWQocmVnLCBzaXplKSApDQo+Pj4+Pj4+ICsgICAgICAgIHJldHVybiAwOw0K
Pj4+Pj4+PiArDQo+Pj4+Pj4+ICsgICAgdnBjaV93cml0ZShzYmRmLCByZWcsIG1pbig0dSwgc2l6
ZSksIGRhdGEpOw0KPj4+Pj4+PiArICAgIGlmICggc2l6ZSA9PSA4ICkNCj4+Pj4+Pj4gKyAgICAg
ICAgdnBjaV93cml0ZShzYmRmLCByZWcgKyA0LCA0LCBkYXRhID4+IDMyKTsNCj4+Pj4+PiBJIHRo
aW5rIHRob3NlIHR3byBoZWxwZXJzIChhbmQgdnBjaV9tbWlvX2FjY2Vzc19hbGxvd2VkKSBhcmUg
dmVyeQ0KPj4+Pj4+IHNpbWlsYXIgdG8gdGhlIGV4aXN0aW5nIHg4NiBvbmVzIChzZWUgdnBjaV9t
bWNmZ197cmVhZCx3cml0ZX0pLCB1cCB0bw0KPj4+Pj4+IHRoZSBwb2ludCB3aGVyZSBJIHdvdWxk
IGNvbnNpZGVyIG1vdmluZyB0aGUgc2hhcmVkIGNvZGUgdG8gdnBjaS5jIGFzDQo+Pj4+Pj4gdnBj
aV9lY2FtX3tyZWFkLHdyaXRlfSBhbmQgY2FsbCB0aGVtIGZyb20gdGhlIGFyY2ggc3BlY2lmaWMg
dHJhcA0KPj4+Pj4+IGhhbmRsZXJzLg0KPj4+Pj4gRXhjZXB0IHRoYXQgcGxlYXNlIGNhbiB3ZSBz
dGljayB0byBtY2ZnIG9yIG1tY2ZnIGluc3RlYWQgb2YgZWNhbQ0KPj4+Pj4gaW4gbmFtZXMsIGFz
IHRoYXQncyBob3cgdGhlIHRoaW5nIGhhcyBiZWVuIG5hbWVkIGluIFhlbiBmcm9tIGl0cw0KPj4+
Pj4gaW50cm9kdWN0aW9uPyBJJ3ZlIGp1c3QgZ3JlcC1lZCB0aGUgY29kZSBiYXNlIChjYXNlIGlu
c2Vuc2l0aXZlbHkpDQo+Pj4+PiBhbmQgZm91bmQgbm8gbWVudGlvbiBvZiBFQ0FNLiBUaGVyZSBh
cmUgb25seSBhIGZldyAiYmVjYW1lIi4NCj4+Pj4gSSBkbyB1bmRlcnN0YW5kIHRoYXQgdGhpcyBp
cyBoaXN0b3JpY2FsbHkgdGhhdCB3ZSBkbyBub3QgaGF2ZSBFQ0FNIGluIFhlbiwNCj4+Pj4gYnV0
IFBDSSBpcyBub3QgYWJvdXQgWGVuLiBUaHVzLCBJIHRoaW5rIGl0IGlzIGFsc28gYWNjZXB0YWJs
ZSB0byB1c2UNCj4+Pj4gYSBjb21tb25seSBrbm93biBFQ0FNIGZvciB0aGUgY29kZSB0aGF0IHdv
cmtzIHdpdGggRUNBTS4NCj4+PiANCj4+PiBBQ1BJLCBhZmFpaywgYWxzbyBkb2Vzbid0IGNhbGwg
dGhpcyBFQ0FNLiBUaGF0J3Mgd2hlcmUgTUNGRyAvIE1NQ0ZHDQo+Pj4gYWN0dWFsbHkgY29tZSBm
cm9tLCBJIGJlbGlldmUuDQo+PiANCj4+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCAiTUNGRyIg
aXMgdGhlIG5hbWUgb2YgdGhlIEFDUEkgdGFibGUgdGhhdA0KPj4gZGVzY3JpYmVzIHRoZSBQQ0kg
Y29uZmlnIHNwYWNlIFsxXS4gVGhlIHVuZGVybHlpbmcgUENJIHN0YW5kYXJkIGZvciB0aGUNCj4+
IG1lbW9yeSBtYXBwZWQgbGF5b3V0IG9mIHRoZSBQQ0kgY29uZmlnIHNwYWNlIGlzIGNhbGxlZCBF
Q0FNLiBIZXJlLCBpdA0KPj4gbWFrZXMgc2Vuc2UgdG8gY2FsbCBpdCBFQ0FNIGFzIGl0IGlzIGZp
cm13YXJlIGluZGVwZW5kZW50Lg0KPj4gDQo+PiBbMV0gaHR0cHM6Ly93aWtpLm9zZGV2Lm9yZy9Q
Q0lfRXhwcmVzcw0KPiANCj4gT2theSwgSSBjYW4gYWNjZXB0IHRoaXMsIGJ1dCB0aGVuIEknZCBl
eHBlY3QgYWxsIGV4aXN0aW5nIHVzZXMgb2YNCj4gTUNGRyAvIE1NQ0ZHIGluIHRoZSBjb2RlIHdo
aWNoIGFyZW4ndCBkaXJlY3RseSBBQ1BJLXJlbGF0ZWQgdG8gZ2V0DQo+IHJlcGxhY2VkLiBPdGhl
cndpc2UgaXQncyBuZWVkbGVzc2x5IGhhcmRlciB0byBpZGVudGlmeSB0aGF0IG9uZQ0KPiBwaWVj
ZSBvZiBjb2RlIHJlbGF0ZXMgdG8gY2VydGFpbiBvdGhlciBwaWVjZXMuDQoNCklmIHRoYXQgaXMg
b2sgd2l0aCBJIHdpbGw6DQotIG1vdmUgZnVuY3Rpb24gZnJvbSB4ODYvaHcvaW8uYyB0byB2cGNp
LmMgcmVuYW1pbmcgdGhlbSB0byBFQ0FNDQotIHJlbmFtZSBNTUNGR197QkRGL1JFR19PRkZTRVQp
IHRvIEVDQU1fe0JERi9SRUdfT0ZGU0VUfQ0KDQpGb3IgdGhlIHJlc3Qgb2YgdGhlIG9jY3VycmVu
Y2VzIGluIHg4NiBJIHdpbGwgbm90IG1vZGlmeSBhbnkgb2YgdGhlbSBhcyBzb21lDQphcmUgcmVs
YXRlZCB0byBBQ1BJIHNvIHVzaW5nIChNKU1DRkcgaXMgcmlnaHQgYW5kIGZvciB0aGUgb3RoZXJz
IEkgYW0gbm90IDEwMCUNCnN1cmUuDQoNCkRvIHlvdSBhZ3JlZSA/DQoNCkNoZWVycw0KQmVydHJh
bmQNCg0KPiANCj4gSmFuDQo+IA0KDQo=

