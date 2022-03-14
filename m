Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC964D7AA6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 07:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289906.491593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTdr5-0001XC-Ra; Mon, 14 Mar 2022 06:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289906.491593; Mon, 14 Mar 2022 06:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTdr5-0001Uh-Oi; Mon, 14 Mar 2022 06:06:55 +0000
Received: by outflank-mailman (input) for mailman id 289906;
 Mon, 14 Mar 2022 06:06:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QvMz=TZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nTdr3-0001Ua-U9
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 06:06:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f06dcc8d-a35c-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 07:06:51 +0100 (CET)
Received: from AS9PR06CA0351.eurprd06.prod.outlook.com (2603:10a6:20b:466::17)
 by DBBPR08MB4743.eurprd08.prod.outlook.com (2603:10a6:10:d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 06:06:46 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::6b) by AS9PR06CA0351.outlook.office365.com
 (2603:10a6:20b:466::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Mon, 14 Mar 2022 06:06:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.26 via Frontend Transport; Mon, 14 Mar 2022 06:06:45 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Mon, 14 Mar 2022 06:06:45 +0000
Received: from 69fde00719bc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F1FA95F9-60AC-4536-9635-1AEF435A75FD.1; 
 Mon, 14 Mar 2022 06:06:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 69fde00719bc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Mar 2022 06:06:39 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by AM9PR08MB6981.eurprd08.prod.outlook.com (2603:10a6:20b:414::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Mon, 14 Mar
 2022 06:06:37 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::41e8:ebec:d794:38aa]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::41e8:ebec:d794:38aa%3]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 06:06:37 +0000
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
X-Inumbo-ID: f06dcc8d-a35c-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5vDZRUa8GvcEAGaJ+myRho+cJnHExOj0FwE3vOCH4E=;
 b=B/goTK5KdXh9hg0HReTy73ChXzm07YN/fsVfeelIzegV6KZ27RJexnHX/CJOAjxE5mG4Bh3QYkl3SPdew5rrecGeN2Gatv7QLahemj5nI18ZT6gvyLxE6KunGo4tmwgIn7gcVGMoI52+3CMKTvICfduheg4ehvxUZUkxEu9mRQg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTnXqVuEKz2T1A3msZozOK/9+vzt6YhqZOZ1j3bmRNwKZjXeb11FKjKLxsX/NEUyAQ0Z7sDFIk3iNIY83G630euoDgDX/3S5ytUAsyz3iiPELTTT3CWt0OVIHBj7SHnznJgC95ApGh71CkfvV5mv29AeJzyPnD5dlzQBmTSSm1/MmKbood+Rf2JAn4TusefzQ/cvcr1EGknOejMtwR7CeX8yZLaok7fp9vU47xcvG0Tf8XoNSe+PLKsepde9pWqn1lwiuNsNzt0ts+JjZyu9g+ggmZVUI65OeDkz/YL5AC06OWK9dSumXcQUz84cXcmx2aTuna1s/qdkn4mOVF2loQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5vDZRUa8GvcEAGaJ+myRho+cJnHExOj0FwE3vOCH4E=;
 b=iuumx5NkHA0SIY87WsAKEW0Ivf70bDMHlNmyikwVkGfM8A5Sh40q5EltXRd//1aR2fbD4yF4MDr9A7W+hpAnuhSQczi9OX8ziGheqlMLJtbegKoGp62laM3ZrfjfqEPpXhXB6A/CopT/2mmE0gKMbtuygUt7gvAetMFug5UZFm/Oy+hyRTctKvpY9TG5VjGIAxqAsiowizYk37QVMWoAu5swqM4+vPOyecdQbCXr1RvqhC3rbfzRtu+tmDBpCFJzpGGXiNkR3ZVoUtoF8smXVsl0akOz+aE4VBQ+mDlMcPxvw/5PaEfyLfNKHYJv86vpQNQOMYd1mxh1sj2gdNrgzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5vDZRUa8GvcEAGaJ+myRho+cJnHExOj0FwE3vOCH4E=;
 b=B/goTK5KdXh9hg0HReTy73ChXzm07YN/fsVfeelIzegV6KZ27RJexnHX/CJOAjxE5mG4Bh3QYkl3SPdew5rrecGeN2Gatv7QLahemj5nI18ZT6gvyLxE6KunGo4tmwgIn7gcVGMoI52+3CMKTvICfduheg4ehvxUZUkxEu9mRQg=
From: Henry Wang <Henry.Wang@arm.com>
To: Marco Solieri <marco.solieri@minervasys.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Marco Solieri <marco.solieri@unimore.it>, Andrea Bastoni
	<andrea.bastoni@minervasys.tech>, Luca Miccio <lucmiccio@gmail.com>
Subject: RE: [PATCH 10/36] xen/arch: check color selection function
Thread-Topic: [PATCH 10/36] xen/arch: check color selection function
Thread-Index: AQHYL/Q7H6udck4WIkSPZpB4k5JnoKy+cvyw
Date: Mon, 14 Mar 2022 06:06:37 +0000
Message-ID:
 <PA4PR08MB6253129DC0D55F2532C31EFC920F9@PA4PR08MB6253.eurprd08.prod.outlook.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-11-marco.solieri@minervasys.tech>
In-Reply-To: <20220304174701.1453977-11-marco.solieri@minervasys.tech>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7DE6E42948E5EE489DD59FE85D50BA3F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 88d74f00-90a1-4dfa-1a54-08da0580d1b5
x-ms-traffictypediagnostic:
	AM9PR08MB6981:EE_|AM5EUR03FT062:EE_|DBBPR08MB4743:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4743190E527A9B576B988DBD920F9@DBBPR08MB4743.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 g/r5E+gawTjL7dmXjLjsLRFIhQO8VuUdnaxNwXI1THd2590N/7OcLI1+bGSPdtGrzlzANRnTzbzFdPuO2b2nF9Qi7xy6+SbF/xFxQmGIh/7+eLtcLFNjCm3pGw4eILGG8NYcMORXev6jV09btXTAC67enYiIsWKFHj03+GYy6dy16bmpj1xcKLQKwhUZZSwBwL8w149YI3XCprU9tzVoWMZz6pOdzNwf14zz8euo+TVfg4igVwFI6Vn30/fo5iasVAnm/jWAZWIIHa8YYIrjItm7sYh+qTsQjfV8XHBJsLXwttsjtAM7LDT9c+nqMiarMKfyR9n1VI7fc/5xW8i8lBTPjbCE+6KKTRZoHDMywFfWushr2hXN+hiyrjhIQpeMii7u9i9judrDYkJ/q+tqyU84rs02tepsk1kkbkfPwwBNBewu2BUc31+2aJZeAaT76ZZnktioHkT/JMI2OMP2bucsyX78ZGzbmkhQdcr1dlgePEsOyX3PSn1D1Jvcr12iMUVy9/fRSakCF18dV2eMDhMEF0pb+q+DWiS7sfouVGPbv4J35Lj8pp2e4hWKnO+D5gNPOnmEKw7vHhsTqN1u3ZBtcX/yizN3K64b1I+NLP6GGqU5NthLrtXYesSEGv0qtD2oI4hNllW6Cp22I7GDOfquHxYORseOK0DwNoPz4C+GuUXKMNuB6VSsmSVs/uyqDcHrJKTCx+KPX+n/zOkavg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(38070700005)(7416002)(66446008)(52536014)(8936002)(5660300002)(110136005)(54906003)(316002)(8676002)(76116006)(4326008)(66946007)(86362001)(64756008)(66476007)(26005)(66556008)(186003)(9686003)(122000001)(6506007)(55016003)(7696005)(53546011)(33656002)(2906002)(83380400001)(38100700002)(508600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6981
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39a89864-cfea-497e-e71d-08da0580ccd2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OWJyF4pwZ/MuHe5UA7GlZZHNQCqLw+mw3wFdNWKXUCOGqVJa32gPY2hp4IYvRNh0icEfeWCOYzFzQtHgR82ZYwLIF76Pk25fUmICWomDOu/4CopoUH0Fd64nbcsDOUoNPEnkGBAiznBWiM1B5YwhSTM+W59eslEg9AWyiL3C8DIS7RAITJ+uimRPpamvjZRb5K2ZCNwKeNshZRh+EqcB/+wHq5nTtS4vUgHCF1UElnaIywwwFl/Q/+W2blk/rFWNtZMecaI9L/Xj4FXna6wD4YZKFW4sHYeOouUFkRlXurvRC23yRmGh75Ck4PByBFw2n6SBhwrvbdL/ccJQSbR54aoXIMXWl98P9bhBDKu5T3pU7oaxxbAaX6RpeDoq1e0BVN2OuKlqMv5rehHK+F1DbhbtjEjo+4bEWVy5Y6eCQGvbjGLadIYYv8LGs4OB2UNAbeWhsWl3d4v25ZuZnhCpL9M5X2XaL4Zz4a46jz39dgEoITCUhaWCoYzZB1KnKjbLdp29XQotruqx+pRXz94TZZRnB0CaZ8TLItwb9RkrVa0VomTRpMxrcA8o3WI3jHRwun+aQPBsprDl2b+ZGTsLeBt3us6ADpEFXHTR+wdyd8K0i0DGpSLtamDfVnx6GDx1xP/XyWT3zTSU4p69WBrJKxQdJiRH16rx+Gz3opNkPGdZj8fbhGoZeEk8jSSLmNQL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6506007)(70586007)(7696005)(70206006)(9686003)(316002)(86362001)(82310400004)(54906003)(110136005)(508600001)(53546011)(356005)(47076005)(40460700003)(36860700001)(186003)(107886003)(336012)(26005)(83380400001)(81166007)(33656002)(8936002)(5660300002)(52536014)(55016003)(4326008)(8676002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 06:06:45.7981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d74f00-90a1-4dfa-1a54-08da0580d1b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4743

Hi Marco,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Marco Solieri
> Sent: Saturday, March 5, 2022 1:47 AM
> To: xen-devel@lists.xenproject.org
> Cc: Marco Solieri <marco.solieri@minervasys.tech>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
> Jan Beulich <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano
> Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Marco Solieri
> <marco.solieri@unimore.it>; Andrea Bastoni
> <andrea.bastoni@minervasys.tech>; Luca Miccio <lucmiccio@gmail.com>
> Subject: [PATCH 10/36] xen/arch: check color selection function
>=20
> From: Luca Miccio <lucmiccio@gmail.com>
>=20
> Dom0 color configuration is parsed in the Xen command line. Add an
> helper function to check the user selection. If no configuration is
> provided by the user, all the available colors supported by the
> hardware will be assigned to dom0.
>=20
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>

For the first 10 commits:

Tested-by: Henry Wang <Henry.Wang@arm.com>

> ---
>  xen/arch/arm/coloring.c             | 17 +++++++++++++++++
>  xen/arch/arm/include/asm/coloring.h |  8 ++++++++
>  2 files changed, 25 insertions(+)
>=20
> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> index f6e6d09477..382d558021 100644
> --- a/xen/arch/arm/coloring.c
> +++ b/xen/arch/arm/coloring.c
> @@ -179,6 +179,23 @@ uint32_t *setup_default_colors(uint32_t *col_num)
>      return NULL;
>  }
>=20
> +bool check_domain_colors(struct domain *d)
> +{
> +    int i;
> +    bool ret =3D false;
> +
> +    if ( !d )
> +        return ret;
> +
> +    if ( d->max_colors > max_col_num )
> +        return ret;
> +
> +    for ( i =3D 0; i < d->max_colors; i++ )
> +        ret |=3D (d->colors[i] > (max_col_num - 1));
> +
> +    return !ret;
> +}
> +
>  bool __init coloring_init(void)
>  {
>      int i;
> diff --git a/xen/arch/arm/include/asm/coloring.h
> b/xen/arch/arm/include/asm/coloring.h
> index 8f24acf082..fdd46448d7 100644
> --- a/xen/arch/arm/include/asm/coloring.h
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -26,8 +26,16 @@
>  #define MAX_COLORS_CELLS 4
>=20
>  #ifdef CONFIG_COLORING
> +#include <xen/sched.h>
> +
>  bool __init coloring_init(void);
>=20
> +/*
> + * Check colors of a given domain.
> + * Return true if check passed, false otherwise.
> + */
> +bool check_domain_colors(struct domain *d);
> +
>  /*
>   * Return an array with default colors selection and store the number of
>   * colors in @param col_num. The array selection will be equal to the do=
m0
> --
> 2.30.2
>=20


