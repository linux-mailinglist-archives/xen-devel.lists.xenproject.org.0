Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792055F76EF
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417679.662377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf6-0004kt-FQ; Fri, 07 Oct 2022 10:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417679.662377; Fri, 07 Oct 2022 10:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf6-0004hF-8M; Fri, 07 Oct 2022 10:33:00 +0000
Received: by outflank-mailman (input) for mailman id 417679;
 Fri, 07 Oct 2022 10:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf4-0004P4-H8
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:32:58 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67b15eea-462b-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 12:32:56 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2978PmIP009910;
 Fri, 7 Oct 2022 10:32:52 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k20nb3gbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:52 +0000
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
X-Inumbo-ID: 67b15eea-462b-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nji8sgQVDFoYdVS7D59XeJzOXytmaboxA/AQC//E6hJVYChU9wDrdLlze0lWmqvgf0M5WvnrGCK7qNMokKM2GIoS68sK6eCpHmcIVupOtLMCV1IsoiVt5pjJ/OmtirjQJL2lHKQLhQKzIvSm0spMG++SmkayWBLMNbNRAIjHoYVCgpO7ey2pkYb38zK/W7Zz27RNPmlqn6d6VUGFXhACG8qDqpwbbGGrPqHk8/uyrWDw+Nl/LCF5FnLSvvjacDztZQ0fQCGAdntGielk9s10DgZPZwtQl7meS+ctR4LJ6VlnXkhyha3uwvgiDPEVT94puN2DQCUpxHBgS4f7xPVVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWGWtk0pmfF7m0kgIArpsZXfKqkLRBi7vbupwpett5o=;
 b=UMEnI9afaOOtRp1+bBHZjTRI9RQj4BHTaMJff15HlINQwhrdQa7GQ1MhQaTmjcpxx6KOvul5aCH0u8PJmbD6rQMvQ2DWv5Ak+jf1Wvb26OfuEqgFLzbwujXeRBskJZnrHs9yPd5bMv7lPCexqWuTEn9iSS7qpYMh6avQweW7s12ijgkAdG+KbcUtshpS/dMhxRKqvrGUJMuEN90rK0tQWDjzN+UHNXAMsRl2TcxgwR+LL6mpObazAzywsFBeYCtttalDFginrqnwT8l43ZYdnkTSTq2Bpa07ugxyF/IbmDO0bdWPRUUcmFkAiyuDgZgWIQx8MsdC2tIOVFgVBfirCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWGWtk0pmfF7m0kgIArpsZXfKqkLRBi7vbupwpett5o=;
 b=FEoEpqRXxBw7u8E/YC8ZK1oZ3E8Ir6OZFruTjrDsioOQs3Y+bpZJ0qsoOJQ7zlzBoPhzYmE2gD73tklIMPq0rwtZIVctV+OnMih6AqOEUGHewi/GM/+60VPDPW7DoGPXzZURQ/ykOhJZAvlusyOJmbzqQN8KxwfyrEcIs/7zLVPcdAbhsIMQPkgdaJ2tRgc9ojRLsYbJEnroRHwY6hhvM11RmL+eMV6g/Ftvew8w1tBaQG3Ba92J4ccZgnYPPycpZ8yJsE89p0rJTG1snTn9jmvggBaEldhFhC23vOg8CcHXPuAF31YUzLqIzXocczTDWF4IpJROPhdLSnguwZnAMQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mirela Simonovic <mirela.simonovic@aggios.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
        Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH 04/19] xen/arm: Trigger Xen suspend when Dom0 completes
 suspend
Thread-Topic: [PATCH 04/19] xen/arm: Trigger Xen suspend when Dom0 completes
 suspend
Thread-Index: AQHY2jgjmweWbQ547U+QMSraGkbOEg==
Date: Fri, 7 Oct 2022 10:32:46 +0000
Message-ID: 
 <91765b9f8442b51898ed38cb6964017322599110.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|AS8PR03MB7159:EE_
x-ms-office365-filtering-correlation-id: 5130066e-054a-45eb-1a27-08daa84f467e
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CJz+VB8mBUMPxYwezfGwMP8ce/A0uUr1UBhWmf3bQoU5OqaLGMMDXhLgh584GU3Tyo/7Z1oQQBKvYtU67vl6UPOwO8j5/tdJT1pSQ52bTXzfD4paGWuU/oG9c5/DA5ORm9bmi3n7L+63ULwnaA1kQ/uApLVKXPKJVrJEVfqTsi57isSUeTVr+rsh+qy/NGxZlCW3BW62g/x8z6ZKlXndgPiHpIG8RztRmAMgnqEZCVwmJXJMBV60onOWbmDzFcSlpPn51WpMUS9d6gNX0BFtyiHFZl7tK8Fc/6+o/c8z+u0iLIHgPPAkG42MJE4Pi7jtgZudLSBm2tD5gK70iiEA6hkPb/MPv6za9S82N2q4tq3D60nonOMcFLLXK6AgL6PztcLF9oRj6M4sNUAz0x/DjZ3y4mursWJ9lY40pn6vStO/V0AKOg+/KpvrBXUEUKOcT4WpMss5sLes5l563gtaVT93OaFezpb4TJhoQyUxwP8pf2KKQvUwdTUuT78iE6x0UgaVhRCPF3m9/slNdE1IBn8sAIm9EBQXSge7CD7kMcaiQqiXsIDXaRZTsH85pKg6C/dovdM/MgEWqkKklmZb8X3Ns0a1GTwB4qloCCS9OGZWTiVx1potgWyFqJhF2Uuhpl54KJPuUwi4g1oGNzp5RtZgVDskpHxtdRmr18dYFv2YmwNGGbZQ7athNsWD50fnyE93C9lRk114Mf1rhpBg+2vcw6DD2uMWP7N9AauTvBqWgu5NjimG/CQHbXU67rXbnDx08CQUSCnuWJp2HGRg2Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(2616005)(186003)(83380400001)(316002)(6916009)(2906002)(54906003)(86362001)(15650500001)(5660300002)(8936002)(66446008)(41300700001)(66946007)(64756008)(76116006)(66556008)(91956017)(66476007)(8676002)(4326008)(71200400001)(478600001)(6486002)(6512007)(55236004)(6506007)(26005)(38100700002)(107886003)(38070700005)(122000001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?tFFzMaRT5sSFXTWOw9kb/1JB7pUls6eQLxU1PoAPIC5kSWaUZjiSgtsQ7y?=
 =?iso-8859-1?Q?ZaLf3TBgtO8S/yPwiElXuHhhab1QElQnUYvn7tIm25Rw+9AWyuQEMoipfS?=
 =?iso-8859-1?Q?Qz8Hk6tUtguiRTIPOeKxrOOao8HUQxJJm7k0kIvv5XsdJCtMxTJGSmyGFE?=
 =?iso-8859-1?Q?Yi60bTulu+BYlGztWJ3Zg9Pau/Smqp2d7k14HS5RVzREU5hmvi87F3lysM?=
 =?iso-8859-1?Q?D3mqOVGqNFBT5sRyNM5IIvJtw8uGFlkfFBysi71C9cWGYj6n/biY22rX1D?=
 =?iso-8859-1?Q?OqDSL8JHbWdqX1byspzrS8Wke7UFo66kTVxr2KJHbC9HqFyye/O3MMm1pM?=
 =?iso-8859-1?Q?oY/SrLG9e/SnowSyApo10rm9Y4OAPfF0121bfOGbjpvkLQ3qzC4USTJg+E?=
 =?iso-8859-1?Q?O6vQinJr6rppMqu5wVUiETKqjaGlO62/mKGRT7UZztMuSwgI8geTtdVP0j?=
 =?iso-8859-1?Q?MKhvaR8psOf0tTC/m3CCP0srt4a7fUQltfOYcd6whVfDcGRnPBNbgsqK+u?=
 =?iso-8859-1?Q?qeAkfuEJBwQAcC96V6Nda8uEHmS6MpIrHEM3g4TQkvXyWMgBf82Bqf0R56?=
 =?iso-8859-1?Q?phnfbZatzSJa5UjKlbmjcdm5TvriexMOZ+L/UVo+dWpgK+R1ZRTDkWuHKu?=
 =?iso-8859-1?Q?8jJgJ1NqhdttEeNkz6G9zYHmfbu8d41d6k5bqm9iA532ychmrK5ezuusSM?=
 =?iso-8859-1?Q?enm1uhJYP6tieRuuNzU+iO+e5NnbnEM9KJLxv2Rkuy6gBYi2pDdiJfANV+?=
 =?iso-8859-1?Q?JOxusLa5DqtJAOe+Q3m5yPcGFAVgjzYP2VrmTROPWv4ynr8XpU39ZW/TMR?=
 =?iso-8859-1?Q?LaSDkYWPNfa1/o0cagueDWAKO7iGlSZA/D+/oTedy+SwMWeDbCpFg621gX?=
 =?iso-8859-1?Q?B13yHL11Slw9AzJ+NVrWUyg/Xi58+dj1roitj7vhc0SofU4sF8BYpBtbtD?=
 =?iso-8859-1?Q?ZHa+wnnM+qdwQQMjDVlLEqK8rCP5AuuKyUtv5yzfZ4StkAcKLz2RfP5p67?=
 =?iso-8859-1?Q?Bq1k/acR61Y9iu+p0zno0xdCygcL0avf/B4e9+E0HOEGzxrhpdKwGEIkOX?=
 =?iso-8859-1?Q?rqXgmt3XiWHHd5yxIDIW7ekXpV/H9bCi22VLSrYMKEUsRrs1qCIsXtNZVZ?=
 =?iso-8859-1?Q?JRJ2+q2AmPmhGS5Rcia/qH/g6rGKQQj8Hvv9Ro72ilyHz6URV2oSKy6L7K?=
 =?iso-8859-1?Q?c+UcLP0UqnPLLPq410o/unUIfDiGBC77XqQCFvqKv6fe94Zf8UvsbK3/l2?=
 =?iso-8859-1?Q?vImMSdKl/usdhcc5jNOzeiUDhaQCdZyQWPcn++ry7TA82411XfdZMHzCfT?=
 =?iso-8859-1?Q?7Z5z2YVT6H48TLg1n5NbE1CsvdQLQqR3bkzTdq3zfPmn2VPah9TcQETLtD?=
 =?iso-8859-1?Q?dZgQFtrsmfRj6sslbhWFAnYotAdrghUe594CI8duNFLx74Pw1jJIK5oXJx?=
 =?iso-8859-1?Q?eLSJsSWGuWIXW/gubd+cYYUrUyFj6EudxFzWJprHdZcbjI2oY5mK8Hzp/E?=
 =?iso-8859-1?Q?65xqaHYXO1SGAdrLs9J3THO+O8RnLA5cQ9Q3aPmRwFA634kjxQxVdWv0YH?=
 =?iso-8859-1?Q?/VmyD4l9KxVptNHll+Hzp5bVSuicMyF3/WWPPDbrROP+gbfmr06GGo2NSZ?=
 =?iso-8859-1?Q?fD846Nst4VxTPCStthfMZMtp/Y6RMUh8Ua0YkipdTv/HcO9PEYILWwVA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5130066e-054a-45eb-1a27-08daa84f467e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:46.0836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A/R+JJWo/dNw+uXTE0DN7YxyYXuXo2qnIhlnCUgzQDt94NYWwRVhBRindbFWzIqgjgscpcI+ceLFYnDI6MAqVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7159
X-Proofpoint-ORIG-GUID: FqDNsun8YiYvn6SP3Jw4LnqLHTHLy0XY
X-Proofpoint-GUID: FqDNsun8YiYvn6SP3Jw4LnqLHTHLy0XY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 mlxlogscore=979 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

When Dom0 finalizes its suspend procedure the suspend of Xen is
triggered by calling system_suspend(). Dom0 finalizes the suspend from
its boot core (VCPU#0), which could be mapped to any physical CPU,
i.e. the system_suspend() function could be executed by any physical
CPU. Since Xen suspend procedure has to be run by the boot CPU
(non-boot CPUs will be disabled at some point in suspend procedure),
system_suspend() execution has to continue on CPU#0.

Though it is not clearly stated that the PSCI suspend call should be
issued from cpu0, we assume that it is to simplify the process. This
assumption is based on a fact that most platforms call some form of
disable_nonboot_cpus routine before issuing the PSCI suspend call.

When the system_suspend() returns 0, it means that the system was
suspended and it is coming out of the resume procedure. Regardless
of the system_suspend() return value, after this function returns
Xen is fully functional, and its state, including all devices and data
structures, matches the state prior to calling system_suspend().
The status is returned by system_suspend() for debugging/logging
purposes and function prototype compatibility.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/suspend.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index d19545744f..b09bf319d0 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -132,11 +132,20 @@ void vcpu_resume(struct vcpu *v)
     clear_bit(_VPF_suspended, &v->pause_flags);
 }
=20
+/* Xen suspend. Note: data is not used (suspend is the suspend to RAM) */
+static long system_suspend(void *data)
+{
+    BUG_ON(system_state !=3D SYS_STATE_active);
+
+    return -ENOSYS;
+}
+
 int32_t domain_suspend(register_t epoint, register_t cid)
 {
     struct vcpu *v;
     struct domain *d =3D current->domain;
     bool is_thumb =3D epoint & 1;
+    int status;
=20
     dprintk(XENLOG_DEBUG,
             "Dom%d suspend: epoint=3D0x%"PRIregister", cid=3D0x%"PRIregist=
er"\n",
@@ -173,6 +182,31 @@ int32_t domain_suspend(register_t epoint, register_t c=
id)
      */
     vcpu_block_unless_event_pending(current);
=20
+    /* If this was dom0 the whole system should suspend: trigger Xen suspe=
nd */
+    if ( is_hardware_domain(d) )
+    {
+        /*
+         * system_suspend should be called when Dom0 finalizes the suspend
+         * procedure from its boot core (VCPU#0). However, Dom0's VCPU#0 c=
ould
+         * be mapped to any PCPU (this function could be executed by any P=
CPU).
+         * The suspend procedure has to be finalized by the PCPU#0 (non-bo=
ot
+         * PCPUs will be disabled during the suspend).
+         */
+        status =3D continue_hypercall_on_cpu(0, system_suspend, NULL);
+        /*
+         * If an error happened, there is nothing that needs to be done he=
re
+         * because the system_suspend always returns in fully functional s=
tate
+         * no matter what the outcome of suspend procedure is. If the syst=
em
+         * suspended successfully the function will return 0 after the res=
ume.
+         * Otherwise, if an error is returned it means Xen did not suspend=
ed,
+         * but it is still in the same state as if the system_suspend was =
never
+         * called. We dump a debug message in case of an error for debuggi=
ng/
+         * logging purpose.
+         */
+        if ( status )
+            dprintk(XENLOG_ERR, "Failed to suspend, errno=3D%d\n", status)=
;
+    }
+
     return PSCI_SUCCESS;
 }
=20
--=20
2.37.1

