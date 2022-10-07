Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF1D5F76EE
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417685.662436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfC-00069E-LD; Fri, 07 Oct 2022 10:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417685.662436; Fri, 07 Oct 2022 10:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfB-0005pI-Uy; Fri, 07 Oct 2022 10:33:05 +0000
Received: by outflank-mailman (input) for mailman id 417685;
 Fri, 07 Oct 2022 10:33:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf7-0004PE-Aw
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:33:01 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 684366d5-462b-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 12:32:57 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2978P176005817;
 Fri, 7 Oct 2022 10:32:54 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k2a45sjk3-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:54 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by AS8PR03MB7159.eurprd03.prod.outlook.com (2603:10a6:20b:2ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 10:32:48 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:48 +0000
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
X-Inumbo-ID: 684366d5-462b-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFdeaqti3itEfcRNOl6e2Xxcxqwn8DhavTcQNLU9ztKarmPjEg1Yk9mGfwjPN7/Zi5Ft3MvizZuQH2f5Kq+F/P30yUQz39Yftr53LoMVPnkE4toYmctHqdM8y2uX2A/WuWHnGS3COD/K4pjuZ1YL8J1kDGVW1k+H+Uyt2QFc7y+eCN91Nko7h+YzOvk8BEV0DbORoJ2tqd2M7j9eaeP8d5NwDG0EqFovC5+XW8S0fqdI3Gr9gWAak8u8vjSeEpuD2j9jI+Hpr6VdQMmrt7HGnuhoqwiAxFdiJYFDGL5zCoABSlkU0ZDWQM0aUaAfDxNUhs8xIdvBpQfH8EFx8XA7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuYmDBIoJgpH/JRiy2BHsIcRVjjzqDnzn/1O+5H48U0=;
 b=OSNDEGUQVPz1HG4nEXlGTSRs3xXX4fvL50TcYrBNTprUjNpt31kf0xP9E6yS5TIQzkWu/KMyiYF5HogrE42AViDmsRXGfaOf93i9c3AS9cAe4ZJeJDsC7r//Y9QemIpccrqBqBo4TTf8pdRmUFJgPn3fB4+uwx7Z5jjM5/MF3CBiM+uiocWilko76DGJGd10wvComcO3uO5k0yWt4hU8ixrFTmm6jffDoGRlMg2Ajvh+9TB2+j6QLqNDEfxzvFUXOS0aFP47/EF8me/eoQ9Jzdp9rsS6Qa8ufZHIwFhzahCUDNnDQkSodo2exuLefRSiWVeKGljxjCsDlTMYSC96Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuYmDBIoJgpH/JRiy2BHsIcRVjjzqDnzn/1O+5H48U0=;
 b=WTFmHyrGr5jgTmtRS6mjUXIULunnRKZjUGweKfGlodGakkHMXwUXbDq8JT0hFdL9oUw/wnbNWz9pxiBsYOJeURjkeZxtlDp1oMQKbCt1UmvcfLxiBGRx5y/W0MBXiaHojwTAgeJQsoIExw28KwVHv5GmzihU3P0IU6WQoOX+EX6lvARYIsBd8Hnk3N9ka05YtGat9lTUv3QbXM4qXmDRFVz/G2Syf0Z1f9IEINUt+IukgKHX+bkQERuHVSRq0RNgDreBsH/zu6uxWy/TynH6fbqBhE+UB3SCieyPL+3r03WjhcDDSP9cK/qecwJs6iOnwUMhBJdR4GY/eQcHh6Vqlg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mirela Simonovic <mirela.simonovic@aggios.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Subject: [PATCH 08/19] xen/arm: Add rcu_barrier() before enabling non-boot
 CPUs on resume
Thread-Topic: [PATCH 08/19] xen/arm: Add rcu_barrier() before enabling
 non-boot CPUs on resume
Thread-Index: AQHY2jglpD72HLvPXkazM/pUUGVcBQ==
Date: Fri, 7 Oct 2022 10:32:48 +0000
Message-ID: 
 <a90d2b9a33dbdc90f2548757bdd4173e1d711d36.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|AS8PR03MB7159:EE_
x-ms-office365-filtering-correlation-id: 4b355dce-514c-43b2-9f36-08daa84f47ef
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2brLCYMPIDM6H7Si2jQH3EDNS7xRZ4iyWDElak0CIcJ0K+yaOzb7Tbfi0gLdkWfNf7czbaMmnUoSYOVLDYa/Ul66GDyfd8QCnSidUTDsjTx6EDxbCP5ZO6K3VFMQei17LcyG6ybi7Vqjptz/xYVslX9R0L11DQMP58+XD35TzAKXG1Cw30uGzIqPJ+EG3bvdqRSlkE1qlnP9GYmkizPEczhFMkNCGvztS6H1sGHalIOz7FXEjRK+Ce1wk4luiz3qbM5LHoyrYc5Nf8Q2sF5qtgdX+kA1zU5ILtoAATZiUaOEkCWUFJnPd/wF3TDalX2SQeiYTDB/KGz4orw9I9b1qtcrJDAkazM1M3+yz7gSsL5DF591vra6wkye7JfLJGA5z0vY9sRZ2HnGjQrgWuDDlX3b4ALJHUvHOVlyXItfmZO+bu6PTt5QziGyNSb2HZgY+ZlDci9ytmkqI9w1Qcx7xUbbB9D+8NFfKwXaYXkHLjmF1KtZvX0c97XU0Iq1DemHgIqa9uxoh5i0eU2f1A2q47rY3kTkdoK/7Ys/eD9ERe0sTg3GVD6+UCz6Mh/azHY9OYANjO2Nzy4BcoCuMuZW2QG5Gn9uX/MqisoscHIgjn4q6ESkjIEWwB6mZLVFPBkFglxN2G62nHwRfPDUazcxdZCDyGxbjrDTzewleFRIf5Q+P0K79uxJ/0GXhIrwuEH46x78lukgDYbw2UvFaGt7uN/8hE8p1WPIPtPbQ8MQmszilBSJsxfL8yEZNGvZE9SymdncllD8XHmVVTfz+7sKag==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(2616005)(186003)(83380400001)(316002)(6916009)(2906002)(54906003)(86362001)(5660300002)(4744005)(8936002)(66446008)(41300700001)(66946007)(64756008)(76116006)(66556008)(91956017)(66476007)(8676002)(4326008)(71200400001)(478600001)(6486002)(6512007)(55236004)(6506007)(26005)(38100700002)(38070700005)(122000001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?9G2X4luU5HNC1vdw42kR9wYXYmQ8w9PjgRRE0vFfCycjkqNAKWtp7o0VXr?=
 =?iso-8859-1?Q?GKgTM7FVpZykEz3pkswk21mQkqgMUEsoiR1IJxnnagbfRDEbFpd1Izdhwk?=
 =?iso-8859-1?Q?djYspja46AEu24mZxrp/wbmg2bYwczQMhECTrF1VgfDD3+l6W1MdcH/p/o?=
 =?iso-8859-1?Q?PIkdjsCqWR0zmWJ5xGYuTVMmNHuCV7/6UR+udZNG5bLwNY58LBUKvkoazo?=
 =?iso-8859-1?Q?zPcf2poqTgsre+Y4XZe0Ke858DqvtinXDkrov7aEIpybsoq9IcPWVKi4rB?=
 =?iso-8859-1?Q?Hv5J131+nXkc5SF4AodAx2uGuPrPgIqqCaL/3+aNvU2oPhETlGzbKvm9gZ?=
 =?iso-8859-1?Q?4PiSrUm8vyDQlkUQUkRrkN3vh0VeSYqit5Z4w/wPaicHPLif/wDPLEMupF?=
 =?iso-8859-1?Q?JzQZwObP6sDrfVqHwp3gbbMU5gFBZVN6X221U7rLPg8RORoQEJfd/PEU+P?=
 =?iso-8859-1?Q?2WaO+AaJ4WRgxGtaIV4XuJ5VhoYwsP3xQk524K8/fE2rvnnjO0vquuCIN9?=
 =?iso-8859-1?Q?3BUpjWUA60fy2y75stAjfhbCnex9FARbEp27PJCEZT66QZzqlMUoi9X4/W?=
 =?iso-8859-1?Q?09Rre7BMZQgPXOPgaYO00HqpdjSg8cbvf1PtjxPkLUxoQE8N7OyKaWrkCD?=
 =?iso-8859-1?Q?V7bQxVuVz8CY9UTBnNnOuN3PCJ8/2ye9P5U3tr2zXax9q8NYKTok5K1IO/?=
 =?iso-8859-1?Q?4OAxQtM72K3BsX0wFKqLxR4ElO+//Akvzj/5crfc0TDcaK7NuXEl2znOXw?=
 =?iso-8859-1?Q?vksZRi9CYpocAirpRhJeVIZZaq5FThD4PxNNUfJbOFHm5FiG00M70opyUw?=
 =?iso-8859-1?Q?JUI469ZgOJjH1s2H+4PLYh8GO3Jdncys/qs1PI3IgANGgsrmiP0j84QK5z?=
 =?iso-8859-1?Q?ahBZJA3LwFzgxQMj2aETaPlPOaM2EEc+WCS3HCpJViMFLZ9WiAMfMFNZlh?=
 =?iso-8859-1?Q?XICvbmAywfrQCpVbOdjj9aU0J3hOpsQgtggwbONKA8qJdP672YLo0PrWu+?=
 =?iso-8859-1?Q?fEJ3XOPTN1icfQNaMb4KHWgqAH7Xv0o74btBgmWD6bPWF3cvStFApTFiSg?=
 =?iso-8859-1?Q?f8ngrEnRAFn5nc6l+cwlsRai8pRMO2zizx0JD0ulEbelOv9DNG9pTkuUPI?=
 =?iso-8859-1?Q?DFGIXk8PRwWrSGf4bBhgcpVViYGnDNzatwZL9pTa3UgrKxdvtO8DzGVYhc?=
 =?iso-8859-1?Q?liGnuQ/Noz+8Rm5M0rpcj8wfk2i375QV8igV9HQ79bJ20bmK65pfrdU3LG?=
 =?iso-8859-1?Q?EhrOCPWVhOuPp13gYjuvOg6CXDCldsthsp10JTTyFU6jEUNhEuEICNVBfr?=
 =?iso-8859-1?Q?t1t9Eo6/nKxQNn2MfjQrns+mowbaFZ8D/BbZeROL1BknA2qzaO6VMAqHwe?=
 =?iso-8859-1?Q?VyJPRT/9Y8DM5C9O43Xmnx55OIxws5DhXdBe10LxYK2CxAy6XMg/Mwa2hr?=
 =?iso-8859-1?Q?PWpyoPAGCyPtYY2EArONXurJaGOBU+lYpRSgOaAfrAnsOrFBedZDG6I64j?=
 =?iso-8859-1?Q?6BArjhs8oIzdqxR+ORlTGTrpgG/MPva3vqfTYNVc/4olM9jNkKykKjDWn0?=
 =?iso-8859-1?Q?okZv3Kal2ejGZSE4tqYQ1z38hOFcb9BSBDFcv4gfeFEx9oCc4eJnrMIv3U?=
 =?iso-8859-1?Q?J1bNdyT1vyjWtkhVHnzKgkyBuSAv5bn9e9FLRP0LRlox64F78eZhn1BQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b355dce-514c-43b2-9f36-08daa84f47ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:48.6303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iey6AEfOmgqXlHWoceGEilvvTS8LrkfRjqR45aCkJZPpuhZTwWAjyzjB/SbHI5bM95acf/aFS6xCkb3BIrTmcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7159
X-Proofpoint-GUID: tUenzLSF9QuCFAX_e_2YfZi-e1nkPU4F
X-Proofpoint-ORIG-GUID: tUenzLSF9QuCFAX_e_2YfZi-e1nkPU4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=500 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The rcu_barrier() has to be added to ensure that the per cpu area is
freed before a non-boot CPU tries to initialize it (_free_percpu_area()
has to be called before the init_percpu_area()). This scenario occurs
when non-boot CPUs are hot-unplugged on suspend and hotplugged on resume.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
---
 xen/arch/arm/suspend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index 0784979e4f..0c16cfc750 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -153,6 +153,7 @@ static long system_suspend(void *data)
     system_state =3D SYS_STATE_resume;
=20
 resume_nonboot_cpus:
+    rcu_barrier();
     enable_nonboot_cpus();
     thaw_domains();
     system_state =3D SYS_STATE_active;
--=20
2.37.1

