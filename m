Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 350A56BA10A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 21:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509834.786434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhU-0002YU-GL; Tue, 14 Mar 2023 20:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509834.786434; Tue, 14 Mar 2023 20:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhU-0002VI-Cd; Tue, 14 Mar 2023 20:56:52 +0000
Received: by outflank-mailman (input) for mailman id 509834;
 Tue, 14 Mar 2023 20:56:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ugWp=7G=epam.com=prvs=7437a4d9da=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pcBhT-0001PG-6N
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 20:56:51 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd6fe7e5-c2aa-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 21:56:50 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EKchDl017378; Tue, 14 Mar 2023 20:56:33 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3pb0520156-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 20:56:33 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAXPR03MB7967.eurprd03.prod.outlook.com (2603:10a6:102:21a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 20:56:30 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 20:56:30 +0000
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
X-Inumbo-ID: bd6fe7e5-c2aa-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWePQK1s5qlonxJcwc17I5daPq2zcSJZH51nt3y3H71wY6gfOKLq7tv4+alx8YCU9eRVukXzgUfWlrteom+Z5z9rAoXjLU/PbrukZnE4wn9mlbavwNA5wOCe2uZQpWZ9yS8k6dTehGDe/mSGXmU85Xrf5V5hgou8Y99SedG1HXBbYnK0z40lwNfjeJo6QKguVUgtLAk6XxdiYNYHf8tz5xNcIvIy8qgHUl6FwQqmQ0ETO4LZmIXosY54SqYfSyk2QQg12UKMV8wQH++WrS4CydO60JynRW5LhBKCJWP6qoMbcf3xfT8D4xwpm7uNMxCu5OCEOKrdCIBMuPlrQoXAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7tBqA5OxDzYHo/yEP4dPIJSk0WzvlCUdOtG1wDrd3k=;
 b=ZDVRNx9HfV+K8gSoeggq42pNM5AnOZyktEKjGKd8DEL0wyB1wNjMPBZM79GQrmNnQ9TQxZ/9dtHNjLE//E8IYPPL54TJwBWo9Nhz4MgypPxMpEbRBKARjUUML2lFV51NPUZWdecn01+RFzMF1IoPW71irrJTPLzoUpBE8G+ioDkGfWDRUqUJKv5ANPRcfTYbfZacGRMmMbDZHN1Srgm2YeJLZOjpL33bKyAndufK3Lf5RwaJ7CtdiXtf+DlBTfVvSHdCvgJyFIptyTLoECrUUA9KtbYTlY4rNQXyLAcibqWb8zG9sNxdWR1UdFl/FEmLgZ2J5v51mDLhoaOMZEi9ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7tBqA5OxDzYHo/yEP4dPIJSk0WzvlCUdOtG1wDrd3k=;
 b=Mwtf9yAUNxP8g5GXxvRmTAHeAYjlgxEDYluXBY6jA2+lM2Wi5D5CJZVlOPjcDsitQjYffAn7qoTIWYlJ18Ihc6KoFkdQHi7ghsQxsc4oD6Rwue1poums9Cd7OVAvB/qpVfmBbEu8EuJoZDccMz9V2GdGqnkRCkn8yCeXkM24bBlUUn25Q4Jtg1EelurOMoHOvQEH9FuTv+3pz+Gxuok2zFA0rxJrU8tAA8gkIoeAj3Rri551/qkxSiM/s7MKIOALbxqtC3j4TGwaupg2dQQTJsVrY6uJd9lEQGo+6+UjeK9GEvDNgh9BvJew3AwU9qay3BR8CG02iCkP3weSpPnG6Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/6] xen: add reference counter support
Thread-Topic: [PATCH v3 1/6] xen: add reference counter support
Thread-Index: AQHZVrdyBx9pogLqRUq3RbhGdjZNSA==
Date: Tue, 14 Mar 2023 20:56:29 +0000
Message-ID: <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.39.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAXPR03MB7967:EE_
x-ms-office365-filtering-correlation-id: 42c5c5d9-763a-4a04-b8f4-08db24ce9628
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7laLWOEeMp6OS8XO67yqPwy8RIZn2Ju6KYuewQZeqb1zVx1eCDv5+bJrP9nl1kccTS8xg1szfLiUT8w+U65p5wG4KTZFECbKL/C4tjaJZ85jVQfU1tgyyse385I4/9GINKN2G1aFch9nKt7A+DX44oPKhPF4WxRjonbBYvT3c6Al97BZ+z+X+3OJAipdtlFKCEpZG5sdTA2vHs0+BgeKUWCYyzFcP/FjdEpY4wNDVoz2srkDGeo/GykRJ3vrkPDD1DMzBFmG54G/3eKY+98QeEnZtfkC+7P4HGpR59plCuAUnjV5q7GwPMLFId81XjSzEXfPkW8A7FEj3nvqaSzPAaRHqcqhh0hdYNIWRUJg1ZSQrL6Xkr3e0DTHiY6983L+tYpu33nttZBXlILKpwTPh6Hw+9shGIwn3cR9Lh6teFbwHehTPtJ3AuLVDcyAMXTB2LO5eaTtxiNIPG9GenYPawZVi49kU/gvGY1ZeUaPBd1kEb0NvLNxDLMPbq4uHIFIBoU/WAtAqBjvgK+xuXKpcjd9Ez3RFvr9wgHjFtrikxO0GSBdDhx+qlg+Pahr9Wlx30In2MG8q0c54iXh54IhzLuydefbGqyHj6G0CgI4oW4lA/hiN+hbGlS57ePhKnA/33lf++p7jf4HD0TyOtHQQ22SbJ2iHxQoGfPPOk8aAY6jl15k8hbLgVvo3syTyDkHOTvrKmpve7Msx10gRP18HA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199018)(54906003)(316002)(86362001)(36756003)(38070700005)(38100700002)(478600001)(122000001)(55236004)(83380400001)(6512007)(6506007)(2616005)(1076003)(186003)(26005)(5660300002)(6486002)(91956017)(41300700001)(6916009)(71200400001)(76116006)(64756008)(8936002)(8676002)(2906002)(66556008)(66476007)(66946007)(66446008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?raZ1IChzFUgdvCWliX699AlFD+urI0p1BrQ9CX2Y954xB8tt3MCbSpmHGV?=
 =?iso-8859-1?Q?H5nj21bx3oawXXxN/9lmCr+mxYqdw+KQ/wM3AAeuEW7lctUp/sTnkRFaJP?=
 =?iso-8859-1?Q?O0Sj59WBUa+DjoB3UI2RtB42IXoukJSl3AtzDQ5CmobCiVw4lMwFCf4bzf?=
 =?iso-8859-1?Q?l+MoN7EujaYUlbWU088wY/Stn49lcprKfYLk6ZkUHtw07oq4NfR7xrKXLb?=
 =?iso-8859-1?Q?6lE8PECjiSuKTDmy+BX8ztJAVR/nOdjSUmJFD9heJKveC+YxJ8yrP7SyTZ?=
 =?iso-8859-1?Q?uPdsAoaeD+APq4Wb9Z/AIH+xE+Hp5wrOogi9Lb7WMSxAXqICAVMWJGcPQE?=
 =?iso-8859-1?Q?dNDUrSzyIcK6ALaTYou+0U4pUonc9VVoeg1DnedOuDA6IBTDcjMvJj0zK+?=
 =?iso-8859-1?Q?ckYbo9ypLfkDoWyb1MK+Q+hN/1z8BbH33okAOhZ0AjI83+ttSjGrqy+HmU?=
 =?iso-8859-1?Q?58k5DUjdO4DMEtBg+E0VgAb7nyO9bMh7+BlrAvR0NnDSKJhh1GyoUrPg0l?=
 =?iso-8859-1?Q?mGxPSzeMJvv6Ty4YZ2z3PUZNUZIH4MUMsXKKgDGWN3oG1pMvCtU0bCDqps?=
 =?iso-8859-1?Q?tj1+m2w1Viz4DBcrQUemcoCYJVlPR74G8/SexUW0N/JDzS6PpTUHpYuda+?=
 =?iso-8859-1?Q?RhRrR2nYunzbixe5b8gerG8/jykymXo1WxIf9Va+g7D3ZbDU9Y5CsNYm7Q?=
 =?iso-8859-1?Q?5hPspzeD3lOWMFHcpc/EzHIOmnJF499ujBZ57tKRRbK22Ji+Cp9ickeUBu?=
 =?iso-8859-1?Q?7s/oyB65fGW/ceTXl48Ob5Jd/FF2v1BBeQLPxCexvjN4Xyevv4qp2F5Z8J?=
 =?iso-8859-1?Q?tv0CxUNyJwpWUDUfI6j77sQieztRNLFsdbiu4ZpyYDLEFcaOjgFVKTsS4/?=
 =?iso-8859-1?Q?9Hzg4912sLIZ3EAyFBJ+Mox6lBxFjwzooC6WoBeCPhrmDkh346Mbpmn9Ch?=
 =?iso-8859-1?Q?THNIp/oNTv3x53XEUkj2KJK1O4kNqYgiWjTc6mZjh+MCMo9Wp3i5XsUYhz?=
 =?iso-8859-1?Q?OVspp0QEga7gZytM4VWvdjlNvJrUBOmzZwfZ7Nn3vJkvnhmR7J1/XZ2+Ka?=
 =?iso-8859-1?Q?ZDQ0W/U3yQw+S+ijLZc6UWTGIzqhjplgekNidE8aiz/6SBpHLksRGh+OeY?=
 =?iso-8859-1?Q?1eMi4RykH0FxnE/xQ7ZjI1hbAKxOJIG8EfbBt8zz74Zh2PHwd2tOIxLnl1?=
 =?iso-8859-1?Q?/zRW6lBW2r0nf1Wx9wQmOW9fPWrL62OaMrVVTNb3e9SM6QsvutJUTw2qLa?=
 =?iso-8859-1?Q?1Dhy3O23BxwyEfRdZENjWEtVHFIL9A8IVGZd9EHoSbZwmMas98T0TyPGvx?=
 =?iso-8859-1?Q?LmxP3HQBrzKimdFQ7aIPxX6Tur5vA1HC30vfHub9XMmbgb7pvBo5CewhEB?=
 =?iso-8859-1?Q?GIvDL3hO/bX58xy8aD+FqJyBivADbfnqBq2jCA3yblssZzC1hIATgWho3Q?=
 =?iso-8859-1?Q?VN0lfIV7yCrQ+BzgkYQzVr4HeKElcdtlHD8xleLmysCGubz53ljNoZ/31C?=
 =?iso-8859-1?Q?kBbqrbe/8gGeBh6fIETgpRVh2J8/Ih4EHwp2lsJuHcpKlvu07Qfc90rVvq?=
 =?iso-8859-1?Q?Zz/406njrUs3iAzL9zGjEFRzxsMdA1NJoYli+TAaEfXPF7N0jrQnkUHO/O?=
 =?iso-8859-1?Q?3D6im0ivQEVgpHVMxy3EntpZJKTW1guGSvyWOtgs5V6EBEAaeRiUC9tA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c5c5d9-763a-4a04-b8f4-08db24ce9628
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 20:56:29.2765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KKEhdFqOaTIxpw2mLIPTMYtxooX0VFh7q44D1fg7urKY62wNvwxbxlMPTYkWkTViY/kNtj70qnwdEC87FHnVdE2YshXTA+KbiYQAobv1wBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7967
X-Proofpoint-ORIG-GUID: 9LTZF6K_WfMc60YSOQ2b5VdYZIEbzilF
X-Proofpoint-GUID: 9LTZF6K_WfMc60YSOQ2b5VdYZIEbzilF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_14,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=587
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140168

We can use reference counter to ease up object lifetime management.
This patch adds very basic support for reference counters. refcnt
should be used in the following way:

1. Protected structure should have refcnt_t field

2. This field should be initialized with refcnt_init() during object
construction.

3. If code holds a valid pointer to a structure/object it can increase
refcount with refcnt_get(). No additional locking is required.

4. Code should call refcnt_put() before dropping pointer to a
protected structure. `destructor` is a call back function that should
destruct object and free all resources, including structure protected
itself. Destructor will be called if reference counter reaches zero.

5. If code does not hold a valid pointer to a protected structure it
should use other locking mechanism to obtain a pointer. For example,
it should lock a list that hold protected objects.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
v3:
  - moved in from another patch series
  - used structure to encapsulate refcnt_t
  - removed #ifndef NDEBUG in favor of just calling ASSERT
  - added assertion to refcnt_put
  - added saturation support: code catches overflow and underflow
  - added EMACS magic at end of the file
  - fixed formatting
---
 xen/include/xen/refcnt.h | 59 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 xen/include/xen/refcnt.h

diff --git a/xen/include/xen/refcnt.h b/xen/include/xen/refcnt.h
new file mode 100644
index 0000000000..1ac05d927c
--- /dev/null
+++ b/xen/include/xen/refcnt.h
@@ -0,0 +1,59 @@
+#ifndef __XEN_REFCNT_H__
+#define __XEN_REFCNT_H__
+
+#include <asm/atomic.h>
+#include <asm/bug.h>
+
+#define REFCNT_SATURATED (INT_MIN / 2)
+
+typedef struct {
+    atomic_t refcnt;
+} refcnt_t;
+
+static inline void refcnt_init(refcnt_t *refcnt)
+{
+    atomic_set(&refcnt->refcnt, 1);
+}
+
+static inline int refcnt_read(refcnt_t *refcnt)
+{
+    return atomic_read(&refcnt->refcnt);
+}
+
+static inline void refcnt_get(refcnt_t *refcnt)
+{
+    int old =3D atomic_add_unless(&refcnt->refcnt, 1, 0);
+
+    if ( unlikely(old < 0) || unlikely (old + 1 < 0) )
+    {
+        atomic_set(&refcnt->refcnt, REFCNT_SATURATED);
+        printk(XENLOG_ERR"refcnt saturation: old =3D %d\n", old);
+        WARN();
+    }
+}
+
+static inline void refcnt_put(refcnt_t *refcnt, void (*destructor)(refcnt_=
t *refcnt))
+{
+    int ret =3D atomic_dec_return(&refcnt->refcnt);
+
+    if ( ret =3D=3D 0 )
+        destructor(refcnt);
+
+    if ( unlikely(ret < 0))
+    {
+        atomic_set(&refcnt->refcnt, REFCNT_SATURATED);
+        printk(XENLOG_ERR"refcnt already hit 0: val =3D %d\n", ret);
+        WARN();
+    }
+}
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
2.39.2

