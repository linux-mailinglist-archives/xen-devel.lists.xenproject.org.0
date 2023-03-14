Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443F66BA106
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 21:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509831.786406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhK-0001hm-Lm; Tue, 14 Mar 2023 20:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509831.786406; Tue, 14 Mar 2023 20:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhK-0001eN-H0; Tue, 14 Mar 2023 20:56:42 +0000
Received: by outflank-mailman (input) for mailman id 509831;
 Tue, 14 Mar 2023 20:56:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ugWp=7G=epam.com=prvs=7437a4d9da=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pcBhJ-0001PN-Cs
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 20:56:41 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b57a9eb0-c2aa-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 21:56:37 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EKchDm017378; Tue, 14 Mar 2023 20:56:34 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3pb0520156-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 20:56:34 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAXPR03MB7967.eurprd03.prod.outlook.com (2603:10a6:102:21a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 20:56:31 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 20:56:31 +0000
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
X-Inumbo-ID: b57a9eb0-c2aa-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQDEFzFQEctIMciwl+OzILvSR+CtxdwKClPvqkzCdH+oDsbR9ODNhE8AncllQnO8TSsW/yZq+NotDcTmu2ybRbcGf2+PFWXDusjKKJOVzlT6LNkcytQ2Z+cVSqIUQSAMI6oUW6wfxrDROeeoKX7UHO1rytiTm1846btTwvuhwz1b1eQS9CkbUqNsa/otfhF40hbd+mru89BHYXDTG0ssSImnBMNrhT/Yew/ne3ka/Gwjd/3GICVvkxsan+rnmtwjZcJUT3Ulm/oQ0eLT/Hg4/jafJUd6SGrgGCS3RqHmqT+Du49cdLShBOtnQuq/sc0mIjwYUdcBwTMWgAWY0r+kNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bujiMIeI01tpfNGAxOt9A1TohJ0brfLaSY560ql/6y8=;
 b=ZcKZPIYzvjg3a+xuzBXN9aGpneT1iz6/fZq+mxyxa9YGVAItEWeYY1NLE0mMrgCOVxgrbx0TN82Vxxcj3IsH9oPtvcY+qlnDq/q1RdbvKVU9c4AnJEXu28uexFQPmRXI6AwYEhLNE9DTMjQ1aw3c5hAqWC38cF13WR4BJ4DGlEry/cuAcgHAD7UngKrQrjv1gdvABrmoaIs+mtzIa06juDL8zxqF8DhQjN2WRwXpSfdbwKmLImNXJjC2LdipW/SiUH6JuWJijiaEVDu3+y/q4KM42DyHZwAw14msDPjmjrL5popYL85mUbHpmhpazMUBCXd8tqcLsMhcKxbg9SErdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bujiMIeI01tpfNGAxOt9A1TohJ0brfLaSY560ql/6y8=;
 b=TRgsE2qqyXIug3Rvp9xC4Tsva8b3hoeQ/yoB+W4E3ti6aokwK8VgDRNvhjqgrdWQVrZnGqd3Sltn1cnzLJdaS6Wg2UY47E3VzHqcOKN1R0rpYNtgPzGZ/ZY48eumt44P/02l0A5osPHgV8KsKFXy99yMKmMrgAKVn2eIFx+VaCKlAhyA4PcGZfFCpUOUAoUpkG72EScSY256GzGWdj3F+JHkPw7P6btyawhmBoxhwi5UC93CoG711TG03oK2Rq0nKml0W5bTeIlFm66HrfCeKA67uf0Qz8z5oow4LxXYC1Db4NjjiNshUbUuMazID2KfYM3RzsI5tTVjiC//C60Fbw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v3 3/6] vpci: crash domain if we wasn't able to (un) map vPCI
 regions
Thread-Topic: [PATCH v3 3/6] vpci: crash domain if we wasn't able to (un) map
 vPCI regions
Thread-Index: AQHZVrdzRVfDuhWpnEqbBuMRX+vTVw==
Date: Tue, 14 Mar 2023 20:56:30 +0000
Message-ID: <20230314205612.3703668-4-volodymyr_babchuk@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.39.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAXPR03MB7967:EE_
x-ms-office365-filtering-correlation-id: 2fc9dfd1-07b6-41fb-77c3-08db24ce968a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ubw5diB9t8NW2UgX8HlKvSfPhPzOV6VfAUHH6IlrTbvgSyEWDbBGJmEPOzijjBbJ2ISEr1+J1KlbY26l8Mo9OPpB4HBDdRVHyy3u6W+MBrYrENPj0rkKM2CXuuClV/T8FLlOBzT0oBsMqCEIKlBAcux6QrFAfAXtA3a2cIdX3oBLO9xKQ2eiXRgLav19aqHrcKYN4nyWqTWFjueOPQ5e2ooQhxk7jVzCkQtWA8ZMAOfTNsa5JO6aqxd23Zi3dEACxHE3z0vrj4nostgZEoLMiUAk0MIEAojvSC0lElHgP4Cep6BmlFnpTIsIDEybLIInVP0MN/y+5Ei6I7ESVKZjR1MpNp4HLLgfKPkkrDXOc6n8yrXIlRp+XDfVmVfTB2RNJdnO9DxxGgb7++9xqJq0VNACPjW2/pnsfvUuq8T/jwFN4qEotrrRl+HdzgXsM8rYOXanvJhTczGI7wTOpTjTUfp1aM8CQqRfj3gzhLePXPMQ6KmmtMbJYPuhcIWRBJzgU+29rxoAC6t1NU3tJaEEKaM/EXEr8oha4CCo7bCHarTsTdznN5bpTX5iIfqS9I47x0SFmJrt80vOlt/auRXsEc+0CqhYW8p9V3J4Wuk2XWt+ABb45nbSEcwrQRmU3ItQD60LvbXZEDr4VdkuGXB/HClpyOwGdbZ7Qlfd5hwTpfN76j/It9br7iepG9tRvOy4E9H4qIF+wk11kW3XX4kgQg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199018)(54906003)(316002)(86362001)(36756003)(38070700005)(38100700002)(478600001)(122000001)(55236004)(83380400001)(6512007)(6506007)(2616005)(1076003)(186003)(26005)(5660300002)(6486002)(91956017)(41300700001)(6916009)(71200400001)(76116006)(64756008)(8936002)(8676002)(2906002)(66556008)(66476007)(66946007)(66446008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?BescmCuB6tXcs8SN2vu/r2N6rpAoLJ25LJ6GVm+wdExCu82L2fj7XfOJUj?=
 =?iso-8859-1?Q?pto7hknqujKfmoM/qDpJ+k+Q4FKt7uP2D93NzUeAfCR77zrZc+lUHEfxnm?=
 =?iso-8859-1?Q?o36IDhPDzJ+Ig5ZnFWkIxlFVWK5R1bFMKYFPlJval64LdrRXZeUsIVX4UH?=
 =?iso-8859-1?Q?JX10SMbV2Sf9owSyad3pdzW4fBi93U3aAsLJPm4h5lEULH3F6sE9TUuKVs?=
 =?iso-8859-1?Q?6qvmLkQSAWu7pgoNuBCVwpajC2VmR7N1XPUVZ0Mt+HQAsrZDOWdDfYegRY?=
 =?iso-8859-1?Q?/vx9TtrnJS3Y1znE3UlrR3WdtzM55j0dnPTQBor53yZY5E3CKqHB7qVu1Q?=
 =?iso-8859-1?Q?mUnht5ejB05lZZxIogSWtyXnqRuE47QgDFfWdvBCsU2Fn+5B3Lgxl8Bjz8?=
 =?iso-8859-1?Q?arQChlF2HVFL/QNpD2GPoSwGzQ7dgVh06KmiE6aHy0afrtGc8+H/F1fyRS?=
 =?iso-8859-1?Q?9ViOqxOaqtZ9DH+vRh2f2hupSpHyzamjCXmPv904zzbvnGtddZPSKecenw?=
 =?iso-8859-1?Q?2q0JOmM9sl1ct/8lmP/mwfRsCFIEOZEsWbjSIQJgHCuuAZusTFBRfXD7ZZ?=
 =?iso-8859-1?Q?dpejoA4ABFqPYo2M7C18pZ+QWN9txQFBKe268I53jrcXmJ9ulA0AVoA0yj?=
 =?iso-8859-1?Q?9Yu6+5n5unr03XOaci3wrmx2xJYbLY9enxoOu6RecvyQ6LKwgdz10HRZkv?=
 =?iso-8859-1?Q?jgLOcjgIjVBpFjwcJw6n1IbSRuPtTXhtznFd39uZO0SJsvEhIkiq+f/0do?=
 =?iso-8859-1?Q?U4gOTWuoI/7lHMf/QlBSSBzyb72o0Ihz77y70ah7EqLBzZCEBHlsuu6MN1?=
 =?iso-8859-1?Q?Cc0iHVzAck3NqgGHPsgPhnmRfboMe5P/Y37nHP6PAtZ8vkmry8HnE7b0l2?=
 =?iso-8859-1?Q?We9rnrWjjxHEM6JdTX+gMG9Cp8Eh4b6uX0x90bY+UxiGKYTTGaqJKTXlHU?=
 =?iso-8859-1?Q?Mr79nE0yjYUlBjPipi9qRII0VKJkdmjJ5P2XEY0vopGgR48zutU9vKXbPh?=
 =?iso-8859-1?Q?QDJWJBgMPK/0AdcWiDJA/xVd0tr/Eu31aFgxao0qwsBS5z/oNOPemOQeQh?=
 =?iso-8859-1?Q?uUZuMnYgJ6T79bZhyipVYDnbqQNABLv3LZ9mjMcUZyQmFO0kV7pxLWFtF/?=
 =?iso-8859-1?Q?b9CvAp/VqvmIKKO4xs+vhTt42IpwZJK9p+yCkNHIWw3JsLUyrPuNTjtIvJ?=
 =?iso-8859-1?Q?xZb5/MrCzEbhmzMBt9nlXpRlfZ6l1E3hRZcnmCbPLASoPQkAwvKhel/WaW?=
 =?iso-8859-1?Q?rMVdSCtkTgR2/amfTg1jEwJJLZrOc3Ovf8h+If3HE+2on7L67sB1/LH2H+?=
 =?iso-8859-1?Q?aLSbWWfCxsI1oNGczp/C00cnadtxxd9KkYjFKzFBuLVilvymfncLKkF8SA?=
 =?iso-8859-1?Q?9epjXNm2J8otkUsSXbY4J8G22jXCT2MwiLNBgIGFVx4suzwWLDGcp8ljAs?=
 =?iso-8859-1?Q?gKvmhMRz+u630QrglNFIU8moYYrxlZrAKHOejBfO5CpDes4KcfKhG1qAL2?=
 =?iso-8859-1?Q?J+sTme8rrZqEYq5UUs3oWJMLH+OHPOM0ZbZN+byJRszlcsT9ZQMQzXWiWh?=
 =?iso-8859-1?Q?SJrYHnARjZv7boMfVXQXmej2uXXJPGTkJYpAIHJ6n6Kqwv3rVC8jEZXVXT?=
 =?iso-8859-1?Q?DDInIIYfGQfySaTnIV0NRV2wfIl+taZL3jaMxXwW/5rk+qG66qyBudzw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc9dfd1-07b6-41fb-77c3-08db24ce968a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 20:56:30.0421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4PvcZkAB80bioXeVm1mdBkohJAwQhAlnmY3u2nQfTvBufmTguLADkY+WLoI6GVLNu4YKUWh6IQAtpsi4e+x6OQrWvZYUqW3jAeNL1KYxS/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7967
X-Proofpoint-ORIG-GUID: OJIrJ60dx9-k4b8P-5rmvGDskVIzpZIs
X-Proofpoint-GUID: OJIrJ60dx9-k4b8P-5rmvGDskVIzpZIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_14,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=644
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140168

In that unlikely case, when map_range() fails to do it's job,
domain memory mapping will be left in inconsistent state. As there is
no easy way to remove stale p2m mapping we need to crash domain, as
FIXME suggests.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

v3:
 - new patch
---
 xen/drivers/vpci/header.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ec2e978a4e..8319fe4c1d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -162,14 +162,11 @@ bool vpci_process_pending(struct vcpu *v)
         rangeset_destroy(v->vpci.mem);
         v->vpci.mem =3D NULL;
         if ( rc )
-            /*
-             * FIXME: in case of failure remove the device from the domain=
.
-             * Note that there might still be leftover mappings. While thi=
s is
-             * safe for Dom0, for DomUs the domain will likely need to be
-             * killed in order to avoid leaking stale p2m mappings on
-             * failure.
-             */
+        {
             vpci_remove_device(v->vpci.pdev);
+            if ( !is_hardware_domain(v->domain) )
+                domain_crash(v->domain);
+        }
     }
=20
     return false;
--=20
2.39.2

