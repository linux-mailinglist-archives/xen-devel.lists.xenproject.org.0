Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778CA7E8481
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 21:43:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630798.983942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1YKy-0006Lx-KH; Fri, 10 Nov 2023 20:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630798.983942; Fri, 10 Nov 2023 20:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1YKy-0006Hi-GK; Fri, 10 Nov 2023 20:42:44 +0000
Received: by outflank-mailman (input) for mailman id 630798;
 Fri, 10 Nov 2023 20:42:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vE0U=GX=epam.com=prvs=56783987ff=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r1YKw-0004yp-OO
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 20:42:42 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0766972-8009-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 21:42:40 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AAKIjQu010025; Fri, 10 Nov 2023 20:42:28 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9kkysufj-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 20:42:27 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DB3PR0302MB8991.eurprd03.prod.outlook.com (2603:10a6:10:437::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 20:42:23 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%5]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 20:42:23 +0000
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
X-Inumbo-ID: b0766972-8009-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKcz7x8xXlO4kWqIz9otbJNVc4wI2HkDTsHnmnw6opnLvqoi8bI4eDGEbtGWi6cUSTAYt4lG8IssbW3zJWvx/K+mgjlw5ePCKioTtMJ8BESpH/FVj2oTK+4jffg/S2IY0y/Cwfuzn0MpU2h6ngtRoQMZjoGXw0FXAklqpCqSpS6eeu4dmTONjlflvNgyJGRBTE0SIVa+xevGAmv8q6Bpoo0E7uTYFhe4jyH9ILcOm3ir/uM8SqVhjXg0FZLhzesAfTQOC2P9PMVz1eywUipCCNkc95SDyLPybgyIMgaAhvTZ1ac4bO6mMKKcVBR0RFajA3W29vzN1RDsCnnLheQLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SABzLS8E3EK1EwtQXVPOLYVkhNHLc3HH77gb89y98Ks=;
 b=BlTJ+vasQ1Cj1ZYyJZRxH+ZDDoJlAHrEhiij7cvT6BELs0wC7JiqRsCXRaUc0rqkRM7KTh4dHlCICtjdPNF4A6sLNECZUFJ1gBpZqdJSaZXRig2/NDnMHy9gEJS0qaqCWgQ59XVphNwAxmF/42tFD0uS0mcP1eua7O2x9aAifvXunZjhBMGpa0XGq6rAY4V9MVu8GxQken11HLpUCezidzGlZan6elhXN/isvtpNXDyMTbBypdJwqo3jErdxyu9iVfTAvzKBZnqqEouevVdzAzSwOyJEqcxNZ8GCNQxBz+3dwzjvXT8k6fkycx9eEDaGYtEzkwD02eff9F4s//B0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SABzLS8E3EK1EwtQXVPOLYVkhNHLc3HH77gb89y98Ks=;
 b=oP4WRw5c4LEQBuvGKyNQUcvT1gNXC+ibxESZQpHwy6KhVw6Iuc3QHlakjetZRJ8vDVhl+y3lVow5ndYTx6WXMjjutiR6qaRik5g9zEZbOd5zw+jCzCqN4Z21XnxjowCpkCgTsCU3K3XDp4BrQAzS1LCb9HcymhcbpOqPvhd08zRbbPosLLjNU/45cjy9teetxChSwt9eCoDsCl3FjzuxHBWm3IBoFVSnXzhKZv54du2dsD7z0vVBg1nrBYjR3DNiYKNzNgPEWAiUZcRS5KemL/FB5obhC/oR+WdAvhS20U70AeXxKvFDEYcUp0S8K4ZGgevqCZWb2EZR/A2NxWrn6w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        David Woodhouse
	<dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
        "Michael S. Tsirkin"
	<mst@redhat.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Paolo
 Bonzini <pbonzini@redhat.com>,
        Richard Henderson
	<richard.henderson@linaro.org>,
        Eduardo Habkost <eduardo@habkost.net>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard
	<anthony.perard@citrix.com>,
        "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v1 3/7] xen: xenstore: add possibility to preserve owner
Thread-Topic: [PATCH v1 3/7] xen: xenstore: add possibility to preserve owner
Thread-Index: AQHaFBZoS99E/RofVU6d/7dbafCRig==
Date: Fri, 10 Nov 2023 20:42:22 +0000
Message-ID: <20231110204207.2927514-4-volodymyr_babchuk@epam.com>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB3PR0302MB8991:EE_
x-ms-office365-filtering-correlation-id: 77270297-91eb-4348-0324-08dbe22d8ae6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +a2Yghv5ArmvyyJbAO9TzYFQtRBgH77ysh6SAyw5lEDcY5veCuiPVCt6lzXvYOdLs2VxvN/bbFAGJgvoCRe+G26pUFvqfCOFZN8ZWrARa7EqQk8hjPD+Nhw4yJDePcH/nZYIHmxtRG+QE0zFnP8u8MUXAn82cu3uT8E1rCLMBblYp6JLK85J8g/FhLLJGYYZmP4u82bCQnFiXe/i3ZT/45mrHO+d24X/gjCgo0jdf3NVXkEZ6/VLGRfspcgmL2cMHpbpD45o1lDT3M3BJ4e07FzoYcZWYWD98sdXE8T6N4ECRnU+sNF/RSGH/wo+zpjWoxEIzRjA/jqkdzKDx32+szAe5yCgpyizLSb0oJnx77XprSLLVlzNcd0y5+WCD9Oo6spOes+ObHA7F57VLmP8Y0YceZyVw8j+UTF3f6l2n9LxV8I3QYP3HVrufCTOEkKYYhDE3YmUGpuY6/sef+UKkVClKMZoaXdydX2LzbzKctpmmDhswaBjesvLWbLM4J+pUw21aZJNjh3mBkviL9kUnHrLjnF5thYmirW7Trxc+PRaKucKV1RHRGps8d2mpAo9YT3LQT+Ay7Fw9Jk0TBx3Knkza0O2DoW7C6rdlhtPmfPUmqlMOQpAd4gwHkILcK51
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(41300700001)(2906002)(8936002)(4326008)(86362001)(7416002)(5660300002)(38070700009)(8676002)(316002)(36756003)(83380400001)(38100700002)(478600001)(2616005)(1076003)(6512007)(6486002)(71200400001)(122000001)(6506007)(55236004)(91956017)(76116006)(66556008)(66446008)(26005)(6916009)(64756008)(66476007)(66946007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?HWygDQEb1PyFhR+kL4GJ9srPJBGZX6do22PpT5Z1cW1ZpH0799bRH+Cvpj?=
 =?iso-8859-1?Q?qYcp3dWIwbloXapxCndoQJkNJuHcjB0sPNLrW+I2cxwni0WxoI0lLuxrk9?=
 =?iso-8859-1?Q?CxWjiej+pQKw74a1PzG8Xj3asWbYTpgikX8+lHNrubA52ywwI89p2Hx9Ei?=
 =?iso-8859-1?Q?mksgxUTYF3slhuKYMDz11NAX2XtZqh7B34CaJEqAUvvcwvyMJUkpJW2oZJ?=
 =?iso-8859-1?Q?A6NktjOQYfI0br5nNZRI9y+9cNjqS+WVNBwfG99KPnYnWS7tRPXTYlCHUW?=
 =?iso-8859-1?Q?gAf+qvkNjVdPWkizuaBZ4v2QTeGXQkj4NfVQ1GYcZk6BPUciTijtazTOnQ?=
 =?iso-8859-1?Q?/ht/3X07YV7qIJYL+X6x7Hc8vYuAFmv0GkW41TF4NCOHbaMRypMuwXyYBi?=
 =?iso-8859-1?Q?BaUShIUMx5+YyAvhmjfAuAJNRy7AHr+2ndySLlVp833JOQPbSmSlypo0sO?=
 =?iso-8859-1?Q?9Hsvz5ZGfcDXpLCiB7JFY7nuCgBF805bLi3NndBXqKqWs4cP0G3/YMLAOE?=
 =?iso-8859-1?Q?ibptwwLSD4K1wVjoImcYFYAakV6BqgMFjcUYaSrPiHPANmhKIR179mlieS?=
 =?iso-8859-1?Q?lURQgDGeKshT61AO79QaFSacqi8NSR6Ts7oTf3URh6VbFOTj19gf52Ag3Y?=
 =?iso-8859-1?Q?Q6KW9cMu6yVLwuXpWXXv/RvCRHCOws5WPUp07rcl3m07GXUBHqvQatsXXR?=
 =?iso-8859-1?Q?qdN2BjkxlLQemRM9S6i9x4nFcBWS60tbMig9FUF0dafIGMPNk9nQiAXPBM?=
 =?iso-8859-1?Q?/vo+rQNRtuXxy9SG0+gwXUtzNz50Ri1zpjziiEeLzyyHpvTSMtPIfzrPgm?=
 =?iso-8859-1?Q?w8I2vyqlLVxNwCUkaxV6sNdwLlBnX8h8em/pZ6WXk/DmnmLCFbDuoF/P/i?=
 =?iso-8859-1?Q?jYPNzpT5i3IoXDlDSuiatPowqszi7l+bgHayoYUXqTZgTeUu+ucEzgpJnH?=
 =?iso-8859-1?Q?x8tcwujkR2SXQGUQxAsrBZySVa2PxqQ0l4kooHXyXL/tt0Ay6CHBGSgRSH?=
 =?iso-8859-1?Q?r8vGSroW39KYuuU3SHP8ARQnSF1Y9e0vlPqBB9MrTGlFEl0Pgat7s3yv+Y?=
 =?iso-8859-1?Q?SamMuUe5QIkNmXlFY7IhjbrYbKVV+oYhlKo6lhI8TgHon/BDGB/aJrasVU?=
 =?iso-8859-1?Q?wCOvUhyHx4htDv1QfGzhQctkaasH1Lz44T/JGIcMwk5x/OHYaTgXFvmK36?=
 =?iso-8859-1?Q?WFSeCN2gE11YLAhNwaKZwrSDT9SIBLaiMqiF/9J6ezEiQ75kw/HbTGUkLB?=
 =?iso-8859-1?Q?YDMn4wgGjjidUj6kC8uSl6V4blVcepLcIvFSPOj+d8gu2yRHlFUWqDtCGW?=
 =?iso-8859-1?Q?snbNtnWVSvBUVa7/XMMj29qKx1yx2dYO9vyj4PKh3zzTiQNPbncKa+6jcC?=
 =?iso-8859-1?Q?KctOHytKb78Z2YI/lvLS+b7sW8bQRdWO5r05zO5H9dXKnlNJQXwO90+aew?=
 =?iso-8859-1?Q?8+Obep2ysIh6fnIjIj7Di7gMDJe0LGX7Pf82Pl6q/CtXz2fdYYg90xX8jE?=
 =?iso-8859-1?Q?JftA3ZD+Si7IV7mQQHPrgXte/6wktbssahKM4u21gYl7rdgBnwLLziLebx?=
 =?iso-8859-1?Q?tUEN2iW2m6jidAPWx13ThctbkWG5w6XT6bQGLe+V0bj+bc4e1811eanseS?=
 =?iso-8859-1?Q?R3Xd7hbMKXlzpb+qiiEDxlZUH46LgGnF+AR31zGtx9OknjwGk6MS4crg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77270297-91eb-4348-0324-08dbe22d8ae6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 20:42:22.8222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oa45hKbQ2wDZG6dY7ToKqKfLd/1QA2aaw2GaUN/X6GUfMzjt5CxK3sZczkRfndpLUec+NAqcFeQ3yRghmoMfApynPzdJJEmigu9vtJLQcbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB8991
X-Proofpoint-GUID: BLNE5bGVc9v_qqRAms0kbUuAPLVvFkZl
X-Proofpoint-ORIG-GUID: BLNE5bGVc9v_qqRAms0kbUuAPLVvFkZl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_18,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 mlxlogscore=943 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100172

Add option to preserve owner when creating an entry in Xen Store. This
may be needed in cases when Qemu is working as device model in a
domain that is Domain-0, e.g. in driver domain.

"owner" parameter for qemu_xen_xs_create() function can have special
value XS_PRESERVE_OWNER, which will make specific implementation to
get original owner of an entry and pass it back to
set_permissions() call.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 hw/i386/kvm/xen_xenstore.c       | 18 ++++++++++++++++++
 hw/xen/xen-operations.c          | 12 ++++++++++++
 include/hw/xen/xen_backend_ops.h |  2 ++
 3 files changed, 32 insertions(+)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 660d0b72f9..7b894a9884 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -1572,6 +1572,24 @@ static bool xs_be_create(struct qemu_xs_handle *h, x=
s_transaction_t t,
         return false;
     }
=20
+    if (owner =3D=3D XS_PRESERVE_OWNER) {
+        GList *perms;
+        char letter;
+
+        err =3D xs_impl_get_perms(h->impl, 0, t, path, &perms);
+        if (err) {
+            errno =3D err;
+            return false;
+        }
+
+        if (sscanf(perms->data, "%c%u", &letter, &owner) !=3D 2) {
+            errno =3D EFAULT;
+            g_list_free_full(perms, g_free);
+            return false;
+        }
+        g_list_free_full(perms, g_free);
+    }
+
     perms_list =3D g_list_append(perms_list,
                                xs_perm_as_string(XS_PERM_NONE, owner));
     perms_list =3D g_list_append(perms_list,
diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
index e00983ec44..1df59b3c08 100644
--- a/hw/xen/xen-operations.c
+++ b/hw/xen/xen-operations.c
@@ -300,6 +300,18 @@ static bool libxenstore_create(struct qemu_xs_handle *=
h, xs_transaction_t t,
         return false;
     }
=20
+    if (owner =3D=3D XS_PRESERVE_OWNER) {
+        struct xs_permissions *tmp;
+        unsigned int num;
+
+        tmp =3D xs_get_permissions(h->xsh, 0, path, &num);
+        if (tmp =3D=3D NULL) {
+            return false;
+        }
+        perms_list[0].id =3D tmp[0].id;
+        free(tmp);
+    }
+
     return xs_set_permissions(h->xsh, t, path, perms_list,
                               ARRAY_SIZE(perms_list));
 }
diff --git a/include/hw/xen/xen_backend_ops.h b/include/hw/xen/xen_backend_=
ops.h
index 90cca85f52..273e414559 100644
--- a/include/hw/xen/xen_backend_ops.h
+++ b/include/hw/xen/xen_backend_ops.h
@@ -266,6 +266,8 @@ typedef uint32_t xs_transaction_t;
 #define XS_PERM_READ  0x01
 #define XS_PERM_WRITE 0x02
=20
+#define XS_PRESERVE_OWNER        0xFFFE
+
 struct xenstore_backend_ops {
     struct qemu_xs_handle *(*open)(void);
     void (*close)(struct qemu_xs_handle *h);
--=20
2.42.0

