Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B15375A370
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566262.884912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb8-0003H8-So; Thu, 20 Jul 2023 00:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566262.884912; Thu, 20 Jul 2023 00:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb8-00036L-D1; Thu, 20 Jul 2023 00:32:50 +0000
Received: by outflank-mailman (input) for mailman id 566262;
 Thu, 20 Jul 2023 00:32:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMHb3-0001JN-UN
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:32:46 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f099c095-2694-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 02:32:43 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JJCjt2031890
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:42 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rxgcw1sme-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:42 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7783.eurprd03.prod.outlook.com (2603:10a6:20b:407::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 00:32:35 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6588.035; Thu, 20 Jul 2023
 00:32:35 +0000
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
X-Inumbo-ID: f099c095-2694-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlEGG5D81kgg0nBGcdBSz1ogsAqZsjDWFf4cz6H77k8C3wI54OBE2EgV7Ln3l1c2Nl7EzOY5HrfHKhgpRurjHYB143QtGgm+ECQaHtqRpPznax3uX9BDPtpYhAJ18OZD1bYMs2dB/tT5WNVXTEcVb9YpbDnOrapL/T64sOmaJaO+83pChlTQJZh47ETyoSNokeSq8xcWd8pDW6hM+4la0Pj+gaWzZOFwM02+KNwA5YsdpVNcf2JAVCilb6QJCoV+pYs4gYQauqRY2jSo9rRpVOtEXs1nDRKM/73VQgEam8J4HecHjO6nbtnSL9MZgKGNOflb6nI4VBqNpDm1qEKObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWkvYfFfLZLgGm2PrjN1dlq8IatJg4jM7gGw7jvqor4=;
 b=WCMng+mW0cs98fl/wbyl+v2M8xp9tPU2Hn4E++SIImsmFXOC8UGPt1hKAz8tZ3qOEAcWVBYRs4aYhiZF1IzqnT0OypdD0KUcmEsip6TiBwV/m1ld0QTnmreddKDl2mVGNsX3o6hkdDqw86bWKM9nQC64g12KgCLGloDNQ5kXwl6I1TwL1ao4/ElL/88frYrJYsCq8k2igWLJQratdzvIZPeABtNT1Q+Au04uOsjsPN7buEXgvkRpz7L4bbVXB4Lgjg4jn6PvjK3PpOBGCeBQP4vPRAGexFk8FapWBLFgO/uADHNPCIQzZRfDKcRYDx4vHGfWaB+eb8C8652316+DBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWkvYfFfLZLgGm2PrjN1dlq8IatJg4jM7gGw7jvqor4=;
 b=k1uBJbL3DJaxjlNCWWpan75impnFIbVKv51FuRW9eq90xY8ehP/o0Bc80fkOq0z7BsQdaE1LDD/PCSHxVdgtIICK07htJbzN0IgsNsAR9tw6rmAG1pPwL7SLXmtMPKhEhtP/ElcMO+3r5cUozVNyLqZHKMVhdJ56TzBA/2vXJucig0dBz658zWJS7r4AV/Vg0ieL2youU46HkNPdi4sj1qo31pa7WqbQxF01U4H5ti1xa5x+tKXioRzAkc8kE7naJq8+MbK1QWyAEgZPUvviFLn7FEOWhPBtt50YlJdeiG/mU32gUoJVWOmq5NI5RZ+vPagAZ7qV5ipHMT0CFocQoQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: [PATCH v8 09/13] vpci/header: emulate PCI_COMMAND register for guests
Thread-Topic: [PATCH v8 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: AQHZuqGsgAu2PWCwAEG/SX7tDNW7DQ==
Date: Thu, 20 Jul 2023 00:32:33 +0000
Message-ID: <20230720003205.1828537-10-volodymyr_babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7783:EE_
x-ms-office365-filtering-correlation-id: 15423d10-3364-4e45-eaf8-08db88b8d06e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ldben+njrd6tuRPGDxq0qY2XeS/kQmntw+CyPZ76p+N1wNnbdXIlgKp1VQiJjqDsnKsfij2/glQmBRuxaUal4FSiWsodCGt5Hyj3v4IThkoB6S8A9igj5NtpU39Q4NvBCIKJOkWFyYN5znr2RUDOteB2yt+AUgEU8hrfcrnj362eRaQ5eEfpS3HbZxbHfAMMG2cPAXlxz+vYFnw6vThbMUfYpxh3fzsiwqi04mztJrREb1ZJh/nFbE7BElH/bTsLdlOSZiiDDsJC2iys3ZjmYstZoA1idUTy5dtsIGOOhdGWfxZ7rIBH4uoT1l1cUxvujWc3WsaztQQblxYeBT70jCqyxMZAacAkZYIfR8eHHRrhvRhQIEloOy5Ui+INYeddWL0u2I0x5pGsdfA0tsXkkUdzu/6vtTwQmOISUEv1DOBJh/zi36aDUysVvjbsZ4hB3QCYq4EvIMbBOOYRs2vihhSWpQWqgh051GaTroufuB2L8xGVpEaeBPGOoWSCgspBvdiIt5CXlqLtWx/52hh4v66jl9rZ8JPXbz5Qmarop+TNP9XiGmO74Pnr9KCo1yM584SRh8doee0/XF+U/4ARx7FqMjbAoMCjbOvXqhdOLG4Ld9IC+f956OjCsPaz1iqde5j2JsNWZKbnUd+s+a9GgQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(55236004)(26005)(1076003)(6506007)(41300700001)(316002)(83380400001)(2616005)(107886003)(186003)(966005)(6512007)(6486002)(66899021)(122000001)(478600001)(66946007)(71200400001)(4326008)(64756008)(38070700005)(66556008)(76116006)(66476007)(91956017)(6916009)(38100700002)(86362001)(5660300002)(66446008)(8936002)(8676002)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?/4FzHm0tyoHJlaWPnSdgyHYrg4RR6maXsURkRz5PstfeO5E8bZ4n2WkNtl?=
 =?iso-8859-1?Q?VOfhz48p3cv5aG+Wiuk1mlEJqgHg0/MFj1jDqAchKGxFnEjlFRGquY/tf6?=
 =?iso-8859-1?Q?3ZaxSOe1ND9U3RuHsmaqTYLFQmQEymIk5GcHFWTDoGm4zbEhh15EuJ9kKR?=
 =?iso-8859-1?Q?ZcHOLoCRPJ6CLCTQJaKreRq/u2C93bdUKmkupHlXHBm7p1hIHi6kqSlLTY?=
 =?iso-8859-1?Q?AlJzM6mt2a8DLPSIJ1mGYDiUKiXGHNI50563B4rP7TeP0WrYjmVBPFrKFQ?=
 =?iso-8859-1?Q?ehXyKHJCi2pIYnwwOp1EfpW8P36EmT+zLnxqh398NmXV6ZwZsKpR8bV3+m?=
 =?iso-8859-1?Q?oS92qq4L8DjeJ4LselZQHzHXMG4/6hQ6fEykubzz/kDIZ3jwtLwmUKRFDI?=
 =?iso-8859-1?Q?DOzLlD93FcsvK9iucXnHyFFmiA5dAGlO34H7yAzJsct7Br0qrqGSLOUzxa?=
 =?iso-8859-1?Q?lRo9t8gpkCkjEpzkvR1JD2GxDFGW3oXxHrnxUikIEbfUtPVz+1VlqYORW/?=
 =?iso-8859-1?Q?v4TP8XeRoWst6zvTVydxgi3kKFQ3ChwOupxfwkeUgu0LHSCnPzkeFZoU7d?=
 =?iso-8859-1?Q?CuScsnSgXX2mDIYXTiVR7d0MAFIZ8UIIFiFgqUXEOFav6Zy7jt/YCSnQJx?=
 =?iso-8859-1?Q?OUMwv+32FuIAFQP+o98s492BJt2YPvT05uIYSxPEXgN/B+2TIe/GVm7xEU?=
 =?iso-8859-1?Q?XPNflZBTwqb4P0VkcZe5dZ3/lkexgRHaBn4Jp1IrepOYAWw/s3EOryTLaY?=
 =?iso-8859-1?Q?DzophRmDloEbTTa7SqCmWbD0YPpfz/EzOHMhVF4jByhoJfvsP9PiHzBjPS?=
 =?iso-8859-1?Q?N0SyGEhQCjMeN8m4daQYEwwpfa4Udqa/Jr5lPIz36jWVxPY0gCPJo3Fg8f?=
 =?iso-8859-1?Q?7fhai2KbUhAgF2VeZsXIycBH473XykH6YKW6DxE8a7ZF6OfJBWmugROQUL?=
 =?iso-8859-1?Q?zIUxbCQJT5CfGUlDra3vnmKh/Xr23BISo5hykgHsG/zDlRCht2YFE3UoTm?=
 =?iso-8859-1?Q?RzwqtjqjJ/mphqvlmj/ZCEwCdSdzNOdNkRL43cZgsuJSVbDPGzpnJltmMN?=
 =?iso-8859-1?Q?3Ib1lFSwWAXXQssvq/Nbkbpa5n8ivrrsQZLPdmCCJGQl5D78CFjOALsAF6?=
 =?iso-8859-1?Q?lLFmxpF2Ih0OwZo+twbXAVykP3TyaRmpjhsObQ994cStKGlp02X41ivKdD?=
 =?iso-8859-1?Q?Q1AGl5/oXdOVj0pPAnhpcU54jequptEf1IYSJtx8u/8GZAw72TbAWA4kjg?=
 =?iso-8859-1?Q?0tvi9uVm7RhXGwRA1pRM+K1EtIy1+y/7XG1E6uC9K0IwGXxKVe0eQ3LAmg?=
 =?iso-8859-1?Q?F/6eiSq+2qfaC3pgJp6gCsTWCz6oEPpMs/rCiAAXyPm+chWFS5x2fYqoW5?=
 =?iso-8859-1?Q?YnXQkgDwm2MXotgGmf6/GBYAsNTq3498NdEhJ9yXEWcHHKypCb62l+u0TG?=
 =?iso-8859-1?Q?czwNYZrFOUWydLdI9a0mzjJcffUQX3574JKtsWSpW3YAB9qWZBdsRiDpy3?=
 =?iso-8859-1?Q?dUW7K9CLweYei+1lz+3+e4xMFWPigT3pOyn1Lcnpd5+Bam8gcwwVyH0Nx7?=
 =?iso-8859-1?Q?4SebIG/dUe77dgHoNKDRHDYAYpyQ9jm0l4v2/bKNEjAguqQ77I5eWIbOYR?=
 =?iso-8859-1?Q?/oc+P9BMteXZwNyS1voXVVo3ttLxFOzmg7Uvm6LuGUfxVgPAEaTnmx7A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15423d10-3364-4e45-eaf8-08db88b8d06e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:32:33.5184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nJTWxVu0YK8N81H0kRyPPM/NVmLU6RAwol1YnJg4PH/Dz19fHGrixwwfiGMx4TvIr8BronvI+RwWW6YgmmfEMI5FGiOjgNYY17G6uFcRQ00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7783
X-Proofpoint-ORIG-GUID: CBU4TaoMcSbmhCGN8vhvLzoC3hWNTWx9
X-Proofpoint-GUID: CBU4TaoMcSbmhCGN8vhvLzoC3hWNTWx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200002

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
guest's view of this will want to be zero initially, the host having set
it to 1 may not easily be overwritten with 0, or else we'd effectively
imply giving the guest control of the bit. Thus, PCI_COMMAND register needs
proper emulation in order to honor host's settings.

There are examples of emulators [1], [2] which already deal with PCI_COMMAN=
D
register emulation and it seems that at most they care about is the only IN=
Tx
bit (besides IO/memory enable and bus master which are write through).
It could be because in order to properly emulate the PCI_COMMAND register
we need to know about the whole PCI topology, e.g. if any setting in device=
's
command register is aligned with the upstream port etc.
This makes me think that because of this complexity others just ignore that=
.
Neither I think this can easily be done in Xen case.

According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
Device Control" the reset state of the command register is typically 0,
so when assigning a PCI device use 0 as the initial state for the guest's v=
iew
of the command register.

For now our emulation only makes sure INTx is set according to the host
requirements, i.e. depending on MSI/MSI-X enabled state.

This implementation and the decision to only emulate INTx bit for now
is based on the previous discussion at [3].

[1] https://github.com/qemu/qemu/blob/master/hw/xen/xen_pt_config_init.c#L3=
10
[2] https://github.com/projectacrn/acrn-hypervisor/blob/master/hypervisor/h=
w/pci.c#L336
[3] https://patchwork.kernel.org/project/xen-devel/patch/20210903100831.177=
748-9-andr2000@gmail.com/

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---

Since v6:
- fold guest's logic into cmd_write
- implement cmd_read, so we can report emulated INTx state to guests
- introduce header->guest_cmd to hold the emulated state of the
  PCI_COMMAND register for guests
Since v5:
- add additional check for MSI-X enabled while altering INTX bit
- make sure INTx disabled while guests enable MSI/MSI-X
Since v3:
- gate more code on CONFIG_HAS_MSI
- removed logic for the case when MSI/MSI-X not enabled
---
 xen/drivers/vpci/header.c | 38 +++++++++++++++++++++++++++++++++++++-
 xen/drivers/vpci/msi.c    |  4 ++++
 xen/drivers/vpci/msix.c   |  4 ++++
 xen/include/xen/vpci.h    |  3 +++
 4 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index e1a448b674..ae05d242a5 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -486,11 +486,27 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
     return 0;
 }
=20
+/* TODO: Add proper emulation for all bits of the command register. */
 static void cf_check cmd_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data=
)
 {
     struct vpci_header *header =3D data;
=20
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        struct vpci_header *header =3D data;
+
+        header->guest_cmd =3D cmd;
+#ifdef CONFIG_HAS_PCI_MSI
+        if ( pdev->vpci->msi->enabled || pdev->vpci->msix->enabled )
+            /*
+             * Guest wants to enable INTx, but it can't be enabled
+             * if MSI/MSI-X enabled.
+             */
+            cmd |=3D PCI_COMMAND_INTX_DISABLE;
+#endif
+    }
+
     /*
      * Let Dom0 play with all the bits directly except for the memory
      * decoding one.
@@ -507,6 +523,19 @@ static void cf_check cmd_write(
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
=20
+static uint32_t cmd_read(const struct pci_dev *pdev, unsigned int reg,
+                         void *data)
+{
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        struct vpci_header *header =3D data;
+
+        return header->guest_cmd;
+    }
+
+    return pci_conf_read16(pdev->sbdf, reg);
+}
+
 static void cf_check bar_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data=
)
 {
@@ -713,8 +742,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
         return -EOPNOTSUPP;
     }
=20
+    /*
+     * According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.=
2
+     * Device Control" the reset state of the command register is
+     * typically all 0's, so this is used as initial value for the guests.
+     */
+    ASSERT(header->guest_cmd =3D=3D 0);
+
     /* Setup a handler for the command register. */
-    rc =3D vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_CO=
MMAND,
+    rc =3D vpci_add_register(pdev->vpci, cmd_read, cmd_write, PCI_COMMAND,
                            2, header);
     if ( rc )
         return rc;
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index e63152c224..c37845a949 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -70,6 +70,10 @@ static void cf_check control_write(
=20
         if ( vpci_msi_arch_enable(msi, pdev, vectors) )
             return;
+
+        /* Make sure guest doesn't enable INTx while enabling MSI. */
+        if ( !is_hardware_domain(pdev->domain) )
+            pci_intx(pdev, false);
     }
     else
         vpci_msi_arch_disable(msi, pdev);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 9481274579..eab1661b87 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -97,6 +97,10 @@ static void cf_check control_write(
         for ( i =3D 0; i < msix->max_entries; i++ )
             if ( !msix->entries[i].masked && msix->entries[i].updated )
                 update_entry(&msix->entries[i], pdev, i);
+
+        /* Make sure guest doesn't enable INTx while enabling MSI-X. */
+        if ( !is_hardware_domain(pdev->domain) )
+            pci_intx(pdev, false);
     }
     else if ( !new_enabled && msix->enabled )
     {
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index b78dd6512b..6099d2141d 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -87,6 +87,9 @@ struct vpci {
         } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
         /* At most 6 BARS + 1 expansion ROM BAR. */
=20
+        /* Guest view of the PCI_COMMAND register. */
+        uint16_t guest_cmd;
+
         /*
          * Store whether the ROM enable bit is set (doesn't imply ROM BAR
          * is mapped into guest p2m) if there's a ROM BAR on the device.
--=20
2.41.0

