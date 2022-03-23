Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E257A4E4EB9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 09:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293805.499230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWwjn-0003m3-Kp; Wed, 23 Mar 2022 08:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293805.499230; Wed, 23 Mar 2022 08:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWwjn-0003jh-Hf; Wed, 23 Mar 2022 08:53:03 +0000
Received: by outflank-mailman (input) for mailman id 293805;
 Wed, 23 Mar 2022 08:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJbR=UC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nWwjl-0003jb-LH
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 08:53:01 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe02::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a473e852-aa86-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 09:53:00 +0100 (CET)
Received: from AM6P194CA0081.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::22)
 by DB6PR0802MB2312.eurprd08.prod.outlook.com (2603:10a6:4:84::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 23 Mar
 2022 08:52:56 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::74) by AM6P194CA0081.outlook.office365.com
 (2603:10a6:209:8f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23 via Frontend
 Transport; Wed, 23 Mar 2022 08:52:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Wed, 23 Mar 2022 08:52:55 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Wed, 23 Mar 2022 08:52:55 +0000
Received: from 6a3e2b95147a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BC2B770C-005B-4081-8CC6-7F666EB0538E.1; 
 Wed, 23 Mar 2022 08:52:48 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a3e2b95147a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Mar 2022 08:52:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3480.eurprd08.prod.outlook.com (2603:10a6:20b:44::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 08:52:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 08:52:46 +0000
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
X-Inumbo-ID: a473e852-aa86-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXarKYHdSL31NB+F5CBvHag9FBY1nPHolFRLLy8Dysc=;
 b=Rsrxv+yLKR/EjyrVriLm2duLTifbZvBpZLiPtrZ4nmJubFJMcX4yosBWN3Mh/qtk2j0nnnx7IeiCTwnujAOmTSeRaPAi1mB6+iwClXzQqIur5i+coAwItQgP4PpiDuKtqLeWLWgyllrffu7oiQ3QGyNMqQw0JKo/meG5dncyciI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e0e7dc2cb73ae8f8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJxdFsOAhnSnErgoRIzdtGAv2bfp2nG/w1oLZx+TkUTUDdhgjhQgYw6DqL1QxCU7Uim392+Erzwu67VPitaxlhhzBqC+ia5PrrfGeJu0hsMWqin3Wq+NbFQgfqpFylOLqK12mKzRNvBT2+3FSz1IqKppziTZUVD/7iLetWQjZ9VPuODDDEeTAYHJ+ast6FPmigBRJTJHebvrxo1mPxsmtsqcRAmnnSTR+XyyXywW+EfrJycqvQrkk7bAdPTgKHh6RA1kwHcljmXlW6w4XkIcPqWIQhRkBCu9wjxUDl7LmlP0gbS01EWaP9r77PdVZlGNM2/TiGybsF8G1qC90BX/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXarKYHdSL31NB+F5CBvHag9FBY1nPHolFRLLy8Dysc=;
 b=BesLdlaBPyIKjXlbq4ogZA5i2QfDMk9/YBtkiGuBb/K1amR5zHm4kkY7L1DaM1Vuybwb9Im32ptFVNrncxZ3Z5Wdw9pPaBFIA1Ru5o6nM9I1JsoGEJrPqjd+BOB/lvqi6srXPbQG8rvgFB2MUYnqgk+vpPVVzE7znYK5ZyqJPUBHw6RPHIDHSfLkr8iNBGQq1+aas7NNtKuYE+HW+FtMEMOjgesikoUK5Ca/ahipNHZUNGbQpOlX2cRCZstFnxMzYOlpI0k6EDu3KiYmE2auE/pzPjx4HGZB1s/wO870eh/ftTKc1+RrR+pJeamOEjOV17P7D59mvl1UWyJz1gbi+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXarKYHdSL31NB+F5CBvHag9FBY1nPHolFRLLy8Dysc=;
 b=Rsrxv+yLKR/EjyrVriLm2duLTifbZvBpZLiPtrZ4nmJubFJMcX4yosBWN3Mh/qtk2j0nnnx7IeiCTwnujAOmTSeRaPAi1mB6+iwClXzQqIur5i+coAwItQgP4PpiDuKtqLeWLWgyllrffu7oiQ3QGyNMqQw0JKo/meG5dncyciI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: set CPSR Z bit when creating aarch32 guests
Thread-Topic: [PATCH v2] xen/arm: set CPSR Z bit when creating aarch32 guests
Thread-Index: AQHYPittA0qvCk1VqUeT+Og+1zrr1azMqmOA
Date: Wed, 23 Mar 2022 08:52:46 +0000
Message-ID: <E2220831-D72C-423C-A33F-453C8E851B8D@arm.com>
References: <20220322202825.418232-1-sstabellini@kernel.org>
In-Reply-To: <20220322202825.418232-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2356547e-45b2-407e-8b12-08da0caa85b2
x-ms-traffictypediagnostic:
	AM6PR08MB3480:EE_|AM5EUR03FT057:EE_|DB6PR0802MB2312:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2312F282CD85006C65F519879D189@DB6PR0802MB2312.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0wUmikHWXreAObYJPi4xeGBs6VzXBQSnGjMaxIcAICpaWVNgZidDUuXHZpKevXAvF5FluNYownPSpQz1/4Ihj66V3Bs6qTceW19d9mHV3MvBSCdL4snEDiJ3LUL1LmjwYmSrx5bGX5we1MjZAI31eS4b/HHiPIvDSrOa5YPZOeQMKtR38NGzY4GNQctJRgrcHOsr9ZJ8dFr8uHkGO8kJE3hwT83UrGmIAwm5bpnRKL/ZbomZuU9TwghtbrdAJYLdDJGtaYv0nD9Jk8XreULtx5XbM0X3ZQVSJJJUqT8TuxjrAPDXK9cVgtmXJLiD9/kPlMD76j/FqXgpUB//JyaSYRNbmEWzKU6Tys43sNl1GeFKL6m6aZaKEVCkJL9mF7Wrs6BRjpPb2UQm0PVdaLa/FOQqxlcv8X5ZnDwEvhrRBFL5wMTFKQ9O7dYJ2L8QdLW4ho7OTBRHqZ/11ZPgUcMD4qiH0S2h9xQlpyy7X5pw/JHKnItrqRORhU9AujoAQXO21HCKFbAwdhlI1NG1eHJlu+otEa37rj2ZJPyIbs4MvgSNBBphIVK7rgS3QUxh3i3yPd0Zw8u2tc5089GXiQaxJ07zxazGl4g+ruV5KjWg3Ysz/qts/EPKOSqFzs2B3qCI91adKFbgbg6ZbKdvOOxWv0TVmb02Sv0UKXv4icbMOFVoEJ+Zl4nXH9pt+1BO2M3Jy7cQuvklrJATxXf3YoRXpuDuG4+wDBgOaK72Nsk7n6izPoZ6BeLUAfOxrCdVkT88
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(38100700002)(64756008)(36756003)(66446008)(91956017)(76116006)(66556008)(66476007)(66946007)(5660300002)(122000001)(4326008)(8676002)(86362001)(6486002)(83380400001)(6512007)(71200400001)(316002)(508600001)(53546011)(2906002)(6506007)(6916009)(2616005)(54906003)(33656002)(186003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0B3DFAA05177E948BC113C298F6FEAC1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3480
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eba7f846-e329-46d7-7ef5-08da0caa8096
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r0oTX7GYnF0lBQIWCQmGSJvsGGzqFFV5qfusvW6gMX9tFbpfFklZ4nyILNZgAT6GVSjY98zEr01Iqz7bRoVEzZ0IGz8LvNym46x4c4bmqXfF30ZO7EC0m5RxIZ2mc9ZS4npjqoBjqCzgPJ8agJTvw/a0b6QKnxQ2NNj9zMJhY1H+eZRDxjq/OVa0Lqm0Nl6Gd9Y1U7BBGY7U6P2ppy1rrd/nCCNn6NZgwLsvVsojdnnzScyNBrQFEuDva6Bbx/mfC2yEpZQdjayTUEg/HwazO0QY1ejyQmosJifb2ygrhU5F7s74FdkHF6aAFz+MObHxbVIRIZCnC8HqQo+O38mkVgiCcQUwIVOLufdWFvdhJqLNO77Ag2xaieZH+NgbjYssL0/sPlXDuCT1BLxlfpfXkdg3cvqjxmyJEn9yOTdSY/C8u5zGAcahzdPLRZEYtNBCR/nM+C/qenau/FBN5nGcAQ7YrElqqJtsqMwJ7DbFUGYWa3JOywvkbPnJ4eehFSlIb/AYVrJLMA6hrvyh5aDyi8+q+XNVbSe0UQLHZjG//8xIgofhPpABgurPviOYzfIQfZpMiTke7RmkQ+5HFgfftlb6w1Wh0SeJf3JBjiouyHsd59sL3CHx1+CmEz2Plhv29BdD3pZkROQaojxUZ8tY/+ttvZEyTMMKwilaCAey11Iq5AfF7R4vPAryEhcrfS1q
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(6506007)(5660300002)(53546011)(6512007)(26005)(2906002)(2616005)(186003)(107886003)(336012)(356005)(33656002)(86362001)(81166007)(36860700001)(47076005)(82310400004)(6862004)(54906003)(4326008)(70586007)(316002)(8676002)(70206006)(6486002)(40460700003)(8936002)(508600001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 08:52:55.2765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2356547e-45b2-407e-8b12-08da0caa85b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2312

Hi Stefano,

> On 22 Mar 2022, at 21:28, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20
> The first 32 bytes of zImage are NOPs. When CONFIG_EFI is enabled in the
> kernel, certain versions of Linux will use an UNPREDICATABLE NOP
> encoding, sometimes resulting in an unbootable kernel. Whether the
> resulting kernel is bootable or not depends on the processor. See commit
> a92882a4d270 in the Linux kernel for all the details.
>=20
> All kernel releases starting from Linux 4.9 without commit a92882a4d270
> are affected.

Can you confirm if those kernels are also affected when started natively ?

>=20
> Fortunately there is a simple workaround: setting the "Z" bit in CPSR
> make it so those invalid NOP instructions are never executed. That is
> because the instruction is conditional (not equal). So, on QEMU at
> least, the instruction will end up to be ignored and not generate an
> exception. Setting the "Z" bit makes those kernel versions bootable
> again and it is harmless in the other cases.

I agree with Jan here. This will never be set or should not be expected
to be set by anyone when started.
It feels to me that we are introducing an ack for a temporary issue in
Linux which will makes us derive from the behaviour that could be
expected on native hardware.

Could you give more details on how blocking this is ?=20
Is the kernel update with the fix available on any of the affected distribu=
tions ?

Depending on the answers I think we could for example have a config around
this to flag it as workaround for a specific guest issue so that this is on=
ly
activated when needed.

Cheers
Bertrand

>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> Changes in v2:
> - improve commit message
> - add in-code comment
> - move PSR_Z to the beginning
> ---
> xen/include/public/arch-arm.h | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.=
h
> index 94b31511dd..81cee95f14 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -361,6 +361,7 @@ typedef uint64_t xen_callback_t;
> #define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
> #define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
> #define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
> +#define PSR_Z           (1<<30)       /* Zero condition flag */
>=20
> /* 32 bit modes */
> #define PSR_MODE_USR 0x10
> @@ -383,7 +384,12 @@ typedef uint64_t xen_callback_t;
> #define PSR_MODE_EL1t 0x04
> #define PSR_MODE_EL0t 0x00
>=20
> -#define PSR_GUEST32_INIT  (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MO=
DE_SVC)
> +/*
> + * We set PSR_Z to be able to boot Linux kernel versions with an invalid
> + * encoding of the first 8 NOP instructions. See commit a92882a4d270 in
> + * Linux.
> + */
> +#define PSR_GUEST32_INIT  (PSR_Z|PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|=
PSR_MODE_SVC)
> #define PSR_GUEST64_INIT (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE=
_EL1h)
>=20
> #define SCTLR_GUEST_INIT    xen_mk_ullong(0x00c50078)
> --=20
> 2.25.1
>=20


