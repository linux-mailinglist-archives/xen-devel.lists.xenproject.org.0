Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2969B45C5
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 10:32:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827154.1241672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5iZc-0002jT-Ap; Tue, 29 Oct 2024 09:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827154.1241672; Tue, 29 Oct 2024 09:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5iZc-0002gp-7z; Tue, 29 Oct 2024 09:31:36 +0000
Received: by outflank-mailman (input) for mailman id 827154;
 Tue, 29 Oct 2024 09:31:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A7Nu=RZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t5iZa-0002gj-42
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 09:31:34 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20631.outbound.protection.outlook.com
 [2a01:111:f403:2606::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 946270ec-95d8-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 10:31:31 +0100 (CET)
Received: from AS9PR06CA0494.eurprd06.prod.outlook.com (2603:10a6:20b:49b::18)
 by PAWPR08MB9542.eurprd08.prod.outlook.com (2603:10a6:102:2ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 09:31:22 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:49b:cafe::43) by AS9PR06CA0494.outlook.office365.com
 (2603:10a6:20b:49b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Tue, 29 Oct 2024 09:31:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Tue, 29 Oct 2024 09:31:17 +0000
Received: ("Tessian outbound 0fe1877cedb7:v490");
 Tue, 29 Oct 2024 09:31:16 +0000
Received: from Ldc8a7a416408.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DDF50CEA-604D-4C31-A608-198096DD01F3.1; 
 Tue, 29 Oct 2024 09:31:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ldc8a7a416408.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 29 Oct 2024 09:31:04 +0000
Received: from VE1PR08MB5807.eurprd08.prod.outlook.com (2603:10a6:800:1b2::22)
 by GVXPR08MB11183.eurprd08.prod.outlook.com (2603:10a6:150:1fc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 09:31:00 +0000
Received: from VE1PR08MB5807.eurprd08.prod.outlook.com
 ([fe80::ee39:f31e:3c63:985a]) by VE1PR08MB5807.eurprd08.prod.outlook.com
 ([fe80::ee39:f31e:3c63:985a%4]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 09:30:59 +0000
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
X-Inumbo-ID: 946270ec-95d8-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=x1s2aI13hobkeU7LI4cAxNAwhAakGyoZzuM/C29SQ8LBp7YNlTIZuo5gg9f+Ma4Cp1G3bTX5dW9ALZonZoJND4YkMt9dIlFdUGGjPsGCvo2OVfo13G0zvO9cxd3NplwrN/8JVS3ooJYyzAbKW6AszfBdnN6Uzz7EZDfA48DxnnP1u3qP+GXsnpKLGRqdLa4xxKxsT3NbkwZDA6Pr65yvKiGsnyPUnQew1q3/37u8RACPh40nl6kGu937h+4C0SKBasEqQ4l2uvE4hwEBvuPjKJeadKXQucHGQu99qRmPkD7FHfih8CndL+2+VcZ22qjjNyhiXT0Utp0jIv6UC/exqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqJli08Blf/04WFbTsfLOB/UUpH495rAO6O7iSuza8c=;
 b=cdm957ITMLgXgTVbnA1I/hm62R/ipfoxzxzH3Ait3tdtIXg81iZv1yfEfxRpNaRqT/1LuDPbPBoDW4342vDiB2I5wWQmU+3rFfzHH/rDMjZF+4HkCbzca2DHxDAOtJqdXi6G5s8nG1gPzxRxCMYpofd50WsW7NxConvDCKbhxQb9oVfo073jkZL/pv9Y19DXPTE5F+doXVXsCt1ZiD8lSDKTN3MOMH2V2Iay6d3jR0itM8jFRyr5H1TBB0e8djHz7iyhrchcnEd08INHrJ7ca0XWir/77l7M/4D2q9cTeic3Dt/mZPTCMALG71Da8wy1uaN/ac3AdKK43nfFw4xOQw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqJli08Blf/04WFbTsfLOB/UUpH495rAO6O7iSuza8c=;
 b=GIRgKTiCtIi4v/kIupU66PzY1XZMNtmEwaOrCafA/h+ANc/uFhhhQV8tR/lw/7epmzC2kjk5aaPHxtaUKyBI7inv31k6HJyLY3s4BoNspLyjBAGNHLS6i7RucaoX0pSv/K0RzoUSDDrORlz8+umOuv7pqW+23zT3m8mKLY8I8ls=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a4cc9fe222e1910c
X-TessianGatewayMetadata: zys75WxDMsUi90n/fIJBHCwj8Yyh6of3/CjrSx/Fc6KfSLoNPX49kYpj+gBzstqvCcpk8Y2F93GSV7KizH9ut28q62zeiUcs2nhFVsbGSH+cJTJfPCbiK9AyHp6kZTI8GVqozB/20D1R0Ox9cOqrJX5fMbvGWGmJdUb5RysqElg=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlgtIspLqFdFSXaPTBy30i8a61NDBL/bwhfyCkcFPNTFvS5c+UKpBenEWKqACqm4ClYAAzTc6x7MRmkmlCl+o+wpO/G/OIAKcnGMXe5dhJ+Dj9071JypNzjr3EMazPYjipolTH7yeslclvoOF44gAZB1g+NbH6vw4K8rDSJsxxRMFaW8gp/bJlA7TXhupXBiTijXXISa9QSuhg2BtP4ftiailyJvaZm0D76SMLU2RBb9xRs+caKdkfoKCXGMUhdkj4aa0u8PdFcUx/yo6xPrTq/0YLqpVdaC1yTQaMz3E7I1Z7sj+EJJ5iVoVEaXWJrBmYf8knb0Vx8q+68UFYH66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqJli08Blf/04WFbTsfLOB/UUpH495rAO6O7iSuza8c=;
 b=QZnDRn3NIJjKn8zd3wa5H/h5WdHMetUxMPQrrqWm8vNerytigh68q/sF+QRbT4X4sVgstlsKsVTOWCWO7T46+2QZoEhSzSWSSpHuAIVLc2tmi8vmCFaqe5tfarbKmz4TdzhACKb5bOohU+fkCJki5+Z0a7I58SBt+p5EUYH27yYDiJE25KPiSJCiDH6EBwmnTKKKo4EopgM7scgnyROvEAboL0VxMl7R5g/ZbL15bOkeYcVZO5KtrU1c0SOsdirPcHREI4ekk2iKeuYJKTYMNX1zAXcgMozVfs5V1OC1G5YV00LQZqmgNl8HJuU16By1OU93o+eZPcCroD8aP2vt6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqJli08Blf/04WFbTsfLOB/UUpH495rAO6O7iSuza8c=;
 b=GIRgKTiCtIi4v/kIupU66PzY1XZMNtmEwaOrCafA/h+ANc/uFhhhQV8tR/lw/7epmzC2kjk5aaPHxtaUKyBI7inv31k6HJyLY3s4BoNspLyjBAGNHLS6i7RucaoX0pSv/K0RzoUSDDrORlz8+umOuv7pqW+23zT3m8mKLY8I8ls=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ayan Kumar Halder <ayankuma@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
Thread-Topic: [PATCH v4 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
Thread-Index: AQHbKUc0cm81q6gzakCso/Bn+PcPfLKcQegAgAAr8wCAAPMaAIAAFveA
Date: Tue, 29 Oct 2024 09:30:59 +0000
Message-ID: <FF40F41F-D5E1-4EEB-865C-6E447D1CA043@arm.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-7-ayan.kumar.halder@amd.com>
 <27be8d00-8260-460e-948d-81418b93662a@suse.com>
 <8fa530cb-4d70-4300-8d4e-1e7208f7c045@amd.com>
 <55728fdc-6247-4810-8696-a999713f4a7c@suse.com>
 <3231cc7b-4c2e-4939-a623-a7b9960d1641@amd.com>
 <5fb1ac28-395c-4065-8a70-4bac809c7f50@suse.com>
In-Reply-To: <5fb1ac28-395c-4065-8a70-4bac809c7f50@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3818.100.11.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	VE1PR08MB5807:EE_|GVXPR08MB11183:EE_|AMS0EPF0000019F:EE_|PAWPR08MB9542:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2cae54-c2db-49d5-d74f-08dcf7fc70a3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZlZHNzJBYVFTcCs2WnF4VTgrNStwSzByNWUzM1A4d3d4OU43dmt6R3BRU0pP?=
 =?utf-8?B?cHp3NGdGdkpHMUUvVEhZazVUMjVxMEc5c0p5TFo1cFpQaUQ2c3dtRmoxelB2?=
 =?utf-8?B?OUxkejJJWmxYVjhkQXVnQk83MEpEb0tUZEN6b3NDUW0wdXkzUkZNRHB2a1pY?=
 =?utf-8?B?ODgvYnJYc3hRWFRJbVM0YU9BSDR3NjllWEhtWURjcFBCSUE0MmhJbTNzK1c2?=
 =?utf-8?B?TEk3ZDJYYlV4aXFrYXhydzgvNVJpN3h1VUdSbTBsZm9wZWMxcFk4RGh0R2o2?=
 =?utf-8?B?R1hXMFo4d0VHT0FqcVA0b0JzYWVLNDJkd3R5L0YvbEFyazdtanZIbmFVVmtm?=
 =?utf-8?B?dlBzQjVrandvZ3lxMXBFUWN1d1dlK1prWFB6M2Zza21GY1FGRmdVcnRmZitl?=
 =?utf-8?B?L29RS0l1Wkk4MUtjRnNRK08vNWl0c3AzTVc1VG5aei8xdHZxWUZFbEc5cWor?=
 =?utf-8?B?MytuZkd1eWlkRXJkY0VTb1I3STFzWHd0RzB6aHB3RkRpeEdQU2srbURJUlIx?=
 =?utf-8?B?M0FPL1AzYTFROUlZSjZkNHptUGtFVm9yaERKSDR5cTNCdGw3VUp3T0QwWFQz?=
 =?utf-8?B?azdwc2NiYVdnTUZld2Q0OU1hRmhudXVRWkRqTUs1bHNCcXV4aDJmelRBazZn?=
 =?utf-8?B?bzZXaHUyZXpoRzJxVitJcDM0RUwrbmdodU9aa2NMWndPM2srREszd0pmdXZ2?=
 =?utf-8?B?Zk8vQmoxTmRhUTZzMDB1eFZVQWt1bW5wUUhHRUJFNzhpeXRuNXRhUlRuNjI1?=
 =?utf-8?B?MGw0Q3BldUFrZTZDYldpbzhnK28zUDg2cmdBWk9QMkwvUk0veHdORUQ5cExO?=
 =?utf-8?B?UjBRQ3ErZ045T0ZNd2U3ZXlwSkFwK2FvQzUyWFRpanJVMmNRczRTaGVMZDhi?=
 =?utf-8?B?enRPNk40M3l1VXFoN2JNcng2QmxZT0JXTXRJYTdwaVZsMzBBR0ZoMi8rUi8v?=
 =?utf-8?B?TzFNbUdEbUxseGhUdStZWWZONmpXdHN1VjZhNFBxT2FUaFJuKzRVK2kwdXQy?=
 =?utf-8?B?T0FZeUo3UEVCS1lzMk43RFA4NWdabUl1MGVFL1pPTENJTkdoTU9KcTJrbjV1?=
 =?utf-8?B?R0tWMDRGZitFWFlGWkthbmJGaGhCV2lwYmJxSzc2Y1JKVjc4R3d2NFZ4U0lw?=
 =?utf-8?B?dUN1Z1Z4eWh2SnYvLzUyWGlic0RHaHJiS2Y1YUZmdUpMRThwMm12YkI0cmpN?=
 =?utf-8?B?VDJuQmNacjdtTjVnbkFXRklHcjhQTUQ5bWpqT1JPbmc4ZVp2RFNBem9WTjFQ?=
 =?utf-8?B?OHJ1bDlWMjVvdWsrcnJYN0cvRnVsQWNodVF6VjFIWFJLR3RnQlI0VERYaXlO?=
 =?utf-8?B?RlFGZStSdWlINEs4MHNicWFodVF5bUcvK0hLTkNLaC9uZXNEbkd0VkpHU2ha?=
 =?utf-8?B?WnN6NmFxZVk2Mk9DNDBOVkd5aEdGRUl6M0duUmlmQmVna0h1bWVMNWlQUWpO?=
 =?utf-8?B?QVVVYTg2bVFOcC9SRTZNMGt0N3cxZ2MxUC9sRS95aU9XMk40QzJkanNvT1NO?=
 =?utf-8?B?eWFzLzJ0NEVmTmtsaGdSc1AzSlhMT0hpWWZIU29LdUwreHB5MUpXTVBOWUxY?=
 =?utf-8?B?emFmZk9kTlNobndUT1ZMMXd3cENrQjRKRGg5VjE3VDBmQ0xYSWcrMWhKYUl6?=
 =?utf-8?B?c3NCbGYydGJiVkNmemQwSzZ3RTZadFFDNjMyZlFvQVR5ZlJ5ajludGR2citV?=
 =?utf-8?B?STRwdURybmNXUENOZGh6N1Z2SWpUL3duc1Y0azlNUDMwWm9WdnVtdmQwQkR1?=
 =?utf-8?Q?1v0XBQ7g+stvWNWVhVXdb6RIUM0V5O2RguuYh+1?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5807.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <047529A5B82C624FBC906719537AA690@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11183
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:800:1b2::22];domain=VE1PR08MB5807.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	74783d9e-f8c9-409b-c2ad-08dcf7fc6618
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjdWb1FqVm5IaTFaSVBpWHN6MHArd3k1QWpjUlFOZldENzQwZ2xoN1NSd2cx?=
 =?utf-8?B?NUxvMHJNamVRdkZrZ3UyTmE4Szh0a3czYmkwaEQvU0tZTXVWOWJ4bXlVNm5V?=
 =?utf-8?B?a1VyTWJ5MkVzNzhFQjFFVkdScHlkQVJiVEZIUDBKUHgrUTFhemhsR2xPcFYr?=
 =?utf-8?B?NkJoZGJpMFVSR3h1Q01NbU9FOGtLNkVXTVFCdE5oN2dYMnlmK2pTTjdwTFhs?=
 =?utf-8?B?c3NUc0svTXQ3ODgydFJjN0ZueTRHK0ZiOXhUa2dYWTFSbVJreFY2YmQxSVl3?=
 =?utf-8?B?WFlhMDdBd0ZhNWw4V0hLWXZ5dEtDVHZnQ0NVWVFNaHNnZXlQS3lQSkl4dnNt?=
 =?utf-8?B?aWtKK2ZWT0h4dlM0ZHgrU09Tem43UnlpRFE1NmpBL1dXQ2dlak9EcU41VHds?=
 =?utf-8?B?VHRYVmkyK3N4eFpjT0JacWdDVEtwZUVSZk4vYXM5QlFkR3RNNXk1c1dNcmJX?=
 =?utf-8?B?bnNZc1k2UUtBNyt2L2dKcy9SM0hHNmZDRjhIUWYzalliRDdVZnBjNVdBa1cr?=
 =?utf-8?B?U1Mza3d2Qnppb0pFaXR3UjVRbk5uWlphNFA0c3Q5K01GK28vaFhQVDIxVGF0?=
 =?utf-8?B?a1JGY2p0NUNmc2ZCUjY4M2FoNExGeWs0dXk0c0cybHVUVkI2N0dEQldwOFhh?=
 =?utf-8?B?Nkp5cEFBUHcwNUJ1SnM2bmhZNmZLTlpWRWxBNmlla1pHTENoQjBtY2tHQnpD?=
 =?utf-8?B?MU1zSkpXQjk1MEdZcUlTQUhvU2NXSzJCWStyc0JZZEN0c2FzNURGNDE1cy9O?=
 =?utf-8?B?bGxNemw1UWdzU3hZRXhTOTBwSXVPSnY1ZGtyRDVsMEd0WGJRQk91UHoxMC9h?=
 =?utf-8?B?c3lmTHppeWtrVUdrSWw3MFQwTmNQRGpsTHhVd0JzUVJXL1BQSUZPRXNvbk5h?=
 =?utf-8?B?d01FSHZIRU5IMzlaQkF4cURVM3N0emlvOW1LK09sODZLNFlvZXh4WllnY08y?=
 =?utf-8?B?UkdNdjNvMkZQSXpGamdXV0FHaTd1eVJNWUhHRm5KamJaTTFFZkFEaVlTc2NH?=
 =?utf-8?B?TVR3L25pQVZoWFpuWmQ5UmxHNnlkc25kZ2NBeEYzazl3cnljZjBMMU1TeHFZ?=
 =?utf-8?B?RTE3K0lUV3J6NWxvOUx5M3VQR1ZJK1l3Mm1VUVF0aklBOWNnMFNZa2F5b21t?=
 =?utf-8?B?QmtBY1dWb084WVNVMzVBUm41dys3UW5udEhwTlNzNkNTaXpZUXFkZXY2VWdJ?=
 =?utf-8?B?amMyVExDUzQ3ajQvMDNtbnNpcHVnRERzSDBodmZPdTdVQ3E1WUYxVHBCTWZM?=
 =?utf-8?B?UGFtQ3Vrc2VSTGpRMlZYZWJsUVNKSnArc2dCV2xkblV5ZWhwc2xhWlFYR1g5?=
 =?utf-8?B?bjI1V0thbG1EN0twb29OWThZMWx2NGEyMmlKdmk2MHJVV2NyRE1SbjB3WmdV?=
 =?utf-8?B?Mnk1TERmQzNEZkM1MG04T09RSXl0ZDliazZnOGFuYmxqdG9XWU5Yb3hGbEN1?=
 =?utf-8?B?cE45QzFsZDNSbU5FQ3RVVmszMDY5N0VHd3o1Qi8xK3JHWXhpZEkveVRNU2tC?=
 =?utf-8?B?YVZYN2FqRmRVVzBSVFRzbEQwdm1GQStqaVZmaXJXR2F3Nm9kSEo0SjZiY3p2?=
 =?utf-8?B?ajlQWm0vWGNhblV3cWhFR0xLSWVRUFdJRUZ6UmRkUmtIS2djZzJGMExqVjhu?=
 =?utf-8?B?MDNuOGJUbXFwSVBMWk8zNWMrT0lQZ05CUys0Q09lVWw1ZXZjS0ZYeGZEb00y?=
 =?utf-8?B?Wm9pempNNWlwYksvTjBNcUMvUkdZT21OTmYvazN5dVorZm9PMndGWVc2Nk1Q?=
 =?utf-8?B?OEJPWWJQZUU2aTFUbVRFbUxxNEVoQ0c3QmM2aUVRTGtWWkF1em52bTYvQyt0?=
 =?utf-8?Q?t4Kh6GTUvARswnsWpOwoLQWT5thYiQN1PnFLc=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 09:31:17.2591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2cae54-c2db-49d5-d74f-08dcf7fc70a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9542

SGkgSmFuLA0KDQo+IE9uIDI5IE9jdCAyMDI0LCBhdCAwODowOCwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDI4LjEwLjIwMjQgMTg6MzgsIEF5YW4gS3Vt
YXIgSGFsZGVyIHdyb3RlOg0KPj4gT24gMjgvMTAvMjAyNCAxNTowMSwgSmFuIEJldWxpY2ggd3Jv
dGU6DQo+Pj4gT24gMjguMTAuMjAyNCAxNTozOSwgQXlhbiBLdW1hciBIYWxkZXIgd3JvdGU6DQo+
Pj4+IE9uIDI4LzEwLzIwMjQgMTI6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMjgu
MTAuMjAyNCAxMzo0NSwgQXlhbiBLdW1hciBIYWxkZXIgd3JvdGU6DQo+Pj4+Pj4gLS0tIGEveGVu
L2FyY2gvS2NvbmZpZw0KPj4+Pj4+ICsrKyBiL3hlbi9hcmNoL0tjb25maWcNCj4+Pj4+PiBAQCAt
NiwxMSArNiwxMyBAQCBjb25maWcgUEhZU19BRERSX1RfMzINCj4+Pj4+PiANCj4+Pj4+PiAgIGNv
bmZpZyBOUl9DUFVTDQo+Pj4+Pj4gICAJaW50ICJNYXhpbXVtIG51bWJlciBvZiBDUFVzIg0KPj4+
Pj4+ICsJcmFuZ2UgMSAxIGlmIEFSTSAmJiBNUFUNCj4+Pj4+PiAgIAlyYW5nZSAxIDE2MzgzDQo+
Pj4+Pj4gICAJZGVmYXVsdCAiMjU2IiBpZiBYODYNCj4+Pj4+PiAgIAlkZWZhdWx0ICI4IiBpZiBB
Uk0gJiYgUkNBUjMNCj4+Pj4+PiAgIAlkZWZhdWx0ICI0IiBpZiBBUk0gJiYgUUVNVQ0KPj4+Pj4+
ICAgCWRlZmF1bHQgIjQiIGlmIEFSTSAmJiBNUFNPQw0KPj4+Pj4+ICsJZGVmYXVsdCAiMSIgaWYg
QVJNICYmIE1QVQ0KPj4+Pj4+ICAgCWRlZmF1bHQgIjEyOCIgaWYgQVJNDQo+Pj4+Pj4gICAJaGVs
cA0KPj4+Pj4+ICAgCSAgQ29udHJvbHMgdGhlIGJ1aWxkLXRpbWUgc2l6ZSBvZiB2YXJpb3VzIGFy
cmF5cyBhbmQgYml0bWFwcw0KPj4+Pj4gSSdtIGFmcmFpZCBJIGNhbid0IGVhc2lseSB0ZWxsIHdo
ZXRoZXIgTVBVIGNhbiBiZSB1c2VkIHRvZ2V0aGVyIHdpdGggYW55IG9mDQo+Pj4+PiBSQ0FSMywg
UUVNVSwgb3IgTVBTT0MuIElmIGl0IGNhbiwgdGhlIG5ldyBkZWZhdWx0IGxpbmUgd291bGQgbmVl
ZCB0byBtb3ZlDQo+Pj4+PiB1cCwgYXMgaXQncyB0aGUgZmlyc3Qgb25lIHRoYXQgaGFzIGEgbWF0
Y2ggb24gaXRzIGNvbmRpdGlvbiB3aGljaCBpcyBiZWluZw0KPj4+Pj4gdXNlZC4NCj4+Pj4gTVBV
IGNhbm5vdCBiZSB1c2VkIHdpdGggYW55IG9mIHRoZSBleGlzdGluZyBwbGF0Zm9ybXMuDQo+Pj4g
VGhhdCBpcyAtIHFlbXUgY2FuJ3QgZW11bGF0ZSBzdWNoIGFuIGVudmlyb25tZW50LCBpLmUuIGV2
ZW4gUUVNVSBhbmQgTVBVDQo+Pj4gZG9uJ3QgZ28gdG9nZXRoZXI/DQo+PiANCj4+IFFlbXUgaGFz
IHN1cHBvcnQgZm9yIEFhcmNoMzIgTVBVIGF0IEVMMiBhbmQgRUwxIChpZSBSNTIpLiBBcyBmYXIg
YXMgSSBhbSANCj4+IGF3YXJlLCB0aGVyZSBpcyBubyBzdXBwb3J0IGZvciBBYXJjaDY0IE1QVSBp
biBRZW11IChpZSBSODIpLg0KPj4gDQo+PiBFdmVuIGZvciBSNTIsIEkgY291bGQgbm90IGdldCB0
aGUgdXBzdHJlYW0gUWVtdSB3b3JraW5nIChlbXVsYXRpbmcgc29tZSANCj4+IEFybSByZWZlcmVu
Y2UgcGxhdGZvcm0pLg0KPj4gDQo+PiBJIGNvdWxkIGdldCB0aGUgWGlsaW54IGZvcmsgb2YgUWVt
dSAoaHR0cHM6Ly9naXRodWIuY29tL1hpbGlueC9xZW11KSANCj4+IHdvcmtpbmcgd2hpY2ggZW11
bGF0ZXMgQU1EJ3MgU29DIHVzaW5nIFI1Mi4NCj4+IA0KPj4gSG93ZXZlciwgdGhpcyBzaG91bGQg
bm90IGltcGFjdCB0aGUgY3VycmVudCBwYXRjaC4gVGhlcmUgaXMgbm8gUWVtdSBpbiANCj4+IHhl
bi9hcmNoL2FybS9wbGF0Zm9ybXMvKi4NCj4gDQo+IEFpdWkgdGhhdCdzIG5vdCByZWxldmFudC4g
VGhlcmUgaXMgYSBRRU1VIGl0ZW0gaW4geGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnLg0K
PiBJIGNvbnRpbnVlIHRvIGZhaWwgdG8gc2VlIHdoeSB0aGF0IGNvdWxkbid0IGJlIHNlbGVjdGVk
IHRvZ2V0aGVyIHdpdGggTVBVLiBZZXQgaWYNCj4gaXQgY2FuIGJlLCB5b3UnZCBlbmQgdXAgd2l0
aCBhIGRlZmF1bHQgb2YgNCwgbm90IDEsIGlmIGl0IGFjdHVhbGx5IF9pc18gc2VsZWN0ZWQuDQo+
IEFsdGVybmF0aXZlbHkgUUVNVSAoYW5kIG1heWJlIGFsc28gUkNBUjMgYW5kIE1QU09DKSBuZWVk
IHRvIGJlIG11dHVhbGx5IGV4Y2x1c2l2ZQ0KPiB3aXRoIE1QVS4gSG1tLCBsb29rcyBsaWtlIHRo
YXQncyBhbHJlYWR5IHRoZSBjYXNlLCBieSBwYXRjaCAyIHN1cHByZXNzaW5nIHRoZQ0KPiAiUGxh
dGZvcm0gU3VwcG9ydCIgcHJvbXB0LiBXaGlsZSB0aGF0IGxvb2tzIGZyYWdpbGUgdG8gbWUsIEkn
bSBzb3JyeSBmb3IgdGhlDQo+IG5vaXNlIHRoZW4uDQoNCkFyZSB5b3Ugc3VnZ2VzdGluZyB0byBt
b3ZlICJkZWZhdWx0ICIxIiBpZiBBUk0gJiYgTVBV4oCdIHJpZ2h0IGFmdGVyIOKAnGRlZmF1bHQg
IjI1NiIgaWYgWDg24oCdPw0KDQpDaGVlcnMsDQpMdWNh

