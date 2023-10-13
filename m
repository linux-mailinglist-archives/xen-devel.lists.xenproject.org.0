Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0817C8662
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 15:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616550.958645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrHsL-0006kj-1d; Fri, 13 Oct 2023 13:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616550.958645; Fri, 13 Oct 2023 13:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrHsK-0006i1-VA; Fri, 13 Oct 2023 13:06:44 +0000
Received: by outflank-mailman (input) for mailman id 616550;
 Fri, 13 Oct 2023 13:06:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3A4Z=F3=epam.com=prvs=465081a231=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qrHsJ-0006hv-DW
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 13:06:43 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5926e822-69c9-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 15:06:41 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 39DAmC5U015493;
 Fri, 13 Oct 2023 13:06:34 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tq4f80hkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Oct 2023 13:06:33 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM9PR03MB7850.eurprd03.prod.outlook.com (2603:10a6:20b:431::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 13:06:31 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 13:06:30 +0000
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
X-Inumbo-ID: 5926e822-69c9-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ja0jYguAWiF1FsuhBf/YFdiDn+w0rInvGZcLzyecZ7cTaQmCBQWwC2iBKmbTy7hQKgX3trVWydW878bkxCL+93S4wKwMAvKHM1nUQVw95ocW9GYLTchOsPNSbAC3m0WK6xxBafBBvsO8kLnqFTs0b8Z2VoNiikF52BH88pMP9JvHf9qFaFPdVon4i7oPpGGYymIYhipD881lP4gVyTStej1I9bx3QJzFaLAB6aB1YAvXLLDoCUJ9MriE6OeDHNHo2sGLf05H8Z9FuqkMO5bzcpctFUL/ZWivQ5cBnO2K6YUqd/MY3ouwfNBxSA2mWDYuGZQR1Gag3dTkAIIduOBq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+oP3t3SVLDkBkRxjVrxYrRwnOn5aiB/k0m6GY6jBdk=;
 b=BcH/inLQ2qM8nm7VnMyzu5dgnenbLQPDl8fV+xwEewcnEeaNlbg5DbnS98UsyYL/q2CpzpYLqGq08HDwkEZOGMnbJPbRDFhd24uTW15xtV/cGxwiRXN2RW6cpqKirmrzt77y6EhHZBU1KcUNWLxToHgyAPest1YEMbSnqWLBrmyh9pQtukhkFcCTAZ+GfcWaN+cToZi8U12qj9XaP4BIRFkHlffFb0p0INrCq0jvAdoLYdH/UQzyZIbsoAtzRvzEBa0tmDrSOHiEMZjXTl6RHudiJHZqZtuwzysWK+cWUSM1BrbWo+Oty+b2o5g5nzZ0lc9KQrJnifWuPuBVB6z3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+oP3t3SVLDkBkRxjVrxYrRwnOn5aiB/k0m6GY6jBdk=;
 b=NTlbOBSQu5G0EiPtRV2dLUKrojvX1PvQRn0a/VLPnKaJENp3nr9E7LieeGbTQxxLPLflZYi8H7XXhUfVykBeFZaCK3E2+OxFm9eRCJvSDOM6/wR7yuD+5fGhWffztkC7CZWeWotbx1RjgYeDdp/JhsLWPUAlqOl2kl1VCkqnVbLR62Azf0Hlz5ZvaMrawRoUsIHzbhUaim/HI2dg4EgjWZHGG50wkSYJsuCrcG82gKM7bzdrmVsWLbcY2Yths6Czh1SGKFWn+evDcy6QCrxaDmo9YnxdKguEVu2cP3qtkmkkQy03uQPzqx2a/956yeXSPFfN8maMtHJMHfDhlAnt/Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stewart
 Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Julien Grall <jgrall@amazon.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v10 15/17] xen/arm: account IO handlers for emulated PCI
 MSI-X
Thread-Topic: [PATCH v10 15/17] xen/arm: account IO handlers for emulated PCI
 MSI-X
Thread-Index: AQHZ/Vi/WuE7cEBbNE2PUEpOXmVwbLBHZXWAgABKrAA=
Date: Fri, 13 Oct 2023 13:06:30 +0000
Message-ID: <874jiuacyy.fsf@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-16-volodymyr_babchuk@epam.com>
 <8f70079a-ab08-4b41-8aab-834958ae93eb@xen.org>
In-Reply-To: <8f70079a-ab08-4b41-8aab-834958ae93eb@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM9PR03MB7850:EE_
x-ms-office365-filtering-correlation-id: 07040a24-4701-419a-6360-08dbcbed37cb
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cUri66o+VvIPxzEeuOFJbwC+PGAaHAbbb0Ngs2HUzwlyFLkgU0emvpwNzBEpgU/RdQzbLPT3f/K5swpte9rTm3AF2hSN9OJtXM8hOl/mSFGV+Kloz3g7gPMB3n1Put0tq+M14W6e+UW8zBZNoG+ZhsMHw3r2+sRc9HWLsIN0/lje4TaTFaGz+0g3kbAuu75xE/qS8vQ8vbTNpmAm0W+kAPuXDXtI54R+NnO0W0HReCi/BGH9hjUWEx3e36j37EE3DwMpoTyiflf9d1/bXn7pUcFwtq1KRTipTiOBf5KCbed9MoMsHJ4kyXY9hp+XHMalbEASOsJDrpbIDyFkGkOY8/G0wwslYR91MwH23tWBVD28D61cOBNQWYJesSoP7+hfPTlZybLFHUlCD2oxQVBQqOZYK+4t5bXfnaL7eyZLPvg2MpuvnpQYi4rYRmITAooSlmZUzeyXA8fE/bPEoMZpFrLZIhK/6v/kWeBVE6QpLNQFY+bXhe+aF+aaTZQdmOeVTV/vSQeV+EZv1W5LS/dHGuHQTG94zYDcsBgIXHHQoiLN/4yYyEJulW3qoGBd/gAcUc+f+B5leXW7dPwsIaU3dwwnfi8LAElFQFBJZMHGTtQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(15650500001)(2906002)(2616005)(38100700002)(38070700005)(6512007)(26005)(6486002)(966005)(6506007)(53546011)(71200400001)(55236004)(86362001)(122000001)(478600001)(8936002)(8676002)(83380400001)(4326008)(36756003)(76116006)(91956017)(66946007)(6916009)(66476007)(66556008)(41300700001)(66446008)(316002)(64756008)(54906003)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?VkHsJ+hDcHW1Q9rjpd+pvwoSqE4hNqtaN7pyB88T6Il9VOAMAuNxdLRnbv?=
 =?iso-8859-1?Q?eaJANEjT5CPpuZ1LWZzHrJDv7RgWWiFOXa7wMh+e3JaycNlSrJd+9tSeb0?=
 =?iso-8859-1?Q?E1b/lRhc3zacd8fQuMNBmY54Mxbu6d8x0mtikctc9Py09rqDxYAQFRB9HS?=
 =?iso-8859-1?Q?4VnPHQ/OkznOnYMXokzwH1IU4aEqIXa6dd+3skpV2DNTZRq99iRMBxOJOt?=
 =?iso-8859-1?Q?yBdIrVOIWCMUgyLr+TppwTmgJbKObrkR8t6njkce0T14+1fxnlTltrLclP?=
 =?iso-8859-1?Q?WHPtUfDp5UpIu+eZKwhdEy9w/mhvrM+qctHT4XNc7a3UK3ryQE3cwRCEeZ?=
 =?iso-8859-1?Q?g6J8etVgTGta8BwtQxllomCiXxnc9g97SYWKOaRMjI/2Q2BRiBdDGzMxev?=
 =?iso-8859-1?Q?0xAQxu75vOuHu8WMo1YYvQ2S8S9IgbfLY9UwR9FyXJXCXuNcjsMX/iYd58?=
 =?iso-8859-1?Q?5bNmDJqQ+MpZ5SLNxdcmSLpenvfzd2AweDtUOfwcwAt147WFssPR1tqZXl?=
 =?iso-8859-1?Q?/p+hIygPV8f/NGOc/Zhyi7u5ynI1M9XfnfOevQeN9Im/UcPSt3koAmmcdb?=
 =?iso-8859-1?Q?Pc8FhTYc6EfO+T0jL0DQ4wV9Aun27S2xmStI7/jZjzX9kO7c9Qgx7gHKrK?=
 =?iso-8859-1?Q?Ftwx8OEszNdsfI+9iW5WPsrPslRDnCa+jlyniGbgkWCdSmmyLKautXdCMu?=
 =?iso-8859-1?Q?Q2RvXSCv56S1dcGsZxSi1HmTV6QnyUVvR2T00Pq88/pUyNK6jGwwXaEI/g?=
 =?iso-8859-1?Q?0JzvfxRixAp5DByoWs4lXh70eFVvsvC0OuCXTx6yi3rE3O4CC3e653iHs3?=
 =?iso-8859-1?Q?aGraYmCUPBO5nkVMAWcJetodrcRpi1ZjM09avm5kNnApJuMuz7N3d+OHnX?=
 =?iso-8859-1?Q?tplJZRf1vva7CFWaV0vrqEHCzKjb2yFk/OWHiTY2G+LPV5opbx8lPM1G7v?=
 =?iso-8859-1?Q?pDWKMHRGKnXa62nt8GBn3cVFwGvyrF5G+aPYWIYZQa4F78ped+X9AKUiKz?=
 =?iso-8859-1?Q?lElfqlwvvUiw3wEe7oJn/ZMzMPJIFcRt4oPb879TCJ5ScYKal3jAkvhSGq?=
 =?iso-8859-1?Q?UiMq3WWDtV3hRmqQmUOM2WS3awXFqVqrKAVV1HciMsG+8hhO+5rASufxG9?=
 =?iso-8859-1?Q?0IqMHEv0oszPx4cvhulggh+aQbI19wuwVZ71Z0p0PG5ICSzeXMWc6ADaVe?=
 =?iso-8859-1?Q?/QRSSXzS7zapYpZE+i6EiQ+NtB43zZnMQOC2PX37+/93eM1ZyDeMK5AoBf?=
 =?iso-8859-1?Q?xpnmxe/zkP0QMSF/ovFXI5jDGJ4MCo6rIMTkFG/gAc+Bs5v7uezhk4ROFL?=
 =?iso-8859-1?Q?rhEF9y6g2adOw5s4Fs4zZXcmNFMeUQVsroAkLCql/YNykyAdeC01PN5ZIP?=
 =?iso-8859-1?Q?Q8pco2dP3j6sz5tDDcNuIQMxGv7u/njldE3V6r7auavui6t+SaMlJ6r+7m?=
 =?iso-8859-1?Q?tVJDLU8A4qAY9SJQiOoVX/PHpvaqM+HXjc7SkX3oMersvFF1HlCPVx3/FC?=
 =?iso-8859-1?Q?iCQpNBcGaFO4zJUIGE+IgwtZ3VGD5zfqSjYGGZlgBXdpGJVNI3lvRwmi0w?=
 =?iso-8859-1?Q?3F4dYwAYh3OxtiMlav4VpJWo1b+GJeewhTnBvy63P7JtkH6EpEH8Pbj2yQ?=
 =?iso-8859-1?Q?1cwMqgGH8weCNKKV0hYukckqg5b/CyQyL0iyV+97UI/+Bat7/as+10Qw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07040a24-4701-419a-6360-08dbcbed37cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 13:06:30.6542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FKyF6EO03DOH8yE8uPJB58V0ykrmenC+AK18nvSahtSFunRqRTaw/n9IJu8LRwgmSfpZPaS9rGIiy9/5S6EtXPC52XkuMC7/mZx/hLwG/rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7850
X-Proofpoint-ORIG-GUID: 76M1APon8P0EZexJ_K90P-WbabqSXBAm
X-Proofpoint-GUID: 76M1APon8P0EZexJ_K90P-WbabqSXBAm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_04,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxlogscore=577 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310130108


Hi Julien,

Julien Grall <julien@xen.org> writes:

> Hi Volodymyr,
>
> On 12/10/2023 23:09, Volodymyr Babchuk wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> At the moment, we always allocate an extra 16 slots for IO handlers
>> (see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
>> MSI-X registers we need to explicitly tell that we have additional IO
>> handlers, so those are accounted.
>> Signed-off-by: Oleksandr Andrushchenko
>> <oleksandr_andrushchenko@epam.com>
>
> Some process remark. All the patches you send (even if they are
> unmodified) should also contain your signed-off-by. This is to comply
> with point (b) in the DCO certificate:

Oh, sorry. I assumed that it is enough to have signed-off-by tag of the
original author. I'll add my tags in the next version.

> https://urldefense.com/v3/__https://cert-manager.io/docs/contributing/sig=
n-off/__;!!GF_29dbcQIUBPA!0mzdEfHOZMm2OmzFc6TZukGgMYRHxDWLdEQvbhUlDmOg3tZNe=
DbWb8vHz38zLzcYv8GUZeHLn-5sWTYCkvkb$ [cert-manager[.]io]
>
> Please check the other patches in this series.
>
>> Acked-by: Julien Grall <jgrall@amazon.com>
>
> Is this patch depends on the rest of the series? If not we can merge
> it in the for-4.19 branch Stefano created. This will reduce the number
> of patches you need to resend.

It uses VPCI_MAX_VIRT_DEV constant which was introduced in ("vpci: add
initial support for virtual PCI bus topology").

--=20
WBR, Volodymyr=

