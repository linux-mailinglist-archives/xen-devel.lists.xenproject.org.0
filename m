Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hCcIJIFJzWk+bgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 18:36:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF78837DF97
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 18:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270700.1559276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7yXe-0007WH-KB; Wed, 01 Apr 2026 16:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270700.1559276; Wed, 01 Apr 2026 16:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7yXe-0007Us-GY; Wed, 01 Apr 2026 16:35:42 +0000
Received: by outflank-mailman (input) for mailman id 1270700;
 Wed, 01 Apr 2026 16:35:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w7yXc-0007Um-L7
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:35:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7yXa-00CBO7-Sg
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 18:35:38 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69cd4938-2eae-0a2a0a5409dd-0a2a45089a1a-40
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 18:35:38 +0200
Received: from [52.101.85.40]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69cd4958-fab6-0a2a45080019-34655528271b-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 18:35:38 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CO1PR03MB5939.namprd03.prod.outlook.com (2603:10b6:303:92::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 16:35:34 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 16:35:34 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dP28bdJ0cfLHorfemxbIkaEX81nPTF8/GSV5RfLFnaLDxrTqdvBOEaxoTdQVjH0Js668aYsJVriIigvkJKIdids6dPR7r8jdeBB8iEl8J8eBXqIahbQpJXuKvorPHpVC7bz0UiM1xJBu7s0RO3cKsggo069XXu1S+EUOHgKwj5vrq+s1ZE72odn9TFWqxQyauCFwmJRbR0uRA25vbZj+qvH69cSqVQjBHWpZADZyayr5jrgzmBnt4ZNqEXmXtKIVOhLWSKfwo26MQW26nhbOMHIla/Xqqb9fh8WAmNj/NTrgl+HN4i0h4Mtev3eA68FqLatBILm/0Ziw8I9ZcatfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVIKuejiwA1WzmB5Jt7Veorp0CeFKLFpP3h8Lx0E96E=;
 b=v+WHFIrwlaG63gKCYnkawOgXzhtyZiRcgZEV1/msgfKty+y4YFKUf3gerBhSbTm/vXXDbUu3y0eUqBhbauz5+MU8vVljctJvsMV7zrjuZGOezWExz7XpGMtj+OPWG78HP76fSyO2r7Pd/aKEmu926vZFjiepjOBPHavklxtcULMtIPtRYQDdZHrKAwCBnfGrOSHXBOicFFPpIomTo2pPiv4ydmxcOHW+PWgp0x6Z4VXKQqNPP/kFFGziVfnIUVWFE57AbZUYwH0Fc/LP8hEvoV4yjfECvTYAK/ExmvKX9VH3q22tul3MmL/mtGBm0NRkjSX1eduP4MGPIYGtvov8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVIKuejiwA1WzmB5Jt7Veorp0CeFKLFpP3h8Lx0E96E=;
 b=nEza/G8ERKdWJyVI5MHOflcJ84zf8yBZFGK65+2XerqF46TeSDrD6rNBuU+Mka7QUzt3tC4hjPnbTQJqSPktiMRyLrzfPg0zeMmxVr31ESsxPIeNtmksxqoTiTN8JWH3SMK20FZsg0B/DuD4l+/A2HMkpqp7MxG3WFKP+dounUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 0/3] Lockless SMP function call and TLB flushing
Date: Wed,  1 Apr 2026 17:35:18 +0100
Message-ID: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::16) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CO1PR03MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b88b56-a033-4010-7210-08de900cb28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C/DdmIOa4jsZ///NS1RpH+HvX0MiMo/6ZborC0CTpyGRmGhWSblJ8OXcgGc6PF+sAD64smuRnKZFM0rKp8Fl06bNB3Pe6jzOi4jlySXQAnWwPXLdkkLIN8VwpAW5loxg8m2YTX8PTK1eVzUYadYRV07H+aepNDi41SEFInFkV+3g4feV66mhZKevHDmtUPcb3rWl+oYJZAWQLb22B6q5qclRiu42mM3NxAEQibRuMP3wjzsbKAon+14UHvYqDGnZwNbyFCEcdjMO+qNiM9NssVD/LX3aStISYFq/cB72ddSNErMmw7opsgGiyABg1WIIEhTGw5V3vZFMljNJvisP0P5wE4SYSQoFkLE+GqbdyVdpxfwti26SQhZyuDP2bwUT3zmvVQMTQdJTf+aEcIXaFDiXWPyC7ifHW82eVrT/BMgaIZDVlfXE09Ya2HIlD3RVCqk5NnzdUbDYh4snIPpWMVQ1MvmS8XRRQqbYEeNVf3/HlZXk50uBjJ6frKLjFf6Qo3TDDz4Owoti5h4cH+mpcIMirznbgI4La+8gcVMc/c6azum0IUP4E7UT0pCtwPU7rRCtuvq1qKlrN4gX5Ex/mk5LdKRV11Y8EYKzp8TkVnEmc/62YqNPZC+XF0qXlEz1l5UVlx6U/rxdAoX7Nfn+FYy45N7A0f5I9wZFRu6XKABd++XpQ7aVA5u2yr25uQIsP1Zwmq1GqmpqWGZfA+8g4eh9jcTuFBOsoSPMV9eO6Do=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ADP1tYO0EOzguBOddM6rmwRUmNTiw7U6sNpieH5iea4y6t3yXKWCPYqDCajU?=
 =?us-ascii?Q?p/2vkb+YqmOc8ZgGK3Mliw2GTgNVVqa4gTj/ASVh06qJJdGX7yQyLpRIYykp?=
 =?us-ascii?Q?XlOcJiTMbuZVBXKGwktyHLiogryXlWHxuzEGNCKC2yRAGzON2DmWersnH5rP?=
 =?us-ascii?Q?NqD0+UrdiJ90aJuCGBV8iZg9OZYkaxCaJkkeEQxhp3wUa5Q2Zmq+tP/MItKm?=
 =?us-ascii?Q?pY3p5jndpkgQQmveOs7EYBEs5y+6ZcbJuTSwO1OBrtn/DAZLuXyY2DLxTktw?=
 =?us-ascii?Q?DTUked8uERykAjN1NnNC4t1JcdT9BDhAHovA9oJCf91KYAxJfUACF3tEy4sz?=
 =?us-ascii?Q?nVWyvNzcBWiCL0//SloIgkRnq/ylkIYRGKmPah7hZOgJgfhhIPsJYaAqsnpP?=
 =?us-ascii?Q?O+0lS9KcDww62mzSOrVJB4ewFKYiEHxSjJeG0bEn7QqMGwtXQmaGwAhyhEQM?=
 =?us-ascii?Q?UPUMtiZ1TqIVaDpoeojEW3v1j7p4z1KTL+3t4BaR9cenZEykpw8wk1QW/SdG?=
 =?us-ascii?Q?YMn1IJ/9RWh3riQtFB0uvNBweYJ/kkpaguAzA15c6+qrUwlnMsGdCi2EQ6Cc?=
 =?us-ascii?Q?GWBKB8DsA0Yr1h/Buz90PSbV1pITvt/XEFry0iJ1KH31AePkI/umZohn5vrq?=
 =?us-ascii?Q?6TUbAk1G557M4F1vE5jWV11vMz4HPRzADgHH7CZWc8nauMtZXxrbIU5346nU?=
 =?us-ascii?Q?VoRfieGJq1mc8NsZuU8b83Y/qBqzV4gu1l/Zdz85HGyNdmW4sZMkAoPu5rmr?=
 =?us-ascii?Q?q8RuV6n9PJnXHEtmX5rTZK+aL4mXhNwgIaBmblrlJV2fI0sDe2tSA6qKc375?=
 =?us-ascii?Q?d96QkcfCXeJiVfHu7NeIiQ8hFxQwqvC0FHPwkVmyd506eRyYu3L5riUMUlL8?=
 =?us-ascii?Q?w2Jgbt7Qh84T2yL3tqGS+ht+LpPtpNdPbpXAZCeoP65K1evKMOGjYCxRL5i3?=
 =?us-ascii?Q?pf7hysMowAE/XRUwf1ORumOibd7zLsABgseQl8ukqJfjE3KyAs8L/oSW3zRp?=
 =?us-ascii?Q?TZPo/Cv1wdPwEbJIPVWM4JXtLAAi6manAgsM42h8XCrUXlPU3BCNRooCGKCd?=
 =?us-ascii?Q?Dyg5Lt52WB1TE4Fv32ddcLfVr2VpNXYtEHr+9McDFEZ/DOTEVIlDL45idjwa?=
 =?us-ascii?Q?ZEF4g9bWgTcsjOp2xtWhtpOcJpfw3FrmxaLW3/g9u+pgKPY2/B7i5e3CJfQx?=
 =?us-ascii?Q?6e54DUDezb5itSBv2eOo6GFULmxCcKflZ8jsxnPLXUjzgAPgzZ5xKQ82miR4?=
 =?us-ascii?Q?+0DsDXqLn/LvnaiiuJt6s35QUqaMVwnJc6x3PIL3l812B8gXu9Sv6RW+AsHe?=
 =?us-ascii?Q?HVJ5fqLbj/K9Q2at0AyBexJ6mtEE5NFtuS/BgMKpS3E9Wua9MgZpF659uOOd?=
 =?us-ascii?Q?slRIiKt7xo/fk1WMzDtiyFZzQPe/9L0u4LfCrhUL+tU2fYzRcOhBh7Scsebr?=
 =?us-ascii?Q?xmDcbdulixChPNUsQpy6kzDLb3Ah/rk3WzbM+WQRxKpNGdcxGIb2K55b91hX?=
 =?us-ascii?Q?YehEQ0/gX1YuSI+BmZx6GuSlpGoWKyu6D4LCM0k/2k3BpWj3I7Xdw3Kf4dRP?=
 =?us-ascii?Q?IicKqlY+MNYG/fGHncGrY+JnSkSg0pc36EmMDkL0Pd1xCtlRKAe/aOjEUBIG?=
 =?us-ascii?Q?9om09oCYgT1O+pj0atL16TCcI8147nRDM4QH7//oQ/93kCtoOpno7b9Ir5dd?=
 =?us-ascii?Q?sfbDBRXjxIJez7SBG6MpHH30IdfK76MjgBEVfo2Rq6iUyyo9IR7IATV8mwIO?=
 =?us-ascii?Q?bV4edRuwTv3nS9SKFTegLBXmGFLYcbg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b88b56-a033-4010-7210-08de900cb28c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 16:35:34.5529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 944Vur4zGkeJ1/pvYeJ+9mBagMPm5HB5BXZq9wGxNfNtJjyydXRin5TxMvbaTMlkOo+1coIYnoIh/J3jV34bds3jx+etBfwqcOIH1PWIqGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5939
X-purgate-ID: tlsNG-c1860d/1775061338-F6D4B497-EFA8377B/0/0
X-purgate-type: clean
X-purgate-size: 2319
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EF78837DF97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

This series implements lockless SMP function call and then rewrites x86 TLB
flushing to use SMP function calls.

We have observed that the TLB flush lock can be a point of contention for
certain workloads, e.g. migrating 10 VMs off a host during a host evacuation.

Performance numbers:

I wrote a synthetic benchmark to measure the performance. The benchmark has one
or more CPUs in Xen calling on_selected_cpus() with between 1 and 64 CPUs in
the selected mask. The executed function simply delays for 500 microseconds.

The table below shows the % change in execution time of on_selected_cpus():

                  1 thread   2 threads    4 threads
1 CPU in mask     0.02       -35.23       -51.18
2 CPUs in mask    0.01       -47.20       -69.27
4 CPUs in mask    -0.02      -42.40       -66.55
8 CPUs in mask    -0.03      -47.82       -68.39
16 CPUs in mask   0.12       -41.95       -58.26
32 CPUs in mask   0.02       -25.43       -39.35
64 CPUs in mask   0.00       -24.70       -37.83

With 1 thread (i.e. no contention), there is no regression in execution time.
With multiple threads, as expected there is a significant improvement in
execution time.

As a more practical benchmark to simulate host evacuation, I measured the
memory dirtying rate across 10 VMs after enabling log dirty (on an AMD system,
so without PML). The rate increased by 16% with this patch series, even
after the recent deferred TLB flush changes.

FWIW, my first attempt at this was to port the SMP call functionality from
Linux. I found it didn't scale well as the number of CPUs in the mask
increases so I've taken a different approach here.

Thanks,
Ross

Ross Lagerwall (3):
  x86/hap: Wait for remote CPUs during TLB flush
  xen/smp: Rewrite on_selected_cpus() to be lockless
  x86/smp: Rewrite TLB flush using on_selected_cpus()

 tools/xentrace/xenalyze.c              |   2 -
 xen/arch/x86/include/asm/irq-vectors.h |   1 -
 xen/arch/x86/include/asm/irq.h         |   1 -
 xen/arch/x86/mm/hap/hap.c              |   2 +-
 xen/arch/x86/smp.c                     |  30 ++++----
 xen/arch/x86/smpboot.c                 |   1 -
 xen/common/smp.c                       | 101 ++++++++++++++++---------
 7 files changed, 80 insertions(+), 58 deletions(-)

-- 
2.53.0


