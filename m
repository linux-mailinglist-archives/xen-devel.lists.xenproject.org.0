Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6812A48666
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 18:18:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898325.1306897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnhW8-0002yA-El; Thu, 27 Feb 2025 17:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898325.1306897; Thu, 27 Feb 2025 17:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnhW8-0002v5-Ay; Thu, 27 Feb 2025 17:17:48 +0000
Received: by outflank-mailman (input) for mailman id 898325;
 Thu, 27 Feb 2025 17:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYXr=VS=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tnhW6-0002uz-Hr
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 17:17:46 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20602.outbound.protection.outlook.com
 [2a01:111:f403:2606::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2c5e9e2-f52e-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 18:17:45 +0100 (CET)
Received: from AM0PR10CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::26)
 by VE1PR08MB5853.eurprd08.prod.outlook.com (2603:10a6:800:1a5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Thu, 27 Feb
 2025 17:17:43 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::1a) by AM0PR10CA0046.outlook.office365.com
 (2603:10a6:20b:150::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.19 via Frontend Transport; Thu,
 27 Feb 2025 17:17:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Thu, 27 Feb 2025 17:17:42 +0000
Received: ("Tessian outbound 0a056dca8bdd:v585");
 Thu, 27 Feb 2025 17:17:42 +0000
Received: from La69f475ffe87.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0F773DD0-3647-4DAF-834C-3D0D02308E71.1; 
 Thu, 27 Feb 2025 17:17:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 La69f475ffe87.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Feb 2025 17:17:35 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAWPR08MB8839.eurprd08.prod.outlook.com (2603:10a6:102:338::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 17:17:33 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 17:17:33 +0000
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
X-Inumbo-ID: c2c5e9e2-f52e-11ef-9aaf-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=h81RCd7DyeJJ+IgRxEK/eIdG7xNHU3qW2i+hnKgHCnlt25WH0MCu0s3lwRWTNkU1jKRQJwVL5eeYWVfHKLGNTZJrMAB1OhvqjHneI+VUpOWvxGgTGTjs1nTAWN77rZITX6vdEVto3oez/PtCl6CApwbRw3V2NGe1poGT/BXLFyfLYo5Z8ngrG9IDva14lCMhwbkZzXgpXmdpmPSyX98AJBsVG5/d6x0rdb8YnEq7PTJ8t6zzIRf0ihJT1Z/LFGLrK26djYUUpyjhK+7o6ByRAru7Z6iP1Us8ESiE+nxiDSNTmgNhSSi6V7mIUBSx7D8kONQLnbyOFGmcnumBdaWHyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHM2oYanjrMC9McfUk2XdL4TxpRk35Y0gcT+eaaPhwc=;
 b=jG1YVp7zbrEuA+G7CZ/1FRkZpst3bB65+scS6zODQQM1H510UnsWUiM6SDUXgTfDHUYOp0zKVcVMIf2/TyQsoGO1Bzn6fH+qvg53EP8bjX+WIzh7MjIPaR+bNA4jH7RrNmIXpljCt8HaoFMm11lI7wQ5n7H/H4mygGAtOSflY2hx6Bnjxlhwl68chuoeeeKsYmvrikvq07tXLRFXrROMf/9//X0iIaCDNFRKhf+WzRUa6BZ4QfsWyjrn3JkE0XhF4th0pvlk9BPuy0h5AMMv8DD+EKh+JSU6Qk2rv04lIHhflsscQ8+pbOuTE5kJ/0pkuo0cIorccWUCq/6T5PnhsQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHM2oYanjrMC9McfUk2XdL4TxpRk35Y0gcT+eaaPhwc=;
 b=PEUDK4h38fEzQbLYZAajmfHrzDrGkiqWkCmoKyHltiRNBZ9Adxh2hLCb2ukgkuqvkf0AQlFR3X+c5PwhCqoTrtUX10rNuK1ToLYB+vGV5dp6XDe53a/RvCntQnp/phFn38TNK+BBw/G7tqdp3EKDKMqVWOVGdY+ZtfBGragBBwo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4541b7eb01d5b70
X-TessianGatewayMetadata: aKGn3jxic4L/wNHsehAe52IbIwvZW2JiPy/HUX1fQrAbWcwWGDdr4K21I1mWMrjKsO1WWdNFqZHuJkalIRZwAm4sTlnhE17XOKP5Gj9e/67fC4ugpxj0V41CZkAA1+S5olFBHclXy6Bk3Q5ERstDahc91gBfrAaeHq8gsrFT25U=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOckGJURF4U35fn+U1Q2IMSrd9RpJN4eh4ycZc45ZBv496+ioeV/l1b95wULZ1kDZXlrwpkYA9ZvBgjqw3PkDWUw/v6fwwb/w3IdxtG87I6NJuAQ1vjbIncLBa/vCiNZ+gJ81FlvDFrDObokushYfkr+86Ra/I1KgsHYmS2SxrfocCGIsUTBbir6EjaJvv6F4m50jEORW96lg9Zjkvp7sNlVK7esijPcnHG4uiMJhe7DOaB8gICgKT0zFCszHtCNKFoVeGPhZBapJRRPKHdsDYQ9vXQIv0dFcyzzFRrp6IZKTQuGZXvpP5P24Wqhz2qQCaKNveaWpfSsPLRO3YCjTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHM2oYanjrMC9McfUk2XdL4TxpRk35Y0gcT+eaaPhwc=;
 b=s3s6tripB97B4Wt+Ksp2WbxAlC+82mTjTVV7D+Pceb9YAUYaU2JKKx0PbzOCHGNQfvf11rVJD5cJnRotLJ2JWi3digXyfc1GrO/2/yL2OAyicmONshTJSdXcmMxiGQViGGHHVxWQn+9k4ZrqIT1AU5BsKyT2JxO/4mfMxoJWG9hdnfmIVsL2Ta/q/vRJWjCnK8xhxp+TC1edjraWhqH/VGduGMOxxpXhyGid7nuheJLJzEm591B6s4vdZljuCd3Nq91S0Obj37yXxyMOJS7X1Dzydq1hImaKSMzZDAW/EAx5Eo2/SUZ7iQ48ScooCHLqySG/pnnwHEjIlDtCwcbCMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHM2oYanjrMC9McfUk2XdL4TxpRk35Y0gcT+eaaPhwc=;
 b=PEUDK4h38fEzQbLYZAajmfHrzDrGkiqWkCmoKyHltiRNBZ9Adxh2hLCb2ukgkuqvkf0AQlFR3X+c5PwhCqoTrtUX10rNuK1ToLYB+vGV5dp6XDe53a/RvCntQnp/phFn38TNK+BBw/G7tqdp3EKDKMqVWOVGdY+ZtfBGragBBwo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v2 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
Thread-Topic: [PATCH v2 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
Thread-Index: AQHbiSnNfU4QhVvjzkSlPRDbzXvNFrNbZJkA
Date: Thu, 27 Feb 2025 17:17:33 +0000
Message-ID: <D5282A52-3453-4016-9F1B-8508FC37A4AA@arm.com>
References: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
 <20250227150922.3965010-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20250227150922.3965010-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAWPR08MB8839:EE_|AM3PEPF0000A791:EE_|VE1PR08MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: cdd4aad4-1f77-4929-d6c4-08dd5752a54c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?4BZOLXPxM+vUEjLeKPbOo3WwIxfR9vgMXrddANnPDOkFwT7R4SSfWZ0jxXDy?=
 =?us-ascii?Q?+UeH8uzgnt5P2ZuRt4hMsbSUFdIRgkOLldFLiDkoPGZ7eOC3VMUccN1FxZIm?=
 =?us-ascii?Q?KuscvTK75fXTrtTECCXzX05rEMV/TdPHTLUHwnqEr/0zKFBDMuUvBGgq6aJD?=
 =?us-ascii?Q?/SfCiD8yPNSLu4Gnj/Eo4x+LCufCCpiRJJK/wDm6m85uTQ6SMVDJ8EgPHmUI?=
 =?us-ascii?Q?CfIVTTEGyUllARz/zZhyK5QtT8sZe0n0DBsOuWtA6YhvLuFDpZuSX67IBkwB?=
 =?us-ascii?Q?C1SMhdOmiTvkrTZbtiEVPIbHhxQFHMV2ELXWsoGy+Tgsjob8SnNxPaJ8XxJt?=
 =?us-ascii?Q?stRrr1C2sGbAT+fTRmKF3oyZd3ADX/UyMcZHKFTyqVgLuuZmtWbEJwBMLROC?=
 =?us-ascii?Q?8JLVocfwuOm1AuR0eyfRFLxRNxp1nDzLX+TCk2caSfmbxA6oh99xQrEjBZsz?=
 =?us-ascii?Q?0dGIGUVaiyJ2XgzHENp7eRnDhAafYNHM7shKXLTQWmOXvc5lrwiFzI+SlpEE?=
 =?us-ascii?Q?0zQ0MMiNkK+4AXxRs2lRgoSDyzUPaMrHkRxOtyuK/07dwZRhuAEbeC0nNJKy?=
 =?us-ascii?Q?5wslTm3qDpTw3V0G8XNrClte5iCkQt+owgYNNOQhazZXh3cvORGLrWHJoaLI?=
 =?us-ascii?Q?aBvVLpoFoT/r1ayxOSRwO94gjVa8UqJDD+rDfReMukAR+Szp2EQkxHamN97+?=
 =?us-ascii?Q?XbvPLT9vGeos2i0+k2GykSa4l6rrTvCGCAYRmKZQMd9K2FeWeZsoGr7BTtBQ?=
 =?us-ascii?Q?Sd9ytb2nr+F2hTxJRqEEjIit1G2t4Xx8bfeZl9wwzPbbaRPN32N+gCpKJ3hF?=
 =?us-ascii?Q?dF4c7auiN79dLX896jiBSNNv35RYy9VtoA/S8qz/k3pNuNIWr9qtoke8fHgw?=
 =?us-ascii?Q?je757SCj43eMQyN/2moA6DsmSzkPDlm1FiSN1ZVSDTm/ESE0fE8Bfzo2PzKZ?=
 =?us-ascii?Q?+VQXUwp39iiEJ2GIZr/ooDOd2U9GslhVScelG7ncWW0apZA5WOamSKBNeFWl?=
 =?us-ascii?Q?W5TQYgEbq2Cxs7+JgG7LqaPOcW5Pbi9G/p48s+GmSFc09ylFUAnHVEOcm4nQ?=
 =?us-ascii?Q?ZpLGvfSai7ksfUkuh8zoQu3HeSpo24YxdJZhLRqJrktgJG3q7ReiEq+25lq7?=
 =?us-ascii?Q?M04TgjiUKY2/QByjYeETxPqMByd3G5PNt/JU+WpZbbmdSVCXtpT6VEIOS1z4?=
 =?us-ascii?Q?UCIaMkW9PVxil7Bo5zwfA1/HSEs8dE/U8mNZhbloSptcDXUVkVw5q35alUcP?=
 =?us-ascii?Q?0z+P+YBav4Y81x5I1yzEj+R+wpqJfdlWvnCZnVZ8yhpIuVdV7gmbxBQXsGb+?=
 =?us-ascii?Q?KG5BtD+WaZQ8/HXBhqiZ+q6cqW1KKDGZp93MNbIUg66vCjOH5V7zXLbUWKXH?=
 =?us-ascii?Q?1th8pdEa6MltI9jzYBWzsu3t6Z1umWrXag44/cPQDpqGYgMSfY+1/0A0o4FF?=
 =?us-ascii?Q?5Fsa6sDUMO6q8rbDZVv+nh406bhoKtfQ?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2D5CB85E2E84DB4A91EC97B1576173CA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8839
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87ac7136-3e29-4073-366a-08dd57529fbf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|1800799024|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b/QDRUBq47eNR1cFkThUtyB9NWppnHQ1Zvn4T4twhn2hxiBmEU31qn0gw/5m?=
 =?us-ascii?Q?dUkO4y4GcIG/1PanUloe5Y04KHyn9ZqTjzbtLmAsifixEDhNDx68X9C3KR6g?=
 =?us-ascii?Q?Q86yv9//cluUfZ2zLecOXUeJo3IIEoyHVFyLXORleSGtt9RadWjWvxXvGjrp?=
 =?us-ascii?Q?tkPbfgVMzUmVrkVJ8MwhWNEF9vJFmIuojRmB0Y3jrtANZChlLjRZ0RVB0tSD?=
 =?us-ascii?Q?DgAY6BNWaEF1C5t9Bpsx349wC65PylBrtpbCwfVZnPGd4CVH6mYLpWi1oGQU?=
 =?us-ascii?Q?1Quj8raNRzHVS3nlCqKPa9YdwNmN1MfmxLeOrxDyH1SSucEEKbtCJpKgsQ4I?=
 =?us-ascii?Q?MEvhJKIBOLoWZZWApHODyt7VF+l2vNKJQC9PecDGsempavBwknTztWU3riu+?=
 =?us-ascii?Q?KUe/k2KKtPmzcA6Zi8MggfWZYnuAqMsY73sqQyI/RxWgwpCkB6BAEdTQsYKe?=
 =?us-ascii?Q?yZSNoeyzBHpfTAZC7dSHLnveEw6KaER79c/WLapvaAa6aHheHWnGWBZdXKHG?=
 =?us-ascii?Q?IhjJCc/s/FuqRhYw4g0hlEzX5VJ0EyshW8Z97awUBXs4hWRRhFLzITzaslkd?=
 =?us-ascii?Q?117ejtW3kdSp4/7vPeI4R6Gb7WhA8BScfBfoFdVr/4skXGP5gwa3xNng2N0m?=
 =?us-ascii?Q?sF9+hKvmVLe+0GLo96zO2f8grfoMMbcpFpuqspfxbgoqwvwGsCiorARmcN+6?=
 =?us-ascii?Q?5m2DjXPjDpqq2FTjhyn5aWTI2pJcYKMpOsEKPdQFw11jbj8Z3WN9RNSDkaxs?=
 =?us-ascii?Q?UZEc0JWleFsOrWvmFdBo1VzHZKHnxX9VKEhONczCpTFFpkoD1YfCfyA0oOrv?=
 =?us-ascii?Q?KtTKiX8aOJnH1cM0e8G8X6G5jtLZNOlEoqarkOVqlRja/kAsiZzMLZEsUePc?=
 =?us-ascii?Q?XPmwi6zIUiXw9UQsNEKVDDfgdQiSTw+JnDtfafAqziQGjlgHzBUrTuRPNRWE?=
 =?us-ascii?Q?uCLm7Akr2IArVEEDerzpV1nyf5K6K35XJoSSR2yMbq7lVXpOFoREnbrGO2vg?=
 =?us-ascii?Q?geiScY6NlwtMeQFGnNy7IgLTPdRj4VL96vtm84uHr36RV2GgRVIYLtX6+05Q?=
 =?us-ascii?Q?2o00HX2gNLmuf2KkAqwm0NiJZjBskDce61C1evsbKdAZGbwOixCU9w4jXCAA?=
 =?us-ascii?Q?wkLhCw2agVhATgVwtk0FxI7bepAQQkNJv1TnUI4eTwY3UwKRlmLDXa93Iz8u?=
 =?us-ascii?Q?QaUN0vKagoDRTV/Yu0giFIoUw1GS8cIQOoU6ebGOtfJEF4FGlVfHafy50Y5g?=
 =?us-ascii?Q?pAwrkCX0RPJX5PBSNCCata40q73BkQ19qc93UWbNiO9gVZnK6Fp9qd3zcv9h?=
 =?us-ascii?Q?mq4z0xqU648yb3EZ0yt6pZNauSB6jQlPemdFvfDqhic8Y6ozL+OhWHSFCcSz?=
 =?us-ascii?Q?FPXWZveaiceQjNODKtRAUfiMoklD8h04So8DxbLurHbLOQef9yQspr7Cwh4M?=
 =?us-ascii?Q?G5Mu98F/jUN7CrXKe86+dajDFEgerBoj/PGAYFYOoZJ3dXVhJKkDsVwRt1fg?=
 =?us-ascii?Q?YDxqBB7xekqvfNI=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(1800799024)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 17:17:42.8220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd4aad4-1f77-4929-d6c4-08dd5752a54c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5853

Hi Ayan,

> On 27 Feb 2025, at 16:09, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> We have written the requirements for some of the commands of the XEN_VERS=
ION
> hypercall.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
>=20
> v1 - 1. Reworded the requirement so as to avoid mentioining variable name=
s
> or hardcoded strings. Otherwise, one would need to change the requirement
> each time the code changes.
>=20
> .../fusa/reqs/design-reqs/arm64/hypercall.rst |  6 +-
> .../design-reqs/arm64/version_hypercall.rst   | 34 ++++++++
> .../reqs/design-reqs/version_hypercall.rst    | 65 +++++++++++++++
> docs/fusa/reqs/index.rst                      |  2 +
> .../reqs/product-reqs/version_hypercall.rst   | 83 +++++++++++++++++++
> 5 files changed, 187 insertions(+), 3 deletions(-)
> create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/r=
eqs/design-reqs/arm64/hypercall.rst
> index ffd883260c..b6f99af023 100644
> --- a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> @@ -28,8 +28,8 @@ Parameters
> `XenSwdgn~arm64_hyp_param~1`
>=20
> Description:
> -Xen shall use x0 to read the first parameter, x1 for second parameter an=
d so
> -on, for domain hypercall requests.
> +Xen shall use the first register to read the first parameter, second reg=
ister
> +for second parameter and so on, for domain hypercall requests.
>=20
> Rationale:
>=20
> @@ -45,7 +45,7 @@ Return value
> `XenSwdgn~arm64_ret_val~1`
>=20
> Description:
> -Xen shall store the return value in x0 register.
> +Xen shall store the return value in first register.


It seems that those changes should be in the previous patch directly.

With that fixed:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> Rationale:
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/doc=
s/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> new file mode 100644
> index 0000000000..3aa12ea2c2
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> @@ -0,0 +1,34 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Capabilities
> +------------
> +
> +`XenSwdgn~arm64_capabilities~1`
> +
> +Description:
> +Xen shall have an internal constant string to denote that the cpu is run=
ning
> +in arm64 mode.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_capabilities_cmd~1`
> +
> +Capabilities AArch32
> +--------------------
> +
> +`XenSwdgn~arm64_capabilities_aarch32~1`
> +
> +Description:
> +Xen shall have a internal constant string to denote that the cpu is runn=
ing in
> +arm32 mode.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_capabilities_cmd~1`
> +
> diff --git a/docs/fusa/reqs/design-reqs/version_hypercall.rst b/docs/fusa=
/reqs/design-reqs/version_hypercall.rst
> new file mode 100644
> index 0000000000..edc5672e83
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/version_hypercall.rst
> @@ -0,0 +1,65 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Version
> +-------
> +
> +`XenSwdgn~version~1`
> +
> +Description:
> +Xen shall have a internal constant (XEN_VERSION) storing the version num=
ber
> +coming from the Makefile.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_version_cmd~1`
> +
> +Subversion
> +----------
> +
> +`XenSwdgn~subversion~1`
> +
> +Description:
> +Xen shall have a internal constant (XEN_SUBVERSION) storing the sub vers=
ion
> +number coming from the Makefile.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_version_cmd~1`
> +
> +Extraversion
> +------------
> +
> +`XenSwdgn~extraversion~1`
> +
> +Description:
> +Xen shall have a internal constant (XEN_EXTRAVERSION) storing the extrav=
ersion
> +coming from the build environment.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_extraversion_cmd~1`
> +
> +Changeset
> +---------
> +
> +`XenSwdgn~changeset~1`
> +
> +Description:
> +Xen shall have a internal constant string (XEN_CHANGESET) storing the da=
te,
> +time and git hash of the last change made to Xen's codebase.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_changeset_cmd~1`
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index d8683edce7..b85af19d19 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -14,3 +14,5 @@ Requirements documentation
>    design-reqs/arm64/generic-timer
>    design-reqs/arm64/sbsa-uart
>    design-reqs/arm64/hypercall
> +   design-reqs/arm64/version_hypercall
> +   design-reqs/version_hypercall
> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fus=
a/reqs/product-reqs/version_hypercall.rst
> index 03221f70c3..ae72b22556 100644
> --- a/docs/fusa/reqs/product-reqs/version_hypercall.rst
> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> @@ -54,6 +54,89 @@ Rationale:
>=20
> Comments:
>=20
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Version command
> +---------------
> +
> +`XenProd~version_hyp_version_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 0) for  hypercall (num 17) to retrieve =
Xen's
> +version in the domain's register 0.
> +
> +Rationale:
> +
> +Comments:
> +Xen version is composed of major and minor number.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Extraversion command
> +--------------------
> +
> +`XenProd~version_hyp_extraversion_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 1) for hypercall (num 17) to copy its
> +extraversion in the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Xen's extra version consists of a string passed with 'XEN_VENDORVERSION'=
 command
> +line parameter while building Xen.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Capabilities command
> +--------------------
> +
> +`XenProd~version_hyp_capabilities_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 3) for hypercall (num 17) to copy its
> +capabilities to the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Capabilities related information is represented by char[1024].
> +For Arm64, the capabilities should contain "xen-3.0-aarch64" string.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Changeset command
> +-----------------
> +
> +`XenProd~version_hyp_changeset_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 4) for hypercall (num 17) to copy chang=
eset
> +to the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Changeset is string denoting the date, time and git hash of the last cha=
nge
> +made to Xen's codebase.
> +
> Covers:
>  - `XenMkt~version_hypercall~1`
>=20
> --=20
> 2.25.1
>=20


