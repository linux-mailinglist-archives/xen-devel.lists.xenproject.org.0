Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668B87C7951
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616071.957845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s7-0002sX-83; Thu, 12 Oct 2023 22:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616071.957845; Thu, 12 Oct 2023 22:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s7-0002p1-1w; Thu, 12 Oct 2023 22:09:35 +0000
Received: by outflank-mailman (input) for mailman id 616071;
 Thu, 12 Oct 2023 22:09:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3s5-00016v-1g
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:33 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04e62cb8-694c-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 00:09:32 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CKqkS7008330; Thu, 12 Oct 2023 22:09:28 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpr7cr8e6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:27 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6376.eurprd03.prod.outlook.com (2603:10a6:10:193::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 22:09:18 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:18 +0000
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
X-Inumbo-ID: 04e62cb8-694c-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClqvpfGUzGJTS1zkloI+Jb7/A4CoasVB3w78j8m/J0Rqx8+QaBbaz8exPkbifdGO0mPWTuIoPO3bQh/cfBKelGOkPP+ihLYWNYwE4f4F8fFp3gSQQEvEXSD0G4qKrbthSqU92T8Vq7SJLx1+7mXmga3d42Lce9LxGtdhQPPA30/04GyMVQQnbdoIt8vDc/2zdLIm4Hnf85IvTYbzymp7+xmhY1K4KaASc4u2YIFDH84kypeNIqG/6FxdWNDiEpDBCcFWdZ7M/b1reJhzNmrXz69iJivYT5y47ZXCFViYW1+c0H8xRv9dq/E3ZeHDx2jyA4ucfC3UU1Y7htqwjlCgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqFu7ENzCaUUEb1owleNXNDVOW0gyYfuYWQAj6HYjqM=;
 b=GLp+uLHgBlPVBealxURibDhEpcZ0o0ds4GV/5g9ei7AbjncGIlbcE8iN8+fleSyrtkt29S8q3NuWB0Fp5njvwRZhf6Bf4M8KTHyIWtk2OeGylpfAbCKwOMZzs89+Q8qWcujFRe3GqxJJwEw6wS/jsSvRkqyVGvF8YKpSnQdjjxupu5YW3/wdsNstqlms+i/Am0LzZW+SfrkG9axcTsXHdfl6iX3odhT3nyYm9Nroe5g2Bj4Uq1AIn4m1XqZCbTwjWYdP/BMtGr1e4bAcAgAyLD72EiaY4/ZAIPXiNtibH4lJB6avE8StML7wad9dq0u13/uLCZboD8WNYd2M99qP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqFu7ENzCaUUEb1owleNXNDVOW0gyYfuYWQAj6HYjqM=;
 b=j0+l/wT7XYT80yt3rK4SdeDSOW6xXvXJnTsyg5TibE5dy4EGmoLQymitLjLLpwgax2oxkbbS6dthMOEk3MP/zIrC5xE9tUj2XwtJmXVFFGCe/hCuTPFD/5SIE7CcPjpEaMfk2CanHxAptCKntxx6gW+ggsAZoKVXuMwkDzIHBKPdBCRH6MWbKiydC2erpm2sSpR9fPomsYYGb7AQ8JCg+yAffIi70/4dXMu5xgM6RMGDOFIbRzXBU/TugW7JS+B5yw9lcwf3vUWxX6aYIfGJXXJlMtRf+YHq9UlDlWrIBpAGYAEEV4fxiuQKDGXlfOX6ERb6wkE8pONf2ny/hyG9sw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v10 09/17] rangeset: add rangeset_empty() function
Thread-Topic: [PATCH v10 09/17] rangeset: add rangeset_empty() function
Thread-Index: AQHZ/Vi+5V9BMbiD1kqnOLtHs/D1yw==
Date: Thu, 12 Oct 2023 22:09:17 +0000
Message-ID: <20231012220854.2736994-10-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6376:EE_
x-ms-office365-filtering-correlation-id: ad3e8fd7-1644-4ae1-1401-08dbcb6fe147
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dafA2DWolEtBzNinphf7l40wykR6Ps52HNA5GTSlmc6zFSFGe+LBt4P5KWYJANmEHnYJ8R40OuIb5mdfDlL+JeDhBqt62y3hfXOd2vM/nOwqzildndOhS7/sSIFdORR2zp74mIMmgoHZyBPGZG/Y/u0UGDdEKvwrZgydhi6IbPHV6vmCw3aY+FpXpUlO8RVdOjloBjK8EJVLja1NaoL3vDscvch6jfNEUSZV5Kw4Y8ZtVyvxdEMQBgadi1vuBkiyVUFAcMcSFiMk+0Rieitn4JneP2hF3XQnHRVyk6WpTge8Itjlsb0SST5SckXjgxcCi/XCs1Sz+Amv+Ld7tH9iOgDQTp6LHrOFv97gGm+p6VUpEzgqiG5ghsfXq2sxit5Zh7dmN44xaXVJP8LXbRKSRZ5oHXPI91o4arAI76b6krW2SWG8ZxhAqCUELh4zwKnsZRlSRyq1FDdnk9JFd7fYP9vdjGrwpAXaNqYF4xQrphQMP7Tsx+iJppa98MwhIaY7xA2NYNFlAaN56aNlzpVIZ99pOdJJfMUKbnRoMid4UFa8v5qAT2ldn6q5S/Nsqpol3RZctX6lFf0DGeM7NsL3/jf27ggrgvn8XV9kNMxffV/3af9tiICoSGiLg3MxZcM0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2616005)(71200400001)(26005)(6512007)(6506007)(55236004)(36756003)(86362001)(38100700002)(38070700005)(122000001)(1076003)(83380400001)(91956017)(41300700001)(64756008)(316002)(76116006)(54906003)(66946007)(66446008)(6916009)(66556008)(66476007)(2906002)(8936002)(5660300002)(8676002)(4326008)(6486002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?FNguRjMLrctWsis3oh5k6rMLJ+BJ+qUFZpz8AYTALTJvUl8WsAHeSEXPjk?=
 =?iso-8859-1?Q?qO/XC02p13/K7kbyltyFX4efZE2ustXY6WFeLudHHnF6pwbGUWgaOnqqjP?=
 =?iso-8859-1?Q?n5C8MbEoeo8jZzHwQ0ol5XOhvWw075XOtOwOSL+F5p1Dd1yXbXj1CBKu2b?=
 =?iso-8859-1?Q?7y9yF19ekbcPUKplFnFdSM/yVuOpYqLdjUcsrkBAs2PXMIJLrNdK7NwZN3?=
 =?iso-8859-1?Q?P3oWv13lwF9HnYKZ1H3zxeRQnBee0QaiHuICtJDS+zyDyX0ag88r2qj490?=
 =?iso-8859-1?Q?IKgx+bOMyWbVQglpEbMBQ9j9iqzVW+2TbTFy4FrUlg5j5THUkxUSGZVze+?=
 =?iso-8859-1?Q?IFDfkFqggyOZBWbi7VwPXl+ruG3OWr4ve5vLE4amN/w+Et+LNUX0FZkB+3?=
 =?iso-8859-1?Q?yPPJ+wgo6B//yTcRWK+kQTSV4UQb7+6umaa3QuoA5wK2WNPkgp1Lo/uD3C?=
 =?iso-8859-1?Q?Q7wi/PocN4PKBpMf5LN5oilUWHtW9WWTDHq7zFsKx5gmxPTccJS3ygffQI?=
 =?iso-8859-1?Q?VNRhczL8OCa6FKv0G02wI+UrUGvhBo56VeI9BU2Sp2ddXRngnBMUuvkJnj?=
 =?iso-8859-1?Q?NpkDT/ubSo1ELUnNPTuu9bPLwCiVsX7cIZzotwcSdW+8M2UN7XNxhIxMBZ?=
 =?iso-8859-1?Q?E1ITjgBrLqicNrqpq9dbfkb9GhjvRXkjJ4FJlnWZDD/+mtjUJR5QxX2ft3?=
 =?iso-8859-1?Q?G2Xuy9eRAVU86CdY83c5JZ+5m4e2XLs0Q+Sq6y6qsHDNTG+1yGIM8Ko836?=
 =?iso-8859-1?Q?/2YU4JnaBdXfVS1E7waxcxNdIxY+SD9wXm4FzPdKqFV4NbSTAt00YmcNEQ?=
 =?iso-8859-1?Q?h7d6EqrgegqDcxptIgtmYpL1KVLDGz8U0mRnIfIzwSKMYvrKcwB1GzODyP?=
 =?iso-8859-1?Q?O6b/CCPfRMMyG60gGEdomX0UbIeZUjqcAOEKI0Qmz8NXcORAG2DJb5CDT4?=
 =?iso-8859-1?Q?EnLf+PqIcRiuz8LU4w7F9WHUPOz60nFdllTcuc5pDTagnrBK/TEBbFl0Us?=
 =?iso-8859-1?Q?UXsmIm/+1q+ngawcDyiU4jRQxH2h9E0mMzzFlb87LAVy9Dbywu13slHPJd?=
 =?iso-8859-1?Q?S7Qt6wnmPb5aoP+iPeIYKpfx32EQZgD6GHkgh6voXeZc7+1WJ7q9U1x1ic?=
 =?iso-8859-1?Q?kpAe/DlD6vB87yNOsEUogUSTs2jbd+s/3b89tR9olbXNgKZsGpeEGZhilZ?=
 =?iso-8859-1?Q?WMEkNKXTny6FSSsXaztSKFrXi88IWt1IPznDN/6s+c/r+iS4ZN20EtP/xm?=
 =?iso-8859-1?Q?n9ZYhOT63M+WPGO8a5uJySNie9ZCm4Az7m3Qz0IPbwCuSk4Bqf/svF0vWW?=
 =?iso-8859-1?Q?z36nY6Xrdw44NNjQN16MSELuB2RFqxcYXjp4kh0UZq4/Y3K1XjpLmNgRBv?=
 =?iso-8859-1?Q?npNi+dveWZ1H6ERaqQPHRP5osgR407ka5MI+1HU7Np+quNpBTSVjYBrUwf?=
 =?iso-8859-1?Q?KkDtRhO6Vza88hbDIzzcdRjuNum/SP68anrFHPD1OgDoVzc+TwPXnTlMMA?=
 =?iso-8859-1?Q?oR9xr66sULtzFA11+kmLuwbU34gaMMaKUyS/MY/YD6NpCoM2/ltiHNWiqN?=
 =?iso-8859-1?Q?+xMUr6CkoC0+qKEai4vdU08HSxiV42Az/CqeYh7ia0ZDH4DejiEZVwUKe6?=
 =?iso-8859-1?Q?Zf+3eATLmLEzcNIOmL7cArsDjXFvkdHB5m3sAnpqzV1cwW5Zn0UqgtRA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3e8fd7-1644-4ae1-1401-08dbcb6fe147
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:17.1773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TKGb42ebSqpbVCV3r2d3fNGjTY4qbRXJnXZTsDcsS7TK+nGV9rPaLlGYC552k9zmUHkhv3h51USFI+pJnzlIC8DDqRmhzkluAVmFAikBCTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6376
X-Proofpoint-GUID: -Z955gI3G8DxrKjvTmp74BgdfJeP3YW_
X-Proofpoint-ORIG-GUID: -Z955gI3G8DxrKjvTmp74BgdfJeP3YW_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=705
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120186

This function can be used when user wants to remove all rangeset
entries but do not want to destroy rangeset itself.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes in v10:

 - New in v10. The function is used in "vpci/header: handle p2m range sets =
per BAR"
---
 xen/common/rangeset.c      | 9 +++++++--
 xen/include/xen/rangeset.h | 3 ++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 35c3420885..420275669e 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -448,8 +448,7 @@ struct rangeset *rangeset_new(
     return r;
 }
=20
-void rangeset_destroy(
-    struct rangeset *r)
+void rangeset_empty(struct rangeset *r)
 {
     struct range *x;
=20
@@ -465,6 +464,12 @@ void rangeset_destroy(
=20
     while ( (x =3D first_range(r)) !=3D NULL )
         destroy_range(r, x);
+}
+
+void rangeset_destroy(
+    struct rangeset *r)
+{
+    rangeset_empty(r);
=20
     xfree(r);
 }
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index f7c69394d6..5eded7ffc5 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -56,7 +56,7 @@ void rangeset_limit(
 bool_t __must_check rangeset_is_empty(
     const struct rangeset *r);
=20
-/* Add/claim/remove/query a numeric range. */
+/* Add/claim/remove/query/empty a numeric range. */
 int __must_check rangeset_add_range(
     struct rangeset *r, unsigned long s, unsigned long e);
 int __must_check rangeset_claim_range(struct rangeset *r, unsigned long si=
ze,
@@ -70,6 +70,7 @@ bool_t __must_check rangeset_overlaps_range(
 int rangeset_report_ranges(
     struct rangeset *r, unsigned long s, unsigned long e,
     int (*cb)(unsigned long s, unsigned long e, void *), void *ctxt);
+void rangeset_empty(struct rangeset *r);
=20
 /*
  * Note that the consume function can return an error value apart from
--=20
2.42.0

