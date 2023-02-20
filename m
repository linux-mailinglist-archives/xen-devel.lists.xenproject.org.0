Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7E169D60F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 23:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498393.769244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUECv-0004iu-L6; Mon, 20 Feb 2023 22:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498393.769244; Mon, 20 Feb 2023 22:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUECv-0004gm-IH; Mon, 20 Feb 2023 22:00:25 +0000
Received: by outflank-mailman (input) for mailman id 498393;
 Mon, 20 Feb 2023 22:00:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HNad=6Q=epam.com=prvs=6415815d8c=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pUECt-0004ga-Fq
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 22:00:23 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f77394f5-b169-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 23:00:20 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31KHFNgi031139; Mon, 20 Feb 2023 22:00:10 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3nv9rbhfh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 22:00:10 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8665.eurprd03.prod.outlook.com (2603:10a6:20b:54b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 22:00:05 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6111.018; Mon, 20 Feb 2023
 22:00:05 +0000
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
X-Inumbo-ID: f77394f5-b169-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jL95iSeVpPlIj4h2pPLYHIU75xPC4rD+o/8oEOzMZKrVV1WyUEENcKdwvDjkO4/FaBfX5b+wfylQfi8uQvgJPKMWfj1FloQDU1TriXORwkZJ59TyJz5UEdq3hrtyTqx6PTzAMZgkUaqg7KFjDhR9qWD+BFDq3OJzjqD1dc9b1IMLPjmlyTaZ8SsoNXrDmQDDxF8dC6+QUZtg+LcAVjlo5lTt5jYb3/qTKnjR38Y9H9NUNGq/HJYuPztxM4CTsrXA7UWZZ/XNcYHvZ4a8Drvv+UBiWndrUNMXTaavdmy2TjMVmsbyo98VsE0fbdfABqfOTdvcxD1puy5NUN51O/iQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aOSaM0ZM3u2/TK3SXUaBtRLWsPbnid5e2gPMLs4NT4=;
 b=V7cLwy52smdgLgRO5O1o6/nTNcQK9qGiBROCok272GbGcNjYhqL1l99AWLK06xviQbg3utYVaX0200dJYhJo8TFfMNZYT/J0wftjAW3Th32zBHIuogr0VhTBX3QDNn5JxpVeEieIN6K4e79KQBdadoqMllmSLv2x0gegWPwL3B7xDKic231xQeB4FWa7/sCSaF9IOvmzD+R7L1p753D7ljdsvBYWjm1pjfiML7tBhjA315TyQkoRP0nR9vTGEVS0vSdCVthN1qSbiLbsOF1v/ZwhMaw0QQDfTwE5h+g3Z5Xlw0jDFwLMdvKewRn8h8i9/iarXDlB3glKzBpmYr/OcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aOSaM0ZM3u2/TK3SXUaBtRLWsPbnid5e2gPMLs4NT4=;
 b=RoIve1tGNBEIBtTbj/0MaPAFuAWTlZ6l5ZIc0p4LUcGG772odIys4IaDfnAEzTZsnEsO1mA1k6IKH8FJKVHeJv5ejJT0To55Dh8swL5AdeAgnSzFHjzsNoemy8cCjwDm2Mqz1rc/wrtNt3H9MJbKL29njPYMyuJwGl1vvnpI+HCKlrrrToIp4Tvi6e4oqMz/AHmOuQoQdfhLd+h+FxT8R35UM/D6gXhVt5Sl3b+jqYNT8fPuoF0MmZwqJ0RwwZooi14qSYVW094b2/omDM+dLsUm+eYOn0KFWFLG1dNh6IRLd4NI9/emQfJm+XZek/jzAfsX/279Z8ydz3rRc7gkZA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>, Paul Durrant <paul@xen.org>,
        Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [RFC PATCH 05/10] xen: pci: introduce reference counting for pdev
Thread-Topic: [RFC PATCH 05/10] xen: pci: introduce reference counting for
 pdev
Thread-Index: AQHYvUN/KKgAm1RVgESUCJeBYUFHMK6yViWAgCcBS4A=
Date: Mon, 20 Feb 2023 22:00:04 +0000
Message-ID: <87mt58yp3w.fsf@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-6-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2301261604370.1978264@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2301261604370.1978264@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8665:EE_
x-ms-office365-filtering-correlation-id: 046ddfb3-4ea6-41ea-0c01-08db138dd2b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 D5NdbonsaZdnLBFtCOZolli77iiYrAggBN/uIJSsXi9jnEyFAV7GfE3YDI5WKSS2Pf9Z05JmjxIBqE1NbRMfuFynLEqKRNm+0yMtMeOtmluBwM4PujmC6VGaTnZygtTt0W+Q3rIHm8pWohAjtHUSwvoxXmA2Ze/+AzAvt3gMNvcP8B1pCWZhSIqzw92EOkeemRZ7ZSMq08hsae/iZzfVscN2I1lJBB+ixCIqc6Cpv/1ayThOQGWfaHbPYi6yFp6KuyyH6C41GBmV5Lntn//5Y2VxXTS16hltQXqtekZ+EH6y1MujHjuDs1zVNhAgPbzTh+a1zpj1B2Nr4mGFz0RbTO8EWgAiwJlvPxdfu9/V59eNXKXv3r3Jfh4m9yUCpA5Z1iLOh0kxPBrStgU1EW4svIOkZXaWeg6d7g93XUAiXawsKA+bKfWrpLCN1JmBKayuWh0Z4mweLjKABsK9DVjgbK+Ys8TmGV3+ev8SRz7+Z4o01emQBpLGz5DgflWl7YbvQ8bRIngGPUboLQrkgsx3FKxSHP61186YkGxnnKdGMu34bSVzlL6sk43qQjUgqVvftMNk/66PC/Tm0gQ6xfrxkaBRn8JH2LP9EZrO6oHnh0Eo15FQNcffjlyZmU1f0Erx/L0jDcNQ1fmc9wMIO2cPH+dlEwQ4JzIE2hItggrWNAC9cgZv6+s+nUzUDk8EftD95O47FRK2M4KqeHk5hKr14w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199018)(8676002)(4326008)(6916009)(64756008)(76116006)(66446008)(66556008)(66946007)(6486002)(66476007)(54906003)(7416002)(316002)(91956017)(8936002)(41300700001)(36756003)(86362001)(38070700005)(71200400001)(478600001)(55236004)(38100700002)(6506007)(186003)(26005)(6512007)(2616005)(2906002)(5660300002)(122000001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?6SDngIJ4bkyYM/5sY7JeNkgGExs9gBMIoscCwbWxhMPWOewQLwH02gfIJV?=
 =?iso-8859-1?Q?od63w11VuAswNFIEMjiOO+9S/yUVCN2sDcvk0SPyCHKf6qW3StZ1eVXs5k?=
 =?iso-8859-1?Q?gcyHWvaQ86nvWeVHiDkBNhvvOAd67/Aj3KuvUnj58Cu0ZafHFbFRaYW3++?=
 =?iso-8859-1?Q?ZG8OA1XiwXNriC12s6KmmEdALs8N6qht84o+ELDpySGkNh7p0deFTJo+eA?=
 =?iso-8859-1?Q?ijdvcFuFmZjwgf9v+DNLKR6L2QYQOGl8eTaJyNhyKncFJyZ9wFKEsVvqnl?=
 =?iso-8859-1?Q?Avs7idOx28QyxzbO5i0wonXKSykrv5fgGuPn9drtQlQiq/hGh1uwjO5+HC?=
 =?iso-8859-1?Q?fw0Inp/ycPY5OMwK5r3DXUpD4WqjRL8q54+4U1U+UEFJQ9eBveHKa4PCbI?=
 =?iso-8859-1?Q?Sol7Uw/HLHEgsGdIPtrxoV0npd2apoXHg2ztLtz4UY+C7dyk+yOzYcGGux?=
 =?iso-8859-1?Q?klTuV3RORIOdYCi68a1pf3290XPsdufSv/rCuBan7ds5Xz7ZFQxj07axNh?=
 =?iso-8859-1?Q?SzUdYx4LRbWVo+cevB7XQe2wxsbi3VLAnZ7f8+I2WKx9rg6cq4t3rggXE+?=
 =?iso-8859-1?Q?vK989WYa30u+f61Z8TXdhfgGU9LHAbkW8TrtDMuozEpOiWAgv20agi5xei?=
 =?iso-8859-1?Q?24ZHWZgF2WHQG5Qi+Xd9Um3HYW3Xko9AMyaCMcqHb74FyOJcd/LklZnZEI?=
 =?iso-8859-1?Q?+VBsxjtCkvMFKdrlLhNbNe+eIMyAJ6JjtpbN4TUSB2+/H7yd3LuKT30SZJ?=
 =?iso-8859-1?Q?RJDbTs84rBLRkJRqesfuqMNrW4hq9Lje7AfsbPYOxddn93nv39KQ3WlhI9?=
 =?iso-8859-1?Q?+v415WL/UMLGMB9S0+jJk4AtUx6/BOTG24EGTNflhCQExYiKBm7GuDQlph?=
 =?iso-8859-1?Q?dQmNxayYcPBjdWdTpISUy7hzLUTIj5N2D+9s8yMFKbKy9j0ZorWpr/Zhbv?=
 =?iso-8859-1?Q?0OgAVzlntoQ366AKprhZi5CiD9+l1s9xREO9E4xjg0mAmF0Vep4mA4Ekyc?=
 =?iso-8859-1?Q?Ct5QCV3xvCRX1blBsdU/kWlT4wO2O0geA9+fCzeBsSiPNuauBu4gFXaYr8?=
 =?iso-8859-1?Q?bLpgPMRrme1JIbXtf2qBvcKKXui71XhdhWZeSUE+dzgGFJOik9sL5/4xpS?=
 =?iso-8859-1?Q?kMO5dlESgO752Bm010sHxySkq//kskMzM/DniVYg2kwGAVsEPr4ywonynm?=
 =?iso-8859-1?Q?aNq4X5kW+juU8aPt0MpYd+kaYVGa9gGB/RMRadG0woPlt9kK0mVdLZL1Gh?=
 =?iso-8859-1?Q?ui9JaLbT9I6Ss5ujWXq3wVMMTYZeS5GcDthZHhtRHsnpewiyhiMYaRYQg2?=
 =?iso-8859-1?Q?toaxTNvFYfTym8CIzDFoMrUCid93HRzC0l3Kak/2bJtfQ0krIkx2Vn14Yx?=
 =?iso-8859-1?Q?q2uAABL1v1NfFsLk/i0kz20q6b8LhBURkGRYrsep9dxzWl6+JA1hcSk3ki?=
 =?iso-8859-1?Q?eGV8qX4iYWe9Kd1Di9pJusEtncbT7Xp2BvyTw6vYFexC8z0rHAIxOlbM4W?=
 =?iso-8859-1?Q?e2AN4s0fyeEhQId7TIw+TdxCoQTCqmio09nsKS5ZhUjlJMjjW2wX1OalTn?=
 =?iso-8859-1?Q?8E4Gj7YUoz5CZ2hXcmfktiJs79fBIUHn68lELnIfpfFi8/NGYkTXgN3/zf?=
 =?iso-8859-1?Q?rU7u9A+Juaexjyl2BFH0OrhwGGW5ME4H/BG/MXMRgZ6+pRluqfo5W+/g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046ddfb3-4ea6-41ea-0c01-08db138dd2b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2023 22:00:04.8813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gY2qal6wdAz+paJ9I+6XkcIaMhEfvhDBCuoMGO2OvMVyKsSCkEjtNHrKzh9Ot2f8j0ZMp0vx9uJ93t1RRByd7qao/pT3F/YQkboJzKwtXvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8665
X-Proofpoint-GUID: OKLpYLnCpIl0r3rmIsJcJLdcnHuIj7yN
X-Proofpoint-ORIG-GUID: OKLpYLnCpIl0r3rmIsJcJLdcnHuIj7yN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_17,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200203


Hi Stefano,

Thank you for the review

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>> Prior to this change, lifetime of pci_dev objects was protected by globa=
l
>> pcidevs_lock(). We are going to get if of this lock, so we need some
>> other mechanism to ensure that those objects will not disappear under
>> feet of code that access them. Reference counting is a good choice as
>> it provides easy to comprehend way to control object lifetime with
>> better granularity than global super lock.
>>=20
>> This patch adds two new helper functions: pcidev_get() and
>> pcidev_put(). pcidev_get() will increase reference counter, while
>> pcidev_put() will decrease it, destroying object when counter reaches
>> zero.
>>=20
>> pcidev_get() should be used only when you already have a valid pointer
>> to the object or you are holding lock that protects one of the
>> lists (domain, pseg or ats) that store pci_dev structs.
>>=20
>> pcidev_get() is rarely used directly, because there already are
>> functions that will provide valid pointer to pci_dev struct:
>> pci_get_pdev() and pci_get_real_pdev(). They will lock appropriate
>> list, find needed object and increase its reference counter before
>> returning to the caller.
>>=20
>> Naturally, pci_put() should be called after finishing working with a
>> received object. This is the reason why this patch have so many
>> pcidev_put()s and so little pcidev_get()s: existing calls to
>> pci_get_*() functions now will increase reference counter
>> automatically, we just need to decrease it back when we finished.
>>=20
>> This patch removes "const" qualifier from some pdev pointers because
>> pcidev_put() technically alters the contents of pci_dev structure.
>>=20
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> tabs everywhere in this patch
>

Oh, yes, sorry. I asked sometime ago, and want to ask again: instead of
adding EMACS magic into each file, we can put one .dir-locals.el file with
basically the same config in xen/ directory. This will accomplish two
things:

 - there will be no need to add EMACS magic strings into each new file

 - the same config will apply to files that do not have magic
   strings. Files with different coding style rules can be filtered by
   code in .dir-locals.el and/or by strategically placed files in
   sub-directories.

I am happy to hear maintainers opinion about this.

>> ---
>>=20
>> - Jan, can I add your Suggested-by tag?
>> ---
>>  xen/arch/x86/hvm/vmsi.c                  |   2 +-
>>  xen/arch/x86/irq.c                       |   4 +
>>  xen/arch/x86/msi.c                       |  41 ++++++-
>>  xen/arch/x86/pci.c                       |   4 +-
>>  xen/arch/x86/physdev.c                   |  17 ++-
>>  xen/common/sysctl.c                      |   5 +-
>>  xen/drivers/passthrough/amd/iommu_init.c |  12 ++-
>>  xen/drivers/passthrough/amd/iommu_map.c  |   6 +-
>>  xen/drivers/passthrough/pci.c            | 131 +++++++++++++++--------
>>  xen/drivers/passthrough/vtd/quirks.c     |   2 +
>>  xen/drivers/video/vga.c                  |  10 +-
>>  xen/drivers/vpci/vpci.c                  |   6 +-
>>  xen/include/xen/pci.h                    |  18 ++++
>>  13 files changed, 201 insertions(+), 57 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
>> index 75f92885dc..7fb1075673 100644
>> --- a/xen/arch/x86/hvm/vmsi.c
>> +++ b/xen/arch/x86/hvm/vmsi.c
>> @@ -912,7 +912,7 @@ int vpci_msix_arch_print(const struct vpci_msix *msi=
x)
>> =20
>>              spin_unlock(&msix->pdev->vpci->lock);
>>              process_pending_softirqs();
>> -            /* NB: we assume that pdev cannot go away for an alive doma=
in. */
>> +
>>              if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
>>                  return -EBUSY;
>>              if ( pdev->vpci->msix !=3D msix )
>> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
>> index cd0c8a30a8..d8672a03e1 100644
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -2174,6 +2174,7 @@ int map_domain_pirq(
>>                  msi->entry_nr =3D ret;
>>                  ret =3D -ENFILE;
>>              }
>> +	    pcidev_put(pdev);
>
> I think it would be better to move pcidev_put just after done:

I'd love to do this, but pdev is declared inside "if" block while "done:"
is outside of this scope. I can move pdev into outer scope if you believe
that it will be better.

[...]

All other comments were taken into account.=

