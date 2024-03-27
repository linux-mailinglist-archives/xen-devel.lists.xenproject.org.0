Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB43B88E30F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 14:40:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698537.1090321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTWB-0003Ml-84; Wed, 27 Mar 2024 13:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698537.1090321; Wed, 27 Mar 2024 13:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTWB-0003K0-4v; Wed, 27 Mar 2024 13:40:39 +0000
Received: by outflank-mailman (input) for mailman id 698537;
 Wed, 27 Mar 2024 13:40:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsR0=LB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rpTW9-0003Ig-TS
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 13:40:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2612::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97e7df40-ec3f-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 14:40:37 +0100 (CET)
Received: from DUZPR01CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::11) by AM0PR08MB5491.eurprd08.prod.outlook.com
 (2603:10a6:208:189::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 13:40:29 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::fc) by DUZPR01CA0073.outlook.office365.com
 (2603:10a6:10:3c2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 13:40:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7409.10
 via Frontend Transport; Wed, 27 Mar 2024 13:40:28 +0000
Received: ("Tessian outbound 1b0f2681ce6f:v300");
 Wed, 27 Mar 2024 13:40:27 +0000
Received: from b8af7c59bde7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 61A58749-2530-403B-B921-2475FC7D38FC.1; 
 Wed, 27 Mar 2024 13:40:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8af7c59bde7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Mar 2024 13:40:20 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VE1PR08MB5774.eurprd08.prod.outlook.com (2603:10a6:800:1a1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 13:40:17 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 13:40:17 +0000
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
X-Inumbo-ID: 97e7df40-ec3f-11ee-afe3-a90da7624cb6
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cjc3vXaz1qM31DOFRPzanc8RgQd1E6YJEi9dUjnNtD9itBgg8YWwscbcv2L+6pIyu74/mBugeTt99ut0bi2uN5gTptcYIQ45IpBWSisDwWIpwFCYMDRZrhTzjgEF3K9vFOJAmUCOkWaqFWgx66pJ26OgZMCSRNePvx5sc2jdxpXYA8JNjCC1OONOMfZX1QXTkS5wupZK87SzlF7WeGusuReWDYEe2T0A++Ttv8QOgnVNpSb8jM8eyUBd5YAZFajB364QYnhXHDXtKNT9NF9Iwb23rnZopIyYR3NpKbYi+ao2OjmFLt+QCTHmkCj/a+e5Qz+qn89AZlxZAxj1eGH5HA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zlp0+JBb9KPu2aI6oYQpE41ABBNtmljZS78IpzsE68M=;
 b=dhaw+uXy8q6x9ymose39dN3xH7aUP5NnEzCdJ2oseiR6pj/zJah/qQn5jLYPhYObdFs4cmKCD25Ip1Xsc9xeTExBeMkB9LNYxJO8MC2sB0noVaHHTp3HNEdzE0O4ucPyF0Le4mZ3XR7/LltXj5dP9AYrJYpX4HaymmCwem47SMiCp8ta/0nc9+ISYzYitMHpt/VZ/xcXVW/O0/u9rmbymBsVtwFNqCpRgTvMQBFBhxf4CrpH0Dnec/KMfk+jniWgpQ7Go2aTXFruZdv47acH+UgFJhHd5Nm2VI7Km7CLFthg1hkCt7l1w8zlPQX1LGALd29s3k6QNtnq/ITvWZu4iA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zlp0+JBb9KPu2aI6oYQpE41ABBNtmljZS78IpzsE68M=;
 b=srIk7TGcUG90UpTHMWmU2zoa9zQcpVRG5mm5qdr4DTEMq3BbkPlYZWE+lDM6d/cFQZ9NnCRHyifvDKjJJ10KM8XlV9hnkM90tqPzIZDNXxPS7VgSJsL9jCxdPUykDatsurYxiDXfAFILyuj01NhJEx5iHwGGwBvzWUpgM+xUzqs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25edfc42cf543d17
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEbakngUw5l4wh4sgjtSQRYvQ8IhFRhhR2DYCbVkUb+MdtOSunhmCXPSe0jGaxiMO11vmhNc7eslPFs3RuBnF8ybUyH7Wi/K19eB/VyHsT/BZCsvfSkYpnTiTCLw/ktV4PkGCOv4EenkUA78NLtQOWdBNXpX6466j8hzgQWrkp77hjXLC+RvdtP+oX81Hjvk/kxGmC1V6w+VU4NboF1/SidKI8UiBHnxLhAQDn3esObR5ER8s7BvEfhks2qcy+6zrX0TmgVQirbHVLK/dyA8eqN6jxyDPuWOfB7CogOXrZu7OFoIqFpFdE6iBBNRRWegT838waW9vcFJCOfbsm+RaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zlp0+JBb9KPu2aI6oYQpE41ABBNtmljZS78IpzsE68M=;
 b=l17C+tiqiw57bB9xic8lf1E4htRPLb/UvqlktocJICvxnFjzqHr0lbEDI3F9lhX68LHdj+3hI397RsMkM7ATO55O3/dCPY5Pyd2Ig6JpA5LdWy8yzAz9RWsmiTndOUPainlbdzKXlmbGLFGqbhbOKE5to37zavSBmmp7ebA4aBWI2c3FEhsuj4l8XVhWoipJVOFfU5hdXacBUV+XFqc3GzBHS6yyyh1oxgsXO4mcrNihoiJOQ+2ErL/jmgTULG8UFZn1eQJHZ/eDCCw3MErjxRlukv8ECfeaQBXxwyqwW+3C8vGmhq9qIoE6LVUcxga+HkGOuCevX4aEMvLa3XR8Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zlp0+JBb9KPu2aI6oYQpE41ABBNtmljZS78IpzsE68M=;
 b=srIk7TGcUG90UpTHMWmU2zoa9zQcpVRG5mm5qdr4DTEMq3BbkPlYZWE+lDM6d/cFQZ9NnCRHyifvDKjJJ10KM8XlV9hnkM90tqPzIZDNXxPS7VgSJsL9jCxdPUykDatsurYxiDXfAFILyuj01NhJEx5iHwGGwBvzWUpgM+xUzqs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH 3/6] xen/arm: ffa: separate memory sharing routines
Thread-Topic: [XEN PATCH 3/6] xen/arm: ffa: separate memory sharing routines
Thread-Index: AQHafphXShQMyqELBEGnpkE0sEGolbFLm16A
Date: Wed, 27 Mar 2024 13:40:17 +0000
Message-ID: <F5023C5E-4563-4643-865B-601B022F7AC8@arm.com>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
 <20240325093904.3466092-4-jens.wiklander@linaro.org>
In-Reply-To: <20240325093904.3466092-4-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VE1PR08MB5774:EE_|DB3PEPF0000885B:EE_|AM0PR08MB5491:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdaf1c0-73f1-4bad-8dc4-08dc4e6376be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 reU4V4400pbZbGUWWba9dvwPDOcOlfVRlncLaruWE1r3ukEjDqWDtbvz2m98PRFHGxreYD2qQojC/VNBx+yzQgtNquXIe16BJSXzOY6F51+oRbnOQBemzfA/eumgTt5me8vwn9HcnoLj4w90/G7b+xrhknY9fWpD2SSASvaL+qV5B3tWCW/Gv0phgjeeuMpn6NezAzrRK+SwfUKK3rYl87XtQoHEy2atE0QIAzGbEDvEZfstMszL4baLi0nCqo0Vec+FMMFoaowa3Ikdl0WsmP+MiosgAm4lfW4T9zjBlpf8r/DZ3RGOQxf2r4utQwmOWrtmUUfI3XjYKFP9BhIDmy7+vH7EziZUISfjC11RKARHflkmL+NPDLblEQ1NreW+xN3nKrrf1h95+Izk5L5jI79qmy+6qG91uJAamoYJXUrblLM65mqARIGbhJrrd8wmY6vosweq0C/cMTy/3LuM/728AP31bU1HHWjPrm3FrunxZLghlVw99oaFV0vb7qD8WUSS6nFUzorfM5rflf3jc6g/zzNdeq5bW4zvrmID3w8YrH4SOIOW7jGdt77P+/N0KnonuMbrZUWmCvL0YMjii9nGoFyMJ/1vSwEiaLUFOt0hUd3Xqg16lpioWKsuGWDnn7i1aLkA8n2pdisP1aZfMLveRdQ5qZ+WBwhn085tGjz2mtypSlOGTky5mu+f0t7h2SZpIH0sJBkk8r7iwUr7LtmNOatjaR9ptyCUINils+o=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C5E78BC3948BFA42A66CC505E312DCFA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5774
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa87161b-c798-4e7e-6427-08dc4e6370af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	un0vRAjYvIvlLQ+EZDG0gd3uyxqSHjwCcNlBg8Qg2Z+tkCoTq6tclP8o/C5NI495D4MPfiJMd3VvxV5s/Env7kBVMfbJqBI466QBOH6W1NbVro9MGoifrrKV1Yqm5xOJOZRgDlfjOYvpn5aLNvBnrG9wKQqvuUOPgX/Q6LdtsLBkI8M8jMmi1/rZxvHI7Q+a/P/LGPTXk9WAc017FxNaKtfNBG94yKuco765BdmFQyQ22FFhBYfr5JPk5g5voNoKM35F4wjaBtrHgdopLnvHcNMnP71mjVxwkpKD/vg2CMqHxN4K4pyl3zdm/V5X266e4xabiwDR64xPGzIvxzCmP5R+tsViJ6ryddXnevO6+YMK9lLtwTSYGuJMBBorKnNEsBX8x2sljmnjus+T4CeKukmmWrmjNHjzcvicGVyjmTR5Gt0bu/w9UQEbdmgxY15x88KVV0GnHN83gTeniCiMk4PlWjVkfwHUfrgrY/yjrRhO34kwL37hvGyPUIX1g/9iGPP/xG5P1iiZbIdHr8+lBgbUFQXsdnarnqM4Y+55pFbgIhpFP0Yyh2gM/3w4kB/Agnw/JxFELzIt5x5RDgVaI5USRzlR0OfZ1p5d9kh9HvRIf4kv+6TRUSTdpyfL7VC+lmeGfS6QUVLvEn82NF2pkNg1Llyab/Y61CiApTz0o1QKCnwcU5DbNJF+8d0GTtW7wJjhKQ5wQEmlk22EKjv+G1/1S44YphzQ0IG0CutCX4lpTzJelui5NB2W6DBxuyXw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 13:40:28.0696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdaf1c0-73f1-4bad-8dc4-08dc4e6376be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5491

Hi Jens,

> On 25 Mar 2024, at 10:39, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Move memory sharing routines into a separate file for easier navigation
> in the source code.
>=20
> Add ffa_shm_domain_destroy() to isolate the ffa_shm things in
> ffa_domain_teardown_continue().
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

With the copyright date mentioned after fixed (which can be done on commit)=
:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com


> ---
> xen/arch/arm/tee/Makefile      |   1 +
> xen/arch/arm/tee/ffa.c         | 708 +--------------------------------
> xen/arch/arm/tee/ffa_private.h |  10 +
> xen/arch/arm/tee/ffa_shm.c     | 708 +++++++++++++++++++++++++++++++++
> 4 files changed, 729 insertions(+), 698 deletions(-)
> create mode 100644 xen/arch/arm/tee/ffa_shm.c
>=20
> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
> index 58a1015e40e0..0e683d23aa9d 100644
> --- a/xen/arch/arm/tee/Makefile
> +++ b/xen/arch/arm/tee/Makefile
> @@ -1,3 +1,4 @@
> obj-$(CONFIG_FFA) +=3D ffa.o
> +obj-$(CONFIG_FFA) +=3D ffa_shm.o
> obj-y +=3D tee.o
> obj-$(CONFIG_OPTEE) +=3D optee.o
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 259851f20bdb..db36292dc52f 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -84,92 +84,6 @@ struct ffa_partition_info_1_1 {
>     uint8_t uuid[16];
> };
>=20
> -/* Constituent memory region descriptor */
> -struct ffa_address_range {
> -    uint64_t address;
> -    uint32_t page_count;
> -    uint32_t reserved;
> -};
> -
> -/* Composite memory region descriptor */
> -struct ffa_mem_region {
> -    uint32_t total_page_count;
> -    uint32_t address_range_count;
> -    uint64_t reserved;
> -    struct ffa_address_range address_range_array[];
> -};
> -
> -/* Memory access permissions descriptor */
> -struct ffa_mem_access_perm {
> -    uint16_t endpoint_id;
> -    uint8_t perm;
> -    uint8_t flags;
> -};
> -
> -/* Endpoint memory access descriptor */
> -struct ffa_mem_access {
> -    struct ffa_mem_access_perm access_perm;
> -    uint32_t region_offs;
> -    uint64_t reserved;
> -};
> -
> -/* Lend, donate or share memory transaction descriptor */
> -struct ffa_mem_transaction_1_0 {
> -    uint16_t sender_id;
> -    uint8_t mem_reg_attr;
> -    uint8_t reserved0;
> -    uint32_t flags;
> -    uint64_t handle;
> -    uint64_t tag;
> -    uint32_t reserved1;
> -    uint32_t mem_access_count;
> -    struct ffa_mem_access mem_access_array[];
> -};
> -
> -struct ffa_mem_transaction_1_1 {
> -    uint16_t sender_id;
> -    uint16_t mem_reg_attr;
> -    uint32_t flags;
> -    uint64_t handle;
> -    uint64_t tag;
> -    uint32_t mem_access_size;
> -    uint32_t mem_access_count;
> -    uint32_t mem_access_offs;
> -    uint8_t reserved[12];
> -};
> -
> -/* Calculate offset of struct ffa_mem_access from start of buffer */
> -#define MEM_ACCESS_OFFSET(access_idx) \
> -    ( sizeof(struct ffa_mem_transaction_1_1) + \
> -      ( access_idx ) * sizeof(struct ffa_mem_access) )
> -
> -/* Calculate offset of struct ffa_mem_region from start of buffer */
> -#define REGION_OFFSET(access_count, region_idx) \
> -    ( MEM_ACCESS_OFFSET(access_count) + \
> -      ( region_idx ) * sizeof(struct ffa_mem_region) )
> -
> -/* Calculate offset of struct ffa_address_range from start of buffer */
> -#define ADDR_RANGE_OFFSET(access_count, region_count, range_idx) \
> -    ( REGION_OFFSET(access_count, region_count) + \
> -      ( range_idx ) * sizeof(struct ffa_address_range) )
> -
> -/*
> - * The parts needed from struct ffa_mem_transaction_1_0 or struct
> - * ffa_mem_transaction_1_1, used to provide an abstraction of difference=
 in
> - * data structures between version 1.0 and 1.1. This is just an internal
> - * interface and can be changed without changing any ABI.
> - */
> -struct ffa_mem_transaction_int {
> -    uint16_t sender_id;
> -    uint8_t mem_reg_attr;
> -    uint8_t flags;
> -    uint8_t mem_access_size;
> -    uint8_t mem_access_count;
> -    uint16_t mem_access_offs;
> -    uint64_t handle;
> -    uint64_t tag;
> -};
> -
> /* Endpoint RX/TX descriptor */
> struct ffa_endpoint_rxtx_descriptor_1_0 {
>     uint16_t sender_id;
> @@ -185,15 +99,6 @@ struct ffa_endpoint_rxtx_descriptor_1_1 {
>     uint32_t tx_region_offs;
> };
>=20
> -struct ffa_shm_mem {
> -    struct list_head list;
> -    uint16_t sender_id;
> -    uint16_t ep_id;     /* endpoint, the one lending */
> -    uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
> -    unsigned int page_count;
> -    struct page_info *pages[];
> -};
> -
> /* Negotiated FF-A version to use with the SPMC */
> static uint32_t __ro_after_init ffa_version;
>=20
> @@ -212,10 +117,10 @@ static uint16_t subscr_vm_destroyed_count __read_mo=
stly;
>  * for calls which uses our RX buffer to deliver a result we must call
>  * ffa_rx_release() to let the SPMC know that we're done with the buffer.
>  */
> -static void *ffa_rx __read_mostly;
> -static void *ffa_tx __read_mostly;
> -static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> -static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
> +void *ffa_rx __read_mostly;
> +void *ffa_tx __read_mostly;
> +DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> +DEFINE_SPINLOCK(ffa_tx_buffer_lock);
>=20
>=20
> /* Used to track domains that could not be torn down immediately. */
> @@ -297,47 +202,6 @@ static int32_t ffa_rx_release(void)
>     return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> }
>=20
> -static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
> -                             register_t addr, uint32_t pg_count,
> -                             uint64_t *handle)
> -{
> -    struct arm_smccc_1_2_regs arg =3D {
> -        .a0 =3D FFA_MEM_SHARE_64,
> -        .a1 =3D tot_len,
> -        .a2 =3D frag_len,
> -        .a3 =3D addr,
> -        .a4 =3D pg_count,
> -    };
> -    struct arm_smccc_1_2_regs resp;
> -
> -    arm_smccc_1_2_smc(&arg, &resp);
> -
> -    switch ( resp.a0 )
> -    {
> -    case FFA_ERROR:
> -        if ( resp.a2 )
> -            return resp.a2;
> -        else
> -            return FFA_RET_NOT_SUPPORTED;
> -    case FFA_SUCCESS_32:
> -        *handle =3D regpair_to_uint64(resp.a3, resp.a2);
> -        return FFA_RET_OK;
> -    case FFA_MEM_FRAG_RX:
> -        *handle =3D regpair_to_uint64(resp.a2, resp.a1);
> -        if ( resp.a3 > INT32_MAX ) /* Impossible value */
> -            return FFA_RET_ABORTED;
> -        return resp.a3 & INT32_MAX;
> -    default:
> -        return FFA_RET_NOT_SUPPORTED;
> -    }
> -}
> -
> -static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
> -                               uint32_t flags)
> -{
> -    return ffa_simple_call(FFA_MEM_RECLAIM, handle_lo, handle_hi, flags,=
 0);
> -}
> -
> static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
>                                       uint8_t msg)
> {
> @@ -660,506 +524,6 @@ out:
>                  resp.a7 & mask);
> }
>=20
> -/*
> - * Gets all page and assigns them to the supplied shared memory object. =
If
> - * this function fails then the caller is still expected to call
> - * put_shm_pages() as a cleanup.
> - */
> -static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
> -                         const struct ffa_address_range *range,
> -                         uint32_t range_count, unsigned int start_page_i=
dx,
> -                         unsigned int *last_page_idx)
> -{
> -    unsigned int pg_idx =3D start_page_idx;
> -    gfn_t gfn;
> -    unsigned int n;
> -    unsigned int m;
> -    p2m_type_t t;
> -    uint64_t addr;
> -    uint64_t page_count;
> -
> -    for ( n =3D 0; n < range_count; n++ )
> -    {
> -        page_count =3D read_atomic(&range[n].page_count);
> -        addr =3D read_atomic(&range[n].address);
> -        for ( m =3D 0; m < page_count; m++ )
> -        {
> -            if ( pg_idx >=3D shm->page_count )
> -                return FFA_RET_INVALID_PARAMETERS;
> -
> -            gfn =3D gaddr_to_gfn(addr + m * FFA_PAGE_SIZE);
> -            shm->pages[pg_idx] =3D get_page_from_gfn(d, gfn_x(gfn), &t,
> -   P2M_ALLOC);
> -            if ( !shm->pages[pg_idx] )
> -                return FFA_RET_DENIED;
> -            /* Only normal RW RAM for now */
> -            if ( t !=3D p2m_ram_rw )
> -                return FFA_RET_DENIED;
> -            pg_idx++;
> -        }
> -    }
> -
> -    *last_page_idx =3D pg_idx;
> -
> -    return FFA_RET_OK;
> -}
> -
> -static void put_shm_pages(struct ffa_shm_mem *shm)
> -{
> -    unsigned int n;
> -
> -    for ( n =3D 0; n < shm->page_count && shm->pages[n]; n++ )
> -    {
> -        put_page(shm->pages[n]);
> -        shm->pages[n] =3D NULL;
> -    }
> -}
> -
> -static bool inc_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> -{
> -    bool ret =3D true;
> -
> -    spin_lock(&ctx->lock);
> -
> -    if ( ctx->shm_count >=3D FFA_MAX_SHM_COUNT )
> -    {
> -        ret =3D false;
> -    }
> -    else
> -    {
> -        /*
> -         * If this is the first shm added, increase the domain reference
> -         * counter as we need to keep domain around a bit longer to recl=
aim
> -         * the shared memory in the teardown path.
> -         */
> -        if ( !ctx->shm_count )
> -            get_knownalive_domain(d);
> -
> -        ctx->shm_count++;
> -    }
> -
> -    spin_unlock(&ctx->lock);
> -
> -    return ret;
> -}
> -
> -static void dec_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> -{
> -    bool drop_ref;
> -
> -    spin_lock(&ctx->lock);
> -
> -    ASSERT(ctx->shm_count > 0);
> -    ctx->shm_count--;
> -
> -    /*
> -     * If this was the last shm removed, let go of the domain reference =
we
> -     * took in inc_ctx_shm_count() above.
> -     */
> -    drop_ref =3D !ctx->shm_count;
> -
> -    spin_unlock(&ctx->lock);
> -
> -    if ( drop_ref )
> -        put_domain(d);
> -}
> -
> -static struct ffa_shm_mem *alloc_ffa_shm_mem(struct domain *d,
> -                                             unsigned int page_count)
> -{
> -    struct ffa_ctx *ctx =3D d->arch.tee;
> -    struct ffa_shm_mem *shm;
> -
> -    if ( page_count >=3D FFA_MAX_SHM_PAGE_COUNT )
> -        return NULL;
> -    if ( !inc_ctx_shm_count(d, ctx) )
> -        return NULL;
> -
> -    shm =3D xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
> -    if ( shm )
> -        shm->page_count =3D page_count;
> -    else
> -        dec_ctx_shm_count(d, ctx);
> -
> -    return shm;
> -}
> -
> -static void free_ffa_shm_mem(struct domain *d, struct ffa_shm_mem *shm)
> -{
> -    struct ffa_ctx *ctx =3D d->arch.tee;
> -
> -    if ( !shm )
> -        return;
> -
> -    dec_ctx_shm_count(d, ctx);
> -    put_shm_pages(shm);
> -    xfree(shm);
> -}
> -
> -static void init_range(struct ffa_address_range *addr_range,
> -                       paddr_t pa)
> -{
> -    memset(addr_range, 0, sizeof(*addr_range));
> -    addr_range->address =3D pa;
> -    addr_range->page_count =3D 1;
> -}
> -
> -/*
> - * This function uses the ffa_tx buffer to transmit the memory transacti=
on
> - * descriptor. The function depends ffa_tx_buffer_lock to be used to gua=
rd
> - * the buffer from concurrent use.
> - */
> -static int share_shm(struct ffa_shm_mem *shm)
> -{
> -    const uint32_t max_frag_len =3D FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE;
> -    struct ffa_mem_access *mem_access_array;
> -    struct ffa_mem_transaction_1_1 *descr;
> -    struct ffa_address_range *addr_range;
> -    struct ffa_mem_region *region_descr;
> -    const unsigned int region_count =3D 1;
> -    void *buf =3D ffa_tx;
> -    uint32_t frag_len;
> -    uint32_t tot_len;
> -    paddr_t last_pa;
> -    unsigned int n;
> -    paddr_t pa;
> -
> -    ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
> -    ASSERT(shm->page_count);
> -
> -    descr =3D buf;
> -    memset(descr, 0, sizeof(*descr));
> -    descr->sender_id =3D shm->sender_id;
> -    descr->handle =3D shm->handle;
> -    descr->mem_reg_attr =3D FFA_NORMAL_MEM_REG_ATTR;
> -    descr->mem_access_count =3D 1;
> -    descr->mem_access_size =3D sizeof(*mem_access_array);
> -    descr->mem_access_offs =3D MEM_ACCESS_OFFSET(0);
> -
> -    mem_access_array =3D buf + descr->mem_access_offs;
> -    memset(mem_access_array, 0, sizeof(*mem_access_array));
> -    mem_access_array[0].access_perm.endpoint_id =3D shm->ep_id;
> -    mem_access_array[0].access_perm.perm =3D FFA_MEM_ACC_RW;
> -    mem_access_array[0].region_offs =3D REGION_OFFSET(descr->mem_access_=
count, 0);
> -
> -    region_descr =3D buf + mem_access_array[0].region_offs;
> -    memset(region_descr, 0, sizeof(*region_descr));
> -    region_descr->total_page_count =3D shm->page_count;
> -
> -    region_descr->address_range_count =3D 1;
> -    last_pa =3D page_to_maddr(shm->pages[0]);
> -    for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> -    {
> -        pa =3D page_to_maddr(shm->pages[n]);
> -        if ( last_pa + FFA_PAGE_SIZE =3D=3D pa )
> -            continue;
> -        region_descr->address_range_count++;
> -    }
> -
> -    tot_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count,
> -                                region_descr->address_range_count);
> -    if ( tot_len > max_frag_len )
> -        return FFA_RET_NOT_SUPPORTED;
> -
> -    addr_range =3D region_descr->address_range_array;
> -    frag_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count=
, 1);
> -    last_pa =3D page_to_maddr(shm->pages[0]);
> -    init_range(addr_range, last_pa);
> -    for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> -    {
> -        pa =3D page_to_maddr(shm->pages[n]);
> -        if ( last_pa + FFA_PAGE_SIZE =3D=3D pa )
> -        {
> -            addr_range->page_count++;
> -            continue;
> -        }
> -
> -        frag_len +=3D sizeof(*addr_range);
> -        addr_range++;
> -        init_range(addr_range, pa);
> -    }
> -
> -    return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> -}
> -
> -static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size=
_t blen,
> -                                struct ffa_mem_transaction_int *trans)
> -{
> -    uint16_t mem_reg_attr;
> -    uint32_t flags;
> -    uint32_t count;
> -    uint32_t offs;
> -    uint32_t size;
> -
> -    if ( ffa_vers >=3D FFA_VERSION_1_1 )
> -    {
> -        const struct ffa_mem_transaction_1_1 *descr;
> -
> -        if ( blen < sizeof(*descr) )
> -            return FFA_RET_INVALID_PARAMETERS;
> -
> -        descr =3D buf;
> -        trans->sender_id =3D descr->sender_id;
> -        mem_reg_attr =3D descr->mem_reg_attr;
> -        flags =3D descr->flags;
> -        trans->handle =3D descr->handle;
> -        trans->tag =3D descr->tag;
> -
> -        count =3D descr->mem_access_count;
> -        size =3D descr->mem_access_size;
> -        offs =3D descr->mem_access_offs;
> -    }
> -    else
> -    {
> -        const struct ffa_mem_transaction_1_0 *descr;
> -
> -        if ( blen < sizeof(*descr) )
> -            return FFA_RET_INVALID_PARAMETERS;
> -
> -        descr =3D buf;
> -        trans->sender_id =3D descr->sender_id;
> -        mem_reg_attr =3D descr->mem_reg_attr;
> -        flags =3D descr->flags;
> -        trans->handle =3D descr->handle;
> -        trans->tag =3D descr->tag;
> -
> -        count =3D descr->mem_access_count;
> -        size =3D sizeof(struct ffa_mem_access);
> -        offs =3D offsetof(struct ffa_mem_transaction_1_0, mem_access_arr=
ay);
> -    }
> -    /*
> -     * Make sure that "descr" which is shared with the guest isn't acces=
sed
> -     * again after this point.
> -     */
> -    barrier();
> -
> -    /*
> -     * We're doing a rough check to see that no information is lost when
> -     * tranfering the values into a struct ffa_mem_transaction_int below=
.
> -     * The fields in struct ffa_mem_transaction_int are wide enough to h=
old
> -     * any valid value so being out of range means that something is wro=
ng.
> -     */
> -    if ( mem_reg_attr > UINT8_MAX || flags > UINT8_MAX || size > UINT8_M=
AX ||
> -        count > UINT8_MAX || offs > UINT16_MAX )
> -        return FFA_RET_INVALID_PARAMETERS;
> -
> -    /* Check that the endpoint memory access descriptor array fits */
> -    if ( size * count + offs > blen )
> -        return FFA_RET_INVALID_PARAMETERS;
> -
> -    trans->mem_reg_attr =3D mem_reg_attr;
> -    trans->flags =3D flags;
> -    trans->mem_access_size =3D size;
> -    trans->mem_access_count =3D count;
> -    trans->mem_access_offs =3D offs;
> -
> -    return 0;
> -}
> -
> -static void ffa_handle_mem_share(struct cpu_user_regs *regs)
> -{
> -    uint32_t tot_len =3D get_user_reg(regs, 1);
> -    uint32_t frag_len =3D get_user_reg(regs, 2);
> -    uint64_t addr =3D get_user_reg(regs, 3);
> -    uint32_t page_count =3D get_user_reg(regs, 4);
> -    const struct ffa_mem_region *region_descr;
> -    const struct ffa_mem_access *mem_access;
> -    struct ffa_mem_transaction_int trans;
> -    struct domain *d =3D current->domain;
> -    struct ffa_ctx *ctx =3D d->arch.tee;
> -    struct ffa_shm_mem *shm =3D NULL;
> -    unsigned int last_page_idx =3D 0;
> -    register_t handle_hi =3D 0;
> -    register_t handle_lo =3D 0;
> -    int ret =3D FFA_RET_DENIED;
> -    uint32_t range_count;
> -    uint32_t region_offs;
> -
> -    /*
> -     * We're only accepting memory transaction descriptors via the rx/tx
> -     * buffer.
> -     */
> -    if ( addr )
> -    {
> -        ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out_set_ret;
> -    }
> -
> -    /* Check that fragment length doesn't exceed total length */
> -    if ( frag_len > tot_len )
> -    {
> -        ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out_set_ret;
> -    }
> -
> -    /* We currently only support a single fragment */
> -    if ( frag_len !=3D tot_len )
> -    {
> -        ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out_set_ret;
> -    }
> -
> -    if ( !spin_trylock(&ctx->tx_lock) )
> -    {
> -        ret =3D FFA_RET_BUSY;
> -        goto out_set_ret;
> -    }
> -
> -    if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
> -        goto out_unlock;
> -
> -    ret =3D read_mem_transaction(ctx->guest_vers, ctx->tx, frag_len, &tr=
ans);
> -    if ( ret )
> -        goto out_unlock;
> -
> -    if ( trans.mem_reg_attr !=3D FFA_NORMAL_MEM_REG_ATTR )
> -    {
> -        ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out_unlock;
> -    }
> -
> -    /* Only supports sharing it with one SP for now */
> -    if ( trans.mem_access_count !=3D 1 )
> -    {
> -        ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out_unlock;
> -    }
> -
> -    if ( trans.sender_id !=3D ffa_get_vm_id(d) )
> -    {
> -        ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out_unlock;
> -    }
> -
> -    /* Check that it fits in the supplied data */
> -    if ( trans.mem_access_offs + trans.mem_access_size > frag_len )
> -        goto out_unlock;
> -
> -    mem_access =3D ctx->tx + trans.mem_access_offs;
> -    if ( read_atomic(&mem_access->access_perm.perm) !=3D FFA_MEM_ACC_RW =
)
> -    {
> -        ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out_unlock;
> -    }
> -
> -    region_offs =3D read_atomic(&mem_access->region_offs);
> -    if ( sizeof(*region_descr) + region_offs > frag_len )
> -    {
> -        ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out_unlock;
> -    }
> -
> -    region_descr =3D ctx->tx + region_offs;
> -    range_count =3D read_atomic(&region_descr->address_range_count);
> -    page_count =3D read_atomic(&region_descr->total_page_count);
> -
> -    if ( !page_count )
> -    {
> -        ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out_unlock;
> -    }
> -
> -    shm =3D alloc_ffa_shm_mem(d, page_count);
> -    if ( !shm )
> -    {
> -        ret =3D FFA_RET_NO_MEMORY;
> -        goto out_unlock;
> -    }
> -    shm->sender_id =3D trans.sender_id;
> -    shm->ep_id =3D read_atomic(&mem_access->access_perm.endpoint_id);
> -
> -    /*
> -     * Check that the Composite memory region descriptor fits.
> -     */
> -    if ( sizeof(*region_descr) + region_offs +
> -         range_count * sizeof(struct ffa_address_range) > frag_len )
> -    {
> -        ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out;
> -    }
> -
> -    ret =3D get_shm_pages(d, shm, region_descr->address_range_array, ran=
ge_count,
> -                        0, &last_page_idx);
> -    if ( ret )
> -        goto out;
> -    if ( last_page_idx !=3D shm->page_count )
> -    {
> -        ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out;
> -    }
> -
> -    /* Note that share_shm() uses our tx buffer */
> -    spin_lock(&ffa_tx_buffer_lock);
> -    ret =3D share_shm(shm);
> -    spin_unlock(&ffa_tx_buffer_lock);
> -    if ( ret )
> -        goto out;
> -
> -    spin_lock(&ctx->lock);
> -    list_add_tail(&shm->list, &ctx->shm_list);
> -    spin_unlock(&ctx->lock);
> -
> -    uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> -
> -out:
> -    if ( ret )
> -        free_ffa_shm_mem(d, shm);
> -out_unlock:
> -    spin_unlock(&ctx->tx_lock);
> -
> -out_set_ret:
> -    if ( ret =3D=3D 0)
> -            ffa_set_regs_success(regs, handle_lo, handle_hi);
> -    else
> -            ffa_set_regs_error(regs, ret);
> -}
> -
> -/* Must only be called with ctx->lock held */
> -static struct ffa_shm_mem *find_shm_mem(struct ffa_ctx *ctx, uint64_t ha=
ndle)
> -{
> -    struct ffa_shm_mem *shm;
> -
> -    list_for_each_entry(shm, &ctx->shm_list, list)
> -        if ( shm->handle =3D=3D handle )
> -            return shm;
> -
> -    return NULL;
> -}
> -
> -static int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags)
> -{
> -    struct domain *d =3D current->domain;
> -    struct ffa_ctx *ctx =3D d->arch.tee;
> -    struct ffa_shm_mem *shm;
> -    register_t handle_hi;
> -    register_t handle_lo;
> -    int ret;
> -
> -    spin_lock(&ctx->lock);
> -    shm =3D find_shm_mem(ctx, handle);
> -    if ( shm )
> -        list_del(&shm->list);
> -    spin_unlock(&ctx->lock);
> -    if ( !shm )
> -        return FFA_RET_INVALID_PARAMETERS;
> -
> -    uint64_to_regpair(&handle_hi, &handle_lo, handle);
> -    ret =3D ffa_mem_reclaim(handle_lo, handle_hi, flags);
> -
> -    if ( ret )
> -    {
> -        spin_lock(&ctx->lock);
> -        list_add_tail(&shm->list, &ctx->shm_list);
> -        spin_unlock(&ctx->lock);
> -    }
> -    else
> -    {
> -        free_ffa_shm_mem(d, shm);
> -    }
> -
> -    return ret;
> -}
> -
> static bool ffa_handle_call(struct cpu_user_regs *regs)
> {
>     uint32_t fid =3D get_user_reg(regs, 0);
> @@ -1284,8 +648,8 @@ static int ffa_domain_init(struct domain *d)
>     if ( !ffa_version )
>         return -ENODEV;
>      /*
> -      * We can't use that last possible domain ID or get_vm_id() would c=
ause
> -      * an overflow.
> +      * We can't use that last possible domain ID or ffa_get_vm_id() wou=
ld
> +      * cause an overflow.

Nit: this should have been in patch 1 but no need to change unless there is
a new version of the serie.

>       */
>     if ( d->domain_id >=3D UINT16_MAX)
>         return -ERANGE;
> @@ -1348,68 +712,16 @@ static void send_vm_destroyed(struct domain *d)
>     }
> }
>=20
> -static void ffa_reclaim_shms(struct domain *d)
> -{
> -    struct ffa_ctx *ctx =3D d->arch.tee;
> -    struct ffa_shm_mem *shm, *tmp;
> -    int32_t res;
> -
> -    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
> -    {
> -        register_t handle_hi;
> -        register_t handle_lo;
> -
> -        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> -        res =3D ffa_mem_reclaim(handle_lo, handle_hi, 0);
> -        switch ( res ) {
> -        case FFA_RET_OK:
> -            printk(XENLOG_G_DEBUG "%pd: ffa: Reclaimed handle %#lx\n",
> -                   d, shm->handle);
> -            list_del(&shm->list);
> -            free_ffa_shm_mem(d, shm);
> -            break;
> -        case FFA_RET_DENIED:
> -            /*
> -             * A temporary error that may get resolved a bit later, it's
> -             * worth retrying.
> -             */
> -            printk(XENLOG_G_INFO "%pd: ffa: Failed to reclaim handle %#l=
x : %d\n",
> -                   d, shm->handle, res);
> -            break; /* We will retry later */
> -        default:
> -            /*
> -             * The rest of the error codes are not expected and are assu=
med
> -             * to be of a permanent nature. It not in our control to han=
dle
> -             * the error properly so the object in this case is to try t=
o
> -             * minimize the damage.
> -             *
> -             * FFA_RET_NO_MEMORY might be a temporary error as it it cou=
ld
> -             * succeed if retried later, but treat it as permanent for n=
ow.
> -             */
> -            printk(XENLOG_G_INFO "%pd: ffa: Permanent failure to reclaim=
 handle %#lx : %d\n",
> -                   d, shm->handle, res);
> -
> -            /*
> -             * Remove the shm from the list and free it, but don't drop
> -             * references. This results in having the shared physical pa=
ges
> -             * permanently allocate and also keeps the domain as a zombi=
e
> -             * domain.
> -             */
> -            list_del(&shm->list);
> -            xfree(shm);
> -            break;
> -        }
> -    }
> -}
> -
> static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first_=
time)
> {
>     struct ffa_ctx *next_ctx =3D NULL;
> +    bool retry =3D false;
>=20
>     send_vm_destroyed(ctx->teardown_d);
> -    ffa_reclaim_shms(ctx->teardown_d);
> +    if ( !ffa_shm_domain_destroy(ctx->teardown_d) )
> +        retry =3D true;
>=20
> -    if ( ctx->shm_count ||
> +    if ( retry ||
>          !bitmap_empty(ctx->vm_destroy_bitmap, subscr_vm_destroyed_count)=
 )
>     {
>         printk(XENLOG_G_INFO "%pd: ffa: Remaining cleanup, retrying\n", c=
tx->teardown_d);
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 8352b6b55a9a..f3e2f42e573e 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -247,6 +247,16 @@ struct ffa_ctx {
>     unsigned long vm_destroy_bitmap[];
> };
>=20
> +extern void *ffa_rx;
> +extern void *ffa_tx;
> +extern spinlock_t ffa_rx_buffer_lock;
> +extern spinlock_t ffa_tx_buffer_lock;
> +
> +bool ffa_shm_domain_destroy(struct domain *d);
> +void ffa_handle_mem_share(struct cpu_user_regs *regs);
> +int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
> +
> +
> static inline uint16_t ffa_get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> new file mode 100644
> index 000000000000..13dc44683b45
> --- /dev/null
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -0,0 +1,708 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2023  Linaro Limited

Nit: The copyright has a wrong date.


Cheers
Bertrand

> + */
> +
> +#include <xen/const.h>
> +#include <xen/sizes.h>
> +#include <xen/types.h>
> +#include <xen/mm.h>
> +#include <xen/list.h>
> +#include <xen/spinlock.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/regs.h>
> +
> +#include "ffa_private.h"
> +
> +/* Constituent memory region descriptor */
> +struct ffa_address_range {
> +    uint64_t address;
> +    uint32_t page_count;
> +    uint32_t reserved;
> +};
> +
> +/* Composite memory region descriptor */
> +struct ffa_mem_region {
> +    uint32_t total_page_count;
> +    uint32_t address_range_count;
> +    uint64_t reserved;
> +    struct ffa_address_range address_range_array[];
> +};
> +
> +/* Memory access permissions descriptor */
> +struct ffa_mem_access_perm {
> +    uint16_t endpoint_id;
> +    uint8_t perm;
> +    uint8_t flags;
> +};
> +
> +/* Endpoint memory access descriptor */
> +struct ffa_mem_access {
> +    struct ffa_mem_access_perm access_perm;
> +    uint32_t region_offs;
> +    uint64_t reserved;
> +};
> +
> +/* Lend, donate or share memory transaction descriptor */
> +struct ffa_mem_transaction_1_0 {
> +    uint16_t sender_id;
> +    uint8_t mem_reg_attr;
> +    uint8_t reserved0;
> +    uint32_t flags;
> +    uint64_t handle;
> +    uint64_t tag;
> +    uint32_t reserved1;
> +    uint32_t mem_access_count;
> +    struct ffa_mem_access mem_access_array[];
> +};
> +
> +struct ffa_mem_transaction_1_1 {
> +    uint16_t sender_id;
> +    uint16_t mem_reg_attr;
> +    uint32_t flags;
> +    uint64_t handle;
> +    uint64_t tag;
> +    uint32_t mem_access_size;
> +    uint32_t mem_access_count;
> +    uint32_t mem_access_offs;
> +    uint8_t reserved[12];
> +};
> +
> +/* Calculate offset of struct ffa_mem_access from start of buffer */
> +#define MEM_ACCESS_OFFSET(access_idx) \
> +    ( sizeof(struct ffa_mem_transaction_1_1) + \
> +      ( access_idx ) * sizeof(struct ffa_mem_access) )
> +
> +/* Calculate offset of struct ffa_mem_region from start of buffer */
> +#define REGION_OFFSET(access_count, region_idx) \
> +    ( MEM_ACCESS_OFFSET(access_count) + \
> +      ( region_idx ) * sizeof(struct ffa_mem_region) )
> +
> +/* Calculate offset of struct ffa_address_range from start of buffer */
> +#define ADDR_RANGE_OFFSET(access_count, region_count, range_idx) \
> +    ( REGION_OFFSET(access_count, region_count) + \
> +      ( range_idx ) * sizeof(struct ffa_address_range) )
> +
> +/*
> + * The parts needed from struct ffa_mem_transaction_1_0 or struct
> + * ffa_mem_transaction_1_1, used to provide an abstraction of difference=
 in
> + * data structures between version 1.0 and 1.1. This is just an internal
> + * interface and can be changed without changing any ABI.
> + */
> +struct ffa_mem_transaction_int {
> +    uint16_t sender_id;
> +    uint8_t mem_reg_attr;
> +    uint8_t flags;
> +    uint8_t mem_access_size;
> +    uint8_t mem_access_count;
> +    uint16_t mem_access_offs;
> +    uint64_t handle;
> +    uint64_t tag;
> +};
> +
> +struct ffa_shm_mem {
> +    struct list_head list;
> +    uint16_t sender_id;
> +    uint16_t ep_id;     /* endpoint, the one lending */
> +    uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
> +    unsigned int page_count;
> +    struct page_info *pages[];
> +};
> +
> +static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
> +                             register_t addr, uint32_t pg_count,
> +                             uint64_t *handle)
> +{
> +    struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_MEM_SHARE_64,
> +        .a1 =3D tot_len,
> +        .a2 =3D frag_len,
> +        .a3 =3D addr,
> +        .a4 =3D pg_count,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    switch ( resp.a0 )
> +    {
> +    case FFA_ERROR:
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    case FFA_SUCCESS_32:
> +        *handle =3D regpair_to_uint64(resp.a3, resp.a2);
> +        return FFA_RET_OK;
> +    case FFA_MEM_FRAG_RX:
> +        *handle =3D regpair_to_uint64(resp.a2, resp.a1);
> +        if ( resp.a3 > INT32_MAX ) /* Impossible value */
> +            return FFA_RET_ABORTED;
> +        return resp.a3 & INT32_MAX;
> +    default:
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> +static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
> +                               uint32_t flags)
> +{
> +    return ffa_simple_call(FFA_MEM_RECLAIM, handle_lo, handle_hi, flags,=
 0);
> +}
> +
> +/*
> + * Gets all page and assigns them to the supplied shared memory object. =
If
> + * this function fails then the caller is still expected to call
> + * put_shm_pages() as a cleanup.
> + */
> +static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
> +                         const struct ffa_address_range *range,
> +                         uint32_t range_count, unsigned int start_page_i=
dx,
> +                         unsigned int *last_page_idx)
> +{
> +    unsigned int pg_idx =3D start_page_idx;
> +    gfn_t gfn;
> +    unsigned int n;
> +    unsigned int m;
> +    p2m_type_t t;
> +    uint64_t addr;
> +    uint64_t page_count;
> +
> +    for ( n =3D 0; n < range_count; n++ )
> +    {
> +        page_count =3D read_atomic(&range[n].page_count);
> +        addr =3D read_atomic(&range[n].address);
> +        for ( m =3D 0; m < page_count; m++ )
> +        {
> +            if ( pg_idx >=3D shm->page_count )
> +                return FFA_RET_INVALID_PARAMETERS;
> +
> +            gfn =3D gaddr_to_gfn(addr + m * FFA_PAGE_SIZE);
> +            shm->pages[pg_idx] =3D get_page_from_gfn(d, gfn_x(gfn), &t,
> +   P2M_ALLOC);
> +            if ( !shm->pages[pg_idx] )
> +                return FFA_RET_DENIED;
> +            /* Only normal RW RAM for now */
> +            if ( t !=3D p2m_ram_rw )
> +                return FFA_RET_DENIED;
> +            pg_idx++;
> +        }
> +    }
> +
> +    *last_page_idx =3D pg_idx;
> +
> +    return FFA_RET_OK;
> +}
> +
> +static void put_shm_pages(struct ffa_shm_mem *shm)
> +{
> +    unsigned int n;
> +
> +    for ( n =3D 0; n < shm->page_count && shm->pages[n]; n++ )
> +    {
> +        put_page(shm->pages[n]);
> +        shm->pages[n] =3D NULL;
> +    }
> +}
> +
> +static bool inc_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> +{
> +    bool ret =3D true;
> +
> +    spin_lock(&ctx->lock);
> +
> +    if ( ctx->shm_count >=3D FFA_MAX_SHM_COUNT )
> +    {
> +        ret =3D false;
> +    }
> +    else
> +    {
> +        /*
> +         * If this is the first shm added, increase the domain reference
> +         * counter as we need to keep domain around a bit longer to recl=
aim
> +         * the shared memory in the teardown path.
> +         */
> +        if ( !ctx->shm_count )
> +            get_knownalive_domain(d);
> +
> +        ctx->shm_count++;
> +    }
> +
> +    spin_unlock(&ctx->lock);
> +
> +    return ret;
> +}
> +
> +static void dec_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> +{
> +    bool drop_ref;
> +
> +    spin_lock(&ctx->lock);
> +
> +    ASSERT(ctx->shm_count > 0);
> +    ctx->shm_count--;
> +
> +    /*
> +     * If this was the last shm removed, let go of the domain reference =
we
> +     * took in inc_ctx_shm_count() above.
> +     */
> +    drop_ref =3D !ctx->shm_count;
> +
> +    spin_unlock(&ctx->lock);
> +
> +    if ( drop_ref )
> +        put_domain(d);
> +}
> +
> +static struct ffa_shm_mem *alloc_ffa_shm_mem(struct domain *d,
> +                                             unsigned int page_count)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    struct ffa_shm_mem *shm;
> +
> +    if ( page_count >=3D FFA_MAX_SHM_PAGE_COUNT )
> +        return NULL;
> +    if ( !inc_ctx_shm_count(d, ctx) )
> +        return NULL;
> +
> +    shm =3D xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
> +    if ( shm )
> +        shm->page_count =3D page_count;
> +    else
> +        dec_ctx_shm_count(d, ctx);
> +
> +    return shm;
> +}
> +
> +static void free_ffa_shm_mem(struct domain *d, struct ffa_shm_mem *shm)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !shm )
> +        return;
> +
> +    dec_ctx_shm_count(d, ctx);
> +    put_shm_pages(shm);
> +    xfree(shm);
> +}
> +
> +static void init_range(struct ffa_address_range *addr_range,
> +                       paddr_t pa)
> +{
> +    memset(addr_range, 0, sizeof(*addr_range));
> +    addr_range->address =3D pa;
> +    addr_range->page_count =3D 1;
> +}
> +
> +/*
> + * This function uses the ffa_tx buffer to transmit the memory transacti=
on
> + * descriptor. The function depends ffa_tx_buffer_lock to be used to gua=
rd
> + * the buffer from concurrent use.
> + */
> +static int share_shm(struct ffa_shm_mem *shm)
> +{
> +    const uint32_t max_frag_len =3D FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE;
> +    struct ffa_mem_access *mem_access_array;
> +    struct ffa_mem_transaction_1_1 *descr;
> +    struct ffa_address_range *addr_range;
> +    struct ffa_mem_region *region_descr;
> +    const unsigned int region_count =3D 1;
> +    void *buf =3D ffa_tx;
> +    uint32_t frag_len;
> +    uint32_t tot_len;
> +    paddr_t last_pa;
> +    unsigned int n;
> +    paddr_t pa;
> +
> +    ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
> +    ASSERT(shm->page_count);
> +
> +    descr =3D buf;
> +    memset(descr, 0, sizeof(*descr));
> +    descr->sender_id =3D shm->sender_id;
> +    descr->handle =3D shm->handle;
> +    descr->mem_reg_attr =3D FFA_NORMAL_MEM_REG_ATTR;
> +    descr->mem_access_count =3D 1;
> +    descr->mem_access_size =3D sizeof(*mem_access_array);
> +    descr->mem_access_offs =3D MEM_ACCESS_OFFSET(0);
> +
> +    mem_access_array =3D buf + descr->mem_access_offs;
> +    memset(mem_access_array, 0, sizeof(*mem_access_array));
> +    mem_access_array[0].access_perm.endpoint_id =3D shm->ep_id;
> +    mem_access_array[0].access_perm.perm =3D FFA_MEM_ACC_RW;
> +    mem_access_array[0].region_offs =3D REGION_OFFSET(descr->mem_access_=
count, 0);
> +
> +    region_descr =3D buf + mem_access_array[0].region_offs;
> +    memset(region_descr, 0, sizeof(*region_descr));
> +    region_descr->total_page_count =3D shm->page_count;
> +
> +    region_descr->address_range_count =3D 1;
> +    last_pa =3D page_to_maddr(shm->pages[0]);
> +    for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> +    {
> +        pa =3D page_to_maddr(shm->pages[n]);
> +        if ( last_pa + FFA_PAGE_SIZE =3D=3D pa )
> +            continue;
> +        region_descr->address_range_count++;
> +    }
> +
> +    tot_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count,
> +                                region_descr->address_range_count);
> +    if ( tot_len > max_frag_len )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    addr_range =3D region_descr->address_range_array;
> +    frag_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count=
, 1);
> +    last_pa =3D page_to_maddr(shm->pages[0]);
> +    init_range(addr_range, last_pa);
> +    for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> +    {
> +        pa =3D page_to_maddr(shm->pages[n]);
> +        if ( last_pa + FFA_PAGE_SIZE =3D=3D pa )
> +        {
> +            addr_range->page_count++;
> +            continue;
> +        }
> +
> +        frag_len +=3D sizeof(*addr_range);
> +        addr_range++;
> +        init_range(addr_range, pa);
> +    }
> +
> +    return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +}
> +
> +static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size=
_t blen,
> +                                struct ffa_mem_transaction_int *trans)
> +{
> +    uint16_t mem_reg_attr;
> +    uint32_t flags;
> +    uint32_t count;
> +    uint32_t offs;
> +    uint32_t size;
> +
> +    if ( ffa_vers >=3D FFA_VERSION_1_1 )
> +    {
> +        const struct ffa_mem_transaction_1_1 *descr;
> +
> +        if ( blen < sizeof(*descr) )
> +            return FFA_RET_INVALID_PARAMETERS;
> +
> +        descr =3D buf;
> +        trans->sender_id =3D descr->sender_id;
> +        mem_reg_attr =3D descr->mem_reg_attr;
> +        flags =3D descr->flags;
> +        trans->handle =3D descr->handle;
> +        trans->tag =3D descr->tag;
> +
> +        count =3D descr->mem_access_count;
> +        size =3D descr->mem_access_size;
> +        offs =3D descr->mem_access_offs;
> +    }
> +    else
> +    {
> +        const struct ffa_mem_transaction_1_0 *descr;
> +
> +        if ( blen < sizeof(*descr) )
> +            return FFA_RET_INVALID_PARAMETERS;
> +
> +        descr =3D buf;
> +        trans->sender_id =3D descr->sender_id;
> +        mem_reg_attr =3D descr->mem_reg_attr;
> +        flags =3D descr->flags;
> +        trans->handle =3D descr->handle;
> +        trans->tag =3D descr->tag;
> +
> +        count =3D descr->mem_access_count;
> +        size =3D sizeof(struct ffa_mem_access);
> +        offs =3D offsetof(struct ffa_mem_transaction_1_0, mem_access_arr=
ay);
> +    }
> +    /*
> +     * Make sure that "descr" which is shared with the guest isn't acces=
sed
> +     * again after this point.
> +     */
> +    barrier();
> +
> +    /*
> +     * We're doing a rough check to see that no information is lost when
> +     * tranfering the values into a struct ffa_mem_transaction_int below=
.
> +     * The fields in struct ffa_mem_transaction_int are wide enough to h=
old
> +     * any valid value so being out of range means that something is wro=
ng.
> +     */
> +    if ( mem_reg_attr > UINT8_MAX || flags > UINT8_MAX || size > UINT8_M=
AX ||
> +        count > UINT8_MAX || offs > UINT16_MAX )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Check that the endpoint memory access descriptor array fits */
> +    if ( size * count + offs > blen )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    trans->mem_reg_attr =3D mem_reg_attr;
> +    trans->flags =3D flags;
> +    trans->mem_access_size =3D size;
> +    trans->mem_access_count =3D count;
> +    trans->mem_access_offs =3D offs;
> +
> +    return 0;
> +}
> +
> +void ffa_handle_mem_share(struct cpu_user_regs *regs)
> +{
> +    uint32_t tot_len =3D get_user_reg(regs, 1);
> +    uint32_t frag_len =3D get_user_reg(regs, 2);
> +    uint64_t addr =3D get_user_reg(regs, 3);
> +    uint32_t page_count =3D get_user_reg(regs, 4);
> +    const struct ffa_mem_region *region_descr;
> +    const struct ffa_mem_access *mem_access;
> +    struct ffa_mem_transaction_int trans;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    struct ffa_shm_mem *shm =3D NULL;
> +    unsigned int last_page_idx =3D 0;
> +    register_t handle_hi =3D 0;
> +    register_t handle_lo =3D 0;
> +    int ret =3D FFA_RET_DENIED;
> +    uint32_t range_count;
> +    uint32_t region_offs;
> +
> +    /*
> +     * We're only accepting memory transaction descriptors via the rx/tx
> +     * buffer.
> +     */
> +    if ( addr )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_set_ret;
> +    }
> +
> +    /* Check that fragment length doesn't exceed total length */
> +    if ( frag_len > tot_len )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_set_ret;
> +    }
> +
> +    /* We currently only support a single fragment */
> +    if ( frag_len !=3D tot_len )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_set_ret;
> +    }
> +
> +    if ( !spin_trylock(&ctx->tx_lock) )
> +    {
> +        ret =3D FFA_RET_BUSY;
> +        goto out_set_ret;
> +    }
> +
> +    if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
> +        goto out_unlock;
> +
> +    ret =3D read_mem_transaction(ctx->guest_vers, ctx->tx, frag_len, &tr=
ans);
> +    if ( ret )
> +        goto out_unlock;
> +
> +    if ( trans.mem_reg_attr !=3D FFA_NORMAL_MEM_REG_ATTR )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    /* Only supports sharing it with one SP for now */
> +    if ( trans.mem_access_count !=3D 1 )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    if ( trans.sender_id !=3D ffa_get_vm_id(d) )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    /* Check that it fits in the supplied data */
> +    if ( trans.mem_access_offs + trans.mem_access_size > frag_len )
> +        goto out_unlock;
> +
> +    mem_access =3D ctx->tx + trans.mem_access_offs;
> +    if ( read_atomic(&mem_access->access_perm.perm) !=3D FFA_MEM_ACC_RW =
)
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    region_offs =3D read_atomic(&mem_access->region_offs);
> +    if ( sizeof(*region_descr) + region_offs > frag_len )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    region_descr =3D ctx->tx + region_offs;
> +    range_count =3D read_atomic(&region_descr->address_range_count);
> +    page_count =3D read_atomic(&region_descr->total_page_count);
> +
> +    if ( !page_count )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    shm =3D alloc_ffa_shm_mem(d, page_count);
> +    if ( !shm )
> +    {
> +        ret =3D FFA_RET_NO_MEMORY;
> +        goto out_unlock;
> +    }
> +    shm->sender_id =3D trans.sender_id;
> +    shm->ep_id =3D read_atomic(&mem_access->access_perm.endpoint_id);
> +
> +    /*
> +     * Check that the Composite memory region descriptor fits.
> +     */
> +    if ( sizeof(*region_descr) + region_offs +
> +         range_count * sizeof(struct ffa_address_range) > frag_len )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    ret =3D get_shm_pages(d, shm, region_descr->address_range_array, ran=
ge_count,
> +                        0, &last_page_idx);
> +    if ( ret )
> +        goto out;
> +    if ( last_page_idx !=3D shm->page_count )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    /* Note that share_shm() uses our tx buffer */
> +    spin_lock(&ffa_tx_buffer_lock);
> +    ret =3D share_shm(shm);
> +    spin_unlock(&ffa_tx_buffer_lock);
> +    if ( ret )
> +        goto out;
> +
> +    spin_lock(&ctx->lock);
> +    list_add_tail(&shm->list, &ctx->shm_list);
> +    spin_unlock(&ctx->lock);
> +
> +    uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> +
> +out:
> +    if ( ret )
> +        free_ffa_shm_mem(d, shm);
> +out_unlock:
> +    spin_unlock(&ctx->tx_lock);
> +
> +out_set_ret:
> +    if ( ret =3D=3D 0)
> +            ffa_set_regs_success(regs, handle_lo, handle_hi);
> +    else
> +            ffa_set_regs_error(regs, ret);
> +}
> +
> +/* Must only be called with ctx->lock held */
> +static struct ffa_shm_mem *find_shm_mem(struct ffa_ctx *ctx, uint64_t ha=
ndle)
> +{
> +    struct ffa_shm_mem *shm;
> +
> +    list_for_each_entry(shm, &ctx->shm_list, list)
> +        if ( shm->handle =3D=3D handle )
> +            return shm;
> +
> +    return NULL;
> +}
> +
> +int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    struct ffa_shm_mem *shm;
> +    register_t handle_hi;
> +    register_t handle_lo;
> +    int ret;
> +
> +    spin_lock(&ctx->lock);
> +    shm =3D find_shm_mem(ctx, handle);
> +    if ( shm )
> +        list_del(&shm->list);
> +    spin_unlock(&ctx->lock);
> +    if ( !shm )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    uint64_to_regpair(&handle_hi, &handle_lo, handle);
> +    ret =3D ffa_mem_reclaim(handle_lo, handle_hi, flags);
> +
> +    if ( ret )
> +    {
> +        spin_lock(&ctx->lock);
> +        list_add_tail(&shm->list, &ctx->shm_list);
> +        spin_unlock(&ctx->lock);
> +    }
> +    else
> +    {
> +        free_ffa_shm_mem(d, shm);
> +    }
> +
> +    return ret;
> +}
> +
> +bool ffa_shm_domain_destroy(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    struct ffa_shm_mem *shm, *tmp;
> +    int32_t res;
> +
> +    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
> +    {
> +        register_t handle_hi;
> +        register_t handle_lo;
> +
> +        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> +        res =3D ffa_mem_reclaim(handle_lo, handle_hi, 0);
> +        switch ( res ) {
> +        case FFA_RET_OK:
> +            printk(XENLOG_G_DEBUG "%pd: ffa: Reclaimed handle %#lx\n",
> +                   d, shm->handle);
> +            list_del(&shm->list);
> +            free_ffa_shm_mem(d, shm);
> +            break;
> +        case FFA_RET_DENIED:
> +            /*
> +             * A temporary error that may get resolved a bit later, it's
> +             * worth retrying.
> +             */
> +            printk(XENLOG_G_INFO "%pd: ffa: Failed to reclaim handle %#l=
x : %d\n",
> +                   d, shm->handle, res);
> +            break; /* We will retry later */
> +        default:
> +            /*
> +             * The rest of the error codes are not expected and are assu=
med
> +             * to be of a permanent nature. It not in our control to han=
dle
> +             * the error properly so the object in this case is to try t=
o
> +             * minimize the damage.
> +             *
> +             * FFA_RET_NO_MEMORY might be a temporary error as it it cou=
ld
> +             * succeed if retried later, but treat it as permanent for n=
ow.
> +             */
> +            printk(XENLOG_G_INFO "%pd: ffa: Permanent failure to reclaim=
 handle %#lx : %d\n",
> +                   d, shm->handle, res);
> +
> +            /*
> +             * Remove the shm from the list and free it, but don't drop
> +             * references. This results in having the shared physical pa=
ges
> +             * permanently allocate and also keeps the domain as a zombi=
e
> +             * domain.
> +             */
> +            list_del(&shm->list);
> +            xfree(shm);
> +            break;
> +        }
> +    }
> +
> +    return !ctx->shm_count;
> +}
> --=20
> 2.34.1
>=20


