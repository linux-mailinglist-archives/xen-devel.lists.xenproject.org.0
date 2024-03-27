Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF4788E2B2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 14:32:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698520.1090271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTNt-00077O-Ds; Wed, 27 Mar 2024 13:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698520.1090271; Wed, 27 Mar 2024 13:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTNt-00075L-90; Wed, 27 Mar 2024 13:32:05 +0000
Received: by outflank-mailman (input) for mailman id 698520;
 Wed, 27 Mar 2024 13:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsR0=LB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rpTNr-00074Q-56
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 13:32:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64f0afb8-ec3e-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 14:32:02 +0100 (CET)
Received: from AS9PR06CA0655.eurprd06.prod.outlook.com (2603:10a6:20b:46f::23)
 by PAVPR08MB9860.eurprd08.prod.outlook.com (2603:10a6:102:2f4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 13:31:51 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:46f:cafe::14) by AS9PR06CA0655.outlook.office365.com
 (2603:10a6:20b:46f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 13:31:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 13:31:50 +0000
Received: ("Tessian outbound 9b7417e2a8eb:v300");
 Wed, 27 Mar 2024 13:31:50 +0000
Received: from 5e7968fe18d6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1E4575F4-CAA9-4E33-8CF4-C8ED2874F09E.1; 
 Wed, 27 Mar 2024 13:31:44 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5e7968fe18d6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Mar 2024 13:31:44 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB10365.eurprd08.prod.outlook.com (2603:10a6:10:40b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 13:31:40 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 13:31:40 +0000
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
X-Inumbo-ID: 64f0afb8-ec3e-11ee-afe3-a90da7624cb6
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GTfuLr0lcu2vCPSImIz7ux+2ecz40YVN/ogDKV/x6g9ZbfL9FTHyhRTCchZwUW1Olxg4gFDxkvFAk0byklAHkLx7O6XhngvMqN8YR9f6SrDz/xcf62V4l4t2udVcd9wXc4KgxW6BH1F9Ewkh4BQOFh58TM2WR9o2Q5rxSOeRPwDFtuL6aGbMxb9B1qgubCpP08RDbZhenT8l39/i95Z5aiRRd6Akd299ZqUYzkgnF7RXe9IoWrwnDcsULzCG1y6CQSc3iMjo2D9i8No6CPuD4+ZpA/iL1AgYhqsdUuyfZIZ9nzcTSK4IztIrBXekZZEowjM2FaBCABUnEIVwkPxE6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27Wcir1lIebZdaz3UTVKwTNNDstzA0GpTo7Lw7N4n1g=;
 b=mnSuWqfjQ8D/z1dkckJeKsbuiHSDJmozDskSAhamEgWBYnEG7OCApkEShEwPBvHdgD+PlCQiOgQt7IO8EAe9kxBgpWGlk4DqOst7LzaUeHbJwtLuorEXiDrhfXc7nCiahdyZyT/anp//c6vzhY2+3kCN00rl/jXeWkpKSecuLp7zPqqiWuBpSS9pZX19P9HByWQetOk8MeaanxYBczZH2LkVoAY6NqO+MpDSXD7pRzRZ0Ok6clkpMIcx5duqIoT0J7I5R+Hfq6alf5kHBXlZvy+yzM1y/V93LoVTSup0BEJcmZVIxbdjAXziVZC/mzUAIDbQ+A3pjQo4lk/ql1NM0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27Wcir1lIebZdaz3UTVKwTNNDstzA0GpTo7Lw7N4n1g=;
 b=JfrTdPSN7e/topHC0mr8eyOBumLzp/2GqesQmBbJDAS1WdoZK9G27FK85gPu5VUdX1C9AUtK6YIXwacTHh5f4lmgwxJ5QoVgyOQb7LIB4a/GBnGpLfM5d4tnxrUA1/qwNGD2SlBLIyIz1S81oNjZpS5DHkkgaMVm6GcH+aQ1T7M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 03977261528c8145
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JukT32kj0CHIr8J1t9Dg9yeQAroR96y6f8xNDQtklfj7xCJWOI9NUN1Fe89fxylxts6sxyFSZ88gCmvJSuPqi0eaW6hvR5dyiE6eH9lJpih8cgfeovqzLOkorqsRnj4SQV2YauZPxQ0ULn9p2FlRdP4kVINiPtAAqVXt0LmVBUpLCSPsKHotJsnssoroepfzJErC0xL6Vi9SjyRPkwIoS67+6fH/CyFt3OatxwSHfExR4zcCkrXKW9m2jGYnXJpjR2o+c8Vja1Ca3jKmQh6FlnJSeZCFI8fqB2wejyeprTxwYkzQcQLA+ZPbXicH5Wog4EkSW0Bivp4BBbgCcwKf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27Wcir1lIebZdaz3UTVKwTNNDstzA0GpTo7Lw7N4n1g=;
 b=XEKekMJ5M5jHkM3H/G3tFEVZmVGZKjqPEenFrrGwAMXWH8WOAsCenPg3Z5ys3Zyhgvplzc3bCNCELAKbwEBIsqlXpJMvdl8pz3CAc7ioEx7iaOfTv1SqXHl94z+2CpcJwHkhlKrYIcubRqBAeW2slFldcTY1smGQIoEY4EsiwURzEQnN/SWqSGQRc/VAIf9+JxOjG3TgW2uV8/4YPBwoJibJl/eB8qx9YmwfRK0SG89B5SDv2m2ejQ80aN85JnvCZipVABBE1zqck0hgsfFhxRATJSKYCnd+c8VFWDtGGQ69fv6uaQ6jU37tzVNrDK8Ib7xbKdNWullLC5oUTPphmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27Wcir1lIebZdaz3UTVKwTNNDstzA0GpTo7Lw7N4n1g=;
 b=JfrTdPSN7e/topHC0mr8eyOBumLzp/2GqesQmBbJDAS1WdoZK9G27FK85gPu5VUdX1C9AUtK6YIXwacTHh5f4lmgwxJ5QoVgyOQb7LIB4a/GBnGpLfM5d4tnxrUA1/qwNGD2SlBLIyIz1S81oNjZpS5DHkkgaMVm6GcH+aQ1T7M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH 1/6] xen/arm: ffa: rename functions to use ffa_ prefix
Thread-Topic: [XEN PATCH 1/6] xen/arm: ffa: rename functions to use ffa_
 prefix
Thread-Index: AQHafphXKCJs/9w9PkiuEvBYvK9zqbFLmPWA
Date: Wed, 27 Mar 2024 13:31:40 +0000
Message-ID: <ABA538D6-79D4-4486-9B96-31EB1FBA5539@arm.com>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
 <20240325093904.3466092-2-jens.wiklander@linaro.org>
In-Reply-To: <20240325093904.3466092-2-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB10365:EE_|AMS0EPF00000198:EE_|PAVPR08MB9860:EE_
X-MS-Office365-Filtering-Correlation-Id: 4296d025-cf61-4649-8685-08dc4e624280
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EV9FAzzdm3zggf1Zh4zqGThZ37SCV6KcHsxR8iUTALKjQftx7JK1W7i6yEbQIovCgibmgbYfZzVHIIwcUqzfh0N6ZqWxnayo7xqb4Tw1/fdOGHuZqLCdjFmlBgdp1yhZOQroNhbbDTlok8y3kT7EFdKQtJRWwIInbZjs27cMHhT3zKhSpZ7kyBDKVZ3Ltv2zmvv9xJxbBMa7lx8mxcYb/Hso5C75pp8FfbPR1ya5iNJ5aCwo3empiOyJrrDphpRmiOKwd22rAmRYgcl22iaNQFZEtuvg3rn7eMWev8c6u7O8NxE1gdC8gC3//jm7QAXTXoPrGJK3uPI9Q8w7Hkp/iiL14N/CIvWCi/zYzC3pJ9Te/xVTe3/PTRKFoNNDfvNFZZYTW4nRl9kAQ3Zfn7ahNNHsEbLtNDzJFbgKrt33L/nS3tyRfEn3rYpJCLzes6Dx+N151CR0dXhK7WSzYYef9lytLUIBcZg9QYN6BMz+gPp4uu7z4ZkvF1nmw1RdNy1s3S46S59oCssPVbSoeKGUF46cBtrw1iQ4eVslo/fkFpqk8V9mj+h1edrE5RcZyE8GkEem5GbnRFtLjuK+2v6KcwDIMvtk0lL15bY+Oi6RYDrpojHhAcgcBOU1r26NnEGY4NOi0ECY013YUpeph6C/c5TsSj5nQGljZrKtrW2WwLPA+SelSx242M8po1SJ6TnE4q0R+nNopcNJ0krOMXvB5CtVffzuiLLUK4fO6byCqgs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <496C4C137097BF49BE6480F28EC05E3C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10365
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a6109ef-7b7a-4429-a196-08dc4e623c20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NrEdx7O+HeHJQXn59psDfubvmDZ4gT0/LfGTrdN6IeAtuZvs3KxeHbkLaW+N3rOVi3+T3E16br8fRRlBCvCx7zXfXozWCg94w2UejIAl0PugLwm40Y+FkDmxCNzuPLzGsKYvp1dkJB+QP6i0H1tAal+pcaSjNi0q8OTKQjEG68xvomJSLox67UE5cV4FM+Q2IQ24ALYPg5nn8cqL1tP26SnfR3frSynYpuyorFxKoi8BaoHcRqV5pXKsuRji569M3isXv8eeGjoxDTeqlg19/58VfFuDYhSyGpRS541Go5fOjKUaSbs4qbulk1JegurpuAQ5nSGV4ENaeL3bwVCWxzJWHUZtg7yOz+pJt9M+ukXWacVvHUKO+xBYdcJMu47dHBdZpkmCnNSXUAB45KtI5De1x5XpEN3OLYeUAnv8glrxXctMM18kFPh2kzqB+NSr6BDscUE+O8ru3I6z2Y97wQfvjHEEupFuRZQPkfbzcyQTRFQzsL+SQ5SlWb5sHPaR6FNUHJtQpCXhOI+b1/iH+ShrlJiBIl+wZVNhrlYfVRkuPXzfHHMQe/u0yUGFTih6/VJbclZBL589qINbkr1gjjk11dKv4P1XwYK49TYmS/x8OS87R09TurO3HwdiDGgLTiaxOle8rC8k9IY494jpitZKHs7F2i/qe+UEckf4r9ojtEAgITt8YTkc+bYXzELR4ZRYv3ccpWLaj2ZmnrNbV6yJZ4QHvXj5zl0wMIZi4UVU8a3RTHxREhlBIaEibBvx
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 13:31:50.8467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4296d025-cf61-4649-8685-08dc4e624280
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9860

Hi Jens,

> On 25 Mar 2024, at 10:38, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Prepare to separate into modules by renaming functions that will need
> new names when becoming non-static in the following commit.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 125 +++++++++++++++++++++--------------------
> 1 file changed, 65 insertions(+), 60 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 9a05dcede17a..0344a0f17e72 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -4,7 +4,7 @@
>  *
>  * Arm Firmware Framework for ARMv8-A (FF-A) mediator
>  *
> - * Copyright (C) 2023  Linaro Limited
> + * Copyright (C) 2023-2024  Linaro Limited
>  *
>  * References:
>  * FF-A-1.0-REL: FF-A specification version 1.0 available at
> @@ -473,7 +473,7 @@ static bool ffa_get_version(uint32_t *vers)
>     return true;
> }
>=20
> -static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
> +static int32_t ffa_get_ret_code(const struct arm_smccc_1_2_regs *resp)
> {
>     switch ( resp->a0 )
>     {
> @@ -504,7 +504,7 @@ static int32_t ffa_simple_call(uint32_t fid, register=
_t a1, register_t a2,
>=20
>     arm_smccc_1_2_smc(&arg, &resp);
>=20
> -    return get_ffa_ret_code(&resp);
> +    return ffa_get_ret_code(&resp);
> }
>=20
> static int32_t ffa_features(uint32_t id)
> @@ -546,7 +546,7 @@ static int32_t ffa_partition_info_get(uint32_t w1, ui=
nt32_t w2, uint32_t w3,
>=20
>     arm_smccc_1_2_smc(&arg, &resp);
>=20
> -    ret =3D get_ffa_ret_code(&resp);
> +    ret =3D ffa_get_ret_code(&resp);
>     if ( !ret )
>     {
>         *count =3D resp.a2;
> @@ -654,15 +654,16 @@ static int32_t ffa_direct_req_send_vm(uint16_t sp_i=
d, uint16_t vm_id,
>     return res;
> }
>=20
> -static uint16_t get_vm_id(const struct domain *d)
> +static uint16_t ffa_get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
>     return d->domain_id + 1;
> }
>=20
> -static void set_regs(struct cpu_user_regs *regs, register_t v0, register=
_t v1,
> -                     register_t v2, register_t v3, register_t v4, regist=
er_t v5,
> -                     register_t v6, register_t v7)
> +static void ffa_set_regs(struct cpu_user_regs *regs, register_t v0,
> +                         register_t v1, register_t v2, register_t v3,
> +                         register_t v4, register_t v5, register_t v6,
> +                         register_t v7)
> {
>         set_user_reg(regs, 0, v0);
>         set_user_reg(regs, 1, v1);
> @@ -674,15 +675,15 @@ static void set_regs(struct cpu_user_regs *regs, re=
gister_t v0, register_t v1,
>         set_user_reg(regs, 7, v7);
> }
>=20
> -static void set_regs_error(struct cpu_user_regs *regs, uint32_t error_co=
de)
> +static void ffa_set_regs_error(struct cpu_user_regs *regs, uint32_t erro=
r_code)
> {
> -    set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
> +    ffa_set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
> }
>=20
> -static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
> +static void ffa_set_regs_success(struct cpu_user_regs *regs, uint32_t w2=
,
>                              uint32_t w3)
> {
> -    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> +    ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> }
>=20
> static void handle_version(struct cpu_user_regs *regs)
> @@ -697,11 +698,11 @@ static void handle_version(struct cpu_user_regs *re=
gs)
>         vers =3D FFA_VERSION_1_1;
>=20
>     ctx->guest_vers =3D vers;
> -    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> +    ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> }
>=20
> -static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
> -                                register_t rx_addr, uint32_t page_count)
> +static uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
> +    register_t rx_addr, uint32_t page_count)
> {
>     uint32_t ret =3D FFA_RET_INVALID_PARAMETERS;
>     struct domain *d =3D current->domain;
> @@ -789,7 +790,7 @@ static void rxtx_unmap(struct ffa_ctx *ctx)
>     ctx->rx_is_free =3D false;
> }
>=20
> -static uint32_t handle_rxtx_unmap(void)
> +static uint32_t ffa_handle_rxtx_unmap(void)
> {
>     struct domain *d =3D current->domain;
>     struct ffa_ctx *ctx =3D d->arch.tee;
> @@ -802,9 +803,10 @@ static uint32_t handle_rxtx_unmap(void)
>     return FFA_RET_OK;
> }
>=20
> -static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint3=
2_t w3,
> -                                         uint32_t w4, uint32_t w5,
> -                                         uint32_t *count, uint32_t *fpi_=
size)
> +static int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2,
> +                                             uint32_t w3, uint32_t w4,
> +                                             uint32_t w5, uint32_t *coun=
t,
> +                                             uint32_t *fpi_size)
> {
>     int32_t ret =3D FFA_RET_DENIED;
>     struct domain *d =3D current->domain;
> @@ -883,7 +885,7 @@ out:
>     return ret;
> }
>=20
> -static int32_t handle_rx_release(void)
> +static int32_t ffa_handle_rx_release(void)
> {
>     int32_t ret =3D FFA_RET_DENIED;
>     struct domain *d =3D current->domain;
> @@ -916,7 +918,7 @@ static void handle_msg_send_direct_req(struct cpu_use=
r_regs *regs, uint32_t fid)
>         mask =3D GENMASK_ULL(31, 0);
>=20
>     src_dst =3D get_user_reg(regs, 1);
> -    if ( (src_dst >> 16) !=3D get_vm_id(d) )
> +    if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
>     {
>         resp.a0 =3D FFA_ERROR;
>         resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
> @@ -949,8 +951,9 @@ static void handle_msg_send_direct_req(struct cpu_use=
r_regs *regs, uint32_t fid)
>     }
>=20
> out:
> -    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & ma=
sk,
> -             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 & m=
ask);
> +    ffa_set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 =
& mask,
> +                 resp.a4 & mask, resp.a5 & mask, resp.a6 & mask,
> +                 resp.a7 & mask);
> }
>=20
> /*
> @@ -1249,7 +1252,7 @@ static int read_mem_transaction(uint32_t ffa_vers, =
const void *buf, size_t blen,
>     return 0;
> }
>=20
> -static void handle_mem_share(struct cpu_user_regs *regs)
> +static void ffa_handle_mem_share(struct cpu_user_regs *regs)
> {
>     uint32_t tot_len =3D get_user_reg(regs, 1);
>     uint32_t frag_len =3D get_user_reg(regs, 2);
> @@ -1318,7 +1321,7 @@ static void handle_mem_share(struct cpu_user_regs *=
regs)
>         goto out_unlock;
>     }
>=20
> -    if ( trans.sender_id !=3D get_vm_id(d) )
> +    if ( trans.sender_id !=3D ffa_get_vm_id(d) )
>     {
>         ret =3D FFA_RET_INVALID_PARAMETERS;
>         goto out_unlock;
> @@ -1402,9 +1405,9 @@ out_unlock:
>=20
> out_set_ret:
>     if ( ret =3D=3D 0)
> -            set_regs_success(regs, handle_lo, handle_hi);
> +            ffa_set_regs_success(regs, handle_lo, handle_hi);
>     else
> -            set_regs_error(regs, ret);
> +            ffa_set_regs_error(regs, ret);
> }
>=20
> /* Must only be called with ctx->lock held */
> @@ -1419,7 +1422,7 @@ static struct ffa_shm_mem *find_shm_mem(struct ffa_=
ctx *ctx, uint64_t handle)
>     return NULL;
> }
>=20
> -static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
> +static int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags)
> {
>     struct domain *d =3D current->domain;
>     struct ffa_ctx *ctx =3D d->arch.tee;
> @@ -1471,41 +1474,42 @@ static bool ffa_handle_call(struct cpu_user_regs =
*regs)
>         handle_version(regs);
>         return true;
>     case FFA_ID_GET:
> -        set_regs_success(regs, get_vm_id(d), 0);
> +        ffa_set_regs_success(regs, ffa_get_vm_id(d), 0);
>         return true;
>     case FFA_RXTX_MAP_32:
>     case FFA_RXTX_MAP_64:
> -        e =3D handle_rxtx_map(fid, get_user_reg(regs, 1), get_user_reg(r=
egs, 2),
> -                            get_user_reg(regs, 3));
> +        e =3D ffa_handle_rxtx_map(fid, get_user_reg(regs, 1),
> + get_user_reg(regs, 2), get_user_reg(regs, 3));
>         if ( e )
> -            set_regs_error(regs, e);
> +            ffa_set_regs_error(regs, e);
>         else
> -            set_regs_success(regs, 0, 0);
> +            ffa_set_regs_success(regs, 0, 0);
>         return true;
>     case FFA_RXTX_UNMAP:
> -        e =3D handle_rxtx_unmap();
> +        e =3D ffa_handle_rxtx_unmap();
>         if ( e )
> -            set_regs_error(regs, e);
> +            ffa_set_regs_error(regs, e);
>         else
> -            set_regs_success(regs, 0, 0);
> +            ffa_set_regs_success(regs, 0, 0);
>         return true;
>     case FFA_PARTITION_INFO_GET:
> -        e =3D handle_partition_info_get(get_user_reg(regs, 1),
> -                                      get_user_reg(regs, 2),
> -                                      get_user_reg(regs, 3),
> -                                      get_user_reg(regs, 4),
> -                                      get_user_reg(regs, 5), &count, &fp=
i_size);
> +        e =3D ffa_handle_partition_info_get(get_user_reg(regs, 1),
> +                                          get_user_reg(regs, 2),
> +                                          get_user_reg(regs, 3),
> +                                          get_user_reg(regs, 4),
> +                                          get_user_reg(regs, 5), &count,
> +                                          &fpi_size);
>         if ( e )
> -            set_regs_error(regs, e);
> +            ffa_set_regs_error(regs, e);
>         else
> -            set_regs_success(regs, count, fpi_size);
> +            ffa_set_regs_success(regs, count, fpi_size);
>         return true;
>     case FFA_RX_RELEASE:
> -        e =3D handle_rx_release();
> +        e =3D ffa_handle_rx_release();
>         if ( e )
> -            set_regs_error(regs, e);
> +            ffa_set_regs_error(regs, e);
>         else
> -            set_regs_success(regs, 0, 0);
> +            ffa_set_regs_success(regs, 0, 0);
>         return true;
>     case FFA_MSG_SEND_DIRECT_REQ_32:
>     case FFA_MSG_SEND_DIRECT_REQ_64:
> @@ -1513,21 +1517,21 @@ static bool ffa_handle_call(struct cpu_user_regs =
*regs)
>         return true;
>     case FFA_MEM_SHARE_32:
>     case FFA_MEM_SHARE_64:
> -        handle_mem_share(regs);
> +        ffa_handle_mem_share(regs);
>         return true;
>     case FFA_MEM_RECLAIM:
> -        e =3D handle_mem_reclaim(regpair_to_uint64(get_user_reg(regs, 2)=
,
> -                                                 get_user_reg(regs, 1)),
> -                               get_user_reg(regs, 3));
> +        e =3D ffa_handle_mem_reclaim(regpair_to_uint64(get_user_reg(regs=
, 2),
> +                                                     get_user_reg(regs, =
1)),
> +                                   get_user_reg(regs, 3));
>         if ( e )
> -            set_regs_error(regs, e);
> +            ffa_set_regs_error(regs, e);
>         else
> -            set_regs_success(regs, 0, 0);
> +            ffa_set_regs_success(regs, 0, 0);
>         return true;
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> -        set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>         return true;
>     }
> }
> @@ -1593,12 +1597,12 @@ static int ffa_domain_init(struct domain *d)
>=20
>     for ( n =3D 0; n < subscr_vm_created_count; n++ )
>     {
> -        res =3D ffa_direct_req_send_vm(subscr_vm_created[n], get_vm_id(d=
),
> +        res =3D ffa_direct_req_send_vm(subscr_vm_created[n], ffa_get_vm_=
id(d),
>                                      FFA_MSG_SEND_VM_CREATED);
>         if ( res )
>         {
>             printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u=
 to  %u: res %d\n",
> -                   get_vm_id(d), subscr_vm_created[n], res);
> +                   ffa_get_vm_id(d), subscr_vm_created[n], res);
>             break;
>         }
>     }
> @@ -1620,13 +1624,13 @@ static void send_vm_destroyed(struct domain *d)
>         if ( !test_bit(n, ctx->vm_destroy_bitmap) )
>             continue;
>=20
> -        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id=
(d),
> +        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], ffa_get_v=
m_id(d),
>                                      FFA_MSG_SEND_VM_DESTROYED);
>=20
>         if ( res )
>         {
>             printk(XENLOG_ERR "%pd: ffa: Failed to report destruction of =
vm_id %u to %u: res %d\n",
> -                   d, get_vm_id(d), subscr_vm_destroyed[n], res);
> +                   d, ffa_get_vm_id(d), subscr_vm_destroyed[n], res);
>         }
>=20
>         /*
> @@ -1640,7 +1644,7 @@ static void send_vm_destroyed(struct domain *d)
>     }
> }
>=20
> -static void reclaim_shms(struct domain *d)
> +static void ffa_reclaim_shms(struct domain *d)
> {
>     struct ffa_ctx *ctx =3D d->arch.tee;
>     struct ffa_shm_mem *shm, *tmp;
> @@ -1699,7 +1703,7 @@ static void ffa_domain_teardown_continue(struct ffa=
_ctx *ctx, bool first_time)
>     struct ffa_ctx *next_ctx =3D NULL;
>=20
>     send_vm_destroyed(ctx->teardown_d);
> -    reclaim_shms(ctx->teardown_d);
> +    ffa_reclaim_shms(ctx->teardown_d);
>=20
>     if ( ctx->shm_count ||
>          !bitmap_empty(ctx->vm_destroy_bitmap, subscr_vm_destroyed_count)=
 )
> @@ -1719,7 +1723,8 @@ static void ffa_domain_teardown_continue(struct ffa=
_ctx *ctx, bool first_time)
>     {
>         /*
>          * domain_destroy() might have been called (via put_domain() in
> -         * reclaim_shms()), so we can't touch the domain structure anymo=
re.
> +         * ffa_reclaim_shms()), so we can't touch the domain structure
> +         * anymore.
>          */
>         xfree(ctx);
>=20
> --=20
> 2.34.1
>=20


