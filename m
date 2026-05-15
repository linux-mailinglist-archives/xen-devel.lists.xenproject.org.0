Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCE8BtDFBmpdngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 09:05:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7774354A4C5
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 09:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309654.1580702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmc2-0004bG-ND; Fri, 15 May 2026 07:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309654.1580702; Fri, 15 May 2026 07:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmc2-0004Yi-Js; Fri, 15 May 2026 07:05:34 +0000
Received: by outflank-mailman (input) for mailman id 1309654;
 Fri, 15 May 2026 07:05:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNmc0-0004Yc-JL
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 07:05:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNmbz-005PL3-S1
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 09:05:31 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a06c5ae-5cb7-0a2a0a5109dd-0a2a4507da50-28
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 09:05:31 +0200
Received: from [52.101.84.11]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a06c5ba-229c-0a2a45070019-3465540b6227-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 09:05:31 +0200
Received: from AS9PR06CA0495.eurprd06.prod.outlook.com (2603:10a6:20b:49b::20)
 by AS2PR08MB9943.eurprd08.prod.outlook.com (2603:10a6:20b:546::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 07:05:26 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:20b:49b:cafe::4c) by AS9PR06CA0495.outlook.office365.com
 (2603:10a6:20b:49b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.20 via Frontend Transport; Fri, 15
 May 2026 07:05:26 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Fri, 15 May 2026 07:05:26 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DBBPR08MB10699.eurprd08.prod.outlook.com (2603:10a6:10:52f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 07:04:23 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 07:04:23 +0000
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
 b=Lb5fKqTZIE6Sv5eUz4wj9OPsVsIVSIlKxL1YfO9caoI+3GatqjSlC/BvL3aDHA0jVp8VvdrEnB6ACf28JsQfOOMZq2QU2T3aE6VkASeIC/uqNSNUYPTww+G6Ip2XxNvap0/CtjJ0K239+QGyPaycnrYPcOfVICfDjudYsD+FA+od3tCO+W7d+9E18jmJsx7Pnq9MQ1O8KzFHLjAh1EwDZSO3NJ5qTCeOy0PuIKjn8/zssI1MMnqnnV5zwqMYRU/YMjQadZ6udlvQPimtbPPo2FogccWOfFKwyOJDaHYbfmjKhROxdmuJtZrhv5twODqfSvF6HtsmS9u239uBfJvTQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uu1uYv1k/2Y0RBOxtjt+HnO0Z0e2WC8nQVnXE7nlwCM=;
 b=nAAqLBstuKnS2/Ox0smgNZ0G8iXWbcFRyx2KTcBWYbra9jyUxI0mV7LkAJA86p/aMKaOlxLX/S+O7Mtfr74fJXujZzWBge3tFI3Bghid2imlqSxAYEuAPgHoOFy7ofxDkTzxVssFOh/LeTt5p6MMYcFRLhD0IOHICEKGaSvw9fylA+bDaNZbL/ayofZXmxbyEcPvyOmTT8qeklaqezkXG4edscL2sCTxqwVOVbPlQp4a9TOmmJUgzw68/Sqt7JLBCbEeOdchXwCZRHvF1mABn7upWHsBQ5U7OoCMrSUwtTvx7n4c8w56aCH6rUYqbLRVYDcqf+WA7CrFoZ+NMAABGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uu1uYv1k/2Y0RBOxtjt+HnO0Z0e2WC8nQVnXE7nlwCM=;
 b=E/94HaSrnCIBAx94vrKduYlrcCtIT47JT+GVWGDhsTnn2IOXU1sA1nz+EeI841zFdEimuuCxDOYh6L1a3j1XdBSpbNytuTruRBJHOXCTYIufDopEveoWD/MTwrFHn8JYnGAU4cK2dp5b7AuK+0ZPihsXk8S20mXrDOYEav/gvbQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nayznMdrEedBAkp4/k32B0quDUmu0kvLGEW8sk6yakHJAV8XgqMbyzo6jlbge6WD/TqmHXag8K051++j4DEpu/+uPupPJRk20Kf19vL4SpPC3G18Sx0+nY1uao2ApPHBeTjRb0nXx07XqY8cLfp8RwenAoUyPXBgFVi71cV81d+jNvO5TVsZxDgdBEmDHTdskeSFbgOivoLPYEsPUmRkvYEmU7HU9DQ8kvCOng0XgJDZJgk3ds0+n1y/24dNIM0nm8TNO5Q9OJA/pdM8OYNj0ISrh14Mu/4Vw7Mh1iQf0oHHa+zkmxf6GF82RZQsujAXCe03Id3VwGd5x6w8doCKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uu1uYv1k/2Y0RBOxtjt+HnO0Z0e2WC8nQVnXE7nlwCM=;
 b=oVDPk8/761sPIZYybR2x1rDuu/ktKxWpC7ocDwTWMCpWYyzy0fuYG1bkwd22PdyPbPj35+sYKhHKBUnfjuhcAlOjL3kuJylYdUH4Ar9Tl00MjivtfhU5FbMBBl55Jxa/wPpG35GAIF+aeYmh6N0hj5JOS/Da1dTGhVN/3AHiST/JN3dAspiDP0dn19ybKgfzyt6zrpvhds54DHdCVT/RjbjjLkxtCFMuScMLtOyVxZuvM1Xh537Qmi5RJj9nCTg/WMLhhDPNIfE7xxrDeRGM9JOEK5zwGv1Eiz84LrupIZQaDiGWwu5svzVCEb4mauY4KJACOe61IU4yvlzmQZCFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uu1uYv1k/2Y0RBOxtjt+HnO0Z0e2WC8nQVnXE7nlwCM=;
 b=E/94HaSrnCIBAx94vrKduYlrcCtIT47JT+GVWGDhsTnn2IOXU1sA1nz+EeI841zFdEimuuCxDOYh6L1a3j1XdBSpbNytuTruRBJHOXCTYIufDopEveoWD/MTwrFHn8JYnGAU4cK2dp5b7AuK+0ZPihsXk8S20mXrDOYEav/gvbQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v9 11/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
Thread-Topic: [PATCH v9 11/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
Thread-Index: AQHc4jI5Oej4drtZZ0aMeZtjQOxaL7YOrZWA
Date: Fri, 15 May 2026 07:04:23 +0000
Message-ID: <C9CA8E5D-E163-46F9-8090-3792A2B4B001@arm.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <9d76348fdd25f0ac7c449ed302ce24ac93b70e95.1778605274.git.mykola_kvach@epam.com>
In-Reply-To:
 <9d76348fdd25f0ac7c449ed302ce24ac93b70e95.1778605274.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DBBPR08MB10699:EE_|AM4PEPF00027A68:EE_|AS2PR08MB9943:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f960d25-7d95-4968-562d-08deb250574f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|4143699003|11063799003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 4c/0vY5GnQ0m47j1K8+1PeYvvAiR1i+eCRuEUrtL3MyGgM1R69sVM9yAmdzd6hSuVFlT4KrJjAKKYBhbnlslJa3x7xT2XKh3OvLgZSwAwq+pjeLsow2qnNmhYcXcdWeSyIDMRqTY8wdWtnQNvusHrXeO8Zip5N42WfsXSXImAeIAsUguO3EPKjohe3Hj65tqHy6DttTpy7jXFqQzXXPl2PROyAcJ885rxHB11XXBH+vyx449gPaaS2a4/HnvmXh/02OA+1UdQTZGb8g+gdAZXUBaK3bxl/xcx9AU+Y1CwZV9tU5ii5zt8w66l5OLUDkmokrUrF2ypboTX2Z0rdGIhgaPunid0UwK04n6+4N6s+CKIRq6cjZxQWSou1E0eTTe3ffw0t6mFpktI6iyyfsBGajVQplhmjL+Lv37yQ5vMIZaXVXTkDPYE3ZVxrlA9W42/WIjPSv9c9N0+lhf4ZDTr/t9MoUMmBTZfegFIDaV5HWH8hKg3/YgitUFcgmw5s9Ax4zr2rF8hdy8o9FQsMNbm1RE/sVWZaU+IP/s8Rn5uP6Bn8Rio7Sl97jqzfoy+MYccetytDl5cW4R7htgwSYLWLkvgK8THU6Gudo4y1ulm+zVFlWVlawSgfynZxK+57d5R51PVUYhBkvCSUnFOg+2aeJpfRRYyVx99PGs5DEwgMncBohLUpyqZ9rS2QQ3LKueUWp0JiqXs6DeaQQHwXBr0U4uMna9YdFWA3NXBeExGg7JKP3LegPj1wKPnu2G/G+V
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(4143699003)(11063799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BEA7EC6C78FB9640990615E4E1248981@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 mjILgXKinWamSXkGFY62kq+ouNMLB31DpzVncokQuwpReN8M5HhqyOzy9jR2A1A4vHsPimBs7w3+Eg7n3/CoYm3KE2Ui+XSIqxZ7aU2ok3n3v18VOscep8Wxtw8T+MNdLJbRBXWh4NpBgWiUI0zWfk/feJ0YPB90LRUej8eyIIZP41fXQ87wjgf0iVecCxPfIEePsbw26U7xKIkxW+bqJ2+xLL9A9qMQEaSdfBqsfV5mNq7SsZnECV+85KNXZiW0dEKQ9Eu6VNdlSU1xnVOlD5ujqA7I7LdjYOIn9d7Dg5TpMPJiM7aOwS0zlsg+kLJd6qweao33PzberCRp1KneFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10699
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f0b054e-13e7-488e-5897-08deb25031ab
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|36860700016|376014|35042699022|18002099003|22082099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	e3uXesN7pW8RXO6EGMO1DWxKL5J1gS9loZruZi5SxrPeRiREu3HtR1Ni2iWJciSxypf34it1LeX/7WaSx8NSoG/0ZBlvCRr0pY4dAhkV/xn72Y2KdrPlXneAEXrBB/Nfvc8agm0APFe2SWfSgcKTJeasT9t5H9i68Y6aB5qkCEcng6RkEUt9pqMJwXZrNfX7XHwu0Ns5yAwVZr4kzpEV3AIwqcEP3a55U3QKqFOYgnjZosMu23ddHRTfNRh0HfwK9Qk6Lx2EUFMt6ZX+aK5VMIrfQTGBH3CVI/QHzuHUS6kaXHuUXCMtp9yRa5Glr0mZk3Ftww2bIm7WFvmu+fxDTJ1GfnMmDeDY645mV2ACvhKvCAvlvzk3rVOsK9XpfXoadCiQk/C2/Eb7hPJruer+CoAO0e3GC8L1y3NIPA31nWaRPu1YXyC4Qq3KvwC3vjUXMk1s05S90uSaJHLxwPeBMd9z0i9XRDLHAClZ7UxJFmW4p2NsB8pgEuFlvP5PZyjIQEP8lIQQsYtSC3FH68x0HanZ50CqIsRZC07GRDongDqul8NTiRB4SsytE80gB2aPDaOMlci3ITzLmiFR/FEfM3j2TY9+L62zgVv+9T0+X3RZJu+CoKzHVh0BFf+K4qzKftch20IVBjI87Q20QX2/qypafEAJNSTyC7MnDeS6ztVTp4O9yMjsp10cn3RumXs2SChZLap9gVOGxOFWhCk5174WEAmzZISImWygR9TRlaw=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(36860700016)(376014)(35042699022)(18002099003)(22082099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NpKxWektACUWTI2rInbPZE8tmq3g1eIBGsXX7RafbvQaJav7evp24ZVlvEBMEwiXOv8/jjX4/Cf6M1fHF5oJJW83Kvs9u6TUiMdF1+n2RqbyRoLvXlE+UlLNa/mbg8skbfCGczwXUs1vaufuoT8llVI3ul87P7A5Es+HLXZKFEBHSNKWuojnfGIWeEAJh/ArxTaWL7bDPFy/HjCe3sRkOkjKIx82m1CKCGq4kGIXr+d7IuFnWot8Ram2wG+FKXIdnG/JXieGcHNukVOXAqGtwzgSR/dtjUOrv2lvUk5JYiIzzkjrpxLVzlUzzIqu9W958c5aj+B9iRm1GZ0PIexuUGAiTCcJ5G8hRGDRl9RxD+bkLGB/NhXRfowH/tUBfahZhbzS86o2VepPi5siSDH6qUUPhjNTDjb+6aOEDdLY0kOa9Dly5POWvh5t/erZLLgJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 07:05:26.4200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f960d25-7d95-4968-562d-08deb250574f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9943
X-purgate-ID: tlsNG-ef75cf/1778828731-09969C48-52178B3D/0/0
X-purgate-type: clean
X-purgate-size: 971
X-Rspamd-Queue-Id: 7774354A4C5
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
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,xilinx.com:email]
X-Rspamd-Action: no action

Hi Mykola,

> On 12 May 2026, at 18:07, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>=20
> Invoke PSCI SYSTEM_SUSPEND to finalize Xen's suspend sequence on ARM64
> platforms. Pass the Xen resume entry point (hyp_resume) to EL3 together
> with a zero context ID, matching Linux.
>=20
> This patch wires up only the host-side PSCI SYSTEM_SUSPEND invocation.
> The resume trampoline and context restore are provided by earlier patches
> in the series.
>=20
> Only enable this path when CONFIG_SYSTEM_SUSPEND is set and PSCI
> advertises SYSTEM_SUSPEND via PSCI_FEATURES.
>=20
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


