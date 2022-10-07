Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6475C5F76F3
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417677.662361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf4-0004Qv-RF; Fri, 07 Oct 2022 10:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417677.662361; Fri, 07 Oct 2022 10:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf4-0004PG-OD; Fri, 07 Oct 2022 10:32:58 +0000
Received: by outflank-mailman (input) for mailman id 417677;
 Fri, 07 Oct 2022 10:32:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf2-0004P4-PC
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:32:57 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66a6e553-462b-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 12:32:54 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2977riw9002988;
 Fri, 7 Oct 2022 10:32:49 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3k26unhxjy-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:49 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by AS8PR03MB7159.eurprd03.prod.outlook.com (2603:10a6:20b:2ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 10:32:45 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:45 +0000
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
X-Inumbo-ID: 66a6e553-462b-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMC7JkhV+J/9z/lC7lqhRk023/VvOJ5u+PKGwAbAFLa+MDm9izEvqvTxPW3rfNya6xmAFh6X0JSeLEr6CYjzJD/p/8vKIDHpbDuX29k2NcxVVPoga/ip0N3vQWX+sNkeTPxmgphs7z1J4on6UFaCCROXQdSo6/NARiHX6vXIsMp2KbFc3KeGfK9vbNN7V46u8StXF1RYRnCC+n8g2y3dKG2ASfcWt8zX4jk0bkzh6JGG3CYdRQyQn/MkVZPXwnsVxRBCBCf2RhJhaTMNZhImXWKMhqP22uFi1Qn+L41tpNwH/R2v4jOi0ohkqzYg9hRVDGnMvd6s47NQTGJ7QJwprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmVWcxM9/DbUaCNEQfmMZgnERngyZjpgdvYuQaC2TtU=;
 b=m2lPa8IU3n6ZJtdmeYb2f9oqGHwA2nySshTvUbSWRIodJ2PXylYcHGZlIg5QxWqEkRKyUcTkaLrencPPRMpuUiF9GFp7QqzSu6+nwIdlaiS7iD+6gFhS15CnjRoGVxRg/obP57/D1HBwN/G8TWEQBFwPLqGvDuN2vPBigeTY0V0ZMnaAEsXAP9cMK8U5sg40Zm5R77GXXDXilnebBIiROyapn3bbMtiAM6DuN71PgoADbcJGfqKlbtOdHdjzROWoFe8iA5an5yHeZq8gEcCDUMLazYKs76XLxh1JhIpz7xAdkVF6h3ZaGRc+u277E3YyTP8QHm7H6ijze0VkY1LfjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmVWcxM9/DbUaCNEQfmMZgnERngyZjpgdvYuQaC2TtU=;
 b=ech1twBvE+z+rQrx9vYjCHUyfuYHT3eZPEluAfsDE1gT5q9+/5ng02EctXp5GpeZSca17edF0Tco2ISYMgRqp9MU0V5NXsEB2h3CUVFHT9t910wCb8+0DJs1YsEjDBxfcujkCASveUU4pzcjY1EESVVF0MniPwubhYSTFFZKFx2U456X3uWRSLBV140hZ70LZ41ExlYqMLBYv1bYdRY53VUFu3QYnvoP1lFl8IhVdTr0aY+0QRMoqEC+pWwhsG49FskrksqkgLr5S5pHmNr83ujOOk9zEGyCFTJkSkXvB9seMN4PVf2ViNpwtFmIUmjYrls9cqWY8jAlisPFpNeM8Q==
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
	<wl@xen.org>,
        Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 02/19] watchdog: Introduce a separate struct for watchdog
 timers
Thread-Topic: [PATCH 02/19] watchdog: Introduce a separate struct for watchdog
 timers
Thread-Index: AQHY2jgj6wETIb7ouE6AlSobgU5oww==
Date: Fri, 7 Oct 2022 10:32:45 +0000
Message-ID: 
 <062b2502090c72fd229a0b9291e19fceaa339247.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|AS8PR03MB7159:EE_
x-ms-office365-filtering-correlation-id: 6adace4a-1c39-43d1-2238-08daa84f4602
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0GZMVuP5BWMEene5rsRWJjYfllXk21rzTRdLkfrPGKi+UcuvmIJ8hNg4womMiRUBEKiA5V7cUDx/uYzXTUbEC/fwQilNhq45JUufjciq71gVn3VfbY4g0h909vy70n5H4gQp/e2vWBoC14eeKR/T04sP+FS5WP1T8JxrCZGoAc9r0zuc9EA+zNlcVAxdDtzQ1hBzbSKFN25dpZJ8JuM/VjFi82U+rp6KsMjzh1jfLZtSG2hlEGDbtoxIOiHUFQDRdej6cVIWSH9gSRdbUZBpPEBPOt2/FU3jAjbwvJ2/0vMbi7OOz7AJj2/5XJmt9rC/8THqF/YizZVHZ9uViGPKaszrNf6TUe4NEy1S3VdtF7qWne8ymKHSDTXUdpLx0I6uiQC7tV+SHduSvOcb2sIEAxzA/Hm4X7V0IWdHttECrPwJzGKRr2Lz7k2G61aTO+Uf8ll7eb1Vu2ukWgEEs3199n9xBEsVhoml9iaicQS58ygU8sPGf9aTflQwMwL/j5/mmFPEf4xsAAJY9mSpttO6UYMRxdJD/HpE21hqTGXSBkA+crYipJ5tdrOdNNnrnGdl+qzczSTL/6U9HSuLwYHMCrUbFtVye1d6fHHfWiiOeOts34Cn+BO1x3Ie/5eKhtJRhunjzj9NJv8UVoo3el3lr4Hefp6XaldQErHuuQxwF2fwkcrD3yrNzN0wYtUxU5xLzcnL4fNPOpsMkM6jJ5b7eviZyDQ8aPHkDDFbheA5k11mtFzud/MV4XP6e8SqzGR2Kr4GhSk43t0d0EOxdP4orWxeCY2DW4iy+CGC1Sc6Xd0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(2616005)(186003)(83380400001)(316002)(6916009)(2906002)(54906003)(86362001)(5660300002)(8936002)(66446008)(41300700001)(66946007)(64756008)(76116006)(66556008)(91956017)(66476007)(8676002)(4326008)(71200400001)(478600001)(6486002)(6512007)(55236004)(6506007)(26005)(38100700002)(38070700005)(122000001)(36756003)(171213001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?inOVtGzmDKcsnpiL4Crvm4Kt4AoJTEmnvGxJeerivqraLp7SBMAs7c1fF4?=
 =?iso-8859-1?Q?zPla/kKSEtio3NR9nBI4AXbPWoiPf7qJw04gpGXBe7JreQ2pA5yAx6b6kC?=
 =?iso-8859-1?Q?B3haIfwLt94pke7PiC1WYI7X1q+ScCuQEk5re86SyZB2UhlIF3W3wLKlTV?=
 =?iso-8859-1?Q?K1zYoCn83EVqUDI/YCknpiDIllZ1AjsCPC7EJqDF4mfR9K2EYOsLO4VpET?=
 =?iso-8859-1?Q?oMVVJ5X6BUfHxlK8lazTrryR0s5wjim9w7cfAjJx5KJxdkFmu9Wh31WIhM?=
 =?iso-8859-1?Q?qV4Aqx5ddpHi7f0NP4KjM7VyjnjAPWdFXBINOuFTRAC0ds+FYwmoa92ydM?=
 =?iso-8859-1?Q?PqVPBOSKxCGIj3FLGx8g1IHuneMRs8gbaF6TuSZ4iQBLsxJmrIZUDwp9iA?=
 =?iso-8859-1?Q?3eok16nSr5p3GpSgb6sA5Hb9nvd0tJR21AhOYXASEghF5Qec5aJBR3GuJt?=
 =?iso-8859-1?Q?n7IGAULzoMa4i9Gj9u5pBebIvZbbPkXu+1X9frFgGynsWyMT2G7yQGHT82?=
 =?iso-8859-1?Q?Zrf2d+d3vFgLnXgkQh5AE/dlh97osndYcN93DED9cmtfPw9LGkZrl8/Qna?=
 =?iso-8859-1?Q?OP9wXTbKqbeS+yxsBwtuS6uv+07lvbvNZu5Z1RZq0wulXeDv8/djQCFjNU?=
 =?iso-8859-1?Q?dV+JmVH3jIUHCwsKYI51TsNv2kEChCGaR4+aG310dSnibTSR4ODQrX0Vdz?=
 =?iso-8859-1?Q?YWrFj8Zsiy3iDUbCYm+pUcZ0MeM6HKl1xOeBtDehCYfLpqFwQnV6o1OeBz?=
 =?iso-8859-1?Q?V16vMK8/T8cxYK3FznCD0wKD/RfDBCQq3Q98O7cXXQW3wsVgadXoPgcDYh?=
 =?iso-8859-1?Q?py4bZJ3gKVfFUCakKztK2PxnaRibyZxySexT0wz3eVNh/RkmisdnydDXP+?=
 =?iso-8859-1?Q?OWu6x1FQXMJfE9oua2WiSPbLrdC/P+YbMiujOeSh0rI8Lp0fmgA6RLKcGp?=
 =?iso-8859-1?Q?j3c6/3R4WCsUTWsEQDIS5E8nt/3RnWVcGPcM6wSmxM9o+vu4CRiTPe2ADB?=
 =?iso-8859-1?Q?DCNUJrms9yRAIhxzJv+Qa1RvsHZlcR6xkvUQ4MmErpcRqCaPOfbHYiuyYa?=
 =?iso-8859-1?Q?IwlvKI5l/HAL614miVKXjuUIdApQ1vRR57TlG3jUejiS4MizSCXRnQfSB+?=
 =?iso-8859-1?Q?M+znCCorTfrJWr21o2j+7OER97n3BWUfmX+iYyJhg4cDJnmTui58j3qVd/?=
 =?iso-8859-1?Q?le63x2CjBuVus3IrHzkUhDtr+9kD2A/4L3oJ9aodu98OKunJniuS1ZhPJe?=
 =?iso-8859-1?Q?3vs+on0uL8g+dijlGZcfe4I6oHbLoH8MYFAV7IxOeZvS37Q7R8m5jOs3BE?=
 =?iso-8859-1?Q?+Ew5u+Q9VVPDfFzBJw25Mwd/uvrTO81oyP8EvgkOCoMJn4Ap2iY/fJi581?=
 =?iso-8859-1?Q?D9Yuzmc9Jf6ZTB1wLtg5IIjRTAQ7GN2FCgnr9tBW58/YeiFO7c+vCaaHkv?=
 =?iso-8859-1?Q?Y+tzF3uSJvbCsh+OoT+VXR8Q618OMkIJ663d5nV3CiKRLqvU3dcCa65Hj9?=
 =?iso-8859-1?Q?apXrnK6dgdxk5oMXJ1bFZBGRQUXGmdqJkWEOgt53sHpAJoVhxNut3RS1nx?=
 =?iso-8859-1?Q?8vmLS2WbJHcjD+uMO++h7B2zEwwEbGmHBEqlJeSZrCAbrgJ6DyXc9bZqah?=
 =?iso-8859-1?Q?W39nqoDBqCLSeI5J32l2gkn5SOdAllK4XiIByZwxuYD1K1mOrQe1wjDA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6adace4a-1c39-43d1-2238-08daa84f4602
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:45.4899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Swq2zPYJAJj+Z6Cq1Cu01JDMpMOcVekxgyV3oWehdsugoTkiU7Bye7wVWj4NXry77zn2KYZcvIpThc0IrP9OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7159
X-Proofpoint-ORIG-GUID: I5kCyhS7vqt4pmSpzpBleZz5K_T-YPLX
X-Proofpoint-GUID: I5kCyhS7vqt4pmSpzpBleZz5K_T-YPLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070064

This change is needed to properly implement the suspend/resume actions
for the watchdog timers. To be able to restart watchdog timer after
suspend we need to remember their frequency somewhere. To not bloat the
struct timer a new struct watchdog_timer is introduced, containing the
original timer and the last set timeout.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/common/keyhandler.c    |  2 +-
 xen/common/sched/core.c    | 11 ++++++-----
 xen/include/xen/sched.h    |  3 ++-
 xen/include/xen/watchdog.h |  6 ++++++
 4 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 8b9f378371..e9bd48fa5b 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -289,7 +289,7 @@ static void dump_domains(unsigned char key)
         for ( i =3D 0 ; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
             if ( test_bit(i, &d->watchdog_inuse_map) )
                 printk("    watchdog %d expires in %d seconds\n",
-                       i, (u32)((d->watchdog_timer[i].expires - NOW()) >> =
30));
+                       i, (u32)((d->watchdog_timer[i].timer.expires - NOW(=
)) >> 30));
=20
         arch_dump_domain_info(d);
=20
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 4e1ea62c44..0ecb41cfe1 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1567,7 +1567,8 @@ static long domain_watchdog(struct domain *d, uint32_=
t id, uint32_t timeout)
         {
             if ( test_and_set_bit(id, &d->watchdog_inuse_map) )
                 continue;
-            set_timer(&d->watchdog_timer[id], NOW() + SECONDS(timeout));
+            d->watchdog_timer[id].timeout =3D timeout;
+            set_timer(&d->watchdog_timer[id].timer, NOW() + SECONDS(timeou=
t));
             break;
         }
         spin_unlock(&d->watchdog_lock);
@@ -1583,12 +1584,12 @@ static long domain_watchdog(struct domain *d, uint3=
2_t id, uint32_t timeout)
=20
     if ( timeout =3D=3D 0 )
     {
-        stop_timer(&d->watchdog_timer[id]);
+        stop_timer(&d->watchdog_timer[id].timer);
         clear_bit(id, &d->watchdog_inuse_map);
     }
     else
     {
-        set_timer(&d->watchdog_timer[id], NOW() + SECONDS(timeout));
+        set_timer(&d->watchdog_timer[id].timer, NOW() + SECONDS(timeout));
     }
=20
     spin_unlock(&d->watchdog_lock);
@@ -1604,7 +1605,7 @@ void watchdog_domain_init(struct domain *d)
     d->watchdog_inuse_map =3D 0;
=20
     for ( i =3D 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
-        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, d, 0);
+        init_timer(&d->watchdog_timer[i].timer, domain_watchdog_timeout, d=
, 0);
 }
=20
 void watchdog_domain_destroy(struct domain *d)
@@ -1612,7 +1613,7 @@ void watchdog_domain_destroy(struct domain *d)
     unsigned int i;
=20
     for ( i =3D 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
-        kill_timer(&d->watchdog_timer[i]);
+        kill_timer(&d->watchdog_timer[i].timer);
 }
=20
 /*
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index b2f6d1af28..7a4aef4c17 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -24,6 +24,7 @@
 #include <asm/atomic.h>
 #include <xen/vpci.h>
 #include <xen/wait.h>
+#include <xen/watchdog.h>
 #include <public/xen.h>
 #include <public/domctl.h>
 #include <public/sysctl.h>
@@ -517,7 +518,7 @@ struct domain
 #define NR_DOMAIN_WATCHDOG_TIMERS 2
     spinlock_t watchdog_lock;
     uint32_t watchdog_inuse_map;
-    struct timer watchdog_timer[NR_DOMAIN_WATCHDOG_TIMERS];
+    struct watchdog_timer watchdog_timer[NR_DOMAIN_WATCHDOG_TIMERS];
=20
     struct rcu_head rcu;
=20
diff --git a/xen/include/xen/watchdog.h b/xen/include/xen/watchdog.h
index 86fde0884a..3398dcba37 100644
--- a/xen/include/xen/watchdog.h
+++ b/xen/include/xen/watchdog.h
@@ -8,6 +8,12 @@
 #define __XEN_WATCHDOG_H__
=20
 #include <xen/types.h>
+#include <xen/timer.h>
+
+struct watchdog_timer {
+    struct timer timer;
+    uint32_t timeout;
+};
=20
 #ifdef CONFIG_WATCHDOG
=20
--=20
2.37.1

