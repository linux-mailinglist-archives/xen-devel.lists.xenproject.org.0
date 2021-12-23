Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A347E80A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Dec 2021 20:12:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251168.432435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0TVV-0005yK-Rw; Thu, 23 Dec 2021 19:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251168.432435; Thu, 23 Dec 2021 19:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0TVV-0005vf-OU; Thu, 23 Dec 2021 19:12:05 +0000
Received: by outflank-mailman (input) for mailman id 251168;
 Thu, 23 Dec 2021 19:12:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pwdt=RI=epam.com=prvs=29912ec7ef=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1n0TVT-0005vZ-LH
 for xen-devel@lists.xenproject.org; Thu, 23 Dec 2021 19:12:03 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34ef186f-6424-11ec-bb0b-79c175774b5d;
 Thu, 23 Dec 2021 20:12:02 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BNIRrAJ024151;
 Thu, 23 Dec 2021 19:11:50 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3d4u0p0qk9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 19:11:50 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7277.eurprd03.prod.outlook.com (2603:10a6:102:107::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 19:11:44 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 19:11:44 +0000
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
X-Inumbo-ID: 34ef186f-6424-11ec-bb0b-79c175774b5d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtZJyA1jsUqD8qfzGWQIu1zplsEjF7KAQXgZE/3JBnH3lXw7i9Gn107902mltyJZGzLzxhm0gS0f1L3B4D+5g3hiK/WhR+N0E17m3U1FKdfPS9GTMoQAWWbxObHJaQ0/qi2bLN+cTTPPOfj06ZDN5+zwisWMPTpIiHYjnQbIYf6q47gFJ+AJEh9hYhetV0vQi2Q1sBwuA4zhEatV1YKrgKGpL92HCjBTFY9+K7C8iW+oo3Lci0VUkl2pcB/558H0Y3CsiypUGeyU34lDOjSfn4CFPtz2K0bRgpesye5iF8lRl850kWpJmQChZm6bU0NA4FZkWw7VfFrV5xkqgrEwhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InUROT1dthpWZRzvpRvyssmT17opcVX/IN42VN0LxE4=;
 b=YyxqSNUYASzv+aENtKaGcQrYZzmcSfDfJWF9OXCev9q1H2MgqJPqUdQYRY9LEGIrt6/q8hzxhQWjifk2froiZ4QUZu0qqwuXzJK83pQ+RArc/kPMPNwVXqHNG/rmRI88NCmcB4QwwIfWyKe+JAIuJWdfunvT+mzkrqR4/3XmyyoKKu7JqqbVcPrOO3BU3Vov76W5BDUh6EcLRh7ebCYhQ1EEgVhVeK7h2PBfN8VASVMpQ9L7KfLRMhyPxAh9TokG3iH8henrFXxrFCs0EVd2SlVjo2f+e7GRr6CnGwntUAeZZ220uUOA5hPZ6/cNHc4OKnAOLqnJa7Vy8+Sb9YFB3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InUROT1dthpWZRzvpRvyssmT17opcVX/IN42VN0LxE4=;
 b=BzLeldeDxdlbdCmTi/kX/3JqInBPcXQYV+/4fzGjCN3l7kz9KN7da46xfBXK5O72b5uhDzOZPGDA2pqqHziXzkxTmcCnvhneKzwSdSJl42hU1Os+XtL4hd60fbbekzdV7GWFsdhsBpZ+UBg2IQoMsuGFP6jJNVGHbg82zqakaBqsjt6pe4PHPpnp+/zILD7ec4KgNAwuVC8zzTSJclE/2jE7S+b8DmLpB14Nr1J0fw2b+Y+O+OF7sdzWJMHEHQXsxzZaUHYswmZNnN6cq5uNiOk4ac94C7oUIzlss9Gs6zzurorCXGY7an6as69fQVUgvaydW3d8t/egzRGKanVpKg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Oleksandr <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Topic: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Index: 
 AQHX8M3LpzWz4l8PQUiIA2nAUV0H+qw0P2iAgAJehQCABnNTgIAAc5MAgADFCgCAAB+dgIAAA54AgAARtoCAABUwgIAA0niAgAEZxoA=
Date: Thu, 23 Dec 2021 19:11:44 +0000
Message-ID: <20211223191143.GA101400@EPUAKYIW015D>
References: <b1c27f70-309d-bb36-3228-32836063fd16@gmail.com>
 <20211217121524.GA4021162@EPUAKYIW015D> <YcHol8ads22asXGF@perard>
 <alpine.DEB.2.22.394.2112211330310.2060010@ubuntu-linux-20-04-desktop>
 <bc6d7529-337d-a4e1-664a-dddd68ecf5cb@xen.org> <87lf0cx50o.fsf@epam.com>
 <3967a86d-295f-7672-9ce3-71e1c393dcbd@xen.org> <87ee64x1hf.fsf@epam.com>
 <796960e7-62ab-6f05-b3c0-cd02d7e8a8ba@xen.org>
 <alpine.DEB.2.22.394.2112221636530.2060010@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2112221636530.2060010@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcbed282-fa74-40fd-3707-08d9c6480f45
x-ms-traffictypediagnostic: PA4PR03MB7277:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB7277A16822A16D11BD19F624E37E9@PA4PR03MB7277.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /K9ZmGdvjb3u+IJB2DYbO8fvokXx+qfhfb8Rgds1hrlaE1oTMPezk6NVzobMgTXJQguFn+K3cp+YuywxSLTI8nvGwy+J5wNv9saSKEx5LxUZfCNsrMVjCT10W24hubCukqdAOjD8mdwSHDSGw3iR1WVsN9tcDjuLJCoqzWMe02b4vELuHXrvUER4/hOW93Br1sQ/1QrGRuJ3ipgc7Pemg9dHvHRM8JemU2IlK5633Hzm0K4iKITRV8XdyE2q+280mCGHWHwJK3I2gDmmy9rF7doNLyrt2FBVfnkXPUuJd5hIvdboFRmLY164T6SX5OTJvW8rlmDnSjKQkL+X1oswd6XhfK0r2oAa/pMrtsd/F34Kbl2VIhJPgRfdvTClKx7qyzfsNbvXvtb3FUyLlSnP7CHj8o1F7IIRNJCrLFGH+Ws547W7Zd1+VeXduVyXrvTn1eeZteE2OGtjJQL6SkQCako54lq9mzulYjCtE0Au8NFgVRjYHXKZou046ubQy4/29bHaJ377AdQJL/WTwVyC40L+PkV2EffEyM3Bj60b/VP6lPIeVAwKfuAlxC48mqvM3gIjFOIGQ1uc/dchDRgYE0z4l47ADFaa6h0BFtDbyoo0cNgq7eRCxhl6mmBWRowF3hG+LrS1MH0b9d8aiZD8c8KOc9t5KTrnZqMZf2vXUQvJ3oJd7bGuBpdtmyYDdds1UrEfYfuchsupiRgUrN0x5VLvt7hviXwM/1LXBscJWEY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6506007)(83380400001)(1076003)(2906002)(30864003)(7416002)(508600001)(26005)(186003)(6916009)(66476007)(76116006)(6486002)(316002)(91956017)(9686003)(38100700002)(66946007)(33656002)(64756008)(66446008)(6512007)(8676002)(5660300002)(4326008)(54906003)(122000001)(33716001)(8936002)(38070700005)(66556008)(71200400001)(86362001)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?zZWJq9Dvti7VsIGM6jc28cKwdxLyCyBjHIWoVHHlb5bUaT/yYD8V0x4re15D?=
 =?us-ascii?Q?kSe7mZKxxz7D/HFJ9A/L73FKONkcPIKYO0q3A4ZQnHO6UX59HMOP1Z7Fc9Y4?=
 =?us-ascii?Q?BQeiD4jXe6EGfHhLCX6ardj1yXE6ruImsC8uTYEbS+I/sxzIi24UfkkEMXBC?=
 =?us-ascii?Q?+7wfqutbPChluDcxetqyOZ+vn3KoaqRRHiAgYiA/JaYsNh3ZoWjLTe/eau74?=
 =?us-ascii?Q?Zi/hScyzVYE+nroaDZaWuag6G1Ec6qTpan2vr1dnbK+uiMOwJh6GWfWNskVU?=
 =?us-ascii?Q?IVmfVEC0eYMWsZcGVxLVCmp7hCsxCg/lIouRAIIHdIH9vTj86zrQlYwv7gak?=
 =?us-ascii?Q?hsT0KEhyuTYLCel1027WXn2j4puRGvu186qywwtCIyBKKEzqmkx/H2DIdQQG?=
 =?us-ascii?Q?MqcboAgJrn7Ss5DuzpO2msEU+9CKrNIfixh2w7KlHFHsvH9ubfWMswInsO6g?=
 =?us-ascii?Q?+DzEdBlbP8RDlkwjimWOr/i8k+cJqRUSB8pSjWkXkyW8M51UnqcV3IEwyzZT?=
 =?us-ascii?Q?73yK/ZVoK2mHJvCvQ4uSy120uMjSwddN0IUqpQEvJU2Qtj7cStdwP4O9/uFi?=
 =?us-ascii?Q?4jRxZ0Qu9jC+bipmF4OICGsNqgv9hKZjymCXzouQ9nSHVsHWiuRx5yG2Fgdj?=
 =?us-ascii?Q?LxqwkMBeBB83G8xb45EkSSq5Jz7zoZcqpEmLt9G6hia+RhwIDI5CV7mJu2ES?=
 =?us-ascii?Q?zR2TrW2lmkCVO3FPc62hPphcyvFuyGXRQNuKiVs5uarvOgVeuMc6gb+dGU09?=
 =?us-ascii?Q?qqUrTYFx6OL8DodLgdr0CObnXRzefLS3oZSIzKipZSfaKwYlK1g0HjmbV3Ao?=
 =?us-ascii?Q?CtU29iJgYxR3t+rVZC9/5rfOGFViNyANlsAHcxr8krL2CjL5EdYBo3e6srz5?=
 =?us-ascii?Q?a0vvOfTvKfjobErZ9FmxnipAA/cfjqhyHHvZlH33YA4xpF4UD6yL1PeXKd/a?=
 =?us-ascii?Q?RjwYJfcxLcik/KN9YNJW+bA7AC6pecGLM7gFrCYrK9TUfUfz+FGxyVXPNfTz?=
 =?us-ascii?Q?8yAwpRjf/ez5QB4QqN6ijbW+qT4raayUQRkrurxnfZ22oR/pIsNK9qjbRkL0?=
 =?us-ascii?Q?rIq/xm8wKxj4fF54qFymVCWmoT/yrTT8S1FtvEomyX2P+kVesKJuyRRST+Gj?=
 =?us-ascii?Q?2Zy5ESUdvnfonvmhOMjY7tpAjxooqihrtMauOy+To9Lsnu2xVlBNvVLPcmwz?=
 =?us-ascii?Q?GL41YNPso0fHORXU23lKxYyAPQ93z4NysftIFnobF7dQWghcSUt3ID1Zu+Fc?=
 =?us-ascii?Q?CqjHCrE4v5CYdjjFES7FBlo058SLAxj7YW6DwZoqsg/GGiQD5vaTQFtHG9jA?=
 =?us-ascii?Q?cFQEPYI4pbd83qCVXkceOaF2VdEw0e4lIhajmw6u0KABL3prXYm75ypKRV4R?=
 =?us-ascii?Q?Z1oivbkGTWN+CbWMeXt4N91cKY4Mud/aJrf8qq1sP+zZlvqM0mU0gduf2jyD?=
 =?us-ascii?Q?f21Sy3TB/+1b5G1Ezu1eZAwTOt8ywDwpPMVoC+ku6c014HKSxeQeYwieK403?=
 =?us-ascii?Q?ooZ8Zd1Y+WsjTpYzI3a6/GSCLr7txdlpUSYBfLFexvBB4zEZyIk9RgGzOxUB?=
 =?us-ascii?Q?r9ldaKpZYoEyQkELog8Q70dPRHq6JZ5BWwNOqkU/Fx+fSWu1V/Z8/cKY0Q89?=
 =?us-ascii?Q?y9LKDs1++bt7a7IYke3oLY4egeFBduEy5GhfKf2ni6L208oB0uLZ4fIgzE6J?=
 =?us-ascii?Q?q/xBJYhX44JRhY+QU4p+d0+tILw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <39DB09D8ABCF2F4E82EF18B7C7163BB7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbed282-fa74-40fd-3707-08d9c6480f45
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 19:11:44.4993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PafnMqC2kOetfswP4S4iI3+HUwSB6eQcV/ignkfOpkvZ9H8C9IOwhceFAfmz5yIs+lOusn7O5nCk+5uUYItMgV3qASfhjLwmBxa2hAFi/V4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7277
X-Proofpoint-GUID: U_ij-HNWsK2nxz_qDz521DZkzo414s2A
X-Proofpoint-ORIG-GUID: U_ij-HNWsK2nxz_qDz521DZkzo414s2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-23_04,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112230100

Hi Stefano,

On Wed, Dec 22, 2021 at 06:23:13PM -0800, Stefano Stabellini wrote:
> On Wed, 22 Dec 2021, Julien Grall wrote:
> > > > > > > To me dtdev and XEN_DOMCTL_assign_device are appropriate beca=
use
> > > > > > > they
> > > > > > > signify device assignment of one or more devices. We are not =
adding
> > > > > > > any
> > > > > > > additional "meaning" to them. It is just that we'll automatic=
ally
> > > > > > > detect
> > > > > > > and generate any SCMI configurations based on the list of ass=
igned
> > > > > > > devices. Because if SCMI is enabled and a device is assigned =
to the
> > > > > > > guest, then I think we want to add the device to the SCMI lis=
t of
> > > > > > > devices automatically.
> > > > > >=20
> > > > > > I am OK with re-using dtdev/XEN_DOMCTL_assign_device however th=
ere is
> > > > > > a pitfall with that approach.
> > > > > >=20
> > > > > > At the moment, they are only used for device protected by the
> > > > > > IOMMU. If the device is not protected by the IOMMU then it will=
 return
> > > > > > an error.
> > > > > IIRC there was a change, that allowed to assign device without a
> > > > > IOMMU. At
> > > > > least we discussed this internally.
> > > >=20
> > > > I am not aware of any upstream. Do you have a pointer if there is a=
ny
> > > > public discussion?
> > >=20
> > > No, this is the first public discussion on this topic.
> > >=20
> > > >=20
> > > > > >=20
> > > > > > Now, with your approach we may have a device that is not protec=
ted by
> > > > > > the IOMMU but require to a SCMI configuration.
> > > > > You need to protect only DMA-capable devices.
> > > >=20
> > > > Xen doesn't know if the device is DMA-capable or not. So...
> > > >=20
> > >=20
> > > But it knows if there is a iommus=3D<> node present for the device.
> >=20
> > Not really. Not all the platforms have IOMMUs and not all the platforms=
 with
> > IOMMU have DMA-capable device protected by an IOMMU.
> >=20
> > >=20
> > > > >=20
> > > > > > I don't think it would be sensible to just return "succeed" her=
e
> > > > > > because technically you are asking to assign a non-protected
> > > > > > device. But at the same time, it would prevent a user to assign=
 a
> > > > > > non-DMA capable device.
> > > > > >=20
> > > > > > So how do you suggest to approach this?
> > > > > Well, in my head assign_device ideally should do the following:
> > > > > 1. Assign IOMMU if it is configured for the device
> > > >=20
> > > > ... with this approach you are at the risk to let the user passthro=
ugh
> > > > a device that cannot be protected.
> > > >=20
> > > > > 2. Assign SCMI access rights
> > > > > (Not related to this patch series, but...)
> > > > > 3. Assign IRQs
> > > > > 4. Assign IO memory ranges.
> > > > > Points 3. and 4. would allow us to not provide additional irq=3D[=
] and
> > > > > iomem=3D[] entries in a guest config.
> > > >=20
> > > > That could only work if your guest is using the same layout as the
> > > > host.
> > >=20
> > > Agreed. But in my experience, in most cases this is the true. We work=
ed
> > > with Renesas and IMX hardware and in both cases iomems were
> > > mapped 1:1.
> > >=20
> > > > Otherwise, there is a risk it will clash with other parts of the
> > > > memory layout.
> > > >=20
> > >=20
> > > > Today, guests started via the toolstack is only using a virtual
> > > > layout, so you would first need to add support to use the host memo=
ry
> > > > layout.
> > >=20
> > > I can't say for all the possible configurations in the wild, but I'm
> > > assuming that in most cases it will be fine to use 1:1 mapping. For
> > > those more exotic cases it would be possible to implement some
> > > configuration option like iomem_map=3D[mfn:gfn].
> > Well, the Xen memory layout is not something that is stable nor AFAIK b=
ased on
> > any memory layout. In fact, there is no such generic layout on Arm.
> >=20
> > It is quite possible that it will work well with 1:1 MMIO on some platf=
orm
> > (e.g. Renesas, IMX) but you can't expect to work for every Xen release =
or all
> > the platforms.
>=20
> Yeah this is a true problem. Thankfully with Penny's series we'll be
> able to create domUs with the host memory layout (although dom0less
> only but it is a step forward).
>=20
> =20
> > > As Stefano pointed, right now user needs to provide 3 configuration
> > > options to pass a device to a guest: dt_dev, irq, iomem. But in fact,
> > > Xen is already knowing about irq and iomem from device tree.
> >=20
> > I understand and this is not ideal. I would be happy to consider your
> > approach. However, this will have to enabled only when the guest is re-=
using
> > the host layout.
>=20
> It looks like we all agree that today configuring device assignment with
> Xen is too complicated and would like for it to be simpler. This thread
> has some excellent ideas on how to address the issue. Skip to the end if
> you are only interested in this patch series.
>=20
>=20
> # Future Ideas
>=20
> A great suggestion by Julien is to start supporting the dom0less partial
> device tree format in xl/libxl as well so that we can have a single
> "device_tree" option in dom.cfg instead of 4 (device_tree, iomem, irqs,
> dtdev).
>=20
> Even with that implemented, the user has still to provide a partial dtb,
> xen,reg and xen,path. I think this is a great step forward and we should
> do that, if nothing else to make it easier to switch between dom0less
> and normal domU configurations. But the number of options and
> information that the user has to provide is still similar to what we
> have today.
>=20
> After that, I think we need something along the lines of what Volodymyr
> suggested. Let's say that the user only provides "dtdev" and
> "device_tree" in dom.cfg.  We could:
>=20
> - read interrupts from the  "interrupts" property like we do for dom0less
> - read "xen,reg" for the mapping, if "xen,reg" is missing, read "reg"
>   and assume 1:1 (we could try the mapping and print an error on
>   failure, or we could only do 1:1 if the domain is entirely 1:1)
> - optionally read "xen,path" to populate dtdev
> - if an IOMMU configuration is present, then also configure the IOMMU
>   for the device, if not then "xen,force-assign-without-iommu" must be
>   present
> - assign SCMI access rights
>=20
>=20
> Now we only have:
> - device_tree in dom.cfg
> - dtdev in dom.cfg (or xen,path in the partial DTB)
> - xen,force-assign-without-iommu in the partial DTB
>=20
>=20
> It would be good if we could remove "xen,force-assign-without-iommu"
> because at this stage it is the only Xen-specific property remaining in
> the partial DTB. If we could get rid of it, it would make it easier to
> write/generate the partial DTB because it becomes a strict subset of the
> corresponding host node. It would enable us to automatically generate it
> (we are going to do experiments with it at Xilinx in the next few
> months) and it would be easier to explain to users how to write it.
> The partial DTB usually starts as a copy of the corresponding host node
> plus some edits. The fewer edits are required, the better.
>=20
> But it is difficult because of the reasons mentioned by Julien. In Xen
> we cannot know if a device is not behind an IOMMU because is not a DMA
> master (so safe to assign) or because the system simply doesn't have
> enough IOMMU coverage (so not safe to assign). Thankfully the hardware
> has been improving in recent years and there are more and more platforms
> with full IOMMU coverage. I think we should make it easier for users on
> these well-behave platforms.
>=20
> At least, we could move the "xen,force-assign-without-iommu" option from
> the partial DTB to the VM config file dom.cfg. Something like:
>=20
> force-assign-without-iommu=3D"true"
> or
> platform-iommu-safe=3D"true"
>=20
> That way, it is global rather than per-device and doesn't have to be
> added by the user by hand when creating the partial DTB.
>=20
>=20
> # This patch series
>=20
> Now in regards to this specific series and the SCMI options today, I
> think it is OK to have a per-domain sci=3D"scmi_smc", but I think we
> should try to avoid another detailed list of device paths or list of
> IDs in addition to dtdev.
>=20
> dtdev already specifies the device tree nodes to be assigned to the
> guest. Based on that list we can also do SCMI assignment.
>=20
> As Julien pointed out, the issue is: what if a device needs SCMI
> assignment but is not a DMA master (hence there is no IOMMU
> configuration on the host)?
>=20
> Attempting to assign a DMA mastering device without IOMMU protection is
> not just unsafe, it will actively cause memory corruptions in most
> cases. It is an erroneous configuration.
>=20
> Of course we should try to stop people from running erroneous
> configurations, but we should do so without penalizing all users.
>=20
> With that in mind, also considering that dtdev is the list of devices to
> be assigned, I think dtdev should be the list of all devices, even
> non-DMA masters. It makes a lot of sense also because today is really
> difficult to explain to a user that "yes, dtdev is the devices to be
> assigned but no, if the device is a UART you don't have to add it to
> dtdev because it is not a DMA master". It would be a lot easier if the
> list of assigned devices was comprehensive, including both DMA masters
> and not DMA masters.
>=20
> So I think we should either:
>=20
> a) extend dtdev to cover all devices, including non-DMA masters
> b) or add a new "device_assignment" property which is like dtdev but is
>    the list of both DMA masters and non-DMA masters
>=20
> Either way, when non-DMA masters are present in the
> dtdev/device_assignment list we could either:
>     c) require force-assign-without-iommu=3D"true" in dom.cfg
>     d) or print a warning like:
>     "WARNING: device assignment safety for device XXX cannot be
>     verified. Please make sure XXX is not a DMA mastering device."
>=20
>=20
> All these options are good I think. My preference is a) + d), so extend
> dtdev and print a warning if non-DMA masters are in the list. We don't
> necessarily need a new hypercall but that is also an option.
>=20
> I think this discussion was a long time coming and I am glad we are
> having it now. We have a lot of room for improvement! I don't want to
> scope-creep this patch series, but I hope that this last bit could be
> done as part of this series if we find agreement in the community.

For me a) + d) looks good. I will implement it in v2 if everybody ok
with this approach.=

