Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D27F85EDEBE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 16:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413387.657002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odY1T-0004Rg-LZ; Wed, 28 Sep 2022 14:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413387.657002; Wed, 28 Sep 2022 14:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odY1T-0004Ol-II; Wed, 28 Sep 2022 14:26:51 +0000
Received: by outflank-mailman (input) for mailman id 413387;
 Wed, 28 Sep 2022 14:26:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8GF=Z7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1odY1R-0004Bv-HA
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 14:26:49 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00079.outbound.protection.outlook.com [40.107.0.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b11e39e-3f39-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 16:26:30 +0200 (CEST)
Received: from DU2P250CA0008.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::13)
 by AS2PR08MB9125.eurprd08.prod.outlook.com (2603:10a6:20b:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 14:26:46 +0000
Received: from DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::5) by DU2P250CA0008.outlook.office365.com
 (2603:10a6:10:231::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Wed, 28 Sep 2022 14:26:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT064.mail.protection.outlook.com (100.127.143.3) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Wed, 28 Sep 2022 14:26:45 +0000
Received: ("Tessian outbound c2c2da38ad67:v128");
 Wed, 28 Sep 2022 14:26:45 +0000
Received: from c6bf16105476.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 49989FC2-0D4F-4D11-9A9B-07E5DB09BBB6.1; 
 Wed, 28 Sep 2022 14:26:39 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c6bf16105476.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Sep 2022 14:26:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB9713.eurprd08.prod.outlook.com (2603:10a6:20b:607::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 14:26:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 14:26:37 +0000
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
X-Inumbo-ID: 8b11e39e-3f39-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VENKByYEBY7fRRI1GREQLI9Jp2+4IxU4hBpOjGrpQ36Xghflgr9L5Iwcwe91gIOm0/mC7fgZUv8lYxsfr8K8zDu2IbspNU12ICH3+P6lR5nWpg6trwULBnXOBBdtnk4F/F/76B6v94g/1ocounyuvHHBNOV/BMSmQjkcu1cZloQDEYXvmI8/NUWHaNxVCasFFhVvEN1QYwYAW933uzUdRYzJC0iaDXHdiwwhhxb3y2gfBaQkmaS9yGzvbYAYkoHiV44XCdk9MZHeZgc1RYK9OngWc8oKi5wx2WDtsQmHuf7uKEA5PU0p5XS4sxwDsGbgKbIkUZhZNLlmquJc8MUgtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dut5FZxIQvOieyniQrkTETxjPPlI4cVyzE43JJNsBT4=;
 b=JANtpLAICSxAY6YP3b3tSg8kSRv/jpOVU+fcC0wvTVaGwFX/VKvlsI7R0bmCy0wvKwpwtx1eJYZgcu7VSZinsHLtS6X5RXDS2TjWZ0qUR6E9VPy1jKWiO6p87yn4aGHV97haamRGGAwAeGNZnJnO+UT5tZ8TYLsBTwisuMzprXS9gVRhSHymWKTC1caUlHrkxveNGbFE4RQ0OviRN/jw4fgC+IkHYIGBuYwEJbdqz1e6/iwC9sLue3ocpLtkrQDGOL69l5n1J6e+v3dlMOLH/AwFMTQZgkGDleQbuCyUf6Ns4ORCXuwbXnOR28KbtMUa/P4ipG5nd+7pjsSQ7ZUXmg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dut5FZxIQvOieyniQrkTETxjPPlI4cVyzE43JJNsBT4=;
 b=rPTNSth6GY3vHWHQletMXRCdM1qRuNuVaf0E2iEI0zBkHPLPgcmh0CIi67og3S51o6fmn7ilTmlaXHj7V7L32UYh+miawa8DTES/f3cwp8hHZMIHHArsNt+TRbm6aThQ6GdeMUvt1lO6i1/iKel8oUDe2NNhWlv2SQ4eleNnVqU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e1c0f0b4891abb61
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYvwbJFIj1KY73tUvNTYQaxsfZ41uq9SYCFzZJu2OREXQplyKAbsCHGjKuXiOai5XESg1rL62eg6NQMbEVgsBiiMvgLpSRXt5e50+lAVI5z7+uWr77PzTY6GZ7lOzo5sA2+zAZXOH62gvMqpty3RaFrNE5zOZ8CO5ToQj0E3SQQ3vG7RpzZh0WkvsbsA5tdaUdRrf2JyggVX+uiEHQjtkceGvXpkRtmFw/h1TtSSOCGj9kNmC6jvX2TLznWX93F/dFz1a8ecZiZaGZg/c/2hEQ51shmY9evzI2nkkbShg+bB0l7aslZL4csBzFS/PlLBH8+m3jyGGo+2Srf6oQZOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dut5FZxIQvOieyniQrkTETxjPPlI4cVyzE43JJNsBT4=;
 b=SHLWbA3PRDk2cqlwBHIK0bviLdDXyLTpJzfbJJWCyDTrgJooa4UT11M1+LAVFIK52CrHIr26fluhNK99rG6j4K9m8BagNTf9JnzdALGLeP5S/Pm2Wmt61ta3J053g16iYUsl2CGbP1x9KZRTl/xLZF1O7cEYjpf/bbWSoWVt0EZ1tWxMQm6lEyRwDVx62wE7yelUYGu4f54vF6oPddFp1fU8KoDWh9TiTfVHgDH1KocYGFhHmPgaop/G0yA1KdjRGIv9mTZPYcodwODPCVRraAi5sCczODKAvtPJ3LouW1yFn3AXQD45F0w8MscEa4OqmI/7LNNSO3o/Yv/XO28wOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dut5FZxIQvOieyniQrkTETxjPPlI4cVyzE43JJNsBT4=;
 b=rPTNSth6GY3vHWHQletMXRCdM1qRuNuVaf0E2iEI0zBkHPLPgcmh0CIi67og3S51o6fmn7ilTmlaXHj7V7L32UYh+miawa8DTES/f3cwp8hHZMIHHArsNt+TRbm6aThQ6GdeMUvt1lO6i1/iKel8oUDe2NNhWlv2SQ4eleNnVqU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/2] arm/vgic: drop const attribute from
 gic_iomem_deny_access()
Thread-Topic: [PATCH v3 1/2] arm/vgic: drop const attribute from
 gic_iomem_deny_access()
Thread-Index: AQHY00Q8lAoIzTsqYkip0fWlnJ+tE6305hgA
Date: Wed, 28 Sep 2022 14:26:37 +0000
Message-ID: <6FDEAC4F-BD2A-4995-9D22-BD3356720269@arm.com>
References: <20220928141117.51351-1-roger.pau@citrix.com>
 <20220928141117.51351-2-roger.pau@citrix.com>
In-Reply-To: <20220928141117.51351-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB9713:EE_|DBAEUR03FT064:EE_|AS2PR08MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa44923-8d26-4c69-c50b-08daa15d78bd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qOS/mbwazMly9Guw1nTLk7XOPHgBjrHtbrJOktV7qpekTYefQTRxbv6WVMWg0SxcJkmTZQJbpBUtXvSp0ec470g9D5rnQ0V1U2BtdJ1LeZq5ZjIUSaVYepujkoFA03AwyjHC97Sbt/uxtoZE82Ttw7/MmsPuHwldLK8nyM0zxHNvao7lSVDFsTdlG7dL0PrRfn5BFBZf8A9jI/e+7/TG7/JHNrDdnZlyiHNYhIGWsQs7y5+EDyW+8yi6BozMFCCInmL0iMNje2tbzEy4XTIWh65+DSMHHgjqnqSHT70yG4bs8Dzu4lD5uWHTVn5CigCPg/T5jLyD+gS2rp7YGKQw03ELPTI7p0lpWGOwugWOG7VSRXEQ0gyRT72T1prawzZ8kZK67ecZhVxVDqxM9r76WXynIWjtHiRbdrnmiM37EPSiNFmasrgdHa9IC9dc6yHkn0ty4qawZlPOtUwORNl6QqVCiWAirJCdJ7PSY7etu/gm6T9NJfkPvJZi4ImJnMxSprfddQ3kBbAbCq0tbfawOb9Ox8ZzGoeTDFIZZUf3qH9oKndAAF2iMs8nwbP7P53Z86wjO2IqigjKUSKTRIBjJFHltAUwxDN3KaD2/FAhMzpkZY6xUDh9hLl91YXPCBwmJ2zZRNcPM3XKjPIeCBUqL9uNq84jlA8sGV2qZ01HGYSNBPm222fn+8hS9uwIfAaZV057a7lgWEGDkUvDOwbdIwFNYN9MW8a23QWQIHnJtnM3aoUecL38bwCYVx46qfwKdGSGrv0cwfCg3GPuhx9o+nU9IpdUwNdlrsY1NwUDYqc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199015)(53546011)(26005)(6512007)(6506007)(38100700002)(8676002)(122000001)(54906003)(6916009)(76116006)(66556008)(66946007)(71200400001)(91956017)(66476007)(66446008)(64756008)(86362001)(316002)(38070700005)(36756003)(33656002)(4326008)(478600001)(2616005)(186003)(8936002)(6486002)(83380400001)(41300700001)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA793BFB0489D64A911E5B5AEA1817EB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9713
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d11d6f8-28ee-4074-454e-08daa15d73f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6YqQOP1mAt+/BQYOLL9cBI8aVRBzIgxNL+V59hI3nVprxUPTcjIVhOyr/MnTHt/kHSSUTvnBop0M7yqPVx+QPhN85Sf2f9xLKZ0XGJgM23+IZRKwoqdTnxQ0cnomvVap6VrWCabAsOquhlWhfIwqZKpSaWxZy1K+m9Ue/11e1CXwjaC1Wmc5QOSoAToovv8Ok1oH6U9WKIT00TFkpFM12UxVGvLC4mdZ6FgoiS9WoXlGfdA+9N17sBOWyKg0DU8Yupp0Woz0iaDA85WOINcHxULxBQKsJIDG2ODTb7ylm+FJVIZMMdOTbSE2s517bMCq5D1L22y6lQ0LrjuczEuEPtoAht6Bjd8EZEOXKKyDd/whTRm6YnbpVdyq51SFJnEgXToPP9PoWkY1gymME2fLI9zfB285Y9D2lnrZGFXIIUQw43vgkRA7Z/5px0mZUBU3VyJ7Mx1UKchG6rvhTh0eW2AKY/e/pEX+6te6ujlSHf6xJwcIePgNvwChZjb1UMH0TV5AQw1tDyWJRyE6bU4L4k4wXrnUUBewd5L0ck3/R4hlPVrqNkJc4iMht2vubk9y7eZiv8H3KMfQQCNcEbfWJKZNazGFgcUXngoYyYt6RNjL8hHKb8EsoHCOPcmBFLOoo0lURUnOiKGjB8VVtZ0pmkVmJ93UqMOUvNbKFgcrTgyqeKMipmnNfDeeazHFfKtGQez1w61N3A9eI/KUBNBJv1NCsi4lwOR59tlCLj9Il8pwWRhx9HYs5deqkEP112/RjGVZSwMARVVGlo20dPXkbw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(2616005)(186003)(47076005)(336012)(82740400003)(81166007)(356005)(36860700001)(6862004)(40480700001)(8936002)(5660300002)(41300700001)(2906002)(82310400005)(40460700003)(478600001)(6486002)(26005)(6512007)(6506007)(70586007)(107886003)(70206006)(4326008)(53546011)(8676002)(316002)(54906003)(36756003)(33656002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 14:26:45.5923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa44923-8d26-4c69-c50b-08daa15d78bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9125

SGkgUm9nZXIsDQoNCj4gT24gMjggU2VwIDIwMjIsIGF0IDE2OjExLCBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFdoaWxlIGNvcnJlY3QgZnJvbSBh
IGNvZGUgcG9pbnQgb2YgdmlldywgdGhlIHVzYWdlIG9mIHRoZSBjb25zdA0KPiBhdHRyaWJ1dGUg
Zm9yIHRoZSBkb21haW4gcGFyYW1ldGVyIG9mIGdpY19pb21lbV9kZW55X2FjY2VzcygpIGlzIGF0
DQo+IGxlYXN0IHBhcnRpYWxseSBib2d1cy4gIENvbnRlbnRzIG9mIHRoZSBkb21haW4gc3RydWN0
dXJlICh0aGUgaW9tZW0NCj4gcmFuZ2VzZXQpIGlzIG1vZGlmaWVkIGJ5IHRoZSBmdW5jdGlvbi4g
IFN1Y2ggbW9kaWZpY2F0aW9ucyBzdWNjZWVkDQo+IGJlY2F1c2UgcmlnaHQgbm93IHRoZSBpb21l
bSByYW5nZXNldCBpcyBhbGxvY2F0ZWQgc2VwYXJhdGVseSBmcm9tDQo+IHN0cnVjdCBkb21haW4s
IGFuZCBoZW5jZSBpcyBub3Qgc3ViamVjdCB0byB0aGUgY29uc3RuZXNzIG9mIHN0cnVjdA0KPiBk
b21haW4uDQo+IA0KPiBBbWVuZCB0aGlzIGJ5IGRyb3BwaW5nIHRoZSBjb25zdCBhdHRyaWJ1dGUg
ZnJvbSB0aGUgZnVuY3Rpb24NCj4gcGFyYW1ldGVyLg0KPiANCj4gVGhpcyBpcyByZXF1aXJlZCBi
eSBmdXJ0aGVyIGNoYW5nZXMgdGhhdCB3aWxsIGNvbnZlcnQNCj4gaW9tZW1fe3Blcm1pdCxkZW55
fV9hY2Nlc3MgaW50byBhIGZ1bmN0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQpSZXZpZXdlZC1ieTogQmVydHJhbmQgTWFy
cXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4g
LS0tDQo+IHhlbi9hcmNoL2FybS9naWMtdjIuYyAgICAgICAgICB8IDIgKy0NCj4geGVuL2FyY2gv
YXJtL2dpYy12My5jICAgICAgICAgIHwgMiArLQ0KPiB4ZW4vYXJjaC9hcm0vZ2ljLmMgICAgICAg
ICAgICAgfCAyICstDQo+IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9naWMuaCB8IDQgKystLQ0K
PiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXYyLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXYy
LmMNCj4gaW5kZXggYmQ3NzNiY2M2Ny4uYWU1YmQ4ZTk1ZiAxMDA2NDQNCj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2dpYy12Mi5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9naWMtdjIuYw0KPiBAQCAtMTA4
Myw3ICsxMDgzLDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGdpY3YyX2R0X2luaXQodm9pZCkNCj4g
ICAgIGdpY3YyX2V4dGVuc2lvbl9kdF9pbml0KG5vZGUpOw0KPiB9DQo+IA0KPiAtc3RhdGljIGlu
dCBnaWN2Ml9pb21lbV9kZW55X2FjY2Vzcyhjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQ0KPiArc3Rh
dGljIGludCBnaWN2Ml9pb21lbV9kZW55X2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkKQ0KPiB7DQo+
ICAgICBpbnQgcmM7DQo+ICAgICB1bnNpZ25lZCBsb25nIG1mbiwgbnI7DQo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMNCj4gaW5kZXgg
NjRiMzZjZWMyNS4uMDE4ZmEwZGZhMCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2dpYy12
My5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9naWMtdjMuYw0KPiBAQCAtMTQyNCw3ICsxNDI0LDcg
QEAgc3RhdGljIHZvaWQgX19pbml0IGdpY3YzX2R0X2luaXQodm9pZCkNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJnZiYXNlLCAmdnNpemUpOw0KPiB9DQo+IA0KPiAtc3RhdGljIGlu
dCBnaWN2M19pb21lbV9kZW55X2FjY2Vzcyhjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQ0KPiArc3Rh
dGljIGludCBnaWN2M19pb21lbV9kZW55X2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkKQ0KPiB7DQo+
ICAgICBpbnQgcmMsIGk7DQo+ICAgICB1bnNpZ25lZCBsb25nIG1mbiwgbnI7DQo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vZ2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLmMNCj4gaW5kZXggM2Iw
MzMxYjUzOC4uOWI4MjMyNTQ0MiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2dpYy5jDQo+
ICsrKyBiL3hlbi9hcmNoL2FybS9naWMuYw0KPiBAQCAtNDYyLDcgKzQ2Miw3IEBAIHVuc2lnbmVk
IGxvbmcgZ2ljX2dldF9od2RvbV9tYWR0X3NpemUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkNCj4g
fQ0KPiAjZW5kaWYNCj4gDQo+IC1pbnQgZ2ljX2lvbWVtX2RlbnlfYWNjZXNzKGNvbnN0IHN0cnVj
dCBkb21haW4gKmQpDQo+ICtpbnQgZ2ljX2lvbWVtX2RlbnlfYWNjZXNzKHN0cnVjdCBkb21haW4g
KmQpDQo+IHsNCj4gICAgIHJldHVybiBnaWNfaHdfb3BzLT5pb21lbV9kZW55X2FjY2VzcyhkKTsN
Cj4gfQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dpYy5oIGIveGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dpYy5oDQo+IGluZGV4IDM2OTJmYWUzOTMuLjc2ZTNmYTVk
YzQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9naWMuaA0KPiArKysg
Yi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ2ljLmgNCj4gQEAgLTM5Miw3ICszOTIsNyBAQCBz
dHJ1Y3QgZ2ljX2h3X29wZXJhdGlvbnMgew0KPiAgICAgLyogTWFwIGV4dHJhIEdJQyBNTUlPLCBp
cnFzIGFuZCBvdGhlciBodyBzdHVmZnMgdG8gdGhlIGhhcmR3YXJlIGRvbWFpbi4gKi8NCj4gICAg
IGludCAoKm1hcF9od2RvbV9leHRyYV9tYXBwaW5ncykoc3RydWN0IGRvbWFpbiAqZCk7DQo+ICAg
ICAvKiBEZW55IGFjY2VzcyB0byBHSUMgcmVnaW9ucyAqLw0KPiAtICAgIGludCAoKmlvbWVtX2Rl
bnlfYWNjZXNzKShjb25zdCBzdHJ1Y3QgZG9tYWluICpkKTsNCj4gKyAgICBpbnQgKCppb21lbV9k
ZW55X2FjY2Vzcykoc3RydWN0IGRvbWFpbiAqZCk7DQo+ICAgICAvKiBIYW5kbGUgTFBJcywgd2hp
Y2ggcmVxdWlyZSBzcGVjaWFsIGhhbmRsaW5nICovDQo+ICAgICB2b2lkICgqZG9fTFBJKSh1bnNp
Z25lZCBpbnQgbHBpKTsNCj4gfTsNCj4gQEAgLTQ0OSw3ICs0NDksNyBAQCB1bnNpZ25lZCBsb25n
IGdpY19nZXRfaHdkb21fbWFkdF9zaXplKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpOw0KPiAjZW5k
aWYNCj4gDQo+IGludCBnaWNfbWFwX2h3ZG9tX2V4dHJhX21hcHBpbmdzKHN0cnVjdCBkb21haW4g
KmQpOw0KPiAtaW50IGdpY19pb21lbV9kZW55X2FjY2Vzcyhjb25zdCBzdHJ1Y3QgZG9tYWluICpk
KTsNCj4gK2ludCBnaWNfaW9tZW1fZGVueV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCk7DQo+IA0K
PiAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovDQo+ICNlbmRpZg0KPiAtLSANCj4gMi4zNy4zDQo+
IA0KDQo=

