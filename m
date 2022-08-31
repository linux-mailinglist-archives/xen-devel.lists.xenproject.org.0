Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0495A7F9F
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 16:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395691.635582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTORB-0005Fg-N9; Wed, 31 Aug 2022 14:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395691.635582; Wed, 31 Aug 2022 14:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTORB-00053b-B6; Wed, 31 Aug 2022 14:11:25 +0000
Received: by outflank-mailman (input) for mailman id 395691;
 Wed, 31 Aug 2022 14:11:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jA7u=ZD=epam.com=prvs=1242718080=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oTOR9-0002bv-7B
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 14:11:23 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c95c3cde-2936-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 16:11:21 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VBo4GC032537;
 Wed, 31 Aug 2022 14:11:07 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ja427h4rd-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 14:11:06 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6301.eurprd03.prod.outlook.com (2603:10a6:800:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 14:11:00 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f%6]) with mapi id 15.20.5566.019; Wed, 31 Aug 2022
 14:11:00 +0000
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
X-Inumbo-ID: c95c3cde-2936-11ed-934f-f50d60e1c1bd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4tz3hcRtDxJOimtE+Qo210yGmvik98SPc2LVgIHmtcKAaM2MW06k70S7YRJbuzAfTPwqU4XSuaASPO5Dqsj6TEye++tK7bNeHsgUUmt3pnbgA8HZ8K2W7ljImRudhnRU+Z1MZsHTpFa2PqTasBMr1aCmBLRhNKjmdf6WTUeXQwUHBK4+u6f5f1zOiWX7uIs0yGNrqZFTbS5s5En/lWXR5O5BcZvAlRFVxHR2ToRd3qLbsQUe6bzeYpSuq8jDbaxLX7Uw0fETRtZ6ZsUE7GX+Hvjc574h1dQCia9rXd8HtFdDqysAs6p1IVisFYg9KliucHgWHRD1plEKnC1EpB/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2KJogI0cZ3+/0Y09TtsZB2L93c8/aUqCi7d7m62KUI=;
 b=aAhPNgj7Kqq0n9284TLky1fCFsCTJibZsA+Hu5vF36vIBRQEjtLIuW3mieEruinhJv6MGxf/cLWtAWMZMRfzZC/ofCNJWcayOghGjr5WDWSfkxMt2ZSI4DDHrXNR2KXCMZ5aaiN66ZKIHszrSsSXgiiDCCpP7sNZqF9u12iyjqxOWUuq/s5E5uTVCwF+Q8IVziUBFtDNVqJaEwORPeuTRqZ6fP6Xl4UtoDaSVWVvFU69XLcDeqXdCKYpGuTNbND86SHZO04py+owCHRvaOo/+qYcXSrBCP5B4riGjTxN7LiG6hAJIyHCUCJR/M2QrQjMUVCd1lH2GaP3oSXaHUsWJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2KJogI0cZ3+/0Y09TtsZB2L93c8/aUqCi7d7m62KUI=;
 b=Nda++i4c2UHeS/sbPzAdVwxvIIxMERodtX5ElzDdjsSGna6CUTyNKz3X/I5nMbfqT83MDMUMq/YTFdv8kRtYWJAvUZmjh7ObBpSqpEephbWSVyNOvM9r99dHGpw96KPRyeUXAH//3bBCoSj6DK/cjVNeuFj1ZoNcCyPW2EECG0BK78RH+j8i3wqc27IYYVwYnH/zB6/wH6bWBw1VMShyFed0kckYLpl/VeIB0sFpc7WQyqZmrWTxKB5Fm9G8gxAGVgT4Ws1Cu/GwB4/kl/Nzif3AngQ4NfX+KbrXtLkyykbUiSj1LKNHVKcRubucE0oZBmDfUDo2wlLy3BwOl4PWgw==
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
Subject: [RFC PATCH 05/10] xen: pci: introduce reference counting for pdev
Thread-Topic: [RFC PATCH 05/10] xen: pci: introduce reference counting for
 pdev
Thread-Index: AQHYvUN/KKgAm1RVgESUCJeBYUFHMA==
Date: Wed, 31 Aug 2022 14:11:00 +0000
Message-ID: <20220831141040.13231-6-volodymyr_babchuk@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.37.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 117792c6-6aaa-4f73-4008-08da8b5aa1b7
x-ms-traffictypediagnostic: VI1PR03MB6301:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6bkUaBK9ZjdMIoeTKG355OI2ylD8DOW1tK5qf5n4uWgSK/vJAsytkTNkfyfKiUzKHCdPIrP4ednZScopZn6InwHEOdtb5Zxs22MbW5qAr++zcPGQhZAbX6a52YzEWTDYZDuLJXBT79IdkKZ5WiEhTF6gYVjDhtCCpQIwdp8RiqR43zlhvQSk1i2awB3T+B25fcuY8Z6A5a9/e5qa2UgcGTWhu4PLaGNd6zO1QUAStQpaqls/qBs6mz8YyR2n/+eAJS9UueUnJNRoeUbKjz7DLW/Typ1D0U/ILeye0kzJEtaudiKE//p5Wo0Vl9QiIwe0Dba8LtS8nMy5fsBnAj03KlisAOLK3aP+QmnJZhdmXGMFRiaEirFHqtc6+Z+Og3GHpvGW5Xooabn2j3hX0RnsA/OY1WWe3DYYWB7LzqSGQviULUck8ju6YurTiMQQe+ukUB8xv1YeoXWoXjITZoHG97TieaxAcjAvt4QUmJgK5DG06xjURNvpYMrj1evvDqyMolRGEto/IlN4ySl0VuV6gL8y3hyl904fdl+Gszsz/8nQm87WUsF2x9On2+FFWlwriS9GINbaCPB42Zhx+cXf9MnrPprLlYdPbV7Llp0UhWFqE51eOXEXsty6i743w2CV7OVj1jotLHWyc+rfcQs2w16q28Ka7twzyzhiCLh8DzLezkLmLOXcAKcpxJHjrUzoCmmQ+q7VzhhACg8nDHl921vLftrjlltL/BOtyEhF3JF3iiKFKlGNdxJ/tvJmGJIhi+lJZnF7UtirR8m2pZHPD+jczNCHAMpBpfEo4SXQH1Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(4326008)(66556008)(76116006)(66946007)(38070700005)(66476007)(8676002)(2906002)(66446008)(64756008)(54906003)(1076003)(186003)(83380400001)(2616005)(5660300002)(91956017)(7416002)(8936002)(316002)(36756003)(6916009)(30864003)(6486002)(478600001)(71200400001)(86362001)(55236004)(26005)(41300700001)(6512007)(6506007)(122000001)(38100700002)(21314003)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?TlgNITTR6PX7M2TRGPJMuMxZQ4NaKi5kuQfy4lRRGppqyXQpLMTOQdXh5G?=
 =?iso-8859-1?Q?jOeIp5n7zdR8AE1mS6eOzv1iBTmsdxYsOGjHoJz9i/K9GDRzSLQI4v0Kio?=
 =?iso-8859-1?Q?FyiMby4BMOcQTe+pLCLoEoZQzE2DARkPnE7ntGB4mVYGfOpm2B9En1GPw9?=
 =?iso-8859-1?Q?4ddg+bL3VC0LwQJW7ay99DcJvkp1zNBRbur2iU52q4k4WYQCSRgD5kihZW?=
 =?iso-8859-1?Q?YCt/Dyk/Z8k2P5c3G2b9JigRHwAaFOwfaN8ayUj5sClTrn2HJvPEfLb/Xx?=
 =?iso-8859-1?Q?85RTlPurda55D/QMOcH9jY60IOn5Dilp2WbqUkf6MbaNmlJdt9RuLjde/m?=
 =?iso-8859-1?Q?k7ott9WFDdvBEJQyC13Eh3jxhHKlwXzG8HGdryEkZ/4zxwE8vbL//47fWS?=
 =?iso-8859-1?Q?4e7tw5IkJc92Hw+puOBXYVoUOL8/TrKEOro8qnZtgoiNvTBT/FFv4wPu5r?=
 =?iso-8859-1?Q?Fuj2hPXEHWhgJOO1Nayi/2Sf9bUCpYHSFBZHtJY6fPAQvs/cbegGidu/h9?=
 =?iso-8859-1?Q?6DDGe10e+6mGmAlc83CaKgmKHBZQXoKN3AdBEc1k9S1C842HLlbwMc3QXk?=
 =?iso-8859-1?Q?YRciEcarq1sQVFmNdymzQx6uh5QpvzozZo2ZfcLwtCvzUvjGNjeKDvCcH7?=
 =?iso-8859-1?Q?tIgq8r9UAKVWPg5YD+Jv3Hims91ELiQd6dMbRSlW/7U/oevDt6byZyg8Nc?=
 =?iso-8859-1?Q?dtSeB58kiGD49Qxnnpv4pkM5+0Qe//QXPWeGXytmeNhlrKVMPaAiXijtJ7?=
 =?iso-8859-1?Q?EfsQZWs9qUid9KlyL8yExQZ3NKVtsgeLsfUSm79BUpmIsqqMrbI9WmtWlD?=
 =?iso-8859-1?Q?I4cIMp52WhSTtrsLJuwHZYbvvA/00qZd0D8smtr4QrTF8hU4g+hoOBoNLH?=
 =?iso-8859-1?Q?FucuEY8CHy5wj7HogcSCw98EDF3qITLJNIQU/0tPbJTgOJUVcwt5FkBSi3?=
 =?iso-8859-1?Q?gdgp9Y2X5mXVcyRxIuIN1eewE147r9AaCWoWCdfQhUEnc1GiKY+u503qaA?=
 =?iso-8859-1?Q?ZzLpf1FwHDQ80oqdzQ717cw2wzeM31qR2NIqLOMZWcq1tL7axcUcfp2s0z?=
 =?iso-8859-1?Q?zoQI0amlwMrNiY5e9v/AUctxcsLcdFbXb31ReGZzxSFjWSKSSJVRJvoAOE?=
 =?iso-8859-1?Q?AJ+3VpCLGJnOvkmvI92eL8w0w/tJSuvA5l4gJsuL0HakbMRufj3AXhcs+a?=
 =?iso-8859-1?Q?lvLWZbKQPj1JBmrkBmXeTwp7/xeCNQVCCy8KmlKjVzvXpD1VtpQOu33OhA?=
 =?iso-8859-1?Q?hTrzMqmz79F+Ixn5ttghPIvdPuoN4H8icQC+l3ot37S78NBMUcfsXiHK3m?=
 =?iso-8859-1?Q?ZMIgdZwly0g2/8fO38PYaVQe1bwn8KmlDLE799aycwaMOdm3w0MSWi5Xr0?=
 =?iso-8859-1?Q?vnSMnwJOsWFau27dO8ewah6fRiwDJIomzNdoF/M6mnpG9R9oIehK5SQ71N?=
 =?iso-8859-1?Q?hUDDsRsDAE0KTEsZluNTgWh3aRNiVpVEQJ44HT9mVMDjZtbJVux4CDc6e9?=
 =?iso-8859-1?Q?I23c/TO0U40f5AI/HvHvDdpZQesWlB+1d0BjKGmupIMOeNxS3+nYAWBfwH?=
 =?iso-8859-1?Q?WwVZutZ4DtB8mo+5t4SpSXuSqp0TxTAHhpwhJg+IBWb5reKGZaYTmUhvtp?=
 =?iso-8859-1?Q?fIElQrstfkwZNf1Qb53OujKzW2Tos8+e2SvvltTWJk7CZryhXrFftK/Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117792c6-6aaa-4f73-4008-08da8b5aa1b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:11:00.2492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XPPZQpvKHY2H6MHWjCiEW4XEJIVtOcT4d7o8m6QQsHPZmhAOCUt8ABlhTGNz9DSL0fD2nLTuQDogcXOkufQkRRjAWQjsz2CRTGUogsm8DFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6301
X-Proofpoint-GUID: aVlkLkwcfazWl26gJqx2Ls0rL_uqJPWH
X-Proofpoint-ORIG-GUID: aVlkLkwcfazWl26gJqx2Ls0rL_uqJPWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208310070

Prior to this change, lifetime of pci_dev objects was protected by global
pcidevs_lock(). We are going to get if of this lock, so we need some
other mechanism to ensure that those objects will not disappear under
feet of code that access them. Reference counting is a good choice as
it provides easy to comprehend way to control object lifetime with
better granularity than global super lock.

This patch adds two new helper functions: pcidev_get() and
pcidev_put(). pcidev_get() will increase reference counter, while
pcidev_put() will decrease it, destroying object when counter reaches
zero.

pcidev_get() should be used only when you already have a valid pointer
to the object or you are holding lock that protects one of the
lists (domain, pseg or ats) that store pci_dev structs.

pcidev_get() is rarely used directly, because there already are
functions that will provide valid pointer to pci_dev struct:
pci_get_pdev() and pci_get_real_pdev(). They will lock appropriate
list, find needed object and increase its reference counter before
returning to the caller.

Naturally, pci_put() should be called after finishing working with a
received object. This is the reason why this patch have so many
pcidev_put()s and so little pcidev_get()s: existing calls to
pci_get_*() functions now will increase reference counter
automatically, we just need to decrease it back when we finished.

This patch removes "const" qualifier from some pdev pointers because
pcidev_put() technically alters the contents of pci_dev structure.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

- Jan, can I add your Suggested-by tag?
---
 xen/arch/x86/hvm/vmsi.c                  |   2 +-
 xen/arch/x86/irq.c                       |   4 +
 xen/arch/x86/msi.c                       |  41 ++++++-
 xen/arch/x86/pci.c                       |   4 +-
 xen/arch/x86/physdev.c                   |  17 ++-
 xen/common/sysctl.c                      |   5 +-
 xen/drivers/passthrough/amd/iommu_init.c |  12 ++-
 xen/drivers/passthrough/amd/iommu_map.c  |   6 +-
 xen/drivers/passthrough/pci.c            | 131 +++++++++++++++--------
 xen/drivers/passthrough/vtd/quirks.c     |   2 +
 xen/drivers/video/vga.c                  |  10 +-
 xen/drivers/vpci/vpci.c                  |   6 +-
 xen/include/xen/pci.h                    |  18 ++++
 13 files changed, 201 insertions(+), 57 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 75f92885dc..7fb1075673 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -912,7 +912,7 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
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
index cd0c8a30a8..d8672a03e1 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2174,6 +2174,7 @@ int map_domain_pirq(
                 msi->entry_nr =3D ret;
                 ret =3D -ENFILE;
             }
+	    pcidev_put(pdev);
             goto done;
         }
=20
@@ -2188,6 +2189,7 @@ int map_domain_pirq(
             msi_desc->irq =3D -1;
             msi_free_irq(msi_desc);
             ret =3D -EBUSY;
+	    pcidev_put(pdev);
             goto done;
         }
=20
@@ -2272,10 +2274,12 @@ int map_domain_pirq(
             }
             msi_desc->irq =3D -1;
             msi_free_irq(msi_desc);
+	    pcidev_put(pdev);
             goto done;
         }
=20
         set_domain_irq_pirq(d, irq, info);
+	pcidev_put(pdev);
         spin_unlock_irqrestore(&desc->lock, flags);
     }
     else
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index d0bf63df1d..bccaccb98b 100644
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
+	pcidev_get(dev);
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
+	pcidev_get(dev);
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
+	pcidev_put(pdev);
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
@@ -1054,6 +1080,7 @@ static int __pci_enable_msix(struct msi_info *msi, st=
ruct msi_desc **desc)
 {
     struct pci_dev *pdev;
     struct msi_desc *old_desc;
+    int ret;
=20
     ASSERT(pcidevs_locked());
     pdev =3D pci_get_pdev(NULL, msi->sbdf);
@@ -1061,13 +1088,17 @@ static int __pci_enable_msix(struct msi_info *msi, =
struct msi_desc **desc)
         return -ENODEV;
=20
     if ( msi->entry_nr >=3D pdev->msix->nr_entries )
+    {
+	pcidev_put(pdev);
         return -EINVAL;
+    }
=20
     old_desc =3D find_msi_entry(pdev, msi->irq, PCI_CAP_ID_MSIX);
     if ( old_desc )
     {
         printk(XENLOG_ERR "irq %d already mapped to MSI-X on %pp\n",
                msi->irq, &pdev->sbdf);
+	pcidev_put(pdev);
         return -EEXIST;
     }
=20
@@ -1078,7 +1109,11 @@ static int __pci_enable_msix(struct msi_info *msi, s=
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
@@ -1161,6 +1196,8 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool =
off)
         rc =3D msix_capability_init(pdev, NULL, NULL);
     pcidevs_unlock();
=20
+    pcidev_put(pdev);
+
     return rc;
 }
=20
diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index 97b792e578..1d38f0df7c 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -91,8 +91,10 @@ int pci_conf_write_intercept(unsigned int seg, unsigned =
int bdf,
     pcidevs_lock();
=20
     pdev =3D pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
-    if ( pdev )
+    if ( pdev ) {
         rc =3D pci_msi_conf_write_intercept(pdev, reg, size, data);
+	pcidev_put(pdev);
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
index 02505ab044..0feef94cd2 100644
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
@@ -456,6 +456,9 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_s=
ysctl)
                 node =3D pdev->node;
             pcidevs_unlock();
=20
+            if ( pdev )
+                pcidev_put(pdev);
+
             if ( copy_to_guest_offset(ti->nodes, i, &node, 1) )
             {
                 ret =3D -EFAULT;
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthr=
ough/amd/iommu_init.c
index 1f14aaf49e..7c1713a602 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -644,6 +644,7 @@ static void cf_check parse_ppr_log_entry(struct amd_iom=
mu *iommu, u32 entry[])
=20
     if ( pdev )
         guest_iommu_add_ppr_log(pdev->domain, entry);
+    pcidev_put(pdev);
 }
=20
 static void iommu_check_ppr_log(struct amd_iommu *iommu)
@@ -747,6 +748,11 @@ static bool_t __init set_iommu_interrupt_handler(struc=
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
@@ -1272,7 +1278,7 @@ static int __init cf_check amd_iommu_setup_device_tab=
le(
     {
         if ( ivrs_mappings[bdf].valid )
         {
-            const struct pci_dev *pdev =3D NULL;
+            struct pci_dev *pdev =3D NULL;
=20
             /* add device table entry */
             iommu_dte_add_device_entry(&dt[bdf], &ivrs_mappings[bdf]);
@@ -1297,7 +1303,10 @@ static int __init cf_check amd_iommu_setup_device_ta=
ble(
                         pdev->msix ? pdev->msix->nr_entries
                                    : pdev->msi_maxvec);
                 if ( !ivrs_mappings[bdf].intremap_table )
+		{
+		    pcidev_put(pdev);
                     return -ENOMEM;
+		}
=20
                 if ( pdev->phantom_stride )
                 {
@@ -1315,6 +1324,7 @@ static int __init cf_check amd_iommu_setup_device_tab=
le(
                             ivrs_mappings[bdf].intremap_inuse;
                     }
                 }
+		pcidev_put(pdev);
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
index b5db5498a1..a6c6368769 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -403,6 +403,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg,=
 u8 bus, u8 devfn)
     *((u8*) &pdev->bus) =3D bus;
     *((u8*) &pdev->devfn) =3D devfn;
     pdev->domain =3D NULL;
+    refcnt_init(&pdev->refcnt);
=20
     arch_pci_init_pdev(pdev);
=20
@@ -499,33 +500,6 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg=
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
@@ -596,10 +570,15 @@ struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf)
     {
         if ( !(sbdf.devfn & stride) )
             continue;
+
         sbdf.devfn &=3D ~stride;
+        pcidev_put(pdev);
         pdev =3D pci_get_pdev(NULL, sbdf);
         if ( pdev && stride !=3D pdev->phantom_stride )
+        {
+            pcidev_put(pdev);
             pdev =3D NULL;
+        }
     }
=20
     return pdev;
@@ -629,6 +608,7 @@ struct pci_dev *pci_get_pdev(struct domain *d, pci_sbdf=
_t sbdf)
             if ( pdev->sbdf.bdf =3D=3D sbdf.bdf &&
                  (!d || pdev->domain =3D=3D d) )
             {
+                pcidev_get(pdev);
                 spin_unlock(&pseg->alldevs_lock);
                 return pdev;
             }
@@ -640,6 +620,7 @@ struct pci_dev *pci_get_pdev(struct domain *d, pci_sbdf=
_t sbdf)
         list_for_each_entry ( pdev, &d->pdev_list, domain_list )
             if ( pdev->sbdf.bdf =3D=3D sbdf.bdf )
             {
+                pcidev_get(pdev);
                 spin_unlock(&d->pdevs_lock);
                 return pdev;
             }
@@ -754,7 +735,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
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
@@ -920,8 +904,9 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
                 spin_unlock(&pdev->domain->pdevs_lock);
             }
             printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
-            free_pdev(pseg, pdev);
             list_del(&pdev->alldevs_list);
+            pdev_msi_deinit(pdev);
+            pcidev_put(pdev);
             break;
         }
=20
@@ -952,7 +937,7 @@ static int deassign_device(struct domain *d, uint16_t s=
eg, uint8_t bus,
     {
         ret =3D iommu_quarantine_dev_init(pci_to_dev(pdev));
         if ( ret )
-           return ret;
+            goto out;
=20
         target =3D dom_io;
     }
@@ -982,6 +967,7 @@ static int deassign_device(struct domain *d, uint16_t s=
eg, uint8_t bus,
     pdev->fault.count =3D 0;
=20
  out:
+    pcidev_put(pdev);
     if ( ret )
         printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",
                d, &PCI_SBDF(seg, bus, devfn), ret);
@@ -1117,7 +1103,10 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 de=
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
@@ -1128,6 +1117,8 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 dev=
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
@@ -1246,6 +1237,7 @@ static int __hwdom_init cf_check _setup_hwdom_pci_dev=
ices(
                 printk(XENLOG_WARNING "Dom%d owning %pp?\n",
                        pdev->domain->domain_id, &pdev->sbdf);
=20
+            pcidev_put(pdev);
             if ( iommu_verbose )
             {
                 pcidevs_unlock();
@@ -1495,33 +1487,28 @@ static int iommu_remove_device(struct pci_dev *pdev=
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
@@ -1532,10 +1519,11 @@ static int assign_device(struct domain *d, u16 seg,=
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
@@ -1570,7 +1558,7 @@ static int assign_device(struct domain *d, u16 seg, u=
8 bus, u8 devfn, u32 flag)
  done:
     if ( rc )
         printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
-               d, &PCI_SBDF(seg, bus, devfn), rc);
+               d, &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
     /* The device is assigned to dom_io so mark it as quarantined */
     else if ( d =3D=3D dom_io )
         pdev->quarantine =3D true;
@@ -1710,6 +1698,9 @@ int iommu_do_pci_domctl(
         ASSERT(d);
         /* fall through */
     case XEN_DOMCTL_test_assign_device:
+    {
+        struct pci_dev *pdev;
+
         /* Don't support self-assignment of devices. */
         if ( d =3D=3D current->domain )
         {
@@ -1737,26 +1728,36 @@ int iommu_do_pci_domctl(
         seg =3D machine_sbdf >> 16;
         bus =3D PCI_BUS(machine_sbdf);
         devfn =3D PCI_DEVFN(machine_sbdf);
+        pdev =3D pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
+        if ( !pdev )
+        {
+            printk(XENLOG_G_INFO "%pp non-existent\n",
+                   &PCI_SBDF(seg, bus, devfn));
+            ret =3D -EINVAL;
+            break;
+        }
=20
         pcidevs_lock();
-        ret =3D device_assigned(seg, bus, devfn);
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
@@ -1796,6 +1797,46 @@ int iommu_do_pci_domctl(
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
index 29a88e8241..1298f3a7b6 100644
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
+		{
+		    if (pdev)
+			pcidev_put(pdev);
                     continue;
+		}
=20
                 while ( b )
                 {
@@ -144,7 +148,10 @@ void __init video_endboot(void)
                             if ( pci_conf_read16(PCI_SBDF(0, b, df),
                                                  PCI_BRIDGE_CONTROL) &
                                  PCI_BRIDGE_CTL_VGA )
+			    {
+				pcidev_put(pdev);
                                 continue;
+			    }
                             break;
                         }
                         break;
@@ -157,6 +164,7 @@ void __init video_endboot(void)
                            bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
                     pci_hide_device(0, bus, devfn);
                 }
+		pcidev_put(pdev);
             }
     }
=20
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 7d1f9fd438..59dc55f498 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -313,7 +313,7 @@ static uint32_t merge_result(uint32_t data, uint32_t ne=
w, unsigned int size,
 uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 {
     struct domain *d =3D current->domain;
-    const struct pci_dev *pdev;
+    struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset =3D 0;
     uint32_t data =3D ~(uint32_t)0;
@@ -373,6 +373,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, u=
nsigned int size)
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
+    pcidev_put(pdev);
=20
     if ( data_offset < size )
     {
@@ -416,7 +417,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsi=
gned int size,
                 uint32_t data)
 {
     struct domain *d =3D current->domain;
-    const struct pci_dev *pdev;
+    struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset =3D 0;
     const unsigned long *ro_map =3D pci_get_ro_map(sbdf.seg);
@@ -478,6 +479,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsi=
gned int size,
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
+    pcidev_put(pdev);
=20
     if ( data_offset < size )
         /* Tailing gap, write the remaining. */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 19047b4b20..e71a180ef3 100644
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
 struct pci_dev *pci_get_pdev(struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
+
 void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
=20
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg);
--=20
2.36.1

