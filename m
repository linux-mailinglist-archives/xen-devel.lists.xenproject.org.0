Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE334C8CBA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 14:34:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281448.479790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2eC-0003DG-C4; Tue, 01 Mar 2022 13:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281448.479790; Tue, 01 Mar 2022 13:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2eC-00039m-7c; Tue, 01 Mar 2022 13:34:36 +0000
Received: by outflank-mailman (input) for mailman id 281448;
 Tue, 01 Mar 2022 13:34:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hqu5=TM=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nP2eA-0002kj-Iy
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 13:34:34 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe05::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53cf0a54-9964-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 14:34:33 +0100 (CET)
Received: from DB6PR0301CA0038.eurprd03.prod.outlook.com (2603:10a6:4:3e::48)
 by PAXPR08MB6621.eurprd08.prod.outlook.com (2603:10a6:102:dc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 13:34:29 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::98) by DB6PR0301CA0038.outlook.office365.com
 (2603:10a6:4:3e::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25 via Frontend
 Transport; Tue, 1 Mar 2022 13:34:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 13:34:29 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Tue, 01 Mar 2022 13:34:29 +0000
Received: from 04de89535d06.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 73D7EB47-4B57-4FD0-8C4E-D7860382F7C8.1; 
 Tue, 01 Mar 2022 13:34:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 04de89535d06.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Mar 2022 13:34:23 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by AM6PR08MB4358.eurprd08.prod.outlook.com
 (2603:10a6:20b:b6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 13:34:21 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60%10]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 13:34:21 +0000
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
X-Inumbo-ID: 53cf0a54-9964-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmgvc60Lh7JtbNghknVL20rXiMusarbxrZ8AuH8JKHE=;
 b=OGczUwGvCIAeL95yLZyKqfJH7mrgz2yFw9oEFcW4q99clIG7g3JMos2a/k9ir36eY/jO6LS3UtiOprv7EAA7HRGJdpOSGmRsyatEQStmw1Pw/JPuc1Wrw3D+ur6PXDo4noD/D6Ap13il7fu6z5sxxqxtHpeqG12qCnRYUAFCRDE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c10a95bd88a7f45c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7XtmzoE/f7ZMVGKS+DEk+MV1vJpagBPYVxIazIGZHchrZhCo9Dx00/gNwuQsRCGmpUTJXo8YfFttP1Km4Qucum2IdjahgMoJIRGx+Dwz0CjQcw/3Gb/NGYeBycgj3w05GzEEYBkzX+T/ZrKqfWR5Kcewv6ban1+pPgzQR79Dgn9BLbIzhBkKn3Ij2QxQWKFiUJkOBsmm9aYXqxGMmRHA2dGqpMbAL2c1/rDFwZ92smEht4A2Omgdej7fchmc68teHpb2FjWSPJa8LX2xfUdA4BomeeGtLqDz+GHf7hnV1glt9O/41gAwtN2P7zFA2j7pdBe+LRzEDkk04hGGFYU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmgvc60Lh7JtbNghknVL20rXiMusarbxrZ8AuH8JKHE=;
 b=F25Q7tPRC2uOXhnsgoS7hb/iZADpm/wI6GBl+JbljNQEL5OC5JBZJGVS21YEK+ME4AYeCdlKyh0V9eHpG6hDESJBK6iJ4C+U/3gfRMf9b6ND39aPT2xcxP3Xg64FwSeTxp8by2jBCSw4Rzpw6AGSFReUgNUWEWn0kTO/FOsCzW7RCrwIxw99wN9Y6rNwChJLxuXeuako0wsU4GXf4vMWNAaDecqjKTmujAunGARleHuxcrHIqcieDN5KdpmFaUZda1WVAeSeZcdesfRK7CguqeN0WwmEVHsjYH2EXnGnLBuW8dOg0Jd1T1mH/y9H+c7N87g99TY0dDB0zl2g8Qq3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmgvc60Lh7JtbNghknVL20rXiMusarbxrZ8AuH8JKHE=;
 b=OGczUwGvCIAeL95yLZyKqfJH7mrgz2yFw9oEFcW4q99clIG7g3JMos2a/k9ir36eY/jO6LS3UtiOprv7EAA7HRGJdpOSGmRsyatEQStmw1Pw/JPuc1Wrw3D+ur6PXDo4noD/D6Ap13il7fu6z5sxxqxtHpeqG12qCnRYUAFCRDE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Thread-Topic: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86
 file
Thread-Index: AQHYIoBoEZVl6/zkE0mK7dGMpvA2Zqyi2K6AgAfEbQA=
Date: Tue, 1 Mar 2022 13:34:21 +0000
Message-ID: <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
 <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
In-Reply-To: <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5865d4d0-cc34-4371-1a39-08d9fb883651
x-ms-traffictypediagnostic:
	AM6PR08MB4358:EE_|DB5EUR03FT057:EE_|PAXPR08MB6621:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB662115AAB50C1B4FB30BC90AFC029@PAXPR08MB6621.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OyK2OrzoQgCm5hcAPGB/R5k1aXXlVDI+WHT1GKFqyrU0wnkThYPU0jMlIW0rxfOUFB1gZjb8EifWnIujDRlT1bIY8rBHY8CELpHHdVQGjgUAEUe12lh2r7sKttWSViZ/dGHQdmvSatZezt7/zKR2TfrLYWFp0vy520NGo3EdsLey/uddSChNz2zllrXwjEaw3XlRv3gpnJu9XXv1TiDtOZ5KZd1KmJQ/t0iQGs6wxGRRlJrC58H1hWF7nGBZ6i0AwJX9aGpwg69iWkF/UN4QVPaskAu1CTXHPTQErwmSX+JxUucY2kvwP5OKgC9jrEzdfr4Nvaeu0P7DSAf7vMQcJe0GQGdcfi+SfLUakFjGyu6VlwGZfapJTAs+FKLsFh6mydKieiSm2s26Q08HhMpPyjJpxckvsZGtz2iKLKKvfECBOSjgmhZgyrW/UKbTcsmOEqG6onNfuHJEDU03BHkm8xU696e/QKs8WxKG9EJcMMGzL3PWmqT2IsM5kCmmkb8HQ59+RYcpxB9iWMSuA7tj3GTYOuW9ut2rG2k5T/NXcRFgaSjlIEkQGFJVJf8OSQMRXKsglElovkfu8XdMjA7CY+QqM0W5L9OLvp8fN5zn3nXNElOM9k99SYwKaFcK5/FWgqHRTvj2i80ssvk8EsMtiyAQhS7ANg7wgPcPdN+dMMb6cbdjeOhyY54GAQcQYnGLziq5Bkg/+CCRiSAKsANgDyti77zOVHsLf7GRvY8MGIQqHyfFkRn8QYZZr/TOyFY+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(83380400001)(5660300002)(6916009)(54906003)(66556008)(8676002)(4326008)(66476007)(66946007)(76116006)(66446008)(64756008)(8936002)(316002)(6486002)(2616005)(91956017)(26005)(186003)(71200400001)(508600001)(53546011)(6506007)(6512007)(33656002)(2906002)(36756003)(38070700005)(86362001)(45980500001)(309714004);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0EDF91FBADF737418CE667B814D5C657@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4358
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2990341d-51e6-44f7-1dca-08d9fb883183
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ixJWVEext5MWUO0B9L4ZvM8GitHIz3g6/fUCHLNxJuyEz0cyzZdADV5zxg4XPzhWDPhaGX12pNEgbdnHq8Kh0jAbMLzbe325hTag3Xen78GUTYg1vNZA/4EWwfCHm/E2Mbqv23cQmSnOph5qv2qLgHjllhssVH3+B0ikbqZiS3hSqYdNq9c3VUhX0DHhPV9r5vLLtuyj16Y148Ybv+ohEsC+Wv7M+MkgjzR29/Dr3AIhLKxRv+fKNTJPXqHKuZpYiuxFK/7Ng1yjwZJxRX3qO8YUVf23+O+GNP0G0GLZbltIb+Cgb8hJM+klFcfMuUTJkZLgM2j1c8BcHn/AdNOiUXR9fVv/aBuJI+XjCV/UcR1JisjFZ4VsDroHlzALrBqtwcab44moCmPvnwp4Jb9d5/IdTLk86OGqpy3Zaru84xMnGDUkoVTC+mv4CgdneBdt8x19k5OHIHu+8iXw0Uabn0duKwHE1m8ufAYQqid6k0vc3OwjdeytJJP4VDsiPsoIGvIbr/PGIlA+obWkHSGY6cAWIpiu7g9CcNT1QKED/+hmx0kukrqN/hkEqX0Ekjoa7PQjKdH8f4rl8WPdsS8K+7Twmi8CY4PrGqDTofeYl01JdfgQNuS/IS/uIz34PqyUE3TO4GNisrBbKndIK2V//Fm125hc6CuDO/IsSvH0acUS1F5LbnlBVXBjJUbBsmReHuRUvt/nQ+3JIRUqJ2VGsQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(86362001)(316002)(5660300002)(2616005)(6506007)(336012)(8936002)(82310400004)(70206006)(70586007)(2906002)(33656002)(26005)(186003)(4326008)(8676002)(36756003)(53546011)(356005)(81166007)(6486002)(83380400001)(508600001)(54906003)(36860700001)(6512007)(47076005)(40460700003)(6862004)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 13:34:29.4954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5865d4d0-cc34-4371-1a39-08d9fb883651
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6621

H Jan,

> On 24 Feb 2022, at 2:57 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 15.02.2022 16:25, Rahul Singh wrote:
>> vpci/msix.c file will be used for arm architecture when vpci msix
>> support will be added to ARM, but there is x86 specific code in this
>> file.
>>=20
>> Move x86 specific code to the x86/hvm/vmsi.c file to make sure common
>> code will be used for other architecture.
>=20
> Could you provide some criteria by which code is considered x86-specific
> (or not)? For example ...

Code moved to x86 file is based on criteria that either the code will be un=
usable or will be different=20
for ARM when MSIX  support will be introduce for ARM.
>=20
>> --- a/xen/arch/x86/hvm/vmsi.c
>> +++ b/xen/arch/x86/hvm/vmsi.c
>> @@ -925,4 +925,106 @@ int vpci_msix_arch_print(const struct vpci_msix *m=
six)
>>=20
>>     return 0;
>> }
>> +
>> +int vpci_make_msix_hole(const struct pci_dev *pdev)
>> +{
>> +    struct domain *d =3D pdev->domain;
>> +    unsigned int i;
>> +
>> +    if ( !pdev->vpci->msix )
>> +        return 0;
>> +
>> +    /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
>> +    for ( i =3D 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
>> +    {
>> +        unsigned long start =3D PFN_DOWN(vmsix_table_addr(pdev->vpci, i=
));
>> +        unsigned long end =3D PFN_DOWN(vmsix_table_addr(pdev->vpci, i) =
+
>> +                                     vmsix_table_size(pdev->vpci, i) - =
1);
>> +
>> +        for ( ; start <=3D end; start++ )
>> +        {
>> +            p2m_type_t t;
>> +            mfn_t mfn =3D get_gfn_query(d, start, &t);
>> +
>> +            switch ( t )
>> +            {
>> +            case p2m_mmio_dm:
>> +            case p2m_invalid:
>> +                break;
>> +            case p2m_mmio_direct:
>> +                if ( mfn_x(mfn) =3D=3D start )
>> +                {
>> +                    clear_identity_p2m_entry(d, start);
>> +                    break;
>> +                }
>> +                /* fallthrough. */
>> +            default:
>> +                put_gfn(d, start);
>> +                gprintk(XENLOG_WARNING,
>> +                        "%pp: existing mapping (mfn: %" PRI_mfn
>> +                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
>> +                        &pdev->sbdf, mfn_x(mfn), t, start);
>> +                return -EEXIST;
>> +            }
>> +            put_gfn(d, start);
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>=20
> ... nothing in this function looks to be x86-specific, except maybe
> functions like clear_identity_p2m_entry() may not currently be available
> on Arm. But this doesn't make the code x86-specific.

I will maybe be wrong but what I understand from the code is that for x86=20
if there is no p2m entries setup for the region, accesses to them will be t=
rapped=20
into the hypervisor and can be handled by specific MMIO handler.

But for ARM when we are registering the MMIO handler we have to provide=20
the GPA also for the MMIO handler.=20

For ARM arch vpci_make_msix_hole() will be used to register the MMIO handle=
r=20
for the MSIX MMIO region.

int vpci_make_msix_hole(const struct pci_dev *pdev)
{
    struct vpci_msix *msix =3D pdev->vpci->msix;
    paddr_t addr,size;

   for ( int i =3D 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
   {                                                                       =
   =20
       addr =3D vmsix_table_addr(pdev->vpci, i);              =20
       size =3D vmsix_table_size(pdev->vpci, i) - 1;                       =
                                                 =20
       register_mmio_handler(pdev->domain, &vpci_msi_mmio_handler,         =
   =20
                                              addr, size, NULL);           =
                    =20
    }                                                                      =
                                          =20
    return 0;                                                              =
    =20
}

Therefore in this case there is difference how ARM handle this case.
=20
>=20
>> +struct vpci_msix *vpci_msix_find(const struct domain *d, unsigned long =
addr)
>> +{
>> +    struct vpci_msix *msix;
>> +
>> +    list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
>> +    {
>> +        const struct vpci_bar *bars =3D msix->pdev->vpci->header.bars;
>> +        unsigned int i;
>> +
>> +        for ( i =3D 0; i < ARRAY_SIZE(msix->tables); i++ )
>> +            if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
>> +                 VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
>> +                return msix;
>> +    }
>> +
>> +    return NULL;
>> +}
>=20
> Or take this one - I don't see anything x86-specific in here. The use
> of d->arch.hvm merely points out that there may be a field which now
> needs generalizing.

Yes, you are right here I can avoid this change if I will introduce=20
"struct list_head msix_tables"  in "d->arch.hvm" for ARM also.=20

>=20
>> +static int x86_msix_accept(struct vcpu *v, unsigned long addr)
>> +{
>> +    return !!vpci_msix_find(v->domain, addr);
>> +}
>> +
>> +static int x86_msix_write(struct vcpu *v, unsigned long addr, unsigned =
int len,
>> +                          unsigned long data)
>> +{
>> +    const struct domain *d =3D v->domain;
>> +    struct vpci_msix *msix =3D vpci_msix_find(d, addr);
>> +
>> +    return vpci_msix_write(msix, addr, len, data);
>> +}
>> +
>> +static int x86_msix_read(struct vcpu *v, unsigned long addr, unsigned i=
nt len,
>> +                         unsigned long *data)
>> +{
>> +    const struct domain *d =3D v->domain;
>> +    struct vpci_msix *msix =3D vpci_msix_find(d, addr);
>> +
>> +    return vpci_msix_read(msix, addr, len, data);
>> +}
>> +
>> +static const struct hvm_mmio_ops vpci_msix_table_ops =3D {
>> +    .check =3D x86_msix_accept,
>> +    .read =3D x86_msix_read,
>> +    .write =3D x86_msix_write,
>> +};
>=20
> I don't see the need to add x86_ prefixes to static functions while
> you're moving them. Provided any of this is really x86-specific in
> the first place.
>=20

Ok. Let me remove the x86_ prefixes in next version.  MMIO handler function=
s declaration is different=20
for ARM and X86 therefore I need to move this code to arch specific file.

>> +void vpci_msix_arch_register(struct vpci_msix *msix, struct domain *d)
>> +{
>> +    if ( list_empty(&d->arch.hvm.msix_tables) )
>> +        register_mmio_handler(d, &vpci_msix_table_ops);
>=20
> This is perhaps the only thing which I could see would better live
> in arch-specific code.
>=20
>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -20,10 +20,10 @@
>> #include <xen/iocap.h>
>> #include <xen/keyhandler.h>
>> #include <xen/pfn.h>
>> +#include <xen/msi.h>
>> #include <asm/io.h>
>> #include <asm/smp.h>
>> #include <asm/desc.h>
>> -#include <asm/msi.h>
>=20
> Just like you do here and elsewhere, ...
>=20
>> --- a/xen/drivers/passthrough/amd/iommu.h
>> +++ b/xen/drivers/passthrough/amd/iommu.h
>> @@ -26,6 +26,7 @@
>> #include <xen/tasklet.h>
>> #include <xen/sched.h>
>> #include <xen/domain_page.h>
>> +#include <xen/msi.h>
>>=20
>> #include <asm/msi.h>
>=20
> ... I think you want to remove this now redundant #include as well.

Ok.
>=20
>> --- a/xen/include/xen/msi.h
>> +++ b/xen/include/xen/msi.h
>> @@ -3,6 +3,34 @@
>>=20
>> #include <xen/pci.h>
>>=20
>> +#define msi_control_reg(base)       (base + PCI_MSI_FLAGS)
>> +#define msi_lower_address_reg(base) (base + PCI_MSI_ADDRESS_LO)
>> +#define msi_upper_address_reg(base) (base + PCI_MSI_ADDRESS_HI)
>> +#define msi_data_reg(base, is64bit) \
>> +	( (is64bit) ? (base) + PCI_MSI_DATA_64 : (base) + PCI_MSI_DATA_32 )
>> +#define msi_mask_bits_reg(base, is64bit) \
>> +	( (is64bit) ? (base) + PCI_MSI_MASK_BIT : (base) + PCI_MSI_MASK_BIT - =
4)
>> +#define msi_pending_bits_reg(base, is64bit) \
>> +	( (is64bit) ? (base) + PCI_MSI_MASK_BIT + 4 : (base) + PCI_MSI_MASK_BI=
T)
>> +#define msi_disable(control)        control &=3D ~PCI_MSI_FLAGS_ENABLE
>> +#define multi_msi_capable(control) \
>> +	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
>> +#define multi_msi_enable(control, num) \
>> +	control |=3D (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
>> +#define is_64bit_address(control)   (!!(control & PCI_MSI_FLAGS_64BIT))
>> +#define is_mask_bit_support(control)    (!!(control & PCI_MSI_FLAGS_MAS=
KBIT))
>> +#define msi_enable(control, num) multi_msi_enable(control, num); \
>> +	control |=3D PCI_MSI_FLAGS_ENABLE
>> +
>> +#define msix_control_reg(base)      (base + PCI_MSIX_FLAGS)
>> +#define msix_table_offset_reg(base) (base + PCI_MSIX_TABLE)
>> +#define msix_pba_offset_reg(base)   (base + PCI_MSIX_PBA)
>> +#define msix_enable(control)        control |=3D PCI_MSIX_FLAGS_ENABLE
>> +#define msix_disable(control)       control &=3D ~PCI_MSIX_FLAGS_ENABLE
>> +#define msix_table_size(control)    ((control & PCI_MSIX_FLAGS_QSIZE)+1=
)
>> +#define msix_unmask(address)        (address & ~PCI_MSIX_VECTOR_BITMASK=
)
>> +#define msix_mask(address)          (address | PCI_MSIX_VECTOR_BITMASK)
>=20
> Why did you put these not ...
>=20
>> #ifdef CONFIG_HAS_PCI_MSI
>=20
> .. below here?

I will fix this in next version.

>=20
> Also the movement of these is quite the opposite of what the title
> says. IOW this likely wants to be a separate change.

Ok. Let me move this change in separate patch in next series.

Regards,
Rahul
>=20
> Jan
>=20


