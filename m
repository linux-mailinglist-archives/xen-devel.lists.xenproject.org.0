Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9HA4B0O88WnmkAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 10:07:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7EF490F9C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 10:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297079.1573221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHzwb-0008Ll-Sl; Wed, 29 Apr 2026 08:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297079.1573221; Wed, 29 Apr 2026 08:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHzwb-0008JV-PN; Wed, 29 Apr 2026 08:06:53 +0000
Received: by outflank-mailman (input) for mailman id 1297079;
 Wed, 29 Apr 2026 08:06:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wHzwZ-0008JP-W3
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 08:06:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHzwZ-00ArsV-7c
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 10:06:51 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f1bc1a-e002-0a2a0a5209dd-0a2a45079bf6-4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 10:06:50 +0200
Received: from [52.101.66.48]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f1bc1a-229c-0a2a45070019-3465423004d2-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 10:06:50 +0200
Received: from DUZPR01CA0166.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::9) by AM8PR08MB6514.eurprd08.prod.outlook.com
 (2603:10a6:20b:36b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 08:06:47 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::88) by DUZPR01CA0166.outlook.office365.com
 (2603:10a6:10:4b3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 08:06:47 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Wed, 29 Apr 2026 08:06:47 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV2PR08MB9877.eurprd08.prod.outlook.com (2603:10a6:150:dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 08:05:35 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 08:05:34 +0000
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
 b=LxBaWzzLsJ5grleqCDinsOiBxEBa6QXR6HZAUTbwdFJ2liFeGXQ+XpRm73gJmGIW1NPNOgB2yHFTKT/HIRxpmy5bwNM2R8f3SblbkmTJhcC3sI3djHgr8lKUeBpR9k7eqW9D5vNh8ngf2KV1jvdN+bYXpzv9aLPyrYofI9bpiJFjlOGQpAC7spXfNAuYuCamCndw1teuzWk9x03R5TS1tBytrCwk5iqkSjQ1QaTvSFPV+ks57uLqrCSlzDU+K2mr2aJv623lWwXp3WNFwQseY9y3w8VRt5qfFKpFWwkzBfrxpzWjloS7JUakudG5ygRoSu9xbCHgUVUHsZ+Mvz8cAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr8Pm8/NKa+24lezy+EKDImorLwg1JXEhQkUdafYVug=;
 b=QSxYhG8+zt3YisB7Q7DFycVQRgfaI2S2Hjszah7J7S+1+7kmmCoMWqcD0PnlHCkJU/u90qBq3kNK7SX+UxFeJPjsIzGS55mWlbg8y44YtqWL5xY4ky0cjnWFQYl7anH34k2VfS3M2aZSoiqQDAFdU8EwrBEpanYAIJ3FWLca02hhUQioQrYc3X6vGDgTd3uxiMM2dft1lEi5TT+1+vZ041+DLusWqGo1rwR/d0TxAI9VLem9gsb5jRDr8cISWtPqVfiXaWE8matFfCuXkuZWYGmbyUfmUCslEa/Q90rrAaix0aQafYT//C7GmyhBk5DcZIo/mb8iQV2O3TwAsLOqbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pr8Pm8/NKa+24lezy+EKDImorLwg1JXEhQkUdafYVug=;
 b=QbO0P5SrhcSqKZ2WcKCLHv3r1THQRcxwNAPGMum9f3ilc8cedW3eBLHM8/lbAPfAl3anv2eIsm51CxOFmPcosK/ERS3CXV1Zs+cGg8Ea3jplStRh1jGujDvBoEKWTlVvRflzK872/qMyZfGauikO1ODl5CNY/Su2g+w4wn4X9jg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aa6qgi0p86R74p/+Kc6an/NB46yEiZ2gR9OSOTFcIaw8l4uOJUPT7chB9nELfmORrckEgRbpQYlIvD7XP/90VhQFALdBTTPfuOqUmFaLfPTnHgtMDFDI1qUDje7jSXs3X1WKiI+CshIXss8FdV+8Tmq9/KXTkgae5JL6dhXAOEfAXU12/4VmbZ2qcEvj2KOINLYbrJYnthiR9Rw7UiKM1Jwrg/mk9lCzBBQQI7uqt0evoych+YZwUJGzFqzu1uP9UOFLHv0aYFv+fe3/Mo/BORzXIP5+vl2PN29dtrMBGRHv0hVqRIwQEXIJpB41wvdKaXdjjCCQNJA8UuBCh4ErXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr8Pm8/NKa+24lezy+EKDImorLwg1JXEhQkUdafYVug=;
 b=fJRddfdfWXEy3OU+CKmkDGTVWhQlmiVQGaBmpGNk1y21dtG0K/VeUFo3sfnvCHxlbzkndcX4bQ0HJBNSYDMWqWxYWWhr6xU9NCqLeuoKYAuTGPNfebZpkcg5ZPPxFbQn33iMPUQ+aMMq/tnacm2oBP3vI2fcr+iteW0qRJUueZSY0doHKWtgt9A1mGplgYx4YjllZcjvAN8zKI/H7WJIDdI7Qsw3gvcSejtnlh3dhmLScRFaCeTqs5mXRCZH/i/lkq/TNe3Dfrdkmv3MTn1y9DK3x3x53UkgaM2NDVQ7ybc9IQ8rrGLZUTU65se32iJD8viRsy7cPwl3qkmroW0C6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pr8Pm8/NKa+24lezy+EKDImorLwg1JXEhQkUdafYVug=;
 b=QbO0P5SrhcSqKZ2WcKCLHv3r1THQRcxwNAPGMum9f3ilc8cedW3eBLHM8/lbAPfAl3anv2eIsm51CxOFmPcosK/ERS3CXV1Zs+cGg8Ea3jplStRh1jGujDvBoEKWTlVvRflzK872/qMyZfGauikO1ODl5CNY/Su2g+w4wn4X9jg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH v8 13/13] xen/arm: Add support for system suspend
 triggered by hardware domain
Thread-Topic: [PATCH v8 13/13] xen/arm: Add support for system suspend
 triggered by hardware domain
Thread-Index: AQHc167zncnUxfR+NEuj/SeXUCIftA==
Date: Wed, 29 Apr 2026 08:05:34 +0000
Message-ID: <4977CF18-39CC-4CC0-936A-890BAE5E8615@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <9b0f8922cd33df2b8e8038d639c1b8d8d73ce401.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <9b0f8922cd33df2b8e8038d639c1b8d8d73ce401.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV2PR08MB9877:EE_|DB1PEPF000509FE:EE_|AM8PR08MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: cdd0818a-ec3a-4926-ed57-08dea5c6429e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 JIITL+e89cxZacdUQZ5XpmY8ZS4po5TvqpvT5xe+c+y31UAWadl6qf4leloGgpcKZM9FHMXhIaSZxkXr1akZjCyOPOGgLbL9t79FMgNaFJvfsOeSVx2+Kd7vWhthGUr6PsY1Niv3oXfOrz2QjVZTSLhtjNTEPQkzWZEzwY28xYAJlb0xZtf4dflKcTrNRkawn31PE2LK9quJhSFG7bU45kDWxlYBbYlAY/ovMhbO69wr2J58XLz71JKVaFZ+Cjy1rwrXggvUcDVfN6ygmQnG6rbnPZYWj8QfVORQ4/OXLmrqtNENCiIckdeucK+UwFsYj0aPGy/qIfml/uLa44WtwPeOnIpOtTvqTyRIM4Zq0tQmdFT357ct8MenFKTxV1Ag5tPgfzCsNh+hFvVrh7J/7fsH+7lWFyVWsJGlRh56zf5tGJsHYbZ6P/JPjcaYGSHs+8uJJ5flFg9+H2CdXSJk3xg4oKILGKYR/Q7sXE4tucncH0Mq0ejewhwH1wQWT6iLXmgMX8N6s3tEAbu2eJA6eTq2BlwPw1ETTXmSH0r+dDj4kKB3NKYjbB2W2VPtHBrtPpVkBZHlvWOINKzwLu5awXdlHDwSFKTmKyKx9VcFCdBUUd/SPUv8G8Iw+ni7Rt9GujPDl4EUIO2Z/aSeuDuhnmYdIuNvBI+OCK9qAm5uwzkEJffZSscjF4rmr4IxfOV+XCFjyiPdiOfXjEH3BdFSY/VbbQuwL3yVSUrf2T+u1zPg3f7GdoYxZLpJt2ULekrQP5aGUGa76UF9C5cI2BlmbNKSErUKGWWKfoXfmQBOXOw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <60B80AA0D2AED34D96DC8F8173629E9C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 G7kpOkeGSYf6/NJ/2JNpFx7sUnsZ12XvfVc3Fb6s6C4dp+Ll8iZiRdfF4vAKr7dVQxASyWcwB4ylT6RI+0l1KQqF72Nf56fmaTIBoGYKyqR/24AmIyDghtrXw5/7vtv1l0LiRUFuJNfQgZOhcvSPsyRh8AbFyRIB5339FZnJVry42P4X1luH+ukDV9T6IJCBAQqxnlw6XJ5cP0F/jaA9ILZBAN8sezV70PwjyGYybZQ6dchQ4f/GroKYV7AiBDR0eRDi/K25dP8tb8/M/ooW3GEGNc/5p2wn6j3yAi1dH1i17A5z2w452LGeLbhyOFw2utrAAPTh4z3xmlBYcw6f1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9877
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d4f275e1-6f6e-4cf5-4098-08dea5c61766
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700016|82310400026|1800799024|7416014|376014|14060799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7Lp/v6SYZgULEPleOxQvixQmOTcJ0PrMzup1Bovdi0IEOsFQqxkoI67WOVMVdZYlD/XUV2P9oNHSmZRE91y7jHB/lbX4bO5rfYmvfec2U5nLwTkR3DH+0sIH9cNA6mq+tIotOepBdquBXmvD2zB79ApPv1NQk+imB/K9fSqqtVi/laPWTy8e74weEXqhnAev2O27Kc9SXs/DMxCkOVBHxssq4wTnM6lqtEDY0f8UQHfk7SgaBxssjXFnJa/WDOeoy1GQNSicZmbEH38eAnwYM4Z5eV4qie5z/bjZv5ZspYS6zJM1ChzKW4kXRAmieBUSTLtwpmDfvOqaohUGo6UAs4o7bhsJastP9s7b1BIP0kDTmNaZUop3vfnpRM0KQqJsXCB7b/QM6mwrEBkuUOg1illFT+d2hBOHZEdTwI4nm6vMOHy5CnhekCvuJqpkRJz6ztvzjDR4BYMEE6K8ixrqiiGgUc2T3wBB8mtAkzN3SsIsmslkf13aEuXlOqaBR+rsiLg3N9mqdK9b73tmaMc52MWw86tA+uaRQb2vDGA7i4h3Xo6QYa2/EajFFeRUMs+6GXYsCXRRbHmq/fS0qxqBTySdVcU8eRJ3zd2AMMpWTTu7uiiiB5AOcku6szbmA9RfX3fCpQegpJ+hqkfh48fzvlmzqqsJOHr5kJL9J/AcgVBMqtm7W05AxfX0D0gx/cLNSIVRErLWVtByHSRZPx+I2gOogWw7CTeoZS0Mu4BG9p8Dnm/j74jFAlkAWQoA0KmcPgcMGBw+JDI999uo3WUnvA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(82310400026)(1800799024)(7416014)(376014)(14060799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z1SpbKIwYFjKeFgexz9CS12J0nEcMbs9AlHgESXfkV56K2IXb3LxX0W+f18CXW4TcjR7FrRxpYhcytJ1bSL+xMssT2rckHJlW8N6YzjymaHHw0/HU4cfcBIVK7PzYiFFsRWClsjkMJcCd0qwtB0B0gp/4if9L3yPNQYt8k0TLZGfUkpz5Jo5DsHUINJDE130Ra+o3M5ZknPdMDHeBV0fki7ID9ZN/UfNjNKQcPkyABmY2Qp6ys9Ayxgz97cS+TgNheFbT3o6DeFZQcNWApYnenbakE/Zh+i83mw2r9Ap5LNhGlvzd+qAky8UvDEn5jc4Cy7smIZN6MV0mpqXVaQ5yLKItN9dcnWthm52lIATWucjlpOJOtGDhcIrX4rloz6cqK75aqyVrhp8ZXTd7F2L1ayY1J6sk5t2yKmmtvSRPdSxINc6/WXoTzM2Yu+Phi1W
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 08:06:47.1885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd0818a-ec3a-4926-ed57-08dea5c6429e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6514
X-purgate-ID: tlsNG-ef75cf/1777450010-AFB78C48-469EB9CF/0/0
X-purgate-type: clean
X-purgate-size: 13734
X-Rspamd-Queue-Id: 2E7EF490F9C
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
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:Rahul.Singh@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-0.961];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,system_suspend_tasklet.data:url]

SGkgTXlrb2xhLA0KDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc3VzcGVuZC5jIGIveGVu
L2FyY2gvYXJtL3N1c3BlbmQuYw0KPiBpbmRleCBlMzg1NjZiMGI3Li40ZDEyODk3NzZiIDEwMDY0
NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vc3VzcGVuZC5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9z
dXNwZW5kLmMNCj4gQEAgLTEsOSArMSwxOTAgQEANCj4gLyogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seSAqLw0KPiANCj4gKyNpbmNsdWRlIDxhc20vcHNjaS5oPg0KPiAjaW5j
bHVkZSA8YXNtL3N1c3BlbmQuaD4NCj4gDQo+ICsjaW5jbHVkZSA8cHVibGljL3NjaGVkLmg+DQo+
ICsjaW5jbHVkZSA8eGVuL2NvbnNvbGUuaD4NCj4gKyNpbmNsdWRlIDx4ZW4vY3B1Lmg+DQo+ICsj
aW5jbHVkZSA8eGVuL2Vycm5vLmg+DQo+ICsjaW5jbHVkZSA8eGVuL2lvbW11Lmg+DQo+ICsjaW5j
bHVkZSA8eGVuL3NjaGVkLmg+DQo+ICsjaW5jbHVkZSA8eGVuL3Rhc2tsZXQuaD4NCj4gKw0KPiBz
dHJ1Y3QgY3B1X2NvbnRleHQgY3B1X2NvbnRleHQgPSB7fTsNCj4gDQo+ICtzdGF0aWMgaW50IGNh
bl9zeXN0ZW1fc3VzcGVuZCh2b2lkKQ0KPiArew0KPiArICAgIGludCByZXQgPSAwOw0KPiArICAg
IHN0cnVjdCBkb21haW4gKmQ7DQo+ICsNCj4gKyAgICByY3VfcmVhZF9sb2NrKCZkb21saXN0X3Jl
YWRfbG9jayk7DQo+ICsNCj4gKyAgICBmb3JfZWFjaF9kb21haW4gKCBkICkNCj4gKyAgICB7DQo+
ICsgICAgICAgIGJvb2wgZG9tYWluX3N1c3BlbmRlZDsNCj4gKw0KPiArICAgICAgICBzcGluX2xv
Y2soJmQtPnNodXRkb3duX2xvY2spOw0KPiArICAgICAgICBkb21haW5fc3VzcGVuZGVkID0gZC0+
aXNfc2h1dF9kb3duICYmDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBkLT5zaHV0ZG93
bl9jb2RlID09IFNIVVRET1dOX3N1c3BlbmQ7DQo+ICsgICAgICAgIHNwaW5fdW5sb2NrKCZkLT5z
aHV0ZG93bl9sb2NrKTsNCj4gKw0KPiArICAgICAgICBpZiAoIGRvbWFpbl9zdXNwZW5kZWQgKQ0K
PiArICAgICAgICAgICAgY29udGludWU7DQo+ICsNCj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19F
UlINCj4gKyAgICAgICAgICAgICAgICJTeXN0ZW0gc3VzcGVuZCByZXF1aXJlcyBhbGwgZG9tYWlu
cyB0byBiZSBzaHV0IGRvd24gZm9yIHN1c3BlbmQgKGRvbSVkOiBpc24ndCBpbiBzdXNwZW5kIHN0
YXRlKVxuIiwNCg0KZC0+ZG9tYWluX2lkIGlzIHVuc2lnbmVkIGlmIEnigJltIG5vdCBtaXN0YWtl
biwgaXQgd2FudHMgJXUgKHR5cGVkZWYgdWludDE2X3QgZG9taWRfdDspDQoNCj4gKyAgICAgICAg
ICAgICAgIGQtPmRvbWFpbl9pZCk7DQo+ICsNCj4gKyAgICAgICAgcmV0ID0gLUVCVVNZOw0KPiAr
ICAgICAgICBicmVhazsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICByY3VfcmVhZF91bmxvY2soJmRv
bWxpc3RfcmVhZF9sb2NrKTsNCj4gKw0KPiArICAgIHJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4g
Ky8qIFhlbiBzdXNwZW5kLiBkYXRhIGlkZW50aWZpZXMgdGhlIGRvbWFpbiB0aGF0IGluaXRpYXRl
ZCBzdXNwZW5kLiAqLw0KPiArc3RhdGljIHZvaWQgc3lzdGVtX3N1c3BlbmQodm9pZCAqZGF0YSkN
Cj4gK3sNCj4gKyAgICBpbnQgc3RhdHVzOw0KPiArICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+
ICsgICAgc3RydWN0IGRvbWFpbiAqZCA9IChzdHJ1Y3QgZG9tYWluICopZGF0YTsNCj4gKw0KPiAr
ICAgIEJVR19PTihzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX2FjdGl2ZSk7DQo+ICsNCj4gKyAg
ICBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVfc3VzcGVuZDsNCj4gKw0KPiArICAgIHByaW50aygi
WGVuIHN1c3BlbmRpbmcuLi5cbiIpOw0KPiArDQo+ICsgICAgZnJlZXplX2RvbWFpbnMoKTsNCj4g
KyAgICBzY2hlZHVsZXJfZGlzYWJsZSgpOw0KPiArDQo+ICsgICAgc3RhdHVzID0gY2FuX3N5c3Rl
bV9zdXNwZW5kKCk7DQo+ICsgICAgaWYgKCBzdGF0dXMgKQ0KPiArICAgIHsNCj4gKyAgICAgICAg
c3lzdGVtX3N0YXRlID0gU1lTX1NUQVRFX3Jlc3VtZTsNCj4gKyAgICAgICAgZ290byByZXN1bWVf
c2NoZWR1bGVyOw0KDQpXaGVuIHdlIGhhdmUgYW4gZXJyb3IgYW5kIHdlIGdldCB0aGUgcmVzdW1l
X3NjaGVkdWxlciBwYXRoLCB3ZSBhcHBseSBiYWNrIHRoZQ0KY29udGV4dCBvZiB0aGUgZ3Vlc3Qg
c2F2ZWQgcHJldmlvdXNseSBpbiBkb19wc2NpXzFfMF9zeXN0ZW1fc3VzcGVuZCgpLCBzbyBhbSBJ
DQpjb3JyZWN0IHNheWluZyB0aGUgZ3Vlc3Qgd29u4oCZdCBnZXQgYW55IFBTQ0kgZXJyb3IgYmFj
ayBhbmQgd2UgcmVzdW1lIHRoZSBndWVzdA0KZnJvbSB0aGUgZ3Vlc3QgcmVzdW1lIGVudHJ5cG9p
bnQ/DQoNCkluIGNhc2UsIHNob3VsZCB3ZSBoYXZlIGEgZGlmZmVyZW50IHBhdGggdGhhdCByZXR1
cm5zIGEgUFNDSSBlcnJvciAoUFNDSV8qKSBpbnRvIHRoZSBndWVzdA0KeDAsIGFuZCBza2lwcyB0
aGUgY29udGV4dCByZXN0b3JlPw0KDQo+ICsgICAgfQ0KPiArDQo+ICsgICAgLyoNCj4gKyAgICAg
KiBOb24tYm9vdCBDUFVzIGhhdmUgdG8gYmUgZGlzYWJsZWQgb24gc3VzcGVuZCBhbmQgZW5hYmxl
ZCBvbiByZXN1bWUNCj4gKyAgICAgKiAoaG90cGx1Zy1iYXNlZCBtZWNoYW5pc20pLiBEaXNhYmxp
bmcgbm9uLWJvb3QgQ1BVcyB3aWxsIGxlYWQgdG8gUFNDSQ0KPiArICAgICAqIENQVV9PRkYgdG8g
YmUgY2FsbGVkIGJ5IGVhY2ggbm9uLWJvb3QgQ1BVLiBEZXBlbmRpbmcgb24gdGhlIHVuZGVybHlp
bmcNCj4gKyAgICAgKiBwbGF0Zm9ybSBjYXBhYmlsaXRpZXMsIHRoaXMgbWF5IGxlYWQgdG8gdGhl
IHBoeXNpY2FsIHBvd2VyaW5nIGRvd24gb2YNCj4gKyAgICAgKiBDUFVzLg0KPiArICAgICAqLw0K
PiArICAgIHN0YXR1cyA9IGRpc2FibGVfbm9uYm9vdF9jcHVzKCk7DQo+ICsgICAgaWYgKCBzdGF0
dXMgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgc3lzdGVtX3N0YXRlID0gU1lTX1NUQVRFX3Jlc3Vt
ZTsNCj4gKyAgICAgICAgZ290byByZXN1bWVfbm9uYm9vdF9jcHVzOw0KPiArICAgIH0NCj4gKw0K
PiArICAgIHRpbWVfc3VzcGVuZCgpOw0KPiArDQo+ICsgICAgc3RhdHVzID0gaW9tbXVfc3VzcGVu
ZCgpOw0KPiArICAgIGlmICggc3RhdHVzICkNCj4gKyAgICB7DQo+ICsgICAgICAgIHN5c3RlbV9z
dGF0ZSA9IFNZU19TVEFURV9yZXN1bWU7DQo+ICsgICAgICAgIGdvdG8gcmVzdW1lX3RpbWU7DQo+
ICsgICAgfQ0KPiArDQo+ICsgICAgY29uc29sZV9zdGFydF9zeW5jKCk7DQo+ICsgICAgc3RhdHVz
ID0gY29uc29sZV9zdXNwZW5kKCk7DQo+ICsgICAgaWYgKCBzdGF0dXMgKQ0KPiArICAgIHsNCj4g
KyAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCAiRmFpbGVkIHRvIHN1c3BlbmQgdGhlIGNvbnNv
bGUsIGVycj0lZFxuIiwgc3RhdHVzKTsNCj4gKyAgICAgICAgc3lzdGVtX3N0YXRlID0gU1lTX1NU
QVRFX3Jlc3VtZTsNCj4gKyAgICAgICAgZ290byByZXN1bWVfZW5kX3N5bmM7DQo+ICsgICAgfQ0K
PiArDQo+ICsgICAgbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOw0KPiArICAgIHN0YXR1cyA9IGdpY19z
dXNwZW5kKCk7DQo+ICsgICAgaWYgKCBzdGF0dXMgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgc3lz
dGVtX3N0YXRlID0gU1lTX1NUQVRFX3Jlc3VtZTsNCj4gKyAgICAgICAgZ290byByZXN1bWVfaXJx
czsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICBzZXRfaW5pdF90dGJyKHhlbl9wZ3RhYmxlKTsNCj4g
Kw0KPiArICAgIC8qDQo+ICsgICAgICogRW5hYmxlIGlkZW50aXR5IG1hcHBpbmcgYmVmb3JlIGVu
dGVyaW5nIHN1c3BlbmQgdG8gc2ltcGxpZnkNCj4gKyAgICAgKiB0aGUgcmVzdW1lIHBhdGgNCj4g
KyAgICAgKi8NCj4gKyAgICB1cGRhdGVfYm9vdF9tYXBwaW5nKHRydWUpOw0KPiArDQo+ICsgICAg
aWYgKCBwcmVwYXJlX3Jlc3VtZV9jdHgoJmNwdV9jb250ZXh0KSApDQo+ICsgICAgew0KPiArICAg
ICAgICBzdGF0dXMgPSBjYWxsX3BzY2lfc3lzdGVtX3N1c3BlbmQoKTsNCj4gKyAgICAgICAgLyoN
Cj4gKyAgICAgICAgICogSWYgc3VzcGVuZCBpcyBmaW5hbGl6ZWQgcHJvcGVybHkgYnkgYWJvdmUg
c3lzdGVtIHN1c3BlbmQgUFNDSSBjYWxsLA0KPiArICAgICAgICAgKiB0aGUgY29kZSBiZWxvdyBp
biB0aGlzICdpZicgYnJhbmNoIHdpbGwgbmV2ZXIgZXhlY3V0ZS4gRXhlY3V0aW9uDQo+ICsgICAg
ICAgICAqIHdpbGwgY29udGludWUgZnJvbSBoeXBfcmVzdW1lIHdoaWNoIGlzIHRoZSBoeXBlcnZp
c29yJ3MgcmVzdW1lIHBvaW50Lg0KPiArICAgICAgICAgKiBJbiBoeXBfcmVzdW1lIENQVSBjb250
ZXh0IHdpbGwgYmUgcmVzdG9yZWQgYW5kIHNpbmNlIGxpbmstcmVnaXN0ZXIgaXMNCj4gKyAgICAg
ICAgICogcmVzdG9yZWQgYXMgd2VsbCwgaXQgd2lsbCBhcHBlYXIgdG8gcmV0dXJuIGZyb20gcHJl
cGFyZV9yZXN1bWVfY3R4Lg0KPiArICAgICAgICAgKiBUaGUgZGlmZmVyZW5jZSBpbiByZXR1cm5p
bmcgZnJvbSBwcmVwYXJlX3Jlc3VtZV9jdHggb24gc3lzdGVtIHN1c3BlbmQNCj4gKyAgICAgICAg
ICogdmVyc3VzIHJlc3VtZSBpcyBpbiBmdW5jdGlvbidzIHJldHVybiB2YWx1ZTogb24gc3VzcGVu
ZCwgdGhlIHJldHVybg0KPiArICAgICAgICAgKiB2YWx1ZSBpcyBhIG5vbi16ZXJvIHZhbHVlLCBv
biByZXN1bWUgaXQgaXMgemVyby4gVGhhdCBpcyB3aHkgdGhlDQo+ICsgICAgICAgICAqIGNvbnRy
b2wgZmxvdyB3aWxsIG5vdCByZS1lbnRlciB0aGlzICdpZicgYnJhbmNoIG9uIHJlc3VtZS4NCj4g
KyAgICAgICAgICovDQo+ICsgICAgICAgIGlmICggc3RhdHVzICkNCj4gKyAgICAgICAgICAgIGRw
cmludGsoWEVOTE9HX1dBUk5JTkcsICJQU0NJIHN5c3RlbSBzdXNwZW5kIGZhaWxlZCwgZXJyPSVk
XG4iLA0KPiArICAgICAgICAgICAgICAgICAgICBzdGF0dXMpOw0KPiArICAgIH0NCj4gKw0KPiAr
ICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9yZXN1bWU7DQo+ICsgICAgdXBkYXRlX2Jvb3Rf
bWFwcGluZyhmYWxzZSk7DQo+ICsNCj4gKyAgICBnaWNfcmVzdW1lKCk7DQo+ICsNCj4gKyByZXN1
bWVfaXJxczoNCj4gKyAgICBsb2NhbF9pcnFfcmVzdG9yZShmbGFncyk7DQo+ICsNCj4gKyAgICBj
b25zb2xlX3Jlc3VtZSgpOw0KPiArIHJlc3VtZV9lbmRfc3luYzoNCj4gKyAgICBjb25zb2xlX2Vu
ZF9zeW5jKCk7DQo+ICsNCj4gKyAgICBpb21tdV9yZXN1bWUoKTsNCj4gKw0KPiArIHJlc3VtZV90
aW1lOg0KPiArICAgIHRpbWVfcmVzdW1lKCk7DQo+ICsNCj4gKyByZXN1bWVfbm9uYm9vdF9jcHVz
Og0KPiArICAgIC8qDQo+ICsgICAgICogVGhlIHJjdV9iYXJyaWVyKCkgaGFzIHRvIGJlIGFkZGVk
IHRvIGVuc3VyZSB0aGF0IHRoZSBwZXIgY3B1IGFyZWEgaXMNCj4gKyAgICAgKiBmcmVlZCBiZWZv
cmUgYSBub24tYm9vdCBDUFUgdHJpZXMgdG8gaW5pdGlhbGl6ZSBpdCAoX2ZyZWVfcGVyY3B1X2Fy
ZWEoKQ0KPiArICAgICAqIGhhcyB0byBiZSBjYWxsZWQgYmVmb3JlIHRoZSBpbml0X3BlcmNwdV9h
cmVhKCkpLiBUaGlzIHNjZW5hcmlvIG9jY3Vycw0KPiArICAgICAqIHdoZW4gbm9uLWJvb3QgQ1BV
cyBhcmUgaG90LXVucGx1Z2dlZCBvbiBzdXNwZW5kIGFuZCBob3RwbHVnZ2VkIG9uIHJlc3VtZS4N
Cj4gKyAgICAgKi8NCj4gKyAgICByY3VfYmFycmllcigpOw0KPiArICAgIGVuYWJsZV9ub25ib290
X2NwdXMoKTsNCj4gKw0KPiArIHJlc3VtZV9zY2hlZHVsZXI6DQo+ICsgICAgc2NoZWR1bGVyX2Vu
YWJsZSgpOw0KPiArICAgIHRoYXdfZG9tYWlucygpOw0KPiArDQo+ICsgICAgc3lzdGVtX3N0YXRl
ID0gU1lTX1NUQVRFX2FjdGl2ZTsNCj4gKw0KPiArICAgIHByaW50aygiUmVzdW1lIChzdGF0dXMg
JWQpXG4iLCBzdGF0dXMpOw0KPiArDQo+ICsgICAgZG9tYWluX3Jlc3VtZShkKTsNCj4gK30NCj4g
Kw0KPiArc3RhdGljIERFQ0xBUkVfVEFTS0xFVChzeXN0ZW1fc3VzcGVuZF90YXNrbGV0LCBzeXN0
ZW1fc3VzcGVuZCwgTlVMTCk7DQo+ICsNCj4gK3ZvaWQgaG9zdF9zeXN0ZW1fc3VzcGVuZChzdHJ1
Y3QgZG9tYWluICpkKQ0KPiArew0KPiArICAgIHN5c3RlbV9zdXNwZW5kX3Rhc2tsZXQuZGF0YSA9
ICh2b2lkICopZDsNCj4gKyAgICAvKg0KPiArICAgICAqIFRoZSBzdXNwZW5kIHByb2NlZHVyZSBo
YXMgdG8gYmUgZmluYWxpemVkIGJ5IHRoZSBwQ1BVIzAgKG5vbi1ib290IHBDUFVzDQo+ICsgICAg
ICogd2lsbCBiZSBkaXNhYmxlZCBkdXJpbmcgdGhlIHN1c3BlbmQpLg0KPiArICAgICAqLw0KPiAr
ICAgIHRhc2tsZXRfc2NoZWR1bGVfb25fY3B1KCZzeXN0ZW1fc3VzcGVuZF90YXNrbGV0LCAwKTsN
Cj4gK30NCj4gKw0KPiAvKg0KPiAgKiBMb2NhbCB2YXJpYWJsZXM6DQo+ICAqIG1vZGU6IEMNCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92cHNjaS5jIGIveGVuL2FyY2gvYXJtL3Zwc2NpLmMN
Cj4gaW5kZXggYmQ4N2VjNDMwZC4uOGZiOTE3MjE4NiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gv
YXJtL3Zwc2NpLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL3Zwc2NpLmMNCj4gQEAgLTUsNiArNSw3
IEBADQo+IA0KPiAjaW5jbHVkZSA8YXNtL2N1cnJlbnQuaD4NCj4gI2luY2x1ZGUgPGFzbS9kb21h
aW4uaD4NCj4gKyNpbmNsdWRlIDxhc20vc3VzcGVuZC5oPg0KPiAjaW5jbHVkZSA8YXNtL3ZnaWMu
aD4NCj4gI2luY2x1ZGUgPGFzbS92cHNjaS5oPg0KPiAjaW5jbHVkZSA8YXNtL2V2ZW50Lmg+DQo+
IEBAIC0yMzIsOCArMjMzLDcgQEAgc3RhdGljIGludDMyX3QgZG9fcHNjaV8xXzBfc3lzdGVtX3N1
c3BlbmQocmVnaXN0ZXJfdCBlcG9pbnQsIHJlZ2lzdGVyX3QgY2lkKQ0KPiAgICAgaWYgKCBpc182
NGJpdF9kb21haW4oZCkgJiYgaXNfdGh1bWIgKQ0KPiAgICAgICAgIHJldHVybiBQU0NJX0lOVkFM
SURfQUREUkVTUzsNCj4gDQo+IC0gICAgLyogU1lTVEVNX1NVU1BFTkQgaXMgbm90IHN1cHBvcnRl
ZCBmb3IgdGhlIGhhcmR3YXJlIGRvbWFpbiB5ZXQgKi8NCj4gLSAgICBpZiAoIGlzX2hhcmR3YXJl
X2RvbWFpbihkKSApDQo+ICsgICAgaWYgKCAhSVNfRU5BQkxFRChDT05GSUdfU1lTVEVNX1NVU1BF
TkQpICYmIGlzX2hhcmR3YXJlX2RvbWFpbihkKSApDQo+ICAgICAgICAgcmV0dXJuIFBTQ0lfTk9U
X1NVUFBPUlRFRDsNCj4gDQo+ICAgICAvKiBFbnN1cmUgdGhhdCBhbGwgQ1BVcyBvdGhlciB0aGFu
IHRoZSBjYWxsaW5nIG9uZSBhcmUgb2ZmbGluZSAqLw0KPiBAQCAtMjY2LDYgKzI2Niw5IEBAIHN0
YXRpYyBpbnQzMl90IGRvX3BzY2lfMV8wX3N5c3RlbV9zdXNwZW5kKHJlZ2lzdGVyX3QgZXBvaW50
LCByZWdpc3Rlcl90IGNpZCkNCj4gICAgICAgICAgICAgIlNZU1RFTV9TVVNQRU5EIHJlcXVlc3Rl
ZCwgZXBvaW50PSUjIlBSSXJlZ2lzdGVyIiwgY2lkPSUjIlBSSXJlZ2lzdGVyIlxuIiwNCj4gICAg
ICAgICAgICAgZXBvaW50LCBjaWQpOw0KPiANCj4gKyAgICBpZiAoIGlzX2NvbnRyb2xfZG9tYWlu
KGQpICkNCg0KV2h5IGlzX2NvbnRyb2xfZG9tYWluKCkgaGVyZSBhbmQgbm90IGlzX2hhcmR3YXJl
X2RvbWFpbigpID8NCg0KPiArICAgICAgICBob3N0X3N5c3RlbV9zdXNwZW5kKGQpOw0KPiArDQo+
ICAgICByZXR1cm4gcmM7DQo+IH0NCj4gDQo+IEBAIC0yOTAsNyArMjkzLDEwIEBAIHN0YXRpYyBp
bnQzMl90IGRvX3BzY2lfMV8wX2ZlYXR1cmVzKHVpbnQzMl90IHBzY2lfZnVuY19pZCkNCj4gICAg
ICAgICByZXR1cm4gMDsNCj4gICAgIGNhc2UgUFNDSV8xXzBfRk4zMl9TWVNURU1fU1VTUEVORDoN
Cj4gICAgIGNhc2UgUFNDSV8xXzBfRk42NF9TWVNURU1fU1VTUEVORDoNCj4gLSAgICAgICAgcmV0
dXJuIGlzX2hhcmR3YXJlX2RvbWFpbihjdXJyZW50LT5kb21haW4pID8gUFNDSV9OT1RfU1VQUE9S
VEVEIDogMDsNCj4gKyAgICAgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19TWVNURU1fU1VTUEVO
RCkgfHwNCj4gKyAgICAgICAgICAgICAhaXNfaGFyZHdhcmVfZG9tYWluKGN1cnJlbnQtPmRvbWFp
bikgKQ0KDQpTaG91bGQgdGhpcyBoYXZlIGFsc28gdGhlIGNvbmRpdGlvbiB0aGF0IOKAnGlzIGhh
cmR3YXJlIGRvbWFpbiBhbmQgcHNjaV92ZXIgPj0gUFNDSV9WRVJTSU9OKDEsIDAp4oCdPw0KT3Ro
ZXJ3aXNlIGlmIHRoZSBob3N0IG1hY2hpbmUgZG9lc3Ru4oCZdCBzdXBwb3J0IFBTQ0kgMS4wIHdl
IHdvdWxkIHJldHVybiBPSyBoZXJlIGJ1dCB0aGUgY2FsbCB3b3VsZA0KZmFpbCBsYXRlciBpbiBj
YWxsX3BzY2lfc3lzdGVtX3N1c3BlbmQoKT8gDQoNCj4gKyAgICAgICAgICAgIHJldHVybiAwOw0K
PiArICAgICAgICBmYWxsdGhyb3VnaDsNCj4gICAgIGRlZmF1bHQ6DQo+ICAgICAgICAgcmV0dXJu
IFBTQ0lfTk9UX1NVUFBPUlRFRDsNCj4gICAgIH0NCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24v
S2NvbmZpZyBiL3hlbi9jb21tb24vS2NvbmZpZw0KPiBpbmRleCAwYTIwYWEwYTEyLi5mZWIxMzM2
ZjQ2IDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcNCj4gKysrIGIveGVuL2NvbW1v
bi9LY29uZmlnDQo+IEBAIC0xMzcsNiArMTM3LDkgQEAgY29uZmlnIEhBU19FWF9UQUJMRQ0KPiBj
b25maWcgSEFTX0ZBU1RfTVVMVElQTFkNCj4gYm9vbA0KPiANCj4gK2NvbmZpZyBIQVNfSFdET01f
U1lTVEVNX1NVU1BFTkQNCj4gKyBib29sDQo+ICsNCj4gY29uZmlnIEhBU19JT1BPUlRTDQo+IGJv
b2wNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9k
b21haW4uYw0KPiBpbmRleCBiYjllMjEwYzI4Li5kM2VkZmIyYTEzIDEwMDY0NA0KPiAtLS0gYS94
ZW4vY29tbW9uL2RvbWFpbi5jDQo+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4gQEAgLTEz
NzUsNiArMTM3NSwxMSBAQCB2b2lkIF9fZG9tYWluX2NyYXNoKHN0cnVjdCBkb21haW4gKmQpDQo+
ICAgICBkb21haW5fc2h1dGRvd24oZCwgU0hVVERPV05fY3Jhc2gpOw0KPiB9DQo+IA0KPiArc3Rh
dGljIGlubGluZSBib29sIHdhbnRfaHdkb21fc2h1dGRvd24odWludDhfdCByZWFzb24pDQo+ICt7
DQo+ICsgICAgcmV0dXJuICFJU19FTkFCTEVEKENPTkZJR19IQVNfSFdET01fU1lTVEVNX1NVU1BF
TkQpIHx8DQo+ICsgICAgICAgICAgIHJlYXNvbiAhPSBTSFVURE9XTl9zdXNwZW5kOw0KPiArfQ0K
PiANCj4gaW50IGRvbWFpbl9zaHV0ZG93bihzdHJ1Y3QgZG9tYWluICpkLCB1OCByZWFzb24pDQo+
IHsNCj4gQEAgLTEzOTEsNyArMTM5Niw3IEBAIGludCBkb21haW5fc2h1dGRvd24oc3RydWN0IGRv
bWFpbiAqZCwgdTggcmVhc29uKQ0KPiAgICAgICAgIGQtPnNodXRkb3duX2NvZGUgPSByZWFzb247
DQo+ICAgICByZWFzb24gPSBkLT5zaHV0ZG93bl9jb2RlOw0KPiANCj4gLSAgICBpZiAoIGlzX2hh
cmR3YXJlX2RvbWFpbihkKSApDQo+ICsgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgJiYg
d2FudF9od2RvbV9zaHV0ZG93bihyZWFzb24pICkNCj4gICAgICAgICBod2RvbV9zaHV0ZG93bihy
ZWFzb24pOw0KPiANCj4gICAgIGlmICggZC0+aXNfc2h1dHRpbmdfZG93biApDQo+IGRpZmYgLS1n
aXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYXJtL3NtbXUuYw0KPiBpbmRleCAyMmQzMDZkMGNiLi40NWYyOWVmOGVjIDEwMDY0
NA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jDQo+ICsrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMNCj4gQEAgLTI5NDcsNiArMjk0NywxMyBA
QCBzdGF0aWMgdm9pZCBhcm1fc21tdV9pb21tdV9kb21haW5fdGVhcmRvd24oc3RydWN0IGRvbWFp
biAqZCkNCj4geGZyZWUoeGVuX2RvbWFpbik7DQo+IH0NCj4gDQo+ICsjaWZkZWYgQ09ORklHX1NZ
U1RFTV9TVVNQRU5EDQo+ICtzdGF0aWMgaW50IGFybV9zbW11X3N1c3BlbmQodm9pZCkNCj4gK3sN
Cj4gKyByZXR1cm4gLUVOT1NZUzsNCj4gK30NCj4gKyNlbmRpZg0KDQpNYXliZSB3ZSB3YW50IHRv
IGdhdGUgdGhlIGZlYXR1cmUgYWxzbyB0byAhQ09ORklHX0FSTV9TTU1VID8gSSB3b3VsZCB3YWl0
IGZvciB0aGUgbWFpbnRhaW5lcnMNCnZpZXcgb24gdGhpcy4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoN
Cg==

