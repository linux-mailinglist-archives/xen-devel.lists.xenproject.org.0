Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084825A7F9E
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 16:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395689.635566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR9-0004rb-W3; Wed, 31 Aug 2022 14:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395689.635566; Wed, 31 Aug 2022 14:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR9-0004kb-Mm; Wed, 31 Aug 2022 14:11:23 +0000
Received: by outflank-mailman (input) for mailman id 395689;
 Wed, 31 Aug 2022 14:11:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jA7u=ZD=epam.com=prvs=1242718080=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oTOR7-0002bv-S2
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 14:11:22 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8dfbfd1-2936-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 16:11:20 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VBo4G8032537;
 Wed, 31 Aug 2022 14:11:03 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ja427h4rd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 14:11:03 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6301.eurprd03.prod.outlook.com (2603:10a6:800:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 14:10:59 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f%6]) with mapi id 15.20.5566.019; Wed, 31 Aug 2022
 14:10:59 +0000
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
X-Inumbo-ID: c8dfbfd1-2936-11ed-934f-f50d60e1c1bd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGiWyStxJ96eYQkm55zDqFJw0GRO0iQYLfvQE6OqmcZTWWmKiil0WB5ZIdgG9ubUeOCj9U8/ESnCpVYZm3iseR+75r+E9RoxqqVgJjNSnojNxEWHhXCNS+m5NgWAqbMA15DkFHVlgJ3gVwb802PhQXYL0T5vEMdE6pfiYWTR2kpUhxcu8o0+u2iOlEbGSw8tMNKSZQwYMhAZGy9eY+lOCZoSJrBkIhTjBChB/eAN6NFBRQlbCLklX00+slewnNg24htSvKEAx+Dt+MbiK78nRbf/T0t+Dw8KlXePqzEV1Tb3c6NuN4F7POvGG5bczMECO/Zkh/14TSxwkLliJmJU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25h/2px3CnbvvwOgU10bnc4euxiVjUY+0mEFpTjlpHY=;
 b=W+EQP9Q4xZBTySrx+LKwNp26AU7ZRjgnyW/v6k4phljBqbPVVBNA9HVJLEUWzN6WvxfN9rYOqQbVHoEMyE6fgc0dbfr0dAFrjM4mXum54IQ5rIgz5xI8VsGS7gwnClF3ZijWdKnUYlXaTvVMV++AdxCT7Brp9PbwCw4BIooqscnMBsnf0ucRtBp9VJBgSyXO2akrhs1d9naBFBOnNNKS0h3jOTHPme/u/hYTPjfJLdieFptsEW6+zgLz2d1mXGRLYltXtWwMWMZKXVrTg3hn8TOnZDESmEJFCGhzQ5UTd4Z2SvEPQ9oExArCLpjosW4fwrt97SGbptt2i59GGtevFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25h/2px3CnbvvwOgU10bnc4euxiVjUY+0mEFpTjlpHY=;
 b=XZ022wzN7S6uILbrCuuwT00g3JAKildyTTZ52yq4C0b2oKEvEiZy5F7TWlJOXm4rPnYD2yAiw6UCtvZFUl52picBNi8XHzeZach8jWZk91XyxClBloZSiM+yJzw+Q7yC94VvEiIp+yI2TY+/lOrBxnA/9KOR0bVihZHQn1r9knKDZiiAdn8zR3FMPfZE4Qy84bbBGYjdMAPg+6K38RjrVi9irgIcgGk2sZxAKqYto3BmiFtlUeQlBfcJDkBxQ4DmzOBFSalviB0Zp4WVJiysvf2S8CdyMooPEst6iMhEsV6HOOpbmRm3xeL/4oLyrKBCvaUiar4K81VgfzExKrHQdA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Paul Durrant
	<paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Kevin Tian <kevin.tian@intel.com>
Subject: [RFC PATCH 01/10] xen: pci: add per-domain pci list lock
Thread-Topic: [RFC PATCH 01/10] xen: pci: add per-domain pci list lock
Thread-Index: AQHYvUN+sHWq0w//vE+eH46Zd/aTJw==
Date: Wed, 31 Aug 2022 14:10:58 +0000
Message-ID: <20220831141040.13231-2-volodymyr_babchuk@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.37.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11e52c0a-185d-407a-fde0-08da8b5aa0ee
x-ms-traffictypediagnostic: VI1PR03MB6301:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 O6cVO4Wn0KOBsr+G4queNNIxca/x5e3lDSpNf8YZI/CxvhGzF3Ep5hTJKWp0c+zULKaIiLkfQv7TU8LqZP7XKkkfC3YhNCpxxwdOnpkEc1+XsF/IhkU9iQ15LGJXLOOqqRzEtCEw/n8fL7oy2G3YzoDdW5CS6HQsixUGnX+UyXEpG/4Cv/LQBqVJsho8OUSR/7W1VRwvWVNM6wADuN8kW3zoEAN+zz2N93gEP9pme3rtlYwmF17QHxSZKA43gWboRzXrlN4MCxDv2PCmL9asa5jzFJSn+XIlNF5lYS5Ke8+PPdW7LUv6wPYnb24869Nw6GWP6ekNoD5+kfIvGcu5c+x6LKK0bBTblxDlZ/+x3FjNUmz91OcIobTslJcROI01DsJNAdnIw0wALp6PdQtJxOowkRPwQLYnmw7nt5001DbEyjpx6Ss7zDJxycRnbYvoohi4Im0K0zWKJWogiVqbUD3SXdJAcgfzCG9KFOix+IrSBse9DW6lLl2NHEmKH9hPJm7vkwLIKW9HNlJH9M8Q4KFB/B+OuTFA6pQxDUQIuzn7ALebCcndZGWSINBgvYZ0U/CcgMa/lyZTGpeVjCTwBR38Un0J6/xcF6qzLSzYsXupapq9mP8OZ6shOGnG5jsOGbVaf/5a5kMwiiqICh+kATx8xrvdaMhdFgwc5UjwcExOj9PQx5JBL8l6rPQZMDaINdBDFMysO4B2VEpUfMTPlgSzStnoIoMoECoc8ANbVM2jeoncVXetmLgwzekSm8aK/f59i7Ip9MOeQv0ps5rs7g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(4326008)(66556008)(76116006)(66946007)(38070700005)(66476007)(8676002)(2906002)(66446008)(64756008)(54906003)(1076003)(186003)(83380400001)(2616005)(5660300002)(91956017)(7416002)(8936002)(316002)(36756003)(6916009)(30864003)(6486002)(478600001)(71200400001)(86362001)(55236004)(26005)(41300700001)(6512007)(6506007)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?j8B963qYf7prYz6OAn7DZGHoUFazNkkji6ZFWreDgWiJL80elKDkJVUkCH?=
 =?iso-8859-1?Q?d3FE3Z+slL6SGOlzpqAmKfOa+cOCVVBZh0EIIY/5HcN9gmOB1ZTz+bd36r?=
 =?iso-8859-1?Q?gt2Y0NZJuoNWxDgLDo36sWUz7izpvNo3HTUZl1rBJt9YbvVfzIqfUbmn8q?=
 =?iso-8859-1?Q?sSe5CNkQ6XHfPpi+nYMCA9rqgG5rEUerNdZzI+9CKidz9hxKsAJMPJUkE7?=
 =?iso-8859-1?Q?R3h3iE/UAS2sYyE/RDg8RC0bo8XWfTTBeh7papA4Hkjhs8J+yrZ3AgHT9B?=
 =?iso-8859-1?Q?vIV6cFVoq6BGlBQHCwjmq9CAw5F2LkYJ9MeL+UILtrVcZ2mIS00X5tTfYK?=
 =?iso-8859-1?Q?smtT1iPql9GM0EqNea5cuNkqTcriqgN6Y+RShw1pZk0QClEFEdA3oeryMW?=
 =?iso-8859-1?Q?ZDWK3mII18e0r6/1C8fOCri+uDEHxLAgejeXMgoB+++roemiq6goyuJCkK?=
 =?iso-8859-1?Q?asAWOYG0f/fLL1PKMADiv4+clAvY1ouruNAELEGKu09DndnwEFM3/6f1qI?=
 =?iso-8859-1?Q?Vusia1SAD1qBRengakT8jqY2dppAgNstrxFa7BpZlwkULJ7exqFH2a2jvZ?=
 =?iso-8859-1?Q?9e70h99nKqmOBDvCSwu3OCRvt33zbGdclNHkOFLpLHpulLWe4cdHm8cdO3?=
 =?iso-8859-1?Q?XR7vASo9TcKikshUbiXY7pbctzobYJ7OmolHnSebT0cu2+5KeG+K9xSj/F?=
 =?iso-8859-1?Q?W6uNO4+Zbbx/k+nMB2JFkWvu95ZqjjFsISYbsmNJayJ23pcsVlEs5Km4sL?=
 =?iso-8859-1?Q?i/UiB/lrzbpWJQ3tMgHQkqiHQz56LvTX2gdxtjw9eoc9BsVEspSSuuCfkK?=
 =?iso-8859-1?Q?rkiI64y8vxAahK2fVgc/Yt3TdF3GxIiCCSwCPhX9iIhbKb8p+nodFFnLlO?=
 =?iso-8859-1?Q?roEi7vKWekuPcr33huF0KGzOyrq9RE6cp7ibGF19zZsHWOJ6hoicRKB7LS?=
 =?iso-8859-1?Q?dj2yS+AaRQPgqj0PC4p0HSbTQuMZrGSfGcJ3bwN7nH3uWBlpfELXpS/gZO?=
 =?iso-8859-1?Q?KgmKNwwaavsDR2JRt992pxpiSwe85h1cf/roEbubKVf+oYXjAD8I5oivjY?=
 =?iso-8859-1?Q?IigkuQO5WugV/w54J9SOSHnLe9rgD2Uf/AdhlcM9nXm3KvUvFj8Trv6TM0?=
 =?iso-8859-1?Q?POFiZYO6MrrmeyHwba+4qVxb5Wo0XNAG2d7RjBG15hFWdliQh0fm5QGuoe?=
 =?iso-8859-1?Q?WpeMQDt5jW1zlB5BdwSzzq1YOwbKbsY0xxIljMavDlYJmaC35mMB2yidYR?=
 =?iso-8859-1?Q?t3xbTwGrHbL2GOGzORZiVIbWN09A8pId2v418yhMUVDWkPXGSFhy/FbH6v?=
 =?iso-8859-1?Q?8uh0G5PgWbLiV+d0CaVFDtrSsKi41FUFBsJgllDSrH+eAzv+z1DqqDNETA?=
 =?iso-8859-1?Q?uHsKKTouOdONB2f41h/S2UxaE1V4YmeIJJxByjoodJzWHOL/d+4KO108Yf?=
 =?iso-8859-1?Q?xPhzElSyWcM9rXQblaj2XkyeezvPUHgHi3Fwc7SPkyvLpLJ0P8aTaF2yQc?=
 =?iso-8859-1?Q?3zBN4ZAZBG6vq6z4OcniIbKmZfFdI1URMEsqUlO/pmQDdGOqdczkMsjFMT?=
 =?iso-8859-1?Q?Hwt1+oKlAJnpP0INqqxDcbAskVPu/4GIJSK4otPPps3ax/aaZO6kQJT2ey?=
 =?iso-8859-1?Q?zqoLRz2qQbhCPZTLfRGoQ1MP/TP2tTSyPWHM3gk4WK94Mgaj8+XSwwFA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e52c0a-185d-407a-fde0-08da8b5aa0ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:10:58.9056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fd8Z4dAKIksYfLRLWQ4jPRXzhMktFgigUaWYBlilYF70wg0rxCj6n2GPUDtGB+vF8GJm9LdeMjXjVW9cxilT9I+4pfb7wVsMBTSdOfmTnkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6301
X-Proofpoint-GUID: yiKzlP3Rj-7UJUd3WzViieXMPjjVUZ3K
X-Proofpoint-ORIG-GUID: yiKzlP3Rj-7UJUd3WzViieXMPjjVUZ3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208310070

domain->pdevs_lock protects access to domain->pdev_list.
As this, it should be used when we are adding, removing on enumerating
PCI devices assigned to a domain.

This enables more granular locking instead of one huge pcidevs_lock that
locks entire PCI subsystem. Please note that pcidevs_lock() is still
used, we are going to remove it in subsequent patches.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/common/domain.c                         |  1 +
 xen/drivers/passthrough/amd/iommu_cmd.c     |  4 ++-
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  7 ++++-
 xen/drivers/passthrough/pci.c               | 29 ++++++++++++++++++++-
 xen/drivers/passthrough/vtd/iommu.c         |  9 +++++--
 xen/drivers/vpci/header.c                   |  3 +++
 xen/drivers/vpci/msi.c                      |  7 ++++-
 xen/drivers/vpci/vpci.c                     |  4 +--
 xen/include/xen/pci.h                       |  2 +-
 xen/include/xen/sched.h                     |  1 +
 10 files changed, 58 insertions(+), 9 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 7062393e37..4611141b87 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -618,6 +618,7 @@ struct domain *domain_create(domid_t domid,
=20
 #ifdef CONFIG_HAS_PCI
     INIT_LIST_HEAD(&d->pdev_list);
+    spin_lock_init(&d->pdevs_lock);
 #endif
=20
     /* All error paths can depend on the above setup. */
diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthro=
ugh/amd/iommu_cmd.c
index 40ddf366bb..47c45398d4 100644
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -308,11 +308,12 @@ void amd_iommu_flush_iotlb(u8 devfn, const struct pci=
_dev *pdev,
     flush_command_buffer(iommu, iommu_dev_iotlb_timeout);
 }
=20
-static void amd_iommu_flush_all_iotlbs(const struct domain *d, daddr_t dad=
dr,
+static void amd_iommu_flush_all_iotlbs(struct domain *d, daddr_t daddr,
                                        unsigned int order)
 {
     struct pci_dev *pdev;
=20
+    spin_lock(&d->pdevs_lock);
     for_each_pdev( d, pdev )
     {
         u8 devfn =3D pdev->devfn;
@@ -323,6 +324,7 @@ static void amd_iommu_flush_all_iotlbs(const struct dom=
ain *d, daddr_t daddr,
         } while ( devfn !=3D pdev->devfn &&
                   PCI_SLOT(devfn) =3D=3D PCI_SLOT(pdev->devfn) );
     }
+    spin_unlock(&d->pdevs_lock);
 }
=20
 /* Flush iommu cache after p2m changes. */
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/pass=
through/amd/pci_amd_iommu.c
index 4ba8e764b2..64c016491d 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -96,20 +96,25 @@ static int __must_check allocate_domain_resources(struc=
t domain *d)
     return rc;
 }
=20
-static bool any_pdev_behind_iommu(const struct domain *d,
+static bool any_pdev_behind_iommu(struct domain *d,
                                   const struct pci_dev *exclude,
                                   const struct amd_iommu *iommu)
 {
     const struct pci_dev *pdev;
=20
+    spin_lock(&d->pdevs_lock);
     for_each_pdev ( d, pdev )
     {
         if ( pdev =3D=3D exclude )
             continue;
=20
         if ( find_iommu_for_device(pdev->seg, pdev->sbdf.bdf) =3D=3D iommu=
 )
+	{
+	    spin_unlock(&d->pdevs_lock);
             return true;
+	}
     }
+    spin_unlock(&d->pdevs_lock);
=20
     return false;
 }
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index cdaf5c247f..4366f8f965 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -523,7 +523,9 @@ static void __init _pci_hide_device(struct pci_dev *pde=
v)
     if ( pdev->domain )
         return;
     pdev->domain =3D dom_xen;
+    spin_lock(&dom_xen->pdevs_lock);
     list_add(&pdev->domain_list, &dom_xen->pdev_list);
+    spin_unlock(&dom_xen->pdevs_lock);
 }
=20
 int __init pci_hide_device(unsigned int seg, unsigned int bus,
@@ -595,7 +597,7 @@ struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf)
     return pdev;
 }
=20
-struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
+struct pci_dev *pci_get_pdev(struct domain *d, pci_sbdf_t sbdf)
 {
     struct pci_dev *pdev;
=20
@@ -620,9 +622,16 @@ struct pci_dev *pci_get_pdev(const struct domain *d, p=
ci_sbdf_t sbdf)
                 return pdev;
     }
     else
+    {
+        spin_lock(&d->pdevs_lock);
         list_for_each_entry ( pdev, &d->pdev_list, domain_list )
             if ( pdev->sbdf.bdf =3D=3D sbdf.bdf )
+            {
+                spin_unlock(&d->pdevs_lock);
                 return pdev;
+            }
+        spin_unlock(&d->pdevs_lock);
+    }
=20
     return NULL;
 }
@@ -817,7 +826,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     if ( !pdev->domain )
     {
         pdev->domain =3D hardware_domain;
+        spin_lock(&hardware_domain->pdevs_lock);
         list_add(&pdev->domain_list, &hardware_domain->pdev_list);
+        spin_unlock(&hardware_domain->pdevs_lock);
=20
         /*
          * For devices not discovered by Xen during boot, add vPCI handler=
s
@@ -827,7 +838,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         if ( ret )
         {
             printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
+            spin_lock(&pdev->domain->pdevs_lock);
             list_del(&pdev->domain_list);
+            spin_unlock(&pdev->domain->pdevs_lock);
             pdev->domain =3D NULL;
             goto out;
         }
@@ -835,7 +848,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         if ( ret )
         {
             vpci_remove_device(pdev);
+            spin_lock(&pdev->domain->pdevs_lock);
             list_del(&pdev->domain_list);
+            spin_unlock(&pdev->domain->pdevs_lock);
             pdev->domain =3D NULL;
             goto out;
         }
@@ -885,7 +900,11 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
             pci_cleanup_msi(pdev);
             ret =3D iommu_remove_device(pdev);
             if ( pdev->domain )
+            {
+                spin_lock(&pdev->domain->pdevs_lock);
                 list_del(&pdev->domain_list);
+                spin_unlock(&pdev->domain->pdevs_lock);
+            }
             printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
             free_pdev(pseg, pdev);
             break;
@@ -967,12 +986,14 @@ int pci_release_devices(struct domain *d)
         pcidevs_unlock();
         return ret;
     }
+    spin_lock(&d->pdevs_lock);
     list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
     {
         bus =3D pdev->bus;
         devfn =3D pdev->devfn;
         ret =3D deassign_device(d, pdev->seg, bus, devfn) ?: ret;
     }
+    spin_unlock(&d->pdevs_lock);
     pcidevs_unlock();
=20
     return ret;
@@ -1194,7 +1215,9 @@ static int __hwdom_init cf_check _setup_hwdom_pci_dev=
ices(
             if ( !pdev->domain )
             {
                 pdev->domain =3D ctxt->d;
+                spin_lock(&pdev->domain->pdevs_lock);
                 list_add(&pdev->domain_list, &ctxt->d->pdev_list);
+                spin_unlock(&pdev->domain->pdevs_lock);
                 setup_one_hwdom_device(ctxt, pdev);
             }
             else if ( pdev->domain =3D=3D dom_xen )
@@ -1556,6 +1579,7 @@ static int iommu_get_device_group(
         return group_id;
=20
     pcidevs_lock();
+    spin_lock(&d->pdevs_lock);
     for_each_pdev( d, pdev )
     {
         unsigned int b =3D pdev->bus;
@@ -1571,6 +1595,7 @@ static int iommu_get_device_group(
         if ( sdev_id < 0 )
         {
             pcidevs_unlock();
+            spin_unlock(&d->pdevs_lock);
             return sdev_id;
         }
=20
@@ -1581,6 +1606,7 @@ static int iommu_get_device_group(
             if ( unlikely(copy_to_guest_offset(buf, i, &bdf, 1)) )
             {
                 pcidevs_unlock();
+                spin_unlock(&d->pdevs_lock);
                 return -EFAULT;
             }
             i++;
@@ -1588,6 +1614,7 @@ static int iommu_get_device_group(
     }
=20
     pcidevs_unlock();
+    spin_unlock(&d->pdevs_lock);
=20
     return i;
 }
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/=
vtd/iommu.c
index 62e143125d..fff1442265 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -183,12 +183,13 @@ static void cleanup_domid_map(domid_t domid, struct v=
td_iommu *iommu)
     }
 }
=20
-static bool any_pdev_behind_iommu(const struct domain *d,
+static bool any_pdev_behind_iommu(struct domain *d,
                                   const struct pci_dev *exclude,
                                   const struct vtd_iommu *iommu)
 {
     const struct pci_dev *pdev;
=20
+    spin_lock(&d->pdevs_lock);
     for_each_pdev ( d, pdev )
     {
         const struct acpi_drhd_unit *drhd;
@@ -198,8 +199,12 @@ static bool any_pdev_behind_iommu(const struct domain =
*d,
=20
         drhd =3D acpi_find_matched_drhd_unit(pdev);
         if ( drhd && drhd->iommu =3D=3D iommu )
+        {
+            spin_unlock(&d->pdevs_lock);
             return true;
+        }
     }
+    spin_unlock(&d->pdevs_lock);
=20
     return false;
 }
@@ -208,7 +213,7 @@ static bool any_pdev_behind_iommu(const struct domain *=
d,
  * If no other devices under the same iommu owned by this domain,
  * clear iommu in iommu_bitmap and clear domain_id in domid_bitmap.
  */
-static void check_cleanup_domid_map(const struct domain *d,
+static void check_cleanup_domid_map(struct domain *d,
                                     const struct pci_dev *exclude,
                                     struct vtd_iommu *iommu)
 {
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index a1c928a0d2..a59aa7ad0b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -267,6 +267,7 @@ static int modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
      * Check for overlaps with other BARs. Note that only BARs that are
      * currently mapped (enabled) are checked for overlaps.
      */
+    spin_lock(&pdev->domain->pdevs_lock);
     for_each_pdev ( pdev->domain, tmp )
     {
         if ( tmp =3D=3D pdev )
@@ -306,11 +307,13 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
                 printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n=
",
                        start, end, rc);
                 rangeset_destroy(mem);
+                spin_unlock( &pdev->domain->pdevs_lock);
                 return rc;
             }
         }
     }
=20
+    spin_unlock( &pdev->domain->pdevs_lock);
     ASSERT(dev);
=20
     if ( system_state < SYS_STATE_active )
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 8f2b59e61a..8969c335b0 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -265,7 +265,7 @@ REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
=20
 void vpci_dump_msi(void)
 {
-    const struct domain *d;
+    struct domain *d;
=20
     rcu_read_lock(&domlist_read_lock);
     for_each_domain ( d )
@@ -277,6 +277,9 @@ void vpci_dump_msi(void)
=20
         printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
=20
+        if ( !spin_trylock(&d->pdevs_lock) )
+            continue;
+
         for_each_pdev ( d, pdev )
         {
             const struct vpci_msi *msi;
@@ -326,6 +329,8 @@ void vpci_dump_msi(void)
             spin_unlock(&pdev->vpci->lock);
             process_pending_softirqs();
         }
+        spin_unlock(&d->pdevs_lock);
+
     }
     rcu_read_unlock(&domlist_read_lock);
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 3467c0de86..7d1f9fd438 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -312,7 +312,7 @@ static uint32_t merge_result(uint32_t data, uint32_t ne=
w, unsigned int size,
=20
 uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 {
-    const struct domain *d =3D current->domain;
+    struct domain *d =3D current->domain;
     const struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset =3D 0;
@@ -415,7 +415,7 @@ static void vpci_write_helper(const struct pci_dev *pde=
v,
 void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                 uint32_t data)
 {
-    const struct domain *d =3D current->domain;
+    struct domain *d =3D current->domain;
     const struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset =3D 0;
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 5975ca2f30..19047b4b20 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -177,7 +177,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn=
);
-struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
+struct pci_dev *pci_get_pdev(struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
 void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
=20
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1cf629e7ec..0775228ba9 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -457,6 +457,7 @@ struct domain
=20
 #ifdef CONFIG_HAS_PCI
     struct list_head pdev_list;
+    spinlock_t pdevs_lock;
 #endif
=20
 #ifdef CONFIG_HAS_PASSTHROUGH
--=20
2.36.1

