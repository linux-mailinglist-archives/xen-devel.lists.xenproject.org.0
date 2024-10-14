Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F343399D713
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 21:14:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818870.1232161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0QVp-0002qh-BI; Mon, 14 Oct 2024 19:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818870.1232161; Mon, 14 Oct 2024 19:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0QVp-0002og-8I; Mon, 14 Oct 2024 19:13:49 +0000
Received: by outflank-mailman (input) for mailman id 818870;
 Mon, 14 Oct 2024 19:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7KN=RK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t0QVn-0002mR-Mz
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 19:13:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f403:2613::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f2a90e1-8a60-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 21:13:46 +0200 (CEST)
Received: from AM0PR03CA0074.eurprd03.prod.outlook.com (2603:10a6:208:69::15)
 by AS8PR08MB9765.eurprd08.prod.outlook.com (2603:10a6:20b:616::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Mon, 14 Oct
 2024 19:13:43 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:208:69:cafe::3) by AM0PR03CA0074.outlook.office365.com
 (2603:10a6:208:69::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27 via Frontend
 Transport; Mon, 14 Oct 2024 19:13:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Mon, 14 Oct 2024 19:13:41 +0000
Received: ("Tessian outbound de6fe3af73ff:v473");
 Mon, 14 Oct 2024 19:13:41 +0000
Received: from L0ed85c415d29.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 94267DEE-95B0-4251-84F2-46BFA76DA3DE.1; 
 Mon, 14 Oct 2024 19:13:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L0ed85c415d29.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Oct 2024 19:13:34 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAVPR08MB9747.eurprd08.prod.outlook.com (2603:10a6:102:31e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 19:13:29 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 19:13:29 +0000
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
X-Inumbo-ID: 6f2a90e1-8a60-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TXyjL3gT8k/BILyc9rw6rWn6WEAhXP0tABJKkQIxGAK8DqMip8yCrE1kzH7Vt9U0DmTytTb72TEwPnc2U2BXVZdz6dZ9I/WNe7SHvXx0Ud7BF5mjfOqKtrMWN/Jg0U/jErM/MrWriP+rGazexj9IDiFjIaWAUL7CpPsORKlIanTa3l6a/PP9W74CiSyv7mhBuoIEnwQ6Na3vGqOdvQZgXOyrGoNNO98zNfKq73SRAeMLCB08aaY1MdYJjdJbMetLkbEegMTBY3/xdk7c+BIpkIeOyXU+K7W3Pqf583Oz9tCmLkRC30tA+k4t+ioUoUvGLNXYGFG/3FNkCEekk0KF3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/KVuWsxVKGj2DiidtHTa5AbD05NG6u65EnAfFVF+5M=;
 b=mqLCe/N1db1Ui8c0iOg75Lr+nM87G28s6iEBWCvxP4XFt9YKkjgTcr7iEdZvLg3XN4pkYs2nyjz3LBJ3ivJ62U6g2FE46Zeo4H0O+hvdiVQomY8/NTxMCDMGwcfmRhET+AEFXZSG09IVzYR1/WZYSkiJCboqrxfdgBZXzmRNk11mIehDeIsiGqX6pWA/GU+IvaAcO03fpLc+YfW+mOx4cEDcqc6lIe6s3ZbZtEyvuXB8y2a0AeCReRGfPaLpDnjlijBZGeSB9SaRzHmpS7q7ZP1uCtqbH0vy5xrNQeAK2jW4ABWknYp9mXdWJMC3XlJcuJU6B8Z6i/d/l0/xAY1Ceg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/KVuWsxVKGj2DiidtHTa5AbD05NG6u65EnAfFVF+5M=;
 b=KkiXcDsrjnQYuNQwBKhoFmo99iEkd7MG3xGz07DUP/4kwJtomBD33Ygt3pTiI69w0SHWwGqtZrzl8wYejmsSewdwSCANFebB3cH21AqVz+a5E2VVir4yv3/wyxVfk9IwrjtWtAtdmTkf8wT5aSY5goAUEbVrBGgkG/RugVEhxPk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d2102fc88d0a7673
X-TessianGatewayMetadata: Z3+bUpSpdPPASC6cc65tA4eG09Fej0J5aLYIbagSUqr77TCrxjsZwRrVX+Rcpgao5/t6a/YQrGcPGk9q74T+TS+gcZlDJi9qbYssDmYlIsH4PZx2vjL/yjXaB+uILdPUeGULOSV1t27oadkbdFJ+U55a4PbVLYvSHlg5A8YHL1I=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCo2X3W5EeMXwgus8GrkryIbV+xU0gFvIAdy2QLkKfa/exGG21bzp2Cdp8VfWmHFSNe6teCgpB5VKgl9KFBNzj0UpSFv3LW9/d0Qc/hwhqi7PF1LnUoCS1m/Mlnaf1xoAZL41P1m+jlyteAz3wozAKy2FFk7ee5esmXiUH5mzpum/nfQjejylmSg7MmPhNeGmrI3lec6QniL8tQoT0VWecP+/PHpZ/bLCuiiFnwPa631/M76Gh6XtPFrNbPM8TU28H7uwkK6EaevbOWXRlzWj9TLkRIy+qQFL8dKeUTU/N2ULxymCP31/YWUBFWiWz5XNjuIivAVArl828y//H4aRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/KVuWsxVKGj2DiidtHTa5AbD05NG6u65EnAfFVF+5M=;
 b=WUKMShR2puFYgp8LN+c2XoenxiZdQl18p1BprccX5NgkRi8iS2YzqiQsONAEDgHb6/XIq9ih/VVmW7prpBgUhbgw9b2IgH2Z6CyJeZgMiWFnK6zdzKAWq84jVRy60LQgDtZ7OjZ0fC6ZfXpu/Ca0Z+YWhqQohaIlkiDpg+9PKIMYDP7R8pLqs9sLt0lrCcWQin+yMjnjufy0ME3aMBFVMNIgO9B/mXsv6wKfxihIGSch+KahPPcx7BFUiBIYRVwDXm4LycIyz7L9dvv04HmGAWGxrVBfoURJJ5CyM9RajaogC9wAJga8B41mIDupPY4iuvQrKUUJVODSzKERoGlXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/KVuWsxVKGj2DiidtHTa5AbD05NG6u65EnAfFVF+5M=;
 b=KkiXcDsrjnQYuNQwBKhoFmo99iEkd7MG3xGz07DUP/4kwJtomBD33Ygt3pTiI69w0SHWwGqtZrzl8wYejmsSewdwSCANFebB3cH21AqVz+a5E2VVir4yv3/wyxVfk9IwrjtWtAtdmTkf8wT5aSY5goAUEbVrBGgkG/RugVEhxPk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
Thread-Topic: [PATCH v3 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
Thread-Index: AQHbGx19ZodYjKVFWki3qzuo9dh20bKGpAaA
Date: Mon, 14 Oct 2024 19:13:29 +0000
Message-ID: <594C2084-5F3A-43C1-9C1B-D27E9800548C@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-7-ayan.kumar.halder@amd.com>
In-Reply-To: <20241010140351.309922-7-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PAVPR08MB9747:EE_|AMS0EPF000001A2:EE_|AS8PR08MB9765:EE_
X-MS-Office365-Filtering-Correlation-Id: b3331b68-eecf-4a80-ff8c-08dcec8450ba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?d2M1b2ZpSkFtYVBZMnlQamgrWEJEMTVBQnJ6SDZxL0xKM0FDNGI2Vm93amxH?=
 =?utf-8?B?NHIrMkw4dzg2NGp2bllYdlZEaTdsSnZyMm1URU9razM5eHFCU2VsV2h2cVlP?=
 =?utf-8?B?THNxbFBHTzNvVjl6UENUTEczOGk4QlVMd05DSFNINGtORGRXcjhJcmpBa0tW?=
 =?utf-8?B?ZlNLNGdFWHovK3Q0ZkRrZGxrcEd5USt1WlVuOCtNd2ExS1RYSVpleCt5WHpR?=
 =?utf-8?B?YVRUSXN0NlM3RkpFVk1abGV2Q1FLSDZ3U3dpTDNLV3VXMUY2L3VCcm5lQWRa?=
 =?utf-8?B?UWxEYkZjVENXbXBFL1ZMMzlkQTZFOXVLS250OXhpMC9NWHkrMjgxeHNtdnJN?=
 =?utf-8?B?KzdZcXJianEwZFQvRHcwNnhxWm9HWnhKYXNoWFg1NllpZjN6UkRNNU5aSEI4?=
 =?utf-8?B?eUI4QUQwcG5jKzNDMzNmckR6SWtZT1dybmtHLytLVlRsZ1J3cGJtcWpLYVQ5?=
 =?utf-8?B?MExGQk1oZFRlTWZKbTNvWGxPbGRCSHFEVjVqOVdUZWZXVjQ2MUhtMUhaYUhS?=
 =?utf-8?B?T1U1QkxGck5YL0hha0hVc2FVVW15bXVrMkg2SENTU3A3UkdTZkYxK1pTRkgv?=
 =?utf-8?B?TFRwblNBSWtMK0dEVFVsYWllQmt1V2V2L2llaEdtcS9RemgxdWRzWDZRV1k4?=
 =?utf-8?B?Um9EV2V5RFFQOGloaDBlSGgxWkkyMC9QMEVJc1J6Z3loNmp2VGtuNkU3cHN3?=
 =?utf-8?B?THFQTlJPS2U4b1pQRElUSkZRZ1djUXJKcEpNTFFyaEZDc3NDTVhrNzVVTFBx?=
 =?utf-8?B?WDllQXdUUlBLKzVGU0tEcXViQmRKcDduL05OcEU1akVNWG5GcWhmUSt1eW96?=
 =?utf-8?B?RzQyelgzeDFUSzU4UUUzODBVY0J3Sm5sNnRwOTdJYWprT0ZIU1FrNEFoUHZr?=
 =?utf-8?B?ZEhMWFd0NFFHVVVrTkhNS2ZpSVVWRFpnaXVBQ3hkVGlFVjltek9PWDV0NUNp?=
 =?utf-8?B?bThhMUdKY1ZuNEhveEVwSDAxRFhkZk9GNWhkT0hRWUFsNXo1TlN6U09RV25m?=
 =?utf-8?B?T0RHV09PaWFnZlRzaU5CR3JHU284ejJqUFljWkN4UTRiUEE5dmFHekxyeTI1?=
 =?utf-8?B?a3lYOWM0NGNNT21BR3JhSk9CQnUwMnhGNkh1Z3VlTnRHaDR5ZnMrbVErellr?=
 =?utf-8?B?cjdzNWJ2Ymt1d055ZzZjVktEbGNUc0txZjErTUZsKzVYN2FuTURBMmJRQ2VO?=
 =?utf-8?B?REg5UTRPaVd5OUo5bFdQMFloL3cyV2dCWWZNWWZJcDVwNUdvNTJkaDhlMW5D?=
 =?utf-8?B?cXptQk5pSGc4aU1pSmJsT2Zzb3k3K3pMWWNzbUg2N3l1Q1ZXdStxN3RyVW9B?=
 =?utf-8?B?djZXc01mdmJmZmpJVGNYZVVrYXY5Znp0ZTk5bkFJTVR2UFE2MVMxYlNmQkZK?=
 =?utf-8?B?cWhQdEcrVzdYS0hxOWh3Si9mK1ZYRXAya2JHa3NudGQzd3hVQWY0TmovZmdi?=
 =?utf-8?B?cGwrZ29xa2FBNjZSVDJRY2Nlc1FUN1J2Y0M2WE95RmZKYVhQUDJkM3pEUENF?=
 =?utf-8?B?ZnBWNS91d1FVbmRtQ29abmhrWHpHZldWeUV5V0k5ZnBoWmJwV0t6MTB6a2R2?=
 =?utf-8?B?SmIwb2JpQXNQU2tMdFlHUlkwZ0ZwTTBRd1BQeUF3eU5QejVOSy9CbHNmdFlj?=
 =?utf-8?B?bDFNQjB4MmpCcVIvV1pjMHFRVmp6Y3ExWDZLMyt2cDUveWo1WmpEWG9ybkMy?=
 =?utf-8?B?UzgvMFFTdnc5UFBEZHNLV01OL0lVZVJXMlo3bzB6QW51SVE0YXoyY29GZFRa?=
 =?utf-8?B?czVSMDU3TTFpaVFlY2ZzR1hlYjl6dkpBODlsczdqZm1hVzRLSzBPeXo3eWR2?=
 =?utf-8?B?Q25zaHQxZ2pWK0M2aUJWQT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C7344105D891D48A8173B3951DE2213@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9747
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f10fcc5-8c16-48e9-03f3-08dcec8449a3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXhiQ21tME82cWd2b0R2b21kcWdIOTVCNTFaSWZjWUJDSjZUd2ZWdndYa1hw?=
 =?utf-8?B?NGMvWWJCcHNBeFI1c2w1OEl5Y1NLWEtRVGdwUWtwY1pLMHFCNEFSdi91RnNE?=
 =?utf-8?B?dktHQk5iSUpnUzNqVXlEMzJ2OFlHdzZVTzhuMFd6SWVkcHp4Q2F5cE80VGNS?=
 =?utf-8?B?czd2OVNpMHVrWXBNczVMb1NWbHQ1RnRRY0trYllBY1pVeWhibHNMYjhkZFdB?=
 =?utf-8?B?Z1NBdm5ldUN0WURDamtlL0s1VjBOM0JRS0Q1VG1vdUJIdFdyRDB2Z0J1Q3ZJ?=
 =?utf-8?B?dlNPZ05ETkxGNldCNmJuWWxHOGdvMkdHMXA3cjRzM1pTN1d0UFdHNXJRZmFP?=
 =?utf-8?B?VW1odkM5U2pYdXNmSENiRFhMSitJU3ltWTFJZmJxRGpsNDJDZ3o1d1BtYThS?=
 =?utf-8?B?dHdnOGF2QzhZelJ1OTNNdXZ1NnJBMXR1dFRpaWJmSThGRmdrbHdpRWFrb0ZB?=
 =?utf-8?B?MCtoNmFmalhLdXorQSt6YlFkcE1aM05xM1BPK0VtK0R1eERYaDNpdS96TWRo?=
 =?utf-8?B?VDZQTzg2emgxK2lJK0RtVFhDd0o5T3FtQTNlQTdXR2phRzFJQnkzeTl4OWlQ?=
 =?utf-8?B?cEtydFAzRVhHNWpKdFhsbng1TDhFaGtBRHZ2cEduMjdvR1prN0JWU0RlR3h4?=
 =?utf-8?B?aE05eGZKVTNQRHlWZVl6RXVBWWwzOTN4WWMyL0RQQzRkenZsVWMzdU5Sbkc5?=
 =?utf-8?B?eXAvMXRzZlRyS3dKbTlVMHMwSTVOcDNNSFQ4OFVNY3p0TEdVOGpDVkFvUGVI?=
 =?utf-8?B?b3lsQXZlbTBvYlkvLysyZVdxSm5RMWk2MmwwMmJveDBCVktoK09McUZlOGRL?=
 =?utf-8?B?dlVmMms5VS9TY3FJckhnZWVRQnh6b25ZTzEyVW1ZdGFKeVhySUU2RzJ6enRw?=
 =?utf-8?B?SWlCSkpUVnA3QkNBcmRxalhoNEVheUFmL0dtQTBPNXdxVjlHaTZJamtOSm51?=
 =?utf-8?B?TjJWeFpBMXF0NUh1MjJkZktITW5pcGlsdi9tQ3c5eTF5Y3piNm96ODlDV2x6?=
 =?utf-8?B?R3grZFJuT0o3eDFKMHo2KzQ2bnZnRVN3d1pDd3BzMUp2cVFzT3FERUlncmNm?=
 =?utf-8?B?Ty9TeUhvcXpPM3lWVFZpd3V1UXNzazNydi9mL2xFS3VGejRidEprQnNKSkNl?=
 =?utf-8?B?Y2hZeG1Na2FCWlpGRGI5RHhmeUMvRmlSVENvdjBBUlJpd2RteWxMNUFJUkhp?=
 =?utf-8?B?aGpRNmx2UkhGNG9jbEhKQ2QxYU1rN3ZxVHE3blRzZzJuYTFKT0lSaXJoSFFo?=
 =?utf-8?B?WWF1UXZSNzN0Yk9oS0Y1bG9peklldUdBWHVQdC90eWo5K3ZJbmpOSEU0cjNZ?=
 =?utf-8?B?dFlQVDF2TmtoMFJSTWxGUFJjZ0NlMzVEZjY0K3phbzZTZWpBczljYnNVaGVN?=
 =?utf-8?B?bmcxQXJHWWlaR0N1bTJ4MitYN29rQzZNMUo5UjNUQTNuNTNuTkhwaGVPSEVL?=
 =?utf-8?B?RWJUMWxxcXIwQ09EWVlDQUlDK3RTNHVmbXJWWkFLYTd3OXhBS0V0Z3pxSXJV?=
 =?utf-8?B?cFdmZDRsckpUYXJXZkdGQ1BQWEorWUNpKzZGQnQyY0dqTG1jeDlEVEh3ZDNn?=
 =?utf-8?B?V0VxcTdwemxTcXBILzRqZFM0WUpyQUlrRURJaFUxNDkzSGZncXZQWE84cjht?=
 =?utf-8?B?SDh2VGJkRC9vc0FKbGNmdkJGVWlHYVdOMDVOckVGS045aDBENVJJR1A1S2VO?=
 =?utf-8?B?ekhHWnd3NFIyMFB0b2FLMHkvUjBEYWEzN2ZkTVZFK0ZpQmM1eEE0VUIxd3N6?=
 =?utf-8?B?OGxVQWdOdTFKMkFtVnp6ZmN0YU1Ybkc4K1FwbE9TL09tNDhIVVhZMUlyUzFK?=
 =?utf-8?B?ZWlRUnFTOTJzQnRHU2YwYkhrNkJ5ek8vWDU3SXM4NFE4RVJCTGFrdnlZMWlK?=
 =?utf-8?Q?DLexnOxdn5ysA?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 19:13:41.2632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3331b68-eecf-4a80-ff8c-08dcec8450ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9765

SGkgQXlhbiwNCg0KPiBPbiAxMCBPY3QgMjAyNCwgYXQgMTU6MDMsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IFNlY29uZGFyeSBjcHVz
IGluaXRpYWxpemF0aW9uIGlzIG5vdCB5ZXQgc3VwcG9ydGVkLiBUaHVzLCB3ZSBwcmludCBhbg0K
PiBhcHByb3ByaWF0ZSBtZXNzYWdlIGFuZCBwdXQgdGhlIHNlY29uZGFyeSBjcHVzIGluIFdGRSBz
dGF0ZS4NCj4gQW5kIHdlIGludHJvZHVjZSB0byBCVUlMRF9CVUdfT04gdG8gcHJldmVudCB1c2Vy
cyB1c2luZyBmcm9tIGJ1aWxkaW5nIFhlbg0KPiBvbiBtdWx0aXByb2Nlc3NvciBiYXNlZCBNUFUg
c3lzdGVtcy4NCj4gDQo+IEluIEFybSwgdGhlcmUgaXMgbm8gY2xlYW4gd2F5IHRvIGRpc2FibGUg
U01QLiBBcyBvZiBub3csIHdlIHdpc2ggdG8gc3VwcG9ydA0KPiBNUFUgb24gVU5QIG9ubHkuIFNv
LCB3ZSBoYXZlIGRlZmluZWQgdGhlIGRlZmF1bHQgcmFuZ2Ugb2YgTlJfQ1BVcyB0byBiZSAxIGZv
cg0KPiBNUFUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5r
dW1hci5oYWxkZXJAYW1kLmNvbT4NCg0KQXBhcnQgZnJvbSBKYW7igJlzIGNvbW1lbnQsIHRoZSBy
ZXN0IG9mIHRoZSBjaGFuZ2VzIHRvIHRoZSBhcmNoL2FybSBwYXJ0IGxvb2tzIG9rIHRvIG1lOg0K
UmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KDQo=

