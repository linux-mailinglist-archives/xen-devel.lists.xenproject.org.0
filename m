Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL1ANNVGA2ri2QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:27:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD6B5239DE
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306966.1578695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMp0l-0008Nv-0K; Tue, 12 May 2026 15:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306966.1578695; Tue, 12 May 2026 15:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMp0k-0008Lw-Tf; Tue, 12 May 2026 15:27:06 +0000
Received: by outflank-mailman (input) for mailman id 1306966;
 Tue, 12 May 2026 15:27:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMp0i-0008Lo-J0
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:27:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMp0h-001ZcJ-Vm
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:27:04 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a0346c4-e002-0a2a0a5209dd-0a2a450ced34-6
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:27:03 +0200
Received: from [52.101.65.69]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a0346c6-62f1-0a2a450c0019-346541459935-4
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:27:03 +0200
Received: from AS4P189CA0060.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::15)
 by PAXPR08MB6349.eurprd08.prod.outlook.com (2603:10a6:102:15b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 15:26:59 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::6d) by AS4P189CA0060.outlook.office365.com
 (2603:10a6:20b:659::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 15:26:59 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 15:26:59 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AMBPR08MB11964.eurprd08.prod.outlook.com (2603:10a6:20b:779::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 15:25:57 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 15:25:57 +0000
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
 b=nIsfauQyK2PQEBlmr+O+kWxwG48rrJtv6CRTSd4sOqJcXlAZu932iqf3PPL0a8qcfibJmojpZe8YXkxkoG9VgcCL+iNDw3eFy91CdAZUE3XLs15mjHK8OMbwhyYOz7kFTn9A/Oqcp9RdGJwKLv9F+rBoDlzhy3V2Q0fUgj0lYru4s2XAWtrdgUaVhAR86tcLGUpf4pquWx95IuZE7l+wF0J66ZzyecIGUTxhlDfuPuayDUg4WXt6sUH/XNj7/lklGtQZNwOiU3+mcC8+i1r2kFVUcp8LLetGxx8S64wbPfgr04af/cQZyHQEDt16leJPDedWSMLpK4TNtZPUGjPXPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+TM6OmSHPm/yc+EZ/KicAkU8RvVEoB2+MHR9VBrIXU=;
 b=karhXZUyKnANbZu86wWwEZIXtrdPOvIH/bMD3up23Y/GNZuVD3ahKNis4l5oBR7AENgYkbIpuDC2IqapDgUZY0tL17mmPt710Oso51/huUWXoVFwsL/AMYTrKOlWoYsKT8zugrMgkUFChd7/HWNduNBJdY5xFC72degJrhVCYTdkvvkMcHOFVtKMsPbP0chQim/iWgWfuUb6nvV9kfiNOtLDk6y1ML6wTctKOaPHPusxqzLPtu/DAW+O+4khcZSZvW+61Cixa3F2RSrR0yco2pkk7Y4fPSO5ffCQwGchPTq7wonS9r6RxTDvN1e4ZpyUqJJamf+c9LYGE1TPwnyYYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+TM6OmSHPm/yc+EZ/KicAkU8RvVEoB2+MHR9VBrIXU=;
 b=T7Sl12nzXpBr2oPOtY8eK935kmcORKvkxWuJSVwBpgpsK5JGTErbwNCwakzgOm6E8uYDkWQL4tWfEXTghdVQYZEMDjND/a+go8rYsWWNrA3hP7+4VELjxgKtghascCf7ay9eoR5TLgmDpo2buFNe1lmMM1tBaEUew4wI83WkB/U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwHiZuRQUcIECSXUOOP+XCj1uBy++QG+PNANd3aXZ4Xg/gR9olO+6Z4aMT6KVTcOBHGmnTVn8XlzLTmVEFUWGwea8W88JO1za5XhVmWVPY3XsPwEgRr5eu1wok+lt4wGcjB++N0WvQjKO/gMA3BmBSMtLdAMQqzEWOSBqbe6uNApX5icmizVGH0odaCBow2sLi7SqmOxChzV3DbqIIKN4E/Y2pyDE5V7eYVK2WV08OAg57BExFvTaaJnJNmlAPAEfnTLJHACwaGLEpasc12gFRRpWu6kN9EOn1Yz7eMgaNtyTBHzFSp5Zn1ysObXjGamjqsK+KXY0dwv71y74pUZLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+TM6OmSHPm/yc+EZ/KicAkU8RvVEoB2+MHR9VBrIXU=;
 b=wm3t91bl7RB5Gl+/zQ6lwd8zAVSopKG5h0PyJPTsZmbVnQ63qb5OfbLnipMxusQxxOJxZPLOal/q17uwRiINobx1ZhJCgB/8Apvl1+GUrFanJWhZaUwwDWQlb4G2wmWn6RiGBRcbVa09kdc19d8abLxqaPCWzJWbIDZ64g5R1ci6CtaZy2YfhsJi2VyWvoRrAxaf7X9buLz+V+1wZcP/IORcCnrixeH8F3mkX33ZhC/DNci1NCrovqtwqqIIxNUYvhIp1RWN8HP76UBak3NMDRpNfr43wI7B9iXFekVT0ul6wfYiyZ9HBlxBo8MleeRJt3F1GljyF1DKSCsS/9Kzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+TM6OmSHPm/yc+EZ/KicAkU8RvVEoB2+MHR9VBrIXU=;
 b=T7Sl12nzXpBr2oPOtY8eK935kmcORKvkxWuJSVwBpgpsK5JGTErbwNCwakzgOm6E8uYDkWQL4tWfEXTghdVQYZEMDjND/a+go8rYsWWNrA3hP7+4VELjxgKtghascCf7ay9eoR5TLgmDpo2buFNe1lmMM1tBaEUew4wI83WkB/U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v5 0/3] Fifth MPU Series
Thread-Topic: [PATCH v5 0/3] Fifth MPU Series
Thread-Index: AQHc3vevt71hZe8lskS1PtpxlhNAy7YKiLyAgAAAcgA=
Date: Tue, 12 May 2026 15:25:57 +0000
Message-ID: <8E3746EE-8AC2-482C-AF55-A2745E0C32EB@arm.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
 <3d8e5b0b-f7f5-4102-b3d2-a973517c8daf@gmail.com>
In-Reply-To: <3d8e5b0b-f7f5-4102-b3d2-a973517c8daf@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AMBPR08MB11964:EE_|AMS0EPF000001AD:EE_|PAXPR08MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd57d7e-61f2-48c3-aa23-08deb03ae8d4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|38070700021|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original:
 NbWLp6fjm8gq5m9kO5A2uOnV4MZfhx/Ai4/ZgD1Xn8qvL+8efvz0LTvWVuNdVtZSpDxWRW8rrCP4qMp248CrKYinDEEDllcB2etGWe1xO7lTmPYK7/xwPZzNYL+eCFx0bKWtm7oBvJxNJVFVAT5HId8cfoeD2anKFnJ63L18GsTF3XQKhGJootjM/j8ld4VQXmyketbf8KgjSSNJdTDNQ4KYW+nrJT/3nOVwpzbz3nUKkRewKjjYeAFOEX0LZPtLOcg1indsFM5h91BRSmYBR8yLZb+CEaUE2WBw9xF4OQ5cX6eJykpyK3mk7pIDZdxK+qyOFmdjBRs+lql7LVATylOfbeBSzcxXOUNPKTnySCO3BZRARNbvg0R2coht9MzNkifBUWFCOnQUao6xt5eZ2lbJ8CHyG4cW1F5WpIFcRKFwVsTsAg7zA3RM+gK+yw/+2FKkIYOOd/rgx1QppmNMyLL+odRF/spyp3INp5dANIJuvEHlDNfwoNuGl8STuquT90zFtACvCff5O1z/mivlVwxJxLmYB/N1bZm+sM6ylLsQhn1wQYDA11EOPkYh/P1igFLvolt5lXSV91d0k/d+Xr7YUC/3Ke5t8mteMfPI2DeyasMKUhFQ+x4uZGgdt+5JHuXMenhzkgVyUBD594ouIBhH0CnJ5VXeQdzhXHvgHS8i6IbDoB1M9SncVpezfTnSGIahW9EE33GTWkBw+KzlGyrppnOb+Zy0s1UKlMGaF5Kb/FAuTIdPxMpcCnkUwdaO
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(38070700021)(56012099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5548875D22D5B741916934D09FF5B2CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 IbMgah15kGogI5WFF9kYHAOnlaHtfc4fD/7ah8Rbdglicm35D4LpMUH8JP6PYWPSLaEdTYq4EQHsC4yLuBVknNq6p11Ki2Ds+2m4AnqR/HSNTDz4S1uGkRZfUTPeBkHZZny3cKO+nzKxY8kICAORJ1e2DY0ki9NVzAgeP3+++PF80zGuRYNCALlSV8bk0bNZnAC1i8u4T705BqJM43xWvUrQ5I12EI/FdY7wbX7LCG2k4qwaXAYu30ajTv0x+1G6mh57/nwfktWrECNpH9bNrD7Jwg6j2eRFv5bPoZtCVlGkJjXaCEG/8zlfL7++yOoVwS3lHzOex2i110WKZ6cfmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB11964
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3c2930e0-fe2a-4e35-d399-08deb03ac3c7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|7416014|376014|1800799024|35042699022|36860700016|82310400026|11063799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Y1ylA+rTwwJppdaM5Svtiowbr8pCS13AwPH6gbT3byy93rh4muoYw8DO0UBtY6UjuH64Pwhdv3p9cFGB95FWrTERg1ZCowe037LyP2BgIaCQgOIqYWVBkXpd+rxkQ5UWBA9pbx9L2jd89OVqmwfp5kc6qhgFquKDfEhw7vFCBdjsjCKszmUtpAgjUPtfPk550Y3AiPXEnm2hOKkAQ8SNVBytfJUiZADjZ02Uv1A1iijyHjg9oZ8uagqCt8PJrupqlDZr6m5CwL293A8wIw4w+z0DHSjyggSs/kWFk78gg/Irns80HaySbRBc8NY9IsxbEkykI6ZdEe4eFa7QcuD6YJJzF9zMOv2q4Pt0v718FPSp8uQY48pLW91TRv6OQ/GeHZoIy/uzcEdpUxix2ynWZPN8g5lP1dfATQu/WZf30mCE8ovBGOxEG9Su+zTumiA0crA4jkqnx+IJYXd73UeWYdRuHiyXhIQHgoEDkS1mqQSOE/fkrGbkcTWqix4UenW8/hYvl+Q+nmN2tFG7O8nKuVFXg5BZJf/4ipFnSLlye5xAu3/+uiPMGVSZx2df4tT5kOc7fZhi3O8q2kCI8monCFMkrvo5NIoM5BYIegeWgyJwt70lNYdhPcIqFQXentikGNMJWjdvfm1HOUUaW5Iapm7GMHrUFKNDrIJ72iwhdc7ieC2kSjZMEg6mjSIHcKN2FfSsi47/7BNsLzheHBwLI2hUT3vWUdgkdFY3PtbJJKY=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(7416014)(376014)(1800799024)(35042699022)(36860700016)(82310400026)(11063799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8Sf6Ls6wLoE2w8NfLl+DB/xV7KpjS109ThpkNcf3TOZHIPUu8SI2YAFIkb8mwdABkih5UaVeVM24r8URdbzf5uGKe8vVD/58UPYgqbR9ZcpN4mrUtZMQd68AFy4kq+y9q5YUoJOgiJsw3XfHyUZQwMAp+6deWMlZgZ7gZL7QVjvmgczVUZZBtSogkysgnASpqR4czd1EMOwk+eIdkYPlyibB91wXvb4cXkH4kgCwEz1nYU7VJfARtNp0ke89ImuQf2p+qdIUvG3WPymvDjYEEfaTP6VZXaCmZ7LOfCIeCb9LGQv1gOgruyrSBI18gYCg4t+GiE2Z3KgGpu61cW+P+Iiv73rSlWnk2k4boLygo4ZmJW7wSovwHTNSsjHPH1BomlVYnL3aG2uGDhCNynQsoYelHEI0DkyAm7LVfaMznoxBhgjVSeB6FeHSMRN/0aUC
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 15:26:59.3147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd57d7e-61f2-48c3-aa23-08deb03ae8d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6349
X-purgate-ID: tlsNG-d25034/1778599623-E2169CF5-CC246201/10/73395122804
X-purgate-type: spam
X-purgate-size: 1979
X-Rspamd-Queue-Id: 3AD6B5239DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

Hi Oleksii,

> On 12 May 2026, at 16:23, Oleksii Kurochko <oleksii.kurochko@gmail.com> w=
rote:
>=20
> Hello Luca,
>=20
> On 5/8/26 4:33 PM, Luca Fancellu wrote:
>> This series continues to further the ongoing work to introduce support
>> for MPU systems in Xen.
>> The patches in this series aim to implement MPU specific p2m functions.
>> This serie is based on staging 10d417b8b62efa5093707c1dfe9bd48e0abeb331.
>> Harry Ramsey (2):
>>   arm/mpu: Introduce `v8r_el1_msa` device tree property for domains
>>   arm/mpu: Implement p2m tables
>> Penny Zheng (1):
>>   arm/mpu: implement setup_virt_paging for MPU systems
>>  docs/misc/arm/device-tree/booting.txt    | 14 +++++
>>  xen/arch/arm/arm64/mpu/p2m.c             | 80 +++++++++++++++++++++++-
>>  xen/arch/arm/dom0less-build.c            | 74 ++++++++++++++++++++++
>>  xen/arch/arm/domain.c                    | 11 ++++
>>  xen/arch/arm/include/asm/arm32/mpu.h     |  2 +
>>  xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
>>  xen/arch/arm/include/asm/arm64/sysregs.h |  4 ++
>>  xen/arch/arm/include/asm/cpufeature.h    | 13 +++-
>>  xen/arch/arm/include/asm/domain.h        |  4 ++
>>  xen/arch/arm/include/asm/domain_build.h  | 21 +++++++
>>  xen/arch/arm/include/asm/mpu/p2m.h       |  7 +++
>>  xen/arch/arm/include/asm/p2m.h           |  5 ++
>>  xen/arch/arm/include/asm/processor.h     |  8 +++
>>  xen/arch/arm/mpu/arm32/mm.c              | 17 +++++
>>  xen/arch/arm/mpu/arm64/mm.c              | 18 ++++++
>>  xen/arch/arm/mpu/p2m.c                   | 72 ++++++++++++++++++++-
>>  xen/include/public/arch-arm.h            |  6 ++
>>  xen/include/public/domctl.h              |  4 +-
>>  18 files changed, 353 insertions(+), 9 deletions(-)
>=20
> I am okay to have this patch series in the current release:
>  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks, I will send the v6 shortly and CC you as well in the cover letter.

Cheers,
Luca


