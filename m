Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D2E49F782
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 11:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261933.453823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDOgU-00055q-JB; Fri, 28 Jan 2022 10:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261933.453823; Fri, 28 Jan 2022 10:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDOgU-00053g-Ff; Fri, 28 Jan 2022 10:40:50 +0000
Received: by outflank-mailman (input) for mailman id 261933;
 Fri, 28 Jan 2022 10:40:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4Sn=SM=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nDOgS-00053a-CQ
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 10:40:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfbbe18b-8026-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 11:40:46 +0100 (CET)
Received: from DB6PR07CA0158.eurprd07.prod.outlook.com (2603:10a6:6:43::12) by
 DBBPR08MB4885.eurprd08.prod.outlook.com (2603:10a6:10:f2::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.17; Fri, 28 Jan 2022 10:40:43 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::28) by DB6PR07CA0158.outlook.office365.com
 (2603:10a6:6:43::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.5 via Frontend
 Transport; Fri, 28 Jan 2022 10:40:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 10:40:43 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Fri, 28 Jan 2022 10:40:43 +0000
Received: from 20bc75457840.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 56A1A45E-A8A2-4876-9600-B11C47A09A89.1; 
 Fri, 28 Jan 2022 10:40:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 20bc75457840.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Jan 2022 10:40:36 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by DB9PR08MB6683.eurprd08.prod.outlook.com
 (2603:10a6:10:2ad::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 10:40:33 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7de6:3b44:c82d:a94f]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7de6:3b44:c82d:a94f%3]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 10:40:33 +0000
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
X-Inumbo-ID: bfbbe18b-8026-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZX1gX9T+0+Pvj6y9Aebg33B2F67hCTSSTW9AtwOm+A=;
 b=utHOErUz6TzaemI9MvjCA9APo562KOhbI3NUoDvzwPyV8+EIXnxCeXEmZykM1EqUICKrvAy1RvsVqj9bjrC1woSQbc4wxqpfsxmZGOJZefu9bUFPTXdS3W67xOFtEzZRvMrN1FqTIvHL4TzN3wU5fx6HWrDHlNtwjTuJnFAHtEU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7451f71a1e9e45f8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGQV2Sn381EzPEagpSlu6YEUEB4n90l/1mkouO90VhdMsYkIpylPLDgwrqEUwk/5t86/bhDeyFdpOFJ3NkzYzgoWvr7UQGb1oAZis8nkAbNy/sfEVYdmnX9dLRzXoQaGqQynVx2uxKlb3D0WHFEghyT/Y1p84tZDnwMLegyabaLIhvZZKYbE7FVOAxczdp5Yste/KY6qqwHKY4tXrzZT1pb/YYe73TTgg0NScqjCQ6qP+JxaTwHzZZHmsiX3OawCoQFrKfaZkEW55aci5VGYcRJs352aDDSUav/aVBE7jTxfyJ2FRwbzxlW3ymWA3s4ivnaXFntI17MhcBRDO/wOYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZX1gX9T+0+Pvj6y9Aebg33B2F67hCTSSTW9AtwOm+A=;
 b=a++8/yhdF4CfBf/wxiQZmuombL+wwbJkNb2fdRpZ6FmkTGdEd3eFq0rfXAMAhh3UFUxivgVCIhR4Xc41doaVIJPqfx2Srmn1Qqh1Yt4aAdnm0HqC0hffEBP/fOJuMhQKOGCG/E8gFoGgPx54zStX7fqUkulLf4CFM34UEwKbrQGXIfDH4CyryYZHfcWv+/7dY5Ik4CzXo5ny4qyklFsWTSeGw3BEf8A+Q8To3j6NA0xK38Jy4lcMJv0BS/IEPgHTFEuJWXt7g0Q0pgbN4Nx2ucJunAkjPsplQvF8BEjpKd/TRP8fdzXtjzbsaB/6WBiPbs/B2ufsCLyhL+CLLG4YAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZX1gX9T+0+Pvj6y9Aebg33B2F67hCTSSTW9AtwOm+A=;
 b=utHOErUz6TzaemI9MvjCA9APo562KOhbI3NUoDvzwPyV8+EIXnxCeXEmZykM1EqUICKrvAy1RvsVqj9bjrC1woSQbc4wxqpfsxmZGOJZefu9bUFPTXdS3W67xOFtEzZRvMrN1FqTIvHL4TzN3wU5fx6HWrDHlNtwjTuJnFAHtEU=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/4] IOMMU/x86: switch to alternatives-call patching in
 further instances
Thread-Topic: [PATCH v2 1/4] IOMMU/x86: switch to alternatives-call patching
 in further instances
Thread-Index: AQHYE4zovlZrTiTMtEaG1m4PWdsJMqx4P9gA
Date: Fri, 28 Jan 2022 10:40:33 +0000
Message-ID: <2C739B20-0A5E-477B-853F-E914129EB10D@arm.com>
References: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
 <9f6e1b13-d53f-05d3-0f88-a05bd0da03f9@suse.com>
In-Reply-To: <9f6e1b13-d53f-05d3-0f88-a05bd0da03f9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0840cfb3-8826-4210-dff1-08d9e24aa297
x-ms-traffictypediagnostic:
	DB9PR08MB6683:EE_|DB5EUR03FT044:EE_|DBBPR08MB4885:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB48856FDD8261A97D23908734FC229@DBBPR08MB4885.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KP2x/4RzuioAxf7dkh6PDIe8G6hsVtYpG0j4SdH8Q+QhSNzCadT1scDGmCXXr5B5J4Id1xbFNRQ03s7njQIg6kphugHb1/molK5TSC2U+kHRexE3648srD6K3HgFNpruafO+Kn6RRvEOut6B6bx+bFOtf/Y2B1YOS5bcRR7jmn2ZqyjPfWPlcnxcRmTabgdhy/74UatBsHcpexIU6sg4vfq5ippiEva7ydCoOoKtVDGUMEUJUYzAd9s9H50Mn5KhOB9TNUnp4iZ1n0n7IO6nKY8QlkLmIlsU4kcyiOGhxq91LFze0Gi0w/4K+0Y8eeZpKMbCnHUiEZLOMkfBgzhA/CMD1JnAWCn3QmyV3Vj+s8g8d0oXOTczwWV5LJ4VdTUKS+HAEaP71D5Aw3KMlywOO1bhgwec2U4bjhbZNJWBOH0w2+UtBrFx3JCY9YiksEUdpuWlGbhItEVy+8+bOEEL5hystxan23MuNHIZxMEqDplfBKhpT5b+Z2OqnqimIwEoghc8h2rdYzI2NeuInUuvBKr4NVFIBRKoeo5O+rnDpcF2M1Z2WCPVZcl9LmXFakiDtzkQoc6rAUttveb4mMtoOcpiIhcy7y4nbsZQDHOscfEw/iC12kfToyNO+Ik+S/Cnu/HtLJJuFT/r8eSQ0q7j3adzQoKBn8yucmDjE0l4Eiu5SUxYr0MZqB1OlGLX1MDbpwN8oXbe4bBMzbRFtlwsoij4PhywbmG67pHEubFW1lSlSLMfTMe9Epyd+6MPli/+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(6486002)(66946007)(38070700005)(86362001)(54906003)(66556008)(64756008)(66446008)(66476007)(8936002)(83380400001)(76116006)(71200400001)(6916009)(508600001)(91956017)(316002)(38100700002)(8676002)(2906002)(186003)(53546011)(6512007)(36756003)(6506007)(26005)(122000001)(2616005)(33656002)(5660300002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <49B2E4F37301B04CB2660F8D6D9A87AE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6683
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	27ed0ccd-a0ac-4839-bbf8-08d9e24a9cc2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D65vxU2egQxmKPUaVvVLztI1I4PqY6eMZqkH0/6NsL1xXHDWvxNzbRJundmvqiWZ2hjdSReBMy/silrNFhYiPBW7Gbpbsi33ClJMKbdT0j5vLyBK8a5dC0cixehu6DriEdL19h/yrMFliaFBx3h/BYrGi/4KW0138GIhH60fmTM47uOSjtHU4OYGgL1jpd/SaDj3pGRKPVN3V50oHpmvA0C+3M+EQvxv9079/qsJ1AL0OCZZU0SPtqenH0CTkFn8p/Sa1D7r9QLRlThxT0yOGtidmjLgMm5cbwta9iHyQDtWFrg+Ei594nZ9SK5zlSVFO2Tl6Zj9kUS2/Ptd5M0hBQB67t14ADvT0upGPyyQjomrowIuqlvxKArkt+NjwqrlmPBnVz8CBT23zIcKfU3EvN2CKF1gopPW6xWZemyon2bV557x7yknRlGfwODq2S/eVgNumM8kOTadskBlMuWzNWHRLLtNlLOU9cPGYLigZu+oh2+hEiTIdh/TvaJx+5k1bGdGr5UeLv0u+UWQoBg6bOYa1i/N4UKYdM1IAuWeVg/kG4DowsdoW3UoeESBYSCBe/dKTGUOmpVoVcIg8Q8rxypEOSTZkjz61iM9I/nnu2pUecdfgGn3a8htpN6JFI4QFJwg637e4v6li2ufmPRn83/1+M8RdE8KYn5eZFAMoiA90MQHcpKwQ/riW245FHNL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36756003)(2616005)(107886003)(86362001)(508600001)(6506007)(336012)(83380400001)(2906002)(316002)(5660300002)(6512007)(54906003)(26005)(186003)(40460700003)(53546011)(4326008)(6862004)(8676002)(8936002)(82310400004)(33656002)(70206006)(70586007)(81166007)(47076005)(36860700001)(6486002)(356005)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 10:40:43.2799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0840cfb3-8826-4210-dff1-08d9e24aa297
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4885

Hi Jan,

> On 27 Jan 2022, at 2:47 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> This is, once again, to limit the number of indirect calls as much as
> possible. The only hook invocation which isn't sensible to convert is
> setup(). And of course Arm-only use sites are left alone as well.
>=20
> Note regarding the introduction / use of local variables in pci.c:
> struct pci_dev's involved fields are const. This const propagates, via
> typeof(), to the local helper variables in the altcall macros. These
> helper variables are, however, used as outputs (and hence can't be
> const). In iommu_get_device_group() make use of the new local variables
> to also simplify some adjacent code.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
>=20
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -198,7 +198,7 @@ int iommu_domain_init(struct domain *d,
>         return ret;
>=20
>     hd->platform_ops =3D iommu_get_ops();
> -    ret =3D hd->platform_ops->init(d);
> +    ret =3D iommu_call(hd->platform_ops, init, d);
>     if ( ret || is_system_domain(d) )
>         return ret;
>=20
> @@ -233,7 +233,7 @@ void __hwdom_init iommu_hwdom_init(struc
>=20
>     register_keyhandler('o', &iommu_dump_page_tables, "dump iommu page ta=
bles", 0);
>=20
> -    hd->platform_ops->hwdom_init(d);
> +    iommu_vcall(hd->platform_ops, hwdom_init, d);
> }
>=20
> static void iommu_teardown(struct domain *d)
> @@ -576,7 +576,7 @@ int iommu_get_reserved_device_memory(iom
>     if ( !ops->get_reserved_device_memory )
>         return 0;
>=20
> -    return ops->get_reserved_device_memory(func, ctxt);
> +    return iommu_call(ops, get_reserved_device_memory, func, ctxt);
> }
>=20
> bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
> @@ -603,7 +603,7 @@ static void iommu_dump_page_tables(unsig
>             continue;
>         }
>=20
> -        dom_iommu(d)->platform_ops->dump_page_tables(d);
> +        iommu_vcall(dom_iommu(d)->platform_ops, dump_page_tables, d);
>     }
>=20
>     rcu_read_unlock(&domlist_read_lock);
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -861,15 +861,15 @@ static int deassign_device(struct domain
>         devfn +=3D pdev->phantom_stride;
>         if ( PCI_SLOT(devfn) !=3D PCI_SLOT(pdev->devfn) )
>             break;
> -        ret =3D hd->platform_ops->reassign_device(d, target, devfn,
> -                                                pci_to_dev(pdev));
> +        ret =3D iommu_call(hd->platform_ops, reassign_device, d, target,=
 devfn,
> +                         pci_to_dev(pdev));
>         if ( ret )
>             goto out;
>     }
>=20
>     devfn =3D pdev->devfn;
> -    ret =3D hd->platform_ops->reassign_device(d, target, devfn,
> -                                            pci_to_dev(pdev));
> +    ret =3D iommu_call(hd->platform_ops, reassign_device, d, target, dev=
fn,
> +                     pci_to_dev(pdev));
>     if ( ret )
>         goto out;
>=20
> @@ -1300,7 +1300,7 @@ static int iommu_add_device(struct pci_d
> {
>     const struct domain_iommu *hd;
>     int rc;
> -    u8 devfn;
> +    unsigned int devfn =3D pdev->devfn;
>=20
>     if ( !pdev->domain )
>         return -EINVAL;
> @@ -1311,16 +1311,16 @@ static int iommu_add_device(struct pci_d
>     if ( !is_iommu_enabled(pdev->domain) )
>         return 0;
>=20
> -    rc =3D hd->platform_ops->add_device(pdev->devfn, pci_to_dev(pdev));
> +    rc =3D iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pd=
ev));
>     if ( rc || !pdev->phantom_stride )
>         return rc;
>=20
> -    for ( devfn =3D pdev->devfn ; ; )
> +    for ( ; ; )
>     {
>         devfn +=3D pdev->phantom_stride;
>         if ( PCI_SLOT(devfn) !=3D PCI_SLOT(pdev->devfn) )
>             return 0;
> -        rc =3D hd->platform_ops->add_device(devfn, pci_to_dev(pdev));
> +        rc =3D iommu_call(hd->platform_ops, add_device, devfn, pci_to_de=
v(pdev));
>         if ( rc )
>             printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
>                    &pdev->sbdf, rc);
> @@ -1341,7 +1341,7 @@ static int iommu_enable_device(struct pc
>          !hd->platform_ops->enable_device )
>         return 0;
>=20
> -    return hd->platform_ops->enable_device(pci_to_dev(pdev));
> +    return iommu_call(hd->platform_ops, enable_device, pci_to_dev(pdev))=
;
> }
>=20
> static int iommu_remove_device(struct pci_dev *pdev)
> @@ -1363,7 +1363,8 @@ static int iommu_remove_device(struct pc
>         devfn +=3D pdev->phantom_stride;
>         if ( PCI_SLOT(devfn) !=3D PCI_SLOT(pdev->devfn) )
>             break;
> -        rc =3D hd->platform_ops->remove_device(devfn, pci_to_dev(pdev));
> +        rc =3D iommu_call(hd->platform_ops, remove_device, devfn,
> +                        pci_to_dev(pdev));
>         if ( !rc )
>             continue;
>=20
> @@ -1371,7 +1372,9 @@ static int iommu_remove_device(struct pc
>         return rc;
>     }
>=20
> -    return hd->platform_ops->remove_device(pdev->devfn, pci_to_dev(pdev)=
);
> +    devfn =3D pdev->devfn;
> +
> +    return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev=
(pdev));
> }
>=20
> static int device_assigned(u16 seg, u8 bus, u8 devfn)
> @@ -1421,7 +1424,8 @@ static int assign_device(struct domain *
>=20
>     pdev->fault.count =3D 0;
>=20
> -    if ( (rc =3D hd->platform_ops->assign_device(d, devfn, pci_to_dev(pd=
ev), flag)) )
> +    if ( (rc =3D iommu_call(hd->platform_ops, assign_device, d, devfn,
> +                          pci_to_dev(pdev), flag)) )
>         goto done;
>=20
>     for ( ; pdev->phantom_stride; rc =3D 0 )
> @@ -1429,7 +1433,8 @@ static int assign_device(struct domain *
>         devfn +=3D pdev->phantom_stride;
>         if ( PCI_SLOT(devfn) !=3D PCI_SLOT(pdev->devfn) )
>             break;
> -        rc =3D hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev=
), flag);
> +        rc =3D iommu_call(hd->platform_ops, assign_device, d, devfn,
> +                        pci_to_dev(pdev), flag);
>     }
>=20
>  done:
> @@ -1457,24 +1462,24 @@ static int iommu_get_device_group(
>     if ( !is_iommu_enabled(d) || !ops->get_device_group_id )
>         return 0;
>=20
> -    group_id =3D ops->get_device_group_id(seg, bus, devfn);
> +    group_id =3D iommu_call(ops, get_device_group_id, seg, bus, devfn);
>=20
>     pcidevs_lock();
>     for_each_pdev( d, pdev )
>     {
> -        if ( (pdev->seg !=3D seg) ||
> -             ((pdev->bus =3D=3D bus) && (pdev->devfn =3D=3D devfn)) )
> +        unsigned int b =3D pdev->bus;
> +        unsigned int df =3D pdev->devfn;
> +
> +        if ( (pdev->seg !=3D seg) || ((b =3D=3D bus) && (df =3D=3D devfn=
)) )
>             continue;
>=20
> -        if ( xsm_get_device_group(XSM_HOOK, (seg << 16) | (pdev->bus << =
8) | pdev->devfn) )
> +        if ( xsm_get_device_group(XSM_HOOK, (seg << 16) | (b << 8) | df)=
 )
>             continue;
>=20
> -        sdev_id =3D ops->get_device_group_id(seg, pdev->bus, pdev->devfn=
);
> +        sdev_id =3D iommu_call(ops, get_device_group_id, seg, b, df);
>         if ( (sdev_id =3D=3D group_id) && (i < max_sdevs) )
>         {
> -            bdf =3D 0;
> -            bdf |=3D (pdev->bus & 0xff) << 16;
> -            bdf |=3D (pdev->devfn & 0xff) << 8;
> +            bdf =3D (b << 16) | (df << 8);
>=20
>             if ( unlikely(copy_to_guest_offset(buf, i, &bdf, 1)) )
>             {
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -145,7 +145,7 @@ unsigned int iommu_read_apic_from_ire(un
> int __init iommu_setup_hpet_msi(struct msi_desc *msi)
> {
>     const struct iommu_ops *ops =3D iommu_get_ops();
> -    return ops->setup_hpet_msi ? ops->setup_hpet_msi(msi) : -ENODEV;
> +    return ops->setup_hpet_msi ? iommu_call(ops, setup_hpet_msi, msi) : =
-ENODEV;
> }
>=20
> void __hwdom_init arch_iommu_check_autotranslated_hwdom(struct domain *d)
> @@ -406,7 +406,7 @@ int iommu_free_pgtables(struct domain *d
>      * Pages will be moved to the free list below. So we want to
>      * clear the root page-table to avoid any potential use after-free.
>      */
> -    hd->platform_ops->clear_root_pgtable(d);
> +    iommu_vcall(hd->platform_ops, clear_root_pgtable, d);
>=20
>     while ( (pg =3D page_list_remove_head(&hd->arch.pgtables.list)) )
>     {
>=20
>=20


