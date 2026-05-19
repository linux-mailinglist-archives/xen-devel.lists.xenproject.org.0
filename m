Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBv8F2FvDGpKhgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 16:10:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34DC5804A6
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 16:10:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313107.1583335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPL9L-0001Sx-QS; Tue, 19 May 2026 14:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313107.1583335; Tue, 19 May 2026 14:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPL9L-0001Qd-Nl; Tue, 19 May 2026 14:10:23 +0000
Received: by outflank-mailman (input) for mailman id 1313107;
 Tue, 19 May 2026 14:10:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Yazen.Ghannam@amd.com>) id 1wPL9K-0001QX-K6
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 14:10:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPL9J-009krr-OZ
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 16:10:21 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Yazen.Ghannam@amd.com>)
 id 6a0c6f42-bab6-0a2a0a5309dd-0a2a45039062-42
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 16:10:21 +0200
Received: from [40.107.208.46]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Yazen.Ghannam@amd.com>)
 id 6a0c6f4b-672d-0a2a45030019-286bd02e3a5a-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 16:10:20 +0200
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 14:10:15 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 14:10:15 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btErGJ0F7paZRCGhfNQogohvV26GDw8F6BtYyC1yanoEkVQ/WqCs5VOwBvq5Iwnyy99FPO6kfJno8Ww05Up8tkcLc+SuItIRT63He08lPr5whbYPbLpWvYD65xjI4jpjr+gCn4orE/aZsYaMIK1xXqJ50mj8UbFKUUQETBMZnGXyZKDoeDLusRwVvWsTY1ButKmSDuAfWg1ekNoSFhjHzKqdjeQK46G6EsXytgLfOb/MUvICmAwUSm9IkByp/tvHK/25EZV6kziIsRJQNXYj6nWtyrgCGjoQoiKyaiZ9XipoKYLeOjH681F2Zt9/V/qF/jVhhAcsZOFgq2geb89dOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSyxyiXr3NhxlqSMoUOj2rYZGQfdPYOffTIYUa+1i+Y=;
 b=VbVekySlgO5KaECW8pMQPGhtutQzg1XFB8AxcW+AbQIIdHn2ycjpHXzdhadXu1khaQKKoNH+xmPtC8+Uh12M9W2Cj7ukRzDgW27JveRePHMuiUTnO1Go8TpL1/C8iBqOeRqNH9AgH5QfzBn57tz+OiYTcmXCVvYWUGkD8pn8Ox+bd+V8S3wyY5OQRKfKKPkIUqDm17GHkT/eMU/WAh9hsuROT5d5hOl1yDMfPOLgikQUDKCyEH8NGCLNIRjRAkeLpUdLEzIGDwN8hSs/z50CEFIHN+no+o1UNTZMuWJPKvpism9aldoziAHH9QnLHMY9SdiX59Z7rk+bmEABufOciA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSyxyiXr3NhxlqSMoUOj2rYZGQfdPYOffTIYUa+1i+Y=;
 b=AQJsIK0c0FcKNgQeMv3EiXMiol3200Mbq4tK+q4TvL7uN9Ypr+VkMA0vj3ZxulZzkXzS3qvhge5rHk2o81Hb7pt+L6eIuT+6aJbwd58NOxGqGIzF9LKmb5QJ9ZxcsKPHtM37XNMGGial6naISQifIYvow1coqRIgGa3WrlytH6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 19 May 2026 10:10:02 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: Penny Zheng <penny.zheng@amd.com>, x86@kernel.org, ray.huang@amd.com,
	Jason.Andryuk@amd.com, stefano.stabellini@amd.com,
	Mario Limonciello <mario.limonciello@amd.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] x86/amd_node: harden amd_smn_init() against Xen
 dom0 topology
Message-ID: <20260519141002.GA369920@yaz-khff2.amd.com>
References: <20260506055528.476493-1-penny.zheng@amd.com>
 <3531c9e1-97a8-42ab-aae7-4cfa8976f443@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3531c9e1-97a8-42ab-aae7-4cfa8976f443@amd.com>
X-ClientProxiedBy: SA1P222CA0027.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::11) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|PH8PR12MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ff1b07-77e1-469b-2fd3-08deb5b05974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|18002099003|22082099003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	ZpwW8F/H7IdDnFpbyIGsdPl9+WLQAbQCFSs7Wijc1kktXW6QRkqcZHCKJXgjDMwKNKNa5GusTFzPmfDqwBymqgvKLws2sJFdMoH4UMa956BA+TyojZRZLrqSx2lIpjr1honW3X3jh7kp8BpBMc6WuUF+go7M5ZK+s8IiImxm3WX0QSOO8b0aHwnxcaYdxOO8zW+87ypl/WG4wiNM8Q+Lwzg8OlESbIXViDnXszUPf3s/yC7BMxGyrhGZkC3ymmMiq98OPkTwompfx4vvOStebDc9MdYTs9tDFUTABXJSntbk8+wR14GJiQbvolmkU7eqeGkpky5SGqEpKOglvd29hcE2e28u1UiRV6SYoGWdDIUNya/RQSZouM0wA/CTvc4qrOS5P7sAxyj74vRCvxsD12tTWiIJ0HfFqJN1yVOlyrcu49rfj3b228mR+ZmCNCLP6J8GX0a5sVfPZas5n79e86bEeD+9dQZzfl9JS4ZMZTqel3/bT9LNO2KdAIWd5ax6K6aziuWQ5u0P/+P/Jm0Z5Jm2cKk88sVFDOSmayM06qLCxOUHE3ZGs1gua40npABFTBSUklGLg68SY/ZpBPgmPG6pzyvhWa2PorUZEu7c3cOLxlnIglSkqfUDxrYEwPEEXIKiHVDXfsjcwiSv5Xib9KUDkHoD3zv5X24kC43J69vdDcF5+MrRN56hbDM/m0PB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(18002099003)(22082099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9EmZ8f/tDBfvXsRoD+tBkCACjoge4XjKHsBSI1sM1MptpH0y4Uv2Y5OAa/O/?=
 =?us-ascii?Q?fJYwM87jMuY2cxuUz7ShafQjSCGlxWBm2y6rmtOqldTZEUSiy+LhfftA6QHQ?=
 =?us-ascii?Q?1Ls4txfEfh7/M1m1x+mW5cWyzUYh3rZrcLXKS/dTEM/CVRrgGQ08hRab324p?=
 =?us-ascii?Q?HCeGXRRCddDuR2/A2TwmGJLIjvpmFLfATmiKgXt49G8TJ7p7dikrh4xjNEAL?=
 =?us-ascii?Q?YI13SlfnEappy+xtNIOeEJUnXtoSx63OZbJT4skW687vLbIpGOjFZPdwaRzE?=
 =?us-ascii?Q?kCg9Gd3W3TM/CgARHHSCqgz55vGuwrvItlHJsBSOVA2DzDyAp9nBIMOhjiG5?=
 =?us-ascii?Q?FTf2nJAmYjBfb3QyKkdNyiwAKYa7EIxi13XHb69J7lHPfrD5MpyeoC93whom?=
 =?us-ascii?Q?SIdQuHaPi36C49una70HfvYNaYhqaVNqbEfjBMT0FdvAF+qJDtzIs0YkriDz?=
 =?us-ascii?Q?udoOXnf/6/r7EusiSdWGoNWARvnTpil9dcydVzk1pzVj2zudj4KS/uG53PPl?=
 =?us-ascii?Q?sZofqe2Sn8d1EJNJpZ/vb1FodVplK+btrg+H7Iwi3QNAsyL1aHLMvsvMsnIb?=
 =?us-ascii?Q?0xpgnCt4Fa0aPUkK13YRkhP/fci8ZGG51HRRsk2Spftv6H2VIs3vf2Zlajbp?=
 =?us-ascii?Q?QoTOxSwWcdzPrekl6Qx4tzS+xg4JlhOlyr0OFcYufnLZ/KcNIhUmR9V8Ytwb?=
 =?us-ascii?Q?484EZLZrOfUHEtwYlyxW3sdIY+8+NN/3GC3fN90kiLD4iUi/M65CIxcdvm9S?=
 =?us-ascii?Q?gdohHD5hRuo6WZ7TiACf0zVcXXRwsApY2GKOcgq1CBQqHh45JIUDb2pXvcXz?=
 =?us-ascii?Q?NgYFk0+F1NfJtFGSr++SyGatnSfTZKrHzOk/xMYjnZzBWWj7d3ZgYMOWc+x3?=
 =?us-ascii?Q?6n4Uf0gSy5LsReaUviBKmihMlrRJAmiuFI2fFCZap7Yl9WDvah4gceE7WVOn?=
 =?us-ascii?Q?G1OxpDjC2XJ3VdC9d9UW66+jmJMdz2bFDx96S91OCCEpCutjy/n/q3nrYMk9?=
 =?us-ascii?Q?r0hUNmaoY8wipy4BbCL7apDwveuQm8K6xzXfj2m4yrAp73rONRjYAFqOIr94?=
 =?us-ascii?Q?tPrnJASrxeMRyAJ0wZt5alWIPhf+3EEwuSMYhmRDXHfWNEN8FAG1FPY5vX14?=
 =?us-ascii?Q?bthzZfVcAhbroDvYvCgGJvq6DzdZJvzutzG3z0ozp8MIrRUfIB9GX3XeVCwu?=
 =?us-ascii?Q?ZdeVwnPoh3ary69cDc4PZ4gi+IBLNNAeQzmq7WGwk1xQ/gZAbCmhN4jFedR2?=
 =?us-ascii?Q?8tYSyMB9TthTpt5ghHoK2xTzD7XFw2GbM08Cf31WGgz00VVghYB6H6OsGgTK?=
 =?us-ascii?Q?gaGBNpDtsFFMSd0pQ3u8PS6bYwu+LzZlHHVmNfJ1jhnp4GUC/0R7rWPlErus?=
 =?us-ascii?Q?jGziXTnz469jJKVL/PO+IBBQwxAu8e7IJhBltzwhKjAx6Nar3GAvc/sDJGGB?=
 =?us-ascii?Q?fxl8qDM1ry4DgkC7N/aKNJMQwV9+nh1ELSP+oklweBGzUBXTikHRVxuFonq0?=
 =?us-ascii?Q?/usFxBe15Y/O2xW2SFtOwYbzqQb7bg0TBYuiiLJ6qnBtkmfNBuIAj8s+aNNP?=
 =?us-ascii?Q?aGYqA7TfX2f2IqJwolGGLSgbnooKQqh4qAIAX4Ws1sGhqctbfSShzjSwew7F?=
 =?us-ascii?Q?XW8jnjBBrakdqap6Ys4vcv1Q37c/b3TmMoIrJ7vtgUcSK6RNDvsUFCDylOyB?=
 =?us-ascii?Q?u8LwzC/CT2lKY2gg6EIMdnTV3GIP+35AfUuwYL823A87J8e1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ff1b07-77e1-469b-2fd3-08deb5b05974
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:10:15.5539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDzAkhWUBH/Ds7psDsGRkUji44rlSsEn246qWSm+JN4GsqZREab8BR0dtMP5iQYyG69BSgTcTJy041YxXblVpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7446
X-purgate-ID: tlsNG-33051d/1779199820-41396938-9ADD7A2D/0/0
X-purgate-type: clean
X-purgate-size: 382
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[yazen.ghannam@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:Zhao.Jiaqing@amd.com,m:penny.zheng@amd.com,m:x86@kernel.org,m:ray.huang@amd.com,m:Jason.Andryuk@amd.com,m:stefano.stabellini@amd.com,m:mario.limonciello@amd.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,yaz-khff2.amd.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[yazen.ghannam@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B34DC5804A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 07, 2026 at 04:37:43PM +0800, Jiaqing Zhao wrote:
> This amd_smn_init div0 oops is also observed on 6.19.14+deb14 (Debian testing)
> and 6.18.27. Given that 6.18 is LTS, suggesting `Cc: stable@vger.kernel.org`
> to get it backported.
> 

Hi Jiaqing,

So is the issue observed with the latest mainline kernel?

Or only with v6.19 and before?

Thanks,
Yazen

