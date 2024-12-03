Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5849E1756
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:24:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847553.1262671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP8j-0007UU-3q; Tue, 03 Dec 2024 09:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847553.1262671; Tue, 03 Dec 2024 09:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP8j-0007S9-0h; Tue, 03 Dec 2024 09:24:17 +0000
Received: by outflank-mailman (input) for mailman id 847553;
 Tue, 03 Dec 2024 09:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mtxz=S4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tIP8i-0007S3-1Q
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:24:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20605.outbound.protection.outlook.com
 [2a01:111:f403:260d::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c35a63a-b158-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:24:13 +0100 (CET)
Received: from DB7PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:10:36::39)
 by PAWPR08MB10210.eurprd08.prod.outlook.com (2603:10a6:102:367::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 09:24:09 +0000
Received: from DB1PEPF00039234.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::5a) by DB7PR05CA0026.outlook.office365.com
 (2603:10a6:10:36::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 09:24:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039234.mail.protection.outlook.com (10.167.8.107) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 09:24:09 +0000
Received: ("Tessian outbound 3b1f0cd68b0e:v514");
 Tue, 03 Dec 2024 09:24:09 +0000
Received: from Lddfb3a6e10d3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F16E8829-C206-4FB3-9E2C-4D0A02D78D05.1; 
 Tue, 03 Dec 2024 09:24:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lddfb3a6e10d3.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Dec 2024 09:24:02 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB9414.eurprd08.prod.outlook.com (2603:10a6:20b:596::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 09:24:01 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8207.014; Tue, 3 Dec 2024
 09:24:01 +0000
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
X-Inumbo-ID: 5c35a63a-b158-11ef-a0d3-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SBbWMrn9u2hONENxX2RoxuJ4CkfAw/1WAeAzQ/Mez1+ppKhO+ooDPMn3np58KB0QUYvbuO5YHzwovjD2U8Egz/FqEde6Uj57z2ET5EZEa6vm7UpTsADid2d8dRx2aY7HobpXYw0vfNCsNz4RyYv57yLJRZ4KpxUkPhUP/+6J2KZ2ZH06qmje0ZLjMuheu10lasEMe9T79Dtn5qeMLr3wOO3RbIcnTTsZhgTQ2NtUuw+k8Uzz8Ui1qEfiV2n8MNX2JEh4MRZE5BcpM6u4t3x+OcGa/z16trmVrQcL4oEnVD+wP8+dSp1ET/xm/MpQ/4M8WLc2SgvFQa18Ggx+Q4iINQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6XyTv27PWT0FkuwHgF5iVQqnoDihYutOn6vnsjZDgs=;
 b=Ru12QLpbzqLYxo/3rGYtmGasq8oYdbgdel07CMUxCsCE0VWrQQxrSsMMk/jyXpFm/2Pz9m2psSyEQvawVdSwjT3hAou/xDcvSZg9Wcz+rx0mLHGD+7jfcuZlOS8z237a7WWaXoho2grXur0+tJAOy92gx4ZdVwYMljfj6DXVnjNGdvlBT96PH2AoXuRFT2lI4OAshI/oQ7GqeJLH1sZjAi2ZKjKZlcCs6axgacsw1BmhPbCu7BKfbxjpRNMQjkuz41hubqkkyF8qzFbNcGwhxwx0ETeINHLAQDuzdqYt564jrJ4bxXQOlky646cilKrfMQW+wUu4Dr3BTUqyTUlhNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6XyTv27PWT0FkuwHgF5iVQqnoDihYutOn6vnsjZDgs=;
 b=ZEDjlVj0qDRGakd1wxTz8YbXV2qjUVxqaFAAttaGZRhBCX6vtSbHY1D5EeW+Jo6asi/a96cBBxqboMeUNkU7jC4g6dimFA1HHGnnuUTR6xrwBmu20h11XDivXvNTntAja1U19cNVS73dY3kC3aEXc4AU8CCBohRZhaTOCcLcPJU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b117ce788629a830
X-TessianGatewayMetadata: q2BVB+UWw1N4lW06PgTFI3LH38QKSwyHp+I7kurV778AyniaKsIFFYs11L7o30uGKZqfbpIWMkTh/hTNy1gkQxWJTsUmlNrcWrt58TZrdf9b7nz0peLPk81Wvfkkr8NgEnmsOQmAai7KsxKnpKn8SGh+UdP5NcDYWnI2NrNe3PY=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xt9wVcJVPY9+xo4588RFbO9CnfyLfGb2ZKzzdd/9H19j5eMWULFSHGO6ReIUP9W0QKJZpuwl932jwfyK4fkg2THxUkOVbsodkBV+6+ITEltQOeylcC9hsnOX54ODo30YYfg5IKD3uDR9+gZ+xCw45FieYM7eyVcG8UZ2nG05eCfQkViYEt9PvmxQjFP7S4oqJIqCD9UfBz1BS4QeBmcr14SqkgXGdkz5malSkX2u3jy3dlF7sqqbiielGrw2Xx//CLX/iUgCAxS1ZyyKiPKosUPWNEtmRYktf0+V5Bztpiy29Sf6wwj1ZxwJ4vc6x469Xg5aU8lAUYLQqZZ9/mmF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6XyTv27PWT0FkuwHgF5iVQqnoDihYutOn6vnsjZDgs=;
 b=Q284QzLH6Bcqd4ZL17UuAH2q6cosF4BnGakkfnZGloCmYIAK2138ueOFSL9klf6KaZNpxjgeOUhkdrbQy0eFEJwwKhlzW9yI2KRk20vfYDv5Gd+Nf89NKKMjStB9CnLn1V3y8ZI3aHdlJoLPXMhFwHMpuL7z90QNPmOMa1/fuQaRCFtlLb9HD/JxNTSMws+WAqeCR+rROBVNmQQMPxUwRxVjl9vBGBPBxXl3sx5xn474tD2sZ3cM4ZR1CAlK6kRnJRH8g1DE5TXX57THlDubtU+xsBegAwr98SjzAsvB7DVj4u7U2AP/DTw0VzT/L/4jm2ce6lk1B8E39ulk7v/MOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6XyTv27PWT0FkuwHgF5iVQqnoDihYutOn6vnsjZDgs=;
 b=ZEDjlVj0qDRGakd1wxTz8YbXV2qjUVxqaFAAttaGZRhBCX6vtSbHY1D5EeW+Jo6asi/a96cBBxqboMeUNkU7jC4g6dimFA1HHGnnuUTR6xrwBmu20h11XDivXvNTntAja1U19cNVS73dY3kC3aEXc4AU8CCBohRZhaTOCcLcPJU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] bootfdt: Add missing trailing commas in
 BOOTINFO_{ACPI,SHMEM}_INIT
Thread-Topic: [PATCH] bootfdt: Add missing trailing commas in
 BOOTINFO_{ACPI,SHMEM}_INIT
Thread-Index: AQHbRWTfGBof/YMyMU6ZlfcGMKQsgLLUP1YA
Date: Tue, 3 Dec 2024 09:24:00 +0000
Message-ID: <0CEE35C9-48AA-4A88-A8EE-4FF29220D07F@arm.com>
References: <20241203092214.276453-1-michal.orzel@amd.com>
In-Reply-To: <20241203092214.276453-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB9414:EE_|DB1PEPF00039234:EE_|PAWPR08MB10210:EE_
X-MS-Office365-Filtering-Correlation-Id: 37576c98-604c-481f-f6ba-08dd137c3de4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?5Yr265at3Gaq+yx0vrVc4m3NLe2J+KuC63vDFcrf60/UDEsxCL/AhBND/j8a?=
 =?us-ascii?Q?LjK2oqJeVBg842/IU4utuWfu3AHfd6/aoCqw/QhSFB1ASJNg+eXKmIXtW1Wx?=
 =?us-ascii?Q?ihbZIB64wvQ3v+kXI+flYEKcGD1XjBHLfdwZvw3Zsoyqi7oN0bd8+OWHsVab?=
 =?us-ascii?Q?IOMuzqosnOpEmsPaisfpZ3VC8yfDAbn2w8CIsm/cWaWMWu+ZVW4a+OY3mRgx?=
 =?us-ascii?Q?h/rpkg2QMwZyGWiu/i+QZCfY5FTTaPQAujG0sjsxqTXwosTY2UfvGUuv9i1d?=
 =?us-ascii?Q?D8YsRJVLyesHTY5CLZBQqY33vw+gZGw2GM9EpPCw0TpQgGhjAVjWkPOYCXom?=
 =?us-ascii?Q?hOaTU43ffNuHwtlSCIVosqdPpjDJ1lxFIhGUW01lVqCMnjK8MmyXTVmGgemH?=
 =?us-ascii?Q?P9vn6SHkYXmgO3EKmlpm6JaWlWIU6+ImyA3zOa6OI9kOWkRxcbap/5jwUQ+0?=
 =?us-ascii?Q?Rq6O0EFC9ESVG3X9Rhigv1Z1JIc5wStDGjcnbtqZ3Qj7oZh7AfYN28zL65oh?=
 =?us-ascii?Q?9Wcr+3H2rNI5hpyswJrVS0jkWoykzNTafnx3QcPClBAae9PhFGZpfZh42bDs?=
 =?us-ascii?Q?9ejfiqy0mfyC1gszhozU9OYXMI6l3JU1dejxr32TpcCV1X+MxtP3eYUYwyT5?=
 =?us-ascii?Q?/CDKs5jxqgztQn6cdES5+CEPVvUUNXt+hPutiRUmSoqm2BDm6zac4Rk9FMwz?=
 =?us-ascii?Q?Ty/eW92koRVU/9eV4ZToRsj4VnBTnZnI/PFz49lEWj7KR+pd+6OQyhbHT4Zb?=
 =?us-ascii?Q?B6soW1nOUtP28O5XCA9aWarcH9+yYhuKX+4BLQlxojDUFC/f3NTZjJNIGSSe?=
 =?us-ascii?Q?ZUAlkBu9fpb+L7O+K9RH17lzmDAAYVzKFotO84PDg44H//peEDNqAzNG9tbc?=
 =?us-ascii?Q?kal2KhZqN6re432YTm/ebT68urnUTfa8s5N+rlieb8Wk6bW+Fz9OZ+2wwzkp?=
 =?us-ascii?Q?TCmvW0aU5Uiv1Lbd9duycwPCHF7kPkY3S5dVrrERXyDJPBOSB1X589bzjzX7?=
 =?us-ascii?Q?JXrqgLP7EECkp/u6YXYFu8APUKkMAEHXaAoJbfU0xyGPyNlWV9JYoSPk6Wkv?=
 =?us-ascii?Q?S9gpTSgxaTpPyhAEHKGR2o0C2cIkcYhY97FuVjr90tpzQjrPmeuaAdQ/hgFx?=
 =?us-ascii?Q?ySNO+KoOyPvyuWzRtpkGiWCPlyOc+293vTyyeLCLcN49FOvsBi4jlGbM986b?=
 =?us-ascii?Q?s7cYwrZlM0Bl6gjlm51PoEKLrBkMCkVcQ6bwBAvDVy0peX8mgo3IysUR0OIm?=
 =?us-ascii?Q?poVuGy7UXEDQX949T3s/ygU7LCE5Dy+UkF1Idg+5uXooR1L/u1h7OZPj1YvD?=
 =?us-ascii?Q?YQIWyQV/WzI2VSz4zHdlelGZuOPqKuQwwFyndpP12YTTFMtUbZMWw45a7nXP?=
 =?us-ascii?Q?zKqug48sEgKWTg7eFmWSX0nXUW9fZzCUVoKCdOLeln5cDf1rJg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B9E705B91D3EC14AAD431A5C2DEDB501@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9414
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b8b677af-fe60-434f-c498-08dd137c3903
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|36860700013|14060799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yn/5hNb6fT4lZuaF8bb0Cf3lQv2neXliFkE2nbHZroWhNEEUHhri7sp0BZhM?=
 =?us-ascii?Q?FQU16QYoNG6XL8lebWmofextMeYITAuHi8ojrVMzUN+kXNYa9mioGGFvg/Ot?=
 =?us-ascii?Q?ba8Pgf0nKM2hqJFLjMsKLlBSsUWiS2I0ei2GTbaHpKEOOTBPBeq+FJNSTaDl?=
 =?us-ascii?Q?4rKmqncAIf4M5rf4AKY6fwGSUTgg1uBBFiuzVJfJqIMOzagavc1slMWVodxR?=
 =?us-ascii?Q?adShysfelCOKtTTCl9DFZNNp8Wh6QK+7qIieaZStg9+reGVfTjCUz0gqqpZk?=
 =?us-ascii?Q?Vs82H1pf2foGSprx9RjiCoCAk8NbCY8bi0OP6/NZa/drGaR8kxZxg2LXBTAu?=
 =?us-ascii?Q?vCLWz+V+InNOzCwyx3sA555BNWFPqXx67eTDrGf7iQZeATHJEz/TyCVNtzpc?=
 =?us-ascii?Q?HTG7f98cwhFKatDhJ4V2ZsRTLzyN4/K5EzAcaPWI1QSic/Xoh5lvDylDM1Gj?=
 =?us-ascii?Q?dX0KuRKvAl4IHCE4GALfZAWFBXsPdAEuE3KHyCOtVSQTx9UQ7MrO54whN1ah?=
 =?us-ascii?Q?lpyMXKcjAcAh5EZQpd2T2ixiC5xNpVyPyCzVjYPIg62wtnXIz+lPVav/IcUh?=
 =?us-ascii?Q?HH0m88H81YDX4DDYED2Z6VwdpkB3VNjEuKV76N8VI28sGUOaTJSDU44Rmbin?=
 =?us-ascii?Q?CZ9ds8fKhUxc1altCCM1uuv/7OC2oe6g1AJE40Y64b9skggQAlsB5v4KdXbl?=
 =?us-ascii?Q?4sJLwAB6bYJOO6oXBcxLwI21RAhMb7Fa0CWxA0Qfof4034itncYLU+R1FR01?=
 =?us-ascii?Q?T4N/9jyt9dmqvoOvyCQacbNIdoE+PiBshN+JPTyO60xoY60AmhKLGRhLLEjI?=
 =?us-ascii?Q?3e5ZI6CYf9YRnNI5AQ5kYEwyosgxnCiGnsmxz6HTNpjOsw8YuLCGzqnnpymK?=
 =?us-ascii?Q?Ma7HtMqoK7CAvkfya813dtJRtFZeCEIznrOEzmQ7EWCSqyPY09r8gYzMZpO1?=
 =?us-ascii?Q?Jpvtf9qR4h0hOztZ20rDD0DxfAkn6OSgivNAn8FCt8UjJafmptGG0m2nOTXK?=
 =?us-ascii?Q?I2ySTMkiSyQIZzDJW5fxkRgbM35wdf5grGISy0jjWWFL+t+8ZJUAhIozmoXf?=
 =?us-ascii?Q?r8EseFqPpKcuzMUYa2D2x9pqVitrw/QVStr2XbRnhqVgfIfnBR/FhMYuft3A?=
 =?us-ascii?Q?8CzK0M8uZ9ky9f22peTp6QMKlEQNeOrRf2wOo46uTx+wLRwS9JhecqM0HSaF?=
 =?us-ascii?Q?LSYhaKrqnprwsxHAYPBW50UowTmtX6GUOeGFEkkdgQntWqSY+RSOWa2Uv+AO?=
 =?us-ascii?Q?ya+bZRAQVh4voqsclVvb/DRRsY6y5HXVYYiqB0jU+cPYHEnzzBSr4PhEkj5r?=
 =?us-ascii?Q?kfWhCkNmvvH3o5RcxGJWSzpsmLu40ZOxMEcbAS5iLliex44eoecHUNyPDhb6?=
 =?us-ascii?Q?Sd5vNZ3V2QXSGqkHUxnNBcDWtXbpGLzY0cMHi56sJIWmPFe8n2c7pkoZr9M+?=
 =?us-ascii?Q?T5J19uP9dKdk8rBa6j7SNu2AAqV8AKvh?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(36860700013)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 09:24:09.1766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37576c98-604c-481f-f6ba-08dd137c3de4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10210

Hi Michal,

> On 3 Dec 2024, at 10:22, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Commit a14593e3995a extended BOOTINFO_{ACPI,SHMEM}_INIT initializers
> list with a new 'type' member but forgot to add trailing commas (they
> were present before). This results in a build failure when building
> with CONFIG_ACPI=3Dy and CONFIG_STATIC_SHM=3Dy:
> ./include/xen/bootfdt.h:155:5: error: request for member 'shmem' in somet=
hing not a structure or union
>  155 |     .shmem.common.max_banks =3D NR_SHMEM_BANKS,       \
>      |     ^
> ./include/xen/bootfdt.h:168:5: note: in expansion of macro 'BOOTINFO_SHME=
M_INIT'
>  168 |     BOOTINFO_SHMEM_INIT                             \
>      |     ^~~~~~~~~~~~~~~~~~~
> common/device-tree/bootinfo.c:22:39: note: in expansion of macro 'BOOTINF=
O_INIT'
>   22 | struct bootinfo __initdata bootinfo =3D BOOTINFO_INIT;
>=20
> Fixes: a14593e3995a ("xen/device-tree: Allow region overlapping with /mem=
reserve/ ranges")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/include/xen/bootfdt.h | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index cea40ee11706..343c48b73d2c 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -145,7 +145,7 @@ struct bootinfo {
> #ifdef CONFIG_ACPI
> #define BOOTINFO_ACPI_INIT                          \
>     .acpi.common.max_banks =3D NR_MEM_BANKS,          \
> -    .acpi.common.type =3D MEMORY
> +    .acpi.common.type =3D MEMORY,
> #else
> #define BOOTINFO_ACPI_INIT
> #endif
> @@ -153,7 +153,7 @@ struct bootinfo {
> #ifdef CONFIG_STATIC_SHM
> #define BOOTINFO_SHMEM_INIT                         \
>     .shmem.common.max_banks =3D NR_SHMEM_BANKS,       \
> -    .shmem.common.type =3D STATIC_SHARED_MEMORY
> +    .shmem.common.type =3D STATIC_SHARED_MEMORY,
> #else
> #define BOOTINFO_SHMEM_INIT
> #endif
> --=20
> 2.25.1
>=20


