Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1FD6B792F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 14:39:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509287.784779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiOg-0007o8-4o; Mon, 13 Mar 2023 13:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509287.784779; Mon, 13 Mar 2023 13:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiOg-0007lp-1V; Mon, 13 Mar 2023 13:39:30 +0000
Received: by outflank-mailman (input) for mailman id 509287;
 Mon, 13 Mar 2023 13:39:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++h+=7F=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pbiJC-0004ws-Dt
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 13:33:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6860922d-c19f-11ed-b448-930f4c7d94ae;
 Mon, 13 Mar 2023 14:03:15 +0100 (CET)
Received: from DBBPR09CA0011.eurprd09.prod.outlook.com (2603:10a6:10:c0::23)
 by DB8PR08MB5435.eurprd08.prod.outlook.com (2603:10a6:10:113::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 13:27:45 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::d7) by DBBPR09CA0011.outlook.office365.com
 (2603:10a6:10:c0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 13:27:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 13:27:45 +0000
Received: ("Tessian outbound 55ffa3012b8f:v135");
 Mon, 13 Mar 2023 13:27:44 +0000
Received: from db4281e1ad0e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8FA91F14-27AA-4F9C-A792-F6B828DB0CF0.1; 
 Mon, 13 Mar 2023 13:27:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db4281e1ad0e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Mar 2023 13:27:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9645.eurprd08.prod.outlook.com (2603:10a6:20b:61a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 13:27:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 13:27:31 +0000
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
X-Inumbo-ID: 6860922d-c19f-11ed-b448-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBrl2vXbXXcZw9VB3uJMC6npfF3pNUGDO7BlABGsY1M=;
 b=Wgu9A3sc5DgBULs5HFSlIm2BMwSmJcqSiibivHmLvOs4ldj4mxEdspRNdPaFmZwMyBSZpV90UdvQJyBiA+lTQxxWRry4ni0xla2dMPAK93GlnmjEbs7umZTuIzxOG+kKEFyYITTmuTeqmTDuxfzy4KXYM+oSVpYG9vGfY7wY2RA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1dd0eb5c71a74741
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kk0u1XbT3CnCdsuTNG8oGYBAFXV3rCOls3fqfAZWDYVfcjbPOakBZ2yCQut9LElW3rQuPx6cZMqXBvQErLpww0OnSjmwFWx/Ise5qV9CMePAZPGZs6OeMDkZvqVE9Mou3vlwMigyQl+p8ME21qjN97xC703BT7r9hxA2kSfv4sg8VIpE6lsW6LKo/sWpy5gHAOkqj/ozol0JrYQ84RDwA1iQ/wotfVSULpb/R6jg3CbIP+Uhq4bVoxpuvsmrJbZB1nU4vYpmTtdi4oWSIZR+mzrEje11xkINlf7mmxwPzYMu81f0K5vMqQBGovqzqr+pd7Lx20vRd44uRN7Yf6cHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBrl2vXbXXcZw9VB3uJMC6npfF3pNUGDO7BlABGsY1M=;
 b=nK6th71MdBIov6e1eARXkc1rsSWJb9XS11aBVdpedqxgD0BeZQ9v84Jv+pp3Yjcri0HXSIDkbi2mbDZtCtJC31f1THGNs8PBphM8COxkJRUE3i0XjG9zOC+b23dUOG3yBvpVVGZNqpYsPnH66l8NtimZK9Qss+1BNLg5D0AnaHIMiL3vB8SWztuA+YPxA6xURlMOns1nb4W+AZj9GLfdlAGhQ4vPq9rs5RsxLZiTwUyioOwoNxFSTNkIXMVFSy8/8JV7NfoAt0yZkXuBU/IX6SCJz80fZSyB7SAiZkoFqGon2PW2/hYvrBRYWORJFhwBZA+60+t/EkM/zb5WcDUfNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBrl2vXbXXcZw9VB3uJMC6npfF3pNUGDO7BlABGsY1M=;
 b=Wgu9A3sc5DgBULs5HFSlIm2BMwSmJcqSiibivHmLvOs4ldj4mxEdspRNdPaFmZwMyBSZpV90UdvQJyBiA+lTQxxWRry4ni0xla2dMPAK93GlnmjEbs7umZTuIzxOG+kKEFyYITTmuTeqmTDuxfzy4KXYM+oSVpYG9vGfY7wY2RA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel
	<michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Rahul Singh <Rahul.Singh@arm.com>, Andrei
 Cherechesu <andrei.cherechesu@nxp.com>
Subject: Re: [PATCH v3 2/2] arch/arm: time: Add support for parsing interrupts
 by names
Thread-Topic: [PATCH v3 2/2] arch/arm: time: Add support for parsing
 interrupts by names
Thread-Index: AQHZVaz1hJUkfdlibkq6wV6LX+eESK74s7YA
Date: Mon, 13 Mar 2023 13:27:29 +0000
Message-ID: <1D22246B-8E81-4934-B2C2-647DDFC69F84@arm.com>
References: <20230313130803.3499098-1-andrei.cherechesu@oss.nxp.com>
 <20230313130803.3499098-3-andrei.cherechesu@oss.nxp.com>
In-Reply-To: <20230313130803.3499098-3-andrei.cherechesu@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB9645:EE_|DBAEUR03FT036:EE_|DB8PR08MB5435:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3208ed-8430-4f70-65d7-08db23c6baf6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Xtm3nSylLEX3C5pWwYHKyz84SGIqgwSwo9U6mybb/ZSvAxF01bgOowgX6wQTl+kNx9nnNL3GfMH2NRL4MZn/5c6vqZHgakDR1aNbhdK2F2J6qcpsrszdMZIfgG14bGG+hyr93W0NF7lSeEgXtQpRAPdwvYD67d4D8qHE9G6OD5RrbPZFNnMi1BUQsM7DDKE0GTmLP9ju9VEazRWAalroBemSKhScFMNqvT5Y3rcbewvSZqFgEkkZUjf8kQBn1LhRlG6g8ij+1UdYBPuyV2ikCMmS+i90K0sLyp3iDSKT0xdeD7NJ9ZBedKYZXUoLh3HFzjO+HkoXWGbEZE34r5f9e07s8bxDns7pj4hnRKcl3esPAinAmE4RwXlIV381DAp4EZqOHoOarMQMZq4/OspweIfwzzTK1cAdxVV5coO5b2A9vuDEAT6fCG83HTQBXRjzb5IkF5N0Wh/7CqiNT0KprSYJ1rQ3VFm29C5F4xIznZveg0ETX9bRZprT1lgNqgw4EVaaVU7Q3PbjXXku0oZ41zrrsrIBd2TN2d1fSWoqdhOMz1363Dwcnnzceo8cy/wZNuzgv3r8uCFA/uJ37QVyp3iXmVExnHdbR9feUanD53nT/V+sFAnavs04oK8El7cqbJYhKZy2MqB4D6iolmjDDzbmbhV2XkzLfCK2nIYqJF1jaRQiuc/6ilVb0f0tWCyHK5VWXJdeV6DmHOaPGcN1MhPExT4Sj19+4psu+2+jde0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199018)(6486002)(2906002)(83380400001)(6506007)(6512007)(5660300002)(53546011)(36756003)(8936002)(33656002)(186003)(71200400001)(8676002)(41300700001)(86362001)(91956017)(38070700005)(2616005)(6916009)(4326008)(66556008)(66946007)(76116006)(64756008)(66446008)(66476007)(478600001)(122000001)(38100700002)(316002)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8EE62C022C99064CAF447ACDC0B19A0A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9645
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a0a87da7-c998-49dc-eb0b-08db23c6b1ee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZEhjZM/TJ6AjaWxWA5aYOwtZm+5Nmhs6iEik/VJEWtRZDXGDXWm7iyRA7wCTpSH6Vq5i3XJgp3PFrlHKjb062hCohe65DvR+LQisyxlCFOvl7XYUClhHxIgqGt4goHc+x8Clv3vcemQPQupF5QYjLyhBPBohlhhejLE06/s6GEO6RUW5ch5RqXe9XtzVN0GxTQ2V/n6Bc+C+/cc09JcESepOKXAsCumvfT2aiLOplqSF/hK12fkMV1tTJyIckMEQL+2AWvsDRHPOa7EEkbQXBBTqMriBQ3wYxsseyLTxVQNDXybQDIWptyF8C6eI1Zsuabsph/nuGEzXMFPMP9Cu0d1FICCtsEv7BOKWtO7jl1GEh7SKuQAOeBkNIvDqhY1eCblq2EOLLnUsRNenwcMbqQZvXxJe8L53qU0cV1lf9blZIW2u/2X+1n8yoF23txub72u1RUpKmGiaV0SJNPTg3tHffEP2Y2utVyk0PLcpd65KhjzZCZlzLkiAB7dmjrNuREXr57zmVUjuwW0ADLSMML+/WKvX6axfYoVeyDyqgkRUQLtaMhvnwrLeRyWSfps6NLySyoUIYxKDUWcYn8jmSeLEtaDONorUzy5JuXuY4PeSGDHSxEhPbvJomoOxBCjJtPvZP1ErE0JpFtJHlg2njSpUI3Px7vyz4ktvQEi3VTE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199018)(36840700001)(46966006)(33656002)(36756003)(86362001)(82740400003)(81166007)(356005)(82310400005)(2906002)(5660300002)(6486002)(6862004)(54906003)(8936002)(41300700001)(70586007)(40480700001)(70206006)(316002)(478600001)(4326008)(83380400001)(8676002)(47076005)(36860700001)(6506007)(186003)(26005)(53546011)(336012)(2616005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 13:27:45.0107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3208ed-8430-4f70-65d7-08db23c6baf6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5435

HI Andrei,

> On 13 Mar 2023, at 14:08, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.=
nxp.com> wrote:
>=20
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>=20
> Added support for parsing the ARM generic timer interrupts DT
> node by the "interrupt-names" property, if it is available.
>=20
> If not available, the usual parsing based on the expected
> IRQ order is performed.
>=20
> Also treated returning 0 as an error case for the
> platform_get_irq() calls, since it is not a valid PPI ID and
> treating it as a valid case would only cause Xen to BUG() later,
> when trying to reserve vIRQ being SGI.
>=20
> Added the "hyp-virt" PPI to the timer PPI list, even
> though it's currently not in use. If the "hyp-virt" PPI is
> not found, the hypervisor won't panic.
>=20
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/include/asm/time.h |  3 ++-
> xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
> 2 files changed, 24 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/t=
ime.h
> index 4b401c1110..49ad8c1a6d 100644
> --- a/xen/arch/arm/include/asm/time.h
> +++ b/xen/arch/arm/include/asm/time.h
> @@ -82,7 +82,8 @@ enum timer_ppi
>     TIMER_PHYS_NONSECURE_PPI =3D 1,
>     TIMER_VIRT_PPI =3D 2,
>     TIMER_HYP_PPI =3D 3,
> -    MAX_TIMER_PPI =3D 4,
> +    TIMER_HYP_VIRT_PPI =3D 4,
> +    MAX_TIMER_PPI =3D 5,
> };
>=20
> /*
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index 433d7be909..0b482d7db3 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -149,15 +149,33 @@ static void __init init_dt_xen_time(void)
> {
>     int res;
>     unsigned int i;
> +    bool has_names;
> +    static const char * const timer_irq_names[MAX_TIMER_PPI] __initconst=
 =3D {
> +        [TIMER_PHYS_SECURE_PPI] =3D "sec-phys",
> +        [TIMER_PHYS_NONSECURE_PPI] =3D "phys",
> +        [TIMER_VIRT_PPI] =3D "virt",
> +        [TIMER_HYP_PPI] =3D "hyp-phys",
> +        [TIMER_HYP_VIRT_PPI] =3D "hyp-virt",
> +    };
> +
> +    has_names =3D dt_property_read_bool(timer, "interrupt-names");
>=20
>     /* Retrieve all IRQs for the timer */
>     for ( i =3D TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>     {
> -        res =3D platform_get_irq(timer, i);
> -
> -        if ( res < 0 )
> +        if ( has_names )
> +            res =3D platform_get_irq_byname(timer, timer_irq_names[i]);
> +        else
> +            res =3D platform_get_irq(timer, i);
> +
> +        if ( res > 0 )
> +            timer_irq[i] =3D res;
> +        /*
> +         * Do not panic if "hyp-virt" PPI is not found, since it's not
> +         * currently used.
> +         */
> +        else if ( i !=3D TIMER_HYP_VIRT_PPI )
>             panic("Timer: Unable to retrieve IRQ %u from the device tree\=
n", i);
> -        timer_irq[i] =3D res;
>     }
> }
>=20
> --=20
> 2.35.1
>=20


