Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE62A4EFF32
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 08:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297744.507257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naXQZ-000725-3c; Sat, 02 Apr 2022 06:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297744.507257; Sat, 02 Apr 2022 06:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naXQY-0006wo-Uw; Sat, 02 Apr 2022 06:40:02 +0000
Received: by outflank-mailman (input) for mailman id 297744;
 Sat, 02 Apr 2022 06:40:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEN3=UM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1naXQX-0006n4-0B
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 06:40:01 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b64b3d87-b24f-11ec-8fbc-03012f2f19d4;
 Sat, 02 Apr 2022 08:39:57 +0200 (CEST)
Received: from AS9PR06CA0146.eurprd06.prod.outlook.com (2603:10a6:20b:467::9)
 by AM6PR08MB3942.eurprd08.prod.outlook.com (2603:10a6:20b:ae::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Sat, 2 Apr
 2022 06:39:55 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::5b) by AS9PR06CA0146.outlook.office365.com
 (2603:10a6:20b:467::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30 via Frontend
 Transport; Sat, 2 Apr 2022 06:39:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Sat, 2 Apr 2022 06:39:54 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Sat, 02 Apr 2022 06:39:54 +0000
Received: from af56df743dcb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 38C47B39-3475-4C1B-92CA-2DEDB70C998F.1; 
 Sat, 02 Apr 2022 06:39:46 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id af56df743dcb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 02 Apr 2022 06:39:46 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by DBBPR08MB4473.eurprd08.prod.outlook.com (2603:10a6:10:ce::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Sat, 2 Apr
 2022 06:39:41 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::8cab:4b29:9cb1:580a]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::8cab:4b29:9cb1:580a%5]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 06:39:39 +0000
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
X-Inumbo-ID: b64b3d87-b24f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioNWpQyJnQj08KuQE8KF/JjPJM/jDM10BkTaqpaGsWE=;
 b=PXIwCcKK/5UvwL89URJoN7KIoa7zRzOXxT+yX68jMN8MjEM2V+PF4ZiXaTfggKQ66mF+sHL4k2neYgAaacJod8/NronZuxAou/5MV0JQowkf86Q3ba3L4fiDlwRjeZ2uzEza3c3YA9+h6IkbY6ObduhPzWWiH/em58jDwtHXbNQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuYUJZDqUWJoBUUIsA5CtPCDIqStWMUD06XKdj4oHb5V+XbvR3TTeNKpOsgmu9RWbKK2YtTQ0bTZyW+3pDn9OgnEWE4m5Ap6AqeZJpCvZsHEZK1XoE3/Z/wSpKSEj1PKhWuzH4Pxe0XhUVbs+CVHAnQwgkPzSkEI3hYgBnPGQiNl/7baPWAcry90Xh+TQ45SdB/TrYtrTpNMxEDQdwI84QdBeHNxlJOgGOF79op+g6j8EQajvo31FZBnam5WTYMvhALjz6RCZLwtihjvfE86Hn7cOG7dV7KFk/94ftMkSkGBVPJDFPzTNpAec8jYfq6UhKQePyPpaP9v4ioOQAJt/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioNWpQyJnQj08KuQE8KF/JjPJM/jDM10BkTaqpaGsWE=;
 b=dbFzQryajiZicEWznOWe39jyy6f2ze5NKFolsKfG3q1xMn3GLAuShqfD7G29lWr+gB2vojN+CTi2ZEBLSOKTUPi0M1JVdp/7lVap7qNZ43+1ea4TFnj+gGjSkeMyYYt/te/Xp6amGu7QCl3jowjm/aQa1ZSG6fw4HHRfbpPmmDD6+cqGMtFBoC3MlXhkbymXhTeHuX1QSXkNk8xOlRrCJuUkUuZVrO99cHWEzAaNzA4J89oQ++f956UUQ7oYnRsVhnu/5IbSZTVYv8qpRO0veG9Ns+GvZWgeOO5i9znrNv+16KQY7Fm2BCpRsv2fuaEOQbBNtHtq1IPe1K9QyQLLKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioNWpQyJnQj08KuQE8KF/JjPJM/jDM10BkTaqpaGsWE=;
 b=PXIwCcKK/5UvwL89URJoN7KIoa7zRzOXxT+yX68jMN8MjEM2V+PF4ZiXaTfggKQ66mF+sHL4k2neYgAaacJod8/NronZuxAou/5MV0JQowkf86Q3ba3L4fiDlwRjeZ2uzEza3c3YA9+h6IkbY6ObduhPzWWiH/em58jDwtHXbNQ=
From: Henry Wang <Henry.Wang@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"van.freenix@gmail.com" <van.freenix@gmail.com>, Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH V2 1/2] xen/arm: Add i.MX lpuart driver
Thread-Topic: [PATCH V2 1/2] xen/arm: Add i.MX lpuart driver
Thread-Index: AQHYRk7a/JjxjoNn4kiU16mgWm8EnKzcKBxw
Date: Sat, 2 Apr 2022 06:39:38 +0000
Message-ID:
 <PA4PR08MB62532071B8FF1845EA33C26892E39@PA4PR08MB6253.eurprd08.prod.outlook.com>
References: <20220402054223.10304-1-peng.fan@oss.nxp.com>
 <20220402054223.10304-2-peng.fan@oss.nxp.com>
In-Reply-To: <20220402054223.10304-2-peng.fan@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4A7036E9572BF54083CB375563038ADE.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bebaf900-d44d-445e-5ded-08da1473990c
x-ms-traffictypediagnostic:
	DBBPR08MB4473:EE_|AM5EUR03FT026:EE_|AM6PR08MB3942:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB394285780EC72108A9DC662B92E39@AM6PR08MB3942.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jUCVAlfcHt8H2lOAztAhf78R/FgkxEZ+Cl+22pQpcmTcj9wBFtdxLU7Cm19DzT1QtbxBjCy2Fla31w4N7dYUY626cRg9GYsWAHbTWg8hVMA3lvBcxrF8q6ty9K9E8ba6a8bwrI6eakBrj0INFnp7JZQvvtRDdsLej4cPrdqdaBUcEwHU2lHE2xV1nL/871kuTuFjoiUVstll0W3yIOpVZG18dy5vKVlFWRWnm+xOwhOc4e6H5xdXxMYTBu7P6woEGEsA3DMaxVyy2fnJe8rVbBZOJkGwRsv/4qzeSQthYUzaAvtWL+23o0VTrEkR0hETpwV+FgJWFz7Y6NxvRZ1IARavz52NKNJQTrgiEBZjjLn3XtV1InGHLAFjKQcVlSpUgx03SYGeD3WOfq6ocXgPn3q17CI4JE+FYS1L8XyLBwSCAmtQdH+yKqEr7yB1xzDOsP3WEC85IDG/Q+FIhI8y3lHcEdEToajWpgAGTSCY3oanM3Y2sXUtnUopbtcfzednJWkLWnQuZMLrI+1WA1Xddqk46eRBiL/QQssGM84mweCukwa0qKIKYYKpRiJefgiy+Wlh6Imroec0p1nhU/zCBP5fg27VzswKgfOVvIiR+fIo5+ACDRUhW9/R/l1BY8VYeO3yQ6eYblQWuKPmB7kkRKeOYdfy/gi2tpbquo0mAWKc42n1chQ5MIofJiI8pwTpiIVcH5ilmGvZQqt5V7V57ejAUTM2lbQQXAOGEuqwDv4v4eqUpqkl4YoBw2Zd7yZLWj40/0f75DCT3vFbQyx9lTP42om17tls9ZJBnJl0BwTyHKAfQ5ND3ZLfwLh2eX+W
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(53546011)(83380400001)(316002)(66476007)(66446008)(64756008)(76116006)(2906002)(66946007)(86362001)(6506007)(4326008)(55016003)(66556008)(8676002)(33656002)(9686003)(508600001)(71200400001)(52536014)(8936002)(7416002)(38070700005)(30864003)(54906003)(26005)(5660300002)(186003)(110136005)(38100700002)(6636002)(966005)(122000001)(2004002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4473
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c494544e-12ab-4c70-b1b1-08da14738fa3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dW/qHfl1GouoFdzQHBoDFBDKUsKRdxOdZOb/+D309f7bef2Af4yZuds3rAuJp9n3nJtCbf81Eck05O7jWF8JiGPUIcuki6dDcnhVHzT1ZIXt5Q/zBB448taJYqOxNQrISn6pjhNqk86msS+RZGVW7XgVveejBQ17OJCVe6z+F1l7Vqp75ITmVT7iL3z8WL4Ci5PBObZ5tyVMVs3N/7tBKn2A7uLFWBZevotxIUyvnlasEbzAR2bmpQKiZCrjMPYNGr0kw0ZnnxrYduqt/b71b4tE8wl9MTb2PaNVe0z3c7p8h6U2q4EbMhNgZtMpPOiIjAOXbMQ9rNCKP0HeuFuZ3HZ1JbrWb9XfTt4KeaCWZkmkjKlukDFZAbHGiCS6nHaOtRc4DF/44QMzmnHZcTJezVYcC830UL+7ufSdWhVPTMM9H+fS52mOZ8D8njuETtyMp0VLJXDv+4y0W9HNcDwz0yMxADiasMUCtRAZ0tKZ4v4UtbVWWQYQP2f7gwvU1d3OqwzkDOn4/nJPyiwH7oJ/qdhP+xOp+ZyqptYUJPsMkurw9wPw0IDD/9kg9l68QniNtvZL1KVToJssMr24/807SyVwn5Ssf8DNisxBlnEiT6kx2ADJSZS5lcbexQXt+ExDOFd0YJOP1zayJkUUQBaEq6mpz6xwFXt9Z+/CuTXWR5SB+s3GVX1JiPd/uezdB+dFU6P98H4jctqigFYWXus2GKTlrTgz7lnFwHIqXrlQY7tSpsTv5embG18watdK66U/+BEaBQaeHOZx4dc/z5y8g9nStzKKS2SuQHkwyZdWlmg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(52536014)(9686003)(8936002)(186003)(30864003)(26005)(966005)(70586007)(356005)(55016003)(86362001)(8676002)(4326008)(40460700003)(33656002)(110136005)(6636002)(70206006)(36860700001)(54906003)(82310400004)(336012)(2906002)(6506007)(53546011)(5660300002)(7696005)(316002)(83380400001)(508600001)(81166007)(47076005)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 06:39:54.7084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bebaf900-d44d-445e-5ded-08da1473990c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3942

Hi Peng,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Peng Fan (OSS)
> Sent: Saturday, April 2, 2022 1:42 PM
> To: sstabellini@kernel.org; julien@xen.org; Volodymyr_Babchuk@epam.com;
> Bertrand Marquis <Bertrand.Marquis@arm.com>
> Cc: andrew.cooper3@citrix.com; george.dunlap@citrix.com;
> jbeulich@suse.com; wl@xen.org; xen-devel@lists.xenproject.org;
> van.freenix@gmail.com; Peng Fan <peng.fan@nxp.com>
> Subject: [PATCH V2 1/2] xen/arm: Add i.MX lpuart driver
>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
> The i.MX LPUART Documentation:
> https://www.nxp.com/webapp/Download?colCode=3DIMX8QMIEC
> Chatper 13.6 Low Power Universal Asynchronous Receiver/
> Transmitter (LPUART)
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

For the whole series of patch, I tested that the series will not break
current arm64 boot of Xen with and without the CONFIG_HAS_IMX_LPUART.
Unfortunately I cannot test the functionality as I do not have the board :)=
)

So, for this series:
Tested-by: Henry Wang <Henry.Wang@arm.com>

> ---
>  xen/drivers/char/Kconfig      |   8 +
>  xen/drivers/char/Makefile     |   1 +
>  xen/drivers/char/imx-lpuart.c | 275
> ++++++++++++++++++++++++++++++++++
>  xen/include/xen/imx-lpuart.h  |  64 ++++++++
>  4 files changed, 348 insertions(+)
>  create mode 100644 xen/drivers/char/imx-lpuart.c
>  create mode 100644 xen/include/xen/imx-lpuart.h
>=20
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index 2ff5b288e2..0efdb2128f 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -13,6 +13,14 @@ config HAS_CADENCE_UART
>  	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zynq
>  	  based board, say Y.
>=20
> +config HAS_IMX_LPUART
> +	bool "i.MX LPUART driver"
> +	default y
> +	depends on ARM_64
> +	help
> +	  This selects the i.MX LPUART. If you have a i.MX8QM based board,
> +	  say Y.
> +
>  config HAS_MVEBU
>  	bool "Marvell MVEBU UART driver"
>  	default y
> diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
> index 7c646d771c..14e67cf072 100644
> --- a/xen/drivers/char/Makefile
> +++ b/xen/drivers/char/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_HAS_MVEBU) +=3D mvebu-uart.o
>  obj-$(CONFIG_HAS_OMAP) +=3D omap-uart.o
>  obj-$(CONFIG_HAS_SCIF) +=3D scif-uart.o
>  obj-$(CONFIG_HAS_EHCI) +=3D ehci-dbgp.o
> +obj-$(CONFIG_HAS_IMX_LPUART) +=3D imx-lpuart.o
>  obj-$(CONFIG_ARM) +=3D arm-uart.o
>  obj-y +=3D serial.o
>  obj-$(CONFIG_XEN_GUEST) +=3D xen_pv_console.o
> diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.=
c
> new file mode 100644
> index 0000000000..49330fd2f8
> --- /dev/null
> +++ b/xen/drivers/char/imx-lpuart.c
> @@ -0,0 +1,275 @@
> +/*
> + * xen/drivers/char/imx-lpuart.c
> + *
> + * Driver for i.MX LPUART.
> + *
> + * Peng Fan <peng.fan@nxp.com>
> + * Copyright 2022 NXP
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <xen/errno.h>
> +#include <xen/imx-lpuart.h>
> +#include <xen/init.h>
> +#include <xen/irq.h>
> +#include <xen/mm.h>
> +#include <xen/serial.h>
> +#include <asm/device.h>
> +#include <asm/io.h>
> +
> +#define imx_lpuart_read(uart, off)       readl((uart)->regs + off)
> +#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + of=
f)
> +
> +static struct imx_lpuart {
> +    uint32_t baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
> +    uint32_t irq;
> +    char __iomem *regs;
> +    struct irqaction irqaction;
> +    struct vuart_info vuart;
> +} imx8_com;
> +
> +static void imx_lpuart_interrupt(int irq, void *data,
> +                                 struct cpu_user_regs *regs)
> +{
> +    struct serial_port *port =3D data;
> +    struct imx_lpuart *uart =3D port->uart;
> +    uint32_t sts, rxcnt;
> +
> +    sts =3D imx_lpuart_read(uart, UARTSTAT);
> +    rxcnt =3D imx_lpuart_read(uart, UARTWATER) >> UARTWATER_RXCNT_OFF;
> +
> +    if ( (sts & UARTSTAT_RDRF) || (rxcnt > 0) )
> +	    serial_rx_interrupt(port, regs);
> +
> +    if ( sts & UARTSTAT_TDRE )
> +	    serial_tx_interrupt(port, regs);
> +
> +    imx_lpuart_write(uart, UARTSTAT, sts);
> +}
> +
> +static void __init imx_lpuart_init_preirq(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +    uint32_t ctrl, old_ctrl, bd;
> +
> +    ctrl =3D old_ctrl =3D imx_lpuart_read(uart, UARTCTRL);
> +    ctrl =3D (old_ctrl & ~UARTCTRL_M) | UARTCTRL_TE | UARTCTRL_RE;
> +    bd =3D imx_lpuart_read(uart, UARTBAUD);
> +
> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC) )
> +	    cpu_relax();
> +
> +    /* Disable transmit and receive */
> +    imx_lpuart_write(uart, UARTCTRL, old_ctrl & ~(UARTCTRL_TE |
> UARTCTRL_RE));
> +
> +    /* Reuse firmware baudrate settings, only disable DMA here */
> +    bd &=3D ~(UARTBAUD_TDMAE | UARTBAUD_RDMAE);
> +
> +    imx_lpuart_write(uart, UARTMODIR, 0);
> +    imx_lpuart_write(uart, UARTBAUD, bd);
> +    imx_lpuart_write(uart, UARTCTRL, ctrl);
> +}
> +
> +static void __init imx_lpuart_init_postirq(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +    uint32_t temp;
> +
> +    uart->irqaction.handler =3D imx_lpuart_interrupt;
> +    uart->irqaction.name =3D "imx_lpuart";
> +    uart->irqaction.dev_id =3D port;
> +
> +    if ( setup_irq(uart->irq, 0, &uart->irqaction) !=3D 0 )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to allocate imx_lpuart IRQ %d\n",
> +                uart->irq);
> +        return;
> +    }
> +
> +    /* Enable interrupts */
> +    temp =3D imx_lpuart_read(uart, UARTCTRL);
> +    temp |=3D (UARTCTRL_RIE | UARTCTRL_TIE);
> +    temp |=3D UARTCTRL_ILIE;
> +    imx_lpuart_write(uart, UARTCTRL, temp);
> +}
> +
> +static void imx_lpuart_suspend(struct serial_port *port)
> +{
> +    BUG();
> +}
> +
> +static void imx_lpuart_resume(struct serial_port *port)
> +{
> +    BUG();
> +}
> +
> +static int imx_lpuart_tx_ready(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +
> +    return imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC;
> +}
> +
> +static void imx_lpuart_putc(struct serial_port *port, char c)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +
> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TDRE) )
> +        cpu_relax();
> +
> +    imx_lpuart_write(uart, UARTDATA, c);
> +}
> +
> +static int imx_lpuart_getc(struct serial_port *port, char *pc)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +    int ch;
> +
> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_RDRF) )
> +	    return 0;
> +
> +    ch =3D imx_lpuart_read(uart, UARTDATA);
> +    *pc =3D ch & 0xff;
> +
> +    if ( imx_lpuart_read(uart, UARTSTAT) &  UARTSTAT_OR )
> +        imx_lpuart_write(uart, UARTSTAT, UARTSTAT_OR);
> +
> +    return 1;
> +}
> +
> +static int __init imx_lpuart_irq(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +
> +    return ((uart->irq > 0) ? uart->irq : -1);
> +}
> +
> +static const struct vuart_info *imx_lpuart_vuart_info(struct serial_port
> *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +
> +    return &uart->vuart;
> +}
> +
> +static void imx_lpuart_start_tx(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +    uint32_t temp;
> +
> +    temp =3D imx_lpuart_read(uart, UARTSTAT);
> +    /* Wait until empty */
> +    while ( !(temp & UARTSTAT_TDRE) )
> +	    cpu_relax();
> +
> +    temp =3D imx_lpuart_read(uart, UARTCTRL);
> +    imx_lpuart_write(uart, UARTCTRL, (temp | UARTCTRL_TIE));
> +}
> +
> +static void imx_lpuart_stop_tx(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +    uint32_t temp;
> +
> +    temp =3D imx_lpuart_read(uart, UARTCTRL);
> +    temp &=3D ~(UARTCTRL_TIE | UARTCTRL_TCIE);
> +    imx_lpuart_write(uart, UARTCTRL, temp);
> +}
> +
> +static struct uart_driver __read_mostly imx_lpuart_driver =3D {
> +    .init_preirq =3D imx_lpuart_init_preirq,
> +    .init_postirq =3D imx_lpuart_init_postirq,
> +    .endboot =3D NULL,
> +    .suspend =3D imx_lpuart_suspend,
> +    .resume =3D imx_lpuart_resume,
> +    .tx_ready =3D imx_lpuart_tx_ready,
> +    .putc =3D imx_lpuart_putc,
> +    .getc =3D imx_lpuart_getc,
> +    .irq =3D imx_lpuart_irq,
> +    .start_tx =3D imx_lpuart_start_tx,
> +    .stop_tx =3D imx_lpuart_stop_tx,
> +    .vuart_info =3D imx_lpuart_vuart_info,
> +};
> +
> +static int __init imx_lpuart_init(struct dt_device_node *dev,
> +                                  const void *data)
> +{
> +    const char *config =3D data;
> +    struct imx_lpuart *uart;
> +    int res;
> +    u64 addr, size;
> +
> +    if ( strcmp(config, "") )
> +        printk("WARNING: UART configuration is not supported\n");
> +
> +    uart =3D &imx8_com;
> +
> +    uart->baud =3D 115200;
> +    uart->data_bits =3D 8;
> +    uart->parity =3D 0;
> +    uart->stop_bits =3D 1;
> +
> +    res =3D dt_device_get_address(dev, 0, &addr, &size);
> +    if ( res )
> +    {
> +        printk("imx8-lpuart: Unable to retrieve the base"
> +               " address of the UART\n");
> +        return res;
> +    }
> +
> +    res =3D platform_get_irq(dev, 0);
> +    if ( res < 0 )
> +    {
> +        printk("imx8-lpuart: Unable to retrieve the IRQ\n");
> +        return -EINVAL;
> +    }
> +    uart->irq =3D res;
> +
> +    uart->regs =3D ioremap_nocache(addr, size);
> +    if ( !uart->regs )
> +    {
> +        printk("imx8-lpuart: Unable to map the UART memory\n");
> +        return -ENOMEM;
> +    }
> +
> +    uart->vuart.base_addr =3D addr;
> +    uart->vuart.size =3D size;
> +    uart->vuart.data_off =3D UARTDATA;
> +    /* tmp from uboot */
> +    uart->vuart.status_off =3D UARTSTAT;
> +    uart->vuart.status =3D UARTSTAT_TDRE;
> +
> +    /* Register with generic serial driver */
> +    serial_register_uart(SERHND_DTUART, &imx_lpuart_driver, uart);
> +
> +    dt_device_set_used_by(dev, DOMID_XEN);
> +
> +    return 0;
> +}
> +
> +static const struct dt_device_match imx_lpuart_dt_compat[] __initconst =
=3D
> +{
> +    DT_MATCH_COMPATIBLE("fsl,imx8qm-lpuart"),
> +    {},
> +};
> +
> +DT_DEVICE_START(imx_lpuart, "i.MX LPUART", DEVICE_SERIAL)
> +    .dt_match =3D imx_lpuart_dt_compat,
> +    .init =3D imx_lpuart_init,
> +DT_DEVICE_END
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/imx-lpuart.h b/xen/include/xen/imx-lpuart.h
> new file mode 100644
> index 0000000000..945ab1c4fa
> --- /dev/null
> +++ b/xen/include/xen/imx-lpuart.h
> @@ -0,0 +1,64 @@
> +/*
> + * xen/include/asm-arm/imx-lpuart.h
> + *
> + * Common constant definition between early printk and the LPUART driver
> + *
> + * Peng Fan <peng.fan@nxp.com>
> + * Copyright 2022 NXP
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __ASM_ARM_IMX_LPUART_H
> +#define __ASM_ARM_IMX_LPUART_H
> +
> +/* 32-bit register definition */
> +#define UARTBAUD          (0x10)
> +#define UARTSTAT          (0x14)
> +#define UARTCTRL          (0x18)
> +#define UARTDATA          (0x1C)
> +#define UARTMATCH         (0x20)
> +#define UARTMODIR         (0x24)
> +#define UARTFIFO          (0x28)
> +#define UARTWATER         (0x2c)
> +
> +#define UARTSTAT_TDRE     (1 << 23)
> +#define UARTSTAT_TC       (1 << 22)
> +#define UARTSTAT_RDRF     (1 << 21)
> +#define UARTSTAT_OR       (1 << 19)
> +
> +#define UARTBAUD_OSR_SHIFT (24)
> +#define UARTBAUD_OSR_MASK (0x1f)
> +#define UARTBAUD_SBR_MASK (0x1fff)
> +#define UARTBAUD_BOTHEDGE (0x00020000)
> +#define UARTBAUD_TDMAE    (0x00800000)
> +#define UARTBAUD_RDMAE    (0x00200000)
> +
> +#define UARTCTRL_TIE      (1 << 23)
> +#define UARTCTRL_TCIE     (1 << 22)
> +#define UARTCTRL_RIE      (1 << 21)
> +#define UARTCTRL_ILIE     (1 << 20)
> +#define UARTCTRL_TE       (1 << 19)
> +#define UARTCTRL_RE       (1 << 18)
> +#define UARTCTRL_M        (1 << 4)
> +
> +#define UARTWATER_RXCNT_OFF     24
> +
> +#endif /* __ASM_ARM_IMX_LPUART_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.35.1
>=20


