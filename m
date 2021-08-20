Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA993F2495
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 04:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169159.309009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGtuB-0002Rs-1b; Fri, 20 Aug 2021 02:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169159.309009; Fri, 20 Aug 2021 02:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGtuA-0002PP-Uk; Fri, 20 Aug 2021 02:05:10 +0000
Received: by outflank-mailman (input) for mailman id 169159;
 Fri, 20 Aug 2021 02:05:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mGtu9-0002PJ-BA
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 02:05:09 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.46]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a8578b3-015b-11ec-a677-12813bfff9fa;
 Fri, 20 Aug 2021 02:05:07 +0000 (UTC)
Received: from AM5PR0701CA0062.eurprd07.prod.outlook.com (2603:10a6:203:2::24)
 by AM4PR08MB2627.eurprd08.prod.outlook.com (2603:10a6:205:b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Fri, 20 Aug
 2021 02:05:06 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::59) by AM5PR0701CA0062.outlook.office365.com
 (2603:10a6:203:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.6 via Frontend
 Transport; Fri, 20 Aug 2021 02:05:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 02:05:05 +0000
Received: ("Tessian outbound 32695b2df2f8:v103");
 Fri, 20 Aug 2021 02:05:05 +0000
Received: from 072df2a5339d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E5977902-DAD2-4D5E-8B78-242EDFA07DD7.1; 
 Fri, 20 Aug 2021 02:04:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 072df2a5339d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 02:04:54 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB4492.eurprd08.prod.outlook.com (2603:10a6:10:c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 02:04:51 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 02:04:51 +0000
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
X-Inumbo-ID: 0a8578b3-015b-11ec-a677-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Eu+NN1ekbn6jPCdBA8Sj4+6wqpe4yr5H2AHH3qZIB0=;
 b=6v4Qn5oy4+PGjnI6wZXIbjh2gcJgK0+Qtknvza8eGw9pQb3ipyV50JNMnY9vQVG80bjXAk1CTlZ7v6iehj+0LGL5M5dI/g1xVwS2YIp5UHhyVlnlASHDjZEuze4E80uykNaxBFp0yX3b91+RJJZvWT0M995sp9iAIjAF1mhFQJw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWaQHNA9jyMSXwYsAr/VpxVOkYakDHSmZdZ87FnkIwJp8CeV8FENcM5ViCeSYdu8o9U4h1lAyUWCZKyDhkvQr1YC0hogpzJeyLXa2W6lCvoK8TaKY4jCR97lte2n6oFnYnKBMLPWPjkoQA+WAvrlO1O+SyGGV4z2X7//9NapAad0O5FQKDVySbavDoAjo2/mCIBvaoyraMbdBZaPk+4HL+YtGqeAPmHJSre01h6untMzYP+3ts4JpoiHXp/kyHrdpVtj6nHvfoZip13VTLV2tgxEc/VD4Howgj3q137AY4nzLaJIpR6m2I0e65mtjtTwVSxaXhQrABZYywKutC0zKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Eu+NN1ekbn6jPCdBA8Sj4+6wqpe4yr5H2AHH3qZIB0=;
 b=btpdKlvXARG4Y9aijbJA8OdmcetUKa34SQg4TyQdXlAoWmXJNtZgQ2muEKYWq1CS4sumxljWaRjNdMf0Ug+NXnfD2PMkciHTbZjL4IV8i4f/7g+pizH8DpewQKgbskOuiCntAkv5myYJpn7BO0EO6JIyygLOz5Zy8XSUHZk+MOd8+PbDJI2jH89VXAFJ9dAUB/c5QNfAk1RdXMA/JfLGR1QpBT7nUw+Dm8hFVwb0fuP/yx90l0QXE4to9vBi0YRnAlkwIZjbMdq3NpozkfgKyVHSgAE0o2vRlnBl2ggmPE5DyjpEw6ifJ21C5pyW1j03XFdp8MjeBX1nQSUyfBvCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Eu+NN1ekbn6jPCdBA8Sj4+6wqpe4yr5H2AHH3qZIB0=;
 b=6v4Qn5oy4+PGjnI6wZXIbjh2gcJgK0+Qtknvza8eGw9pQb3ipyV50JNMnY9vQVG80bjXAk1CTlZ7v6iehj+0LGL5M5dI/g1xVwS2YIp5UHhyVlnlASHDjZEuze4E80uykNaxBFp0yX3b91+RJJZvWT0M995sp9iAIjAF1mhFQJw=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when
 platform is not set
Thread-Topic: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when
 platform is not set
Thread-Index: AQHXjpsgsRofIZVQlECQrMelX8Mpkqt63vUAgADFfsA=
Date: Fri, 20 Aug 2021 02:04:51 +0000
Message-ID:
 <DB9PR08MB68572A84F6A73644C4FE3F609EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-5-wei.chen@arm.com>
 <61893862-6b8f-9c1b-367b-7e0c837a43c5@xen.org>
In-Reply-To: <61893862-6b8f-9c1b-367b-7e0c837a43c5@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9C7337F1F48B7E4BA86FF2F847396037.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6217b633-2863-4d66-6940-08d9637eedee
x-ms-traffictypediagnostic: DBBPR08MB4492:|AM4PR08MB2627:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB26270E63C9AD2A278AE932949EC19@AM4PR08MB2627.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Qs0zqQjdv2YU9hxAOcFX/HLcF6uSXCWUol2xl4JVYSwXqPbdbDVmWG6v/wX3TrGDv+TwsOXFT0pUIhgesZN0qZRk6BEMs/4bl2XDaKF6iRLUI8SSvHEkGnm7wr9ftXXGFH+Jqv8tAZ/FMiZpqLiWmYVRWtuFUX1RqMynnT5asQIe1EQFSzDngSw5slsLaeHF0MLGcQzewgiWVQ4cWlMNj8k54aexOPMMkJPJO39vDivnCTXCgtBmvWm3GomAs9vDwSvc1Vtl2+m1jYfaEbNfDUitCHzQ5r8VMEp+vuSzBEbAkzKVIniDsSVNJL+6vGceEkn7Oetkwafw1eSWUned5HL+SbICcihz4IBpF7OgIoJCh+GRn0NrzExycVX9EMGTLmD4ZuMnRJ9aS/h+R06y1yGjxv5G/Y7E0I/QYmlgSFBPTGgqeHh0L879e4LLcTjFcHSNEUaWeTrYHbN4RePG2Yw+CIexEvNZs9WeuVCJaaKHbVmB/arzTejaTwXtliuKlrKC+kvmz+SXcJAiLL95E4mCXPRwJEOeFIpmjjnhrgPAY8cQsLTupzocfjhhBxEydP7DMeFACgdEhByo/fncF1og65eaI7wjfR9UdY90fL4bHKC7FxJgaW3c3Kt3L6JpUijyCDCkD+gxgntfGKiV36u+CagYabJU6Rj9M6dAHQ6vCIurJdPo8YEpPVGgzrJv3+1qycBbXaB5p2KNuooVWw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39850400004)(66946007)(38070700005)(64756008)(66476007)(83380400001)(71200400001)(8676002)(186003)(8936002)(4326008)(66446008)(33656002)(122000001)(66556008)(38100700002)(478600001)(26005)(2906002)(53546011)(5660300002)(55016002)(6506007)(316002)(52536014)(76116006)(110136005)(9686003)(7696005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmJEN0FMbW9LU20raXNBMkMvRXl6QUpadHZBWWI4QjB6ay83VWRVYUZtbXhT?=
 =?utf-8?B?djcrT2pRU2hQS0g3STRxV0g5MzM1ajhOY1RSTTJRRjg5TTM3NGMyOGVsMjJ2?=
 =?utf-8?B?QjYyUGw5K2xUdkJqN2VBV01ZOVNKMUVpZzlNQWYrMmoraytNQ09pK0VMd3Zr?=
 =?utf-8?B?aDJDcCtTR25WdkVncWdWTG1xNTFEN3hra3ovR05tamxQSkwvNkRPdU13UjJz?=
 =?utf-8?B?b2RFKzNQZzNGbkQwY3VINUJVWVMydis1eXZIa3piZEZMdmUwaExrR21OT3pC?=
 =?utf-8?B?ZE02cUJDT2cwU2V3UkNjWG1jZ3BCRFRMa2o4OStUd1c3enZEMWd0RGw1b3l2?=
 =?utf-8?B?SEtIMm1jcEVDc21CUjBQY3RmWnd6dzNOb3VicjJ6WWpwOG8rVmdGM1JRVTZI?=
 =?utf-8?B?Q1FGSXFJRmVXRnMxaEhld2gwVHpPU3JKZHBLRnZydTZTWGxRZXEyMkQ4em1D?=
 =?utf-8?B?dUlpYjRWYmY0NzY0R3VZU3NTeUtoQXR3WHQ3RmhKeko5RVZwdDhONk9wM1FH?=
 =?utf-8?B?OGtnbUorY1NkY01EM1Z6TVVXZkZJanM3azRTRzZiSTFGV2RyWjJKYzZTb0g0?=
 =?utf-8?B?RDhORERXaGd0YVovbmtuK21nNnZLK0oyUllFK1NWaVJOc1FLQ3VMYUJWS2dx?=
 =?utf-8?B?Ui9CU09uR0dYVkF3QXFNeks4UmkzTVhvZHp0ZFF2NEtjRDhwTzlKMXgxd256?=
 =?utf-8?B?TzNWTG5SU01EV2ZqY2YvS01EVEJKVzNmZ0dPNVA5UHh2SG5LcnJIZi9WSUdK?=
 =?utf-8?B?c2EvMWttcmFkV2xCV0ZURTdDdnlNZzExcTIwUzdZY2lIVWE5TnRodUJsOCtV?=
 =?utf-8?B?OGgvTS9HVHJ0Y0tHdmRUcnB2UDBpU1poOTVubnFuUnVELytTYldiM3B1aWtn?=
 =?utf-8?B?eGtLeGF5TlFyZTdIV2UxLzVzZk1sNzZSSDhrZm5zNWFkTm55dkVhTkxwUGFC?=
 =?utf-8?B?ZG5sQW1IUllUMmFsOHBlV2hrUG96ZlVBN2NjQ2tWWVJUQ2E1ZDhXcmROMU5I?=
 =?utf-8?B?OEZVUDI1NitlT1YrRUhIMkJZUFJieHFMMUZRdVUzeElvWEV2aDRycFlFNkky?=
 =?utf-8?B?dGc0K1J6ZnE5eC92TlE1bWlCRzlHVUg0VmpuR1h5a1ZqcGhaVWFVTEVmR2t0?=
 =?utf-8?B?OC9VcEtQcXVsaFAvSmxpSUF6VTJKRDkweDZOSGlPVUZiNytZVE05RThUc2Fh?=
 =?utf-8?B?TmR4Zi90OFlDTy9TNnVxcFdwNmFCTlhoZkRUbzVvRWhWVkRjOGRKdlNjU044?=
 =?utf-8?B?cVc1RncvSEhNbzRuZW1iV1FpdkFaeFhTWnd4NkI5RE95Q0JxS2thejJtUGMr?=
 =?utf-8?B?MGx1ZHNrMWZwdzZZNWowY2xoa2VXUmxNNkFaYmwvSzdhd0MreUdjL0hacXBM?=
 =?utf-8?B?QTFQNFliV09sRlBxVHlBSmMwbzVNK3FRVkd3RmhXMWpRUTlRYUNpZnU2TkRE?=
 =?utf-8?B?V2kyZkt2RUVrdXRUcVJQTmNSN212QUxQOWcwOWZkdkZNNStWOXN2T3FGdytO?=
 =?utf-8?B?cS9TenJudWc0WHBvYTVTK2RFbE5GTytMaGVMWndKc3BNWmJjc25jVitaU3Vr?=
 =?utf-8?B?RXE4TDYzSUVGN3RjVnRyd2RkTjk0VHM1UWJyOUF2RnU0bVp0S3ZPRFd1V3R0?=
 =?utf-8?B?U0ljOHhaditXVFk0THZiempSTVFkZWZaN291RS90VGVVclhTa01PQ1ByUGhI?=
 =?utf-8?B?KzBoLzlsVHdaTFhjc25WMld3TlptOGE4Q2RxbisyRTR0dzE1dkJhRG5razJO?=
 =?utf-8?Q?3jV9LrduqjNpC39tY/UhjXrztM2sDac0SB1QDYR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4492
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9235b92a-b270-46be-086d-08d9637ee57e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CzLDd0rHUQGMZn3qnDOF78lhth4ExipJfHSBJvqN8386HW+pNijwyZ+9vjY6l4aaklEYX8tO1fIqcwhwVluo9pC0AW9sCBiFGNdHEcLgtrCSm6Lmhmxs42sY8HlYdkk6h5kAxQ0VZ3cMwqZO/x4QQHnHNM4/txyca7xmPPaYLUMelsoU65XTMrLax4OWhmhc4pqRfXt7RQriGD7O46H+D+bJaIs/L2v8KA9zQaSrhnib+tiZh+alBqq2xTPL282HF/jYWaVk3gtPxiehcByjkm2CGIYR3GoTV6+TTYFKzDTYxPkG8nJ5RqN5bXx5SaPXFJDRvLNxKyuXsuqn3F1eoW9GA5aUznc618Fm1Gh/tvu4tw0HTk82f4rcx5rmot97n/ObVtRylJ+Sg6m9lXvokPHyE5cpme59sGpU7eeySYlq1W0LwMGdaXW7jH1FZC45oZMcDyh44wWFo9v6EYn0NtW1uoCDzgpJ6eflaYR6PSzgMHltmJSRxl/LI5sb/Fp/sQYz6aiBOkErJmQC4yGMMPJvzx/+Qw+EKuow8OqdclzUMgWjoJWO0kL7FeUMeB9T3ziA/lUTJ9kKyABoGPZ6lFbmQG3YJHLfH1c1JTiFGSptXqVcFXTbvLPnmDkKNSohK8aBFZaUgvVLNJk/6ob6dRxPafMH2cOR315S7R8+zckTN8US9fcA2OU1jdOkYigOgX+ma1IReGlmTRAiPCQJVQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39850400004)(376002)(36840700001)(46966006)(33656002)(7696005)(82310400003)(6506007)(9686003)(2906002)(4326008)(55016002)(53546011)(70206006)(70586007)(336012)(8936002)(110136005)(8676002)(316002)(83380400001)(5660300002)(36860700001)(52536014)(47076005)(82740400003)(186003)(356005)(478600001)(81166007)(26005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 02:05:05.7020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6217b633-2863-4d66-6940-08d9637eedee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2627

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMTnml6UgMjE6MjgN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMDQvNDBdIHhlbi9hcm06IHJldHVybiBkZWZhdWx0IERN
QSBiaXQgd2lkdGgNCj4gd2hlbiBwbGF0Zm9ybSBpcyBub3Qgc2V0DQo+IA0KPiBIaSwNCj4gDQo+
IE9uIDExLzA4LzIwMjEgMTE6MjMsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEZyb206IEhvbmdkYSBE
ZW5nIDxIb25nZGEuRGVuZ0Bhcm0uY29tPg0KPiA+DQo+ID4gSW4gY3VycmVudCBjb2RlLCBhcmNo
X2dldF9kbWFfYml0c2l6ZSB3aWxsIHJldHVybiAzMiB3aGVuIHBsYXRvcm0NCj4gPiBvciBwbGF0
Zm9ybS0+ZG1hX2JpdHNpemUgaXMgbm90IHNldC4gSXQncyBub3QgcmVzb25hYmxlLCBmb3IgQXJt
LA0KPiANCj4gcy9yZXNvbmFibGUvcmVhc29uYWJsZS8NCj4gDQoNCk9rDQoNCj4gPiB3ZSBkb24n
dCByZXF1aXJlIHRvIHJlc2VydmUgRE1BIG1lbW9yeS4gU28gd2Ugc2V0IGRtYV9iaXRzaXplIGFs
d2F5cw0KPiA+IGJlIDAuIEluIE5PLU5VTUEgc3lzdGVtLCBhcmNoX2dldF9kbWFfYml0c2l6ZSB3
aWxsIG5vdCBiZSBpbnZva2VkLA0KPiA+IHNvIGRtYV9iaXRzaXplIHdpbGwgbm90IGJlIG92ZXJy
aWRlZCBieSB0aGlzIGZ1bmN0aW9uLg0KPiANCj4gYXJjaF9nZXRfZG1hX2JpdHNpemUoKSBpcyBh
bHNvIHVzZWQgdG8gYWxsb2NhdGUgZG9tMCBtZW1vcnkuIFdlIG5lZWQgdG8NCj4gYmUgYWJsZSB0
byBhbGxvY2F0ZSBzb21lIERNQS1hYmxlIG1lbW9yeSB0aGF0IGNhbiBiZSB1c2VkIGJ5IGV2ZXJ5
IGRldmljZXMuDQo+IA0KPiA+IEJ1dCBpbiBOVU1BDQo+ID4gc3lzdGVtLCBvbmNlIHRoZSBvbmxp
bmUgbm9kZXMgYXJlIGdyZWF0ZXIgdGhhbiAxLCB0aGlzIGZ1bmN0aW9uIHdpbGwNCj4gPiBiZSBp
bnZva2VkLiBUaGUgZG1hX2JpdHNpemUgd2lsbCBiZSBsaW1pdGVkIHRvIDMyLiBUaGF0IG1lYW5z
LCBvbmx5DQo+ID4gZmlyc3QgNEdCIG1lbW9yeSBjYW4gYmUgdXNlZCBmb3IgRE1BLiBCdXQgdGhh
dCdzIGFnYWluc3Qgb3VyIGhhcmR3YXJlDQo+ID4gZGVzaWduLiBXZSBkb24ndCBoYXZlIHRoYXQg
a2luZCBvZiByZXN0cmljdGlvbiBvbiBoYXJkd2FyZS4NCj4gDQo+IFdoYXQgZG8geW91IG1lYW4g
YnkgImhhcmR3YXJlIGRlc2lnbiI/IEFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZSBzZXJ2ZXINCj4g
eW91IGJvb3QgWGVuIG9uPw0KPiANCg0KWWVzLiBJIHdpbGwgY2hhbmdlIGl0IHRvIHNvbWUgbmV1
dHJhbCB3b3Jkcy4gc29tZXRoaW5nIGxpa2U6DQoiQnV0IHRoYXQgY291bGQgbm90IHJlZmxlY3Qg
c29tZSBoYXJkd2FyZSdzIHJlYWwgRE1BIGFiaWxpdHkuIFRoZXkgbWF5IG5vdA0KaGF2ZSBraW5k
IG9mIHJlc3RyaWN0aW9uIG9uIGhhcmR3YXJlLiIgPw0KDQoNCj4gQW55d2F5LCB0aGVyZSBhcmUg
cGxlbnR5IG9mIHBsYXRmb3JtIG91dCB0aGF0IGhhdmUgZGV2aWNlcyB3aGljaCBjYW4ndA0KPiBE
TUEgaW50byBtZW1vcnkgYWJvdmUgMzItYml0LiBPbiBSUEksIHRoaXMgaXMgZXZlbiBsb3dlciAo
MzAtYml0KS4NCj4gDQo+IFNvIEkgd291bGQgYmUgY2F1dGlvdXMgdG8gY2hhbmdlIHRoZSBkZWZh
dWx0IGxpbWl0Lg0KPiANCg0KSG93IGFib3V0IHJldHVybiAwIHdoZW4gcGxhdGZvcm0gZG9lc24n
dCBzcGVjaWZ5IHRoZSBsaW1pdD8NCkluIG15IG9waW5pb24sIGFyYml0cmFyeSB0byBnaXZlIDMy
IG9uIEFBcmNoNjQgZG9lc24ndCBtYWtlIHNlbnNlLg0KQnV0IGFzIHlvdSBtZW50aW9uZWQsIGlm
IFhlbiBpcyBydW5uaW5nIG9uIGEgcGxhdGZvcm0gd2l0aCBETUEgbGltaXRhdGlvbiwNCmJ1dCB3
ZSBoYXZlIG5vdCBsaXN0ZWQgdGhpcyBwbGF0Zm9ybSBpbiBYZW4gc3VwcG9ydGVkIGxpc3QsIFhl
biBjYW5ub3QNCmdldCBETUEgbGltaXQgZnJvbSBwbGF0Zm9ybS0+ZG1hX2JpdHNpemUuIEluIHRo
aXMgY2FzZSwgcmV0dXJuIDAgd2lsbA0KYWxzbyBjYXVzZSBzb21lIGlzc3VlLg0KDQo+IEF0IHRo
ZSBtb21lbnQsIHRoZSBvbmx5IHBsYWNlIG9uIEFybSB3aGVyZSB3ZSBuZWVkIERNQS1hYmxlIG1l
bW9yeSBpcw0KPiBmb3IgZG9tMC4gVGhpcyBpcyBhbGxvY2F0ZWQgYXQgYm9vdCBhbmQgY2FuJ3Qg
Y2hhbmdlIGFmdGVyd2FyZHMgKGZvciBub3cpLg0KPiANCg0KRm9yIERvbTAsIHdlIHNxdWFzaCB0
aGUgcGF0Y2gjNSBpbnRvIHRoaXMgcGF0Y2g/DQoNCj4gU28gSSB3b3VsZCBleHBsb3JlIHRvIHJl
bW92ZSB0aGUgTlVNQSBjaGVjayBmb3IgZHJvcCB0aGUgRE1BIHpvbmUuIEZBT0QsDQo+IGJvdGgg
c3VnZ2VzdGlvbiBhcmUgZm9yIEFybSBvbmx5LiBGb3IgeDg2LCB0aGV5IG5lZWQgdG8gYmUga2Vw
dC4NCj4gDQoNCldpdGhvdXQgaW50cm9kdWNpbmcgbmV3IGZsYWcsIHN1Y2ggYXMgbG93bWVtX2Zv
cl9kbWEsIGl0J3MgYSBsaXR0bGUNCmhhcmQgdG8gc2tpcCB0aGUgbnVtYSBub2RlIGNoZWNrLiBV
bmxlc3Mgd2UgY3J1ZGVseSBhZGQgI2lmZGVmIEFSQ0ggdG8gDQpjb21tb24gY29kZSwgd2hpY2gg
aXMgbm90IHdoYXQgd2Ugd2FudCB0byBzZWUgLi4uDQogICAgICBpZiAoICFkbWFfYml0c2l6ZSAm
JiAobnVtX29ubGluZV9ub2RlcygpID4gMSkgKQ0KICAgICAgICAgIGRtYV9iaXRzaXplID0gYXJj
aF9nZXRfZG1hX2JpdHNpemUoKTsNCg0KPiA+IE9ubHkNCj4gPiBwbGF0Zm9ybSBzZXR0aW5nIGNh
biBvdmVycmlkZSBkbWFfYml0c2l6ZS4gU28gaW4gdGhpcyBwYXRjaCwgd2UNCj4gPiByZXR1cm4g
ZGVmYXVsdCBkbWFfYml0c2l6ZSwgd2hlbiBwbGF0Zm9ybSBhbmQgcGxhdG9ybS0+ZG1hX2JpdHNp
emUNCj4gPiBhcmUgbm90IHNldC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3
ZWkuY2hlbkBhcm0uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhvbmdkYSBEZW5nIDxIb25nZGEu
RGVuZ0Bhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL3BsYXRmb3JtLmMgfCA0
ICsrKy0NCj4gPiAgIHhlbi9jb21tb24vcGFnZV9hbGxvYy5jIHwgMiArLQ0KPiA+ICAgMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRmb3JtLmMgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm0u
Yw0KPiA+IGluZGV4IDRkYjViYmI0YzUuLjBhMjdmZWY5YTQgMTAwNjQ0DQo+ID4gLS0tIGEveGVu
L2FyY2gvYXJtL3BsYXRmb3JtLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm0uYw0K
PiA+IEBAIC0yNyw2ICsyNyw3IEBAIGV4dGVybiBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fZGVzYyBf
c3BsYXRmb3JtW10sDQo+IF9lcGxhdGZvcm1bXTsNCj4gPiAgIC8qIFBvaW50ZXIgdG8gdGhlIGN1
cnJlbnQgcGxhdGZvcm0gZGVzY3JpcHRpb24gKi8NCj4gPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cGxhdGZvcm1fZGVzYyAqcGxhdGZvcm07DQo+ID4NCj4gPiArZXh0ZXJuIHVuc2lnbmVkIGludCBk
bWFfYml0c2l6ZTsNCj4gPg0KPiA+ICAgc3RhdGljIGJvb2wgX19pbml0IHBsYXRmb3JtX2lzX2Nv
bXBhdGlibGUoY29uc3Qgc3RydWN0IHBsYXRmb3JtX2Rlc2MNCj4gKnBsYXQpDQo+ID4gICB7DQo+
ID4gQEAgLTE1Nyw3ICsxNTgsOCBAQCBib29sIHBsYXRmb3JtX2RldmljZV9pc19ibGFja2xpc3Rl
ZChjb25zdCBzdHJ1Y3QNCj4gZHRfZGV2aWNlX25vZGUgKm5vZGUpDQo+ID4NCj4gPiAgIHVuc2ln
bmVkIGludCBhcmNoX2dldF9kbWFfYml0c2l6ZSh2b2lkKQ0KPiA+ICAgew0KPiA+IC0gICAgcmV0
dXJuICggcGxhdGZvcm0gJiYgcGxhdGZvcm0tPmRtYV9iaXRzaXplICkgPyBwbGF0Zm9ybS0NCj4g
PmRtYV9iaXRzaXplIDogMzI7DQo+ID4gKyAgICByZXR1cm4gKCBwbGF0Zm9ybSAmJiBwbGF0Zm9y
bS0+ZG1hX2JpdHNpemUgKSA/IHBsYXRmb3JtLQ0KPiA+ZG1hX2JpdHNpemUNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogZG1hX2JpdHNpemU7
DQo+ID4gICB9DQo+ID4NCj4gPiAgIC8qDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFn
ZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPiBpbmRleCA5NThiYTBjZDky
Li4wZjBjYWU1YTRlIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+
ID4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPiBAQCAtMjI3LDcgKzIyNyw3IEBA
IHN0YXRpYyBib29sIF9fcmVhZF9tb3N0bHkgc2NydWJfZGVidWc7DQo+ID4gICAgKiBCaXQgd2lk
dGggb2YgdGhlIERNQSBoZWFwIC0tIHVzZWQgdG8gb3ZlcnJpZGUgTlVNQS1ub2RlLWZpcnN0Lg0K
PiA+ICAgICogYWxsb2NhdGlvbiBzdHJhdGVneSwgd2hpY2ggY2FuIG90aGVyd2lzZSBleGhhdXN0
IGxvdyBtZW1vcnkuDQo+ID4gICAgKi8NCj4gPiAtc3RhdGljIHVuc2lnbmVkIGludCBkbWFfYml0
c2l6ZTsNCj4gPiArdW5zaWduZWQgaW50IGRtYV9iaXRzaXplOw0KPiA+ICAgaW50ZWdlcl9wYXJh
bSgiZG1hX2JpdHMiLCBkbWFfYml0c2l6ZSk7DQo+ID4NCj4gPiAgIC8qIE9mZmxpbmVkIHBhZ2Ug
bGlzdCwgcHJvdGVjdGVkIGJ5IGhlYXBfbG9jay4gKi8NCj4gPg0KPiANCj4gQ2hlZXJzLA0KPiAN
Cj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

