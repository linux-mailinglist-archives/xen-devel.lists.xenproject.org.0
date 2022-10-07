Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973A75F76E4
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417678.662372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf6-0004hV-7i; Fri, 07 Oct 2022 10:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417678.662372; Fri, 07 Oct 2022 10:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf6-0004eo-05; Fri, 07 Oct 2022 10:33:00 +0000
Received: by outflank-mailman (input) for mailman id 417678;
 Fri, 07 Oct 2022 10:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf3-0004P4-R7
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:32:58 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 677e34ca-462b-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 12:32:56 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2978P170005817;
 Fri, 7 Oct 2022 10:32:51 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k2a45sjk3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:50 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by AS8PR03MB7159.eurprd03.prod.outlook.com (2603:10a6:20b:2ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 10:32:46 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:46 +0000
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
X-Inumbo-ID: 677e34ca-462b-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTNT+Ai2rm8uXBBVwwRXaYKdygnQ/iTmN1JZHN3y5N5WXxZUxSItPewHCZziIIy6bAH4J1vuKhnc0JAQGlPkC0qG3pNJW6OMVhR4NsO+xdqqcF/VHWKmZbfY4dwATPB0frfEZeulmYPEZZ2KB57ftYJuXMiX1+siTvkbAXaYYqlt47/O8CiaFHVWS1g/6s5hmdCtfLkt62ywds4GtCuG3vlMauaexsTNANdc4xrc9JdangEVBb1whn4EYG0WwXZ8jlpMWliy771F/zTkTBMIdguU9JQyrURtxdyc+vF8ZWqm4gXBmZPwqhGyeiT4+MN3v1RHu8Z97QJr03BNP/zKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vI8WYCk3EkX7EbqmfQgeu3vc77XT/c/fe+8/1HjADBA=;
 b=YtKBkwRhMlrnY+BK4X3vUMb3jZiNVtp0xKucJ9YDIjZBaHNNJJfXbSIlHX0KqwcqIsfM6USEqyucZpsEmx2mC4XykLrXq58ecj2sF5EPyTt/TQCCyUxBoeVFHUox9EDM/VpUFmBgE2kLGQdYGoK3VhQJUHjdNEfHOCDY1VFAvtyx83r7A87BEt26IKHgXu1q0VGWTtsRiEX7ya1X8n+qywbxS/NKlitTr2mEt5N+H+vse6fm4ieSZst9o6PXSWmHXm+62FaCYkLGMcI8zzsowGYXXXdcuRKAO9KlNC3rV1onWKeFxHcOR4l3Q69GJzAxyZAExMEa3JNMuI43JqbntA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vI8WYCk3EkX7EbqmfQgeu3vc77XT/c/fe+8/1HjADBA=;
 b=e65NZQC43Rgu0GY6zQ7z8WqqV7CSuVaaKIoeUcD+PScn4R9P/UOmU6mTMsyKmFD0hOkl9fZUmNl0005oRWawLdQZjfNnzx67Wy8xDiu0qZMLxw8LximuJYnj2dsoD5M6VOaRjKK8CKVQGNgJ0NhutPAZ7EUDxT6mcu8NAQQgUMOphvLI798QAQUOdv1Rr45XImMEfm50NElHbcv3p7ChpMmZtl1D72ZLVKveig3NpMF3pxJOJUv77A2ONCCW+AZLn5Fe0N94FC2G2B7k4rzLIlSv0XH164IJE1GCvIp8wcbor0s5l5dsDPURygmk+SPWv5rCpu1+FPAssRb2Xk5e7Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mirela Simonovic <mirela.simonovic@aggios.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>,
        Wei Liu <wl@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
        Mykyta
 Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH 03/19] xen/arm: While a domain is suspended put its watchdogs
 on pause
Thread-Topic: [PATCH 03/19] xen/arm: While a domain is suspended put its
 watchdogs on pause
Thread-Index: AQHY2jgj3tJ62NzvY0CshbpyuWlDtw==
Date: Fri, 7 Oct 2022 10:32:45 +0000
Message-ID: 
 <fffb1b6e07974cfa81fbcf8793c9d540a7fed00e.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|AS8PR03MB7159:EE_
x-ms-office365-filtering-correlation-id: 6fac4072-27f9-485b-450d-08daa84f4647
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PVdWxfHoqtcVrQBX/GYOLzIhnjjQ9yiGIzkn76KThW/FjZkaF2GVH7BQcRNIj76JyAnnbSMGMIFcNW3c20a9TVdgHVvH86P5gnp1YNQ6GR5QJUYxbc8y1LKIi6207ENGGCd55TgXe7WJYRZ45bBQnUHYzfnZOYDcmak88Z5E5+387Y+tbLR0B+AfTXgE9dG4pfaJXqXIDNNv9WTqJsC+f+kJdQyMeSckWKI91WUs0ZXV/U4xoqvkKWN9Fqh8QVGeslS245Sj/0ln2PPcW7aBXh9WnYcJC0lJ9k7//ZXRKzHFRnRzUZu9w83A/zoXI+gsjcrdi8kxWTcPHcmOY6D3kGNXhtVo3OSOFA2PqYjHROJL/bKTpHSU3Rfd142pr75EOLLkjRpgOhUzWjLoG2Z+c6rQPxOurfmrd5m40FHun+m12Rov8e5/QTNZcy+4wc02WREgeQo+ZccjmM6/EI2lFdqKWW8EIFcGkS6Ls3+9stSGmlYQxYZexbwMtgnmucgf7/RTwm+Hoz8p3MyX/9fmAR0yoTv2B9LRUEKDRVTqinFt1/oSE2SEc6l/fNGf67WH0YrNzqyGEHriHOhEO/yDFQR8p5OsNTRSuV8jmz+wX53fXaY8nK1P9LT9uz7rRf5bs2LxuZCzFxxhvSjMLaT5zSf3uv2kLqAbvHJqY1EmT1hJSXM4rn153ZOFbVQY0exd1BX8J3EaVcGQ6Jh/gijBm2O4PwU/6dIFexzYdaqiQIUAt1ea/MX5Jdzq6UXYdvQ4raK+IScDmyL5uqQ0LLdFlQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(2616005)(186003)(83380400001)(316002)(6916009)(2906002)(54906003)(86362001)(15650500001)(5660300002)(7416002)(8936002)(66446008)(41300700001)(66946007)(64756008)(76116006)(66556008)(91956017)(66476007)(8676002)(4326008)(71200400001)(478600001)(6486002)(6512007)(55236004)(6506007)(26005)(38100700002)(107886003)(38070700005)(122000001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?P08bzKCFIiaSQRclxruTZnoyEvp5U88jb5wfaUY0yeG+Ll4oF4rOtIV8ea?=
 =?iso-8859-1?Q?jCjUQvwd6FKny7pPzKF+yRR7uEWL0JufLfdwfCxJA3EqnNVkqpMb1uS7QZ?=
 =?iso-8859-1?Q?G1zfuCMY1HchDWK0+8GmaRnOm6PFrPG066nAnhOFHxEPUN4dB5Zd+R8Bkg?=
 =?iso-8859-1?Q?cWvms5EcomUUPaZ9i2ZIVokLwzpEv84K83CnvZdo2Ng5e86jzMXG806f53?=
 =?iso-8859-1?Q?e2Wjgg8dR3FiQQu56sxnn5CxO52hy2vFDWiK6tYXfkoWYIyhO3KL1JUeyF?=
 =?iso-8859-1?Q?7n9SSezt7wDpU3n+F7kmDNVjy+b201+BAk6l9ZEQAmfTvOEkGq8RU9lVBl?=
 =?iso-8859-1?Q?3VkFuPPCzQ5AT+lUUuq4i8cmHTEy1Y+LVn9fCTzXsfwb3KpZC1LSPAXTcs?=
 =?iso-8859-1?Q?QrD2YYkBsfS3Y92fiVrz9ut2NkrZIV9CIjvEe3aRf84gd9Hw5wJPGrcQY8?=
 =?iso-8859-1?Q?36uMyFb+tSVvwyaxheLMUFatVA1TorLqlCDx7YfwP4LYhnKv6ulaYVBo5F?=
 =?iso-8859-1?Q?Wd7C5T5KMJYVGseTUJeTvslVpgmE4QnUvQWgOfAMsvX4wK0EUU0/E4GRvE?=
 =?iso-8859-1?Q?AGyXq51Xa3HrAM2OqZob8IF1MiKCipWIohckhxE2+RwrS54tf9yYja08Tt?=
 =?iso-8859-1?Q?KukVL01k3Ehyexc9e7kof0iuhmfFZrilh3mgU3N4+ErpAtuRexWdhXRIp1?=
 =?iso-8859-1?Q?8mNc99Ja1xUNZ9cJ+Xmj+Nq8lUQaip7/SW7hv4dktaLsMP/WnUAfml8/LJ?=
 =?iso-8859-1?Q?etU7GeHGTcuc8BHoF6PvUFMehfEGdN7fLGit65mM2H9ESZ193zblb/eAUy?=
 =?iso-8859-1?Q?7nJykdKHfEmMy+QxGmGjvs4Tl38/PCjKusoLQS6PtUwQ+s4sukH5o5MwZU?=
 =?iso-8859-1?Q?fxB68JXjlacfNAmECY3DZ9AeBpLfCGol698sk701G0S8DkrToNAbdKu9Zg?=
 =?iso-8859-1?Q?XMf/fOVjFvBLRGTkoxViocpURKr3yzi3Q0Fgc3A3eE7Z6UToMHBjlhO1Es?=
 =?iso-8859-1?Q?/yzlDdLcCmZJiwIYfQCx25umvnuwI2CE5P/qnCbTQ6izSDl3QJrFxv8wWA?=
 =?iso-8859-1?Q?B76o3JXbxrmfIx/4fOOOqafvK6doJF0iprTdhpEr3x06WMIvyAgyjmVJAQ?=
 =?iso-8859-1?Q?934A5jj14Z9TuehzuqcWp4ScMfi3r/LrpxOYqpG/eZyiisMuEt1EGI6QRD?=
 =?iso-8859-1?Q?Qe9sRgFOi/pwjas1+xAcrNIVvJx2IKvxI3pIy0/DhhOKOa5GPsPgkNxPaW?=
 =?iso-8859-1?Q?T3Q9fE92RAjBgQ4wlywTJPzWj6sXtlGzxPBhiDhB0VYOokfhNIl9NVK53z?=
 =?iso-8859-1?Q?Z9qDmEL2qdwgRJI0zvoDaijvuvGSSy5iJ+MPxxLNtAUAq3T3oBHzgvvUcQ?=
 =?iso-8859-1?Q?khCYOtoNVD30qFveQXCeNFnii8OFGPRL+Nuv5GyfDOHWg0TSYM7AGvf8HC?=
 =?iso-8859-1?Q?lRFgv6RuPTfhJDNW1+AWM/G+WkU0KnvwTOrrOz7KT7eMPMCqROjHZKW5aA?=
 =?iso-8859-1?Q?2QRWhbkPMexiHehd3v26FxZTcp7xDh+RUH0BdGjWEDl9jL92BxNodooR4/?=
 =?iso-8859-1?Q?nXO11vqPQWGbk4SudBAVt4I6vzG1YYYkXPNUFYJzfXx+I8vvHkYCekzab9?=
 =?iso-8859-1?Q?D/J5KKQ+aXicAgPoFjVLW/WAejSx2mV6W7FtMZKsxRLsqG251ooxIdeg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fac4072-27f9-485b-450d-08daa84f4647
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:45.8024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKv07nvPWAUChbuKX5EaogbLCenr8BaHj3Q5dBJMlUwBgnULZKL7qvYh0Ljx1eVBxjdg1fwn2j4mulXhVwCONA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7159
X-Proofpoint-GUID: bp1UNnI6Y8_w1v_bQZo29CAGgcls6R9B
X-Proofpoint-ORIG-GUID: bp1UNnI6Y8_w1v_bQZo29CAGgcls6R9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=466 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

While a domain is suspended its watchdogs must be paused. Otherwise,
if the domain stays in the suspend state for a longer period of time
compared to the watchdog period, the domain would be shutdown on resume.
Proper solution to this problem is to stop (suspend) the watchdog timers
after the domain suspends and to restart (resume) the watchdog timers
before the domain resumes. The suspend/resume of watchdog timers is done
in Xen and is invisible to the guests.
Just before the domain starts resuming the watchdog timers are programmed
with a new expire value. The new expire value is set according to the
last offset provided by the last hypercall before suspend was triggered,
effectively restarting the timer.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/suspend.c  |  4 ++++
 xen/common/sched/core.c | 36 ++++++++++++++++++++++++++++++++++++
 xen/include/xen/sched.h |  7 +++++++
 3 files changed, 47 insertions(+)

diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index 987ba6ac11..d19545744f 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -128,6 +128,7 @@ void vcpu_resume(struct vcpu *v)
=20
     /* Initialize VCPU registers */
     arch_set_info_guest(v, &ctxt);
+    watchdog_domain_resume(v->domain);
     clear_bit(_VPF_suspended, &v->pause_flags);
 }
=20
@@ -162,6 +163,9 @@ int32_t domain_suspend(register_t epoint, register_t ci=
d)
      */
     vcpu_suspend(epoint, cid);
=20
+    /* Disable watchdogs of this domain */
+    watchdog_domain_suspend(d);
+
     /*
      * The calling domain is suspended by blocking its last running VCPU. =
If an
      * event is pending the domain will resume right away (VCPU will not b=
lock,
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 0ecb41cfe1..ebed0ec49e 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1616,6 +1616,42 @@ void watchdog_domain_destroy(struct domain *d)
         kill_timer(&d->watchdog_timer[i].timer);
 }
=20
+void watchdog_domain_suspend(struct domain *d)
+{
+    unsigned int i;
+
+    spin_lock(&d->watchdog_lock);
+
+    for ( i =3D 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
+    {
+        if ( test_bit(i, &d->watchdog_inuse_map) )
+        {
+            stop_timer(&d->watchdog_timer[i].timer);
+        }
+    }
+
+    spin_unlock(&d->watchdog_lock);
+}
+
+void watchdog_domain_resume(struct domain *d)
+{
+    unsigned int i;
+
+    spin_lock(&d->watchdog_lock);
+
+    for ( i =3D 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
+    {
+        if ( test_bit(i, &d->watchdog_inuse_map) )
+        {
+            set_timer(&d->watchdog_timer[i].timer,
+                      NOW() + SECONDS(d->watchdog_timer[i].timeout));
+        }
+    }
+
+    spin_unlock(&d->watchdog_lock);
+}
+
+
 /*
  * Pin a vcpu temporarily to a specific CPU (or restore old pinning state =
if
  * cpu is NR_CPUS).
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 7a4aef4c17..00a939aa01 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1025,6 +1025,13 @@ void scheduler_disable(void);
 void watchdog_domain_init(struct domain *d);
 void watchdog_domain_destroy(struct domain *d);
=20
+/*
+ * Suspend/resume watchdogs of domain (while the domain is suspended its
+ * watchdogs should be on pause)
+ */
+void watchdog_domain_suspend(struct domain *d);
+void watchdog_domain_resume(struct domain *d);
+
 /*
  * Use this check when the following are both true:
  *  - Using this feature or interface requires full access to the hardware
--=20
2.37.1

