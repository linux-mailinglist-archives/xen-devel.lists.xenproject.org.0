Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F15017EAB58
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 09:10:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632184.986289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2oUS-0001t2-Gw; Tue, 14 Nov 2023 08:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632184.986289; Tue, 14 Nov 2023 08:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2oUS-0001qS-E6; Tue, 14 Nov 2023 08:09:44 +0000
Received: by outflank-mailman (input) for mailman id 632184;
 Tue, 14 Nov 2023 08:09:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q3bb=G3=epam.com=prvs=5682542b74=artem_mygaiev@srs-se1.protection.inumbo.net>)
 id 1r2oUR-0001qM-0b
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 08:09:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2841e77b-82c5-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 09:09:40 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AE7MchL015487; Tue, 14 Nov 2023 08:09:31 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ubpk9a58x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Nov 2023 08:09:30 +0000
Received: from AM9PR03MB7680.eurprd03.prod.outlook.com (2603:10a6:20b:41d::24)
 by VI1PR03MB6591.eurprd03.prod.outlook.com (2603:10a6:800:19f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 08:09:24 +0000
Received: from AM9PR03MB7680.eurprd03.prod.outlook.com
 ([fe80::cefb:90c8:9d6f:7b14]) by AM9PR03MB7680.eurprd03.prod.outlook.com
 ([fe80::cefb:90c8:9d6f:7b14%7]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 08:09:24 +0000
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
X-Inumbo-ID: 2841e77b-82c5-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSWrWuHT+K6Ev7EmIwnooFvTibmQHWkm6bIH/09iG4I/AecVOwhEehNjZMfrqOWOrfXOwX0BVZ7PVaKUk8EzYwO9/rKOyPbv7DIKoAdndB0eR6vldxrZACLcc1II+kePpns3xQtmpNR2atbmE322Q+m85OfqoXOA4Mg4uUPHxg8r9Mt4u0EqnXFkPsEcaeNa5lEFd/70W4VTXXhdz7DZAE2UM8wDW6qVdHp8Dv8nQGIWJnSHuvbgkseGhisArTyZRdZZAApm9qn+Dwav+48WzkJtIuh+dbK6MoU2DnyOg53CGR4Kfuk3+FFvON1T7aHKU07v8lOpCUqnkwU3rp2vVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgFwG9Rush+7cKU9jw1scZ8gNa1+xxLag5ZuEc4dAGY=;
 b=Km0O4knLrSqkqlz16z+tJlX2t5TTgdvbFGMAWy8MLsmbxXlQiGuE3GkWMkKi6OMXxHwzDmNLGRZstVIjmMR9SQNqhJqsPjWfyb5Mu/aPxn+vLN2HJQUm1a5X3+Xpk/nwNpdaMVm7+8EjjMN3kTolQJYYhN7xsdfvN9seljq+xoW3uwv4YIeNGRXk8m2RlQQxyarzJ5ISX+SrJKG/ILH6K45dc81zDof1lQ7RfReu9aY+qCzb+epd0/frUyI5RpWEIvzBPHpWUVNoKTNoEmGjkEhYw669haUYA1Pypz7yCmD15CqAT5Si0w0R0rflTeMLm0lLa9spuhDuEA9FgjlGHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgFwG9Rush+7cKU9jw1scZ8gNa1+xxLag5ZuEc4dAGY=;
 b=ELrFNibl6RCSGsqAYf3Haa2Yq6G0fRV3DXQK1KEWC5F0vgNN/gfehW1Er4wNs+TFSqZJhtN99Z5swMTm1ZQ3x3LTQOvYYT4tWLTwMPqR8k5PIsU6yGsLjiWspj35AARKTgd53fI6rKJKqmk5iMfQRyxoCq2442rekEH3Xy+xdfUpVhzCLSanKj/ZuyNpDH2J8q8WqIAQy/PqVuhrgs2XQ9siFOW5mztK2DK+9fiKwcYvJSGskipu+2f2Gfoqos4w6h1JqoYy2N9w+H3YdlxoO6JFu7to+3H1cDIr/lL2qoE4vEws0IHNGTh1m5Ghcwngo30Iq4xjPuBBbsn061em1A==
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD
	<anthony.perard@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksii
 Kurochko <oleksii.kurochko@gmail.com>,
        Doug Goldstein <cardoe@cardoe.com>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: Re: [XEN PATCH] CI: Rework RISCV smoke test
Thread-Topic: [XEN PATCH] CI: Rework RISCV smoke test
Thread-Index: AQHaEyRiRGjxF1HRw0OhccL4raMQTrByM/8AgACIxgCABaGGgIAAmjOAgACBcQg=
Date: Tue, 14 Nov 2023 08:09:23 +0000
Message-ID: 
 <AM9PR03MB7680820572D62B6A6E409D3AF4B2A@AM9PR03MB7680.eurprd03.prod.outlook.com>
References: <20231109154922.49118-1-anthony.perard@citrix.com>
 <7bffd0ff-290f-461c-a0ce-35440b36240a@citrix.com>
 <alpine.DEB.2.22.394.2311091657150.3478774@ubuntu-linux-20-04-desktop>
 <a12642cc-0b2a-42fe-9eff-a5a8642d3373@perard>
 <alpine.DEB.2.22.394.2311131612460.160649@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2311131612460.160649@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7680:EE_|VI1PR03MB6591:EE_
x-ms-office365-filtering-correlation-id: 8d7169ee-3c62-463e-6e3f-08dbe4e90377
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 22/yrY7d/A1r6ThKleqwbfXocNkRCc06Qpuz/pJ3D2znEyV2CQJAi23p3Q5IwEDF2o/IGDJtcoSpGwRUUY+gnudj1+wKwaobBvajTbwRQ9StEI9X4+Ux2uqql2mZ9OfeauwadQ3rXOE8dGrnxOFUKoOLKB9CginFxuhiCRYiDmXojPfHw5bfwKKWplA1PHiIK+abKLHOEbiiMW8a7XSL9i3S5xkkYt7qCWktRTmUorp/esJWPRKbCWgViDd8MEDiO8W9yf8Pedn2th4xmV67SOBqtqiWi9iT0eZLzXXx6apBKe9zpHIeV7YQf0XXGjR+PRgLWcfI242y+Hfxf1144MW6ia4FpBAvYDKA2BYVoe8IbeJIKaKzmsSvnViZZrhgEIxHFeFYMcIP1kdyuJtsvRjvRAoVgDV0WBaOGLZC9R/ML9SzE4m0oe3euEoXruDw6zzYfo1zpAvMXusg4xMWjHNtjXG7ePuzRB/vVNSZFR79h9jB+Za3S3ML/U7f1jcdzs8mloV6IZ0Wpc9e8vCL69anunCQ3BSgQqpIP3mWhgzNFzMXlynJVrBJwglzZOM6hmTDVCUsHac9bNAIZ9dabKT/6AszEldF1J8M4niNnujjzVOyqiKMCP8mOLvmXo79
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7680.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(39860400002)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(33656002)(86362001)(38070700009)(5660300002)(55016003)(52536014)(4326008)(71200400001)(6506007)(7696005)(55236004)(83380400001)(107886003)(64756008)(2906002)(54906003)(4744005)(76116006)(66476007)(66556008)(66446008)(316002)(66946007)(91956017)(110136005)(26005)(9686003)(8936002)(8676002)(478600001)(122000001)(38100700002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?imI24jygqkuKWi3O8qhbwTaO89gYl+GhaNRUUQ7PK2fnsZ+4VrHkrGYtsl?=
 =?iso-8859-1?Q?2SzK1/hnNq8rFV8U1P2Foky4xZ9ZXH423KwXj9kPPMZ2K0Xd0y3w/8tTxs?=
 =?iso-8859-1?Q?O2oB89pXATC5+AWqzytGoPaZ+JMAf3RTNn67ZNT+vWD/i265GPMDPGXLFr?=
 =?iso-8859-1?Q?yWPoWXVSeQgiQHNQ4MBmiFUkOkeaVIXQ+hLyOgxV0EE953o6sAQQaQPCRk?=
 =?iso-8859-1?Q?VzjJtyZ5A6pmaVfC78gD7IzoYkje/zd6eIWdD2StGRmA6y/ru44dmY0WEd?=
 =?iso-8859-1?Q?9nwLQ0uZGkzyi6+rroLgbC5P8SI0lFy0MbK8jyqCyThjZK/jH3Z0dQD6V9?=
 =?iso-8859-1?Q?MD9ldixDyfLcrLJm1mf5bL+SXG8cpbiQvmmH7fOWirRGJEGSnOibx+pc01?=
 =?iso-8859-1?Q?CEAU6YU5dZIL86j3eqRMBNaHnC64a+97kWqmQq9nKoJTnOo8Qa8eR5Mxz1?=
 =?iso-8859-1?Q?1gpwgMh3gTk74WNWebWNQw7kvfD3Sqyqu9lCyDoc+u+gXcJuicOkMmKVNS?=
 =?iso-8859-1?Q?UPG1qk+NFgCp1OcHnJqmH5QCTeNE4gDziUM8r/pO3J1toU2V/ztuhnIOgz?=
 =?iso-8859-1?Q?kJWQ82Gegu/1/qTPYKbgYfrLB/ca1VGilf7D4ORRSX+NshFy/5ScvhnrAM?=
 =?iso-8859-1?Q?0qyzzatGz5tDX/DNjN3kozukOdBk9iKxh+bcesQv3c6ClMVCIEnMXQl2pA?=
 =?iso-8859-1?Q?mHRle2yUXdixAyXTEYbNuTwkFZaJC4tkT0M12W36sC4xEvJzQbzwSXYt2N?=
 =?iso-8859-1?Q?QMfGajXsm+NqbNVOhLBwowZ7VGJ6yC++/CtuulnczOZ+jManSvjBL4uqGc?=
 =?iso-8859-1?Q?EioKGrE76oIigJv0WIkB8Qk0Hne1IvTDF756+ZySt+Onm2MjF9LNENzshA?=
 =?iso-8859-1?Q?BhA31pcphfdfw+vUeZmc6hlYHQfJhlpk/tBNemAsm8PnKpOPyINjSNHXo7?=
 =?iso-8859-1?Q?iaFv21yTkQUL0HQBrwd1Wh4RIvE7QAZ1BDXCAz8KRf47SAkwMjtrdIBkt6?=
 =?iso-8859-1?Q?1aFCl6nWkzJG7CueJ9hvS8v7/DV57ZqetKAizGPC1+996r89c+0guDxQES?=
 =?iso-8859-1?Q?u9u2Mv87LF5ahybgBlangJmSQy1elJuytdn05JmIrt3lS+SDnBJImeImyC?=
 =?iso-8859-1?Q?IBhubUWSSE2sruHmf1wY5sMyr5slSH1Ib497R7Q9x+JIvcm6iXk34NvIRX?=
 =?iso-8859-1?Q?dVZk0FPrPFBl06b3yrM7dUnmPE6dToTqil5DuBJGSJdW8NIVCLLBd6RXM1?=
 =?iso-8859-1?Q?YuJVfEh6YeJOg+vjujFSUckND6sielev8YykxvqGZSuWfiXN2MHSjjiYBs?=
 =?iso-8859-1?Q?W181nCcOn2VTQR5oqYZ9V5ZhnZs4JPkJeK3uvupVe4VSPEpVpxx1XKN9G0?=
 =?iso-8859-1?Q?NJ9EyUW4WiqmYVKhBAXOg3hphV5/afG0zBxVy+W12O9+c6xB4KUz/311Dp?=
 =?iso-8859-1?Q?CVbyuS1Ww5UAji7D6ou27rUmxcAgLrdX7huWaJTiXZ38s8AHXiTwUgyNCR?=
 =?iso-8859-1?Q?/8TU+xBz74aPaPO7pXnzOZwsUPOVXfTYmblEdMOdv3An0iyOD5jDY1tlx3?=
 =?iso-8859-1?Q?KtzWZ+jmOQ7nsZ5520YFo+yymM7mMzMoBWtxdqvt4pzvhMKxKV4GNicLY4?=
 =?iso-8859-1?Q?tmSBEpx7APVP6cF+Uv3fcYW+XComL6Sq8R?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7680.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7169ee-3c62-463e-6e3f-08dbe4e90377
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 08:09:23.9451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8L4edH8HCxuyd9UaU1CQYiW3jjrO6vM349I/NmC1F0uEGwFJwnco/B0Hatgb+LTOorPV4xvcmziYRh4pgR3RbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6591
X-Proofpoint-GUID: NFuWF-KPbpbV-PaTJeAQ9LiqnQauscEc
X-Proofpoint-ORIG-GUID: NFuWF-KPbpbV-PaTJeAQ9LiqnQauscEc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_07,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140062

Hi Stefano, Anthony=0A=
=0A=
On Mon, 13 Nov 2023, Anthony PERARD wrote:=0A=
> On Thu, Nov 09, 2023 at 05:02:08PM -0800, Stefano Stabellini wrote:=0A=
> > ### qemu_key.sh is using "expect", see below. I think we should be able=
=0A=
> > ### to achieve the same by using expect to close on the expected string=
=0A=
> > ### (instead of waiting for eof)=0A=
> =0A=
> So, `expect` is just a different kind of language than shell is?=0A=
> Also, `grep -q` doesn't wait for EOF, and just exit as soon as it found=
=0A=
> the pattern.=0A=
=0A=
Just a brief background on `expect`: it is a nice tool widely used in testi=
ng of=0A=
embedded Linux systems with CLI. It is popular because it is small and avai=
lable=0A=
for basically every distro including very old ones, and it is very flexible=
. We=0A=
were using it for ages in automated testing, so for me it was no-brainer to=
 pick=0A=
it when we needed to "interact" with console.=0A=
=0A=
One minor drawback though is that `expect` uses Tcl for scripting, not shel=
l :)=0A=
=0A=
 -- Artem=

