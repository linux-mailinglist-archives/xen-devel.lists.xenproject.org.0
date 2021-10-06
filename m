Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD28423B93
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 12:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202731.357737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4Hn-0000Am-MA; Wed, 06 Oct 2021 10:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202731.357737; Wed, 06 Oct 2021 10:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4Hn-00008n-HJ; Wed, 06 Oct 2021 10:36:31 +0000
Received: by outflank-mailman (input) for mailman id 202731;
 Wed, 06 Oct 2021 10:36:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mY4Hl-00008d-V6
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 10:36:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43044d2a-2691-11ec-bf58-12813bfff9fa;
 Wed, 06 Oct 2021 10:36:28 +0000 (UTC)
Received: from AM5PR0502CA0024.eurprd05.prod.outlook.com
 (2603:10a6:203:91::34) by PR2PR08MB4729.eurprd08.prod.outlook.com
 (2603:10a6:101:17::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 6 Oct
 2021 10:36:25 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::23) by AM5PR0502CA0024.outlook.office365.com
 (2603:10a6:203:91::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 10:36:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 6 Oct 2021 10:36:24 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Wed, 06 Oct 2021 10:36:24 +0000
Received: from 132db2c773ee.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A8966D63-FD15-41D2-A878-87477D8606FD.1; 
 Wed, 06 Oct 2021 10:36:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 132db2c773ee.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Oct 2021 10:36:13 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4360.eurprd08.prod.outlook.com (2603:10a6:20b:b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 10:36:11 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 10:36:11 +0000
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
X-Inumbo-ID: 43044d2a-2691-11ec-bf58-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fBLmCfBWJPKE6FbjGOwoA4ngeLKJ0Mfvw57wCZyXis=;
 b=IjomYJeiLBUAJzeuyuTxl/ZtdGpkqkcrIXWOpFVerpb4giUZ7dR06eyU6/v6/1JIOkXf05Cv+nAZKV9zlCosz/xl5ZZMXbkoiTA41pAntmR1qs6TX7pD84KmpL5e2o7blkS5lTd6azvV5dXtXez9MKkDw2X+ZzzhaESNUHsEZF0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 245558fb9cc3bd64
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRicfiamCfv4D9APVj5sh3p1GE2pLYwvxZszrZVQP52MKN4IZ4HeQvm04UceUmkCoildU0GseKy/gR0bNYAWYzqYgcVATuhZo0mMZh7XCgtKQEvH79sjTvT84WPeHeO4hqp6BPTNJgLPuEAhMEEBK6oo/wmRB2aVIVO/XewwKDvDCTc42fcyi92Hix2mD/aqcUUNfFvIGt5ZYYPwsPylIoCc9VaAgVks3GaTIciozBfrYmzBRE+ArUKT5iLVvfx4ctgRAC4G2TfHITAVmCO9OFshByrxBBsThLZalSG9+zpB5X1bbzHvHUSSmEKgoYb+BzySfbezARJmXcRBInHitA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fBLmCfBWJPKE6FbjGOwoA4ngeLKJ0Mfvw57wCZyXis=;
 b=TzxHnSRX1KdDjDHgACmkhDOTp+g7Pmat0lni88QWkrHfc8KuGcfxP6pE6oALjMNn99JfgO+A+K+WZXj6leAq7CiwdpMgs7zAj3xa25VWE6jZfctryobWFGByhmXmovQoCmMucqIVCG7OrAB1sjMVCM57txK9DbwwZ4xaAKHm4L27upsjpWW+9dp4rUVrvGPZiO0YzU1oFDezmiNQyYXmksTHrSZJVopnDjJm25kU5ZoiokQL9W4omxTeoDEWFncX377FOb6/U0RW027EXgvW03XNlVWqzAbD7kLU39SUM5j5zDE2bAsKY3Ays1EIGgjTVC3t7iaM/lr/q6OYbPc/eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fBLmCfBWJPKE6FbjGOwoA4ngeLKJ0Mfvw57wCZyXis=;
 b=IjomYJeiLBUAJzeuyuTxl/ZtdGpkqkcrIXWOpFVerpb4giUZ7dR06eyU6/v6/1JIOkXf05Cv+nAZKV9zlCosz/xl5ZZMXbkoiTA41pAntmR1qs6TX7pD84KmpL5e2o7blkS5lTd6azvV5dXtXez9MKkDw2X+ZzzhaESNUHsEZF0=
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
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v4 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH v4 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHXuSnY8t5WkxPloUudv/0SZ52eK6vFyaGA
Date: Wed, 6 Oct 2021 10:36:11 +0000
Message-ID: <E9A4ABB2-F5D1-4468-8DBC-5FA95163101D@arm.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
 <20211004141151.132231-10-andr2000@gmail.com>
In-Reply-To: <20211004141151.132231-10-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fcda2e0f-2297-46a0-97da-08d988b52588
x-ms-traffictypediagnostic: AM6PR08MB4360:|PR2PR08MB4729:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB4729F33F14B14F3CF03A7DF4FCB09@PR2PR08MB4729.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2449;OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jhtBy5s5AtfkUTJMStwBuM3v90sawAQyLNt5kYjYiiX5p0l6fua4mvSLjyRMGKIzGbCGUx2wHvafs6eFpnHmwggpww0xzRlYmREP6DLUfzxGT+iCxP7aIKuzSH+szPKbYKXeQEFzHpyqt5Dg81ABaMdLg/zUzveKvcYc09tVCOF3ZEPLfw/CWMbVj9PZFCXymJ5aq4fQSgp81NXiiSa0ebUlgYQj6ZYYLWpWOnTWgeTopzeGqKfvXr8O9Rwpg++SGulxWL4pCu17wvvhRE6JtQlEdfOnZZ3iBdRON0O245fd76tH8foLpwMSJUFIehHO4cWNFkP25h0L+y8fyL3Avr32XHXdnvYBdzESNMgbfXeWNsih1d/pQnLbjtoa/da5biyhk66yrd8a433SbbVPPMfyzmW26CznCeUi2MkKwiq7bVRofknIPhqg7OEj01VbKIYBieWhIgSkPa1B+nvWrh1eCd30sVZUp2hPn/JnO10RYI2YGyLys8x8QZDWgQeXX5k3SOVosbIQahkLD/qUPOovlAedq+/k3IrYwO7XIQc4bOJwYqf8FnHqGLP7vwjyps3Hi02gXYqnkJ5BAF6lGHrokg459fyZVPWtPU3oE3OLaEjOHNXrqTiZzCuCvyB5Je40NjsZbuxKyvpvhaEfQC65LbcHJ/YTRWjkuuAQ6cnfDB9M6QvV++AJVCysjEbIIeiJdLFHRv35OwB7rgMIkEZjKK6hx7nwDuvLU9gMlqo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6512007)(36756003)(2616005)(8936002)(38070700005)(6916009)(54906003)(7416002)(4326008)(316002)(5660300002)(71200400001)(83380400001)(508600001)(6486002)(2906002)(33656002)(6506007)(53546011)(186003)(66476007)(26005)(66556008)(76116006)(64756008)(91956017)(66446008)(38100700002)(86362001)(66946007)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FBE57EDFA2A01943A2B14AB12D47A865@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4360
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	67a0d868-e048-4e81-cb19-08d988b51da4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6NbPB3IsJGF2exkGM69kCXJgBf8q+GjKuuNz2MNp0fYyf7jCd2YeetHvqD8RKUBdn8gx+oQblXn/vWssPzhS+Bwo1cBTV+HeIYz4Wik0xWOnTT6PCujnIaPOnzbvH0ZdwK4aL//2eGaPZlhCxkQUXFJdSjk9bgyTbSU8cMkS9r0EHdgHuy8s1JqzPqO/ucFQV/UNKGGnZzlLMB/TbVN2gOQa7FiXvmcVNVd6koBf1VV1S/i5kGKNyBZY5tJc26M8CmuXsk1OpAtDXPq7PvIDRH/Oq+Hh+/xpZwI2sINidOi1qqPxgybSKk5ciuBnD+1mZYAN6MWAd/LyQm6ic4lsqg8IaU+YOx/TMdjumo5niTeR2PCkTZh5R6ZOVyUrsBVBcJaslD0fA53Qal5TV6GjN9EF7j7Bna0izi9PYX/q8EqzyA3V7S/q5voLU8g6nFmczgO1gS0R8O6eEP+8LLCOrLVhDJ5v9/A7PwHtASZMnFEn814X0UJEPr/oT7h6fHEyN1N2BSYx7dFXB/8hnyFv2wzwAMmKFjFTcVo7xbT+H4IfLXFPwWNfdVn48zNMUEgKUcciEY6rlmhvj47EUbMdFXNHqNvLEmrfKJfELKG9oDfu+xxanHMvAFonH1GooIFcuw4NS0WQdMcpxFBWmK/1QyEkR+xRv6pBWITssDExrEA/zzt+gR5yYP95kr6Rn+NuWpRnKYLxoqNdU8g7RYQPCg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(33656002)(8936002)(6862004)(83380400001)(47076005)(36860700001)(2906002)(86362001)(107886003)(508600001)(336012)(2616005)(70206006)(6506007)(53546011)(8676002)(316002)(356005)(6486002)(81166007)(36756003)(70586007)(4326008)(186003)(6512007)(54906003)(5660300002)(82310400003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 10:36:24.7773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcda2e0f-2297-46a0-97da-08d988b52588
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4729

Hi Oleksandr,

> On 4 Oct 2021, at 3:11 pm, Oleksandr Andrushchenko <andr2000@gmail.com> w=
rote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> In order for vPCI to work it needs to maintain guest and hardware
> domain's views of the configuration space. For example, BARs and
> COMMAND registers require emulation for guests and the guest view
> of the registers needs to be in sync with the real contents of the
> relevant registers. For that ECAM address space needs to also be
> trapped for the hardware domain, so we need to implement PCI host
> bridge specific callbacks to properly setup MMIO handlers for those
> ranges depending on particular host bridge implementation.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul

> ---
> Since v3:
> - fixed comment formatting
> Since v2:
> - removed unneeded assignment (count =3D 0)
> - removed unneeded header inclusion
> - update commit message
> Since v1:
> - Dynamically calculate the number of MMIO handlers required for vPCI
>   and update the total number accordingly
> - s/clb/cb
> - Do not introduce a new callback for MMIO handler setup
> ---
> xen/arch/arm/domain.c              |  2 ++
> xen/arch/arm/pci/pci-host-common.c | 28 ++++++++++++++++++++++++
> xen/arch/arm/vpci.c                | 34 ++++++++++++++++++++++++++++++
> xen/arch/arm/vpci.h                |  6 ++++++
> xen/include/asm-arm/pci.h          |  5 +++++
> 5 files changed, 75 insertions(+)
>=20
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 79012bf77757..fa6fcc5e467c 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -733,6 +733,8 @@ int arch_domain_create(struct domain *d,
>     if ( (rc =3D domain_vgic_register(d, &count)) !=3D 0 )
>         goto fail;
>=20
> +    count +=3D domain_vpci_get_num_mmio_handlers(d);
> +
>     if ( (rc =3D domain_io_init(d, count + MAX_IO_HANDLER)) !=3D 0 )
>         goto fail;
>=20
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-ho=
st-common.c
> index 592c01aae5bb..1eb4daa87365 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -292,6 +292,34 @@ struct dt_device_node *pci_find_host_bridge_node(str=
uct device *dev)
>     }
>     return bridge->dt_node;
> }
> +
> +int pci_host_iterate_bridges(struct domain *d,
> +                             int (*cb)(struct domain *d,
> +                                       struct pci_host_bridge *bridge))
> +{
> +    struct pci_host_bridge *bridge;
> +    int err;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        err =3D cb(d, bridge);
> +        if ( err )
> +            return err;
> +    }
> +    return 0;
> +}
> +
> +int pci_host_get_num_bridges(void)
> +{
> +    struct pci_host_bridge *bridge;
> +    int count =3D 0;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +        count++;
> +
> +    return count;
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 76c12b92814f..6e179cd3010b 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -80,17 +80,51 @@ static const struct mmio_handler_ops vpci_mmio_handle=
r =3D {
>     .write =3D vpci_mmio_write,
> };
>=20
> +static int vpci_setup_mmio_handler(struct domain *d,
> +                                   struct pci_host_bridge *bridge)
> +{
> +    struct pci_config_window *cfg =3D bridge->cfg;
> +
> +    register_mmio_handler(d, &vpci_mmio_handler,
> +                          cfg->phys_addr, cfg->size, NULL);
> +    return 0;
> +}
> +
> int domain_vpci_init(struct domain *d)
> {
>     if ( !has_vpci(d) )
>         return 0;
>=20
> +    if ( is_hardware_domain(d) )
> +        return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);
> +
> +    /* Guest domains use what is programmed in their device tree. */
>     register_mmio_handler(d, &vpci_mmio_handler,
>                           GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NUL=
L);
>=20
>     return 0;
> }
>=20
> +int domain_vpci_get_num_mmio_handlers(struct domain *d)
> +{
> +    int count;
> +
> +    if ( is_hardware_domain(d) )
> +        /* For each PCI host bridge's configuration space. */
> +        count =3D pci_host_get_num_bridges();
> +    else
> +        /*
> +         * VPCI_MSIX_MEM_NUM handlers for MSI-X tables per each PCI devi=
ce
> +         * being passed through. Maximum number of supported devices
> +         * is 32 as virtual bus topology emulates the devices as embedde=
d
> +         * endpoints.
> +         * +1 for a single emulated host bridge's configuration space.
> +         */
> +        count =3D VPCI_MSIX_MEM_NUM * 32 + 1;
> +
> +    return count;
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
> index d8a7b0e3e802..27a2b069abd2 100644
> --- a/xen/arch/arm/vpci.h
> +++ b/xen/arch/arm/vpci.h
> @@ -17,11 +17,17 @@
>=20
> #ifdef CONFIG_HAS_VPCI
> int domain_vpci_init(struct domain *d);
> +int domain_vpci_get_num_mmio_handlers(struct domain *d);
> #else
> static inline int domain_vpci_init(struct domain *d)
> {
>     return 0;
> }
> +
> +static inline int domain_vpci_get_num_mmio_handlers(struct domain *d)
> +{
> +    return 0;
> +}
> #endif
>=20
> #endif /* __ARCH_ARM_VPCI_H__ */
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index ea87ec6006fc..a62d8bc60086 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -108,6 +108,11 @@ static always_inline bool is_pci_passthrough_enabled=
(void)
>=20
> void arch_pci_init_pdev(struct pci_dev *pdev);
>=20
> +int pci_host_iterate_bridges(struct domain *d,
> +                             int (*clb)(struct domain *d,
> +                                        struct pci_host_bridge *bridge))=
;
> +int pci_host_get_num_bridges(void);
> +
> #else   /*!CONFIG_HAS_PCI*/
>=20
> struct arch_pci_dev { };
> --=20
> 2.25.1
>=20


