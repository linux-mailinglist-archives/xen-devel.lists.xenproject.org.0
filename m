Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C4A5A7F9C
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 16:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395681.635480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR0-0002e2-IL; Wed, 31 Aug 2022 14:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395681.635480; Wed, 31 Aug 2022 14:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR0-0002cG-FU; Wed, 31 Aug 2022 14:11:14 +0000
Received: by outflank-mailman (input) for mailman id 395681;
 Wed, 31 Aug 2022 14:11:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jA7u=ZD=epam.com=prvs=1242718080=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oTOQy-0002bv-S9
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 14:11:13 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2df0da8-2936-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 16:11:10 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VBo4GE032537;
 Wed, 31 Aug 2022 14:11:07 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ja427h4rd-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 14:11:07 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6301.eurprd03.prod.outlook.com (2603:10a6:800:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 14:11:02 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f%6]) with mapi id 15.20.5566.019; Wed, 31 Aug 2022
 14:11:01 +0000
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
X-Inumbo-ID: c2df0da8-2936-11ed-934f-f50d60e1c1bd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvArwocYUmWcgj1cBM8dAwNTv+HzTn8sMGFViPImWj5Q3F9llb6oaaTnAutlo5noBmcc2zKT8IJxaSOZUH7d1S7F772NoVqMbdqcYe64AndKM5cI0Z2Z2fMjIDMXWdIEXEw9mHivEY0hB72qpgZAwpqyf33C/aQy/Cf0OYNeYNOgd3X4NopGuzI6zP4Kn9oB8/WNZzFOUg73SIXqke0doOkDWtn1VXAY7iri2kxnSNb4AjYV6oY+KjySFIHhQwl01mQNCT+3yAVx7bLIO9cuw5SXREBsKXJfvaHtdbLB9ZFZGYY9F1Eu1R8vZdWiLOwkvJdiEJqYFpLkKisFTEBAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKNemWZV2+FfurTu7vJyid03vkZnEYejDqPafwLthYA=;
 b=cPyGpxRKr5BUYR1PXasS2s/HiSxFSR9e9dM1UMDTP1o4OgZ75E0fXwPc68OIxhViChvYjK3MlcZuMgraR+x/sik/L5nuY4rCjUGL/IrFaY5UifPzrk0y38oVUeMlOyrnEcWA2LTWgHK6ITBj/hrrSLGUL+MA/uN2oniAAMStU3xhBOrreQ1SW6/ZjPDhkzj6ZEcrpSpngkP3/Y/AfsllRmSO9TG5Gy9GbBiF4xwVEa6ZAqQsGlDmN1VGt9gOnEfCBcAojPH1gbLuIceFw1eyNtxAD2Ho6IFTPZFlU0mewN+PJg924XA6miKPOuz0yHWx6plrOx3tMAh66z3IgaIcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKNemWZV2+FfurTu7vJyid03vkZnEYejDqPafwLthYA=;
 b=DSjUsgDxzTZHhvTRrd+IuueionF9zq4+bW+5mEv/U1mYDZ6zCO/hYNLCyn2CmOsXRGkQhIaqW72keWvWlfMpes74FY2jMQySY7GlKS6o6rm41h75GBUosWwXJ2NqRtAdKAMEkMF1hL87Rcw7Px5AYL/Qli1ltFNnA8eHOrd3vsonxEHCYPq2eEDfv9tF3h1zq98sUu6CevTUs+45ryGM/H1IbGdkWAJektUZ8q6b/108Osl0ExaGn66hUcImtoZfCQQfHeT8IY2xX7YdtlQp6DrUJW9kreEi6FdmXPnZ1m/VRHLUtDwQS9rEE9ecuUqVdt3NngsuHT6zMI1FrU8vfg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Kevin Tian <kevin.tian@intel.com>, Jan
 Beulich <jbeulich@suse.com>,
        Paul Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 09/10] [RFC only] xen: iommu: remove last  pcidevs_lock()
 calls in iommu
Thread-Topic: [RFC PATCH 09/10] [RFC only] xen: iommu: remove last
  pcidevs_lock() calls in iommu
Thread-Index: AQHYvUOAlPa0wkGiakOWSGDBM2amAQ==
Date: Wed, 31 Aug 2022 14:11:01 +0000
Message-ID: <20220831141040.13231-10-volodymyr_babchuk@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.37.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c2ed1f2-79cc-492b-ce23-08da8b5aa2ac
x-ms-traffictypediagnostic: VI1PR03MB6301:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QThC1htusAtQAt2B2v9A+fgyL3/E9jsD1gfKXVTHPKPnETix/ezkg2zyQKyCwyFzyhO7zRg1HkQClmhC6APAaxz+68k0DRE6YqhG7HlNnB9EYZOQKgGNoQHAE4jXnsJd9xV4wB8WfQ2w0M2dZrvzg+RCe6rkY1QpLHdo+be0s1CF1e5gSjLvyuArl3abxc5Io+4gLGXVY97OzaOzYNTza/CIn+4XVxNn/qrhlDPwthJaVIm4JGyr7+kl9eOJcGUsNLty0VWbE49nCLqXG4c6ek+x1lg8zKSOm0BuXCRDCWMIz4A8ikUWfYSJt8SoU+mzvvIJ3YXWXtjzGCnyz1B7roapQIOv9jDBRP983/lVOW99SkjOv5pAmK7qdjK1nxojrf7/zDOAWfTC99/hxrjxzGgGCbVvzw9p1fvMsgxgDOUmafz69rsZsriGBhiThKsIvyxs/6Ows6FwMJsd/86H2vFfA5L9nqiJXvpkjFAcRtTbCsk4SN3N6VcDy3wzDsduog/wkdLmXh4BSI+6T/4lbHfktO8t9uaL4m6drBSP5ubTR/tJ4TRxIbjURisNa9UhANcqEzSGQrlyOhFbxBjb9G4gzNn1h7qde0aSXzpG8RUnH46wZNGVXUZDEGcNShDjB0DQhDCvFRlX1B5SufD8MgtpWv5+cehnvsXuiK2WrKNK8WIOD79nsieNbSVs00ExTpuH4gEjXvamddHWsZfUMPUfeD67CcIJqWQguYFVPOCwjGPpsTnRXJTq2zlD6bG01nOSYCnX3PZo7Z+AYe/AsA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(4326008)(66556008)(76116006)(66946007)(38070700005)(66476007)(8676002)(2906002)(66446008)(64756008)(54906003)(1076003)(186003)(83380400001)(2616005)(5660300002)(91956017)(8936002)(316002)(36756003)(6916009)(6486002)(478600001)(71200400001)(86362001)(55236004)(26005)(41300700001)(6512007)(6506007)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?AnJnovz+0KakAiFLK/BUDZ19KFy3tu4nx8ikSrUggWBAkttwdoDYcEUKwf?=
 =?iso-8859-1?Q?mRR9aMB9dgu834OlA/Op4mQ6DplVpEytw+SoBYj71MMiwktj0wJbMBhDdT?=
 =?iso-8859-1?Q?BwmOOpPWCzEXAI8bTqWXjz1ADlNW166jzeyI1hky7AGafynp6XOTLercFf?=
 =?iso-8859-1?Q?eBI3fKRkx82ZevpIHSFFbUuTGeyZOLpXIsmmOYVF1R5SIO+JLyIHldChy7?=
 =?iso-8859-1?Q?CQQxzhm+TuDr/8AiRcZB6/SoTHq3XVClg8TppBGKoRU5zvO8Cs5DIRk2T8?=
 =?iso-8859-1?Q?xOzx2vgeAKiZXJ74JCtMgk1zwg8OeobyjO/0ZWm9Tn+aIlz5KcNYihl3WU?=
 =?iso-8859-1?Q?SsHDBQCXs9OS5TcwNRTJd16MLkXjtRTF/I0rhH9M4/tv8V6yqhmJ1qOGtM?=
 =?iso-8859-1?Q?j36D6jdufKotRsfg6LYj4PswqWQiopbA9kk31IDaqeRbOmnAPffXjdgKCO?=
 =?iso-8859-1?Q?LP1ff/Z9Q1PVACCT5HdJQ4pXo46ZF2JRRARhClxIh80Gdm3OSHBx6brIi+?=
 =?iso-8859-1?Q?UxscfCXBjvka4lt2UyJizYhPclAByEaBjnd93agtc87P9hD9bhhqSMgknV?=
 =?iso-8859-1?Q?9CViVGxTfTqVm96Ln2OXkTbaZz5GChqiVX+OGBQ7VFaWcjy5fyLJ5GBHl7?=
 =?iso-8859-1?Q?WzEYcfnjWipEAb94qtIFU2oH6usSKktNAJhK29sm06cEoL88JrR+OJlTjH?=
 =?iso-8859-1?Q?DmEItfz3pXyp/Wv4ektah63mJxmgMdoZPlaLangct/kTfCY5uAwwiHZ5Sb?=
 =?iso-8859-1?Q?c8k015Vnc/B0+ZK/sD4ySZnfasuDOqGb+/YIHsxFQx6SlE3JdXa21ZhO/X?=
 =?iso-8859-1?Q?n1NnWCJK38ErKXzvR2T4GdtgQS7ZRFeK7f+B0qxM8W073LaOtcdVOAlekq?=
 =?iso-8859-1?Q?+xWzHEdhppVMpEAn90IuEyd8j/HvjnCuMwkQ6FC7FcmAkvxQ2bcx1+HAOW?=
 =?iso-8859-1?Q?fL9N0/8DD+u7OAkgER8XeHaNPZ7Cxyhyq1mAi6U6A6iPZ8ToXD2bL/8zwE?=
 =?iso-8859-1?Q?rhka4Frqu63X8kG9T9d9QQ0iZ0EV7GUg+BEsMfNHHUZaYr5LHjVu74N9DA?=
 =?iso-8859-1?Q?vyuWkj0PS4l70EqBGWGuuapjsW4AjvP/DMrCxF0HhuQWqak2+nVIRVw4v5?=
 =?iso-8859-1?Q?Y+R1PKoNdYwvkzrjw0EQEEuGXzbhpOy1SadIzPCd5UqsITRjeobRhjG4UX?=
 =?iso-8859-1?Q?1Qndwn0EmnXnxKMMCxa7BUilNhnFL/C6pb6UhI1NmEFQ72H1fWqxSTW3w7?=
 =?iso-8859-1?Q?9H9WazTVB2gNc+rHYkT88g4P3ML1L2MD38su72dB+AdvtH2HMm3DRr4rRR?=
 =?iso-8859-1?Q?ctPrbHFnBtlWwmH0eBi9/DifxQHX1pgStR8SpXljNK27fkBOamiD8BVQKg?=
 =?iso-8859-1?Q?97r7wma/hPHQs7QH2P741jt2NCXRkc7UOozk5l3jSj3mxW2khVWR6/IJPV?=
 =?iso-8859-1?Q?kAVPeDjAFRkuEszT5wzDzRZFkqrQC3o0z2Z2iEoqso52y4kC6/Z3plvDTe?=
 =?iso-8859-1?Q?b37vM251IiPTUQTTDiyujGKWuREV+mNCvXcwzsd3t/ziV7w+m08XvCeBwR?=
 =?iso-8859-1?Q?v5KCZp+hsC8DK8SjS+qhdgRcH6jSxGnPtyC3wGXyygbyw8dXGbkkWRCFCw?=
 =?iso-8859-1?Q?dNKfS/+kp7i6sygxYYWB0Rtbo9+CQh13ky0eVR3pR8yoa2zZozghICsw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2ed1f2-79cc-492b-ce23-08da8b5aa2ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:11:01.8272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LhNZ1/FbZV+oN13CFD2tj1ETKjJHk48362a7nk3NfOr1ZSmW8GpCCJLaw81vLHhmlEsfJMilNiSIRv2CxAsYgSoR39STmeejK8hbtByA/Qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6301
X-Proofpoint-GUID: d0beUWY9CpniSbmboyjYlg4wxNcL61o4
X-Proofpoint-ORIG-GUID: d0beUWY9CpniSbmboyjYlg4wxNcL61o4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208310070

There are number of cases where pcidevs_lock() is used to protect
something that is not related to PCI devices per se.

Probably pcidev_lock in these places should be replaced with some
other lock.

This patch is not intended to be merged and is present only to discuss
this use of pcidevs_lock()

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/drivers/passthrough/vtd/intremap.c | 2 --
 xen/drivers/passthrough/vtd/iommu.c    | 5 -----
 xen/drivers/passthrough/x86/iommu.c    | 5 -----
 3 files changed, 12 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrou=
gh/vtd/intremap.c
index 1512e4866b..44e3b72f91 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -893,8 +893,6 @@ int pi_update_irte(const struct pi_desc *pi_desc, const=
 struct pirq *pirq,
=20
     spin_unlock_irq(&desc->lock);
=20
-    ASSERT(pcidevs_locked());
-
     return msi_msg_write_remap_rte(msi_desc, &msi_desc->msg);
=20
  unlock_out:
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/=
vtd/iommu.c
index 87868188b7..9d258d154d 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -127,8 +127,6 @@ static int context_set_domain_id(struct context_entry *=
context,
 {
     unsigned int i;
=20
-    ASSERT(pcidevs_locked());
-
     if ( domid_mapping(iommu) )
     {
         unsigned int nr_dom =3D cap_ndoms(iommu->cap);
@@ -1882,7 +1880,6 @@ int domain_context_unmap_one(
     int iommu_domid, rc, ret;
     bool_t flush_dev_iotlb;
=20
-    ASSERT(pcidevs_locked());
     spin_lock(&iommu->lock);
=20
     maddr =3D bus_to_context_maddr(iommu, bus);
@@ -2601,7 +2598,6 @@ static void __hwdom_init setup_hwdom_rmrr(struct doma=
in *d)
     u16 bdf;
     int ret, i;
=20
-    pcidevs_lock();
     for_each_rmrr_device ( rmrr, bdf, i )
     {
         /*
@@ -2616,7 +2612,6 @@ static void __hwdom_init setup_hwdom_rmrr(struct doma=
in *d)
             dprintk(XENLOG_ERR VTDPREFIX,
                      "IOMMU: mapping reserved region failed\n");
     }
-    pcidevs_unlock();
 }
=20
 static struct iommu_state {
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/=
x86/iommu.c
index f671b0f2bb..4e94ad15df 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -207,7 +207,6 @@ int iommu_identity_mapping(struct domain *d, p2m_access=
_t p2ma,
     struct identity_map *map;
     struct domain_iommu *hd =3D dom_iommu(d);
=20
-    ASSERT(pcidevs_locked());
     ASSERT(base < end);
=20
     /*
@@ -479,8 +478,6 @@ domid_t iommu_alloc_domid(unsigned long *map)
     static unsigned int start;
     unsigned int idx =3D find_next_zero_bit(map, UINT16_MAX - DOMID_MASK, =
start);
=20
-    ASSERT(pcidevs_locked());
-
     if ( idx >=3D UINT16_MAX - DOMID_MASK )
         idx =3D find_first_zero_bit(map, UINT16_MAX - DOMID_MASK);
     if ( idx >=3D UINT16_MAX - DOMID_MASK )
@@ -495,8 +492,6 @@ domid_t iommu_alloc_domid(unsigned long *map)
=20
 void iommu_free_domid(domid_t domid, unsigned long *map)
 {
-    ASSERT(pcidevs_locked());
-
     if ( domid =3D=3D DOMID_INVALID )
         return;
=20
--=20
2.36.1

