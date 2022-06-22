Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D652554EF8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 17:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354149.581195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o429F-0002Pj-DZ; Wed, 22 Jun 2022 15:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354149.581195; Wed, 22 Jun 2022 15:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o429F-0002MU-8t; Wed, 22 Jun 2022 15:20:05 +0000
Received: by outflank-mailman (input) for mailman id 354149;
 Wed, 22 Jun 2022 15:20:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UqP7=W5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o429D-00029e-R9
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 15:20:03 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140057.outbound.protection.outlook.com [40.107.14.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9386124-f23e-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 17:20:02 +0200 (CEST)
Received: from AM0PR01CA0149.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::18) by AM4PR0802MB2369.eurprd08.prod.outlook.com
 (2603:10a6:200:65::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Wed, 22 Jun
 2022 15:20:00 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:aa:cafe::5d) by AM0PR01CA0149.outlook.office365.com
 (2603:10a6:208:aa::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Wed, 22 Jun 2022 15:20:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Wed, 22 Jun 2022 15:19:59 +0000
Received: ("Tessian outbound 4ab5a053767b:v120");
 Wed, 22 Jun 2022 15:19:58 +0000
Received: from 0936c3ae7147.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E984FE09-717E-44E0-8D26-1B36E1B88F42.1; 
 Wed, 22 Jun 2022 15:19:51 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0936c3ae7147.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Jun 2022 15:19:51 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by HE1PR08MB2777.eurprd08.prod.outlook.com (2603:10a6:7:2e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 22 Jun
 2022 15:19:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 15:19:40 +0000
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
X-Inumbo-ID: c9386124-f23e-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ePAngA9A79tbH/6FJZ8Y/M++mAYNyItu0RlrWBdPyeRogYMiet08k7ycOlRCUju/wAy0i8ivRMfjqW0SKMxaoWlThvmLtlc7BzfIMdDdTiNtgBU7xa6d1ozZLtVU92ygR7jGiwr5oRvlnI69TG88qQ3hc3Fh1LDrjzUm7axcxr8P8StMyvicJ3pCxsLmWeHA7Us5pzD4aBgSzfNdGs0zgk2RL2t4gZ06PplX4d+ibIKDMk5sz9ktPoiGEhTGTISpKAyBGwD25PLMuPi/XN6Z3oXzc+cv8xgVB/4G0TVnhDnY66ULae9EplApGOEbLIzTw4d9eIy9oWXvXct9UOBwJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+Rx8v74VzjBt6a8QSS2J8yQqn3HjTq3wmVdtxONqGI=;
 b=Wr528tyddUGup3UoLcshtyiUnT9FO52RSAp7YM6I0nNjjzERwa/shF4anDnnFgFbyQ18uUuom/2+Xv08UgXVTksi8uTA24Vx0MGHnPxnXScq7x68PAYJ7dnNUbBT3SxPUjQIeS0KOpvlUdLnCfqnGT+50x8xgaUECX+4OLTGk12PEqX8ml3fNnCYOefV/1bcqinaG/RKvWdh9K6xO+kidCbCNwdHw63XmVWL6mZaxZbiXWhAfbCNw7ahxE6RbaXc4aFTpYJ6IecjJCmScuCzz1mldRDKMURm2Yqa32JdeG9U5OuhGPyDuRCjqTYr4HICtTiZqNJ7eTmUy/Ivi/F4gw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+Rx8v74VzjBt6a8QSS2J8yQqn3HjTq3wmVdtxONqGI=;
 b=KgDd2B6qq0bDHsygif+3/RupqCXK0d2Z3uUK8X7JNlkFfqtpZG9Bvc8u4ViRvTcgxG9Kuq9BYyGLNhWJX2I660Rsi4gp50D3Rd3Lq83u3o5aTc/+3gd+k+19LlW6Xo63Gtj3FgJgOeTW2w7azDYLWO2/jo4y6Udnsk46KWeD/hY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 403cbbded84e815d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXRkn2E66Ude0nvShXMUTVUiVHt3oDy1h6MW+zzWnRBp/TsE19X7Qe0LmdMN/0OqSozClvBdC7ru5pb4BIx2M1xsH6vhx/u54lwcedeNKPM55gJehPxlYI47/PXHYXiAW2FuusAlSTsmA4O3Ug1az3/vUijB0N8NsLavW/m4UoYj4l0gWkc0cT/B5tYs69QZKabtyoI0TlSktbZJPt5SiFObVJ+FwH55ProNbZPNuhINjL6PXENA0iRKx/bUXLUwYXkejyP5FKhhIY44KToKf2nFbnPzouAx8KS1rKWEcGQKrB0s5J1Q2WRDIIeDNKevuh80F9VJ3Xo/tUJtQScYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+Rx8v74VzjBt6a8QSS2J8yQqn3HjTq3wmVdtxONqGI=;
 b=QC3D+q6+w4KH+ZS9JK27Osc2HLrhFxZqHqSYLj+Ykk7IQVGBM6z4sfKDxGpfB5GsLD2MP5Cx9OQvYmqR5zynqhzidNODMamF8n+6dRNm/4OCmzKbD75055JlgRQwPG+hTRd2VTnWPzN+Zvbfr1gKYGc4x7IvZ/6p9IR2vwhBK8gmoDAf0WPvo/90VOccwa7SW/+XHGg1PTmfAetYQoZVDwnWYXhPf4QyrITaKNXS42Fwc5Md4n2JzXn+UWE7qjei7LJ+MvadPuE+pRwUTOA+ZkI1fdxkj2h+WkuQXxwXpLH1n5NPPmPj7YDwCInajRr9I4jNnn1xBdE5lCOadwqG3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+Rx8v74VzjBt6a8QSS2J8yQqn3HjTq3wmVdtxONqGI=;
 b=KgDd2B6qq0bDHsygif+3/RupqCXK0d2Z3uUK8X7JNlkFfqtpZG9Bvc8u4ViRvTcgxG9Kuq9BYyGLNhWJX2I660Rsi4gp50D3Rd3Lq83u3o5aTc/+3gd+k+19LlW6Xo63Gtj3FgJgOeTW2w7azDYLWO2/jo4y6Udnsk46KWeD/hY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] xen/arm: shutdown: Fix MISRA C 2012 Rule 8.4
 violation
Thread-Topic: [PATCH 1/3] xen/arm: shutdown: Fix MISRA C 2012 Rule 8.4
 violation
Thread-Index: AQHYhkrv8P1hRqUvVU6u7dH9Ml6t461bimSA
Date: Wed, 22 Jun 2022 15:19:40 +0000
Message-ID: <50F8F42B-F82B-4F9C-87B4-6090A5BB2B57@arm.com>
References: <20220622151514.545850-1-burzalodowa@gmail.com>
In-Reply-To: <20220622151514.545850-1-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c50cf1e6-8daf-4bb0-70e1-08da5462abdf
x-ms-traffictypediagnostic:
	HE1PR08MB2777:EE_|VE1EUR03FT018:EE_|AM4PR0802MB2369:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB2369DE00016D1BAFC760DA3D9DB29@AM4PR0802MB2369.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eeogQvMYQ0j5vlxBx0NLQ22Yyyej1xuvZEb7N/6czO1AmArGspWkbrL+IDWPKdHY6caqwPuRH0M+8ns86vDRGM8qph0BOZy8nxN6a9Q80Zo/qHINvuieekW0NSwwZy1ob6fF3h0NyFJUWABC+nQ/P/g6CCVS90SF6onSC+5lhOQd3DekkEQpqsSX5/MEJYiLqAD2XtAW1kqUrytdoBUK7HQK+OPzh7qBIitWzz1ZrlW8e43OnZrTkIjB8EP3zaSrczNTnBG9dXHjMFkgbofxX4Q4sGX1kUYVT5Uxupl40R6zo68RyJVd2QMD+dS7ly2Q39rqYDFoKqIejyWAYLw7cabS6ZEGtXLAxCXB7fZ5099W60/Ceiz9YogJFjCRpVKB0Fge3qVqkMx1CowREi5StIE01VE73mfsN0pypQfz2ROc58z59ZzplC/Dyh2bahNwrBRcbRYXAKgyHyQx40RiQdn37o19VkJCQnyO/sve9eQsFaK7HSf7PZO5A9EmEdvPKIxjDJKlrB+nJCFw3+oK0N+irXadot80ItMTx50emZ+cgUpOjwUxBx4Uan2OkKjg3B1UCCHbnHECBED++Yx9EFrK6J6k/kmffM9plvQLQpj2ehWgxSSy9QnEbWKPjVgi1/APUghw8akj9/PkdrB26rD1cUnYSdEFXbNSmbCjFmy3TwGOicW3CAptDxXbE2Yeeu56knXslduG95oi++LS7uDmY1jXgYKuy0AqbZdc2mg0UPh4h3DyjE0kz/YD9E7bfm5/pSKNpb9M6NFR7spMj3RA3jWLYhdRE2DeWOrssSw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(4744005)(4326008)(66446008)(76116006)(8676002)(5660300002)(66556008)(64756008)(66476007)(6486002)(8936002)(2906002)(66946007)(478600001)(91956017)(71200400001)(316002)(54906003)(6916009)(38100700002)(6512007)(26005)(2616005)(41300700001)(36756003)(33656002)(53546011)(186003)(38070700005)(86362001)(122000001)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5D1894C01791F04791D9F413697DC797@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2777
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee1cec48-0fda-4fa7-8e20-08da5462a0a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6hX9SLbx1w2Cl5Un1yZNzAx1k6UHqv+G9vYgd5DMQW7yU73wigPXjeT9YWlqkkJLQ8crEBXoPyWQAtCQy+CLkShLiokWtmIVUqG3XzpndffUFSol3GV/+W8bzy7BI/EUJlHczowkSOnJwupMuFkf4f/0blQPJlAe21OU2G0w5ABfCrA5+Al5arws9gCm/b17TyoD8GfW0gzqBPse04Txcuj/PXajtZabXmRuWWpVRUwPF6Rx6jrPqaKkRb4ctsLJVY597s4Lnx9RVe5tAWUgIXUYi1FRwxzyc9Uk2Pg2PRBLg6b0Fx3zgiBTHujZA5btTl7ztWL6MkRCFU3RHyOBFqs3Y3Wxo+ZICBE5jkQKry7cq47b5lfRUVB7UkioERm/Bu3KwErvZ3XFLtmmzrH/3EMIrsLGSZ0cJoQ40xLE27Is9D2mSZ7QUQJZb2y7LcDBuajO8frX56FUbLVxGMqNAzuPLf4ajbq3h/JeZBj4HtJeQzGNjcYckyHulHxz0wwMm7yQjl6XAJ52E4VgniLb0aHkFTQ4haW9QIklkGuwWL8WIUBoT4LI7JISfSpjHa0kZ5YeWortrtW02qlDh5k5Fp38PPbI3+rKOyuJt3RKZxidKZqHDW1Sz2UepVIjyr+y4HKw6RTxCG1h1sItqKvS0ZGyuTdJtgnh7+iKuWyvvv1wJ0k155JFcuaN99ruVVCA8n4cMxfjwAJIg/wvvhdXqtQbAiFKIiz3URv3i60OpRTAikh/I0U5rSndO/DU7ZYJhontDB7/OGIyzEGryKXL1w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(39860400002)(40470700004)(36840700001)(46966006)(4326008)(478600001)(70206006)(316002)(82740400003)(6486002)(81166007)(356005)(36860700001)(70586007)(336012)(186003)(83380400001)(54906003)(6512007)(107886003)(40460700003)(82310400005)(6862004)(26005)(33656002)(53546011)(36756003)(8936002)(40480700001)(5660300002)(8676002)(47076005)(41300700001)(86362001)(4744005)(2616005)(6506007)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 15:19:59.2172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c50cf1e6-8daf-4bb0-70e1-08da5462abdf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2369

Hi Xenia,

> On 22 Jun 2022, at 16:15, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>=20
> Include header <xen/shutdown.h> so that the declarations of the functions
> machine_halt() and machine_restart(), which have external linkage, are vi=
sible
> before the function definitions.
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/shutdown.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
> index 3dc6819d56..5550f50f61 100644
> --- a/xen/arch/arm/shutdown.c
> +++ b/xen/arch/arm/shutdown.c
> @@ -2,6 +2,7 @@
> #include <xen/cpu.h>
> #include <xen/delay.h>
> #include <xen/lib.h>
> +#include <xen/shutdown.h>
> #include <xen/smp.h>
> #include <asm/platform.h>
> #include <asm/psci.h>
> --=20
> 2.34.1
>=20


