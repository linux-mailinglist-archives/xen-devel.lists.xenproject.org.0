Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88885719970
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 12:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542365.846135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fPi-0004OJ-DD; Thu, 01 Jun 2023 10:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542365.846135; Thu, 01 Jun 2023 10:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fPi-0004Lh-9E; Thu, 01 Jun 2023 10:20:14 +0000
Received: by outflank-mailman (input) for mailman id 542365;
 Thu, 01 Jun 2023 10:20:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mtZ5=BV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q4fPg-0004LZ-IL
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 10:20:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e344bdc8-0065-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 12:20:10 +0200 (CEST)
Received: from AS9PR0301CA0042.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::10) by AS8PR08MB6663.eurprd08.prod.outlook.com
 (2603:10a6:20b:39b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 10:20:07 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::7b) by AS9PR0301CA0042.outlook.office365.com
 (2603:10a6:20b:469::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22 via Frontend
 Transport; Thu, 1 Jun 2023 10:20:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.23 via Frontend Transport; Thu, 1 Jun 2023 10:20:06 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Thu, 01 Jun 2023 10:20:05 +0000
Received: from 1442fab48683.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2DF7E1DB-AB0B-48BB-8D91-AD1095B941EE.1; 
 Thu, 01 Jun 2023 10:19:58 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1442fab48683.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Jun 2023 10:19:58 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB8485.eurprd08.prod.outlook.com (2603:10a6:150:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 10:19:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 10:19:56 +0000
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
X-Inumbo-ID: e344bdc8-0065-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDSXjp4bSx13miiCTd8tWiHg6I++lq19hJ5GR3XBnQw=;
 b=viLR2kEQfQS3zdED/WUoCYeTB7ZLqOg0+l35gsQxf4L4cxu/AqgOvC6PUuLxQsjF2l/188ccF/2kS0hVc2n5Jydc3SBXQbsfY8UTHMPAmbPAQdYmVGa+kYToI04mn9feL2dhsRIjGQif/rMqDjgECXu2IAOyG2RJhe7tc/XMsyU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 058d1f80af9b0023
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXH0Ye/WY5bcJ8dlTSAL4YuhghqGS71V5/saXJ/gfGD5+7Kxpufxm2ycKL4m77clSQ1GhyF56Y097FxkzbqWobJQGBoUgC5uQt3juTSUcGfwNSPvBRAY51UyLknJpfeE/WyX1VlM59v2Qfs2nOwX80WhIvPontZd+d7aZ6QNEKtqko0lXXRoVsL/xcP83YVdCyzAOLNHhxImMccr9goltnMjtqnSUQUVvAu2bkOeyprSN05R4jrNUf2nFKyc0nZ9AkgszU/oWYGzQUyFkVuVYoLKAfdi2JtOZLXwBOKaV+8PKh2gq9+5lHq73DGkZYRn4O67Y1Pbkl6N0JMBZl03Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDSXjp4bSx13miiCTd8tWiHg6I++lq19hJ5GR3XBnQw=;
 b=l0xt3uKTrGzy8136nUcFWPoyfb9OiNnwSUifyy98WYkCwW77jw+zePfSAulSz5ruarghaNrW0ddcfiuTnCyc0ADP45H8HAP2cMWGdc5lCIDmv/b4s0/3Y6XvU5XQWQQo5yZzG8ZyVCKVAQrcQt8RJyx5mZ1H0h9nrxjdXBfYWsXAke1g8+RY+v/ieJS0ks21pWkO7ov2jiAfE1m2zTsXciGu/YtSs19ADhUsjNLE+xfYnq05/JO4GQhHA6bNCS5BpzyWG0+VI6pjZuhLWjDSKh/lj836H7gk97cwVfH+G02ssMnXtIdAQcEgVlOg1PAN276lN3aNn81sHgp6o7exvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDSXjp4bSx13miiCTd8tWiHg6I++lq19hJ5GR3XBnQw=;
 b=viLR2kEQfQS3zdED/WUoCYeTB7ZLqOg0+l35gsQxf4L4cxu/AqgOvC6PUuLxQsjF2l/188ccF/2kS0hVc2n5Jydc3SBXQbsfY8UTHMPAmbPAQdYmVGa+kYToI04mn9feL2dhsRIjGQif/rMqDjgECXu2IAOyG2RJhe7tc/XMsyU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: debug-pl011: Use 32-bit accessors for broader
 compatibility
Thread-Topic: [PATCH] xen/arm: debug-pl011: Use 32-bit accessors for broader
 compatibility
Thread-Index: AQHZlGYjy4NMkXD17k+UGeM9r1SDJq91vGMA
Date: Thu, 1 Jun 2023 10:19:56 +0000
Message-ID: <7C760D1D-DAAE-48AC-8B2B-E6140452BE4A@arm.com>
References: <20230601085001.1782-1-michal.orzel@amd.com>
In-Reply-To: <20230601085001.1782-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV2PR08MB8485:EE_|AM7EUR03FT028:EE_|AS8PR08MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 75fda120-f99b-4532-0836-08db6289c542
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sQ0v/Zy8GRMOSTDahXRrixkNcE7j9B3/feDOzomUs9cQKK6mwvdHCJXD+WqbqP8sOE3RsrWVqH9k1kQUL77iKsGbvF4g4cn8jR2C+Te8f6kol3PAAx29Q7q1Qb3vYluiyVfkwCh6By9p58nz4Ox0NLTVSpbl4F2ySGrvQOXHtNcCKVjAIGsdnTwXfwVZlA45OA3edDgjTxzkp1JFrouxnlmY1TM91Ju9NVpJq/cI9j860i/wv39SZbxvuyhWMtWLjratQaMhNKJGjIwHdPvKG2uRFMxgIFHK1r/qWNYrg6xCNhxZPR09reHFXKp4N6dRtw54l4KWX+by0OxvXXFArZLR44laTmRfdNcBhCF7/d+CuWJCnODtbKXQBlSTewpO2Pr4r2LMv09woHef5YG90ydiFPNnhxH+EZBD17YOtvGVaZK4gcZk3irgtSthY1FXAeBeNyq7MivERo+y/h3mEjEHqy0kroc0hFLNVII9veEtCM5WI/Z2cv6eD5XrFQNJhj3xCZnRVRHrbfsKt66i5OBIEiFIFjfnYBsILfiDDYroV5xTWpfj7+cyekcRFv0NsdB40cht7HpM78zylp2gtwb0cuDHv1Ro37kjHofOIlZzoVj0IXrtTLsQYlQlX5Zc9M8ibqDN0Nm1mR44WWXe9w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(66556008)(5660300002)(91956017)(66946007)(41300700001)(66476007)(66446008)(64756008)(76116006)(8936002)(8676002)(54906003)(478600001)(6506007)(186003)(6512007)(6486002)(316002)(6916009)(4326008)(71200400001)(53546011)(26005)(2616005)(2906002)(83380400001)(122000001)(38070700005)(86362001)(33656002)(38100700002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <41455013364BF945B1BF490B731F9781@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8485
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	02ff0a11-6e73-4321-4c91-08db6289bf42
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IrfjBLWmrzAIcn7Gv3s8LcuAgKqJED0gWj+5Ik6xKeLYHxciO5gjI/rJ1tfblzp4qE+NPwYNJb7VdFIfdpoNE8Qq/ajHQZqkVCDUAiTmfzusnrHNEKerDt7nfBVvZHe7xcyiuB9w9pWOHHflsXN8gHi3vBBpCghpYwNT9xlhqaZJ0zfIy7bWR8CGiDG0e3Bk1ab+S8pDQiYv49yX3gdyJIQMOrzd97YSvc5iyyLm2/FFmpszQd+1LJLRZV3yJGdobipulhdJ1Am31ONIkiWosROCjS4JPDmF4VRuAFvHpSZiy3cwONRb2XA3Vpl7mP20hTjYTCZCmYWHQHVgEwL19/gKYxYL+g1siDoQL7aHaEFDiGW8zS7A9R4CbVta/894ItJwblbe//6Qy9u87DbwNXyM5FyKCtHFK2o1THILjzI9oNHT/Tz8A8XqrYo/GLr6SRtjZqeiSwASv2nOd2l+RYwyob3N6NYIw8FMzXrQxZp6y5zwKkpSGZ8+TvRa3aMVZ4fzLMpkJ100veLhGy40ugxm5ZYKWFaA16SGds9FIAa7NbforsJIsdAhQ9TESNRARZ/J6yIjPesgGKUph//WHYgcwEBhJfA0qLRyZPImlbGP9Zud5O47sTRNsf7x91oh32joflB+4wAP+anbuJLlR42YP//1f7gnOUiNNwqQJ/jbAFSY9ZRGJUT7+IM+vRHaJO8avM/5FJZBGSNSb9JVhsPjWluWS2vsYH+rLWpqCN2MzNWkWNnMRnqf0QvrIah4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(107886003)(6486002)(47076005)(36860700001)(83380400001)(2616005)(336012)(82310400005)(36756003)(356005)(86362001)(81166007)(53546011)(6506007)(6512007)(33656002)(82740400003)(26005)(186003)(40480700001)(70206006)(70586007)(2906002)(4326008)(54906003)(6862004)(8936002)(8676002)(5660300002)(41300700001)(478600001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 10:20:06.1912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75fda120-f99b-4532-0836-08db6289c542
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6663

Hi Michal,

> On 1 Jun 2023, at 10:50, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> There are implementations of the PL011 that can only handle 32-bit
> accesses (i.e. no 16-bit or 8-bit), usually advertised by 'reg-io-width'
> dt property set to 4. On such UARTs, the current early printk code for
> arm64 does not work. To fix this issue, make all the accesses to be 32-bi=
t
> by using ldr, str without a size field. This makes it possible to use
> early printk on such platforms, while all the other implementations shoul=
d
> generally cope with 32-bit accesses. In case they do not, they would
> already fail as we explicitly use writel/readl in the runtime driver to
> maintain broader compatibility and to be SBSAv2 compliant. Therefore, thi=
s
> change makes the runtime/early handling consistent (also it matches the
> arm32 debug-pl011 code).
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> xen/arch/arm/arm64/debug-pl011.inc | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debu=
g-pl011.inc
> index 6d60e78c8ba3..80eb8fdc1ec7 100644
> --- a/xen/arch/arm/arm64/debug-pl011.inc
> +++ b/xen/arch/arm/arm64/debug-pl011.inc
> @@ -25,9 +25,9 @@
>  */
> .macro early_uart_init xb, c
>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
> -        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fracti=
on) */
> +        str   w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fracti=
on) */
>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
> -        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor intege=
r) */
> +        str   w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor intege=
r) */
>         mov   x\c, #WLEN_8           /* 8n1 */
>         str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
>         ldr   x\c, =3D(RXE | TXE | UARTEN)
> @@ -41,7 +41,7 @@
>  */
> .macro early_uart_ready xb, c
> 1:
> -        ldrh  w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
> +        ldr   w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
>         tst   w\c, #BUSY             /* Check BUSY bit */
>         b.ne  1b                     /* Wait for the UART to be ready */
> .endm
> @@ -52,7 +52,7 @@
>  * wt: register which contains the character to transmit
>  */
> .macro early_uart_transmit xb, wt
> -        strb  \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
> +        str   \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */

Is it really ok to drop the 8bit access here ?

Regards
Bertrand

> .endm
>=20
> /*
> --=20
> 2.25.1
>=20


