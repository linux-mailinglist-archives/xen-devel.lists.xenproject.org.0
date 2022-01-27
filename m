Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4828149E8B9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 18:19:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261675.453272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8QP-0007bq-8h; Thu, 27 Jan 2022 17:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261675.453272; Thu, 27 Jan 2022 17:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8QP-0007Zv-5G; Thu, 27 Jan 2022 17:19:09 +0000
Received: by outflank-mailman (input) for mailman id 261675;
 Thu, 27 Jan 2022 17:19:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OY7K=SL=epam.com=prvs=3026043c18=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1nD8QN-0007Zp-GX
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 17:19:07 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a3b6d23-7f95-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 18:19:05 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20RGRkeT023275;
 Thu, 27 Jan 2022 17:18:56 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3duxxbg6de-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 17:18:56 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by DB7PR03MB3849.eurprd03.prod.outlook.com (2603:10a6:5:30::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 17:18:52 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6%6]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 17:18:52 +0000
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
X-Inumbo-ID: 3a3b6d23-7f95-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnoF9JZr0q+iPbQTjj7pYIDTovIFaNklEEiVLHtMMJ9XYH24NRywqp5sqM+dEFNs/TrKb5qdTxZlwO6dklL4fWQl98oux24r3HJ10JWrKlAuuD+WQ+KSrNfXtAOdZ6DSRhbaM5n7ifQ1Xp+L7Rfxjr7u/e0ZrQdXxXs1xPWThXllfv7jXItcPM8Cc5n17uixecS1itphY1+PbDXd8976q5lf7R47n1iE5XwYvi/Eh0WACXXp5k7wPXYAFJLoPEqREXYrf33aEJCnGiXZjqWNSjMLJIs7f5awsLEBEvfBLsI11jyAiLS6O3oylGvH3jsP0DB0MIdkOJq7wwqfNiVytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kT+KpM4dXYi6LOx5cIQab4cJkY5Y7hJY7aMajLxK1Q=;
 b=Nw0ARgZpLWMgQ1SqlIi/jXvvnLGx+6fX7mEOKv6mGR2ImimWWyOX9m5W9NvbjXEuZdhQfFnhsYHTh5zBHOxzJ1fa8/fZkqXW/U1aPZQAaVTUxm1hh1Ka4Bg8i2m5eWoUU72rU/XeSrNH4hVwYCD5qNzgiC1J9cLJqS5szCKq4DqrPnREaX6oBV8h2bRKxZWk5abPeqSNHkVCYe7FQ8uGOvvEv3cvT5HhvXA38V4u/l47BcTibJogMjGwvt+t1qTcPfxTmALdfO5XVOZULemgTNmooPY64KCG1hwJggtWTh5MoqVzzIHydhNUG3gCTdG5p3RufHZv3zRQhlmxntKy7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kT+KpM4dXYi6LOx5cIQab4cJkY5Y7hJY7aMajLxK1Q=;
 b=PRyxypc2li4FrsTyqbdoovgYAAG2SoPSVOn1YXvIG4soj556G66BHDlf7uCfRs0NmrYiwh3PXxlmSd6KZxVg3iOM8hvZCp5iklw8FfX8mGHGHKbw4JS23ATIxC8JzVGHcXgzDhiVAcnYvnr5UQJkur5qiWwSkG2J0OW9z0AuoyauKhOZxDqtGa6OtWeEaEwvGjOWSUHtjLaLToxjWLpB+Qvfiqf3BiFNqjhhrwlXuKdq7E5f8BX1YAjxzcCGXKj0Aa7MdPqrp1p+eGN54j46DTUCMG81vUzDxW3tcjXQZmrr3HbWgiXgW2ZxMD2SiyrsEy7wOi3R5VecnEmk0CyjWw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/serial: scif: add support for HSCIF
Thread-Topic: [PATCH] xen/serial: scif: add support for HSCIF
Thread-Index: AQHYE59f1kOdWDtKEkSxzzo4QkJiKqx3HBKA
Date: Thu, 27 Jan 2022 17:18:52 +0000
Message-ID: <87ee4tgkr3.fsf@epam.com>
References: <20220127170008.271723-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220127170008.271723-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 610e6dc9-ef3e-4bea-f551-08d9e1b9171c
x-ms-traffictypediagnostic: DB7PR03MB3849:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB3849509692B843208C83B4F7E6219@DB7PR03MB3849.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 E1Ja9psMJCAU2vIf0aSgDUcXF37WUGsqdnP/r/qg0U8xyTxe9chJv+8OWbkfh7ulkrBerLvH8m4vk8cZG/4RMcYBtFCl9ufYHrYdaDoHmJhlK29SaqB2oEBND2XZYqqRTvKyB43KoMG1AddiBT5R2bvYBLgzMfRZXOZD5A8WcuuwyZmuS0VVpfyj4Bu0WnyvtEatbU6Jme/D/ik0SaxIA2qjQrvzmAbPJYsWK19FBoQ/oYRLTRvw9dMVocmYHJxW0oHoBCSjfB7JpS+m2P6bxiQcl3CQL9hA2cWB45IkFuW7LCAAHxCQJQWEIGSQgaA0eRiJmMa14Tu+nkwSN5uGnV+GrIiyFfZqg0MTWcK9MpAAgDnzm4F5CoLaajVadTQJF+pnrOUEj2gvB6BPeqkmWq/mlym6yi8ycv/D09X2Nycp+COggqyPk3iweeWe+PtI/Zs4BAgGpRi376FotLL8MC3Fkz8tsI8RHn0qPB/FYMry2n9yEPTL4utd7PHZV3+/WmU1uaKj7YCqc17l0symE73kQ3StV7uWR8OMbp3nN6OIuy1W6yA5WEvtLeuC1TmR/nGwcdzFYp9w0aiTfHSSIlSnZguBM4ZMfCazRvSDiAfMi4kcIxhmIOoakRziGI21CMeErSjlqHU8FywpdSO9Mzj6wIX7q+YMuEgH24WFHLSOK4lJ2ToAwALpXUFnoUQ7M5FT42QtViHkEX2suiYYVQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(110136005)(2616005)(6486002)(36756003)(508600001)(122000001)(107886003)(6636002)(76116006)(66476007)(55236004)(38070700005)(64756008)(4326008)(8936002)(8676002)(71200400001)(26005)(86362001)(186003)(6512007)(66446008)(6506007)(91956017)(316002)(66946007)(66556008)(5660300002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?DNmHSbWLCe7XQ448fGhBSPbRpvM5QZrKqVZwRk3R4vtbuHXcaLr/l/uEAY?=
 =?iso-8859-1?Q?P0Y6owxuEcZAjryDithgldoCmJizigD/uuhTev1yRs7WmrbQ9IRDRPCf+s?=
 =?iso-8859-1?Q?jTdbr/Pt7bOav8NuyqIKH6Q7nRPIWnZYFqqsHQ82qcJE9iOxqluOHlzN7k?=
 =?iso-8859-1?Q?E3knzfDlDhuKuV4/2kBWRhu912/HlsASl4PtSL5vFJmjkh2mVLT6YfGDnU?=
 =?iso-8859-1?Q?kBWBU1OjCd4WLrDOn+m872Q+UMN5UnXByqju7Uv2hqIiJ6uwUWBszSE5m1?=
 =?iso-8859-1?Q?yNp3azJH301W1vXDBkqw+qlEhiwOV+8gZb8Ir2aCdd1lDKBJAI2vsGN0f6?=
 =?iso-8859-1?Q?zRmZy0CxdSFwHy4a67160wUXBXlp76nFRWgknIVfoR/kW6Nbtfaqy5BJv0?=
 =?iso-8859-1?Q?egxloKCDAuWCKNP1QcpM9g29xmbwUFLf4dj8qUbVzOHeFaIA+KjDaRn2OI?=
 =?iso-8859-1?Q?WoFzAL56P6teLX7kOHqoLuNMndbw5n7+WhAozKSZ1UED9tm+dQ4Q66ndzB?=
 =?iso-8859-1?Q?q7RkCpLvlvN2LkD2jADJSquLWJM5BNHLW2KW73pj2qfrwGKCfqDm7AJUc/?=
 =?iso-8859-1?Q?SdSRozIM4kkn99jWgCAkU0zIFH7iVRqhTJL9BvR+Mlksg+0NFsHW2eMFuS?=
 =?iso-8859-1?Q?aPigMydlRgRbU3E0pAzmvD1UKkS87QjNZE0dSTy8Sh9cGkBnfibN2i1mHu?=
 =?iso-8859-1?Q?M4fOM9e4uVq75vmHFnH+EVG0Lvj3bMCEgDDzb6xMowlOjivRc6UJY37Ynz?=
 =?iso-8859-1?Q?p4zb8HYPTQn1kA/F4CGlf9HwIDis3cFLfP7Tx7SIZJgTMv6lk46lZFugdC?=
 =?iso-8859-1?Q?aa9zKbEhkTwYsmzQkF7wIDbFZjd1NLShsdqtwZp4/45th7rtLfseYMrJjA?=
 =?iso-8859-1?Q?XVwW2EAZcdyHljJOYZQcVwr2Y7YMZM01ntRnzJw+7JkQ270lj50aaJrNDz?=
 =?iso-8859-1?Q?LYUzKmvqNjr+UB5gVwkWdEmyZsmFjlasGx1Y88xQwsWO5XnzaS9Y9H0FX+?=
 =?iso-8859-1?Q?dEi9QxxtHoynQoLo5GgS0MbLW+eCX/HRTRJjLduQ0rpf03P7Gpv/8aOB2C?=
 =?iso-8859-1?Q?EbmB0BgX0w2KRa/DaYmr3sajsSicvansAcFUON7ibJm3OinjIGuJZJ4Yw0?=
 =?iso-8859-1?Q?BbDtvHiQZamlVTZIJCNmyqvcWkEaZ5cUcPM6Zmlc9Cl5BbzXexIqw6SEzX?=
 =?iso-8859-1?Q?iA2fcPn3f23+yY11/D9rQ+5AWZwHUDcPGUVN3pGBcJ/TQz+SAgauaZKmt5?=
 =?iso-8859-1?Q?AOcP3clrmVk1OaGWL26IhU3UupouistI6LPDs28AhoCfeO+ENxdqCrdu5W?=
 =?iso-8859-1?Q?sJ7qQHe8g7FTVjLPEHdKQ1KQgiJoAIf0dJFIKgQNKF4kPf8PPkV+95HWIw?=
 =?iso-8859-1?Q?5fN8tjicUtUYtYcQLJfl+S/Se+60xUegTOTE35lLHF/Og7HZx8Ez0EBY86?=
 =?iso-8859-1?Q?TnhHfkMCfdknfiRRHQS0YL4QVjc66302nJcrTcANgs2mfHGtQ6wdyfqrSn?=
 =?iso-8859-1?Q?hbN+0yKqoifDn5LjWA/m0/CP9gFjEBlo7ELmatyzT22beeHIAmxJ2LH4VM?=
 =?iso-8859-1?Q?0wWS0BJMedzsoRp3Cu5wW/5Znu11U/OHW+AjJBlsHLUC511pIR+7luq+AW?=
 =?iso-8859-1?Q?G13MuXYYv4Y8diNJuIAqIyWi2zCQSUQ85+Fd9jRZPP04eNAnS9ZUqqguCb?=
 =?iso-8859-1?Q?WcDkqA4/AUQROYt2Sk4KzfmuWrpuf2j7GHeh7dpFMF8l0ilmWMQ9X+rNQs?=
 =?iso-8859-1?Q?nJDoDRKx8p11ruV3m4Dcs8yyI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610e6dc9-ef3e-4bea-f551-08d9e1b9171c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 17:18:52.1984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+haKfZkgYTeRd/iasq6e3atmgDwGnHw/klbWK4u4PBpWSjcQCUCxy6pVhfmAmpFxECqWoCzDVFI7bV6PCSo9tZXIOYCJ0uz8FahuSLf2rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB3849
X-Proofpoint-GUID: XHrqTUaHO_rp1mo4yUKr5NF831APFehy
X-Proofpoint-ORIG-GUID: XHrqTUaHO_rp1mo4yUKr5NF831APFehy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270102


Hi Julien, Bertrand,

Sorry, I messed up with your e-mail addresses in the previous
email. Adding you correctly.=20

Volodymyr Babchuk <volodymyr_babchuk@epam.com> writes:

> HSCIF is a high-speed variant of Renesas SCIF serial interface. From
> Xen point of view, they almost the same, only difference is in FIFO
> size.
>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>  xen/drivers/char/scif-uart.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
> index ee204a11a4..8f4485bdfc 100644
> --- a/xen/drivers/char/scif-uart.c
> +++ b/xen/drivers/char/scif-uart.c
> @@ -47,6 +47,7 @@ enum port_types
>  {
>      SCIF_PORT,
>      SCIFA_PORT,
> +    HSCIF_PORT,
>      NR_PORTS,
>  };
> =20
> @@ -88,6 +89,17 @@ static const struct port_params port_params[NR_PORTS] =
=3D
>                          SCASCR_BRIE,
>          .fifo_size    =3D 64,
>      },
> +    [HSCIF_PORT] =3D
> +    {
> +        .status_reg   =3D SCIF_SCFSR,
> +        .tx_fifo_reg  =3D SCIF_SCFTDR,
> +        .rx_fifo_reg  =3D SCIF_SCFRDR,
> +        .overrun_reg  =3D SCIF_SCLSR,
> +        .overrun_mask =3D SCLSR_ORER,
> +        .error_mask   =3D SCFSR_PER | SCFSR_FER | SCFSR_BRK | SCFSR_ER,
> +        .irq_flags    =3D SCSCR_RIE | SCSCR_TIE | SCSCR_REIE,
> +        .fifo_size    =3D 128,
> +    },
>  };
> =20
>  static void scif_uart_interrupt(int irq, void *data, struct cpu_user_reg=
s *regs)
> @@ -288,6 +300,7 @@ static const struct dt_device_match scif_uart_dt_matc=
h[] __initconst =3D
>  {
>      { .compatible =3D "renesas,scif",  .data =3D &port_params[SCIF_PORT]=
 },
>      { .compatible =3D "renesas,scifa", .data =3D &port_params[SCIFA_PORT=
] },
> +    { .compatible =3D "renesas,hscif", .data =3D &port_params[HSCIF_PORT=
] },
>      { /* sentinel */ },
>  };


--=20
Volodymyr Babchuk at EPAM=

