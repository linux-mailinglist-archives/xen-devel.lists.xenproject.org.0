Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGh+OzpM62lhKwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 12:55:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139CF45D69A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 12:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293428.1571155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGEBP-0000gK-QJ; Fri, 24 Apr 2026 10:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293428.1571155; Fri, 24 Apr 2026 10:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGEBP-0000dO-MQ; Fri, 24 Apr 2026 10:54:51 +0000
Received: by outflank-mailman (input) for mailman id 1293428;
 Fri, 24 Apr 2026 10:54:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wGEBO-0000dH-9J
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 10:54:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGEBN-007EJq-MG
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 12:54:49 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69eb4bee-5cb7-0a2a0a5109dd-0a2a450cc848-30
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 12:54:48 +0200
Received: from [52.101.65.42]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69eb4bf8-62f1-0a2a450c0019-3465412a51d0-4
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 12:54:48 +0200
Received: from AS4P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::17)
 by GVXPR08MB10519.eurprd08.prod.outlook.com (2603:10a6:150:152::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 10:54:38 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::ed) by AS4P189CA0030.outlook.office365.com
 (2603:10a6:20b:5db::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 10:54:38 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Fri, 24 Apr 2026 10:54:38 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DB9PR08MB7794.eurprd08.prod.outlook.com (2603:10a6:10:399::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 10:53:33 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 10:53:32 +0000
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
 b=WcDJGAZbaBtVB9L/EhNrkcEJNv/QVuEMVBrOL8ahCSprS+xx065wuNTVy1LNzj023/hKtAzS+ATL3yd41NaIi/feg2S84whyaMVQMOWQSRUn/WBKxchh7WcAS+aT/AQW+IxvZKFiiVYlHFlnjsU3Ld3l6TrRo+KtwdslliF/GoOuSgVFVeuotPHLzOS/jihphl6zR4Xky3Q/k37W8S4KH2TcT4Gl74e/TEJoLwRpSBpRfKUiqKBkUFWknUSGX0zDJCbWx+15FRufrQl5OZgOzX3SPfmQ4rb66gBVgXq1Wy3sel4P19v1GCHh7arBCzxM2ajZ42I++k6UmrEHLCquRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f47WrSA1uLAtltaLJ6GExKhkHoIBde8Adao84rKGPAc=;
 b=VR8Tm/V7kyOvbwUP6GxtZwIIpx3AemQ1EuSSJEEW9k6NcwXGdeNlcoNaZy2r9YxLDrSSO19XJbsGHzhOoMjXlxDgVdp/q3NIfEMfpvzYmbTYaJrzxE4R8A37XWDYLV+/b21ju1iMtNOMHB2dWh3OJYWj4TdIMhAXC1y3APm+Jy4k71iWpqY8ayVh3yroXA7g75xLDQ5MutV618iMMGR5u3WxjTKBLvnpVMldUw+UUd9Qdn2+UkNv5r8e+RyVwADNzwiNE1OMm6++2UrNWS83Oj7qqFRmuB1r1nOvhKy2Nja3hB+RoSbGBcXQFr09NL7DwUVp77mXDYAElVYGHAZ7lA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f47WrSA1uLAtltaLJ6GExKhkHoIBde8Adao84rKGPAc=;
 b=MZjSzosfPMCF0uk2tnt3IbXdkl84X9bwHa/5Cu2PZQcTVtQnZlE24PPJE3bg1Ok5ad573FWnU5qQMf7gDQO8XTXemEZGVdaYSYTLkhNjJ25X7xb/wN8mTkI44ZMukWiO5+RuG8g8R5apNpABk6c105h+k+G23ybLKLUeg0X3K9U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqcN0Nj8GDOja+YiLnrwDobElJnuC+0WgLTIcIeUB4w+fnUQLsW6Jgv67ySbXpWTjeJ1PuqMKuQ7l+w2M965Mf0PpoWTmh6J0HZLmAmHJypqOIGs4QU78Fx9Om2a0ulf3wepVdDpPxZAaaLg3JrkteaE/dm6DNOaLSxtNI+GNY7Vf2n64Wv8iQ2PSokTslgCRJPj+3v7RgYtPGTS1jaW3TV4RkrfDrc3S+XeqXr4A7I95EANtg3a9OtxLJxLNhTfr/VLNUCQjffdhf8BctVDDVBp3jt0pOAFaPDqi7EoTMblUZ6s2pK2iyOdlQZBUHaOPbe32tXLv4LVHXnEQJZHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f47WrSA1uLAtltaLJ6GExKhkHoIBde8Adao84rKGPAc=;
 b=yWQGqkyCS1dqvyxZtsgjllHTbswP93iOUQpak5GwsmMXhJboRb6r/fv7Z3WR7MSC8pFPPvtYvGbx4TyD01mjoJ+oTLVXHRKZcLFCgvtRHTHQ/swVfRkkBeI5ti6jM0y6jEm2hgXycWDnhrqyIWbT9hPfwl7CfQgVX17hUdYyHHA48X5RWl0K3GO7HEY2Bn+p0C1x82CaQN5DrwQiF6e2UIg/eDLj1y4fwezIp2ZOQc87k5mMCDv7nd42ef9T89rKD0hu1Bex13YLZXMINutXb0mkvtMB5JB0YCTKUyfqYYV+z6qnuNuPnXr8dzEuIKigT8YtLgW8hxCVP+Qp0EyR2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f47WrSA1uLAtltaLJ6GExKhkHoIBde8Adao84rKGPAc=;
 b=MZjSzosfPMCF0uk2tnt3IbXdkl84X9bwHa/5Cu2PZQcTVtQnZlE24PPJE3bg1Ok5ad573FWnU5qQMf7gDQO8XTXemEZGVdaYSYTLkhNjJ25X7xb/wN8mTkI44ZMukWiO5+RuG8g8R5apNpABk6c105h+k+G23ybLKLUeg0X3K9U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v8 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Thread-Topic: [PATCH v8 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Thread-Index: AQHc09iXdDokLL12tkS/bPm2SonHDA==
Date: Fri, 24 Apr 2026 10:53:32 +0000
Message-ID: <FDA8FF59-989D-42A8-9E75-1300E0B5EBD0@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <5a42b7c32fadf21262b8342f27e685916d0e5812.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <5a42b7c32fadf21262b8342f27e685916d0e5812.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DB9PR08MB7794:EE_|AMS1EPF00000047:EE_|GVXPR08MB10519:EE_
X-MS-Office365-Filtering-Correlation-Id: cf30627c-726f-4560-0045-08dea1efe13e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|56012099003|18002099003|22082099003|18096099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 V+s7RtCpjfe4Me41eQPywv9nYSZTzw6s5U4EkOepJDqP71Gdjr08WMTidB+nQkipFunZr7gzwA0TK9/2RXSAwDgZKHHU4X2JVlkEdlHSX40WDDdgJwJKazVdeoTrM7mjlc1CxRBj0dKxOCdxfA1Fin41pKHpa7QAWWd+p1mRjtiTstJR3qvQMh6ofYt8MbEaKBMjBMkCVS1KfFWDkcU61USUq8Wdrda5Vwu0XMv05MNEihrdQ+DRRVHNbmUbLbdnoqND5azoB88Uzss1i/4tpfIAW6zy8tkHakl6pV9kjHOHjRvSJJmSUChW2tShtEzShme1yMHnoXnzSyuI9SjVqK+NkDzQswAtLIfFSLyoYoFwOKNeQz9bxCeyduJcHNVsWUKK0uMKkMwblih6arocu0aU4T2yM0FFwL9n/MkwrfrFuRD8v8dTm+dZp4KfXuFe42C1N+ju4S2pCpMxDueaCurzJod3HCN71uPlzovfWr5tFgXmP4mhPBxW9ZnJF6PhOo4+5egP0ek1TfiOcV8sszabPBhli9i6LFaCVJTQeQ1VOQJ2xuTgIHeMT2a7x1EsLzJIWGngswldwB1aqcB67fRqCT3WlwJ5AgHQvFq84PkTxyOF8xaQGT7yWBD528cZBFk+zXHT8uAUK7goBnA9/LaX0bjbS5goDGFaEocHIs2Y4/NEIqsda+HY8W9OK49kOxy+78FAVqkB2dhQltaX2sESv2VrSFaOhhyuJaADTuEdHk1Q5F681CjnhsvD9TcsZAujItniAXcalIyL+tpAC7tUhE7YDbP6nzwzCCi9zl4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(18096099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8482F0D98432484D9A09F463B157A3F3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 XZ9yl9FDNQ51WtLKscu8WI5qqF5w6++D9L1HqlzfRe2BpvQmnguTym2em9c4+BYpmditc1rYba0sYuQRYq6giCqy2s4QcT1EbgMi9A6EzCKnJlUxrEcytYoft8wqtSi3NPN3+KyfwlN+u/n0Ppm7mfQzDyue//ei2WMjQ88Akj7pL+7EfNrDIzYcUOdQIWW52lpDdngcsRaVIQAVsZfkM/t86YBGmG1tyIxS7rg4iuHjtXb4vn2HCZOI40A2ZXSkamTVReE7rA61SR0yY5EzcT39ZZflmCcpvfKMdOeMHTnV8snNcRZwlFAiY8v+C1qusoypqXOPgd74eTG7uckA5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7794
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b99e2a7-cd0e-4576-4ede-08dea1efba44
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|14060799003|36860700016|35042699022|18002099003|56012099003|22082099003|18096099003;
X-Microsoft-Antispam-Message-Info:
	JZawjjTRmDSRUhBHmTJOLLqJHg6b8WsJCFp+7s17Xp7d60AbmgY8wTWLNJ3Cl6tyBtsHvQC9EbaQKFWxBg5+B5HbO7lOMV09H9jH409Rry1dBWH2cbsD0ea37g/78+1OvVBfViHWSo3NiuHjM2eBLXwut/LRMKfsaJAuuQBGFte7wKpkF3DSO+6wxi/itUinfugZifaNVo7W8LjKeVtp0AHBJwLQqXG0bcrBs2LTFZfG+7QTYGDN6fGn/nxekNFMS90s1VFtlAsnWXBa+dXcXFd8S3m4DcZzrhIPn6pHg0BJD2AGdtomqs+fv/4GRSMv8J4bZd13CLD9pgZLDELTzy0LnrR/KdKqr5GAmj5it++1SMlf7NDaSDbZatzVl6B902n764ynNhLaN2SiLh9bGYvAYuH2Lo2OyzWbzBsYjM0ILzUEYfRSLsOPNuXQr/7EpuNuQxXQ00abTuIl8EUV9sAljgv1NjGs98nd4YOOFOKOliANDVN85ibnMnSlsi77g/0K8wCSzssKx831JM5H4RrdSqjhS1yG8m3aK+QBQxkSWB3A12aqc0JluHf9bro3wzxg6NLMA1my2paAuFJMxHbFXqOdOUvAET30ESQLNhDLADOTr/5SpbDjT1qI+pfGvHWUZMX93GAkDSqlYLeWj6W49stQM4P//s8ZjNIQMIc5HWy+olRxdX2hSVnoXIMWtwNPEkoPgy9tV7a0bJoqCcUX3Bf4zJxi4fuukAvBfOQ+0TsfXlTLNSs2AvJqGo6oK3bBxe9GS99LXQYgGOyfPQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(14060799003)(36860700016)(35042699022)(18002099003)(56012099003)(22082099003)(18096099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TLZBjB66wRw4cbFtQ406DS2UgaIjkiB6MIVN+OQVUnxzmP7sDo0rHgXQn3lOiVFNUgKeyxKVQ+MC5o4OZRKK7KDgQgLtwwhacmytMfYEXwtu8Q8qObEncwY+ARtrv3B4uivYqAxMghyI4ROU7gtNydnXsVJW7Asfv6gVr4zjOHsegsnja7QSmdr8qrTdDyFfkuUlh6QSCAB6WTm0HBzOEHE8izLsgRtHH6a/qwcO4Y+m6Orsv9O7hFV93fDKIR3TIAGARLDPfYpzHJc4t5hFD/HKtopsXwyaJduC4uJtpxucg0hWvR45nvX1Oi473ztk3SEe2B3zlg3mVn8baVJpkS8LrwhUqH2MyTvtuF/iqSibSm3q8J3QthhcteIsfj2G/5PDJCkc9DZO5WiqqmIi+3pYzjyoEv6otynqxYBtAjHVaSP9oKCFJpThyag+XxVe
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 10:54:38.0198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf30627c-726f-4560-0045-08dea1efe13e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10519
X-purgate-ID: tlsNG-d25034/1777028088-F4E06CF5-550F5613/0/0
X-purgate-type: clean
X-purgate-size: 10374
X-Rspamd-Queue-Id: 139CF45D69A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]

SGkgTXlrb2xhLA0KDQo+IE9uIDIgQXByIDIwMjYsIGF0IDExOjQ1LCBNeWtvbGEgS3ZhY2ggPHhh
a2VwLmFtYXRvcEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gRnJvbTogTXlrb2xhIEt2YWNoIDxt
eWtvbGFfa3ZhY2hAZXBhbS5jb20+DQo+IA0KPiBIYW5kbGUgc3lzdGVtIHN1c3BlbmQvcmVzdW1l
IGZvciBHSUN2MyB3aXRoIGFuIElUUyBwcmVzZW50IHNvIExQSXMga2VlcA0KPiB3b3JraW5nIGFm
dGVyIGZpcm13YXJlIHBvd2VycyB0aGUgR0lDIGRvd24uIFNuYXBzaG90IHRoZSBDUFUgaW50ZXJm
YWNlLA0KPiBkaXN0cmlidXRvciBhbmQgbGFzdC1DUFUgcmVkaXN0cmlidXRvciBzdGF0ZSwgZGlz
YWJsZSB0aGUgSVRTIHRvIGNhY2hlIGl0cw0KPiBDVExSL0NCQVNFUi9CQVNFUiByZWdpc3RlcnMs
IHRoZW4gcmVzdG9yZSBldmVyeXRoaW5nIGFuZCByZS1hcm0gdGhlDQo+IGNvbGxlY3Rpb24gb24g
cmVzdW1lLg0KPiANCj4gQWRkIGxpc3RfZm9yX2VhY2hfZW50cnlfY29udGludWVfcmV2ZXJzZSgp
IGluIGxpc3QuaCBmb3IgdGhlIElUUyBzdXNwZW5kDQo+IGVycm9yIHBhdGggdGhhdCBuZWVkcyB0
byByb2xsIGJhY2sgcGFydGlhbGx5IHNhdmVkIHN0YXRlLg0KPiANCj4gQmFzZWQgb24gTGludXgg
Y29tbWl0IGRiYTBiYzdiNzZkYyAoImlycWNoaXAvZ2ljLXYzLWl0czogQWRkIGFiaWxpdHkgdG8g
c2F2ZS9yZXN0b3JlIElUUyBzdGF0ZSIpDQo+IFNpZ25lZC1vZmYtYnk6IE15a29sYSBLdmFjaCA8
bXlrb2xhX2t2YWNoQGVwYW0uY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiBWODoNCj4gLSBSZXdv
cmQgdGhlIENCQVNFUi9DV1JJVEVSIGNvbW1lbnQgdG8gbWF0Y2ggWGVuIGFuZCBkcm9wIHRoZSBz
dGFsZSBMaW51eA0KPiAgY21kX3dyaXRlIHJlZmVyZW5jZS4NCj4gLSBDbGFyaWZ5IHRoZSBsaXN0
X2Zvcl9lYWNoX2VudHJ5X2NvbnRpbnVlX3JldmVyc2UoKSBjb21tZW50Lg0KPiAtIEZhY3RvciBv
dXQgcGVyLUlUUyBoZWxwZXJzIGZvciBjb2xsZWN0aW9uIHNldHVwIGFuZCByZXN1bWUuDQo+IC0g
UmVzdG9yZSBlYWNoIElUUyBhbmQgcmUtZXN0YWJsaXNoIGl0cyBjb2xsZWN0aW9uIG1hcHBpbmcg
aW4gdGhlIHNhbWUNCj4gIGxvb3AsIHNvIGEgZmFpbGVkIElUUyByZXN1bWUgaXMgbm90IGZvbGxv
d2VkIGJ5IE1BUEMvU1lOQyBvbiB0aGF0DQo+ICB1bi1yZXN0b3JlZCBpbnN0YW5jZS4NCj4gLSBw
YW5pYyBpbiBjYXNlIHdoZW4gcmVzdW1lIG9mIGFuIElUUyBmYWlsZWQNCj4gLSBjbGVhbnVwIGJh
c2VyIGNhY2hlIGR1cmluZyBzdXNwZW5kDQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0
cy5jICAgICAgICAgICAgIHwgMTI2ICsrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+IHhlbi9h
cmNoL2FybS9naWMtdjMuYyAgICAgICAgICAgICAgICAgfCAgMTUgKystDQo+IHhlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9naWNfdjNfaXRzLmggfCAgMjMgKysrKysNCj4geGVuL2luY2x1ZGUveGVu
L2xpc3QuaCAgICAgICAgICAgICAgICB8ICAxNCArKysNCj4gNCBmaWxlcyBjaGFuZ2VkLCAxNjYg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2dpYy12My1pdHMuYyBiL3hlbi9hcmNoL2FybS9naWMtdjMtaXRzLmMNCj4gaW5kZXgg
OWJhMDY4YzQ2Zi4uZmUyODY1ZWFjOSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2dpYy12
My1pdHMuYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jDQo+IEBAIC0zMzUsNiAr
MzM1LDIyIEBAIHN0YXRpYyBpbnQgaXRzX3NlbmRfY21kX2ludihzdHJ1Y3QgaG9zdF9pdHMgKml0
cywNCj4gICAgIHJldHVybiBpdHNfc2VuZF9jb21tYW5kKGl0cywgY21kKTsNCj4gfQ0KPiANCj4g
K3N0YXRpYyBpbnQgZ2ljdjNfaXRzX3NldHVwX2NvbGxlY3Rpb25fc2luZ2xlKHN0cnVjdCBob3N0
X2l0cyAqaXRzLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IGNwdSkNCj4gK3sNCj4gKyAgICBpbnQgcmV0Ow0KPiArDQo+ICsgICAg
cmV0ID0gaXRzX3NlbmRfY21kX21hcGMoaXRzLCBjcHUsIGNwdSk7DQo+ICsgICAgaWYgKCByZXQg
KQ0KPiArICAgICAgICByZXR1cm4gcmV0Ow0KPiArDQo+ICsgICAgcmV0ID0gaXRzX3NlbmRfY21k
X3N5bmMoaXRzLCBjcHUpOw0KPiArICAgIGlmICggcmV0ICkNCj4gKyAgICAgICAgcmV0dXJuIHJl
dDsNCj4gKw0KPiArICAgIHJldHVybiBnaWN2M19pdHNfd2FpdF9jb21tYW5kcyhpdHMpOw0KPiAr
fQ0KPiArDQo+IC8qIFNldCB1cCB0aGUgKDE6MSkgY29sbGVjdGlvbiBtYXBwaW5nIGZvciB0aGUg
Z2l2ZW4gaG9zdCBDUFUuICovDQo+IGludCBnaWN2M19pdHNfc2V0dXBfY29sbGVjdGlvbih1bnNp
Z25lZCBpbnQgY3B1KQ0KPiB7DQo+IEBAIC0zNDMsMTUgKzM1OSw3IEBAIGludCBnaWN2M19pdHNf
c2V0dXBfY29sbGVjdGlvbih1bnNpZ25lZCBpbnQgY3B1KQ0KPiANCj4gICAgIGxpc3RfZm9yX2Vh
Y2hfZW50cnkoaXRzLCAmaG9zdF9pdHNfbGlzdCwgZW50cnkpDQo+ICAgICB7DQo+IC0gICAgICAg
IHJldCA9IGl0c19zZW5kX2NtZF9tYXBjKGl0cywgY3B1LCBjcHUpOw0KPiAtICAgICAgICBpZiAo
IHJldCApDQo+IC0gICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiAtDQo+IC0gICAgICAgIHJldCA9
IGl0c19zZW5kX2NtZF9zeW5jKGl0cywgY3B1KTsNCj4gLSAgICAgICAgaWYgKCByZXQgKQ0KPiAt
ICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gLQ0KPiAtICAgICAgICByZXQgPSBnaWN2M19pdHNf
d2FpdF9jb21tYW5kcyhpdHMpOw0KPiArICAgICAgICByZXQgPSBnaWN2M19pdHNfc2V0dXBfY29s
bGVjdGlvbl9zaW5nbGUoaXRzLCBjcHUpOw0KPiAgICAgICAgIGlmICggcmV0ICkNCj4gICAgICAg
ICAgICAgcmV0dXJuIHJldDsNCj4gICAgIH0NCj4gQEAgLTEyMDksNiArMTIxNywxMDYgQEAgaW50
IGdpY3YzX2l0c19pbml0KHZvaWQpDQo+ICAgICByZXR1cm4gMDsNCj4gfQ0KPiANCj4gKyNpZmRl
ZiBDT05GSUdfU1lTVEVNX1NVU1BFTkQNCj4gK2ludCBnaWN2M19pdHNfc3VzcGVuZCh2b2lkKQ0K
PiArew0KPiArICAgIHN0cnVjdCBob3N0X2l0cyAqaXRzOw0KPiArICAgIGludCByZXQ7DQo+ICsN
Cj4gKyAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KGl0cywgJmhvc3RfaXRzX2xpc3QsIGVudHJ5KQ0K
DQpOSVQ6IGNvZGVzdHlsZSwgc3BhY2VzIGFmdGVyIGFuZCBiZWZvcmUgdGhlIHBhcmVudGhlc2lz
DQoNCj4gKyAgICB7DQo+ICsgICAgICAgIHVuc2lnbmVkIGludCBpOw0KPiArICAgICAgICB2b2lk
IF9faW9tZW0gKmJhc2UgPSBpdHMtPml0c19iYXNlOw0KPiArDQo+ICsgICAgICAgIGl0cy0+c3Vz
cGVuZF9jdHguY3RsciA9IHJlYWRsX3JlbGF4ZWQoYmFzZSArIEdJVFNfQ1RMUik7DQo+ICsgICAg
ICAgIHJldCA9IGdpY3YzX2Rpc2FibGVfaXRzKGl0cyk7DQoNClRoaXMgaXMgY2FsbGVkIGZyb20g
c3lzdGVtX3N1c3BlbmQoKSwgYWxvbmcgdGhlIHBhdGggaW9tbXVfc3VzcGVuZCBhbmQNCmNvbnNv
bGVfc3VzcGVuZCgpIGFyZSBjYWxsZWQsIGZpbmFsbHkgcmVhY2hpbmcgZ2ljX3N1c3BlbmQoKSBh
bmQgdGhpcyBvbmUuDQoNCkluIHRoZSBJSEkgMDA2OUguYiwgNS42LjIgRGlzYWJsaW5nIGFuIElU
UywgaXQgc2F5czoNCuKAnEVuc3VyZSB0aGF0IGFsbCBpbnRlcnJ1cHRzIHRoYXQgdGFyZ2V0IHRo
ZSBJVFMgdGhhdCBpcyBiZWluZyBwb3dlcmVkIGRvd24gYXJlDQplaXRoZXIgcmVkaXJlY3RlZCBv
ciBkaXNhYmxlZOKAnSwgaXMgaXQgY29ycmVjdCB0byBhc3N1bWUgYWxsIHRoZSBJVFMgdGFyZ2V0
aW5nIHNvdXJjZQ0KYXQgdGhpcyBwb2ludCBhcmUgZGlzYWJsZWQgYmVjYXVzZSBkb21haW5zIHNo
b3VsZCBiZSBhbHJlYWR5IHN1c3BlbmRlZD8NCg0KDQo+ICsgICAgICAgIGlmICggcmV0ICkNCj4g
KyAgICAgICAgew0KPiArICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQoaXRzLT5zdXNwZW5kX2N0
eC5jdGxyLCBiYXNlICsgR0lUU19DVExSKTsNCg0KaGVyZSBhbmQgaW4gdGhlIG90aGVyIHBsYWNl
cyB3ZSB3cml0ZSBHSVRTX0NUTFIsIHRoaXMgcmVnIGhhcyBRdWllc2NlbnQgYXMgUk8sDQptYXli
ZSB3ZSBzaG91bGQgbWFzayB0aGUgd3JpdGUgdG8gb25seSB0aGUgb3RoZXIgYml0cyB0aGF0IGFy
ZSB3cml0YWJsZT8NCg0KPiArICAgICAgICAgICAgZ290byBlcnI7DQo+ICsgICAgICAgIH0NCj4g
Kw0KPiArICAgICAgICBpdHMtPnN1c3BlbmRfY3R4LmNiYXNlciA9IHJlYWRxX3JlbGF4ZWQoYmFz
ZSArIEdJVFNfQ0JBU0VSKTsNCj4gKw0KPiArICAgICAgICBmb3IgKGkgPSAwOyBpIDwgR0lUU19C
QVNFUl9OUl9SRUdTOyBpKyspDQoNCk5JVDogY29kZXN0eWxlIG9uIHRoZSBzcGFjZXMgYW5kIHBh
cmVudGhlc2lzDQoNCj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAgdWludDY0X3QgYmFzZXIg
PSByZWFkcV9yZWxheGVkKGJhc2UgKyBHSVRTX0JBU0VSMCArIGkgKiA4KTsNCj4gKw0KPiArICAg
ICAgICAgICAgaXRzLT5zdXNwZW5kX2N0eC5iYXNlcltpXSA9IDA7DQo+ICsNCj4gKyAgICAgICAg
ICAgIGlmICggIShiYXNlciAmIEdJVFNfVkFMSURfQklUKSApDQo+ICsgICAgICAgICAgICAgICAg
Y29udGludWU7DQo+ICsNCj4gKyAgICAgICAgICAgIGl0cy0+c3VzcGVuZF9jdHguYmFzZXJbaV0g
PSBiYXNlcjsNCj4gKyAgICAgICAgfQ0KPiArICAgIH0NCj4gKw0KPiArICAgIHJldHVybiAwOw0K
PiArDQo+ICsgZXJyOg0KPiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfY29udGludWVfcmV2ZXJz
ZShpdHMsICZob3N0X2l0c19saXN0LCBlbnRyeSkNCj4gKyAgICAgICAgd3JpdGVsX3JlbGF4ZWQo
aXRzLT5zdXNwZW5kX2N0eC5jdGxyLCBpdHMtPml0c19iYXNlICsgR0lUU19DVExSKTsNCj4gKw0K
PiArICAgIHJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgZ2ljdjNfaXRzX3Jl
c3VtZV9zaW5nbGUoc3RydWN0IGhvc3RfaXRzICppdHMsIHVuc2lnbmVkIGludCBjcHUpDQo+ICt7
DQo+ICsgICAgdm9pZCBfX2lvbWVtICpiYXNlID0gaXRzLT5pdHNfYmFzZTsNCj4gKyAgICB1bnNp
Z25lZCBpbnQgaTsNCj4gKyAgICBpbnQgcmV0Ow0KPiArDQo+ICsgICAgLyoNCj4gKyAgICAgKiBN
YWtlIHN1cmUgdGhhdCB0aGUgSVRTIGlzIGRpc2FibGVkLiBJZiBpdCBmYWlscyB0byBxdWllc2Nl
LA0KPiArICAgICAqIGRvbid0IHJlc3RvcmUgaXQgc2luY2Ugd3JpdGluZyB0byBDQkFTRVIgb3Ig
QkFTRVI8bj4NCj4gKyAgICAgKiByZWdpc3RlcnMgaXMgdW5kZWZpbmVkIGFjY29yZGluZyB0byB0
aGUgR0lDIHYzIElUUw0KPiArICAgICAqIFNwZWNpZmljYXRpb24uDQo+ICsgICAgICovDQo+ICsg
ICAgV0FSTl9PTihyZWFkbF9yZWxheGVkKGJhc2UgKyBHSVRTX0NUTFIpICYgR0lUU19DVExSX0VO
QUJMRSk7DQo+ICsgICAgcmV0ID0gZ2ljdjNfZGlzYWJsZV9pdHMoaXRzKTsNCj4gKyAgICBpZiAo
IHJldCApDQo+ICsgICAgICAgIHJldHVybiByZXQ7DQo+ICsNCj4gKyAgICB3cml0ZXFfcmVsYXhl
ZChpdHMtPnN1c3BlbmRfY3R4LmNiYXNlciwgYmFzZSArIEdJVFNfQ0JBU0VSKTsNCj4gKw0KPiAr
ICAgIC8qDQo+ICsgICAgICogV3JpdGluZyBDQkFTRVIgcmVzZXRzIENSRUFEUiB0byAwLCBzbyBy
ZXNldCBDV1JJVEVSIHRvDQo+ICsgICAgICoga2VlcCB0aGUgY29tbWFuZCBxdWV1ZSBwb2ludGVy
cyBhbGlnbmVkLg0KPiArICAgICAqLw0KPiArICAgIHdyaXRlcV9yZWxheGVkKDAsIGJhc2UgKyBH
SVRTX0NXUklURVIpOw0KPiArDQo+ICsgICAgLyogUmVzdG9yZSBHSVRTX0JBU0VSIGZyb20gdGhl
IHZhbHVlIGNhY2hlLiAqLw0KPiArICAgIGZvciAoIGkgPSAwOyBpIDwgR0lUU19CQVNFUl9OUl9S
RUdTOyBpKysgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgdWludDY0X3QgYmFzZXIgPSBpdHMtPnN1
c3BlbmRfY3R4LmJhc2VyW2ldOw0KPiArDQo+ICsgICAgICAgIGlmICggIShiYXNlciAmIEdJVFNf
VkFMSURfQklUKSApDQo+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4gKw0KPiArICAgICAgICB3
cml0ZXFfcmVsYXhlZChiYXNlciwgYmFzZSArIEdJVFNfQkFTRVIwICsgaSAqIDgpOw0KPiArICAg
IH0NCj4gKw0KPiArICAgIHdyaXRlbF9yZWxheGVkKGl0cy0+c3VzcGVuZF9jdHguY3RsciwgYmFz
ZSArIEdJVFNfQ1RMUik7DQo+ICsNCj4gKyAgICByZXR1cm4gZ2ljdjNfaXRzX3NldHVwX2NvbGxl
Y3Rpb25fc2luZ2xlKGl0cywgY3B1KTsNCj4gK30NCj4gKw0KPiArdm9pZCBnaWN2M19pdHNfcmVz
dW1lKHZvaWQpDQo+ICt7DQo+ICsgICAgc3RydWN0IGhvc3RfaXRzICppdHM7DQo+ICsgICAgdW5z
aWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsNCj4gKyAgICBpbnQgcmV0Ow0KPiAr
DQo+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShpdHMsICZob3N0X2l0c19saXN0LCBlbnRyeSkN
Cj4gKyAgICB7DQo+ICsgICAgICAgIHJldCA9IGdpY3YzX2l0c19yZXN1bWVfc2luZ2xlKGl0cywg
Y3B1KTsNCj4gKyAgICAgICAgaWYgKCByZXQgKQ0KPiArICAgICAgICAgICAgcGFuaWMoIkdJQ3Yz
OiBJVFNAJSJQUklwYWRkciI6IGZhaWxlZCB0byByZXN0b3JlIGR1cmluZyByZXN1bWU6ICVkXG4i
LA0KPiArICAgICAgICAgICAgICAgICAgIGl0cy0+YWRkciwgcmV0KTsNCj4gKyAgICB9DQo+ICt9
DQo+ICsNCj4gKyNlbmRpZiAvKiBDT05GSUdfU1lTVEVNX1NVU1BFTkQgKi8NCj4gDQo+IC8qDQo+
ICAqIExvY2FsIHZhcmlhYmxlczoNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMtdjMu
YyBiL3hlbi9hcmNoL2FybS9naWMtdjMuYw0KPiBpbmRleCBkMTgyYTcxNDc4Li5lZjgzMThkZDUw
IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMNCj4gKysrIGIveGVuL2FyY2gv
YXJtL2dpYy12My5jDQo+IEBAIC04NjIsNyArODYyLDcgQEAgc3RhdGljIGJvb2wgZ2ljdjNfZW5h
YmxlX2xwaXModm9pZCkNCj4gICAgIHJldHVybiB0cnVlOw0KPiB9DQo+IA0KPiAtc3RhdGljIGlu
dCBfX2luaXQgZ2ljdjNfcG9wdWxhdGVfcmRpc3Qodm9pZCkNCj4gK3N0YXRpYyBpbnQgZ2ljdjNf
cG9wdWxhdGVfcmRpc3Qodm9pZCkNCj4gew0KPiAgICAgaW50IGk7DQo+ICAgICB1aW50MzJfdCBh
ZmY7DQo+IEBAIC05MzIsNyArOTMyLDcgQEAgc3RhdGljIGludCBfX2luaXQgZ2ljdjNfcG9wdWxh
dGVfcmRpc3Qodm9pZCkNCj4gICAgICAgICAgICAgICAgICAgICByZXQgPSBnaWN2M19scGlfaW5p
dF9yZGlzdChwdHIpOw0KPiAgICAgICAgICAgICAgICAgICAgIGlmICggcmV0ICYmIHJldCAhPSAt
RU5PREVWICYmIHJldCAhPSAtRUJVU1kgKQ0KPiAgICAgICAgICAgICAgICAgICAgIHsNCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgIHByaW50aygiR0lDdjM6IENQVSVkOiBDYW5ub3QgaW5pdGlh
bGl6ZSBMUElzOiAldVxuIiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHByaW50aygiR0lD
djM6IENQVSVkOiBDYW5ub3QgaW5pdGlhbGl6ZSBMUElzOiAlZFxuIiwNCg0KdGhpcyBpcyB0byBm
aXggdGhlIG1pc3Rha2Ugb2YgYSBwYXRjaCBiZWZvcmUsIA0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

