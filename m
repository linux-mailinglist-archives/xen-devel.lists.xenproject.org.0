Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBGnLsrh02mgngcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 18:39:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479513A55E2
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 18:39:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274257.1560441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9myh-0002do-L0; Mon, 06 Apr 2026 16:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274257.1560441; Mon, 06 Apr 2026 16:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9myh-0002as-ES; Mon, 06 Apr 2026 16:39:07 +0000
Received: by outflank-mailman (input) for mailman id 1274257;
 Mon, 06 Apr 2026 16:39:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w9myf-00027p-Mf
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 16:39:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9myf-001MTX-2C
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 18:39:05 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d3e1a7-bab6-0a2a0a5309dd-0a2a4506d52e-8
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 18:39:05 +0200
Received: from [52.101.66.107]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d3e1a8-0df0-0a2a45060019-3465426b20b6-4
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 18:39:04 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB6817.eurprd03.prod.outlook.com (2603:10a6:20b:2df::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 16:39:03 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.020; Mon, 6 Apr 2026
 16:39:03 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XL4mn3grunJVkdkbyFXjxE/vmJ0HlEiDuPqT2sHUim5NRCu4M7RbkG6H1T6JS3jfE8aVBhsWtwzlivXG9GHif96zzHrMk19VW7to+qAP2nY9IC3y8k9Yb56FWcFAuwOQQaGq4Or6xoxg0asXCZEmuNbTi0+MeKWoR4UYtvCIIzcGgLbWMqW5ygjSt1EWbP2OP+X/110XxESFODCLEnq/xqLtGmgrwUHiM9mWD2z5kU/gimF4OVTYO2JS5GE1dUBSiRIn/ICFlIuKWYPo4EJDyj+ENz4JqtSfygYgZpsGI6D6uaSJ/I54sUdPsNY/yxS0k90KxB5T1F0TaTPZosUKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nacdSuLgMnit26+NeXY9PeF1h2zzMcf5fo7BogXgr4U=;
 b=qZ89eZOS0SugjR2Y3TXDRVdHoN5CLrgs3GxgOyD7npzvSIv7fBI/7LulJu0fnXLby0/lJX29jOp47+hZ8cOxwEUGFwoFVGZ2kzbPiL+1lCWUGYQuO1/zgLNlTx37Tcv1xgEwqfyJyoLqvJCSHXt0ew0HG4jLD9VtR0NuBOMyCSxZkgPqhuaFmCCkJoIfxKo9VwF87k2/xH4WYEkrVCW3J9jp+lFUb3kgplsBcqTa2gLs76jo3NUGSUSkqjiVNVnYgj7bUD63ac9dfb5R0yKHF20N66tu1idq9RxCp430gvxXfwCsgS0DRW0S9ZN/xHHPCJ2EWskobk9w8RD96FCRNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nacdSuLgMnit26+NeXY9PeF1h2zzMcf5fo7BogXgr4U=;
 b=O/AqzRCfsJ/alz7jbhUi/3TztLQ+hEUirLRC5vW+rm5vUL7lrJEz80fcY0lsa6MHpVEwIQdYAtZQa5o1hbWQujL4EnQVURnKJU+ov8av7q6ESaJcnZZ7EWaEpn20fmkwtqbU8ZiGBqiN/rAPB6Ne0/SzwGm5uZjZLneDLb+I6iJmKZA7u1Ni2K62oIVCh88ewXRlPy9h7JNQd2ZKSouFcvVHWUSmQoE0nSXQ4ZGvlKgTVcx8QRwz/qUkL8jVhr9uXJQAGjIkQQwFgVszChLpWVBkM5pbg5k2kgwlMNbyklWdaqZUZ837fhV2JkFfpbiEe7tGnH8wdBcLrDb4f4Ca8Q==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v11 3/6] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v11 3/6] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHcxePgRVFXhI5qpkuIZJEl2rqVHg==
Date: Mon, 6 Apr 2026 16:39:02 +0000
Message-ID:
 <4f6427e64b0a0ce46dbf768a6fb64b0e349e2ca4.1775493499.git.oleksii_moisieiev@epam.com>
References: <cover.1775493499.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1775493499.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB6817:EE_
x-ms-office365-filtering-correlation-id: bc3fb145-af4b-48f4-89f8-08de93fb0323
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|38070700021|22082099003|56012099003;
x-microsoft-antispam-message-info:
 O1DY9zMvMqtLGwGgGDOF6KawzMEFPUS+UpTOtE9ZixgVSNlYaAh+Qfi3Yfe7RUwNmkYuf1gElPW9C+bR8mUwt0CvARtGlCukz5shViVFr0L0RsuFPcFOUle6kVRxrnWhdwYYAQjbu7K2Ym10wtpko6IcbpBecJVtspHjoxSAi9SMylaGPILik3gvVbEncd3GIv1hb5nMRKm0b/U4KkMgKMgtNzeYMzBcsbCzQZq8ElVLhdA6MCWkxSHdxaOhxs1ePmJ/acB25F8a6MU0R0j77VF99nRbdbby2fygrQu3igOz/Yuhnmo4GwDE++0c6mTriS3AbCOggYnaedbVck4oomkV79MCvqk56c3Q8gv9DayktTH1IaqwILLxjRaKlVhOu+LwMIH2Nlvn9X+VOcTE0gH6brLuwR+roetx3T+CBBQaHCJS+xoQKKqcdd3EOXkOW/sYT/NNnWCkMU9IPyRVxLFMxrsw9J3a/0j00+PsBuFKbePJRUYdl/9LreH/PP9e88MGH0VKVF2KC7nSCsG/TpMmCH6dNBzKNjet9+Lb/VYaImrq3hXNizJRhvGYyGab6HL4XfXa+95lN+5YP/N+KqJ0Ft5FYxu3zXKXt5Wz/ymMXVx1icHmFvAU01Xx1wpczm/feqzBRQL/sW07bdYIzaaEsuZnY8mzcB21OTmTzKaxZGATH75uqu9voRGL/fo0dJ5lZcHArDhqf2OkXkNCVsIxlJNXAd8klWYGKCAPlBkQ9gsQagiCTRZPfA9FzkEzPjxKPqHLyZz5a2SpXsj9AD3xEqU1ejBSDdOI6NP9zvM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(38070700021)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?G9rH2Qn4usyoeJnvmjjLjZ7hbfxG+swcpU4LI7oOEi4iidsbNU4obQj1Js?=
 =?iso-8859-1?Q?cfcfi9ax/zXmxjAYBSlLNjyrSPgnuy2mbBz+srOCBbPfVNfMsKcIkX8ihL?=
 =?iso-8859-1?Q?pWEe52Y6V1M+1itysXFOQEC+C6bsbQSuxQOnaavZSo6dlJq1iUXX4jbS0m?=
 =?iso-8859-1?Q?2m50TTPddWAimpi86ZTgdjZKJVda4Hrq9dmAc+sC+Pcy6zo8dbA4BctsQv?=
 =?iso-8859-1?Q?Y8LP4/M7sbe7DL0VgcyVcDfKw4XZPNWIVFAE9s0DHPKYOANWFIBcFN3P/T?=
 =?iso-8859-1?Q?/LRKOQmaYM1V1vC9lucQZE4L0NGCctYYpxJgKgUbFEl97G3d+BtnkMoUF5?=
 =?iso-8859-1?Q?jlopAQKR3O8+VADTefxuCU0PVHHs9q3muREG1nDVjCBX/sFH8vzBFRlC9t?=
 =?iso-8859-1?Q?owSIEp0UpQ6zAoZUmS2B4MxrRWwJnD6XJ4PeMVF3IOzL3CZkTTT8DSvYnZ?=
 =?iso-8859-1?Q?EUYoBSBE2zv4ipT6ofQza+tj4/ey42wJPXt8mjmuvAaknISw6CJowdDnmm?=
 =?iso-8859-1?Q?+ZYuFvvfO7eojc/t4uirnP1Osxb5fnECD4dFi8keMZ4+7/aUxp1w3Fpe2m?=
 =?iso-8859-1?Q?wVO43aq1/RHNcn/BjGcKXZGbdnBnk3dWyis2GIk1mqrmp6X6A6Z0nHhV45?=
 =?iso-8859-1?Q?51OR4P/141Zm3/qnbKxvtKaE5XAdsdL1r+cjR1VmrlDS4pDCM39OkmPb5K?=
 =?iso-8859-1?Q?q0ekD519+7dMM8cg5dXrLjhwiyo2LsSUf/qIciJXZQJ0TJ53dPgwkowdKu?=
 =?iso-8859-1?Q?kNFGM9uFdt79bkLEaZSo37/dHIVBDy565JHoFnvSknOP7ZLBkbtmvNRefG?=
 =?iso-8859-1?Q?M+kENgiXTAXlkO/yu+nDsPSnxAJ/tN2vpBObQD+eWbUAUFdanQ5t5vzBPn?=
 =?iso-8859-1?Q?CjovWtfXfT+GJxUq8i3P/Fn2xg87r6/1ZF05PzZn3eFAIyv8fyccZvSdtD?=
 =?iso-8859-1?Q?Fr4HOVBubswZlXHpQCQicdq/+ZIo5m+Crib5vvIOeKNsgdzHPpwcC0Oh+H?=
 =?iso-8859-1?Q?2jA96OOxpQwVPMyyuRsVeto1D9ZPCDu7B4jxWAfzYCyA9ZxFZTedrdZmbQ?=
 =?iso-8859-1?Q?nSiYv+lbq96mi2ZzII//m/OdpJWzH7oZEHxvQzmNP2guXYDOYgL5qXO6lZ?=
 =?iso-8859-1?Q?U9Q/OwYskIwVKJSyoKdgn1t8tslcKukNIhIkkh0nD5COcrfFeXffR+SAmA?=
 =?iso-8859-1?Q?nPY3lD0QFKwdm9y3NiwrTkrmPLlzW5g6Fewi/d+GgwyVGf+ZXEqWPiSUUa?=
 =?iso-8859-1?Q?lwZ94KSe20OKusiRAzIMMlEiP3xjpMDvY5MFSSdPRoPqvRWCsSzVItlZBc?=
 =?iso-8859-1?Q?nVyX1R6rJ/r3QQCIFcXiWbIuN7Z1jlhQYh1YEwQUZJaCmSVq0bJQXyqvU2?=
 =?iso-8859-1?Q?bynpVbx2ABrlSGIO0cRaPyN5b8KKrmOXUAhwjEUo5sdD+Oek7in9yrIKa9?=
 =?iso-8859-1?Q?FAQ6H1sumnyHfGVSrAC3PAyxb7G6CKY1C33+L9jVPtN29LLhtNk8R6Uh8l?=
 =?iso-8859-1?Q?NbqlHUiDestAiulp6nxdzncoUX+9aSFuDT5r5PRTVcfew6zySdKo0Y0gcV?=
 =?iso-8859-1?Q?Ewf1wHCHUIJ4Ed4w/d0Ef1612hhYPY+byUDl++8eVvI9ApK6lW35ICSCCn?=
 =?iso-8859-1?Q?r09dw6yu33cC2bCgRijJoT/y8jW0F5PsdesRs856WDFZ8elYeH/gY4XRPk?=
 =?iso-8859-1?Q?oUNCWjqnEPBhCbJTrGLv2at+46YNy8rqGE8AZVAyHKV8RpviqI4Nv7wnyf?=
 =?iso-8859-1?Q?pF2/JMNvnd2jYp37qYIisIYWym70lXAr0iANjzzLyAPUdUoTwdIE74Snni?=
 =?iso-8859-1?Q?jUn83BlW7vSqshlPu+AwfOAla8G0uF8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc3fb145-af4b-48f4-89f8-08de93fb0323
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 16:39:02.1128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3EfzXaYo2ao5+7rfmijynTWYL/Q5FfnOOKH4AZrovJVI+dpmKl4XCRb9+WeGeJWL6Je4ckbdKmx8z/QMvqOWmm9ecjQ5tKU1c4+N6NspZIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6817
X-purgate-ID: tlsNG-16d1c6/1775493545-AEB333D8-EC0B7C7B/0/0
X-purgate-type: clean
X-purgate-size: 8506
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 479513A55E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce memcpy_fromio() and memcpy_toio() helpers to copy between
regular memory and MMIO space on Arm. The generic prototypes live in
io.h so other architectures can provide their own implementations.

These helpers handle alignment safely by using ordered byte accesses for
any leading/trailing unaligned bytes and ordered 32-bit accesses for the
aligned bulk transfer. Using the ordered `readb/readl` and
`writeb/writel` accessors avoids unintended endianness conversion while
respecting device ordering requirements on ARM32/ARM64 hardware that may
not support 64-bit MMIO atomically.

The interface lives in the generic header so other architectures can
provide their own implementations (as macros or functions). The ARM
implementation is placed under `arch/arm/lib/` (mirroring the x86
reference layout) and is split into separate compilation units added via
the architecture-specific lib Makefile.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

(no changes since v10)

Changes in v10:
- removed extra include in memcpy-{to/from}io.c files

Changes in v9:
- reword commit description to refer to memcpy_fromio and memcpy_toio
- ordering obj-y in Makefile
- rename ALL_LIBS to ARCH_LIBS
- drop io.h and move definitions to the common header, fix comments to
be arch neutral
- update comments for memcpy_{from/to}io implementation

Changes in v8:
- switched to ordered accessors to address the ordering and barrier
concerns.
- updated the documentation to match the implementation and explicitly
state the supported access sizes and granularity.
- rename memcpy_* implementation files to memcpu-* to follow naming
convension
- fix indentation to match Xen style
- fix intendation to match Xen style
- move memcpy-{from/to}io to more convenient library place

Changes in v7:
- x86 guidance: removed the speculative note; header now just says
  each arch supplies its own implementation or macro.
- name spacing: dropped the double-underscore; the helpers are now
  memcpy_fromio / memcpy_toio. The header also explicitly allows an
  arch to define these as macros before including it.
- updated io.c to keep 32-bit transfers safe on arm32
- moved to __raw_read*/__raw_write* accessors to avoid endianness conversio=
n.
- split the helpers into separate compilation units

Changes in v6:
- sorted objs in Makefile alhabetically
- added newline at the end of Makefile
- used uint{N}_t intead of u{N}
- add comment about why 32 bit IO operations were used
- updated cast opertaions to avoid dropping constness which is wrong
- move function definitions to generic place so the could be reused by
other arch
- add SPDX tag to io.c

Changes in v5:
- move memcpy_toio/fromio to the generic place

 xen/arch/arm/Makefile            |  1 +
 xen/arch/arm/arch.mk             |  1 +
 xen/arch/arm/lib/Makefile        |  2 ++
 xen/arch/arm/lib/memcpy-fromio.c | 55 ++++++++++++++++++++++++++++++++
 xen/arch/arm/lib/memcpy-toio.c   | 55 ++++++++++++++++++++++++++++++++
 xen/include/xen/io.h             | 10 ++++++
 6 files changed, 124 insertions(+)
 create mode 100644 xen/arch/arm/lib/Makefile
 create mode 100644 xen/arch/arm/lib/memcpy-fromio.c
 create mode 100644 xen/arch/arm/lib/memcpy-toio.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7494a0f926..5b8e170e01 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -8,6 +8,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
 obj-y +=3D platforms/
 endif
 obj-y +=3D firmware/
+obj-y +=3D lib/
 obj-$(CONFIG_TEE) +=3D tee/
 obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
=20
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index dea8dbd18a..009bb22c45 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -2,6 +2,7 @@
 # arm-specific definitions
=20
 ARCH_LIBS-y +=3D arch/arm/$(ARCH)/lib/lib.a
+ARCH_LIBS-y +=3D arch/arm/lib/lib.a
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
diff --git a/xen/arch/arm/lib/Makefile b/xen/arch/arm/lib/Makefile
new file mode 100644
index 0000000000..07a0d9186c
--- /dev/null
+++ b/xen/arch/arm/lib/Makefile
@@ -0,0 +1,2 @@
+lib-y +=3D memcpy-fromio.o
+lib-y +=3D memcpy-toio.o
diff --git a/xen/arch/arm/lib/memcpy-fromio.c b/xen/arch/arm/lib/memcpy-fro=
mio.c
new file mode 100644
index 0000000000..3b27ab2949
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-fromio.c
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/io.h>
+
+/*
+ * Arm implementation notes / limitations:
+ * - Uses ordered 8-bit for leading/trailing unaligned bytes and ordered
+ *   32-bit accesses for the aligned bulk; no wider accesses are issued.
+ * - Only suitable for devices that tolerate 8-bit and 32-bit accesses;
+ *   do not use with devices requiring strictly 16-bit or 64-bit accesses.
+ * - MMIO must be mapped with appropriate device attributes to preserve
+ *   ordering; no extra barriers beyond the ordered accessors are added.
+ * - If source or destination is misaligned, leading bytes are copied
+ *   byte-by-byte until both sides are 32-bit aligned, then bulk copy uses
+ *   32-bit accesses.
+ */
+
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+                   size_t count)
+{
+    while ( count && (!IS_ALIGNED((unsigned long)from, 4) ||
+                      !IS_ALIGNED((unsigned long)to, 4)) )
+    {
+        *(uint8_t *)to =3D readb(from);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        *(uint32_t *)to =3D readl(from);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        *(uint8_t *)to =3D readb(from);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * indent-tabs-mode: t
+ * End:
+ */
diff --git a/xen/arch/arm/lib/memcpy-toio.c b/xen/arch/arm/lib/memcpy-toio.=
c
new file mode 100644
index 0000000000..a6ad08b805
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-toio.c
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/io.h>
+
+/*
+ * Arm implementation notes / limitations:
+ * - Uses ordered 8-bit for leading/trailing unaligned bytes and ordered
+ *   32-bit accesses for the aligned bulk; no wider accesses are issued.
+ * - Only suitable for devices that tolerate 8-bit and 32-bit accesses;
+ *   do not use with devices requiring strictly 16-bit or 64-bit accesses.
+ * - MMIO must be mapped with appropriate device attributes to preserve
+ *   ordering; no extra barriers beyond the ordered accessors are added.
+ * - If source or destination is misaligned, leading bytes are copied
+ *   byte-by-byte until both sides are 32-bit aligned, then bulk copy uses
+ *   32-bit accesses.
+ */
+
+void memcpy_toio(volatile void __iomem *to, const void *from,
+                 size_t count)
+{
+    while ( count && (!IS_ALIGNED((unsigned long)to, 4) ||
+                      !IS_ALIGNED((unsigned long)from, 4)) )
+    {
+        writeb(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        writel(*(const uint32_t *)from, to);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        writeb(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * indent-tabs-mode: t
+ * End:
+ */
diff --git a/xen/include/xen/io.h b/xen/include/xen/io.h
index 164a20c5d7..1bb164b6ef 100644
--- a/xen/include/xen/io.h
+++ b/xen/include/xen/io.h
@@ -67,4 +67,14 @@ static inline bool write_mmio(volatile void __iomem *mem=
, unsigned long data,
     return true;
 }
=20
+/*
+ * Copy between regular memory and MMIO space.  Implementations are
+ * architecture-specific and must use appropriate MMIO accessors for
+ * their memory and I/O models.
+ */
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+                   size_t count);
+void memcpy_toio(volatile void __iomem *to, const void *from,
+                 size_t count);
+
 #endif /* XEN_IO_H */
--=20
2.43.0

