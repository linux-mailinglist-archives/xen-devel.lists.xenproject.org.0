Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCAD41C002
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198707.352348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU8M-00030p-2f; Wed, 29 Sep 2021 07:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198707.352348; Wed, 29 Sep 2021 07:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU8L-0002xJ-Vr; Wed, 29 Sep 2021 07:36:05 +0000
Received: by outflank-mailman (input) for mailman id 198707;
 Wed, 29 Sep 2021 07:36:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVU8K-00025H-L7
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:36:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::61c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 906553f6-ccd4-48dc-95b0-6321f163a02f;
 Wed, 29 Sep 2021 07:36:00 +0000 (UTC)
Received: from AS9PR06CA0098.eurprd06.prod.outlook.com (2603:10a6:20b:465::13)
 by AM6PR08MB5542.eurprd08.prod.outlook.com (2603:10a6:20b:71::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 07:35:57 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::a3) by AS9PR06CA0098.outlook.office365.com
 (2603:10a6:20b:465::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 07:35:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 07:35:57 +0000
Received: ("Tessian outbound ab2dc3678fa9:v103");
 Wed, 29 Sep 2021 07:35:54 +0000
Received: from 11bc9da7fabd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 23E42074-F32B-40D7-839A-CC6591765930.1; 
 Wed, 29 Sep 2021 07:35:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11bc9da7fabd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 07:35:43 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR3PR08MB5804.eurprd08.prod.outlook.com (2603:10a6:102:83::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 07:35:41 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 07:35:41 +0000
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
X-Inumbo-ID: 906553f6-ccd4-48dc-95b0-6321f163a02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br4YWecE0/dKzQxIu3myDDCGg0qQtfSf+Xoe6/yi/Ws=;
 b=yf2qpabwx5Cx42oCipcCZDAgOXHBscH+PtDPD0dLLaNOxHDacvIgw30d9bDektio0iRwefp9xDOJgYLg/eKbuPF+EuSvZ9/A9iOMpwd42A1vNnAzZaEaKMwZj89W6bqsRqylvFyO5tXb3UIITLaRBi5+mDuDtZMet+O7GFZXG5g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef6d481e05ba4f41
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNcaf4utAUU/qZgyIIED6jljHtXqi8HH2h0jDD92AfKF05z6OM5Ix/NVc3fFDLA3bxR2NGmtKVXi7ZCRsUFQxA6VW7XlzlGkE7FBbeQ/cmlklysdz9MpfhahUWfQUFwT/TqP2Vl66ZfIPMOsbPTB+lOWoUsLCIwrXIv0X6rCBWAwFZy9wJ7NaFU2hjGpvo3+KiqUtNq34oRjTaavLaaKNGTIjV470HD57pmTjDBrMiCiG8lsuYUKSVx6DMPZYSGzcMd4MtIKTpLJWbDYb3+UZiPsYoQOEZuQgPe1J5o4lD0iuD5b3Ha0l7w+V04gcqgPriTHbKlMZ9B4DVSzDAXQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=br4YWecE0/dKzQxIu3myDDCGg0qQtfSf+Xoe6/yi/Ws=;
 b=SMsIfJg+TMU44/f8AGoLujpu9qGixgt0iU5Bm5mmh1dcq9cBDBN3U4kB/VwU+BwQaq3cickJl4dO26ETELAwP0twzi+8rvoEv4Qhb4Ixe5Kjh8hER1nfLQ0GZm/1Sumh3wcuB6O0cpHB5f0mc+iOa7NVMO+tNo9lhnrmz5MpxdpGfL4+SSNWjSzJFE+mhEg8db9uZPSQ9hktodZNKDq4XpVAuYRMq0sEaSNPTociIh4TBj9PxRP3c8MTJYkeuuQjzQ3sfTO64jyCSqW1OWWzlI43gbGrbUueV2NSY/1IXrmFJG/YIxQt8KzjbO/k5dYOw0Ax7Pec9HpXu9zH6MlX+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br4YWecE0/dKzQxIu3myDDCGg0qQtfSf+Xoe6/yi/Ws=;
 b=yf2qpabwx5Cx42oCipcCZDAgOXHBscH+PtDPD0dLLaNOxHDacvIgw30d9bDektio0iRwefp9xDOJgYLg/eKbuPF+EuSvZ9/A9iOMpwd42A1vNnAzZaEaKMwZj89W6bqsRqylvFyO5tXb3UIITLaRBi5+mDuDtZMet+O7GFZXG5g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre
 Przywara <Andre.Przywara@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 09/17] xen/arm: Add support for PCI init to initialize
 the PCI driver.
Thread-Topic: [PATCH v3 09/17] xen/arm: Add support for PCI init to initialize
 the PCI driver.
Thread-Index: AQHXtJXC6tCzxs8NFU+yBY1A0K6UAau6oAmA
Date: Wed, 29 Sep 2021 07:35:41 +0000
Message-ID: <BCA0C9DB-C244-4CF9-8965-43410FE5A14E@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <31f2e3baf45f059a8ddac22fefc7cdfe1bc63ef5.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <31f2e3baf45f059a8ddac22fefc7cdfe1bc63ef5.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 53638ebc-45ec-40cd-c281-08d9831bc6b3
x-ms-traffictypediagnostic: PR3PR08MB5804:|AM6PR08MB5542:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB55427640E8819437B357FBA79DA99@AM6PR08MB5542.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tSKLWmCx4eW1kMdSS1qmyQ+WZZ6FojAGC3RdMaG8K2FCJxt2A7PamBRYMJse/0LIJlbnTRo41VzLQACTd4/uKF2OVbfA1gjhIkUqrUvkvXxC8xzRJRxEisdg8Kom/a/dIhfVeiL/YZSTDNwQCTkbejBXflcfuuub4BihD6/wj/H6YnPlME3g/oEqm0MJS0s+ES2f3/tgFy5GqP/JjxzF5ImKyk+eIY7QHsgLzrJj+vlW3T7UlAW3Zp3Gicai6tzeFUsTqGApA1PdpMGHM1psDIZvfDBG8/tcKT4Oe79dEeNK7RZTb15vdbz1TrIO/UByGJyUzBHkfEjejivYawnPECZ7bnWse1i1ob4sOsUG/52Nw/pAO7Zw/5658Sn63b2hhVBokf1aEHhFzz5I4rERUGGausZwfmdFYQVHY9eGwJtaxcfzwTs1kSMbZ8BPTg96Q2uWfT9XqZ+szPscGEqi3Wx1m7Dr7j6f7oAV8DQeTbplLq+1ScOQvhIP4njOLCecNLA0ZdlF7guaZSJafdLdupmT7G3WKx/3bQNMKNz0F8Zb/jvPNUyruVwJNk2JQWRyUTB4oZOTcVQL5L0ce9A/PPn42t8yXUfgc86jTwFILl/10yh6pSd80oxRBa3y2aCD6/QxTjGttVReL49lB7tOlR1s4spqiHFF/ycohMjOEuwYPNSMxM3mGunmPScXpVuAjznxT0PhDr4Eo2ldovRePp2P2LYtixfEKee+WAwQhHdiZ+08J1Z7cmAUH6pXJGzNWm9iVjCaDQ4pVBVO+tHniOrTxSdHUTr0yTPYDQMcKDjRthNNY4CtHNMpjcHqHT6vbx4I8sLtyIKku+CATTSL7Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(2616005)(316002)(6512007)(37006003)(2906002)(4326008)(38100700002)(122000001)(36756003)(33656002)(5660300002)(6486002)(71200400001)(6636002)(54906003)(83380400001)(186003)(76116006)(91956017)(66476007)(66946007)(26005)(86362001)(6506007)(53546011)(8676002)(66556008)(508600001)(6862004)(8936002)(64756008)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8CB8C42FD2E2864D82FF4A3ECE8F85EF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5804
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	177cc5ba-2abf-45b8-3c3a-08d9831bbd7c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lz3fLUcg9fIU8SWeZIt9BXQZ4F3To0F+itFMvBPD1BEtPsR9ah42sKihuz4Z9fo7GReSUCtY7Ge0saxoAdxci2Vr5ITg+PyxRv+yk2U95cApyIirRnVHpDBbnJ4LWIYDIq01gamU7e+iBusYOkluOh+I8lj6D+6hMpGsjhMzUo0+XVsIewvpmgXi0ve2vwny5GcDOt+Aph5NYMZwzQDOL8lJbsEyfUmcyCNZwRI6RyukZKrBpJ5OcjHY/Dem2mI5t7AhjbZQ861UnvJHA2hq4fM7AaKYRO5IDKJiM+YkDUUWAnhuVoK4DCd4hPl/1RvPFavyEyD2KCce4bPUacwOFewev7t/37RjOBbnEhd0XpIshhq/htJvcencrnhuA266e9G9D0eNKbpeGPM0TK9DvNaFRBKrHyaw9+pLutBdQ4EpSzK3hGRNtRDhuEti31NAWOhCaVTVFXfL0QEKnDsGxllTkj/PIaorcD0hx0jEnxX27C14vBexN2Df2d6bZW28VgnkR+y22EDbbHBZgsMgIJN5nn8HVO1t86HClI89pxIIKlW9gkTwzeSRrb3Qm5PYbY6nIAJSw+LkatPbmLR9cNyVg8W9NrarJ34DfuoluT8UUD9gHy4aDoFPUHCNakTPOh0dnXZIW8pjH5khfNpZjBIQpTAGZYZAJkjoaYhdUYmCyqaAi7BM9xz/Q0O/hjL5XYbsITB8C7AR7J1wOsR+13Rdni0gxHgIdbuaT+Gmw5TgQze/+i0x57ek4VM+nQOdjMxXpBeNyYjq81pNlDFFyyhGw0yOQDts0R0k4IUy5e0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(36860700001)(336012)(70206006)(107886003)(316002)(83380400001)(8936002)(6862004)(26005)(70586007)(81166007)(6512007)(33656002)(47076005)(37006003)(6486002)(186003)(5660300002)(6636002)(82310400003)(6506007)(86362001)(2906002)(508600001)(53546011)(54906003)(2616005)(36756003)(4326008)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 07:35:57.0071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53638ebc-45ec-40cd-c281-08d9831bc6b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5542

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> pci_init(..) will be called during xen startup to initialize and probe
> the PCI host-bridge driver.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3:
> - Some nit for device_init(..) return logic
> - Remove inline from acpi_pci_init(..)
> - Modify return value for apci_pci_init(..) to return -EOPNOTSUPP
> Change in v2:
> - ACPI init function to return int
> - pci_segments_init() called before dt/acpi init
> ---
> xen/arch/arm/pci/pci.c       | 51 ++++++++++++++++++++++++++++++++++++
> xen/include/asm-arm/device.h |  1 +
> 2 files changed, 52 insertions(+)
>=20
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index a7a7bc3213..e359bab9ea 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -12,6 +12,10 @@
>  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>  */
>=20
> +#include <xen/acpi.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> #include <xen/pci.h>
>=20
> /*
> @@ -22,6 +26,53 @@ int arch_pci_clean_pirqs(struct domain *d)
>     return 0;
> }
>=20
> +static int __init dt_pci_init(void)
> +{
> +    struct dt_device_node *np;
> +    int rc;
> +
> +    dt_for_each_device_node(dt_host, np)
> +    {
> +        rc =3D device_init(np, DEVICE_PCI, NULL);
> +        /*
> +         * Ignore the following error codes:
> +         *   - EBADF: Indicate the current device is not a pci device.
> +         *   - ENODEV: The pci device is not present or cannot be used b=
y
> +         *     Xen.
> +         */
> +        if( !rc || rc =3D=3D -EBADF || rc =3D=3D -ENODEV )
> +            continue;
> +
> +        return rc;
> +    }
> +
> +    return 0;
> +}
> +
> +#ifdef CONFIG_ACPI
> +static int __init acpi_pci_init(void)
> +{
> +    printk(XENLOG_ERR "ACPI pci init not supported \n");
> +    return -EOPNOTSUPP;
> +}
> +#else
> +static int __init acpi_pci_init(void)
> +{
> +    return -EINVAL;
> +}
> +#endif
> +
> +static int __init pci_init(void)
> +{
> +    pci_segments_init();
> +
> +    if ( acpi_disabled )
> +        return dt_pci_init();
> +    else
> +        return acpi_pci_init();
> +}
> +__initcall(pci_init);
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
> index ee7cff2d44..5ecd5e7bd1 100644
> --- a/xen/include/asm-arm/device.h
> +++ b/xen/include/asm-arm/device.h
> @@ -34,6 +34,7 @@ enum device_class
>     DEVICE_SERIAL,
>     DEVICE_IOMMU,
>     DEVICE_GIC,
> +    DEVICE_PCI,
>     /* Use for error */
>     DEVICE_UNKNOWN,
> };
> --=20
> 2.17.1
>=20
>=20


