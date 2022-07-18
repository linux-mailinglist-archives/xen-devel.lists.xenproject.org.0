Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87A7578C8F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 23:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370125.601809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDY5v-0004o6-L0; Mon, 18 Jul 2022 21:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370125.601809; Mon, 18 Jul 2022 21:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDY5v-0004kH-Er; Mon, 18 Jul 2022 21:15:59 +0000
Received: by outflank-mailman (input) for mailman id 370125;
 Mon, 18 Jul 2022 21:15:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+2m=XX=epam.com=prvs=91983e950e=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oDY5t-00043p-P7
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 21:15:58 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfd31e8d-06de-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 23:15:56 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IImA9R005163;
 Mon, 18 Jul 2022 21:15:46 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3hcrm7v72d-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jul 2022 21:15:45 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6288.eurprd03.prod.outlook.com (2603:10a6:800:134::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 21:15:42 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::3db3:dad:7bd7:4488]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::3db3:dad:7bd7:4488%7]) with mapi id 15.20.5417.035; Mon, 18 Jul 2022
 21:15:42 +0000
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
X-Inumbo-ID: cfd31e8d-06de-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWeE+wJYWJJrwDHWsMt0I0M6DEXNVrWCgbCZUPtc2jIcH7M9kDuPs4JMi3+R++xIlnT211ZBwGYC7ggerZr2CRR2fnY7iAXlm+uizigD3MANCalXGo53W2cVN/lP/uYCFXVZeNtCUPgc3dtDtQYA6hgDx/XxgwZtkr8PdChfcWoe7Bdb/Mx45ao1frW53lGukUeP4XujT5IwulzQUzXOKEsF7M1c3JgsZC0HFL8E7qjTnYJWEOD/nlqxrViiZDOguiG+tu2Y7ANgNrN+LAFNcbKRF5bpte0uWa0lGzcokVpWkOho2URIU/1fubRjvyASHJCW8xM2h4uNLXTVJqjgCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrfxkv03rMCDP4WEfyDsnkkchTYLXSytKn95yOOQFFk=;
 b=AUBOxrV1zCTx1FZZ+uFs1RMb6gZ2CA7fzYn0OaON6ixOHTn96+/jCKCr3d6w9Wq6tJYz6mxDxgtzyuHVtmsqezayucPKN48CkKDt+iON5ppzZaZ7P1cMlyPa5FOnYsFRqdoaTBAMvXyrkB1pzmA6NB9C82o4wVe7yDIyJlRq5uPt1o3+NpJzDOh/4m10UZIjwqlwyASIMKRAOXwasu71Ov004haKaNgHbBZhIoKiphcVSShtGgM3ztOc2zoWK/C5wie0AYQUI3/QJEkeKOWLd1aqJcBk9fbnFfneMIWBaA7KLjv7cNNI0qr5CWGKdNOlR1Z7y9Vz7nNVjJlfQwv/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrfxkv03rMCDP4WEfyDsnkkchTYLXSytKn95yOOQFFk=;
 b=GiznS+bq9UmTyCb/84UqC7dVFvyhh8Jdsa81hYsIpiHQs3MOtUerHwZtDl9Avrxzf1XiT8WaYTHxr19al1lnNUgjH28gdab2OuQOwcAeG1041g3hg9SZ7vxQo6wwvGf7zkFmsO9He/f761gyrdKo04lEwX1jZbaeAa7HzGxEBbPuwSq6A/CZAZ3oR1fJHagb5WOpa3xGp5k1hg7p5CgZjwm2gfxkD1EHIJBQ6jRzLCxjWjG/N8FgGEcN09igRcIr7Fns02lNFC3ohMuXQr/P970rcwQE62vHTjzhqi4psantt6RzJ8EmsQ5EArKDQmNY9zwMWsAkU3jDt2pHVHviRg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
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
	<paul@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/4] pci: add rwlock to pcidevs_lock machinery
Thread-Topic: [PATCH v2 1/4] pci: add rwlock to pcidevs_lock machinery
Thread-Index: AQHYmuuJlTOCfCU2VEeylMdGd6xTkw==
Date: Mon, 18 Jul 2022 21:15:42 +0000
Message-ID: <20220718211521.664729-2-volodymyr_babchuk@epam.com>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.36.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a871693-0bba-4246-9dd2-08da6902ac02
x-ms-traffictypediagnostic: VI1PR03MB6288:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wpmVIOdDNmSMgAqWHfBSsR9o2XTEriWwO6FVHDMcUKiJuHX3zDk3kmliSYz0LfpeAo9ZOc38CssGN31eLTd0UQyEAhrTjuSigTkj+ackrJSUh8/6/5KJwdHbwMK5P/36pZFLrdWUs8e4GJGdc7G1xGHLGp7PN/kVSkGR2rFC8AMLvvTj/WDE5HrspwroWyXgiX4Emu1pJzEosaDr587qfXvfSxKJpv1AyIYv05Xgyq2gRo92t3yK6jhSrScQCCzWm954dXFn0bTlavn96ETewhRKi3R5JzmHuXfxmZ2TcM4OC6hJi99sICK/WnFDjJLr3h3I+umuUq6ZORsrxfS7HfXMS9eZ5AzZ4U3osdXj2F/1W8O6R+ITtfRO5xqRN8EnhpgTbOEvFFtTy51PYgURpngk2tVE8N1PT7lUn+AvsBYn6171wMe+h9oAkfEQW+let2BLB/fb9WgZNWvmvnCKcyS47iZm8cmPWTotXWza33bQggLLbqYGwA7vH7i4c7OATwiKfn0DM+HYvCQGM1MjisWKR+LY3BqVy9K2LWtHXdKuZ21dAXUpV+GrqQBUCBnQYzWt50B6PgFjreltrqCQbbkyZsRZKbu5//QNSgXFgKCHm6l+EZneWUGA2TEi95CoroTKXs7AB3oTMdSyv/iZuEYyPxCAgAhgPOr9dtJsh20NZNBal+ru7sthQktLre3X6RHXhc8CrJX+LvLa2n3P7uWf5qRR38f5c6ccyFQqQFZcy0u+LEw1i4y9Daoq8Cjf51B9UeI7gLDLTq9R5RteS+z7VmRlGvTkMl8NCDw2HtV/A1ComHnZat5Ic19KrOYI7eX4nvsE2HMCtzweLsCUAg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(2906002)(5660300002)(8936002)(36756003)(186003)(4326008)(86362001)(91956017)(64756008)(66946007)(66556008)(8676002)(66446008)(66476007)(76116006)(122000001)(6506007)(478600001)(316002)(2616005)(6512007)(6916009)(26005)(107886003)(54906003)(6486002)(55236004)(1076003)(41300700001)(38070700005)(30864003)(83380400001)(38100700002)(71200400001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?C7YAgEgWd29Bn7l9BkWaPKqwzZxjOJTknjR6aNkIFqKiDPtVhVXeihDT+w?=
 =?iso-8859-1?Q?7O8fZuG1flrcii9XbePGPvjL5MFxxvVzBz8g6mXJ8zqgYHcAxF4k7CwhJx?=
 =?iso-8859-1?Q?wJTqhmj+GnBq/Lxs9c7M/0mlNERt2KL1Vw9aE3AXq3vPOSrO+FcZ+KuNN0?=
 =?iso-8859-1?Q?zVxBPl0MzE7VwcY0OQ0TThjShqdl1/62Qzo5lPdYzglwvBSMMFIHnQieaV?=
 =?iso-8859-1?Q?9mvBAbcbH9J9xZ0ULs+SrjLTajRBW9gNbG5geg7SSP2H42pn+i1+0TkIEI?=
 =?iso-8859-1?Q?DYkiMGsl03Yyse88FJR4xjQnWA3+wWTKrJax+bGF5YT3MydMM1CQeLpi1j?=
 =?iso-8859-1?Q?LHTlno4EMZ9iF6u4/tUqZ8fJl9RER6D2xBGNOYgTRUBEPI/lNxme8ZP89n?=
 =?iso-8859-1?Q?12FJgWSC7xR21bdoJdZ9BvRGl8V4Sgera4rS5Y7hnSA4A+RRuOlNY3UEDe?=
 =?iso-8859-1?Q?e+BWI5iuC3dqWpuqkw5lydsX03dUbaBM2GKDHHU3PMMTHJG3QdM2wpSKPp?=
 =?iso-8859-1?Q?zdy2b/aaPDExZy9CRRAYwcyNFVm6OCAIKRToLZ+MSAKvRJxNicoTumcTVB?=
 =?iso-8859-1?Q?1+4FDyl2N35G5bxTly94JeX2We+k6GCmhoTVmr/EhtzvQ/J3nsVKEjR3Pg?=
 =?iso-8859-1?Q?F0MafoX2KsLtbgIAdWc87qJWtPGoACFs7OlLCWJCZ9i3DvQRYCbn9Yi0X5?=
 =?iso-8859-1?Q?tUbK8GXJR7TIUKd+e2TLxi5kvp2HCLB45WyzpTDX3gQ+84UQs1Mo8ob4CY?=
 =?iso-8859-1?Q?6i/J730Gg4kDLPkPiil1UQaO7Y03XqTjPOL/YT5JaFcSTMwU9JygtFVXzk?=
 =?iso-8859-1?Q?b9vD+N3QtEjv16i/XyOt4bt6C/y2asTB2IviQiSM8Y5XNArK2IJwv4Y/bN?=
 =?iso-8859-1?Q?Ryp85Lrpzd3qBtUZMfEh4Fu+j4Jg6qLyxkJftEXEeVt3ypwJ2DPnTCoIRD?=
 =?iso-8859-1?Q?Ko8Wdbw6SFFzyZyA2OepRJxF4UcD9owUkr2wdMAUOGaPjQ6insD+yDutQR?=
 =?iso-8859-1?Q?7hHYL8QghFOkwmmqlvOEY5iENQlcgqVrUEM9YANLScYInbiAjuhTP3Ovck?=
 =?iso-8859-1?Q?LRF1P/h2rD4dZfeQ8JAiRT+RVSP2dgNU9JSRCe8DSKDxW8NeSx0tRbB/g2?=
 =?iso-8859-1?Q?eCm9V61FVyJQSurizwZEbMT5PWXug5z+DLWmzhaA5YKTRJ1DiUeJcAnYCu?=
 =?iso-8859-1?Q?PxWov/c2+ef2hwu87mmFVhft7+BtfRR8y6d8l5yAUK8nHEAI/WQ7FSEj5/?=
 =?iso-8859-1?Q?RN0Om5ZsLIORpMyjNiW2KOV27K8lbUj5XcI/hfBZ+wu3iZIUUdTUmmea+T?=
 =?iso-8859-1?Q?6tNQ8Mt0U6KUMSAhHaeY+QMgYfJIr7OpWJx0/AV4EuETgzoZ1+e8eUDCyu?=
 =?iso-8859-1?Q?KbrApTXYeXYjxcIFetNHZvGK020YRy6jCgHqSw0i8AsyCrmHLoHOdBzCtw?=
 =?iso-8859-1?Q?qzDa9vBqaPQWyrUfQMnp4kwLjmTV9t+28MPmOtoJakLYugnwRMIDI9hL+Z?=
 =?iso-8859-1?Q?mxylJlaNzolwtDSGKzbHB7NZvrlTZNxa7zVgA+1omEqkorkHQlQzzwO2Wd?=
 =?iso-8859-1?Q?X3WlOfEFAgqoIF4DY15OTOYnEhg32RXrzYS4GeoRYSLPEygthU9mtGGis/?=
 =?iso-8859-1?Q?BrZw6j3CbRuJGKAaz8cbler5oGmvDYxf1h1f6H8cA5znpAku8vAAHXzg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a871693-0bba-4246-9dd2-08da6902ac02
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 21:15:42.2581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l9XW/h6+XsKHYBkSpQeMJ4bE7wercW/YB7tkhVo24AUPSGhaX5WkbEvowUfEI2OQfw117QAu6zCgj3VE2vwIWJ+hXy7i/yKVFhuPrHn8+WU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6288
X-Proofpoint-GUID: xxKPsVfYVFEv_UacRVeoyWL-kt6yti-L
X-Proofpoint-ORIG-GUID: xxKPsVfYVFEv_UacRVeoyWL-kt6yti-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_20,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180089

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Currently pcidevs lock is a global recursive spinlock which is fine for
the existing use cases. It is used to both protect pdev instances
themselves from being removed while in use and to make sure the update
of the relevant pdev properties is synchronized.

Moving towards vPCI is used for guests this becomes problematic in terms
of lock contention. For example, during vpci_{read|write} the access to
pdev must be protected to prevent pdev disappearing under our feet.
This needs to be done with the help of pcidevs_{lock|unlock}.
On the other hand it is highly undesirable to lock all other pdev accesses
which only use pdevs in read mode, e.g. those which do not remove or
add pdevs.

For the above reasons introduce a read/write lock which will help
preventing locking contentions between pdev readers and writers. This
read/write lock replaces current recursive spinlock.

By default all existing code uses pcidevs_lock() which takes write
lock. This ensures that all existing locking logic stays the same.

To justify this change, replace locks in (V)MSI code with read
locks. This code is a perfect target, as (V)MSI code only requires
that pdevs will not disappear during handling, while (V)MSI state
is protected by own locks.

This is in preparation for vPCI to be used for guests.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Since v1:
- user per CPU variable to track recursive readers and writers
- use read locks in vmsi code
---
 xen/arch/x86/hvm/vmsi.c       | 22 ++++++------
 xen/arch/x86/irq.c            |  8 ++---
 xen/arch/x86/msi.c            | 16 ++++-----
 xen/drivers/passthrough/pci.c | 65 +++++++++++++++++++++++++++++++----
 xen/include/xen/pci.h         | 10 +++++-
 5 files changed, 91 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index d4a8c953e2..c1ede676d0 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -466,7 +466,7 @@ int msixtbl_pt_register(struct domain *d, struct pirq *=
pirq, uint64_t gtable)
     struct msixtbl_entry *entry, *new_entry;
     int r =3D -EINVAL;
=20
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_read_locked());
     ASSERT(spin_is_locked(&d->event_lock));
=20
     if ( !msixtbl_initialised(d) )
@@ -536,7 +536,7 @@ void msixtbl_pt_unregister(struct domain *d, struct pir=
q *pirq)
     struct pci_dev *pdev;
     struct msixtbl_entry *entry;
=20
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_read_locked());
     ASSERT(spin_is_locked(&d->event_lock));
=20
     if ( !msixtbl_initialised(d) )
@@ -682,7 +682,7 @@ static int vpci_msi_update(const struct pci_dev *pdev, =
uint32_t data,
 {
     unsigned int i;
=20
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_read_locked());
=20
     if ( (address & MSI_ADDR_BASE_MASK) !=3D MSI_ADDR_HEADER )
     {
@@ -724,7 +724,7 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const s=
truct pci_dev *pdev)
=20
     ASSERT(msi->arch.pirq !=3D INVALID_PIRQ);
=20
-    pcidevs_lock();
+    pcidevs_read_lock();
     for ( i =3D 0; i < msi->vectors && msi->arch.bound; i++ )
     {
         struct xen_domctl_bind_pt_irq unbind =3D {
@@ -743,7 +743,7 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const s=
truct pci_dev *pdev)
=20
     msi->arch.bound =3D !vpci_msi_update(pdev, msi->data, msi->address,
                                        msi->vectors, msi->arch.pirq, msi->=
mask);
-    pcidevs_unlock();
+    pcidevs_read_unlock();
 }
=20
 static int vpci_msi_enable(const struct pci_dev *pdev, unsigned int nr,
@@ -783,10 +783,10 @@ int vpci_msi_arch_enable(struct vpci_msi *msi, const =
struct pci_dev *pdev,
         return rc;
     msi->arch.pirq =3D rc;
=20
-    pcidevs_lock();
+    pcidevs_read_lock();
     msi->arch.bound =3D !vpci_msi_update(pdev, msi->data, msi->address, ve=
ctors,
                                        msi->arch.pirq, msi->mask);
-    pcidevs_unlock();
+    pcidevs_read_unlock();
=20
     return 0;
 }
@@ -798,7 +798,7 @@ static void vpci_msi_disable(const struct pci_dev *pdev=
, int pirq,
=20
     ASSERT(pirq !=3D INVALID_PIRQ);
=20
-    pcidevs_lock();
+    pcidevs_read_lock();
     for ( i =3D 0; i < nr && bound; i++ )
     {
         struct xen_domctl_bind_pt_irq bind =3D {
@@ -814,7 +814,7 @@ static void vpci_msi_disable(const struct pci_dev *pdev=
, int pirq,
     spin_lock(&pdev->domain->event_lock);
     unmap_domain_pirq(pdev->domain, pirq);
     spin_unlock(&pdev->domain->event_lock);
-    pcidevs_unlock();
+    pcidevs_read_unlock();
 }
=20
 void vpci_msi_arch_disable(struct vpci_msi *msi, const struct pci_dev *pde=
v)
@@ -861,7 +861,7 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry =
*entry,
=20
     entry->arch.pirq =3D rc;
=20
-    pcidevs_lock();
+    pcidevs_read_lock();
     rc =3D vpci_msi_update(pdev, entry->data, entry->addr, 1, entry->arch.=
pirq,
                          entry->masked);
     if ( rc )
@@ -869,7 +869,7 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry =
*entry,
         vpci_msi_disable(pdev, entry->arch.pirq, 1, false);
         entry->arch.pirq =3D INVALID_PIRQ;
     }
-    pcidevs_unlock();
+    pcidevs_read_unlock();
=20
     return rc;
 }
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index de30ee7779..7b4832ffb1 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2156,7 +2156,7 @@ int map_domain_pirq(
         struct pci_dev *pdev;
         unsigned int nr =3D 0;
=20
-        ASSERT(pcidevs_locked());
+        ASSERT(pcidevs_read_locked());
=20
         ret =3D -ENODEV;
         if ( !cpu_has_apic )
@@ -2313,7 +2313,7 @@ int unmap_domain_pirq(struct domain *d, int pirq)
     if ( (pirq < 0) || (pirq >=3D d->nr_pirqs) )
         return -EINVAL;
=20
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_read_locked());
     ASSERT(spin_is_locked(&d->event_lock));
=20
     info =3D pirq_info(d, pirq);
@@ -2907,7 +2907,7 @@ int allocate_and_map_msi_pirq(struct domain *d, int i=
ndex, int *pirq_p,
=20
     msi->irq =3D irq;
=20
-    pcidevs_lock();
+    pcidevs_read_lock();
     /* Verify or get pirq. */
     spin_lock(&d->event_lock);
     pirq =3D allocate_pirq(d, index, *pirq_p, irq, type, &msi->entry_nr);
@@ -2923,7 +2923,7 @@ int allocate_and_map_msi_pirq(struct domain *d, int i=
ndex, int *pirq_p,
=20
  done:
     spin_unlock(&d->event_lock);
-    pcidevs_unlock();
+    pcidevs_read_unlock();
     if ( ret )
     {
         switch ( type )
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 6be81e6c3b..6ce7b5523a 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -613,7 +613,7 @@ static int msi_capability_init(struct pci_dev *dev,
     u8 slot =3D PCI_SLOT(dev->devfn);
     u8 func =3D PCI_FUNC(dev->devfn);
=20
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_read_locked());
     pos =3D pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSI);
     if ( !pos )
         return -ENODEV;
@@ -782,7 +782,7 @@ static int msix_capability_init(struct pci_dev *dev,
     if ( !pos )
         return -ENODEV;
=20
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_read_locked());
=20
     control =3D pci_conf_read16(dev->sbdf, msix_control_reg(pos));
     /*
@@ -999,7 +999,7 @@ static int __pci_enable_msi(struct msi_info *msi, struc=
t msi_desc **desc)
     struct pci_dev *pdev;
     struct msi_desc *old_desc;
=20
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_read_locked());
     pdev =3D pci_get_pdev(msi->seg, msi->bus, msi->devfn);
     if ( !pdev )
         return -ENODEV;
@@ -1054,7 +1054,7 @@ static int __pci_enable_msix(struct msi_info *msi, st=
ruct msi_desc **desc)
     struct pci_dev *pdev;
     struct msi_desc *old_desc;
=20
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_read_locked());
     pdev =3D pci_get_pdev(msi->seg, msi->bus, msi->devfn);
     if ( !pdev || !pdev->msix )
         return -ENODEV;
@@ -1145,7 +1145,7 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool =
off)
     if ( !use_msi )
         return 0;
=20
-    pcidevs_lock();
+    pcidevs_read_lock();
     pdev =3D pci_get_pdev(seg, bus, devfn);
     if ( !pdev )
         rc =3D -ENODEV;
@@ -1158,7 +1158,7 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool =
off)
     }
     else
         rc =3D msix_capability_init(pdev, NULL, NULL);
-    pcidevs_unlock();
+    pcidevs_read_unlock();
=20
     return rc;
 }
@@ -1169,7 +1169,7 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool =
off)
  */
 int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
 {
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_read_locked());
=20
     if ( !use_msi )
         return -EPERM;
@@ -1305,7 +1305,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
     unsigned int type =3D 0, pos =3D 0;
     u16 control =3D 0;
=20
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_read_locked());
=20
     if ( !use_msi )
         return -EOPNOTSUPP;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 938821e593..f93922acc8 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -50,21 +50,74 @@ struct pci_seg {
     } bus2bridge[MAX_BUSES];
 };
=20
-static spinlock_t _pcidevs_lock =3D SPIN_LOCK_UNLOCKED;
+static DEFINE_RWLOCK(_pcidevs_rwlock);
+static DEFINE_PER_CPU(unsigned int, pcidevs_read_cnt);
+static DEFINE_PER_CPU(unsigned int, pcidevs_write_cnt);
=20
 void pcidevs_lock(void)
 {
-    spin_lock_recursive(&_pcidevs_lock);
+    pcidevs_write_lock();
 }
=20
 void pcidevs_unlock(void)
 {
-    spin_unlock_recursive(&_pcidevs_lock);
+    pcidevs_write_unlock();
 }
=20
-bool_t pcidevs_locked(void)
+bool pcidevs_locked(void)
 {
-    return !!spin_is_locked(&_pcidevs_lock);
+    return pcidevs_write_locked();
+}
+
+void pcidevs_read_lock(void)
+{
+    if ( this_cpu(pcidevs_read_cnt)++ =3D=3D 0 )
+        read_lock(&_pcidevs_rwlock);
+}
+
+int pcidevs_read_trylock(void)
+{
+    int ret =3D 1;
+
+    if ( this_cpu(pcidevs_read_cnt) =3D=3D 0 )
+        ret =3D read_trylock(&_pcidevs_rwlock);
+    if ( ret )
+        this_cpu(pcidevs_read_cnt)++;
+
+    return ret;
+}
+
+void pcidevs_read_unlock(void)
+{
+    ASSERT(this_cpu(pcidevs_read_cnt));
+
+    if ( --this_cpu(pcidevs_read_cnt) =3D=3D 0 )
+        read_unlock(&_pcidevs_rwlock);
+}
+
+bool pcidevs_read_locked(void)
+{
+    /* Write lock implies read lock */
+    return this_cpu(pcidevs_read_cnt) || this_cpu(pcidevs_write_cnt);
+}
+
+void pcidevs_write_lock(void)
+{
+    if ( this_cpu(pcidevs_write_cnt)++ =3D=3D 0 )
+        write_lock(&_pcidevs_rwlock);
+}
+
+void pcidevs_write_unlock(void)
+{
+    ASSERT(this_cpu(pcidevs_write_cnt));
+
+    if ( --this_cpu(pcidevs_write_cnt) =3D=3D 0 )
+        write_unlock(&_pcidevs_rwlock);
+}
+
+bool pcidevs_write_locked(void)
+{
+    return rw_is_write_locked(&_pcidevs_rwlock);
 }
=20
 static struct radix_tree_root pci_segments;
@@ -581,7 +634,7 @@ struct pci_dev *pci_get_pdev(int seg, int bus, int devf=
n)
     struct pci_seg *pseg =3D get_pseg(seg);
     struct pci_dev *pdev =3D NULL;
=20
-    ASSERT(pcidevs_locked());
+    ASSERT(pcidevs_read_locked());
     ASSERT(seg !=3D -1 || bus =3D=3D -1);
     ASSERT(bus !=3D -1 || devfn =3D=3D -1);
=20
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index f34368643c..052b2ddf9f 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -158,7 +158,15 @@ struct pci_dev {
=20
 void pcidevs_lock(void);
 void pcidevs_unlock(void);
-bool_t __must_check pcidevs_locked(void);
+bool __must_check pcidevs_locked(void);
+
+void pcidevs_read_lock(void);
+void pcidevs_read_unlock(void);
+bool __must_check pcidevs_read_locked(void);
+
+void pcidevs_write_lock(void);
+void pcidevs_write_unlock(void);
+bool __must_check pcidevs_write_locked(void);
=20
 bool_t pci_known_segment(u16 seg);
 bool_t pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
--=20
2.36.1

