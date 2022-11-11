Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2278625B54
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 14:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442540.696786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUER-0007ov-UT; Fri, 11 Nov 2022 13:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442540.696786; Fri, 11 Nov 2022 13:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUER-0007lz-Ql; Fri, 11 Nov 2022 13:38:07 +0000
Received: by outflank-mailman (input) for mailman id 442540;
 Fri, 11 Nov 2022 13:38:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FoG2=3L=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1otUEP-0007lt-Me
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 13:38:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11341004-61c6-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 14:38:04 +0100 (CET)
Received: from AS8P189CA0057.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::35)
 by DBAPR08MB5607.eurprd08.prod.outlook.com (2603:10a6:10:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 13:38:01 +0000
Received: from VI1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:458:cafe::4f) by AS8P189CA0057.outlook.office365.com
 (2603:10a6:20b:458::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Fri, 11 Nov 2022 13:38:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT013.mail.protection.outlook.com (100.127.145.11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 13:38:00 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Fri, 11 Nov 2022 13:38:00 +0000
Received: from 18f89e021f57.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 182227E7-8AE6-46B0-AC20-6A3A3BBB5AEB.1; 
 Fri, 11 Nov 2022 13:37:54 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18f89e021f57.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Nov 2022 13:37:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB7324.eurprd08.prod.outlook.com (2603:10a6:20b:443::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 13:37:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Fri, 11 Nov 2022
 13:37:52 +0000
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
X-Inumbo-ID: 11341004-61c6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=URkXotxa9CReliKmWEVfJASzydhHwGKmFU9dJAhXRnl5wDWlBMaNSPELP7g7Tu1GaB8RtzV0D0mfyQ0WXVb8p+qW5u63Ymo/XA3i2WKGEyczY8uWLr3kEf/kT45xDZn1WyhrcxW1FuzikIV32jVwX2FKoJyHCzm3t7NLgxYQStQvmgGxSDX/yyYjcGyXUhFoWFmAC+gO9K5J2C3uzYD+RiGFxmJvtArRPRjkuJRYdxvCVqR19JABKcaLEUSeHJk7inTCHkTHn52oaYvL5mBLxfa8imGwPm7OsMCORIe5EIO8EfT1+clKFgBdPxjsX+fZRp7ULqiTcY938HEFE+2i1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BX/77w8igStMoOc+Zb5oEeSYBhzeohtIobGZWTMWzas=;
 b=V9dweTYf2JwWe37VlXuzPWzJELm7Dm0uwB56+0C+miI7wnvv/k6VwxDQ6lZi+k74yFjaCh6bn2tt/BbFpBkW6anSdT3SN2g+4KmYghZCzBeeF4u443oVdtltBXo10EpkFlQADw+pH54bUj0FAx69M1C8teju0F6kTNMjDpzkuH9qepnf7Vuj8pYMHozfs3ADHn6GpplZ2QpmUEXLfGY/YLQNdpZ5vm/Qdirbwq4eiAfXDYLbOyGgPU7eB+PTDWembcU/YeOa3DpMvWoG0bnvYxJCWp+cb5GQwtoP+tlaV6PE+DJ/D6ZuEHKq+JmaxfMx3QwSB/mVmUATgOGQP3nx1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BX/77w8igStMoOc+Zb5oEeSYBhzeohtIobGZWTMWzas=;
 b=0Q9BSf62EHIYja8UEnzD7QXwrgYLIhoIE1iOteXhbA8ViFzQTON9wnKHbVgU4HEroSPl22J8Lyhvzkm6df6R/8YmQHYXp+jOpsWc/4VuASRsppXV64C0s4TtRxyz22Z9Y720kG2ZRn8n6oxX7QqGaelpt12C3MIAc/LfhGO5y0E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTJdL8wEuoDdZlohTxmZ9x4u48t9LujN79d7f0rjxE0alTTLwFtw5KMkiVYmkoEkbE0bynjVLBXjE4SDSwwZ0lK5w0l5NDxWgDAEKdOqrsVsgXc7jrF2qn8SA21AOFi7T1Wb/Tlip9ecVYn6vvCasrLN/0Ejpv+drDkixkMEPLGvGlPWPdOwyOUysaOyKzbdS3M+aoL7KqMae+2L111oGUiBwW6jidM3ajPQhD87HmK/+cQOJlSOePWyD3kFcOYOpOfRs7D0FTGndwzcqAkDhlhJCb7lzo62vKG4XN9TiQpvLo1ccAHq6xTvY/t1SQgqU3zdL7aX46EpoooUdLXlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BX/77w8igStMoOc+Zb5oEeSYBhzeohtIobGZWTMWzas=;
 b=LQzs6RUnXUVTjq7vMQaRmq0x1kWWk7IBkUnSCe4cGMwDbsar+iHDetYjfR1BSWVqCIuqMXO5V+kvG1nLAV7UnoCvZZYTKk3GcfN5laXQg+ZfTKJSeDE7lllHQC5ChmW+3rTJWAcE/N1ToC/IvXFEdZjoIpb7pdbxS+KSkwpfQGA55g7eI/t5V7dRqx9djH8tbhvVuGWfwEaYf3Kg8nfaRiTZ/gqFTQoabsI9Ofkjsw9CI48n/nEE1djKSyAGIxGnnh0gtAcUqlrqTwPMWwRoLOmIN5r9XAldYRLUFj+KiSmrPlYDuD7KQJROBp+iwPMNrn/puC0WFPULhAWhz5/5Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BX/77w8igStMoOc+Zb5oEeSYBhzeohtIobGZWTMWzas=;
 b=0Q9BSf62EHIYja8UEnzD7QXwrgYLIhoIE1iOteXhbA8ViFzQTON9wnKHbVgU4HEroSPl22J8Lyhvzkm6df6R/8YmQHYXp+jOpsWc/4VuASRsppXV64C0s4TtRxyz22Z9Y720kG2ZRn8n6oxX7QqGaelpt12C3MIAc/LfhGO5y0E=
From: Henry Wang <Henry.Wang@arm.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 1/3] CHANGELOG: Update link for RELEASE-4.16.0
Thread-Topic: [PATCH 1/3] CHANGELOG: Update link for RELEASE-4.16.0
Thread-Index: AQHY9b/5dZvLlHGq0UahfbAIkO+VQ645t9qAgAABBcA=
Date: Fri, 11 Nov 2022 13:37:52 +0000
Message-ID:
 <AS8PR08MB79911B4EF848ABFA7031E75192009@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221111112208.451449-1-Henry.Wang@arm.com>
 <20221111112208.451449-2-Henry.Wang@arm.com>
 <AC58DA7A-529A-461D-9DA5-A91D2388280F@citrix.com>
In-Reply-To: <AC58DA7A-529A-461D-9DA5-A91D2388280F@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 31C3E5C4497F3247B373F70358FE488B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB7324:EE_|VI1EUR03FT013:EE_|DBAPR08MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fe688b-5be0-4a6b-9ac4-08dac3e9f3a0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ele557Pty7hyZL39ETSq2gNxLzNF1dgdIw7hCYwllSTO8alwobuG4hDTnZABhJtKDG6sQuja6cM/FcMjAJokKD6ifkTswf5rSYySuqAPk0MKFAUhhWD9CL6xRf8ErtgAq5sPfNteO2IJifPlQAQwXa/yEY5wY9c+SfdrqbwTN3H321E9W5pmQq9GK7JAxAFGztL0tN46tqX4esEmOZqDIxO+GVb0ujLjwku/Mn3eRGZwCCn0+26i+DE0lCnPOu2XqbtR53y3534tqVfCAXiecLVZ4iFxeairQQ6FZ5Bwrk4x8iDhMy2RQI6g5RLJeWLVF8mYo4q2S4ZjRI0fd8cH7EBs/7xU6xKrpyYFfCV/xiHa3GAmAp/kvE6DV//+7tXWT5/er70ekne+hdwkBLRmCihtpL27fs1wzvXbTmL4A/fVT/T2RGMAIhPXb+ZmH5oYQ6TAyPDgdh7KOdouPHjjnD7EK+TxEakyTIf7z0x5ggVmi1w8B8j/vbALmRjduqEFnr7Gupyb13jayLHlVmgYWuOKg368kZ5AgHZO31rQwPNPMiHdoG2E3DdQfvSiVD1MFuOOBIhYT4JfKEHTaKccaqCGEWAOopf+5BZRpg5V/wTbf/9YtnHP4T4sYc4COpcfd6GYARr0+wbhskJU3dk+shoFyUV/cblO2Qs+bA11dVLRq47UM+yesH/uUV9chgHBGztTWc+DboavK8wuM3DbZGSMTfAkmMnuBbVO+2LqnSZcmzGipEq91YArbjlTaWNRIZjXg2L0ziNghGs6+LUeCBwR1mhryZ9Qghmd5d+5S7h+BRkcjd6zbP/tqLG5Z6c8J8b7gc1nsa1oXG5r85CjBuZNbvJvbD4E5bANM4m8a5c=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(83380400001)(186003)(38070700005)(33656002)(55016003)(86362001)(122000001)(38100700002)(8936002)(52536014)(5660300002)(316002)(66556008)(76116006)(66476007)(6916009)(64756008)(8676002)(4326008)(41300700001)(66446008)(7696005)(6506007)(66946007)(53546011)(26005)(9686003)(4744005)(71200400001)(15650500001)(478600001)(2906002)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7324
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fdb449cc-e7c2-4bc8-5008-08dac3e9eecf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lw9CYVUFOCgjwm81C3ULalMu5Tbg7ft8t+gC5mFfveIlA06VPhzQTAkhqEAFzPQjvvFwyx5VzaHKdrEw75z3UPjLmy/PpebmTQPXFL2N+0Lzuj7N/nCHN0CQ2iMSzKTyd6x+I/dX6tC9XzP4R6sqFxXh3x4jPu88jBqMHRhB1k9XLA4a6UODeZw+Hh8LBq+x29kG14aZKoZr2QDLvEhtbh1K+uNE2LdKSeIMQR2DmVwGY8Cd1EwTwep5yU2kiI5J5mI/fE+EbYE6/MxfITgfa5T5WxV15Li6rJn5ytGVDoMOAmbc5QHXUR46KrfOCjlAdeuErnJw8+qzs3LgEi1Cid8sspzNj/JoWZgoTDjVJIiSlPXXJwrowmwTXkgoHT9ySQWNEXyc/swqNNlZQpipVLeasxgxtO0K65GcX/vUvmfyl4tPIU4cG6OskgviRFv6xDfk30QOLQKIqqoajhhSQv7PSJXoqz0x+7troQ6NfP7PTlpNSFcJ35G38gCsettdc7TR7MZVXTUYdi2DRxc/cjwK5dMJaTpkutrJKC6LCICP3eW/Rsp3B4BXldpomyrVkEzCqGchpqH86T3UVDy0CrE4aSn0s99Jg5netXmt5E7EKpm+s4BNNIAKv3jAA/St1DBnMnGTctv5Gl4ooKK8rMmlpbS6wkovnhSBkeTN5/LyZ23WxrkSC+MIYBrPY95L4xa8SmZNWTOnJndXsKRrzWTxJO9qltlbv0e+oGYyNiglKMqND9THib9SDie7SSTPeiLYJmWP8m1fIenChA4Ob6EwMl/Uk2Y8Nvp/esNRrRQU0+Ue8y7AEurY+qPJkAoBVjOzRThZe/CnqDeWLRvoqhxTOB9nB1nZfo6umiKjFO0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(82740400003)(336012)(83380400001)(47076005)(81166007)(356005)(9686003)(52536014)(26005)(186003)(6862004)(36860700001)(2906002)(8936002)(5660300002)(15650500001)(4744005)(40480700001)(55016003)(40460700003)(82310400005)(4326008)(478600001)(7696005)(6506007)(53546011)(41300700001)(70206006)(316002)(8676002)(70586007)(33656002)(86362001)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 13:38:00.7594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fe688b-5be0-4a6b-9ac4-08dac3e9f3a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5607

SGkgQ2hyaXN0aWFuLA0KDQoodHJpbSB0aGUgQ0MgbGlzdCB0byBhdm9pZCBzcGFtbWluZykNCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHJpc3RpYW4gTGluZGlnIDxj
aHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+DQo+ID4gT24gMTEgTm92IDIwMjIsIGF0IDExOjIy
LCBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KPiA+IC0tLQ0KPiA+IENI
QU5HRUxPRy5tZCB8IDIgKy0NCj4gPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCj4gDQo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4u
bGluZGlnQGNpdHJpeC5jb20+DQo+IA0KPiBIaSBIZW5yeSwNCj4gDQo+IFRoZSBjaGFuZ2VzIGRv
buKAmXQgc2VlbSB0byBiZSBzcGVjaWZpYyB0byB0aGUgT0NhbWwgdG9vbHMvIHBhcnQgdGhhdCBJ
IGNhcmUNCj4gYWJvdXQgYW5kIHNvIG5vdCBzdXJlIGlmIHlvdSB3ZXJlIGxvb2tpbmcgZm9yIGFu
IGFuIEFjayBidXQgaGFwcHkgdG8gcHJvdmlkZQ0KPiBmb3IgdGhpcyBhbmQgeW91ciAyIG90aGVy
IENIQU5HRUxPRyBwYXRjaGVzLg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoISBJIHdpbGwga2VlcCB5
b3VyIGFjayBmb3IgdGhpcyBwYXRjaC4NCg0KRm9yIHRoZSBvdGhlciB0d28sIEkgbWlnaHQgYmUg
d3JvbmcgYnV0IEkgdGhpbmsgeW91IG9ubHkgbmVlZCB0byByYWlzZSB5b3VyDQpjb25jZXJucyBh
bmQgb2JqZWN0aW9ucyBhYm91dCB0aGUgcGF0Y2hlcyBpZiB5b3UgaGF2ZSBhbnkuIFRoYW5rcyA6
KQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeSANCg0KDQo+IA0KPiDigJQgQw0K

