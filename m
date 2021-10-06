Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E949423B9B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 12:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202743.357748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4LC-00011I-9H; Wed, 06 Oct 2021 10:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202743.357748; Wed, 06 Oct 2021 10:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4LC-0000xo-4k; Wed, 06 Oct 2021 10:40:02 +0000
Received: by outflank-mailman (input) for mailman id 202743;
 Wed, 06 Oct 2021 10:40:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mY4LB-0000xZ-Hf
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 10:40:01 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::623])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 268dfc14-19c9-4e27-9ceb-a0305553be3c;
 Wed, 06 Oct 2021 10:39:59 +0000 (UTC)
Received: from AM5PR1001CA0057.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::34) by VI1PR08MB3453.eurprd08.prod.outlook.com
 (2603:10a6:803:80::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Wed, 6 Oct
 2021 10:39:55 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::7b) by AM5PR1001CA0057.outlook.office365.com
 (2603:10a6:206:15::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 10:39:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 6 Oct 2021 10:39:55 +0000
Received: ("Tessian outbound a8bfe25d7364:v103");
 Wed, 06 Oct 2021 10:39:55 +0000
Received: from d42df005eecf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 407665D2-DA7C-4DE9-973C-9EDEAB64F519.1; 
 Wed, 06 Oct 2021 10:39:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d42df005eecf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Oct 2021 10:39:43 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4968.eurprd08.prod.outlook.com (2603:10a6:20b:e2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 10:39:42 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 10:39:42 +0000
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
X-Inumbo-ID: 268dfc14-19c9-4e27-9ceb-a0305553be3c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2gLukLizB6EvFPvuJs+BvNoF5hefnKCjrPlSL1pTac=;
 b=D+DZBM8pGp87I+aEDDgoO9JOxD2G3IvmRd9vAjqk1/Km0Q9OAjaC6gWGoz4OM5cZyHp7qjwbWTLMop8BbIcr8Clm3J7a+t22oFJPquUfTZ2ggmGRW5j8D9G2rI6K7YL8OOZIyENRr5Mni1I2+q8FBuc1EeZRECMDzoUyQf4CKAY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 691850f29fb1fea6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhLJoP8TFqFZCsGm/lwsJP9Mby6SJaRvinaQpykAUlS1UyWRA5soXblfLddbKfwBr5sawczwiL7JN621/IhRvl4O0w59gh20JOa930OLYnyvCLhVAjD9AiIeNS4PhKNyhUeGCImELn8I1JeYnRtUdbTj9AYCldj+GA1WgSXhIXd9d+gF3OmcrwUDIUWr700hvLmOuOkM9x0Xy8SbVaXonKcXE3PBCxPKCnkTzffAudy2geohJqBLPIRHHg8Hk6xqDWXZkdadz5O7FR51Z+o1D0giSomdFJnqEnG4JDI3oH4F/MyTuKbw4yuwOo4OKxFNthfz/QBWSgswcljgGIzwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2gLukLizB6EvFPvuJs+BvNoF5hefnKCjrPlSL1pTac=;
 b=hHXqYKGaZCAJswi71vTAITuKu2rwQWTojlI59KpB6cTvS2ktKnbwelj1E5CDyPYaJSZMhp30Hm214rN6OjFr2EpBldhkY5pDbI4wX4aluHkTZ7B/ACqu8G49/EJO1IkYuKs4Wvzav3uK0ORmkiAibwOW8BdxDS1fW+yrsHfYL9vc4XAqVAHpyxzWc/fLKfig1ROXc619bUbeBapUPWgSUJbIfybqPN0d9Y3PhMV7I+yqOrKqXXvE7aDf/QHbRouN7Xc9zvvN96eYQZUAlAxDBU5mkz4UmNbh3sEzEFRxenLeBCoVKp/rK9pfSGtqPjVRy5hsXYr7IjAIxxriQwBw4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2gLukLizB6EvFPvuJs+BvNoF5hefnKCjrPlSL1pTac=;
 b=D+DZBM8pGp87I+aEDDgoO9JOxD2G3IvmRd9vAjqk1/Km0Q9OAjaC6gWGoz4OM5cZyHp7qjwbWTLMop8BbIcr8Clm3J7a+t22oFJPquUfTZ2ggmGRW5j8D9G2rI6K7YL8OOZIyENRr5Mni1I2+q8FBuc1EeZRECMDzoUyQf4CKAY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, "Artem_Mygaiev@epam.com"
	<Artem_Mygaiev@epam.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Ian Jackson <iwj@xenproject.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [PATCH v4 08/11] libxl: Only map legacy PCI IRQs if they are
 supported
Thread-Topic: [PATCH v4 08/11] libxl: Only map legacy PCI IRQs if they are
 supported
Thread-Index: AQHXuSnXiELWieMIEkueEhWKvtLbfKvFypyA
Date: Wed, 6 Oct 2021 10:39:42 +0000
Message-ID: <98FF5F02-ADD2-4A4C-A20C-8CC0CAF1B03E@arm.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
 <20211004141151.132231-9-andr2000@gmail.com>
In-Reply-To: <20211004141151.132231-9-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5c2ceb94-fb93-4e13-7f41-08d988b5a2c8
x-ms-traffictypediagnostic: AM6PR08MB4968:|VI1PR08MB3453:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3453644C671FBE21BA1A84EAFCB09@VI1PR08MB3453.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hSU4xofl+9X400QQAiuXPa1rLybkSu3W9uzvf09k/O+cCbgmLlWMUu5dzh66g+FOQN0OHhqNUpgKPDSEoeJmRWQp+piETXPF2tyzyZPSinHwlVhlIaSIzwNWj3bLK9amjV4X8bORzTtXez8kROC4bX25T3v0n3lV3Fo9kQWJ1NcfvSmtoypm6+6Ke5IPtqkrvhuZxr0bKAkJMYBptgYP3CuzFLYOG80WuokDwCN0SxcRi+xjmhVh3XjiBApwerWTyAb0moLf6jSkG5GfgOe31Fj1BVc0JzACKUgLnGomkuUgVNk3plid/Bh+v0QtXr2gS+5AvRdWU4ErM233YqKBIlEvrldVPHzxDpOqTyfgA8+PkL8hBWysbyp2annY+tHKmYiuHWQcxfyf35Ek3mSrrkxu1I0Mlm9udIZvgGMQy0pJ60ZFgVMx0/0sXJtWScx75n/N38KUUOSV2Iz21sThagEglTaBI2n0SjFAOH7e98GQujgfsRlLNL43pQyD4RVKz/4qRntQ3/Dv7RUBeHGb9hthU7nWA11kAr0AqyP7E2rMnLCfv7XY7R3xpTDk1+UhIx61zLLW4Zfu661Q2yLD6GEpqDwY7FkwYpHnNfsKgq5kUrp5qFJfWlrczf8NhMmlxPIBvUvbwXQODKQh9HGJQAZhEQSejbTRBxCgs0byPN/fFH6jO4UxT8LYlMESMFDw5cyinK4FdOgJHqgKDIBXvZEavPaobirZynAezdLenBfZOwKo94opEulOEDcel/8V
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(83380400001)(53546011)(186003)(33656002)(86362001)(8676002)(5660300002)(2616005)(4326008)(8936002)(6506007)(26005)(66476007)(66946007)(76116006)(66556008)(91956017)(66446008)(64756008)(6486002)(6512007)(508600001)(316002)(6916009)(7416002)(54906003)(2906002)(122000001)(38100700002)(71200400001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E8D099727178E4AA63C07027370197E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4968
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d8fbe1bf-27f9-46b3-290a-08d988b59b1a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yg+38KuGqh34Jv5VTqjiu6JENHH1f1bC0NhnFSNoMRm/kPHZl8ccJtU5HMgWtFZZo/XB066NDJMYQWl8mRbHVkz+5SyT74CKjzpNxj1BCh5qdt3RUyVwY8XbQKvQn18MZ4aTA58xC3cRzuojwnVJcKs9Lg+BAqmLHOGB1t+ekFWK9mx/zCXAFomurItFvbWMqO7m6u0P+OlU641Y9MtXsGbyI3rK1eZqlV8jdv6hxk2QuvP6vg1DUIn4ogWCz4sE9VNIBnci8gU2RcuqBMuaOWXUPPQThxWXQ//U+xJaGlAv/jcOs2VIxaVTy2ymU6mTxtfbVZiAfAeWCLsYlgrter2/4wtntGDMxEFN+VaXNpSamTYFZL1WLDmu5X5+Ls13qze6dexplECFIJLvblSHuV+xnpYLJsfEaVIzsRBOmTtK+WxOPIxEifmpO2yc0dhdWzABKCCKptHV3JCCs5/+6TBDLDYly0RpjznOqIl+vyWnwA+HLY7zSVsYIesBNCUGtvoL7tqnYGCG1jXFr9DXYrFAh5bPJeLwDAy34MfPuOJ7TcT1PG6R4YLN7HztuVMM25nllOyFCrOOrOUsjHVqnlEAybQrUddl74vWA0yksigOnnkiRhRui5bLhvlxBYndww3K/xab21Yb7750sKQIs6gKOBtj5t1J8BM8HeiYqiMb2jvwopQDi52nbeiCgT30tVUZ75eMQYTUugVU0Jl6Iw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(86362001)(4326008)(6862004)(5660300002)(70586007)(36860700001)(33656002)(6486002)(356005)(336012)(54906003)(107886003)(81166007)(70206006)(508600001)(36756003)(82310400003)(8676002)(186003)(316002)(8936002)(2906002)(2616005)(6506007)(83380400001)(26005)(53546011)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 10:39:55.0543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2ceb94-fb93-4e13-7f41-08d988b5a2c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3453

Hi Oleksandr,

> On 4 Oct 2021, at 3:11 pm, Oleksandr Andrushchenko <andr2000@gmail.com> w=
rote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> Arm's PCI passthrough implementation doesn't support legacy interrupts,
> but MSI/MSI-X. This can be the case for other platforms too.
> For that reason introduce a new CONFIG_PCI_SUPP_LEGACY_IRQ and add
> it to the CFLAGS and compile the relevant code in the toolstack only if
> applicable.
>=20
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Juergen Gross <jgross@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> Since v1:
> - Minimized #idefery by introducing pci_supp_legacy_irq function
>   for relevant checks
> ---
> tools/libs/light/Makefile    |  4 ++++
> tools/libs/light/libxl_pci.c | 13 +++++++++++++
> 2 files changed, 17 insertions(+)
>=20
> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> index 7d8c51d49242..bd3f6be2a183 100644
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -46,6 +46,10 @@ CFLAGS +=3D -Wno-format-zero-length -Wmissing-declarat=
ions \
> 	-Wno-declaration-after-statement -Wformat-nonliteral
> CFLAGS +=3D -I.
>=20
> +ifeq ($(CONFIG_X86),y)
> +CFLAGS +=3D -DCONFIG_PCI_SUPP_LEGACY_IRQ
> +endif
> +
> SRCS-$(CONFIG_X86) +=3D libxl_cpuid.c
> SRCS-$(CONFIG_X86) +=3D libxl_x86.c
> SRCS-$(CONFIG_X86) +=3D libxl_psr.c
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 59f3686fc85e..4c2d7aeefbb2 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1364,6 +1364,15 @@ static void pci_add_timeout(libxl__egc *egc, libxl=
__ev_time *ev,
>     pci_add_dm_done(egc, pas, rc);
> }
>=20
> +static bool pci_supp_legacy_irq(void)
> +{
> +#ifdef CONFIG_PCI_SUPP_LEGACY_IRQ
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
> static void pci_add_dm_done(libxl__egc *egc,
>                             pci_add_state *pas,
>                             int rc)
> @@ -1434,6 +1443,8 @@ static void pci_add_dm_done(libxl__egc *egc,
>         }
>     }
>     fclose(f);
> +    if (!pci_supp_legacy_irq())
> +        goto out_no_irq;
>     sysfs_path =3D GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
>                                 pci->bus, pci->dev, pci->func);
>     f =3D fopen(sysfs_path, "r");
> @@ -1983,6 +1994,8 @@ static void do_pci_remove(libxl__egc *egc, pci_remo=
ve_state *prs)
>         }
>         fclose(f);
> skip1:
> +        if (!pci_supp_legacy_irq())
> +            goto skip_irq;
>         sysfs_path =3D GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->doma=
in,
>                                pci->bus, pci->dev, pci->func);
>         f =3D fopen(sysfs_path, "r");
> --=20
> 2.25.1
>=20


