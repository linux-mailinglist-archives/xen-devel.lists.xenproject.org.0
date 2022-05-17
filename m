Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C1F529C44
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 10:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330532.553913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqsSg-0006Ru-Qa; Tue, 17 May 2022 08:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330532.553913; Tue, 17 May 2022 08:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqsSg-0006Ow-NP; Tue, 17 May 2022 08:21:46 +0000
Received: by outflank-mailman (input) for mailman id 330532;
 Tue, 17 May 2022 08:21:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vdn1=VZ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nqsSe-0006Oq-PF
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 08:21:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62331ff0-d5ba-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 10:21:43 +0200 (CEST)
Received: from AS9PR06CA0508.eurprd06.prod.outlook.com (2603:10a6:20b:49b::32)
 by VI1PR0801MB1853.eurprd08.prod.outlook.com (2603:10a6:800:5a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 08:21:40 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::fe) by AS9PR06CA0508.outlook.office365.com
 (2603:10a6:20b:49b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Tue, 17 May 2022 08:21:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 08:21:39 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Tue, 17 May 2022 08:21:38 +0000
Received: from 0dc7c8015edf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3A555B08-BF10-4E2D-B9F3-30DD2C8C5CA9.1; 
 Tue, 17 May 2022 08:21:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0dc7c8015edf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 May 2022 08:21:33 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DB9PR08MB6475.eurprd08.prod.outlook.com (2603:10a6:10:253::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 08:21:31 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 08:21:31 +0000
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
X-Inumbo-ID: 62331ff0-d5ba-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KhiIiRC9JdgKClaYd0Fvy1r+0PeJgwpa4Vc9h3aQo1GuS/6AhxAPekM8P4IvnfcdpsxyL6EBzrtCVaS+Ku+82EiATrRE4tXH5NSVsLH16VftKUh94Bzs1cEMMgiW0IhL6R56poDPpCqg1n4mVKgUcDXq05OpG/3hlECrSNV0u7Tykz9Eqa++g07uTaECx/TFYME/4zyqIJ6491S/gkJruAWvfD8MVAd80N2uFKJhYIDdJ+AxxBd9tyG2GGcVAOjIKGiHTkz0f8bG2i0vo25K/IEPwJ8QhCMx+fJVe0/gGF4ff8rp+g9looAFlf1sLB6f1OeWlyd3aVKNWBEUMISZKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38WAE1NxB8vuKcm9HzSrl5k1VF7Kujxlni79VItedlU=;
 b=Vbp22UUBcsSiaS0qw+SM4ygGOVQA3TQfTj89JoJizohNZDwRidq7p9Ro4a7nbuv3tz9uxj7+S3oWolE8QbSd0zqRnrPTbqXKFjNrNTaF4SFTOjCMYNiBceZyLYrfxPUerSdQjgy3VMhPsnC1HIp/lHCpgyDN2ysGxDxKnFLUTdyht2+vZV18tGw95rbNxRaeXqCQfOUqsfFcJDvCPln8tK7l7+ItII4lfT/+fMKRnpUcbAVUel3mI/369fCMmhtBRj9+6tAIsZdocwnoEWQNtRHlyTLRROqgd9Xbe11Kkcb2n4wYkkiUxDu1DpUjaLuSmOAD8STE4kVoVoCREtO7IA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38WAE1NxB8vuKcm9HzSrl5k1VF7Kujxlni79VItedlU=;
 b=uLZELQCnTXQN+XaTnDBDTNrI6K2hD+PfIPnVnuzHBy5mvqIRHET/gJFm2GgNfwNf7F3qXaYb8lD3HztNtQBGhf6HclmdWfTwv9cYiyEZbdCMjTSyxfxPoUhUaTbnqMFJ77SJOlYvkGstx5kXk2poyLwik1Teo5HKABmS4poCs/U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7ZytOr2YLHaD3P0Oe1lQZcS5ShpvfVDmECp8meKra6qzYCqikFXT2uX628CbN5G6E2NGUsJBXHbsrJutf6gBNMD9VBIf1s4H1Dqi+4f+2esK9ULfE9bxEOhN9pJBF4T430Y/nWHvQUwKHeLjrOrbBvRpaMRUC9xQu9uTUQbZYWjG74+xW4HceBoXm1qFklJAvz7Ks/LcURTjJlkUF57oIgYRdg5qrL28FWxXz/68v0S1MwNHzXUqTG4e2luA6a9V639bvw8VNwWaq0KlQiJqTLtt6qBEOdv/PoKqhZjHHyH+RCI+4lADVH9TXsia5Z/xgqYqocOh+0NDcZufhIkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38WAE1NxB8vuKcm9HzSrl5k1VF7Kujxlni79VItedlU=;
 b=c33fpYNfHMrH2jHkQaCNXD03amlnz3iuXXIq25rgl79zFS/HknRkvgQHzTv4yURxudU7PRFyjAYn+ugFZaCW7uVJguiaUpH4hc7ngOy/r717PYV/tQHGh0n6LxliaGHnC+L2Qr6CzTMn4xplSBc7FCebIdCqp5mGwfvGrfIsBKAC7hBVEf6T+KnOc7TZLEFJNUG1RUse6ysO2APpIirSUp0vOde6+Ph30SALQM10g09G0Ln7PANZTWCyO4RAPtdNJzF065uSt5ldOEBteH45pUKDBXWpez71i1zTlXJXZMxnjzjBkAiDH2m8PuIwnaTzNrEjrScZeDl8PoiU/J/aow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38WAE1NxB8vuKcm9HzSrl5k1VF7Kujxlni79VItedlU=;
 b=uLZELQCnTXQN+XaTnDBDTNrI6K2hD+PfIPnVnuzHBy5mvqIRHET/gJFm2GgNfwNf7F3qXaYb8lD3HztNtQBGhf6HclmdWfTwv9cYiyEZbdCMjTSyxfxPoUhUaTbnqMFJ77SJOlYvkGstx5kXk2poyLwik1Teo5HKABmS4poCs/U=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v4 1/6] xen: do not free reserved memory into heap
Thread-Topic: [PATCH v4 1/6] xen: do not free reserved memory into heap
Thread-Index: AQHYZBWe/uxRZBdW10mDRgQaF95/K60h1bOAgADQseA=
Date: Tue, 17 May 2022 08:21:31 +0000
Message-ID:
 <DU2PR08MB73255BBF708979822747FF2DF7CE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
 <20220510022733.2422581-2-Penny.Zheng@arm.com>
 <2ebda9bb-8045-56ec-619b-d0178d57ee17@xen.org>
In-Reply-To: <2ebda9bb-8045-56ec-619b-d0178d57ee17@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9460D098992C4641A3D2CFAD21C1E0F0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7528e968-aa41-4e7f-8672-08da37de4454
x-ms-traffictypediagnostic:
	DB9PR08MB6475:EE_|VE1EUR03FT023:EE_|VI1PR0801MB1853:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1853768590D94AACE718C483F7CE9@VI1PR0801MB1853.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KPBDVWSc+4wkTwGtQMSCP5DiBx5dLK/mNMOtVGoThVFAap6NJblBOIZUgeWRHyhUjIRtufm7du/FNuVIw0eLGZjnjZJ/36Ms7LJllBCXPPDIUkcggS/XSnbhEo0Wp5AHTS3DLmdAaQXNO7Mbjod3mFuywuYrpeqIe3mNcx+zKQefTzFCYpM313/EC8EiUxjTFJD2adURw5+yzrByof2XV6R/+8AUfKRY9vqN0khMZ5wk0qYCCgcDPOeS88QutKAz5E7qREyGptM2ftJa5LXEY6706gEGB9bmz1pQ3SWrXGOUL/Wly0b6QaLfUrvGO8DdsCh0JLHjxFWMmGVvidQcXhc7LgJdbJwxP8Wnl46JG5phkT5tl61hqtzC4wf3VKr1Y2Vw3bEXomrUfO30KFD95V26Aj4lajdZUkdz9Oj0fCydsWqdliO1y4pEGnK6dqdQNEyDM1wIR/crfzJ9U75O+IiTiBKGaarePUEEKn35VBk9v0ayLUzhDUo0ONw7nhvfuFQJLxKIW1OqOXtEZKeeRDK3Q1O0XxKCC8U5UFwAWWH0yycVwWnIgOBPTGY5OGehWhKt9OrVnAip7eqHmodV/O69kR1UUNbTpw58QGfpeGAgpaL9vswDFa2G3R42SECCP2I9qhbMBI/gY96sQgQB7+4TmNVgWZJyC7gdFOX6joO7gf2tDCftHx2+i6xwcXSpjx1lfK9mnrRTLtlhNVQ7hQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(83380400001)(316002)(6506007)(9686003)(54906003)(2906002)(38070700005)(52536014)(71200400001)(8936002)(53546011)(508600001)(64756008)(66476007)(66946007)(86362001)(66556008)(66446008)(26005)(76116006)(8676002)(4326008)(7696005)(110136005)(186003)(38100700002)(33656002)(5660300002)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6475
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	090dbf70-b997-4fc4-932f-08da37de3f63
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IoZ3OTAb4E32+We8g/VJY/1Hjjg4nG1m9Vhv/lx4jZLLT095d48Ju63ww5I2Lv5H3SF3sMA9HitOUTB4SAwgw9nurSRQT4HKB/N5Y/TOr4PC8QhDXaqB1qW2VcdydDMtYRUb554Raga+iP/q1kIWHSh1cwJR1FfbJSrvDD7rj5krzYV+MTfs7wUnlddhzdbWxvxcd6RPXtW+X32KAHvVexmGOsw97diFrz2Ky/Rk0xl4031DCBkVGXH9WDHFg/MR+YtzmKdixXECUMZLh7qnV1kkBuW/glSFN9oOCP+OBqyql7wwIY5h9RzAL4Qe0SSuTlg74ovRgcH0Nm9mnTerCtbjyF6Gm8s+BsC8BinC+Dg5CtUhxsme5ZHsMDYaxfo9+a0mIqydNO7X2SdR8WQ2XvOsZWhn5aJyCBuTMKUAZYQ3S4AGOMY4Ss7GVRhpwNDNe6qaNsT/XFayf5b3IhzE/+xCrSW5D6GkAe+Y0wTIWvwguzTbIveVnuDlVrPxSUkHfNJ/ImGh4Gb++VN3tcnUHwH2s4jbN51thWhF3jfP2ayop1OEPGUv6iKmqii351SvX7sq4fhzGGD1FwwH276x7ww556hQNRQMUyCqyPEOVpxvoj2awLQYJXApULMLA2WJnLjnUlfMapulJhgzdWilH0RfZk1gE6GGCfzI2DeH95h1buChdLl/kwupBYaQU9HF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8936002)(33656002)(186003)(82310400005)(2906002)(40460700003)(47076005)(26005)(7696005)(356005)(83380400001)(5660300002)(52536014)(4326008)(54906003)(86362001)(53546011)(81166007)(70586007)(508600001)(6506007)(36860700001)(70206006)(110136005)(9686003)(55016003)(336012)(316002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 08:21:39.3597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7528e968-aa41-4e7f-8672-08da37de4454
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1853

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE3LCAyMDIyIDI6
MDEgQU0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47
IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ow0KPiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0K
PiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEvNl0geGVu
OiBkbyBub3QgZnJlZSByZXNlcnZlZCBtZW1vcnkgaW50byBoZWFwDQo+IA0KPiBIaSBQZW5ueSwN
Cj4gDQo+IE9uIDEwLzA1LzIwMjIgMDM6MjcsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IFBhZ2Vz
IHVzZWQgYXMgZ3Vlc3QgUkFNIGZvciBzdGF0aWMgZG9tYWluLCBzaGFsbCBiZSByZXNlcnZlZCB0
byB0aGlzDQo+ID4gZG9tYWluIG9ubHkuDQo+ID4gU28gaW4gY2FzZSByZXNlcnZlZCBwYWdlcyBi
ZWluZyB1c2VkIGZvciBvdGhlciBwdXJwb3NlLCB1c2VycyBzaGFsbA0KPiA+IG5vdCBmcmVlIHRo
ZW0gYmFjayB0byBoZWFwLCBldmVuIHdoZW4gbGFzdCByZWYgZ2V0cyBkcm9wcGVkLg0KPiA+DQo+
ID4gZnJlZV9zdGF0aWNtZW1fcGFnZXMgd2lsbCBiZSBjYWxsZWQgYnkgZnJlZV9oZWFwX3BhZ2Vz
IGluIHJ1bnRpbWUgZm9yDQo+ID4gc3RhdGljIGRvbWFpbiBmcmVlaW5nIG1lbW9yeSByZXNvdXJj
ZSwgc28gbGV0J3MgZHJvcCB0aGUgX19pbml0IGZsYWcuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiB2NCBjaGFu
Z2VzOg0KPiA+IC0gbm8gY2hhbmdlcw0KPiA+IC0tLQ0KPiA+IHYzIGNoYW5nZXM6DQo+ID4gLSBm
aXggcG9zc2libGUgcmFjeSBpc3N1ZSBpbiBmcmVlX3N0YXRpY21lbV9wYWdlcygpDQo+ID4gLSBp
bnRyb2R1Y2UgYSBzdHViIGZyZWVfc3RhdGljbWVtX3BhZ2VzKCkgZm9yIHRoZQ0KPiA+ICFDT05G
SUdfU1RBVElDX01FTU9SWSBjYXNlDQo+ID4gLSBtb3ZlIHRoZSBjaGFuZ2UgdG8gZnJlZV9oZWFw
X3BhZ2VzKCkgdG8gY292ZXIgb3RoZXIgcG90ZW50aWFsIGNhbGwNCj4gPiBzaXRlcw0KPiA+IC0g
Zml4IHRoZSBpbmRlbnRhdGlvbg0KPiA+IC0tLQ0KPiA+IHYyIGNoYW5nZXM6DQo+ID4gLSBuZXcg
Y29tbWl0DQo+ID4gLS0tDQo+ID4gICB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyB8IDE3ICsrKysr
KysrKysrKysrLS0tDQo+ID4gICB4ZW4vaW5jbHVkZS94ZW4vbW0uaCAgICB8ICAyICstDQo+ID4g
ICAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgYi94ZW4vY29tbW9uL3Bh
Z2VfYWxsb2MuYyBpbmRleA0KPiA+IDMxOTAyOTE0MGYuLjVlNTY5YTQ4YTIgMTAwNjQ0DQo+ID4g
LS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPiArKysgYi94ZW4vY29tbW9uL3BhZ2Vf
YWxsb2MuYw0KPiA+IEBAIC0xNDQzLDYgKzE0NDMsMTAgQEAgc3RhdGljIHZvaWQgZnJlZV9oZWFw
X3BhZ2VzKA0KPiA+DQo+ID4gICAgICAgQVNTRVJUKG9yZGVyIDw9IE1BWF9PUkRFUik7DQo+ID4N
Cj4gPiArICAgIGlmICggcGctPmNvdW50X2luZm8gJiBQR0NfcmVzZXJ2ZWQgKQ0KPiANCj4gTklU
OiBJIHdvdWxkIHN1Z2dlc3QgdG8gdXNlICJ1bmxpa2VseSgpIiBoZXJlLg0KPiANCj4gPiArICAg
ICAgICAvKiBSZXNlcnZlZCBwYWdlIHNoYWxsIG5vdCBnbyBiYWNrIHRvIHRoZSBoZWFwLiAqLw0K
PiA+ICsgICAgICAgIHJldHVybiBmcmVlX3N0YXRpY21lbV9wYWdlcyhwZywgMVVMIDw8IG9yZGVy
LCBuZWVkX3NjcnViKTsNCj4gPiArDQo+ID4gICAgICAgc3Bpbl9sb2NrKCZoZWFwX2xvY2spOw0K
PiA+DQo+ID4gICAgICAgZm9yICggaSA9IDA7IGkgPCAoMSA8PCBvcmRlcik7IGkrKyApIEBAIC0y
NjM2LDggKzI2NDAsOCBAQA0KPiA+IHN0cnVjdCBkb21haW4gKmdldF9wZ19vd25lcihkb21pZF90
IGRvbWlkKQ0KPiA+DQo+ID4gICAjaWZkZWYgQ09ORklHX1NUQVRJQ19NRU1PUlkNCj4gPiAgIC8q
IEVxdWl2YWxlbnQgb2YgZnJlZV9oZWFwX3BhZ2VzIHRvIGZyZWUgbnJfbWZucyBwYWdlcyBvZiBz
dGF0aWMNCj4gPiBtZW1vcnkuICovIC12b2lkIF9faW5pdCBmcmVlX3N0YXRpY21lbV9wYWdlcyhz
dHJ1Y3QgcGFnZV9pbmZvICpwZywNCj4gdW5zaWduZWQgbG9uZyBucl9tZm5zLA0KPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIG5lZWRfc2NydWIpDQo+ID4gK3ZvaWQg
ZnJlZV9zdGF0aWNtZW1fcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsIHVuc2lnbmVkIGxvbmcg
bnJfbWZucywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIG5lZWRfc2NydWIp
DQo+IA0KPiBMb29raW5nIGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBmcmVlX3N0YXRpY21lbV9w
YWdlcygpLCB0aGUgcGFnZSB3aWxsIGJlDQo+IHNjcnViYmVkIHN5bmNocm9ub3VzbHkuDQo+IA0K
PiBJZiBJIGFtIG5vdCBtaXN0YWtlbiwgc3RhdGljIG1lbW9yeSBpcyBub3QgeWV0IHN1cHBvcnRl
ZCBzbyBJIHdvdWxkIGJlIE9LIHRvDQo+IGNvbnRpbnVlIHdpdGggc3luY2hyb25vdXMgc2NydWJi
aW5nLiBIb3dldmVyLCB0aGlzIHdpbGwgbmVlZCB0byBiZQ0KPiBhc3luY2hyb25vdXMgYmVmb3Jl
IHdlIGV2ZW4gY29uc2lkZXIgdG8gc2VjdXJpdHkgc3VwcG9ydCBpdC4NCj4gDQoNClllcywgIEkg
cmVtZW1iZXJlZCB0aGF0IGFzeW5jaHJvbm91cyBpcyBzdGlsbCBvbiB0aGUgdG8tZG8gbGlzdCBm
b3Igc3RhdGljIG1lbW9yeS4NCg0KSWYgaXQgZG9lc24ndCBib3RoZXIgdG9vIG11Y2ggdG8geW91
LCBJIHdvdWxkIGxpa2UgdG8gYXNrIHNvbWUgaGVscCBvbiB0aGlzIGlzc3VlLCA7KS4NCkkgb25s
eSBrbmV3IGJhc2ljIGtub3dsZWRnZSBvbiB0aGUgc2NydWJiaW5nLCBJIGtuZXcgdGhhdCBkaXJ0
eSBwYWdlcyBpcyBwbGFjZWQgYXQgdGhlDQplbmQgb2YgbGlzdCBoZWFwKG5vZGUsIHpvbmUsIG9y
ZGVyKSBmb3Igc2NydWJiaW5nIGFuZCAiZmlyc3RfZGlydHkiIGlzIHVzZWQgdG8gdHJhY2sgZG93
bg0KdGhlIGRpcnR5IHBhZ2VzLiBJTU8sIEJvdGggdHdvIHBhcnRzIGFyZSByZXN0cmljdGVkIHRv
IHRoZSBoZWFwIHRoaW5neSwgIG5vdCByZXVzYWJsZSBmb3INCnN0YXRpYyBtZW1vcnksIHNvIG1h
eWJlIEkgbmVlZCB0byByZS13cml0ZSBzY3J1Yl9mcmVlX3BhZ2UgZm9yIHN0YXRpYyBtZW1vcnks
IGFuZCBhbHNvDQpsaW5rIHRoZSBuZWVkLXRvLXNjcnViIHJlc2VydmVkIHBhZ2VzIHRvIGEgbmV3
IGdsb2JhbCBsaXN0IGUuZy4gIGRpcnR5X3Jlc3ZfbGlzdCBmb3IgYXluYw0Kc2NydWJiaW5nPw0K
IEFueSBzdWdnZXN0aW9ucz8NCg0KPiBCVFcsIFNVUFBPUlQubWQgZG9lc24ndCBzZWVtIHRvIGV4
cGxpY2l0ZWx5IHNheSB3aGV0aGVyIHN0YXRpYyBtZW1vcnkgaXMNCj4gc3VwcG9ydGVkLiBXb3Vs
ZCB5b3UgYmUgYWJsZSB0byBzZW5kIGEgcGF0Y2ggdG8gdXBkYXRlIGl0PyBJIHRoaW5rIHRoaXMg
c2hvdWxkDQo+IGJlIHRlY2ggcHJldmlldyBmb3Igbm93Lg0KPiANCg0KU3VyZSwgd2lsbCBkby4N
Cg0KPiA+ICAgew0KPiA+ICAgICAgIG1mbl90IG1mbiA9IHBhZ2VfdG9fbWZuKHBnKTsNCj4gPiAg
ICAgICB1bnNpZ25lZCBsb25nIGk7DQo+ID4gQEAgLTI2NTMsNyArMjY1Nyw4IEBAIHZvaWQgX19p
bml0IGZyZWVfc3RhdGljbWVtX3BhZ2VzKHN0cnVjdCBwYWdlX2luZm8NCj4gKnBnLCB1bnNpZ25l
ZCBsb25nIG5yX21mbnMsDQo+ID4gICAgICAgICAgIH0NCj4gPg0KPiA+ICAgICAgICAgICAvKiBJ
biBjYXNlIGluaXRpYWxpemluZyBwYWdlIG9mIHN0YXRpYyBtZW1vcnksIG1hcmsgaXQgUEdDX3Jl
c2VydmVkLiAqLw0KPiA+IC0gICAgICAgIHBnW2ldLmNvdW50X2luZm8gfD0gUEdDX3Jlc2VydmVk
Ow0KPiA+ICsgICAgICAgIGlmICggIShwZ1tpXS5jb3VudF9pbmZvICYgUEdDX3Jlc2VydmVkKSAp
DQo+IA0KPiBOSVQ6IEkgdW5kZXJzdGFuZCB0aGUgZmxhZyBtYXkgaGF2ZSBhbHJlYWR5IGJlZW4g
c2V0LCBidXQgSSBhbSBub3QgY29udmluY2VkIGlmDQo+IGl0IGlzIHdvcnRoIGNoZWNraW5nIGl0
IGFuZCB0aGVuIHNldC4NCj4gDQoNCkphbiBzdWdnZXN0ZWQgdGhhdCBzaW5jZSB3ZSByZW1vdmUg
dGhlIF9faW5pdCBmcm9tIGZyZWVfc3RhdGljbWVtX3BhZ2VzLCBpdCdzIG5vdyBpbiBwcmVlbXB0
YWJsZQ0Kc3RhdGUgYXQgcnVudGltZSwgc28gYmV0dGVyIGJlIGFkZGluZyB0aGlzIGNoZWNrIGhl
cmUuIA0KDQo+ID4gKyAgICAgICAgICAgIHBnW2ldLmNvdW50X2luZm8gfD0gUEdDX3Jlc2VydmVk
Ow0KPiANCj4gDQo+ID4gICAgICAgfQ0KPiA+ICAgfQ0KPiA+DQo+ID4gQEAgLTI3NjIsNiArMjc2
NywxMiBAQCBpbnQgX19pbml0IGFjcXVpcmVfZG9tc3RhdGljX3BhZ2VzKHN0cnVjdA0KPiA+IGRv
bWFpbiAqZCwgbWZuX3Qgc21mbiwNCj4gPg0KPiA+ICAgICAgIHJldHVybiAwOw0KPiA+ICAgfQ0K
PiA+ICsjZWxzZQ0KPiA+ICt2b2lkIGZyZWVfc3RhdGljbWVtX3BhZ2VzKHN0cnVjdCBwYWdlX2lu
Zm8gKnBnLCB1bnNpZ25lZCBsb25nIG5yX21mbnMsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgYm9vbCBuZWVkX3NjcnViKSB7DQo+ID4gKyAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsN
Cj4gPiArfQ0KPiA+ICAgI2VuZGlmDQo+ID4NCj4gPiAgIC8qDQo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3hlbi9tbS5oIGIveGVuL2luY2x1ZGUveGVuL21tLmggaW5kZXgNCj4gPiAzYmU3
NTRkYTkyLi45ZmQ5NWRlYWVjIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5o
DQo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgNCj4gPiBAQCAtODUsMTAgKzg1LDEwIEBA
IGJvb2wgc2NydWJfZnJlZV9wYWdlcyh2b2lkKTsNCj4gPiAgIH0gd2hpbGUgKCBmYWxzZSApDQo+
ID4gICAjZGVmaW5lIEZSRUVfWEVOSEVBUF9QQUdFKHApIEZSRUVfWEVOSEVBUF9QQUdFUyhwLCAw
KQ0KPiA+DQo+ID4gLSNpZmRlZiBDT05GSUdfU1RBVElDX01FTU9SWQ0KPiA+ICAgLyogVGhlc2Ug
ZnVuY3Rpb25zIGFyZSBmb3Igc3RhdGljIG1lbW9yeSAqLw0KPiA+ICAgdm9pZCBmcmVlX3N0YXRp
Y21lbV9wYWdlcyhzdHJ1Y3QgcGFnZV9pbmZvICpwZywgdW5zaWduZWQgbG9uZyBucl9tZm5zLA0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIG5lZWRfc2NydWIpOw0KPiA+ICsj
aWZkZWYgQ09ORklHX1NUQVRJQ19NRU1PUlkNCj4gPiAgIGludCBhY3F1aXJlX2RvbXN0YXRpY19w
YWdlcyhzdHJ1Y3QgZG9tYWluICpkLCBtZm5fdCBzbWZuLCB1bnNpZ25lZCBpbnQNCj4gbnJfbWZu
cywNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbWVtZmxh
Z3MpOw0KPiA+ICAgI2VuZGlmDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3Jh
bGwNCg==

