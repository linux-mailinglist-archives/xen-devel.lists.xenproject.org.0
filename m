Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F987C794D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616073.957865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s9-0003S2-AJ; Thu, 12 Oct 2023 22:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616073.957865; Thu, 12 Oct 2023 22:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s9-0003Jm-4A; Thu, 12 Oct 2023 22:09:37 +0000
Received: by outflank-mailman (input) for mailman id 616073;
 Thu, 12 Oct 2023 22:09:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3s7-00016v-20
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:35 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 055714ca-694c-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 00:09:33 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CG29eN021659; Thu, 12 Oct 2023 22:09:31 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2232.outbound.protection.outlook.com [104.47.51.232])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3tpcc6c048-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:30 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8758.eurprd03.prod.outlook.com (2603:10a6:20b:53e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Thu, 12 Oct
 2023 22:09:26 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:26 +0000
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
X-Inumbo-ID: 055714ca-694c-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeAe1z11V4yCH/nwHGCAa9MrU+IAY6nIC9xRcYwm6z1I9xJj3MrLXLUHMxTobHtDXu7wn7f50GszGUMnFkw5HEkSMSvo5/bgP70Ia3S9U8JKTmQLTDBu1PjUE4ZgjckdM0NRYUWXfqaEeZmRcg83+uEEA6Qk1oR0vpj6Cz/jok6Z09JjwkSFIiUXUBazl25LiMndb46VJVjekT2F8AYIcQ1HgrwLKKqb/FeXHTM17mF5GZsXYfTX+BViNGud40y0xuFYJBikHHs3zO0HFYBstI8cV4rXEnVBcMqShfAYMpNKg4trxbBf5fTzHZn8EtAqL3OwTWouVpoIL6a12TxBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxjLbTo8iMMJkl5SzG0dB3gVCQncYAbfISdfduk5+ws=;
 b=iBlRD29ZaXTmzVP8vksrzIGSnYGBYLcNRd31pQhay8GTIe275Q468eaB2q4+nrMOUGXTiYZ94sZZMLiYG+6JrHUMAxErr2e8vJOmQOCjQEV7wfScPM2o9jll/6SZxPUUdkLScsNYbeyAQ4xrisKEnn17p6hjWVwVZ4lJ+l/Ib30UYHSVAnpnkspHBSvv9fR5MvSOtNP5MxnR9t1RbkuqcsvMs2CcrTCd45FJ5kslTr0OOxm7qBKjja1YCvGJLZ0M2qmBYjFBpL5X6Y0FQO5GqugL5hNikv4MHtfr57vA1COhREgM4xBds8hEBL4lONpYLDkruOetIXdb15YD+QC+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxjLbTo8iMMJkl5SzG0dB3gVCQncYAbfISdfduk5+ws=;
 b=o1ny1wsRodTOPqoDT0iwdZrFqPvfdxeO196cJeFx19Ox1/8gZMdMTOhT8UMZ4w/McZBjy7whcYsV2W+9OWLIpVZ2LAUjgCyC8RutbNdHK3iTGxgiQOlR4EMETGJ4Gj+/vZg0B4in83Mp5hgq/SJiq9HbAAgN354jSv6R3eIbQgOa6uH1FRBaCX6c4lroATVPwDKU8iSPyCcaO9+sygWqWjqjI013dPNmciGgPPWEZmgWQi2uf+betUhijlcNQyJYp5LvURkE4WqpGC31fgoAbC42NUng3bskSyB1i5FHM4/VXlrmaxXYxtthHiqijdWK1gA98n3qJSsY4J5snFs2Kw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v10 12/17] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v10 12/17] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: AQHZ/Vi+sHqpo/XMzUSHL9PkKFM5oA==
Date: Thu, 12 Oct 2023 22:09:18 +0000
Message-ID: <20231012220854.2736994-13-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8758:EE_
x-ms-office365-filtering-correlation-id: f2747525-f901-49f7-63dd-08dbcb6fe61c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XFYWFNcoiZlGzyj1dy0AJp8PtoYHfD/stRJ1jctbLu9C8au4lXgcewB/xwPymcy4+qSfzgeGkVQBcFQ11OOMiqJ5FYbUqZ0qsCyWblX4K6mPrH7vrX9Eb2RGC9XDyArqia6/kB3cRylAaWxoM0U0LRqO2nJ+XE7PYbd7YCZllL+Bh6APMp4SgH1y46KLCvqww2hd2Nc4ZcUe/2Uuq6dRUkWRsguJ089d/HRvHKmxBXqpDm2E7HM6+xF6NTYr6LF9Zc36xEo7mQwPCY8IKojgk0V5+zkj13aYvEW652jltnYA7sltifMmlHqTealGC5zomEGUGOSztJLaJCjGjroQ/n0PM9zKKB3dRrIsTnPq6Webh9KhcDIpMje30kCf8GOMCpipF8jwd17UaSqReug+eytCqPIXf8yZiSvohrTr0biYkU8aPIQEOdv9WRk9N/ooBxDVLJUHyX2jyYsXN+sI97shmL4Mwm5z/cfWtSuxeKNcfJkuN0ogew2/GBMt8mRBhJnNH577VKpIXXnQRCoiu8wONQ2qbpD8FSjcVeORMOUewDtd9VTEAC1R9tOryFOV87LSxGC/LQ8J5RouatD/0IrKzBssCpC2AIXq5lH4ls1ERi8tuYWV+wBcTWIfXUGi
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38070700005)(6916009)(5660300002)(41300700001)(316002)(83380400001)(86362001)(122000001)(38100700002)(66446008)(71200400001)(6486002)(26005)(1076003)(2616005)(107886003)(54906003)(478600001)(76116006)(66556008)(66946007)(66476007)(64756008)(91956017)(2906002)(8936002)(8676002)(36756003)(6512007)(6666004)(55236004)(6506007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?rLRTpMPntF+kt8fSiqeOaGbKAdW3JUH6eJVKS2eXzd4MqLXwuvjaEeYhqa?=
 =?iso-8859-1?Q?JYRHuv8dywfPcK3auubar7rZo+Pr0eCIob2KUzOeAu+V1oltVvHJEyPMGt?=
 =?iso-8859-1?Q?YHEitEjV46uEB+7oTGb0K8ywdKHx9cG+z/FSnw/lEzKsiKChePGNExrOCW?=
 =?iso-8859-1?Q?jcU77SSg2Ma4P69DKCk6FzMLVeRaiOKFlMANxhQhCF74odTnaopvUocXIV?=
 =?iso-8859-1?Q?x5CjMcN0m/v6O7SejlFI2ZZE3C4zL4rRupjVHJMk32prl46ZlFnCfFpRlj?=
 =?iso-8859-1?Q?3dRpDxqPiwYxLe5rGZLmTIE+UUBwiJBS9OOwxlafJwIxPcpxF3vyAQ6pdK?=
 =?iso-8859-1?Q?0J1QNs+IUuVlOHDMPoN8eYF7yMssqn2tA6fuHIzx2ADMorN7kshZOK9qBQ?=
 =?iso-8859-1?Q?g8TCtmwwmA6RyEdq4teTackS0Gw7YeafSPoDF3c3xrnu/1N8eA4bPT4Fhx?=
 =?iso-8859-1?Q?TdGlobGTJ4P9XxP355innSF182EzxR09AKiPLgqWD35Cd712sOzI+w74iK?=
 =?iso-8859-1?Q?YCryd029cBZ6KD63Tmezdh8sN6aj6iQHZ2Jl6AWgpDM0ZvLuMzO+PmGKln?=
 =?iso-8859-1?Q?+NkSLHs7I8hpgxce4IhkGgwK4tP5lx0I507nmWsJ5q5CNTEobK/KLJD//G?=
 =?iso-8859-1?Q?xA2TEt1Fj1aqVPSQlI0dZon+odI38BPOx2Dqo2HyAYUAlTwi/4OiqAp7ul?=
 =?iso-8859-1?Q?QHu+6HBoNYYbtTOWrwxoVP82t30/x9eWQ5NM2hBLQn3J3C5/1z5BZOHh4M?=
 =?iso-8859-1?Q?nSw7kNlCEKslvEnRztUT2lYe7sLUP1g3rYgXynaMccBKb8zY+D/Kq4VtT/?=
 =?iso-8859-1?Q?p19b3Yin+MoH/eqOUL0lU2WpFn9AhzeLq6N+ilDzv8CbYpzdTzY4J9WyHZ?=
 =?iso-8859-1?Q?TRhfjVWLPmaCpYCS4ftNAnBQoK8l66WrqIoNeSoetwhao4CR5DVUoJcnhV?=
 =?iso-8859-1?Q?LOQ9zBDRIHvCbDyRvFn31uDr3Z7Pl0jD3URy02jr1S5tYHgwSs0O0NM2ty?=
 =?iso-8859-1?Q?FLV9J6A7JP/FRTUz/28Ino9T1AP+6o5Bj+8GkGXJzd8dMacGtLYg1WdVon?=
 =?iso-8859-1?Q?uaEBzSW/E8V87uM/1tyauG3AnrxRJptWmwgq1RZVHsrfPS6/GRI+69qMk3?=
 =?iso-8859-1?Q?n5b06h4LWfWjPOQQ3NM0XvvyRai1td9zL9uX5xPRMWeEN6LbT6L0PuVa7v?=
 =?iso-8859-1?Q?ORcl6gD+UgL83jbXns55fkcBgUEp/BPRtOy/yM19PdlkYtk70NEfUzMByF?=
 =?iso-8859-1?Q?1hOe7cLaTM7FI+dEfseVO/0RbntmbiEPfBudCmiUPU+Uhm1+/lOBlDIBG3?=
 =?iso-8859-1?Q?LWLa9KCqxLlist196+2ryHFkgZLqFB4We9D8M8j9AIcOx5ied3l5WQRlaN?=
 =?iso-8859-1?Q?41u9OTC75MQ9jQ02oFM5fqLx3DqszdTY6/53c2Hw6a8FOU7NlpUdkiQ6sd?=
 =?iso-8859-1?Q?TVZZ1XG4U7OQo/3vA3U+SH6hh82ArsTktLvDZM/p8WLRE0FlplLyPR5dED?=
 =?iso-8859-1?Q?VBxDf5JDnCpIvtg1X0PXmn4wuzWZ7HaK4m6iborqri+l3Mcwl7n5ZTkOrx?=
 =?iso-8859-1?Q?c8jipV3W4WTckFgmExOVtbtbkye0JhT1h7+KWFFgr3lup7y6nMh8Rbsx3h?=
 =?iso-8859-1?Q?qR5zn97XV+dn43wnD0dyO+kFj1RTseI4zYk9+c8wEvgos7KbPz10ZPLg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2747525-f901-49f7-63dd-08dbcb6fe61c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:18.1381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CshJD4+uYU9GB7h7iX8nMQx7PiyIxfkhfPBvvk7xNyfv1DkuO6Fd0cQ8ZEuyJou3jn115a81HOPS86xu/a49Tlebmbl6856yYSXswhZ7FcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8758
X-Proofpoint-GUID: 04X6v8G0BIywl6wgAQe7Iz8w0rtLWt-c
X-Proofpoint-ORIG-GUID: 04X6v8G0BIywl6wgAQe7Iz8w0rtLWt-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310120186

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
emulation, along with QEMU behavior in the same situation:

PCI_COMMAND_IO - QEMU does not allow a guest to change value of this bit
in real device. Instead it is always set to 1. A guest can write to this
register, but writes are ignored.

PCI_COMMAND_MEMORY - QEMU behaves exactly as with PCI_COMMAND_IO. In
Xen case, we handle writes to this bit by mapping/unmapping BAR
regions. For devices assigned to DomUs, memory decoding will be
disabled and the initialization.

PCI_COMMAND_MASTER - Allow guest to control it. QEMU passes through
writes to this bit.

PCI_COMMAND_SPECIAL - Guest can generate special cycles only if it has
access to host bridge that supports software generation of special
cycles. In our case guest has no access to host bridges at all. Value
after reset is 0. QEMU passes through writes of this bit, we will do
the same.

PCI_COMMAND_INVALIDATE - Allows "Memory Write and Invalidate" commands
to be generated. It requires additional configuration via Cacheline
Size register. We are not emulating this register right now and we
can't expect guest to properly configure it. QEMU "emulates" access to
Cachline Size register by ignoring all writes to it. QEMU passes through
writes of PCI_COMMAND_INVALIDATE bit, we will do the same.

PCI_COMMAND_VGA_PALETTE - Enable VGA palette snooping. QEMU passes
through writes of this bit, we will do the same.

PCI_COMMAND_PARITY - Controls how device response to parity
errors. QEMU ignores writes to this bit, we will do the same.

PCI_COMMAND_WAIT - Reserved. Should be 0, but QEMU passes
through writes of this bit, so we will do the same.

PCI_COMMAND_SERR - Controls if device can assert SERR. QEMU ignores
writes to this bit, we will do the same.

PCI_COMMAND_FAST_BACK - Optional bit that allows fast back-to-back
transactions. It is configured by firmware, so we don't want guest to
control it. QEMU ignores writes to this bit, we will do the same.

PCI_COMMAND_INTX_DISABLE - Disables INTx signals. If MSI(X) is
enabled, device is prohibited from asserting INTx as per
specification. Value after reset is 0. In QEMU case, it checks of INTx
was mapped for a device. If it is not, then guest can't control
PCI_COMMAND_INTX_DISABLE bit. In our case, we prohibit a guest to
change value of this bit if MSI(X) is enabled.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
In v10:
- Added cf_check attribute to guest_cmd_read
- Removed warning about non-zero cmd
- Updated comment MSI code regarding disabling INTX
- Used ternary operator in vpci_add_register() call
- Disable memory decoding for DomUs in init_bars()
In v9:
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
 xen/drivers/vpci/header.c | 44 +++++++++++++++++++++++++++++++++++----
 xen/drivers/vpci/msi.c    |  6 ++++++
 xen/drivers/vpci/msix.c   |  4 ++++
 xen/include/xen/vpci.h    |  3 +++
 4 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index efce0bc2ae..e8eed6a674 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -501,14 +501,32 @@ static int modify_bars(const struct pci_dev *pdev, ui=
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
+        const struct vpci *vpci =3D pdev->vpci;
+        uint16_t excluded =3D PCI_COMMAND_PARITY | PCI_COMMAND_SERR |
+            PCI_COMMAND_FAST_BACK;
+
+        header->guest_cmd =3D cmd;
+
+        if ( (vpci->msi && vpci->msi->enabled) ||
+             (vpci->msix && vpci->msi->enabled) )
+            excluded |=3D PCI_COMMAND_INTX_DISABLE;
+
+        cmd &=3D ~excluded;
+        cmd |=3D pci_conf_read16(pdev->sbdf, reg) & excluded;
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
@@ -522,6 +540,14 @@ static void cf_check cmd_write(
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
=20
+static uint32_t cf_check guest_cmd_read(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
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
@@ -737,8 +763,9 @@ static int cf_check init_bars(struct pci_dev *pdev)
     }
=20
     /* Setup a handler for the command register. */
-    rc =3D vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_CO=
MMAND,
-                           2, header);
+    rc =3D vpci_add_register(pdev->vpci,
+                           is_hwdom ? vpci_hw_read16 : guest_cmd_read,
+                           cmd_write, PCI_COMMAND, 2, header);
     if ( rc )
         return rc;
=20
@@ -750,6 +777,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( cmd & PCI_COMMAND_MEMORY )
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMOR=
Y);
=20
+    /*
+     * Clear PCI_COMMAND_MEMORY for DomUs, so they will always start with
+     * memory decoding disabled and to ensure that we will not call modify=
_bars()
+     * at the end of this function.
+     */
+    if ( !is_hwdom )
+        cmd &=3D ~PCI_COMMAND_MEMORY;
+    header->guest_cmd =3D cmd;
+
     for ( i =3D 0; i < num_bars; i++ )
     {
         uint8_t reg =3D PCI_BASE_ADDRESS_0 + i * 4;
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 2faa54b7ce..0920bd071f 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -70,6 +70,12 @@ static void cf_check control_write(
=20
         if ( vpci_msi_arch_enable(msi, pdev, vectors) )
             return;
+
+        /*
+         * Make sure guest doesn't enable INTx while enabling MSI.
+         */
+        if ( !is_hardware_domain(pdev->domain) )
+            pci_intx(pdev, false);
     }
     else
         vpci_msi_arch_disable(msi, pdev);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index b6abab47ef..9d0233d0e3 100644
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
index c5301e284f..60bdc10c13 100644
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
2.42.0

