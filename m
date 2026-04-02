Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDEkM4kmzmnElAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:19:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5FD385CB4
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:19:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271254.1559474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8DGV-0002zC-FB; Thu, 02 Apr 2026 08:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271254.1559474; Thu, 02 Apr 2026 08:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8DGV-0002wt-Bp; Thu, 02 Apr 2026 08:18:59 +0000
Received: by outflank-mailman (input) for mailman id 1271254;
 Thu, 02 Apr 2026 08:18:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1w8DGT-0002wn-U1
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:18:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8DGS-00E9va-Uq
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:18:57 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ce2660-e002-0a2a0a5209dd-0a2a4509aab8-48
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:18:55 +0200
Received: from [40.107.162.47]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ce266f-bf79-0a2a45090019-286ba22fbc21-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:18:55 +0200
Received: from DU2PR04CA0227.eurprd04.prod.outlook.com (2603:10a6:10:2b1::22)
 by VI0PR08MB11985.eurprd08.prod.outlook.com (2603:10a6:800:346::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 08:18:50 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::c) by DU2PR04CA0227.outlook.office365.com
 (2603:10a6:10:2b1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Thu,
 2 Apr 2026 08:18:50 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 2 Apr 2026 08:18:49 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV2PR08MB11395.eurprd08.prod.outlook.com (2603:10a6:150:2a5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 08:17:47 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 08:17:47 +0000
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
 b=DxHAbccolIbSmecPqJLVZkr4YaEA/186gbcI3+tj58R4Ka6Z61ucA88s4jJB+AhgbxGSihvzeEuXIEXS2IawhwG/PyQwgLlfKysuZvjWqQRDSCAgphrJea+5IlVaDjhL10066Ovw+7eSkTvBy8lWHbNxuyBvZjkOdzbLlz28onlravkqadrBih7CGdyeXU0jTe5TpuiQYgZ5XvJ+MZe3nvNQ9WQjTLHfJfEWLs+ejGfPGiZG0DzFYO8w8FZfpf3YfTWM3P7pCptJXU1gbBu4xQXV3EAdN7hbyn2zFXSrMPlrIDcIrbc6NRIuq3/b5dejVv3MPQ+ztQbO9sOSTB9kOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2XYJZR51dIbykVyt2stnsLHXYp1DL1SGjAbkVzeZsY=;
 b=wPoFiywIlCZN3lM3KbrncB4DtiHdcnteYpryTIpEZHQ9UH9SuuwmhPuRL/07wgRYniCf37sU+uQK3dzBsc5RwdcPqfzDxCGNmKDWcABxPhuv8saZgWr0pWk11b+bZs8FJ/cv9jFNjwNFVG/gPxPtbyQm7+B9SXYBf3pkhvKd31NAOtDrPt8LM7uhlR9aCvfoF1tkKaTFmCv06kQzEsDJr8KpAyLZHphnZUrNu6XQEOH74xeHCqCbAT28nFrkYBuC9Japnh0mY0ZZ37BREF1NPDDYZHE9q9ZAJLQ2ldtTUVUeSg4YaZzA2r25tbLtqHqrI07Si+4QElpkhgYvVyX7Mw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2XYJZR51dIbykVyt2stnsLHXYp1DL1SGjAbkVzeZsY=;
 b=ZFNJn0lhMO2EdB4PtTiAlkj2Jo1nZAymy3BOZN61y40sypEB7D0bFuQxEsiKF1g00I+A71hN/QBUHGIP9kJ7LQTYXv656/QLKAobgfgfzv+J9IPcUy++ZJi/RcjTBZS0HYi2bIBp58LrNPLkDsdAaSxuZPi/rIcpo7708ghUXIE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l09mxAgwZR6pHKyc2qhmJuPyoN3FRjpMSUtxVbYMbD1M2CWbxYs7yY4Z88Ci6bEzaQN3ratCOY6hlJbWxpYj97bf6guTycvy/YK9PJlsJr1JFi00LXeNHW3SLb5VOzfKNlww+j/WKKGc8kgWf4IzJ4tS6xQhw7pEb7HDvSVmcHCIAAFevViWspJkjhbupzvX7pPW82vibTsLJPt/tDhdmy2BAepUT1F8Rudeh9e7hLrDUK22Pnbk7kxCmrSTDiI6k11s+4H1m1ByWX/y0Pmk3tumfaxdyoUm+XhXKvsedjEcRwmpBMMDYZsRqJjSy+GbJqZw/feNkZyTkoObQ/P0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2XYJZR51dIbykVyt2stnsLHXYp1DL1SGjAbkVzeZsY=;
 b=KRirKXq6vzD+seJI+rz07AobJZ81zcUa9/Zu5MEtcneg4dv++JYIx/qDf+WA98MVDmUxzUc2PvyMxCxvyFzO3YYvHAkdNXCDmcKg30ql5eV0Pt9lGst+E2Dr0J3iXgdDc0LzahejJh+que7MTK5q7Ej+J4ZpTb+/Y6mwqGt8FV00cfGi1hoX0nEzkqEddH+A11nyHZhen+snoziSi9h9XSbk5E50Kbf+dw0MJ18PAEiHr6MhnVX4fn1of0i4AUNXyAiP9EQIWmDHEWtD9H8bMe+aH2mFr//dOf0RmdLhj5oL7iEjBuQfpBWKmN1yN+Mzs8DG1PbUc6mdvV2qYas8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2XYJZR51dIbykVyt2stnsLHXYp1DL1SGjAbkVzeZsY=;
 b=ZFNJn0lhMO2EdB4PtTiAlkj2Jo1nZAymy3BOZN61y40sypEB7D0bFuQxEsiKF1g00I+A71hN/QBUHGIP9kJ7LQTYXv656/QLKAobgfgfzv+J9IPcUy++ZJi/RcjTBZS0HYi2bIBp58LrNPLkDsdAaSxuZPi/rIcpo7708ghUXIE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: mpu: Fix ioremap_attr region size and return
 value
Thread-Topic: [PATCH] xen/arm: mpu: Fix ioremap_attr region size and return
 value
Thread-Index: AQHcwnZX7LJ68/q3sE+uKvflFE4pcLXLbU4A
Date: Thu, 2 Apr 2026 08:17:46 +0000
Message-ID: <B8E1DD34-FB7B-444B-9996-BE8F55C2A33C@arm.com>
References: <20260402075645.52583-1-michal.orzel@amd.com>
In-Reply-To: <20260402075645.52583-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV2PR08MB11395:EE_|DB1PEPF000509F5:EE_|VI0PR08MB11985:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e550a82-5c7b-4976-6ffe-08de90907841
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 npjOcQo4zYGBFFJxM2cq7JsnPtCUNgzdBNkBICau4NzXfJhRrOZwprBAUluhhlvfTx9ocJDN1LxG7a92cbe4lOqZ1DSONtwug+gLVSYbmAWO+m5ilfSwoB9LQ2nb6ATW68n3SsWvzn7ye19fDGGm6OM30edOpTRPAi0UwfFMjwsQ+PrzKeUtxzDIWA2G+aznnYGbXVS8D2u2aPaB4IsGkb24Wx33L2vT7rBcblYBVdhS/Dgc2a2sqUEHApcgQ7J2oNj0sokYIjjM26N//Kh9xaXoURw51La9mqsq7NcjNpCVWbdaugC9u/nKU4jTeft9C45BSqSMS1krzLTzvNyWBalMyZBbc18i7t481prJSrxL9WhmE/8JJejFz9deCccriBSbm39xy8Y/Bc8Hb3HjAlFfdKmh9Vhrrpwn1w2OGBYCck89UN0dfte9plt24udUdr60d1B9EMfd4ImX9AmQOPQXF4R4u2oi0jLh5XPJjSm0PRp6h5+Tr2j+6VE217IuClQXKB1BHeHA9Jswb5ilXlvjoxLp67r/idBUvVf8ti9oyOyrwNMddhC0H6k2vmHQfpBgTerUVmsvEHMzsZA8wqak0RvwpDZh8bCZev8ZLBaqBkzIEBlw9LGE/tt2qKuTg/37YXqVpctCFDODqdLeJ4fxYQ4pqQF8B8Ma/BISHJ1gQ/g/WX5w95uo6EO2tNZuVCIoq9UEEr+W895ff3nesXbiGMpkweotIq7DXYKw5c/OvqYJj9wQLXRugvjkRVh3WpM2s7nq2q61kLHdH576gi0+hFdzRYkHFbNvI3vz05I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FEA93D4FB4D8041AEE32AF43B0D7310@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 oDHvzMHQUDln3VmzFaG52CU0wnSN7HeYNWSzq4iM0CzzVlc2VKLxoynNEdo1ySSD3DZzQu2b3EXUGTyhKdK0nq+xRnBJ8AfRmLx+b1OfbtvwCBGJTfpWzV0UvNdvw6qKLHVUf9629iPwoUBxrYdjLzmVI6hurzvdIMO4mc5DR0aKtWB88PMDvRkGvWxX+h/WTC1yIDybekCcYmJMlFQu4GcE+s59M7u+wIV5JOswYazlpd5t9XbYJsokLSWbiu+Psa1sUBJ4i8r1G8I8OGS3iDhjxSi+KXQPgIMyCg0Jog+X8xFggu/f0jye/nDlzoMMLK8GMqyvtGqkEwiSfUdc4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11395
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d608fbfc-fee5-4c2b-25ef-08de909052b4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|376014|82310400026|35042699022|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XXtOsDC4LqbwJUpMn8ERXoPEJH8n5rlWBD/L3FXCVGYrCtSHttPKh763Muv1zFXiCC85PrQ6RJ9DDy5aiyjVO7gslQNbkzgxn/5XQDZ+jdq/h1EqqsrFaQb6lcktiYW9bpK7/dTyonCqzIaG7FKoPzNISQI1WRSeDy//s4gq0HZlsafjw4PiXSsYadF15YDa/6ydsiOqFgfrb8D2Ey3YRgq6l7+Uy/Sv7gdwhZw+NdyRIE2Irz83+9yUsRckjyC79zIrGGPyy5mhnf2oxeR4yjAc9L7iaaIIVLDOsC5UKKUjIlRpiohyC1AoF28rLmUaviEYW9ew0HqamuGevQPjH833WpKlbgaPxEU3+d3VlyRqfG756WJfVLqPWaptusQksCuDOeRdPiPD2ezKOxPR07Bpx4lthXtIxmmEM3sBy8oTrdDgTlaP2Z/DVwfLv6//1wJ0CsJrnXHweq2RB8nckUV3RSuUb3cBdbvhMRWC1o8dyOfc0gk9VFpR9ON8nmNEtRsHnZGIfi4/mNX+VJU5x2YUeTD6a1zB8JmIHe431vGMf7innt3ZTNtaBPGRZJturTTV0pHqcZJ9A/a79w4n26/NS5ZHrVEnpkzBGgLIg2iClpHTbuG4y++HVvSlqmytJdz+QSajN7mB6VFLqurElbXzJAeuzwnd1JioA+BhGqNc+y8l9s+HslQdFeNIGpZ9Y8KeYPWiuvFrq76bgmkKJfhk5//mSVPsB9/YMeZ+08CK8fWErWrZZByXd9Pshzk+7N/LuiSPnVb4E+ootrU/Yg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(376014)(82310400026)(35042699022)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MUjrpHYNwFGRySuTgFFaoXILVRzlu2h+FzJbaztGp/7eysRRqlzFVJ8QaEJzaSM7LKbdWE/A7AcGBOc/cLUbLWeewTkcGVt/rxj/ojhWe/0VgHggKJsqobmWHpXTDyK5qLiXj1daEToKXoCh8iM07QLEeWVzsh5LKGIb9/vUvuaDSg3VAc2cW4+eqcot/CLNzO4mL7aYea10VCR/OE3RQZ+ATM6em+8I5rGbl+zrkhVbpJGcpsJBaFJwlEhA6XixS9kDIMxYBdKQzNWGJL9qQ9kL1stBu31haYDb5vaJH5xIRCVD4WinRyC/ev4+C4c5qPEQPRNVre0HFo0PInU3VQ56h9bu0rpPmyxeegNf9hYUCEuWehzsq3nAiOfn0/o6ru2TpXjZAJreD+HOOCKOVq6fcV7hBaNLEd0FOTrNWzkeVdujhQyHougfsxudsEkH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:18:49.9442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e550a82-5c7b-4976-6ffe-08de90907841
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11985
X-purgate-ID: tlsNG-bad1c0/1775117935-2E354152-06EC882B/0/0
X-purgate-type: clean
X-purgate-size: 2588
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 0A5FD385CB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTWljaGFsLA0KDQo+IE9uIDIgQXByIDIwMjYsIGF0IDA4OjU2LCBNaWNoYWwgT3J6ZWwgPG1p
Y2hhbC5vcnplbEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IGlvcmVtYXBfYXR0cigpIGNvbXB1dGVz
IGVuZF9wZyBhcyByb3VuZF9wZ3VwKHN0YXJ0X3BnICsgbGVuKSwgYnV0DQo+IHN0YXJ0X3BnIGhh
cyBhbHJlYWR5IGhhZCB0aGUgc3ViLXBhZ2Ugb2Zmc2V0IHN0cmlwcGVkIGJ5IHJvdW5kX3BnZG93
bigpLg0KPiBXaGVuIHN0YXJ0IGlzIG5vdCBwYWdlLWFsaWduZWQsIHRoZSBzdWItcGFnZSBvZmZz
ZXQgaXMgbG9zdCBhbmQgdGhlDQo+IHJlc3VsdGluZyBNUFUgcHJvdGVjdGlvbiByZWdpb24gY2Fu
IGJlIG9uZSBwYWdlIHRvbyBzbWFsbCwgbGVhdmluZyB0aGUNCj4gdGFpbCBvZiB0aGUgcmVxdWVz
dGVkIHJhbmdlIGNvdmVyZWQgYnkgc29tZXRoaW5nIGVsc2UuDQo+IA0KPiBBZGRpdGlvbmFsbHks
IHRoZSBmdW5jdGlvbiByZXR1cm5zIG1hZGRyX3RvX3ZpcnQoc3RhcnRfcGcpIOKAlCB0aGUNCj4g
cGFnZS1hbGlnbmVkIGJhc2UgZHJvcHBpbmcgdGhlIHN1Yi1wYWdlIG9mZnNldCB0aGF0IGNhbGxl
cnMgKGUuZy4gaW9yZW1hcA0KPiBvZiBhbiB1bmFsaWduZWQgTU1JTyBiYXNlKSBkZXBlbmQgb24g
dG8gcmVhY2ggdGhlIGNvcnJlY3QgcmVnaXN0ZXIgYmxvY2suDQo+IA0KPiBGaXggZW5kX3BnIHRv
IHVzZSB0aGUgb3JpZ2luYWwgc3RhcnQgc28gdGhlIHN1Yi1wYWdlIHRhaWwgaXMgaW5jbHVkZWQN
Cj4gaW4gdGhlIHJvdW5kaW5nLCBhbmQgcmV0dXJuIHRoZSBvcmlnaW5hbCBzdGFydCBhZGRyZXNz
IHRvIHByZXNlcnZlIHRoZQ0KPiBvZmZzZXQsIG1hdGNoaW5nIHRoZSBiZWhhdmlvdXIgb2Ygb3Ro
ZXIgaW9yZW1hcCBpbXBsZW1lbnRhdGlvbnMuDQo+IA0KPiBGaXhlczogZWZlZWM0YzcwNzk4ICgi
YXJtL21wdTogSW1wbGVtZW50IGlvcmVtYXBfYXR0ciBmb3IgTVBVIikNCj4gU2lnbmVkLW9mZi1i
eTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4gLS0tDQo+IHhlbi9hcmNo
L2FybS9tcHUvbW0uYyB8IDQgKystLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tcHUvbW0u
YyBiL3hlbi9hcmNoL2FybS9tcHUvbW0uYw0KPiBpbmRleCA2YjNiMGIwNmU5NWQuLmFmZjg4YmQz
YTljMSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL21wdS9tbS5jDQo+ICsrKyBiL3hlbi9h
cmNoL2FybS9tcHUvbW0uYw0KPiBAQCAtNTk2LDEzICs1OTYsMTMgQEAgdm9pZCBmcmVlX2luaXRf
bWVtb3J5KHZvaWQpDQo+IHZvaWQgX19pb21lbSAqaW9yZW1hcF9hdHRyKHBhZGRyX3Qgc3RhcnQs
IHNpemVfdCBsZW4sIHVuc2lnbmVkIGludCBmbGFncykNCj4gew0KPiAgICAgcGFkZHJfdCBzdGFy
dF9wZyA9IHJvdW5kX3BnZG93bihzdGFydCk7DQo+IC0gICAgcGFkZHJfdCBlbmRfcGcgPSByb3Vu
ZF9wZ3VwKHN0YXJ0X3BnICsgbGVuKTsNCj4gKyAgICBwYWRkcl90IGVuZF9wZyA9IHJvdW5kX3Bn
dXAoc3RhcnQgKyBsZW4pOw0KPiANCj4gICAgIGlmICggeGVuX21wdW1hcF91cGRhdGUoc3RhcnRf
cGcsIGVuZF9wZywgZmxhZ3MpICkNCj4gICAgICAgICByZXR1cm4gTlVMTDsNCj4gDQo+ICAgICAv
KiBNYXBwZWQgb3IgYWxyZWFkeSBtYXBwZWQgKi8NCj4gLSAgICByZXR1cm4gbWFkZHJfdG9fdmly
dChzdGFydF9wZyk7DQo+ICsgICAgcmV0dXJuIG1hZGRyX3RvX3ZpcnQoc3RhcnQpOw0KPiB9DQo+
IA0KPiAvKg0KPiAtLSANCj4gMi40My4wDQo+IA0KPiANCg0KZ29vZCBjYXRjaCENCg0KUmV2aWV3
ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KQ2hlZXJzLA0K
THVjYQ0KDQo=

