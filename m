Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F39B57D6546
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 10:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622713.969793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZNd-0006u1-0Y; Wed, 25 Oct 2023 08:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622713.969793; Wed, 25 Oct 2023 08:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZNc-0006qv-Tq; Wed, 25 Oct 2023 08:36:44 +0000
Received: by outflank-mailman (input) for mailman id 622713;
 Wed, 25 Oct 2023 08:36:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0aTH=GH=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qvZNb-0006pY-1N
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 08:36:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e78211d-7311-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 10:36:40 +0200 (CEST)
Received: from DU6P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::22)
 by AM9PR08MB6723.eurprd08.prod.outlook.com (2603:10a6:20b:2ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 08:36:31 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::bb) by DU6P191CA0007.outlook.office365.com
 (2603:10a6:10:540::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Wed, 25 Oct 2023 08:36:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.15 via Frontend Transport; Wed, 25 Oct 2023 08:36:31 +0000
Received: ("Tessian outbound d1b3e404ba03:v215");
 Wed, 25 Oct 2023 08:36:31 +0000
Received: from c85d38555060.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1DDFDDEF-F418-4A89-8A31-CA9332B41908.1; 
 Wed, 25 Oct 2023 08:35:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c85d38555060.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Oct 2023 08:35:18 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GVXPR08MB10541.eurprd08.prod.outlook.com (2603:10a6:150:158::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 08:35:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 08:35:15 +0000
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
X-Inumbo-ID: 9e78211d-7311-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NNbhZlExo5wD1lvcfG6uLkjVlq38BBavj303vRnkMZHacsXi2s9Qzg89WjyaReZXdhJYeIU6i69QHAQBVolq8f7IS07GFVQ0yNpCq2mTbz97GoDPut7V7AZGI+trvNdaCyPnjkEKQrKrx7goLzYlUeo2uzvPCfQFbUtHZvq3aj0+/ZZbm8MU3wiSonHK9Aw3c3CujSb8U7WVfyMK2FMmDz66U/ZQPoUkex5mCO6RyuHI2jRBdf7k8lTG5n+7KKl1jinU86tS5VnHXhO2lsKxD62btg6UFhp0t2bjAvKn2cIsjQBtUbsifgyiu0hhf6i9as3RMDf2RXTAvQbTPpxEKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YW9fcY7oxHq4+hUiAEDDADW2sTtuzwxcCxWoAE6BAqw=;
 b=SEQmV31cXGZBqcij9okTv5u5eCziXlGOcZxijsr7XXL8MyyzMMFi8YeROzWw2jPKHNIuUMBWWae9xmPQq6R+rUC7Tbrrl61lGOqV0uhEq1gzUwJOdMkNO3HEpR783fTK687013KjsbZt5OAnP2cSn5LhNNUXaHU13A2QS6NpcsQSR4e7t6bBNP5Y7ToTG1V46WJpLi+f3FqbCZyDGJK57WPySnIjOAsNXu7SC1j9HAd5yj4IGdDRmapC11UaKYFs0ExoAsYBa/dc+MulSCIfXIgUXvd+Bad3C9q0Xi7OYzZFYIDz0bx3KNf+G5j9ONyRat456ETCSjWDRWHb2pVaXA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YW9fcY7oxHq4+hUiAEDDADW2sTtuzwxcCxWoAE6BAqw=;
 b=slNaKdIPSHhTuBefFAqR7Xwr/9h7G2RVR2rRXP5f0dBn7tZFXHeDvbowq4YKQ+43r4XqhUMTpkjDNww4IO9he25abih/OYEFdLwqLJaP4HcyTCueFNIvWMycP6rwJeAmqQd07fJ82ZqBvNxi7qrjm/mH5xBnPkyMM0GIP7pTQD8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a3fe5f83cf032484
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDy4Evu9TiDNyIVBwTjNlFSyN9d4IdEAqwYIReDztjHIwgNi73dkeewcnKbOV7e2oKr/ESKQdZ959e3U4qcvqjpqGuI70MSll9Hi8rLAGLFpWnN7bNZ3Ha6B9MnW8m4xrdu57z1m7gOc9jpTPVDSLOlW0huZAJaIA/2HBBnZSiJvxMP+g3q+8ruHM2xNZEQGbWXL+Eg6xGm7N6t24d/rONbhUl59yRYOxPc3aDwDaTyOg/eS0r/sfE4EMUbvo0/klg6cQwjDfjMV96B6eaJ6kX9Ofrfa/VP0sWYAcmbs6b3tFuTXIqf0SDxO8yAX9UyOTyo7yU48oC8vQkF8VvxShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YW9fcY7oxHq4+hUiAEDDADW2sTtuzwxcCxWoAE6BAqw=;
 b=kAYS/OQlp8tV7M1puhNXRnvgrduTaOW2l8qbdEgenM4H3ZAHfPo6CdYOXnufzcvFSm16mj8R5RjIFD8HddJLl5+XrdaFBw68cbzLOD8GO9P9jK85ynNkLVSsyn52hCLSNxWPWphrejqEsW3wDOPF07rKjfZK8dPwU5TsClmeUr9Sbo6HNsACHeXTK/t3SsVdTmIQvbl19XSb/4nvYLJALnAuHMpnfZwr7ske1Emjy6nOaQEQw41s3tLu7trOfpuhXeTca1R8N+HQ3rD5OukUH4xgcf/q6tcY2twuMmKFKuQspUi50RTNG8Osqr7nkp9aIpJIjd1BcLzK01QD/zDf8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YW9fcY7oxHq4+hUiAEDDADW2sTtuzwxcCxWoAE6BAqw=;
 b=slNaKdIPSHhTuBefFAqR7Xwr/9h7G2RVR2rRXP5f0dBn7tZFXHeDvbowq4YKQ+43r4XqhUMTpkjDNww4IO9he25abih/OYEFdLwqLJaP4HcyTCueFNIvWMycP6rwJeAmqQd07fJ82ZqBvNxi7qrjm/mH5xBnPkyMM0GIP7pTQD8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<Michal.Orzel@amd.com>
Subject: Generalise the usage of exclude-list.json
Thread-Topic: Generalise the usage of exclude-list.json
Thread-Index: AQHaBx4txv2/tLojDE2toOJeF6UsEQ==
Date: Wed, 25 Oct 2023 08:35:14 +0000
Message-ID: <5883E219-2C0C-4809-852B-704C6ED0E736@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GVXPR08MB10541:EE_|DU6PEPF00009524:EE_|AM9PR08MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: e44770b5-802c-4df1-e738-08dbd5357d2e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Tuu36BjwldymqR2zIlavYfFNsBXMGuy79d7cRqbtu3zabrYdfkuI6Z+UKfht5CC18ZKcRRVCYZr+lHqIRvpSNrOiNdVPTLuR+SKXZpfVb8yT0xpAkaXJG0LrVW8j0gyxcJkvBx/k+QriZSmJegunuwvJvk0BGhbdmAmzd0D4PPcYGfoofjF9tWHJZ78Yk8TCS1G2e1h0d5mZ6FdEs3SMzZUu3Ho0flQ57LsIREK85B0T4dJ77yrG5fdtGE1qEbJVn8Q0HGrA1Rv6Chvd5AlUAb4jKuHL0CeC6v1LhjyoGY02cd6y/abWsmhOASOHOFeEdQdsW5u/7bO+F46DdmzZQ9YH6VPahgZNpPdnOS17Xdlqmtf0z3l4EgrSJWQkhUcM3CG0kgjLbaDcKJjSVduQUne+FbwUM9w3RyxRpMeDVViHeIaGzgWi1gQHfDXqjwXuK89CazSe39pRXcXczAiV2Eds5YMrczvSCWf2QxzkgdRrg4dORZ5Qv5mCHVUFHZHak9QK5ST83ttBMl4ir3yjVz/LN7ezfru1sFCQjMk3XnGFTyXVtvqBFzjrGac/iHrk0ua7uGLSVQ34ULvuE5nHErWufZ8yGpTr6DM4ME1q7rdx/47WWozkLXEJCQbk7azZ1dfB/UVGT1aOTaz/K9gULg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(64756008)(66946007)(66556008)(66476007)(66446008)(6916009)(316002)(54906003)(38100700002)(478600001)(6486002)(122000001)(91956017)(41300700001)(86362001)(76116006)(8676002)(8936002)(71200400001)(4326008)(6512007)(6506007)(33656002)(36756003)(5660300002)(38070700009)(2616005)(2906002)(83380400001)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <056CA85A3DFD9746A3CC4A5AF446665F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10541
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	55beebb8-6d63-4258-82c8-08dbd5354fb2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SLszQpc80O4cgUKsf7kX/kLKeKgLxX7Iu+uX2geurNV1S5E01c/6N5YACD91bYhHyir+UFlv8nJ6/4F9CMkbHxVxM1hs7AT2iuC1qfgBa+X7chM/MlGabQux+kxu+bviZABbqnbrDoY6LWpE2MABChuvNL13uszEr1/Va22aCcYqj9M4KjdAnUWpjyTnBBvRG1MzH+zgBnzBxlfuoy88Tj9LHdJj+2AMr+7iYlX4Q2oLY2lK9ePHpZ7jwMwQkGCkTinahgyjnhperV8n9kI05m/ylFTkAdzGG8fmTFve+cePIql3zNJyu9yMmk27eeBUZzjYwbnWD/eh9CndnF3qi39B8SP2WGUrPzegqPqsfxGn/AMJiisyeZfi2MGihfpinN9oGsFgu/xTas9VvF9rs9DtsnJc7vxQETTmrC9aoHCCE2fDTtJ7gaTXcl0N2iBjaQcMrmFzVC/qF7Yro/pGBZVrOUaRFQeRIe+jl5QwRVYNBG/2yA0LGb93V3NGPSnlWy1ImyJLOLyuhO1HUfDdKxlfjxkJNP3beAA2wXW5xpp65xJiu4eSfE5MCr0H//cWklTicYH5p/1Kyd3SPBdT5AaYiAXl2mPvLjI69Ec3Ixx4NzKvKBiGP5/Qf7nsOWjhWuh1rNfDmcUymBvLjbNAqlvV8lfsH8wDH1ZCf5sqfJILZdkri7HzTYsLp4XCALqXO17bj0T5CfPmQ+E4aB3YzO1e6cp+yzSPEQIV2AacgZpq6LbMATbs1aERF8mUbUCp
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(36840700001)(40470700004)(46966006)(2616005)(336012)(36756003)(26005)(81166007)(40480700001)(40460700003)(6512007)(33656002)(6506007)(47076005)(83380400001)(82740400003)(356005)(8936002)(6486002)(8676002)(4326008)(478600001)(86362001)(2906002)(316002)(6916009)(5660300002)(41300700001)(36860700001)(70586007)(70206006)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 08:36:31.3109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e44770b5-802c-4df1-e738-08dbd5357d2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6723

SGkgYWxsLA0KDQpJ4oCZbSBzZW5kaW5nIHRoaXMgbWFpbCBsb29raW5nIGZvciBmZWVkYmFja3Mg
YWJvdXQgZ2VuZXJhbGlzaW5nIHRoZSBleGNsdWRlLWxpc3QuanNvbiwgYXMgc3VnZ2VzdGVkIChJ
SVJDKSBieSBKYW4NCnRoaXMgbGlzdCBjYW4gYmUgdXNlZCBieSBtdWx0aXBsZSB1c2VycyBhbmQg
bm90IG9ubHkgZm9yIE1JU1JBLCBieSBhZGRpbmcgYSBmaWVsZCB0byBldmVyeSBlbnRyeS4NCg0K
VGhlc2UgYXJlIHRoZSBtb2RpZmljYXRpb25zIEkgd291bGQgbGlrZSB0byBkbyB0byB0aGUgbGlz
dCwgSSB3aWxsIGltcGxlbWVudCB0aGVtIGlmIHdlIHJlYWNoIGFuIGFncmVlbWVudC4NCg0KZGlm
ZiAtLWdpdCBhL2RvY3MvbWlzcmEvZXhjbHVkZS1saXN0LnJzdCBiL2RvY3MvbWlzcmEvZXhjbHVk
ZS1saXN0LnJzdA0KaW5kZXggYzk3NDMxYTg2MTIwLi5lNjI0YmNmZWYwNTYgMTAwNjQ0DQotLS0g
YS9kb2NzL21pc3JhL2V4Y2x1ZGUtbGlzdC5yc3QNCisrKyBiL2RvY3MvbWlzcmEvZXhjbHVkZS1s
aXN0LnJzdA0KQEAgLTEsMTcgKzEsMTYgQEANCiAuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
Q0MtQlktNC4wDQogDQotRXhjbHVkZSBmaWxlIGxpc3QgZm9yIHhlbi1hbmFseXNpcyBzY3JpcHQN
Ci09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KK0V4Y2x1ZGUgZmls
ZSBsaXN0IGZvciB4ZW4gc2NyaXB0cw0KKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KIA0KLVRoZSBjb2RlIGFuYWx5c2lzIGlzIHBlcmZvcm1lZCBvbiB0aGUgWGVuIGNvZGViYXNl
IGZvciBib3RoIE1JU1JBDQotY2hlY2tlcnMgYW5kIHN0YXRpYyBhbmFseXNpcyBjaGVja2Vycywg
dGhlcmUgYXJlIHNvbWUgZmlsZXMgaG93ZXZlciB0aGF0DQotbmVlZHMgdG8gYmUgcmVtb3ZlZCBm
cm9tIHRoZSBmaW5kaW5ncyByZXBvcnQgZm9yIHZhcmlvdXMgcmVhc29ucyAoZS5nLg0KLXRoZXkg
YXJlIGltcG9ydGVkIGZyb20gZXh0ZXJuYWwgc291cmNlcywgdGhleSBnZW5lcmF0ZSB0b28gbWFu
eSBmYWxzZQ0KLXBvc2l0aXZlIHJlc3VsdHMsIGV0Yy4pLg0KK0RpZmZlcmVudCBYZW4gc2NyaXB0
cyBjYW4gcGVyZm9ybSBvcGVyYXRpb25zIG9uIHRoZSBjb2RlYmFzZSB0byBjaGVjayBpdHMNCitj
b21wbGlhbmNlIGZvciBhIHNldCBvZiBydWxlcywgaG93ZXZlciBYZW4gY29udGFpbnMgc29tZSBm
aWxlcyB0aGF0IGFyZSB0YWtlbg0KK2Zyb20gb3RoZXIgcHJvamVjdHMgKGUuZy4gbGludXgpIGFu
ZCB0aGV5IGNhbid0IGJlIHVwZGF0ZWQgdG8gYWxsb3cgYmFja3BvcnRpbmcNCitmaXhlcyBmcm9t
IHRoZWlyIHNvdXJjZSwgZm9yIHRoaXMgcmVhc29uIHRoZSBmaWxlIGRvY3MvbWlzcmEvZXhjbHVk
ZS1saXN0Lmpzb24NCitpcyBrZXB0IGFzIGEgc291cmNlIG9mIGFsbCB0aGVzZSBmaWxlcyB0aGF0
IGFyZSBleHRlcm5hbCB0byB0aGUgWGVuIHByb2plY3QuDQogDQotRm9yIHRoaXMgcmVhc29uIHRo
ZSBmaWxlIGRvY3MvbWlzcmEvZXhjbHVkZS1saXN0Lmpzb24gaXMgdXNlZCB0byBleGNsdWRlIGV2
ZXJ5DQotZW50cnkgbGlzdGVkIGluIHRoYXQgZmlsZSBmcm9tIHRoZSBmaW5hbCByZXBvcnQuDQot
Q3VycmVudGx5IG9ubHkgdGhlIGNwcGNoZWNrIGFuYWx5c2lzIHdpbGwgdXNlIHRoaXMgZmlsZS4N
CitFdmVyeSBlbnRyeSBvZiB0aGUgZmlsZSBjYW4gYmUgbGlua2VkIHRvIGRpZmZlcmVudCBjaGVj
a2Vycywgc28gdGhhdCB0aGlzIGxpc3QNCitjYW4gYmUgdXNlZCBieSBtdWx0aXBsZSBzY3JpcHRz
IHNlbGVjdGluZyBvbmx5IHRoZSByZXF1aXJlZCBlbnRyaWVzLg0KIA0KIEhlcmUgaXMgYW4gZXhh
bXBsZSBvZiB0aGUgZXhjbHVkZS1saXN0Lmpzb24gZmlsZTo6DQogDQpAQCAtMjEsMTAgKzIwLDEy
IEBAIEhlcmUgaXMgYW4gZXhhbXBsZSBvZiB0aGUgZXhjbHVkZS1saXN0Lmpzb24gZmlsZTo6DQog
fCAgICAgICAgew0KIHwgICAgICAgICAgICAicmVsX3BhdGgiOiAicmVsYXRpdmUvcGF0aC9mcm9t
L3hlbi9maWxlIiwNCiB8ICAgICAgICAgICAgImNvbW1lbnQiOiAiVGhpcyBmaWxlIGlzIG9yaWdp
bmF0ZWQgZnJvbSAuLi4iDQorfCAgICAgICAgICAgICJjaGVja2VycyI6ICJ4ZW4tYW5hbHlzaXMi
DQogfCAgICAgICAgfSwNCiB8ICAgICAgICB7DQogfCAgICAgICAgICAgICJyZWxfcGF0aCI6ICJy
ZWxhdGl2ZS9wYXRoL2Zyb20veGVuL2ZvbGRlci8qIiwNCiB8ICAgICAgICAgICAgImNvbW1lbnQi
OiAiVGhpcyBmb2xkZXIgaXMgYSBsaWJyYXJ5Ig0KK3wgICAgICAgICAgICAiY2hlY2tlcnMiOiAi
eGVuLWFuYWx5c2lzIHNvbWUtY2hlY2tlciINCiB8ICAgICAgICB9LA0KIHwgICAgICAgIHsNCiB8
ICAgICAgICAgICAgInJlbF9wYXRoIjogInJlbGF0aXZlL3BhdGgvZnJvbS94ZW4vbWVtKi5jIiwN
CkBAIC0zOSw2ICs0MCwxMiBAQCBIZXJlIGlzIGFuIGV4cGxhbmF0aW9uIG9mIHRoZSBmaWVsZHMg
aW5zaWRlIGFuIG9iamVjdCBvZiB0aGUgImNvbnRlbnQiIGFycmF5Og0KICAgIG1hdGNoIG1vcmUg
dGhhbiBvbmUgZmlsZS9mb2xkZXIgYXQgdGhlIHRpbWUuIFRoaXMgZmllbGQgaXMgbWFuZGF0b3J5
Lg0KICAtIGNvbW1lbnQ6IGFuIG9wdGlvbmFsIGNvbW1lbnQgdG8gZXhwbGFpbiB3aHkgdGhlIGZp
bGUgaXMgcmVtb3ZlZCBmcm9tIHRoZQ0KICAgIGFuYWx5c2lzLg0KKyAtIGNoZWNrZXJzOiBhbiBv
cHRpb25hbCBsaXN0IG9mIGNoZWNrZXJzIHRoYXQgd2lsbCBleGNsdWRlIHRoaXMgZW50cmllcyBm
cm9tDQorICAgdGhlaXIgcmVzdWx0cy4gVGhpcyBmaWVsZCBpcyBvcHRpb25hbCBhbmQgd2hlbiBu
b3Qgc3BlY2lmaWVkLCBpdCBtZWFucyBldmVyeQ0KKyAgIGNoZWNrZXIgd2lsbCB1c2UgdGhhdCBl
bnRyeS4NCisgICBDdXJyZW50IGltcGxlbWVudGVkIHZhbHVlcyBmb3IgdGhpcyBmaWVsZCBhcmU6
DQorICAgIC0geGVuLWFuYWx5c2lzOiB0aGUgeGVuLWFuYWx5c2lzLnB5IHNjcmlwdCBleGNsdWRl
IHRoaXMgZW50cnkgZm9yIGJvdGggTUlTUkENCisgICAgICBhbmQgc3RhdGljIGFuYWx5c2lzIHNj
YW4uIChJbXBsZW1lbnRlZCBvbmx5IGZvciBDcHBjaGVjayB0b29sKQ0KIA0KIFRvIGVhc2UgdGhl
IHJldmlldyBhbmQgdGhlIG1vZGlmaWNhdGlvbnMgb2YgdGhlIGVudHJpZXMsIHRoZXkgc2hhbGwg
YmUgbGlzdGVkIGluDQogYWxwaGFiZXRpY2FsIG9yZGVyIHJlZmVycmluZyB0byB0aGUgcmVsX3Bh
dGggZmllbGQuDQoNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KSW4gdGhpcyB3YXkgSSBjb3Vs
ZCB1c2UgdGhpcyBsaXN0IGFsc28gZm9yIHRoZSBjbGFuZy1mb3JtYXQgdG9vbCwgZXhjbHVkaW5n
IGFsbCB0aGUgZmlsZSBmcm9tIGV4dGVybmFsIHNvdXJjZXMNCnBsdXMgdGhlIGZpbGUgd2UgZG9u
4oCZdCB3YW50IGNsYW5nLWZvcm1hdCB0byB0b3VjaC4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCg==

