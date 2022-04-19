Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB420506780
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 11:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307905.523283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjvj-0001pV-Oc; Tue, 19 Apr 2022 09:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307905.523283; Tue, 19 Apr 2022 09:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjvj-0001mo-Lg; Tue, 19 Apr 2022 09:13:51 +0000
Received: by outflank-mailman (input) for mailman id 307905;
 Tue, 19 Apr 2022 09:13:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZjr=U5=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1ngjvi-0001mi-UE
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 09:13:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05f38f43-bfc1-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 11:13:49 +0200 (CEST)
Received: from AS9PR06CA0201.eurprd06.prod.outlook.com (2603:10a6:20b:45d::19)
 by AM0PR08MB3873.eurprd08.prod.outlook.com (2603:10a6:208:10c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:13:47 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::26) by AS9PR06CA0201.outlook.office365.com
 (2603:10a6:20b:45d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Tue, 19 Apr 2022 09:13:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Tue, 19 Apr 2022 09:13:46 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Tue, 19 Apr 2022 09:13:46 +0000
Received: from 671e97d1e186.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6BF9EF64-D2DA-4ABB-9310-DBC4F3014161.1; 
 Tue, 19 Apr 2022 09:13:37 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 671e97d1e186.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Apr 2022 09:13:37 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com (2603:10a6:803:3d::28)
 by DB6PR0802MB2245.eurprd08.prod.outlook.com (2603:10a6:4:84::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:13:32 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::f42e:ad87:44e:2f67]) by VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::f42e:ad87:44e:2f67%7]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 09:13:32 +0000
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
X-Inumbo-ID: 05f38f43-bfc1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9P+xp+IcnKE4O658EWQd+dMh+/cBd1SJHXG0Om9Rng=;
 b=1+KZK4UEm6xGpoylIctfI1Ikn3406mhjMWvyvCcpjY83ulace1YQkDhO+C2w9zuF0t1LjRVJL5q9liqB+YrVZkl78eMO3aRQWwCW5LXuz1wRI1QuMn+LxFKJytlx7eelWmKDZeZO5ygX/tUbD5WHS0S0ytOlV1+xPSLM3ZMIfK4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbUxTDmFIe0x8POLehPbH6k2e2gsvnSsvAn2WBFnyWK85Fbu5c/DNoz7x0J4lUiUnEPiHLwMsRdUVHfrRLTiWvYp/LfeZgasc2+Z5wMRe2ziZQsdvPnuvufo6DiuxiZ0wXbZecLV9wfqMEIKDMBmGgp9UtSG+0TAN/ewK5tBAsc6fzRMsw03aUbiX442sBAFo5MNg3/QenktovPzCSyWZq1j+taDLWPXETyyqUWYtzrtdClN4TQN0oUZbiN24zlaQYtz7P5KUbWqySx+2ZoByIzzFvKRXFidf87rWIFoWYWBDzbaxU5dDSlzHcR/Pyjxj0D34bTBuNzmSYftQ+svcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9P+xp+IcnKE4O658EWQd+dMh+/cBd1SJHXG0Om9Rng=;
 b=Pjh1Ld9hOp1gj14kPlW6hwY1nHsB926m5QnJX9hKeUt4npTyLK8oSOqY8LhEZ5vD5cXWYqs+MgP6XBEQo+S+GjcyEMVM+2JkQKjBql9RvgxzartUj39Nle2wtG7QAQgfFzvEzb6RbYWIBrj04zcNQU+9aS5Ix6IaXleMJrvp9RKrm+SgsV/efeuo1a8BL8ddZyiP81YhEq4SdOxj7+t9mcaCEBq7fIdCkB9eVY9aICuUk8hsy/1scaxFlt5GhAnjQAJjzsdrBTV8onZcHjtEyA18RHmUEB18aJPCdnE8A+KIexvd+vMMX/zV5yYhb2zTrbVibFqwLiSl6x0lwT2Vnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9P+xp+IcnKE4O658EWQd+dMh+/cBd1SJHXG0Om9Rng=;
 b=1+KZK4UEm6xGpoylIctfI1Ikn3406mhjMWvyvCcpjY83ulace1YQkDhO+C2w9zuF0t1LjRVJL5q9liqB+YrVZkl78eMO3aRQWwCW5LXuz1wRI1QuMn+LxFKJytlx7eelWmKDZeZO5ygX/tUbD5WHS0S0ytOlV1+xPSLM3ZMIfK4=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, "--to=xen-devel@lists.xenproject.org"
	<--to=xen-devel@lists.xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: RE: [PATCH v2 01/10] xen/arm: Print a 64-bit number in hex from early
 uart
Thread-Topic: [PATCH v2 01/10] xen/arm: Print a 64-bit number in hex from
 early uart
Thread-Index: AQHYUwQRz8pnnvd0IkKIsXaKM40+fqz28iGQ
Date: Tue, 19 Apr 2022 09:13:31 +0000
Message-ID:
 <VI1PR08MB3056693E070014DD4F7A885F92F29@VI1PR08MB3056.eurprd08.prod.outlook.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-2-wei.chen@arm.com>
In-Reply-To: <20220418090735.3940393-2-wei.chen@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8A9593940DA0BB4CA83875AD015D3D4E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 13823f55-6270-448b-9157-08da21e4e8c9
x-ms-traffictypediagnostic:
	DB6PR0802MB2245:EE_|VE1EUR03FT033:EE_|AM0PR08MB3873:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3873095491508844082F319592F29@AM0PR08MB3873.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ubrMRwEHlc8s7SaF8ZMkcyvZOEMXtvCKujZNKKLGgOtJOJAdtHiNGIwYpSF73p6LrNQu3vUVgKnr9tNVbyAWhdfRIxY27q02VLiU0IN1L42XFKQkGpWiF/KpQzZmjvX5Od2k3XZKAtAtoqBKbjMuH9o732uFTE2oblA+S9u+7DNDJW+ksBmHOFduHGe8AwOn48is8hoMy96hrRJrXfWr5VXtX+9XJggGA8jXKtwOPNpSWxW8ijXSlEBOlmCZJY3Z//hg7QYcQ1dpFTELdeCo4FFuNPaigxLnbK3W9OW+hGYr+wLYgSL/t0BpBsHRkCzHQUxmetUMzyC0KmHvkbuISyh+sNoZjZ0rFgUhsw/w4/5BTXGeEE1dKF9ldRf64b6FAZacoqiUwTv1rqhzPxuO0aPqPrqFL5A5s3oGcV6/WtmMdmf3X9Bqc8xSDiIejbGkkJp2B5EBoPl2nGcqmvAngvn40mXxOiTQvurZAM5uBxqaGnaLkYwUNr8WplHjtThbBFaSH8Scw5ec/ElSDHiSMkAsC122i3NI7YEKpgVKJv8SbQ4QyNbNeC5iyohLwiU+ZGvJ3kZiZe6uUHOB849IV6FNIa1EmYgDUTqbkngWvHAkSTzMZ56f7FXVhii6c84My9A/wghaslTui1wyih6fZm6Z2CbQI9j5aPFbNUPxRZN60gTU/dSHBttVjSj/otfjdVBbtnT3UAOCyQ/HHNwMSA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3056.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(33656002)(9686003)(7696005)(83380400001)(8936002)(52536014)(5660300002)(71200400001)(2906002)(53546011)(86362001)(122000001)(6506007)(38070700005)(316002)(508600001)(186003)(38100700002)(26005)(8676002)(110136005)(64756008)(66446008)(66476007)(76116006)(66946007)(66556008)(54906003)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2245
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e52551f7-1997-416e-927f-08da21e4e010
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gbklwiZuw8gXGXrb8yU0hnzfrWrlSZwuSnp79SonSD+gaR/c+p3shQdxwttTEuzyh1WapZW+qb1+iT4a6dBZVPEz9hNJtZZU5durZU4ZN7p18ZtSkrYs3O5EnnMiupcopTnb/eQAy7ZzYo/0PljUGmGD0ikvcGjZjhKpMPkXyWjQvgDzEgbnpIhxfxI4Zd/J14E2+e3PgW1nKJdR62vCNJm3FhPPglvkxOGo69Y61VRruQBzP+Ep2JeY+e7BnZtJ5S3xgoROUuXmzAY8w+3f38mJ0HGSS5eVKMsl6UjJvOgwPBu0ANREXOHwzeZT4lBd6LX1dJ2lOT39mSFXakMw7Z/MzTDE7qZTHarRes/rz1gVjxxF5MHthV4wPKUJwHYDnBCLVy8oCei/7B6Pn06bSiBSDxl3jhgWtTfUd2scoCelNz66IgLA5yHEkBrdjWVXqmS3hHR7HF5p+DTttp+F7QP09mt8r8yNpkpmdLONd/I6DsiACJHz0bAUtBHWbXOPsaxWNFBzzrvAzLyibKWCRZs3ZuUb6822uCrqD7Yg4aZ7R65XLREKTRdlSK1OwBQtkECdyRhROPjbBnCcCV1n4QhAdwR2dMI4wpfkQQBW1LA98tzS7dMgvcdx/U9tTqNHt7DHsGTID/Vg+klq0Ek0CQKJM1afL7HRRyHh9okQb9iaNSGc2U7SYBUVZjoUygUQ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(81166007)(52536014)(83380400001)(26005)(47076005)(5660300002)(54906003)(6506007)(508600001)(36860700001)(2906002)(9686003)(7696005)(53546011)(107886003)(186003)(336012)(356005)(316002)(4326008)(8676002)(70586007)(70206006)(450100002)(33656002)(55016003)(86362001)(82310400005)(40460700003)(8936002)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 09:13:46.6568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13823f55-6270-448b-9157-08da21e4e8c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3873

Hi Wei,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Wei Chen
> Sent: 2022=1B$BG/=1B(B4=1B$B7n=1B(B18=1B$BF|=1B(B 17:07
> To: --to=3Dxen-devel@lists.xenproject.org; xen-devel@lists.xenproject.org
> Cc: nd <nd@arm.com>; Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>; Julien Grall <jgrall@amazon.com>
> Subject: [PATCH v2 01/10] xen/arm: Print a 64-bit number in hex from earl=
y
> uart
>=20
> Current putn function that is using for early print
> only can print low 32-bit of AArch64 register. This
> will lose some important messages while debugging
> with early console. For example:
> (XEN) Bringing up CPU5
> - CPU 0000000100000100 booting -
> Will be truncated to
> (XEN) Bringing up CPU5
> - CPU 00000100 booting -
>=20
> In this patch, we increased the print loops and shift
> bits to make putn print 64-bit number.
>=20
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/arm64/head.S | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index e62c48ec1c..2bb7906f69 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -866,17 +866,19 @@ puts:
>          ret
>  ENDPROC(puts)
>=20
> -/* Print a 32-bit number in hex.  Specific to the PL011 UART.
> +/*
> + * Print a 64-bit number in hex.
>   * x0: Number to print.
>   * x23: Early UART base address
> - * Clobbers x0-x3 */
> + * Clobbers x0-x3
> + */
>  putn:
>          adr   x1, hex
> -        mov   x3, #8
> +        mov   x3, #16
>  1:
>          early_uart_ready x23, 2
> -        and   x2, x0, #0xf0000000    /* Mask off the top nybble */
> -        lsr   x2, x2, #28
> +        and   x2, x0, #(0xf<<60)     /* Mask off the top nybble */
> +        lsr   x2, x2, #60
>          ldrb  w2, [x1, x2]           /* Convert to a char */
>          early_uart_transmit x23, w2
>          lsl   x0, x0, #4             /* Roll it through one nybble at a =
time */
> --
> 2.25.1
>=20

I have tested the whole patch series on Armv8A(config without NUMA) and X86=
(config with NUMA), both can enter Dom0 successfully and the X86 NUMA works=
 normally.

Tested-by: Jiamei Xie <jiamei.xie@arm.com>=20

Regards,
Jiamei Xie

