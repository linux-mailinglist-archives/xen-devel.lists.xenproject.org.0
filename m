Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420198C9DA4
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 14:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726075.1130320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s92Nl-0007kP-9W; Mon, 20 May 2024 12:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726075.1130320; Mon, 20 May 2024 12:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s92Nl-0007iH-6J; Mon, 20 May 2024 12:44:49 +0000
Received: by outflank-mailman (input) for mailman id 726075;
 Mon, 20 May 2024 12:44:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2329=MX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s92Nj-0007iB-RH
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 12:44:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2613::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc21915f-16a6-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 14:44:45 +0200 (CEST)
Received: from AS4P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::13)
 by DU4PR08MB10983.eurprd08.prod.outlook.com (2603:10a6:10:570::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 12:44:41 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::c7) by AS4P191CA0022.outlook.office365.com
 (2603:10a6:20b:5d9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Mon, 20 May 2024 12:44:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7611.14
 via Frontend Transport; Mon, 20 May 2024 12:44:40 +0000
Received: ("Tessian outbound 85e363419cbe:v315");
 Mon, 20 May 2024 12:44:40 +0000
Received: from 280908b22e00.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24188BB8-684A-4B7D-9C90-63DA1DD54A31.1; 
 Mon, 20 May 2024 12:44:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 280908b22e00.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 May 2024 12:44:29 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GVXPR08MB10574.eurprd08.prod.outlook.com (2603:10a6:150:14d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 12:44:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 12:44:26 +0000
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
X-Inumbo-ID: bc21915f-16a6-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=a6y8fbZYiCOUvXhxbXdWr1XVlQsPIDmrzv97k9EiEYFrxJe0J4Fgj/KpwmA0YKEegBFb8O6fDaVpuwjMi5FTxGXJXk8or4Gx4/J9e6rx3PWRvr4GOxhf++hm/SNnn1zpHdsB4/aGS6bIQCA7juMTOdzBMmV1ZiS5ICP/porkRBosTJm48OLjbt0eHk4uC5wxozXZ/2DRiidSYzx5zNZ99EK4hCEundIROs0506wF05EuzUpk6KikvjnxkFG/9nECZB27WsJhHA6sHYYOVkeCTC4ZgIM7m3JVWlFo/f0Bh/JWm1aRDSUMSgnkygcyEwidFvJowXQ8fK2q/XCBp34hLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUVo4RFHYXH7qAZMy3ECxtKeGZ0y4iTDJ3FSuBnpHuo=;
 b=CT0oZYBxYlWmIVkBD7ytwGUnesexO5uWwG7xO+uCSAgDFISKM9vYBx7zWKx8nYpH99/Uola3TfMgjyU78PyQRPZTT14CIDuIsQ9BrXaW1YSdLtfzlNx/bs043ErT9hYEgaIyIWkhSxM5eBOKEfiGDdVizKdKmsHgmpD3FWztzCKgtKyiDYreW8aQLVuQzlgwfKtqgZ8bOibwHoUB40G8nNuJxZqTsUsUmOnIdbizq+1o5LnEfAda8uxbADz2sUdXyAmbC1MHIJnn4995XUMRe4Fy0V8oGseu26XnecBhK8HlreJe5JdpF2uVdPE8hpklsaf2F+jeZ9m5LFSCbVCOpA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUVo4RFHYXH7qAZMy3ECxtKeGZ0y4iTDJ3FSuBnpHuo=;
 b=m7SYazop0R2aprhDzjexhAaNoCZNqbJcGuZBwzpuwoyeGAg3den2vJKBQk1u6MNZ1vRl2ZS2e600vXG6h+pJuIH1t8tiGtwEYmqDfCYS2HR9pFGnD36u4w5ObLbOdIb0cjwe2tEfutLFEZTOlXz8AFF5qBFxrn24TN2Kn4OOMN4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8203847e01a4b48b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPYUyasNMx5xecrhXXHvhvnIbU4ahWX+rqQ/PE3NnkswH1PKc5O6ezmEhN6K07Bx9gs38HwOgrYnij0oTt+2AliOnzvDhR2LGfvGYlrogstcfTMN3ZgVNwrbo3WmitD1gB4RXysGaj+G4Q1rX8spaJn/cyU5cl42ON3dytnwFNb1fFmI0F/vRftAT5x2njHK8pKX7XTczBkzit9lAsl2qKskaUSRfdz2C1ixGf9azGwb0GZfONKMZQmeuMqIn3eLvs2Qk7FafOfjpYCVba6fO4A6iXrKQ/BCDXBrUssthBtU99jv6T0JIMkO0tiUBYPukK6KjSRLKYgyGcmJjkK7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUVo4RFHYXH7qAZMy3ECxtKeGZ0y4iTDJ3FSuBnpHuo=;
 b=RdiY2XmCBRqpFmCl9gSqQjfLyyvceYmEnHG3N/KnPQSObDEBdSjvh9t7LYnVol0KreA89CkLZYupR8+mnu/Jt5gMHsiLTTzeYDQBYVMtpWaQk403i7FMyW3kmCCmeDd1L8bJA7JI2moWPWZhZkwxiAbW1lS8O9Zju8ftp13GP7awYprh35zyc3q2O2InSpg292OEtNrpq/8ZEfpCrXB6OhCjRF7wJbxn9yBZ7UgWdtlZY+pbERpn9uNTRkAs+3LNLmGw/e3yoQm7HccpIfuAvY9KL2H/c1HHKknsLlJ1DP02eMoXgs4HnvfPDOrAa+xnWrkb/CjUMeq+ezVlB7auTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUVo4RFHYXH7qAZMy3ECxtKeGZ0y4iTDJ3FSuBnpHuo=;
 b=m7SYazop0R2aprhDzjexhAaNoCZNqbJcGuZBwzpuwoyeGAg3den2vJKBQk1u6MNZ1vRl2ZS2e600vXG6h+pJuIH1t8tiGtwEYmqDfCYS2HR9pFGnD36u4w5ObLbOdIb0cjwe2tEfutLFEZTOlXz8AFF5qBFxrn24TN2Kn4OOMN4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 6/7] xen/arm: Implement the logic for static shared
 memory from Xen heap
Thread-Topic: [PATCH v2 6/7] xen/arm: Implement the logic for static shared
 memory from Xen heap
Thread-Index: AQHaptP4l1WkDlPwC0KOp+ZDl+nOHbGgALAAgAAYgIA=
Date: Mon, 20 May 2024 12:44:26 +0000
Message-ID: <03C2DB73-2B91-4E74-9CBE-ACA21CDA0783@arm.com>
References: <20240515142626.3480640-1-luca.fancellu@arm.com>
 <20240515142626.3480640-7-luca.fancellu@arm.com>
 <cbe1fb4a-9c2b-48eb-acb0-6726aecdfe85@amd.com>
In-Reply-To: <cbe1fb4a-9c2b-48eb-acb0-6726aecdfe85@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GVXPR08MB10574:EE_|AMS0EPF000001B3:EE_|DU4PR08MB10983:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee7593a-0343-40d8-7b43-08dc78ca9dfe
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ME96NmZvNnpZeTA1OUFLdk13Q0owR0J4SHF3TjRMUnZhM3hQMkp4eDJlWGx2?=
 =?utf-8?B?OFRhUzBHUGdsRFdaMWFNUE96b1JhSG95UTk4ZHNDT213WUdYWUpoWHJYR2oy?=
 =?utf-8?B?MWE2ZjNVUDNJR08yUjQxT0lnZkptd01Vc1B3eE1XNHpqSFM3aG5pekRheDEw?=
 =?utf-8?B?T1VHbCtSRE4zMlJQSGhYTmttbk9EUndlSFAyY2U1dnV0RGRndVNVT1Y4S0M0?=
 =?utf-8?B?UDZEV3kwemUrNWVTWlRjalczUStwcEZVTm1VbW12U01UbXFOSWpHd2NhblVv?=
 =?utf-8?B?am9ZQVV1dDdpMzNYaGZUU05rT0tmL0N2UHZST2hUanRBVHRIMndDWnJIaUFt?=
 =?utf-8?B?SkNUMkZBWGRmZThZUUlFbmFLUy9UMFVjZHlCaGw5SzVNNzQyV3REVmQyb0Zp?=
 =?utf-8?B?SG0ycFJlaWZMTFRhb3VjcTN1TitsTHNqM1VpNVBIb201SXh1ZlVGSnlDbGw2?=
 =?utf-8?B?aldXcm9zUUtNdTF0THRpVGxQTTJtUkFpVnlINy9CM21waWJJVENRalpCRVlT?=
 =?utf-8?B?WFVEeGdDdnlxL0xJMTBFZUtCaTIvNUVtV01ZQzZUZFpaS2Y2Zzl0S2ZXeXIr?=
 =?utf-8?B?S2tPVFE2UER1Z252enpDZ0RBVTFTVi96YzZtOEM3YzJJaldUV1RYSDYyWmRY?=
 =?utf-8?B?NkNpaHpJYTR3bm9sZnIyK29tU3F1WXpuRmRTQkxIRzErTm9ITDY3aTZIRyt1?=
 =?utf-8?B?b01WVEM1S240MUkwVTFqS0dlYk0yNWRXZWVOMUtzd1hDRkMyd1g0TlY3Tjhh?=
 =?utf-8?B?Y3EwOFdYTE5MeEFXMFZTM0t5TTIxTmRqaTFHVXdYSCtVVWRhNEVXQ2ZYanc5?=
 =?utf-8?B?NGYrWDBNTWJ6akdqbGVTcGJqSHFWaGsyNDZUN2JGTytwRmw4c0ljMVJMYVlo?=
 =?utf-8?B?UkRTKzRxVUNqNjJIRGx4dTUyNlZvV3A3QnJnSW5aMWZUNjZDazRXTHUzNHNy?=
 =?utf-8?B?eVNZSkFEbllid09LUlB6UFYwbHpidUZ3YzJ6T3Z2WG45L1Z2WkpUR0E3SUpQ?=
 =?utf-8?B?M0tDV2lwSDEyL2lUV3hteU51eUZHbTBiVjZVWDdad21iakFRNDAvMlJlQ3J3?=
 =?utf-8?B?ZUhxOHJOdS9pNFhyQWd4WnhuYTI0Nk9PcnZZNmRrRkVsQzNZSFRpdTJsM3Q2?=
 =?utf-8?B?RFlFTzNWUUFZa2YxZGlYamFpU2x0SnVTenFaOHZTcmhUNUUzMHduenJVci9R?=
 =?utf-8?B?eFZWUGZwR01USnQwZFpLdUhsWE1MMFVrenRhai9tUVVJWHAwUnhuZXJWbTZE?=
 =?utf-8?B?ckF0N2lHd0ZvRUVmNGdwK045Y0k0NUlDdWdUOTE1dUlVZk95REQrVkpYSEhM?=
 =?utf-8?B?R3R6OWNZYzFMVC9VdWoyRTZpWllkK1NYWXpxdG5HUGV2K0dLYWxWV1piczBj?=
 =?utf-8?B?ZzloRDZsOTQzeEtHTU9waHE5bjM5MjFUWmZQNm9TQVBlZEZtdHVhTlp6YTJR?=
 =?utf-8?B?MndYVDA4ODZXbFBnTVczc3NpWkF0ZHBNaEUxWkMzRmw0OGNlVGhrR0dDVHAz?=
 =?utf-8?B?VTZMeklSbk9LOUhjRWg0Y1pEWWZ4aGNOVGFoS3FyencxR3loZEl6M1hQSzc5?=
 =?utf-8?B?YVR4ajlodmh2cjhReUE2NFhIc29aNTEyUFNpRDBaek5QRm9JUzlJQi9FWjdo?=
 =?utf-8?B?WW1IekJOK0tBRldhT3FiYXdIcnM0MjV2S3hQR2pVbGU4dlhEcTlZQ3RnZ09Z?=
 =?utf-8?B?aTEydGYwUG9Md2JjRHFGd256YUx2MHJ0eCsycC9CelBtU1hoMDlkMnRVNThm?=
 =?utf-8?B?RnE2SG52eDRYbGNjWU5BWmNhNTdlamliNXo4RTJ2bW9KaTUzc3hiWnhBSTdr?=
 =?utf-8?B?QWJXRmtrQjF4WEU2VGJIUT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4600DF257EBD3A4282B653F7AE6B0A4F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10574
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d01edcfc-30db-48a5-a978-08dc78ca954d
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|82310400017|35042699013|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnJob0FPVnQ0QjJ3Rll0NW9vcExha3FQdVhjQVVVMXdwYjBMcmhBSUEyd0p2?=
 =?utf-8?B?UTYwOThVOVpUQVJLKzByWU93WHQ5d0lnV0tEMHIxekEyaFhMeFAvbE5NZm1p?=
 =?utf-8?B?N0dVRFZ0K3JPd3hDQVFaUk1rUnA0bFI4L1FjSTNkQ2trUmR5bGNoTDJLZjNa?=
 =?utf-8?B?TkMrMnFjd0h5Z01rN2k4aWRNMCtBZGp5aFpnanZkYlJYcG9GUzN3OUE5OFVw?=
 =?utf-8?B?aXZCcFl5OG5UaFlvS0xrVVRPMXhGUk4yWFVrNFVmeHBMV09rek1NQmYySVpM?=
 =?utf-8?B?dk1wYnZyN1l2UEcwSFd2bFZnVElEZmlVMk1QbHRWVXNsQ3AxeTFNRHl4VC90?=
 =?utf-8?B?ODFGeUZCbkRpRnBLaFFuSjNSQnBJMW9ydXlISGUxZXByR1lsSHVuUVdBWitt?=
 =?utf-8?B?RDIwRVN5UlJwNVgzbmp4TXBtOFo4UnI5cnRPTWIyQVZYNWUvVE9BTCtIdy81?=
 =?utf-8?B?eDVSRkdLMTMvc1F1SlJTbC85azRPQWxjaHpTemo1OEticEFVZFJweFpTQ0ZU?=
 =?utf-8?B?UzdDanhZNmxCSHM5OXpyZHNCSnpCTU9yZzF3b08vY2FCd2RjLzNqaXBvUGRY?=
 =?utf-8?B?RFRGOEZxaGkrVENmd1o0NGpjK200ZTZBZlJjSXpHSys2ZldrVGpqM2x3NjhH?=
 =?utf-8?B?MlBKYWl1dWV5eGZ0Z0lLVmF0c0ZLdUduOXlzWU1YNkNrV21pS0FCYndhcExW?=
 =?utf-8?B?SUNVVzQ2R01VMDBDS3VLdGdBRjZUd3AwN24xVlh2VGdLT3NSWHV2U2NUdEV1?=
 =?utf-8?B?aXFDeTZYcUx0V21MYnhKU0RrbHhBN1I2SURuaUltUGhTbDIxdnpOWWJrRjRn?=
 =?utf-8?B?cnYyZEJ2MjBwNlJrOVprWlcwUkQ5VmloQ29CclJEN1JjTUZCRVc2L1F2b2Js?=
 =?utf-8?B?cytJK24zcTgybG5OZU9oMGxXTzZnTTMzakYrWU9kaFhxNEoyOEUxbEpIR1Qz?=
 =?utf-8?B?TlgweUlRc0ZCR3dNQWlWQ2FrN2pRL0l0bGRpL2FZSjFkMHBKYjViWVdRZi81?=
 =?utf-8?B?S2RyUjBSdmVha2dXQm9NbCtZM01EVUt3YWhWNFFMdEF0SmdxY3p6ZzFtNTNO?=
 =?utf-8?B?RUxhQXAvOVRKSVg2dlZnWTdWTGRvYXNWZXZaV3liU3d0QVV4R2lzUm1oQnZU?=
 =?utf-8?B?VWptcTUwRVN0ZjZTZStWR0tkdE5LWjd4U2FPNnA4WndMMWdNek9YdXp2MVRR?=
 =?utf-8?B?aHNoVHAyeFk3Q1QvWWMrVFd1YmxNVHhpY3JkOEJMbHl4QVJqRVk4NGIrWDJ6?=
 =?utf-8?B?c0RVbGYvck1xRC9NYU1PT3NucGRLdkY2alY3S1I5UTByNXh0cG52eDRzNzl5?=
 =?utf-8?B?cFNyZkNkTkxMRVY0OUdiWnhaUlFyTlFWMXpTZElsQlAvTm9WK2RsZVZad21p?=
 =?utf-8?B?Z251VzN6dElZbTdHckNISkJETEV6Mkp1ejQ3SzFTcnpwcXRzT3VOUnpkWkdU?=
 =?utf-8?B?RHhGaGFScWRJNlVhVm9UdHAyT2lsNytWTG42TlA0bGFQMU5lVEFidGx6MmJO?=
 =?utf-8?B?Yndnc3ZyeEhBU2tJUVVuYWRNK1Z6VjFBeGFGTW1HMS9pSHhoYVhUZHFuSWNX?=
 =?utf-8?B?SzByYmpLREt3WUJyL2ZKcVJTRDI0U3o0bGw4Mm5Gb0hUajlzbHN3NDBMbDl2?=
 =?utf-8?B?VFI2RkZza0dhdmVTK05WMTRxMTNsNjBKcG1zbkl6QVlmSTB0NGV2SGxBVGZZ?=
 =?utf-8?B?WUFMUDJTQ1JSZmRBWU1YUjdKeEdxeXlHdVVtSGxhMVMvWE1IekcyZnBXMk1Q?=
 =?utf-8?B?MDVPR1YzRU9aSlhOVjkzODFUSzFvNXk5RVZKMi9aMVB1YngzekpYSFA4cWQx?=
 =?utf-8?Q?Sv7sa+FVtz87DLbEVulcSoAugxrEiSbq4weZc=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400017)(35042699013)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 12:44:40.8414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee7593a-0343-40d8-7b43-08dc78ca9dfe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10983

SGkgTWljaGFsLA0KDQo+IE9uIDIwIE1heSAyMDI0LCBhdCAxMjoxNiwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMTUv
MDUvMjAyNCAxNjoyNiwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IA0KPj4gDQo+PiBUaGlzIGNv
bW1pdCBpbXBsZW1lbnRzIHRoZSBsb2dpYyB0byBoYXZlIHRoZSBzdGF0aWMgc2hhcmVkIG1lbW9y
eSBiYW5rcw0KPj4gZnJvbSB0aGUgWGVuIGhlYXAgaW5zdGVhZCBvZiBoYXZpbmcgdGhlIGhvc3Qg
cGh5c2ljYWwgYWRkcmVzcyBwYXNzZWQgZnJvbQ0KPj4gdGhlIHVzZXIuDQo+PiANCj4+IFdoZW4g
dGhlIGhvc3QgcGh5c2ljYWwgYWRkcmVzcyBpcyBub3Qgc3VwcGxpZWQsIHRoZSBwaHlzaWNhbCBt
ZW1vcnkgaXMNCj4+IHRha2VuIGZyb20gdGhlIFhlbiBoZWFwIHVzaW5nIGFsbG9jYXRlX2RvbWhl
YXBfbWVtb3J5LCB0aGUgYWxsb2NhdGlvbg0KPj4gbmVlZHMgdG8gb2NjdXIgYXQgdGhlIGZpcnN0
IGhhbmRsZWQgRFQgbm9kZSBhbmQgdGhlIGFsbG9jYXRlZCBiYW5rcw0KPj4gbmVlZCB0byBiZSBz
YXZlZCBzb21ld2hlcmUsIHNvIGludHJvZHVjZSB0aGUgJ3NobV9oZWFwX2JhbmtzJyBzdGF0aWMN
Cj4+IGdsb2JhbCB2YXJpYWJsZSBvZiB0eXBlICdzdHJ1Y3QgbWVtaW5mbycgdGhhdCB3aWxsIGhv
bGQgdGhlIGJhbmtzDQo+PiBhbGxvY2F0ZWQgZnJvbSB0aGUgaGVhcCwgaXRzIGZpZWxkIC5zaG1l
bV9leHRyYSB3aWxsIGJlIHVzZWQgdG8gcG9pbnQNCj4+IHRvIHRoZSBib290aW5mbyBzaGFyZWQg
bWVtb3J5IGJhbmtzIC5zaG1lbV9leHRyYSBzcGFjZSwgc28gdGhhdCB0aGVyZQ0KPj4gaXMgbm90
IGZ1cnRoZXIgYWxsb2NhdGlvbiBvZiBtZW1vcnkgYW5kIGV2ZXJ5IGJhbmsgaW4gc2htX2hlYXBf
YmFua3MNCj4+IGNhbiBiZSBzYWZlbHkgaWRlbnRpZmllZCBieSB0aGUgc2htX2lkIHRvIHJlY29u
c3RydWN0IGl0cyB0cmFjZWFiaWxpdHkNCj4+IGFuZCBpZiBpdCB3YXMgYWxsb2NhdGVkIG9yIG5v
dC4NCj4gTklUIGZvciB0aGUgZnV0dXJlOiBpdCdzIGJldHRlciB0byBzcGxpdCAxMCBsaW5lcyBs
b25nIHNlbnRlbmNlIGludG8gbXVsdGlwbGUgb25lcy4NCj4gT3RoZXJ3aXNlIGl0IHJlYWRzIGRp
ZmZpY3VsdC4NCg0KSeKAmWxsIGRvLA0KDQo+PiANCj4+IHhlbi9hcmNoL2FybS9zdGF0aWMtc2ht
ZW0uYyB8IDE4NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0NCj4+IDEgZmls
ZSBjaGFuZ2VkLCAxNTUgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc3RhdGljLXNobWVtLmMgYi94ZW4vYXJjaC9hcm0vc3Rh
dGljLXNobWVtLmMNCj4+IGluZGV4IGRkYWFjYmM3Nzc0MC4uOWMzYTgzMDQyZDhiIDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3N0YXRpYy1zaG1lbS5jDQo+PiArKysgYi94ZW4vYXJjaC9h
cm0vc3RhdGljLXNobWVtLmMNCj4+IEBAIC05LDYgKzksMjIgQEANCj4+ICNpbmNsdWRlIDxhc20v
c3RhdGljLW1lbW9yeS5oPg0KPj4gI2luY2x1ZGUgPGFzbS9zdGF0aWMtc2htZW0uaD4NCj4+IA0K
Pj4gK3R5cGVkZWYgc3RydWN0IHsNCj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZDsNCj4+ICsgICAg
cGFkZHJfdCBnYmFzZTsNCj4+ICsgICAgY29uc3QgY2hhciAqcm9sZV9zdHI7DQo+IFlvdSBjb3Vs
ZCBzd2FwIHJvbGVfc3RyIGFuZCBnYmFzZSB0byBhdm9pZCBhIDRCIGhvbGUgb24gYXJtMzINCg0K
U3VyZSBJIHdpbGwsDQoNCj4gDQo+PiArICAgIHN0cnVjdCBzaG1lbV9tZW1iYW5rX2V4dHJhICpi
YW5rX2V4dHJhX2luZm87DQo+PiArfSBhbGxvY19oZWFwX3BhZ2VzX2NiX2V4dHJhOw0KPj4gKw0K
Pj4gK3N0YXRpYyBzdHJ1Y3QgbWVtaW5mbyBfX2luaXRkYXRhIHNobV9oZWFwX2JhbmtzID0gew0K
Pj4gKyAgICAuY29tbW9uLm1heF9iYW5rcyA9IE5SX01FTV9CQU5LUw0KPiBEbyB3ZSBleHBlY3Qg
dGhhdCBtYW55IGJhbmtzPw0KDQpOb3QgcmVhbGx5LCBidXQgSSB3YXMgdHJ5aW5nIHRvIGRvbuKA
mXQgaW50cm9kdWNlIGFub3RoZXIgdHlwZSwgZG8geW91IHRoaW5rIGl04oCZcyBiZXR0ZXIgaW5z
dGVhZCB0bw0KaW50cm9kdWNlIGEgbmV3IHR5cGUgb25seSBoZXJlLCB3aXRoIGEgbG93ZXIgYW1v
dW50IG9mIGJhbmtzPw0KDQpCZWNhdXNlIGlmIHdlIHRha2Ugc3RydWN0IHNoYXJlZF9tZW1pbmZv
LCB3ZSB3b3VsZCB3YXN0ZSBtZW0gZm9yIGl0cyDigJhleHRyYeKAmSBtZW1iZXIuDQoNCj4+IA0K
Pj4gc3RhdGljIGludCBfX2luaXQgYXNzaWduX3NoYXJlZF9tZW1vcnkoc3RydWN0IGRvbWFpbiAq
ZCwgcGFkZHJfdCBnYmFzZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBib29sIGJhbmtfZnJvbV9oZWFwLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3Qgc3RydWN0IG1lbWJhbmsgKnNobV9iYW5rKQ0KPj4gew0KPj4gICAg
IG1mbl90IHNtZm47DQo+PiBAQCAtMTA5LDEwICsxMzgsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBh
c3NpZ25fc2hhcmVkX21lbW9yeShzdHJ1Y3QgZG9tYWluICpkLCBwYWRkcl90IGdiYXNlLA0KPj4g
ICAgIHBzaXplID0gc2htX2JhbmstPnNpemU7DQo+PiAgICAgbnJfYm9ycm93ZXJzID0gc2htX2Jh
bmstPnNobWVtX2V4dHJhLT5ucl9zaG1fYm9ycm93ZXJzOw0KPj4gDQo+PiAtICAgIHByaW50aygi
JXBkOiBhbGxvY2F0ZSBzdGF0aWMgc2hhcmVkIG1lbW9yeSBCQU5LICUjIlBSSXBhZGRyIi0lIyJQ
UklwYWRkciIuXG4iLA0KPj4gLSAgICAgICAgICAgZCwgcGJhc2UsIHBiYXNlICsgcHNpemUpOw0K
Pj4gLQ0KPj4gLSAgICBzbWZuID0gYWNxdWlyZV9zaGFyZWRfbWVtb3J5X2JhbmsoZCwgcGJhc2Us
IHBzaXplKTsNCj4+ICsgICAgc21mbiA9IGFjcXVpcmVfc2hhcmVkX21lbW9yeV9iYW5rKGQsIHBi
YXNlLCBwc2l6ZSwgYmFua19mcm9tX2hlYXApOw0KPj4gICAgIGlmICggbWZuX2VxKHNtZm4sIElO
VkFMSURfTUZOKSApDQo+PiAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gDQo+PiBAQCAtMTgz
LDYgKzIwOSw3IEBAIGFwcGVuZF9zaG1fYmFua190b19kb21haW4oc3RydWN0IGtlcm5lbF9pbmZv
ICpraW5mbywgcGFkZHJfdCBzdGFydCwNCj4+IA0KPj4gc3RhdGljIGludCBfX2luaXQgaGFuZGxl
X3NoYXJlZF9tZW1fYmFuayhzdHJ1Y3QgZG9tYWluICpkLCBwYWRkcl90IGdiYXNlLA0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpyb2xlX3N0
ciwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgYmFu
a19mcm9tX2hlYXAsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IHN0cnVjdCBtZW1iYW5rICpzaG1fYmFuaykNCj4+IHsNCj4+ICAgICBib29sIG93bmVy
X2RvbV9pbyA9IHRydWU7DQo+PiBAQCAtMTkyLDYgKzIxOSw5IEBAIHN0YXRpYyBpbnQgX19pbml0
IGhhbmRsZV9zaGFyZWRfbWVtX2Jhbmsoc3RydWN0IGRvbWFpbiAqZCwgcGFkZHJfdCBnYmFzZSwN
Cj4+ICAgICBwYmFzZSA9IHNobV9iYW5rLT5zdGFydDsNCj4+ICAgICBwc2l6ZSA9IHNobV9iYW5r
LT5zaXplOw0KPj4gDQo+PiArICAgIHByaW50aygiJXBkOiBTSE1FTSBtYXAgZnJvbSAlczogbXBo
eXMgMHglIlBSSXBhZGRyIiAtPiBncGh5cyAweCUiUFJJcGFkZHIiLCBzaXplIDB4JSJQUklwYWRk
ciJcbiIsDQo+PiArICAgICAgICAgICBkLCBiYW5rX2Zyb21faGVhcCA/ICJYZW4gaGVhcCIgOiAi
SG9zdCIsIHBiYXNlLCBnYmFzZSwgcHNpemUpOw0KPiBUaGlzIGxvb2tzIG1vcmUgbGlrZSBhIGRl
YnVnIHByaW50IHNpbmNlIEkgZG9uJ3QgZXhwZWN0IHVzZXIgdG8gd2FudCB0byBzZWUgYSBtYWNo
aW5lIGFkZHJlc3MuDQoNCnByaW50ayhYRU5MT0dfREVCVUcgPyANCg0KDQo+PiANCj4+IGludCBf
X2luaXQgcHJvY2Vzc19zaG0oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpr
aW5mbywNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGR0X2RldmljZV9u
b2RlICpub2RlKQ0KPj4gew0KPj4gQEAgLTI2NSwzNyArMzI5LDk3IEBAIGludCBfX2luaXQgcHJv
Y2Vzc19zaG0oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywNCj4+
ICAgICAgICAgcGJhc2UgPSBib290X3NobV9iYW5rLT5zdGFydDsNCj4+ICAgICAgICAgcHNpemUg
PSBib290X3NobV9iYW5rLT5zaXplOw0KPj4gDQo+PiAtICAgICAgICBpZiAoIElOVkFMSURfUEFE
RFIgPT0gcGJhc2UgKQ0KPj4gLSAgICAgICAgew0KPj4gLSAgICAgICAgICAgIHByaW50aygiJXBk
OiBob3N0IHBoeXNpY2FsIGFkZHJlc3MgbXVzdCBiZSBjaG9zZW4gYnkgdXNlcnMgYXQgdGhlIG1v
bWVudCIsIGQpOw0KPj4gLSAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gLSAgICAgICAg
fQ0KPj4gKyAgICAgICAgLyogInJvbGUiIHByb3BlcnR5IGlzIG9wdGlvbmFsICovDQo+PiArICAg
ICAgICBkdF9wcm9wZXJ0eV9yZWFkX3N0cmluZyhzaG1fbm9kZSwgInJvbGUiLCAmcm9sZV9zdHIp
Ow0KPiBUaGlzIGZ1bmN0aW9uIHJldHVybnMgYSB2YWx1ZSBidXQgeW91IHNlZW0gdG8gaWdub3Jl
IGl0DQoNClN1cmUsIEnigJlsbCBoYW5kbGUgdGhhdA0KDQo+PiANCj4+IC0gICAgICAgIHJldCA9
IGhhbmRsZV9zaGFyZWRfbWVtX2JhbmsoZCwgZ2Jhc2UsIHJvbGVfc3RyLCBib290X3NobV9iYW5r
KTsNCj4+IC0gICAgICAgIGlmICggcmV0ICkNCj4+IC0gICAgICAgICAgICByZXR1cm4gcmV0Ow0K
Pj4gKyAgICAgICAgICAgIGlmICggIWFsbG9jX2JhbmsgKQ0KPj4gKyAgICAgICAgICAgIHsNCj4+
ICsgICAgICAgICAgICAgICAgYWxsb2NfaGVhcF9wYWdlc19jYl9leHRyYSBjYl9hcmcgPSB7IGQs
IGdiYXNlLCByb2xlX3N0ciwNCj4+ICsgICAgICAgICAgICAgICAgICAgIGJvb3Rfc2htX2Jhbmst
PnNobWVtX2V4dHJhIH07DQo+PiArDQo+PiArICAgICAgICAgICAgICAgIC8qIHNobV9pZCBpZGVu
dGlmaWVkIGJhbmsgaXMgbm90IHlldCBhbGxvY2F0ZWQgKi8NCj4+ICsgICAgICAgICAgICAgICAg
aWYgKCAhYWxsb2NhdGVfZG9taGVhcF9tZW1vcnkoTlVMTCwgcHNpemUsIHNhdmVfbWFwX2hlYXBf
cGFnZXMsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZjYl9hcmcpICkNCj4+ICsgICAgICAgICAgICAgICAgew0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgcHJpbnRrKFhFTkxPR19FUlINCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFp
bGVkIHRvIGFsbG9jYXRlICglIlBSSXBhZGRyIk1CKSBwYWdlcyBhcyBzdGF0aWMgc2hhcmVkIG1l
bW9yeSBmcm9tIGhlYXBcbiIsDQo+IFdoeSBsaW1pdGluZyB0byBNQj8NCg0KSSB0aGluayBJIHVz
ZWQgaXQgZnJvbSBkb21haW5fYnVpbGQuYywgZG8geW91IHRoaW5rIGl04oCZcyBiZXR0ZXIgdG8g
bGltaXQgaXQgb24gS0IgaW5zdGVhZD8NCg0KPj4gDQo+PiArICAgICAgICAgICAgICAgIGZvciAo
IDsgYWxsb2NfYmFuayA8IGVuZF9iYW5rOyBhbGxvY19iYW5rKysgKQ0KPj4gKyAgICAgICAgICAg
ICAgICB7DQo+PiArICAgICAgICAgICAgICAgICAgICBpZiAoIHN0cm5jbXAoc2htX2lkLCBhbGxv
Y19iYW5rLT5zaG1lbV9leHRyYS0+c2htX2lkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE1BWF9TSE1fSURfTEVOR1RIKSAhPSAwICkNCj4gc2htX2lkIGhhcyBiZWVuIGFs
cmVhZHkgdmFsaWRhdGVkIGFib3ZlLCBoZW5jZSBubyBuZWVkIGZvciBhIHNhZmUgdmVyc2lvbiBv
ZiBzdHJjbXANCj4gDQoNCkkgYWx3YXlzIHRyeSB0byB1c2UgdGhlIHNhZmUgdmVyc2lvbiwgZXZl
biB3aGVuIHJlZHVuZGFudCwgSSBmZWVsIHRoYXQgaWYgc29tZW9uZSBpcyBjb3B5aW5nIHBhcnQg
b2YgdGhlIGNvZGUsDQphdCBsZWFzdCBpdCB3b3VsZCBjb3B5IGEgc2FmZSB2ZXJzaW9uLiBBbnl3
YXkgSSB3aWxsIGNoYW5nZSBpdCBpZiBpdOKAmXMgbm90IGRlc2lyYWJsZS4NCg0KQ2hlZXJzLA0K
THVjYQ0KDQoNCg==

