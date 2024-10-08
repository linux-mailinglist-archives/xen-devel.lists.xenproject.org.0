Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA938993EA5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 08:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812640.1225420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3Xe-0003i5-SF; Tue, 08 Oct 2024 06:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812640.1225420; Tue, 08 Oct 2024 06:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3Xe-0003fa-P6; Tue, 08 Oct 2024 06:17:54 +0000
Received: by outflank-mailman (input) for mailman id 812640;
 Tue, 08 Oct 2024 06:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gcc3=RE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sy3Xd-0003fU-9d
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 06:17:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [2a01:111:f403:2613::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b719ea6-853d-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 08:17:50 +0200 (CEST)
Received: from DUZPR01CA0212.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::18) by PAWPR08MB9124.eurprd08.prod.outlook.com
 (2603:10a6:102:330::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 06:17:44 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::a6) by DUZPR01CA0212.outlook.office365.com
 (2603:10a6:10:4b4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Tue, 8 Oct 2024 06:17:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8048.13
 via Frontend Transport; Tue, 8 Oct 2024 06:17:42 +0000
Received: ("Tessian outbound 10d5cea79515:v473");
 Tue, 08 Oct 2024 06:17:42 +0000
Received: from Le56475db8645.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C9F59641-B9EE-4605-82E1-00DAC4D64958.1; 
 Tue, 08 Oct 2024 06:17:36 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le56475db8645.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Oct 2024 06:17:36 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB5PR08MB10140.eurprd08.prod.outlook.com (2603:10a6:10:4a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 06:17:33 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 06:17:33 +0000
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
X-Inumbo-ID: 0b719ea6-853d-11ef-a0bc-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EQt9qOzPEbNEkzqT15jdMv91IL0h/ld7Uluywo1akD/K5Btz9S9+g+NXaATS8mVHGujfTMvQbGRBqfd6fP8isrs6an7KEqUuGsfbqAxFPw2ge+yMvmgfcLBo/MxQ56F4Ib/Eui8ZXsfcmzRnJ04cETmA9S+VOLpQ+61DveXO+qauOs6f00MDesOVTKJXCbaVDavJGjv0k3IIL5TcbwlTRJmdaCshRVcYgZGGshRbJ3479OgQF0Zt04vPU1An5nMoRNGcRjzeQgmLs+2TG0vDj2yR0ywa2EiJeka7GCI1JyDMCucaHcKMhqoMsTYEB2UBgWzMlXCM1TgIGUDS/aQeug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmHOosmyx3g03xqTXPYVlO8bD47vn9U8JlbRp0R9hfc=;
 b=DYOUUNpGosFdzw9KJ/hockBg4SdZfbCzjUDEAYfYhfHucwFYdp5fJW6+GvvcmAwy2k1QPv1QPLegxXdkxRHpjUmqXT+ohOdA9jDz4wSygg7lG93b5svlK05jcS6ERq1Jc5talji1On5VMxvrR+Oe925XMwc+C91CsvrVhN7I6xv6qyE2YAbsimiTCiXqVH2Hyvpv5NICFnrLttm7Z+n2WAXlMEQZ8+NRvz+rO9PT5wvWDzSw+Hz5mNTnwOtORfFN2NGugrkwi2xii7t5ToUH3qm0GTsjT+4ahiEJudnVoBTHezfdM4AhaqjYQiF7IaJ+62jIT/FnsuJHumf2BFAQ1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmHOosmyx3g03xqTXPYVlO8bD47vn9U8JlbRp0R9hfc=;
 b=Kka2YI+Kt31DLbqz+LpH7Ia4fBBuwkSp05Y1ds/0Y1tFOjqJ6SUsVx6DmAYHojp9XqVb6O3aqiSlKuV4Z6HA8cSu/o36s11FcuS3ZXwin+PNZ+paI8pTMQZXn6Lw5V2kjOY4WgoVDmvQXg8bmO9kwbzdHqkT500IpendYsDU2us=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 50acfd5d732232b0
X-TessianGatewayMetadata: PAfQxwn6/M2vCfzlqSnFBQOYe5Cvzzn+3BBlRytkaghIS5LUjYSg0eZoco5EPRRNvFQW0ZDz66q+TSHSNWmAhyhteNfE0AF4HhcfHleuNGvKyGuI1KPGr7gJZlzIZe11zT7rVFSbKdrtVSyiPEaxOItmZF3khtvpe2fSu94/jfk=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5dlA8HAe7bJ9TxD+KFwzsL2ze+w4m6HQyHOrRo5SaeTeCQPz8tOrWZl7MTm2GRUN65f1Jw5ZXMl0dJCMKfYAMOAx+VAcHIxJKEWL2x5X506tlq6mbTAkaSrEq4GcTGwv3vg4urNznOPrQQGrGqi3qD2wbqPa/KiqVdYOucLQPeQZLOPvGCjt9BWhoxvvtRzTjS3AaLg2Z3DVmh5Y4hoGerX1nLpzwBWND8lCDHroSAzyVYCH73w3Rb5NSCD8R1P4lT0Hq7bRKHh3r4VZZ5Xfp2Lmv17VxTQ44hmTSrm0BTlMT/8sE5XuQyblbfSgcFR+alDetVj0am53nXxyi+3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmHOosmyx3g03xqTXPYVlO8bD47vn9U8JlbRp0R9hfc=;
 b=tFXTBVL69PoZ+6tvYlmWmiqWnCwo3Lw48vtGDPdWxIEgvP4oyfh4Yxy19lO+AL1uQ73qOPZ/VMaKeFfb9tl8gahSlAnqQVkK8IWIwSlWZf6kdNOJZPEBP6EN1C5b9PhXaactce/siB/Z+DuajfU7vC6GaB5tVh9tvQDfFQfOL5LCO+7UB3Xoiduhsoo8rGvyIO6ujdtcxpgAYqpn7DPrFxR6SCzDEa/WdGoS0kFMiP02mPV+MwphztLBDlXDA16Nin+UjwZn2BrHXwIfhLEEYgXQuR8AQ9Ah0jZUBbv7mGHybKdtS76XHQwL6VT3iHH42gW6K7VwOGKTNdt03ju1mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmHOosmyx3g03xqTXPYVlO8bD47vn9U8JlbRp0R9hfc=;
 b=Kka2YI+Kt31DLbqz+LpH7Ia4fBBuwkSp05Y1ds/0Y1tFOjqJ6SUsVx6DmAYHojp9XqVb6O3aqiSlKuV4Z6HA8cSu/o36s11FcuS3ZXwin+PNZ+paI8pTMQZXn6Lw5V2kjOY4WgoVDmvQXg8bmO9kwbzdHqkT500IpendYsDU2us=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>, Hisao
 Munakata <hisao.munakata.vt@renesas.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
Thread-Topic: [PATCH] docs: fusa: Add requirements for Device Passthrough
Thread-Index: AQHbGOqFqldnvX8xNEmI4LnFnImSpbJ8YaSA
Date: Tue, 8 Oct 2024 06:17:33 +0000
Message-ID: <6E89CC97-C7E3-40DF-8BFA-5F3065429F54@arm.com>
References: <20241007185508.3044115-1-olekstysh@gmail.com>
In-Reply-To: <20241007185508.3044115-1-olekstysh@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB5PR08MB10140:EE_|DU2PEPF00028D0A:EE_|PAWPR08MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f98dca-c826-4965-15f1-08dce760eb0f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?QstxkUuzduhj2S3VUAK5ChJnC31xX6r24kszYa8ohT+hBiqA9Bn4r3vx82qA?=
 =?us-ascii?Q?8KhJyvm3j565rSeXE11tGJBPRCg6kMpOJJsWFobY8+tnHyZJuIXmusJ7qQC6?=
 =?us-ascii?Q?CmM4I0f1axLb3iY6OK8SXdLUp8WYESiyXeDqCjBS2irzbqdkjN9TvjHof7WA?=
 =?us-ascii?Q?Mg7d1qwbltbC9FXE6MoQH1wAJBhdFpaQeJjYrVEYV7iEAkPY5COo4uUaBbr4?=
 =?us-ascii?Q?FZdb65E9rZFT+SnTTvRdF5IUrAlrCXb2kZ9meksm5aHjX0DuGPMC52UzS4Bh?=
 =?us-ascii?Q?heYo44xAAYr6umkXa+9qaoxzopjgR2du6UPWB/sXSsRo3Qz7k4RcRM6uUizG?=
 =?us-ascii?Q?Ctse0Mo0dzgrjB30ZWc0JiHPbl0QWULx1ogQCFe4gd8q+OBzrWU6nzH0iZUg?=
 =?us-ascii?Q?afskoDXlxERZNZ2PadUCeayT7S91l1qLuDv83+RHL38KDxQtmpWkTcBoz/pC?=
 =?us-ascii?Q?ytO4PEa3hE7XLJ5+mR0S42xiqufWobVuP2mnHrza77I9etdNhV7qE8kl0KdH?=
 =?us-ascii?Q?YAOzvZC5qQ981OeOv54vDqpcK/zCZtNQxvxmGCEw0/tyfiG+taaVjp0nQgub?=
 =?us-ascii?Q?Zsthc2uEkFEO/dspBlhrJSq4FNGX1hVrfFL+ySq1L4oQkO4S6scCI5Fc4xum?=
 =?us-ascii?Q?qm4nPbNdbjA2pof/w/uLwUFdDnW/vivqh8tKGc2W2Agdnk1k5T+MwlgvDCnn?=
 =?us-ascii?Q?sqlTAbM5kX+8TYTp60f4ydiIRlaQDBe4PwtPRCyTetNFmpoTop/JD1edg2O6?=
 =?us-ascii?Q?SvWye7J2C7do7uDiTt3r3ocQ/f4R+AIZUvwq52QX772V+Bay3iCqsE612kfV?=
 =?us-ascii?Q?+WYYx91XtWgpLAr5cRiRn7BfXLP7H5vYnmeNjWWBZJf5NLkigros2oqrZKce?=
 =?us-ascii?Q?FFdgSGgOwNEwqRanLY8TLNQ9zkyz/cviJ9Rk8CQoZZnCDo4eg8w7jb3zO2ko?=
 =?us-ascii?Q?dyhRGfLsvex8DvXD70N7ry8+8iFNEQqOY3YBVCsh1nOyczz6peTnuU8iIjZr?=
 =?us-ascii?Q?AxvulNUenQswKFh+dBegbcMShTMLT7lUUoXwM6Wh8C+p2tDQ/gPolAZU0z8Q?=
 =?us-ascii?Q?CDrYP6xEF1se4+DdNwu3/eG723p+7/CQk5lw3ZLKnfgPYQj9yl2dof6ZI6pQ?=
 =?us-ascii?Q?b7qeQA9AHlx/5WJVT6Ma1yl34DZ2vAn2DOJXiVbwaxBaxdTHHL1ifus0IwF+?=
 =?us-ascii?Q?OsdIzz5ZGhZcXpLFiGY7yhF2rVVPgoswt/JuEN1x5Wtdclcb4VrJVb2ES0PM?=
 =?us-ascii?Q?fWAguRKYoV6y57NEfD+hTdcRlXw1Fv9JWt7YSYIIpQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <307CF8282DD7C84FAA4B6D2547E23402@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10140
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa5865aa-789f-491a-6a27-08dce760e5ba
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|35042699022|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gh2mp016HaMe9ytM45a00oUdsIuA+ZT/bEMvvnKclmqcJih/UfGPDOeuUndp?=
 =?us-ascii?Q?7ANXY4IW61PPaQwvArkBjALIID3Mtt3B2t+jlHCH4QO3y10drldcsTnUsFye?=
 =?us-ascii?Q?qDyuWwMrCSbUsHGkWYLwSdwkFDQRArRqGvL6CTAPzmWChib7ekwNBN/D56kr?=
 =?us-ascii?Q?gQHrdLbUm9nN/AiyjtTR4y/0NaxgkOBOdx41OJ3zT8g4EWQS3mcWvXJ2z3fF?=
 =?us-ascii?Q?SSFk5KDK9XnZzbLFHV4bpRFecaRurW1LZDK9OdUr4gCV/VGEg7XpeM4gzXR4?=
 =?us-ascii?Q?25F51GckSgWLWtUKpZqqJZle3mHWYGQ0UJupX3bf0caB8sFAq2MfahFtUuQf?=
 =?us-ascii?Q?Xn27TBzs00Gpf843++Yp0eKf4IVc0BB1ZacuXvXKhRQV84+l6xrgc8PHSXqH?=
 =?us-ascii?Q?ijqSW35HG6be5pSPIl7wtWMemRMjTExD9yTo8+Dx2sCOnnEJL3wAqF6RfNDH?=
 =?us-ascii?Q?ViKkTVt3exxykAujccBSe6el+ljI6HM3GaRAMFU/pUTxzcVpVlMtsERcUbNu?=
 =?us-ascii?Q?26aKo03YdVZfvXeWV/+YVsa4QeOcPDq/bU9cjYUnxq1DSJVxf9iq6JmW/wFF?=
 =?us-ascii?Q?PZDBtHHcJGfBm9Y/oJiK4uyyZcuOtanCOoxhmdL0vWl8awmaSUbxUW7+QrM/?=
 =?us-ascii?Q?wIJVrJymLg2kfa1aOLZ3RChWExCNV5Vs3C7viLIpzIl3L8W+eJdcFHu4h3Si?=
 =?us-ascii?Q?Sy387cmmRBuEDU7mYrTKO3rt0RB2RwPR1iPyVo5rEmt0eCN1U4+hqPXHWWCF?=
 =?us-ascii?Q?3U1gqPPOxoUGSkdNSjIVouSsxk+3oGtsKY2dilLRS9aVnoMU8wlfmuINH14S?=
 =?us-ascii?Q?0ZhvhHrBsoiLwf7ZPg32dJm3WKacrBAv16UM+Qg0YHhaC2g0PpLmDr5QSliB?=
 =?us-ascii?Q?lTgycyxIWUxoHD/VS6WyCOO/YnwwaZmkgjx5+PVQPaBHxRwZm6+F8acDvgHi?=
 =?us-ascii?Q?2AJlJiUauvtYtjwa+qrLVwlSE/u4XH801RAhL26UpFQVOKTAM+2WFvIj+NEJ?=
 =?us-ascii?Q?tdvMjjP8wBbRpTFgsJlVjiuu3lo6K1lycA/O+O85R26T7RTXgFStY/ay6VzM?=
 =?us-ascii?Q?SFuj8JYMVKkFCzA+eQAzYaXnhxeg4GJ1UuC4T/uO9fsmgLCoHxf3MKm0FQqu?=
 =?us-ascii?Q?lA+tFsbl6Sd/3PXZU4I6zAIt0mYXA8GB6iibdvLs1cuRRDJdfTyr84ui+oVx?=
 =?us-ascii?Q?my2Y1patOclFQhzf6ZcDy+C3emRVMzveRceeSiWfZAOXu3KhftXi1dCwihSF?=
 =?us-ascii?Q?UJ4FVKcIF8QThSoXkhOotuiW75e2kaYeq8F1NCQuUM6efJKc6gF2wwk+IITH?=
 =?us-ascii?Q?zXREQmCG28xIJgTiGiG2fr0i?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 06:17:42.6122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f98dca-c826-4965-15f1-08dce760eb0f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9124

Hi,

> On 7 Oct 2024, at 20:55, Oleksandr Tyshchenko <olekstysh@gmail.com> wrote=
:
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Add common requirements for a physical device assignment to Arm64
> and AMD64 PVH domains.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Based on:
> [PATCH] docs: fusa: Replace VM with domain
> https://patchew.org/Xen/20241007182603.826807-1-ayan.kumar.halder@amd.com=
/
> ---
> ---
> .../reqs/design-reqs/common/passthrough.rst   | 365 ++++++++++++++++++
> docs/fusa/reqs/index.rst                      |   1 +
> docs/fusa/reqs/market-reqs/reqs.rst           |  33 ++
> docs/fusa/reqs/product-reqs/common/reqs.rst   |  29 ++
> 4 files changed, 428 insertions(+)
> create mode 100644 docs/fusa/reqs/design-reqs/common/passthrough.rst
> create mode 100644 docs/fusa/reqs/product-reqs/common/reqs.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/common/passthrough.rst b/docs/fus=
a/reqs/design-reqs/common/passthrough.rst
> new file mode 100644
> index 0000000000..a1d6676f65
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/common/passthrough.rst
> @@ -0,0 +1,365 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Device Passthrough
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The following are the requirements related to a physical device assignme=
nt
> +[1], [2] to Arm64 and AMD64 PVH domains.
> +
> +Requirements for both Arm64 and AMD64 PVH
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Hide IOMMU from a domain
> +------------------------
> +
> +`XenSwdgn~passthrough_hide_iommu_from_domain~1`
> +
> +Description:
> +Xen shall not expose the IOMMU device to the domain even if I/O virtuali=
zation
> +is disabled. The IOMMU shall be under hypervisor control only.
> +
> +Rationale:

I think there should be a rationale here to explain why we do not want the =
IOMMU
in particular to be assigned to a domain.

Added to that, I am not completely sure that there is a clear way to test t=
his one
as for example one could assign registers not known by Xen.

Shouldn't this requirement in fact be an assumption of use ?

> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Discover PCI devices from hardware domain
> +-----------------------------------------
> +
> +`XenSwdgn~passthrough_discover_pci_devices_from_hwdom~1`
> +
> +Description:
> +The hardware domain shall enumerate and discover PCI devices and inform =
Xen
> +about their appearance and disappearance.

Again this is a design requirement telling what should be done by a domain.
This is an interface or an assumption of use but not a Xen design req.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Discover PCI devices from Xen
> +-----------------------------
> +
> +`XenSwdgn~passthrough_discover_pci_devices_from_xen~1`
> +
> +Description:
> +Xen shall discover PCI devices (enumerated by the firmware beforehand) d=
uring
> +boot if the hardware domain is not present.

I am a bit wondering here why we would not want Xen to always do it if we h=
ave
the code to do it in Xen anyway.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Assign PCI device to domain (with IOMMU)
> +----------------------------------------
> +
> +`XenSwdgn~passthrough_assign_pci_device_with_iommu~1`
> +
> +Description:
> +Xen shall assign a specified PCI device (always implied as DMA-capable) =
to
> +a domain during its creation using passthrough (partial) device tree on =
Arm64
> +and Hyperlaunch device tree on AMD-x86. The physical device to be assign=
ed is
> +protected by the IOMMU.

This is a very long and complex requirement.
I would suggest to split it in 3:
- generic: Xen shall support assign PCI devices to domains.
- arm64 one: Xen shall assign PCI devices based on device tree (explain how=
 this is configured in dts)
- amd: xxxx based on hyperlaunch
- Xen shall use the IOMMU to enforce DMA operations done by a PCI device as=
signed to a domain to be restricted to the memory of the given domain.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Deassign PCI device from domain (with IOMMU)
> +--------------------------------------------
> +
> +`XenSwdgn~passthrough_deassign_pci_device_with_iommu~1`
> +
> +Description:
> +Xen shall deassign a specified PCI device from a domain during its destr=
uction.
> +The physical device to be deassigned is protected by the IOMMU.

Remove second sentence or turn it into a req to say that the PCI device sha=
ll not be allowed to do DMA anymore somehow.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Forbid the same PCI device assignment to multiple domains
> +---------------------------------------------------------
> +
> +`XenSwdgn~passthrough_forbid_same_pci_device_assignment~1`
> +
> +Description:
> +Xen shall not assign the same PCI device to multiple domains by failing =
to
> +create a new domain if the device to be passed through is already assign=
ed
> +to the existing domain. Also different PCI devices which share some reso=
urces
> +(interrupts, IOMMU connections) can be assigned only to the same domain.

Please split and simplify
- Xen shall assign a single device to a single domain
- Xen shall assign PCI devices sharing resources to the same domain.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Requirements for Arm64 only
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Assign interrupt-less platform device to domain
> +-----------------------------------------------
> +
> +`XenSwdgn~passthrough_assign_interrupt_less_platform_device~1`
> +
> +Description:
> +Xen shall assign a specified platform device that has only a MMIO region
> +(does not have any interrupts) to a domain during its creation using pas=
sthrough
> +device tree.
> +The example of interrupt-less device is PWM or clock controller.

I am a bit puzzled by this req. Why making a specific case for interrupt le=
ss ?

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Deassign interrupt-less platform device from domain
> +---------------------------------------------------
> +
> +`XenSwdgn~passthrough_deassign_interrupt_less_platform_device~1`
> +
> +Description:
> +Xen shall deassign a specified platform device that has only a MMIO regi=
on
> +(does not have any interrupts) from a domain during its destruction.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Assign non-DMA-capable platform device to domain
> +------------------------------------------------
> +
> +`XenSwdgn~passthrough_assign_non_dma_platform_device~1`
> +
> +Description:
> +Xen shall assign a specified non-DMA-capable platform device to a domain=
 during
> +its creation using passthrough device tree.
> +The example of non-DMA-capable device is Timer.

Again why making a specific case here ?

Wouldn't it me more logic to describe device passthrough and then what Xen =
should do for interrupts and for DMA ?

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Deassign non-DMA-capable platform device from domain
> +----------------------------------------------------
> +
> +`XenSwdgn~passthrough_deassign_non_dma_platform_device~1`
> +
> +Description:
> +Xen shall deassign a specified non-DMA-capable platform device from a do=
main
> +during its destruction.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Assign DMA-capable platform device to domain (with IOMMU)
> +---------------------------------------------------------
> +
> +`XenSwdgn~passthrough_assign_dma_platform_device_with_iommu~1`
> +
> +Description:
> +Xen shall assign a specified DMA-capable platform device to a domain dur=
ing
> +its creation using passthrough device tree. The physical device to be as=
signed
> +is protected by the IOMMU.

This requirement is not a design but an higher level as it does not tell an=
ything about implementation.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Deassign DMA-capable platform device from domain (with IOMMU)
> +-------------------------------------------------------------
> +
> +`XenSwdgn~passthrough_deassign_dma_platform_device_with_iommu~1`
> +
> +Description:
> +Xen shall deassign a specified DMA-capable platform device from a domain=
 during
> +its destruction. The physical device to be deassigned is protected by th=
e IOMMU.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Assign DMA-capable platform device to domain (without IOMMU)
> +------------------------------------------------------------
> +
> +`XenSwdgn~passthrough_assign_dma_platform_device_without_iommu~1`
> +
> +Description:
> +Xen shall assign a specified DMA-capable platform device to a domain dur=
ing
> +its creation using passthrough device tree. The physical device to be as=
signed
> +is not protected by the IOMMU.
> +The DMA-capable device assignment which is not behind an IOMMU is allowe=
d for
> +the direct mapped domains only. The direct mapped domain must be either =
safe or
> +additional security mechanisms for protecting against possible malicious=
 or
> +buggy DMA devices must be in place, e.g. Xilinx memory protection unit (=
XMPU)
> +and Xilinx peripheral protection unit (XPPU).


Please split in several reqs.


Stopping here my review for now.

Cheers
Bertrand

> +
> +Rationale:
> +The IOMMU is absent from the system or it is disabled (status =3D "disab=
led"
> +in the host device tree).
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Deassign DMA-capable platform device from domain (without IOMMU)
> +----------------------------------------------------------------
> +
> +`XenSwdgn~passthrough_deassign_dma_platform_device_without_iommu~1`
> +
> +Description:
> +Xen shall deassign a specified DMA-capable platform device from a domain=
 during
> +its destruction. The physical device to be deassigned is not protected
> +by the IOMMU.
> +
> +Rationale:
> +The IOMMU is absent from the system or it is disabled (status =3D "disab=
led"
> +in the host device tree).
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Map platform device MMIO region identity
> +----------------------------------------
> +
> +`XenSwdgn~passthrough_map_platform_device_mmio_region_ident~1`
> +
> +Description:
> +Xen shall map platform device memory region identity (guest address =3D=
=3D
> +physical address) when assigning a specified platform device to a domain=
.
> +The device can be either non-DMA-capable or DMA-capable.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Map platform device MMIO region non-identity
> +--------------------------------------------
> +
> +`XenSwdgn~passthrough_map_platform_device_mmio_region_non_ident~1`
> +
> +Description:
> +Xen shall map platform device memory region non-identity (guest address =
!=3D
> +physical address) when assigning a specified platform device to a domain=
.
> +The device can be either non-DMA-capable or DMA-capable.
> +
> +Rationale:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Assign PCI device to domain (without IOMMU)
> +-------------------------------------------
> +
> +`XenSwdgn~passthrough_assign_pci_device_without_iommu~1`
> +
> +Description:
> +Xen shall assign a specified PCI device to a domain during its creation =
using
> +passthrough device tree. The physical device to be assigned is not prote=
cted
> +by the IOMMU.
> +The DMA-capable device assignment which is not behind an IOMMU is allowe=
d for
> +the direct mapped domains only. The direct mapped domain must be either =
safe or
> +additional security mechanisms for protecting against possible malicious=
 or
> +buggy DMA devices must be in place, e.g. Xilinx memory protection unit (=
XMPU)
> +and Xilinx peripheral protection unit (XPPU).
> +
> +Rationale:
> +The IOMMU is absent from the system or it is disabled (status =3D "disab=
led"
> +in the host device tree).
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Deassign PCI device from domain (without IOMMU)
> +-----------------------------------------------
> +
> +`XenSwdgn~passthrough_deassign_pci_device_without_iommu~1`
> +
> +Description:
> +Xen shall deassign a specified PCI device from a domain during its destr=
uction.
> +The physical device to be deassigned is not protected by the IOMMU.
> +
> +Rationale:
> +The IOMMU is absent from the system or it is disabled (status =3D "disab=
led"
> +in the host device tree).
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Forbid the same platform device assignment to multiple domains
> +--------------------------------------------------------------
> +
> +`XenSwdgn~passthrough_forbid_same_platform_device_assignment~1`
> +
> +Description:
> +Xen shall not assign the same platform device to multiple domains by fai=
ling
> +to create a new domain if the device to be passed through is already ass=
igned
> +to the existing domain. Also, different platform devices which share som=
e
> +resources (interrupts, IOMMU connections) can be assigned only to the sa=
me
> +domain.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Notes
> +=3D=3D=3D=3D=3D
> +
> +The AMD64 PVH-specific requirements are written under the assumption tha=
t once
> +the Hyperlaunch feature is completed, Xen shall assign a PCI device to b=
oot
> +time domains. This is not the case today, where the PCI device can be pa=
ssed
> +through only to domains launched by a control (toolstack) domain.
> +
> +The Arm64-specific requirements are written under the assumption that on=
ce
> +the dom0less PCI Passthrough feature is completed, Xen shall assign a PC=
I device
> +to boot time domains. This is not the case today, where only the platfor=
m device
> +Passthrough is supported.
> +
> +[1] https://xenbits.xenproject.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddocs=
/misc/arm/passthrough.txt;hb=3DHEAD
> +[2] https://xenbits.xenproject.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddocs=
/misc/arm/passthrough-noiommu.txt;hb=3DHEAD
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index 183f183b1f..19c2f26b2b 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -10,3 +10,4 @@ Requirements documentation
>    market-reqs
>    product-reqs
>    design-reqs/arm64
> +   design-reqs/common
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> index f456788d96..37a443395b 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -47,3 +47,36 @@ Comments:
>=20
> Needs:
>  - XenProd
> +
> +Run AMD-x86 domains
> +-------------------
> +
> +`XenMkt~run_x86_domains~1`
> +
> +Description:
> +Xen shall run AMD-x86 domains.
> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> +
> +Domain device assignment
> +------------------------
> +
> +`XenMkt~domain_device_assignment~1`
> +
> +Description:
> +Xen shall assign device to each domain.
> +
> +For example, it shall assign GPU to domain A, MMC to domain B. Only the =
domain
> +assigned to a device, shall have exclusive access to the device.
> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> diff --git a/docs/fusa/reqs/product-reqs/common/reqs.rst b/docs/fusa/reqs=
/product-reqs/common/reqs.rst
> new file mode 100644
> index 0000000000..9304399e4d
> --- /dev/null
> +++ b/docs/fusa/reqs/product-reqs/common/reqs.rst
> @@ -0,0 +1,29 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Domain Creation And Runtime
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Device Passthrough
> +------------------
> +
> +`XenProd~device_passthrough~1`
> +
> +Description:
> +Xen shall provide mechanism for assigning a physical device to the domai=
ns.
> +
> +For example:
> +
> +- PCI passthrough
> +- MMC passthrough
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> + - `XenMkt~run_x86_domains~1`
> + - `XenMkt~domain_device_assignment~1`
> +
> +Needs:
> + - XenSwdgn
> --=20
> 2.34.1
>=20


