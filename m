Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE55E8D1641
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 10:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731034.1136338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBsDp-0007eD-4k; Tue, 28 May 2024 08:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731034.1136338; Tue, 28 May 2024 08:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBsDp-0007bF-1h; Tue, 28 May 2024 08:30:17 +0000
Received: by outflank-mailman (input) for mailman id 731034;
 Tue, 28 May 2024 08:30:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQ9m=M7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1sBsDn-0007b9-Bx
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 08:30:15 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260e::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80f85e68-1ccc-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 10:30:13 +0200 (CEST)
Received: from AS9PR06CA0488.eurprd06.prod.outlook.com (2603:10a6:20b:49b::14)
 by PA6PR08MB10594.eurprd08.prod.outlook.com (2603:10a6:102:3cd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 28 May
 2024 08:30:09 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:49b:cafe::10) by AS9PR06CA0488.outlook.office365.com
 (2603:10a6:20b:49b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Tue, 28 May 2024 08:30:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Tue, 28 May 2024 08:30:06 +0000
Received: ("Tessian outbound fffbb209f6c2:v327");
 Tue, 28 May 2024 08:30:06 +0000
Received: from 98b7a0e92509.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6DC9DC1-2FBA-4603-8956-3BE188D63193.1; 
 Tue, 28 May 2024 08:29:59 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98b7a0e92509.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 May 2024 08:29:59 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB7594.eurprd08.prod.outlook.com (2603:10a6:102:270::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 08:29:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 08:29:55 +0000
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
X-Inumbo-ID: 80f85e68-1ccc-11ef-90a1-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dLiDz2ODCF8zLR9Ju5g/3D5keVH5g6q4VFOS27mZs3wxDGnA8civ9qyTyfnOBGcsZXEZHFD0WqqhnIO2fRszrXrkWmXdUELhlDzdDJpJvATC+rekFy6CDLWgKQnuGCAIp4M50PTiDjj7iEn160KRNz8hfugsWTX0zqIqCz8+Tu5qU1t4oz8w6xMo7lJhGW2+Eh3S1DWRiZiLGf3pqqCHzYnLQ4tmXwYepJtq2RbrwigPMkQ4NsF2AH77+uNoppKkeCiySQLUouLHr+T86pHgqjioOE1HyQG2iZecpz8opMSl9c4mtubuH4SnrabblXChj+qUF4W+Sv1VinQTZls7wQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VOcNoNlr9GAIkTXpODPS2/BPKKMfCbMqMjV39EpSNY=;
 b=VEnG7OTTCNJgeZTVptpzZcEcbiDb0Zuxu+NPjqF+HSMvSJN0GhEj16HqPlxwDd3AnFJ9Kxi5cYse2IeP3Z288+pJ43UqdtLQmm4wakgaA+m0fw8sGR8KB6nkRz15My+vgqlwPMGesZY7qkItgfjm+RcINxusykpPn7BjPDTM4L0/6N3fzm1BWoLeHL3Fbp0lERE8DXDRwN3aZEf2DJf2UlmyQOmp+mB3r9BQpZHE+735BiqLhFCaH5f3GfCRtAQsng+gtoAbOA61YD1Qy1S1D/ls4RNhENccTXygQzxEHV+hWE+svBUJiDNzh+EaMWrP3gJT9rKQWUEloYJ9Gt46XA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VOcNoNlr9GAIkTXpODPS2/BPKKMfCbMqMjV39EpSNY=;
 b=WlE5mcWixwfs80CgBCPZPYjRywbpo0DPaIvI8ULuWpiAEe5RYXOwB2xP05Y2fhcP4OisVHRNuvGeje+SdsyelpLN684B9pX7RxErBEcQVTJKf72lkduNXCbO214mwxYjcu1bs+0hACNQSoEOPJMx3oohc0wNntYgAHHVUAf2Nrw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 254b4696c162d274
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFCJwbcePffJiGLnHGHoRXj1Xy5LAy58IiLWfiKkggaC3utWqv50fT2Bf+M8lJM2G4nQcqAN+gGH7Hxzx+XeTytxrxzosoX+CZwtg6wO5SbGKkqgeG62PyqB9GJ5WOCOgUzcHRjd1p1q9FWIIolwEuGhOs17qy9u5bcr1y8IGZYj6thN7jCjNpM6eurHptKnl7boFc8IE8XTXWsumhdqxhmZ+lWd6gATEvmGE7or3C9GB0OWnSC2Egja9i82sfnLwRigMGl0xpim54jhNU50BTcDsWSN1GwAauXlanlhV52pe127BMggfnj6OILlna+HmDpgQ8ruVlFrTJiBtwoqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VOcNoNlr9GAIkTXpODPS2/BPKKMfCbMqMjV39EpSNY=;
 b=ablMDDMXWswRaltQCxH9973/+TrQeFpi9ygWJdrCGWfe7fJ5AyJ0kgbNMtiHRxd0VAFduLM536gOa5s/XTGeN7yvw7+ACiMrdbBfzVxdl4mTFPJ4ZHXfQcs2QMHy553nNc2sLj/EMBu3R/0VU9tcKAuorPy2PH6NFYA9MciL8MiGhhtXxID4iEj01m2C1j/4vy1ItxAm7CgWr58uJYJ8/X2pUjCcbOKfviYThUwKVKYLFo3bJMq+c7h37WFfSSTay4hvYShDEDozCxH1U/i8PWA+afuaYghKtjno962TJtVL9+fEV7vQRlA/eHufIKyxfPUELq6WwQZKHRbCD9Z9kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VOcNoNlr9GAIkTXpODPS2/BPKKMfCbMqMjV39EpSNY=;
 b=WlE5mcWixwfs80CgBCPZPYjRywbpo0DPaIvI8ULuWpiAEe5RYXOwB2xP05Y2fhcP4OisVHRNuvGeje+SdsyelpLN684B9pX7RxErBEcQVTJKf72lkduNXCbO214mwxYjcu1bs+0hACNQSoEOPJMx3oohc0wNntYgAHHVUAf2Nrw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 3/7] xen/p2m: put reference for level 2 superpage
Thread-Topic: [PATCH v4 3/7] xen/p2m: put reference for level 2 superpage
Thread-Index: AQHarde5MtnBBoqXhEOFOHlm9nE79rGmV9OAgAX+4YA=
Date: Tue, 28 May 2024 08:29:55 +0000
Message-ID: <7E96D55F-2579-4409-8250-3FA905A15CCD@arm.com>
References: <20240524124055.3871399-1-luca.fancellu@arm.com>
 <20240524124055.3871399-4-luca.fancellu@arm.com>
 <30d78526-da89-4228-9cf4-e9792ed2468d@xen.org>
In-Reply-To: <30d78526-da89-4228-9cf4-e9792ed2468d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PA4PR08MB7594:EE_|AMS0EPF00000190:EE_|PA6PR08MB10594:EE_
X-MS-Office365-Filtering-Correlation-Id: 635e9a3d-569e-4112-25f0-08dc7ef0614e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?enVxNE96WFRqRkZwcFdGaFJ6VXM5aUxzV3d3dkd4Rmk0bHNXMzVFM2Y1aVZK?=
 =?utf-8?B?cU05T0QweFFhdnc3TEdvTm1NRVg3RytPMDI5ZFNTZ3dUOWU4N2JFeU5rQjds?=
 =?utf-8?B?RVBoVWlDMVpHU3JUSjVkRURHTWFJb2pJdDBBYnhsRVVVMWZhZktGdzc1NWZ1?=
 =?utf-8?B?RWhNRmcxb2taYytUNW9zTHQ3aWErZnBSVzJmQTNyZUNrSURqcElYZHpnMG9i?=
 =?utf-8?B?NUlXdEhLSW5JMk00VjNQaHpkajQxQkVBZVV0SVUwNm0rSUFBcjZMcUhBc2JL?=
 =?utf-8?B?K1czd3AxQ3Z6TkFaZWlBYVRlTDZ4bjkxSCtROStuNEl0UjFrWDhPQXQ1eUpk?=
 =?utf-8?B?c29wMnZDb2lFdGNuNHFqWXBEYTBJYnR0b0YzaWIrQlFDWFlWRHR4Zzk5eVpn?=
 =?utf-8?B?N09wSWw2TTdDR01QeERGOXdxZTBxOVI3Mld1VExiamd3UGs3d2FjODg4NG40?=
 =?utf-8?B?NGluQTZNTHQ2TDRyMjBYbUFndE5YR1AyK2h6V1R4UEFIUDQwMG1FUTB2bkRF?=
 =?utf-8?B?dXNVV0N0TkhNTFY1SEVDSGlxQTRhTEQ0b0dpbCtsbmVkMHNXbmxIbE5ic2dw?=
 =?utf-8?B?T0VxY2FkTkdzaEllcGl5aFdSSXp0WXFScVBuM3pwREtkc1FDUk1nN3lXUUMz?=
 =?utf-8?B?dWtReHpwd2NkSWoybTRvN293MXhSM3pWWlNiUk9xVm1MS29OUFFUWEZTZG54?=
 =?utf-8?B?dU9rbE9qdXptaUFyeDZLdXFqYUpCdTJCY3NhRUNoMTJDQkRUbWJQUk8xbVN1?=
 =?utf-8?B?SnBGbTdCZGpiR1dQV1lScnQzUE5NZU5lRzNzNUFnVVBWUW1NRTcrUGxQRjdi?=
 =?utf-8?B?SUhoaWVSRzN1MWpvYjZyNFkrZnh2ajRPZkdqck1qUGpNSzBTaVBydXdENFlL?=
 =?utf-8?B?cTIvS1YxRWs4R1d6UmphL2ZKRFNSbzlGa0kyc0IraDdqUVZvbWEva3FPNjJw?=
 =?utf-8?B?dkhmbDZ3MkdWMUd1ZjZ4bE5qU2l3K0RscXJ2MWF6dU90YThBOGtFYndsZ2FT?=
 =?utf-8?B?MlJPK1lBVTFkcVAxU2dweFd2T2pnNENuM2xCazF2S2hUcG04T3hnRCs1RzJP?=
 =?utf-8?B?V05rYkc3Qmc3N0k0RklxUUI4SVQwL1YvcXBBYTgrS3B2OHRnSjNjZWp6UDFB?=
 =?utf-8?B?OTIvdU15ekdVVXp4VXVtVFhIV0Y0bmx1eHV0aDgyZXFIOGFLRU9XaDgveWpG?=
 =?utf-8?B?NXdTSTNHQ05uKzB0bHQrN3hrcnBXWXJPOHhLZ094bjAvaEFHRGs2UEJEeWZ1?=
 =?utf-8?B?NlJGalAvWHNFbk1uZDVnSnNVeXMvYlJOcE1UanBjTGNpR0p4ZVVVTG9UWXVv?=
 =?utf-8?B?eUduQmp2UzlpeWRUajdQUUJWMFkvcHZsV0F5NC85S2lHelVrKzN5eUpIcy9U?=
 =?utf-8?B?dG9iQis3K2lUTXBmVFF5Q2FRTG9NV2hvRzFFcmdhYlU3SGltU3pZK3F4UFpz?=
 =?utf-8?B?UTlZZWNtNEZSK21xVnhCL29MQzJoU3lKdnNMTE9sNnQzQVVzc25JUVBOMmJD?=
 =?utf-8?B?RkZxZEVVd3pPaTVBcnQ4VGlyNkRnQWxMMUwwWnY5aDdlb0dpSnF6MUVYVlV1?=
 =?utf-8?B?T2ZzTitsdkovclR2ZWZSd0pxOWdPRjJPQXVKQjUrYVVpZXp3MlZ5NmlTdGp6?=
 =?utf-8?B?Z3BacktvU2UrdE8yWDdnQmRHRGlhMmVIYU5ONjAwR3RTbjh3QXlPOVBZWWRQ?=
 =?utf-8?B?ZENEWVRBakVnYjlzZjhUS1lUcGpMdU1HVWVjdU1MUElsVktnQVg2VWlnPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC81D2003622CE4F9BAA0D2B7E690EC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7594
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	38272fcd-9b4e-4e1b-e7e6-08dc7ef05a9a
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015|35042699013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEdLVlg3MjhBc3FaRDFPV25PT2FaTEpzQ1Vkd05ZWExjRFVtSW56b2tmOEdl?=
 =?utf-8?B?ODRwVjZud24vdXV2d0RRaUk4WXhrNCtuS09kb29EOW9HMUg4SjNGaUlBUE5w?=
 =?utf-8?B?ZG1GU3g2VnRZc0toOHBtRUFvVi9FSzJLNkU2Yy9zT2Fhb3hDTGpMaTRRNm5s?=
 =?utf-8?B?REx3eW1HL21hbGMrWnBVNmJaSFVCTzlXVkNkd2NqODBmOGVkQStNU0lhSFVo?=
 =?utf-8?B?TFFLQWJZNWROSVRxbkJCOU51UmVjVXBSLzNQNjgxZDNac0hiUjB5MGlnMmF5?=
 =?utf-8?B?c0EwdUY4b0Jwbi94ZGJ1cGUrbTBLcXpEcFhnVGlxaWlNdzYydzhuR1dpSk1D?=
 =?utf-8?B?cDBRVkRucVhIQzRTNFErQjZXOXk2akxjdnQvc0dWT011UTJlRGo2b2ZEbGhu?=
 =?utf-8?B?aEJ5ZE9LUFhQVUlLS1hiOVM2ajZkSVFzRlZUSVY0Nm1YQStZZXh0SkYvNzZV?=
 =?utf-8?B?SUhkTWxQSjVNM3c4T1BXQXl1TW4vVXJqc0RJNkRWWXZlZDVYM1pTZDVIekJP?=
 =?utf-8?B?K0JFeXh5dWlvc0w3T0k2dVNUSWcxbHpHMHB3UCtSa0F1NitNWmxML0FYUzVB?=
 =?utf-8?B?RXBIdUtzYXZTTU4xcjFHc1BpU3p6WWNYSEZaaVgxTk9JK1hTL0ZXU0ZlM2JB?=
 =?utf-8?B?KzNtejBvRUlYS1IwdFFDVzZaVlBuRG1pYVJ1V1h3cW5LOS9iSmFHVjZWY1VB?=
 =?utf-8?B?MzE0QXljNVRHTjV3ME5UUFQxNEl0WFlrT3RXTCtmZExrazJEY1ZuTzZaN3BW?=
 =?utf-8?B?N1lselNHeGh1eU5sa0d6Z3dtcGhqTDlTdVpxRmFhZVdTVTFubmh1OHFGSkFO?=
 =?utf-8?B?RHpCTlpTcytuaTZMcGZQV055cXVVWldLTzZyYXBmdHRGcFdtNjhSTUpWOHFM?=
 =?utf-8?B?WGNQYXlQVGNuTHc0QzVINEUzSmExQndobnV3K0lEU3lQOUN4QlRWN29uMFk2?=
 =?utf-8?B?alorelNhZVhiTHBvNzdTblhqUDNFd1ZTWjBUYnNXWkhrTVNWUUt5emZ2aGtF?=
 =?utf-8?B?V21MT3ZjazdxSFRYUTFaY2lSbG11Ri94QVRMZlg5QkFMbTVNSVdXUFFTUWp6?=
 =?utf-8?B?cGJJTjZrYVJkVTB0QjFlbzZKcjU0L2hvN3RTQUZaajllOG53RlF5YTlrK2Iw?=
 =?utf-8?B?K0x6SFZRU1g3TGE3dCt4UmtNWVVXWDBydGpqTGVLQzJuaWhMbGR6SjBEOSs1?=
 =?utf-8?B?R1FhSVVjN3NsQmxIMkh6R2c4S011ek5zY3RRUyt6OEpoVWV4ekwwckQ2dStV?=
 =?utf-8?B?SnJwYzN6dzRqRDczby95bmtDUlpBbmptTXN5aExJNjE0YUdpaVZyRi95UDEv?=
 =?utf-8?B?Z3RXOFJrN3BnZk9HdDZrTjRyc2tlVHBjL2h6SWRoaWFlaTFJK041N2Z3ZzhC?=
 =?utf-8?B?cy94YWNCeVI4Z3ZTYm9ORExuaVJwcEwxbUQ1cGNWVGdBdlo2RXNUT3pnMGUy?=
 =?utf-8?B?WmRKZUdKT3Q1b0pUS0Q4aElYMTNCS200elYvbnVsR2FBQWhWVlptY3BOWkwz?=
 =?utf-8?B?WjlUR1NieEdYV09KK0p1UE43WjBQdGI1eTFrTWdoQmVkTktvbjhPVkExYnpR?=
 =?utf-8?B?NWI0NFlpNVQzdzAxTElrSDQ0b2RUZ0tuQVpYcnBEUURZMmdDckQ1VCtaVlVF?=
 =?utf-8?B?WHEvWlJhMngrVjd3UGN6OVFuaFE4MFY4bGQ1NWllbHVCZWY3bFRDb1F5OUNu?=
 =?utf-8?B?ek1hd015dk9KQXRnRlRzVWZYZmNIa0tZTHBBcGgyQWVmTFZ6OGROZThmNWNT?=
 =?utf-8?Q?S4z+jdEUjAIxrpdCh7S4oTXM528vMbIDIEvjaIa?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 08:30:06.8592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 635e9a3d-569e-4112-25f0-08dc7ef0614e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10594

SGkgSnVsaWVuLA0KDQo+IE9uIDI0IE1heSAyMDI0LCBhdCAxMzo1NiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMjQvMDUvMjAy
NCAxMzo0MCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IEZyb206IFBlbm55IFpoZW5nIDxQZW5u
eS5aaGVuZ0Bhcm0uY29tPg0KPj4gV2UgYXJlIGRvaW5nIGZvcmVpZ24gbWVtb3J5IG1hcHBpbmcg
Zm9yIHN0YXRpYyBzaGFyZWQgbWVtb3J5LCBhbmQNCj4+IHRoZXJlIGlzIGEgZ3JlYXQgcG9zc2li
aWxpdHkgdGhhdCBpdCBjb3VsZCBiZSBzdXBlciBtYXBwZWQuDQo+PiBCdXQgdG9kYXksIHAybV9w
dXRfbDNfcGFnZSBjb3VsZCBub3QgaGFuZGxlIHN1cGVycGFnZXMuDQo+PiBUaGlzIGNvbW1pdHMg
aW1wbGVtZW50cyBhIG5ldyBmdW5jdGlvbiBwMm1fcHV0X2wyX3N1cGVycGFnZSB0byBoYW5kbGUN
Cj4+IDJNQiBzdXBlcnBhZ2VzLCBzcGVjaWZpY2FsbHkgZm9yIGhlbHBpbmcgcHV0IGV4dHJhIHJl
ZmVyZW5jZXMgZm9yDQo+PiBmb3JlaWduIHN1cGVycGFnZXMuDQo+PiBNb2RpZnkgcmVsaW5xdWlz
aF9wMm1fbWFwcGluZyBhcyB3ZWxsIHRvIHRha2UgaW50byBhY2NvdW50IHByZWVtcHRpb24NCj4+
IHdoZW4gdHlwZSBpcyBmb3JlaWduIG1lbW9yeSBhbmQgb3JkZXIgaXMgYWJvdmUgOSAoMk1CKS4N
Cj4+IEN1cnJlbnRseSAxR0Igc3VwZXJwYWdlcyBhcmUgbm90IGhhbmRsZWQgYmVjYXVzZSBYZW4g
aXMgbm90IHByZWVtcHRpYmxlDQo+PiBhbmQgdGhlcmVmb3JlIHNvbWUgd29yayBpcyBuZWVkZWQg
dG8gaGFuZGxlIHN1Y2ggc3VwZXJwYWdlcywgZm9yIHdoaWNoDQo+PiBhdCBzb21lIHBvaW50IFhl
biBtaWdodCBlbmQgdXAgZnJlZWluZyBtZW1vcnkgYW5kIHRoZXJlZm9yZSBmb3Igc3VjaCBhDQo+
PiBiaWcgbWFwcGluZyBpdCBjb3VsZCBlbmQgdXAgaW4gYSB2ZXJ5IGxvbmcgb3BlcmF0aW9uLg0K
Pj4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQo+PiAt
LS0NCj4+IHY0IGNoYW5nZXM6DQo+PiAgLSBvcHRpbWlzZWQgdGhlIHBhdGggdG8gY2FsbCBwdXRf
cGFnZSgpIG9uIHRoZSBmb3JlaWduIG1hcHBpbmcgYXMNCj4+ICAgIEp1bGllbiBzdWdnZXN0ZWQu
IEFkZCBhIGNvbW1lbnQgaW4gcDJtX3B1dF9sMl9zdXBlcnBhZ2UgdG8gc3RhdGUNCj4+ICAgIHRo
YXQgYW55IGNoYW5nZXMgbmVlZHMgdG8gdGFrZSBpbnRvIGFjY291bnQgc29tZSBjaGFuZ2UgaW4g
dGhlDQo+PiAgICByZWxpbnF1aXNoIGNvZGUuIChKdWxpZW4pDQo+PiB2MyBjaGFuZ2VzOg0KPj4g
IC0gQWRkIHJlYXNvbmluZyB3aHkgd2UgZG9uJ3Qgc3VwcG9ydCBub3cgMUdCIHN1cGVycGFnZSwg
cmVtb3ZlIGxldmVsX29yZGVyDQo+PiAgICB2YXJpYWJsZSBmcm9tIHAybV9wdXRfbDJfc3VwZXJw
YWdlLCB1cGRhdGUgVE9ETyBjb21tZW50IGluc2lkZQ0KPj4gICAgcDJtX2ZyZWVfZW50cnksIHVz
ZSBYRU5fUFRfTEVWRUxfT1JERVIoMikgaW5zdGVhZCBvZiB2YWx1ZSA5IGluc2lkZQ0KPj4gICAg
cmVsaW5xdWlzaF9wMm1fbWFwcGluZy4gKE1pY2hhbCkNCj4+IHYyOg0KPj4gIC0gRG8gbm90IGhh
bmRsZSAxR0Igc3VwZXIgcGFnZSBhcyB0aGVyZSBtaWdodCBiZSBzb21lIGlzc3VlIHdoZXJlDQo+
PiAgICBhIGxvdCBvZiBjYWxscyB0byBwdXRfcGFnZSguLi4pIG1pZ2h0IGJlIGlzc3VlZCB3aGlj
aCBjb3VsZCBsZWFkDQo+PiAgICB0byBmcmVlIG1lbW9yeSB0aGF0IGlzIGEgbG9uZyBvcGVyYXRp
b24uDQo+PiB2MToNCj4+ICAtIHBhdGNoIGZyb20gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L3hlbi1kZXZlbC9wYXRjaC8yMDIzMTIwNjA5MDYyMy4xOTMyMjc1LTktUGVubnku
WmhlbmdAYXJtLmNvbS8NCj4+IC0tLQ0KPj4gIHhlbi9hcmNoL2FybS9tbXUvcDJtLmMgfCA4MiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4+ICAxIGZpbGUgY2hh
bmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL21tdS9wMm0uYyBiL3hlbi9hcmNoL2FybS9tbXUvcDJtLmMNCj4+IGluZGV4
IDQxZmNjYTAxMWNmNC4uOTg2YzVhMDNjNTRiIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJt
L21tdS9wMm0uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL21tdS9wMm0uYw0KPj4gQEAgLTc1Mywz
NCArNzUzLDY2IEBAIHN0YXRpYyBpbnQgcDJtX21lbV9hY2Nlc3NfcmFkaXhfc2V0KHN0cnVjdCBw
Mm1fZG9tYWluICpwMm0sIGdmbl90IGdmbiwNCj4+ICAgICAgcmV0dXJuIHJjOw0KPj4gIH0NCj4+
ICAtLyoNCj4+IC0gKiBQdXQgYW55IHJlZmVyZW5jZXMgb24gdGhlIHNpbmdsZSA0SyBwYWdlIHJl
ZmVyZW5jZWQgYnkgcHRlLg0KPj4gLSAqIFRPRE86IEhhbmRsZSBzdXBlcnBhZ2VzLCBmb3Igbm93
IHdlIG9ubHkgdGFrZSBzcGVjaWFsIHJlZmVyZW5jZXMgZm9yIGxlYWYNCj4+IC0gKiBwYWdlcyAo
c3BlY2lmaWNhbGx5IGZvcmVpZ24gb25lcywgd2hpY2ggY2FuJ3QgYmUgc3VwZXIgbWFwcGVkIHRv
ZGF5KS4NCj4+IC0gKi8NCj4+IC1zdGF0aWMgdm9pZCBwMm1fcHV0X2wzX3BhZ2UoY29uc3QgbHBh
ZV90IHB0ZSkNCj4+ICtzdGF0aWMgdm9pZCBwMm1fcHV0X2ZvcmVpZ25fcGFnZShzdHJ1Y3QgcGFn
ZV9pbmZvICpwZykNCj4+ICB7DQo+PiAtICAgIG1mbl90IG1mbiA9IGxwYWVfZ2V0X21mbihwdGUp
Ow0KPj4gLQ0KPj4gLSAgICBBU1NFUlQocDJtX2lzX3ZhbGlkKHB0ZSkpOw0KPj4gLQ0KPj4gICAg
ICAvKg0KPj4gLSAgICAgKiBUT0RPOiBIYW5kbGUgb3RoZXIgcDJtIHR5cGVzDQo+PiAtICAgICAq
DQo+PiAgICAgICAqIEl0J3Mgc2FmZSB0byBkbyB0aGUgcHV0X3BhZ2UgaGVyZSBiZWNhdXNlIHBh
Z2VfYWxsb2Mgd2lsbA0KPj4gICAgICAgKiBmbHVzaCB0aGUgVExCcyBpZiB0aGUgcGFnZSBpcyBy
ZWFsbG9jYXRlZCBiZWZvcmUgdGhlIGVuZCBvZg0KPj4gICAgICAgKiB0aGlzIGxvb3AuDQo+PiAg
ICAgICAqLw0KPj4gLSAgICBpZiAoIHAybV9pc19mb3JlaWduKHB0ZS5wMm0udHlwZSkgKQ0KPj4g
KyAgICBwdXRfcGFnZShwZyk7DQo+PiArfQ0KPj4gKw0KPj4gKy8qIFB1dCBhbnkgcmVmZXJlbmNl
cyBvbiB0aGUgc2luZ2xlIDRLIHBhZ2UgcmVmZXJlbmNlZCBieSBtZm4uICovDQo+PiArc3RhdGlj
IHZvaWQgcDJtX3B1dF9sM19wYWdlKG1mbl90IG1mbiwgcDJtX3R5cGVfdCB0eXBlKQ0KPj4gK3sN
Cj4+ICsgICAgLyogVE9ETzogSGFuZGxlIG90aGVyIHAybSB0eXBlcyAqLw0KPj4gKyAgICBpZiAo
IHAybV9pc19mb3JlaWduKHR5cGUpICkNCj4+ICAgICAgew0KPj4gICAgICAgICAgQVNTRVJUKG1m
bl92YWxpZChtZm4pKTsNCj4+IC0gICAgICAgIHB1dF9wYWdlKG1mbl90b19wYWdlKG1mbikpOw0K
Pj4gKyAgICAgICAgcDJtX3B1dF9mb3JlaWduX3BhZ2UobWZuX3RvX3BhZ2UobWZuKSk7DQo+PiAg
ICAgIH0NCj4+ICAgICAgLyogRGV0ZWN0IHRoZSB4ZW5oZWFwIHBhZ2UgYW5kIG1hcmsgdGhlIHN0
b3JlZCBHRk4gYXMgaW52YWxpZC4gKi8NCj4+IC0gICAgZWxzZSBpZiAoIHAybV9pc19yYW0ocHRl
LnAybS50eXBlKSAmJiBpc194ZW5faGVhcF9tZm4obWZuKSApDQo+PiArICAgIGVsc2UgaWYgKCBw
Mm1faXNfcmFtKHR5cGUpICYmIGlzX3hlbl9oZWFwX21mbihtZm4pICkNCj4+ICAgICAgICAgIHBh
Z2Vfc2V0X3hlbmhlYXBfZ2ZuKG1mbl90b19wYWdlKG1mbiksIElOVkFMSURfR0ZOKTsNCj4+ICB9
DQo+PiAgKy8qIFB1dCBhbnkgcmVmZXJlbmNlcyBvbiB0aGUgc3VwZXJwYWdlIHJlZmVyZW5jZWQg
YnkgbWZuLiAqLw0KPj4gK3N0YXRpYyB2b2lkIHAybV9wdXRfbDJfc3VwZXJwYWdlKG1mbl90IG1m
biwgcDJtX3R5cGVfdCB0eXBlKQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7
DQo+PiArICAgIHVuc2lnbmVkIGludCBpOw0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBU
T0RPOiBIYW5kbGUgb3RoZXIgcDJtIHR5cGVzLCBidXQgYmUgYXdhcmUgdGhhdCBhbnkgY2hhbmdl
cyB0byBoYW5kbGUNCj4+ICsgICAgICogZGlmZmVyZW50IHR5cGVzIHNob3VsZCByZXF1aXJlIGFu
IHVwZGF0ZSBvbiB0aGUgcmVsaW5xdWlzaCBjb2RlIHRvIGhhbmRsZQ0KPj4gKyAgICAgKiBwcmVl
bXB0aW9uLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgaWYgKCAhcDJtX2lzX2ZvcmVpZ24odHlwZSkg
KQ0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKw0KPj4gKyAgICBBU1NFUlQobWZuX3ZhbGlkKG1m
bikpOw0KPj4gKw0KPj4gKyAgICBwZyA9IG1mbl90b19wYWdlKG1mbik7DQo+PiArDQo+PiArICAg
IGZvciAoIGkgPSAwOyBpIDwgWEVOX1BUX0xQQUVfRU5UUklFUzsgaSsrLCBwZysrICkNCj4+ICsg
ICAgICAgIHAybV9wdXRfZm9yZWlnbl9wYWdlKHBnKTsNCj4+ICt9DQo+PiArDQo+PiArLyogUHV0
IGFueSByZWZlcmVuY2VzIG9uIHRoZSBwYWdlIHJlZmVyZW5jZWQgYnkgcHRlLiAqLw0KPj4gK3N0
YXRpYyB2b2lkIHAybV9wdXRfcGFnZShjb25zdCBscGFlX3QgcHRlLCB1bnNpZ25lZCBpbnQgbGV2
ZWwpDQo+PiArew0KPj4gKyAgICBtZm5fdCBtZm4gPSBscGFlX2dldF9tZm4ocHRlKTsNCj4+ICsN
Cj4+ICsgICAgQVNTRVJUKHAybV9pc192YWxpZChwdGUpKTsNCj4+ICsNCj4+ICsgICAgLyogV2Ug
aGF2ZSBhIHNlY29uZCBsZXZlbCAyTSBzdXBlcnBhZ2UgKi8NCj4+ICsgICAgaWYgKCBwMm1faXNf
c3VwZXJwYWdlKHB0ZSwgbGV2ZWwpICYmIChsZXZlbCA9PSAyKSApDQo+IA0KPiBBRkFJQ1QsIHAy
bV9wdXRfcGFnZSgpIGNhbiBvbmx5IGJlIGNhbGxlZCBpZiB0aGUgcHRlIHBvaW50cyB0byBhIHN1
cGVycGFnZSBvciBwYWdlOg0KPiANCj4gICAgaWYgKCBwMm1faXNfc3VwZXJwYWdlKGVudHJ5LCBs
ZXZlbCkgfHwgKGxldmVsID09IDMpICkNCj4gICAgew0KPiAgICAgICAuLi4NCj4gICAgICAgcDJt
X3B1dF9wYWdlKCkNCj4gDQo+ICAgIH0NCj4gDQo+IFNvIGRvIHdlIGFjdHVhbGx5IG5lZWQgdG8g
Y2hlY2sgcDJtX2lzX3N1cGVycGFnZSgpPw0KPiANCj4+ICsgICAgICAgIHJldHVybiBwMm1fcHV0
X2wyX3N1cGVycGFnZShtZm4sIHB0ZS5wMm0udHlwZSk7DQo+PiArICAgIGVsc2UgaWYgKCBsZXZl
bCA9PSAzICkNCj4+ICsgICAgICAgIHJldHVybiBwMm1fcHV0X2wzX3BhZ2UobWZuLCBwdGUucDJt
LnR5cGUpOw0KPj4gK30NCj4+ICsNCj4+ICAvKiBGcmVlIGxwYWUgc3ViLXRyZWUgYmVoaW5kIGFu
IGVudHJ5ICovDQo+PiAgc3RhdGljIHZvaWQgcDJtX2ZyZWVfZW50cnkoc3RydWN0IHAybV9kb21h
aW4gKnAybSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBscGFlX3QgZW50cnksIHVu
c2lnbmVkIGludCBsZXZlbCkNCj4+IEBAIC04MDksOSArODQxLDE2IEBAIHN0YXRpYyB2b2lkIHAy
bV9mcmVlX2VudHJ5KHN0cnVjdCBwMm1fZG9tYWluICpwMm0sDQo+PiAgI2VuZGlmDQo+PiAgICAg
ICAgICAgIHAybS0+c3RhdHMubWFwcGluZ3NbbGV2ZWxdLS07DQo+PiAtICAgICAgICAvKiBOb3Ro
aW5nIHRvIGRvIGlmIHRoZSBlbnRyeSBpcyBhIHN1cGVyLXBhZ2UuICovDQo+PiAtICAgICAgICBp
ZiAoIGxldmVsID09IDMgKQ0KPj4gLSAgICAgICAgICAgIHAybV9wdXRfbDNfcGFnZShlbnRyeSk7
DQo+PiArICAgICAgICAvKg0KPj4gKyAgICAgICAgICogVE9ETzogQ3VycmVudGx5IHdlIGRvbid0
IGhhbmRsZSAxR0Igc3VwZXItcGFnZSwgWGVuIGlzIG5vdA0KPj4gKyAgICAgICAgICogcHJlZW1w
dGlibGUgYW5kIHRoZXJlZm9yZSBzb21lIHdvcmsgaXMgbmVlZGVkIHRvIGhhbmRsZSBzdWNoDQo+
PiArICAgICAgICAgKiBzdXBlcnBhZ2VzLCBmb3Igd2hpY2ggYXQgc29tZSBwb2ludCBYZW4gbWln
aHQgZW5kIHVwIGZyZWVpbmcgbWVtb3J5DQo+PiArICAgICAgICAgKiBhbmQgdGhlcmVmb3JlIGZv
ciBzdWNoIGEgYmlnIG1hcHBpbmcgaXQgY291bGQgZW5kIHVwIGluIGEgdmVyeSBsb25nDQo+PiAr
ICAgICAgICAgKiBvcGVyYXRpb24uDQo+PiArICAgICAgICAgKi8NCj4+ICsgICAgICAgIGlmICgg
bGV2ZWwgPj0gMiApDQo+IA0KPiBUaGUgY29kZSBpbiBwMm1fcHV0X3BhZ2UoKSBjYW4gcHJvcGVy
bHkgaGFuZGxlIGxldmVsIDEuIFNvIEkgd291bGQgcmF0aGVyIHByZWZlciBpZiB3ZSByZW1vdmUg
dGhpcyBjaGVjayAoYWdhaW4gaW4gb3JkZXIgdG8gcmVkdWNlIHRoZSBhbW91bnQgb2Ygd29yayBp
biB0aGUgUDJNIGNvZGUpLg0KPiANCj4gVGhpcyBUT0RPIGNvdWxkIGJlIG1vdmVkIHRoZXJlLg0K
PiANCj4+ICsgICAgICAgICAgICBwMm1fcHV0X3BhZ2UoZW50cnksIGxldmVsKTsNCj4+ICsNCj4+
ICAgICAgICAgIHJldHVybjsNCj4+ICAgICAgfQ0KPj4gIEBAIC0xNTU4LDkgKzE1OTcsMTIgQEAg
aW50IHJlbGlucXVpc2hfcDJtX21hcHBpbmcoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICAgICAgICAg
ICAgY291bnQrKzsNCj4+ICAgICAgICAgIC8qDQo+PiAtICAgICAgICAgKiBBcmJpdHJhcmlseSBw
cmVlbXB0IGV2ZXJ5IDUxMiBpdGVyYXRpb25zLg0KPj4gKyAgICAgICAgICogQXJiaXRyYXJpbHkg
cHJlZW1wdCBldmVyeSA1MTIgaXRlcmF0aW9ucyBvciB3aGVuIHR5cGUgaXMgZm9yZWlnbg0KPj4g
KyAgICAgICAgICogbWFwcGluZyBhbmQgdGhlIG9yZGVyIGlzIGFib3ZlIDkgKDJNQikuDQo+IA0K
PiBMZXQncyBhdm9pZCBtZW50aW9uaW5nIDJNQi4gVGhpcyBpcyBvbmx5IHZhbGlkIHdoZW4gdXNp
bmcgNEtCIHBhZ2VzLg0KPiANCj4gVGhpcyBpcyBhbHNvIHRhbGtpbmcgYWJvdXQgYSBzcGVjaWZp
YyB3aGVuIHRoZSBjb2RlIGJlbG93IGlzIG5vdCA0S0Igc3BlY2lmaWMuIEkgd291bGQgcmV3b3Jr
IGFueXRoaW5nIGFmdGVyIHRoZSAnb3InIHRvOg0KPiANCj4gJ3dlIGhhdmUgYSBsZXZlbC0yIGZv
cmVpZ24gbWFwcGluZycNCj4gDQo+IFRoZSByZXN0IG9mIHRoZSBMR1RNIHRvIG1lIGJ1dCBJIGRv
bid0IGZlZWwgY29uZm9ydGFibGUgdG8gZG8gYWxsIHRob3NlIGNoYW5nZXMgb24gY29tbWl0LiBT
byB0aGlzIHdpbGwgd2FudCBhIHJlc3Bpbi4NCj4gDQo+IEZvciBzaW1wbGljaXR5LCB5b3UgY2Fu
IG9ubHkgcmVzZW5kIHRoaXMgcGF0Y2guDQoNClRoYW5rcywgSeKAmWxsIGFkZHJlc3MgeW91ciBj
b21tZW50IGFuZCBwdXNoIHRoZSBuZXcgcGF0Y2ggYXNhcC4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

