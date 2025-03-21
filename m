Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E4AA6BC99
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 15:11:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924087.1327426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvd5I-0005FP-4R; Fri, 21 Mar 2025 14:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924087.1327426; Fri, 21 Mar 2025 14:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvd5I-0005Cp-1j; Fri, 21 Mar 2025 14:10:52 +0000
Received: by outflank-mailman (input) for mailman id 924087;
 Fri, 21 Mar 2025 14:10:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QZeu=WI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tvd5G-0005Cj-Bd
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 14:10:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20625.outbound.protection.outlook.com
 [2a01:111:f403:2612::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 491d1eb2-065e-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 15:10:47 +0100 (CET)
Received: from DU2PR04CA0281.eurprd04.prod.outlook.com (2603:10a6:10:28c::16)
 by PA4PR08MB6175.eurprd08.prod.outlook.com (2603:10a6:102:eb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 14:10:45 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::79) by DU2PR04CA0281.outlook.office365.com
 (2603:10a6:10:28c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Fri,
 21 Mar 2025 14:10:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Fri, 21 Mar 2025 14:10:45 +0000
Received: ("Tessian outbound 9f6e20ec4b41:v597");
 Fri, 21 Mar 2025 14:10:44 +0000
Received: from L06f4bc508187.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2E7C1A03-1596-4941-B00C-31C27D8F7B93.1; 
 Fri, 21 Mar 2025 14:10:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L06f4bc508187.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 21 Mar 2025 14:10:35 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VE1PR08MB5822.eurprd08.prod.outlook.com (2603:10a6:800:1a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.37; Fri, 21 Mar
 2025 14:10:34 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 14:10:33 +0000
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
X-Inumbo-ID: 491d1eb2-065e-11f0-9ffa-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X3r8Vz9yyTud7AslPzrmf7oNx6cdocW8dcUjNkPiW70pE6mMN29F0++fMQVzHFZ5qhDOqZrnYDb+hqoo8TpBCi2+JksOElNXe6R2KulNFQZafRJT86WCDWTrO8cq2XDmLJ/v31mRVCXlGu/3Uq57pfybgyB2GV8Ye3VMWCa9Dk/ImU+NXgEfB142Xm7Lj/7c/+b0YKmJxF3wxTLuNzSVwDjCj2dGFBHC9V1O1YfYqDgDtnag0BZEjZGpZlrLkYG/uEXylzxBMUlaX8YPcUabHkofFOJpN2NYVR0bBfmDN9+AoS0Ab6gKbzWDEvscj6ndvE8FeN4ryXYuJ4CIV6HvVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oF2ux00rlnmLE5mWvYw/tbw7rOF3AScU/yhrKyfeNp0=;
 b=Ew3P7wXA92Yf4ZhLHuvP2/XiaVJ6ol7ketwkmaes40dn+Q/ajgvckDsSebw0T3BB/z+6FXanA/sLzuIGh118U1HbhFc+4Bx2nRaU3VIAlQ6/GXC2sX9Ft1MkIKLuTUMpwrN9Oko4S25tnXBGUGnZG9pA02cC+qRhy8PzR7DVPLSl0ArKwK9npo84ih3XH9vVGU9bDps/XWZVw3g7Jpok//eLnycZ69PCFgGf0UryR68WFkb5KIsxUzbIyMInxOVo2KbbcSbx4PVykU5psMoNT0n0pI1XNL+x/YZICzNDynTqKa04AFDGajUAwtj9V5RMbaTilJ9jLaAooVjAvqsCAg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oF2ux00rlnmLE5mWvYw/tbw7rOF3AScU/yhrKyfeNp0=;
 b=TUq1drGH+6ySj2y8Lwx0RaA1vVoMh8B/6RKbSTKfaIDWlzUs9Wh1sK6BLJgO/tJKBB2MJXL9UqP2UQhMahlbvoXPBf9lKJvYRj4GNCjXL8B2nsJQPcrztDF2SoK+b6vQ7WFSaqykeSruipZvEOffqG2d+3cuSIxve8QTxc83fNk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d95fbb6261b48749
X-TessianGatewayMetadata: JOLqp3QHAAgrwNPM4DJPG857xPp6EN45/OUrku4QgXVCCIME8jfqVeO6/X3f8sENiYx8L5puk4vw7nNklrleqD03nWKSKwo1v0+tnRss0j9maeFapMbaUULJQuXHhEMk3MhtgjO4AxHAqGfbyutnR8FwhHbvTSfhyGu6QL6bVzs=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzjd9V82YeZcEdzJ/R4XhiCAt/2fZhRKVSkkFscLp4U1GCXd9BxiPajTLXdNsokhZ5r3U6rAA5PhSQ6AQWLJGG8rndMuJBz+SGbl04al/b+fK8AjCDo0PmJP7jJKBGp14c5+HUFaz77caLfgwiPySKeZKtASFpWwTJ3TDn0Kw4f8Tgrfp7mfkAdKiU9xpuGGwb03Ei5BpN/emdfyZs3nhXdlNql/uwnZA2+Q8hX5ebnJOSff3DryKf8po0fh6FSjQaeIA7d5HXLMjdWrzTYxezi6+4ZDwZXkccOpWQ2lyroPHSagMzSutsUYUKp8SvBT7fBX53NQ1NB1CxgJvAF3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oF2ux00rlnmLE5mWvYw/tbw7rOF3AScU/yhrKyfeNp0=;
 b=IJAAgyYoP1mF6E3kQYWG137oHX+39EWMGD1Xnvh94F3qK4jlOotA/dDHfRtPll9Kb4UZ10awn1uiYvkrbWYi2JfM0k0+U3YNPwClD4aPsk18Jv5QTNj2Eh9r5g8nxVqs2jhWT1AA4jaGp0w9BfPKvYaDEuXDVuwV4AY7m0k6v+c5tuoBvtciqSVXpqiw7ydCfMM2mtP1cwspZ8K16nBnqDQmB6BVgsporJlK1zw8ScGQc6gX7RNLye1/JVXx+yDPa1UtIP4fiEJFB7KaoECXoUefSfK71PCJc6PrF8CnI55OZ5rsAYbSxYck+m2FotoeZTA2Ac3yqsM+6ZdfXNl6UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oF2ux00rlnmLE5mWvYw/tbw7rOF3AScU/yhrKyfeNp0=;
 b=TUq1drGH+6ySj2y8Lwx0RaA1vVoMh8B/6RKbSTKfaIDWlzUs9Wh1sK6BLJgO/tJKBB2MJXL9UqP2UQhMahlbvoXPBf9lKJvYRj4GNCjXL8B2nsJQPcrztDF2SoK+b6vQ7WFSaqykeSruipZvEOffqG2d+3cuSIxve8QTxc83fNk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v2 5/5] xen/arm: ffa: Enable VM to VM without firmware
Thread-Topic: [PATCH v2 5/5] xen/arm: ffa: Enable VM to VM without firmware
Thread-Index:
 AQHbkcvqUcfBAkFPRke6B/ThQimwz7N9WnkAgAAIEICAAAx4gIAAPN+AgAADowCAAALegA==
Date: Fri, 21 Mar 2025 14:10:33 +0000
Message-ID: <C6F9E733-14FE-45CB-9C97-60C4BA87386D@arm.com>
References: <cover.1741617888.git.bertrand.marquis@arm.com>
 <400fdd82de6e61e8e7598a120bb0bbe2c354ab72.1741617888.git.bertrand.marquis@arm.com>
 <CAHUa44FW02v4_6pTiGqcWrFMLqdayuUF5pXM8cfKusOXHC7Jyw@mail.gmail.com>
 <7B45963D-8908-420C-89ED-15769357779C@arm.com>
 <CAHUa44HumXeMR66Pu4xMODHms4PiM7+ANmPB1tG+UO9BpGDpLQ@mail.gmail.com>
 <783A9243-EBA6-40CC-A0A7-4DD9E8AFE57F@arm.com>
 <CAHUa44Hm3Uv31LEEruBu-APCkkD2wwQew4UcUcqqgk+4_Tug9w@mail.gmail.com>
In-Reply-To:
 <CAHUa44Hm3Uv31LEEruBu-APCkkD2wwQew4UcUcqqgk+4_Tug9w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VE1PR08MB5822:EE_|DU2PEPF00028D03:EE_|PA4PR08MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: f5dc33d5-d507-4cd8-02f6-08dd68822c2c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aUNvSm5jOERzL0xsbHFsNWdlWXN2NCs2ZkJlQjRLOW9MT0E5dGIraGRNdXFQ?=
 =?utf-8?B?d3ZyZTRreUR2alZwNTlja0FhT0tDRWQ3emszZkhDSGFJZy9RNXRhVHZZSHVY?=
 =?utf-8?B?dDhOYkZZQVhlc0tWTzNCeTFVRFZIQzArUVRXLzR1b09VTzc4QWdBZUh1WDh5?=
 =?utf-8?B?SU5Ud0k4Z0srNjJnSGd3RTB3eUMvRmhQejk4R1ZzT1hXUkY2Mi9vRVBoc0VN?=
 =?utf-8?B?UXRjL3dySy9KL2JYM2VDam5HaEs0SnpnNUU2THlyQVVVK2RoVmhnUkYyOGlU?=
 =?utf-8?B?RGdMT0hJRzIxRDZwR3FkejZUSmZiWTdNZ2ZnNEhLU0dveDlMVE9wcVNmK2pn?=
 =?utf-8?B?Z3RQZmpsL01YcFFwNjJNcDZ2SWczNi81a0tuYUd4SkpkRWFlRE5lcHI4aWR5?=
 =?utf-8?B?RjJoM0wxVVJaQWNZNEhTYzdSclJZTDZDS25rT21QRWZzbTRLQU9LbTdXb1hD?=
 =?utf-8?B?QjlXbXVSZ09mS0UwNUFsdU9DY0xEdzBERXVTUXVMWjRUV01oRWcrbU9QUFNZ?=
 =?utf-8?B?Y1RrMGZnK3JxWVd3S1VOTGRFTGp4M3B5QnZjVms2Y0NPRlRTdVczLzRBN0dl?=
 =?utf-8?B?Ti9vTFhqV3M5YXRlcXE3c3VZSUIwUUwwRGhDMGpWWjVIU29nU0c3SVBLV01V?=
 =?utf-8?B?OXROSkd3RngxSzdGdndidGY5amExVnZObDVXa1ZPb2FUQ2tVVWUrZEpXbElK?=
 =?utf-8?B?UncxM3lkbkRERnVDam1za1NFdVRiZXhQYVpoM3hKSjJObWJUQmlkOFF0dWdT?=
 =?utf-8?B?WUR4djM1YWxvaWZCYldoZmpuUDdsQnlnMnFMMWdFS2pycGlsNDBqSmVyeXNX?=
 =?utf-8?B?WkJwclFpa2FXakR1SnY5MWo4SkhlQjJYV2YxUEpWbC9MazIzQmI3RUpFOUow?=
 =?utf-8?B?THlNY0hsK01YeHFNdWNVenZwTUcveUlzVjl5S2ZtTUZVZlBtMnI4ZVY0Z0ht?=
 =?utf-8?B?ckFmWEN5SkF6bS9jQ3ZzalVkdXp4VnJkc2gySEswWndrcndXRGYybWlueTl2?=
 =?utf-8?B?Y3NUTm9wQjBRb3Q5Zk9vQllVREJoZW5VTTNCQjNNRGFRTCtlNkdmOHpUOGVU?=
 =?utf-8?B?MnVrVmRia0VOLzdGTXh6QitQWnptQmJiSTBNQitDdS9iVGV3blcwM2lVTkda?=
 =?utf-8?B?N05uMTR0bHlqM1BHTnE2Y2Q1b0k3VTUzTzNMMlY5NCtiRm5qQ3ZzWjdxamZY?=
 =?utf-8?B?bmo4UWd1a1NQc3VydFlvb0hBYnZjekplUUF2K1NERFJPMmxSeW9QWDF5R2xu?=
 =?utf-8?B?WkVFSDRJYUNOTUZRejBHMkJGZzBGL1MxRUxWMFo2R2pBald3QVFBYmM0MjhS?=
 =?utf-8?B?UVpIc0R5TG00NUNGdHByWEZCcHRpN2szZ21EL01SV3VTcTZVajhjTUtjbCs5?=
 =?utf-8?B?MWkyMXBna0JKbU5LbndWUlp2UDl0dUNVRURCQ3AvWjlNMk1rbis2Z3QzOG85?=
 =?utf-8?B?Slc5NWlXNmZoM1R2dlhUVHVCTlR4WFczS3ArTjlCRGgyK0NlMUlZR1M1UFlK?=
 =?utf-8?B?SU9lMHVoa1hlRkpKWmpKajlMdGRsK3c4SU54ZWdSYWNwS0xuUUd3ZUhhTXR5?=
 =?utf-8?B?eFlOczQxYUQxYjQ4MnNEMThnTE5ETitidDd2ZVl4U3RycVJobHM3c1FJOTNj?=
 =?utf-8?B?M3N5ZThaM0dORmJ2N1IvYnRjY05YVVQ2MmtEamYxVFBXY3JoV29vcFg0aVp0?=
 =?utf-8?B?ZzRXUElQaE9SMWpRMC9FNmh1WlVRaGZOazlXS2p2NTNhcTBtUEtuS3FranNO?=
 =?utf-8?B?ckxZQkRQdStOMFNtY21JY2RZb0xUZmdBUEJPSnNDR1FzdkRwdFRoT1V5dkc3?=
 =?utf-8?B?QWc0eHd5YmdoaFUzdU1uNjkrQ1FlRHB4cERNN2E4YmRSb29SY0NDL3NKd20r?=
 =?utf-8?B?QVhWVisxNk9uRFVNYVVBNjNFdUpQeU4xSHhPWitkeTY1czZQSDVlbWxUallR?=
 =?utf-8?Q?iaTjR0xG6/CFHH/QQNNtKLUhxFeeth5O?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C43FFC74DD5204BAF2CDA8219501E9E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5822
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4cbea522-d209-4384-9016-08dd68822568
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWx6WTZWNlE0SzlQMlpPenUzeHdQK3ZpcElyL0R0ZjBnbTJ1K1ZUNlNFTzBC?=
 =?utf-8?B?N0ZMdjdzOXhVbXEvZW5Nb0MwcjU4R2dvZzM2QjJ5cGJKTGQwaHBxMXdOc1Mr?=
 =?utf-8?B?ZGptRlp3aXh0OGhYYnZuMzlWYzkyMEwzQXp5N1ZsaUNMUmkzMUJzcEpiTXFk?=
 =?utf-8?B?cGE2OGxIK2crK1JaT3NaN3dvWTRSYzBkUEp0bXY0QW55KzNJYm1jL0xQdUJB?=
 =?utf-8?B?VE1GZUUvWTlhTUF4czVuVTBCcU1wU0JiZUJHd2dxU29acnlaQ3p1emgvTW11?=
 =?utf-8?B?c2ZqNFBoNmIrSTZ3akRoTzdqdkhWdUVqWHNiV3dUUERNYzg2bGxpRk1sODVq?=
 =?utf-8?B?S0N1QlRaRE9xeTNRdGt6b2ZvbXJLZzE3TldVNXptRUgybk9PWDcvRHkvMGM5?=
 =?utf-8?B?R1FkSGwvSFVEdVhSVzJkY1kySmZpeWxoQlcxZHlITlM3WUVwMGsvbi8wMk9I?=
 =?utf-8?B?aTkySmN0YlBpQ0RqVFlnZGlCbjh1VlcveHZKYzg4dVc4ay9ZNEpMcDduTCs1?=
 =?utf-8?B?cVU0WmQxblZZeXhGendJRlNmVjk1cnMzbkExV2ZUWjl4YmJhRmR4ZE03VGcy?=
 =?utf-8?B?V2VwQm0zdXB6L0VjSmtSWk5Tb2Y5NnNVWEFJRityYXRDMzFqUFluYnFZYk5l?=
 =?utf-8?B?cHhhZ2FSS20vdXhjMnUvZWV6Sy9nL2YxN3NpRFFNbVJvWE5QUjJQVW1TYTNS?=
 =?utf-8?B?VG9RdnlidzJkaVM4WVB6c2NnZWVZekdQQXgrbGg5TFgxRVIxMEZITVBpRUl5?=
 =?utf-8?B?bHNaMjQwSG9LcGYxeGsyS082OXA2T3RvVzA4d29pSVlmQlVGSnBWTVhtRWZz?=
 =?utf-8?B?dnVPNjhZYSs4Zy90ZXZvbVgvWGNhQ2ttcW5rRmkyb3BSTTJtVkpNdG00QnJG?=
 =?utf-8?B?NnNTT2N0SG9aMTIxY3R0OHRQNGh1QktKUjBWYVNTUWR4WHQ4TlJwODQ1NzVy?=
 =?utf-8?B?ek1iSUcxblh2TnZ0OEs5QWYrUk9wS05QZExlTi9EU1pjbzgxR3dkMUhBM3dl?=
 =?utf-8?B?b2pFKzBSYVRBSGFXTWJyZlZ2cllva1VmS2I0Vzc5Rk9Nd0Y0VVNwN0REUWJt?=
 =?utf-8?B?b003ak5FdTBKUjJHd0dlamU2VllOVHVaVzcyN1A1eHFPS1FRZGxBZjI0Rnkz?=
 =?utf-8?B?OTNSZ1RCUjB5cVA0R3lZTEZjTzF3Q29JNjRsU3hqR2xjY2w2QmJGL0p3VndP?=
 =?utf-8?B?dSt3MG9QczJ6Q2RXbTdmazd6eGMxbW14L3pPT3JCUkpzUC80UVgrUmlGYjJw?=
 =?utf-8?B?MENsa2hDWk9NTHlicVVBM0I2dk5SMUR1Qnl6aDRZTHd1dTd0ZUdpZ3prWHJu?=
 =?utf-8?B?TlBFRmp0YjE3UzFqYUJUbGhmbmhYWVlWbWM0Qnd6amFBNnUxY2IrRW5KamxR?=
 =?utf-8?B?R3ZKa2FncjlDS3R6SW5MK0ZnQUljQ3F1RG9RWHlUcGh0Q2xhL05vNkZZb25O?=
 =?utf-8?B?OEpZOWtmc25MVzJWVStYdjR1NGYxRHc4a0Z4THpjS05VQjZmcXR0b01adnBE?=
 =?utf-8?B?MEJTS1JYSFNzaFFaL3ZUYXN1azlQZGI5d2NHWnpwMWM0TUYwV0ZGeVk0dkF4?=
 =?utf-8?B?UU1rNnhuQU1oNFBYbDAzdG82SnZaRWl0OXJqbTBzaGk2VmJNMDN6c2twTE5j?=
 =?utf-8?B?U1RrTFV4a3ZTd0RLQ0dUajg2UW9HWWp0dVFCc1RjZ0hOdmc0Rkp6SWxHbW5Q?=
 =?utf-8?B?WDEzNnlCTHhJY1FYenh1Y05OUGFQem8wRzdLd3hoSEdaSmpOUmZZK3p0b0cx?=
 =?utf-8?B?bXlXbzFSaytyaytpdG8vemFpMTk5cmRtb0dneGxURmZRdDF0REhDM1FpY3dj?=
 =?utf-8?B?L3R1NkRnUnlMTUFPcktOMGtWdFdMaTNad1NqQUhTUEp1THd5U1MxdkV0K3dI?=
 =?utf-8?B?bWdxbzdZWVJYMmRzWWFvbTE1T1g5a0FaZUJIZWpiWk1MWmNva3RTVi8yMmVL?=
 =?utf-8?B?aU1MT0RHd2lIeFRwckI3eGN1bmQ1T0l2QkpsSk5vSGVpdXpXQlVTU2RWbHJF?=
 =?utf-8?Q?Jd6VYCBH7mNFIQ2IB4Xfg3WkzL21Ww=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 14:10:45.2597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5dc33d5-d507-4cd8-02f6-08dd68822c2c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6175

SGkgSmVucywNCg0KPiBPbiAyMSBNYXIgMjAyNSwgYXQgMTU6MDAsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gRnJpLCBNYXIgMjEsIDIwMjUgYXQgMjo0N+KAr1BNIEJlcnRyYW5kIE1hcnF1aXMNCj4g
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IEhpIEplbnMsDQo+PiAN
Cj4+PiBPbiAyMSBNYXIgMjAyNSwgYXQgMTE6MDksIEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xh
bmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBIaSwNCj4+PiANCj4+PiBPbiBGcmks
IE1hciAyMSwgMjAyNSBhdCAxMDoyNeKAr0FNIEJlcnRyYW5kIE1hcnF1aXMNCj4+PiA8QmVydHJh
bmQuTWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IEhpIEplbnMsDQo+Pj4+IA0K
Pj4+Pj4gT24gMjEgTWFyIDIwMjUsIGF0IDA5OjU1LCBKZW5zIFdpa2xhbmRlciA8amVucy53aWts
YW5kZXJAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IEhpIEJlcnRyYW5kLA0KPj4+
Pj4gDQo+Pj4+PiBPbiBNb24sIE1hciAxMCwgMjAyNSBhdCAzOjUx4oCvUE0gQmVydHJhbmQgTWFy
cXVpcw0KPj4+Pj4gPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+Pj4+Pj4gDQo+
Pj4+Pj4gV2hlbiBWTSB0byBWTSBzdXBwb3J0IGlzIGFjdGl2YXRlZCBhbmQgdGhlcmUgaXMgbm8g
c3VpdGFibGUgRkYtQSBzdXBwb3J0DQo+Pj4+Pj4gaW4gdGhlIGZpcm13YXJlLCBlbmFibGUgRkYt
QSBzdXBwb3J0IGZvciBWTXMgdG8gYWxsb3cgdXNpbmcgaXQgZm9yIFZNIHRvDQo+Pj4+Pj4gVk0g
Y29tbXVuaWNhdGlvbnMuDQo+Pj4+Pj4gSWYgdGhlcmUgaXMgT3B0ZWUgcnVubmluZyBpbiB0aGUg
c2VjdXJlIHdvcmxkIGFuZCB1c2luZyB0aGUgbm9uIEZGLUENCj4+Pj4+IA0KPj4+Pj4gSXQncyBz
cGVsbGVkIE9QLVRFRSBpbiB0ZXh0LCBhbmQgb3B0ZWUgb3IgT1BURUUgaW4gaWRlbnRpZmllcnMu
DQo+Pj4+IA0KPj4+PiBhY2sNCj4+Pj4gDQo+Pj4+PiANCj4+Pj4+PiBjb21tdW5pY2F0aW9uIHN5
c3RlbSwgaGF2aW5nIENPTkZJR19GRkFfVk1fVE9fVk0gY291bGQgYmUgbm9uIGZ1bmN0aW9uYWwN
Cj4+Pj4+PiAoaWYgb3B0ZWUgaXMgcHJvYmVkIGZpcnN0KSBvciBPcHRlZSBjb3VsZCBiZSBub24g
ZnVuY3Rpb25hbCAoaWYgRkYtQSBpcw0KPj4+Pj4+IHByb2JlZCBmaXJzdCkgc28gaXQgaXMgbm90
IHJlY29tbWVuZGVkIHRvIGFjdGl2YXRlIHRoZSBjb25maWd1cmF0aW9uDQo+Pj4+Pj4gb3B0aW9u
IGZvciBzdWNoIHN5c3RlbXMuDQo+Pj4+Pj4gDQo+Pj4+Pj4gVG8gbWFrZSBidWZmZXIgZnVsbCBu
b3RpZmljYXRpb24gd29yayBiZXR3ZWVuIFZNcyB3aGVuIHRoZXJlIGlzIG5vdA0KPj4+Pj4gDQo+
Pj4+PiBzL25vdC9uby8NCj4+Pj4gDQo+Pj4+IGFjaw0KPj4+PiANCj4+Pj4+IA0KPj4+Pj4+IGZp
cm13YXJlLCByZXdvcmsgdGhlIG5vdGlmaWNhdGlvbiBoYW5kbGluZyBhbmQgbW9kaWZ5IHRoZSBn
bG9iYWwgZmxhZyB0bw0KPj4+Pj4+IG9ubHkgYmUgdXNlZCBhcyBjaGVjayBmb3IgZmlybXdhcmUg
bm90aWZpY2F0aW9uIHN1cHBvcnQgaW5zdGVhZC4NCj4+Pj4+PiANCj4+Pj4+PiBNb2RpZnkgcGFy
dF9pbmZvX2dldCB0byByZXR1cm4gdGhlIGxpc3Qgb2YgVk1zIHdoZW4gdGhlcmUgaXMgbm8gZmly
bXdhcmUNCj4+Pj4+PiBzdXBwb3J0Lg0KPj4+Pj4+IA0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJl
cnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+Pj4+PiAtLS0NCj4+
Pj4+PiBDaGFuZ2VzIGluIHYyOg0KPj4+Pj4+IC0gcmVwbGFjZSBpZmRlZiB3aXRoIElTX0VOQUJM
RUQgd2hlbiBwb3NzaWJsZQ0KPj4+Pj4+IC0tLQ0KPj4+Pj4+IHhlbi9hcmNoL2FybS90ZWUvZmZh
LmMgICAgICAgICAgfCAgMTIgKysrLQ0KPj4+Pj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlm
LmMgICAgfCAxMTQgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4+PiB4ZW4v
YXJjaC9hcm0vdGVlL2ZmYV9wYXJ0aW5mby5jIHwgICAzICstDQo+Pj4+Pj4gMyBmaWxlcyBjaGFu
Z2VkLCA2OSBpbnNlcnRpb25zKCspLCA2MCBkZWxldGlvbnMoLSkNCj4+Pj4+PiANCj4+Pj4+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmEuYyBiL3hlbi9hcmNoL2FybS90ZWUvZmZh
LmMNCj4+Pj4+PiBpbmRleCAzYmJkZDcxNjhhNmIuLmY2NTgyZDJlODU1YSAxMDA2NDQNCj4+Pj4+
PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJt
L3RlZS9mZmEuYw0KPj4+Pj4+IEBAIC0zMjQsOCArMzI0LDkgQEAgc3RhdGljIGludCBmZmFfZG9t
YWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkNCj4+Pj4+PiAgIHN0cnVjdCBmZmFfY3R4ICpjdHg7
DQo+Pj4+Pj4gICBpbnQgcmV0Ow0KPj4+Pj4+IA0KPj4+Pj4+IC0gICAgaWYgKCAhZmZhX2Z3X3Zl
cnNpb24gKQ0KPj4+Pj4+ICsgICAgaWYgKCAhSVNfRU5BQkxFRChDT05GSUdfRkZBX1ZNX1RPX1ZN
KSAmJiAhZmZhX2Z3X3ZlcnNpb24gKQ0KPj4+Pj4+ICAgICAgIHJldHVybiAtRU5PREVWOw0KPj4+
Pj4+ICsNCj4+Pj4+PiAgIC8qDQo+Pj4+Pj4gICAgKiBXZSBhcmUgdXNpbmcgdGhlIGRvbWFpbl9p
ZCArIDEgYXMgdGhlIEZGLUEgSUQgZm9yIFZNcyBhcyBGRi1BIElEIDAgaXMNCj4+Pj4+PiAgICAq
IHJlc2VydmVkIGZvciB0aGUgaHlwZXJ2aXNvciBhbmQgd2Ugb25seSBzdXBwb3J0IHNlY3VyZSBl
bmRwb2ludHMgdXNpbmcNCj4+Pj4+PiBAQCAtNTQ5LDYgKzU1MCwxNSBAQCBlcnJfbm9fZnc6DQo+
Pj4+Pj4gICBiaXRtYXBfemVybyhmZmFfZndfYWJpX3N1cHBvcnRlZCwgRkZBX0FCSV9CSVRNQVBf
U0laRSk7DQo+Pj4+Pj4gICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIkFSTSBGRi1BIE5vIGZpcm13
YXJlIHN1cHBvcnRcbiIpOw0KPj4+Pj4+IA0KPj4+Pj4+ICsgICAgaWYgKCBJU19FTkFCTEVEKENP
TkZJR19GRkFfVk1fVE9fVk0pICkNCj4+Pj4+PiArICAgIHsNCj4+Pj4+PiArICAgICAgICBJTklU
X0xJU1RfSEVBRCgmZmZhX3RlYXJkb3duX2hlYWQpOw0KPj4+Pj4+ICsgICAgICAgIGluaXRfdGlt
ZXIoJmZmYV90ZWFyZG93bl90aW1lciwgZmZhX3RlYXJkb3duX3RpbWVyX2NhbGxiYWNrLCBOVUxM
LCAwKTsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJBUk0g
RkYtQSBvbmx5IGF2YWlsYWJsZSBiZXR3ZWVuIFZNc1xuIik7DQo+Pj4+Pj4gKyAgICAgICAgcmV0
dXJuIHRydWU7DQo+Pj4+Pj4gKyAgICB9DQo+Pj4+Pj4gKw0KPj4+Pj4+ICAgcmV0dXJuIGZhbHNl
Ow0KPj4+Pj4+IH0NCj4+Pj4+PiANCj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Rl
ZS9mZmFfbm90aWYuYyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlmLmMNCj4+Pj4+PiBpbmRl
eCBkMTlhYTVjNWJlZjYuLjA2NzNlNTNhOWRlZiAxMDA2NDQNCj4+Pj4+PiAtLS0gYS94ZW4vYXJj
aC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQo+Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFf
bm90aWYuYw0KPj4+Pj4+IEBAIC0xNiw3ICsxNiw3IEBADQo+Pj4+Pj4gDQo+Pj4+Pj4gI2luY2x1
ZGUgImZmYV9wcml2YXRlLmgiDQo+Pj4+Pj4gDQo+Pj4+Pj4gLXN0YXRpYyBib29sIF9fcm9fYWZ0
ZXJfaW5pdCBub3RpZl9lbmFibGVkOw0KPj4+Pj4+ICtzdGF0aWMgYm9vbCBfX3JvX2FmdGVyX2lu
aXQgZndfbm90aWZfZW5hYmxlZDsNCj4+Pj4+PiBzdGF0aWMgdW5zaWduZWQgaW50IF9fcm9fYWZ0
ZXJfaW5pdCBub3RpZl9zcmlfaXJxOw0KPj4+Pj4+IA0KPj4+Pj4+IGludCBmZmFfaGFuZGxlX25v
dGlmaWNhdGlvbl9iaW5kKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4+Pj4+IEBAIC0y
NywyMSArMjcsMTcgQEAgaW50IGZmYV9oYW5kbGVfbm90aWZpY2F0aW9uX2JpbmQoc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MpDQo+Pj4+Pj4gICB1aW50MzJfdCBiaXRtYXBfbG8gPSBnZXRfdXNl
cl9yZWcocmVncywgMyk7DQo+Pj4+Pj4gICB1aW50MzJfdCBiaXRtYXBfaGkgPSBnZXRfdXNlcl9y
ZWcocmVncywgNCk7DQo+Pj4+Pj4gDQo+Pj4+Pj4gLSAgICBpZiAoICFub3RpZl9lbmFibGVkICkN
Cj4+Pj4+PiAtICAgICAgICByZXR1cm4gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4+Pj4+IC0N
Cj4+Pj4+PiAgIGlmICggKHNyY19kc3QgJiAweEZGRkZVKSAhPSBmZmFfZ2V0X3ZtX2lkKGQpICkN
Cj4+Pj4+PiAgICAgICByZXR1cm4gRkZBX1JFVF9JTlZBTElEX1BBUkFNRVRFUlM7DQo+Pj4+Pj4g
DQo+Pj4+Pj4gICBpZiAoIGZsYWdzICkgICAgLyogT25seSBnbG9iYWwgbm90aWZpY2F0aW9ucyBh
cmUgc3VwcG9ydGVkICovDQo+Pj4+Pj4gICAgICAgcmV0dXJuIEZGQV9SRVRfREVOSUVEOw0KPj4+
Pj4+IA0KPj4+Pj4+IC0gICAgLyoNCj4+Pj4+PiAtICAgICAqIFdlIG9ubHkgc3VwcG9ydCBub3Rp
ZmljYXRpb25zIGZyb20gU1Agc28gbm8gbmVlZCB0byBjaGVjayB0aGUgc2VuZGVyDQo+Pj4+Pj4g
LSAgICAgKiBlbmRwb2ludCBJRCwgdGhlIFNQTUMgd2lsbCB0YWtlIGNhcmUgb2YgdGhhdCBmb3Ig
dXMuDQo+Pj4+Pj4gLSAgICAgKi8NCj4+Pj4+PiAtICAgIHJldHVybiBmZmFfc2ltcGxlX2NhbGwo
RkZBX05PVElGSUNBVElPTl9CSU5ELCBzcmNfZHN0LCBmbGFncywgYml0bWFwX2xvLA0KPj4+Pj4+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBiaXRtYXBfaGkpOw0KPj4+Pj4+ICsgICAgaWYg
KCBGRkFfSURfSVNfU0VDVVJFKHNyY19kc3Q+PjE2KSAmJiBmd19ub3RpZl9lbmFibGVkICkNCj4+
Pj4+IA0KPj4+Pj4gUGxlYXNlIGFkZCBzcGFjZSBiZWZvcmUgYW5kIGFmdGVyICc+PicsIGhlcmUg
YW5kIGluIHRoZSBmdW5jdGlvbiBiZWxvdw0KPj4+Pj4gaW4gdGhpcyBwYXRjaC4NCj4+Pj4gDQo+
Pj4+IGFjaw0KPj4+PiANCj4+Pj4+IA0KPj4+Pj4+ICsgICAgICAgIHJldHVybiBmZmFfc2ltcGxl
X2NhbGwoRkZBX05PVElGSUNBVElPTl9CSU5ELCBzcmNfZHN0LCBmbGFncywNCj4+Pj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJpdG1hcF9sbywgYml0bWFwX2hpKTsNCj4+Pj4+
PiArDQo+Pj4+Pj4gKyAgICByZXR1cm4gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4+Pj4+IH0N
Cj4+Pj4+PiANCj4+Pj4+PiBpbnQgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25fdW5iaW5kKHN0cnVj
dCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4+Pj4+IEBAIC01MSwzMiArNDcsMzQgQEAgaW50IGZm
YV9oYW5kbGVfbm90aWZpY2F0aW9uX3VuYmluZChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykN
Cj4+Pj4+PiAgIHVpbnQzMl90IGJpdG1hcF9sbyA9IGdldF91c2VyX3JlZyhyZWdzLCAzKTsNCj4+
Pj4+PiAgIHVpbnQzMl90IGJpdG1hcF9oaSA9IGdldF91c2VyX3JlZyhyZWdzLCA0KTsNCj4+Pj4+
PiANCj4+Pj4+PiAtICAgIGlmICggIW5vdGlmX2VuYWJsZWQgKQ0KPj4+Pj4+IC0gICAgICAgIHJl
dHVybiBGRkFfUkVUX05PVF9TVVBQT1JURUQ7DQo+Pj4+Pj4gLQ0KPj4+Pj4+ICAgaWYgKCAoc3Jj
X2RzdCAmIDB4RkZGRlUpICE9IGZmYV9nZXRfdm1faWQoZCkgKQ0KPj4+Pj4+ICAgICAgIHJldHVy
biBGRkFfUkVUX0lOVkFMSURfUEFSQU1FVEVSUzsNCj4+Pj4+PiANCj4+Pj4+PiAtICAgIC8qDQo+
Pj4+Pj4gLSAgICAgKiBXZSBvbmx5IHN1cHBvcnQgbm90aWZpY2F0aW9ucyBmcm9tIFNQIHNvIG5v
IG5lZWQgdG8gY2hlY2sgdGhlDQo+Pj4+Pj4gLSAgICAgKiBkZXN0aW5hdGlvbiBlbmRwb2ludCBJ
RCwgdGhlIFNQTUMgd2lsbCB0YWtlIGNhcmUgb2YgdGhhdCBmb3IgdXMuDQo+Pj4+Pj4gLSAgICAg
Ki8NCj4+Pj4+PiAtICAgIHJldHVybiAgZmZhX3NpbXBsZV9jYWxsKEZGQV9OT1RJRklDQVRJT05f
VU5CSU5ELCBzcmNfZHN0LCAwLCBiaXRtYXBfbG8sDQo+Pj4+Pj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBiaXRtYXBfaGkpOw0KPj4+Pj4+ICsgICAgaWYgKCBGRkFfSURfSVNfU0VDVVJF
KHNyY19kc3Q+PjE2KSAmJiBmd19ub3RpZl9lbmFibGVkICkNCj4+Pj4+PiArICAgICAgICByZXR1
cm4gIGZmYV9zaW1wbGVfY2FsbChGRkFfTk9USUZJQ0FUSU9OX1VOQklORCwgc3JjX2RzdCwgMCwg
Yml0bWFwX2xvLA0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJpdG1h
cF9oaSk7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgcmV0dXJuIEZGQV9SRVRfTk9UX1NVUFBPUlRF
RDsNCj4+Pj4+PiB9DQo+Pj4+Pj4gDQo+Pj4+Pj4gdm9pZCBmZmFfaGFuZGxlX25vdGlmaWNhdGlv
bl9pbmZvX2dldChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+Pj4+PiB7DQo+Pj4+Pj4g
ICBzdHJ1Y3QgZG9tYWluICpkID0gY3VycmVudC0+ZG9tYWluOw0KPj4+Pj4+ICAgc3RydWN0IGZm
YV9jdHggKmN0eCA9IGQtPmFyY2gudGVlOw0KPj4+Pj4+ICsgICAgYm9vbCBub3RpZl9wZW5kaW5n
ID0gZmFsc2U7DQo+Pj4+Pj4gDQo+Pj4+Pj4gLSAgICBpZiAoICFub3RpZl9lbmFibGVkICkNCj4+
Pj4+PiArICAgIGlmICggIUlTX0VOQUJMRUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgJiYgIWZ3X25v
dGlmX2VuYWJsZWQgKQ0KPj4+Pj4+ICAgew0KPj4+Pj4+ICAgICAgIGZmYV9zZXRfcmVnc19lcnJv
cihyZWdzLCBGRkFfUkVUX05PVF9TVVBQT1JURUQpOw0KPj4+Pj4+ICAgICAgIHJldHVybjsNCj4+
Pj4+PiAgIH0NCj4+Pj4+PiANCj4+Pj4+PiAtICAgIGlmICggdGVzdF9hbmRfY2xlYXJfYm9vbChj
dHgtPm5vdGlmLnNlY3VyZV9wZW5kaW5nKSApDQo+Pj4+Pj4gKyAgICBub3RpZl9wZW5kaW5nID0g
Y3R4LT5ub3RpZi5zZWN1cmVfcGVuZGluZzsNCj4+Pj4+PiArI2lmZGVmIENPTkZJR19GRkFfVk1f
VE9fVk0NCj4+Pj4+PiArICAgIG5vdGlmX3BlbmRpbmcgfD0gY3R4LT5ub3RpZi5idWZmX2Z1bGxf
cGVuZGluZzsNCj4+Pj4+PiArI2VuZGlmDQo+Pj4+PiANCj4+Pj4+IFNob3VsZG4ndCBjdHgtPm5v
dGlmLnNlY3VyZV9wZW5kaW5nIGFuZCBjdHgtPm5vdGlmLnNlY3VyZV9wZW5kaW5nIGJlDQo+Pj4+
PiBjbGVhcmVkIGFsc28sIGxpa2U6DQo+Pj4+PiBub3RpZl9wZW5kaW5nID0gdGVzdF9hbmRfY2xl
YXJfYm9vbChjdHgtPm5vdGlmLnNlY3VyZV9wZW5kaW5nKSB8fA0KPj4+Pj4gICAgICAgICAgICAg
IHRlc3RfYW5kX2NsZWFyX2Jvb2woY3R4LT5ub3RpZi5idWZmX2Z1bGxfcGVuZGluZyk7DQo+Pj4+
IA0KPj4+PiBOb3RpZmljYXRpb24gaW5mbyBnZXQgaXMgcmV0dXJuaW5nIHdobyBoYXMgcGVuZGlu
ZyBub3RpZmljYXRpb24gYnV0IG9ubHkNCj4+Pj4gbm90aWZpY2F0aW9uIGdldCBzaG91bGQgZXJh
c2UgcGVuZGluZyBub3RpZmljYXRpb25zLg0KPj4+IA0KPj4+IEZGQV9OT1RJRklDQVRJT05fSU5G
T19HRVQgY2FuIHJldHVybiBhICJNb3JlIHBlbmRpbmcgbm90aWZpY2F0aW9ucw0KPj4+IGZsYWci
IGluIHcyL3gyIHRvIGluZm9ybSB0aGUgY2FsbGVyIHRoYXQgaXQgc2hvdWxkIGNhbGwNCj4+PiBG
RkFfTk9USUZJQ0FUSU9OX0lORk9fR0VUIGFnYWluIHRvIGdldCB0aGUgcmVtYWluaW5nIHJlY2Vp
dmVyDQo+Pj4gZW5kcG9pbnRzLiBIb3cgY2FuIHRoZSBBQkkga25vdyB3aGVyZSB0byByZXN1bWUg
dGhlIG5leHQgdGltZSBpZiB0aGUNCj4+PiBwcmV2aW91cyBwZW5kaW5nIHJlY2VpdmVycyBhcmVu
J3QgY2xlYXJlZD8NCj4+IA0KPj4gSSBqdXN0IGNoZWNrZWQgdGhlIHNwZWNpZmljYXRpb24gYW5k
IHlvdSBhcmUgcmlnaHQuDQo+PiBJdCBpcyBleHBsaWNpdGx5IHNheWluZyB0aGF0ICJJbmZvcm1h
dGlvbiBhYm91dCBwZW5kaW5nIG5vdGlmaWNhdGlvbnMgaXMNCj4+IHJldHVybmVkIG9ubHkgb25j
ZSIuDQo+PiANCj4+PiANCj4+PiBUaGUgbW9yZSBwZW5kaW5nIG5vdGlmaWNhdGlvbnMgZmxhZyB3
aWxsIG5vdCBiZSBuZWVkZWQgaGVyZSBhcyB3ZSdyZQ0KPj4+IGRlYWxpbmcgd2l0aCBhIHNpbmds
ZSBlbmRwb2ludCBhdCBhIHRpbWUgc28gaXQgbWlnaHQgYmUgbW9yZSBvZiBhDQo+Pj4gcGhpbG9z
b3BoaWNhbCBxdWVzdGlvbi4gSSBkb24ndCB0aGluayBpdCBjYXVzZXMgcHJvYmxlbXMgZm9yIHRo
ZSBndWVzdA0KPj4+IHRvIGtlZXAgc2VjdXJlX3BlbmRpbmcgdW5jaGFuZ2VkIGZvciBGRkFfTk9U
SUZJQ0FUSU9OX0lORk9fR0VULCBidXQgd2UNCj4+PiBzaG91bGQgbWVudGlvbiB0aGUgY2hhbmdl
ZCBiZWhhdmlvdXIgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KPj4+IA0KPj4gDQo+PiBJIGFncmVl
IEkgc2hvdWxkIGRpc2NhcmQgdGhlIHNlY3VyZV9wZW5kaW5nIGZsYWcgaW4gdGhlIGltcGxlbWVu
dGF0aW9uIGJ1dA0KPj4gSSBuZWVkIHRvIGZpbmQgYSBzb2x1dGlvbiBmb3IgdGhlIGJ1ZmZlciBm
dWxsIG5vdGlmaWNhdGlvbiBhcyBJIHN0aWxsIG5lZWQgdG8gc2lnbmFsDQo+PiBpdCBpbiBub3Rp
ZmljYXRpb24gZ2V0IGV2ZW4gaWYgbm90aWZpY2F0aW9uIGluZm8gZ2V0IHdhcyBjYWxsZWQuDQo+
PiANCj4+IEkgd2lsbCBkbyB0aGUgZm9sbG93aW5nOg0KPj4gLSBjaGFuZ2Ugc2VjdXJlX3BlbmRp
bmcgaW50byBwZW5kaW5nX25vdGlmLg0KPj4gLSBzZXQgcGVuZGluZ19ub3RpZiB3aGVuIGN1cnJl
bnQgc2VjdXJlX3BlbmRpbmcgaXMgc2V0DQo+PiAtIHNldCBwZW5kaW5nX25vdGlmIGFuZCBidWZm
X2Z1bGxfcGVuZGluZyBvbiBpbmRpcmVjdCBtZXNzYWdlDQo+PiAtIGNsZWFuIHBlbmRpbmdfbm90
aWYgaW4gbm90aWZfaW5mb19nZXQNCj4+IC0gY2xlYW4gcGVuZGluZ19ub3RpZiBhbmQgYnVmZl9m
dWxsIGluIG5vdGlmX2dldA0KPj4gDQo+PiBEbyB5b3UgYWdyZWUgdGhpcyBpcyB0aGUgcmlnaHQg
cGF0aCA/DQo+IA0KPiBZZXMsIHRoaXMgaXMgdGhlIHdheS4gOi0pDQoNCldlbGwgaW4gZmFjdCB0
aGVyZSBpcyBhIG1pc3Rha2UgaW4gdGhpcyB3YXkgYW5kIEkgaGFkIHRvIGRvIHNvbWV0aGluZw0K
YSBiaXQgZGlmZmVyZW50Lg0KDQpXaGVuIHdlIGhhdmUgYSBub3RpZmljYXRpb24gZ2V0LCB3ZSBj
YW4gb25seSBjbGVhciBzZWN1cmVfcGVuZGluZw0KaWYgRkZBX05PVElGX0ZMQUdfQklUTUFQX1NQ
KE0pIGFyZSBwYXNzZWQuDQoNClNvIGkgdGhpbmsgaSBoYXZlIHRvIGRvIHRoZSBmb2xsb3dpbmc6
DQotIHNlY3VyZV9wZW5kaW5nOiBzZXQgYW5kIGNsZWFuIGFzIHRoZXkgYXJlIG5vdw0KLSB2bV9w
ZW5kaW5nOiBzZXQgd2hlbiByYWlzaW5nIGJ1ZiBmdWxsIGFuZCBjbGVhbiBpbiBpbmZvX2dldCBv
ciBnZXQNCiAgd2l0aCBGRkFfTk9USUZfRkxBR19CSVRNQVBfSFlQIHNldA0KLSBidWZmX2Z1bGxf
cGVuZGluZyBvbmx5IGNsZWFuZWQgaW4gZ2V0IHdpdGggDQogIEZGQV9OT1RJRl9GTEFHX0JJVE1B
UF9IWVAgc2V0DQoNClRoaXMgd2F5IGluZm9fZ2V0IHdvdWxkIHN0aWxsIHJldHVybiBzb21ldGhp
bmcgaWYgYSBnZXQgaXMgZG9uZSBidXQgd2l0aA0Kb25seSBmbGFncyB0byByZXRyaWV2ZSBzZWN1
cmUgYW5kIHRoZXJlIGlzIGEgYnVmZiBmdWxsIG5vdGlmIHBlbmRpbmcgb3Igd2l0aA0Kb25seSBI
WVAgYW5kIHNlY3VyZSBvbmVzIHBlbmRpbmcuDQoNCkdpdmluZyBzb21ldGhpbmcgbGlrZSB0aGF0
Og0KDQotLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQorKysgYi94ZW4vYXJjaC9h
cm0vdGVlL2ZmYV9ub3RpZi5jDQpAQCAtNjksNiArNjksNyBAQCB2b2lkIGZmYV9oYW5kbGVfbm90
aWZpY2F0aW9uX2luZm9fZ2V0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KIHsNCiAgICAg
c3RydWN0IGRvbWFpbiAqZCA9IGN1cnJlbnQtPmRvbWFpbjsNCiAgICAgc3RydWN0IGZmYV9jdHgg
KmN0eCA9IGQtPmFyY2gudGVlOw0KKyAgICBib29sIG5vdGlmX3BlbmRpbmc7DQoNCiAgICAgaWYg
KCAhbm90aWZfZW5hYmxlZCApDQogICAgIHsNCkBAIC03Niw3ICs3NywxMSBAQCB2b2lkIGZmYV9o
YW5kbGVfbm90aWZpY2F0aW9uX2luZm9fZ2V0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0K
ICAgICAgICAgcmV0dXJuOw0KICAgICB9DQoNCi0gICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9ib29s
KGN0eC0+bm90aWYuc2VjdXJlX3BlbmRpbmcpICkNCisgICAgbm90aWZfcGVuZGluZyA9IHRlc3Rf
YW5kX2NsZWFyX2Jvb2woY3R4LT5ub3RpZi5zZWN1cmVfcGVuZGluZyk7DQorICAgIGlmICggSVNf
RU5BQkxFRChDT05GSUdfRkZBX1ZNX1RPX1ZNKSApDQorICAgICAgICBub3RpZl9wZW5kaW5nIHw9
IHRlc3RfYW5kX2NsZWFyX2Jvb2woY3R4LT5ub3RpZi52bV9wZW5kaW5nKQ0KKw0KKyAgICBpZiAo
IG5vdGlmX3BlbmRpbmcgKQ0KICAgICB7DQogICAgICAgICAvKiBBIHBlbmRpbmcgZ2xvYmFsIG5v
dGlmaWNhdGlvbiBmb3IgdGhlIGd1ZXN0ICovDQogICAgICAgICBmZmFfc2V0X3JlZ3MocmVncywg
RkZBX1NVQ0NFU1NfNjQsIDAsDQpAQCAtMTUzLDExICsxNTgsMTMgQEAgdm9pZCBmZmFfaGFuZGxl
X25vdGlmaWNhdGlvbl9nZXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQogICAgICAgICAg
ICAgdzYgPSByZXNwLmE2Ow0KICAgICB9DQoNCi0jaWZkZWYgQ09ORklHX0ZGQV9WTV9UT19WTQ0K
LSAgICBpZiAoIGZsYWdzICYgRkZBX05PVElGX0ZMQUdfQklUTUFQX0hZUCAmJg0KKyAgICBpZiAo
IElTX0VOQUJMRUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgJiYNCisgICAgICAgICAgZmxhZ3MgJiBG
RkFfTk9USUZfRkxBR19CSVRNQVBfSFlQICYmDQogICAgICAgICAgIHRlc3RfYW5kX2NsZWFyX2Jv
b2woY3R4LT5ub3RpZi5idWZmX2Z1bGxfcGVuZGluZykgKQ0KKyAgICB7DQorICAgICAgICBBQ0NF
U1NfT05DRShjdHgtPm5vdGlmLnZtX3BlbmRpbmcpID0gZmFsc2U7DQogICAgICAgICB3NyA9IEZG
QV9OT1RJRl9SWF9CVUZGRVJfRlVMTDsNCi0jZW5kaWYNCisgICAgfQ0KDQogICAgIGZmYV9zZXRf
cmVncyhyZWdzLCBGRkFfU1VDQ0VTU18zMiwgMCwgdzIsIHczLCB3NCwgdzUsIHc2LCB3Nyk7DQog
fQ0KQEAgLTE4OSw3ICsxOTYsOCBAQCB2b2lkIGZmYV9yYWlzZV9yeF9idWZmZXJfZnVsbChzdHJ1
Y3QgZG9tYWluICpkKQ0KICAgICBpZiAoICFjdHggKQ0KICAgICAgICAgcmV0dXJuOw0KDQotICAg
IGlmICggIXRlc3RfYW5kX3NldF9ib29sKGN0eC0+bm90aWYuYnVmZl9mdWxsX3BlbmRpbmcpICkN
CisgICAgQUNDRVNTX09OQ0UoY3R4LT5ub3RpZi5idWZmX2Z1bGxfcGVuZGluZykgPSB0cnVlDQor
ICAgIGlmICggIXRlc3RfYW5kX3NldF9ib29sKGN0eC0+bm90aWYudm1fcGVuZGluZykgKQ0KICAg
ICAgICAgdmdpY19pbmplY3RfaXJxKGQsIGQtPnZjcHVbMF0sIG5vdGlmX3NyaV9pcnEsIHRydWUp
Ow0KIH0NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo=

