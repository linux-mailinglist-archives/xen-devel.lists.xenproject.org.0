Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DC9664089
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 13:32:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474652.735926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFDng-0000k3-6G; Tue, 10 Jan 2023 12:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474652.735926; Tue, 10 Jan 2023 12:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFDng-0000hc-3P; Tue, 10 Jan 2023 12:32:20 +0000
Received: by outflank-mailman (input) for mailman id 474652;
 Tue, 10 Jan 2023 12:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e0qL=5H=epam.com=prvs=537488b4ae=dmytro_firsov@srs-se1.protection.inumbo.net>)
 id 1pFDmc-0000ge-Tw
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 12:31:15 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa3e1930-90e2-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 13:31:12 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 30ABkmv0026793;
 Tue, 10 Jan 2023 12:30:59 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3n17err4t8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 12:30:58 +0000
Received: from AM9PR03MB7236.eurprd03.prod.outlook.com (2603:10a6:20b:260::7)
 by VI1PR03MB6254.eurprd03.prod.outlook.com (2603:10a6:800:13c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 12:30:54 +0000
Received: from AM9PR03MB7236.eurprd03.prod.outlook.com
 ([fe80::68ef:4767:a0c1:1e3d]) by AM9PR03MB7236.eurprd03.prod.outlook.com
 ([fe80::68ef:4767:a0c1:1e3d%8]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 12:30:54 +0000
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
X-Inumbo-ID: aa3e1930-90e2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGzgA29UvOkm1k4l4psEE/DOudvnTyBOgoEN2DTcBCuZlrQGPGQqLTcH0onnD/tS7jp9elG55GtWCrv064SPPcNg81DiJIxs3gVrtjtM4BA9cuBpuuJCXYx2zNHZ8VZHyfEnUduNE4abF8Oi5PUiSzUmVDaY7GUWBWAKFbm6OTdBA5lYWeG3leiLyEGNHQNVTY1v3xEBmC9bZNy1y8ofviUz1yGCUCxh55hdWuzbXlFCRKiNBfHhyoJIdxa1GypAAPs3Fz/d4H9t8Uf19N04VZuM4AweqPB9IJOfPdojFigAG2lh3AUYjRB5g6zngiROWUKKXdjtysu/rjIL8vPHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lf7/dU6ySl6QfRKApcvqrJXLdvlk5ei2aKPHk45OpGY=;
 b=G0e/Mx3IOdM6akqM6KozJG52Dx4/FwLI5LWea/0zErQcst2HDqbAbhJKb7ARUhAWRTFmvdxFbyttmML1Lxj7y7FDLF0zfC1HcCrthlkbAZrSQNOWOm6Zgb3oKdUSjV6pu69KgXet92u+oQe046KFl/fc+Z4q5FxsX1taAyfh9FmOI3yVs98QSh/JX8FB/PsVFSqWcxvBwrOHnwEfG9ppqpj2KWdohSv+IJLqu7jV7s0WrfGiy7WdCMqXF94DApUuR+A38WynG4rxk60XzWRBtNPNShJoNVqak504afi+6K1Ga8ey/niMwoz1kkEnU1vGsUvfS8Fj9LuId6EgCaqaOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lf7/dU6ySl6QfRKApcvqrJXLdvlk5ei2aKPHk45OpGY=;
 b=nQQ74AdvvwPVJe7JKLRcwTUv33g8D+IElg+m1ulQwuyWkckzZ0cZzvBbexelZsG2wiMLDKG6pnlkCn7aIqG0FmghUqw4h2P+OxyGDNnG5j6gBYgyfWXQbzgZh/ImqosJ87Sa92ycfS2XRFTj4TcgKzwLJkS6+PjNSx4kSBA8j2q6tbGPsoNkZtQE8wi8WW9g/vKlupKt6EhMJhUTcoZnd79jHKvv66lu9oGq7YSSQNKwOTI/ac4R5tvpdMthH8KVsPLbhMDPkSQmwuMScuNhlgEe5QJS9IE05nvhJtO5qXqiJQrGSq3eC/KHvo5pWFIO9EfLQBa+oHwD+bp4N1/Y/Q==
From: Dmytro Firsov <Dmytro_Firsov@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, Julien Grall <julien@xen.org>,
        Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        "michal.orzel@amd.com" <michal.orzel@amd.com>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
Subject: Re: [XEN v4] xen/arm: Probe the load/entry point address of an uImage
 correctly
Thread-Topic: [XEN v4] xen/arm: Probe the load/entry point address of an
 uImage correctly
Thread-Index: AQHZJA3n+pyXLJ9LxUm8V6NVh68Qyq6Xk1OA
Date: Tue, 10 Jan 2023 12:30:54 +0000
Message-ID: <ff1aa8c9-34a0-72a3-7a9e-c9a4fee93561@epam.com>
References: <20221221185300.5309-1-ayan.kumar.halder@amd.com>
 <e26768b7-99f7-f4e4-6ae5-094d17e1594a@xen.org>
 <20b15211-492b-713e-288c-14bd5e137ed7@gmail.com>
In-Reply-To: <20b15211-492b-713e-288c-14bd5e137ed7@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7236:EE_|VI1PR03MB6254:EE_
x-ms-office365-filtering-correlation-id: 12fc838d-69c3-48a3-2a12-08daf30684a1
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ktbrtuoYGznAsYVqL0O7ZIclHWX8hL2PEvXLSq15BNsEmx0GsrNPzm+20OzycSr2dnum/k3MBQDABC60dgMezjiTRDWTOtygMBYbM3uH+s6ovmPZFV/6DUS4mAO5hcc/cSIhEDVqo1dXv8C0gmIAzfR7bZqkkkJ/UTtIPtZx+vP2H7wCNkw2hxb4S3nbPuOgpTIkhzXUEKJbI44DCzt7u121wRw/fQqevPTCqBalf+MBlKtjq2rVlWVJwvQArg1csYN2n0eXguclprn1ghQOm7aGjZZX2hFW9E+ll1oVS7yr0qwqWz0Dblq3qxp4xXr2b5tIBXCvnfDDLAeSVptDDSsJxPaprTQ0cucfEaGumjK5CCbCrHQ0GWkub3vu2gkiBett4pHAnzkqOZ24ZdEhvGNThft02UKjLuIxBT0Sp+hGhAFH8PpUea6+Mb9M+loXsBSmsTcUZIVSGrzbU9LVmBm49F7sk6MArqSZ+OL1llvqRgOnUdz3A291+JJt3iTBOwOo1nWEfcc2e1AU5UGeUyTqNN3a2JORTz6tqrEfyr2UkgNNTmVIjIex5usGqDD2QGZYFqIo7erYCKUB1+d6TbqlGp8G1ce8UvhRGCd8GRS+tY8Y+6tOJ1vWK5/F3gQXxI4zExY26lwWwoAi71rtOW7xCOY/EsuVzAj+bk0iML/owQbQjScP3qBQycDIa7grUTfXUHVHY4ey3kJr/3xJgm3QUxGzNROMYYSuF1Ng4oE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7236.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(41300700001)(31696002)(36756003)(8936002)(26005)(186003)(5660300002)(4744005)(6512007)(53546011)(6506007)(83380400001)(107886003)(6486002)(2616005)(316002)(38070700005)(54906003)(110136005)(76116006)(8676002)(66946007)(66476007)(66446008)(4326008)(86362001)(64756008)(66556008)(71200400001)(122000001)(91956017)(478600001)(38100700002)(31686004)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ujXXo7wbXC1RvQnSm2U8C+UedyT6gblLWo/PCNuqEYtRDrx4ZN/3MruVjD?=
 =?iso-8859-1?Q?n+C/aGNvChrm2tiqBQ5Pa9o1AyX85PPMEanyykQKZCooviszjPoebAMYY1?=
 =?iso-8859-1?Q?i1SgnNy+LaVcI2SB1GNb/dJcU3HUonXriXehPywA9AiVHHWEz3QPPrxO9h?=
 =?iso-8859-1?Q?QeYV9sbe7l2dpingaBmmji0HhjmmXeHusFGRhNiBzPHlVBE7eNWTI0rer9?=
 =?iso-8859-1?Q?n/0rPcD5ARjd+e7ja1O6xdGOWAluvvoyNszFr8msWFjLF0JRSTRJ9gS73v?=
 =?iso-8859-1?Q?TuNbHnQaI+92Kb/ubLtUgM7XOdhNM0E0I/nxsNujCOLY8sgBymajNH2Qeb?=
 =?iso-8859-1?Q?TkTVfPYtPLRZEOCzG7rZfNRF0VZP+vT3shxjjKLjWPW/X3sM93wQu5YXtF?=
 =?iso-8859-1?Q?GFE/iLLUTfCo6tS8H1VwwX2Vc9sJZdjtmcHg5/1iIgvyJqHjQzgulyWCMq?=
 =?iso-8859-1?Q?8eobr4VS/emxOl9wsA1tkpX/beD11invdjQAh0l964GhGESabtW80F66s5?=
 =?iso-8859-1?Q?rwd2Ago3ZXCXzPVIxSh4PNUQakHl6YRwPGiDlpfo+vFFNFgc0p0edELHuG?=
 =?iso-8859-1?Q?BnrLz1iOBMPp1hWKIMWWO3974tQYBVzUWCYAReYgObOQOMAicBkdEofTV0?=
 =?iso-8859-1?Q?asS4IsfV0b/zWzxfQbRgcuRMuo81fd3idG/jX0oSoIE58IVoarVTgWPbks?=
 =?iso-8859-1?Q?8enDKC7V3zyWjGojiv6kIGZIBlvQi8iDPwD2M8YqADKRvD7KgHGWloJ2IS?=
 =?iso-8859-1?Q?M/DcJblGpH0aynZkQyvcquWRtP+K81XdOGyPOgWaVGQacHv+lIZ7EZRbAO?=
 =?iso-8859-1?Q?9axgb5P1Nx1dgnrjvuiVWFQJLAqnh2kFvkrrw+o8OteCDScIm172ViEBjH?=
 =?iso-8859-1?Q?vQd1JaTlqB/cF8XkZbMLDLsGt3fE6XctyrFvDptRSEYl7aulMThRIkwUgO?=
 =?iso-8859-1?Q?ETi9Qmzir4KG9MsLj8EMAPzYr15CvvM58BSzK9j36DFBKhVsupemoK9sLa?=
 =?iso-8859-1?Q?ETMea7hIOyWbvqyQHiI1wf9XgvND0NVaTdDky8v0cIH2gu1ABsWTfGB1BH?=
 =?iso-8859-1?Q?QuDNZwx+jI7uHvair8RiMsI7gPHnNQAUFmsUeTcRcJJklL8dVXBCCIfaBC?=
 =?iso-8859-1?Q?qGFjpsjRf1bHJke/ac0UymWolb8r0dR5jsAy/YL3lBthaS+9NCw1NG2Njk?=
 =?iso-8859-1?Q?T6yyVv2WprfNcE1nfd6HbU4+UgB4yCatVVV1/kIoVip3YiKzjeBpc/qn80?=
 =?iso-8859-1?Q?qAAXC5wrQVmeRqD28meabpmvx3sDI0Fiqmj77ZQ4u3QZqBXAWX/nlebgmG?=
 =?iso-8859-1?Q?TcMRWZbxj397+MeA15bcyUSyCVA1XeWTPMVLaQ/YpY8OPxQ3iwDUklIgys?=
 =?iso-8859-1?Q?MtPmlP+jVUzzpXWKytUPPcrkVGJ+RvGXOFg8gIJXlA1LB/walPy0BjYNm7?=
 =?iso-8859-1?Q?2tH2PGtuea0Mby0wu21e2zrnPKogGWxkFLGT2SqBqxbywWgvAPTmtL/Hn3?=
 =?iso-8859-1?Q?qpikg4sIcSWmGAbsRYiFGa2/MnhURH7JTI4apnCdv01rS5R7463gYdZgkM?=
 =?iso-8859-1?Q?xLgkTMPT9unIEbfrY15B92oO9UXHVg2Cr60BA9MiqWxgNC28CBm5wNbhUa?=
 =?iso-8859-1?Q?w3GDle5MiA6O+kDurOU6XLO3KjpwydTVXY?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7A3D33046E4EBE488E4E03D2A1218C03@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7236.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fc838d-69c3-48a3-2a12-08daf30684a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 12:30:54.6541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 79kGecerfhfBG0RfSJ0OwPqxhf+bGisESPibmJEMbxSFhfXAygPfKJbiZkd1cvLd2EqqN6pzE6phnFox1a4dNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6254
X-Proofpoint-ORIG-GUID: z3H8DiKX1ZkaGBd0ItTS3ZR0S0FCwxjP
X-Proofpoint-GUID: z3H8DiKX1ZkaGBd0ItTS3ZR0S0FCwxjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_04,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=671
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100076

On 09.01.23 11:36, Oleksandr Tyshchenko wrote:=0A=
>=0A=
>=0A=
> On 08.01.23 18:06, Julien Grall wrote:=0A=
>=0A=
> Hello Julien, Ayan, all=0A=
>=0A=
>> Hi Ayan,=0A=
>> ...=0A=
>> The changes look good to me (with a few of comments below). That =0A=
>> said, before acking the code, I would like an existing user of uImage =
=0A=
>> (maybe EPAM or Arm?) to confirm they are happy with the change.=0A=
>=0A=
> I have just re-checked current patch in our typical Xen based =0A=
> environment (no dom0less, Linux in Dom0) and didn't notice issues with =
=0A=
> it. But we use zImage for Dom0's kernel, so kernel_uimage_probe() is =0A=
> not called.=0A=
>=0A=
>=0A=
> I CCed Dmytro Firsov who is playing with Zephyr in Dom0 and *might* =0A=
> use uImage.=0A=
=0A=
Hi Oleksandr, Julien, all=0A=
=0A=
Current Xenutils/Zephyr Dom0 setup uses standard format for Zephyr on =0A=
arm64 which is zImage. Thus uImage changes will not affect me.=0A=
=0A=

