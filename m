Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C41E75A372
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566259.884882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb6-0002WV-AC; Thu, 20 Jul 2023 00:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566259.884882; Thu, 20 Jul 2023 00:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb5-0002Nt-UG; Thu, 20 Jul 2023 00:32:47 +0000
Received: by outflank-mailman (input) for mailman id 566259;
 Thu, 20 Jul 2023 00:32:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMHb2-0001JI-10
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:32:44 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f01d57f2-2694-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 02:32:43 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JJCjt1031890
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:41 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rxgcw1sme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:41 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7783.eurprd03.prod.outlook.com (2603:10a6:20b:407::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 00:32:33 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6588.035; Thu, 20 Jul 2023
 00:32:33 +0000
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
X-Inumbo-ID: f01d57f2-2694-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXJRK6rwzW5HMe0sgsb43DAcB33at01X+Mr9WQROcdlhjpnDWjCXP9rmSLP9IfKPQxmP8gbU+g4OwmpUrgfXPnOewx/YS5qc6kHlNOE6cviAR/RTNAK3+Fxj5RUDw4j5u4yt+gKoDN6eHCp4EJGenWFP0TAYswajCnU7t/heLY1aXuMP8DO/Rl2FCT04c6+Tr6TNBpsCmZD1lmHzBuCM8ayQoByIajPXiwJAaHTEyR8CPqSbH5sTRrhV+wR1EmBcRWWypGslwahaprGUcnOExUGmPLzOEDf3ckQegFUrHtDy3OXLG2Jnhf7T1qMSI06pjLmMs4QRCpYb18oMd2JEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MizkqGgd+iTF6D6kSkQzhVLSHfvXaFyO/O67Z15pDNc=;
 b=noR6Odkjrb8yHjw59rTKh3q9h3eJIPW5H99jRtID8J/VsPt/SJ1/2F9l93B9gyd0KHi+cL8YQULWCXGLpuPIohNEb8K20HKr0+C3WAkHlyGU81D/so6oFVxqeTk5MtRgo201FeQKmjwOpeA0rtzXa6mS1pCbA7gm/Bd5Wllj+akDGkqCv23HHGa2u4ZPnUMmDT3nRm7PvHN4hCklPvQB4gSkriOBNJEXTX7pmHypmJnxNPlQU80fcYu2xJpsGwNdH7fxp8iX2z2Zv0A0fxSSGCaG/BscYu8GaK0AVNj2MuG88omCTxyKwStbIOEtzWV+OMZQ/6C6onX6XSd/kfYx9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MizkqGgd+iTF6D6kSkQzhVLSHfvXaFyO/O67Z15pDNc=;
 b=T+8RkjQGZ8TlgG3f0HqxwkRRnsDXAageIIj5iOjPe1JJFwhGvLNyJ5Cd5C4NdSqp6XtXzXBbxP5aOHOOxyMgFRSKfLTqHxsc04r2ALCfyxDZwudCezltZKZAcW8F3QkSSof7r3vnogI/jYmj+ncIALs3L2mW8ObNLeRoxQs5yfruoFG68oAapF8cB3XUmHREQvD7xDJksmwVVX8MZ0xnT9mttjlHwWp/VXMwixmKVjlaDztisd7TW7oH/sUKX+p0NbIHEhsIPG4r82J0Wqv814WBzMQR+if1VfzKbKabO+RRLA1ba+2aF5dzEn6xY+4UEtk/EoUZmbShctlwXlfu1Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: [PATCH v8 04/13] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v8 04/13] vpci: add hooks for PCI device assign/de-assign
Thread-Index: AQHZuqGrBGIo4QxjlkuKy7Wb3D/bwQ==
Date: Thu, 20 Jul 2023 00:32:31 +0000
Message-ID: <20230720003205.1828537-5-volodymyr_babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7783:EE_
x-ms-office365-filtering-correlation-id: 80f4905c-4e6b-424e-0264-08db88b8cefb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CbkOUNSSwFztXpVcFoBsryppOmW6mMhJUjydlAhR2KvG51i2nh8KYn999frhttOQD33AXPUEG2IGMKDhTLRg4hlJPWB853VC6IZB0yVK5b/G9xMHouKFFnZGwH3ZiJ57jYik1peZTnNB+vEYNXUnHkm4EPHIzzzZYSy31OwLxOmFIrA2Y+LUxNOlNj2sgo6BDsr5pNRtv6flHE3NUzYXqjLrOChVv8T0XyrMuYeOGh2Nn3b3XOdQXnfG2+6A68kYEeOVy+oq/K++Os8K9OTHrUIELBlXZATTg8RCeFrBGDbbW7t+3HvugoAGzmUHLNlP088kTEPJvYFVNwj6ameLI12Kax6CO9KnZD8ZEtZOW4bPM7xylGrCDdeOyZSngiMCnAfETJJ6ZhKUhSD+E3zF/soVZEabCS73UqJDJ5MSYuAKBIGhQ6+XgbGLtk/h/Mus3CiW3q25N9GBIiQNVK98q0k7IdfjOeRwyVqgtKyV84xgaQPUPHPf/p0DByFlMDUa9I1LDiS46DYFgxEk3HraVr8zF0+T9jKlO+G6VNxt+xK1T1FBGXOzAhA4C71vKIUF6Gx8PyaIMyOPu4XoCwTooeSAM6+IMZ/4rYoU29Z6SFDbJW0D+hI5r0KdhMk8mDGE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(55236004)(26005)(1076003)(6506007)(41300700001)(316002)(83380400001)(2616005)(107886003)(186003)(6512007)(6486002)(122000001)(478600001)(66946007)(71200400001)(4326008)(64756008)(38070700005)(66556008)(76116006)(66476007)(91956017)(6916009)(38100700002)(86362001)(5660300002)(66446008)(8936002)(8676002)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?FnsETNGgYgV3EtAqO7rg0TLK184/cbwvgu+zIkBnJkdAqZXCNPANihWeXS?=
 =?iso-8859-1?Q?as/PqVY3aHBGOJhRESpwL6a2AZT7EocJ7SphHI+IyaypUwX4CLJKdwC7EP?=
 =?iso-8859-1?Q?TAofAJmicrrlzRm1cJGeAS+O+Kd/da5hgB5lB0KLklEmOIniklS1VULM/M?=
 =?iso-8859-1?Q?F1CSNsYMNUekyWHmQScZMsDn5U8L0ykFiLYsoayBO+F8ZcdPtIaQ8CsxPe?=
 =?iso-8859-1?Q?Zcaab95EV8CVxmtH2fHXA6KDNRCpQRwEI5JvTgKmQBRL5ZM5P9q4MLg361?=
 =?iso-8859-1?Q?DStrxf7eumf0CPtKdzQNYbVzd8Oa2W00KlVPssMcsaIRuU6GtAFvWApCH2?=
 =?iso-8859-1?Q?K9O1EQEchcTr7zm+Rtt/sX2su2bs+G+33CTw/GeWBTOjX/4oP7I22QHkLH?=
 =?iso-8859-1?Q?KBi4sY9pbGEUwCVaFG+AW1Gdo4uSpaFQLtqFitKfDYKQi+9LgyB/kgVfml?=
 =?iso-8859-1?Q?VT6XwC1SXjjBVDh5m96A71Yk32P9m6pla91zoFy+KL6s4PGMFr3EI1td45?=
 =?iso-8859-1?Q?fEQs4T6UsN4bAHCYisGyv5KbQniRKpcw0Gm61epAYLCknmA3ov3Cq140fe?=
 =?iso-8859-1?Q?IFW7FX14sFnXvjyKXHZyaccER1Q4tTOygqEcIfHwKkbwvEYcyeMaUy18ib?=
 =?iso-8859-1?Q?MsVFSEcQXzClslsI3X6ExZKG4JRU3z0cejKSnd6PtCnK03gn3yFquofHfk?=
 =?iso-8859-1?Q?0oHLZ3vrTNbQMLaqj+UDpd5GqhhddzUVKzntyxEomfWka+jWTjw+iYYqe3?=
 =?iso-8859-1?Q?+ALeCpXOS9WoZioEtpoMmq+c3IHzxCp60bWsazM84cSFp0iSZiIODqhoqu?=
 =?iso-8859-1?Q?qc9pLaYtpXWmKNcqj1JH/kSAVVyx0g7vPLaXsH2ovIIuvkk4V+Ter8VHHR?=
 =?iso-8859-1?Q?fFJ4YA3Y8jzwAuMTS4kXqb8Y0SGdb6yUZ617oJxpLYOlfjM7n7cCa/oURI?=
 =?iso-8859-1?Q?1EkUOSuFfKynxXOLENnSuCY+L5pKwckuBJP5rlF3JKWTnR9Syu0L+6E/i4?=
 =?iso-8859-1?Q?MIg8sgWzaJQRo3M9ywDiIsRYQ6Or1PGVXAH/B9UHymBjoea9+MvHkT3KrD?=
 =?iso-8859-1?Q?iAOFLkzviWiJVsabk54vEHf45/hpZOcFRp1DoXCJrJO39xymIadmMi156t?=
 =?iso-8859-1?Q?lg27xFr929XdrE3bVVwzMxAHMXbTMr9AXz3XMm5y0pjQsk5RQ1GlnjC6ti?=
 =?iso-8859-1?Q?609JY54HMuhSl/FBY8Z1IMQoTvGSwg8WaHf6OqO9gH0J6o7RlimDFFmw3e?=
 =?iso-8859-1?Q?xq6NyftmcFlFIRDyvYG2CgnBDu+TT0+thxN9ZKt/VwnoE7emY4IuzL9zcq?=
 =?iso-8859-1?Q?bxItBJU17tLGs6yIEacA7/GHXg70tmnwrw7rDhSjqk9OlH/mxB25eC4EMi?=
 =?iso-8859-1?Q?5aekpfUf8w9RgNKBTrln1g/YvLEhZe7NSvDrgWzokbOiumt2CeASBPxrLE?=
 =?iso-8859-1?Q?8DMkVkONhCrTTP4CNBWqtUKPvt2qtp/GUpVdlIiQb+DjhyPH7UTHEunQ6e?=
 =?iso-8859-1?Q?oLoHh3/FGDPeRlwIike6lmbr83Rx+wfVsOzcyCTeuGon77Mu3eDk0WMbXE?=
 =?iso-8859-1?Q?TypX6UhaxJSwRpBqa9/nS/Qt7Uo2fR7jtNrSc6yf1rgVG0N0MxUcCcchUH?=
 =?iso-8859-1?Q?kaZUfPUDvly1dakUlITVf+JAVjIVnbWXs6F+Pla6itCj5F9uskikocVQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f4905c-4e6b-424e-0264-08db88b8cefb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:32:32.0060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PW7Av36w37QxXiylXQkqnmXRHwqPHay44pjY8rUnvXiAWKZtbuKkTEsOC9cNqc170y+GKtcwosZND05F2FT3c2Od02Lkf8u5wBeNYzi81mM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7783
X-Proofpoint-ORIG-GUID: yiqGwBQ8nkusslf8AHeYd76_d-OHqROd
X-Proofpoint-GUID: yiqGwBQ8nkusslf8AHeYd76_d-OHqROd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200002

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a PCI device gets assigned/de-assigned some work on vPCI side needs
to be done for that device. Introduce a pair of hooks so vPCI can handle
that.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v8:
- removed vpci_deassign_device
Since v6:
- do not pass struct domain to vpci_{assign|deassign}_device as
  pdev->domain can be used
- do not leave the device assigned (pdev->domain =3D=3D new domain) in case
  vpci_assign_device fails: try to de-assign and if this also fails, then
  crash the domain
Since v5:
- do not split code into run_vpci_init
- do not check for is_system_domain in vpci_{de}assign_device
- do not use vpci_remove_device_handlers_locked and re-allocate
  pdev->vpci completely
- make vpci_deassign_device void
Since v4:
 - de-assign vPCI from the previous domain on device assignment
 - do not remove handlers in vpci_assign_device as those must not
   exist at that point
Since v3:
 - remove toolstack roll-back description from the commit message
   as error are to be handled with proper cleanup in Xen itself
 - remove __must_check
 - remove redundant rc check while assigning devices
 - fix redundant CONFIG_HAS_VPCI check for CONFIG_HAS_VPCI_GUEST_SUPPORT
 - use REGISTER_VPCI_INIT machinery to run required steps on device
   init/assign: add run_vpci_init helper
Since v2:
- define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
  for x86
Since v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - extended the commit message
---
 xen/drivers/Kconfig           |  4 ++++
 xen/drivers/passthrough/pci.c | 21 +++++++++++++++++++++
 xen/drivers/vpci/vpci.c       | 18 ++++++++++++++++++
 xen/include/xen/vpci.h        | 15 +++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index db94393f47..780490cf8e 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
 config HAS_VPCI
 	bool
=20
+config HAS_VPCI_GUEST_SUPPORT
+	bool
+	depends on HAS_VPCI
+
 endmenu
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 6f8692cd9c..265d359704 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -885,6 +885,10 @@ static int deassign_device(struct domain *d, uint16_t =
seg, uint8_t bus,
     if ( ret )
         goto out;
=20
+    write_lock(&pdev->domain->pci_lock);
+    vpci_deassign_device(pdev);
+    write_unlock(&pdev->domain->pci_lock);
+
     if ( pdev->domain =3D=3D hardware_domain  )
         pdev->quarantine =3D false;
=20
@@ -1484,6 +1488,10 @@ static int assign_device(struct domain *d, u16 seg, =
u8 bus, u8 devfn, u32 flag)
     if ( pdev->broken && d !=3D hardware_domain && d !=3D dom_io )
         goto done;
=20
+    write_lock(&pdev->domain->pci_lock);
+    vpci_deassign_device(pdev);
+    write_unlock(&pdev->domain->pci_lock);
+
     rc =3D pdev_msix_assign(d, pdev);
     if ( rc )
         goto done;
@@ -1509,6 +1517,19 @@ static int assign_device(struct domain *d, u16 seg, =
u8 bus, u8 devfn, u32 flag)
         rc =3D iommu_call(hd->platform_ops, assign_device, d, devfn,
                         pci_to_dev(pdev), flag);
     }
+    if ( rc )
+        goto done;
+
+    devfn =3D pdev->devfn;
+    write_lock(&pdev->domain->pci_lock);
+    rc =3D vpci_assign_device(pdev);
+    write_unlock(&pdev->domain->pci_lock);
+    if ( rc && deassign_device(d, seg, bus, devfn) )
+    {
+        printk(XENLOG_ERR "%pd: %pp was left partially assigned\n",
+               d, &PCI_SBDF(seg, bus, devfn));
+        domain_crash(d);
+    }
=20
  done:
     if ( rc )
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index a6d2cf8660..a97710a806 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -107,6 +107,24 @@ int vpci_add_handlers(struct pci_dev *pdev)
=20
     return rc;
 }
+
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+/* Notify vPCI that device is assigned to guest. */
+int vpci_assign_device(struct pci_dev *pdev)
+{
+    int rc;
+
+    if ( !has_vpci(pdev->domain) )
+        return 0;
+
+    rc =3D vpci_add_handlers(pdev);
+    if ( rc )
+        vpci_deassign_device(pdev);
+
+    return rc;
+}
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 #endif /* __XEN__ */
=20
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 0b8a2a3c74..44296623e1 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -264,6 +264,21 @@ static inline bool __must_check vpci_process_pending(s=
truct vcpu *v)
 }
 #endif
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+/* Notify vPCI that device is assigned/de-assigned to/from guest. */
+int vpci_assign_device(struct pci_dev *pdev);
+#define vpci_deassign_device vpci_remove_device
+#else
+static inline int vpci_assign_device(struct pci_dev *pdev)
+{
+    return 0;
+};
+
+static inline void vpci_deassign_device(struct pci_dev *pdev)
+{
+};
+#endif
+
 #endif
=20
 /*
--=20
2.41.0

