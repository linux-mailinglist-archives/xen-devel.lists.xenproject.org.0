Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AEE98401E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 10:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802426.1212654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0jJ-0004xC-Uj; Tue, 24 Sep 2024 08:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802426.1212654; Tue, 24 Sep 2024 08:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0jJ-0004v1-R4; Tue, 24 Sep 2024 08:17:05 +0000
Received: by outflank-mailman (input) for mailman id 802426;
 Tue, 24 Sep 2024 08:17:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f6Gt=QW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1st0jH-0004ul-FY
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 08:17:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f48679e-7a4d-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 10:17:00 +0200 (CEST)
Received: from DU2PR04CA0333.eurprd04.prod.outlook.com (2603:10a6:10:2b4::25)
 by AS2PR08MB8262.eurprd08.prod.outlook.com (2603:10a6:20b:551::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 08:16:51 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::f2) by DU2PR04CA0333.outlook.office365.com
 (2603:10a6:10:2b4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25 via Frontend
 Transport; Tue, 24 Sep 2024 08:16:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Tue, 24 Sep 2024 08:16:48 +0000
Received: ("Tessian outbound ff7cc14e3a8a:v465");
 Tue, 24 Sep 2024 08:16:48 +0000
Received: from La8f56c1efca0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A2C6AC5-7B87-4C06-88BF-808A74A7C3A5.1; 
 Tue, 24 Sep 2024 08:16:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 La8f56c1efca0.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Sep 2024 08:16:41 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AM8PR08MB6482.eurprd08.prod.outlook.com (2603:10a6:20b:367::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 08:16:35 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 08:16:35 +0000
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
X-Inumbo-ID: 5f48679e-7a4d-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NC5Ov1L3ks8TnmrM0G9toqek3Rwhs9OsEQuH0g8g27gNeG+BWdp6mA2zEbwmKKvxhaLaNbSmm+elOaQlz6+iPxYrCGG1+s36qoJwulZ9m/WPNEDSam/8Fy8V72VH6WkBCv7pD1fvT6TTJDBVRDJAT7edV+faCxgl1sGnNEYnQk/RCjzRrsxQqc62zEMEQwkFCuIPsFaC+p9gQ8S7kB6h/xEOe9PDACZJCl4N4BOx6kaosXxLlCbVwJJFEgZO4tZE87tJhn2Kdo6CHyaIkGYGOXSAib804C+azPks8HxnQCkzUFWKIJhrfQ6ob9M1gJ4EvG8FCxQA1hG9O/N4v0krGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J6lX5DLM4A6nZIX741miPr2fyFj0PUPrw27ajvBAKE=;
 b=Tj+9SZlz4ku9Ss4Ov91zRb9R/avg8qn7SieiirIOvoycAQy9gAi/R/baKh6Ri6QCVGdFMqsQZ6YYolcphKo8jriVzKTeN/JUWHjhDyrPkkuWmSVMzILxsLPVqMvu2r0jpd54bOFR6v1KEZPQXe9oq0GgyS8uPhIovufmVFs82tFgXBBETKsNoTaJrwGB7egTmCtNO62OQXGsnR9N4xUlON/C3YUCbIBA2z16+PI1TB2n3s964k+RZLBn2uR3hVvZ1bLDBEiHy2AxIiudC3Pq85i9So7Vkot7418VvLrhAe5Zj6nkmQAXTn0MFhA7j4vrJtT1lDIeDFVROk4F+ffxoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J6lX5DLM4A6nZIX741miPr2fyFj0PUPrw27ajvBAKE=;
 b=Kc+Dr05cG1uTGs9m5pTy3iDer1hoFJCcniPxAopzc7V7pNpA4lJvb4yPnCYz9D+SVjYH5vyLbdIJLImeXLGVMlDY8TXFAmm+JffSva0z3S/Gaf4sz3WFlowOL/n2/i60XV1mNVYNyjogbCkdtBkGs1FBvZZ//vZaUPp5BchvYuc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f022d213df3e1653
X-TessianGatewayMetadata: nFCCvYImHLKJT/Q9nqBMyy9WgkITdPjppKzxR8mmGJg5hTvXBw44oe53+TbhGDEVbc3kPT6TpCkhJQTsc5XJPtjbcI+8677gNudj8SivXg+JQeXQ8L4Gqykx2FNDRtLuUiVRFZaAJZkpFyLWUBoeOtOLgdx1rJOBh0WHG2QTC4o=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sre+PlIMsIy8Yc138Fk4fJdjHl+asG1nEbf2smFMfhld4ZBFGWOMS5Ri5AMr4bQeDYeCvDzyA4aWqbYfR2oyg04yiw4VRWUMwjUG7ncHZqJzy6UQw+DgqzhTUhAF3tdc3X2ive7PhVPjKqNSrYSuKxzvP8U02FitWsfB90ds3jpT2mJOV4aQIgQ7u6epW652WqzeAq8ADw67tpFF+adrxcu2u3l+ZIvvcvsB0+xITEXac8641AgF0RE4DyD8XNA/9JSF+u9cHCR43yqDXr5K85EkY3NvSoOmUeO4d09RJqsm0dkeH9NaKO0dcIwCUMDgFkqmef98rBb6wxvwpZsWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J6lX5DLM4A6nZIX741miPr2fyFj0PUPrw27ajvBAKE=;
 b=HEr6+/HgejoSTuGXNVEdkmgbdyvZ0zsneUrqWJxgE7mgrEmvIV5lMvGqdBrB0/7vcj6wkMFU6Daf30RDgNUm9iz/UWg7boGhVUJgObqUXgryUH3GC3Cxq7ULRpP4TOVzzL+6pbM6tJCVPNjv4rxTQYj5+Z7CSJlyZPbq2S586xNpOpB0umrQVxclKABvA7VoL6YnLAM4zuUXdX41lEo7DfK8L1rFNgE1K8hFynlgF7YB3RdpYsKT4HCrOUdupHkOjlqn5b4D0ZQ/wIIQ2zpH4NSk7qT0C6dHQ9WUbYVC6MfafQw2/brGdOKnrCywpppR44V3TYnFIgGbgD1MkYbaCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J6lX5DLM4A6nZIX741miPr2fyFj0PUPrw27ajvBAKE=;
 b=Kc+Dr05cG1uTGs9m5pTy3iDer1hoFJCcniPxAopzc7V7pNpA4lJvb4yPnCYz9D+SVjYH5vyLbdIJLImeXLGVMlDY8TXFAmm+JffSva0z3S/Gaf4sz3WFlowOL/n2/i60XV1mNVYNyjogbCkdtBkGs1FBvZZ//vZaUPp5BchvYuc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 02/10] xen/arm: ffa: Rework feature discovery
Thread-Topic: [PATCH 02/10] xen/arm: ffa: Rework feature discovery
Thread-Index: AQHbCo5ExIbA7l69J0+4YFeayWExYrJjiLEAgAMWSoA=
Date: Tue, 24 Sep 2024 08:16:35 +0000
Message-ID: <66012F72-AEF4-478C-98A2-6D37195348B5@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <6c841c341b7dc9e06eb1c02555e30b29bd400d20.1726676338.git.bertrand.marquis@arm.com>
 <4f1c91c2-a4ec-4dcf-a5b8-7d0607b1778c@xen.org>
In-Reply-To: <4f1c91c2-a4ec-4dcf-a5b8-7d0607b1778c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AM8PR08MB6482:EE_|DU2PEPF00028D02:EE_|AS2PR08MB8262:EE_
X-MS-Office365-Filtering-Correlation-Id: 120800cd-23ab-449d-0d85-08dcdc713ce0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?rFTUWqBS691r1trGVuzVTV70N4JhgR/oqTUblg8ybHoFxAt0pTGiXoAGKR8Q?=
 =?us-ascii?Q?snwY/AVf4A+zS8fpd0FrWP9YYXZNvKo+eaah2eMUC0T/C23qzEY8nBrv3VxJ?=
 =?us-ascii?Q?kgrjiigQdz8S1VWgOoLuidQ6hLKcxNP6Di0BIJABgs/9fEvzD87yNfQTIFb7?=
 =?us-ascii?Q?tssSwj6oVhyyE75qZy9vbKGV/pS9XCGKHYk/5PZCtlQQ5eiuGLMxGprqsZ+9?=
 =?us-ascii?Q?BcT0kuR3oBR+uxOEVXaAQhq8n8FO48Exi/J9GErLZkeXace439PPGacmfqP0?=
 =?us-ascii?Q?kU0TbRB1T5aRkYf2TZCeTBND+OAw6wlotYonBpWXnh05sPFJTiFZUPuQyq68?=
 =?us-ascii?Q?/kvdOJbUe6YsM1EINJG4rZKHxdPKYVgADOUWvLixvuXIssxiOFRjrCtruYSX?=
 =?us-ascii?Q?/poms7eB1w++gbPmPbDvki61QJhOyZQW6UexXGtwrfP9xGx1YoiecGtEWE0k?=
 =?us-ascii?Q?z8wcw+hFA5Fdcnx0gN9pyAFM0QiYlFNyUmhM+dn9E19RoIQEoh5LjznHFvR7?=
 =?us-ascii?Q?MUdOp7BkIMIz69oC92DKdT4cr/7WcGOP0wUY+yrK1/D8AoA+YU8GlJWfQiyU?=
 =?us-ascii?Q?yrY8LvD+Fw/wbENnID+leKR/dh9DODXIXt8x+iiyLqLs2Gy7fWsnOzGpstcp?=
 =?us-ascii?Q?jUspvslU+E1aOSlcCOBKilZa7Bf3HXY164DCJ5mAvkmEgGf8pWIN94YeCHKV?=
 =?us-ascii?Q?Gr37K1iKlQ6+Au0GY6/gpslhD7pakbx1DqlhAFWd7Ud2f98Tum55eCEU5hTs?=
 =?us-ascii?Q?n/BChkfinVpLjnJXeoXdjvInBlAGPG/awL1uun/nlvdFe1LoPutN2Q08RPPS?=
 =?us-ascii?Q?Sz49ZtpKM5ceCwYRlWDvPXvNSrRjrV4/+16i3Hqjq0JABDucVNHR8B/S1v/h?=
 =?us-ascii?Q?XtxzNbSgqqcJUl/5ep2Bx94yum2T57K5YRgs6DUuJotxjLtRXUwBGzvueMea?=
 =?us-ascii?Q?GHMC/prmziMIyKeLuzVr1sOfRmm13cpsnNQlvsX8h3eCsXaEm/FgOvQc/HD3?=
 =?us-ascii?Q?dnzeVpaYtUik81EFfZwX7St+q2mTuG6LTF7QjTGNmSM6QWcDN+dSvdL59J6f?=
 =?us-ascii?Q?lqEIWJPUBJFcMNc8hW8fEX5hIxqelB76HnAULGxLKPjEuMBhGbJc6hVukua+?=
 =?us-ascii?Q?4GjasGhc02FW7V/EukfbvPzleyMXtzVB4QE4Vxz6IR/5LDMC59UXdo4KGu8y?=
 =?us-ascii?Q?+Yt2/9dm+AWKTYsUpddJ8H9LHlOLMX7Ckh5DEjZ4cNvQvfMzLv8NXINxL9hT?=
 =?us-ascii?Q?eYLLsPlN3iMDtJQui2r5B17yv7EWAVBg5XeBDvQ7ETY0jXDMtav2WyQgzTQQ?=
 =?us-ascii?Q?WOHdVA3vu+nKCf0vSP48Av9DFjWUu9QOxybkK6U8ZZU4BfwmTbZi6C+aVKjE?=
 =?us-ascii?Q?TKBma4FLHv3ot5PGP+ba2CpOqHi6+ehn5OIXDhmMUYWdMNJIxA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DC7187D45822BB469363F040964638F3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6482
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6844e4cf-d1bd-4b15-d670-08dcdc7134de
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|35042699022|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nMGXfwGqbqHgcE2Z4G54kf+LzGUn0a9J1HYaGfT4dA4DYsTWWS04GASYoAib?=
 =?us-ascii?Q?UrcKk+q38Yt1BniiCF+vqK7UrWKEhSZ2JhoSZRlBfXY4O+CUzEafZFTyaXEg?=
 =?us-ascii?Q?MVU3kvNbS5aad+2CVKYfbMe3YlFLAqS+cmZBt+gfKis9Mm7vAoFuFYfYCv82?=
 =?us-ascii?Q?YkKKQkx2i9UrTAoXbwrS7sLohhuGafo7aeaCV91IY4IT1FrCEWAZJG31W+ff?=
 =?us-ascii?Q?/FAdW+VuoJjpq8wk2rLNhpPvX7YHw2yBiSdf3BJFIWTpoB6L3d5OLKx0V7qs?=
 =?us-ascii?Q?YxOdD9WR8zPZ5fEsTs2owIIsQvnbANezYf3wlLHN+DTWJiJQZgxPfa+XLqoh?=
 =?us-ascii?Q?MRIPTkcF2MibjaAKDr/njvn8rPamvL3oo2j5zku3uMPryNX1bsIR3O2vNIwm?=
 =?us-ascii?Q?R/SCtxfGn6zdgpz/nn9y8AAPTQyM3OpVgxLVqq5z9ftm40Cy+H9//50nE6BF?=
 =?us-ascii?Q?CNldsh0uP2Cx5+MdH5fCch6D/rkhTy359LkgARt+YUKSralBG+iDkIiRp1qp?=
 =?us-ascii?Q?jD23QJjwK8LxvcxK5yGCUhNX6mC1Q2eR/Pkj4amPbvrNPbJIhW0d430SLek9?=
 =?us-ascii?Q?DJ5GqdAr4wUp/013+bwto5uJGx69gqHPWb/0oT1ExXxKk4L6HL4RG+ox0GGi?=
 =?us-ascii?Q?Bsw6Alsp8VBzHxea4xX9vmlav4j6AdnszZhB8RaBpvbZopHMAI3PVEV+JZDp?=
 =?us-ascii?Q?+bb+93kDMFBGYPCLDodpz7m3/+xe52eZxDcZcatiQgAIRBM7/pOdg9B6qS+Y?=
 =?us-ascii?Q?2Hbo4Un0Gt3EN8eAvWH5dRbfrv/uke+C+MmVO14nUf7rJmdUG2c1WhLKdsj8?=
 =?us-ascii?Q?sRq/VU8Jdt5OZd5/6xh5CLaIAy+GW3RC2w9lYFdXNuLEu5AvK9OT1D6shxDo?=
 =?us-ascii?Q?1+0HUD0md0acxt+daXyAqUeL4y+GTXN50T3ZlptayaQDDM5ewzJK5NdED/eN?=
 =?us-ascii?Q?cjyUknhPr2eR4sqBacIxfuhYptjjucbgxNiTzONqSM9+l5MGOUuzwa2c/Y9H?=
 =?us-ascii?Q?q+vWw3UI4yqg3pTNHp4SIZHaeY7NBK17N1ZKsJ52Pbr0N/K+LjC+VpksbNas?=
 =?us-ascii?Q?OLjMaX+v/P7i7O4M3LxtNTXE73+eepIN/26roA7yd4Pp4e3dDeuPTMeD+luG?=
 =?us-ascii?Q?qpuMgvFZiM+MBVG9ktDugvFIYVgRWodDTA1QqiCZAT0sdioR5zljlU+klqXe?=
 =?us-ascii?Q?O9z+PozktSDsIPGIB4/Y/Sb9MrkCZQKLdOzXIGzvCYmvSCDy0P/ZNMqGP4E8?=
 =?us-ascii?Q?r2v3exnXHjVqWADPz1hJ6IE26MWmPBiqkYC4W/kRTBfWztx09uuvjs4DqFX/?=
 =?us-ascii?Q?31JO8Ss2DYVPBMMoVNHh2qw5zU6dNCeoW1tLbWkb60j2j+fukiQdNxTusUw5?=
 =?us-ascii?Q?YD98I23zf4mZeCkLECQNEu5DIiwMo/TbbZIVFr2/vW+rfmoQ6nZEz6kRDnHP?=
 =?us-ascii?Q?7SpeOUZfdHNEC/mPmTH6Hb50m3BkvIlK?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(35042699022)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:16:48.9875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 120800cd-23ab-449d-0d85-08dcdc713ce0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8262

Hi Julien,

Thanks a lot for the review.

> On 22 Sep 2024, at 11:07, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 19/09/2024 14:19, Bertrand Marquis wrote:
>> Store the list of ABI we need in a list and go through the list instead
>> of having a list of conditions inside the code.
>> No functional change.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  xen/arch/arm/tee/ffa.c | 61 +++++++++++++++++++++---------------------
>>  1 file changed, 30 insertions(+), 31 deletions(-)
>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>> index 7c84aa6aa43d..7ff2529b2055 100644
>> --- a/xen/arch/arm/tee/ffa.c
>> +++ b/xen/arch/arm/tee/ffa.c
>> @@ -74,6 +74,24 @@
>>  /* Negotiated FF-A version to use with the SPMC, 0 if not there or supp=
orted */
>>  static uint32_t __ro_after_init ffa_fw_version;
>>  +/* List of ABI we use from the firmware */
>> +static const uint32_t ffa_fw_feat_needed[] =3D {
>> +    FFA_VERSION,
>> +    FFA_FEATURES,
>> +    FFA_NOTIFICATION_BITMAP_CREATE,
>> +    FFA_NOTIFICATION_BITMAP_DESTROY,
>> +    FFA_PARTITION_INFO_GET,
>> +    FFA_NOTIFICATION_INFO_GET_64,
>> +    FFA_NOTIFICATION_GET,
>> +    FFA_RX_RELEASE,
>> +    FFA_RXTX_MAP_64,
>> +    FFA_RXTX_UNMAP,
>> +    FFA_MEM_SHARE_32,
>> +    FFA_MEM_SHARE_64,
>> +    FFA_MEM_RECLAIM,
>> +    FFA_MSG_SEND_DIRECT_REQ_32,
>> +    FFA_MSG_SEND_DIRECT_REQ_64,
>> +};
>=20
> NIT: As we are creating an array, could be take the opportunity to provid=
e a name for each feature (we could use macro for that)? This would make ea=
sier for the user to know which feature is missing.

In fact those are not "features" per say but ABI we need to use with the fi=
rmware so maybe i should first rename the variable to say abi instead of fe=
at.

Now we could create some features out of those as in practice several ABIs =
are needed to be able to use one feature (for example notifications support=
 require the INFO_GET and the GET).

In your mind you wanted to have something like:
"Version", FFA_VERSION
"Direct Messages", FFA_MSG_SEND_DIRECT_REQ_32,
"Direct Messages", FFA_MSG_SEND_DIRECT_REQ_64=20

So that we could print a more meaningfull name or would you be ok with just=
 printing "FFA_MSG_SEND_DIRECT_REQ_32" ?

>=20
>>    /*
>>   * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
>> @@ -112,20 +130,9 @@ static bool ffa_get_version(uint32_t *vers)
>>      return true;
>>  }
>>  -static int32_t ffa_features(uint32_t id)
>> +static bool ffa_feature_supported(uint32_t id)
>>  {
>> -    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
>> -}
>> -
>> -static bool check_mandatory_feature(uint32_t id)
>> -{
>> -    int32_t ret =3D ffa_features(id);
>> -
>> -    if ( ret )
>> -        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing: error=
 %d\n",
>> -               id, ret);
>> -
>> -    return !ret;
>> +    return !ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
>>  }
>>    static void handle_version(struct cpu_user_regs *regs)
>> @@ -529,24 +536,6 @@ static bool ffa_probe(void)
>>          goto err_no_fw;
>>      }
>>  -    /*
>> -     * At the moment domains must support the same features used by Xen=
.
>> -     * TODO: Rework the code to allow domain to use a subset of the
>> -     * features supported.
>> -     */
>=20
> You removed this TODO but I don't think it was addressed. Can you clarify=
?

Right this should only be removed with the next patch when we add fine
granular call support. I will readd it here and remove it in the fine granu=
lar patch.

>=20
>> -    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
>> -         !check_mandatory_feature(FFA_RX_RELEASE) ||
>> -         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
>> -         !check_mandatory_feature(FFA_MEM_SHARE_64) ||
>> -         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
>> -         !check_mandatory_feature(FFA_MEM_SHARE_32) ||
>> -         !check_mandatory_feature(FFA_MEM_RECLAIM) ||
>> -         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>> -    {
>> -        printk(XENLOG_ERR "ffa: Mandatory feature not supported by fw\n=
");
>> -        goto err_no_fw;
>> -    }
>> -
>>      major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT)
>>                   & FFA_VERSION_MAJOR_MASK;
>>      minor_vers =3D vers & FFA_VERSION_MINOR_MASK;
>> @@ -555,6 +544,16 @@ static bool ffa_probe(void)
>>        ffa_fw_version =3D vers;
>>  +    for ( int i =3D 0; i < ARRAY_SIZE(ffa_fw_feat_needed); i++ )
>=20
> This is an index, so please use unsigned int (even though it should techn=
ically be size_t).

Ack

>=20
>> +    {
>> +        if ( !ffa_feature_supported(ffa_fw_feat_needed[i]) )
>> +        {
>> +            printk(XENLOG_INFO "ARM FF-A Firmware does not support 0x%0=
8x\n",
>> +                   ffa_fw_feat_needed[i]);
>> +            goto err_no_fw;
>> +        }
>> +    }
>> +
>>      if ( !ffa_rxtx_init() )
>>      {
>>          printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");
>=20
> Cheers,

Cheers
Bertrand

>=20
> --=20
> Julien Grall



