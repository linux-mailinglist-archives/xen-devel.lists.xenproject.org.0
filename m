Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFC5322438
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 03:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88523.166519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXq-0004dA-54; Tue, 23 Feb 2021 02:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88523.166519; Tue, 23 Feb 2021 02:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXp-0004bu-Rd; Tue, 23 Feb 2021 02:35:25 +0000
Received: by outflank-mailman (input) for mailman id 88523;
 Tue, 23 Feb 2021 02:35:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6em=HZ=epam.com=prvs=268883478e=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lENXn-00046u-VU
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 02:35:24 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62d32df6-b2f3-471e-a2c2-450356ae1247;
 Tue, 23 Feb 2021 02:35:07 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11N2QQxp004083; Tue, 23 Feb 2021 02:35:04 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 36vqte83qr-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 02:35:04 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR0302MB3235.eurprd03.prod.outlook.com (2603:10a6:208:a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Tue, 23 Feb
 2021 02:34:59 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.042; Tue, 23 Feb 2021
 02:34:59 +0000
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
X-Inumbo-ID: 62d32df6-b2f3-471e-a2c2-450356ae1247
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BebwjZqHmfzIbjnBu/31UGt8bl9qKaqCFPPRLnE8/VERJllMVuTwKTV4XKObOhpubLOxfb1fi2ytVMhqpAjrEdyjEIpAG4MT8/fb0Aoe+p5NxhycZHm9Ucrg2j6YxnIAnww71q333AhjB1Ky+wyqdNXzSnoEr9QV5v9+hFr6pbjPKbT1BaXSb1qh/uZcfHx4HGKX9HeBDdqyJpLcnRHyF04yYPw3UOr7/y1S3/g1zyhG9V8NWsIdZYNtvpjsoLH+Q8gptxkK3FA4x0Uc7CdI5cjPnEve19hk6ZaNosFTqjevM1lgg4SYH+N3nvbZ/sYXJQoBOsyBFAXypfsgjVIsqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zq9Qig5UFOKzlvYCb9mxH6RosiS9ZEQ9G2xfCdQj3A=;
 b=oXlgQq/rGZu34TqCZD2aVCFucXcRx68BoF3MKTdWtQUXSbKkZNJunVk1y9Sz8rSSRiX0wvF1KolC2FJ6tmJ5s9p+Jm5Co+o0szwht6JXkuY5/C0VjSPvQQHcRlztQNvx3lMnltDRsOaDU3jGyuWvGwPACWrVpW8TtvI88pAKdTJ94NWgEDjnNil4NObohnSfGG7WFqfMRXsgh2YAOR8Ej2PN1OOvycBY32hZns+YZnSrD++lZkewZcAD3eil+r3hJfn7Yb4bhX8BzD/hPEgr29kvCQhuu6m5Ny02DXFi4Mg8exkeYjIOSc51m1Ydro6Q4DQcehMVP08S5AY6SplDKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zq9Qig5UFOKzlvYCb9mxH6RosiS9ZEQ9G2xfCdQj3A=;
 b=k0PFlVZZHn1Uii+1WoQpsR69DztX+xPyT7GEDmiuZ1ALJl/P21p1Cs7eLm7hru1+hDyblCt/EHOnMXclpmzhgwl7mDXQYjvjv5PEadsnb6n2W04f5iE0O5IVSGYQVqRr6Pwo0KEHqPyLf2UuUFnAxwrg8qo2sbw5yEpKeAyV1/Uy20MOxzQ13Sc0Z0d6Ym7nDTQcYshw16+lyzA87ZK/JySXRyIgeHaNI7gh+UgSL6BFCupHqQIYoyb2PI8QlB0RMVkxr+L63iCEzUiMIpNFPcN2kdOj8MxilTiHrFcw9DShDgy2Q/5OZYbpmR4Qv+xaduHGdUCKDtV4+VgoqmCcmA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [RFC PATCH 10/10] [HACK] alloc pages: enable preemption early
Thread-Topic: [RFC PATCH 10/10] [HACK] alloc pages: enable preemption early
Thread-Index: AQHXCYx6WMhDzv7reECPf5h9r1HBJg==
Date: Tue, 23 Feb 2021 02:34:58 +0000
Message-ID: <20210223023428.757694-11-volodymyr_babchuk@epam.com>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.30.1
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24b9de1c-03b7-41d5-6ed2-08d8d7a39d45
x-ms-traffictypediagnostic: AM0PR0302MB3235:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3235BEFE2996F1DA5C1131B5E6809@AM0PR0302MB3235.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:568;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SgiB155XE+2+GFV59/hdiPfQHHXoeFTE3Dp7amd0ORH4nxiFYgMM0HWXqMKMbujRWOpUwSu3Y9f3OApJQicuGA9tMUHBCdC3kIUGYm68rRwSiG/j5UYezcWSPer1l97kaClq8MvndkENHDIfYYA1baWagxtNN47W6hKQxf2a0vJSLqb5RLenpAb6ovj608cCvSb+YdZGtQRvESI1zMcavZmz573FM9nqRwCsO4kJUKFFoyC1AIn8XolKFlFJJ+ko8NjLjw2jvBq7F0r5OpiRCoesS42l5ofM3hr4YAZPhz6KeHf/mtthPjI1+Vu3P1oTWlnlgBmALruxwNgY50Rs1wXAWKOqh/k7MGzzloFoqcsj+BZw30mrQ7mrEHidI+uTfPYfkyF/6OSfB+g8WJGdkrYJnMrmeN3FwPjc/wwbRXpnkQrRub6pzohNB+oyLtXankUckuyB9HitMJpO3UTX+eUVxVT4CfiGGcwwdaQbJVtxB8r49pxHOWrp54ugpv75cEYhZPOCk8Mr3dixeuFlpQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(316002)(6512007)(8936002)(8676002)(86362001)(2906002)(4326008)(478600001)(6486002)(186003)(54906003)(66556008)(55236004)(83380400001)(66446008)(66946007)(66476007)(64756008)(71200400001)(1076003)(2616005)(26005)(76116006)(6916009)(36756003)(5660300002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?yo7jjSK2uVnzGBGQhMbXOJ0Gx5rTzA3Vs6KqGP/LT52jRShjBzbePqMWFo?=
 =?iso-8859-1?Q?OY+nrECjzwE8uXt4WBqFOgXdIh4O3GlpcR7Y6WFhbntYpIlrFWz7DdrDlt?=
 =?iso-8859-1?Q?ZMnZ+AcUdI1oq5B6EHeT+pybyoLocZkA4dDEABGDV12GqqH4SAsM0YnQvf?=
 =?iso-8859-1?Q?tReMxDAfvP6OxaPxjA70kU4w72GKWinKFH9GrVg5or9Tcx5R5YSLQqpBqs?=
 =?iso-8859-1?Q?LWEz5wpJG+IEIu+pXevVKf5XG+6mSg86BdpkTvrwrAH3dv/qLYhnlEnQy0?=
 =?iso-8859-1?Q?HZu477CYP+LTQ5IrJlEjMId0fCG/8akU40fXeWigSkFzqNTzLuQcvGC/+8?=
 =?iso-8859-1?Q?MUTO432+GAmtLDBAcL6qMVDNUppq51UGd46flKzGtBYjmYsV+VZgYjyjVF?=
 =?iso-8859-1?Q?i1yXKNI11/cc45f+1SZ7d9W1kRSkX6vP0caGBzoXGcdIAw17EbcogPXCWk?=
 =?iso-8859-1?Q?sf08pnxp2O2ztIC9rJwmommU5sdEN9ctORTDyrvI3mgc6pOQNSxHVycJtP?=
 =?iso-8859-1?Q?/pMG6/x31/aFSUZ0qclbu26HeDE+x1pX+WKVSmm2Ij3ySv5Nd2Eu6EP++v?=
 =?iso-8859-1?Q?GL7Bcef/Msyv/Gu+haPJQcB99YYzgcfGgvNKIX55N1O2Q9/m4IzAafk2B0?=
 =?iso-8859-1?Q?tr9WQkw1SUTl91VsktzWo/zzixd2HUl63GbiidFecWrmif6RmLfxnEiOQX?=
 =?iso-8859-1?Q?wbsJB2FKVnNcUGGJA1NsmF4vyH6H4KgtoEZeSrdp1ys7U3Xi7ou3gGoxQh?=
 =?iso-8859-1?Q?mtm2jYfl4/xYDz9rGN03KNX4tPNzDC89GKn8FpvkFmsr+xaOahJBfyIbsE?=
 =?iso-8859-1?Q?6kPpquP6mJarSvG0SQSOFm5cIVnTrSpaz3/c8NNX9FRvfYWgqXovYZsoJ3?=
 =?iso-8859-1?Q?4qfVkuqf/k3UH1VIVyWxZWpIslKM5VfhloCXEMHz7LDqaIRc0sr0/C0AIk?=
 =?iso-8859-1?Q?9Z1MNVVZltHjUWIxqKkNcuSoKFs1NMt+eXzotw5PrSf4s4GuCccK9qslOU?=
 =?iso-8859-1?Q?3y0eGHhObWfuXnOvkiIaO0EVCEZg2KHSXpLdUWTKqKSB3hlULSK8nBxRAZ?=
 =?iso-8859-1?Q?EJftv/6jhp2yNQNVGl/kQKkFYvwju108ft2A+ELIWeLSUP13XfaNMwXwzo?=
 =?iso-8859-1?Q?E1mrzFqAWu4gOw8DLcrbD5JImW4kWEgVMYiTBIwTqiOToE+4BeZEJLYesO?=
 =?iso-8859-1?Q?VbzIUIZ2tG9FIyDoEWS8pLG2H2HX/peBj3XDp6xMsXputCJMY9NEQO2C4r?=
 =?iso-8859-1?Q?UraDRK8fWd6o233Uo9k2SC5Fns/mi1W3W4wkoAJvKWO9LX/yLAgTK03USC?=
 =?iso-8859-1?Q?Wlyo1fDE0uuNcS/89tutCWpgRUAVF+wWqwbb6E1xgkHpdSS6Vho3E8ik3Y?=
 =?iso-8859-1?Q?su2oRLBZgW0eJEoJZxytFOIbK6LGZXZQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b9de1c-03b7-41d5-6ed2-08d8d7a39d45
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:34:58.8171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lyxjbXsVOQ6j4vN5L4qb6JwXqqAtjkbTr3+tHbqzwLN+xLNh2hv1CMKie3ntlzuAkW0+2JQLiVlCbl/MBvY4N5gHDjaRlo8PdsCUOvhnkL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3235
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=822 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230018

This code moves spin_unlock() and rcu_unlock_domain() earlier in the
code just to decrease time we spent with preemption disabled. Proper
fix is to replace spinlocks with mutexes, but mutexes are not
implemented yet.

With this patch enabled, allocation huge number of pages (e.g. 1GB of
RAM) does not leads to problems with latency in time-critical
domains.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/common/memory.c     |  4 ++--
 xen/common/page_alloc.c | 21 ++-------------------
 2 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 76b9f58478..73c175f64e 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1390,6 +1390,8 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE=
_PARAM(void) arg)
             pv_shim_online_memory(args.nr_extents, args.extent_order);
 #endif
=20
+        rcu_unlock_domain(d);
+
         switch ( op )
         {
         case XENMEM_increase_reservation:
@@ -1403,8 +1405,6 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE=
_PARAM(void) arg)
             break;
         }
=20
-        rcu_unlock_domain(d);
-
         rc =3D args.nr_done;
=20
         if ( args.preempted )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1744e6faa5..43c2f5d6e0 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -996,6 +996,8 @@ static struct page_info *alloc_heap_pages(
     if ( d !=3D NULL )
         d->last_alloc_node =3D node;
=20
+    spin_unlock(&heap_lock);
+
     for ( i =3D 0; i < (1 << order); i++ )
     {
         /* Reference count must continuously be zero for free pages. */
@@ -1025,8 +1027,6 @@ static struct page_info *alloc_heap_pages(
=20
     }
=20
-    spin_unlock(&heap_lock);
-
     if ( first_dirty !=3D INVALID_DIRTY_IDX ||
          (scrub_debug && !(memflags & MEMF_no_scrub)) )
     {
@@ -2274,23 +2274,6 @@ int assign_pages(
         goto out;
     }
=20
-#ifndef NDEBUG
-    {
-        unsigned int extra_pages =3D 0;
-
-        for ( i =3D 0; i < (1ul << order); i++ )
-        {
-            ASSERT(!(pg[i].count_info & ~PGC_extra));
-            if ( pg[i].count_info & PGC_extra )
-                extra_pages++;
-        }
-
-        ASSERT(!extra_pages ||
-               ((memflags & MEMF_no_refcount) &&
-                extra_pages =3D=3D 1u << order));
-    }
-#endif
-
     if ( pg[0].count_info & PGC_extra )
     {
         d->extra_pages +=3D 1u << order;
--=20
2.29.2

