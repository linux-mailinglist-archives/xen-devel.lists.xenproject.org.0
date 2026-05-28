Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJgqEJOFGGq6kggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 20:12:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EBB5F6238
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 20:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321629.1588304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSfD7-00010h-9n; Thu, 28 May 2026 18:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321629.1588304; Thu, 28 May 2026 18:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSfD7-0000z9-6n; Thu, 28 May 2026 18:12:01 +0000
Received: by outflank-mailman (input) for mailman id 1321629;
 Thu, 28 May 2026 18:12:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wSfD6-0000z3-Eh
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 18:12:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSfD5-00BNIA-Ny
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 20:11:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a188549-e002-0a2a0a5209dd-0a2a450c863a-36
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 20:11:59 +0200
Received: from [40.107.130.44]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a18856e-62f1-0a2a450c0019-286b822cee8b-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 20:11:59 +0200
Received: from DU2PR04CA0161.eurprd04.prod.outlook.com (2603:10a6:10:2b0::16)
 by VI0PR08MB10618.eurprd08.prod.outlook.com (2603:10a6:800:20f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 18:11:56 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::90) by DU2PR04CA0161.outlook.office365.com
 (2603:10a6:10:2b0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 18:11:55 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 28 May 2026 18:11:55 +0000
Received: from AS8PR08MB7265.eurprd08.prod.outlook.com (2603:10a6:20b:420::10)
 by AS2PR08MB8746.eurprd08.prod.outlook.com (2603:10a6:20b:55e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 18:10:52 +0000
Received: from AS8PR08MB7265.eurprd08.prod.outlook.com
 ([fe80::b001:5eea:7c3e:1a31]) by AS8PR08MB7265.eurprd08.prod.outlook.com
 ([fe80::b001:5eea:7c3e:1a31%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 18:10:51 +0000
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
 b=vUt9OC6Sa2ZMnZmeWgVE+wQJQXFd+MTpDhy8JaSAOJ/6lH1LXiztv6ba927CzhEm2UllIzJ6HNAfNSpImP/812KvlVmBe+zhwmpGW3GmQ6CPBo71Z5kOorhNJLCxwNaOBcK0PsTLgmPnZltOkZNYm62HSk7rifydU7LDNwH//SJnaYjKTyZYiQL32KihhuQnAazXGHpgjk8QWoE0azNwgr5sVtZmEb1uoP05M9HDVu3X7B/6mzDHH3PXwuAQKMt4KDAhf6FarI1hpnadAMKf50X3vy5QARmHchHDXnAKcVdOHi8Q3ARhXBT6LdDo9X8TUhnNrm5iqaDXpUGNu++X6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EioLAprl2wBjX9h1TPA/LTjqJ4EjN2p0DO3Ykm8XES8=;
 b=fJabiG6QvIeCSgka5DlXrpPhFebYh00WU4ORmmbcmvFcZvwXQ+OlUbCMeblGwA/rFVunMXrNUjGQp+MxLNdsnhaC0w8uidDltdU+/Nyri13r0oJaBri6aKgqSWYxq11SypCKHajwQ64+WB3A40KX+MD/uO9b2hc6acZcFAPgINx6hDD9WV5dpyfNINiYTgtSSzARuIgWccl/GrljMpMzwwu23WPy4lbCcgI4tZmxHKv6w/S8L2Ri7/qcM7+rZyaqFrBIruFMw0VyvlalXT9jkQDibW/Tl2QbUxSUTCTbVMN/vYgpXrrlB3G5PcYRaSkI3FeYa/IoTCvaAVsxIfQkrg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EioLAprl2wBjX9h1TPA/LTjqJ4EjN2p0DO3Ykm8XES8=;
 b=sO8WOetl9GySAClUkdrU12IL298peSQILMUzgVPZu9amrhso/ZOhCuZstoS3s1Wqwk1pXdpJIXO/y6/CN4C9reMUS24s0pHKbvL3tCDhOP2tCl7NI7RBcAG8GBezc8ZvObug+NBHBmUVBwYuLjF3SyNU8pg9f162E0bxYrlTgOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcYFc24BlwsSAhaETb7mWFO7qeOgYsvXume8Q8Lu2VxaChrVh8a/Xue5ShrzgTPedWqtpTQQBbciRlzVGNkQsZzsBOCqPF7fZKOeDcAz3XrRBRvGjMA7TEBjWSaygy+wkXr6XgBope5EQCA2Ka6i+TbQFrNfnb1VpxwV1DyaLTmvzgOPUwnuu7Qd2xuw1s+RzK+UxNP3UEWw3eTr17DnrXAwB4tP3KDe1vgMCi7Fvgd76qh3l6YXNSScks3Rn+uJ2v3AHpLYD8J0DdBF1aizWkXAFx5ZEfIhEfvr7bvA59EonTxR3UQ2QxU0GVekKn+gINuVGvBUq9DA6eK9YTkE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EioLAprl2wBjX9h1TPA/LTjqJ4EjN2p0DO3Ykm8XES8=;
 b=FjLun/sXSS9Q4hFflNKlTKRkz8Hk2xWRh9C3R0A8WspC+4/BTi1/wMyH94vQI5P2PM0QEesJiwp3fOCoHRJ5LrC4W5fpJSdjvdCXzUqdJ8c4tzT7x/+2g04jUC2dnBdGPv5t36YA6IWcpLbBGxQdPshG8Ig23hyDF7PNBLi45IkYe8y7p58GB8daEQOxeElevaB4ZSq/sbylf8B/aMhaK1XYk8KXQmE9twoPgsgGq2BvyVRnuCun+/mDOqPIkf/GB73WK5wSQzzzf7pnVvMdC3ZqlebKJkV9gn3gXZHXvf4aT6RWuaeLqv1Z+K63Nbnw6PVAGE3nCRrpNFmtxHyItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EioLAprl2wBjX9h1TPA/LTjqJ4EjN2p0DO3Ykm8XES8=;
 b=sO8WOetl9GySAClUkdrU12IL298peSQILMUzgVPZu9amrhso/ZOhCuZstoS3s1Wqwk1pXdpJIXO/y6/CN4C9reMUS24s0pHKbvL3tCDhOP2tCl7NI7RBcAG8GBezc8ZvObug+NBHBmUVBwYuLjF3SyNU8pg9f162E0bxYrlTgOk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v10 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Thread-Topic: [PATCH v10 05/13] xen/arm: gic-v3: add ITS suspend/resume
 support
Thread-Index: AQHc6UoGT/kfd1Pv6US/NK5RLp1zNLYjx+kA
Date: Thu, 28 May 2026 18:10:51 +0000
Message-ID: <E775FD70-C4FB-41BD-AE73-BA6383148546@arm.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
 <95930674d4639727b9cdf4f52b4a23b6df60c3c4.1779385072.git.mykola_kvach@epam.com>
In-Reply-To:
 <95930674d4639727b9cdf4f52b4a23b6df60c3c4.1779385072.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7265:EE_|AS2PR08MB8746:EE_|DU2PEPF00028D0C:EE_|VI0PR08MB10618:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7ab30e-db42-4808-1deb-08debce499dc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|38070700021|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 zYoPVR6jGepCi/05BVW7PlH+PXO3neT6YHUVO9LhGqahC8cKpE8OG8eSAMyIrZGzkR+f5zUcj4gaOpNv1oSZtSaMo6PnVXXdXZoRlSe5X8e++me+/mIYMe7bNIJt5dfEzDhreesAPLDmv2rI4G9wjn9R5rz71uY6HGWd17JcK/nam4P2BQ67YOx6iz51XcNVMaXLGoEfLVIE6qugJjCZz7ZadphYbCCU/z1cUkJE33t03gS/vnwkmuZM7r9IGDN4i94NbCVR9aN5ughWn+C7EvNz1Xb6aUe5YGV50l/UH8EbsHmsqk+ryGPqXCgB2i4112erykkUsI0P0zNpNGzfriUOHMJIi2OxuKaRq+gR/uudNqPymau6vHfchA3PGI5rotPraSSzNRO2l01o3klvNlqTIbTCRYS+XiGtoLZ86S/XSmYWotRqZc5ZMOVmDSWSvuNSK4+4/OAyM1++D44s894FIA/+CbWwMs9x/swGD9JhDVUNOl0X8HBsNQDBHdAMoS9h8AQ5BKULz5qYqA2/2zd382RLuVIrjrE4ErED3rrZ4fVCVY5lUmC/fKoW37ox3eXEEm/cjPf770JRmByArKMsvAr16tFZv4eCB2enWBd1czBZkvMNKt9yKC91n6ChpJ+mfol8vf0zOIFIxJJYdunqQ7FSLtjvPxUfzxiY4uI35L5H+3ZmCpuXnVJOTk9eTb8Oi541Ibxb4Ye5jcb47j2vnfuH2cKPzGfPjNq0ITDrhe5kW/SRuVVHJA1AD/B8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7265.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(38070700021)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A15D9561F43A224AAE04F59DA77C870A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 NjN4lPAe3vFmJGGlNlAJ03Aqa72r2q4x+IAbfc4R+K9ZBLVKhQt7If4RQ99eGgJNJuF4SG46pAKKLLi1yDeO/gSoQBQGnEQc6q3n+SG7VXjkgdmCFKAr/iFs7aooxOX5VFtRVTNMWas+LT7CWblQXzbwgzrwh0FMT+UgJ7ZjVQlNX8g3DVgdQNdoDtZmhsBCi9cLkzoZGwbXzFMVGNWvM4FsW3BkHVMy0p3Sc3+ZPoDzSoiIqysS/QXm5lCNhzDdqWo5pJvV4uYw325jkRBk6ijaZtK4QAKHbM+Ij7xcXIlofu94NGvERAEZ0k+S/BiUw131kBzIy4HV+bYGMGeLyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8746
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bbe50cc5-15ce-493d-314d-08debce473c6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|376014|7416014|82310400026|36860700016|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	0v7ALxTqNcyc05PdIlvd2uu2EHQ2mrX86o3ll3poT2dWYXPEyfrGjvFnz9mmKjcPr13xIeU7OlTD6Mz4P3yr/26AY+DzDopXp2WIgiBr9KhlIZV78QsjCiopYaGKVDPe2/RfggdppMjnxVU0UPS8fdjMP+ah5F+SEkQ9hFzLw3tq1+iVUyVkARu9aHP32UQ+EQSZa5Xv/jBsGlW7FkKBY+HoSq7O/019aNW5aDEfUV4j8knrxLW1iqrMYHjHoYwIKroSAcod4ueJENlIcuajfPj+Nof97T8ZT74FMTQmJ0CaZn0CHpxakf612winvsT1HzltQ/sSzAJQ8z61ufQO68Qeb7762stg8QV9/mLnsFRK6zHNFTqr7Jo6lx4yqjwYSrPZ0nki85sMwUrLLGlPyFWzsvriGYIA1bfLoDiEWCwJeYm5f24PL/6RNBDHqyMkN4vbJHGDww7wHP9cBs2A0Nf36bw4jMi0q/xPsXpK+uyGFpCDWKYxHxG20R38LqIqrH9R18cK4Xt+6i+3MTya//Eh67F+0dof9fEmL5hQP0PyzVxgJN2C1vf11Aw9TAlBzohEGpBdwPD2pKXjRsFF5gLt0Nr3mgqwf4Ig0rH6+Kw3KwvsP/JBEwSPhG8AzWvFBxK1aL8RtxHFeW2t/Zb6TIPQZum9WxlLRxvyaE2GV+DjtPwBXWOLzZ4t9Z8VQ/vA5EMNEQfHCITs1Ty7iAT3HnRDeWLeyH8NLOBbjgPJ8R4=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(376014)(7416014)(82310400026)(36860700016)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xeHc1zXkoR5/d9WdhoaEkzhZRHsZ0BNIu9iPATwfhcpMEGCz/85UI0bwffi/26FKFJ3bAAwQJnzW06B8lKuVk4bzr7mz5tZMUbSDh8pmPyWB5bA8hb/t4idX0Hh0OY0x6d/K8GsFrvaIZxyXcnJSWEQ8syHDsaGr2zx5JJKO3ybe1VtPfav5Dy/1YjKP30IA/yg6u6mN/objgMHtY2Zeg2wDjJyh3d20WmMgzh6i1HqhDtIPAZBiTuCacX1Epcsprt3mU1SEZ391E4MONK2sFhiN7k+o6FvjyD41Y31EhkAJxEHhD1aSulQ5jYDLwaV8OMyjQKdVM26UnlMHgDOTwsbuj8h6R2+xsPvrwQGjVz1eAXeuFJYr1zFHbd7sm/MBVNlEYgn8xboGQqP5TtoTaMUTxF8u2hq11+N7RggAZUtK+N+G4wsfPtdK4dCUozmx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 18:11:55.2109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7ab30e-db42-4808-1deb-08debce499dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10618
X-purgate-ID: tlsNG-d25034/1779991919-DA577CF5-FD050A16/0/0
X-purgate-type: clean
X-purgate-size: 1622
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Queue-Id: 90EBB5F6238
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTXlrb2xhLA0KDQo+IA0KPiArI2lmZGVmIENPTkZJR19TWVNURU1fU1VTUEVORA0KPiAraW50
IGdpY3YzX2l0c19zdXNwZW5kKHZvaWQpDQo+ICt7DQo+ICsgICAgc3RydWN0IGhvc3RfaXRzICpp
dHM7DQo+ICsgICAgaW50IHJldDsNCj4gKw0KPiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoIGl0
cywgJmhvc3RfaXRzX2xpc3QsIGVudHJ5ICkNCj4gKyAgICB7DQo+ICsgICAgICAgIHVuc2lnbmVk
IGludCBpOw0KPiArICAgICAgICB2b2lkIF9faW9tZW0gKmJhc2UgPSBpdHMtPml0c19iYXNlOw0K
PiArDQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIEJ5IHRoZSB0aW1lIFhlbiByZWFjaGVz
IGdpY19zdXNwZW5kKCksIGV2ZXJ5IGRvbWFpbiBpcyBhbHJlYWR5IGluDQo+ICsgICAgICAgICAq
IFNIVVRET1dOX3N1c3BlbmQsIHNvIElUUy10YXJnZXRpbmcgaW50ZXJydXB0IHNvdXJjZXMgYXJl
IGV4cGVjdGVkDQo+ICsgICAgICAgICAqIHRvIGhhdmUgYmVlbiBxdWllc2NlZCBieSB0aGUgb3du
aW5nIE9TIGJlZm9yZSBTWVNURU1fU1VTUEVORC4NCj4gKyAgICAgICAgICovDQo+ICsgICAgICAg
IC8qIFByZXNlcnZlIHNhdmVkIEdJVFNfQ1RMUiBzdGF0ZSwgZXhjbHVkaW5nIHJlYWQtb25seSBR
VUlFU0NFTlQuICovDQo+ICsgICAgICAgIGl0cy0+c3VzcGVuZF9jdHguY3RsciA9IHJlYWRsX3Jl
bGF4ZWQoYmFzZSArIEdJVFNfQ1RMUikgJg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB+R0lUU19DVExSX1FVSUVTQ0VOVDsNCj4gKyAgICAgICAgcmV0ID0gZ2ljdjNfZGlzYWJs
ZV9pdHMoaXRzKTsNCj4gKyAgICAgICAgaWYgKCByZXQgKQ0KPiArICAgICAgICB7DQo+ICsgICAg
ICAgICAgICB3cml0ZWxfcmVsYXhlZChpdHMtPnN1c3BlbmRfY3R4LmN0bHIsIGJhc2UgKyBHSVRT
X0NUTFIpOw0KDQpUaGlzIGlzIHdyaXRpbmcgZW5hYmxlIGZyb20gMCB0byAxLCB3aGlsZSBxdWll
c2NlbnQgaXMgc3RpbGwgMCwgd2hpY2ggaXMgdW5wcmVkaWN0YWJsZSwNCmhvd2V2ZXIgaXTigJlz
IHRoZSBzYW1lIGhhcHBlbmluZyBvbiBMaW51eCwgc28gSSB3b3VsZCBsZWF2ZSBpdCB0byB0aGUg
bWFpbnRhaW5lciBwcmVmZXJlbmNlLg0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVj
YS5mYW5jZWxsdUBhcm0uY29tPg0KDQpDaGVlcnMsDQpMdWNhDQoNCg0KDQo=

