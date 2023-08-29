Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6648978D046
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592515.925297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80A-0008Et-HU; Tue, 29 Aug 2023 23:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592515.925297; Tue, 29 Aug 2023 23:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80A-0007z6-8O; Tue, 29 Aug 2023 23:20:02 +0000
Received: by outflank-mailman (input) for mailman id 592515;
 Tue, 29 Aug 2023 23:19:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb807-0007EX-QZ
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:19:59 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90309ff7-46c2-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 01:19:56 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TFMk9m021983; Tue, 29 Aug 2023 23:19:53 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ssdvpbm4f-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:53 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:46 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:46 +0000
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
X-Inumbo-ID: 90309ff7-46c2-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9UUKEApCYiwql8lTUWXWKAUuaIz7NU8X+t5szptPC5c+Q8yBXmLciSGb9Ef3PjuyoAvdkgMHj3oN0PNWj78smzl4cm1AY1q67nnyW3vp8Q4FbZmkWcZjPSshy6DycWJx1jc2AP+SJQ7IlXLcomKRGOfMfjv2uLNnUpuIwjQUNbY14lm5zO73Ja2NuoRCpsDeo5fGuOZH9uxu4rsH9GWp7Q/3xaGUdTk/d2Fmp/UxHuV4biv23Q5eNmpCit1P/qW5bBTY5EkrYO2bnGITS6Pmf4QjX9NEgb+jHpRgn7t6Sr9xdEKnWKh1O2toe9DZxWO6MpLkmF3pnpONdJRVgepvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1RqGs20J0sl0wDwsS7HPEyH9aAe+auhvvKSc58OLsk=;
 b=CMt142aESfrpOKZiayOpG3qBmSB6i3PkscmQOWnkvD/z3hqDeE3EGzwmXDiiB0GfuEoostgn1lSQK57s1KejjVH/c8+1fbbhQIjZERnYFyxq9RFSkdFWabLPIIeQ0L4lXxkQbjUzTmjsZmgHLhmAZtiHNknJHuqWFYiLwTDq1/GSJ8stVVc2mSOGDeg6+Pfe3uZTCrQSXPtMTYF2++zvlwBlMq1GUllImyeoivQP/4Cmt1WA2sxTouxmJdDRJl6tqn1Ibmc8zx0jD4EmbvURLo06PPjKPjdxlIPd4kLTWK8Yxxmt6aIMVcwxnK1seXBDP/EBoVfl6Pghq3DPptj49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1RqGs20J0sl0wDwsS7HPEyH9aAe+auhvvKSc58OLsk=;
 b=RRvh1NnLsKlJeo3AA7dCmUwDkAnqubY9K+Ixz2jFpPLvVxmdijclT3axfZS+2fuf6DVpssjQXwxDyFjg5pqUs3HqnBnw8nCu11BVfRyaw5OcxhK7HYXVkdYaZ2i0+pkeNbA996YmwMIMchl09IRopo+u3lTs4ZDycc6pYSjJh7NFipoH2s0r0U9l6KXkPJqWliTN+8B+TgeW+/kQaYJetnHY7GwJ0XS/c7ReDmdP/UjQY5CjwOG6y5JJKqDqeZpnfii2qL2OCSu9rUW0lwPIzo86KO7IWWx6W97YnjkOc/sZfpCIlfgF25jga/MD99IF9BcGskX3IdwB8gMft9lVEA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 10/16] vpci/header: emulate PCI_COMMAND register for guests
Thread-Topic: [PATCH v9 10/16] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: AQHZ2s9LnsJWfZzJukybwnoLXaXA0g==
Date: Tue, 29 Aug 2023 23:19:44 +0000
Message-ID: <20230829231912.4091958-11-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: b95024b4-e3e7-4761-70b4-08dba8e66f49
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0H8MtiKi35+65igUTXRWmr0abA8I4xS+xGE1oMFmAEYwd5y3CiNgKdDApjlXzQsCCROVpq6hnu6QIXVMnn2Uy8C5VgTjYPtYx0cXcFhLSbcLp8OEQvE7mo7X5Hyqv46Wr0juH06bD/XIRRvWogI4SwIT96KQd/vzldZ+weo2qOHb3Yzo28T40xSgoetEClyS4WjIQPGS5P3uZSaKT24wclz0VhW1fltCJ7/ueLDYMtWO3mZi6ZnrmzPxEtDRyybm2hMaI1xFR7oeFa1+cM3HNITUENSFkjHXlqZmQSFAlnGI0kiyFiLtAQAIP75UeO87dfObwviGoVMdXeLmib9rif6PGLaaeBOBwzj5Vv84QFJNO9P3lL7WcrAC5oebDO5sElJXTO1NMsr3DPD40YsDPDlhLLXVqfMTZmtHLREcB0FS8rQl+LCVYioLLVlX71SsqHDufbXrnln4nBD/ywLUlvUpj7mCh5gMDbSh+snr/Zz0CPwp34AE4v98m6jmjoBXXZ+qXb9W9Pt/D9zL7olz4QW7ccZC4uLga0/SNiCnyGBSJefZ3TQy/AYOodYLQVCS5h3MD834PCo0ur8nqalETDSAHmgHAKpm55etKD59Nw2ODTFQuJLdRIHgyyUmN3Fu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(107886003)(26005)(2906002)(6916009)(64756008)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?nkJq/1JY300LwirFR1h/kwhhTXUCigEMKTyh6gASctXV2euwAJ8u15RT9U?=
 =?iso-8859-1?Q?OJ6xVMk67gF8khI7epCuHnlYT93WYlf4cEyjuSIuH2xK572EwvRe9CBcad?=
 =?iso-8859-1?Q?tZ5nA4pfhmjCkclAnX/K0DmC3koeyOQNdSJBPr+wDAVBhhY6R3rbxhKjaG?=
 =?iso-8859-1?Q?+cz7T1Z+PXFaQBSv7wIgsHXsEotUWTv45y7Xb055h5NWQnOY5tOmsZQHAH?=
 =?iso-8859-1?Q?5jOVb+4F2BOnqm8DAg6bRiY+0Jmoqu2y4TKw73dD2+LcRh30cu6BWXfs0z?=
 =?iso-8859-1?Q?FCdf/x6JFjesVeu88OIc+hekI4qK5JnZlq0pRxKxRJJwtnOuarW8s6pzv9?=
 =?iso-8859-1?Q?WXi9W+7jGP4SqW12n0nBIL0EbtWlHW9Nu7vc/9AWf12/XbX60NHck3Pa6r?=
 =?iso-8859-1?Q?k9ek1lYGl/3tmfdthIpQRRSpAs8+hKXzn3ISYWpZfb6V8XZA+C0djJEsE9?=
 =?iso-8859-1?Q?7ciKjhgGPEOlQKPY4qKNJlcRJtR+934ekFe3BoCem0hUEbS7xjCgPBGkYc?=
 =?iso-8859-1?Q?bVpKRPhS6ei90SIHakdQIoQm2OE8qmlSyoQa1bIGm4wpqaXwsijAIAI1XC?=
 =?iso-8859-1?Q?s2nKXSDFupPVKL99aNOFeVdCPTwwOlW8VljHKnflk939mxHwwsjOZb8X3U?=
 =?iso-8859-1?Q?YsVKaki5LLwjSmj0kiWiHPHm6fJNJsv94nf6E7xpXnvXqYhCbNxe3jPJ0V?=
 =?iso-8859-1?Q?NAP7C6dplljuCj4ggPSm29xSvboMKWtSrbjNgz5vz2whb+igFbVDafgOOH?=
 =?iso-8859-1?Q?e+LnzDnBTmb7W/fHk48VgE4QnjFg4B8YGKDeLLv0Lr1B3RVhoXSXYyz+g4?=
 =?iso-8859-1?Q?ebbNKSj5pqLp1tPcERteT3Hk3uxzZ9Yj0JRF7fzIO3/u2i6+4DtMlbn/YG?=
 =?iso-8859-1?Q?L/Q9J4T6RqItzK7MSnUZrzx0ZLzaPTuS6dFQ/QXVSnDiIx+YyxsIIyAHch?=
 =?iso-8859-1?Q?0R1SoC1kYlGZDaBiy3cduLmPnUxRSXb5wHGGJDz7FKuLViLBd9NvwWNLYR?=
 =?iso-8859-1?Q?93/4MmZbjVvYP0rQHpn3U3daOtSKQNHR0B+khSf1xmmTxcB6OYW+JxZoLy?=
 =?iso-8859-1?Q?3mNUJ57y1UtM6Vj2P4Lp3LQp4kdeWtbG8DlpzKj03YuoiCWgPPUKeroxDA?=
 =?iso-8859-1?Q?XlGwBfT64QfHbzgW5fRoSllJkM8zR1gM6eHgE5sdi/vtysGNggoTZdrxin?=
 =?iso-8859-1?Q?6xK9jIr+lZcpdakpWm5TqkqBCmvNG/xb1bBBQAtlMvQ+n6OP82uEo4NJiJ?=
 =?iso-8859-1?Q?xoOFLDUQlj5LvtpQKPv5DHwhF2PACXX7LaGp/c9xKj/cPsa7jIIlq83KNc?=
 =?iso-8859-1?Q?hrs3nu10gwNCDVEIR6ZPVz46QTeOs+XiuCf6pHeYF7Uif2JAZWVXpq312r?=
 =?iso-8859-1?Q?imjRkYVCAdFZi4B0RucHFknHD65LzPq3alPRP3j5ky/bPC8Xn6gb+h8Idp?=
 =?iso-8859-1?Q?SwxAZy7YGNn9NwFELeOdd0t74LDyeGVViLXkAlrjrHnWVrcEqc/FgK69lp?=
 =?iso-8859-1?Q?DdAmZY2xxVLYzZg6WQ0VWcXB+RpC7c1oSocVhiBhc+Atim61e7q/cPTPcr?=
 =?iso-8859-1?Q?a67uVH18yEeu2uUZP0LDQfjrLFBhAmfZhc/UZPqGYqO5zscYqtTkIRFJ46?=
 =?iso-8859-1?Q?cSx/OngbmBUYLn47PmzuYFKjoPS8Xm8YsSsxA8EOTgcJmmmDBkMwTPYQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95024b4-e3e7-4761-70b4-08dba8e66f49
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:44.9820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f/k3Xb32J1XaaKVsrs/XVjlpzoQZmW3fOgEoHr4A8moveTnaXHgTvZB0cjHHilS89Bzn2Lvs85DALruECUAUuXognKMXxE3L834HZIThW/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: 6UMa9LcDeC2G7H2Odn-1F9XCLs63wV6Q
X-Proofpoint-GUID: 6UMa9LcDeC2G7H2Odn-1F9XCLs63wV6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
guest's view of this will want to be zero initially, the host having set
it to 1 may not easily be overwritten with 0, or else we'd effectively
imply giving the guest control of the bit. Thus, PCI_COMMAND register needs
proper emulation in order to honor host's settings.

According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
Device Control" the reset state of the command register is typically 0,
so when assigning a PCI device use 0 as the initial state for the guest's v=
iew
of the command register.

Here is the full list of command register bits with notes about
emulation:

PCI_COMMAND_IO - Allow guest to control it.
PCI_COMMAND_MEMORY - Already handled.
PCI_COMMAND_MASTER - Allow guest to control it.
PCI_COMMAND_SPECIAL - Guest can generate special cycles only if it has
access to host bridge that supports software generation of special
cycles. In our case guest has no access to host bridges at all. Value
after reset is 0.
PCI_COMMAND_INVALIDATE - Allows "Memory Write and Invalidate" commands
to be generated. It requires additional configuration via Cacheline
Size register. We are not emulating this register right now and we
can't expect guest to properly configure it.
PCI_COMMAND_VGA_PALETTE - Enable VGA palette snooping. This bit is set
by firmware and we want to leave it as is.
PCI_COMMAND_PARITY - Controls how device response to parity
errors. We want this bit to be set by a hardware domain.
PCI_COMMAND_WAIT - Reserved. Should be 0.
PCI_COMMAND_SERR - Controls if device can assert SERR.
The same as for COMMAND_PARITY.
PCI_COMMAND_FAST_BACK - Optional bit that allows fast back-to-back
transactions. It is configured by firmware, so we don't want guest to
control it.
PCI_COMMAND_INTX_DISABLE - Disables INTx signals. If MSI(X) is
enabled, device is prohibited from asserting INTx. Value after reset
is 0. Guest can control it freely.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
Since v9:
- Reworked guest_cmd_read
- Added handling for more bits
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
 xen/drivers/vpci/header.c | 54 ++++++++++++++++++++++++++++++++++++---
 xen/drivers/vpci/msi.c    | 10 ++++++++
 xen/drivers/vpci/msix.c   |  4 +++
 xen/include/xen/vpci.h    |  3 +++
 4 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 1e82217200..e351db4620 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -502,14 +502,37 @@ static int modify_bars(const struct pci_dev *pdev, ui=
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
+        if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
+        {
+            /* Tell guest that device does not support this */
+            cmd &=3D ~PCI_COMMAND_FAST_BACK;
+        }
+
+        header->guest_cmd =3D cmd;
+
+        if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
+        {
+            /* Do not touch INVALIDATE, PARITY and SERR */
+            const uint16_t excluded =3D PCI_COMMAND_INVALIDATE |
+                PCI_COMMAND_PARITY | PCI_COMMAND_SERR;
+
+            cmd &=3D ~excluded;
+            cmd |=3D pci_conf_read16(pdev->sbdf, reg) & excluded;
+        }
+    }
+
     /*
-     * Let Dom0 play with all the bits directly except for the memory
-     * decoding one.
+     * Let guest play with all the bits directly except for the memory
+     * decoding one. Bits that are not allowed for DomU are already
+     * handled above.
      */
     if ( header->bars_mapped !=3D !!(cmd & PCI_COMMAND_MEMORY) )
         /*
@@ -523,6 +546,14 @@ static void cf_check cmd_write(
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
=20
+static uint32_t guest_cmd_read(const struct pci_dev *pdev, unsigned int re=
g,
+                               void *data)
+{
+    const struct vpci_header *header =3D data;
+
+    return header->guest_cmd;
+}
+
 static void cf_check bar_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data=
)
 {
@@ -732,8 +763,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
     }
=20
     /* Setup a handler for the command register. */
-    rc =3D vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_CO=
MMAND,
-                           2, header);
+    if ( is_hwdom )
+        rc =3D vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PC=
I_COMMAND,
+                               2, header);
+    else
+        rc =3D vpci_add_register(pdev->vpci, guest_cmd_read, cmd_write, PC=
I_COMMAND,
+                               2, header);
     if ( rc )
         return rc;
=20
@@ -745,6 +780,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( cmd & PCI_COMMAND_MEMORY )
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMOR=
Y);
=20
+    header->guest_cmd =3D cmd & ~PCI_COMMAND_MEMORY;
+
+    /*
+     * According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.=
2
+     * Device Control" the reset state of the command register is
+     * typically all 0's, so this is used as initial value for the guests.
+     */
+    if ( header->guest_cmd !=3D 0 )
+        gprintk(XENLOG_WARNING, "%pp: CMD is not zero: %x", &pdev->sbdf,
+                header->guest_cmd);
+
     for ( i =3D 0; i < num_bars; i++ )
     {
         uint8_t reg =3D PCI_BASE_ADDRESS_0 + i * 4;
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index a0733bb2cb..df0f0199b8 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -70,6 +70,16 @@ static void cf_check control_write(
=20
         if ( vpci_msi_arch_enable(msi, pdev, vectors) )
             return;
+
+        /*
+         * Make sure guest doesn't enable INTx while enabling MSI.
+         * Opposite action (enabling INTx) will be performed in
+         * vpci_msi_arch_disable call path.
+         */
+        if ( !is_hardware_domain(pdev->domain) )
+        {
+            pci_intx(pdev, false);
+        }
     }
     else
         vpci_msi_arch_disable(msi, pdev);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index f8c5bd393b..300c671384 100644
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
index d77a6f9506..f67d848616 100644
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

