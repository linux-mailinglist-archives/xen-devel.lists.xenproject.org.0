Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D256B798013
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 03:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597733.932058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeQAN-0004XB-Te; Fri, 08 Sep 2023 01:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597733.932058; Fri, 08 Sep 2023 01:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeQAN-0004U6-QM; Fri, 08 Sep 2023 01:20:11 +0000
Received: by outflank-mailman (input) for mailman id 597733;
 Fri, 08 Sep 2023 01:20:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01z4=EY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qeQAM-0004TY-Gh
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 01:20:10 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20606.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d88540c9-4de5-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 03:20:07 +0200 (CEST)
Received: from DB8PR06CA0040.eurprd06.prod.outlook.com (2603:10a6:10:120::14)
 by AS8PR08MB8491.eurprd08.prod.outlook.com (2603:10a6:20b:566::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 01:20:05 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::22) by DB8PR06CA0040.outlook.office365.com
 (2603:10a6:10:120::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Fri, 8 Sep 2023 01:20:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.30 via Frontend Transport; Fri, 8 Sep 2023 01:20:04 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Fri, 08 Sep 2023 01:20:04 +0000
Received: from 3d825ecbea08.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4CBBB849-A64E-4071-8620-B2339D06F258.1; 
 Fri, 08 Sep 2023 01:19:57 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d825ecbea08.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Sep 2023 01:19:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8280.eurprd08.prod.outlook.com (2603:10a6:10:40c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 01:19:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 01:19:53 +0000
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
X-Inumbo-ID: d88540c9-4de5-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O4VxaFyW8EgXzrUK4x68EK2EC9Sli8p8ZptvkWN0Qw=;
 b=KanBPhGtKgmm/3QmlZ9gsNNH+h+tSg+f6w+RDROs5gUv25RAz3BSYK6WUTjzUOKX+fahgVpQz9i81iGHJpvLdXAf17UAQUmVdzshPOT9q7I1gPZKO4NMDkAbSa8dljU6rQbMEArH5v4RLOs53CzZt9t3oX11qbFkmfLXwtvxlIs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: be180b0149a46a94
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmHHM2GyYRLZ3uObGGWadqovPpJ8C4BBrtP4F5zi9YTpFE2JWi1tDa1P2VLRCxpOLUnCy8lEsA7vep0+GRBJH9Wjks7muKClMHARyme43B2ruPYzwL89Cc30KkebtXFVJoGt3Ax3bvMZ14LX1GzIgKRpahXUM4zBKMOixqxtYzKjLkMR8VCpDu9JVZ1M76AJdFUz/fxVOI47oWq10AZ9qwAKFfLVSXijV7aDAA6F+glagU3ATAtiQG56q0F6mX0lsqP7R1Bl5TXixV4AZcdxGkrLOHZOErovVJ6e4WfIqinny/aUUW3dscq4DNKvRFkAAZLxCLwhs2MjDluU3KilBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4O4VxaFyW8EgXzrUK4x68EK2EC9Sli8p8ZptvkWN0Qw=;
 b=MOSONNAEm9ay8Y3nT3RKB14krIOCSiq9AgOzeSQedUKRA9ZYEFySn4MMT5LiAj2Q+jrFCocjdAWqa33klShmhH3pmKWgd0GX3rnD28gmK9SogSNRSQ0+PsL8shU9mBnDw51sQ6IcpjgLGQBySOw0bN0+EqTvM/QtqRkhnj188sBv2BYINnUees8SBxLePNz9TLvbUfoXwdBFfkQrbieC4WLMpkHbVRlNqDHs+CnkJQnXith6Gn8pqhx6/4x8JoN1JgSm43PVaKyc8N9MMCC7O65qsysvr92X/Df1dyCCHn5rUhhXepqqcGBD9t0Qt/yjkTJ9+tN9uXASqA4OBEwdXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O4VxaFyW8EgXzrUK4x68EK2EC9Sli8p8ZptvkWN0Qw=;
 b=KanBPhGtKgmm/3QmlZ9gsNNH+h+tSg+f6w+RDROs5gUv25RAz3BSYK6WUTjzUOKX+fahgVpQz9i81iGHJpvLdXAf17UAQUmVdzshPOT9q7I1gPZKO4NMDkAbSa8dljU6rQbMEArH5v4RLOs53CzZt9t3oX11qbFkmfLXwtvxlIs=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Javi Merino <javi.merino@cloud.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] coverage: update gcov info for newer versions of gcc
Thread-Topic: [PATCH] coverage: update gcov info for newer versions of gcc
Thread-Index: AQHZ3iNWSCffVdKvQ0utMDxU3A51YrAPdqKAgACyLQA=
Date: Fri, 8 Sep 2023 01:19:53 +0000
Message-ID: <F91BEB8E-7BB5-453F-8620-6E5F3B331D51@arm.com>
References: <20230902151351.10325-1-javi.merino@cloud.com>
 <ce6e7abd-40ee-dd9e-b17c-10c39ca0e422@suse.com>
In-Reply-To: <ce6e7abd-40ee-dd9e-b17c-10c39ca0e422@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8280:EE_|DBAEUR03FT022:EE_|AS8PR08MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a20ae50-7b36-49df-c25c-08dbb009bb15
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Mj/dDnMQa0jFZu4BVfPODKoRCl4JjcQJl6fSTXbUflkxaS2300g37dugpQwSVB4bCbPZ15rFmwU2OIIQBjLKCNmCUBWRCEjRM8o+a/dNpqRK8j+dw9LDnxIcciajiFlXfgHyGcvpOPt+eZ/9BYCHFf1ZyM5Z1nyOpGFs4oiVSeUy56PnDVGPZ0vy3m4T5Tt+O2iCWNiBsNpNL5U4sO52Z5cnZnA6Wf5DcSp5HN4Kz5YkMXJIPzAvPnAxTiOZRkxP5aGdCd5PfHvDr3fJ1yITaDnELTQ2bTJMdry3Hquh+Y/Mv3s8hgkxqbSnSc30sU3Q4JKkr0JmBAzekf9txnEiCr5Yg43NY36Qw2n0fzIX1YlFwvPAKovUSPUYKyIrpRLEXoHO0WyGirhEqH4dwmXjyX1rqhgFodQhgvwcJhPJDhlNOtTCMOJPnGz06o8zjE1uxLy+FPo3mmfHKpPuQ8JHQKLUaOnAgtkKNq2hzzS2hqv9qKQn1thgT67eMvA9dtTAJR06c4ec7MP3OhhSXs8kXxzGP5Tvd4jAvn2MoP0jY4OGhnfUqVaHpm4PoRuB3s6rEZGQ536d9x0kEAPbgJ1ucUQ+PsqrcNREaRjZMvK920aEZZFrNZL9iQZKDaJ6S3+RgcVOtgRJqCsvy5ayk1D1/g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(38070700005)(6506007)(6512007)(6486002)(2616005)(5660300002)(6916009)(86362001)(316002)(2906002)(26005)(122000001)(66476007)(64756008)(54906003)(66556008)(66446008)(66946007)(91956017)(76116006)(71200400001)(38100700002)(4326008)(41300700001)(8676002)(53546011)(8936002)(36756003)(558084003)(478600001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <572195BA765CAD4E9B7E21D353A4181A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8280
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	957e4d3f-3138-424b-93b5-08dbb009b48c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RutztO4mMU4bZ/WC+xj1ZfhFlHrJvj5dNVK7UqA7nQ4hnuYfCboc4+ZrMpjfzvMsEp0VkFO/C2g0UrAgFihCKv2YiS/NNbbyTAb5m8576oOaQtqeRZfvj1DOTP1//EUXHgRUE57qX8hoYA+JCLkZ4KXa933KOAKuM29lYtm+t3W39OOLsNjvY20eBeEAGwtcykbvLQkCPGV4pcv+DBVnf3YbRsx1emhgRSB7pXrT0aO2TUptBdn/d08lHuvAPp8NqBZR/aL9PM1OmDCoBQbbnFMxw+xinZN8FnT3kyXvR84WNZIWsvTTT16d0rfGAKEEkVjFVxnxKEVj8NoZoNrSUuN5cvvMCrOVwpHVD3QCY4/FsMrxw8JTUZMJBbSHVrOjcs2ouub3dOShi4ZDELaHkSXk1qW1DHENIlzaEhVU2vZs86BF6A+grceV/RWUWXQxW/zsPgT/LUnPjPXEHamhabR9fYJVnQp5s2lywI0QReVrpco+ZbzoKwMyDu1MLmon4nXkpwPjAb6Ye0ou7dy8Q7QEQ7oBgDN9O7R5U4V8jXRxJtjIXUl8wjpnspjaSvSawPBR1TrtkzpXdJfOtBh7g87WA4Qs9BF8rBnXSGVVvJCTjPb9VtrmJtoS/jwEcqSAfBtW1x4gS6Me80gBACz+tjxOM8B1l//ibyAWYiJvfoR1goLkZIOxWjl6tU8AY7z6rjod9/GUTVkNp4bK+RxMFBKVCXgXm5z5kgVVq5vtcPfyWXbvGgBnrSMM3ldQBoQi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(40480700001)(86362001)(6486002)(36756003)(47076005)(54906003)(70206006)(70586007)(316002)(8676002)(6862004)(4326008)(8936002)(36860700001)(41300700001)(478600001)(558084003)(5660300002)(33656002)(6512007)(336012)(82740400003)(2906002)(356005)(81166007)(2616005)(26005)(40460700003)(53546011)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 01:20:04.3016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a20ae50-7b36-49df-c25c-08dbb009bb15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8491

Hi Jan,

> On Sep 7, 2023, at 22:41, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Henry - afaict this was submitted after the feature submission deadline,
> so you may want to consider giving it an exception.

Yes I am ok to include this in 4.18.

Kind regards,
Henry

>=20
> Jan


