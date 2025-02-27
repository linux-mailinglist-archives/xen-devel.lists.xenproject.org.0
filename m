Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF9CA4865D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 18:15:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898318.1306886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnhUB-0002Ra-2C; Thu, 27 Feb 2025 17:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898318.1306886; Thu, 27 Feb 2025 17:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnhUA-0002P0-VR; Thu, 27 Feb 2025 17:15:46 +0000
Received: by outflank-mailman (input) for mailman id 898318;
 Thu, 27 Feb 2025 17:15:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYXr=VS=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tnhUA-0002Ou-1a
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 17:15:46 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20602.outbound.protection.outlook.com
 [2a01:111:f403:2607::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a2aab4f-f52e-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 18:15:44 +0100 (CET)
Received: from AS4P190CA0039.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::12)
 by VI0PR08MB11061.eurprd08.prod.outlook.com (2603:10a6:800:257::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 17:15:38 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::74) by AS4P190CA0039.outlook.office365.com
 (2603:10a6:20b:5d1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.21 via Frontend Transport; Thu,
 27 Feb 2025 17:15:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Thu, 27 Feb 2025 17:15:37 +0000
Received: ("Tessian outbound bc832f6acacf:v585");
 Thu, 27 Feb 2025 17:15:37 +0000
Received: from L80c881cc5388.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BB25A6FC-113F-4745-A067-621A4A728050.1; 
 Thu, 27 Feb 2025 17:15:30 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L80c881cc5388.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Feb 2025 17:15:30 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAWPR08MB8839.eurprd08.prod.outlook.com (2603:10a6:102:338::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 17:15:28 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 17:15:28 +0000
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
X-Inumbo-ID: 7a2aab4f-f52e-11ef-9aaf-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Mtx1D+DfyCjjd7VvkZaGbkVagfmDcpzAq3Kb9R3Yvta71YyMptGU7frOWnlIS/daoDKTXRmPxqjhu8ZoJGACFEZGEkWJPyuZHMLVF7M4OJiC/WY0MiFn6QSJkDcoHbmec3jH/4B3z6JWGyNV7BOUzMFSNwxWPmj5idQ0K0s8M1Gf7gA1+NUG5QfJZdk5sEspqNYEoCQ+RW7zHFXiNj03mCjOpT/ISp9hYt3vF6tXfd2M+L9PXpGuYrdCLwIHXKWCqlvL1+q9m5GmxgOf3sXMA6y3ravrflf2ETO4vg9xyJvxha0huBenEiYwgiqApjM2wvTTcBSKaZ8SqFbIBbSwjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfmNHIYQFMe6MV/WsIo1vDK6reoLe4R/aCTzycqNA0Q=;
 b=PRAi4JbXAbqhCLf5rdLDv/R5glYmox/pxY4FbnsnUTTp9sTMF4T4g5tQmjOxlV+zgNJMQLz0LQV/o6rLFhuhZ7zb2QEiS7eGh2/4SIQ0D5xqDqo+bYBPfH8eWEqNIqW/DbAOYr96FAQbtP0h5LsK7hv+tw1wxKw/qeU7WKhijQ29BztpkCxrIAVjC/mXeTXGAXqiSgFm9uSzuFG7lpZMls8iNz1q1bJt/TAHBcWZPKR7e6eJG0MB2BE2VjsubVudc97ksj6uqX424cdai3vp777GGpg3VFw2UNl1TGFBE10NXxFdjjsON4vJEAKd6pur9wqf95i3Ssf2ZLj9MTPhyw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfmNHIYQFMe6MV/WsIo1vDK6reoLe4R/aCTzycqNA0Q=;
 b=LkbCcQ+40vRXCCxot5Kmfp6qJEd/gCVcUilkI0sYdB3uh5zZWgQKTCthWfwcx+kdtzrPvn/vHFxFiFr8xFZIL/dRNiURxP1WX5XeJYfQsC9+rQ5Rni6jQpCaumsJv9Bsnb0Xhb74HqQVdSd5I7dlI3boGtIjDNe8HUZHzr13bnk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4390b8ae6589bac
X-TessianGatewayMetadata: Sc+OHtCpH9OQ4I7cdsEI6KU+V16Z7cG89JnebnQNK09/Z4P9dcJNGza3ZybAbQ02K72QfK2gCa7rH7xDb3I3R5WOQX0yEpnjej+RullOV7m0T8OwLGRMpjANPZsCFANwhikjUItL1T2hCL+YDGi291NQZwOLmDjz3siLwgSIAWA=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbAgCCTjX0dlCNVVYhkUCnYyD+JJUY1RwkHGce7POYeOjHZsGMA1esJUOLrNWiO1HOX++ncCWSIqQM9s4TxgLgDJPVOmc+mEKAqaYI4lZQB2UPtaTFRr2a5nT7GBzsgEsZZ5zxYHwNUa/XjRjf8dr5o6OiGO+BlStCcMwamHQNxHzNgwJR1nCPa3Lf4JG9SPgRPHor3zREitPv8ZlAjdglvoz3GTpPfEbxYzA1d036ZcUHDJZorCPyMDr/xxHkyZg0G1ajTDXNscf1qkHMLRQ7dBqDDHHpWga0753TQZ6uYwxAM8ASYfPFNvi8DBBlrBmzbzk6GALhyekrBWwrIFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfmNHIYQFMe6MV/WsIo1vDK6reoLe4R/aCTzycqNA0Q=;
 b=ihcnXfS1sculyFj4+8CjeHw0kjCnhAFhFU+Trd0bOcKda98DZt2mq+zvCx3O8S7zv9qcaXHyxqNXBWsvyGgl9pXE3fpVhiPedw1p5elvM4oEzAZAOIyjeky0kfp48fTKi+8WeMeDp6Xmq9WclFOlab6VL0xPjpgihN0m878IMaHIN45Q9vYvOcQDvpl2OFBA1HAYmb4AFVWL+Ux3QslYWmPQiH687Rav4GteymxlPPlezb88w3lZnkzFoUX1gGFLFV7JQuBKJLAMVoopk+TNY45WRqUnAXa/zEkwKXBMsCrKFS85GgE1u3pgge/T6DPosJ0Q5F/arGIMUV5IB0JY9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfmNHIYQFMe6MV/WsIo1vDK6reoLe4R/aCTzycqNA0Q=;
 b=LkbCcQ+40vRXCCxot5Kmfp6qJEd/gCVcUilkI0sYdB3uh5zZWgQKTCthWfwcx+kdtzrPvn/vHFxFiFr8xFZIL/dRNiURxP1WX5XeJYfQsC9+rQ5Rni6jQpCaumsJv9Bsnb0Xhb74HqQVdSd5I7dlI3boGtIjDNe8HUZHzr13bnk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v2 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Topic: [PATCH v2 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Index: AQHbiSmfhnajI8fAUU6893mrw5oGSLNbZAUA
Date: Thu, 27 Feb 2025 17:15:28 +0000
Message-ID: <636358F4-C156-4304-9C75-A8DF36E16F2E@arm.com>
References: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAWPR08MB8839:EE_|AM3PEPF0000A793:EE_|VI0PR08MB11061:EE_
X-MS-Office365-Filtering-Correlation-Id: 5028b3ed-034a-40cf-a53e-08dd57525aa2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?kNPcU/sP74Rsyqc2WvgyUSGTQzO0OeDoU98soqytkIucbhy3AkLo3uvkScqc?=
 =?us-ascii?Q?7M2jelf8fkrGyorKBjw6/4QNrvNxVSNxzlOUyEVmP5d0e1GINCHFo4kCysMQ?=
 =?us-ascii?Q?KNVtOFWPlL8NMWM1pFdW7+q0DTl8JA+BtCycxWB2yp3dkZpwLoP/QZZxvdf3?=
 =?us-ascii?Q?uzV6T8wLWt4aEw9Q56wFcSdxqDtIRX4hlt8+EhB9oFRsOWZe2U71efHXlZhJ?=
 =?us-ascii?Q?SYrWuXQRa50VYDlw/8ZvURN6WWE0ZsW8oU/8sDs5M7KfGrEh1E4JtTCvyZHW?=
 =?us-ascii?Q?9c9zWPFuVtD3uxbpuf7krJI3ZkVw/l32/fsqtQyni/EB/dZwWzk/8vYhvCOL?=
 =?us-ascii?Q?jERJBDqVocqN4xZfCjvkTq35E0DFCjxiqlgJSJNjJhYXFMNoa2guKP5qAT2C?=
 =?us-ascii?Q?sz5hCFtFNnjwZyc2XB/ZPSepb8ffcBerDjq78CVaJnPdeJkPbX3MLGSF7ZNg?=
 =?us-ascii?Q?6dDJYsv3AeynXWL7HXceVcdoBsZ7Kl6VgUWEgU+7r9BsVck7tMfkI4dHd1OU?=
 =?us-ascii?Q?IB6tLQBZNIPgllvRwRedsqUUi/3cnBs+8vN6jYeKZ9w13p5RjoJ0KKiI+je0?=
 =?us-ascii?Q?wzxwLLYyvz8rcqKJRx4SDqpi4uo3B9JwDrOI3ewHTFxL7Oi/KxZsYJZqOUGF?=
 =?us-ascii?Q?/FdhSuMMnH+YCD8fNT42uY48Bx4ljtVDcMd77/2Kec3bwb4J8Gk/YhpElD0F?=
 =?us-ascii?Q?C52AIxmX9z4Cz4I/mHoTg0PkAkyrp+3ED1tHhY7WOPQ46wm0gEmR5wRQ4YIJ?=
 =?us-ascii?Q?TXu+2VvlaC+pxGbQEFWeAR05WWVdelObZO0Uph+gnPLMC2+7tBef0P+OZGbG?=
 =?us-ascii?Q?TLSML8y0BNUgqZTraIowhzJA5oyW++/74DGKqyrWXVJNybvNNBB1W6DaF/to?=
 =?us-ascii?Q?YZJP0wtM4opQMRTJRYntim6cEDAwYuHzUrnNPtJ/moPBI8k818s8uh/O/5C5?=
 =?us-ascii?Q?GU4SKcTBDHssdCUG12aOobHL8J7M+qNzkKyjJi/2zRSQABjfIntdhsnNBVss?=
 =?us-ascii?Q?IMqSSV3zdJUZZ7RJWCapyZXS6qR30bekgWDmfM2uUyMGP39Trz6JtYT89c0p?=
 =?us-ascii?Q?w7CTDN2T8YpCSnEeKLaIt207JM9UgsRMuz0IvN5h3y5I62zDJliH03NfZxQ1?=
 =?us-ascii?Q?yALEnfc96O+tpTPAo0nPxFXIUAx7PJxmI2OWlgH3SycjTjuxo8D7v9B9Vkfq?=
 =?us-ascii?Q?tIIfxSbVxSZfkNTSxdTChWUbONNG6G5+kzxvosWFSp6fkwCYL/scO6vHYGez?=
 =?us-ascii?Q?QcK1YhtNjrcm5d13NRLxJFaqqhQ+pUcPYFj39rHlIWl9LwM+ripiRBUwyukZ?=
 =?us-ascii?Q?hEFBHw5dFgdxPq2c8Gr322XtukgzrPvg6r1NxSIl2WxKujVQLmEeQPtq2j/W?=
 =?us-ascii?Q?VVehdFmagB1UCLXgrh5yeuNV/X7NW/jdMSXxdFwTyHmlSDdh+A=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5BD8A8D2275CD74F8CB12298975F62DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8839
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	85699a49-f6ab-4982-f454-08dd57525552
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|35042699022|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mNtsIEnUdf0RoHc/TE/nSrCBnp7r4+oegUzY5snfjd8fU0qUetX4l2TXcn4l?=
 =?us-ascii?Q?CNKzC3SKj2+SBENwpCaOSwetnpx0X21IVXqhimzA+bdOY9VKnxKIR+JA8cGM?=
 =?us-ascii?Q?M8SW/EUJ1tMt1j/QaYnsB4RxOA6rro0e0z0jrF/VWZ0nxvFv46pUsiQqR7Jb?=
 =?us-ascii?Q?fJvUM0efDQkuFc3Qatg7ferRnTatlF6kA+dypBvIl41zTalogZ40kYjnMaC4?=
 =?us-ascii?Q?s4hLpHvpe6SjyW7Dn4xmllmQVkkhI1oRnBEUTY/khp2vAlzHWcVlqT5jkNTs?=
 =?us-ascii?Q?NwTs9i3DbFhp+du9XejXs+fNY4QtsK0DK/ZSsKR2qGWe+o5amRtRR5RtuPT7?=
 =?us-ascii?Q?ZtuD1yeWDRcIHYf9pMrGSBqyzrbaNd8FjQ08VpUexGbUdmesEugc3kaGNQ6a?=
 =?us-ascii?Q?D+bbqT/kG6CrTIAceWzJ2v65VrqAhDBvWpKtVyNDofHzODZtSgdUhXJHNIVh?=
 =?us-ascii?Q?beIbDQW4tFzfc6fiTpqLkhRFpTKWDJgGR/2HEbtrVW1vPxmcGf/0PlUTMQtD?=
 =?us-ascii?Q?nePTgd61nSz3b/OGrB0E3DY7uCIlhE11mC5Ynqa4/rjMwg7xSVBtrZ3jgGrk?=
 =?us-ascii?Q?tETJiqUXIJvlGj9Kp73jo42QGtEDr7o26IFOsO7zIv80dJ2Yr+1i+wVQjL4l?=
 =?us-ascii?Q?bNRcUjxeDkfNiGd4yudsHjl1Opw0xqWWj7fU+S8kp6Li/wOs03s3bZmHL0rM?=
 =?us-ascii?Q?L+2MYwRYpmW0QBs7Up7+KcJKoZAMLakVszL85Zb8nuVhgvhaXOVTd1Puq/nC?=
 =?us-ascii?Q?TFEFp0c125jMgDZ53Mm0lJJOTIg6NFxVwgOtMKvTxwSnzdOZ1XLnYX1bLtP/?=
 =?us-ascii?Q?YVA4ZjDOc78qlokwqNZ/KxBiItT1wCtNdadoQ6DkPACZ/x6568RX4vFYDu4+?=
 =?us-ascii?Q?RLTt/Vz2psBt93jbegymu/apP0a9VeY9H1N4oOiZKScBu/vGbosjsubKTCdi?=
 =?us-ascii?Q?L8CW91QhJYnJXGmecJCDc07D1dWtv8SGTlfoJGiD77O2B0tE4MokF/LKGQf7?=
 =?us-ascii?Q?Adwn4/Rx3O7XdtfQJ0RYmsDPH55TDx5XneTQCx0ZyVM+p1fca4JrdfL1GODG?=
 =?us-ascii?Q?sNqwNVsuutR1/kLCU7BpYtph22es/1LPYNNyxDY9pOfyNTcxH+NY9tj4OIG1?=
 =?us-ascii?Q?psiTYX9R7bFBRamy1h/dsBgJ5SoNCjM4heY+8Q4UVgAFPj2ipk7XIKb9+rCn?=
 =?us-ascii?Q?+BC49tCa/Xy5kQQtc20gw6J5ZzLfdzzWfdESh5y5fLOBwqFeTVHzFY//GVa1?=
 =?us-ascii?Q?6rNcix1wQgvexl24sM5jNVG8+ZeK6uD+LmRtJJB2CyNUzlLQJGyLwsSVL1cS?=
 =?us-ascii?Q?vdk61y0LOMsjGpT6sRP+DxFiDlzuZNbaO9YOu17aM4WIo6PHfHYHNK0xJGwT?=
 =?us-ascii?Q?doLzdST7vZ8N7+TsVBSnocIkb0buf6HSGahbbqB/dUld9di+TjUcoa4/7kjb?=
 =?us-ascii?Q?1MrFLR5CRKnIZdbjw1LzObUdylhlK02r?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(35042699022)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 17:15:37.5240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5028b3ed-034a-40cf-a53e-08dd57525aa2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11061

Hi Ayan,

> On 27 Feb 2025, at 16:09, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> In the current patch, we have defined the requirements which are common f=
or
> all the commands.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
>=20
> v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does not=
 return
> 0 for success in all the cases.
> 2. Reworded the requirements so as to write them from Xen's perspective (=
not
> domain's perspective).
>=20
> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 55 +++++++++++++++++
> docs/fusa/reqs/index.rst                      |  2 +
> docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
> .../reqs/product-reqs/version_hypercall.rst   | 61 +++++++++++++++++++
> 4 files changed, 134 insertions(+)
> create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/r=
eqs/design-reqs/arm64/hypercall.rst
> new file mode 100644
> index 0000000000..ffd883260c
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> @@ -0,0 +1,55 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Hypercall
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Instruction
> +-----------
> +
> +`XenSwdgn~arm64_hyp_instr~1`
> +
> +Description:
> +Xen shall treat domain hypercall exception as hypercall requests.
> +
> +Rationale:
> +
> +Comments:
> +Hypercall is one of the communication mechanism between Xen and domains.
> +Domains use hypercalls for various requests to Xen.
> +Domains use 'hvc' instruction to invoke hypercalls.
> +
> +Covers:
> + - `XenProd~version_hyp_first_param~1`
> + - `XenProd~version_hyp_second_param~1`
> +
> +Parameters
> +----------
> +
> +`XenSwdgn~arm64_hyp_param~1`
> +
> +Description:
> +Xen shall use x0 to read the first parameter, x1 for second parameter an=
d so
> +on, for domain hypercall requests.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_first_param~1`
> + - `XenProd~version_hyp_second_param~1`
> +
> +Return value
> +------------
> +
> +`XenSwdgn~arm64_ret_val~1`
> +
> +Description:
> +Xen shall store the return value in x0 register.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_ret_val~1`
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index 1088a51d52..d8683edce7 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -10,5 +10,7 @@ Requirements documentation
>    market-reqs/reqs
>    product-reqs/reqs
>    product-reqs/arm64/reqs
> +   product-reqs/version_hypercall
>    design-reqs/arm64/generic-timer
>    design-reqs/arm64/sbsa-uart
> +   design-reqs/arm64/hypercall
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> index 2d297ecc13..0e29fe5362 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -79,3 +79,19 @@ Comments:
>=20
> Needs:
>  - XenProd
> +
> +Version hypercall
> +-----------------
> +
> +`XenMkt~version_hypercall~1`
> +
> +Description:
> +Xen shall provide an interface for the domains to retrieve Xen's version=
, type
> +and compilation information.
> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fus=
a/reqs/product-reqs/version_hypercall.rst
> new file mode 100644
> index 0000000000..03221f70c3
> --- /dev/null
> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> @@ -0,0 +1,61 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Version hypercall
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +First Parameter
> +---------------
> +
> +`XenProd~version_hyp_first_param~1`
> +
> +Description:
> +Xen shall treat the first argument (as an integer) to denote the command=
 number
> +for the hypercall.

You speak of argument here and parameter earlier.
I would rephrase to: the first argument of an hypercall exception as the co=
mmand number for the hypercall.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Second Parameter
> +----------------
> +
> +`XenProd~version_hyp_second_param~1`
> +
> +Description:
> +Xen shall treat the second argument as a virtual address to buffer in do=
main's
> +memory.
> +

Same here on argument vs parameter.

> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Return Value
> +------------
> +
> +`XenProd~version_hyp_ret_val~1`
> +
> +Description:
> +In case the hypercall fails, Xen shall return one of the error codes def=
ined
> +in http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/include/p=
ublic/errno.h.

This is a very imprecise req as it does not states what can fail and what s=
hould be returned exactly.
Do we want to be that generic ? if yes then this might be a requirement val=
id for any hypercall.

Cheers
Bertrand

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> \ No newline at end of file
> --=20
> 2.25.1
>=20


