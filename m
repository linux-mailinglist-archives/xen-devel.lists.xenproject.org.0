Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5995CA45828
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 09:29:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896230.1304911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnCmk-0006dH-7o; Wed, 26 Feb 2025 08:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896230.1304911; Wed, 26 Feb 2025 08:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnCmk-0006ax-4p; Wed, 26 Feb 2025 08:28:54 +0000
Received: by outflank-mailman (input) for mailman id 896230;
 Wed, 26 Feb 2025 08:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Soix=VR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tnCmi-0006ar-2v
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 08:28:52 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b12c2868-f41b-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 09:28:44 +0100 (CET)
Received: from AM0PR10CA0085.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::38)
 by GV1PR08MB10572.eurprd08.prod.outlook.com (2603:10a6:150:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 08:28:39 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:208:15:cafe::a1) by AM0PR10CA0085.outlook.office365.com
 (2603:10a6:208:15::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Wed,
 26 Feb 2025 08:28:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Wed, 26 Feb 2025 08:28:38 +0000
Received: ("Tessian outbound 7c48d84d1965:v585");
 Wed, 26 Feb 2025 08:28:37 +0000
Received: from Lf1397090de06.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 727EC8C1-3D93-44F7-97E5-FBDD266832E7.1; 
 Wed, 26 Feb 2025 08:28:31 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf1397090de06.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Feb 2025 08:28:31 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AM9PR08MB6306.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 08:28:28 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 08:28:28 +0000
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
X-Inumbo-ID: b12c2868-f41b-11ef-9897-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wGJ7cUQ6iJT1ISRadshf5FaHn0ettYCa79BYXyZH1eo++OwiH6SC+5QOG7YVnJkgjlJOm3gAoo30+dn/xGgK6YhZIizJEcZjFU/+OxrAvQINu19yAW4kL10XketEKPYrlzVXgt0HaXmiTOZFyz6VBkAAspOR5CWj/V/wEp8I7ASFjEQ5XhmzoUgsa4uB0a301nSiU4wRIf+0738s+QHOBnHrX47PnzEq1SzV5F1quzv9L4KEv0xntcEEK8G1mvtvW//VPzWzBS7MkuBHIbH1Uo8wzvUlGIeWbZX320RPfoUo1HRguFZLT9FvDSIw+bR0hT/J2XRq8uxdqTV92jneKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cI1jQcXQEWw3HI8bLTeUrdaRIv7acW/sJ07l6SfpZUM=;
 b=nIXB6hbtQjehoj4GzNjmo5iSSOWdG2BIUug/qW4AKRs5a7nX+VoWvkqA5JIsa0gpzu/9CDaqfAtGAVtfsoErqUIPW/g5jBiZXQxC1lW+IdsEW9VXvDeQEq3lj1Vk9egJmuzCGioqvUwcYE+gfRUmCwayc4+uOcKJtwx2nYxcMOBXtRzh9VjYYMBE6dUFU1s9hh0bfyP2pRgAWQmstGEHsK7FfylhmimR796G8DkTIDBlIvTVh5GnhMOWJo+9Qnz37iPtcLhIvLvD+jp85hV+9or+bru5dKtJT82VpeF0YkQMPlX5oUoRIKUtj2ROxoHj30KoP64xU7OnfaiCFnAzdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cI1jQcXQEWw3HI8bLTeUrdaRIv7acW/sJ07l6SfpZUM=;
 b=K5UOH/33gbX5CpGQ/8HeFeAQ6lYh37JlMTmFlvDC4vz1HYoWa48zjVsedySCcrATX8opCS/usLJ8Ei7LOYOJw+lDb/dth2bIlK+C4/u+wKwgRzv6dr+Vw9XVVsqkzy0xK5b9A4HePBHJvTKPr8cKK/U17y/PV50kVM2G2XH5c94=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 653718c1b118cea3
X-TessianGatewayMetadata: wWGazM2UbK5nqJxksBbd9ANyXHAhHv1AUQ4OR9ccjXYUmopAlutuG5Gsg8b1q0HnM5yF72X6kVMDzxqJ9PdwdO0gLcgNICKN1yVnV3Q7zf7FIrG6FWm+x8N2kQ09x1vee5md2y4o+68Q4zjSERwgiF4cg1cSF5NlPWhVqkD2ns8=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPDiHYu66Uhp5uS6z+yDyioyeyy4hzC6bhtWhHXSfN4z8j9jRccVeGynwmU3AmfJXkUCyproF5xxurWp5W9QZKqphmJkfI/9JsgcsKiWjEiSiPJ5b0SuhfhaLQrFkuwWUtp8GDod02CPJ16EGqbQ0RkTEFyK56D5j3O7HZjyBVFDUQV446dX1B7K/rcweCoVNVGI+nPtaMHToJpRROkD/1TfF4AHd04M7zZH+EqXophBOjQZ0fY+Krym5pQLG0v2dvyLY9JvpCtg5r4VyEwnAFzgeKW86OYcDMEFSNSctIzFaXjcKqPkls1GW/PGZrhnYSyGNvgzxC8xh0ZrblOClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cI1jQcXQEWw3HI8bLTeUrdaRIv7acW/sJ07l6SfpZUM=;
 b=eecyJmo2UplC6HLl4d4K0s3usVjwRK/QCndVqd1kMg2KP5VN/aISgb4vjFIOWXtY5UHa8bcxHbgVf//FOgVC0sDINfzjmZo7be40KC47rkpNw+Z5HcXb03/d5tTGX0st3BWhzZ/VeEAt0KbcAAFnJpaFoS7vCyKIhzMI5Gg31rJ4jD7XYDdVDtDcaTe9cmf26kUXkuKfQfG+r0F69onkBP2t1J4WeyJxg4SqVXj5Apq1NkpVI89rXeRGVJ6lk0vo7r++Fdk7vdqRZSb8fnouiTDQMHcXdFrOy7Xo/h27jNAoxt5lxfHjgayBu7TzxtAoEYo3yyRnvxxmlP+xKaHZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cI1jQcXQEWw3HI8bLTeUrdaRIv7acW/sJ07l6SfpZUM=;
 b=K5UOH/33gbX5CpGQ/8HeFeAQ6lYh37JlMTmFlvDC4vz1HYoWa48zjVsedySCcrATX8opCS/usLJ8Ei7LOYOJw+lDb/dth2bIlK+C4/u+wKwgRzv6dr+Vw9XVVsqkzy0xK5b9A4HePBHJvTKPr8cKK/U17y/PV50kVM2G2XH5c94=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/5] xen/arm: mpu: Move some of the definitions to common
 file
Thread-Topic: [PATCH 3/5] xen/arm: mpu: Move some of the definitions to common
 file
Thread-Index: AQHbdzpt64DSSlVqrUGsnEaCrB85rbM6YXOAgB5TtQCAAK0QgA==
Date: Wed, 26 Feb 2025 08:28:28 +0000
Message-ID: <CFF70353-90F6-4ED4-AEE7-155C4480AF98@arm.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
 <20250204192357.1862264-4-ayan.kumar.halder@amd.com>
 <18E074A3-A76B-4C9E-A8B4-8E23B07CB7B7@arm.com>
 <a593bbed-24de-464e-9fea-db988cc61f7b@xen.org>
In-Reply-To: <a593bbed-24de-464e-9fea-db988cc61f7b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AM9PR08MB6306:EE_|AMS0EPF000001AF:EE_|GV1PR08MB10572:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e86d0f8-6fe6-4ee7-5288-08dd563f918d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Gu3CdT/oXKYiuDpJcQHOPynJPQUyceKh9UeRS/wu2bzK70EDxYCVfGZa23xz?=
 =?us-ascii?Q?4JT676fOJ80FBcd8T8p4x5DEe3geyZVt/oq4BHkMO0+jbzMwuecgozT4V3Hl?=
 =?us-ascii?Q?IGedITDyE8w9/YPd4FJEHE6jJ/StcxsejF5HrEHNuberaMNIeRO/s/dPHrpp?=
 =?us-ascii?Q?ts1Z5h91a+7HOXcdo9CGVeTyxdQpuhB1x3IeDrjDltL3kUitBNHMkQSBoaG7?=
 =?us-ascii?Q?Zub97t+ULUX6T932FqCj8IPdF+qWKBhg2lskh1LSyomLwc9ZRRJr5n1txM7I?=
 =?us-ascii?Q?Qcd5bmTkvNl//KtOrOXOyQ+/ZABNB805JQJOismAnLfr/yQ+bSo+KChvBFA9?=
 =?us-ascii?Q?d+CtRL8eXvQGiFdAufDD93bUoBP/S04ciJe83DgykQYu6y7TlSS/EMAGIRkq?=
 =?us-ascii?Q?efo6VjnATp9dHUA7n0qyscEPb6blnLpbn93b8w9HweYWDg/W6Za/lIkFm5If?=
 =?us-ascii?Q?+tZl/jGD5LEd2W/84FnzO2efjY8gT/CFjid7DHGd/8d5LGM7u6guydOelyo6?=
 =?us-ascii?Q?3kV0qlVyQnpAZZgZoRHj9vEnbriirC3pK4b69tHUpPQdnPwhq9VFs/EZuRhJ?=
 =?us-ascii?Q?Dg2ckyJ2UWgVSa+x41Vs693thvE4JeSRp8T7GyM1LISsXOsN5ObPX8Vk/MkE?=
 =?us-ascii?Q?Fr1HDTE93jspF6vPlIMnQbueTjdazvW3c6g1vEwOBvXSLBn9agdBexLr6KZd?=
 =?us-ascii?Q?GUW+c3Z+29UHWBxbkaXsWtVJF+yCalMlycAbg1BM56XAaEAdQ7whz/IqnDJO?=
 =?us-ascii?Q?eiowXB4HlXXWEHQioxssn3kUt+21WXRKE3a2PYXXhpnreyPL9JoRcefsGU6n?=
 =?us-ascii?Q?wLOsaeXgYJqcFV3cUPRib33Tm/d/h2o9s1iRitIlqA+OqqagsiGJKPu3ZA02?=
 =?us-ascii?Q?DICX0BvMmVHemYPgMJ76caQWlFv1wAcsjrkq95R57pbS73QIvmcJ9eP5wxtP?=
 =?us-ascii?Q?pCVdwdXosHyLhXeM6KeqOQjRgQZaojEHERMy+E0Hq2iAoCAwLhTUGzLGlFRH?=
 =?us-ascii?Q?Q6Lb4xrN+BbwjSUihAu0sl7AFkA6OCKZjsuY/huurRug4wLSgE/4aI28vTgL?=
 =?us-ascii?Q?AoeUy59nuOTQOJsBQdKDoTfvynpwpTEJXcfmf1/wXcNLtz6zb4Wnuz0Xa1yM?=
 =?us-ascii?Q?SZyVX5H8nSPqR+ltUXas5+xcH4O8is0VlH2ZCmEgWhI4Xm6Z09cJ9+Dfv119?=
 =?us-ascii?Q?jM8eJVC7T3yV1gG1sh35CqzIlXipTExKWkhw4i6P+w2rFIlOULcYTAnKU062?=
 =?us-ascii?Q?N3jiAiN3vsTKAnnlGrzmnPjpfoXL3IZ7fNs//x0vzeU4uRJyPl5sWQwuyX6j?=
 =?us-ascii?Q?iLEhqG7Wr+dU5PL+RaxFpCpc7JtdM4HScA633kQz/Ovc8kBPkDYcJIM0qjhS?=
 =?us-ascii?Q?SmC9aU1PYiUEiHv2kQEn+qtDhcNCGbXKy7Hl16LMBhKhQrAbn/Yz39Y2U+Tt?=
 =?us-ascii?Q?hHekXftnx4JABlImOii2f+SIYLjvOjEE?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4E46FCF86144F64CA777ADE1A6511999@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6306
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	996b6198-08c3-44f1-19bb-08dd563f8bac
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|1800799024|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?18n5UDSwIPlSMWIQsSzh6jUlrcHG6tcvOapMFgEusbl9rh6PLZ51bnN5kIKT?=
 =?us-ascii?Q?CbC5+AhVFILdLBr510vCyt1jotrMjnUEHdgBZfZEqw+32sxnL6SxYbSDKTBC?=
 =?us-ascii?Q?BiNGjsAdp37FmysRlE2RNwYVAjbAWgVN+H3CvPBpKZmJujA5ztorH0uJAUGO?=
 =?us-ascii?Q?NUjKUKUBNaXjxiByey2GDjECPTcl9wV4X4xUQcDCF+IVhrSz12YkSS2bhSZE?=
 =?us-ascii?Q?Az8Ib8bqm7MPIVEfcrRGuKCFJmdlQF8SDr+YGcbyWyjGIc+rRr/zpPsAOvRZ?=
 =?us-ascii?Q?njB+ptxesfeMyaHvt/qS05yD2A8/15nJyRCiwQfDW8Pwfsri0OeAWT4scbNw?=
 =?us-ascii?Q?Ou6tR4AprfU3YnO1tlZYspcqY38JunUy4oy+ltJVi+kkm+dPpe93fGtNvMn9?=
 =?us-ascii?Q?v9Klqvs6wz9h+4LS4fOBVEjU70Qsu98JE9T0CPJdsklLybPYOs0/Y77cNarO?=
 =?us-ascii?Q?BLZ1WwXoeY1+r63QAZW3QQaJoxGcKmBP05C3f1g6Q7cecIxRBNuGen7LNJWc?=
 =?us-ascii?Q?hAxK55i4WGpgBph9kDBqtEu4qfRWv5cgblbGVGpE8B1Rbgqnq/4Q+NzyXBg/?=
 =?us-ascii?Q?Ioq75hZPd9ogxM0pFPcvVEKt2XeKZHsQKJjYB8ziISSz5mYdOjQVpchkMh8r?=
 =?us-ascii?Q?QPiC9LS6TWIQfjAxwMYbIHmICzzNoaXAN7VdIwZy4DdwYAteot9TApHKfw5Y?=
 =?us-ascii?Q?qbF1duuFNK1ouCJ+MHYw5edQuqnfdeTRniwJiBusg8jglFJrU+EkqAfjftvO?=
 =?us-ascii?Q?1zAvIQkVsaqve6HHOGwMv2yyGGCpWsI/KbcsJ+N2AzD96f0ivRMpWLXoWKQS?=
 =?us-ascii?Q?XKFR17M3obB5dudeVRYqYCCv6InEun4u8m0ikRL+E96FqcDHgBuM8z6fUrE6?=
 =?us-ascii?Q?yKNLzayBB8QPJd23IBKXOAiaNfQaNG2np/eBS9zWvNxLjj6rRGFwcnWFT0FZ?=
 =?us-ascii?Q?mCfNs60GGHdyj060Wk3AaBdRpGZynpwECSs0nMvx+Sb3UD4vknKepF7TQAQH?=
 =?us-ascii?Q?RS6Ygq/5JwU+oTuO4+D/8Gg5pVxdMqqA9y9D0q3+sXNKWLMEQfr5CiZUh4ZA?=
 =?us-ascii?Q?pt7up0sCrGJW11O4Iu9SZvw9wHZFBG5qM4xDQkbl+ORB/3VLgd/T1SHYZyHo?=
 =?us-ascii?Q?EIOrk9C0ug43k0vHlyEbw3wpjeoU1hCwsPv2mdYJmW1Cby722fxt/mMTVUJ6?=
 =?us-ascii?Q?RU1RQyc2vTM6/ESY0MnKXwKcmw22GW6lpQCwAchOzi8Fs6kWHre5yb1XUh9H?=
 =?us-ascii?Q?wz6T7T5TjcZBBMb/i3tUZLM4i3xeGq3rHrDK4lGCbggwqPfp8PPfg4GoOAlt?=
 =?us-ascii?Q?VlGi6FZdQIfnM+KJtgzDu6DEgOsOVQQOvVX89Zo6xltjF8xJbSk1vLpeBKd+?=
 =?us-ascii?Q?NiIpzm+KzPiwPAT7NeAnLerJVfSX2QJBRp+L6HxegHWeypoyoSmdAcyXRnWv?=
 =?us-ascii?Q?n1Z+WIZJqD1eA+Ei15Tk4qpllmpsLxIVRdDYjgngZFS9SbOjMCwDpQoZ4DkB?=
 =?us-ascii?Q?irFw4p8N2sryanI=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(1800799024)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 08:28:38.0739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e86d0f8-6fe6-4ee7-5288-08dd563f918d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10572

Hi Julien,

>>>=20
>>> #ifdef CONFIG_EARLY_PRINTK
>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/includ=
e/asm/mpu.h
>> Why not in include/mpu/ ?
>=20
> Do you mean include/asm/mpu? or something different?

Yes, sorry typo, I mean include/asm/mpu/mpu.h

Cheers,
Luca


