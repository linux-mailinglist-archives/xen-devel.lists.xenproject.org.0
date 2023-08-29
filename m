Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F1178D052
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592513.925283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb809-0007qp-FM; Tue, 29 Aug 2023 23:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592513.925283; Tue, 29 Aug 2023 23:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb809-0007gi-5W; Tue, 29 Aug 2023 23:20:01 +0000
Received: by outflank-mailman (input) for mailman id 592513;
 Tue, 29 Aug 2023 23:19:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb806-0007EX-W5
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:19:59 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 903eb835-46c2-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 01:19:56 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TFMk9k021983; Tue, 29 Aug 2023 23:19:52 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ssdvpbm4f-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:51 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:45 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:45 +0000
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
X-Inumbo-ID: 903eb835-46c2-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdd2Kl8r5lBbeG35vSYlKDlTAIzK01RDH34HSfLYDBh6po2NQZsyrCqgF4IUtz9CRFedlTUA5TWWTPFW6jefCrAMgOZCbFS8xyupKIgUYUovB7T2GqgwVTQHFIAvteq845ONyst0FlVJtsNg/F89M7rvyyfuTU7dqhpTFLzW1Dcaakuh9k8seIquQ+ZnUfZQUlQ0Z0TBHXTpFkDFrEa7mSin5zf+Q7PoEYxGbFSZatIr24EB9803FnQWYaJX1Lc9ENFV6clDXB+d6vAIPsic7NS+kZY2z1vLxCoKlGGeuL8HvjAoWPJWv5KYu0vnAj3h7nPyTRd/YI+NdRb71+D6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ytiz30TI3pdTe8KMnSkIj6r0rNKRFbzYIExzPrIlfn8=;
 b=kUHirDJ+jsvrRb8dG/zfopIIbAcnkFPB5IdIvsfxmx0MNWsncwHLjLiWxgdQfcmBO3zdna34bpwPDVlXIOg9jrqTFr54oNY31jtwVquHErygdVrsX9yhZtdyjpvkQDgmVuh/BUf2uv2e9DU6Uf0QATkdNabh0tZ4CdNEzZKuRG9uYGCr8f8yP8qIzSNRtCKiIEcKf/AdnnDeZgxpBh9ZD6uEzKGs+lBBujNUBHY0/9KAvJCFzTWC9PL0/QDRP9v5D9n/A9+C+5fWfv+9pQay8bPOhRfZQ/JeG7CTvbxPZCXbaPZ36hnlNZT7xi7VnfHPlN/LaadLswh3VfJ1f940iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ytiz30TI3pdTe8KMnSkIj6r0rNKRFbzYIExzPrIlfn8=;
 b=RPqYCLQyYx3czkeI1ZYP9teZ2lgNnT4eJFIz/8yajiSxlrhRlFU/WoeToScpwQnkBuPG1NKzbgsjccRD+Ah1P3pfzqgezsKTThjaiHlmjLiqYTu87wBR2Lh/7Ov3L4lOaCo86D+2zPAlrchfJswuKAXbeyhrSF22IUc22XA4kcF3JY6UWTU5gf7TS/aWxto45PQg21KauwWw0IiP6r549eVvzuWUpg5exzgMZipESd1vC1Vdsi5GrTbx7ovxSYsCNOx8CzQQI82VesRQmYmi0qSEWuN58RDJZUwByhmL8Ji1vMMYRVST+6fFQrVCn3aJHFwV9dCzrm4pvPueuvKX9A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v9 06/16] vpci/header: implement guest BAR register handlers
Thread-Topic: [PATCH v9 06/16] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHZ2s9L0mQJgo9Th0GLfB+1u63ugw==
Date: Tue, 29 Aug 2023 23:19:43 +0000
Message-ID: <20230829231912.4091958-7-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: f2790ca2-6735-4168-ce1d-08dba8e66e5f
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YA0UtcvrDnRq4h2UOHet3TTD5Xbn4+94++jrRIIwrNc1hQvpzSzDRSqVUrNTE4FoXJPROikm+pG7JPmD49vWj0a+y0RmGTn793zJYOEoBGJSIb+4KH7rkHvT7cBYfYIiwfhopXyU1b6w/sMAXHNtARmc6LuvTP2beQiBogdU/Y0FYesAPxt5GNSxHX5RMWork33ggpv4ZlkqYKB9aUxHsJwxIhpQGQ94+09D0IN0HhhrqiFArvur/ntfaF3WaBKEGDkMaAbeKiI0nxRp5+Mqak12g+7qFzpe9QewevJuCTubAmAgSAwp9UGpPz7PkGlT227qGMjHSf2QX8rJYCukNkhlZxsEQtu2YP0GCUN2sG1YfV6Bk0G3ROYTYMt1Fz9qefmijDV1ijHqOjTE4v/DwDrCr67lwtfQ8QgCDvWj1GESdHLrudTISSDlP/2P+qYnk4bHx+9IHPUzy9S75TF9i8hZ8ITNoln3ZS8dU5s8NgU6A9r104zd7Om5Bo/mVncZXmyjczZEsHJ8PXSekMWb3d0UPQMhQBFnw/WKr3kjrV2W1mL3bvLPnxdNekghNE/eSJUr+s2H2TF8SSDOyGdoy0QDJ2ycQ51LKhdAZTkblf9Hjv+DF8F1xt0hpfQbRT24
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(26005)(2906002)(6916009)(64756008)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?7Ys3b/N92/oWj818Bl5/Q5aOnrVpenxyAnI/rddun9vIqvUzs9EM6sRWJ5?=
 =?iso-8859-1?Q?Nfm8yKyGPdeVR5Js5gXCvd/48Tcp3Tmr8PdfLQheeuKuFpfG4dVt/4mRgX?=
 =?iso-8859-1?Q?umFhgkNl3OAC/XSW461VUx2XCM9o/1xnCde1W9fNK4+o8G7ucV23H7tSec?=
 =?iso-8859-1?Q?18xDYcP3wh+fsnZKI3zg2XTE7yd6V10EgJjBPmOwVSY5XMlWZ5UOOySZTI?=
 =?iso-8859-1?Q?JBTszOTJ5EvK1CsIUBTeVKFEe4qdkErgjFGNeWeXthl0CFFmwlNoKQI+GG?=
 =?iso-8859-1?Q?h4ovHA5/YQUeHxOuK0v06u9B/WE4ccbeOJt/YEHzISkzlI5gMMlIag1RR+?=
 =?iso-8859-1?Q?AkEUEZxoeY8kGdxNoZVf71kVPb/m2/kHs0b5Ptcr8cbVJRzNlYMaOx25Yr?=
 =?iso-8859-1?Q?LuBaA8hm63Y00R3+x2eYOVlV45M3kbMELV5bfy58a0NNtY8/+d5JK1QAn0?=
 =?iso-8859-1?Q?V1WaJb3CROqpYIQG+lgXgI2r3xl52QOJlU4SX0cu+T5VKxXMU6jYQQcuEI?=
 =?iso-8859-1?Q?cZju4Y5lDo5Zipsz3srZzoY+Wlv1vXkoaohz05Hfm6Dnbj+2ao5Kq/mNl8?=
 =?iso-8859-1?Q?5H5raWt/B5FNlAJJrGwa/WK4hYrTOCxmEGwyNLGqyKeQ9ocxVO5EaHUIHl?=
 =?iso-8859-1?Q?UuM/2sgnesyfu6YuC7StjpL4i9ySVMNFj9q6zT/BMsDUQYX7rco1EI7ql5?=
 =?iso-8859-1?Q?yBRxYeylDSl4v24Wxg07GOLWTNL0aT7DoSQCfbNoKAz4bAHDEIQsE9iO4x?=
 =?iso-8859-1?Q?7r8RuEhB7u/W57XN6XeIYgG/ph4J85F4cRG75x/UXgDZACu37VSDHG3xjD?=
 =?iso-8859-1?Q?D2OMKPJlru3WBf5VOwLYOXo+bPDieFOHGWzh6dIzwZ8uV71tLPT/AIc84i?=
 =?iso-8859-1?Q?VQGOta383n/adYFqykNrMH7M8fWFqjEO34sYTW2WBV4HD5ZXNmPbUYHwQX?=
 =?iso-8859-1?Q?7j9q0vm+Owi3N8n5M+YAd09OsQeyzJ8UWJBFC9dA/AC7YHjNp6qm5NK/74?=
 =?iso-8859-1?Q?5Xu0OQWZqh+lNUmRTD8YI0a/184b0TSyk8haeYc6HutTT5hTvQiWPebJXz?=
 =?iso-8859-1?Q?cvdeo0YQgVmFkXqSp1AjKaIZa9L4iXbZDoC8KMLFn0KZpG76wqKEYxuM0k?=
 =?iso-8859-1?Q?BOXdXPMeuQaCBFWOXQMHQOtyaYOMpw+IGxLoYT10A1XYdviaBxHKmIUm5j?=
 =?iso-8859-1?Q?FBjcDvo6K1ecjrw37mQhVRJAPIV2jkJYGPa7wUjTPd7sjzYkxJL82X6P/x?=
 =?iso-8859-1?Q?PkHXinj6u/jZ67kCNnaBQbxOqCivLt3Hv1P1ErIvcehRPSDH4mnv2jtTi6?=
 =?iso-8859-1?Q?ob37sX5UcnJzN2PVPxydYQlgcz3LLEjCsrVditTVa45Q6NG6eR1aVr7seF?=
 =?iso-8859-1?Q?cIcDqHG/sP/PL1/9zS0iWO0jOq6jSxbZ7ex0+zD/YR5J1bxDwA76XE891T?=
 =?iso-8859-1?Q?1Ks3J/DF91a9c2O4BwzBR+MQNEyEiAC7VDSABkFNDGSAId35mhMklzklra?=
 =?iso-8859-1?Q?DTZZHFw/iDukYlJu9RTtHvBOxZuSOyBTgFsyIoG7ExD8H/a/36Pf6QdZ37?=
 =?iso-8859-1?Q?14Kg//fWp4Yz2bJmjoh9e5UESRvMYC6CQadnkjexZ0uB5hc74v0alpIT17?=
 =?iso-8859-1?Q?udkHoBxOrOsVQ81GJ1nbDqC5uPO76eXV48uPWcX0t8gKJiwhQey3W/zA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2790ca2-6735-4168-ce1d-08dba8e66e5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:43.7178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qz6DX931uvrXlGo6wN6xfhm6UH2s3W0ecozu8XFcggKLh03+4pqASHQCW9SUhn/ehChurxwekuvW4n5H3rAH/ghGL0/pVClPkW0QyJS/PfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: vc7BuCmWsMSMmfFadpYjsbGBBk9Eq77M
X-Proofpoint-GUID: vc7BuCmWsMSMmfFadpYjsbGBBk9Eq77M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add relevant vpci register handlers when assigning PCI device to a domain
and remove those when de-assigning. This allows having different
handlers for different domains, e.g. hwdom and other guests.

Emulate guest BAR register values: this allows creating a guest view
of the registers and emulates size and properties probe as it is done
during PCI device enumeration by the guest.

All empty, IO and ROM BARs for guests are emulated by returning 0 on
reads and ignoring writes: this BARs are special with this respect as
their lower bits have special meaning, so returning default ~0 on read
may confuse guest OS.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v9:
- factored-out "fail" label introduction in init_bars()
- replaced #ifdef CONFIG_X86 with IS_ENABLED()
- do not pass bars[i] to empty_bar_read() handler
- store guest's BAR address instead of guests BAR register view
Since v6:
- unify the writing of the PCI_COMMAND register on the
  error path into a label
- do not introduce bar_ignore_access helper and open code
- s/guest_bar_ignore_read/empty_bar_read
- update error message in guest_bar_write
- only setup empty_bar_read for IO if !x86
Since v5:
- make sure that the guest set address has the same page offset
  as the physical address on the host
- remove guest_rom_{read|write} as those just implement the default
  behaviour of the registers not being handled
- adjusted comment for struct vpci.addr field
- add guest handlers for BARs which are not handled and will otherwise
  return ~0 on read and ignore writes. The BARs are special with this
  respect as their lower bits have special meaning, so returning ~0
  doesn't seem to be right
Since v4:
- updated commit message
- s/guest_addr/guest_reg
Since v3:
- squashed two patches: dynamic add/remove handlers and guest BAR
  handler implementation
- fix guest BAR read of the high part of a 64bit BAR (Roger)
- add error handling to vpci_assign_device
- s/dom%pd/%pd
- blank line before return
Since v2:
- remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
  has been eliminated from being built on x86
Since v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - simplify some code3. simplify
 - use gdprintk + error code instead of gprintk
 - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
   so these do not get compiled for x86
 - removed unneeded is_system_domain check
 - re-work guest read/write to be much simpler and do more work on write
   than read which is expected to be called more frequently
 - removed one too obvious comment
---
 xen/drivers/vpci/header.c | 131 +++++++++++++++++++++++++++++++++-----
 xen/include/xen/vpci.h    |   3 +
 2 files changed, 118 insertions(+), 16 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index e58bbdf68d..e96d7b2b37 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -477,6 +477,72 @@ static void cf_check bar_write(
     pci_conf_write32(pdev->sbdf, reg, val);
 }
=20
+static void cf_check guest_bar_write(const struct pci_dev *pdev,
+                                     unsigned int reg, uint32_t val, void =
*data)
+{
+    struct vpci_bar *bar =3D data;
+    bool hi =3D false;
+    uint64_t guest_addr =3D bar->guest_addr;
+
+    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        hi =3D true;
+    }
+    else
+    {
+        val &=3D PCI_BASE_ADDRESS_MEM_MASK;
+    }
+
+    guest_addr &=3D ~(0xffffffffull << (hi ? 32 : 0));
+    guest_addr |=3D (uint64_t)val << (hi ? 32 : 0);
+
+    guest_addr &=3D ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
+
+    /*
+     * Make sure that the guest set address has the same page offset
+     * as the physical address on the host or otherwise things won't work =
as
+     * expected.
+     */
+    if ( (guest_addr & (~PAGE_MASK)) !=3D (bar->addr & ~PAGE_MASK) )
+    {
+        gprintk(XENLOG_WARNING,
+                "%pp: ignored BAR %zu write attempting to change page offs=
et\n",
+                &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
+        return;
+    }
+
+    bar->guest_addr =3D guest_addr;
+}
+
+static uint32_t cf_check guest_bar_read(const struct pci_dev *pdev,
+                                        unsigned int reg, void *data)
+{
+    const struct vpci_bar *bar =3D data;
+    uint32_t reg_val;
+
+    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        return bar->guest_addr >> 32;
+    }
+
+    reg_val =3D bar->guest_addr;
+    reg_val |=3D bar->type =3D=3D VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TY=
PE_32 :
+                                             PCI_BASE_ADDRESS_MEM_TYPE_64;
+    reg_val |=3D bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
+
+    return reg_val;
+}
+
+static uint32_t cf_check empty_bar_read(const struct pci_dev *pdev,
+                                        unsigned int reg, void *data)
+{
+    return 0;
+}
+
 static void cf_check rom_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data=
)
 {
@@ -537,6 +603,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
     struct vpci_header *header =3D &pdev->vpci->header;
     struct vpci_bar *bars =3D header->bars;
     int rc;
+    bool is_hwdom =3D is_hardware_domain(pdev->domain);
=20
     ASSERT(rw_is_locked(&pdev->domain->pci_lock));
=20
@@ -578,8 +645,10 @@ static int cf_check init_bars(struct pci_dev *pdev)
         if ( i && bars[i - 1].type =3D=3D VPCI_BAR_MEM64_LO )
         {
             bars[i].type =3D VPCI_BAR_MEM64_HI;
-            rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write=
, reg,
-                                   4, &bars[i]);
+            rc =3D vpci_add_register(pdev->vpci,
+                                   is_hwdom ? vpci_hw_read32 : guest_bar_r=
ead,
+                                   is_hwdom ? bar_write : guest_bar_write,
+                                   reg, 4, &bars[i]);
             if ( rc )
                 goto fail;
             continue;
@@ -589,6 +658,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
         if ( (val & PCI_BASE_ADDRESS_SPACE) =3D=3D PCI_BASE_ADDRESS_SPACE_=
IO )
         {
             bars[i].type =3D VPCI_BAR_IO;
+
+            if ( !IS_ENABLED(CONFIG_X86) && !is_hwdom )
+            {
+                rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                       reg, 4, NULL);
+                if ( rc )
+                    goto fail;
+            }
+
             continue;
         }
         if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) =3D=3D
@@ -605,6 +683,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
         if ( size =3D=3D 0 )
         {
             bars[i].type =3D VPCI_BAR_EMPTY;
+
+            if ( !is_hwdom )
+            {
+                rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                       reg, 4, NULL);
+                if ( rc )
+                    goto fail;
+            }
+
             continue;
         }
=20
@@ -612,28 +699,40 @@ static int cf_check init_bars(struct pci_dev *pdev)
         bars[i].size =3D size;
         bars[i].prefetchable =3D val & PCI_BASE_ADDRESS_MEM_PREFETCH;
=20
-        rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, re=
g, 4,
-                               &bars[i]);
+        rc =3D vpci_add_register(pdev->vpci,
+                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
+                               is_hwdom ? bar_write : guest_bar_write,
+                               reg, 4, &bars[i]);
         if ( rc )
             goto fail;
     }
=20
-    /* Check expansion ROM. */
-    rc =3D pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM=
);
-    if ( rc > 0 && size )
+    /* TODO: Check expansion ROM, we do not handle ROM for guests for now.=
 */
+    if ( is_hwdom )
     {
-        struct vpci_bar *rom =3D &header->bars[num_bars];
+        rc =3D pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR=
_ROM);
+        if ( rc > 0 && size )
+        {
+            struct vpci_bar *rom =3D &header->bars[num_bars];
=20
-        rom->type =3D VPCI_BAR_ROM;
-        rom->size =3D size;
-        rom->addr =3D addr;
-        header->rom_enabled =3D pci_conf_read32(pdev->sbdf, rom_reg) &
-                              PCI_ROM_ADDRESS_ENABLE;
+            rom->type =3D VPCI_BAR_ROM;
+            rom->size =3D size;
+            rom->addr =3D addr;
+            header->rom_enabled =3D pci_conf_read32(pdev->sbdf, rom_reg) &
+                                  PCI_ROM_ADDRESS_ENABLE;
=20
-        rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, ro=
m_reg,
-                               4, rom);
+            rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write=
,
+                                   rom_reg, 4, rom);
+            if ( rc )
+                rom->type =3D VPCI_BAR_EMPTY;
+        }
+    }
+    else
+    {
+        rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                               rom_reg, 4, NULL);
         if ( rc )
-            rom->type =3D VPCI_BAR_EMPTY;
+            goto fail;
     }
=20
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 2a0ae34500..89f1e27f4f 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -67,7 +67,10 @@ struct vpci {
     struct vpci_header {
         /* Information about the PCI BARs of this device. */
         struct vpci_bar {
+            /* Physical (host) address. */
             uint64_t addr;
+            /* Guest address. */
+            uint64_t guest_addr;
             uint64_t size;
             enum {
                 VPCI_BAR_EMPTY,
--=20
2.41.0

