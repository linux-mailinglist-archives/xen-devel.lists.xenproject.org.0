Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77B79F67D4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 15:00:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860409.1272430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNubI-00063K-3E; Wed, 18 Dec 2024 14:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860409.1272430; Wed, 18 Dec 2024 14:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNubH-00060e-W6; Wed, 18 Dec 2024 14:00:31 +0000
Received: by outflank-mailman (input) for mailman id 860409;
 Wed, 18 Dec 2024 14:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=auIu=TL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tNubF-0005yr-Vc
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 14:00:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f403:2613::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 701c2d1c-bd48-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 15:00:29 +0100 (CET)
Received: from DB8PR03CA0031.eurprd03.prod.outlook.com (2603:10a6:10:be::44)
 by DBBPR08MB6283.eurprd08.prod.outlook.com (2603:10a6:10:1f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 14:00:26 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::a9) by DB8PR03CA0031.outlook.office365.com
 (2603:10a6:10:be::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 14:00:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 18 Dec 2024 14:00:24 +0000
Received: ("Tessian outbound 7d3f896333d7:v528");
 Wed, 18 Dec 2024 14:00:24 +0000
Received: from Le180e8ee348b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 00E8E6C4-DBD8-465F-9A88-8D15164004E1.1; 
 Wed, 18 Dec 2024 14:00:17 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le180e8ee348b.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Dec 2024 14:00:17 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS1PR08MB7425.eurprd08.prod.outlook.com (2603:10a6:20b:4c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 14:00:14 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 14:00:12 +0000
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
X-Inumbo-ID: 701c2d1c-bd48-11ef-a0d7-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=d8aOEvIbcuxFS0sQuNVA2Wr4jZ+5m0/K2Nv4Ag2pyrWhGt0JPuqbzrHxkAwRpfmv/AnbuGh3RfScoQMEFEFRJa17el07jnFK3XAQsqliC7SeTpxcyNBVJ05f8MVQSEwfBYzuDxVnmpP6R0ezMZH8tp2DsO8y4/NKvPoJGFETzdTYtdNIGx9pSIrSomPTEvWC2Tovmj1aN/sFJ/StidtyY2VOHYtg4N3Xim1QMYS5Vo88iCx0Me6+kUdSuKHKTa10EAhQvOYrPP9WXSGI9R23fIM81mZgc57jlqe9r7to42nEEcAHM2xzhsmQEH+3huJrodE778GwNH7f6XzjzPpC5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrmE7urZm9N7Q3fQ0vEe2bGV6jf0rkMmhZje/sh0Ipg=;
 b=X+zjPZRWPEsPCSMP1tn0t62PZlTkGshBPkMEZYG1XHn89BDVLfHLHaXQKDyttRJbzmeP1fLjLB26gh+Wb8i8vfIG/TtCIpOtwQz8cx6o6yTS6apXPbQpH566jGR88M2ut/KfszhALI5pypv6kyrF4lL2xXRsRBS919Ut4SWHyAjVtavxruSjJ+tUsVAslRakXHlehakOCpTYKYOffYk1g0psbKGsuKT0oQJYRKW/rXQtBxZCZc18Q7tmyw7HKrwImXIQ5r04bRsvw2O+GcBNPpbk9zcwBA4HRZBOHWlL8/FeRaMhVCOcNzkFkHpqsKuRBsfTD2skYakiEUWnbaIpWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrmE7urZm9N7Q3fQ0vEe2bGV6jf0rkMmhZje/sh0Ipg=;
 b=Wq53cG4Gyq1dhHfPzq/XNFAfAbOW5DAQl8Dvf0lj/KgsJJvA/ywWbjWUkCKgBHYcUpHVXFozisvCUJXc7VafSp6Mu8uKOK8Vsgtzt4D0YfJsRFkKNSjSq3KSsLDC1UK0CX9wDTG3jCWU+4POTuckTH/AMj2jktJcw8ZU/AyQsPE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11ebc8e030fb296b
X-TessianGatewayMetadata: ck9zwL1E+nYAp4BzpHLzXE2YQ2IRaAHGRC5wbSvJn5SEwS1YQd9nrTH6D8vz0WdhEcxABLMmZkgXFzI33jWd2lrZnnbN4rr9U4/ukcHhJyk0qeV4uk3P5Ysr0S+smQzxhIEAsdMwEsIGKtUMIlCYzPcwO3ZeZuGGWuyPuSDM+gA=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSd9cXHMCDIqbeNc2RLiE5bnSLngSnwgDEQ7I/n185RgJsbg7CGvbk6IF6SDhl9Mp4panqEY0iGaaWByC+r4cSmPUJ3dLQbDrZsWfDvxfUUYC+ABkdTWGG/79OgC+qJIiKnk7oigWO+O6uQ83bEFb5keLBkDNBdv2w0cQA5WKfPLVIn2/SI59NGEbB5aaHaYXL3BBhoRsVFJ2XZup+8rQwZGuUdkrkPRSnzFJ9EUaPofRA/opquclD6b79r+gwnWsEZeG6TunGx2VPY6EVeIfzXAyd1n4Icfosmul319+IeNZZ74gDaFlkVzjZjlOQF7/qqoDCUlUpVlf8AjkgEkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrmE7urZm9N7Q3fQ0vEe2bGV6jf0rkMmhZje/sh0Ipg=;
 b=YMmw8cAGfRIIACLXLYnUWL7tz7loTEC6QlZ5VLvzMzZQrTykmwlM7RuI6W9IU5t7zO7Dz19DKmNvbE+jLNtQdLYQwoEZbmDZM2yQew2I67f1E6zxDTWxG0MJNWdpe4Ge+JzGW/AwakEUcjDHAg4y4HhrMiVpjQloG5CmdRMiLt8xsX9/K8iiEbdECJJcyOnM1i3pLG5ugkX0r18TYOj+cns/OR3S7SSkYcJiwrSDLzpRf0yHCV0XzPUkjr8zkAUP0kZSVE5xEZycnV5JJX6w1jSlR02etjscRhL2hKfXI3Gma0obEjD5/2pfd1L95cPHF5cRd4W5WHQn8QaFXlmvkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrmE7urZm9N7Q3fQ0vEe2bGV6jf0rkMmhZje/sh0Ipg=;
 b=Wq53cG4Gyq1dhHfPzq/XNFAfAbOW5DAQl8Dvf0lj/KgsJJvA/ywWbjWUkCKgBHYcUpHVXFozisvCUJXc7VafSp6Mu8uKOK8Vsgtzt4D0YfJsRFkKNSjSq3KSsLDC1UK0CX9wDTG3jCWU+4POTuckTH/AMj2jktJcw8ZU/AyQsPE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Ayan Kumar Halder <ayankuma@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v2] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Topic: [PATCH v2] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Index: AQHbTMiRgWsw6YUipkyfuZOmy7e9xLLrs5oAgAA0fwCAABobAIAADYkAgAAA9IA=
Date: Wed, 18 Dec 2024 14:00:12 +0000
Message-ID: <E4F0C26E-9FD2-4C48-A3F1-4CC599B4EC04@arm.com>
References: <20241212190325.2130129-1-ayan.kumar.halder@amd.com>
 <779AFC45-3F8C-4065-A39E-9325F9C72AAD@arm.com>
 <2cf952f4-69cf-4eea-aace-4b7bf291b9f3@amd.com>
 <983EB0F5-8C88-4063-9C97-EC8BB89AA5B0@arm.com>
 <3984b69d-e15f-4863-8af9-53b6cc0f6bd1@amd.com>
In-Reply-To: <3984b69d-e15f-4863-8af9-53b6cc0f6bd1@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS1PR08MB7425:EE_|DB5PEPF00014B8E:EE_|DBBPR08MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fd1366-0af1-4444-97d9-08dd1f6c51b9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?AsUBJ70BQLZ76O5/jcvfsvuX/4lTcGv/hlkwYJw+FnWzICDjPaZ37HV2SsdR?=
 =?us-ascii?Q?A4SCvBUs3YA9GpMFpFG4WL8YKlXmZ7bbP8TQIZZg6fWd7jCdN7Ow9RIGV2ku?=
 =?us-ascii?Q?btPBQhrcOxOqe/S7AghiUgG/ZChjvryHVHF91hJjuNb9fuaK9Q+me4/xMNBo?=
 =?us-ascii?Q?mFJdu55K04tv203vTPIwWUPa+nqX/ibwqEMHaE19f57eOwwqd7xzADwTUmYv?=
 =?us-ascii?Q?BAkIN2wf1B1koi7QnqGW+IuvNP1zAWTqSCt8edfxU/EGbX8lu2JAn5mv0JHG?=
 =?us-ascii?Q?LLLSQwHPFKsNvLsGjlSgqR9iSeA3VEklbA4P9KPiNVyJaNQx0uMaFer8RgLL?=
 =?us-ascii?Q?6DK570LJVjYKNVkKOVSUYwZxDAUG5wHGG2+gyQc8cUNTQzpmQAvs3/rPoxr2?=
 =?us-ascii?Q?b4gYa2IoEivRW2mxtoYDX2FljAu4rWjmDRtEv553yVMU9HfUs1rM9c97FbwC?=
 =?us-ascii?Q?Bu0l2OgwT3B6nSCbXVWRnsx/vyGDVvpiVSCFEv40LKP4SBePK5WNX1NdvfFo?=
 =?us-ascii?Q?qrpoewCsFyKByAxNZv4wAiNkoEKWrrMprMTh6GAnaZnQTCJsQ50bhRPpDuf5?=
 =?us-ascii?Q?zwNyA3eaaiB7S0oujisyebzeA1pqgXVDgFlfjtqbbqhNoVc12rUpGhv6p0so?=
 =?us-ascii?Q?nqM20gtc+Jfi8CexUwnhW8j7OlomxM/IhJrKF1GWw4VuEa6bU3MgqGuGyxaa?=
 =?us-ascii?Q?0T9QGKGjzQ+Uskurh9wlzhXpPTdv6bdI14FwNO35O7CxALLQkVGO1YwuY+IJ?=
 =?us-ascii?Q?F5VpawhLjDmi9xKjuoWLStIcyE/dTJtcF/dUVpmKDaUBneoplKiHdqZD4zos?=
 =?us-ascii?Q?yEj+TsCfLVLGep0CFGYqTy5ZRBd257sRuR5a5U0/GdI9X8VOXfLAymUjpVdy?=
 =?us-ascii?Q?wxsMhG8wNg1YWFPXp4IziJqozyCCSZ3KAV5EcZbTa/xkoYQoaG/cUQENpSjj?=
 =?us-ascii?Q?o36p94u+WSkU6lgg1esx4iWE+6/O/+hvwqIU4sJpYrk+6GlcnGqYawKT5run?=
 =?us-ascii?Q?gRBvjdTE1LxDa2UB+2nkucDW/lPaE/54QSNWAAtozkvIw2xbl9VAH/MlauLe?=
 =?us-ascii?Q?Z1bvCJ/VLaQ2XeUnPRP8ZS0viW7D5zq4DL0R/PLpvmz14+hRSu/mDLhC74zM?=
 =?us-ascii?Q?PXJ4fx42xENakGPmQN5sKSXlltKgdUEGRuMsD9YvT1cLWCFtYoM1PiOGNNsv?=
 =?us-ascii?Q?JvBPGGg/oL9o3e64RPWz722+ZrRhaFRcmAjYXNZjdiU6yiyg1PnevBnsGRcK?=
 =?us-ascii?Q?xXAHw46/anhsoqNUEq2VfgGUnfbQ8j/AxogOmOlet3s76U9Q6WKHNzh5Cqe2?=
 =?us-ascii?Q?mIkyS69BxlWIh6PUpt7QhORYuvtM4MqD7ugAcDAd1YyCJW6VCIkJnteWw6bG?=
 =?us-ascii?Q?dqgrT6SvwpbtLju3z6XzJ7OO+9/L?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3342A1AB162BED4EA50DB60238FAF054@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7425
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	de500277-d4b9-4267-6a51-08dd1f6c4aa7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P5Rpf/Kz8384VDfLz5aKcJXLDcIq3DyqNfeu+nMd2D11Z3GoZt10+Ze0nzlg?=
 =?us-ascii?Q?bq8SK9q91a2Q9b+d+8K0fDVd1LHXeoXd1G+lnE/YDyXmDlPFWs/VTfMVnCVt?=
 =?us-ascii?Q?3AJZYsuCNP3ex/1HLcHz1tMI//skFcdtHQJATHaqfHRXRYYEYf1HAUOxkuIV?=
 =?us-ascii?Q?U1qsgbyrGOf6novQObjeY71HBowJltbZkaLblgje0VDCIfQYD5XKChmmibE1?=
 =?us-ascii?Q?uhYtb4MVodTXu4u4YWyiyxe/2QGvXm1CGH5F6ODIoTVsr2t+gqNnVTc0DDEG?=
 =?us-ascii?Q?zcW5d41Nf7xUbehYS8alaVnlU9ZteJTI97pW26G8zYOAhfhNucdaNiG8H77h?=
 =?us-ascii?Q?LbOqBHtzNDWtR2tNSsXC6ARGOaUsl0UxbkINfcjO0hyetkxvqZdkVB566WPZ?=
 =?us-ascii?Q?0H7hqBpXEzaotfOFKu36sw86oDWW+SSjdZ+zrhNj0ShgPZILtWiFaIwAJw52?=
 =?us-ascii?Q?B76O3R0oM931lNpsud98XIGmU82j2akgH7KbhpoDpb53IVliH3oxBjcdEZ/X?=
 =?us-ascii?Q?9OeDbmXtXnTs/yXq3xUzlwIAWTf0ASmuYV2NkHvSiqZv4E6imUgMqCdfJeFe?=
 =?us-ascii?Q?xjSreTkgaE4WtnJ58ZGvSNYmI7KdGRTYIKvby9vIEvFP3H3izI04MICKT3GX?=
 =?us-ascii?Q?IILEkBf7QTpFv/7N6LVEazRzvJUNHm2A2jQ7SSgylzuZs9Zo4mbL0ZI7Wz53?=
 =?us-ascii?Q?RFwaKaSRsqaogNHidI7J9Ns5tppXqPdT+OS+IpOYHpzHbVzMTfYYA1zdG61+?=
 =?us-ascii?Q?ngjRTNxk2MxeZn+g0BM3wqZUqHH3rhefxgrUHIyer8yRgYRig/4SpBY0Zeuv?=
 =?us-ascii?Q?W8c97r0/zXQn18NVtRuVQT1pvOzb9CXETcNiA6Bs4OyjUq0Oju4YsMi99oU3?=
 =?us-ascii?Q?Cg7yMi1en9mqMRG06NF6xcq7A/rPUT3AvA0xLtwIbESQHne4KjGmXMEnWK+N?=
 =?us-ascii?Q?rf8d3oqIiGsyZ4FFK43Nw3BKfOWP2jtm74QojlTaw1GtzAsJnDP/pBQuQiSo?=
 =?us-ascii?Q?Q5WnJEiZItclCh5IluDmsJMsdywqvxgQEMEp2tij2QCXH43JZMc05BF7r9TL?=
 =?us-ascii?Q?45lZLtGmyVkm6szklBpNC5ngVMTElegl2SNeS2qCfL5Lh4EKWxMFNWlaWxm2?=
 =?us-ascii?Q?+QM3dzF3NCa2CAXEHUYZNhVXU3S5ob72J263Ys/BRzYCtCp/S2yusKsP421p?=
 =?us-ascii?Q?iIDXXu1pVdO19eC/cRQRj8ruXG1FXrROoMuHcGVRURrfYs+2U7ts2Xaq2+M5?=
 =?us-ascii?Q?8vru32CYrkUGQ9Kfbu0YGs+AkUIZZ61CDuhWlfQ0yzFd+3MSzvmh+9g/rIET?=
 =?us-ascii?Q?xJbni4HswvCbRciCuf1jTukPNinSrQ1s2fwXAjUGUC+HTHPvDOITMLJd064W?=
 =?us-ascii?Q?+ytcnoJY0XMm/piVuEle9A9rkzhdJB7JUjocz1Hs/6Uzw8wUtxh80oyYEjiE?=
 =?us-ascii?Q?K6uVy8k4o71M7k7gqLwofaz4fNEn9k6G?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 14:00:24.4368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fd1366-0af1-4444-97d9-08dd1f6c51b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6283

Hi Michal,

> On 18 Dec 2024, at 14:56, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
>=20
>=20
> On 18/12/2024 14:08, Bertrand Marquis wrote:
>>=20
>>=20
>> Hi Ayan,
>>=20
>>> On 18 Dec 2024, at 12:34, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>=20
>>>=20
>>> On 18/12/2024 08:27, Bertrand Marquis wrote:
>>>> Hi Ayan,
>>> Hi Bertrand,
>>>>=20
>>>>> On 12 Dec 2024, at 20:03, Ayan Kumar Halder <ayan.kumar.halder@amd.co=
m> wrote:
>>>>>=20
>>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>>>=20
>>>>> Add requirements for dom0less domain creation.
>>>>>=20
>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>> ---
> [...]
>=20
>>>>> +SPIs
>>>>> +----
>>>>> +
>>>>> +`XenSwdgn~spis~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall allocate a specified number of shared peripheral interrupt=
s for a
>>>>> +domain.
>>>> This is very ambiguous. What do you mean here ?
>>> Xen shall provide a way to specify the number of shared peripheral inte=
rrupts for a domain via the device tree .
>>=20
>> I am lost in how you achieve such a thing in the configuration.
>> All you can do is assigned an interrupt to a domain, but the sharing par=
t I do not see what Xen has to do with it.
> This req is about Arm's SPIs (Shared Peripheral Interrupts) and the max n=
umber you can allocate to a domU.
> You can see more here:
> https://xenbits.xenproject.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddocs/misc=
/arm/device-tree/booting.txt;hb=3DHEAD#l172

Oh right, no idea how i came to shared interrupts instead of Arm SPIs.

Then this is Arm specific and we need to have a bit more context/clear up h=
ere (as comment or introduction).
And also this should have arm64 somewhere.

Bertrand

>=20
> ~Michal



