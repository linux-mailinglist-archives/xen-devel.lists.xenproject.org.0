Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03D87779A4
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 15:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582096.911676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU5lI-0005PM-0m; Thu, 10 Aug 2023 13:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582096.911676; Thu, 10 Aug 2023 13:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU5lH-0005MB-TS; Thu, 10 Aug 2023 13:31:35 +0000
Received: by outflank-mailman (input) for mailman id 582096;
 Thu, 10 Aug 2023 13:31:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5UL=D3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qU5lF-0005M5-Kz
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 13:31:33 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe16::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36a9dc1d-3782-11ee-b284-6b7b168915f2;
 Thu, 10 Aug 2023 15:31:30 +0200 (CEST)
Received: from AM6P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::29)
 by DU0PR08MB7639.eurprd08.prod.outlook.com (2603:10a6:10:320::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 13:31:23 +0000
Received: from AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::45) by AM6P191CA0016.outlook.office365.com
 (2603:10a6:209:8b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 13:31:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT007.mail.protection.outlook.com (100.127.140.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Thu, 10 Aug 2023 13:31:22 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Thu, 10 Aug 2023 13:31:22 +0000
Received: from 2833df892b3b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 46F743B2-AEEC-4948-BD68-020C8B50136C.1; 
 Thu, 10 Aug 2023 13:31:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2833df892b3b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Aug 2023 13:31:11 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM7PR08MB5510.eurprd08.prod.outlook.com (2603:10a6:20b:109::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 13:31:09 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 13:31:09 +0000
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
X-Inumbo-ID: 36a9dc1d-3782-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOxKVzseZD3tX21APUomyo7znpD9dTbWKiHyQZa8zOE=;
 b=LaArES63r1iOE/WY2NJkK4XX7kLWCjEZjuAaymn7/jec1lEBiMCaf/5SwJqorm3j3RKrbLW/KoeNHEcu20XbeURlq81EQ+4wKImZVmgaSWk2JgE1SAcZo1FPRpwLUJS4RvDVk47dnpYpcq/BelOtd0j1ycqLUrylfIJb8cd+NHw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 283012adc2e54b15
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ol0rNu1CRltDLnqFUhTx3PDKYsnRLeuA3UQzTZHu4jzCsF1NdG9jJMFvh3DgycrcqT208kVZFVxvTFDcMzSChIZu/EL7RaFmbSn+sp1AdFjK+8wm2w7N1tGSLb2wpGQ8Ak4j2z3pUJmW/NZq5u/oevmbIB1fXIjLyszzfvbus0b+sKKapAnM641xGhqamnQRre2mE3tTwIX3vpATG7d11wYInBJ2GwHSLO8Dgq5gQyONzz49UmiAfqeAX7fSRL59SbgJXCzi5UFnLXLxxan7IwZyIYBlc0AaqrxyymfM+bHflfvq8P6uNpDSMMx/ZKLCb+Uq2SQY0tbOw7gXg+8WpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOxKVzseZD3tX21APUomyo7znpD9dTbWKiHyQZa8zOE=;
 b=TExzh8xf6+GDYRY/ONvXUcIvnnyJ8DPI4ry5OJiWFbbHbikwB1dATlmkYLMUnjEtEGlbEr6X7BRQgITYKhErf9GPwolBqX79OmVtMw1wZ22WUGNK3Ktrp4+iD8tUHCdVFZ29uNX3AE1Ydk2wsve/JqatjaY0HDXMZKCYS4PWzf6VkiZx6etxLM/6vIeC74EXxTgsY/GTic2jiRNLkp0O2KCrETLvKZrVHTYJRp+2aoXG+Caboh8SaucvQleIYRBZnDlD3sBAq3Rg5MQI2mBHKgucmEOOx7FV7gw77CGhf8m3LVSQjyQ6wzS5ze+JhloHJ8JoNsv7mY133sRCd1qqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOxKVzseZD3tX21APUomyo7znpD9dTbWKiHyQZa8zOE=;
 b=LaArES63r1iOE/WY2NJkK4XX7kLWCjEZjuAaymn7/jec1lEBiMCaf/5SwJqorm3j3RKrbLW/KoeNHEcu20XbeURlq81EQ+4wKImZVmgaSWk2JgE1SAcZo1FPRpwLUJS4RvDVk47dnpYpcq/BelOtd0j1ycqLUrylfIJb8cd+NHw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: Fix initrd placeholders generation in
 make_chosen_node()
Thread-Topic: [PATCH 1/2] xen/arm: Fix initrd placeholders generation in
 make_chosen_node()
Thread-Index: AQHZy32D8bvJWFq2S02jfFulAD0k7K/jhs8A
Date: Thu, 10 Aug 2023 13:31:09 +0000
Message-ID: <C64B8D3B-24CD-4312-97B4-1B1621EDBDDD@arm.com>
References: <20230810112544.17365-1-michal.orzel@amd.com>
 <20230810112544.17365-2-michal.orzel@amd.com>
In-Reply-To: <20230810112544.17365-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM7PR08MB5510:EE_|AM7EUR03FT007:EE_|DU0PR08MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: b7af7000-120b-43d3-41d0-08db99a6168b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8Tkh+9EsaVrkaGiHpvbH0wRhXFZLfNrGVJBZTo88IGck78Sq91ozIha3MpRNwXxRhlMkDeXXiEIlgjUgXYq5jxhzGMrekE03SkQ41bPdZDGfwej+2BzTT5evgC7DNSr4umyZ1qikRN9uZhusoVPSakCidLF7G6m7a1TdP0pbbitgw2tXrPhaLUDD34xAaN+YtdDpVFO8GUlVfET2iWMIz/u9QUsN5OuY8PW6kM7vlwOuf8k0Hz1htUn4GGhUB+uDH2bJ01u1hJDVOjYNhPaZWW+V22dTVazmo9/2lKOJvyXcWzYdzwig/D7577sWYsKxNAyknwCo8wRbKPPuuwOLUHO6vb5v4dNRmKd/+ia0eR04tFNV3ZgLrawN9piMCvcPRYCZ1YZZxSaDHLqmFADJ8VnM5KkAO9zU95dgdtjhaH3pWzLSlhb4YCVAy5q48HCAfFCgEV4+2/xoHMfw6tJmQwJXX8M1mqvRUKSRYwWA31PaeGFNADD7qbEJ6u2k025OU9Z4HOgilJdDc2PcYafAlZQDUjf9Jsa3760zCsLMByUPEyw4ICTgSvtcebBlAiVqXXho8fbpBnpW0GTcGPUih7iLyEyyrlOPzKXje6EZ2ffg+7DGKLFXmZUWVfztLMs3owWECah9WCAnnPhxDHkyuQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(376002)(136003)(396003)(1800799006)(186006)(451199021)(33656002)(36756003)(71200400001)(478600001)(91956017)(54906003)(76116006)(66946007)(6916009)(66476007)(26005)(66446008)(64756008)(6506007)(66556008)(53546011)(6486002)(4326008)(4744005)(6512007)(2906002)(41300700001)(316002)(5660300002)(122000001)(38070700005)(8936002)(8676002)(86362001)(38100700002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CF05BA96EA0F31468C65D70F1AB37445@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5510
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b22d5100-1886-4f06-42b6-08db99a60e8a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pqIDaWPdr4N1hsutO2RurTwEztxlrgjwlON3DO8wykEigWo6ATO0jciSP+ap3255kvrKWFjTWx1GzHu6Yw8P/fNPQDahcGulg/wPPPH8jOnukSjjZ/sZgzPTKbRL0DomnC7jCtpx9b7WBT1JptgmmfwHlUqbU5ygGSRZsv3gTywAdp+le0Oh7kHILM6l2NNUpJm0JozzkrByARbXt58TAhgL6N3UbXgCh19h5ZKiRybgNiWsoMWBJckkBRaCnc2LWTaAuZO8NZTFmRBsDc/lM6JeHlRRpEnkNEmRcS+omF0t7IbOXYoCZMwhUGFzQrQ/pHb+CjvliFwEhd09bE87R2NCbuKAYCdk1HUO1DIOr5dDp8BVdrZhEWb7S55mg6WsLu0Si+/KpZD/csZ+HNaLB9eBPZaiQq/w9o7e8A6OTk4eqdfnDPO9izu6R6dx1VUAtu7QlRW56noEfMh5/lAjXlIf8Nq/lY7IgwHASSsLA+JRQc9kaq2nXEcRJmMlIb3lWOxY/Gu5FL1wwvaoCOdiaeai0CMtLnMUGjIEd7ZuUmxHEYRGmyJRCOTWM2jCHIGZPLWAy0JdoDU/Jy2Upma57FXXiZO/Ez8ism6bNHbznfEgTA5GvfWy9ZIDgR2oBtISoH4JYcmvqCjqZyHQWIASwbNg8bwF16KS+LuO21C7iCZeL1pXnzBFujWm7+FNZOzdurxY1q2018VLC1vctjrQefHP6PEl/kzQZMk9KJWBnro6G/KgBwDT2LpryIK3m8qi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(82310400008)(1800799006)(186006)(451199021)(36840700001)(46966006)(40470700004)(4744005)(107886003)(33656002)(82740400003)(356005)(6512007)(81166007)(2906002)(6486002)(478600001)(2616005)(336012)(36756003)(5660300002)(8676002)(8936002)(6862004)(54906003)(26005)(47076005)(40460700003)(40480700001)(53546011)(41300700001)(6506007)(70206006)(70586007)(86362001)(4326008)(36860700001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 13:31:22.4434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7af7000-120b-43d3-41d0-08db99a6168b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7639



> On 10 Aug 2023, at 12:25, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> When booting a dom0less domU without initial ramdisk, it was observed
> that Xen still creates empty linux,initrd-{start,end} properties under
> /chosen node. This is because in make_chosen_node(), generation of initrd
> placeholders (later on filled with the real values) is protected with
> a check for presence of kernel bootmodule (always present) instead of
> initrd bootmodule. Fix it along with renaming the variable from "mod" to
> "initrd" to prevent similar mistakes in the future.
>=20
> Fixes: 48f4bf6bdeb4 ("arm/acpi: Create min DT stub for Dom0")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Hi Michal, good catch!

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca

