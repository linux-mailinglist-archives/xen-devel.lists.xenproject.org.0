Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C9322436
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 03:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88515.166419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXU-00047x-Ud; Tue, 23 Feb 2021 02:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88515.166419; Tue, 23 Feb 2021 02:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXU-00047L-P7; Tue, 23 Feb 2021 02:35:04 +0000
Received: by outflank-mailman (input) for mailman id 88515;
 Tue, 23 Feb 2021 02:35:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6em=HZ=epam.com=prvs=268883478e=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lENXT-00046u-W7
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 02:35:04 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68b0f640-32de-4aa0-85b5-e53c587577d8;
 Tue, 23 Feb 2021 02:35:02 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11N2PMaT026304; Tue, 23 Feb 2021 02:35:01 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 36vq3kr64x-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 02:35:01 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB4082.eurprd03.prod.outlook.com (2603:10a6:208:70::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Tue, 23 Feb
 2021 02:34:56 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.042; Tue, 23 Feb 2021
 02:34:56 +0000
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
X-Inumbo-ID: 68b0f640-32de-4aa0-85b5-e53c587577d8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/0LdzXELduml+jUaLJtNvT+Wx2FNmyZTe49zUVTc283TNgbc+Kc7DBmx1uV9R3sJ2YlVjl7duoCoOQIPlvwvoDssF2o1HrlfcTgoHelS/A1QyupTfCHM4ZlMMmuICNNWxNYHZx4WM+bO5cmUkM0bCVRJ56Kp6uE4cHCjOoFbMAJBwxyiOFaT8mjHt74l1zAvjNiRCN4HgF6/BMxDHyZ4MWlSbwjcJWnusAVRgPREN1oa7lf9kMkH0ddXnL9Ccziz3btUcS4WKi/rNLaek0i0uWMVP2AhckZ8g/HzeOc7rOJW4Vfz0C+AD/nxk3uKzc4UF7cLm+zqDOK3M2gT7B3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn4xI64B+KozaWUtPjUMMalIz9nsigT141zdrSuovfQ=;
 b=dnJ6JWrECpTgYrkflvlaqJwEjXebtzyNyQxPPl356g+Vr1vNrGG0UKHj8uUtQ5CXSVrAG9BidHev7KHyfwFWxkm1ZlZ65XLSTMht1U//8j8B+G+LjcKdLg5ax9oZADCD+pIEmc2/WnEg8IB8OiTR1vPY8bSnnuFGAorTMPbQ2Gj54R3ilLAvVbtlKyfI/4915iDLTKK2bl207KLt6Kyc3OCM96eHgAmjHAK6z8o68l1AsO/hj54RTn0zcMHqMnn6vIUzJdad9LTT+vUtF4LhhwzQ2KWsJfOcEVOiZq9pN4MULnJbWGKfTksncT1R+/tc4k3MqQfvpKrRRNxJDWrQxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn4xI64B+KozaWUtPjUMMalIz9nsigT141zdrSuovfQ=;
 b=Xe0hc7GWVavvNZAN0q4rZt8nrTovi7xQOS19ZeaO7Cv/xqHhmWAtLdy9osZzGdjfaPBh1sO9WjpdZTFVVbOUGiKwkXqtbFZQKnqqd70SY7xJj3fVwZUBHnuE6fj+dQieEbEYmUBMH5NWm/BTMVEmfB2u8qfCCicTqGxshNRVT+dnDgbe6Alp+fMPNaNFTkqK3oGR6FIkqhWHWu53Qn9mIEMizqFpTJMiIg/f5BSy+oAOo0H5dTP88CsZfrrDBkcA8TtyQRflQlVX+KFclJ7vxM5CduR3LrkfgufBgWENFIEPERoXWcV4VBDtKqwOfVkUINzoKfKVFlmPBjvzImKHYA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Dario Faggioli <dfaggioli@suse.com>
Subject: [RFC PATCH 03/10] sched: credit2: save IRQ state during locking
Thread-Topic: [RFC PATCH 03/10] sched: credit2: save IRQ state during locking
Thread-Index: AQHXCYx5L/8BTjhE1kmjLesetNwagA==
Date: Tue, 23 Feb 2021 02:34:56 +0000
Message-ID: <20210223023428.757694-4-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: eb228de5-cf0a-4d52-a8d7-08d8d7a39bb4
x-ms-traffictypediagnostic: AM0PR03MB4082:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB40820ECFE21B530892450458E6809@AM0PR03MB4082.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GY8GrZ5vRzAffAw8dMb3KHeLz56TgIJpsNsAt0QryFuysYxwuSii9DH6dMgRkW/c7tlLVp3h/Lco4RnORbXbh1ECNyYnJHyAVPe0Bpr5lYsm7uIrRD5J0vpf667lezp18ZIKI2Yb2U3WEfbM/yoHo3ATiqukchV549MI3i+D/58rhSck20HOEP9AIjtp4V04/XCN4ZzKlieWIqPUd97ek26FbylrU4r0QWmDY+14YBoeluN+O17IjG8O49d9j6R2t3TBY0GKL8AP7KNqEU+J1Ix0XE1kvcfqfUj9b+TR7RkXvdPGFLN5R5ge4qUyPIgdJG41hvTpxnKKnufAXwNz3CR8y8Ta9aFyomxkz2FrZKkar0r463tgUFiL0/Hohy7iY9ymSJrCfv4g0tIVoG6Lc5jIY38hOchyLkKq+K8SwYmRon1Wdayle5aIYN0fPSdeHiD+pTfmnQeRlPdZj3aTiGCffivCuhpebkB4mbIwdbjhk5FqWuH6OuN2v2mKJ4cE2L2UkWhlsqt+KOiIyzm5/g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(1076003)(8676002)(186003)(66446008)(76116006)(2906002)(71200400001)(55236004)(4326008)(6486002)(478600001)(36756003)(26005)(66556008)(54906003)(64756008)(83380400001)(6916009)(2616005)(66476007)(86362001)(6512007)(316002)(6506007)(66946007)(5660300002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?Odef/KZUAh2CdLP33DX7YhCl8YG6UdI8z7CCRRmNd4ksZi+DH6H/5I1+w3?=
 =?iso-8859-1?Q?+3APbF9DiWuYJc2/LTKDDPtkMoXkLxaELKF/ztO1MMVdgVbKiyvtC8R5eQ?=
 =?iso-8859-1?Q?O5tpmMko7WsjVjpzQklaD/mjTqMPiBmYDRaFd0ByFJcGhqr51roA3CcArt?=
 =?iso-8859-1?Q?MrnxFuaxvrlB0E30IuDosDrhcXs6D7hhL74iEaVMVUzJEZslzIE7GI8hxq?=
 =?iso-8859-1?Q?7mCtK9w9/lZL/SzqwoyPVRMPvoxrS91JTymn9VYnR3vsCNk+6uYgnNowQ9?=
 =?iso-8859-1?Q?r/srReAve96lfJA8kVDUkepnszFJtE7ZUZRw9pSeiTcwzz60fsc2nEDlIg?=
 =?iso-8859-1?Q?qyIpMikc2/F21G8kHOe4Iy/5xbk2wml5RCmx7SqyvPs2Lzi7aSm/RIOdb4?=
 =?iso-8859-1?Q?rhsX+gRrlA2vfzfNwbKujTkJwcma6VChY7BTc6zz31F85qhuCSXXQQAnea?=
 =?iso-8859-1?Q?S5RcN8X9KWaUJJiRZBUaLWG2NWdP0y+TcbZtg+I/R4MPH4z6EF13HpP9Oc?=
 =?iso-8859-1?Q?YbtQRon9g/S3JwKNKesdbzcJ3lR0mIeE4gFdAO7+GDJgm1/ihynIdQ2y3f?=
 =?iso-8859-1?Q?vfd0Y2vlu+DDsSWn9Op0aNymMvrJI/8cuoNc57ZFHNzobE9uZ2y1yMTGBD?=
 =?iso-8859-1?Q?6NgnrSDHOJH1lo1B9fTJFSHmqOXMy5g8t2fDPLIy7vho2riyiiMaFKFfAE?=
 =?iso-8859-1?Q?5iGgL21S456jMzZ1o2n6U65ECTuY1m+o/IvYn7S6t7UV+Z3JDceg2Odq8A?=
 =?iso-8859-1?Q?SSVTJg6TrVpOXmTSnOYXlE0hYT07Cvvr6VS/SbimND5bt9ET7OsBYdq3Mo?=
 =?iso-8859-1?Q?v35LxNX5VpHaQWnWn9AOm8XfeSsBfx41kTb1WR0/v/SQGANk1n9YOJCBj1?=
 =?iso-8859-1?Q?x+CZurLQmtP6ht+0lctaIU5X+oxp2O5msX25pEj2bX9AIvEhopNqZeu9no?=
 =?iso-8859-1?Q?FWOGVE2AGWCMIAYFsJvLf6bglDIVxnqTzTB8Kh0RmRi0xsQ9LjCP8dvm4x?=
 =?iso-8859-1?Q?g/CGeRpf+NGnqhkclx94TS3nEAph8AqLrkzn9WoWslZlp70f9G22t2oh7t?=
 =?iso-8859-1?Q?XJJaN499tpfKlGR3Gcw30XTdEQgyX/OAvB4v24uy4bb+W8OC9Pctev7fjy?=
 =?iso-8859-1?Q?LUIhEPwwquVkUD0rqCOnuz7DzegNpseqPYuu0PxkPawo/m9YncZci1UO+A?=
 =?iso-8859-1?Q?TajxazRep9HZ1tyH34jESUAaRDTwLX3lEOPDQD1AShUHq2Y/QBVcBD4p73?=
 =?iso-8859-1?Q?0PSTCErXyD5M+RMQzne14PZMGEgohFKg7O12LqmsOiMyKAb9NFZaKw/04q?=
 =?iso-8859-1?Q?V9KYPblBcvLWxey4XAuvNmfM8tRL+aLfWtw8Ix91ZGNbqUuclUtEaYGnBJ?=
 =?iso-8859-1?Q?VCfG8+h1CL?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb228de5-cf0a-4d52-a8d7-08d8d7a39bb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:34:56.3895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +adPgn6nAGWGBXgAkinbxzNqAC9hVqx4ES6xcjdxn+lFnh2aCCO5sCosH4IqQUjxLp0GAvyEldl6K3e5+4fscElAIySHnRcVgto14N9q8i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4082
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=912 clxscore=1015 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230018

With XEN preemption enabled, scheduler functions can be called with
IRQs disabled (for example, at end of IRQ handler), so we should
save and restore IRQ state in schedulers code.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/common/sched/credit2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index eb5e5a78c5..b3a9786425 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -2297,7 +2297,8 @@ static void
 csched2_context_saved(const struct scheduler *ops, struct sched_unit *unit=
)
 {
     struct csched2_unit * const svc =3D csched2_unit(unit);
-    spinlock_t *lock =3D unit_schedule_lock_irq(unit);
+    unsigned long flags;
+    spinlock_t *lock =3D unit_schedule_lock_irqsave(unit, &flags);
     s_time_t now =3D NOW();
     LIST_HEAD(were_parked);
=20
@@ -2329,7 +2330,7 @@ csched2_context_saved(const struct scheduler *ops, st=
ruct sched_unit *unit)
     else if ( !is_idle_unit(unit) )
         update_load(ops, svc->rqd, svc, -1, now);
=20
-    unit_schedule_unlock_irq(lock, unit);
+    unit_schedule_unlock_irqrestore(lock, flags, unit);
=20
     unpark_parked_units(ops, &were_parked);
 }
--=20
2.29.2

