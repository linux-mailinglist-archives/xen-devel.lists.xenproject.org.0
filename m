Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53635F76EC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417680.662384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf6-0004uG-US; Fri, 07 Oct 2022 10:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417680.662384; Fri, 07 Oct 2022 10:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf6-0004ku-KH; Fri, 07 Oct 2022 10:33:00 +0000
Received: by outflank-mailman (input) for mailman id 417680;
 Fri, 07 Oct 2022 10:32:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf4-0004PE-IC
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:32:58 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 676f392e-462b-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 12:32:56 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2978P171005817;
 Fri, 7 Oct 2022 10:32:51 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k2a45sjk3-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:51 +0000
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
X-Inumbo-ID: 676f392e-462b-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsOAfmerj3Y9pJgGOdn59yTsXDQowD0l0B1Ita4V5ZEH05KODP4jIiJFMStDcUgWpNvRwCbCTEjNcR1t1rb2U3eMwQPnwM80G2TBfQEAK858dgidRPBW0S9+J3XouDAbSB3ZscJm5gBdQ8b+VvYLcRAaGXdVL3lwauqgYEKeF1qkl68/LEolLOLA1eeL+s3Xa8hGgQCiZy03k2jnuvFTFYEYThWNBWMw0vjMDQ32zPD9A7sxkLKJ3KIhJfnC9uw4Sd6d2mACKbpBvj3Ztbq1EC1ox1Zr2KgPdTXssP9+bgsSCLMPIfg+2/9DXuKWn8sMC/p7M3bDbs3ikhG/lchjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6h6SHmTRfcgXQ7Yu2AK+J4nbsyl3YwHrisUBV1UF7MI=;
 b=EJ6Au0w0nhzf/SCyDC305K6Nr4eopsch3XkTN/d6Ol5l9f39LnvkWy7JGH4c7eQd2mEtAXs54nOXdOXyVC0YvdSGvgeRgsA2uSbsr41o4pCBLCWoxLJQmf68ltCLR50/1Z15k6fYHoExqT8zUYT5lNamfDC3IAbmJTwShjqCJqnLUEsE57qM4qTXca+rLu2CAXWBDpJ+dW6JSGLdhbvwfj8ultdaPv3MSyXk0u6FAQ/6GXMPO8WQz9oEAtHXgwPB9iJ9x77qoQjQ6/I2Ig1zFgiH8Q1FIQ5BpPQKQrIfhK5bnU5l36XRsLlCl7ce9E9rWlMOIiC4AQD2r7kfDLf9zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6h6SHmTRfcgXQ7Yu2AK+J4nbsyl3YwHrisUBV1UF7MI=;
 b=i8n68Dbm0ESA5OKzQpsBU2DrvBd+XQKb9gf1SxBxOZdPD+hXFW7jQR91/yAd7lajMEOeTJab5mY9gnaQbV0v3hLMrCsQxWCzAk58qn1smdc7y/9Ng6I+sr+m5l7wwWby9IbtIhj8PVd/VSAxy8Ai0lrxM60pBcVTOuuFsNCMI3bliST93s63WgxzV9HXTZwUKd/ddUZp1+f5jbUWrKM4+QP3bYEQIX37+IZrjYQUsYgksrrgA0Ig4EoSF01Aw/J/BYYPTs3u4jt672f89foZYX67VYhxgwi3LfP+y+lVf7XrnFIzeuzjSzp2rNOnRGAONjBL2/Da2HlsXYJ+22Q7gA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mirela Simonovic <mirela.simonovic@aggios.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Subject: [PATCH 05/19] xen/x86: Move freeze/thaw_domains into common files
Thread-Topic: [PATCH 05/19] xen/x86: Move freeze/thaw_domains into common
 files
Thread-Index: AQHY2jgjZkKcYQ550kmOPqD7DDutRA==
Date: Fri, 7 Oct 2022 10:32:46 +0000
Message-ID: 
 <931418d761e47eee7847e6bd559e02597cbab1b6.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|AS8PR03MB7159:EE_
x-ms-office365-filtering-correlation-id: ee9e3a02-776b-4781-b3a1-08daa84f46b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7I6ddO/gjyRoDQtiB9YQdE3yZkiIq9cJM1snMsvyPyUNnLj5y5wZQvOBSOSz0Mhox2gm7M51lZOzCT7b72YU5oDR6nQnco6ypdLlHkjrgmgmEV3++WKVqvZvFuBxs0r+HgvouBWlj6/HB1EuUnCCAKSAYh90htDtdPvIjFX0TZDKnf+Gqvy4nZ2ZLYpQFe5wrH33uOldmMMbk2+bajoEz9+1e5LptvEqyWwG3x6cGymDnDvFT/7Qz4wtwSycKLLWqScA73vff7IZXd/EHklb5oB92M1kW+h1N3dJoBGJbkDjD9zHBw8j8bf3SHHvYO3ixYpSyoNgvgRSP8DmT4PzR+9PI9cYjd4SFD/OhLvNplJep6WLee80R0sEgKKNVPRXP19S8ywcbeAZeoUmnz4EGce4rduMpoDJqAWMDVmxoT1zMw1aYBNDrf1tSImuQYDSBXb6O08/OAf38rwZOyKzhRqRXO+zif2688LcXc1E/NpfYq9Phqwg1w3q98h8p6elp/M7CWoDSA1T1H4KwzhQstY+S1ENwz6WKpnEzaH5Rc4Q+UoXRpdw4cGEP4jfFYsDi3DEvh7gwuynaANyFefQ5s7KK3IcejrzqCeRBoI+xBxcdya6aTlGdGDSFfEFDB36bUZiPYH3P+a4OBQ7zOpEWkIoVa4xz8zuls5U+ifqXDL/5w3oy4IP+OhblVb3MJzLKzHHdtJmpGFzqdEL6YyTddzoNd/7epGVcsa57NlvMFeruERZB07PRezE16KvbgO1cHgBosj/mUyugRB6DZUWvA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(2616005)(186003)(83380400001)(316002)(6916009)(2906002)(54906003)(86362001)(5660300002)(7416002)(8936002)(66446008)(41300700001)(66946007)(64756008)(76116006)(66556008)(91956017)(66476007)(8676002)(4326008)(71200400001)(478600001)(6486002)(6512007)(55236004)(6506007)(26005)(38100700002)(38070700005)(122000001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?fMIiNPj5PFCgdwZH/6GURDeFZJWarGfhBM5hJVRX6g4Sa8e88Pmfbx3rvs?=
 =?iso-8859-1?Q?jYs7sDCl0CDI6j27nDvCUTwHkdTwJRbRc/edk3g0Oazjq+M90d1OR1f1Sk?=
 =?iso-8859-1?Q?GElQM3XAt5P6XAbcoNtzqgPfLGdmGlElxN5mt8lzxxtZoaobR3ZNwKxCCY?=
 =?iso-8859-1?Q?8U77YD2sbJYBRKwpdpn+nwWjf+xn+EIJWQWmldKkSSY9snS6shw9uRUFzU?=
 =?iso-8859-1?Q?aSVapdhR40WOmSbTkxTLHG8flensjZm1I83vruVx6qGaXPevYFXpkAHSCI?=
 =?iso-8859-1?Q?tmHS1EHE2uyjJku1Te/UP5pVqDHUMFt1mkL+L64EJUUthG/535SmrYnq84?=
 =?iso-8859-1?Q?m1nMCJFIUrBUmOyLLL4JONP75QThniVX4Ll1VHHT0S1oPkD3pabMHEdj0D?=
 =?iso-8859-1?Q?PyYzhDijJVa8UDuO/Ff2cPNYqLEzQBpALJKS9qINls7bR4fP09r5u4FdU8?=
 =?iso-8859-1?Q?RUNAVLoxY03mbqubcr+6B4pgC6qn96v1qjdMg9ZzFXMJTjS737ZUkJtU7o?=
 =?iso-8859-1?Q?zRjG9Vb4sYCOndLCPpCk2Bn5lOL5xQjIgCr3GUnK0eaBDnpv2DiMuj4H6A?=
 =?iso-8859-1?Q?2rbGj72TpmxZ7CI1i+ieuPph7y8DNuyFyCmN0Z4fz/7AtTuDEJDSG8sGwk?=
 =?iso-8859-1?Q?YPrTJLTFNFj6dsd9JyTo9z0ziXsiRRjAPCt7pJU1K3kKMd7AV7L0TKF3aH?=
 =?iso-8859-1?Q?oMpB+FF55XEJZaeVc++5YfvUgo4rsXfxjWuKKpYfJx6ZDcNhAYVxW0XTDY?=
 =?iso-8859-1?Q?h7Fb4tcSXmcOP6sWwxB0/QdyxBUAQ99s6qKTwnMH42GQi5LvkLjbhDjEsl?=
 =?iso-8859-1?Q?8BnG5Hbxx8d+1irJ89CyOF0C8brhdTDnjQxwO4PalfLCKF+QJbAQOKF3Mg?=
 =?iso-8859-1?Q?FPz5wnd9KtnCOCz1dDzYtdLdWEcFAFT+x6wlsGEKP56w4xYr6XLKITapnQ?=
 =?iso-8859-1?Q?Y+dw2BbEXuDnA+13Ctumi+wAQUc1Nj68sZJDYj0c6OM2P/myarsm/Bs1Im?=
 =?iso-8859-1?Q?dVktG9g1AgQYY4HsEHUFqbc05sPGi/JpPUsQ55IkL+cH+u2OHGzROu1Lj5?=
 =?iso-8859-1?Q?c795OJcz8hAJxhfzXMBykis3BBe+/vEwpTsOpzTiuOWWVeWkf2fDDb79Ll?=
 =?iso-8859-1?Q?ma/DJT6y9uEltNhEBaPo9PxDrO2pAfg1rOOvTrxdrPnRN1CiiIusNEFX/7?=
 =?iso-8859-1?Q?LDUjl8SbsNd7DHvTqXTLWWoB/tsvGFJKFEN0WCWc6egKP9mQFVVRpa7tK5?=
 =?iso-8859-1?Q?7v0q6mkB+Z+gCIIUIniW70lUzWaIk70sRqDO/lqdmQ1035dFlezyjUmp18?=
 =?iso-8859-1?Q?FCcY2Qv/wvlEcFwFtpt+xuT7NQnwqLj7fFWtLJgYHEHFYzkHmD+PVeCR1G?=
 =?iso-8859-1?Q?FxYCrWLY71V05jm1tvsy9uHcFc97cb6OG1WTFOBU6BRnv8Ha4vw5DUfHPg?=
 =?iso-8859-1?Q?l9gAfLlJMaOAYl3bv9wIYWWCPVNQlP0Abo67pRxfzQOcuHZ5xYyeNahdZF?=
 =?iso-8859-1?Q?UZV6FgASUI0F7SHkXGCBg8HNclNVJxh6Ykyz3VyESn/Gl8O87VOwzE5630?=
 =?iso-8859-1?Q?HxJObiFFX2vkIK56TCK3Rm+E3VUWGey7xxIWeMHfLRLgrNhbww6HNfgh6k?=
 =?iso-8859-1?Q?25BvGoo80QER0CWSxDCuisK3A6UlyGMWQVJXCX+hUfadsTaYWHPoFDoQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9e3a02-776b-4781-b3a1-08daa84f46b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:46.4117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2lWP/oei1ghoYb36UEvrsNMdYzHRlzgt68FViXGwOjaYu6h2+y0L0Pmjd8yqI17Wyc2aoN3CZoHfpE3pKLoNhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7159
X-Proofpoint-GUID: 1X5iEoW9QqqBZwh0CemHWffGAEpZwUOW
X-Proofpoint-ORIG-GUID: 1X5iEoW9QqqBZwh0CemHWffGAEpZwUOW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=898 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

These functions will be reused by suspend/resume support for ARM.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
---
 xen/common/domain.c     | 29 +++++++++++++++++++++++++++++
 xen/include/xen/sched.h |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 56d47dd664..5e5894c468 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1884,6 +1884,35 @@ int continue_hypercall_on_cpu(
     return 0;
 }
=20
+
+void freeze_domains(void)
+{
+    struct domain *d;
+
+    rcu_read_lock(&domlist_read_lock);
+    /*
+     * Note that we iterate in order of domain-id. Hence we will pause dom=
0
+     * first which is required for correctness (as only dom0 can add domai=
ns to
+     * the domain list). Otherwise we could miss concurrently-created doma=
ins.
+     */
+    for_each_domain ( d )
+        domain_pause(d);
+    rcu_read_unlock(&domlist_read_lock);
+}
+
+void thaw_domains(void)
+{
+    struct domain *d;
+
+    rcu_read_lock(&domlist_read_lock);
+    for_each_domain ( d )
+    {
+        restore_vcpu_affinity(d);
+        domain_unpause(d);
+    }
+    rcu_read_unlock(&domlist_read_lock);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 00a939aa01..c8ddfdd51c 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -978,6 +978,9 @@ static inline struct vcpu *domain_vcpu(const struct dom=
ain *d,
     return vcpu_id >=3D d->max_vcpus ? NULL : d->vcpu[idx];
 }
=20
+void freeze_domains(void);
+void thaw_domains(void);
+
 void cpu_init(void);
=20
 /*
--=20
2.37.1

