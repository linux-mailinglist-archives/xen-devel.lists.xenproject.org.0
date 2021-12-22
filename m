Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB0A47D195
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 13:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250807.431935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n00c4-00076q-G0; Wed, 22 Dec 2021 12:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250807.431935; Wed, 22 Dec 2021 12:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n00c4-00074N-Cc; Wed, 22 Dec 2021 12:20:56 +0000
Received: by outflank-mailman (input) for mailman id 250807;
 Wed, 22 Dec 2021 12:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2rHP=RH=epam.com=prvs=2990e6cae6=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1n00c3-00074H-99
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 12:20:55 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9acd701f-6321-11ec-9e60-abaf8a552007;
 Wed, 22 Dec 2021 13:20:53 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BMC3IXm009812;
 Wed, 22 Dec 2021 12:20:51 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3d43avr47g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 12:20:51 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB6989.eurprd03.prod.outlook.com (2603:10a6:102:e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Wed, 22 Dec
 2021 12:20:48 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4801.023; Wed, 22 Dec 2021
 12:20:47 +0000
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
X-Inumbo-ID: 9acd701f-6321-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QD7MDclPqe3pgAsCvSKBoDq0YKjJFPEewEiZDZu2sw1SGOLIb+dMPFzLZOjgyk/7XLS1YAxLlHlllKLziro+ajDFskR3FnelLpS3NoW0ZQ5Glbq3q2uPUY1imJyEr4l778BkatJDgih9pM+v6UIN/d4hPCTFv9uFbJeoqO4TUe8/dAj34Xmjp+CxrUkCH7D0XYrjgkVAzXu+Ca2tkd869j0lzYg6kxVzO8Mq+0W7DmIBmmNpv7/kkm6eDvj+bWbxNMrNCO/noFLbkXAXXrTMBeVUzP8Ibh8Y7+f2vcqMPwQVlM+RBZaKO2p+/7Tu1gvNDtyZqjNlhJ2/AnZu3eKOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sQtXmss7+JD4k3X/wDoVr1jBwUqb1d3ZzH89G0Cnc0=;
 b=nsaYm2dCuGC5XsFXUVIBcnS5Mae+3QYMeza3lwI7diC7Ocg8/tgmonTSfSpdnGSHiCQ6hY2ljRQSSfEnRhVGrf5fNPZcEVfCW16sa83aQ6ADUQDAwg5VhyBL0jcAmzmV3zG625fxdGpfmU0wtW90VrFcTKYRqgWOOQetT/WXnrA2rPVhGlFNgPHuImsm+8xhXrLMj7+x51wKJITNcshbpelkN5eCdrIVCSWNNwb1FzNy2z1qHIdofBthZPagnD6xVoH/WzbDPwfhy8YU9XQSBRne3U1hkP9gE8uWyaFWNc2bkKrqQyvWh7d5nCjL0u6J1g4SMjY8jp+kXlY1q0KIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sQtXmss7+JD4k3X/wDoVr1jBwUqb1d3ZzH89G0Cnc0=;
 b=AlGCX/2ar3PparnVubJGQ7z5Pp7uNF+TTYhRmfquCkTs5rn7p+vsy06t/Y1cCSRU6T8BsU0fymsfPudyzbsK+8SJl8BKXo/RNgo4WdnL38S+gKsEF+eL2+l9Hi/duFjh73uiHklAh5Pk4yHcyHU9zRfCq7TQvCuvW0uUaNas/VztAYDWzlMe0lCHMaSOi/0wdvAuyfXjW7/d4B0HFhzbcXxiYvc+hDdEVlcRE2mEW380WVTjn2QjJdSlZ4f3AG5D0Y2to/JeQu5mP06FXG48ODWpR4Lj1UzUFLdbJiZSgKwMiqxl7xUzvj2+MrakPbFc7n30FHVZzpbQT4g3jBfVeQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
Thread-Topic: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
Thread-Index: AQHX8M3K+4k+NJRDpU6TSJ1TAn9Owqw8+0+AgAF/xgA=
Date: Wed, 22 Dec 2021 12:20:46 +0000
Message-ID: <20211222122046.GA2926395@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <7aa3e21a3285b3af92ad87a4b039b4bd7696ac88.1639472078.git.oleksii_moisieiev@epam.com>
 <YcHWL7S+O8txY8Eq@perard>
In-Reply-To: <YcHWL7S+O8txY8Eq@perard>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78595a9f-0994-4749-f06c-08d9c5457be0
x-ms-traffictypediagnostic: PA4PR03MB6989:EE_
x-microsoft-antispam-prvs: 
 <PA4PR03MB6989A77F3845BC9A20087127E37D9@PA4PR03MB6989.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CR20Lm9gyUegoDvUXfVhXKJvpW920fnYzsUMEcu2aZZVRWt6y4RqRnrX30d6AJ39uCc9gLM870cVP0rLzPjf/XqE9Ux7XVxOy6V6wgzz8Vgo12kopxH+cMhrqA4zj6/vH9Xmlr87rGp8sKsXT+Fkdetwo/bRbtFZQcEu6Ppqf5mvzcOCXk+Wq0AMqccoEy/UiO8QvXRdtjrGXU4GUJ+6nUwWoD7GKpOUV0B41PrWDCwofEZxHteP0FNlPXoWT6jqjRqKkjl5ubKfJ/ptGRy/YnMjdPg5Ii9HZCXqjC7xcAruxapzC693wDpyOlFYHCWU/W2WkMX3Mv4n7w8ltZx0oYf3Rsid0VnfZ0fbTxQs9p+39QsO97R6XMQn4I8mj+Xb5hlRIjai+6Jrb0SGr0i/P2beq3OFrOXngq1INKeZJyn/Xr3mXTbjh6gDEDl4N+SmBLrnf0pH9X6OyTLsJa5Zc9nBvd3Clheojp6PCyhMQl5yvzcf0SL8eWZ17dUiqp2P3QBhADuyYHj07KhLQmnuL8tH74xcjTGvlbgR3hfENugtehzqVbLxpY7WLlUQ+BtmMaCFtC+/teRre4uciuI8BG7M6+UeC+AmeXxJHOGpbEkmujzXStu3rBanVfuff7GssRtNd4Z8dZViHygW+G7oZHyk0dkkQo22DaALbZHu2OBLUVNecaRtGnIseyca2bcaWKpUpmptCNQGFGF8exWngA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66556008)(66476007)(38100700002)(86362001)(64756008)(4326008)(186003)(66946007)(91956017)(66446008)(26005)(33656002)(33716001)(508600001)(6916009)(76116006)(122000001)(38070700005)(54906003)(2906002)(1076003)(8676002)(8936002)(6512007)(9686003)(6486002)(316002)(71200400001)(83380400001)(6506007)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SKW1ZzbgqxC/3YJPsM5UleTHXW/ojU68D5EiLNTm37s+6q3vI+mmxVEtR6Qw?=
 =?us-ascii?Q?I90Pb21WiE48LB5+3ci40Awep3d6VNGUg8WePYMCA4uvX8CIsKElr6GwH0TY?=
 =?us-ascii?Q?GEdd+zi6XD+garKtDe5Uc0ESjdvKbVweCB2f3wI3MT2y8wHJb4gyK72aetIg?=
 =?us-ascii?Q?IOcgl2VArhbxlKk+wg2FDLQv0iqo4itEPiX0E7Zdn8T8VGKFtBmhO/j9a+o7?=
 =?us-ascii?Q?NOPvUsNSKU0QqlPdueuaRYSd7iUXSZwAdqEiCptanybLavHj0vR5IT/a/jQC?=
 =?us-ascii?Q?VSvU00Irl4Ve+0DBDG5vGCHkeJDaKJhY/9dyITdlIkNpYt6ndb9aFtjyijqU?=
 =?us-ascii?Q?pT3D6PxESbYiVwc94HkTEbg9KQZ2f8TCuBPH3ELd+DviiWW0vei2o+p+q3g3?=
 =?us-ascii?Q?cYERifPypM7CUOKlTjYiq65bNi9T1Tpiz6s1/0PVSVXNwj5TmKe+wc9TOgtw?=
 =?us-ascii?Q?z0QvPvIhXSSSGJmGGuxSRsMLxRAxOR4q/zM8H4wgCg48rK56+esZg4jcoBiD?=
 =?us-ascii?Q?ndpU7QaLMBWuafDxi5z+2BoomC8O4wermrlhhF4Nc4kL4CRhznteIzAX/ct7?=
 =?us-ascii?Q?2YF8N0zEN07W5pi34frN4hNMgX9rRhYsekS6q572PWFXfnRVeVXZi5tEBZsA?=
 =?us-ascii?Q?CREo6Nj7mLFain+OjglvJZJ2KDAYIfJNkkJNCNgf7Y9BJUfGRUR78XHhRwmY?=
 =?us-ascii?Q?0IFrDxQlJCYSrEd3WCr0/AoIyqqiBq5kJldxQDvyL07vdya6mU9crFU4uD8u?=
 =?us-ascii?Q?NXAIq243RVe3IE0JAFJUpwQ1wK5sAhr7dOrmp3pMt1qoaoIMhtL48emuZvy0?=
 =?us-ascii?Q?JdMWfoiU0MJ0QYXk4F4kghmIADYpR6YwqIUNZBSRGsoSeBLnPvhLvygOLYIa?=
 =?us-ascii?Q?w0XrveOVXWt+kQF+efUnrxkk1YIqqSRlqwoI96DF/mS+xgZO9dv6sUNRrfcu?=
 =?us-ascii?Q?MfsA8bBMT7h2kx4mv4t2/487t86783YJAhYiFN3nMbWXHk+VMOguUt5GqKrj?=
 =?us-ascii?Q?SGj+Bq6j3cyBht3Gn/9ked6nJMDWhOGf+oX7GmMMSVK+ba6CG7j4edM/dOpp?=
 =?us-ascii?Q?sVjvxaggHz7W8LVjtqeZf5wsovQ9YWxO9k7zSogfPnFDh9NF56WA0SpnvPCR?=
 =?us-ascii?Q?kxUlXcqqV0alIjeY4NnwpxpWeh1d8r8ePMv2DK4BlQBKdf67ueASyB10LzQy?=
 =?us-ascii?Q?mJfcCZZHAsTByZ12xXF8CcACjLNxHO7mYoPoDx4fOoGAapvbVne/JHPGo2tF?=
 =?us-ascii?Q?vbG3p7Uqe5JOYBvIntWSlu5EisZaQbjMxFuGj+f1Ke0tGaeIM45D473RVn74?=
 =?us-ascii?Q?Y1EwEEoJdU3PYLjBc829OX/0OLdyUYAIt+yJh6PXlfvU6nCFGv7q5vR+SrDG?=
 =?us-ascii?Q?LnWW/0LzmYhjAIGkD7aksu9ufty95ef+X1ZmPmSUz7zN9Ov0O3ZE5z9bqv0G?=
 =?us-ascii?Q?f+aYt6xL4hAIQLhUI6P3rQRm7b1m/r0r2PYLs3Yxjem70sMg/ugqzYk0XXVz?=
 =?us-ascii?Q?rjMDdZSPtlvZ1hAngatvH0/lVMDaqKCFe1TpDrKvrQEu/6SX+zOTJOavRW/M?=
 =?us-ascii?Q?WMcMveuTeIGSYHw7fle3uA1uvfGQWzPtCnl6J1imJiu9HJsU+QQ60818M3Ef?=
 =?us-ascii?Q?awvSlK75C4dWtR7lgWKUhJ1TQ7MLkq2Trt/jAMDzd+VIm88Y6mtFMwijkk3f?=
 =?us-ascii?Q?cdNUJWEuAp0vFzrr+DOxLhsqTj0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <567462F1041A404FBE1D6859E8F40AA1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78595a9f-0994-4749-f06c-08d9c5457be0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 12:20:47.0765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFoloI4O5IHmP0mstD4gSH+FHSCu9NAzgv9pyH88pBBcGF9wbyFxRMsvDDRu9k4CaaDKpMaTjLlbTVtFsJzMRT5TXvARDMWtXbg79dH7GMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6989
X-Proofpoint-ORIG-GUID: J3HXc2kFtLQCUneD2lJ_1wDaVWA4pVrG
X-Proofpoint-GUID: J3HXc2kFtLQCUneD2lJ_1wDaVWA4pVrG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_05,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112220069


On Tue, Dec 21, 2021 at 01:27:11PM +0000, Anthony PERARD wrote:
> On Tue, Dec 14, 2021 at 09:34:28AM +0000, Oleksii Moisieiev wrote:
> > This enumeration sets SCI type for the domain. Currently there is
> > two possible options: either 'none' or 'scmi_smc'.
> >=20
> > 'none' is the default value and it disables SCI support at all.
> >=20
> > 'scmi_smc' enables access to the Firmware from the domains using SCMI
> > protocol and SMC as transport.
> >=20
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
>=20
> Thanks for the patch, it looks good too me.
>=20
> But it is kind of weird that the manual describes something that isn't
> implemented yet. Could you maybe add in the patch description that the
> feature isn't implemented yet or that the feature is implemented in
> follow-up patches?
>=20
> Also, about the golang binding thingy, could you add a note after a line
> of a three dash "---" that let know the committer to regenerate
> everything that needs re-generating due to change in the *.idl file,
> just in case?
>=20

Hi Anthony,
I will add golang bindings in v2.
As for the scmi_smc description - is sounds reasonable. I will refactor
it in v2.=

