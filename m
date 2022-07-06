Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78223567FD4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361833.591557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zUL-00049J-5q; Wed, 06 Jul 2022 07:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361833.591557; Wed, 06 Jul 2022 07:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zUL-00047R-1j; Wed, 06 Jul 2022 07:30:21 +0000
Received: by outflank-mailman (input) for mailman id 361833;
 Wed, 06 Jul 2022 07:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o8zUJ-0003d3-B0
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:30:19 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00047.outbound.protection.outlook.com [40.107.0.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c31da45-fcfd-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 09:30:18 +0200 (CEST)
Received: from AM7PR03CA0017.eurprd03.prod.outlook.com (2603:10a6:20b:130::27)
 by PAXPR08MB6477.eurprd08.prod.outlook.com (2603:10a6:102:12d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 07:30:16 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::f1) by AM7PR03CA0017.outlook.office365.com
 (2603:10a6:20b:130::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Wed, 6 Jul 2022 07:30:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 07:30:14 +0000
Received: ("Tessian outbound 8e3d5168572a:v122");
 Wed, 06 Jul 2022 07:30:14 +0000
Received: from c14f5919e9c7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5F196410-044A-4253-BDEE-34195120CF45.1; 
 Wed, 06 Jul 2022 07:30:08 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c14f5919e9c7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 07:30:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR2PR08MB4731.eurprd08.prod.outlook.com (2603:10a6:101:18::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 07:30:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 07:30:01 +0000
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
X-Inumbo-ID: 7c31da45-fcfd-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MWK6jOM5tnTPAt6peMwFKOKeIVM6/3QDN8/82kUD1T0kkicxPho9ORX9NYimsOLcQYikPvWhGXHR7FpOYUHhy+hmjOu1HNJnnVpseuvGhqLcbKgnfb6Kd8p1PRMbLNx5evQEqpNsdNFg/13e8oNvmRwpwUIrlX7BkPsVNtNEbHEehFJQWULmwx1jQ7XbPCDhIOl7VVIGjm38EezM965AJ+RdQFGAO0Cx+IHka80GfYpJHXKItmosKWCd9F+Dn4xWanlgH73X98X9cC87MbMBSt7mkGUUSuGQNf+QINw35ZGeT9zEDgEGmfG1gaKt5x97XN/fowTVeEx3rOMimdR3Dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SsFrAz8LFJzc6j3+sB7yowLQVnl4nJlI4MGGzCSIzc=;
 b=Cae0eGyeHRmY5iq5dicLhiVzt/Qhr++3OZEPbcxBqrPD4VAgOYChxZVj/DwpZAreWqZWn8Je/AakQT0lRpXjcWA/okDemv3tuEdmYjjfarbXDpM2q6t5n32eHCEco5dYufptGy+PiNFDnnteAew0gYiAALoIlXcSYSVG3hChICDnmeJ8Kh+eseEav6WoWOBrc+pZelsyGNqneT6exIolxBYapZyZMQtKPbgir359RTAWNOeBTAz/UWXg9KlKHNTZ4tYUpSLhwH9O+p+goCxke/50K5w3bmr62rgDZg0iFEut4h6+wHklLuRbYc3pVKpOnqWeVz5keUodqg70E8RVGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SsFrAz8LFJzc6j3+sB7yowLQVnl4nJlI4MGGzCSIzc=;
 b=tCl45rFAG8x8uLUMTLrDtaL79z75v9NsWSWHOjpX06pb7m5gHmNsWjvNqiXk/UdNMhRb0OoshjPVVCzdgEKH36SyGz8NjS2WMtDWxXwDOFHs1+PvU4cXHVfI8YzjNsM0QvBtx2qiAMyalCRAJyn9EAPmSL+hpLGSG7kNeAzbN9k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbTvLI1q4JRb4M1tcBBhRwBr6M6wJ0nZJ45utpjFqioelJao6QRKfRx90r4RAellCi1uU/PvdVZ1wA8KGxPDiF10G24cpHL/KeelYCABSlKslpUe5FvBCr577RxduTOOLV+2QkHIEU1uaZp2LyE/DkhrOGemB8FSIrXod9v4BKpVn4S7Img77MGAvSLd1iFLf2N0t8DqubuE4oaOr4/xAs2G99i3Lg2nwDe8hZTosh7RbRvbvq0y6Dhomxx/JXlapI/66HSqYDlGx06ARUj/01e1YbAKtQ3ENVkT+5j793JjZHHGB1/qwkkF9YqfOlrwjTEbXWKoSrFB1NOXS1FWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SsFrAz8LFJzc6j3+sB7yowLQVnl4nJlI4MGGzCSIzc=;
 b=l9Sg4BZ36gNudDsr8ewXi/cqQkGmtqL+QhYblVbmHiYrgQ3zNd5CcA9oUKDMcJ/w14zfWZ44g+caP0CRlRRlu57VkPqQK53klanmt2MuOVuONWna/UfNrxl1c1/qleGMAmmsHWp/1XpM1gVqjCyuFQJ/T8AWyz1NjLJJAqdG+slHj/+9nZcx+015tLex+q9SgTbgrBH/QiofhnVW4djATzlAlNYrkm9xjBYLPYjMFHYNoY+Mt1NPeTx8R4avly39hzT+kEw2jyx5z0CmuKJm7jE3h9JNMfq3LC618XJukG8emddCWXvevz+Y2K8E/NDxsi9muILbqi2W95zvt4mA4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SsFrAz8LFJzc6j3+sB7yowLQVnl4nJlI4MGGzCSIzc=;
 b=tCl45rFAG8x8uLUMTLrDtaL79z75v9NsWSWHOjpX06pb7m5gHmNsWjvNqiXk/UdNMhRb0OoshjPVVCzdgEKH36SyGz8NjS2WMtDWxXwDOFHs1+PvU4cXHVfI8YzjNsM0QvBtx2qiAMyalCRAJyn9EAPmSL+hpLGSG7kNeAzbN9k=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH] build/xen: fix symbol generation with LLVM LD
Thread-Topic: [PATCH] build/xen: fix symbol generation with LLVM LD
Thread-Index: AQHYYIullYwWquPok065ghlly9/2gK1xPR9A
Date: Wed, 6 Jul 2022 07:30:01 +0000
Message-ID:
 <AS8PR08MB799132004B0D0C909BE75A0592809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220505142137.51306-1-roger.pau@citrix.com>
In-Reply-To: <20220505142137.51306-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 29B218515032DC48ABC490A3FB8DC3E2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a5268200-5f71-4553-bf2a-08da5f215e30
x-ms-traffictypediagnostic:
	PR2PR08MB4731:EE_|AM5EUR03FT013:EE_|PAXPR08MB6477:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 78XUTiSUmNmZGEd/K6oTPam4uQxBp8znm2+RIfheoxwL9aT4i1zLwA6QDrMrcX7E4xZtp0CuIYk5eR9QFUeel/NbCAqzDvjJNtf4s3bUScBetB/r6U2UsPtrNlfKsosKJUsFgOzQVBkVBPfY60+Xt0o8N67FyXKJ5QgJ3cDnTL1sev0lfw32PqWD9v8M7PSB7a2ROKnbnFPfN1mYgjcntFpxJOQTDlk8W0DqN10h0Tb1F6FlR8jmshRcSII58iZjjA0hW6qAwZ8GyF3IRSlg+HARWRm7rfm1K3/9doOhQ/ZLJPLF7R2epaYh7Q0+xYYhZGegqILEzPMNMw61KzNSmx0B0iU9DZnA1hgbv3YELov05RXjt0tCC0vZiyRjtx5i+4+rZgo/fiilQRLZLMnNwcs2zey1iOUNRhdprUVMA9Dxo8ALr7ZbuWdD6hHSl4Qg+vNyP2qeB3XznVNGstlTLY0vy9GA5B/mgwJt4SX0onBbLsnLRTGQ6an801i37O2JrLmdmpGMaRLYs+Uaz2ybohhWzjT9QRl8H1r3pXyMvPEpfYUpi+SCtVMgZiR10XJZrBohu6AuXJReJiY6+nB2h050kts0JRQdLpM0MEtRcwzFMm77mf8vbvCfAsF9xBypqrvFxzNUQDsUYY/Ee0rx4tMRMwF0/LifM2QYcCPvrXVI610/vJAxfXcvEYO2n8oKnWjVUisZzWXIWiiWdxHvMVrmoNXKPBUEUZFo0gne7djDLrzZLsxkznJpdd6E0ws9YDhJfp+UW51WbasqaQ07UVf77Zf2xMxExxleTqMNI1lm7Yx8wV6rDS1E/+CeDn8Q
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(83380400001)(41300700001)(52536014)(186003)(8936002)(6506007)(7696005)(86362001)(5660300002)(2906002)(38070700005)(66556008)(478600001)(55016003)(8676002)(33656002)(38100700002)(4326008)(64756008)(66446008)(66476007)(76116006)(66946007)(9686003)(26005)(316002)(71200400001)(54906003)(110136005)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4731
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7590f088-ad98-4173-8220-08da5f215634
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Ztupxqxwa/41Y/I/9r+zfQJsbGmVM/tlUO9MiTTj1+dhe72se3cLtXvbS6ILIok/4mnZ5RswWB3qWNRiQGUHkEuI5yxXPqhWn0CvMIdNJ0RVvF/kTjfH32Lms9Rl4n/GzChm2Sm4N3hHesRZ4K/5sCFHHe7fUsOhvqHIVM4a//9OqXIKyKEqmEK7yUtpIdn3b0rgUC0wXD0hSD0fgyyXtRr8LasQpc0JL+lTLzjON4chvszrdEWW938u9MjIiMit8KrlkK7M2reucOdO1ylLAzHfhXgtnheukiNe19YATXxtg2YVRO6GLzWHvoytgAIPHFnxOrIFxkQVMChm+oZdwJz6xZiiTyYUNHxeoKfTHvtRBIj/zMFhkpxWt15RykgSO9Ds0d3DPflc0AOo7B1QHROMW1ZR4UtuLj4f4y/V/1OPibzhzHSJ1TnH/3zWgZiEttw+rWzcasfGSVD+wTVdAfRDDnmB6657RxZb3z+baKF+Il96xevbLMtSZ50oImYeoTM4r3rEr8PY7uuz+6C4jmAvCidzZhxOS7iKbpMZejXIrzvKugikc5cyKlgsYXxpjhexfqBN+egCZk1rE6PgKSAS7rBowZ1cy/Lf10kJvnPPhMBy5qGaKlxC1OO7TNBcags+zg4XBckbR1FwgpoWBoNUc1VqM8ve1/VP2XAO/P4+VZnSwlLFNHPPQvkCztJIN/xQHr9bIS4TG3Gm3/6X27anXqrCNOteU3YZRPFDudXrV4sv2OzeTSvPG+df46Vqs8KFS5oJ/txdKAlVWz6yaERHpcaB0KavSNDNc0Eucmz4CeB9CkLJv+xptjvEsc7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(36840700001)(46966006)(40470700004)(110136005)(54906003)(316002)(40460700003)(40480700001)(55016003)(478600001)(86362001)(2906002)(81166007)(82740400003)(356005)(186003)(70206006)(70586007)(47076005)(4326008)(83380400001)(52536014)(36860700001)(8936002)(5660300002)(336012)(6506007)(7696005)(9686003)(8676002)(41300700001)(26005)(82310400005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:30:14.4510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5268200-5f71-4553-bf2a-08da5f215e30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6477

SGksDQoNCkl0IHNlZW1zIHRoYXQgdGhpcyBwYXRjaCBoYXMgYmVlbiBzdGFsZSBmb3IgbW9yZSB0
aGFuIDIgbW9udGhzIGFuZCBmcm9tDQp0aGUgZGlzY3Vzc2lvbiBpbiB0aGlzIHRocmVhZCBJIHRo
aW5rIHNvbWUgYWN0aW9ucyBuZWVkIHRvIGJlIHRha2VuIGZyb20gdGhlDQphdXRob3IuIFNvIEkg
YW0gc2VuZGluZyB0aGlzIGVtYWlsIGFzIGEgZ2VudGxlIHJlbWluZGVyLg0KDQpLaW5kIHJlZ2Fy
ZHMsDQpIZW5yeQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFtQ
QVRDSF0gYnVpbGQveGVuOiBmaXggc3ltYm9sIGdlbmVyYXRpb24gd2l0aCBMTFZNIExEDQo+IA0K
PiBDdXJyZW50IExMVk0gTEQgaW1wbGVtZW50YXRpb24gd2lsbCB0dXJuIGdsb2JhbCBoaWRkZW4g
c3ltYm9scyBpbg0KPiBvYmplY3QgZmlsZXMgaW50byBsb2NhbCBvbmVzIHdoZW4gZ2VuZXJhdGlu
ZyB0aGUgLnN5bXRhYiBvZiB0aGUgWGVuDQo+IGJpbmFyeSBpbWFnZS4NCj4gDQo+IFRoaXMgaXMg
ZGlmZmVyZW50IGZyb20gR05VIGxkIGltcGxlbWVudGF0aW9uLCB0aGF0IHdpbGwgb25seSBkbyB0
aGUNCj4gY29udmVyc2lvbiAob3IgcmVtb3ZlIHRoZSBzeW1ib2xzKSB3aGVuIGdlbmVyYXRpb24g
LmR5bnN5bSBidXQgbm90DQo+IC5zeW10YWIuICBTdWNoIGNvbnZlcnNpb24gYnJlYWtzIHRoZSBw
cm9jZXNzaW5nIG9mIHN5bWJvbHMgZG9uZSBieQ0KPiB0b29scy9zeW1ib2xzLg0KPiANCj4gVXNl
IHByb3RlY3RlZCBzeW1ib2wgdmlzaWJpbGl0eSBpbnN0ZWFkIG9mIGhpZGRlbiwgYXMgdGhhdCBw
cmVzZXJ2ZXMNCj4gdGhlIHN5bWJvbCBiaW5kaW5nIHdoaWxlIG5vdCBnZW5lcmF0aW5nIEdPVCBv
ciBQTFQgaW5kaXJlY3Rpb25zIHRoYXQNCj4gYXJlIG5vdCBjb21wYXRpYmxlIHdpdGggc29tZSBv
ZiB0aGUgaW5saW5lIGFzc2VtYmx5IGNvbnN0cnVjdHMNCj4gY3VycmVudGx5IHVzZWQuDQo+IA0K
PiBXaGlsZSB0aGVyZSBhbHNvIG1ha2UgdGhlIHZpc2liaWxpdHkgc2V0dGluZyBjb21waWxlciBz
dXBwb3J0DQo+IG5vbi1vcHRpb25hbDogY29tcGlsZXJzIG5vdCBzdXBwb3J0aW5nIGl0IHdvbid0
IGJlIGFibGUgdG8gYnVpbGQgWGVuDQo+IGFueXdheSwgYW5kIHdpbGwganVzdCB0aHJvdyBhIGNv
bXBpbGVyIGVycm9yIHNvb25lciByYXRoZXIgdGhhbiBsYXRlcg0KPiBkdXJpbmcgdGhlIGJ1aWxk
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQo+IC0tLQ0KPiAgeGVuL0tjb25maWcgICAgICAgICAgICAgICAgfCA0IC0tLS0NCj4g
IHhlbi9pbmNsdWRlL3hlbi9jb21waWxlci5oIHwgOSArKysrKy0tLS0NCj4gIDIgZmlsZXMgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3hlbi9LY29uZmlnIGIveGVuL0tjb25maWcNCj4gaW5kZXggMTM0ZTZlNjhhZC4uYTkxODJmYjEz
ZCAxMDA2NDQNCj4gLS0tIGEveGVuL0tjb25maWcNCj4gKysrIGIveGVuL0tjb25maWcNCj4gQEAg
LTI5LDEwICsyOSw2IEBAIGNvbmZpZyBMRF9JU19HTlUNCj4gIGNvbmZpZyBMRF9JU19MTFZNDQo+
ICAJZGVmX2Jvb2wgJChzdWNjZXNzLCQoTEQpIC0tdmVyc2lvbiB8IGhlYWQgLW4gMSB8IGdyZXAg
LXEgIl5MTEQiKQ0KPiANCj4gLSMgLWZ2aXNpYmlsaXR5PWhpZGRlbiByZWR1Y2VzIC1mcGljIGNv
c3QsIGlmIGl0J3MgYXZhaWxhYmxlDQo+IC1jb25maWcgQ0NfSEFTX1ZJU0lCSUxJVFlfQVRUUklC
VVRFDQo+IC0JZGVmX2Jvb2wgJChjYy1vcHRpb24sLWZ2aXNpYmlsaXR5PWhpZGRlbikNCj4gLQ0K
PiAgIyBVc2UgLWZ7ZnVuY3Rpb24sZGF0YX0tc2VjdGlvbnMgY29tcGlsZXIgcGFyYW1ldGVycw0K
PiAgY29uZmlnIENDX1NQTElUX1NFQ1RJT05TDQo+ICAJYm9vbA0KPiBkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUveGVuL2NvbXBpbGVyLmggYi94ZW4vaW5jbHVkZS94ZW4vY29tcGlsZXIuaA0KPiBp
bmRleCA5MzNhZWMwOWE5Li5jMTQ0YjE3MjE3IDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS94
ZW4vY29tcGlsZXIuaA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vY29tcGlsZXIuaA0KPiBAQCAt
MTI1LDEwICsxMjUsMTEgQEANCj4gICNkZWZpbmUgX19tdXN0X2JlX2FycmF5KGEpIFwNCj4gICAg
QlVJTERfQlVHX09OX1pFUk8oX19idWlsdGluX3R5cGVzX2NvbXBhdGlibGVfcCh0eXBlb2YoYSks
DQo+IHR5cGVvZigmYVswXSkpKQ0KPiANCj4gLSNpZmRlZiBDT05GSUdfQ0NfSEFTX1ZJU0lCSUxJ
VFlfQVRUUklCVVRFDQo+IC0vKiBSZXN1bHRzIGluIG1vcmUgZWZmaWNpZW50IFBJQyBjb2RlIChu
byBpbmRpcmVjdGlvbnMgdGhyb3VnaCBHT1Qgb3IgUExUKS4gKi8NCj4gLSNwcmFnbWEgR0NDIHZp
c2liaWxpdHkgcHVzaChoaWRkZW4pDQo+IC0jZW5kaWYNCj4gKy8qDQo+ICsgKiBSZXN1bHRzIGlu
IG1vcmUgZWZmaWNpZW50IFBJQyBjb2RlIChubyBpbmRpcmVjdGlvbnMgdGhyb3VnaCBHT1Qgb3Ig
UExUKQ0KPiArICogYW5kIGlzIGFsc28gcmVxdWlyZWQgYnkgc29tZSBvZiB0aGUgYXNzZW1ibHkg
Y29uc3RydWN0cy4NCj4gKyAqLw0KPiArI3ByYWdtYSBHQ0MgdmlzaWJpbGl0eSBwdXNoKHByb3Rl
Y3RlZCkNCj4gDQo+ICAvKiBNYWtlIHRoZSBvcHRpbWl6ZXIgYmVsaWV2ZSB0aGUgdmFyaWFibGUg
Y2FuIGJlIG1hbmlwdWxhdGVkIGFyYml0cmFyaWx5LiAqLw0KPiAgI2RlZmluZSBPUFRJTUlaRVJf
SElERV9WQVIodmFyKSBfX2FzbV9fICggIiIgOiAiK2ciICh2YXIpICkNCj4gLS0NCj4gMi4zNi4w
DQo+IA0KDQo=

