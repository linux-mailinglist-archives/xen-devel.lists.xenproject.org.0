Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C08B362340
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 17:02:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111844.213867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXPyh-0002id-NK; Fri, 16 Apr 2021 15:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111844.213867; Fri, 16 Apr 2021 15:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXPyh-0002iE-J4; Fri, 16 Apr 2021 15:01:51 +0000
Received: by outflank-mailman (input) for mailman id 111844;
 Fri, 16 Apr 2021 15:01:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZDfs=JN=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lXPyg-0002i8-1n
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 15:01:50 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.61]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2e5fb95-a268-4ac3-ac66-91e5ba6373a4;
 Fri, 16 Apr 2021 15:01:47 +0000 (UTC)
Received: from AM5PR1001CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::35)
 by AM8PR08MB6578.eurprd08.prod.outlook.com (2603:10a6:20b:36a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 15:01:41 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::f7) by AM5PR1001CA0022.outlook.office365.com
 (2603:10a6:206:2::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 15:01:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 15:01:41 +0000
Received: ("Tessian outbound 34291f7cb530:v90");
 Fri, 16 Apr 2021 15:01:40 +0000
Received: from e7781772ac7d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8AF1D36E-8F90-4EAB-8872-4C3421EDA344.1; 
 Fri, 16 Apr 2021 15:01:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e7781772ac7d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 16 Apr 2021 15:01:29 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3465.eurprd08.prod.outlook.com (2603:10a6:10:50::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 15:01:26 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d%7]) with mapi id 15.20.4020.023; Fri, 16 Apr 2021
 15:01:26 +0000
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
X-Inumbo-ID: c2e5fb95-a268-4ac3-ac66-91e5ba6373a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDmZAzQAwjX5fR3hIfSDu8J5LL13NXkZlKJzJ9q1YsY=;
 b=dWPiCL7pGGGrZ7ls/OOtz9j95qs0zAWos8I07n2q3n/j289oOAvkUkwcnnCwOqG/Fopfdn5Z/13ZzH+1VGDkYLFfkErZlwj7uxgVUEXMJIYSIOPsAfuostOORInDs9z1mldL75HGdv+2Is85LX4UF6TuVVjRxCddERl25t51yTs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09277a2c4f65e877
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzRT8zXnBGm2DqyqfuAga/HtTmc3ofnpkWfsMqcCV8ZWlW5Q+5js0wq7oNbLZ7jhD8+6iyyPRGBDe0k1LIcRU9ujxZOnTEb940CKHleKhZJgVuKNOIA7F/4aG0iwkquCBQUDB1DvQQh2n3poefr/gTAvg7m4u/KkvTA+2l/7vTsiz6mBKUgfA2ECajRH5jG4tC7xEsjLiTqcjx9RTVVs3bdT6acOA46JeIrFDzjki6wI+nBMEqJXLAeRQbmf5vaZ4zVZkigBI9oKHjxNig4KghoMipf12/SosWtA9VHFSiblbdWwyEYzfL4SC8Zfyyicm3bPEM6ax8oSgTTIW4h9ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDmZAzQAwjX5fR3hIfSDu8J5LL13NXkZlKJzJ9q1YsY=;
 b=cZh5AMMoRGItIHqUXRObSVq0r0lms0pVDcoucoqyB3YNFKXa11wqfEq69fm6dPVbgDFzVio6R9dY15dgnkQXM+iCbeClwL0mpV4I7gtVPgZgE0PwKftW0jIffhW/ayw9EKmavL3iXSjN2kYuTA/rl2sx0/VzYzWXM3jsn3OMVbvFLFLdj6jLKI5WxVts40nBzU+7TjpwtvQ9MXozh/pIbGYSfHharkU6bE4C9wCVT4z9dcosB9cNETkjRuRdtWoQXT43Zz9wSNIpMUkUP2dmvcHR3lRb391wV3+TT9cJ9EK7b0E9MgAc8uqfMKxDNVpnS/2RN8SPGS1eAN5BheZJEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDmZAzQAwjX5fR3hIfSDu8J5LL13NXkZlKJzJ9q1YsY=;
 b=dWPiCL7pGGGrZ7ls/OOtz9j95qs0zAWos8I07n2q3n/j289oOAvkUkwcnnCwOqG/Fopfdn5Z/13ZzH+1VGDkYLFfkErZlwj7uxgVUEXMJIYSIOPsAfuostOORInDs9z1mldL75HGdv+2Is85LX4UF6TuVVjRxCddERl25t51yTs=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
Thread-Topic: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
Thread-Index: AQHXMrMxW8Hpcs9A7Ei4/6fuLjr236q3NfuAgAAHXIA=
Date: Fri, 16 Apr 2021 15:01:26 +0000
Message-ID: <E2FE265F-B7A4-45C3-BA9C-3EF9109F8B5E@arm.com>
References:
 <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com>
 <6e75d112-6cc1-4b7c-9751-4064b3250dbf@xen.org>
In-Reply-To: <6e75d112-6cc1-4b7c-9751-4064b3250dbf@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9a5cddba-fbbc-454b-4c37-08d900e88adc
x-ms-traffictypediagnostic: DB7PR08MB3465:|AM8PR08MB6578:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB65785E57AE6FCE297B7833B2FC4C9@AM8PR08MB6578.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a2sB8+9efZQpP3ZXndbaTDXpA6e3HDcOJFTvcHyKcF6Odals+/bfNGnqaRXbNTVNVyglN/+4L+WvkdmhrWW2lVXJGfCpeY3hcC6DVU70LaPqLPaOchEVNPgWHdqa6QgaXE48SeyFP+DM8c4kBZe12hruXGju59UBbYeg2sxsjBbV8fCELTe+bFyffjAcgKhNWIVWgb+RMZMr6hh7AlR6T1MTFM0IgLWHmmOe5I9PenB1org0tNsstznSS8SNYPcCuNJ4knTRZAudpaHtrmbTwDpeL64r+8/QBUfH6RvRTmEbTA63BiKshB2r/P+0JzOENCdXj3fG4KzFDeVJMoKJlw6K3ecPMcFJhSgwTV/U1O3hw9g24GvIFnylAG1zVVXtrBpw+72bbS4PlH/zZ9JXa3kdB1Ri4GnhMaXzTsVpMcQwH8y8AnKWbv/Sj/4LyumZRDmSAiAQWH5SO2fGAxI/+SQXEExAy4lpRjXaZwreK31eITM7bsuqJHpWk1pV/ADE7yD4msEuBKVxW+ZK4mgwP0Hx8PSvv2wRqHX/wJAI3cxtw6tZvXMlPrl5sFTXtX4a+c6m47z/rcB7+Vu1xQ9cAzbb/+Ia9ylleiGedCyAzI40L+KBsXcAqnqfjqzFjrwkpoT7NCCuDgaQZKX1e4ZjM8VPx/NbslIbKTH5RSUNNUs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(6512007)(86362001)(5660300002)(6916009)(71200400001)(36756003)(2906002)(316002)(8676002)(26005)(66446008)(64756008)(66556008)(66476007)(6486002)(122000001)(91956017)(2616005)(76116006)(53546011)(6506007)(38100700002)(4326008)(186003)(33656002)(54906003)(478600001)(66946007)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?YXVVaHJrMlJKeEpsN1VzQWZQa28ycG1WWEtzOWNZS3N5dmgvc3pDN1NxR3FZ?=
 =?utf-8?B?TERLM3hvNmZLTEhRZzNOcjdQZEt5ME5icmpoU2F3VVEvSW95ZSt1MjZkR2Ez?=
 =?utf-8?B?dDNaekN0NU8wM2h5SFRCS29qcHRIUm9GSTRTNlc1anFFT25QL1p6R2s3ZUgw?=
 =?utf-8?B?ZE9PRkU1NUVvYzNZN05hZDdNa2M2MWNadXk5NVl4eFRsR0NQdG5kL0pJUTBn?=
 =?utf-8?B?THJMWVVrYmFoYlBJOHA5WHV1cjBVSnpOM3Fzd0lwMFpiNDdPQkNObXJVcWVk?=
 =?utf-8?B?dFByVFRKUi92N2xpQ3JxZm9aV2MzMDJUN2xxanRtN1luMzFDakJoVkIyNlNx?=
 =?utf-8?B?MnllNU9hT3BBN1g0YXgvbk9LK0lwWFBUQXRWWnhsZmpyelQ1cDNoODA1OGJN?=
 =?utf-8?B?clE2RXUrTjZDdVNpam05MEhzVVVKamRZcGcxN3lFZXhNc3VtMHFzeDArR0RC?=
 =?utf-8?B?OWlnd2xRY2JyYTAwU3kxbUgraGxGWUZHMEZTOUZheWt5azFlWllBTVJLT0Zs?=
 =?utf-8?B?clFJTGlmYStwMzlEN056NlRBZnBIZE5WU2RkMVRFdCt6VUNKbzBvaEJaNVpF?=
 =?utf-8?B?TlhuTXRSOHBzRlcxK1NwcHVHUVNHTVUrNjRxWm5SMy9LdWVIc0VtZWx4aUZ0?=
 =?utf-8?B?anN6emFPbkdVQkhlT3p6UGpia0k0aE42SWg5bEZaWkZHTzNmS2xvOWpVM0l5?=
 =?utf-8?B?Z2YwUGpFdXdFS2tuSDZ0TnVIMi9nN01KMzgyc2JaZE5lTHdjak5IVStXMXB2?=
 =?utf-8?B?RzhkdXk1bTNBbE4yYVhXOWRCRjdMVVNvV0d3WTZ2RzNwZHJFKzZSUExtWTdj?=
 =?utf-8?B?cnRvNkMrZklIYzRGNVlCcXJFN0lUQnhqRnFza2M3TEpXTFJQU29sQ2RZd1pq?=
 =?utf-8?B?Vmh6a05GZGU1UEVnQ1NNSjVwYzUrSkxnL2Rhb3ZPMmo0Q3M5ZXU2ZkxENXdr?=
 =?utf-8?B?S09kOURNQ0JjdnFXN1F6TEVuOUx4KzE3ZHFDSFBQMERMVnU2eWhTVDUrM1ky?=
 =?utf-8?B?QjNuTy9RUDJqcHFSZlNzWFhTc25tSVMxV1FkL3hzeURhUGIvbFF2R1R0S1Vq?=
 =?utf-8?B?MlNkTTVBRjJ2Z3ZZQS9ZaDg2dlpMSnIzM05DSm15M3hYVDZmNkp3YkRINC9a?=
 =?utf-8?B?R2hwUzhMNkpKN1N1a3UxdUJnTkQvTE9MREF5QnU4N2dxQXVJY1UxWDViUy9u?=
 =?utf-8?B?a0k1dmhiWnZPQnFidHpDY2FtTFI5SXdqNzJxNkVWcFV4bEd6V0dZRDFmcURr?=
 =?utf-8?B?Ym5xRlMva2dMZ1NzSVloVzY5YUZpK0NpRnlwbHdnQVdlQnNSMmQ0dFdaclBI?=
 =?utf-8?B?dmFaY3M3TFhkdFJwNUFaQmtKZmxoK3BURDgrS2ZZUjR2bXRnZ3RXdkQ5dGdh?=
 =?utf-8?B?VThHNUJSTGhLeWlsV3JpZ3Q3ajY3WkZxd1gzWnQ1NGoyRmdNZnlXcG42OHQ3?=
 =?utf-8?B?VTYwcWdPUURqZTh6cXlQc242cVErS3UzaGlZaVhGSm1JSU1ieXE2VnRXWjFR?=
 =?utf-8?B?SzNaeGlpL2dmQzV4a2VGV1QxNE80U2ZFWXptYms0dG5wSWJabzNrak45M2oz?=
 =?utf-8?B?d0xwTUhsUlNldlFHVVBXeTM5dGNJNlFOSGZrYzN3dnN6dGQydGtOMWxKMWoy?=
 =?utf-8?B?ZWsxQ09lWXlJemV0bW1aSHBxbUVNZDZwcnpzLy9ua2ZYR0xrSnFaV0FmNWh5?=
 =?utf-8?B?UjFndC9LNGNVUGs1U0htc0pHTWc2Snl5ZkRwVzEzRmNuTUIrUzRjSHN2RXYz?=
 =?utf-8?Q?q9jhJKQS4dNfVMrnRmdN3K70aYg3Ha+ZLRaT9TI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF1ECE36BC41D34ABB6974DD0AA77C52@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3465
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	752c6b05-9af2-440c-5f49-08d900e8822e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5qkLQ9O5ZJSdTf34RSzaoiE6rfm+6oJaae2DKDy2q9ocwL1oV0PRY/umtAhKDJzQQltcKIL90LfEb2EZ8aV3Kqc0WYHOTy4R1PPaEGN0Y2UhRdV5Br7iFT+Nj1hy02FTNEqEIdGdAK97GhGw4Apq1VOH0o39WsljOjGY4rhmw5LSEo20a82lxP0xQ7IZBp/ruzCgdPypoVIJvvbZw9DVAEOp5P8edY0qco9UHw6CoEzGu/iXmbQXX7sXBFMttDFgrpGVCtVHDOQRDTRJJCI+r5cZJl7u0N07DNDt1bl1GV5RHqSfUdWtiUbEdYLuav4cDcaA5NSLtWKOUoAxbwHYf1UqyEVrFbhM1nGOqxcuplYkpMxWidRDypTiNugw9q7V7vIZ2QotPkJABk+H3gRxOtxikX0feD/bRUh8pDhdrGcrdJDb4p+UuRNzAzSuMjee+8pTiaPR7n/6J2pDEavP6JoVCgh8ErHq/NWNYm1mKBL/N9wKG2Mr/jm3vOKKGk2IezxypjBJsaHufNY6j9cVuWfgpb+qC2mFVIhcwkggODiE5TVkDSFupGF97uF0d69giUq0MJf5ikxMu+tmrhnWCnDloPi1TUVIq60xq+HJ0YOcZGEEGAF926/JYz1gganH9mvoOu6wuX7DrsuBkELa3Ao9nyFFFZN6/2gJ9UpGWag=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966006)(36840700001)(47076005)(107886003)(6862004)(54906003)(36756003)(33656002)(8936002)(8676002)(336012)(6512007)(82310400003)(86362001)(6506007)(53546011)(4326008)(36860700001)(2616005)(478600001)(82740400003)(5660300002)(26005)(316002)(2906002)(6486002)(70586007)(81166007)(356005)(70206006)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:01:41.1167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5cddba-fbbc-454b-4c37-08d900e88adc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6578

SGkgSnVsaWVuLA0KDQo+IE9uIDE2IEFwciAyMDIxLCBhdCAzOjM1IHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMTYvMDQvMjAyMSAx
MjoyNSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBSZXZlcnQgdGhlIGNvZGUgdGhhdCBhc3NvY2lh
dGVzIHRoZSBncm91cCBwb2ludGVyIHdpdGggdGhlIFMyQ1IgYXMgdGhpcw0KPj4gY29kZSBjYXVz
aW5nIGFuIGlzc3VlIHdoZW4gdGhlIFNNTVUgZGV2aWNlIGhhcyBtb3JlIHRoYW4gb25lIG1hc3Rl
cg0KPj4gZGV2aWNlLg0KPiANCj4gSXQgaXMgbm90IGNsZWFyIHRvIG1lIHdoeSB0aGlzIGNoYW5n
ZSB3YXMgZmlyc3QgYWRkZWQuIEFyZSB3ZSBtaXNzaW5nIGFueSBmZWF0dXJlIHdoZW4gcmV2ZXJ0
aW5nIGl0Pw0KDQpUaGlzIGZlYXR1cmUgd2FzIGFkZGVkIHdoZW4gd2UgYmFja3BvcnRlZCB0aGUg
Y29kZSBmcm9tIExpbnV4IHRvIGZpeCB0aGUgc3RyZWFtIG1hdGNoIGNvbmZsaWN0IGlzc3VlDQph
cyBwYXJ0IG9mIGNvbW1pdCAieGVuL2FybTogc21tdXYxOiBJbnRlbGxpZ2VudCBTTVIgYWxsb2Nh
dGlvbuKAnS4gDQoNClRoaXMgaXMgYW4gZXh0cmEgZmVhdHVyZSBhZGRlZCB0byBhbGxvY2F0ZSBJ
T01NVSBncm91cCBiYXNlZCBvbiBzdHJlYW0taWQuIElmIHR3byBkZXZpY2UgaGFzIHRoZQ0Kc2Ft
ZSBzdHJlYW0taWQgdGhlbiB3ZSBhc3NpZ24gdGhvc2UgZGV2aWNlcyB0byB0aGUgc2FtZSBncm91
cC4gVGhpcyBjb2RlIHdhcyByZW1vdmVkIGZyb20gTGludXgNCmxhdGVyIHBvaW50IGluIHRpbWUg
d2hlbiBJT01NVSBncm91cCBoYW5kbGluZyBpcyBkb25lIGJ5IExpbnV4IGNvZGUgbm90IGJ5IGEg
c3BlY2lmaWMgSU9NTVUgZHJpdmVyLg0KVGhlcmVmb3JlIEkgdGhpbmsgaXQgaXMgb2sgcmV2ZXJ0
IHRoZSBjb2RlLg0KDQo+IA0KPj4gVGhpcyBjb2RlIGlzIG1lcmdlZCB3aXRoIHRoZSBjb21taXQg
ICJ4ZW4vYXJtOiBzbW11djE6IEludGVsbGlnZW50DQo+PiBTTVIgYWxsb2NhdGlvbuKAnS4NCj4g
DQo+IFRoaXMgd2FudHMgYSBmaXhlcyB0YWcuIENhbiBiZSBhZGRlZCBvbiBjb21taXQgaWYgdGhl
cmUgaXMgbm90aGluZyBlbHNlIHRvIGNoYW5nZS4NCg0KWWVzLiBUaGF0IHdpbGwgYmUgZ3JlYXQu
IFRoaXMgZml4ZXMgdGhlIGNvbW1pdCDigJwwNDM1Nzg0Y2M3NWRjZmVmM2I1ZjU5YzI5ZGViMWRi
Yjg0MjY1ZGRiOnhlbi9hcm06IHNtbXV2MTogSW50ZWxsaWdlbnQgU01SIGFsbG9jYXRpb27igJ0N
Cg0KUmVnYXJkcywNClJhaHVsDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdy
YWxsDQoNCg==

