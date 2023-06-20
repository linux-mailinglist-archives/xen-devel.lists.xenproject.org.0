Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3067361F8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 05:07:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551380.860903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRi0-0005TD-C8; Tue, 20 Jun 2023 03:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551380.860903; Tue, 20 Jun 2023 03:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRi0-0005Q9-8J; Tue, 20 Jun 2023 03:07:08 +0000
Received: by outflank-mailman (input) for mailman id 551380;
 Tue, 20 Jun 2023 03:07:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+cFY=CI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qBRhz-0005Pe-5n
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 03:07:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 892583a3-0f17-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 05:07:06 +0200 (CEST)
Received: from AS9P251CA0022.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::27)
 by GVXPR08MB7678.eurprd08.prod.outlook.com (2603:10a6:150:3e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 03:07:02 +0000
Received: from AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::48) by AS9P251CA0022.outlook.office365.com
 (2603:10a6:20b:50f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.44 via Frontend
 Transport; Tue, 20 Jun 2023 03:07:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT047.mail.protection.outlook.com (100.127.140.69) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 03:07:01 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Tue, 20 Jun 2023 03:07:01 +0000
Received: from fc67a31df66b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CBDD90BD-F150-4503-9CA1-C3B80517302A.1; 
 Tue, 20 Jun 2023 03:06:55 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc67a31df66b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Jun 2023 03:06:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB9142.eurprd08.prod.outlook.com (2603:10a6:10:3fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:06:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%6]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 03:06:53 +0000
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
X-Inumbo-ID: 892583a3-0f17-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQvsWGMcUsWsCUgqcEUW5ONcfXrYVIDEyG9/G794PDE=;
 b=uTm76aQqHiFuhYIoDgec939rNPv4+ck4wf+nRCg/rUq+KszhVzTEZT95USLTRoNP7L4mTya+D9hK7RRr3i0iEuBkRiD9Qh60QtLRxnY7iXIpdG+ZCq4wSrxZMEyPdyJ/wBcXGEhg+L2e6A6Y8AXYdJvGhlLvGaSCnANIneHbPcg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiusLp9pzDaYeCN/+bdaZAF3hNRrh5+JhDzPwbVwqGqvc8h3Z/B3JjBUXAtVnWxyocz5xHEGVN7PGXmunkakD50c/J695CTrP15T3Da+IqjEdHYqprv7w5Zc7EiO8X5JwV8vtcBe+xuDoveayT4/aVmWJK4l5zs9eVG6P4yoOmujmTpEYB19UBcGGALj0SNHEUMWNpGoPhVXdfFlimcoWFlK8aGZMfhsnTdBs1uDZPhe8Pwbcbr8DfRKyhpqwpgt6Ean4Yk/sURJTiuLIjKUioxkm8i6RnKMv6adc5QJrEM6aoh8fWvBOAYXvmED8hfaKPCa60V11Lnk79cA7wdQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQvsWGMcUsWsCUgqcEUW5ONcfXrYVIDEyG9/G794PDE=;
 b=lEqOh+AopRONdVxH1mofTtqTXG6eP3XHmig9V1Fq9UeoHc8nevQaScmjicdVrNlMYBu1QztkTzc0ZgcNIIItisdnBILwVbEgfEoLJJFhFDXahDpYsTyzC6Ce0JxhL9MpuvUyUngz45zvx2iilEOZ4bYbEXGkqQp/u2edy9Qyiit2wPRMNLsAlGCU6V/pdio7gSjy7QYUfrVPL8adqJbLaH3k9ryPOXkoMpeq/gwPz08jr75zWUZNnywWjmBwsSZAkvQ+Mz95VioIaKKxoaYMLQ/5CzBSCKugkhlRb0zTC6JCmAS+V1VuBdlDUb2qk2Ar3DDrqzd08ajGC2Bc7En2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQvsWGMcUsWsCUgqcEUW5ONcfXrYVIDEyG9/G794PDE=;
 b=uTm76aQqHiFuhYIoDgec939rNPv4+ck4wf+nRCg/rUq+KszhVzTEZT95USLTRoNP7L4mTya+D9hK7RRr3i0iEuBkRiD9Qh60QtLRxnY7iXIpdG+ZCq4wSrxZMEyPdyJ/wBcXGEhg+L2e6A6Y8AXYdJvGhlLvGaSCnANIneHbPcg=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 3/7] xen/arm64: head: Add missing isb in setup_fixmap()
Thread-Topic: [PATCH 3/7] xen/arm64: head: Add missing isb in setup_fixmap()
Thread-Index: AQHZos+3tMp+ZtyHWUyoGXqmHpGIuK+S1Uuw
Date: Tue, 20 Jun 2023 03:06:53 +0000
Message-ID:
 <AS8PR08MB799150DFE4F403E6DC555A0D925CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-4-julien@xen.org>
In-Reply-To: <20230619170115.81398-4-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0E4BA96B72E93242B57FC18875A3CDDC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB9142:EE_|AM7EUR03FT047:EE_|GVXPR08MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: e341fda6-08d0-480a-9ee0-08db713b6b47
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RVOjZz6uAtXIYOjCCH2Bkvd27B7EnQJk8FTn2QwDZ1hc5VLlv5V0mia9qAT2574eQ8kdmCX0FG6vFirO9ROD7Nd3VjHJXChbfAEbP13x71DQ/CKS5VzBUcmYl0sGryF/KtkAQ9Yfk/MAc8YWgjuSjJOJcA2gCq4lUSUz3HnEpAOPnqrVSZQSm6pgRmM0UrsPp4UsGnopaAahIaTxIwb682IY5MDM3VS0t/AyYqDuzNRC7+6+bQfPQQ23kv3me3X6p3LgAaa5YxfBLx6airh+RD5l0PUJT7ryHTKDap6ePFTdTGodu7zZyEZpRbHdQA5j+fJjQKXqqW5nyDwSydiCXsS//oohQQsPObqoIVPcofYIBLA3lPuyrIjEeqL7fiyd7I+34auvb7B4LEAIcSpxELJNa7+5ENnLjQyFQI5XBVJ4dH/U1F44cLg7efxfHpb06l/5QZqaXKzq6eHaP0UmrYkRas+jRPC4iyjhSe+XcchsUrkRG1AzxjaJT+r4nl2Bmi9Cgg5X4P13yLOAY7r9uNO9DeCTitByihsMBvX6jywIglkOya9zjtkN1Ael/0W7ddiclBGNvlOgRt1nzZzAP3YXSUPQKhTNp9SWjosqaWB+e8td9tSdLbV2r7GcR3W5
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(71200400001)(7696005)(478600001)(33656002)(83380400001)(186003)(9686003)(6506007)(26005)(38100700002)(38070700005)(86362001)(122000001)(55016003)(8936002)(52536014)(8676002)(5660300002)(316002)(4326008)(2906002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(54906003)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9142
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a6864ed-835c-4d38-948f-08db713b665f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mPpo6eTVzZm7J9Chz9lZoajHLxpuHZXsFa8QnjLHoHFsPvFEdW9b8e+1J5OWmMcnico7HqG3TTPhPXXiyGVELh3X/AMonTfDm5Yc7l38iE0nBummg9H3O8SUOfJ7RJXg/M/8qITPb960LgB+WeGmAI+q9330XiGfGiDYqDWeWwnfGJePzMDKUNGmKKa3hNnUgQEJklNGhuvBB7VWgpLn4lf9sPmj0YTJIkI9Q2ABmLT7IlQsXyJWvX2dAccBubswCAYAqrpk8aob8WItWtKtTAKVXbr0P3vDYbGM30tKxWV5J9qWBlnBcrth+iKZWB0rHHATkzoJkqc/fi+Hy6yk1A3Vg0g7anZ0t1YfwLcB3QmVLjvBC0ijyAvM8eNK15bVyqF524j4myj6NC45KgMnAnq1nlNjOJwbqZTdDSQ6ea6rhYIg5La9KEIehM7Ksr2CzWuYuokpZRPhNPbnDIA5jqPJNXbAVZtNOV0N1l6FtH2jn4Q0mYZ18Ey7wlUMZ4Kk21bpHvAJL/7guBZ9eYbx4wq2Wov3DCzyegtPqCISO1EUX2ZlaiX9PwGZsKs8CXcydCVC10g4dlDd/t2gibg8oa3XGuCaz84GhKy6OL3LJCw5c9O+yR3IBPF2IQ2VDhV0dDJkveZwmdN37OCw+0myS6/M0BwLsWSFO5JcgBfw9Yj3fh9gR800WbhPueTesYnk6MKAmYZH32NXRJcG5biuXpagT0lCq7cVJs1mOtNoXIl2cDq26uvaRJGmuBXHQhRN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(81166007)(356005)(336012)(107886003)(52536014)(86362001)(83380400001)(2906002)(47076005)(36860700001)(5660300002)(82740400003)(4326008)(40460700003)(54906003)(110136005)(82310400005)(70586007)(186003)(70206006)(8676002)(8936002)(478600001)(41300700001)(40480700001)(55016003)(6506007)(9686003)(26005)(7696005)(316002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 03:07:01.9297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e341fda6-08d0-480a-9ee0-08db713b6b47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7678

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 3/7] xen/arm64: head: Add missing isb in setup_fixmap()
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> On older version of the Arm Arm (ARM DDI 0487E.a, B2-125) there were
> the following paragraph:
>=20
> "DMB and DSB instructions affect reads and writes to the memory system
> generated by Load/Store instructions and data or unified cache
> maintenance instructions being executed by the PE. Instruction fetches
> or accesses caused by a hardware translation table access are not
> explicit accesses."
>=20
> Newer revision (e.g. ARM DDI 0487J.a) doesn't have the second sentence
> (it might be somewhere else in the Arm Arm). But the interpretation is
> not much different.
>=20
> In setup_fixmap(), we write the fixmap area and may be used soon after,
> for instance, to write to the UART. IOW, there could be hardware
> translation table access. So we need to ensure the 'dsb' has completed
> before continuing. Therefore add an 'isb'.
>=20
> Fixes: 2b11c3646105 ("xen/arm64: head: Remove 1:1 mapping as soon as it i=
s
> not used")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I've also tested this patch on top of today's staging by our internal CI, w=
hich
includes some arm64 emulated platforms and also real hardware, and this pat=
ch
looks good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

