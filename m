Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML+OCSVL+2nWYwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 16:07:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6029C4DBB4C
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 16:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301807.1575995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcuC-0008WG-P9; Wed, 06 May 2026 14:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301807.1575995; Wed, 06 May 2026 14:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcuC-0008TI-MB; Wed, 06 May 2026 14:07:16 +0000
Received: by outflank-mailman (input) for mailman id 1301807;
 Wed, 06 May 2026 14:07:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wKcuA-0008Rf-Aa
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 14:07:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKcu9-009w2q-Ng
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 16:07:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fb4b0c-2eae-0a2a0a5409dd-0a2a450384de-26
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 16:07:13 +0200
Received: from [52.101.65.55]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fb4b10-672d-0a2a45030019-346541376497-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 16:07:12 +0200
Received: from DU6P191CA0045.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::26)
 by GVXPR08MB11376.eurprd08.prod.outlook.com (2603:10a6:150:2e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:07:06 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::de) by DU6P191CA0045.outlook.office365.com
 (2603:10a6:10:53f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 14:07:05 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 14:07:05 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PAXPR08MB7443.eurprd08.prod.outlook.com (2603:10a6:102:2b7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:06:02 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 14:06:02 +0000
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
 b=JwSk72q3OmrYIYt6zuzOvfW4EarRJlloZzkfoNkFVCrLHGUNrxRaIdgrUDN8kZDgp8adoywySeF+y2IEtb+qCwVw5NfUykVGa4OHq8ZgyCcVb17ytIQgE2Gjg2Jpiz6DX2Twa2Xg0TZjOrZ48chb5txFgjgdakhVY7+jlezjC6FirUEIyBqK29oQkj5fH3Kh3NlThGtyqIGodFeoKW8pbxkqR92i5ab0yZKaw4QKWIZojSYeXA1CJwlRmZ0CJY+uSUd3/LcXLgeYIqOL5YFARSol5Buv5RA/N1ksgYJY031fMH8l8l8jPx4zIIT/2gd/omKZuqcF9irmbZHRDgPV9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kyZ75V/CI+PZSmQvvjR+dnfX4WO7h6pV9IUgDpoM04=;
 b=u2D4Ij8bxUFOO5RSsywBvFZ7SdsYAeMRaDWtFK8Ljgt81OTDmZ9r9B4byvVZ6q+A/Tr6dd4z4/qLS/Y6r679Jt5YRMZNR/byQ+wfkS3GeLDcO3FDds54k4yTTJb3ilNITlA+sXfsFP2KVoQN9N58P6gXzLJizOFMtu6AHchJ1rc2YdMjmGFjSZ2U0pc+euxVrJc6Pwj213tRkpp6VTrQvV0gqFiPX61c2DOs/xQ0wIom9St3f7+3OQzhoyMloXGpFxdDZtIfXzZ5LrcnfWmKNzZ27rJHesqWaWeJKqwJe03c9dgexaDi1ygJTfNARPbHCqFw5d8iXJhyCFVb1B7l+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kyZ75V/CI+PZSmQvvjR+dnfX4WO7h6pV9IUgDpoM04=;
 b=n1o+XOQ6waOcmzMGZEm4bENo5XJQDO/+XFrvQGNlPEFOniuckVHlE+O1ZyeLs9wHzwy/H3b4FMZUK2KeuVbFEJqb67VxmkDttlV6cyGBczEAqjggCjuPMvvaJOqBJhB6Oapv667oVImg0QCL/1MSWHZo+LsHa3Gq2GPTUswHNic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fon7iGKnHOQ4DjETQs1GPcp6Fz8ghJdeX1zFgQhfjPC8R93bl2dgwRhkE53Hi9JyQTOd/okYc19tmYU3TxutPdqCeaJK17QY2Oijo4pRMhVEYzjJTaCdN9iA3+FjQzkZslD70CDmkf0VfXhANkyoOKX2229WRGcQuXwZ4QJAGwoEurJPGv07OC4OHPFAhyZViqsYQU9F8GG9BsJZnd/kqJ4O7JYwoZvbjtQ5q8WVM+anVd2RSoBHW/NKeNkZe/w/llKMOUkQdUWLODegnrgjHhj66KrFs/7f5RqsyE8Czo00c2SiQVLZVS6yE6J/BJxMgiicxXnVpTFW+VDw1T1ROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kyZ75V/CI+PZSmQvvjR+dnfX4WO7h6pV9IUgDpoM04=;
 b=TfuXfiTr4K46bv1VtPpgQFHaC6kWKKg7JINa2uh8tewzOpemyZ+ZFAno1LZOq+xAC3RvICEI1hGc/V9UHT7chjjWMbFC7L4XeN/G5/+7Q6vlly5BoB1w12mKNwxlhzddejnEzzvjA2OTOj2629dt+iXMrommcGfgIz3yPoUVzYNSN+KaZq5Ekx6hMfJxb6w2l2f2e5+czh48Sd3hkPSz1itBABWh6ZyxpfDN9e1neh/N++OnaDXfKmix8+6OwC80jMXQKTcALYndjSkww8MPTRfpo+pclaFiTl15QM+QVG1aDWxN1hSBbyrqCi0/xUVA+yNJn8eIXU+bmlIDkGERvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kyZ75V/CI+PZSmQvvjR+dnfX4WO7h6pV9IUgDpoM04=;
 b=n1o+XOQ6waOcmzMGZEm4bENo5XJQDO/+XFrvQGNlPEFOniuckVHlE+O1ZyeLs9wHzwy/H3b4FMZUK2KeuVbFEJqb67VxmkDttlV6cyGBczEAqjggCjuPMvvaJOqBJhB6Oapv667oVImg0QCL/1MSWHZo+LsHa3Gq2GPTUswHNic=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3] xen/arm: skip holes in physical address space when
 setting up frametable
Thread-Topic: [PATCH v3] xen/arm: skip holes in physical address space when
 setting up frametable
Thread-Index: AQHc3TRHoODpo5BtK0edRSwNDE97NLYBCGOA
Date: Wed, 6 May 2026 14:06:02 +0000
Message-ID: <1EAB6ED4-3D64-4074-830B-EB9F8AD88547@arm.com>
References: <20260506084137.40913-1-michal.orzel@amd.com>
In-Reply-To: <20260506084137.40913-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PAXPR08MB7443:EE_|DB5PEPF00014B98:EE_|GVXPR08MB11376:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb455b3-cbfb-4ce4-9a2e-08deab78c111
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 lGPcy5vG5OdTzM2fHMBofdBBIjSUNWetwPPaICR8xp610ZvC9goBwQ35pw6+9pIS9VOtovHVbR3aUaTxjy9V6rDprnFMCKyDf7tAZ+WEYSg8IivkqHL/o831bp/1ZQVlZ7hmWQ5+VJLnfiFRykfHWjY4VIB4erjgfOMz3e3jLf8zGztZYebbTOsr2AQJW96scrB409lIffTYQ9qQqi02cBlWp/kheqbtv1hojd1P0fmv1vuYHAMa2SsGToGFGZw9aIrsVcBJqLnsqjafRMmn7C3OEFoM1Q1wD2LnDQfsz2KonB9lXTWP5St9HtdpfTuzwsBd9XAG7ZTJwJ9fnRh5UjfHtsul5sCRJxnRu9oevrJFtaGPGlEs/fpTFYJVvBd8WYS/6VoEzMUF/boqV33BEJolVJP/DTg30pA0LZoqkhfBaOJBmh6o8Xu+b1KQHTVyGKichmWLLZ0p7S788/s6WqDREopQnsXRksLJSRq77VnnQi1U/RXeZXeEL71jAR59IP43NpyQf8A2/a/e+nzDtM0iAbujZyqimTJ1b/AolD4JL9jH+YWvM1bDj6gFEFuLDeVUxwStY4RfXUryp3YrSlErtHGorir2EN1CqGvTRXtqLEwpDlrMaKbfzSVIUv7LgyeSqBB4qdm7d8M4YAvIhERgm5xtINBzQGiL/g8vuY4JAnuBhPBEyHFzAbKMRwvtWIc8VF/kDvme2EKKCRu7a0Bxdrty3sN610wFczj/GoQM5FeCJ6FbUNLnbX0xA0K3
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DEA80E900BCD24BA9DC009B7F7F2B7B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 abVt/igQp+57c2RT3aO2iNk708bZ0g5zKq2qWNIX1mpvPhVBRyz+R2CgajnyDSdfVFODl/cGP5jwXUzoziFpDOewOtjew9AJTo5pgEhvCFjwicg6pIjA+0srqXgBOY4dVx2ZnfJaLrQ4lBwdU4Rfcs5AAyTqHzZa9I0W3pmL89X1UHMWII0o4ecvitMCzAJdftNm7hWS5NkLhmERCf7h6eSeApiQkH6axviZo9WZUq8q60X+XxBEm1qZR7OYNNtX/oPhQ849wlETq3htpK1EMo7gC9PuY8WhZxZrmCIYEp7k2qasAd5SwFAerIIhqDm/nM4BzHIThUgRD6MUUAjjaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7443
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7e83b6eb-a30d-4a7b-48f4-08deab789b35
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|36860700016|1800799024|82310400026|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wO9Lo9KWLaHglfSUdGnR409HGcHvvQqhX0Cgp4jZM04OXCVshOjeVhTvyz3fyKgxmbvpdjy3IGa0JI9FPjPaQ0ebLFfLqhJYVWv16Bv6O0OupiZ0KI7XrD2lVkTKbxe/VEOIti1k6aYeL9cewrHXrgoeHTc2o7JF3Q0ZlH7d+1dT7NuWGl1utMOakrCFXL/k4ntjrkNy+HXEe8L+6ge535zBegzyZHMUsPxnoaiqzExvJ9Y87WtDqXDiGbQXk3CmMwayihDPalaOzo+cL3ViXq+qUtYU7XsbSbFB6R38BwPAPY0ZG1DOR4EV0gfekSqQfLsy71PfeJGp7Hj9F2mWHbFsRSSKzZi/iOobo2L9gk6dGlsIFquLk/sO5owQQQV1b7FxZIZu2kjKhn9STHcIKtChrdjLhOvOg9y2DaoiYTJl+m/KsDz8aagY9Ev6P9/vfaPz7DLU7Ey2efqJwEQG3y+cONYCcsgogrCGdLxbFlTcRSIhAjnTvyVD647q3GjFyjZ5dNveszU90mxjJGb7suZs0tI4OS5qI/YzvQCBoa6atZ2JTxYfK6CqTUq1gq15VWOLuGX/OqTBWAX2E5YZvzZPG8RDWzi1sufwBJKSNzmwvrS2++viyLEPOM/gZ+DYbgM9lr6TbXBoNB2Bl5wTmWRvKvvnqgOsc2uDYxEeFvOGwnk5vcrGgrh4hjxftr3tn4q9tP2t9eDAPcDLfFIGMp5GpzoMr4Q6+QGqZD7miQ4=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cyr4UW5YU2AyRVN7d1zNBeGC24MuXZ07EhxNJRYtQuuENTAx6Uq46nDme1YtcvmD0UVR1rb121Mn19rRc2t3SCU335L8UXx8yAnD5qeqzM70nBn8tROG33ldtDlmf/Ey75B14Uh/u1H1Eja3DfWdPqd5/u3DYLmbfBR4sAsxJVLw406TGyc8cWXo8TR7JH2p7e1d0Sznn+fR7VURtyrADWea7brhcdr3iSYD9ERnBuEMmvseu0ZHKrOlmlpjz1Z6yastmXkRLritcvmBe0JfypA2D4vV//2ROyLfZiRP4nFZgK8IaAnfQJ7GLX4mKq4ASe+6WBBb0HK6gq9Z9VvpKscm9XfPjyKYjGf9htjM8Jzlxm1nPhBdMwmK5ZobquFlQVbxAwM31N7wKcy86/taNt3lt6zosuZf23rJH8eDNBkRGqHD11d3yyB53SDfbtYt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:07:05.5640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb455b3-cbfb-4ce4-9a2e-08deab78c111
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11376
X-purgate-ID: tlsNG-33051d/1778076432-4279C938-FF53D739/0/0
X-purgate-type: clean
X-purgate-size: 7838
X-Rspamd-Queue-Id: 6029C4DBB4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[6]

SGkgTWljaGFsLA0KDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW11L21tLmMgYi94ZW4v
YXJjaC9hcm0vbW11L21tLmMNCj4gaW5kZXggNjYwNGYzYmY0ZTZhLi5jNDAxOGE2MWFhMDEgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9tbXUvbW0uYw0KPiArKysgYi94ZW4vYXJjaC9hcm0v
bW11L21tLmMNCj4gQEAgLTYsMTggKzYsNTUgQEANCg0KU2hvdWxkIHdlIGhhdmUgYWxzbyAjaW5j
bHVkZSA8eGVuL2JpdG9wcy5oPiBiZWNhdXNlIHdlIHVzZQ0KZmluZF9uZXh0Xyo/IEFwb2xvZ2ll
cyBJIG1pc3NlZCB0aGlzIGluIHByZXZpb3VzIHJldmlld3MuDQoNCj4gI2luY2x1ZGUgPHhlbi9t
bS5oPg0KPiAjaW5jbHVkZSA8eGVuL21tLWZyYW1lLmg+DQo+ICNpbmNsdWRlIDx4ZW4vcGR4Lmg+
DQo+ICsjaW5jbHVkZSA8eGVuL3NpemVzLmg+DQo+ICNpbmNsdWRlIDx4ZW4vc3RyaW5nLmg+DQo+
IA0KPiAtLyogTWFwIGEgZnJhbWUgdGFibGUgdG8gY292ZXIgcGh5c2ljYWwgYWRkcmVzc2VzIHBz
IHRocm91Z2ggcGUgKi8NCj4gLXZvaWQgX19pbml0IHNldHVwX2ZyYW1ldGFibGVfbWFwcGluZ3Mo
cGFkZHJfdCBwcywgcGFkZHJfdCBwZSkNCj4gK3N0YXRpYyB2b2lkIF9faW5pdCBpbml0X2ZyYW1l
dGFibGVfY2h1bmsodW5zaWduZWQgbG9uZyBwZHhfcywNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwZHhfZSkNCj4gew0KPiAtICAgIHVu
c2lnbmVkIGxvbmcgbnJfcGR4cyA9IG1mbl90b19wZHgobWZuX2FkZChtYWRkcl90b19tZm4ocGUp
LCAtMSkpIC0NCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZm5fdG9fcGR4KG1hZGRy
X3RvX21mbihwcykpICsgMTsNCj4gLSAgICB1bnNpZ25lZCBsb25nIGZyYW1ldGFibGVfc2l6ZSA9
IG5yX3BkeHMgKiBzaXplb2Yoc3RydWN0IHBhZ2VfaW5mbyk7DQo+IC0gICAgbWZuX3QgYmFzZV9t
Zm47DQo+IC0gICAgY29uc3QgdW5zaWduZWQgbG9uZyBtYXBwaW5nX3NpemUgPSBmcmFtZXRhYmxl
X3NpemUgPCBNQigzMikgPyBNQigyKQ0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogTUIoMzIpOw0KPiArICAgIHVuc2ln
bmVkIGxvbmcgbnJfcGR4cyA9IHBkeF9lIC0gcGR4X3M7DQo+ICsgICAgdW5zaWduZWQgbG9uZyBj
aHVua19zaXplID0gbnJfcGR4cyAqIHNpemVvZihzdHJ1Y3QgcGFnZV9pbmZvKTsNCj4gKyAgICB1
bnNpZ25lZCBsb25nIHBmbl9hbGlnbjsNCj4gKyAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZzsNCj4g
ICAgIGludCByYzsNCj4gKyAgICBtZm5fdCBiYXNlX21mbjsNCj4gKw0KPiArICAgIC8qDQo+ICsg
ICAgICogSW4tbG9vcCBjaHVua3Mgc3BhbiB3aG9sZSBQRFggZ3JvdXBzLCB3aGljaCBhcmUgYWx3
YXlzIHBhZ2Utc2l6ZQ0KPiArICAgICAqIGFsaWduZWQuIFRoZSBsYXN0IGNodW5rIGVuZGluZyBh
dCBtYXhfcGR4IG1heSBub3QgYmUsIHNvIHJvdW5kIHVwLg0KPiArICAgICAqLw0KPiArICAgIGNo
dW5rX3NpemUgPSBST1VORFVQKGNodW5rX3NpemUsIFBBR0VfU0laRSk7DQo+ICsNCj4gKyAgICAv
Kg0KPiArICAgICAqIFRyeSB0byBhbGlnbiB0aGUgYWxsb2NhdGlvbiB0byB0aGUgY29udGlndW91
cyBtYXBwaW5nIHNpemUgc28gdGhhdA0KPiArICAgICAqIG1hcF9wYWdlc190b194ZW4oKSBjYW4g
dXNlIHRoZSBjb250aWd1b3VzIGJpdC4NCj4gKyAgICAgKi8NCj4gKyAgICBwZm5fYWxpZ24gPSAo
KGNodW5rX3NpemUgPj0gTUIoMzIpKSA/IE1CKDMyKSA6IE1CKDIpKSA+PiBQQUdFX1NISUZUOw0K
PiArDQo+ICsgICAgYmFzZV9tZm4gPSBhbGxvY19ib290X3BhZ2VzKGNodW5rX3NpemUgPj4gUEFH
RV9TSElGVCwgcGZuX2FsaWduKTsNCj4gKw0KPiArICAgIC8qDQo+ICsgICAgICogUmVzb2x2ZSB0
aGUgZnJhbWV0YWJsZSBWQSB2aWEgbWZuX3RvX3BhZ2UocGR4X3RvX21mbiguLi4pKSByYXRoZXIN
Cj4gKyAgICAgKiB0aGFuIHBkeF90b19wYWdlKCkgYmVjYXVzZSB0aGUgZ2VuZXJpYyBwZHhfdG9f
cGFnZSgpIGRvZXMgbm90IHN1YnRyYWN0DQo+ICsgICAgICogZnJhbWV0YWJsZV9iYXNlX3BkeC4g
VGhlcmUncyBtb3JlIHdvcmsgdG8gYmUgZG9uZSB0byBtYWtlIGl0IGdlbmVyaWMsIHNvDQo+ICsg
ICAgICogZm9yIG5vdyByb3V0ZSB0aHJvdWdoIG1mbl90b19wYWdlKCksIHdoaWNoIG9uIEFybSBh
cHBsaWVzIHRoZQ0KPiArICAgICAqIGZyYW1ldGFibGVfYmFzZV9wZHggb2Zmc2V0IGFuZCB5aWVs
ZHMgdGhlIGNvcnJlY3QgVkEuDQo+ICsgICAgICovDQo+ICsgICAgcGcgPSBtZm5fdG9fcGFnZShw
ZHhfdG9fbWZuKHBkeF9zKSk7DQo+ICsgICAgcmMgPSBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25l
ZCBsb25nKXBnLCBiYXNlX21mbiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgY2h1bmtf
c2l6ZSA+PiBQQUdFX1NISUZULA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICBQQUdFX0hZ
UEVSVklTT1JfUlcgfCBfUEFHRV9CTE9DSyk7DQo+ICsgICAgaWYgKCByYyApDQo+ICsgICAgICAg
IHBhbmljKCJVbmFibGUgdG8gc2V0dXAgdGhlIGZyYW1ldGFibGUgbWFwcGluZ3NcbiIpOw0KPiAr
DQo+ICsgICAgbWVtc2V0KHBnLCAwLCBucl9wZHhzICogc2l6ZW9mKHN0cnVjdCBwYWdlX2luZm8p
KTsNCj4gKyAgICBtZW1zZXQocGcgKyBucl9wZHhzLCAtMSwNCj4gKyAgICAgICAgICAgY2h1bmtf
c2l6ZSAtIG5yX3BkeHMgKiBzaXplb2Yoc3RydWN0IHBhZ2VfaW5mbykpOw0KPiArfQ0KPiArDQo+
ICt2b2lkIF9faW5pdCBpbml0X2ZyYW1ldGFibGUocGFkZHJfdCByYW1fc3RhcnQpDQo+ICt7DQo+
ICsgICAgdW5zaWduZWQgaW50IHNpZHgsIG5pZHgsIG1heF9pZHg7DQo+IA0KPiAgICAgLyoNCj4g
ICAgICAqIFRoZSBzaXplIG9mIHBhZGRyX3Qgc2hvdWxkIGJlIHN1ZmZpY2llbnQgZm9yIHRoZSBj
b21wbGV0ZSByYW5nZSBvZg0KPiBAQCAtMjYsMjQgKzYzLDQwIEBAIHZvaWQgX19pbml0IHNldHVw
X2ZyYW1ldGFibGVfbWFwcGluZ3MocGFkZHJfdCBwcywgcGFkZHJfdCBwZSkNCj4gICAgIEJVSUxE
X0JVR19PTigoc2l6ZW9mKHBhZGRyX3QpICogQklUU19QRVJfQllURSkgPCBQQUREUl9CSVRTKTsN
Cj4gICAgIEJVSUxEX0JVR19PTihzaXplb2Yoc3RydWN0IHBhZ2VfaW5mbykgIT0gUEFHRV9JTkZP
X1NJWkUpOw0KPiANCj4gLSAgICBpZiAoIGZyYW1ldGFibGVfc2l6ZSA+IEZSQU1FVEFCTEVfU0la
RSApDQo+IC0gICAgICAgIHBhbmljKCJUaGUgZnJhbWV0YWJsZSBjYW5ub3QgY292ZXIgdGhlIHBo
eXNpY2FsIHJlZ2lvbiAlIyJQUklwYWRkciIgLSAlIyJQUklwYWRkciJcbiIsDQo+IC0gICAgICAg
ICAgICAgIHBzLCBwZSk7DQo+ICsgICAgLyogaW5pdF9mcmFtZXRhYmxlX2NodW5rKCkgYWxsb2Nh
dGlvbiBhbGlnbm1lbnQgYXNzdW1lcyA0S0IgZ3JhbnVsZSAqLw0KPiArICAgIEJVSUxEX0JVR19P
TihQQUdFX1NJWkUgIT0gU1pfNEspOw0KPiANCj4gLSAgICBmcmFtZXRhYmxlX2Jhc2VfcGR4ID0g
bWZuX3RvX3BkeChtYWRkcl90b19tZm4ocHMpKTsNCj4gLSAgICAvKiBSb3VuZCB1cCB0byAyTSBv
ciAzMk0gYm91bmRhcnksIGFzIGFwcHJvcHJpYXRlLiAqLw0KPiAtICAgIGZyYW1ldGFibGVfc2l6
ZSA9IFJPVU5EVVAoZnJhbWV0YWJsZV9zaXplLCBtYXBwaW5nX3NpemUpOw0KPiAtICAgIGJhc2Vf
bWZuID0gYWxsb2NfYm9vdF9wYWdlcyhmcmFtZXRhYmxlX3NpemUgPj4gUEFHRV9TSElGVCwgMzI8
PCgyMC0xMikpOw0KPiArICAgIC8qIEluLWxvb3AgY2h1bmtzIG11c3QgcHJvZHVjZSBwYWdlLWFs
aWduZWQgZnJhbWV0YWJsZSByZWdpb25zICovDQo+ICsgICAgQlVJTERfQlVHX09OKChQRFhfR1JP
VVBfQ09VTlQgKiBzaXplb2Yoc3RydWN0IHBhZ2VfaW5mbykpICUgUEFHRV9TSVpFKTsNCj4gDQo+
IC0gICAgcmMgPSBtYXBfcGFnZXNfdG9feGVuKEZSQU1FVEFCTEVfVklSVF9TVEFSVCwgYmFzZV9t
Zm4sDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIGZyYW1ldGFibGVfc2l6ZSA+PiBQQUdF
X1NISUZULA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICBQQUdFX0hZUEVSVklTT1JfUlcg
fCBfUEFHRV9CTE9DSyk7DQo+IC0gICAgaWYgKCByYyApDQo+IC0gICAgICAgIHBhbmljKCJVbmFi
bGUgdG8gc2V0dXAgdGhlIGZyYW1ldGFibGUgbWFwcGluZ3MuXG4iKTsNCj4gKyAgICBtYXhfaWR4
ID0gRElWX1JPVU5EX1VQKG1heF9wZHgsIFBEWF9HUk9VUF9DT1VOVCk7DQo+ICsgICAgZnJhbWV0
YWJsZV9iYXNlX3BkeCA9IG1mbl90b19wZHgobWFkZHJfdG9fbWZuKHJhbV9zdGFydCkpOw0KPiAr
DQo+ICsgICAgLyoNCj4gKyAgICAgKiBNYXBwaW5nIGFkZHJlc3MgaW4gaW5pdF9mcmFtZXRhYmxl
X2NodW5rIG11c3QgYmUgcGFnZS1hbGlnbmVkDQo+ICsgICAgICogZm9yIG1hcF9wYWdlc190b194
ZW4oKS4gQWxpZ25pbmcgdG8gUERYX0dST1VQX0NPVU5UIGd1YXJhbnRlZXMgdGhpcw0KPiArICAg
ICAqIGJlY2F1c2UgUERYX0dST1VQX0NPVU5UICogc2l6ZW9mKHBhZ2VfaW5mbykgaXMgYWx3YXlz
IGEgbXVsdGlwbGUgb2YNCj4gKyAgICAgKiBQQUdFX1NJWkUgYnkgY29uc3RydWN0aW9uLg0KPiAr
ICAgICAqLw0KPiArICAgIGZyYW1ldGFibGVfYmFzZV9wZHggPSBST1VORERPV04oZnJhbWV0YWJs
ZV9iYXNlX3BkeCwgUERYX0dST1VQX0NPVU5UKTsNCj4gKw0KPiArICAgIGlmICggKG1heF9wZHgg
LSBmcmFtZXRhYmxlX2Jhc2VfcGR4KSA+IEZSQU1FVEFCTEVfTlIgKQ0KPiArICAgICAgICBwYW5p
YygiRnJhbWV0YWJsZSB0b28gc21hbGxcbiIpOw0KPiArDQo+ICsgICAgZm9yICggc2lkeCA9IChm
cmFtZXRhYmxlX2Jhc2VfcGR4IC8gUERYX0dST1VQX0NPVU5UKTsgOyBzaWR4ID0gbmlkeCApDQo+
ICsgICAgew0KPiArICAgICAgICB1bnNpZ25lZCBpbnQgZWlkeDsNCj4gKw0KPiArICAgICAgICBl
aWR4ID0gZmluZF9uZXh0X3plcm9fYml0KHBkeF9ncm91cF92YWxpZCwgbWF4X2lkeCwgc2lkeCk7
DQo+ICsgICAgICAgIG5pZHggPSBmaW5kX25leHRfYml0KHBkeF9ncm91cF92YWxpZCwgbWF4X2lk
eCwgZWlkeCk7DQo+ICsNCj4gKyAgICAgICAgaWYgKCBuaWR4ID49IG1heF9pZHggKQ0KPiArICAg
ICAgICAgICAgYnJlYWs7DQo+ICsNCj4gKyAgICAgICAgaW5pdF9mcmFtZXRhYmxlX2NodW5rKHNp
ZHggKiBQRFhfR1JPVVBfQ09VTlQsIGVpZHggKiBQRFhfR1JPVVBfQ09VTlQpOw0KPiArICAgIH0N
Cj4gDQo+IC0gICAgbWVtc2V0KCZmcmFtZV90YWJsZVswXSwgMCwgbnJfcGR4cyAqIHNpemVvZihz
dHJ1Y3QgcGFnZV9pbmZvKSk7DQo+IC0gICAgbWVtc2V0KCZmcmFtZV90YWJsZVtucl9wZHhzXSwg
LTEsDQo+IC0gICAgICAgICAgIGZyYW1ldGFibGVfc2l6ZSAtIChucl9wZHhzICogc2l6ZW9mKHN0
cnVjdCBwYWdlX2luZm8pKSk7DQo+ICsgICAgaW5pdF9mcmFtZXRhYmxlX2NodW5rKHNpZHggKiBQ
RFhfR1JPVVBfQ09VTlQsIG1heF9wZHgpOw0KPiB9DQoNCg0KQXBhcnQgZnJvbSB0aGF0IHRoZSBy
ZXN0IGxvb2tzIG9rIHRvIG1lLiBJ4oCZdmUgYWxzbyB0ZXN0ZWQgZm9yIEFybTY0IE1NVS9NUFUg
YW5kIEFybTMyIE1NVS4NCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2Vs
bHVAYXJtLmNvbT4NClRlc3RlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0u
Y29tPg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

