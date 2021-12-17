Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E342E478937
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 11:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248535.428687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myAnS-0006o7-1F; Fri, 17 Dec 2021 10:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248535.428687; Fri, 17 Dec 2021 10:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myAnR-0006m7-UI; Fri, 17 Dec 2021 10:49:05 +0000
Received: by outflank-mailman (input) for mailman id 248535;
 Fri, 17 Dec 2021 10:49:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qsGH=RC=epam.com=prvs=29854569c1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1myAnQ-0006m1-UY
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 10:49:05 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2606591-5f26-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 11:49:03 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BH9m0D7032012;
 Fri, 17 Dec 2021 10:48:59 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3d0as79xv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 10:48:59 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7054.eurprd03.prod.outlook.com (2603:10a6:102:e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Fri, 17 Dec
 2021 10:48:51 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.019; Fri, 17 Dec 2021
 10:48:51 +0000
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
X-Inumbo-ID: f2606591-5f26-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pl+lIYrjntDrXMCkXShiqa1Ok4jnp4pvtCycccPPK2e9noGyI2Ijb2EkVH7AIjj5qdh52GjISoQYOxvOnbYnXI7AygVdKdzHAXW6Q3NIb8fmC9xkLE9B2W9pzwNAr3PoPTXFJ1j5ZX/hF4IxKS00fBodCjSBDURLRKm5jtnb3eaqgM9OesvwFTMk6lX279pUc75Qc4SQ9MoK3ugm88mycnpTq3S9ng+nQuNRdDLRhw0obVKNXdmBYBD4gRux86sV5f+4i3AIJUdnm75m88OOlJXJg/eN3cNNMrQSTIJnfgGEtHaQQkOOEgcOUut82TSgpnL2Asa1i2EfizmKAceeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6v4UI4Sdb8ZSGPH0XO3ltm2HNG6ZO4ThTLPKFRcAUo=;
 b=JwLI4rckJhsgpMmgrvm70NPqfHEdE1Hvr8BJdFR9FmQsF4hVAAoWzv2SpmrAcWSTYYo4CdU2WH24Ertk0XLsbPyL7ZJ5ksSy3mAM90T6wkmhdIIBfGfYpExEFR9J89h9wkesGGOBPulquHvEkSgHHcQzb377p7BIdNB+DHVjCB/Hrw4MpMQgHzwSgPguVvFr8e2VI4mTzcpM+TcKJI5CF9pVKe6o7ci6CxCV2prEbTgnM6TQiHsKnoLeGpkrtOUjIyXcyCBcOoyAZ9a5TOEQ7cbDxZuH1QHPT+jU0dGHHTD11ynF91ZQNm+J9yGLxczwkvsKyeJKGSntXnQh6+x9Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6v4UI4Sdb8ZSGPH0XO3ltm2HNG6ZO4ThTLPKFRcAUo=;
 b=R+DjoEJ9fx6ZWWw1Hoz27FoOKAlmBa3rapeEKAti78JOH0Fbjr1GdVd2iPzlCB0Ndnj6xm2lyicvRQVZWnahOe9BeSBof3SMlzU+fErSMqfFUKvNthndNomWuNcch/L7r0Hc2ENP2xU/U0phpelHQwHDuWmcBdZN9F9JsMnFVMdT9js7fxmc+NzvR99Z2pdWZnEWpVx71Kg6PsgOop4LlzX9/Abx7XnU4g5X/WkFsH87H1l414CwZRBWe82dumMzYCQfA8U9gWyBL1+OKflSiIGScIk/d4rkjJGJa4/il8fKy9gdPnlratmbX29PQW5yVxDmYa+HEqLL8/ZlrtU99Q==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 1/5] xen/arm: add support for Renesas R-Car Gen3 platform
Thread-Topic: [RFC v1 1/5] xen/arm: add support for Renesas R-Car Gen3
 platform
Thread-Index: AQHX8M3HLq8qFfw2eU2jxqbriRiMpawzTbcAgAM4BwA=
Date: Fri, 17 Dec 2021 10:48:51 +0000
Message-ID: <20211217104850.GA3974874@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <7ac8512b5479cf192b4aa399fa2501d0bccaaf48.1639472078.git.oleksii_moisieiev@epam.com>
 <35435638-a132-1b46-6add-b923f9f2785f@xen.org>
In-Reply-To: <35435638-a132-1b46-6add-b923f9f2785f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02a1a092-708d-42e0-006d-08d9c14ad04e
x-ms-traffictypediagnostic: PA4PR03MB7054:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB7054CCD50F753AC79815BA09E3789@PA4PR03MB7054.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 26gpuw33ScWreuKU6+VkGoHMYs1+O4rOsWIB8QWf2lz/ySM5tk/t4nEgQ0U/NLs4MFgS36LgCPEofvfNXsbubdS3ze5foXxKH0diYwekfXbRCHHrmyudyIfQ10Sf8Izg1DaWAqEhKlzM4gpgAyYq3kEmkxGmQOF/OvYUoJPCM/Ehr710JzBx4bOD3t7mX73Tz1TlN4kweY4Qy+KVMpRZOyC7M3uamkNPvs9fmGicZiVPKOPwo7VA7mqem0m74SwcEyaiwm79JIaUsyfnTxaPxy45k5g59PSPbgHCPMVSiuPxZfazhdwdZQTuCuzTEXO+MyxNsPMgwJqKWOWPrdlBQI0Qw35AmuA0laWIxo4Jh1Ygr1MTtWwRrtmHFu//a/aSwCLvFyE5QmNDWADQtBAkXIOpK/Zemgkv1qGYuEeU+l2AgLAGdUW/s005jRqImZqHHlo9+nlcFU5W2D0pLSYD/+A6Yhz7Fy93LDOsne/Loa66r0qBL0JUmj1dhY1BQn7nwqCYnbnfPpxOzdXk9dM2py0JE7Wbccj0IkQgWgOPdheclhtiZT4CKa+el5criCm2MPlIF0P9q+U0MARwblwDzDwlH0+Ri3KKlj3/K48UCqAMSlPgB4KPtnr2PrQzjP4gS+RI5tuMCM+vqlDfO/X3I5jCPx09wb467a+S7vuo5flWhTNZwinZzlwjQsfMVFPBKjSJZ4tnCnpPYxYY4bw4PA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(4326008)(5660300002)(6916009)(6506007)(8936002)(186003)(76116006)(33716001)(66446008)(91956017)(66556008)(83380400001)(2906002)(33656002)(1076003)(9686003)(6512007)(316002)(66476007)(64756008)(66946007)(38100700002)(38070700005)(86362001)(6486002)(8676002)(26005)(54906003)(122000001)(508600001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?f1CYU2N86Z75Iy0CjWdKbEsApOrQt8rqDgrX5mzQe6ds/IVb5fbubiasvBYh?=
 =?us-ascii?Q?++S9xSV/7CyzY1b6RwI4OJpw+Exv2zs8MfoUAoZqdfKxvXAOYC/GWIjodpJY?=
 =?us-ascii?Q?8Re5kUIcBc0hIBwgV4Xx3PSovw++Z9pccpTQ1227dvxUWLDW6JWUjKI4KzIy?=
 =?us-ascii?Q?mVPf/4Zn7DhKzJXPnNty5E14Ru0HpyDiwmYL7k64pkEij7z2jsZ1Mk5wCLCq?=
 =?us-ascii?Q?M/7f9XKUF4w0iPAS90Efy9vFMwcEtMcclBsDayTA65lBmKWbARouxs56oyP6?=
 =?us-ascii?Q?UEmYhvt5kaFiJpwlX1fq7Ht+o/rxRprNHrd3TJmBGMbkUAoMIAEWLL5pXec0?=
 =?us-ascii?Q?keh6gkll31unaSUuN0eBv477jBae1Yl+rK9olY8SZtB0UDIfMvaD4Vg049ij?=
 =?us-ascii?Q?6PVhccoBfLl7UR5tlmL7lS2Qy+yea8skrRJMLF14YH/jUw6NTgYZdoGOq7iK?=
 =?us-ascii?Q?WkDzCbXSJkOehjj4nlE/tPMN/yX5OjE9yoyGAzRdTTjreqAaCUGUDfVjsiAW?=
 =?us-ascii?Q?NEGUsL7kwDmN/b6VPWLacQsUCErUW1b1M2ST704kjeza1GVIPSizh4S7aJjO?=
 =?us-ascii?Q?q4KmrDg2LN+dMY0z12e3VsdM6UCgYWZQJcUfyxFc3CntejS0ZSkUrYytBg5m?=
 =?us-ascii?Q?/Lm/lYKo3pzi8EEVFzDLwG5q4vUTwRr+IgQf04h2HO64uDNJKP4TxaelPddy?=
 =?us-ascii?Q?PO7qTa7Po64a0LZbbr7ipYI6rLCjLlPpHTacJ88AZJ06AeGBC4H6dOaMSnqA?=
 =?us-ascii?Q?K3xUNInlnn/fJdoKTQ31jfmZlFwIUN0pakQWXOuJ2pimylYpK4FJwtsGkjns?=
 =?us-ascii?Q?WftlkjjX92bmiCAfYOJgF6kVnOGGnIYOXhaGn5ZgfsDzjhd7gaEy4Jp/yGzx?=
 =?us-ascii?Q?jAouZBOYOtHkpoELMSpZLEIe6mwt40yu+roekBfk0mborJNbqjRH1cXfHSpv?=
 =?us-ascii?Q?PKt4iNRss4lp7otdS+UfBCdXBOy8HKueqFnNDUmbtjuU/IE5RKQ3bx4+mLtN?=
 =?us-ascii?Q?LNUeUZ/kvTJZhKHaJIiYzzUJWymbl5zrkRbnzceVDA3UbQbxYZrl067EVtuZ?=
 =?us-ascii?Q?ZlRpN502JBJzmHAAPnguSBAsSr2ruH73pRxbOjyyZ9+5Gj1GVp4ohnrERRT1?=
 =?us-ascii?Q?fD3Gth5S2x9tDVvuvIU7TvLjEA03SSQLuk60tfvDMDpFReDOboamCtNTQ06r?=
 =?us-ascii?Q?K0wPRSx+PHiA2xjGJ4R6z+O5oiHl2bFqbmWoOF4D4x9vX6jNP36QMurPf7ig?=
 =?us-ascii?Q?3iE4AlklMIyuET8JJPuP2InMiV4bHcF7rYFMXN6jjGEpyXBGCT9+/lkrKUoF?=
 =?us-ascii?Q?kIeZQJK0kS4AdJQEI8ntlZDD7dQ0v2qNHcx0fmTtaZt3Lv3P0mc28QTNqrlN?=
 =?us-ascii?Q?2/eN/ga7WXaWRg6F1EP8nsE0PseymbD8hiUPfl4Sm6y8BkZ4Hf/Ea9o/RwUg?=
 =?us-ascii?Q?iO+RofagzCM5QKhYBfNN4NgEeiwYnHBG56TOyAA9+hI7pfM9s/d/q0mJwTF1?=
 =?us-ascii?Q?o7NFBdwpnLv7C73vwYpaSAN521Za4cEGQP9Svf1Z+dZQGz/OolEZPdY876/W?=
 =?us-ascii?Q?ZYAVe731389undQ/IEgE7zwpOP0iR0WixvcAiPiYz0YCxKbdNAmpybPEjifP?=
 =?us-ascii?Q?/cLqTEjXdsn2mlw1T0pUSXxC2AeGAm6HsmnxURjHlhXbbibj3tYNtM99YJnn?=
 =?us-ascii?Q?KEl/Dj9AoPaPsK3B5RPqTiXNDoc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <41C85C2E30260C4DBF59DB48C75D0234@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a1a092-708d-42e0-006d-08d9c14ad04e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:48:51.5055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3gVqC08hIq7ULx7vC34eOnIBf9e5wQW6KU6ZpojdQku6GK8SlDJskxz/nts9zzOd43e7UbnTkom8RH2QylqiqaN8S6J2P8RwGRTJVitE1hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7054
X-Proofpoint-GUID: TsM692HUlpl9_6NC1Npg1EXj8-O_qtK9
X-Proofpoint-ORIG-GUID: TsM692HUlpl9_6NC1Npg1EXj8-O_qtK9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_04,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=576 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112170062

Hi Julien,

On Wed, Dec 15, 2021 at 09:39:32AM +0000, Julien Grall wrote:
> Hi,
>=20
> Looking at the rest of the series, this is going to be replaced in patch =
#2
> with:
>=20
> return sci_handle_call();
>=20
> SCMI is not specific to RCAR3. So I would expect the function to be calle=
d
> from common code.
>=20
> If it still needs some platform specific code, then I think it would be b=
est
> to introduce rcar3.c at the end of the series. So we don't introduce a du=
mmy
> platform and not hook the code in the middle of patch#2 which is meant to=
 be
> generic.
>=20
> I will have a proper review of the rest of the series in the new year.
>=20
> Cheers,
>=20
> --=20
> Julien Grall

That's sound reasonable. My first thought was to move SCM func_id to the
different section, such as Arm Architecture Service (see Section 6
of DEN0028D). But I think that SiP service func_id fits best in this
case because from guest standpoint all clocks\resets\power-domain ids
are SoC implementation specific.

I'm going to leave SMC func_id in SiP range, but refactor SIP smc
handler, so no RCAR3 specific code will be needed. So there will be no
need to introduce rcar3.c in this patch series.

What do you think about that?=20

Best regards,
Oleksii.=

