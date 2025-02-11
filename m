Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8C1A307A4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 10:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885248.1295034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmuF-0004Lb-2O; Tue, 11 Feb 2025 09:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885248.1295034; Tue, 11 Feb 2025 09:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmuE-0004Il-Vy; Tue, 11 Feb 2025 09:50:14 +0000
Received: by outflank-mailman (input) for mailman id 885248;
 Tue, 11 Feb 2025 09:50:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EtZg=VC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1thmuD-0004Ic-F5
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 09:50:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061d.outbound.protection.outlook.com
 [2a01:111:f403:260e::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9543271a-e85d-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 10:50:10 +0100 (CET)
Received: from DU7PR01CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::25) by AM9PR08MB6195.eurprd08.prod.outlook.com
 (2603:10a6:20b:284::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 09:50:07 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::fd) by DU7PR01CA0036.outlook.office365.com
 (2603:10a6:10:50e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.11 via Frontend Transport; Tue,
 11 Feb 2025 09:50:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Tue, 11 Feb 2025 09:50:07 +0000
Received: ("Tessian outbound e4b26383420a:v567");
 Tue, 11 Feb 2025 09:50:06 +0000
Received: from Lc165979992fd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F272DB73-6DFB-4C6F-9A43-E4B15F2525B8.1; 
 Tue, 11 Feb 2025 09:50:00 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc165979992fd.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Feb 2025 09:50:00 +0000
Received: from VE1PR08MB5807.eurprd08.prod.outlook.com (2603:10a6:800:1b2::22)
 by DU0PR08MB9346.eurprd08.prod.outlook.com (2603:10a6:10:41e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 09:49:55 +0000
Received: from VE1PR08MB5807.eurprd08.prod.outlook.com
 ([fe80::ee39:f31e:3c63:985a]) by VE1PR08MB5807.eurprd08.prod.outlook.com
 ([fe80::ee39:f31e:3c63:985a%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 09:49:54 +0000
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
X-Inumbo-ID: 9543271a-e85d-11ef-b3ef-695165c68f79
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RXKFO49iGsZsoKOPTIzDx2xrnMruVOAXQMEWjWPkIthneSntFZHLXezc/PgOlyAe5c2fj0TiY4lzn1Clu9yIffK4s/bHEwxdQBEd6Jaqm2tDLGt5TA7+U5BU864YCIbsVUc0e/uTVEEHR/vjZwdl71i6ILeGA5K9nGXWWLpz4aLaESGw4935gHwwjiwM3I2aC4BTcBVQBKve/btzNpA6IrmcY+p4C1wvvzfCjTIcB9eZuNhh3l/QU3I33lRTLFZ7L1XlwDSYeWTVXFtHlabPxPUSWQTkkILw0kXskMLzAhBKZGTrpffr3FcxPpi1j4IP2c7rWh8PglbB+Uc6BRNmfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/wMv/qONaoxlgBo6054qDgVarVsuFMsSoGIqnLCNB4=;
 b=TcCnVpgxHkkZewO4cUg4XIpuDb5NNgnydeEbo6i2e1Oe92haZt98Qc3q6+0E43YqZ20cHJozdj8SrORjxhBYW2x4fi3cGNrOrNFPGj9QQJimzIKedbCRIM8fIUdovPe6IVhYmL+8Ky8EiCpzPjbDRc3kscwxZ4teJS1VjCUg9RDsLOTIze7QJVBvJa3y4yvCC/sVMRzSQQwvieb8BZ50LynOUUHAyzH9XapaZucCX9kQx/py9PYNGyCk+IXEna+9ggSfQozgWcR9e1cuXFjPVrCfYIeqR4PE18bhRvAmKvvwY4uyFpPkqrXe8JzCg5RtzhsshZgniwkfxAsN3f+M+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/wMv/qONaoxlgBo6054qDgVarVsuFMsSoGIqnLCNB4=;
 b=Svuf7zJS6lu+4tSA2n6sSdmjmzeFnobeYWHX3aV2TYnAwxOOv4LL72UoqAzfE/o5mNBDyIoIABQ+pdAi72NIczCt6RKNDQA2zi/hvH4EtpnMU/6WCPtRa9aMyOhqX8AWlYXdP6wfhk9p7EVZ3Sa529FRA1mfuxgpED5UVUuaAGc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 153f810727b50d12
X-TessianGatewayMetadata: QQpbSLAbl58Tff+0K9J0pK6H19IH7UF8nITu047DVpGAf8z3z7we3TqbpCPi5QN/LKPdWHICQXj9sZPrjj0qYagg+PYUWeDJ3OHKRp1YUvCWXe/aGYP+TT6526cl3qESsI/uqlt4+LVNM1fKw6mQYoYwrwAO3+WKJzhRRUknST8=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmb+yr9jE40x/9/ePQgBFeLLFyAicF0SnXUV4lmwJDd75fHf4qwbRwGvC6XNgHy1//f2dTDwgZysgs3HI2VIe5lhzuRBDMORWpXdA7EEHkkmPcAWicytoWoSAfVNYvNyrSIps40XHJmgi/kjR2G7Oythf4iFE81VVG0VdDFxkK6crw+NefIldC3pzTOQUvAS/GN1LVI25qaCe26Fl1JPoZJih0GzMhELgd9XVdCjo+eB8NQ6f+f6ELcst4WR+UQNiAr+LX0G85xjETM/AbGKWxjqfIdsUeuRTA3zGPAiORQHMNayLdnPkoKCAyKPXJ5ThqLtX1Es+AqS2PoScDnY6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/wMv/qONaoxlgBo6054qDgVarVsuFMsSoGIqnLCNB4=;
 b=aT4iwrS66jUVZXanedms5KgXSWNf92nvQpQowOZopmEzHsM3R99PV2nqLMm+anoeyY//Tuze5E9S/+wfNjc6XVPIWXGK3a4xRSkkAmbJWlcE3ulEx+6nVPRM9jMZ7SWttlI3qjGTYnlvFlcmX3dW47euktww2IMeTuTtUhidhG3VRppYcMayd/WxHx52pm4IUhEfkQlacaqI6G4diSGWHWegvFQGBl0vP3bF9reYqO3aqfT9siwQ6TAPW5lvu3QVRa6KiEWnQLYBXKVd9cDOVbaYqALB84btezKCBWVdA0Q5Z7RBwb0dBDDWyNpkaVxw/zceZXEbVXucc9xyzH2CHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/wMv/qONaoxlgBo6054qDgVarVsuFMsSoGIqnLCNB4=;
 b=Svuf7zJS6lu+4tSA2n6sSdmjmzeFnobeYWHX3aV2TYnAwxOOv4LL72UoqAzfE/o5mNBDyIoIABQ+pdAi72NIczCt6RKNDQA2zi/hvH4EtpnMU/6WCPtRa9aMyOhqX8AWlYXdP6wfhk9p7EVZ3Sa529FRA1mfuxgpED5UVUuaAGc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko <andr2000@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Artem
 Mygaiev <Artem_Mygaiev@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: Coding Style Review and Automation
Thread-Topic: Coding Style Review and Automation
Thread-Index: AQHbfAEPdB5iHtyhPUOv3RpqtR+ORbNBzx2AgAACc4CAAAXxgIAABO+A
Date: Tue, 11 Feb 2025 09:49:54 +0000
Message-ID: <904D5489-29C7-4377-B50C-CED2F13A7D35@arm.com>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <Z6sR87FrKcOhgEqX@macbook.local>
 <4677686F-97C4-4D35-A113-0D8A1C0BC328@arm.com>
 <Z6sY_YsjJ6rGi8zS@macbook.local>
In-Reply-To: <Z6sY_YsjJ6rGi8zS@macbook.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	VE1PR08MB5807:EE_|DU0PR08MB9346:EE_|DB3PEPF0000885E:EE_|AM9PR08MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: b529778f-51f2-4dde-37c5-08dd4a81776a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dzljcGNWMUxsY2tsKzlBSlRSNENvVzRtZCtiVmhwSHBoQndZd2xBbFQ5VTlF?=
 =?utf-8?B?QmkzT3REK3QxelVpWTJuWFkyQlA2cjVzK3l6N0lXaWFtQ0hFZ3FJeXZHSDNz?=
 =?utf-8?B?V3V5R2o0amNDcVIxc0htamgya1hzUVB0KzZXMjJaYW5ONEtiY1ExUUNjQUxI?=
 =?utf-8?B?M2FVN2pmb0c1WlhQY01vdzU4YmhiK2hvQ29QRHFHZGhnT0xxQXpFWHVXS0Rk?=
 =?utf-8?B?eWk1NHhQcEtIZjJoT0s2cDdPUnhUZEdWK2Q0SkgxaW1yN2tybGdpc3p1Z0Js?=
 =?utf-8?B?Ujl1VW5zVzZuc2llTkJZQUF2V2xNVGhnVlE2d0FWN1E0emhmYlFFNVFZaU9S?=
 =?utf-8?B?OWxQS0V0VTNlSTlTbmpmRHdhQkdPYTM0YWFmZG41L1VnblFscGNTT3lMTlov?=
 =?utf-8?B?Y3FuLzZSd2pHRXFhVm9PdXVSUks5SExTOEZlWThlcWxXem5tYUpKVk5QR3dl?=
 =?utf-8?B?Zi9oZTU0dGc0Rk96KzdZd2t6NmR4VWVJcHVSNlJndTJ1UnpwcXFoTmhHakVD?=
 =?utf-8?B?VW91dEVibG5ZYm5aSWU3T0ZITnVIaG9iUzN3Z0U0OHhweWlUNVNyV3hNUkpn?=
 =?utf-8?B?b3ZpU3J3cXArWU50MS9JTU5lL0J1RnFzanFTMUtzczhnWmxzR0RkeW56V2RQ?=
 =?utf-8?B?R2k2Rk5BanhCVE14YUpsSWpxd0VrR0dpLy9GMWgrRU10d3NuUVVXSUNtOWVE?=
 =?utf-8?B?UEJPZll6SGE4T1lFQWY0Q3Y0WjZQVnBoNGtLd1hxWHJFUU9JNHZXYkd1Nm9a?=
 =?utf-8?B?bk9MVDZuOGlxYnFjNCsvNDBoOW9DY010UURUSFlKeDJRUGlZT0IyK3V0YjB4?=
 =?utf-8?B?SDBSYmpZSS9lSU1jbDdNeXJxY01UK2QwQldUdEpURXhxSVlxMWpmeXorZnM1?=
 =?utf-8?B?WTl6dHNBOEU4VG1pNEdzdzlWZlRJV2ZoU3R4dGsrR3hGaWJ6TjlCK050Z001?=
 =?utf-8?B?eGh4NDFLaUNraHJiSVFLeVI3ZUxncS8zZHdMYk1adXVWeEVNa1lJOGxuKzNC?=
 =?utf-8?B?YXZaU1lJdTVTNk9uQklrTEtxODllY3ZiRE1hK3ZMUml0MnJVeFg5REVZclBh?=
 =?utf-8?B?aDRLb1Z6QjZSUVIwZ0NUV1BaaXM3T3o4MEVCZEpPN2NybmZ3WHFXWU9UVUdP?=
 =?utf-8?B?QllXUk1VZ3hmaStQcUdRd1lUNUIzYktkR29WNTBPcjlFUUdmSXpFVW5jR05L?=
 =?utf-8?B?cklWUWpPWDZralFPNk1jMVlDZ1dMQzl3aWNJMnRCZUhheHNvSE1YWTUzNXlv?=
 =?utf-8?B?TTZtalZyK2RZYktiVUMvNUpLcHRMdjUrejloYmNtVXZDU1JnZ05oclAydEFZ?=
 =?utf-8?B?eWRMSkp2VTQ0WEVBT1FKVi9CQis4aWwvMkFOTzI5MUl4MnpZazByNFFEWmJu?=
 =?utf-8?B?bzI5SzhkV0cwcGg5VXE0R2ltenNpZTJVd1k2WXVjcExwZk5pOUxtTk1RWVBD?=
 =?utf-8?B?UDV4eVIwR25lM2VEeWk0UmlNNE12MC9ZdFpzZ2NRK3dKZHdOY3krdTFNbzFB?=
 =?utf-8?B?eVVGVDVsemFSN1Fnb3B5YzNXUFkzaFJzTHUrV3lNSjBhbisvUTYzVGdvSVRH?=
 =?utf-8?B?L245Nmg3OTN2T3ltdERFSHNMNHdIMjYxREMwKzFranVlZEJ3QWNhNDd1R3hQ?=
 =?utf-8?B?OFBWUVBKWkcxYkZNSFkyS0RQeFZJN2ZjTGN4cExZc1I3ZlZoYnlxZmlkaDRk?=
 =?utf-8?B?cjZ0V0IyeGFsY3E2UXZHWlo1Y3BncEQrUlJodDJHc2hpbzdvcWhUYTJ5Vjla?=
 =?utf-8?B?MFlXRzB1WENOU2NKYWVuTk9WSFd6ZGRlMmQwSno2TWo1RDI2V3VMT3hSbTdp?=
 =?utf-8?B?YnI2TWE3cktmZ1E3K1ExN2NMWVNuWC9lOVRQQ1pHSnZ5OTNNV2Y3RHhTcCt2?=
 =?utf-8?B?M1JyVURhUWNCbzB1RFhMTHdmNWVsejF1d1FMbzNPSkZUNjBnK3oyVC9OcXRw?=
 =?utf-8?Q?PrXO2rFajpI47Nt44uutdjnAtAAfBurL?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5807.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB32F13FC1777246BFE4BE2AB6A9E266@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9346
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:800:1b2::22];domain=VE1PR08MB5807.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	92d3353c-b252-4ed9-0c2d-08dd4a816ff5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|82310400026|36860700013|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnBCamVJTXpvSCt1WTdqYVdIRDNCVk1iSDlvR1JWS0wxWTFnajRUTzhjTk1q?=
 =?utf-8?B?blFCOURxMFVZcHlMVVQxZFlxZTZzNFNLOVNFQUN6RXlWOFF5cUFZQWlQeTl3?=
 =?utf-8?B?b3dESWxCRjNxZmlNSUk4ZFR3eU95ZVBFOVdZbmpxbTcvY3BreFB5KzdFV0RT?=
 =?utf-8?B?RU9GR2VpZzM4YlZhNmtpM20rdWp3ekFKVklJSzN0bmxJaUs3UXVraHZvTFg3?=
 =?utf-8?B?ajFNaG1IQnVZdjRBallYK1JHK0gxVk9rOU5wbmxUWFU3aGtNVGRyeHprNERU?=
 =?utf-8?B?VlU3NkdNSXk4aEdYeG5DSk83UEFVNXVnWDdESzE3cnBaWjBKeTRhYi9nb2Y2?=
 =?utf-8?B?UXZ5amxRejAxL00ya3Fjem5uRUk5a3MyRzg5bEIya0RiY3JPQytMZmFvdGJy?=
 =?utf-8?B?cDNNMFkwWDA1T2RVUkJoSm1GTm9sanZsdzZOdE8vRUF1bVo1b3pwOXVwdmxx?=
 =?utf-8?B?T0htczlQQXc2eGVhMGpmWkttWThsdzlJM2R6Q1JFcnZ5TFJFRDlsazVVS012?=
 =?utf-8?B?Rk4rK0FnRklJY04vbit1SXhLTTI2d2xxNVl1OEMzZmJTYnB3amNnUmR4NzVy?=
 =?utf-8?B?QmtBT0RESGlJZWdEdmJuc1duVG5ENXA4WnAyckcrREloNmh3Tkl2M1pQOGdT?=
 =?utf-8?B?RDhKN3c2M1BRcys2RlI4MTZzWVZqK0djZ1hCNmcwaGY5dXliZEhVamZCNzhz?=
 =?utf-8?B?elhrcjJ3WmFnd2g0elMyMmN2VWl1Y2s2ZTlRZXNrZXhQL0pBb29sbHMxUmFa?=
 =?utf-8?B?dFNaekhTK3Jpc0g5dDUwRThRR0dRd0FNT2RZYmFoNnZod2pHbGxkV2tTSm1K?=
 =?utf-8?B?WnNuMWhqUEJmbVBzYWl4ZHB2ZUoyRDlTYzNwa2dDSE5xSGdaUUJ5RjZGc0I0?=
 =?utf-8?B?eFVWTjBpR0dna1FGZkdhd2lQK25qT2tIY2RkK3VGbVlRaWNyMnBGcU92T0Fq?=
 =?utf-8?B?NFhCM3h2ZWx4UTNwYjVBT09WbllrRWtrK0JaeWEraVJIaEFpMGZRN0gzQ3dE?=
 =?utf-8?B?bjg3QjV0d240OTRFZlF5bkFOUnlLZm93Sk9ERGYveS8wM0ZaMnZJUC94T1Z3?=
 =?utf-8?B?WmdqYk00YTdDWWdTUEJ5MHcwbGsxbG43TGFnNVlnRXVFSTFXWXA4T1FOeFdH?=
 =?utf-8?B?Rktpek5HOHlLUDBWWTlaZlZWVGthd0MydjNDYlJqdGRNZ2ZBeUoxQU8xQVB6?=
 =?utf-8?B?RjR5UmhTOEtQUnY1ODFIS0FSazN3NTFCQUNBb3luQlNKQnFzYVI5K1JZMVVz?=
 =?utf-8?B?azMwMFVOYkFnUUJhZk0zelJXeG5leG94MU9DYTF3bitFcU9YVjh4MDQ3M3U2?=
 =?utf-8?B?L2RMVDBxWkl2UFFma01XMlVLaE1HRnVWUFlBb3lVWThsUkZ6V05jQlQ1UXIy?=
 =?utf-8?B?T2tkSy9lNG83MS9jem5NT1l6ODlKUXMxSmV0by9iZlB3VG9qU05rLzNkYWVH?=
 =?utf-8?B?TTI0azFwU1lkZXkzRzN3a0FaSU8wRlh3QTczTU5kR09nMjdUOXhnTmw2NkRt?=
 =?utf-8?B?RnozbnZyeGpZVFdmSnNhWFdJY2ZxY3pxNWxNYSt1UzdXMzZCSXhERjdWQldU?=
 =?utf-8?B?RVhEZWgrN1JBWXd2WThteUR1M2w2VzRBVGNVMDNKQzdzT2VyVlMyUXRYU01k?=
 =?utf-8?B?ZXlUTVhJd0ZpQmdKVFMvWFpFS0pSYnJFeGRNN0tiRk9Ba1ZVUk9hZnZQZGRa?=
 =?utf-8?B?aDRpeTRwYnR5UlB4N1FHcWlqM0pUN2REMEM2QXdWaWdwRFlsazdWazlQd3hH?=
 =?utf-8?B?U09QbzllQWFkblh3ZXZOSXdGUkFQT0M3bmhGL0NQV3NRZVlLQUt6TGo4aTRX?=
 =?utf-8?B?RzkzZ3JBM29hdXFRODdpSHVZTnRyTlh0SmZhejJWTHdQSzJMOGRhSjdrZnRu?=
 =?utf-8?B?ajFaZ3BRSzdrZ3BtODNBV3o0QU9HTVJZSDBoTyt3MzFCeTMzU1FHR1hNaVN1?=
 =?utf-8?B?ZEhxeWViK2VrTml2M3p1aUdZQ1krSnNwKzhmL05SbGtlK0wycTdpMEpiQlpv?=
 =?utf-8?Q?EYJ44CylBj1nm7IY7UbDfsJoe08AdY=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(82310400026)(36860700013)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 09:50:07.1008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b529778f-51f2-4dde-37c5-08dd4a81776a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6195

SGkgUm9nZXIsDQoNCj4+Pj4gDQo+Pj4+IDUpIFlvdSBuYW1lIGl0LiBJIHRoaW5rIG1hbnkgcGVv
cGxlIGluIHRoZSBjb21tdW5pdHkgY2FuIG5hbWUgdGhlaXIgcG9pbnRzIGZvcg0KPj4+PiBhbmQg
YWdhaW5zdCBjbGFuZy1mb3JtYXQuDQo+Pj4gDQo+Pj4gV2hhdCBhcmUgdGhlIHBhcnRzIG9mIG91
ciBjb2Rpbmcgc3R5bGUgdGhhdCBjbGFuZy1mb3JtYXQgY2Fubm90DQo+Pj4gY29ycmVjdGx5IHJl
cHJlc2VudD8gIENvdWxkIHlvdSBtYWtlIGEgbGlzdCBvZiB3aGF0IHdvdWxkIG5lZWQgdG8NCj4+
PiBjaGFuZ2UgaW4gWGVuIGNvZGluZyBzdHlsZSBmb3IgaXQgdG8gbWF0Y2ggcGVyZmVjdGx5IHdo
YXQgY2xhbmctZm9ybWF0DQo+Pj4gd2lsbCBjaGVjaz8NCj4+IA0KPj4gd2UgYWxyZWFkeSB3ZW50
IHRocm91Z2ggdGhhdCByb3V0ZSwgdGhlcmUgaXMgbm8gY2hlY2tlciBhbnl3aGVyZSB0aGF0IG1h
dGNoZXMNCj4+IHRoZSBYZW4gY29kaW5nIHN0eWxlIHBlcmZlY3RseSwgc28gaXTigJlzIGVpdGhl
ciB3ZSBjaGFuZ2UgdGhlIGNvZGluZyBzdHlsZSBvciB3ZQ0KPj4gZG9u4oCZdCBwcm9jZWVkIGZ1
cnRoZXIgd2l0aCBhbnkgYXV0b21hdGljIGNoZWNrDQo+IA0KPiBJJ20gcHJvYmFibHkgZmluZSB3
aXRoIGNoYW5naW5nIGNvZGluZyBzdHlsZSwgdGhhdCdzIHdoeSBJJ20gYXNraW5nDQo+IGZvciBh
IGxpc3Qgb2Ygd2hhdCBuZWVkcyB0byBiZSBjaGFuZ2VkICh1bmxlc3Mgd2Ugc3dpdGNoIHRvIGEN
Cj4gY29tcGxldGVseSBkaWZmZXJlbnQgY29kaW5nIHN0eWxlKS4NCg0KU3VyZSwgSSB0aGluayBs
aXN0aW5nIHRoZSBkaWZmZXJlbmNlcyBpcyBmaW5lLg0KDQo+IA0KPj4+IA0KPj4+IElkZWFsbHkg
dGhlIGZpcnN0IHN0ZXAgd291bGQgYmUgdG8gcHJlcGFyZSBhIHBhdGNoIHRvIGFkanVzdCB0aGUN
Cj4+PiBjb2Rpbmcgc3R5bGUgc28gaXQncyBpbiBsaW5lIHdpdGggd2hhdCBjbGFuZy1mb3JtYXQg
d2lsbCBkby4NCj4+IA0KPj4gSXTigJlzIGVhc3kgdG8gc2F5IHRoYXQsIGJ1dCBkaWZmaWN1bHQg
dG8gaW1wbGVtZW50LCBpZiB3ZSBjb3VsZCBhY2NlcHQgdGhlIGNsYW5nLWZvcm1hdA0KPj4gcnVs
ZXMgaXQgd291bGQgYmUgZWFzaWVyIHRvIGFkb3B0IHRoZSBjb25maWd1cmF0aW9uIGl0c2VsZiBh
cyBjb2Rpbmcgc3R5bGUsIG1heWJlDQo+PiBlbmhhbmNlZCB3aXRoIHNvbWUgY29tbWVudHMuDQo+
IA0KPiBJJ20ga2luZCBvZiBsb3N0LCB3aHkgaXMgaXQgZGlmZmljdWx0IHRvIGltcGxlbWVudD8g
IFdoYXQgSSdtIGFza2luZw0KPiBmb3IgaXMgYSBwYXRjaCB0byBDT0RJTkdfU1RZTEUgdGhhdCBt
b2RpZmllcyBpdCBpbiBhIHdheSB0aGF0IHdlIGNvdWxkDQo+IHVzZSBjbGFuZy1mb3JtYXQuICBJ
biBhbnkgY2FzZSB3ZSBuZWVkIHRvIGRvIHRoYXQgaWYgd2Ugd2FudCB0byB1c2UNCj4gY2xhbmct
Zm9ybWF0Lg0KDQpDaGFuZ2VzIHRvIHRoZSBDT0RJTkdfU1RZTEUgYXJlIGhpc3RvcmljYWxseSBk
aWZmaWN1bHQsIGdpdmVuIHRoYXQgdGhlIG5hdHVyYWwNCmxhbmd1YWdlIGlzIHByb25lIHRvIGlu
dGVycHJldGF0aW9uLiBJ4oCZbSBub3Qgb3Bwb3NpbmcgdG8gdGhhdCwgSeKAmW0ganVzdCBwb2lu
dGluZyBvdXQgdGhhdA0Kc3RhcnRpbmcgY2hhbmdpbmcgdGhlIENPRElOR19TVFlMRSBpbiBvcmRl
ciB0byBhY2NlcHQgdGhlIGNsYW5nLWZvcm1hdCBmZWVscw0KbW9yZSByaXNreSBhbmQgdGltZSBj
b25zdW1pbmcgdGhhbiB0ZXN0aW5nIGNsYW5nLWZvcm1hdCBhbmQgbW9kaWZ5aW5nIHRoZQ0KQ09E
SU5HX1NUWUxFIGFjY29yZGluZ2x5Lg0KDQpBbnl3YXkgdGhlIHJlc3VsdGluZyBjbGFuZy1mb3Jt
YXQgd291bGQgaGF2ZSBvdXIgY29kaW5nIHN0eWxlIGZvciB3aGF0IGNhbiBiZSBjb3ZlcmVkDQpi
eSB0aGUgdG9vbCBhbmQgaGF2ZSBzb21ldGhpbmcgbmV3IGZvciB3aGF0IGl0IGNhbm5vdCBiZSBj
b3ZlcmVkLCBpdOKAmXMganVzdCB0aGF0IGF0IGxlYXN0DQp5b3UgaGF2ZSBhIHJlcHJvZHVjaWJs
ZSB3YXkgdGhhdCBjYW4gYmUgdGVzdGVkLg0KDQo+IA0KPiBPbmUgcXVlc3Rpb24gdGhhdCBzZWVt
cyB0byBoYXZlIGJlZW4gZHJvcHBlZCBmcm9tIG15IHByZXZpb3VzIGVtYWlsOg0KPiB3b3VsZCBp
dCBiZSBmZWFzaWJsZSB0byBhcHBseSB0aGUgdXBkYXRlZCBzdHlsZSB0byBuZXdseSBhZGRlZCBj
aHVua3MNCj4gb2YgY29kZSBvbmx5LCBidXQgbm90IHRvIHRoZSAodW5tb2RpZmllZCkgc3Vycm91
bmRpbmcgY29udGV4dD8NCg0KSSBkcm9wcGVkIHRoYXQgb25lIGZyb20gbXkgcmVwbHkgYmVjYXVz
ZSBJIGtub3cgdGhlcmUgYXJlIHRvb2xzIHRoYXQgZG8gdGhhdCwNCmJ1dCBJ4oCZdmUgbmV2ZXIg
aW52ZXN0aWdhdGVkLCBtYXliZSBPbGVrc2FuZHIgY291bGQgdHJ5IHRvIGhhdmUgYSBsb29rLg0K
DQpJ4oCZbSBub3Qgc3VyZSBpZiB0aGUgcmVzdWx0IHdvdWxkIGZlZWwgbW9yZSBsaWtlIGEgZnJh
bmtlbnN0ZWluLCBidXQgaXQgd291bGQgZm9yIHN1cmUNCmxpbWl0IHRoZSBjaHVybi4NCg0KQ2hl
ZXJzLA0KTHVjYQ==

