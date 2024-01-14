Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EAD82D035
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jan 2024 11:03:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667096.1038113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOxJm-0006Il-OV; Sun, 14 Jan 2024 10:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667096.1038113; Sun, 14 Jan 2024 10:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOxJm-0006DS-KE; Sun, 14 Jan 2024 10:02:14 +0000
Received: by outflank-mailman (input) for mailman id 667096;
 Sun, 14 Jan 2024 10:02:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KR5a=IY=epam.com=prvs=774324cbd8=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1rOxJk-0006AA-M9
 for xen-devel@lists.xenproject.org; Sun, 14 Jan 2024 10:02:12 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faad8ca0-b2c3-11ee-9b0f-b553b5be7939;
 Sun, 14 Jan 2024 11:02:09 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40E29Aas013393; Sun, 14 Jan 2024 10:01:56 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3vkmj1hsv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 14 Jan 2024 10:01:55 +0000 (GMT)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by AM9PR03MB7725.eurprd03.prod.outlook.com
 (2603:10a6:20b:41e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Sun, 14 Jan
 2024 10:01:53 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::9640:139b:8daa:fc9e]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::9640:139b:8daa:fc9e%3]) with mapi id 15.20.7181.022; Sun, 14 Jan 2024
 10:01:52 +0000
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
X-Inumbo-ID: faad8ca0-b2c3-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=az7Pllc578GTJzSzL8AZ/0iYuGnobWL2iagFKGcP3xT9JiMIFeodAWViF9R2k66FsAFPBY2jbKdfNSySCLX3kZQRKmCX1eWY0BSW68NPQq6iQeY6Tfm6piGkuzabCRTTZfWiaBxDiue0YuX1s0byCjwKkccfSwksaFCFRnTZhy4KtPpOq+yRR8Khg7bTm8+VeT1HlLUlfJMqOQ3fD8EmsCLIpv1mnU4omaTLMfpqzvhk1pxRmdfsR5eZjiPa7nDzb8JxsBem1jSaZdJnge1inf0LYHTPeKZsXsywmFZTCw8g18Zj9nqEmWkpCLe850TQc1yWuZDhNWBSqsJbfXDaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baf0t9FWoP6jlnYrKU9AwSGWPTgwixnTUwKMBjpqAJQ=;
 b=HIpxxNZu9gArgo3iXeT9IWzwOFwZA/qLsGxUkNHvzrmHmWIg0KLKq+GeW7d/mG2xC2ofaeJsgercVopvgLl7z7IM92I7GqF8TuzoyLK/1ofBLqHqEBVDWcvP6se9HDXZ/cZsckMXs2OTB1iKCatA8mC9WLzePCnDO5oy9xQrvMjE1YKZC6f12yzT+/CG9/CcMCnpnCqMLQHsE+o0Y9bSZb2r8gHBZFJR0whCPb7iE3wmLW1WzD5e/MjSOtD4bL2waaOOAoxIHDIc3ZB9Mq2ljbc8uiObrJmDR9ZpsZNLT1cC0O5CpambEH5Ev79XfZ0Mde1VOMNDiIh/5y4ItFKXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baf0t9FWoP6jlnYrKU9AwSGWPTgwixnTUwKMBjpqAJQ=;
 b=dm1aaQ0jWjFsUR3PRzp/9xfLm39j7V8yUAjNjzakCR0nQDlQx5gKvsRKP8/rLgN0KdxZzS1BpCGoWFKA8NhRTR/BzpjqI+4ndpbF7pI8Q3VudoKukvRmIZKqpAlvHvuRWblsl2crSRvZFTx+yu0P/w+Hnmqt+/CK0C76skEg0Xv6i8Qkd4qG6GmqIKiZ66edjjzOfVYxe0uDDJjzxnMhBsIyB22rQZ0zv8gOWMXAh8TCpckDqcZ/5/13DFAh9ZIZE9dPMMG6rGEBD0dpA3rUJxEvvjP1CqIv3AmB+vSxn8dNKp1DaG1mbNNpckAo8xhzMo+lOZK1S2mJrXplaHUDew==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] arm: vgic: Add the ability to trigger MSIs from the
 Hypervisor
Thread-Topic: [PATCH 1/2] arm: vgic: Add the ability to trigger MSIs from the
 Hypervisor
Thread-Index: AQHaRtCyuPXvgfJKsESPEkC3vc4pGw==
Date: Sun, 14 Jan 2024 10:01:52 +0000
Message-ID: 
 <e109a4092d80a825256d26a8e56dbb5a2ae6d04e.1705066642.git.mykyta_poturai@epam.com>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1705066642.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|AM9PR03MB7725:EE_
x-ms-office365-filtering-correlation-id: 1fd52959-07ed-4437-f492-08dc14e7d4d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0eTX8mrXON6rqetiij/MU0Tt/ziBqJBqk34KFyMqVXbiGw04NlZGxPddDy6esNbvmv2qrFFzjhB25lMKaHJPyFy1yydC3P6kIecMcDmNvtCQfJPvk9ZQaqHM2rFfitRdP5Ezntr5zmYFLbPOCAbKDyVyXujLK9Z+Bobrij08XbYSLUIBmbVL/I3Ws1oOd++UU6yGXMbmsSEp0sJcCIi/dqwH8jcKpEf+SGDLFDJHE4hjV+HhEH0BdbuYnSdxwmRgbGP85+NnSQ2p8XN4/1QPV5knKosiJBW5TN4IeicuGnbBhkcbh+HLXV5WfmsukPEAG5rx8yx30HEYVxmZx8zQN/t0S2B9W1L+20wpzMV3r3zW8Eml4KzAMan7W2WgZgG5bjR7lP7nA1YRQtg+vHY0+WvCq3dFH9xNc/xxHaU67be2onFsIBSZZGNrwjfP46St/BmS188jDIQ88z9xQP27LsBLUsDKSs8GvuekQVpu+/BtAFDh8R4lRe91VAGdH8/McLfnA4oKs5zMW7g6fUJbjwOOQ3DbqxzZX7P+JLuER0K1aSO+lzaOfq4BrfEvUTsYSZU0k4ZndcTb9qT3uTM55mKa75RH/8p0QJKFQw3xE+T4KgQGVtDKeFqVdUuvmAtJ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(39860400002)(396003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6512007)(316002)(8936002)(8676002)(91956017)(71200400001)(66476007)(64756008)(66446008)(54906003)(6916009)(6506007)(66556008)(478600001)(66946007)(6486002)(76116006)(2616005)(107886003)(83380400001)(26005)(5660300002)(4326008)(41300700001)(2906002)(38070700009)(36756003)(122000001)(38100700002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ZVJ5LMZrRC2xBpJifxCotKkBUNgbqmP5md1clL3Onw5ocIb0ba9lznlBcs?=
 =?iso-8859-1?Q?11N9/eMkSvMRfyeIBv0cO5PX8okgyGlcEUd2iCMpJpceD4ETxeGglTlOWg?=
 =?iso-8859-1?Q?Sn+83uug0KqmY4x0XfrvYV26pj/XcvkG2eRiRkQMHFx0afBKBlqgQ6S1CU?=
 =?iso-8859-1?Q?wEox8yED84GOvP3cDyUk8M3w36PhKWR2caXX4RB6ebD/h5rhr075Y0ey2t?=
 =?iso-8859-1?Q?wQT5yumKBWlyP5gDTguBVhAbDJNpr2eM+DGUrUy8hSLwM9emQ5xWHzDr4x?=
 =?iso-8859-1?Q?6NbW34Yni7Q7YOs1fKfDIO+hce9yC6OyeT3kfXsiL9xdTcOGORbhTSgIaA?=
 =?iso-8859-1?Q?w81GdJMKC1SY3g1fxksS7+E2duLK94qZ3xhx+IO60cDKw9sHowssVgg0qU?=
 =?iso-8859-1?Q?BuGX5RYq+DBrvuLhaVs8bDu+KCthWcHN+6JgYWbv/CDXFRHFscHDS1eAaF?=
 =?iso-8859-1?Q?foxAoaWrh9uhQgOQJo7iqXu+kD9cYtIcRV/yw9nISusVxvKuxdFU/Yto9e?=
 =?iso-8859-1?Q?a69gt/AqTegY5Y5Y/W2nnx/gs4LW8ta4vQSdRv7/oRjLFbO21FyprOxfTO?=
 =?iso-8859-1?Q?Z81wygzoqAG7fO6shdvsA/MdnqPfMGLA0xlmXBClA8BVQ8p0ylgYH4wNni?=
 =?iso-8859-1?Q?fFfXed25ZbNvb8sjr3QWFmHF8tr9NsH4Z0tclwKIibhZzaI+MG3KKPw4b1?=
 =?iso-8859-1?Q?IwhMStycZeoWmJLx4u0wrhye0IBF3Fh4Tg+yWIYKyZvqygDN2igAkCKcfB?=
 =?iso-8859-1?Q?JIce9hOw8y8uAGAdLdJEtgsqitlxt1vakNty9cuX02DfzPoXUhFUm2EmRU?=
 =?iso-8859-1?Q?YZ8HjZtBUB2+wmO6JOwyWsSPQa3c7jbr39PvI9EX7qLx5NzRABLHH4CClN?=
 =?iso-8859-1?Q?XfYk0ipSWfvdXM6dadKLsf2FlmzNxiOK8DNztARo9y1woOgTWrZ/Z4UvsD?=
 =?iso-8859-1?Q?H2zfiYv2IRnHZ6jtDbMjqTGrWfoQTuXcPT0dhqfzgX/4MB5k7XAKG9yjqn?=
 =?iso-8859-1?Q?qQOsqrbZsUDCItztzoQsOHo95/HCQBqgN+YnGOZCFNbbR/2lqsmc7zqF1i?=
 =?iso-8859-1?Q?yTayGByiX/Gvb9PAO3GO/EzlQjca/ANZLHnEpwg98MG5gDZA4NmDx02TUj?=
 =?iso-8859-1?Q?uPGHCU+fFuXSS6GHGc/x0X7GVDFcaax3xPXLcr6KKjYtVhz9XANStjNOLt?=
 =?iso-8859-1?Q?SB9ZojC+rnUDUUiGUCsrh8gJlOfleTt7zTlm0LJsIbj2jKCB8riDwL21Ev?=
 =?iso-8859-1?Q?x6dlKJ2C3y3Sbb/c3xJ7HV7WZdAA04EznsVVjwMxIhJQuGnSxiqk2nsHSN?=
 =?iso-8859-1?Q?JSFabT2aTBvCMTXDJ2lVq6qL4m2l6PNKW0V/P/otBS8dGCRJenN5nZZ5Tt?=
 =?iso-8859-1?Q?iOxHNMNIPaUFgX8aSAvdqpehXuHq2Ip5cS6HJflyvL6REb6MxZ2UfEqmWO?=
 =?iso-8859-1?Q?5+j3+VTzzUXu3N55waMrMsCqHPL0C70p1gvs72jZNREFZPUtopqEUdwWY/?=
 =?iso-8859-1?Q?Q5VRqY8ctg35GwHO8hAmCubNQx2lo49JsBJkAyrr5E8nk1JKdq4oRK+q1/?=
 =?iso-8859-1?Q?u3kE9LdXb5Cohh+Jzh/ZkzOBEkXZBossTPy2LyCSQyfo/8kTVXwpsCgONp?=
 =?iso-8859-1?Q?ohOIEaph+kD86wPj4DOvtcGrbYxcmr1Xv0KhS//3453UcCV/h3vPamHw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd52959-07ed-4437-f492-08dc14e7d4d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2024 10:01:52.0356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tp5mkFgci2DsqNasRSLr1t0NHI3IG//GRCWB0lMcQOogjKgbLEjp0zGAtKDNiH6Qpo3hbhc5KYRKFLpS2Zy53g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7725
X-Proofpoint-GUID: 4ySXo3ywPZaZD4uk7qmNZ_U2SSVffQo9
X-Proofpoint-ORIG-GUID: 4ySXo3ywPZaZD4uk7qmNZ_U2SSVffQo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=946 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401140078

Add the vgic_its_trigger_msi() function to the vgic interface. This
function allows to inject MSIs from the Hypervisor to the guest.
Which is useful for userspace PCI backend drivers.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/vgic.h | 11 +++++++++++
 xen/arch/arm/vgic-v3-its.c      | 35 +++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 922779ce14..4695743848 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -317,6 +317,17 @@ extern bool vgic_migrate_irq(struct vcpu *old, struct =
vcpu *new, unsigned int ir
 extern void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu=
 *v,
                                              unsigned int rank, uint32_t r=
);
=20
+#ifdef CONFIG_HAS_ITS
+int vgic_its_trigger_msi(struct domain *d, paddr_t doorbell_address,
+                                u32 devid, u32 eventid);
+#else
+static inline int vgic_its_trigger_msi(struct domain *d, paddr_t doorbell_=
address,
+                                u32 devid, u32 eventid)
+{
+    return -EOPNOTSUPP;
+}
+#endif /* CONFIG_HAS_ITS */
+
 #endif /* !CONFIG_NEW_VGIC */
=20
 /*** Common VGIC functions used by Xen arch code ****/
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 70b5aeb822..683a378f6e 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1484,6 +1484,41 @@ static int vgic_v3_its_init_virtual(struct domain *d=
, paddr_t guest_addr,
     return 0;
 }
=20
+int vgic_its_trigger_msi(struct domain *d, paddr_t doorbell_address,
+                                u32 devid, u32 eventid)
+{
+    struct vcpu *vcpu;
+    struct virt_its *pos, *temp;
+    struct virt_its *its =3D NULL;
+    uint32_t vlpi;
+    bool ret;
+
+    list_for_each_entry_safe( pos, temp, &d->arch.vgic.vits_list, vits_lis=
t )
+    {
+        if ( pos->doorbell_address =3D=3D doorbell_address )
+        {
+            its =3D pos;
+            break;
+        }
+    }
+
+    if ( !its )
+        return -EINVAL;
+
+    spin_lock(&its->its_lock);
+    ret =3D read_itte(its, devid, eventid, &vcpu, &vlpi);
+    spin_unlock(&its->its_lock);
+    if ( !ret )
+        return -1;
+
+    if ( vlpi =3D=3D INVALID_LPI )
+        return -1;
+
+    vgic_vcpu_inject_lpi(its->d, vlpi);
+
+    return 0;
+}
+
 unsigned int vgic_v3_its_count(const struct domain *d)
 {
     struct host_its *hw_its;
--=20
2.34.1

