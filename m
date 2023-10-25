Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377A17D67F9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 12:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622791.969957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvatJ-00019B-5e; Wed, 25 Oct 2023 10:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622791.969957; Wed, 25 Oct 2023 10:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvatJ-000174-0a; Wed, 25 Oct 2023 10:13:33 +0000
Received: by outflank-mailman (input) for mailman id 622791;
 Wed, 25 Oct 2023 10:13:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TDEh=GH=epam.com=prvs=46626b3b1e=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1qvatH-0008QC-4A
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 10:13:31 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22d2d317-731f-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 12:13:27 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39P6fZXo019492; Wed, 25 Oct 2023 10:13:11 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3txjfcj00w-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Oct 2023 10:13:10 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by PAVPR03MB9229.eurprd03.prod.outlook.com (2603:10a6:102:32a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.29; Wed, 25 Oct
 2023 10:13:04 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::eecf:7ef0:b4b5:fc42]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::eecf:7ef0:b4b5:fc42%4]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 10:13:04 +0000
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
X-Inumbo-ID: 22d2d317-731f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJ/s+vwZEosIM9HcGBTK9ncyjsIgJuhyILTZOku4KohGD70Ii2ZAJ8YgxZjwFTVcC9+cq5yxRXjDGzHZ+27bNPzTpnTFaJYNN+SQTILp3vy0JAQVxyGU7pjO76HgWduI/wxRp8ly6sbcvK23jRZcBbuo7cKFaKRl3nbcFy/KxlbfB5Dojvn4We7moIcEzKkN+kGeaMPnQTdcotryia7kSC8Y8MmYQaKF7XHhHAMkbkEDdmcYCZvdy48+WurcMXA2yUXjTCkhXUO8bdAOIhzx6+ZuleEE/NzS67KHndN1EopxREvzMvXvhNO8ey4b4lPqtyRF90bAAKYeYXmQkiSt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idh2l0lCB+ZtXO+X71x2VXJKcfF7jtJl8qoNF4TpP6Y=;
 b=Crub1awhPIDemH0utATXrhZlD9qTVRvziH/xnzf/OU76FLAs8/0rlLBlNBMYXJmSHINZJ6zwEq6HUZte8xXvGogf2K/EkD8zlFIK0gJPvwkKsDByrKNvmNHaEfAqFXrWGBDYy3XTxrf0WiP9jWOLSMIGqtiXt9EL9biIvdTnoxvWHK619PEGdvCU5lrRayGkZ9b5TEyruoqoJzVnWYg9RmDqbrjBhWOcPUkQI7FqQtMfPp5jWQOy8TyZAWLWbunUBk/UnyBOZBTSwT2m3WtPiFLxEwGRfrIokmUKX7WeMxzBQwacPCRRKeORqcSvxYsb8kiWoXx3byEkdBqKtm3/yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idh2l0lCB+ZtXO+X71x2VXJKcfF7jtJl8qoNF4TpP6Y=;
 b=j4yG0CYeqpkF1KlJo00YadTqDLsjSRI6let5px7Xrtl6QTAYHLfp5eug8WMeC9kFpBpl0lGjMo+Xur9KcBbMnf/ONQhHkwoAafSfn5WtCSXMfbHfdVgkbdOHkL208rdGtSgj9ns6iIdvcOO1uLNpe3plymSxa4zmMu64lOwOsVb8EvX66oQ/BVzF7u3Nx7XJPVAPKwwsLbbpOb7Z80TUx3yJG5N2K9zM/NvxZjJLComRsqFD5ozXGzQrva1vT9f78JESaRBcDqf8Etw19KAdatcxsDL83vkRL5S5wRGavR+gJgdfLRqfVslX97nbVdcbxDdkcqYdf701iKVGGXebxA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 4/4] arm/new vgic: Add ITS support to NEW_VGIC
Thread-Topic: [XEN PATCH 4/4] arm/new vgic: Add ITS support to NEW_VGIC
Thread-Index: AQHaByvXavefleIylUux0UehXzD5Xg==
Date: Wed, 25 Oct 2023 10:13:03 +0000
Message-ID: 
 <b0b41f2065002e4cf7795ebfbf9f84624c2f150d.1698225630.git.mykyta_poturai@epam.com>
References: <cover.1698225630.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1698225630.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|PAVPR03MB9229:EE_
x-ms-office365-filtering-correlation-id: 1de5ebee-d208-4147-1ba1-08dbd542fa04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 V9ewMx8Bmi6Gua1s91TiPumIC41YZ/1+qC2eab//2Jh9E2+c7tQ2gLrK33tlChSc0oGR/hsePa9z+E4xWzQPx56eNnQQuMOEYSjXzS7uokeVOz9cpNv3Tgrc49Fw9p1zz5t5GK/ZqiWAkwYme4kKddFQjkci3kpmLbuAWXL20xoBbJHAnwNJQaXi6B88pQUMwsNEfMEjhSxKQrF1xvSsSQQ9k0K1gWofDxY3tplI6auQ9S20n9dGXOnlE4hKXS75AW0eR1HmnlkVMr67wr7yEFwbe48RZuOMB6jTg75U81fJ6VxtGwYKClQ9nUT6SwGyItbBIM2VL91gTcUy2MvnDfM8K7Pru2ZHZ2ikAZCr0pHVw/7wyvcWulCkgHJ43CByMQqkrAOr7aWZ6p0JMhsc00iI5LRSybz7kD3gt1Jgw22jssnlWDq5jHGQmu1eQkwPNAaUhn98nJb8RDwR0O5S1nfT82UuMZLnSkvCbld3xWvLwXcCsHoDpq+MetSyzUbe6b7sHyrCihgd4ZeFN3QC7IKXP5VTN7fONDdaR5fir3+Nqhat5R3Mq8cE/r4iHRYZ/cxIMbhhnqHzZpjl4rL/blVcQFNjsVd77hu241YFzqBVBxfbckQGWwFTRgqBwfHzt2TIMadfRRheZ6OZp1+cWQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(38070700009)(26005)(66899024)(38100700002)(2906002)(30864003)(41300700001)(86362001)(5660300002)(122000001)(8676002)(8936002)(36756003)(4326008)(2616005)(478600001)(6916009)(66556008)(107886003)(71200400001)(6506007)(64756008)(54906003)(91956017)(316002)(66476007)(76116006)(66946007)(66446008)(83380400001)(966005)(6486002)(6512007)(2004002)(559001)(579004)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?OWvUR6s74fJ82mYzLjRIZLo1eGI3ZxLoHtnldELvAm5DMjPE/MJwg891xn?=
 =?iso-8859-1?Q?gl1K3Y1/7wCTO/SrMDBWwUbELyAcJHUeqzCWLeWcO+5yILibKqSdaM/ibK?=
 =?iso-8859-1?Q?Ms2cvGVCZaC3aF6lWC8ztz4nEy131lv7LSTnej8eFzt5rl9EPuMg+9YtQa?=
 =?iso-8859-1?Q?Y58rM2O5J82sQIsER23XMdj0w+TI+NLZuxy3/Fp/Fv0KLDD4IdqA/0e0zJ?=
 =?iso-8859-1?Q?iHNfvd6hk+wQEF00y5DkEx9PdZNs8/UZf9GKA/I+1h4rRohySWcJml3jr9?=
 =?iso-8859-1?Q?tZjoX9Ka+Xtwj6Ekc7nLNJlqI7zKWsFUc5KlIErNyEs1uTFAEONbIu5hcU?=
 =?iso-8859-1?Q?azGO5KtouxRBlNLxzBsx4v3Iv9Pfddg+pxkLkNX1pZZ8U5iTfRlm2tWH0Y?=
 =?iso-8859-1?Q?uXma2Xw0nwsOrXt6R4scVVbkNiWqji9AUE0tsAm89TftdgsERhDQovz67B?=
 =?iso-8859-1?Q?zMn34VmwH6MOfd+nv0Dwnzj3sCpfeuXtayUJ6UFJ4HSbdvCCLMUm0/gRAm?=
 =?iso-8859-1?Q?BhXSRWSEz379dLzCEFSgB/nXuWkpg9N/DOss0XOXxtN/us4z45DlmKdLvJ?=
 =?iso-8859-1?Q?pgaZNuDfkqrVyRczhWXQL1mNZJdkhSsFjNHKyRSaLmMoiuS82BBoewMbqo?=
 =?iso-8859-1?Q?7FildrAomaZQtARIdUKwrA8NMVcHXEct2Tx2ZBIZqlg8MNEF+WzWbdHcyz?=
 =?iso-8859-1?Q?+FQhTu3TLkWCjrrZy9LJ25yzlyKYYXudfqXWd6oJTDV/68dsgpuhY+R0t4?=
 =?iso-8859-1?Q?6pu38s/0Tb+oAIEQEAde/7iM9SPc7fkI5IbtCK3qrG6Lvt/j94W4ppVny1?=
 =?iso-8859-1?Q?WOnwSr1XcZTsT9oniHHXg4IqvYeNHAUGZLaeK7zUuKKFJFHjeKyJNc+iS/?=
 =?iso-8859-1?Q?mwfTz5jEv6E0fqssYYpY9IvrNxUFYcVIxEzWWuruBJvnTnQRc140G/y/k1?=
 =?iso-8859-1?Q?WI6KO94BGKc6tCYL11HLGMccWZcHjXImb0BJx0S2UZ7cBP5Kre6Q5lFBH2?=
 =?iso-8859-1?Q?xNCB1c1HFr+aMnkPrTPUjA4zezJLV6Vw1hjmEqv9DvfeBVjX1GzViiU6rT?=
 =?iso-8859-1?Q?/ESwar1NHo7GEX0Lk5SrjNSHEOnpKEF8/6duSBM19JmVTpN/Oibiww0buW?=
 =?iso-8859-1?Q?h1Z3AV3oY+z3qDUKAGwQFNZ6ylhYASli+sylRFQAOwqL8WR+jqkH8LIqke?=
 =?iso-8859-1?Q?DShxfZ3+dmvUtP2g8RpRixeiMc4k/7hFeHSMFl4WLJ0i5lnqnvcbfzFGAf?=
 =?iso-8859-1?Q?LQLH4M8Dd9i3sRiygzPKoWgg5a8+C/lYkcN4mxB29UQW/vIojBywkURiJD?=
 =?iso-8859-1?Q?+OSk1cC6bAoEFzaDOBmDHWHbzz2k2U80WuOTosypczUARGguNXEZJfGKga?=
 =?iso-8859-1?Q?+kcYP5Heo3mYMLJ4zelkRUzQgS+749pYhhPV6IEHa1lrQB6MiToAhK8mPc?=
 =?iso-8859-1?Q?budBJJZARank9tnxIW2G/B25njcRolbjtGb7b73gAqxxSJrDfrl72v1XfE?=
 =?iso-8859-1?Q?JOdFaBATqI9lTkjQupPa2G4XLqGcJbozohGRq1CWDUkUfdZLt5D9THeB90?=
 =?iso-8859-1?Q?wKkTbIudGxuqZoInqNuT9TFB2E4zbJ+uJmDm0klJ4+OjAG/acfCHRyqzdr?=
 =?iso-8859-1?Q?A4S+FBhi0KPRLCgWqzgKqXT9Tn1xTtFA/J0+AVZqEQCxdbIRwjnzyYSA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de5ebee-d208-4147-1ba1-08dbd542fa04
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 10:13:03.5843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cT/yykq1j+lh4YUzi3FjuTXyOLvENEdtqetRTJ0fz3fx1VLEfIm6ti39vn9a5DsGrR1kLrWxg1Gb6BbCoJ3vgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9229
X-Proofpoint-GUID: HRZIsRywgudgJ4OoH3_ofhjPmdbq9aMG
X-Proofpoint-ORIG-GUID: HRZIsRywgudgJ4OoH3_ofhjPmdbq9aMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_01,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310250086

Add GICv3 ITS support for NEW VGIC. The code is ported from the Kernel
version 6.0. The code is adapted to Xen's coding style and hooked up
with Xen's interfaces. The code is adapted to Xen coding style and
conventions.
For this version ITS is supported only for hardware domains.

Remove unsupported flag from config HAS_ITS and add NEW_VGIC dependency.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/Kconfig                  |    4 +-
 xen/arch/arm/gic-v3-its.c             |   28 +
 xen/arch/arm/gic-v3-lpi.c             |   11 +
 xen/arch/arm/include/asm/gic_v3_its.h |   82 ++
 xen/arch/arm/include/asm/new_vgic.h   |   64 +
 xen/arch/arm/vgic/Makefile            |    1 +
 xen/arch/arm/vgic/vgic-init.c         |    7 +
 xen/arch/arm/vgic/vgic-its.c          | 1945 +++++++++++++++++++++++++
 xen/arch/arm/vgic/vgic-mmio-v3.c      |   93 +-
 xen/arch/arm/vgic/vgic-mmio.c         |    6 +
 xen/arch/arm/vgic/vgic-mmio.h         |   11 +
 11 files changed, 2247 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/arm/vgic/vgic-its.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index c91011bc15..ba60cdc513 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -90,8 +90,8 @@ config GICV3
 	  If unsure, use the default setting.
=20
 config HAS_ITS
-        bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORT=
ED
-        depends on GICV3 && !NEW_VGIC && !ARM_32
+        bool "GICv3 ITS MSI controller support"
+        depends on GICV3 && NEW_VGIC && !ARM_32
=20
 config OVERLAY_DTB
 	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 8afcd9783b..482e11e835 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -47,7 +47,9 @@ struct its_device {
     uint32_t guest_devid;
     uint32_t eventids;                  /* Number of event IDs (MSIs) */
     uint32_t *host_lpi_blocks;          /* Which LPIs are used on the host=
 */
+#ifndef CONFIG_NEW_VGIC
     struct pending_irq *pend_irqs;      /* One struct per event */
+#endif
 };
=20
 bool gicv3_its_host_has_its(void)
@@ -531,7 +533,9 @@ static int remove_mapped_guest_device(struct its_device=
 *dev)
                dev->host_devid);
=20
     xfree(dev->itt_addr);
+#ifndef CONFIG_NEW_VGIC
     xfree(dev->pend_irqs);
+#endif
     xfree(dev->host_lpi_blocks);
     xfree(dev);
=20
@@ -704,9 +708,11 @@ int gicv3_its_map_guest_device(struct domain *d,
      * See the mailing list discussion for some background:
      * https://lists.xen.org/archives/html/xen-devel/2017-03/msg03645.html
      */
+#ifndef CONFIG_NEW_VGIC
     dev->pend_irqs =3D xzalloc_array(struct pending_irq, nr_events);
     if ( !dev->pend_irqs )
         goto out_unlock;
+#endif
=20
     dev->host_lpi_blocks =3D xzalloc_array(uint32_t, nr_events);
     if ( !dev->host_lpi_blocks )
@@ -772,7 +778,9 @@ out_unlock:
 out:
     if ( dev )
     {
+#ifndef CONFIG_NEW_VGIC
         xfree(dev->pend_irqs);
+#endif
         xfree(dev->host_lpi_blocks);
     }
     xfree(itt_addr);
@@ -809,6 +817,7 @@ static struct its_device *get_its_device(struct domain =
*d, paddr_t vdoorbell,
     return NULL;
 }
=20
+#ifndef CONFIG_NEW_VGIC
 static struct pending_irq *get_event_pending_irq(struct domain *d,
                                                  paddr_t vdoorbell_address=
,
                                                  uint32_t vdevid,
@@ -831,7 +840,25 @@ static struct pending_irq *get_event_pending_irq(struc=
t domain *d,
=20
     return pirq;
 }
+#endif
+
+uint32_t gicv3_its_get_host_lpi(struct domain *d, paddr_t vdoorbell_addres=
s,
+                                     uint32_t vdevid, uint32_t eventid)
+{
+    struct its_device *dev;
+    uint32_t host_lpi =3D INVALID_LPI;
+
+    spin_lock(&d->arch.vgic.its_devices_lock);
+    dev =3D get_its_device(d, vdoorbell_address, vdevid);
+    if ( dev )
+        host_lpi =3D dev->host_lpi_blocks[eventid / LPI_BLOCK] +
+                   (eventid % LPI_BLOCK);
+
+    spin_unlock(&d->arch.vgic.its_devices_lock);
+    return host_lpi;
+}
=20
+#ifndef CONFIG_NEW_VGIC
 struct pending_irq *gicv3_its_get_event_pending_irq(struct domain *d,
                                                     paddr_t vdoorbell_addr=
ess,
                                                     uint32_t vdevid,
@@ -883,6 +910,7 @@ struct pending_irq *gicv3_assign_guest_event(struct dom=
ain *d,
=20
     return pirq;
 }
+#endif /* !CONFIG_NEW_VGIC */
=20
 int gicv3_its_deny_access(struct domain *d)
 {
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index eb0a5535e4..e973e37c0a 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -135,16 +135,27 @@ void vgic_vcpu_inject_lpi(struct domain *d, unsigned =
int virq)
      * the time. We cannot properly protect this with the current locking
      * scheme, but the future per-IRQ lock will solve this problem.
      */
+#ifdef CONFIG_NEW_VGIC
+    struct vgic_irq *p =3D vgic_get_irq(d, d->vcpu[0], virq);
+#else
     struct pending_irq *p =3D irq_to_pending(d->vcpu[0], virq);
+#endif
     unsigned int vcpu_id;
=20
     if ( !p )
         return;
=20
+#ifdef CONFIG_NEW_VGIC
+    vcpu_id =3D ACCESS_ONCE(p->target_vcpu->vcpu_id);
+#else
     vcpu_id =3D ACCESS_ONCE(p->lpi_vcpu_id);
+#endif
     if ( vcpu_id >=3D d->max_vcpus )
           return;
=20
+#ifdef CONFIG_NEW_VGIC
+    vgic_put_irq(d, p);
+#endif
     vgic_inject_irq(d, d->vcpu[vcpu_id], virq, true);
 }
=20
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index c24d4752d0..cbfd854af6 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -35,7 +35,17 @@
 #define GITS_BASER5                     0x128
 #define GITS_BASER6                     0x130
 #define GITS_BASER7                     0x138
+#define GITS_IDREGS_BASE                0xffd0
+#define GITS_PIDR0                      0xffe0
+#define GITS_PIDR1                      0xffe4
 #define GITS_PIDR2                      GICR_PIDR2
+#define GITS_PIDR4                      0xffd0
+#define GITS_CIDR0                      0xfff0
+#define GITS_CIDR1                      0xfff4
+#define GITS_CIDR2                      0xfff8
+#define GITS_CIDR3                      0xfffc
+
+#define GITS_TRANSLATER                 0x10040
=20
 /* Register bits */
 #define GITS_VALID_BIT                  BIT(63, UL)
@@ -49,6 +59,11 @@
 #define GITS_TYPER_DEVICE_ID_BITS(r)    ((((r) & GITS_TYPER_DEVIDS_MASK) >=
> \
                                                  GITS_TYPER_DEVIDS_SHIFT) =
+ 1)
=20
+#define GITS_IIDR_REV_SHIFT             12
+#define GITS_IIDR_REV_MASK              (0xf << GITS_IIDR_REV_SHIFT)
+#define GITS_IIDR_REV(r)                (((r) >> GITS_IIDR_REV_SHIFT) & 0x=
f)
+#define GITS_IIDR_PRODUCTID_SHIFT       24
+
 #define GITS_TYPER_IDBITS_SHIFT         8
 #define GITS_TYPER_IDBITS_MASK          (0x1fUL << GITS_TYPER_IDBITS_SHIFT=
)
 #define GITS_TYPER_EVENT_ID_BITS(r)     ((((r) & GITS_TYPER_IDBITS_MASK) >=
> \
@@ -60,10 +75,12 @@
                                                  GITS_TYPER_ITT_SIZE_SHIFT=
) + 1)
 #define GITS_TYPER_PHYSICAL             (1U << 0)
=20
+#define GITS_BASER_VALID                (1ULL << 63)
 #define GITS_BASER_INDIRECT             BIT(62, UL)
 #define GITS_BASER_INNER_CACHEABILITY_SHIFT        59
 #define GITS_BASER_TYPE_SHIFT           56
 #define GITS_BASER_TYPE_MASK            (7ULL << GITS_BASER_TYPE_SHIFT)
+#define GITS_BASER_TYPE(r)              (((r) >> GITS_BASER_TYPE_SHIFT) & =
7)
 #define GITS_BASER_OUTER_CACHEABILITY_SHIFT        53
 #define GITS_BASER_TYPE_NONE            0UL
 #define GITS_BASER_TYPE_DEVICE          1UL
@@ -76,6 +93,7 @@
 #define GITS_BASER_ENTRY_SIZE_SHIFT     48
 #define GITS_BASER_ENTRY_SIZE(reg)                                       \
                         ((((reg) >> GITS_BASER_ENTRY_SIZE_SHIFT) & 0x1f) +=
 1)
+#define GITS_BASER_ENTRY_SIZE_MASK      GENMASK_ULL(52, 48)
 #define GITS_BASER_SHAREABILITY_SHIFT   10
 #define GITS_BASER_PAGE_SIZE_SHIFT      8
 #define GITS_BASER_SIZE_MASK            0xff
@@ -83,7 +101,48 @@
 #define GITS_BASER_OUTER_CACHEABILITY_MASK   (0x7ULL << GITS_BASER_OUTER_C=
ACHEABILITY_SHIFT)
 #define GITS_BASER_INNER_CACHEABILITY_MASK   (0x7ULL << GITS_BASER_INNER_C=
ACHEABILITY_SHIFT)
=20
+#define GIC_PAGE_SIZE_4K                0ULL
+#define GIC_PAGE_SIZE_16K               1ULL
+#define GIC_PAGE_SIZE_64K               2ULL
+#define GIC_PAGE_SIZE_MASK              3ULL
+
+#define __GITS_BASER_PSZ(sz)            \
+    (GIC_PAGE_SIZE_ ## sz << GITS_BASER_PAGE_SIZE_SHIFT)
+#define GITS_BASER_PAGE_SIZE_4K         __GITS_BASER_PSZ(4K)
+#define GITS_BASER_PAGE_SIZE_16K        __GITS_BASER_PSZ(16K)
+#define GITS_BASER_PAGE_SIZE_64K        __GITS_BASER_PSZ(64K)
+#define GITS_BASER_PAGE_SIZE_MASK       __GITS_BASER_PSZ(MASK)
+
+#define GITS_BASER_NR_PAGES(r)         (((r) & 0xff) + 1)
+
+#define GITS_BASER_PHYS_52_to_48(phys)					\
+	(((phys) & GENMASK_ULL(47, 16)) | (((phys) >> 48) & 0xf) << 12)
+#define GITS_BASER_ADDR_48_to_52(baser)					\
+	(((baser) & GENMASK_ULL(47, 16)) | (((baser) >> 12) & 0xf) << 48)
+
+#define GIC_BASER_CACHEABILITY(reg, inner_outer, type)			\
+	(GIC_BASER_CACHE_##type << reg##_##inner_outer##_CACHEABILITY_SHIFT)
+
+#define GIC_BASER_SHAREABILITY(reg, type)				\
+	(GIC_BASER_##type << reg##_SHAREABILITY_SHIFT)
+
 #define GITS_CBASER_SIZE_MASK           0xff
+#define GITS_CBASER_VALID               (1ULL << 63)
+#define GITS_CBASER_SHAREABILITY_SHIFT  (10)
+#define GITS_CBASER_INNER_CACHEABILITY_SHIFT    (59)
+#define GITS_CBASER_OUTER_CACHEABILITY_SHIFT    (53)
+#define GITS_CBASER_SHAREABILITY_MASK					\
+	GIC_BASER_SHAREABILITY(GITS_CBASER, SHAREABILITY_MASK)
+#define GITS_CBASER_INNER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, MASK)
+#define GITS_CBASER_OUTER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GITS_CBASER, OUTER, MASK)
+#define GITS_CBASER_CACHEABILITY_MASK GITS_CBASER_INNER_CACHEABILITY_MASK
+
+#define GITS_CBASER_InnerShareable					\
+	GIC_BASER_SHAREABILITY(GITS_CBASER, InnerShareable)
+
+#define GITS_CBASER_ADDRESS(cbaser)	((cbaser) & GENMASK_ULL(51, 12))
=20
 /* ITS command definitions */
 #define ITS_CMD_SIZE                    32
@@ -101,8 +160,29 @@
 #define GITS_CMD_MOVALL                 0x0e
 #define GITS_CMD_DISCARD                0x0f
=20
+/*
+ * ITS error numbers
+ */
+#define E_ITS_MOVI_UNMAPPED_INTERRUPT       0x010107
+#define E_ITS_MOVI_UNMAPPED_COLLECTION      0x010109
+#define E_ITS_INT_UNMAPPED_INTERRUPT        0x010307
+#define E_ITS_CLEAR_UNMAPPED_INTERRUPT      0x010507
+#define E_ITS_MAPD_DEVICE_OOR               0x010801
+#define E_ITS_MAPD_ITTSIZE_OOR              0x010802
+#define E_ITS_MAPC_PROCNUM_OOR              0x010902
+#define E_ITS_MAPC_COLLECTION_OOR           0x010903
+#define E_ITS_MAPTI_UNMAPPED_DEVICE         0x010a04
+#define E_ITS_MAPTI_ID_OOR                  0x010a05
+#define E_ITS_MAPTI_PHYSICALID_OOR          0x010a06
+#define E_ITS_INV_UNMAPPED_INTERRUPT        0x010c07
+#define E_ITS_INVALL_UNMAPPED_COLLECTION    0x010d09
+#define E_ITS_MOVALL_PROCNUM_OOR            0x010e01
+#define E_ITS_DISCARD_UNMAPPED_INTERRUPT    0x010f07
+
 #define ITS_DOORBELL_OFFSET             0x10040
 #define GICV3_ITS_SIZE                  SZ_128K
+#define ITS_TRANSLATION_OFFSET          0x10000
+#define GIC_ENCODE_SZ(n, w) (((unsigned long)(n) - 1) & GENMASK_ULL(((w) -=
 1), 0))
=20
 #include <xen/device_tree.h>
 #include <xen/rbtree.h>
@@ -196,6 +276,8 @@ struct pending_irq *gicv3_assign_guest_event(struct dom=
ain *d,
                                              uint32_t virt_lpi);
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
                                  uint32_t virt_lpi);
+uint32_t gicv3_its_get_host_lpi(struct domain *d, paddr_t vdoorbell_addres=
s,
+                                     uint32_t vdevid, uint32_t eventid);
=20
 #else
=20
diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm=
/new_vgic.h
index ed728652de..017ceac2db 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -21,6 +21,8 @@
 #include <xen/list.h>
 #include <xen/mm.h>
 #include <xen/spinlock.h>
+#include <xen/rbtree.h>
+
 #define INTERRUPT_ID_BITS_SPIS  10
 #define INTERRUPT_ID_BITS_ITS   16
 #define VGIC_PRI_BITS           5
@@ -36,6 +38,7 @@
 #define VGIC_MIN_LPI            8192
 #define VGIC_V3_DIST_SIZE       SZ_64K
 #define VGIC_V3_REDIST_SIZE     (2 * SZ_64K)
+#define VGIC_V3_ITS_SIZE        (2 * SZ_64K)
=20
 #define irq_is_ppi(irq) ((irq) >=3D VGIC_NR_SGIS && (irq) < VGIC_NR_PRIVAT=
E_IRQS)
 #define irq_is_spi(irq) ((irq) >=3D VGIC_NR_PRIVATE_IRQS && \
@@ -97,6 +100,7 @@ struct vgic_irq {
 enum iodev_type {
     IODEV_DIST,
     IODEV_REDIST,
+    IODEV_ITS,
 };
=20
 struct vgic_redist_region {
@@ -113,6 +117,35 @@ struct vgic_io_device {
     const struct vgic_register_region *regions;
     enum iodev_type iodev_type;
     unsigned int nr_regions;
+    struct vgic_its *its;
+};
+
+struct vgic_its {
+    /* The base address of the ITS control register frame */
+    paddr_t vgic_its_base;
+
+    bool enabled;
+    struct vgic_io_device iodev;
+    struct domain *domain;
+
+    /* These registers correspond to GITS_BASER{0,1} */
+    u64 baser_device_table;
+    u64 baser_coll_table;
+
+    /* Protects the command queue */
+    struct spinlock cmd_lock;
+    u64 cbaser;
+    u32 creadr;
+    u32 cwriter;
+
+    /* migration ABI revision in use */
+    u32 abi_rev;
+
+    /* Protects the device and collection lists */
+    struct spinlock its_lock;
+    struct list_head device_list;
+    struct list_head collection_list;
+    paddr_t doorbell_address;
 };
=20
 struct vgic_dist {
@@ -148,6 +181,7 @@ struct vgic_dist {
     struct vgic_io_device   dist_iodev;
=20
     bool                has_its;
+    struct vgic_its     *its;
=20
     /*
      * Contains the attributes and gpa of the LPI configuration table.
@@ -156,11 +190,16 @@ struct vgic_dist {
      * GICv3 spec: 6.1.2 "LPI Configuration tables"
      */
     uint64_t            propbaser;
+    struct rb_root      its_devices; /* Devices mapped to an ITS */
+    spinlock_t          its_devices_lock; /* Protects the its_devices tree=
 */
=20
     /* Protects the lpi_list and the count value below. */
     spinlock_t          lpi_list_lock;
     struct list_head    lpi_list_head;
     unsigned int        lpi_list_count;
+
+	/* LPI translation cache */
+	struct list_head	lpi_translation_cache;
 };
=20
 struct vgic_cpu {
@@ -220,6 +259,31 @@ unsigned int vgic_v3_max_rdist_count(const struct doma=
in *d);
 void vgic_flush_pending_lpis(struct vcpu *vcpu);
 #endif
=20
+#ifdef CONFIG_HAS_ITS
+void vgic_its_invalidate_cache(struct domain *d);
+void vgic_enable_lpis(struct vcpu *vcpu);
+int vgic_its_inv_lpi(struct domain *d, struct vgic_irq *irq);
+int vgic_its_invall(struct vcpu *vcpu);
+#else
+static inline void vgic_its_invalidate_cache(struct domain *d)
+{
+}
+
+static inline void vgic_enable_lpis(struct vcpu *vcpu)
+{
+}
+
+static inline int vgic_its_inv_lpi(struct domain *d, struct vgic_irq *irq)
+{
+    return 0;
+}
+
+static inline int vgic_its_invall(struct vcpu *vcpu)
+{
+    return 0;
+}
+#endif
+
 #endif /* __ASM_ARM_NEW_VGIC_H */
=20
 /*
diff --git a/xen/arch/arm/vgic/Makefile b/xen/arch/arm/vgic/Makefile
index 019bfe3d07..195d2019f9 100644
--- a/xen/arch/arm/vgic/Makefile
+++ b/xen/arch/arm/vgic/Makefile
@@ -5,3 +5,4 @@ obj-y +=3D vgic-mmio-v2.o
 obj-$(CONFIG_GICV3) +=3D vgic-v3.o
 obj-$(CONFIG_GICV3) +=3D vgic-mmio-v3.o
 obj-y +=3D vgic-init.o
+obj-$(CONFIG_HAS_ITS) +=3D vgic-its.o
diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index be35cc33ec..2ebeadac1e 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -18,6 +18,7 @@
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <asm/new_vgic.h>
+#include <asm/gic_v3_its.h>
=20
 #include "vgic.h"
=20
@@ -173,8 +174,14 @@ int domain_vgic_init(struct domain *d, unsigned int nr=
_spis)
     }
=20
     INIT_LIST_HEAD(&dist->lpi_list_head);
+    INIT_LIST_HEAD(&dist->lpi_translation_cache);
+    dist->lpi_list_count=3D0;
     spin_lock_init(&dist->lpi_list_lock);
=20
+    ret =3D vgic_v3_its_init_domain(d);
+    if ( ret )
+        return ret;
+
     if ( dist->version =3D=3D GIC_V2 )
         ret =3D vgic_v2_map_resources(d);
     else
diff --git a/xen/arch/arm/vgic/vgic-its.c b/xen/arch/arm/vgic/vgic-its.c
new file mode 100644
index 0000000000..82c1e78ba2
--- /dev/null
+++ b/xen/arch/arm/vgic/vgic-its.c
@@ -0,0 +1,1945 @@
+/*
+ * Imported from Linux ("new" KVM VGIC) and heavily adapted to Xen.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/sched.h>
+#include <xen/guest_access.h>
+#include <xen/sizes.h>
+#include <xen/err.h>
+#include <xen/list_sort.h>
+#include <asm/page.h>
+#include <asm/new_vgic.h>
+#include <asm/gic_v3_defs.h>
+#include <asm/gic_v3_its.h>
+
+#include "vgic.h"
+#include "vgic-mmio.h"
+
+static int update_lpi_config(struct domain *d, struct vgic_irq *irq,
+                             struct vcpu *filter_vcpu, bool needs_inv);
+
+/*
+ * Creates a new (reference to a) struct vgic_irq for a given LPI.
+ * If this LPI is already mapped on another ITS, we increase its refcount
+ * and return a pointer to the existing structure.
+ * If this is a "new" LPI, we allocate and initialize a new struct vgic_ir=
q.
+ * This function returns a pointer to the _unlocked_ structure.
+ */
+static struct vgic_irq *vgic_add_lpi(struct domain *d, struct vgic_its *it=
s,
+                                     u32 intid, u32 devid, u32 eventid,
+                                     struct vcpu *vcpu)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+    struct vgic_irq *irq   =3D vgic_get_irq(d, NULL, intid), *oldirq;
+    uint32_t host_lpi;
+    unsigned long flags;
+    int ret;
+
+    /* In this case there is no put, since we keep the reference. */
+    if ( irq )
+        return irq;
+
+    host_lpi =3D gicv3_its_get_host_lpi(its->domain,
+                                      its->vgic_its_base + ITS_DOORBELL_OF=
FSET,
+                                      devid, eventid);
+
+    if ( host_lpi =3D=3D INVALID_LPI )
+        return ERR_PTR(-EINVAL);
+
+    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, intid);
+
+    irq =3D xzalloc(struct vgic_irq);
+
+    if ( !irq )
+        return ERR_PTR(-ENOMEM);
+
+    memset(irq, 0, sizeof(*irq));
+
+    INIT_LIST_HEAD(&irq->lpi_list);
+    INIT_LIST_HEAD(&irq->ap_list);
+    spin_lock_init(&irq->irq_lock);
+
+    irq->config =3D VGIC_CONFIG_EDGE;
+    atomic_set(&irq->refcount, 1);
+    irq->intid       =3D intid;
+    irq->target_vcpu =3D vcpu;
+
+    spin_lock_irqsave(&dist->lpi_list_lock, flags);
+
+    /*
+     * There could be a race with another vgic_add_lpi(), so we need to
+     * check that we don't add a second list entry with the same LPI.
+     */
+    list_for_each_entry(oldirq, &dist->lpi_list_head, lpi_list)
+    {
+        if ( oldirq->intid !=3D intid )
+            continue;
+
+        /* Someone was faster with adding this LPI, lets use that. */
+        gicv3_lpi_update_host_entry(host_lpi, d->domain_id, INVALID_LPI);
+        irq =3D oldirq;
+
+        /*
+         * This increases the refcount, the caller is expected to
+         * call vgic_put_irq() on the returned pointer once it's
+         * finished with the IRQ.
+         */
+        vgic_get_irq_kref(irq);
+
+        goto out_unlock;
+    }
+
+    list_add_tail(&irq->lpi_list, &dist->lpi_list_head);
+    dist->lpi_list_count++;
+
+out_unlock:
+    spin_unlock_irqrestore(&dist->lpi_list_lock, flags);
+
+    /*
+     * We "cache" the configuration table entries in our struct vgic_irq's=
.
+     * However we only have those structs for mapped IRQs, so we read in
+     * the respective config data from memory here upon mapping the LPI.
+     *
+     * Should any of these fail, behave as if we couldn't create the LPI
+     * by dropping the refcount and returning the error.
+     */
+    ret =3D update_lpi_config(d, irq, NULL, false);
+    if ( ret )
+    {
+        vgic_put_irq(d, irq);
+        gicv3_lpi_update_host_entry(host_lpi, d->domain_id, INVALID_LPI);
+        return ERR_PTR(ret);
+    }
+
+    ret =3D vgic_v3_lpi_sync_pending_status(d, irq);
+    if ( ret )
+    {
+        vgic_put_irq(d, irq);
+        gicv3_lpi_update_host_entry(host_lpi, d->domain_id, INVALID_LPI);
+        return ERR_PTR(ret);
+    }
+
+    return irq;
+}
+
+struct its_device {
+    struct list_head dev_list;
+
+    /* the head for the list of ITTEs */
+    struct list_head itt_head;
+    u32 num_eventid_bits;
+    paddr_t itt_addr;
+    u32 device_id;
+};
+
+#define COLLECTION_NOT_MAPPED ((u32)~0)
+
+struct its_collection {
+    struct list_head coll_list;
+
+    u32 collection_id;
+    u32 target_addr;
+};
+
+struct its_ite {
+    struct list_head ite_list;
+
+    struct vgic_irq *irq;
+    struct its_collection *collection;
+    u32 event_id;
+};
+
+struct vgic_translation_cache_entry {
+    struct list_head entry;
+    paddr_t db;
+    u32 devid;
+    u32 eventid;
+    struct vgic_irq *irq;
+};
+
+/**
+ * struct vgic_its_abi - ITS abi ops and settings
+ * @cte_esz: collection table entry size
+ * @dte_esz: device table entry size
+ * @ite_esz: interrupt translation table entry size
+ * @save tables: save the ITS tables into guest RAM
+ * @restore_tables: restore the ITS internal structs from tables
+ *  stored in guest RAM
+ * @commit: initialize the registers which expose the ABI settings,
+ *  especially the entry sizes
+ */
+struct vgic_its_abi {
+    int cte_esz;
+    int dte_esz;
+    int ite_esz;
+};
+
+#define ABI_0_ESZ 8
+#define ESZ_MAX   ABI_0_ESZ
+
+static const struct vgic_its_abi its_table_abi_versions[] =3D {
+    [0] =3D {
+     .cte_esz =3D ABI_0_ESZ,
+     .dte_esz =3D ABI_0_ESZ,
+     .ite_esz =3D ABI_0_ESZ,
+    },
+};
+
+#define NR_ITS_ABIS ARRAY_SIZE(its_table_abi_versions)
+
+static inline const struct vgic_its_abi *vgic_its_get_abi(struct vgic_its =
*its)
+{
+    return &its_table_abi_versions[its->abi_rev];
+}
+
+static int vgic_its_set_abi(struct vgic_its *its, u32 rev)
+{
+    its->abi_rev =3D rev;
+    return 0;
+}
+
+#define its_is_collection_mapped(coll)                                    =
     \
+    ((coll) && ((coll)->target_addr !=3D COLLECTION_NOT_MAPPED))
+
+#define KVM_MSI_VALID_DEVID (1U << 0)
+
+struct xen_msi {
+    u32 address_lo;
+    u32 address_hi;
+    u32 data;
+    u32 flags;
+    u32 devid;
+    u8 pad[12];
+};
+
+/*
+ * Find and returns a device in the device table for an ITS.
+ * Must be called with the its_lock mutex held.
+ */
+static struct its_device *find_its_device(struct vgic_its *its, u32 device=
_id)
+{
+    struct its_device *device;
+
+    list_for_each_entry(device, &its->device_list, dev_list)
+        if ( device_id =3D=3D device->device_id )
+            return device;
+
+    return NULL;
+}
+
+/*
+ * Find and returns an interrupt translation table entry (ITTE) for a give=
n
+ * Device ID/Event ID pair on an ITS.
+ * Must be called with the its_lock mutex held.
+ */
+static struct its_ite *find_ite(struct vgic_its *its, u32 device_id,
+                                u32 event_id)
+{
+    struct its_device *device;
+    struct its_ite *ite;
+
+    device =3D find_its_device(its, device_id);
+    if ( device =3D=3D NULL )
+        return NULL;
+
+    list_for_each_entry(ite, &device->itt_head, ite_list)
+        if ( ite->event_id =3D=3D event_id )
+            return ite;
+
+    return NULL;
+}
+
+/* To be used as an iterator this macro misses the enclosing parentheses *=
/
+#define for_each_lpi_its(dev, ite, its)                                   =
     \
+    list_for_each_entry(dev, &(its)->device_list, dev_list)               =
     \
+        list_for_each_entry(ite, &(dev)->itt_head, ite_list)
+
+#define GIC_LPI_OFFSET              8192
+
+#define VITS_TYPER_IDBITS           16
+#define VITS_TYPER_DEVBITS          16
+#define VITS_DTE_MAX_DEVID_OFFSET   (BIT(14, UL) - 1)
+#define VITS_ITE_MAX_EVENTID_OFFSET (BIT(16, UL) - 1)
+
+static struct its_collection *find_collection(struct vgic_its *its, int co=
ll_id)
+{
+    struct its_collection *collection;
+
+    list_for_each_entry(collection, &its->collection_list, coll_list)
+    {
+        if ( coll_id =3D=3D collection->collection_id )
+            return collection;
+    }
+
+    return NULL;
+}
+
+#define LPI_PROP_ENABLE_BIT(p) ((p)&LPI_PROP_ENABLED)
+#define LPI_PROP_PRIORITY(p)   ((p)&0xfc)
+
+/*
+ * Reads the configuration data for a given LPI from guest memory and
+ * updates the fields in struct vgic_irq.
+ * If filter_vcpu is not NULL, applies only if the IRQ is targeting this
+ * VCPU. Unconditionally applies if filter_vcpu is NULL.
+ */
+static int update_lpi_config(struct domain *d, struct vgic_irq *irq,
+                             struct vcpu *filter_vcpu, bool needs_inv)
+{
+    u64 propbase =3D GICR_PROPBASER_ADDRESS(d->arch.vgic.propbaser);
+    u8 prop;
+    int ret;
+    unsigned long flags;
+
+    ret =3D access_guest_memory_by_gpa(d, propbase + irq->intid - GIC_LPI_=
OFFSET,
+                                     &prop, 1, false);
+
+    if ( ret )
+        return ret;
+
+    spin_lock_irqsave(&irq->irq_lock, flags);
+
+    if ( !filter_vcpu || filter_vcpu =3D=3D irq->target_vcpu )
+    {
+        irq->priority =3D LPI_PROP_PRIORITY(prop);
+        irq->enabled  =3D LPI_PROP_ENABLE_BIT(prop);
+
+        if ( !irq->hw )
+        {
+            vgic_queue_irq_unlock(d, irq, flags);
+            return 0;
+        }
+    }
+
+    spin_unlock_irqrestore(&irq->irq_lock, flags);
+
+    /* GICv4 style VLPIS are not yet supported */
+    WARN_ON(irq->hw);
+
+    return 0;
+}
+
+/*
+ * Create a snapshot of the current LPIs targeting @vcpu, so that we can
+ * enumerate those LPIs without holding any lock.
+ * Returns their number and puts the kmalloc'ed array into intid_ptr.
+ */
+int vgic_copy_lpi_list(struct domain *d, struct vcpu *vcpu, u32 **intid_pt=
r)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+    struct vgic_irq *irq;
+    unsigned long flags;
+    u32 *intids;
+    int irq_count, i =3D 0;
+
+    /*
+     * There is an obvious race between allocating the array and LPIs
+     * being mapped/unmapped. If we ended up here as a result of a
+     * command, we're safe (locks are held, preventing another
+     * command). If coming from another path (such as enabling LPIs),
+     * we must be careful not to overrun the array.
+     */
+    irq_count =3D ACCESS_ONCE(dist->lpi_list_count);
+    intids    =3D xmalloc_array(u32, irq_count);
+    if ( !intids )
+        return -ENOMEM;
+
+    spin_lock_irqsave(&dist->lpi_list_lock, flags);
+    list_for_each_entry(irq, &dist->lpi_list_head, lpi_list)
+    {
+        if ( i =3D=3D irq_count )
+            break;
+        /* We don't need to "get" the IRQ, as we hold the list lock. */
+        if ( vcpu && irq->target_vcpu !=3D vcpu )
+            continue;
+        intids[i++] =3D irq->intid;
+    }
+    spin_unlock_irqrestore(&dist->lpi_list_lock, flags);
+
+    *intid_ptr =3D intids;
+    return i;
+}
+
+static int update_affinity(struct vgic_irq *irq, struct vcpu *vcpu)
+{
+    int ret =3D 0;
+    unsigned long flags;
+
+    spin_lock_irqsave(&irq->irq_lock, flags);
+    irq->target_vcpu =3D vcpu;
+    spin_unlock_irqrestore(&irq->irq_lock, flags);
+
+    /* GICv4 style VLPIS are not yet supported */
+    WARN_ON(irq->hw);
+
+    return ret;
+}
+
+/*
+ * Promotes the ITS view of affinity of an ITTE (which redistributor this =
LPI
+ * is targeting) to the VGIC's view, which deals with target VCPUs.
+ * Needs to be called whenever either the collection for a LPIs has
+ * changed or the collection itself got retargeted.
+ */
+static void update_affinity_ite(struct domain *d, struct its_ite *ite)
+{
+    struct vcpu *vcpu;
+
+    if ( !its_is_collection_mapped(ite->collection) )
+        return;
+
+    vcpu =3D d->vcpu[ite->collection->target_addr];
+    update_affinity(ite->irq, vcpu);
+}
+
+/*
+ * Updates the target VCPU for every LPI targeting this collection.
+ * Must be called with the its_lock mutex held.
+ */
+static void update_affinity_collection(struct domain *d, struct vgic_its *=
its,
+                                       struct its_collection *coll)
+{
+    struct its_device *device;
+    struct its_ite *ite;
+
+    for_each_lpi_its(device, ite, its)
+    {
+        if ( !ite->collection || coll !=3D ite->collection )
+            continue;
+
+        update_affinity_ite(d, ite);
+    }
+}
+
+void __vgic_put_lpi_locked(struct domain *d, struct vgic_irq *irq)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+
+    if ( !atomic_dec_and_test(&irq->refcount) )
+    {
+        return;
+    };
+
+    list_del(&irq->lpi_list);
+    dist->lpi_list_count--;
+
+    xfree(irq);
+}
+
+static u32 max_lpis_propbaser(u64 propbaser)
+{
+    int nr_idbits =3D (propbaser & 0x1f) + 1;
+
+    return 1U << min(nr_idbits, INTERRUPT_ID_BITS_ITS);
+}
+
+static struct vgic_irq *__vgic_its_check_cache(struct vgic_dist *dist,
+                                               paddr_t db, u32 devid,
+                                               u32 eventid)
+{
+    struct vgic_translation_cache_entry *cte, *fcte;
+
+    list_for_each_entry(cte, &dist->lpi_translation_cache, entry)
+    {
+        /*
+         * If we hit a NULL entry, there is nothing after this
+         * point.
+         */
+        if ( !cte->irq )
+            break;
+
+        if ( cte->db !=3D db || cte->devid !=3D devid || cte->eventid !=3D=
 eventid )
+            continue;
+
+        /*
+         * Move this entry to the head, as it is the most
+         * recently used.
+         */
+        fcte =3D list_first_entry(&dist->lpi_translation_cache,
+                                struct vgic_translation_cache_entry, entry=
);
+
+        if ( fcte->irq !=3D cte->irq )
+            list_move(&cte->entry, &dist->lpi_translation_cache);
+
+        return cte->irq;
+    }
+
+    return NULL;
+}
+
+static void vgic_its_cache_translation(struct domain *d, struct vgic_its *=
its,
+                                       u32 devid, u32 eventid,
+                                       struct vgic_irq *irq)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+    struct vgic_translation_cache_entry *cte;
+    unsigned long flags;
+    paddr_t db;
+
+    /* Do not cache a directly injected interrupt */
+    if ( irq->hw )
+        return;
+
+    spin_lock_irqsave(&dist->lpi_list_lock, flags);
+
+    if ( unlikely(list_empty(&dist->lpi_translation_cache)) )
+        goto out;
+
+    /*
+     * We could have raced with another CPU caching the same
+     * translation behind our back, so let's check it is not in
+     * already
+     */
+    db =3D its->vgic_its_base + GITS_TRANSLATER;
+    if ( __vgic_its_check_cache(dist, db, devid, eventid) )
+        goto out;
+
+    /* Always reuse the last entry (LRU policy) */
+    cte =3D list_last_entry(&dist->lpi_translation_cache, typeof(*cte), en=
try);
+
+    /*
+     * Caching the translation implies having an extra reference
+     * to the interrupt, so drop the potential reference on what
+     * was in the cache, and increment it on the new interrupt.
+     */
+    if ( cte->irq )
+        __vgic_put_lpi_locked(d, cte->irq);
+
+    vgic_get_irq_kref(irq);
+
+    cte->db      =3D db;
+    cte->devid   =3D devid;
+    cte->eventid =3D eventid;
+    cte->irq     =3D irq;
+
+    /* Move the new translation to the head of the list */
+    list_move(&cte->entry, &dist->lpi_translation_cache);
+
+out:
+    spin_unlock_irqrestore(&dist->lpi_list_lock, flags);
+}
+
+void vgic_its_invalidate_cache(struct domain *d)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+    struct vgic_translation_cache_entry *cte;
+    unsigned long flags;
+
+    spin_lock_irqsave(&dist->lpi_list_lock, flags);
+
+    list_for_each_entry(cte, &dist->lpi_translation_cache, entry)
+    {
+        /*
+         * If we hit a NULL entry, there is nothing after this
+         * point.
+         */
+        if ( !cte->irq )
+            break;
+
+        __vgic_put_lpi_locked(d, cte->irq);
+        cte->irq =3D NULL;
+    }
+
+    spin_unlock_irqrestore(&dist->lpi_list_lock, flags);
+}
+
+int vgic_its_resolve_lpi(struct domain *d, struct vgic_its *its, u32 devid=
,
+                         u32 eventid, struct vgic_irq **irq)
+{
+    struct vcpu *vcpu;
+    struct its_ite *ite;
+
+    if ( !its->enabled )
+        return -EBUSY;
+
+    ite =3D find_ite(its, devid, eventid);
+    if ( !ite || !its_is_collection_mapped(ite->collection) )
+        return E_ITS_INT_UNMAPPED_INTERRUPT;
+
+    vcpu =3D d->vcpu[ite->collection->target_addr];
+    if ( !vcpu )
+        return E_ITS_INT_UNMAPPED_INTERRUPT;
+
+    if ( !vgic_lpis_enabled(vcpu) )
+        return -EBUSY;
+
+    vgic_its_cache_translation(d, its, devid, eventid, ite->irq);
+
+    *irq =3D ite->irq;
+    return 0;
+}
+
+/*
+ * Find the target VCPU and the LPI number for a given devid/eventid pair
+ * and make this IRQ pending, possibly injecting it.
+ * Must be called with the its_lock mutex held.
+ * Returns 0 on success, a positive error value for any ITS mapping
+ * related errors and negative error values for generic errors.
+ */
+static int vgic_its_trigger_msi(struct domain *d, struct vgic_its *its,
+                                u32 devid, u32 eventid)
+{
+    struct vgic_irq *irq =3D NULL;
+    unsigned long flags;
+    int err;
+
+    err =3D vgic_its_resolve_lpi(d, its, devid, eventid, &irq);
+    if ( err )
+        return err;
+
+    /* GICv4 style VLPIS are not yet supported */
+    WARN_ON(irq->hw);
+
+    spin_lock_irqsave(&irq->irq_lock, flags);
+    irq->pending_latch =3D true;
+    vgic_queue_irq_unlock(d, irq, flags);
+
+    return 0;
+}
+
+static u64 its_cmd_mask_field(u64 *its_cmd, int word, int shift, int size)
+{
+    return (le64_to_cpu(its_cmd[word]) >> shift) & (BIT(size, ULL) - 1);
+}
+
+/* Requires the its_lock to be held. */
+static void its_free_ite(struct domain *d, struct its_ite *ite)
+{
+    list_del(&ite->ite_list);
+
+    /* This put matches the get in vgic_add_lpi. */
+    if ( ite->irq )
+    {
+        /* GICv4 style VLPIS are not yet supported */
+        WARN_ON(ite->irq->hw);
+
+        vgic_put_irq(d, ite->irq);
+    }
+
+    xfree(ite);
+}
+
+/* Must be called with its_lock mutex held */
+static struct its_ite *vgic_its_alloc_ite(struct its_device *device,
+                                          struct its_collection *collectio=
n,
+                                          u32 event_id)
+{
+    struct its_ite *ite;
+
+    ite =3D xzalloc(struct its_ite);
+    if ( !ite )
+        return ERR_PTR(-ENOMEM);
+
+    ite->event_id   =3D event_id;
+    ite->collection =3D collection;
+
+    list_add_tail(&ite->ite_list, &device->itt_head);
+    return ite;
+}
+
+#define its_cmd_get_command(cmd)     its_cmd_mask_field(cmd, 0, 0, 8)
+#define its_cmd_get_deviceid(cmd)    its_cmd_mask_field(cmd, 0, 32, 32)
+#define its_cmd_get_size(cmd)        (its_cmd_mask_field(cmd, 1, 0, 5) + 1=
)
+#define its_cmd_get_id(cmd)          its_cmd_mask_field(cmd, 1, 0, 32)
+#define its_cmd_get_physical_id(cmd) its_cmd_mask_field(cmd, 1, 32, 32)
+#define its_cmd_get_collection(cmd)  its_cmd_mask_field(cmd, 2, 0, 16)
+#define its_cmd_get_ittaddr(cmd)     (its_cmd_mask_field(cmd, 2, 8, 44) <<=
 8)
+#define its_cmd_get_target_addr(cmd) its_cmd_mask_field(cmd, 2, 16, 32)
+#define its_cmd_get_validbit(cmd)    its_cmd_mask_field(cmd, 2, 63, 1)
+
+/*
+ * Check whether a guest physical address is owned by it
+*/
+static bool __is_visible_gfn_locked(struct vgic_its *its, paddr_t gpa)
+{
+    gfn_t gfn =3D gaddr_to_gfn(gpa);
+    volatile struct domain *d;
+    struct page_info *page;
+
+    page =3D mfn_to_page(gfn_to_mfn(its->domain, gfn));
+    if ( !page )
+        return false;
+
+    d =3D page_get_owner(page);
+    if ( !d )
+        return false;
+
+    return d =3D=3D its->domain;
+}
+
+/*
+ * Check whether an event ID can be stored in the corresponding Interrupt
+ * Translation Table, which starts at device->itt_addr.
+ */
+static bool vgic_its_check_event_id(struct vgic_its *its,
+                                    struct its_device *device, u32 event_i=
d)
+{
+    const struct vgic_its_abi *abi =3D vgic_its_get_abi(its);
+    int ite_esz                    =3D abi->ite_esz;
+    paddr_t gpa;
+
+    /* max table size is: BIT_ULL(device->num_eventid_bits) * ite_esz */
+    if ( event_id >=3D BIT(device->num_eventid_bits, ULL) )
+        return false;
+
+    gpa =3D device->itt_addr + event_id * ite_esz;
+    return __is_visible_gfn_locked(its, gpa);
+}
+
+/*
+ * Check whether an ID can be stored into the corresponding guest table.
+ * For a direct table this is pretty easy, but gets a bit nasty for
+ * indirect tables. We check whether the resulting guest physical address
+ * is actually valid (covered by a memslot and guest accessible).
+ * For this we have to read the respective first level entry.
+ */
+static bool vgic_its_check_id(struct vgic_its *its, u64 baser, u32 id,
+                              paddr_t *eaddr)
+{
+    int l1_tbl_size =3D GITS_BASER_NR_PAGES(baser) * SZ_64K;
+    u64 indirect_ptr, type =3D GITS_BASER_TYPE(baser);
+    paddr_t base =3D GITS_BASER_ADDR_48_to_52(baser);
+    int esz      =3D GITS_BASER_ENTRY_SIZE(baser);
+    int index;
+
+    switch ( type )
+    {
+    case GITS_BASER_TYPE_DEVICE:
+        if ( id >=3D BIT(VITS_TYPER_DEVBITS, ULL) )
+            return false;
+        break;
+    case GITS_BASER_TYPE_COLLECTION:
+        /* as GITS_TYPER.CIL =3D=3D 0, ITS supports 16-bit collection ID *=
/
+        if ( id >=3D BIT(16, ULL) )
+            return false;
+        break;
+    default:
+        return false;
+    }
+
+    if ( !(baser & GITS_BASER_INDIRECT) )
+    {
+        paddr_t addr;
+
+        if ( id >=3D (l1_tbl_size / esz) )
+            return false;
+
+        addr =3D base + id * esz;
+
+        if ( eaddr )
+            *eaddr =3D addr;
+
+        return __is_visible_gfn_locked(its, addr);
+    }
+
+    /* calculate and check the index into the 1st level */
+    index =3D id / (SZ_64K / esz);
+    if ( index >=3D (l1_tbl_size / sizeof(u64)) )
+        return false;
+
+    /* Each 1st level entry is represented by a 64-bit value. */
+    if ( access_guest_memory_by_gpa(its->domain,
+                                    base + index * sizeof(indirect_ptr),
+                                    &indirect_ptr, sizeof(indirect_ptr), 0=
) )
+        return false;
+
+    indirect_ptr =3D le64_to_cpu(indirect_ptr);
+
+    /* check the valid bit of the first level entry */
+    if ( !(indirect_ptr & BIT(63, ULL)) )
+        return false;
+
+    /* Mask the guest physical address and calculate the frame number. */
+    indirect_ptr &=3D GENMASK_ULL(51, 16);
+
+    /* Find the address of the actual entry */
+    index =3D id % (SZ_64K / esz);
+    indirect_ptr +=3D index * esz;
+
+    if ( eaddr )
+        *eaddr =3D indirect_ptr;
+
+    return __is_visible_gfn_locked(its, indirect_ptr);
+}
+
+/*
+ * Add a new collection into the ITS collection table.
+ * Returns 0 on success, and a negative error value for generic errors.
+ */
+static int vgic_its_alloc_collection(struct vgic_its *its,
+                                     struct its_collection **colp, u32 col=
l_id)
+{
+    struct its_collection *collection;
+
+    collection =3D xzalloc(struct its_collection);
+    if ( !collection )
+        return -ENOMEM;
+
+    collection->collection_id =3D coll_id;
+    collection->target_addr   =3D COLLECTION_NOT_MAPPED;
+
+    list_add_tail(&collection->coll_list, &its->collection_list);
+    *colp =3D collection;
+
+    return 0;
+}
+
+static void vgic_its_free_collection(struct vgic_its *its, u32 coll_id)
+{
+    struct its_collection *collection;
+    struct its_device *device;
+    struct its_ite *ite;
+
+    /*
+     * Clearing the mapping for that collection ID removes the
+     * entry from the list. If there wasn't any before, we can
+     * go home early.
+     */
+    collection =3D find_collection(its, coll_id);
+    if ( !collection )
+        return;
+
+    for_each_lpi_its( device, ite, its)
+        if ( ite->collection && ite->collection->collection_id =3D=3D coll=
_id )
+        ite->collection =3D NULL;
+
+    list_del(&collection->coll_list);
+    xfree(collection);
+}
+
+/* Requires the its_lock to be held. */
+static void vgic_its_free_device(struct domain *d, struct its_device *devi=
ce)
+{
+    struct its_ite *ite, *temp;
+
+    /*
+     * The spec says that unmapping a device with still valid
+     * ITTEs associated is UNPREDICTABLE. We remove all ITTEs,
+     * since we cannot leave the memory unreferenced.
+     */
+    list_for_each_entry_safe(ite, temp, &device->itt_head, ite_list)
+        its_free_ite(d, ite);
+
+    vgic_its_invalidate_cache(d);
+
+    list_del(&device->dev_list);
+    xfree(device);
+}
+
+/* its lock must be held */
+static void vgic_its_free_device_list(struct domain *d, struct vgic_its *i=
ts)
+{
+    struct its_device *cur, *temp;
+
+    list_for_each_entry_safe(cur, temp, &its->device_list, dev_list)
+        vgic_its_free_device(d, cur);
+}
+
+/* its lock must be held */
+static void vgic_its_free_collection_list(struct domain *d,
+                                          struct vgic_its *its)
+{
+    struct its_collection *cur, *temp;
+
+    list_for_each_entry_safe(cur, temp, &its->collection_list, coll_list)
+        vgic_its_free_collection(its, cur->collection_id);
+}
+
+/* Must be called with its_lock mutex held */
+static struct its_device *vgic_its_alloc_device(struct vgic_its *its,
+                                                u32 device_id, paddr_t itt=
_addr,
+                                                u8 num_eventid_bits)
+{
+    struct its_device *device;
+
+    device =3D xzalloc(struct its_device);
+    if ( !device )
+        return ERR_PTR(-ENOMEM);
+
+    device->device_id        =3D device_id;
+    device->itt_addr         =3D itt_addr;
+    device->num_eventid_bits =3D num_eventid_bits;
+    INIT_LIST_HEAD(&device->itt_head);
+
+    list_add_tail(&device->dev_list, &its->device_list);
+    return device;
+}
+
+/*
+ * MAPD maps or unmaps a device ID to Interrupt Translation Tables (ITTs).
+ * Must be called with the its_lock mutex held.
+ */
+
+static int vgic_its_cmd_handle_mapd(struct domain *d, struct vgic_its *its=
,
+                                    u64 *its_cmd)
+{
+    uint32_t guest_devid =3D its_cmd_get_deviceid(its_cmd);
+    bool valid           =3D its_cmd_get_validbit(its_cmd);
+    u8 num_eventid_bits  =3D its_cmd_get_size(its_cmd);
+    paddr_t itt_addr     =3D its_cmd_get_ittaddr(its_cmd);
+    int ret =3D 0;
+    struct its_device *device;
+
+    if ( !vgic_its_check_id(its, its->baser_device_table, guest_devid, NUL=
L) )
+        return E_ITS_MAPD_DEVICE_OOR;
+
+    if ( valid && num_eventid_bits > VITS_TYPER_IDBITS )
+        return E_ITS_MAPD_ITTSIZE_OOR;
+
+    device =3D find_its_device(its, guest_devid);
+
+    /*
+     * The spec says that calling MAPD on an already mapped device
+     * invalidates all cached data for this device. We implement this
+     * by removing the mapping and re-establishing it.
+     */
+    if ( device )
+        vgic_its_free_device(d, device);
+    else
+        device =3D
+            vgic_its_alloc_device(its, guest_devid, itt_addr, num_eventid_=
bits);
+
+    /*
+     * There is no easy and clean way for Xen to know the ITS device ID of=
 a
+     * particular (PCI) device, so we have to rely on the guest telling
+     * us about it. For *now* we are just using the device ID *Dom0* uses,
+     * because the driver there has the actual knowledge.
+     * Eventually this will be replaced with a dedicated hypercall to
+     * announce pass-through of devices.
+     */
+    if ( is_hardware_domain(its->domain) )
+    {
+        ret =3D gicv3_its_map_guest_device(its->domain, its->doorbell_addr=
ess,
+                                        guest_devid,
+                                        its->vgic_its_base + ITS_DOORBELL_=
OFFSET,
+                                        guest_devid, BIT(num_eventid_bits,=
 UL),
+                                        valid);
+    }
+    if ( ret && valid )
+        return ret;
+
+    return IS_ERR(device) ? PTR_ERR(device) : 0;
+}
+
+/*
+ * The MAPC command maps collection IDs to redistributors.
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_mapc(struct domain *d, struct vgic_its *its=
,
+                                    u64 *its_cmd)
+{
+    u16 coll_id;
+    u32 target_addr;
+    struct its_collection *collection;
+    bool valid;
+
+    valid       =3D its_cmd_get_validbit(its_cmd);
+    coll_id     =3D its_cmd_get_collection(its_cmd);
+    target_addr =3D its_cmd_get_target_addr(its_cmd);
+
+    if ( target_addr >=3D d->max_vcpus )
+        return E_ITS_MAPC_PROCNUM_OOR;
+
+    if ( !valid )
+    {
+        vgic_its_free_collection(its, coll_id);
+        vgic_its_invalidate_cache(d);
+    }
+    else
+    {
+        collection =3D find_collection(its, coll_id);
+
+        if ( !collection )
+        {
+            int ret;
+
+            if ( !vgic_its_check_id(its, its->baser_coll_table, coll_id, N=
ULL) )
+                return E_ITS_MAPC_COLLECTION_OOR;
+
+            ret =3D vgic_its_alloc_collection(its, &collection, coll_id);
+            if ( ret )
+                return ret;
+            collection->target_addr =3D target_addr;
+        }
+        else
+        {
+            collection->target_addr =3D target_addr;
+            update_affinity_collection(d, its, collection);
+        }
+    }
+
+    return 0;
+}
+
+/*
+ * The MAPTI and MAPI commands map LPIs to ITTEs.
+ * Must be called with its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_mapi(struct domain *d, struct vgic_its *its=
,
+                                    u64 *its_cmd)
+{
+    u32 device_id =3D its_cmd_get_deviceid(its_cmd);
+    u32 event_id  =3D its_cmd_get_id(its_cmd);
+    u32 coll_id   =3D its_cmd_get_collection(its_cmd);
+    struct its_ite *ite;
+    struct vcpu *vcpu =3D NULL;
+    struct its_device *device;
+    struct its_collection *collection, *new_coll =3D NULL;
+    struct vgic_irq *irq;
+    int lpi_nr;
+
+    device =3D find_its_device(its, device_id);
+    if ( !device )
+        return E_ITS_MAPTI_UNMAPPED_DEVICE;
+
+    if ( !vgic_its_check_event_id(its, device, event_id) )
+        return E_ITS_MAPTI_ID_OOR;
+
+    if ( its_cmd_get_command(its_cmd) =3D=3D GITS_CMD_MAPTI )
+        lpi_nr =3D its_cmd_get_physical_id(its_cmd);
+    else
+        lpi_nr =3D event_id;
+    if ( lpi_nr < GIC_LPI_OFFSET ||
+         lpi_nr >=3D max_lpis_propbaser(d->arch.vgic.propbaser) )
+        return E_ITS_MAPTI_PHYSICALID_OOR;
+
+    /* If there is an existing mapping, behavior is UNPREDICTABLE. */
+    if ( find_ite(its, device_id, event_id) )
+        return 0;
+
+    collection =3D find_collection(its, coll_id);
+    if ( !collection )
+    {
+        int ret;
+
+        if ( !vgic_its_check_id(its, its->baser_coll_table, coll_id, NULL)=
 )
+            return E_ITS_MAPC_COLLECTION_OOR;
+
+        ret =3D vgic_its_alloc_collection(its, &collection, coll_id);
+        if ( ret )
+            return ret;
+        new_coll =3D collection;
+    }
+
+    ite =3D vgic_its_alloc_ite(device, collection, event_id);
+    if ( IS_ERR(ite) )
+    {
+        if ( new_coll )
+            vgic_its_free_collection(its, coll_id);
+        return PTR_ERR(ite);
+    }
+
+    if ( its_is_collection_mapped(collection) )
+        vcpu =3D d->vcpu[collection->target_addr];
+
+    irq =3D vgic_add_lpi(d, its, lpi_nr, device_id, event_id, vcpu);
+    if ( IS_ERR(irq) )
+    {
+        if ( new_coll )
+            vgic_its_free_collection(its, coll_id);
+        its_free_ite(d, ite);
+        return PTR_ERR(irq);
+    }
+    ite->irq =3D irq;
+
+    return 0;
+}
+
+/*
+ * The MOVI command moves an ITTE to a different collection.
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_movi(struct domain *d, struct vgic_its *its=
,
+                                    u64 *its_cmd)
+{
+    u32 device_id =3D its_cmd_get_deviceid(its_cmd);
+    u32 event_id  =3D its_cmd_get_id(its_cmd);
+    u32 coll_id   =3D its_cmd_get_collection(its_cmd);
+    struct vcpu *vcpu;
+    struct its_ite *ite;
+    struct its_collection *collection;
+
+    ite =3D find_ite(its, device_id, event_id);
+    if ( !ite )
+        return E_ITS_MOVI_UNMAPPED_INTERRUPT;
+
+    if ( !its_is_collection_mapped(ite->collection) )
+        return E_ITS_MOVI_UNMAPPED_COLLECTION;
+
+    collection =3D find_collection(its, coll_id);
+    if ( !its_is_collection_mapped(collection) )
+        return E_ITS_MOVI_UNMAPPED_COLLECTION;
+
+    ite->collection =3D collection;
+    vcpu            =3D d->vcpu[collection->target_addr];
+
+    vgic_its_invalidate_cache(d);
+
+    return update_affinity(ite->irq, vcpu);
+}
+
+/*
+ * The DISCARD command frees an Interrupt Translation Table Entry (ITTE).
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_discard(struct domain *d, struct vgic_its *=
its,
+                                       u64 *its_cmd)
+{
+    u32 device_id =3D its_cmd_get_deviceid(its_cmd);
+    u32 event_id  =3D its_cmd_get_id(its_cmd);
+    struct its_ite *ite;
+
+    ite =3D find_ite(its, device_id, event_id);
+    if ( ite && its_is_collection_mapped(ite->collection) )
+    {
+        /*
+         * Though the spec talks about removing the pending state, we
+         * don't bother here since we clear the ITTE anyway and the
+         * pending state is a property of the ITTE struct.
+         */
+        vgic_its_invalidate_cache(d);
+
+        its_free_ite(d, ite);
+        return 0;
+    }
+
+    return E_ITS_DISCARD_UNMAPPED_INTERRUPT;
+}
+
+/*
+ * The CLEAR command removes the pending state for a particular LPI.
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_clear(struct domain *d, struct vgic_its *it=
s,
+                                     u64 *its_cmd)
+{
+    u32 device_id =3D its_cmd_get_deviceid(its_cmd);
+    u32 event_id  =3D its_cmd_get_id(its_cmd);
+    struct its_ite *ite;
+
+    ite =3D find_ite(its, device_id, event_id);
+    if ( !ite )
+        return E_ITS_CLEAR_UNMAPPED_INTERRUPT;
+
+    ite->irq->pending_latch =3D false;
+
+    /* GICv4 style VLPIS are not yet supported */
+    WARN_ON(ite->irq->hw);
+
+    return 0;
+}
+
+/*
+ * The MOVALL command moves the pending state of all IRQs targeting one
+ * redistributor to another. We don't hold the pending state in the VCPUs,
+ * but in the IRQs instead, so there is really not much to do for us here.
+ * However the spec says that no IRQ must target the old redistributor
+ * afterwards, so we make sure that no LPI is using the associated target_=
vcpu.
+ * This command affects all LPIs in the system that target that redistribu=
tor.
+ */
+static int vgic_its_cmd_handle_movall(struct domain *d, struct vgic_its *i=
ts,
+                                      u64 *its_cmd)
+{
+    u32 target1_addr =3D its_cmd_get_target_addr(its_cmd);
+    u32 target2_addr =3D its_cmd_mask_field(its_cmd, 3, 16, 32);
+    struct vcpu *vcpu1, *vcpu2;
+    struct vgic_irq *irq;
+    u32 *intids;
+    int irq_count, i;
+
+    if ( target1_addr >=3D d->max_vcpus || target2_addr >=3D d->max_vcpus =
)
+        return E_ITS_MOVALL_PROCNUM_OOR;
+
+    if ( target1_addr =3D=3D target2_addr )
+        return 0;
+
+    vcpu1     =3D d->vcpu[target1_addr];
+    vcpu2     =3D d->vcpu[target2_addr];
+
+    irq_count =3D vgic_copy_lpi_list(d, vcpu1, &intids);
+    if ( irq_count < 0 )
+        return irq_count;
+
+    for ( i =3D 0; i < irq_count; i++ )
+    {
+        irq =3D vgic_get_irq(d, NULL, intids[i]);
+
+        update_affinity(irq, vcpu2);
+
+        vgic_put_irq(d, irq);
+    }
+
+    vgic_its_invalidate_cache(d);
+
+    xfree(intids);
+    return 0;
+}
+
+/*
+ * The INT command injects the LPI associated with that DevID/EvID pair.
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_int(struct domain *d, struct vgic_its *its,
+                                   u64 *its_cmd)
+{
+    u32 msi_data  =3D its_cmd_get_id(its_cmd);
+    u64 msi_devid =3D its_cmd_get_deviceid(its_cmd);
+
+    return vgic_its_trigger_msi(d, its, msi_devid, msi_data);
+}
+
+int vgic_its_inv_lpi(struct domain *d, struct vgic_irq *irq)
+{
+    return update_lpi_config(d, irq, NULL, true);
+}
+
+/*
+ * The INV command syncs the configuration bits from the memory table.
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_inv(struct domain *d, struct vgic_its *its,
+                                   u64 *its_cmd)
+{
+    u32 device_id =3D its_cmd_get_deviceid(its_cmd);
+    u32 event_id  =3D its_cmd_get_id(its_cmd);
+    struct its_ite *ite;
+
+    ite =3D find_ite(its, device_id, event_id);
+    if ( !ite )
+        return E_ITS_INV_UNMAPPED_INTERRUPT;
+
+    return vgic_its_inv_lpi(d, ite->irq);
+}
+
+/**
+ * vgic_its_invall - invalidate all LPIs targetting a given vcpu
+ * @vcpu: the vcpu for which the RD is targetted by an invalidation
+ *
+ * Contrary to the INVALL command, this targets a RD instead of a
+ * collection, and we don't need to hold the its_lock, since no ITS is
+ * involved here.
+ */
+int vgic_its_invall(struct vcpu *vcpu)
+{
+    struct domain *d =3D vcpu->domain;
+    int irq_count, i =3D 0;
+    u32 *intids;
+
+    irq_count =3D vgic_copy_lpi_list(d, vcpu, &intids);
+    if ( irq_count < 0 )
+        return irq_count;
+
+    for ( i =3D 0; i < irq_count; i++ )
+    {
+        struct vgic_irq *irq =3D vgic_get_irq(d, NULL, intids[i]);
+        if ( !irq )
+            continue;
+        update_lpi_config(d, irq, vcpu, false);
+        vgic_put_irq(d, irq);
+    }
+
+    xfree(intids);
+    return 0;
+}
+
+/*
+ * The INVALL command requests flushing of all IRQ data in this collection=
.
+ * Find the VCPU mapped to that collection, then iterate over the VM's lis=
t
+ * of mapped LPIs and update the configuration for each IRQ which targets
+ * the specified vcpu. The configuration will be read from the in-memory
+ * configuration table.
+ * Must be called with the its_lock mutex held.
+ */
+static int vgic_its_cmd_handle_invall(struct domain *d, struct vgic_its *i=
ts,
+                                      u64 *its_cmd)
+{
+    u32 coll_id =3D its_cmd_get_collection(its_cmd);
+    struct its_collection *collection;
+    struct vcpu *vcpu;
+
+    collection =3D find_collection(its, coll_id);
+    if ( !its_is_collection_mapped(collection) )
+        return E_ITS_INVALL_UNMAPPED_COLLECTION;
+
+    vcpu =3D d->vcpu[collection->target_addr];
+    vgic_its_invall(vcpu);
+
+    return 0;
+}
+
+/*
+ * This function is called with the its_cmd lock held, but the ITS data
+ * structure lock dropped.
+ */
+static int vgic_its_handle_command(struct domain *d, struct vgic_its *its,
+                                   u64 *its_cmd)
+{
+    int ret =3D -ENODEV;
+
+    spin_lock(&its->its_lock);
+    switch ( its_cmd_get_command(its_cmd) )
+    {
+    case GITS_CMD_MAPD:
+        ret =3D vgic_its_cmd_handle_mapd(d, its, its_cmd);
+        break;
+    case GITS_CMD_MAPC:
+        ret =3D vgic_its_cmd_handle_mapc(d, its, its_cmd);
+        break;
+    case GITS_CMD_MAPI:
+        ret =3D vgic_its_cmd_handle_mapi(d, its, its_cmd);
+        break;
+    case GITS_CMD_MAPTI:
+        ret =3D vgic_its_cmd_handle_mapi(d, its, its_cmd);
+        break;
+    case GITS_CMD_MOVI:
+        ret =3D vgic_its_cmd_handle_movi(d, its, its_cmd);
+        break;
+    case GITS_CMD_DISCARD:
+        ret =3D vgic_its_cmd_handle_discard(d, its, its_cmd);
+        break;
+    case GITS_CMD_CLEAR:
+        ret =3D vgic_its_cmd_handle_clear(d, its, its_cmd);
+        break;
+    case GITS_CMD_MOVALL:
+        ret =3D vgic_its_cmd_handle_movall(d, its, its_cmd);
+        break;
+    case GITS_CMD_INT:
+        ret =3D vgic_its_cmd_handle_int(d, its, its_cmd);
+        break;
+    case GITS_CMD_INV:
+        ret =3D vgic_its_cmd_handle_inv(d, its, its_cmd);
+        break;
+    case GITS_CMD_INVALL:
+        ret =3D vgic_its_cmd_handle_invall(d, its, its_cmd);
+        break;
+    case GITS_CMD_SYNC:
+        /* we ignore this command: we are in sync all of the time */
+        ret =3D 0;
+        break;
+    default:
+        printk("Unknown GITS command\n");
+        ret =3D -EINVAL;
+        break;
+    }
+    spin_unlock(&its->its_lock);
+
+    return ret;
+}
+
+#define ITS_CMD_BUFFER_SIZE(baser) ((((baser)&0xff) + 1) << 12)
+#define ITS_CMD_SIZE               32
+#define ITS_CMD_OFFSET(reg)        ((reg)&GENMASK(19, 5))
+
+/* Must be called with the cmd_lock held. */
+static void vgic_its_process_commands(struct domain *d, struct vgic_its *i=
ts)
+{
+    paddr_t cbaser;
+    u64 cmd_buf[4];
+
+    /* Commands are only processed when the ITS is enabled. */
+    if ( !its->enabled )
+        return;
+
+    cbaser =3D GITS_CBASER_ADDRESS(its->cbaser);
+
+    while ( its->cwriter !=3D its->creadr )
+    {
+        int ret =3D access_guest_memory_by_gpa(d, cbaser + its->creadr, cm=
d_buf,
+                                             ITS_CMD_SIZE, false);
+        /*
+         * If kvm_read_guest() fails, this could be due to the guest
+         * programming a bogus value in CBASER or something else going
+         * wrong from which we cannot easily recover.
+         * According to section 6.3.2 in the GICv3 spec we can just
+         * ignore that command then.
+         */
+        if ( !ret )
+            vgic_its_handle_command(d, its, cmd_buf);
+
+        its->creadr +=3D ITS_CMD_SIZE;
+        if ( its->creadr =3D=3D ITS_CMD_BUFFER_SIZE(its->cbaser) )
+            its->creadr =3D 0;
+    }
+}
+
+static unsigned long vgic_mmio_read_its_ctlr(struct domain *d,
+                                             struct vgic_its *its, paddr_t=
 addr,
+                                             unsigned int len)
+{
+    u32 reg =3D 0;
+
+    spin_lock(&its->cmd_lock);
+    if ( its->creadr =3D=3D its->cwriter )
+        reg |=3D GITS_CTLR_QUIESCENT;
+    if ( its->enabled )
+        reg |=3D GITS_CTLR_ENABLE;
+    spin_unlock(&its->cmd_lock);
+
+    return reg;
+}
+
+static void vgic_mmio_write_its_ctlr(struct domain *d, struct vgic_its *it=
s,
+                                     paddr_t addr, unsigned int len,
+                                     unsigned long val)
+{
+    spin_lock(&its->cmd_lock);
+
+    /*
+     * It is UNPREDICTABLE to enable the ITS if any of the CBASER or
+     * device/collection BASER are invalid
+     */
+    if ( !its->enabled && (val & GITS_CTLR_ENABLE) &&
+         (!(its->baser_device_table & GITS_VALID_BIT) ||
+          !(its->baser_coll_table & GITS_VALID_BIT) ||
+          !(its->cbaser & GITS_VALID_BIT)) )
+        goto out;
+
+    its->enabled =3D !!(val & GITS_CTLR_ENABLE);
+    if ( !its->enabled )
+        vgic_its_invalidate_cache(d);
+
+    /*
+     * Try to process any pending commands. This function bails out early
+     * if the ITS is disabled or no commands have been queued.
+     */
+    vgic_its_process_commands(d, its);
+
+out:
+    spin_unlock(&its->cmd_lock);
+}
+
+static unsigned long vgic_mmio_read_its_iidr(struct domain *d,
+                                             struct vgic_its *its, paddr_t=
 addr,
+                                             unsigned int len)
+{
+    u32 val;
+
+    val =3D (its->abi_rev << GITS_IIDR_REV_SHIFT) & GITS_IIDR_REV_MASK;
+    val |=3D (PRODUCT_ID_KVM << GITS_IIDR_PRODUCTID_SHIFT) | IMPLEMENTER_A=
RM;
+    return val;
+}
+
+/*
+ * Sync the pending table pending bit of LPIs targeting @vcpu
+ * with our own data structures. This relies on the LPI being
+ * mapped before.
+ */
+static int its_sync_lpi_pending_table(struct vcpu *vcpu)
+{
+    paddr_t pendbase =3D GICR_PENDBASER_ADDRESS(vcpu->arch.vgic.pendbaser)=
;
+    struct vgic_irq *irq;
+    int last_byte_offset =3D -1;
+    int ret              =3D 0;
+    u32 *intids;
+    int nr_irqs, i;
+    unsigned long flags;
+    u8 pendmask;
+
+    nr_irqs =3D vgic_copy_lpi_list(vcpu->domain, vcpu, &intids);
+    if ( nr_irqs < 0 )
+        return nr_irqs;
+
+    for ( i =3D 0; i < nr_irqs; i++ )
+    {
+        int byte_offset, bit_nr;
+
+        byte_offset =3D intids[i] / BITS_PER_BYTE;
+        bit_nr      =3D intids[i] % BITS_PER_BYTE;
+
+        /*
+         * For contiguously allocated LPIs chances are we just read
+         * this very same byte in the last iteration. Reuse that.
+         */
+        if ( byte_offset !=3D last_byte_offset )
+        {
+            ret =3D access_guest_memory_by_gpa(vcpu->domain,
+                                             pendbase + byte_offset, &pend=
mask,
+                                             1, false);
+            if ( ret )
+            {
+                xfree(intids);
+                return ret;
+            }
+            last_byte_offset =3D byte_offset;
+        }
+
+        irq =3D vgic_get_irq(vcpu->domain, NULL, intids[i]);
+        spin_lock_irqsave(&irq->irq_lock, flags);
+        irq->pending_latch =3D pendmask & (1U << bit_nr);
+        vgic_queue_irq_unlock(vcpu->domain, irq, flags);
+        vgic_put_irq(vcpu->domain, irq);
+    }
+
+    xfree(intids);
+
+    return ret;
+}
+
+static unsigned long vgic_mmio_read_its_typer(struct domain *d,
+                                              struct vgic_its *its,
+                                              paddr_t addr, unsigned int l=
en)
+{
+    const struct vgic_its_abi *abi =3D vgic_its_get_abi(its);
+    u64 reg                        =3D GITS_TYPER_PHYSICAL;
+
+    /*
+     * We use linear CPU numbers for redistributor addressing,
+     * so GITS_TYPER.PTA is 0.
+     * Also we force all PROPBASER registers to be the same, so
+     * CommonLPIAff is 0 as well.
+     * To avoid memory waste in the guest, we keep the number of IDBits an=
d
+     * DevBits low - as least for the time being.
+     */
+    reg |=3D GIC_ENCODE_SZ(VITS_TYPER_DEVBITS, 5) << GITS_TYPER_DEVIDS_SHI=
FT;
+    reg |=3D GIC_ENCODE_SZ(VITS_TYPER_IDBITS, 5) << GITS_TYPER_IDBITS_SHIF=
T;
+    reg |=3D GIC_ENCODE_SZ(abi->ite_esz, 4) << GITS_TYPER_ITT_SIZE_SHIFT;
+
+    return extract_bytes(reg, addr & 7, len);
+}
+
+static u64 vgic_sanitise_its_baser(u64 reg)
+{
+    reg =3D vgic_sanitise_field(reg, GITS_BASER_SHAREABILITY_MASK,
+                              GITS_BASER_SHAREABILITY_SHIFT,
+                              vgic_sanitise_shareability);
+    reg =3D vgic_sanitise_field(reg, GITS_BASER_INNER_CACHEABILITY_MASK,
+                              GITS_BASER_INNER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_inner_cacheability);
+    reg =3D vgic_sanitise_field(reg, GITS_BASER_OUTER_CACHEABILITY_MASK,
+                              GITS_BASER_OUTER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_outer_cacheability);
+
+    /* We support only one (ITS) page size: 64K */
+    reg =3D (reg & ~GITS_BASER_PAGE_SIZE_MASK) | GITS_BASER_PAGE_SIZE_64K;
+
+    return reg;
+}
+
+static u64 vgic_sanitise_its_cbaser(u64 reg)
+{
+    reg =3D vgic_sanitise_field(reg, GITS_CBASER_SHAREABILITY_MASK,
+                              GITS_CBASER_SHAREABILITY_SHIFT,
+                              vgic_sanitise_shareability);
+    reg =3D vgic_sanitise_field(reg, GITS_CBASER_INNER_CACHEABILITY_MASK,
+                              GITS_CBASER_INNER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_inner_cacheability);
+    reg =3D vgic_sanitise_field(reg, GITS_CBASER_OUTER_CACHEABILITY_MASK,
+                              GITS_CBASER_OUTER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_outer_cacheability);
+
+    /* Sanitise the physical address to be 64k aligned. */
+    reg &=3D ~GENMASK_ULL(15, 12);
+
+    return reg;
+}
+
+static unsigned long vgic_mmio_read_its_cbaser(struct domain *d,
+                                               struct vgic_its *its,
+                                               paddr_t addr, unsigned int =
len)
+{
+    return extract_bytes(its->cbaser, addr & 7, len);
+}
+
+static void vgic_mmio_write_its_cbaser(struct domain *d, struct vgic_its *=
its,
+                                       paddr_t addr, unsigned int len,
+                                       unsigned long val)
+{
+    /* When GITS_CTLR.Enable is 1, this register is RO. */
+    if ( its->enabled )
+        return;
+
+    spin_lock(&its->cmd_lock);
+    its->cbaser =3D update_64bit_reg(its->cbaser, addr & 7, len, val);
+    its->cbaser =3D vgic_sanitise_its_cbaser(its->cbaser);
+    its->creadr =3D 0;
+    /*
+     * CWRITER is architecturally UNKNOWN on reset, but we need to reset
+     * it to CREADR to make sure we start with an empty command buffer.
+     */
+    its->cwriter =3D its->creadr;
+    spin_unlock(&its->cmd_lock);
+}
+
+static unsigned long vgic_mmio_read_its_cwriter(struct domain *d,
+                                                struct vgic_its *its,
+                                                paddr_t addr, unsigned int=
 len)
+{
+    return extract_bytes(its->cwriter, addr & 0x7, len);
+}
+
+/*
+ * By writing to CWRITER the guest announces new commands to be processed.
+ * To avoid any races in the first place, we take the its_cmd lock, which
+ * protects our ring buffer variables, so that there is only one user
+ * per ITS handling commands at a given time.
+ */
+static void vgic_mmio_write_its_cwriter(struct domain *d, struct vgic_its =
*its,
+                                        paddr_t addr, unsigned int len,
+                                        unsigned long val)
+{
+    u64 reg;
+
+    if ( !its )
+        return;
+
+    spin_lock(&its->cmd_lock);
+
+    reg =3D update_64bit_reg(its->cwriter, addr & 7, len, val);
+    reg =3D ITS_CMD_OFFSET(reg);
+    if ( reg >=3D ITS_CMD_BUFFER_SIZE(its->cbaser) )
+    {
+        spin_unlock(&its->cmd_lock);
+        return;
+    }
+    its->cwriter =3D reg;
+
+    vgic_its_process_commands(d, its);
+
+    spin_unlock(&its->cmd_lock);
+}
+
+static unsigned long vgic_mmio_read_its_creadr(struct domain *d,
+                                               struct vgic_its *its,
+                                               paddr_t addr, unsigned int =
len)
+{
+    return extract_bytes(its->creadr, addr & 0x7, len);
+}
+
+#define BASER_INDEX(addr) (((addr) / sizeof(u64)) & 0x7)
+
+static unsigned long vgic_mmio_read_its_baser(struct domain *d,
+                                              struct vgic_its *its,
+                                              paddr_t addr, unsigned int l=
en)
+{
+    uint64_t reg;
+
+    switch ( BASER_INDEX(addr) )
+    {
+    case 0:
+        reg =3D its->baser_device_table;
+        break;
+    case 1:
+        reg =3D its->baser_coll_table;
+        break;
+    default:
+        reg =3D 0;
+        break;
+    }
+
+    return extract_bytes(reg, addr & 7, len);
+}
+
+#define GITS_BASER_RO_MASK (GENMASK_ULL(52, 48) | GENMASK_ULL(58, 56))
+
+static void vgic_mmio_write_its_baser(struct domain *d, struct vgic_its *i=
ts,
+                                      paddr_t addr, unsigned int len,
+                                      unsigned long val)
+{
+    const struct vgic_its_abi *abi =3D vgic_its_get_abi(its);
+    u64 entry_size, table_type;
+    u64 reg, *regptr, clearbits =3D 0;
+
+    /* When GITS_CTLR.Enable is 1, we ignore write accesses. */
+    if ( its->enabled )
+        return;
+
+    switch ( BASER_INDEX(addr) )
+    {
+    case 0:
+        regptr     =3D &its->baser_device_table;
+        entry_size =3D abi->dte_esz;
+        table_type =3D GITS_BASER_TYPE_DEVICE;
+        break;
+    case 1:
+        regptr     =3D &its->baser_coll_table;
+        entry_size =3D abi->cte_esz;
+        table_type =3D GITS_BASER_TYPE_COLLECTION;
+        clearbits  =3D GITS_BASER_INDIRECT;
+        break;
+    default:
+        return;
+    }
+
+    reg =3D update_64bit_reg(*regptr, addr & 7, len, val);
+    reg &=3D ~GITS_BASER_RO_MASK;
+    reg &=3D ~clearbits;
+
+    reg |=3D (entry_size - 1) << GITS_BASER_ENTRY_SIZE_SHIFT;
+    reg |=3D table_type << GITS_BASER_TYPE_SHIFT;
+    reg     =3D vgic_sanitise_its_baser(reg);
+
+    *regptr =3D reg;
+
+    if ( !(reg & GITS_BASER_VALID) )
+    {
+        /* Take the its_lock to prevent a race with a save/restore */
+        spin_lock(&its->its_lock);
+        switch ( table_type )
+        {
+        case GITS_BASER_TYPE_DEVICE:
+            vgic_its_free_device_list(d, its);
+            break;
+        case GITS_BASER_TYPE_COLLECTION:
+            vgic_its_free_collection_list(d, its);
+            break;
+        }
+        spin_unlock(&its->its_lock);
+    }
+}
+
+static unsigned long vgic_mmio_read_its_idregs(struct domain *d,
+                                               struct vgic_its *its,
+                                               paddr_t addr, unsigned int =
len)
+{
+    switch ( addr & 0xffff )
+    {
+    case GITS_PIDR0:
+        return 0x92; /* part number, bits[7:0] */
+    case GITS_PIDR1:
+        return 0xb4; /* part number, bits[11:8] */
+    case GITS_PIDR2:
+        return GIC_PIDR2_ARCH_GICv3 | 0x0b;
+    case GITS_PIDR4:
+        return 0x40; /* This is a 64K software visible page */
+    /* The following are the ID registers for (any) GIC. */
+    case GITS_CIDR0:
+        return 0x0d;
+    case GITS_CIDR1:
+        return 0xf0;
+    case GITS_CIDR2:
+        return 0x05;
+    case GITS_CIDR3:
+        return 0xb1;
+    }
+
+    return 0;
+}
+
+static void its_mmio_write_wi(struct domain *d, struct vgic_its *its,
+                              paddr_t addr, unsigned int len, unsigned lon=
g val)
+{
+    /* Ignore */
+}
+
+#define REGISTER_ITS_DESC(off, rd, wr, length, acc)                       =
     \
+    {                                                                     =
     \
+        .reg_offset =3D off, .len =3D length, .access_flags =3D acc, .its_=
read =3D rd, \
+        .its_write =3D wr,                                                =
       \
+    }
+
+static struct vgic_register_region its_registers[] =3D {
+    REGISTER_ITS_DESC(GITS_CTLR, vgic_mmio_read_its_ctlr,
+                      vgic_mmio_write_its_ctlr, 4, VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_IIDR, vgic_mmio_read_its_iidr, its_mmio_write_w=
i, 4,
+                      VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_TYPER, vgic_mmio_read_its_typer, its_mmio_write=
_wi,
+                      8, VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_CBASER, vgic_mmio_read_its_cbaser,
+                      vgic_mmio_write_its_cbaser, 8,
+                      VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_CWRITER, vgic_mmio_read_its_cwriter,
+                      vgic_mmio_write_its_cwriter, 8,
+                      VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_CREADR, vgic_mmio_read_its_creadr, its_mmio_wri=
te_wi,
+                      8, VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_BASER0, vgic_mmio_read_its_baser,
+                      vgic_mmio_write_its_baser, 0x40,
+                      VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+    REGISTER_ITS_DESC(GITS_IDREGS_BASE, vgic_mmio_read_its_idregs,
+                      its_mmio_write_wi, 0x30, VGIC_ACCESS_32bit),
+};
+
+/* This is called on setting the LPI enable bit in the redistributor. */
+void vgic_enable_lpis(struct vcpu *vcpu)
+{
+    if ( !(vcpu->arch.vgic.pendbaser & GICR_PENDBASER_PTZ) )
+        its_sync_lpi_pending_table(vcpu);
+}
+
+static int vgic_register_its_iodev(struct domain *d, struct vgic_its *its,
+                                   u64 addr)
+{
+    struct vgic_io_device *iodev =3D &its->iodev;
+    int ret                      =3D 0;
+
+    if ( !IS_VGIC_ADDR_UNDEF(its->vgic_its_base) )
+    {
+        ret =3D -EBUSY;
+        goto out;
+    }
+
+    its->vgic_its_base    =3D addr;
+    its->doorbell_address =3D addr + ITS_DOORBELL_OFFSET;
+    iodev->regions        =3D its_registers;
+    iodev->nr_regions     =3D ARRAY_SIZE(its_registers);
+
+    iodev->base_fn        =3D gaddr_to_gfn(its->vgic_its_base);
+    iodev->iodev_type     =3D IODEV_ITS;
+    iodev->its            =3D its;
+    register_mmio_handler(d, &vgic_io_ops, its->vgic_its_base, VGIC_V3_ITS=
_SIZE,
+                          iodev);
+out:
+    return ret;
+}
+
+/* Default is 16 cached LPIs per vcpu */
+#define LPI_DEFAULT_PCPU_CACHE_SIZE 16
+
+void vgic_lpi_translation_cache_init(struct domain *d)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+    unsigned int sz;
+    int i;
+
+    if ( !list_empty(&dist->lpi_translation_cache) )
+        return;
+
+    sz =3D d->max_vcpus * LPI_DEFAULT_PCPU_CACHE_SIZE;
+
+    for ( i =3D 0; i < sz; i++ )
+    {
+        struct vgic_translation_cache_entry *cte;
+
+        /* An allocation failure is not fatal */
+        cte =3D xzalloc(struct vgic_translation_cache_entry);
+        if ( WARN_ON(!cte) )
+            break;
+
+        INIT_LIST_HEAD(&cte->entry);
+        list_add(&cte->entry, &dist->lpi_translation_cache);
+    }
+}
+
+void vgic_lpi_translation_cache_destroy(struct domain *d)
+{
+    struct vgic_dist *dist =3D &d->arch.vgic;
+    struct vgic_translation_cache_entry *cte, *tmp;
+
+    vgic_its_invalidate_cache(d);
+
+    list_for_each_entry_safe(cte, tmp, &dist->lpi_translation_cache, entry=
)
+    {
+        list_del(&cte->entry);
+        xfree(cte);
+    }
+}
+
+#define INITIAL_BASER_VALUE                                               =
     \
+    (GIC_BASER_CACHEABILITY(GITS_BASER, INNER, RaWb) |                    =
     \
+     GIC_BASER_CACHEABILITY(GITS_BASER, OUTER, SameAsInner) |             =
     \
+     GIC_BASER_SHAREABILITY(GITS_BASER, InnerShareable) |                 =
     \
+     GITS_BASER_PAGE_SIZE_64K)
+
+#define INITIAL_PROPBASER_VALUE                                           =
     \
+    (GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, RaWb) |                =
     \
+     GIC_BASER_CACHEABILITY(GICR_PROPBASER, OUTER, SameAsInner) |         =
     \
+     GIC_BASER_SHAREABILITY(GICR_PROPBASER, InnerShareable))
+
+static int vgic_its_create(struct domain *d, u64 addr)
+{
+    struct vgic_its *its;
+    const struct vgic_its_abi *abi;
+
+    its =3D xzalloc(struct vgic_its);
+    if ( !its )
+        return -ENOMEM;
+
+    d->arch.vgic.its =3D its;
+
+    vgic_lpi_translation_cache_init(d);
+
+    spin_lock_init(&its->its_lock);
+    spin_lock_init(&its->cmd_lock);
+
+    its->vgic_its_base =3D VGIC_ADDR_UNDEF;
+
+    INIT_LIST_HEAD(&its->device_list);
+    INIT_LIST_HEAD(&its->collection_list);
+    spin_lock_init(&d->arch.vgic.its_devices_lock);
+    d->arch.vgic.its_devices        =3D RB_ROOT;
+
+    d->arch.vgic.msis_require_devid =3D true;
+    d->arch.vgic.has_its            =3D true;
+    its->enabled                    =3D false;
+    its->domain                     =3D d;
+
+    its->baser_device_table =3D INITIAL_BASER_VALUE | ((u64)GITS_BASER_TYP=
E_DEVICE
+                                                     << GITS_BASER_TYPE_SH=
IFT);
+    its->baser_coll_table =3D
+        INITIAL_BASER_VALUE |
+        ((u64)GITS_BASER_TYPE_COLLECTION << GITS_BASER_TYPE_SHIFT);
+    d->arch.vgic.propbaser =3D INITIAL_PROPBASER_VALUE;
+
+    vgic_register_its_iodev(d, its, addr);
+
+    vgic_its_set_abi(its, NR_ITS_ABIS - 1);
+    abi =3D vgic_its_get_abi(its);
+    its->baser_coll_table &=3D ~GITS_BASER_ENTRY_SIZE_MASK;
+    its->baser_device_table &=3D ~GITS_BASER_ENTRY_SIZE_MASK;
+
+    its->baser_coll_table |=3D
+        (GIC_ENCODE_SZ(abi->cte_esz, 5) << GITS_BASER_ENTRY_SIZE_SHIFT);
+
+    its->baser_device_table |=3D
+        (GIC_ENCODE_SZ(abi->dte_esz, 5) << GITS_BASER_ENTRY_SIZE_SHIFT);
+
+    its->doorbell_address =3D addr + ITS_DOORBELL_OFFSET;
+
+    return 0;
+}
+
+/*
+ * For a hardware domain, this will iterate over the host ITSes
+ * and map one virtual ITS per host ITS at the same address.
+ */
+int vgic_v3_its_init_domain(struct domain *d)
+{
+    int ret;
+
+    if ( is_hardware_domain(d) )
+    {
+        struct host_its *hw_its;
+
+        list_for_each_entry(hw_its, &host_its_list, entry)
+        {
+            /*
+             * For each host ITS create a virtual ITS using the same
+             * base and thus doorbell address.
+             * Use the same number of device ID and event ID bits as the h=
ost.
+             */
+            ret =3D vgic_its_create(d, hw_its->addr);
+            if ( ret )
+                return ret;
+            else
+                d->arch.vgic.has_its =3D true;
+        }
+    }
+
+    return 0;
+}
+
+void vgic_v3_its_free_domain(struct domain *d)
+{
+    struct vgic_its *its =3D d->arch.vgic.its;
+
+    spin_lock(&its->its_lock);
+
+    vgic_its_free_device_list(d, its);
+    vgic_its_free_collection_list(d, its);
+
+    spin_unlock(&its->its_lock);
+    xfree(its);
+    d->arch.vgic.its =3D NULL;
+}
diff --git a/xen/arch/arm/vgic/vgic-mmio-v3.c b/xen/arch/arm/vgic/vgic-mmio=
-v3.c
index 4ec6d910af..ed81761572 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v3.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v3.c
@@ -417,6 +417,40 @@ static unsigned long vgic_mmio_read_v3r_ctlr(struct vc=
pu *vcpu, paddr_t addr,
     return val;
 }
=20
+static void vgic_mmio_write_v3r_ctlr(struct vcpu *vcpu, paddr_t addr,
+                                     unsigned int len, unsigned long val)
+{
+    struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
+    uint32_t ctlr;
+
+    if ( !vgic_has_its(vcpu->domain) )
+        return;
+
+    if ( !(val & GICR_CTLR_ENABLE_LPIS) )
+    {
+        /*
+		 * Don't disable if RWP is set, as there already an
+		 * ongoing disable. Funky guest...
+		 */
+        ctlr =3D atomic_cmpxchg(&vgic_cpu->ctlr, GICR_CTLR_ENABLE_LPIS,
+                              GICR_CTLR_RWP);
+        if ( ctlr !=3D GICR_CTLR_ENABLE_LPIS )
+            return;
+
+        vgic_flush_pending_lpis(vcpu);
+        vgic_its_invalidate_cache(vcpu->domain);
+        atomic_set(&vgic_cpu->ctlr, 0);
+    }
+    else
+    {
+        ctlr =3D atomic_cmpxchg(&vgic_cpu->ctlr, 0, GICR_CTLR_ENABLE_LPIS)=
;
+        if ( ctlr !=3D 0 )
+            return;
+
+        vgic_enable_lpis(vcpu);
+    }
+}
+
 bool vgic_lpis_enabled(struct vcpu *vcpu)
 {
     struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
@@ -575,6 +609,59 @@ static unsigned long vgic_mmio_read_sync(struct vcpu *=
vcpu, paddr_t addr,
     return !!atomic_read(&vcpu->arch.vgic.syncr_busy);
 }
=20
+static void vgic_set_rdist_busy(struct vcpu *vcpu, bool busy)
+{
+    if ( busy )
+    {
+        atomic_inc(&vcpu->arch.vgic.syncr_busy);
+        smp_mb__after_atomic();
+    }
+    else
+    {
+        smp_mb__before_atomic();
+        atomic_dec(&vcpu->arch.vgic.syncr_busy);
+    }
+}
+
+static void vgic_mmio_write_invlpi(struct vcpu *vcpu, paddr_t addr,
+                                   unsigned int len, unsigned long val)
+{
+    struct vgic_irq *irq;
+
+    /*
+	 * If the guest wrote only to the upper 32bit part of the
+	 * register, drop the write on the floor, as it is only for
+	 * vPEs (which we don't support for obvious reasons).
+	 *
+	 * Also discard the access if LPIs are not enabled.
+	 */
+    if ( (addr & 4) || !vgic_lpis_enabled(vcpu) )
+        return;
+
+    vgic_set_rdist_busy(vcpu, true);
+
+    irq =3D vgic_get_irq(vcpu->domain, NULL, val & 0xffffffff);
+    if ( irq )
+    {
+        vgic_its_inv_lpi(vcpu->domain, irq);
+        vgic_put_irq(vcpu->domain, irq);
+    }
+
+    vgic_set_rdist_busy(vcpu, false);
+}
+
+static void vgic_mmio_write_invall(struct vcpu *vcpu, paddr_t addr,
+                                   unsigned int len, unsigned long val)
+{
+    /* See vgic_mmio_write_invlpi() for the early return rationale */
+    if ( (addr & 4) || !vgic_lpis_enabled(vcpu) )
+        return;
+
+    vgic_set_rdist_busy(vcpu, true);
+    vgic_its_invall(vcpu);
+    vgic_set_rdist_busy(vcpu, false);
+}
+
 static const struct vgic_register_region vgic_v3_dist_registers[] =3D {
     REGISTER_DESC_WITH_LENGTH(GICD_CTLR,
         vgic_mmio_read_v3_misc, vgic_mmio_write_v3_misc,
@@ -626,7 +713,7 @@ static const struct vgic_register_region vgic_v3_dist_r=
egisters[] =3D {
 static const struct vgic_register_region vgic_v3_rd_registers[] =3D {
     /* RD_base registers */
     REGISTER_DESC_WITH_LENGTH(GICR_CTLR,
-        vgic_mmio_read_v3r_ctlr, vgic_mmio_write_wi, 4,
+        vgic_mmio_read_v3r_ctlr, vgic_mmio_write_v3r_ctlr, 4,
         VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICR_STATUSR,
         vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
@@ -647,10 +734,10 @@ static const struct vgic_register_region vgic_v3_rd_r=
egisters[] =3D {
         vgic_mmio_read_pendbase, vgic_mmio_write_pendbase, 8,
         VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICR_INVLPIR,
-        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+        vgic_mmio_read_raz, vgic_mmio_write_invlpi, 8,
         VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICR_INVALLR,
-        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+        vgic_mmio_read_raz, vgic_mmio_write_invall, 8,
         VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICR_SYNCR,
         vgic_mmio_read_sync, vgic_mmio_write_wi, 4,
diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
index a96a7f8d96..e89b579bee 100644
--- a/xen/arch/arm/vgic/vgic-mmio.c
+++ b/xen/arch/arm/vgic/vgic-mmio.c
@@ -585,6 +585,9 @@ static int dispatch_mmio_read(struct vcpu *vcpu, mmio_i=
nfo_t *info,
     case IODEV_REDIST:
         data =3D region->read(iodev->redist_vcpu, addr, len);
         break;
+    case IODEV_ITS:
+        data =3D region->its_read(vcpu->domain, iodev->its, addr, len);;
+        break;
     }
=20
     memcpy(r, &data, len);
@@ -613,6 +616,9 @@ static int dispatch_mmio_write(struct vcpu *vcpu, mmio_=
info_t *info,
     case IODEV_REDIST:
         region->write(iodev->redist_vcpu, addr, len, data);
         break;
+    case IODEV_ITS:
+        region->its_write(vcpu->domain, iodev->its, addr, len, data);;
+        break;
     }
=20
     return 1;
diff --git a/xen/arch/arm/vgic/vgic-mmio.h b/xen/arch/arm/vgic/vgic-mmio.h
index c38ef51e6b..421f7751d8 100644
--- a/xen/arch/arm/vgic/vgic-mmio.h
+++ b/xen/arch/arm/vgic/vgic-mmio.h
@@ -21,10 +21,21 @@ struct vgic_register_region {
     unsigned int len;
     unsigned int bits_per_irq;
     unsigned int access_flags;
+
+    union {
     unsigned long (*read)(struct vcpu *vcpu, paddr_t addr,
                           unsigned int len);
+    unsigned long (*its_read)(struct domain *d, struct vgic_its *its,
+                    paddr_t addr, unsigned int len);
+    };
+
+    union {
     void (*write)(struct vcpu *vcpu, paddr_t addr,
                   unsigned int len, unsigned long val);
+    void (*its_write)(struct domain *d, struct vgic_its *its,
+                paddr_t addr, unsigned int len,
+                unsigned long val);
+    };
 };
=20
 extern struct mmio_handler_ops vgic_io_ops;
--=20
2.34.1

