Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEB045B903
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 12:21:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230342.398206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpqKT-0005S6-H5; Wed, 24 Nov 2021 11:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230342.398206; Wed, 24 Nov 2021 11:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpqKT-0005Oi-D9; Wed, 24 Nov 2021 11:20:45 +0000
Received: by outflank-mailman (input) for mailman id 230342;
 Wed, 24 Nov 2021 11:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDHO=QL=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1mpqKS-0005Oc-AE
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 11:20:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f62f76a-4d18-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 12:20:42 +0100 (CET)
Received: from DB6PR0801CA0059.eurprd08.prod.outlook.com (2603:10a6:4:2b::27)
 by DB9PR08MB6937.eurprd08.prod.outlook.com (2603:10a6:10:26e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 24 Nov
 2021 11:20:39 +0000
Received: from DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::81) by DB6PR0801CA0059.outlook.office365.com
 (2603:10a6:4:2b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Wed, 24 Nov 2021 11:20:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT047.mail.protection.outlook.com (10.152.21.232) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 11:20:38 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Wed, 24 Nov 2021 11:20:38 +0000
Received: from a0c2ca316672.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2EBB8CBC-767F-431B-BBC5-5A1CCB0EC3C9.1; 
 Wed, 24 Nov 2021 11:20:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a0c2ca316672.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Nov 2021 11:20:31 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4438.eurprd08.prod.outlook.com (2603:10a6:20b:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 11:20:30 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%9]) with mapi id 15.20.4649.026; Wed, 24 Nov 2021
 11:20:29 +0000
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
X-Inumbo-ID: 8f62f76a-4d18-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VASbmtiPzZj2bg7PWoHSCnmxegIoaYQfEalPM50YTyg=;
 b=rZk/feNTfk7HmiUP/Kpbi8GSeO80PNr5E+aZN0VFOQmJre+6LHZKyJ5wOiu+BnTTR9akYH5mt8B8zX7sqfsYEvP8F613YsY3en5FxYfgF/KnECVhgfqU9BX56Ct2RTATP9ZoTcnb6TTT2OOi1BHJU3zMXlBmO0sX3Eu8UYXxVPg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7e315e524f77395
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSWyBVmlPtVawkxFRYzlx9vBSKV74FdncGdC10g4cgMknc+zSGyY911OLcK4DFtF8/UWWz+LEvJePdQrEbCxsSlNEsqwa0frUrLqoSJp2+W60R3JVse2vQMAgEnP0xKYud72VlEmS7rGbDEFN6DKweTFwO04apXFzXLTPLyQHbrqTdSpyfjbTKqMmxy/E9vUO5FJpvPFfaD6wI401q+o8FuCm97ztDdN2cr4rfdH9nfsECx+L7JMGPQmkMPUPqHohyLMnVTFMlcP5wbnzkyorsnUaLHq7yawpyUDfPBQrXkFtC7A7oWASIS6osconrQpcWfkMrR1wqMxc/UQDOO2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VASbmtiPzZj2bg7PWoHSCnmxegIoaYQfEalPM50YTyg=;
 b=DBo6puakFjunsIGPoFnxmoq03dPaJGdqRFp+Z5bLSz+j+THOzTNttEXTLME8J7JoKHlwFgungIryKQYaGT/oJE9Ehd+ljCbnOGTpLU+O4k9Jhs+IriPuVuOu6sVp4IiPF+EfHMH8AxywwuKmG0yBZ3fmNWxlxO9knudfHpjkDPe7ZnKNo5ME4R4p6Bd/NxoeOQuMWdnypukCo6ZYJS2Z2Cbg3tiA7oRkCkFHa/74zlmc+e4fSJtL5OjM1lcfzxuSubaHEDvXyKGdqod/BwPdpQ3439Tk0h5JSJaMdEJ+qCOLsVufwkwF4MX2LSZUNsMuEDA1+KxXb7g4cN+7mzloVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VASbmtiPzZj2bg7PWoHSCnmxegIoaYQfEalPM50YTyg=;
 b=rZk/feNTfk7HmiUP/Kpbi8GSeO80PNr5E+aZN0VFOQmJre+6LHZKyJ5wOiu+BnTTR9akYH5mt8B8zX7sqfsYEvP8F613YsY3en5FxYfgF/KnECVhgfqU9BX56Ct2RTATP9ZoTcnb6TTT2OOi1BHJU3zMXlBmO0sX3Eu8UYXxVPg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr
 Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v7 2/7] xen/arm: add pci-domain for disabled devices
Thread-Topic: [PATCH v7 2/7] xen/arm: add pci-domain for disabled devices
Thread-Index: AQHX4QlPyffeEbH15Uur4HpOfUwOq6wSiH4A
Date: Wed, 24 Nov 2021 11:20:29 +0000
Message-ID: <D1F06279-A23E-4567-A3C4-9347AD5EA491@arm.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-3-andr2000@gmail.com>
In-Reply-To: <20211124075942.2645445-3-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 37ee3d00-badb-455d-2bf4-08d9af3c7170
x-ms-traffictypediagnostic: AM6PR08MB4438:|DB9PR08MB6937:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6937F257620057197B1A65BFFC619@DB9PR08MB6937.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +d2yZ4PfiaiKf+iUmSdK1PZC4neDtfK8XtgVvxUU5IeDL5nGBPMiAklhzaMrfaxSJuq7KuUAwyzCrFoUDjDvAygi3S0imFXUKXFStaAYxkwYGfsZhQFxW9eTl/LMX44Ssx4+b7+WIVi52f03jjP4s25nRZSGjFQjPPc/csP3TGdxg2dj2XDdnyu84I77za6VBMD2Zl71MUz518vPEpSVowo7Vr4t4tDhzn64ZevrqLYcPILI1VT29U+4ovelHD6QDBeFDaIkXcMzMEiZ+34belzcu9J7CTpAe4sGAp1FuiVHFiHIXVT58phZnq4+leeWb8J5GQynXigyM6JdYlY/gf/Q7U4u73kyTg+WM9vS84zOv1TGBJFcBTHjAD7bUzn4tSLMPJcryyP2rcalkDO3YqnAT9RQ7ivvTA/REjGrSacNxhKqNVeyk3d1TMKnA5C4nUxakB2PFxezZAwRl7YALZZknFTCQSLi8HjfYu+M89tmkVsB2qzOkTiWbM7oWmET+DP9lonjb1WT6fduaq3hgd3XgKajG7gqlIgxIclyEwy5cIiuu7nmFXqon6+Uyw5uf01ysXJZ6nygVeObEhgIj1PCyNRE9lFJvjXjR+epkYilFra3txjwD0mVVO3sqPqIz4y1M3EJuol9DTE6dK0pTFE8/qEM7w5M+Uo7nI8IggJ6CS6v8akq09+nNjNqGVVJGw4zg/Qi4IVjs7Bd2s0YXDpYaxY38KMQoRKTAly3yiQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(508600001)(7416002)(71200400001)(53546011)(66446008)(66946007)(8936002)(64756008)(2616005)(38100700002)(66556008)(66476007)(91956017)(6916009)(186003)(6506007)(8676002)(4326008)(5660300002)(54906003)(26005)(2906002)(6512007)(38070700005)(83380400001)(316002)(86362001)(6486002)(33656002)(76116006)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E039F6C726263C48AE4775A01960536E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4438
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a81df39c-0df0-4d15-e3dd-08d9af3c6c21
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZuZaMyU+k2kK7LKoPS0ymCrCF9sXtru3/pW1t5Du9rdkQtyWbxZ15TI9ONQQ4kHNJrfIAoAGy96CuZz5ADAvigklSAZWFCLynYfjzGxvvT6+ir9kjNfPX8lVQYwstFk8II8jp66ZcnpK4NMwvXDHvMsuCkfVs2WN191FIvmeO6S1L2IHkmFeKtX/TbllfIJ70G+WOH1FKTAZUJ8UJImq31TPMA4JQSf+jx4f8Qgj4tnyViyXwnmpQm+LAUiov+uYpTHfRpIszKenW9m3ZAQPgOKficoBwqGJgoQj4cby30aFA2PzM3roYIOuvtT54VMeAPTlI56SIGRbSLAGflIrIkS6nACS2SM1qjroIO1ZTK+FlzL36Q20x9iz5l8DR42CSs8SPx/iJ1Eu6LWaiM0PVFJm1FqjchGmvEPhWXUFvncrsCQxBbbS/549XJf/K0siclUHuFUmyeeRYoKz5EZ90P1DJqKs799FZ9jlZ263cW3K4n2IVx/RUqi+GQvnyDKkpU9khUbUpVdy7VaTy4jdGF0d8KvjHJTwqTXeKUGPDWJ2EqonpmvfcoY81zf0Hiay1oBbAnmLsU4//A8/rHT7RITo9xK1kg864f61W4NvyC20Ngk5DHCoS+AO4Zf7BxI4QDfVmIt5YcuF26qYXTDjqTWjWIzyO/cxRrMEyVX3bG/4/J1M8Cof4nHIpwNrJLGwG2xpAymRWFPJI8zxL3+ngg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6506007)(81166007)(2616005)(53546011)(83380400001)(356005)(6862004)(86362001)(6512007)(82310400004)(316002)(5660300002)(107886003)(508600001)(6486002)(36860700001)(70586007)(26005)(47076005)(33656002)(186003)(2906002)(70206006)(8936002)(8676002)(36756003)(336012)(54906003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 11:20:38.5621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ee3d00-badb-455d-2bf4-08d9af3c7170
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6937

Hi=20

> On 24 Nov 2021, at 7:59 am, Oleksandr Andrushchenko <andr2000@gmail.com> =
wrote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> If a PCI host bridge device is present in the device tree, but is
> disabled, then its PCI host bridge driver was not instantiated.
> This results in the failure of the pci_get_host_bridge_segment()
> and the following panic during Xen start:
>=20
> (XEN) Device tree generation failed (-22).
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Could not set up DOM0 guest OS
> (XEN) ****************************************
>=20
> Fix this by adding "linux,pci-domain" property for all device tree nodes
> which have "pci" device type, so we know which segments will be used by
> the guest for which bridges.
>=20
> Fixes: 4cfab4425d39 ("xen/arm: Add linux,pci-domain property for hwdom if=
 not available.")
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
>=20
> ---
> Since v6:
> - use use_dt_domains in pci_get_new_domain_nr and return -1 if set
> - do not set "linux,pci-domain" if parent device is "pci"
> - move the code to a new helper handle_linux_pci_domain (Julien)
> New in v6
> ---
> xen/arch/arm/domain_build.c        | 66 +++++++++++++++++++++++-------
> xen/arch/arm/pci/pci-host-common.c |  8 +++-
> xen/include/asm-arm/pci.h          |  8 ++++
> 3 files changed, 66 insertions(+), 16 deletions(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index e76cee3caccf..c83c02ab8ac6 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -654,6 +654,55 @@ static void __init allocate_static_memory(struct dom=
ain *d,
> }
> #endif
>=20
> +/*
> + * When PCI passthrough is available we want to keep the
> + * "linux,pci-domain" in sync for every host bridge.
> + *
> + * Xen may not have a driver for all the host bridges. So we have
> + * to write an heuristic to detect whether a device node describes
> + * a host bridge.
> + *
> + * The current heuristic assumes that a device is a host bridge
> + * if the type is "pci" and then parent type is not "pci".
> + */
> +static int handle_linux_pci_domain(struct kernel_info *kinfo,
> +                                   const struct dt_device_node *node)
> +{
> +    uint16_t segment;
> +    int res;
> +
> +    if ( !is_pci_passthrough_enabled() )
> +        return 0;
> +
> +    if ( !dt_device_type_is_equal(node, "pci") )
> +        return 0;
> +
> +    if ( node->parent && dt_device_type_is_equal(node->parent, "pci") )
> +        return 0;
> +
> +    if ( dt_find_property(node, "linux,pci-domain", NULL) )
> +        return 0;
> +
> +    /* Allocate and create the linux,pci-domain */
> +    res =3D pci_get_host_bridge_segment(node, &segment);
> +    if ( res < 0 )
> +    {
> +        res =3D pci_get_new_domain_nr();
> +        if ( res < 0 )
> +        {
> +            printk(XENLOG_DEBUG "Can't assign PCI segment to %s\n",
> +                   node->full_name);
> +            return -FDT_ERR_NOTFOUND;
> +        }
> +
> +        segment =3D res;
> +        printk(XENLOG_DEBUG "Assigned segment %d to %s\n",
> +               segment, node->full_name);
> +    }
> +
> +    return fdt_property_cell(kinfo->fdt, "linux,pci-domain", segment);
> +}
> +
> static int __init write_properties(struct domain *d, struct kernel_info *=
kinfo,
>                                    const struct dt_device_node *node)
> {
> @@ -755,21 +804,10 @@ static int __init write_properties(struct domain *d=
, struct kernel_info *kinfo,
>             return res;
>     }
>=20
> -    if ( is_pci_passthrough_enabled() && dt_device_type_is_equal(node, "=
pci") )
> -    {
> -        if ( !dt_find_property(node, "linux,pci-domain", NULL) )
> -        {
> -            uint16_t segment;
> -
> -            res =3D pci_get_host_bridge_segment(node, &segment);
> -            if ( res < 0 )
> -                return res;
> +    res =3D handle_linux_pci_domain(kinfo, node);
>=20
> -            res =3D fdt_property_cell(kinfo->fdt, "linux,pci-domain", se=
gment);
> -            if ( res )
> -                return res;
> -        }
> -    }
> +    if ( res )
> +        return res;
>=20
>     /*
>      * Override the property "status" to disable the device when it's
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-ho=
st-common.c
> index cdeb3a283a77..9653b92b5b2e 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -30,6 +30,8 @@ static LIST_HEAD(pci_host_bridges);
>=20
> static atomic_t domain_nr =3D ATOMIC_INIT(-1);
>=20
> +static int use_dt_domains =3D -1;
> +
> static inline void __iomem *pci_remap_cfgspace(paddr_t start, size_t len)
> {
>     return ioremap_nocache(start, len);
> @@ -137,14 +139,16 @@ void pci_add_host_bridge(struct pci_host_bridge *br=
idge)
>     list_add_tail(&bridge->node, &pci_host_bridges);
> }
>=20
> -static int pci_get_new_domain_nr(void)
> +int pci_get_new_domain_nr(void)
> {
> +    if ( use_dt_domains )
> +        return -1;
> +
>     return atomic_inc_return(&domain_nr);
> }
>=20
> static int pci_bus_find_domain_nr(struct dt_device_node *dev)
> {
> -    static int use_dt_domains =3D -1;
>     int domain;
>=20
>     domain =3D dt_get_pci_domain_nr(dev);
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 81273e0d87ac..c20eba643d86 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -108,6 +108,8 @@ static always_inline bool is_pci_passthrough_enabled(=
void)
>=20
> void arch_pci_init_pdev(struct pci_dev *pdev);
>=20
> +int pci_get_new_domain_nr(void);
> +
> #else   /*!CONFIG_HAS_PCI*/
>=20
> struct arch_pci_dev { };
> @@ -128,5 +130,11 @@ static inline int pci_get_host_bridge_segment(const =
struct dt_device_node *node,
>     return -EINVAL;
> }
>=20
> +static inline int pci_get_new_domain_nr(void)
> +{
> +    ASSERT_UNREACHABLE();
> +    return -1;
> +}
> +
> #endif  /*!CONFIG_HAS_PCI*/
> #endif /* __ARM_PCI_H__ */
> --=20
> 2.25.1
>=20


