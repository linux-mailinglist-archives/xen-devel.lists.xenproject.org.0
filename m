Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EC982D037
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jan 2024 11:03:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667095.1038106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOxJm-0006Da-GR; Sun, 14 Jan 2024 10:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667095.1038106; Sun, 14 Jan 2024 10:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOxJm-0006AQ-CS; Sun, 14 Jan 2024 10:02:14 +0000
Received: by outflank-mailman (input) for mailman id 667095;
 Sun, 14 Jan 2024 10:02:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KR5a=IY=epam.com=prvs=774324cbd8=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1rOxJk-0006AA-Cp
 for xen-devel@lists.xenproject.org; Sun, 14 Jan 2024 10:02:12 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa2730a7-b2c3-11ee-9b0f-b553b5be7939;
 Sun, 14 Jan 2024 11:02:09 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40E3ctSc031009; Sun, 14 Jan 2024 10:01:53 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3vkmhw1tj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 14 Jan 2024 10:01:53 +0000 (GMT)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by AM9PR03MB7725.eurprd03.prod.outlook.com
 (2603:10a6:20b:41e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Sun, 14 Jan
 2024 10:01:48 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::9640:139b:8daa:fc9e]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::9640:139b:8daa:fc9e%3]) with mapi id 15.20.7181.022; Sun, 14 Jan 2024
 10:01:48 +0000
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
X-Inumbo-ID: fa2730a7-b2c3-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3gQolu3Be+Uev/qghi1VnDCEZGuvXHPG7OgQlt41O8du5DGkApg9RDE0Gfy4m1iA4e35BBHvC29xl3Uke6EFeg+WOY5MRQBU+zrQTlDCTdYOMO61ACqmgPaw9haTfW0kMWPNBto723UBGk82ALfNP6yOK9XQCGUB/bG/3P0rPSkXFA79+6XqRUropzRwDTWjmq3Ivn6zpbloBxuZhpkT4EK6HOmkERLPLs+gb9IeUjh/Wte0KV2gY0Uigh2lyGhX47EotwhEbaB0Sh+foee/E9MbLYhg00VK3hlFSnN9MJkprKsn58qWfP4ll1kdvnSnzdVkWmsb+xe5jQEtiMTnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRVOy0vPlI2Ik0MoBGOJBYPBn3f+l8ozQjhm7KSEaDI=;
 b=Epjav0g1plWyr49zFaq0D2KOJWDF9sRAgvf8KKsNuMdQZVlVQ7rNbBaSOHU8O4nB8Su0TPOXYI0Co73Hg2VAUctyQF12WFIRWzBTKb7TqO8YMdx2C7WYXmQJZsKkWFfL0r9MKN7lLWCWEohXIfEQuF4+/gpBUzTu+ccIXkGubP3iD8szv/thNS7iatyHF7Ik4RdSS8wzGaCDfdPqEeJFwIO0lPFs0lfqSCmTBjwCHcNQnGcy165rrsLDMqNi4fTQiLaUWzfVGNZDEx1pRaab4gdsnzNlLirdqBUnXUgurJfw3M6Yk6HudO47shbqgLeZPzmzV/2a4UQo+5+ds6BCGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRVOy0vPlI2Ik0MoBGOJBYPBn3f+l8ozQjhm7KSEaDI=;
 b=TILprAW5MyCjWkHARTUSPTE4mFPiZsUzq8EO7N8y8vP9EpjFJGtFXuBeGcKKXS2w5f2bW2hrDoi9+T0m3P8cWfnQ3smJPuN9hXYBt9cf/UiYx+gtm3CyIV5AJ7NHb5Ap9tyYwkNwtItAnen+4xeA+4eH/urOwxWDD9WpMQUhlhvHKvpXUwNRiooxN/rZQVle1xj0KWgtyWIWdhDqFOgoUNG2FUqeYqmW0tXWg+kx2TQHFnNEwxX7rbnyYPPpq3L7/WD6f6ti5jz1fvKMCct3WgpK5/M8a1FlSBwv6nCJ4+JVAHOX8urj+n0Q7Rk27yJ1mu8fNQZQXtD0X2CM35PC0A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
        Anthony PERARD
	<anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH 0/2] Add support for MSI injection on Arm
Thread-Topic: [PATCH 0/2] Add support for MSI injection on Arm
Thread-Index: AQHaRtCwUl38pp01cEa3npHNYwCgZw==
Date: Sun, 14 Jan 2024 10:01:48 +0000
Message-ID: <cover.1705066642.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|AM9PR03MB7725:EE_
x-ms-office365-filtering-correlation-id: f88ff70f-1cee-49c7-e899-08dc14e7d2be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NMwkXZj2W5uJXw1ykIOf0XQ5MN2KRH57gHPjVunBiGlHW+h2QtwjvADCJqog9wIuRy8YnGE4k+tp66ROixRhwh2mZsNSuz5rRK4pT126zkycGMEpxQMF66LlL3wt0d6Rik9h1flUux1IjssDqaX1b+s0rs7OXB106LvAmqCVTu3XmRykGRql2tfga7tUszwaw4q74iqvBvQ8Cj02aNedxe693uAW2WKmSEp2NDARDxrkNSjZKGcqnbYZzuXYg06IXu//DAO/+QtrDrLWk9xDYkMfbDLv2hSshBZm1hBanzVgMqZqbT66KNKGaIP4bdnF6SiT2NOCWvZAB27lWeEwHxTNwHMkVC8wddNiHl1zdSgqe1ieH/aL6DF7QRVTYdTm9e/cPkWugsvXqt3kRhunc/5Q6ryh2tDtw7oMIkJBrdZVijE6WoBNJshmWQCfJLNKgo8AEzMI6wVoXEL8YDhQsJ7aXImkxkpX1FlZLQ0GzpQ02GsdpRpiw9NRuEMsXppSmEswKa/T5JGckrDvuMRd9P6TFnDom+KEzt43zrtL+WGVujBStgbAdqBfIAR7h9NJsvHRDtpGdVpB4Teizpd4kyvHqqFWRo+y75L1Hm2rpcs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(39860400002)(396003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6512007)(316002)(8936002)(8676002)(91956017)(71200400001)(66476007)(64756008)(66446008)(54906003)(6916009)(6506007)(66556008)(478600001)(66946007)(6486002)(966005)(76116006)(2616005)(26005)(7416002)(5660300002)(4326008)(41300700001)(2906002)(38070700009)(36756003)(122000001)(38100700002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?+lbi6aNuJ9frERTVrua61wlDezAlA7iZlWYIN7fINmeAZZ7gC2naHujyGg?=
 =?iso-8859-1?Q?ItRw8s4uPEw6OarmF63vmPRqH4TbPvUgWMXceADWYsIatA8fHBLGp1BSbz?=
 =?iso-8859-1?Q?Loti4yc/Rogu/36uo4sJ4gjxje2ttS54vPMnot7A/vBZayD12FMrDBRHI4?=
 =?iso-8859-1?Q?bBSS1Pjce7OH6O+9LreJMtStpNQlgWOayjk6kszbRfZpIKM7rBXBzGVxEH?=
 =?iso-8859-1?Q?Gi0nrbrjwXo04/AInyMmB6NlMZASgN6vFCE5n5Yrg+aZmzTG+EMKLfVqja?=
 =?iso-8859-1?Q?77WzhfSz39WmAnGbX0rompVrF9ef2Vs/IKDlkCnuIjRGe2tkUC1+als+D5?=
 =?iso-8859-1?Q?FOrWht8WA4YwrpfcQEZI9iG60Vo1L1rY52pGq7ostOsuBdBiPcRb43TPHH?=
 =?iso-8859-1?Q?Ueol9qPh5f3Yd2QKvH3Dr/7iOwYo6tMxw/ldlQ5FDurFa3qPcRQtfYFRTN?=
 =?iso-8859-1?Q?gtSGxVJ6Hu7jNWCMNa8qmHP2HbZRgjuf7cZ6EquTIrKLaV6698aZU0WmAm?=
 =?iso-8859-1?Q?2vE6GEYuxvEKAO/30Xzh1Xm6dSxpULGSLHBLY7IcsNpPg8LI0mER9WI9nQ?=
 =?iso-8859-1?Q?cotDzIq2nMzdEqdEazxBHBghYxEnJpqUZIkAcYuwk3TLMNaJOyAgq8Pgll?=
 =?iso-8859-1?Q?L1+mm3GLTv91eBeWAL6UYG53SwTr9yCFd4YkYKVJn6Ng0gyTa4eFscuyzl?=
 =?iso-8859-1?Q?DG3y6VZSAIagKjhYq8hCTknWzWAmyDJ3tiDwPHsMov28fIM/mGSbWgOH9m?=
 =?iso-8859-1?Q?Yh6SyZ2hlFuSwWpaesXYK24g8UpzKbCIM30ItysY3jp+7PA5IPz7Mv1l0g?=
 =?iso-8859-1?Q?czZ2SH0PQVSSnfn6X5/hhRsaeplAC9yRtM71TLnH7/NBUmF1ZdEttGbis+?=
 =?iso-8859-1?Q?IxrKS7RN4zzb7JHU8SC6MaXrT83cn7L4ioqPUEFk8z5bbETuYb6R+xPzsQ?=
 =?iso-8859-1?Q?RGGXQhfEZtbtdvTUKYVgt3C8Gvibzn6nlSB4m9cG6776GccnBXutJLvLJw?=
 =?iso-8859-1?Q?vlMrdHxRSnkMwOOwjnFSvx3F2GqWJFmTQ8RDqqQoHeT1U+KWUIWreR/J+L?=
 =?iso-8859-1?Q?01Yu7Skw2eJLkGWyxDhReXFcXKW4HRuDiuHwrHgQtW2A1rKer45sAM4Cpw?=
 =?iso-8859-1?Q?ReTDEswZPtzCWU1BK6u1X1N4PP4AtMCtaeegO/DRE3xkB/w+eB6qycevvf?=
 =?iso-8859-1?Q?MNKt2EuyPQkAyuDQFYuKn2IYahVVXjxCaPr3cP/Nie7uU+ACI9mz+RXiN3?=
 =?iso-8859-1?Q?nblH1InR6nlnQZ8QRJBmZcSX2+BjmnNh/stNmkwvR8CJNOIjb7Kbsk6rZ1?=
 =?iso-8859-1?Q?9tDjRfmNgfNSkBrcMoL2UqKlciLj+K5bDS/OdsoYsob+r50BTpNEQgN+hT?=
 =?iso-8859-1?Q?swCvMDTxC6t3VL5upjCk11sDfFykHjAu62SMcAP9BChVrUG5iuUizaXpTf?=
 =?iso-8859-1?Q?lF2PM8g67EL92iJyP8dMJeCYdqMTWVFnesnzjMPBsBbk66Xm8KhMsTteC9?=
 =?iso-8859-1?Q?iuKx3GpHjuK0qWY3S6lvx3F71LVljlm+VyAB/wBarEhmJj5NQd1Dlr56wX?=
 =?iso-8859-1?Q?ueHmeIr84VvDUp2cWS34HqGMViRJWuUvkpIS6GXkKW0n086sKHFAnqKtVc?=
 =?iso-8859-1?Q?7Nz6RT2XEpX4aKS67U1z5c08uikLY6HtqpsGt9Ad7MiTtfc0qrn9WGGg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f88ff70f-1cee-49c7-e899-08dc14e7d2be
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2024 10:01:48.4875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xU8y1dzsgJBTXYH6uKf1HxIAsv6kZZPjwbzyY/krqW/78fMQNJL8565+piR+UDJXruZQzg7aMSTweLvqq2rSFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7725
X-Proofpoint-ORIG-GUID: ufgqS3AlmZpHo-UkJrog7CUcX-A3IAEV
X-Proofpoint-GUID: ufgqS3AlmZpHo-UkJrog7CUcX-A3IAEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=535 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401140078

This series adds the base support for MSI injection on Arm. This is
needed to streamline virtio-pci interrupt triggering.

With this patches, MSIs can be triggered in guests by issuing the new
DM op, inject_msi2. This op is similar to inject_msi, but it allows
to specify the source id of the MSI.

We chose the approach of adding a new DM op instead of using the pad
field of inject_msi because we have no clear way of distinguishing
between set and unset pad fields. New implementations also adds flags
field to clearly specify if the SBDF is set.

Patches were tested on QEMU with QEMU virtio-pci backends, with=20
virtio-pci patches and patches for ITS support for DomUs applied.

Virtio-pci patches:
https://github.com/xen-troops/xen/tree/xen-4.18-xt0.2

ITS patches:
https://github.com/stewdk/xen/commits/pcie-passthrough-arm-vpci-v11

Mykyta Poturai (2):
  arm: vgic: Add the ability to trigger MSIs from the Hypervisor
  xen/dm: arm: Introduce inject_msi2 DM op

 tools/include/xendevicemodel.h               | 14 ++++++++
 tools/libs/devicemodel/core.c                | 22 ++++++++++++
 tools/libs/devicemodel/libxendevicemodel.map |  5 +++
 xen/arch/arm/dm.c                            | 15 +++++++++
 xen/arch/arm/include/asm/vgic.h              | 11 ++++++
 xen/arch/arm/vgic-v3-its.c                   | 35 ++++++++++++++++++++
 xen/arch/x86/hvm/dm.c                        | 13 ++++++++
 xen/include/public/hvm/dm_op.h               | 12 +++++++
 8 files changed, 127 insertions(+)

--=20
2.34.1

