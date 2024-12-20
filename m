Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30A29F8E35
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 09:50:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861727.1273796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYi6-0004cZ-BQ; Fri, 20 Dec 2024 08:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861727.1273796; Fri, 20 Dec 2024 08:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYi6-0004b5-8j; Fri, 20 Dec 2024 08:50:14 +0000
Received: by outflank-mailman (input) for mailman id 861727;
 Fri, 20 Dec 2024 08:50:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tgSW=TN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tOYi4-0004az-8Z
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 08:50:12 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20631.outbound.protection.outlook.com
 [2a01:111:f403:260c::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ac64e9e-beaf-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 09:50:09 +0100 (CET)
Received: from AS4P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::15)
 by AS8PR08MB8898.eurprd08.prod.outlook.com (2603:10a6:20b:5b7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 08:50:01 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::c8) by AS4P191CA0005.outlook.office365.com
 (2603:10a6:20b:5d5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 08:50:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Fri, 20 Dec 2024 08:50:00 +0000
Received: ("Tessian outbound b519d6c64997:v528");
 Fri, 20 Dec 2024 08:50:00 +0000
Received: from L5bc7a9b73624.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BC1296F0-96CE-4501-B409-44085C090B53.1; 
 Fri, 20 Dec 2024 08:49:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5bc7a9b73624.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Dec 2024 08:49:53 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAWPR08MB10133.eurprd08.prod.outlook.com (2603:10a6:102:35f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 08:49:50 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 08:49:50 +0000
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
X-Inumbo-ID: 6ac64e9e-beaf-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DK9TU9Xh/fPsCzeSSIc9jXdNi+S+NjGFVfEalAhoSirka9mGG5VteRcNnWSglAufyJYhf8ZGB2xljK47xsW9AmMT0A3wMNRBpTuAN3Xf42cd+AZMFF/S6nPCICgy9nzCg9pUmTmqyYgjFVYJWSQWBJ/XzFJOkvdrOiO30E7jJzGs+pVIJS+40JywDfpWt0sRPdNmJNPiqn5xrR5MEF1Dj8Ub0/FhTYHW0geggNFflnuUStIX57zSU3uLqZrvGl+Fqy4rSwi8Es9yR7JqTsHdL2AVHLmlvj8fji6RcyrJHXs8P45bQAf3gc2/+l3Ae34Zn/9W9IrHucMfS/Ey3OiS2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmQpkR0AEin+7tb6Wnmg7LIRuhQlCkBvckwQ+tD+vYQ=;
 b=pCKQCnazkCnGYhsHLH+Zf8Ebh9j80PBTe09MINPKV6KwKbBFodnZ3z3f8K5X/lxBy5XjvuCpawcctPzcrALsgIGqrqhBo/DHDLzvi8tYO7+ZB3IyCVOGEL81cFdOVZkbd2y8QYnleD8oxVAB6iL/SeUrCPv6EDI4Ii9JpdIm9PWfi84eyx4CwL17Ew2aMboBvaGexW1zOwUQohrDT4sdC/Ir7HJyvwAIeABl5AVb7OgfZQC+VIaf1U0eGqyjseg0v33aHqznCmDMjwUGD/6LnEv9uUC8jOOF7qadJOQqAkTIIBQcdZr/NfPh5msFhBeKrNneOpXMqvE8NQJUGuoz9g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmQpkR0AEin+7tb6Wnmg7LIRuhQlCkBvckwQ+tD+vYQ=;
 b=GyEl2rx33GDTysGi5b4HMYR4mqaD1um3c1b4pe6SWZvY1P4jEdYkcPopjAJBFW6G0LSJCiWyRtUB8OGT8UQtw8kTxELKftD1Dr0zKuWKZ+6xvD6Uu7q87NY0uJjcb1EB1PNL7m2OlVpAkmj18QBwfHFtJ1tje7ldK6fj1ncIRh4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fcc5c4b0c51ceaf1
X-TessianGatewayMetadata: f9GqCU7sblO9KIwp4jXWHEu8rR18zd4c9wlfE/OcU4+/7odhJFh3pU0Jl9rmMpUxQPic9+XaxcO3EIAqy42aZx3uRxxu/GXbD3DH3HGJ85r5+yJAjFYY7RNwiVtOBOZi1eTII02CYKNgI0tgP/Zmw8rt4Fwsc1Wsox2QdfTdy3s=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWkEJOro20v7gOR+b71uK5yW/BvA9Pa1kje+vMq5WiDviAo8iC1QB3UfpHbsVsLgSt8B0YolOw0h6cGeb942psfe6jGzPax2mT5In1HBnxtQiTn9Imh4AD0MRlofjJup70elPXO7ezqhGyPvgt8i9O+BYT9kQhyHkv0hWzE7f1/oaVjfs/HvxaQGkh6VukZOcN51kN2Op4em2ReJSaH4QPvmGLvpdIsc2QHLuSGDPshS5kI04AJ+iatjNc3sunjA5WnWioInwemNAR+rdLrXRZdymojGog7eRKbLv18WJVdohJOGDUefmLFkASwcRf3hVjYW1teAGgl4WQH+9DDvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmQpkR0AEin+7tb6Wnmg7LIRuhQlCkBvckwQ+tD+vYQ=;
 b=BW3iRoEFkABnm2//0Q4BaqL/f/2GR6gVGb8Sm8ZWqWpHRUSADzy8o0/fb4UoNXPKG+TdWazTBBng4msBl5TEwI5z1hQgORZGLMSaYKrTlaVHrcNyecUNIcHmbmI4KpJaBlc0DuO3GLVxIe5URgVuoaQVYYQP/VRoNRGZWvnN+WMKsWPsof2cnPWU2fOZ+lka/sZaHr4zwnM5Aa9nlcS9UdB3+nLY/Z2V5RmM3n9dgghlMsXKKWuKuxWdhYpCctpK6IJY/MLGD9eupGjpr3kZiYswL51uIsRUBaSVND2SzAO+IhJBhKmef5V0D8S78+JSQWuboINLdGZsTXY8XSg4Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmQpkR0AEin+7tb6Wnmg7LIRuhQlCkBvckwQ+tD+vYQ=;
 b=GyEl2rx33GDTysGi5b4HMYR4mqaD1um3c1b4pe6SWZvY1P4jEdYkcPopjAJBFW6G0LSJCiWyRtUB8OGT8UQtw8kTxELKftD1Dr0zKuWKZ+6xvD6Uu7q87NY0uJjcb1EB1PNL7m2OlVpAkmj18QBwfHFtJ1tje7ldK6fj1ncIRh4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH 1/1] xen/scripts: Fix regex syntax warnings with Python
 3.12
Thread-Topic: [PATCH 1/1] xen/scripts: Fix regex syntax warnings with Python
 3.12
Thread-Index: AQHbUkHipcR29N12QU6rggjFP3R+rbLu05mA
Date: Fri, 20 Dec 2024 08:49:50 +0000
Message-ID: <DD13CE2A-E113-4A60-A8BD-9BD3612CADD8@arm.com>
References: <20241219181352.709315-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241219181352.709315-2-Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <20241219181352.709315-2-Ariel.Otilibili-Anieli@eurecom.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PAWPR08MB10133:EE_|AMS1EPF00000047:EE_|AS8PR08MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e77cb8-8411-40b6-3221-08dd20d349e6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?T52eJknb3JnhiNBysMGC/xG3X/KlqLNZIOkq2dJvTRfKzITLlnrfVHWlCX?=
 =?iso-8859-1?Q?FByBIW3x7zXjtTyexPWqLVbgYu/zMD5eKnWf8xr69X8oVjBY9eQJwJ/vA1?=
 =?iso-8859-1?Q?cA00Xa15xePzXXu5AjKuDBOgDh8EXOdSmaKqYpH6pejYhz4IP55iYYD1e2?=
 =?iso-8859-1?Q?gTpubJXhsRvUO5rSbmZKIoUPV6JsD7i1kQXLE/jRp2E9CvowZ/lLw07EyC?=
 =?iso-8859-1?Q?BtHehKE+0W7heTjRA8bF8em9Gk+8GANDxLaov23qraPOJ4SE/ZyPyLMHGT?=
 =?iso-8859-1?Q?kdhx9sBTGz16a2iEG93lY+A37knTUC5W0TcnASIbV0x/8a86wMW1NUkWly?=
 =?iso-8859-1?Q?jjeHsRn2CK0+4hEw3oyXO5F4hIYwvVutbpvCXYQwjzjGt5iERIthsa0g/j?=
 =?iso-8859-1?Q?JhnMevzoEnFF7OyxnC51303eoUxVU/vZistRnE+g4m8r/OgBfhU4goofjb?=
 =?iso-8859-1?Q?LoGEX0L8uYUXug2E2Ew96kmjKppJlPrWnbJ7ZeE6LSOg3iYRv2YhFYVhNj?=
 =?iso-8859-1?Q?v0mDJPobWPi3aEYwA0We6P/qtpExr+x4+t4WApBxAMCTe40aXK6xBP6LfY?=
 =?iso-8859-1?Q?P81XzH8G3XdFscyleW1vPAqZ1XazXQ56Rg7oZOJ3pQGLcbuWaMrNJlFl8/?=
 =?iso-8859-1?Q?5gQ2AGWfTjK50n86w5oIi48x2H+BPK93+pint7wnrf+lNxI+Z2KK2B/J+M?=
 =?iso-8859-1?Q?tWYHbZVqwbdOOMciFqvNeQHQ60bKFAT6CupHChisl86hua3u/OTmqLVR2V?=
 =?iso-8859-1?Q?/AMxqJL29x6Yz8XI32TfBIwQVYwa6KLs4TETb7HVFaWoKyx245zOKcire4?=
 =?iso-8859-1?Q?oAQ/CJI5yHRPev40kpAKcmzBcaITIVtBorhWpcWiBqikNK4xN2WPiVatOt?=
 =?iso-8859-1?Q?hm26CccZ2Mn5YxkVxNNtmXa+RovyjojsKMHpBxQePKZuZtC1gErPZOZ0Yq?=
 =?iso-8859-1?Q?ub6/eqIPLowqWcHS6BzkWn5A9vJDZBMY3aZjmmn7TsoyxzcIBaLkMbQgMh?=
 =?iso-8859-1?Q?6rb2Pn8ka27tgghPp4Ov1lMGDb8f+jO6LnZWFpGjB3UGTDc6yef13N/6zF?=
 =?iso-8859-1?Q?ILImD6W+TaN0PGsBivxcHOfOf1osGCKTZKdr3PRRPJt72vIvkB5/W/kWKQ?=
 =?iso-8859-1?Q?zqSV4cBmUiRl4jLviVHLJTSV6XlSYMozn0nU7lQNfbBu5OvRp654mF96vV?=
 =?iso-8859-1?Q?NZ8VuWPpXPJmpJbdxA1KHTW0DMPYSOnjKpZB+jR7OjLQJfjx+G4VHR+/Fg?=
 =?iso-8859-1?Q?bnIxVacvIdz4ypwuF5Dy4wsVypN+bsX9K4KQ158tiWtghXKeBdOeC609fv?=
 =?iso-8859-1?Q?C8f34Ei11xXJj8vMne4vTlIWmaIYmf17mk5CxZXMWxxKlMg6GXkDIkBjuZ?=
 =?iso-8859-1?Q?AkWS9gNWIkRLAsVumWfBVMndiwpcvVb6ItCRPavBn3oxm2eMBHMuS2JF1p?=
 =?iso-8859-1?Q?vywHgrIw44u6jY89UZxNMUk15AsKjGwZvE9zl/NlecIOUGoXWRfbm3ZKKN?=
 =?iso-8859-1?Q?pwpC0WZUcd6ndxvsnmDbO1?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A9ED7FADBD9C5245A4B997E5F27A5527@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10133
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0edfd94f-4ef9-419e-f082-08dd20d343ad
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Zjmz56l0eCRdNYFCVm6nibpaMMLBi5DbLs+MmRAQQmv4h+9S9q4BfIBCZ1?=
 =?iso-8859-1?Q?siewldO4Ht1W5UdbwG/INkS5xuchg2VYbWhT2yeI/AF7e6UOSIcmo8AIPq?=
 =?iso-8859-1?Q?e9nuC2+gYw06vXaQyrzP88Vebsl14XPwpR9p5uifHxQBYZqoqDbAyw3+oj?=
 =?iso-8859-1?Q?Z4OS+4qs3lXPl1v7j7YLDfhehVFxxmr4oqmOv3IhXtOtBbHna62uvi0id3?=
 =?iso-8859-1?Q?HrPNdwZWAxZsBaxy8yS+57GaCFE3AiYLDKovvMuAQ8FqvVim5ja5/atHvl?=
 =?iso-8859-1?Q?gXKn+qXAtVe4gCCOqukL76XuFFXN2+oFlNeXMpwxqulVpkfgH5O2IwK/Oc?=
 =?iso-8859-1?Q?NNvmOSX88zXY+kYc1PhpDvXl4q6zQtnhgMqBgGJAXvt6Rr6X553sQqZVBA?=
 =?iso-8859-1?Q?SIgzgx5hFIhQNYeq8obF9qfyha621u+oGdspfv++Y30TeVkpRrF8EXmGLH?=
 =?iso-8859-1?Q?1Mw5NEAFTF7+bWhH0iSfAaGWWzn3PSYJ7W3cBvPsyB9mn3xBVLhckads27?=
 =?iso-8859-1?Q?Boc/lPaGND2/9AkYq7h/B/niRfGrQSJJFbjaJVcSI/wnGxXXCZGOhI39Lf?=
 =?iso-8859-1?Q?B9ONG2C/e6s6Iy1X0dg/9gMDDtB23nRcMFw9a+c85tR//OYfJ3NfskIR9E?=
 =?iso-8859-1?Q?9xmA8tu/uBty/jMn1BR8QSmJuyJLn1frVaBXQIsje9TEVEXWpOGSmwiEKo?=
 =?iso-8859-1?Q?jlc7nGrMFpZDz5Ld7UA/B0u2/VLxncX8ZNsr70BWjHKg4nexJr0eQl61TH?=
 =?iso-8859-1?Q?jedLb/nV517i24p8S8yh9XN4yGWIu/gafpaaAQjTzDSyvOD5ZLzWis9lnK?=
 =?iso-8859-1?Q?+bCZkD0iBGNDEeVW1K023HtgYvmtmsMhlTFLkD3bwqigyT48FP+zDYViNe?=
 =?iso-8859-1?Q?Xk4CCcIrbfSybBXd/a46aN1k8RALGUqDCsq76aYhqhEwpJOk9cLqGOV+Qc?=
 =?iso-8859-1?Q?dfTjoiIllqDkf06E1G/exuo9gjgAXnA9VoHDmcB3GwG+OK3YohEdpWshp0?=
 =?iso-8859-1?Q?hx1Qs6eAkULMrc5cYHTSeIzcdPQlPGWZ1KzMXYeUDsdu9/22oxgOoG0zy0?=
 =?iso-8859-1?Q?PSkvikheQm6UvgRLQqyl5HsSyN7t2Rl3i8ixXXzQzrItjo8wXRRyJVV88A?=
 =?iso-8859-1?Q?V4n2gxJpJDp3R+6gcn5zttmw6pFcGhTGSjaC5My84HZ0u2gQua/Yq8AaZi?=
 =?iso-8859-1?Q?qQbsVgpHLfII2e3JjI153VK3SvaZ+nPyDhNl+QvSY+JUgtsnqZbbL8l+OP?=
 =?iso-8859-1?Q?dWXkPhnLw6G2mx7Sg+NKY/RegXCEyGZaIfXYniHt9WaBxvOTZMG0XWs8bU?=
 =?iso-8859-1?Q?GCpuZ/fyIqAMeBn0LjSXCzsQfXdpJ1MTzkGAlhPcsYoIo48vDaANDabSgE?=
 =?iso-8859-1?Q?CTR0rt0OuURlrePy0rhH0EQwLIrX45fMSLRXA93DT9lB3MGaQvKSSYMoYb?=
 =?iso-8859-1?Q?ngthtMHUTfTwmqTbAXMiKw8miSJ6dpy2FIyL7Mxpdq2ce0D4G7Gp+75UWT?=
 =?iso-8859-1?Q?p6rAvBoRdkyMVq4aix7sucuKJUxDyp5Y3jiBk2PnUIscT9uCAu4JlwEP8P?=
 =?iso-8859-1?Q?k3fJVLk=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 08:50:00.6020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e77cb8-8411-40b6-3221-08dd20d349e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8898

Hi Ariel,

> On 19 Dec 2024, at 18:10, Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom=
.fr> wrote:
>=20
> Same fix than commit 826a9eb072 (tools: Fix regex syntax warnings with Py=
thon 3.12).
>=20
> It clears out the warning:
>=20
> ```
> $ xen/scripts/xen-analysis.py
> xen/scripts/xen_analysis/cppcheck_analysis.py:94: SyntaxWarning: invalid =
escape sequence '\*'
>  comment_line_starts =3D re.match('^[ \t]*/\*.*$', line)
> ```
>=20
> The  warning appears only the first time the command is run, then it disa=
ppears.
>=20
> Fixes: 02b26c02c7 (xen/scripts: add cppcheck tool to the xen-analysis.py =
script)
> Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
> --

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



