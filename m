Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C63A5EFFA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:54:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911775.1318177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfGP-0002hI-Jt; Thu, 13 Mar 2025 09:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911775.1318177; Thu, 13 Mar 2025 09:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfGP-0002fE-Fz; Thu, 13 Mar 2025 09:54:05 +0000
Received: by outflank-mailman (input) for mailman id 911775;
 Thu, 13 Mar 2025 09:54:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CkET=WA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tsfGN-0000UE-AU
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:54:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f403:2613::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 174e5e02-fff1-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 10:54:01 +0100 (CET)
Received: from DUZP191CA0038.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::22)
 by PR3PR08MB5833.eurprd08.prod.outlook.com (2603:10a6:102:81::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 09:53:57 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::f6) by DUZP191CA0038.outlook.office365.com
 (2603:10a6:10:4f8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Thu,
 13 Mar 2025 09:53:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 13 Mar 2025 09:53:57 +0000
Received: ("Tessian outbound 0ad77f8d5963:v585");
 Thu, 13 Mar 2025 09:53:56 +0000
Received: from L6d557f2ad4df.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6FD9091B-5680-46D1-B7EB-AE13223F22B1.1; 
 Thu, 13 Mar 2025 09:53:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L6d557f2ad4df.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Mar 2025 09:53:50 +0000
Received: from VI1PR08MB2989.eurprd08.prod.outlook.com (2603:10a6:803:4d::31)
 by PAVPR08MB9185.eurprd08.prod.outlook.com (2603:10a6:102:30d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 09:53:48 +0000
Received: from VI1PR08MB2989.eurprd08.prod.outlook.com
 ([fe80::a004:515d:5b93:9ec8]) by VI1PR08MB2989.eurprd08.prod.outlook.com
 ([fe80::a004:515d:5b93:9ec8%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 09:53:47 +0000
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
X-Inumbo-ID: 174e5e02-fff1-11ef-9ab9-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VZj2U0FpX5J8uVn1/CHlWdBSRkogwQeZ4x+Ma6JUaijaG+brjqCAlrr0qDjx/spOmZ5wriiLuVXbXsQ23QHPqFHtZLc4Wu9x59MyM9CxaQhL1dEkOIQDwztx7vUUPZUCEub+MOx/Std4jODg+B3mJFX/Raq0X2BE5XDvBk8lhiZmjsr+RRREehS9DdHmloD9152Zr75ZenRxdSsHX6zLqYnc+s0A/ZGGgWvXhtJ+nH5YYiw3cVdCkj6mKtarproR3HFIiHN7g77baGBDF259p8Q28ag5Zg8gVLtVWDScrcT1qw9Poh5hscBdW8eLtKtXrD3zAENpDEjcEFi1mYD7dw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxLausDs7ZcjasEclgiy+zHHIoM3VsJew3Nx/A3Ux4Q=;
 b=PVEbH+qHhiqUPVGlsAk1mfMg9IRvYkGa54/O7CaZogbJe0R1H3XKGAJPEp4/WKcl8uu91u4uu+4on8QykT/u+NQg0XS6Qf4C5bQgIZ16LdFfNJxGkckIMYwzxoQQ8PQmd7Esng+yl/tWJAMpwI25R8mHijQzVunB4pyY0oz5IQ+GoLz7vgVmY+wU0hHLbfP0Bu+tygWHCRL37am0qYGer9iMwrqcvDnPc1Y55u/D70D7W4zvaWU5P+IgV6kN6o1DJujSRdv2BTgLiPZdKxAo3womzdI6bNpngGbsrbYPpkq6A1jZ166krvJgKsIl03cERT0CBWtCAiNvyif1fPFAKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxLausDs7ZcjasEclgiy+zHHIoM3VsJew3Nx/A3Ux4Q=;
 b=ATDTc0QQ48jJXNprpH/0+LjWtgAj5oKNFJTVrvQOyIrKD4W2JBP0qibQmZJbyYEg3o3r6zBPzEz22pG2Dxp9Yh8st0McoAwl/M7vMmDyeqIshqURlzn8jwxWEJ3VcaU0x7RnAla4J0xahHSaCJgMbofYloUkvg79KebV2mrGleQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5e942737e7da1d4
X-TessianGatewayMetadata: ZK5kGOnJ+I4jkqbNPM97GWkUzKflYA4ppATyATT1Z272zb2CA33QWSdYq92xEsZSiA2+ZES+Oka+hcMgEBGkNFLPZ9llkseGxyp5aDMonAqYOjuF0q2gmUfKer2C7MzpZM5mMzLi3p2z0yYioKFYIBAtK8k5TqYZ8+jVZXqqVMs=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i09k1DWbeXa93cdwldK5N2zzAICRaK5nT3jBufrGVu1yh4GGzBJk7R/33vKIXJUWU3GLmrS7QxboVr+zhyzXcFaP2rVInTMn0rmIXBWOUWFYsXbHySG61mUF+bt3V9Izpw6TzyUfbw0oSO5NkAJfDL8kEGyZaa62I0N+NTUqumE7vQ/H3xlkBckbZaq5iM+5uP4+6eGruMK2kx+fS5OLg52hMKvirQIzA2lQLK/SNNXI/hLzd7LPbMgL59mo3l/kDS4dzZ68r1pnHorxSpzu7zWgPtNNrOjzb+OFBkRVKlcN2CA9Sd+WbU2vV52bhcahA5tPDUOrYzAZG9YLjVqc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxLausDs7ZcjasEclgiy+zHHIoM3VsJew3Nx/A3Ux4Q=;
 b=CPLIv4uJkyEil/WrRpqWNycjGKpJAZBAK0HlrppDyAsMgbx2qaJtYkm10Mpz6OyIYF9lB2TezMB30BGmkn3z+mZap2TXtBf5smiXJ5skjCInK5/7YPw1BpqjReJ78LGkw6ZejdLcpMROqACeMdf4NIf/ku7Ugf6iGubtq9lG3/Ts/XE9cAPCeDtH6dItSpbgWu+WpPqNOMowERrXlEugua81ZdRybOXisnz15rl/i61HVXE/vcMj/bPdyWFv3ZpY+KKFoaAcN99oyqbrpWR1b0Xp+vxOW0843nJQjBnkY3UsOp91yReGDFc/LFTIH9oEao2n5yqFDK0OhtURbBRRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxLausDs7ZcjasEclgiy+zHHIoM3VsJew3Nx/A3Ux4Q=;
 b=ATDTc0QQ48jJXNprpH/0+LjWtgAj5oKNFJTVrvQOyIrKD4W2JBP0qibQmZJbyYEg3o3r6zBPzEz22pG2Dxp9Yh8st0McoAwl/M7vMmDyeqIshqURlzn8jwxWEJ3VcaU0x7RnAla4J0xahHSaCJgMbofYloUkvg79KebV2mrGleQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 06/10] arm/mpu: Kconfig symbols for MPU build
Thread-Topic: [PATCH 06/10] arm/mpu: Kconfig symbols for MPU build
Thread-Index: AQHbk1YkvHjPlmI7NkCFYPV0IELI1rNw0hAAgAACwIA=
Date: Thu, 13 Mar 2025 09:53:47 +0000
Message-ID: <73E6A3C6-E9B2-43BD-9F8B-6FC6F260FCE9@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-7-luca.fancellu@arm.com>
 <6a372989-e51c-4165-8f03-41da8e3a9bdd@amd.com>
In-Reply-To: <6a372989-e51c-4165-8f03-41da8e3a9bdd@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	VI1PR08MB2989:EE_|PAVPR08MB9185:EE_|DU2PEPF00028D01:EE_|PR3PR08MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ed922b-9977-4345-24d4-08dd6214f918
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TDduUUl2ZWZOU0Zpc3FpMncxem91bm5GMHBHQWNxZlBmaW9UdzRIOG5ZTXJh?=
 =?utf-8?B?R1I3bDFVc2pjZmRoT1V2NGtqSHk5WUIrYUJERkxENTh3TTRpRDNlR28xOHBj?=
 =?utf-8?B?UGJlS2ZUdFF4TXR4allZaHlwWGM5MFZyN3pzL2tyZW1CYndJYUNaUVBzZVI0?=
 =?utf-8?B?UGd4OXR5YnRVMTFhSEVLSEdodWhTNkYxZjVBQ2V3eVdMVjd3TTlBQ1hqZldT?=
 =?utf-8?B?WmNOT2E0VUVXK0ZyWmZKTnk1Z0ZNM29hbE1kZ2VZdEpEVkhBdGpTOHIyeU4z?=
 =?utf-8?B?NFVJMXpNRjI1UTlhNWxQMDZXeXVIR3B1MDR6UjMvRkRMUHM2OEtnbVpZV0RL?=
 =?utf-8?B?Z0FQMStnRWZLb3pLKzA3Q0VtVnNuNC9qZWVwT3RZeEVuWksrZ2FLUlEvaDNr?=
 =?utf-8?B?NDd4U3FYbEdzNVhWdjlCQ0tYNWovWk12dkw4Nk12NzNOUmpYV0ZpZ3VNMDh0?=
 =?utf-8?B?Vk5IMy8vTW1GaG82SFM3UVcyRHNnN0l5NkwzR3hOQTZiWjYwYWJKYnZ3NlVV?=
 =?utf-8?B?bjMwYzZScTM5b2doMHRJbHRIak50MjFyUit5ekxhNGVkZlprUWhLMGgybTNa?=
 =?utf-8?B?cklIeHJBekEzRDd1Z00ySTlSR3NPZVpuTmozUllwUVdRRDZXOS9zZ2Z2elJZ?=
 =?utf-8?B?Rlhlb2RpQUVXbk42WGJVakNtLzlWeG1sMVpOYTNaZ1BrdlcxQlExMFVpRmhO?=
 =?utf-8?B?S3JaZk5LK3lHQ2tOUW5RelR5TkI4R2R2RXRRV1JQSXpHdFpPeExSeExCenJw?=
 =?utf-8?B?QjVkZDUycm1XUXB6QmJPbW5qenNOM1FQQWFUdGpRTFkzM3YzQXRkdUNISjdv?=
 =?utf-8?B?NnlrM2NTZllpa1laMk1DbUdUK3pldUMvaUE1a0FZUlFBT0ZjQXE2OVV2RlJY?=
 =?utf-8?B?dWQyRG0vT1diUTBYalJZNUpseTlReGU2SDRNZ2ZWN0h5YzRpejNDeDZtS0Z2?=
 =?utf-8?B?bndhSlJLZ1FJc1JsZGVWbFVaRm93Sm9wbTF2dUdOQXBmc2hTaGtmWjNrcE1t?=
 =?utf-8?B?anZtRnJRTFZyclAwVlh5aTM5SkNodTcvaXV6Q211dW1raDE0UUlKSE5OclJo?=
 =?utf-8?B?S1hVWHZ3NUhtdThOdnVxeVpNc3hPS1N3QUZFRllMVTdHMW5keHJvMmZ3Zzk5?=
 =?utf-8?B?RlEwbnZkNEp3eDlmeGloek9pQVRPbnlpMXlidU8yUTU5bE0vVEFWM0k1NFZx?=
 =?utf-8?B?bkdzdFRReFFzVTRNeVlrM3UzMlpWWEtVWkc2aDEzMWNkUzNIMHV3c21qSDQw?=
 =?utf-8?B?WHQ4MEgzTzNPUXI4Q2xuZkx0UHJCVnRuUDBJeU14S2JjdUs0K0w5R3lNdGtS?=
 =?utf-8?B?WkZ4ay9WYXpoQkpacDA5N1pjczVFWUt2aUtyQjlZVEZOa1NhbkZ0cHREcE0v?=
 =?utf-8?B?T0laSWx2UXgzS1lHeEdkMjVwSlJCMnNhcnlVNm1wRnMyWnZabkszRHMxV0s5?=
 =?utf-8?B?cHhqajZadDNvYkpDRzF4MlFjMjRjZVpzaWJmNVJUdEprdjNHQ2RCdlpXYm1S?=
 =?utf-8?B?cmV0VUsyZzgvdzdBckRZaW9BWGFzMkhtc3RHVnVTNkxOcXlNbDRjLy9rUlQz?=
 =?utf-8?B?WTRoanVINUw2TzBPcG5tU3hLUldSOTJ6UXJBZTFHeExlTTRiRUg5bUxmTzNk?=
 =?utf-8?B?K0NiR2tJY1RGaXpnK0NFS1I2eWhlRU9pTW5jSnNCbUkrREVnTms0Z24va285?=
 =?utf-8?B?LzBORU9UYnFWbzZxMXgrZmZCUXVFSEMrWTZURnlGRnNrUEcrK0IySXgxVG1x?=
 =?utf-8?B?R2RkdS9SUW9Fc1FmZkRZREZrTHlsbzYxdDhMYUk1cFdSY1NKVUV4WHczVitN?=
 =?utf-8?B?ZHhpWGxjcWgrOTE1WS9hempWdWoxWDFkVGZWaWZSeENUTXhodXRTME04QkZr?=
 =?utf-8?B?RDl4ckh0bHE4ZVhLS2twMnoxalY1VTFibGNQUHkydTh4TmQ3cy9DN29rUnp6?=
 =?utf-8?Q?WqtHIdyZZeQHVmTYC9iVvbMD+AWgU1ts?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB2989.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CD428BC3353EE4F86DF1675A1E5CA60@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9185
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:803:4d::31];domain=VI1PR08MB2989.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e0895f35-221c-417b-5f71-08dd6214f359
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|376014|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmtrekVFOVM1d1EwZSt6a25FRE5MNlU0TWpkdUU2RlRFd210UW1iR3BRdUtt?=
 =?utf-8?B?bXdBVzBXRTJPdXl4OFJ4TUNvWkRjOExxdEJET2lmVXNwTVVDMmE3VzFXdHkr?=
 =?utf-8?B?OWdxZGh6MjBIbEZ6WUlSRTJzSTFpQkc0WThvd2E4d2dRazdiRlBZejFFSkpm?=
 =?utf-8?B?YWNqVzlmaFlxYkI4c2NPN044b2xsQjV5S1huUUwrelAvWUlzdmhEL2tVUkVi?=
 =?utf-8?B?allVbjdiYlBIRDRucXpNb0dYTFpDb1pXZU9EWWRnTUUvK3lzWkJRbi9hNzZX?=
 =?utf-8?B?a3JVZzg3TkJqbDZ2QURNcGY2elFjVDJQeDAzRnUxa3NaVWkxdkl2eTRDWnlk?=
 =?utf-8?B?RVpIVVh5b21MRlREWGFVQitKWVJCWHZ1VlFyeXNzdDZBbHlzMDhQMVprNjFV?=
 =?utf-8?B?bU9PWExaMWFacGJxWVZ4NXVUVy82dVVtUzA4WTZQdGc3MXNKbW1ReHFWTXVO?=
 =?utf-8?B?eDNsZkVIS2JTQWJqY0lrVmVGSXpNckJNbFdIWXRqdCtSV1VQQTl4OGpDdzcw?=
 =?utf-8?B?bHU4TWhsMXFOYVBBY215NzdJTVdVUWU3Tnk1YzFkZGVtaDcxd2dHNS8wL3Zk?=
 =?utf-8?B?WDFrd3BNejZkVGpsclFLbHdXcXJTZnlhUjVtTDRKbVc2TUZkQjlKNWFQdTlP?=
 =?utf-8?B?N2VxV0ExQWhGNVhmSGc2SmMvYTFTcHBPQmJnUFo0bmdrL2VjeExYQkwycXlV?=
 =?utf-8?B?OTVhWmxja1V6alpUZ2lRWXVwenM4aWQ2N3lURysxYjg4b2EzWEZRNmxiblQ2?=
 =?utf-8?B?YWdOUGlnYThudTdvbVNBZkdJQXd3bWhOZjFVRGFHRDJIa1V1ank5V0FTWFJF?=
 =?utf-8?B?R2R1TDlNSk1nVXRTMk41ZC95UWd1OCtwUTMrcWJHQUJSQnAvZzFqL1JTSUZz?=
 =?utf-8?B?L0xTVmI1bEwzSm9KbXNaeWFBMnhoUkhRTEZUblQ5WlA1MFNLMzA0ZVl1bHdO?=
 =?utf-8?B?MU5IaEVNRitwZGpMRWNyNnd3dkNaL3JDLzJjVS9DUWJ6T2E1MXdyYTUrTTZa?=
 =?utf-8?B?QTJJbTRCVzl3ZHV0UWliUmNTU3VPTnZkazArVnFjV3g4eVc2MlF4bU9CdDdY?=
 =?utf-8?B?QTIvOTVjMWE0dnNpa2xINXdaTU8zMTRhdldRQ0dpWTh4cDRQdWdQWDcrWmpK?=
 =?utf-8?B?T3ZMRlF5aTVsNkFjcm4zQmJKVE41aVFQLzRiQXFiNU50bDNrNjR2WmdWRDRr?=
 =?utf-8?B?bURYK2ovdVRDYVdwdi91d0cvZ2pQaDQwNGx4K29qREJDTGMxZGdNNEgxakpq?=
 =?utf-8?B?YXk5SDJFQ3VDeDJsYXhrWm9vbDc4dHFuVzk0UWp4UzBtK1JTbm4xSzI4ejVD?=
 =?utf-8?B?TGIyTVhSWWNLNHRLVzFNSXhiaWk1Q3c1UGthTjVtQnhlR0luanNDRnBlbmxT?=
 =?utf-8?B?cmV4Y1gwcFhPMXg3V09RbEtjUTEzNXZYdjNKWEgwYVErZ0l1dVN1Q2RRdFhH?=
 =?utf-8?B?blBpOFlUQ1ZYNnNTVmlxbk40RTdwRU1OL2UzYjVubGUwdXE4WVp4RElFOERI?=
 =?utf-8?B?NVgyRnhLdmltU0NvUFM0eCtJK3UvV0tvU3JjbWNEOG5mdEF5ZDJJNGVDd3l1?=
 =?utf-8?B?NUcwcm1xTSswOFB2K2FmOSs0R1gvUFVkWmZnYWkyZXZ2T3B0eGEraTFCQUJ0?=
 =?utf-8?B?c24xd1BBTTI1ZUxhLzNrZ0xMVHY4N0NxNjdhTytnTzlkMDFZQmlKZjVVWGU3?=
 =?utf-8?B?WjVUa1ZDWUI0WDRwbW9HeXJCNzhRem5DaThTNXN5TElQYURxOGpWeXQyUEw1?=
 =?utf-8?B?SGZBSnpMWkFkOGJ6bWRYWVRDbTh3UWJPZmVFNjRrRVdJbStHcHNzeksyREVQ?=
 =?utf-8?B?Z0drNXJjWkVpUFhEYUlmMHF6ckpTcmVQM0NwYm9aUStpWGE2cWVFTkcwM1VL?=
 =?utf-8?B?bnN2b1RiR1FEZzViS3F2anFIOFN3R1lwOFVkUHJxaWNvb3c5R201dmY3TGls?=
 =?utf-8?B?Z254cDBUaGdlZkxxQTZ5U0tpd2Q5bC9GQU14KzZCOHpWd0VEQTJTNG96ejdV?=
 =?utf-8?B?cUdhQSs4RnB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(376014)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 09:53:57.2580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ed922b-9977-4345-24d4-08dd6214f918
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5833

SGkgTUljaGFsLA0KDQo+IE9uIDEzIE1hciAyMDI1LCBhdCAwOTo0MywgT3J6ZWwsIE1pY2hhbCA8
bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxMi8wMy8yMDI1
IDE0OjUyLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+IEN1cnJlbnRseSB0aGUg
TVBVIHN5c3RlbSByZXF1aXJlcyBzdGF0aWMgbWVtb3J5IHRvIHdvcmssDQo+IEN1cnJlbnRseSwg
bWVhbmluZyBpbiB0aGUgZnV0dXJlIGl0IG1pZ2h0IG5vdCBiZSBuZWVkZWQ/DQoNCk5vLCBtYXli
ZSBJ4oCZbSBub3QgY2xlYXIsIG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBzdGF0aWMgbWVtb3J5
IGlzIGFsd2F5cyByZXF1aXJlZCBmb3IgTVBVLg0KDQpEbyB5b3Ugd2FudCBtZSB0byBjaGFuZ2Ug
dGhpcyBvbmU/DQoNCj4gQWxzbywgSSBkb24ndCBzZWUgaG93IGlzIHRoaXMgY2hhbmdlIHJlcXVp
cmVkIHRvIGVuYWJsZSBjb21waWxhdGlvbiAodGhlIG1haW4NCj4gZ29hbCBvZiB0aGlzIHNlcmll
cykgZm9yIE1QVSBidXQgYmVjYXVzZSB3ZSB3aWxsIGhhdmUgdG8gZW5hYmxlIGl0IGFueXdheS4u
Lg0KDQp5ZXMgSSB0aG91Z2h0IHRoZSBzYW1lDQoNCj4gDQo+PiBzZWxlY3QgdGhhdCB3aGVuIGJ1
aWxkaW5nIHRoaXMgbWVtb3J5IG1hbmFnZW1lbnQgc3Vic3lzdGVtLg0KPj4gDQo+PiBXaGlsZSB0
aGVyZSwgcHJvdmlkZSBhIHJlc3RyaWN0aW9uIGZvciB0aGUgQVJNX0VGSSBLY29uZmlnDQo+PiBw
YXJhbWV0ZXIgdG8gYmUgYnVpbHQgb25seSB3aGVuICFNUFUsIHRoZSBFRkkgc3R1YiBpcyBub3QN
Cj4+IHVzZWQgYXMgdGhlcmUgYXJlIG5vIGltcGxlbWVudGF0aW9uIG9mIFVFRkkgc2VydmljZXMg
Zm9yDQo+PiBhcm12OC1yLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxs
dWNhLmZhbmNlbGx1QGFybS5jb20+DQo+IFJldmlld2VkLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hh
bC5vcnplbEBhbWQuY29tPg0KPiANCj4gfk1pY2hhbA0KPiANCg0K

