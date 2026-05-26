Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D1mHs8LFmrYhAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:08:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A0E5DC9AD
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320169.1587533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRz0A-00068G-67; Tue, 26 May 2026 21:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320169.1587533; Tue, 26 May 2026 21:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRz0A-000666-2A; Tue, 26 May 2026 21:07:50 +0000
Received: by outflank-mailman (input) for mailman id 1320169;
 Tue, 26 May 2026 21:07:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wRz07-00065y-Vf
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 21:07:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRz05-0008cE-ET
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 23:07:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a160b59-bab6-0a2a0a5309dd-0a2a450bba66-28
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:07:45 +0200
Received: from [40.107.159.118]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a160ba0-212f-0a2a450b0019-286b9f764ec3-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:07:45 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DB9PR03MB7227.eurprd03.prod.outlook.com (2603:10a6:10:1fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 21:07:42 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 21:07:42 +0000
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
 b=fm6a+UEDzq0G3NTSSwJCymHKlSsisLq1LDBwQFYkIeO2eIdkYyVqEhbnQjeGIWCXvEyc3/7rbazWBL8BvbqYOKj6HWJPNi3sV8CdcId2yqNYrJ4ITJxAjZ6A6yWmvenTmm0KdVB/vEuBWRPPNtWyIYZE/lWnKSFwTsZAuukr7IjL38JVKApyHhD+9KatRaCekcxB1goZ7iErRIJAVbOsDucxXM2nI2butmarj4DOad8Hvgd5UNO2stSmcp3lrWprdR+3Sv5jyNKWAyBx75Y4T9+dkirjxJKMwDgdv65YljY9Xj0NT+WgxLdTIJTWdUKSp7WLBStR0wN+xAexsAHq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvdDYZAHWzCSFBIO+A+gdFJ9FhATYvWABVo7oUROvkQ=;
 b=xkDnQsSFUues/rayMGJJyfI6TxkVbrmk/Z9Ocbr/KUdtpohHLavwqw3VjdlwkqcI809H/jD0MLv8gbjwqLUxshmLUftd9nSIbJxRvrRfmFPefZPcyT3RO3Kdp429tjwCb8J9kYs9dCFPEY8kWLE+Jbp888/c9KEjaM4xajrWvMrjzUPzcBTcJOpfTmUzzmKmTbgEDHsOB1myN0Ed5HT5sJopGTbz2EnOvxu1OJxarhVlPt9EIgh/3l/ivoTTXRS1yOjTdtrqZT3+Alx6u0X0VKAXsT4UsA4QluOD1xH2r9O+TV/TDKgEXzjDBHwMkeqy4AoqH8qWrNBS5mxgM/Bznw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvdDYZAHWzCSFBIO+A+gdFJ9FhATYvWABVo7oUROvkQ=;
 b=LmNYM53FioqP5CXU/csvZyJDtOMMlzcPXBhHtisyK9/Lv6x1pvk2bJ7/Y4upL7/dN9wenUdbONtEElUC4wMJsRTRsFGMB6VDvz+UjAuiAS8OcnpvDh+ylYS7jvKgxbm9UwmMDeRhVVJ1iyrQHQrd0/GPdkLNBRF2ONW0KBIEptAOgSKW5ksSBI+Az/F+TqXptpF1CUJJfcDeF4mIQ+tCjt3Zp0NhQs4FMH1JQH1OyoodZI32XLuEfCpsFwBgrMRfWtqQ8tUTLmZsQ1yrJ0hbdKCLJhjZNww3WyuHdSvx6T9K3ZhXEwtsFWb4vucSlv0KwWztKswhAwJ7A68IxGRjWg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] coverage: place GCOV-generated .text.* sections in Xen text
Thread-Topic: [PATCH] coverage: place GCOV-generated .text.* sections in Xen
 text
Thread-Index: AQHc7VOxa7dJ7uwiTkiCFpTyz2B8pg==
Date: Tue, 26 May 2026 21:07:42 +0000
Message-ID:
 <cb8c1e0862a554f7a28347f549e9cfd0b0d6db2f.1779829545.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DB9PR03MB7227:EE_
x-ms-office365-filtering-correlation-id: f789f44c-2d5e-48a8-d6e1-08debb6ad38d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|42112799006|3023799007|11063799006|18002099003|6133799003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 SANvO9ZSX2FPZrjd1/oI9/3nsmhCnitlOwpdy3AqmWVEfylwGRmJhFNy8xj9kWIaoIJjL8Ya5Cwie5AlrvJNwssHUMeyFkPyFhz33e/KEXuUBWm5tJlecfFpXxroHMDTTVtp2ll/fusT8ycP9YtCCBc/my03USXhuREcvpBejeiPS/fTAg8PDqYN1Q8/7Jh2pNCjBhVqPexeh/EPYjyuLEo9JmeyZgFmKwRSnvIgMnqFARHLOeiaSt9LigpKeQwAw80Hmr4ClNtxznCINCh2EvLw++OjXv8Dpf44spLCflslinebUMImRkVG8d1gYTaYs4R7pEakI1TeehIofSOY6GsjuOkxaUXbHXym6MPfuwFNBW+1T84HC3AxU+rLfEqN/0yfMOgmVYCO1Fep0MBw2+cPzSIPoqXMyR22m66NJYU7ig/cndTUxbxcTSMfDC1ElFCiyRrmr7ZRqoTJ/91sOvzB/RvuReC5zyp0ICWAxRn04NQy9w1hXeTclQreLBh1og+0WHvH4DO4lJMqZS2y8mGIYthkUmRIRaKzu+VBpns4fhs8WVEz1O5hkkSfgHOAHTVaXBdLYDsGR/Uop4swLSZKr4fvy/8luGm9TZK5g0kX8QER5l+zDRBhss+ubw+MBSjGTvDSQ74yPHdVCnOQggItyJFptZ20AXW+G/DVH91qqLow/n/KZEbM8Zzr/D23JIiTY7OO/DBeGbXP4r4RUtpnFTnhlv1KNb1NTDZb9Dd1ISCuqVZ1+4E09s4/3D1A
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(42112799006)(3023799007)(11063799006)(18002099003)(6133799003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AV+E3f0jSISJ0j0MSG8gzYkc3hzDoa1I8zbcVaEBKOFAPC6f6AvY04cGl8?=
 =?iso-8859-1?Q?IOhwBG1vhQm37N8cjei98C6w4x+7AH11MdLyO/cL6OieHY4u1NV/YhlZq8?=
 =?iso-8859-1?Q?CX01l0HwBe2JjDzZJYykgvecva+s+AclASUUVFOKACsFso+O2IgwAv3bJV?=
 =?iso-8859-1?Q?VSn/h4tC5AuJ3fA3sDY8xFIgktoOpj44yujYpEQStpdP4sOklzWJcAj8pe?=
 =?iso-8859-1?Q?G+yEhU0MzLh+qu50t95UlEw57sSITooSQudcwhLccAFaHHXHvXbgCnpqRj?=
 =?iso-8859-1?Q?NV2I7VBzsVYhBYnBuMryDR2gaAGxEQYkiZAjx9X9hbakUFOMIjxj+3BZRZ?=
 =?iso-8859-1?Q?y+xWpUmW3AEb+OsLhkja1b9KzAbzWdXNYeCpw/Ai9M0iJ/snjI5cVxp5ga?=
 =?iso-8859-1?Q?f+1gcgQD2hsnWJHYWxlYQmQfXTrWZUtU/xgxHGz2YkLX7RDcUqghGY8tRH?=
 =?iso-8859-1?Q?70wt0Dw5Nb7bY7KAQMdANxwAN0/xYPnDm+DyLC3O9g3zUlHC4S6zA24G/v?=
 =?iso-8859-1?Q?hevU/Py96yrhmV+hnTm6Qd0eOcKAas3+RscVdyX6QM7auhOb9wRZWObaYS?=
 =?iso-8859-1?Q?3vaOigjp7z8IGmr62I88r4Sy97fC2sdV7eGQ2ihuLcVMqTvaR3pgeloL9k?=
 =?iso-8859-1?Q?+OAzu+pMOIhytmiMvch1U4v3cqldk+ldhJuR1fYvwozF9wF++HIRLp0sEu?=
 =?iso-8859-1?Q?Lp0NGETcC7gzLl183Flur4Z3kIG3pHIh8curUO8MML28T+yK/iNNp/gdt2?=
 =?iso-8859-1?Q?qukWKQCvEiIO2n3w7zApxwTNVBw9EskKkpNQoqgD7UFTbCwqMlqhpivdWr?=
 =?iso-8859-1?Q?RBxvr5RPH184Lc09n0aOPdsHwApkbd66SqUPHMYrZjmSyZjhce1aMuktnW?=
 =?iso-8859-1?Q?sl3aHUJa3XID3wkKplE/r+aHthWfmeQSY3cai38zk0qvAnsDMrNqjSeRb6?=
 =?iso-8859-1?Q?Q654ljHRuSPX4XOpoSrQkBTF4mXs0S9V5mLYlvwatIectzSx+FPnrBcxTV?=
 =?iso-8859-1?Q?pWKGo6DIjyidKBsoyW6o0p3au1Zs3jGFeuB+tJsqRw0rWKB11/ROcLMTK9?=
 =?iso-8859-1?Q?jksKIJvJM5Wr7oXdIhltkmWElDRtdQ5fg6nAklb9BxC9q1Xg1M3MBsI8NP?=
 =?iso-8859-1?Q?YC2iNtuZeTixdd8/MZM+A+M+GOLzwDlnHn3bv7V73hpPBNcAllkNWHOZLr?=
 =?iso-8859-1?Q?kO23WCoXoMu83QR/gblx/5bXJ5TCRcYUw6YgRw0vKsvHGYQjQkMgdQwevI?=
 =?iso-8859-1?Q?I4kYaLBdhlQb7SSQ1Dbco8msqe6qjFeXCv+/emT3QVhFMrhr5WnQT63a8M?=
 =?iso-8859-1?Q?UnT0D6rqzVjXc/LfaOfgK5xIX6wY3q912yMaYftnqYbkNIb45vLXE6iORp?=
 =?iso-8859-1?Q?wMYrx0sL3PLWJz3ucaAJGdYdIEK11/6aNtViSdHAsoGqcLGD1XOJ4EjE1E?=
 =?iso-8859-1?Q?j4weZimsu0ekGcpW9ZxvmsjP+o/76u0IytD8EQLRCK17axCCVj2KvnTrQf?=
 =?iso-8859-1?Q?MKiWwXxmrUAopInOjauVaJmO6TbgxyGebH5qTXP5KUmOvVgMXb+1pf6/oS?=
 =?iso-8859-1?Q?WjuPUVzqEAwQDhehRZ2wiSI/CuB8KjOarBYeypUdyCH0RwJRs48iYzmxm8?=
 =?iso-8859-1?Q?toQbMe1nnIrlSeTXteJRnfy8dnlRUOPzGfL16nbfFrDWFoYjFtw+8DWVZC?=
 =?iso-8859-1?Q?ewcz+p4fAVmWMdQUYO38s+MgD6AcBKo3SfyyPQczUv44oe2O+6Y25FBcb0?=
 =?iso-8859-1?Q?DTtY9OQsTJoqPY4l71A3mLnaWkIgWxM/qmVmgtfLPYeote7m8vw53yuTvE?=
 =?iso-8859-1?Q?LAz3cltFzLqA7ORZJxT53cR69m0KSf4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f789f44c-2d5e-48a8-d6e1-08debb6ad38d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 21:07:42.3146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BMK866vPmgHMi37Iyvz6IILb12aK/IaUmnZsizn3szXGGab8pE0Csc4U6FWvTIQycwqByh4ckMslqcLe87gAH+iQAIYEkTtRacEWW1gGCkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7227
X-purgate-ID: tlsNG-42698a/1779829665-1B175F3B-F8A3F52C/0/0
X-purgate-type: clean
X-purgate-size: 5561
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,raptorengineering.com,wdc.com,gmail.com,suse.com,citrix.com,vates.tech];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,epam.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B8A0E5DC9AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

GCOV instrumentation can emit executable input sections such as
.text.startup and .text.exit when CONFIG_COVERAGE is enabled.
At present the Xen linker scripts only collect .text.* into the
main text output section when CONFIG_CC_SPLIT_SECTIONS is enabled.

With CONFIG_COVERAGE=3Dy and CONFIG_CC_SPLIT_SECTIONS=3Dn, these executable
sections may be placed as linker orphans outside the expected Xen text
region. Constructors generated by coverage instrumentation can then point
at code outside the normal RX text mapping, leading to early boot crashes
from init_constructors():

    (XEN) [   12.331193] Instruction Abort Trap. Syndrome=3D0xf
    (XEN) [   12.334253] Walking Hypervisor VA 0xa00003ce000 on CPU0 via TT=
BR 0x000000004352d000
    (XEN) [   12.338550] 0TH[0x014] =3D 0x4352cf7f
    (XEN) [   12.341823] 1ST[0x000] =3D 0x4352bf7f
    (XEN) [   12.345124] 2ND[0x001] =3D 0x40000043527f7f
    (XEN) [   12.347329] 3RD[0x1ce] =3D 0x400000433cef7f
    (XEN) [   12.351233] CPU0: Unexpected Trap: Instruction Abort
    (XEN) [   12.357643] ----[ Xen-4.21.1  arm64  debug=3Dn gcov=3Dy  Not t=
ainted ]----
    (XEN) [   12.360243] CPU:    0
    (XEN) [   12.364098] PC:     00000a00003ce000 00000a00003ce000
    (XEN) [   12.375835] LR:     00000a00004802f8
    (XEN) [   12.378273] SP:     00000a00004c7e10
    (XEN) [   12.380492] CPSR:   0000000080000249 MODE:64-bit EL2h (Hypervi=
sor, handler)
    (XEN) [   12.382785]      X0: 00000a00003ce000  X1: 0000000000000000  X=
2: 00000a0000410fa0
    (XEN) [   12.385176]      X3: 0000000000000000  X4: 0000000000000010  X=
5: 0000000000000001
    (XEN) [   12.387555]      X6: 00000a00004e5f40  X7: 00000a00004e5f38  X=
8: 0000000000000000
    (XEN) [   12.390027]      X9: 00000a00004e5f20 X10: 00000a00004e5f30 X1=
1: 00000a00004e5f40
    (XEN) [   12.392510]     X12: 00000a0000439748 X13: 00000a0000406938 X1=
4: 000000000000062e
    (XEN) [   12.394954]     X15: 00000a00004f3918 X16: 00000a00004c7bb5 X1=
7: 00000000004c7bb5
    (XEN) [   12.397293]     X18: 0000000000000030 X19: 000000000000001d X2=
0: 00000000000000a9
    (XEN) [   12.399803]     X21: 00000a00004c8008 X22: 00000a00003fa000 X2=
3: 00000a00004e2000
    (XEN) [   12.402392]     X24: 00000a00003f9390 X25: 00000a00003fa000 X2=
6: 00000a00003f4ca8
    (XEN) [   12.404798]     X27: 0000000000000002 X28: 00000a000057a9c0  F=
P: 00000000bedb6740
    (XEN) [   12.407110]
    (XEN) [   12.409442]   VTCR_EL2: 0000000080023558
    (XEN) [   12.411291]  VTTBR_EL2: 00000000bffc4000
    (XEN) [   12.412895]
    (XEN) [   12.414204]  SCTLR_EL2: 0000000030cd183d
    (XEN) [   12.415928]    HCR_EL2: 0000000000000039
    (XEN) [   12.417642]  TTBR0_EL2: 000000004352d000
    (XEN) [   12.419152]
    (XEN) [   12.420327]    ESR_EL2: 000000008600000f
    (XEN) [   12.422056]  HPFAR_EL2: 0000000000000000
    (XEN) [   12.423809]    FAR_EL2: 00000a00003ce000
    ...
    (XEN) [   12.485355] Xen call trace:
    (XEN) [   12.489080]    [<00000a00003ce000>] 00000a00003ce000 (PC)
    (XEN) [   12.512076]    [<00000a00004802f8>] init_constructors+0x38/0x5=
0 (LR)

Observed failing symbol:
    _sub_I_00100_0
called from:
    init_constructors()
The issue can be diagnosed by enabling linker orphan diagnostics or
generating a linker map:
    LDFLAGS +=3D "--orphan-handling=3Dwarn"
    LDFLAGS +=3D "-Map=3Dxen.map"
and then inspecting orphaned executable sections such as:
    .text.startup

Collect .text.* whenever either CONFIG_CC_SPLIT_SECTIONS or
CONFIG_COVERAGE is enabled.

Apply the same change for arm, x86, riscv and ppc.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/arch/arm/xen.lds.S   | 2 +-
 xen/arch/ppc/xen.lds.S   | 2 +-
 xen/arch/riscv/xen.lds.S | 2 +-
 xen/arch/x86/xen.lds.S   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 2d5f1c516d..e1b179fe5f 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -41,7 +41,7 @@ SECTIONS
        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
=20
        *(.text)
-#ifdef CONFIG_CC_SPLIT_SECTIONS
+#if defined(CONFIG_CC_SPLIT_SECTIONS) || defined(CONFIG_COVERAGE)
        *(.text.*)
 #endif
=20
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index d0f2ed43f1..6224c06ae8 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -34,7 +34,7 @@ SECTIONS
         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
=20
         *(.text)
-#ifdef CONFIG_CC_SPLIT_SECTIONS
+#if defined(CONFIG_CC_SPLIT_SECTIONS) || defined(CONFIG_COVERAGE)
         *(.text.*)
 #endif
=20
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 65f136dce9..7c19d2e9dd 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -24,7 +24,7 @@ SECTIONS
         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
=20
         *(.text)
-#ifdef CONFIG_CC_SPLIT_SECTIONS
+#if defined(CONFIG_CC_SPLIT_SECTIONS) || defined(CONFIG_COVERAGE)
         *(.text.*)
 #endif
=20
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index b9e888e596..42a17f57e6 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -93,7 +93,7 @@ SECTIONS
=20
        *(.text.page_aligned)
        *(.text)
-#ifdef CONFIG_CC_SPLIT_SECTIONS
+#if defined(CONFIG_CC_SPLIT_SECTIONS) || defined(CONFIG_COVERAGE)
        *(.text.*)
 #endif
        *(.text.__x86_indirect_thunk_*)
--=20
2.43.0

