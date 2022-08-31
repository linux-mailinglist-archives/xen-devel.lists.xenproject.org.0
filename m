Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ED95A7F9A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 16:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395690.635578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTORB-00054W-7G; Wed, 31 Aug 2022 14:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395690.635578; Wed, 31 Aug 2022 14:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTORA-0004u6-Ib; Wed, 31 Aug 2022 14:11:24 +0000
Received: by outflank-mailman (input) for mailman id 395690;
 Wed, 31 Aug 2022 14:11:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jA7u=ZD=epam.com=prvs=1242718080=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oTOR8-0002bv-HB
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 14:11:22 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8a5b30f-2936-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 16:11:20 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VBo4GF032537;
 Wed, 31 Aug 2022 14:11:08 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ja427h4rd-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 14:11:08 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6301.eurprd03.prod.outlook.com (2603:10a6:800:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 14:11:01 +0000
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
X-Inumbo-ID: c8a5b30f-2936-11ed-934f-f50d60e1c1bd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BylhPzfMiZD/a3ix4uXkaPyXO2X3+A4M8LLD/FrCC5n455S/y5awC784zdtc4QDGC969dPhCvf9v6CsBUKVPphMBBUhBSZY/Lua4mr+L1/mbbt+R1LVWGfvnu987g9yJQY8F635tZBwXFBDSIPvYuU+ogo7TPQYJlCY7qI1niG5atLrUrJzJfSvFyArAtbmUj1PVMY46iKTdLe7mHoi2SfFQTKYj3UiuJlIfGnqN7JcMBK2yRwXxun5Rb4C9AJdBiwCkwoJk5XWMI0YdD9Qh2TqBP6bcPTqlBjlH9XcGwthXU7wuY+60FHLAm1xe2FlLWxsYRJIPmNN+JG0NL4Xqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiizKjLCyBEAFE8BknfyWCXpKCtSOHBlrRlnh2irPYc=;
 b=CJXfYLGxTiE7nZ/3XDUXjQZi10iID28k4aA3glU1mdyrg5ZBB5NslWilecEntzy8LCpBw7Oa5LcbFwqbWkpr2T+1wEfUJit4XPSj+10ZDIXqHjaAV7fdu65xwYDopo1GgUszPLpgOOXS3hfEmcY82ZpKS9kvPKiPSCdeF3uQGFOmpIXWnk/8ukxVwQN5xZkhNmIX3hsXsTBXjqpLfGvlgbdkO9+DwXZq1J0KEML+00xWoNRmvZorqhtt7CQtrDgSckK+f7JbWaKDFvOlJv8stZebpir2Mt9H3iH9/0nP+RfqmxOzuA4JuFWxojmnAQAz02SchXuMkgN2jpUA5ALI0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiizKjLCyBEAFE8BknfyWCXpKCtSOHBlrRlnh2irPYc=;
 b=rnA3SGKVZ6CjI2yzG8Zo6giGzXYWPfCAGw1PGRDpErlajt6xXe1AbBVQq1AjJbV6/gTW5Q0im23kwxxQFxluVKX7U2jYr/HW+MJ8QRsBPjWxVaL3TDDDrHPrJNfU0VpygEYGT8P+A44V8ap/T4UiepZOECk5Qn3agas13lQKwN3D9YAMMt4sEdzpvJI7VzzYtx/UYMvDNw19rLmZU0x50KTalu+wcVacd0quKeeJ7IKPFYosnjSaQqa3x2jz3x1vfKhOvWa7golH8Az5cadabLKAPB+vab+ySdtpb/vQG3H0TXzPSH+qJgFUcPCNkJGluP2hPHszwXwTDrgpRr9PIA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich <jbeulich@suse.com>,
        Andrew
 Cooper <andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [RFC PATCH 08/10] xen: pci: remove pcidev_[un]lock[ed] calls
Thread-Topic: [RFC PATCH 08/10] xen: pci: remove pcidev_[un]lock[ed] calls
Thread-Index: AQHYvUN/BRbyNewJG0OqhFjBUWUt7Q==
Date: Wed, 31 Aug 2022 14:11:01 +0000
Message-ID: <20220831141040.13231-9-volodymyr_babchuk@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.37.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43e7eaa6-475c-4549-5b42-08da8b5aa278
x-ms-traffictypediagnostic: VI1PR03MB6301:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fY4dwPhqrYUvR6va25FXVt+QM+VZvdj/8671K3X8ygBNS8GyBFVd4Tnb0eYZ13rFfQ82xwWmtgEOKJDUOnW99KAkYnIiN0wz6F+ZLVFxQiZH4fGc8XYq6aTxo8DYjF6oMioMyXetZvfhhLGnSfTqYvMDKUQoxeTj8KpxsMtQHWkCtKfBOU6AimMOfzRnNFZqBHeo0GW1hrnNHDqKXujxBD0k6hz6/DE2xuKIyq3QiMXhrm46Bu/repkzaXY5rlwFB0ZPqQAqmhfiW8IXuII7u8e/PYbgYyB5e2X/WJ1v9SwNq1/JCkbBNock2S/J6XxGgKXoe7xSt043PGK/0RFPE8C2ScQYEq/GTvfCJJ/1pplRTGeU1FU3yImC0zqRfMM1rWcbW+lH4tWVdpRwsub7bArMoMwuNBx0w+LvE0S9aqLQSV96FW2qOf1YMK2BLB1XpdFosZR5YvPD4AqM9gQpM3GwJThWMKeKEXAOIK8K6SGt77poFnuxUOjge9RRUtXa4y6YgrIUdgRs6nCiBlLvQ9A36ahoVt96lhwOlGkNHgEaj0M0y+tMeSI/DDlQk9H6K/pynev29HI9Zl7Gc3N3pjurEoiOiFpYIBsbjj/aRhxXlzuuefnzpB8iG/3kgy2g9tcOR6ubl+P1NDInzdADLoALvADaxcFaQ8hElezNJW+J7pX+nDMH+etidJm6nwjgH9Vb5TzQXbnpb46Tc4p1r98jfkAj+AGBaRlxbqVE+tCBD5GsLNG7wexAH3VrclRzBPeyjO9O9/hTlSRDnv4otYKKXiTkTID2bl1qTCyOg7s=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(4326008)(66556008)(76116006)(66946007)(38070700005)(66476007)(8676002)(2906002)(66446008)(64756008)(54906003)(1076003)(186003)(83380400001)(2616005)(5660300002)(91956017)(7416002)(8936002)(316002)(36756003)(6916009)(30864003)(6486002)(478600001)(71200400001)(86362001)(55236004)(26005)(41300700001)(6512007)(6506007)(122000001)(38100700002)(21314003)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?i4WCKy2gPNX2cRjthJVXDpyy1ku0SH2n0McEZn93mJlYxXtEwFeZ5ObNqm?=
 =?iso-8859-1?Q?4Ixgl9gRE+mRGUC7vql0i+e7Kli/FvFFQFieUSZiPd63uzwKM3GTzSLPcQ?=
 =?iso-8859-1?Q?S+bsbUCPbZzbZzymXEl6FqY5joWgyGfLGbP/f1TZOQOyL63L4ynjLAfx+E?=
 =?iso-8859-1?Q?nEeZQX/tlrYGXTR/U580FxvZt6VSRQG7nTBtASmvINhpKYgKQmk6gqPh4p?=
 =?iso-8859-1?Q?7szYh4WJJPLgvYCeYpUUrgFfF91EPXV9lDheIl5RikH+/hT8G9XwynH24L?=
 =?iso-8859-1?Q?sy+RqiMBbLpFEMr0qzFCF7LLejGocbQ/v2PrXyc5MxQsc/2MAiu7MrObva?=
 =?iso-8859-1?Q?WREpGLlMM6LkBq/U3b0P8iQI7ABglN3NahRMPNv5WzwO2x1VoD8W4c6neY?=
 =?iso-8859-1?Q?k9bRfYomU2o9f8fLUzLpQ6JGnl/qaFgCFhenF0DCtTqTec68fmpyfp/doD?=
 =?iso-8859-1?Q?1OqqJ1KfGuKzv3U6rYanmELLJgEh5weFSuVq6GDCr2CSctS3lLTjQWxgr2?=
 =?iso-8859-1?Q?PEk+vXyKXKapAAdL6Pz6O01AYjOUJCy5ekc2TfsObEmgkVXoexTSOWL2Yg?=
 =?iso-8859-1?Q?n92ZRcwb1ZEnvcExVAZAzjkulNoKhEzXGGyAKPCuRMtQ0KNj+4DyObgUaI?=
 =?iso-8859-1?Q?4CBcQAodfFLsycqels3ymWQSnp7PfzpNlXd4D2KGyMX9h8C8G02wnkk7ox?=
 =?iso-8859-1?Q?DbS/hq/4RgKdvCNH+Q7Z/Q3kaYcYxEVRKyCrQ97Ncr3/hjyJpmGiXMEDHR?=
 =?iso-8859-1?Q?pNYQWMUuTyW5J6k8LSL1u5ZlrSNJmecCrymadyFDoJZqnryDrKE5X3mkzu?=
 =?iso-8859-1?Q?ZboSPUn5sllnELu5Fn7Kqy50sFq8tRHb9f/K7TWOwtkTfrhR0sAqk9Okmt?=
 =?iso-8859-1?Q?VHv0HDhmjnOriteBqblujvHXMALW9RVok90wr0YJixOADqAE0/ExIb+Dje?=
 =?iso-8859-1?Q?IpF6XmycKVjL62ah3CiWfVvLwUsmVY8660pweR9a/CJXLEPrI6N+O7GWKv?=
 =?iso-8859-1?Q?mH0XkHcgGYi8Hv0WPDx9x0pN5QTZrjsbfPH+EtQdKKiBZbwQb26L9tQgCw?=
 =?iso-8859-1?Q?jum8HzGvv4YBk58D721CLLYjXx5ukKSnt3sW4d/0vXH0YJW5Vsqm1fvHB/?=
 =?iso-8859-1?Q?tuV6EFKmC9pHjVP25EpoIuOUvIih+fGsgh6+3wqgux2w2saxjtlZ8Ib9vt?=
 =?iso-8859-1?Q?Y9gi3ujmrp7qmBbS9ajV+4nTLD+1Rf7fIZWP74rXlYhV4MbOABfHu8siQg?=
 =?iso-8859-1?Q?iUVW7ld0Qi+7KzzRIUTrMWNHDc21/wvmQ++RoXYP1PIe3vsGIgqBjDu3EO?=
 =?iso-8859-1?Q?VQgDMpWzQ4M86Z4LwboFTRWrzggqYoihUSBxj01t92aclK6QaKZsyHWSxs?=
 =?iso-8859-1?Q?ypwuvI+1u8MVS8tk/Iie1FY2v/0DlzEU8Abmv2cmlwD3zlfUzwqNtIEpfT?=
 =?iso-8859-1?Q?P51Xm978n+QIUOUEMfYp5uos8VRK4Nfst/2WmDkbC/KDaXuETE39lnFk3e?=
 =?iso-8859-1?Q?PLJYMZQ7TmGbfoKlAYVNBn9lgk0JJMxlT7LknL2gfQLhTUXwGi70pD7BFN?=
 =?iso-8859-1?Q?rwkvbtnSj21ATDqwttNCkcj2ych5pXnqM5UZYuepFZMiMfC0Y7KfY+Kwro?=
 =?iso-8859-1?Q?3kiiO79rAcIJigRBSTQlXLiYsTZb6jPKNYdRjh9xWOTcUy9GdeG7rTbg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e7eaa6-475c-4549-5b42-08da8b5aa278
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:11:01.4991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pz8Nsf2rqRneOLWVXiES3m1n/mKV12QukkHumg5mwgbOxelyIBIzLSQMr1mWLDwsWUGz0qXJOZweu9Tfw9mKDVTzwcTgCLcac4PLVocEi+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6301
X-Proofpoint-GUID: ejVwXPRGnwer7_PrxgkE1CwtrtoWDyIO
X-Proofpoint-ORIG-GUID: ejVwXPRGnwer7_PrxgkE1CwtrtoWDyIO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208310070

As pci devices are refcounted now and all list that store them are
protected by separate locks, we can safely drop global pcidevs_lock.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/x86/domctl.c                       |  8 ---
 xen/arch/x86/hvm/vioapic.c                  |  2 -
 xen/arch/x86/hvm/vmsi.c                     | 12 ----
 xen/arch/x86/irq.c                          |  7 ---
 xen/arch/x86/msi.c                          | 11 ----
 xen/arch/x86/pci.c                          |  4 --
 xen/arch/x86/physdev.c                      |  7 +--
 xen/common/sysctl.c                         |  2 -
 xen/drivers/char/ns16550.c                  |  4 --
 xen/drivers/passthrough/amd/iommu_init.c    |  7 ---
 xen/drivers/passthrough/amd/iommu_map.c     |  5 --
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  4 --
 xen/drivers/passthrough/pci.c               | 63 +--------------------
 xen/drivers/passthrough/vtd/iommu.c         |  8 ---
 xen/drivers/video/vga.c                     |  2 -
 15 files changed, 4 insertions(+), 142 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 020df615bd..9f4ca03385 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -537,11 +537,7 @@ long arch_do_domctl(
=20
         ret =3D -ESRCH;
         if ( is_iommu_enabled(d) )
-        {
-            pcidevs_lock();
             ret =3D pt_irq_create_bind(d, bind);
-            pcidevs_unlock();
-        }
         if ( ret < 0 )
             printk(XENLOG_G_ERR "pt_irq_create_bind failed (%ld) for dom%d=
\n",
                    ret, d->domain_id);
@@ -566,11 +562,7 @@ long arch_do_domctl(
             break;
=20
         if ( is_iommu_enabled(d) )
-        {
-            pcidevs_lock();
             ret =3D pt_irq_destroy_bind(d, bind);
-            pcidevs_unlock();
-        }
         if ( ret < 0 )
             printk(XENLOG_G_ERR "pt_irq_destroy_bind failed (%ld) for dom%=
d\n",
                    ret, d->domain_id);
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index cb7f440160..aa4e7766a3 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -197,7 +197,6 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsi=
gned int trig,
         return ret;
     }
=20
-    pcidevs_lock();
     ret =3D pt_irq_create_bind(currd, &pt_irq_bind);
     if ( ret )
     {
@@ -207,7 +206,6 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsi=
gned int trig,
         unmap_domain_pirq(currd, pirq);
         write_unlock(&currd->event_lock);
     }
-    pcidevs_unlock();
=20
     return ret;
 }
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index c9e5f279c5..344bbd646c 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -470,7 +470,6 @@ int msixtbl_pt_register(struct domain *d, struct pirq *=
pirq, uint64_t gtable)
     struct msixtbl_entry *entry, *new_entry;
     int r =3D -EINVAL;
=20
-    ASSERT(pcidevs_locked());
     ASSERT(rw_is_write_locked(&d->event_lock));
=20
     if ( !msixtbl_initialised(d) )
@@ -540,7 +539,6 @@ void msixtbl_pt_unregister(struct domain *d, struct pir=
q *pirq)
     struct pci_dev *pdev;
     struct msixtbl_entry *entry;
=20
-    ASSERT(pcidevs_locked());
     ASSERT(rw_is_write_locked(&d->event_lock));
=20
     if ( !msixtbl_initialised(d) )
@@ -686,8 +684,6 @@ static int vpci_msi_update(const struct pci_dev *pdev, =
uint32_t data,
 {
     unsigned int i;
=20
-    ASSERT(pcidevs_locked());
-
     if ( (address & MSI_ADDR_BASE_MASK) !=3D MSI_ADDR_HEADER )
     {
         gdprintk(XENLOG_ERR, "%pp: PIRQ %u: unsupported address %lx\n",
@@ -728,7 +724,6 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const s=
truct pci_dev *pdev)
=20
     ASSERT(msi->arch.pirq !=3D INVALID_PIRQ);
=20
-    pcidevs_lock();
     for ( i =3D 0; i < msi->vectors && msi->arch.bound; i++ )
     {
         struct xen_domctl_bind_pt_irq unbind =3D {
@@ -747,7 +742,6 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const s=
truct pci_dev *pdev)
=20
     msi->arch.bound =3D !vpci_msi_update(pdev, msi->data, msi->address,
                                        msi->vectors, msi->arch.pirq, msi->=
mask);
-    pcidevs_unlock();
 }
=20
 static int vpci_msi_enable(const struct pci_dev *pdev, unsigned int nr,
@@ -785,10 +779,8 @@ int vpci_msi_arch_enable(struct vpci_msi *msi, const s=
truct pci_dev *pdev,
         return rc;
     msi->arch.pirq =3D rc;
=20
-    pcidevs_lock();
     msi->arch.bound =3D !vpci_msi_update(pdev, msi->data, msi->address, ve=
ctors,
                                        msi->arch.pirq, msi->mask);
-    pcidevs_unlock();
=20
     return 0;
 }
@@ -800,7 +792,6 @@ static void vpci_msi_disable(const struct pci_dev *pdev=
, int pirq,
=20
     ASSERT(pirq !=3D INVALID_PIRQ);
=20
-    pcidevs_lock();
     for ( i =3D 0; i < nr && bound; i++ )
     {
         struct xen_domctl_bind_pt_irq bind =3D {
@@ -816,7 +807,6 @@ static void vpci_msi_disable(const struct pci_dev *pdev=
, int pirq,
     write_lock(&pdev->domain->event_lock);
     unmap_domain_pirq(pdev->domain, pirq);
     write_unlock(&pdev->domain->event_lock);
-    pcidevs_unlock();
 }
=20
 void vpci_msi_arch_disable(struct vpci_msi *msi, const struct pci_dev *pde=
v)
@@ -863,7 +853,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry =
*entry,
=20
     entry->arch.pirq =3D rc;
=20
-    pcidevs_lock();
     rc =3D vpci_msi_update(pdev, entry->data, entry->addr, 1, entry->arch.=
pirq,
                          entry->masked);
     if ( rc )
@@ -871,7 +860,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry =
*entry,
         vpci_msi_disable(pdev, entry->arch.pirq, 1, false);
         entry->arch.pirq =3D INVALID_PIRQ;
     }
-    pcidevs_unlock();
=20
     return rc;
 }
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index d8672a03e1..6a08830a55 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2156,8 +2156,6 @@ int map_domain_pirq(
         struct pci_dev *pdev;
         unsigned int nr =3D 0;
=20
-        ASSERT(pcidevs_locked());
-
         ret =3D -ENODEV;
         if ( !cpu_has_apic )
             goto done;
@@ -2317,7 +2315,6 @@ int unmap_domain_pirq(struct domain *d, int pirq)
     if ( (pirq < 0) || (pirq >=3D d->nr_pirqs) )
         return -EINVAL;
=20
-    ASSERT(pcidevs_locked());
     ASSERT(rw_is_write_locked(&d->event_lock));
=20
     info =3D pirq_info(d, pirq);
@@ -2423,7 +2420,6 @@ void free_domain_pirqs(struct domain *d)
 {
     int i;
=20
-    pcidevs_lock();
     write_lock(&d->event_lock);
=20
     for ( i =3D 0; i < d->nr_pirqs; i++ )
@@ -2431,7 +2427,6 @@ void free_domain_pirqs(struct domain *d)
             unmap_domain_pirq(d, i);
=20
     write_unlock(&d->event_lock);
-    pcidevs_unlock();
 }
=20
 static void cf_check dump_irqs(unsigned char key)
@@ -2911,7 +2906,6 @@ int allocate_and_map_msi_pirq(struct domain *d, int i=
ndex, int *pirq_p,
=20
     msi->irq =3D irq;
=20
-    pcidevs_lock();
     /* Verify or get pirq. */
     write_lock(&d->event_lock);
     pirq =3D allocate_pirq(d, index, *pirq_p, irq, type, &msi->entry_nr);
@@ -2927,7 +2921,6 @@ int allocate_and_map_msi_pirq(struct domain *d, int i=
ndex, int *pirq_p,
=20
  done:
     write_unlock(&d->event_lock);
-    pcidevs_unlock();
     if ( ret )
     {
         switch ( type )
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 6b62c4f452..f04b90e235 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -623,7 +623,6 @@ static int msi_capability_init(struct pci_dev *dev,
     u8 slot =3D PCI_SLOT(dev->devfn);
     u8 func =3D PCI_FUNC(dev->devfn);
=20
-    ASSERT(pcidevs_locked());
     pos =3D pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSI);
     if ( !pos )
         return -ENODEV;
@@ -810,8 +809,6 @@ static int msix_capability_init(struct pci_dev *dev,
     if ( !pos )
         return -ENODEV;
=20
-    ASSERT(pcidevs_locked());
-
     control =3D pci_conf_read16(dev->sbdf, msix_control_reg(pos));
     /*
      * Ensure MSI-X interrupts are masked during setup. Some devices requi=
re
@@ -1032,7 +1029,6 @@ static int __pci_enable_msi(struct msi_info *msi, str=
uct msi_desc **desc)
     struct msi_desc *old_desc;
     int ret;
=20
-    ASSERT(pcidevs_locked());
     pdev =3D pci_get_pdev(NULL, msi->sbdf);
     if ( !pdev )
         return -ENODEV;
@@ -1092,7 +1088,6 @@ static int __pci_enable_msix(struct msi_info *msi, st=
ruct msi_desc **desc)
     struct msi_desc *old_desc;
     int ret;
=20
-    ASSERT(pcidevs_locked());
     pdev =3D pci_get_pdev(NULL, msi->sbdf);
     if ( !pdev || !pdev->msix )
         return -ENODEV;
@@ -1191,7 +1186,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool =
off)
     if ( !use_msi )
         return 0;
=20
-    pcidevs_lock();
     pdev =3D pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
     if ( !pdev )
         rc =3D -ENODEV;
@@ -1204,7 +1198,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool =
off)
     }
     else
         rc =3D msix_capability_init(pdev, NULL, NULL);
-    pcidevs_unlock();
=20
     pcidev_put(pdev);
=20
@@ -1217,8 +1210,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool =
off)
  */
 int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
 {
-    ASSERT(pcidevs_locked());
-
     if ( !use_msi )
         return -EPERM;
=20
@@ -1355,8 +1346,6 @@ int pci_restore_msi_state(struct pci_dev *pdev)
     unsigned int type =3D 0, pos =3D 0;
     u16 control =3D 0;
=20
-    ASSERT(pcidevs_locked());
-
     if ( !use_msi )
         return -EOPNOTSUPP;
=20
diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index 1d38f0df7c..4dcd6d96f3 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -88,15 +88,11 @@ int pci_conf_write_intercept(unsigned int seg, unsigned=
 int bdf,
     if ( reg < 64 || reg >=3D 256 )
         return 0;
=20
-    pcidevs_lock();
-
     pdev =3D pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
     if ( pdev ) {
         rc =3D pci_msi_conf_write_intercept(pdev, reg, size, data);
 	pcidev_put(pdev);
     }
=20
-    pcidevs_unlock();
-
     return rc;
 }
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 96214a3d40..a41366b609 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -162,11 +162,9 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
             goto free_domain;
     }
=20
-    pcidevs_lock();
     write_lock(&d->event_lock);
     ret =3D unmap_domain_pirq(d, pirq);
     write_unlock(&d->event_lock);
-    pcidevs_unlock();
=20
  free_domain:
     rcu_unlock_domain(d);
@@ -530,7 +528,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         if ( copy_from_guest(&restore_msi, arg, 1) !=3D 0 )
             break;
=20
-        pcidevs_lock();
         pdev =3D pci_get_pdev(NULL,
                             PCI_SBDF(0, restore_msi.bus, restore_msi.devfn=
));
         if ( pdev )
@@ -541,7 +538,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         else
             ret =3D -ENODEV;
=20
-        pcidevs_unlock();
         break;
     }
=20
@@ -553,7 +549,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         if ( copy_from_guest(&dev, arg, 1) !=3D 0 )
             break;
=20
-        pcidevs_lock();
         pdev =3D pci_get_pdev(NULL, PCI_SBDF(dev.seg, dev.bus, dev.devfn))=
;
         if ( pdev )
         {
@@ -562,7 +557,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         }
         else
             ret =3D -ENODEV;
-        pcidevs_unlock();
+
         break;
     }
=20
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 0feef94cd2..6bb8c5c295 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -446,7 +446,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_s=
ysctl)
                 break;
             }
=20
-            pcidevs_lock();
             pdev =3D pci_get_pdev(NULL, PCI_SBDF(dev.seg, dev.bus, dev.dev=
fn));
             if ( !pdev )
                 node =3D XEN_INVALID_DEV;
@@ -454,7 +453,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_s=
ysctl)
                 node =3D XEN_INVALID_NODE_ID;
             else
                 node =3D pdev->node;
-            pcidevs_unlock();
=20
             if ( pdev )
                 pcidev_put(pdev);
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 01a05c9aa8..66c10b18e5 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -445,8 +445,6 @@ static void __init cf_check ns16550_init_postirq(struct=
 serial_port *port)
             {
                 struct msi_desc *msi_desc =3D NULL;
=20
-                pcidevs_lock();
-
                 rc =3D pci_enable_msi(&msi, &msi_desc);
                 if ( !rc )
                 {
@@ -460,8 +458,6 @@ static void __init cf_check ns16550_init_postirq(struct=
 serial_port *port)
                         pci_disable_msi(msi_desc);
                 }
=20
-                pcidevs_unlock();
-
                 if ( rc )
                 {
                     uart->irq =3D 0;
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthr=
ough/amd/iommu_init.c
index 7c1713a602..e42af65a40 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -638,10 +638,7 @@ static void cf_check parse_ppr_log_entry(struct amd_io=
mmu *iommu, u32 entry[])
     uint16_t device_id =3D iommu_get_devid_from_cmd(entry[0]);
     struct pci_dev *pdev;
=20
-    pcidevs_lock();
     pdev =3D pci_get_real_pdev(PCI_SBDF(iommu->seg, device_id));
-    pcidevs_unlock();
-
     if ( pdev )
         guest_iommu_add_ppr_log(pdev->domain, entry);
     pcidev_put(pdev);
@@ -747,14 +744,12 @@ static bool_t __init set_iommu_interrupt_handler(stru=
ct amd_iommu *iommu)
         return 0;
     }
=20
-    pcidevs_lock();
     /*
      * XXX: it is unclear if this device can be removed. Right now
      * there is no code that clears msi.dev, so no one will decrease
      * refcount on it.
      */
     iommu->msi.dev =3D pci_get_pdev(NULL, PCI_SBDF(iommu->seg, iommu->bdf)=
);
-    pcidevs_unlock();
     if ( !iommu->msi.dev )
     {
         AMD_IOMMU_WARN("no pdev for %pp\n",
@@ -1289,9 +1284,7 @@ static int __init cf_check amd_iommu_setup_device_tab=
le(
             {
                 if ( !pci_init )
                     continue;
-                pcidevs_lock();
                 pdev =3D pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
-                pcidevs_unlock();
             }
=20
             if ( pdev && (pdev->msix || pdev->msi_maxvec) )
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthro=
ugh/amd/iommu_map.c
index 9d621e3d36..d04aa37538 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -726,9 +726,7 @@ int cf_check amd_iommu_get_reserved_device_memory(
             /* May need to trigger the workaround in find_iommu_for_device=
(). */
             struct pci_dev *pdev;
=20
-            pcidevs_lock();
             pdev =3D pci_get_pdev(NULL, sbdf);
-            pcidevs_unlock();
=20
             if ( pdev )
             {
@@ -848,7 +846,6 @@ int cf_check amd_iommu_quarantine_init(struct pci_dev *=
pdev, bool scratch_page)
     const struct ivrs_mappings *ivrs_mappings =3D get_ivrs_mappings(pdev->=
seg);
     int rc;
=20
-    ASSERT(pcidevs_locked());
     ASSERT(!hd->arch.amd.root_table);
     ASSERT(page_list_empty(&hd->arch.pgtables.list));
=20
@@ -903,8 +900,6 @@ void amd_iommu_quarantine_teardown(struct pci_dev *pdev=
)
 {
     struct domain_iommu *hd =3D dom_iommu(dom_io);
=20
-    ASSERT(pcidevs_locked());
-
     if ( !pdev->arch.amd.root_table )
         return;
=20
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/pass=
through/amd/pci_amd_iommu.c
index 955f3af57a..919e30129e 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -268,8 +268,6 @@ static int __must_check amd_iommu_setup_domain_device(
                     req_id, pdev->type, page_to_maddr(root_pg),
                     domid, hd->arch.amd.paging_mode);
=20
-    ASSERT(pcidevs_locked());
-
     if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
          !ivrs_dev->block_ats &&
          iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
@@ -416,8 +414,6 @@ static void amd_iommu_disable_domain_device(const struc=
t domain *domain,
     if ( QUARANTINE_SKIP(domain, pdev) )
         return;
=20
-    ASSERT(pcidevs_locked());
-
     if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
          pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
     {
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index c83397211b..cc62a5aec4 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -517,7 +517,6 @@ int __init pci_hide_device(unsigned int seg, unsigned i=
nt bus,
     struct pci_seg *pseg;
     int rc =3D -ENOMEM;
=20
-    pcidevs_lock();
     pseg =3D alloc_pseg(seg);
     if ( pseg )
     {
@@ -528,7 +527,6 @@ int __init pci_hide_device(unsigned int seg, unsigned i=
nt bus,
             rc =3D 0;
         }
     }
-    pcidevs_unlock();
=20
     return rc;
 }
@@ -588,8 +586,6 @@ struct pci_dev *pci_get_pdev(struct domain *d, pci_sbdf=
_t sbdf)
 {
     struct pci_dev *pdev;
=20
-    ASSERT(d || pcidevs_locked());
-
     /*
      * The hardware domain owns the majority of the devices in the system.
      * When there are multiple segments, traversing the per-segment list i=
s
@@ -730,7 +726,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         pdev_type =3D "device";
     else if ( info->is_virtfn )
     {
-        pcidevs_lock();
         pdev =3D pci_get_pdev(NULL,
                             PCI_SBDF(seg, info->physfn.bus,
                                      info->physfn.devfn));
@@ -739,7 +734,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
             pf_is_extfn =3D pdev->info.is_extfn;
             pcidev_put(pdev);
         }
-        pcidevs_unlock();
         if ( !pdev )
             pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
                            NULL, node);
@@ -756,7 +750,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
=20
     ret =3D -ENOMEM;
=20
-    pcidevs_lock();
     pseg =3D alloc_pseg(seg);
     if ( !pseg )
         goto out;
@@ -858,7 +851,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     pci_enable_acs(pdev);
=20
 out:
-    pcidevs_unlock();
     if ( !ret )
     {
         printk(XENLOG_DEBUG "PCI add %s %pp\n", pdev_type,  &pdev->sbdf);
@@ -889,7 +881,6 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     if ( !pseg )
         return -ENODEV;
=20
-    pcidevs_lock();
     spin_lock(&pseg->alldevs_lock);
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus =3D=3D bus && pdev->devfn =3D=3D devfn )
@@ -910,12 +901,10 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
             break;
         }
=20
-    pcidevs_unlock();
     spin_unlock(&pseg->alldevs_lock);
     return ret;
 }
=20
-/* Caller should hold the pcidevs_lock */
 static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
                            uint8_t devfn)
 {
@@ -927,7 +916,6 @@ static int deassign_device(struct domain *d, uint16_t s=
eg, uint8_t bus,
     if ( !is_iommu_enabled(d) )
         return -EINVAL;
=20
-    ASSERT(pcidevs_locked());
     pdev =3D pci_get_pdev(d, PCI_SBDF(seg, bus, devfn));
     if ( !pdev )
         return -ENODEV;
@@ -981,13 +969,10 @@ int pci_release_devices(struct domain *d)
     u8 bus, devfn;
     int ret;
=20
-    pcidevs_lock();
     ret =3D arch_pci_clean_pirqs(d);
     if ( ret )
-    {
-        pcidevs_unlock();
         return ret;
-    }
+
     spin_lock(&d->pdevs_lock);
     list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
     {
@@ -996,7 +981,6 @@ int pci_release_devices(struct domain *d)
         ret =3D deassign_device(d, pdev->seg, bus, devfn) ?: ret;
     }
     spin_unlock(&d->pdevs_lock);
-    pcidevs_unlock();
=20
     return ret;
 }
@@ -1094,7 +1078,6 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 dev=
fn)
     s_time_t now =3D NOW();
     u16 cword;
=20
-    pcidevs_lock();
     pdev =3D pci_get_real_pdev(PCI_SBDF(seg, bus, devfn));
     if ( pdev )
     {
@@ -1108,7 +1091,6 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 dev=
fn)
             pdev =3D NULL;
         }
     }
-    pcidevs_unlock();
=20
     if ( !pdev )
         return;
@@ -1164,13 +1146,7 @@ static int __init cf_check _scan_pci_devices(struct =
pci_seg *pseg, void *arg)
=20
 int __init scan_pci_devices(void)
 {
-    int ret;
-
-    pcidevs_lock();
-    ret =3D pci_segments_iterate(_scan_pci_devices, NULL);
-    pcidevs_unlock();
-
-    return ret;
+    return pci_segments_iterate(_scan_pci_devices, NULL);
 }
=20
 struct setup_hwdom {
@@ -1239,19 +1215,11 @@ static int __hwdom_init cf_check _setup_hwdom_pci_d=
evices(
=20
             pcidev_put(pdev);
             if ( iommu_verbose )
-            {
-                pcidevs_unlock();
                 process_pending_softirqs();
-                pcidevs_lock();
-            }
         }
=20
         if ( !iommu_verbose )
-        {
-            pcidevs_unlock();
             process_pending_softirqs();
-            pcidevs_lock();
-        }
     }
=20
     return 0;
@@ -1262,9 +1230,7 @@ void __hwdom_init setup_hwdom_pci_devices(
 {
     struct setup_hwdom ctxt =3D { .d =3D d, .handler =3D handler };
=20
-    pcidevs_lock();
     pci_segments_iterate(_setup_hwdom_pci_devices, &ctxt);
-    pcidevs_unlock();
 }
=20
 /* APEI not supported on ARM yet. */
@@ -1396,9 +1362,7 @@ static int cf_check _dump_pci_devices(struct pci_seg =
*pseg, void *arg)
 static void cf_check dump_pci_devices(unsigned char ch)
 {
     printk("=3D=3D=3D=3D PCI devices =3D=3D=3D=3D\n");
-    pcidevs_lock();
     pci_segments_iterate(_dump_pci_devices, NULL);
-    pcidevs_unlock();
 }
=20
 static int __init cf_check setup_dump_pcidevs(void)
@@ -1417,8 +1381,6 @@ static int iommu_add_device(struct pci_dev *pdev)
     if ( !pdev->domain )
         return -EINVAL;
=20
-    ASSERT(pcidevs_locked());
-
     hd =3D dom_iommu(pdev->domain);
     if ( !is_iommu_enabled(pdev->domain) )
         return 0;
@@ -1446,8 +1408,6 @@ static int iommu_enable_device(struct pci_dev *pdev)
     if ( !pdev->domain )
         return -EINVAL;
=20
-    ASSERT(pcidevs_locked());
-
     hd =3D dom_iommu(pdev->domain);
     if ( !is_iommu_enabled(pdev->domain) ||
          !hd->platform_ops->enable_device )
@@ -1494,7 +1454,6 @@ static int device_assigned(struct pci_dev *pdev)
 {
     int rc =3D 0;
=20
-    ASSERT(pcidevs_locked());
     /*
      * If the device exists and it is not owned by either the hardware
      * domain or dom_io then it must be assigned to a guest, or be
@@ -1507,7 +1466,6 @@ static int device_assigned(struct pci_dev *pdev)
     return rc;
 }
=20
-/* Caller should hold the pcidevs_lock */
 static int assign_device(struct domain *d, struct pci_dev *pdev, u32 flag)
 {
     const struct domain_iommu *hd =3D dom_iommu(d);
@@ -1521,7 +1479,6 @@ static int assign_device(struct domain *d, struct pci=
_dev *pdev, u32 flag)
         return -EXDEV;
=20
     /* device_assigned() should already have cleared the device for assign=
ment */
-    ASSERT(pcidevs_locked());
     ASSERT(pdev && (pdev->domain =3D=3D hardware_domain ||
                     pdev->domain =3D=3D dom_io));
=20
@@ -1587,7 +1544,6 @@ static int iommu_get_device_group(
     if ( group_id < 0 )
         return group_id;
=20
-    pcidevs_lock();
     spin_lock(&d->pdevs_lock);
     for_each_pdev( d, pdev )
     {
@@ -1603,7 +1559,6 @@ static int iommu_get_device_group(
         sdev_id =3D iommu_call(ops, get_device_group_id, seg, b, df);
         if ( sdev_id < 0 )
         {
-            pcidevs_unlock();
             spin_unlock(&d->pdevs_lock);
             return sdev_id;
         }
@@ -1614,7 +1569,6 @@ static int iommu_get_device_group(
=20
             if ( unlikely(copy_to_guest_offset(buf, i, &bdf, 1)) )
             {
-                pcidevs_unlock();
                 spin_unlock(&d->pdevs_lock);
                 return -EFAULT;
             }
@@ -1622,7 +1576,6 @@ static int iommu_get_device_group(
         }
     }
=20
-    pcidevs_unlock();
     spin_unlock(&d->pdevs_lock);
=20
     return i;
@@ -1630,17 +1583,12 @@ static int iommu_get_device_group(
=20
 void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
 {
-    pcidevs_lock();
-
     /* iommu->ats_list_lock is taken by the caller of this function */
     disable_ats_device(pdev);
=20
     ASSERT(pdev->domain);
     if ( d !=3D pdev->domain )
-    {
-        pcidevs_unlock();
         return;
-    }
=20
     pdev->broken =3D true;
=20
@@ -1649,8 +1597,6 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, =
struct pci_dev *pdev)
                d->domain_id, &pdev->sbdf);
     if ( !is_hardware_domain(d) )
         domain_crash(d);
-
-    pcidevs_unlock();
 }
=20
 int iommu_do_pci_domctl(
@@ -1740,7 +1686,6 @@ int iommu_do_pci_domctl(
             break;
         }
=20
-        pcidevs_lock();
         ret =3D device_assigned(pdev);
         if ( domctl->cmd =3D=3D XEN_DOMCTL_test_assign_device )
         {
@@ -1755,7 +1700,7 @@ int iommu_do_pci_domctl(
             ret =3D assign_device(d, pdev, flags);
=20
         pcidev_put(pdev);
-        pcidevs_unlock();
+
         if ( ret =3D=3D -ERESTART )
             ret =3D hypercall_create_continuation(__HYPERVISOR_domctl,
                                                 "h", u_domctl);
@@ -1787,9 +1732,7 @@ int iommu_do_pci_domctl(
         bus =3D PCI_BUS(machine_sbdf);
         devfn =3D PCI_DEVFN(machine_sbdf);
=20
-        pcidevs_lock();
         ret =3D deassign_device(d, seg, bus, devfn);
-        pcidevs_unlock();
         break;
=20
     default:
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/=
vtd/iommu.c
index 42661f22f4..87868188b7 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1490,7 +1490,6 @@ int domain_context_mapping_one(
     if ( QUARANTINE_SKIP(domain, pgd_maddr) )
         return 0;
=20
-    ASSERT(pcidevs_locked());
     spin_lock(&iommu->lock);
     maddr =3D bus_to_context_maddr(iommu, bus);
     context_entries =3D (struct context_entry *)map_vtd_domain_page(maddr)=
;
@@ -1711,8 +1710,6 @@ static int domain_context_mapping(struct domain *doma=
in, u8 devfn,
     if ( drhd && drhd->iommu->node !=3D NUMA_NO_NODE )
         dom_iommu(domain)->node =3D drhd->iommu->node;
=20
-    ASSERT(pcidevs_locked());
-
     for_each_rmrr_device( rmrr, bdf, i )
     {
         if ( rmrr->segment !=3D pdev->seg || bdf !=3D pdev->sbdf.bdf )
@@ -2072,8 +2069,6 @@ static void quarantine_teardown(struct pci_dev *pdev,
 {
     struct domain_iommu *hd =3D dom_iommu(dom_io);
=20
-    ASSERT(pcidevs_locked());
-
     if ( !pdev->arch.vtd.pgd_maddr )
         return;
=20
@@ -2341,8 +2336,6 @@ static int cf_check intel_iommu_add_device(u8 devfn, =
struct pci_dev *pdev)
     u16 bdf;
     int ret, i;
=20
-    ASSERT(pcidevs_locked());
-
     if ( !pdev->domain )
         return -EINVAL;
=20
@@ -3176,7 +3169,6 @@ static int cf_check intel_iommu_quarantine_init(struc=
t pci_dev *pdev,
     bool rmrr_found =3D false;
     int rc;
=20
-    ASSERT(pcidevs_locked());
     ASSERT(!hd->arch.vtd.pgd_maddr);
     ASSERT(page_list_empty(&hd->arch.pgtables.list));
=20
diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
index 1298f3a7b6..1f7c496114 100644
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -117,9 +117,7 @@ void __init video_endboot(void)
                 struct pci_dev *pdev;
                 u8 b =3D bus, df =3D devfn, sb;
=20
-                pcidevs_lock();
                 pdev =3D pci_get_pdev(NULL, PCI_SBDF(0, bus, devfn));
-                pcidevs_unlock();
=20
                 if ( !pdev ||
                      pci_conf_read16(PCI_SBDF(0, bus, devfn),
--=20
2.36.1

