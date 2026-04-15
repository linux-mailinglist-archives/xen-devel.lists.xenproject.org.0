Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DL5B9yY32l6WgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:55:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813814050BA
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282537.1565104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0iE-0007I8-AK; Wed, 15 Apr 2026 13:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282537.1565104; Wed, 15 Apr 2026 13:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0iE-0007FK-7f; Wed, 15 Apr 2026 13:55:26 +0000
Received: by outflank-mailman (input) for mailman id 1282537;
 Wed, 15 Apr 2026 13:55:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wD0iC-0007F0-75
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:55:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD0iB-00AiWO-Jw
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:55:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69df98b8-2eae-0a2a0a5409dd-0a2a45069a60-42
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:55:22 +0200
Received: from [52.101.69.66]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69df98ca-0df0-0a2a45060019-346545429e43-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:55:22 +0200
Received: from DU2PR04CA0009.eurprd04.prod.outlook.com (2603:10a6:10:3b::14)
 by DU2PR08MB10280.eurprd08.prod.outlook.com (2603:10a6:10:491::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Wed, 15 Apr
 2026 13:55:16 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::84) by DU2PR04CA0009.outlook.office365.com
 (2603:10a6:10:3b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 13:55:15 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 15 Apr 2026 13:55:15 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PA4PR08MB5950.eurprd08.prod.outlook.com (2603:10a6:102:e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 13:54:13 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 13:54:13 +0000
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
 b=QnAtdtz5+lurcmZlwob5lN6btqapw6svmikI54YmOZWwy4l4Ztvw7s/bYEnT3HfAvZtl2Yc+bNhs4lwThMaJo3QikCLahowi7xVH0Oz9EVl8ou+I6z1ETgPZCg1dNkpilAygf8aC50jaglOrPxPvqHc2JFAoPhVzjlLYlcGBWZWCsAMOolOjN+thJvnGWqJGz3h1Fw3rZlWqz8bY9OJV6EsZljoPewynDHr7nbAyJ7rWOoubKbv6rj34MyYLsjqkZfeCM0u/vEWaVvvqrJqjsV2tY7qZwDlR27+CtQBCL4EsdHu4cTOXkNaVCEqkPQFXKP2TXOx7D6btHVrBA/fWfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixw4pxK1fDBPLFHhWF2pFWbJoAbbrbz1Drpqzf/0oNg=;
 b=jQs/xqM9hcvz9N46f7fZzptZ2O/D39902jWK6XioJjMqw7crFAKxVKndvgHYroFnDiFy2LwCm7kCjMUhl+lxC/ZvI0w+81XxEg3ZRt5LM30nBbLJJkVof+yTLzJcg1CO3SaxT8WhiHWr4Yx//OXbEfyDnbbIyM/CVsIfmwdaBaQ9mEz/NwJm2rIiF9U+el0LnNvGFnMvn1nonq479l6n1ANtMYtb6knsaw7J/PKq1XCxnSfOi7IIOwu16Z2NeSbf0e65upNj6M5sYdvgjHa5XFT3gre01MtRExl7jJBXWAiEZ8yTSvjC8goOCBWOopWbioz8wzn1Wm5P0ICqsHq+5Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixw4pxK1fDBPLFHhWF2pFWbJoAbbrbz1Drpqzf/0oNg=;
 b=GweTJdAVYy2uApPIh8EEdoCnf79bQSM9hfiE5Ai+mZiA/LhVzrQFHqcifosI+lvRY9fAGbOCXSbEany1Q0dQQLGpGOb7W8eilZJkuxcgecZdcaG7g95X85pJuJGNRttQJM/hKEsMfaX0fIYOe6RbcAQrapbAdQr1z8RcCQ9Q7hU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAOTJYTRw8fMviz0zSJPkJmD0i7aVs2+qeBBUz9jhGDcDPEu/vS+wLKmB3qM3PUXyGpwCWF/0sEoAJkjR5cvAt7YZQqYTmBtBvRGCNxc3SCJkTW09ZruIC6r63PkWmnYdsdRVTOU1i+vn02L99iUcni3n+r2quQtQkQae3rluIsfG840uply0GnZzGU/pAETBeUSXXru0OCC4egnuEmlDKKvv25UCBTi9qx6imSx4sKUyjqQZuY/8vY0Aa1OVqUzHtJ65GmeWn+SR3SvLK9ViR4oW0TP/98w0ZlihjaKcwr3wSGTaiNdWmOHx/hStHYF+16HV8SZSWH7ednnBpPUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixw4pxK1fDBPLFHhWF2pFWbJoAbbrbz1Drpqzf/0oNg=;
 b=iIn1kO0T4Q5muZ2qFnXD7fLdOmbNOyo6u80iUVPWJQk2zt0BS8d76yX1b/iBZIHDCedAH70vaVofEy/CIMhkRO9QpoGrDyAbP/sCdmqZmYNHNqs9d/L0qzhOnxC9NuQy1zTAKRLHrvpA2ZOdLSmUcnBboUz5SU66OqXbGW4KMdQ8dNF2nC4UFa4XlYRbnmukzCERugzacqw6D6E6x24vTwXh6XG/BT3upSXpPdgbuUILx0WKH9sq81e5cM4lvC3UxyVCXnc1N1VAQqpzLDsM2Fa8s3BE334F5cnPA1fG2SYPuh4I9M9p9tHjTnc177ZvSTaKW2qdmI1NEwye8GyhyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixw4pxK1fDBPLFHhWF2pFWbJoAbbrbz1Drpqzf/0oNg=;
 b=GweTJdAVYy2uApPIh8EEdoCnf79bQSM9hfiE5Ai+mZiA/LhVzrQFHqcifosI+lvRY9fAGbOCXSbEany1Q0dQQLGpGOb7W8eilZJkuxcgecZdcaG7g95X85pJuJGNRttQJM/hKEsMfaX0fIYOe6RbcAQrapbAdQr1z8RcCQ9Q7hU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH v2] xen/arm: smmuv3: Add support for removing devices
Thread-Topic: [PATCH v2] xen/arm: smmuv3: Add support for removing devices
Thread-Index: AQHczBC6OGp5DbFlyEyismnWkcVdqLXgJmgA
Date: Wed, 15 Apr 2026 13:54:12 +0000
Message-ID: <8CF45F67-B635-478D-9623-A69956FFEC5B@arm.com>
References:
 <da128e8fb41add9efc30860612786cd62f21addc.1776168699.git.mykyta_poturai@epam.com>
In-Reply-To:
 <da128e8fb41add9efc30860612786cd62f21addc.1776168699.git.mykyta_poturai@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PA4PR08MB5950:EE_|DB1PEPF000509EF:EE_|DU2PR08MB10280:EE_
X-MS-Office365-Filtering-Correlation-Id: 8debb3a7-9276-4798-bf6f-08de9af69f57
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 R42cZaqUvrAyQlGdmAemoK8YcZsI+rq+NmeodvdcnPDNXLr6gaRsI10f+jjhV5o6lS4sm2GpaGcbr3jrnna/Cgft+stuJNoIbXcwBxKwpsfmkSkRToMuY7so/r+xaKKRjs+XeSMZhbwr9sv8HS9D7mCSQtRguxjhi2zERJUwwMgrihhAp+wfXEeeYSp04Rf7/bmipha+hqCV8/EbIirbETkS0hhCbHojwctiJ0S0notwMnqW6rIMQTxgrod2VQ/ZvYR1iEvLPmEMlhfa/EWTaX/pVNtwqKMLV0XTBTm4VXZLHmyr5y89Cbp4cOIkeiFSsAlfmXOZhqpFCPjvcrPamkBthnBGWpyFVvcNBnjk8x7+bVCV9iLOpqYHXIE2ZU+EXvoGGFal09oXj/mLy40oYFddIWYPSFUdKL1t01+Fl66vaH9TycMSpqDQb4VvlZhHuBGyDdo/8MYCoYDEpxX9HGi3R0eCsdnAOn+uJJorVKQeXSxdjxiCUaq5+Tu2iHtUKeCVSOoYgxAtNlhzEj3LgHemmBso9QQg7EkHqIDhskfI7XJt0h8LIM8vrJUcjHW24OYdLXv1lP6SI5oZHC8g3aMnPc52srjjkHb2vvbyT2jEUhrO5LGLJZSGZ8bZEpCeFj8BWaTozIU1YObdg4P66lJujXNdykb6nFQLQHm+cWaUEBYSgXn7+dxO3D/8QO5Ym8n0ag7jgJq3olnTEbBSMwW3ZrqKjgkwawa07Ng7SdFFNlbgOND0H8XgdPPvAgwk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F34427B6B1A71148BA4CA0412031D797@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 sHIqLigVhujf0LcmlGJ6uMlf3QjcicGxCk+4oEda0vm7oXDraIbJlUJp2KLq4SWmmjt3WeIi4NJbMGio7P9sxbN/Zxh+l0a1fqxGGD9UwXcC611x+5Wd/lpXto2CTxSmSLIWd4mslosDzNilKVnFBwE1WmI7zGXHCYyHMi8VXrujLx9n+KXSyDuhrBA1nbnpDWwiixlelCtbxlDHP0aJdioxXvMiAKS76zsCA5XbDtPz7t4y3EFhl+VXDeoFhNwJBwxVZRdVHRw1LSeW188QrEa2xc/iqHNUc/UTeE9O68NRAjDdQhvJcNZNnhIl7N3XTN51pfVreTfzpoo3xnBQIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5950
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39460ed1-37d4-40d7-5fa2-08de9af679df
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|376014|14060799003|1800799024|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	W14+3C/i0/jaTo42g0k2nzPNpu0e8S2c3xcTvUaiu/aW/SzT5lSoSNhbh7RANaWpEeHLyPTDioRLUtiOAzwq3rmyDdTQiMgffhDM7/S2D1FKFfU2gMcv1Y5Wz3FdEsMOT+kcoQYPOFu3xB/VXg0AQz7T2jZVsVVcgFxwrXMNDtWs+1WEhTUtLoqmBJPg2g6iAvEpFQH07QyyqunP2ScsW8NS9WmRQOwSWycnymIgejZUCL8o5G2GMUWp1z5k6WQzBBw4fix9OF3gPN25uGFwyRyURMngtXiPeHC0L6XdSbtSl93kJbtoYTfB1bRP/wv/dX9l0xSP6gMpYgQ0hAFXrJfaA2ktKRCM03Fczct/909KFDJbUYdvnRgFbCj7UmtxrNjYrWRFaKe2CdbxincFlPvP6i8O2rjNri6RN6XthekPUbfOTdn+Eo24PLjRgJZJi4bqLYxGsJWKp5yujq1aYUYLaXgwWg52M9mSVrLN4a8kWKkk0Z0wVyLfVwYLSGTWin9W8rFwUMjQS1NX6l0koYYS2zb598i090JjuDU3dFv7GozQ4A8HT9nEyvBGSawf1hwjeCoPFGw5vlp75m3zq/duefZXnf7qdf+jYFNKaelpcWKIv2XDVpuRmsJb726Mxn3ek4osYRqdX6e8StfNAppgpJvHuiczsoHKFLJ+lbtAhttHtAQV8IJ99W3ZhcvamjXuEZXTGH4jmaHJPXFZofz4uvjNk4rIfPoZpSCEdIk=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(376014)(14060799003)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xLFcTu2v/CCgCAU/0eoZB0elylc2aNztO7EgdZWCoy9k8vjl8UdDrDSNv/Sb7U5H7MUVvX89rj3i+4B2Ll4uc0CabGsR0Z3PP7u/nE+Ic9RsYIH3aMPySlAGtFMcEMEmPea3Cl88DD2b0RJyYqywgZfZcJxe8dSUa0+2n0Yz01n1eKFS37tXg1s5VPVkEKDQLgwRwPNc5smGIxOQ3cbKneXvD98vFj+GG9nLexM9V78MRX2U1DcCJgx2NLkhSBQYKCB/AvGRvc75/2qeREdWOhC1ko6nPnBbCL2xnBnN2Kulp9l2PA5XsEdwAzuA/DyZMZcK4w/FoSAEFq6SbF9DuqDVTFnfdLNyquKfSzByfdo1pHLbaQN94UPmvMzY3Cosl6zJITg9hRK/KTxKN+w+REO8+Rv/S9YFjJc1T8dL1SLhrQoO/MKHk6h3sxSXoKrP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 13:55:15.8027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8debb3a7-9276-4798-bf6f-08de9af69f57
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10280
X-purgate-ID: tlsNG-16d1c6/1776261322-654513D8-680A911B/0/0
X-purgate-type: clean
X-purgate-size: 5538
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Rahul.Singh@arm.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchew.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:mid]
X-Rspamd-Queue-Id: 813814050BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTXlreXRhLA0KDQo+IE9uIDE0IEFwciAyMDI2LCBhdCAxNDoxNSwgTXlreXRhIFBvdHVyYWkg
PE15a3l0YV9Qb3R1cmFpQGVwYW0uY29tPiB3cm90ZToNCj4gDQo+IEFsbG93IGZvciByZW1vdmlu
ZyBkZXZpY2VzIGZyb20gU01NVXYzLiBhcm1fc21tdV9kZWFzc2lnbl9kZXYgaGFuZGxlcw0KPiBt
b3N0IG9mIHRoZSB3b3JrIGJ5IGRpc2FibGluZyBBVFMgYW5kIHplcm9pbmcgU1RFcy4gQWRkaXRp
b25hbGx5LCB1bnNldA0KPiB0aGUgZHRfZGV2aWNlX2lzX3Byb3RlY3RlZCBmbGFnIGFuZCBmcmVl
IG5vIGxvbmdlciBuZWVkZWQgc21tdV9tYXN0ZXIuDQo+IA0KPiBSZXdvcmsgZHRfZGV2aWNlX3Nl
dF9wcm90ZWN0ZWQgdG8gYWNjZXB0IGEgYm9vbGVhbiBwYXJhbWV0ZXIsIHVwZGF0ZQ0KPiBjYWxs
c2l0ZXMuDQo+IA0KDQpTaG91bGQgLi4uDQoNCj4gVGVzdGVkIG9uIFFFTVUgd2l0aCBTUklPViBz
ZXJpZXNbMV0gYnkgcmVwZWF0ZWRseSBlbmFibGluZy9kaXNhYmxpbmcNCj4gVkZzLg0KPiANCj4g
WzFdOiBodHRwczovL3BhdGNoZXcub3JnL1hlbi9jb3Zlci4xNzcyODA2MDM2LmdpdC5teWt5dGEu
XzVGcG90dXJhaUBlcGFtLmNvbS8NCg0KdGhpcyBiZSBvbWl0dGVkIGZyb20gY29tbWl0IG1lc3Nh
Z2U/DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE15a3l0YSBQb3R1cmFpIDxteWt5dGFfcG90dXJh
aUBlcGFtLmNvbT4NCj4gLS0tDQo+IFYxLVYyOg0KPiAqIGNoZWNrIGZvciBwaGFudG9tIGZ1bmN0
aW9ucw0KPiAqIHNpbXBsaWZ5IHBjaS9kdCBkZXZpY2Ugc3BsaXQNCj4gKiBpbXByb3ZlIGVycm9y
IGhhbmRsaW5nDQo+ICogZG9uJ3QgdHJ5IHRvIGZyZWUgbWFzdGVyIGZvciB1bnByb3RlY3RlZCBk
ZXZpY2VzDQo+ICogcmV3b3JrIGR0X2RldmljZV9zZXRfcHJvdGVjdGVkDQo+IC0tLQ0KPiB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jIHwgIDIgKy0NCj4geGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYyAgICB8IDU3ICsrKysrKysrKysrKysrKysrKysr
KysrLQ0KPiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jICAgICAgIHwgIDQgKy0N
Cj4geGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVlLmggICAgICAgICAgICB8ICA1ICsrLQ0KPiA0
IGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMNCj4gaW5kZXggZmE5YWI5Y2Ix
My4uMDY0OGY5YjQwNyAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJt
L2lwbW11LXZtc2EuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUt
dm1zYS5jDQo+IEBAIC0xMzY3LDcgKzEzNjcsNyBAQCBzdGF0aWMgaW50IGlwbW11X2FkZF9kZXZp
Y2UodTggZGV2Zm4sIHN0cnVjdCBkZXZpY2UgKmRldikNCj4gICAgICAgICB9DQo+IA0KPiAgICAg
ICAgIC8qIExldCBYZW4ga25vdyB0aGF0IHRoZSBtYXN0ZXIgZGV2aWNlIGlzIHByb3RlY3RlZCBi
eSBhbiBJT01NVS4gKi8NCj4gLSAgICAgICAgZHRfZGV2aWNlX3NldF9wcm90ZWN0ZWQoZGV2X3Rv
X2R0KGRldikpOw0KPiArICAgICAgICBkdF9kZXZpY2Vfc2V0X3Byb3RlY3RlZChkZXZfdG9fZHQo
ZGV2KSwgdHJ1ZSk7DQo+ICAgICB9DQo+ICNpZmRlZiBDT05GSUdfSEFTX1BDSQ0KPiAgICAgaWYg
KCBkZXZfaXNfcGNpKGRldikgKQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYXJtL3NtbXUtdjMuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMN
Cj4gaW5kZXggYmYxNTMyMjdkYi4uOGUwODBjZDdkMCAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hcm0vc21tdS12My5jDQo+IEBAIC0xNDkzLDYgKzE0OTMsNjAgQEAgc3RhdGljIGludCBh
cm1fc21tdV9hc3NpZ25fZGV2KHN0cnVjdCBkb21haW4gKmQsIHU4IGRldmZuLCBzdHJ1Y3QgZGV2
aWNlICpkZXYsDQo+IHN0YXRpYyBpbnQgYXJtX3NtbXVfZGVhc3NpZ25fZGV2KHN0cnVjdCBkb21h
aW4gKmQsIHVpbnQ4X3QgZGV2Zm4sDQo+IHN0cnVjdCBkZXZpY2UgKmRldik7DQo+IA0KPiArc3Rh
dGljIGludCBhcm1fc21tdV9yZW1vdmVfZGV2aWNlKHU4IGRldmZuLCBzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQo+ICt7DQo+ICsgc3RydWN0IGFybV9zbW11X21hc3RlciAqbWFzdGVyOw0KPiArIHN0cnVj
dCBpb21tdV9md3NwZWMgKmZ3c3BlYzsNCg0KSeKAmW0gbG9va2luZyBpbnRvIHRoZSBhcm1fc21t
dV9yZW1vdmVfZGV2aWNlLCBhdCBzb21lIHBvaW50IHRoZXJlIHdlIGFsbG9jYXRlDQp0aGUgaW9t
bXVfZndzcGVjLCBidXQgd2UgYXJlIG5vdCB1c2luZyBpb21tdV9md3NwZWNfZnJlZSgpIGhlcmUs
IEnigJl2ZSB0cmllZA0KdG8gbG9vayBhcm91bmQgYW5kIEnigJltIG5vdCBhYmxlIHRvIHNlZSB3
aGF0IGZyZWVzIHRoYXQgc3RydWN0dXJlIGFwYXJ0IGZvcm0NCmlvbW11X3JlbW92ZV9kdF9kZXZp
Y2UoKS4NCkJ1dCBwY2lfcmVtb3ZlX2RldmljZSgpIC0+IGlvbW11X3JlbW92ZV9kZXZpY2UoKSBj
YW4gY2FsbCB0aGlzIGZ1bmN0aW9uIGFzIHdlbGwsIEnigJltIG5vdCBzdXJlIEnigJl2ZSB1bmRl
cnN0b29kDQpjb3JyZWN0bHkgdGhlIGZyYW1ld29yayBoZXJlIHNvIG1heWJlIHNvbWVvbmUgd2l0
aCBtb3JlIFBDSSBleHBlcmllbmNlIGNhbiBoZWxwDQpAU3Rld2FydCBIaWxkZWJyYW5kID8NCg0K
DQo+ICsgc3RydWN0IGRvbWFpbiAqZCA9IE5VTEw7DQo+ICsNCj4gKyBmd3NwZWMgPSBkZXZfaW9t
bXVfZndzcGVjX2dldChkZXYpOw0KPiArIGlmICggIWZ3c3BlYyApDQo+ICsgcmV0dXJuIC1FTk9E
RVY7DQo+ICsNCj4gKyBtYXN0ZXIgPSBkZXZfaW9tbXVfcHJpdl9nZXQoZGV2KTsNCj4gKyBpZiAo
ICFtYXN0ZXIgKQ0KPiArIHJldHVybiAtRU5PREVWOw0KPiArDQo+ICsgaWYgKCBJU19FTkFCTEVE
KENPTkZJR19IQVNfUENJKSAmJiBkZXZfaXNfcGNpKGRldikgKQ0KPiArIHsNCj4gKyBzdHJ1Y3Qg
cGNpX2RldiAqcGRldiA9IGRldl90b19wY2koZGV2KTsNCj4gKw0KPiArIC8qIElnbm9yZSBjYWxs
cyBmb3IgcGhhbnRvbSBmdW5jdGlvbnMgKi8NCj4gKyBpZiAoIGRldmZuICE9IHBkZXYtPmRldmZu
ICkNCj4gKyByZXR1cm4gMDsNCj4gKw0KPiArIGQgPSBwZGV2LT5kb21haW47DQo+ICsgfQ0KPiAr
IGVsc2UNCj4gKyB7DQo+ICsgaWYgKCAhZHRfZGV2aWNlX2lzX3Byb3RlY3RlZChkZXZfdG9fZHQo
ZGV2KSkgKQ0KPiArIHsNCj4gKyBkZXZfZXJyKGRldiwgIk5vdCBhZGRlZCB0byBTTU1VdjNcbiIp
Ow0KPiArIHJldHVybiAtRU5PREVWOw0KPiArIH0NCj4gKw0KPiArIGR0X2RldmljZV9zZXRfcHJv
dGVjdGVkKGRldl90b19kdChkZXYpLCBmYWxzZSk7DQo+ICsgaWYgKCBtYXN0ZXItPmRvbWFpbiAm
JiBtYXN0ZXItPmRvbWFpbi0+ZCApDQo+ICsgZCA9IG1hc3Rlci0+ZG9tYWluLT5kOw0KPiArIH0N
Cj4gKw0KPiArIGlmICggZCApDQo+ICsgew0KPiArIGludCByZXQgPSBhcm1fc21tdV9kZWFzc2ln
bl9kZXYoZCwgZGV2Zm4sIGRldik7DQo+ICsgLyogVGhpcyBzaG91bGQgbmV2ZXIgZmFpbCBiZWNh
dXNlIHdlIGFscmVhZHkgY2hlY2tlZCB0aGUgZG9tYWluICovDQo+ICsgQVNTRVJUKCFyZXQpOw0K
PiArIH0NCj4gKw0KPiArIGFybV9zbW11X2Rpc2FibGVfcGFzaWQobWFzdGVyKTsNCj4gKw0KPiAr
IGRldl9pbmZvKGRldiwgIlJlbW92ZWQgbWFzdGVyIGRldmljZSAoU01NVXYzICVzIFN0cmVhbUlk
cyAldSlcbiIsDQo+ICsgZGV2X25hbWUoZndzcGVjLT5pb21tdV9kZXYpLCBmd3NwZWMtPm51bV9p
ZHMpOw0KPiArDQo+ICsgeGZyZWUobWFzdGVyKTsNCj4gKyBkZXZfaW9tbXVfcHJpdl9zZXQoZGV2
LCBOVUxMKTsNCj4gKyByZXR1cm4gMDsNCj4gK30NCj4gKw0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

