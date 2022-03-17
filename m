Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F0D4DC9D2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 16:25:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291648.495147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUrz6-0000Ef-K4; Thu, 17 Mar 2022 15:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291648.495147; Thu, 17 Mar 2022 15:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUrz6-0000Bj-H1; Thu, 17 Mar 2022 15:24:16 +0000
Received: by outflank-mailman (input) for mailman id 291648;
 Thu, 17 Mar 2022 15:24:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JyXb=T4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nUrz5-0000Bd-HY
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 15:24:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d4b18c2-a606-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 16:24:14 +0100 (CET)
Received: from DB3PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:8::32) by
 PAXPR08MB6863.eurprd08.prod.outlook.com (2603:10a6:102:134::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.15; Thu, 17 Mar 2022 15:24:05 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::e8) by DB3PR08CA0019.outlook.office365.com
 (2603:10a6:8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26 via Frontend
 Transport; Thu, 17 Mar 2022 15:24:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 15:24:05 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Thu, 17 Mar 2022 15:24:05 +0000
Received: from a41a3cc3ed8a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B18CB5FA-1F84-47B8-A699-EE29541491B8.1; 
 Thu, 17 Mar 2022 15:23:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a41a3cc3ed8a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Mar 2022 15:23:58 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by HE1PR08MB2683.eurprd08.prod.outlook.com (2603:10a6:7:2b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Thu, 17 Mar
 2022 15:23:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 15:23:55 +0000
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
X-Inumbo-ID: 4d4b18c2-a606-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arA262akJOhR5cpoO8ioizIXVSnC6SxV5IPxJVVwHuY=;
 b=V6Htoes54KMiJNGLH4OcYuC0O9gZr9bzXSENBfMOYrQDLwWa1gszQlp7ONIt/7nkF4eSUD29+hu5ogB789tuLJm3k4Oc5GS8qwiX3F3Ktd8o71HXXrI7rx4zBlaLT3ZfewFVOL/QuWQsLviK3WovJKNAxdWlc4OX9wy9lE7OVRA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 73a75714ba6a769f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8SLaUzkbyobY3s1j8I4+nSh9xNSi/bexxOgatIULyfmPFIwQimfUNYC6FRBTi+nqDPqfYMTbXm6TpmMC11SjZ0iKdN/3IsscOQ9tGQlibWWGXOVdZoytphBYaYiGXPDbCnSJvcdmL4JbdwtkfsQAkQyh8Rez4htpc5KimC8ZiDFCRf92hqdzlB94MhuWG6tNouJq7QC5B5FM2Baqt5gFH3K19JDkGN4arNcyquBUEyABU0K8viGBE5HV73S0qA58WzS/NOwhxwMNewjHaoAxwlp/U9lAUhgz6P88A/YLOA13EC04uTjlwQsVdpZcx7iV/0O5CMaObcD/Vc25txxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arA262akJOhR5cpoO8ioizIXVSnC6SxV5IPxJVVwHuY=;
 b=ObsB3eYjjn2HaCLBDlNovJcYXYXJlJZsEPBbppR6zyjHy9ksl5tWG6LfFjWJ+WYCoFtdbhGF0+sted9zps5EyuEebHbRqLadoctDnPsSC88JrUH9Sa84BrB+slBvZfB2UxDT0F7AYej24EZE8sxVIYOGmuVKBQ3fvLMYSicx2gyWlgivXUWQ7V9SIh8Oo52fDmH27diFIvcq7zS8ikpjc7vHaDp3LEf/kl4GYncgOnPBqWnfg6qAv2wj3sn1zYh8JqBp3e4wxNGeAuJYduWdd9vfXQo8PY+dIGahVuWkNzB8qrLYaRFhLuVyMr4XlleeSdkck++E4cljJ7JdbETTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arA262akJOhR5cpoO8ioizIXVSnC6SxV5IPxJVVwHuY=;
 b=V6Htoes54KMiJNGLH4OcYuC0O9gZr9bzXSENBfMOYrQDLwWa1gszQlp7ONIt/7nkF4eSUD29+hu5ogB789tuLJm3k4Oc5GS8qwiX3F3Ktd8o71HXXrI7rx4zBlaLT3ZfewFVOL/QuWQsLviK3WovJKNAxdWlc4OX9wy9lE7OVRA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	"marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
	"lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH early-RFC 1/5] xen/arm: Clean-up the memory layout
Thread-Topic: [PATCH early-RFC 1/5] xen/arm: Clean-up the memory layout
Thread-Index: AQHYM6fgzbIssM9RMEi7y17EBtCCCazDvrYA
Date: Thu, 17 Mar 2022 15:23:55 +0000
Message-ID: <0E4A176E-BE1F-427F-8D4E-1AAEA811964C@arm.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-2-julien@xen.org>
In-Reply-To: <20220309112048.17377-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 93585a2e-5ae7-4926-18e9-08da082a2c53
x-ms-traffictypediagnostic:
	HE1PR08MB2683:EE_|DB5EUR03FT048:EE_|PAXPR08MB6863:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6863AAC428FC88AFCC8F068D9D129@PAXPR08MB6863.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Vb+JlL8hlvueNeOMhqJKAmrrcI+Sm1Bp6hFwiMzDcd/nUblLe1hlSIpxgTwJmNC3WskluwkabToJkPk4b3IveAVmXMoN5XtKGR4lqDPAkgo5T5Mr7m8+KoZQ1pVxhOSa26dq1x1F80avyPJDB8iInMjKBeGsoLqBfHurnVH9QfcwRCfuTPdmQlKMovGPyWzAIoTI3TMdDAUOcaC4VCra6Le8X3pty4CeGffolEeLkjUyadC3zrmn2Ei+w07vX+jrrqK51fVb08clUYk6ZYaIATxXiFj9RmCPtGm0aI35pc0c1We5hDDblsxEklfTdKbPCKqC0JtiMGKMySZEfS3DNqc4rvXt+nCinOJAFrzVHy5LI5WXyumO+XoPxPvjgbxqidyRWsbDyfNmJnjqvjp7hx2zAKEODLjq/o7ZEXnBzaG6QzAQuvqZTdp0SB0cIF7u6LkaAiw87p7RIQ/XWt1aCa/DJGL3CVxQhdwaEZNr4B/7gSE3WnWfWz0usbTKjoZ60c/iC1MlLog6TQrVgnWqQjxQJ8cOFlRcL6lyefFolOFqrfdeaQh7ApBY3Kz9+BY2iQDR9SmZgkT6D6J0xkilBHxOTHYB4GrMVKfOkC9pNkFVqK/lnAFI43K8JQnzbOvaOEyHXmk3Z9U5aTQxyY4js8Y0FG/iHBPbFfJdx6PHexoWfNJxe6ttt4+4r6DmNrDjyzAZ8MWHlAW31KJxlU+brpcJgLcBfKbwxRV7heLZLmIydEjIP7I8as08fvdyF50u
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(5660300002)(26005)(83380400001)(316002)(38070700005)(6916009)(2906002)(8936002)(54906003)(122000001)(86362001)(38100700002)(53546011)(33656002)(2616005)(4326008)(6512007)(508600001)(6486002)(76116006)(91956017)(8676002)(36756003)(64756008)(66946007)(66556008)(66446008)(66476007)(6506007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DAD382801B2F6745A34A4BDB54B031D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2683
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b288dcd-b7a1-4a48-1738-08da082a265b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+VQ4RzJHWwmwVBR04EPQZviIc2k8B3bLccoImXb8EbN8L//SffkzZ3LjvtDUxxEm6gSwqoTabIJQgOio7ppsmSp4HWPNfz25/sEbnQncwv0VFvXTEUgum+GLEgDFIqMrte6zN6HIVo/CZu3hz8Knp5aLvxLP0hmxUI/bHk9QtYDbbTudS3aIDZ/MIr476QYXLL1hxqymaI22XPTg0fCEh6dFZ+5O7HttOZK5PO6RREMQQdMYDySy867UGM4975sHQMdjlEqcWBp/NLLN+rf9eh5gjRV5kKM1VfolfG8k/tSmq9KHC/1l8tXwLjEBLcZEncP/j2DlFk4tmbOy8hTnnI7/YQLQedwmh+bMkWHrLICqTDNdejOD8R+xf82YboJhOWPzVVZgkpoOKkAxPi+pbNPj9ar2gbxHDiXTssIWyKSTNBM1tAOwbAlW2PfCc/mUmCY2Hc1sJe1Oh0KCHVSsKnYi8+L8ZEGbpmcBL9KMHnrOpHtHXG0YZEn9x563WFhksm30g19XyXIqKJjSeLGgKexnhhKmX2VLSNTeZr1svffFg1AX1FcV3e8WETJQZlMpywMWOd4ZHczelqMOK1PZ7HarBWf2Pxb7LU1MqQAFzFfTlZ6cd6xgnhHC+hQjtkYwJxVDI4xk/tEjxgKbYvSsKl1gULQ2VEFGLr13G3Z5BOBmFI6E3K1WCwklQmUYC6gd
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(508600001)(40460700003)(6486002)(47076005)(54906003)(36756003)(2616005)(107886003)(8936002)(36860700001)(53546011)(6506007)(8676002)(4326008)(6862004)(70206006)(70586007)(83380400001)(316002)(186003)(86362001)(26005)(82310400004)(2906002)(5660300002)(81166007)(356005)(6512007)(33656002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 15:24:05.1568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93585a2e-5ae7-4926-18e9-08da082a2c53
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6863

Hi Julien,

> On 9 Mar 2022, at 11:20, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> In a follow-up patch, the base address for the common mappings will
> vary between arm32 and arm64. To avoid any duplication, define
> every mapping in the common region from the previous one.
>=20
> Take the opportunity to add mising *_SIZE for some mappings.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Changes looks ok to me so:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Only one question after.

>=20
> ---
>=20
> After the next patch, the term "common" will sound strange because
> the base address is different. Any better suggestion?

MAPPING_VIRT_START ?

Or space maybe..

> ---
> xen/arch/arm/include/asm/config.h | 24 +++++++++++++++++-------
> 1 file changed, 17 insertions(+), 7 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm=
/config.h
> index aedb586c8d27..5db28a8dbd56 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -107,16 +107,26 @@
>  *  Unused
>  */
>=20
> -#define XEN_VIRT_START         _AT(vaddr_t,0x00200000)
> -#define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE=
)
> +#define COMMON_VIRT_START       _AT(vaddr_t, 0)
>=20
> -#define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
> -#define BOOT_FDT_SLOT_SIZE     MB(4)
> -#define BOOT_FDT_VIRT_END      (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SIZE=
)
> +#define XEN_VIRT_START          (COMMON_VIRT_START + MB(2))
> +#define XEN_SLOT_SIZE           MB(2)

I know this is not modified by your patch, but any idea why SLOT is used he=
re ?
XEN_VIRT_SIZE would sound a bit more logic.

Cheers
Bertrand



