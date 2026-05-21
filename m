Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAL0DDg2D2qSHgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 18:43:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4235A9827
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 18:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315603.1585341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ6US-00051s-C1; Thu, 21 May 2026 16:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315603.1585341; Thu, 21 May 2026 16:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ6US-0004zl-7k; Thu, 21 May 2026 16:43:20 +0000
Received: by outflank-mailman (input) for mailman id 1315603;
 Thu, 21 May 2026 16:43:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wQ6UQ-0004za-Rr
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 16:43:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ6UQ-008Eus-7d
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 18:43:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a0f3617-bab6-0a2a0a5309dd-0a2a4509d3ba-14
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:43:17 +0200
Received: from [52.101.83.16]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a0f3625-2497-0a2a45090019-346553104174-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:43:17 +0200
Received: from CWLP265CA0355.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5a::31)
 by PR3PR08MB5739.eurprd08.prod.outlook.com (2603:10a6:102:8e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 16:43:13 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:401:5a:cafe::4) by CWLP265CA0355.outlook.office365.com
 (2603:10a6:401:5a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 16:43:13 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 16:43:10 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB9PR08MB7424.eurprd08.prod.outlook.com (2603:10a6:10:36f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 16:42:06 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.21.0025.020; Thu, 21 May 2026
 16:42:05 +0000
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
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=Ywx4axVu1ee8yeBk/f5u4CKMJ2PbqH+JX7w8jD0+AqlQ6PcSUc/q1wQ7pcbL1IPrAOecDfM3LICCXj5u4sYTb2jerlG3QFBaPK3vPdRif31lutdUJeSMPcO8dQwXTQ+RnWqXoC2irWYYSq4ngJGppELKLgnIhsq8Vr+yLXCAXk1cXJhoU6dceugoWBmquV3HV9wtDNK+2yxHSPBtnAdp9HGCpcRPMzlotn3xtg/V+tqBcajtAhJJCTs9faHpGLcRecuxzfqod2GDcHnSQZB4mqdcoAn6vf/lGNjS8CAI2pfVdoWip18Ib5GDxv7IowNRHYe1PDnJUpwRaZ1Ntj58ZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SdlPMyloHC0VrrtOvIDK8uAYHwMZWx5pkK7oS8qsZM=;
 b=kNtXzW+offceVo1Mf3lujNsRJXruNib79kQFrpdVxdWVCIaeGpI7mD+F5ui7WZNLL8Q/fVGIHLJNYLsi/51tVPdNyOp2NbS1W/6FBBXqWg1pP92WFDyrI/u4K+/IAMPlNnacxicpzxVmomZM3SEgGS9K4yqX90e32lqNTLnrmitrlZ8EDBQTf2yRfl15rS0s+ELdPUFRz/Lip0ulOuwXvUPsV0FIxsRY5sNBj9+aEwJbZoOgOl+VnRY2C1aGjPaGDqx4pv4sAnZe1UvOita/Agf1VokvetENoY6pAs6OZnO5K8rfR6ohnBng8/isuf/gr+11F2HwlI4pXf63hs+lbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SdlPMyloHC0VrrtOvIDK8uAYHwMZWx5pkK7oS8qsZM=;
 b=LDRTovtiQS0IXUBD4BWs2nkx+9k5l7FDnLyYJhPML1Bol1/GIRMzsXH3KmeRiWOhVVBa3FQQ1v1WpOqI7C+gjU75YGJn55vKZ7cyK6v5S43+1jusRU2S8K1kETAiLmBgBFgdtgWATBpDinJ5fjG8vFVPRFzj6bI51s1eDtMV9DI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7eMa4dGjP0mCEGT93/SknJc80pcAdggzAd+Al+jhnA2hRKEqtpEGlRhfe0Ha7ezUgmV+i8zGe0tWLvMNETuooFHTnbTeQe5rS9+cbEeAYUzxmrtNxVvh3i43nxpD8EEgqrHGZTdRMiYiYukNI0ZZ7LcS+6cpdBb1aQqVLnn1ESjUNzv0hyFP5sz8BIgyVLRe5ps05UudMYcr6eF7RXwtKcrxxoJBfQvSL8LbctSXbu1T565/Umo6NSxDEkut9sl7wc2xvzUdQKuHX6Mae4zNKD8vTC/0hUg5iTYv9AB6bI7pfs5bbryfQgCMxkrVtvjSBSW4OJEupwyCJHBaRE2qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SdlPMyloHC0VrrtOvIDK8uAYHwMZWx5pkK7oS8qsZM=;
 b=C2bk5ZPLuuyE4nwsafFgQJI/3zNY0Lq4bZ3Ko83ouTaICy3v3nLAT0wqfnwM9ylwzNZ2UGrpXwGElFzfkz4ICwQ1TaIHtVsTTtMo9We6uGe9GDwUEqdGkr2J/O9RC/m+PaDryfRxXG5zQw786TG+MjSFiGxvEHWDJftIkEZYZqqXkIvMss0SaKtvZh6x2UHTULsUHxLxiUG6gwxjiCkFV5Z1+cl8SByfRbdyxf8SdNOg5ALdB7anOTGtNp7umyeY3hB0a3jD28/IZXxhBIq5v8yPffag4Ca8R0NvFXmR7pOxl0KGI5NQKU0GM6jW9EVxn2geKiuW5fDo/wBkbDKq8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SdlPMyloHC0VrrtOvIDK8uAYHwMZWx5pkK7oS8qsZM=;
 b=LDRTovtiQS0IXUBD4BWs2nkx+9k5l7FDnLyYJhPML1Bol1/GIRMzsXH3KmeRiWOhVVBa3FQQ1v1WpOqI7C+gjU75YGJn55vKZ7cyK6v5S43+1jusRU2S8K1kETAiLmBgBFgdtgWATBpDinJ5fjG8vFVPRFzj6bI51s1eDtMV9DI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2] Arm: do a 4th linking pass if necessary
Thread-Topic: [PATCH v2] Arm: do a 4th linking pass if necessary
Thread-Index: AQHc6RnGu1utUAlrJk+sIf0YXyTZG7YYr0OA
Date: Thu, 21 May 2026 16:42:05 +0000
Message-ID: <74846C01-4D54-4DFE-A6B6-9D4DC0301D3E@arm.com>
References: <59fc2b14-073b-42a6-8f30-503ad789fbab@suse.com>
In-Reply-To: <59fc2b14-073b-42a6-8f30-503ad789fbab@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB9PR08MB7424:EE_|AMS1EPF00000049:EE_|PR3PR08MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c1be5e-cfe5-45d6-1174-08deb7580b5b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|38070700021|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 58nn2JAY22Q4IDrWC7T1dOE4iNh6u5nMmMANMprl/Wtxd9R8Jku0SnbqtPqqXFDdEcCSjYdUyPkkXbQ8i2jU98IcvjtkSgQNBxWh7mG4iqYvV7JY3kbapgfMOmBsXZ3Mj5kp80BzcyeJdytw+5nYxXIxzfIjAZFePj0LHxQiHhZmYGIyp2dFREcoEcQPTNErTztOavfrv3aPIXFbndL3uNZ5M+XjTLMP3XxYPedCH6Bag2uNPJQOPlaSxogwAegHUZe64+k+3vTHldBZE9+VFaMd3ffwQdWT2M6YNREdGMz/cZkbQ8YPgF+3uFuIJw1PUzgWc20FZfEhcg75fLCECqDDMbAR/2p/EZov1z1oJWJeoz4Gnov9zkOE7hZw9MdTLaaIdSnZ1CsgO4/A22VU3h+GocDATPwT26Vr3EWBujTU5zN/+O5XU9a1OYPaMvQl2FQJGtlX1YPO99fmg2d4BUOg98oUBxNRyJhST8FH7EvQ1bXZSVGUdPW5M/saiBw1Ekiir4i4Ng1vE/37vpq9TD+nHWe/kuaT4uQvGl6KiKMuysQkQBj4J4jN3ywQeAZEHBVKwSLzSMw/CUs2oczvor3clC59dQfSJvie6/5Yr7O0NrXD33+BiNZ47jeMMb5PiMJXkGahr7K+hbxk+w7YNfCIcanKjA/T9Re9qFXcx05252CjViErFpOvpRvJ1kVKADxciZAnbhpq96gnHWY+8ltrds2msV3rWyQFabfMEX6j2+Bmv0r8cUt8hLqhjNiT
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(38070700021)(11063799006)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <63F974E5C27062419ABB9A4B32916418@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 Zdhms4m6LLuRKP0I3a5hKwsPhJ5DnhqUDscCsdlPkIhB2cB/BT8MxBPNQb9S1jr6uzoDlW0bvDOT5kQSYOOxQWpeLROHgxL2D/EAuLOHIP1QhipmD/Kwb/xp0NhT3mnFmDUBAEmTnBNxt3Vn+VVre3fnw94AxRyHhEHVBMgXN3VnrdZtLqpVBGfsroi75WyEC3umg/fLM5eRoKlSy1bv/h1fH28xpJxx2BO9q65Q3xin/tyEEM586G4wLG95hWedUxYwnuYpeY4Ow5DSVGpNyPqYu5fxmfAiNY5khACCvFdrabdbJzGOQcE/OzYr9o7b0lhpYYJVZcTNBp8tiT0hVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7424
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5a3e3b7d-169e-487f-c2ba-08deb757e497
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|1800799024|14060799003|376014|82310400026|56012099003|22082099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	J5aYUpoBvnvpkysDfzfx+4WHEclv9HXa3tntTkNJXUXtdUSk6ddQUJLNS1P8yMqQYRXr7RjLQnERnWhXYxXQKP7iH4qgbNrgtuOhguVk1Xu6IO1O/Oy1a3FEZK2y6j4aM/o+27LXT87bJkesDfEW0CALqs3YrlkHZpL0I3gggl7/PH6aGoipDY2cSG/a+GwCFksLS1OnrsjIe6A9pz1qNwH+Tm1jGkkOcLHXDbr4DVVxgXSrpEB5xIluIDVEQNAFhR5uke7O2RLke6ohAq0UMYdAdANt4aSMNJAohPNMsME9NI4mNbw9KCRtkYoQNoyWN8SAtQxkbqcT3Iv/AV10OPlKesrssU/s1fbtW2Z/reNTaM+GSoSefegSIdaCxxV1ftZLgOSm2beFZv+iZIjTpt6sqmBXrLPe83DTZj5xfrQiA2TwsgURBSxhXQ5ig59tPIw6W6OPwmwdVNdw6iwRgGVDVlXr8N4A3XZTvNqoifqVu0uCesGbv7+C9nymOmbig+POfq+f8shHo1mYfs1cSP6tLjtQFKcTA/TLccSHQfKHcFUS+tXvEW5WLt3C3Bk1SywWKSOXXLYfTgiQYh3ZfYiyiPWdcq3MQ4UuJxN7tJWSF1ZpoKCxw/8+pjwlDJneZ2xm/9yxYTDX0tZSnydXjd89XSLuwbjP5c9m67XiWVTpwdTccW0CmrUNJdroKAUKPlrgVUlUEPP4Xy2l/L+Fy1RJWd6zkdd3bH10+LNCxyQ=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(1800799024)(14060799003)(376014)(82310400026)(56012099003)(22082099003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	44RiZ20zm070Ic0NZ91E1c++Uos5bCnUtqlDi4jy8cPC8e78FCCgcy1ttFdZeeBDUNs9HmyfrFqKUoou4NKAMwZnH2yxQlhhYyo3uPPL6pPjoQUy5CNGBPa4KBh3mI60V4eIG63kKiQKyM4DwSWvyhLCKrfOBUjPkXOzz3id6ktLcNYgoXKdD6+6bnHcUITfPnR0E1YdJ/McW2hJp27UrD9dOEna/v51Zk7Ff6ubmcS2Y979Q8gDjUrFa7SWgVhdLSduBzZxFm8HitsGNUpc/teSfWD0kffsrwrS1yxeJ4/eRPnuXVIZcOd8PZ+CHLw4tkaX9vsq7QtDsnpVK8FSSOVjWqAi2Ok/kVXk1+eHw70wI7Wrhl0ch0Nio6XvphGlEHgp1uZpr46o7JYLOEQxF2gHJdUBm7lW3grgRwzWShYeuZWQQdyzqw+EPCh8pceM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 16:43:10.7752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c1be5e-cfe5-45d6-1174-08deb7580b5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5739
X-purgate-ID: tlsNG-bad1c0/1779381797-37B78A53-EC319B78/0/0
X-purgate-type: clean
X-purgate-size: 4730
X-Spamd-Result: default: False [-0.09 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:volodymyr_babchuk@epam.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Queue-Id: 7B4235A9827
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSmFuLA0KDQo+IE9uIDIxIE1heSAyMDI2LCBhdCAxNDowMiwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IFRoZSAucm9kYXRhIGdyb3d0aCBiZXR3ZWVuIDFz
dCBhbmQgMm5kIGxpbmtpbmcgcGFzc2VzIG1heSBhZmZlY3QgdGhlDQo+IG51bWJlciBvZiBzdHVi
cyB0aGUgbGlua2VyIHdhbnRzIHRvIGluc2VydCwgd2hpY2ggaW4gdHVybiBhZmZlY3RzIHRoZQ0K
PiBudW1iZXIgb2Ygc3ltYm9scy4gSWYgc3ltYm9sIHRhYmxlIHNpemVzIGNoYW5nZSBhZnRlciB0
aGUgMm5kIGxpbmtpbmcNCj4gcGFzcywgaW5zZXJ0IGFub3RoZXIgb25lIGJlZm9yZSB0aGUgZmlu
YWwgb25lLiAoQXMgYSBjb21tZW50IGluIExpbnV4IHB1dHMNCj4gaXQsICJJbiB0aGVvcnkgaXQn
cyBwb3NzaWJsZSB0aGlzIHJlc3VsdHMgaW4gZXZlbiBtb3JlIHN0dWJzLCBidXQNCj4gdW5saWtl
bHkuIikNCj4gDQo+IFRvIHVzZSB0aGUgJChjb21wYXJlLXN5bWJvbC10YWJsZXMpIG1hY3JvIGlu
IGEgc2hlbGwgImlmIiwgaXQgbmVlZHMNCj4gc2xpZ2h0bHkgYWRqdXN0aW5nIChhbmQgdGhlbiB3
cmFwcGluZyB0byBiZSBydW4gaW4gYSBzdWItc2hlbGwpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpBY2tlZC1ieTogQmVydHJhbmQgTWFy
cXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4g
LS0tDQo+IFRoZXJlJ3MgaW1vIG5vIGdvb2QgRml4ZXM6IHRhZywgc2luY2UgKGFpdWkpIHN0dWJz
ICh2ZW5lZXJzKSBtYXkgYWxzbyBiZQ0KPiBpbnNlcnRlZCBmb3IgcmVhc29ucyBvdGhlciB0aGFu
IGVycmF0YSB3b3JrYXJvdW5kcy4NCj4gDQo+IEZvciBjb250ZXh0OiBUaGUgQ29ydGV4IEE1MyBl
cnJhdHVtIDg0MzQxOSB3b3JrYXJvdW5kIGluIEdOVSBsZCBjb21lcyBpbg0KPiB0d28gZmxhdm9y
czogSW4gdGhlIGdlbmVyYWwgY2FzZSBhIHN0dWIgaXMgaW5zZXJ0ZWQsIGJ1dCBpZiB0aGUgcHJv
YmxlbQ0KPiBBRFJQIGNhbiBiZSByZXBsYWNlZCBieSBBRFIgKGkuZS4gdGhlIHRhcmdldCBzeW1i
b2wgaXMgd2l0aGluIMKxMU1iKSwgdGhlbg0KPiB0aGF0J3MgcHJlZmVycmVkIGFuZCBubyBzdHVi
IGlzIG5lZWRlZC4gVGhlIGFkZGl0aW9uIG9mIHRoZSBzeW1ib2wgdGFibGUNCj4gZGF0YSBpcyB3
aGF0IHRoZW4gcmVzdWx0cyBpbiB0aGUgc3R1Yi1sZXNzIGZvcm0gdG8gbm8gbG9uZ2VyIGJlIHVz
YWJsZSBpbg0KPiBhZmZlY3RlZCBjb25maWd1cmF0aW9ucy4gQSBwb3NzaWJsZSBjb3VudGVybWVh
c3VyZSBjb3VsZCBiZSB0byBtb3ZlDQo+IC5yb2RhdGEgYWhlYWQgb2YgLnRleHQuIChBbHNvLCBm
cm9tIGxvb2tpbmcgYXQgZ2VuZXJhdGVkIGNvZGUsIGl0IG1heSB3ZWxsDQo+IGJlIHRoYXQgbmV3
ZXIgZ2NjIHNpbXBseSBhdm9pZHMgcHJvZHVjaW5nIHByb2JsZW1hdGljIGluc24gc2VxdWVuY2Vz
LikNCj4gDQo+IExpbnV4IHNpbXBseSBjb21wYXJlcyBvYmplY3QgZmlsZSBzaXplcywgYnV0IEkg
Y29uc2lkZXIgdGhhdCBmcmFnaWxlOiBBDQo+IGNoYW5nZSBpbiBzaXplIG9mIG9uZSBvZiB0aGUg
c3ltYm9sIHRhYmxlIGNvbnN0aXR1ZW50cyBtYXkgbm90IG5lY2Vzc2FyaWx5DQo+IGNoYW5nZSB0
aGUgb2JqZWN0IGZpbGUgc2l6ZSwgZHVlIHRvIHBhZGRpbmcgd2hpY2ggbWF5IGJlIGluIHVzZS4N
Cj4gDQo+IE9uY2Ugd2UgZ2VuZXJhbGl6ZSBsaW5raW5nLCB3ZSBtYXkgd2FudCB0byBpbnRyb2R1
Y2UgYW4gZXF1aXZhbGVudCBvZg0KPiBMaW51eCdlcyBLQUxMU1lNU19FWFRSQV9QQVNTIGFzIHdl
bGwuIEkgZG9uJ3QgdGhpbmsgZG9pbmcgdGhpcyByaWdodCBoZXJlDQo+IHdvdWxkIG1ha2Ugb3Zl
cmx5IG11Y2ggc2Vuc2UsIHRob3VnaC4NCj4gLS0tDQo+IHYyOiBBZGQgInNldCAtZSIuDQo+IA0K
PiAtLS0gYS94ZW4vYXJjaC9hcm0vTWFrZWZpbGUNCj4gKysrIGIveGVuL2FyY2gvYXJtL01ha2Vm
aWxlDQo+IEBAIC05OSw5ICs5OSwyMSBAQCAkKFRBUkdFVCktc3ltczogJChvYmp0cmVlKS9wcmVs
aW5rLm8gJChvDQo+IHwgJChvYmp0cmVlKS90b29scy9zeW1ib2xzICQoYWxsX3N5bWJvbHMpIC0t
c3lzdiAtLXNvcnQgXA0KPiA+ICQoZG90LXRhcmdldCkuMi5TDQo+ICQoTUFLRSkgJChidWlsZCk9
JChARCkgJChkb3QtdGFyZ2V0KS4yLm8NCj4gLSAkKGNhbGwgY29tcGFyZS1zeW1ib2wtdGFibGVz
LCAkKGRvdC10YXJnZXQpLjEubywgJChkb3QtdGFyZ2V0KS4yLm8pDQo+ICsgaWYgISB7ICQoY2Fs
bCBjb21wYXJlLXN5bWJvbC10YWJsZXMsICQoZG90LXRhcmdldCkuMS5vLCAkKGRvdC10YXJnZXQp
LjIubykgPi9kZXYvbnVsbDsgfTsgXA0KPiArIHRoZW4gXA0KPiArIHNldCAtZTsgXA0KPiArICQo
TEQpICQoWEVOX0xERkxBR1MpIC1UICQob2JqKS94ZW4ubGRzICQ8ICQoYnVpbGRfaWRfbGlua2Vy
KSBcDQo+ICsgICAgJChkb3QtdGFyZ2V0KS4yLm8gLW8gJChkb3QtdGFyZ2V0KS4yOyBcDQo+ICsg
JChOTSkgLXBhIC0tZm9ybWF0PXN5c3YgJChkb3QtdGFyZ2V0KS4yIFwNCj4gKyB8ICQob2JqdHJl
ZSkvdG9vbHMvc3ltYm9scyAkKGFsbF9zeW1ib2xzKSAtLXN5c3YgLS1zb3J0IFwNCj4gKyA+ICQo
ZG90LXRhcmdldCkuMy5TOyBcDQo+ICsgJChNQUtFKSAkKGJ1aWxkKT0kKEBEKSAkKGRvdC10YXJn
ZXQpLjMubzsgXA0KPiArICQoY2FsbCBjb21wYXJlLXN5bWJvbC10YWJsZXMsICQoZG90LXRhcmdl
dCkuMi5vLCAkKGRvdC10YXJnZXQpLjMubyk7IFwNCj4gKyBlbHNlIFwNCj4gKyBsbiAtc2YgJChk
b3QtdGFyZ2V0KS4yLm8gJChkb3QtdGFyZ2V0KS4zLm87IFwNCj4gKyBmaQ0KPiAkKExEKSAkKFhF
Tl9MREZMQUdTKSAtVCAkKG9iaikveGVuLmxkcyAkPCAkKGJ1aWxkX2lkX2xpbmtlcikgXA0KPiAt
ICAgICQoZG90LXRhcmdldCkuMi5vIC1vICRADQo+ICsgICAgJChkb3QtdGFyZ2V0KS4zLm8gLW8g
JEANCj4gJChOTSkgLXBhIC0tZm9ybWF0PXN5c3YgJEAgXA0KPiB8ICQob2JqdHJlZSkvdG9vbHMv
c3ltYm9scyAtLWFsbC1zeW1ib2xzIC0teGVuc3ltcyAtLXN5c3YgLS1zb3J0IFwNCj4gPiAkQC5t
YXANCj4gLS0tIGEveGVuL3NjcmlwdHMvS2J1aWxkLmluY2x1ZGUNCj4gKysrIGIveGVuL3Njcmlw
dHMvS2J1aWxkLmluY2x1ZGUNCj4gQEAgLTY1LDcgKzY1LDcgQEAgZGVmaW5lIGNvbXBhcmUtc3lt
Ym9sLXRhYmxlcw0KPiAgICAgJChPQkpEVU1QKSAtdCAkKEBEKS8uY3N0LiQkJCQgPiAkKDEpLnN5
bTsgXA0KPiAgICAgbG4gLWYgJCgyKSAkKEBEKS8uY3N0LiQkJCQ7IFwNCj4gICAgICQoT0JKRFVN
UCkgLXQgJChARCkvLmNzdC4kJCQkID4gJCgyKS5zeW07IFwNCj4gLSAgICBybSAtZiAkKEBEKS8u
Y3N0LiQkJCQNCj4gKyAgICBybSAtZiAkKEBEKS8uY3N0LiQkJCQ7IFwNCj4gICAgIGRpZmYgLXUg
JCgxKS5zeW0gJCgyKS5zeW0NCj4gZW5kZWYNCj4gDQoNCg==

