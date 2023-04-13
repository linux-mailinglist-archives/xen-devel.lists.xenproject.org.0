Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABF66E0C62
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 13:25:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520642.808450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmv4M-0006xW-G4; Thu, 13 Apr 2023 11:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520642.808450; Thu, 13 Apr 2023 11:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmv4M-0006vQ-CZ; Thu, 13 Apr 2023 11:24:50 +0000
Received: by outflank-mailman (input) for mailman id 520642;
 Thu, 13 Apr 2023 11:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmv4L-0006vK-Nh
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 11:24:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc1b33f7-d9ed-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 13:24:47 +0200 (CEST)
Received: from DUZPR01CA0032.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::11) by AM7PR08MB5480.eurprd08.prod.outlook.com
 (2603:10a6:20b:de::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 11:24:33 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:468:cafe::1b) by DUZPR01CA0032.outlook.office365.com
 (2603:10a6:10:468::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30 via Frontend
 Transport; Thu, 13 Apr 2023 11:24:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.31 via Frontend Transport; Thu, 13 Apr 2023 11:24:32 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Thu, 13 Apr 2023 11:24:32 +0000
Received: from 80e7a1cdee1c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F1F9C4C4-5C27-4C9C-8F01-058FA06429BE.1; 
 Thu, 13 Apr 2023 11:24:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 80e7a1cdee1c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 11:24:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB6641.eurprd08.prod.outlook.com (2603:10a6:20b:306::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 11:24:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 11:24:24 +0000
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
X-Inumbo-ID: cc1b33f7-d9ed-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5k82IwOeVZsMCaZrdotkzys+/bc2SQkXVVA1MVPmjuM=;
 b=wGf5d89sfvHgJlnh3gZNsXPo2fQJ+L6az8CGWbawMjSqzPn5Lfh54W6R2Z+d1Rr6JgR4Iu05vR6LnXavHSxzrnDkJ8iSwNLGL2XpW/J4Fc2aUGwh2JGOiemEx/bCEQil0IDX/irFueicOne24tebl6D/7V56PXefidBx6W3h53k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GK4LcPAhxphz0DN+iuE5iGG5iVxOj5D3RPaWqFDnhvqI3XJqwwDOYqi5bC7i5cejhaqYL8wXihIPteWaS8TH5uxXFzTp3tbg/iukAfsFBGFMsXoUrtoASD/UpAZZ1h48Pv/ZTAKv7mt0kvvlWsLbFeZ6JfVkUj5PD2ksbR81TJ6+dg6Lta1Rn/DuS0B4/m/G1N8pq1lVQRuiY8Jkg/Zbg8CLfqSFa3bORacjNtbyO6f0cxrlV46ZY4EP/F9ygmt4L+9H/Dfs5hbF6enULm9lJW5r6ETsIjdG8ju4PHwDs47/yaAjr/pQSoT/1TJDPCgPrh2mPL2cczo9U3hcjeMXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5k82IwOeVZsMCaZrdotkzys+/bc2SQkXVVA1MVPmjuM=;
 b=LqCC5OneCzWqr2UtZgfVQ72q8u/tVvgFoGrvp6TNJnNZkL8O1lofuTI66hclGu0wGUkOE/7n/QVkFbqEDXcFyZIS2SZ7RDwtAloufd/57kIle7y95e3ryCCeztM6OIjM3S+1Ps6lzyIn/0pxPWipMpb4LffqN48BrGQ9tDuI9FfIChzU1kNdAKWpfnTgzd9SWiNHUOvlmOiWaZpggofYDOfHsqs734fBE5XfT467ImGRaMdw+dow5HdnHQdHJotcmyHKypevt1k9yk/QS1AqT9U6ogDv8XKNZ2MhHNfePbjjt6GUEB90X7FPF5X9zjdU60+l8HLzT3MOfFAPdwSFkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5k82IwOeVZsMCaZrdotkzys+/bc2SQkXVVA1MVPmjuM=;
 b=wGf5d89sfvHgJlnh3gZNsXPo2fQJ+L6az8CGWbawMjSqzPn5Lfh54W6R2Z+d1Rr6JgR4Iu05vR6LnXavHSxzrnDkJ8iSwNLGL2XpW/J4Fc2aUGwh2JGOiemEx/bCEQil0IDX/irFueicOne24tebl6D/7V56PXefidBx6W3h53k=
From: Henry Wang <Henry.Wang@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN PATCH v8 21/22] xen/arm: ffa: list current limitations
Thread-Topic: [XEN PATCH v8 21/22] xen/arm: ffa: list current limitations
Thread-Index: AQHZbdf3MKIAKwiaG0CPrYU6IaiuNK8pGDOg
Date: Thu, 13 Apr 2023 11:24:24 +0000
Message-ID:
 <AS8PR08MB79914AB812D7BC35ACBC80E692989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-22-jens.wiklander@linaro.org>
In-Reply-To: <20230413071424.3273490-22-jens.wiklander@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0D6EEA0095F4834E8EDFE70681FBFCAD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB6641:EE_|DBAEUR03FT023:EE_|AM7PR08MB5480:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b3cb212-52bb-44cb-bf11-08db3c11a779
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WpTbuMSBIIamfo14OOL35PhS5nph+9NHkUUZYp36iXGoNW5YjpdQQV6Qip/RISA6aHslthaL/DMp593zvneGTjEapHa64N0BZApA5E0ITIBzNxeYfB+wWt7XOc8MsX2SqeIgLzHAa2Bw6efPXWslAYEoFDoJKPGXf5jySh4lXJ1dtWdB6PQfX0dgcAG+w8iR69AcZcfSTllrSZDZ9RN+oYMBZjAaGKtglzsx/YlJp50wD+/txKOeO1Vj2FwXGDDJ0ayNIDCdI4sabCM784tBDcSUBhGXasm7uFWQvCLUV3qtg1UcVVR7/kWrUs93tn0UTX4WSnBCbcpXgb2ja9vbBobWVvVs0NY8/1cRY48UAlvcTgfcHltFYM48BBQRdEIyHhipdViAu5e8uA96dDlGfdMYaUGWeCajjch/i/7X3sJhE3mEAhIC0y+nEBGFiG9z+6pHbUdS6QG5VZDQd48RBbiTuC2EKiC83uGpRsLpgTKO8mJRnPN4Jluc8TTZ26iHGxz9hw/z0QDMMesgxDvtEF9ceZyPSur2/YRJFi6IwQhEgEaZQ0kfRABcQ2gM2IIydnp6K/GxMCfNvNp5qJh++MtzSejn8EbuXzH7yicicuk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(9686003)(26005)(6506007)(186003)(2906002)(83380400001)(64756008)(8676002)(66446008)(4326008)(66476007)(66556008)(76116006)(66946007)(71200400001)(41300700001)(54906003)(110136005)(316002)(478600001)(5660300002)(7696005)(8936002)(966005)(52536014)(55016003)(38100700002)(122000001)(38070700005)(86362001)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6641
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ba5d430-0da1-4f6e-515f-08db3c11a293
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	idgqJOQ8S6/nay58TObFZaq/f7/kGeeJjmjg1FiXRRU11KVppHog3cNdbyySPkWQ8+x6vAdhiCcnBbzNbQ6m2A446qfRHddFhPI3xq55ijjBMLkrcggMQ/WXn3WeQzO0NB6zXp7iPRWZU1fTlkyOPZ+hvvJzkGiMXc4wbCsqCFBE1gbuaaQZ8YcNTSbZ2+W2oKiQxzsyqF14fi2C2Y1tbnQ8ASt4tI4IzHl9WoTBnu32U0bGVxSS6Mnnu04JO2dYMEpl6FfRUSdhLZuGZmjb6z24dOCaIRhVjHZ/ZER3sWWV8Q22EqIqF38M77wplr5yElQZWMz02FSlDP7IEZbT4x9gdex2J/NWprdrZUCENV8Ql4+BiJ4PXFsu7RjpzZngI/R1jwMoAqmREF4+8mA0GAAPNA6o2Y9yb+Mbfr0Hm84uFn0SP9NqN+HeHss3RKte7vu9LnUzh4VMxp5/5uv1Y6Q8ZS4LassPrF/5IuZpvnOqKoUk2Nm57LNHAlG2vrh1U/riUz2arr/UOIGYBpKuJ/ckYQjN/Yj6oLFh+isq1BTmkwo47m9wjGX5r/AkGlPNLwilFaxqRwL7qV09/9Ld6q3D/ltTSIZ0AmhawMmmhjHHim410eFJZopjlabanRGkeuteAklolsu+TbUF6VT8MUDLsvQM6RgnpyvSHLuHv747tifhq1IZop9ngrKrZMQF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39850400004)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(36860700001)(70586007)(47076005)(83380400001)(70206006)(6506007)(4326008)(966005)(26005)(54906003)(7696005)(478600001)(110136005)(186003)(9686003)(52536014)(2906002)(40460700003)(33656002)(5660300002)(316002)(81166007)(356005)(82310400005)(336012)(82740400003)(41300700001)(55016003)(8936002)(86362001)(8676002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 11:24:32.4785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3cb212-52bb-44cb-bf11-08db3c11a779
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5480

Hi Jens,

> -----Original Message-----
> Subject: [XEN PATCH v8 21/22] xen/arm: ffa: list current limitations
>=20
> Adds a comments with a list of unsupported FF-A interfaces and

Typo: s/a comments/comments/

> limitations in the implemented FF-A interfaces.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  xen/arch/arm/tee/ffa.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 0948cc636871..6424c222c885 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -13,6 +13,38 @@
>   *                https://developer.arm.com/documentation/den0077/e
>   * TEEC-1.0C: TEE Client API Specification version 1.0c available at
>   *            https://globalplatform.org/specs-library/tee-client-api-sp=
ecification/
> + *
> + * Notes on the the current implementstion.

Typo: s/implementstion/implementation/

> + *
> + * Unsupported FF-A interfaces:
> + * o FFA_MSG_POLL and FFA_MSG_SEND - deprecated in FF-A-1.1-REL0
> + * o FFA_MEM_RETRIEVE_* - Used when sharing memory from an SP to a
> VM
> + * o FFA_MEM_DONATE_* and FFA_MEM_LEND_* - Used when tranferring
> ownership
> + *   or access of a memory readion

Typo "readion"? Maybe I am wrong but I cannot find this word in the spec.

With above typos corrected:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

