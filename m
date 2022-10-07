Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ADD5F76F4
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417694.662523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfR-0000kr-GE; Fri, 07 Oct 2022 10:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417694.662523; Fri, 07 Oct 2022 10:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfP-00009B-Tt; Fri, 07 Oct 2022 10:33:19 +0000
Received: by outflank-mailman (input) for mailman id 417694;
 Fri, 07 Oct 2022 10:33:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkfC-0004PE-5X
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:33:06 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ca99de2-462b-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 12:33:04 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2978NNsj005811;
 Fri, 7 Oct 2022 10:33:01 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k2a45sjkh-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:33:01 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by DBBPR03MB6716.eurprd03.prod.outlook.com (2603:10a6:10:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Fri, 7 Oct
 2022 10:32:55 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:55 +0000
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
X-Inumbo-ID: 6ca99de2-462b-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T64OjVtm3V9WvNNZTS9emRi5y+HDGGsaqVUze/1lhYyxnJV/JoJXdkE4YXwcVA3B1B6Dilvgmn9GTycvLygx86ciLc12Sf92U5UAbOvgM/g6eqthlLMqvuuLE43zxanU6+0hixxRUBW4QmH3HwzrUb2JFvRd7cL3hxphchvJ7DA4cCXrTIOMJpE4TIyrVaBsH3ErtSfrcauifVOBsgwfVrwekJ6dBKOi4ZGpDa/RrArVFUT4Y7bVpPP73SmWKQHOIWsQXu8g4Nuu/u7tkL6EQxYUpyDFnaAOXJxhqXKRm+E+lM7PCc317e2jfRNXutVZ6WAxGE9Z6JIO5U1lUnVKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDUUqGmmMNAG4mTJPMtkYc8B5YGTFxvyMyBDVzdOMKI=;
 b=gq9WYCp/NbPM7Ly9nfE35SqGfK6BTRNTP4PVwQfMXrxly/UOMSUP+RqFtuLOXNChhE0ZjkEoQfaXNGjIsVGS14eNsKQ9MQjLCCOVPW83Je89tdX7bZ9c+W0mWrhHIufeL3hHM3SoMLNiWJyTNKN6S4mXkBH0VQqFPT8CK1kyYa16qt2Y1JOhUedlYqTtKUKM00kZsXo5aytc4qe/I6IZ0F5Cldp3FVI+jIOlxuwzNejQFX+8FnucdJyeO+bAchJYhLfBvPbHjjap7FD3Is3aw8BDDNW0hntSsOmCp7a5udeXIKtlA+a/t1ODFUJ/EcrzsBFh2YuAAJKLf9kM2e41DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDUUqGmmMNAG4mTJPMtkYc8B5YGTFxvyMyBDVzdOMKI=;
 b=gNSQRDAbomcm+RO+8dQM2qcZG24WpwwTMnYEa/G0lUVPeh9DfF1ef6F13BYgCmBv0/xdx5M0ILw9Nhq+fOrvSHDiZ0+glzDJoRrx/1m87DHfBO+vO7jDmNwHpCcutKgaYLKWD2gP/wK+2O9P5qxEemYY8RIwLyJop8M2RNELagHQCm9LWh6z1b9EeRtwfbYVBm+L17fOEgAG8zHf4ex8yCrP4NlHtXZbk2A+5/2URGF3Kf6p/o5IGYdhJAbs3B0uu7IinE3amsESsH+I/SGB4QwW/Pg1VLuhHNSBchIXz9QFtafpU3IJzb5S6vEab64tW8teb5QFdxGEPaNC2A67Nw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 18/19] timers: Don't migrate timers during suspend
Thread-Topic: [PATCH 18/19] timers: Don't migrate timers during suspend
Thread-Index: AQHY2jgmyMa3fIhJ3kaXCccflKz0UA==
Date: Fri, 7 Oct 2022 10:32:51 +0000
Message-ID: 
 <babd4e0c615c7f61c10b53ad884c68c85641ce7c.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|DBBPR03MB6716:EE_
x-ms-office365-filtering-correlation-id: d1a6733a-ddbc-4b13-7224-08daa84f4bc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qhThAvot0hZ2qZOvfHDhLVPIZcs55UpfR8kXvT6x2ugvG7MVe1DM1jDG9wXeKC72NKVDWWFsIq+QS55HoUuNhd6E1bo8jzPv9naf0lVVg6mN+hffVmLlCC0s7ZePWEkbr8jKTeaXuvZdnIKdlp5Gkoux5FLnvj2OuET7kic9SAxO3fV+sMARiBCgpSNtI8xOQtClnE10KgD6FMIFmdZEncPPe6o2e/zRRY/sP9sCPGkPJodMs3NgJHkyu+MdO6NtJL17+/YD30AkzBHp1hdS9amo+kdSxLD3/voUkq1b7ZwrZhgNDuKGl8ZhQ799q86PE0GeMcY+i+OfC1456ntZF9Y6X9b7f71TBex8+D85tawWz2gmRc41Vh0csDFm9lW5LypSvTGBnm9HPVDUHQQfPyBGNYJveA3zjygAStLCgytgusOTlOjiFBVnB9zFWpzM3GV77gnixh7hn5mdEeGMIviPEqiVVl/q0Y/Ls0L1fBKNzZOkkAU7U503Re5u8W+ncKtqPdSIfo8+mieZs4JEu8qn3no/o7Pe/0Us9lUZELTPMUw14nMEZqxLA0zq2N4ul93EKGgXo2k9QM6i3vLLeiCvttldS8f0/16VYdvY9mXLVxzHQEVSbHJqU4o+axxxTjmqczOIlMDSxoQAmHGur+/tefZxFFuCKeMF0/sKCyhzbCQS4WXZiFtvBeBKM+iswlw9Z8mkbsqQdJGjkEX7+DzHRcCHmcDOlhDzG0z6Ir6vAywDIR5x6E4J+kNOWKTkrHcye0tzmI+95dypnDJbDA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(2616005)(186003)(83380400001)(38100700002)(38070700005)(4744005)(122000001)(41300700001)(15650500001)(2906002)(5660300002)(8936002)(55236004)(6486002)(26005)(6666004)(71200400001)(6506007)(316002)(478600001)(8676002)(54906003)(76116006)(91956017)(4326008)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(6512007)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?VhxYmrOehPdgFlfOgQitxyCTq7wQF8+7elGwEDiDr8USCbijgnPI1g5Fdv?=
 =?iso-8859-1?Q?aZdnhzaTXOsehlZJ+hp9UMYxEo4RnzgUifjoTJznKyzrqXVXXNyNHk9QpG?=
 =?iso-8859-1?Q?RXQnUwGtfvcvJmeMz3AeL2+llhTLQ5a30sqc4+0NojJJsDUa2kKp715OYI?=
 =?iso-8859-1?Q?Vz780N57HiVNB5+SM712ZNw4FWlz1ayGupVDhBpkx4vuwzu24Lemx+VYih?=
 =?iso-8859-1?Q?AwcuxaTZkmo1uXIX0delVu1FM1CGxFTYh8MM4nY7UlP4OjqIIUxqEInuPZ?=
 =?iso-8859-1?Q?DSyEqkq0dgCq9gWijuuVPz0aozzlHGoix1MYUg92QaeCPxUmx8SC1jqcbr?=
 =?iso-8859-1?Q?R7zE5AsxTSqVk6VEDLtlar4au3jCO/NRV7RSKm147y5kK+lT7sODzHxM6q?=
 =?iso-8859-1?Q?UYROMZF2ZlautDoNsIbU1BIHsBh1vofh581jPOchFEmfJX3zMJIniJFApO?=
 =?iso-8859-1?Q?liUsCfBGPuLlrXaHExtRAUDiGkSafUEEC9hfvaMWLaqD/IEFbv1fSeEV2l?=
 =?iso-8859-1?Q?7Rp955xlQXQ7tFs3NzyrScx2Ke28J8TMCM3Zak9VzEPhB4acxXrS59ze2F?=
 =?iso-8859-1?Q?7mb1x1f+ihj+J+d77QCsiNSaVTJ6mtSfqdbmSdZY1nFOex6RQzIPXvq3RN?=
 =?iso-8859-1?Q?F6JZ/V2Y95z8GL7ZFbL2OTUJKHHwZRDwC2VhkutAirEJeP+uqg9ZzAWupF?=
 =?iso-8859-1?Q?n5gJsfBVyb4IRWdEn+AxlmzfWViA1L6c2lDTfnGrLkbKwZ67CXwSXHXeWA?=
 =?iso-8859-1?Q?LE5IU/9FjvyCk3A9NyWJDsERJHjCLkqYGnPBXPwOtUCnETMsxWO6aDKL1M?=
 =?iso-8859-1?Q?+EWRAk8zNMgFINzlnY6dnxfma/lyzZREykseNOvkXx5VhrjlM8NYXsryQc?=
 =?iso-8859-1?Q?4jCW9Ds7P4cdMN5bG8/h84k7dlIuHOsD1rxdVJOTqbEKFuF+6KIX/zDU67?=
 =?iso-8859-1?Q?p4pCyKKmk9d7qaHIpbQ7zxujlptlN3YN+86O6k3k2Of4gRY8Z4X4uwhfci?=
 =?iso-8859-1?Q?V035AYmWCwO7PPTgcIH7jBBaXRp0M/So0iPle2BZ0vaNw+hd7Gr2lE8FGN?=
 =?iso-8859-1?Q?igKtdkZsAnvJoNpH0VlXwMUK0XU4IS9sKfZqO84MILS78AXRtueIb8tOLU?=
 =?iso-8859-1?Q?Rt4YFnXgXb+j6YVMed+4Y2m3IoISey85ISAEugSfDaSadnQaibVu11yQjg?=
 =?iso-8859-1?Q?O2neYL7LUmOKllVqYyPaBXLOARIQywf4AfLqJg8kuDC1e7DvPrCgiGTfOB?=
 =?iso-8859-1?Q?VNSfO7LXBZOwPpOBxKtha6D7I352qTIIeDdp+GwDsMzNVVWcUJexHGtXVJ?=
 =?iso-8859-1?Q?R79r0FPahjL5czPmB19rCFLA+iNIOaVKeXuZcR3JDCXqmPIBiLgYDOJNfA?=
 =?iso-8859-1?Q?9tB4uUXOBKdab0tNuq4zNq4prBp1mMCTAnLqyMKqIoewH1uq3iFVI5YTLB?=
 =?iso-8859-1?Q?5Gh8Yb3IvDuBccUKdGH/lAwK+rFXep9q3CxYQ/4aOZMbL8PsxQUJ3lGEzy?=
 =?iso-8859-1?Q?adSe+8RjsJbnFBPF393SIU3DvmAqrg26XI7UgdTyHZuCPy7AIvzPlH6heN?=
 =?iso-8859-1?Q?C7rDqYm9RqOXFvPUN8tRmeeSNMf0UlFVKy25CywpGpfsFFC+Mn5oyg2o2Q?=
 =?iso-8859-1?Q?18K8TJsSRY3QRD9IiBqfXgBLEk9pls//93ddOGwqqs4yOmhmpyhGpnxA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a6733a-ddbc-4b13-7224-08daa84f4bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:51.3488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DG08n13QpatWoKkmwjJnmJQp43yRmV5trG+yhp9MxVbzLmln1CWYk4D0LwXmiCW4EnwhQACXVrSEFY9HNqSOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6716
X-Proofpoint-GUID: _cGNbPPqbK7KDTZSIkFIGcKBo-pypn5x
X-Proofpoint-ORIG-GUID: _cGNbPPqbK7KDTZSIkFIGcKBo-pypn5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=667 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070064

Migrating timers during suspend causes Dom0 to freeze after resume.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/common/timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/timer.c b/xen/common/timer.c
index 1bb265ceea..52d4f72a76 100644
--- a/xen/common/timer.c
+++ b/xen/common/timer.c
@@ -658,7 +658,8 @@ static int cpu_callback(
     case CPU_UP_CANCELED:
     case CPU_DEAD:
     case CPU_RESUME_FAILED:
-        migrate_timers_from_cpu(cpu);
+        if ( system_state !=3D SYS_STATE_suspend )
+            migrate_timers_from_cpu(cpu);
=20
         if ( !park_offline_cpus && system_state !=3D SYS_STATE_suspend )
             free_percpu_timers(cpu);
--=20
2.37.1

