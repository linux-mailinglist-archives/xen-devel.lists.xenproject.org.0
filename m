Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMIvKvLh2GnHjAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 13:41:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 018A93D64B5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 13:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278817.1563546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAEc-0001G8-Bm; Fri, 10 Apr 2026 11:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278817.1563546; Fri, 10 Apr 2026 11:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAEc-0001DY-8c; Fri, 10 Apr 2026 11:41:14 +0000
Received: by outflank-mailman (input) for mailman id 1278817;
 Fri, 10 Apr 2026 11:41:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wBAEa-0001DQ-Gr
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:41:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBAEZ-00C0zW-9K
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 13:41:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d8e1c8-e002-0a2a0a5209dd-0a2a45098d1c-34
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:41:10 +0200
Received: from [52.101.83.15]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d8e1d5-bf79-0a2a45090019-3465530f4cba-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:41:09 +0200
Received: from DUZP191CA0050.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::23)
 by DB5PR08MB10021.eurprd08.prod.outlook.com (2603:10a6:10:48e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 11:41:05 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::73) by DUZP191CA0050.outlook.office365.com
 (2603:10a6:10:4fa::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 11:41:05 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17 via
 Frontend Transport; Fri, 10 Apr 2026 11:41:04 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV2PR08MB12004.eurprd08.prod.outlook.com (2603:10a6:150:36a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 11:40:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 11:39:59 +0000
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
 b=S9iVs5JHk1QMH8HQCvKSgiIlUUbhqYie5a8CMn14lD/o4z7AAjIxoHW8JWRKo3DGDZcKmNTJAS26csxEolWKp1bKsEft9andDL8K5e1pNs8ETuQnUo1OutJsr68kQrV2hZuOYdOIoJuhK811ahwFzPFvyna5X5MegVqr9ZQxOexdTtECExJwZJLx7Z6CRxFwf7MtAp/STVMKRC7yxdkOGmkouZ7tA1fQIaNzdBykFEVMBVlw7lpi5jDzdQwusSF/UYjd2/Li/x9cfRf9kA4Upf0rwosNVHBZLlo2mtXiKpAKc6CtHi+/lJHT6YGI0SaEctlSIisHF6JJAjuFJVraxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvDci1SFyqTJnbPBsFJG77mJZgtIVWxdMI5gGsnZR8w=;
 b=vVxlR7V010Cx9+PLJInheHPlCgUEkeKUPQE6xQYW6WwhjZNyVGdaDdiZbh4621huferzSPF7FhPkVTK0aYxPIyC+Ortc2WAbWwnvfqRtbtMT5rA3y7+MU251CFk5f7hTFzDMtyi+a0lZ4k8x/h+WAaT1GptORezHSeHQn7bpXTFbOBch5ion93AZ+6hmwdHXpp012GkXpxUrr2BPjhY6YLBh0u9ErU42qizbv5cp7YehLdOqohucrSLSrwgZFQZtdkaDCueRrqLtxzaUACnr2ebpNPTMOQpSZ9mWG9gDY4ST0S5buCeBGbDuQ/eMvOEYpmtFfIExySOrEBxCHupmJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvDci1SFyqTJnbPBsFJG77mJZgtIVWxdMI5gGsnZR8w=;
 b=mYn1mDxBdBokXjK9Rl1ca9z9JVitZZpzq671pf9pZJDC6W6Ty5AXPacbl927MtwS72NFvC3CXf453QzDkZ0V15aoAVF/vDd75itHICYvYwhYeJniCcz9VnOeupf1ljl8zggm/fdG7T4Gue+od7qt+dq89/0RYSHZoYLqaw+e1lQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2pmJP50/RFKS3CiD41VaT9xg1y72x1srwlMfQmhmXYG9dQnqCggvx0pFG36UIoxybuFaFYL878qSrupjJDvp4Po5XZB8wjx9WlQ9/yr/deSdj2GaOiBkzNbYWFSOCtl1S1yhvSbuMWCoXfEtiNW4XefUHwcvXa9ETBr/EGwckhy2OOQmhKk2FSq7IyR414TxbJp3Ccit8s7DHJ5ZwukMRJ9Wbq/8K/xjTgc3llhzavf5WE83X3aIJhy9/IOUJAtFhUBafeE4cHR1m3MRMx83//fTiw0MIs/B4ISTxYKBaIXr/EwXlidTX/1z3/dQ/oG6g2Vj9SnVTLHrnRtCWQOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvDci1SFyqTJnbPBsFJG77mJZgtIVWxdMI5gGsnZR8w=;
 b=XnrkBfHXRo1z0KQ0p5j7VZY2Sbwf+4Adg6A8JBfANsQ47UuulQ53zWE/T1peMh7mQfiuoQrZVnSrm1TIEceha1+17d9jFCXpvCGMGd++vGq9qSQRwdaP1w/TV8Qw1GkqfhJozz1iE4rwdVKt5i5j+pTY2tah64ry43e6UGljwJ9pF3Qe8Wvn3/EZL3E4mcsyz7pA2TsL4UrC3q+gup/S9Odae1j6eOlXnF4Pix4Elljy5g2dT5INXJhCHLxFfkxjedXit7owhKem2PVM2fonHayxvtRrbSwWvrAqpx2plafD+an79UfUdWZHfa/cV4SO/NshlLmSWJz1ILwpK6bKsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvDci1SFyqTJnbPBsFJG77mJZgtIVWxdMI5gGsnZR8w=;
 b=mYn1mDxBdBokXjK9Rl1ca9z9JVitZZpzq671pf9pZJDC6W6Ty5AXPacbl927MtwS72NFvC3CXf453QzDkZ0V15aoAVF/vDd75itHICYvYwhYeJniCcz9VnOeupf1ljl8zggm/fdG7T4Gue+od7qt+dq89/0RYSHZoYLqaw+e1lQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Topic: [PATCH v3 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Index: AQHcyN6wtGZ7ugIU+0mvCG28OqL5ew==
Date: Fri, 10 Apr 2026 11:39:59 +0000
Message-ID: <A7C7C3F0-7359-4851-9325-B65C289C02CF@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <c12f84b9306a2b74a555c710f21f5362120205ed.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <c12f84b9306a2b74a555c710f21f5362120205ed.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV2PR08MB12004:EE_|DU6PEPF0000A7E2:EE_|DB5PR08MB10021:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf9f2dd-b1cb-4e5c-28c9-08de96f60c93
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 DynO7dB0XRXFiVbI62j/Aix/o+zFdSybR7srEa3iiVDovuub4LwU5rWZi/M7LbPE+5Wl8xlKYZmWWfVU/PhDNDl17HK5eOZMdX5koKvNvSDlBpEO/49vUA85c/tjuoG07qNWZCvh16HMVgfphkygsH0VakxLCNWrMXmhrWrJj7IJbXmFkW5Pz8zUTj3wdXB55qypJmm75jGUt5iml6nSGnlqGNU8jY8Veq33nm75fYyslV3mLRJ36YAN8RNa7Zcs5+b70DJu0KT5OVnP3YfYm+CvYh0g72MST1K6EJVR4uUQONS3Qre7BKIDS1MthXW5GIj76melIjSChBDlV9njiEKNN1MJyIp5N9LH+z1yx3YnmWGxZba9IcHe3XLDEzFReRCoYVAUCfHoyn9wV6qGm4pgOTSklCUSfAy12KaeorZrmWQPtBHRH+XZnlJo1ICkuEJqhM+QAtlrMWM8hYrLW/9ACSyiLTJkLO5F0rpo2xfS+KPulVDo2AhG9oUwzFtOC+XZVUQQorUQpEU1bAPB0KP5keMmV1Hng0nrd9gIYnQRKd5RSVqec2NcCtm9QcEctKyGdJy9V+zy3k/9TBZZYpZqYCekeFoksDcyqBG/yUkWZXq+fZSL7ENVWPiWUcT5s85MsN6rF1Q0fEKXx3qyKAjYXprpa2u6GqV2v8eDfASQP2+2jVyp5S1X4XwHDgsyD9YHIgtzfl4k1JmhgjVTgy01XmDMU/Z3yFzPWk5+R7UhAH9W9vM1E19xqgXPMBYskKZASghaRt0xJbUxXM9Qs2DFtkGqt/khkn0Rh2CIdcM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1754222CD473494B9310B47E0FD27B8F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 qj70GdPPxd6W3jzUD2WhDX1yYy/UWDP84qtYCNdKUbiqlagnQm8SgCascIt0JB1mmjMa/QekQj5QHAgYzrxtRgpDurWjYLtfd341q0g5Pa/Cw4T57JLhIbsfx61Z0g7FrKKyYsKDFKFaBBxuaOgMGIjn/9f3u3IhKV2+s/UN8Y1sX3e4Ivg5V8X5LCo6sk9J12t8dM/mJ2o8ZocoQJKC7XCc88LJALsXmA8+cB4BxF91AzLtvzEN4Be5WXxh459TH62mcOWuJ5cybyjcvUh7WiHBMG+Vupwwjx7XT6CJsjwJPKfDyRT27kJLW3wB8DG56qCXdHSwuv31BJodcoNEYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB12004
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8140ab41-11e8-4847-ce8c-08de96f5e5b6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|1800799024|7416014|376014|35042699022|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oH/ON0UIXTEioCBjWJ1uZvJV82XJQ+jnxN5sXaM29aeXh2KmdyVVjsnQvb7rdkdpCIJt59NILuMEv3wORW+GDXk7B4MzIug6K9Emjj89D1tUgiIH8a8LKTFTkypP9ysrsdsV1EZ62M30V/t7Ixq+sZDpMUzfPMpieLG2g8lr8bDfkhg5rCw3vcyQ73rzYEWA5HaxQVY9rFRIuMoztXUTNxJwotf3mrWZ4jdSveBKUwGSVOBKAVAMbuBDl+xh05NELxb8enMbMMQ/KBzhfRn5sLaJSlKGa9rwemZnyYs5sugVeuUsGOmtQ4PxWexBLw6Qq3sdp0hEUfIz80aP6b8oJUG+0id8FrC6hmFg+Xw6yf20EB1piGETfUSv6xCvlKKdlRoGCG8aNZ4usb7R/CyX06hJFkpQjP+KXmf+CzbTQUHbJoLTWBsGgN8P8+B++RihpGC7wiAGv5b4Sg/OfZm6+gqIIbOsmf2oXokojqLzsaD5J9yoZTjJtdETw681D+kwloRQna+pIFT9hhkv7FKILnM+xMUVfcF+FSZzyPTpqHRe5811FBXSPKhur/0xdcgvnBJg74xGYbw9z+kgG8UmAHLd6JRHxIyiJkrV4SXkjCxqhb13mXge0ES3VDKZYIrnu8D6LexT44FEoWQSN3nEX1bWCzoMbo+zh3KFXjQneLfJz1Q3WZmNY/pmpSbkxTlSHSS50tV1/wRxZ8zdxS6ORxAJy0Zx7MEDqWSMkYWv0cmV037XPdKvZTr0XC+/Vx5sD+aonDG0Lrw+p4xWztWWqA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(1800799024)(7416014)(376014)(35042699022)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RlQzA257+bL9+PLonzBS4JbkO3vHCLfWc6OnVqt5ZnR24A7Z0wrkLXgszZK58bDYhl2aEomwXPOW9i1WLtxoCMsdQwj8y45O7MYjiGK17gHfSV7G7z+8SBBjmwSGVZHSAtCeQvME5eoqUwQPIlKng0AoUHi0zfuISa4vDYuNydYEkeb9jm6aupqTxiXYbH0iXM7RW0NA1LCPB22fuZYlQRbMq8OHGi+m0eL8MUAPH5kfz+a+SqrWaxLek/DjqlAckswJxBiJwJCjjvb+y2Z/t2UljBEuwJlf2yFNF28fQyhx2nil9K54Gse7+ciRM1SDOaB3UiLEHIJhKTP0DBjTqXCX6Q6KGdber7FhvrMTrMGUaglQvoMBbqFLyn5gLF9/nN4i4GNVp0+8mSMa+cylgFXAUi6CwUjbctoqgdcE+DWUxOtDzZa23wA3+z0fYZC3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 11:41:04.9333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf9f2dd-b1cb-4e5c-28c9-08de96f60c93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10021
X-purgate-ID: tlsNG-bad1c0/1775821269-5714D152-348E0FB9/0/0
X-purgate-type: clean
X-purgate-size: 620
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid]
X-Rspamd-Queue-Id: 018A93D64B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SEkgTWlsYW4sDQoNCmFwb2xvZ2llcyBJIG1pc3NlZCBvbmUgYml0IGluIHRoaXMgcGF0Y2gNCg0K
PiANCj4gQEAgLTcyMSw2ICs3NDUsOSBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBk
b21haW4gKmQsDQo+ICAgICBpZiAoIChyYyA9IHNjaV9kb21haW5faW5pdChkLCBjb25maWcpKSAh
PSAwICkNCj4gICAgICAgICBnb3RvIGZhaWw7DQo+IA0KPiArICAgIGlmICggKHJjID0gZG9tYWlu
X3Zpb21tdV9pbml0KGQsIGNvbmZpZy0+YXJjaC52aW9tbXVfdHlwZSkpICE9IDAgKQ0KPiArICAg
ICAgICBnb3RvIGZhaWw7DQo+ICsNCg0KSGVyZSBpZiB0aGlzIGZhaWxzLCB3ZSBjYWxsIGFyY2hf
ZG9tYWluX2Rlc3Ryb3koKSwgaG93ZXZlciBpbiB0aGF0IGZ1bmN0aW9uIHdlIGRvbuKAmXQgY2Fs
bA0KdmlvbW11X3JlbGlucXVpc2hfcmVzb3VyY2VzKCkNCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

