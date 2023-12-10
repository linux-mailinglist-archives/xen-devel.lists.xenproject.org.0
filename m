Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC45580BC41
	for <lists+xen-devel@lfdr.de>; Sun, 10 Dec 2023 17:53:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651407.1017083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCN3B-0000Bp-SS; Sun, 10 Dec 2023 16:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651407.1017083; Sun, 10 Dec 2023 16:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCN3B-00009n-PJ; Sun, 10 Dec 2023 16:53:05 +0000
Received: by outflank-mailman (input) for mailman id 651407;
 Sun, 10 Dec 2023 16:53:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lAJh=HV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rCN39-00009f-Rp
 for xen-devel@lists.xenproject.org; Sun, 10 Dec 2023 16:53:03 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94142f62-977c-11ee-98e8-6d05b1d4d9a1;
 Sun, 10 Dec 2023 17:53:02 +0100 (CET)
Received: from SJ0PR13CA0012.namprd13.prod.outlook.com (2603:10b6:a03:2c0::17)
 by MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Sun, 10 Dec
 2023 16:52:58 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::a7) by SJ0PR13CA0012.outlook.office365.com
 (2603:10b6:a03:2c0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.21 via Frontend
 Transport; Sun, 10 Dec 2023 16:52:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Sun, 10 Dec 2023 16:52:57 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 10 Dec
 2023 10:52:53 -0600
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
X-Inumbo-ID: 94142f62-977c-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gG+4PyF4IJhxlugd1fib3XuB383IxzuSo+oIKzdJb6sKGuqaDPsBmmTJOu6NMcpEeW0kRESkdv5LSkBUwsrInwJNxeY4CdoJpsrwbY7PSmsSAqj4EUB7oyMQhdP/tzwL1zF2U4AuuylXI6HC0k9/vKp68cK0cuFPXSQVPMn0ABlF7bvBZdHfzYrofsXNW5yXHd0frzZ0UUmDx5y4mBztM+MRNZMgXl2SmsMqK/NjA5eLvA6guwOdlC2j4Il2KbbqaIUYj3ZERkjKHoP02Tzo8LlWvJ+vimYKr/zw1dhG8GJNECcymfN6/GCuz+1EhPI8pfgssanAOS74321ygXTu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XlXaSEqa0DdMrahG/fhGSwozwtfCWFVQhk7iHPtKUU=;
 b=Db1k7U3NFAKAcN31Jtn8CLbXgEaVYWbnHxPWrxdx8XXuIJt1tFY4GFawiZII1WL7pPjJzsexF10DbQosD5FKJmPhmoMDBh9E8t6KOrRYeQITsF6hHxuvWsVyMLszUUcODBH7jZJsmy64iKrcskCB8MI8/HHkdJhTQuKoYjLibBHX8+rflHLoOrk8b2G+Zyqv7g3iB1F6aicVsEXEypvCd6IzuJQD37u47sz8/2QN69bwsUeeuhkfKdtXsAGsf0DO6n7fZOyMSPPIOzT0CDgfGAjeKOdYcW0zcn43denuAtDXTlDCnUe5Lbqy77UHQYaiLyVrAiConve7byd+HsBNBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XlXaSEqa0DdMrahG/fhGSwozwtfCWFVQhk7iHPtKUU=;
 b=3jUshvQdBe3haUjBNQyWLpUxfDyDc16uH/MGr0PtC2wTTR3FjenFP43yYz/PeH1q5QSh42WxhykUU2IXAUNRhx8YNi3HmU/GOTAb6zLIGbH4x9VhkFOV9to22pMqK7Z3v1DKMkFqLIoJevJuDRSErGeMdpkfsNZsVOdPkYT7Rwk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	<qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Xenia Ragiadakou
	<xenia.ragiadakou@amd.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Alex Deucher <Alexander.Deucher@amd.com>, Huang Rui <Ray.Huang@amd.com>,
	Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang <Julia.Zhang@amd.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [RFC QEMU PATCH v3 0/1] Support device passthrough when dom0 is PVH on Xen
Date: Mon, 11 Dec 2023 00:52:39 +0800
Message-ID: <20231210165240.1551450-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|MW4PR12MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 3386ee77-2e51-4973-02ac-08dbf9a07662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rf+VFX6rAoi7ZC6GEq5S0hmVQz6QPOo1CPii1W5GnaskWOKOd00rZq4DpkgbOtqGtWZXGDaDfFpAAXoDZIP2Hd/1aj2lrODDqEfYjuFAMlnNmrxDFLQjG0lBQ2kmCzdEYNNRSRB7PLRLumNKtIuJNkHwk57Go+RsFIk27N0liV278qZJpX/gJ3bFYBdbny2m8MsLLmNxbIoilM+aL7Y2NBLQ2iM/xaUdEHqdEFHzv1NP7jqRNBj0olHjBsdQQDV/CzsAL/FMghQsn9n83uMG58UOiqzaD1JmRHXTn/7ty0OY+SKZrEJ+QCGBkxQA1UEBjczpYf/NmLbhWaneqK++Jrc+r1pIdZI5nQwmALNlin5eGY3UJwgBW2em8EGnmJXCe+oHQ7lv2Syle63TAT/rGzLBFkp7BB/bDlZnf8EZ5XH5hHnjQodp3K1vTV+9NKa86LO0/bMKiTs8huEKXDJElpF0RQ1rF72SWp7rummS8JQgcLj6J4Yg3/uytJCunGdiTBrdI3XD/kjiNOos3iFD+4G3Mac9DiB1/0YRuSji8DDCz3lDtCCffcpyJ9g2Uc+rL9ZhES0OmWW1Xeo08HPmmt19P5IYXm68VLPJiVkQ70BQzNDcY8ZAwIB4y44+wwl1nBToIo3XiRxMer9BzV7dw1XZUHi6JFx4K9PLpgg3qBlv4g2nbgagih44a8Ws92O7NMrIqysgKVPXlBI4v9mQ+mcuGgUVGqJ5PeKQmgkxH8a/NegHPhMmykDGpO0Pmaf/mFmh+t5JD/1qBFrAEQK102rjefMMlgbZEH6/DVt0yXU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(46966006)(40470700004)(36840700001)(40460700003)(1076003)(26005)(16526019)(2616005)(426003)(336012)(6666004)(7696005)(36860700001)(83380400001)(47076005)(5660300002)(41300700001)(2906002)(478600001)(966005)(4326008)(8676002)(8936002)(70206006)(70586007)(110136005)(316002)(54906003)(81166007)(86362001)(356005)(82740400003)(36756003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2023 16:52:57.7712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3386ee77-2e51-4973-02ac-08dbf9a07662
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7165

Hi All,
v2->v3 changes:
* du to changes in the implementation of the second patch on kernel side(that adds a new sysfs for gsi instead of a new syscall), so read gsi number from the sysfs of gsi.


v3 patch on kernel side:
https://lore.kernel.org/lkml/20231210161519.1550860-1-Jiqian.Chen@amd.com/T/#t
v3 patch on Xen side:
https://lore.kernel.org/xen-devel/20231210164009.1551147-1-Jiqian.Chen@amd.com/T/#t


Below is the description of v2 cover letter:
This patch is the v2 of the implementation of passthrough when dom0 is PVH on Xen.
Issues we encountered:
1. failed to map pirq for gsi
Problem: qemu will call xc_physdev_map_pirq() to map a passthrough device’s gsi to pirq in function xen_pt_realize(). But failed.

Reason: According to the implement of xc_physdev_map_pirq(), it needs gsi instead of irq, but qemu pass irq to it and treat irq as gsi, it is got from file /sys/bus/pci/devices/xxxx:xx:xx.x/irq in function xen_host_pci_device_get(). But actually the gsi number is not equal with irq. On PVH dom0, when it allocates irq for a gsi in function acpi_register_gsi_ioapic(), allocation is dynamic, and follow the principle of applying first, distributing first. And if you debug the kernel codes(see function __irq_alloc_descs), you will find the irq number is allocated from small to large by order, but the applying gsi number is not, gsi 38 may come before gsi 28, that causes gsi 38 get a smaller irq number than gsi 28, and then gsi != irq.

Solution: we can record the relation between gsi and irq, then when userspace(qemu) want to use gsi, we can do a translation. The third patch of kernel(xen/privcmd: Add new syscall to get gsi from irq) records all the relations in acpi_register_gsi_xen_pvh() when dom0 initialize pci devices, and provide a syscall for userspace to get the gsi from irq. The third patch of xen(tools: Add new function to get gsi from irq) add a new function xc_physdev_gsi_from_irq() to call the new syscall added on kernel side.
And then userspace can use that function to get gsi. Then xc_physdev_map_pirq() will success.

This v2 on qemu side is the same as the v1 ( qemu https://lore.kernel.org/xen-devel/20230312092244.451465-19-ray.huang@amd.com/), just call
xc_physdev_gsi_from_irq() to get gsi from irq.

v2 on kernel side:
https://lore.kernel.org/lkml/20231124103123.3263471-1-Jiqian.Chen@amd.com/T/#t

v2 on Xen side:
https://lore.kernel.org/xen-devel/20231124104136.3263722-1-Jiqian.Chen@amd.com/T/#t


Jiqian Chen (1):
  xen: Use gsi instead of irq for mapping pirq

 hw/xen/xen-host-pci-device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1


