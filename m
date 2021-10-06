Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C4423B91
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 12:35:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202724.357725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4H2-00082H-Ae; Wed, 06 Oct 2021 10:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202724.357725; Wed, 06 Oct 2021 10:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4H2-00080I-7Y; Wed, 06 Oct 2021 10:35:44 +0000
Received: by outflank-mailman (input) for mailman id 202724;
 Wed, 06 Oct 2021 10:35:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mY4H0-000808-Td
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 10:35:42 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2699af4b-2691-11ec-bf58-12813bfff9fa;
 Wed, 06 Oct 2021 10:35:41 +0000 (UTC)
Received: from AM5PR1001CA0005.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::18)
 by VI1PR08MB4397.eurprd08.prod.outlook.com (2603:10a6:803:f9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 6 Oct
 2021 10:35:39 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::ce) by AM5PR1001CA0005.outlook.office365.com
 (2603:10a6:206:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Wed, 6 Oct 2021 10:35:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 6 Oct 2021 10:35:38 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Wed, 06 Oct 2021 10:35:38 +0000
Received: from fc3f9b734dc2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C38265DB-321B-4DD7-A02A-12337E4D8F4A.1; 
 Wed, 06 Oct 2021 10:35:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc3f9b734dc2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Oct 2021 10:35:28 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6007.eurprd08.prod.outlook.com (2603:10a6:20b:29e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 10:35:23 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 10:35:23 +0000
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
X-Inumbo-ID: 2699af4b-2691-11ec-bf58-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFfEkXibDGx+sdiXSgcsc4LfpmLdbfaAPug/eDcPprc=;
 b=9DcpKwcuo7BjmjFvM5glonHk+qLPLMyAJuv9ajw3VQ7N8Xk6NCly9BBUb0mYcdaLVCZGPX/Cb4iplgqUOb82kpr6O6bLz7d+VduvYAcd1RwWeRh7c7M7q7THRgnQy+woxLyEl1NIbKvhxc0sJvLPgsiphIelpcqdAPk5h4UHFDY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 60a5dc50d35b4a4d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCoQyFs7IyiUO1+K3cmJ+SezymTPkrXMEayN+Qg9+m29k0o5SU3mSsy32kF9i99qkKyNiYGZBJkpXrhSNyNGliMBm4JyQ8JfIxlJbwfIx6Rym8BHg41lS6zzu3JZsz9VyJHW/HCTB1xmBh1GpXuy5kV3Ce2WHD0uT1yOW+s3qGzM1YnrO3Lb363oXp3kUxUEWg5jLIJzTg5nD2Yr878uR8mnBxHaOtnXfO1kcwWJxYry7+ZnStNjyOkiEdo+A8HGGfQjDGwIz/ZNCgnGOp2qXyARYj74wiHRXmXSudwTxY3+mZm5GGv9WkcuAWdPPyXYBkWkazU2b1YUc04IgCA7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFfEkXibDGx+sdiXSgcsc4LfpmLdbfaAPug/eDcPprc=;
 b=YyrlESHjbd2skXqguEHFq5wQus4lAvxEgBWqvh0hQ3HGK0QaffQJze0PKYCuG2eqwzgppLgMe3WrRDqMjyfWAtDkctlJBXjjnBHr03aT94U5lIViYAPvavSpxkJOAhqN5yUS5tLAqwX7BsPySZmS19H9X9ZE8MafP70OpkiNtsaRJ+FjFoD2PP1fD1bp4CXZ4dIs3ShEN97rf0Fov3rfdN8S6Be8sestnIjDBN+eajcZovzrcSarbcwnvG/A/WOmJGHGDtEiS57y5dR19HLh1hkcdpIBb4e8+dtSmqtH76CSoZcUp0FikWP58FyKjmm/vc6+ruXLoMPfY0SlBdnusg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFfEkXibDGx+sdiXSgcsc4LfpmLdbfaAPug/eDcPprc=;
 b=9DcpKwcuo7BjmjFvM5glonHk+qLPLMyAJuv9ajw3VQ7N8Xk6NCly9BBUb0mYcdaLVCZGPX/Cb4iplgqUOb82kpr6O6bLz7d+VduvYAcd1RwWeRh7c7M7q7THRgnQy+woxLyEl1NIbKvhxc0sJvLPgsiphIelpcqdAPk5h4UHFDY=
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
Subject: Re: [PATCH v4 06/11] xen/domain: Call pci_release_devices() when
 releasing domain resources
Thread-Topic: [PATCH v4 06/11] xen/domain: Call pci_release_devices() when
 releasing domain resources
Thread-Index: AQHXuSnWj8Dry4hpBkuVdc9SAVWBMqvFyWiA
Date: Wed, 6 Oct 2021 10:35:23 +0000
Message-ID: <178D9AC3-84F4-4189-B7DF-9771F7B6CDF5@arm.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
 <20211004141151.132231-7-andr2000@gmail.com>
In-Reply-To: <20211004141151.132231-7-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5a03520e-4c5d-4c1a-cdc8-08d988b50a1d
x-ms-traffictypediagnostic: AS8PR08MB6007:|VI1PR08MB4397:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB439773F2FDA7522A51EC02B9FCB09@VI1PR08MB4397.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:24;OLM:24;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tp/LJ2TWI+9EsxAcx4np/ZjMnAHf136yArXIKeHwn+g7L7RKpp/Tv2/8nBcdqnx0nGwZdtHNde4h7Gxu7+BIEhbmMPJE/fCnwBBFOpVM5siabsZKWnWWMB9H6r0zwvbtEqvdEEx/S+mNEi2ji2c6dG6FT4KCiuVIjaharnBrmisQFQk7csCnMwVdOn69t8HNrqMd07hAs/fziLnpIpBZ7Ly5YOiatxVfj8jZ8Jmy9hBCbOFrAhjuWaqs+KTOocDY3pEFlV7IsV4WC5BN6greQhvyzxev/Lcoh+gqWfscXqn430hUDihnoYEsfEBmASBNAOQStdOV1yVhmUAGGjYGr+DCpIUtAPEixb9ipE2AwdGe84DFdD98WHuA+DbkXPQZux0QRt0qERckdGt+ynnQWPcNgssdZIOPN3afjL3R5VEyydu9Ywh4p4EzW/mROMhymKOg1AYknTkWXzqaEndnTKVEnH0I0L9GJ525JqZTKYCu8Qc4UA4OCF0sM7vVyJMu7K+cIetzzKFycONMVG5Jzyi/E8pvIh5sBSRN771Xuq6wl/Vc9y/MTcGULwP/DePh5RekwK1ywQ7oFU0dpqAQOz1F6772M55aDihyB6V/ic41on7TdrGPDuEBZC4g1PiaorNd4l3aEWjELAoO1R9GV9Jhb5PW+NLhI8v3vW/13W8F76a7sdYWyx63g+ZSeB72MsuxY977Ay9yjHNCJWchqGlIv1h+tSxYdLS2Y5Zcz0L2EnYMUsGJEE4vi3Bd1So9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(186003)(66476007)(66556008)(4326008)(8936002)(26005)(83380400001)(64756008)(76116006)(71200400001)(66946007)(53546011)(6512007)(6506007)(66446008)(508600001)(38070700005)(6486002)(54906003)(33656002)(122000001)(2616005)(2906002)(38100700002)(86362001)(8676002)(36756003)(5660300002)(316002)(6916009)(7416002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CA2ED7415FFFAC41B05909D00B9D02DC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6007
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	749ce873-6db8-4623-920b-08d988b500eb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BzhYchfTVtK0wPv4udDmMz57gLlbDfw3Y64J6NLe2PVCEclzY15BKnLVbNy65cBTCtor62xTHIXZFfe9LuMeVCDsZxUA/3YML162l2EGxRsBfXhBcH2QUrGSufpqw7ZeCgb6klKgXZSC+AsjSwAnW3CPFzk6ekFqR5f53TN+/MmjI2Dfv9AEc71/Gu1ltht0UcmcWK1/mNQFPOG8AB/Krdl3UWrpr4rjcZtzlroE4pjTsgHD3EXtFawBaGWs+0tAD8N/UbK3nuc8mPGvj0U3aZLTkcs64GW0wtYhf+4EIOeXx1K7gppE0db1ndSAUCmSsZY+ES8EncXZv1dwIso1xtUX+TqBA3/efIWw1jbpTe/gx4zyTonESkZYLujwNRlick3CRSM7NezYo19aQXcIdR0rpI8excXz8b4xu0Ny+NuvRRL/j/AMDP9kyhqLl9TnvhFlWW4T2bKhMY0euFwLJZRmShD0Z/OBMQDCYCSwYQw33rderDBXcXLVVEWZsXHnnZGcWuXrSl4VUYWd8emCT7wTbKNe4PyUCgirL7nducPrgeVr16kl0eROBKCEbpRrzEA90KmYMHv3D8A3OEU6yR75sgmeqSY44ok62OWdRvu7LtALXUv++g6rB1txt4k/d9HkKathQ/pu7cLGnks8c4f+I+ryJFlH2tLnNjBnTH3Vhypd1/H0h6nTRsrFKYBBUFmBq1fiBOEPQC0Ocq7U8w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(107886003)(6486002)(4326008)(70586007)(54906003)(8676002)(316002)(36756003)(5660300002)(6512007)(356005)(82310400003)(6862004)(186003)(53546011)(36860700001)(81166007)(86362001)(508600001)(2906002)(336012)(2616005)(47076005)(8936002)(26005)(33656002)(70206006)(83380400001)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 10:35:38.8749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a03520e-4c5d-4c1a-cdc8-08d988b50a1d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4397

Hi Oleksandr,

> On 4 Oct 2021, at 3:11 pm, Oleksandr Andrushchenko <andr2000@gmail.com> w=
rote:
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> This is the very same that we already do for DT devices. Moreover, x86
> already calls pci_release_devices().
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> Since v1:
> - re-wording in the commit message
> ---
> xen/arch/arm/domain.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index fbb52f78f1a6..79012bf77757 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -985,7 +985,8 @@ static int relinquish_memory(struct domain *d, struct=
 page_list_head *list)
>  * function which may return -ERESTART.
>  */
> enum {
> -    PROG_tee =3D 1,
> +    PROG_pci =3D 1,
> +    PROG_tee,
>     PROG_xen,
>     PROG_page,
>     PROG_mapping,
> @@ -1022,6 +1023,12 @@ int domain_relinquish_resources(struct domain *d)
> #ifdef CONFIG_IOREQ_SERVER
>         ioreq_server_destroy_all(d);
> #endif
> +#ifdef CONFIG_HAS_PCI
> +    PROGRESS(pci):
> +        ret =3D pci_release_devices(d);
> +        if ( ret )
> +            return ret;
> +#endif
>=20
>     PROGRESS(tee):
>         ret =3D tee_relinquish_resources(d);
> --=20
> 2.25.1
>=20


