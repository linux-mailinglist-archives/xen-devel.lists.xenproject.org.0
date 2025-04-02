Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEFEA78A77
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935261.1336694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tztwu-0007YH-3M; Wed, 02 Apr 2025 08:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935261.1336694; Wed, 02 Apr 2025 08:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tztwt-0007W9-W8; Wed, 02 Apr 2025 08:59:51 +0000
Received: by outflank-mailman (input) for mailman id 935261;
 Wed, 02 Apr 2025 08:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E7/M=WU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tztws-0007Ia-6Z
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 08:59:50 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20615.outbound.protection.outlook.com
 [2a01:111:f403:260c::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5305ceb-0fa0-11f0-9ea8-5ba50f476ded;
 Wed, 02 Apr 2025 10:59:49 +0200 (CEST)
Received: from PR0P264CA0187.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::31)
 by AS8PR08MB5957.eurprd08.prod.outlook.com (2603:10a6:20b:290::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Wed, 2 Apr
 2025 08:59:47 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:100:1c:cafe::dd) by PR0P264CA0187.outlook.office365.com
 (2603:10a6:100:1c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 08:59:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Wed, 2 Apr 2025 08:59:47 +0000
Received: ("Tessian outbound d42effb6eaa7:v605");
 Wed, 02 Apr 2025 08:59:47 +0000
Received: from Ld2048c796f61.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 958F11A9-C2E0-4AE6-AA29-6B69F03848DC.1; 
 Wed, 02 Apr 2025 08:59:39 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld2048c796f61.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 02 Apr 2025 08:59:39 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VI0PR08MB10390.eurprd08.prod.outlook.com (2603:10a6:800:207::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 08:59:38 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 08:59:37 +0000
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
X-Inumbo-ID: d5305ceb-0fa0-11f0-9ea8-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yhT2aMVFLP1HahJkeRMTIwQDY22qpwYa/hU0h7FEkI7CuP/ynArOBIVwCGdSnTCFqiQtMhf5HsERXbP7utcApcZTpH+1BPf3Lmlz64zc50iFTB7loAGzPe/+JGLBBskNKtADWu/THOmFRzisJ761Sw+rCBi/RQXawO2cah25D5YY26sqoNF3ID7sjndTBRq9N8JQLvXoMw97vjZmbkZ5VO8riTN3SUxCWiWMg4u4SfRxiAhs8nKGu9eUzM9B6Ne00AZpQ60Pyq5KIw1Q2/Tnkolzwuh1Ohe+JOTHwPS2E1OgEFa8IgBDcuxEVxMU8mz4j3tya0SxbkHAYBQ1VoObrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERBiYWJ2Gt9JuwxSCCPkBVODkT3XJbnuq0l8QqZGlZ8=;
 b=I4Ll9lRnHmjw4HAx7M9kEb7pgji3la2K0/y1TvamQT/HV3DTnhFbmtvtqXfwv3f5ykc82YLliAHzPMooRwzBIlPzjVnP0+Ol6X0Pkp8y3ll23Y56XH4snZqkhUCmFe1J2bLmtHlf2vBC95hrShJka0fmPCAhaN/qVmhV8BrAVqvPb8IBZHNCLsynzls/UrNTcKJSfdrPHZsIn//H1B3Dr5gFUmfjU+YKmJSb+cKAnzv2tbE7l/cxj6coIjMHc9+98yfAIC89XYA90sEgdMeZW/n8OG1uFSSQ28rBsBryMD4rV/GGduw3dyIcGFEePNvS5a70XTuj+4ZZRQctPJ7GSQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERBiYWJ2Gt9JuwxSCCPkBVODkT3XJbnuq0l8QqZGlZ8=;
 b=oNVFP52RcHQ721aEt6eydpv0rlarWSKH9A3Dn3bHro5NBUWqhyO+j4TXk45Yq/ZhxK1o8Tuu0nMy0gbEfryzONiX5wdb44nW51r968jD3y2IAZlba0EofVxCZ8qdNGCTGy//yrv69TpgMuwk6V3CnieK4l6jD81M0IU+3gxoLxk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4c7e144c2e7a7052
X-TessianGatewayMetadata: /OV4pbLgkl0ir0vpF51xeTMW1S4mOMHhI/TQOrZYV8Fri0A0KMMWJtqEDXtDLr3FuW7kNnFhAI4LUZHNpEVBwOCYKQtGRMF0pBP+S4WEOk1fQnjy6+axbzXKGW6kt/wn5eCgLmJvxCQM2xuCUa5hQvS16W2g7LMZeAR+f/JKCAA=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CG/PP4f07iECl8GSLMc7l06chON0YEHXZU6O5VxHNMHmPJKRLOFRKslE0VIfc7g/TFs47zH9yHACkWAa5uxrc67Urv3AEFpiAa2LKNW2E+oZUIM1a1zFni0ohdZH930AMowxA1imUu8vey8fuhurwG9bvDo0gRRr980iHFuBtcjhSi+ZEkCPUxvc/Z/Ut4SdrzkMkmhgX8WinsTH7BwRtYQWLlJz81bYUgzssBNKXYv/z9ZFvxMVaVwBmsGGDl5AXx/QZHm9L43w4vmhJLZUUEe60pe4h8uLgzggoN9ktArumKBbwgkIFknQrOcDRrMzTPSkgbZJg4htZqUAbomHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERBiYWJ2Gt9JuwxSCCPkBVODkT3XJbnuq0l8QqZGlZ8=;
 b=KOibUa35o8AW9ya7wBL8+GQ69WEjfZdwqd4WD0SwaDYFFqNBOtq4WTBAZ0AIJoDZQmUJISpmvOdodIdar+MbLJTKNHwq4Nd7Vu+vS/X3gDSb/5dD4KGrSyPifzRjCdSycxL8nyRpJwTQlspy4wY7N3cbtxchX7dFn4SIoxpOIzxreQgMX6Xd6VdRO23ih6a+onMbNZlKOmDoxdnOcDMbWl63a9uKXg7EOuQgeS6DCayHQOpVr347/BCyu6M2ATVGk7kcJ+aWMpppL88Z6SXo1o2Lazyjt+oG6pZ3zNIkT5jChDPnlErLT5sMB5B8mv1/sLNDlRE8wSt7Mh8gCGPJdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERBiYWJ2Gt9JuwxSCCPkBVODkT3XJbnuq0l8QqZGlZ8=;
 b=oNVFP52RcHQ721aEt6eydpv0rlarWSKH9A3Dn3bHro5NBUWqhyO+j4TXk45Yq/ZhxK1o8Tuu0nMy0gbEfryzONiX5wdb44nW51r968jD3y2IAZlba0EofVxCZ8qdNGCTGy//yrv69TpgMuwk6V3CnieK4l6jD81M0IU+3gxoLxk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Drop process_shm_chosen()
Thread-Topic: [PATCH v2] xen/arm: Drop process_shm_chosen()
Thread-Index: AQHbo6s3glvEsGfqTEyrN7Z2cNAq6bOQE7yA
Date: Wed, 2 Apr 2025 08:59:37 +0000
Message-ID: <407B18D1-7047-47D2-8FF2-51703B6AA688@arm.com>
References: <20250402084233.114604-1-michal.orzel@amd.com>
 <20250402084233.114604-2-michal.orzel@amd.com>
In-Reply-To: <20250402084233.114604-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VI0PR08MB10390:EE_|AMS1EPF00000042:EE_|AS8PR08MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: f3aef3b9-48b5-4f97-93b1-08dd71c4b80e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?qgwh3+D4bSYgPCeMEPc5tQFdGwc6C1zLvFcEYEod6xWSOFCuV1+BRWK6V61x?=
 =?us-ascii?Q?XfODwQDFYY6uiJiXTKi58oE5dz7rqlDS5NNCU01MPnlVp0TqFgL1RgeBkzeY?=
 =?us-ascii?Q?IfHpr/ySxDDha2AxnpYhUkYTNAht+ZIUbhXrjb5yA1/OP1E83XMpkJwBFeCY?=
 =?us-ascii?Q?Md1SjI39+4HPh6tPZhmVW0eE1lc5a3VJYVplTn41cEVqcxMiOPTuZjLhgB51?=
 =?us-ascii?Q?Q1goY8n1JyoOKO68QCRq1Vu7PSKoI7EkLdNW8YQq6E8jzVd8nnhCgH6Bn15w?=
 =?us-ascii?Q?8Jgd4/6e4JUfX8FPukbz4DL4X6xRv/tSVyQO7eJzPUkW6IeOYCpev+2JanX0?=
 =?us-ascii?Q?CAXFf0nIHYchB6dmnePTOgaEYMIlsTOhXL8xWRcKgdY9yX5dNqwOy47mHNqJ?=
 =?us-ascii?Q?yEyl+R1MJ8TptR1OJEIM9pE01blT+kgJOM3c4lWY992JWTtimQXUl/cjyEvx?=
 =?us-ascii?Q?jxNbfQ3L4spgV3CBImtN+9HVyexsgUHcH/NxFacm3uoXdECixjZ1VCmRkG/b?=
 =?us-ascii?Q?HTsIDetJQAHqvEm4I7t87a8DgyMuKnZg7wnkD3hJiIbm/otHB9VtB8cpKer1?=
 =?us-ascii?Q?4wzd98yfn09t1GVjTQCxiTBSdTSGoF1bqgNVQ+qznRuasCwJVrqELGGXGqpc?=
 =?us-ascii?Q?RB7yfLkRPRAKTNnoVHqVBHPl+jfqg5Cmrlh3I7kuYTeVK5JwzncPBCE5hPGX?=
 =?us-ascii?Q?+9YR6xK+5DSiGXuNewYHICQM2GHlpfUSuVBH1NNI5Yvk/eGDbyvg/7XNgiTc?=
 =?us-ascii?Q?fsxoSor8IgUcaoI56tyyIbUIIYhiYmrjSnY1a96MN/Ns5B59iWWM4ff+dOcK?=
 =?us-ascii?Q?HY5fW3Xr1OK2bZLjXyDMuKcgneyPRHFaRBw17NQ6h1EZV0pjbcckj8FoMvfT?=
 =?us-ascii?Q?hAytoUKoQ6T4J2OTFHmGEFIjNgAxY3XME9o6hnBG+fDjtzBrVnWg0snwPJr1?=
 =?us-ascii?Q?J8Y2dT3xGmTluhv4VL/BkfIVoannOemw6m3hb68Rv7EoUqXnN0WO9mHbjDYX?=
 =?us-ascii?Q?q1nXplwcqtPMdBfRhd8Ok4FH0tsSNyXcOJv5XCPH0SS/m9mirBcZbjy/Z+Ju?=
 =?us-ascii?Q?kcynRDpdjIiSvag8froKXO5zuiKBlhh8OfXLnlG5yHRWnFyVeItHkq2pKCym?=
 =?us-ascii?Q?zdKWg2DTKnROjmZWw6/L3gLQA4W0T4XlHMWmoHR/s6R1d6tQUouDKqJn7fyt?=
 =?us-ascii?Q?J4PjK+EFlMH3srGNyf5ruPkIQflqmM0waevTm8O1hxJ1vfNKmafUOn0RF2+o?=
 =?us-ascii?Q?tx+9ptcc7yF4Hi1HcjN/5HLCOPflhhqE1y1NA9mxRH0JYT2AiBKQm9xMGDjS?=
 =?us-ascii?Q?qvVOVa2E5gRuV0aL12emmIZLdl4mPrYdGcpGwBi2uQhxdTxq4AD6PcLzs3r5?=
 =?us-ascii?Q?qK335l3DXpi2i3wjdEvLcOkGXphnsWxcXuQt7I8gmsEQmP0Am86/R3MRxa1C?=
 =?us-ascii?Q?zyTnkPbyK+NUxacTclVUuoW808A/Yswg?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <72F497F92135BD4994577AB067766477@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10390
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4790bf5a-752e-45c0-2efe-08dd71c4b282
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|14060799003|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NBX7Dbrv0v3S5iAvaKwuzz2fuYCqyDeB2vTU6OORnUPYSnCniZbkKnfs4BkQ?=
 =?us-ascii?Q?uvrKRpZB2wwVN8FkVUY3+4E9v2v0l3/WEqDsyEDUj1WSXctOxAHVjgziTfaJ?=
 =?us-ascii?Q?GvFXYXsuuZQygCqC/tu3wigYQ93iuZVA50fXN5vTSebXqZ550YaQJ4S01NIr?=
 =?us-ascii?Q?7Tib+P0jNL80YYH6vjhS3f/jlNAeztDRvNXb5CoM6Z2e+KK6Jv5s8zm+BkJv?=
 =?us-ascii?Q?QRz5Pog0GC263kvl4rrf0yqfgP755skkuQ9yg8R0NVXpYeaCSAy9Gma0trAn?=
 =?us-ascii?Q?YL07Akp9kZ9zb6eJXelSX9Aa+E3Fk27JPHK9fYk9CVyFAS96LFoHAn7JlTAR?=
 =?us-ascii?Q?VGqWbd318Ca1h3YRXbHi9BX2dZv0PbENEA3NJQttfBfKCOua1ZwXRlzbCLX2?=
 =?us-ascii?Q?D41vFIa1GOcnt2/KSom43sLo5c21dUb+dB3KNcS9arjlR0DgNJgMSvUzETtW?=
 =?us-ascii?Q?NTNWD6e4HvCZlUBH6c5nqdUDzXzt5FyZ+yQ86P4PEKXUXdTuBwGk4Wvw2+tF?=
 =?us-ascii?Q?s0FkZmlfJd/z0kzcLb9CpSgg6tl1pklRACxJjv8Xgs5cbsx+EfHucWqump+W?=
 =?us-ascii?Q?ddhv66m3yBp/rxfu6hozuW1dPO5S0gc71I55sygYQOr3iY85T+ThJJrrUTig?=
 =?us-ascii?Q?HHTK9LIBtL2148voUBw/uIolXXV8KhYMT6kgHynCjhYgZcPagTqJiqDUmjH6?=
 =?us-ascii?Q?6fsA7KD47A31SlF4Jd/XPa5RJO+r/aRkvzLZYJd0ngeJEkb8TbHEJVuj/GQC?=
 =?us-ascii?Q?EsABGW5EQoH1HnJtooFjSXjL2VcwPRg0dxlVORYq1ypSV+VuxA+smlGssS0u?=
 =?us-ascii?Q?DAhJoq0VMCzzyI2AbPzqs89zJyi9Qr+gp+GuuuNm6cltBr2W9PkyrhYzVXHc?=
 =?us-ascii?Q?WEsw9EB0dSM/3qViq2PIoIoKe+FJAK0wL2Hzsw3Bo78AgRJ+n3l3/IFHaCnk?=
 =?us-ascii?Q?UIVvjkA6wNZSKt4DVKN+CUbLETQDNxISasKo/a2E9d5SdFkfpYq5ueIR+Vl+?=
 =?us-ascii?Q?aCA+MfbTj5TrBVe49JqwJYRRVC4tOjZt3F/hxk1v0t8QMNRfr7JMJvUaL7Gl?=
 =?us-ascii?Q?a9ZQWBc33oXksG6g8v6rRWXSBskgoJAENUrjkgj8v8livI2XiDLetXOD1fPu?=
 =?us-ascii?Q?V8tWz7Db4NKeWJk7wGFdufNkjmfBEu4Qrnfzl1dx6grlZSRXv8hWQ/UaR5Cv?=
 =?us-ascii?Q?6RtanCAUfGfvxERVd2plQNEs6FRRJLtI/iJ5Fu10UrUk3SlgviD5tf89tHya?=
 =?us-ascii?Q?eT2rl3yZJpKG01mNe1ZRwfA6rwsY95bHUnYKfbPXLNEasfcBHodfKKfDxsyD?=
 =?us-ascii?Q?rB+QEnXq4RJCiEtzLLlcHuXXUZB7aaxc0bANKk2zYgyu68hcjNMLX0BGetAJ?=
 =?us-ascii?Q?KkX2pLAiwFhBWsPWzB88rVdSWQ+XpUT+It5ZHjACn88UEWmISxrL7epDUrtB?=
 =?us-ascii?Q?EGeLflfi7AcX5l/pG0bz/qmH2QXc9v9trGMaqtqugj82FqYnFggu6EOBfKWw?=
 =?us-ascii?Q?sqaWbjz2NZNVFAM=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(14060799003)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 08:59:47.1032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3aef3b9-48b5-4f97-93b1-08dd71c4b80e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5957

Hi Michal,

> On 2 Apr 2025, at 10:42, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> There's no benefit in having process_shm_chosen() next to process_shm().
> The former is just a helper to pass "/chosen" node to the latter for
> hwdom case. Drop process_shm_chosen() and instead use process_shm()
> passing NULL as node parameter, which will result in searching for and
> using /chosen to find shm node (the DT full path search is done in
> process_shm() to avoid expensive lookup if !CONFIG_STATIC_SHM). This
> will simplify future handling of hw/control domain separation.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Thanks for the BUG_ON :-)

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v2:
> - rebase on ACPI fix
> - add BUG_ON for !/chosen
> ---
> xen/arch/arm/domain_build.c             |  2 +-
> xen/arch/arm/include/asm/static-shmem.h | 14 --------------
> xen/arch/arm/static-shmem.c             |  7 +++++++
> 3 files changed, 8 insertions(+), 15 deletions(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 85f423214a44..634333cddef3 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2327,7 +2327,7 @@ int __init construct_hwdom(struct kernel_info *kinf=
o)
>=20
>     if ( acpi_disabled )
>     {
> -        rc =3D process_shm_chosen(d, kinfo);
> +        rc =3D process_shm(d, kinfo, NULL);
>         if ( rc < 0 )
>             return rc;
>     }
> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/inclu=
de/asm/static-shmem.h
> index fd0867c4f26b..94eaa9d500f9 100644
> --- a/xen/arch/arm/include/asm/static-shmem.h
> +++ b/xen/arch/arm/include/asm/static-shmem.h
> @@ -18,14 +18,6 @@ int make_resv_memory_node(const struct kernel_info *ki=
nfo, int addrcells,
> int process_shm(struct domain *d, struct kernel_info *kinfo,
>                 const struct dt_device_node *node);
>=20
> -static inline int process_shm_chosen(struct domain *d,
> -                                     struct kernel_info *kinfo)
> -{
> -    const struct dt_device_node *node =3D dt_find_node_by_path("/chosen"=
);
> -
> -    return process_shm(d, kinfo, node);
> -}
> -
> int process_shm_node(const void *fdt, int node, uint32_t address_cells,
>                      uint32_t size_cells);
>=20
> @@ -74,12 +66,6 @@ static inline int process_shm(struct domain *d, struct=
 kernel_info *kinfo,
>     return 0;
> }
>=20
> -static inline int process_shm_chosen(struct domain *d,
> -                                     struct kernel_info *kinfo)
> -{
> -    return 0;
> -}
> -
> static inline void init_sharedmem_pages(void) {};
>=20
> static inline int remove_shm_from_rangeset(const struct kernel_info *kinf=
o,
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index c74fa13d4847..e8d4ca3ba3ff 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -297,6 +297,13 @@ int __init process_shm(struct domain *d, struct kern=
el_info *kinfo,
> {
>     struct dt_device_node *shm_node;
>=20
> +    /* Hwdom case - shm node under /chosen */
> +    if ( !node )
> +    {
> +        node =3D dt_find_node_by_path("/chosen");
> +        BUG_ON(!node);
> +    }
> +
>     dt_for_each_child_node(node, shm_node)
>     {
>         const struct membank *boot_shm_bank;
> --=20
> 2.25.1
>=20


