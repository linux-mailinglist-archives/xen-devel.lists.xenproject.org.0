Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA9182D036
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jan 2024 11:03:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667097.1038122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOxJn-0006Uu-7f; Sun, 14 Jan 2024 10:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667097.1038122; Sun, 14 Jan 2024 10:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOxJn-0006Ox-2l; Sun, 14 Jan 2024 10:02:15 +0000
Received: by outflank-mailman (input) for mailman id 667097;
 Sun, 14 Jan 2024 10:02:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KR5a=IY=epam.com=prvs=774324cbd8=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1rOxJl-0006AA-I9
 for xen-devel@lists.xenproject.org; Sun, 14 Jan 2024 10:02:13 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fab47a89-b2c3-11ee-9b0f-b553b5be7939;
 Sun, 14 Jan 2024 11:02:09 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40E29Aat013393; Sun, 14 Jan 2024 10:01:56 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3vkmj1hsv6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 14 Jan 2024 10:01:56 +0000 (GMT)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by AM9PR03MB7725.eurprd03.prod.outlook.com
 (2603:10a6:20b:41e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Sun, 14 Jan
 2024 10:01:53 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::9640:139b:8daa:fc9e]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::9640:139b:8daa:fc9e%3]) with mapi id 15.20.7181.022; Sun, 14 Jan 2024
 10:01:53 +0000
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
X-Inumbo-ID: fab47a89-b2c3-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/7D4F8abhHtlI6G7CfJL4BhRaISN31KPe1cUJllSW6m8Sqo2/xHmiYj3JnOuj9TQ1461yptmmYOxJ9dzluvEVG1MtC+QX/FuFykqn5HsTWLj543KtMWT1GlD7LEefDB+cPEiQ0StwuImHHyBI/PY/4SDstAJpgGxHUkr5hlnaOGfGjyHyYQEFVmfwaN9Uob0UM8dSv9/Vi0W5c7q0tFaQDMPpYq2f3JRK98DdGA78y9yAdcX42IluitEMwR4lyhEXC6V309ZuSJOt3abRZzWPW/0F460MYuafw63vpmFzwRQfin6EDRZPA95ocwj/Um02RJ+qe8UWVozfd3CLU4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5WrO4pORRjJwySMRAgFI+4Dm/wKfZdXFK/o0SQScYM=;
 b=FaS3dCkE5myn+5jTghZV5jr4gX44LBYSMd7DMRqRLWpl4tovV/a6SD6HCn7Jb99ywjrGF1gZe00h0EDt0pH6D3yRIAjZipYO725FsPaTO8cDEbNbiDrBXw5WltDBuW1EtIWD0/hELm+y/11ZMfgSgFy4/WcNyyBMz+iBSgGbGNPQK9rnwlvCGeL/DAqYH8WbQbtOdueN7aK9tnXhvKXjy6n72fO4ReAjeW/id1e3q7irEbGF++AJ2Xmp+cDHF+Vn+ELxWysLEGpUIgYwlNzI3w8EP0KVdw7sZj4A2yGQyMB23CnzUVmIRpsbk7PoAQxsB90BqGBBcTHoONDgDPUSPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5WrO4pORRjJwySMRAgFI+4Dm/wKfZdXFK/o0SQScYM=;
 b=Qbcf0iPYz+OVMFfLBwbkEp+YZ+O3M87YIRq7cfyYPL91F+hj6E/iXrFCP+LP69KOYq/oRBd934BgRMi6Oj1qscpNhIAltQcGwrHA75VKqRV9f7ZBFHxzxgKX66oWbA20/fXgL8REJTSyEbNEH0VIZK72lmtYEPz2KdGJ1pFt5lXO46seMaWV3IHjbBnvFT06nsCIGOzlam3nZOEGK35pbxT0uQfP3h2cJ1RuAmPnNOHqN0g5whI4Ie2HeRqcnGJMj0DesGOjtrHYMJ8EVqBTyl+xwsZP5W0jbfn89hVqD0rCTY+VKOwsNjsFVMzAAOeg/I8Gq4hUUspqjrQzabebcA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Wei Liu <wl@xen.org>,
        Anthony
 PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Andrew
 Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Topic: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Index: AQHaRtCzsHPhy+CQVkWhqLuVBID2ow==
Date: Sun, 14 Jan 2024 10:01:53 +0000
Message-ID: 
 <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1705066642.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|AM9PR03MB7725:EE_
x-ms-office365-filtering-correlation-id: ed95b25e-b022-4a46-f393-08dc14e7d58d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Ea9yoJKoqsLJSU9J8I0z8B5ifPEwTrfLoS9K+IujV+Zq66+ma+rSEzZ7zMuPgJd8S3pFGOgt2fxYZgmfj5W5J9nRktA6Pezl4DRJj+dKhce1FhF8m3haqAxvATG0Tp2kJnZ2ISIPlFgcKlYOfs9/DwDyutf7kYeP5iNqZq6LrJ33a3yx++n03nD1jtM3WayN5fiMBMld9qK5Ez/ijfv2Y35rdB42gqeg20Yli7iQycuUyukaThv13XZZgp6k9sKpMNbFowpzTnw3JT5cncBjlQ+gI07pG0srUxB4iW9zDqqZIkZNu4/Sl3O1pgAH4GfnAsWYMiR1uN/96xSlkpZNeQ5OxsZZIgIxAh2L6WUhYVU9zFtniDMmGUO0kNRTLeoSn4M41V44nVytM2PN5TkVjbQwwUAbjDT89B7E6sIrGq/4yZvA1N6Sg0SSlB9/2yjOI4zZBVQEBpzzVVu3cWN6QiR8t7i0rXBklN/w7fwsd7042Z6u+qNAYGDc/9eqxfROKrrI4BffuSnAC4gsPPPVnl7vGFUSax1gI4jwVufvv9WSd5t/PR3XGZZacEXtPA0RrAl7Vu5Dl4XYQREjvDKvw4Nd/SOZ0F4JVhWkuwBp4FxhsttV7QypWeFfile5jQcWUxYeYodi/id8BmN9BNr9JXgaBdI17VLIJ3h9pX3kvF4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(39860400002)(396003)(376002)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(451199024)(1800799012)(6512007)(316002)(8936002)(8676002)(91956017)(71200400001)(66476007)(64756008)(66446008)(54906003)(6916009)(6506007)(66556008)(478600001)(66946007)(6486002)(76116006)(2616005)(83380400001)(26005)(7416002)(5660300002)(4326008)(41300700001)(2906002)(38070700009)(36756003)(122000001)(38100700002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?QUkjUWLzNTvo60Su71ifnBprbNKBcUy8SxtV2HgFIYcac7rkYzsdK+COIL?=
 =?iso-8859-1?Q?DETEdvScbTJazhUD0O5NqnBOOn4QPBhA6+tsD/rdx+UMV+BMKgMx9hpF8b?=
 =?iso-8859-1?Q?4Mp/H0Wo6BIFJRkhM4bTgL/mLBjV7VEZhJnmR3+g5i2pSScp84oekp99Ax?=
 =?iso-8859-1?Q?3PU/zTjq4n+sBr3yxInLvRdsVZu9j04eAAcp1weex2Si3gXpe80upuPyHi?=
 =?iso-8859-1?Q?fb7xyd8qwRp1FReqX9P7movoa7R15RCXM8i5h3kS/zvVR+qzpKoQN9DmMP?=
 =?iso-8859-1?Q?OkUFiVGrGwov1S2iLdTT2H6n+h7aPygI7C1iRA2O+MV0qsKYGZeyuzKnbj?=
 =?iso-8859-1?Q?7Ua4mtAKhjw/7McLaT5epdDl5O4PpbwTXFFDTZYNXcZPprp3bGcc9SOmtW?=
 =?iso-8859-1?Q?1BPCKLoqoWYi/gd48iXLiQLMp5i4cV8EsSh+vBtYA6VEkJD4rEBQOwMPxf?=
 =?iso-8859-1?Q?4yv/THVU7dYHDXZRyV2EJfgHAGd8x4rhl9V3DNkNTbvKTpVbDDMVQT0J47?=
 =?iso-8859-1?Q?YJ8LdEPdW8E/jkiOezYVZnq2v2JfH8u0VHNK6vG/EWrtGvz32GzHUfvxO9?=
 =?iso-8859-1?Q?2HPGT43ImPDOFYN5E4AoLa/BeKi78WuB3/TVH8+w/sXKeIVFtmH8I7gVVZ?=
 =?iso-8859-1?Q?sDYmF1FgVmX/gFqFbkOTpPvUnNPAwV/aOW0qqpKFW0zKi81lUzSZttYBDo?=
 =?iso-8859-1?Q?aCX0DGXgIJU1uobveUKzvWlfu7FVT6n0bW5Dj7hjrTvcCxxbCOUbZsCF0s?=
 =?iso-8859-1?Q?pc1JiXP4pGXmBNFU/lLUJPRGyDeBsMdVOwk3xryvVIhjO33phN5+oE2kKc?=
 =?iso-8859-1?Q?gNUkTE+IqH5IhU/5WKivqJh13VByTf8xdIxxufUI22vWmJP2+OevEoNrOQ?=
 =?iso-8859-1?Q?nv6Xjpoh4C5JXa4zUjiHibb52ObHrO+RD8ZRHgh/yNFtqaeEESV+J5dupr?=
 =?iso-8859-1?Q?DLSFvAnNMAS4dovh+gdIDZsaN0DvfaC0pjn1LTdvmIPTMxq6eCHDxk/FKp?=
 =?iso-8859-1?Q?xZHjIx0FQp3UQq0GXWnHJE9W6IfEAnHkN/FNmq4xxakJSVMDYP+okn4dG8?=
 =?iso-8859-1?Q?xnBEoKF/j559VFz8Bh/l2tE12XhRKlpiGqqL1JI39mbwMG4QA5nCS+BKhu?=
 =?iso-8859-1?Q?cWDvLfzugZBl+M3pVyolljKRaXaDF+voOgJJPwg6curEmyBoe0bdJmyjf+?=
 =?iso-8859-1?Q?rVkx9uiZsAFubAIA9+g4B1/jGKaA14jwwwu7MwTXHy9HX+GZeCw/zAvmtv?=
 =?iso-8859-1?Q?GKkOTCgi1/NdTh9BvSgXC4wPdD1VTU/HHZulUaj05Mem47h1URtBucNMfV?=
 =?iso-8859-1?Q?FmljAgE3VYe9/Yj9EK7//xphUW5vAvResoadl72Cn+rZgHUeMzzuHIE0i2?=
 =?iso-8859-1?Q?KMpN7AZ0wfWh6f0prXFv4oifWRKL+pYJhVf9Kixsn7M7PybqXYAgd0iTUT?=
 =?iso-8859-1?Q?k2TlFItVHwhYKqwx42JIL/HGCZAgbHVwz+65VfFcsDMyCWYyFHRC0UYZGI?=
 =?iso-8859-1?Q?rgusuza19/iBaEAzi8eNGmg5XdtrFNK8if6QFOM8TP7bXP2EfGHLuT4IWK?=
 =?iso-8859-1?Q?x4sPN8qJzOvAT57lTAkJ1XW3uc/DrKxEeLccz0cERk7GcNhvGXfBl+l0Ou?=
 =?iso-8859-1?Q?GTAk17mjCIkKY08IfW6gSrggfkdHi27TII/dzT8pLOnzbq2rkQDw4TvA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed95b25e-b022-4a46-f393-08dc14e7d58d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2024 10:01:53.2011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n7+BZ3Vt6JSG0z60/FMUKVanqYJ2ZnI/1fZPsDirWVQgtRCZEs0aHjGrLKFZgSJaCoif1A49EvZOXwVFt1MrhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7725
X-Proofpoint-GUID: mzJhV2cR_4FNwPYKjX505Xu2OmZkY671
X-Proofpoint-ORIG-GUID: mzJhV2cR_4FNwPYKjX505Xu2OmZkY671
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=707 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401140078

Add the second version of inject_msi DM op, which allows to specify
the source_id of an MSI interrupt. This is needed for correct MSI
injection on ARM.

It would not be safe to include the source_id in the original inject_msi
in the pad field, because we have no way to know if it is set or not.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 tools/include/xendevicemodel.h               | 14 +++++++++++++
 tools/libs/devicemodel/core.c                | 22 ++++++++++++++++++++
 tools/libs/devicemodel/libxendevicemodel.map |  5 +++++
 xen/arch/arm/dm.c                            | 15 +++++++++++++
 xen/arch/x86/hvm/dm.c                        | 13 ++++++++++++
 xen/include/public/hvm/dm_op.h               | 12 +++++++++++
 6 files changed, 81 insertions(+)

diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.=
h
index 797e0c6b29..4833e55bce 100644
--- a/tools/include/xendevicemodel.h
+++ b/tools/include/xendevicemodel.h
@@ -236,6 +236,20 @@ int xendevicemodel_inject_msi(
     xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr,
     uint32_t msi_data);
=20
+/**
+ * This function injects an MSI into a guest.
+ *
+ * @parm dmod a handle to an open devicemodel interface.
+ * @parm domid the domain id to be serviced
+ * @parm msi_addr the MSI address (0xfeexxxxx)
+ * @parm source_id the PCI SBDF of the source device
+ * @parm msi_data the MSI data
+ * @return 0 on success, -1 on failure.
+*/
+int xendevicemodel_inject_msi2(
+    xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr, uint32_=
t source_id,
+    uint32_t msi_data, unsigned int source_id_valid);
+
 /**
  * This function enables tracking of changes in the VRAM area.
  *
diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
index 8e619eeb0a..17ad00c5d9 100644
--- a/tools/libs/devicemodel/core.c
+++ b/tools/libs/devicemodel/core.c
@@ -448,6 +448,28 @@ int xendevicemodel_set_irq_level(
     return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
 }
=20
+int xendevicemodel_inject_msi2(
+    xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr, uint32_=
t source_id,
+    uint32_t msi_data, unsigned int source_id_valid)
+{
+    struct xen_dm_op op;
+    struct xen_dm_op_inject_msi2 *data;
+
+    memset(&op, 0, sizeof(op));
+
+    op.op =3D XEN_DMOP_inject_msi2;
+    data =3D &op.u.inject_msi2;
+
+    data->addr =3D msi_addr;
+    data->data =3D msi_data;
+    if ( source_id_valid ) {
+        data->source_id =3D source_id;
+        data->flags =3D XEN_DMOP_MSI_SOURCE_ID_VALID;
+    }
+
+    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
+}
+
 int xendevicemodel_set_pci_link_route(
     xendevicemodel_handle *dmod, domid_t domid, uint8_t link, uint8_t irq)
 {
diff --git a/tools/libs/devicemodel/libxendevicemodel.map b/tools/libs/devi=
cemodel/libxendevicemodel.map
index f7f9e3d932..aa05768642 100644
--- a/tools/libs/devicemodel/libxendevicemodel.map
+++ b/tools/libs/devicemodel/libxendevicemodel.map
@@ -44,3 +44,8 @@ VERS_1.4 {
 		xendevicemodel_set_irq_level;
 		xendevicemodel_nr_vcpus;
 } VERS_1.3;
+
+VERS_1.5 {
+	global:
+		xendevicemodel_inject_msi2;
+} VERS_1.4;
diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index 5569efa121..c45e196561 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -27,6 +27,7 @@ int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_set_ioreq_server_state]           =3D sizeof(struct xen_=
dm_op_set_ioreq_server_state),
         [XEN_DMOP_destroy_ioreq_server]             =3D sizeof(struct xen_=
dm_op_destroy_ioreq_server),
         [XEN_DMOP_set_irq_level]                    =3D sizeof(struct xen_=
dm_op_set_irq_level),
+        [XEN_DMOP_inject_msi2]                      =3D sizeof(struct xen_=
dm_op_inject_msi2),
         [XEN_DMOP_nr_vcpus]                         =3D sizeof(struct xen_=
dm_op_nr_vcpus),
     };
=20
@@ -112,6 +113,20 @@ int dm_op(const struct dmop_args *op_args)
         break;
     }
=20
+    case XEN_DMOP_inject_msi2:
+    {
+        const struct xen_dm_op_inject_msi2 *data =3D
+            &op.u.inject_msi2;
+
+        if ( !(data->flags & XEN_DMOP_MSI_SOURCE_ID_VALID) )
+        {
+            rc =3D -EINVAL;
+            break;
+        }
+        rc =3D vgic_its_trigger_msi(d, data->addr, data->source_id, data->=
data);
+        break;
+
+    }
     case XEN_DMOP_nr_vcpus:
     {
         struct xen_dm_op_nr_vcpus *data =3D &op.u.nr_vcpus;
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 462691f91d..a4a0e3dff9 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -344,6 +344,7 @@ int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_set_mem_type]                     =3D sizeof(struct xen_=
dm_op_set_mem_type),
         [XEN_DMOP_inject_event]                     =3D sizeof(struct xen_=
dm_op_inject_event),
         [XEN_DMOP_inject_msi]                       =3D sizeof(struct xen_=
dm_op_inject_msi),
+        [XEN_DMOP_inject_msi2]                      =3D sizeof(struct xen_=
dm_op_inject_msi2),
         [XEN_DMOP_map_mem_type_to_ioreq_server]     =3D sizeof(struct xen_=
dm_op_map_mem_type_to_ioreq_server),
         [XEN_DMOP_remote_shutdown]                  =3D sizeof(struct xen_=
dm_op_remote_shutdown),
         [XEN_DMOP_relocate_memory]                  =3D sizeof(struct xen_=
dm_op_relocate_memory),
@@ -539,6 +540,18 @@ int dm_op(const struct dmop_args *op_args)
         break;
     }
=20
+    case XEN_DMOP_inject_msi2:
+    {
+        const struct xen_dm_op_inject_msi2 *data =3D
+            &op.u.inject_msi2;
+
+        if ( !(data->flags & XEN_DMOP_MSI_SOURCE_ID_VALID) )
+            printk(XENLOG_WARNING "XEN_DMOP_inject_msi2: source_id is igno=
red\n");
+
+        rc =3D hvm_inject_msi(d, data->addr, data->data);
+        break;
+    }
+
     case XEN_DMOP_remote_shutdown:
     {
         const struct xen_dm_op_remote_shutdown *data =3D
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.=
h
index fa98551914..da2ce4a7f7 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -444,6 +444,17 @@ struct xen_dm_op_nr_vcpus {
 };
 typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
=20
+#define XEN_DMOP_inject_msi2 21
+#define XEN_DMOP_MSI_SOURCE_ID_VALID (1u << 0)
+
+struct xen_dm_op_inject_msi2 {
+    uint64_aligned_t addr;
+    uint32_t data;
+    uint32_t source_id; /* PCI SBDF */
+    uint32_t flags;
+};
+typedef struct xen_dm_op_inject_msi2 xen_dm_op_inject_msi2_t;
+
 struct xen_dm_op {
     uint32_t op;
     uint32_t pad;
@@ -463,6 +474,7 @@ struct xen_dm_op {
         xen_dm_op_set_mem_type_t set_mem_type;
         xen_dm_op_inject_event_t inject_event;
         xen_dm_op_inject_msi_t inject_msi;
+        xen_dm_op_inject_msi2_t inject_msi2;
         xen_dm_op_map_mem_type_to_ioreq_server_t map_mem_type_to_ioreq_ser=
ver;
         xen_dm_op_remote_shutdown_t remote_shutdown;
         xen_dm_op_relocate_memory_t relocate_memory;
--=20
2.34.1

