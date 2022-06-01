Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 335D953A068
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 11:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340391.565417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKhW-0006mu-U0; Wed, 01 Jun 2022 09:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340391.565417; Wed, 01 Jun 2022 09:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKhW-0006jV-QT; Wed, 01 Jun 2022 09:31:38 +0000
Received: by outflank-mailman (input) for mailman id 340391;
 Wed, 01 Jun 2022 09:31:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdo/=WI=epam.com=prvs=8151ed00d6=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nwKhV-0006jM-3p
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 09:31:37 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0888031-e18d-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 11:31:35 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2519F1fQ026935;
 Wed, 1 Jun 2022 09:31:33 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3gdqkvj8kt-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jun 2022 09:31:33 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AM0PR03MB3652.eurprd03.prod.outlook.com (2603:10a6:208:44::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 09:31:29 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::31b5:dfd5:2d38:c0b2]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::31b5:dfd5:2d38:c0b2%9]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 09:31:29 +0000
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
X-Inumbo-ID: a0888031-e18d-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lf8dIBHyuNM9oT8ufLqdzqmqOoc+xnvcuE2780r0ogA9c+zRPQZyRmNlEG4iHMtHfX6bkKBWDjNMmkFUqFlMLH3/T5W2W+L3xqm9ZgajM5xcfTOK/QA02nuEujYGj16ieFWmD53kwCS/V/qe6SU0p7hgSnur5s6Wr4d+Y3Zp9S4fSVxzCmlkVo/W3XylmOph+DJ4403rmD+ntnRqNc6PTbdgM3VXy/Obg3kiIUM2cY7CQuceXrYH4ycokWDF+D7vl0vThz7Hv1FY9btBD6iyTLT+CkJy8aFI/rFdcN7PfU3QwdZO+ZbuNokulmXuBZP7QfQYOCDznMaudaJ/A6H7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwmEnlhEKEa2BrJU3i/cvUHq+3r62mYinpK9nXM5VN0=;
 b=Tv9Jfyj+MlMeWB5PW7G87ct0vxYbY9jfa8pOkIW8hFPqR5+LT+hXRDYlLathOZfahLuRkjsWpw3JZkXn429GjO1aLGkdC/hyaWEP9XhF4rUCFoTsi9Ic/w9YOy0RPojtwlUeA8aK9xFI4QgZNvNMasihRQNgnd7+mxPtHLLDSCHBCMx/a7/W6tOUCx9IzSYKyDruYr5W3FEL2/n5SGgTxCFLLLq+0kssg/7/uSX7P0RTYNn6BMj4cGnvOD8BSMwhwb2GW7SF/n9SyVCGsXpB8gzccRyt0i1OQo3qt4e1LFRGbexXu2V8fmc0dl/jbnojE3SJJj9H1Uf4flZmHBev2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwmEnlhEKEa2BrJU3i/cvUHq+3r62mYinpK9nXM5VN0=;
 b=a6m7Gl12GsW7uTRZBc5lWhfknYfR+JygoknLOxEPm3GsDF72G4gq4VBP8WwzYyfEBnTn0aA2Y6PnW1EXaCXAHbzwdoxQjzb+hDphi2t1xFLLpkatCjbWuNvGVq/W1O1LK0lKq3p73+XrM/D1FSekrgqyEMfAJ5OtC9eHPIUPTeb73ytCUgLi10pDPd8nBeeow6WTq8CgEwv9MtEmuaiJA7kaBR9RLuHX0PY1yGBnvipSQslyc/YmTcVcnAQFWrROT4C+HiOgzlRIRWzn/HXKhC37J1RInTOZH1jafU4NqZmKtUZ8OPPqo+wr9fzsuTjrWw73nmHCOGNdrh/0XLZUaA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Peng Fan <peng.fan@nxp.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Topic: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Index: AQHYdDjfc3Z/1SeAUE+eDUzXC1OEPa06Mh/QgAAVEICAAANxYIAAAasA
Date: Wed, 1 Jun 2022 09:31:29 +0000
Message-ID: <20220601093128.GA3667062@EPUAKYIW015D>
References: <20220530152102.GA883104@EPUAKYIW015D>
 <DU0PR04MB94175823AAA60802503F802588DF9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <20220601091311.GA3658954@EPUAKYIW015D>
 <DU0PR04MB9417A3436FB754A7F374C44888DF9@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: 
 <DU0PR04MB9417A3436FB754A7F374C44888DF9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af626d61-291e-4118-e895-08da43b181d3
x-ms-traffictypediagnostic: AM0PR03MB3652:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB3652B08AC384CB2A69BFED2FE3DF9@AM0PR03MB3652.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8GiQ6FD6EBfHHr5c1YTygfSm3ui4jq46yCDOj/0//gf8x7Glqy4Nhd7/0esjEDsjEmGIupXb0+NhNNeGiRFYDlXdNn9AQlhVHubIMThi3qT/7/H3EHa32Zio22ocBu5nQ+b+RVVgfxyYOLbrAdtOlI8i7vBMFEtL0fUApFWqNXtieghWbDCgHMUXpV9y6WEaZBTGgGa38no6hjwQx9tkFE6tm8E1t/2WxDHHJ+eQX2kFwD/vyITb2dRw7ncn7F9Kmkj0wYov6swt5Q6P8Xh8m2bwMLWP94cjKvKYdVjm5jhLSqvAh6E0Xzg3iZwu4QSZwyiACyx5Mhmg+bnSc9k970u2TrtrtoQGvX7STeVjUoyQHyW0d5i7I9CFEgVWP57ODgKQycDlhKFOMP2/czkQeaACe0QOD3A060zAwNCXvhgmw6LtqfNDoPBzyxhurdBSz2qIRXBO3IqQQPcJHOCdykr7P1TjbZ+umYdGLJ2+Iya8TmsBHOHNOwm+vLUrGGh2N69/Vq0V+M7C+yPbp41wi5pgU1nAq1iVjdWpoSqob37oAW4j4mm8qHOsF/dYcrisExtGkrGeY6vLHG/eYAntxb3pW2L2UAosog+KKHSv81Uvr/8dDaUoJcPmAymdNgsxE7Qno9osgcOLIuPEYYhdibg6xbhmrXrd9oKxlVCMKMs9Lv1TcuSjsPn0tkLBj2RJ4jDwc1HGmur9UZaDixh3tyWQQfC4gg8ugFadX6M23bytL39zuQmpI+QWngInecu4c+dFDamix4zkZcGs3CXG4M7qIP9H9Dz5WQWCj/FwKorxcwQwHBVuKTtDxwlAEKtD9Rj82d97rhtFxcp4Xa7DBQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(122000001)(33716001)(38070700005)(33656002)(86362001)(186003)(83380400001)(38100700002)(1076003)(6506007)(26005)(76116006)(71200400001)(54906003)(6916009)(966005)(508600001)(6486002)(45080400002)(316002)(6512007)(66946007)(2906002)(4326008)(9686003)(66556008)(66476007)(66446008)(8676002)(64756008)(5660300002)(8936002)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?mvzO+hw9pECtVfUPRCm5OzS+h62RpytvFBzuXWXO+JZ3BJdC44WYHkDZ6KJs?=
 =?us-ascii?Q?ufoJBkIlTQAhjMpy4dbXeh1W4ryJ+M06buob+ONp2FbTy+LQobT6p9yE3aGj?=
 =?us-ascii?Q?bJXdjqe0heruyLpmgdq2L0HYORvyj316H5TnLe+l6NRzvebSR9LJJQCl8OW1?=
 =?us-ascii?Q?tSDB2mra33BDDaPKycdhctJzRj5iAsqgxXSEI07pppTb2ub9mFClFscr1u/K?=
 =?us-ascii?Q?zxOt95yjUXv7cyI9JbK/3rMaXBNhHR90s0mWil/UMYTgBTJPQKopPGBeTIRx?=
 =?us-ascii?Q?Vq5YAcvvsJxwiUk7Vq4PqymNwWul6peSGZqh+DZp9CfPMUpztePMaXS9p/vi?=
 =?us-ascii?Q?J+99kIM06JzNG2KcYMVv4Z2EzB3LNr/P7ZUc0bZ9Uwx+lyLSaE1dOLU01cYL?=
 =?us-ascii?Q?ggxumv1PeIThtd+Yt9LtKAe4Tic+Vt3obo/sJ6rU8r8Bc3JaG0iVrPr0gHeG?=
 =?us-ascii?Q?jB8iXo8wq7lfSdb8gx0NUV8zuI2VQiOgfqlHTZYW1QkK29Tf45TQSwCOflLm?=
 =?us-ascii?Q?jK0Sqc1ptdJl6ZIVGTWAuHMI/9ofD9/tdoeZifZvV2WysKLyLkty0/WFLqQK?=
 =?us-ascii?Q?Ri0JqONKKXBHAY15B+WCrR3C8yn1UsYBHdfvRuq/4gdzJbjelp+bf5NQtEtV?=
 =?us-ascii?Q?jQHgOsz614QrFON42AppMqk/fYyvigCly+O1t98hL/3mP6HYGsqjwQODvhWe?=
 =?us-ascii?Q?BzZffTHb8JqrfzGnUUbUiEy7rd5scWjbqAggbsz0MBDr4bfZKZmQjk6ayPZI?=
 =?us-ascii?Q?G+ueTLJJKDRZikImehNTNEU6UqmIMRu7DPwPFb78ysuGPKRhvi/AZCTABipz?=
 =?us-ascii?Q?p7+5G/2MHQf7gI6AztGcBDTS73/+0VG7q3qyAaqe2qhUmmSkxD9GGK5lIErs?=
 =?us-ascii?Q?qEW33yQfqMz6uFTcskHToPOPXx28OJSNwntEALtZX/fsPJoa7Op3uyudylRN?=
 =?us-ascii?Q?5cJLR+dPhWc1fogAd63fYchSImu1TRZSLfNa8r56r5E8b5IBUJTUPGuZ6w+5?=
 =?us-ascii?Q?moSFpqMNMnvoPGauXo9E4M9d/vom+Buy20dyf/x1Fxxyc+qjDmJ/7bSMgy8l?=
 =?us-ascii?Q?ALpsUZHs7By9anV3NUGzOjFOSvTzi7sSl4q4C7j5b3IFAa/EdIduF09QeAs+?=
 =?us-ascii?Q?MrtgU//palAVFYNl7xmxYq2gfUQwjLPDZibpUG/nyh2FB643KfiCn5Iu1JHT?=
 =?us-ascii?Q?2+/GsGGJp4IUykfctSZGOcCFHnzODxR2PYYd8vR100EaD1ChbhgKNV2jTrJz?=
 =?us-ascii?Q?1Sy+flzj2aLypOZNFgboEIE/1Pm0tfT4xE1B290KR0cO/2N3Z/XgtYhWY6+k?=
 =?us-ascii?Q?A27ENQqv1nk8cu5WJmfP0BxZ/Z3pg/a2FNPXTuZqag7lfzvWyo/4LuWvRUuZ?=
 =?us-ascii?Q?iJaZdfz7M0TgULbTkrxcZQkbgsRCpYenqnnoSEutkgMlnnLQCdYCYxkrSueo?=
 =?us-ascii?Q?+YzNafd0s60lcFcXiu8TjOh/O5urpzimQ2ug026NDwJ4ziPC4lgW+aQvEqyB?=
 =?us-ascii?Q?hb7x0Gkz0ShnKTy+3m8b0Pbms35d4gmD27G1vI7Lbv2xkTTVv+iA965M/SfD?=
 =?us-ascii?Q?Rbzb2Mj/QHBGLYJDXNE8i+eaMlY7SaC6+6Si1asZh6cqOtuLrgd61BYTOjky?=
 =?us-ascii?Q?Vz90b0YH+O7DAYy42pJkJy9kw4bqdpaWbK9Dok/xZo4edV7Fxx8DKXNZuJ9F?=
 =?us-ascii?Q?QjLPPnk/gK6EWS3n/2Qd15MqpUmSLzEvmayAJRtk7wlvxh5Tgvkuu7/qyTZz?=
 =?us-ascii?Q?nsiP7emIcXNNHGn+WqAdeyrGOb+xj4Lf0hmhbO11g1iSUtQaZX6J?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8F2EFFD60671124CA0F0F21C65B906A3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af626d61-291e-4118-e895-08da43b181d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 09:31:29.2142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4AM3ApIhywrvFcQU246DI2teLrgOCiJvsw7J0BFt5k1FJ76H9bD0ZdIrYPg9+YvU110B8O/o9LFiNB0Qt5cD6eBxufAlJtnmfEpM4FtbKkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3652
X-Proofpoint-ORIG-GUID: 9GBITxillXq-OxgZ-bnnzNSY5LCySwvU
X-Proofpoint-GUID: 9GBITxillXq-OxgZ-bnnzNSY5LCySwvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_03,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010042

On Wed, Jun 01, 2022 at 09:28:18AM +0000, Peng Fan wrote:
> > Subject: Re: [Xen-devel] SMMU permission fault on Dom0 when init
> > vpu_decoder
> >=20
> > On Wed, Jun 01, 2022 at 07:59:23AM +0000, Peng Fan wrote:
> > > > Subject: [Xen-devel] SMMU permission fault on Dom0 when init
> > > > vpu_decoder
> > > >
> > > > Hello,
> > > >
> > > > I'm getting permission fault from SMMU when trying to init
> > > > VPU_Encoder/Decoder in Dom0 on IMX8QM board:
> > > > (XEN) smmu: /iommu@51400000: Unhandled context fault: fsr=3D0x408,
> > > > iova=3D0x86000a60, fsynr=3D0x1c0062, cb=3D0 This error appears when
> > > > vpu_encoder/decoder tries to memcpy firmware image to
> > > > 0x86000000 address, which is defined in reserved-memory node in xen
> > > > device-tree as encoder_boot/decoder_boot region.
> > > >
> > > > I'm using xen from branch xen-project/staging-4.16 + imx related
> > > > patches, which were taken from
> > > > https://urldefense.com/v3/__https://eur01.safelinks.protection.outl=
ook.com/?url=3Dhttps*3A*2F*2Fur__;JSUl!!GF_29dbcQIUBPA!xNT11x4E87Ot-pS9c5Eb=
iteNwSWhUuPsM66Y2_ZO5WSMjAMlsRn70_-k8Y2Tfh-GIR018oX6TPa4IEOiIVfv$ [eur01[.]=
safelinks[.]protection[.]outlook[.]com]
> > > >
> > ldefense.com%2Fv3%2F__https%3A%2F%2Feur01.safelinks.protection.outlo
> > > >
> > ok.com%2F%3Furl%3Dhttps*3A*2F*2Fsource.c__%3BJSUl!!GF_29dbcQIUBPA!
> > wz
> > > >
> > oDdJsuf4bjXMe85tA46E0tLpFG5gqHoo-OeY6o_ARroNBmX7JByHW67qEUik7bN
> > ow0ST
> > > >
> > gvAjR4rBkRu2Ux%24&amp;data=3D05%7C01%7Cpeng.fan%40nxp.com%7C5abe5
> > 7eece
> > > >
> > 404f6c017808da43aef8f7%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7
> > C0%7C
> > > >
> > 637896716019179992%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
> > DAiLCJQI
> > > >
> > joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sd
> > ata=3D
> > > >
> > 47ddyB8JUz8sDHcXluhcB7RJ7bH4a33l%2FF2XzUpAPxY%3D&amp;reserved=3D0
> > > > [eur01[.]safelinks[.]protection[.]outlook[.]com]
> > > >
> > odeaurora.org%2Fexternal%2Fimx%2Fimx-xen&amp;data=3D05%7C01%7Cpeng.f
> > > >
> > an%40nxp.com%7C91e3a953942d414dcc6208da425006e7%7C686ea1d3bc2b
> > > >
> > 4c6fa92cd99c5c301635%7C0%7C0%7C637895208732114203%7CUnknown%
> > > >
> > 7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> > > >
> > CJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dno%2BV2ubjGmrsm96NP
> > > > ybeeug4a3BXx3oX7xmylzZCU8E%3D&amp;reserved=3D0.
> > > >
> > > > After some investigation I found that this issue was fixed by Peng
> > > > Fan in
> > > > commit: 46b3dd3718144ca6ac2c12a3b106e57fb7156554 (Hash from
> > > > codeaurora), but only for the Guest domains.
> > > > It introduces new p2m_type p2m_mmio_direct_nc_x, which differs from
> > > > p2m_mmio_direct_nc by XN =3D 0. This type is set to the reserved
> > > > memory region in map_mmio_regions function.
> > > >
> > > > I was able to fix issue in Dom0 by setting p2m_mmio_direct_nc_x typ=
e
> > > > for the reserved memory in map_regions_p2mt, which is used to map
> > > > memory during
> > > > Dom0 creation.
> > > > Patch can be found below.
> > > >
> > > > Based on initial discussions on IRC channel - XN bit did the trick
> > > > because looks like vpu decoder is executing some code from this mem=
ory.
> > > >
> > > > The purpose of this email is to discuss this issue and probably
> > > > produce generic solution for it.
> > > >
> > > > Best regards,
> > > > Oleksii.
> > > >
> > > > ---
> > > > arm: Set p2m_type to p2m_mmio_direct_nc_x for reserved memory
> > > > regions
> > > >
> > > > This is the enhancement of the
> > > > 46b3dd3718144ca6ac2c12a3b106e57fb7156554.
> > > > Those patch introduces p2m_mmio_direct_nc_x p2m type which sets the
> > > > e->p2m.xn =3D 0 for the reserved-memory, such as vpu encoder/decode=
r.
> > > >
> > > > Set p2m_mmio_direct_nc_x in map_regions_p2mt for reserved-memory th=
e
> > > > same way it does in map_mmio_regions. This change is for the case
> > > > when vpu encoder/decoder works in DomO and not passed-through to th=
e
> > > > Guest Domains.
> > >
> > > For Dom0, there is no SMMU, so no need x. Just nc is enough.
> > >
> > > Regards,
> > > Peng.
> >=20
> > I would say that SMMU is not neccessary for Dom0 because it's mapped 1:=
1.
> > But using device under SMMU in Dom0 is still valid case. For example to=
 protect
> > device from reaching address, assigned to another domain, since Dom0 is
> > trusted.
>=20
> I mean the reason to use nc_x is that VPU DomU is accessing DRAM through =
SMMU.
> It needs X because there is VPU firmware run in DomU.
>=20
> I not see why need X for Dom0, unless you assign a SID for VPU and create=
 SMMU
> mapping for VPU in Dom0.
>=20
> Regards,
> Peng.

That is my case. I've created SMMU mapping for VPU in Dom0 and use
vpu_encoder/decoder from Dom0.

>=20
> >=20
> > >
> > > >
> > > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > ---
> > > >  xen/arch/arm/p2m.c | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c index
> > > > e9568dab88..bb1f681b71 100644
> > > > --- a/xen/arch/arm/p2m.c
> > > > +++ b/xen/arch/arm/p2m.c
> > > > @@ -1333,6 +1333,13 @@ int map_regions_p2mt(struct domain *d,
> > > >                       mfn_t mfn,
> > > >                       p2m_type_t p2mt)  {
> > > > +    if (((long)gfn_x(gfn) >=3D (GUEST_RAM0_BASE >> PAGE_SHIFT)) &&
> > > > +        (((long)gfn_x(gfn) + nr) <=3D
> > > > +        ((GUEST_RAM0_BASE + GUEST_RAM0_SIZE)>> PAGE_SHIFT)))
> > > > +    {
> > > > +        p2m_remove_mapping(d, gfn, nr, mfn);
> > > > +        return p2m_insert_mapping(d, gfn, nr, mfn,
> > > > p2m_mmio_direct_nc_x);
> > > > +    }
> > > >      return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);  }
> > > >
> > > > --
> > > > 2.27.0=

