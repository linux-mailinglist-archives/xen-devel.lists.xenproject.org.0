Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4D27B9C1A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 11:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612913.953086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoKYi-0004VG-WC; Thu, 05 Oct 2023 09:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612913.953086; Thu, 05 Oct 2023 09:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoKYi-0004TG-TW; Thu, 05 Oct 2023 09:22:16 +0000
Received: by outflank-mailman (input) for mailman id 612913;
 Thu, 05 Oct 2023 09:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gndL=FT=epam.com=prvs=46423b4a7f=andrii_chepurnyi@srs-se1.protection.inumbo.net>)
 id 1qoKYh-0004Sr-UK
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 09:22:16 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aac0d26c-6360-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 11:22:14 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3958bQ50024300; Thu, 5 Oct 2023 09:22:02 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3thssxg5q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Oct 2023 09:22:02 +0000
Received: from AS8PR03MB9583.eurprd03.prod.outlook.com (2603:10a6:20b:5aa::18)
 by AM7PR03MB6547.eurprd03.prod.outlook.com (2603:10a6:20b:1c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Thu, 5 Oct
 2023 09:21:58 +0000
Received: from AS8PR03MB9583.eurprd03.prod.outlook.com
 ([fe80::529f:7d90:7f52:64aa]) by AS8PR03MB9583.eurprd03.prod.outlook.com
 ([fe80::529f:7d90:7f52:64aa%4]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 09:21:58 +0000
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
X-Inumbo-ID: aac0d26c-6360-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkHvwblcgSHOFJNsbX5kcv7fmHSSh0KtkYwJtXZ9IfVq+USVbSTZEmZjXI9R3MMZp/66pUxw3cUPc9Q+/BipZiLSq7fU7RBT0o2SfUgjxz01+2A4SOjO9h8glA0czf0Z4WCJq+7/Ow3M+Sp1wRyAK/h+7hTG+QhqcwAJL9rSwmwIxmWlqT9wf6n6Y1L+/HMgYzYTkHUYIEL7FTW+4DiKHt8Lo+hSH33StOyWGHCsx5AWz00BwZ2TAJ2QX6d9elDAqa8sVnWDNvry1C/gHFwRU9XMQtTV0fFmRiy9hqX+agU8pWBcp1brN+abNz8HHFoI7uYXVmxYbWIqjbguL7QrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAt6Qd8fD4vJ9p244TC6V+jS7EuLxVAUgm5EU9HmNrg=;
 b=cCqJUB85bFV2rRi4ADmsxE94jKOWame+hrHJxnQruIoo968tA2pD1rT/XXf35ijFqyywXoqpsYRX6JQqWAp1z/meGijqUbSt7bW2g5he0FnqjsvWvLCzxIoDyuaRtNWTcvSTUJNBHpsDfOGgpTohf10v9+0wAR2YhaOeGi/jS+kNK3k46c2MLI/wFUCXeBlB1OFeVo8bTcuQli0X7guet3/AHNY5WOyyRnwwnLUbFY3lbIof1DcEsje4Nz3NL8tcfqWznn83NbMLk19nMpro+kBHrXN/7C8Q8u/+Ouff9wxxdMzJ949fy+2ay/CAq8oobRhmaaNln8Q/plvCv5RpZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAt6Qd8fD4vJ9p244TC6V+jS7EuLxVAUgm5EU9HmNrg=;
 b=LCbd83gfrP9Kuo0WDdGN7eYGINYH5YMiTcmKAr3EB1OHuJH5OtMsYg5E3O6dzb564vQCTaiiyv2aCqKzTyr8Ke77tJtYAwrK1SLFJxbgVEgr357X/6lmMzRMrXmQHVBvqcaO3wsn/4v78GLdnu28qF6Li0dDHAtkJutwfjlJ1vpXdL/S7ETU891/f2P7Pf6bZ4128uH8IxGVixAkSmY+FOAgdMDMilj4rqnK09T63WCspJ18WSRD2MwSn6nIufCzcmRVloOM99smSrUPQsoxfNqg8GPVK1Js/akc0N9H4A/Eqaqu0uU5jAFwVI6inGCmeHa4+fvPR1HYOqtFuKKXzA==
From: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        "andrii.chepurnyi82@gmail.com" <andrii.chepurnyi82@gmail.com>,
        Andrii
 Chepurnyi <Andrii_Chepurnyi@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] arm/ioreq: guard interaction data on read/write operations
Thread-Topic: [PATCH v2] arm/ioreq: guard interaction data on read/write
 operations
Thread-Index: AQHZ921jE0Gi8tDe8UKrF6otg5GdAg==
Date: Thu, 5 Oct 2023 09:21:58 +0000
Message-ID: <20231005092141.2540016-1-andrii_chepurnyi@epam.com>
Accept-Language: uk-UA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9583:EE_|AM7PR03MB6547:EE_
x-ms-office365-filtering-correlation-id: 58c792f5-9851-4cbb-18b0-08dbc584865a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NxtZVqaWuBmyBrX8z4F0GpTAKjxW0yTNK1WgWu8p1Xzf0YlIPs/zwMi++2jkqGhlmp5RRqzStWtYMo1TeHOZmbWg4PiwuycAJHerAd7KTUqSxsUZBAzW3Mi/ltf5lZ7iqQ3rDSw2IcVNN3k+kJMpB7XbBX5lGBnTVpvCxXrCL2Vq7hZQmTi7h04cQh6wiuoKwgoSJrYF4Mo8/fC4IFYU3YKv8K/XA6llPycMPoZgeJCRqpCaZkCT9XAx08sAE4GekwI6LozDjvZ3vUriraplsaYDCp0AoC6+GtL65he33OkPP0Z1VnPa3EqQdUYnWnZSlqH8iTQjPQ7SIdLCK28Ixqje2kx4oU1yBC4/sIM208Ht2GaJrCfLpyw8VRWyGvDWxFhEku77Zp/57lHc9nJKL6MONG3S8j6IMDz80vVW3HnmwjNWCWCH2QBc5Q8Gos3wraIE5G+5colr/6+BvK+ZVTkFNA1308tQKSbx8mOr9PYjt+Gllj/pIHZrsbq9WXklyfArZNm6FgRyEuWNNqqgK4lAELsB2kpmFnzgxSMTc6Kqipmd3XCvLOddlnoMsosYRlXdPazQw0mqEY88SkflFepezs5Y7WMVhWylCQX8vY4Pc5HMzvoay2RgSMzEmtxY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9583.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(76116006)(86362001)(122000001)(66446008)(6916009)(38070700005)(66946007)(316002)(54906003)(38100700002)(64756008)(2906002)(91956017)(478600001)(66556008)(66476007)(4326008)(5660300002)(2616005)(83380400001)(8936002)(107886003)(71200400001)(6486002)(6506007)(1076003)(41300700001)(26005)(8676002)(6512007)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?xZ72fnHflieaCtOjnZLf9dhMABarufwhd9Tr7dJ097cRR3mmEIDnBHGVwu?=
 =?iso-8859-1?Q?14Qs20w7yPlIijCbDzaGv2WJ+GIglcrFGLJ98IJv4jMSlE7WLzSRcHL5Sz?=
 =?iso-8859-1?Q?SfLubiNquuUDZakIG2Yvx6q6RGiI++WClb8IojRbX2ixtAp0PYAZ3W4Tmy?=
 =?iso-8859-1?Q?LhZtXBwxAwfAK2qIlToLP6Hk9+c4Dz2H9g1gfGHXihKVjHz0YdtcnDzuNq?=
 =?iso-8859-1?Q?2TO1R+yh4n+/otexWL7JqtyLMl7SOqH/LIhzCc2+3O8aCQ6dsbs/zphBzK?=
 =?iso-8859-1?Q?WKuNdW01JNb+UfuezQhBHTG27Dr9dt47+UfHf9pR5LGSC9nciNtCcK/NfY?=
 =?iso-8859-1?Q?iWEj2Yc2zS1/AOGdXbASal8b5fkpf7KUXXqCLbZvUoSlO3rDC8echp5WLB?=
 =?iso-8859-1?Q?FlTeIRR3nHKoYVjgzIAPy2wXcEx+VOVDcwODshUyq4BPwyMxHO2amY8WDO?=
 =?iso-8859-1?Q?/MQr/A4+t0VEGqOaq+6rqCi2Aew2wHaZRal4Wd5lduy8meFHAzURR//hp9?=
 =?iso-8859-1?Q?eH0KdMQ07kWaiF4Wc1hsFfl5pjdfqRQ8EPEGJR6pLVwbenlSGHBV2ORv0n?=
 =?iso-8859-1?Q?CwqwlgKiC4Wwcz5Q+iS0Epo/3tBOAEfdkcppT1KxONwc0MMK7q9HJJxdA7?=
 =?iso-8859-1?Q?3gkQYNBAbn2o4QkOsMV3U/dERkxgZbWkp4lLmDnzPn7rEGkd+fZT1Ko69Y?=
 =?iso-8859-1?Q?L+EqRsX2yrr1Cki75HS7wxgRAPDectGtfbZnK/9gW/ahl1SPVUpke6fr4T?=
 =?iso-8859-1?Q?D0U/Ieh+7n2v3HgR2KRT5Z1DToLtq0JcB9hwXLtALNPh/Ac647yPDslWq2?=
 =?iso-8859-1?Q?JXATgqiVwTfyMoyPdj7HnceQfhj4a1hFU4sUMO/VQCpJy+jXpvRz5hZv1o?=
 =?iso-8859-1?Q?ZuBlpNOT7bYhsuPy1Nal+IQP5pMKZ//f8hfgihPhGdsHozuiVjv7MD9VY9?=
 =?iso-8859-1?Q?oUfy2lUZwz9dq3L75DQFCBsZaEGhYhj1+r0rPHDBWcedSwf8JZQzBh5vjB?=
 =?iso-8859-1?Q?wXlf6+3rK3tNRJrOHrPHplpgZ5vzB5nf75DjXFLysk0eQPT7Pk1H1hFey8?=
 =?iso-8859-1?Q?TDF2YNcknSu8nua4g5NV2JekuRKFaXzI2I7luNxnqIRgbZPoLXwytXco2H?=
 =?iso-8859-1?Q?d9MfBcGj6VFgUBZadjoRd6/odb4FrHWvh7DRDUtkDpjSDnyNeb4gSLRHtv?=
 =?iso-8859-1?Q?Ieh/HrmXFkpJXcV4OvGpulKBzfsWM5ToTXuRKlksiO9ImmEGsntp885SY2?=
 =?iso-8859-1?Q?ZwRR4dj8RFxx1K2iqUbDzgSl3VEE8aZBxrZe1AS1ElX5qOYunVxxZ/IZdI?=
 =?iso-8859-1?Q?V2wodNv/wdQsbY7FObDTxXzzjJtg+OrvYA0hHW0c06o4ehoQtYwtbWiuzb?=
 =?iso-8859-1?Q?b4BNTmoFdx/QkxiJG4dmrNPfJZTdRFUXQ+ucBwm0imtmzGtilQNB8DErQ2?=
 =?iso-8859-1?Q?45Ipb5IRG1sNK7gGRHL44tR0lsILB/VJ84rIdh9ngOI/N9Con+d1Z8UwLd?=
 =?iso-8859-1?Q?9YG6y+xhcB9FyAMGvufZ7RCn5zhn6y4vTzxTurqdQvWqhTygH0zhbAU4rz?=
 =?iso-8859-1?Q?25gcOHNmrvxgijAFtwBWqWKVM3eGp3SA/xwGYw9LoVI2yZNcmwp81YTHn3?=
 =?iso-8859-1?Q?Ggf5rgf3/O3dW6PGYltOM5RxcTCNnDNzfxzrcKaVuOeGMoEDbJ5teeqg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9583.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c792f5-9851-4cbb-18b0-08dbc584865a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 09:21:58.3346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xyNOv/8gn695zbUgRLjsSZI4gQBOO+JzdLMN0NKrAjEpXcOMS+x1AgCgdLD8SihGw6GZb0qWoKeimGWEfSbP83K1OXJ+4EIUaINcKDWHVnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6547
X-Proofpoint-GUID: F_5XtpUeXkCskwiOFOVMaavogUKjH2mu
X-Proofpoint-ORIG-GUID: F_5XtpUeXkCskwiOFOVMaavogUKjH2mu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_06,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310050072

For read operations, there's a potential issue when the data field
of the ioreq struct is partially updated in the response. To address
this, zero data field during read operations. This modification
serves as a safeguard against implementations that may inadvertently
partially update the data field in response to read requests.
For instance, consider an 8-bit read operation. In such cases, QEMU,
returns the same content of the dat field with only 8 bits of
updated data. This behavior could potentially result in the
propagation of incorrect or unintended data to ioreq clients.
There is also a good point to guard interaction data with actual size
of the interaction.

Signed-off-by: Andrii Chepurnyi <andrii_chepurnyi@epam.com>
---
 xen/arch/arm/ioreq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 3bed0a14c0..26dae8ca28 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -17,6 +17,8 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, s=
truct vcpu *v)
 {
     const union hsr hsr =3D { .bits =3D regs->hsr };
     const struct hsr_dabt dabt =3D hsr.dabt;
+    const uint8_t access_size =3D (1 << dabt.size) * 8;
+    const uint64_t access_mask =3D GENMASK_ULL(access_size - 1, 0);
     /* Code is similar to handle_read */
     register_t r =3D v->io.req.data;
=20
@@ -26,6 +28,7 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, s=
truct vcpu *v)
     if ( dabt.write )
         return IO_HANDLED;
=20
+    r &=3D access_mask;
     r =3D sign_extend(dabt, r);
=20
     set_user_reg(regs, dabt.reg, r);
@@ -39,6 +42,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
     struct vcpu_io *vio =3D &v->io;
     const struct instr_details instr =3D info->dabt_instr;
     struct hsr_dabt dabt =3D info->dabt;
+    const uint8_t access_size =3D (1 << dabt.size) * 8;
+    const uint64_t access_mask =3D GENMASK_ULL(access_size - 1, 0);
     ioreq_t p =3D {
         .type =3D IOREQ_TYPE_COPY,
         .addr =3D info->gpa,
@@ -79,8 +84,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
         return IO_HANDLED;
=20
     ASSERT(dabt.valid);
-
-    p.data =3D get_user_reg(regs, info->dabt.reg);
+    p.data =3D p.dir ? 0 : get_user_reg(regs, info->dabt.reg) & access_mas=
k;
     vio->req =3D p;
     vio->suspended =3D false;
     vio->info.dabt_instr =3D instr;
--=20
2.25.1

