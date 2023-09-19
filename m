Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8257A6131
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 13:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604611.942089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiYun-0000pU-Jx; Tue, 19 Sep 2023 11:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604611.942089; Tue, 19 Sep 2023 11:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiYun-0000my-G2; Tue, 19 Sep 2023 11:29:13 +0000
Received: by outflank-mailman (input) for mailman id 604611;
 Tue, 19 Sep 2023 11:29:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kB+/=FD=epam.com=prvs=36266dbb07=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qiYul-0000Xy-Mr
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 11:29:11 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf613ce6-56df-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 13:29:09 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38JB52cu013085; Tue, 19 Sep 2023 11:28:58 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3t6r9ybe6s-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 11:28:57 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB10084.eurprd03.prod.outlook.com (2603:10a6:20b:628::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Tue, 19 Sep
 2023 11:28:53 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 11:28:53 +0000
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
X-Inumbo-ID: bf613ce6-56df-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrN+YelRVlyAqafvyMDD5UVT1308p/9vQPTTFLIGB6mveq4rumu/KGngfK13mJh8yOMeptsjMhqoCOtePlLEISy3c/MyPNSX1jH2LlvTQ5gfHDjQDtNNEVXbiTR8jy4C9eJ1uCxZ+vSLW7eJTEjB82+My6WutQ8k6ZPIhzx159BhZxFu27Y5EKmkemnbFhs+JZ9rEzUwtxZlOB2yDRLtJplVwDwB0hydmU8pWtrSVav5B7ZEgJWR5YwODjqP6yAcgirffwqC7J9joSMhfxyHZA7/Tj2o8ttz8n1QvqvKPAAZcRZ6MbOjS1QytWUby8SZ8ABJ0kj13iVcuN/LCxxh2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EL8EW1Wf0smeCmefyJe62z5xVjR7Rx7TyTl1SpuYNzk=;
 b=ns6hNNcTve8T1hnjLJ9pj4DN51MJ+SIxFmPGpthCMcVmDyb+tOscmQdMyRsnat3v8Q9gFLgDCLULy5LiaQpRHm10lxSRGEFSemPCRmm4eJ+fGt//jtsOA9STRBO8HtBow4hsQKbIcn8j7fgoYvrbNQwaX+Q6AYwWwyvAhl7+WzeKlPGAIC9wSLN7JX/ES0NGPQX3Hi30DEgLocshZv0G3TqN2vnR6Cs/8lksBIfLJAeFrvU9uGa/A0T7n8yfV5+ydKxA8aWL7yz5RkYhFHwrYbfb2Yw8ULDeHW8+urCWv+UlmPtd7REoeO1NHpU485ho3RH9lQ0tPr2vJKctojjR4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EL8EW1Wf0smeCmefyJe62z5xVjR7Rx7TyTl1SpuYNzk=;
 b=ozp+njqRZ1F9/kqX5V+lzsLS40Kum2xXIlI1NOK2t6MfzOZrfbzpKxpMi1vFg1kCv3Lt/EkEjmfNnPLyrtHkT0jGS9AKsWH8dW+9egl1F3DVEkVhUdSxlyzTl9F7xZJ+KYAezIJOKV7KkxihKiVCivb3dlc3ntzZen/byD1jko398AVxMuHh05Zd1Pq0h2cs/6n8FZ7fslKNPKmFn/JcgX+A+04CXtfOGq18/8e8nrgL0vCSSV0QVW9163iGg2jaoZ9yN5igr9Joxrzth7ga5Mx3w2KcLdlapiHHVGfc/qTgXD8Hz+fnAPO8TSYwpbX257NJq1X+EiymE4qrrrYg6Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 1/3] ARM: GICv3 ITS: issue INVALL command after mapping
 host events
Thread-Topic: [PATCH v1 1/3] ARM: GICv3 ITS: issue INVALL command after
 mapping host events
Thread-Index: AQHZ6ux4J+vpvrMLBESLD/bhCu4NsQ==
Date: Tue, 19 Sep 2023 11:28:53 +0000
Message-ID: <20230919112827.1001484-2-volodymyr_babchuk@epam.com>
References: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB10084:EE_
x-ms-office365-filtering-correlation-id: 6577df2f-e85d-4595-c12f-08dbb9039aef
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YfVLOCeP8UaxqJnbbnOeP4v2Gbanw/JOHBXc8uK7MZ3HuVmwDVETc8s+Taa/ECeYz99c96tgRENnHurPNeTrs3Mp3PKIBeGlx4Tx+czIL6CAI97ewrNIbiv/747hj8pnBC0ZJKn/VmiVHENAtdevYoDrcz2xc7jqel0atdu0dk0r4zO39ftQ1gA8bvKgAGq1k3NzRmgP/LVPGD/b1dMFUTHoxTg7yNUDoDMSBEi2qOQSStlUBOkBFuXQJzWx1bnShHl2S1bp2o9XBeHP3Yj/jRo2j+YxfhKwuOWsMxa4PXsfrFL72VUbTvomkun+PcfBMCzT6EKm0A+E0Dyc6Wl4+fceR+m+pwC5ESJvxK4/8wDHXuKcuHO6ckVIe+sxRUkK3gosS0rtEqZR6obQPH3Hxe4q1lG1hsGRWke74DbH86JY1HH9aNKTrM6Pj8PIh9tMekbJIX9kgRgJz+krcxPR1iLZ1KNquICccK5R78y5CqphloMb4gy0FUdzAAdj9rXdixaXkA5MewRu+Ghmd2SeZFnQiwpIQfvMxbXuWLQaQsp8rbOfRbuLvxDMPdDghzomTVvXyQTRS7tTeB9pzSDIhfJu1MzyX4WdGW1wbqmH6PkN9CAlIqmhJLqXR1yngg9o
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(136003)(376002)(186009)(451199024)(1800799009)(66946007)(6486002)(66476007)(6916009)(71200400001)(26005)(107886003)(316002)(2616005)(1076003)(83380400001)(54906003)(41300700001)(76116006)(64756008)(66556008)(91956017)(8936002)(5660300002)(2906002)(55236004)(4326008)(6512007)(8676002)(66446008)(6506007)(478600001)(86362001)(122000001)(38070700005)(36756003)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?TBnI0gg/SfVIfwvUSsuSlfvIBTcJq6yIEsCOL+qkTOO4U5Y5kzRo1omfCJ?=
 =?iso-8859-1?Q?JIDI6wPvaxS6JZlpY2KhuD50aAQiI8vC2LbNN0HMx6DusZM3+QQyK0xnuM?=
 =?iso-8859-1?Q?xL9n2wp8/R5qCTgqncXC1wzEd+Ptw9GVZJBBrxi1iIUYqQI3Mk8ahSVI0n?=
 =?iso-8859-1?Q?CAoZUZL00t+RVtgA4zPnh1H5K8AYaOAuE5Odd4A5ztwWpq3e3y1JLE3BBu?=
 =?iso-8859-1?Q?f8Mvk8yclQh9nJBSZzaIibFSZkevbLNTCkxi8MXySxrU2ZLVo+5toVZPWz?=
 =?iso-8859-1?Q?g1NOgZnsif7kzkbMabkPXfwfKvOh1A+Z8bcv1L8QtX6gAYmw826AOsJ4+d?=
 =?iso-8859-1?Q?hcFrtEG/NrGvpIrMt/HJXFoKuNkFMwsXy0O06VfSz+pa7TzzOVYVoSj54n?=
 =?iso-8859-1?Q?gm31gw/nKW4WQVt7emybKCyY98R4vGmZ63tcN3t8RyyiIKUjhmWRfdH0a/?=
 =?iso-8859-1?Q?vojSYkr21ijYx8jUXO7ahFSIU7Ncv5qoCaUSREZSNhqchnzTQLTLBJk/Iw?=
 =?iso-8859-1?Q?DvGP2X7VY+ln5k/f2udG+ujdMMBQ9D3lxQnHwb82vIqOpePBjpbG9tOzk1?=
 =?iso-8859-1?Q?5af5CEs4A4+FPcLWUoJBKUads1z04b2DT4INFF2nq5kLegfFi6aSY/6Idh?=
 =?iso-8859-1?Q?axV+1c+EuLX17M41ntUbMFz8YJNioBeOeafzWMy5X87zCTvFUx1GF3bZIp?=
 =?iso-8859-1?Q?7d5xOQAj6cG95vNLGz3yG2vGXx18+q/7/xaYHB0lVu7uGDe4AfJ4ty2oPE?=
 =?iso-8859-1?Q?ZX5eMSjXUjfcFFPeEBd+PS/M+eD36S4SztNSvL4MN92kghhan3p3OdU96T?=
 =?iso-8859-1?Q?u9ktQxcGWp/MAVfCHR1EvC9seTKkdJEWfCPWWCe8myxYbrnSqcbMzhAuKV?=
 =?iso-8859-1?Q?kMDWqzMeuiSWCqsw1qQpBcjMtVCWw58aL+61MWGvIuVQpSqfW6NScTnjn4?=
 =?iso-8859-1?Q?/WfqDgfNoYtaRuymiv8xtrOIhrlkrNdj1rlyKn8Eaq73Mewh56ZyRy7sjh?=
 =?iso-8859-1?Q?GRqeuHoY2N8vqvY8/ZionkAWGrcEn4ICTt6dCazcyu567aqjy6M3h9386J?=
 =?iso-8859-1?Q?U1fmIAQEV395Qt2qLn79aK07tjePhROXvjSb3JDm4O5Cb5BIsKW5tyjHJ1?=
 =?iso-8859-1?Q?PQnhrxJNnau25R3NlvVSkfU2CLs+V4r4a8XiG/jtaAhIX9C0ryjPERig6+?=
 =?iso-8859-1?Q?+VuDd0bo2BqSiPgkCa7aI3ZN7CjBvd7DMidQVGDNUY7f6ybRkecP9W4ZLJ?=
 =?iso-8859-1?Q?t761vjGWTkdzRpbpjYuXOEYj3U5WhSTzpwQOT0y1SE8XIXiHHv0aeh2ar5?=
 =?iso-8859-1?Q?btr+PFh3KUkNgq5HRt7VyYXttQruKYLVEIxLWoxyyr5AA0MrnAQ9T+hqi0?=
 =?iso-8859-1?Q?icvFcpop3HEYVjKBJ1Q3BagABBX4JqUkB5DmsYgKaiQVcenyR9z6+Fbn0S?=
 =?iso-8859-1?Q?c1o8imwOa1/tTlm2BcCEgiJuNG/B7DFsjQlBHEqG3UiC8PybvrtdUBsoYj?=
 =?iso-8859-1?Q?EhekaVzJVHoK4OqsOLWwuoznRBzF52HhH0rcjrPGIG+Z6TYpl5yRwHCQxx?=
 =?iso-8859-1?Q?FuIE1MWv3ebp6XOLoRcpv9OmTt/1hnqsSVRtjPawpPWKX92FutkLw2n7ak?=
 =?iso-8859-1?Q?/eCle50xobkrvvPvy4ANO63e4RhMaFgjiFfjRj8WzHdgVIUdGRujIwzA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6577df2f-e85d-4595-c12f-08dbb9039aef
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 11:28:53.8237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K92H8OL9Nufb0n+xmfRDdiEddF8RuSxzlbmQKix56fbsC0hkCkhMHPRMSLfjETF9s4CwpACpHsezCO5gDPuKs47cQhnJNQMMlostpvoH27c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10084
X-Proofpoint-ORIG-GUID: gtLOoZ9TmtNSdCEgTtV2fj7-5iu5rqAU
X-Proofpoint-GUID: gtLOoZ9TmtNSdCEgTtV2fj7-5iu5rqAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_06,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309190097

Implement TODO by calling the INVALL command. It is working on real
HW, so there is no sense in not doing this.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/gic-v3-its.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 3aa4edda10..a9c971a55f 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -236,6 +236,19 @@ static int its_send_cmd_inv(struct host_its *its,
     return its_send_command(its, cmd);
 }
=20
+static int its_send_cmd_invall(struct host_its *its,
+                               uint32_t collection_id)
+{
+    uint64_t cmd[4];
+
+    cmd[0] =3D GITS_CMD_INVALL;
+    cmd[1] =3D 0x00;
+    cmd[2] =3D collection_id;
+    cmd[3] =3D 0x00;
+
+    return its_send_command(its, cmd);
+}
+
 /* Set up the (1:1) collection mapping for the given host CPU. */
 int gicv3_its_setup_collection(unsigned int cpu)
 {
@@ -593,7 +606,9 @@ static int gicv3_its_map_host_events(struct host_its *i=
ts,
             return ret;
     }
=20
-    /* TODO: Consider using INVALL here. Didn't work on the model, though.=
 */
+    ret =3D its_send_cmd_invall(its, 0);
+    if ( ret )
+        return ret;
=20
     ret =3D its_send_cmd_sync(its, 0);
     if ( ret )
--=20
2.42.0

