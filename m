Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE44A5EBE6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 07:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911241.1317696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tscQP-0008Mu-J9; Thu, 13 Mar 2025 06:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911241.1317696; Thu, 13 Mar 2025 06:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tscQP-0008Kd-Ey; Thu, 13 Mar 2025 06:52:13 +0000
Received: by outflank-mailman (input) for mailman id 911241;
 Thu, 13 Mar 2025 06:52:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UDpV=WA=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1tscQN-0008KX-UG
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 06:52:12 +0000
Received: from ewa-mbsout-02.mbs.boeing.net (ewa-mbsout-02.mbs.boeing.net
 [130.76.20.195]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad90563c-ffd7-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 07:52:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 52D6q4Fq039436; Wed, 12 Mar 2025 23:52:05 -0700
Received: from XCH16-03-01.nos.boeing.com (xch16-03-01.nos.boeing.com
 [137.137.111.10])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 52D6pr6g039369
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 12 Mar 2025 23:51:53 -0700
Received: from XCH16-07-06.nos.boeing.com (137.137.111.39) by
 XCH16-03-01.nos.boeing.com (137.137.111.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 23:51:52 -0700
Received: from XCH19-EDGE-Q02.nos.boeing.com (130.76.23.14) by
 XCH16-07-06.nos.boeing.com (137.137.111.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Mar 2025 23:51:52 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.149)
 by boeing.com (130.76.23.14) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 12 Mar
 2025 23:51:50 -0700
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::17)
 by SA1P110MB1038.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:171::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.37; Thu, 13 Mar
 2025 06:51:49 +0000
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d]) by BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d%6]) with mapi id 15.20.8489.033; Thu, 13 Mar 2025
 06:51:49 +0000
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
X-Inumbo-ID: ad90563c-ffd7-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1741848725;
	bh=SsIpSQRIgi5CFieI6zDT5nb8o4DTTGNAzd8wdVzGX9A=;
	h=From:To:CC:Subject:Date:From;
	b=S1dD4SGF1p8rqxQco0bGgJxRZcID/U7uY6vc2Sg6SOOHMs5m/xyVs5Pm2UEcSyNHE
	 WdmkqyyzCLKQ9FOFYEc7O7CL2R89hzst+Plm+Q2pfAovpe7/Vx2aGoY8shYyOnoTj2
	 Pfn6RGsbp1jcTFwiPT9qkaBDbX+no7qpq0Bckj3j/MCwtKWubUWILP93q6Jt7irjLd
	 KQw+QZoslM/ZBgc3910arRjROYR3vO6yzAzeF5rgSvDBeC4DhYby0rGfEHror1dB4N
	 lfT06obpPk8rKGJILo06MCnM7ZnDn+SbTcn/cvxhsVpfsDv3lkBZbNcXfgsZjLS3Gy
	 7SJzFBLumJC3A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=kbyhGnlNy3ZjsTUtpf6HN4NsydaAp04oJ13IARrL/PO2V0LmeUTo0yVFDu6uHGcWWjoJ/0MTljE0q3N5ENNwaMW72TnGj11tUHojHzU5OM3GM/q6+Slbxy2ugcG1iIf08+YAJ6/8bJGCLSr6Ks4VZjTw9i9q2xTlbeN5aZWvtJmQYU/UQaeTMzA8CaYNZWN7HfUJBhpPJFDeGo2J/MyL+Ewo/ErrxqLQk1IeD/aYP9LVIhbA5WCPlAgSFm/8IhpAfOAHW5R2C5fSWzGpjJn6VKMiy6YtG6vFyCDzfOU1Rn+X0l7LXmfuGnkTK9+OKThMkaTf7JABswNtRRNrWuceXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsIpSQRIgi5CFieI6zDT5nb8o4DTTGNAzd8wdVzGX9A=;
 b=sqG+yJWpAQyIijGp0DLKBQFhtuUsiZVJz2YL0RlHzj7Hra5LlhZdIwJqXTaTeRWaqaCAMVPhOwqjmHEqXDQm6hXd1SIB6J4XdutJMPmQnmjimexxeeS1XcazHQHOBzpyGZTZNRN2LYHOYBx81ziBIocdUZ/Q9UeYpxY2OoEcaXTIFQ3qONhPnZu8ch1jp0viiyZEEKQtbpxHwochyAf7++T4OX/m6zoxMqlAgvIYgxBlb2n9XhUJm5396NISgWRg+E9eS+EEdZMlUjvv3I/4VhrnQItucq44SKKmeXNvcDswrPNBK/kuMgLlBrJQXwxVf8ZrXr5Ucsv6JY5fH1pXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsIpSQRIgi5CFieI6zDT5nb8o4DTTGNAzd8wdVzGX9A=;
 b=I7j3PgWFO29fe1DjPmtHVk9f2I0KCXh7uhImT7NeiKxcg/mZ4g2BU/tFper/fTGnIV5Fj1nsQTVc31rJosqCB/X+fok0L75Ks8hYUSoLjtAaHQa1crKQyAEdE45pXC/h8N7/EPCczKJ08tYf98+Pzavh73rCyojKsMTCV3cGf4k=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
        "stewart@stew.dk" <stewart@stew.dk>,
        "Weber (US), Matthew L"
	<matthew.l.weber3@boeing.com>,
        "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>
Subject: Discussion on unexpected behavior of ARINC653 scheduler
Thread-Topic: Discussion on unexpected behavior of ARINC653 scheduler
Thread-Index: AduT5GPU8k+LryI1RQGgVtY2Yt6hPw==
Date: Thu, 13 Mar 2025 06:51:49 +0000
Message-ID: <BN0P110MB214836659525A1FEB86C407C90D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2148:EE_|SA1P110MB1038:EE_
x-ms-office365-filtering-correlation-id: 294f07f9-634d-41e8-5a78-08dd61fb87ab
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?LfPCqj9uzRbihleVn6HR/Pfh0lCaTW/ph1U0wK2+YIjV+xjxuIRAg3dgQJ1G?=
 =?us-ascii?Q?oINvM1Xr2za0CwGd3i3hahIkrGK2P29axaM+d2w5xfOV41WZUQKDVFF3HwmP?=
 =?us-ascii?Q?FD0GkhlmuFoTiJZkGt+XoI6VEAPkx0AbXwpwnE8LnCW25tphHvHF6M/TFtT4?=
 =?us-ascii?Q?jpNH3c7HrLZ5ggPT9iTqH9ac0KMeR08odxA6+ozeA9r6uHet+FMJYnvno/bq?=
 =?us-ascii?Q?7r1ZAc6N83Hg25YoCCqCA4aadc1VAoqXUmZizFYX8xx/KJpAtlhCH06Jg8NX?=
 =?us-ascii?Q?AfoeognlYEwMbgXb/O/M5n8ZS0nUC+6BDfX16woA/mPOHYEFWgklAlyn/k7a?=
 =?us-ascii?Q?EyhfWznbwQN0GvKTGKlNP+DTYAeZAJg/8YCDcdrOwQnTznKcRhmfgu81Xpoy?=
 =?us-ascii?Q?kWk7SgHFSrfJoKEB+CU4f+bg/O/kEmn0OGHJm9C/drP3J8f69NX2Hzja3iei?=
 =?us-ascii?Q?JwrO6acx3rSnlJm6teYqGl7qbjtz/RPcLC/Bk/mdW2TYnEtDgy6Nxjdl7J8b?=
 =?us-ascii?Q?3ounb34kg9iaEsInlh3NMBIeMRut7s0kQUyzkcNbWf/9Vlrg3o9qixQo/D2g?=
 =?us-ascii?Q?BiNIuU+jDFe2eE4EJfSYTQ2J2XTdzU//LmNQH0jB6lFnJR0Nuuv/f9N2UFLa?=
 =?us-ascii?Q?3ixK4gMCGtxpatWp0JMG4BV3Vt9UrVGCVB+Gt9z8Hfne596cQsOtf3WnQaXn?=
 =?us-ascii?Q?NxhmRtHMxz/nw4he+6Y+i/2zn7OxtMXVbY4A6tJOtJ92XP/NOX+rV+bjWkmH?=
 =?us-ascii?Q?sylXIFukM9Told1UpkgCf2e0EA8oyVoWW5B4mtlmaQJ90ohrQ8R0BKjXZzhu?=
 =?us-ascii?Q?eXHTvF9g0n0ibWnIRnlOaegb7AAGCU3zXnEpWreXmsKX4GgmE30bC9vGPXh6?=
 =?us-ascii?Q?n3RNmIu2Q51tB2LYEWg3FCvcRmnC8zG1tRkZ/kubOTbsphyJmffVxXCCSdVP?=
 =?us-ascii?Q?8cVvH5XrS6s6h/mFSu2WjxrGBCry3E2KP8drBElgDO7OYMwgB32k5b+3vFYu?=
 =?us-ascii?Q?PZWY4QA9I25PM8FkL+cMtALcyvOdQD/8uo+OgjZc7sALboMBhKsp7v4c1psM?=
 =?us-ascii?Q?iQq0sOG2yUQazOQwMh2Fn3AyJKdVSdP0CcSyLx3kzjv5W87JkKZkMoS+b/hs?=
 =?us-ascii?Q?zVBXy+ndD/dUTLmp6ms/9NVbFdYvbjEavHG3HbWl17z7nXopECqPqVxNIUhN?=
 =?us-ascii?Q?1Gc2VXwry9rRCxZBG422vwIlKF5XNNQpEYqQwLiRDUBGqTLjJjQHu8RzQYby?=
 =?us-ascii?Q?8VeM+pAkoCnuo3CGsFUOnYW8CGg6oxhwzrahgo//u+674W+BLyrbniwtl35n?=
 =?us-ascii?Q?n18QT5NmFHUK8DutlIoY/FWyPyhnPqAh8W+U3/CDmiCj0LNWeVfT/iWjHEUZ?=
 =?us-ascii?Q?d18ioUshucKwQtXU+lynUmP3aYljfTH3wF8CubXfocVYAa4NODeDriGAAVMJ?=
 =?us-ascii?Q?usCTITnWpIMLY0shV010RF2EhqAApev8?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2ojmGiYTBvY0QsHGKqRcHM3fBKxb1GtjnVjdZZVOG0h3I4LR6vTSel+k02/R?=
 =?us-ascii?Q?QRLGtx5NwqzPhuZSBaaNq+/8hgO5+QwKHhKShVWv+k/cZDdzrpE0aBsOYxCI?=
 =?us-ascii?Q?3rLdGj+KquVR4zfmylsADd5lbqHWUHrZMJSNbtfoJzLOk1yP5R0fndtCxfH0?=
 =?us-ascii?Q?3XjDPEev5gKTHY9F6oUkeWLD0jJIB73g4xV2WUxEsIwhMrJ49CLoDJowfbVX?=
 =?us-ascii?Q?82+N0TB5I1WbY432sYhcrs9vbLwlb/fRC0ZdRltLvYdzFDznzEXCAeahkeda?=
 =?us-ascii?Q?VQQsH1hGqWAfM6qsIebqk6QIPW/Mf9KmmtCvvac3CbZie9W9hevW2ZhfCHIQ?=
 =?us-ascii?Q?w4YReo/pkcVku9QpRrtWFhimPcFlbNpGEyORUdgqRcgwkRIW0hgkxwTULhJZ?=
 =?us-ascii?Q?3Dsy07kMKj++5lHwwVQLsnkELHbvQdwVn06gKzMTLcGuzawrnieVKIoSW5lK?=
 =?us-ascii?Q?Z1wC3YAgVhhk+Knj8zGmEzwhmrc1sY3WULO0mG46yQpU4uI/I00USsuSYqln?=
 =?us-ascii?Q?o2bb0Pz9LMZZrg1wnx2VjfxQYFac9jjJIf1GzQ7Q/YNTHUTWoX9dYE3hXhTJ?=
 =?us-ascii?Q?w32N/zFfeVxipc/qL/SOpQ6yjuKara9TxWZPiypuF0C3hqF8g84GDS8B0Qw7?=
 =?us-ascii?Q?laphtTjeFgCW5catg0Znl5pn9jDqzmFa+7uZUNUQhT/ZOTous3O8Kd79/BvC?=
 =?us-ascii?Q?L2cPZECa4XwA/w0PmH+bhypqAFTfk2pQu534O9IT5OqFu04kCi0uTuHVLwo3?=
 =?us-ascii?Q?+abOm0lSGZ881SrbQ+nWINOH9GRL895OsyrNUwkCbA0iKDemY5B99aFy2PUK?=
 =?us-ascii?Q?7sXVBK/d25FCTl4ve67+YORzGLkgjhDJb8wqD1c5sKdvVIXIXkdchgKLlUGo?=
 =?us-ascii?Q?eCP5ND8Q6Thl3R5AKiy6d3B5JIZHyQlgV/71qevn6/9YZAHi6LnltL/mu43I?=
 =?us-ascii?Q?X09P1Da+r0dx3ZoybIqbtiipUtmnU7OrQZXavENCA2+w6v6EHTW7aAXQMam6?=
 =?us-ascii?Q?lLvyyig8ari8nX5t2oRXrfVeBBK7bxId6H9kmwaw8B0dJNB+xcu0fmm9hLtv?=
 =?us-ascii?Q?OoTiDQleASshugowGUb26IA6ri+G/F0CBovXN3trYFmnvV3ktvo9LUxLzk9X?=
 =?us-ascii?Q?qXBgeTUHxeH32aWb8fnJkNjWAKSa3O4PiQswlbDaH4cU6VLTdpE54TxMCsll?=
 =?us-ascii?Q?MypuKIshMjNtBw0t31OrO8LPNjNJAKCFmaYD+drjzQUW1wZYDpfQmBvKv1Zc?=
 =?us-ascii?Q?FXg6xJfcomBBw2SroB72YUDF77ZCimc6XbG+L/G2vgWsG+IxeyQVrVPFKNn4?=
 =?us-ascii?Q?IZLRrSyG+FxwymZDyyNtenhJkuvz8K9f4z6zaWmP1xPB7YUxvrOr/LV7H6oe?=
 =?us-ascii?Q?e8rs+OFE2rtPBYX0uVDkINd5gDlJUqCEQN+Kb1MrH1uO/silafTDi0eaNGNx?=
 =?us-ascii?Q?giK80Wi2pvNVJ1OWOCWQhs7TrugxaYJVFPLJ9VCnazVDc8sQb7S5Eeo75gBN?=
 =?us-ascii?Q?Fto0ENFQGKcQd0oo0eNEmrV8KIN8O8gZ9hxk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 294f07f9-634d-41e8-5a78-08dd61fb87ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 06:51:49.6704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1038
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

We are observing an incorrect or unexpected behavior with ARINC653 schedule=
r when we set up multiple ARINC653 CPU pools and assign a different number =
of domains to each CPU pool.

Here's the test configuration to reproduce the issue.

[Test environment]
Yocto release : 5.05
Xen release : 4.19 (hash =3D 026c9fa29716b0ff0f8b7c687908e71ba29cf239)
Target machine : QEMU ARM64
Number of physical CPUs : 4

[CPU pool configuration files]
cpupool_arinc0.cfg
- name=3D "Pool-arinc0"
- sched=3D"arinc653"
- cpus=3D["2"]

cpupool_arinc1.cfg
- name=3D"Pool-arinc1"
- sched=3D"arinc653"
- cpus=3D["3]

[Domain configuration files]
Common domain configurations are applied to each domx.cfg file.
- kernel =3D "/usr/lib/xen/images/zImage"
- ramdisk =3D "/usr/lib/xen/images/rootfs.cpio.gz"
- extra =3D "root=3D/dev/loop0 rw nohlt"
- memory =3D 512

dom1.cfg
- vcpus =3D 1
- pool =3D "Pool-arinc0"

dom2.cfg / dom3.cfg / dom4.cfg=20
- vcpus =3D 1
- pool =3D "Pool-arinc1"

$ xl cpupool-cpu-remove Pool-0 2,3
$ xl cpupool-create -f cpupool_arinc0.cfg
$ xl cpupool-create -f cpupool_arinc1.cfg
$ xl create dom1.cfg
$ xl create dom2.cfg
$ xl create dom3.cfg
$ xl create dom4.cfg

[ARINC653 scheduler setup]
$ a653_sched -P Pool-arinc0 dom1:100
$ a653_sched -P Pool-arinc1 dom2:100 dom3:100 dom4:100

It seems there's a corner condition in using the global variables "sched_in=
dex" and "next_switch_time" when multiple ARINC653 cpupools are running on =
different physical CPUs

The variables sched_index and next_switch_time are defined as static at xen=
/common/sched/arinc653.c as shown below.

static void cf_check
a653sched_do_schedule(
    const struct scheduler *ops,
    struct sched_unit *prev,
    s_time_t now,
    bool tasklet_work_scheduled)
{
    struct sched_unit *new_task =3D NULL;
    static unsigned int sched_index =3D 0;    <=3D=3D
    static s_time_t next_switch_time;       <=3D=3D

First, a race condition against the global variables sched_index and next_s=
witch_time is observed.
They can be accessed concurrently on different physical CPUs but they are n=
ot correctly protected since each CPU pool uses its own scheduler-private s=
pinlock.
Technically, it's identical to using a local spinlock.

Spinlock is held here (line# 522) and,
spin_lock_irqsave(&sched_priv->lock, flags);

released here (line# 577),
spin_unlock_irqrestore(&sched_priv->lock, flags);

Second, even if it's properly protected, global sched_index and global next=
_switch_time can't be used for ARINC653 CPU pools with the asymmetric numbe=
r of domains and with the different runtime and major frames.
Domains in the ARINC653 cpupool are organized in the schedule array and the=
 next domain to run is determined using the global variable sched_index.
Since sched_index is set to 0 whenever the major frame of one ARINC653 CPU =
pool is completed, the domains that belong to lengthier ARINC653 CPU pool a=
nd are accessed with higher sched_index can be never scheduled.

We think this can be corrected by using a per-cpupool sched_index and next_=
switch_time and would be happy to provide a patch implementing this fix if =
this is the correct approach.

Can I get your advice on this subject?

Should you have any questions about the description, please let me know.

Kindly understand my description might not be clear enough as I'm not a nat=
ive English speaker.

Regards,
Anderson

