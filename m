Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHr6MXHzAmo9zAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 11:31:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219451DC59
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 11:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306660.1578495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMjSC-0004CE-8V; Tue, 12 May 2026 09:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306660.1578495; Tue, 12 May 2026 09:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMjSC-0004AL-5b; Tue, 12 May 2026 09:31:04 +0000
Received: by outflank-mailman (input) for mailman id 1306660;
 Tue, 12 May 2026 09:31:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wMjSB-0004AD-8K
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 09:31:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMjSA-005wM7-6o
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 11:31:02 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a02f352-bab6-0a2a0a5309dd-0a2a450cad80-14
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 11:31:02 +0200
Received: from [52.101.70.39]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a02f355-62f1-0a2a450c0019-34654627fa1a-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 11:31:02 +0200
Received: from DU7P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::31)
 by GV1PR08MB11167.eurprd08.prod.outlook.com (2603:10a6:150:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 09:30:54 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::d3) by DU7P251CA0016.outlook.office365.com
 (2603:10a6:10:551::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 09:30:54 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 09:30:52 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU0PR08MB9798.eurprd08.prod.outlook.com (2603:10a6:10:445::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 09:29:48 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.20.9891.019; Tue, 12 May 2026
 09:29:48 +0000
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
 b=Aj8BAV+hlwbcY4fPampr/tkSP+f3aZJyuRbEHTGGWJMtcXLx3zWEjTH9+zePW20bYwM5libx7rcrcAOqIgthlaYlbLD6vN5tnnZgmifUuzsk9w06z+IWLotSkn/msNlWifiA1du5xGMPGkFHQ74tG40iUIUwnyA41F1qs+4SU6dN0qalg3JQ9iaGrgiORPjU0vxNZ17iunTtUTtJVKnRqfzRgk0rIJyCGuNrRnIaPHV4neJw5vpqWisrO+YoV7vWPXNfjaGy9VSpqEa83lIZv2jGRxY/t4HPqu4FvxTLHsWgyDdOUqUF1nLFB9Ulk2jj/NP4ECY3HrViNATq0c6f1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKPeGkuSUj1mglfBetH6uxEyHN33Qze/mgf/BV6Oiko=;
 b=MX8w4TkMfufaN45u5DCquri3QBcFg+/8PLSYq90e89XPiEITygIxZky3fIALIFgan/ghXWyUWii/QjKnlXGX82OHMauUDXmqvPEEPk6ohRCNtE03tcmXZCnD5hCRg+JWI0OJDemllR8hQdpbcmyt/+H+VH1RssJA9aiw1EPFeDQxUJDbTo0E3LbScOTuvE4JJDeb71MbfNmhj5dl98A6Yv6WStas0mjWj4GPAP0f+NVQ/SYeVsNZBjq2yCh+yUR5cOgVclXgVbYXDzkockRNzNnYMUdYRxzQOuMQpX7dxLeTX/7hJ/gP0ksfO3ZVQNB11dp0mDqPRWey1MZdhFn8jg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKPeGkuSUj1mglfBetH6uxEyHN33Qze/mgf/BV6Oiko=;
 b=keD2CKYE829Wckn9u84LeZ5TQIoyQwe/yEgtNAfQU52u0eruo0PK3/wQ3xLN8hoRO/YZqpNez1fQQ0XwVwSYQYTKVq4VcrGqm62KDskcUKSW3bH4hcjY6sWl7Q6vijFFkst7psW5ZfgOKeo/AWHMDCV9UHZUsqNWipNIKKD6Rsk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N05MdeU8/VjTpzeov1acnDCUfK8FbPirn3hBzPd+YPNkCyaSyTAJ/g5akCzV4uzIXJ5hGEN+1oppfIKQjFOcLFjpAEl90yrn/NO0W7ZPg+XTgMoVnDBEfnzOy36l521MF+JUbstVknSQZIul6F5RnsMZydQ27tu9TL7Esrc3tfiGpAE94kPxuP67Af+k3sBAoRW27M2LyW6qg3959BTt5YufTnQ3OcVx0HQJ0j0YyiTRWDMIWSz695pn0vQ6RRPql42GYRZ97C5HMyKyv/icnwUNxrTYeSWFkfcVHq88BbVL5Sv+k5yLyOth8HcYZ+1L3MnCbXE6Sfmqz3Cj2FIxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKPeGkuSUj1mglfBetH6uxEyHN33Qze/mgf/BV6Oiko=;
 b=HpUREcWjyxOPiPeSzSf/iqc5s9amE5UK+Uea8rNtAoSDd2Rjp+rxrxQFdlpqO5wobVLBa7pJjVljYR5TC43X3/RqkHKAyauf1U01MByjfOzlfFuTCBE49mtNdhwZ99dkRGh+mKKqFXPUW1hrxfLD2J+ZyA0p9sdN4qLkPsWjyi+47bX9YLzevVVVohMPKFLQGWcHbBXTrat8yUpiUD5bWUk0avKHAjXfSoaprahJ4mw1EwOAYYiTLcYG9CYgG6MaKFLL+P65xuKWTMsw7TjJ/JOUb6C8ZUoqjMcTwHDYMys4wlWE057ay9b3FJHiNWmldaAZD7+SdpfZQs3WAtIPIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKPeGkuSUj1mglfBetH6uxEyHN33Qze/mgf/BV6Oiko=;
 b=keD2CKYE829Wckn9u84LeZ5TQIoyQwe/yEgtNAfQU52u0eruo0PK3/wQ3xLN8hoRO/YZqpNez1fQQ0XwVwSYQYTKVq4VcrGqm62KDskcUKSW3bH4hcjY6sWl7Q6vijFFkst7psW5ZfgOKeo/AWHMDCV9UHZUsqNWipNIKKD6Rsk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Oleksii Moisieiev
	<oleksii_moisieiev@epam.com>
Subject: Re: [PATCH] xen/arm: sci: Don't create a domain with unsatisfied user
 requests
Thread-Topic: [PATCH] xen/arm: sci: Don't create a domain with unsatisfied
 user requests
Thread-Index: AQHc4edxplgStM9xlEqAVSLJleDsJLYKH+UA
Date: Tue, 12 May 2026 09:29:48 +0000
Message-ID: <60249A8A-76AA-4EF4-B334-C83DE41B79ED@arm.com>
References: <20260512081442.48149-1-michal.orzel@amd.com>
In-Reply-To: <20260512081442.48149-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU0PR08MB9798:EE_|DB5PEPF00014B9B:EE_|GV1PR08MB11167:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee8026b-2286-45b1-7371-08deb009297a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003|11063799003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 2AU0iy9m8qlqjaGLQIrjxP2G1VRtSKo5PKFAwIyulzNRPxi8cSUKQhvINaNuuJiN8mcgNTV/cKfhBfHklqLb+LaaRqiug2ehkYCJovmSeLIOB5anIgnD4LIljI1phlWMpJuu13zkoAqyqOJkEeg6gu2oh18t5PtOLPCNYtdMJN/qw5+rN351J7HuV1hRalLLg7jX+W/87sU5onFtcUXZWUN7Jcdk5EDYsEiGj2pxaMG6l1KcdLTx1MKXwx/SZ8EqBj2GL+A6G9VJ4dMG4Q+L2TY2xIZlKkVJxLWUg7C3veQWjiw0PeqBu4eMzpB3Bm9lnJFaOGir856tl1s1Sf5HaDO8iDbdImNUBwZ0fo1/VZ1sCPm1LRiEkE3uhjg3IndmkRMU5twxaic6NzllJDonScD2Mimen78Y/3PfTQMM1p0Fz2m4v1ZXv8Yx+ZLHOfBz9QW1h7NOeKzA3Sl12qb3ix20EI475ThW2Yj6H7jnH2GlbqV7QRJ6Tjo7EnugcHuiVe079WttVse3zgtpA0HXneINdYuFQqjyLmcqwg7OtxU5i7AgU7kkA72RM5TI6gw+RFCChT8+GoMAeG+vrroUeBQytTQJSpXmmWNsx+pxJpwE6tFoh94jetsaXnhSmTg34BYReXRiTIZ8zHyc94FBOnb98yMr7dY2FFENAHBTOvu2ah9zJ03IknX3RlXo2mN5LI5E54/lr2b8JGdDhQ0jMipPW/pa+jgjD5Ahs98Ukia+Q7NbWe6Q/8cmeefM7EXD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(11063799003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1AEF338DE9236D4D9F7CEC030B371626@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 QtwLvCL3Tmb+B7Q+qv9m9SvkQ/FYDA1GxtcUmBtzwIxWXsKeDQ2s+0c2v/lrqMQ8ecEpvPO5e0JrrSoHiiunAv2fDayux5B5bsRiel343Y4IDqxj+qLdkoX5Xi/RBxNkVvuuEg/agXHzouUSq+iHJZq9PbwwbEfzbGASGr6RQgmwonwhlMXDS8kzLzqd0pDHlBEaupMaUcJihtoEvCm5/NC+bM6JFKMmcvNHfZktsy8q9CGSjicJcPHLAmkd+mOxSs3uJX2wO7lPBcYmxi9swStru8q0HPmMNpEmq1j5OmMmA6m++wVKPe3NCSgvaFwx7yZbr1tOurr/hljoZY+DTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9798
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	58df3d9b-0d72-4e9d-aaac-08deb0090327
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|14060799003|82310400026|35042699022|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	xPWAjf60QKhTjFtuXEwIwpHj/qPJejymhSDjdQhI/wkSobn/+HCUHvumhXFHbWc4daWrad/yna4O8eQ9/bnmSj3/le7F3LGSlANmY8FhkzvTZLp2m0sDApywG1d9siatOcnn24voDxZcll2sduLYJh5dzJrSGCIKQ4q4bR1MwqO+IrZFsCKh1zbDECmqadbeKg81MhtjraXiD7SV6lmG3ujxy/dK3QKUq6e/Z6oC0KeAwx9ArcMiKZ2zyNmNodmKqI6uwqASh9pe1mOAZHBVb+k/7T9Y+GLsDNzVP6Ba5EKeDuOR1BfIu2NqxnvoLRHHy6nMckJklCKJVvf7L74ms3ZHKyZQtttrLNf76mvmTHWBGdX6E8Fl/2LV0wZP8vpleAXQCs5n2oiZqdiSOdAHPA+pWsDk+iLaDGFVHa8di3K7IZUh4OEQK4VANoFvvoPmrTaNGMv4dAqjqBinxPBBoJtJYiVuAZ7IHeKpLaN0VqEiY1aEOvbBTUSvCRdqTBl8Ebihnp2oRk4lD7JvasZyVfCl/B3Dualv0VgSJ77cVVaXHjEa33hlbKh7mLNbx4Jrqf3LUNHDa0Q0/ey9gMuWrfTMisWsqTQIqWjEbl7afoJVndsu+t82+oZICHMrynyYN+fgBeZjU7FRRb5xuKVrFe0b1l0KaoPcBsRqj4GOSNK4Im+kXNKcwBBQvZb62LvHWTyXE8O0QLX/gfoT3dMuGU3vaEArmk6w7iFSYZWHAxM=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(14060799003)(82310400026)(35042699022)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vv19JzTfa2MMOurpAFjE/2g5kTKiaqzMI65+hgtNK68pyBSWRaN9Q9V1MUs1a2sTGoYCbj5QOMQsrCuYco3c2BDvrg3BbSXjpwOomYBOagRWBg48mi2CRqiLYLwllSws3XFGASSJk3UPGo9fRmYJw2XcPMk+e2iVwLfWdWdv0l3kz68FroEzuOQ60HTC4rhxi21CUAPmtJ38t9qWMxPmHYmOVuqdlkqS3dNAqlhYJQxRLpFveBwKnnU1MxvzK79K1bwkB+H/KbixDfAwiULlyvMJ05WxTYggKNcUD3eT+60HROAiUCu7GJLNXVoYulPK5ERckYiZwuDiGHeh2d4TpE9YqD0jUYIQ1jCsisNEbXBubvOQStRK9cwQ31xIdgfxHyvq1Fj9e4WRTtwKFxyHYhwo7zRtbIe3YFGP0KML+wK5CfRVLqBsD4ih+eetqWmG
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 09:30:52.9245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee8026b-2286-45b1-7371-08deb009297a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11167
X-purgate-ID: tlsNG-d25034/1778578262-F407FCF5-6EFEC896/0/0
X-purgate-type: clean
X-purgate-size: 820
X-Rspamd-Queue-Id: 3219451DC59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:oleksii_moisieiev@epam.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,arm.com:email,arm.com:mid,arm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

Hi Michal,

> On 12 May 2026, at 10:14, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> On Arm we stay on the safe side and refuse to create a domain on user
> requests (e.g. via xl.cfg, DT options) that cannot be satisfied due to
> the feature not being compiled in. SCI fall through the crack and does no=
t
> adhere to that i.e. a user request for SCI type other than NONE when
> CONFIG_SCMI_SMC (and thus CONFIG_ARM_SCI) is not set would be silently
> ignored. Fix it by not allowing anything else other than NONE if the
> feature is not enabled.
>=20
> Fixes: 10e7473d6024 ("xen/arm: scmi-smc: passthrough SCMI SMC to domain, =
single agent")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Looks good to me:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


