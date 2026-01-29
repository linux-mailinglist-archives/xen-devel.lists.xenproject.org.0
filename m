Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMc3Oobne2laJQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 00:04:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CC7B593D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 00:04:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217075.1526900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlb3R-0008IV-UL; Thu, 29 Jan 2026 23:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217075.1526900; Thu, 29 Jan 2026 23:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlb3R-0008H6-QH; Thu, 29 Jan 2026 23:04:01 +0000
Received: by outflank-mailman (input) for mailman id 1217075;
 Thu, 29 Jan 2026 23:04:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzzj=AC=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vlb3Q-0008H0-Jl
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 23:04:00 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb0e0b27-fd66-11f0-b160-2bf370ae4941;
 Fri, 30 Jan 2026 00:03:58 +0100 (CET)
Received: from BN9PR03CA0952.namprd03.prod.outlook.com (2603:10b6:408:108::27)
 by SA3PR12MB7976.namprd12.prod.outlook.com (2603:10b6:806:312::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 23:03:51 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:108:cafe::d9) by BN9PR03CA0952.outlook.office365.com
 (2603:10b6:408:108::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Thu,
 29 Jan 2026 23:03:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 23:03:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 17:03:50 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 15:03:50 -0800
Received: from SATLEXMB03.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 29 Jan 2026 15:03:50 -0800
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
X-Inumbo-ID: cb0e0b27-fd66-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEyHoZuNuLqfs3aJcNDewhXFvdanpNKFhcfKh2ff8AZt+UKw0KnERrpcIPdc+WmmXucTdrReyvhfxe6cFPF+LFZlR9P2GiBj5BjJYhHAV8LdZo85Oa8ZKiUWHt4EaBk5osBG+PhE+0sKz+QL1nCEMeIP5bA9lmBoD16y8PhtOLUc/37J9R6C0vvKFRsEc31Vnt/1C9iZq42RZKH/1F6dvDqfVyMViR1H5aQTZ2LvYsnHlgR4ySq+yq/A2L6zIiPftoFKEGw2wqt6xwfmuRQeRMWgj4Ci8vTaF7TvQvR3lg8tesHikM4HB3VQeQXkoI11xadh8pF2T8vwuNzvtihclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rc/3iRD0JqFXqIjo/xG/IZyeLwM/HjQ1QMov9Grx2n8=;
 b=Q+63x/e7s1QoLtDyfwMo7kSOJ13HAELPrCNTuM9ehH0v49rJrIwKKZX/piNHa87P64Rum1MXtlxShGSauLS4TOqyERM2vG9UwRIqLE2bLLJ3GITbLScBli063zdefoSTkSLastDrNDf9kpVW0dkZWjPe9IyTgcA3Gk5Kgr95yvgCCdsxDHSjo90PuYne6cHV1+W98vUnkTUT/K1UzgpYkZQx/cSP6qoIWIbzQmc8NQAezdEz3v0vRRD5SiwbZ23Uu/ORwbBUcT9sDSBEJUcOUQUyYHrbDOe1mxj+kkBxM4Ngzt8B0kPbe8A4zJgsBjLvtj4AacALc5UrLsv4p7062g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rc/3iRD0JqFXqIjo/xG/IZyeLwM/HjQ1QMov9Grx2n8=;
 b=0yhX5u3st8C9DIaNFX635jNbOzGmr5DKtlbdWvFk6Y71WvPs7kTQyYs5NyXYbmELcZeSTuAXOrBX6ZWC2ELGuNtHaRX0rZMOFZodkON65zlbVQmpiRfm2tMqN6Dp7Xd8HYvg43DwqG2Fok2yYqdfJVG9ZCGY/mxXyaoixA6cNl0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jgross@suse.com>, <v9fs@lists.linux.dev>, <ericvh@kernel.org>,
	<lucho@ionkov.net>, <asmadeus@codewreck.org>, <linux_oss@crudebyte.com>,
	<sstabellini@kernel.org>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2] 9p/xen: protect xen_9pfs_front_free against concurrent calls
Date: Thu, 29 Jan 2026 15:03:48 -0800
Message-ID: <20260129230348.2390470-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|SA3PR12MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb85172-49e5-4457-6db3-08de5f8aaae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g+QUrCUF3Zqorx7xMLo9LenwN+sTfaAr2Hdp2y246LyaQGx1XhBgAXyxQf+t?=
 =?us-ascii?Q?0/C7f/RQOGiKqgObB2Nc/18vaB39JIpJkjmFD6DATvtYdtHUzYWBttxc+QZo?=
 =?us-ascii?Q?zHvjz2CFkApHe3zA8YX/15v+0osi4uexxWT8oKTNbmWlBd6RvZzGfUO2XEyt?=
 =?us-ascii?Q?pKaPaQuZvAGBHc76o0plGDlUZNsYNjwdvOGFUHMy5kv/IPDhw1lksB3x2geJ?=
 =?us-ascii?Q?Izr1DX8mRYf4hMuHPmvHIVclvC876POZvLi8DkznuuQCNRyORdxYewVSN/RD?=
 =?us-ascii?Q?qf6FJRRBViIDHeA8I1nrt5rz79eSngIl3Io+2gi87rXkcfjup8mP/ehMdII9?=
 =?us-ascii?Q?vMwAEWX4leM6JFmcvDwsA9zl1piVIGwzDqBHqZXrAo6UXunKm8z3OUBrZ11R?=
 =?us-ascii?Q?LpqcMOWydFmQuIq/2OI5sGzLakMHZbanevbgw02IzGTs1e3uKdGmms4FPpIV?=
 =?us-ascii?Q?h0tDmblOeIqYVA8mCW+scFHwNKhEim71HFpcYEMtvQsGz9CbFxCGEhvTRRUz?=
 =?us-ascii?Q?ZE1SyzMhSiX8spaEr0LaOI4tfCUcTw4Gi9RGvYbdYoQei2ug1mJ5WQbiuoAF?=
 =?us-ascii?Q?U31a/YqPY8LSyyMj49cKaI8tIx9/Y/SEq0nB6wG3GSzmpjsL+PIQA7WC/LHB?=
 =?us-ascii?Q?PJ68axgMBIuO0JAquos7hCyGIoRH8PEfc5I73roBluPotv/+R3/8AvXECYmg?=
 =?us-ascii?Q?/sM679lJWXQHPmN9yL3KzrbNJCyHE2UDPBvfD2jijeHA+kCR8c8vUOqeIKh2?=
 =?us-ascii?Q?XJv0VwtbMgJRUUJ7XAyvk+zvfGdwMZbPx+YVsv4Wd21EHrsiJZdHUhbx18US?=
 =?us-ascii?Q?pM8GUDVtZDEjneN8fcm5YlRuq317o6wsHpHsyqK8QmNgfp80xOqJsnMK5qIp?=
 =?us-ascii?Q?DPI9MSMr+3rPWP5jQ4ioj0+ziEI7TVMsB7jnnObgDhLnLa2Bpggi5IyJbJxe?=
 =?us-ascii?Q?3bEPb4cG2M4StQtv2g8Lx3qhXNNAKSmFHUfUYnvTJTX+LnvqB3YddNQigVTg?=
 =?us-ascii?Q?faDaBh1pzKCcOFy/NXaIvn0bNTWaN/QojtFcrVuaeVY04qH6YrmdmsufYXxm?=
 =?us-ascii?Q?BXte+DhyO8jM7AhHI5Bg5pVaZj88xfUrYMSp2kE5bif9AEHN9zCR9IuwP9TZ?=
 =?us-ascii?Q?2KVmCRUuWZ1VVaC8NEfam5Ox6kQhJRWS87n2CWpr7sZJ90nmT/UEVFfYedJN?=
 =?us-ascii?Q?HPWYyPvBG3B9qllWtBctUmTmyGtCnx2B9E+Pe+vTwON0lffbp1BSzY0mlF/W?=
 =?us-ascii?Q?w40Q/Lhf7tDcjIn1Y1Ku6E3sn+nTzLaw02Lb2fd70udrC8XdmZE07xy4b2e8?=
 =?us-ascii?Q?jNMTVNeQX0slca9ZJw4nAGwM67zQ9k7uqJ/fQM/RCnRYvkm/yYWQAJ/0AtrL?=
 =?us-ascii?Q?HqyXwiYRDileQnBs4dR/qm93PlgjDd2+52J3xYM9E+VhDrN8i1XCC+qBaAzx?=
 =?us-ascii?Q?zzg9jPVlB96qwOZmTscX05dHcaH/nK1AWJIshbvpkoQ2gziqCMevkwFe94ZP?=
 =?us-ascii?Q?vFX1OkrNyGv2k3Iidv697E05GcGXcNFfE6x9+k28RUlam2pWwkPbwhaEmpFo?=
 =?us-ascii?Q?ce2PgMR+uLyTHCOnco9cWMHml/7NyGmOl8UA3ylhAIm3pbpuN0LNlGWiibGt?=
 =?us-ascii?Q?DxQyCkLqdydhQb3b1MpTLj0bmdmqeuLluwtO1ENVPyb9zwkijveyHNKCG9gB?=
 =?us-ascii?Q?Hm2qTw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jnoSlLdE/HpUKS8u8czDDMIioILQtOUNPe75hjWI8kz7uPkbrjun6+bK00tSThV/rH6SRkXO48s2rsoM3FxD5bC7oJJuMmrIJii7ewhyEtuB1I1OUoxRGC9IwjgdnpGfu4Te5r2bfr+WwLDFoB7HhJt+b99xDsqvgvSegWlNftO4py7BzsuWLJfATsJfVe4uaSn3glQQYsuqHwpPdyfHy5b8cpS7MWjTiyOq1H9RUJaykVfBdgRfN33hRTQQ+C1ETIxvsBfxQpc5nxn97ZixRsKqPFo3qfeEh86iveQvbh/eQ/EhHUdcA8pwid1+SSzrD5vhWXnLt+FNHohgH7x3XY74sxikXfRht4tTSTNgWN4yJvbT9DJ9n7Ox//C4YDfK//fV6e7ZX6lxHtJ40tg5WRJN58twhXmH8+BWBhjCl4mV82YI9vq9K8061H3CF+G5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 23:03:50.9854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb85172-49e5-4457-6db3-08de5f8aaae2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7976
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:v9fs@lists.linux.dev,m:ericvh@kernel.org,m:lucho@ionkov.net,m:asmadeus@codewreck.org,m:linux_oss@crudebyte.com,m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 34CC7B593D
X-Rspamd-Action: no action

The xenwatch thread can race with other back-end change notifications
and call xen_9pfs_front_free() twice, hitting the observed general
protection fault due to a double-free. Guard the teardown path so only
one caller can release the front-end state at a time, preventing the
crash.

This is a fix for the following double-free:

[   27.052347] Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b6b: 0000 [#1] SMP DEBUG_PAGEALLOC NOPTI
[   27.052357] CPU: 0 UID: 0 PID: 32 Comm: xenwatch Not tainted 6.18.0-02087-g51ab33fc0a8b-dirty #60 PREEMPT(none)
[   27.052363] RIP: e030:xen_9pfs_front_free+0x1d/0x150
[   27.052368] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 41 55 41 54 55 48 89 fd 48 c7 c7 48 d0 92 85 53 e8 cb cb 05 00 48 8b 45 08 48 8b 55 00 <48> 3b 28 0f 85 f9 28 35 fe 48 3b 6a 08 0f 85 ef 28 35 fe 48 89 42
[   27.052377] RSP: e02b:ffffc9004016fdd0 EFLAGS: 00010246
[   27.052381] RAX: 6b6b6b6b6b6b6b6b RBX: ffff88800d66e400 RCX: 0000000000000000
[   27.052385] RDX: 6b6b6b6b6b6b6b6b RSI: 0000000000000000 RDI: 0000000000000000
[   27.052389] RBP: ffff88800a887040 R08: 0000000000000000 R09: 0000000000000000
[   27.052393] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888009e46b68
[   27.052397] R13: 0000000000000200 R14: 0000000000000000 R15: ffff88800a887040
[   27.052404] FS:  0000000000000000(0000) GS:ffff88808ca57000(0000) knlGS:0000000000000000
[   27.052408] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[   27.052412] CR2: 00007f9714004360 CR3: 0000000004834000 CR4: 0000000000050660
[   27.052418] Call Trace:
[   27.052420]  <TASK>
[   27.052422]  xen_9pfs_front_changed+0x5d5/0x720
[   27.052426]  ? xenbus_otherend_changed+0x72/0x140
[   27.052430]  ? __pfx_xenwatch_thread+0x10/0x10
[   27.052434]  xenwatch_thread+0x94/0x1c0
[   27.052438]  ? __pfx_autoremove_wake_function+0x10/0x10
[   27.052442]  kthread+0xf8/0x240
[   27.052445]  ? __pfx_kthread+0x10/0x10
[   27.052449]  ? __pfx_kthread+0x10/0x10
[   27.052452]  ret_from_fork+0x16b/0x1a0
[   27.052456]  ? __pfx_kthread+0x10/0x10
[   27.052459]  ret_from_fork_asm+0x1a/0x30
[   27.052463]  </TASK>
[   27.052465] Modules linked in:
[   27.052471] ---[ end trace 0000000000000000 ]---

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- move priv->rings check above the loop
- replace list_del_init with list_del
---
 net/9p/trans_xen.c | 85 ++++++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 41 deletions(-)

diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index 12f752a923324..9bbfc20744f69 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -277,45 +277,52 @@ static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
 {
 	int i, j;
 
-	write_lock(&xen_9pfs_lock);
-	list_del(&priv->list);
-	write_unlock(&xen_9pfs_lock);
-
-	for (i = 0; i < XEN_9PFS_NUM_RINGS; i++) {
-		struct xen_9pfs_dataring *ring = &priv->rings[i];
-
-		cancel_work_sync(&ring->work);
-
-		if (!priv->rings[i].intf)
-			break;
-		if (priv->rings[i].irq > 0)
-			unbind_from_irqhandler(priv->rings[i].irq, ring);
-		if (priv->rings[i].data.in) {
-			for (j = 0;
-			     j < (1 << priv->rings[i].intf->ring_order);
-			     j++) {
-				grant_ref_t ref;
-
-				ref = priv->rings[i].intf->ref[j];
-				gnttab_end_foreign_access(ref, NULL);
-			}
-			free_pages_exact(priv->rings[i].data.in,
+	if (priv->rings) {
+		for (i = 0; i < XEN_9PFS_NUM_RINGS; i++) {
+			struct xen_9pfs_dataring *ring = &priv->rings[i];
+
+			cancel_work_sync(&ring->work);
+
+			if (!priv->rings[i].intf)
+				break;
+			if (priv->rings[i].irq > 0)
+				unbind_from_irqhandler(priv->rings[i].irq, ring);
+			if (priv->rings[i].data.in) {
+				for (j = 0;
+				     j < (1 << priv->rings[i].intf->ring_order);
+				     j++) {
+					grant_ref_t ref;
+
+					ref = priv->rings[i].intf->ref[j];
+					gnttab_end_foreign_access(ref, NULL);
+				}
+				free_pages_exact(priv->rings[i].data.in,
 				   1UL << (priv->rings[i].intf->ring_order +
 					   XEN_PAGE_SHIFT));
+			}
+			gnttab_end_foreign_access(priv->rings[i].ref, NULL);
+			free_page((unsigned long)priv->rings[i].intf);
 		}
-		gnttab_end_foreign_access(priv->rings[i].ref, NULL);
-		free_page((unsigned long)priv->rings[i].intf);
+		kfree(priv->rings);
 	}
-	kfree(priv->rings);
 	kfree(priv->tag);
 	kfree(priv);
 }
 
 static void xen_9pfs_front_remove(struct xenbus_device *dev)
 {
-	struct xen_9pfs_front_priv *priv = dev_get_drvdata(&dev->dev);
+	struct xen_9pfs_front_priv *priv;
 
+	write_lock(&xen_9pfs_lock);
+	priv = dev_get_drvdata(&dev->dev);
+	if (priv == NULL) {
+		write_unlock(&xen_9pfs_lock);
+		return;
+	}
 	dev_set_drvdata(&dev->dev, NULL);
+	list_del(&priv->list);
+	write_unlock(&xen_9pfs_lock);
+
 	xen_9pfs_front_free(priv);
 }
 
@@ -382,7 +389,7 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
 {
 	int ret, i;
 	struct xenbus_transaction xbt;
-	struct xen_9pfs_front_priv *priv = dev_get_drvdata(&dev->dev);
+	struct xen_9pfs_front_priv *priv;
 	char *versions, *v;
 	unsigned int max_rings, max_ring_order, len = 0;
 
@@ -410,6 +417,10 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
 	if (p9_xen_trans.maxsize > XEN_FLEX_RING_SIZE(max_ring_order))
 		p9_xen_trans.maxsize = XEN_FLEX_RING_SIZE(max_ring_order) / 2;
 
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->dev = dev;
 	priv->rings = kcalloc(XEN_9PFS_NUM_RINGS, sizeof(*priv->rings),
 			      GFP_KERNEL);
 	if (!priv->rings) {
@@ -468,6 +479,11 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
 		goto error;
 	}
 
+	write_lock(&xen_9pfs_lock);
+	dev_set_drvdata(&dev->dev, priv);
+	list_add_tail(&priv->list, &xen_9pfs_devs);
+	write_unlock(&xen_9pfs_lock);
+
 	xenbus_switch_state(dev, XenbusStateInitialised);
 	return 0;
 
@@ -482,19 +498,6 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
 static int xen_9pfs_front_probe(struct xenbus_device *dev,
 				const struct xenbus_device_id *id)
 {
-	struct xen_9pfs_front_priv *priv = NULL;
-
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->dev = dev;
-	dev_set_drvdata(&dev->dev, priv);
-
-	write_lock(&xen_9pfs_lock);
-	list_add_tail(&priv->list, &xen_9pfs_devs);
-	write_unlock(&xen_9pfs_lock);
-
 	return 0;
 }
 
-- 
2.25.1


