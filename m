Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4FC51FB72
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 13:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324426.546460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no1l2-0007kd-8I; Mon, 09 May 2022 11:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324426.546460; Mon, 09 May 2022 11:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no1l2-0007hZ-4p; Mon, 09 May 2022 11:40:56 +0000
Received: by outflank-mailman (input) for mailman id 324426;
 Mon, 09 May 2022 11:40:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11oC=VR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1no1l0-0007hT-8G
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 11:40:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e16cb939-cf8c-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 13:40:53 +0200 (CEST)
Received: from AS9PR06CA0245.eurprd06.prod.outlook.com (2603:10a6:20b:45f::13)
 by DBBPR08MB4505.eurprd08.prod.outlook.com (2603:10a6:10:cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 11:40:50 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::9b) by AS9PR06CA0245.outlook.office365.com
 (2603:10a6:20b:45f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Mon, 9 May 2022 11:40:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 11:40:49 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Mon, 09 May 2022 11:40:49 +0000
Received: from 2b216b7fe393.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6E0D1CA-B36C-4A28-BBA9-4413DECFB67E.1; 
 Mon, 09 May 2022 11:40:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b216b7fe393.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 May 2022 11:40:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB2671.eurprd08.prod.outlook.com (2603:10a6:802:1d::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23; Mon, 9 May
 2022 11:40:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 11:40:35 +0000
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
X-Inumbo-ID: e16cb939-cf8c-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GwnC2NFp62oPunkYlk5HzwEbaw1Pi6HfJYY9u5o2Dk4qvibN2hqDG1NYRPzSVQXdwzQS5zvl1T4LL9zxVm8eJVYdfplqonhUmOzJf0JNXqSzqVegoitC0u/wJNiczsTTE6i+EjO/BgSnfIWCQWGQV29JCdBwkasxcrKXH7YimkliS8SxbLH72kn1tuJo83a645w0UNgyKkwGJv/tHxip/KorAmKVeG0VUwI7+zusnbuE/lJ4x6kivlP0bgxfMk9i6/yZmvTo0Ph1UtqH5+9Jiy/3z/4Mwnv+FDZc0ggmp9iFrxhUIEmrBk+O+WhU4ahP86EsIRtKNXc2/2sjzgz/5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Msn3m+DRMQj53msMoJYzgRF0YR3qtSOqc2blhVCClx8=;
 b=S/mV+pJcLbbIw4ToO4ij28fxTp8q+LBiSOlj+RzkzMRn44BBDXxtuSMKZN369gHdLrAAeKMLgmS3hIFjA3/z1evzZjDhgRXlyA+1HuL2EqCddUZvfGHWsraLVmSHaLRqjrzMUybn4AXU2xg220T1phEUrIh44fgb7tbDDvDfPxOY5vgAFbJGmvOdPZ94NfFYEp2URE1fFfDgqlDocAYdO3cJAQTcPD4DBH6+RZQgzBRCq0Hbe1q80y14XkJOvjTqcytd3hPbo4D9+rmlLO2JwU/Cas9aRtPKWrvl/LkixmrVur0F27+aCa9YTve2Mz+ldxqgGgdrB3g79ruYfVMnfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Msn3m+DRMQj53msMoJYzgRF0YR3qtSOqc2blhVCClx8=;
 b=ab4dxnlPQd09P9uFvyK7LRpNmrm3iVK/MmMf5vLrzPClwZzF+upOzKgXzISHR0qGob37abpYKhS5gtvLwS4jnFORjBjpRNzgT32tlBbQAmcR3jbYl1ZSkLTR75LUQGwfFQjUf9kHDpiOuxevIJCIJqg+Qbn/HjRAaVXPq+qtnOg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 857c88c09eb1e90e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJLtZAVz04LXE1VWv9WzC4E6H1E35RWhAUxPvs5C1f0wMXmppmmwVnqOD6hfMKHr8927S0+pB1EvUeMYWbDRVvRtz3rLrgUupgh9ZjPVHvdnEBzKmHD2XbPocI7rF8v0G1z/2xeN1H8qWPg8wy5TUZrYrg513cfOZDVBpHuy4g+F8a237xWkXD+zHRuO43v1Pt/D/di706UgWBK1/ie++VYVXDCIzUYQtXGPs1pZJgWM8Mtd5qj3rJrxqW8XUVAo/exKjfFfEbI4TTQRxa8YbyiBy4cFHRpabEgQyWyeRamcPp7nuUvjeKnqxV8aPDbA4cY9dPmpal7ATAaq2b9TKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Msn3m+DRMQj53msMoJYzgRF0YR3qtSOqc2blhVCClx8=;
 b=TIfr6EAWepaYj7stvsPOn5xNsd2wIeh1AAmBLY8gjLA2peJ7HwpYTyFuHIzs46tNTKj/WPMfKB3bveCWX+HSa8qunYZBwcMMH3XUTTB0NslRekHpQVQMbisqezaKYKk94FkHTdsnm7LY5t6KfxQcLL7HgYztk5WFgoCmASzebPCCB2RmCqk7xjT4QJZUjVQEv0Cdn54qFN5P9jWgArwbezTL9yPkcFmsbQ2hfz7HaBGrBRZoxbx9HF0tDCw6/Fgw1tK7rH38jnsPEFKBIObRKEoeD/xs+SGtSe6U36PwrYSyIewjbhl+5lx6ylhu3a8U8p/M/6r6iSVsuLaecbwxPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Msn3m+DRMQj53msMoJYzgRF0YR3qtSOqc2blhVCClx8=;
 b=ab4dxnlPQd09P9uFvyK7LRpNmrm3iVK/MmMf5vLrzPClwZzF+upOzKgXzISHR0qGob37abpYKhS5gtvLwS4jnFORjBjpRNzgT32tlBbQAmcR3jbYl1ZSkLTR75LUQGwfFQjUf9kHDpiOuxevIJCIJqg+Qbn/HjRAaVXPq+qtnOg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/arm: Add sb instruction support
Thread-Topic: [PATCH 3/3] xen/arm: Add sb instruction support
Thread-Index:
 AQHYXtGbLw8lUArxPEOQFl634Avmjq0NftKAgADToQCAAAuUAIAH/dMAgAAGbICAAAULAIAABToAgAAJA4A=
Date: Mon, 9 May 2022 11:40:35 +0000
Message-ID: <2229A6CD-5B04-46F4-BAAC-56C1F3C55DFD@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <24fd2364294345f103cb13bdab2ad0b706681071.1651570561.git.bertrand.marquis@arm.com>
 <6571ead7-ff94-acb5-1e55-53ae69944bf0@xen.org>
 <E67D129C-DCA4-479E-B8B8-4C7DF8CC92B9@arm.com>
 <d8889ee4-7790-ab93-a5d1-708aa541dd1b@xen.org>
 <15DEAB6E-3130-49E8-87BD-AC82C08C7698@arm.com>
 <0ac6d6c0-4f34-ad1e-c473-2278dd7289c9@xen.org>
 <3E6AFDF4-A55B-4C7C-ADFB-A451C478661C@arm.com>
 <1a80d099-6fe4-377b-c3b1-a08c7d8f59cf@xen.org>
In-Reply-To: <1a80d099-6fe4-377b-c3b1-a08c7d8f59cf@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b9c1a0c4-08a5-49b7-4834-08da31b0c3eb
x-ms-traffictypediagnostic:
	VI1PR08MB2671:EE_|AM5EUR03FT061:EE_|DBBPR08MB4505:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4505C8FD21B9480292A7CCDE9DC69@DBBPR08MB4505.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yZf5Fogg3n7uLCkvJ8QsaK4I96eKQh9cM/r36GlD1SFDosBro6ClkItdoyxpEuMlpeAB7xEpEAAQW6IyWlFpKDyOZsqWHbPjAcbVVh3Y+KOhifFDmeOLQfq3D5AnPMXFhxoyoid2Fzkx0TBNboYFzsZlDRsF+BgIsbierIpFb7g9VzN2p0pwbuBT4vOGkdF4/yNEXsv8iB6r4Gvd2eamFr/tqCoOjaetQu4W1Hbc1S9pANnTBR39G/497/zFG5bH+19eP+Y/hcAsEd4a3H1VJpmHv7z5qrNDp58PmWO6gVR+EhotmhL6DMe4sLCRIK8n+VrvIuJl69e7CUvcYnhqbmb1dvyAAbCIz89g1ugz1Gyjvc4rrS7ok8I/PIpo8NOiJHghIJVgL3EoTd5VtgDkgAtbZwk4cb0nr/MzwzeCrn2Bi0rIKSA0hxOB3+X9qwhES5hu3X0PQ2s2tv+oGyBlH4CFUFux8pqB4E87ZcmjS0MqSQ//yuMTr14eX7eBgNG78UdhX506DMj0574qE4RRqq6g9GdWItk5z2wnImWcFspYyMRC2jafNoebcQ2rJea8cPZ+8sC2P7y+T9DT/klkNwCs9S5unEpWTpkqZBPMPR3yGxBiMWj/vgh362F2/Skkf9g6yKP1RIUsupVJL8/KKf7Lw4cRUCbFfR728ggOIocHkH1Q/DtHZmbjRMQJD1pAaVAub+hmyxXJAXBZe3+V3DnDhiOGt2+AuiN6HIofSTV2kV2Q0TqB4svkF7xgV4656O9z2xUyDrVt0sCX1vwNqg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(186003)(316002)(2616005)(76116006)(54906003)(36756003)(33656002)(6512007)(71200400001)(26005)(508600001)(6506007)(53546011)(6486002)(4326008)(66446008)(66556008)(86362001)(8676002)(66476007)(64756008)(66946007)(83380400001)(2906002)(38070700005)(38100700002)(122000001)(5660300002)(6916009)(8936002)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E814324EE2C70B4EBA2252E766E95600@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2671
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81b7b004-5402-4d3e-645b-08da31b0bb6c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	henh0OwSg7XvoS/UJl2renBrRzNHzCcllJEQGpNiTqPe5EAx2DO9WIGxOw/5LSf/2aWu4SIfRSJ2FJMxHBT94WZ38RSFqiMBhkfzuLs0JcNyZG/coygAfreczqAiFkUd0e3Gax7s528DiNdDpdhLdBLNFzVlrcXc6KKo75aHpc1WIwr7qE9XxzuxxV5TKuxUKGzDYi4uYD+ROH3PE10TL4gz/4sXfZqbBs66ERqzjul5kMm0dk5r7y9lG/M/4hOH+rMkGfzWIGHNioNOgYIDg3aQykel6Fq4qI2ZUozw3CymQyoWGJa/9fD+3YYf2RLQVDrb1I+5pcqgD2MfXfxLUaQrQsPBrKaNqV+MDZ61VW7WL5BV1hQSu2B1hbJoLy7IdfbKHFlt57qeY9s6Iqtpc52edokKW2YIvVV8Mxuh+4zknrz+JfIY88cuDFhMk62+eJRBQ2Zn4KaAi9IinSYZMhPmOkuwivFryLLDyEAH0gbteok9kVLIK4/IXhKta3nic+z9rhrC3BHTrC8aW9bsjNi6VXKhh9vSvbPX0JxhbvAAbSWdzmuhoatosJqZNW0vvWvxSPs12siq4pJInapCUXBJkyOU8tWcVBaINYAAZfqHJrNZdEf46k6RPmobENEHkusBPYhb8a8g/z8WEYT/La9jU4y9k/3R6WPxwCa/ehFzr5ywqOEQKK5AkDEaIQ/3B9iDNfqZB8XKso5/zN62TQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70206006)(6486002)(316002)(47076005)(6512007)(70586007)(508600001)(186003)(40460700003)(81166007)(86362001)(36860700001)(2906002)(4326008)(8676002)(6862004)(54906003)(336012)(26005)(82310400005)(33656002)(356005)(2616005)(8936002)(83380400001)(6506007)(107886003)(36756003)(5660300002)(53546011)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 11:40:49.6546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c1a0c4-08a5-49b7-4834-08da31b0c3eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4505

SGksDQoNCj4gT24gOSBNYXkgMjAyMiwgYXQgMTI6MDgsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiAwOS8wNS8yMDIyIDExOjQ5LCBCZXJ0
cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+IE9uIDkgTWF5IDIwMjIsIGF0IDExOjMxLCBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiBPbiAwOS8wNS8yMDIyIDExOjA4LCBC
ZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4gT24gNCBNYXkgMjAyMiwgYXQgMDk6MDYsIEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiANCj4+Pj4+
IA0KPj4+Pj4gT24gMDQvMDUvMjAyMiAwODoyNCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+
Pj4+PiBIaSBKdWxpZW4sDQo+Pj4+PiANCj4+Pj4+IEhpIEJlcnRyYW5kLA0KPj4+Pj4gDQo+Pj4+
Pj4+IE9uIDMgTWF5IDIwMjIsIGF0IDE5OjQ3LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
PiB3cm90ZToNCj4+Pj4+Pj4+IEEgbmV3IGNwdWVycmF0YSBjYXBhYmlsaXR5IGlzIGludHJvZHVj
ZWQgdG8gZW5hYmxlIHRoZSBhbHRlcm5hdGl2ZQ0KPj4+Pj4+PiANCj4+Pj4+Pj4gJ3NiJyBpcyBk
ZWZpbml0ZWx5IG5vdCBhbiBlcnJhdHVtLiBFcnJhdGEgYXJlIGZvciBzdHVmZiB0aGF0IGFyZSBt
ZWFudCB0byBiZSBzcGVjaWZpYyB0byBvbmUgKG9yIG11bHRpcGxlKSBDUFUgYW5kIHRoZXkgYXJl
IG5vdCBwYXJ0IG9mIHRoZSBhcmNoaXRlY3R1cmUuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBUaGlzIGlz
IHRoZSBmaXJzdCB0aW1lIHdlIGludHJvZHVjZSBhIGZlYXR1cmUgaW4gWGVuLiBTbyB3ZSBuZWVk
IHRvIGFkZCBhIG5ldyBhcnJheSBpbiBjcHVmZWF0dXJlLmMgdGhhdCB3aWxsIGNvdmVyICdTQicg
Zm9yIG5vdy4gSW4gZnV0dXJlIHdlIGNvdWxkIGFkZCBmZWF0dXJlIGxpa2UgcG9pbnRlciBhdXRo
LCBMU0UgYXRvbWljcy4uLg0KPj4+Pj4+IEkgYW0gbm90IHF1aXRlIHN1cmUgd2h5IHlvdSB3b3Vs
ZCB3YW50IHRvIGRvIHRoYXQuDQo+Pj4+Pj4gVXNpbmcgdGhlIHNiIGluc3RydWN0aW9uIGlzIGRl
ZmluaXRlbHkgc29tZXRoaW5nIHRvIGRvIHRvIHNvbHZlIGVycmF0YXMsIGlmIGEgQ1BVIGlzIG5v
dCBpbXBhY3RlZCBieSB0aG9zZSBlcnJhdGFzLCB3aHkgd291bGQgeW91IHdhbnQgdG8gdXNlIHRo
aXMgPw0KPj4+Pj4gDQo+Pj4+PiBJIGFncmVlIHRoYXQgU0IgaXMgdXNlZCB0byBzb2x2ZSBlcnJh
dGEgYnV0IHRoZSBpbnN0cnVjdGlvbiBpdHNlbGYgaXMgbm90IGEgd29ya2Fyb3VuZCAoaXQgbWF5
IGJlIHBhcnQgb2YgaXQgdGhvdWdoKS4gSW5zdGVhZCwgdGhpcyBpcyBhIG1vcmUgZWZmaWNpZW50
IHdheSB0byBwcmV2ZW50IHNwZWN1bGF0aW9uIGFuZCB3aWxsIHJlcGxhY2UgZHNiL2lzYi4NCj4+
Pj4+IA0KPj4+Pj4gU3BlY3VsYXRpb24gaXMgbmV2ZXIgZ29pbmcgdG8gZGlzYXBwZWFyIGZyb20g
cHJvY2Vzc29yLiBTbywgaW4gdGhlIGZ1dHVyZSwgdGhlcmUgbWlnaHQgYmUgdmFsaWQgcmVhc29u
IGZvciB1cyB0byBzYXkgIldlIGRvbid0IHdhbnQgdGhlIHByb2Nlc3NvciB0byBzcGVjdWxhdGUi
LiBUaGlzIHdvdWxkIG1lYW4gdXNpbmcgU0IuDQo+Pj4+IElmIHRoZSBuZWVkIGFyaXNlIHRoZW4g
d2Ugd2lsbCBjaGVjayBkZXBlbmRpbmcgb24gdGhhdCBob3cgd2UgY2FuIHN1cHBvcnQgaXQgYnV0
IGluIHRoZSBjdXJyZW50IHN0YXR1cyBhcyB0aGVyZSBpcyBubyB1c2UgY2FzZSBJIGRvbuKAmXQg
dGhpbmsgd2UgbmVlZCB0aGF0Lg0KPj4+IA0KPj4+IEl0IGlzIG5vdCBjbGVhciBob3cgSSBzaG91
bGQgcmVhZCB0aGlzIGFuc3dlci4uLiBJZiB5b3UgYWRkIFNCIGluIGNwdWVycmF0YS5jLCB0aGVu
IGEgdXNlciB3aWxsIHN0YXJ0IHRvIHNlZSBtZXNzYWdlIGxpa2U6DQo+Pj4gDQo+Pj4gImVuYWJs
ZWQgd29ya2Fyb3VuZCBmb3IgU3BlY3VsYXRpb24gQmFycmllciIuDQo+Pj4gDQo+Pj4gV2hpY2gg
aXMgY29tcGxldGVseSBib2d1cy4gUmVwbGFjaW5nICJkc2I7IGlzYiIgd2l0aCAic2IiIGlzIG1v
c3RseSBhbiBvcHRpbWl6YXRpb24gYW5kIG5vbmUgb2YgdGhlIGN1cnJlbnQgdXNlIHdpbGwgZW5k
IHVwIHRvIGJlIGFyY2hpdGVjdHVyYWx5IGV4ZWN1dGVkLg0KPj4gU28gdWx0aW1hdGVseSBzb21l
dGhpbmcgbGlrZSB0aGlzIGlzIHdoYXQgeW91IGFyZSBsb29raW5nIGZvciA/DQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jIGIveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5j
DQo+PiBpbmRleCBlNzQ0YWJlODAwLi43YzNlNTE0MWE2IDEwMDY0NA0KPj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2NwdWVycmF0YS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMNCj4+
IEBAIC02ODEsOSArNjgxLDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXJtX2NwdV9jYXBhYmls
aXRpZXMgYXJtX2VycmF0YVtdID0gew0KPj4gICAgICAgICAgLmNhcGFiaWxpdHkgPSBBUk02NF9X
T1JLQVJPVU5EX0FUX1NQRUNVTEFURSwNCj4+ICAgICAgICAgIE1JRFJfQUxMX1ZFUlNJT05TKE1J
RFJfQ09SVEVYX0E1NSksDQo+PiAgICAgIH0sDQo+PiArfTsNCj4+ICsNCj4+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGFybV9jcHVfY2FwYWJpbGl0aWVzIGFybV9mZWF0dXJlc1tdID0gew0KPj4gICNp
ZmRlZiBDT05GSUdfQVJNXzY0DQo+PiAgICAgIHsNCj4+IC0gICAgICAgIC5kZXNjID0gIlNwZWN1
bGF0aW9uIGJhcnJpZXIgKFNCKSIsDQo+PiArICAgICAgICAuZGVzYyA9ICJTcGVjdWxhdGlvbiBi
YXJyaWVyIGluc3RydWN0aW9uIChTQikiLA0KPj4gICAgICAgICAgLmNhcGFiaWxpdHkgPSBBUk02
NF9IQVNfU0IsDQo+PiAgICAgICAgICAubWF0Y2hlcyA9IGhhc19zYl9pbnN0cnVjdGlvbiwNCj4+
ICAgICAgfSwNCj4+IEBAIC02OTQsNiArNjk3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhcm1f
Y3B1X2NhcGFiaWxpdGllcyBhcm1fZXJyYXRhW10gPSB7DQo+PiAgdm9pZCBjaGVja19sb2NhbF9j
cHVfZXJyYXRhKHZvaWQpDQo+PiAgew0KPj4gICAgICB1cGRhdGVfY3B1X2NhcGFiaWxpdGllcyhh
cm1fZXJyYXRhLCAiZW5hYmxlZCB3b3JrYXJvdW5kIGZvciIpOw0KPj4gKyAgICB1cGRhdGVfY3B1
X2NhcGFiaWxpdGllcyhhcm1fZmVhdHVyZXMsICJlbmFibGVkIHN1cHBvcnQgZm9yIik7DQo+PiAg
fQ0KPiBXaGF0IEkgYW0gbG9va2luZyBmb3IgaXMgdHdvIHNlcGFyYXRlIGFycmF5czogb25lIGZv
ciB3b3JrYXJvdW5kIGFuZCB0aGUgb3RoZXIgZm9yIGZlYXR1cmVzLiBTb21ldGhpbmcgbGlrZSAo
dW50ZXN0ZWQpOg0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9jcHVmZWF0dXJlLmMg
Yi94ZW4vYXJjaC9hcm0vY3B1ZmVhdHVyZS5jDQo+IGluZGV4IGE1ODk2NWY3YjliZi4uNTRjMTA3
NTFkYmE4IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vY3B1ZmVhdHVyZS5jDQo+ICsrKyBi
L3hlbi9hcmNoL2FybS9jcHVmZWF0dXJlLmMNCj4gQEAgLTcwLDYgKzcwLDIwIEBAIHZvaWQgX19p
bml0IGVuYWJsZV9jcHVfY2FwYWJpbGl0aWVzKGNvbnN0IHN0cnVjdCBhcm1fY3B1X2NhcGFiaWxp
dGllcyAqY2FwcykNCj4gICAgIH0NCj4gfQ0KPiANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXJt
X2NwdV9jYXBhYmlsaXRpZXMgYXJtX2ZlYXR1cmVzW10gPSB7DQo+ICsgICAgLyogWFhYOiBBZGQg
U0IgKi8NCj4gKyAgICB7fSwNCj4gK307DQo+ICsNCj4gK3ZvaWQgY2hlY2tfbG9jYWxfY3B1X2Zl
YXR1cmVzKHZvaWQpDQo+ICt7DQo+ICsgICAgdXBkYXRlX2NwdV9jYXBhYmlsaXRpZXMoYXJtX2Zl
YXR1cmVzLCAiZW5hYmxlZCBzdXBwb3J0IGZvciIpOw0KPiArfQ0KPiArDQo+ICt2b2lkIF9faW5p
dCBlbmFibGVfY3B1X2ZlYXR1cmVzKHZvaWQpDQo+ICt7DQo+ICsgICAgZW5hYmxlX2NwdV9jYXBh
YmlsaXRpZXMoYXJtX2ZlYXR1cmVzKTsNCj4gK30NCj4gKw0KPiAvKg0KPiAgKiBSdW4gdGhyb3Vn
aCB0aGUgZW5hYmxlZCBjYXBhYmlsaXRpZXMgYW5kIGVuYWJsZSgpIHRoZW0gb24gdGhlIGNhbGxp
bmcgQ1BVLg0KPiAgKiBJZiBlbmFibGluZyBvZiBhbnkgY2FwYWJpbGl0eSBmYWlscyB0aGUgZXJy
b3IgaXMgcmV0dXJuZWQuIEFmdGVyIGVuYWJsaW5nIGENCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4gaW5kZXggZDVkMDc5MmVkNDhh
Li5jMmNkNDQyODQ0ZGYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+ICsr
KyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+IEBAIC05NTEsNiArOTUxLDcgQEAgdm9pZCBfX2lu
aXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCwNCj4gICAgICAqIChj
YWxsZWQgZnJvbSBzbXBfaW5pdF9jcHVzKCkpLg0KPiAgICAgICovDQo+ICAgICBjaGVja19sb2Nh
bF9jcHVfZXJyYXRhKCk7DQo+ICsgICAgY2hlY2tfbG9jYWxfY3B1X2ZlYXR1cmVzKCk7DQo+IA0K
PiAgICAgaW5pdF94ZW5fdGltZSgpOw0KPiANCj4gQEAgLTEwMjEsNiArMTAyMiw3IEBAIHZvaWQg
X19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQsDQo+ICAgICAg
Ki8NCj4gICAgIGFwcGx5X2FsdGVybmF0aXZlc19hbGwoKTsNCj4gICAgIGVuYWJsZV9lcnJhdGFf
d29ya2Fyb3VuZHMoKTsNCj4gKyAgICBlbmFibGVfY3B1X2ZlYXR1cmVzKCk7DQo+IA0KPiAgICAg
LyogQ3JlYXRlIGluaXRpYWwgZG9tYWluIDAuICovDQo+ICAgICBpZiAoICFpc19kb20wbGVzc19t
b2RlKCkgKQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYyBiL3hlbi9hcmNo
L2FybS9zbXBib290LmMNCj4gaW5kZXggN2JmZDBhNzNhN2QyLi5kNmI4YzU5OGRmOTggMTAwNjQ0
DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9zbXBib290LmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL3Nt
cGJvb3QuYw0KPiBAQCAtMzgzLDYgKzM4Myw3IEBAIHZvaWQgc3RhcnRfc2Vjb25kYXJ5KHZvaWQp
DQo+ICAgICBsb2NhbF9hYm9ydF9lbmFibGUoKTsNCj4gDQo+ICAgICBjaGVja19sb2NhbF9jcHVf
ZXJyYXRhKCk7DQo+ICsgICAgY2hlY2tfbG9jYWxfY3B1X2ZlYXR1cmVzKCk7DQo+IA0KPiAgICAg
cHJpbnRrKFhFTkxPR19ERUJVRyAiQ1BVICV1IGJvb3RlZC5cbiIsIHNtcF9wcm9jZXNzb3JfaWQo
KSk7DQoNClRoYW5rcyBmb3IgdGhlIGNvZGUsIEkgZ2V0IHRoZSBpZGVhIGFuZCB3aWxsIGRvIHRo
YXQuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1
bGllbiBHcmFsbA0KDQo=

