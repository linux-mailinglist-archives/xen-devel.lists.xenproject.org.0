Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6599D95E2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 11:57:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843572.1259198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFtFa-0006i3-Ec; Tue, 26 Nov 2024 10:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843572.1259198; Tue, 26 Nov 2024 10:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFtFa-0006ft-B3; Tue, 26 Nov 2024 10:56:58 +0000
Received: by outflank-mailman (input) for mailman id 843572;
 Tue, 26 Nov 2024 10:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yuIc=SV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tFtFY-0006fl-A6
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 10:56:56 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20603.outbound.protection.outlook.com
 [2a01:111:f403:260c::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23d2de7a-abe5-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 11:56:51 +0100 (CET)
Received: from AS4P250CA0030.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::20)
 by AS8PR08MB8921.eurprd08.prod.outlook.com (2603:10a6:20b:5b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 10:56:45 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::6d) by AS4P250CA0030.outlook.office365.com
 (2603:10a6:20b:5e3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.19 via Frontend Transport; Tue,
 26 Nov 2024 10:56:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.0
 via Frontend Transport; Tue, 26 Nov 2024 10:56:45 +0000
Received: ("Tessian outbound bf1c175f6cbb:v490");
 Tue, 26 Nov 2024 10:56:45 +0000
Received: from L7d5ecba159f6.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E68B9CB3-C8F0-4C87-A7E7-1D816B16386E.1; 
 Tue, 26 Nov 2024 10:56:38 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L7d5ecba159f6.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 26 Nov 2024 10:56:38 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DU0PR08MB10357.eurprd08.prod.outlook.com (2603:10a6:10:414::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 10:56:36 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 10:56:36 +0000
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
X-Inumbo-ID: 23d2de7a-abe5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwYzo6NjAzIiwiaGVsbyI6IkVVUjAzLVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjIzZDJkZTdhLWFiZTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjE4NjExLjI5OTM4OSwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=o0LTXudQIwlmHHPeT/B4WZsdTgGINxupSUCPrNSCilhUN6GGGNCP1ujblPNRI9QCKpV+enCOhuWmPE9I4cDuf53vRxqDOHio3dRnEQcO5aBH9WBQWIxNoa5vCtY3uxXfCu0UzQHUO8D1Hw+aXEYTQmR6rEOV1PA9XwcNOfMYhIgm6ta25YXoxC1oElBAApMhkUmajg4UcImeHiBWNHqQz2r1f9oPGk92CzHUmxfBeg6EPbESkM64f34GR5qEvuuEEaIDttL5bw10rz/yaOCi3ryy6FpmO9BRL5bJrg6dBJIMbx+kdvGtwQsy3rePU+3vzYbuV6qoc1sdPEEDFbf61Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axhAz9D3KM7ys6kROUzf6GB7fq76WSSUy47H5z1h78c=;
 b=rfLMAaHJJjPmsqOMLy5MRv1KiJq6WYcUbbio2z5TeB7OI6jJFEm9bxMn3F6ElRcgF/Q5n6BZ6MXnQaPmajfZW7beO+3BeHRIrha5c3k9YA0hBEz6IWaxL7S0gDPwcYMYsmV+nHBcMBWwMpDC2rFvl9z42OvGre3pzPu6QEnGKJx+/vJh+bZULeDsGeprkRDjI/KSGUMXWgIlOX2584dc5DtYleECgKRYtrOXMoa/NnaekHG7atS6qBZ1vKIHqTFAv3EORLcXZlyY+gKwXV/dxBCX64M+Cf7wWOpF19pCcaC2niuu+qVGnwiT48E3aKCOJvYjPEdzg7gRyr3gm1HnHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axhAz9D3KM7ys6kROUzf6GB7fq76WSSUy47H5z1h78c=;
 b=kBlKoHv5ryLGiZYs0dnxfY/ZcMUAcVKmu4mTRLq5r600oNV7NUgQV4b8M+hptcIItoUCV5M4gbklGpE9aDyZmt6iQt0FnCvqeI/mTi5zxMDICYW4vIs1xt8h2MadI5WJQIsC27V7ElaP/o1q0i6ti/xHg/6CxOJtDBkJZiZN1lk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 12d656a3b1c3256b
X-TessianGatewayMetadata: w9yZnLv4lPVnQo/fTneX9SxJfO7e9SAwMv7HwMcwAJFIGyPy5VIRtYRrgMVMKaBpnvFYkpykpm+Dw+6XCJHpK4kUJDzBpmb4KmA4LI/zxQK7u6m4qatGm0SeYfEZEdK/z4mKmJ6DFh0qAGvxuwSwySwmWrgbvKWeFY4QFuPujdY=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/I34G2GzusY5DIep1rW3KZ7S1ntTLvZcv2l1ySuiGOMc04aLFWvU8Evmvh/YwvKKlGivuoadMHuEm2wwW1pdY/Q0qer689VeZH8m5ZqQOVCflKSZsjH2CfwOgh1LH1Q2muFcLEoDOoFjWMROSqhj886RkpSmQW6rzaQlfkR7To6Uy5eQ83NRDuwrgb87VKHkDuAqr6Ixr7Hfk3dVfIpQb61Yh84nl+sIRowM7N7y3AvluXdEoOjnujhKKuyJpyBILhJ9do+VeuA4+9frvPEIDLTdxidwCFXCB+54hGVUt7HZQE/5sExuXalN4Wf6mQnJCoQP1rmBr0sknEg41Yl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axhAz9D3KM7ys6kROUzf6GB7fq76WSSUy47H5z1h78c=;
 b=Whh53p1CM+8CGu6/5amu+Kf755+osTUl6ZLAzg7xWxfXqc47+i8BJ/dD24Z7D7hEIYar+YyIuAvVFAm/cGMQ2PuL2iHcebL2w9BcDDmmR25Oz9PhsgPNJo3N1FYJNaUwXXpVQfE+aWGayHVsqbZatNdb7qpm8klVQQ5Bru/cfRGHwe7nx06sEKUHoZJMyQoclVwSpdp6j2SW/QAqKe1IHM6CLhqjn43ynMBfhY3xcq58dZ8pJIr8TnhFnWhbIWHWSkdhiYDJI+bNRGzrFOlWcLJ+BJhygTRmzfQgnhRefIABGWc2JXzvD1hp2sHyER1Pz+R5owCfmE3NSlqYUqptQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axhAz9D3KM7ys6kROUzf6GB7fq76WSSUy47H5z1h78c=;
 b=kBlKoHv5ryLGiZYs0dnxfY/ZcMUAcVKmu4mTRLq5r600oNV7NUgQV4b8M+hptcIItoUCV5M4gbklGpE9aDyZmt6iQt0FnCvqeI/mTi5zxMDICYW4vIs1xt8h2MadI5WJQIsC27V7ElaP/o1q0i6ti/xHg/6CxOJtDBkJZiZN1lk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/4] xen/arm: do not give memory back to static heap
Thread-Topic: [PATCH v2 4/4] xen/arm: do not give memory back to static heap
Thread-Index: AQHbOmE/JeWd4mQRXU6E1FRNAbLoQLLIOm6AgAE0ZQA=
Date: Tue, 26 Nov 2024 10:56:36 +0000
Message-ID: <BE895863-B07F-42C2-BD44-D0A1E6150DC4@arm.com>
References: <20241119085806.805142-1-luca.fancellu@arm.com>
 <20241119085806.805142-5-luca.fancellu@arm.com>
 <ca91b717-47c3-4f92-af6a-cb740ef6e91d@suse.com>
In-Reply-To: <ca91b717-47c3-4f92-af6a-cb740ef6e91d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DU0PR08MB10357:EE_|AM4PEPF00025F9B:EE_|AS8PR08MB8921:EE_
X-MS-Office365-Filtering-Correlation-Id: f8335569-7598-43af-1088-08dd0e0904da
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MzFybHRDejlZb3QwNUgwbVUxSVdHaThxN2FlU1FEV2NrWXNKWHJhUzhFZ3Vx?=
 =?utf-8?B?K0J1UmJhK2piYURBQWpENzlFNU9WMUthc1JTQ2xqaDZ2b2dVMDY4VWZCM243?=
 =?utf-8?B?MkNDNy8vMFZnSE0zYmgzZWZsdDl4K3lRMU9xMC9zT2hGdU4rejhZMWJJemJw?=
 =?utf-8?B?UkpPaitCdWp2WTlrNFBYcU1vNzl0RXRnNVhBUGhEM1ZIUGprWHRuVlRBdDVH?=
 =?utf-8?B?Sm5XR0R4ZXJjaWJUb1JTR1VmRTlnNE0vMGcvRnN2WDU1VG56NFVpTjdJMUxz?=
 =?utf-8?B?Z0R4YWhhN2lwY3V0Sm52aHIzUHdPSGdHaWtuVDczZFhVRzBCekFCSVI3YnBm?=
 =?utf-8?B?Q1R6WFpZM29TNWc0OXZ2aUE5bVNkbzZ5KytQRUl0aE03R1FUVDFrZEdRZUZp?=
 =?utf-8?B?OTdQVlkrYmZhQ2t6dW1LRmQzeXUzWnFqVFpmTE5rZElPSUVUZGgxeWZGWTVD?=
 =?utf-8?B?cTB1eTR3R25xYXlSeDhNckY2eFpFRVdkbzZVdnN5NW9pVWhpSHF0REkwYmR6?=
 =?utf-8?B?cVJzN1dCZVVtOHpRcVA4cUp1enZOQmVpMkhxNFMvYnhGSmwvTW0zV1J3cUVF?=
 =?utf-8?B?UzR2T0didHlYekZETXJ2aGlXWXNmeFlaWndwb0NHbHVDUGtSb013TU1FNUVi?=
 =?utf-8?B?L3JuYnl5ZWswLzdMTFR5ZElpcGVHN1BxV3hrckZPV2tvUFdsRGNpQXFTQVIr?=
 =?utf-8?B?bS9LNkY3QzdkMFdHeUt3ZnRteHRhT0loMVhUdHR2c3BEKzA5c0ZjcVh1ZFdr?=
 =?utf-8?B?a1VLbTRCWlMwN2RZUFpPT0twV1poY1Y3TDVCUlJkRVdsVEVWV0VjUlA4TjJi?=
 =?utf-8?B?bmdiRXdjWWtrdmhmT3Z3YzVVQjl3U0wyYWRuRnl4bGxTeG96TlFST0llai9u?=
 =?utf-8?B?TlVUL1BHTTkvN0NUMDlUdlhxc0ZsdDlYRWJmRlkwQnFvMzhWZ29ScW56V0Nj?=
 =?utf-8?B?NWNYN1Y2L29YaUNjWUFaY1RXS09oS2RZQ3BRWGp2ek9kMFFiUW5pRnRmdDdY?=
 =?utf-8?B?aEpvL04vZnRJRGY4SXNhNGRtKzVmWmVrdlZNWERmMDE0MERUTEFPWnVpMExU?=
 =?utf-8?B?Y2NNSDVvNlFaYmo5ejB6U3JKMXBoZjV3T084YWJiT1E1Z3JwU1dCR2lIOHJw?=
 =?utf-8?B?M1YvRU50MEs2bTBWdlppV0s3b2NtMzgzTlFQVHlRc1puclNxT3ozK1Back1v?=
 =?utf-8?B?eVJ5ZG0zNEhtbXB4c042U05pUjRQOFpZZWk4KzgxbUkzUDltWWorcm5yVmtL?=
 =?utf-8?B?NXdOUDdTTEtaMHpVaWs5Mm04bllmV1FrdW9veUQ0TE42S25VazdkeGR2d2lB?=
 =?utf-8?B?T01uQVRxUHpnTFNKUS9aVDFiMTBpWWZ2Mk4velN0OFNPdndUbUlTRWFTWVFw?=
 =?utf-8?B?VjRqajdrOGZnU0FrWnJnR1VFNlNKMG90S0xTbGJrdHFtTGNzRFJodHkrYjJx?=
 =?utf-8?B?L2MrcFRHTHpoQzgvRkFFOTE0eGNYbm5LMXQzTUxpemgzTkhtcEY4KzVnc2lU?=
 =?utf-8?B?TWNyUzU3djZNVlF5b3ozbDNVaUIwUTJ5QitIYWxyVWtRRVg1QzFIMjducFdh?=
 =?utf-8?B?UjVod3FzdjI3bGNRSzl4MjdWNTd4OWxpUGJMTDVUSDhYc3c3emc5NjRLODB6?=
 =?utf-8?B?ZVIyK0lOR0RWYmZWR2xKT2tvSHJQaE9uRVV5K1dybUgrV0YzSGVIcVpDUVZE?=
 =?utf-8?B?bk95Y3Q3YkNPc2VRY0YwQnNydlE2UE1Ib3NMNDdKandEcWJWLzZiSExMUVNX?=
 =?utf-8?B?TGZMNjJ4NHJpZFRsOWx3Q0g1RStWcStrTytLZkNBaEVBMWRjY1U4RVpWRzBi?=
 =?utf-8?B?bWE2cFFkM3hvWGUxSnpLek9zbnR5YnFpTXdkay9kcUlEbE4vSks4SFZMTkVy?=
 =?utf-8?B?aXh6QklvZ1BLbnFrMExEKzBsaWYyOUhsaE9MejVGR2NMdlE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CE0B6A163B75042AAC555BB47E10752@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10357
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c1801c1-779e-41ac-1e3b-08dd0e08ff99
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RndGblRLNXdHekFIUzJCbkFiMzAzaGU0L1NQb3J1dzRjcWxmMlFCQlBDTTV0?=
 =?utf-8?B?eTcramk4d2hLWEJVTHNwcSs4UUN1YWxMSXFBN1BubnBGdktNbzZSQ0hIbkZW?=
 =?utf-8?B?ZVpkVHNFUFZuWEMvS0djc1htNUlJRkh0c3QremJQVCtnWHhJcGZFVjNuMDhF?=
 =?utf-8?B?RktCVmRNdmEwYkZyQ0R5dFRQbllORTdUSGVxMW00MGZTODUrdHQyS2p0YVJr?=
 =?utf-8?B?NHZyUmFNZ3BIRno1SmszOVppRVkzNGV1TUxnMjRFT1BHOEEzbGxHaEN4cFI5?=
 =?utf-8?B?VVhQRFJDbkdOd3FzTnhORHdTblB1OGxJT2Y3VkRRT2MxTEVSUXQwNVZjK3Zq?=
 =?utf-8?B?d0t4Y1NZSnVRK1pDZFNRUGNYZEMwb2x4VUpqTDYwT1JKdjFFWlBMbFdCSjdU?=
 =?utf-8?B?ajZzZTVJbVo1ZmdDMTdRa3M2UzRlcVE0VFFCQSt1WjlQdVZjdjY1Z2VGS20y?=
 =?utf-8?B?cXBZbW0vT1V3aE9PTDdnRUxDbnIvankvbjNFYkdKSXk0eEthL0NxWHByaTBC?=
 =?utf-8?B?QmpqZlJPb2NYZTk3RDZsSWVVSEdiWmczTFhMUUh1QVUxWWVkZ3R4cXJ4Q1d5?=
 =?utf-8?B?aW11RkpzY0lBTGZSUzBncVBROERDTXNxYkVYYzhJUHJ2aDZ2MTMzdDNpdXQy?=
 =?utf-8?B?T05uR0hCdG9UTlp1eUtoc1VmclhwbFdMaytMWGY1cW5QSW5FaExRRW9QT1pG?=
 =?utf-8?B?OUQvNzBsdzBVU041bzA0LzF1Q2syalc3bUlVNmZFQllLRzFmMzJ3cnI3RWRY?=
 =?utf-8?B?bllJS0pTZ2hNMmxmMXp5OUcyMmlVdTBtTG43UEFKa2U0ZEc5Y09DVjFlYitx?=
 =?utf-8?B?RjBWRGl5WXA1S2NIMzAzK1BoZmlic01Ob1ZvbSt4L2gxWkQ0U0d2TlhuVC8w?=
 =?utf-8?B?dXZYM2lUdTM5dXBYK3VNNjN5MkhGYXZBSGo1MXJuSm9FOHFjVUN5KzFPb29j?=
 =?utf-8?B?V0pmYzVTNjErTWVYRERBdW4ySFdIcjZGNkpFNllMVEJrdkJzK3VPWWdrS1VN?=
 =?utf-8?B?MlVweUo0Z1E0KzJyWEpLSG92dHBIRUxLU051WUoydHZwS2NVU1dCcjRJcEo1?=
 =?utf-8?B?SHF3cDN4VzYvc0htbUtnTjE5ck9BbFk1SXgzT04zVjJjYnJmaGZsYnNHeEpt?=
 =?utf-8?B?WnFuN0gxOTJOSkd3NVFDQnBtVVo3UXVjUithSCtLYWNhcWJ5S0R4Q3pUTTVr?=
 =?utf-8?B?QlNDREF0UDRtT2FkNlNPdVdCbXVydS9WR213MXUxT1FKb09zVll6c2xpVk9X?=
 =?utf-8?B?MnlDQ0M4M0RjRlJvN2FnbGtaNUdlejJnaDl0Ym1CRm9WdFN3dXI5M05sTUxj?=
 =?utf-8?B?a1JRUWZhM0xyTllEVUZkTzVVSUZ5S2RLWlFTUVkvaXBnendPcVZ3R05KMWxU?=
 =?utf-8?B?N0gwY3VBT3BJQ1RyMU4rd1JHSE13ZkxObDFjMGVzRGJib3I0Z25Zb0VnL2Vq?=
 =?utf-8?B?eDVkZ0lGNXNCYnJmN2lyNXE4UUNyY09DZHk1ZENrZW9NQmlZdlRvK1RyZ0VU?=
 =?utf-8?B?OXhDa3RZa2dXa3N2TjRTN0FUSWJBM2FvRkZRbXNCSE9VSGVDMHlKa3VTL1dP?=
 =?utf-8?B?TzhkNUdUZWFVNDBkODdRY3VheVhSZGRCeUZXVStIeG1jb043aTl5Q2QvY3Yw?=
 =?utf-8?B?MWo5NmJoYUFvdUJvZzd0TUNzblVMc3BYck15d3VxeC9WZkJBRjJQcStXTndQ?=
 =?utf-8?B?MFA2OHl4UkZxQ2ZiRENsTVFtSDZJQlJjU1pHYVhCN29vOFhDSTJZOWtSdjVj?=
 =?utf-8?B?LzMySVJJMTg2bVlTVWNYUlhCTm5haUR3MnU2ZDh4K2d4TDh6TUMzY3dIa0pK?=
 =?utf-8?B?U1RaY0VCb1NGYXFSb2R0ODRuUEcyOW5CT2VCdnlaTjNjVGhIN3BiZW45QnF5?=
 =?utf-8?B?RHNJRVZKM0hCNGNFVkM2VHA2dnpYd0NnYUg2VlZ5MUE0SzM3ZVNoUFRvNnJm?=
 =?utf-8?Q?YDQfEKPfWFaFVm0m3hi01goBOt1f4rp1?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 10:56:45.4747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8335569-7598-43af-1088-08dd0e0904da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8921

SGkgSmFuLA0KDQp0aGFua3MgZm9yIHlvdXIgcmV2aWV3DQoNCj4gT24gMjUgTm92IDIwMjQsIGF0
IDE2OjMyLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24g
MTkuMTEuMjAyNCAwOTo1OCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IEZyb206IFBlbm55IFpo
ZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPj4gDQo+PiBJZiBYZW5oZWFwIGlzIHN0YXRpY2Fs
bHkgY29uZmlndXJlZCBpbiBEZXZpY2UgVHJlZSwgaXRzIHNpemUgaXMNCj4+IGRlZmluaXRlLiBT
bywgdGhlIG1lbW9yeSBzaGFsbCBub3QgYmUgZ2l2ZW4gYmFjayBpbnRvIHN0YXRpYyBoZWFwLCBs
aWtlDQo+PiBpdCdzIG5vcm1hbGx5IGRvbmUgaW4gZnJlZV9pbml0X21lbW9yeSwgZXRjLCBvbmNl
IHRoZSBpbml0aWFsaXphdGlvbg0KPj4gaXMgZmluaXNoZWQuDQo+IA0KPiBJJ20gc29tZXdoYXQg
Y29uZnVzZWQgYnkgdGhlIHVzZSBvZiAiYmFjayIgaGVyZT8gSXNuJ3QgdGhlIGNoYW5nZSBhbGwN
Cj4gYWJvdXQgaW5pdC10aW1lIGJlaGF2aW9yLCBpLmUuIG1lbW9yeSB0aGF0J3MgaGFuZGVkIHRv
IHRoZSBhbGxvY2F0b3IgZm9yDQo+IHRoZSB2ZXJ5IGZpcnN0IHRpbWU/IEVsc2UgSSBtYXkgYmUg
bWlzdW5kZXJzdGFuZGluZyBzb21ldGhpbmcgaGVyZSwgaW4NCj4gd2hpY2ggY2FzZSBJJ2QgbGlr
ZSB0byBhc2sgZm9yIHRoZSBkZXNjcmlwdGlvbiB0byBiZSByZWZpbmVkLg0KDQpZZXMsIEnigJl2
ZSB0cmllZCB0byByZXBocmFzZSBpdCwgZG8geW91IHRoaW5rIHRoaXMgaXMgbW9yZSBjbGVhcj8N
Cg0KSWYgdGhlIFhlbiBoZWFwIGlzIHN0YXRpY2FsbHkgY29uZmlndXJlZCBpbiBEZXZpY2UgVHJl
ZSwgaXRzIHNpemUgaXMNCmRlZmluaXRlLCBzbyBvbmx5IHRoZSBkZWZpbmVkIG1lbW9yeSBzaGFs
bCBiZSBnaXZlbiB0byB0aGUgYm9vdA0KYWxsb2NhdG9yLiBIYXZlIGEgY2hlY2sgd2hlcmUgaW5p
dF9kb21oZWFwX3BhZ2VzKCkgaXMgY2FsbGVkDQp3aGljaCB0YWtlcyBpbnRvIGFjY291bnQgaWYg
c3RhdGljIGhlYXAgZmVhdHVyZSBpcyB1c2VkLg0KDQo+IA0KPj4gLS0tIGEveGVuL2luY2x1ZGUv
eGVuL2Jvb3RmZHQuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2Jvb3RmZHQuaA0KPj4gQEAg
LTEzMiw3ICsxMzIsNiBAQCBzdHJ1Y3QgYm9vdGluZm8gew0KPj4gI2lmZGVmIENPTkZJR19TVEFU
SUNfU0hNDQo+PiAgICAgc3RydWN0IHNoYXJlZF9tZW1pbmZvIHNobWVtOw0KPj4gI2VuZGlmDQo+
PiAtICAgIGJvb2wgc3RhdGljX2hlYXA7DQo+PiB9Ow0KPj4gDQo+PiAjaWZkZWYgQ09ORklHX0FD
UEkNCj4+IEBAIC0xNTcsNiArMTU2LDEwIEBAIHN0cnVjdCBib290aW5mbyB7DQo+PiANCj4+IGV4
dGVybiBzdHJ1Y3QgYm9vdGluZm8gYm9vdGluZm87DQo+PiANCj4+ICsjaWZkZWYgQ09ORklHX1NU
QVRJQ19NRU1PUlkNCj4+ICtleHRlcm4gYm9vbCBzdGF0aWNfaGVhcDsNCj4+ICsjZW5kaWYNCj4g
DQo+IEp1c3QgdG8gZG91YmxlIGNoZWNrIE1pc3JhLXdpc2U6IElzIHRoZXJlIGEgZ3VhcmFudGVl
IHRoYXQgdGhpcyBoZWFkZXIgd2lsbA0KPiBhbHdheXMgYmUgaW5jbHVkZWQgYnkgcGFnZS1hbGxv
Yy5jLCBzbyB0aGF0IHRoZSBkZWZpbml0aW9uIG9mIHRoZSBzeW1ib2wNCj4gaGFzIGFuIGVhcmxp
ZXIgZGVjbGFyYXRpb24gYWxyZWFkeSB2aXNpYmxlPyBJIGFzayBiZWNhdXNlIHRoaXMgaGVhZGVy
DQo+IGRvZXNuJ3QgbG9vayBsaWtlIG9uZSB3aGVyZSBzeW1ib2xzIGRlZmluZWQgaW4gcGFnZS1h
bGxvYy5jIHdvdWxkIG5vcm1hbGx5DQo+IGJlIGRlY2xhcmVkLiBBbmQgSSBzaW5jZXJlbHkgaG9w
ZSB0aGF0IHRoaXMgaGVhZGVyIGlzbid0IG9uZSBvZiB0aG9zZSB0aGF0DQo+IGVuZCB1cCBiZWlu
ZyBpbmNsdWRlZCB2aXJ0dWFsbHkgZXZlcnl3aGVyZS4NCg0KSeKAmXZlIHJlYWQgYWdhaW4gTUlT
UkEgcnVsZSA4LjQgYW5kIHlvdSBhcmUgcmlnaHQsIEkgc2hvdWxkIGhhdmUgaW5jbHVkZWQgYm9v
dGZkdC5oIGluDQpwYWdlLWFsbG9jLmMgaW4gb3JkZXIgdG8gaGF2ZSB0aGUgZGVjbGFyYXRpb24g
dmlzaWJsZSBiZWZvcmUgZGVmaW5pbmcgc3RhdGljX2hlYXAuDQoNCkkgd2lsbCBpbmNsdWRlIHRo
ZSBoZWFkZXIgaW4gcGFnZS1hbGxvYy5jDQoNCj4gDQo+PiBAQCAtMjA2LDQgKzIwOSwxMyBAQCBz
dGF0aWMgaW5saW5lIHN0cnVjdCBzaG1lbV9tZW1iYW5rX2V4dHJhICpib290aW5mb19nZXRfc2ht
ZW1fZXh0cmEodm9pZCkNCj4+IH0NCj4+ICNlbmRpZg0KPj4gDQo+PiArc3RhdGljIGlubGluZSBi
b29sIHhlbl9pc191c2luZ19zdGF0aWNoZWFwKHZvaWQpDQo+PiArew0KPj4gKyNpZmRlZiBDT05G
SUdfU1RBVElDX01FTU9SWQ0KPj4gKyAgICByZXR1cm4gc3RhdGljX2hlYXA7DQo+PiArI2Vsc2UN
Cj4+ICsgICAgcmV0dXJuIGZhbHNlOw0KPj4gKyNlbmRpZg0KPj4gK30NCj4gDQo+IEFzIHRvIG5h
bWluZzogSG93IGFib3V0IHVzaW5nX3N0YXRpY19oZWFwKCk/IFRoZSB4ZW5fIHByZWZpeCBkb2Vz
bid0IGxvb2sgdG8NCj4gYmUgY2FycnlpbmcgYW55IHVzZWZ1bCBpbmZvcm1hdGlvbiwgYW5kIHRo
ZSB0aGVuIHJlbWFpbmluZyBpc18gcHJlZml4IHdvdWxkDQo+IGJlIGxhcmdlbHkgcmVkdW5kYW50
IHdpdGggInVzaW5nIi4gUGx1cyB0aGVyZSBzdXJlbHkgd2FudHMgdG8gYmUgYSBzZXBhcmF0b3IN
Cj4gYmV0d2VlbiAic3RhdGljIiBhbmQgImhlYXAiLg0KDQp5ZXMsIHNvdW5kcyBhIGJldHRlciBu
YW1lLCBJ4oCZbGwgdXNlIGl0DQoNCkNoZWVycywNCkx1Y2E=

