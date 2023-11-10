Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6237E7C53
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630300.983060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3y-0002r0-0J; Fri, 10 Nov 2023 12:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630300.983060; Fri, 10 Nov 2023 12:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3x-0002dV-Ph; Fri, 10 Nov 2023 12:56:41 +0000
Received: by outflank-mailman (input) for mailman id 630300;
 Fri, 10 Nov 2023 12:56:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3v-0001y1-Bh
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:39 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94e7eadd-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:37 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACHn4m029609; Fri, 10 Nov 2023 12:56:28 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3u93ptjrxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:28 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM0PR03MB6244.eurprd03.prod.outlook.com
 (2603:10a6:20b:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21; Fri, 10 Nov
 2023 12:56:25 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:25 +0000
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
X-Inumbo-ID: 94e7eadd-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZf0sfFhQI0rxfqw20un2bDEXSbRMWQxGazC955Fw3UBB1ZquLANkbuR/CqmyVmAoraR8rp0OV8MIque7NfSvq8TS1Ouh4cb82FfQghGpHk1NMI1ip41be6vIEFrsa4GQaYbd4RD7cYBFbaQqy6sAGeQPT9YSQKPkDTCpWDRa+XdlqlvRZ7SAcPoOutSetCnxFhNXSFNdbPGUSoWa9yg9mNKHwjGMJSUqsBio80020G2RhDdopnaYmnAeG9PbFKYJCXEI5xX0crKUWAAGPxR6LW4rALkMQv71Bwph/XNKpxcZEUtNo/BIQQD8/IUgTY6dnebLTbW0YIFMlz+ZvZnGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHz5hJhr12VTz+6oRnd6k1m3l8acsXE23yxPfe4m7RA=;
 b=Ti+7Icr3U8VAeoWzk2TCyOybdtiOUXA84naG+7EyrU5k+LH7wV/OP0VFcUM+PXdesS0ejBm8j3Fm1IDRO3KvmC607Qi+EaK5MXt3dYitU9Xg/pLiqzJbf5vRCCAF6bmTtXmMv7HLDYc9gSlPEjztMKUYEzQcto+w3OkfibQrjI7dD+yJ2D5cCBMlRIpY5fR+QBhWGAsvUFCUFzF3Dk5zoASNQDd+RbMwictCBdyAUuX6lysjoF5tnScRE2YTGd9y82zDxMjgw8yyzMiwtyoLaX5b1pE5/DogktooJhuPD94ULgX2wUhKwUVTErX1ABTN5xhjBt2I64y8WtvXxaG8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHz5hJhr12VTz+6oRnd6k1m3l8acsXE23yxPfe4m7RA=;
 b=HM1q6nkFRocitEVITYNKMD2NrLGZXrnqKPb0UbTKpyiNeBz/nhRrmkd+UDqrzhgVMOMUlWVJ40HYxPSX/mJtVSbqpbfPo3fFUSBQmceldN+jnp7SJLySQIcpHVJn3DB+kuRjzoLUfRaRK9AnSmXimyVhV1i8RJ3AvS3SmOA+k2r+RKMfZu8fYsVRG4yuPxqZ6jDuIMubFtZ1qFRDevvdEL/uj7TOPV+SSR8dMVvmpEkcKNoO4jVGB5HyTKNMFeN7HKWJgtbrz/CRVF36N/ssJns/AZw/aOC/WttkV+iQzbOh/QGOBW5IUqvxkkFowopudi7qYN61rxSY7E8TgDSZag==
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
Subject: [XEN PATCH v2 22/25] arm: new VGIC: its: Implement MMIO-based LPI
 invalidation
Thread-Topic: [XEN PATCH v2 22/25] arm: new VGIC: its: Implement MMIO-based
 LPI invalidation
Thread-Index: AQHaE9VP1TCckR1kUUClKplCDKRdTQ==
Date: Fri, 10 Nov 2023 12:56:23 +0000
Message-ID: 
 <ceda4af006b8b4a484a816499c94a2ac5a1ca681.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM0PR03MB6244:EE_
x-ms-office365-filtering-correlation-id: b2f8ab35-3194-4ec2-d0dc-08dbe1ec72bc
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RR+FsD6z06X+jwVRQCPg2vgIGlPCFU7MBWx4fFhLRc2Ion86Y4jRwoPM0rj0xgDQGm1e5vAyJUkxQx/BFlIZMBolNpc6eurw6qL2XM8cLRQDjDXjibPw6ChpLEw34WHnyA6s0QsEX+N2SZqhP1x00z+HR/3Du8GP2RO6KkiVatHqhd8V0rnljADPoE7b+Q+htEa9TwyilhdCDpIp20fMggiVA7ZCnfWhLnTiwKEn6DYH6TePU9BWZEJdrdLXn2TA9D7etr10ZwALdi3Tw4P9oai7Z4SqmhkD156i8fwv7l1t6ReeGi4bmxMX/0HBILkHOZ7ivWl6Kjea4tWK3Aw+YzBSK3GuZR99sEP2o2tflUQm8VvvLRyNQs2eiMzXRd5WmJs2L/WrexNo7rrVSua49ZIIr0Pv/GF7/kUX79X78JND6dNrjZBQy39fWobR8tT1KrQvSKJowrMFTZiEZNRCL5SMCvDuDDbGyakH3FwvwzGFzv3Wv+1obCaKjpB9uyvyalrHHO9ClmBfaVSPiXY86ha8EsBVPYDgdqiLWOhcAgvwT0iH/qD2pVc5ExKgDAVTAqGzh45zy+mr6ObYc3U4+7c7IU+oluRoHB+DfQ1wg0PUa3/NT6n/whTThZ7zPbPagXn9f0GvxNsDnhU/NW3p9Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(5660300002)(41300700001)(2906002)(83380400001)(26005)(8676002)(4326008)(8936002)(122000001)(54906003)(64756008)(316002)(6916009)(2616005)(38100700002)(76116006)(66556008)(66476007)(91956017)(66446008)(66946007)(38070700009)(6512007)(6506007)(478600001)(6486002)(36756003)(71200400001)(86362001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ARv1zv7R0OqIHAYDgUkcvb6SetZEgi7JUz8ayLzBmT6j99p+e3M9HT2AX4?=
 =?iso-8859-1?Q?TozoLdFjEVblJ7nwpy34l41BXAE8QnAKyH/k+1Ooldns4+kRZ/NWu2+xsj?=
 =?iso-8859-1?Q?jy/pRg9xI7hjhz5e9HKyqslyiJ6m1Dc4lrjIE5NnxUA4oo07i5Mlu3wI3j?=
 =?iso-8859-1?Q?mhhgF5hrNSIsi/0bDXczJFEBUcuHQ9JH+Y9Wlo/IE1kjZlObI7JJz0qb4n?=
 =?iso-8859-1?Q?sLxqniDxxTKz4axkHkPQ76uqfLltrK+5qwhnlz4yC2pPumN3VIe7lCwYhI?=
 =?iso-8859-1?Q?mi2YYck7KA4PXl7R69KldpHJ/Ms3elDwMNxTlA8WWLf+g66PqZyo120KO3?=
 =?iso-8859-1?Q?3223bC+l9xJwieXMvbjycNSz5Fq/+/UXp0yP0OVZBB8cRv/QnlX1Wbr7O6?=
 =?iso-8859-1?Q?OCzp95fFWr5oxVKq/4bNS8urCFFKqx6fbAggB99F+yn/Enh630ICdU0JDN?=
 =?iso-8859-1?Q?7CESMa23F5XIE73MyzoVI+wFVbzu//rQ9FbYafWLHeCufbpBP6puc2UUJ8?=
 =?iso-8859-1?Q?YdmS73iPCvnVKzFO7P0mltvfustgdglH1vMCn3Gv39F0Pmg8EzjvaMKy89?=
 =?iso-8859-1?Q?NU9dTnqoZoO6z26avlMOq1LbYIt6JAneOSjOmlHXNCLoLbvz0dKqGqk/C6?=
 =?iso-8859-1?Q?f3fScVmwsC6xgVzrxs7qIf9qpG2mpYoe5ApxhZ/Wd/IuC00YLhaGDUnh+I?=
 =?iso-8859-1?Q?jKcV5eecbAX2n6sxEbz2DRi13qQLiRCSc73ut70SCZhnFpGjVjnLG/lOkW?=
 =?iso-8859-1?Q?gyWOn2VVLMzsE3/2fZB53YnmGfwXrP+2ZMlSMM9U4m91YnNPuuBvs4cazy?=
 =?iso-8859-1?Q?uT/OPtmQzRVQFFOlwjL26oEV8YziSSuuQ9DP3IaEqn/L0pbwznpMgX5kTO?=
 =?iso-8859-1?Q?nhnf82Hyg/dGVOw+SbbZ+9lPR7vqoby++C1yFCdPu57/1Ct08/fHMh13QO?=
 =?iso-8859-1?Q?kPUgo6MKFCSRdF0Ghdj+SRxNMAf1lBHQPJdCVO/3w1zBJxZPVXn/xTCaNM?=
 =?iso-8859-1?Q?gtej1g6V1mT0rh7cnX3mWbwxCM3RQAH3gIFb8TgRQqoswn9h6ujmc81Law?=
 =?iso-8859-1?Q?0tQERuFsqvXcKcUgL0LnJ0b7KFiByvqzyxtk45Kc1eAf+xdwbI4FMB59WY?=
 =?iso-8859-1?Q?68YXeaFtgrBRb+uVy5frH6o0djVZ/83GWndhj1NrzIZ0o8+HaVyu1PfQ5i?=
 =?iso-8859-1?Q?fwyluAbmkuBCAsfR3HesLwve+obMtw9SnjzSZKofPuevocgKJxFNNQAzaE?=
 =?iso-8859-1?Q?RmSUl6pvxCD2RT+JBbRHd0/BBHdU/NXCavZCB8FBVlqgoScvnELQEo4y6H?=
 =?iso-8859-1?Q?snFGpIcKLgxvS9awEbnekKUPB8Zg0nK5hHqX8OrQvs2Ufj7f1jzGNYllxt?=
 =?iso-8859-1?Q?2BGyQASApDAtzSZ+XM50gikqGTxKPDQ461KY8FXpBRLfcjM/FkgTnmePZp?=
 =?iso-8859-1?Q?N+y61bzCB/s0BGeaiLyg9NyNiJ86Bl+Mgw3ZMOmdMazLKw+vjsx0uPsI6d?=
 =?iso-8859-1?Q?kNp4dfMDXTEsBAYb+9bHZa4I7D4ZmmYEGs4mlbViA9ODZSmx2kcE7D9HZY?=
 =?iso-8859-1?Q?mh1RWOkrAnZsukuXULQoaUKgrQN62/Jv51lz0hvXsoL8PIYYXj96g9U0n7?=
 =?iso-8859-1?Q?8mrHmMYAIH4BHXXe8l5Ucia3VZiN0mCLvyHV0HjXE2m6rDx+732OClaw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f8ab35-3194-4ec2-d0dc-08dbe1ec72bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:23.6475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4sYCuxpwjJRtJEFaAx5jXbbe1b0k35wl2yVUZXSYFvmJnKWZtXdHgu/K21V8NMsnPLfWXdTE60JsBNkNzYIlLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6244
X-Proofpoint-ORIG-GUID: f_btpiF4EMSn5sL61PFKUfdEHyErFq57
X-Proofpoint-GUID: f_btpiF4EMSn5sL61PFKUfdEHyErFq57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 mlxlogscore=983
 mlxscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Since GICv4.1, it has become legal for an implementation to advertise
GICR_{INVLPIR,INVALLR,SYNCR} while having an ITS, allowing for a more
efficient invalidation scheme (no guest command queue contention when
multiple CPUs are generating invalidations).

Provide the invalidation registers as a primitive to their ITS
counterpart. Note that we don't advertise them to the guest yet.

Based on Linux commit 4645d11f4a553 by Marc Zyngier

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/new_vgic.h |  1 +
 xen/arch/arm/vgic/vgic-mmio-v3.c    | 65 +++++++++++++++++++++++++++--
 xen/arch/arm/vgic/vgic-mmio.h       | 15 +++++++
 3 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm=
/new_vgic.h
index b038fb7861..dfc434ab41 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -239,6 +239,7 @@ struct vgic_cpu {
     struct vgic_io_device   rd_iodev;
     struct vgic_redist_region *rdreg;
     uint32_t rdreg_index;
+    atomic_t syncr_busy;
     struct vgic_io_device   sgi_iodev;
=20
     /* Contains the attributes and gpa of the LPI pending tables. */
diff --git a/xen/arch/arm/vgic/vgic-mmio-v3.c b/xen/arch/arm/vgic/vgic-mmio=
-v3.c
index 4bf8c21203..0e3835d38a 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v3.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v3.c
@@ -583,6 +583,65 @@ static void vgic_mmio_write_pendbase(struct vcpu *vcpu=
, paddr_t addr,
               old_pendbaser );
 }
=20
+static unsigned long vgic_mmio_read_sync(struct vcpu *vcpu, paddr_t addr,
+                                         unsigned int len)
+{
+    return !!atomic_read(&vcpu->arch.vgic.syncr_busy);
+}
+
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
@@ -655,13 +714,13 @@ static const struct vgic_register_region vgic_v3_rd_r=
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
-        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
+        vgic_mmio_read_sync, vgic_mmio_write_wi, 4,
         VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICR_IDREGS,
         vgic_mmio_read_v3_idregs, vgic_mmio_write_wi, 48,
diff --git a/xen/arch/arm/vgic/vgic-mmio.h b/xen/arch/arm/vgic/vgic-mmio.h
index edf8665cda..12f4d690f6 100644
--- a/xen/arch/arm/vgic/vgic-mmio.h
+++ b/xen/arch/arm/vgic/vgic-mmio.h
@@ -153,4 +153,19 @@ unsigned long extract_bytes(uint64_t data, unsigned in=
t offset,
 uint64_t update_64bit_reg(u64 reg, unsigned int offset, unsigned int len,
 		     unsigned long val);
=20
+#ifdef CONFIG_HAS_ITS
+int vgic_its_inv_lpi(struct domain *d, struct vgic_irq *irq);
+int vgic_its_invall(struct vcpu *vcpu);
+#else
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
 #endif
--=20
2.34.1

