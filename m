Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78A1B162C8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 16:28:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064065.1429801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh7mt-0005gm-4p; Wed, 30 Jul 2025 14:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064065.1429801; Wed, 30 Jul 2025 14:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh7ms-0005dc-VA; Wed, 30 Jul 2025 14:28:10 +0000
Received: by outflank-mailman (input) for mailman id 1064065;
 Wed, 30 Jul 2025 14:28:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rpg=2L=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uh7mr-0005dU-Kz
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 14:28:09 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:2418::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67e0adb8-6d51-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 16:28:06 +0200 (CEST)
Received: from CH2PR14CA0038.namprd14.prod.outlook.com (2603:10b6:610:56::18)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 14:28:02 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::39) by CH2PR14CA0038.outlook.office365.com
 (2603:10b6:610:56::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Wed,
 30 Jul 2025 14:28:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 14:28:02 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 09:28:00 -0500
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
X-Inumbo-ID: 67e0adb8-6d51-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hI6H0ZdYRa2Xo0iHojcSrgeW2DCC5tjYg/pQv6hhd8bJgPTvEz7Q0qBk0WcxK2oiV+HnYZMtR2yveF4OWw82mgutWiGugX2HbrwD1G2LBc/zC2XeFOcYy/rQ7FbQ76wXgE55dOyb0AMuHDoqrcMaR1tLIB//9aUyqGMvHoMr4PuoT5SeVxPLJ2wD5TJmZbhRDKa1/pdCim5TyD7o1NgXEqXxgBVNE3Pu0jf3ITxvFiKGrJd9sjVyRmt6rlo1FEPCF9lRbzpEdH+zd4emHb9RF2lUWJ9UcNjnbGW9skRA5xriHUmK1phSdvPnKcvqwLVe76vcK+qUj8eikVL4uRH0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/haCqET5t2Vzfy+fMw+44LSkR6n7C28ZyTot2+Zaug=;
 b=hN1cvAdT5QwgXwtqn6srEbaY4/53js/G6eFRkpKiKlhMa6Kqc9ChTVrUjtaAFcMDiatA85murSVqWbgfriZ5ugxmO8esrxgmeAm9jqMnJOA6xH3ppqL2ckXs9RUYkP7y58o74ZfPYf2kBr/tYoNwHf98eYbifYKO0GUbGdzynYcDN8t8uEH+zuVSZEAJbiyAwurOIf5LnQSP2Bz8knYNJF0R0uqk3HgW0vxLT/auEoQBTbtFBGlQxSc0CjU0aHHRw5SjZAH5EACjAQJi8Tdz6bUePa2OIpHogHNlIyhkaIQoQE/mDgzRy2FhVomuoEjGnBGz2zsUYMIwvvZCbE477w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/haCqET5t2Vzfy+fMw+44LSkR6n7C28ZyTot2+Zaug=;
 b=vPGIyNjFn+QS4A1dk7MEG+RllNwwFWPDCJQVGjNU3HGlWLwxMMqlrQH5QdLTqMtmgclOOE5WSqwo8xMeqUonZ8rZWOhXF9w9emaeep0KIoUF76MEaLIYrXl7dGcBGRqovR4WmBC6Rh8VYsoz2uY6Yp2yhHOGrN2mIlbQiq+j+L0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 30 Jul 2025 16:27:58 +0200
Message-ID: <DBPGL1MPZ6Q0.2PETAYI8LVVPT@amd.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, <dmukhin@ford.com>
Subject: Re: [PATCH v12 2/3] tools/tests: introduce unit tests for domain ID
 allocator
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <dmkhn@proton.me>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250730033414.1614441-1-dmukhin@ford.com>
 <20250730033414.1614441-3-dmukhin@ford.com>
In-Reply-To: <20250730033414.1614441-3-dmukhin@ford.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e5f39c-de96-4b19-5418-08ddcf754a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1hQdEJnMElnT3FveFAxR0VMUjZWclhCckw0V1BaUmZjRmZQYjN4OG0yWEJt?=
 =?utf-8?B?dVRxd0orekxjQm5oOGRub0hITEpDOC9iYTQ2VFVhQjdTMW1JRXlKNzc4dFNu?=
 =?utf-8?B?SjhxbnRQNnZ4ZzdSSkw5OHNnZEN5L0JjTWEvcWZWWHV4SVRUK1ZvYTY4Lzc1?=
 =?utf-8?B?ZmhRd1B2Z1hWVTBmVEUvV01acVdhQm96RG5CYkd3aE54T0FqYVh1dHNvQklC?=
 =?utf-8?B?QjYwZW5VVmVhMmNzd1FNTVZURjZaTGRXNFdDRnFKYlZvclhrREgyYVZOc3g0?=
 =?utf-8?B?N0NYZUJQOFN0aEZCc1h6MktKb0E3d0pTT0tDdDRSZ0J0SmlGYjVSMGdiZFNG?=
 =?utf-8?B?MS8yOC84eG1hYVhhTTZvZHFsTTZqcnI1NUJlWGh5RmlXb3BheXR1eWdQMkdS?=
 =?utf-8?B?eUZRRE1wMUJaaHpQa2IrVEVCMGdadnVvRU03Umx6SThDUmMwSHFCTG1oemRV?=
 =?utf-8?B?UkVwc09FWk4xbDVNSW5hdldJdS8rR1VUTXR3RTBzOFc5UnZ6aEtBdE4yTjBC?=
 =?utf-8?B?YlFIZVZuVzdUWTZBaEc3RXN3aFJ1eUY4cXYyczJwSk0zcGdVYzU3TkdlR2xK?=
 =?utf-8?B?MEt0YkFxZDZEaW9RbEZHRndjNXRIYVNKNDFiUTdHM0ZyYWNwdktvbjllTFo0?=
 =?utf-8?B?SWNQN1ZrOTc2dGhWeEJpam5qYVRRSnZCMmZiSzRlbzJ3QkhJOUdoM1Vud01R?=
 =?utf-8?B?M1Baay92VExHKzRZTkFObHFraU8yVmZTVUZjTkRQYzY1a2hKSFRwdjRncWJV?=
 =?utf-8?B?R0t1S3BKa1N3eS9NTmVmcXJNTFd5SGphQTZyNU9RQmRsSnVQL2dxVU5NNXJV?=
 =?utf-8?B?andoRjd3dGpCeWFxc0VPeE41MTFoenBLUERIaElpWUFTd3ZWVlA4VXRITVRH?=
 =?utf-8?B?Zy82cFo5MnUvYlVxWmVxOFZhdVFIWStDTVMxaVBRbzlRWHlzTjN3bkMyVWc1?=
 =?utf-8?B?OE03SkpVdkV0WjNUczA4MkJ3K1pxMTdJNWN4Wmd5cmdnajJRNG5oVE4rY2Fr?=
 =?utf-8?B?VmxsWVd6VFRYQ1JkT1AwTlVHNlVLcDExanlUVTJaWC91TzNYaXErWGpCYkIw?=
 =?utf-8?B?VlJ2S3FUMHRBVE80OXkrb28wYlhKM0ZXQWRQZUsvK3l6ckN3K3hUb0RrZmpL?=
 =?utf-8?B?Y04xMXQ2azBteTF1Z2JzKzB1S2hxQkRSbWR0Wk5Ra0NVeVRXWXcxZW1UdENF?=
 =?utf-8?B?QTNMMU9WZFQ5a2FrWklGSmV1dVdXWVo2RGdraWRJNEJFaGNRU3VvcWdOMkJq?=
 =?utf-8?B?SVhYdXhLVHBnMjlBY1l3UFRwSlZaZGg4eDRYZjJYMHY3b2RISGJ5YUQ1RCto?=
 =?utf-8?B?WWFGaWk5U3RWWWlEZlRBbFlZaDRMaWNsaXlmeWZicnZBdU54SmhaL2ZTZG9a?=
 =?utf-8?B?RkJvcEZtUS9BNFhYdkc2TWV4b3RqOTVtbHVkZkYzUnhnaU9keEF6aUIzT1hh?=
 =?utf-8?B?MmRocUdpSjA3MlZuS0tyazBzNHAxTENXakJoUmc2S01qUnJ1ZUY1ZTlmWEt3?=
 =?utf-8?B?dnpid1dZTWFMVXZuak5MeStqWEtNSjVON3dHSitRVm5QSUlLaVV5a3VtcVNO?=
 =?utf-8?B?bDNQdUVlUWgxTHprSjRZZ0hHNWFjWTd0T0kxeTFwRzJXS1RHY2czNVgyWFIy?=
 =?utf-8?B?UG9uTTRGZC9YT2tEMEVWN05PUzkvT1dwc2RYemdXTCtGVHVYYWxsblFjU1g4?=
 =?utf-8?B?emNiYVBqaU5ZTDkrNUIzMW43YSsxa0huNkRhUERLUTBaVFJPN0FqdFN2UHFF?=
 =?utf-8?B?bmlaWXdtajRNNVA5b2VIZXZ5VnpEZytlSTU4OEdYdGRaMmtXdzlPK2EzTXBi?=
 =?utf-8?B?Y0JoQVZHODJVTGIxUzJpb01XSEZRTXdnVTdqY3I0R0NrUWNENzZNSzVPZ212?=
 =?utf-8?B?SWdnbDhaSlRFNnhWbHRqY2t5V010QXp4U2RXWkhqcFFiSllDcmw0UENxaS9F?=
 =?utf-8?B?dlZ0Vng5di91SkxmbDgyamxmbm9ISENkRnRVMXorV2ZLMGVRZXpxa1lLSDFs?=
 =?utf-8?B?Smk2WUpTamRkN2M5c3VmbEdsQUlMemgzM3ZhSEdkVmpzNU0zWjhWV0FFck1v?=
 =?utf-8?Q?+/mL6X?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 14:28:02.5878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e5f39c-de96-4b19-5418-08ddcf754a9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4069

On Wed Jul 30, 2025 at 5:34 AM CEST, dmkhn wrote:
> From: Denis Mukhin <dmukhin@ford.com>=20
>
> Introduce some basic infrastructure for doing domain ID allocation unit t=
ests,
> and add a few tests that ensure correctness of the domain ID allocator.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v11:
> - simplified test, dropped dom0less variant
> ---
>  tools/tests/Makefile                   |   2 +-
>  tools/tests/domid/.gitignore           |   2 +
>  tools/tests/domid/Makefile             |  51 ++++++++++
>  tools/tests/domid/include/xen/domain.h | 135 +++++++++++++++++++++++++
>  tools/tests/domid/test-domid.c         |  78 ++++++++++++++
>  5 files changed, 267 insertions(+), 1 deletion(-)
>  create mode 100644 tools/tests/domid/.gitignore
>  create mode 100644 tools/tests/domid/Makefile
>  create mode 100644 tools/tests/domid/include/xen/domain.h
>  create mode 100644 tools/tests/domid/test-domid.c
>
> diff --git a/tools/tests/Makefile b/tools/tests/Makefile
> index 36928676a666..ff1666425436 100644
> --- a/tools/tests/Makefile
> +++ b/tools/tests/Makefile
> @@ -1,7 +1,7 @@
>  XEN_ROOT =3D $(CURDIR)/../..
>  include $(XEN_ROOT)/tools/Rules.mk
> =20
> -SUBDIRS-y :=3D
> +SUBDIRS-y :=3D domid
>  SUBDIRS-y +=3D resource
>  SUBDIRS-$(CONFIG_X86) +=3D cpu-policy
>  SUBDIRS-$(CONFIG_X86) +=3D tsx
> diff --git a/tools/tests/domid/.gitignore b/tools/tests/domid/.gitignore
> new file mode 100644
> index 000000000000..91ac43232518
> --- /dev/null
> +++ b/tools/tests/domid/.gitignore
> @@ -0,0 +1,2 @@
> +*.o
> +test-domid-*
> diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
> new file mode 100644
> index 000000000000..9a817bb70c36
> --- /dev/null
> +++ b/tools/tests/domid/Makefile
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Unit tests for domain ID allocator.
> +#
> +# Copyright 2025 Ford Motor Company
> +
> +XEN_ROOT=3D$(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +TESTS :=3D test-domid
> +
> +vpath domid.c $(XEN_ROOT)/xen/common/
> +
> +.PHONY: all
> +all: $(TESTS)
> +
> +.PHONY: run
> +run: $(TESTS)
> +	$(foreach t,$(TESTS),./$(t);)
> +
> +.PHONY: clean
> +clean:
> +	$(RM) -- *.o $(TESTS) $(DEPS_RM)
> +
> +.PHONY: distclean
> +distclean: clean
> +	$(RM) -- *~
> +
> +.PHONY: install
> +install: all
> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
> +	$(INSTALL_PROG) test-domid $(DESTDIR)$(LIBEXEC)/tests
> +
> +.PHONY: uninstall
> +uninstall:
> +	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/test-domid
> +
> +CFLAGS +=3D -D__XEN_TOOLS__
> +CFLAGS +=3D $(APPEND_CFLAGS)
> +CFLAGS +=3D $(CFLAGS_xeninclude)
> +CFLAGS +=3D -I./include/
> +
> +LDFLAGS +=3D $(APPEND_LDFLAGS)
> +
> +%.o: %.c
> +	$(CC) $(CFLAGS) -c $^ -o $@ $(LDFLAGS)
> +
> +test-domid: domid.o test-domid.o
> +	$(CC) $^ -o $@ $(LDFLAGS)
> +
> +-include $(DEPS_INCLUDE)

I think the Makefile is off. If I try to recompile after modifying the head=
er it
doesn't compile anymore.

> diff --git a/tools/tests/domid/include/xen/domain.h b/tools/tests/domid/i=
nclude/xen/domain.h
> new file mode 100644
> index 000000000000..396c3bab9d26
> --- /dev/null
> +++ b/tools/tests/domid/include/xen/domain.h

I wish this could be the real one. Alas, I've been in that boat and I'm awa=
re
you can't. Just came here to whine online.

> @@ -0,0 +1,135 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Unit test harness for domain ID allocator.
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +#ifndef _TEST_HARNESS_
> +#define _TEST_HARNESS_
> +
> +#include <assert.h>
> +#include <errno.h> <=3D=3D=3D=3D=3D=3D=3D not needed
> +#include <stdbool.h>
> +#include <stddef.h> <=3D=3D=3D=3D=3D=3D=3D not needed
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h> <=3D=3D=3D=3D=3D=3D=3D not needed
> +#include <string.h> <=3D=3D=3D=3D=3D=3D=3D not needed

Bunch un headers are not required.

> +
> +#include <xen-tools/common-macros.h>
> +
> +#define BUG_ON(x)               assert(!(x))
> +#define ASSERT(x)               assert(x)
> +
> +#define __xen_mk_uint(x)        x ## U
> +#define xen_mk_uint(x)          __xen_mk_uint(x)

Do you need these, if...

> +
> +#define DOMID_FIRST_RESERVED    xen_mk_uint(10)
> +#define DOMID_INVALID           xen_mk_uint(11)

... these were just 10 and 11 without being wrapped?

> +
> +#define DEFINE_SPINLOCK(x)      unsigned long *(x)
> +#define spin_lock(x)            ((*(x))++)
> +#define spin_unlock(x)          ((*(x))--)
> +
> +#define BITS_PER_LONG           sizeof(unsigned long)
> +#define BITS_PER_WORD           (8U * BITS_PER_LONG)
> +#define BITS_TO_LONGS(bits) \
> +    (((bits) + BITS_PER_LONG - 1) / BITS_PER_LONG)
> +#define DECLARE_BITMAP(name, bits) \
> +    unsigned long name[BITS_TO_LONGS(bits)]
> +
> +static inline int __test_and_set_bit(unsigned int nr, unsigned long *add=
r)
> +{
> +    unsigned long mask =3D 1UL << (nr % BITS_PER_WORD);
> +    unsigned long *p =3D addr + (nr / BITS_PER_WORD);
> +    int old =3D (*p & mask) !=3D 0;
> +
> +    *p |=3D mask;
> +
> +    return old;
> +}
> +
> +static inline int __test_and_clear_bit(unsigned int nr, unsigned long *a=
ddr)
> +{
> +    unsigned long mask =3D 1UL << (nr % BITS_PER_WORD);
> +    unsigned long *p =3D addr + (nr / BITS_PER_WORD);
> +    int old =3D (*p & mask) !=3D 0;
> +
> +    *p &=3D ~mask;
> +
> +    return old;
> +}
> +
> +static inline void __set_bit(unsigned int nr, volatile unsigned long *ad=
dr)
> +{
> +    unsigned long mask =3D 1UL << (nr % BITS_PER_WORD);
> +    unsigned long *p =3D (unsigned long *)addr + (nr / BITS_PER_WORD);
> +
> +    *p |=3D mask;
> +}
> +
> +static inline void __clear_bit(unsigned int nr, volatile unsigned long *=
addr)
> +{
> +    unsigned long mask =3D 1UL << (nr % BITS_PER_WORD);
> +    unsigned long *p =3D (unsigned long *)addr + (nr / BITS_PER_WORD);
> +
> +    *p &=3D ~mask;
> +}
> +
> +static inline unsigned long find_next_zero_bit(const unsigned long *addr=
,
> +                                               unsigned long size,
> +                                               unsigned long offset)
> +{
> +    unsigned long idx =3D offset / BITS_PER_WORD;
> +    unsigned long bit =3D offset % BITS_PER_WORD;
> +
> +    if (offset >=3D size)
> +        return size;
> +
> +    while (offset < size)
> +    {
> +        unsigned long val =3D addr[idx] | (~0UL >> (BITS_PER_WORD - bit)=
);
> +
> +        if (~val)
> +        {
> +            unsigned long pos =3D __builtin_ffsl(~val);
> +
> +            if (pos > 0)
> +            {
> +                unsigned long rc =3D idx * BITS_PER_WORD + (pos - 1);
> +
> +                if (rc < size)
> +                    return rc;
> +            }
> +        }
> +
> +        offset =3D (idx + 1) * BITS_PER_WORD;
> +        idx++;
> +        bit =3D 0;
> +    }
> +
> +    return size;
> +}
> +
> +#define printk printf
> +
> +#define cf_check

No longer needed

> +
> +typedef bool spinlock_t;
> +typedef uint16_t domid_t;
> +
> +/* See include/xen/domain.h */
> +extern domid_t domid_alloc(domid_t domid);
> +extern void domid_free(domid_t domid);
> +
> +#endif /* _TEST_HARNESS_ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domi=
d.c
> new file mode 100644
> index 000000000000..ed041bb56d89
> --- /dev/null
> +++ b/tools/tests/domid/test-domid.c
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Unit tests for domain ID allocator.
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +/* Local test include replicating hypervisor includes. */
> +#include <xen/domain.h>
> +
> +int main(int argc, char **argv)
> +{
> +    domid_t expected, allocated;
> +
> +    printk("%s DOMID_FIRST_RESERVED=3D%u DOMID_INVALID=3D%u\n",
> +            argv[0], DOMID_FIRST_RESERVED, DOMID_INVALID);

nit; IMO, argv[0] is inconsequential.

also, printf seeing how this is a unit test. I know it's #define'd, but it'=
s
just easier to eyeball you're in userspace when you don't have printks arou=
nd.

> +    /* Test ID#0 cannot be allocated twice. */
> +    allocated =3D domid_alloc(0);
> +    printk("TEST 1: expected %u allocated %u\n", 0, allocated);
> +    ASSERT(allocated =3D=3D 0);
> +    allocated =3D domid_alloc(0);
> +    printk("TEST 1: expected %u allocated %u\n", DOMID_INVALID, allocate=
d);
> +    ASSERT(allocated =3D=3D DOMID_INVALID);
> +
> +    /* Ensure ID is not allocated. */
> +    domid_free(0);
> +
> +    /*
> +     * Test that that two consecutive calls of domid_alloc(DOMID_INVALID=
)
> +     * will never return the same ID.
> +     * NB: ID#0 is reserved and shall not be allocated by
> +     * domid_alloc(DOMID_INVALID).
> +     */
> +    for ( expected =3D 0; expected < DOMID_FIRST_RESERVED - 1; expected+=
+ )

If this starts on 1...

> +    {
> +        allocated =3D domid_alloc(DOMID_INVALID);
> +        printk("TEST 2: expected %u allocated %u\n", expected + 1, alloc=
ated);
> +        ASSERT(allocated =3D=3D expected + 1);

... these two doen't have to have it. Which is a bit easier to read and uns=
erstand.

"expect" should match the expectation, IMO.

> +    }
> +    for ( expected =3D 0; expected < DOMID_FIRST_RESERVED; expected++ )
> +    {
> +        allocated =3D domid_alloc(DOMID_INVALID);
> +        printk("TEST 2: expected %u allocated %u\n", DOMID_INVALID, allo=
cated);
> +        ASSERT(allocated =3D=3D DOMID_INVALID);
> +    }
> +
> +    /* Re-allocate first ID from [1..DOMID_FIRST_RESERVED - 1]. */
> +    expected =3D 1;
> +    domid_free(1);
> +    allocated =3D domid_alloc(DOMID_INVALID);
> +    printk("TEST 3: expected %u allocated %u\n", expected, allocated);
> +    ASSERT(allocated =3D=3D expected);
> +
> +    /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
> +    expected =3D DOMID_FIRST_RESERVED - 1;
> +    domid_free(DOMID_FIRST_RESERVED - 1);
> +    allocated =3D domid_alloc(DOMID_INVALID);
> +    printk("TEST 4: expected %u allocated %u\n", expected, allocated);
> +    ASSERT(allocated =3D=3D expected);
> +
> +    /* Allocate an invalid ID. */
> +    expected =3D DOMID_INVALID;
> +    allocated =3D domid_alloc(DOMID_FIRST_RESERVED);
> +    printk("TEST 5: expected %u allocated %u\n", expected, allocated);
> +    ASSERT(allocated =3D=3D expected);
> +
> +    return 0;
> +}

As far as the test cases go, they seem pretty extensive. I like it.

Cheers,
Alejandro

