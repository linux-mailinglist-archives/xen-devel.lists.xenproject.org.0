Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3730888E347
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 14:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698547.1090351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTbV-0005NT-H2; Wed, 27 Mar 2024 13:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698547.1090351; Wed, 27 Mar 2024 13:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTbV-0005LH-E3; Wed, 27 Mar 2024 13:46:09 +0000
Received: by outflank-mailman (input) for mailman id 698547;
 Wed, 27 Mar 2024 13:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsR0=LB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rpTbU-0005LB-7K
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 13:46:08 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe02::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bf875ba-ec40-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 14:46:06 +0100 (CET)
Received: from DU6P191CA0066.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::6) by
 DU0PR08MB9485.eurprd08.prod.outlook.com (2603:10a6:10:42e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.32; Wed, 27 Mar 2024 13:46:04 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::db) by DU6P191CA0066.outlook.office365.com
 (2603:10a6:10:53e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 13:46:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 13:46:03 +0000
Received: ("Tessian outbound f0b355493f75:v300");
 Wed, 27 Mar 2024 13:46:03 +0000
Received: from 45719d047111.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E33D301F-E727-4F18-AD9A-9D2DF55F58C3.1; 
 Wed, 27 Mar 2024 13:45:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 45719d047111.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Mar 2024 13:45:57 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAXPR08MB7552.eurprd08.prod.outlook.com (2603:10a6:102:24f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 13:45:55 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 13:45:55 +0000
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
X-Inumbo-ID: 5bf875ba-ec40-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ifTCWZSTTBPd8sJAKpCzY8aMXYTX9MIW8o+OnYf6yRnrtI3YFausOmcgC0Tb5SrqN4P6xZxfasoK9VQvQ1DNRNrX+tuMAOhgfEidN+B7RG1Qa83O9BKNjE5UOnhyGNV5nEbiw2o78MCpHylhdAU9YqZRxzuTMGEzTdUKz0xvcraNQqI2oJas4nTVCsWJ1dPdK70qBp4DJdbRLCVHmxet+x0THZJCvw81VQ4iSJ32eRijz3AKHU5Z7fF0A3v4B/NRcYUTACJZqBHwGUEvApCdLBgEYLShmFxZBJa4/Y0uu6h8mT3ZpNDpfP15qLgp0btL+6oNlyhiixtdaUpFW3aiTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDG0K3cgENatIapr0eAsKQubWrXFg9yWBgRx6h7r57Q=;
 b=iSbXB/FB2Vzn2iwIEq5M5uIfDNMGR0q7rvHI337Kc39Ol+j3Qx0Q2LIa2FT51pOHFd8CnIKo2ayt+KDcrLUHXkGaaAQh9mV42LXQIkeVYh1eUnkh/msk3YpAd5LU4oDDgB9/1ESnbA6J3VUZKD50h5nxmMP3lVj/Q8hGbqFAI4QqgfxjoZ6NqQ/GedfbuvixtyyOvd+R8I2TNlSFzZVbkV+0qbcvt7DuSbPAubmclWSHEAS0PQQHiBGshAHU7JBZaUjboS7GmPZu9EZKlYycyQfxy715MIfiWw0PdNcKp7TkkuLoa8eHSGYk/LrhVW4w+Jc9HZMSlZ6nVfvgJg4seA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDG0K3cgENatIapr0eAsKQubWrXFg9yWBgRx6h7r57Q=;
 b=gwDvUMb+TGR/+WE7yUfFxlaS+G8/1d4xk7vszQyGuu0EPpDfUOo1GmRFp1UDY3zCbaNI/gdJ6KsXXVY/lKxvn1z8ZK3ev7qg0dwhDa/LzHw37VL3wl/0IlpxVt+eFNcyth7uuZkA3PdKAckBv+064+rg3hXYEnX5XYSBoksU7u4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b47475a917688b5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4RKJV3fqFh3nIU4NMcdxU0N1Jmwr4lDxNV2zN3r3tSl21VYpOuHA+J3YzC7J5c5MyYXLU5qHz3rPePKLQjTvElfhmM4MLLGMWAlFWFIcwu9hTOCyMc0JuM4YYQpP+U0wDch6Cz0GEnJhhWi68huTLIuFyG4FvQ5skuNgW69HkjL2epOaOv7wH0A6EMqYt2T0eGQH1Bz1IRpsGpyzW0eU7AS82r6pOtBecMLpoA7lXy/peI4JSLnemSQUNxoVJcawitgEO2+JTP7f5OQzMDFySGyqsE07XRzFPnZMG4APOji3LRHIhQA2CCeKZ+69DcPW5ndnF9O2rQZdY4BYyisPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDG0K3cgENatIapr0eAsKQubWrXFg9yWBgRx6h7r57Q=;
 b=m6rYYnoO11DjR/qEPrx3/VTqHFKlobq/HVpLjiz2VAEgy6Ho8aFbuF4RQQD587ZCVmg2VBNPmRpSzwxMmXLWFd2JiV8Sh8OHfKKw8rNSlZP3TuO8M4T08g/Up9tg74HXjaSCy75DycWoF0BJeDqTN+IUUBjMq1OqWw3jlY73vXVmcUwd8EbDtRyqM10Y2q/bW6YTfkXvh6JyOPfIbE7uK+QTfsm0hto3qWBmDUXa248TTPJsiL29f3w9vYzWvujxfbMpwe5Kje7dlwRh22uaeWwFU77AuR0VgvVWpzXbMmml9qSDLg16d4d7LH5MWXtMsvJFPfTbq+oO85jcdjjGUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDG0K3cgENatIapr0eAsKQubWrXFg9yWBgRx6h7r57Q=;
 b=gwDvUMb+TGR/+WE7yUfFxlaS+G8/1d4xk7vszQyGuu0EPpDfUOo1GmRFp1UDY3zCbaNI/gdJ6KsXXVY/lKxvn1z8ZK3ev7qg0dwhDa/LzHw37VL3wl/0IlpxVt+eFNcyth7uuZkA3PdKAckBv+064+rg3hXYEnX5XYSBoksU7u4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH 6/6] xen/arm: ffa: support FFA_FEATURES
Thread-Topic: [XEN PATCH 6/6] xen/arm: ffa: support FFA_FEATURES
Thread-Index: AQHafphUyax1RiAti0Sh0JOrQKKl8bFLnPGA
Date: Wed, 27 Mar 2024 13:45:55 +0000
Message-ID: <47DB3F44-79F5-4245-BC02-A33A5D3E229E@arm.com>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
 <20240325093904.3466092-7-jens.wiklander@linaro.org>
In-Reply-To: <20240325093904.3466092-7-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAXPR08MB7552:EE_|DB5PEPF00014B94:EE_|DU0PR08MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: fe31d09e-10b8-49b5-6658-08dc4e643ede
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fBaHSBy6bzJBtZO/382hk3h3N2MPeNg7FKgqSIGN9LEtlXKT/EJdnTmq1rlc8NdfEOCAZxE4NI+Fj3LohNGRcPs1VcbW/NiqrZ7JOA5TFi2bmoYdRzXl2yNC3On7jtq6cB4j6flQOdXpzijYVDon47x4v2ALRQnBqOvyp+ZCbAd7BTsvNgT75okOcMFnWA0yOjQOHA6FUKbD1GXc6YaaEWzTe4M/oFDx2aHktVuk3vr7FglY1Lus81WcLAHddxeJIBBjgA3Yov5v1ykso1qMSCb3Y4Dxt4gY8gyb2CylaEjicZ+GsSoT42Iz0tzd6VMNotg+O7NldhbK5I6YX6/+SOwVwatxdGQLr5vzq1M5bn9dbZUQUSP8TWxtTZCMa3hJybPsQkaOYNny/VMM6JiQRebDtcGhBzyaa1N+2Ro03QYrQKW8nzBS031OMvPkWDu1Hqcf1as9MyfAhyA6etRFMCFKUFSzkGSkp9SmR2PuaAPBOUvmlHGkmheF5VRMF8u9SK9tmsyIalUn0D+miGVh7m/verS64TC855c+dsXxwzQpx/ZM9NUqHLrdE2UWtFN3paBHv0Wh/ki+s+1+par4hIktoV5HRvNBtfVf3PF6kIjJfX2oKWKOeu/Qe/xWHRfWjq3voyiGqbpP0PiX+5nOwfcd9XvPCP/dkg2dpxhVeSNAFsVXJ62/gAOfYKGWktw70xQTiNewDWKhC+ZkRu/Z7g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5247E8DB33D2134DAFBFC601F60004D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7552
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f7213424-70a4-4a3f-b2de-08dc4e6439da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cgAUxIcsPqsHvFsV6Rh33VPXAQVp7zA5skNDotHWnL8WScx/4ZjXbnW/iwT4ilvfgd5PJo9sdVK/5/ad5iSCgT5fMzur/QOgewE2AlD9TVvcVzbinAeyTzWXMDvX0aKTVwFb64WlNRP/AMTCLZYPaT8B3KbVWswxMkt2syZyS+71ycIO2y06bEgA5YtHJ0rVK2orMB/hF8eyby4WoWJGZ1olVqfINK+4OX8Owu7BZ+WYnF91RlAay3styca2E9YANI8Nj1zrM5Jjd0rbn2vD0XdNnyr4vpHY7DAcmOSOnVIWsY6LBqP+zo5wNbYB9NsYN7lSrDpoqISTDmSy76ROW98zVgh0xtB/8RO19NXLd2xYAtiGYudiHnSkdJfdFPaAtuWbgR6IuQoBDBMMvFwblfA+jaeRraeYhCPCZCk/aGOZ2p7g8S1aRW6X5UiRmcvqItnA5gKlrbEXebsLy5vsNIv5YvVWYUyywMzd8eGnQknrAMxVKUgC3i2G8RQZJ/L7B7VQaZGi/iJJwOe8FatuzfLCoKtf8h7HeuBGbrYZRYW1zZX6+l62GW8tU4iRtwziBcs1KOqEvxZz6XL72KfEFMEZbpjA2fy6LI9kfrKfZ3ak2sx5+Peiwqyy+UQHv08VMR1tnTcDY2JawxrBCIcdFavaX6e9MxLnMRVTzhFf6N9AC4d/m9hsafTB3P5Z2LbDRcf5bRL8zXFlikILjwidP1sV1l0LmK/G4tt7UEboeFaLFMPieALsmzrqaFKh1H+b
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 13:46:03.8070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe31d09e-10b8-49b5-6658-08dc4e643ede
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9485

Hi Jens,

> On 25 Mar 2024, at 10:39, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Add support for the mandatory FF-A ABI function FFA_FEATURES.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 57 ++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 57 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 4f7775b8c890..8665201e34a9 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -192,6 +192,60 @@ out:
>                  resp.a7 & mask);
> }
>=20
> +static void handle_features(struct cpu_user_regs *regs)
> +{
> +    uint32_t a1 =3D get_user_reg(regs, 1);
> +    unsigned int n;
> +
> +    for ( n =3D 2; n <=3D 7; n++ )
> +    {
> +        if ( get_user_reg(regs, n) )
> +        {
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +            return;
> +        }
> +    }
> +
> +    switch ( a1 )
> +    {
> +    case FFA_ERROR:
> +    case FFA_VERSION:
> +    case FFA_SUCCESS_32:
> +    case FFA_SUCCESS_64:
> +    case FFA_FEATURES:
> +    case FFA_ID_GET:
> +    case FFA_RX_RELEASE:
> +    case FFA_RXTX_UNMAP:
> +    case FFA_MEM_RECLAIM:
> +    case FFA_PARTITION_INFO_GET:
> +    case FFA_MSG_SEND_DIRECT_REQ_32:
> +    case FFA_MSG_SEND_DIRECT_REQ_64:
> +        ffa_set_regs_success(regs, 0, 0);
> +        break;
> +    case FFA_MEM_SHARE_64:
> +    case FFA_MEM_SHARE_32:
> +        /*
> +         * We currently don't support dynamically allocated buffers. Rep=
ort
> +         * that with 0 in bit[0] of w2.
> +         */
> +        ffa_set_regs_success(regs, 0, 0);
> +        break;
> +    case FFA_RXTX_MAP_64:
> +    case FFA_RXTX_MAP_32:
> +        /*
> +         * We currently support 4k pages only, report that as 00 in
> +         * bit[0:1] in w0. This needs to be revised if Xen page size
> +         * differs from FFA_PAGE_SIZE (SZ_4K).
> +         */
> +        BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
> +        ffa_set_regs_success(regs, 0, 0);
> +        break;
> +    default:
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
> +    }
> +}
> +
> static bool ffa_handle_call(struct cpu_user_regs *regs)
> {
>     uint32_t fid =3D get_user_reg(regs, 0);
> @@ -212,6 +266,9 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>     case FFA_ID_GET:
>         ffa_set_regs_success(regs, ffa_get_vm_id(d), 0);
>         return true;
> +    case FFA_FEATURES:
> +        handle_features(regs);
> +        return true;
>     case FFA_RXTX_MAP_32:
>     case FFA_RXTX_MAP_64:
>         e =3D ffa_handle_rxtx_map(fid, get_user_reg(regs, 1),
> --=20
> 2.34.1
>=20


