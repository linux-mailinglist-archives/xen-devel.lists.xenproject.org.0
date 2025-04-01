Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06EEA77595
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 09:47:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933560.1335480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzWK6-0007AO-Ut; Tue, 01 Apr 2025 07:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933560.1335480; Tue, 01 Apr 2025 07:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzWK6-00077g-R6; Tue, 01 Apr 2025 07:46:14 +0000
Received: by outflank-mailman (input) for mailman id 933560;
 Tue, 01 Apr 2025 07:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hrmQ=WT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tzWK5-00077K-2z
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 07:46:13 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60bc27f2-0ecd-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 09:46:10 +0200 (CEST)
Received: from DU2PR04CA0238.eurprd04.prod.outlook.com (2603:10a6:10:2b1::33)
 by DU0PR08MB7461.eurprd08.prod.outlook.com (2603:10a6:10:354::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 07:46:05 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::6e) by DU2PR04CA0238.outlook.office365.com
 (2603:10a6:10:2b1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.53 via Frontend Transport; Tue,
 1 Apr 2025 07:46:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 07:46:03 +0000
Received: ("Tessian outbound eb3c789b7dfa:v604");
 Tue, 01 Apr 2025 07:46:03 +0000
Received: from Le8c4b34ada3b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 44EF0E72-95BE-411A-AA80-3C23C3D11C16.1; 
 Tue, 01 Apr 2025 07:45:56 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le8c4b34ada3b.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Apr 2025 07:45:56 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VI0PR08MB10426.eurprd08.prod.outlook.com (2603:10a6:800:20d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 07:45:53 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 07:45:52 +0000
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
X-Inumbo-ID: 60bc27f2-0ecd-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XAmTR3FOhGUikYzq9mojtKQEHHdgwc4rjJdWUb2hMB2eDgMEbjzCWvECm6viy3nDnVq9u7E57oM1jB9s4LLdDxQaurkX+npxwx4e5m+rLmWN+zJKQqfiLQzVpz6h9msUPv3V23g/HSJVBXuV+t27SdiCaJMJwkhxdaLa3nnI31JVqjHudpeDMzQllFIGObzdbQwqY/BUz2x3badDJuh93uGKtqjOJJmKk/qk1BS0T8E5hzJ0+bIPgPAW7W71DroJl4TN38emvPyLxyOUM25xP5VespnMSTeFGDLQDFggzUJzV2i91ORQpv535zxa+YLEg1XiS+lvnyAJ/GaBBiK0VA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LygCG9fwK/L9LXwvWXAWI159V+0t6R493yF13OMpwCY=;
 b=scXsXHlCbqdmmM5pbZqzPqbx6hwMOPYGSNRyeIj7Xv/Mib28hDXwq/ArdNCfRbnEKglfHr7ZU1GqaYkIIXRxU7u+D5tz3lU4dUEcnTDnKqLT0GW/hPbFIq+UNCwBWqAiWbGc8TqCez1Fa7+Vuy0E5rbiPNUzqajxButIaCQM3qkA7sWEoBexA1lnTEihhPjeurpeTBktnUUqkqGoDm9jNLeF1Q9zvfdE/fJHQp/5wtRvcu3tIQAGx88bOjC/zjOWQERVANvfQ5kxi5QYOX05wYjeyq4kWsFtFOr1oBKMhO1bTFgAtPy1sdXxZbOR673vxx0lyEvavX7cphewzyDVhQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LygCG9fwK/L9LXwvWXAWI159V+0t6R493yF13OMpwCY=;
 b=rVeZSKIzTfAmCvKzsoClYG9rDL4qoYW77DD/OYBZlUlKNnq9zbj3aeU9tNss7NxTCiYWeqX/VRyhDYMWMCcp7xlg42O2xG9aH8gGdAnalRdT+TdzKI3WEZyzVIc2dU385Wv/Vh/90Hhyy6KNMhNTn0xlhPA3CjYyr8tXs7RDPGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ded4d8ad8960e0b7
X-TessianGatewayMetadata: d/X+zuIyFpMMMsXhmTcw3KeHvwvp0WimGHsEt1jaut3zwTNF8J5PzXOdIrPZQTh+GfJjw62PopOt7TH4IgkcXvH4rHmKK1OJe2TssxYzBp92HOH+mwHlotIsD6seCDpbTRmXYneVJMBP7ng7Tfglq4vZGFQpsuKS/nQl+6OuZCs=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkSpUJM3BBWF5741O0SXOd7sx4NxTE5a+oToCdF9NXI/o9XAerwr+BBiGeb+1mWSdV8JMbfDjgXdqaah2niesmXmcSaUqZsk6b7KtXveGmOYccdSr/LsyyRUQ6GN5JWV+hXBkht4ZqwwMzcnuGJZbJB3eWNr0/pQVJyH4BKfRDtSnofhLk0oxNbD/FYMo1aNFotLiD9pLcnFhVDIfqhtLyMg35YjlZBk0i3u9OWRkb28fq7GXUcHbzgtdBDNktGE0sgzjZbdpVQIYObTCexjD2oBP/x1kBCSloGjrfuuSaSbOXRpzi57o5noWHYer6d2jmdb79vSHpfO61/9F+4YVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LygCG9fwK/L9LXwvWXAWI159V+0t6R493yF13OMpwCY=;
 b=SrC//G6lckOYuBK09+pkNVZ8bcM0U/327CIQUuzG4guW6Umjz2bKC1P9YXifQy6MGloPP7DN2Oy5wYiq9AV+lvsnwsEmAv69eK3JXw8TsO848PxxjvDn0Banb3dMWzfnJqAuxUUIp9nvugWPlmY7cN8r/pEJeeya3Rs3cRCJmk4MIrSA0Ivh7H29CBvYVFj+3cHMAO4UfbF76ULeFSRLeZYYFhy2WGPjdnhfXHjFZF/7nSbfKQtoOCjbSITXLZSB8o6ExoAKbUcjs9JPRKeO37wlrum13aPipUGwsFjDISRNPH6EKdSHFm4Ti5Ka7JNNNOfD1MRwLWNkUkWYNf5WBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LygCG9fwK/L9LXwvWXAWI159V+0t6R493yF13OMpwCY=;
 b=rVeZSKIzTfAmCvKzsoClYG9rDL4qoYW77DD/OYBZlUlKNnq9zbj3aeU9tNss7NxTCiYWeqX/VRyhDYMWMCcp7xlg42O2xG9aH8gGdAnalRdT+TdzKI3WEZyzVIc2dU385Wv/Vh/90Hhyy6KNMhNTn0xlhPA3CjYyr8tXs7RDPGM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 2/5] xen/arm: ffa: Introduce VM to VM support
Thread-Topic: [PATCH v4 2/5] xen/arm: ffa: Introduce VM to VM support
Thread-Index: AQHbnMQnVQCSJAleWkGtVlVLXLrx+bOGED+AgACZt4CABZFtgIACPzcA
Date: Tue, 1 Apr 2025 07:45:52 +0000
Message-ID: <46C42C5C-00C3-4706-8A35-CA0FF1DA5DA7@arm.com>
References: <cover.1742824138.git.bertrand.marquis@arm.com>
 <8f0928b4e94b47d6fed201dcd8cfb1068573b297.1742824138.git.bertrand.marquis@arm.com>
 <338d8982-0a2e-4a40-a9a2-bed8f50d81e1@xen.org>
 <90051748-EA8A-4657-BCE1-EEDD1C4D080B@arm.com>
 <b8f70df9-0004-4733-b73d-33dea2bc37cf@xen.org>
In-Reply-To: <b8f70df9-0004-4733-b73d-33dea2bc37cf@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VI0PR08MB10426:EE_|DB5PEPF00014B9C:EE_|DU0PR08MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 398599fd-4020-42ec-7ca2-08dd70f14139
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?VmwF7Bdzl52bGiPKL/t6kT/t01SbJiQp7FO1y5Bv9JsNftS4bOnDXquAFyYl?=
 =?us-ascii?Q?wpgDzTjcHMFXZ+eHQE63H3xJEtw4tO4YQ4b7Jb2c9HH+e9c9EZoFdOyL2upl?=
 =?us-ascii?Q?Bhe29T+/iaV44V4EGX2e0+HSeZdHQa44S0MNsCiIERFWbCnC5+UWHZNZgotY?=
 =?us-ascii?Q?CbHhvi8wYfBCeb/qIEUxV2n9hV+oL9+GLAwUrDKgeInfK7UNhHo8dOhj6oFW?=
 =?us-ascii?Q?sO6PxlCpHO09UtYnfp5p7ouiX24QSavcHhbd6jDVV7l5QcNvRLSMApPUhU7/?=
 =?us-ascii?Q?cFmx/56IKqULCzcsnHB5nNQHq+iwxzurr2Ty2F8EONyB3nNHIX73SOxgVOBn?=
 =?us-ascii?Q?/LgiLyxIok9V+qId6D97FPwrd2CsXVHk9TlGTkn9Fh6atM/D2enLHJtKegVI?=
 =?us-ascii?Q?aSW6KB2E+IfqJAruGgezcGHcSVNQVgAEgDZurcfGbgjHPtL3W459rS+q5JlT?=
 =?us-ascii?Q?dl4JIkUdJlnX8Uvpl+VXFeok2kL0nQWoXg3QOUxrm9WeKRB7E1scB4lRww5/?=
 =?us-ascii?Q?kas0EFnrEPjGD5NE4rkvxSdIV7UCgZZgQ0BCxisRSdDKLDHYkV9PsFY/v//F?=
 =?us-ascii?Q?v7uh0MlOOJhSSIOy19yimFYkKmhJjz6BFnUYhd9UGuoAhziTph/+RI2qtgQH?=
 =?us-ascii?Q?9hTmnG6FZQcE0cvy/kE74jVLU8IV6lvCalnF1PfHyJ1fRlENl9K78mklP0o4?=
 =?us-ascii?Q?/KbcahG0IWNVEUKBVTnTvvXqDJcyuHfOHIweL1I1ECGNsVbX7rON7RXaYF88?=
 =?us-ascii?Q?DAeLks1RGSBg2kiHv5I1rB1RsdyVUxAJej8YaIRUHPvGo4YmviuTFhwVdc99?=
 =?us-ascii?Q?r6WChkeq0iKDL22FzNMb0Ndo4cwQSsctS7fWw+F1DfCvEO9bQ2BOCoQUJ8ln?=
 =?us-ascii?Q?UqXe64f+qYZSCd82Wg6MfZjLfsLf3kFzhSYaQFkeMJEvm4Hlq6/Bpcc96CTF?=
 =?us-ascii?Q?oJTRHfxVDwlfVq7yua7bUJsDI0x5l+xFJ0PFbE1BZovYHdxZYdc8V+2RO3jB?=
 =?us-ascii?Q?oxjr8Grc/EN9aExv7aU5t1YaLtWz1cz5qx8/tBwEYkOQUk/7IXvLxyaQHY15?=
 =?us-ascii?Q?i7aktUea8i2oxPHPKv+f7iPzQuV0NRaW7KIz0MMBTfhRvxN6uEYmx/iOGJaC?=
 =?us-ascii?Q?sNd7geV6RongBiD2GWXi9B6MSgOpYUGkkpYrj15BXTsVo7JFm0d2DvKqNcUv?=
 =?us-ascii?Q?finmxYSrBZ63aWvhwY7XPVXPQynEu8CoVpMr4u1SZN0VduV/ER9OsWvKhGNT?=
 =?us-ascii?Q?IIrS6fbqf4TO32UIweoxB+xf5B2gFx/TpkbWlZIWio6ofJB/FT1vzIeblg+z?=
 =?us-ascii?Q?MCBJji8o+WWdVdqHhRKZiewYPiCTxmL1/W3KbENb0Izu6/Wz6Re3/yDtP2m9?=
 =?us-ascii?Q?ioFXJOrgHzsZzaMg6JBCsOmR4gggtbzMfsLK2R+zSR08vpiNerjImcI/q9Lf?=
 =?us-ascii?Q?GhrOWMFIlmfbb83id8JKF/jx1e4CoyGV?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8CD7861C9E199542B6954557D9BE110C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10426
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a53e19c7-6c36-4fec-7180-08dd70f13a84
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|36860700013|35042699022|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c13C+EWlVqXIKwuk3MztqpS5irNo1JKyOcGk4FE1hARVtNA1NOV4EN7Dk1Z2?=
 =?us-ascii?Q?NpNrNrK1B6W7iZzpyFlgaHhnfndYafoAo0HDgm4DcdQq2U+H8YQd9t4VFZJH?=
 =?us-ascii?Q?MDbrWx/mV4FKCKL5a6gcJITgulwTJS7uF8ihtvRKjcGEuDe+2fQQVedls5Iy?=
 =?us-ascii?Q?zV8jhsaOOCf49/e/vhxsZCKCb9g6BNZ/5Bu4PK8FVbQJu3GvuW2lBKBTER8d?=
 =?us-ascii?Q?uxj3otSe1gzEUjta965csRNLgvaPWsgnBH366pBXr2BieFUUng5ZtnebXBUB?=
 =?us-ascii?Q?/jgRxM+997npsTG2WjyhkHEnT4z788mfG8Gn5Igyu8kjc8AkVgrhNLs8f6Ei?=
 =?us-ascii?Q?5TSefAH6R94liZOaJassD7M+FENy9AwBHHo6R2/hmuDxN4KMcPTtlUo0Yg89?=
 =?us-ascii?Q?ylAO1ufc22hq8lA9AgV3QS1Jq5aK8AZa1lkAbcikl0XvxndPOlhubo6ohvWN?=
 =?us-ascii?Q?BXmLq8/UqJKdnbqD03mkv3M/wsh5X8HPei+GQy4JXMLyJhazTq0TqGdsY0Xl?=
 =?us-ascii?Q?4XPDhje2zFJYBPypNaOAG2hyJLSCAHT6Xpi1T95vcX6S0whWkWWj5GxIuziS?=
 =?us-ascii?Q?WuwaXi3mLxfiDgAi4ZZD9rhezxzuajIbn+dk6pSgL8/w4NgffIZ6maANy3Nj?=
 =?us-ascii?Q?QFryrpJahkfAv6mc31rY3fDrj2gSjm3f4b3f8Rpq6ZQTx+V80mqltWkx5osK?=
 =?us-ascii?Q?oqX9200i1wYH7p8/A6Pbpl2v2q7sHjEBgymBSmH2KhtVC8g24sEf+qc4TLq8?=
 =?us-ascii?Q?ErEpZJh/bleVJcGrz6DpFEfiaIlS4cbH9/+WA/CHCsB7/SpMsFQZBx6cktA6?=
 =?us-ascii?Q?wa2BA3pQgeoEkH6y1Uz6pcr3mt73iLhmKUQX3cT+WQSgaJXkneDf9uJe9FeY?=
 =?us-ascii?Q?1QrxXgtGVt5/SComUQKySJPhph7Dly5jQAZPYi7giA5FiBF+LVowhdjWmQjt?=
 =?us-ascii?Q?oMQDQPAKUk6VhSlc3OAj/F30uAzhYf5sVcPK2/LwrkcKXywzSo4Rde5487eY?=
 =?us-ascii?Q?RDdFQ3iq/9Uv9mZb/IOlSPblu1bMOEH5ytupcLw3IOLCXjsYg5MmYCfGKAJd?=
 =?us-ascii?Q?O2EyT1i6Y3IWRW+rpjnmHdPr9guR3T1tLzWIZZFe4nmFVTn6qxI79z8/RQNN?=
 =?us-ascii?Q?9XFQqJhpKQhzOzCtD7IJemOfeXPfBvLkKveyc16MRDUqBvfI7BYhbiZWSP67?=
 =?us-ascii?Q?FNA6LvvhUU5QBfhyVWbF15EPtXw+OLGeCNRYEhGOfVYk0RHHSmwV3B5L4Xmh?=
 =?us-ascii?Q?L0+FYQ/Vdhut7qUtuQwDrZdqm5sFPcQKnpjyVPuuIG6h1jQ51DG0/zVlO41p?=
 =?us-ascii?Q?XOxICqOfpQVtCQLrIIAaTEUx05I6LFoFU1QcC2p3m+bgR1rG//1iTX7afKA7?=
 =?us-ascii?Q?aZij2Ze2jeBF4nTgjoSqAqaNv6VZf8+55/lGN0+uO/Ew6x7+SCdv3UFfnzjM?=
 =?us-ascii?Q?keMQR/3XYF8DhUSlv8ZOjLJBP1NNDRa2lZtem9uM0hdxSnxwmcoERhbty4ES?=
 =?us-ascii?Q?oAu43jKkh9IlXuc=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(36860700013)(35042699022)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 07:46:03.9569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 398599fd-4020-42ec-7ca2-08dd70f14139
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7461

Hi Julien,

> On 30 Mar 2025, at 23:26, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 27/03/2025 08:25, Bertrand Marquis wrote:
>>> On 27 Mar 2025, at 00:14, Julien Grall <julien@xen.org> wrote:
>>>> +static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count=
,
>>>> +                                   void *dst_buf, void *end_buf,
>>>> +                                   uint32_t dst_size)
>>>>  {
>>>>      int32_t ret;
>>>> +    uint32_t src_size, real_sp_count;
>>>> +    void *src_buf =3D ffa_rx;
>>>> +    uint32_t count =3D 0;
>>>> +
>>>> +    /* Do we have a RX buffer with the SPMC */
>>>> +    if ( !ffa_rx )
>>>> +        return FFA_RET_DENIED;
>>>> +
>>>> +    /* We need to use the RX buffer to receive the list */
>>>> +    spin_lock(&ffa_rx_buffer_lock);
>>>> +
>>>> +    ret =3D ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size=
);
>>>> +    if ( ret )
>>>> +        goto out;
>>>> +
>>>> +    /* We now own the RX buffer */
>>>> +
>>>> +    /* We only support a 1.1 firmware version */
>>>> +    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
>>>> +    {
>>>> +        ret =3D FFA_RET_NOT_SUPPORTED;
>>>> +        goto out_release;
>>>> +    }
>>>> +
>>>> +    for ( uint32_t sp_num =3D 0; sp_num < real_sp_count; sp_num++ )
>>>=20
>>> What's the upper limit of real_sp_count? Asking just in case we need to=
 handle preemption.
>> In theory that would be 32k but in practice the number of entries we can=
 receive is
>> limited by the size of the exchange area we have with the secure world.
>> This area is currently defined to be one page and each entry is 8 byte i=
n the
>> case where firmware is 1.0 (24 bytes otherwise).
>> This is an upper limit of 500 entries.
>> Now I do think this is completely unrealistic to imagine a secure world =
with 500 SPs
>> so If you are ok I would rather define an upper limit in Xen (I would sa=
y 64 SPs) that
>> can be changed in the code (through a define).
>> This call currently does not support preemption in the FF-A spec (and th=
at is something
>> i will check for future versions) so I would have no solution to "contin=
ue" it.
>=20
>> Would the "define" solution be acceptable for now ?
>=20
> I think the define solution is acceptable for now and possibly longer. It=
 is an easy way to avoid dealing with preemption.

I will do something with a default value of 64 which should fit for now (an=
d maybe longer).

>=20
> [...]
>=20
>=20
>>>> +static uint32_t ffa_get_vm_count(void)
>>>=20
>>> Is this meant to be called often? If so, can we instead have a counter =
that will be incremented when the vTEE is first initialized and then decrem=
ented when the VM is destroyed?
>> As of now we could have a global counter that we increase or decrease
>> when a domain version is negociated and when a domain is destroyed.
>> We could also have some kind of global save of the result to be returned
>> to a guest.
>> But I did not do that because:
>> - cpu time required to update the list would be taken out an FF-A call
>> for FFA_VERSION of a VM which would require a global lock to protect
>> the data
>=20
> I would have thought an atomic counter would be sufficient. Is there anyt=
hing you had in mind?

Very good idea. I only need to increase it when an FFA_VERSION has been
negociated and decrease on VM destruction.

I will do that.

>=20
>> - when we will have filtering the data will be per VM (which would make
>> the initial update more complex)
>> - incoming we have a notion of UUID and filtering depending on the
>> requested UUID which will make the global value only useable in a
>> limited number of cases.
>> I have 2 pending series on top of this one which would have to remove
>> such optimisations.
>> At the end this is definitely not something supposed to call often (linu=
x
>> driver is calling it once during init).
>=20
> I think it was a mistake for me to asked whether this is called often or =
not. When it comes to security, what matter is whether a malicious guest co=
uld indirectly call ffa_get_vm_count() and delay any work on the pCPU (Xen =
is not preemptible).
>=20
> We don't have to resolve this now. But this will need to be addressed bef=
ore we can we consider FFA security supported. So we should at least add it=
 in the list of issue at the top of the file.

No this is really useful and I will fix it and also the partition info part=
 because:
- all information is read only and known when the VM is created (VM ID, max=
 vcpus and 64bit or not)
- I do not need anything else than that to build the result
- If we can prevent to take a lock this will make the code better.

So I will:
- add an atomic to count the number of VMs with FF-A
- create a chain list of VM FF-A contexts
- add a context to the chain when a version is negociated
- put the infos i need in the ffa ctx structure
- just go through the list to build the partinfo result

>=20
>>>=20
>>>> +{
>>>> +    struct domain *d =3D current->domain;
>>>> +    struct domain *dom;
>>>=20
>>> NIT: "d" and "dom" are a bit too close. Could we rename "d" with "curr_=
d"?
>> i will go with curr_d dest_d to make this clearer.
>>>=20
>>>> +    uint32_t vm_count =3D 0;
>>>> +
>>>> +    /* Count the number of VM with FF-A support */
>>>=20
>>> This comment implies this is including the current VM. But ...
>>>=20
>>>> +    rcu_read_lock(&domlist_read_lock);
>>>> +    for_each_domain( dom )
>>>> +    {
>>>> +        struct ffa_ctx *vm =3D dom->arch.tee;
>>>> +
>>>> +        if ( dom !=3D d && vm !=3D NULL && vm->guest_vers !=3D 0 )
>>>=20
>>> ... here you are excluding it. Also, it sounds like this is support by =
the OS rather than the VM itself. Is that correct?
>> I have a comment to explain that one in a different serie that i will pu=
t here.
> > > Basically before 1.2, the spec was a bit blurry on if or not the resu=
lt should include the
>> calling VM and in fact Linux driver (before 1.2) was ending with an erro=
r if its own data
>> was included in the result hence this filter.
>=20
> Thanks for the clarification. Just to clarify...
>=20
>> I will add a comment for that.
>=20
> ... will the comment be added in this patch?

Yes i will add the comment in the next version of the patch.

>=20
>>>=20
>>>> +            vm_count++;> +    }
>>>> +    rcu_read_unlock(&domlist_read_lock);
>>>> +> +    return vm_count;
>>>=20
>>> OOI, I guess this value is just used as an hint? Asking because the num=
ber of domains can change at any point.
>> Definitely yes. The data is what it is when called but anything could ch=
ange after.
>> This is mostly used as hint by callers.
>=20
> Does this mean we would always return a fixed number? Asking because this=
 would solve nicely the preemption problem in ffa_get_vm_count().

Well the number is changing when VMs are created or destroyed but as explai=
n earlier i will modify the design to prevent the lock
using an atomic and a chain list.

Now the problem of the potential high number of VMs still stand so I will a=
dd a todo for that and discuss with others to check if this could be solved=
 in the FF-A spec in the feature.

Thanks a lot for the comments.

I will work on v4 for when you get back :-)

Cheers
Bertrand


