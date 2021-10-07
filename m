Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CFE426056
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 01:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204142.359350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYclB-0000v9-G0; Thu, 07 Oct 2021 23:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204142.359350; Thu, 07 Oct 2021 23:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYclB-0000sv-Cm; Thu, 07 Oct 2021 23:25:09 +0000
Received: by outflank-mailman (input) for mailman id 204142;
 Thu, 07 Oct 2021 23:25:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uL+=O3=epam.com=prvs=0914b18df8=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1mYclA-0000so-7v
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 23:25:08 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ceaf344a-27c5-11ec-800e-12813bfff9fa;
 Thu, 07 Oct 2021 23:25:07 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 197L9H3Q023528;
 Thu, 7 Oct 2021 23:25:05 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bj8j3r8mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 23:25:05 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB7578.eurprd03.prod.outlook.com (2603:10a6:102:1de::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 23:25:02 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::24db:d530:e190:518b]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::24db:d530:e190:518b%6]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 23:25:02 +0000
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
X-Inumbo-ID: ceaf344a-27c5-11ec-800e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWACLVBep/EjGcDRWdem+cWhO6hib95j1FOykwWkA9NT0ZTy0PvqROtnWx2JzEm7JpB3CrdH+g8e382tmPRTijQyzfQ03jLW/KAFWDpqAE9PVDFFZheQ3melk2saaSc1Giog9094vC9l25I8N9HFF1h9+dnxp8L7u1IEnDyPr95D8azemaZ2tVdEQ+nimcDCUaEDCGuYPIXkEqVv/B13obboRJE4VJTBIsJsB4NFG6guP/vefKFabKr6Y0Bf9lDc/ANHktkGNlopncSHXRE0xWrsmmhca+EMTT7uC9WORNRzXUeUiP14Mb+2eCXs8hK3g7R0qvXYevH2D6uz9QMAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuZI90lAAIKpFQMzV5avlUK1NGDhGgySXt1h3s9njuo=;
 b=l+7l6Jj6Gmtqq1X+Zxke+ueA88IIt66o/0VroMMjJ1GIVdPuOTQYGuyTW3R7rw51Orb8CDFNNZjsik45cwEBt23FfRV3YRfOGOtM47HZTc1xQHoa7xcOwDUxTuHowndY6huPrPgyfJWDojXOdyyBaYFpVPz0H01q0BkoHOLEb/PyrQlu6JhnX8Vb37GwUpwzeM0Ya8Y5vCbQGrO6dFo42S8blhyL7doUJMHKbCaVl1BDGbp6qIiMoqPlTsoId5vnXlprYAN1oxnnwDgK3HGD4deqm1ORsd8JHeHPHJqUsD4aeUlBG5Ox0evxN7otTWMKi09jxBv3n8tv5asnqAhInA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuZI90lAAIKpFQMzV5avlUK1NGDhGgySXt1h3s9njuo=;
 b=PrLuqKfUgB/l0qNOGfo0gCRwgAW+krvv7wUH0cO874khYght3yUPbJ3AiuH+Pgp5vPYCxS/3paTkVuEjFIH9BmvW9pJCULx62MPlNHl0TVCQcTDUd+5RBUhH8NY/mWlFbVoexIX7VFpVFeqs3dlPJUzV/FeYfNEix7JniJn4hirLdP9aU2S/4tCLqlIEn6xAkCKWQDTQajvIuHBboXtAmxb1KzsSKafmlVWKoTSR0YRqmR1CojCNhBpiVcA4qStEMOQTemXbEwSCU7/YLRtBb+UCG62C9lb0U9u2ZfAQ7G7/H23fc58KKlaB5BDZ/HlVbNrafRBvlj7AfpQWDkWFHA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
Subject: [PATCH] xen/arm: optee: fix possible memory leaks
Thread-Topic: [PATCH] xen/arm: optee: fix possible memory leaks
Thread-Index: AQHXu9KNK+VfP9tRZUeeM3jP6MNf8A==
Date: Thu, 7 Oct 2021 23:25:02 +0000
Message-ID: <20211007232450.2036087-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.31.1
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75f8227a-e4e4-45e3-6624-08d989e9b041
x-ms-traffictypediagnostic: PAXPR03MB7578:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PAXPR03MB7578C325A9835AE92CAF78AEE6B19@PAXPR03MB7578.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UPQ4mRQqzsK6uL2gy6jFIkMIhVYfpgzJ95kfMp8wclxz+M7SVrq6ssIl9szB0QPc6sbnPV8XTSzZX3CTnOjuvHGCPCh9ssItMKzkviKvrRyobTgHsToKySdQ1TlrqQjsYVloUJTwZURhT7wbg8OwS0hi5+e0iSmcmILlIIvib+6OyJE6ZWPlLtyJvb6gX7BMPADmwr8LqZEuysZDPAOiMFurRMBkGpNiFx/DgQPxnD7iupwKZCyPZFVRV1emNUYOxphq5oqUkwapyjxQiV0MypRpto8ePxd1rWHUyCvLECdWUg/GaZyHtEI0OHMRsZisPtqakuKjijgtpD13J8RPvoOrFWOqkpg4nJxYsW9/BfPOhVHKVQ+BKVDBB2MGxCmGAtpd3c1JKy8F75s6bxo/MltN3/Y/SVtpl6/OugxHFL1Cnh6pGFVr7EfBvXpzWjVQGKjyEVoBs9ra0uhyoEXnimFcA9JPxEzqDL0tpxOd9o0oI4BVDxl0xWw3YSr9kqWKaZ8uiu904Vi5CKxZG9iBrBnXBkVrqaLUMBcLpTkN7nY6CSmQDRXFKVBTJ2B31UZQU01DARW09/RPrQ4GkeRayIXJ0Z+1TNlaz/drDTz9k9N4EeS+DZ7AE5K1E8PrMGweEVSOqmjReJERtPpm9r0WIAJun7d354bWcnmt5gLBpMtSB+rdvRm7OpTb9FvS1uP1dS8PZOtyHw2kzE2nI17REw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(66946007)(5660300002)(1076003)(6506007)(316002)(38070700005)(122000001)(6512007)(38100700002)(83380400001)(6486002)(66446008)(4326008)(91956017)(66556008)(76116006)(2616005)(26005)(8936002)(36756003)(6916009)(66476007)(71200400001)(2906002)(508600001)(86362001)(186003)(55236004)(64756008)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?MAZea0NHvgI8s+FYbR8E6X71MMEiomGS2cM0IWUO+tjFkoY0n4So3sF/82?=
 =?iso-8859-1?Q?ANJ0J4rtOT025Q02IWkVBvwtbLSJzHlAt5eXRUBOkenu7Wf2OLoHyL7beq?=
 =?iso-8859-1?Q?0hWB+vU4Lel/9ayBww6EZispkB2Kfz/twt0PWnegNg+VsamGkiWGl0RuvB?=
 =?iso-8859-1?Q?qZ/PT32PgIxgDZNV+mdeqcIBjmd7dvZu19cDhfAP1n9o9vWhUpdC2METQr?=
 =?iso-8859-1?Q?szwDvKkg2be2MeG3PSYPQ8Ue6BIdc3gNyRIkz0I9/jNxGq86hWgN2guahD?=
 =?iso-8859-1?Q?750lOscYuw1MPH5qfbRS/g4bxDvWjV3mUEvzhozo11CimpzSkPpK4fxHr6?=
 =?iso-8859-1?Q?rmQrOM7veO4Tog41xIO42J48twR1zvQsroZ08rLLwKLvnFdVGlDT07y0mx?=
 =?iso-8859-1?Q?1MFvCXI9lhx/puu4EdPIDQ8TqNCBgB/im1JGgIld5yTyr4JWuzORSHABw+?=
 =?iso-8859-1?Q?t0HmCZ/BVLXDPlkDrA3YoYD9DFiu+3vTwUmVjdW7Cq0uFY9DkCSa92Omm3?=
 =?iso-8859-1?Q?quarjPUsLfbcHjNA4Pu8fSAVfZRG5VLPgpbKzFGgQbsz28utYqxqQ5kyHr?=
 =?iso-8859-1?Q?VH10/zL97eqN4kIspVfjPZuukNngAanbABcCp+Z6sqmWTDANk9Qatmom9o?=
 =?iso-8859-1?Q?I8XTYHayQxMwqM63nE/phzoBT45NfRUi1L47hc3uUV3GyLRjYLbAgGwJ5H?=
 =?iso-8859-1?Q?e2Dyvu0lZrwnTXt68pr+6BFxc8fm7G20Ed1k4xWetgjvUnL7kUDq4Fg8ST?=
 =?iso-8859-1?Q?O9xQUDb5t3Ux2ZM06TI5WlGjDhYWMZWUd765TsQOSaf3Z4CJKp5ETsDSth?=
 =?iso-8859-1?Q?lG++4OnqkKvtIezrpWLCRhA19UiKulalUB3IZYZRyzBwnQb6ifyn01kqr+?=
 =?iso-8859-1?Q?72RVKUCpP9lcjRnslRdWtXb7S9yV5ZnSHF+YSDv21K0cz1nXZ+TlvXbNEU?=
 =?iso-8859-1?Q?mOZH1Kt5wnrNym3LfUoercqxUoa3XyCXhFonOIfLi0zgu0teMUI6GtEJBQ?=
 =?iso-8859-1?Q?nPz8YwB1OdM4CQtA5qFMX1xGy4ZPAO4Tp+R+fyLqnmC61BWBURmmeqkdZI?=
 =?iso-8859-1?Q?BguTlJbczK7Rj9vmZjTKWat+dt5ukeMqk18tC9nAsCwgNSIeerM/JdcRa2?=
 =?iso-8859-1?Q?nKKK9AIrp86yWv9MFqAGSNMZRwA2uoUKpSy6U7rx32m8wq+EiVwMumqA4G?=
 =?iso-8859-1?Q?poCvASJCcp3q9sd7Q7badgzYbttdgwGgvaNqanP5CMP5bF00dk+P8xm3QF?=
 =?iso-8859-1?Q?6CxOlb5W20M7IR5JOBrIhsFm5rKdEV5XP1JRWoIIx4SVqg4zwtxMpDNjF4?=
 =?iso-8859-1?Q?S+ogf5LxrXureALxuj1MT/jVq70TGOHnbX8dsGBgGswH4+1E/M4i9y6nAC?=
 =?iso-8859-1?Q?gxFo0nBndK?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f8227a-e4e4-45e3-6624-08d989e9b041
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2021 23:25:02.5942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HU2pi4R2hdWm5SnmMNrT0DH5afT3UB7ynNnK9F1XtwUu9fbsVc3dSlpLnN441ak+3OzOkYAAgV1WNOsQf8auqyKG4Y+NIzLiHtfAS9a8UBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7578
X-Proofpoint-GUID: 7XLnpndXR_5HGvYjywyrb979z6_CFdM1
X-Proofpoint-ORIG-GUID: 7XLnpndXR_5HGvYjywyrb979z6_CFdM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-07_05,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=992 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110070146

translate_noncontig() allocates domheap page for translated list
before calling to allocate_optee_shm_buf(), which can fail for number
of reason. Anyways, after fail we need to free the allocated page(s).

Another leak is possible if the same translate_noncontig() function
fails to get domain page. In this case it should free allocated
optee_shm_buf prior exit. This will also free allocated domheap page.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/tee/optee.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 6df0d44eb9..131d2f9a8a 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -781,7 +781,10 @@ static int translate_noncontig(struct optee_domain *ct=
x,
     optee_shm_buf =3D allocate_optee_shm_buf(ctx, param->u.tmem.shm_ref,
                                            pg_count, xen_pgs, order);
     if ( IS_ERR(optee_shm_buf) )
+    {
+        free_domheap_pages(xen_pgs, order);
         return PTR_ERR(optee_shm_buf);
+    }
=20
     gfn =3D gaddr_to_gfn(param->u.tmem.buf_ptr &
                        ~(OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1));
@@ -807,7 +810,7 @@ static int translate_noncontig(struct optee_domain *ctx=
,
         {
             guest_pg =3D get_domain_ram_page(gfn);
             if ( !guest_pg )
-                return -EINVAL;
+                goto free_shm_buf;
=20
             guest_data =3D __map_domain_page(guest_pg);
             xen_data =3D __map_domain_page(xen_pgs);
@@ -854,6 +857,7 @@ err_unmap:
     unmap_domain_page(guest_data);
     unmap_domain_page(xen_data);
     put_page(guest_pg);
+free_shm_buf:
     free_optee_shm_buf(ctx, optee_shm_buf->cookie);
=20
     return -EINVAL;
--=20
2.33.0

