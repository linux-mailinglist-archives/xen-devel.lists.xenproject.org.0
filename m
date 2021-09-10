Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9891B406B0D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 13:54:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184315.332926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOf6I-00071v-Or; Fri, 10 Sep 2021 11:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184315.332926; Fri, 10 Sep 2021 11:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOf6I-0006zM-L8; Fri, 10 Sep 2021 11:53:46 +0000
Received: by outflank-mailman (input) for mailman id 184315;
 Fri, 10 Sep 2021 11:53:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wql=OA=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mOf6G-0006yc-QC
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 11:53:44 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdfebdb3-122d-11ec-b229-12813bfff9fa;
 Fri, 10 Sep 2021 11:53:42 +0000 (UTC)
Received: from DU2PR04CA0291.eurprd04.prod.outlook.com (2603:10a6:10:28c::26)
 by AM0PR08MB3107.eurprd08.prod.outlook.com (2603:10a6:208:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 11:53:40 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::54) by DU2PR04CA0291.outlook.office365.com
 (2603:10a6:10:28c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 11:53:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 11:53:40 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Fri, 10 Sep 2021 11:53:40 +0000
Received: from b2d6a23dd4de.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0B5FA5CC-FE3C-4297-AC41-7DB5572AF8C1.1; 
 Fri, 10 Sep 2021 11:53:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2d6a23dd4de.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Sep 2021 11:53:33 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6791.eurprd08.prod.outlook.com (2603:10a6:20b:392::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 11:53:32 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 11:53:32 +0000
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
X-Inumbo-ID: bdfebdb3-122d-11ec-b229-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e1nTa5OseKNzWf9vNS7Gg8KVYr7EC9nTFiIJzIoA2w=;
 b=8/8UiGWG5DiEN7ov71/NyTgRFI8FazOfftPB5yuw/2EdUkVzitZrkZzgkuW14QB5RG2x34T1fkE10oF/ZejUDYtO0EhtkO37V82Kz1fSN++Alu2+UHHewp8Hqyh5EbwvAr2cF7a6QadhIhnbGqUUq2w1EQWEZ9S0+3cP0eT5Wwo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36e402446b5e4f4b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIfr4QctgNe2KKZ07SEJkMcXUM4SaM17r4suTayOVOq71Zfa4EsYmXvFEDsTpvaYllby1bG2HAEt3yCm970LVNYVghUeOBFnXAx5PM2ptoIC3OWfxHAQBlKVGY8vOYJuisk6qKVA5UBkQ/o1O863hXdYePp1zstBtHKJ/Js/jT3nQiL68zGJ7FKZhaRKTNopq/pc3H45d7WB9mgYAcRpt2Y4JBFT42S+3nuNo7s0e75jJcUQ5i/rSxk1kVJ+d/NmK7NGZNXZN+hIJk+IA7ors7EavWsVpKNneXdL1KW8MBs+JZ/YNyld2N/oA/ekh/A2KYIj4SqA7CEUWx3Qu4GKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3e1nTa5OseKNzWf9vNS7Gg8KVYr7EC9nTFiIJzIoA2w=;
 b=GF8iUNSPqQus80DLB7a/Ya7h6ssvWptA2ROSF2rp40QgEWHOtBW88KmDRew7HcsxFIYq3xMIIcM++jVqje0R8BT4AWnDQyQ3S3H/Qm8GUbJY4ehhuDoJmdbLKq6eSDJ38tLoqI1hCwbvo7QX38uamUO6sk+HNTYrmgxAfVpAWl3zGLgFBI9G9tlN615ph04sC5BriAYeJ8akyr4Ffr+AL7LPAlwahME8FD1eZ8mKMQuRW7y5jSiBXMvqyY/OmHnCzQRpCcjMQdwoOa0oLaMgs9y6Ja09wzE4rwQczN5iFOF/gxdTYhDV1lj+d0uSxT/LEgxeqWDaVNPx12PN/xS9OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e1nTa5OseKNzWf9vNS7Gg8KVYr7EC9nTFiIJzIoA2w=;
 b=8/8UiGWG5DiEN7ov71/NyTgRFI8FazOfftPB5yuw/2EdUkVzitZrkZzgkuW14QB5RG2x34T1fkE10oF/ZejUDYtO0EhtkO37V82Kz1fSN++Alu2+UHHewp8Hqyh5EbwvAr2cF7a6QadhIhnbGqUUq2w1EQWEZ9S0+3cP0eT5Wwo=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 05/14] xen/arm: PCI host bridge discovery within XEN on
 ARM
Thread-Topic: [PATCH v1 05/14] xen/arm: PCI host bridge discovery within XEN
 on ARM
Thread-Index: AQHXlPKqrI+7ld7PxEaIC1sXiQa2TauccWEAgADZrIA=
Date: Fri, 10 Sep 2021 11:53:32 +0000
Message-ID: <D716F747-6055-4520-B4DB-189A8AF3945C@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <412b6574170d96d6fc4196fab4bb2b9286a770c8.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109091540470.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109091540470.10523@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c15bb444-4908-4304-d8c2-08d97451a1c7
x-ms-traffictypediagnostic: AS8PR08MB6791:|AM0PR08MB3107:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB310709FE26EAC12F3F62092CFCD69@AM0PR08MB3107.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 16oRcyfGi88BarJAEnwUyr9jn/+FUQzHJ/haO+hqQAxIIoE5MFCIhfbvxLRHTPYUopqfbE8IdMWFUGGp1KvqdzgND2N9/opnKxXrFDdCQNT6JnLh1TZijpT50vssWtttPRgZQeSuTx1a2eayRbZdPqrglrJrQwQ4EWnKrSm9f8yzgiMBl5NvpeqOU+1XM+pTh5eqsWdDA6drEDqfL/i+bju8VNNO0Y9PEW8MsvdIUZVT7FzQIwdfpl5cJJCZTopd7tX4x77U5T628edEJDn6LjpoKfls7eoAypaWObMJ9MXunFPI3JCh1sP3qGMNxLDFlxJbyjKloMvkgy4VCjfys8Emv9RmY94/Y376NtgUlaD6PRLmn5VITE1rYSjCd/5+9hcYTSVrRI+f4g4sht118Toc41lbKwk1oPl4LzXYgpHQTT9IiEreCiE5ClBBgBL/5XxPd1rxy2L7St68o0SZIHALVQbME0hN7UoP/xUrO5rMI6tk/4bSKXuoVi/F0HUgjgiwxkvsMFWhzokfJlgbKLoZ6fHE3MTfAJ0XsGNCAaftCJuwxwlFqmrYXZ3C/2hYdpurTTLTKX22ei2oroLIDTYexo5zYGp97jGt4gZq0utiusxGcmoJ9xeZhEWn3q8FcoCt/Twb3rHK0MaxXQCi1iSX3Z87it9FOLuGc+Wd8nl4PHrgnDUFM5c3kz+ly+bvcrVVSep0Lap6+5CC2ltHEh6GNWyqZ8d1f016nnsiQURz9jBWDoR6SFrdi/F9S3+JBbSkh1yFPEkKJX5WzaiS/fxhG41I0Tz8j6HLtpG0idZbqmrPivzw9A2MQfG7o0XIxHntaynl1jZZ+L1q9gJV5BQOWah/B8evT/AAiE+HqorQ4UPIhuBapCeZYslKuIJR
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(36756003)(2616005)(186003)(66946007)(2906002)(71200400001)(316002)(478600001)(66446008)(64756008)(66556008)(66476007)(76116006)(91956017)(966005)(8936002)(54906003)(53546011)(33656002)(5660300002)(38100700002)(4326008)(122000001)(26005)(6506007)(38070700005)(6916009)(8676002)(6512007)(86362001)(83380400001)(6486002)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C88DF19F4C4871418FC50B4B7164C757@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6791
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9076e8a3-3318-49f5-adbe-08d974519d0f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MrTKbAKlBj4ycimaeIw0b1j4bs3oCZyZYidIFLCHd5R6/i92lCUPmWCJg8hFmz8KrTsLq0DmRmvfbhyoetf1L7ct2o4xm2sQh1+Gln4DSLTt7wqofLPwH0LoW78h2U8zOHDnA1LdCwHz/KHR4ceeOU+22Q6U5bKNcyYSjY++21skDvUgZDT9EZmr1r1zhVmKLLr+LrFS7CwJntbjRSC1tQCK2mPGpclwrA0a5XqBBrQAs1Fjs1jdtLNJ6KjCYaIaLtOAM769GVFAiH1HXBmtkOIJeDeE2SNVROJwM2Q0iIv8XblAql24p4VmTdZoktlv2n1lhZuN5NYlhyEfjfsW4MIvT0p1JVEm5etFLZxUBYSjfAhudz10YtYf4EJRbXWZS5+ruh16hs0JRMPJN1y/E4iHbqhLEGcrb9tUSEWE+2kadoGNMB5RkfnPBSzZ2kxRAtiJW62HitWw+B6a9ZsNKGEhPjQtRGl/2wGHc/0NzC6zhghWwlhjfRPhJOxzh6wCsXY0STrIdyw4uJ7BlmGDG1QhLvrFRyAEaQPG0j9hYHaD6JeM+yZqSsz5vRv3d2865gxwWtf4Hi21OtaWp8jOvz0gLX0PSe1Z1nB9fevV1OpVU3RBnUcrKnrhq515Vk3uW7so+2+7qo+2m9+Tk3+HnSI4Geqmd8MA/ABxEXjac6+xY0fdFpDZAgL/2E7NZsGwe7W3/QkcwRjfk263WSfDtBbXGDb5MIqiq1Ua8Mq6mX5oGEGptHgTHbBVfkKC5RCvh6xaQwRcGrh/7OXMumUpHcSiIHPtLIEtSARYKuhwMqbs0e6KZZbpJovvGCN5xNRn2g5Z7pVjUUzoxQCHWlcBnQo6Q9DlUo5D4rp7hK19FN8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(36840700001)(46966006)(26005)(107886003)(86362001)(36756003)(4326008)(82740400003)(966005)(82310400003)(336012)(54906003)(36860700001)(70206006)(356005)(53546011)(2616005)(6486002)(33656002)(47076005)(6862004)(6506007)(6512007)(8936002)(83380400001)(2906002)(478600001)(8676002)(5660300002)(316002)(70586007)(81166007)(186003)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 11:53:40.4947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c15bb444-4908-4304-d8c2-08d97451a1c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3107

SGkgU3RlZmFubywNCg0KPiBPbiA5IFNlcCAyMDIxLCBhdCAxMTo1NCBwbSwgU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgMTkg
QXVnIDIwMjEsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gWEVOIGR1cmluZyBib290IHdpbGwgcmVh
ZCB0aGUgUENJIGRldmljZSB0cmVlIG5vZGUg4oCccmVn4oCdIHByb3BlcnR5DQo+PiBhbmQgd2ls
bCBtYXAgdGhlIFBDSSBjb25maWcgc3BhY2UgdG8gdGhlIFhFTiBtZW1vcnkuDQo+PiANCj4+IEFz
IG9mIG5vdyAicGNpLWhvc3QtZWNhbS1nZW5lcmljIiBjb21wYXRpYmxlIGJvYXJkIGlzIHN1cHBv
cnRlZC4NCj4+IA0KPj4gImxpbnV4LHBjaS1kb21haW4iIGRldmljZSB0cmVlIHByb3BlcnR5IGFz
c2lnbnMgYSBmaXhlZCBQQ0kgZG9tYWluDQo+PiBudW1iZXIgdG8gYSBob3N0IGJyaWRnZSwgb3Ro
ZXJ3aXNlIGFuIHVuc3RhYmxlIChhY3Jvc3MgYm9vdHMpIHVuaXF1ZQ0KPj4gbnVtYmVyIHdpbGwg
YmUgYXNzaWduZWQgYnkgTGludXguVGhpcyBwcm9wZXJ0eSBoYXMgdG8gYmUgaW4gc3luYyB3aXRo
DQo+PiBYRU4gdG8gYWNjZXNzIHRoZSBQQ0kgZGV2aWNlcy4NCj4+IA0KPj4gWEVOIHdpbGwgcmVh
ZCB0aGUg4oCcbGludXgscGNpLWRvbWFpbuKAnSBwcm9wZXJ0eSBmcm9tIHRoZSBkZXZpY2UgdHJl
ZSBub2RlDQo+PiBhbmQgY29uZmlndXJlIHRoZSBob3N0IGJyaWRnZSBzZWdtZW50IG51bWJlciBh
Y2NvcmRpbmdseS4gSWYgdGhpcw0KPj4gcHJvcGVydHkgaXMgbm90IGF2YWlsYWJsZSBYRU4gd2ls
bCBhbGxvY2F0ZSB0aGUgdW5pcXVlIHNlZ21lbnQgbnVtYmVyDQo+PiB0byB0aGUgaG9zdCBicmlk
Z2UuDQo+PiANCj4+IGR0X2dldF9wY2lfZG9tYWluX25yKC4uKSBhbmQgZHRfcGNpX2J1c19maW5k
X2RvbWFpbl9uciguLikgYXJlIGRpcmVjdGx5DQo+PiBpbXBvcnRlZCBmcm9tIHRoZSBMaW51eCBz
b3VyY2UgdHJlZS4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNp
bmdoQGFybS5jb20+DQo+PiAtLS0NCj4+IHhlbi9hcmNoL2FybS9wY2kvTWFrZWZpbGUgICAgICAg
ICAgIHwgICAyICsNCj4+IHhlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29tbW9uLmMgIHwgMjYx
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IHhlbi9hcmNoL2FybS9wY2kvcGNpLWhv
c3QtZ2VuZXJpYy5jIHwgIDU1ICsrKysrKw0KPj4geGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaCAg
ICAgICAgICAgfCAgMjggKysrDQo+PiA0IGZpbGVzIGNoYW5nZWQsIDM0NiBpbnNlcnRpb25zKCsp
DQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24u
Yw0KPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtZ2VuZXJp
Yy5jDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGNpL01ha2VmaWxlIGIveGVu
L2FyY2gvYXJtL3BjaS9NYWtlZmlsZQ0KPj4gaW5kZXggYTllZTBiOWI0NC4uZjNkOTdmODU5ZSAx
MDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9wY2kvTWFrZWZpbGUNCj4+ICsrKyBiL3hlbi9h
cmNoL2FybS9wY2kvTWFrZWZpbGUNCj4+IEBAIC0xLDIgKzEsNCBAQA0KPj4gb2JqLXkgKz0gcGNp
Lm8NCj4+IG9iai15ICs9IHBjaS1hY2Nlc3Mubw0KPj4gK29iai15ICs9IHBjaS1ob3N0LWdlbmVy
aWMubw0KPj4gK29iai15ICs9IHBjaS1ob3N0LWNvbW1vbi5vDQo+PiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYyBiL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhv
c3QtY29tbW9uLmMNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAw
Li45ZGQ5YjAyMjcxDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vcGNp
L3BjaS1ob3N0LWNvbW1vbi5jDQo+PiBAQCAtMCwwICsxLDI2MSBAQA0KPj4gKy8qDQo+PiArICog
Q29weXJpZ2h0IChDKSAyMDIxIEFybSBMdGQuDQo+PiArICoNCj4+ICsgKiBCYXNlZCBvbiBMaW51
eCBkcml2ZXJzL3BjaS9lY2FtLmMNCj4+ICsgKiBDb3B5cmlnaHQgMjAxNiBCcm9hZGNvbS4NCj4+
ICsgKg0KPj4gKyAqIEJhc2VkIG9uIExpbnV4IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLWhv
c3QtY29tbW9uLmMNCj4+ICsgKiBCYXNlZCBvbiBMaW51eCBkcml2ZXJzL3BjaS9jb250cm9sbGVy
L3BjaS1ob3N0LWdlbmVyaWMuYw0KPj4gKyAqIENvcHlyaWdodCAoQykgMjAxNCBBUk0gTGltaXRl
ZCBXaWxsIERlYWNvbiA8d2lsbC5kZWFjb25AYXJtLmNvbT4NCj4+ICsgKg0KPj4gKyAqDQo+PiAr
ICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0
IGFuZC9vciBtb2RpZnkNCj4+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcw0KPj4gKyAqIHB1Ymxpc2hlZCBieSB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLg0KPj4gKyAqDQo+PiArICogVGhpcyBwcm9ncmFtIGlz
IGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsDQo+PiArICog
YnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFu
dHkgb2YNCj4+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFS
IFBVUlBPU0UuICBTZWUgdGhlDQo+PiArICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9y
IG1vcmUgZGV0YWlscy4NCj4+ICsgKg0KPj4gKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBh
IGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlDQo+PiArICogYWxvbmcgd2l0
aCB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2Vz
Lz4uDQo+PiArICovDQo+PiArDQo+PiArI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+PiArI2luY2x1
ZGUgPHhlbi9wY2kuaD4NCj4+ICsjaW5jbHVkZSA8YXNtL3BjaS5oPg0KPj4gKyNpbmNsdWRlIDx4
ZW4vcndsb2NrLmg+DQo+PiArI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPj4gKyNpbmNsdWRlIDx4
ZW4vdm1hcC5oPg0KPj4gKw0KPj4gKy8qDQo+PiArICogTGlzdCBmb3IgYWxsIHRoZSBwY2kgaG9z
dCBicmlkZ2VzLg0KPj4gKyAqLw0KPj4gKw0KPj4gK3N0YXRpYyBMSVNUX0hFQUQocGNpX2hvc3Rf
YnJpZGdlcyk7DQo+PiArDQo+PiArc3RhdGljIGF0b21pY190IGRvbWFpbl9uciA9IEFUT01JQ19J
TklUKC0xKTsNCj4+ICsNCj4+ICtib29sIGR0X3BjaV9wYXJzZV9idXNfcmFuZ2Uoc3RydWN0IGR0
X2RldmljZV9ub2RlICpkZXYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBwY2lfY29uZmlnX3dpbmRvdyAqY2ZnKQ0KPj4gK3sNCj4+ICsgICAgY29uc3QgX19iZTMyICpj
ZWxsczsNCj4+ICsgICAgdWludDMyX3QgbGVuOw0KPj4gKw0KPj4gKyAgICBjZWxscyA9IGR0X2dl
dF9wcm9wZXJ0eShkZXYsICJidXMtcmFuZ2UiLCAmbGVuKTsNCj4+ICsgICAgLyogYnVzLXJhbmdl
IHNob3VsZCBhdCBsZWFzdCBiZSAyIGNlbGxzICovDQo+PiArICAgIGlmICggIWNlbGxzIHx8IChs
ZW4gPCAoc2l6ZW9mKCpjZWxscykgKiAyKSkgKQ0KPj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0K
Pj4gKw0KPj4gKyAgICBjZmctPmJ1c25fc3RhcnQgPSBkdF9uZXh0X2NlbGwoMSwgJmNlbGxzKTsN
Cj4+ICsgICAgY2ZnLT5idXNuX2VuZCA9IGR0X25leHRfY2VsbCgxLCAmY2VsbHMpOw0KPj4gKw0K
Pj4gKyAgICByZXR1cm4gdHJ1ZTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGlubGluZSB2b2lk
IF9faW9tZW0gKnBjaV9yZW1hcF9jZmdzcGFjZShwYWRkcl90IHN0YXJ0LCBzaXplX3QgbGVuKQ0K
Pj4gK3sNCj4+ICsgICAgcmV0dXJuIGlvcmVtYXBfbm9jYWNoZShzdGFydCwgbGVuKTsNCj4+ICt9
DQo+PiArDQo+PiArc3RhdGljIHZvaWQgcGNpX2VjYW1fZnJlZShzdHJ1Y3QgcGNpX2NvbmZpZ193
aW5kb3cgKmNmZykNCj4+ICt7DQo+PiArICAgIGlmICggY2ZnLT53aW4gKQ0KPj4gKyAgICAgICAg
aW91bm1hcChjZmctPndpbik7DQo+PiArDQo+PiArICAgIHhmcmVlKGNmZyk7DQo+PiArfQ0KPj4g
Kw0KPj4gK3N0YXRpYyBzdHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cgKmdlbl9wY2lfaW5pdChzdHJ1
Y3QgZHRfZGV2aWNlX25vZGUgKmRldiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaW50IGVjYW1fcmVnX2lkeCkNCj4gDQo+IElmIGl0IGlzIG9ubHkg
Y2FsbGVkIGF0IGluaXQgdGltZSwgdGhlbiB0aGUgZnVuY3Rpb24gc2hvdWxkIGJlIF9faW5pdA0K
DQpBY2suDQoNCj4gDQo+IA0KPj4gK3sNCj4+ICsgICAgaW50IGVycjsNCj4+ICsgICAgc3RydWN0
IHBjaV9jb25maWdfd2luZG93ICpjZmc7DQo+PiArICAgIHBhZGRyX3QgYWRkciwgc2l6ZTsNCj4+
ICsNCj4+ICsgICAgY2ZnID0geHphbGxvYyhzdHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cpOw0KPj4g
KyAgICBpZiAoICFjZmcgKQ0KPj4gKyAgICAgICAgcmV0dXJuIE5VTEw7DQo+PiArDQo+PiArICAg
IGVyciA9IGR0X3BjaV9wYXJzZV9idXNfcmFuZ2UoZGV2LCBjZmcpOw0KPj4gKyAgICBpZiAoICFl
cnIgKSB7DQo+PiArICAgICAgICBjZmctPmJ1c25fc3RhcnQgPSAwOw0KPj4gKyAgICAgICAgY2Zn
LT5idXNuX2VuZCA9IDB4ZmY7DQo+PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiJXM6Tm8g
YnVzIHJhbmdlIGZvdW5kIGZvciBwY2kgY29udHJvbGxlclxuIiwNCj4+ICsgICAgICAgICAgICAg
ICBkdF9ub2RlX2Z1bGxfbmFtZShkZXYpKTsNCj4+ICsgICAgfSBlbHNlIHsNCj4+ICsgICAgICAg
IGlmICggY2ZnLT5idXNuX2VuZCA+IGNmZy0+YnVzbl9zdGFydCArIDB4ZmYgKQ0KPj4gKyAgICAg
ICAgICAgIGNmZy0+YnVzbl9lbmQgPSBjZmctPmJ1c25fc3RhcnQgKyAweGZmOw0KPiANCj4gSXMg
dGhpcyBhIGhhcmQgbGltaXQgaW4gdGhlIHNwZWNpZmljYXRpb24/IE9yIGlzIGl0IGEgbGltaXQg
aW4gdGhlIFhlbg0KPiBpbXBsZW1lbnRhdGlvbj8NCg0KSSBqdXN0IHRha2UgdGhlIHJlZmVyZW5j
ZSBmcm9tIExpbnV4IGNvZGUuDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRl
c3Qvc291cmNlL2RyaXZlcnMvcGNpL29mLmMjTDMwNg0KDQo+IA0KPiANCj4+ICsgICAgfQ0KPj4g
Kw0KPj4gKyAgICAvKiBQYXJzZSBvdXIgUENJIGVjYW0gcmVnaXN0ZXIgYWRkcmVzcyovDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIHNwYWNlDQo+IA0KQWNr
Lg0KPj4gKyAgICBlcnIgPSBkdF9kZXZpY2VfZ2V0X2FkZHJlc3MoZGV2LCBlY2FtX3JlZ19pZHgs
ICZhZGRyLCAmc2l6ZSk7DQo+PiArICAgIGlmICggZXJyICkNCj4+ICsgICAgICAgIGdvdG8gZXJy
X2V4aXQ7DQo+PiArDQo+PiArICAgIGNmZy0+cGh5c19hZGRyID0gYWRkcjsNCj4+ICsgICAgY2Zn
LT5zaXplID0gc2l6ZTsNCj4+ICsNCj4+ICsgICAgLyoNCj4+ICsgICAgICogT24gNjQtYml0IHN5
c3RlbXMsIHdlIGRvIGEgc2luZ2xlIGlvcmVtYXAgZm9yIHRoZSB3aG9sZSBjb25maWcgc3BhY2UN
Cj4+ICsgICAgICogc2luY2Ugd2UgaGF2ZSBlbm91Z2ggdmlydHVhbCBhZGRyZXNzIHJhbmdlIGF2
YWlsYWJsZS4gIE9uIDMyLWJpdCwgd2UNCj4+ICsgICAgICogaW9yZW1hcCB0aGUgY29uZmlnIHNw
YWNlIGZvciBlYWNoIGJ1cyBpbmRpdmlkdWFsbHkuDQo+PiArICAgICAqDQo+PiArICAgICAqIEFz
IG9mIG5vdyBvbmx5IDY0LWJpdCBpcyBzdXBwb3J0ZWQgMzItYml0IGlzIG5vdCBzdXBwb3J0ZWQu
DQo+PiArICAgICAqLw0KPj4gKyAgICBjZmctPndpbiA9IHBjaV9yZW1hcF9jZmdzcGFjZShjZmct
PnBoeXNfYWRkciwgY2ZnLT5zaXplKTsNCj4+ICsgICAgaWYgKCAhY2ZnLT53aW4gKQ0KPj4gKyAg
ICAgICAgZ290byBlcnJfZXhpdF9yZW1hcDsNCj4+ICsNCj4+ICsgICAgcHJpbnRrKCJFQ0FNIGF0
IFttZW0gJWx4LSVseF0gZm9yIFtidXMgJXgtJXhdIFxuIixjZmctPnBoeXNfYWRkciwNCj4+ICsg
ICAgICAgICAgICBjZmctPnBoeXNfYWRkciArIGNmZy0+c2l6ZSAtIDEsIGNmZy0+YnVzbl9zdGFy
dCwgY2ZnLT5idXNuX2VuZCk7DQo+PiArDQo+PiArICAgIHJldHVybiBjZmc7DQo+PiArDQo+PiAr
ZXJyX2V4aXRfcmVtYXA6DQo+PiArICAgIHByaW50ayhYRU5MT0dfRVJSICJFQ0FNIGlvcmVtYXAg
ZmFpbGVkXG4iKTsNCj4+ICtlcnJfZXhpdDoNCj4+ICsgICAgcGNpX2VjYW1fZnJlZShjZmcpOw0K
Pj4gKyAgICByZXR1cm4gTlVMTDsNCj4+ICt9DQo+PiArDQo+PiArc3RydWN0IHBjaV9ob3N0X2Jy
aWRnZSAqcGNpX2FsbG9jX2hvc3RfYnJpZGdlKHZvaWQpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3Qg
cGNpX2hvc3RfYnJpZGdlICpicmlkZ2UgPSB4emFsbG9jKHN0cnVjdCBwY2lfaG9zdF9icmlkZ2Up
Ow0KPj4gKw0KPj4gKyAgICBpZiAoICFicmlkZ2UgKQ0KPj4gKyAgICAgICAgcmV0dXJuIE5VTEw7
DQo+PiArDQo+PiArICAgIElOSVRfTElTVF9IRUFEKCZicmlkZ2UtPm5vZGUpOw0KPj4gKyAgICBi
cmlkZ2UtPmJ1c19zdGFydCA9IH4wOw0KPj4gKyAgICBicmlkZ2UtPmJ1c19lbmQgPSB+MDsNCj4g
DQo+IFBsZWFzZSB1c2UgSU5WQUxJRF9QQUREUiBpbnN0ZWFkIG9mIH4wDQoNCmJyaWRnZS0+YnVz
X3N0YXJ0IGlzIGlmIHR5cGUgdWludDhfdCBpZiBJICB1c2UgSU5WQUxJRF9QQUREUiBJIHdpbGwg
Z2V0IG92ZXJmbG93IGVycm9yLg0KSSB3aWxsIHVzZSBVOF9NQVggaW5zdGVhZCBvZiBJTlZBTElE
X1BBRERSLg0KDQo+IA0KPiANCj4+ICsgICAgcmV0dXJuIGJyaWRnZTsNCj4+ICt9DQo+PiArDQo+
PiArdm9pZCBwY2lfYWRkX2hvc3RfYnJpZGdlKHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRn
ZSkNCj4+ICt7DQo+PiArICAgIGxpc3RfYWRkX3RhaWwoJmJyaWRnZS0+bm9kZSwgJnBjaV9ob3N0
X2JyaWRnZXMpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IHBjaV9nZXRfbmV3X2RvbWFp
bl9ucih2b2lkKQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJuIGF0b21pY19pbmNfcmV0dXJuKCZkb21h
aW5fbnIpOw0KPj4gK30NCj4+ICsNCj4+ICsvKg0KPj4gKyAqIFRoaXMgZnVuY3Rpb24gd2lsbCB0
cnkgdG8gb2J0YWluIHRoZSBob3N0IGJyaWRnZSBkb21haW4gbnVtYmVyIGJ5DQo+PiArICogZmlu
ZGluZyBhIHByb3BlcnR5IGNhbGxlZCAibGludXgscGNpLWRvbWFpbiIgb2YgdGhlIGdpdmVuIGRl
dmljZSBub2RlLg0KPj4gKyAqDQo+PiArICogQG5vZGU6IGRldmljZSB0cmVlIG5vZGUgd2l0aCB0
aGUgZG9tYWluIGluZm9ybWF0aW9uDQo+PiArICoNCj4+ICsgKiBSZXR1cm5zIHRoZSBhc3NvY2lh
dGVkIGRvbWFpbiBudW1iZXIgZnJvbSBEVCBpbiB0aGUgcmFuZ2UgWzAtMHhmZmZmXSwgb3INCj4+
ICsgKiBhIG5lZ2F0aXZlIHZhbHVlIGlmIHRoZSByZXF1aXJlZCBwcm9wZXJ0eSBpcyBub3QgZm91
bmQuDQo+PiArICovDQo+PiArc3RhdGljIGludCBkdF9nZXRfcGNpX2RvbWFpbl9ucihzdHJ1Y3Qg
ZHRfZGV2aWNlX25vZGUgKm5vZGUpDQo+PiArew0KPj4gKyAgICB1MzIgZG9tYWluOw0KPj4gKyAg
ICBpbnQgZXJyb3I7DQo+PiArDQo+PiArICAgIGVycm9yID0gZHRfcHJvcGVydHlfcmVhZF91MzIo
bm9kZSwgImxpbnV4LHBjaS1kb21haW4iLCAmZG9tYWluKTsNCj4+ICsgICAgaWYgKCAhZXJyb3Ig
KQ0KPj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArDQo+PiArICAgIHJldHVybiAodTE2
KWRvbWFpbjsNCj4gDQo+IExldCdzIGNoZWNrIHRoYXQgZG9tYWluIDw9IFVJTlQxNl9NQVgNCj4g
DQpBY2sNCiANClJlZ2FyZHMsDQpSYWh1bA==

