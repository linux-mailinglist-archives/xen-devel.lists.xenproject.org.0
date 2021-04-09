Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24993599D9
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 11:52:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107713.205887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUnnb-0000FL-JM; Fri, 09 Apr 2021 09:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107713.205887; Fri, 09 Apr 2021 09:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUnnb-0000Ex-Fl; Fri, 09 Apr 2021 09:51:35 +0000
Received: by outflank-mailman (input) for mailman id 107713;
 Fri, 09 Apr 2021 09:51:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TN0Z=JG=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lUnna-0000Er-0v
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 09:51:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d959a7a7-a29b-4c5e-96d3-9726a91094b0;
 Fri, 09 Apr 2021 09:51:31 +0000 (UTC)
Received: from AM7PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:20b:110::30)
 by AM0PR08MB4497.eurprd08.prod.outlook.com (2603:10a6:208:146::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Fri, 9 Apr
 2021 09:51:29 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::57) by AM7PR04CA0020.outlook.office365.com
 (2603:10a6:20b:110::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Fri, 9 Apr 2021 09:51:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 09:51:28 +0000
Received: ("Tessian outbound 34291f7cb530:v90");
 Fri, 09 Apr 2021 09:51:28 +0000
Received: from e2b301df2a10.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7FF84257-55B2-4262-A77D-F58B479B7589.1; 
 Fri, 09 Apr 2021 09:51:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e2b301df2a10.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Apr 2021 09:51:17 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR0801MB1933.eurprd08.prod.outlook.com (2603:10a6:800:8d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 9 Apr
 2021 09:51:08 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c%6]) with mapi id 15.20.3999.034; Fri, 9 Apr 2021
 09:51:08 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0046.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:152::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27 via Frontend Transport; Fri, 9 Apr 2021 09:51:07 +0000
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
X-Inumbo-ID: d959a7a7-a29b-4c5e-96d3-9726a91094b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj/6L+2aLx5tVKXKPbhmg+6y+QPk6WRDdRAegL9fC3U=;
 b=fFI2IWyJ700JQUxHcjl9BkznRS/MhYDZdo5aDgLwDag+zs8aOQXnFvQSlFUtHuoLrZTlTWf3dB2aObzC9QfV2alNypGi3qLmtWcsrHgbljizzMR8JWlf6cOUoWvcB/oG2o4rX1TigQvNguuTvd4wLbOwkTrLk/G9sgi0iYlLntg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10a0c30e76f33e5e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5j771RZbzvLDwqbFKn+cKze7Yw7KcA+hsmGaYr4wEOfO1rnIH8hEKzlheVFWYNOzuBukzjssnunvga7DPIUvUYx858IC4jghqM/adFMgVxYmJmxjxQH6jLP4OimB12LnIL1p7Xsg6DrA7sYZ40G4g9sj5dr7FjIVhcPzu4jmAjFXQhVdCwLWwp/nkOA66hkcIVOYKrqoyVg2iEiDX3QDMpGaN0mZ/YE90RqHyJ7MbRiN4IriPYfQm477D5j9poE4sfA8il1fUJUTidQKTcvWcQBhLGxWrm7KHhFQsE3gLduq1l/h8z/+FFfJPotqnAbeIgU0Q5H99dEWrbKnlquLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj/6L+2aLx5tVKXKPbhmg+6y+QPk6WRDdRAegL9fC3U=;
 b=ScwcTb0E/pPNJuPya61axwfRJRoo3jknoaRIsZtARDCDDorcFc6/Vw1Atpq97ymSKyAOhDL91UkWJSCnvBk1fWli0BEb7zvwzidyoyePYg3IX4FODnQoVDdmYr8uGrwmEb9TQk2H/6a5plHAnqpcCsAbe4PFP+QiFmdtVZbpZTMXJ6iJhAb2pyquHjlh8Dk5swvsK/sJF+6Af01mbYHJ+M2a4E5UfmCrI8R2skFUAyYOVUZD2eBj4K1yQTLz4UGbPbdEFpPPGGu1D9xMlG1XT7ubaSdo24Xn1j7M7Mz2BrUnJntfOsuQ7E6NK7SuZOLhoaDNp6+san8xpAisgxdP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj/6L+2aLx5tVKXKPbhmg+6y+QPk6WRDdRAegL9fC3U=;
 b=fFI2IWyJ700JQUxHcjl9BkznRS/MhYDZdo5aDgLwDag+zs8aOQXnFvQSlFUtHuoLrZTlTWf3dB2aObzC9QfV2alNypGi3qLmtWcsrHgbljizzMR8JWlf6cOUoWvcB/oG2o4rX1TigQvNguuTvd4wLbOwkTrLk/G9sgi0iYlLntg=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v2 1/4] xen/arm: Move dom0 creation in domain_build.c
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <f6bca491-afdb-df20-c50e-af1c294db91b@xen.org>
Date: Fri, 9 Apr 2021 10:51:00 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FE296364-070D-43FA-B302-E2D998D0146B@arm.com>
References: <20210408094818.8173-1-luca.fancellu@arm.com>
 <20210408094818.8173-2-luca.fancellu@arm.com>
 <f6bca491-afdb-df20-c50e-af1c294db91b@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::15) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33e42a5a-aadd-42df-791e-08d8fb3d0c13
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1933:|AM0PR08MB4497:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4497A9A9FD4B04488D24322DE4739@AM0PR08MB4497.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nzaxmPK7Xws4orwbb+TSa09Jxu46UUbKzDeE7wmnHgfKeNJmhVpSo80xWH2/KYRi9hK3vQ3GHMAR5VNTRRS9rNHDxbrCSi140OCVJrBRa0vAjkkS5/pVNJlgvVvtrcRwshwSkKQzm3Ezztb23oq4AhSAnoh1pUsw2YnbRiQrwMOurEtb4TazEgW+JTF8eIdl68lwJzf7Pd0bYKwhrYhEJuJ2e1dCHalVTyC7l5DZD/4Xr3r8+Sdl8RB5wIL2DR0RgbhrsYTjndS3I/G//nFAgTySBbj9Jkte1HPSdSyzpfaYTjPBI8aXYDakidTJUodwyjXhqzOLcewTcp8+jxnhfF8SLjZACJ5IbqBqkmxzXOAlWizF2wEeUErUFTQTBnn/v00q+kfkVKTS677k73OZlJY6JWNxDQv7XJx/tPTWPbiReOEcACiPdlE4ABrH9Vm1iWJcW19ANjIt8KsQg7A/fGCmiBtBVnBmS4lFh+MZjwyPAR5iVi9VzbtZ5hjcLo4SwHcuUQKdLgzMcxFU5sQ7zEJGLQvHfE6bRGSpPkrW6JM3gXpSwPR3za0edhsP1gle3jG7Z9P2i56Y672Sh7PmCFUSbu0agwiyU8u5Rxsw5mm/myNkwhs+Qz6Qk2npiYQ/tIIWLvotgydxjsF4PnfsSxXUR/yPelZETltEFpsm/YIndG1nclo1NvV3oSI3ggp3JR4ky24jYdunFTrahWERYeLS6JxkQ77zH5i//qmq/y0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(44832011)(36756003)(66476007)(5660300002)(478600001)(66556008)(6916009)(83380400001)(38100700001)(66946007)(2906002)(2616005)(16526019)(956004)(26005)(186003)(4326008)(6666004)(6486002)(7696005)(38350700001)(52116002)(316002)(53546011)(33656002)(54906003)(86362001)(8936002)(8676002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?b2Z1M1BUR1luZ2Q2M1VrU0x3TXFzdDh6L2dsMVp3ZUJYUE1ZaFNQL3pJNDIz?=
 =?utf-8?B?Z3VDd3ZZeGE0QTRUN3RqeUw1bVJJZ1JUb2JQdUswdGt2UE5WdnppNWNvWHl6?=
 =?utf-8?B?RVV5RGVsU20wNWZuczA0dm5rcHgwQWpBd00wbE5QNGRFeUVBVnVIaU53VWFX?=
 =?utf-8?B?MFR1bFBxT3B5WDNQS1dBR2MyRXJYUEpBZWx4ZlhBU0VBcWlvaXZ0ZjdCR1Fv?=
 =?utf-8?B?Z0ZtRWp3cUR4S1BuM01JWnpxNTNaMEs4SjU0cUhuZ09sZThnVkZKVWNOSFR4?=
 =?utf-8?B?WCt0RThDajZwdzNmQVRRLy9YYVhlY0VZM3dFaG9BYVVJSEJCZ2dtN3ordkw3?=
 =?utf-8?B?aTFlb1JoNEJSWjBQb1BqTEtpN3NIQmpnUWVuSXNwVm9YdEZTd0l5bTU5MGcr?=
 =?utf-8?B?Q1RLRFk4UWo5T2RkK1dZc3NiY1lyUnovQkJWSGI4alFvUU9YSGFJUVF4azY2?=
 =?utf-8?B?NzZrandjNUljZmZxUTVjbWhmTkY2elVGc1JUT1ZtVTh1d1VOc0RBRXhjaVV4?=
 =?utf-8?B?dHFJVUlxeCtuTDcwYy9pdHd1OUllQVlPRE45Lzk3YVJJNmUwODNoNkU4REp1?=
 =?utf-8?B?dndhUy9qUzBIY00vT05haDRSLy9KT3plMm5FazZKdzRORE5rNGVmLzRSL01S?=
 =?utf-8?B?Mjk3NGp6ZlZlZlpPMFBTT2s5azNRWVgrTjBSMEhndnFiOTVhbU80RGppbGVP?=
 =?utf-8?B?OFN5YktsWjIrNnRLS0l5QXRNN0VkYnBFNTBZVWYvNjdBS0llc2FKczQxUWkz?=
 =?utf-8?B?V05EVnpMNDBOeTYwOCtMSkt6cVVlZisvbk1VUzhWVTN1bzljeTZPZXJuck1R?=
 =?utf-8?B?WGthdHVGcEFuTVd6emZrTWduN2oyOFF2RkNER1J4WFV3eDdhU0xkS0MyRHIz?=
 =?utf-8?B?WHZYbVZZanFrQkhVbGR3N01URzZ1cXlpRVV2ZjN0bjIwZTU2b2Z6UlIwNnN0?=
 =?utf-8?B?Y2VScnF1WVNOZTluSkYyTDJ3Y050QnhyL1U1a1RGSERhNHNhckxhTHN1R25n?=
 =?utf-8?B?WVN6TmdYbVlpeEU2Qlkxdmx0bDlPNEo5d3ZUYndIWkdoTHZibWgrS0xjZThz?=
 =?utf-8?B?emYvWkQ1eXRTeWlwVzQ5WG8zRUVqRmZPNjNKQVNRbVhFREFlcXozNTl3UUda?=
 =?utf-8?B?cFFEVW9sNmVqSUpaUWZ5MXJpNGFLSlQzKzR6WnZCU2VMOWtPN1RRM3hBV2Z5?=
 =?utf-8?B?Y00yRzJoVXVObytsbUF5SVdGMXUxVHNud1pQNnhSS0dHVCs3ZDM1QjVPQ0RQ?=
 =?utf-8?B?L3RwV1FTVERLVlUxeExyYlI4WkNHZU1uTzR4ekF5OG43UFBCNEdYYzZTMGNx?=
 =?utf-8?B?RDZSR2VEdDFCK3BDa01lbFNVc1pyZHlRRTF4WkQ0ZEx3NW1ZVTFadlJoNmtY?=
 =?utf-8?B?UUlHWHdTZ2ZDV001TWpvcndQMThWV1dYeEhjd1V1U01xVkpBenJMa0JUR2RP?=
 =?utf-8?B?dlZTc3pPTkdhQ0tERkExa3kvUkxjeGc5QjhHdUNsZkxpdzlqblZMaTFieUd3?=
 =?utf-8?B?NDdSaGF5MWcyemVGOFczWFJ3VlRKQUExQWx3dmlCNm9jdkpmWjl3OURSSVp1?=
 =?utf-8?B?ajdtVXBBRU90VUdDY2ZMT01EQms4Y2tLK3F2M2xjSFR4TEFFNnhjYzRQYTEv?=
 =?utf-8?B?T3JkK2NXcytsODJoaTcwZ2ZhbkhyYlNmc1cxQXVzeFNjUlBoSG1SaWJwUmJD?=
 =?utf-8?B?Y1FqOVV2OG90czdUV3R4ODJQbVNYTjkrT1V4WU1POFNtbkxFaEJDRCtjMXZD?=
 =?utf-8?Q?5lwHcvLzsaVXBRayJYy6R2wSUPz47Xxx9oAQmsg?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1933
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	94cfce92-2137-4e91-a39c-08d8fb3cff98
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s6gnQyJzqysCQ5ulTI68FP6whImeALhRmGBWBBkWn49D1gxDiRgiScAEqGboCIHPM8+C+tsYzLBybkD8TuIZ2BTA1jmimtd899MeJ5DzIFkXhBuxqNXslA7xLxYrpySbG30AbLUvzAgRQLP6ghcHV5cNjXz54DZk6fH8VbeWyPe+7rnYjHl2Lgmq/exICu56m71tQKBumjyB8pLeRbmR07q3eT+TzmwUZv3RyqyEqnUeSN90I6bygdaCyNAZBskzkiv/5Cz38iYsOVJ33XGJbtv9ZVl4m46NQpZIZVRVHikHBPK/WgIeFxZyNjyEUr1xPtkJ84kLLQsKpr9KLafECyFXEDh72HF8ylsxDjXwnW3v98gc1xY6FUAYXap60beSQDlo65kCHT9kKb/rRmvNuCIj7Db0S6cPMBibu6iAjooEvFsfOK0I0zOpmbBURjiBGy08kt/Kb5/UaN8gR+fKGYF+0yHaiwlM5jCL3AnNJJUWegaQDvuM8xCGkK7SCKGXfeqDTwzGEvcgVKe5yYcgj8u6WHdbVeRhCz+FT3SFnuNqU/HLSKFLW6vBgaP0wM52ch1yr0Eug399ISNeBElNYdIJ8/ZjnZ5c4SBxOTMP2UBlU20JVZb3vITN8pk/5G6A8L/Ipsn2Njee5uxpu/a2vmGVLDqIeAdGhgpc0eUciFE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(36840700001)(46966006)(5660300002)(70586007)(356005)(70206006)(33656002)(47076005)(82740400003)(26005)(16526019)(107886003)(6486002)(7696005)(6862004)(36860700001)(83380400001)(54906003)(36756003)(8936002)(316002)(82310400003)(6666004)(44832011)(8676002)(336012)(4326008)(2616005)(2906002)(53546011)(956004)(81166007)(86362001)(186003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 09:51:28.6605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e42a5a-aadd-42df-791e-08d8fb3d0c13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4497



> On 9 Apr 2021, at 09:30, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 08/04/2021 10:48, Luca Fancellu wrote:
>> Move dom0 creation and start from setup.c to domain_build.c
>> on a dedicate function.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  xen/arch/arm/domain_build.c | 36 ++++++++++++++++++++++++++++++++++++
>>  xen/arch/arm/setup.c        | 29 +----------------------------
>>  xen/include/asm-arm/setup.h |  1 +
>>  3 files changed, 38 insertions(+), 28 deletions(-)
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 374bf655ee..d7c9c7f4d1 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -21,6 +21,7 @@
>>  #include <asm/device.h>
>>  #include <asm/kernel.h>
>>  #include <asm/setup.h>
>> +#include <asm/tee/tee.h>
>>  #include <asm/platform.h>
>>  #include <asm/psci.h>
>>  #include <asm/setup.h>
>> @@ -2520,6 +2521,41 @@ void __init create_domUs(void)
>>      }
>>  }
>>  +struct domain* __init create_dom0(void)
>> +{
>> +    struct domain *dom0;
>> +    struct xen_domctl_createdomain dom0_cfg =3D {
>> +        .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>> +        .max_evtchn_port =3D -1,
>> +        .max_grant_frames =3D gnttab_dom0_frames(),
>> +        .max_maptrack_frames =3D -1,
>> +    };
>> +
>> +    /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>> +    dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
>> +    /*
>> +     * Xen vGIC supports a maximum of 992 interrupt lines.
>> +     * 32 are substracted to cover local IRQs.
>> +     */
>> +    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int) 99=
2) - 32;
>> +    if ( gic_number_lines() > 992 )
>> +        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n"=
);
>> +    dom0_cfg.arch.tee_type =3D tee_get_type();
>> +    dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>> +
>> +    if ( iommu_enabled )
>> +        dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>> +
>> +    dom0 =3D domain_create(0, &dom0_cfg, true);
>> +    if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) =3D=3D NULL) )
>> +        panic("Error creating domain 0\n");
>> +
>> +    if ( construct_dom0(dom0) !=3D 0)
>> +        panic("Could not set up DOM0 guest OS\n");
>> +
>> +    return dom0;
>> +}
>> +
>=20
> I would move the function after...
>=20
>>  int __init construct_dom0(struct domain *d)
>=20
> ... this function so we can mark construct_dom0() static as create_dom0()=
 is the only caller.

Yes, I=E2=80=99ll modify it in the v3.

Cheers,
Luca

>=20
>>  {
>>      struct kernel_info kinfo =3D {};
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 2532ec9739..b405f58996 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -51,7 +51,6 @@
>>  #include <asm/platform.h>
>>  #include <asm/procinfo.h>
>>  #include <asm/setup.h>
>> -#include <asm/tee/tee.h>
>>  #include <xsm/xsm.h>
>>  #include <asm/acpi.h>
>>  @@ -805,12 +804,6 @@ void __init start_xen(unsigned long boot_phys_offs=
et,
>>      const char *cmdline;
>>      struct bootmodule *xen_bootmodule;
>>      struct domain *dom0;
>> -    struct xen_domctl_createdomain dom0_cfg =3D {
>> -        .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>> -        .max_evtchn_port =3D -1,
>> -        .max_grant_frames =3D gnttab_dom0_frames(),
>> -        .max_maptrack_frames =3D -1,
>> -    };
>>      int rc;
>>        dcache_line_bytes =3D read_dcache_line_bytes();
>> @@ -965,27 +958,7 @@ void __init start_xen(unsigned long boot_phys_offse=
t,
>>      enable_errata_workarounds();
>>        /* Create initial domain 0. */
>> -    /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>> -    dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
>> -    /*
>> -     * Xen vGIC supports a maximum of 992 interrupt lines.
>> -     * 32 are substracted to cover local IRQs.
>> -     */
>> -    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int) 99=
2) - 32;
>> -    if ( gic_number_lines() > 992 )
>> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n"=
);
>> -    dom0_cfg.arch.tee_type =3D tee_get_type();
>> -    dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>> -
>> -    if ( iommu_enabled )
>> -        dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>> -
>> -    dom0 =3D domain_create(0, &dom0_cfg, true);
>> -    if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) =3D=3D NULL) )
>> -        panic("Error creating domain 0\n");
>> -
>> -    if ( construct_dom0(dom0) !=3D 0)
>> -        panic("Could not set up DOM0 guest OS\n");
>> +    dom0 =3D create_dom0();
>>        heap_init_late();
>>  diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
>> index 28bf622aa1..e5f5c7ebc6 100644
>> --- a/xen/include/asm-arm/setup.h
>> +++ b/xen/include/asm-arm/setup.h
>> @@ -95,6 +95,7 @@ int acpi_make_efi_nodes(void *fdt, struct membank tbl_=
add[]);
>>    int construct_dom0(struct domain *d);
>>  void create_domUs(void);
>> +struct domain* create_dom0(void);
>>    void discard_initial_modules(void);
>>  void fw_unreserved_regions(paddr_t s, paddr_t e,
>=20
> Cheers,
>=20
> --=20
> Julien Grall


