Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117DBA72B99
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 09:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928679.1331362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txijv-0006Yd-Ko; Thu, 27 Mar 2025 08:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928679.1331362; Thu, 27 Mar 2025 08:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txijv-0006Wf-Ha; Thu, 27 Mar 2025 08:37:27 +0000
Received: by outflank-mailman (input) for mailman id 928679;
 Thu, 27 Mar 2025 08:37:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yWE1=WO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1txijt-0006VH-5Z
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 08:37:25 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2608::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4b5ca8d-0ae6-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 09:37:24 +0100 (CET)
Received: from AM6P192CA0106.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::47)
 by DB9PR08MB6523.eurprd08.prod.outlook.com (2603:10a6:10:256::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:37:19 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:209:8d:cafe::80) by AM6P192CA0106.outlook.office365.com
 (2603:10a6:209:8d::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Thu,
 27 Mar 2025 08:37:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 08:37:17 +0000
Received: ("Tessian outbound 9438376ed1d3:v604");
 Thu, 27 Mar 2025 08:37:16 +0000
Received: from Lc40efc3c96a8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8231CFA6-F90A-4401-B875-1A0276B6A03F.1; 
 Thu, 27 Mar 2025 07:37:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc40efc3c96a8.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Mar 2025 07:37:37 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB9PR08MB6537.eurprd08.prod.outlook.com (2603:10a6:10:250::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 07:37:36 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 07:37:35 +0000
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
X-Inumbo-ID: b4b5ca8d-0ae6-11f0-9ea3-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ofElv2620GUfTNdnKP8stqPRw+CjJLw0/YbjCLjzq+WrNtMtGYBmrYnsR3R7fkFETqcnXWcRI4AUE1jGZNVh3Vty+/AugrVU799vjAQ0oldPsoYN+ySlB2S4BYagdiGDOB7atCayINiqAlOp8RC6Jt9n5Mp1XdWg0iYAlvAJt09O29s1xubaZJ/k4QKfaGpfKDEHKTx6tOLd0k3NvHO8u4r3fo4vOwqavzNXyUa9YOhQZdC/eQ6vNe9cF5BjHW5gmbfjsSdmrizU27MdcqeYOJdf1AoNNNE/igY4c5Fhazip/U43iXtV6jWdDWWfIJbIfxczpUZXcthg4w/QuXkpRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkyD2JXru2Xhnvj+qDTrrFneFhQPrL5ZrbVGl1voIVU=;
 b=n3sdQo6sigxfii2HUGJT52Rj3P/xK8Lfj7pSJJLZfrCJ89bnqxKtsHldGsYLUELnbCaj50gS6bkJGwMi/OewEBJ7VO3j+xBY90EhHA9Z3w4qeWlTIxOEgQ6KxwarRWaPclS1pUhr1awsNY5EtOtjR+PcWo5dlF29d5OhdImFslAQApmopqQlK/nyNddnK/m95jEw4rDnx1gAd6IVMW0Sz88yg405nd4GVobKk6hnbgxDCPQKkajGhI4IXLcUx+WZSupOYeb0+ln5n/rjmkH+IOpgk1wQXWoXtqQD5dV5MMy2jKswWlfeMv4XRsRxxVHZeRJrOtGZb28350aayyRKBg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkyD2JXru2Xhnvj+qDTrrFneFhQPrL5ZrbVGl1voIVU=;
 b=UgW3CN8T6Ds6XMYaPS3Ps1bC4KUJau07dhWC34sauu5tJhhZn3Ux2tQBw0NnVUQhzTIL/cOXFmNEhaBuOFmPez2ReE0bXcHRIAMcQtk8EfXxi69X6qXFJJ/RdlBskRjgpU8pTfJtwnqKCkxqPnfqWZ7S/CrOOLSUaLGOAVp7MTQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 69309f74a353c43e
X-TessianGatewayMetadata: 8j/yuIeBSR5P2MfeE39hzyzllNtaT69TlwIXZjUQRnsB1JAjJm73WKkxE7GIjq+yrGeelQ6VVTw56M3Ep2dzaDkFKvCdPhMsqkS4jSbksJ3oK2qt77dHLYrCRLJJJMTa2REs+pv8+fEUt9qREtKT7des3+73UA+C8Wh7VTjSDg4=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFjn+lUqfpt5sFh+DBV+MSD0O2vCU2wAGPlpYuzTN3Qtr2uyqklCFz3dQ9uQQqcGZCyyJ0lSKHdkU2v72qqx4i6DImyDsazhMNY1JJRqSgxAGzW0vsj4x609AcjC/B9OKKqiLPi6nhRAYYkHKWPbo5BnQyz1oluSxbuVXLYhkoKRDKUmJCt9vNYEtEU7JYfHBH4lJrv/COr13aJ67g3TX6B7XIsUv8Lt+qApOx2A+faRfnYBCZXvVpeMRdc+4zPWwzOyS3NcMj0vRiBL65NX5FHkg5gf3eD6lTBNoR9OuPybusuk0SKIlMGS8BIoNHq8SDJrNcdcnFuYv25Ja0j5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkyD2JXru2Xhnvj+qDTrrFneFhQPrL5ZrbVGl1voIVU=;
 b=N4xXFv2xrWCycX+loS5EsdHDeACyboxW1mM15koU7YObAp331dClU0s7cIad0SsfeuSTBhh1lhSukjeTxHXleSrJDwexOpVyM72+mF5arUOTC8hBOnFC9YKSHbKQ9lX+kpTL49sIQmVl/2uQN24Ee2iNYZ4HUgKmIeguE2sjxIOBvyYrNQDdk08dpdQtzErvlJgeW6C65S5S0pU/q+ILksU/Qasfq4/3sBIEoiTJu7MnLqh0VTmQS7BBJM3iUmKJErDwwCX4q/iWlUDBvy5wcZ4aN/seuEt1NgmJSkzDsbB0rg7pVNwORqBy87hnsslX2gbv3f4otRIsiBxTBwusOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkyD2JXru2Xhnvj+qDTrrFneFhQPrL5ZrbVGl1voIVU=;
 b=UgW3CN8T6Ds6XMYaPS3Ps1bC4KUJau07dhWC34sauu5tJhhZn3Ux2tQBw0NnVUQhzTIL/cOXFmNEhaBuOFmPez2ReE0bXcHRIAMcQtk8EfXxi69X6qXFJJ/RdlBskRjgpU8pTfJtwnqKCkxqPnfqWZ7S/CrOOLSUaLGOAVp7MTQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v4 1/5] xen/arm: Create tee command line parameter
Thread-Topic: [PATCH v4 1/5] xen/arm: Create tee command line parameter
Thread-Index: AQHbnMQmQgteIfltyEaLKiSPxnHrbrOGCSIAgACTgIA=
Date: Thu, 27 Mar 2025 07:37:35 +0000
Message-ID: <CC7C3E7D-5F07-4567-92BA-BC84A3F395FC@arm.com>
References: <cover.1742824138.git.bertrand.marquis@arm.com>
 <a22e5375df48d16cb4c0b3d80dde8593522b3ddd.1742824138.git.bertrand.marquis@arm.com>
 <4dc98a8b-ea82-41a7-9a10-1184208884fc@xen.org>
In-Reply-To: <4dc98a8b-ea82-41a7-9a10-1184208884fc@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB9PR08MB6537:EE_|AMS1EPF0000004C:EE_|DB9PR08MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b344f2e-90de-44c0-328e-08dd6d0a9509
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?ugNS16GMlgZL1u0A94hJiMuQNbk95RWhKd0kCPcfI7+X0KYVDeAditvIz0?=
 =?iso-8859-1?Q?a7e7Mx1Ih1+gIJFoZCD9sHNZwheDl2xt0GfAtNTf1aCZj7oUs93a39Ypzz?=
 =?iso-8859-1?Q?Nk1MlMdPuQpQsqiSKs9VmDPPRDh0O4ZQOp8S0kOoFn505dlNJwBAlTRdq2?=
 =?iso-8859-1?Q?LcW2KFqxtPSmJG3g9n0KacBNBNn685l6b/aMqoClndw6MumZuxeCVvC8BR?=
 =?iso-8859-1?Q?hz6f1a6/xI5TXyjbbnFjLpyfhnco29XbNmqyUWlridx8af5sq9r9XzQqCr?=
 =?iso-8859-1?Q?3LLAQ8SQEFxIHRUtvjkunIoFAm0HkkD1KfiVxnTHNJNjZa3boJdWSTbOpb?=
 =?iso-8859-1?Q?nYeMtZsXXY3w8tfHbpKf+wnN50C8y8tNKBWR8m6S7SxTqS0DvNkNtAIMAl?=
 =?iso-8859-1?Q?j4MQTHVZ5+BnT+b2KGrGSdei6tbkGhfW9fhMwZinyddgK6XU+CSou5mf3w?=
 =?iso-8859-1?Q?yGpYanjLKwyvgCo4+dHO1rTk64l/P6X221KE1uZguXBo8rBtcal6WyhPCX?=
 =?iso-8859-1?Q?Qgf0RlG2a6IZE9kQtkwPrFtc7WSxvNMJRVjR5H9jYPTaHITsfXvxs+eJzy?=
 =?iso-8859-1?Q?NlXZGJIA1dPgWa3pNH+crfzz0//uBEBbS1UrEKt6TowbysqruNt1xITLb/?=
 =?iso-8859-1?Q?OCam5QK4Ia6dTuq4jX6mkOLG92/82SGquAY/kSFl5M8iixaGUfVVBjA+uS?=
 =?iso-8859-1?Q?yrC6v4DVY3zrCJ8lBoOf08Plr7U7AVL2jYa13KVeRqB6bsmWuHXzKURPob?=
 =?iso-8859-1?Q?LkMiNqMKVbKdY2LgsaViDceYkvVDlIjT7u7Z05grlTorXiUx6s0oJ5Pahy?=
 =?iso-8859-1?Q?mjWxeU2bnVMqYh/nsYL5HVuvR5zY9Wb41QK3fE2c6eJGbCV75645TowOkB?=
 =?iso-8859-1?Q?B38daYnFj14c4ND54+2Lh689cy4GsiGRxtS+arkElncbfYO9OWCAL1fI1t?=
 =?iso-8859-1?Q?xI+lHNUoMLz71874dLopMbbirz+bSg9oR2SlH6dVzQAYL/twWx0viCMJUm?=
 =?iso-8859-1?Q?nvwKUOe581rit8fSMa21E8iKnNLAymaPo1dL7ealURiN/lZ08XRttSZzEb?=
 =?iso-8859-1?Q?1XlVDoyo7eG/DXKDOnZxCHC8hX0+bqoTBcfCk3e8DrvAfFn9Y8QDBJv9nk?=
 =?iso-8859-1?Q?YOMGYI0RLfeyQ36aSOr8rEi/BaAUZkjHjMv4RkcKV9PNBEPqVBsj4Zc27C?=
 =?iso-8859-1?Q?61oyLQpUjfyTeDUoYwZxvVNuKZ6NwWk7fdWR2wn7NkSdkywRmWNl8D5oVf?=
 =?iso-8859-1?Q?55TVkHWXY9LW15Oe3R7HjTIO7Jl8M9lMcWpGcaz8+wd9kJ2J3cnVNvMsHr?=
 =?iso-8859-1?Q?FdkFcqUXfyon1rlGMbmgpy5XqhzlBs/sEa11PMC/YdK+a3YNnRwbiolyKS?=
 =?iso-8859-1?Q?d0WNTmEgiS5NKHAcFbnZBwus/aGtOwPDhmtew3G+6A/V6FKy89e6vhlHKX?=
 =?iso-8859-1?Q?q6IduVyMz3qyz7B4Jff7XwgCRlXPVm+6QJVNAqwb6NAb+SqaQPtmBkaL6H?=
 =?iso-8859-1?Q?29j1Ps/S1ZjctEmCDB8zsn?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5F143D0EDA76E042843320DF76F25AF1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6537
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	16d40701-a651-4485-8db4-08dd6d023e43
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|35042699022|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?C89lQkQQKAzhJlMex25IW28Q4HVaLeaPtO8FYYrLyWLga5q26xaw3oXtEJ?=
 =?iso-8859-1?Q?lkf66PiTiyLE4aNjvpARNiy4njMoCJtNFshCuJwAvLKlZO3tLzkfKWatFw?=
 =?iso-8859-1?Q?uktg3CQQbrJs6oaX6Sl0gYHLr3xRUA/6RdldLIFMqyup2DUKzHi4BgTvKd?=
 =?iso-8859-1?Q?UrwwmXVqZEEe3adUsG0dUHt1A7fKTodnPPSMvyH4W2TgSfCulqpraqmj7z?=
 =?iso-8859-1?Q?3svV0IRCFtJUVYttzAe0y6sZwSZtCMcVwxy9IecuihBXuADKzQKbtB2Ee0?=
 =?iso-8859-1?Q?hHjqlXKvgV+9ammMF1Qs+7NDZa7IVMg/KXoFPERovmFn5SLmHSn/y2wXrn?=
 =?iso-8859-1?Q?Ra0KUgkZyQ2RWC027SBFI0Oi/obrKoE22lMcP2OGpe9ofwB2GhTp6pYobf?=
 =?iso-8859-1?Q?L1m3zzlWAzccTbJiVJi7fUhCcLI36Cqs62ConpTuDHPv5cYNe3XoFfyhGc?=
 =?iso-8859-1?Q?yuIxsoua1UE3g/O1BcxP/62c01teKoUZvhgI6IcMXmugfyow/uIuZFHuaD?=
 =?iso-8859-1?Q?+RFc9ql3WsQxxMl9yTTpduvW49/Zf0PQXiFwTK0lZSdC1nSKn0HoHbDvc6?=
 =?iso-8859-1?Q?h8ZzEBSfXNCaRqE6ISZANoyP67LWFF+mLTZdTKcgL4laogOj+Io8cFn5M/?=
 =?iso-8859-1?Q?pDFWYmxBpeXruF3dt4fy3xbBg2mGI4LSudzXWl6g/l4KyhvTMnDVGaj+OO?=
 =?iso-8859-1?Q?sl952pBKOKScFixhkVi85l5hS0IKuqyQrlTJ+Lbhd1YdZaS6Mor6yGTbHy?=
 =?iso-8859-1?Q?v4AlF2N4cHhG0M+lOMlbVdOf+7wfVGLPUvoe87Qy7Q6CrV/TrSKLnURPXM?=
 =?iso-8859-1?Q?HAxKq1ACRvTutwd/eCADYcK3MW+2PIuSqgg/Rqy79CtjsmaPtmvSrFyAGd?=
 =?iso-8859-1?Q?rb8Epcusa1iX8j4Podqq3vHqjXIPnecfKDdtxiXbOz0gyVIq5L5n6XL9YZ?=
 =?iso-8859-1?Q?EEGnamtQYJ+b7pEj646UK009K7zgfY5fKkNlm5jytyIaC1wSZcQJt0sD7z?=
 =?iso-8859-1?Q?OxqbYcCI0aC9QGSSTtqtVJFPE2BYhUz/x0nXJQaxYOUWhC/k9SBgk+gu1K?=
 =?iso-8859-1?Q?lFRmRWNhHnC1LY/badTQ+QpiyAbYZAgeC+2RxAF9QHB25jrk4cXXdVwdr+?=
 =?iso-8859-1?Q?WiuWzGb8KeLIiMTrF93x19Hok4vPKKLalsJWPmL+U02fZBfkipkJhYMH/b?=
 =?iso-8859-1?Q?ENCzabX211Pru9hx2RZQiOHb6YZe318vaA2CRr7c/1x8Z4UX4UDdRPQmGo?=
 =?iso-8859-1?Q?Wp75wf4YUEnKbDHJT+E2zTPSz+QNlHjmvD8sZiwXTRPewN3whYLu5HkiYg?=
 =?iso-8859-1?Q?RJiM7AmRkaeyhvV5l3coV2qwBuQwQbjY5yCzfWzUGkPoEMGpJpAGb/A/Ru?=
 =?iso-8859-1?Q?0up+E7HtLH2wBfbIQuYAGp1XTyVuey6BuCH21OeH6rgdP0dZVp7xxVutyx?=
 =?iso-8859-1?Q?SNeA3HIawfwiMP1fJqai7bfY+UMgMCu5Dv81CCwAYMyIsSiDWVHRfu+DUx?=
 =?iso-8859-1?Q?R5omf8HxAQsnq+M9L9F1IMPZitlgQBxfDDOeOKoWqYa44fMOSSJtujcyjx?=
 =?iso-8859-1?Q?aLHjEq0cTjIHSpZtqTtZ7hsJl86E?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:37:17.3361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b344f2e-90de-44c0-328e-08dd6d0a9509
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6523

Hi Julien,

> On 26 Mar 2025, at 23:49, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 24/03/2025 13:52, Bertrand Marquis wrote:
>> Add a new command line parameter "tee=3D" to be used to explicitly selec=
t
>> what tee mediator is to be used by Xen and fail if it does not exist
>> or the probe function for it failed.
>> Without specifying which tee is to be used, Xen will use the first one
>> for which the probe function succeeds which depends on the order of the
>> mediator list which depends on the compiler.
>> Using the command line argument, it is now possible to explicit request
>> a specific TEE mediator and panic on boot if it is not available.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in v4:
>> - None
>> Changes in v3:
>> - Properly classify tee as arm specific (Jan)
>> Changes in v2:
>> - Patch introduced to add a command line selection of the TEE
>> ---
>>  docs/misc/xen-command-line.pandoc  | 14 ++++++++++++++
>>  xen/arch/arm/include/asm/tee/tee.h |  4 ++++
>>  xen/arch/arm/tee/tee.c             | 31 ++++++++++++++++++++++++++++++
>>  3 files changed, 49 insertions(+)
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-l=
ine.pandoc
>> index 89db6e83be66..0c2ff542a138 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2651,6 +2651,20 @@ Specify the per-cpu trace buffer size in pages.
>>    Flag to enable TSC deadline as the APIC timer mode.
>>  +### tee (arm)
>> +> `=3D <string>`
>> +
>> +Specify the TEE mediator to be probed and use.
>> +
>> +The default behaviour is to probe all supported TEEs supported by Xen a=
nd use
>=20
>=20
> typo: I think there is one too many "supported". Maybe keep the one after=
 TEEs?

ack

>=20
>> +the first one successfully probed. When this parameter is passed, Xen w=
ill
>> +probe only the TEE mediator passed as argument and boot will fail if th=
is
>> +mediator is not properly probed or if the requested TEE is not supporte=
d by
>> +Xen.
>> +
>> +This parameter can be set to `optee` of `ffa` if the corresponding medi=
ators
>=20
> typo: s/of/or/

ack

>=20
>> +are compiled in.
>> +
>>  ### tevt_mask
>>  > `=3D <integer>`
>>  diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/=
asm/tee/tee.h
>> index 0169fd746bcd..15d664e28dce 100644
>> --- a/xen/arch/arm/include/asm/tee/tee.h
>> +++ b/xen/arch/arm/include/asm/tee/tee.h
>> @@ -55,6 +55,9 @@ struct tee_mediator_desc {
>>      /* Printable name of the TEE. */
>>      const char *name;
>>  +    /* Command line name of the TEE (to be used with tee=3D cmdline op=
tion) */
>> +    const char *cmdline_name;
>> +
>>      /* Mediator callbacks as described above. */
>>      const struct tee_mediator_ops *ops;
>>  @@ -77,6 +80,7 @@ void tee_free_domain_ctx(struct domain *d);
>>  static const struct tee_mediator_desc __tee_desc_##_name __used     \
>>  __section(".teemediator.info") =3D {                                  \
>>      .name =3D _namestr,                                               \
>> +    .cmdline_name =3D #_name,                                         \
>>      .ops =3D _ops,                                                    \
>>      .tee_type =3D _type                                               \
>>  }
>> diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
>> index 3f65e45a7892..066b5ba40f9d 100644
>> --- a/xen/arch/arm/tee/tee.c
>> +++ b/xen/arch/arm/tee/tee.c
>> @@ -19,12 +19,17 @@
>>  #include <xen/errno.h>
>>  #include <xen/init.h>
>>  #include <xen/types.h>
>> +#include <xen/param.h>
>=20
> Coding style: The includes are order. So this wants to be moved before xe=
n/types.h

ack

>=20
>>    #include <asm/tee/tee.h>
>>    extern const struct tee_mediator_desc _steemediator[], _eteemediator[=
];
>>  static const struct tee_mediator_desc __read_mostly *cur_mediator;
>>  +/* Select the TEE mediator using a name on command line. */
>> +static char __initdata opt_mediator[16] =3D "";
>> +string_param("tee", opt_mediator);
>> +
>>  /*
>>   * TODO: Add function to alter Dom0 DTB, so we can properly describe
>>   * present TEE.
>> @@ -81,14 +86,40 @@ static int __init tee_init(void)
>>  {
>>      const struct tee_mediator_desc *desc;
>>  +    if ( strcmp(opt_mediator, "") )
>=20
> You are using 'strcmp(opt_mediator, "")' several time in the code. This s=
hould never changed, so can we introduce a boolean within the function to i=
ndicate whether opt_mediator is set?

Very good point, I will do that.

>=20
>> +        printk(XENLOG_INFO "TEE Mediator %s selected from command line\=
n",
>> +               opt_mediator);
>> +
>> +    /*
>> +     * When a specific TEE is selected using the 'tee=3D' command line
>> +     * argument, we panic if the probe fails or if the requested TEE is=
 not
>> +     * supported.
>> +     */
>>      for ( desc =3D _steemediator; desc !=3D _eteemediator; desc++ )
>>      {
>> +        if ( strcmp(opt_mediator, "") &&
>> +             strncmp(opt_mediator, desc->cmdline_name, sizeof(opt_media=
tor)) )
> > +            continue;> +
>>          if ( desc->ops->probe() )
>>          {
>>              printk(XENLOG_INFO "Using TEE mediator for %s\n", desc->nam=
e);
>>              cur_mediator =3D desc;
>>              return 0;
>>          }
>> +        else if ( strcmp(opt_mediator, "") )
>> +        {
>> +            panic("TEE mediator %s from command line probe failed\n",
>> +                  opt_mediator);
>> +            return -EFAULT;
>> +        }
>> +    }
>> +
>> +    if ( strcmp(opt_mediator, "") )
>> +    {
>> +        panic("TEE Mediator %s from command line not supported\n",
>> +              opt_mediator);
>> +        return -EINVAL;
>>      }
>>        return 0;

Thanks a lot for the review.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



