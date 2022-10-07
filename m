Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD495F76F7
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417754.662558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkh6-0006Lo-Cx; Fri, 07 Oct 2022 10:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417754.662558; Fri, 07 Oct 2022 10:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkh6-0006Jg-9z; Fri, 07 Oct 2022 10:35:04 +0000
Received: by outflank-mailman (input) for mailman id 417754;
 Fri, 07 Oct 2022 10:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkfC-0004P4-Hs
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:33:06 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c6718e6-462b-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 12:33:04 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2978NNsk005811;
 Fri, 7 Oct 2022 10:33:01 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k2a45sjkh-4
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
X-Inumbo-ID: 6c6718e6-462b-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWT3s26VSGqyXcms9St4R/XUityLrInIk5MZlN3XZz10iqoT3hVanldJP4gQ0GkLvXUuITPwyQUN/cHDgI9inhzLJmP+t5C4Wfrj7aqs4/ebJBrWfJjn5xtbr8M24BDyHiru4G+Yjub4fUx3NCj9boschDcZHCCjbSSDB5plbk7Ecc1N+dBmPezQHiZ1YklXhNTtkUG/M89idIN05HC7lBBptNHFPHzq9zMx3riv27ctdm7yzzXsyMH0REDY9H3/QQieGnLdwCtSNwl5jjdm0SgjL/E6oWNNcGmQF2oyN8ZB6dV7VZTMp0Q4K1XAhn/W4JEfspd4s8h/uw5qqXNNLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LofU4NA3DawFyk2dVbhjW4yKNwCVyZvZ66lYuYxwLoI=;
 b=JMtMioPJe1B03XUJOZNENMofJKf5wCl6jBnIabmeqEfolCiHOAmzUXc/AYhtWBndToQn0QjfVCbOewqczkDS+OcsVlRS+waKPDbKwJ5nbO1MBu0SdyjsyX6OLVFsmk4ogNIipOKooZkUzcMbTIaFseXKevGb19BYuTsNaB0MFbiSZFebDu8YEB/4VzqGBprdBdynYjiFRCFrhnHZmGuQSsDITuXSs+ykCO06mIh16uFirlhZOdRhH53JjxQsHyYWZojO+T3lwxZmPcRtJZo15P/4gdoRT0hiESs0kHmPpLrAJ02LRYkw1x5G20lsc/YKGf1UumLVcnil9VmvH+iu3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LofU4NA3DawFyk2dVbhjW4yKNwCVyZvZ66lYuYxwLoI=;
 b=IDNDG154Pz3sbtTSoRWFbYz/dgIdkQKogB3YolpiueP8557aH4IYstavK0JyhqdQD5QT20U49qCs8X51+V5UQ4t3vayFIC3WBTVHe0wDKbpMwQwKSdY1HGWa4GeeqUGALDQDamn120Wt3XQE7q2/DuKN+jW1R7BZa9ecnnIbmXZq8ggd1HyjrriehZxrzoOXQblLUpRN0/0egWTbp7WzxIaFEX91lGXck+b0KV8UUvmNMbUTpCYe6PZZ+8pJLU6fEj2fUUBWgkngzlP+aln0c+ky5aUY8YOvIuq39d5WfXgGyn3oZSxVXYJmjErR9uq4fMjN4Yb8uYLWD+pb/9FRrA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH 19/19] Fix misleading indentation gcc warning
Thread-Topic: [PATCH 19/19] Fix misleading indentation gcc warning
Thread-Index: AQHY2jgnAfaSu/bn4UuiKd5XD6+qwQ==
Date: Fri, 7 Oct 2022 10:32:51 +0000
Message-ID: 
 <3575d33c0520d3117e1d12af91f1b1e31a2571c2.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|DBBPR03MB6716:EE_
x-ms-office365-filtering-correlation-id: abec2b40-7fd8-4bb4-f751-08daa84f4c0a
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tlH/fdOsmn4nYkjP3EK8R7ZZe5uPvAgO++zNArokAicUU4BZt3zoIbiRGytKF5UFffC5gSJrQnpD0VgtkVqs+v/MMJjdnG+bIlQ6vG9bA0UOyC4mRb0eqU7wbZ9UjElA4yWKR0A65J44GmPKfh8QxxdJtOvFhrnK4CnhL4lAStQFf0uAxaASbn8DeOdqEcAVlGKcoHEoGiPFklL7julPEX4f90iSeEfOMFsNh0R4aukitTkxf7bGY1ANm4jGq3rB6Ps7xOOUziwoikGMYegUYgVA6JK0qW6LZ2zU1d0RvFXhRUSgBOfz5RNhmksKpA5QvIuU/PJs/dJV9ofRvYpBpNcg3+Zai7zu2pO61EK82iEkhRy1ZoOYKIEkFVRaFPsKK5H4YYvf5HVSaQ6wyeokSWX6rwVIMj/Fe5hWzZhKL9JtPtIJ73qbq13xnXrZzsW3KSbH1u6HX7HW/5H/WN1giw37uspduAAH7heBL9i94ijcuMkytkVYzjSNgqSCwHQwPmA12y7nv2niT1Wh131skqzm1TSO0zOBKSFSV8ruDfTX2bkuYaQkOvu5HRkU1vmHaNb/Nyd4DD4cSgOFZs2k2SazeGTb3cml9fVBUGUrWNRSlM7h9TUonQ7pCY+VcLu/kR0Z5xu7UmzAQmVh065+ncKiLKXt0gV/fNVrYD2CR32IhVPQWCTrpZQ3Ba1CaG5D3wrGmCTx5HGICSUoStKMFjGBQUxHxrEywCCBcALdLFtOcptM5O+iUPvYpxVKBj3OU6lL/39j9Ci9KfWowlI3rw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(2616005)(186003)(83380400001)(38100700002)(38070700005)(122000001)(41300700001)(2906002)(5660300002)(8936002)(55236004)(6486002)(26005)(6666004)(71200400001)(6506007)(316002)(478600001)(8676002)(54906003)(76116006)(91956017)(4326008)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(6512007)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?amxEiVVwlw/Tyw5cAwYXsb5SMzWB7tBddv1qLaYbpxej7hTsix3/T+zNfa?=
 =?iso-8859-1?Q?oMroMfUmdCDDjTI/oB0xMxPhf6VFLu2P2CoXtTd+WkHaE/5iKn/rPK12KM?=
 =?iso-8859-1?Q?UBUlNSuFr3eAJfNVnFlJqI0jMGg/1AALsNmowvrpdag6ZVJV5UTggmUxg/?=
 =?iso-8859-1?Q?nEUyYl2NSHNpWtVPjp9tePEhXkCAq7Vzf9GhDSoONNb45Kl7Y02k3gYPbR?=
 =?iso-8859-1?Q?Xx+5nm3Gol47oyF1aJ0BG4eER6PTRjc9nf4fp99LzJ38TdM7QFZmBefGA1?=
 =?iso-8859-1?Q?AAv/Dj+5FpS5SDRcXVGnU50aBNcdjtA24QTMncy7+J4Lu4nRCI7hIHmeAG?=
 =?iso-8859-1?Q?iSwJDoEp7XWBij2Mmspx4s6oyS0fmwTTj3DP960fJJcZpe30eJBfiP001T?=
 =?iso-8859-1?Q?kSk2Lf5xoSkGN+yueewBFFmAiPmEROnobNY52TaSQEvDmHDIMRvHRPn1S+?=
 =?iso-8859-1?Q?esF6UCCPZAgjwQqkV0CLLfpMoTV2lN91WpCcE78HScguhJINXiZC9glT7S?=
 =?iso-8859-1?Q?KME7qBD9dszZRxf3SObod+U8XVWUo3HJ7j6qta9BTgWwrgHE0B9MAJStOY?=
 =?iso-8859-1?Q?2KhOnkR4pqbNDU7pAheOkwJUCSXt+7Xvt332WSt0EGqDenCjoYd7r++VVM?=
 =?iso-8859-1?Q?hVZ5+2api8d9fYAQxHyebQpf8Nv1kYoagVoP6TIAXutELAU9Kc/pXD8PjG?=
 =?iso-8859-1?Q?ycbpcgrzVvI8iaJZlLfW/COMz6r57loMXCo0FDTA5d84hm5uOKKJf4XkPz?=
 =?iso-8859-1?Q?3hkJ/zdZWWP4AlQRDFa/F2JDuav6Ox8vG428E5B0VpHwktML34LYMCrypI?=
 =?iso-8859-1?Q?GIIL8u2R3bWTxT/zczGJhstQvfUs9QRrPzIF7Yp1BmpMfDliMywVUrSGxw?=
 =?iso-8859-1?Q?NcCWmK6CYBXFD8YkOOQQKYB8MA/PenCp8R/MILhisf+ZSTqP80hQd0t2NC?=
 =?iso-8859-1?Q?LgXopwUc/Lt/0ChIEaLTIajmo4oIOtKXer6al87L7NJMDw87mu6/W6Y6qs?=
 =?iso-8859-1?Q?277O6VHzNt8a8xZ9Oenfzt+zbAVUHESsdYCRqaAKYY2EjQRmgjqhiAT3P8?=
 =?iso-8859-1?Q?ed13qhJ4abNR9v+jVG+Si7Zz/qlJTGvLxUJl9PW9JLFSjY5Sb/XUfpnWF1?=
 =?iso-8859-1?Q?Pglbsjguuvsnel+lNz95QmjybtR+YmAvDMbbz5J2e+D58JD/gsLcwwCd2O?=
 =?iso-8859-1?Q?25pYei51neTBXaNKsv7byadBU8l+2CFHgM7qmJA/JJ1f9ApWxNcBwVEt8W?=
 =?iso-8859-1?Q?BPKwVLzZ7KYl+66TQNVveUkd+5+UtJ8wTQR9lS6ebmY/kXdDluFWjdPaXG?=
 =?iso-8859-1?Q?cwB/uKFmlEFagkLrG03ioeSd8K3jysQ7OdFXW3e4yinWkmlCFFDn0uBET0?=
 =?iso-8859-1?Q?TH1FwOk137iihoAwp/jdZdCebvzYmSjmakoV7iy5T0CG8nuWgEow4CdDg3?=
 =?iso-8859-1?Q?gTl5R2F4njwju5tKK8VDQvnARTebyvzPqqn55i1BWFmj/nC/2z8wjZX1a8?=
 =?iso-8859-1?Q?ikuKXzqVJ4jYNlFFl5TfU+F2w4vw25r/UbU+qzBOccqKsS60CxSg4+n01f?=
 =?iso-8859-1?Q?cEABlfWAme0F5OSrlFDdy+cPtY3MdZWtETAXR22s5eXCOgm/r5LPcVcSDh?=
 =?iso-8859-1?Q?kAudaHKWM3XElz1PQ9MbwzhvPZneEcIsbE251Lgob+g5qByL+6RCvTVA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abec2b40-7fd8-4bb4-f751-08daa84f4c0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:51.6613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bKlwnRLLwrbdglDBAt3Y4KSWZNoM2DI5omo9rP3RQGozzmuvlcMb2mh1P4SNTGratpdtwNOsjkyXwRY0mEEhjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6716
X-Proofpoint-GUID: G-sUujTgl5FdH89U_W09UyYYZjLoIQUb
X-Proofpoint-ORIG-GUID: G-sUujTgl5FdH89U_W09UyYYZjLoIQUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=709 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070064

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

percpu.c: In function 'cpu_percpu_callback':
percpu.c:61:7: error: this 'if' clause does not guard... [-Werror=3Dmislead=
ing-indentation]
       if ( system_state !=3D SYS_STATE_resume )
       ^~
percpu.c:63:9: note: ...this statement, but the latter is misleadingly inde=
nted as if it were guarded by the 'if'
         break;
         ^~~~~
percpu.c:67:7: error: this 'if' clause does not guard... [-Werror=3Dmislead=
ing-indentation]
       if ( system_state !=3D SYS_STATE_suspend )
       ^~
percpu.c:69:9: note: ...this statement, but the latter is misleadingly inde=
nted as if it were guarded by the 'if'
         break;
         ^~~~~

Fixes: c3109b76d967 ("xen: don't free percpu areas during suspend")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/percpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/percpu.c b/xen/arch/arm/percpu.c
index 0642705544..9eab1e6d7c 100644
--- a/xen/arch/arm/percpu.c
+++ b/xen/arch/arm/percpu.c
@@ -60,13 +60,13 @@ static int cpu_percpu_callback(
     case CPU_UP_PREPARE:
       if ( system_state !=3D SYS_STATE_resume )
         rc =3D init_percpu_area(cpu);
-        break;
+      break;
     case CPU_UP_CANCELED:
     case CPU_DEAD:
     case CPU_RESUME_FAILED:
       if ( system_state !=3D SYS_STATE_suspend )
         free_percpu_area(cpu);
-        break;
+      break;
     default:
         break;
     }
--=20
2.37.1

