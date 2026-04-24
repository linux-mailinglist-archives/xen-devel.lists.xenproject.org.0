Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCfGBAJd62lGLwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 14:07:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFBB45E2EE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 14:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293485.1571178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGFIn-0004Ty-A7; Fri, 24 Apr 2026 12:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293485.1571178; Fri, 24 Apr 2026 12:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGFIn-0004SW-7A; Fri, 24 Apr 2026 12:06:33 +0000
Received: by outflank-mailman (input) for mailman id 1293485;
 Fri, 24 Apr 2026 12:06:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wGFIm-0004SQ-IU
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 12:06:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGFIl-007mug-LA
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 14:06:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69eb5cc4-2eae-0a2a0a5409dd-0a2a45068082-10
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 14:06:30 +0200
Received: from [40.107.130.66]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69eb5cc6-7371-0a2a45060019-286b82423a86-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 14:06:30 +0200
Received: from CWXP123CA0017.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:73::29)
 by PAXPR08MB7551.eurprd08.prod.outlook.com (2603:10a6:102:24e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Fri, 24 Apr
 2026 12:06:26 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:401:73:cafe::4b) by CWXP123CA0017.outlook.office365.com
 (2603:10a6:401:73::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 12:06:26 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Fri, 24 Apr 2026 12:06:25 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by VI0PR08MB10845.eurprd08.prod.outlook.com (2603:10a6:800:211::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 12:05:19 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 12:05:19 +0000
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
 b=Gb34qduvLFEc94I5CE2neRuLtnQOVeebhWZvu8aVO+POJdfSPVIogYug+KNHzGCpOi0eklncXbYO/Pa71Ig6Gd0xLsU9xEnff7wnF+FPLRBHWRiUHr0VeV+tciqpLjk3TsRuSEZAgdpmHHYQLrcbFj32bOy8zktcdwTBQtZ3yiflR6ucqq5Laoe3zsxkV1MN52bvycDZn8g8OYq0bZujllW0gqNlxmebYTWEIcJsL2br4JNDWqdLTvTh8Wb+wAxi2nbAaELj+XKTNLdGz+l2BSUwDOEvG+Np/JFYt8adWjttzW5O+wUo7D4cfrEnk3HPdP+aEdRPiPFlQiV9P/sheQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yq27Eo8uHiSEH/YvYe5xPM6Cm6mTAHNBMYASJ1obzSo=;
 b=yRFD0pmi4GQA+GFPhGWiPa/TfrR7w6WsQXn76W1bqFaWYHR2EgyfOck2RGEXN/iF3ViDAC+mcHgsMYKCK09TWdt/UabS1VwlCkbGXwO+8GYX4yLLoHFJZK7+QPzThh9V33fgBdHvmR5ZqsJlOA7OfkdcmeAgIOZxNx4s4hDJqQiojep6QYrr+RAM7Su9SMrVYKcreyrVlPrIgDrw58Mx9PWEI7g1/Y04D7+euO+E84qP5a6sEdOUEUWbWKs/i/25HqJ2n0bvf43GhjMGGgmaKUE76k70dcnRBwhBdpvyGHbLhyRt/cVFEzP7wMwVBkPdUICo3wgDjSCi7CALw44ZqA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq27Eo8uHiSEH/YvYe5xPM6Cm6mTAHNBMYASJ1obzSo=;
 b=mH7J9OEs7sWjNert2qXrAb7SPP3OZ9fbCParPM/DbF7t8Tp4ans9DKWiXHrxXMeYOUG4rjy1GXNVDFxpwft7t3zJsj0EhhLjIRY1RIxlJ8U34uv6TAly0AhfpgK4ZDJF1F3dTq7EnYOD9EOlFw7zODNHUA9maT7ifyKPKurhFvQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhgebTGP58eWHce2uCBOXxUHZaYAfzLgMLqJt5JLmHOaoJSz06+ZQJsdkqWRsM1smZNPWepLd4/FHNE6bhlBcqIojEapCGaMfGvoo4VUYrIV+5Xdn/6rKcFstydPu15c+Nm+SNUS+kyvHPZfgSGF9bRbtlpd6YFtFGnjaCOEGAdoj7Y3Ct038A6D6sW6Iy4S19FSUOAPF3FKOeRNO20kQS8w61HTghj1rZnDZpU/CGax1/iTigmGuFdkJ9QzrS2VTkpsvHn7qOqQDT/IsEDIC0LPbz9QwB+yg8et/6tW9sKzSYscIGRrgUsdaHceCKYVwfbmaUFbEw0quP7IUyPtuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yq27Eo8uHiSEH/YvYe5xPM6Cm6mTAHNBMYASJ1obzSo=;
 b=Z7QCozTwJnILVyQE3NULP2QH1xjROYP3ki/uINZwQtraF8XbvZTEm1yKURvsaQRPdG2m4xpzfh0tu6M6vrtpP6tHkA/awmP05PivrDEDlyAODpWArx/1i8DgZSEa67M2NxhgHiRrwpQAKZ4xC85sELwgcqSg52KEZymBXcGEd3DODTgHNi7Bbow577KxjBaArB3UErd1/2ztF7wHayecH1Y8SGhgiNDgM34MD6HlDyM1uobIVFhDnvNIyYkw3KS1wm/LipHtMQ8pctREUfX3t0L6Srubo7Bb25unmnhj206yUpEey6DeFKD9ulo0b/YIG7EOd1KEvwg0lwQFXVFOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq27Eo8uHiSEH/YvYe5xPM6Cm6mTAHNBMYASJ1obzSo=;
 b=mH7J9OEs7sWjNert2qXrAb7SPP3OZ9fbCParPM/DbF7t8Tp4ans9DKWiXHrxXMeYOUG4rjy1GXNVDFxpwft7t3zJsj0EhhLjIRY1RIxlJ8U34uv6TAly0AhfpgK4ZDJF1F3dTq7EnYOD9EOlFw7zODNHUA9maT7ifyKPKurhFvQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v8 07/13] xen/arm: ffa: fix notification SRI across CPU
 hotplug/suspend
Thread-Topic: [PATCH v8 07/13] xen/arm: ffa: fix notification SRI across CPU
 hotplug/suspend
Thread-Index: AQHc0+Ke2iP9gJ+Zrk+gev4riLWd2Q==
Date: Fri, 24 Apr 2026 12:05:19 +0000
Message-ID: <6F54C29E-6A3A-4A69-927B-B04A4A0C00D6@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <a977e246d1d0a32a6618efd1385ad178779c2a61.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <a977e246d1d0a32a6618efd1385ad178779c2a61.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|VI0PR08MB10845:EE_|AMS0EPF00000199:EE_|PAXPR08MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 924ba69d-5177-44e9-58ff-08dea1f9e8dd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 890F0mJDcI99aIKnlBQwQVJ/Ehn8T5f9igzXercXDFErHk024AEWSI4DdS5GFetXsQV7nPZ85LhFTdAvnaIWbjt3zC0IONkyKo3Vam8joCFzUPX7UG+crienG/Wh+90VqDg1dE2AYG0s5KqhRHt31by47ns+D0sDWt4GLlJhq/kYSx7mczBJ0b6XRHCmbPIyW25HUTADLzn8QaCNopKk3XZwkgoNM4oO86vo5fv2DtnW/EdGTM+0jU8s1Z/zFmVKvugWAxvgozVuDHpLbhv4GUDFAE1C2zh5962oU6ZIgXVNAqveoghRMjrY8lsIrTeucMvKNHKteH3U66oZ2ApKV+jvZ85cR8pInhvLL2Eb2vhs4GtBkEd/5iPriRyc8jegMpaHYqm3CwbfYH0mmBdtLxNfj0tOZzdpohsgrMeIJI3dU27so68WTRpT1PhSrd6BfhDVHOrnyv5z8i+9klJWOuiDbF/pHVEU/cWrt9a89PPY/8flOossYgtsTrew6lykSXOW8QCGkexZsVUT4KkvqoGtB+zfx3PP+e7f/av8P+cIuSfT8IGKqYVDQVhd7ENHabxkaFD2CO9k5NTC/iG8s2KS46vyD7v5OnQHrPdcIiKtKLsPrKrQnS5Oz8vfTfXPxOgxpfMfIyni7cIFcF+ER31fAU2UgdbeWOc06JfX8MTXGIboHO2nTTmN4iJy/uSbsW0tSvXp4M4Fyh2mbF6M/HnnqvM0BS/fpgcr1o98rwmaf6fkPwdM3WKXB/M+IADGHFgKRwMobgXc0u1ABXmSe2qj+mmKWnz1CdyUmBa79SE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <03A3AB7A9CE2D348A4F53D9E5BAB8134@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 TMDBTJb6lOccjJCMCq855n73Kr8xZy6KmbNBgWGDZo5icTNpR2V/W3Yx37JDv0I5UOkADFIkkzRTSwpmX2oCYIhDrEpRQOl49YhHhxbIIiUXhAiEjW2lBGOUIUZvgydnh0x7AQa4QeYfbZ8YnjAQlzMqBBWqqyNqPtrrbksG8xAN8niZKpRxwgKnA6JlpByDD6g6AxpVc7EgirGt8qgg+4oNBwb9Z6b1D7leMRsmLJVTIY7lzlwSor0bp1WbfVEoHcl0dWHyXWjyL0e8YP6ro/fZ8ncdjdHpetdKG3TLBUnsPmDH3rQwES12vMgzpRtkz50gpxbDebgEuvRp/oeBXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10845
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ce692d47-5690-4122-4678-08dea1f9c128
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|376014|1800799024|35042699022|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+95brs9t7hUqomEPVgZZ8mjiKAYQAXuHOulS3zDhd/C84QRtQ3Wq6MsNud4DfelPSxwlNFHZwsJvrC37+h64jP2UWN6tjW4/5N4wQ2LGPw+FfCJp9R2oMW1ZAaTqwtGHMx6gGTIdMiW5ri/2vrTOpqQVmdtYrM6jLJejQF/OY0y1Se1iftmka6bJmdoW75bfVfVieXR94KEe/HJ2gP7r3HDKZsdv0TCk+aRLOO4oJNRVEKDxytyYH7kHI+Jo5cR64fAP+4nxYg0/DxjX/gJyUj04c/BTNBdqlbOzf8Ue2FRPBKIuT2P6A8uhRSPF+4HCKjoYMNzEFVT+KOHtF6FhsVMcHPhL3KX1vxFK7FOziTUJWzUy07BgOggo7m+4NwogwzZNxSdguzPpb1ldye0HCfa70miDidsAkGsDDnGZFKFPt+UfuVkk/s+UsTWAOxFQUp8EDP38BttWdqdRG5PlcOxclAytaCK6+PiYZyvrJQXgS2Jg40Y9DoKcsQIz3PKfOhrRWXwB5edAvzp5uiE1tbOuF0MNjliyLgClzCt0aeCYvm6toDA95rybGc3zB3NM6jXpZaRttZcr5Bu/XuxRDjBWBfabE0jVblBx2ZqqR5cuOFqSnc3Bw5FajdBDl9ezEzBaFXCA3ck9KpPprsrBpQOn5e4cSGkmcB3I3jggCEKKuoc6U6hW0hRhIcI/qHIH+CPgAoI1pGYJEe+82wPUYWawYFT5PW38MJm8ttb3BXk8tDRzK5OEq1JG8hXTGYQ7r3IwejthhjEQ3l/Zsh8QHQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(1800799024)(35042699022)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SETvcFEHrStvT1tcrZlaS2PpL73BzlblkQohvgtI1vYEmBxlUGO0d0uKwfliFbePhKFdGOl9gPjfI55dR8MAbNcTVl09QbvzgzyDjzLDs6Q3VQoUKIuh6phaN8ibNmAaAtI1JpHW1M2BmJRh3GKZ5GUe++VpGeI9W8If8Yt6v+UBNEw99HgurbZd5D+k8bD/K5dycOlRfxFrViUoWWf0ta+q7NQOc3n9jfPLoAujMSyojR2kfqxi/jPuXJ33CoKFVOco/tr7g81v/WsHUr5kgAig/SCo2WJf14V6kgFGPliyJAhcedOvUFh19CreOEpBgHO0oIjRZCn6m3K/LzSQbYojRViS4NbSC9kfHgRRFWF6JP6t4rV1OtRoar8uvhlkZEWXe/gHoxpIRJ4ZalXaizK0OZQIBMI35rmiuA6+6Ipk4O+W1n0GUdmW4efD/1j3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 12:06:25.7974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 924ba69d-5177-44e9-58ff-08dea1f9e8dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7551
X-purgate-ID: tlsNG-16d1c6/1777032390-90A7ED75-D8E74183/0/0
X-purgate-type: clean
X-purgate-size: 560
X-Rspamd-Queue-Id: 5AFBB45E2EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:volodymyr_babchuk@epam.com,m:Bertrand.Marquis@arm.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

Hi Mykola,

> On 2 Apr 2026, at 11:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> The FF-A notification SRI interrupt handler was not correctly tied to
> CPU hotplug and suspend/resume. As a result, CPUs going offline and
> back online could end up with stale or missing handlers, breaking
> delivery of FF-A notifications.
>=20
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>=20

Looks ok to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca



