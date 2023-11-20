Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB67F1BAF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 18:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637153.992912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r58UB-0002as-CK; Mon, 20 Nov 2023 17:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637153.992912; Mon, 20 Nov 2023 17:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r58UB-0002Yq-9Q; Mon, 20 Nov 2023 17:55:03 +0000
Received: by outflank-mailman (input) for mailman id 637153;
 Mon, 20 Nov 2023 17:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WhrZ=HB=epam.com=prvs=56889b6e60=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r58U9-0002Yk-5x
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 17:55:01 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb8482f8-87cd-11ee-98e0-6d05b1d4d9a1;
 Mon, 20 Nov 2023 18:54:59 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AKHjlpl005009; Mon, 20 Nov 2023 17:54:56 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ug8f7h79b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Nov 2023 17:54:56 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB9421.eurprd03.prod.outlook.com (2603:10a6:10:418::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 17:54:52 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 17:54:52 +0000
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
X-Inumbo-ID: eb8482f8-87cd-11ee-98e0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L51UDomAnVJsNXBi8KhcC1OLsCOocjzHgjCZh6Ev0hjILrNesvSzJGv84g9RnC1fzKZIx1CC8sxKXI0b53Vi/n8WkGiRUagbNnCqzMA4WCU00GWrASqVLEjJw6GNzb06sKcAo395hZgMsoQbmQgxrj5TOcY/IJ0xf48fMUuRZw3tvn+ANaq0YtUtJMwR7h8UVohXi42eCQl4gotftn4kkHBIddelMPZXTwssn9i43GGAPwLPxJceJ+2l07uCRTJ6Wl+kGxf7V1nyX9LhlUWbhjJLL22b3asvLdcMGZnmGBE40eYWQv/7Y+Q8MY6Ycw+vhYCvYqLYWyxPi2WyxNzo4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kve1c783C17rBE+5Qbtqf0zjZhg6w19eo7cPFwsG0TM=;
 b=Fv0w4FnmiH8h186jTL5Xv1gTitfhUZaRqks8a4/7pzLPU7eoMOT1ALABaI5g677PXgPWCDx/v/yJv/xG5CZVVVEXWpsWwrwwTJmx9Iz/yG6pzvPquGftEpLUoxflQD1+oFk2pbfxKXSijkqB6qAz+x7njaK84R15Ou3U6S9mo+IW4VJVF2jLTOtUEQeYYp6zXcZVdwN3EgjN4HTZrxflOLPI28cVrO2jT2x5ViDkPIDYXlRRo808AzeWwR2oRTjdr2hhOnVkMzJxnth4ZFdDstperQeGoaASZG4jJYf8l9MwZaekjI9QZUg8A/1Mkv48jkMSVBRJVK6DTTpd1Ib3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kve1c783C17rBE+5Qbtqf0zjZhg6w19eo7cPFwsG0TM=;
 b=FkuYD3nVOlazf4KBUQxCV0qenPCwsGMFgYVSmthAJIvl3E17SfSSJQujFRiJW/kQeU8MdaG5nqD9BHq9dC3WKxlwi5j1HJjCO/cbU9NhKg3Lk5tJzT4vCgF8JhOPEKB3MbCg6tOZDCWWHU0HED128jaYLBDuay6KSh3csSOIVHM+eUTQ/N6UYFJSAef5tFusYRpmLXeTWTOT2DBMCxMOZ7clPPoQlr89GKr1Csnb/G5nXSJvzJdWx+jQzEUCvlNWTyMUs4FyD6ckwdCyoPuNGs5nLSbQ2b0VpR2gFDxn0Job+mDnvNxk8QXaNcPcH1ISrS4F0KHE9QH91eNVzwkrkg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
        Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
        Anthony
 PERARD <anthony.perard@citrix.com>
Subject: [PATCH] xenstored: use correct conversion specifier in the tracing
 function
Thread-Topic: [PATCH] xenstored: use correct conversion specifier in the
 tracing function
Thread-Index: AQHaG9qpkpU9N65Obkmv1tQPzqtBKQ==
Date: Mon, 20 Nov 2023 17:54:52 +0000
Message-ID: <20231120175357.219142-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB9421:EE_
x-ms-office365-filtering-correlation-id: 7a3ab0e3-9a69-4fed-e66d-08dbe9f1cc05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 s9IvvUwsnhWmaEwzCF/BkCkb12fIwNAgtvrNBg0Oca0q62D0gfBG4yxKJ2hQ7kIbUwVc+TKygjohNxCmdtdH73m6/tKh3aLR5s6Zo4P6ycnkG5mQKD7hmY4GgNuMSanytOJ4mfO5v3rU2dMBCs1a0n7oUX73SNZOekYDtnrhljP2LeUXajpmTHIFf791cy1pj3fl4SYhKu/UU1ncvjMtL2M6DLIwC0uRg5ozz5Zwy7WUYxsYA6E6zP1GJ7UibeKC/yIrm+I1Qf7LD6IN4BhxiyLBnTnSboriaz23WrPzf2oUu4Z+2qlHseoLtoSaXhIhxyc76v+tvUnT80WrutJsCC/ouCdW+gIP5aKm6Vt7jNv2swr0DleI+wyzDwQNgO3MfsIeFeuMe6WvTpCPsquV8i5Lw3rbLWjwRwXhcS1v06bSZVaxADxOx2neiAx5PctvhnpPdlHuq7+VY8bIgz10WyeQ+n+O52jTg+4ZP0yQyOpw2o73QOHpt+G4D+iWJIQisvygXp/mvgIeRR5viJD1HCK+eYCk2r84BJa8b8ng8wSnvxjvSm/W6vk0RxNF4BSVIFqv8YA1x4h29AgbExRdrJ1eZC1tYMwMPpxtvzaTQGOOk8qqzYY4CfjF1r6nOy7L
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(91956017)(76116006)(66556008)(66946007)(316002)(6916009)(64756008)(66446008)(66476007)(54906003)(26005)(8676002)(4326008)(8936002)(38070700009)(36756003)(38100700002)(41300700001)(122000001)(86362001)(2906002)(4744005)(5660300002)(55236004)(83380400001)(6506007)(6486002)(478600001)(6512007)(1076003)(2616005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?qiACC6tj+OxSP1rEFJAU/RtnsPVF6C5XkkWhRaEqvA1IRrfXDZdpR4P6FA?=
 =?iso-8859-1?Q?U9DkBXeNwh+gdvG/RMC54Z/qKd7v+393pXLHlP9D9ajlHNgQEArW+2B7Cv?=
 =?iso-8859-1?Q?162KV2DmdfmbYuCVk4AHqzOoGKI48gJ9lbeBLhHOanUqbg8IuIalg6xe8H?=
 =?iso-8859-1?Q?p9b9rWa/WwnGo/wVc84rY2VztrrzHQA/T99SSFn0RvnD8A4IJErB9ZJlNW?=
 =?iso-8859-1?Q?CfirfeqpZins2hxHi6cBGir2uyjnNBuRlDD3OPUIceacfFXVonZzReG0fH?=
 =?iso-8859-1?Q?3nhwLUKhI7RRtG7q+lY6NJPAifXM58oqfWVbnwQ4SconumCBD9Pps0yqIb?=
 =?iso-8859-1?Q?4Uj3VCbnFi817Cw95Bcw4c5POPROM4FJ9LrTmrkiRns6Fh0pv5rGzpcoC+?=
 =?iso-8859-1?Q?lkJHC6DWswMlKFgKXr1yrQV4F3rEm4P1Nw6nhcEqW8SS6lSmFkAqq+YQ/Z?=
 =?iso-8859-1?Q?pHUDgz9paK/5csq6At4iZe0qk2XZ1ZnF6aEId7c1xfuoma0Eslpl5Z6ZqK?=
 =?iso-8859-1?Q?J0KgLsgkKQqQwXIr+PKeyeDldJIXI+msVPgyh+bu3TS5gdMItdtTu05GTH?=
 =?iso-8859-1?Q?RLI89dqsy2q8J25hXPlLHnVSBHyD/x2Q86a4IAxp22USzhQ37Gfo9GIHJH?=
 =?iso-8859-1?Q?MCfzmIVNmhNGOF4EwM+eO3qxO+69nMgj3suaEXXW+pz4RHcuwK7HY+DkRU?=
 =?iso-8859-1?Q?KFjar1p1EcgD0rSkEiBGmldmVHtwtHli7GFArUWeN1wFzFERx0SF0xd5mn?=
 =?iso-8859-1?Q?EcTC+0QQSjxdgL2wtEwBsRg45048ai5eyeduDM6MTgdtfaDoWC58uggsEX?=
 =?iso-8859-1?Q?Ys4x9GwPdB6yNed51e4b5YfPB66ht62NZOebJZMrN88uS1KRsciotO/JR+?=
 =?iso-8859-1?Q?l4/KKriGS09LQpuwgn7PW/j0qEQHwS/MvC0/XhHQBQ4Wi+pCGGiNESoIzy?=
 =?iso-8859-1?Q?JfCxOsnK6n3riB2QkkahqDZ9HuWW/DpKclcPGa2SqsqaX5f0mlGu4pHTKg?=
 =?iso-8859-1?Q?gd8vG1BLJ7p5icfpJxAvmW7VlGC2DOgk8OgZ+OtSMA8eQMAKzKSKKc3qwg?=
 =?iso-8859-1?Q?VpmjO6U94EYVV0Wu5qMtC+gqup/eFIy3og0De9eRAHXKA34G9VrDyR5qSY?=
 =?iso-8859-1?Q?18KMAx22qoqm7uOIM83oa7y+wRpOLRt5rC7I765GRTndWUng2UoMKlvpoY?=
 =?iso-8859-1?Q?q+dFHMSAe4F2Yv9GV8ci+PL0nHDR63BgOmWF1Hx94tJVZCEpCl5ur7Scrl?=
 =?iso-8859-1?Q?kbOoB27oIFYUV5Nrno9mqX2qS4PspJ5WXkIpVGiScHJ8bNNyAoSJv8hyky?=
 =?iso-8859-1?Q?NM1ts+Inmi+jfD6afAJezka27G+pY6xHcl8jNbq6Nhf4Wp+X5+k74HWpqU?=
 =?iso-8859-1?Q?DJ2QxQLpJ0m1yHJ9k92FCbiWgPtL53IkTz1E7CvnLFqc96Sy4TJKkqFa5L?=
 =?iso-8859-1?Q?PsOCoATjYkyrXXEpMBZ7uyEoxq6ya/yr+YNpxF+V9Y8bJsI6ibfiQ+u9zC?=
 =?iso-8859-1?Q?Xl093LtkC5CQHLgu/OTkqHGOIBqenvJAikS4FYNslSY5gyEnekb5yA5JI9?=
 =?iso-8859-1?Q?xulzUUL/fsGW1zC3eT5//TWUlB8ME2mzjkMpHNHDJGIDnr0kY2KIw62w3F?=
 =?iso-8859-1?Q?i7ojOjHry+ZRX9ocUCBlYAWa+4b225pnNbAirMKem9fs1NWiDysZfjug?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3ab0e3-9a69-4fed-e66d-08dbe9f1cc05
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 17:54:52.2052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EF2UW2eFiz/YGKFLXSuKALIYM6JUHcEIGy+qULWd7//q+NHFbCGNy2dFL4mZAYO/Fjshez8Yg10u4V4CFxiHaKuLC04Fyx8gaGipe5yT76U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9421
X-Proofpoint-ORIG-GUID: 58HyNEcjv5fV71zXVRjN0XiY-qCMtleP
X-Proofpoint-GUID: 58HyNEcjv5fV71zXVRjN0XiY-qCMtleP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_17,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=670
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200127

Previous change to xenstored used "%d" to format conn->id while in fact
conn->id has "unsigned int" type, so "%u" should be used.

Fixes: 97f8555acbf3 ("xenstored: print domain id in traces")
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 tools/xenstored/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 311764eb0c..184b130d12 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -135,7 +135,7 @@ static void trace_io(const struct connection *conn,
 	now =3D time(NULL);
 	tm =3D localtime(&now);
=20
-	trace("io: %s %p (d%d) %04d%02d%02d %02d:%02d:%02d %s (",
+	trace("io: %s %p (d%u) %04d%02d%02d %02d:%02d:%02d %s (",
 	      out ? "OUT" : "IN", conn, conn->id,
 	      tm->tm_year + 1900, tm->tm_mon + 1,
 	      tm->tm_mday, tm->tm_hour, tm->tm_min, tm->tm_sec,
--=20
2.42.0

