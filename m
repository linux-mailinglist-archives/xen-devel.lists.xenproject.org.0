Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E5C447A79
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 07:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223062.385589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjyCq-0005CW-PA; Mon, 08 Nov 2021 06:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223062.385589; Mon, 08 Nov 2021 06:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjyCq-00059Z-Ls; Mon, 08 Nov 2021 06:32:36 +0000
Received: by outflank-mailman (input) for mailman id 223062;
 Mon, 08 Nov 2021 06:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6K4m=P3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mjyCo-00059T-Qe
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 06:32:35 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe06::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a54b7f27-405d-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 07:32:30 +0100 (CET)
Received: from AS9PR06CA0265.eurprd06.prod.outlook.com (2603:10a6:20b:45f::34)
 by AM9PR08MB5876.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Mon, 8 Nov
 2021 06:32:29 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::c5) by AS9PR06CA0265.outlook.office365.com
 (2603:10a6:20b:45f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Mon, 8 Nov 2021 06:32:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Mon, 8 Nov 2021 06:32:28 +0000
Received: ("Tessian outbound d49ee2bec50d:v108");
 Mon, 08 Nov 2021 06:32:27 +0000
Received: from 10504046ded9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 55EA275A-11E7-4DF0-B7A1-964562735880.1; 
 Mon, 08 Nov 2021 06:32:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10504046ded9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 08 Nov 2021 06:32:17 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DU2PR08MB7312.eurprd08.prod.outlook.com (2603:10a6:10:2e7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Mon, 8 Nov
 2021 06:32:16 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f4fd:a3a4:6768:1165]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f4fd:a3a4:6768:1165%3]) with mapi id 15.20.4669.011; Mon, 8 Nov 2021
 06:32:16 +0000
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
X-Inumbo-ID: a54b7f27-405d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TvlC+Qf5fMHZA2wsrLTQs85mXKNK4nPuyn+1eu5GaE=;
 b=dVmDnNY7/z0EfrakOXCFkFZNYaJnm8j3JvqtKpkCYvxeop63Yzn/jbRePH+moktsLtMAMuliN3LZGr7eXrpW/5F1D+/DzVGsGHqknFU9PekrqVSdTLJRGc+aeFdtivigLOMRN8VIuOVlQ29I33qJuZoCwgGGi948vbB6kiRJ470=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNKlZYsSJ+TZD2bAWaq/J+anSUcbZcmUcqdarmNeXeQDA51wvkTtublcM60wMRQ6WX3qQEHsKOboKLOzwopsF7WJd4BLPbxXL37qWYxnnl36NG6xHSBvUfvkjaMELafCw3vKveiSz/k6pUkiN9EHyEhv/UsODOwtzuFb5VoKoOYdxY7C4HG2y/GN1DmLBrYaPUjbnKJHkfcnQBoQl5YtIUHbbdU8z9aErEcU6holkmXFl1uBfync2OeQSoQNlW9NtlDx3GSVGG2OyO2cVAMkcFbAAvgqZS6EQHkTlrPG8l5J6Ug8PcfF6vVzya+uaXrW8k9Xa6ndxAJdVxqUOuk2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TvlC+Qf5fMHZA2wsrLTQs85mXKNK4nPuyn+1eu5GaE=;
 b=QI/nPpMrWj9QbWgoidtkJtoHVUPw1tlTRr58jl+eYrIT4vNjrVzwj8fqiKrtOMEoZ23hoyTXTkp2A+FbIuabOgTO88VWpwQZS6pQXicDkL9WMRIgGVCAAglmzUDLGl9xTi26nwjoS2STjj2mWYcvP50zLuQ2SHSyPIiMu8uQPcauf8OLH2r9rbwALt/PEg2ty5AyOW7/ia8imHKi1zuKP3v1Nz7i7BdFHIioSfkssnqIM6cEqJtn+31x8WbBh+2JlYZprjJ7YyObGXXt1LTUM5/BJDiLWLNLs3mYKxklK8OsGZP6qVqI5fkNVCZT5LtRsqiSJnTvzGF3mTRcYO5hMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TvlC+Qf5fMHZA2wsrLTQs85mXKNK4nPuyn+1eu5GaE=;
 b=dVmDnNY7/z0EfrakOXCFkFZNYaJnm8j3JvqtKpkCYvxeop63Yzn/jbRePH+moktsLtMAMuliN3LZGr7eXrpW/5F1D+/DzVGsGHqknFU9PekrqVSdTLJRGc+aeFdtivigLOMRN8VIuOVlQ29I33qJuZoCwgGGi948vbB6kiRJ470=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien
 Grall <julien@xen.org>
Subject: RE: static-mem preventing dom0 from booting
Thread-Topic: static-mem preventing dom0 from booting
Thread-Index: AQHX0eWC7qpRq+VAt0Cu1/k92WugAqv0ODjwgABBVXCAAJnMgIAAe3eAgAOZYsA=
Date: Mon, 8 Nov 2021 06:32:16 +0000
Message-ID:
 <DU2PR08MB732591B79A7ED13090840C46F7919@DU2PR08MB7325.eurprd08.prod.outlook.com>
References:
 <alpine.DEB.2.22.394.2111041829300.284830@ubuntu-linux-20-04-desktop>
 <DU2PR08MB73256624607E7624CAAD38E5F78E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <DU2PR08MB7325A7A5658B1EB7C6EB4DECF78E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2111050836580.284830@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2111051554000.284830@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2111051554000.284830@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 07EF7716B777804999C1E46D81FE44C0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b4a8e45d-0223-4e2d-097d-08d9a281891d
x-ms-traffictypediagnostic: DU2PR08MB7312:|AM9PR08MB5876:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB5876A3B437EE4E16CB687B23F7919@AM9PR08MB5876.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 f8x6neSoYj46PSgjrx5ZQPcUpm7M1px8xHzv0g8DmRfRy8aie00Uggvu/SHzRJKz6vp0tPWAIaqZIWRByqIkwj/B+psYDnL702EaFYMSIV31E3PujWA4xeKarO/g3jc6J7FwnfnBuIaD+rBe4grCtNpR9dBV11dB6MV4Tbi47gp3RiEV/g0LWn+uzl58hdgBsktj1GlC8hN7wOplkXnhflHRFMnHk2eunyDE/61J9Oyd8tXUCG7esjkUPpFPb5vXoBP7eQVssJKCyYrS7QWT7f6jaSl14QDfuzTBuGu00XBzZxNVDBfLUdst+bYDYfB9rKhRGjggC4NbJrNhLQwuufmG35n8lAOxmXy/U3Kc/wA7DY4PE2iWsSuoSfZfmQRhSyx4G3rU2erGAZzPHwrS2gb3k4douFtBNDPdUCE0FvEmajW69YJxn7uezRoZbq9x2tHgsTXzRcAtAF8mXffCyMHHALayC156dKybjhf4ZX9c2rOzqrS+YIiSJnGXs9+dwbYYo5Mow41U9Qiu8ln3l4rRmvvhYg7TUm70YoXYbcb594ZCl6dor4B1NPd3WeA0M7g4X0mzpoUPAd4p+FjNZN9DcXprrLsXqrsOMgH0HPKa8M2EAmf00MFUjp4faqMA8gYZbl3K37wTpGyZri4tIOZ0kRhoHcfBFuM+EnP3L2TE9O0L1WLfA9orz+2VDJuLptqvD1LFC3OpjHAgVj4jIQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016002)(54906003)(66476007)(66556008)(26005)(83380400001)(86362001)(122000001)(64756008)(66446008)(5660300002)(6506007)(53546011)(316002)(9686003)(52536014)(38070700005)(8676002)(8936002)(6916009)(186003)(508600001)(76116006)(33656002)(4326008)(71200400001)(66946007)(2906002)(38100700002)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7312
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	26286311-1fe4-4ecd-f94b-08d9a2818215
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6jAP1Q8mW2UzLhOZwRt1VTdrnD3fyd5L6hT6aPRZyJLl2X36nOJ+wOOlGsvYTqhwaM7mg4HAqU/uJIXHyy0eutA0ytVjaqYVpIHLCFqN6ADWzQtCq07SNFEJv+5vmpghUvdLp8aZVs5zxqTAw5ut7nl1N6F4UABUMJrzFIEYQjemq0zgm4wdZEDY9KnXow4KAlCz+T+t1IEkPy3H2qhrGe4u4PzYrKROJFIJCoCqSUBkBY6SlK9647BzXChIpVR1aAO4HXnKOnhEoyduY/JVlN6EhUPpC6225CLTZAEpzjnNx+w6FIDlNiqxNi0CvE5yigTvpkBMqXPD/3KEnolt56VHQE9ELk7bkhO9vbDrx3cewv1yKNsCtqjpMSVlvsODNSCLTKSKKaoLEl6qHQNpW+IfZW9r0ani/+cRPNrSMrX3HjGVcJvBB7/rLoChz/TOFaOcH6kvf4UdgG1snv+SIh8tsyUrNsX46WILCbXt4zZoVITbIiauwRDB2mTgz/Ns3PgMTRfoy+utiHLq3MoAxgze/8TBxDjAE7mDCOh42Mheu7Z9qWTd2c5v1SVvoUhb/q3LLrGAdCFpmj/kAZ8we9MjnITUkl4tqOZzoVU3hMa6bV4aG9kI5SKiwNoyxA3cD+9qEc8O8wUcapEKzHAQWP+mo7KN2k7Txpje3i0q1JQ10UDQwdiG0e40jJNZoftwkpzLJ/t4i3JKYrFWlN4UGg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(83380400001)(26005)(53546011)(336012)(4326008)(81166007)(356005)(36860700001)(82310400003)(186003)(8676002)(7696005)(70586007)(5660300002)(6862004)(54906003)(70206006)(508600001)(9686003)(8936002)(52536014)(316002)(55016002)(2906002)(47076005)(33656002)(6506007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 06:32:28.3358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a8e45d-0223-4e2d-097d-08d9a281891d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5876

Hi Stefano

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Saturday, November 6, 2021 7:03 AM
> To: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
> Wei Chen <Wei.Chen@arm.com>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>
> Subject: RE: static-mem preventing dom0 from booting
>=20
> On Fri, 5 Nov 2021, Stefano Stabellini wrote:
> > The scenario is extremely simple; you can see the full device tree
> > configuration in the attachment to my previous email.
> >
> > - dom0
> > - dom0less domU with static-mem
> >
> > That's it! So basically it is just a normal dom0 + dom0less domU
> > configuration, which already works fine, where I added static-mem to
> > the domU and suddenly dom0 (not the domU!) stopped working.
>=20

Got it. Sorry, I missed the scenario you are talking about... I simply thin=
k what dom0less
means that dom0 is absent... ;/
 =20
> I did some more debugging today and I found the problem. The issue is tha=
t
> static-mem regions are added to the list of reserved_mem. However,
> reserved_mem is automatically assigned to Dom0 by default at the bottom o=
f
> xen/arch/arm/domain_build.c:handle_node, see the second call to
> make_memory_node. Really, we shouldn't give to dom0 static-mem ranges
> meant for other domUs. E.g. the following change is sufficient to solve t=
he
> problem:
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 88a79247cb..dc609c4f0e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -891,6 +891,9 @@ static int __init make_memory_node(const struct
> domain *d,
>          u64 start =3D mem->bank[i].start;
>          u64 size =3D mem->bank[i].size;
>=20
> +        if ( mem->bank[i].xen_domain )
> +            continue;
> +
>          dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
>                     i, start, start + size);
>=20
> However, maybe a better fix would be to purge reserved_mem of any
> xen_domain items before calling make_memory_node.
>=20
>=20
> I found one additional issue regarding is_domain_direct_mapped which
> doesn't return true for static-mem domains. I think we need to add a
> direct_map bool to arch_domain and set it for both dom0 and static-mem
> dom0less domUs, so that we can change the implementation of
> is_domain_direct_mapped to:
>=20
> #define is_domain_direct_mapped(d) (d->arch.direct_map)

Yeah, I already pushed a patch serie regarding direct-map to community for =
review,=20
and it is also based on your old direct-map serie.=20

Today, I may push direct-map version 3 to community for review~~~ If you're=
 free, plz take a look.

Cheers,
Penny Zheng

