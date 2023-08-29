Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6593A78D054
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592520.925347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80G-0001WV-Nc; Tue, 29 Aug 2023 23:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592520.925347; Tue, 29 Aug 2023 23:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80G-0001Nm-Ao; Tue, 29 Aug 2023 23:20:08 +0000
Received: by outflank-mailman (input) for mailman id 592520;
 Tue, 29 Aug 2023 23:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb80D-0007EX-O5
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:20:05 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95442fdb-46c2-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 01:20:04 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TKDeco030691; Tue, 29 Aug 2023 23:19:54 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3sshtetfcp-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:54 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:47 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:47 +0000
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
X-Inumbo-ID: 95442fdb-46c2-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCDDyckIZHJuVh8M/CbAYACcSF4uilv401AzvHpyMM8VwF9o95XEJfZOQpCZTKMI1baH1noUIBD8kkePxNLBi2i4KliBhMQ+p5bRv9J6C2KjKwbWu5mNHxgA8mypdQ8lcf/Gm6CF4HaT4eXZxXjoA15BI1+z8XRAstt87ALEcFWrT8uiXdkrGH7MAqOyLZvjvyI2vFBaxVp+2pEFzULX2+EeJS5FZog6UuBBjtnkD8Zpz/OUMpeHMv1TGxHwt0FsdtGJFO2i3jM+W73S9hUy9YLK7rZCpFYobEtmph6oYD9Zz8oDch3gWyO2NHPRJIwYfKo/y1qdUP6J60WQD0qrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ue+npJ59xH3XrannJE1/DsrXyaqa3rixPlEc99NrgY=;
 b=PNgWw7yQys9I2vSYPrba1YL440v7TbnMDJqCCdGTWDMkHlyg56bK/PGcbE445tiRxNZXg4Cjs08ct/JOl+bkca7yyeNaE7GmHnA01A9WnXdAPveicnsvE+zv7xchl5sqER7Uaw+MBSwSjFIyvwEC4Zbqb0CkIyYFmjl5M3pY+fgE68XCynsbMRkuTv/VrqdIlYzl5wwGqKbiV+DX2BseI2L2pKG3o3X5ZHTIOnaR/t4ut8KqGjLZhC8+R477IweC8aqTl2GLXT3QyQGRIkRKxsmUfhPuZyD8oKMDfSDGhlc/ZM4R0+QtbyH7WlCFcKZlXPyiGaNM7AgW3aYsJsDfnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ue+npJ59xH3XrannJE1/DsrXyaqa3rixPlEc99NrgY=;
 b=SFusgAwxqELY5JTmQkJcc9uk7n+zddzUiNuqzksUNk8F1WjM/abXvSq74gwPd8QNyFXqbllamZSrFPtHF29nWGjotJ5t8u0vCC1ViGPp64bu2fqVV2kq3z+d6DbK3FxUt98jHDkR7NXfuzP1i06Gu6QjNevowMR7RMNMK5Rk5QHmuSho2mE0Rc9v2tD9HdSaApz8i6Hkr4UNFYuXxmsgePMR2AVbX4PG5BJPl8VhFSjlTeYfnygGuhhHSgV9Embp37nixv96OaSxw7ge2YvGO5fxd0xOt0Fl15H/aZDCfGU+n+kMYEwttg926SQa3DnbDK4z2Z85+wr+RDYrjcBGNg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George
 Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v9 12/16] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v9 12/16] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: AQHZ2s9MKcW5IJI1REe00zENuWVyEw==
Date: Tue, 29 Aug 2023 23:19:46 +0000
Message-ID: <20230829231912.4091958-13-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: 174136b3-4192-41d7-7d6a-08dba8e66fb9
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ohl8yXn1LS45JBQcKlnlM0ASHOChDvy1KDW2UPmvzSKkrhwiRJ4kotlmUrzjlwfzeyxAgtNU3xbjjye/heqpk4xMg8n1jHIGouTFYmY2MEiLDJ88ANuzgtljJQE2FtT4mOZVxNkl3IyPK3WA0KM1Tx9fmzIcrooGzbZPNZrMrK86eNDXVJOGAUhwCozZfRjRFKZIYYHCezVCfES+EqT3w4+SKvTvCdSF3AZ+Aj2FXaVbPjWbfb1tMRfdK+5FLgk3IQjjUj8caZQEa4d2ZhXfwgbdgzxFjGhpa9VuaFguWsjQy1EX/d0wD8R6xOXu4y8iG4BGjQwKvobruZcfSd/SqKYA+cuoMgIW9tGl7+W96MMduF2lIYe9QwR7zyLeKAZo42D+1lqfHH9ncH3x/I9nmBE7AvcIAqKvjR2a2kV5TwvYaUNWAIjPVTVPbFAgpeXK33tc8kcn2VjzO+vb5Rpqm9Xdl3+MZBA/n4lLZiMN+CKo8TEg/wp20HK1/sQm1Y2Fjpva6xkMSVZcUFkNrMa/fxnrObvOuVmUKU1QfVtOzPLyjF10EZi9y2hYKzpN4HrJN6rQny1Mt//bbIKA2q8nX+tmi4iShwn7SaNT7wmkfwK4dDC5UIhXxLN1f8tVgRr+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(26005)(2906002)(6916009)(64756008)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?QwySOMC2dz7T4WsyM25a1nk0bTOdRGhj6QhxIaCkjOECz3SzzYP9ca76x7?=
 =?iso-8859-1?Q?0Hde2V/VP3wVVbhHrWehFXrLTZVgcXi/yNV1tOlNwm340hFsYTltsOdZZl?=
 =?iso-8859-1?Q?yq+8NpnQ2hZ7ELqMYwXg4MfaasNPviByHNmclwmKdQ+lKS2eq5Ep9p259n?=
 =?iso-8859-1?Q?FQhkh0g9rc5by9kRTlKCf6V8EF9kCidzY2Zd6mlHjaSiW6T0o43zdOvcDG?=
 =?iso-8859-1?Q?wz8IRqTGV4pgoDn17rbkSZ6nA2clg+jVKEMxPJt6dBBG1C71wd5LRrpdGf?=
 =?iso-8859-1?Q?CTwptTAk4eYoT4fHeE0nBsep9Bgr+YJTk2rqmtxR6ZWNqDmYcKCG0nXfvX?=
 =?iso-8859-1?Q?G8InKk7WlXHuFJyMxmsYFnXHJV9M9kTWv6i6rrf7NZiTngOP0mbWcZOrL5?=
 =?iso-8859-1?Q?azcYCso99ZWrDQaJco/ZFTVoqPIVPvLgP6ZRszBnr4HaD6z+v7TshL/Mcu?=
 =?iso-8859-1?Q?sgzmPka7QHT0/ZH3pt5i+jmV0823h1vgNgbA4QK7ZITfOlUiOQpSoJp4v8?=
 =?iso-8859-1?Q?ahhQQZzOVwiVzteKPKFBCgGLjReoPH5gtBerAytL1DHw005QNH60hEmEYQ?=
 =?iso-8859-1?Q?WHAgkUFusCgiuX/cfizr9DhdpW6jIDljcUnR9BI8C2ji1Ci87q3lzGNh/3?=
 =?iso-8859-1?Q?tE1xm5aFqT+pySt1jncvQhDUMw9UhIK5RAL2hqp2mYqyg4uXdUw9aoTWm8?=
 =?iso-8859-1?Q?bQU0LH5zAbit5OpGBCnPqgusOv+1w6fwMAU+ezVa0UCXWdAL+cBRbSz8kC?=
 =?iso-8859-1?Q?JSqPWdmiywLJESMhvon+yVsF3t390nBV3jgwbqs9lUcefwDgSSpiYrztW3?=
 =?iso-8859-1?Q?SBVjNDCqtZEYVxJoUuEZJJaO6xkRS277N4cTqAGccYMavBZEYtPMqUyYq8?=
 =?iso-8859-1?Q?GFdAA96Ifn7PYuES0iEeDoxjrwTmQ/4Du7wqA6THzH/A1oDooA+BN0aR4N?=
 =?iso-8859-1?Q?YPoZ5wSdwtepVmKW7fG2ost2449rRPzjMGlUzwmhRT3ini2dVcn9PQtND7?=
 =?iso-8859-1?Q?jIi1cp3r6Or5JTuqsK8YM4ACQwyb9eJ2VxTyIZdWfrKRpaBaXaEjayLUSV?=
 =?iso-8859-1?Q?fucVrJiRmEI59y0gk+X7uN7RFXhQIJ3Su9X5CSlNbgD1pNRzMeVjyTRCHZ?=
 =?iso-8859-1?Q?BIqMTqklZs6HU/1Jz1hUsJWfec4XYvQQZ+C7jvQjIC+9n/9lOhMrXgzAM9?=
 =?iso-8859-1?Q?nY+yU6Tdq0176Q2KXbxtK2xnL8k4OSAwyJo+nNIYJi1fIlw7Psgb7H05sJ?=
 =?iso-8859-1?Q?IZWh5zmjyGLumskPq4ZhjWedOTKHP8bzPdmLMsdoYD7mQxJ6jMJItnQ9ah?=
 =?iso-8859-1?Q?M3PJSoLqnYs1q1tzBPvCznElb7L1+SSefMpIjIRe6H+TjeT1NDuukTiD/9?=
 =?iso-8859-1?Q?XwAwGVtRXOBvEwefX6MzhUMyOKmXV/9YyJjiUloGER//TUIq3rBALaC5rT?=
 =?iso-8859-1?Q?IAv8Yy1j6r9oH8sqt4B05kwsckUWnECk0a9ymSpZxoJkWZtliXIlRR0JJu?=
 =?iso-8859-1?Q?FvqKQLbiJLyT2RnunaUkTgFieJ4Ei7M65WnBKbokwxx7RRLwQx/S943MKN?=
 =?iso-8859-1?Q?i+V05jiWn2Ly81whMyzawG0Qv2rloEqGs8Dv18yZk6+OuheOdawhrzBqO/?=
 =?iso-8859-1?Q?CrtVQwf07W4+kDNWiMDT0xLCSAKHnudiQBzmOH8P0soBTDhGj2ChJ9qw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 174136b3-4192-41d7-7d6a-08dba8e66fb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:46.1274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: slKXMZaGVjpyWr8NhRBaReTT3hBE1e39R4oGQUpv6+QW+paWtyx1a9DO08QcJ7huiEjvWkXdsVr1HP7j7rUGM7twlvU75cbBjco16Wd+qPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: Vcv_aM5FLTxJo9cslBCVwmmcGSpcZPed
X-Proofpoint-GUID: Vcv_aM5FLTxJo9cslBCVwmmcGSpcZPed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Assign SBDF to the PCI devices being passed through with bus 0.
The resulting topology is where PCIe devices reside on the bus 0 of the
root complex itself (embedded endpoints).
This implementation is limited to 32 devices which are allowed on
a single PCI bus.

Please note, that at the moment only function 0 of a multifunction
device can be passed through.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v9:
- Lock in add_virtual_device() replaced with ASSERT (thanks, Stewart)
Since v8:
- Added write lock in add_virtual_device
Since v6:
- re-work wrt new locking scheme
- OT: add ASSERT(pcidevs_write_locked()); to add_virtual_device()
Since v5:
- s/vpci_add_virtual_device/add_virtual_device and make it static
- call add_virtual_device from vpci_assign_device and do not use
  REGISTER_VPCI_INIT machinery
- add pcidevs_locked ASSERT
- use DECLARE_BITMAP for vpci_dev_assigned_map
Since v4:
- moved and re-worked guest sbdf initializers
- s/set_bit/__set_bit
- s/clear_bit/__clear_bit
- minor comment fix s/Virtual/Guest/
- added VPCI_MAX_VIRT_DEV constant (PCI_SLOT(~0) + 1) which will be used
  later for counting the number of MMIO handlers required for a guest
  (Julien)
Since v3:
 - make use of VPCI_INIT
 - moved all new code to vpci.c which belongs to it
 - changed open-coded 31 to PCI_SLOT(~0)
 - added comments and code to reject multifunction devices with
   functions other than 0
 - updated comment about vpci_dev_next and made it unsigned int
 - implement roll back in case of error while assigning/deassigning devices
 - s/dom%pd/%pd
Since v2:
 - remove casts that are (a) malformed and (b) unnecessary
 - add new line for better readability
 - remove CONFIG_HAS_VPCI_GUEST_SUPPORT ifdef's as the relevant vPCI
    functions are now completely gated with this config
 - gate common code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/drivers/vpci/vpci.c | 69 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/sched.h |  8 +++++
 xen/include/xen/vpci.h  | 11 +++++++
 3 files changed, 88 insertions(+)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 412685f41d..b284f95e05 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -36,6 +36,54 @@ extern vpci_register_init_t *const __start_vpci_array[];
 extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+static int add_virtual_device(struct pci_dev *pdev)
+{
+    struct domain *d =3D pdev->domain;
+    pci_sbdf_t sbdf =3D { 0 };
+    unsigned long new_dev_number;
+
+    if ( is_hardware_domain(d) )
+        return 0;
+
+    ASSERT(pcidevs_locked() && rw_is_write_locked(&pdev->domain->pci_lock)=
);
+
+    /*
+     * Each PCI bus supports 32 devices/slots at max or up to 256 when
+     * there are multi-function ones which are not yet supported.
+     */
+    if ( pdev->info.is_extfn )
+    {
+        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n=
",
+                 &pdev->sbdf);
+        return -EOPNOTSUPP;
+    }
+    new_dev_number =3D find_first_zero_bit(d->vpci_dev_assigned_map,
+                                         VPCI_MAX_VIRT_DEV);
+    if ( new_dev_number >=3D VPCI_MAX_VIRT_DEV )
+    {
+        write_unlock(&pdev->domain->pci_lock);
+        return -ENOSPC;
+    }
+
+    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
+
+    /*
+     * Both segment and bus number are 0:
+     *  - we emulate a single host bridge for the guest, e.g. segment 0
+     *  - with bus 0 the virtual devices are seen as embedded
+     *    endpoints behind the root complex
+     *
+     * TODO: add support for multi-function devices.
+     */
+    sbdf.devfn =3D PCI_DEVFN(new_dev_number, 0);
+    pdev->vpci->guest_sbdf =3D sbdf;
+
+    return 0;
+}
+
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 void vpci_deassign_device(struct pci_dev *pdev)
 {
     unsigned int i;
@@ -46,6 +94,16 @@ void vpci_deassign_device(struct pci_dev *pdev)
         return;
=20
     spin_lock(&pdev->vpci->lock);
+
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    if ( pdev->vpci->guest_sbdf.sbdf !=3D ~0 )
+    {
+        __clear_bit(pdev->vpci->guest_sbdf.dev,
+                    &pdev->domain->vpci_dev_assigned_map);
+        pdev->vpci->guest_sbdf.sbdf =3D ~0;
+    }
+#endif
+
     while ( !list_empty(&pdev->vpci->handlers) )
     {
         struct vpci_register *r =3D list_first_entry(&pdev->vpci->handlers=
,
@@ -101,6 +159,13 @@ int vpci_assign_device(struct pci_dev *pdev)
     INIT_LIST_HEAD(&pdev->vpci->handlers);
     spin_lock_init(&pdev->vpci->lock);
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    pdev->vpci->guest_sbdf.sbdf =3D ~0;
+    rc =3D add_virtual_device(pdev);
+    if ( rc )
+        goto out;
+#endif
+
     for ( i =3D 0; i < NUM_VPCI_INIT; i++ )
     {
         rc =3D __start_vpci_array[i](pdev);
@@ -108,11 +173,15 @@ int vpci_assign_device(struct pci_dev *pdev)
             break;
     }
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+ out:
+#endif
     if ( rc )
         vpci_deassign_device(pdev);
=20
     return rc;
 }
+
 #endif /* __XEN__ */
=20
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 535a81fe90..0aafe19a51 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -461,6 +461,14 @@ struct domain
 #ifdef CONFIG_HAS_PCI
     struct list_head pdev_list;
     rwlock_t pci_lock;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /*
+     * The bitmap which shows which device numbers are already used by the
+     * virtual PCI bus topology and is used to assign a unique SBDF to the
+     * next passed through virtual PCI device.
+     */
+    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
+#endif
 #endif
=20
 #ifdef CONFIG_HAS_PASSTHROUGH
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index f67d848616..58304523ab 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -21,6 +21,13 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
=20
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
=20
+/*
+ * Maximum number of devices supported by the virtual bus topology:
+ * each PCI bus supports 32 devices/slots at max or up to 256 when
+ * there are multi-function ones which are not yet supported.
+ */
+#define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
+
 #define REGISTER_VPCI_INIT(x, p)                \
   static vpci_register_init_t *const x##_entry  \
                __used_section(".data.vpci." p) =3D x
@@ -155,6 +162,10 @@ struct vpci {
             struct vpci_arch_msix_entry arch;
         } entries[];
     } *msix;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /* Guest SBDF of the device. */
+    pci_sbdf_t guest_sbdf;
+#endif
 #endif
 };
=20
--=20
2.41.0

