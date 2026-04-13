Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMPbOhyu3GnfVAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 10:49:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5BC3E9563
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 10:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1280953.1564036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCCyu-0007mt-IU; Mon, 13 Apr 2026 08:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1280953.1564036; Mon, 13 Apr 2026 08:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCCyu-0007lN-Er; Mon, 13 Apr 2026 08:49:20 +0000
Received: by outflank-mailman (input) for mailman id 1280953;
 Mon, 13 Apr 2026 08:49:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCCys-0007l0-SH
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 08:49:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCCys-00Bd1x-7x
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 10:49:18 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcae05-2eae-0a2a0a5409dd-0a2a4504d7c4-24
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 10:49:17 +0200
Received: from [52.101.83.6]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcae0d-bb33-0a2a45040019-346553066770-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 10:49:17 +0200
Received: from AS4P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::19)
 by AS8PR08MB7719.eurprd08.prod.outlook.com (2603:10a6:20b:524::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:49:15 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::37) by AS4P190CA0015.outlook.office365.com
 (2603:10a6:20b:5de::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 08:49:15 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 08:49:15 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS4PR08MB8119.eurprd08.prod.outlook.com (2603:10a6:20b:58b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:48:05 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 08:48:05 +0000
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
 b=Hrzm0UhGfKBAsdGQ9gD3L6mQpF6HZps3WIadIWqnopdO5OjpEp4YkZOc5qK7e+cEsU4848LYVqwCJsnpxSHqJ57lbQLUcVcWIWdpSR6/vHPQJQ8j6xIxHZx7gujYSrxLQ2TdIpaOVcgVp5Q1GBmRheSgl2UIA0DRLtfXpxcS9N5cWBT+AChwWlq273us2uFgI1uB3d6JZDgSkAhTgqSzyRRb7qum1d8vH36BVoPkw13M0/ciDTWVMqMNum/HBpzF8NYyX3bwDR6VIDXEmkUbz3wzQ5qhMwmIFqqBlYxmBggd8BTKsJNYE2V0Ud9MbU46227cQldhV05IOiAxtMv3CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSyyuiyaulZe6vGzx6PQiq0FhYY6RBF0uFvWX1WEj3I=;
 b=zANlsrk+ZNzv5cowB1/4dD1489yw7eRCwqCR6/a8T4Q6z/xep1UeajGfkYi/FUhLr9WVEQvbxy/tv1duRI59HkHLXydbfWOFJxawPLJoXAp9JZk/jNMS7Pw5mW3JNcUxzG/mBdJO5P+3dXfQ32bAgV4Q2OpUEwZFr3pBjCpHKBdwKgTKTlHBOmjkC5UXC4qUxFoHk/aO3sFaihUzhcBgGBo9Pp12yYNZhuQ90jV4FUaGUHJkgaXYBuKCkRdJIpDYJsxrrhrEMOuvA177PK13IQFJXjMjjZDjq29gbWE3CeLnJgvJr3/Vc3pmsXeX//B9WsInUrZw5Rc2qMGw/L+1IQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSyyuiyaulZe6vGzx6PQiq0FhYY6RBF0uFvWX1WEj3I=;
 b=dcDkJMtrHsgR1SZGqXr+Flh5RUCgoYWliFeS4rKa0um0qjTGG66w7yt3dl9QtQ3zxy3zeMszUhiBuf4ltWJJFzSvh2oQ/Wbhn8AOdOsvJ9doy8eIun8yVqHldB3ktP5TKIHNGhrSpFteJWMRuCR367ZarPCHRvEJF/vIgi5VzpU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a98PXDywqD7slfSM/GTSPVfowivBvPMi9roq7NWBav4K3mv8foXl29mMS6bi7RS6QjbKTvOYTXpqZ+o0VzKca5pA1vkxmJavm1wxBmd3VDY8KhDbZZipJRbdxAaALXgBjg71hLnuE9WDkTFDiv/zrnELRKlH+4fuS7uvmezAA9SgDEbFBY0PyBG3duBZoj6JuuOUHodlytd0LW6e07BwD7HlB4xL+v9BIDeVuegzk5n125UyFeVNOQCGAeEq2UIcg+PzqTalUqLaziJCIsG5EEfF08eo9pwVKn4M2Y0nQP71ojKXBgG4uaqKfGvgJzlsGmTnIchhbon5HIYH9MMDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSyyuiyaulZe6vGzx6PQiq0FhYY6RBF0uFvWX1WEj3I=;
 b=aW+ufWqGNIybB1C9C1WGnh+rUSnMzRBdq0ti0btetjEvRQaHFBOs+fLEnzKMjoQbdQjqclaVnbsLGwARendaiyq8wJfFXRz5r51ejo/FJTkDjWerxjKK7yw2SSP+OJQllHaUicSn3sbtnE2GQuodq3p74caHwXRYxNAfG3r/yXdc2wftO51IzCTma2dj1XRogcgHX2qoDfSmJkjfY1W77zfwP2Ahuii4WBWhE4ScXu7EIkWly0CswQmegr52rgqI/z1qvCKGNFCMGR5rlH02rgSlbvAFpmJXCdIZcepx8CLUpeRB+0gjJBI/n1gklu1sFRZ6Hfj5PzKBeaXNvKQYVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSyyuiyaulZe6vGzx6PQiq0FhYY6RBF0uFvWX1WEj3I=;
 b=dcDkJMtrHsgR1SZGqXr+Flh5RUCgoYWliFeS4rKa0um0qjTGG66w7yt3dl9QtQ3zxy3zeMszUhiBuf4ltWJJFzSvh2oQ/Wbhn8AOdOsvJ9doy8eIun8yVqHldB3ktP5TKIHNGhrSpFteJWMRuCR367ZarPCHRvEJF/vIgi5VzpU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 09/23] xen/arm: vsmmuv3: Add support for cmdqueue
 handling
Thread-Topic: [PATCH v3 09/23] xen/arm: vsmmuv3: Add support for cmdqueue
 handling
Thread-Index: AQHcyyI+uCH3fkXed0iT4v0tOTag1A==
Date: Mon, 13 Apr 2026 08:48:05 +0000
Message-ID: <28D320C1-8CE3-4C9E-9C0F-4D82863ED03A@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <b223a8bb3e4d8771fc643c324a692a2639a91c12.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <b223a8bb3e4d8771fc643c324a692a2639a91c12.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS4PR08MB8119:EE_|AM4PEPF00027A5F:EE_|AS8PR08MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afde00e-f4c3-4fa3-9e8a-08de99398ab0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 RuF+Bz0tgwzlQS6RX1OnLisR0oHHhvtWRccJdb+Pzj65l2G9ZoAxm9O5q94fH2op4MZxfMUaWfbyua0xhzwlDbYcqPpY0dVmKJQezgO5Ap/UVOkkTlaPvDvSR54uUrWq9dTzEWYH0tsazcNLSrBEhJPz6/MWWMJq4pvgdkIrp0iWxLPCWCkfm9yk/wzB2pRtPe9tnbS1VtUNvR9t2IfEvwnIUdRsbCDY0y/1QFzrdw9pDy6caGauXlWgOXdm2nHA9gCl6AILUXgPMQpLhaV2rBqQ/LW7MdKQ7S4kXLSKoGeHLa7SfQBiVTPCcAPGV9fw0Eo2NGToWQeGJ1yKR8rbBOJLKUWMXgB2gXT7tAdPodFnVBj9qSP78QBD3fBuspGjF1iWy8uiqHlO9Exrh3SMQCPzy6jxx+niHAY4+nHCoPtIJ9rSDEmjOLpOujiro7owiXn/RqDR+XuaI/KeCByPPgp185Tgmlf/k4yosGi/pXSOTYti7jruHa2uFIDTmpylFaqcg271LnyruuSRDWcj9mf/YjcS9l59i8Bc6USwwCftNUuQoXQ5D3ydzTB7lvZ/Cus+3dE1HG99xVEA/KlH77IKVN7Gk9XFJNrcXCFWY/0X+kj37TSGUY/J5iouK3fbqchzASssiJSX4ErMuj4jfdXeI0Ad1zNVxPVDqOT255WZGJJUPJ03rBxPANe1NOO3zEtkIsuTsBxJ9s+n9Z+CVa6fLG9gG4sOw4xJPHel/vxQ4L5NU/WcOCDVdp88bPBGlRxY20z1DBQzeDhx2BUeKFaL8O3XwMqyMb3Zomnx+ns=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <00E0BDE2F840D340815712ACEBAC2FB3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 B9bE+MDHIlcMKws8f2heeWTCSMi+TbxFQqzdaoxs+z4YAUbABM1vV5yrKLNVL/ddeTDHmP/HcbppgqmDXSmOoaVsHhNNAHwE3+sU/CM5Vsr3lY6g3My6YFlxxxrqf1wTDzYHLyhqa/Z16bLzqTMErcrPNXUOCH1c1HHXToKF0R0Zm404p7rR5lmnWdV8HSQJ5rVQnJ2Omwk6N/I5tlCf4cu/agMx2gyFvNHJnMU5tmBZPlnobXsR0PTpk2aRqGN1K2X3UfXhPSAkp7CnGIt4r3qUjKE3cjjrS+AKIqm5F6J67UfKcvVWf/rh1020GhjdKQk6ucjIonaqCa0QF4EslQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8119
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b1a95a2b-5dc2-4d0d-337c-08de993960ea
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|36860700016|376014|14060799003|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KPaSYfEr19Hl8vwfEn0Bderbw2BFrcvq94SqX7gW7U43eVS6n7/bPjBval5RCqddgyN+79UUVxmWF2QzE/eI7X51rwRo/XEZZJHDo4N2DLMLysDB3/27HXls+XBnvPwkT6oxu9THnP1L7XxI45GQXIuxM2JAyBniWjektaDivFJ9XhESjwMNczXjcQCl2/dPjyQwOFCI8jPq8ZM9N8Qgc0phRoJbsk5hHM9iJjUmOc8AkbSmef96hqFnCP5JsbyUi3FNDOionh8KQzJTGXgi9buXHmnqa82j7zxQWM0EniTZQK1HvuCER0NoIKrCeztIfIE/H86U9gGpbZcXzRka9Zr6ub98Tiu0ZTz7aR6SeWnJdbSyAOyWUs+58/25Yy8X9WcCj3mvS382YDxi1nEbq8xpI6H6g61/pVT0NygdSCYIXOj0L8trrnLYdOicbLpw+ykzxxOWexdsebTDsNQ9gVdYok3KGi1X3DkxMIJcMJE3ixywcEVIQQnEoz4BKEUBa3GthDwKEOMmxKY6MJbDW70Sly445zIhqnZOxj9WPeJ9z49uTX3rXbB40UnURs2oU1LT4PjhiZTcL9mrTXpxxJta43Zb4WU7oYdYSovTKWzw8xQebTvE31bFuOcj2fDDiZ9sfgfl/13owXt3aMURvO3HpZc0tqJrhMIshRKTiOwEBACEqOPyaNp2Tqp1RkfLEEYPyX9HB5d5avO3GKAosfOceJULlhZMeiQeX5pEOxPmtFJffZy3hHnaqnaGuNE3VxtMoIUZ643y0kLPS8Ry5Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700016)(376014)(14060799003)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EtQZSC0QlYgsiqTHPwSjzg7xutrxjk+M0FSOCYcFOknMtTnFgDkH0O99umsOQwX4C23DgkZqYFWVmexIaPonL1ThT3b/+Vj6nbNlAFKt9Y4hPcti/w2rNH/LGb++nuIG82lZEenhk+SX1Q7hIZcWoo0xEM/vH/PTgqsgtOwSESd4wkqIvMHyeh6NygibcRji6crPnp9rg2Yj/T7xZIqRWnIIoIaaTHWEesOh8EU1+OoX3hTjvMjCfsNL3Qjh30BMPpcBekNz2o/FLnfgeZsPgebmgZRS3YCqj04f+GuhF7iRNEzgiOKkg1onHhK80BJ7nOizDJyvC10zRHrh0ek7V+rK9vcb366pPoCfoC2nb6+3CBK/nnyYgzDXuo6fKexlAmLcmIeD/7aYry6WTpwf58qzZ+nlK9hlW+o6nYcytXPPsypMTv/O904pr3+8DhYI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 08:49:15.1113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afde00e-f4c3-4fa3-9e8a-08de99398ab0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7719
X-purgate-ID: tlsNG-ebf023/1776070157-3172251B-B31996AF/0/0
X-purgate-type: clean
X-purgate-size: 8126
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: 5F5BC3E9563
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTWlsYW4sDQoNCj4gT24gMzEgTWFyIDIwMjYsIGF0IDAyOjUyLCBNaWxhbiBEam9raWMgPG1p
bGFuX2Rqb2tpY0BlcGFtLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBSYWh1bCBTaW5naCA8cmFo
dWwuc2luZ2hAYXJtLmNvbT4NCj4gDQo+IEFkZCBzdXBwb3J0IGZvciB2aXJ0dWFsIGNtZHF1ZXVl
IGhhbmRsaW5nIGZvciBndWVzdHMNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxy
YWh1bC5zaW5naEBhcm0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWxhbiBEam9raWMgPG1pbGFu
X2Rqb2tpY0BlcGFtLmNvbT4NCj4gLS0tDQo+IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS92
c21tdS12My5jIHwgMTAxICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4gMSBmaWxlIGNoYW5n
ZWQsIDEwMSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYXJtL3ZzbW11LXYzLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNt
bXUtdjMuYw0KPiBpbmRleCAzYWUxZTYyYTUwLi4wMmZlNmE0NDIyIDEwMDY0NA0KPiAtLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuYw0KPiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuYw0KPiBAQCAtMSw1ICsxLDYgQEANCj4gLyogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9yLWxhdGVyIE9SIEJTRC0yLUNsYXVzZSkg
Ki8NCj4gDQo+ICsjaW5jbHVkZSA8eGVuL2d1ZXN0X2FjY2Vzcy5oPg0KPiAjaW5jbHVkZSA8eGVu
L3BhcmFtLmg+DQo+ICNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4NCj4gI2luY2x1ZGUgPGFzbS9tbWlv
Lmg+DQo+IEBAIC0yNSw2ICsyNiwyNiBAQA0KPiAvKiBTdHJ1Y3QgdG8gaG9sZCB0aGUgdklPTU1V
IG9wcyBhbmQgdklPTU1VIHR5cGUgKi8NCj4gZXh0ZXJuIGNvbnN0IHN0cnVjdCB2aW9tbXVfZGVz
YyBfX3JlYWRfbW9zdGx5ICpjdXJfdmlvbW11Ow0KPiANCj4gKy8qIFNNTVV2MyBjb21tYW5kIGRl
ZmluaXRpb25zICovDQo+ICsjZGVmaW5lIENNRFFfT1BfUFJFRkVUQ0hfQ0ZHICAgIDB4MQ0KPiAr
I2RlZmluZSBDTURRX09QX0NGR0lfU1RFICAgICAgICAweDMNCj4gKyNkZWZpbmUgQ01EUV9PUF9D
RkdJX0FMTCAgICAgICAgMHg0DQo+ICsjZGVmaW5lIENNRFFfT1BfQ0ZHSV9DRCAgICAgICAgIDB4
NQ0KPiArI2RlZmluZSBDTURRX09QX0NGR0lfQ0RfQUxMICAgICAweDYNCj4gKyNkZWZpbmUgQ01E
UV9PUF9UTEJJX05IX0FTSUQgICAgMHgxMQ0KPiArI2RlZmluZSBDTURRX09QX1RMQklfTkhfVkEg
ICAgICAweDEyDQo+ICsjZGVmaW5lIENNRFFfT1BfVExCSV9OU05IX0FMTCAgIDB4MzANCj4gKyNk
ZWZpbmUgQ01EUV9PUF9DTURfU1lOQyAgICAgICAgMHg0Ng0KPiArDQo+ICsvKiBRdWV1ZSBIYW5k
bGluZyAqLw0KPiArI2RlZmluZSBRX0JBU0UocSkgICAgICAgKChxKS0+cV9iYXNlICYgUV9CQVNF
X0FERFJfTUFTSykNCj4gKyNkZWZpbmUgUV9DT05TX0VOVChxKSAgIChRX0JBU0UocSkgKyBRX0lE
WChxLCAocSktPmNvbnMpICogKHEpLT5lbnRfc2l6ZSkNCj4gKyNkZWZpbmUgUV9QUk9EX0VOVChx
KSAgIChRX0JBU0UocSkgKyBRX0lEWChxLCAocSktPnByb2QpICogKHEpLT5lbnRfc2l6ZSkNCj4g
Kw0KPiArLyogSGVscGVyIE1hY3JvcyAqLw0KPiArI2RlZmluZSBzbW11X2dldF9jbWRxX2VuYWJs
ZWQoeCkgICAgRklFTERfR0VUKENSMF9DTURRRU4sIHgpDQo+ICsjZGVmaW5lIHNtbXVfY21kX2dl
dF9jb21tYW5kKHgpICAgICBGSUVMRF9HRVQoQ01EUV8wX09QLCB4KQ0KPiArDQo+IC8qIHZpcnR1
YWwgc21tdSBxdWV1ZSAqLw0KPiBzdHJ1Y3QgYXJtX3ZzbW11X3F1ZXVlIHsNCj4gICAgIHVpbnQ2
NF90ICAgIHFfYmFzZTsgLyogYmFzZSByZWdpc3RlciAqLw0KPiBAQCAtNDksOCArNzAsODAgQEAg
c3RydWN0IHZpcnRfc21tdSB7DQo+ICAgICB1aW50NjRfdCAgICBnZXJyb3JfaXJxX2NmZzA7DQo+
ICAgICB1aW50NjRfdCAgICBldnRxX2lycV9jZmcwOw0KPiAgICAgc3RydWN0ICAgICAgYXJtX3Zz
bW11X3F1ZXVlIGV2dHEsIGNtZHE7DQo+ICsgICAgc3BpbmxvY2tfdCAgY21kX3F1ZXVlX2xvY2s7
DQo+IH07DQo+IA0KPiArLyogUXVldWUgbWFuaXB1bGF0aW9uIGZ1bmN0aW9ucyAqLw0KPiArc3Rh
dGljIGJvb2wgcXVldWVfZW1wdHkoc3RydWN0IGFybV92c21tdV9xdWV1ZSAqcSkNCj4gK3sNCj4g
KyAgICByZXR1cm4gUV9JRFgocSwgcS0+cHJvZCkgPT0gUV9JRFgocSwgcS0+Y29ucykgJiYNCj4g
KyAgICAgICAgICAgUV9XUlAocSwgcS0+cHJvZCkgPT0gUV9XUlAocSwgcS0+Y29ucyk7DQo+ICt9
DQo+ICsNCj4gK3N0YXRpYyB2b2lkIHF1ZXVlX2luY19jb25zKHN0cnVjdCBhcm1fdnNtbXVfcXVl
dWUgKnEpDQo+ICt7DQo+ICsgICAgdWludDMyX3QgY29ucyA9IChRX1dSUChxLCBxLT5jb25zKSB8
IFFfSURYKHEsIHEtPmNvbnMpKSArIDE7DQo+ICsgICAgcS0+Y29ucyA9IFFfT1ZGKHEtPmNvbnMp
IHwgUV9XUlAocSwgY29ucykgfCBRX0lEWChxLCBjb25zKTsNCj4gK30NCj4gKw0KPiArc3RhdGlj
IHZvaWQgZHVtcF9zbW11X2NvbW1hbmQodWludDY0X3QgKmNvbW1hbmQpDQo+ICt7DQo+ICsgICAg
Z2RwcmludGsoWEVOTE9HX0VSUiwgImNtZCAweCUwMmxseDogJTAxNmx4ICUwMTZseFxuIiwNCg0K
SSB0aGluayB1c2luZyBQUkl4NjQgaXMgcHJlZmVycmVkDQoNCj4gKyAgICAgICAgICAgICBzbW11
X2NtZF9nZXRfY29tbWFuZChjb21tYW5kWzBdKSwgY29tbWFuZFswXSwgY29tbWFuZFsxXSk7DQo+
ICt9DQo+ICtzdGF0aWMgaW50IGFybV92c21tdV9oYW5kbGVfY21kcyhzdHJ1Y3QgdmlydF9zbW11
ICpzbW11KQ0KPiArew0KPiArICAgIHN0cnVjdCBhcm1fdnNtbXVfcXVldWUgKnEgPSAmc21tdS0+
Y21kcTsNCj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkID0gc21tdS0+ZDsNCj4gKyAgICB1aW50NjRf
dCBjb21tYW5kW0NNRFFfRU5UX0RXT1JEU107DQo+ICsgICAgcGFkZHJfdCBhZGRyOw0KDQpjYW4g
d2UgZGVjbGFyZSDigJhpbnQgcmV0ID0gMDvigJkgaGVyZSBhbmQgLi4uDQoNCj4gKw0KPiArICAg
IGlmICggIXNtbXVfZ2V0X2NtZHFfZW5hYmxlZChzbW11LT5jclswXSkgKQ0KPiArICAgICAgICBy
ZXR1cm4gMDsNCj4gKw0KPiArICAgIHdoaWxlICggIXF1ZXVlX2VtcHR5KHEpICkNCj4gKyAgICB7
DQo+ICsgICAgICAgIGludCByZXQ7DQoNCnJlbW92ZSB0aGlzDQoNCj4gKw0KPiArICAgICAgICBh
ZGRyID0gUV9DT05TX0VOVChxKTsNCj4gKyAgICAgICAgcmV0ID0gYWNjZXNzX2d1ZXN0X21lbW9y
eV9ieV9ncGEoZCwgYWRkciwgY29tbWFuZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc2l6ZW9mKGNvbW1hbmQpLCBmYWxzZSk7DQo+ICsgICAgICAgIGlmICgg
cmV0ICkNCj4gKyAgICAgICAgICAgIHJldHVybiByZXQ7DQoNCkhlcmUgd2Ugc2hvdWxkIGF0IGxl
YXN0IGhhdmUgcXVldWVfaW5jX2NvbnMocSk7IGJlZm9yZSByZXR1cm5pbmcsIHNpbmNlDQpvdGhl
cndpc2Ugd2Ugd2lsbCBpbmRlZmluaXRlbHkgZXhlY3V0ZSBvbiB0aGUgc2FtZSBlbGVtZW50Lg0K
DQo+ICsNCj4gKyAgICAgICAgc3dpdGNoICggc21tdV9jbWRfZ2V0X2NvbW1hbmQoY29tbWFuZFsw
XSkgKQ0KPiArICAgICAgICB7DQo+ICsgICAgICAgIGNhc2UgQ01EUV9PUF9DRkdJX1NURToNCj4g
KyAgICAgICAgICAgIGJyZWFrOw0KPiArICAgICAgICBjYXNlIENNRFFfT1BfUFJFRkVUQ0hfQ0ZH
Og0KPiArICAgICAgICBjYXNlIENNRFFfT1BfQ0ZHSV9DRDoNCj4gKyAgICAgICAgY2FzZSBDTURR
X09QX0NGR0lfQ0RfQUxMOg0KPiArICAgICAgICBjYXNlIENNRFFfT1BfQ0ZHSV9BTEw6DQo+ICsg
ICAgICAgIGNhc2UgQ01EUV9PUF9DTURfU1lOQzoNCj4gKyAgICAgICAgICAgIGJyZWFrOw0KPiAr
ICAgICAgICBjYXNlIENNRFFfT1BfVExCSV9OSF9BU0lEOg0KPiArICAgICAgICBjYXNlIENNRFFf
T1BfVExCSV9OU05IX0FMTDoNCj4gKyAgICAgICAgY2FzZSBDTURRX09QX1RMQklfTkhfVkE6DQo+
ICsgICAgICAgICAgICBpZiAoICFpb21tdV9pb3RsYl9mbHVzaF9hbGwoc21tdS0+ZCwgMSkgKQ0K
PiArICAgICAgICAgICAgICAgIGJyZWFrOw0KDQpyZXQgPSBpb21tdV9pb3RsYl9mbHVzaF9hbGwo
c21tdS0+ZCwgMSk7DQppZiAoICFyZXQgKQ0KICAgIGJyZWFrOw0KDQo+ICsgICAgICAgIGRlZmF1
bHQ6DQo+ICsgICAgICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLCAidlNNTVV2MzogdW5oYW5k
bGVkIGNvbW1hbmRcbiIpOw0KPiArICAgICAgICAgICAgZHVtcF9zbW11X2NvbW1hbmQoY29tbWFu
ZCk7DQo+ICsgICAgICAgICAgICBicmVhazsNCj4gKyAgICAgICAgfQ0KPiArDQo+ICsgICAgICAg
IGlmICggcmV0ICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAgZ2RwcmludGsoWEVOTE9H
X0VSUiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICJ2U01NVXYzOiBjb21tYW5kIGVycm9yICVk
IHdoaWxlIGhhbmRsaW5nIGNvbW1hbmRcbiIsDQo+ICsgICAgICAgICAgICAgICAgICAgICByZXQp
Ow0KPiArICAgICAgICAgICAgZHVtcF9zbW11X2NvbW1hbmQoY29tbWFuZCk7DQo+ICsgICAgICAg
IH0NCj4gKyAgICAgICAgcXVldWVfaW5jX2NvbnMocSk7DQo+ICsgICAgfQ0KPiArICAgIHJldHVy
biAwOw0KDQpyZXR1cm4gcmV0Ow0KDQpJbiB0aGlzIHdheSB3ZSBkb27igJl0IHN1cHByZXNzIHRo
ZSBpb3RibCBlcnJvciBidXQgd2UgcHJvcGFnYXRlIHRvIHRoZSBjYWxsZXIuDQoNCj4gK30NCj4g
Kw0KPiBzdGF0aWMgaW50IHZzbW11djNfbW1pb193cml0ZShzdHJ1Y3QgdmNwdSAqdiwgbW1pb19p
bmZvX3QgKmluZm8sDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ2lzdGVyX3Qg
ciwgdm9pZCAqcHJpdikNCj4gew0KPiBAQCAtMTA0LDkgKzE5NywxNSBAQCBzdGF0aWMgaW50IHZz
bW11djNfbW1pb193cml0ZShzdHJ1Y3QgdmNwdSAqdiwgbW1pb19pbmZvX3QgKmluZm8sDQo+ICAg
ICAgICAgYnJlYWs7DQo+IA0KPiAgICAgY2FzZSBWUkVHMzIoQVJNX1NNTVVfQ01EUV9QUk9EKToN
Cj4gKyAgICAgICAgc3Bpbl9sb2NrKCZzbW11LT5jbWRfcXVldWVfbG9jayk7DQo+ICAgICAgICAg
cmVnMzIgPSBzbW11LT5jbWRxLnByb2Q7DQo+ICAgICAgICAgdnJlZ19yZWczMl91cGRhdGUoJnJl
ZzMyLCByLCBpbmZvKTsNCj4gICAgICAgICBzbW11LT5jbWRxLnByb2QgPSByZWczMjsNCj4gKw0K
PiArICAgICAgICBpZiAoIGFybV92c21tdV9oYW5kbGVfY21kcyhzbW11KSApDQo+ICsgICAgICAg
ICAgICBnZHByaW50ayhYRU5MT0dfRVJSLCAiZXJyb3IgaGFuZGxpbmcgdlNNTVV2MyBjb21tYW5k
c1xuIik7DQo+ICsNCj4gKyAgICAgICAgc3Bpbl91bmxvY2soJnNtbXUtPmNtZF9xdWV1ZV9sb2Nr
KTsNCj4gICAgICAgICBicmVhazsNCj4gDQo+ICAgICBjYXNlIFZSRUczMihBUk1fU01NVV9DTURR
X0NPTlMpOg0KPiBAQCAtMzI2LDYgKzQyNSw4IEBAIHN0YXRpYyBpbnQgdnNtbXV2M19pbml0X3Np
bmdsZShzdHJ1Y3QgZG9tYWluICpkLCBwYWRkcl90IGFkZHIsIHBhZGRyX3Qgc2l6ZSkNCj4gICAg
IHNtbXUtPmV2dHEucV9iYXNlID0gRklFTERfUFJFUChRX0JBU0VfTE9HMlNJWkUsIFNNTVVfRVZU
UVMpOw0KPiAgICAgc21tdS0+ZXZ0cS5lbnRfc2l6ZSA9IEVWVFFfRU5UX0RXT1JEUyAqIERXT1JE
U19CWVRFUzsNCj4gDQo+ICsgICAgc3Bpbl9sb2NrX2luaXQoJnNtbXUtPmNtZF9xdWV1ZV9sb2Nr
KTsNCj4gKw0KPiAgICAgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKGQsICZ2c21tdXYzX21taW9faGFu
ZGxlciwgYWRkciwgc2l6ZSwgc21tdSk7DQo+IA0KPiAgICAgLyogUmVnaXN0ZXIgdGhlIHZJT01N
VSB0byBiZSBhYmxlIHRvIGNsZWFuIGl0IHVwIGxhdGVyLiAqLw0KPiANCg0KQ2hlZXJzLA0KTHVj
YQ0KDQoNCg==

