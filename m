Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923454161E7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:18:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194427.346360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQUF-0004ca-HP; Thu, 23 Sep 2021 15:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194427.346360; Thu, 23 Sep 2021 15:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQUF-0004Z8-DV; Thu, 23 Sep 2021 15:18:11 +0000
Received: by outflank-mailman (input) for mailman id 194427;
 Thu, 23 Sep 2021 15:18:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y7SS=ON=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mTQUD-0004Z2-FF
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:18:09 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.83]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b503e5b6-6f1d-4a3f-97c2-6bb786c58327;
 Thu, 23 Sep 2021 15:18:06 +0000 (UTC)
Received: from AM5PR0602CA0010.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::20) by PR2PR08MB5225.eurprd08.prod.outlook.com
 (2603:10a6:101:1c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 15:18:04 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::58) by AM5PR0602CA0010.outlook.office365.com
 (2603:10a6:203:a3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 15:18:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 15:18:04 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Thu, 23 Sep 2021 15:18:03 +0000
Received: from debc9f0720eb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B1035B8D-BCAA-49A0-A61D-E1D9B7EAA35B.1; 
 Thu, 23 Sep 2021 15:17:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id debc9f0720eb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 15:17:50 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6630.eurprd08.prod.outlook.com (2603:10a6:20b:337::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 23 Sep
 2021 15:17:47 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 15:17:47 +0000
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
X-Inumbo-ID: b503e5b6-6f1d-4a3f-97c2-6bb786c58327
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G36TS6GIEuBLd1hXsVLcS/2Ztquu31Kr/R6Fo0WYLN8=;
 b=ceX/b4MxkCZuBl+lFNyvhRjvtcgG+i8fvfq7jGpsbOYAdywojoKVQc40eSGsqCY5zO3cTFUkCBLtl0k2MGe8EC86d4HDMcUTkZ426YI6HWgIiJ1UJBeKCNpQ5yuX9/OnvOGbnpca/lOr6hfV7rePrmHH6X61ejlc/o0PIuED7MQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a2a460d7dbd3db60
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoLgDEGDWuphW87KTynSJRuKMyyWtg2xqBVh/0h2jjt8187zgP0jLWoMnVFCVDxA/gm+FUVgVyfq4d1oVH+LXWPfBAdW3LBbiqiAYowHdPMvRpEyyqF59+TbIUQwXvq+Sp2Z+lyO3qwMsUygRchKeaJPS5sjknj93SJd0izAsMutbwtsT9LcgTF786hHC9Rmi14uv0QIN8CSUQf5wCb0iiZbPDpx5whELknHSOMOaepBe0VGSHw0DRMVGD9Kot1vNwj3VkfGlkkyW1VCLTRAAwAg+HjP23kgpKe1VQz/zqQi3kPBjPLIm8t0aW4FWC8nf+YKabh20WFV8RIO4sKkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=G36TS6GIEuBLd1hXsVLcS/2Ztquu31Kr/R6Fo0WYLN8=;
 b=P835xLS+TMtFxcsb+E6YrN0lyBz7PERrSBAczzeIuB8nAEniPkEiz+0zZmH1xGVWsoEp+iZ7i1CMZHDa7Y34Ik7RZFdFxQeUj64T5P/uQQAyLHZTeCr8dWe2MOY/CeK0ywDhEOI4H2zEmC+oBI+g1W02CzN70VuVVS83yChDyrvvWZjvOiGyEbWhnYt8vLNO6P+plWp1Ge7wckVa6rlJMIB6UxSe/d1HKsjxLFdElUq5BUocNOt5jFRfqI6r5JFWaTf5UWmq9ZhxTGlOGXoiRFhMEuep4iaBShxN6FFG1KFS1txV/CqQgDK2DcQThRP+kUuXflFDoZ0cORcmvBiJuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G36TS6GIEuBLd1hXsVLcS/2Ztquu31Kr/R6Fo0WYLN8=;
 b=ceX/b4MxkCZuBl+lFNyvhRjvtcgG+i8fvfq7jGpsbOYAdywojoKVQc40eSGsqCY5zO3cTFUkCBLtl0k2MGe8EC86d4HDMcUTkZ426YI6HWgIiJ1UJBeKCNpQ5yuX9/OnvOGbnpca/lOr6hfV7rePrmHH6X61ejlc/o0PIuED7MQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 13/17] xen:arm: Implement pci access functions
Thread-Topic: [PATCH v2 13/17] xen:arm: Implement pci access functions
Thread-Index: AQHXr6aktO5EpOLLjku5HahQRSHFEauw5LyAgABsh4CAAGvCAA==
Date: Thu, 23 Sep 2021 15:17:47 +0000
Message-ID: <5610FB39-51D5-43BB-880A-4899125DB788@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <f05b02c04803809bbe4ebd49ed4abb5a4656b010.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221913430.17979@sstabellini-ThinkPad-T480s>
 <33deb79b-54e3-c00e-653c-9c1191574b4a@xen.org>
In-Reply-To: <33deb79b-54e3-c00e-653c-9c1191574b4a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fa31dfd2-1a1e-47fa-28fa-08d97ea55700
x-ms-traffictypediagnostic: AS8PR08MB6630:|PR2PR08MB5225:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB5225C671661E9794215E2848FCA39@PR2PR08MB5225.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tQh7OT8HTcUI9FsSt2qRcTNothBKXY0FpQkLOY9vO5kK4rY33aZDdU6X/RQ1GtmhDeP0ltf649NhGkNBO+l7ptVF5R7Ipds1hL17HOAH2BDghttpDzqYElDwZNdZnZoye6mvyXX0WcJttUsELGCn3soW6C/olJPZ1ZzaeEeE0mGgwHZhSy4Uimvm+sKvUHnv7bwAnWmY7EEViLwvM5AcgVvkV6SiuB3jvNNOQso3IzUN49gEOZswhuQFubErGKj2ruvA91bpd+U2bGYKv8bJ9Imyv6MMdSQotKRQKATTuMk1dmKs0hOssp2jQtIHxh5E6R5XqXKLg3sbOT2mJmjA7Hf9NAA8SHlkqYU4QlxCYRvq7eKItfSrUbNeHMCDUJ1bK/KilFHyB1AZkMrUcXB4eOaztJ5C24kXpfc6fu669teVqDTZ/anrSxWrohiIkRAtDnUiCoHbN6pJsZjrs8L2KA0WbZTblIegOQdg2XwKcdpkblAPtxWlhG2ZZ8eL1sbOqzq10t9u3oV7yYsysyadAEEgqAZR2gyXOZbB/PYbqOoHt3Y3bBTUNeXpH2inOcpA2DmAHylm984XG6KuP0cKUvFtIW9NAsrBh0vX1VHDVTYVp5bAXGce8+P/ULosy5IJfH0+hwDy9q6IoyyBPVa54O1fmzDfBTrPF/Q0VxgHrpRIFKfBD9XBaJ4qHQ7dhRj8aM2h4Esr6xJXezKfwdeVIJX+ZYGwUXjJ65yqmPpgbWeIIPt6V8KFo+KQol2iPgtg
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(86362001)(6506007)(66446008)(2616005)(186003)(6512007)(2906002)(6486002)(53546011)(38070700005)(66556008)(36756003)(5660300002)(71200400001)(8936002)(54906003)(66476007)(508600001)(316002)(38100700002)(4326008)(33656002)(6916009)(64756008)(122000001)(91956017)(76116006)(26005)(8676002)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <846F4F9E641AE649A63380F52929C2B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6630
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8c1b0374-8375-493c-ce90-08d97ea54d2a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MdmLkAkrFC1aXl8DK0ykaYVdE79L3j9/AejMfhACUJfQNyiV3eLyCe0Fdj79KYhQPDvTXKovNamKZMHEP4qBIgAnViaA9Kk2q6Q59RleNDsyeehGKFymSWrJni/DGXsiAwTFxSIwz9q3a9w417tpEyGEQu8EcTQmvXLIzgD6aMExO2gfFHqca27Zqh7jmhKbP1LqhCBjzflEPMw3G0R4sfmi5gpflJeOmg6l4d/rX7LmolGM16yXJaxxWPHloJoq/XmEFhX8ilnBrROyRlhT6okXWDjJhgSJttQMnwIYWTRKUDwIRBOCMF33kLh1Vr0TVxJHp2rKj10c2iUbwnWZXEqrrx74jLmcCasCwhp2np3Pk6FMDzAvZih/1H7CeF6XwtoSZAezaYgCXraaSQeDz7VqtTLDv8dWCCVRJlvJv1XhiYvPMzlnCar4qNzg4zDW7qgRAejBxAfjYQ9g3Rz65C4pBzbAe4eP4+b7hDcI5zrdpAhJsx4aMRHdD9sz+mgK+QJDJd/jiwg5N61l0lH7a+ZLa9T0WoGviA7NWWyx1C2UvmyEmWrSBUbrQmrwyfUL44rh0JW7LpiqPrYZsDdyaQCfIIj2lgDwxOdJApe9/KiIUJQ40Aqu5mgl0toAU3Kb0gIWKXqDnFQ94v6abiGeLQg9WikFzwF9xc+09QMPm6n4A7ja3ZKS4ieG/CSmhso7HK5YbILB2TnL/oguB44+hg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(26005)(107886003)(186003)(4744005)(4326008)(6486002)(53546011)(356005)(8936002)(6506007)(8676002)(2616005)(6862004)(6512007)(316002)(70586007)(70206006)(54906003)(336012)(36860700001)(36756003)(5660300002)(33656002)(508600001)(81166007)(86362001)(82310400003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:18:04.3243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa31dfd2-1a1e-47fa-28fa-08d97ea55700
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB5225

Hi Julien,

> On 23 Sep 2021, at 9:52 am, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 23/09/2021 07:23, Stefano Stabellini wrote:
>>> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
>>> index 4b32c7088a..5406daecda 100644
>>> --- a/xen/include/asm-arm/pci.h
>>> +++ b/xen/include/asm-arm/pci.h
>>> @@ -18,6 +18,7 @@
>>>  #ifdef CONFIG_HAS_PCI
>>>    #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>>> +#define PRI_pci "%04x:%02x:%02x.%u"
>> This is added in this patch but it is unused here
>=20
> To add on this, this is technically not arch specific. So if this is nece=
ssary in a follow-up patch, then the definition should be moved to a generi=
c header.

I introduces this to print SDBF but I think it is better to use %pp to prin=
t SBDF. I will remove this in next version.

Regards,
Rahul
> Cheers,
>=20
> --=20
> Julien Grall


