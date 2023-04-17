Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95866E3EB6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 07:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521720.810539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poGxi-0006gx-Ij; Mon, 17 Apr 2023 04:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521720.810539; Mon, 17 Apr 2023 04:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poGxi-0006dY-F9; Mon, 17 Apr 2023 04:59:34 +0000
Received: by outflank-mailman (input) for mailman id 521720;
 Mon, 17 Apr 2023 04:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c4/u=AI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1poGxg-0006Mz-EC
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 04:59:32 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2e14452-dcdc-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 06:59:30 +0200 (CEST)
Received: from DB3PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:8:1::22) by
 GV2PR08MB8052.eurprd08.prod.outlook.com (2603:10a6:150:75::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.35; Mon, 17 Apr 2023 04:59:28 +0000
Received: from DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::2d) by DB3PR06CA0009.outlook.office365.com
 (2603:10a6:8:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.44 via Frontend
 Transport; Mon, 17 Apr 2023 04:59:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT065.mail.protection.outlook.com (100.127.142.147) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.17 via Frontend Transport; Mon, 17 Apr 2023 04:59:27 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Mon, 17 Apr 2023 04:59:27 +0000
Received: from fb4923cd3050.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DEC31E97-3CDF-4CA7-BD35-4F1D0CBF120B.1; 
 Mon, 17 Apr 2023 04:59:18 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb4923cd3050.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Apr 2023 04:59:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB7447.eurprd08.prod.outlook.com (2603:10a6:10:36d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 04:59:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 04:59:15 +0000
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
X-Inumbo-ID: a2e14452-dcdc-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJTq2bjk9yaNV4ZBoXSHfSpASV673BeyC4EA45/r4/k=;
 b=o+8OrWy0A3ycGNMplzaLbher1bjQLTlVgTK2USIsxOMswub6hIe7EBkmO7Ks4SHhyDQlCXel0s4e0gs1RqaiIFAFms6qDVKIE+6nYN7/TXPLnhVTiLVczl/WcGwhqNbUyglYR9tt3Xf0lHLgoFHYPjhjK11W3XtTzpFDZZqa9bg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kz6t3nE/3sgqnKFM1GhNQtbI9jEgsEX1UtOteSJ8cdpofJ74yvHBYbRe029fIDn4aqAzAnYjSJASXe1+JMw6VaTTO9fUABcx6A51LiLfKHF9GxycRjTvr+KSgf0MNAehLgUPjvDTJedrq0v1eGxuxVG4pWIcqDnmnWtpL7E5Lo3AU0CQtSFLJGl4mnWLhxnv9gqUmrnRdqQr+LoUxaQrMuvfs/i2jVBQydy3OPbmUFHQItd8XiVknhYL8KiwtGPGdVkw9xMHv0ija9EGDiqWmbVVk/33iLmPF66YheET0JwQpe4rw2G7fJK3V5JIy/KiekhCHFRN5To4OqbHUr4brw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJTq2bjk9yaNV4ZBoXSHfSpASV673BeyC4EA45/r4/k=;
 b=EpDXNJ4QykTaInItHOeDG+p3Xxuar3yHBOh2R5NXQGdCQjNrarQLn/1yjHayMc9bBeEpp2tZlETAEXKFjyDXDUJUdn1vbCDRvQlxvURAyVPc6ymZ53W0wk9w9S2h4AJnEOOv23YYO8l68WCnFPJYoDdELm0ZXyp3X9twzZheW8UoVbEigDz7wZlCK96MQQfrHtkrhMc8yfFadUCRsf8U4VM8rrAbpsH+fQvAYNU77DbUAiT9125URsaQ+YEwdsSQjPsKEVf3i6oNBW8E45JWyVaiA7uc5txFqHb37JiXT3WlGBIuwXJlKNmCV+f9eRKQ+uVr9jJ1UHbZeyrxJAOFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJTq2bjk9yaNV4ZBoXSHfSpASV673BeyC4EA45/r4/k=;
 b=o+8OrWy0A3ycGNMplzaLbher1bjQLTlVgTK2USIsxOMswub6hIe7EBkmO7Ks4SHhyDQlCXel0s4e0gs1RqaiIFAFms6qDVKIE+6nYN7/TXPLnhVTiLVczl/WcGwhqNbUyglYR9tt3Xf0lHLgoFHYPjhjK11W3XtTzpFDZZqa9bg=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Luca Fancellu
	<Luca.Fancellu@arm.com>
Subject: RE: [PATCH v7 5/5] xen/arm64: smpboot: Directly switch to the runtime
 page-tables
Thread-Topic: [PATCH v7 5/5] xen/arm64: smpboot: Directly switch to the
 runtime page-tables
Thread-Index: AQHZcHBUxvhM1r7suU+gX9Lg9ukFqq8uz8Yw
Date: Mon, 17 Apr 2023 04:59:15 +0000
Message-ID:
 <AS8PR08MB79912C8D87F209915E3199AF929C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-6-julien@xen.org>
In-Reply-To: <20230416143211.72227-6-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5136D2BED5367D4590AE1AFCA84CF671.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB7447:EE_|DBAEUR03FT065:EE_|GV2PR08MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1bf294-0dcf-4292-e04e-08db3f008597
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Qy3pBkKe6pSnzWyMuRYjvTL+ygb1gz1tfUeE0w14CZfK960z34WZdHadnIcPFRGM1LdaiYtteXhq9dc8Q8/YaVE9iVKXWJ2s/Yn8NzHHQGVsCtPvaUZC7IjBCbUrrYWFiWZvyUNMA0uGjEVH1LL1scXHLh+OenC6SGO/YoU+PYlmD9l5a4gZJlV13OgEcNkwTYbLEQKb++SPvAIK14bkm9kkJ4fC37ZayHD29TDnv+SdSwpTOnhPCxeuX9nOr6LCHhVcyNcpbu6+gvt7vOUBffh77hVIzcO0XY8tKqLwEO/7QgYg3S22grSwmY2RFNWdEZOiXkGKLSfp2Y/0bqDNvxrWeVybrnUnyVBZjGWZLMqSPivqXY+NHdrDGNlC8GMi5LSCh6LAxk+owQ1lElB2b/r4VcYbltu4NTvwFpctfMCkRDyPn3ZkANYFpZAJgS0fD6zaiwHMrMjcNfMG1r0/mfCc9XjMYEr+huYqqD8kNTsWXtFEEcEgnzsQ9/8ogU+6TsWZPnnM/douOzqohXkKDFvmHh0lC7qtkuRyRRR5sHc+yw6rxZbTlSSmfI3xrC9uARYz22Ylis3yYdVC8btcPot3rY/AMhgqsumXS8O53UcI9Sa8HJ9AzIrYR4ec9kUw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(38100700002)(66556008)(4326008)(64756008)(66946007)(66476007)(76116006)(66446008)(5660300002)(41300700001)(52536014)(7696005)(71200400001)(316002)(86362001)(9686003)(54906003)(6506007)(186003)(26005)(38070700005)(83380400001)(8936002)(2906002)(8676002)(4744005)(55016003)(478600001)(33656002)(122000001)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7447
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c855f94-a090-49d2-d4f5-08db3f007e43
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ArAv/Ko4qyJh1GkeOUTNFx0364ciMhGb8Ky2tkkM3pDBJZmr9mljXdP4k7o2jxVS0hbfEeIMZuFLDn56y1mvHAmtyWG73iZIbIst5P3A8VKyy0R5aEoryhVV6mK88gPA8rsCuPAS4Ncki56jWYXHzBaY+7WdnXIxom1VwprokGjfVfGIpiBNXQDLugtDi6J6j/2+0ohYNf44nt/9abcZTpbBdmsanjZA1gbcosD023QKQTYIqbAc6JT6k0OybZaFrhDfT8DfdcMUy0TPGZWiILKmsy3XuML2BlYwJkV9aXt+hhZej9L4fuHVFAeBt3G4b70jAUFmuJYDncQcfFQjkiHGSWMGCKGVrAzFP6x5dL6pJFIS3qHkVR5bRwdtdBFmDdWbYfJQrU3zxyFO3EclQlm49dHs/aIeHg4lHR79jbVBUyDhMzVjsiTawzrv8aOw2bgw3sd7OmD2VZUIRK6n4oLG14Cm+JugiNRtwt1/15dDWjfshiFLfx2KyQX2eEnl8UAmHGUb1C9rcmaHXAP6xnszcT1rbBNdVbhLn6fXxcaGqTD44OlXkWKYGkS1A0CMkpIym5ef37ifQ/5xjBhobeoQdLKaij+kFfXtZHZBfa+Gi6m5glZ8QFl/fvfZS/Lw05T9I0g5EOPxxosK+hLfIfnx83FYKzsmdMR49Rypzz6XMd0SgYVh7aSjf7L2ZsUTodwxOSuqhstboMrKOiK8Xw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199021)(40470700004)(46966006)(36840700001)(110136005)(47076005)(70586007)(83380400001)(478600001)(7696005)(8676002)(70206006)(356005)(4326008)(316002)(82740400003)(40460700003)(41300700001)(81166007)(336012)(86362001)(54906003)(33656002)(6506007)(82310400005)(26005)(9686003)(52536014)(8936002)(40480700001)(5660300002)(4744005)(55016003)(186003)(36860700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 04:59:27.6930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1bf294-0dcf-4292-e04e-08db3f008597
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8052

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v7 5/5] xen/arm64: smpboot: Directly switch to the runtim=
e
> page-tables
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Switching TTBR while the MMU is on is not safe. Now that the identity
> mapping will not clash with the rest of the memory layout, we can avoid
> creating temporary page-tables every time a CPU is brought up.
>=20
> The arm32 code will use a different approach. So this issue is for now
> only resolved on arm64.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I used the test method described in my notes from patch#2, and this
patch passed the test, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

