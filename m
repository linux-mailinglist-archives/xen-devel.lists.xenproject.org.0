Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1DC8D4C86
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 15:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732725.1138765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCfkK-0000I3-SK; Thu, 30 May 2024 13:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732725.1138765; Thu, 30 May 2024 13:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCfkK-0000G7-PX; Thu, 30 May 2024 13:23:08 +0000
Received: by outflank-mailman (input) for mailman id 732725;
 Thu, 30 May 2024 13:23:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lthE=NB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sCfkJ-0000G1-Ec
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 13:23:07 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260d::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf9e4918-1e87-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 15:23:06 +0200 (CEST)
Received: from AS4P189CA0060.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::15)
 by AS8PR08MB7864.eurprd08.prod.outlook.com (2603:10a6:20b:52f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Thu, 30 May
 2024 13:23:00 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:20b:659:cafe::c6) by AS4P189CA0060.outlook.office365.com
 (2603:10a6:20b:659::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21 via Frontend
 Transport; Thu, 30 May 2024 13:23:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Thu, 30 May 2024 13:23:00 +0000
Received: ("Tessian outbound a0025cf119c5:v327");
 Thu, 30 May 2024 13:22:59 +0000
Received: from 7a062bfab231.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F2FFDA0-1461-4C6A-A8D9-0EEF65A1F537.1; 
 Thu, 30 May 2024 13:22:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a062bfab231.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 May 2024 13:22:53 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB7887.eurprd08.prod.outlook.com (2603:10a6:20b:52b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 13:22:50 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.7611.030; Thu, 30 May 2024
 13:22:50 +0000
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
X-Inumbo-ID: bf9e4918-1e87-11ef-90a1-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TowmUU8xO316RJ7dL9LKEFjVUnBj7gTIOJRV/JwDmGzBU9cwN+jJHFJtYASYfoXIQPMP/pn6ZnNcwIimyLmsiMLa3tLg1YtryjXjRXXOahkMffeQWd6H+UJD3MMHT4BPvcgugo4ksq7a4L8T9BpcWqOWoyHPt5qkuYpVDcl8H7Au6o2YMftwKEnbZfAZDONqCzcsb19UfL/E+DIeUVNUNkmwp72/Pl8hCwt+Zsc7XVqd2qm40zNO+T4ZrVficooYu+I0LxiIzPRqfGT9MWInGiPrLrLhX1rLHIbP8kquDsfPGX0FJbxKJydJ+uV7XBeWq21dvbwOmXbhw/htx86n/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvybumCqWgkYIZD6Th8cbehhH1VZ5yOfQbP5Ck7p3bU=;
 b=FkmpZ7iv/YO9eZiItsRKl9FhoR9nFpgY6D5esr8SZN8qMn++KinGADW8ooSxeHWkeYuQOsWF/d89VTd9TvlerNcxzcNlO4psXTsaqV3IhL2o3wiyxulvBH9L7bxkHncd6NvH0MjSEmltKnZ3F6ojBy1p20mCJQe4hffACF+M8ptjeCeWXBV6N5gFd1NA4CyXc7r5319xQqrjU8aifSeSb/8ktIdP8/lQVwXhc9/zuzQuT1bf/Qv/OqpqIOfdzQKgIEovunKKc0Udr4XD39W57FIX48aNFTlA9fuZD+zxQ8uDRlzfsO0flv07VzR3tvnDwMcwWuRMHzCtDFvc5pkH1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvybumCqWgkYIZD6Th8cbehhH1VZ5yOfQbP5Ck7p3bU=;
 b=jz/ysq173zQtZnvCCrKjxUFV+wKzAVQGWy5+XHDW66IjZ/dTfY7u5/g8/zrwW/+j1CmEaJo0C1Vnq0aWV5xx1QgCIGCOJ/FR+uTMdTZNLbaRAWkiFsMbBJ9dDZqGvmvSUA1YORDeHRHIpLJ/tUtcb3Zh6055oWEEipsUSS0ycTk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 38323b2e27ca1ca1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNVsBOsGqqIia0frtU04RjPQDJJTjqpZDVqfiI01idOnN/1KO0BC4C6oeMxVXEHIDn+Ext/aDCsN0WIpZG+PTmhvxknRs0uMlAfFuz1qbkCoYUEmB/ksMJfDW8gDn0yFbSxOGVpEGZlzs2/iQun1iOvQzuEg5nkNVkFAdKf3qfC73E7/NkyXdOTxeCnRg8AeCR60vvuD3P6OX+bvvvWdxxvUCisSBKkrdD2Q+UhxPNVsgUG9oMUItO4lShMGRqhuFdimbllktAoMwBCifle9S5iTHDuLaLcafA7AL8zu+ea9QFo82X5zEcy9HVBRgGZSxCxJEJJhCKxc0Lw714x/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvybumCqWgkYIZD6Th8cbehhH1VZ5yOfQbP5Ck7p3bU=;
 b=JxG/rt/x+ucDP4QVGeHMwCdBWEiqxsx2VethMvl2rL9/NaEUn/tjSPKaH8s7LYyZjZenrqPqDucyTngHtKC2xta0IZtl9vv1EjfTRMaHSPFSiBDRostRXsRm9CkiqinmoOYsx1dw01TS6/YASNuLfVx8OxP5PELp/0ZVd6EkAvcejrRg6Zn02Q0s2VLhhHRfBJ1QyJpnuTCGQSlh1MJszDp9786QbdrNqDnicsBoUwDDV7hArDx243toCsU+CltuI99dSntoIuCuoyI0PrwC4vsYhJ4cE01+7OA9XxSW7B67LfkZZN1dGFAhGObQxzVCGLazwHelPtH0+Rc0du1Giw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvybumCqWgkYIZD6Th8cbehhH1VZ5yOfQbP5Ck7p3bU=;
 b=jz/ysq173zQtZnvCCrKjxUFV+wKzAVQGWy5+XHDW66IjZ/dTfY7u5/g8/zrwW/+j1CmEaJo0C1Vnq0aWV5xx1QgCIGCOJ/FR+uTMdTZNLbaRAWkiFsMbBJ9dDZqGvmvSUA1YORDeHRHIpLJ/tUtcb3Zh6055oWEEipsUSS0ycTk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] arm: dom0less: add TEE support
Thread-Topic: [PATCH] arm: dom0less: add TEE support
Thread-Index: AQHasgjZKwS4pdCyJUe9LewXYMLHeLGutaSAgAAAkICAANCCAIAAD1cAgAAuxIA=
Date: Thu, 30 May 2024 13:22:50 +0000
Message-ID: <E337CF92-42DE-424C-95D5-97FF096885B1@arm.com>
References: <20240529204305.1402036-1-volodymyr_babchuk@epam.com>
 <be133b0b-5b22-4b82-b5f6-3c257b45553f@xen.org> <87bk4oxpxk.fsf@epam.com>
 <CBB42DF2-94AE-4566-B83D-3AB3CB2E01DE@arm.com>
 <047ca670-cd9e-4803-8083-7770b7230042@xen.org>
In-Reply-To: <047ca670-cd9e-4803-8083-7770b7230042@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB7887:EE_|AM1PEPF000252DB:EE_|AS8PR08MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4c6108-b476-4edd-a8ac-08dc80aba0bc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?kdS/2RUbUNW0R4jGkJ10mXHxtMZ0XWEIRdUVpBi4DFpFcwc6YfGd2vHX12Kf?=
 =?us-ascii?Q?5re2sFKXNG6gU+YxiMwN9d4M5IiPps7F9a1XIhNgpza0R1N07QgBFKcW1ycD?=
 =?us-ascii?Q?mj6teShBRBPbAyi0Ro1RzLEqGvMsaXg1/hTGMe27RxokOtZLMNzjQ8koidEj?=
 =?us-ascii?Q?hOhU7fjZ9IFtiyqO1dssd9SlE/FmwpitI1Yet0RbIDlzTernbT5bxTqFkwkf?=
 =?us-ascii?Q?wWU6L8zmeQ8DaMYeYY/LEG/Q4bM1MgwgHrswUTlGeEZPb8CWDXdzGbsw3y5h?=
 =?us-ascii?Q?ZQ1vRotfTRdSvmiW3HB3s3SNnJURF4hw2xNw2M4YzMmTPlFk9D+DkXFh1jxY?=
 =?us-ascii?Q?rbJfgSNrlnyaYuVn2kYDYfDO8IzeC+h+G3G5coYfxWT5A2YFOfBLUamTv6iy?=
 =?us-ascii?Q?A+v6686Lfzd8N2uAk+2GltvFakIqY2DIeAknBOSyKGImxwrEG22vayH3FI2m?=
 =?us-ascii?Q?NW/58O33khc1TCRyiv+CJtH6is1z0KNG1QQZXK/Ucqfzi+nT8ulbcQeq/d6p?=
 =?us-ascii?Q?+DtbKjAg4YFjh7QiVxqcsQgGYOEvLik2OwEKZJDx+MOK0XEorB71xtaBag41?=
 =?us-ascii?Q?96aDHNB6LrVIMqaJfPFC7MWoZVFEb/FpNH/Dek8sxcuZONLqgXBNlC+f20XI?=
 =?us-ascii?Q?LMpAtH+luxlOY9jIoskBaGxPOf9sPWuZ1Up+V4kEQ6obB9VA3w9nPnmJaVbs?=
 =?us-ascii?Q?CfIxaW1UwBOgm+DPj/cCXoRQexVG7Aajgtl5J31zLFowWGzvJtSbGYjwtN2t?=
 =?us-ascii?Q?IkSoITRGJ+bE64ZnjHOF4wUacxwpXP/S1IEoB+2A3UC7o2uI4ulBz8CCt8ez?=
 =?us-ascii?Q?mk1h+QpRjdgKVbtUvxHqyvSGhu10DvhlTD7l6wJ8co81E22TJse8sRF3UpJE?=
 =?us-ascii?Q?hpCD7GSyUoaEECOVWQYcWrF//TDfqdeDO1jMCLQ4i2+Su4gV8mpJ6tPt0B7L?=
 =?us-ascii?Q?I/d3zqeRB4yRMHTqXFp9MgZSbv4KjW9FU/CBFTBnMJDqmM+qENMDbWgmL4Un?=
 =?us-ascii?Q?VSgnTyfVigQrdCvPf+uSmVV0L4S7pk1J/1Ps7DYuMFhMwj7bhqxDnQUJ38S6?=
 =?us-ascii?Q?9TNX+mppE52RKnHw4XCfEBN+JzMS5aHDgRKRx/dcfwnY0jWgMpW5cvoP3481?=
 =?us-ascii?Q?3QWYNtquxZ1rxx6a3MeQla70omB7dIWCVjwd+YtX+Uw8su+alokg5wExAkCJ?=
 =?us-ascii?Q?U5Pey7I2aKHVElaAiPKMMfrWOzM3T+tfaHXw6clvfmxUD4y3iPd+tiKu0iUC?=
 =?us-ascii?Q?TXZ46l1STS6rO3FF1dTWVxHxvDcNnkW8a/DzbraHAkRgNJ2qz9JMlMsspanc?=
 =?us-ascii?Q?V0y275bFccECsecG0li2cIhG4JdRu24W6hh4ipWqiBM7/g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8019A8B62F3DF64FAB43FA7E37E20A49@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7887
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d2047446-bb4a-409e-4e10-08dc80ab9aa1
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|1800799015|35042699013|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y79kZ13BaDQOLFzbG24mHVWiRKFSQOng48rh6R5GO75mOS10DpEa2pYZALJH?=
 =?us-ascii?Q?Pv0fCYEiLKOJVuDxJ9cYjDmru3A7nGuTcrnR4cY+WuDQgQ9x6RJF1L74fdKT?=
 =?us-ascii?Q?Nk64SS08oKiH7TCKE93byc0T1xB+QF3mkPri+uPfZwdxiGP9jvc4IRJJfGk0?=
 =?us-ascii?Q?LzuHexstM8s/7V6rD+zcVPYh2xRi/x6rc1hWYPW9x6M7ETfb5xItqvzratAz?=
 =?us-ascii?Q?xrFFc1Y0QBW8p60MDNlB+qVb/RorHq9LLu+MUQ0E2lODvgjbR3lNrxepD/U0?=
 =?us-ascii?Q?hAPIJ3OUIWzavZFYMUetEsPa7FMF/fLgzEs2NcWPvK0jFUAytf+y+0bDOMOt?=
 =?us-ascii?Q?7XrKDaWqB9C1E45Jl8tzv7DLtDBDBrhVmIzHyosc8CKtwfwnD8idu1mX6j3y?=
 =?us-ascii?Q?gISaAYABC7g1lPI7REoYIQnswB5JSGBon4cZJAEbB786bRHpe0RPkPOGWguE?=
 =?us-ascii?Q?Z3UAxU8oLvkUTj7S6naSPW3dQX50B6anuaOiTeokQSEy9RBTMwNuS74175ab?=
 =?us-ascii?Q?yq+PUhA5rCTdOYH4gPHejDxEtHWNrKeZD5VYabPhKbWWfMeZDEdI7pu6dBax?=
 =?us-ascii?Q?QOUVlsiFp1Bs3UyKf8SQXmyP1Ykqn8sM/GZBkDJ7lw+5eygARizlLH6BudFs?=
 =?us-ascii?Q?efh1mVP5DM/jWznXlBh9my6Z2yzzfLaDtM45/vNurEWV5BqbostwOk7PTwuy?=
 =?us-ascii?Q?k0YFlozY8TYVDENTtkdn4H0WfWsRuSy7wVjAGqU899KOCg1BSBALb2dqCmgv?=
 =?us-ascii?Q?DUl0P8s10sTy6q6Zx271gnTzoigoG9VDwpB3IHB/eyxmQ9eqBfVk4CSQX7h8?=
 =?us-ascii?Q?PK4IzijjFJwxQWzO/W367L4CiTltgB8z3ywooQA88fGlAyE/dBBSPzW4gXxD?=
 =?us-ascii?Q?U93SyrqxhZ3DGHGzPbjcqMSmLx74DxjExahwrKApTSxciZ3iJLr1M0rohiyu?=
 =?us-ascii?Q?s4BXoiX2UboBZ4YZF9hNK5LvDXJCgpb4yuEG+hRwwodQm+Z/1AHtkFyb+4a/?=
 =?us-ascii?Q?eqV8fXAMoNOSAe6B2oaFFiSsb+NTMB+5/gbYP+pYmwHhxS2FTz9XGbxuzpqg?=
 =?us-ascii?Q?rH+P++H1u+T0qihPJCAB1SPABX33adVfRMLE7d2UeLUsEYwZEM4LwFtwTwvO?=
 =?us-ascii?Q?F2n3gFfkX70NDF+k2BZR/NrDzRwvS02Dsnxj3NS53ngG393VUmq1DVDbqGMc?=
 =?us-ascii?Q?wzKwEUufC8uhgOt+nsn3rUMS90+OSNnWqvCz9ppP8JtCGFSnZINXK2s5ro3z?=
 =?us-ascii?Q?IwHskwOEOLMRjDkRsGfHxBlScmo2BTF0wr29cA2j0C8RKMgrpxTvWJ6Ou4Ur?=
 =?us-ascii?Q?Z6Mtl6+nFK/6Zy0/1Isymwqmj/H3kg3HEINWX8x75P4m8MRq3FkcgYcoRzEq?=
 =?us-ascii?Q?CtUeCuiwQ4xVwh5DrMEGwJMjLFh4?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(1800799015)(35042699013)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 13:23:00.3780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4c6108-b476-4edd-a8ac-08dc80aba0bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7864

Hi Julien,

> On 30 May 2024, at 12:35, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 30/05/2024 10:40, Bertrand Marquis wrote:
>>> But we are making assumption that all TEE implementation will have its
>>> node inside "/firmware/". I am not 100% sure that this is correct. For
>>> example I saw that Google Trusty uses "/trusty" node (directly inside
>>> the DTS root). On other hand, it is not defined in dts bindings, as far
>>> as I know.
>> Regarding the firmware part you can easily handle that by looking for /f=
irmware
>> and create it if it does not exist before creating your sub-node and thi=
s should
>> be node in the optee node creation function not in tee.c.
>=20
> This would work if the node /firmware doesn't exist. But how would you ha=
ndle the case where it is already present?
>=20
> I looked at the libfdt API and AFAICT the DTB creation needs to be linear=
. IOW, you can't add a subnode to an already created node.
>=20
> There is an helper to create a placeholder, but AFAIK this is only for a =
property. You also need to know the size in advance.

I thought it was possible but i definitely can be wrong.

As right now we have only one need for the node, we could delay a possible =
solution and just create it in the optee driver.
Designing a solution for a possible future case right now seems a bit compl=
ex without a use case.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


