Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C587B9D54
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 15:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613009.953256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoOR0-0006I1-PH; Thu, 05 Oct 2023 13:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613009.953256; Thu, 05 Oct 2023 13:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoOR0-0006Ez-MJ; Thu, 05 Oct 2023 13:30:34 +0000
Received: by outflank-mailman (input) for mailman id 613009;
 Thu, 05 Oct 2023 13:30:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gndL=FT=epam.com=prvs=46423b4a7f=andrii_chepurnyi@srs-se1.protection.inumbo.net>)
 id 1qoOQz-0006Et-B7
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 13:30:33 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ab7461e-6383-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 15:30:32 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 395DGG6L020658;
 Thu, 5 Oct 2023 13:30:18 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3thwvq032y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Oct 2023 13:30:17 +0000
Received: from AS8PR03MB9583.eurprd03.prod.outlook.com (2603:10a6:20b:5aa::18)
 by PA4PR03MB6926.eurprd03.prod.outlook.com (2603:10a6:102:e4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 5 Oct
 2023 13:30:14 +0000
Received: from AS8PR03MB9583.eurprd03.prod.outlook.com
 ([fe80::529f:7d90:7f52:64aa]) by AS8PR03MB9583.eurprd03.prod.outlook.com
 ([fe80::529f:7d90:7f52:64aa%4]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 13:30:14 +0000
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
X-Inumbo-ID: 5ab7461e-6383-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLAZX3vn/XIFxWyymnQ8lKI0YuI1MeUN6qbUUowX7Uvf9i0GoKbgB+x0SMeElmolaLfENZahUq8vEnBLmNV/1pgnUENbQylJscb/xGeCeWZm0eec37lLxWHzb1MRu6djcaR4Bf9zav2eU6AWQlYC4drgzeFaKl+Ev6t4jCu3xLdIscSmwVJTcVcLL2TED006FwO72uFtPwoK75klYjlnXxeAuFtgps/q5Nl+vIKG5aKmgkf33jgVfy9VGUjG3YNb/HN/6acg6OEq2pF54rYbtOp3Z6Qz+rXtxgOxQ0Bh/VK6UevcMKMXiHu26IOUgruAIk9vgdGuztMF0n4W1xh9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6I+lOSuZlgvE8gmDgyPKVdwXA39J4ZWrm6F8aAwavz0=;
 b=kbEKrIBqD+dEQk8Twr3QSg0o8hrwvGIHJJOwDUK+nvs8CJQS4VelT59uwMNyg11BmcBQYHIriwY/6IB2heC9itp09+PIvIhQIWUmxteLZLjEX+Ufzjm0mbBSMFF90lYVXhV+dXBrOSRPESR/eDdXKHKmEtnhyMmSawzlj5CXXG+gqFDLYOTHod4GkX5Iy9SCW2JGigctR2tHFDIp6R0ycV9yTiDuMZfi1Rl/dzQ/1dwRWA2bF2YRi43mbK5BEI5NBsU/EGaYjtGU9lPcmQGLrUiPi9OOIvm3rkYlbNtt73mDYN+FbS3Hyb+B2bmsFvloamj6J5hPfKgzm44CAaGFjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I+lOSuZlgvE8gmDgyPKVdwXA39J4ZWrm6F8aAwavz0=;
 b=aHNpmfLnoors7pAWKwWHykWvedGEgMWcO/EvlGLetzDbz8CPLoZn0ApQ/q+NACYOBoKNvt0T77zmLTwRJn6i5olyvNUpdH48M4DnZAUvhMKYR8dJ2RlyLL/quF16VYFpN5j/oUswdk4uWbuVlUg9qVqgCRRrhpJACr7e/HpUZ0Upgjn2fz0bEyaaciXRpQinBjPvEoYin8GZyC245rQRQSu7iO9rFKn9qo0uHH6BVi78WXhtn1Gye/hzPhWdmN2Cwf0Pm3gBLbkaDOe8m8hD4Go6/J5MV484/vT0vKVo0rtoVphte62//tHRr04QvS3vjavR3xWEuoDFBTtjFCqcsw==
From: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        "andrii.chepurnyi82@gmail.com" <andrii.chepurnyi82@gmail.com>,
        "Henry.Wang@arm.com" <Henry.Wang@arm.com>,
        Michal Orzel
	<michal.orzel@amd.com>,
        Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] arm/ioreq: guard interaction data on read/write operations
Thread-Topic: [PATCH v3] arm/ioreq: guard interaction data on read/write
 operations
Thread-Index: AQHZ95ASCSTawXXogECoWqu3XZfq/w==
Date: Thu, 5 Oct 2023 13:30:14 +0000
Message-ID: <20231005133011.2606054-1-andrii_chepurnyi@epam.com>
Accept-Language: uk-UA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9583:EE_|PA4PR03MB6926:EE_
x-ms-office365-filtering-correlation-id: 1ec7a562-fe2b-4196-0ffe-08dbc5a73509
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KDrWkOLOnAXrc1G8ppuArMiWDNvNVauWEWnKQjpUVAKTZ4eWrY/0MZk7Qytu0EVOsVyJ6UPfOULhL8Rzn7BzePRgCrZDUzMAz6EDqENH9lQgvenF96xnGqjgHtBtZSq6keRjVlPhd20iVs+kWtH+19rRvmcGemOoQuRdzOXwlpHoVRf88RJOVuIo9QF3u06v3kGKdVrCuFC8aPPNn64hR+1XMeMPNfb7usU91XrHFV79/JGQXDmkKgKtN225L1JFDml5iVAwbGDcF9/9rXhBASyOC8FAsEW/c0I7ZlZvo6Jg9Yz2Jhk8mCbYhryMD0WiGs2W7KW6Zj03+I5ENbIUiezxV5TBpbMATQWaDQpuA2exupMGqFURpUmQoojJfa+6y6o+uZfAdSPwZST76VuOj9+HmGoNzeSArZG4oX8N7Mdgt4hUmI5yEm2R86DepReY5edFkiHxB5mdNp0dJ3daqgZVT1Kg4mwDcAN+yvOoJW8wDRqgkuKFPygQ9FX+974QuKnMseyL93atI6WNZq6L1DOu8kyrHYbvpuYhRjgvPbD4GO8gI9UYmnL/U4XhE2COvIsKiyhymIWoR8thJhjxAskTPHN4qotr94RJdpZ/Cty226a3hyj5gMlqShfIJm9a
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9583.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39860400002)(346002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(4326008)(5660300002)(38070700005)(6916009)(6506007)(41300700001)(54906003)(122000001)(6512007)(107886003)(83380400001)(8936002)(1076003)(316002)(66946007)(91956017)(26005)(66556008)(66446008)(71200400001)(66476007)(64756008)(478600001)(2906002)(2616005)(76116006)(8676002)(6486002)(36756003)(86362001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?dbqFznKuq7hDU5001Toh+d/6mfy2R1JJMOFp5BgzfF5Ht96AgpznPQe6A2?=
 =?iso-8859-1?Q?gCg69aYZcBajAP1WcsVhhsok3WknRz2g94o9VKPHGpg8BCGUCj1JU8WqFT?=
 =?iso-8859-1?Q?U2MjCTZpKJhsAkjZiEXUTmDuaqcDlgqavksJWDZyhPCxSKrA9s9890okII?=
 =?iso-8859-1?Q?J0MSH8pcrEsOlXPUqxQJw46cLhxyl2LEXlaIpMTkY9wv+Xs1fUnVW6w71W?=
 =?iso-8859-1?Q?H8MfbQMcm0LxQerR9+G9kGXzY9BZEmexzOdbZ1i/TXY1TkQ6BsmxUFzgOc?=
 =?iso-8859-1?Q?Nh8VUPy8IkkEWxp1/OWv+0RWGGbAUmYwUQumDb+TIrPewVar3NQdRAI8EC?=
 =?iso-8859-1?Q?lON2sJOiaDzw5oOKheLfpZiSu2DOa0MvOljQhrdCTVt5MTCPJnSAxgVsTD?=
 =?iso-8859-1?Q?J3y4s/EB3vYa6qhb6XrVF8UGd8pXiQyCNaAxx5z6bKAA1bmcp4n4lJRNn9?=
 =?iso-8859-1?Q?loqN6NJouXd6AfJ78B+nQ04Pu+6jIUs+RQKwqsidQlsvTlbwvQIx/HcMLb?=
 =?iso-8859-1?Q?09dxTbP1R2QntALWEZKP2iaXrSJWONjUI/3FoT+51gPpwTMShzmscH/lYo?=
 =?iso-8859-1?Q?d1EgdDIgXF4CE2u+3txIM9b9tstm0NTOYNVEYUNIbXNIJ1nxXn/NX09X+N?=
 =?iso-8859-1?Q?BZt6fYsuQBTtRkTs7ajcV3j5ExhbGYQOca6aK51g/mgvO0JA5ingpYxA/7?=
 =?iso-8859-1?Q?Fg6sLXsLUzq3+t7b9QQLnJrTmWhmIK4XEOdNF5KAwkLhvrmxePDSLfhGaz?=
 =?iso-8859-1?Q?QVLP7oAjzFuluA/nnzbsaOTliU0kCCSc9knMZCqjWMoFRUb/asF9RlqbpG?=
 =?iso-8859-1?Q?3/eEq+iv3zmtq6ukkD/QImEbbkg0oDRlSXAjX66JzHpJkB/hg4uLNRKoEW?=
 =?iso-8859-1?Q?7bqA+jACuE5mPGmCaVTXuy9dk4QDVKtrV20CuSayjZMGR7KExaVcg9RHRE?=
 =?iso-8859-1?Q?8aegs3yXZ8CI+2CEbKemW4NybEU+AlgVFiq7TFEL/0VkeIwXl6yB2GHrXI?=
 =?iso-8859-1?Q?fTuZUdJAggMD6zKEhq3tjLnWvMNaSSqkTZjY0wucWUpx3RHOMqzlaT7m5v?=
 =?iso-8859-1?Q?+e/CeYI1Pf9Mu9bi3sIorD+n0EI73z3qZmZA+6uTnrSif0ne/vgcW+W2tl?=
 =?iso-8859-1?Q?7RK6pwE7bErzZOU0Ye7er4ydVGMS9a/GX+iFSVVyVG9/OjQAYi2ojEUnMn?=
 =?iso-8859-1?Q?tb4eDW0Cp3qQ2QoPmDpke08NMRQi7fV0J1/GMvmLlm07yDKdMce7ovjFog?=
 =?iso-8859-1?Q?VEgVd/Ai0RyPFLk0/3+8g0/nUiGfVGryU2yI3JD6l1hw7jx6AlcgmyZrzI?=
 =?iso-8859-1?Q?1KfV5o9scY5Kh20SWfMmApgwYvKd+IMfLj2l8V1M0OQv/kUZJCU2t1ADlk?=
 =?iso-8859-1?Q?hC867llrcv1mQAeoXXwbxZnG7NNOTUbcYx8ZQnymiFBQmdw/aVNgs+UJSq?=
 =?iso-8859-1?Q?zmQmV2LMnxP3iJp2K8OskM5ynZU5E5KFBIDIm3qiIwddiVHkHdH4NNJddw?=
 =?iso-8859-1?Q?gC/sGkWL3GAjhTnN/DYrplVLBvIrHFDnw/ZrC0IrvZApVRBQ+QGvIIHdAL?=
 =?iso-8859-1?Q?121A0OKW03r0Iff2FgOhAmHx3LzQHJTUs+OQPFRib0klS6/ZBqgBvBpufj?=
 =?iso-8859-1?Q?gmvFsamB7cWUrt3R6wIQgqPZIWe4pM+m1eUiwBGziulwZF8AQvsAiKZg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9583.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec7a562-fe2b-4196-0ffe-08dbc5a73509
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 13:30:14.2579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: noV5aD5eGte8t5ikOS77jV/+idoZ+j+95CAR3f4NlcayLFcgABTcy21nFQDZvaGVe4+0pJEJ2fTojDOGXlnR5j7Qpr3uYbV+C0bPZUqj3PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6926
X-Proofpoint-GUID: NRuOguuxzDzFAs5guWbJAS8UKcoAt5_t
X-Proofpoint-ORIG-GUID: NRuOguuxzDzFAs5guWbJAS8UKcoAt5_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_08,2023-10-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=882 phishscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310050106

For read operations, there's a potential issue when the data field
of the ioreq struct is partially updated in the response. To address
this, zero data field during read operations. This modification
serves as a safeguard against implementations that may inadvertently
partially update the data field in response to read requests.
For instance, consider an 8-bit read operation. In such cases, QEMU,
returns the same content of the data field with only 8 bits of
updated data. This behavior could potentially result in the
propagation of incorrect or unintended data to ioreq clients.
During a write access, the Device Model only need to know the content
of the bits associated with the access size (e.g. for 8-bit, the lower
8-bits). During a read access, the Device Model don't need to know any
value. So restrict the value it can access.

Signed-off-by: Andrii Chepurnyi <andrii_chepurnyi@epam.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/ioreq.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 3bed0a14c0..5df755b48b 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -17,6 +17,8 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, s=
truct vcpu *v)
 {
     const union hsr hsr =3D { .bits =3D regs->hsr };
     const struct hsr_dabt dabt =3D hsr.dabt;
+    const uint8_t access_size =3D (1U << dabt.size) * 8;
+    const uint64_t access_mask =3D GENMASK_ULL(access_size - 1, 0);
     /* Code is similar to handle_read */
     register_t r =3D v->io.req.data;
=20
@@ -26,6 +28,12 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, =
struct vcpu *v)
     if ( dabt.write )
         return IO_HANDLED;
=20
+    /*
+     * The Arm Arm requires the value to be zero-extended to the size
+     * of the register. The Device Model is not meant to touch the bits
+     * outside of the access size, but let's not trust that.
+     */
+    r &=3D access_mask;
     r =3D sign_extend(dabt, r);
=20
     set_user_reg(regs, dabt.reg, r);
@@ -39,6 +47,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
     struct vcpu_io *vio =3D &v->io;
     const struct instr_details instr =3D info->dabt_instr;
     struct hsr_dabt dabt =3D info->dabt;
+    const uint8_t access_size =3D (1U << dabt.size) * 8;
+    const uint64_t access_mask =3D GENMASK_ULL(access_size - 1, 0);
     ioreq_t p =3D {
         .type =3D IOREQ_TYPE_COPY,
         .addr =3D info->gpa,
@@ -80,7 +90,13 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
=20
     ASSERT(dabt.valid);
=20
-    p.data =3D get_user_reg(regs, info->dabt.reg);
+    /*
+     * During a write access, the Device Model only need to know the conte=
nt
+     * of the bits associated with the access size (e.g. for 8-bit, the lo=
wer 8-bits).
+     * During a read access, the Device Model don't need to know any value=
.
+     * So restrict the value it can access.
+     */
+    p.data =3D p.dir ? 0 : get_user_reg(regs, info->dabt.reg) & access_mas=
k;
     vio->req =3D p;
     vio->suspended =3D false;
     vio->info.dabt_instr =3D instr;
--=20
2.25.1

