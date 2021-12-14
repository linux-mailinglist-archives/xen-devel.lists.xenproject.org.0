Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31FF473F98
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 10:34:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246489.425139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4Cs-0000DN-7r; Tue, 14 Dec 2021 09:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246489.425139; Tue, 14 Dec 2021 09:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4Cr-00006v-VT; Tue, 14 Dec 2021 09:34:45 +0000
Received: by outflank-mailman (input) for mailman id 246489;
 Tue, 14 Dec 2021 09:34:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXUZ=Q7=epam.com=prvs=298265c1fe=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1mx4Cp-0007JG-CQ
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 09:34:43 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35c0b5fa-5cc0-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 10:28:35 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BE943EJ004675;
 Tue, 14 Dec 2021 09:34:37 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cxraag3uw-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 09:34:37 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB6976.eurprd03.prod.outlook.com (2603:10a6:102:e4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 09:34:30 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 09:34:30 +0000
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
X-Inumbo-ID: 35c0b5fa-5cc0-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m48qyoYx/iKZFtFXfcW1CLJyzLSNIh10N2U8F/k9zetZl76mta/xpNhTPtUUvUnW/UM1bm0AtCecbJFMfHYPYl0LnNXU1kWOhDF+CzwQIu3I8EQi0GZcUNSFQr9GHB7qogksEZH+bMkuuf98UkxBlHFPU/NmMeo393wy+cyMx0AmDXcvi7rjq4yjrwmxrKlGwkfBgXcsH8/dB5cxZ9R8tFRTMeN5LTHzON1+v+0YpBoLWiINEy5+yi9rLUO1S6S7jG2Z2ZokwjytCFiASttz5tRkpa+dOn0610SRiz7aWV1DIzRoe49TS5eVl7AKjORGMveixsoNpjOcInSDySo3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuMyjEbSpSIao6BH2oZdWuIEjdeXmzyuL/4oyil7Wmc=;
 b=NvSp+ny15CW+7+rDnu9OWE36EmkjdhLCqGkUvf3TCswiP4+yXAE7l+JWNYQxc3sBVMCpnMKcCLFDPIrcHi257/7MyuQjtMiDUvLU4YLNshkDU0//LAlilzUvY5z1tGPFavAbelF1snAe6hkhT37tsBYnxq3hXoXFn+O0xv+b3Mldq5BhUwq/lebVA8kF8/G2WNNl5FnoonPqbFKPFXHtJd/nsuKaiR0RRs8J0AYpdhcQB9piHDsPNxER94n6ySmMde/g2lZiQDVXHkdxJtXx7QrZiaD5dw6B6semlaneXCUckb/cKNHhKl2F4fzlPSyefihc6eqOn75C0TvSlb6eJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuMyjEbSpSIao6BH2oZdWuIEjdeXmzyuL/4oyil7Wmc=;
 b=q6W53TiSH1KhwtgXlL9zuELN3xKU1FuvUx3zd4ah+8b+1FEYBquF3Jidii0wt7atZ8we6YSh1mGudUfqmh802rBc9qdLO2512AjDKg5CX/a2k3PTbzs6t/+DxV+JjENvd0LW6ToTWBNYQL1y/eiRkuUbHg2jiaeKqnJdrB5jM+FrsmxsW04GUTWelxloUoFE7YhMISmGKpbcWGZibfHSABu5lX89HYrzWEvrtG7VOuZyaVlilSMBYwxREXACmlA3wk+4YhZMK2RX3P+dzcEmHDLMjH28ZNpWsbvkh52+CRlUS8F8F7gx0J7FJz25wfZtydT6akVHvLY75w+iPJJgwA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, Wei Liu <wl@xen.org>,
        Juergen Gross <jgross@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Topic: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Index: AQHX8M3LpzWz4l8PQUiIA2nAUV0H+g==
Date: Tue, 14 Dec 2021 09:34:30 +0000
Message-ID: 
 <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1639472078.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d782d05e-9d15-4391-20f1-08d9bee4ee01
x-ms-traffictypediagnostic: PA4PR03MB6976:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB6976BD1F9B8267AE294B2E20E3759@PA4PR03MB6976.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:538;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LXqwGYCnlvewmBDk77E+vGdGvpUzpOZ9C/YJ1AyI9p4PDaGITyjsMR+i1egcyXDuV6hRpM+Ui9Vesq6I0logEFjbCpFWsN2DHk5tdT/fW/sZ9ctGLPKG8ObJXsyfwuG2whxMhpxgJTp6Q00AkLwuEhW3P+rRFbvDH5iqVJDVNbKal67Fl7Y+8C7VnmpDyQQmWgHy6hSth8FH8LFiHb5lJFvVKSueH7Z94VeaZR3SbkHj2EjU4sDw9wuVN2X+pVUEq61wOLfC2LZtg5NWSAkI1ZriQcNaNjCTppRKbrXhVYQ6a0mb0SNQwWY4vh1SAqnIbg8aD0RqJHQ9kbUj0UkNOOPkpu/x/y681OMFow1rp5U1oPj/dCXICi2ScNfS3uCf9SmVr6H0fF3xlNuadXt6DsAm5HC89QfQNAsE7QnRlqkpzq6TzlgRTONEghEBkqsS92yD/c1+PjVUVz14BVFq0P32bFrdViL4OgleGM7hkFDq0hgfTKJgF0h3NXyakwpdaYUGF+K0Ld5e4igGAbT8BT3zITZnpXJ8oetlrQ7epXsWTB78SmKWt9lR01HXN+o+IFLyZLIlyWfmqrwM2foazkcaY0iktB+V9L3J7sLxlSQm+11vj1LqP9+Lx5sj19w0nX7vIoUHNNPc4nGpnEmb80cd7jJgwXNbL2fc+KywWNOVfor71mjfBl/0we3Y3LmuXjx/xJ31auT0v6/++Zpg+w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(64756008)(66556008)(66946007)(26005)(66446008)(76116006)(5660300002)(91956017)(508600001)(86362001)(83380400001)(186003)(30864003)(7416002)(6916009)(4326008)(2906002)(6486002)(38070700005)(8936002)(2616005)(36756003)(71200400001)(8676002)(38100700002)(122000001)(6512007)(6506007)(316002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?dUH0YfGfqSD0cghep/a3Yx/g38c+7tCWraVMq6y5vOSalZXuoa7MPNVTCu?=
 =?iso-8859-1?Q?fV41dQRKMDQEuoIaXP7sO2Vt3N/DgxF5KRmA/x9Kl9gz2uDPeRxCAiw2XG?=
 =?iso-8859-1?Q?wmDRzr38TL/Np37HcwzOxOW0xsqk5ckIgoGFJogXAHuMjp3ZMQJVjBSbt2?=
 =?iso-8859-1?Q?WEbxB+Cv4FALZaPDCN/03VEQfwRVzjAjn0xBgi6hagreJ9LSaTrIFC4c9P?=
 =?iso-8859-1?Q?poNcqZoeqzy8ZxWhhrAfnkcgmNFiqgiNgtUs/+izwbhdcp+jRF6RDxfhrS?=
 =?iso-8859-1?Q?TQMCDyO08tn4zjwCXUlGpxRIJ5Ly3pamSOK9JdGMwOsr/z6ji39F6QGUU8?=
 =?iso-8859-1?Q?4xdf/E3lD5HDOKLCEUrUpbACTlC57fKIct2o6EVJzt0BQ9FWc+lLJKstYk?=
 =?iso-8859-1?Q?WW9mlUKsKtZ2UJxWmnHcs1sOWc7sdYuzogHKEsyphpVTW3ijugQcEiJR0D?=
 =?iso-8859-1?Q?z9LdBKp+0tkJeA72Q8GyzCSDrb562/bW4KfeBnbZSnYmCYOIfFddw0cb1x?=
 =?iso-8859-1?Q?6eQ3uciIAxh44P6Kk4EDqohq5F2tMqAbjeLW/v6gYSOtamDpS96qSyojo6?=
 =?iso-8859-1?Q?GnP2pwsLgOe3JqptDQhxoAjn+hT/YNm6csmJB2O2W7YqPWWvRMAOTFrJjs?=
 =?iso-8859-1?Q?+uoIBtYII7vM8lYmWK3ulz1LWSZwQVeRB0Md8jW3G/7CYlPdfbbSc9YeD5?=
 =?iso-8859-1?Q?4iLZlBbgye6zqySXactSc7Vd0WLO3/9y8gDfG/tQwmxbY4Nn9gp5FbrDD3?=
 =?iso-8859-1?Q?lsLvQT+biZH/sedYdYV5+4zjXV9p8pbD1sDlo8XZ+KnO1DtWC8nrbiSomK?=
 =?iso-8859-1?Q?7y9pGjuhlKpFIkuaqdYYDECq1P6YwsZDASPaLIVYYlm8Hnj0WI31Jsisd5?=
 =?iso-8859-1?Q?WN7y/RZKczxJl2Iw40Fa72nFioMeVIaNUGCy2ZWVFzDlIpJjRFnGU6ZUFF?=
 =?iso-8859-1?Q?wBP3ysGFTfSPgyD/cjBti3IdDkJycUnF524HNPq12iKcZvOU9lu8t5bply?=
 =?iso-8859-1?Q?OkFTcwKUR3d3cyjAGWI7qmzK3dQg00fKZMvXbwzdhAcDRJldCsPiM7p85F?=
 =?iso-8859-1?Q?v32ktvnR40cwAV1g3EnHB2/se89V4PzGIlIJ14DB2hNNohLN785y8PqD/N?=
 =?iso-8859-1?Q?/Tr/IcM7n0tuRWSIobZvzdSryVjZxI/CvVfEQ/YJc/TwxGZe83ZcqbLpLn?=
 =?iso-8859-1?Q?ZDVBoAHUxia1c/CQwzCDk/QWel1QxQi7TPXSwBrFc7tUoxRqsnU9fw4sTd?=
 =?iso-8859-1?Q?+5DlZ4XX+3Y2YUyAmSiZsS7QXLLXDlpfZa3L10Vip1rVLBRYZdHTJnMQ3N?=
 =?iso-8859-1?Q?9Tzei7+Hq1ICdGq0A8XJjUoQgQ0TdDisQyShdmvbz+qcN/eMAfgjnZd7Rq?=
 =?iso-8859-1?Q?5qFsbLkQ6TXdkkj/24wtPvN3A5VSzZ5+YjMFQ5hEzo/9kbNcdnpY2HoD8+?=
 =?iso-8859-1?Q?ynKnWwKWwkng/wjwy1hsjxEo1BbcWxBKI8MGxwsRM5ctTMlEGXr0gJjSca?=
 =?iso-8859-1?Q?CG5QW5VTN30DYPV8gT7grbBim9iwsSss98nkdiGGPHEFvEgVxjrczIXiVp?=
 =?iso-8859-1?Q?dJeoMa5ResJL1Lis5SlcnTNr6FsWNWAAxeRncGMy3fi/G/iA0vZGL4GjTG?=
 =?iso-8859-1?Q?2XpRsCiPgLOxhvm7FQqFFUfs9VN2empMe7H7DWyxLKJr8ruNOM0d5O+NhY?=
 =?iso-8859-1?Q?nNb8NVPHfQtIbddH6JLWiMurq8H3CHIo38t92LLFGibbJUMazsfsaJKPjd?=
 =?iso-8859-1?Q?mnUYjVZrmz50LRJfiJg0GRmaU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d782d05e-9d15-4391-20f1-08d9bee4ee01
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 09:34:30.3570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HtACawbFOb6DEVtIJacr+L0gGTFKQD12nO1+eYoQu5syS2t66Y4N8xRYYY2lV0eFlZ1b/syLOxZkOpPuL79k9WILjhr19RroMqKGW2jJL5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6976
X-Proofpoint-ORIG-GUID: CFOXjYvmOTrU-6BM0q3KoB0xKMi33wW-
X-Proofpoint-GUID: CFOXjYvmOTrU-6BM0q3KoB0xKMi33wW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_05,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112140054

Integration of the SCMI mediator with xen libs:
- add hypercalls to aquire SCI channel and set device permissions
for DomUs;
- add SCMI_SMC nodes to DomUs device-tree based on partial device-tree;
- SCI requests redirection from DomUs to Firmware.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 tools/include/xenctrl.h           |   3 +
 tools/include/xenguest.h          |   2 +
 tools/libs/ctrl/xc_domain.c       |  23 ++++++
 tools/libs/guest/xg_dom_arm.c     |   5 +-
 tools/libs/light/libxl_arm.c      | 122 +++++++++++++++++++++++++++---
 tools/libs/light/libxl_create.c   |  54 ++++++++++++-
 tools/libs/light/libxl_dom.c      |   1 +
 tools/libs/light/libxl_internal.h |   4 +
 xen/arch/arm/domctl.c             |  15 ++++
 xen/include/public/domctl.h       |   9 +++
 10 files changed, 223 insertions(+), 15 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 07b96e6671..cdd14f465f 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1238,6 +1238,9 @@ int xc_domain_getvnuma(xc_interface *xch,
 int xc_domain_soft_reset(xc_interface *xch,
                          uint32_t domid);
=20
+int xc_domain_add_sci_device(xc_interface *xch,
+                              uint32_t domid, char *path);
+
 #if defined(__i386__) || defined(__x86_64__)
 /*
  * PC BIOS standard E820 types and structure.
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 61d0a82f48..35c611ac73 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -242,6 +242,8 @@ struct xc_dom_image {
=20
     /* Number of vCPUs */
     unsigned int max_vcpus;
+
+    xen_pfn_t sci_shmem_gfn;
 };
=20
 /* --- arch specific hooks ----------------------------------------- */
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index b155d6afd2..07bb390e17 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -2206,6 +2206,29 @@ int xc_domain_soft_reset(xc_interface *xch,
     domctl.domain =3D domid;
     return do_domctl(xch, &domctl);
 }
+
+int xc_domain_add_sci_device(xc_interface *xch,
+                              uint32_t domid, char *path)
+{
+    size_t size =3D strlen(path);
+    int rc;
+    DECLARE_DOMCTL;
+    DECLARE_HYPERCALL_BOUNCE(path, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
+
+    if ( xc_hypercall_bounce_pre(xch, path) )
+        return -1;
+
+    domctl.cmd =3D XEN_DOMCTL_add_sci_device;
+    domctl.domain =3D domid;
+    domctl.u.sci_device_op.size =3D size;
+    set_xen_guest_handle(domctl.u.sci_device_op.path, path);
+    rc =3D do_domctl(xch, &domctl);
+
+    xc_hypercall_bounce_post(xch, path);
+
+    return rc;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index 5e3b76355e..368a670c46 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -25,11 +25,12 @@
=20
 #include "xg_private.h"
=20
-#define NR_MAGIC_PAGES 4
+#define NR_MAGIC_PAGES 5
 #define CONSOLE_PFN_OFFSET 0
 #define XENSTORE_PFN_OFFSET 1
 #define MEMACCESS_PFN_OFFSET 2
 #define VUART_PFN_OFFSET 3
+#define SCI_SHMEM_OFFSET 4
=20
 #define LPAE_SHIFT 9
=20
@@ -69,11 +70,13 @@ static int alloc_magic_pages(struct xc_dom_image *dom)
     dom->console_pfn =3D base + CONSOLE_PFN_OFFSET;
     dom->xenstore_pfn =3D base + XENSTORE_PFN_OFFSET;
     dom->vuart_gfn =3D base + VUART_PFN_OFFSET;
+    dom->sci_shmem_gfn =3D base + SCI_SHMEM_OFFSET;
=20
     xc_clear_domain_page(dom->xch, dom->guest_domid, dom->console_pfn);
     xc_clear_domain_page(dom->xch, dom->guest_domid, dom->xenstore_pfn);
     xc_clear_domain_page(dom->xch, dom->guest_domid, base + MEMACCESS_PFN_=
OFFSET);
     xc_clear_domain_page(dom->xch, dom->guest_domid, dom->vuart_gfn);
+    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->sci_shmem_gfn);
=20
     xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_CONSOLE_PFN,
             dom->console_pfn);
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index eef1de0939..73ef591822 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -8,6 +8,8 @@
 #include <assert.h>
 #include <xen/device_tree_defs.h>
=20
+#define SCMI_NODE_PATH      "/firmware/scmi"
+
 static const char *gicv_to_string(libxl_gic_version gic_version)
 {
     switch (gic_version) {
@@ -101,6 +103,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         return ERROR_FAIL;
     }
=20
+    switch (d_config->b_info.sci) {
+    case LIBXL_SCI_TYPE_NONE:
+        config->arch.sci_type =3D XEN_DOMCTL_CONFIG_SCI_NONE;
+        break;
+    case LIBXL_SCI_TYPE_SCMI_SMC:
+        config->arch.sci_type =3D XEN_DOMCTL_CONFIG_SCI_SCMI_SMC;
+        break;
+    default:
+        LOG(ERROR, "Unknown SCI type %d",
+            d_config->b_info.sci);
+        return ERROR_FAIL;
+    }
+
     return 0;
 }
=20
@@ -122,6 +137,7 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
     }
=20
     state->clock_frequency =3D config->arch.clock_frequency;
+    state->sci_agent_paddr =3D config->arch.sci_agent_paddr;
=20
     return 0;
 }
@@ -502,9 +518,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
     int res;
     LOG(DEBUG, "Creating OP-TEE node in dtb");
=20
-    res =3D fdt_begin_node(fdt, "firmware");
-    if (res) return res;
-
     res =3D fdt_begin_node(fdt, "optee");
     if (res) return res;
=20
@@ -517,9 +530,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
     res =3D fdt_end_node(fdt);
     if (res) return res;
=20
-    res =3D fdt_end_node(fdt);
-    if (res) return res;
-
     return 0;
 }
=20
@@ -902,10 +912,9 @@ static int copy_node(libxl__gc *gc, void *fdt, void *p=
fdt,
     return 0;
 }
=20
-static int copy_node_by_path(libxl__gc *gc, const char *path,
-                             void *fdt, void *pfdt)
+static int get_path_nodeoff(const char *path, void *pfdt)
 {
-    int nodeoff, r;
+    int nodeoff;
     const char *name =3D strrchr(path, '/');
=20
     if (!name)
@@ -925,12 +934,101 @@ static int copy_node_by_path(libxl__gc *gc, const ch=
ar *path,
     if (strcmp(fdt_get_name(pfdt, nodeoff, NULL), name))
         return -FDT_ERR_NOTFOUND;
=20
+    return nodeoff;
+}
+
+static int copy_node_by_path(libxl__gc *gc, const char *path,
+                             void *fdt, void *pfdt)
+{
+    int nodeoff, r;
+
+    nodeoff =3D get_path_nodeoff(path, pfdt);
+    if (nodeoff < 0)
+        return nodeoff;
+
     r =3D copy_node(gc, fdt, pfdt, nodeoff, 0);
     if (r) return r;
=20
     return 0;
 }
=20
+static int get_node_phandle(const char *path, void *pfdt, uint32_t *phandl=
e)
+{
+    int nodeoff;
+    const char *name =3D strrchr(path, '/');
+
+    if (!name)
+        return -FDT_ERR_INTERNAL;
+
+    name++;
+    nodeoff =3D fdt_path_offset(pfdt, path);
+    if (nodeoff < 0)
+        return nodeoff;
+
+    *phandle =3D fdt_get_phandle(pfdt, nodeoff);
+    return 0;
+}
+
+static int make_scmi_shmem_node(libxl__gc *gc, void *fdt, void *pfdt,
+                           struct xc_dom_image *dom)
+{
+    int res;
+    char buf[64];
+    uint32_t phandle =3D 0;
+
+    res =3D get_node_phandle("/scp-shmem", pfdt, &phandle);
+    if (res) return res;
+
+    snprintf(buf, sizeof(buf), "scp-shmem@%lx",
+             dom->sci_shmem_gfn << XC_PAGE_SHIFT);
+    res =3D fdt_begin_node(fdt, buf);
+    if (res) return res;
+
+    res =3D fdt_property_compat(gc, fdt, 1, "arm,scmi-shmem");
+    if (res) return res;
+
+    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+                    GUEST_ROOT_SIZE_CELLS, 1,
+                    dom->sci_shmem_gfn << XC_PAGE_SHIFT, XC_PAGE_SHIFT);
+    if (res) return res;
+
+    LOG(DEBUG, "scmi: setting phandle =3D %u\n", phandle);
+    res =3D fdt_property_cell(fdt, "phandle", phandle);
+    if (res) return res;
+
+    res =3D fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
+static int make_firmware_node(libxl__gc *gc, void *fdt, void *pfdt, int te=
e,
+                              int sci)
+{
+    int res;
+
+    if ((tee !=3D LIBXL_TEE_TYPE_OPTEE) && (sci !=3D LIBXL_SCI_TYPE_NONE))
+        return 0;
+
+    res =3D fdt_begin_node(fdt, "firmware");
+    if (res) return res;
+
+    if (tee =3D=3D LIBXL_TEE_TYPE_OPTEE) {
+       res =3D make_optee_node(gc, fdt);
+       if (res) return res;
+    }
+
+    if (sci =3D=3D LIBXL_SCI_TYPE_SCMI_SMC) {
+        res =3D copy_node_by_path(gc, SCMI_NODE_PATH, fdt, pfdt);
+        if (res) return res;
+    }
+
+    res =3D fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 /*
  * The partial device tree is not copied entirely. Only the relevant bits =
are
  * copied to the guest device tree:
@@ -1088,8 +1186,10 @@ next_resize:
         if (info->arch_arm.vuart =3D=3D LIBXL_VUART_TYPE_SBSA_UART)
             FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
=20
-        if (info->tee =3D=3D LIBXL_TEE_TYPE_OPTEE)
-            FDT( make_optee_node(gc, fdt) );
+        FDT( make_firmware_node(gc, fdt, pfdt, info->tee, info->sci) );
+
+        if (info->sci =3D=3D LIBXL_SCI_TYPE_SCMI_SMC)
+            FDT( make_scmi_shmem_node(gc, fdt, pfdt, dom) );
=20
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_creat=
e.c
index dcd09d32ba..c7372fd344 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -596,6 +596,37 @@ out:
     return ret;
 }
=20
+static int map_sci_page(libxl__gc *gc, uint32_t domid, uint64_t paddr,
+                         uint64_t guest_addr)
+{
+    int ret;
+    uint64_t _paddr_pfn =3D paddr >> XC_PAGE_SHIFT;
+    uint64_t _guest_pfn =3D guest_addr >> XC_PAGE_SHIFT;
+
+    LOG(DEBUG, "iomem %"PRIx64, _paddr_pfn);
+
+    ret =3D xc_domain_iomem_permission(CTX->xch, domid, _paddr_pfn, 1, 1);
+    if (ret < 0) {
+        LOG(ERROR,
+              "failed give domain access to iomem page %"PRIx64,
+             _paddr_pfn);
+        return ret;
+    }
+
+    ret =3D xc_domain_memory_mapping(CTX->xch, domid,
+                                   _guest_pfn, _paddr_pfn,
+                                   1, 1);
+    if (ret < 0) {
+        LOG(ERROR,
+              "failed to map to domain iomem page %"PRIx64
+              " to guest address %"PRIx64,
+              _paddr_pfn, _guest_pfn);
+        return ret;
+    }
+
+    return 0;
+}
+
 int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
                        libxl__domain_build_state *state,
                        uint32_t *domid, bool soft_reset)
@@ -762,6 +793,16 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_con=
fig *d_config,
         goto out;
     }
=20
+    if (state->sci_agent_paddr !=3D 0) {
+        ret =3D map_sci_page(gc, *domid, state->sci_agent_paddr,
+                            state->sci_shmem_gfn << XC_PAGE_SHIFT);
+        if (ret < 0) {
+            LOGED(ERROR, *domid, "map SCI page fail");
+            rc =3D ERROR_FAIL;
+            goto out;
+        }
+    }
+
     dom_path =3D libxl__xs_get_dompath(gc, *domid);
     if (!dom_path) {
         rc =3D ERROR_FAIL;
@@ -1817,17 +1858,24 @@ static void libxl__add_dtdevs(libxl__egc *egc, libx=
l__ao *ao, uint32_t domid,
 {
     AO_GC;
     libxl__ao_device *aodev =3D libxl__multidev_prepare(multidev);
-    int i, rc =3D 0;
+    int i, rc =3D 0, rc_sci =3D 0;
=20
     for (i =3D 0; i < d_config->num_dtdevs; i++) {
         const libxl_device_dtdev *dtdev =3D &d_config->dtdevs[i];
=20
         LOGD(DEBUG, domid, "Assign device \"%s\" to domain", dtdev->path);
         rc =3D xc_assign_dt_device(CTX->xch, domid, dtdev->path);
-        if (rc < 0) {
-            LOGD(ERROR, domid, "xc_assign_dtdevice failed: %d", rc);
+        rc_sci =3D xc_domain_add_sci_device(CTX->xch, domid, dtdev->path);
+
+        if ((rc < 0) && (rc_sci < 0)) {
+            LOGD(ERROR, domid, "xc_assign_dt_device failed: %d; "
+                 "xc_domain_add_sci_device failed: %d",
+                 rc, rc_sci);
             goto out;
         }
+
+        if (rc)
+            rc =3D rc_sci;
     }
=20
 out:
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index fe9f760f71..b1d288a8b9 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -710,6 +710,7 @@ int libxl__build_pv(libxl__gc *gc, uint32_t domid,
         state->console_mfn =3D dom->console_pfn;
         state->store_mfn =3D dom->xenstore_pfn;
         state->vuart_gfn =3D dom->vuart_gfn;
+        state->sci_shmem_gfn =3D dom->sci_shmem_gfn;
     } else {
         state->console_mfn =3D xc_dom_p2m(dom, dom->console_pfn);
         state->store_mfn =3D xc_dom_p2m(dom, dom->xenstore_pfn);
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_int=
ernal.h
index 0b4671318c..f9f9cc633a 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1407,6 +1407,10 @@ typedef struct {
     /* Whether this domain is being migrated/restored, or booting fresh.  =
Only
      * applicable to the primary domain, not support domains (e.g. stub QE=
MU). */
     bool restore;
+
+    /* sci channel paddr to be set to device-tree node */
+    uint64_t sci_agent_paddr;
+    xen_pfn_t sci_shmem_gfn;
 } libxl__domain_build_state;
=20
 _hidden void libxl__domain_build_state_init(libxl__domain_build_state *s);
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index 6245af6d0b..ba200407da 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2012, Citrix Systems
  */
=20
+#include <asm/sci/sci.h>
 #include <xen/errno.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
@@ -175,6 +176,20 @@ long arch_do_domctl(struct xen_domctl *domctl, struct =
domain *d,
=20
         return rc;
     }
+    case XEN_DOMCTL_add_sci_device:
+    {
+        int rc;
+        struct dt_device_node *dev;
+
+        rc =3D dt_find_node_by_gpath(domctl->u.sci_device_op.path,
+                                   domctl->u.sci_device_op.size,
+                                   &dev);
+        if ( rc )
+            return rc;
+
+        return sci_add_dt_device(d, dev);
+    }
+
     default:
     {
         int rc;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index b85e6170b0..671c72c3e8 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1177,6 +1177,13 @@ struct xen_domctl_vmtrace_op {
 #define XEN_DOMCTL_vmtrace_get_option         5
 #define XEN_DOMCTL_vmtrace_set_option         6
 };
+
+/* XEN_DOMCTL_add_sci_device: set sci device permissions */
+struct xen_domctl_sci_device_op {
+    uint32_t size; /* Length of the path */
+    XEN_GUEST_HANDLE_64(char) path; /* path to the device tree node */
+};
+
 typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
=20
@@ -1265,6 +1272,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_get_cpu_policy                82
 #define XEN_DOMCTL_set_cpu_policy                83
 #define XEN_DOMCTL_vmtrace_op                    84
+#define XEN_DOMCTL_add_sci_device                85
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1326,6 +1334,7 @@ struct xen_domctl {
         struct xen_domctl_psr_alloc         psr_alloc;
         struct xen_domctl_vuart_op          vuart_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
+        struct xen_domctl_sci_device_op     sci_device_op;
         uint8_t                             pad[128];
     } u;
 };
--=20
2.27.0

