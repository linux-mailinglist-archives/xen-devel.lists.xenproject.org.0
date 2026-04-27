Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGdxIJKw72lyDwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 20:53:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D8D478E12
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 20:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295227.1571922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHR4V-0001yS-Ln; Mon, 27 Apr 2026 18:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295227.1571922; Mon, 27 Apr 2026 18:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHR4V-0001tn-HO; Mon, 27 Apr 2026 18:52:43 +0000
Received: by outflank-mailman (input) for mailman id 1295227;
 Mon, 27 Apr 2026 18:39:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ynorov@nvidia.com>) id 1wHQrq-0007u0-Ny
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 18:39:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHQrn-00DtTK-QO
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 20:39:37 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ynorov@nvidia.com>)
 id 69efad64-bab6-0a2a0a5309dd-0a2a450784e4-2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 20:39:36 +0200
Received: from [40.107.209.49]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ynorov@nvidia.com>)
 id 69efad66-229c-0a2a45070019-286bd131fc52-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 20:39:36 +0200
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by CH3PR12MB8969.namprd12.prod.outlook.com (2603:10b6:610:17c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 18:39:19 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 18:39:19 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=temperror header.s=selector2 header.d=Nvidia.com header.i="@Nvidia.com"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQeGa+YdNTuEb823qdZS8Hpotu2r72E0T7L133DkAjYdxm4sXHNsSUmdDgfuLqSgZ8ptJqXAaawtnWfzbuYE9JgTht/7aoE/UBY4fb8CsN7gCBIZfgKE1at/fpNpM0xSdAZJWuaUqRa0tqhI+N/yx9xph7PK0K68mzfAl3ULUBoKMqt7kO8SmQqIRPQp/EyHUjaf8pVm2IKhXkERYsuE6sazi1OyFGe8w6Tpyc067R/wsyQcV3mHt7zG29uYi1UdlBEBwV7zkb5+etoOikaMn5emW16FR/V0uWFWi+xABha/3wJBSOsptBb5XuUEJ0gI46UsoZZATZeItdPD4X+E7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nALNUxvPaXzFesZYqSMaFrytkX4CgELDa/JWTp7Lw8s=;
 b=px9mAWIgpW1g8A++4bB0b0HuBTVzWQKUHx38Lv15RAJgY6RPeHYUnILh/TwEOgn2886PJ4HV1v36kbLLG0HxUFAomMviDfWTHNqC74F0NXfW2B6flkUGEtIYX1KuG62cISJfxDrgdMABrDWp6xVA2MUygcqCtHSOnaMZ5ZNilmoI++yqNmdF0OaD0k2KfXGmE6cSPLaiwtfXftefCRmJeENOcw80UlNkg4EMTulJcftI1iU27D4XyjUiX2sDWu2PtYSLmYIgPWNxczRp1XfiNZwvXibbYm5a4muPrwHvEBOL77eyyAZhWYd43uPx0Y5scO9gl7o17mc1PxH3v/Hq8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nALNUxvPaXzFesZYqSMaFrytkX4CgELDa/JWTp7Lw8s=;
 b=pmvWhp/oxEcxQMryFRvqYtTB0A/GaOLun2mURAQK9jJXjqt4Nrc84ZfAfdVzaosEdXMWAP59oi4+UbMy4mec1KbzWHAyoF57I8DflvmrAbfhIb57bYv5qY2FGaPKUQk1zJRQQp9CqnyFj5VocFwyiXwUgS9FNTnrrFLeiZOJ1G9JrF4fAHR8lxFNj5/FwsIq3FU1ajVbQb2H+3//9zc7t+U20kMXMalri61t8NRsJ5k3/mDo4BdG+GEoyoHOcMDJdBMl8UX3LCr93JIqZbyQOPZZ1D/mW+4NjIfkYIV4DzD/8KPPzEEOg0Q59M3wKfLfO1wJ1sZJFQP38+wbciAclw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Date: Mon, 27 Apr 2026 14:39:16 -0400
From: Yury Norov <ynorov@nvidia.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/9] uaccess: Convert INLINE_COPY_{TO/FROM}_USER
 to kconfig and reduce ifdefery
Message-ID: <ae-tVFVfx72oCC_i@yury>
References: <cover.1777306795.git.chleroy@kernel.org>
 <9fe875d2f55af59c12708336c571a46038528678.1777306795.git.chleroy@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fe875d2f55af59c12708336c571a46038528678.1777306795.git.chleroy@kernel.org>
X-ClientProxiedBy: BN9PR03CA0924.namprd03.prod.outlook.com
 (2603:10b6:408:107::29) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|CH3PR12MB8969:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d3e4e6-a43d-4919-49fd-08dea48c4adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TPoVweG6k+dJJz5MfIFVzAwybwz2jm9fSNM7cxd69vHJE9UR7v6gWyNzsADjvW7ykt1GxFh4Loi1ek62Aro4GaYSpAgmWTn2FafAKuzv9brpXCmKrPkRpx9DEAPIV+O5dQy3egB7SEzayZhdD/hWFuNZI6/aSgi9lHWX7gRMsSsQ+hETpWZ33SUUr8PWk26gfuJDFv6mOEW2uC2BXHmIXUBpyDzOLTJkWEZLidp+7/nea6eckeX0OWVi4bEZfR9vET0pIew0s/JD7Zz/RgAl3L1OS3LR+WDk0Cj+9xRSjoZt6hvaQHTWsroBoiVTErBG9cZcE6iDBPvkBn6JALg+xzh67RQUZnSxe3dpsNnBDx7CyfIbDUoxU3lAu9QNZYDT1pjKtmsR0xUxypUJz8heZAAejUX+cI5zyhEOMCfbZhYDfC8lL5HRKEb55UhgnG1W7/6v/FhxkMwqKMlyWokoOjOY4UTekvoZ2YoBlTz/0SexmXJCV8GlzzJCCy3Y1wJ/gnGl1oiAmGAyfo29/0sdy3H4BAYwxQB+IiP82ASQGpLESNwitwXe5+qlNSYOiiNPhvXQr7YPxg9TQ20Ipo3dS/oLszmjrr6IMeWdSIzAycLxAjM4ybcGKoHCvx/iHvz1ya1/Lu6sN7VNJ7G92kgR4XUfztSnUa/+T4Ty1oGleBPJ/1/eGU/xx0C11jRZy6aMFQ1qLzVFXPf+Rw3f5XbXFGlI7ibkCm1ybi3SLvQHJsk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oib4bKcV8LA5vdjLqJ8bgcxtg+HiGQmptbpLOggOnOXMP8WzMNQrzTBLxW0t?=
 =?us-ascii?Q?J/O13Po8omZAsmm/pQpy/oqttV579odYMQrIVxXSjgf18STek1XRrKGwVmp0?=
 =?us-ascii?Q?l0BU1ufe1EiXFQOU6+6botm2sdTbVj9guzWn35tmDPDQr3Dwwmyjq5n/e4XI?=
 =?us-ascii?Q?SzRjxH/T3DI21r6vl4cCl334Ew2ij5/yQJC8A/DRNX+V7pyzPYuZovSr9F/H?=
 =?us-ascii?Q?Wgm4eMo8ZKAXBaCC+JcutRhN7eAH9v+cW52Q3ahFRH6xBK3C4/Z3i735rmIV?=
 =?us-ascii?Q?aMfpxHZ0SFW7fKav66AdZnuwM6sLZ9JgRxdV6lUM7BH/+pQ+3Pt5OuxuIF7P?=
 =?us-ascii?Q?wOEzXGgLg/FCQyv3W40kHRzWP2soqwyli3M0yrSc+NSjlNU55HajGFi1JvaI?=
 =?us-ascii?Q?tiNl9ri9lNxc+qE7KdAVPFL/2e+CEWg2vZahotUnAp3114m5sQG/4rVIg4gm?=
 =?us-ascii?Q?gd9zXeVaEsINZnTiz1qVCTLSKFcxLzulAejw8jMwtJRbeGBzK4ZC1e7VOCW+?=
 =?us-ascii?Q?aKVYJaES/nOjEprimIme29LeOa01vmBbY6+qz+yCseVYOQCq9CdDX7e1deoV?=
 =?us-ascii?Q?zaTnta1O/6L4nX1080PXzmu9mTtYtJNQO3DF9ovWHiONsmGP4U11bu49laOs?=
 =?us-ascii?Q?B0UU9IxLtWutiJxYBVD0KN4xfooNicHXXZR6LrmeOgPpcSsKDeGO2BnYG9lv?=
 =?us-ascii?Q?jdgN60ENdKBvmSOFTzCRkCByFYt+/x7RaSBTKsrsbJl8Enat/5Q9rpxaSuYv?=
 =?us-ascii?Q?Hk0QJmiBMLq/XaaCVVftv/lOLZiG1rfq9bJc6AGkJ7Be2P6481HfBvkVoSKm?=
 =?us-ascii?Q?7dS46V0SCDnMF6O9L5WMOGcQF3/JmPJwDC3bbG0KXyXraugzFpO2I2A/zirX?=
 =?us-ascii?Q?a/CdkcxQ4G6IILYhs8aeRubhtiJ4TjMT/T5Mn38f6As5actrgh5OSaby7k/P?=
 =?us-ascii?Q?p/eP1WrTDycIQ7kQbNn0vPkAk/h7ELW35FbH3Phz+HVj/qsyPVuI3ZrMXUag?=
 =?us-ascii?Q?WAN4DeGhJIVi4hPoLtGwda6uakBNXByYqWFG6Y8WSZFrAuFMwEgvc3vSyFyl?=
 =?us-ascii?Q?Dx5n3nRrxw1RgZUiiAKDP0rwsC7WGhhl7rCLYH8tGf3cooY4z46us5fwXFjC?=
 =?us-ascii?Q?wNTDl7f7oWOaDilXo0Jux13wM3eh0BtH51CgLCN9tDrJnzsW7ZyZvcKQk5Tn?=
 =?us-ascii?Q?O9ixfPU/YHVSwPfjb9gBof+EiT69zyPNYsZE4X2O8CyU4Z8XVVbkKhgMngy9?=
 =?us-ascii?Q?YRDPa867pPjQhJc3j8j98MgOVgWGheyih5q5W+m9AMvdBEneu+a9dnByQyMn?=
 =?us-ascii?Q?qCLgefyIDgxtIR+PcNMkMkPhjugjUNVEanta6lIV/gHJ2JE334rR3ZB3QcoQ?=
 =?us-ascii?Q?NbJNKCyplpSmz2mdkoBN9xHWSzQA2d2/nRHmtmEYPxzVHY+pAEBbGSLUGA+G?=
 =?us-ascii?Q?n7hhnzbzDtnl+NVWD79E8VDdTdq6sg4VE3PrKKvMdORAmzEkarJh1RDPehzr?=
 =?us-ascii?Q?rf0jUwl/4QGQHSZRpxkK/lDw7l5CdWKgWv1KnfHZnVpP43iLu8DuyVVHQL2R?=
 =?us-ascii?Q?VCkeADDpChtUpYBLJdlINE5FPPK7QdiOkkbRoLE8VBbhAFo5vAXH2E7YlciW?=
 =?us-ascii?Q?k0gtUjR84c84anx2yV2+7D9n2SuoEUaYGM1OOv9cl/uolZtt2Je3yiYv7HTI?=
 =?us-ascii?Q?yD9W0nKiIOg27gfW0ZUuL7Zq68OzdAmeaqD7+UqqyPO6Vm6rjH2beLlolKD3?=
 =?us-ascii?Q?NnU9q5OrFzP7EEzyxKROJwYEahtrjRNUQfGufTekFC1cKWXYO/DQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d3e4e6-a43d-4919-49fd-08dea48c4adf
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 18:39:19.3919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EMi8W1U4wKLqFUR+2jNWxP3McH9TdZjJFX+Py1zekodl7uM/ruq8Dm5SoHnnrACMPwMaK2iGgbUgpHPN2cF6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8969
X-purgate-ID: tlsNG-ef75cf/1777315176-2B77AC48-2551BCDE/0/0
X-purgate-type: clean
X-purgate-size: 1048
X-Rspamd-Queue-Id: 13D8D478E12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:akpm@linux-foundation.org,m:torvalds@linux-foundation.org,m:david.laight.linux@gmail.com,m:tglx@linutronix.de,m:linux-alpha@vger.kernel.org,m:yury.norov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:dmaengine@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-fsi@lists.ozlabs.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:linux-wpan@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-serial@vger.kernel.org,m:linux-usb@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-fsdevel@vger
 .kernel.org,m:ocfs2-devel@lists.linux.dev,m:bpf@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-x25@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-sound@vger.kernel.org,m:sound-open-firmware@alsa-project.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-arch@vger.kernel.org,m:davidlaightlinux@gmail.com,m:yurynorov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Mon, Apr 27, 2026 at 07:13:43PM +0200, Christophe Leroy (CS GROUP) wrote:
> Among the 21 architectures supported by the kernel, 16 define both
> INLINE_COPY_TO_USER and INLINE_COPY_FROM_USER while the 5 other ones
> don't define any of the two.
> 
> To simplify and reduce risk of mistakes, convert them to a single
> kconfig item named CONFIG_ARCH_WANTS_NOINLINE_COPY which will be

We've got a special word for it: outline. Can you name it
CONFIG_OUTLINE_USERCOPY, or similar?

> selected by the 5 architectures that don't want inlined copy.
> 
> To minimise complication in a later patch, also remove
> ifdefery and replace it with IS_ENABLED().
> 
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Andrew has taken my consolidation patch for INLINE_COPY_USER:

https://lore.kernel.org/all/20260427085814.7ca0b134603b8d5813e23396@linux-foundation.org/

Please base your series on top of it.

I'm not sure this patch is relevant to the goal of your series. Maybe
send it separately?

Thanks,
Yury

