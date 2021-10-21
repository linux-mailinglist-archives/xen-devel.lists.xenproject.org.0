Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D70436379
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 15:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214417.372953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYVE-0005R3-Ty; Thu, 21 Oct 2021 13:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214417.372953; Thu, 21 Oct 2021 13:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYVE-0005P9-Qs; Thu, 21 Oct 2021 13:53:04 +0000
Received: by outflank-mailman (input) for mailman id 214417;
 Thu, 21 Oct 2021 13:53:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wrrh=PJ=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mdYVD-0005P3-DO
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 13:53:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d8b4885-50dd-4cfa-b501-558da5ad3371;
 Thu, 21 Oct 2021 13:53:01 +0000 (UTC)
Received: from AM6PR05CA0017.eurprd05.prod.outlook.com (2603:10a6:20b:2e::30)
 by AM9PR08MB6004.eurprd08.prod.outlook.com (2603:10a6:20b:285::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Thu, 21 Oct
 2021 13:52:58 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::43) by AM6PR05CA0017.outlook.office365.com
 (2603:10a6:20b:2e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Thu, 21 Oct 2021 13:52:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Thu, 21 Oct 2021 13:52:58 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Thu, 21 Oct 2021 13:52:57 +0000
Received: from 7218f8d59259.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DC6A1084-06D1-4605-8C3E-5CCF3532B2CA.1; 
 Thu, 21 Oct 2021 13:52:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7218f8d59259.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Oct 2021 13:52:51 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DBBPR08MB6011.eurprd08.prod.outlook.com (2603:10a6:10:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 21 Oct
 2021 13:52:49 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Thu, 21 Oct 2021
 13:52:49 +0000
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
X-Inumbo-ID: 9d8b4885-50dd-4cfa-b501-558da5ad3371
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jy7QlzZooPuohQZ/c26XP8x/PPZTy952CU6Q8AEgGoM=;
 b=9Rf/hVCk4rZpknblC4+huozohdIpvO7V50TZDHWoBanWiaqqhAExxJVBLWAcqLKfdR3kSBubMXYcKhmQkJYDJr75iqdm5p8aTV+bt8+p10ssyo7HztQT/aso25NM5P16oKZqQqu8uMGmtLc3SxprmN6vP72MFs/x++mTJKIfHvU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5fdc578a0ffd7512
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jH5uSJv4zp0XbxY2YFn53RlfeJ5Wdc3X/4wjDBt8gxE/wp4anFZR+6cYEC8nbDmHvNq8nbP72B4ek0+uC9+E2g27qccyMZ0P8U+r8D15b5km65Fikj7w2nxNFhMhGBUDevhnb0N2FGNDeYlQSFhc0RiOUWwv4wXqiSSbL6Jld0/2VFBmxVZ5fjhhiaj1haGJ0C1cJ6fnQJREIa5lROAWbxiNGN0SVAXZ30YDF+0i2PAtOCLGj0+wfKA3kQoBfnzPB//G29SQl+dVB95HobQJYfsnXze4BqAYQW8d1Yze+xI2zTtMG1wbfsp4iAa4ftzP1AR5AgbuDPLm0ByjZC0CQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jy7QlzZooPuohQZ/c26XP8x/PPZTy952CU6Q8AEgGoM=;
 b=liV1KPBT/JQDhjTLtNjSuMw9SoqntC0Tbzohw5E4Bp9FqAeEScXNORTFSp64Rtra2yJ58pmBSaMEWPn6RVzzA9mvxzEUX2CO6Df0h5jmWBnn8qFkNVSqCBqM+L2BqPKIXz58r0npscfiHxlS9mFQnyRZY62SwUj5YjShCZGyQR1ZDNRKFa6ukE98STYV3TcENxWQpgfLUYBGXRtY35MgobdEjE2xTw0i5EBoKmgsmjfBTgB1FfpYoeeKT/PWJrkqYZMzkRQrQf7svpHzHmd119MTs1C6oKQh5E7MnXR/RDYQuXprcUMPEqXGVG2opYAHSNkRpyQIJLHzQrGLnGS+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jy7QlzZooPuohQZ/c26XP8x/PPZTy952CU6Q8AEgGoM=;
 b=9Rf/hVCk4rZpknblC4+huozohdIpvO7V50TZDHWoBanWiaqqhAExxJVBLWAcqLKfdR3kSBubMXYcKhmQkJYDJr75iqdm5p8aTV+bt8+p10ssyo7HztQT/aso25NM5P16oKZqQqu8uMGmtLc3SxprmN6vP72MFs/x++mTJKIfHvU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: xen/arm: Missing appropriate locking for the IOMMU (WAS Re:
 [PATCH v5 02/11] xen/arm: Add PHYSDEVOP_pci_device_(*add/remove) support for
 ARM)
Thread-Topic: xen/arm: Missing appropriate locking for the IOMMU (WAS Re:
 [PATCH v5 02/11] xen/arm: Add PHYSDEVOP_pci_device_(*add/remove) support for
 ARM)
Thread-Index: AQHXxl4YkvgVlFH7LEi1mWK2psfiI6vdbqqAgAAI9ACAAAGCAA==
Date: Thu, 21 Oct 2021 13:52:48 +0000
Message-ID: <CAD6B836-F5B7-451F-AE44-0AE13BB9DC56@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <0dc4423b2e20c1eb40c961b211b18ed041f707b7.1633540842.git.rahul.singh@arm.com>
 <99f6d6c4-bcc6-03a9-ef9b-0d01be0fd7f1@xen.org>
 <75784F90-198E-400D-877B-CF62ED69F409@arm.com>
 <f7c1a7ca-0046-9a58-1cfd-61b096248d9f@xen.org>
In-Reply-To: <f7c1a7ca-0046-9a58-1cfd-61b096248d9f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b025640d-7286-479b-5944-08d9949a171c
x-ms-traffictypediagnostic: DBBPR08MB6011:|AM9PR08MB6004:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB600461EF87FA6EA8605EAABF9DBF9@AM9PR08MB6004.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BjZN0dopFyb1JFqlvYKkL/nu9rO7t1apdaWLAj9cbSsGY5Q/pnfGje2K1qbbIqFuUlOVTAlI9pFCs+Qef3Dmg8r9wRdgv+Z3DyRUlAsicJWOFL6gmwsVVw4Mm94CE4Ta3NIkmV24cj75TZhdEzsAdrLAi+Z0CNJfQsoXba3QazZXl671cQsaBcJatm9KGQkI7H5Fxbv35wXjS5OJMf2tr8a7UrsffPOzjYg44JGpu2MJzfw4O2tLXtSO/r255xENMbU4eOt3zfO65zhZN5hvOWdpD90w+8pAJ3moW3sevGtp1eO/h5PBs3RDa+GttyVddNKfqRTPIXb189aF8lara2xRaFWjqUbU4UKlwPlkFGSp+JoS3IArmXxWwV/UXWQzyeuwH+wJkvd8ltqtuGkrgATNYNbvwmkkammd7mQibBe+flvo4aOPD5dij71ImHTIhzrSkOy4WUnYaNemiRR24HDQHLDZ1seKhI+HVY2rV/qvxGkijPTw43nPpW/iLVBrAq9ZdGMiCyXLGV2ObfubX5egG0xkx7HWsYZe2D2VIkJ9X9a+w4/qU7cnD88lQQTy9IwVG5cw824MIbpT84bs36ENvSjoVMmQMfzt2uG28j8OWA9yL/Hy056r7XFNGwvu6uqQGVpwvX1T8tDgn9e4OJdWtmah0ERJzh+FXtOZSrCbvn09sJvGytgbg+8/OLLYIIabMCsd56STXz4OC+eQnaW1S+ffl2nT54DG4JpNZ9fRPmgumrPzQ98hGhEZWQCQ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(122000001)(2616005)(71200400001)(508600001)(8936002)(76116006)(54906003)(6506007)(6916009)(7416002)(8676002)(38070700005)(66946007)(186003)(64756008)(53546011)(4326008)(5660300002)(66446008)(66556008)(66476007)(33656002)(6486002)(36756003)(26005)(91956017)(2906002)(316002)(83380400001)(86362001)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C6D92CA85FBFE04D80F711DA8CDFDA32@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6011
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4add61de-3679-407b-c6d2-08d9949a11a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6/3D6YDc+6ybiGLxG75flp/cNRlK4uv665s0hsjutJJ2NnOE+KJVzFoNfV0B1RorK/JIrMvcKCaeVfnwJJCeNArhvNlUC2HIteITT10jRtgJ7Brsbi+lI2YLAr5GBcORA7Nc+53xzQzHEl7iZzhVntIMJA/3qNrjj2blpQuwHFu6+8hI/M8ucolU+yFNw7H9TwSknwJJL5LnU+hTRI7nzBmeUtfljg+Ii5Mtszv2H1rOkGymapYoOKso8Jpbg/Aq0YksBOkBwMm28i9GRM2Qh+hivmwX2Z/6GSxU1RxSFyyJ1G9xT5yqaeI/HLVh4HkxBD+kP0D3MTnW8035c9R9oKwJjB2OuJAjO+kchJIhDaTetRidImKTnPNkflZrrsLKX0I9wvJn5e0Uex00AMK2wbqeNySewHECxt186YpgRqCyn4Mcf1XHGuHOsmtJi4DCQk0QnXh6RUsSuTwg7XZyqiL1tdxdiNfyNcwMXHEjdfJIDxatQW/y8uvSXPNcjS9K6wrtWXMwrL9IcfpsyJQ6apy/b1NARvPWQvJ+Zff5iHX0j3nTEfM1DOgCTaVELKZEVVnQiC1oVfmo8ZHkGzdiy0ltg85Ha9SMid3wiL8fBu0OgwHIZupM/XsOHdFPeo3W+W1ogIL4u7A4ZqwfzLJEAOVHmZHzOnI5JA/Hr0YRj3jSuhnvAK8BWkEQOfGeU/fandysdxR0A2d8yQhGJXJLZQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36756003)(8936002)(316002)(508600001)(26005)(6862004)(86362001)(54906003)(8676002)(6512007)(36860700001)(186003)(83380400001)(70586007)(5660300002)(53546011)(6506007)(33656002)(70206006)(4326008)(2906002)(47076005)(107886003)(356005)(336012)(2616005)(6486002)(82310400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 13:52:58.1864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b025640d-7286-479b-5944-08d9949a171c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6004

Hi Julien,

> On 21 Oct 2021, at 14:47, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 21/10/2021 14:15, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertand,
>=20
>>> On 21 Oct 2021, at 10:28, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi all,
>>>=20
>>> While going through the passthrough code. I noticed that we don't have =
a common lock for the IOMMU between the PCI and DT code.
>>>=20
>>> This is going to be an issue given it would technically be possible to =
add a PCI device while assigning a DT.
>>>=20
>>> Rahul, Bertrand, Oleksandr, can you have a look at the issue?
>> Yes we can have a look at this.
>> Right now pci device add is done by dom0 so I do not think we have an is=
sue in practice unless I wrongly understood something
> This will depend on the XSM policy. With the default one, then yes I agre=
e that only dom0 (we don't support hardware domain) can add PCI device.
>=20
> However, this restriction doesn't really matter here. You would be relyin=
g on dom0 to do the locking and AFAIK this doesn't exist. Instead, the admi=
n would have to ensure that two don't happen at the same time.
>=20
> Anyway, I think Xen should take care of preventing concurrent IOMMU opera=
tions rather than relying on external subsystem (e.g. dom0) to do it. At le=
ast the Arm SMMU driver will rely the generic locking to modify atomically =
internal list.

Agree, was just trying to make sure I understood the problem correctly.
We will check that.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


