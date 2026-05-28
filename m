Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA8jOe95GGo8kQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 19:22:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E065F5945
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 19:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321606.1588296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSeQV-0002IR-PD; Thu, 28 May 2026 17:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321606.1588296; Thu, 28 May 2026 17:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSeQV-0002GM-MM; Thu, 28 May 2026 17:21:47 +0000
Received: by outflank-mailman (input) for mailman id 1321606;
 Thu, 28 May 2026 17:21:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wSeQT-0002GG-IL
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 17:21:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSeQS-00FayF-R2
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 19:21:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a187979-bab6-0a2a0a5309dd-0a2a45039dde-32
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 19:21:43 +0200
Received: from [52.101.70.45]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a1879a7-672d-0a2a45030019-3465462da28c-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 19:21:43 +0200
Received: from CWLP265CA0432.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::11)
 by AS4PR08MB7853.eurprd08.prod.outlook.com (2603:10a6:20b:51c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 17:21:40 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:400:1d7:cafe::2) by CWLP265CA0432.outlook.office365.com
 (2603:10a6:400:1d7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.14 via Frontend Transport; Thu, 28
 May 2026 17:21:39 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 28 May 2026 17:21:39 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by VI0PR08MB11844.eurprd08.prod.outlook.com (2603:10a6:800:315::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 17:20:34 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:20:34 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HKwlmi8Au4MW132SE1SpwZXDnD0iqWjxAgm3FYV36DRVrpVsGRal8RVBcXSDam/Sy2vlXVRl9Dr40O4/WN+ZtEEzMD85i+5llK/UnGSOZtPr/geUHWYwNBSiOtRLPnuRvSTMr1DKOpwHRRDr86vs8x9h+AWQpl1Ygeo/M86NfE6/peU3+LlkNayyzyUeIkQmzJwDjK39iAo61m5ed06IS4eocQodbO53e3FtFz0FgK95ihv4iEZvaKjE/qmYoJFgthWCu9+POeWe70N0H8av2LZkxnYX58X6PNwNqWTkoodxBoLPbPUdMLpTO0AUarCt/8AGWUJlonz7Q83G/kibQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sS+TX08sKPRbKQUcV+ms7cXCEVf9Qd5pAdV+n50JZk=;
 b=aCmD3UdksNR05eR3S1Qy1KchDcTO80HirdpgMuCfesagWasg12tMDuysWx/g3G83tMMtPJbgW77CQvmXRiyfSHF4wyinknipmjxWFR76I13IYG/3odM9mxmo8ajGrLu+R09wIIvkgGA+2oSNGVIUJ+/tRn7h5wuOswT+loLZEoa5bTDG8SuxULWhLWimjz22MknGALDWZiCpfiEXaFF1MIjkwQ3ULYvpZSpHIKWYufFqEhmSoy/CeIwnWYFFvHZS/YQXmhcaeOXYbhtHHlXw7TgHUH19uOK4Z28Lyw3GPRqba0puo+OgpilT1ioIloxjN7YnnN71HXyxC5qvkdnZqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sS+TX08sKPRbKQUcV+ms7cXCEVf9Qd5pAdV+n50JZk=;
 b=kn4PyrCx2IBTkW59zOpbTRMiML9ZsiRJinpdQwxXyW7tMJ7eJBuaDJEr/v/5SYnV6oBdoPT4kPpKbIN+R+uOH/4vY0DseqxR4zFLDpClRunUGEcZNk29HiXJMBMAoSGoiPdoDzjqWAySgg1yCj6icWAqbgPQJEO31wSNuPv4pG4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKQeK7Z+BKBLfPKwFdkjYlFMZa5TlZqKWjKlOpxYvhvciTT3dYgaPubtvgvx7ZxVA1IwzfwoHRbaVKTGbBSmggH78pSL106zZWuWXaiQAzWatUhJNtEWhJJ4iiq3rvOhS+WVMxbe2z07HXIATadK7W0+rAYM0Fo54N3Dtz+sf8lWbm0eBCob88my5Skyak/2uIYKZeKSKGi/3RrIEnMGuuGu5W37wKav+zlD+2TWRygnD2oCiXvRq3Ft7d7rxNuqyOs77GIs52DELCMqhYTW6KBYn44CkkGYmSMvRgDeSpsRw48kG7zMI46fR0e3Op+b/15TWS396H7OFZyrDyr8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sS+TX08sKPRbKQUcV+ms7cXCEVf9Qd5pAdV+n50JZk=;
 b=YieaLGuOVf2M06yVg7rXUcCLN+gIceg9jqirBGKU+2XcY3u2xwa0lGYW08k/KNlsqq5Y3I3sunW6yN1VlBMJBt+h2Z54ZdklefN/LVKZJU0AFxb3wSolzFCdahnXSf0mXIWNr/w9oMCkF5emiQ3RJMr4qaTbiQ6Qwplj0lAfmC8N0QZGl7QpN2/JmpHRZUQZ356A7jZrBg4D+MTVB4nu52X8xTpd2wQWdXz1SFdAB62M2UkajIdLjog3pPSiuIVbif8MtPjRSXde+VQ1z0IIN+wmDMP+MEFWBoJO/qaY28/azuxEDXvJCgtZBWMZxOywrS/GCQbymbAKB9/nEWNrBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sS+TX08sKPRbKQUcV+ms7cXCEVf9Qd5pAdV+n50JZk=;
 b=kn4PyrCx2IBTkW59zOpbTRMiML9ZsiRJinpdQwxXyW7tMJ7eJBuaDJEr/v/5SYnV6oBdoPT4kPpKbIN+R+uOH/4vY0DseqxR4zFLDpClRunUGEcZNk29HiXJMBMAoSGoiPdoDzjqWAySgg1yCj6icWAqbgPQJEO31wSNuPv4pG4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v10 04/13] xen/arm: gic-v3: Implement GICv3 suspend/resume
 functions
Thread-Topic: [PATCH v10 04/13] xen/arm: gic-v3: Implement GICv3
 suspend/resume functions
Thread-Index: AQHc6UoG/i1LQn2xYkyWh9qeWcElZrYjud0A
Date: Thu, 28 May 2026 17:20:34 +0000
Message-ID: <4A39B5D4-8D51-4499-8293-95E3CCB250F5@arm.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
 <67f47fe59e2d3f66583c3a7ae82db036d57dc07a.1779385072.git.mykola_kvach@epam.com>
In-Reply-To:
 <67f47fe59e2d3f66583c3a7ae82db036d57dc07a.1779385072.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|VI0PR08MB11844:EE_|AM3PEPF00009B9D:EE_|AS4PR08MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: dab5ef57-df19-48d1-b2ee-08debcdd946a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 SpZfVbwI7lkof/hWQMf32IddxQj8qXlkPSs2ZNLHdUUGkinl8yf5G53yU4tJyo6/b+EJ5kgi5RiTg9E2ZQkgqnAfQRo1DkR0dssFXIuoQPtmcmwdKf6fTeKLozi5lS/HQ/bfGo/BpSTNGUY4XVc7uTlsJ5JGhnw0E/J345kFy3fUGW/uV3N2+hTo/wMAGxvHIPgwm9xj/g/qZku1kLLGKmIF9TlnqNIU6Yzqtn6FHeJB3VlFjI2kc3GZTun1bUS+1/9wPR72d6vk5VzqifUJFwjzF29qcRh1GVUbuFy9rmmTFdvT/NuLnjdK89FEn5/qqSOhJ3S/Ev1QCDUM9oEldu/pJmNcKgxKSwlK5O82iMCjfWUpZZGMQllCyka0Uyo0MAGWTXbl5yO+JhItLPm279mJ4PPntnEC1F7o1yCkfwYFYFDMzGdmjrfofjkR+M/Bl2EX3vws+FbILfiWsOTfY5lmOtVN8M2FE6ojBF/6j5hvvHbaet+Xt0kUb2xwy/hHXefIJ0VkVyMnJQGudxdfPS3+CliEy9ZmEPqpIddCXXKFCttNndNEa9ZE6OAhvpW4I9RH2Lqe3Ghh4wiXM3gpKRXuQkqKSXCn/iUgAuv15/kceVrEtyQkY97erPqzu0Wz1EQ8Ow2WySzehjN30Zv21sJFSudTcQlhRN6EELhjPQ0XmwJ3obRlkXF2U716HE2aXEwacSIyabH2eamu6Y4m1F4g2j0RkR7n4FRVf63QbdloCSHinazJ92RnzXT60T5s
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <26AFA89EF52E7A4383DEF4278B4535BC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 McYowA/hXssvl+2+ffumNP0VUpH4dHkwOnjDqBUNyNnQgevNKraRm8yTptAcukHbKzvgxOYPPF2/FDbhC/pjca+7SUsNnOPp/NK+ylz2DsHe3a5YbqN8INRp/MaKzPRbE4DQvRbE11JVbAyEgcHHz+m+PanXAHxfQLv9a66WGMXWlnDV2XAwBr5GtHTf6d1OkWcQ6uEzuRjQrFDleOEP+VM4pHN7OTl/IcKmHv32M7q+rQGUfTKwHYSk2J8VYqIEquAMUOTH1QSoeiSaepLtk8syW2H7JVAzHdB7HCH5N5IhlVtu0lm78/a4QktWbja5bR28jg1xcJm2bHx2mcugNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11844
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	af0dea84-7d66-417e-e06f-08debcdd6d93
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|36860700016|376014|82310400026|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DpXDD/6e/FPR++l9Je9j/er1+GJUqv+F00h6lmHHK9r53odtHIXIofvME/4zBvrKF/oIOf9MulY0B99MGp0HpEHd/HhidQ+a8FjvLa8d+MX6YPlkdFncVRImbwAsBL17koQmoCgeyAm7TAxLFhxc8WEaGmuZTUkysVeZXIBOR9o0fbo+ga+Elyn+b2DWWJNvYamKH1zwaDI8ZrAGplryg/tnQkMeDTfXXaKEGU0A9pLUzfkz/Az8lpoZx/tqpu6yFGpJ5C7pnizljI06V7ZrIrqUP6MUrIDb2Y9hetU02AeY+T9oG4/edDDx+OOAVFKozjZuJstNbqo3AXmHbqp4fYf14JwI9vP9f/tGdK9VaDp3wLJ4Iyjn3mLqUID+XEEz978Kd98ywNfIntghhbRNdnW5WtnjsaxxBmrnJohdLJk8y2op2qfRD35hZp77FuUdiOAsGDoSamb9dXMLOf/eAyTDAGXCY1arEjrpmP6Ss+IKpddoj/zSOC3CWZmGMfIzaSct7QaTXLIR2lETlYa3CcxOHh6WqHHxG/mDWeKeN1R82Yup7MvyLU5/AWrv9ko7+dhW6aZUKHZFpcoYWreVmcwU1P3KDrYh4Ff905XtA+Ssa578kE2juLaSpZj0W6qJhZQYwnPjD5BmSJGgwFEFx80NBh4ZmlcLUTdqb4mxdETesCHl18YX29zfjYUgWYIA6CwnFAUi2Zy7oNFZCa5is2s9IOGzqX98f3qyjQ1NIgI=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zzscplLBjd9FAEmNXY5M2qPiJ751XBtWKy0xuE+ZGyW2iZ01u7s9en03kW/TzXgxKxrOhZHqT2vLSnMr3ye15/ykXOXsH2yxZ8mOuj/ceJzp27d2jLeII6SZpNXnT/P7gZEZ/lWCarEPedoGJooyXOGU5O8pgbG7kUe960G7Ufi3yR7cYZezTY+JLdYiCVXSasQXyN5zu1OcmsbaGq9BRcVj+dhFoaS563a+78Oi5bKL6hV2XWP+vHMovNx+Jv/EIdj1m2i9DtEjc7ZvLTYLeOZxHEn0J9OdR6QHISrKnii/py8ju/19LoTe/mUk+i6Jtb4GHOaN5vVJOqlnynLkYH0iaMGfA2rpHjGPLhHz6Gk7ENaa4YdKK1KLgemlnuLvCfErqN1Ezsr365/ZGqsmr6aVfin6STOBKFfw2SfGj27YoEpBXhOAHHEzc9KnpJ3k
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:21:39.6018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dab5ef57-df19-48d1-b2ee-08debcdd946a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7853
X-purgate-ID: tlsNG-33051d/1779988903-3A378938-D325A958/0/0
X-purgate-type: clean
X-purgate-size: 901
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 34E065F5945
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykola,

> On 21 May 2026, at 18:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> System suspend may lead to a state where GIC would be powered down.
> Therefore, Xen should save/restore the context of GIC on suspend/resume.
>=20
> Note that the context consists of states of registers which are
> controlled by the hypervisor. Other GIC registers which are accessible
> by guests are saved/restored on context switch.
>=20
> Before continuing suspend, also verify that the physical CPU interface
> has no Group 1 active-priority state left. Use ICC_CTLR_EL1.PRIbits to
> decide which ICC_AP1R<n>_EL1 registers are implemented, so Xen does not
> read an unimplemented AP1R register.
>=20
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


