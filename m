Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHinFk2i2GnegAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 09:10:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E01A3D3323
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 09:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278403.1563260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5zy-0001T1-Ca; Fri, 10 Apr 2026 07:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278403.1563260; Fri, 10 Apr 2026 07:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5zy-0001QB-9Z; Fri, 10 Apr 2026 07:09:50 +0000
Received: by outflank-mailman (input) for mailman id 1278403;
 Fri, 10 Apr 2026 07:09:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wB5zw-0001Q0-A6
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 07:09:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB5zv-00DRTk-Ir
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 09:09:47 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d8a22b-e002-0a2a0a5209dd-0a2a45088e32-36
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 09:09:46 +0200
Received: from [40.107.130.36]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d8a23a-fab6-0a2a45080019-286b82242179-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 09:09:46 +0200
Received: from CWLP123CA0259.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1d5::7)
 by PR3PR08MB5705.eurprd08.prod.outlook.com (2603:10a6:102:93::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 07:09:41 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:400:1d5:cafe::bf) by CWLP123CA0259.outlook.office365.com
 (2603:10a6:400:1d5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Fri,
 10 Apr 2026 07:09:41 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Fri, 10 Apr 2026 07:09:41 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM8PR08MB6354.eurprd08.prod.outlook.com (2603:10a6:20b:367::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 07:08:38 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 07:08:38 +0000
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
 b=O3y2QPMeUoJ6oLZqpac2diVPKCo/uE20HukIzYh2zYjVBC0+5ZzHjK3aQZ942G1mOccUKhizk9ukU7tvlRD6jw7GofD8KzUHHzDeVXvWL9vl804QE+jOzljywg4KjakamJO576kN7DhJHS08TDrPHFzz+ysocsuQjzDvvkV+ySbRFThzN9BwT/35AfObLbkccyC/6gg43hCceebzGV5dcwUwKzCQ5aHExzJi8ldBK9+sogugy7Kvt6ATKyWn7ERnO+aBb3R7uNo5UDkcLHxWGSZ9Gxa7XXSTnLXWs5IjbjSYMVVTPV0NOztpEvq6by2Cg33svXRwr4AwLPSBrw3kBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VylMf0UBcQgkYOUdu4v1mkbxc4ELAyaRNARRuVmJ1b4=;
 b=Qtdk/MctZGz7MOP841bCuthAtlXH7uacwIuw23Oz9EsFoWxbI6o453dFtlK6MCtQeeN6RfHMmh2snvXb53O9GTZ8KbCe9mUzuN3z662oDeoPrHNDPZMTs+R/FcSDa7+tpa0Mtzli8m0ZCR2GB5fRy8aLFCk13i0uj/FyDbNgS+ZLzKTf+qBb4PWUGdWuUys6o+gU5SQbhtzq4Yn0koBLXqglDMFJsWtekdQqxN1d3CcoHdzzMjFMpNEeDMaPysRgiMW1JyXg2TGvd1x87XG35I3x7jtOgrB+C6JWum3Akj5y35PM59oi26frMGkPNYD3caog8Z/5e6fXkrm/kUUWrQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VylMf0UBcQgkYOUdu4v1mkbxc4ELAyaRNARRuVmJ1b4=;
 b=dkGRItGiuTMXcz5sHL6bxN2yu9l2hsN3NlcxCIzY4/1AHL5cm0KLgv2HcYBqephlCmpdhSMEfm5xIkSpfwY+KN+fhqFhXNlzRI18LkqVCJQ85VHMPy15/NddRkTMocdwIunbEOX1bgJsyGcGquqlLzf7d8yZOqR2yPDfE8X31U8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gh6ckWfjf6CvD3+lBzD7nBYlpTzq6EVQc8zTg1iq06y3yv7DWSTfh/FgFdyEoOeezpJ3e7Dk6AaM1RvdbZdkOQpMooZx2skOY9654AUp6ia1VkLpdiN1UwyjAraRDRFgvR8PCmeUhl4xupmH28teuemtAvsGZ9ZYTHIu4tKCsxxMlAbV1ES1ZhhAqfOa24okxFeb2iGIMKN2Mt/6utPzp6BdVlz2DfT8XYDu1tunrcZlGLSt46zHrC+OY9XPDLT6OiI0BV3ZzKyuhdwZJSa4Klt818tw1pDybG0TBjWUyEJDeVWGkst8xVjWzT9bds4xzFVjAsUlxCPxJCWpxg1rsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VylMf0UBcQgkYOUdu4v1mkbxc4ELAyaRNARRuVmJ1b4=;
 b=l15DC+xcUCKPcnnc/XLgRFwJkLCfD1TXvq5EyovCajplGoD7UBlgBsH1CzM6y4uPhkqYdVCy2T9i4ujvGy99UWHL52+m9b5Xf4hbUaKfteicW6p9IWJUVdMj2nxWKTyU3ftu8e+bPGirZ2t0/ZRe/+nfaNgSDu/c00Q5Wi97wC1tO0LN1pex2NdNkLpec1Hd+nfBZHydN03lVzmoHuqv9F+0Sh2v2tYV9imIr4E/EOFA3avptIrGv7ex6NI7zjLoTqthA+AjtdVpS+aRDDt53tTuB1C3i+rbDBh1aSibkzhTzhHilEBEQoKwQULNqjEkIngfpDODLv+D1AblBfywew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VylMf0UBcQgkYOUdu4v1mkbxc4ELAyaRNARRuVmJ1b4=;
 b=dkGRItGiuTMXcz5sHL6bxN2yu9l2hsN3NlcxCIzY4/1AHL5cm0KLgv2HcYBqephlCmpdhSMEfm5xIkSpfwY+KN+fhqFhXNlzRI18LkqVCJQ85VHMPy15/NddRkTMocdwIunbEOX1bgJsyGcGquqlLzf7d8yZOqR2yPDfE8X31U8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
Thread-Topic: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
Thread-Index:
 AQHcyBWdW2bjkWPifku6XWocvaXOWrXWpuWAgAAHZ4CAAADggIAAC5wAgAEjsICAAAHagIAAAQ8A
Date: Fri, 10 Apr 2026 07:08:38 +0000
Message-ID: <3C710768-2AD6-4808-9954-B5C1F414F9EC@arm.com>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-3-michal.orzel@amd.com>
 <EEF7C308-F25C-46BA-9663-BA789B49429C@arm.com>
 <db87a55a-5bd2-44ab-8814-1ffec91d1b40@suse.com>
 <9A42538E-AB13-488E-9AEF-39CD7E8D3131@arm.com>
 <6093D2A3-1823-4587-BB81-4593AD060D71@arm.com>
 <f9874489-5692-4735-8db4-d320142af9f7@suse.com>
 <3ec5c89b-6429-4bb5-a2b4-585e2feb1685@amd.com>
In-Reply-To: <3ec5c89b-6429-4bb5-a2b4-585e2feb1685@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM8PR08MB6354:EE_|AMS0EPF00000193:EE_|PR3PR08MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: b30434b4-ec8b-4d67-d7e6-08de96d022a2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 PyPYxdKp9S/PySD6rhYHrPx8aYdldu1Not+/YxRoofxd3ioPkMQ3QFHluoZeo87g+N454YLgkJYJCjMbos4frXNwqDkMGXeBi1ZUfrxhS6xzc7Ou/zxGzuZHtv4oYY3VLk9KPqy/3d0ToISt5cIDvDoBshMdyEEgwFAkuPdalqaDKeriJFSPvPs92QeYA71ehmVOMP8kh/nGlytyiyzwwy3vRpVIjpR4cpRyn+S7xB9hd2AaAYIczxAAFWlAf8jHFxOXdBO7+jBFeEB6s6LzTbFgHhn9uv6H52HMDzTGVFEWY1n+XwV9gydovBkHnHeD08Uy+vajekUFYxPmp19FAogFB5NI76o4wwb+A6oY15k6MRLkAUNWd/PisptnefZxEGPO3ziWBYE3CuDjMOtJqzZqTbYveRG2FenQkDuebNiIeMK5shFBfKyNX5Nrdiufl0QSU5GDQc4pUjD+PAFcpt0uKyszuzMl33ySHobc7QyfVgnlU91XhpqGQCWkufaYTxMc29+N2HE7RfGQZw4DYxE9yTPl7kP3V/g/DU5q/v+cS3nb9TEejvqFdiQoIO58EdIuLG/nrl2WjQIItMrx0+Vx8oVIVOT+xC3KXlx/CCuN83d8RlGjksivZgogauxqFTL9WG5/lZinl3JVJq/JG9ZKvHw5BUmVgQgoeOachMFosWnjnxZfUmdNpGbhn4GhDB55SX8CQ665MZYxeLKoR6WLapppEB8/80S/7wkatbNWgWPIRHqDgqEYSF2dzBvvdIrJu7UvnkeT6BSovRu77dMu/s5nbK4dj+UODq9paCE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5B198879471C144A589E2FDD997C229@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 T7ZNltKxjdYCyQKGt7qXCz1NzCRdaDdyj4f55raAZmqI5bT1pjQ0PxJ265u5Xw4BnGFXUSolPo9634ZO66kn5WbmIfaGZd8L9Q/qZUdwDRZsFU/D9vjv9dZiJLzjE/LjxpDsMikg74igFdLrJqx9mFFFzYr48GZOERGQK5YbVEMkmlSIoDMNrUw7U2f8FdS0E6UXrHY4oh/83sVLgto+zzvPkIKtzwPvBwzV4Yzk7Qf5lLDS9sPUAIIG+dTXqLyJ6kAIfsw1Qz05SbxayB4FFw0USK/R0aySPTUeGWkhe0LnqshL3ddaTqGlwdJc2i6C4KA+ai6kMczda6xjztuRoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6354
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db905534-b6cf-4490-bf0d-08de96cffd10
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|36860700016|82310400026|35042699022|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	dYgxRqr3k3Ipqdamxpv43vrMqxjmyYcILpcBnJcCVKsqbfmglcgDVD9UJU9/FSz0csl0h5bD6xjVLyq3HQ0LxDHOjhOJWQQ1ACJ3NIMA5wrNvbMQ7OI3EHjmaqTVbwdzf4/4WwnVqsUMy9vele6eQX/R7nBSKkMZ/l0Fc7d80LzgErVB+S0a2DtrV86FQLUj1eiMkituVDYvsm9YyDhUDoIKsI7qeBf0/U3Y5LNt6m7GWf8eO043DahqYIDpdowQ6P61u+konaPjaiuOv2zGEPLWIoxfdYGDl1pp+J6EibdQQOVs50hKU0mKnSRRykN42R0v4Q3qPL9aITfzSXwefMTickePyeQbP/WOx9KK9Fi/srca+57KG4IBmyugbNHOcsrKpmoWzNGDs6VR2nldSsKld7CXUIT9cckEfV2hkKbFetCeGNAFAfMAqWycqK3+kQqcnJE1z7ZIvzUUnTaZvXU65SfTyNp8Rb/ehzxnFRKe2qCVx/ETcVV4hdDTi5lt2CdmX2lH+XzxwWphEev9J1HD18HtSl4oHQyQTTaEzWJ5JEm8Vzp3wP/sRGml9k+A4YAL1rPiT7iJiGY9en4T+ogy6AjrTIR1SK8BJQ1Bs4t1RPprSnhO/MGejsOJGbv4Gx45joJdsxH7SJdCkeuiL1Kxlzs0iJx8PS9QDjcVRp07yAVhI5Sl+zkklT3blsgCytIlPszOhKvRp6Ab+Lc03LfonDwEpVDAHfCSy1hhCkptcbEUEJWY8+dPC3VswCL9+bPuFpMc/en1Aul9QMi9Lg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(36860700016)(82310400026)(35042699022)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I2R7pj38G8ogyscgcVhE6CXMQuGhtltUr6QSmU1+U491i4s6hXKT/Ph2tMssgwaZE/eayQtxlDd7AylykZNXxOLTL49A619sv9cu7eA/58uZkaPSRaoU0CEQxLCxNeZoMyusBvz5164GUC7iXuHLO253gsp5sJ9DVnmcyZyiku4jWa0Pirp+ul46TWFwpzRoW2WEJxoiqDLmkwWVuxxQSbLPe487S+TKNcc2yqbGpGuF7Hi5hFlXovXnGmnIY+i55z2nXJc4u2hJzQ2WykkQO/xbUOxYpY+Q0m2/igRJENr/OZ2X3nNlizF5sF8sSSAzltXX9i1PSh7ddGDCo1Kjt6JQNLVEU+K/A12UNY6EfIASFU6QmIA643hYF8nWLpQRu/CWjfF7iJe2FHrijigSl+rNvku9Xt7Sf5Xw0GM3EidOiEVfUtjslpeBJpJ34OFY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 07:09:41.0587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b30434b4-ec8b-4d67-d7e6-08de96d022a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5705
X-purgate-ID: tlsNG-c1860d/1775804986-77746497-ECC17274/0/0
X-purgate-type: clean
X-purgate-size: 4344
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Michal.Orzel@amd.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,amd.com:email,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 5E01A3D3323
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gT24gMTAgQXByIDIwMjYsIGF0IDA4OjA0LCBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6
ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDEwLzA0LzIwMjYgMDg6NTcsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDkuMDQuMjAyNiAxNTozNCwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+Pj4gT24gOSBBcHIgMjAyNiwgYXQgMTM6NTIsIEx1Y2EgRmFuY2VsbHUgPEx1Y2Eu
RmFuY2VsbHVAYXJtLmNvbT4gd3JvdGU6DQo+Pj4+PiBPbiA5IEFwciAyMDI2LCBhdCAxMzo0OCwg
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDA5LjA0LjIw
MjYgMTQ6MjIsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4+IE9uIDkgQXByIDIwMjYsIGF0
IDEyOjM5LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPiB3cm90ZToNCj4+Pj4+
Pj4gDQo+Pj4+Pj4+IFRoZSBjaGVjayB1c2VzID49IHRvIGNvbXBhcmUgdGhlIHRvdGFsIG51bWJl
ciBvZiBjb2xvcnMgYWdhaW5zdA0KPj4+Pj4+PiBtYXhfbnVtX2NvbG9ycyAod2hpY2ggaXMgQVJS
QVlfU0laRSBvZiB0aGUgY29sb3JzIGFycmF5KS4gIFRoaXMNCj4+Pj4+Pj4gaW5jb3JyZWN0bHkg
cmVqZWN0cyBpbnB1dCB0aGF0IHdvdWxkIGV4YWN0bHkgZmlsbCB0aGUgYXJyYXkuDQo+Pj4+Pj4+
IA0KPj4+Pj4+PiBGb3IgZXhhbXBsZSwgd2l0aCBOUl9MTENfQ09MT1JTPTE2LCBzcGVjaWZ5aW5n
IDEgY29sb3IgZm9yIFhlbiBhbmQgMTUNCj4+Pj4+Pj4gZm9yIGRvbTAgd291bGQgZmFpbC4NCj4+
Pj4+Pj4gDQo+Pj4+Pj4+IENoYW5nZSA+PSB0byA+IHNvIHRoYXQgZXhhY3RseSBmaWxsaW5nIHRo
ZSBhcnJheSBpcyBwZXJtaXR0ZWQuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBGaXhlczogOTVlZjVkZGY4
YSAoInhlbi9hcm06IGFkZCBEb20wIGNhY2hlIGNvbG9yaW5nIHN1cHBvcnQiKQ0KPj4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPj4+Pj4+
PiAtLS0NCj4+Pj4+PiANCj4+Pj4+PiBSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5m
YW5jZWxsdUBhcm0uY29tPg0KPj4+Pj4gDQo+Pj4+PiBEaWQgeW91IHNlZSBBbmRyZXcncyByZXBs
eT8gSWYgdGhhdCBlYXJsaWVyIChyZWNlbnQpIGNvbW1pdCB3YXMgd3JvbmcsIEkNCj4+Pj4+IHRo
aW5rIGEgMm5kIEZpeGVzOiB0YWcgbWF5IGJlIG5lZWRlZCBoZXJlLiBGb3Igbm93IEkgY2FuJ3Qg
aGVscCB0aGUNCj4+Pj4+IGltcHJlc3Npb24gdGhvdWdoIHRoYXQgdGhlcmUgbWlnaHQgaGF2ZSBi
ZWVuIGEgcmUtYmFzaW5nIG1pc3Rha2UsIHdoZXJlDQo+Pj4+PiB0aGF0IHJlLWJhc2UgbWF5IGhh
dmUgd2FudGVkIHRvIHJlc3VsdCBpbiB0aGlzIHBhdGNoIGRpc3NvbHZpbmcgaW50bw0KPj4+Pj4g
bm90aGluZy4gWWV0IG9mIGNvdXJzZSBJJ20gYWxsIGVhcnMgdG8gbGVhcm4gb3RoZXJ3aXNlLg0K
Pj4+PiANCj4+Pj4gT2gsIG5vIEkgZGlkbuKAmXQgc2VlIHRoYXQhIFRoYW5rcyBmb3IgcG9pbnRp
bmcgdGhhdCBvdXQsIEkgd2lsbCBoYXZlIGEgY2xvc2VyIGxvb2suDQo+Pj4gDQo+Pj4gDQo+Pj4g
SSBoYWQgYSBjbG9zZXIgbG9vaywgSSBmZWVsIHRoYXQgdGhlIHBhdGNoIGlzIG9rIGFuZCBjb21t
aXQgY2JhOGE1ODRkZTE3MWM4YzQ1MTA3MDljMmVkYzlmMWNmODZiMjFhYg0KPj4+IHdhcyBtaXNz
aW5nIHRoaXMgY29ybmVyIGNhc2UuDQo+PiANCj4+IElmIGFueXRoaW5nLCB0aGF0IHBhcnQgb2Yg
dGhlIGNoYW5nZSB0aGVyZSB3YXMgb3V0cmlnaHQgd3JvbmcgKGFuZCBoZW5jZSwgYXMNCj4+IHNh
aWQsIGEgMm5kIEZpeGVzOiB0YWcgW2FjdHVhbGx5LCBzZWUgYmVsb3csIHNpbXBseSBhbm90aGVy
IG9uZV0gaXMgbmVlZGVkKS4NCj4+IFdpdGggb3ZlcmZsb3cgZXhjbHVkZWQsDQo+PiANCj4+ICAg
ICgqbnVtX2NvbG9ycyArIChlbmQgLSBzdGFydCArIDEpKSA+IG1heF9udW1fY29sb3JzDQo+PiAN
Cj4+IGlzIHRoZSBzYW1lIGFzDQo+PiANCj4+ICAgKCpudW1fY29sb3JzICsgKGVuZCAtIHN0YXJ0
KSkgPj0gbWF4X251bV9jb2xvcnMNCj4+IA0KPj4gaS5lLiB0aGUgc3RhdGUgYmVmb3JlIHRoYXQg
Y2hhbmdlLCBpc24ndCBpdD8NCj4+IA0KPj4gQW5kIHllcywgbm93IHRoYXQgSSBsb29rIGFnYWlu
IEkgdGhpbmsgSSBhZ3JlZSB0aGF0IEkgc2NyZXdlZCB1cCB0aGVyZS4gWWV0DQo+PiB0aGVuIHRo
ZSAoaW1vKSBiZXR0ZXIgZml4IHdvdWxkIGJlIHRvIHVuZG8gdGhhdCBjaGFuZ2UsIHJhdGhlciB0
aGFuIHN3aXRjaGluZw0KPj4gZnJvbSA+PSB0byA+IC4gVGhhdCdzIG9uZSBsZXNzIGNhbGN1bGF0
aW9uIG92ZXJhbGwuIE1pY2hhbD8NCj4gWWVzLCBJIGRvIGFncmVlLiBUaGlzIHBhdGNoIGNhbiBi
ZSBtb2RpZmllZCB0byBqdXN0IGRvOg0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbGxj
LWNvbG9yaW5nLmMgYi94ZW4vY29tbW9uL2xsYy1jb2xvcmluZy5jDQo+IGluZGV4IGViN2M3MmIy
NDAyMy4uNmRjNjE0NzM5YTk4IDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL2xsYy1jb2xvcmlu
Zy5jDQo+ICsrKyBiL3hlbi9jb21tb24vbGxjLWNvbG9yaW5nLmMNCj4gQEAgLTc4LDcgKzc4LDcg
QEAgc3RhdGljIGludCBfX2luaXQgcGFyc2VfY29sb3JfY29uZmlnKGNvbnN0IGNoYXIgKmJ1Ziwg
dW5zaWduZWQNCj4gaW50IGNvbG9yc1tdLA0KPiANCj4gICAgICAgICBpZiAoIGVuZCA+PSBOUl9M
TENfQ09MT1JTIHx8IHN0YXJ0ID4gZW5kIHx8DQo+ICAgICAgICAgICAgICAoZW5kIC0gc3RhcnQp
ID49IChVSU5UX01BWCAtICpudW1fY29sb3JzKSB8fA0KPiAtICAgICAgICAgICAgICgqbnVtX2Nv
bG9ycyArIChlbmQgLSBzdGFydCArIDEpKSA+PSBtYXhfbnVtX2NvbG9ycyApDQo+ICsgICAgICAg
ICAgICAgKCpudW1fY29sb3JzICsgKGVuZCAtIHN0YXJ0KSkgPj0gbWF4X251bV9jb2xvcnMgKQ0K
PiAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gDQo+ICAgICAgICAgLyogQ29sb3JzIGFy
ZSByYW5nZSBjaGVja2VkIGluIGNoZWNrX2NvbG9ycygpICovDQo+IA0KPiBJJ2xsIGRvIHRoYXQg
bGF0ZXIgb24uDQo+IA0KPiB+TWljaGFsDQo+IA0KDQpGZWVsIGZyZWUgdG8ga2VlcCBteSBSLWJ5
IGZvciB0aGlzIGNoYW5nZS4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

