Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCCwMFuq32mOXgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 17:10:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F9D405B58
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 17:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282622.1565183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1sV-0004to-CZ; Wed, 15 Apr 2026 15:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282622.1565183; Wed, 15 Apr 2026 15:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1sV-0004ql-8v; Wed, 15 Apr 2026 15:10:07 +0000
Received: by outflank-mailman (input) for mailman id 1282622;
 Wed, 15 Apr 2026 15:10:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wD1sS-0004Yp-Vm
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:10:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD1sS-00FPEx-92
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 17:10:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfaa47-2eae-0a2a0a5409dd-0a2a45069136-26
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 17:10:04 +0200
Received: from [52.101.65.23]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfaa4b-0df0-0a2a45060019-34654117f7a5-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 17:10:04 +0200
Received: from DU2P250CA0014.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::19)
 by PAXPR08MB6464.eurprd08.prod.outlook.com (2603:10a6:102:df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:10:01 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::9b) by DU2P250CA0014.outlook.office365.com
 (2603:10a6:10:231::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.50 via Frontend Transport; Wed,
 15 Apr 2026 15:10:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Wed, 15 Apr 2026 15:10:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS2PR08MB9128.eurprd08.prod.outlook.com (2603:10a6:20b:5fc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:08:54 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 15:08:54 +0000
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
 b=XfPo7YUEHfBGIC9dEl4elXkpxR3qKUlpPIalCxiLeUX6aV0XxKfTahrubjBtJByYN55CzXcflTlym1nV/vqwwtkYVcXJzaAjfzfz+4QfQSTU1jUX5MueBHKcyJaaa4ktN1yhhZvWMXUoMsNiKd6iBwagnxTugaT76jpP+2To2lw0iuSjNx2maYAdhTN9o4PYHqzUN4af6tk7pqUiFz3OagKAU7omrRtzjSG6ONlxNm2qMagiTnhRrN8RaWaD5M8YAtYN8LaHE2FTWrW/prMQufXh24jMP5HHKnu0lTI/5lrrA6FTwCPsKpvedqAQwDDoybyDL3SVh/LLke2Ygkjk5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwNicM0MXbmAJx8wdyghKv0O4TJH9+yp1tSqxhZRdeA=;
 b=O9JEl8DHVBkEK9fFTF4q5OoTwcZoBnm7R7uX5T9kia4PIWcb3UTsKEkne4d1/bNq+6uC/MXdDeiZ64RueGVhXmGqMytqiPX2WgbE1DEFne829G86fGAGQdqTyl3p1EWepYplZ1YzQAOydeQ/UVlHP29czLrhEeR46yCyLwVRRtMR0OgzDJFFBck87tym2rcOh54x5jesef2/yZI1QW7R00iESO298kdk+/1VfQKYnCKIvpjHqUdfPpNS2Ck/ZhzpZdv8i9L2EV816WKf3xAZRdSpWcWekXlGqzppqWXV40TIMAIFWzn4VvQGFAwU+IU4idmzHP1cRlje8p95H8ORKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwNicM0MXbmAJx8wdyghKv0O4TJH9+yp1tSqxhZRdeA=;
 b=Cdqwd9vgIsfGOr5bi1FjOr6gtjJPQASZmSybxHjEr8JGp3km3R7GNsi2Apq9Fc42SO2XlEaj6z5nCgLY1QoLo/se1z23bv+QzTm4uLsHO5Wh+q31wULO8YCSfokeAFleG+0J2juYRVNRzTd4Z5U0QMiDqYVpk9doC+CaBJqNBcI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLsLKJCS0jvR+VeK7PagtVt9Fvlv0zPUJtOxRtO7hvuUn1QETrJtLiOkecIP0oaaawwvKzeUCxTn5hXYuSkg0B9cvO7OcrsQDrkkE7+AxKH7zVu4iyMbBlj1O0K2jm8iA/NrFXDIxigEdvDAQ+9UaCPPQYg4Zt0L7d9Run5y1B6sESHel3G28fQBDqX0Xxec1POwV6rWzWmjMfooeFX79h4DuZk7liq++oBrYVAPKd7P4r3p4oE+o36uZfTi0B8bvvcenxPhWc7ivUL/m0Lv6EanJVgAUC1LBF5VYyfQOqPigaRXFbjr7dkafnpBaK3BqfhkC9hKMYcZQjkDwLnRyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwNicM0MXbmAJx8wdyghKv0O4TJH9+yp1tSqxhZRdeA=;
 b=f+RnK+JNZFuVgU8qEKkkPY5ECgyP8F79M7kwDTN74iRSoAvZZHDt2BWPgNuBhM3crZJQL3ECHOfGOVuErt3fEtwEPfGzG3hBYfQOd9WXb1YAqh/quC9G2u3h+D++x15jK2rZ/VSpvSJDQWy4zBUOQaCjFHlr2qoGZDbSOSu3J6Q/27e+73dAD7Nhc8VQsWLPNWCAi9bpi6V+wQFuMk+I7yw17iIJQ84IVqNOIOm3oO5c9NtBDNY33eX0gPdPZOlbO5mIfCUlSSOwX/J8oAfhTnj/Ck+agEBzWD1WKosuQq4jh1/n+ZPWhhgWb3TSREsTT5OIALbSoA1Vpyci5sAAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwNicM0MXbmAJx8wdyghKv0O4TJH9+yp1tSqxhZRdeA=;
 b=Cdqwd9vgIsfGOr5bi1FjOr6gtjJPQASZmSybxHjEr8JGp3km3R7GNsi2Apq9Fc42SO2XlEaj6z5nCgLY1QoLo/se1z23bv+QzTm4uLsHO5Wh+q31wULO8YCSfokeAFleG+0J2juYRVNRzTd4Z5U0QMiDqYVpk9doC+CaBJqNBcI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 4/6] xen/dt-overlay: fix silent success in
 dt_overlay_remove_node
Thread-Topic: [PATCH 4/6] xen/dt-overlay: fix silent success in
 dt_overlay_remove_node
Thread-Index: AQHczMxII8OnvwK6REKHyMHK6ZFZCLXgOc+A
Date: Wed, 15 Apr 2026 15:08:54 +0000
Message-ID: <30CCBA3C-D43C-4516-9DB7-9333428AE277@arm.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
 <20260415113700.107915-5-michal.orzel@amd.com>
In-Reply-To: <20260415113700.107915-5-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS2PR08MB9128:EE_|DU2PEPF00028D0A:EE_|PAXPR08MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d58bb97-4278-4dfe-c3f9-08de9b01105a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 1r487uqhQM8jMKXeWoZkgixqfUG9Qa0EHEDxkgd7DmQIi6Z5WO1GzilXocsOLZfzgfX47LuEmd9+QppW8qHIHU6izkKaenNpGCwE4Ewg/zTjrxvkpY32XPoxNhq1/NLXjzDCDMcHdDCnU3VgPBYz8kyl2HLR6OikE2oyJZdEHxmKCj+HoQTA96wQ5L/06ICpfb2544yXmX/4TsmfsPhq5nWgL7czBVhQaZXdhf2kPyZ37lJONEcxnh+XmVzCVOHiNYFLiXBvncna3i7W00wZJltlunuFu3vQncAxcLfVaPUbbiKWiQKDmjgGX6shwA6sHUlmHUST7O/PWssHYS3TCqNBuhjZYrhrMR1VL7eedXsYBTMV8kGiEvFyt9+BaKYgC/lOD+zatcdmKp8rs3fVNiR9uZ1wg+uaR8WuKL60OeWBVzmHAAUdruO+7ADLJpUmJ6Bx0g4ra0bBJ7MczoH9mlLRPR++sHyMJTxItkwjL8mdMe3RuGV8k46HN8kVnt9ooDQ5pm0IZnhfhYykfuYXKWp86YwouD7cyMSyTO2cgk9nn7pW60IBTgHYmK6V09VXCPhqunxnl37IV5xDl/x+yzps5dpUmQ2B76auGlp8JQcb7Idfcm8LOlK1BW67yhnisdYumO1p1ob4KkS3m2MSiRDcfUJ6EYrwUPna9pVsi4s8P41LyBY6eCxTrNoY2GlU63rDf/VE0f8QR5dCY3uR6gfRIrcDh74qoKhyT3XBtgPvfSG+PAnSOAMNmMOZV9hHrKNeVlxAlXm6042hHRtw8XuMg/qF3lLaAOIXOXuQ+PY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D65434E93B112341A609EB903F1DDA18@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 E7fZXlz5OE59tUac9mr3hzJ1YFPMBL3SmNHfsAGDmTt1PsvexM+WjQfYK/jiqLLaf98OTbnqReYFckUFpqjAs2sVLPPzWXAd43QJLoI/udY2fyWckeYtqhKY+C6yj1EbuGaP415OSs+1O7seNjwGeksO9cJpRL3V4c6/pXbgfPXw3k0mP7Xami2A7uUawXUjbo33f7WwfuFGWLtwPi56BeIQDc5aygef/2ltRJGNePWsBeCKQQLo0G+NdD4QG+VF+AhCK4oo1zF2G8oGudKMluIA9sAHVNEfcKfCvXP0hOrZg1P29N/GYCUVvYnZhsBaf+4wsgICHXzR1kelMHffLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9128
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	71796af7-cb75-4f43-ca24-08de9b00e8eb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700016|376014|82310400026|35042699022|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RKLTmLnuI8wYXBrCiIiR0PveP+RHb/Xi6pBrRENKftFySRDuOwK0kdQxSOOsGXUV56+UR/nzfaGNsHVh2TnYpDegLUdB8hZMm0OCNBZZSl2bi4VdVM5gQpzCIO2FKuA8UeQ5xiyLZ+0zqomGJf2D+VYN61ZOYektU4LbmNBqv/JJ9HY7yaGSbrr+GAEx5Obu67Cy03pVhKgYcfG4M05OiEDc+BN+yX/c9xckNkJ3t3tT1OzwayF/tHafJnA/IFYYD6YS9CI4kDboHwZvvIXxZidhrSOjb6GG8GbHLMg2giyhY9LYjSNofXdVqsNnXi711PGxuNZpCZ7f/XvZvTR2qjHkDdagRw6zSaYCaMmNo/hPKTQM2VQZq5SJ5B+TcyDpAILyHKxqFO5/ajZCWu0VbsW69wjfSw9hzDUWn2hAqvjSsE0YOOUknjxMzpvIHpFZihWA6YzG7/VReBerhWPUW5TuDAIW/hiZpxK4sh/a623wk82EbXVULk6Fe31Hw+MY31UzdUsdGAeGUPam2j7g0jLzoaQd4iTnlC6EmJ5sn1n+tglkab0BaIdL2hhL5vYTJ0d9Fv6aF8pSMFOD8WtHc2sYgF2O2Be4dWM6vZvkszoq04a2zakXZSm5sEhalBiovnKGen+v/Eiv9seL/DNv8DvQVGd7Kty9ti8sPMJzlFHCuNksq8n7rP8qRIa6oAWEOBQt5zr6OgXNyuDtQ8RaJFs0IrNjQ3BJlQ/l+bBZpA+iK0SQr7ZFhlFNoWyGbKFhmgUYD71n8gHeDsLXZxs37Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700016)(376014)(82310400026)(35042699022)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wE5hhejPz/YuWNqjdJhH1/auktcjaP6+6eaaPvOGswtbDEzpC01bJAdCuhZqhkG4YKHpbSOgectcL/53I2vIWOSuW1DdnLsii2R/BVMcXmMQxovagGRw2h9RC3ORSz42p5yr3w20HOLqZClBLyxe6qYe9D/B0zH9NmfWqesDwFvCkPaWImYQ+tqNDfLFtS0SB/P+CHtvgTyIMvt/BHL95N4fSMy/xjjMAzFMr+Ckj9GLaZuXe2mWuMDiBCgOrIzVkJsDSpBWomsGkWvuw48xOR15M45XbFilWw2h3UdqPm1CBekbZ40APscHoaLcZnzwpWnMP6gBWL3383l5sJBli7kXw9lMHVhDuQwILzExz+vmZTpYE/yiYUQSPQMOxkaMDoU8Gx3VZLFnu8pyIk+zlHwLsS+PMXs9pggOpRIjzjkkGAiIZ8PKK6ucHWRNhSQh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 15:10:00.3837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d58bb97-4278-4dfe-c3f9-08de9b01105a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6464
X-purgate-ID: tlsNG-16d1c6/1776265804-AFB3B3D8-6092D58F/0/0
X-purgate-type: clean
X-purgate-size: 760
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 33F9D405B58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

> On 15 Apr 2026, at 12:36, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> dt_overlay_remove_node() silently returns 0 when the target node is not
> found in the parent's sibling list.  The loop simply exits without
> matching and falls through to "return 0", making the caller believe the
> node was successfully removed.
>=20
> Return -ENODEV after the loop when no match is found, and change the
> found-path from break to an explicit return 0 so the two outcomes are
> distinct.
>=20
> Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functio=
nalities")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Looks ok to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca



