Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71924AE040
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268492.462342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmp-0006Iz-0C; Tue, 08 Feb 2022 18:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268492.462342; Tue, 08 Feb 2022 18:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmo-0006B9-QK; Tue, 08 Feb 2022 18:00:18 +0000
Received: by outflank-mailman (input) for mailman id 268492;
 Tue, 08 Feb 2022 18:00:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsJg=SX=epam.com=prvs=40387f30b1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nHUmn-00068L-ED
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:00:17 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6c000f5-8908-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 19:00:14 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218EgrT3015757;
 Tue, 8 Feb 2022 18:00:13 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3t5xrs6q-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 18:00:12 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VE1PR03MB5613.eurprd03.prod.outlook.com (2603:10a6:803:12a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 18:00:07 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 18:00:07 +0000
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
X-Inumbo-ID: f6c000f5-8908-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jK2NgxUrslRzWeTpvLeTDGIt5K8UoM/KgoaY35I8p6o4UQlvj1aZ2iKi4bJGbCSRUmwJ3oaHzccn8Lr5GIW+YxcjL68rFVAQ4XwERbQhJcmLmM2jhbgaHqscKLHDdO2MyGu/KjvECTPwqrkIHsOXs6efvi5MqtXHkI2zYDtAMt2Ts0dVAbMA4SmKGwpbmIqCDvAX4ftUsqN5T6BVcGKdd3GOXcOjZAlww+Mw9nPRgVnp8Z4BmM3dZ/5Ho+CAEihm2OxWt6/myc+N8ks103SlvzzVn8G2ZiF6jQo1mswzdtdkQJx6yth2UQbuLe9V07t4y0NE0pSvUcLfaGAdfcnnVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+Pd6wDqIcFv+WQby17OvQO3c7K+c3WVoYLWvGL3Img=;
 b=OaIqooaCQ48+ZcNhTZy3IOTwfIbDqjVskgGKEOAEh6F5zg+WvHi4932WuJDLOuUpsWo9V/ccBodoy6pT7hiIYcVB5YnFZdrI+CPIM+6FO7cIodMZ6ecB50/RqZN2X3geuyy1aIEXxjvJLKo4qnK+eS7Iry3oMt/LD40nLVqDC7ValgN2o5rieTR4IO0tdLyKUgEP2f3Qe4D/37Ea2WHqANz0Kz7c8iVHG6durJ8rzoP9lMjE2BXpzo9b6NHkBSjL3c3Z8PynXqQ9vHc90A2YI7+3BK5HCjdb5TrQ+M8wNNSXTqUAAp/1AsvdcPWkhB3elnr+32TANfllBvP0wgYEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+Pd6wDqIcFv+WQby17OvQO3c7K+c3WVoYLWvGL3Img=;
 b=NKRI602rr+89pwZBu1o2KxvfP8dZTc3kYH6jB0oXp278uzs677VAHqCv6/SCR772ky+ak+NZ8CQv7jSgErHpMbrSZvWqR7L9Jg+/C5GuVsg9Rl3m+OfF2MxzW87CoMqwEXNgcnh6m6JbTwVOXU5+QCk8crXq3m3yNYdGYsFPUZRx3fmfLGu00FHFKXP7/le2xUK56rrwxtNVtMAWRyuPL0BBF2C5xCWJHMls1KRL3zFmJt/xz73TcubRkUqivD3od3NxBsIofFr52VaCMtJQaUwRFzLdqnG6BpkyXQ8nXlc/28TuPpnMHLsdi7yRWr3PiMjOBuBl+7JLr4e00MbREg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: [RFC v2 2/8] libs: libxenhypfs - handle blob properties
Thread-Topic: [RFC v2 2/8] libs: libxenhypfs - handle blob properties
Thread-Index: AQHYHRW0gTNwRxUA1k2bknae2DocAw==
Date: Tue, 8 Feb 2022 18:00:07 +0000
Message-ID: 
 <069eb801bc999ea85c529fa5033121e96b9df06f.1644341635.git.oleksii_moisieiev@epam.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1644341635.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5209da9-18ed-42a0-e3ca-08d9eb2cd786
x-ms-traffictypediagnostic: VE1PR03MB5613:EE_
x-microsoft-antispam-prvs: 
 <VE1PR03MB56131C6D949B57ABFDCFB743E32D9@VE1PR03MB5613.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 P7TW0UFCVr6XYzH45vY4lkwUMvmuQkNRNnz/bpFB9QYbMTMHuQ7wHnjDEpNF49tF+0YTlP/aKQjYK6W+JjM+Y+aR3bmQ2yY2GWhxAdWWihqmL0mANMKO6zaDCnHpkUNzd4SiZ4e0Y4c7Bmrr42uGU31oNU6VCPsoL5VGez00bUaRxgfofr3tG7JbRgfZaLYqhhqp6it6aSUnGu1DdwgRX0N0j0TOsM+uD+S3pD0mbt7xPc9C56LoerOZgz+vNYlt0ymwgd3zdYPdSb8S9q6wQ/Vc37QnJpD29UILf1NkQ0JIyitWc/tsHq9kkWGV0E3c/gMPwkdlktOxsFSrUCjLssZPkpJuWYEoI6XPwULiE8ZeM1Y8YeeQTTNG3iIWSHAaclUqHKK1z2bmKBE62RQALisvn+16ALWOKybAfa7nX/92LjPnMksNA1GpAzo0PbXWYNgB9SkfkSg1fHkl3b8C6m7xKSK9mJUpzaaDs5YRLMNwgoS9vyqcBijFpS+oPjwtjv/WRmBnRmFkMzrNG8xdk29qryFvYpXSAVQzmlcWizGeknQablPHi4bAn82LypzJg/bNMRy/hvsX0GUDgkkbVmGyuTgYy4tTWKX6dkEOnTMpLAvzMxKke3IQacl7H3NU+8NAIJVLOf2JBaPNrQcOZyEIzNn8ffOw1GLzUC4HGSeqC6hinp2LrnzYz/h4Hi2s0zpNq4e+0UsuiRI1r7/33A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(71200400001)(6486002)(508600001)(66476007)(64756008)(86362001)(66556008)(316002)(122000001)(6916009)(6506007)(2616005)(5660300002)(6512007)(4326008)(83380400001)(54906003)(4744005)(2906002)(26005)(186003)(8676002)(76116006)(38100700002)(66446008)(66946007)(8936002)(36756003)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?LvvhPleD4XcuZ6FqzOy/tU6O3SeYh08wd7gkaw0UYP7HST1DluQeMBwcsd?=
 =?iso-8859-1?Q?VK5XIRVPAojBQo5fJuMzddIDf2li3Y7dN9nJlFuxzPOKZvHlVs5odutLMX?=
 =?iso-8859-1?Q?VAhbIodQwgOh3/iIbCQ4fGYwS41mhdmz2gk1C3NGs3Vr5JstgP3jylxHKD?=
 =?iso-8859-1?Q?1HPNV2eM2lhdV5b43irrof4BQWRcy82U6Ry4MGPuLRCSIFSEfRsRwi2cRB?=
 =?iso-8859-1?Q?qgI9cNNckXWVOPLrlGG2Et5wdNmNHR3h7OjQQ2y5IEAavHQ5vJBVRb+MeR?=
 =?iso-8859-1?Q?CpPbFEHbVgmRy61pzLFjLOtGCnGkyrFKJMIzDLVvKbU8v0RxhEpzcTNAC+?=
 =?iso-8859-1?Q?s4SSL1SiUSdQQ6sljXiEuDvLmjmKuImjxtflTOkgS1H8W4rCVc184ysvJ3?=
 =?iso-8859-1?Q?pfPISH1tEwoY3T1BhOWBseaffH+4vuAiIM1y02IOEXsCRkpueqvUXAwWkR?=
 =?iso-8859-1?Q?AR7fvrwgaCoAfdI4RBkEJUZP5VAsj25kjgneEkAzceebL77aEjLYk8u+33?=
 =?iso-8859-1?Q?qGrGAO+8cTgavvo7/WoIOlo/44ZllNnl6RlzjIe58mCb3cKoZukgMbSxPN?=
 =?iso-8859-1?Q?MKp2VbF3GiUd0BOdbm9146fm68/78zzq5IoX87pw/9EDqz8NY2XkVsCG2J?=
 =?iso-8859-1?Q?pKn5oD3w4e/+yg/mhd+V7c3lMf4NDySkLgIlxc/YLVc2uyG8TdQ4b3tdsi?=
 =?iso-8859-1?Q?fuLAIBYI4DCUOq+RrQQLOkP/0LJZYU3iOW0YMutU04rFZzfgNUsh1ZSQVO?=
 =?iso-8859-1?Q?61/JCrGPpkXD9Re9upLGgW2sNHsf97HiOs+N8f0V8AVQjun06cJdTwnLwt?=
 =?iso-8859-1?Q?yn1H+jnPiED4hgGwbc1XQgYuVNWIn73BmS0E4jx1CtdcaVEBgVvU3a6fVH?=
 =?iso-8859-1?Q?u6Xlsz/EYEtZKP18EMr982kmwWqSDluCAjZVnSBGGeJRisNpJNdKwVZCtm?=
 =?iso-8859-1?Q?EssnlOormJVhdVQTfaVS5sAU8zILb9tCgBYEgT8Wxp5N63+NsIehBP49Ab?=
 =?iso-8859-1?Q?Q4HXNQ8ea6zuR4/BzrL7kZyo7HhOamxa+QVlVsv19TIvbWn7eHUjKgTc7m?=
 =?iso-8859-1?Q?TGoC8vSQIRWFfDvxkhrPt1qnFMTp7UMcPCbah89JzeYyLFahHTsvvcFJsR?=
 =?iso-8859-1?Q?WHHi0xsbCk48O+vvAm/jj9L7saUa9XA+38Pidtx+c1/r0VIROOwL/YAlqL?=
 =?iso-8859-1?Q?SFFhWqU8jx6CUwKx2Ho68Ba5XSWXa8x8LqDAcvVJHop/85yX+huYUJXaLb?=
 =?iso-8859-1?Q?xs7vwTlv6FKnaYvUx2iRt0j5ZCJMCQ2+175UM4fNlsINjPvxPCc0K9FCiS?=
 =?iso-8859-1?Q?qUQ3Ac9rmqTWExg8yAKRyy778GuLcBtVHWi8wddHhgvZrOY7ZdhAIJzdW5?=
 =?iso-8859-1?Q?m1nwCcEMhJMDirU6F8ls1rmEXqhhZPRwsEQgcqM5J4yTgk42HGZH5eQ5zn?=
 =?iso-8859-1?Q?gBoyrXTjPek+d4Uu87JgK03IcziJA0ZhkE06CTK9/Zc9RBNAn43YItIX0C?=
 =?iso-8859-1?Q?pxyrn4iDVCo4loio7LuZWSVQE9l56GtO/t5d36uSV09L3ro3L2zIE3CwGx?=
 =?iso-8859-1?Q?4jjlRPCMko/HFzbzlpm4Nz1qCeVYUC8lf88wtjp17rxFftS1IYx9UJ71fs?=
 =?iso-8859-1?Q?DPtOhVcyCeiMOwiy5Jxe2fADV1Kf0+9RycrOsN0MNYft3T9zw/1YXj7tT+?=
 =?iso-8859-1?Q?mm+YHXBela8wqB1vFXTfNABWcCfozrfij4r+cfkAo+/3LVkxn1o747nKS9?=
 =?iso-8859-1?Q?VqBhyGnDXMPHQ6HBzhE7ynnLg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5209da9-18ed-42a0-e3ca-08d9eb2cd786
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 18:00:07.5727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K+t9JbjMlj32GLMoocgkFrLadeNOO/AALJ2g91HJJm7hjH8uS8hwxHO9SUanaIcx2dOn1qmdjaJuzSTy23qeleYPOfAjDSHv0rU+fUQK/Mk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5613
X-Proofpoint-GUID: Yrdh4-iaXSekn28dL7blLXf5-oqSC9QH
X-Proofpoint-ORIG-GUID: Yrdh4-iaXSekn28dL7blLXf5-oqSC9QH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=740 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202080106

libxenhypfs will return blob properties as is. This output can be used
to retrieve information from the hypfs. Caller is responsible for
parsing property value.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 tools/libs/hypfs/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/libs/hypfs/core.c b/tools/libs/hypfs/core.c
index 52b30db8d7..d09bba7d8c 100644
--- a/tools/libs/hypfs/core.c
+++ b/tools/libs/hypfs/core.c
@@ -307,8 +307,6 @@ char *xenhypfs_read(xenhypfs_handle *fshdl, const char =
*path)
         errno =3D EISDIR;
         break;
     case xenhypfs_type_blob:
-        errno =3D EDOM;
-        break;
     case xenhypfs_type_string:
         ret_buf =3D buf;
         buf =3D NULL;
--=20
2.27.0

