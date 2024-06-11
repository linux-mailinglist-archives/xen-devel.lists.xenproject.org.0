Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 724C8903C09
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 14:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738337.1145065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH0jU-0004L8-4X; Tue, 11 Jun 2024 12:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738337.1145065; Tue, 11 Jun 2024 12:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH0jU-0004J8-00; Tue, 11 Jun 2024 12:36:12 +0000
Received: by outflank-mailman (input) for mailman id 738337;
 Tue, 11 Jun 2024 12:36:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d3+M=NN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1sH0jR-0004Iz-Ug
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 12:36:10 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on20600.outbound.protection.outlook.com
 [2a01:111:f403:2602::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c563826-27ef-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 14:36:06 +0200 (CEST)
Received: from DBBPR09CA0035.eurprd09.prod.outlook.com (2603:10a6:10:d4::23)
 by PA4PR08MB5886.eurprd08.prod.outlook.com (2603:10a6:102:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 12:35:59 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:d4:cafe::c0) by DBBPR09CA0035.outlook.office365.com
 (2603:10a6:10:d4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.25 via Frontend
 Transport; Tue, 11 Jun 2024 12:35:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Tue, 11 Jun 2024 12:36:03 +0000
Received: ("Tessian outbound 5a0abdb578b5:v332");
 Tue, 11 Jun 2024 12:36:03 +0000
Received: from bffecf3a46c1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 483B029E-DFB4-4946-A6D8-C791C6DE8B5D.1; 
 Tue, 11 Jun 2024 12:35:52 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bffecf3a46c1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Jun 2024 12:35:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB8299.eurprd08.prod.outlook.com (2603:10a6:20b:56f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 12:35:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 12:35:44 +0000
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
X-Inumbo-ID: 2c563826-27ef-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mVwpRiw1Rd1ggeW2tUds8zcs1eNcgHxW82eRjcICLcBaJd4yxGydTBdfgdQbf1/T+vyaFM1i8VNKT9egSC76Zfk98puF+LHqr/WGZhFGrgpzqMoIrsK2JdHtYkDYWuoMiq7dEzZB69k7+EXVlfbVfOqQ7vX3+3ybSuRCWexTyN8fZS1bxUUweVgur630Haz+MtSW3/fVwmAmAhAr0Pqb3FdpOh8PEKdm0UbCjSfd6Sl9vm0wxz7c4uxbTi6ci/ZAcw1mQSKV7S5ts2cybcTsYu/duIL2YhBJJS/NdFcH05eA8Aq7e/VS334KC2BLqtQKKlIec7Ompptmmp4NfW/+yA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq2k33ssq0RsWs77F3gWkmHi5LZo8p3bDqy2F5s3s2w=;
 b=NDNNB1i/Zl9rw9jF66gQcyVOtolcNoRl3O9nZA6zXbi9bAnEAmABel2TAhU6kP0Uw0qAJlmRqc4l5tal/bCaqPgz1ew7cp3JFn1R3DLxS10bHbs7NndQMXnRQid6JRYJtBnit+jQjkyqHT4BRgrkcJVSPqhkpN+xYUxpn2X0V9aQyKzFLIEFuEFpx0XBo9+qFd6hmpqlgJeOVVl5QKbFN4GEyrbcxcL3YHoEbFZfxv3ziD36Qava862spKguFsmL2jCWqxFH6Ph44lm7mCybivXojTqJyJX86Yy189StXug9bPpY4rc3lVWsfrwLzhtffCu6g6hppPcQ7KG4JPsaAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq2k33ssq0RsWs77F3gWkmHi5LZo8p3bDqy2F5s3s2w=;
 b=JuLOFpaZy9gt+MHgwDbxWyJPE1M7cIrMDUuh360tlRuKm15W8RtQTG/0Of/EkBIjr5o5QPJJ/Ab6xposivmj58xdQrEFNNqkgUyluI6j4Lo4BD9g5Ndvt8Tyl/vfIDdfOM3nVA7hW6T2hLlXJALsqozNbdnSKznlJcOu1tad+H8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb45eb3c75c539e4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijoSzSz1Cw9KAbFPyWYRquqHyYtyuAXxVIE8a2FFL2+QHDJaqZ5Gh+sHcXD9FddDB39lkFeO4HU2m82ZNgTH6kqXNQROWAT8iiU27dfn+eQFDW4ItmcrC6X17DNwMCTWXbYbnRrUeFxHgtk07K9cORF/HtHLvqZ79N6pKZdBIV/rfVFAJMcFvwVBc4mY2jNWNRZFBX7DGJmSGkL7pyoa+xBVwPjPq2+pjqkFcDzJX33v9bCfBCvg1LGWZ7bh5Fn15oD51QSo2wjVH+4JziAJIbOdHZSiAKHPLs496WkFXD6qTkEKG1RJnc4D2+1e/fvXkfozGIflyKZuRUc/SALYDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq2k33ssq0RsWs77F3gWkmHi5LZo8p3bDqy2F5s3s2w=;
 b=H6mBWT6VNTGfKkvblwenk5S2H6OvvatusVCsk98tGNYOuaejTUjNYSR5O91a/8WqNRfs5BShnExU00EQd6CrTzF/i13cB4CHaPYI0YiRt/s6qV3mtphpShGRvGOlFHg7Wu+uqq2O7a3ZCrxGcGh8wd+lk6VI2a3VZ4tPryf2nseRTAXpL+0/rK5t3cHlvCyLClpl053lqV6jk5IacuD/2pNafkpBdD5jtuEG7/rTPCrpNtXnnoQdvri2jZz5SKUTemqmsYgQsDyk2XKYSRjQv5BXALN5gz9n5JcHSlFHdodHwUM/te8Va0UHxojLpEfzU0D2TIv3Tlc0YXiRQCyI2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq2k33ssq0RsWs77F3gWkmHi5LZo8p3bDqy2F5s3s2w=;
 b=JuLOFpaZy9gt+MHgwDbxWyJPE1M7cIrMDUuh360tlRuKm15W8RtQTG/0Of/EkBIjr5o5QPJJ/Ab6xposivmj58xdQrEFNNqkgUyluI6j4Lo4BD9g5Ndvt8Tyl/vfIDdfOM3nVA7hW6T2hLlXJALsqozNbdnSKznlJcOu1tad+H8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v4 0/7] Static shared memory followup v2 - pt2
Thread-Topic: [PATCH v4 0/7] Static shared memory followup v2 - pt2
Thread-Index: AQHarde1wBZMIqRdOku1vS0eoyuKdLHCnAmA
Date: Tue, 11 Jun 2024 12:35:44 +0000
Message-ID: <3DDAAFF7-5E43-4B92-9D6B-6D8AFBA8496F@arm.com>
References: <20240524124055.3871399-1-luca.fancellu@arm.com>
In-Reply-To: <20240524124055.3871399-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB8299:EE_|DU6PEPF0000B622:EE_|PA4PR08MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: a65a8f92-37e4-4246-a56c-08dc8a130eb4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OUVMVG40eE9GNytzNEJqS1U1QmpyTGdndG5zMjJvZWoweDBHZ1prU2ZlVHha?=
 =?utf-8?B?RC9iOUVZa1FUdjBDQ3ovcHBxaFN3emExRVVmZGxaWThaODZMSWJCRFhlTStv?=
 =?utf-8?B?aklWTXEzMjhhd1IyYmtyN09DeFpXSFpIOFVyUGpXQ0htNStzKzFidjltRGRL?=
 =?utf-8?B?VklSOHpDbFVvS2VCbVkyWWZsT0VzMW5pdzk0TlZPWnBFejRxWTlWVkZ0R1Yr?=
 =?utf-8?B?VkI2a1hGdlQyT0dBakhoWUdwUXFJM21aWWlUVjhLQW1sVXY4M2lnQzhpWTdq?=
 =?utf-8?B?S2pqM1ZmMUxaN3NjNWhoRmVnUzNLdE15WlVubldXZnZuVkcvVGRZVFllZG91?=
 =?utf-8?B?QnBzdkJpaGtXdk9DY2MzNy9aQzl6Smg0SmRjekRkSEh2TEtWeHVmL3JhRTZG?=
 =?utf-8?B?SXVhRUNQY2xMaWt1aStad3N3OUQyb0FOMmJ6cmRUdnlGT3JHMXhGNnFJNkVI?=
 =?utf-8?B?VVZFc3NFY2NVVEhtRnE2L2ZtWkFNaDlXdmdPRGdubTBsSDRFejZqaTY2ZXJn?=
 =?utf-8?B?L3pjSFliQ3hZaWNHaTBPUzgwd1hNaTc2MlJSbWlqVXJGc2hBLzlpZUpJa1Jx?=
 =?utf-8?B?R3dabk9KYTZQYmZBbnZtNnIzWENjczlXbHFVSG9ncnl3L1EzczQ4YWVZM21z?=
 =?utf-8?B?VnNkdHZHTEJPSnIvVThySFE3WnZqREtmVk1YU2FHcUVWNGpEMnNucVp2Skhj?=
 =?utf-8?B?Q3RCU3l1Z2lCbUZkdk01ZDMraFRFUG9XMmdBL0RDbWgyQkoydFBpSGFLQlBZ?=
 =?utf-8?B?Y0pnZ0ZMSWtiTVVybWdOYUN2NW1iVmErZjkwSGFvVHdBOU1lNXNyMC8vazhF?=
 =?utf-8?B?UXpDckw1aFdWVmJxcEZIMlRRNEwrTkRvMTN4ZWZJdnNyZmM0bEFTYVppN0xC?=
 =?utf-8?B?WUpqdWsrcjBTUDEwQVZiQmVtZU0rWUI5T2pmc2ZMMCtQa0N4UEpYT1BraHZN?=
 =?utf-8?B?Ynl5L0NRcCtKQ0RNOHhIcVptb3lyZFZpQ2poRmtQTzFyd2NhQ2I5WmdraFIv?=
 =?utf-8?B?bDAzWW1ST1lTdEo5NUNDZEJrK0xyeFZ3bStUb1kxNDJKYXF2ZmNoWTRrY2NU?=
 =?utf-8?B?enVucmlwdEJIUThxakMvZ2hOTzdTQXVlM0lySFFWcnVVd3RRdC9WK2E2bTM4?=
 =?utf-8?B?Y2Vxdnl5ZldJdWxNZHdqeTF4RmlDMG9JeXJEVTBnWVJaYVE3ZHUyZDZ0cHkv?=
 =?utf-8?B?WEJTWTZNVnlObVphTlRCYUZkcjJVamtPaVdYcmR6WUV5b0Y4Z2U4aHVrM3lR?=
 =?utf-8?B?MUM4UkxtL09XenBPLzJVYXduVEE1V01IN2J4QTAyTnFsTDJlbmZQeTVMeHpH?=
 =?utf-8?B?c1lDS08rRjVLbnlkb3pyOWRrZ005SUhXc0IwUnowUDJWbTg2RDB4VWFkaytl?=
 =?utf-8?B?enA3bWZVTks5MEJBdzR3NGFGMXFQTDhTWHRwUHZEdStPRit2YkJGVnNpQUhW?=
 =?utf-8?B?dmM0VDBDeDh2UCtNOE1iTzIyaDF1aFNJR1ZjNlE1amhnOUFUaUF3SERJc1p1?=
 =?utf-8?B?THdjcVRGcHp1UXArVGRBN2dNZmVlM2NLcUdFVmNoVm9YUm9vWGFvSDhhQmxY?=
 =?utf-8?B?dE1GQ05iWG1pd0NXWWJ4UFBiQ0hxWjdhSWd2d1kzUjhQSi9rbVZoam1KbXZa?=
 =?utf-8?B?Szc0SkIwdlVxMlFpblNmaE9RMnhjRVdTRmRhdVoxaDh1MkpKZkdOc3lkREVt?=
 =?utf-8?B?WWRXazVNOGtLcUcxeXlNamhtS2RzdUtOZVpMYVVxT0pRdGVHT2xLOUpNVk1V?=
 =?utf-8?B?SnI0Y1loZUpZRklrNWUxM1VsV0xYNkJqNEhPZXN3YVFkOWU2WW80emZLb2xJ?=
 =?utf-8?B?VnVnejFNNXgveFNxZlBuRE9Hd3JaUmdwc1FzR1RMTk9mRFNGc0pUTVd1Vmtw?=
 =?utf-8?Q?EQbyNP4OOhag0?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <50C5AE020BA5EA499D4268EAC3822111@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8299
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6274787a-5728-4a53-58b6-08dc8a130324
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|35042699013|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHBNUld6SHgxcUhmaWpweWVYaUhXa0FxOXZwTFo4Z01ac2NjeXJqd0hoYk84?=
 =?utf-8?B?ZFFmakkycnpqNURTdEExZHVRZWk2c2FoZ1psYzBLN0szYVZPa0ErM3JaS2Z2?=
 =?utf-8?B?Nmg3YkFmWXFZZ1ozZjYvNndWUFVjQnFEcWcycVFvTHN2ekpQT055RjhSbGVG?=
 =?utf-8?B?ak1BeVNOc3ZCcHhPS0xCR0xQZFRvbWNjeHBGaUlwdkNPZDJncFJRWlJZT29Z?=
 =?utf-8?B?REg2MEVvWmJpODROU2NlTUkvWFFqRHF0WGRDTUpvRmExSTluN3NmUU1McFgy?=
 =?utf-8?B?MXY3M1J6QktLM3BZYnNLVDc3SXFMN0sxajg3NWVPdWZFcmhyZGxHdlVWZGtV?=
 =?utf-8?B?UGsxTXlPVS9GVis4QW5oN0Z5Q0tNTTkycmI0Yzl2Wnd0ekR1WUdTY2lTci92?=
 =?utf-8?B?SDE1U3JsaXplYWZ5SE9wdW5GMERobXpVcGZKaWMrVE56anlhR2FYQWk0R1JW?=
 =?utf-8?B?YVZ5ZjFyVkxIQkxiaFVZU2gwQnFOVGE1Q0JYUDNoamhLdXArdHFhVm1OVWxH?=
 =?utf-8?B?MjVxTDdiam9TSmJBc0FIUkY1MHdCb012QmxuYm9mWUFodEpienMxUTRvQnA1?=
 =?utf-8?B?Z04zcll2K296Mm1kZTQ0cWtlczFwTUV3eXpvcWJEd3R3N0lJTTJETk9wWStJ?=
 =?utf-8?B?eDVEZGZpbm52WnpaOXdac0RVNFE3UW8rVW9CMTdoNDU1SzRZS042dUJKSTFS?=
 =?utf-8?B?YXljM0RHcEVXdVFoMUxveHRaMTA2UVl2MVJ0MGhiWHhGSHNndlNSQnlMek9L?=
 =?utf-8?B?Y01ZRzdpaUFvd1dnblp0RG5zK0puWVJxNWhnWFdDTVQ0a0w0REdUTWI2aEVk?=
 =?utf-8?B?SFMveXJpTkFjT2lBYm43b3NpTzFKRUNOay9Wc1ZXazFkZGI0dUhVUFJ0M2Y1?=
 =?utf-8?B?T1FhRWhWQWtvdVRQT3pXVkNLVnZsOUh2aUlsVVhqamJrVFl6UUM0aFVOT2xz?=
 =?utf-8?B?bzYyVjVkVWhaSEI2eEoxbUxTOXl6dEJ3SzYvRjcrbWdSU2ZmNGFtcmZZbjlh?=
 =?utf-8?B?TFJ3ZVkyYTJvMWtKL0wwTXhqYjNFRjNDVkRUZnEyS2ZTMmhsMFpEZUpRTUxD?=
 =?utf-8?B?dU5xYTJIZTJCNjZWSnA0U0lwbjRVNzVqUytqbXh6aGVaalk5QVRwVTBnN0RJ?=
 =?utf-8?B?WGhRdmE2Tll2dVB3bnlINklxbEk1UnR2a0dxNjhMaW8vRFdGcnkvM2RzK2Iw?=
 =?utf-8?B?cTFidGZ1VlVkRGpOVGVCRmc2MlVCbVlFSnlLQ29WczJNQkVXRUxUQTQ1WWxa?=
 =?utf-8?B?QUVQN0phOU5URm9Cb3YrWmhXT2xtQUdtMndUdHJLYkc5ZFZXRWRUTWFrU3R6?=
 =?utf-8?B?d3l3eXpxWnc3a3JyQVlYZWJ5Mk5Db016RDJCeHpVUmlKU1R4L2lRR09waU9x?=
 =?utf-8?B?c3JjTDdiS0VRMElnemdWS2szZjd1akZjSFlwcWU3QVgvUGlnRGw3bHQyMWRi?=
 =?utf-8?B?YkJWRlRXM1FtUWx5RG9CU0FXMHROaVRMT0V3YXJvRE1XMG9sK252SysrR3RK?=
 =?utf-8?B?K2xnWHQ1Z2VjUDloeW5wSis2bU5STjZuUFVPSkdCSkZNYXVSS2NPTDdrWkl5?=
 =?utf-8?B?cENjeGFRTE5TM1U4Tjc5Q2RlbFNOTkIxM2NISXkwRkRuN3VYSmhwU3lUZnJI?=
 =?utf-8?B?bURsV3ZTRHRMRURveEN5clkvaFdQdEs5RGtNWnE2YkFkQ0cyRkxzdTNtM0xT?=
 =?utf-8?B?dFpDWGFpYlNmYkc1aDVsV0F5Q2EwTHk0NHRqMzBLSTIwYlkyYkFWRll0Q05T?=
 =?utf-8?B?cGxnSUtEdTY1SjBQb3lNeEtsaFRHQlVJcFFPcnBDeDVQTjlvaW5MRnowSU9z?=
 =?utf-8?B?Vm1tbUUrN2poTWlpcGh0TWFGbEEwTVdrTlVoUUZnSU5FdGJCWk9vZlZ6YXJB?=
 =?utf-8?B?Qnh3UHBOUUQ3bklrM0lVNEVVZHEvbjhuOC9ETnlUUXptL3I5eDJaMTVneGJP?=
 =?utf-8?Q?EVJF4UsHMhw=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699013)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 12:36:03.5499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a65a8f92-37e4-4246-a56c-08dc8a130eb4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5886

KyBPbGVrc2lpDQoNCj4gT24gMjQgTWF5IDIwMjQsIGF0IDEzOjQwLCBMdWNhIEZhbmNlbGx1IDxM
dWNhLkZhbmNlbGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gVGhpcyBzZXJpZSBpcyBhIHBhcnRp
YWwgcmV3b3JrIG9mIHRoaXMgb3RoZXIgc2VyaWU6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvY292ZXIvMjAyMzEyMDYwOTA2MjMuMTkzMjI3NS0xLVBl
bm55LlpoZW5nQGFybS5jb20vDQo+IA0KPiBUaGUgb3JpZ2luYWwgc2VyaWUgaXMgYWRkcmVzc2lu
ZyBhbiBpc3N1ZSBvZiB0aGUgc3RhdGljIHNoYXJlZCBtZW1vcnkgZmVhdHVyZQ0KPiB0aGF0IGlt
cGFjdHMgdGhlIG1lbW9yeSBmb290cHJpbnQgb2Ygb3RoZXIgY29tcG9uZW50IHdoZW4gdGhlIGZl
YXR1cmUgaXMNCj4gZW5hYmxlZCwgYW5vdGhlciBpc3N1ZSBpbXBhY3RzIHRoZSBkZXZpY2UgdHJl
ZSBnZW5lcmF0aW9uIGZvciB0aGUgZ3Vlc3RzIHdoZW4NCj4gdGhlIGZlYXR1cmUgaXMgZW5hYmxl
ZCBhbmQgdXNlZCBhbmQgdGhlIGxhc3Qgb25lIGlzIGEgbWlzc2luZyBmZWF0dXJlIHRoYXQgaXMN
Cj4gdGhlIG9wdGlvbiB0byBoYXZlIGEgc3RhdGljIHNoYXJlZCBtZW1vcnkgcmVnaW9uIHRoYXQg
aXMgbm90IGZyb20gdGhlIGhvc3QNCj4gYWRkcmVzcyBzcGFjZS4NCj4gDQo+IFRoaXMgc2VyaWUg
aXMgaGFuZGxpbmcgc29tZSBjb21tZW50IG9uIHRoZSBvcmlnaW5hbCBzZXJpZSBhbmQgaXQgaXMg
c3BsaXR0aW5nDQo+IHRoZSByZXdvcmsgaW4gdHdvIHBhcnQsIHRoaXMgZmlyc3QgcGFydCBpcyBh
ZGRyZXNzaW5nIHRoZSBtZW1vcnkgZm9vdHByaW50IGlzc3VlDQo+IGFuZCB0aGUgZGV2aWNlIHRy
ZWUgZ2VuZXJhdGlvbiBhbmQgY3VycmVudGx5IGlzIGZ1bGx5IG1lcmdlZA0KPiAoaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9jb3Zlci8yMDI0MDQxODA3MzY1
Mi4zNjIyODI4LTEtbHVjYS5mYW5jZWxsdUBhcm0uY29tLyksDQo+IHRoaXMgc2VyaWUgaXMgYWRk
cmVzc2luZyB0aGUgc3RhdGljIHNoYXJlZCBtZW1vcnkgYWxsb2NhdGlvbiBmcm9tIHRoZSBYZW4g
aGVhcC4NCj4gDQo+IEx1Y2EgRmFuY2VsbHUgKDUpOg0KPiAgeGVuL2FybTogTG9va3VwIGJvb3Rp
bmZvIHNobSBiYW5rIGR1cmluZyB0aGUgbWFwcGluZw0KPiAgeGVuL2FybTogV3JhcCBzaGFyZWQg
bWVtb3J5IG1hcHBpbmcgY29kZSBpbiBvbmUgZnVuY3Rpb24NCj4gIHhlbi9hcm06IFBhcnNlIHhl
bixzaGFyZWQtbWVtIHdoZW4gaG9zdCBwaHlzIGFkZHJlc3MgaXMgbm90IHByb3ZpZGVkDQo+ICB4
ZW4vYXJtOiBSZXdvcmsgaGVhcCBwYWdlIGFsbG9jYXRpb24gb3V0c2lkZSBhbGxvY2F0ZV9iYW5r
X21lbW9yeQ0KPiAgeGVuL2FybTogSW1wbGVtZW50IHRoZSBsb2dpYyBmb3Igc3RhdGljIHNoYXJl
ZCBtZW1vcnkgZnJvbSBYZW4gaGVhcA0KPiANCj4gUGVubnkgWmhlbmcgKDIpOg0KPiAgeGVuL3Ay
bTogcHV0IHJlZmVyZW5jZSBmb3IgbGV2ZWwgMiBzdXBlcnBhZ2UNCj4gIHhlbi9kb2NzOiBEZXNj
cmliZSBzdGF0aWMgc2hhcmVkIG1lbW9yeSB3aGVuIGhvc3QgYWRkcmVzcyBpcyBub3QNCj4gICAg
cHJvdmlkZWQNCj4gDQo+IGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgICB8
ICA1MiArKy0NCj4geGVuL2FyY2gvYXJtL2FybTMyL21tdS9tbS5jICAgICAgICAgICAgIHwgIDEx
ICstDQo+IHhlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jICAgICAgICAgICB8ICAgNCArLQ0K
PiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgICAgICAgICAgICAgfCAgODQgKysrLS0NCj4g
eGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFpbl9idWlsZC5oIHwgICA5ICstDQo+IHhlbi9h
cmNoL2FybS9tbXUvcDJtLmMgICAgICAgICAgICAgICAgICB8ICA4MiArKystLQ0KPiB4ZW4vYXJj
aC9hcm0vc2V0dXAuYyAgICAgICAgICAgICAgICAgICAgfCAgMTQgKy0NCj4geGVuL2FyY2gvYXJt
L3N0YXRpYy1zaG1lbS5jICAgICAgICAgICAgIHwgNDMyICsrKysrKysrKysrKysrKysrLS0tLS0t
LQ0KPiA4IGZpbGVzIGNoYW5nZWQsIDUwMiBpbnNlcnRpb25zKCspLCAxODYgZGVsZXRpb25zKC0p
DQo+IA0KPiAtLSANCj4gMi4zNC4xDQo+IA0KPiANCg0KSGksDQoNCldlIHdvdWxkIGxpa2UgdGhp
cyBzZXJpZSB0byBiZSBpbiBYZW4gNC4xOSwgdGhlcmUgd2FzIGEgbWlzdW5kZXJzdGFuZGluZyBv
biBvdXIgc2lkZSBiZWNhdXNlIHdlIHRob3VnaHQNCnRoYXQgc2luY2UgdGhlIHNlcmllIHdhcyBz
ZW50IGJlZm9yZSB0aGUgbGFzdCBwb3N0aW5nIGRhdGUsIGl0IGNvdWxkIGhhdmUgYmVlbiBhIGNh
bmRpZGF0ZSBmb3IgbWVyZ2luZyBpbiB0aGUNCm5ldyByZWxlYXNlLCBpbnN0ZWFkIGFmdGVyIHNw
ZWFraW5nIHdpdGggSnVsaWVuIGFuZCBPbGVrc2lpIHdlIGFyZSBub3cgYXdhcmUgdGhhdCB3ZSBu
ZWVkIHRvIHByb3ZpZGUgYQ0KanVzdGlmaWNhdGlvbiBmb3IgaXRzIHByZXNlbmNlLg0KDQpQcm9z
IHRvIHRoaXMgc2VyaWUgaXMgdGhhdCB3ZSBhcmUgY2xvc2luZyB0aGUgY2lyY2xlIGZvciBzdGF0
aWMgc2hhcmVkIG1lbW9yeSwgYWxsb3dpbmcgaXQgdG8gdXNlIG1lbW9yeSBmcm9tDQp0aGUgaG9z
dCBvciBmcm9tIFhlbiwgaXQgaXMgYWxzbyBhIGZlYXR1cmUgdGhhdCBpcyBub3QgZW5hYmxlZCBi
eSBkZWZhdWx0LCBzbyBpdCBzaG91bGQgbm90IGNhdXNlIHRvbyBtdWNoDQpkaXNydXB0aW9uIGlu
IGNhc2Ugb2YgYW55IGJ1Z3MgdGhhdCBlc2NhcGVkIHRoZSByZXZpZXcsIGhvd2V2ZXIgd2XigJl2
ZSB0ZXN0ZWQgbWFueSBjb25maWd1cmF0aW9ucyBmb3IgdGhhdA0Kd2l0aC93aXRob3V0IGVuYWJs
aW5nIHRoZSBmZWF0dXJlIGlmIHRoYXQgY2FuIGJlIGFuIGFkZGl0aW9uYWwgdmFsdWUuDQoNCkNv
bnM6IHdlIGFyZSB0b3VjaGluZyBzb21lIGNvbW1vbiBjb2RlIHJlbGF0ZWQgdG8gcDJtLCBidXQg
YWxzbyB0aGVyZSB0aGUgaW1wYWN0IHNob3VsZCBiZSBtaW5pbWFsIGJlY2F1c2UNCnRoZSBuZXcg
Y29kZSBpcyBzdWJqZWN0IHRvIGwyIGZvcmVpZ24gbWFwcGluZyAodG8gYmUgY29uZmlybWVkIG1h
eWJlIGZyb20gYSBwMm0gZXhwZXJ0IGxpa2UgSnVsaWVuKS4NCg0KVGhlIGNvbW1lbnRzIG9uIHBh
dGNoIDMgb2YgdGhpcyBzZXJpZSBhcmUgYWRkcmVzc2VkIGJ5IHRoaXMgcGF0Y2g6DQpodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL3BhdGNoLzIwMjQwNTI4MTI1
NjAzLjI0Njc2NDAtMS1sdWNhLmZhbmNlbGx1QGFybS5jb20vDQpBbmQgdGhlIHNlcmllIGlzIGZ1
bGx5IHJldmlld2VkLg0KDQpTbyBvdXIgcmVxdWVzdCBpcyB0byBhbGxvdyB0aGlzIHNlcmllIGlu
IDQuMTksIE9sZWtzaWksIEFSTSBtYWludGFpbmVycywgZG8geW91IGFncmVlIG9uIHRoYXQ/DQoN
CkNoZWVycywNCkx1Y2ENCg0K

