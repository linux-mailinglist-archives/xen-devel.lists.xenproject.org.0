Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 547E47EE88F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 21:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634642.990112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3jPz-00087w-1L; Thu, 16 Nov 2023 20:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634642.990112; Thu, 16 Nov 2023 20:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3jPy-000858-UR; Thu, 16 Nov 2023 20:56:54 +0000
Received: by outflank-mailman (input) for mailman id 634642;
 Thu, 16 Nov 2023 20:56:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ww8j=G5=epam.com=prvs=56846b66b7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r3jPx-000852-MA
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 20:56:53 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9ddd38b-84c2-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 21:56:51 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AGKK3fn003880; Thu, 16 Nov 2023 20:56:49 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3udt18r23g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 20:56:49 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB9023.eurprd03.prod.outlook.com (2603:10a6:20b:5b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Thu, 16 Nov
 2023 20:56:45 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 20:56:45 +0000
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
X-Inumbo-ID: a9ddd38b-84c2-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNzWUlJrCWFBbN2IZrd2xMA9KP5IXGo0TRJF3vevAjqHF1Qanoj+UykmT3cmfHy2SLlJoxIHr+pzhMKv6FoQl89H7ChoWHkK4FL7lLWX/NNwLYpHCTGE3mssLIknwgnm4PmHq/OYXPVvfBQM4fs+KIP+cDb834jW4kFzTdiO4NXZq6v+aKZrnEkBYrx+x4WjM6d6owxE/xIjcTMsKtNqJs1sEEj+8/3jG9qWqjdYUQj5h2ImFMDKpkRcyLCQMxcoEfGWs4Or147jPqC2J0NnXy8DF76/8+NVea/Lh7T2cFg2JDtigKfXyvl2SnQxEgUjG4qLv07lOXURhSQRGjYMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1OYeMhZnLXGh18AKafUFDVBzu0cFg05+W2gr5+eCP8=;
 b=jRn8/YYC+XU4DfADnhXWWy7js0yRUwwLy6e8tiomlwb4QphS381aTRhUazuHC7QMl6oDhkBEtzkGx64+RmvxXGUM0GTgGCUcQNLSw5bhd7GGlIVh2713i5wUJcRqwoC2o+62xGLER5RS0Llvs8MmOdYuduU3OIQPV5nI4IJyrDo/LQlAZb/vSs8dgHSB5YIGKZgDYrQv5jV8qrCZFKkDpvfXNXrmE6CoIYu3J1MbMsEBuYU1P7qlbgGb7WWwqv3yrncOz8v0QKITJjuZzQohyIvAUJpRRIiXP/7g33JavRCxx9ktu3hiOFibbTMoDpcG7sfzue6MEnWEztr30cA7jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1OYeMhZnLXGh18AKafUFDVBzu0cFg05+W2gr5+eCP8=;
 b=IPzJBVwO+4i/IWcOlo5+nfa7FzB+NLY2Jtx7JIZCsKKa4ozj3SalGE1eozb7l0wny9eoGD8QrMKo/XnehmiyYZHbxu/iLrJe7BMz3f7TLUBz1HfQvpmTH4t1kuWSgPO7nuyK/MZNaKjC82bHdtqtTDYFl7cc9/xXXB/9zGUm2Qiaq59eFXcButittvQTD8OKPWiVTUekygSEhUpjuYgHHVH5J/XMezS44b5ySd044YhHiYVWIaHWrZsszQwW8IXSpW0i6U9qFfQOdArKtitjreplwSP57RhRjjtuobNSfE+XnIdft/XvLXpES6EOV+36Ml+85iNVRP+yCvEGQgjUsA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
        Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
        Anthony
 PERARD <anthony.perard@citrix.com>
Subject: [PATCH] xenstored: print domain id in traces
Thread-Topic: [PATCH] xenstored: print domain id in traces
Thread-Index: AQHaGM9oQiwd7S9EmE2h7a1Tz9yy3w==
Date: Thu, 16 Nov 2023 20:56:45 +0000
Message-ID: <20231116205613.3796068-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB9023:EE_
x-ms-office365-filtering-correlation-id: 5dd2b8db-d8e4-46a2-fa53-08dbe6e68b0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nohBJWcWHW6tuWTpjT76yUSSzeQVMoZ1v8l1OJ2vBxqsetCJyBZkEYr3AU3dDe9LerPUuk0z442nCSV8Y+NTCD6ms7H7+9w5KirE9XknssO3QCF6ri4+W9jZmiFx49RdV9y3+SHtBhrxOtT1esliikrTMr/N8nCRFkXnjOKr9otUH0FRTgxN+LELgINq1XkQEfie/JH2uP8E3cqDfSTXPJa/rbpZoKSekKldAtPKkj8wgqLshccf4Donaqy1xuE2ESLyRnvva8LvZqnTRz4V+4vqEPDsvTfcQaD9RG6uDR9T3Vj09vEA5Hp1jqzGn4G6WmhQ5HKu/0KMJUAM11XXTXS4ZbeYiZ5y1NK1ykVZPs7jXGO/rFnxgaPcXe+112ZhUDXriqro1u4jkUP42g1aeXvZiyIiAVIG2vI7auHzK4p6/iC9akkqRIlcyhhn80+LEv0LVnTQ0/gt3KkWiv7hyPPO+OC0UAN8i1XtBgVpk16syaZvCIbwF1su9CUWqoQlSnREKcfaD9WV0SFh3cUORPyqeRSSN3fd8Tfy1Kp8ahbe0gBlyX+7e8cT0VCVj5Gm4JJ5g33DPItcKU5adbD8L0fNGV7aGYjTTKo/74tsSnzWHjoWlg5fGu5KKv/dGtEV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(41300700001)(36756003)(5660300002)(86362001)(4744005)(2906002)(38070700009)(83380400001)(122000001)(71200400001)(6486002)(478600001)(6512007)(26005)(1076003)(2616005)(6506007)(55236004)(91956017)(38100700002)(8676002)(4326008)(8936002)(66556008)(66476007)(66446008)(66946007)(64756008)(54906003)(76116006)(6916009)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?tgXN0YF+DbfxncL+lqnC+n3LvegabGuyO8RKajF4SZ9uMQRw8D/Hbwo14+?=
 =?iso-8859-1?Q?v9GdG4DMdfXexnO9OEjyydKEOSvhheXS8Z7PDhS39JiNohtOYdak1HRKja?=
 =?iso-8859-1?Q?SjCANiSCOk096AP0NCa30H5JZTqaHTcnzc84BfDZOwV31AbTN87AXnEKBw?=
 =?iso-8859-1?Q?jeomlqhnGir4iOf4VOWXnzJ5EOIF2ydSg8bqgakdTkEuigcEh9I+qWmomo?=
 =?iso-8859-1?Q?6WrBE5L7gTFaZL3dHi4wH9kUqDMGbuAFMES0/o8CnaFsNyJ58i+xz2j6Kn?=
 =?iso-8859-1?Q?bt2bimbhKIKhCXpjN4dmz94FYNcVeQnoi/N9x85Y9+NyX1ywYKXBIhz8nm?=
 =?iso-8859-1?Q?gbUHxBGU+XVtYVWujSCGSyvLlZnuqNhMMrq02sy39PIWUl4aJLRwCU3GDt?=
 =?iso-8859-1?Q?oJN2vNmY7DaX8EAd4ZRt7U7tQ2RDAQiPHAFucK+DOJEu+eL1lnJxDmIan/?=
 =?iso-8859-1?Q?MfQyTXxixkpt92J8WHmykvSVDDqppNlis6IR6G87LsM5Fxfpt1R3SpFPB6?=
 =?iso-8859-1?Q?vK4NjIH11MIA+p3iwvHCBc7L0FX8AsW1qeStO6nmBRTiyAwiqhcGqmGTDG?=
 =?iso-8859-1?Q?b9ilkmWlmzau0qeRlbpPJiXUBNt+0uI9GQzXJBsIHF4Fsp3xh6SURieAGW?=
 =?iso-8859-1?Q?VU4fqJ6//nV1nrx+IPpxr/nqIf6C8lndnZby/CMMrv2+xzjy3H4L52eo/W?=
 =?iso-8859-1?Q?UvRiD9v9+l+S04cf2WjmDpEdSmBoDGkUlUhGMb3JJYQO5cSQiffhqDrmOb?=
 =?iso-8859-1?Q?AdNX4Ne5xC4QbP6Nr1yvWznpHgkHuEKilzMZYGuF8hpoYEMLE0LY9OElUR?=
 =?iso-8859-1?Q?dxkI+opMXqxpIQn0uazlDRZntR9N3/zQYRD9VqX3TOUKq2Iz31eTgFegJ9?=
 =?iso-8859-1?Q?D6KR09JpTorfDDysdnJrIHcZy9qJrpI4WiNv7lAUQNqlYgz/NE7B3Pckir?=
 =?iso-8859-1?Q?nuZMKsm+2CRGOu67nrSmgtNsJHaBRoDSH7PXtM4JrITaG6IS0jai8AEDzN?=
 =?iso-8859-1?Q?HeEfWgJousBk9GfQFhVqo3zTTuFIuDHTC/Rlo8VaH7d3T/aBHP5/OLFOdm?=
 =?iso-8859-1?Q?Llc4OxHydf4qgeprGPUqkx0zHc+m+kAvTNLM9RXRMbewQHAfRssWvPkZ9E?=
 =?iso-8859-1?Q?938qUEuSEsujFOfNwJTnLGdShTGyZICWRE0IRJUKU0ZdICAxet6/buE3Rr?=
 =?iso-8859-1?Q?dQ6j4jRy0m8R8Nn3fDQXe7rEvDUoqK6kXWEp/VPaMmiN+N7ELUz0x42AC8?=
 =?iso-8859-1?Q?iUTNnIs22DlZ5ukrTAOFCBb0Z1zyha1zJDR7hWu+yI2Ya4La3E890QFton?=
 =?iso-8859-1?Q?SdT/KpSik5TtCsrLAAdGePwAcSEmtAAwR9yrOjqYD7WEckLJxYKScxelMk?=
 =?iso-8859-1?Q?5004tMojJFrVmnE7a7/uhX/8cF7Kc/UGg9PWKdkg1UrYhsgv5zKy0sGO8y?=
 =?iso-8859-1?Q?nXAjbgFBgcNdO03lq5e+EhwVOs1SdwM8w6oPO02nlG8noB+Rm0FWEhjOlE?=
 =?iso-8859-1?Q?BvKzsvWH5vMnS/+3pmhijSK3tk6bBR7IpWqQmPDPxAqs4A3a4Ing2x7nQn?=
 =?iso-8859-1?Q?0Nu4oi9v8ak5zJoY6ZeHPD+KqCXr9OqpycjIAm6mD/wQgMPv/t4sNWBuTR?=
 =?iso-8859-1?Q?H3Oq5uR7hv+HGHLchNj2aaWnWsMJGzB5dj7DyHaybqvVU05wHBvHDXkA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd2b8db-d8e4-46a2-fa53-08dbe6e68b0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 20:56:45.2634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1/3oIvhJ9CeksnhYKpKzzeKzMLyGdCM93j0P2t9xt4rXALEhkZTOefxZN9LmcLXPgaf7TO0NqALGT0RFiQAmfe6zYj4sJRFCdoL53A66Uzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9023
X-Proofpoint-GUID: KCraIG4wQdu_ek7cWh2eHetatN5m2s1R
X-Proofpoint-ORIG-GUID: KCraIG4wQdu_ek7cWh2eHetatN5m2s1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_22,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1011 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=895 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160162

It is very helpful to see domain id why analyzing xenstored
traces. Especially when you are trying to understand which exactly
domain performs an action.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 tools/xenstored/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index edd07711db..311764eb0c 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -135,8 +135,8 @@ static void trace_io(const struct connection *conn,
 	now =3D time(NULL);
 	tm =3D localtime(&now);
=20
-	trace("io: %s %p %04d%02d%02d %02d:%02d:%02d %s (",
-	      out ? "OUT" : "IN", conn,
+	trace("io: %s %p (d%d) %04d%02d%02d %02d:%02d:%02d %s (",
+	      out ? "OUT" : "IN", conn, conn->id,
 	      tm->tm_year + 1900, tm->tm_mon + 1,
 	      tm->tm_mday, tm->tm_hour, tm->tm_min, tm->tm_sec,
 	      sockmsg_string(data->hdr.msg.type));
--=20
2.42.0

