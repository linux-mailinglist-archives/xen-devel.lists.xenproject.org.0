Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F70978D053
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592523.925375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80L-0002Rf-2j; Tue, 29 Aug 2023 23:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592523.925375; Tue, 29 Aug 2023 23:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80K-0002Ed-GR; Tue, 29 Aug 2023 23:20:12 +0000
Received: by outflank-mailman (input) for mailman id 592523;
 Tue, 29 Aug 2023 23:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb80H-0007EX-7W
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:20:09 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 979983bf-46c2-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 01:20:08 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TFMk9o021983; Tue, 29 Aug 2023 23:19:55 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ssdvpbm4f-10
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
X-Inumbo-ID: 979983bf-46c2-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxKFKczdE4Ax4QZdoyCTwmawnW92pEgafLwtv3nNG231C+6wXqkB7hmcaXIiZf5kfjg3j9GnKOFQbVUUl2V8a1FxDPI/OuZLMFWdGfSv/fGHOrcDI4J1VBLtev6ZxZlXS4sUrpyecHyaRkpAzbL7d1NNfZrltZj+vAnAoTWgojd6r9TrclOFL/vmd1ueF9prBwQ0kvbvPbWUGz5WU7ZuoI+29C3Sw+5Q/Ktp65EeowBlSi3p2JrfOkEUW2t5UAtKQdoNA0TrHCs5yH3Z8216og4/esbNNO2+9em2qk3ZRoK8BEdWQVXuQRxCFsEfbOf8gAxV5cbwYsYBW0xZpA6b7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHS1N91i3tWS5LH97lRofiQwO8GsJ0yTSCwV8j1YJug=;
 b=UC9nFOS/rjstrdv3pHplV/iZBURT/W6yPVSYa3HIU6iHXqo9+EyJ/wz9uZBgQtq5mwT/L3gkOE43Zd/rjgHDvAcP9iXtMUqhgDRAVPt7lFGfGT3uRgzwUId8fMqYBlbA51mIeJj1wT8F3m7OsOC0Bk7r6lsfeEbvrBQAdLJFne0rlCFTicN0GKjke96OwRc6u6bG9KIs4Q4LZyfZXXdqNSaaLs7yJ5k3WLwN5yC/NEjLdRncgv1A75lQ5T8gMD3syV5GzcJHogvmJ8v1M5qXbRAcQKPaFJr5PXOdcwuW0mgjhH2k4Q0ovjA61Tez90MAIRl9/+51Cs4DpxJD/T7NHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHS1N91i3tWS5LH97lRofiQwO8GsJ0yTSCwV8j1YJug=;
 b=BzFNq4sGttW7hCuH7/jdTRljjt/R79QsQ3sbH/iycgC22hIbTXUEVtU21KcUj/Ip5iK58ZyAx2xOh3MJT6aMsPE1hjUkZi1Klfxq+65UrIW74MXAmjDJ0azxzopMk3Tm0lTEEJXb4GDRvDCUMZN5h2r72CYdoQA/IFADs2zUFtTZ90ismgu5nZYzxwLluTPqXK9cCivKMJfV3RTA+tU6DsagVrpTLIGGyNigaRDUi4z6tCmxC20cGPwaSY9R/c0Rdh0I3cf1JwgJHayjfo/uw+v8bj43G5uaC1/OBNCl9zjGhAxrjpSKmkc5ddGNHSuB/rP6qP0gxfD/P22u2/u+IA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v9 13/16] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v9 13/16] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Index: AQHZ2s9Molv+Wh+IUEiui1Q0tNeNzg==
Date: Tue, 29 Aug 2023 23:19:46 +0000
Message-ID: <20230829231912.4091958-14-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: ec4cec94-98f0-4cce-66fa-08dba8e66fe4
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sgwt81SyObsKSdoMauM94TyzUifygSgwInkEctsS2rzD5qpLdg62CNUVqOKfkFFEYoP0u2QwY8hvDKcJplir2dM1iTtmapRFQUNXLf/8zdClPNDg9aBGhnNCsvzNI6yNtz507f45QlMe3pSwuSqxduU9nlOTN5Yxxav9xvc4UsUebrUs6+DFUCFUkMmJvmUeAMOqDCodkLpLSXWPxr0FgGNwHI0wmQzdf9zEvpmy9iIU8kKfPbxtAqn56LoX2dBvGQ8Mi6CuvkLXRVwU/M9Ie0UrS0nfv+u9KhKIXVn9ddvWEQhHw3/J8W/0D315GU38TU5fHvp/G4hZssLI5CiuCEoOEKzS5NHg0t4yU/9Yr88/W5w99vfoJu5bIDhINPyj1ozzkF5jWbEOCdZRp7otmS/yUYXG9zFZzCkcjE6X0m2BpDYVmOJxameyoPVl9qtdlp6pXYDqkpAtbjH1pQP8TwwEy8AzuJIMNJj3rMbQiUv/JxTXEeN9/lRkO9uYFTALQqfMrEQX9+Wd8FDcCLDnNGiTihJa/r9fE+Qh89/Pv6KKxC6jNN5q7ywfw3BoWtWolRou63AG9qHFUy4Wz0z47zDoHuJj2oxTm+st8dJRoiwz1JTMNEo5pEliFlf+X7ls
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(26005)(2906002)(6916009)(64756008)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?kEVgs04aHsq3toCh0fqO5mp/jo3qCaLWbQBv42PuICyFvS1Yh4OI2KDCLs?=
 =?iso-8859-1?Q?j/6BWf4vjvc8rYknFZirehLUhMKfpRba3Etb1rfjJlo5cTrdqSNRloJOsq?=
 =?iso-8859-1?Q?obX76TC9Rzadhqj3BedNsD1o4GNM8NaMtMMWkYFA76geFUKOvSUeqUbmp0?=
 =?iso-8859-1?Q?TeFTbfQGfbNAzj79yv2nHi3aqG2cU67D+gVqoqRQ7N8k36uOd9w8nTlh7p?=
 =?iso-8859-1?Q?7IXKBriyl06Vr/MAfEsy8qwVC7WzDKBbZ6eogOUC7T21nY3mXhUzMEnZi6?=
 =?iso-8859-1?Q?y+/6ogHPOCe1+9Nra7Svg7fzYv5gDSfP49K6iKWd9JEyYbi1bk86kK05Cw?=
 =?iso-8859-1?Q?/NG+FXtriwlSZnM7JQRuIPUHf+rPivyvGPEccN9HwZj+aJAyk170TrMb7T?=
 =?iso-8859-1?Q?D+SVsdgdIKRQAejkoZ23E1N8NR4yjXukjgyslsvFIX3c9rcuJY+MvkGhb7?=
 =?iso-8859-1?Q?2ZCHkDou99qtAt7g8ri6iPlGpXBJkO34rrDMsBBT2LNJYPgMjRJskFcEG6?=
 =?iso-8859-1?Q?CoyF5glKcHG9mi7qjPNNECe4QyLCu1Cp+lLewhNEFYzj0uayvFFklFx68k?=
 =?iso-8859-1?Q?iydHGE8FzhGjtD9WLC3XLC4LzlsLfYsdT8kWwg9l+cazc6g7lfJS+jmM6Z?=
 =?iso-8859-1?Q?vKqQbt5hkRsjHMvh5qNW4EhvVtuTqZWsr8kS5EyK73mZLHBm/qAwdoiQKX?=
 =?iso-8859-1?Q?VklZkCZ54iKKMErtopByi8AOsyz27vjmPqE9eaMqgSE5kXKk/bg82+26qi?=
 =?iso-8859-1?Q?RpAwpdlHCfmVRNi7lX3e47o4Es2nRRLuiMzPAnaCaXkMjJ5wS0pguo6Mly?=
 =?iso-8859-1?Q?5oEjS+m7CkYbmtuHWXlCqr9Ucs1ZomhD03KboI9jNyVHlo09G93HEiutkF?=
 =?iso-8859-1?Q?IBRVJz+HseTXTzQeSOcIIJtZLc6fnAR7wgOZRcs/zei1wngXxoQ1cv1yEo?=
 =?iso-8859-1?Q?YlEDayIlNDeGn25nOF851dexly9xU733WE5T0oC1J/Jh9Kkid+VFPs2SHA?=
 =?iso-8859-1?Q?wtZPfUhEqZ1yUl7/EzQ8WpnRnBe/vRi7jaWrV8R9ivkSw2byDwJ+9/rNt3?=
 =?iso-8859-1?Q?KVd/kxJ7vsF4D9KzNEnA3hq8M07TRlVorWGzdvfS9J+6rBNPbR0KaSuGnu?=
 =?iso-8859-1?Q?v9cCg0JfBSmrXoc6bPP+eoginI+3msQR40S5Wppz5j/joq7QlD2L3A56xi?=
 =?iso-8859-1?Q?TJXN+mfxdaNJk7tBTxI/4qoY3BoK4dFwGPwYPokzb+NIwpVv4sJ2xOfEzs?=
 =?iso-8859-1?Q?N6z41pfeWDkJhp9u/rTg6yMONNmeONuvxVTpCfx+xxcKADz0Ud8qOPjDaw?=
 =?iso-8859-1?Q?g42Ig02MgdltWD/g61IewT42xOyyGbDCjgzdrxOn7bwBqQ5CkuYgrMaAKV?=
 =?iso-8859-1?Q?Bt1B4e1suc2pOHc86o3WwIaLyHdV0u8t7hJbLXU0/2EAc3z0VVJ2bKe/c3?=
 =?iso-8859-1?Q?zmiTGcew7VtdrPiZ/h9/q0b1l8YSzYg5COez3FNyJ5BX2fSIK7mEsJJM0j?=
 =?iso-8859-1?Q?wu9jyKArdexJLaHUiOXr3cZcL0gcvEcwrPEYHwWkw92vXQ4R7kWQH4QWQI?=
 =?iso-8859-1?Q?yjX0WjI0Aath9CCW79Kk3DGMwAwP7xzLpn/3ZUKEqtGVnIOse9L/33CemA?=
 =?iso-8859-1?Q?7zvxJpdF6z9sWAdpahAZygZbOP0Qc11MyVUgv94N7oTdMVGZczru50Ig?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4cec94-98f0-4cce-66fa-08dba8e66fe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:46.5786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PKDCx7Dw896ItdRlZvtWYxEDdZczHxxPDF2gWvudVyav0u1l0TRqFg/3FNzREVqMt7xXkahzFF9MMbja+h7BDIfzdqiXLhutmG8wIdU0x3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: rCJrE3s5XWWDEIfTuhdB4gLtIPBIRa8A
X-Proofpoint-GUID: rCJrE3s5XWWDEIfTuhdB4gLtIPBIRa8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are three  originators for the PCI configuration space access:
1. The domain that owns physical host bridge: MMIO handlers are
there so we can update vPCI register handlers with the values
written by the hardware domain, e.g. physical view of the registers
vs guest's view on the configuration space.
2. Guest access to the passed through PCI devices: we need to properly
map virtual bus topology to the physical one, e.g. pass the configuration
space access to the corresponding physical devices.
3. Emulated host PCI bridge access. It doesn't exist in the physical
topology, e.g. it can't be mapped to some physical host bridge.
So, all access to the host bridge itself needs to be trapped and
emulated.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v9:
- Commend about required lock replaced with ASSERT()
- Style fixes
- call to vpci_translate_virtual_device folded into vpci_sbdf_from_gpa
Since v8:
- locks moved out of vpci_translate_virtual_device()
Since v6:
- add pcidevs locking to vpci_translate_virtual_device
- update wrt to the new locking scheme
Since v5:
- add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPO=
RT
  case to simplify ifdefery
- add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
- reset output register on failed virtual SBDF translation
Since v4:
- indentation fixes
- constify struct domain
- updated commit message
- updates to the new locking scheme (pdev->vpci_lock)
Since v3:
- revisit locking
- move code to vpci.c
Since v2:
 - pass struct domain instead of struct vcpu
 - constify arguments where possible
 - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/arch/arm/vpci.c     | 51 ++++++++++++++++++++++++++++++++---------
 xen/drivers/vpci/vpci.c | 25 +++++++++++++++++++-
 xen/include/xen/vpci.h  | 10 ++++++++
 3 files changed, 74 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3bc4bb5508..58e2a20135 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -7,31 +7,55 @@
=20
 #include <asm/mmio.h>
=20
-static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
-                                     paddr_t gpa)
+static bool_t vpci_sbdf_from_gpa(struct domain *d,
+                                 const struct pci_host_bridge *bridge,
+                                 paddr_t gpa, pci_sbdf_t *sbdf)
 {
-    pci_sbdf_t sbdf;
+    ASSERT(sbdf);
=20
     if ( bridge )
     {
-        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
-        sbdf.seg =3D bridge->segment;
-        sbdf.bus +=3D bridge->cfg->busn_start;
+        sbdf->sbdf =3D VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
+        sbdf->seg =3D bridge->segment;
+        sbdf->bus +=3D bridge->cfg->busn_start;
     }
     else
-        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
-
-    return sbdf;
+    {
+        bool translated;
+
+        /*
+         * For the passed through devices we need to map their virtual SBD=
F
+         * to the physical PCI device being passed through.
+         */
+        sbdf->sbdf =3D VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
+        read_lock(&d->pci_lock);
+        translated =3D vpci_translate_virtual_device(d, sbdf);
+        read_unlock(&d->pci_lock);
+
+        if ( !translated )
+        {
+            return false;
+        }
+    }
+    return true;
 }
=20
 static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
                           register_t *r, void *p)
 {
     struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
=20
+    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
+
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
+    {
+        *r =3D ~0ul;
+        return 1;
+    }
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -48,7 +72,12 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *=
info,
                            register_t r, void *p)
 {
     struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
+
+    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
+
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
+        return 1;
=20
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index b284f95e05..b8df8e3265 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -82,6 +82,30 @@ static int add_virtual_device(struct pci_dev *pdev)
     return 0;
 }
=20
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbd=
f)
+{
+    const struct pci_dev *pdev;
+
+    ASSERT(!is_hardware_domain(d));
+    ASSERT(rw_is_locked(&d->pci_lock));
+
+    for_each_pdev ( d, pdev )
+    {
+        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf =3D=3D sbdf->sbdf)=
 )
+        {
+            /* Replace guest SBDF with the physical one. */
+            *sbdf =3D pdev->sbdf;
+            return true;
+        }
+    }
+
+    return false;
+}
+
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
=20
 void vpci_deassign_device(struct pci_dev *pdev)
@@ -181,7 +205,6 @@ int vpci_assign_device(struct pci_dev *pdev)
=20
     return rc;
 }
-
 #endif /* __XEN__ */
=20
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 58304523ab..e278fc8b69 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -281,6 +281,16 @@ static inline bool __must_check vpci_process_pending(s=
truct vcpu *v)
 }
 #endif
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbd=
f);
+#else
+static inline bool vpci_translate_virtual_device(const struct domain *d,
+                                                 pci_sbdf_t *sbdf)
+{
+    return false;
+}
+#endif
+
 #endif
=20
 /*
--=20
2.41.0

