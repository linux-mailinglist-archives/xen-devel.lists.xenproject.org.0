Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD1C88E323
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 14:42:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698542.1090331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTY4-0004DN-Ol; Wed, 27 Mar 2024 13:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698542.1090331; Wed, 27 Mar 2024 13:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTY4-0004BA-Kq; Wed, 27 Mar 2024 13:42:36 +0000
Received: by outflank-mailman (input) for mailman id 698542;
 Wed, 27 Mar 2024 13:42:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsR0=LB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rpTY3-0004B2-81
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 13:42:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2612::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddabb156-ec3f-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 14:42:34 +0100 (CET)
Received: from AS9PR04CA0168.eurprd04.prod.outlook.com (2603:10a6:20b:530::13)
 by AS4PR08MB7757.eurprd08.prod.outlook.com (2603:10a6:20b:514::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 13:42:30 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:530:cafe::a1) by AS9PR04CA0168.outlook.office365.com
 (2603:10a6:20b:530::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 13:42:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 13:42:29 +0000
Received: ("Tessian outbound 9b7417e2a8eb:v300");
 Wed, 27 Mar 2024 13:42:29 +0000
Received: from e92aa6183366.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A4EDB33E-93C9-42B3-8EDE-D71E2B869A7B.1; 
 Wed, 27 Mar 2024 13:42:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e92aa6183366.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Mar 2024 13:42:21 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAXPR08MB7552.eurprd08.prod.outlook.com (2603:10a6:102:24f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 13:42:19 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 13:42:19 +0000
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
X-Inumbo-ID: ddabb156-ec3f-11ee-afe3-a90da7624cb6
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XU5Rypcy8j0MfuutyqjdSDD5zjQCEFAIr2hcoooWBgTbPhDJeD/mCsPHvV5hQHGij3tVdUZZsTq+ONaY+wZxjrg6gOp+C+IrL8HW8a/RmszOPYZqAqCmwy8+8jqG4I+1mqQcrOFu9pdMYygfC7IU3Or11xL/jdsTnW0RoDXBprJ3n6T4weaQBjGw0bTwTdvECKq9MDP+YB7DCCdFrvumN/fkiofC9ZLs7rUU9D9AfatHQwI7ghpP95J3tsOxaaBXymGu6VaPEd5bsbzuqPAqjIdIGp+vujkBNT+CDPk0hE2jZIJGxnOrpjA22HLfyG5a4pFtJca9ZLVDf56brAOmjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pvrdkGgNjuEybFpXk2LfI42H3Yh77m/UGD06EenTKI=;
 b=gBSA2Vn4tSmhctQgwzcWKhzpFkDLDvEll94kAwpNQFf6dGoWmmqzDa8QVQ3xod34gQ+Wu7bdHGFx/ii1zXYD4v2y6NQi2+UDRhMs2kYtoAgFw7MUUmZq5vX+ifFj6dtMGpc8fZRkjpIjvh8/7VZynzvEsempMaj8OSO8V94hq3sRQ/Xe21JxuGgKZ4d8Ukvw+mTKnjY6rri2fFGXLXJy4D8QAzNmvpnzGGeLkbtduM3wJrweUwepgEqo1NAtdk7YkY1UUaltwCqCPz5NcnJGQuV0rSLDYzjFAyZmUjQ/m09HALeO7qy1zeTPb0nBI+Mo4z1BVIAEwiKGswO0ER9dFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pvrdkGgNjuEybFpXk2LfI42H3Yh77m/UGD06EenTKI=;
 b=0a4tehdtXELkaL3Y43qRRw5Z9qhBoXK3SNowdSOsFq6LO4QYpgqsDCF/afYCEwubBzL81hcEta5uiC+tsUE0fIcuVE39BhNR6iNZ60QIFl0XzsQnTx/fwn0JTEkRKP+Nq4th0CabRJ1wZuuihMtkahyaU5AOHlDll/bsmKs7eAs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fac7bafb0d7892dd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcbSKUtHaGoQ7Vx9XuqqsnYlF3FI1blnEa9xSGl1a/cricGUT7E827ONF5z5t1EcWtF0igmFZYuqHXrDfXFWihEBA9YhQYtEUWvAhmSaydLUs/8u7Nu82/qjI2ezhwMZ2cipZBe8d5vZkQkf+tbNV64/xO2Sq22x4gVoBOigfG62KfRDYlWsQyr69LPSlu+05bCSN0K0J20Nw4LrW431MZDqNazJFSc+qQ7UGRSC+hYL5XAeMl3ahgYlRt3XRA0j8Aj9uhvMAAL8O5EquGmIrXVJ6G/XEhYQJhzQAl12HPdGTqBp6mhL6s4Ra5OkV7PJ4H4yXP4H5Yti2NgH/agppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pvrdkGgNjuEybFpXk2LfI42H3Yh77m/UGD06EenTKI=;
 b=nZ3Kw+S21YsFINOips8YOQmMzZfwJuOYV6DA2dFqDzXqgoZTFHjxwDAJ2jwB8r3gfq6HERT9kP3ToHxwz7N5E6Q1nPoFYLEhpsts6lJgs8NsWviy0qJX/tO9DlDeA4eE+Ye67pZCFMWTSFqrDMby/41Q5zZXPeyyg+ROgZmO0AFRvRSS3ag8zIQ3E4PKwrm962CHfHXMtEjV4BXZFuSqRg2DFIZ6GRLlqIhLXISQNwNwKCanMkZ5dLFll9Ygx//lgvJ2pE3bYmKaHwtIWjxO8iKQdXNo3vOMp1yx7Fh9j0V84g2LdmR4jGN5lzIKO715beNrLOLHKbN4wT4ZWk4DSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pvrdkGgNjuEybFpXk2LfI42H3Yh77m/UGD06EenTKI=;
 b=0a4tehdtXELkaL3Y43qRRw5Z9qhBoXK3SNowdSOsFq6LO4QYpgqsDCF/afYCEwubBzL81hcEta5uiC+tsUE0fIcuVE39BhNR6iNZ60QIFl0XzsQnTx/fwn0JTEkRKP+Nq4th0CabRJ1wZuuihMtkahyaU5AOHlDll/bsmKs7eAs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH 4/6] xen/arm: ffa: separate partition info get
 routines
Thread-Topic: [XEN PATCH 4/6] xen/arm: ffa: separate partition info get
 routines
Thread-Index: AQHafphSdluTj/kw9U66NBMqBbhqTrFLm/CA
Date: Wed, 27 Mar 2024 13:42:19 +0000
Message-ID: <7332DDE8-E340-45D0-9553-581E42122C29@arm.com>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
 <20240325093904.3466092-5-jens.wiklander@linaro.org>
In-Reply-To: <20240325093904.3466092-5-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAXPR08MB7552:EE_|AMS0EPF0000019E:EE_|AS4PR08MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c22511-5401-42d5-00f8-08dc4e63bf1d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OWi2lHQ0QIpKFNLVFdchIi+v68Ks2+tt+fS4Uz+JNBrWzp2SRiDQVG8XIXMQuup/sB3WwJRJioZAbTzq43RDpdKpQOjZu7bKqx/1+P2aBRpTJXCSx8PrpO1fhcxWeUyJA+YtBM+UQ8eHEUJaQUo9OnoLZ/U2jRralkCFm5sw1FtvYVU/57XHpfoNoRUPJ8aqQH5k9l8Do3kGsY33b4d3nKvW+NJd8BuB8yUieeFW4LArsWCNDYowjQRui2KxItF7Rt0DKnGajl9aYu9nGuy/dBzTSam0jZrnbzpH4ddlDL3fppKPswzIfCi6WcqqpYzbl2XLbjQr8ALaNTGSDrAtBf5/6tBKXVmS+dopl3rH9nG1y2ODmnJx3Om0irrndj3JkTut+p/EaoJvkVyWGZsx1dPjK13xo3NHxay8il3eJkxsVOhNvFxgA8XwtCxu7ag0+vrvIQcHKS9SXssiSXPuigcaFBlWPk/JHOkHG0lAUN88cdirpj91Qf3iW0WIQnywmuts3Efb4fAt7Pif/C8BORiHNS2tc7pcMMvvJsCmhz+mkwHoGQ06y1xPwT2E9K6wNkzWAVIO2aC9P6RH3s/BCFMCSS3nfndEpJNXwEb8MwBR8TVqW0XDO+cjFrhsS2Ev1kpflraxic5trzaTvKsvWNabLvX16Srv8m+2UzlzAVTmot9TM3kOap6anEr8xS3UzK94KFgk/vdF/1fm5gkQpsNID3C1v1DnHUzAlG2HPIc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <966371AA979AE44DBC71ECFC6BF358E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7552
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1281b78c-17c8-4ae5-4eab-08dc4e63b949
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a4kvknBt+qktp3kTacdccThAlck1sRVp/FrA82sB2CICsVf9VbEf37OGsWWnk3nFT8x1dw/K+Atm40qKsoLqrVU/U4INiRiEZxEBuko/149m64osLvWho0U2hCg6EtTMxR9J8ALprztjZYBnuZOyANijrcOx2F52oS1c2Ilc4OMUY7NrH5ACcp92IBzhJ/cLMC9BzjgLw+Vlc0Tm0CFkSh8qf+RNCW76ZhSKedvNXqRYOuKU5WEG3OZsR8nqmoUP6r0AXd9NiEje640MytiB1nk0g/mE7HQNtEFGrO8GZdOAr53+OCRKzn085NWXPO2rwjk6z4s4mlOFSQ9zcXY5lf8s9BUmgMwC0HA71B00hrhiErpM40FkHXeuS36iEKlYbo9ugrWyzuS3E68w00nJnfPJ0CFUAVb0iP8zAZlrGGBkMB7HLtfBh9q+mQaKY/L30sKGLEscCdhGTkqnfcQ5jdwwG5mAjql+4foDoBqR9mElc/S5VP83DdTm73EQvkeBjI6RUZ1BAkMcSHHfmC3TTD/1BqEJD8r/YtK94oAKOcZdpUP66tlJFKxxQBjU2h+1lleJYXEqBpKx9nv4UaE3IRN6+O5b9fCspBfJ0TafezVCQVTcaY0sgW2+m2IepaW0xiGjsLmuI/gn3Y69d+5YbqWI94EpCimXEm69eWBSHIUOa61E5EfpN++NcmPx7gz6F5uLesDxa5/0v+IgKfcLjWYYO/09bC9KRhvj3L9cGQUVkp3+4REZyRpJE80OagME
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 13:42:29.4220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c22511-5401-42d5-00f8-08dc4e63bf1d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7757

Hi Jens,

> On 25 Mar 2024, at 10:39, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Move partition info get routines into a separate file for easier
> navigation in the source code.
>=20
> Add ffa_partinfo_init(), ffa_partinfo_domain_init(), and
> ffa_partinfo_domain_destroy() to handle the ffa_partinfo internal things
> on initialization and teardown.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/Makefile       |   1 +
> xen/arch/arm/tee/ffa.c          | 359 +-----------------------------
> xen/arch/arm/tee/ffa_partinfo.c | 373 ++++++++++++++++++++++++++++++++
> xen/arch/arm/tee/ffa_private.h  |  14 +-
> 4 files changed, 398 insertions(+), 349 deletions(-)
> create mode 100644 xen/arch/arm/tee/ffa_partinfo.c
>=20
> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
> index 0e683d23aa9d..be644fba8055 100644
> --- a/xen/arch/arm/tee/Makefile
> +++ b/xen/arch/arm/tee/Makefile
> @@ -1,4 +1,5 @@
> obj-$(CONFIG_FFA) +=3D ffa.o
> obj-$(CONFIG_FFA) +=3D ffa_shm.o
> +obj-$(CONFIG_FFA) +=3D ffa_partinfo.o
> obj-y +=3D tee.o
> obj-$(CONFIG_OPTEE) +=3D optee.o
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index db36292dc52f..7a2803881420 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -70,20 +70,6 @@
>  * structs ending with _1_1 are defined in FF-A-1.1-REL0.
>  */
>=20
> -/* Partition information descriptor */
> -struct ffa_partition_info_1_0 {
> -    uint16_t id;
> -    uint16_t execution_context;
> -    uint32_t partition_properties;
> -};
> -
> -struct ffa_partition_info_1_1 {
> -    uint16_t id;
> -    uint16_t execution_context;
> -    uint32_t partition_properties;
> -    uint8_t uuid[16];
> -};
> -
> /* Endpoint RX/TX descriptor */
> struct ffa_endpoint_rxtx_descriptor_1_0 {
>     uint16_t sender_id;
> @@ -102,11 +88,6 @@ struct ffa_endpoint_rxtx_descriptor_1_1 {
> /* Negotiated FF-A version to use with the SPMC */
> static uint32_t __ro_after_init ffa_version;
>=20
> -/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
> -static uint16_t *subscr_vm_created __read_mostly;
> -static uint16_t subscr_vm_created_count __read_mostly;
> -static uint16_t *subscr_vm_destroyed __read_mostly;
> -static uint16_t subscr_vm_destroyed_count __read_mostly;
>=20
> /*
>  * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
> @@ -170,90 +151,6 @@ static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t=
 rx_addr,
>     return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count,=
 0);
> }
>=20
> -static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t=
 w3,
> -                                      uint32_t w4, uint32_t w5,
> -                                      uint32_t *count, uint32_t *fpi_siz=
e)
> -{
> -    const struct arm_smccc_1_2_regs arg =3D {
> -        .a0 =3D FFA_PARTITION_INFO_GET,
> -        .a1 =3D w1,
> -        .a2 =3D w2,
> -        .a3 =3D w3,
> -        .a4 =3D w4,
> -        .a5 =3D w5,
> -    };
> -    struct arm_smccc_1_2_regs resp;
> -    uint32_t ret;
> -
> -    arm_smccc_1_2_smc(&arg, &resp);
> -
> -    ret =3D ffa_get_ret_code(&resp);
> -    if ( !ret )
> -    {
> -        *count =3D resp.a2;
> -        *fpi_size =3D resp.a3;
> -    }
> -
> -    return ret;
> -}
> -
> -static int32_t ffa_rx_release(void)
> -{
> -    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> -}
> -
> -static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> -                                      uint8_t msg)
> -{
> -    uint32_t exp_resp =3D FFA_MSG_FLAG_FRAMEWORK;
> -    unsigned int retry_count =3D 0;
> -    int32_t res;
> -
> -    if ( msg =3D=3D FFA_MSG_SEND_VM_CREATED )
> -        exp_resp |=3D FFA_MSG_RESP_VM_CREATED;
> -    else if ( msg =3D=3D FFA_MSG_SEND_VM_DESTROYED )
> -        exp_resp |=3D FFA_MSG_RESP_VM_DESTROYED;
> -    else
> -        return FFA_RET_INVALID_PARAMETERS;
> -
> -    do {
> -        const struct arm_smccc_1_2_regs arg =3D {
> -            .a0 =3D FFA_MSG_SEND_DIRECT_REQ_32,
> -            .a1 =3D sp_id,
> -            .a2 =3D FFA_MSG_FLAG_FRAMEWORK | msg,
> -            .a5 =3D vm_id,
> -        };
> -        struct arm_smccc_1_2_regs resp;
> -
> -        arm_smccc_1_2_smc(&arg, &resp);
> -        if ( resp.a0 !=3D FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 !=3D ex=
p_resp )
> -        {
> -            /*
> -             * This is an invalid response, likely due to some error in =
the
> -             * implementation of the ABI.
> -             */
> -            return FFA_RET_INVALID_PARAMETERS;
> -        }
> -        res =3D resp.a3;
> -        if ( ++retry_count > 10 )
> -        {
> -            /*
> -             * TODO
> -             * FFA_RET_INTERRUPTED means that the SPMC has a pending
> -             * non-secure interrupt, we need a way of delivering that
> -             * non-secure interrupt.
> -             * FFA_RET_RETRY is the SP telling us that it's temporarily
> -             * blocked from handling the direct request, we need a gener=
ic
> -             * way to deal with this.
> -             * For now in both cases, give up after a few retries.
> -             */
> -            return res;
> -        }
> -    } while ( res =3D=3D FFA_RET_INTERRUPTED || res =3D=3D FFA_RET_RETRY=
 );
> -
> -    return res;
> -}
> -
> static void handle_version(struct cpu_user_regs *regs)
> {
>     struct domain *d =3D current->domain;
> @@ -371,88 +268,6 @@ static uint32_t ffa_handle_rxtx_unmap(void)
>     return FFA_RET_OK;
> }
>=20
> -static int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2,
> -                                             uint32_t w3, uint32_t w4,
> -                                             uint32_t w5, uint32_t *coun=
t,
> -                                             uint32_t *fpi_size)
> -{
> -    int32_t ret =3D FFA_RET_DENIED;
> -    struct domain *d =3D current->domain;
> -    struct ffa_ctx *ctx =3D d->arch.tee;
> -
> -    /*
> -     * FF-A v1.0 has w5 MBZ while v1.1 allows
> -     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
> -     *
> -     * FFA_PARTITION_INFO_GET_COUNT is only using registers and not the
> -     * rxtx buffer so do the partition_info_get directly.
> -     */
> -    if ( w5 =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
> -         ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
> -        return ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_siz=
e);
> -    if ( w5 )
> -        return FFA_RET_INVALID_PARAMETERS;
> -
> -    if ( !ffa_rx )
> -        return FFA_RET_DENIED;
> -
> -    if ( !spin_trylock(&ctx->rx_lock) )
> -        return FFA_RET_BUSY;
> -
> -    if ( !ctx->page_count || !ctx->rx_is_free )
> -        goto out;
> -    spin_lock(&ffa_rx_buffer_lock);
> -    ret =3D ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_size);
> -    if ( ret )
> -        goto out_rx_buf_unlock;
> -    /*
> -     * ffa_partition_info_get() succeeded so we now own the RX buffer we
> -     * share with the SPMC. We must give it back using ffa_rx_release()
> -     * once we've copied the content.
> -     */
> -
> -    if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
> -    {
> -        size_t n;
> -        struct ffa_partition_info_1_1 *src =3D ffa_rx;
> -        struct ffa_partition_info_1_0 *dst =3D ctx->rx;
> -
> -        if ( ctx->page_count * FFA_PAGE_SIZE < *count * sizeof(*dst) )
> -        {
> -            ret =3D FFA_RET_NO_MEMORY;
> -            goto out_rx_release;
> -        }
> -
> -        for ( n =3D 0; n < *count; n++ )
> -        {
> -            dst[n].id =3D src[n].id;
> -            dst[n].execution_context =3D src[n].execution_context;
> -            dst[n].partition_properties =3D src[n].partition_properties;
> -        }
> -    }
> -    else
> -    {
> -        size_t sz =3D *count * *fpi_size;
> -
> -        if ( ctx->page_count * FFA_PAGE_SIZE < sz )
> -        {
> -            ret =3D FFA_RET_NO_MEMORY;
> -            goto out_rx_release;
> -        }
> -
> -        memcpy(ctx->rx, ffa_rx, sz);
> -    }
> -    ctx->rx_is_free =3D false;
> -out_rx_release:
> -    ffa_rx_release();
> -out_rx_buf_unlock:
> -    spin_unlock(&ffa_rx_buffer_lock);
> -out:
> -    spin_unlock(&ctx->rx_lock);
> -
> -    return ret;
> -}
> -
> static int32_t ffa_handle_rx_release(void)
> {
>     int32_t ret =3D FFA_RET_DENIED;
> @@ -604,46 +419,9 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>     }
> }
>=20
> -static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> -                              uint16_t end, uint16_t sp_id)
> -{
> -    unsigned int n;
> -
> -    for ( n =3D start; n < end; n++ )
> -    {
> -        if ( subscr[n] =3D=3D sp_id )
> -            return true;
> -    }
> -
> -    return false;
> -}
> -
> -static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
> -                                   unsigned int create_signal_count)
> -{
> -    unsigned int n;
> -
> -    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> -    {
> -        /*
> -         * Skip SPs subscribed to the VM created event that never was
> -         * notified of the VM creation due to an error during
> -         * ffa_domain_init().
> -         */
> -        if ( is_in_subscr_list(subscr_vm_created, create_signal_count,
> -                               subscr_vm_created_count,
> -                               subscr_vm_destroyed[n]) )
> -            continue;
> -
> -        set_bit(n, ctx->vm_destroy_bitmap);
> -    }
> -}
> -
> static int ffa_domain_init(struct domain *d)
> {
>     struct ffa_ctx *ctx;
> -    unsigned int n;
> -    int32_t res;
>=20
>     if ( !ffa_version )
>         return -ENODEV;
> @@ -654,8 +432,7 @@ static int ffa_domain_init(struct domain *d)
>     if ( d->domain_id >=3D UINT16_MAX)
>         return -ERANGE;
>=20
> -    ctx =3D xzalloc_flex_struct(struct ffa_ctx, vm_destroy_bitmap,
> -                              BITS_TO_LONGS(subscr_vm_destroyed_count));
> +    ctx =3D xzalloc(struct ffa_ctx);
>     if ( !ctx )
>         return -ENOMEM;
>=20
> @@ -663,66 +440,28 @@ static int ffa_domain_init(struct domain *d)
>     ctx->teardown_d =3D d;
>     INIT_LIST_HEAD(&ctx->shm_list);
>=20
> -    for ( n =3D 0; n < subscr_vm_created_count; n++ )
> -    {
> -        res =3D ffa_direct_req_send_vm(subscr_vm_created[n], ffa_get_vm_=
id(d),
> -                                     FFA_MSG_SEND_VM_CREATED);
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %=
u to  %u: res %d\n",
> -                   ffa_get_vm_id(d), subscr_vm_created[n], res);
> -            break;
> -        }
> -    }
> -    vm_destroy_bitmap_init(ctx, n);
> -    if ( n !=3D subscr_vm_created_count )
> +    /*
> +     * ffa_domain_teardown() will be called if ffa_domain_init() returns=
 an
> +     * error, so no need for cleanup in this function.
> +     */
> +
> +    if ( !ffa_partinfo_domain_init(d) )
>         return -EIO;
>=20
>     return 0;
> }
>=20
> -static void send_vm_destroyed(struct domain *d)
> -{
> -    struct ffa_ctx *ctx =3D d->arch.tee;
> -    unsigned int n;
> -    int32_t res;
> -
> -    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> -    {
> -        if ( !test_bit(n, ctx->vm_destroy_bitmap) )
> -            continue;
> -
> -        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], ffa_get_v=
m_id(d),
> -                                     FFA_MSG_SEND_VM_DESTROYED);
> -
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "%pd: ffa: Failed to report destruction of=
 vm_id %u to %u: res %d\n",
> -                   d, ffa_get_vm_id(d), subscr_vm_destroyed[n], res);
> -        }
> -
> -        /*
> -         * For these two error codes the hypervisor is expected to resen=
d
> -         * the destruction message. For the rest it is expected that the
> -         * error is permanent and that is doesn't help to resend the
> -         * destruction message.
> -         */
> -        if ( res !=3D FFA_RET_INTERRUPTED && res !=3D FFA_RET_RETRY )
> -            clear_bit(n, ctx->vm_destroy_bitmap);
> -    }
> -}
> -
> static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first_=
time)
> {
>     struct ffa_ctx *next_ctx =3D NULL;
>     bool retry =3D false;
>=20
> -    send_vm_destroyed(ctx->teardown_d);
> +    if ( !ffa_partinfo_domain_destroy(ctx->teardown_d) )
> +        retry =3D true;
>     if ( !ffa_shm_domain_destroy(ctx->teardown_d) )
>         retry =3D true;
>=20
> -    if ( retry ||
> -         !bitmap_empty(ctx->vm_destroy_bitmap, subscr_vm_destroyed_count=
) )
> +    if ( retry )
>     {
>         printk(XENLOG_G_INFO "%pd: ffa: Remaining cleanup, retrying\n", c=
tx->teardown_d);
>=20
> @@ -796,82 +535,6 @@ static int ffa_relinquish_resources(struct domain *d=
)
>     return 0;
> }
>=20
> -static void uninit_subscribers(void)
> -{
> -        subscr_vm_created_count =3D 0;
> -        subscr_vm_destroyed_count =3D 0;
> -        XFREE(subscr_vm_created);
> -        XFREE(subscr_vm_destroyed);
> -}
> -
> -static bool init_subscribers(struct ffa_partition_info_1_1 *fpi, uint16_=
t count)
> -{
> -    uint16_t n;
> -    uint16_t c_pos;
> -    uint16_t d_pos;
> -
> -    subscr_vm_created_count =3D 0;
> -    subscr_vm_destroyed_count =3D 0;
> -    for ( n =3D 0; n < count; n++ )
> -    {
> -        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> -            subscr_vm_created_count++;
> -        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED=
 )
> -            subscr_vm_destroyed_count++;
> -    }
> -
> -    if ( subscr_vm_created_count )
> -        subscr_vm_created =3D xzalloc_array(uint16_t, subscr_vm_created_=
count);
> -    if ( subscr_vm_destroyed_count )
> -        subscr_vm_destroyed =3D xzalloc_array(uint16_t,
> -                                            subscr_vm_destroyed_count);
> -    if ( (subscr_vm_created_count && !subscr_vm_created) ||
> -         (subscr_vm_destroyed_count && !subscr_vm_destroyed) )
> -    {
> -        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\n"=
);
> -        uninit_subscribers();
> -        return false;
> -    }
> -
> -    for ( c_pos =3D 0, d_pos =3D 0, n =3D 0; n < count; n++ )
> -    {
> -        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> -            subscr_vm_created[c_pos++] =3D fpi[n].id;
> -        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED=
 )
> -            subscr_vm_destroyed[d_pos++] =3D fpi[n].id;
> -    }
> -
> -    return true;
> -}
> -
> -static bool init_sps(void)
> -{
> -    bool ret =3D false;
> -    uint32_t fpi_size;
> -    uint32_t count;
> -    int e;
> -
> -    e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count, &fpi_size);
> -    if ( e )
> -    {
> -        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
> -        goto out;
> -    }
> -
> -    if ( count >=3D UINT16_MAX )
> -    {
> -        printk(XENLOG_ERR "ffa: Impossible number of SPs: %u\n", count);
> -        goto out;
> -    }
> -
> -    ret =3D init_subscribers(ffa_rx, count);
> -
> -out:
> -    ffa_rx_release();
> -
> -    return ret;
> -}
> -
> static bool ffa_probe(void)
> {
>     uint32_t vers;
> @@ -949,7 +612,7 @@ static bool ffa_probe(void)
>     }
>     ffa_version =3D vers;
>=20
> -    if ( !init_sps() )
> +    if ( !ffa_partinfo_init() )
>         goto err_free_ffa_tx;
>=20
>     INIT_LIST_HEAD(&ffa_teardown_head);
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> new file mode 100644
> index 000000000000..dc1059584828
> --- /dev/null
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -0,0 +1,373 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024  Linaro Limited
> + */
> +
> +#include <xen/const.h>
> +#include <xen/sizes.h>
> +#include <xen/types.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/regs.h>
> +
> +#include "ffa_private.h"
> +
> +/* Partition information descriptor defined in FF-A-1.0-REL */
> +struct ffa_partition_info_1_0 {
> +    uint16_t id;
> +    uint16_t execution_context;
> +    uint32_t partition_properties;
> +};
> +
> +/* Partition information descriptor defined in FF-A-1.1-REL0 */
> +struct ffa_partition_info_1_1 {
> +    uint16_t id;
> +    uint16_t execution_context;
> +    uint32_t partition_properties;
> +    uint8_t uuid[16];
> +};
> +
> +/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
> +static uint16_t *subscr_vm_created __read_mostly;
> +static uint16_t subscr_vm_created_count __read_mostly;
> +static uint16_t *subscr_vm_destroyed __read_mostly;
> +static uint16_t subscr_vm_destroyed_count __read_mostly;
> +
> +static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t=
 w3,
> +                                      uint32_t w4, uint32_t w5, uint32_t=
 *count,
> +                                      uint32_t *fpi_size)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_PARTITION_INFO_GET,
> +        .a1 =3D w1,
> +        .a2 =3D w2,
> +        .a3 =3D w3,
> +        .a4 =3D w4,
> +        .a5 =3D w5,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +    uint32_t ret;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    ret =3D ffa_get_ret_code(&resp);
> +    if ( !ret )
> +    {
> +        *count =3D resp.a2;
> +        *fpi_size =3D resp.a3;
> +    }
> +
> +    return ret;
> +}
> +
> +int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t=
 w3,
> +                                      uint32_t w4, uint32_t w5, uint32_t=
 *count,
> +                                      uint32_t *fpi_size)
> +{
> +    int32_t ret =3D FFA_RET_DENIED;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    /*
> +     * FF-A v1.0 has w5 MBZ while v1.1 allows
> +     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
> +     *
> +     * FFA_PARTITION_INFO_GET_COUNT is only using registers and not the
> +     * rxtx buffer so do the partition_info_get directly.
> +     */
> +    if ( w5 =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
> +         ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
> +        return ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_siz=
e);
> +    if ( w5 )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( !ffa_rx )
> +        return FFA_RET_DENIED;
> +
> +    if ( !spin_trylock(&ctx->rx_lock) )
> +        return FFA_RET_BUSY;
> +
> +    if ( !ctx->page_count || !ctx->rx_is_free )
> +        goto out;
> +    spin_lock(&ffa_rx_buffer_lock);
> +    ret =3D ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_size);
> +    if ( ret )
> +        goto out_rx_buf_unlock;
> +    /*
> +     * ffa_partition_info_get() succeeded so we now own the RX buffer we
> +     * share with the SPMC. We must give it back using ffa_rx_release()
> +     * once we've copied the content.
> +     */
> +
> +    if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
> +    {
> +        size_t n;
> +        struct ffa_partition_info_1_1 *src =3D ffa_rx;
> +        struct ffa_partition_info_1_0 *dst =3D ctx->rx;
> +
> +        if ( ctx->page_count * FFA_PAGE_SIZE < *count * sizeof(*dst) )
> +        {
> +            ret =3D FFA_RET_NO_MEMORY;
> +            goto out_rx_release;
> +        }
> +
> +        for ( n =3D 0; n < *count; n++ )
> +        {
> +            dst[n].id =3D src[n].id;
> +            dst[n].execution_context =3D src[n].execution_context;
> +            dst[n].partition_properties =3D src[n].partition_properties;
> +        }
> +    }
> +    else
> +    {
> +        size_t sz =3D *count * *fpi_size;
> +
> +        if ( ctx->page_count * FFA_PAGE_SIZE < sz )
> +        {
> +            ret =3D FFA_RET_NO_MEMORY;
> +            goto out_rx_release;
> +        }
> +
> +        memcpy(ctx->rx, ffa_rx, sz);
> +    }
> +    ctx->rx_is_free =3D false;
> +out_rx_release:
> +    ffa_rx_release();
> +out_rx_buf_unlock:
> +    spin_unlock(&ffa_rx_buffer_lock);
> +out:
> +    spin_unlock(&ctx->rx_lock);
> +
> +    return ret;
> +}
> +
> +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> +                                      uint8_t msg)
> +{
> +    uint32_t exp_resp =3D FFA_MSG_FLAG_FRAMEWORK;
> +    unsigned int retry_count =3D 0;
> +    int32_t res;
> +
> +    if ( msg =3D=3D FFA_MSG_SEND_VM_CREATED )
> +        exp_resp |=3D FFA_MSG_RESP_VM_CREATED;
> +    else if ( msg =3D=3D FFA_MSG_SEND_VM_DESTROYED )
> +        exp_resp |=3D FFA_MSG_RESP_VM_DESTROYED;
> +    else
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    do {
> +        const struct arm_smccc_1_2_regs arg =3D {
> +            .a0 =3D FFA_MSG_SEND_DIRECT_REQ_32,
> +            .a1 =3D sp_id,
> +            .a2 =3D FFA_MSG_FLAG_FRAMEWORK | msg,
> +            .a5 =3D vm_id,
> +        };
> +        struct arm_smccc_1_2_regs resp;
> +
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        if ( resp.a0 !=3D FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 !=3D ex=
p_resp )
> +        {
> +            /*
> +             * This is an invalid response, likely due to some error in =
the
> +             * implementation of the ABI.
> +             */
> +            return FFA_RET_INVALID_PARAMETERS;
> +        }
> +        res =3D resp.a3;
> +        if ( ++retry_count > 10 )
> +        {
> +            /*
> +             * TODO
> +             * FFA_RET_INTERRUPTED means that the SPMC has a pending
> +             * non-secure interrupt, we need a way of delivering that
> +             * non-secure interrupt.
> +             * FFA_RET_RETRY is the SP telling us that it's temporarily
> +             * blocked from handling the direct request, we need a gener=
ic
> +             * way to deal with this.
> +             * For now in both cases, give up after a few retries.
> +             */
> +            return res;
> +        }
> +    } while ( res =3D=3D FFA_RET_INTERRUPTED || res =3D=3D FFA_RET_RETRY=
 );
> +
> +    return res;
> +}
> +
> +static void uninit_subscribers(void)
> +{
> +        subscr_vm_created_count =3D 0;
> +        subscr_vm_destroyed_count =3D 0;
> +        XFREE(subscr_vm_created);
> +        XFREE(subscr_vm_destroyed);
> +}
> +
> +static bool init_subscribers(struct ffa_partition_info_1_1 *fpi, uint16_=
t count)
> +{
> +    uint16_t n;
> +    uint16_t c_pos;
> +    uint16_t d_pos;
> +
> +    subscr_vm_created_count =3D 0;
> +    subscr_vm_destroyed_count =3D 0;
> +    for ( n =3D 0; n < count; n++ )
> +    {
> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> +            subscr_vm_created_count++;
> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED=
 )
> +            subscr_vm_destroyed_count++;
> +    }
> +
> +    if ( subscr_vm_created_count )
> +        subscr_vm_created =3D xzalloc_array(uint16_t, subscr_vm_created_=
count);
> +    if ( subscr_vm_destroyed_count )
> +        subscr_vm_destroyed =3D xzalloc_array(uint16_t,
> +                                            subscr_vm_destroyed_count);
> +    if ( (subscr_vm_created_count && !subscr_vm_created) ||
> +         (subscr_vm_destroyed_count && !subscr_vm_destroyed) )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\n"=
);
> +        uninit_subscribers();
> +        return false;
> +    }
> +
> +    for ( c_pos =3D 0, d_pos =3D 0, n =3D 0; n < count; n++ )
> +    {
> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> +            subscr_vm_created[c_pos++] =3D fpi[n].id;
> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED=
 )
> +            subscr_vm_destroyed[d_pos++] =3D fpi[n].id;
> +    }
> +
> +    return true;
> +}
> +
> +
> +
> +bool ffa_partinfo_init(void)
> +{
> +    bool ret =3D false;
> +    uint32_t fpi_size;
> +    uint32_t count;
> +    int e;
> +
> +    e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count, &fpi_size);
> +    if ( e )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
> +        goto out;
> +    }
> +
> +    if ( count >=3D UINT16_MAX )
> +    {
> +        printk(XENLOG_ERR "ffa: Impossible number of SPs: %u\n", count);
> +        goto out;
> +    }
> +
> +    ret =3D init_subscribers(ffa_rx, count);
> +
> +out:
> +    ffa_rx_release();
> +
> +    return ret;
> +}
> +
> +static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> +                              uint16_t end, uint16_t sp_id)
> +{
> +    unsigned int n;
> +
> +    for ( n =3D start; n < end; n++ )
> +    {
> +        if ( subscr[n] =3D=3D sp_id )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> +static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
> +                                   unsigned int create_signal_count)
> +{
> +    unsigned int n;
> +
> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> +    {
> +        /*
> +         * Skip SPs subscribed to the VM created event that never was
> +         * notified of the VM creation due to an error during
> +         * ffa_domain_init().
> +         */
> +        if ( is_in_subscr_list(subscr_vm_created, create_signal_count,
> +                               subscr_vm_created_count,
> +                               subscr_vm_destroyed[n]) )
> +            continue;
> +
> +        set_bit(n, ctx->vm_destroy_bitmap);
> +    }
> +}
> +
> +bool ffa_partinfo_domain_init(struct domain *d)
> +{
> +    unsigned int count =3D BITS_TO_LONGS(subscr_vm_destroyed_count);
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    unsigned int n;
> +    int32_t res;
> +
> +    ctx->vm_destroy_bitmap =3D xzalloc_array(unsigned long, count);
> +    if ( !ctx->vm_destroy_bitmap )
> +        return false;
> +
> +    for ( n =3D 0; n < subscr_vm_created_count; n++ )
> +    {
> +        res =3D ffa_direct_req_send_vm(subscr_vm_created[n], ffa_get_vm_=
id(d),
> +                                     FFA_MSG_SEND_VM_CREATED);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %=
u to  %u: res %d\n",
> +                   ffa_get_vm_id(d), subscr_vm_created[n], res);
> +            break;
> +        }
> +    }
> +    vm_destroy_bitmap_init(ctx, n);
> +
> +    return n =3D=3D subscr_vm_created_count;
> +}
> +
> +bool ffa_partinfo_domain_destroy(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    unsigned int n;
> +    int32_t res;
> +
> +    if ( !ctx->vm_destroy_bitmap )
> +        return true;
> +
> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> +    {
> +        if ( !test_bit(n, ctx->vm_destroy_bitmap) )
> +            continue;
> +
> +        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], ffa_get_v=
m_id(d),
> +                                     FFA_MSG_SEND_VM_DESTROYED);
> +
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "%pd: ffa: Failed to report destruction of=
 vm_id %u to %u: res %d\n",
> +                   d, ffa_get_vm_id(d), subscr_vm_destroyed[n], res);
> +        }
> +
> +        /*
> +         * For these two error codes the hypervisor is expected to resen=
d
> +         * the destruction message. For the rest it is expected that the
> +         * error is permanent and that is doesn't help to resend the
> +         * destruction message.
> +         */
> +        if ( res !=3D FFA_RET_INTERRUPTED && res !=3D FFA_RET_RETRY )
> +            clear_bit(n, ctx->vm_destroy_bitmap);
> +    }
> +
> +    if ( bitmap_empty(ctx->vm_destroy_bitmap, subscr_vm_destroyed_count)=
 )
> +        XFREE(ctx->vm_destroy_bitmap);
> +
> +    return !ctx->vm_destroy_bitmap;
> +}
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index f3e2f42e573e..6b32b69cfe90 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -244,7 +244,7 @@ struct ffa_ctx {
>      * Used for ffa_domain_teardown() to keep track of which SPs should b=
e
>      * notified that this guest is being destroyed.
>      */
> -    unsigned long vm_destroy_bitmap[];
> +    unsigned long *vm_destroy_bitmap;
> };
>=20
> extern void *ffa_rx;
> @@ -256,6 +256,13 @@ bool ffa_shm_domain_destroy(struct domain *d);
> void ffa_handle_mem_share(struct cpu_user_regs *regs);
> int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
>=20
> +bool ffa_partinfo_init(void);
> +bool ffa_partinfo_domain_init(struct domain *d);
> +bool ffa_partinfo_domain_destroy(struct domain *d);
> +int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t=
 w3,
> +                                      uint32_t w4, uint32_t w5, uint32_t=
 *count,
> +                                      uint32_t *fpi_size);
> +
>=20
> static inline uint16_t ffa_get_vm_id(const struct domain *d)
> {
> @@ -325,4 +332,9 @@ static inline int32_t ffa_simple_call(uint32_t fid, r=
egister_t a1,
>     return ffa_get_ret_code(&resp);
> }
>=20
> +static inline int32_t ffa_rx_release(void)
> +{
> +    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> +}
> +
> #endif /*__FFA_PRIVATE_H__*/
> --=20
> 2.34.1
>=20


