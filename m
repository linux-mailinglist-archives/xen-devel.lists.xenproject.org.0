Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPhjAri4AWoZjAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 13:08:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7450C7CC
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 13:08:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306056.1578148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOUg-0000jB-6t; Mon, 11 May 2026 11:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306056.1578148; Mon, 11 May 2026 11:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOUg-0000gD-3s; Mon, 11 May 2026 11:08:14 +0000
Received: by outflank-mailman (input) for mailman id 1306056;
 Mon, 11 May 2026 11:08:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wMOUe-0000g7-K4
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 11:08:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMOUe-006jmi-0E
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:08:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a01b89b-bab6-0a2a0a5309dd-0a2a450be4b8-4
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 13:08:11 +0200
Received: from [52.101.65.62]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a01b89b-212f-0a2a450b0019-3465413ee8e5-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 13:08:11 +0200
Received: from DUZPR01CA0235.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::19) by VI0PR08MB11197.eurprd08.prod.outlook.com
 (2603:10a6:800:24f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 11:08:05 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::bf) by DUZPR01CA0235.outlook.office365.com
 (2603:10a6:10:4b5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 11:08:05 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 11:08:04 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV1PR08MB7683.eurprd08.prod.outlook.com (2603:10a6:150:62::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 11:07:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 11:07:00 +0000
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
 b=RZsQh0kb0+BpEMqFfpC60k08uflqJ1CtA9fg9uK4eoPKTeUzd5cYqr6iktepYv+zn0enZrbO2fg4TdrUtVU5IQBtwCNb5QOIm1qU6QaGbHuUdIo7L59WwuOo9/QbE+zUtrPql/xny6jMJCTZYtgOLwq88kIgtkrl+1O8u9mNKsGXRlUV1rwAvINSia48VZrTabi8/FVfV2it+H143fb/xpLT5vyJ46knHnHJQVYa2tSkzfzYeQ5Yxa0Ad5uo1yFr7Q6OP3Ynik5amkLkJxxdKVjO3RRNPOKLGWpm9FAl+tNQokXJq2stw5sDugb7XTSdLl6PbtW8I4+b8JpkuX6fWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+Rb7bgn0tenNgBzKaW1W4YE+T7q9qHIjclUqsrketM=;
 b=KP4I0IStalFg9NJV6yLvvXHZ1qBer4b0utsF3akHfrQJP/3B23EHevvylKySIDRi+n/udDLSCHhJYIY/bDgwyEr0+/t6UyEw7gNk7v4sO/Q7IVG/+IMJxxbYgXzrbIjDx04jomMgc+nLxu2CCbHGmq9z20zXsiJQnQ5ylu87LlKwnXP86ksg7U12jiNwvnyiCMHryO3EGxAsRjvEraf/0Mv5+u2Jjzl2OVBEw6WmmOtHY5XXyE2GjYUnuZdpNFVDOUdTBX4Ei51xcMkkTW2yBfbZ6VjcjxsNPn/6qf23GbjTSWPNUokKRcWKaI4BJI5QH3nuaPRVs7FTkBRkdxyNvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+Rb7bgn0tenNgBzKaW1W4YE+T7q9qHIjclUqsrketM=;
 b=Pooy6zg4jtGsn7qa/DiyC2nPTToyaTsBXSaldamkDHC+qPrQQr9oniaI6X9hka5NmsEEX4XSf1ttRkJ1z4sjQBvsHBs7LgInRMIZuGZQtPPvX5ciWZQe3vVC5Gym/gcMDlOEseKav/RrLHmCNkQRfBlfcgF65ug3b5gnkW0vT+I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJIy3Ef3SeK7Dq3hRj5/q8kdQnNI0jB8h87sAcFfsLyvn2LMkOTMVNQtk5+1GJ94+eawMBvulNwpdVCbBhdYWLHQ5TNDvV1iM6Z6dfHI1fhf2efR9CWlErWcF/qkmPYVk3UR2o3cvrAjJKqCPn7T1LVt/4F4zV1sbBs+otbwNsFdcsf1rfgS4PQSulhl/caWA5g3JaSqvZ2lxwyC9STnzMUppGOM5OHp5IdGjzYnJ09VWFovkO3GoMWGn1GeqZCBggwvPgf8YDNVBGfpARjHMyfQoANpouzKssV8gGGaD0KznB3sy090/1eeTubllHKOOFtcpPIXpcU5xsmrKfmolQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+Rb7bgn0tenNgBzKaW1W4YE+T7q9qHIjclUqsrketM=;
 b=Sh5L8f5F8gJNB21IaLVkasUka94prl5n4InGpdLCjzs2oJQqQ5/DR0lrC8J6EseI5xTUDYnFcm94QZkraWThqxublP1yKLycUEDors5UxRGgmf5TKxFsC+UDQ20pphp90gh5tbO8BrLG/G7F8PI/P2ISPdZV/jGRZCSdjX2LrdqmxCWoEgIXKP/0frVX/Wyq4GyFUKBLrtbYpysvxa7RSJqwuvfUzJAOBWZ3CerWQnMZecsOTWdypPyFlbQzp3F4ii2AMP0m/2P+PrR/II+vN09lTyZ+GD0pkRJ4URPztBgJOGvcS8o605Nkof8ktc42wZCopm9bTdocHrAGL3CJ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+Rb7bgn0tenNgBzKaW1W4YE+T7q9qHIjclUqsrketM=;
 b=Pooy6zg4jtGsn7qa/DiyC2nPTToyaTsBXSaldamkDHC+qPrQQr9oniaI6X9hka5NmsEEX4XSf1ttRkJ1z4sjQBvsHBs7LgInRMIZuGZQtPPvX5ciWZQe3vVC5Gym/gcMDlOEseKav/RrLHmCNkQRfBlfcgF65ug3b5gnkW0vT+I=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Harry
 Ramsey <Harry.Ramsey@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Topic: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Index:
 AQHc3vfGpFkxMscyakiMWMN4gJbZfLYIoFeAgAAH44CAAAHaAIAAAMeAgAABqICAAAH9AA==
Date: Mon, 11 May 2026 11:07:00 +0000
Message-ID: <4E3CC074-A194-4B55-9B69-12204047D1E4@arm.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
 <20260508143353.3512004-3-luca.fancellu@arm.com>
 <63c08741-42dd-41c2-9f27-b14f350544c7@amd.com>
 <4372B93E-1AC7-4BF5-93A7-D1AD8FCE42FE@arm.com>
 <ce38f845-42ac-491b-98c2-eb2bd90f00c1@amd.com>
 <A3D4B900-2A5B-4398-A914-C1635E34C8C3@arm.com>
 <74ffed08-caae-4d70-959b-12daf5d67cb1@amd.com>
In-Reply-To: <74ffed08-caae-4d70-959b-12daf5d67cb1@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV1PR08MB7683:EE_|DB1PEPF000509FE:EE_|VI0PR08MB11197:EE_
X-MS-Office365-Filtering-Correlation-Id: 8536f11c-0295-4ca9-7998-08deaf4d92f9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 bXc2M2CVaW82UhijI2OGkUvgRVa+9PVlIJHOIQ4mBeeu93c9dy1AFmwkJ4sq3hxu8OJllUD4FWZI5MaM08XXxNrzIDUaHClDjTYWSK+5u63Ez9ILNr+9341P7A4C/fnzQXKE58u84BTb+bZ73kTOx0uSfBQCXOglbyLm9WedRrldsFXJVltTg8fqCeBA2+6JB+tfBQuWhQCRE5VfsJC9JdLdEjLlMD3Q4wkKTjRfmgmrYyMg0E1Fl7A47vdo+QTbzkgtSltWi8Np/pM0iYV+C3QKP5lfK1hErGeXp+5ghN2YoAU57+fNvyQPh4vlAwbZgKcPiJDPquqVh88brvVc7byc8yBRJq4va9soKgQW/6lSR2CrrojrpNSndsj2eKPlglEgDQ16HlctFjwlSdtC8ZlcJyid2ZfSgHKCUBJ9/Jll+UbAxgO1XdfvsV9N1NInNVYSF3fNhDvlJgXqzVmNxR/84d7qtPQZxEZjchYnNSkXjqsnBQygfunk7DSp8rVzolkP1NIDtkQB83OUEe24rwvh8V53n8yVBAvN5J/OgYyHmo5N3f4J611mA2zzPiGqV0lCSIp/Pg18PQZvqKwdXFuR7QBo8hQ4virLZ11snODrYMufMigw3fYliXmeZKNZW/JhEQz8qEtmdN/i5qqCTla1I2JdgsFw4xH2QDloiWQznZLQXP5OndJdmIKWeCHM7zBbdqgpAzWOc38fPNEpWUPrd4W+8M3rFqfkqw5pmsi1TSLnZzeYw1htzrMsrY3R
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7D67594D31E4AA42B83FBAEC9771B9A6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 p6mRpUlgG1o27h42a+TYC+9/Gs5qQdQ7tfkD+oReJNGraH9SzYHdIKt1g/KP3WSCV4TbkT/sXjX0IcwV1opciWZ44paCojWpyw2Mqrdzh0Y95XfLqu6VokFNHxwyiequ3lJjrTSzVhLgW4S0B+fleIqLymtUwEM7FWksQMymiPE/LO5dQAUdFo/Jr+hXjRMkDQskr4NtxXjFWUHf91zesDtK3WSmG6EbViSt9tkwVaMKbr6MmNY1KZkrI5zpsfaYYPcZm3MpOELyhUqfYW3iN4Fqhm7fcSbVSNiXjRwW4bzsFCvw88zeQ4FF/hA4/4oC/tZtLd9to+vTw+C4AojLBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7683
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1604027d-2205-4140-0efc-08deaf4d6cc2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|14060799003|1800799024|35042699022|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	teCAeU0Hseft8ebhkn+h5fW92dzxgiXEwtKhVUKrQ9N2aSsTToqYrorFCsIOQm+o8LN2QpqI1PMyWEE2SDUCUWUQRoF+/fRVxZwVvwtfUgSutBCNRe5OAoSb7USXDm4FrnoSZqKW+fF6QVjIgHFjWPoMzKG32morj9jgWKRC8x5frTHgmWf/v/CbUNNiC4fTuIi3cYayLH0kcsD50YbmQTXnkaJZXw3R40JVvy5ssxmOGtwg+IrrKawkl5DR1eQc6ai/j7djKxwrmEKHDcv9FjmYh60XQzknC1BEgwsYOeV9suC3j3RXxmR8HINlbsDeym80quKyt1pFPGyywG+NDy4BMr5T/fnTvfEmDgwt5dDxC3xE6Bk1V0IQhp6I2/dcQWr4QVKBmDK6tjNm2SigVcSycY0qwMQseG4rIJFmHVT4NeOFRIkwJqDtDzjyybgBT4EH4uW0laW1xo0TRxQgMeIeDOc4KsKZr6c8u+lAfqC1KK5ZjpdXwxLHzUGgvs7IFyEEInHstLFMe7jHXTDJZQR1Atnc+xK4j7FpE55npZrgJJVstR94138LCFOms/f4qHR76kdRlVyDzrpP6r+J25mEhza8vx6PoiBfEwERIo5n1UDomRl9a/MXScxigbnVVCxaMeNd0q2WI9I7OQWQnwsWoDj8Uh4TRVoYWFNQ3bp5wS/skteEeOHWbTcIaEgrbleKnSoXoSZd+PfmJouosVf77aLn2BsXlMBBZuD/3Gs=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(14060799003)(1800799024)(35042699022)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7JpWQ4JJgz2G4tg8zJyqLl4WkQ+6JO0/Qk38Gf4IbpQhaurxqc+919t/YNp691EyHDJ1XRQ8paip8xhjm02Me/RfiDmbrgFIdlfdTZmvkpmTTqvypdjlmD69P1LLeJlmIJL85+4PVNGPG9O+0ghVEdbcQBUzNWQnAJOPQcISrVOoudHF0RlQFx4CTmCwwzma0fRcaX+xxyE9N4WljA68+kRf7fqfSOUTXQBJ+KZRmu/ftQca818W11Xnr9RvwesI1ZJ0CI9FxBeYc+BD+1IBiQSmI81DKkXvmjXMe+h1JQWKTVDLzNPFtJlRmIGHfd24cq2KbfQAYnrEwoxuNoSiUVzSA29Ev8bjvHntUZKZa3VEZUSeYPnuHajGhFFkuLZ+i7fPOXEB1NGTJ59d2zaInZjRtoBQeVUV6CyPz0KlgYOegiHeBbepmxunSPtFw+B3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 11:08:04.5384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8536f11c-0295-4ca9-7998-08deaf4d92f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11197
X-purgate-ID: tlsNG-42698a/1778497691-1BD7FF3B-09ED619E/0/0
X-purgate-type: clean
X-purgate-size: 1673
X-Rspamd-Queue-Id: 51A7450C7CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:Harry.Ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

Hi Michal,

>>=20
>>>>>> +
>>>>>> +static inline bool v8r_el1_msa_domain_sanitise_config(
>>>>>> +    const struct xen_domctl_createdomain *config)
>>>>> Why can't this function be common? I can see 3 definitions (Arm64 MPU=
, Arm32
>>>>> MPU, MMU) but they do not have anything that would prevent from gener=
alizing
>>>>> them in a single function.
>>>>=20
>>>> I can do a common one I think, just to be aligned, should the common o=
ne behaves as the current implementation?
>>>>=20
>>>> Arm64/32 MMU: Only v8r_el1_msa =3D=3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MS=
A_NONE allowed
>>>> Arm64: Only v8r_el1_msa =3D=3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_{NONE=
,PMSA,VMSA}  allowed
>>>> Arm32: Only v8r_el1_msa =3D=3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_{NONE=
,PMSA}  allowed
>>> What's the reason for allowing NONE for MPU here? None denotes property=
 not
>>> specified but at this point it should be set to a default.
>>=20
>> We treat NONE as PMSA on Armv8-R, so either NONE and PMSA are valid and =
lead to PMSA at EL1
> NONE denotes property not set i.e. set a default. IMO at the place where =
we set
> a default, NONE should be switched to PMSA. This is a cleaner solution th=
an
> giving two options the same meaning. Sanitization could then verify that =
indeed
> the default setting took place.

Ok so this is a bit different from how all other *_NONE are handled current=
ly (TEE and SCI).

So on MPU Arm32/64 now we will stop the domain creation if NONE is passed, =
is that the behaviour
you are expecting for DOMCTL v8r_el1_msa? (Ideally we should not get this b=
ecause we will switch
during DT parse)

Cheers,
Luca


