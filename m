Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPiWINtn9GnRBAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 10:44:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B23374AB1BA
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 10:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298588.1573770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIjTb-0005PG-Ea; Fri, 01 May 2026 08:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298588.1573770; Fri, 01 May 2026 08:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIjTb-0005Mn-Bn; Fri, 01 May 2026 08:43:59 +0000
Received: by outflank-mailman (input) for mailman id 1298588;
 Fri, 01 May 2026 08:43:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wIjTZ-0005Mh-Rw
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 08:43:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIjTX-008xx3-IV
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 10:43:57 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f467bd-e002-0a2a0a5209dd-0a2a4508d79a-10
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 10:43:56 +0200
Received: from [40.107.159.61]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f467cb-63b5-0a2a45080019-286b9f3d2fe3-3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 10:43:55 +0200
Received: from DU2PR04CA0273.eurprd04.prod.outlook.com (2603:10a6:10:28c::8)
 by AM9PR08MB5953.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 08:43:50 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::3f) by DU2PR04CA0273.outlook.office365.com
 (2603:10a6:10:28c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22 via Frontend Transport; Fri,
 1 May 2026 08:43:50 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22 via
 Frontend Transport; Fri, 1 May 2026 08:43:50 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AMDPR08MB11308.eurprd08.prod.outlook.com (2603:10a6:20b:71f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Fri, 1 May
 2026 08:42:47 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9870.016; Fri, 1 May 2026
 08:42:46 +0000
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
 b=HLbphWxRyBDSdDmrhd0VIcZHcPT7+O3r36+wW2B2dulJh+tlGCORdY+E+rhU/Oxpj7Wk6jsGcXeySSnt217sJHoEh2d1yQDh0YLy7YWb5FHZAvdlMhOBENQzZ6OrDuIOHlTyK7ZRUSiWQ8dVPxn61Q2FOPgmPpxLGu3lwxVJlAYl2CiMSucIkpkg8b8NEcRTGAFTbZ2JKNUpamC2l8U7p0j8ipzCx+9bmrEZbXA32LDK5NNc/a9/gKKMfQRsNA729UP851lXA/SkRRd6ky6JG//v2hAnnjQbFvK+XCkNr4Qvku2wcKhfFC4WvVzUOxlySBI18y6CedlEhj2MIA8irA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+eL7sx16NpzAMervcue5ZnImAY2o0Ceg+QcxkJy/Lo=;
 b=dRmDDJ46aAoChwlyg2W39X6Al668h3AS78UXja6RFYBGHin2SczsSc9j84FF5/6qJxd9Cs8iv3cHNCmi9XAyz0zubU5zj+7a/ug+6ZPQ5FPBJhPA56vX/AumIOjC6LPtsDX4hXpyj12DQsF0Kcl/voRkAaahiEPNMXsJ/+wprp0S2WqgE62G+r6HWdgF85WUqNVhTFDTjWJVKtzJhn6NQX/mg6gzkocXPLue6bkbNXYh7i6J8dpVOfAiWaZIskwV7+Yt98EsYo0laTyzMl1hrCAGRieWcBYoyt4xgazEXAn7q3uiCHccKByW9/bKnJMshVsFd4cPkdv3bOE6+ku+rw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+eL7sx16NpzAMervcue5ZnImAY2o0Ceg+QcxkJy/Lo=;
 b=kONzDHzx3JXnPb+UMSHpBU2lRtruHPU695/CpWFPaAGGLa6ZV4Wrvrw5WBTfAgVR+YvfZWDrenAAHBdgSKocEmzVmPd/g0gNDNlXDT9wZOjTxd+TjqRpMcGU9O4CtWClxYtu/+V1t+kxB1dA0WpetYldpRN/6k+RoeqBKlVVf8M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbArLqmy6ON+skh/ugL2rc8Yd5Z+Oa8R8GQT55A4NqXc2Ow/5a7gKP24gbZ6UIZ8UbtewVRpV4k1Yv4L1TZePkeQozRpjxY57mAgrzF62MWN/XNjIx0vPEEmoTikv4pkWyVF7j9O6V0i/tQq5iletf+cnqbDOUANVQ31CJPZAP7TE50m3GxKFfA0yxKfIDUSGACGL9H4+cOfdYqZl5+T9cf5vRtMphXwFkV5U0bR/2QWkQrNq5ARTMs9uP0hYbYGIs66PBxhbkf0KblS2K/iUtEiCg5tqfLfGr7TPv31pq1Cdvqmm9zmnDwU6wHY/W1CYEBaPCAbMCSoeop6R1M4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+eL7sx16NpzAMervcue5ZnImAY2o0Ceg+QcxkJy/Lo=;
 b=gUj5G6JKT6RvPa8DjK7WbBuu9N9k+6i29iUxyuF+hVjrl5ihVeGcb5b0yqw4Ukcpw4EjeQXTRDewsG7r6JJ2Twt7NJYXE2G18boB+/P0x4AKuoKToeZtKzy1Tk7DIohhiffT+PSpW1dLtZlJqNg5uiad4/Gw2g1fHlhuKafaXYB7r7FmVKieBrBxzh7pFe3zV6MUeyLqe/db1s9v8l/voSloFboZEOVhIBIVfNrd5POVb6sx1HSFGo0Y/0bzji/qyTj3vGWXvCf6061essROJzpynT/0w07McFMzbkILl/ocZRwlD/YqSFc7Li1r3FwPLXZHZibZKvuMuokmdf2eNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+eL7sx16NpzAMervcue5ZnImAY2o0Ceg+QcxkJy/Lo=;
 b=kONzDHzx3JXnPb+UMSHpBU2lRtruHPU695/CpWFPaAGGLa6ZV4Wrvrw5WBTfAgVR+YvfZWDrenAAHBdgSKocEmzVmPd/g0gNDNlXDT9wZOjTxd+TjqRpMcGU9O4CtWClxYtu/+V1t+kxB1dA0WpetYldpRN/6k+RoeqBKlVVf8M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/pdx: Undef the correct macro
Thread-Topic: [PATCH] x86/pdx: Undef the correct macro
Thread-Index: AQHc2UYqbfaUw2RH2EuVGUbnBMCcnLX42kcA
Date: Fri, 1 May 2026 08:42:46 +0000
Message-ID: <CCE39E98-189C-412E-AC50-C510429C6457@arm.com>
References: <20260501084023.1195353-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260501084023.1195353-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AMDPR08MB11308:EE_|DU2PEPF0001E9BF:EE_|AM9PR08MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: 125393c4-2f12-4e56-2c0c-08dea75dc47d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 gZau6ns4rXmWn/A+3uWklUuOvTT0gKkfvueILNbNhsay0m0ZYS4OZvjl2eo2sOIa65W9rZ5NcVgPCMpsAQnqWCXcR7dgTVI1i4ADaCrtZmIlEfK00C2bQlAX2slGgVQOj/cOLdYInfZzY3bjiJw4aaAfdH+w1yCmovRsvsbqMMmMRusnZdWKGOaYRRCHD3NYYuz3YLVhdt57ohOV5r3FjwuI34FhyaDr+3CSCzgbOoIv9YQuOT5XYnFrABkHLQyJ3Qt+yu5uzSP7NPlzuEtV46H0F+1LpfaWBTmHCHrAwJnoFAdWxp86vi36xq+2nU0tMdWB1EkBLbrrjzSpg2OZTqPujfuRIBm11vQtbqPWEzhHpGYIpfB692efu1/m4ZHHSAAym5MOTkHXv2H8yiTA/HXKTCm2SX1Y7UzK468mvvFPKAvDf2GSuAtpcvfLtl7PTuH7qfmtZgimrDUahY0kK6+r2uvJifSDtL4Lb/2TNV/OrYVr9LCkns82huuPKjflyJHunpZGwd6LTWTD/+Iu/RhzWXDB9CTNkzKu0ath18XJLRwxbV5T2ZsWMBHBQd+QQ8dSqmL/d7mGs1J/CW6+aXI3lNNcB/+fO4IfAWxelQSV1WW1FAgnX2HrMfFB9116fr+93XHlCf/9gOOdVeLKJrofi84TipDCXi8zgt5GKD/u2YN2xRijGYlrfEA4dqC7HXA8WF6wDXksG5TYRgKHAXVgUceAEMmXjTs27HZV34ESIaReJk+K621MkAEX/aPs
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <303FDE715184BD4B9EF3176C0CA53703@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 ITd8Dj7PE8BiMzgX8jn8Gzwp3p6XbE5232hVjFUSa+Dg+ROFG8sVaxreOZPFpKrfNeXMnHTpctS9jA9jti3Pkxn71kF5Y4AVMRbyXsrmiogdpIlRN1XTC/9b8TR/UPwM0TTOSbQCp5ce4+2vYRZ8x5nx19zCzGU067UrtUTOl2G0NWjMdP/clr/easnhbbMnMu2bY40zCxYCS+ettwI0t5V0AadEFVjKpB7NebCUEQ9TuQQwFYmvwdCRs+Y/OnqwREAQbtsaxiPSg3W1lg8Uu0GFqbQih6ItDrw5C3KIjEpt869PlAAI7vvReIWj28nBBDARNobVGxyltIuru2/TMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11308
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	10c60836-0350-4659-f808-08dea75d9e9e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|14060799003|35042699022|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	csnRpfqZTuMqpwTfimxq6G/M1+EB0gazLebOyuLzZgaPgBsAHPVrC+hDCEJM4VNeiML4Ie6BR997n1FdxT9OyQZT2hast3m57gROMhpBOuHhJH6QMFtFaw4alSj5uvExOzG6zOgcuBH1625UoDYsIpWZ57IUrSbkOIN1IydEiRkjeNa5KAcm9yiSDrZCbwAcTEtooJeFelHteP12c3p9rx4fXx5jG+ObbM8sh1qqHIBowk/tFo3BfEdWj7YvKV6cVJ+ACqRnNZCowHC3TwyP6L5F2AMI7K7oRr57w2tkC95fiKo1d+Iw54XDBxSnOQdtEqZSfuOr1+iVnoDXD0wiwPTfb+WMcqjgbQqu0d7c/COI2yQG0tX5DdO8A+VoeIq0h6Xa2F3IRkbmbY9HIsvSlX+z8W4SeGKF46PIHsl65abu6PLfkiEsmH/oR0fBqZOrJx7H+qqRdLLP74kEo0eI2z8vbE49d+pOW09wLm9mk1AbyBMdfykKsonniRpClPWn0Q1NHKHd244nTVwh4VMc9iIWrUvf4XcSfO4jI/5bhY+pwS2M9s8bXCFIWUl5oIW0YEMckVM3CV//cWB8UmkyE/8SfcOtnmUWHRi1h0nb0PpEwvEn6+irENIoynhVQr5L0Aqi1d5mBThx7uWLG25mLPKFWqxEWkQRgoVKmUGn9bZQ32lkM6KqzdlVHXbnzbr1iRD5PDOTLCz1iIz9wpwbBzOVtpFB3PmEMV/BHYSc6MY=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(14060799003)(35042699022)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T+p4bN54255CN+V68RpdaYSI/Tcf8IxEvqmbXCW5lodDOijvGVSmVtjEByVZV9KyBnFpUSs1Eq2sAV6MjjnZsi/NNYpET1eRzZ23W7yNlaHlVNeWIyVlHUVdABHYihk0zdCiTei7iuwr7D4SE5DHDLVm97xtdw1b+8Y7ERqaSZkU9wioOQveD+HvL7/U0l521IwyiTwGYil+K32lcFakSpu+7Jp7XoMySlgvucKktSLXb3mjLPLjyUoMblhXUiYppSGHpr9XEck+YYitKQZGPDH7ll/R7VjqvBMSJISLBJCZiQVpGWwEa0OHKAUM1qHg4pBfa8zHx9nqsh6P723sDo43smSmjznSsKctFN6VhIJ30HufF8fjuzrj/cKAJ+m3fqnm5KbQVUjXnEr0Wpv/HdPO5AnsQcKT7C1LIWRWbpcLlgwzS5f56xzA2TUktjdB
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 08:43:50.2543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 125393c4-2f12-4e56-2c0c-08dea75dc47d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5953
X-purgate-ID: tlsNG-c1860d/1777625036-3AB74DB1-EE3E89D2/0/0
X-purgate-type: clean
X-purgate-size: 1634
X-Rspamd-Queue-Id: B23374AB1BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:email,vates.tech:email,arm.com:email,arm.com:dkim,arm.com:mid]

SGkgQW5kcmV3LA0KDQo+IE9uIDEgTWF5IDIwMjYsIGF0IDA5OjQwLCBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFRoaXMgd2FzIGNhdXNlZCBi
eSBhIHJlbmFtbmUgZHVyaW5nIHJldmlldy4NCg0KTklUOiBUeXBvIHMvcmVuYW1uZS9yZW5hbWUv
DQoNCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiANCj4gUmVwb3J0ZWQtYnk6IEx1Y2Eg
RmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4gRml4ZXM6IGJkMGIzYTg3NmQ4MCAo
InBkeDogYWxsb3cgcGVyLWFyY2ggb3B0aW1pemF0aW9uIG9mIFBEWCBjb252ZXJzaW9uIGhlbHBl
cnMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPg0KPiAtLS0NCj4gQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4g
Q0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBDQzogVGVkZHkg
QXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+DQo+IENDOiBMdWNhIEZhbmNlbGx1IDxsdWNh
LmZhbmNlbGx1QGFybS5jb20+DQo+IC0tLQ0KPiB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vcGR4
LmggfCAyICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZHguaCBiL3hl
bi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZHguaA0KPiBpbmRleCA2YmU3ZTExODVlYjEuLjZjMTAy
MzRlY2ZhOSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BkeC5oDQo+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZHguaA0KPiBAQCAtNTcsNyArNTcsNyBA
QCBzdGF0aWMgaW5saW5lIHBhZGRyX3QgZGlyZWN0bWFwb2ZmX3RvX21hZGRyKHVuc2lnbmVkIGxv
bmcgb2Zmc2V0KQ0KPiAgICAgcmV0dXJuIG9mZnNldDsNCj4gfQ0KPiANCj4gLSN1bmRlZiBQRFhf
QVNNX0dPVE9fU0tJUA0KPiArI3VuZGVmIFBEWF9BU01fR09UTw0KPiANCj4gI2VuZGlmIC8qIFg4
Nl9QRFhfSCAqLw0KPiANCj4gLS0gDQo+IDIuMzkuNQ0KPiANCg0KUmV2aWV3ZWQtYnk6IEx1Y2Eg
RmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

