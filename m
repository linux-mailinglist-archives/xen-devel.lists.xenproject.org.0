Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FD072DF94
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548009.855809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KZ-0004bD-Dy; Tue, 13 Jun 2023 10:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548009.855809; Tue, 13 Jun 2023 10:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KZ-0004Yr-7z; Tue, 13 Jun 2023 10:32:55 +0000
Received: by outflank-mailman (input) for mailman id 548009;
 Tue, 13 Jun 2023 10:32:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aRu4=CB=epam.com=prvs=05285d8c61=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1q91KY-0001im-2F
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:32:54 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a622b22f-09d5-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:32:52 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D6YVNl012776; Tue, 13 Jun 2023 10:32:41 GMT
Received: from eur02-db5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2104.outbound.protection.outlook.com [104.47.11.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3r63wtu7t4-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 10:32:40 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6520.eurprd03.prod.outlook.com (2603:10a6:10:19d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 10:32:34 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51%5]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:32:34 +0000
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
X-Inumbo-ID: a622b22f-09d5-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=av9kJfi1bM1k9m81oA2bS3uGQE/Lasn6EwvynlwSYb0Z+2MGUtU7EsF9UpM3UPgVR5UVmMwgJGkw50K1eRGEPmIhzSNe7DFwn624KI9ySuHMzQPkknXpn5AQXm9ggzx+GUS/wkH8QojZxigRrkfH4uEdhFYkNtkbC3/xlZi3Aj+CeS+ssFjTmTVuh9QaJrllQU+femRUlbR5jjshi7V2dFGLcWiiEAF+FsEkLuT7GLQVOMQ34sQpebRG2PBSSF9ir79+tyjfz/bzes705QFL18VgTYf61A7s7bWPAd5BqhdfStbajTgoIork2nkB/MOHIgKyYPgPaztVt1Mf2W7spg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQLDTRCPmYV+snDogimIGaafhmJyMu5DPAp093BY9KE=;
 b=VufJChg9Gi5GjFgUaMHXuMVQBYCIeenSX6w3FBjUv+GuoqZlgyVDFVPZfGKRPLwxjVbfFpq7u5c5o9llds2NRdfWZTqyiTby3lO0A64zl1mi5sG43pH+t4z99eUfLm8qSqRF8UxVe39tLsPRMh8cfamP3LamhNGo9YlUA84FgAO7+kmk0oBPv62q8lQkBomzchg4Nc2nmSDR1NiBPi6JUoXkdqHN3THKQ7zjySe9o77N+NJ6efuXaD1cZqSwlEd3reL3PjqUPUaJ7boVqSYI7+dtgbdQG/HSx/70DeA7TzaOgFElqekd0AiWkcAUi9J3kuZ5LTU6Gy+zJZW5UcPwBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQLDTRCPmYV+snDogimIGaafhmJyMu5DPAp093BY9KE=;
 b=dVtHAZHhRZiJh9pVeyz1LJpEd2FmZp1/xuIDYbdf2iHuVDIqhU8Umebo0eh7ElOd0qIxoXOLmDQ8/poRS9D/w8M/2TCJ0Ed1FvJRnz7Xh6gzybXeVw08TWsBXIl90nfA8n2O3O2yzoL103/yoVq9AsIrk6/wrwnvPmu3NdePay5ZxYCIJSYzHnVS60V5wc44HO2ZQ18WXzUzMgBYyUMqzFK2cL58IUeLZRId8x5bzMTB5l6VISGMkcGyhET79c+prW+/pvQYfjmIc/xtcg1lR6mTMlAl069sj4n1pfR1LTmBtlekX0qpr7waz/7n/gWlkJ6HWBg9GXDgumgU2L9KYw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v7 11/12] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v7 11/12] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Index: AQHZneJaM+qTqDNwO06sgUif4aO4dg==
Date: Tue, 13 Jun 2023 10:32:29 +0000
Message-ID: <20230613103159.524763-12-volodymyr_babchuk@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.40.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6520:EE_
x-ms-office365-filtering-correlation-id: c9db9436-2d7a-4414-6957-08db6bf98056
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wAfI2XfUEMUszH4AXSjXIfZcMVMcgjUpxfiOkRC2GHOXTM8BZcGV8r79Mflq6LBH5e0fXGUsgfnj+M252I+ufgSvZ2ZBhD+i0jeyGS6gSc43jbHahmxHR9ZGb/uHV03+ASBqp/t2DFGW68eXKq0bTlIhQg02/4YoFVZyP+L9A79Vei7GJKq0rkoEUJxrm+WL6cwwyPQLegh4tyVIe1CpGf9EdCWXD9OeSDbvcak1vyYtgUI3s3DV+IWs4p8c0vFI0NsgvOi++uh49fDGHIf34HQcHIIqVhhm9LfcgiSWHqXjHA0tVH5y2oNCW31OPZDoDCBetBtvT5lX2rTKnUS4QxN7Dsz8sCdMSGz1FaC1bhU4SqEIvMq94bw5MREVtXPrGXL43wTTz8S6DeIan+ZX36E53zkDZz6B8G0WpSyT9sG7aD3veNC9NG3M/PwgbxF9I6hTl7NY/iDySqsBPrqQvFKKJgVlcowVVkQTn/hg0orlhlHKyKINYg7U/+GgmgA/GFUeIABjwNO0yAsJ7r5h5NiN8ohW2XEL+xAsVKi7RorpgvsXED5341B4Pr4jdCp7wcgOKUwcWr+TKCkpHTjTGBEKdadd4ffHq2noMrhe4TipQ0eNphCWK0wfWR9BStKc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(6486002)(6666004)(6512007)(36756003)(83380400001)(2616005)(38100700002)(86362001)(38070700005)(122000001)(55236004)(1076003)(6506007)(26005)(186003)(2906002)(66446008)(66476007)(5660300002)(54906003)(8936002)(8676002)(316002)(41300700001)(6916009)(4326008)(66946007)(66556008)(76116006)(91956017)(71200400001)(64756008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?W77NOWqte3qLyimoPFzcvFYT923RGyxpm59ZCIT9b/2wRSGWFORbddfBqt?=
 =?iso-8859-1?Q?LXPQ4Q+ldpodfx+B+RLmvgfpMiYGM3zMYhA14MdoGlEJz4Av7Hb26AOeLl?=
 =?iso-8859-1?Q?KK5kKjmfMnIVR49/SgumWZBfqpnXpCCI5ahSnGqoz/vZjL+DqrpsSw/1bz?=
 =?iso-8859-1?Q?9hIu+XlQIDNw3/mawU8/a4y1tODGeAhvJUO5rxl/C4LqLxgrd33rM04+3R?=
 =?iso-8859-1?Q?4GLq2zZFEHrfIMLGwi3cMfRhiBL+QPK557giQRKuOgL5kvMpn7yUnd/pQ3?=
 =?iso-8859-1?Q?O5Jbzp/Tqc+4qzKKViGXB98I/nSxPhx/HGWW0EINiSZnI8DfVWhjRY9lpl?=
 =?iso-8859-1?Q?nlROD0X3amNVdgJNeaFmh6/kx9g6D/FbvIun+HOnmyO3IRuSZq1VoMzG/6?=
 =?iso-8859-1?Q?qjDZSjtRCCPaeaOFhGUcgsCPKw+uchH9JlvJ5QsFC4z+p9AuPS/UEm73UG?=
 =?iso-8859-1?Q?7Ctk8BhOQpVhdtA7YXdmbQjTW7jxr2oDg92D8zgivIB+VC3G7JYihy8fJq?=
 =?iso-8859-1?Q?COzUYoAJIUz+H0plIVc/VMH6zuzZInZWiA3XtN2DGl3TvA/qf02hl63iaf?=
 =?iso-8859-1?Q?Lai1NzsOzcegjxtCmEmpUi3bK6VdYAgLpBgN1dDvYfUQ55pLZdixWJqDbj?=
 =?iso-8859-1?Q?9Xxirr40aNvSo5gvwMfquOc87TAGYVXJtnWLiwCyCENHBhkUf8z28NOshU?=
 =?iso-8859-1?Q?/b/y6V+uxIVKR2s+RyMlW2xvUSA1eLTh0/xOKsO9eCGBoW67StF8+sHP4S?=
 =?iso-8859-1?Q?WJc7Q1aaBmb/8fhCeevTIwfkCpLynrn5pw1PasCemQj8UZ34qH5waBMNwH?=
 =?iso-8859-1?Q?bxMCTJ+npuZGUcBHmqf1hH5cqCWzoMeIfdAaEqaKTvjvIaKWoVIK2a/hga?=
 =?iso-8859-1?Q?7tB2OaGSuwIn8CEN4l/wevFiqKcKKL/O/eelvLUG3Ywzalyh5yFscbOote?=
 =?iso-8859-1?Q?s2LDCY5bVSMrdvExJWDqCXo+QG+AO/MBVpemPb7dpR3okcmUl80YJ3C3Rf?=
 =?iso-8859-1?Q?qd3DYgh5LisPlD+yrBtj+liaNP22b0PSTAXWbc7bP3wHspVGo8Chl3ddHB?=
 =?iso-8859-1?Q?MGb6587KbxsHIFnI5uQNv5wdrzS96fI59PEZAex4/7Hp64fI804F/S8HXm?=
 =?iso-8859-1?Q?/cRRI/hNW0j/aXPbuS1ypCy0IyugxS9w8sfpz+CaAaHvRDDmD1nKjw7lq/?=
 =?iso-8859-1?Q?NDydDDZAQPCBtswjJsaEKaMzNjS1n8eA6zH0nldOLcgK6t6hS55bbyTw1I?=
 =?iso-8859-1?Q?lorShIt1eSiu0aPh/nGZ3118nmrVExPIJrBtU7WZyE7FCqm2OwnspJQuB0?=
 =?iso-8859-1?Q?K4P0HXiSQPl5HIcM35L6tZbN+lW4x4Oamwb70hGh24EyAv0aFOXL3KOlW+?=
 =?iso-8859-1?Q?f/f0j9ScdFEKUIaMfZZ3QXK60hVasVBklwgWwLXcfcuuf+TbmysOI0QkVu?=
 =?iso-8859-1?Q?fA6Ava1GNDGzg81QJMSj3ZqOu5CsCLndp+S5N8ZMGNEnQ9CkfPX0SrFEOK?=
 =?iso-8859-1?Q?fT5ssAESw1zaHTTkv3NXtkVQAfuExpdTdTetKVsA1TjvMlkUsvMuntYaat?=
 =?iso-8859-1?Q?OF7Xy7csshAF+syxm2NRARKN8uborVZkiN8bTHZV06myRJUxGpzTxDKMP/?=
 =?iso-8859-1?Q?6xjFRd7qcv6HtjW/zxiYfT7cMIw5Oor3sWUrpq839aP96s2iMbVXllRg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9db9436-2d7a-4414-6957-08db6bf98056
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:32:29.9298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CehGYQSdFTqvjiB6fiqsYgT0eeFDctLO7RzdWr6PZJMhOFobQO46/txvijh4qKXhqg59XrNv1RN0/YYgWKR8xEVDrkkjtudLRUaemO3OfvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6520
X-Proofpoint-GUID: 8qCW85zte5c2NE5x0LT9moFSrn1ZdiOa
X-Proofpoint-ORIG-GUID: 8qCW85zte5c2NE5x0LT9moFSrn1ZdiOa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130093

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are three  originators for the PCI configuration space access:
1. The domain that owns physical host bridge: MMIO handlers are
there so we can update vPCI register handlers with the values
written by the hardware domain, e.g. physical view of the registers
vs guest's view on the configuration space.
2. Guest access to the passed through PCI devices: we need to properly
map virtual bus topology to the physical one, e.g. pass the configuration
space access to the corresponding physical devices.
3. Emulated host PCI bridge access. It doesn't exist in the physical
topology, e.g. it can't be mapped to some physical host bridge.
So, all access to the host bridge itself needs to be trapped and
emulated.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v6:
- add pcidevs locking to vpci_translate_virtual_device
- update wrt to the new locking scheme
Since v5:
- add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPO=
RT
  case to simplify ifdefery
- add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
- reset output register on failed virtual SBDF translation
Since v4:
- indentation fixes
- constify struct domain
- updated commit message
- updates to the new locking scheme (pdev->vpci_lock)
Since v3:
- revisit locking
- move code to vpci.c
Since v2:
 - pass struct domain instead of struct vcpu
 - constify arguments where possible
 - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/arch/arm/vpci.c     | 17 +++++++++++++++++
 xen/drivers/vpci/vpci.c | 38 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/vpci.h  |  7 +++++++
 3 files changed, 62 insertions(+)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3bc4bb5508..d60913e532 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -32,6 +32,16 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *i=
nfo,
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
=20
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
+    {
+        *r =3D ~0ul;
+        return 1;
+    }
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -50,6 +60,13 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *=
info,
     struct pci_host_bridge *bridge =3D p;
     pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
=20
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
+        return 1;
+
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 9dacb70bf3..490e3b14c7 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -180,6 +180,44 @@ static void vpci_remove_virtual_device(const struct pc=
i_dev *pdev)
     write_unlock(&pdev->domain->vpci_rwlock);
 }
=20
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
+{
+    struct pci_dev *pdev;
+
+    ASSERT(!is_hardware_domain(d));
+
+    read_lock(&d->vpci_rwlock);
+    pcidevs_lock();
+    for_each_pdev( d, pdev )
+    {
+        bool found;
+
+        if ( !pdev->vpci )
+            continue;
+
+        spin_lock(&pdev->vpci->lock);
+        found =3D pdev->vpci && (pdev->vpci->guest_sbdf.sbdf =3D=3D sbdf->=
sbdf);
+        spin_unlock(&pdev->vpci->lock);
+
+        if ( found )
+        {
+            /* Replace guest SBDF with the physical one. */
+            *sbdf =3D pdev->sbdf;
+            pcidevs_unlock();
+            read_unlock(&d->vpci_rwlock);
+            return true;
+        }
+    }
+
+    pcidevs_unlock();
+    read_unlock(&d->vpci_rwlock);
+    return false;
+}
+
 /* Notify vPCI that device is assigned to guest. */
 int vpci_assign_device(struct pci_dev *pdev)
 {
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 3cb5d63e84..0d085971cc 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -291,6 +291,7 @@ static inline bool __must_check vpci_process_pending(st=
ruct vcpu *v)
 /* Notify vPCI that device is assigned/de-assigned to/from guest. */
 int vpci_assign_device(struct pci_dev *pdev);
 void vpci_deassign_device(struct pci_dev *pdev);
+bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf);
 #else
 static inline int vpci_assign_device(struct pci_dev *pdev)
 {
@@ -300,6 +301,12 @@ static inline int vpci_assign_device(struct pci_dev *p=
dev)
 static inline void vpci_deassign_device(struct pci_dev *pdev)
 {
 };
+
+static inline bool vpci_translate_virtual_device(struct domain *d,
+                                                 pci_sbdf_t *sbdf)
+{
+    return false;
+}
 #endif
=20
 #endif
--=20
2.40.1

