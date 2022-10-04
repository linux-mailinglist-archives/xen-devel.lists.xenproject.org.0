Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEB45F41E7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 13:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415446.660028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offzU-0005kr-3D; Tue, 04 Oct 2022 11:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415446.660028; Tue, 04 Oct 2022 11:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offzT-0005iB-Vi; Tue, 04 Oct 2022 11:21:35 +0000
Received: by outflank-mailman (input) for mailman id 415446;
 Tue, 04 Oct 2022 11:21:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5ZM=2F=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1offzR-0005i5-T4
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 11:21:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2389f06-43d6-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 13:21:31 +0200 (CEST)
Received: from AS9PR07CA0051.eurprd07.prod.outlook.com (2603:10a6:20b:46b::16)
 by DB9PR08MB6410.eurprd08.prod.outlook.com (2603:10a6:10:262::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 11:21:27 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::ba) by AS9PR07CA0051.outlook.office365.com
 (2603:10a6:20b:46b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.9 via Frontend
 Transport; Tue, 4 Oct 2022 11:21:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Tue, 4 Oct 2022 11:21:26 +0000
Received: ("Tessian outbound c2c2da38ad67:v128");
 Tue, 04 Oct 2022 11:21:26 +0000
Received: from b29ab3dc4f6d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11B7005B-7285-40B7-9C35-3276C7398D09.1; 
 Tue, 04 Oct 2022 11:21:19 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b29ab3dc4f6d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Oct 2022 11:21:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9697.eurprd08.prod.outlook.com (2603:10a6:102:31c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 11:21:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%4]) with mapi id 15.20.5676.028; Tue, 4 Oct 2022
 11:21:17 +0000
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
X-Inumbo-ID: b2389f06-43d6-11ed-9377-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CPoytFmEjaUiOucyUp+OEpwIZZdrtzDCsQP5HyNb19kSGui0qWLdPYQuPrKuRfNh1dTMfYMFYYw5O1YRqRjdDttk42uXDB/WAi1PJVOKksaA9MpE4w7Pn+TmgKn9UxhZHl4xcx8l56HuHMim6BvZun3P9L5Lh4h1XEH9uNj0+EQr2PkTpEtRoFaX1w76Ntxi1z4YAKbJsyl+ci3237pflSG+S1YH8zKrbCkAEa1A+GrWa7mffbbo6Lj13Kf+PC7uRIzQVHzIOD8J6+yYEPZjwDI9a1bBg6XNE80/mhpkBSBqbwAaPl8I5mx2KdFixdJENeU/3PoPwNYCXDjpLUL6NA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReAYRI367OZFIFxwfeqxT0fiQMMtJKjlN9MiUmcB1Hg=;
 b=V/YtJYk0qMghMbPO72ZB2PSve6mT+lii/IsTt+GEKeWZ7ddmo5glaU85VTC5GvbLEsqypyyIhx/67/M5Jyn9Oy3BPEmizvlyzijsBeKHQM2eftJKH0LI/DAUUWpWz6/sbDR91BQxlzFhV8y5gZamUcyOkrGbTpuupTWR1PgfXy3Ac4E4DKbT/gbE+QCxjL7iJnyoRaJ92SXbJxR81LiNXbi2B+ETAhOWa/0JB77FDZrwEmZifSm50KF2LISn49NsuuxvE/KWGHdGOTgAiJOIJuG4SGkyyEFjFbMj1rjxpEqEuM3pzV0e/5lGNqBSU4CzoI6XNZ3GthRwKq3GMTFpJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReAYRI367OZFIFxwfeqxT0fiQMMtJKjlN9MiUmcB1Hg=;
 b=hpp129JGpS6T1Nj/907HG2ZgeCJQS02Q3N24COHt1g+qyVPua5k2/457gv0irOjkYCqGzM0ezC9FT0t0UQk/973JRLKnGwfnGD8H3m0KsoPAX1Ds+gTnWmNed+TWDnhp1L8jrTxnbtVgL2n/GzLvfRbMijArEp6IVLjk8oKfR18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bm5JHXNluK0oaEpiV53SXbJrxlCOoGGYC7UvJdPTqENNjxgW2qH4Oxrcpq1M+Z7jG0u7wSqHjEw1uQNnCi7yPjChMzlTWzivvbbIqiYgwq3UdkXi2tTdFxspUU8BVI6F0z0BB2n/Dl0KfUj5eEB/4FHW2KyYHTch0qSPKESpKn5eFb+kCA7Erc3dHOdmbr3uqjfbCs4UEg8WltNSaHyZgN4UdIgdFRp0kv/qbv+nVuBPoXGATJG0R0EcWWNMEtxKyhx+Ik87JYYWrhI9BlsiECv4JcBM1paw+AinOg9DRfBmVWWJJhnPn0DbWIz6TKIi+i8I9Kb1IMB/txQAPg3Smw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReAYRI367OZFIFxwfeqxT0fiQMMtJKjlN9MiUmcB1Hg=;
 b=ZPlzsAf+9tkw8ZpJW9oNu6sbMHu8E+Lp/TMVs79JIs6vTITl96VTN6HYQ5Azj7Agm2wLyAKLGDT9wIdCGcXdOykqc6C1QkmLDp7EcHNxEptV7uzU3cunUb5xFLIS+ucki/DeZIuuuDONfj4GZeiDO/RcCRGY3L4MqdUoxVWZo/F6GM6Ba9IdKwQ3vA2gyfJlsoSvPXAOmfUqxPP7xZGihkiVtnDr1bRG3m5BkKdAh4cxvmoqUcaL92qX2jHlQZarUYvcyh5ySLSkJ8vBewPIm1kAkLUA18x/jJUHbIh1JJ0k7LK8NWqS1OSa9MnSBVohILzXkrsO9H+S717dN1fHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReAYRI367OZFIFxwfeqxT0fiQMMtJKjlN9MiUmcB1Hg=;
 b=hpp129JGpS6T1Nj/907HG2ZgeCJQS02Q3N24COHt1g+qyVPua5k2/457gv0irOjkYCqGzM0ezC9FT0t0UQk/973JRLKnGwfnGD8H3m0KsoPAX1Ds+gTnWmNed+TWDnhp1L8jrTxnbtVgL2n/GzLvfRbMijArEp6IVLjk8oKfR18=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH][4.17] x86/NUMA: correct off-by-1 in node map population
Thread-Topic: [PATCH][4.17] x86/NUMA: correct off-by-1 in node map population
Thread-Index: AQHY19oJEykiG6eG0keCV/KH8DJyVa3+FqTQ
Date: Tue, 4 Oct 2022 11:21:17 +0000
Message-ID:
 <AS8PR08MB7991AB911245819731377747925A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <b810cdce-00aa-6cf5-05a9-acc7f3dbb8b6@suse.com>
In-Reply-To: <b810cdce-00aa-6cf5-05a9-acc7f3dbb8b6@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EE017414D3BB2C459D74E9E19C88493A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9697:EE_|VE1EUR03FT042:EE_|DB9PR08MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 17eb89bb-2c76-4196-17d4-08daa5fa93d6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 326xwsiczKSzkf5PcHFJBT7Lem1h6bAR94oYZ2ww7nTFYmwJCgKnTJT4mN0/mFIv6af6BD1IeWnp8J8KMyDu4Ruu4ddXvNia5VId57ig70uxJK9OSAPrh/LZQ0DYEnAnmJSM7p6MVIcVKv5jLwRy1DYIJ6xQJgwhAbrL93plBlU7iJRpnFvCu/rY+LamYS/aQ72rON94/me6MefMWAZm7Ynp4SEP8maflE5RBLpHFcNg/wiNSH2XkGl8tUHmxbLxHsdbeGqfsoubXNpmkbqbtJ6YyK3YsPFbG4YlTRrJLasXIZT57xsuvaSSRGNrYg8VksFfP6GaXiV6s0+BS0YOw5X6o54JhPSQKq6LM8Aykf8zB105nPsqsDO3TsHeo4Vt3l0y1Sb7PVZtejn7R6xKF2zHOVjboeoDM+plpWtnV7FdRP/48hzSZVmW4jzsHz+JKBwh1hguCyvKM7WRZdLp4MDeAT1n3jMm6i23S0g8uA/Wxic+SV57QI3nOAVw2GBbjlKFHqJBAIc/LdUmXGuEL7+8ojKfrC174R22lL+09C0MCqLKZWQg3Y73oBYxcIimKC2dZugr0tLpSHNOkwADJlxHcSNpkdiZ2OEk9YDFbctMnO7326KICXRVJKF2TfoaA7Tq1G3ajiFWCCU2XK+DP627OgUd1Kw4O5KAyOht2Sib3G2SC5dC2hheiSL1claFTOhHLaWK5gNDbUiEezzGwLXl4Qgg00RRIi6sluTrz+Kuhm6aYTCIKfk1FfWGPhbVYaB8YXCsT54RrBJSGKOmdg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199015)(41300700001)(71200400001)(478600001)(54906003)(86362001)(52536014)(8936002)(4744005)(5660300002)(8676002)(110136005)(316002)(4326008)(66446008)(33656002)(64756008)(66946007)(66476007)(66556008)(76116006)(38100700002)(26005)(55016003)(122000001)(83380400001)(9686003)(6506007)(186003)(38070700005)(7696005)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9697
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d0a19dc3-e087-4f60-5dea-08daa5fa8e26
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DPXc3EoXF0Bxee8mBGcuDkBrfrGwdskcwlvdgMa9kR+4ZhGFpkTy65ct/3h3n4Dq5Jx6/H2TGTKFuNY2dnw738lnMoa/GeQAO/4miYzjb8AKbdOOuXI+9TVKer7orz+SqwjydBBZr2QSb30vCU8g0BwGrDvs/SnJ2xqX7gEFgXerNpJ7T9fiWVGYrXeezmBDqM3E4VKRqASfJVLfnNFjxUUtePd52cRjb9/dhcBCCWbHT/TeFxHswisJ6Ji5p1AfMYFRbMnXiubillCPR/dBhy7GmF2JGzwYgTTwP1yIyJ9a6d2BFkRjrTNHmnYlE2xOJrCP1KE8qZYSgwbaBGxf04agvd4eIUvsSVrbkXQk1OCeom/OEUOOqIvEPPVQkGORrCBhjkTu5ouNJux0u0Jiu15wn4cav76KPZfFUmP6tOqwo5czx320V6wLS5338JCaamWaBqYHhXN6TZN+FYC0UYCK/sRgXGnDhnHE7xlrFIw2MWiY5ox5aDsa3bpBylEWZIl+3yJ5tMnDaThTekmPaFQEZ6TJROfWhRXk0BHVFGRy1SPYben6weKivcFMKxXB65r6XQEEin5nL9xA2rsGwvBRqWdULAHGDrnm6ktKleeXzdXkl/6+wb55bFMtIGnpr5xk7JzbaBJ9DzGIGfJUGGBORPoJmOJ/kuVZ1Y5TQDx9YqMUWHdMLan54A3Y88EbpqoPhlZMKBS8XuUIuhrKkWbF4luz4/tfah3OdkDNiqR6XntZsYkM7Mdosk9GMnRAOoc94fvlyLG4E8JDUxdHPyZFI0W40lB/6QxSL1BYRGwETzS9VmHMy4r5tZaZaRG1
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(356005)(82310400005)(81166007)(110136005)(82740400003)(54906003)(478600001)(316002)(70206006)(70586007)(186003)(41300700001)(4326008)(8676002)(107886003)(55016003)(8936002)(6506007)(7696005)(5660300002)(26005)(9686003)(4744005)(40480700001)(86362001)(52536014)(40460700003)(47076005)(336012)(2906002)(36860700001)(33656002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 11:21:26.5867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17eb89bb-2c76-4196-17d4-08daa5fa93d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6410

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXVs0LjE3XSB4ODYvTlVN
QTogY29ycmVjdCBvZmYtYnktMSBpbiBub2RlIG1hcCBwb3B1bGF0aW9uDQo+IA0KPiBBcyBpdCB0
dXJucyBvdXQgcG9wdWxhdGVfbWVtbm9kZW1hcCgpIHNvIGZhciAicmVsaWVkIiBvbg0KPiBleHRy
YWN0X2xzYl9mcm9tX25vZGVzKCkgc2V0dGluZyBtZW1ub2RlbWFwc2l6ZSBvbmUgdG9vIGhpZ2gg
aW4gZWRnZQ0KPiBjYXNlcy4gQ29ycmVjdCB0aGUgaXNzdWUgdGhlcmUgYXMgd2VsbCwgYnkgY2hh
bmdpbmcgImVwZHgiIHRvIGJlIGFuDQo+IGluY2x1c2l2ZSBQRFggYW5kIGFkanVzdGluZyB0aGUg
cmVzcGVjdGl2ZSByZWxhdGlvbmFsIG9wZXJhdG9ycy4NCj4gDQo+IFdoaWxlIHRoZXJlIGFsc28g
bGltaXQgdGhlIHNjb3BlIG9mIGJvdGggcmVsYXRlZCB2YXJpYWJsZXMuDQo+IA0KPiBGaXhlczog
YjFmNGI0NWQwMmNhICgieDg2L05VTUE6IGNvcnJlY3Qgb2ZmLWJ5LTEgaW4gbm9kZSBtYXAgc2l6
ZQ0KPiBjYWxjdWxhdGlvbiIpDQo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQpJSVVDIHRoaXMgcGF0Y2gg
aXMgZm9yIGEgcmVncmVzc2lvbiB0aGF0IHdlIG11c3QgZml4IGZvciB0aGUgNC4xNywgc286DQoN
ClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KS2lu
ZCByZWdhcmRzLA0KSGVucnkNCiANCg==

