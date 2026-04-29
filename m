Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N6lLAfZ8Wm3kgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 12:10:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D89492A18
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 12:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297165.1573284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI1rc-0003Dt-NQ; Wed, 29 Apr 2026 10:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297165.1573284; Wed, 29 Apr 2026 10:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI1rc-0003Aw-JZ; Wed, 29 Apr 2026 10:09:52 +0000
Received: by outflank-mailman (input) for mailman id 1297165;
 Wed, 29 Apr 2026 10:09:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wI1rb-0003Ap-0i
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 10:09:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI1ra-004kWm-Cr
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 12:09:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f1d8e9-bab6-0a2a0a5309dd-0a2a4506d73e-10
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 12:09:49 +0200
Received: from [40.107.159.34]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f1d8ec-7371-0a2a45060019-286b9f22887f-4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 12:09:49 +0200
Received: from DU6P191CA0031.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::10)
 by GVXPR08MB10938.eurprd08.prod.outlook.com (2603:10a6:150:1f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 10:09:43 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::6e) by DU6P191CA0031.outlook.office365.com
 (2603:10a6:10:53f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 10:09:43 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Wed, 29 Apr 2026 10:09:43 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB9823.eurprd08.prod.outlook.com (2603:10a6:10:444::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:08:40 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 10:08:40 +0000
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
 b=uXHauZPtbYR2Yd36vsF0oqUmVlS5V4QVzgK//UbiV61ZHW3VJa+e3yZ1MUgygbnOSQCh+nFi3BzAWdVJoOLn2+4FNtroHHMX2HKFSL2m2pfu6Wr1Foi7uExjwAfEL5TC6HCQWCU894mnNU9BNukHozjQBpOCQOBRe31nAbz6RXU2/gKBDwYeu41EMGVuB5ZeJWkDIKHyMjFAW+Kb16nxdrZ6MViSa7rVAkLcUMfZ/eyYJrxDXPhN/I8Qn5wc0gy7l0ISHvRpuU0D+H31JaJp7rnQ9z+yXASJBiMQO+tpR+s2QGafVDBOSc3mLQixgMxyKqyTH4iuKa9kCYBNC2iOcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHB773K3ephjkbIyqrvDSSrnWJH8Cdj/TKx100kAPgM=;
 b=suk5JWpJfurVpDySSfIwuAt1/Tf+ZiZ30p7Q6ezrIa70+bQYUQk5oHTN+r30rsxyMsaUmQ9cgJWXPUvL+17lpnbnZf6QbsYk9k1RVioRf8SKxRz2VQ94QgBjpiRoIfa2CG17OtC0hWUHpSu/4ig6FawuLQfBUFMHdqykOBihJoB9wRvGp1+ODrqp1/Plp5zrigbXtcM8Cl0HpewqsLJ+qIF56Y5hl+Cti3RGbkWqKd+RjZbarSorJ3aZZCgd6IMxh2HWf5b+1/gg+kiUFmPSmKMWL7wc/e5GxP3O4x3t9aRt+iEpmfSi91eufe9396w4xrc2uAEvFUU7PUTCNUyWXw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHB773K3ephjkbIyqrvDSSrnWJH8Cdj/TKx100kAPgM=;
 b=r5AM1nRT1lNsTbFl+BSOEvCCXxswd4i0aZ1qKgHMYDKpRJ92KHdi/sT3saTBCBw1jELwEUYizptb948+01dnuBnW0XLKLmbhYWzXX2YTBYDWB1CsQ6IUmHGD/AsaifSR2CwaeTzpLFRdrcDHCmhnaFlChjuw9Ep91fhghigDG6s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJ1c6ioPhtVtYw8vIoheK6n6mw/dJsd9UvIJRaJzOdifRANk1WzhNlseqRMVMr+4+6vhBqR8IVyDG5NYvXIs6Xr7cJyNryugVN7QIS9qGwGWYNxSeJyM6fVhexEmpGPP4SixVMaEgd1UA3CWVdjTcEJcK6WDl1FJVe7jhe3RF3WzFpTpHFMt26OvjnT5NntwD5cADEVx7qYYVGykMY9UaK8iGrPIR1+6cNZc9bPr4RVxLxk5OU1RbZR7DET+iFdAQ9B48E3U/QyFVb6NIFVorQJDLW7RVlp2htVUFpI1Ur+Y1faziOnVftV8/YufBUqxBHxfua9pqj1/xlXStEmymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHB773K3ephjkbIyqrvDSSrnWJH8Cdj/TKx100kAPgM=;
 b=awcfLXf6RoQzQyFzShYxfXPPOp4aO1HkU+G11ALT15fAbkMyzHU1/1AnA73bXV4YJUgiT3694KpTWQGT3vchGBTty1DRT6144pmDLUAd1/Aq9D4cJqn+breyE85FCvZ1D+PzYzrMvrI3sR2gs3MuMIXKNWLp/pnMdty/84zSYXTpUbDqv2CW/SHANTG8ioK9XmO8gyAQrkKCx/jXzS+bg44MK3wRTAWAcycVRpBVy/nn0m73IvuYYDRNG2G0c0k2nEKJHPPsLTPIxITqUCGQTbd5kKcJBZ/HGb+5nAJqyICs5pwSuAW9AWqffihMre+gINcgxFFLF6YhZ3f2+/78Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHB773K3ephjkbIyqrvDSSrnWJH8Cdj/TKx100kAPgM=;
 b=r5AM1nRT1lNsTbFl+BSOEvCCXxswd4i0aZ1qKgHMYDKpRJ92KHdi/sT3saTBCBw1jELwEUYizptb948+01dnuBnW0XLKLmbhYWzXX2YTBYDWB1CsQ6IUmHGD/AsaifSR2CwaeTzpLFRdrcDHCmhnaFlChjuw9Ep91fhghigDG6s=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Romain
 Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v4 01/11] xen: arm: fix len type for guest copy functions
Thread-Topic: [PATCH v4 01/11] xen: arm: fix len type for guest copy functions
Thread-Index: AQHc1xwXYYBcuLui0UypBKVcqnkF/bX10fCA
Date: Wed, 29 Apr 2026 10:08:40 +0000
Message-ID: <53BD54C0-E493-4D04-9CB1-D16B148CA3A9@arm.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <e29e6176063f8e7c612a4bfa44ac072d7a686b81.1777303844.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <e29e6176063f8e7c612a4bfa44ac072d7a686b81.1777303844.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB9823:EE_|DU2PEPF00028D0F:EE_|GVXPR08MB10938:EE_
X-MS-Office365-Filtering-Correlation-Id: e051f460-238c-44d5-d289-08dea5d76f20
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 d8u2VyPrYanCnBDgLI2HwqJqtcGgiYdGG3x2LfBH2nOlfI/Rj18W99p0zL6bSqQR2KNRyA0bAFKTnrTC4xAUsKaLzVdC5W6erMh+20pMroSJtt8wsJTifHbEZmfBKaQZMLsLELb7jeS5ML4p/Imh/xtRNqRA5t7tknLdb7Cr9pfop4CRlE6Kmm3eB3CDIAdM7I6/RMFCkx2PP6fAVY4MlRGKuWnFrEmgJmRtZJITK8zyL23BUt64H2FZycvPK0h1J735f9lRLroMt+T2TWpxKJf+xcu371xtM0D7fnoJVq39VbRr9XYWZFghX7CjYcmnfreewZIfORKz26R8IBVAvt/8JVgNm2Hm6e1AO7g5gzVQprlO9NRyk3Yc9HxXWPVlfIsnUERhzfPh+c6CuMB912Smfzhrw5z8kDqEGnTHutbzhOu+DY6pWMmpOZoRa03yY1lXXBpa8UOFCDQqm7L0waHG1xvY0hgyD6evEmmasWH1hwtN3lwyE4vQpqfud6eD7YaCHVhYFp91OsODxfe2x0AFTuOXyYZx9ISIvHV0kXP+wvw+HYLD6AGLdCBxd5WoE29CTGB4u3DGZMF30Ys6bJJZE4ZSRT035F11tdRSveBcgzAarAfLPHsweQo2CPmsswBi5XYW+onJBa6NAdPzHD7jmS0bzQacMffI47FU66zbBRpq7mXujT7cLsmEzR0VfwP55J1aDIliU+gD4Y5nCHYCWM5AynukLXg8HaquCoFDKBjokXBQZRf2Dxsqt2Xsiv6UuIWBLuSbwEKb1qWSP2rcVcMlE3tPBL2Y2ZHnCxg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <018A2DAE69417E4E9C74A12F84783F28@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 bhSZGG2jdpwSB7XW14Lbej94wuXY8MLod3wsCPBfbncAJTwQW8yNz/GqLMk6KJzgQHV6u+6yyaJVXQ3h5BG12DGcwdiEJjaeNGnu1vGyXVZpPeq+qqgScqY1JWUVORU2YZhg1BxI8wFDMc2Wn+Dc480AkjxuqVu1yraLA62QjCLn23YztljND4eWnLAwHRS8WONUKj/CM3MkQ7NhlXpBcgO7fhhuUYqDGtLSIWjWJ2UNvCFpoq/nJ+tdZ5MQvngfnS8VSAHmw1PC6ej1gKjVjz+Zaaq5fw5gOpLo93hsniMt7xmPRos/h3p2mBQFsDDXk3VxjwoJBQQ35I7whlGWzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9823
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	df8700a9-cc59-4c6a-fbd9-08dea5d7495c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|36860700016|82310400026|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ozw6dtgE4KVhI0su6HLv4RCLZo7lB+LfHMmYHftE4KTk1jpC+02NcY7cL+1NBByFiHAB+ZIC/RBeRP/WvNKO1Bku20gCaH4QgsKZtcD57CQk6akmjh54hOwWwGuoTFK2as0/4ZgMD3YK3uAIE9lGazCrzMgVk6FwYvq0kros0zCuYw3RCnj1rY2EvaM87ADtM/890Dt64pRlCNjRuaghlX14gyvwZ08wZCmVhQa2Pjb/xx3Y0mHtokHcKcukm5SeRd39VIeBQFTgKB4SwcQB4cRKl8KiNM6yIdrkChwr4RLTf6GLyqnWsj1Oy4vDdrlzaKN0ndyeypIiqfRpjgC0UmQHhCXaD+K5B6Op/Sol72tt9og/nGve4vPRCHhwRqeSUTEuMs757nBRiRBDQVNChvC4IRDBCXVOjbDDHRWzYCGUduS6egWdDRKwLX0SPU0CoTpwU1cu4dY3naXOeRXGOx3tvdbGpjUeNZvS9kCKPG5RRCV7CozSvHxBPE83EpnXYDp9M58OU043vXJOs0ZJzKOrMszLW+hXfiOpuLSnecDBEIBRNcdldDDCrKzieyWNpHgEz+UHBUy/c9OfO+RThYb1l0GXQbM4RPYiWHH3H+x15/+B74rAN0d6ihAt9Y9UrTE5iqS79IdmftKr7SnmMm4vId1v8dZADZ1T6ug7jptH8G6bzGJteAf4CpI7rIrgLy9SUaMPaIWSLPlzce+qh8ZJ3b/mu35/zsy4L+EUZww=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(36860700016)(82310400026)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FlLeoATG3ZPLEq2TBnq85fRh0tq3qrOpnZ9KMWGxvGMXwKgGQ+fMOPyLtBWffHcd1TPOKEIXqWrji16uoGRYpFTdz+AfCxmUHRg4oz0LcaV5FJrXC4dYRQmNRGn8A2zhEDhxw7Np+T78pARKZ3KhA6OewNd0Hh9uD4YqXX8gXt6h8pqhbAfJ/cc3DbAEMtubuuOGxUvBGSUJROyq+6XZOCbpgB3spWOwoZrwqq0DdRKwLSIzQ4lvcIaUty/LaCTIyTJoxVAkASaLou+7S36yIMI001u8VK+ujhyBTzqj4PShL8jaqi1MSb078jOCyGdDvt6fI3UOOkcUGTOardovUE9zW3x0bhSn0VyICskhzJABttWdAS6z4tJFt9EnSnCJlb8g83oYDJlWeCX+vhnmfbz+XyACyBFVwcJVL67wxyGexWtqUBrJKWIACrojQXHt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:09:43.3155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e051f460-238c-44d5-d289-08dea5d76f20
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10938
X-purgate-ID: tlsNG-16d1c6/1777457389-50B65D75-C2408EB6/0/0
X-purgate-type: clean
X-purgate-size: 2940
X-Rspamd-Queue-Id: D2D89492A18
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.957];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,xen.org:url]

SGkgT2xla3NpaSwNCg0KPiB4ZW4vYXJjaC9hcm0vZ3Vlc3Rjb3B5LmMgICAgICAgICAgICAgICAg
fCA2ICsrKy0tLQ0KPiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ3Vlc3RfYWNjZXNzLmggfCAy
ICstDQo+IHhlbi9pbmNsdWRlL3hlbi9mZHQtZG9tYWluLWJ1aWxkLmggICAgICB8IDIgKy0NCj4g
MyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2d1ZXN0Y29weS5jIGIveGVuL2FyY2gvYXJtL2d1ZXN0
Y29weS5jDQo+IGluZGV4IGZkYjA2NDIyYjhlOS4uODZmMWM5ZDBlMzE4IDEwMDY0NA0KPiAtLS0g
YS94ZW4vYXJjaC9hcm0vZ3Vlc3Rjb3B5LmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2d1ZXN0Y29w
eS5jDQo+IEBAIC01Myw3ICs1Myw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZV9pbmZvICp0cmFuc2xh
dGVfZ2V0X3BhZ2UoY29weV9pbmZvX3QgaW5mbywgdWludDY0X3QgYWRkciwNCj4gICAgIHJldHVy
biBwYWdlOw0KPiB9DQo+IA0KPiAtc3RhdGljIHVuc2lnbmVkIGxvbmcgY29weV9ndWVzdCh2b2lk
ICpidWYsIHVpbnQ2NF90IGFkZHIsIHVuc2lnbmVkIGludCBsZW4sDQo+ICtzdGF0aWMgdW5zaWdu
ZWQgbG9uZyBjb3B5X2d1ZXN0KHZvaWQgKmJ1ZiwgdWludDY0X3QgYWRkciwgdW5zaWduZWQgbG9u
ZyBsZW4sDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29weV9pbmZvX3QgaW5m
bywgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiB7DQo+ICAgICAvKiBYWFggbmVlZHMgdG8gaGFuZGxl
IGZhdWx0cyAqLw0KPiBAQCAtNjUsNyArNjUsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBjb3B5
X2d1ZXN0KHZvaWQgKmJ1ZiwgdWludDY0X3QgYWRkciwgdW5zaWduZWQgaW50IGxlbiwNCj4gICAg
IHdoaWxlICggbGVuICkNCj4gICAgIHsNCj4gICAgICAgICB2b2lkICpwOw0KPiAtICAgICAgICB1
bnNpZ25lZCBpbnQgc2l6ZSA9IG1pbihsZW4sICh1bnNpZ25lZCBpbnQpUEFHRV9TSVpFIC0gb2Zm
c2V0KTsNCj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBzaXplID0gbWluKGxlbiwgUEFHRV9TSVpF
ICsgMFVMIC0gb2Zmc2V0KTsNCj4gICAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOw0KPiAN
Cj4gICAgICAgICBwYWdlID0gdHJhbnNsYXRlX2dldF9wYWdlKGluZm8sIGFkZHIsIGZsYWdzICYg
Q09QWV9saW5lYXIsDQo+IEBAIC0xMzYsNyArMTM2LDcgQEAgdW5zaWduZWQgbG9uZyByYXdfY29w
eV9mcm9tX2d1ZXN0KHZvaWQgKnRvLCBjb25zdCB2b2lkIF9fdXNlciAqZnJvbSwNCj4gdW5zaWdu
ZWQgbG9uZyBjb3B5X3RvX2d1ZXN0X3BoeXNfZmx1c2hfZGNhY2hlKHN0cnVjdCBkb21haW4gKmQs
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90
IGdwYSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZv
aWQgKmJ1ZiwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgbGVuKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbGVuKQ0KPiB7DQoNCk5vdyB0aGF0IHdlIGRvIHRo
aXMsIHBvdGVudGlhbGx5IHdlIGNvdWxkIGhhdmUgdHJ1bmNhdGlvbiBpbiB0aGUgcGxhY2VzIHdo
ZXJlIHdlIHN0b3JlIGl0cyByZXR1cm4gdmFsdWUNCmluc2lkZSBhbiBpbnQ6DQoNCmh0dHBzOi8v
eGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXhlbi9hcmNoL2FybS9r
ZXJuZWwuYztoPTc1NDRmZDUwYTIwZjA4YjViYTMxY2FkN2I5NDkyNTExMmZkZWU5NTY7aGI9cmVm
cy9oZWFkcy9zdGFnaW5nI2wxMzENCg0KaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9w
PXhlbi5naXQ7YT1ibG9iO2Y9eGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb21haW4tYnVpbGQuYzto
PWM1MTUyMGViYWRmOTk1MDMxMWY2YzA3MWU3ZTA3MDQyYzcwNzZhMjc7aGI9cmVmcy9oZWFkcy9z
dGFnaW5nI2w0NDINCg0KQ291bGQgeW91IGNoZWNrIGFuZCBsZXQgbWUga25vdyBpZiBJ4oCZbSBj
b3JyZWN0IG9yIG5vdD8NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCg0K

