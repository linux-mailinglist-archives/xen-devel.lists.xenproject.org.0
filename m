Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D91E801980
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645843.1008376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9En8-00067R-Kc; Sat, 02 Dec 2023 01:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645843.1008376; Sat, 02 Dec 2023 01:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9En8-0005t8-6g; Sat, 02 Dec 2023 01:27:34 +0000
Received: by outflank-mailman (input) for mailman id 645843;
 Sat, 02 Dec 2023 01:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9En3-000271-C4
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:29 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3c1fae9-90b1-11ee-9b0f-b553b5be7939;
 Sat, 02 Dec 2023 02:27:27 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B20exWd004068; Sat, 2 Dec 2023 01:27:16 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2040.outbound.protection.outlook.com [104.47.11.40])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uqt8mg1hm-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:15 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:10 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:10 +0000
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
X-Inumbo-ID: f3c1fae9-90b1-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gcz2fapa26LFQAmG1I8hVtDYK9jALeWrZB4DOZdt0BzwvqgvCrF8Olrnm/zYHQJYdQavkfEKsjUl8nD69BlsGUmoRpz6fPaU8zJbI4LENuIxaQw2Y5FauB4qrDIN6+YAIK2rC3K255dwKplyuwO7DADfST4HjfrlOAsiAHKIWPIx3UW/y+SpkEJRajVshOAclC3uqNZ9XMhbZXaHdy7srIisr4EsTSpOsi1mYT7uBpvJMr4cluX8/3SZHfuUZTYuJeRUKXEleUs5uOwZGvCQEFTT2R52Vo4cL3RB40Bdi+mCmah3sz6iJEZniLfRVczHIx+I5L46JL8b21KObiLcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbQ7MUIQ2IkedJNUm+tfwIF8ti84wzB5RJbUQkThnyY=;
 b=ZOaHy6KqIy72HdGYkLM32Ielp1BvC4Tsm75c6fEywoLdFK+NRPTQUORF80D9Fo8aQoaNQvnOneKI7+Fa/wJnvST/UwY9T3CXObSI9qkPfMnklyCAd2Fk7INwYRCUVmTvr9n9/KNfI8VBCcfPB8gDk0S5QaJ+o71aBUbowbovUdLBz8V6w8hP+lm8OIXysqzfbPwO2FgqiEeXdiyHokoN5MfyIC4gB9hP3uqbcMCf0OZpP/muKaftGESsPFupathe3EMFOXvg7bJxCvrtQoH8dmrtaFQxqPBkLkp8McXFV7sOmdrx6TfrEQJ1dDrSjfO83xvsvGWBoIjH6ai/MBPg+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbQ7MUIQ2IkedJNUm+tfwIF8ti84wzB5RJbUQkThnyY=;
 b=dVVclVNkDLNX0e+t0qzaDqyjPucNs51ccJWSxjvYg9EQDB+XZMTNc+GfPiKNyD9hzzZc14CReKXHxXFQ86vYj+j4wWWWviV3tfTUdG/7Soif2aDp99wFtPTWAVIT0o7IjNjbeRpt19v30Kqukz0HpQ1BQuxSlaj3na47W3sKi3jZjY+Iowl969AZQT9zccpd9v6dDww2Jkl37DR8P19/Zb/p2uDF2IsBDe2dQkfo0kVHCUFqaCKZzo/It4ZAfY8uApjgcIYfV92o23CR0mA3mfZ/8rrUbDa+9gRui71EaibxzV5XZkVgyvz5fHIeb2YewOoMPwFeRG84Z+opv657uw==
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
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 14/17] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v11 14/17] xen/arm: translate virtual PCI bus topology
 for guests
Thread-Index: AQHaJL6pGDTUzUqjcE21xonM3gZpjA==
Date: Sat, 2 Dec 2023 01:27:06 +0000
Message-ID: <20231202012556.2012281-15-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: 1b72d35d-ceaf-452c-688b-08dbf2d5ce5b
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BhuAiKPS14c6DzpW49cSHpSn4xRJopWjveOMY2wYYQpBy/o+AL/sVgoiE/5U2Ii90JDQyG7KyBfOcAZrMSkU2IIRPOm8yFalVv1JXU421cBpoi7OAPIaCgPiLDutPbQDo4Dmot7UT0EBEYTP0MEfdMT+0tvkrbrrM1OZ36zPsBSSshvEpkVHPNk19aYjg3zaAGxGBSwiDAYZNAedf3SA8m9CsU3PCY1QAI7e6knB6A+LFLMLUvoNkyiisZKoUC4TmX0zyrabVUqDnT3ZX1PKUZa4qNecPMoJVyLN/XJJU2tXuEmt9JijJq8u5EpoOGQwJdiLaYOqgHdgkmOlFtlFB3W43fw1bQFHTWCjP/dnOlDK2iDVkAEOQtcJ7GZAJBHC3siwr/Da43Cx0EUg4t+bkr7ZrHg+VhsHOqayryidOrBOjlQrpxM46ptM36p3o/0tAD1+CfIU8+E/iCL/Lm1BKyhbHfAMRumhJSe6K89ob/3QmsQS4pOpCYgY8Bf9wH8uMn+uhO64shFUTcQtLfkqg7ceSSzROjQ2gdD5U8DFxS6A7zw5Wh9x92DSfbs2hCCG+M3GGj4V12dL/OASQ2xyaV9ZdD6XG5P+uvOXTJJ2Se28L3Dij11DzfOlqtWZOGHg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(107886003)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(6666004)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?it+ETn2n+fRtJW4vDkVaBTAvTPCMdx8wT7Im1tREvpvA+6LEeo3rDWyhvL?=
 =?iso-8859-1?Q?qFh4FhFrotTRr5bIZrsKThjttwpYKiXCrUzZr/aJxDZmi3QMW0+UuN4c1n?=
 =?iso-8859-1?Q?p3DDmxO09TEuiHR6MwM8f9UqRhKNYJgH1r78+OXfklKSBsYP+0z597I+Tk?=
 =?iso-8859-1?Q?UfNM6r0CFlSjF6Y6t3kIdR3Sw4PF5MnSrpa2sUoWMOzWYY+eCm4Fraacxc?=
 =?iso-8859-1?Q?oMRW38Wxo+KxIizRyrnQtmrfGTd50v64pdPrF8oj9tjGQ/8hU5N8m6rD7u?=
 =?iso-8859-1?Q?SI1PoBa9YpfLyaVFJshfcnlQD9cI7w2Qq6lwsqfodtme6UaZ1j4ZDdKLfa?=
 =?iso-8859-1?Q?HKd+tDxyXq6DtU/ed20Fijv0nwyVG2GUNfbjS4WRdz4KctUW2cpOKQ99hc?=
 =?iso-8859-1?Q?K5eBKTLJLciahnBPHlW6SvtBKPo/QpCp0grEPBThOr50dbYqavtUTxU6Ty?=
 =?iso-8859-1?Q?ElT/ABzb1fRP7S/AwJZTHu5bXH5D+BRsTiJnxzfQus3cUJckkE/pAhchi/?=
 =?iso-8859-1?Q?VQa4XwpJmK+qagYXFZjU7pJGwr0+qrWJug7Ok/iNh1AzjrI/iZueUWoZxo?=
 =?iso-8859-1?Q?LjFKgh5lFVaelyKAa8vl8ThUOHjyio4E132SWCgtzfh+YeIKuBa5dWd/qI?=
 =?iso-8859-1?Q?Aah1fVtcy5jEcMHma1K6tG6ZayJQiKA0iD0vKDjJxqNVhO9ZWZbjlLBRrl?=
 =?iso-8859-1?Q?N1qWJPFP4OVXJgjqUO0fOgbqnOIvFAsX0wA6sXBm5PFzbMCezZ9GW/kUbs?=
 =?iso-8859-1?Q?9GsgSx/XB8P8U5HRLufPdxbxkBZGhxIQSsWinSuAKS9bgzMgOvcYU2Qu4v?=
 =?iso-8859-1?Q?u5ofBi0olre+fcSos+fkR0hYtmNLJu18XDZwruv4l4Rwj2d/eW1pemhi3O?=
 =?iso-8859-1?Q?LO0QyItrcKYdDGRybJ91zM9jD/b3TMn/gtcmIpFuuYnZZKp7DjuwZCXmSU?=
 =?iso-8859-1?Q?ETs1zW7W2OD4FWzTgsV1h4f1Zvnwntayl2HbKde54eC6uY7Fy9yOjLx2Cw?=
 =?iso-8859-1?Q?B80M/2JaX/F1faZacsNs4EcvZsjxEGmlRX7QSy2IQOUi22RXw9bjotFxFL?=
 =?iso-8859-1?Q?6UQmMMgaAMgqF5L7QqRHGQKzXPodyrZEgIAdGiCUrrtL65Dfxh1jh01qMx?=
 =?iso-8859-1?Q?TUu3IzqyG/hVrxE0KOHPQC/5cf3srHX09O7G0Pd07nZBnw943KPOVQuTMb?=
 =?iso-8859-1?Q?YY6HbVFtFHPWjjArLtR4sISfakAoBC7EAMGCRsHCtWvkhZpaXn6sTNDxUz?=
 =?iso-8859-1?Q?uucUX0e/qAQxtz1aiJRgrD4Bl+KX65/Iq8zItNyLp3OWOHxIEWsFp0wPGE?=
 =?iso-8859-1?Q?FuA716ARwBUfAIz5uxUDYciNPvBHehkuDvCzQfwCbzmpCC+gOdR6+0IUsN?=
 =?iso-8859-1?Q?G87ce8ZFHIeh8r7CeM0FkjMRWc0tXO2FVRtMhBP7lk5On6U/kMLL28Mh9N?=
 =?iso-8859-1?Q?IpWP9whH+5I2/QU+ge99gxSfHKwz44lNCqngsvi5eHUhxdcX517gwm3cub?=
 =?iso-8859-1?Q?0vVZ1sMq9ZFRdfbztoJBJEUjn0Hc3LySJRI6uZDatSpbwMRDwM1r8+xtBg?=
 =?iso-8859-1?Q?OmSDP8mhFYEa0nWeJdvXlt82kss3PI8jBvPgYLaMUJ7x1EtUt4VCGd+JCF?=
 =?iso-8859-1?Q?tEG6amar+ZTTg+mq7RmQnAG6GIBqp+P/kUk3zr7aKsyte+XYE7F3tNwA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b72d35d-ceaf-452c-688b-08dbf2d5ce5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:06.4593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sfLpyYgFxmli5SNiqjaGvaNs4tATJklytmbXrCI3WYMkzJHot/fv8gf8IOpIbBOnuA8lWAGCafTQmNIcLvjAW3tMQIujyGTIFt30dcphYjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-ORIG-GUID: HMiYs3pK8hazm7EO0Zwij9s3iT339YZz
X-Proofpoint-GUID: HMiYs3pK8hazm7EO0Zwij9s3iT339YZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

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
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
In v11:
- Fixed format issues
- Added ASSERT_UNREACHABLE() to the dummy implementation of
vpci_translate_virtual_device()
- Moved variable in vpci_sbdf_from_gpa(), now it is easier to follow
the logic in the function
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
 xen/arch/arm/vpci.c     | 47 +++++++++++++++++++++++++++++++----------
 xen/drivers/vpci/vpci.c | 24 +++++++++++++++++++++
 xen/include/xen/vpci.h  | 12 +++++++++++
 3 files changed, 72 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3bc4bb5508..7a6a0017d1 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -7,31 +7,51 @@
=20
 #include <asm/mmio.h>
=20
-static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
-                                     paddr_t gpa)
+static bool vpci_sbdf_from_gpa(struct domain *d,
+                               const struct pci_host_bridge *bridge,
+                               paddr_t gpa, pci_sbdf_t *sbdf)
 {
-    pci_sbdf_t sbdf;
+    bool translated =3D true;
+
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
+    {
+        /*
+         * For the passed through devices we need to map their virtual SBD=
F
+         * to the physical PCI device being passed through.
+         */
+        sbdf->sbdf =3D VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
+        read_lock(&d->pci_lock);
+        translated =3D vpci_translate_virtual_device(d, sbdf);
+        read_unlock(&d->pci_lock);
+    }
=20
-    return sbdf;
+    return translated;
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
+        *r =3D ~0UL;
+        return 1;
+    }
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -39,7 +59,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *in=
fo,
         return 1;
     }
=20
-    *r =3D ~0ul;
+    *r =3D ~0UL;
=20
     return 0;
 }
@@ -48,7 +68,12 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *=
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
index c92f2d7bc3..7c0b610ccc 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -77,6 +77,30 @@ static int add_virtual_device(struct pci_dev *pdev)
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
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 6a06267ef2..ec6598237b 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -294,6 +294,18 @@ static inline bool __must_check vpci_process_pending(s=
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
+    ASSERT_UNREACHABLE();
+
+    return false;
+}
+#endif
+
 #endif
=20
 /*
--=20
2.42.0

