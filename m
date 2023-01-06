Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA50B6602A2
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 15:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472701.733047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDo7n-0000MK-J9; Fri, 06 Jan 2023 14:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472701.733047; Fri, 06 Jan 2023 14:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDo7n-0000KR-GG; Fri, 06 Jan 2023 14:55:15 +0000
Received: by outflank-mailman (input) for mailman id 472701;
 Fri, 06 Jan 2023 14:55:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fu4g=5D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pDo7m-0008RI-AH
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 14:55:14 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2053.outbound.protection.outlook.com [40.107.247.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1efb52f5-8dd2-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 15:55:12 +0100 (CET)
Received: from DB9PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:10:1d9::8)
 by PAWPR08MB10090.eurprd08.prod.outlook.com (2603:10a6:102:367::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Fri, 6 Jan
 2023 14:55:10 +0000
Received: from DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::8a) by DB9PR02CA0003.outlook.office365.com
 (2603:10a6:10:1d9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 14:55:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT065.mail.protection.outlook.com (100.127.142.147) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.13 via Frontend Transport; Fri, 6 Jan 2023 14:55:09 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Fri, 06 Jan 2023 14:55:09 +0000
Received: from 24d18afe814d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7ADE9A14-D1A1-4072-95B3-5E69754B0C35.1; 
 Fri, 06 Jan 2023 14:54:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 24d18afe814d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Jan 2023 14:54:59 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8639.eurprd08.prod.outlook.com (2603:10a6:10:401::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 14:54:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%4]) with mapi id 15.20.5986.007; Fri, 6 Jan 2023
 14:54:56 +0000
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
X-Inumbo-ID: 1efb52f5-8dd2-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHgBBafFbsjAzJLPSAzRUNa0KLBtz3G/c8cHAzWDPrc=;
 b=qJQRTP7k13vjSQC/AluPAxNQ7JnPBFhal6DfVpLbDVJcnJBwQmsPvoBnjnLYRpORFrjkRBZJ6IFIaz7klFZiJmurfF6ZVtuhQOHMBneXQZJNSUqS6NjcojEZmjE/hGWiVtuWWv6jsjvf2LvfJpfgwIVsr26cvRb4znFq/E1r8js=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKsN0lqP4/0psYiA8OjdxuQR1XPZckPpQ8uQQst73D0cdGqVeEU3E7jONU85IXszsvCtyYCxKbupQM9FNgXaZGrCeBxsPZuVmeXyhrpfxRIOiPqXqhip/x522/bsKHJZ/0U+zQ0fyBv8WLI0MjdD7nXMgo4x3VRx2YqHuD+0pfDechbkU78nvViW6jTsf+CD+0I1qS3va45mJpuYSuZJncEOL23orR1VaJZ18yq5QaXJxfZbmsuaUrgRQ/yydCchtkG/xcawzsDRG87V7OArN+UyU+MlFWwCFLzvOGHO3T5RtRQRmXbYBV8LRNYRkjwUhOA9AIwVxGaL2ZM49yIE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHgBBafFbsjAzJLPSAzRUNa0KLBtz3G/c8cHAzWDPrc=;
 b=P2+juIv/+mzTcf1Rmd6Nval0zVoEGtfRUyyVFjkFSFcDGgsRrSovOdI47pnyJoiwCXixzo56verUBAOy35IAVWb2kbyT0K0qTN4uVaHDGNfnOvTdyUZTRpGNaRMWzMG598pWrjJM2QAqhvPQstohE8MHfzyK8jIZIAHlvhWIUBC6PedUn/EbrfH09P3LKnH7GHy1fKzOf04ZbvFdc6uLsHm89LTzVd3CFX4kMoTok65j+HvDesUmlFu8ag5JIUf25FXfIHOh3A3dTA/npYaHkH1Mt5fl5oTQ9y/pqTOchJLPsC7V/6PcQl62yYgLvUUqSg0PNgnfdAppTvLCde8sNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHgBBafFbsjAzJLPSAzRUNa0KLBtz3G/c8cHAzWDPrc=;
 b=qJQRTP7k13vjSQC/AluPAxNQ7JnPBFhal6DfVpLbDVJcnJBwQmsPvoBnjnLYRpORFrjkRBZJ6IFIaz7klFZiJmurfF6ZVtuhQOHMBneXQZJNSUqS6NjcojEZmjE/hGWiVtuWWv6jsjvf2LvfJpfgwIVsr26cvRb4znFq/E1r8js=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 20/22] xen/arm64: mm: Use per-pCPU page-tables
Thread-Topic: [PATCH 20/22] xen/arm64: mm: Use per-pCPU page-tables
Thread-Index: AQHZEUh12RKmuw645EafAVdnfeFYOK6RkuHg
Date: Fri, 6 Jan 2023 14:54:56 +0000
Message-ID:
 <AS8PR08MB7991125F288492FFD81F02BA92FB9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-21-julien@xen.org>
In-Reply-To: <20221216114853.8227-21-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B5732067FE3B8D43A75B9CD84A545DCE.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8639:EE_|DBAEUR03FT065:EE_|PAWPR08MB10090:EE_
X-MS-Office365-Filtering-Correlation-Id: ef139786-cb2b-4702-b1ec-08daeff601ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kapN2QfqB9/KdMesDdP8tuACJMOdi10pXNKAV+wdOGaH9PPRHqyZgNmNX3oBLLq0xLmQDyGbFBj2vDcCzsGvyrz0j53bjUbxSi40XDJlZb3QdeYrNN+G0sayWDm+xgydN8uoN2y9ILYDkVw+SP364Z34vC7tWsDXUzFuKlpuAwrL+2WwXon5bEM4vAFnEcHNVktzMd6GEXsAisHk0Ja8jIflNBJFpq/AGqHT8lYlR0VwGyeMhRKgmMCRerZAVV2Zezl82QXxRpTgwojuKfgg568TORrCRoaB2fvL8ZeBk9om/8fzrcUtUCTzA6aDxl0hLlzlMR7BSvUZFD4Qt1We6tPjqiEDAc+7niTbIWUOkhA4+e6cbzTEHL+SDdto+6hw08vATsY+lRiGn8UMnij9QKqk7VLI5bzdwdK7x7JESkFiI5a2lcSq6B2rPOZtyh4zZUba+tnHZ+2VhwoPV07SiNMpjZ0/3WFaMQ7DXfEN1f2XQ9jV/acHpaecxWxcy+/bIwT6Rsjk0PGQ+3V1n9Nyp3h6UkLI3tuCkh4g5uJc20ak5WaoAn2xOd0Rimml99kqmR+6mm3xefM50MD8rg+KYj+g8V/uQ+fyw7Z3xEtXP6Fgk4A6S8BsxT1YiMSck9R4Qi8JaDfoc5YHHiE44lptLmjnBUFVma5S/1TN6M8sNLJADOYTH8YihNbgGuUUV8LPD9VgPjiUeIMoHJXXzg0Ulg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(64756008)(66556008)(66476007)(54906003)(66446008)(8676002)(86362001)(66946007)(478600001)(52536014)(76116006)(41300700001)(4326008)(8936002)(5660300002)(33656002)(2906002)(316002)(83380400001)(186003)(9686003)(26005)(7696005)(6506007)(55016003)(71200400001)(38070700005)(110136005)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8639
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d7623bb5-f1fc-49b1-c157-08daeff5fa1d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XHipFpSUxuRkpmYA73We9iEN/twARRzJ9JWp4b8kD31H5L2LiedSxZtHs4Jxa2Fw/qp+F19TH2H+OXUlxKJj2rGjpGb8s7J1x4agO4rwo4dXz9+SLfA1FpGEFQv7TssYHh6IRiXEWV64/PokRkNNqw/2qwIzmnPNwdoPT7qXZfniEuPeBypI+8mwTs5R2ZFMvgodUscrW4ZXjBxLylWsSULcczB0zW00V36oudtXDZDnfcnDRMiN4YcQm7CtikF/i0Rqd1qVkhi5yLtVmBVoMsXnrZuGFhpEjS4NJlPTEgLQI6vHi6yPzRlO+nR8Mf0+U3yq67oj79lYIUmP1QiUNE1S8NIJ+HKk31IyGcJA1fMHeSQI/UBDASh4XE0/zCM2lg7xnH9KJVM/26/Fby91gikDouqL+ld1Gt7/y1fT4oh2AKDJsFr8dmPVxiDqryK2ygybJdzlLfb4aAAzSgyk31tJWUmHSd/sUOleWNJclP6vE6rFJtsbQnCqbvUzh0mwxCdp506Qj6Ubb0o7soJv+v+Hv+z4RfT4n5SL0OEdFz/8V32EzY2JZyHnjlPRjtP8qNC0vNFzJxCR4STL2Un1wwH8+gwlDEYgzLiOkZs9TXNXcCBS+nRrsaB8ZAAhpo5NrGj+6std+6psGW/++PttkYYJQjBneQffqf3Jf5SAkAE7F0dEi9bVvdycRFJ6H1M/HxYBABmki1jdxqlHfxORZg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39850400004)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(86362001)(83380400001)(36860700001)(356005)(70206006)(33656002)(4326008)(5660300002)(70586007)(52536014)(8676002)(2906002)(81166007)(41300700001)(478600001)(40480700001)(55016003)(6506007)(47076005)(186003)(26005)(107886003)(9686003)(54906003)(82310400005)(336012)(110136005)(316002)(82740400003)(40460700003)(7696005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 14:55:09.9472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef139786-cb2b-4702-b1ec-08daeff601ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10090

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 20/22] xen/arm64: mm: Use per-pCPU page-tables
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, on Arm64, every pCPU are sharing the same page-tables.

Nit: s/every pCPU are/ every pCPU is/

>=20
>  /*
> diff --git a/xen/arch/arm/include/asm/domain_page.h
> b/xen/arch/arm/include/asm/domain_page.h
> new file mode 100644
> index 000000000000..e9f52685e2ec
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/domain_page.h
> @@ -0,0 +1,13 @@
> +#ifndef __ASM_ARM_DOMAIN_PAGE_H__
> +#define __ASM_ARM_DOMAIN_PAGE_H__
> +
> +#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
> +bool init_domheap_mappings(unsigned int cpu);

I wonder if we can make this function "__init" as IIRC this function is onl=
y
used at Xen boot time, but since the original init_domheap_mappings()
is not "__init" anyway so this is not a strong argument.

> +#else
> +static inline bool init_domheap_mappings(unsigned int cpu)

(and also here)

Either you agree with above "__init" comment or not:
Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

