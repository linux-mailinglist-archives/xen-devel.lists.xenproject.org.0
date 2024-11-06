Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0E09BF322
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 17:24:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831271.1246484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ipD-0007KL-2x; Wed, 06 Nov 2024 16:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831271.1246484; Wed, 06 Nov 2024 16:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ipC-0007Hi-Vj; Wed, 06 Nov 2024 16:24:06 +0000
Received: by outflank-mailman (input) for mailman id 831271;
 Wed, 06 Nov 2024 16:24:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DrBW=SB=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1t8ipB-0007Hc-1F
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 16:24:05 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20631.outbound.protection.outlook.com
 [2a01:111:f403:2408::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8560fc1c-9c5b-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 17:23:57 +0100 (CET)
Received: from MN2PR15CA0027.namprd15.prod.outlook.com (2603:10b6:208:1b4::40)
 by BL1PR12MB5873.namprd12.prod.outlook.com (2603:10b6:208:395::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 16:23:51 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:1b4:cafe::a9) by MN2PR15CA0027.outlook.office365.com
 (2603:10b6:208:1b4::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 16:23:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 16:23:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 10:23:51 -0600
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 10:23:40 -0600
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
X-Inumbo-ID: 8560fc1c-9c5b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwODo6NjMxIiwiaGVsbyI6Ik5BTTA0LUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijg1NjBmYzFjLTljNWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTEwMjM3LjU5NDAwMSwic2VuZGVyIjoic3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1ecuWHpfJCCdfWTghsYpyIo3573ufyXQsjGh27B13M9LsZJVnWcEvJZxl0vaoHAGSmx5k+lnF7JYny3vqQqB8BC6Ke8CKEkWtbFOvDBlFhMsP1kf+r6RWMdvCoIho6bdLOw7q1qwwcgOEipSDL401JSrJmdnFhy4hhkMgJ91zk2T01MjSmsqGeXJNuTk/eZlBWjmE8Jcqe7ByBAnsrnOBzIj14ey+GnGcd5R8tQ6I/4FvpEL1VJeTWT+X6cUbIMdz3oMxwMoeDiirR8K1dlGEbChhnoBJgo7FDCjERiuK+i9xYzYDP3V6Cq/KZ/SlJG/1Icvn6Sf/zVBFrd3bjbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKElNW/y5iF5z9M2pYmDfu8myHWqPMgt5s9ZXhzAP8Q=;
 b=a3qJ2gxmEe0So1TUflQxxrlO9CmcLpBuZtR7Or0e932Ev0CXqegJ6V1Rva4XKesHo+l8NsWo9siNQhoSALiBOxDCNdLfx05YcjAY9qHtw6jySYcvOY9aOJsdg2rrQiCgeZXhqTPCPx2WYI+jD0PuMnpsk21KvIpgqrkI50HO3DMfAO16jIgwGK0b6tR6Trua69SrxVbyV1tYoKh3iqP3wMd5ymbaLZkz152d54XFkdT7JRRVF7wZHJ7s6BRp7cMjz7cIWVbE7KkkUOwNz6H1bCoKIyMr4r/lVi/UAzC8CAEhOyBuFiEBMH2SKaNoFPK/5HUWaWmgZqBQfYUgcLAPBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKElNW/y5iF5z9M2pYmDfu8myHWqPMgt5s9ZXhzAP8Q=;
 b=g8Gm0IrXnWX8kNGpFCVN3zlbtem2CNz+SQj9mwPLRABxXgRAMM8aHf2HS31wlQVh2GtGdb/7wFYd0uAd+FubrrPe94K7zxrhrpl+IwhIdc5R+2IZKf/hYOlPA2IpR7QpEIIjzYdeo2tflcXxeIX2GUQjfwChHly0/lNBwGUFqpY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Wed, 6 Nov 2024 16:23:28 +0000
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Javi Merino <javi.merino@cloud.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 3/6] CI: Refresh the Debian 12 arm64 container
In-Reply-To: <ad9bcd46c85e738eccb2c51b42ae7d9d0d02fc5d.1730743077.git.javi.merino@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2411061615590.89051@ubuntu-linux-20-04-desktop>
References: <cover.1730743077.git.javi.merino@cloud.com> <ad9bcd46c85e738eccb2c51b42ae7d9d0d02fc5d.1730743077.git.javi.merino@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|BL1PR12MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: b4dccdf5-4cf2-485e-f6ca-08dcfe7f66cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ENuOK+O6MA4mjI/QiTGx4w0Q8rOUqBMpfo6+JTST0WjPZdFcKHp1xldTTyId?=
 =?us-ascii?Q?CCM8KiXNF/UMurzvGdYota+tEsdnQs5Af9KqIZUZXP5319sNtFOn+npfWPRJ?=
 =?us-ascii?Q?wkCUzbDo6+Y3RgmQf7E8QD+xkV1gL8JPCNx12A4rA/EQGGuCgET/20rukB8W?=
 =?us-ascii?Q?12VCZrsvZvbQsBROPVrltmaYCa5BzUUbDt1W7Lnku9vAyiGm69fXejgurvPL?=
 =?us-ascii?Q?s+MXKvPW+dVNzUk+kFFEAM/UusZuEK2KKxDr0S4AaFx1LadNYVuaOROJ7eYF?=
 =?us-ascii?Q?EnJKBBF3vk/tH/O1B9oMN+VoXa0bpoDb0qNL2PIMqR358R244hrdFuZK9B1F?=
 =?us-ascii?Q?0oX1h9x1JIW93BxHh8Tw4iTMsbRpg3Drz6RxSEga+5ImWTepARn7OAyOf1aE?=
 =?us-ascii?Q?ilzZcDQoDolnO4aummEFlzZElNlfC8Ce4JQce2niO7t0MngJxnXAfU/1Wqlp?=
 =?us-ascii?Q?lD3BYKwTGrtRwhcJWCWImZyygRNy9m16eE2B2nxkdWjhKwGGEhu+7wSkhaDp?=
 =?us-ascii?Q?RybBJJp6wWW7XA1mADiVRJtHwUes+E6n8RLnnja4798QqBBYPXAK4Nk0gjA0?=
 =?us-ascii?Q?goozV1PS4Wbgewb/wPbhKQHovjxetiBiJrEnF040zjYIRaN8brFY+uBQfttS?=
 =?us-ascii?Q?Yzv+3n7W7dtaibEUvmfyXkN/7EC8dnx2zA4bf3cFoo1xSrNd/Av+vzOEKWGQ?=
 =?us-ascii?Q?/qfMBk20WOfjj0dzV2oCAAWIyvNNG4k8DCRY8P4mYwZjoDmQVGXDYOmzwW5E?=
 =?us-ascii?Q?d87u09l1/ho0J77wLv18UYOHRzTq6R2uq6G22XIAKvgk4blVLm4s/NFU2yKd?=
 =?us-ascii?Q?iqMjWxx68GMgbhiTKoAPpo97zQdyyz5yv/DBB/Z4qqKvTcwz3ZkV6iw3C32G?=
 =?us-ascii?Q?FR1zIrDl1TJxaTIGDdr/v9LL7oTfrNPEVzeLxAc2ceHzcgnxe9z7Ad5nQXgR?=
 =?us-ascii?Q?p73IHV20E+MRTK+5iiyTZ2RJiYb951wZ8HtnoMNS7zseNvCT8iyk/44peBje?=
 =?us-ascii?Q?L0srFiWA4ZqrvYD61aU0uRRT75RPUE5KWv1fjYxPAAcU+p79IaLXGaeYlgdi?=
 =?us-ascii?Q?uZrMwWQ+ZVSMZnUjuJnDBwfDcSv97yNPMUfypXlVIHWsxqklpD97cRMaKnPn?=
 =?us-ascii?Q?JMQ9e1Kbr0Pi5sv1k8FW8fxYZr8b5Li8DBscTLtdquGyGAV+UYAuyxvBKuoC?=
 =?us-ascii?Q?I8ZUdKVWbawC00pnKiCp9lF7df+5kMseD9MNQ0yXceEcQ+svCs1QKIhoH3Tl?=
 =?us-ascii?Q?Xy2MSjhPrhJ4K6UpGWul2dux0vX/hacfT4WFS9xGnYDgtW1x6uvilpX2YQ+5?=
 =?us-ascii?Q?K2GjRKEepBfWuIMHBYF/X0zr0qtRshNSHBLEYrB3fz+tGR4749aqTBMHdFCe?=
 =?us-ascii?Q?C4woKLBnYdmkA/gj7AiQl8Te5lsQJH2DAfKDcal/4vyC2uIB+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 16:23:51.8153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4dccdf5-4cf2-485e-f6ca-08dcfe7f66cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5873

On Wed, 6 Nov 2024, Javi Merino wrote:
> Rework the container to use heredocs for readability and use
> apt-get --no-install-recommends to keep the size down.  Rename the job
> to debian-12-arm64-* to follow the naming scheme of all the other CI
> jobs.
> 
> This reduces the size of the debian:12-arm64v8 from 2.25GB down to 1.62GB.
> 
> The container is left running the builds and tests as root to avoid
> breaking the xilinx runners.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>


Hi Javi,

I generated a new dependency diff, this time it should be correct, see
the diff appended below. Most of the differences are not concerning,
but I have a couple of questions.


> --- /tmp/1a	2024-11-06 16:12:09.235734221 +0000
> +++ /tmp/2a	2024-11-06 16:12:15.203659831 +0000
> @@ -1,36 +1,32 @@
>  acpica-tools
> -bcc
> -bin86
>  bison
>  build-essential
>  busybox-static
> +ca-certificates
>  checkpolicy
> -clang
>  cpio
>  curl
>  device-tree-compiler
>  expect
> +file
>  flex
> -git
> -libaio-dev

I think this one might be needed to build QEMU but given that we don't
have any build jobs building QEMU on ARM today anymore, it could be
removed. We are going to add a new build job to build QEMU on ARM at
some point soon but we can add any relevant dependency back at that
time.


> +git-core
> +golang-go
> +libbz2-dev
> +libext2fs-dev
>  libfdt-dev
> -libfindlib-ocaml-dev
>  libglib2.0-dev
>  liblzma-dev
> -libncurses5-dev
> -libnl-3-dev

I think it is the same for these two


> +liblzo2-dev
>  libpixman-1-dev
>  libyajl-dev
> -markdown
> -nasm
> +libzstd-dev
> +ocaml-findlib
>  ocaml-nox
> -pandoc

The removal of pandoc and markdown both concerns me. Wouldn't this cause
the documents under docs/ not to be built anymore?


>  pkg-config
>  python3-dev
>  python3-setuptools
> -transfig
>  u-boot-qemu
>  u-boot-tools
>  uuid-dev
>  wget
> -zlib1g-dev

