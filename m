Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C367E7C5B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630301.983074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3z-0003Aa-2O; Fri, 10 Nov 2023 12:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630301.983074; Fri, 10 Nov 2023 12:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3y-00032y-Q7; Fri, 10 Nov 2023 12:56:42 +0000
Received: by outflank-mailman (input) for mailman id 630301;
 Fri, 10 Nov 2023 12:56:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3w-0001y0-5s
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:40 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 944a87f3-7fc8-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:56:36 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIuvf025691; Fri, 10 Nov 2023 12:56:29 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9j2g0qjw-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:29 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:23 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:23 +0000
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
X-Inumbo-ID: 944a87f3-7fc8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfWAkGtMlpf+k70kdod+hSlaG77s3WKtFAfmUY7+SRh4uDTOIO1e882VPahd9d0D0W2DbfmSMku96lTGZwPzRetAJEllZ4oQ2vvGfbg0ruK+t7FlT1VodsSRq0KOx3z67qBCruAUxkwXRjU/Os92LctSdPKPHdwejRZ90u43APJR6sOSbgIkbCI1a4n4QpjsdGn6icFbQIeg5kILqVeEJv/4KclBhALRZR34PEkZ367Kasr5UzX9J5qrLElTEmF3WuULhkSGi9CxHSXMsYWaA3sjeGtN5DjvwvcA1HnnhCr40pY0mh2/mnsXuBXXqNVobbec++1b9QvKgKrkoFPmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oT4KIF2X4Eydop9+7zHu37RhHlwUjuweDeTiWeDTB5Q=;
 b=XKn2tApLn8Pw50DL9kVBH601DNYUDlO4QkE7JkH5WGanzs9hSatY7EFLg8rffozzyqLSsJ/kMfK4macRCxstNbSTVMBtEbTZ6hQWwyazctNnLSmtdhJb7vI6RCF9UXCsV4E23Pd7vZLCClnDZLCaeNwKkOcckn2YdXYDbbmv0UdUIHDfw2d0a57wkCPNpxZFxPPBz/Uf5aqMfLXvUl5snl0udLxaycbOrgLZOxEkvJwbSFdu9Qmh5s/YmAG5taA2ELzboq5c7TqyG8iajoVZ25RPXuz6pfrATHtTCNo/T2jM6SU4bwKldXLrqfUuM4yDflKcZ2JDpqlH3mSgeGEipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT4KIF2X4Eydop9+7zHu37RhHlwUjuweDeTiWeDTB5Q=;
 b=N3qRtU6qHivrs0BnR/MvM8uvwGpg2/+Nly7HCrbk3lXVXG3cQPKvCJxL0MNnmgquLTF774oldQ0OidcvaRbRdZt6GaMJ9fXCGYlyJ3srkLW2639++AhMLqoYbBaH5gd0xwC9C3eDVXOTk8ulLLdAh9uO7cVJAo+v4pASPNSjoV9N1dl8atnBAonThagygT2c32yy6YIguriENcCP2AFhuA/i0zWJtzhH7/Ph8bwQOaTkGFtzkgp3m4tbFN/uypbcpxmycFyRmADyKJUmsC1WHioXyMPmsTqBBsOyYHAoxxY+zCRAdTscqqPIVHinG7sVIbiYgsSAu6jy50qIgKMHIg==
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
Subject: [XEN PATCH v2 17/25] arm: new VGIC: its: Read initial LPI pending
 table
Thread-Topic: [XEN PATCH v2 17/25] arm: new VGIC: its: Read initial LPI
 pending table
Thread-Index: AQHaE9VNBToaXOI75keIgsngiRNg/A==
Date: Fri, 10 Nov 2023 12:56:21 +0000
Message-ID: 
 <bba7f1c7d135bead3003a862968aa0ba74e50dd8.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: b5dd9e00-7382-41a1-026d-08dbe1ec718e
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qspdzKlhaEej6mngsR6+JoOXQMIkJzGW9c5jdi/JoOwAg+BnGitAu4BcQYEkjIn/eQmjfzPPhCqToVUfu54XmXGj9J9pWb7+zmlrL/Iyn0jXJcufuspfKS8EZt035hXwYz8IrgZFhlUyi9HOQnsy/T9U6+1NqKxtmMx9o/sIsVB3VgjnvEheUz21yB6cPN28CXEJQAUVHXXRV8i1gf/ah6l2YS168P94E4rb4FYmWlAXKbrfn0FF54m4y/DhyLuU1KfFM6X/HeFQ1duP+3w8qegPTY+c2vmCsE37T7gWzb0IpiyMZIcxliO6ibI+UmR7FFfVd8InfMojZmUJXLrAroLSyRrRTde0d7qtRZZaaqou0OjukOKRKbfQTBScF50VkxdPdCBAzXoF+hrYXlB8nfjm/5CwuJAvxv8mSlhn6mDuKoi2v2wzUVm2pa+j8+Vqj+RqGEIf0xMxx5Iz4bowva5XhYmtEW6LRAOKDsJmgsfvI03KVEas0PpBR6JNAXIPQ1feP4uHccx7EMwZkY8iT8HkBylbMybOqUZxUIlgQuy2GdopyvhKVM+2UndAt3GWT/w8+7y0WakGbUpWN7BRdf11cBHOkQzgKSf7cK8hpFzrVY7e1HAqfo3FtBjJkzcF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?hA8wfJymWmvmZ/BduK0KRT6mq0ag2ivKb9PAZNcbrnR6Zo4TI7Yw734hVg?=
 =?iso-8859-1?Q?TBBrE4IwUcsCS5y6zuhvqORpOttzZhgSewqmFiUFizy4IgN+UiMQUXSyRT?=
 =?iso-8859-1?Q?ctVAxvosQ/v1SNdUaAjxX5IumGb+k0IEx2TNJtqqdd3bz4yaVOqVadAznn?=
 =?iso-8859-1?Q?VvJ3s+PdGMZhqdJikQiD9CPYIuld0DCVi981dMbXpfcBaxeP/oHNOV4u74?=
 =?iso-8859-1?Q?Nni0U4GJmfOvKwfGBdLL8n/alqesZBgWvl9u4I7SXBlyW10CksHNNXqRBS?=
 =?iso-8859-1?Q?yswv52Mg0nPnW3p0fEVcuZcECy8T7sNhqKHqbvzRfTU2oLLSenjTb86EIG?=
 =?iso-8859-1?Q?Aa7QYS74JZ00tkJ1bXRCP7y/fXb5rqJsdyGzUUHEApbraBcvsXfG7nfo4C?=
 =?iso-8859-1?Q?D2f7eYas2hMx+uqTV9XcxRzBF04bl9nTsKIv9j4kJiBHapG3mHGhLPeJmE?=
 =?iso-8859-1?Q?6TV/z9HMZZ+2aXyyU5v/B/ugHzlfn+yP00/9BhmkQu6rxKbBGF0aCCmBNV?=
 =?iso-8859-1?Q?GoIZEBTFdOm8pKiC4iGA50LcsU66fz7sEMXln9Ao4gJJs380ElLFTPihyw?=
 =?iso-8859-1?Q?I/jqIQPdk8/cVQFTrjGhAZJVTVTh3pURu+oGSNZjdga7z6i7w+Hlj4HcT9?=
 =?iso-8859-1?Q?H0+YH5V3J1Yr8LTpmLvQroSruWAG9HYqwFBsDiqLLXOiYeBZ+b7kMjgnaE?=
 =?iso-8859-1?Q?b9YkYe4gT01u9v6oATo0cUyU7Fvt5Sfj9Sh5XTiGH2FF08GWlDdY7qmzHK?=
 =?iso-8859-1?Q?mOIvKJfkwaOGMaSjwDit+EeHySbeBH8sR6GgGtUhYgw/0g8TFvlwRsyfiM?=
 =?iso-8859-1?Q?pLenr69BVMiplmu4UMlme/dO+//T9aQPkto0w7XJcl2BMTHWYln/eI7hp+?=
 =?iso-8859-1?Q?NqveHtsFc8V0cjy9JSeVyC8iPz6ibGQGeTTzYuhyFvd4dNo7WM8uF4JgAQ?=
 =?iso-8859-1?Q?5fY50u/MIemeOYc3izjYioHs947pj1n4IdMqeQk8BfVD6M5s3V/vJvPHqk?=
 =?iso-8859-1?Q?GMD82cbcpzAki4FUzg9i9lxyj70fm4U/9wvP7TehKwGfTp5udcEB/R9+X4?=
 =?iso-8859-1?Q?xr8xVY/DG8hyc7iERmYiw9d2koNMoRGhREDXBQcPN/ytBfC7h8wxA8qpEA?=
 =?iso-8859-1?Q?Q9pg3QQ+hpHHi1mAxt3DbNgnVpj7vQMAzWEtOneSAUQ5eR5avdQjDhYu4E?=
 =?iso-8859-1?Q?jHExisls9oDlXe+A/mQNLMDEHQaHJOOB9WintU96q/uOdHEfcr68ZAQkNt?=
 =?iso-8859-1?Q?ruxyTAzlPnhp8HVmKn/uZy+eGApFnklsqfvaqSLQz2g8d7LeVC+TCP+WiI?=
 =?iso-8859-1?Q?S+8hYh3ZRckYddbIkjEykD8YznvO0GBl7/VOnoYJB87RLd2nX4x72MjQQS?=
 =?iso-8859-1?Q?IjAcTr71gFdrqxHaAHG27QedoDyA16vFD3MYW38h7GjE9LOe54PTSZUaGk?=
 =?iso-8859-1?Q?83q0HcoaSz5tQ3/BJFyMATw/Eg5sXz9oVmR558+zCnh//lLDzPyihbBUgh?=
 =?iso-8859-1?Q?9+CFB91UYvpBioywbk5lzkPDy/NrebjgXBnNpK05hIJWpa3nWcoIVr6Fm+?=
 =?iso-8859-1?Q?J5+qmJoZkJxivTOpBt1eraFFlqEShaIogwm3XHZ1pNUAQtlv1PDjUdz6uF?=
 =?iso-8859-1?Q?swIkd4ttxv7oVn0qy+DrCFk70rhEMcQNeJ8eSscx1zHggTOLs/qk1F3g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5dd9e00-7382-41a1-026d-08dbe1ec718e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:21.8288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WicZnL+MZxieh5FpgwEWqH7UKJ5CwOi8ItFWFrDpdilXyY9ZlV50lPpdxpppJNbi8nOshByIdztVqSMANYxCPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-ORIG-GUID: z-LfJRbTodkl_F9kadJyB6Ea_fHGOMC8
X-Proofpoint-GUID: z-LfJRbTodkl_F9kadJyB6Ea_fHGOMC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

The LPI pending status for a GICv3 redistributor is held in a table
in (guest) memory. To achieve reasonable performance, we cache the
pending bit in our struct vgic_irq. The initial pending state must be
read from guest memory upon enabling LPIs for this redistributor.
As we can't access the guest memory while we hold the lpi_list spinlock,
we create a snapshot of the LPI list and iterate over that.

Based on Linux commit 33d3bc9556a7d by Andre Przywara

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/new_vgic.h |   5 ++
 xen/arch/arm/vgic/vgic-its.c        | 104 ++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm=
/new_vgic.h
index 3048f39844..d0fd15e154 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -264,12 +264,17 @@ static inline paddr_t vgic_dist_base(const struct vgi=
c_dist *vgic)
 }
=20
 #ifdef CONFIG_HAS_ITS
+void vgic_enable_lpis(struct vcpu *vcpu);
 struct vgic_its_device *vgic_its_alloc_device(int nr_events);
 void vgic_its_free_device(struct vgic_its_device *its_dev);
 int vgic_its_add_device(struct domain *d, struct vgic_its_device *its_dev)=
;
 void vgic_its_delete_device(struct domain *d, struct vgic_its_device *its_=
dev);
 struct vgic_its_device* vgic_its_get_device(struct domain *d, paddr_t vdoo=
rbell,
                                          uint32_t vdevid);
+#else
+static inline void vgic_enable_lpis(struct vcpu *vcpu)
+{
+}
 #endif
=20
 #endif /* __ASM_ARM_NEW_VGIC_H */
diff --git a/xen/arch/arm/vgic/vgic-its.c b/xen/arch/arm/vgic/vgic-its.c
index 5e94f0144d..af19cf4414 100644
--- a/xen/arch/arm/vgic/vgic-its.c
+++ b/xen/arch/arm/vgic/vgic-its.c
@@ -63,6 +63,47 @@ static struct vgic_its_device *find_its_device(struct vg=
ic_its *its, u32 device_
 #define VGIC_ITS_TYPER_DEVBITS          16
 #define VGIC_ITS_TYPER_ITE_SIZE         8
=20
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
 /* Requires the its_lock to be held. */
 static void its_free_ite(struct domain *d, struct its_ite *ite)
 {
@@ -284,6 +325,62 @@ static unsigned long vgic_mmio_read_its_iidr(struct do=
main *d,
     return val;
 }
=20
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
 static unsigned long vgic_mmio_read_its_typer(struct domain *d,
                                               struct vgic_its *its,
                                               paddr_t addr, unsigned int l=
en)
@@ -564,6 +661,13 @@ static struct vgic_register_region its_registers[] =3D=
 {
                         VGIC_ACCESS_32bit),
 };
=20
+/* This is called on setting the LPI enable bit in the redistributor. */
+void vgic_enable_lpis(struct vcpu *vcpu)
+{
+    if ( !(vcpu->arch.vgic.pendbaser & GICR_PENDBASER_PTZ) )
+        its_sync_lpi_pending_table(vcpu);
+}
+
 static int vgic_register_its_iodev(struct domain *d, struct vgic_its *its,
                                    u64 addr)
 {
--=20
2.34.1

