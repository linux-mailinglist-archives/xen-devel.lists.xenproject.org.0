Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CBE7AFE02
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 10:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608724.947389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPiu-0006Ut-U2; Wed, 27 Sep 2023 08:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608724.947389; Wed, 27 Sep 2023 08:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPiu-0006Ri-R5; Wed, 27 Sep 2023 08:16:44 +0000
Received: by outflank-mailman (input) for mailman id 608724;
 Wed, 27 Sep 2023 08:16:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gzin=FL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qlPit-0006Rc-PF
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 08:16:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f5b5d60-5d0e-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 10:16:40 +0200 (CEST)
Received: from DUZP191CA0031.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::23)
 by PAXPR08MB6573.eurprd08.prod.outlook.com (2603:10a6:102:dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 08:16:35 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4f8:cafe::68) by DUZP191CA0031.outlook.office365.com
 (2603:10a6:10:4f8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Wed, 27 Sep 2023 08:16:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.21 via Frontend Transport; Wed, 27 Sep 2023 08:16:35 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Wed, 27 Sep 2023 08:16:35 +0000
Received: from 09362cdc272e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8BF67789-3205-4069-8E31-FCC99FE2A92B.1; 
 Wed, 27 Sep 2023 08:16:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 09362cdc272e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Sep 2023 08:16:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB7457.eurprd08.prod.outlook.com (2603:10a6:102:2a4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 08:16:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 08:16:22 +0000
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
X-Inumbo-ID: 2f5b5d60-5d0e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KP7CU8B8G4gafGveW0xNPmjKP4Y1zKjvRG2FNNjnws=;
 b=dRcIklXLUEVmtgcqzzIAYswOgXOY5I5YZ+nRpxt5+hlGcnR9BMA5xzpusVMKamElOfxkyIf5E5P9aSm1gmkMFoPv343UfdHfz1ipMcBaMQ6ZEJ3hsmtcgdwKZUbC+aJlgzygwzS4nfT1zApZGV6+OKlcL+UYReRZrIUR0JEasNw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3dfd49ee5ef4d150
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUrWED0eB7lGHi/n2rff2hSrFEqh1ebQpXq8cLmjZkgJ3dvSIS5Csd7NBfkhC9A+Nr2rH8oJlFL5bWWKz1+kTXvLX3+Y5VEeHkhXzUR13i4LmEzKP6s6FMP87YmYiJS7WhAeOeqcfpBtciMIHHeMk8pMGhPCQU2Z9ITtmKCLN3Wi84ucZ2fsplEePJhhGS2B0mVcqvI9h7ELBiPU8+BlRoDzHYw6ZcGXJI6MYu3d+M8gkx9pGWzj3FjAm0cyubagKGfBt93kcLXswbUTdyRMqOh4AwQaTM8JjvuT0Khv042iY2+pJZsgnh9ETL9FwcwvmL+X5/c0gm3yWQkYW7cueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KP7CU8B8G4gafGveW0xNPmjKP4Y1zKjvRG2FNNjnws=;
 b=Q97HToJwOLHS1Aq9J3L0d3C+gNiecqdwreRvDbhnjnEZPg8wy9mK4Bo8uarrpSvToNCIcctJ9tvE1WcMO5ZCPB+Vj7PyyQPVJF1F/louXMrZIgXHMylsLbkfALAzebIzDbJ17GNa12f4G/46hLyTv/XyFTsYMDx5Mn4jNqMNqRUUtDtupbqtNCQx0XjzNNDQV+OdXjYsqxPiTSjHQMXVIbUeeS6jqqXriB2CEaM0c4hhNGTrvi0bogSpofGr25UK59s7OdABFimADcQaCZZk6Y4Ql/7OzFvQb42qGDo0tbVBc+IK5hh8hhRhX2jV1P0R0Z7xNJeVhZw0ltAe/FrLrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KP7CU8B8G4gafGveW0xNPmjKP4Y1zKjvRG2FNNjnws=;
 b=dRcIklXLUEVmtgcqzzIAYswOgXOY5I5YZ+nRpxt5+hlGcnR9BMA5xzpusVMKamElOfxkyIf5E5P9aSm1gmkMFoPv343UfdHfz1ipMcBaMQ6ZEJ3hsmtcgdwKZUbC+aJlgzygwzS4nfT1zApZGV6+OKlcL+UYReRZrIUR0JEasNw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "julien@xen.org"
	<julien@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, Stefano
 Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] docs/misra: add rule 11.9
Thread-Topic: [PATCH] docs/misra: add rule 11.9
Thread-Index: AQHZ8N7F1acUGyfgHkSrRU6Q0Z48aLAuVAMA
Date: Wed, 27 Sep 2023 08:16:22 +0000
Message-ID: <068B9E0E-8EC1-47AC-9D24-64ACD9994013@arm.com>
References: <20230927010538.1778201-1-sstabellini@kernel.org>
In-Reply-To: <20230927010538.1778201-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PA4PR08MB7457:EE_|DBAEUR03FT061:EE_|PAXPR08MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 5194cb1f-1339-475c-6f2a-08dbbf3210ae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 t983vVaIhZSaoGIAN0tYLc2CGPmtTbL54LmgXjXl4fzc5t9a4kmyrspmhgzjC3p0cIX8hN77Vqxee9+YV1JaF2gD3wZzT/cMlIGZpeovo+VQmaug3xw7Ge9U7fpqO7v7sbSwW3pfGSoS56F7wG0lG2gzqmwsk/5fKYgp2MKXAmZp02VVH4J7pGELb8QITqLf1Kx5w5wxC5ncI/XHSOHdEvBS5mfYRYfRaLIhn31Y5vbl9biZlCKjrjVP7V0qtWrqy9iVhdZ5wcgaFGIJ4mXYloMJK2dCB0fEV5GeoGnzdZc3ofcKKEHF6IchHuD8Hn/i/M/FmzIMXTqCX5z2abNwq5Pq5DITilo2uZOozMJfad/zBf10E+U+FVGDX7Dx3DiWTZ48TaJhgPs8fckHAtUMyLQpGDKegQGeI0nHBDcOTZpXb6GPODb8aILqaXFUnRGBLTUEyXKAqzz87AzZQbv5K4XjbQVG2UJFC/BsHKXaBTr2wGIEdrGInpYbU1wke+/Sh4YJGtcw99YujRpw07IBeHe/yKcq7sCvax/tPDpfs+Tx6xDpq6owM9yxwtZ0inTqC+TiLNNepIrwSFgx9B9BtIb26E69AzASTeHtopkOuMefTN6ctpi+68SWH2jSW+2xBGJgNmR0YqBUxOUXCrXM4UyTHXc1Mucs6eDE45qjPSM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(230922051799003)(1800799009)(186009)(451199024)(6506007)(2906002)(6486002)(122000001)(38100700002)(38070700005)(66946007)(91956017)(76116006)(6512007)(66446008)(64756008)(66476007)(66556008)(5660300002)(71200400001)(53546011)(8936002)(54906003)(4326008)(6916009)(478600001)(316002)(8676002)(41300700001)(2616005)(86362001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <72529846210C924AA903C345DF32584A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7457
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5bdeec48-e637-48cb-3f5b-08dbbf32091c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dFrtYcNWLJQZdX5kM0pQXmewkVOJTTGqxcQ+ntm3QOaQAOr52ec9/Qykdt3zwK1VuZQAqjHgmNCAPT1+5DvOdPR12CloyC13inSFZ9ilwXnOg+ifru0IDTRPOQMCKcDWvVyZ5+fPvzJ0dsvaMdfBxS15RKidigRHZ7mB6ACEnhoNoAlnedJrEqUwxqmIHGDZUd4jBIQYU6J2KoulXy18Ghstjoq7kq4tgVOuMhLThxsNqd5cVOw2zhbESy2QB4/Gmde5BjVXtS7P4ET0qcxN0GHJwbhSPY908Q1NKekNan4RtslXtdvc664m6cRXJ/AKMLyNn7VLvh20PPMx5nzkU8q9Sbv4ozc64tb9uv04RQ4lLSexlLUhDUs1NTksctLFdE7vVHxc/wJVLKP1w3IAVT4DIJyOQd9Z1hgrzFL7l0mGxOt/VjO9Q8p8uJ4zW02Fc83FQw205nxIfgKef7xBKelnvAt5N+hZghzE2HAo3l/W9CxMrgqePLJlDdkoZTams1zmZOsffftrMOe5wywqwBhZDS+bwmVJNTZnBqTg9zPhTcZB16C+vFhnU+urpc67Hy/1g1ZndhQa4QMDTQwyZrIEHRSuH87vYq40O1P3aQzyxqnM7rVN2taaBGMsdSElW7D9F8/vSlJAIubTPPoTecLJ5MoOWMhNaI1AysCC9CP2aF4HhQqoVEZEebNjJaG9Xu+7jk96/ZYdMFFfVcriCwXYcKHAEYit/1fDu9gbt1nCFxWo3sbwMG3R80WHF+lvcQul0MIfEddpWzYVFEkItQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799009)(451199024)(82310400011)(186009)(36840700001)(46966006)(40470700004)(6862004)(2616005)(41300700001)(8676002)(4326008)(8936002)(54906003)(36860700001)(316002)(70586007)(70206006)(26005)(336012)(86362001)(2906002)(40460700003)(356005)(6486002)(82740400003)(478600001)(81166007)(47076005)(33656002)(36756003)(6512007)(6506007)(40480700001)(53546011)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 08:16:35.2038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5194cb1f-1339-475c-6f2a-08dbbf3210ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6573

Hi Stefano,

> On 27 Sep 2023, at 03:05, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> Following up from the MISRA C group discussion, add Rule 11.9 to
> docs/misra/rules.rst.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

I agree with Jan on dropping the "integer" word here.

With that done:
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Rule 13.1 also discussed but it is already in docs/misra/rules.rst
> ---
> docs/misra/rules.rst | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 8e7d17d242..28dc3a4d66 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -373,6 +373,11 @@ maintainers if you want to suggest a change.
>      - A cast shall not remove any const or volatile qualification from t=
he type pointed to by a pointer
>      -
>=20
> +   * - `Rule 11.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_11_09.c>`_
> +     - Required
> +     - The macro NULL shall be the only permitted form of integer null p=
ointer constant
> +     -
> +
>    * - `Rule 12.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_12_05.c>`_
>      - Mandatory
>      - The sizeof operator shall not have an operand which is a function
> --=20
> 2.25.1
>=20


