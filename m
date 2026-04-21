Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GASqG91U52nz6gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:43:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2691439AA7
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288853.1569087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8ZP-0003r9-VN; Tue, 21 Apr 2026 10:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288853.1569087; Tue, 21 Apr 2026 10:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8ZP-0003p5-Rw; Tue, 21 Apr 2026 10:43:07 +0000
Received: by outflank-mailman (input) for mailman id 1288853;
 Tue, 21 Apr 2026 10:43:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wF8ZN-0003oz-KL
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:43:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF8ZN-003OAl-0q
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 12:43:05 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e754a5-2eae-0a2a0a5409dd-0a2a4508d9c2-38
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:43:04 +0200
Received: from [40.107.162.19]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e754b7-63b5-0a2a45080019-286ba213e22c-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:43:03 +0200
Received: from AS4P190CA0044.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::8)
 by GVXPR08MB10587.eurprd08.prod.outlook.com (2603:10a6:150:15c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 10:42:54 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::ee) by AS4P190CA0044.outlook.office365.com
 (2603:10a6:20b:5d1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 10:42:54 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Tue, 21 Apr 2026 10:42:54 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PAWPR08MB9518.eurprd08.prod.outlook.com (2603:10a6:102:2ed::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 10:41:50 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9818.032; Tue, 21 Apr 2026
 10:41:49 +0000
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
 b=LefkrvrH5DIPzLUBzd+zoOLoSAF9F+lCSOAX6Zd+//MUAFU96wkvQ8kELgOCpQqsvyejEn1QT5SeY71oed8DJeqdbedPir9X0fYXLN88InqyxA4ywDWPXEAL3GFy+50RpPgJIvvVwwc6fG1Igd9vpm3W8bDgBp+RdlY1srdoWvaeBPkShKt+gwj8PBOty+EnTMIIqXgUeQSvimSIpAXVhZnonBVgFf7necV7I9l/WZ/NWMHW7rzw/AV3BoK3xL6sxA1pJtT4Xjl8mmlJzV47k2QANH5Euso8upYbUgb0vgs8WZAlTgQ3wq2shIrB2+Kn2eViJPoxkVrWc47nH7uYrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p72l46oHHumCb46GB/T/xSFovc1gGQdn9po47lRcqsE=;
 b=N3amsmHNhe4SXZvJ3ltNpWTw8MOTgQui5T+tg46cVLPZaDNTa1pgTjcVewfFCozBoO090FQbjUzhhYEdOeYdTsnczS60v9ZpPgX+2x/PEA5lNgP2C7193d1af1Bv0fMERAzW9D91dZsYJXo4303qQ105fAdVdiVu86fMAoZnJXoMk441P9SnpupYih+pWhgtKTTyRExcOZoeNjmspvn8tuFR4rJJw8kN2naGt2ecikl0FMmRl5/zpuLCP2AyF6WjwHBA8hZhz4nohVyPxzoQcviUxwik+63d+hG5O4hXK7FGPF/0rrUmXYQ4Kd2NGN7g+Hn7raVGQd9YMrOlaue/EQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p72l46oHHumCb46GB/T/xSFovc1gGQdn9po47lRcqsE=;
 b=Oyu1EagTkIO8V85eM6t641VC5IQxiMTzRF5UeEoFPUsywSFc6HPhTWu2nOjXzrr5YS3ePEPEAjclwAmEGeRPgL0ucXXRDQkQ5ZOhzAzmtrhXIjgYvUb+CUZyszrkHf6zeouxRdgESvrquGM3zyh6C1ABE5yE0qtxrhUT+PB9Knk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRyqNKviY8WHKTP7MTmnxEfVj67uWxXH8G3o6pGbhOmQgujzOhNzJGF8031ZUYl8i1vmTbXsSWdQOGLNOwZM5KHIRPFBWzZUhCLhwYJGe2KoGG1hdovdf1hsUohn22lFC0D5EtQya1rb1NjoTPbCw2CKSLwlcs0qmlx1Ce+Kh0q/ukIVr4V9jy4Ds4QxK9q1eFC/WJaPB0Yx5BsPuAM3eReEND6e2rR/StFHsD5GCCCGkxedVOhaW/oBXAHIedzSXzeSWseQbVPuT1zxXsyxTDVrzmyd1HM1ksW7KYnQTVz6rZNXtDGHzKIIPikQDL0IhYeZOaEo5nZmmp2QRwLIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p72l46oHHumCb46GB/T/xSFovc1gGQdn9po47lRcqsE=;
 b=HfryHPze25mQ7VIXq2fYYdsQcH+W2iXiATAclLIt8Sh8LpoWfq78l5oDVNDbPYdkB2umwZnmLcyI8xLUWgNWe5kKbb8ZJS04YL0C27Y/fn4NNeHQYZPCVm7GcdbO5CUtGgWR4mFb8ryF80q74sZq5q4FFIT8RVW8RONrtq9WWvb6beMQe2V5NXjC608KTsgHI6dz7qLAJ4se9eyRE/CyVY6MxgjMLxoK+9ZTWHHJyub+Y9L7XMiAvWR3anZhAkCO4/5hIxJOTBCIPYoZtF8zqUkpNaB0b+F+uX2PRMnAf/0SMF4WbEgk2EZnCLgoWYaWvfqTuwLgMmznZ/v2wlgMDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p72l46oHHumCb46GB/T/xSFovc1gGQdn9po47lRcqsE=;
 b=Oyu1EagTkIO8V85eM6t641VC5IQxiMTzRF5UeEoFPUsywSFc6HPhTWu2nOjXzrr5YS3ePEPEAjclwAmEGeRPgL0ucXXRDQkQ5ZOhzAzmtrhXIjgYvUb+CUZyszrkHf6zeouxRdgESvrquGM3zyh6C1ABE5yE0qtxrhUT+PB9Knk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: skip holes in physical address space when
 setting up frametable
Thread-Topic: [PATCH] xen/arm: skip holes in physical address space when
 setting up frametable
Thread-Index: AQHczko4909b0LdR6E6hEGKgM2/tzrXjJWsAgAASSYCABMl7gIABVuYAgAACHIA=
Date: Tue, 21 Apr 2026 10:41:49 +0000
Message-ID: <E42EF2D6-F806-4AF3-B736-76134E443767@arm.com>
References: <20260417091124.39552-1-michal.orzel@amd.com>
 <DB4CBEA0-B901-466E-80AE-483FE00A1282@arm.com>
 <10ef543f-ec21-47ae-aeb2-f569f8d48e27@amd.com>
 <F79D2A76-9FD3-4E6F-A26F-286B57E87BD8@arm.com>
 <6a6aefa7-530b-4221-b2b3-65ca3298aef1@amd.com>
In-Reply-To: <6a6aefa7-530b-4221-b2b3-65ca3298aef1@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PAWPR08MB9518:EE_|AMS0EPF000001AF:EE_|GVXPR08MB10587:EE_
X-MS-Office365-Filtering-Correlation-Id: f532c18b-b895-4752-fd02-08de9f92be73
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18096099003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 VJro56F3A3JDgn6n3CIU/w+f2EZDudEctGUk+0F3YHaZG4xuBLeha0FaMArlRfisepvxxrsZNxvp1UQJwptFQFmBEDeLyngfmCKHg+qDyGUB+ggxGCkw9sx9i1NqzrLo6Vlw9TaCudjwUNVg9lUcmbRVHY5lQ3OQtEdX93U2lZHqZlxncfS8ZfowllB7KfHvRNtghsIGcnbBUYGgFc2doHNjckUrZBdW7nUP9QdVy8QnzO/07OK+kIZZCreMBtCt1riWJHbdrU1pMQejnwrT5gGVEhtKTccFlNnuj6z8NSo0SRV8mPG+9UzobcXTi5mSYGbO/NcT0OUCyjoF65D4lg8XT/Xcrp/bhJ5YsK07AK0tVvsx8AyVxcO1FKncSYBNpPZinPoaZxZ5bVp4YKJ3d7KdMX+zNt+ygiGiTpP0xinRKM7UpZxuHOk1tjNdTyUhXhnB7FO0YDmi5TfKPL28FC8t8FQ8xXpmdTW821R2V0wR42y4SO7vt0lbyFfveYIUsMrbxn2hNZRO995ijSwQ1M/FtWdK6YbkUz9G7t7B3IhuiYxpiGTEI3mfMBiZnivVNPinoi9wWd42j9pnDmo6kMMMC0Zs0bo98WeAKGu59tdWSThJDYe8dUZeLjJzdvJcnkesAhAyqXt8PCL8wThu/nsXVQ6DrLZE3LKim5JFpsEGJptlBc2mAL3uQXGaeJ0ghxrVChN75kZh/iMWTjIy+3j/xLGGGaYUjB+u6yIwRZpyXVeK5LpGDgOQ2JeJ4LtHvFmBnPnXTjaK7zI0xjrjjNJiB+4LesNk/E41dfXzy0I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18096099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <29F1D4A8D168664A8F6151AEF19C0328@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 ITYQOdflpzHncRHqJwSU807FYD4oL1I/poetzekCo3O1canU6GFiD3TiuaiOO3gECfgJBZs8s9qbLaGeewfTXcRRJdWaM/Da1XCMjOrqGQmeBSSAduMxYS8lagCg5yoaZUxSMd7htjvNSxc36MBcEsJaefaE9ycq9uhOJrozJ4RHxXavEM/XRTaEAzrNtT2hsKRn8iHJWDD8pDmx4wdggyFGznNbgI4ErZp9p7FdkuwAxF6VaZni3bg/BtyhvR5+eHtPdsvLqzsurronl0I0z0rJeepyDAozhRBZPg/4ltpGGH1UWh5vTFRfAgDtc2knNmvD0gemiwWPXzsZOdj8WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9518
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e5080313-447c-43de-6d52-08de9f929803
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700016|376014|1800799024|56012099003|18096099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	E0aEM8qK5MiB/oLYqpLyKDQkI59ED92Ym2r5vSjZky8lIHBQEk5Sh7kwGp6dJbxTEAKpoOKzA7OjZ+r6avSJ3nPmEc0ggCDFrMbzjlPSE9CI1/7UFfR8AbjZ50kRW926ALqmXKEt3ZN4JaCYutaV1/W4JsRBbVhty+KSfK9MVDHD+Sb1dSvxUHkeoxfdNGWMCXC0vZTLhwyUT6eHOEYiiYaCoJyeTF8rgXIL8s5sclleUozBENZvCy4sY09aKz9yLIm7wJeNc7iY8sOBXLx47wUuVVOWYk29JW7DjwOPclYOR9hBS2ccgnewlx0k6wosh6EWKk139UANOsCrP4ZVpf2u7gTmctus+4nALZ3RVggIUyMb+4Q+WV/rxuSpYMlX4SM+/GNz7v4s1ZGIe6W1uPxph1U6S3YQLGKWPnYF3yBhyotTPorbqQ0pxmnNHRBabJPgBsWDvKCWCt1fpGVmBOVUlq9LDM07FbQsGlrbVAamAEeWDOm8PtDz3YtwTrmzrrH7TG87xdJfmQTEY/8ntZvLkE5SSha0Ta+DNI83ABMElmMeNWiT+yCwNJRwFLfuxfCqB4h4P0G5kq9+RF5lhC7pyhNjqJboAA3ScwBOPnNEJfpNff/tBD5ZhMqxN/qPv4TkV6bKUkaa8bw3aqpcpwwT8deN9upRLCAwsVa6+D6G/Oz1sZms67gDqjkgzFY+jA+xlHFSHRm+8F70J+Me8V2NJzllCM45fBWaM6NxnF7ZEzodjXC8LSvhBtz1EPuEgBhVBkmb+bqH+/gV7o7rFQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700016)(376014)(1800799024)(56012099003)(18096099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AgmxUL48XHFvO7VstECenLlXGsJigcTHK1+jIsJRcbYHM+cP1j569rENGOEAd0/3HdhamIEGsJiuKAtHSbu0N3gdsnCRFvlMswm6gs66DEjy0zeHp5fvTLXvt9l/ezBz61l9vxtji5sh4TJS13iBOYrkPBSiCj0cYfst9e86ItLLvC15novMr2IOlwmVuAWcUNEZNUX5PckpqrQ9VpJWsNH8crbe0QHSrh8jIJQj7w9J1gFCK2kNyzxs6k6JN/5RGkWGPXC0CiKCyHnFvT5CrV8WeX8fYZuKXY8CcqTFqlAA2ZBLTQwhcNe8nYtkLsO+UCMAxU6BFGiXefVF5/70+TKzjzERhkpexG/XvDT+rMNDIG8alNZ7FdsXCRqxm3Y/Ef5ZTiB5SkmkUn4paxk7eKuHGdXOkkcSqw9eqrz5jDW4OXI0kEVBsw+GDPiSpksg
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:42:54.1516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f532c18b-b895-4752-fd02-08de9f92be73
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10587
X-purgate-ID: tlsNG-c1860d/1776768184-C0F62DB1-733A94C7/0/0
X-purgate-type: clean
X-purgate-size: 6134
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Michal.Orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,arm.com:dkim,arm.com:mid]
X-Rspamd-Queue-Id: B2691439AA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTWljaGFsLA0KDQo+IE9uIDIxIEFwciAyMDI2LCBhdCAxMTozMywgT3J6ZWwsIE1pY2hhbCA8
TWljaGFsLk9yemVsQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAyMC8wNC8yMDI2
IDE2OjA2LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gSEkgTWljaGFsLA0KPj4gDQo+Pj4+PiAr
dm9pZCBfX2luaXQgaW5pdF9mcmFtZXRhYmxlKHBhZGRyX3QgcmFtX3N0YXJ0KQ0KPj4+Pj4gK3sN
Cj4+Pj4+ICsgICAgdW5zaWduZWQgaW50IHNpZHgsIG5pZHgsIG1heF9pZHg7DQo+Pj4+PiANCj4+
Pj4+ICAgLyoNCj4+Pj4+ICAgICogVGhlIHNpemUgb2YgcGFkZHJfdCBzaG91bGQgYmUgc3VmZmlj
aWVudCBmb3IgdGhlIGNvbXBsZXRlIHJhbmdlIG9mDQo+Pj4+PiBAQCAtMjYsMjQgKzQ3LDM0IEBA
IHZvaWQgX19pbml0IHNldHVwX2ZyYW1ldGFibGVfbWFwcGluZ3MocGFkZHJfdCBwcywgcGFkZHJf
dCBwZSkNCj4+Pj4+ICAgQlVJTERfQlVHX09OKChzaXplb2YocGFkZHJfdCkgKiBCSVRTX1BFUl9C
WVRFKSA8IFBBRERSX0JJVFMpOw0KPj4+Pj4gICBCVUlMRF9CVUdfT04oc2l6ZW9mKHN0cnVjdCBw
YWdlX2luZm8pICE9IFBBR0VfSU5GT19TSVpFKTsNCj4+Pj4+IA0KPj4+Pj4gLSAgICBpZiAoIGZy
YW1ldGFibGVfc2l6ZSA+IEZSQU1FVEFCTEVfU0laRSApDQo+Pj4+PiAtICAgICAgICBwYW5pYygi
VGhlIGZyYW1ldGFibGUgY2Fubm90IGNvdmVyIHRoZSBwaHlzaWNhbCByZWdpb24gJSMiUFJJcGFk
ZHIiIC0gJSMiUFJJcGFkZHIiXG4iLA0KPj4+Pj4gLSAgICAgICAgICAgICAgcHMsIHBlKTsNCj4+
Pj4+ICsgICAgbWF4X2lkeCA9IERJVl9ST1VORF9VUChtYXhfcGR4LCBQRFhfR1JPVVBfQ09VTlQp
Ow0KPj4+Pj4gKyAgICBmcmFtZXRhYmxlX2Jhc2VfcGR4ID0gbWZuX3RvX3BkeChtYWRkcl90b19t
Zm4ocmFtX3N0YXJ0KSk7DQo+Pj4+PiANCj4+Pj4+IC0gICAgZnJhbWV0YWJsZV9iYXNlX3BkeCA9
IG1mbl90b19wZHgobWFkZHJfdG9fbWZuKHBzKSk7DQo+Pj4+PiAtICAgIC8qIFJvdW5kIHVwIHRv
IDJNIG9yIDMyTSBib3VuZGFyeSwgYXMgYXBwcm9wcmlhdGUuICovDQo+Pj4+PiAtICAgIGZyYW1l
dGFibGVfc2l6ZSA9IFJPVU5EVVAoZnJhbWV0YWJsZV9zaXplLCBtYXBwaW5nX3NpemUpOw0KPj4+
Pj4gLSAgICBiYXNlX21mbiA9IGFsbG9jX2Jvb3RfcGFnZXMoZnJhbWV0YWJsZV9zaXplID4+IFBB
R0VfU0hJRlQsIDMyPDwoMjAtMTIpKTsNCj4+Pj4+ICsgICAgLyoNCj4+Pj4+ICsgICAgICogcGR4
X3RvX3BhZ2UocGR4X3MpIGluIGluaXRfZnJhbWV0YWJsZV9jaHVuayBtdXN0IGJlIHBhZ2UtYWxp
Z25lZA0KPj4+Pj4gKyAgICAgKiBmb3IgbWFwX3BhZ2VzX3RvX3hlbigpLiBBbGlnbmluZyB0byBQ
RFhfR1JPVVBfQ09VTlQgZ3VhcmFudGVlcyB0aGlzDQo+Pj4+PiArICAgICAqIGJlY2F1c2UgUERY
X0dST1VQX0NPVU5UICogc2l6ZW9mKHBhZ2VfaW5mbykgaXMgYWx3YXlzIGEgbXVsdGlwbGUgb2YN
Cj4+Pj4+ICsgICAgICogUEFHRV9TSVpFIGJ5IGNvbnN0cnVjdGlvbi4NCj4+Pj4+ICsgICAgICov
DQo+Pj4+PiArICAgIGZyYW1ldGFibGVfYmFzZV9wZHggPSBST1VORERPV04oZnJhbWV0YWJsZV9i
YXNlX3BkeCwgUERYX0dST1VQX0NPVU5UKTsNCj4+Pj4gDQo+Pj4+IFdlIGFyZSBub3cgcm91bmRp
bmcgZG93biBmcmFtZXRhYmxlX2Jhc2VfcGR4IHdoaWNoIGJlZm9yZSB0aGlzIHBhdGNoIGl0IHdh
cyB0aGUgc3RhcnQgb2YgdGhlIHJhbSwNCj4+Pj4gYnV0IGluIHhlbi94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vbW0uaCwgbWZuX3ZhbGlkKG1mbikgaXMgdXNpbmcgZnJhbWV0YWJsZV9iYXNlX3Bk
eCB0byBjaGVjayBmb3INCj4+Pj4gbWZuIHZhbGlkaXR5LCB0aGlzIG1lYW5zIHRoYXQgd2UgY291
bGQgcGFzcyBhbiBtZm4gYmVmb3JlIHRoZSBzdGFydCBvZiB0aGUgcmFtIGFuZCBpZiBfX21mbl92
YWxpZCBpcyBoYXBweSwNCj4+Pj4gd2UgYXJlIGdldHRpbmcgYSByZWdyZXNzaW9uLg0KPj4+PiAN
Cj4+Pj4gQ2FuIHRoaXMgaGFwcGVuIG9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQo+Pj4gbWZu
X3ZhbGlkKCkgY2FuIGluZGVlZCByZXR1cm4gdHJ1ZSBmb3IgYW4gTUZOIGJlbG93IHJhbV9zdGFy
dCB0aGF0IGZhbGxzDQo+Pj4gaW4gdGhlIHNhbWUgUERYIGdyb3VwLCBidXQgdGhpcyBpcyBzYWZl
LiBpbml0X2ZyYW1ldGFibGVfY2h1bmsoKSBtYXBzDQo+Pj4gYW5kIHplcm9lcyB0aGUgZnJhbWV0
YWJsZSBmb3IgdGhhdCByYW5nZSwgc28gbWZuX3RvX3BhZ2UoKSB3b24ndCBmYXVsdC4NCj4+PiBU
aGUgemVyb2VkIHBhZ2VfaW5mbyBoYXMgY291bnRfaW5mbyA9PSAwIGFuZCBubyBvd25lciwgc28g
YW55IGdldF9wYWdlKCkNCj4+PiBjYWxsIG9uIGl0IHdpbGwgZmFpbCDigJQgdGhlIHBhZ2UgaXMg
ZWZmZWN0aXZlbHkgaW5lcnQuDQo+PiANCj4+IFllcywgSeKAmXZlIGNoZWNrZWQgYW5kIG1hbnkg
cGF0aCByZWx5aW5nIG9uIG1mbl92YWxpZCgpIGdvIGFsc28gdGhyb3VnaCBtZm5fdG9fcGFnZSgp
DQo+PiBhbmQvb3IgZ2V0X3BhZ2UoKSwgdGhlcmUgaXMgb25seSBvbmUgaW4gcHJvY2Vzc19zaG0o
KSB0aGF0IHBvdGVudGlhbGx5IGNvdWxkIGFkZCBhIHNoYXJlZCBtZW1vcnkgcGFnZQ0KPj4gZ2l2
ZW4gdGhhdCB3ZSBhcmUgcmVsYXhpbmcgbWZuX3ZhbGlkIG5vdy4NCj4gV2UgYXJlIG5vdCByZWxh
eGluZyBtZm5fdmFsaWQgbm93LiBJdCBoYXMgbmV2ZXIgbWVhbnQgdG8gbWVhbiBSQU0uIEl0IG1l
YW5zIHRoZQ0KPiBNRk4gaGFzIGEgY29ycmVzcG9uZGluZyBmcmFtZSB0YWJsZSBlbnRyeSB3aXRo
IHN0cnVjdCBwYWdlX2luZm8uIFRoaXMgaXMgd2hhdA0KPiBpdCdzIGNvbW1lbnQgc2F5cy4NCg0K
VGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbiwgSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24g
dGhhdCBvbiBBcm0gaXQgc2lnbmlmaWVkIG1mbiBwb2ludHMgdG8gYSByZWFsIGhvc3QgcmFtDQpw
b3J0aW9uLCB0aGUgY29tbWVudCBhYm92ZSBBcm0gaW1wbGVtZW50YXRpb24gZG9lc27igJl0IGhl
bHAgZWl0aGVyIDopDQoNCj4gDQo+IFN0YXRpYyBzaG1lbSBpcyBzYWZlIGZvciBnaG9zdCBNRk4u
IEluIHByZXBhcmVfc3RhdGljbWVtX3BhZ2VzKCkgd2UgaGF2ZSBhIGNoZWNrDQo+IGZvciBjb3Vu
dF9pbmZvIHRoYXQgZm9yIGdob3N0IE1GTiBpcyAwLg0KPiANCj4+IA0KPj4gSeKAmW0gdHJ5aW5n
IGFsc28gdG8gZm9sbG93IGlzX2lvbWVtX3BhZ2UoKSwgdG8gY2hlY2sgaWYgc3Vic2VxdWVudCBt
Zm5fdG9fcGFnZSgpIGZhaWwgc2FmZWx5LCBidXQgSSB0aGluayB0aGF0IGRlcGVuZGluZw0KPj4g
b24gdGhhdCAobWZuX3ZhbGlkKSB0aGUgcGFnZSB3aWxsIGJlIG9ubHkgdHJlYXRlZCBkaWZmZXJl
bnRseSwgbm90IHN1cmUgaWYgaXTigJlzIGEgbGF0ZW50IGJ1ZyB0byBsZWF2ZSBtZm5fdmFsaWQo
KSBhcyBpdCBpcy5cDQo+IE9uIEFybSwgaXNfaW9tZW1fcGFnZSgpIGlzIGp1c3QgIW1mbl92YWxp
ZCgpLCBzbyB5ZXMsIGdob3N0IE1GTnMNCj4gd291bGQgYmUgY2xhc3NpZmllZCBhcyBub3QgSU9N
RU0uIEJ1dCB0aGlzIGlzIGhhcm1sZXNzIGJlY2F1c2UgaXNfaW9tZW1fcGFnZSgpDQo+IG9uIEFS
TSBpcyBvbmx5IGNhbGxlZCBmcm9tIGdyYW50IHRhYmxlIHBhdGhzIHRoYXQgb3BlcmF0ZSBvbiBw
YWdlcyBvYnJ0YWluZWQgYnkNCj4gZ2V0X3BhZ2UoKSwgc28gbm8gQXJtIGNvZGUgY2FuIHJlYWNo
IGlzX2lvbWVtX3BhZ2Ugd2l0aCBhIGdob3N0IE1GTi4NCj4gDQo+PiANCj4+IFdvdWxkIGl0IGJl
IHZhbGlkIHRvIGhhdmUgc29tZXRoaW5nIGxpa2UgbWZuX3RvX3BhZ2UoKSAhPSAwIHRvIGJlIHBh
cnQgb2YgbWZuX3ZhbGlkKCkgdG8gZW5zdXJlIGl04oCZcyBhIHJlYWwgaG9zdCByYW0gcGFnZT8N
Cj4+IEnigJltIHRydWx5IGFza2luZyBoZXJlIGJlY2F1c2UgSSBkaWRu4oCZdCBjaGVjayBpZiBp
dOKAmXMgZG9hYmxlLg0KPiBBcyBhbHJlYWR5IHNhaWQsIG1mbl92YWxpZCB3YXMgbmV2ZXIgc3Vw
cG9zZWQgdG8gbWVhbiBSQU0gcGFnZS4gSXQgaXMganVzdCB0aGF0DQo+IG9uIEFSTSB0aGUgdHdv
IGhhcHBlbmVkIHRvIGNvaW5jaWRlIHVudGlsIHRoaXMgcGF0Y2guDQo+IA0KPj4gDQo+PiBPdGhl
cndpc2Ugd2UgY291bGQgc3BsaXQgdGhlIHJvdW5kIGRvd24gYW5kIHRoZSBmcmFtZXRhYmxlX2Jh
c2VfcGR4IGluIHRoaXMgd2F5IG1heWJlPw0KPiBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdGhpcyBl
eHRyYSBjb21wbGV4aXR5IGZvciBzb21ldGhpbmcgdGhhdCBpcyBzYWZlIGFuZCBoYXMNCj4gYWx3
YXlzIGJlZW4gaW4gdXNlLiBXZSd2ZSBuZXZlciBoYWQgbWZuX3ZhbGlkID09IFJBTSBndWFyYW50
ZWUuDQoNClRoYW5rcyBmb3IgY2hlY2tpbmcgbXkgcG9pbnRzLCBJIHRoaW5rIGl04oCZcyBhbGwg
Y2xlYXIgdG8gbWUgbm93Lg0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5j
ZWxsdUBhcm0uY29tPg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

