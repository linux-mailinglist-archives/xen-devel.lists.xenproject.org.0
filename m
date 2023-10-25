Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201AD7D67F8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 12:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622790.969948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvat6-0000YN-R4; Wed, 25 Oct 2023 10:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622790.969948; Wed, 25 Oct 2023 10:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvat6-0000Uq-NK; Wed, 25 Oct 2023 10:13:20 +0000
Received: by outflank-mailman (input) for mailman id 622790;
 Wed, 25 Oct 2023 10:13:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TDEh=GH=epam.com=prvs=46626b3b1e=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1qvat4-0000Bw-Rw
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 10:13:18 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d81c281-731f-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 12:13:17 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39P93PdR023707; Wed, 25 Oct 2023 10:13:05 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ty025r8hk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Oct 2023 10:13:05 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by AS2PR03MB10033.eurprd03.prod.outlook.com (2603:10a6:20b:640::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 10:13:02 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::eecf:7ef0:b4b5:fc42]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::eecf:7ef0:b4b5:fc42%4]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 10:13:02 +0000
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
X-Inumbo-ID: 1d81c281-731f-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMSXKiwXNu9il6W6ekDRxhRX1phF09Rj7mvwK/OpIYZ8dYfBGvH1Fri27MaU5pBxiawrO0UXTKAFJg8qxAyvi43WJ/lerc7APZlUnuqDRhdyklVfDmVtiC75Y7f9s3pYCXuBvL23ofKIShORxDZXkvUVMg25nbMIVVeTyXFCW9idvji2gFrNz7s5GUQarYUukJYuc0t3iAZuwraqU9URRXGddXQPGw0Agui1VVD0jeucPF60kjzt7WHu/Mh6uaQ8cKRgg/7gINwAKd7caws43YxEWKE3L5OKiNzpfnmHPJJ73p3hBwpKuSp/Z0Y7vCC3Ohdk05qkTiP1RCTflWfnjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klqq5TT3F8kWDJHUj99G9uorTlJgbtdaOQ30vrVT10o=;
 b=FK9MRWRhcxqk6jFcvcLv6P9p5DwAQtXoUVUoHH+DMg1fZcajEE65ylT8adCakTz9iQmQPB9uhbV9OW1+IQE2Mmv33hVrTwgz2irjl33zRw4+Z+WJkWoTrySKyElEEjF4Odnwi4oikL2JUkiBDFFWRhJJL1Bih+CpITK1CSZYG/3RKQcxY/bIN+UBubWKo+L/DITj6jnrA7gblk6rh2V4Fmv73O5RNKa3fg7UItG9+7P1NUgBss79vyN1JE6PX2mnuewvWN+daZHOSRokd2azE5YSipMc111r0jZj4mXE9I6hHtUh4dJpdJbw1/zqrJayOED5GJWiH4XBT/kTSMWOyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klqq5TT3F8kWDJHUj99G9uorTlJgbtdaOQ30vrVT10o=;
 b=pckCX0BYhm1wuoXoNRV8GixUtNAA9yKXYNKDXRqMkRsMluGg+KIm6U/8Buuk46AGerug9/LcIQYEEk2pa3FDQcCl0+NNLNbM3e+y8PN6nvwFjltoGDc2LgjpK2IUXW1IGk+X9Z38YUzhnQoa1xVjQD9xPFqoXFzgVkTy38JpA8gNvOQXKzg3tXAel7Q65OknhmC3/TfUjwm0iS2KZj7upj1oXhSdMBlzVya6YYl6Ts1cT1KLaF0COiqspLowMayq4rZXUiwioKL6TdjxG6q7iwg2bKChNuX3SqoizMriicU14im5XWPK3lKREV6RiwFhgj0EFiu66+yy5ktX2ZLIeg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 1/4] arm/gicv3: Move guest dist base
Thread-Topic: [XEN PATCH 1/4] arm/gicv3: Move guest dist base
Thread-Index: AQHaByvWbvp1hC9fbkyY87NUJCakNw==
Date: Wed, 25 Oct 2023 10:13:02 +0000
Message-ID: 
 <becf4d912d32b6888e040edd0fda4eece6cab66b.1698225630.git.mykyta_poturai@epam.com>
References: <cover.1698225630.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1698225630.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|AS2PR03MB10033:EE_
x-ms-office365-filtering-correlation-id: 78184df4-22a2-4e2b-ff16-08dbd542f923
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lJiFcG3hkRHuSz7fKgTHdfy3Bhyz5zok2I5sOgwD49OtHmkmEuduCdymqebM0YfNbeHxF7nC3uPxO7HDpIbLxfe8+zMYro9OOtYuLVqd8Au+803EObtu4pBvF7ZYsU7mKVt6PJmU6qnc1DC7KlGsYjjdstXyJ+vz+AkOFe9SP6RGodX2+SIpgBsSJPaDOTaI07hDYRBmyIy7hESAyUWtofZb4+Oiq80pKwShfv/K56qgnlk2pAe5vBIWISrxH8uz2o8XYIUxDq7BFcEdrsaD3IrIVZQdF8VuKDA5FB8kEwST16CaftskcOkGOEzZDTsjgD+Nk9AAQ4a0wOgW9VFAnxakZzS61AwkSPYc+ytbNsS8jGphDc96jOCRShseJry4yU8OyXSmrXE6ZA7smnaFerb0SQeO7QsYGhnZHloMHndHhXJ972MOQSh53cQLARDrvR8d7G8DIyD34crODxcBvNNmxw9INafnJyiWp4P3peqzl5uINlsvEqfBf58nIrZfAK6+DNcSpSEyDewzhc7BK+0NNeV7S0jt3zuRnxck6WaP8UE1GOs4y79h0OdtqIMkNQ018/m5QQm1QeU8AqOD07/pcof0EziXJGKoq4vWN6AtgWdbdgJdSxSoit27jeIW
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(4744005)(86362001)(2906002)(91956017)(38100700002)(54906003)(41300700001)(66446008)(66476007)(122000001)(316002)(76116006)(66946007)(66556008)(6916009)(71200400001)(6506007)(6486002)(2616005)(107886003)(478600001)(6512007)(83380400001)(64756008)(4326008)(36756003)(5660300002)(8676002)(8936002)(26005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?4ACwAGbD0+SZUTcCsXYghZbqmxOFflvXoITDfID+WWKUuhPG7KgalgXm2a?=
 =?iso-8859-1?Q?qdwuNCRIb0UmU21g5ad73JDFkhZo2V91vB7KO1MNWV+YpNvb7NRiEhRuiM?=
 =?iso-8859-1?Q?bAirV6db3MTf/e3vF82TX0uDq5+onxH+Bk2alGlkMkb0RfVtwsatMjawjK?=
 =?iso-8859-1?Q?Tr+6LDnqLoAlPKACVvJ24eKQWfdArer3/NMcKg7XJv2Egb0kTqdlN65Acz?=
 =?iso-8859-1?Q?zVBZKHcNWxLPLGBepgLJQF4kwo2zTPvblLFHJ0W1C+ja0r565vPAhHLFTO?=
 =?iso-8859-1?Q?g8eL1eiK4mmt3o+gusJcki7XM09EJou8mfq90WnYzVB9U/+Goizl19+4qQ?=
 =?iso-8859-1?Q?nt54kM8cXX9sQPkKknS19X6kLroe0ZMUlysHYZyD/itATe7y4QALLxJSyw?=
 =?iso-8859-1?Q?oJpkQuTEC0RV0FtREjJysTTSGQu+SNlWRxOH16JCn9/dFjA77Od7XJJ4CN?=
 =?iso-8859-1?Q?qS4USfFIEdoLVxuKJSvRT4Q1LM8W0W7z+kQjgcM5qhi3cwiBIghazXoyb/?=
 =?iso-8859-1?Q?O6cMFuyGV1rqPbxX6r7CTyufFU4Bli3oL0VzbnW8Z0UyCeuazeoQJV81MH?=
 =?iso-8859-1?Q?R7SnsPJwPeds4oyjjkWwL81JIIzbpO0wUZ1ORwKew77wA4WbVRS9hw2DnZ?=
 =?iso-8859-1?Q?IZlIb9VnMosB9xiTvWyDrQq+reRv+eT7b3YHN6DECtlLkB8hlhhtjL5P+4?=
 =?iso-8859-1?Q?5zBc/ZECDm75PScrv+Hc0MeWEOUaxMF3IvqayXG/GTH3JbqXiNGd0/ZQLL?=
 =?iso-8859-1?Q?FBoAM/PrEuWcC5CCrylt6nztUgc/x7XN64UgE4Ak3Cd03jalxh1kmq3yB+?=
 =?iso-8859-1?Q?s2ysyYpEdesdLDBFyhC/MF13rmTuJtGUHEpT2zdd1W8heqwMr3UI8Mnz7/?=
 =?iso-8859-1?Q?tLbZnSh77m0BCNJi1OVooFiNVqBeJqfUuU2R5duitUDjB2jsrX0toUYOhB?=
 =?iso-8859-1?Q?zF5+3IhZhvO5bry5gwvBPtg8PF7yitgjBGsSg5nYPLEXH8t5Jn8mk0lPzH?=
 =?iso-8859-1?Q?rZrP+C1VNfP19YMwLLrWQdjXlY0VHu7PBjynXDF2Y1FFPwH3ZLBhDxdJz2?=
 =?iso-8859-1?Q?uCvhzAMyvHGsetJgY3Ad8A2ciMlJcxEYhoxMhQP/0T/gi82NOIj74AUre1?=
 =?iso-8859-1?Q?uXIjtJaV1OO+7rFOACkgq3r0NHsMHqXeAEZJsrwjUfbdaHalLkstiUQ6xq?=
 =?iso-8859-1?Q?Z0aYzPJ0CXCgPG6YCfvkVRknXxDA7osPqPEMR31nYCuqnyvqJNnaksEaID?=
 =?iso-8859-1?Q?K2rPMKA+euDi8GvF1RCG+pts/xevrej+lrDy6em06IIxdWsnhyrC7QW8+4?=
 =?iso-8859-1?Q?kouvgbF4ZFHNJWqKj10rZ8x9EN+4TcG+5EGSTVDQ99U0xM7ZvoPVl1Biec?=
 =?iso-8859-1?Q?2IngjUSkkjzI86DeX5SpIHcQnzdTe08iH5Q/El+0E3JxS6DtEUkY2d/YC4?=
 =?iso-8859-1?Q?NWTX3gebOmaRzSJ48PBLNZTkyhBaXeg8BG0rM667iziuyRj00O0iCJYeDt?=
 =?iso-8859-1?Q?1+I4ZjT8B8o/NYIfmv0kdxM6U4bRTQb12PllxMz9ZRtMt+Zm8v9mg+77br?=
 =?iso-8859-1?Q?R93P9sOB4wuN+LkxCpl71qHw0P2eCg2Tg4qE5DjWH0g2E4fXfHnCsCbYLw?=
 =?iso-8859-1?Q?AXxFLTXxYGE97al7PAdjEVID/Fcl5hFcwmbZyrs7sj8yLdlItqHHY99g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78184df4-22a2-4e2b-ff16-08dbd542f923
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 10:13:02.6989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H+U/CN3Tv0sLddPyspa1tIWAoQ27zVROljy8BsgJUOFJ6o/e98LXOtgeTL10CZLHy6cNIBBsJCvc7KubsKbDgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10033
X-Proofpoint-ORIG-GUID: Z4CaGzVSHw5uvsxng05LFZieJ1dfYGHC
X-Proofpoint-GUID: Z4CaGzVSHw5uvsxng05LFZieJ1dfYGHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_01,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=910 phishscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310250088

New vgic code relies on lower address bits to calculate intid from
the address offset. 0x03001000 as DIST_BASE overlaps with
VGIC_ADDR_IRQ_MASK when bits_per_irq >=3D 64, breaking the intid calculatio=
n.
Move DIST_BASE to a safer location to fix this.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/include/public/arch-arm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index a25e87dbda..71fa25b1d4 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -438,7 +438,7 @@ typedef uint64_t xen_callback_t;
 #define GUEST_GICC_SIZE   xen_mk_ullong(0x00002000)
=20
 /* vGIC v3 mappings */
-#define GUEST_GICV3_GICD_BASE      xen_mk_ullong(0x03001000)
+#define GUEST_GICV3_GICD_BASE      xen_mk_ullong(0x03000000)
 #define GUEST_GICV3_GICD_SIZE      xen_mk_ullong(0x00010000)
=20
 #define GUEST_GICV3_RDIST_REGIONS  1
--=20
2.34.1

