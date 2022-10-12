Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7C55FC0CC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 08:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420757.665760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVPS-0006hM-Gh; Wed, 12 Oct 2022 06:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420757.665760; Wed, 12 Oct 2022 06:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVPS-0006g1-Dp; Wed, 12 Oct 2022 06:40:06 +0000
Received: by outflank-mailman (input) for mailman id 420757;
 Wed, 12 Oct 2022 06:40:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAAv=2N=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oiVPR-0005ME-6g
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 06:40:05 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140085.outbound.protection.outlook.com [40.107.14.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b36fc7d5-49f8-11ed-8fd0-01056ac49cbb;
 Wed, 12 Oct 2022 08:40:03 +0200 (CEST)
Received: from AS9PR06CA0168.eurprd06.prod.outlook.com (2603:10a6:20b:45c::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 06:39:59 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::f5) by AS9PR06CA0168.outlook.office365.com
 (2603:10a6:20b:45c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Wed, 12 Oct 2022 06:39:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 12 Oct 2022 06:39:58 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Wed, 12 Oct 2022 06:39:57 +0000
Received: from b564aa51bb61.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3812463C-0AA9-44D4-89E3-FE8ABB7F8796.1; 
 Wed, 12 Oct 2022 06:39:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b564aa51bb61.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Oct 2022 06:39:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9307.eurprd08.prod.outlook.com (2603:10a6:102:304::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 06:39:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Wed, 12 Oct 2022
 06:39:50 +0000
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
X-Inumbo-ID: b36fc7d5-49f8-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=A0rjR5gFwf15VEYPNDjtBfCqKjZHaoS1MaQU7+Brs+Qg4kkYd4FntEEspVMhxovbsL44ZxM9XWqa5fFAsxzBchr8tswGKbKPz1ZQM9IlOmTW5CRP6GjLzwnHLB9jhiJza4/JOTfVxr9U/mDMbYOQbhhdHT49H5+JMh7SHCl6PAzu8KNy16n3IF85G6eBALO+9Vo+q6qGLj3S6oTfXn1NKK2bm6rCHcYhvXAKZxi0OmckbpINm+Ls01S5dyH6rg2pqZ8iUIUIE6caK75bPFPexWJ3GZ5b6pdcGb7CpG3+WWNrfJUDb2wtNsHWML5MlOFSFG1P55GraZ6IcOBSlR37cA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6O2fXGbZhBlxgDw1aJS9hwWvSe/3u4a0BYziEAVnHD8=;
 b=EQMNnBtbCkTNQ/z+hFtzGIlgiq9DTud6kVc/yEOYncoPbrZBmhKu1atScni7l4bpttJRZfmTq7C6/x5z2WMsCIdHOFUHCFbN6HBy/7ICBGI7Axf+xoGBR0pYlMQThbnMolBjlMsvhXcGl2l0ahVriDU0d+kNeMVxLgX5wvu2nVfXwycmj8GVxhU24NCvI+nhnP+xIYEh8HxyRs+mu8Hv8zwLGEDPdZOa1egSVIsRw3Ru6pOu7iBtYGHcm23NpJh5rTSVfIayjg7GHTsTdQGqSSBheG8MnpfaXrH9xCjll2O8YR+bvm4A3weHDwE4ejb9gTA4uH577SkXebUgKG/Icw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6O2fXGbZhBlxgDw1aJS9hwWvSe/3u4a0BYziEAVnHD8=;
 b=bIHs7xi8GPAM4Ee8RzdXlxSYN8/uKKOH9QS3+cBjFwnkWERBT8p3sx/S6O9HJ3aWKT6vs7HMjscqpg5w9d9BGLqhxWZHVFEv5ooSo/xBNdYkMdXWLmsVHCWzG0duVFPYIjIsA9+t+rqyYoxYWoyPSmXgG9jXGbamV5BBYkRM9yc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYD4Bs58hS1AqV4dISDss7ZY3Q31o5DGAsbjbEcFgc/A++9geHOGNO4yARfq5KxrGwyMeba8tNIXlJ0AJ61DzGsC8feG1cs4EohQYMB9qLeu0w3b9k77tRLxZs/3gAGPj4OUqhLenEJro1aAouxrqE8UhSwRRREI+hdbMK+nhapLIO5qrtjmMB+ovuUx6EM8d31DdAbVlBTd9gdZjTEebvaYnYHipgG0gO9OTfDHjEVCbIP8WzBt2rTbX43t2xma+soz9NqkLvcJlX8OjrkEHMfbVExDD30GvwDIeEcLgm391PWgSyl9eu95+29p5lPyMzp498zbm35/Yi6HCbmJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6O2fXGbZhBlxgDw1aJS9hwWvSe/3u4a0BYziEAVnHD8=;
 b=Qpnne6mtnkNonsxYXJpOvEfqjkRXT7aVaQRkyse3zDlS7HX9eRphq2qv3gfTasXYk171vK7hw4O2dK4qtZqf9qbAT/r5U/QZLHH9WuV0wtcEzwme+iaJiu75t//GxFOfU3eZytcOgRO4kbcWI+eeRpLBZ1Y2S7jBddDrMWqWYcUyAqCHlAqpFcD0SO/m6Y0Idv5nU8u/+cLgnVaMrfmHT9eqUsKRTHzmdTVQC53Q+Spcwg3Du5UTwQwHGzzOOGRfrxupFgHOZoSDa5GymiRZWja0XUvSKR9Zayxy9gW0wUF5WkqtOmH3m01dQDDQiu23HWDAXcm5dKlnB1Y77XTvqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6O2fXGbZhBlxgDw1aJS9hwWvSe/3u4a0BYziEAVnHD8=;
 b=bIHs7xi8GPAM4Ee8RzdXlxSYN8/uKKOH9QS3+cBjFwnkWERBT8p3sx/S6O9HJ3aWKT6vs7HMjscqpg5w9d9BGLqhxWZHVFEv5ooSo/xBNdYkMdXWLmsVHCWzG0duVFPYIjIsA9+t+rqyYoxYWoyPSmXgG9jXGbamV5BBYkRM9yc=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: osstest service owner <osstest-admin@xenproject.org>
Subject: RE: [xen-unstable-smoke test] 173492: regressions - FAIL
Thread-Topic: [xen-unstable-smoke test] 173492: regressions - FAIL
Thread-Index: AQHY3Y68aiBzpV7ZsUyzVLBH9N1mMq4KTrGAgAAAVMA=
Date: Wed, 12 Oct 2022 06:39:50 +0000
Message-ID:
 <AS8PR08MB79917FBE55B5344A8A1F915D92229@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <osstest-173492-mainreport@xen.org>
 <9a004932-ccaa-5e78-c0fa-6fe3f2c13b78@suse.com>
In-Reply-To: <9a004932-ccaa-5e78-c0fa-6fe3f2c13b78@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 54ADE6885EAEB04DBB0417A789E0FE61.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9307:EE_|VE1EUR03FT004:EE_|PA4PR08MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: f040c6c2-ea94-40eb-71ba-08daac1c94f7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tNbCBGy0PWBV1YUxmqxryVFGS5LQb4YmOR1Kf4cyJre6+klquFQszyFhTns0bhw6jvFgSLJ8k/MShd+2GcjWSX0g1ls/kNSzi84ZlXor/ka0FPxoK1rn4+G1QDuq+G242zTApOz3tVm/IBd/SY7odcz/Doz+CqOXIWD116OTQYQIylO8tHbgkc7bQvescOk1cPxOlEhnN+5a1N6LygQASyeEe/rdQpxjcJCT8Oe+SRY6UrxQjyDlOv88yrxV8jP6sXuQHypDWosr6yR4D5sdD4kPvyVY5qeZ2P71t2VWEhZgJiBa48L3YdlgI8iaHPKrFFjjL6LoAJ00ZkCzfH3FDjD5iBxNPwcDHdo/g8isuqJliwggGHVkWgKaHqUiYJe2wc8LXxnRkhw2ZZGCkpvPr6cjoZc5IM5T4KnUZEwcp1nu8TTj5HHXvKRyycpC34IN6Q5sykeHkG7CwAwWNgLaPv683yRlXeS2W+gxfRlNqXyyYRT6TmJKd8TiPAUafa2rzsabd7iu56d62p1VQHkIAL1TAExoi7Oh5G8MSsKWUKEc3i8feyE381/ygVe4wanXvtXzVqfQtGY8VEXt3L8V2nmQru0nYg8WCqh9s9VvQ8Bcd1L3rz/xaVVlr4wuGaN1bMf3clCLua7sFG1DDyR02YhJHYXs+jf52/39+e0eYvd69Sg3CiOVxGSZw7DGFJ+UchMrVALge60OC2q0JFiRbsH/tDkfJ3MTlbYcHWBeCvdg9l53aKIk+b14iWxb0UUi+yL7F+44yB/KGcIbPKIujpDolFKr2C6P+wDZKHwcKDI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199015)(66476007)(83380400001)(7696005)(9686003)(53546011)(76116006)(64756008)(110136005)(66446008)(4326008)(26005)(66556008)(2906002)(186003)(6506007)(52536014)(8676002)(122000001)(55016003)(8936002)(33656002)(71200400001)(86362001)(966005)(41300700001)(478600001)(66946007)(38070700005)(316002)(38100700002)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9307
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6f4ca304-749a-43dc-c1a4-08daac1c906c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OuT1UHpPwSVjTbwghBOK/pQ8tHbWyvVdQfVrciW/6UQ3M/eCR3Dm8xGmd3sBGM6Lf1n+sh1aB9gSEte71IDLR1JwDI1QgKcVvSjL9aWJTdE4RjfX8fFlbxIj+UMTo88bn+bXA2e0U6CVhtl4C6S/Zh1ATX0wOGXs5BgCH8ZTqvEoUv4Nbd6PjF0ZB55/5qklF4zCVwXmK0SpCXAmFvbGlsTPLiHvE4SUB6YiMyp5ae3U0qw68WZ+v5jUdgfn8Woz7qIpRkOdOugu07zQ6+hgzOuLiNKloV+/TtDFxOScIkjSbjtIzlB4KG6HUm75ysid6rOwMmtd8N0grjfwA8kQ/pcdj5VIZY61XTeZe7XgTtpYZ6vyjFNCNgA4O9reAv4A+1yX3HGtsXgFENY2fbcZq+ktjPNUwgrbZwWucfGVXiaYXMhS7EN+8D4fFbssvpI+yGd6Mcbvf/CYlNZCIu4ARC14bRmmTB6y+HEkaepABysc7xlUVA90ta8Ddg4K7sBsg8MVkhimkOS6S6wLltZQ7dpPWH4CaoaaS0X2M+BXiI9vEFd1LGJ3+Af+EYyYT5NO4J4KBHil+tRqrCd0fIr3zEXhn1OZGwYM3b/avzCv+dtTSFA+QSukvR1G1y2A4kH/Q1PWPJXBDm1rwmEzbibahhunJlBwqVbJli0TfSu8h0BleJKO2zswM+VffhSywblD5PiFX8l+PtwP+fqrIe+SnARIfWImsV4lac873uP1PtEAEIM4GItvAxtY/AVXqvx5Pd9MJ8MJ8c1G4eZL+94a9D8Sbe26fAtyIPWIK7nNzpA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(70586007)(70206006)(4326008)(8676002)(336012)(186003)(2906002)(33656002)(40460700003)(47076005)(86362001)(52536014)(9686003)(7696005)(36860700001)(26005)(83380400001)(41300700001)(53546011)(5660300002)(55016003)(40480700001)(6506007)(8936002)(82310400005)(966005)(81166007)(356005)(82740400003)(110136005)(316002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 06:39:58.3559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f040c6c2-ea94-40eb-71ba-08daac1c94f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJlOiBb
eGVuLXVuc3RhYmxlLXNtb2tlIHRlc3RdIDE3MzQ5MjogcmVncmVzc2lvbnMgLSBGQUlMDQo+IA0K
PiBPbiAxMS4xMC4yMDIyIDE4OjI5LCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6DQo+ID4g
ZmxpZ2h0IDE3MzQ5MiB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0NCj4gPiBodHRwOi8v
bG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTczNDkyLw0KPiA+DQo+
ID4gUmVncmVzc2lvbnMgOi0oDQo+ID4NCj4gPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQg
YW5kIGFyZSBibG9ja2luZywNCj4gPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJl
IHJ1bjoNCj4gPiAgdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAxNCBndWVzdC1zdGFydCAg
ICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTczNDU3DQo+IA0KPiBQYXJzaW5nIGNvbmZpZyBm
cm9tIC9ldGMveGVuL2RlYmlhbi5ndWVzdC5vc3N0ZXN0LmNmZw0KPiBsaWJ4bDogZGVidWc6IGxp
YnhsX2NyZWF0ZS5jOjIwNzk6ZG9fZG9tYWluX2NyZWF0ZTogYW8gMHhhYWFhY2FjY2Y2ODA6DQo+
IGNyZWF0ZTogaG93PShuaWwpIGNhbGxiYWNrPShuaWwpIHBvbGxlcj0weGFhYWFjYWNjZWZkMA0K
PiBsaWJ4bDogZGV0YWlsOiBsaWJ4bF9jcmVhdGUuYzo2NjE6bGlieGxfX2RvbWFpbl9tYWtlOiBw
YXNzdGhyb3VnaDogZGlzYWJsZWQNCj4gbGlieGw6IGRlYnVnOiBsaWJ4bF9hcm0uYzoxNDg6bGli
eGxfX2FyY2hfZG9tYWluX3ByZXBhcmVfY29uZmlnOiBDb25maWd1cmUNCj4gdGhlIGRvbWFpbg0K
PiBsaWJ4bDogZGVidWc6IGxpYnhsX2FybS5jOjE1MTpsaWJ4bF9fYXJjaF9kb21haW5fcHJlcGFy
ZV9jb25maWc6ICAtIEFsbG9jYXRlDQo+IDAgU1BJcw0KPiBsaWJ4bDogZXJyb3I6IGxpYnhsX2Ny
ZWF0ZS5jOjcwOTpsaWJ4bF9fZG9tYWluX21ha2U6IGRvbWFpbiBjcmVhdGlvbiBmYWlsOiBObw0K
PiBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+IGxpYnhsOiBlcnJvcjogbGlieGxfY3JlYXRlLmM6
MTI5NDppbml0aWF0ZV9kb21haW5fY3JlYXRlOiBjYW5ub3QgbWFrZSBkb21haW46DQo+IC0zDQo+
IA0KPiBMYXRlciBmbGlnaHRzIGRvbid0IGZhaWwgaGVyZSBhbnltb3JlLCB0aG91Z2guDQo+IA0K
PiA+ICB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgIDE0IGd1ZXN0LXN0YXJ0ICAgICAgICAg
ICAgICBmYWlsIFJFR1IuIHZzLiAxNzM0NTcNCj4gDQo+IFNpbWlsYXIgbG9nIGNvbnRlbnRzIGhl
cmUsIGJ1dCBsYXRlciBmbGlnaHRzIGNvbnRpbnVlIHRvIGZhaWwgdGhlIHNhbWUgd2F5Lg0KPiAN
Cj4gSSdtIGFmcmFpZCBJIGNhbid0IGRyYXcgY29uY2x1c2lvbnMgZnJvbSB0aGlzOyBJIGhhdmVu
J3QgYmVlbiBhYmxlIHRvIHNwb3QNCj4gYW55dGhpbmcgaGVscGZ1bCBpbiB0aGUgaHlwZXJ2aXNv
ciBsb2dzLiBNeSBiZXN0IGd1ZXNzIHJpZ2h0IG5vdyBpcyB0aGUgdXNlDQo+IG9mIHNvbWUgdW5p
bml0aWFsaXplZCBtZW1vcnksIHdoaWNoIGp1c3QgaGFwcGVuZWQgdG8gZ28gZmluZSBpbiB0aGUg
bGF0ZXINCj4gZmxpZ2h0cyBmb3IgNjQtYml0Lg0KDQpJIGFtIGFsc28gcXVpdGUgY29uZnVzZWQg
YWJvdXQgdGhpcyBpc3N1ZSwgYXMgZnJvbSBteSBsb2NhbCB0ZXN0IHRvZGF5IG9uDQpkaWZmZXJl
bnQgQXJtL0FybTY0IGJvYXJkcywgdGhpcyBpc3N1ZSB3b3VsZCBiZSBvbmx5IHRyaWdnZXJlZCBv
biBzb21lIG9mDQp0aGVtIGluc3RlYWQgb2YgYWxsIG9mIHRoZW0uLi4NCg0KS2luZCByZWdhcmRz
LA0KSGVucnkNCg0KPiANCj4gSmFuDQoNCg==

