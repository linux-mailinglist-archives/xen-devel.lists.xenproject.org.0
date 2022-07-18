Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB3F578C92
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 23:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370126.601813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDY5w-0004vC-02; Mon, 18 Jul 2022 21:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370126.601813; Mon, 18 Jul 2022 21:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDY5v-0004oL-P5; Mon, 18 Jul 2022 21:15:59 +0000
Received: by outflank-mailman (input) for mailman id 370126;
 Mon, 18 Jul 2022 21:15:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+2m=XX=epam.com=prvs=91983e950e=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oDY5u-00043p-L5
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 21:15:58 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0366d87-06de-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 23:15:57 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IImA9T005163;
 Mon, 18 Jul 2022 21:15:47 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3hcrm7v72d-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jul 2022 21:15:47 +0000
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
X-Inumbo-ID: d0366d87-06de-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnHiF3xqr0l7KB1cozyYzFptAwsSkKHK5kZHVvJlsRV57uV4DLvpkbI5QTwYqp7QfqhJeUEeqUfSdVX+oeAo3SmB1ZNqsklehINn51dBJTnkNVQuBr3m1Mk9sFxQwb+SRthGfLMCj0PEqTRCEAcl9HCUEVYNNl49AZsFg76RrXG9XZsceXOs3ndKI8DjBQHW8zFN6+LgzrUTgfmcrC+ZADVJ/orT8tQshcgycVuF5h7m2zw4jbYIhYL+/LfHjYM8/B6lPFXtjbpPikiyySwNGcyTzvAEK0mkkIMpWC1lxj9xoCx0WmRYl0fzEjv5BiZ04QG7Y92VVKP/UNDx6VKGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51uIUXejlp+stzTIoouwR0IIpUJyhvl7006kWAxwFuA=;
 b=B1ropvomBBjZOxibwUE6C6140HbQu5bCYX04YOgBMeDgKf9HKLirQMO3sB1bAubjl82Vwtzoada+1mHfTHOPhot3w3LynO7vRFF8rOwXFwzecKZrAua63gYQ3kZV0CYZrR4slNA4Ol/8Xt1108bU4aKy5m2r3LIrRGj7b1oXMqz6uL2Z6Ge3Ni65adXO6ne71fRDBzHEn2qsIG9Zb5sZ3j8FCes71hkkk/Nybvy1EyTTjOd0rIaL/Cf6Z4yJiWOMdpXza9tOlIagDz28R08oN0e9Fker/MWu6ZsjvGKKsKnA8l1PCvyB+VwSpPHUCos9FJUU24W4R7ITGKx59oS+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51uIUXejlp+stzTIoouwR0IIpUJyhvl7006kWAxwFuA=;
 b=mFNZm90s75AAP+RPh1NlQ7a5VcL64OhwoOzNMmVUjyFIuHY1NtAvsAPEYBefAz9nlcy10WZMKGo4CPBuBqWy5e9FfP5BEnQJ+88HnE8PcPBqRUMkmH1HO2Ij7UJAR7uLLDM+8bLm7vtnEevgMjc0JLUAPGazXvH+NQxObfzV3tWp4kT/YtO5yZnsXIhc0RWPPKyKJSe51c9KdfK1ywTIiPjdPhKfSgEKlxUwi9gYremadqqIek5Onh8DoYZ4wAykE8TOEcPdKMvcwSXuk1Bc5c3xKlKgOujReng+mM6CEFeAgdFWkASHk+ifuOb99/yuZNqYXfohdhQRpOFo6JiWEQ==
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
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/4] vpci: use pcidevs locking to protect MMIO handlers
Thread-Topic: [PATCH v2 3/4] vpci: use pcidevs locking to protect MMIO
 handlers
Thread-Index: AQHYmuuJA1lWCBgnj0iqi/IOtvD1PA==
Date: Mon, 18 Jul 2022 21:15:42 +0000
Message-ID: <20220718211521.664729-4-volodymyr_babchuk@epam.com>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.36.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34069ad9-9f6e-407a-ac59-08da6902ac53
x-ms-traffictypediagnostic: VI1PR03MB6288:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 c3xyq5Nx1U+m5MHuIrZ25mx7wNPx+WeGtDmIssKabcrgWhpEI6vwoLZWrTpn4oyVR0Gux/eolqf6cg07QDI3OSop48VZJPeEB58MeEdNETQ8n2MXb5624WlYJ7jHp/CS9zNqd2eU2I3s+Aesle3hEZMKqoeRW2Ns9Z9QtndTIzOxr7BA38sh6HkQZBZQaVPFwjzdqTEHU8YgggrkDCng12I2J5GQyPodV74nOYgjL9skm/XKby5nG8WMBHXUsPYz8s1U8FwEzwL/vemvfqEsbvSg38gwjAF0fs0A2qMOrxGN+zykdPVD5HMSkDUhfnKgP2VjTHWvzyFqAmat1sT22f+nJHCIha3W9MFLehuZUW7WNMow9Xx7Xs46bE/+ZDHqgvGztig9YXhq9SR+TFq1i5v/uf9877vu6jIikH5S+D1jajp5eoeNrSHYD4Pt+Aqs9m96qIa5D9+zHHY92WIk9pRTQmbZZUuvcyiFc6DpGF7osdmXDB3rVPX/2tn0KxNO1dPSIrHqNH663NwR6ERVn3WVAzfuRlorVFrqZHDf1lATUj7ahTrGagA17jhV7KXfY4fb/mlfslcoYgwNz8mXA5uq39V5qzxajfZCb/ZI+nc1+mIn2Wy4URwHrspA/rYXc4XIufprS5arLpu+74XYrz3WVToA7spCsPgdRVu02ic48nGrfQhOwByUtWCf7flMKVepzyAHu+YyZy0l3KBOOcH/OFm/6e5UejSPoWUf2ZyjaQOgjzTseB83IyAFxuM1CNJvxxETaoaPrzibR4GKSDmBxENIE01QUvvO6f0u5ZwPlq2+RwwY2Rj0Hz78URMg6+2AXyfW3Js10iIWNMKBjA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(2906002)(5660300002)(8936002)(36756003)(186003)(4326008)(86362001)(91956017)(64756008)(66946007)(66556008)(8676002)(66446008)(66476007)(76116006)(122000001)(6506007)(478600001)(316002)(2616005)(6512007)(6916009)(26005)(107886003)(54906003)(6486002)(55236004)(1076003)(41300700001)(38070700005)(30864003)(83380400001)(38100700002)(71200400001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?f8TdYz0CSYwwzu6pGaumKlrLp1jRvmzf/2p2T+rZQQ+uS+1Cl2LFg7Ok4x?=
 =?iso-8859-1?Q?+rYyV1xqxg8x8Pgk724RCPILF4rUw55VJABrH0ZwGU7jnaaWDzxqBWuZhC?=
 =?iso-8859-1?Q?JGkWcTILFUw+muBSy0xSBAb6FaSXt2enSYZsc8/4HseIHujm+nBeU0w3n/?=
 =?iso-8859-1?Q?XViss9RoUJ5B511jylfgcy93ezbb+xsF5FmVfv732166O98gwHs/lxlowL?=
 =?iso-8859-1?Q?8t0odY3/lA09Ph7/q1gug8pg6aQxu4+Vpl/XiXMMW+P+m8ckY+5kAxDZnz?=
 =?iso-8859-1?Q?wZg205XM0HNUHFs+fcMnr0Ined1f6rKHrlUqTyd1ICJNDk4u3FChZyBAWN?=
 =?iso-8859-1?Q?jgo+vi0UjNVjqS2PxJ/OarrIFZoiyuSqgqhRJvgULJ1Cjzpnc6JSDZimBs?=
 =?iso-8859-1?Q?/P0p+TjkFZwdxEtp4KwTVv4F9vpNTMV1HWFSi8L3bvqwK67+uuGDx8hwEi?=
 =?iso-8859-1?Q?mGj88Hv4S6nKoT3Tup1CvZfqJ3DE27ma2Ua1m7d/avcXAuW9N86lgsEDNu?=
 =?iso-8859-1?Q?BPVVduVmk/PkosgVXb314Grn52FHkg1PRF7PfQiy8/+ARYQ5vSwn7Rppqb?=
 =?iso-8859-1?Q?JU97WmUc3IBr0znJbti1Yar/4etvjGipoMRiH6oWRnYX85H937FIjrPi7n?=
 =?iso-8859-1?Q?PjfLFtUbxO8g/N6WSqeHLUy3sXFT8dPs3j+G3RdFJYRi+dNerJY6UzwYMf?=
 =?iso-8859-1?Q?wPQ79QZz5j7SReuLZJ8Z2bEmmnbtbz8IkhTQiXcs61OOUfB8pTSIjomXQk?=
 =?iso-8859-1?Q?LxAZYbuY6X47sifKxsB5TunnKqKI1BC7J5SJ5EM1jNDu57Ah80c2Hxk6qj?=
 =?iso-8859-1?Q?fOPdiN8sCC76I4/3uGk4n0AYK5UOBRNxlEaIqBDM3fFGwR+ebluMmTm2dY?=
 =?iso-8859-1?Q?CqlbnxPkEYTV9Po6d9PvgddL2TIHLazH1ikSML/ClYZjQznT9+/Bol9jAR?=
 =?iso-8859-1?Q?JalNGBXD8dKZJMUcVWzkToUBTdi8outmhuV/WXKVhvIf8DAwU5zDmQd5Ll?=
 =?iso-8859-1?Q?QGxpka0y1q//CbapZQXRiazXuotQgst0Y5tM9c9CZQvO5l4B0jjWXjFVER?=
 =?iso-8859-1?Q?gEve8W2D2w7buGITuGk9gXqbDWc7wQroSIj+vv4qEabg90jUhsRxacOUYH?=
 =?iso-8859-1?Q?NYSuKUHdo8VzlcG35zrqL0TfgAi7/Ci50G6pBDRr/P8PXMChkf99y6QdaX?=
 =?iso-8859-1?Q?J+TuIPFYT6HicqoCgrZ0QQYl4zR9F7amWDuXmA4z5HEZhWOiR1abJHrD1Z?=
 =?iso-8859-1?Q?cup/H2pujRccUi/C6kyGXUiQv1BLo0HmgJ/eggImNUd+f2o5PU1MGgZ5+z?=
 =?iso-8859-1?Q?E2Q0L853PZdBNjAuvjknGc01Y0LhvQhIa5i8NC30LijuSjrB1Yb4SkMvcN?=
 =?iso-8859-1?Q?VSDPocG2IbhNOC+KyuSa8+N+kd9r95VEIOQbzhswvaBTfbtc1VBw+08B0Y?=
 =?iso-8859-1?Q?Vf4J0wA6I5bS5rTHHJMCTzriEABOKbEhAVy/45fbx3tA0vJYEwKjID9pF6?=
 =?iso-8859-1?Q?o7wqzTNb0nUz3D9jf721S36Ki69ZBTvHtvuDR02fTW7UcPAOrIaZRWfB6Z?=
 =?iso-8859-1?Q?huzWK8obtpB041tVPQgIcPqI4TyRd4jg4Nw9f5PunbrcBmPyOO7NiqysZj?=
 =?iso-8859-1?Q?oCy3sepBFlzK/JSKYoT7kiSkzJOA5PcDjkQ15M7r4rTxXHueIr4e8qfA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34069ad9-9f6e-407a-ac59-08da6902ac53
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 21:15:42.7893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yEJI410boRtbdSdqHfzpNCr79plULzdsebkneEC2l5Xbr3Cn3kaBEm8AN4rqFt+WLGG3XnlStnmRf1sQ10yHZ6NX/m1nJLGElLvEf9VhFvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6288
X-Proofpoint-GUID: z2sEGbcbuvCAHsJY7GH6nIJoabdoNh6i
X-Proofpoint-ORIG-GUID: z2sEGbcbuvCAHsJY7GH6nIJoabdoNh6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_20,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180089

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

vPCI MMIO handlers are accessing pdevs without protecting this access
with pcidevs_{lock|unlock}. This is not a problem as of now as these
are only used by Dom0. But, towards vPCI is used also for guests, we need
to properly protect pdev and pdev->vpci from being removed while still
in use.

For that use pcidevs_read_{un}lock helpers.

This patch adds ASSERTs in the code to check that the rwlock is taken
and in appropriate mode. Some of such checks require changes to the
initialization of local variables which may be accessed before the
ASSERT checks the locking. For example see init_bars and mask_write.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Since v1:
- move pcidevs_read_{lock|unlock} into patch 1
---
 xen/arch/x86/hvm/vmsi.c   | 24 ++++++++++++++---
 xen/drivers/vpci/header.c | 24 +++++++++++++++--
 xen/drivers/vpci/msi.c    | 21 ++++++++++-----
 xen/drivers/vpci/msix.c   | 55 ++++++++++++++++++++++++++++++++++-----
 xen/drivers/vpci/vpci.c   | 16 +++++++++---
 xen/include/xen/pci.h     |  1 +
 xen/include/xen/vpci.h    |  2 +-
 7 files changed, 121 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index c1ede676d0..3f250f81a4 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -891,10 +891,16 @@ void vpci_msix_arch_init_entry(struct vpci_msix_entry=
 *entry)
     entry->arch.pirq =3D INVALID_PIRQ;
 }
=20
-int vpci_msix_arch_print(const struct vpci_msix *msix)
+int vpci_msix_arch_print(const struct domain *d, const struct vpci_msix *m=
six)
 {
     unsigned int i;
=20
+    /*
+     * FIXME: this is not immediately correct, as the lock can be grabbed
+     * by a different CPU. But this is better then nothing.
+     */
+    ASSERT(pcidevs_read_locked());
+
     for ( i =3D 0; i < msix->max_entries; i++ )
     {
         const struct vpci_msix_entry *entry =3D &msix->entries[i];
@@ -911,11 +917,23 @@ int vpci_msix_arch_print(const struct vpci_msix *msix=
)
         if ( i && !(i % 64) )
         {
             struct pci_dev *pdev =3D msix->pdev;
+            pci_sbdf_t sbdf =3D pdev->sbdf;
=20
             spin_unlock(&msix->pdev->vpci->lock);
+            pcidevs_read_unlock();
+
+            /* NB: we still hold rcu_read_lock(&domlist_read_lock); here. =
*/
             process_pending_softirqs();
-            /* NB: we assume that pdev cannot go away for an alive domain.=
 */
-            if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
+
+            if ( !pcidevs_read_trylock() )
+                return -EBUSY;
+            pdev =3D pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.de=
vfn);
+            /*
+             * FIXME: we may find a re-allocated pdev's copy here.
+             * Even occupying the same address as before. Do our best.
+             */
+            if ( !pdev || (pdev !=3D msix->pdev) || !pdev->vpci ||
+                 !spin_trylock(&pdev->vpci->lock) )
                 return -EBUSY;
             if ( pdev->vpci->msix !=3D msix )
             {
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index a1c928a0d2..e0461b1139 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -142,16 +142,19 @@ bool vpci_process_pending(struct vcpu *v)
         if ( rc =3D=3D -ERESTART )
             return true;
=20
+        pcidevs_read_lock();
         spin_lock(&v->vpci.pdev->vpci->lock);
         /* Disable memory decoding unconditionally on failure. */
         modify_decoding(v->vpci.pdev,
                         rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.c=
md,
                         !rc && v->vpci.rom_only);
         spin_unlock(&v->vpci.pdev->vpci->lock);
+        pcidevs_read_unlock();
=20
         rangeset_destroy(v->vpci.mem);
         v->vpci.mem =3D NULL;
         if ( rc )
+        {
             /*
              * FIXME: in case of failure remove the device from the domain=
.
              * Note that there might still be leftover mappings. While thi=
s is
@@ -159,7 +162,10 @@ bool vpci_process_pending(struct vcpu *v)
              * killed in order to avoid leaking stale p2m mappings on
              * failure.
              */
+            pcidevs_write_lock();
             vpci_remove_device(v->vpci.pdev);
+            pcidevs_write_unlock();
+        }
     }
=20
     return false;
@@ -172,7 +178,16 @@ static int __init apply_map(struct domain *d, const st=
ruct pci_dev *pdev,
     int rc;
=20
     while ( (rc =3D rangeset_consume_ranges(mem, map_range, &data)) =3D=3D=
 -ERESTART )
+    {
+        /*
+         * It's safe to drop and re-acquire the lock in this context
+         * without risking pdev disappearing because devices cannot be
+         * removed until the initial domain has been started.
+         */
+        pcidevs_write_unlock();
         process_pending_softirqs();
+        pcidevs_write_lock();
+    }
     rangeset_destroy(mem);
     if ( !rc )
         modify_decoding(pdev, cmd, false);
@@ -450,10 +465,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
     uint16_t cmd;
     uint64_t addr, size;
     unsigned int i, num_bars, rom_reg;
-    struct vpci_header *header =3D &pdev->vpci->header;
-    struct vpci_bar *bars =3D header->bars;
+    struct vpci_header *header;
+    struct vpci_bar *bars;
     int rc;
=20
+    ASSERT(pcidevs_write_locked());
+
+    header =3D &pdev->vpci->header;
+    bars =3D header->bars;
+
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_NORMAL:
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 8f2b59e61a..d864f740cf 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -184,12 +184,17 @@ static void cf_check mask_write(
=20
 static int cf_check init_msi(struct pci_dev *pdev)
 {
-    uint8_t slot =3D PCI_SLOT(pdev->devfn), func =3D PCI_FUNC(pdev->devfn)=
;
-    unsigned int pos =3D pci_find_cap_offset(pdev->seg, pdev->bus, slot, f=
unc,
-                                           PCI_CAP_ID_MSI);
+    uint8_t slot, func;
+    unsigned int pos;
     uint16_t control;
     int ret;
=20
+    ASSERT(pcidevs_write_locked());
+
+    slot =3D PCI_SLOT(pdev->devfn);
+    func =3D PCI_FUNC(pdev->devfn);
+    pos =3D pci_find_cap_offset(pdev->seg, pdev->bus, slot, func, PCI_CAP_=
ID_MSI);
+
     if ( !pos )
         return 0;
=20
@@ -277,6 +282,9 @@ void vpci_dump_msi(void)
=20
         printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
=20
+        if ( !pcidevs_read_trylock() )
+            continue;
+
         for_each_pdev ( d, pdev )
         {
             const struct vpci_msi *msi;
@@ -310,7 +318,7 @@ void vpci_dump_msi(void)
                 printk("  entries: %u maskall: %d enabled: %d\n",
                        msix->max_entries, msix->masked, msix->enabled);
=20
-                rc =3D vpci_msix_arch_print(msix);
+                rc =3D vpci_msix_arch_print(d, msix);
                 if ( rc )
                 {
                     /*
@@ -318,12 +326,13 @@ void vpci_dump_msi(void)
                      * holding the lock.
                      */
                     printk("unable to print all MSI-X entries: %d\n", rc);
-                    process_pending_softirqs();
-                    continue;
+                    goto pdev_done;
                 }
             }
=20
             spin_unlock(&pdev->vpci->lock);
+ pdev_done:
+            pcidevs_read_unlock();
             process_pending_softirqs();
         }
     }
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index bea0cc7aed..35cc9280f4 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -144,9 +144,13 @@ static struct vpci_msix *msix_find(const struct domain=
 *d, unsigned long addr)
=20
     list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
     {
-        const struct vpci_bar *bars =3D msix->pdev->vpci->header.bars;
+        const struct vpci_bar *bars;
         unsigned int i;
=20
+        if ( !msix->pdev->vpci )
+            continue;
+
+        bars =3D msix->pdev->vpci->header.bars;
         for ( i =3D 0; i < ARRAY_SIZE(msix->tables); i++ )
             if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
                  VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
@@ -158,7 +162,13 @@ static struct vpci_msix *msix_find(const struct domain=
 *d, unsigned long addr)
=20
 static int cf_check msix_accept(struct vcpu *v, unsigned long addr)
 {
-    return !!msix_find(v->domain, addr);
+    int rc;
+
+    pcidevs_read_lock();
+    rc =3D !!msix_find(v->domain, addr);
+    pcidevs_read_unlock();
+
+    return rc;
 }
=20
 static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
@@ -218,17 +228,26 @@ static int cf_check msix_read(
     struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *d=
ata)
 {
     const struct domain *d =3D v->domain;
-    struct vpci_msix *msix =3D msix_find(d, addr);
+    struct vpci_msix *msix;
     const struct vpci_msix_entry *entry;
     unsigned int offset;
=20
     *data =3D ~0ul;
=20
+    pcidevs_read_lock();
+
+    msix =3D msix_find(d, addr);
     if ( !msix )
+    {
+        pcidevs_read_unlock();
         return X86EMUL_RETRY;
+    }
=20
     if ( !access_allowed(msix->pdev, addr, len) )
+    {
+        pcidevs_read_unlock();
         return X86EMUL_OKAY;
+    }
=20
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
@@ -299,6 +318,7 @@ static int cf_check msix_read(
         break;
     }
     spin_unlock(&msix->pdev->vpci->lock);
+    pcidevs_read_unlock();
=20
     return X86EMUL_OKAY;
 }
@@ -307,15 +327,24 @@ static int cf_check msix_write(
     struct vcpu *v, unsigned long addr, unsigned int len, unsigned long da=
ta)
 {
     const struct domain *d =3D v->domain;
-    struct vpci_msix *msix =3D msix_find(d, addr);
+    struct vpci_msix *msix;
     struct vpci_msix_entry *entry;
     unsigned int offset;
=20
+    pcidevs_read_lock();
+
+    msix =3D msix_find(d, addr);
     if ( !msix )
+    {
+        pcidevs_read_unlock();
         return X86EMUL_RETRY;
+    }
=20
     if ( !access_allowed(msix->pdev, addr, len) )
+    {
+        pcidevs_read_unlock();
         return X86EMUL_OKAY;
+    }
=20
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
@@ -351,6 +380,7 @@ static int cf_check msix_write(
             break;
         }
=20
+        pcidevs_read_unlock();
         return X86EMUL_OKAY;
     }
=20
@@ -428,6 +458,7 @@ static int cf_check msix_write(
         break;
     }
     spin_unlock(&msix->pdev->vpci->lock);
+    pcidevs_read_unlock();
=20
     return X86EMUL_OKAY;
 }
@@ -440,9 +471,13 @@ static const struct hvm_mmio_ops vpci_msix_table_ops =
=3D {
=20
 int vpci_make_msix_hole(const struct pci_dev *pdev)
 {
-    struct domain *d =3D pdev->domain;
+    struct domain *d;
     unsigned int i;
=20
+    ASSERT(pcidevs_read_locked());
+
+    d =3D pdev->domain;
+
     if ( !pdev->vpci->msix )
         return 0;
=20
@@ -487,13 +522,19 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
=20
 static int cf_check init_msix(struct pci_dev *pdev)
 {
-    struct domain *d =3D pdev->domain;
-    uint8_t slot =3D PCI_SLOT(pdev->devfn), func =3D PCI_FUNC(pdev->devfn)=
;
+    struct domain *d;
+    uint8_t slot, func;
     unsigned int msix_offset, i, max_entries;
     uint16_t control;
     struct vpci_msix *msix;
     int rc;
=20
+    ASSERT(pcidevs_write_locked());
+
+    d =3D pdev->domain;
+    slot =3D PCI_SLOT(pdev->devfn);
+    func =3D PCI_FUNC(pdev->devfn);
+
     msix_offset =3D pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
                                       PCI_CAP_ID_MSIX);
     if ( !msix_offset )
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index c7a40a2f41..1559763479 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -37,7 +37,9 @@ extern vpci_register_init_t *const __end_vpci_array[];
=20
 void vpci_remove_device(struct pci_dev *pdev)
 {
-    if ( !has_vpci(pdev->domain) )
+    ASSERT(pcidevs_write_locked());
+
+    if ( !has_vpci(pdev->domain) || !pdev->vpci )
         return;
=20
     spin_lock(&pdev->vpci->lock);
@@ -332,10 +334,14 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,=
 unsigned int size)
         return data;
     }
=20
+    pcidevs_read_lock();
     /* Find the PCI dev matching the address. */
     pdev =3D pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
-    if ( !pdev )
+    if ( !pdev || (pdev && !pdev->vpci) )
+    {
+        pcidevs_read_unlock();
         return vpci_read_hw(sbdf, reg, size);
+    }
=20
     spin_lock(&pdev->vpci->lock);
=20
@@ -381,6 +387,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, u=
nsigned int size)
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
+    pcidevs_read_unlock();
=20
     if ( data_offset < size )
     {
@@ -443,9 +450,11 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, uns=
igned int size,
      * Find the PCI dev matching the address.
      * Passthrough everything that's not trapped.
      */
+    pcidevs_read_lock();
     pdev =3D pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
-    if ( !pdev )
+    if ( !pdev || (pdev && !pdev->vpci) )
     {
+        pcidevs_read_unlock();
         vpci_write_hw(sbdf, reg, size, data);
         return;
     }
@@ -486,6 +495,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsi=
gned int size,
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
+    pcidevs_read_unlock();
=20
     if ( data_offset < size )
         /* Tailing gap, write the remaining. */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 052b2ddf9f..c974ebdc94 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -161,6 +161,7 @@ void pcidevs_unlock(void);
 bool __must_check pcidevs_locked(void);
=20
 void pcidevs_read_lock(void);
+int pcidevs_read_trylock(void);
 void pcidevs_read_unlock(void);
 bool __must_check pcidevs_read_locked(void);
=20
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 67c9a0c631..7ab39839ff 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -175,7 +175,7 @@ int __must_check vpci_msix_arch_enable_entry(struct vpc=
i_msix_entry *entry,
 int __must_check vpci_msix_arch_disable_entry(struct vpci_msix_entry *entr=
y,
                                               const struct pci_dev *pdev);
 void vpci_msix_arch_init_entry(struct vpci_msix_entry *entry);
-int vpci_msix_arch_print(const struct vpci_msix *msix);
+int vpci_msix_arch_print(const struct domain *d, const struct vpci_msix *m=
six);
=20
 /*
  * Helper functions to fetch MSIX related data. They are used by both the
--=20
2.36.1

