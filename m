Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6995D9F5F4A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 08:28:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860000.1272082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNoTS-0007JB-Nx; Wed, 18 Dec 2024 07:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860000.1272082; Wed, 18 Dec 2024 07:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNoTS-0007GT-Kv; Wed, 18 Dec 2024 07:28:02 +0000
Received: by outflank-mailman (input) for mailman id 860000;
 Wed, 18 Dec 2024 07:28:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=auIu=TL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tNoTQ-0007GN-8f
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 07:28:00 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20612.outbound.protection.outlook.com
 [2a01:111:f403:260c::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aaa46f1-bd11-11ef-a0d6-8be0dac302b0;
 Wed, 18 Dec 2024 08:27:59 +0100 (CET)
Received: from DU2PR04CA0258.eurprd04.prod.outlook.com (2603:10a6:10:28e::23)
 by DU5PR08MB10577.eurprd08.prod.outlook.com (2603:10a6:10:51a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 07:27:51 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::fc) by DU2PR04CA0258.outlook.office365.com
 (2603:10a6:10:28e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 07:27:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 18 Dec 2024 07:27:50 +0000
Received: ("Tessian outbound 050b604d5e06:v528");
 Wed, 18 Dec 2024 07:27:50 +0000
Received: from L976997580e71.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 951AE95F-73DD-4202-8A37-788415438DB0.1; 
 Wed, 18 Dec 2024 07:27:43 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L976997580e71.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Dec 2024 07:27:43 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VI1PR08MB5438.eurprd08.prod.outlook.com (2603:10a6:803:12e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 07:27:39 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 07:27:38 +0000
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
X-Inumbo-ID: 9aaa46f1-bd11-11ef-a0d6-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LtWK3AAfTasLdYRgRZHavBU09ihSpEKN7Lf1gdOwfaZuDNPkKztB8+u/R7MCy3CGfQQx/apf6Zci6tv+RbYtPhf4UIORmkhdy0yONHqOFy2mjpFY5RaZxJB5Lig97uiyTqLPmuQ12d0qR1yguyfIKlIF3KjAxcty4DprGsg7abRu92roAXAKingsNecd5gt01vNgTrTuXox1iNObVrVGjugc8i/63f5wOx5t5FJ3uGKgDxEZ/FDv9FiHDCP2uqF5un75Kyn55B2ADPWg1Rhc62oxfvdFXV69nsm1biqWjsggCe0u+tOavSUADiIYDzHVc8BmysJVsjjIKC0hlw5Crg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ufWEjyvu8OJlYsuD40Ast3EWfXDmYIA0HMjgIc+JJ8=;
 b=N9sQkYvekAKhTMFWYXtv1zPbt8mzQxXqsjUkUaLWwFVwH6mx7CbJ5K72gywLddxg8oCqYsjlIqtFgYFKhgLZPpBGHV7u7K8Vg6/3k7Yu9QkrSh/ggSgXEV8WYIsJKZ6SPt+vDX1yF3l/Ic60uKPtvSQWtXgA3b4JCFSuzSs1G2K+awbcdPJ5jUFW0DjUO/5ubjeEJDwYVUbQEzowJYKFXkw7aPtpO05j67uz+gaGFVgoVnRtIqZ1189gMykoWcorsm2Bo1VFCyEPttxwJj4020l4EqvLerJ8oMI2VGdQ7YzFS0Yg8CW9Z0ognNsw5T3ixBWq7tkAN6CPHW9AbV0NBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ufWEjyvu8OJlYsuD40Ast3EWfXDmYIA0HMjgIc+JJ8=;
 b=p1FgkWW+6SdoUyC+DE/9KVadnbUZbeyo/413+A+90wJ3r8STBX0CrnU48PFMTqkJ8QNcbXFyTic+vp/O5vpOkxhIX6lQ1jxOD2OIQwQTiA6ecM8WtnNg4Cwrw0/7RtFnb4b4O26UGsHXWaUGkFapbUwy3pYwUQajf39L1IYjRsk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13d57d9ca674e19d
X-TessianGatewayMetadata: /tY+TLbrR9fdetigmNj3gsE3Deeydl/sbTvWX2mMCGORaJoVvkPKi5uys7HQLkQXNi3xkQm8SthJYKLXZyNuRclxNTtXtzjbNiyvJptim0dhF7dy1YEK1ljeWi/DYsxSJo5PGRjEvjI00mvSfydMvbP4gUKv5KHgPDMOX2wEr5k=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUNCVuBgv19P0yw1dhcrBkmZ1LiX4NaHZjGjc5hurIdh50N/9NoqSGUiiKc6qlERxMYHHM0nw0qOlb7++MI/xltpA/ooVUp4K4vwC96Fy3xZGwFaBvD8t5kCoP87e3Coprp0KRqvx4yOkGs1Y3AoKpRzhGQUeMw6pkCnz5sSU+aDzk8sElYKgDerdFKAryo5GeRE0VmaZ2lPaThQSdqqGxv7/n9ubX7VCJGHrPf/GT8R61HzaEc4r9pzdNovMnLMcxa3PXOPTAjpS1sT8HhibVnD2F4QUC+9pAQIfa8d+cuqtQJAU5dixC1GIVW1+4VnDBGvuAS10FX7QTpu1I8QQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ufWEjyvu8OJlYsuD40Ast3EWfXDmYIA0HMjgIc+JJ8=;
 b=LphmgGuftWYkLhnnakKm8RfzF8G4OllfU6gdjBLE5IxXg04tL62DLkEiMSlrE3JzNif3hvCxLJoZTWBGBD2CM/bCokiZKDBe3DoaMlUe1yLmd1i3PxFsZwA7pQr3lFyWnwoNLK5LY6siqw64gSV7gNOrE7rp6d2a7ukwXwqdtB9wCaoPkBUh0BbWu9e5Cu2EYxQpbtR0zazyKoV9Sx6Wn+Uw7si8fsxcASG33OINAi4kHJr7B+GkUB9Hlbp+QLrnlFSw1rrd7uAmX2052uTZV0MuwAhTknAJ7E3gldZm9XOTI9SQKGEIroX9G12H00chhJSw8+G5GDcOAVsu+yiSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ufWEjyvu8OJlYsuD40Ast3EWfXDmYIA0HMjgIc+JJ8=;
 b=p1FgkWW+6SdoUyC+DE/9KVadnbUZbeyo/413+A+90wJ3r8STBX0CrnU48PFMTqkJ8QNcbXFyTic+vp/O5vpOkxhIX6lQ1jxOD2OIQwQTiA6ecM8WtnNg4Cwrw0/7RtFnb4b4O26UGsHXWaUGkFapbUwy3pYwUQajf39L1IYjRsk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 04/10] xen/arm: ffa: Fine granular call support
Thread-Topic: [PATCH v3 04/10] xen/arm: ffa: Fine granular call support
Thread-Index: AQHbQOahZBVDYXOcj0uVqGja5nIgjbLk4umAgAO+LICAAMjkAIACUM4A
Date: Wed, 18 Dec 2024 07:27:38 +0000
Message-ID: <5C9B583A-A48D-46E0-86BB-4081BBCFDF9A@arm.com>
References: <cover.1732702210.git.bertrand.marquis@arm.com>
 <1b02c9c1df9ff2230e076f25398a5de876f98a51.1732702210.git.bertrand.marquis@arm.com>
 <8d8ef7f9-d73f-4ff8-8af9-4e73cda97624@xen.org>
 <03D53BB9-1751-42DF-9AAD-41B25E915027@arm.com>
 <38870638-6d87-4a0d-843d-37cc55bb54a9@xen.org>
In-Reply-To: <38870638-6d87-4a0d-843d-37cc55bb54a9@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VI1PR08MB5438:EE_|DB1PEPF000509F0:EE_|DU5PR08MB10577:EE_
X-MS-Office365-Filtering-Correlation-Id: c171fa21-5915-4ebb-57d9-08dd1f357a86
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?SHcHjaIX1e2ebCwo5/igywRLL4Nt/eGPDuY90IzMjHTWYYwkaGtgu6xS0dI0?=
 =?us-ascii?Q?+C6jJI+D0zasL1NRGC2zLGsPQDsC30mLNAYNk7ZADIW490l3/ZENeavSyLQ3?=
 =?us-ascii?Q?SkrZNWWYCWSrZP6L4xP0i5r5AdYuNFbePwC5xIrNSeuIbcWWD83Lk5aOsUjU?=
 =?us-ascii?Q?/7eoaZlOSowVJhVbqExmiE5x6WpHgHU5lFPx8H69khg2i6D2O9ZISmVt8zRh?=
 =?us-ascii?Q?coGztKPd2EmkqFuoaQ+uqfcilYoCAO7PAnEOP0xaAufVfaScYizj/AusjD/Y?=
 =?us-ascii?Q?Ogu4PjwtJ+bG6Ati7uSSqVkWNxi6mI7rTHdCyuYkirHPT7bmAkjp1fvceiqV?=
 =?us-ascii?Q?B9dlm3XcZjVppPKJyK2OPnHmkBr7IKQzksfD7MZe22zd1/vw8JQ91yB4Ljzv?=
 =?us-ascii?Q?KpmNo/j/+TJ3yMZGpfXd6PEKj5Sy7UG2lVTaxjqcNrNBZZ8P4T6RwUagmQGR?=
 =?us-ascii?Q?wORtDWRh5lLrhaNJZRljqDU1mI+ieEgDG5gDQItKzfkxqVlKGXzmd1cZiK7n?=
 =?us-ascii?Q?H6fq+fTVi7BLHtQ660kNiSpYwaxtHKy+8gG7YpDMpxn74kHRWaz3XRDBAjOl?=
 =?us-ascii?Q?4hMnMB0B4XeRD56kN72LC1LMCeauk8uRgiS9BQR7n+MM4V3EtybbH3B9hkQy?=
 =?us-ascii?Q?jPS4Q6ipxy3/qDyrbGgV+7UATGCUussCXP7dFByaH6ivjlAL5CBsXOJrR8IR?=
 =?us-ascii?Q?k+X+5r+XsK7pVtty7BtZ3Y/2KE91pgwtHapPZxXICqjBaq7PNNm/+OwgJfuo?=
 =?us-ascii?Q?ftWYp3o66LjzDZv0GuTYyJgbunGlBKEb2KX0dDgRyyxfDJJFjbFD7NnmRCuE?=
 =?us-ascii?Q?TgbbkznajYpMin5JTdiGMNqWxEAfso1ldltpBLgBc8o1yBGALLRyF/dQkRff?=
 =?us-ascii?Q?eVzLnsEoq/3NJP3RS+i2YmtLEAPinP/WsQH5q3j4PGGmEQHGXT5EFp0nDvFO?=
 =?us-ascii?Q?53aeR8BsziO8aopzEwk6/6eKFdkV6ezD8ZeuH+RdGAIMcgTnxgvh7PmZM28d?=
 =?us-ascii?Q?YHe0BBrtO56XkpNWbpWfHZk8tWKoCq+rftnbIq8vnQBZqKpreMvPI3aCPwxA?=
 =?us-ascii?Q?PWmgIZxACP58WVMKIYx0Yg+PxoCMD013X2OYueyYGQMtfCCQ6RE/9NFO7w8q?=
 =?us-ascii?Q?RH3asv8f0w1E7F9f/z1nHVcm88uYK1C0vj9iBuzHkdO3HcQwxZQA/H2a+fD0?=
 =?us-ascii?Q?vbDHXt2VEUChRmx+s7DQtit7SXFZ8F6aKC2ySgrWDdw4D2LKAflj/uaV9Zw4?=
 =?us-ascii?Q?ZDKsblSAX3PzxEFnw9eUtYXayGHEfrMlEn3hdcFaIutZX739N/aBKQtCKox6?=
 =?us-ascii?Q?XNYnV/ZOLUhfvLu1oOIZg3WmYrsTNe3eGCGoub2VG3CcopzLa1XflP+fxQsR?=
 =?us-ascii?Q?vPr5E/kV4VU7KS7zy2GFzwhzooxdOk9FvCIRdYADvE/EMHT1sC6UXizpdDqH?=
 =?us-ascii?Q?j/oyjG88qUIFPoT/2KcS/T40JbQiUey6?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BC7E438E3A7EB5438BE8DC25D6FCE520@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5438
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1c4a5150-25dd-4954-cd93-08dd1f35738c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|82310400026|35042699022|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GeYfLYphUJ+rEsUZu1IBrpKgOzftE9vMUJUWKIW5z27g8qNJIB+UQjk6uCYQ?=
 =?us-ascii?Q?/uDm3lV6VMq2vBsRKlrfpOXyfBzB9sDETNCUQMflOBV8UhT2BnaL2nnYyrFR?=
 =?us-ascii?Q?fK1xZQj4vtkZSHANyCC6Mx4gql7Io1vt7q4nnG8QvVYxrgJ0lK3M9YYN8WMA?=
 =?us-ascii?Q?uclfDNNveMZhM4bkaV8GkcqYNf4nkd4Fb1gRZF6BRTEHHu67hYBoOHaeIuww?=
 =?us-ascii?Q?WMyWs/EbbZoaWKAnwll0xloeWLq36gFQbsh7htEOWI1fqEBfKJYY4m/0RiLv?=
 =?us-ascii?Q?jHjY4iM34frAG/I7v5Rv+4ojYDcSneoDu5nCW4cTOPImcDb9iSC28kD54Tve?=
 =?us-ascii?Q?rBGu9TnrtiT0+cUWBsylepz7v0GKPQCXo/eR3NpPGoBPcQL21M0O98S4Y27L?=
 =?us-ascii?Q?C4F7dJmaTUwWXHAQLVyhJ1O7VGZCvKdMK6o673BF+68beTvjoMipeDi5uRdm?=
 =?us-ascii?Q?yXe7a/SrCOPuQ148PiKPTlzDn9My3F8PMemDijBzyb8OGxDFFHHvJnqVZoNI?=
 =?us-ascii?Q?wvqkHu+ciO4MOckAu5FV7VcBvDPjqPolVUnXRnvaXG1NtsBRF1ThqgX6xdZ+?=
 =?us-ascii?Q?msNPRYltu+mcNj+QkpGvEE3uwq6v7LArh9+V0vFsPGH/PBsCCHTbEhRJPoGE?=
 =?us-ascii?Q?trtSMspgalR0qxj/JK63nfVLetZaaOkIbGbNbT7UTfHPhL3otKltoIFD+JMz?=
 =?us-ascii?Q?Yd4Y5Fp2ZyqHc3nBmeTyl3WgeMf3OyvDWfr+2G2REzquce1OIw2QG91q1dKX?=
 =?us-ascii?Q?A4EZothiWkB2ndJEzfFeqbZDTd60x71Mh1rwax0HvgT3UWIXFcapp7k0iJtL?=
 =?us-ascii?Q?ghfKbn7DZh0itR88pe4Bd79hI+hzkueyZJPmHL1vaXCdLrf1Ass5oD0wN4x2?=
 =?us-ascii?Q?25b6qejlQISG+cLZiHPuZdqWVnyJCgNcsZlzllqsc/HGR3DSjBAZtEvaP6IS?=
 =?us-ascii?Q?vHLs6ZwdiG9I9bSCldbaqJRhbjZS/iXtfK+8e7ClqLt6BhFc3Hez4hUNu0Ss?=
 =?us-ascii?Q?AVwGJFZPEvE6mUVi+phxXiTcf8XTYhM0AS2MBbxtZ2DLPFoemg3gUSE6eUmO?=
 =?us-ascii?Q?o6PYWU4p/uBT1U1lB9H5LyBpSURkh8SNAb1Kv833IEWj2S9bl2CNdJVWakYv?=
 =?us-ascii?Q?7ohCm97dMYmnr/bqM57/N2Fyd0cG+QrHvKaQcnfd61XHdBmkgpBdWaghDAie?=
 =?us-ascii?Q?1rnyWMdB/VKjihqtOIqbYOr3WxTL+0gdMe2JrMhbV8wCWjNGl6xSgNpHD429?=
 =?us-ascii?Q?L3tHKSSyyB3bsLk5Ja+PrcX32748MXa7y6YoxWk/ccbtKt2xdNZ60sCrxWbF?=
 =?us-ascii?Q?hKpVJ0dTFE+OfdP9VxC3X6uKPtesaTc9h2ATlTbSb9o0pBuj8C8A2MNopebR?=
 =?us-ascii?Q?k56CxfzUDGqPVOhzr2Rokt4ZV9x1ekph9nEKjRihwsPstaKYysDOw9BQZKmt?=
 =?us-ascii?Q?GLJw0xdAaxQYNBmtHxE5QcbTRGj3GzOMrX+aeBfUWyXiRJ+nCmcVrD+LZzxl?=
 =?us-ascii?Q?120KCHluurB/TuM=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(82310400026)(35042699022)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 07:27:50.5518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c171fa21-5915-4ebb-57d9-08dd1f357a86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10577

Hi,

> On 16 Dec 2024, at 21:05, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 16/12/2024 08:06, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 13 Dec 2024, at 23:57, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 27/11/2024 16:07, Bertrand Marquis wrote:
>>>> Create a bitmap to store which feature is supported or not by the
>>>> firmware and use it to filter which calls are done to the firmware.
>>>> While there reoder ABI definition by numbers to easily find the min an=
d
>>>=20
>>> Typo (I can fix it while committing): s/reoder/reorder
>> Thanks for the finding.
>> Please fix on commit if that is ok for you.
>> There are also 2 minor findings on the patch 7 that could be fixed on co=
mmit.
>=20
> I think I fixed all the minor findings and it is now committed.

Thanks a lot.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



