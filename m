Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C773845D255
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 02:09:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230610.398686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq3GU-0004yU-S7; Thu, 25 Nov 2021 01:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230610.398686; Thu, 25 Nov 2021 01:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq3GU-0004wV-Oa; Thu, 25 Nov 2021 01:09:30 +0000
Received: by outflank-mailman (input) for mailman id 230610;
 Thu, 25 Nov 2021 01:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3p2S=QM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1mq3GT-0004wP-8B
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 01:09:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 559d5157-4d8c-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 02:09:27 +0100 (CET)
Received: from AM6PR10CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::28)
 by PA4PR08MB6256.eurprd08.prod.outlook.com (2603:10a6:102:e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 25 Nov
 2021 01:09:23 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::bf) by AM6PR10CA0015.outlook.office365.com
 (2603:10a6:209:89::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Thu, 25 Nov 2021 01:09:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 25 Nov 2021 01:09:22 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Thu, 25 Nov 2021 01:09:22 +0000
Received: from 6af7f80e8fbf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A4FE0B96-09D8-4BA3-AEA9-5A90EBB24F84.1; 
 Thu, 25 Nov 2021 01:09:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6af7f80e8fbf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 Nov 2021 01:09:12 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by PR3PR08MB5579.eurprd08.prod.outlook.com (2603:10a6:102:82::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 25 Nov
 2021 01:09:10 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::99cd:3d3b:4670:7413]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::99cd:3d3b:4670:7413%5]) with mapi id 15.20.4713.025; Thu, 25 Nov 2021
 01:09:09 +0000
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
X-Inumbo-ID: 559d5157-4d8c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RonFNhhX1GCorQnoU5p5mSDeipb7ILDQvc5vu/zaFUU=;
 b=2ldjMXjGqP6eSdG0vaESD0DPT56irMWoZjmLQ0ar/ZO/p2awod3cspS/x48N6CGvnkwqQuKGr+OZARpvRD8CFzNm/Y8ximcG+8YuiUA/W/wHCwasjINmHV7nK3pPQljpOjOeqbSBapCHVb+jyYI/5/74l8pyVAMqEpeaDENUakk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HB127crkL8gVRT02e/v03/0B/+DFgI+zi745Kfm6YjcCHRwYO4Au0kZDYcfb31uH3K/bARvv8B1hu1A0RTGMMCOcOeEuEuNIrmiTV1lm4xJDXuynPHBX2tPIevNSxJ2ql8GG8skkqY61jFOO8vKX2VmbG6Dwsqjw9pIWOd5lZm/HtO/7S1g8uB8KbkCDhMY+4eXVyM2SAkMe5UGHVswQgypX2aOqxnYtp7fUx/EjOLtatTBdS/rktF8SVi0nHTWALmPmakMybCpSrDlVuW62xom0LoNskTOfr4D3T7QoSkW8sNEprz7V4M2qyCyNTMciTaUdsYRm1GNmscYrDB5ZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RonFNhhX1GCorQnoU5p5mSDeipb7ILDQvc5vu/zaFUU=;
 b=UL78ydpwzO5VGY7SqxXypFzm+pgbDeVnIPoAecSH63YAg1cHhHXeX+hkNTZpIN3s4hAAq9+vLnTC/9E3bP3N15PAcRB/gQGHJH1NSmoxsiZzaCH2IxKvVvTaHZYpEMkW4eJVUfgarJuEf7RFifeMobUiOBzPOqosHTv0xjO6wLcqj7J6Iwkp0ZqqogAuKs081fTthChQT1rInlIXie0G9/hbSiyrmJtXgPI8NWg3sD1OX7PujglZbGAUnA7AIwKltDuNDXz4hyzT+Vizuf1hktJOoigMpJzxGSgbcfiKGpdTvuwrlhJLlg+EW3ZYQmp08isX2R8m4q4Y3Hjb5LwQog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RonFNhhX1GCorQnoU5p5mSDeipb7ILDQvc5vu/zaFUU=;
 b=2ldjMXjGqP6eSdG0vaESD0DPT56irMWoZjmLQ0ar/ZO/p2awod3cspS/x48N6CGvnkwqQuKGr+OZARpvRD8CFzNm/Y8ximcG+8YuiUA/W/wHCwasjINmHV7nK3pPQljpOjOeqbSBapCHVb+jyYI/5/74l8pyVAMqEpeaDENUakk=
From: Henry Wang <Henry.Wang@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, "Artem_Mygaiev@epam.com"
	<Artem_Mygaiev@epam.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, Oleksandr
 Andrushchenko <oleksandr_andrushchenko@epam.com>, Julien Grall
	<jgrall@amazon.com>
Subject: RE: [PATCH v7 1/7] xen/arm: rename DEVICE_PCI to
 DEVICE_PCI_HOSTBRIDGE
Thread-Topic: [PATCH v7 1/7] xen/arm: rename DEVICE_PCI to
 DEVICE_PCI_HOSTBRIDGE
Thread-Index: AQHX4QlVru/ckjtAgkmIRIe8frhWHKwTb8Rg
Date: Thu, 25 Nov 2021 01:09:09 +0000
Message-ID:
 <PA4PR08MB6253031667E6927774F6BF3692629@PA4PR08MB6253.eurprd08.prod.outlook.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-2-andr2000@gmail.com>
In-Reply-To: <20211124075942.2645445-2-andr2000@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 91BB7B1EA7D90844BE4A4AE1991D4A92.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 57be72f4-aaa0-45b1-beff-08d9afb03782
x-ms-traffictypediagnostic: PR3PR08MB5579:|PA4PR08MB6256:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB625609E7C951E35F4B259D2992629@PA4PR08MB6256.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eTlR09riAM8CgZns2DuraQEhDNqRWUXkfSuKiapOc8GvlO91gJX8n0IalCGcp9kuo++Nb8civVGctVR9UvxaDOW5bssUHM9RKGKt6bvwocje6db9Mgr/au8ClCFAsgyUwqtri4iT20w9TRo0LvaSTscKYnIKatS1X0beS+vMc1Kw1e3kfbPxviBmbywtDLO3i/vGLXb4lRE2Jf3Cu0iYqJEzz1poYjzV4T4gahqZpTlJhabg/6OyfAaLDjmetynyH4WBUemcr3B2DFLRn6ZJnK84zXRyzZL3CsZmX2sCx6TC3CIqSeDrlw+ZaOXVIKZdEPgCSDINBhlkpe16N8xU7WNRvhagtnyAP55hkJwBysoU7tpC+6cwdeyFS5kgGn4tqWs3KUow6WH0EH7VsXjt8pdqJajNb7i/w9miWHnWLUSCDXfsHF//vr9hxJw+mqcl+0aUcwkB22Mp5n+2/uxBPRfHCdJm56yE7Nx5jkjc/KH4HsUKgfALGi5lD6AKnfkPcjwVdY1byxqR6so/Qe05cTEbu8q4kXbmszLTLJw86o2KQMZ2TO4PPklkqYaN6FvkzDoL7u+y5qKrDOdT08691TmDbSK3EZUxdedWfCN3+ALzJbqvQmfVJ1UQdzAsDlruwOXhiGWu5yjl2FNAXR56P6wuRTr5ZHyw1cZHJ49M6KjC/kXQArcI3xFgENFGRBpSZIPP7wnFrIoWcvLv9xRXmw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(5660300002)(316002)(54906003)(7416002)(33656002)(8936002)(66446008)(66476007)(66556008)(64756008)(110136005)(53546011)(38070700005)(76116006)(4326008)(2906002)(122000001)(66946007)(26005)(186003)(7696005)(38100700002)(52536014)(83380400001)(9686003)(86362001)(6506007)(55016003)(8676002)(508600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5579
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7210710-e113-49e7-942a-08d9afb02fbc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FRqfFjmfXZKAk9IBha6K54oJ99tE5mgCK9cqDEEYapijHoqVIr7M2BBpTUAa5P57FQwwus+xsdLf3Gxt2z0sza67s851AtnTedvyWYix3DYQ2560j/SZACLcjzjpqcPq6emU/U0KWz/aMLOWGES6Uiw48Uk84RGN9uf4yWkhQzAUbYCKieKqr0dmqlITKyC6gPjFHqxC2eahchWlj7oPBL8hFQKZLKtKTYuhsvWAWbwz6HhlpfWxgZOuo58zMf6Oa2000APNPyEOboY8AkmVjflMvTLMGzujiKsjgrF6gsMyk9h+Z2nyT/DAozWFB1cNU72SVGPabmwQgKC9FAY9NTtEJyPFQRMKi7FQimgEk7WwAtBkbex1QJN+ZvJMv8bXHONnnJvbmR7ldvIa6Y8cDMhckmQY9grlrktdnNKAmmnnUDtgXZiX6KR7qpRty2aET47dn2OYCVTOuC4STOONoBGDiYjYYH1zr9ZY/K81SUTbWYCeaTaW5mVRmgzfBEIIMujbOQlOPTM89Gg0lnMBM5yOYxQwW1koMy77bqtom97ZCvqFp7NENEHyVdG7v16HqJY2cfV7t6q9qN+1mjouw70z601VaLv4PVfmy2Lvd3g2nsiiZqUUiAN+FjWMPMmkGPL6LMESz+M7J/nhZD7I9LD51r8oWSHny3Cb516THah1IOsSUjykL6Hm7ezI6dpXk5ZoubWoe/GOYf8RhfEq9w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(81166007)(82310400004)(52536014)(508600001)(316002)(86362001)(4326008)(33656002)(70206006)(70586007)(6506007)(5660300002)(53546011)(36860700001)(356005)(54906003)(110136005)(107886003)(2906002)(186003)(83380400001)(9686003)(26005)(55016003)(8936002)(8676002)(336012)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 01:09:22.9986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57be72f4-aaa0-45b1-beff-08d9afb03782
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6256

Hi Oleksandr,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Oleksandr Andrushchenko
> Sent: Wednesday, November 24, 2021 4:00 PM
> To: xen-devel@lists.xenproject.org
> Cc: julien@xen.org; sstabellini@kernel.org;
> oleksandr_tyshchenko@epam.com; volodymyr_babchuk@epam.com;
> Artem_Mygaiev@epam.com; roger.pau@citrix.com; jbeulich@suse.com;
> andrew.cooper3@citrix.com; george.dunlap@citrix.com; paul@xen.org;
> Bertrand Marquis <Bertrand.Marquis@arm.com>; Rahul Singh
> <Rahul.Singh@arm.com>; Oleksandr Andrushchenko
> <oleksandr_andrushchenko@epam.com>; Julien Grall <jgrall@amazon.com>
> Subject: [PATCH v7 1/7] xen/arm: rename DEVICE_PCI to
> DEVICE_PCI_HOSTBRIDGE
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> To better reflect the nature of the device type and not to make any
> confusion rename DEVICE_PCI to DEVICE_PCI_HOSTBRIDGE which it
> really is.
>=20
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Oleksandr Andrushchenko
> <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> ---
> New in v6
> ---
>  xen/arch/arm/pci/pci-host-generic.c | 2 +-
>  xen/arch/arm/pci/pci-host-zynqmp.c  | 2 +-
>  xen/arch/arm/pci/pci.c              | 2 +-
>  xen/include/asm-arm/device.h        | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-
> host-generic.c
> index 33457fbe9615..46de6e43cc72 100644
> --- a/xen/arch/arm/pci/pci-host-generic.c
> +++ b/xen/arch/arm/pci/pci-host-generic.c
> @@ -32,7 +32,7 @@ static int __init pci_host_generic_probe(struct
> dt_device_node *dev,
>      return pci_host_common_probe(dev, &pci_generic_ecam_ops);
>  }
>=20
> -DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI)
> +DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
>  .dt_match =3D gen_pci_dt_match,
>  .init =3D pci_host_generic_probe,
>  DT_DEVICE_END
> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-
> host-zynqmp.c
> index 61a9807d3d58..516982bca833 100644
> --- a/xen/arch/arm/pci/pci-host-zynqmp.c
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -49,7 +49,7 @@ static int __init pci_host_generic_probe(struct
> dt_device_node *dev,
>      return pci_host_common_probe(dev, &nwl_pcie_ops);
>  }
>=20
> -DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
> +DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
>  .dt_match =3D nwl_pcie_dt_match,
>  .init =3D pci_host_generic_probe,
>  DT_DEVICE_END
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index 082c14e127a8..78b97beaef12 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -46,7 +46,7 @@ static int __init dt_pci_init(void)
>=20
>      dt_for_each_device_node(dt_host, np)
>      {
> -        rc =3D device_init(np, DEVICE_PCI, NULL);
> +        rc =3D device_init(np, DEVICE_PCI_HOSTBRIDGE, NULL);
>          /*
>           * Ignore the following error codes:
>           *   - EBADF: Indicate the current device is not a pci device.
> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
> index 3782660751b6..086dde13eb6b 100644
> --- a/xen/include/asm-arm/device.h
> +++ b/xen/include/asm-arm/device.h
> @@ -37,7 +37,7 @@ enum device_class
>      DEVICE_SERIAL,
>      DEVICE_IOMMU,
>      DEVICE_GIC,
> -    DEVICE_PCI,
> +    DEVICE_PCI_HOSTBRIDGE,
>      /* Use for error */
>      DEVICE_UNKNOWN,
>  };
> --
> 2.25.1
>=20

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,

Henry

