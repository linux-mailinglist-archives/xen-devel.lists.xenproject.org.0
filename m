Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B89397AB52
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 08:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799826.1209821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqRV9-0004Qy-C0; Tue, 17 Sep 2024 06:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799826.1209821; Tue, 17 Sep 2024 06:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqRV9-0004Nm-8J; Tue, 17 Sep 2024 06:15:51 +0000
Received: by outflank-mailman (input) for mailman id 799826;
 Tue, 17 Sep 2024 06:15:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4wfS=QP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sqRV8-0004Ng-1q
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 06:15:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2612::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47a50a03-74bc-11ef-99a2-01e77a169b0f;
 Tue, 17 Sep 2024 08:15:47 +0200 (CEST)
Received: from AS4P192CA0026.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::10)
 by GV2PR08MB9397.eurprd08.prod.outlook.com (2603:10a6:150:df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15; Tue, 17 Sep
 2024 06:15:35 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::8b) by AS4P192CA0026.outlook.office365.com
 (2603:10a6:20b:5e1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Tue, 17 Sep 2024 06:15:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 17 Sep 2024 06:15:34 +0000
Received: ("Tessian outbound e65589c60e30:v441");
 Tue, 17 Sep 2024 06:15:33 +0000
Received: from Ld21ad85ed02b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F684E3F5-1F7C-42F7-AFE8-8D4109216661.1; 
 Tue, 17 Sep 2024 06:13:43 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld21ad85ed02b.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Sep 2024 06:13:43 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAVPR08MB9651.eurprd08.prod.outlook.com (2603:10a6:102:31b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15; Tue, 17 Sep
 2024 06:13:39 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.7982.012; Tue, 17 Sep 2024
 06:13:38 +0000
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
X-Inumbo-ID: 47a50a03-74bc-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DDaul7AWmpQaQOiGofsFQ2iQph4M8SQiw5b4yjgCWBufsph6USQFafR467N+8Dwnf5jNwugVYSN4SJCsCDEl5ZQaIORQBW6NA0+I9u4ddOhtabwJHd8FtgiR+DEIF1Hmh4EL9W7kYdSpn6mWzRoyR36ikFyfeG1ZxsvcxOrbNz2eA8TkjM2nH/W/q2wA4g265stJXdfJDLeyXwm1wPrn/GXIMbK9XfKoG8QSABr7EVBZWR7IcvD7r9MCFeX0Ljqaw9I+DgJt70NKqwab2rqQrVVrY+lkoC5ysvEqe4ZWZ9lMC9PMtjyH4pxbUCRieGBDDxw//B4cEzxF2kNovUwg9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfNqV2p8BMG5O6m2j7bfUHzy/n8uELaIv/sXp3O5RaA=;
 b=XWG/LYCfxDhvsmfH4RvyxDpPQy2wYUJcyPxOQhZLlQI9emK9wYoin9NJx9M5UvWoutmS+U0FMfxR16wvTuMJUJeVW1VTHELj37IQJrsF47+MTCVKpgFljRqbUfvrdf9QtEoE/CV5lTMy1ErHjn9JLqbQBMSbcarQ9iqNTblrFwcpgWcAoEHolKgOVm9veiubdpOyyV4yaReieyBOgt/BEioFkkkHJGo/ynnYEeAz/j6zv52dl736l7aLms3dyKz+7DEdK1lPt+b+XxiEvEbpyR2jn6Xtrpyt9ZqV5QwcaPnM8ihAmyet30viOl0tDt8bMp/dBQ+ddtbch7Y+bdbVsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfNqV2p8BMG5O6m2j7bfUHzy/n8uELaIv/sXp3O5RaA=;
 b=nV8PWCMzzNSUUBX8A8HCGGwZWXM290kj4CB8obu2ozBVavTcld/Xqz6dg7tyWOHyFWc6loJb6ooii0Im1bI8m40low1xfPKsBbCTC1njjnjxABBEr1OKLxx9vXsfrIgdYp+ZBS+32C6oDKgICo0gVn2ydxQt4k2qrY/EZte2XJM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7e7ad8add7cb5191
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJyTZiTvUkMpESej8a9OszLbGePtliuVUge/1/XRATOBcdqquwl48sqAiLEEVpW7kljYT5ZWRVB3v/z2vxp9uni9/tcElBchVwD9jCjyhaA7V8ITHPCsXBfDTh48JWVeLXQztRdnXKw3BM+Fgo35pUqgf1MPVW7/wj2HUGsk+D7IB8W1gqm+n5pRtEVKNKlP9mARL9j/vheICsP1LrTPiEpbiHHcZFV4R+2zEc1MHcrjVXeE6+hwLyg8+i3Bzo8hr48okrhOcYxlDkUB0JosQD/rLU5MzxuZvobSc9EMR0QD03VeGOWQeMJbdb+Z3WJG7rHhE9OcyeM5t8QfjUQbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfNqV2p8BMG5O6m2j7bfUHzy/n8uELaIv/sXp3O5RaA=;
 b=bqV7QeJXOJMr/pNMgRSAeC6sol9yLQrgNBHFrODnbhKmiWMR0eFzt7MoEoJoeKKCy30kOJ4pwBkP0be7xyIpiTZ1J51q5S6Ks6CmbrTZdVeXD/CPzJ6+bXnW8ti5c76QbF1S31d6a/zBRzj7U2VZjMQPNpVGGm9w1VvZydrGQ2Tx8rKTP+1b5hwV6beqBgVQ/5dgi2+qaDFvfPH7o4rqtIamuvAechY2Yd9hwP6kF4ESSnQnWXIPTCJ0YBfYtrK1jvrzOM7CGwXTimZQ1GAxVCM41AQVSSYmp+t49hwDo0LbAUwT+4G7/9FEZDkm1zhbztOXkV6ngNL59jCPrMCKsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfNqV2p8BMG5O6m2j7bfUHzy/n8uELaIv/sXp3O5RaA=;
 b=nV8PWCMzzNSUUBX8A8HCGGwZWXM290kj4CB8obu2ozBVavTcld/Xqz6dg7tyWOHyFWc6loJb6ooii0Im1bI8m40low1xfPKsBbCTC1njjnjxABBEr1OKLxx9vXsfrIgdYp+ZBS+32C6oDKgICo0gVn2ydxQt4k2qrY/EZte2XJM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] docs/misra: add R17.2 and R18.2
Thread-Topic: [PATCH] docs/misra: add R17.2 and R18.2
Thread-Index: AQHbCIyV13ovZBRQAUKHbnBglP2HvbJbgFMA
Date: Tue, 17 Sep 2024 06:13:38 +0000
Message-ID: <3DB424D8-8E51-49C0-8B31-5578FF030252@arm.com>
References:
 <alpine.DEB.2.22.394.2409161559340.1417852@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2409161559340.1417852@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAVPR08MB9651:EE_|AM3PEPF00009BA1:EE_|GV2PR08MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: bdea4735-4454-424f-687c-08dcd6e023c2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?QVauMK1eU/1qeY7lbBwj6vUZ+siG74EQkE1fZ9rTPhBzshFRTzo7QyMyLl?=
 =?iso-8859-1?Q?5tnBoLJkzqHgvGWsM6gkcguw7fFPcdoue6AbdhnXSJxgdWPtoAORckGqbM?=
 =?iso-8859-1?Q?8mTNNk4pBFGb6q4gfUoYgXxfpBKMRiHBMQHQV8BZ0X8N2UvpnvkQC05JRc?=
 =?iso-8859-1?Q?53TUkWeKA7haIfLxzzud6A+GYM0nO7sx4CMEBXu+5qVHWgeV4WMP3Ex4Dm?=
 =?iso-8859-1?Q?hZbxObg0zLAkzj9DHtd5A4FQQ2QeUloBdlx4Dag+aZdckyT69+bJytckfI?=
 =?iso-8859-1?Q?TtjHmpWYtS+mPJrWykcE0+DsWnebJhmtJcWM+XCxE8eOelOc8z8VE83D0U?=
 =?iso-8859-1?Q?ASz1RxJUgpekxZhSsKQweVrAIRbyyassLVLWzB2WkzVfPGZ5oh05T4M9s2?=
 =?iso-8859-1?Q?AjVx0yp1GegaeY4jxlcnSVwUVsj/jXRPy99SB5h0MWMK9u6oh4cyOuxRT7?=
 =?iso-8859-1?Q?NBCqRMYqb8hXTYCbz2aKIjVAaIr7NCNUHcKQyFztK0Dx9ZAAkUzWpHzM2c?=
 =?iso-8859-1?Q?E5NTcbfOl8F0RGdJdkhiZ/6rHgR/uXQNSR01fImQ2jK9lkoJFB1QaTUnDA?=
 =?iso-8859-1?Q?XQO7M/A8B0neFUXQie5PDCfZOQUCry+AUudqMB1LO7oBLiIaYaK8/kM4ye?=
 =?iso-8859-1?Q?Y9nb9oWI2s5IMzKlCtOTp9gk5LBu6TcpkF/jRg29u7lzPFLRkGCH9sBVFt?=
 =?iso-8859-1?Q?MMHOvvnOefwg4PgxvWsZX398oFaL9716LbLftMRIvLIk8O+1RmukMvos7M?=
 =?iso-8859-1?Q?aNOvlSsd7ptEpAcZSLwuu4PjkEAo0Jcq7cftwcGWVjaetYoc1EkxQq58hs?=
 =?iso-8859-1?Q?RA3KsCNobuwiKpW3s9P+7xB5AmaD/SVXHND+lP399Rk+kfEl4q0jQCPVfD?=
 =?iso-8859-1?Q?roey6P1QntEcpNEGB+/E3+YNJM7ylry1y738+D43+jpaksTvZvn4rI2R88?=
 =?iso-8859-1?Q?FBlvidBiOQdzzq08+cthI2SUxXkuzhUmTNsUPXD685LpGYbuMKh2Uobd9P?=
 =?iso-8859-1?Q?/lqIj5l8aLZGw1n0gT5HCnY9+JeCFTVrGXoW7xCRYJ2pC4rjP1iCdH9x7s?=
 =?iso-8859-1?Q?vvfLu8vR8kG4LOWhYoSpdS+OguFo3Og7G8QSt4645D4EGe3CXssWvyfMVh?=
 =?iso-8859-1?Q?NM3zRdYVXQT5pAktiRBM2GPJvYSLaJ5F1LXOnScL8gzVdErzhvi8Tg5NJB?=
 =?iso-8859-1?Q?ToVBVaId+FxcQCb37O/Bs5B9/CUWFJyVaqhuT1Sqb+/j4LW39kwRKPkxKG?=
 =?iso-8859-1?Q?gGxQ6odYS180IeKmttMjV6sflQCdr6cZDo+/3G/COmyeHprh0YqnMOy18L?=
 =?iso-8859-1?Q?gPQenhoB4QkO9fyFnUHt/NMqk040MybXOaLGDthqbxCHBQ0gW3hrKmuWjf?=
 =?iso-8859-1?Q?XU4wwUXroD7pB+CL9W3FhXyekdEjJemMGu9KpMxPWUqsaV5i4GzWc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8271F8370AA1ED4FA890EAB9AFDF3463@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9651
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a92b8aee-979c-464b-af23-08dcd6dfdf04
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|35042699022|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?bPzboauseUZ43Qnwop9pvfO2yV2ZGd2fp9mfw1IFt/DDCo4PCrHpXfIpSH?=
 =?iso-8859-1?Q?m2sIjC/L/ojqm4CukptSngDoVEwruQ2aGACtP/03/pXnkBt1vauIZk1UXO?=
 =?iso-8859-1?Q?zbSrsfcOCtwvOqerEXnrvR+OeT8/bNEzm6niaRLUpXtG+H6B180iV6H0ZK?=
 =?iso-8859-1?Q?8Lyk62BtElw9CDh9UA4+MgAPhkWRfhCgQX618wwGML6FEz+O/P6PotCFa+?=
 =?iso-8859-1?Q?3uMOIJ8Do1vJDnWvISmdDz8TNFnBDTTf6NbPbbYxrTLt8hyP89WJ5+aXnC?=
 =?iso-8859-1?Q?u8H3nodmgo8micvi/CDdDK+TL69qOMQ2FDPLMaKVVr4eErSw0EZF4GdRjN?=
 =?iso-8859-1?Q?yR2FSN3XIIWtJ2n6J1L6SN16+DdrKF/Yst0Ky5JOfsOHoDxljB/K54NFIO?=
 =?iso-8859-1?Q?wzhwMF1XsI1xFGkIiQilrwlMaBOh5osgVlBhv/1JE5dhdmMBZzeBzVVELQ?=
 =?iso-8859-1?Q?XRzuc0EtqUS/oEiS7lMclF44LndKEZtoRpKaz6LQ9OKdfG+QrBCCNU68x7?=
 =?iso-8859-1?Q?OVMunLIw6oHV+72IlwWyOmAjccDllIQacoiazKhBPTJlPOf4GpRY2GuJst?=
 =?iso-8859-1?Q?l0RbzR7EKEd3Q0GsBRHCLjMuzoxR4JGvkb0QRTVJtocjdXNqm/V3irtkFy?=
 =?iso-8859-1?Q?x/YA8SucK2C65K+TFjDk53DdSp6BRS9oLfv0j1tj9urQ2NQ2cJNxnPDPo/?=
 =?iso-8859-1?Q?Vd31eQP8vx1to/sHbC6G87399q4vzPwprEJGpN7DgBB5uMceR0zfihxmwk?=
 =?iso-8859-1?Q?Sfg7zWD2cTWni7Dc4Ffp59l4giS3y5nRLT/CLOnpZPxW/9xVPH9ISEhNv4?=
 =?iso-8859-1?Q?ekzeBkNMjBvfta5WvmOokqlmaK9A7A3k5AuE87lDdio+LvTE9e5biZEe6C?=
 =?iso-8859-1?Q?cuNqlYPFdLVo8OZAKBlJsF/Z/DNy1fCn7vN3VHTdbGhtKoizccq60pbP9/?=
 =?iso-8859-1?Q?4ea/W3rafEtin/YgUefb+8hww+4aGJtrPNa4VQOE282gJE9tROWk8mmg1z?=
 =?iso-8859-1?Q?P/k8MT71DbJgOb69cS7BADAcawAHP7wYS7atuwlVFpT/DlodY/i0vK2yjS?=
 =?iso-8859-1?Q?v/dni0T12o5uYNvuEVVT9AjY4PgdIW7rGjuW+lN0Q7GA3GYqaggwQaaphU?=
 =?iso-8859-1?Q?XPoO933rfWdz+H4V/5ckTFjDruZrnw42sbgC1Tzyq5LxMJerl+jZxqJwqY?=
 =?iso-8859-1?Q?iP6jswnsJV0OSwr+x1QuOJFnZWY5oBclq32m78TKq9SSxS6lNIuxtx27+Y?=
 =?iso-8859-1?Q?5RjiPRlHQNMzRPoJn7Md+CfKGKtqd17ySpQbRL0I8Si9+S2zMgWE1ddeNm?=
 =?iso-8859-1?Q?8foNSpqcJ452/aLZYw9eDqBbl2mzRFVg1IdV/Ld3L5lzJ6VANNVFrOCmcm?=
 =?iso-8859-1?Q?D4C0LU2d+Dlw6K5idEWdmJPY9CG+fNVw9E9yJLpvvXe0GnveN0X6qVwNSh?=
 =?iso-8859-1?Q?zj1AnrrOR6ChnBPPDeCK7BnyUYfKQgg0ZKI6Nw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(35042699022)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 06:15:34.0104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdea4735-4454-424f-687c-08dcd6e023c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9397

Hi Stefano,

> On 17 Sep 2024, at 01:02, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> The Xen community is already informally following both rules. Let's make
> it explicit. Both rules have zero violations, only cautions. While we
> want to go down to zero cautions in time, adding both rules to rules.rst
> enables us to immediately make both rules gating in the ECLAIR job part
> of gitlab-ci.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index e99cb81089..9acd92cf78 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -561,6 +561,12 @@ maintainers if you want to suggest a change.
>      - The features of <stdarg.h> shall not be used
>      -
>=20
> +   * - `Rule 17.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_17_02.c>`_
> +     - Required
> +     - Functions shall not call themselves, either directly or indirectl=
y
> +     - Limited forms of recursion are allowed if the recursion is bound
> +       (there is an upper limit and the upper limit is enforced)

NIT: . missing at the end.


Should we add a comment to say that the bounding needs to be explained in a=
 comment or in a deviation ?

> +
>    * - `Rule 17.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_17_03.c>`_
>      - Mandatory
>      - A function shall not be declared implicitly
> @@ -593,6 +599,12 @@ maintainers if you want to suggest a change.
>        submitting new patches please try to decrease the number of
>        violations when possible.
>=20
> +   * - `Rule 18.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_18_01.c>`_
> +     - Required
> +     - A pointer resulting from arithmetic on a pointer operand shall
> +       address an element of the same array as that pointer operand

NIT: . missing at the end.

More than that i do not find the sentence quite clear.
How about: Pointer arithmetic on an array should only address elements in t=
he given array.

There might a better way to state that in english.
Or is this the "extract" from the misra rule directly ?


Cheers
Bertrand

> +     -
> +
>    * - `Rule 18.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_18_02.c>`_
>      - Required
>      - Subtraction between pointers shall only be applied to pointers


