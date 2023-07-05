Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E50748940
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 18:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559436.874418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5NR-0003y2-0A; Wed, 05 Jul 2023 16:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559436.874418; Wed, 05 Jul 2023 16:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5NQ-0003vc-Sq; Wed, 05 Jul 2023 16:29:12 +0000
Received: by outflank-mailman (input) for mailman id 559436;
 Wed, 05 Jul 2023 16:29:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUcB=CX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qH5NP-0003vW-N7
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 16:29:11 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1209abc6-1b51-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 18:29:10 +0200 (CEST)
Received: from AS9PR06CA0417.eurprd06.prod.outlook.com (2603:10a6:20b:461::21)
 by DU0PR08MB8811.eurprd08.prod.outlook.com (2603:10a6:10:478::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 16:29:08 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::1e) by AS9PR06CA0417.outlook.office365.com
 (2603:10a6:20b:461::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 16:29:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Wed, 5 Jul 2023 16:29:07 +0000
Received: ("Tessian outbound c63645f235c1:v142");
 Wed, 05 Jul 2023 16:29:07 +0000
Received: from 4d94515c619c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 312E5DF7-CC26-4C5B-88EF-39B01728B762.1; 
 Wed, 05 Jul 2023 16:28:59 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4d94515c619c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 16:28:59 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6469.eurprd08.prod.outlook.com (2603:10a6:20b:33c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 16:28:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3861:64c:eb82:afa1]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3861:64c:eb82:afa1%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 16:28:55 +0000
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
X-Inumbo-ID: 1209abc6-1b51-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzzK/XhWGOrk8HnjhJkj84yrN41q/XYrrsoE2vG07Tg=;
 b=lZPSkFlXDAbZxlyKDQxIArMFuSp2NJ4Rzb7b/Hfv2J6B5tWs5EuAckP9nCLd5a5b9Q14IXj65hoA9xHTTdOU4EW3jmybUsice4A+ttEqfFc3R4D/kDhk+rd9UZy/O6WoMM1c9JUJLsdyjwV6DGN19OP2HO1V9Viy9JXw3DG3ioM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 750f814f1cda6cef
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muJWuD8CyC3HZNOXpSa2go82nU+ej+0FcMU8oiAQxmGWZXooB2nN7aBvAFt8tBOjmgl8RRxm+hr17wVX6JBmYAr04D/nypoe1UcCQWJzbzxuWEIy5vU10m80HuyJ6nUoqrKso6JrdtVC/3CAiWCBt73uMEbYSskdCeB5DcgQZtopxJArw5th/lW/N5RFMbUnVbNRIK+O3aMYRem98HhPHSpLnma54q5Yh6P+fy6O+2cNKBjQ1eRMia0vEdy23zQYUIPmM5J2WctAk2POVILoirjR6LGZycJ5ioQMCKiPe6x3lVDF9OmblFnLOP1IUCDgBCzn6csUO4rq7MyEZSt0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzzK/XhWGOrk8HnjhJkj84yrN41q/XYrrsoE2vG07Tg=;
 b=PIGcKOG6fWHc4JcvZ6WgPHQW2bipPVA+D18zQ6Eupm4tOGNZNGHvXudtdOBNyto8PdRd1KgAQTYQC3TWqPoE3fsTs5x1JJS0ZmuRVaxtp7AZgcTtLU4a2XftzRyXhJG8glrC/dQ9d0oGqDVb4zqV7Zx81UXGp0FYKioFX/OspzQad9OcEkm/GkHeTd0NL9TX5cqV6zJVA4fv1JLgn1AqaqIzZSjIYSID4wMy39llR3wR8ou4bw9GZJMa2SWTY9FmQU9QB4dFhUYgGkvfJnYU9VdjDj+FF/MPHsIVULyRkeD6tEvN9haboYM76TbNPkyjUcVsJsrgcNztPmwPm1XO+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzzK/XhWGOrk8HnjhJkj84yrN41q/XYrrsoE2vG07Tg=;
 b=lZPSkFlXDAbZxlyKDQxIArMFuSp2NJ4Rzb7b/Hfv2J6B5tWs5EuAckP9nCLd5a5b9Q14IXj65hoA9xHTTdOU4EW3jmybUsice4A+ttEqfFc3R4D/kDhk+rd9UZy/O6WoMM1c9JUJLsdyjwV6DGN19OP2HO1V9Viy9JXw3DG3ioM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>, Xenia Ragiadakou
	<Xenia.Ragiadakou@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v2 05/13] xen/device-tree: fix violations of MISRA
 C:2012 Rule 7.2
Thread-Topic: [XEN PATCH v2 05/13] xen/device-tree: fix violations of MISRA
 C:2012 Rule 7.2
Thread-Index: AQHZr1U/ZRs2G60btUij4+Ecgr80f6+rXN6A
Date: Wed, 5 Jul 2023 16:28:55 +0000
Message-ID: <A5B858FA-8737-47B6-A230-38C2E0E56179@arm.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <da656a93e42e5d04e02f62002b1f5ab357c8c16a.1688559115.git.gianluca.luparini@bugseng.com>
In-Reply-To:
 <da656a93e42e5d04e02f62002b1f5ab357c8c16a.1688559115.git.gianluca.luparini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6469:EE_|AM7EUR03FT022:EE_|DU0PR08MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 7793d5f4-d685-44c4-509c-08db7d74f49b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 i3Uzf10QVqxfLrQv64bt5DeAcAa04w1/L4TZ4knXiR/oqZtsv9vW7GMnLdppLlAFC2MQgXFQfxhERp97dUTM34cKcNZuQi3tVoKjR1rhMth+joW6wD7RDSnS+J7b/ILiQjZktNtidkItDHYAMtZjHFZcdNof4yQJDUHuWtIRZoQZRxl9g+hC24VdoLeYEAH26Vnn/khZG1TFNgxNba61Z/jyKBdNaohoH+7eQi78ZmphSI6CpuPz2WURx2sVhY3CK9WQ2PExcmtiU7nb1Le31AZSW0Q5Vt7fqdQe5Me8i3ooutJupvRpklPWJe5cPmASU/tV2XUT3Q7yDnpna8BxgFDumacPirKOteNczNAPQ762i7v0IVztEtVFu6WAFqcoX9mVT538+AuL2NChlVLN1tRJB/HxOxvfWCItEQLr9KOcN31CTCJjx3UrgtK3e+U5f/oesAVSFaNEelnnuOS5oXQhaeioT4ZxysfFNNz3V8wA1KiPoV/mayvFhg0u1BDPe9LbJyjIiq9+dEZ5cpp0n4tFa/XzOz39Mxg0gYWkSlPtONCKV0Dxl9x6eL/LoTsH2MM98VomhOj4aajzkVavgZ/Gjfv0wpvQOliWOEl1ca1Qn7k4RMgCvpY1SfZWikoZEQS7N1GQjIFqFl1S/XbrVQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(2616005)(4326008)(76116006)(66946007)(91956017)(38100700002)(66446008)(66476007)(64756008)(66556008)(6916009)(122000001)(186003)(86362001)(478600001)(36756003)(38070700005)(6486002)(33656002)(71200400001)(6512007)(26005)(53546011)(6506007)(8676002)(8936002)(54906003)(5660300002)(2906002)(41300700001)(316002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A463C0DE1EB3C6428104F395D80B5F03@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6469
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	baaaf976-7a43-4445-6ece-08db7d74ed70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hvU8vBiUouUD50akTMfPeXvvaxg4kSDiV50Cwjptcn4pWihbOQk74aVrT/lBgiEkrTGQsfH5OHPeCwP680IO+BjbBt01EUa7NgACWLhMqdO7w5GLYWPDRZzwQNoYfkDteRZNYz0NYZa7xOf307/XtO4PzEF8/FfkcqX4i5IPeOekhvEObl+7AskzqR2yNmYWqzkG0u7eXbeTKAgGAmSpjCSboSz5PaLpzoGeAE5HusMhkOwChUj8equB//lh428ghKM6KocX0GiTifx5jTRRhtqrg3FrsBt7Fn0Hp+63+2ggN27Kk7vMCuaGkgg9VOpCT8qe78omhK3O/Lrs5oK21YyiNwODMCwgOEWvlv2gLdVAdfMEd59Vk2zSYerNeEFj5czsuC27zaxNe4qNUJw5HU4EGoIeIwVZU7WAMVOJB3CbQuBjpMtMFT75q9BlLy25/AE/muG5M2SJUsdvwK+bYjm3QKnnX1qp2CHaW+v5YsIbTEOJERHFcGYtSuT8FJ437HF0/mRpn3osbaYDiIrXLOESULON8Pkh8HI425QOk3pxlfMkWmW3NGlgfoqEnYWHQIRvF8n3D8KM93vN8YaYMhrutwxZdWM3/hZCBZ2344iRZwa4WpJbxXbxTaCu8AJBA51gcAm8Yy3mC7QdqCL88HbfowL/xq05U75EURFwpR9ZwdQXrFYiKSq1CDI4OhoEX4KZZ6fRvFdUAtAwmare2vLLfjb10ZTPiZUdKMypmv+xcCrqVK1LXOKTzWuWioN/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199021)(40470700004)(46966006)(36840700001)(336012)(40460700003)(41300700001)(86362001)(6486002)(82310400005)(53546011)(47076005)(83380400001)(82740400003)(356005)(81166007)(6506007)(2616005)(26005)(36860700001)(6512007)(40480700001)(54906003)(478600001)(316002)(36756003)(4326008)(70206006)(70586007)(33656002)(8936002)(8676002)(186003)(6862004)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 16:29:07.5929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7793d5f4-d685-44c4-509c-08db7d74f49b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8811



> On 5 Jul 2023, at 16:26, Simone Ballarin <simone.ballarin@bugseng.com> wr=
ote:
>=20
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>=20
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
>=20
> Add the 'U' suffix to integers literals with unsigned type and also to ot=
her
> literals used in the same contexts or near violations, when their positiv=
e
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
>=20
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

Looks good to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> Changes in v2:
> - change commit title to the right one
> - change commit message
> - change maintainers in Cc
> - remove changes in 'libfdt'
> ---
> xen/common/device_tree.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 8da1052911..0677193ab3 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2115,7 +2115,7 @@ static void __init __unflatten_device_tree(const vo=
id *fdt,
>     /* Allocate memory for the expanded device tree */
>     mem =3D (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_devi=
ce_node));
>=20
> -    ((__be32 *)mem)[size / 4] =3D cpu_to_be32(0xdeadbeef);
> +    ((__be32 *)mem)[size / 4] =3D cpu_to_be32(0xdeadbeefU);
>=20
>     dt_dprintk("  unflattening %lx...\n", mem);
>=20
> @@ -2125,7 +2125,7 @@ static void __init __unflatten_device_tree(const vo=
id *fdt,
>     if ( be32_to_cpup((__be32 *)start) !=3D FDT_END )
>         printk(XENLOG_WARNING "Weird tag at end of tree: %08x\n",
>                   *((u32 *)start));
> -    if ( be32_to_cpu(((__be32 *)mem)[size / 4]) !=3D 0xdeadbeef )
> +    if ( be32_to_cpu(((__be32 *)mem)[size / 4]) !=3D 0xdeadbeefU )
>         printk(XENLOG_WARNING "End of tree marker overwritten: %08x\n",
>                   be32_to_cpu(((__be32 *)mem)[size / 4]));
>     *allnextp =3D NULL;
> --=20
> 2.41.0
>=20
>=20


