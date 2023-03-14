Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C006BA10E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 21:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509845.786456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhz-0004Gn-7M; Tue, 14 Mar 2023 20:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509845.786456; Tue, 14 Mar 2023 20:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhz-0004D7-2p; Tue, 14 Mar 2023 20:57:23 +0000
Received: by outflank-mailman (input) for mailman id 509845;
 Tue, 14 Mar 2023 20:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ugWp=7G=epam.com=prvs=7437a4d9da=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pcBhw-0001PG-LY
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 20:57:20 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce7c6aef-c2aa-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 21:57:19 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EKchDo017378; Tue, 14 Mar 2023 20:56:35 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3pb0520156-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 20:56:35 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAXPR03MB7967.eurprd03.prod.outlook.com (2603:10a6:102:21a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 20:56:30 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 20:56:30 +0000
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
X-Inumbo-ID: ce7c6aef-c2aa-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jC4APIhGtIE2q2vnB7Xgyp88/Qoj80o1jW8ZVmEsR9vzsBK/K7E9TKVH0ws3gYP/YP+M9F8QOAmNkVDpTUaIEk3cckeJDUxhkALykktfOg+vAAmly5lTrhiLI6GjXa7FSZr/zEVrsOryvVRh0JyevefLJHLd0d83VEWpAvWLCf8mAU95pr01MZRFUYQlym+9wKdLgtBxsULI9maLAFf1pnd7kIBUzCqSXrkc04IYaCdWRlS3+sOvIsChltiDYq8cIK7X8zgwLxhDG0dtK3mK5DFcFPvfL5TJEZCYO19KIVSLtu3BCcV52Bpz5JaJoAO1TSbPJb83UyZ2gNnVg6ID1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3giRBF2vC8XfohoRJp2TLUtqgs0zjuWEsEx8QPu5VA=;
 b=Tz/R6YZTMwc70J7ONg+kKpXLIbOTFUKWt/ae5r+pOO9D5VNXhFn6WhsVnCQdWjogdSv3XeT2XCcV5leL/fvTurxyRI7ZWz5Qz5AdHQfgeBeYm709FDveXJAGYyKjjKXZCKINQxroaWKAa54ad9Yp4QFJjYP/Dp8DQDZwKKepiLPlsFmHLrU0VKlg0unh+xHLHFxO8X6gLNzBUeRkX1xTehxHhMyyKac2nQekWI1bWlUGlnncA5euBRJUWu4/x52fznakBZsCJV31jGGoifpIy4jirsFf0Aa2ayzC6coDM6iqO4G7qy802N1Q9eMvOJnPS4qB5zs6OJEFTp0E3WaVxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3giRBF2vC8XfohoRJp2TLUtqgs0zjuWEsEx8QPu5VA=;
 b=dAviOwHeIzoIc/A3gZX5H+T7Vx+QUEPdEpSBpecXfxfM7wxgv433I/1U4T0S8qHWKVjVQyFyxzaa41H8qw6iLgiP29L6YfKNjxq988Xx9WL+ynHoFKMTz4gZd/wJqu9mFOA/6+EOwpbrsjDS2Dl2Jzcd2QZCwE79dvg98xmg7ATGRhSSajPuyV0LLY/GghGTCMCjMTI/30eQlwFTtbHgPBD9NCEpS2gnABk5CCzMT/Uu//Iv56WMyNZ2gkgN+djQnzDrzvKKA6TYmIzXe7a4IIr88MGTrb/SpxndggQwA7bOoVe4ZrQ3d93Xf0fOCczOGjYRc/MMtvIl0ErE2eQwgg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Thread-Topic: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Thread-Index: AQHZVrdzsdckomMx4kauxHkZQ597Ig==
Date: Tue, 14 Mar 2023 20:56:29 +0000
Message-ID: <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.39.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAXPR03MB7967:EE_
x-ms-office365-filtering-correlation-id: a0e2b907-4a39-4d48-f078-08db24ce9661
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Omev8bapjhzUupelKf/ySvHHGmZkYH1Re53t7uAlTwmc/m/KG/eOq4gqhxL7eVvdhCXNvK4yKPg0KAXz/9q88PVRTVdf3TADh/awFMo/IFz4VUg9lSXIrHpw6IjJwbCdI9Q6BlC5bD3PW89hBQjDPlpw1y1GZWuYUgLyipLMxQABF4kLGtjKoE6V8JIDEY/Gzf0c9ZIfyJFM9l8v8C/vpH8Z6vR/uUSQYdx04474IeJYm0S11RrJJ+L2cUSkqIEWQ7gjWZ0v8yMUGivy+D+eNZCZMvL2ty/Bb8b3FPZBwU5NdF47vEBZdVmyjufBR0B3188dQQPU8wVROQgk3ooA9aEN08zgQghYsGVkkeznWfM1jb2wX2sm4wKWDZhQkRc5r7lCsQ2YIlgOPX8Ri5Xr34n3Jon6a+mzKH1GXS5dsz8z6UjpDnk4lIMj3gqGkry7LKaGsd4DlfeTTD8A+MKEZLDCenj8T7X/A/TR5ULMHnHuyV6To2Zz8X2Az+LMQBXu3XPNSFUPIcrj7Nze/8D0LF4+SeehmhYdiFPGClE62m4aygvkYhSoDYzJdRl10nTXfISll/YY51F3qOhgTmprsqQOJEPtEdKa3nyCrvMWqSQqk0F+Ig9XqvdfGFUr6nwheUso77l/0yoDDUCKigg2GXOD1BfOs72EMbKO97QTNhH6RmsHxR9iDd5hOWzsnTdTU4JLV9ew9KYQomEIbEM8q5Ei6PnUYN5y6FRcB8c5iZY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199018)(54906003)(316002)(86362001)(36756003)(38070700005)(38100700002)(478600001)(122000001)(55236004)(83380400001)(6512007)(6506007)(2616005)(1076003)(186003)(26005)(7416002)(5660300002)(6486002)(91956017)(41300700001)(6916009)(71200400001)(76116006)(64756008)(30864003)(8936002)(8676002)(2906002)(66556008)(66476007)(66946007)(66446008)(4326008)(21314003)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?gm1U33arFh8VzSF4/mkduebH4EX1NY93Wces6XjSzBQWrtE3m0ZoZY+b8z?=
 =?iso-8859-1?Q?7f+rx2rPiwNGA95AMl1gnD+iSvODvNldMLOuEQXxIIcHHh7bjcws0hG3hs?=
 =?iso-8859-1?Q?Eu5InVqT/R0bnXXvPqA6YMJshITJcyZ+g02D/dQVOHPJvIj4muQ1XFMbuc?=
 =?iso-8859-1?Q?VwQf2qTCL+ayfaIFQUCSNuy5RuNHo/jb+lUVUKrdYAEaFAOvgemTwXHgA2?=
 =?iso-8859-1?Q?bBQidbBLJ40Mj3l2QLuiF6Tn9xCyVURGkmjR6rHfzNLiDVNMszQVyvBKak?=
 =?iso-8859-1?Q?XUDzChl+fwX7vqFOsSv84AiEQKVKCVW55oPJpgVXSkr4IWMTWmkw5cNF/z?=
 =?iso-8859-1?Q?O85INObWmw+FhQ2q0PxgWhZYtbozMYjWA3pcvpF2PjJhoDFvMCVTgqilf3?=
 =?iso-8859-1?Q?oolEZiNau7hWDJEfeBx4bVvuuEJPPmW6TjJ9YzTOf6opbafCDxtPj7ZcV8?=
 =?iso-8859-1?Q?dAqtYsfMf0rZ8x8PGq5buf70JqxRPPtZzgS9GnHiaMkbcLeZss+q7KYcTj?=
 =?iso-8859-1?Q?6frdM0el4IUIGczR8IB/mmWC29w3kg4WS2mLVcCkY3dpcAJKuAvE0XYE2A?=
 =?iso-8859-1?Q?uVtu8o0bZgOlxgJQ3HMQEdefWGnLpDrcwNSNUEnc8/4i8uF3m4CeVbHmsK?=
 =?iso-8859-1?Q?gN2GXxD/u9N+wizoh3GOh9VPFY2WL4ambZMMyUmjUWEAxDes/+flRBnqyy?=
 =?iso-8859-1?Q?YaAGs5D5dxfHxoIhaC/IW6RCiEZkRPu5OKUZS66wgohwbx+l6q+y3n6Z8o?=
 =?iso-8859-1?Q?MIOkwxlGjUyz9XvrXDApMPN7mrbr/SLSPaMxNAd0fqnzj4UoEeCpM72Xzp?=
 =?iso-8859-1?Q?sIdqejcOTzABL/dILcEuoNZqHUzsy5kjpO59zadPQ3C3P/xfsEq8lzXSn1?=
 =?iso-8859-1?Q?WGPjJtizkQtP0ev0DcGWGEY7bioUZSZrtjflzEHarv2kcKU2unz/yTa96h?=
 =?iso-8859-1?Q?HuxNTaq9rqSEEM9w07UMMOqWxE3DdU5xXUpOyogvnwlf8DCbGDXH3PsWLg?=
 =?iso-8859-1?Q?592znEzZ/JEznvKygyNM+9kx1qGY9mSn8FmEDmdD8iDBcqjo37CJ9xy7ml?=
 =?iso-8859-1?Q?RZv/cTriCg3z+3FCGKUGYX8lkC1atpA1GELjlaJQzfYtXptrgn1TN8Dtf9?=
 =?iso-8859-1?Q?3ou6iOb5zQfznNPqWDo213/ezhElbSXYrXTGSHDNpbm5eMelhc+L9XVsE8?=
 =?iso-8859-1?Q?7KXBizKYwYQ1FXOkyV6ttLRB3SgKXSiLb2yzL6Ld//0xgzq3u2wRxYes7Y?=
 =?iso-8859-1?Q?nObzGtdmfkTjOBSC6UxmMZ93IUpWqvioqR6djfZjmEA2ceTGbz6NrCi4mq?=
 =?iso-8859-1?Q?2EUsGLGLmO7hM3vecXlrIGEk/vxr+CfrUTs5XTETg+BmQOGR818z7gKFr4?=
 =?iso-8859-1?Q?6T9/b95itC9CFEjX8SRlsiUZKgPGyzgyGPt39FYbmXe7AlyeDGuQFsb0d/?=
 =?iso-8859-1?Q?BhdiDFemDNTxjJKpeLCBSOof2TPZrLqFH8cPGwmhbIlGKS6pS31vO9uMzE?=
 =?iso-8859-1?Q?c1R/twBSe3i7hGY/d1/FBvmAyx35wfWzr0NOOxld4vx4uOPcUNaYoZLETD?=
 =?iso-8859-1?Q?+GE4fDU/U2IrBRZDkOapXfIVg5XMHhSiRneblI8eflETG8aecJCKLIeQ0o?=
 =?iso-8859-1?Q?WKuHs925av5vPw3Yu3e40KJoDLaj0ScnWBy64qQBGR2UrHArsoAqH4sw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e2b907-4a39-4d48-f078-08db24ce9661
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 20:56:29.7296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9m1ahttUilynrm5cSdiA2L7W44xc6n04nTe/wwHpmlbzRibjcyyH3z6G68VNOcwac1bzabl/8EerHr9hZUdNDKaLLNF3joahJIeQ9UgPGBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7967
X-Proofpoint-ORIG-GUID: ZTGSVGK1gJqAvJXQjNTJFi0fYEwGzaEF
X-Proofpoint-GUID: ZTGSVGK1gJqAvJXQjNTJFi0fYEwGzaEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_14,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140168

Prior to this change, lifetime of pci_dev objects was protected by global
pcidevs_lock(). Long-term plan is to remove this log, so we need some
other mechanism to ensure that those objects will not disappear under
feet of code that access them. Reference counting is a good choice as
it provides easy to comprehend way to control object lifetime.

This patch adds two new helper functions: pcidev_get() and
pcidev_put(). pcidev_get() will increase reference counter, while
pcidev_put() will decrease it, destroying object when counter reaches
zero.

pcidev_get() should be used only when you already have a valid pointer
to the object or you are holding lock that protects one of the
lists (domain, pseg or ats) that store pci_dev structs.

pcidev_get() is rarely used directly, because there already are
functions that will provide valid pointer to pci_dev struct:
pci_get_pdev(), pci_get_real_pdev(). They will lock appropriate list,
find needed object and increase its reference counter before returning
to the caller.

Naturally, pci_put() should be called after finishing working with a
received object. This is the reason why this patch have so many
pcidev_put()s and so little pcidev_get()s: existing calls to
pci_get_*() functions now will increase reference counter
automatically, we just need to decrease it back when we finished.

This patch removes "const" qualifier from some pdev pointers because
pcidev_put() technically alters the contents of pci_dev structure.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>

---

v3:
 - Moved in from another patch series
 - Fixed code formatting (tabs -> spaces)
 - Removed erroneous pcidev_put in vga.c
 - Added missing pcidev_put in couple of places
 - removed mention of pci_get_pdev_by_domain()
---
 xen/arch/x86/hvm/vmsi.c                  |   2 +-
 xen/arch/x86/irq.c                       |   4 +
 xen/arch/x86/msi.c                       |  44 +++++++-
 xen/arch/x86/pci.c                       |   3 +
 xen/arch/x86/physdev.c                   |  17 ++-
 xen/common/sysctl.c                      |   7 +-
 xen/drivers/passthrough/amd/iommu_init.c |  12 +-
 xen/drivers/passthrough/amd/iommu_map.c  |   6 +-
 xen/drivers/passthrough/pci.c            | 138 +++++++++++++++--------
 xen/drivers/passthrough/vtd/quirks.c     |   2 +
 xen/drivers/video/vga.c                  |   7 +-
 xen/drivers/vpci/vpci.c                  |  16 ++-
 xen/include/xen/pci.h                    |  18 +++
 13 files changed, 215 insertions(+), 61 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 3cd4923060..8c3d673872 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -914,7 +914,7 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
=20
             spin_unlock(&msix->pdev->vpci->lock);
             process_pending_softirqs();
-            /* NB: we assume that pdev cannot go away for an alive domain.=
 */
+
             if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
                 return -EBUSY;
             if ( pdev->vpci->msix !=3D msix )
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 20150b1c7f..87464d82c8 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2175,6 +2175,7 @@ int map_domain_pirq(
                 msi->entry_nr =3D ret;
                 ret =3D -ENFILE;
             }
+            pcidev_put(pdev);
             goto done;
         }
=20
@@ -2189,6 +2190,7 @@ int map_domain_pirq(
             msi_desc->irq =3D -1;
             msi_free_irq(msi_desc);
             ret =3D -EBUSY;
+            pcidev_put(pdev);
             goto done;
         }
=20
@@ -2273,10 +2275,12 @@ int map_domain_pirq(
             }
             msi_desc->irq =3D -1;
             msi_free_irq(msi_desc);
+            pcidev_put(pdev);
             goto done;
         }
=20
         set_domain_irq_pirq(d, irq, info);
+        pcidev_put(pdev);
         spin_unlock_irqrestore(&desc->lock, flags);
     }
     else
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index d0bf63df1d..91926fce50 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -572,6 +572,10 @@ int msi_free_irq(struct msi_desc *entry)
                         virt_to_fix((unsigned long)entry->mask_base));
=20
     list_del(&entry->list);
+
+    /* Corresponds to pcidev_get() in msi[x]_capability_init()  */
+    pcidev_put(entry->dev);
+
     xfree(entry);
     return 0;
 }
@@ -644,6 +648,7 @@ static int msi_capability_init(struct pci_dev *dev,
             entry[i].msi.mpos =3D mpos;
         entry[i].msi.nvec =3D 0;
         entry[i].dev =3D dev;
+        pcidev_get(dev);
     }
     entry->msi.nvec =3D nvec;
     entry->irq =3D irq;
@@ -703,22 +708,36 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot,=
 u8 func, u8 bir, int vf)
              !num_vf || !offset || (num_vf > 1 && !stride) ||
              bir >=3D PCI_SRIOV_NUM_BARS ||
              !pdev->vf_rlen[bir] )
+        {
+            if ( pdev )
+                pcidev_put(pdev);
             return 0;
+        }
         base =3D pos + PCI_SRIOV_BAR;
         vf -=3D PCI_BDF(bus, slot, func) + offset;
         if ( vf < 0 )
+        {
+            pcidev_put(pdev);
             return 0;
+        }
         if ( stride )
         {
             if ( vf % stride )
+            {
+                pcidev_put(pdev);
                 return 0;
+            }
             vf /=3D stride;
         }
         if ( vf >=3D num_vf )
+        {
+            pcidev_put(pdev);
             return 0;
+        }
         BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) !=3D PCI_SRIOV_NUM_BARS);
         disp =3D vf * pdev->vf_rlen[bir];
         limit =3D PCI_SRIOV_NUM_BARS;
+        pcidev_put(pdev);
     }
     else switch ( pci_conf_read8(PCI_SBDF(seg, bus, slot, func),
                                  PCI_HEADER_TYPE) & 0x7f )
@@ -925,6 +944,8 @@ static int msix_capability_init(struct pci_dev *dev,
         entry->dev =3D dev;
         entry->mask_base =3D base;
=20
+        pcidev_get(dev);
+
         list_add_tail(&entry->list, &dev->msi_list);
         *desc =3D entry;
     }
@@ -999,6 +1020,7 @@ static int __pci_enable_msi(struct msi_info *msi, stru=
ct msi_desc **desc)
 {
     struct pci_dev *pdev;
     struct msi_desc *old_desc;
+    int ret;
=20
     ASSERT(pcidevs_locked());
     pdev =3D pci_get_pdev(NULL, msi->sbdf);
@@ -1010,6 +1032,7 @@ static int __pci_enable_msi(struct msi_info *msi, str=
uct msi_desc **desc)
     {
         printk(XENLOG_ERR "irq %d already mapped to MSI on %pp\n",
                msi->irq, &pdev->sbdf);
+        pcidev_put(pdev);
         return -EEXIST;
     }
=20
@@ -1020,7 +1043,10 @@ static int __pci_enable_msi(struct msi_info *msi, st=
ruct msi_desc **desc)
         __pci_disable_msix(old_desc);
     }
=20
-    return msi_capability_init(pdev, msi->irq, desc, msi->entry_nr);
+    ret =3D msi_capability_init(pdev, msi->irq, desc, msi->entry_nr);
+    pcidev_put(pdev);
+
+    return ret;
 }
=20
 static void __pci_disable_msi(struct msi_desc *entry)
@@ -1054,20 +1080,29 @@ static int __pci_enable_msix(struct msi_info *msi, =
struct msi_desc **desc)
 {
     struct pci_dev *pdev;
     struct msi_desc *old_desc;
+    int ret;
=20
     ASSERT(pcidevs_locked());
     pdev =3D pci_get_pdev(NULL, msi->sbdf);
     if ( !pdev || !pdev->msix )
+    {
+        if ( pdev )
+            pcidev_put(pdev);
         return -ENODEV;
+    }
=20
     if ( msi->entry_nr >=3D pdev->msix->nr_entries )
+    {
+        pcidev_put(pdev);
         return -EINVAL;
+    }
=20
     old_desc =3D find_msi_entry(pdev, msi->irq, PCI_CAP_ID_MSIX);
     if ( old_desc )
     {
         printk(XENLOG_ERR "irq %d already mapped to MSI-X on %pp\n",
                msi->irq, &pdev->sbdf);
+        pcidev_put(pdev);
         return -EEXIST;
     }
=20
@@ -1078,7 +1113,11 @@ static int __pci_enable_msix(struct msi_info *msi, s=
truct msi_desc **desc)
         __pci_disable_msi(old_desc);
     }
=20
-    return msix_capability_init(pdev, msi, desc);
+    ret =3D msix_capability_init(pdev, msi, desc);
+
+    pcidev_put(pdev);
+
+    return ret;
 }
=20
 static void _pci_cleanup_msix(struct arch_msix *msix)
@@ -1159,6 +1198,7 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool =
off)
     }
     else
         rc =3D msix_capability_init(pdev, NULL, NULL);
+    pcidev_put(pdev);
     pcidevs_unlock();
=20
     return rc;
diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index 97b792e578..c1fcdf08d6 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -92,7 +92,10 @@ int pci_conf_write_intercept(unsigned int seg, unsigned =
int bdf,
=20
     pdev =3D pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
     if ( pdev )
+    {
         rc =3D pci_msi_conf_write_intercept(pdev, reg, size, data);
+        pcidev_put(pdev);
+    }
=20
     pcidevs_unlock();
=20
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 2f1d955a96..96214a3d40 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -533,7 +533,14 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(vo=
id) arg)
         pcidevs_lock();
         pdev =3D pci_get_pdev(NULL,
                             PCI_SBDF(0, restore_msi.bus, restore_msi.devfn=
));
-        ret =3D pdev ? pci_restore_msi_state(pdev) : -ENODEV;
+        if ( pdev )
+        {
+            ret =3D pci_restore_msi_state(pdev);
+            pcidev_put(pdev);
+        }
+        else
+            ret =3D -ENODEV;
+
         pcidevs_unlock();
         break;
     }
@@ -548,7 +555,13 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(vo=
id) arg)
=20
         pcidevs_lock();
         pdev =3D pci_get_pdev(NULL, PCI_SBDF(dev.seg, dev.bus, dev.devfn))=
;
-        ret =3D pdev ? pci_restore_msi_state(pdev) : -ENODEV;
+        if ( pdev )
+        {
+            ret =3D  pci_restore_msi_state(pdev);
+            pcidev_put(pdev);
+        }
+        else
+            ret =3D -ENODEV;
         pcidevs_unlock();
         break;
     }
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 02505ab044..9af07fa92a 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -438,7 +438,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_s=
ysctl)
         {
             physdev_pci_device_t dev;
             uint32_t node;
-            const struct pci_dev *pdev;
+            struct pci_dev *pdev;
=20
             if ( copy_from_guest_offset(&dev, ti->devs, i, 1) )
             {
@@ -454,8 +454,11 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_=
sysctl)
                 node =3D XEN_INVALID_NODE_ID;
             else
                 node =3D pdev->node;
-            pcidevs_unlock();
=20
+            if ( pdev )
+                pcidev_put(pdev);
+
+            pcidevs_unlock();
             if ( copy_to_guest_offset(ti->nodes, i, &node, 1) )
             {
                 ret =3D -EFAULT;
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthr=
ough/amd/iommu_init.c
index 9773ccfcb4..f90b1c1e58 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -646,6 +646,7 @@ static void cf_check parse_ppr_log_entry(struct amd_iom=
mu *iommu, u32 entry[])
=20
     if ( pdev )
         guest_iommu_add_ppr_log(pdev->domain, entry);
+    pcidev_put(pdev);
 }
=20
 static void iommu_check_ppr_log(struct amd_iommu *iommu)
@@ -749,6 +750,11 @@ static bool_t __init set_iommu_interrupt_handler(struc=
t amd_iommu *iommu)
     }
=20
     pcidevs_lock();
+    /*
+     * XXX: it is unclear if this device can be removed. Right now
+     * there is no code that clears msi.dev, so no one will decrease
+     * refcount on it.
+     */
     iommu->msi.dev =3D pci_get_pdev(NULL, PCI_SBDF(iommu->seg, iommu->bdf)=
);
     pcidevs_unlock();
     if ( !iommu->msi.dev )
@@ -1274,7 +1280,7 @@ static int __init cf_check amd_iommu_setup_device_tab=
le(
     {
         if ( ivrs_mappings[bdf].valid )
         {
-            const struct pci_dev *pdev =3D NULL;
+            struct pci_dev *pdev =3D NULL;
=20
             /* add device table entry */
             iommu_dte_add_device_entry(&dt[bdf], &ivrs_mappings[bdf]);
@@ -1299,7 +1305,10 @@ static int __init cf_check amd_iommu_setup_device_ta=
ble(
                         pdev->msix ? pdev->msix->nr_entries
                                    : pdev->msi_maxvec);
                 if ( !ivrs_mappings[bdf].intremap_table )
+                {
+                    pcidev_put(pdev);
                     return -ENOMEM;
+                }
=20
                 if ( pdev->phantom_stride )
                 {
@@ -1317,6 +1326,7 @@ static int __init cf_check amd_iommu_setup_device_tab=
le(
                             ivrs_mappings[bdf].intremap_inuse;
                     }
                 }
+                pcidev_put(pdev);
             }
=20
             amd_iommu_set_intremap_table(
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthro=
ugh/amd/iommu_map.c
index 993bac6f88..9d621e3d36 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -724,14 +724,18 @@ int cf_check amd_iommu_get_reserved_device_memory(
         if ( !iommu )
         {
             /* May need to trigger the workaround in find_iommu_for_device=
(). */
-            const struct pci_dev *pdev;
+            struct pci_dev *pdev;
=20
             pcidevs_lock();
             pdev =3D pci_get_pdev(NULL, sbdf);
             pcidevs_unlock();
=20
             if ( pdev )
+            {
                 iommu =3D find_iommu_for_device(seg, bdf);
+                /* XXX: Should we hold pdev reference till end of the loop=
? */
+                pcidev_put(pdev);
+            }
             if ( !iommu )
                 continue;
         }
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index b42acb8d7c..b32382aca0 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -328,6 +328,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg,=
 u8 bus, u8 devfn)
     *((u8*) &pdev->bus) =3D bus;
     *((u8*) &pdev->devfn) =3D devfn;
     pdev->domain =3D NULL;
+    refcnt_init(&pdev->refcnt);
=20
     arch_pci_init_pdev(pdev);
=20
@@ -422,33 +423,6 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg=
, u8 bus, u8 devfn)
     return pdev;
 }
=20
-static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
-{
-    /* update bus2bridge */
-    switch ( pdev->type )
-    {
-        unsigned int sec_bus, sub_bus;
-
-        case DEV_TYPE_PCIe2PCI_BRIDGE:
-        case DEV_TYPE_LEGACY_PCI_BRIDGE:
-            sec_bus =3D pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
-            sub_bus =3D pci_conf_read8(pdev->sbdf, PCI_SUBORDINATE_BUS);
-
-            spin_lock(&pseg->bus2bridge_lock);
-            for ( ; sec_bus <=3D sub_bus; sec_bus++ )
-                pseg->bus2bridge[sec_bus] =3D pseg->bus2bridge[pdev->bus];
-            spin_unlock(&pseg->bus2bridge_lock);
-            break;
-
-        default:
-            break;
-    }
-
-    list_del(&pdev->alldevs_list);
-    pdev_msi_deinit(pdev);
-    xfree(pdev);
-}
-
 static void __init _pci_hide_device(struct pci_dev *pdev)
 {
     if ( pdev->domain )
@@ -517,10 +491,14 @@ struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf)
     {
         if ( !(sbdf.devfn & stride) )
             continue;
+
         sbdf.devfn &=3D ~stride;
         pdev =3D pci_get_pdev(NULL, sbdf);
         if ( pdev && stride !=3D pdev->phantom_stride )
+        {
+            pcidev_put(pdev);
             pdev =3D NULL;
+        }
     }
=20
     return pdev;
@@ -548,13 +526,18 @@ struct pci_dev *pci_get_pdev(const struct domain *d, =
pci_sbdf_t sbdf)
         list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
             if ( pdev->sbdf.bdf =3D=3D sbdf.bdf &&
                  (!d || pdev->domain =3D=3D d) )
+            {
+                pcidev_get(pdev);
                 return pdev;
+            }
     }
     else
         list_for_each_entry ( pdev, &d->pdev_list, domain_list )
             if ( pdev->sbdf.bdf =3D=3D sbdf.bdf )
+            {
+                pcidev_get(pdev);
                 return pdev;
-
+            }
     return NULL;
 }
=20
@@ -663,7 +646,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
                             PCI_SBDF(seg, info->physfn.bus,
                                      info->physfn.devfn));
         if ( pdev )
+        {
             pf_is_extfn =3D pdev->info.is_extfn;
+            pcidev_put(pdev);
+        }
         pcidevs_unlock();
         if ( !pdev )
             pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
@@ -818,7 +804,9 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
             if ( pdev->domain )
                 list_del(&pdev->domain_list);
             printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
-            free_pdev(pseg, pdev);
+            list_del(&pdev->alldevs_list);
+            pdev_msi_deinit(pdev);
+            pcidev_put(pdev);
             break;
         }
=20
@@ -848,7 +836,7 @@ static int deassign_device(struct domain *d, uint16_t s=
eg, uint8_t bus,
     {
         ret =3D iommu_quarantine_dev_init(pci_to_dev(pdev));
         if ( ret )
-           return ret;
+            goto out;
=20
         target =3D dom_io;
     }
@@ -878,6 +866,7 @@ static int deassign_device(struct domain *d, uint16_t s=
eg, uint8_t bus,
     pdev->fault.count =3D 0;
=20
  out:
+    pcidev_put(pdev);
     if ( ret )
         printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",
                d, &PCI_SBDF(seg, bus, devfn), ret);
@@ -1011,7 +1000,10 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 de=
vfn)
             pdev->fault.count >>=3D 1;
         pdev->fault.time =3D now;
         if ( ++pdev->fault.count < PT_FAULT_THRESHOLD )
+        {
+            pcidev_put(pdev);
             pdev =3D NULL;
+        }
     }
     pcidevs_unlock();
=20
@@ -1022,6 +1014,8 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 dev=
fn)
      * control it for us. */
     cword =3D pci_conf_read16(pdev->sbdf, PCI_COMMAND);
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cword & ~PCI_COMMAND_MASTER)=
;
+
+    pcidev_put(pdev);
 }
=20
 /*
@@ -1138,6 +1132,7 @@ static int __hwdom_init cf_check _setup_hwdom_pci_dev=
ices(
                 printk(XENLOG_WARNING "Dom%d owning %pp?\n",
                        pdev->domain->domain_id, &pdev->sbdf);
=20
+            pcidev_put(pdev);
             if ( iommu_verbose )
             {
                 pcidevs_unlock();
@@ -1385,33 +1380,28 @@ static int iommu_remove_device(struct pci_dev *pdev=
)
     return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev(p=
dev));
 }
=20
-static int device_assigned(u16 seg, u8 bus, u8 devfn)
+static int device_assigned(struct pci_dev *pdev)
 {
-    struct pci_dev *pdev;
     int rc =3D 0;
=20
     ASSERT(pcidevs_locked());
-    pdev =3D pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
-
-    if ( !pdev )
-        rc =3D -ENODEV;
     /*
      * If the device exists and it is not owned by either the hardware
      * domain or dom_io then it must be assigned to a guest, or be
      * hidden (owned by dom_xen).
      */
-    else if ( pdev->domain !=3D hardware_domain &&
-              pdev->domain !=3D dom_io )
+    if ( pdev->domain !=3D hardware_domain &&
+         pdev->domain !=3D dom_io )
         rc =3D -EBUSY;
=20
     return rc;
 }
=20
 /* Caller should hold the pcidevs_lock */
-static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 =
flag)
+static int assign_device(struct domain *d, struct pci_dev *pdev, u32 flag)
 {
     const struct domain_iommu *hd =3D dom_iommu(d);
-    struct pci_dev *pdev;
+    uint8_t devfn;
     int rc =3D 0;
=20
     if ( !is_iommu_enabled(d) )
@@ -1422,10 +1412,11 @@ static int assign_device(struct domain *d, u16 seg,=
 u8 bus, u8 devfn, u32 flag)
=20
     /* device_assigned() should already have cleared the device for assign=
ment */
     ASSERT(pcidevs_locked());
-    pdev =3D pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
     ASSERT(pdev && (pdev->domain =3D=3D hardware_domain ||
                     pdev->domain =3D=3D dom_io));
=20
+    devfn =3D pdev->devfn;
+
     /* Do not allow broken devices to be assigned to guests. */
     rc =3D -EBADF;
     if ( pdev->broken && d !=3D hardware_domain && d !=3D dom_io )
@@ -1460,7 +1451,7 @@ static int assign_device(struct domain *d, u16 seg, u=
8 bus, u8 devfn, u32 flag)
  done:
     if ( rc )
         printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
-               d, &PCI_SBDF(seg, bus, devfn), rc);
+               d, &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
     /* The device is assigned to dom_io so mark it as quarantined */
     else if ( d =3D=3D dom_io )
         pdev->quarantine =3D true;
@@ -1595,6 +1586,9 @@ int iommu_do_pci_domctl(
         ASSERT(d);
         /* fall through */
     case XEN_DOMCTL_test_assign_device:
+    {
+        struct pci_dev *pdev;
+
         /* Don't support self-assignment of devices. */
         if ( d =3D=3D current->domain )
         {
@@ -1622,26 +1616,36 @@ int iommu_do_pci_domctl(
         seg =3D machine_sbdf >> 16;
         bus =3D PCI_BUS(machine_sbdf);
         devfn =3D PCI_DEVFN(machine_sbdf);
-
         pcidevs_lock();
-        ret =3D device_assigned(seg, bus, devfn);
+        pdev =3D pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
+        if ( !pdev )
+        {
+            printk(XENLOG_G_INFO "%pp non-existent\n",
+                   &PCI_SBDF(seg, bus, devfn));
+            ret =3D -EINVAL;
+            break;
+        }
+
+        ret =3D device_assigned(pdev);
         if ( domctl->cmd =3D=3D XEN_DOMCTL_test_assign_device )
         {
             if ( ret )
             {
-                printk(XENLOG_G_INFO "%pp already assigned, or non-existen=
t\n",
+                printk(XENLOG_G_INFO "%pp already assigned\n",
                        &PCI_SBDF(seg, bus, devfn));
                 ret =3D -EINVAL;
             }
         }
         else if ( !ret )
-            ret =3D assign_device(d, seg, bus, devfn, flags);
+            ret =3D assign_device(d, pdev, flags);
+
+        pcidev_put(pdev);
         pcidevs_unlock();
         if ( ret =3D=3D -ERESTART )
             ret =3D hypercall_create_continuation(__HYPERVISOR_domctl,
                                                 "h", u_domctl);
         break;
-
+    }
     case XEN_DOMCTL_deassign_device:
         /* Don't support self-deassignment of devices. */
         if ( d =3D=3D current->domain )
@@ -1681,6 +1685,46 @@ int iommu_do_pci_domctl(
     return ret;
 }
=20
+static void release_pdev(refcnt_t *refcnt)
+{
+    struct pci_dev *pdev =3D container_of(refcnt, struct pci_dev, refcnt);
+    struct pci_seg *pseg =3D get_pseg(pdev->seg);
+
+    printk(XENLOG_DEBUG "PCI release device %pp\n", &pdev->sbdf);
+
+    /* update bus2bridge */
+    switch ( pdev->type )
+    {
+        unsigned int sec_bus, sub_bus;
+
+        case DEV_TYPE_PCIe2PCI_BRIDGE:
+        case DEV_TYPE_LEGACY_PCI_BRIDGE:
+            sec_bus =3D pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
+            sub_bus =3D pci_conf_read8(pdev->sbdf, PCI_SUBORDINATE_BUS);
+
+            spin_lock(&pseg->bus2bridge_lock);
+            for ( ; sec_bus <=3D sub_bus; sec_bus++ )
+                pseg->bus2bridge[sec_bus] =3D pseg->bus2bridge[pdev->bus];
+            spin_unlock(&pseg->bus2bridge_lock);
+            break;
+
+        default:
+            break;
+    }
+
+    xfree(pdev);
+}
+
+void pcidev_get(struct pci_dev *pdev)
+{
+    refcnt_get(&pdev->refcnt);
+}
+
+void pcidev_put(struct pci_dev *pdev)
+{
+    refcnt_put(&pdev->refcnt, release_pdev);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough=
/vtd/quirks.c
index fcc8f73e8b..d240da0416 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -429,6 +429,8 @@ static int __must_check map_me_phantom_function(struct =
domain *domain,
         rc =3D domain_context_unmap_one(domain, drhd->iommu, 0,
                                       PCI_DEVFN(dev, 7));
=20
+    pcidev_put(pdev);
+
     return rc;
 }
=20
diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
index 0a03508bee..1049d4da6d 100644
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -114,7 +114,7 @@ void __init video_endboot(void)
         for ( bus =3D 0; bus < 256; ++bus )
             for ( devfn =3D 0; devfn < 256; ++devfn )
             {
-                const struct pci_dev *pdev;
+                struct pci_dev *pdev;
                 u8 b =3D bus, df =3D devfn, sb;
=20
                 pcidevs_lock();
@@ -126,7 +126,11 @@ void __init video_endboot(void)
                                      PCI_CLASS_DEVICE) !=3D 0x0300 ||
                      !(pci_conf_read16(PCI_SBDF(0, bus, devfn), PCI_COMMAN=
D) &
                        (PCI_COMMAND_IO | PCI_COMMAND_MEMORY)) )
+                {
+                    if ( pdev )
+                        pcidev_put(pdev);
                     continue;
+                }
=20
                 while ( b )
                 {
@@ -157,6 +161,7 @@ void __init video_endboot(void)
                            bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
                     pci_hide_device(0, bus, devfn);
                 }
+                pcidev_put(pdev);
             }
     }
=20
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 6d48d496bb..5232f9605b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -317,8 +317,8 @@ static uint32_t merge_result(uint32_t data, uint32_t ne=
w, unsigned int size,
=20
 uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 {
-    const struct domain *d =3D current->domain;
-    const struct pci_dev *pdev;
+    struct domain *d =3D current->domain;
+    struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset =3D 0;
     uint32_t data =3D ~(uint32_t)0;
@@ -332,7 +332,11 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, =
unsigned int size)
     /* Find the PCI dev matching the address. */
     pdev =3D pci_get_pdev(d, sbdf);
     if ( !pdev || !pdev->vpci )
+    {
+        if ( pdev )
+            pcidev_put(pdev);
         return vpci_read_hw(sbdf, reg, size);
+    }
=20
     spin_lock(&pdev->vpci->lock);
=20
@@ -378,6 +382,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, u=
nsigned int size)
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
+    pcidev_put(pdev);
=20
     if ( data_offset < size )
     {
@@ -420,8 +425,8 @@ static void vpci_write_helper(const struct pci_dev *pde=
v,
 void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                 uint32_t data)
 {
-    const struct domain *d =3D current->domain;
-    const struct pci_dev *pdev;
+    struct domain *d =3D current->domain;
+    struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset =3D 0;
     const unsigned long *ro_map =3D pci_get_ro_map(sbdf.seg);
@@ -443,6 +448,8 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsi=
gned int size,
     pdev =3D pci_get_pdev(d, sbdf);
     if ( !pdev || !pdev->vpci )
     {
+        if ( pdev )
+            pcidev_put(pdev);
         vpci_write_hw(sbdf, reg, size, data);
         return;
     }
@@ -483,6 +490,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsi=
gned int size,
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
+    pcidev_put(pdev);
=20
     if ( data_offset < size )
         /* Tailing gap, write the remaining. */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 5975ca2f30..6631643fb1 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -13,6 +13,7 @@
 #include <xen/irq.h>
 #include <xen/pci_regs.h>
 #include <xen/pfn.h>
+#include <xen/refcnt.h>
 #include <asm/device.h>
 #include <asm/numa.h>
=20
@@ -116,6 +117,9 @@ struct pci_dev {
     /* Device misbehaving, prevent assigning it to guests. */
     bool broken;
=20
+    /* Reference counter */
+    refcnt_t refcnt;
+
     enum pdev_type {
         DEV_TYPE_PCI_UNKNOWN,
         DEV_TYPE_PCIe_ENDPOINT,
@@ -160,6 +164,14 @@ void pcidevs_lock(void);
 void pcidevs_unlock(void);
 bool_t __must_check pcidevs_locked(void);
=20
+/*
+ * Acquire and release reference to the given device. Holding
+ * reference ensures that device will not disappear under feet, but
+ * does not guarantee that code has exclusive access to the device.
+ */
+void pcidev_get(struct pci_dev *pdev);
+void pcidev_put(struct pci_dev *pdev);
+
 bool_t pci_known_segment(u16 seg);
 bool_t pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
 int scan_pci_devices(void);
@@ -177,8 +189,14 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn=
);
+
+/*
+ * Next two functions will find a requested device and acquire
+ * reference to it. Use pcidev_put() to release the reference.
+ */
 struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
+
 void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
=20
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg);
--=20
2.39.2

