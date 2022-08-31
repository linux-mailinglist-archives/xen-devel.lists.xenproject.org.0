Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3D95A7F9B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 16:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395687.635548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR7-0004L9-UN; Wed, 31 Aug 2022 14:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395687.635548; Wed, 31 Aug 2022 14:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR7-0004HM-L5; Wed, 31 Aug 2022 14:11:21 +0000
Received: by outflank-mailman (input) for mailman id 395687;
 Wed, 31 Aug 2022 14:11:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jA7u=ZD=epam.com=prvs=1242718080=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oTOR4-0002bw-LM
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 14:11:18 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6d1c12a-2936-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 16:11:17 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VBpHDB027047;
 Wed, 31 Aug 2022 14:11:08 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3j9huk4eny-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 14:11:08 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6301.eurprd03.prod.outlook.com (2603:10a6:800:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 14:11:02 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f%6]) with mapi id 15.20.5566.019; Wed, 31 Aug 2022
 14:11:02 +0000
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
X-Inumbo-ID: c6d1c12a-2936-11ed-82f2-63bd783d45fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZ23+Y3+9yUKXKjciHha9W710G9Cck3NmzkTJfuGUsFUiGNmdGYoifiDnnkZo34vKmR3IDzrvAiPyBZ7ZupQLktvOqebhAGYoQHn4gHQGPe7y0KEUQc16LzaIitciVeFIEhzxwR97jalhFDE6DXyBCyXeRig3n4hQr5xqQMjClHfX7o0T6JDUeJSBAA8yvhJp68KN4MO6KandTMcjrVVSk0GfjmmD4n6yMEMUY9LT9TefmXXmKBkLL4C3aMa8RIEO5Df8o+B/uED9frh0rZfEWblzpou9A+ySJwVmYGFBC2ST3w7d7xhDj5sSuToyl5QDjlV8Kfx9bDOvUrVXiZrdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVkD+a9ezE4I8M7A/v2OpU0OQqIDPY5B20O9xlCtPAM=;
 b=YD/k845QfCnvzNUP/R9BmAR2ShinV6EF1v8LCjDZudBXmjNWxk2iWIeS/qM4RgigEWEXDOqfC8k3l47n8MacU+YgfaRAohTO5+ZDAsZ6LFJsGz/48LV1mhC0l2MRar92SbwqvdK6aLJnwYNqDbenBe0zGDTYm5XgF8zXvuUBePD/HzlqNpWaZ3JGvS1eri7y3lyLKHCcoyLJhrYlmw/W/goXmnIcw5JoWeXfAFmo40d5OeX6qCi0MN88Z94+yg+5cWJAxpNS1tau/VB5tkqtF7FfJw/pc4jj1xm8N7KIA1xpQFQQYj5KVK6Is0yJrcidnyF5Lvm7ObYaIS5j5YxMHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVkD+a9ezE4I8M7A/v2OpU0OQqIDPY5B20O9xlCtPAM=;
 b=bde3LfDGyTj+yjD+/ahrX45K3/FrRyaTMcTIElomTWPIRuMQpR9Iorolq/hFIzXvP1I5kLNEAgYhpY64QmBDN90izq5WMPIaZXK4saeLywFlhCFE4QXWL4ot69JeyEo3nsSVRBd2A2fq2hlj8zw2/cNUaJidmE4VSZXlIpexqtGb5RYVGP29soJBQPEvZzC5zmvaT9bxhXtAKjG1MaGF0llPoNFdxdwibDb4hh+i1sw04E/bh2/Krm4UT4p66+pulmwB7LX82q4qNFPPLBvS8USfcjYZfVoESCKUV/RkAsLuCaQUyz5yOywPke0uOoghogTGXrih8mT+ifkmpk3qQQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George
 Dunlap <george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [RFC PATCH 10/10] [RFC only] xen: pci: remove pcidev_lock() function
Thread-Topic: [RFC PATCH 10/10] [RFC only] xen: pci: remove pcidev_lock()
 function
Thread-Index: AQHYvUOA+LvBLzOTSESi46h0pXBIvw==
Date: Wed, 31 Aug 2022 14:11:02 +0000
Message-ID: <20220831141040.13231-11-volodymyr_babchuk@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.37.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14a91930-f49f-4022-05a2-08da8b5aa2e6
x-ms-traffictypediagnostic: VI1PR03MB6301:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jhjKyxlvzlIeXEyso1XtwYukepwuNYGZA7897hwHzlBTkIYL6mTDCIcYDMRlZQDdI9xYXCBJonOCFMHkUo9EZ0bSlYvFf1MXsk+HHsCNhC7Yvrku4I6l+7D0PmsBi2Ch/T1hszmmHKHmtCgNQmcblKpRKTdv3jnXosZeB5cUhsUTReJgIP112qWqBQqtgW2hr0ZNSWXWuJ/Sxtx4pCrbDHsPEL56USrLFLit+EUTK8xlesQ+HhHx2JH81WsDz4ckWPxKomzCrfUgm0YfFa6ev4JOWxWaGpjxJHMq/6MWOQFDI+Nus+yrURMqukbWD7ZeqUyl3wZhzJsMlr9tm5UF0k5kHfu76bST1f5WpCeRMlw3K8RmNpOOcA4yZFknGbr2yejg7cW9aXFjdoK+2o5Q6e8ouVyp9F1rrkQSFNbdvpVoUDv5HRmR28o4+keyHn6dooPo5K1dmicBKexJq43pgIKJnrgxton9F31hZY5AvGdOgZvfO1nUaMOwECche7Fw1KYNk8GrWHID7AgMCTSs8YnUlaNqAntA2bQpxtZqGcAnxVEMtJPrgX3JDWGkQbsMQFB6WE13fKAEp7aJMIh7jroLv3bm0Cshnr5pf/a9G7kwcZ3O1Oip2H2Yi0xg34pvFuufN7nhGt/TDi93JbmgR/cV3u+xLkcBhcLCxEqMjvh5+1ZL7u+DZElUcuMtoYl6UU37exT1UJzdd0/fYkDV4kgPGcnQibcTBUkGfA9tTqwBaqE1a3hNxr0yd6y9fJsQVtXMH3HsrR9hU086QCwjkkcpbTnUMhRAeUOoADFDijs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(4326008)(66556008)(76116006)(66946007)(38070700005)(66476007)(8676002)(2906002)(66446008)(64756008)(54906003)(1076003)(186003)(83380400001)(2616005)(5660300002)(91956017)(8936002)(316002)(36756003)(6916009)(6486002)(478600001)(71200400001)(86362001)(55236004)(26005)(41300700001)(6512007)(6506007)(122000001)(38100700002)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Uv3RgkJSx4uWVzGl0BAsX42Ja7HbqJuKEsxTnPbjiUD8FRFqj52gDtlJ1y?=
 =?iso-8859-1?Q?ExCvrH7qFP2AQv/MACHRDxoUOMfp2k869IT4eDFjoZjHaYcu5MsJBVCVUf?=
 =?iso-8859-1?Q?kgoBbI49ar0fZFWNlz9UJqRRJ1Kx6xBGBwaQKq47qoHRVsd53aBkEtOHEU?=
 =?iso-8859-1?Q?PeMfWyrja/MEyinfnBLkfL2j1sj79NRAm0s3KKgUVnDANwkssDZrgQC+bt?=
 =?iso-8859-1?Q?0PKqefvCtJNiAGLTGt/P1eH4gkDl19tNGGCUO/pexuxyYjxtxC7uSfN0It?=
 =?iso-8859-1?Q?iZHD9oQYzHqg976+nCW/Q1kw8nAFei3HUbJiDh8D5+IEELFbPE1vjof8yt?=
 =?iso-8859-1?Q?mRmJLPRXxuURVqW8aLG8oEcRrgOqSqJVrfX8Qx5B/ev8E/qKF9x89O4VO2?=
 =?iso-8859-1?Q?cFyt2VW38ha/Nd/60HKvyojGtATYhQJSE6LVxyUkmXoo/q4F1t4bu/FTWW?=
 =?iso-8859-1?Q?wzJ4+DsmHWZ71WgVKc5LqG4e+l/SXZAbP48YQEFg1Ffm+5W1k8CI2DSbWr?=
 =?iso-8859-1?Q?/yHrldOzU3iIaQ34UyTx5MuE1P7IWbjmJZfHBdNm0VVBn09GBXUk30peT3?=
 =?iso-8859-1?Q?Gu1gIgssKcc4w0DEPtGILLZv4xLQBMJUNkJjIFg8tFrawEb0wPXTWpEmdD?=
 =?iso-8859-1?Q?aydK+S8nGN5qH1/dIfAPH79bJcirevOFmjBN0JE3KFYsQIvU2AXb6RI/cT?=
 =?iso-8859-1?Q?B+q3RWAR51VXcJk5rpdAZwtR9ChS2x2cIUYVeq8o4Sh3Cw3ZPEkD+6FIJC?=
 =?iso-8859-1?Q?bb6Gq9ujmmxzmXhmeqWadevv7cEi832nEfULjQBW2hZrILIdSiKSX47/y/?=
 =?iso-8859-1?Q?xixkyYrL8/nuZ9YLkpFouJuc41QV0kpXVnaYJipUydlAIziiHUv/WyhRIb?=
 =?iso-8859-1?Q?EmnCd4ttpWbJF8Jrw+XLtyZEHCLFgtn09nXoPUhxfsgjTsmL0pHBit3LDE?=
 =?iso-8859-1?Q?NrYF46AZvwM9BKgfCi5gegGn4yiYjaTuGBwPiAUlNrcMGV48sui6ps+5Bq?=
 =?iso-8859-1?Q?0h/nV3BxAG4noFFc0vgOPlGiMXF2V0ehbXX0o6+dnxG5gX5DojnyfUTBO+?=
 =?iso-8859-1?Q?YxKzDBsF8xJh5sogGY9J4oMttfxBmqgQwxvCOl8SKjayEZXV6hU8G6J9Df?=
 =?iso-8859-1?Q?BrhLNv0a7ESme79VK2iMJIQomwCNV2o2UMcy0XPFqJf4wnjYO3xT4lvnJ/?=
 =?iso-8859-1?Q?SJwn6cML4pKElWGFWapzuOgGzIWQz5D7Jm87pvdi8het6bfPdlYpSkBBjY?=
 =?iso-8859-1?Q?cghk7fSlxDtrHzonAffqqf/AGx0eEkZqKFkt8gQdPXLAhn9P0gT6qL0gy9?=
 =?iso-8859-1?Q?+vp4X/oH3ultucmZpcuyERquq7A/tzYm6aAJzdjON1cnG4gEvv5PCD0140?=
 =?iso-8859-1?Q?rWT2NuXIWms5mpeK1mznHZXnnegk6eSVji1cAe0u/LZx8hbGlD5TQF1ku+?=
 =?iso-8859-1?Q?PNim+GcBCsZbvvttmAvMnRjU6xuDDKj1GAXLBJJqvuJQjEUQ0MTYfOm+Bs?=
 =?iso-8859-1?Q?8CyL3a0T7HSxulVY2qKmd/s8B3THZ1V2QB9xajbqCExDeSDhUD8uHHen4l?=
 =?iso-8859-1?Q?HdZyqF0JwHTI5DW1FuqH80i6Us/lnt8iCP2Gj+tQSpFmxjMIrr5/qcLIAU?=
 =?iso-8859-1?Q?Bg/AfeW9cTH2U/TKeXlc21nWebgriQu+J7rApDIzUVZ3f5i37jno+JGQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a91930-f49f-4022-05a2-08da8b5aa2e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:11:02.1241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ErxqhRI1nPm6WLenAr0H/D9H1vgTB4mTC0/mxwIMyZPPz/nptBq24fL4y0m+RJlo6tN3HrdExCzMW5csO1WMwYwW8ApNID3Fv4+5SWpxoJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6301
X-Proofpoint-GUID: r4Y87cm6JEYOyOTEqSo4LcqRQvW-t6ib
X-Proofpoint-ORIG-GUID: r4Y87cm6JEYOyOTEqSo4LcqRQvW-t6ib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208310070

This path will be squashed into "xen: pci: remove pcidev_[un]lock[ed]
calls" after we resolve "[RFC only] xen: iommu: remove last
pcidevs_lock() calls in iommu".

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/drivers/passthrough/pci.c | 18 ------------------
 xen/include/xen/pci.h         | 10 ----------
 2 files changed, 28 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index cc62a5aec4..381eba3018 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -50,24 +50,6 @@ struct pci_seg {
         u8 devfn;
     } bus2bridge[MAX_BUSES];
 };
-
-static spinlock_t _pcidevs_lock =3D SPIN_LOCK_UNLOCKED;
-
-void pcidevs_lock(void)
-{
-    spin_lock_recursive(&_pcidevs_lock);
-}
-
-void pcidevs_unlock(void)
-{
-    spin_unlock_recursive(&_pcidevs_lock);
-}
-
-bool_t pcidevs_locked(void)
-{
-    return !!spin_is_locked(&_pcidevs_lock);
-}
-
 static struct radix_tree_root pci_segments;
=20
 static inline struct pci_seg *get_pseg(u16 seg)
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index d0a7339d84..0abc54ea39 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -156,16 +156,6 @@ struct pci_dev {
=20
 #define has_arch_pdevs(d) (!list_empty(&(d)->pdev_list))
=20
-/*
- * The pcidevs_lock protect alldevs_list, and the assignment for the=20
- * devices, it also sync the access to the msi capability that is not
- * interrupt handling related (the mask bit register).
- */
-
-void pcidevs_lock(void);
-void pcidevs_unlock(void);
-bool_t __must_check pcidevs_locked(void);
-
 /*
  * Acquire and release reference to the given device. Holding
  * reference ensures that device will not disappear under feet, but
--=20
2.36.1

