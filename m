Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5109F7F38FE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 23:11:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638306.994766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5YxI-0007lx-2U; Tue, 21 Nov 2023 22:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638306.994766; Tue, 21 Nov 2023 22:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5YxH-0007j2-Uv; Tue, 21 Nov 2023 22:10:51 +0000
Received: by outflank-mailman (input) for mailman id 638306;
 Tue, 21 Nov 2023 22:10:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/eqD=HC=epam.com=prvs=5689374ac6=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5YxG-0006PS-Qg
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 22:10:50 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d37d086d-88ba-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 23:10:49 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ALJcd1C031085; Tue, 21 Nov 2023 22:10:34 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2233.outbound.protection.outlook.com [104.47.51.233])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uh0hhgrv3-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 22:10:34 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8836.eurprd03.prod.outlook.com (2603:10a6:10:40c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 22:10:28 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 22:10:28 +0000
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
X-Inumbo-ID: d37d086d-88ba-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+oTrug03bO6QMDVE2fZb4n6QkQkiYtc7LUvlIWe6QIW4Q7Morj3kHkdflWv/WRoC1fRSGUeA6PmLyZfchw7sjECTyimw/dfx6eKOoA5mzG8BkJNRSeZXgAyj9dzBs8RKpj66iuzVN0tvs9T5y9xXG23STbeWXmNva+pQp6QW48H1EUC0GD4HGzdYceEJcZcTDDG0mtR4zDPFidDk3ud7LhoFkoazm+hu/4aviKZmly9MXqa/bBdLOAUMJtUxSHLO4Uae8gH8DjjmLmB2nCkdgaRITi5lHcfq1i6pW719RLUU+u2dhXy4xzYBeLATprh64ELMG3V8JRyhdCnVnEk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffYRx7XuJDukcGSWHJ7JKVQ+d8C2usuIHgJipHrngZ4=;
 b=YEtTuGWyIcbvsJ9f0YRazOenepm2HF8GQmFy2d59F/JiyCY8ccDv33vq20lJeSO33rh/rctmuioIrLl+v1Hrvh/yzP4OE3ePJdbo6YHAzRrcCiyuvA2Jh1I06Q3LEzbPLtgPEK0bvV+6ybT+intalSzDibrETMKfcH+tKWOBb7mAUIzrOmDxt3SrhQD83Ixz2LfKIjWJlAnLz/Aunkxq0qKtl6GIoX0zoYCQ3kh/6rDNHJPJvzMtvKSAluodt2fMqdQRSVPK9PZStWDNydhSUFSiXyS+/Ug4CodR9+fKOjj0fzbsRzjfz3BIo7/JAm5cthFyTQPF56QkzUK6JMDmww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffYRx7XuJDukcGSWHJ7JKVQ+d8C2usuIHgJipHrngZ4=;
 b=gKASjAqHwMmv0ZXPeRtLBFyp5DC6FQBknfHiNZKoUIzQGWyYnRZa+Pw8YED71UM16CzEY8g9wB4boMhDLfAUe+Kp1q76qRoGontVHfbXF5hu1AKCg9U10D8H+lVrkbLfdBikI1ttjAlH8Dq8fuJCFLNt6blp0HoaK8YodQkiqKDtEcl+HirBTAzXdNNINp6MIz5jJMlbrsSyaAm78P+1A6wQK4wTJiZdXdZP2Mjk3kU03B5YAvYFIKi8MPSr6EwxtqvPMXnOO3xC/eXJ72CQq4OKvqGL1oNe+LzCZeOwVsOrtNMyUxmzX78tJZyTgzFLHOMD8EueMqlRYOUdtc1IAw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: David Woodhouse <dwmw@amazon.co.uk>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        David Woodhouse <dwmw2@infradead.org>, Paul
 Durrant <paul@xen.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Eduardo Habkost
	<eduardo@habkost.net>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open
 list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 3/6] xen: xenstore: add possibility to preserve owner
Thread-Topic: [PATCH v2 3/6] xen: xenstore: add possibility to preserve owner
Thread-Index: AQHaHMeI3Gf8Xs6dHUOphRyadMs2ow==
Date: Tue, 21 Nov 2023 22:10:27 +0000
Message-ID: <20231121221023.419901-4-volodymyr_babchuk@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8836:EE_
x-ms-office365-filtering-correlation-id: 0b5b5819-1eae-4f49-92f7-08dbeadeab95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8SyCokp/FW7dJRKCZQZyv9CgiMYc8TV9VtzrtN8Lg9XgIMamyC6+Yo/2/2xKYRziteRPrYXknLhsoU3of6ssWYlw11O98+Ukb+Dp3VUeDCdvyUxCrPk7ExEz5sv4iltZjYkk7zy4Jppr4yIsTJuAAJSQMIWHiOgv+rUD0lTH4JxpqpEnhhvpyYc7o+YTrvmvmNLWunq6CvOlw4Hpi63/525DfKrOhnc+2nVvFbDxaSSd4/ppquOE5XB5VnJxPZ0HmKaInRNk/rnQ8Dc337Q8SstdmG/pyK6DuEA/sb1Q4lKkdUmx5lfIrYEYgJ2ngDhKJAzsN9tullFhUTTmPBl8HiZ6iUKpQnCb6pCa42emnomi7Urni2C9Cyv8MICim91ersiBLCLQDk/fL0sIs590CE066ZlhckoUAe6TxWKwtwQtBToSMT0dQau3Z32/CUfAzjZpseh+9MYIF/UEPODsiktmut00YV1kWKDvGyNZNF0uS9WY3h5w2CNCF+xnYPnM2pPUVZhfd5P2yB7ExLi7ForBB5v1M8jeAru9kDLe3ooYYFr9/IAEUMqegwvM4zIpWuXV26Gvi5S7ZRz2xub8vQ1uT8rG8ykmXzrW14iE64/+NDQbAmDZ96POAGseZaOY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(41300700001)(86362001)(36756003)(7416002)(5660300002)(2906002)(38070700009)(122000001)(6512007)(2616005)(6506007)(55236004)(6486002)(83380400001)(71200400001)(1076003)(478600001)(26005)(38100700002)(91956017)(66556008)(66446008)(316002)(66946007)(6916009)(64756008)(54906003)(4326008)(8676002)(66476007)(76116006)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?XUXoy6WLSuy2I/xwBQMOTplQFonOYjE+lTe4Lw0/Hv8WxpzFe3TT8R44l8?=
 =?iso-8859-1?Q?tBefqDfsdRaCs5rTSTM4Dc21cwj5ASiB/PR5CxiWv/JiAIXXX/nHSqQwSX?=
 =?iso-8859-1?Q?VQPjWttinkA+qEXxrnnEuJ93tG4QzCdQFEuotTwq18RkXyT5eLx9IIwLlP?=
 =?iso-8859-1?Q?0cGIr/zi3FTyFMtUwhMZyK4nzWKcyg7VOlXNGw7Dir76/EsLlGF4wMRHJ3?=
 =?iso-8859-1?Q?wMwb7XZ1dnaSH/SaR3/wgioPRJAC/YFdNTfaIHP9e6WElJhDR9KW1/Pmmh?=
 =?iso-8859-1?Q?lhsJjwiB400g3tWYP+zD8TwcYBRfOAglpULWc0pdQbYjHbMb/Cx8YYMpq7?=
 =?iso-8859-1?Q?AzTqZYhuZGcC+ru2hIY4GH39Z5AtDrnw2jbaFTdg3DZISAdRBBOfyX1iRu?=
 =?iso-8859-1?Q?qDmHcsskmCzDbgq2XmVHVbwpHA/2Mr37W0Gq7E93Wtn57XCBiQ/be/e5ZP?=
 =?iso-8859-1?Q?rCXfkPIENLXFu8REUWgEcKy1YZST/3vN9zGNE1W75RC4SoKYATVZtOm6CW?=
 =?iso-8859-1?Q?8RaJsjDIn1nYVdvqiPJJ17ky/rLNFrMbWP8B3/OEoe1dPqfj+F4SAEPSc2?=
 =?iso-8859-1?Q?ORhsbOCbYz3ERHdmm5/vQu+k/gIukuLvhOXGUSncJHQmC8uFDuJy+Ov2L3?=
 =?iso-8859-1?Q?UlDHhFSY1rkYWb64rk/USKy1d6MOKlUhtMc7eNcXFh+3F7hqK6PBa2xZFZ?=
 =?iso-8859-1?Q?6MQxCMe/oyvgD8lhdpqHbCiZPTKLgfwXVROgobqkWDfLOXOLupC9/LChij?=
 =?iso-8859-1?Q?yFR4pScCO03bm2CpUwHsFr++mKV1zwhgiUQryankVYeGlXvHkDf9hvB3hf?=
 =?iso-8859-1?Q?Uh54IAop4siQ4QF/NKaa8D6YcgjA9dl4gJIu43cJf63IBkTlm+S7hJEEnf?=
 =?iso-8859-1?Q?UJ+9apljErrTIYe2EPPasqNsGti8wffQhGiew6COBmCF6X45GU3WpbSC5N?=
 =?iso-8859-1?Q?KM42hpkecXckNzGwg+EaM3SpLnA7ZNa4u7YMrHVlb6vhgEXgR/xVCVk4ug?=
 =?iso-8859-1?Q?pEVbc1QDH/99Nl3S32PscN0tzVihujXkWKn1DCqsXO79XaZjA6DX2a2les?=
 =?iso-8859-1?Q?+ulgHz4Jhnj6RuifNtXbHTgUEcN7aWnGPSeA3weecNoI+GblsjR2GdVObm?=
 =?iso-8859-1?Q?ObGljcAFyWespgR4Qm3+LLX3GhZDqbxUM91b4YEDX7NgL4pYG1uXusYRP5?=
 =?iso-8859-1?Q?vu0O8YvBdkrz4ylrdUG6fJdeGPMthzwZLLMgQ7Fouh26NlHcFKx8Wa+TMg?=
 =?iso-8859-1?Q?H6dUmQunkEgM03IdjxOMMxs93NK8W/V9PUT8ryowi+6qdA7toyu/tCs4/O?=
 =?iso-8859-1?Q?1bIdUPGQD/XHk22gZTU6Kw5aW7p7/MkyDsHQlWB/wuA9Lu9jsqYQOSDTLv?=
 =?iso-8859-1?Q?I7f3GRXHP+Oy9YX14SpawBvhUwJzlPQ69AwMm7Zsi/UGdXAdhN9u7CNJ22?=
 =?iso-8859-1?Q?JH1sfOunSHtRfKveMWr9j9UMYVLz0X6da/ykpOG7VemJlYndRSS8m3naMG?=
 =?iso-8859-1?Q?QS4GC73AEQ1Gi2ee+fzVnxPPV8GdIYNqkR2lyzIHS39ODvQISz3NFFWXLy?=
 =?iso-8859-1?Q?wYyTC+Y5sGVZ5U6hsuB0epukWfKr8CTd1skeK/tslRYOzkp/ZzdVP1wqYm?=
 =?iso-8859-1?Q?4zlxcS0rV17krshRXJcw6T0DZwQLAhWpmXl57h22ug3aNlV0P04T/hiw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5b5819-1eae-4f49-92f7-08dbeadeab95
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 22:10:27.7937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BEVgIfVgeiTu73ik19OyXyA8m6UD0BdLwEuXVifPPf8sfRMnihbq+VgcI+/RqiL6cWCoOzNPs/RmWKw61WvmxLfgUt0mX+OaSEPZU1zi1ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8836
X-Proofpoint-GUID: W2bYEx-fBJEg5TRa3Y--B4-uviAGyo8_
X-Proofpoint-ORIG-GUID: W2bYEx-fBJEg5TRa3Y--B4-uviAGyo8_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_12,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210173

Add option to preserve owner when creating an entry in Xen Store. This
may be needed in cases when Qemu is working as device model in a
domain that is Domain-0, e.g. in driver domain.

"owner" parameter for qemu_xen_xs_create() function can have special
value XS_PRESERVE_OWNER, which will make specific implementation to
get original owner of an entry and pass it back to
set_permissions() call.

Please note, that XenStore inherits permissions, so even if entry is
newly created by, it already has the owner set to match owner of entry
at previous level.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

--

In v2:

 - Pass transaction to xs_get_permissions() in libxenstore_create()
 - Added comment before XS_PRESERVE_OWNER defintion
 - Extended the commit message
---
 hw/i386/kvm/xen_xenstore.c       | 18 ++++++++++++++++++
 hw/xen/xen-operations.c          | 12 ++++++++++++
 include/hw/xen/xen_backend_ops.h |  7 +++++++
 3 files changed, 37 insertions(+)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 6e651960b3..d0fd5d4681 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -1595,6 +1595,24 @@ static bool xs_be_create(struct qemu_xs_handle *h, x=
s_transaction_t t,
         return false;
     }
=20
+    if (owner =3D=3D XS_PRESERVE_OWNER) {
+        GList *prev_perms;
+        char letter;
+
+        err =3D xs_impl_get_perms(h->impl, 0, t, path, &prev_perms);
+        if (err) {
+            errno =3D err;
+            return false;
+        }
+
+        if (sscanf(prev_perms->data, "%c%u", &letter, &owner) !=3D 2) {
+            errno =3D EFAULT;
+            g_list_free_full(prev_perms, g_free);
+            return false;
+        }
+        g_list_free_full(prev_perms, g_free);
+    }
+
     perms_list =3D g_list_append(perms_list,
                                xs_perm_as_string(XS_PERM_NONE, owner));
     perms_list =3D g_list_append(perms_list,
diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
index e00983ec44..ae8265635f 100644
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
+        tmp =3D xs_get_permissions(h->xsh, t, path, &num);
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
index 90cca85f52..79021538a3 100644
--- a/include/hw/xen/xen_backend_ops.h
+++ b/include/hw/xen/xen_backend_ops.h
@@ -266,6 +266,13 @@ typedef uint32_t xs_transaction_t;
 #define XS_PERM_READ  0x01
 #define XS_PERM_WRITE 0x02
=20
+/*
+ * This is QEMU-specific special value used only by QEMU wrappers
+ * around XenStore. It can be passed to qemu_xen_xs_create() to
+ * inherit owner value from higher-level XS entry.
+ */
+#define XS_PRESERVE_OWNER        0xFFFE
+
 struct xenstore_backend_ops {
     struct qemu_xs_handle *(*open)(void);
     void (*close)(struct qemu_xs_handle *h);
--=20
2.42.0

