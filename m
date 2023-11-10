Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B92C7E7C55
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630303.983092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R41-0003iV-FE; Fri, 10 Nov 2023 12:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630303.983092; Fri, 10 Nov 2023 12:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R40-0003Vj-Ps; Fri, 10 Nov 2023 12:56:44 +0000
Received: by outflank-mailman (input) for mailman id 630303;
 Fri, 10 Nov 2023 12:56:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3x-0001y1-Bp
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:41 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95e99666-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:38 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACHn4p029609; Fri, 10 Nov 2023 12:56:30 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3u93ptjrxk-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:30 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM0PR03MB6244.eurprd03.prod.outlook.com
 (2603:10a6:20b:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21; Fri, 10 Nov
 2023 12:56:26 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:26 +0000
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
X-Inumbo-ID: 95e99666-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c63QVfsZewcF1pWl26rSCmI8aikPmmNMdhmvOPBfUUhQeeXO5k/WuMsCcmYwTxXpCfO/AmLrnH1b5O8eNfbEfjCyjd5/+VzvpSUSTitAvfGwhVS9o+nu3IS7nEm3Kn5IsE8I7elEtd1bmLNUtP0as2boFaLyDVAOtZ+PiMjplVGbv8xpEl0QSjTgfROA91oxOhNpz8o7DQ50RxbxO5nHVwM4u4qILMBf+sjHrIvc7qQ3zpnELrCSyQMu0AhB845S7A/+TqcBGthZ5dPV6qtworo8wJNmmcF/AvL+udSqVI/jmH1KWPhTQmjvkZwSVjPJdlGvAXLwbeUdD11lSkBdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Essb1Ld/1j1kT+sD5meqRu42KXbfpKOnx9aVBNLbuT0=;
 b=JHqFEL3swVJGriUuAufGagmNbwJHARD27sO97vBV0IVNmOAeWTdP9esqyKaII2xRx77q7N8skwm3lkxt21Nw9GFCtdW9AM1OhmYdd64T0wIgBMYqalwuWv9riYEvwsVqaTUiRaDzp/+69D0nUL0D9ga7jM+22lW3ky+LeRu5mj+tUMGeCzvfeXaXVEUDg17ALTPjKVV1aixY+XcboFYZuhlL4BqrKvkcSEPnaEywWw7MYhJd1iuZ9oBFXGiMPof35DME3Tk9YqMscEmCni4ZKxXgiIsYOZjuvvOQZzzdKXCyrV+aAruIDmDo0v4Rp+15P7psDZjVj3KJTTb2vR30Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Essb1Ld/1j1kT+sD5meqRu42KXbfpKOnx9aVBNLbuT0=;
 b=sNV6GEB6/LdzZyLvNa7HxTbKQmHUSa7NymfYOtixAaiwinKEPgbc9ntoux9skJ01vSoVoq41FAH9WvL8Lfd1mILUNl0LqXHPe13vah+bZR3CBDJC9+QpqnKnHf0VmbqNgd802yWwPFUFj2pPh27ig0/i9UkuclFxFW6Ek3XWo1uoJlpOITnE2F73x1r3xQr8UUw16vgheYQaMDrKu9bxFWndLq7unthnnvKji5cqIavsWg1LMMIHnnapEojXutLxiATSuCx34EiKtX4P+CaYWkxY52A1nZ92WpJnGl+6LX+B7MSjKptAfbdnDZPl3CiUtkAlBBXV2+vaWTqfi1uXdA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v2 25/25] arm: new VGIC: Improve MMIO handling
Thread-Topic: [XEN PATCH v2 25/25] arm: new VGIC: Improve MMIO handling
Thread-Index: AQHaE9VPvUK8VLpzMkyL6GJ3SfoYcA==
Date: Fri, 10 Nov 2023 12:56:24 +0000
Message-ID: 
 <86465b3762ed8c9cdd24752792d0ca0e19698d22.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM0PR03MB6244:EE_
x-ms-office365-filtering-correlation-id: c10c18bb-b423-4a97-c8df-08dbe1ec7338
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WaG648WEIxuUbX/Oa/9TeYfNtcsrr6ZSiNUSLrkbUcFk9r8JJIJ17TlyUAePUANS9Hs9Laiql9L/aiXm7TQ0hma6oyL3TQTGfMlK992oahnMX9Aq9snWAI3ypZeg43a+fw4yaXV8XLmA6S4MDOU717HV3FGxLi0xPnoWEeqquOhzD9n/81T924XbUlu2pixQP70BMODdGArU84lDxVUBKFk42xWo0KwDTi7HjB7AEvrURbzUpq9A9C/0cbpltUAOYmp3f2IkyUapDHHi/QxXCz79WRxPzcLwuc+321QitKaLURQn3AAslNQHFBgsQN0GnHOCg1PgYeJnKB2oLbWNTdMi0Tu668go2pS/Jt0k1oWuA1To0bcaqGOKj97zmGdIxWYTiJCZYNScEUuI3UwAe0oTziT/WqjXXLb0s45OYZ2WLs/EfdbhRnryocgZx1keZgmz11o+hm6S0ZImTDdXv0zUvQ2vOWWtm/xOtlRIMsTpKvbDPoaz7iIZQA/87RoZ+qlSZ+KWkjZ4TYBJ9YFCgPqu3TEHscC6tdDz2A7ITfKmymk+0iuAhTpwok6dlZ8iztc03LWoX7RiQtc7xFatKzt0DKWlf12/R7StZi5qSz+v1OJg7SEN9Vqh6pKnPewF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(5660300002)(41300700001)(2906002)(83380400001)(26005)(8676002)(4326008)(8936002)(122000001)(54906003)(64756008)(316002)(6916009)(2616005)(38100700002)(76116006)(66556008)(66476007)(91956017)(66446008)(66946007)(38070700009)(6512007)(6506007)(478600001)(6486002)(36756003)(71200400001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?FhkxuoYfwRsvYQke8HuDW0cdZ5YbhRAOD5SCgJGGd6ZrZK6snCwg82RCiQ?=
 =?iso-8859-1?Q?Gc6kLNBf6vJJfu0/+5VO+GrSBk7b1JQMNkrhPJVwC46uHsD7WmzC/Wq2Ma?=
 =?iso-8859-1?Q?CaaHKZcqh3lzxG5hw1v6JcNlBm/EpRzsN4TqNc+ffLh4buKUlZaRk5hkJN?=
 =?iso-8859-1?Q?pxEER+Rs77ApHZ+rxuLi9ybFB5uDQf2EKw3wvT9urbjOiylknv2K4V5h1s?=
 =?iso-8859-1?Q?KMwfkGpFexwCyDM8p+81Ks0AEVhUWCiyhJyB/turtkEeunMRNVeMg4YRcJ?=
 =?iso-8859-1?Q?nvGuuSVyHLYzU5JTw4EIhC4gBRZ19s7eeztv0R7jOMm+r6SeEfWw3vZem1?=
 =?iso-8859-1?Q?dE97oN+6TwC0ZsJlK4ApABiD/QPNWTm2I2TK+tWk52n3jLIC2vFPbjQq4A?=
 =?iso-8859-1?Q?9JF2CZ5EsN1Sb/3SkWuG/4N7n11QKXGollu6P05TAAJZ0UWLBwu5z6mUNt?=
 =?iso-8859-1?Q?6LizCJxJF+dysCgKFE0lKFBaICEe9KhIMvoiDvJ1cWAuL8umPzvuI8VeaW?=
 =?iso-8859-1?Q?N40E7wrGxGFrb6acHnAXYFIINNM9QK7R3B1Fuo0vvjlZZxIrTzLmJ1sRo0?=
 =?iso-8859-1?Q?Wfh0Ck70dN/VZk8B7d1+jSofVhHA7CONQ5pnRGbeQ9uN05zQ6ZksbzbU0U?=
 =?iso-8859-1?Q?xrh8VyKQueQyM9CAq1GP4FAXYGFvqvmgP8ujFi5LfTXd5dYSAu4PJb1N61?=
 =?iso-8859-1?Q?aT9iDJ4ab5IhTdAzg91Ex6FmZjYz369P7mkm6YtX4i09ikwv1fIpGiGWTn?=
 =?iso-8859-1?Q?5UrgsnCT2yW1dB5zSCisxSpvF7gnJOCS0TPFc/CQMmH9ILr4hf9WMOHxOJ?=
 =?iso-8859-1?Q?7M/Hq5DWzUZtBUuCYL61yx1qSK/EcukpCZQLMQ6pIN/RzZ5XDgaNGzv/UT?=
 =?iso-8859-1?Q?05KWfGPCAqd0v4TNwQpJRYsFBLmAOE1tRCNNkzSZEH7US/JMaLtw7UUX2n?=
 =?iso-8859-1?Q?hy3UVJ7UpDYzd87XJsH/fSR7gMUpU1dGnUzOw5AhhOhLxyg8sjShtqZ1Zq?=
 =?iso-8859-1?Q?3oVJGByhWpkqrDfJyctfmL74iijHIl7aeibU49/+dYmUWGIfwiSMKhzA6v?=
 =?iso-8859-1?Q?0EWEIE51FpYx4B7XRgPZm+qOzyV5C/LMl4W27gQd2x+vBwZFYSwaHu1+Kd?=
 =?iso-8859-1?Q?+0MAcpje5frBLKgJv22fTSS65bsgd4x2rkFW+LwWfv75t2PHfqva0osBVg?=
 =?iso-8859-1?Q?B8BlSiu00LsDtK4eir2QWgWKRXLSAP2zhmkxyMjM7AyKTBIfGTLB+tzY34?=
 =?iso-8859-1?Q?w2liS0umC2mAgl9Gv75/DuCbxNLWS9ZoRLZ+gpmnvs8+TFom0Jy1yqoQMm?=
 =?iso-8859-1?Q?SWfS+f/1/2zHWkdUwxVRil7wDIULBLvX/b3VHLW8ix0ghNv66MD27iJRd2?=
 =?iso-8859-1?Q?CJNXPQvGhNpqN9X5XQLo+nW2tshLGWfFcFpbWgOG6oXS29APXSvZr02zH5?=
 =?iso-8859-1?Q?pmJSVsRXaPmJYKU8UYy4Mb3g1plZK2+agvYEhC1cUx9M5mPTiXPs89rPG7?=
 =?iso-8859-1?Q?E0k855C9Nt5XELUVCPHQw7b17jj/8wWs3vIYtbWT8+4KTIRvJ3MF0sTw/F?=
 =?iso-8859-1?Q?DujK0oS15dNjhggv2rvlsGe4kUYBcsyL9CsfzzS4vFD7UVIN/HFdtEGe9j?=
 =?iso-8859-1?Q?IgO9D8Td1H2PygvpCzhLOMFz9Yh42280F9f9qMX9m0nokY03U+Jtua5Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c10c18bb-b423-4a97-c8df-08dbe1ec7338
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:24.5661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQn2UEzqJBNOz6AO6CZuTX/LsBYFiR3c3rcv+m7enJhUM6gKSTzHb/KyS08/Cbyp66AABrl0McVvHx+mhHfIUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6244
X-Proofpoint-ORIG-GUID: Fpgoxg6hpt-rrGfZtlI9QyKkLHsnyNb0
X-Proofpoint-GUID: Fpgoxg6hpt-rrGfZtlI9QyKkLHsnyNb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 mlxlogscore=356
 mlxscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Currently the full register address is used in VGIC MMIO handlers. This
can cause issues when VGIC_ADDR_TO_IRQ_MASK overlaps with the base address.
For example the current GUEST_GICV3_GICD_BASE overlaps with addr to irq
mask for 64 bit registers, causing intids to be calculated incorrectly.

This patch fixes the issue by subtracting the base address from the full
register address before passing it to the MMIO handlers. Thus giving the
MMIO handler only the relevant offset.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/vgic/vgic-mmio.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
index 7a28be53bc..abf7854af0 100644
--- a/xen/arch/arm/vgic/vgic-mmio.c
+++ b/xen/arch/arm/vgic/vgic-mmio.c
@@ -540,7 +540,7 @@ vgic_get_mmio_region(struct vcpu *vcpu, struct vgic_io_=
device *iodev,
=20
     region =3D vgic_find_mmio_region(iodev->regions, iodev->nr_regions,
                                    addr - gfn_to_gaddr(iodev->base_fn));
-    if ( !region || !check_region(vcpu->domain, region, addr, len) )
+    if ( !region || !check_region(vcpu->domain, region, addr - gfn_to_gadd=
r(iodev->base_fn), len) )
         return NULL;
=20
     return region;
@@ -565,13 +565,13 @@ static int dispatch_mmio_read(struct vcpu *vcpu, mmio=
_info_t *info,
     switch (iodev->iodev_type)
     {
     case IODEV_DIST:
-        data =3D region->read(vcpu, addr, len);
+        data =3D region->read(vcpu, addr - gfn_to_gaddr(iodev->base_fn), l=
en);
         break;
     case IODEV_REDIST:
-        data =3D region->read(iodev->redist_vcpu, addr, len);
+        data =3D region->read(iodev->redist_vcpu, addr - gfn_to_gaddr(iode=
v->base_fn), len);
         break;
     case IODEV_ITS:
-        data =3D region->its_read(vcpu->domain, iodev->its, addr, len);;
+        data =3D region->its_read(vcpu->domain, iodev->its, addr - gfn_to_=
gaddr(iodev->base_fn), len);;
         break;
     }
=20
@@ -596,13 +596,13 @@ static int dispatch_mmio_write(struct vcpu *vcpu, mmi=
o_info_t *info,
     switch (iodev->iodev_type)
     {
     case IODEV_DIST:
-        region->write(vcpu, addr, len, data);
+        region->write(vcpu, addr - gfn_to_gaddr(iodev->base_fn), len, data=
);
         break;
     case IODEV_REDIST:
-        region->write(iodev->redist_vcpu, addr, len, data);
+        region->write(iodev->redist_vcpu, addr - gfn_to_gaddr(iodev->base_=
fn), len, data);
         break;
     case IODEV_ITS:
-        region->its_write(vcpu->domain, iodev->its, addr, len, data);
+        region->its_write(vcpu->domain, iodev->its, addr - gfn_to_gaddr(io=
dev->base_fn), len, data);
         break;
     }
=20
--=20
2.34.1

