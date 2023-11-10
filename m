Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168097E7C8B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 14:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630409.983283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1RWG-00005l-4A; Fri, 10 Nov 2023 13:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630409.983283; Fri, 10 Nov 2023 13:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1RWG-0008VE-0e; Fri, 10 Nov 2023 13:25:56 +0000
Received: by outflank-mailman (input) for mailman id 630409;
 Fri, 10 Nov 2023 13:25:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R43-0001y1-D3
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:47 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97490aac-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:41 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIeeg019156; Fri, 10 Nov 2023 12:56:27 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9kkyram6-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:27 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:21 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:21 +0000
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
X-Inumbo-ID: 97490aac-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1frpE2z4v6SX/MgVMj4nB6SmsMeVg6hrI6qpEPqseyifEwCaviV4mMw3/5FCD4tr780NbnHcAts7nM03HQGxfUXTY8ZRVt0p/lxK2pZ/+HYZNaa2LxZvV5m2+LnUayyx4C5MbzFOAThZSarGukIjGs0C6pjgBM6WmCdVWk1cMhYkjYC4706KV44yKhCUnolK6ZZr01dO0bUEV9xw/+An1doX7Jgm1qZbV8nCjFFHwyHreC4bEOzmxqO5hYoUwuviAth2Bu+aj4fSmyTdSfLgHVJsEfsRv4JTmpxLavIF/RHDOz3DzYc2Xiju9bNt5j3/pm1VHR2WABOhp3YBJo/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrJr290kqOYWcHNBNqtriz0Bdb13RzHLmBg6eDZlzlM=;
 b=dV+Mj8IOE42jVaEK+ZOYfFoKSTMmOy8jeDgakR9PBYQ386+CALJQbbPk5UlYpOoOKZ5y8FgEbA+p3UbPMr9VqHfG/3JS3DmRXKRPUxR53auW1gzpQqHo+SSU0INKGNvBHMJRBVz3ntScdE8js6Sn36IHrGIc2HM2+FQ6otU8PJvSf8N930BWllcqWS/GapkFrqDW6rYpNSQAPY5R9C9e+GhHDYqcvn4x/YJ4cnYCGXbsDgbqZk9d9sLKlm01H3RQ4SfHfX2wIYOVLWRdLRiMhqytOtTCRtA2aCuodptdWTT5TtxpaORfIDXiMrT3RXV8yrzEIFmUtf0kzK9WmQjOdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrJr290kqOYWcHNBNqtriz0Bdb13RzHLmBg6eDZlzlM=;
 b=nZHN8yzEfuiQ8wxfnsfCDLe3q5LJ7yVODOHD7/PDofSr2JxRpP5IaRRFxG6OilcdQKvHqNi2KL0rUjFGkhyfUTNYONQYs9LbUuau8+iDp55bK2oaLx4bzZZr/hmXiodv9D55hwvwsihEuuEr9QmwNzFn5QSAg0upDl25hGbPM9iZbEUMK57Opk60XEz2wmN6CjDBUUYW2HgTODXHjYL6GW5YK7fzVw7AZpRmp+zrnzk54byfZGwdM8rDQ1vKVFxWQq8LBTLoSXN5D5VVv7RQ8xQTBlxdsqv0isOp0VdKibpn18qQBIv49hCu8FGe46Pb1WqOKOIEZMidPZe5SEYO2w==
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
Subject: [XEN PATCH v2 10/25] arm: new VGIC: Add vgic_v3_enable
Thread-Topic: [XEN PATCH v2 10/25] arm: new VGIC: Add vgic_v3_enable
Thread-Index: AQHaE9VMc/Cvb+GfokOTI4WmaNuX9Q==
Date: Fri, 10 Nov 2023 12:56:19 +0000
Message-ID: 
 <60813d95cee1619888864a76cf398b8b41c854b4.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: 9e2187c0-c9b3-4ced-b127-08dbe1ec6ff8
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RTiK9ZqikpNPAAr+EZfZq/7ui6aq0q1Kfp8yt6KJa9yhCxXQK4E4temDRzDLEasefXxmk2rkWCCJe5HksrSc0b3N6SGHQ6xh3SbyE1omk6NE4OHD9UH1aa45B6jvdDJJEiM2NYgAmILvLW57MsqREua/2Bshio/K2jfxQZTlUl95y/ow2lRyCGczcBJ6kPpW6EwbCuoZOBuCvkMLk46qZmbzkBB7L4FlG4bDIwL473xb+4SbTqcmeOnQLTW1Tnyjtf1jGEtrouThAATdxBq5ktey9skAeGJnwmnvPesd+AkMi4nS9dNuxPGBwYvqk/E1OPAUT3txvcbmIKfuPmhVaqgaqWXMcs7UiheX0np05xxeIFpjFpRbUKf6FUKGlg8eeOvZj3zBBPj87iKLJCMTg2+p+XX0KHZxoqV8+/D4/qMQbCFV+q5S0sG4al7S3iCdffIr5aDOSTH2U2q+CeQrFe3RU/Vzjmg686bOxXq21IHJgSQwoAZS9oqAPg5Nb/iLjnmXgB1RPlqHKGcZdt0tYwitpqiLgDwFcy0QzsIbXG+3kod8tF+rLRkznyYrEHMSVazVhGF0rj2Jv78rXVuUpJFEx19CrhkDXNxpieGZ3E3ERHcf7Xn4Z7zPujiZoZAv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?57UktyYXTGFPt2O38mubjexz85OKEisTKqMCz5yaY/YnyJC9fl+wbsuvAp?=
 =?iso-8859-1?Q?5ExmxgEhoQQXJ5NRCLlYyGcWO+HftumZ86v+bYjM91avs1UQleqdGhMssB?=
 =?iso-8859-1?Q?EuaMta38SsJzyE1EEm+68+s3T1lf/OK93c/bxMl+//xYQiAbDGXt+cGJHW?=
 =?iso-8859-1?Q?eXj31MGfqSBtyV56zEB14RcJVCEGnhpdJ2TRyEoIrEPl3TrfGgrSmJIOeB?=
 =?iso-8859-1?Q?9LFYG7gMHztzDtgpwFl3D4wnzemLyXL7gDlK1eazkSTnRR9QnHnJw2K8wF?=
 =?iso-8859-1?Q?5J3veDV1f1pFneAbBH8/O3kzswzjZlEn36Bauuk7mxTPBHMbSkGecKEAT0?=
 =?iso-8859-1?Q?uOkgsysKWKbJxHewChOJPsl2VG29R5sK+/k4lJLxdrNkWPm6HCsBqlo5N2?=
 =?iso-8859-1?Q?hMACHsvmIH64MnsajGG5MzmrRnPgED+Ar8IoXzgC+1qKeNur/oU63bh+p3?=
 =?iso-8859-1?Q?dUtkj1mxpoRqS57WftvAvslMJfuCftx2RWZsJ8JtffT9lGb3GDn+UP4Cpa?=
 =?iso-8859-1?Q?tXi2WjI7w1d8pME9Ou2AXvhCeQdH9bKhgCmklbuFJi75sgxLKaVOmdUOJ1?=
 =?iso-8859-1?Q?EN9gKRVVPSdsw+1N0vOr4AgP/d9LCZ6mQflYD+40tPwZ/tRHHLNJf12lmI?=
 =?iso-8859-1?Q?35ijFsWc/auEXC9+y2trRI5u41PZEhole4z+J43QJ3cXKjZiVuRjlyCgYT?=
 =?iso-8859-1?Q?ZjfKPfGyj2l1FR7rrTR3y1rN134rhxp2F+DAGkKH3aOh9On/n0BEPCpjO6?=
 =?iso-8859-1?Q?rWmn6kqjnopnvMR8E0gwcFt0dYa5k2WR+ZoPn5hm1hhHulDUVKW/6TxX1v?=
 =?iso-8859-1?Q?K9lPcLHYurvMB673a4JaGTbYUjBfg9qqTPmeOUnyg/damSLojGBiJsfWRS?=
 =?iso-8859-1?Q?0DD46fDftB078RXQNSR/foPgOuKexHNt1XbAAvmSpLeSANg9hE8C/lxHln?=
 =?iso-8859-1?Q?SW71ztjvl4lqkl2+sffRG7n2v5N9j7TdkJkx/88sxMhp/lqEuGHtQ1+ALs?=
 =?iso-8859-1?Q?mQyCpp76HT1zDOysuE8p2ObsuhqgSGaiHpZpD+Ch2gcCGln+x0Tv7WiLs2?=
 =?iso-8859-1?Q?U4eleNYfWEPDBZteZMz/QYghLkYybdLNKm7ZHmCPa5+mS1h3zkz6nFpQcd?=
 =?iso-8859-1?Q?dZrdELnVEmUdz4BV48XbR6Q5MDSgK6PGDQ5S1iqTfBbt6yT+7ul1HrGnaK?=
 =?iso-8859-1?Q?rbB3sizupjWXQxqNdjSvJsZiT++JRQyHXqaAgzODDABCiN6WnebeN5pHHo?=
 =?iso-8859-1?Q?FaBDNg02Cr2r/vCJz1n8ioM/HuuWV3kWAe5Ugdz0i9d92F33/fx6leEujj?=
 =?iso-8859-1?Q?ZqVsdZxOzCHH1neV7Q9dW27yL0sFpi0rTAMC0YzdqdZmAXf4u/B/+sHvG+?=
 =?iso-8859-1?Q?RSHQRXC08WlTX8aav3Of14UhDJFgORCCvKVU9DUo8WUk2umri2R+ZY5nXl?=
 =?iso-8859-1?Q?Yh5nRiZo2hhQY8pI7snsSk+cbeorHqnMLM37Sn5Mt00t0JjAE5/EcccTXb?=
 =?iso-8859-1?Q?hAx4HfoT1WumQGQCY3iE3TL/WUXbfrt3HO0B4MTxsbo8b5oiYkbZkDJN2s?=
 =?iso-8859-1?Q?PrSLQ1nwLk+PEBvHfrUwMhggAIZpV2LbR967wgHi4i14xjKiFYNG3zg35f?=
 =?iso-8859-1?Q?VEsLJ3Cx5JLaXNwdetNGjaRkNOAXAyOZesNV5J0LHM0nNZW/iTfFVBIw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2187c0-c9b3-4ced-b127-08dbe1ec6ff8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:19.3505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v5LhBS10ioGB4f2yjY7iko1aL0RINlU61PVVjEZBjRVlpkdmpqEDJDI0OPEzhJKPIIn8wnz98m0VPlVPBxMURg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-GUID: toLST6ZKplUglxq6PFeRgOIJAWB0HxxG
X-Proofpoint-ORIG-GUID: toLST6ZKplUglxq6PFeRgOIJAWB0HxxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=657 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Enable the VGIC operation by properly initialising the registers
in the hypervisor GIC interface.

This is based on Linux commit f7b6985cc3d0f by Eric Auger

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/vgic/vgic-init.c | 5 +++++
 xen/arch/arm/vgic/vgic-v3.c   | 6 ++++++
 xen/arch/arm/vgic/vgic.h      | 4 ++++
 3 files changed, 15 insertions(+)

diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index ca13cf385c..96f6669d38 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -209,9 +209,14 @@ int vcpu_vgic_init(struct vcpu *v)
     vgic_vcpu_early_init(v);
=20
     if ( gic_hw_version() =3D=3D GIC_V2 )
+    {
         vgic_v2_enable(v);
+    }
     else
+    {
         vgic_register_redist_iodev(v);
+        vgic_v3_enable(v);
+    }
=20
     return ret;
 }
diff --git a/xen/arch/arm/vgic/vgic-v3.c b/xen/arch/arm/vgic/vgic-v3.c
index 470bb63147..682d57b476 100644
--- a/xen/arch/arm/vgic/vgic-v3.c
+++ b/xen/arch/arm/vgic/vgic-v3.c
@@ -244,6 +244,12 @@ unsigned int vgic_v3_max_rdist_count(const struct doma=
in *d)
                                      : GUEST_GICV3_RDIST_REGIONS;
 }
=20
+void vgic_v3_enable(struct vcpu *vcpu)
+{
+    /* Get the show on the road... */
+    gic_hw_ops->update_hcr_status(GICH_HCR_EN, true);
+}
+
 int vgic_v3_map_resources(struct domain *d)
 {
     int rdist_count, i, ret;
diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
index 7dbadf7501..791c91ebb3 100644
--- a/xen/arch/arm/vgic/vgic.h
+++ b/xen/arch/arm/vgic/vgic.h
@@ -74,6 +74,7 @@ int vgic_register_dist_iodev(struct domain *d, gfn_t dist=
_base_fn,
 #ifdef CONFIG_GICV3
 void vgic_v3_fold_lr_state(struct vcpu *vcpu);
 void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int lr);
+void vgic_v3_enable(struct vcpu *vcpu);
 int vgic_v3_map_resources(struct domain *d);
 bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr);
 unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev);
@@ -86,6 +87,9 @@ static inline void vgic_v3_fold_lr_state(struct vcpu *vcp=
u)
 static inline void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq =
*irq, int lr)
 {
 }
+static inline void vgic_v3_enable(struct vcpu *vcpu)
+{
+}
 static inline int vgic_v3_map_resources(struct domain *d)
 {
     return 0;
--=20
2.34.1

