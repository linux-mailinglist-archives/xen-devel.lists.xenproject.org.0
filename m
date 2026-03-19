Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFcxMLpmvGnQyAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 22:12:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E151A2D28C6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 22:12:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257618.1551956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Kez-0004tD-0r; Thu, 19 Mar 2026 21:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257618.1551956; Thu, 19 Mar 2026 21:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Key-0004rl-Tw; Thu, 19 Mar 2026 21:12:04 +0000
Received: by outflank-mailman (input) for mailman id 1257618;
 Thu, 19 Mar 2026 21:12:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+9V1=BT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1w3Kex-0004rd-LW
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 21:12:03 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4479782f-23d8-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 22:12:00 +0100 (CET)
Received: from CH0PR13CA0008.namprd13.prod.outlook.com (2603:10b6:610:b1::13)
 by LV3PR12MB9437.namprd12.prod.outlook.com (2603:10b6:408:21d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 21:11:52 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::e5) by CH0PR13CA0008.outlook.office365.com
 (2603:10b6:610:b1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 21:11:52 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 21:11:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 19 Mar
 2026 16:11:52 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Mar
 2026 16:11:51 -0500
Received: from [172.24.66.250] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Mar 2026 16:11:51 -0500
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
X-Inumbo-ID: 4479782f-23d8-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXLxRllNwVYxiOCz/drct8OY+5B36tsDUMZX9boZiN07ogrk76pyVPjMpzW/1hdRxk5jd4iE00IJYm5J3UWzgpSi3+PsM+jD98XBpcoOlpGIHvFmJw+RoSQ+441OPbwoqqd9/iFJLw+C5G+9wtEG0Fe9bOTglINKwtcEVdc7rzpstF9pmNDhZEsUGRL8XejmzMHL4HcterEIyCBLU8IPeyp8x/QGKIeRexUWpn8xHV/vUCdP9PTRX8LTf9rTcZRYl64J2Hzwx1syO230FfClLkafVqABUbNF25n+w6yXZuThOYWNmMsV2y2431bHDfhGrOLciWJqBl7LnQy0xZDrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZcbvi4SFMi4MNhx8WZtzgMIqJEFA+JUZvhQ4J+VoKQ=;
 b=tIjlafid8b7kw2BC4x3uRZ3XHKjGULeB7qQ60+sgcl4R7ngTzvWW20HCs0DM3iqUlbuaX4n8IAz9a2o9FQJrsJm2Oq4Boc4n2YAjMwpJIw+cn0sCJit8REjlY2aqnsi257Kx7lb5Y5vvXBSQzmHEYuB53wP1FURtr9ecUV8neOydaqCyN/Pw3VTG0TjiQu03no0+vo19UI4g6h9HIL4ZXkgXa/RXrA8D3m4mxYMsn1+xaHM9F4BVQsqUIF6/zYDnJBaZ99amYtoW8nLRUaw775ff3L90Fj5DDKLTLdqaHt66o134cy+8gS79JEkKYFnfsdVZogDuMecqC/d37s4SWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZcbvi4SFMi4MNhx8WZtzgMIqJEFA+JUZvhQ4J+VoKQ=;
 b=HSY4a3WJf08VFPY9wmcSiH+TlcSX9qsuqt+22Zyx9ZnNxYdP1mCfnJqjWHQXZ+bZhWLymhI8LC3WusLdAFvObuxZP1G0NQ10cbhXVSyaCcX5SAJBAu/nWMtYHx2YSUFjkOIjY+RmEa5LilgsSfy7JrNPEwb0IzL9nfigS6KfgLc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <436cf1f3-5b5b-4c55-8372-4cf7c7528a4e@amd.com>
Date: Thu, 19 Mar 2026 17:11:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] vpci: add SR-IOV support for PVH Dom0
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <b4c86444970a65f56d20203fd77ee368e1eebfb9.1772806036.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <b4c86444970a65f56d20203fd77ee368e1eebfb9.1772806036.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|LV3PR12MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: 0622ad4c-d47e-4bab-06e0-08de85fc24a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FlJD8iaerEDvQ2SsLrRqVHmuIFgyYZmcAwcSzgI78yO7PXXGnXutibPGjsEUtafzjjNO2P+mwdt3kKH0iy4zqbss5zoXa+RC5tVyhwFtt4mOGAvs0wCgNJj2i0We8IIcJNKjsxkq0jVyBImguIe3RQqEEDoPnXNPbJvUoLuZnOrMnFQOoBWNprQrPqhVqrBmTlJ1SmgwG8Agr7hXYajJKyhXGvzwBIRZPgM6OhhEapj5Hw+XZzQJM2DfFQIJZ9KrLK0oGGnFxNvaDX8WoBDFAqr9MEGlrBG86eyn7s17EWhdiabDtXbr0GnL9RRzrg1vrx7PqlXCbxIAs6lADDp03OcEgooR68dS/bUigKanu7HeXTAUUROQOKXoo9uTUocD9iFP+9o1vrbd0qvv07f5uEN34VIR6SZluVKTtyDEk8lPfPHiwj5E+o/Uo2l8nssyG5LNafc1VxhKYI8tXMLwTYLluJ/85aP5rf1eLJjdRhiQrHwfBt6GP00W4lgyA3MfvbWBL/QBbNIaPunvdL3IYhtAmA5zGf33lWFofYigQoGNaslNiFwYXRr8rlBSkYBaqy/qFsdbqVhM/0Y+aP08kOVI7e55EMe6YG/hQgdfLTOew6AU+kHLrpscitUOEqXO3vS44iX3mxzkM4M1nCr7cE6tNSAJxr658oSelvw6p3QLGGNY0cPfs4FnzE5Vfs5oeFBWa/P7n1IEg1sr6T7sEzoKFsCiiXqEvpOk3JQBPfxpyyGIoLHuDqb51me8cPl+xI2+3dFHJXNTKOx+6zyau6e6V0vpeOM9+T24+x1ujLI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DCsRLO314hGX1N+suX4zNeSp4y7BTJsKW01Fb0oGPmalhulZk8j+d1eCDAo6Inw1S1gByWkdMA0tqz2U3k4otXOBbthtxM7UEZZfZAlsLhkjsaMby6wo0w8Ny3IG5rv+OkpAQfXki9ZRiQKrhOjLIoaj/ThNAl5xLml+QyiQBtjQpmHCf4/PZ6mtvqr40rNIt7ZLgsH6IAO6VHbL9PxNfcw088xbg0cJ/NBDwFPJn3oms97R8XCiE5onBe1iQBJpDhCPGfZpJ6DlRXve4aky2a4go0LoxChJYG92ZAaBSPuYd8Fu7RoCw2o3Xpt8q9olTriUJjJ8rjb99NQPLcaFXmuZFhEIqXFphr9ad0bhckaXJhsl6t9LVZWLmsfluaYdLH2/mlEs1MbsFTCz3yXJJui4jO66CyRAL/OefXcexSRyEJxFZNaEf1IGSw5uMUyk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 21:11:52.5425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0622ad4c-d47e-4bab-06e0-08de85fc24a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9437
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: E151A2D28C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/9/26 07:08, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> This code is expected to only be used by privileged domains,
> unprivileged domains should not get access to the SR-IOV capability.
> 
> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
> for possible changes in the system page size register.
> 
> Allow forcing vpci_modify_bars to not defer the actual mapping changes,

I don't think this is suitable. We perform the p2m operations in a deferred
context because they may take a long time. And since they may take a long time,
the logic is interruptible: in map_range(), we perform a general_preempt_check()
and return -ERESTART so that we give a chance for other pending work to
complete, including the scheduler softirq. If vpci_process_pending() returns
true, it will be called again and is expected to resume where it left off. The
vcpu won't continue until vpci_process_pending() returns false.

> which is needed to fix the sequential calls to vpci_modify_bars when
> enabling VFs from Dom0.

I'm guessing you resorted to this because you need to perform multiple mapping
operations, but the vPCI deferred mapping mechanism only supports a single
operation? If so, this is an issue I've been attempting to resolve for some time
with the BAR-write-with-memory-decoding-enabled series [1]. In that series I'm
working on introducing the ability perform multiple mapping operations. I'm
almost ready to send v3 of the BAR-write-with-memory-decoding-enabled series,
and I hope you don't mind that I include your patch ("vpci: Use pervcpu ranges
for BAR mapping"). You may consider the possibility of basing SR-IOV on this
work if suitable.

[1] https://lore.kernel.org/xen-devel/20250723163744.13095-1-stewart.hildebrand@amd.com/T/#t

Regardless, ultimately we need to find a way to return from
vpci_process_pending() during the potentially long-running p2m operations.
As an alternative suggestion, could you return from control_write_cb() after
each call to map_vfs(), and somehow make it resume where it left off?

> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v1->v2:
> * switch to VF discovery by Xen
> * fix sequential vpci_modify_bars calls
> * move documentation changes to a separate commit
> ---
>  xen/drivers/vpci/Makefile |   2 +-
>  xen/drivers/vpci/header.c |  17 +-
>  xen/drivers/vpci/sriov.c  | 363 ++++++++++++++++++++++++++++++++++++++
>  xen/include/xen/vpci.h    |  12 +-
>  4 files changed, 385 insertions(+), 9 deletions(-)
>  create mode 100644 xen/drivers/vpci/sriov.c
> 
> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index a7c8a30a89..fe1e57b64d 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1,2 +1,2 @@
> -obj-y += vpci.o header.o rebar.o
> +obj-y += vpci.o header.o rebar.o sriov.o

I suggest putting sriov.o on its own line

>  obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 284964f0d4..c55c3380d4 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -264,7 +264,7 @@ bool vpci_process_pending(struct vcpu *v)
>      return false;
>  }
>  
> -static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> +static int apply_map(struct domain *d, const struct pci_dev *pdev,

There are some differences in apply_map() to be aware of that doesn't make it
suitable for use in vpci_process_pending() context, and hence why it's marked
__init:

* apply_map() uses 'current' instead of the vcpu passed from
  vpci_process_pending(), but I don't think there's a guarantee that 'current'
  will be the same vcpu. In other words, it may end up using the wrong bar_mem.
* apply_map() doesn't return on -ERESTART, instead continuously calls
  process_pending_softirqs(). While this may allow some other pending softirqs
  to execute, process_pending_softirqs() will never invoke the scheduler
  softirq.
* apply_map() doesn't handle errors from map_range() (other than -ERESTART),
  though I'm not sure if this is intentional or a bug. Compare this to the
  mapping loop in vpci_process_pending() that properly cleans up and breaks out
  of the loop on error.

>                              uint16_t cmd)
>  {
>      struct vpci_header *header = &pdev->vpci->header;
> @@ -323,7 +323,8 @@ static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      raise_softirq(SCHEDULE_SOFTIRQ);
>  }
>  
> -int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> +int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only,
> +                     bool no_defer)
>  {
>      struct vpci_header *header = &pdev->vpci->header;
>      struct pci_dev *tmp;
> @@ -519,7 +520,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>          d = dom_xen;
>      }
>  
> -    if ( system_state < SYS_STATE_active )
> +    if ( system_state < SYS_STATE_active || no_defer )
>      {
>          /*
>           * Mappings might be created when building Dom0 if the memory decoding
> @@ -566,7 +567,7 @@ static void cf_check cmd_write(
>           * memory decoding bit has not been changed, so leave everything as-is,
>           * hoping the guest will realize and try again.
>           */
> -        vpci_modify_bars(pdev, cmd, false);
> +        vpci_modify_bars(pdev, cmd, false, false);
>      else
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
> @@ -736,7 +737,7 @@ static void cf_check rom_write(
>       */
>      else if ( vpci_modify_bars(pdev,
>                                 new_enabled ? PCI_COMMAND_MEMORY : 0,
> -                               true) )
> +                               true, false) )
>          /*
>           * No memory has been added or removed from the p2m (because the actual
>           * p2m changes are deferred in defer_map) and the ROM enable bit has
> @@ -954,6 +955,9 @@ int vpci_init_header(struct pci_dev *pdev)
>  
>      header->guest_cmd = cmd;
>  
> +    if ( pdev->info.is_virtfn )
> +        return vf_init_header(pdev);
> +
>      /* Disable memory decoding before sizing. */
>      if ( !is_hwdom || (cmd & PCI_COMMAND_MEMORY) )
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
> @@ -1062,7 +1066,8 @@ int vpci_init_header(struct pci_dev *pdev)
>              goto fail;
>      }
>  
> -    return (cmd & PCI_COMMAND_MEMORY) ? vpci_modify_bars(pdev, cmd, false) : 0;
> +    return (cmd & PCI_COMMAND_MEMORY)
> +                ? vpci_modify_bars(pdev, cmd, false, false) : 0;
>  
>   fail:
>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> diff --git a/xen/drivers/vpci/sriov.c b/xen/drivers/vpci/sriov.c
> new file mode 100644
> index 0000000000..6f691149e9
> --- /dev/null
> +++ b/xen/drivers/vpci/sriov.c
> @@ -0,0 +1,363 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Handlers for accesses to the SR-IOV capability structure.
> + *
> + * Copyright (C) 2026 Citrix Systems R&D
> + */
> +

#include "private.h"

> +#include <xen/sched.h>
> +#include <xen/vpci.h>
> +#include <xsm/xsm.h>
> +
> +static int vf_init_bars(const struct pci_dev *vf_pdev)
> +{
> +    int vf_idx;
> +    unsigned int i;
> +    const struct pci_dev *pf_pdev = vf_pdev->pf_pdev;
> +    struct vpci_bar *bars = vf_pdev->vpci->header.bars;
> +    struct vpci_bar *physfn_vf_bars = pf_pdev->vpci->sriov->vf_bars;
> +    unsigned int sriov_pos = pci_find_ext_capability(pf_pdev,
> +                                                     PCI_EXT_CAP_ID_SRIOV);
> +    uint16_t offset = pci_conf_read16(pf_pdev->sbdf,
> +                                      sriov_pos + PCI_SRIOV_VF_OFFSET);
> +    uint16_t stride = pci_conf_read16(pf_pdev->sbdf,
> +                                      sriov_pos + PCI_SRIOV_VF_STRIDE);
> +
> +    vf_idx = vf_pdev->sbdf.sbdf - (pf_pdev->sbdf.sbdf + offset);
> +    if ( vf_idx < 0 )
> +        return -EINVAL;
> +
> +    if ( stride )
> +    {
> +        if ( vf_idx % stride )
> +            return -EINVAL;
> +        vf_idx /= stride;
> +    }
> +
> +    /*
> +     * Set up BARs for this VF out of PF's VF BARs taking into account
> +     * the index of the VF.
> +     */
> +    for ( i = 0; i < PCI_SRIOV_NUM_BARS; i++ )
> +    {
> +        bars[i].addr = physfn_vf_bars[i].addr + vf_idx * physfn_vf_bars[i].size;
> +        bars[i].guest_addr = bars[i].addr;
> +        bars[i].size = physfn_vf_bars[i].size;
> +        bars[i].type = physfn_vf_bars[i].type;
> +        bars[i].prefetchable = physfn_vf_bars[i].prefetchable;
> +    }
> +
> +    return 0;
> +}
> +
> +/* Must be called form vpci_process_pending context */
> +static int map_vfs(const struct pci_dev *pf_pdev, uint16_t cmd)
> +{
> +    struct pci_dev *vf_pdev;
> +    int rc;
> +
> +    ASSERT(rw_is_write_locked(&pf_pdev->domain->pci_lock));
> +
> +    list_for_each_entry(vf_pdev, &pf_pdev->vf_list, vf_list) {

Style: { should be on its own line

> +        rc = vpci_modify_bars(vf_pdev, cmd, false, true);
> +        if ( rc )
> +        {
> +            gprintk(XENLOG_ERR, "failed to %s VF %pp: %d\n",
> +                    (cmd & PCI_COMMAND_MEMORY) ? "map" : "unmap",
> +                    &vf_pdev->sbdf, rc);
> +            return rc;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +

Stray newline

> +static int size_vf_bars(struct pci_dev *pf_pdev, unsigned int sriov_pos)
> +{
> +    /*
> +     * NB: a non-const pci_dev of the PF is needed in order to update
> +     * vf_rlen.
> +     */
> +    struct vpci_bar *bars;
> +    unsigned int i;
> +    int rc = 0;
> +
> +    ASSERT(rw_is_write_locked(&pf_pdev->domain->pci_lock));
> +    ASSERT(!pf_pdev->info.is_virtfn);
> +    ASSERT(pf_pdev->vpci->sriov);
> +
> +    /* Read BARs for VFs out of PF's SR-IOV extended capability. */
> +    bars = pf_pdev->vpci->sriov->vf_bars;
> +    /* Set the BARs addresses and size. */
> +    for ( i = 0; i < PCI_SRIOV_NUM_BARS; i += rc )
> +    {
> +        unsigned int idx = sriov_pos + PCI_SRIOV_BAR + i * 4;
> +        uint32_t bar;
> +        uint64_t addr, size;
> +
> +        bar = pci_conf_read32(pf_pdev->sbdf, idx);
> +
> +        rc = pci_size_mem_bar(pf_pdev->sbdf, idx, &addr, &size,
> +                              PCI_BAR_VF |
> +                              ((i == PCI_SRIOV_NUM_BARS - 1) ? PCI_BAR_LAST
> +                                                             : 0));
> +
> +        /*
> +         * Update vf_rlen on the PF. According to the spec the size of
> +         * the BARs can change if the system page size register is
> +         * modified, so always update rlen when enabling VFs.
> +         */
> +        pf_pdev->physfn.vf_rlen[i] = size;
> +
> +        if ( !size )
> +        {
> +            bars[i].type = VPCI_BAR_EMPTY;
> +            continue;
> +        }
> +
> +        bars[i].addr = addr;
> +        bars[i].guest_addr = addr;
> +        bars[i].size = size;
> +        bars[i].prefetchable = bar & PCI_BASE_ADDRESS_MEM_PREFETCH;
> +
> +        switch ( rc )
> +        {
> +        case 1:
> +            bars[i].type = VPCI_BAR_MEM32;
> +            break;
> +
> +        case 2:
> +            bars[i].type = VPCI_BAR_MEM64_LO;
> +            bars[i + 1].type = VPCI_BAR_MEM64_HI;
> +            break;
> +
> +        default:
> +            ASSERT_UNREACHABLE();
> +        }
> +    }
> +
> +    rc = rc > 0 ? 0 : rc;
> +
> +    return rc;
> +}
> +
> +struct callback_data {
> +    const struct pci_dev *pdev;
> +    unsigned int pos;
> +    uint32_t value;
> +    bool enable : 1;
> +    bool disable : 1;
> +    bool map : 1;
> +    bool unmap : 1;
> +};
> +
> +static void cf_check control_write_cb(void *data)
> +{
> +    struct callback_data *cb = data;
> +    const struct pci_dev *pdev = cb->pdev;
> +    uint16_t offset = pci_conf_read16(pdev->sbdf, cb->pos + PCI_SRIOV_VF_OFFSET);
> +    uint16_t stride = pci_conf_read16(pdev->sbdf, cb->pos + PCI_SRIOV_VF_STRIDE);
> +    struct vpci_sriov *sriov = pdev->vpci->sriov;
> +    int rc = 0;
> +    unsigned int i;

The validity of pdev should be checked. vpci_process_pending() already has
logic for checking the pdev validity and acquiring d->pci_lock, I suggest
perhaps to reuse that.

> +
> +    if ( cb->unmap )
> +    {
> +        write_lock(&pdev->domain->pci_lock);
> +        map_vfs(pdev, 0);
> +        write_unlock(&pdev->domain->pci_lock);

I don't think it's appropriate to release the lock here, then re-acquire it
below in the 'if ( cb->map )' condition, however ...

> +    }
> +
> +    if ( cb->enable || cb->disable )
> +    {
> +        for ( i = 0; i < sriov->num_vfs; i++ )
> +        {
> +            const pci_sbdf_t vf_sbdf = {
> +                .sbdf = pdev->sbdf.sbdf + offset + stride * i,
> +            };
> +
> +            if ( cb->enable )
> +            {
> +                const struct pci_dev_info info = {
> +                    .is_virtfn = true,
> +                    .is_extfn = false,
> +                    .physfn.bus = pdev->sbdf.bus,
> +                    .physfn.devfn = pdev->sbdf.devfn,
> +                };
> +                rc = pci_add_device(vf_sbdf.seg, vf_sbdf.bus, vf_sbdf.devfn,
> +                                    &info, pdev->node);

... pci_add_device() acquires pcidevs_lock(), which would be against the locking
order if d->pci_lock is already held (see the comment for pci_lock in sched.h).
I wonder if we need a variant of pci_add_device() where the caller obtains the
appropriate lock(s)?

We should also consider that pci_add_device() performs vpci_assign_device(), and
I haven't completely thought through the implications of that yet.

> +            }
> +            if ( cb->disable )
> +                rc = pci_remove_device(vf_sbdf.seg, vf_sbdf.bus, vf_sbdf.devfn);
> +
> +            if ( rc && rc != -ENODEV)
> +                gprintk(XENLOG_ERR, "failed to %s VF %pp: %d\n",
> +                        cb->enable ? "add" : "remove", &vf_sbdf, rc);
> +        }
> +    }
> +
> +    if ( cb->map )
> +    {
> +        write_lock(&pdev->domain->pci_lock);
> +        rc = map_vfs(pdev, PCI_COMMAND_MEMORY);
> +
> +        if ( rc )
> +            map_vfs(pdev, 0);
> +        write_unlock(&pdev->domain->pci_lock);
> +    }
> +
> +    pci_conf_write16(pdev->sbdf, cb->pos + PCI_SRIOV_CTRL, cb->value);
> +    xfree(cb);
> +}
> +
> +static void cf_check control_write(const struct pci_dev *pdev, unsigned int reg,
> +                                   uint32_t val, void *data)
> +{
> +    unsigned int sriov_pos = reg - PCI_SRIOV_CTRL;
> +    struct vpci_sriov *sriov = pdev->vpci->sriov;
> +    struct callback_data *cb = NULL;
> +    uint16_t control = pci_conf_read16(pdev->sbdf, reg);
> +    bool mem_enabled = control & PCI_SRIOV_CTRL_MSE;
> +    bool new_mem_enabled = val & PCI_SRIOV_CTRL_MSE;
> +    bool enabled = control & PCI_SRIOV_CTRL_VFE;
> +    bool new_enabled = val & PCI_SRIOV_CTRL_VFE;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +
> +    if ( new_enabled == enabled && new_mem_enabled == mem_enabled )
> +    {
> +        pci_conf_write16(pdev->sbdf, reg, val);
> +        return;
> +    }
> +
> +    cb = xzalloc(struct callback_data);

Are there any alternatives to this runtime allocation? E.g. could the state be
stored in struct vpci_vcpu or struct vpci_sriov?

> +
> +    if ( !cb )
> +    {
> +        gprintk(XENLOG_ERR,
> +                "%pp: Unable to allocate memory for SR-IOV enable\n",
> +                pdev);
> +        return;
> +    }
> +
> +    cb->pdev = pdev;
> +    cb->pos = sriov_pos;
> +    cb->value = val;
> +    cb->map = new_mem_enabled && !mem_enabled;
> +    cb->unmap = !new_mem_enabled && mem_enabled;
> +    cb->enable = new_enabled && !enabled;
> +    cb->disable = !new_enabled && enabled;
> +
> +    current->vpci.task = WAIT;
> +    current->vpci.wait.callback = control_write_cb;
> +    current->vpci.wait.data = cb;
> +    current->vpci.wait.end = NOW();
> +
> +    if ( cb->enable )
> +    {
> +        size_vf_bars((struct pci_dev *)pdev, sriov_pos);
> +
> +        /*
> +         * Only update the number of active VFs when enabling, when
> +         * disabling use the cached value in order to always remove the same
> +         * number of VFs that were active.
> +         */
> +        sriov->num_vfs = pci_conf_read16(pdev->sbdf,
> +                                         sriov_pos + PCI_SRIOV_NUM_VF);
> +        /*
> +         * NB: VFE needs to be enabled before calling pci_add_device so Xen
> +         * can access the config space of VFs. FIXME casting away const-ness
> +         * to modify vf_rlen
> +         */
> +        pci_conf_write16(pdev->sbdf, reg, control | PCI_SRIOV_CTRL_VFE);
> +        /*
> +         * The spec states that the software must wait at least 100ms before
> +         * attempting to access VF registers when enabling virtual functions
> +         * on the PF.
> +         */
> +
> +        current->vpci.wait.end = NOW() + MILLISECS(100);
> +    }
> +}
> +
> +int vf_init_header(struct pci_dev *vf_pdev)
> +{
> +    const struct pci_dev *pf_pdev;
> +    unsigned int sriov_pos;
> +    int rc = 0;
> +    uint16_t ctrl;
> +
> +    ASSERT(rw_is_write_locked(&vf_pdev->domain->pci_lock));
> +
> +    if ( !vf_pdev->info.is_virtfn )
> +        return 0;
> +
> +    pf_pdev = vf_pdev->pf_pdev;
> +    ASSERT(pf_pdev);
> +
> +    rc = vf_init_bars(vf_pdev);
> +    if ( rc )
> +        return rc;
> +
> +    sriov_pos = pci_find_ext_capability(pf_pdev, PCI_EXT_CAP_ID_SRIOV);
> +    ctrl = pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
> +
> +    if ( (pf_pdev->domain == vf_pdev->domain) && (ctrl & PCI_SRIOV_CTRL_MSE) )
> +    {
> +        rc = vpci_modify_bars(vf_pdev, PCI_COMMAND_MEMORY, false, false);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return rc;
> +}
> +
> +static int cf_check init_sriov(struct pci_dev *pdev)
> +{
> +    unsigned int pos;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +
> +    pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
> +
> +    if ( !pos )
> +        return 0;
> +
> +    if ( xsm_resource_setup_pci(XSM_PRIV, pdev->sbdf.bdf) )
> +    {
> +        printk(XENLOG_ERR
> +               "%pp: SR-IOV configuration unsupported for unpriv %pd\n",
> +               &pdev->sbdf, pdev->domain);
> +        return 0;

Should this return an error?

> +    }
> +
> +    pdev->vpci->sriov = xzalloc(struct vpci_sriov);
> +    if ( !pdev->vpci->sriov )
> +        return -ENOMEM;
> +
> +    return vpci_add_register(pdev->vpci, vpci_hw_read16, control_write,
> +                             pos + PCI_SRIOV_CTRL, 2, NULL);
> +}
> +
> +static int cf_check cleanup_sriov(const struct pci_dev *pdev, bool hide)
> +{
> +    if ( hide )
> +        return 0;
> +
> +    XFREE(pdev->vpci->sriov);

pdev->vpci->sriov should always be freed, no matter if hide == true or false.

For hardware_domain, there should also be a handler added to hide the capability
in case of hide == true. See the other capability cleanup hooks for examples.

> +
> +    return 0;
> +}
> +
> +REGISTER_VPCI_EXTCAP(SRIOV, init_sriov, cleanup_sriov);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 47cdb54d42..ae5f3b7274 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -45,6 +45,7 @@ typedef struct {
>      REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##name, name, finit, fclean, true)
>  
>  int __must_check vpci_init_header(struct pci_dev *pdev);
> +int __must_check vf_init_header(struct pci_dev *pdev);

Move to private.h. The function name should also have a vpci_ prefix since it's
not static.

>  
>  /* Assign vPCI to device by adding handlers. */
>  int __must_check vpci_assign_device(struct pci_dev *pdev);
> @@ -146,7 +147,6 @@ struct vpci {
>           * upon to know whether BARs are mapped into the guest p2m.
>           */
>          bool bars_mapped      : 1;
> -        /* FIXME: currently there's no support for SR-IOV. */
>      } header;
>  
>      /* MSI data. */
> @@ -200,6 +200,13 @@ struct vpci {
>              struct vpci_arch_msix_entry arch;
>          } entries[];
>      } *msix;
> +
> +    struct vpci_sriov {
> +        /* PF only */
> +        struct vpci_bar vf_bars[PCI_SRIOV_NUM_BARS];
> +        uint16_t num_vfs;
> +    } *sriov;
> +
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>      /* Guest SBDF of the device. */
>  #define INVALID_GUEST_SBDF ((pci_sbdf_t){ .sbdf = ~0U })
> @@ -323,7 +330,8 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
>                      unsigned long *data);
>  
>  /* Map/unmap the BARs of a vPCI device. */
> -int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only);
> +int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only,
> +                     bool no_defer);

Move to private.h

>  
>  #endif /* __XEN__ */
>  


