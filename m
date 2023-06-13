Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922EE72DF9D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547999.855730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KN-0002Ac-Me; Tue, 13 Jun 2023 10:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547999.855730; Tue, 13 Jun 2023 10:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KN-00021R-Hy; Tue, 13 Jun 2023 10:32:43 +0000
Received: by outflank-mailman (input) for mailman id 547999;
 Tue, 13 Jun 2023 10:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aRu4=CB=epam.com=prvs=05285d8c61=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1q91KL-0001im-C6
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:32:41 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ddb8d52-09d5-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:32:38 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D7wk88024943; Tue, 13 Jun 2023 10:32:36 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3r6b6r9sqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 10:32:36 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB10054.eurprd03.prod.outlook.com (2603:10a6:20b:63b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 10:32:33 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51%5]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:32:33 +0000
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
X-Inumbo-ID: 9ddb8d52-09d5-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwDlxCRDkbFSP9SUWUqjjIoKMiO03Mc1DM4ILm0RMIzoVpI3040pNdH8SisCjfs+h4AV5It0S9R6hNqgO0BpBQariugwzWGjf2okwukXlojiv6lJ/Fem1NX3D8JZBVoLhmhrUr4GC4zkGi+xtT+Cjlmor0cqYOqwqNtHVj1bT00gdMyA5e9/XkP4MMsDRUqC1Y/7jKhvaPjjbKm8JJRVEs/QFdgdkp6+6eRLd5gJt6tLvbU4AjGCF0q4WtWzqlGMqVDhGT2JdNFgCclZ6wA3kfds8bHbi9gt7PRofntz+9VBh+jn6xNnu02zrVXDmagvCTwTqFjPcqVfPlxWxrGxTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UY3Tc3JYjXd83nRZfS2pIeBc/5nTAWhkdSGDbSn1R9M=;
 b=SpDEGTznp0M0SivWEblwb2kXWGHSt5uSCs3xTGC2k/IQQOahNzehN5bpOEgKl2+dolkK31GMIgFMFyUbC0FpQz3nsdzVorMAJOOxQeSr6XT3q0w6Xi49zJas9Sfdc3iqzJyUX8y6EO9znRAru/SlHKbc51EwoJPOE5cOGzUoiQwnVDLZ6AhoYrLufWDOilgriR2HfzU9gXa0RlgX9YavV+UZefyLpvpa1PG3m0Y7YIKyLD/scoPKh3ZLZTKXnYt9DHsNoFvTGTYCndypL+Ieigsseh8PRE4wJwFtQE/7ND91Wacry6K4MSUuDg9EdCnrncN2gnSuJCAG7R3lAdQbFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UY3Tc3JYjXd83nRZfS2pIeBc/5nTAWhkdSGDbSn1R9M=;
 b=hUBU6xpxSBK98oYzNp7iJy8eVoyWDtcl5cppb54dAc/goZdwd4tqPBaxPh1KPqfp0hWvIHbcwqa20Oq7D1Hgn8jUNBWcPRN9cxxddFCl59ebWT2i7k2CJdsnAStqPGa8iLDq1m9A/UkF6xW29czB3mG9/n/HGie8z3GUPmofY0XdHrTSdYpBbscwPeLwvKo8JzOhhBupMWmdv3Xqf25271lPeXWsG4YvhiBNPYCX6YseEi85OY3PwBpNHLv/vc2ZIKz8W7G5tzMLJ6cS34BTRIBoNIoNWfkmWwCJI0EiDjgspc3tWN4Bz1C/5OkCHQ45xX14xPHx/ic5OIH82vYM3A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v7 08/12] vpci/header: emulate PCI_COMMAND register for guests
Thread-Topic: [PATCH v7 08/12] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: AQHZneJadSk5dKCDKUGsmZXzTPgN0A==
Date: Tue, 13 Jun 2023 10:32:28 +0000
Message-ID: <20230613103159.524763-9-volodymyr_babchuk@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.40.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB10054:EE_
x-ms-office365-filtering-correlation-id: 9a50147d-7fb5-419f-14b4-08db6bf97f7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7QAaEz9qHw4tbXo3eMCbbBCugU5zi1ITszDvARtwnBwMfOjFjAW9/p+BIEpJrnKcB4n3+gaNyhXEXcNUG9O+BFX18uxFGqJKyLTBJSb5szFE9L1mCKv8ijL1j3SU9pPekjHlOLe3XqLkFI/NNmJsuIgMb07PcdDiB+7E3iepJ7komfLRZOMY9EcQ9orXFmxeO/TCaDc21WVfw7Kx1VQByFndSUSbZtuKvNQePsX9T5fWELmwcEmubHyojx586Mb5sE1h1eD1sEpRgNavl3zuo2ZefBO3nlOTyJ+JJu874z6CGK3dGVl+yMYiMwfAXWQLv3mmDMZ4d+hG0MNhQNLmQGwSnZqb7g3fYopfb98n7+v+yvXGcRJfwlQtBO2wPaB63Jn37ZN8vCQTO0HNLoJtw2mUj6RtjxfEc314KWMgV7XPMdrJljDFtKooYTtbDzRGuh4iN218tmYPzfTqpZzAFYRnT+NnLeh7/z1fDr+XFk5AILo9qoZ3FuOVFt6H6BzmLIyFvZeQPknCHmefjbANbju4L+W2aQyjggY4RNxKjrSK542BmJe/6UMIX+rMGsxQz4yu7PweFWrHR4ee9sW7e1b06KA7eC3yq9XNFNIWOBy/m3H0mQGWr2Tktpg23yrLDGtOnlA8c/ntIm4GQj/QSg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(451199021)(2616005)(83380400001)(86362001)(36756003)(122000001)(38070700005)(38100700002)(478600001)(54906003)(71200400001)(4326008)(6666004)(6486002)(966005)(8936002)(8676002)(2906002)(5660300002)(64756008)(66946007)(91956017)(66446008)(66476007)(66556008)(76116006)(41300700001)(6916009)(316002)(55236004)(186003)(66899021)(6512007)(26005)(1076003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?5okfJ1FcEUByPr/7ctEFxv/bxLvaXvXIp1gx2VlNHg4mskTTjSxj4TDM1+?=
 =?iso-8859-1?Q?RvIKnEAhUpob7jj4GRrClkWI38/bfJS0wF9DiYRTXR5bO7weCv7YsEzpzI?=
 =?iso-8859-1?Q?dnuwPhTs5iGqR1O+ZJ9923fpJRCODGVweMPQ5dLPQ9ltRB56OXy4xvZdpt?=
 =?iso-8859-1?Q?u0JtyGenWrZwHEgRIyTOETN5d45gzArhPy+sfAs3ydn/hfR0hY/lflxQuG?=
 =?iso-8859-1?Q?I9xbCjjf0HFhFbCccErVijeSrDVVbtCBQbhQyvQ9fgtPlBzul3Opxdqdt+?=
 =?iso-8859-1?Q?HoIkzYQw7ZiOotuhXj52zVRKMYQuq0l1024/+GeOjoFnttXVWpNzLCKM0b?=
 =?iso-8859-1?Q?+gY11a5NMdT/4B7Cr9yPIJhl4Ril7JNcKam11L6vv3kUndGftJKA8RqqQ0?=
 =?iso-8859-1?Q?7SeLC/f7dA1UuQ/nj2HiB+KyhD8UxipGKU5Ek6mfIQ6+Ckyy67sq9iDDbY?=
 =?iso-8859-1?Q?yhnNYlXjLb1QTMgJqKi+pgvYxFKcSZ34BBG4F3Ust7V19osvLqOMmQJoVb?=
 =?iso-8859-1?Q?3T0Ca2oNPqCYZWI+TGNNzXVKP/dulSWKdm4YrvxzU43JwMW8wcXsNXXquE?=
 =?iso-8859-1?Q?f8pGeyS5nUgBU6zhDOvZc8c7yU7q/qac1b4A3JxpHLxfUipMAnSstk/B7g?=
 =?iso-8859-1?Q?Wpeu5oS0SSdg5bo4eIittqILm5ILrRDVuuR6wfFJL+/DAOlz38klN09sRj?=
 =?iso-8859-1?Q?uUY4rXzg+5+ilHO2iK1N/YEMlEKjMvzqA21ynQUlezW6EB/y9o5Ityn83/?=
 =?iso-8859-1?Q?VasfWsm1tB4npxNw9Ur58VeZN2mhLBKhIyyR/14uNF0Vr/wv0Eszt/9Ml+?=
 =?iso-8859-1?Q?HJc1TioaPHFww/YDTUHCJ/0i8UwPthzUBsnmAK5BI43JMCx0pnBBjaY9OG?=
 =?iso-8859-1?Q?mIz0bAW5+mhOJGwhNg9D0pDDszixXVFS4G8dxpAFlY8A7qg+ApYt4G53qf?=
 =?iso-8859-1?Q?h0iG8Obz5DtWmGE3kM15GnKFY5Mw1nUeWy86/aWXdXzVWUQg/8MHfcgUMM?=
 =?iso-8859-1?Q?nnucl7ZuREZ1Azeat3VrhQSsNz7z6DwgVurwcACUqio/AMiZW/LQxFR2bJ?=
 =?iso-8859-1?Q?Ndckr6moSmg52/+6yXUw6EAxRNgVVlRe7rbQfxPN4ID8+3e130kzLQtWRx?=
 =?iso-8859-1?Q?yShumTqwdlXv4Fnj8eEVFa7Ytte+MKj/dKsPbZPXH2Yfb9Ht6lH1CKcU3G?=
 =?iso-8859-1?Q?aG1BXAWTPDaQwc//h26AgEyCJX4MjtUDfW1UAmihHSEPnNCe/JrQDxHYmm?=
 =?iso-8859-1?Q?/PwadvRsJXVKnWRUo7J44vTaLXvXeMm/dKX2CGJB0JcvTvdmjFL/E5yUCO?=
 =?iso-8859-1?Q?UsJLM2FdIVZxNCy8c78RzlU23eJ8m6NtTGBPmL3j83y/LGBJsQUF/4ZYhx?=
 =?iso-8859-1?Q?brGnNgGQowGFivgAtCXxs8mvLXG7kmjTDX3R4kP0LPE73L/2kxWiuUqq1i?=
 =?iso-8859-1?Q?8aVLBG30e5+U8QsOZ6vewRO8eSkx3FrvpBORjDazUiAmEF65Urdp9Z2NaT?=
 =?iso-8859-1?Q?ZsLIP8H8avsTSRX23aZiJy8Mk27YIKmRVqBa3sqwSYDDJKAeJfcjGDkonZ?=
 =?iso-8859-1?Q?Gav4ykVlU9zpyP8XAhkirARxbVtfSvoEq7O2FDCEhFtTXjFPjIFqQywsA5?=
 =?iso-8859-1?Q?fUMjHKoF9Y4R07GFvPwPEjasjynMJ5yTIkYk/GwzG1EtoFW19Cml86Iw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a50147d-7fb5-419f-14b4-08db6bf97f7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:32:28.9708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: St9RhT52Mug8TNe7Ch+6hr4K8OeWO5drqHDdBSb3pt+waRLDHP2sWpWXxYOsZZVSSSE+HKtQ2XvTVXtvJZSgZAtYOjTValJRpddZPUsTwOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10054
X-Proofpoint-GUID: JeKz8zX7fR2pCnLmRBophCnGYRxhoQqx
X-Proofpoint-ORIG-GUID: JeKz8zX7fR2pCnLmRBophCnGYRxhoQqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130093

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

lorc's rebase: check for the logic after rebase

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
 xen/include/xen/vpci.h    |  2 ++
 4 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 0524fbd220..677b93226c 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -465,11 +465,27 @@ static int modify_bars(const struct pci_dev *pdev, ui=
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
@@ -486,6 +502,19 @@ static void cf_check cmd_write(
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
@@ -692,8 +721,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
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
index e7d1f916a0..687aef54d1 100644
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
index b5a7dfdf9c..e4b957d5f3 100644
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
index 1e42a59c1d..fe100a8cb7 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -92,6 +92,8 @@ struct vpci {
=20
         /* Offset to the ROM BAR register if any. */
         unsigned int rom_reg;
+        /* Guest view of the PCI_COMMAND register. */
+        uint16_t guest_cmd;
=20
         /*
          * Store whether the ROM enable bit is set (doesn't imply ROM BAR
--=20
2.40.1

