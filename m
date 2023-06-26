Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DBC73E24A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 16:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555567.867443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDnMh-000567-SR; Mon, 26 Jun 2023 14:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555567.867443; Mon, 26 Jun 2023 14:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDnMh-00054B-Pi; Mon, 26 Jun 2023 14:38:51 +0000
Received: by outflank-mailman (input) for mailman id 555567;
 Mon, 26 Jun 2023 14:38:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCbL=CO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qDnMg-000545-If
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 14:38:50 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28382318-142f-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 16:38:47 +0200 (CEST)
Received: from DU2P251CA0030.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::30)
 by PA4PR08MB6016.eurprd08.prod.outlook.com (2603:10a6:102:e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 14:38:41 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::46) by DU2P251CA0030.outlook.office365.com
 (2603:10a6:10:230::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 14:38:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.15 via Frontend Transport; Mon, 26 Jun 2023 14:38:40 +0000
Received: ("Tessian outbound 7c913606c6e6:v142");
 Mon, 26 Jun 2023 14:38:40 +0000
Received: from 5a94b628fb86.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5342CE41-3376-49E2-966A-FD100A29CD67.1; 
 Mon, 26 Jun 2023 14:38:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a94b628fb86.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Jun 2023 14:38:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9479.eurprd08.prod.outlook.com (2603:10a6:20b:5ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 14:38:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 14:38:33 +0000
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
X-Inumbo-ID: 28382318-142f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjZb7Cxr7kYTBm43aobBHPpZfLcwdpqGYl5mGGIPGZo=;
 b=kPcBTC6pFxTfMY/sSuF2Qz7euwMe7uFFPT3OK/NAKWgQcIpdiWrzMRiJI8gB8OHSLGsTKoN9CTxm3VMWz4CAq9bWWuX4pBz5Cv3/4NY4Kq4LzpWMRJnd+HBGJMeb8BqJcxLMku15qI7jxwCILIoB423EYkxXYeLK0Z9yf4V4Dz4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPLDsKylJGOBSRS68B7s3JiRAxI6D+BWUuzPeZhs66zromdGA8Y7SyWeCMhhfulwhB9qR73huIM3Ma0M86qVh0BlA0GBmoeJau/kMBMa0Iuofp2aYQ98TTThd7d/Rdv5reFm8ZZe0QJjkMJH3rKe3RVuZYJt3CDGo9zQpZgGB1f6iEHyfWX9PmXolrdsxoZDhQFcK2XbxwnIfnfmI7knm/jtZiFTbq5lZULgAH5sy5xBpV8SwXWNw8upzoQHNJNRurU3jA3543rYWxQdfDyaE+PCMUmaiHfLzoKKPq7WxRXmaJfGM8r1NxZ1NH8MBw6/28QWOSvjtOY8xbFRnhV7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjZb7Cxr7kYTBm43aobBHPpZfLcwdpqGYl5mGGIPGZo=;
 b=nSRCiTo1W15LyAG+5DiriMl7DI2dxG9bzhwvsFVgSCw7VttXqvZV0mSYKn4dLGM8fNAou1KWgHMSnsSGPcC4KSbbZhE8wLu12R1c8emNJ1s0Di0f+F9Bls9HwjDp8pG4aO2jD9Qi3xwQWXNy7rWC+0do2M33VpJXlLrbUY+oBdksHiav6h9COv3hgCNH5EkxMY4sPHKfbv5HBxVxdDrQ4kC1KN0yyFWZ2YIvccxjk/EW78FSsP5AjBuKJ2B7ZigKwjUgka1immO/pnxzjS2XEnZIL+bJ+cUyFiAo9OnjS0XP5lHdijdqeUkDTJHubCj3TLr6C7PoxDdZ/oHO1abdpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjZb7Cxr7kYTBm43aobBHPpZfLcwdpqGYl5mGGIPGZo=;
 b=kPcBTC6pFxTfMY/sSuF2Qz7euwMe7uFFPT3OK/NAKWgQcIpdiWrzMRiJI8gB8OHSLGsTKoN9CTxm3VMWz4CAq9bWWuX4pBz5Cv3/4NY4Kq4LzpWMRJnd+HBGJMeb8BqJcxLMku15qI7jxwCILIoB423EYkxXYeLK0Z9yf4V4Dz4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 0/9] xen/arm: Enable UBSAN support
Thread-Topic: [PATCH 0/9] xen/arm: Enable UBSAN support
Thread-Index: AQHZp6aHjOc4oNmRbEG6FK4/WdqFwa+dJu5Q
Date: Mon, 26 Jun 2023 14:38:33 +0000
Message-ID:
 <AS8PR08MB79919094811045E4FF27A9639226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230625204907.57291-1-julien@xen.org>
In-Reply-To: <20230625204907.57291-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A3C28D4811AEF14CAB02AB5A9D8A2C3B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9479:EE_|DBAEUR03FT009:EE_|PA4PR08MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a55b36-97ac-43f9-d68c-08db765308fc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mOyX5Q0OtURGPTxOqmQYa6Oxc7M5sqSEE5j/grYqjJhQ18vRDRGT2jXP2shF5G1FggVpcb9z/6AYWc8pBPL4CHQAjNnfHzYXNGoKYTlPx483hOVvFl24jXBifthgri1Ey8KSdULFZSzq0KxsDAYky4fzOxfWLXezM5fh5Yw07bIJOJPPyqmVd4eu46+NDZtBdZOBNZEtaXk9vRjS2poWWdQL++Kl+98t7KowCeuRwfqs5QPKyaBXpTbk/FV02uCtsX3IMOdaOwzdzI+RvYCBeD+1e/2r9e6JvD+8LitB9m2FanY6+zYjm4FDP1wl8+fT0poKF2DNiOw+Nwt9d6MwV4xc1CousyQSAa2MwZ/LVH+4OVcXMG0JDPYrSY7cRsuLvlYGcP6NTT+Xrxbf68vaO4OFeYlTqjuTLeUJwkmrDlscJZizI6M4lI62X1I4ujHNhm7CFiVwZ2+dZgAgWv+gA8kQZw6Qh9IYm/u3fyMknpOP5al8eRTzeuUAhD2Rw31gwNzyau2pX5nS28aG7MsduCRqjODSDz31D++epY+wZQ2elWtXRgZPhV8Vkavz0Q5raJAl3mHIb6ls97n2YOANKawgUXkKvO3uQ5bxIsiexbewHsfRWDIMo/O1Tri3xPNm
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199021)(110136005)(71200400001)(83380400001)(54906003)(478600001)(7696005)(26005)(186003)(6506007)(9686003)(2906002)(5660300002)(52536014)(33656002)(38100700002)(122000001)(316002)(55016003)(76116006)(66946007)(8936002)(8676002)(41300700001)(66446008)(86362001)(4326008)(66476007)(64756008)(66556008)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9479
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b62e84e-d7b2-47c5-2ea3-08db7653047d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sIlFFvEDBZ7G3uy196Lv/s4tWw2KEJGWgBikLnkPwPtrw10y26FJZTm0JeCr2JvWJcUolpwtgsEpNEznBbobS7HavI6EIrKg86lwvtiIx1hG8PxvikCu5MhNIXUG0N2BdR4+9ONpzv5uVND2JTwOzWZw3DlkqtZftdpmo90qLQ0NUpxXraRKNebrJu0++T8s72NdiNTS67rHuUGr04k++bVTQ5TIDj6c3XBHlbB+5BqYrvxFeyMv6Q+2ky2oPfk1EG8HWDVl8bV5KoC+SPaMln2FqWJ13RfgppI5acS7Hd47xadK9jS13KtgDCgsZoHek4Zs/MacB4+RKMdX0TjhcWJuioMmbNyRC2yUTj8Nxm0ln1TudzVbdCwZ3JyhbyTW8sBlAi8XyQsS0HVrmX0VxddJ49k31ozujyHKGOWaQOHVU2yDXDTC2naY1JHtXr6J1vu1ehb/LZbI3A/SMHyyR69FibiN7fUseAHDkm6MyftPME/DEuSti/IERhICWeP8MFiihhx9zQvK6YBo3asHl91g9H9W+1fi57KFfJxv/5hD2XQYllNcOsQf1Uk213rC8nsrX4ugNLSGFsbpHUE+x+Pcvj3n7AzUlYOTuct2zA/Bt3iUC9JDjWyt3bVaTLFtvzsKZiDdhapwh3uEgfDfxIi2MXsUI39nT5cJQi4krLbMe3qeZEjMR8Mt/1XcmzD0ubI/YkGf3y2rvNoVZmmX5eg74plZ3InnhRV/0Arkzzrff3oQ+quQQSKDNGOGRz0E
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39850400004)(451199021)(46966006)(36840700001)(40470700004)(110136005)(7696005)(478600001)(54906003)(33656002)(107886003)(2906002)(9686003)(186003)(6506007)(26005)(82310400005)(316002)(70206006)(52536014)(8676002)(41300700001)(5660300002)(70586007)(8936002)(81166007)(356005)(4326008)(40460700003)(86362001)(82740400003)(55016003)(36860700001)(83380400001)(47076005)(40480700001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 14:38:40.8051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a55b36-97ac-43f9-d68c-08db765308fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6016

Hi Julien,

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Subject: [PATCH 0/9] xen/arm: Enable UBSAN support
>=20
> Julien Grall (9):
>   xen/arm: Check Xen size when linking
>   xen/arm64: head: Don't map too much in boot_third
>   xen/arm32: head: Don't map too much in boot_third
>   xen/arm32: head: Remove 'r6' from the clobber list of
>     create_page_tables()
>   xen/arm: Rework the code mapping Xen to avoid relying on the size of
>     Xen
>   xen/arm64: entry: Don't jump outside of an alternative
>   xen/arm64: head: Rework PRINT() to work when the string is not withing
>     +/- 1MB
>   xen/arm: Allow the user to build Xen with USBAN
>   xen/arm32: vfp: Add missing U for shifted constant

I put the series in our CI this morning and I can now confirm each of these
patches will not breaking existing current Xen functionality, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

I put the tag in the cover letter to avoid the spamming mails in the mailin=
g
list. Feel free to apply the tag to each commit if you want to.

Kind regards,
Henry


