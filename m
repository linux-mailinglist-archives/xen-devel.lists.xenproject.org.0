Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37799A7441D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 07:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930164.1332839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty3Tj-0000gT-Fa; Fri, 28 Mar 2025 06:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930164.1332839; Fri, 28 Mar 2025 06:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty3Tj-0000dL-Ch; Fri, 28 Mar 2025 06:46:07 +0000
Received: by outflank-mailman (input) for mailman id 930164;
 Fri, 28 Mar 2025 06:44:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bq2r=WP=boeing.com=gihwan.kwon@srs-se1.protection.inumbo.net>)
 id 1ty3S0-0000ak-KH
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 06:44:20 +0000
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net
 [130.76.144.163]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dbea2b0-0ba0-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 07:44:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 52S6i8I1008614; Fri, 28 Mar 2025 02:44:08 -0400
Received: from XCH16-09-09.nos.boeing.com (xch16-09-09.nos.boeing.com
 [144.115.66.157])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 52S6hxu3008547
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 02:43:59 -0400
Received: from XCH16-07-10.nos.boeing.com (144.115.66.112) by
 XCH16-09-09.nos.boeing.com (144.115.66.157) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 23:43:59 -0700
Received: from XCH19-EDGE-C02.nos.boeing.com (130.76.144.198) by
 XCH16-07-10.nos.boeing.com (144.115.66.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Mar 2025 23:43:58 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.151)
 by boeing.com (130.76.144.198) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 27 Mar
 2025 23:43:58 -0700
Received: from PH3P110MB2246.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ae::6)
 by BN0P110MB1626.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.32; Fri, 28 Mar
 2025 06:43:52 +0000
Received: from PH3P110MB2246.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e553:fd5d:6dc0:5572]) by PH3P110MB2246.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e553:fd5d:6dc0:5572%4]) with mapi id 15.20.8511.031; Fri, 28 Mar 2025
 06:43:51 +0000
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
X-Inumbo-ID: 0dbea2b0-0ba0-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1743144249;
	bh=o74PJtK1U/utXpqLd6A1Q/nS4b6mJRxdw0HHekiTb6w=;
	h=From:To:Subject:Date:From;
	b=eWzCJooPgEJ25QQxWt+AzhB9cOm/Gi1CPtAQVHUmsE/4psP/F7pi9IbUdBAKW1Bg3
	 tB8/DFxg48dmCJd5eigpIrHwZKztEhqSDuGzmQ3ZBddXe6TyTIi9B6bfZ+e38ZQvMD
	 NJBNiBJPUmw8ZZY+VtmQNcS85c6uh7huCbhKQoGh5Efu//qKT9FW6he1nJ9gHBbZck
	 zXm/Wrzh/SEAxj0iFpJLCc/w7thSYDQ41aUsS4EX5ogks3DPEjfxGcnUnR3glYF8RZ
	 sFb+AccAt2CbnmlHDDItpNpmz2WXzxIjE73JudziMMXmGaC+b55+GJrJYXrhmKwSpc
	 Wzgn0JeLclsIw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=0gfaoBnCkNlWj9lWSR25NjzefesJ5yGVkaW0xXP16eO5WeZ0rzKn+ZyK40I2HUx+xUR//qlmcBe5PKcvmdmnv5x+Nz6S2WfI6FlmuClgWi9tBhCN2NMmsRGJFKSZDlm1E5kkdanA3MU8xRs9v8qqCtUVmdjS9eHClGcZTDaqb2hg33xZwvbJrMeQs7K0kl1wyXu7zlkqdTX6NZq+CjiOUNUbfcyf9Gzdv8lXg9XqIXD0YMlli4biX8I/T+4m76GC5BHvVLKb1mvRIiSZ8LlzDSA7l5+FRTJO66oyinET8Nqu20UN645UoJSqAKKqlQr481qSZimFrQXLkrN9A9ASrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o74PJtK1U/utXpqLd6A1Q/nS4b6mJRxdw0HHekiTb6w=;
 b=NCbHxtvVFukf9q0rPRdBRVqLGgYJA+a4DR54C1xXV8bDcidnKEWy4Oo61XxHAYRyc44OT56NVHaGuAMEeNZFUmN1r+Km+KlS7Vd5l7pc9UqKCDNIPDS5umqEsH0iNir1XAqesajdj/Gnl/HoyCCvBTmOT2Xg1ruAgBnpHmAAu9sxJWmCDmXFcr/lGvJfYx9eoK0tyVkMRMEbaRuIoPVD/vqYhV3aDiM4qpG0gm/Ka3jizIpeZTxPGU5yZxJTf7HdC/x4sXv1A5mFSiWV+AoYAShQbrkSjL+Qv06QdmqLEYxLntScNs5DWTeI+LVC3fO30JUf4+d8MTM6mHwEstCg/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o74PJtK1U/utXpqLd6A1Q/nS4b6mJRxdw0HHekiTb6w=;
 b=Wh8q/yNNCkTsv8z+nF2y++7/odhfnrqzxW1uMK3HaxSzJPkIWiOzrpn148Hxa/GhFXZi1uHxGHMYtqGm5d3DAJ1gxQ0A5tFmlHs5LBJuGgsghsIKYoVQmB1STx0rKUKUiDG5t2xqnqoqr/65Fqb3EsQ0gMrXBUVnVv5i7nrrZ7I=
From: "Kwon, Gihwan" <gihwan.kwon@boeing.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [QUESTION] Minimal Xen Configuration
Thread-Topic: [QUESTION] Minimal Xen Configuration
Thread-Index: AdufrJ9UUf/GAK+7RESPH/YMB+/liA==
Date: Fri, 28 Mar 2025 06:43:51 +0000
Message-ID: <PH3P110MB2246A9D7AFA0A73000781B0390A0A@PH3P110MB2246.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3P110MB2246:EE_|BN0P110MB1626:EE_
x-ms-office365-filtering-correlation-id: 1d92e320-6474-452a-e707-08dd6dc3e706
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?NWhFvOvpVojD+Oyym9qqxsLl/GPV5by1MiRogx5q+t1sZRe9KSKjeP/gE/kH?=
 =?us-ascii?Q?+FfEUc7e77+zpoA8OUME1pTpjhBgXBEV/ztYZS1kWd7C9qDsZOiHRqy0ykES?=
 =?us-ascii?Q?oiPdFoWH7PzZhG9SbUZ+WR72PZCW4JOmYfsOu488rqc3PnBq/IVa729i+/SG?=
 =?us-ascii?Q?Kt1nf1N0FD7IyLQUurqYc8njBJL2gZKE9pg8JkQ/xTC3Szxno0Z0JEJvpPgI?=
 =?us-ascii?Q?j8Ohwq9iavoUJxpx2/05u7j/NbYzZznGFHwgPs+CacPqmJa6N52JtQXF8ymX?=
 =?us-ascii?Q?dDzLKg0oCpcff4srv3CyFydsL6HT3J5HSuz5BHeTkL0PEg1Drz19WooS+HBR?=
 =?us-ascii?Q?ClWY0TZIxr2h5ydXhkKqdoRFBCOWhpUK+/zJ4e6T4Wcb76KgrAtkNPezmce6?=
 =?us-ascii?Q?HhuWxaOoxwM3S58HkWVDF2dbSQnvnSpoeEl4YnyPyuC/ff0J9/DvhDuz/9LH?=
 =?us-ascii?Q?Irz1omDU3e0MwBQQeu3p/tngXBQtDYntzUSIY0K8S9P3amzH4MjQx73SlwWA?=
 =?us-ascii?Q?aY9KmOcJuRYZE/y+ZDNxQoH7IKofo+BeOdN/JJaGHFRFyg6j0UKyqGfufSY+?=
 =?us-ascii?Q?INsYdHbA8Cfkp2pBqBPgpYgM7woTnxqKLgbZtILSdxoTdJhmLVZhbKsj0iSw?=
 =?us-ascii?Q?HV0Si+H5Cz6JIDGt7bqO2Gl2/HMionVVat+pYUyYDGV5aF2+tkkaPbvcUvfm?=
 =?us-ascii?Q?Rxc7DhXQo4+5lgYm8j9WV0VXBelvB03AuQSfctqU/gPJ3ZhUxhRN5W6QtARD?=
 =?us-ascii?Q?31Bl3A/O2OBi9m+rly3llZdssq3kAXINGUTxpDBDcVWnPVTKwCDVuXVV9L3B?=
 =?us-ascii?Q?2VlP1l8U7ckB8Q4ieyR8SvSMOq9bVMgZgQ3DYqnCPNKfSjqPueEw9lHtdsZ7?=
 =?us-ascii?Q?AamjoK3bgC86JH6+ovJOuYvAg2UF6o/C/ht//fDojM/xEIyrPlI6567/HsZG?=
 =?us-ascii?Q?Y2GUYr8I7nDHjsv4L5ySUUBGb2mRRMWKZL/+coYSdtuaXy20+McZFmmh054r?=
 =?us-ascii?Q?F9X7mbmSm3tkDP4U6iMhU/opnbbigjy463Lra7WeQ59kT/5YY209+B9sD1ut?=
 =?us-ascii?Q?yHHbNBgTAe1qo6Z5kn0bdB3QmE+tnewR8tSbpMjxqbwh0tbse2BMUgB2wG1r?=
 =?us-ascii?Q?eXTxi6NT7dZr1V2FmjTC6HPceipZKTnUe+zErz8inmPfHi+WFyWN8xHzywDz?=
 =?us-ascii?Q?0Bo18pknxxZT8+7/4YlmAUwxSyz5KpiGwJOBUiqufntbgLZa5958mwTC5F18?=
 =?us-ascii?Q?HG1GQzYzHonVzfWO/RuTITJe/zI5T2L8jMfrW9l/djKPUGnqYO8kwXfSpq0j?=
 =?us-ascii?Q?Xq4+oZNjU8NhP1R7Q/wNMYedPebgShmNG6m3RojFgaYKCyZdyhrDP/3TijGD?=
 =?us-ascii?Q?ZIGauWJ2H88h6KFPERQ6VY0vaX+TbQMW2yV/OlBQddiYszrqDUQm024UU9Gv?=
 =?us-ascii?Q?TlpsZhxGxKBq5DEB9xWDg0kyylHjQU6e?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3P110MB2246.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qE+dX/ks6IzvzqVrsDUOrh3nXLsYbRXysKTfTaZEZoTdn0BbNtwQXL/h6CbI?=
 =?us-ascii?Q?iseJNnBKn4vzydPH9UWIRsDmFwNBprwTlupWQ1qYdiwwWHqhtdheLjeM6pKm?=
 =?us-ascii?Q?NWuog3iIMIzwdr5nHj3ieHC/G6bqISlkMpCfUQ/7bRUAJcCAv5YAr5FvW7gm?=
 =?us-ascii?Q?5+zFP7icrkAt0/JxAqgZf/EJXSSTczZFfp8MbFKxV6NH9Rz2ECy0n8yvQ7ne?=
 =?us-ascii?Q?kwgcPxQw4Mc2A5SwA6KBqJdg4CZC+JnzK+wIfc+rhEgZ57zJqV1ns+lV/yPF?=
 =?us-ascii?Q?7pEmCNUqVSNBYC54qCwoycJYjB/gI7j6EgGafKhOUK9hEJaP2criyv+AWQAM?=
 =?us-ascii?Q?D99OaScFG1bHX2l21vnAYF+0nODD61YFSUxhsLe2CXFhw0abJ19B0WR0HM+Y?=
 =?us-ascii?Q?LClS4f+X0XD0nGmYcYV4gFS7Qa91jj2/uMassMrbWvv5sqoYPk8N6Q5MShYW?=
 =?us-ascii?Q?qD8GXJmRj3FFvoJifaR0uF86EFBvM8z3fsK0uGL953hu6UdRUd82sQa+9fc8?=
 =?us-ascii?Q?iy1ImftV7wDYGRnWHD1zmDXmU/sR8zeLwO9pVhMKKL3zgmUn82zpuuC6bw8y?=
 =?us-ascii?Q?qTQZ98ZBlwdwHjInzE+ajlL5yhR0H2RfY7vB+RnBJrmI3OFs5vcFiW9vuF9a?=
 =?us-ascii?Q?HBVw5THsZFJd3YpmEU51YPJB9Bfo2ScWb/ZtI2JPewcdboKq7qpN00aAfNBN?=
 =?us-ascii?Q?0xpV7qGPFyEqrZJa5GvWNR25IdmkxVp6b3pLGfiuoeLJ/JCTYkqWGQo4kr7M?=
 =?us-ascii?Q?M5jI5IOW4OaUEm6Gz0s22dIDd9CIjdLRXyDrUubYzkc1rN1dtDtLl9hPcsDD?=
 =?us-ascii?Q?jF81c9Qiy6+9rTQHBZpogdb/y/CnZ3jj9zM046QEZfuLjXvSG8t/p1tYjVgQ?=
 =?us-ascii?Q?t2byHOVfDrCFgp5FlPnPlrs5QZEUsh0ILCD8PbtswINPyjHgxggTwC7qwiH8?=
 =?us-ascii?Q?Bs2J7qRsgyXIv+biIFBzSVv58XH4mXaIzE41Uj1SpIp6lDbhicGsD3xYqex+?=
 =?us-ascii?Q?11vFMErDibNiMwF8Uo7F3IHVE6rjY7ikykQxtfFSNOqRI86RgCAp1cAf44GD?=
 =?us-ascii?Q?+U+A5A3bP7Agjx5CK9z8vZ22hXpWIhG2rztSzNf+qBSnjAaCd833AjZwAhGe?=
 =?us-ascii?Q?pbje3ubmqu828+HXiULvXS9D4EtGOPNao8Gu/9YPjWO5EcHWYvn3rw7mNT24?=
 =?us-ascii?Q?M9kn29Cgh8qJ6dn7lkFo9f7DQIuaqhSMYJt+9k9Iexu4Uq7NXZr/KH4Vk0Be?=
 =?us-ascii?Q?qxwo0ccIK4HKz8tvpeUqHT4MsaKJtvKStytQsBtkSwXeAuUZxodoBm9uSk38?=
 =?us-ascii?Q?Z48tRU48PeXjhkDHIHlmPsCmIxyRYd2kmgfYpIB0HyKdfHqLl8ju+YGtSRTq?=
 =?us-ascii?Q?Qe8oipCKSnYJrcF2p4dugTTh9j5ZRx5Sr4cmsMf1wu4YbzMAQgO82tRzvYk/?=
 =?us-ascii?Q?gvOPoF/zYX1yeW+DrMBfoImDJc3Vn1pVCaDK9fXq4f9cTQOFbxcijMdqBwja?=
 =?us-ascii?Q?j2vGIvGN2G0qNmc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3P110MB2246.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d92e320-6474-452a-e707-08dd6dc3e706
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 06:43:51.7994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1626
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

Dear Xen Community,

I hope this message finds you well.

I have heard that there exists a minimal Xen configuration optimized for=20
safety-critical products, particularly in automotive applications, with the=
=20
code size reduced to approximately 50k SLOC.

Could anyone provide guidance or point me to relevant resources regarding=20
this minimal Xen configuration? Any insights or references would be greatly
appreciated.

Thank you in advance for your assistance.

Best regards,
Gihwan Kwon


