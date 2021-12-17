Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575F3478B35
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 13:16:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248598.428789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myC9C-0004ve-KU; Fri, 17 Dec 2021 12:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248598.428789; Fri, 17 Dec 2021 12:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myC9C-0004tP-HR; Fri, 17 Dec 2021 12:15:38 +0000
Received: by outflank-mailman (input) for mailman id 248598;
 Fri, 17 Dec 2021 12:15:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qsGH=RC=epam.com=prvs=29854569c1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1myC9B-0004tJ-1o
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 12:15:37 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0888efbb-5f33-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 13:15:34 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BHBvvul011488;
 Fri, 17 Dec 2021 12:15:29 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3d0t3g82ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 12:15:28 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB6733.eurprd03.prod.outlook.com (2603:10a6:102:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 12:15:25 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.019; Fri, 17 Dec 2021
 12:15:25 +0000
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
X-Inumbo-ID: 0888efbb-5f33-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxJexuFKq/n5bcPuwKwmfwu0DyEW/9lZD1HB/FK6Rj3WPXdb9tiLd+2wNC37tvu+6YV8RcWAHbaSBC8RypeKFFDrW3AgqCVhqMC9J2qqMacJ/H/mBcwNuwwwCURkADSJfqUFtUWQUkIYzKEWEWw/Fwu51lWV8JhBw5nGEQt984cLvZ12O+9vXoz/hTGMgajrFZhQsV50PVmcb1n4lRHU4cr4xb1ZE5dQ9cs9l5s9eoc9ta4WlI7juaS+uE8Uu5eiwGT7vzomairAw7h18Ljp4yf6n6QKjeFPdoXZ3iThfBYgbleiabUJfYr8+BCduZVKuFo7w0Yv5bdRJWHWiOUODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2W5m6cbG7JZpPykxLDKpaDOPGPQ+cc6ARQ0iZvLeMvg=;
 b=iqTim7/bvvp1YPFxpqeRjrl9gFFAflIt9qEvPjaBfl7p5N+IZnbwxN87S24iHWFza9pX7wxIdXzHf7npuqNmz1zyGJHDUy4peC1GoLlFnJQPCMzrRL/uL/oWhgwkeqVBruZ8U8zu4TZSb7Ox11C7enmNGUzzKjr4V5YvtfVGp8Ml3HTrWkPRGvCr7kTIgk9021rV8nW2gGDvm+6T0FRJtVX6QYU21MsGxJexvLoMgy6GoTpIBQleCt9PcM+64jveaA1832bUKR4XvsClDAp4WiF/n2xjCJt+mWhhG1khMtdYJ6e2IprSy17oiu8AcvHKrR7eZnfOfv06v3JRkgxhsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2W5m6cbG7JZpPykxLDKpaDOPGPQ+cc6ARQ0iZvLeMvg=;
 b=SD7kQ0Sfes0qrkJvvtK/C+I9KiiiBPb+9ge/za202V20iBZ4bLEOrNwMhC30X3ZDGAtGab9/RGilnAWkV56llld6prO5bOU5iHEWEoCieWzjzZZFX5zbaxk+U+tYqXVmPBB9lngelPk9AZAohe5MYHa1ZYj7E0phP1KvrHU+dfbydurSJlwHxrndHlx8QnbfYO1RciH1PG3D79/uI17pjS7dFYRUt4k81Uj4reWdXGf/y/JlE0KXJc9RpBzszgU8jMuh6jd3CaWBkZ/4L3Jb2e+43pwcRRhTp6kJa0FOk5g30OvCtZaabrxXgTz17z/zJTVLVHGe6FpmAYzCmfckdg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Oleksandr <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Anthony PERARD
	<anthony.perard@citrix.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Topic: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Index: AQHX8M3LpzWz4l8PQUiIA2nAUV0H+qw0P2iAgAJehQA=
Date: Fri, 17 Dec 2021 12:15:25 +0000
Message-ID: <20211217121524.GA4021162@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
 <b1c27f70-309d-bb36-3228-32836063fd16@gmail.com>
In-Reply-To: <b1c27f70-309d-bb36-3228-32836063fd16@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95e8ebfb-a938-4692-71d1-08d9c156e811
x-ms-traffictypediagnostic: PA4PR03MB6733:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB673378BFA6E7BD3F8337E899E3789@PA4PR03MB6733.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 O+H3y0rS1bW8eElNL8opLTbBPzddME0a9K2r1WoQdDDNMFriWZMBlR3/pzqBuTiCQgLkQWa9dCFrnZIovYlyynei1p9CRqcOPjljRmpM4fpeKflRgQBcGaZXkZk8mx34j0IgD0qcGofdRwa0zHXNH+xs0TYwt22EWwpFNLJ4OWIvU7fa3NCLrudJswHc9et+SyKvXeAJM51P5ma5qCSISEbdZLAVSJbHTu2u0cdbmtbaQQuM0Shahx0okFM7tSWqzL25JGJ7rkiP6sLvE/1ZeC2GeaGZxdWb//F3UCvwTzh2uDus+UeMEwnLupmRg4Me88VW6XvYCkWm2CsAHe7cx0ACSj61M54vJ0kpIcbMjbHcssnmMhZqHKe4LVXDG+XjzAT7mfkZtds1V6QHExb7EL0k5J4PPpc8fpg2neRrcHjapP5H4LORXVbv4ma6N65w9mOhPnWtKTuzHkTwst6XgLB3v7YnO8EfGbnbDkPD1XBhchTbsmhmZrtIEVSlonUqoYgZhdvDV+iaESocXY25vRgmeXvovg3hGEkH08AAP8jmYWHMBGLizpzQFkIQquihdS4EkrJoVaqJFwGchHyGpv288S+ITjrG8TCnVqVfYukq3IEiwJjW/K1SkFOMxuhvKbuL54U2dNfqVQdh9WXzEjiwk0fqh/2V8bP+5JpwfpR/g3d9Nk0Aq3phdboY4p0r9FBvVEvPavSiJFumRUzoXw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(38070700005)(8936002)(4326008)(33656002)(9686003)(38100700002)(86362001)(54906003)(6512007)(7416002)(122000001)(186003)(316002)(71200400001)(76116006)(8676002)(6506007)(1076003)(5660300002)(64756008)(66946007)(2906002)(91956017)(66476007)(6486002)(33716001)(6916009)(83380400001)(53546011)(508600001)(26005)(30864003)(66446008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?7+wDrgxjk06xxTosY56lrv0wAsAQDL9P9iAChm/fWgDjJhwVOwP++HgIXb?=
 =?iso-8859-1?Q?Unqsebl8GRKtqFhqMbOVKb1yRYO23kDBBbHKDWc3t5fFYPJ7ub4Kioovlh?=
 =?iso-8859-1?Q?gzyA79kvCao5FhcfHs4PwjFM97WhiPMPV5k0sPi8hkvg4JJ99L4PM4OxKz?=
 =?iso-8859-1?Q?+w4hMAZXug6dG3yLujXBKi7DULU7YEMSKZKcJ6W1fOdFUCeHXiL6tBUKNN?=
 =?iso-8859-1?Q?XECN2zmZ6oDb3tYBIdBuw34QiWTtq3Jg9hZaESdvsT5DJT425ZLbVTvox/?=
 =?iso-8859-1?Q?i3EEHjnyIWP0of7HAPEiTHQPWkB8zvxtaqmIfNNJAqp6PchJIIqKhhaXm2?=
 =?iso-8859-1?Q?tj9IcnfcEUe+HBdX0NYYoP0q43H+/TteK1EvatDSlpa2dMeI7MiBoCOS87?=
 =?iso-8859-1?Q?MqjIkXqI2M0Wq0jP3zs3waK2nqoam9dN44xVpRme5v0MSrzpnk+oU0yk5h?=
 =?iso-8859-1?Q?/eE/9Na81AdUdTtImvkNugR9y7+eF//ZV8SfQMjIgC3366klN/G09FdTlP?=
 =?iso-8859-1?Q?An3z4GU+Rikn177jkyiF0k7jyNn2hGUU9mkNlRli8eq4q7wxFATGzI/x9Z?=
 =?iso-8859-1?Q?x8TK41Egn0j/dppd/elxfskdAauT5Za77KxiDRG39cW8fNdMIZQkvgIinb?=
 =?iso-8859-1?Q?/RLeDEVw51huUCIOE3t+/2FY0qo45RuodFzyQbaU4EJputVjW2A9rJ0bnF?=
 =?iso-8859-1?Q?d7BYrVmwr6LM9z9JUvib96eXIEZre48COwS2DYpGNP04IToXwljF5W8vl5?=
 =?iso-8859-1?Q?iTA76inqsaoS38jKgqkC8IU2LGqflUUYeutCIrEkdwO/qNW/SQ1ji9H0Ac?=
 =?iso-8859-1?Q?rC/7oAxAa2j9B0Nt0+PDkOUg8VtPIEwPbBMLhFNTeey8QXUjbdqxNSf5KS?=
 =?iso-8859-1?Q?+zvu9+CEtHieAhYUDETgR3mA4fuWSv+xKPyqyG2vq4BCAXM/wDf1VCMixT?=
 =?iso-8859-1?Q?rObI4iJRONXVfl2AijiNsI6aQ1vwhD/pfHAuMf9JDlUX+PR12fXMs6UTmD?=
 =?iso-8859-1?Q?f2iWGVg9C4o1OI9TkRxGxpvTEjXI93dZc8JAQVPn1sQYSACGIJ25cHBOCe?=
 =?iso-8859-1?Q?aPggYCsRm4862OBrtNAfrUMhNZQD42qBMGznTJrA2oCfXwWDOx3Hlt+RSU?=
 =?iso-8859-1?Q?LlSqzCthd79ZD4zOZF7Hb3nTpNPzpxo3E91Kv9ljgT2dyWs0fvDGWy7yzV?=
 =?iso-8859-1?Q?9zpg9A6tOhtVGS7TEiGuKA6MqSxIK/avO9gur7Enj+/sJTHTse9eRTemDN?=
 =?iso-8859-1?Q?OWoGxYafwm4APU0Pz4Shh4RwwYjSXL2fcPhO/cgeXLzesNTBswDQudIFrV?=
 =?iso-8859-1?Q?EJCNC94/x0NL5VIZBIQCZyC3+G9+e8mrZIKyO5hORU7u0y5ghMJ5jfnRSm?=
 =?iso-8859-1?Q?gtzvXjm77KJ9d1cDocb4pp9qO+dACX0OUU4hCN5jFov8zbBnQQNDv4npZx?=
 =?iso-8859-1?Q?JMpg59EUcF8pUE98dXACjmqOfVa6pZ0M3ZEP8ind90spf6lP5ChQBOTMCL?=
 =?iso-8859-1?Q?HKRdXBc21Ucahd2M1oQvvZbM0hssSuRcvyXH6TOo8FAGsPseWEyYI/kqaU?=
 =?iso-8859-1?Q?nw8AKRhBdkm7wj+Us80NTe32k7vws/jJFNkTUa/j8zIzu6f/xDZh/dFyuQ?=
 =?iso-8859-1?Q?A0HUtRBq7nPEhmJoaVbsFExMhtWcEOcrdGdi9xGCMq01DmGIzJKaZXwSR/?=
 =?iso-8859-1?Q?J4h0l7gklx3qDg2XWrZGV/hfO2fSQXR0G0CJ95MCAqOz0e9SUEWYgdRgR6?=
 =?iso-8859-1?Q?a2DIL93V0Qkg/Xhfo5m6Zlwz8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3987041BFC93194F9F17E38D502FC10D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e8ebfb-a938-4692-71d1-08d9c156e811
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 12:15:25.3347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppnP+m9iW6OwMj36RhXciSW8haHp3TNv4rtfXCe9hfrH6vUkDOnnv/lwJ1A6J0rADppE4wlaz6/8w8iPeVDW9ZoVrV8sKYd4xkLqfs+dN7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6733
X-Proofpoint-GUID: fyQkm6s4HX2Xyq0Tes4BycE7EuNe07r6
X-Proofpoint-ORIG-GUID: fyQkm6s4HX2Xyq0Tes4BycE7EuNe07r6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_04,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170071

Hi Oleksandr,

On Thu, Dec 16, 2021 at 02:04:35AM +0200, Oleksandr wrote:
>=20
> On 14.12.21 11:34, Oleksii Moisieiev wrote:
>=20
> Hi Oleksii
>=20
> > Integration of the SCMI mediator with xen libs:
> > - add hypercalls to aquire SCI channel and set device permissions
> > for DomUs;
> > - add SCMI_SMC nodes to DomUs device-tree based on partial device-tree;
> > - SCI requests redirection from DomUs to Firmware.
> >=20
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> >   tools/include/xenctrl.h           |   3 +
> >   tools/include/xenguest.h          |   2 +
> >   tools/libs/ctrl/xc_domain.c       |  23 ++++++
> >   tools/libs/guest/xg_dom_arm.c     |   5 +-
> >   tools/libs/light/libxl_arm.c      | 122 +++++++++++++++++++++++++++--=
-
> >   tools/libs/light/libxl_create.c   |  54 ++++++++++++-
> >   tools/libs/light/libxl_dom.c      |   1 +
> >   tools/libs/light/libxl_internal.h |   4 +
> >   xen/arch/arm/domctl.c             |  15 ++++
> >   xen/include/public/domctl.h       |   9 +++
> >   10 files changed, 223 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> > index 07b96e6671..cdd14f465f 100644
> > --- a/tools/include/xenctrl.h
> > +++ b/tools/include/xenctrl.h
> > @@ -1238,6 +1238,9 @@ int xc_domain_getvnuma(xc_interface *xch,
> >   int xc_domain_soft_reset(xc_interface *xch,
> >                            uint32_t domid);
> > +int xc_domain_add_sci_device(xc_interface *xch,
> > +                              uint32_t domid, char *path);
> > +
> >   #if defined(__i386__) || defined(__x86_64__)
> >   /*
> >    * PC BIOS standard E820 types and structure.
> > diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> > index 61d0a82f48..35c611ac73 100644
> > --- a/tools/include/xenguest.h
> > +++ b/tools/include/xenguest.h
> > @@ -242,6 +242,8 @@ struct xc_dom_image {
> >       /* Number of vCPUs */
> >       unsigned int max_vcpus;
> > +
> > +    xen_pfn_t sci_shmem_gfn;
> >   };
> >   /* --- arch specific hooks ----------------------------------------- =
*/
> > diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> > index b155d6afd2..07bb390e17 100644
> > --- a/tools/libs/ctrl/xc_domain.c
> > +++ b/tools/libs/ctrl/xc_domain.c
> > @@ -2206,6 +2206,29 @@ int xc_domain_soft_reset(xc_interface *xch,
> >       domctl.domain =3D domid;
> >       return do_domctl(xch, &domctl);
> >   }
> > +
> > +int xc_domain_add_sci_device(xc_interface *xch,
> > +                              uint32_t domid, char *path)
> > +{
> > +    size_t size =3D strlen(path);
> > +    int rc;
> > +    DECLARE_DOMCTL;
> > +    DECLARE_HYPERCALL_BOUNCE(path, size, XC_HYPERCALL_BUFFER_BOUNCE_IN=
);
> > +
> > +    if ( xc_hypercall_bounce_pre(xch, path) )
> > +        return -1;
> > +
> > +    domctl.cmd =3D XEN_DOMCTL_add_sci_device;
> > +    domctl.domain =3D domid;
> > +    domctl.u.sci_device_op.size =3D size;
> > +    set_xen_guest_handle(domctl.u.sci_device_op.path, path);
> > +    rc =3D do_domctl(xch, &domctl);
> > +
> > +    xc_hypercall_bounce_post(xch, path);
> > +
> > +    return rc;
> > +}
> > +
> >   /*
> >    * Local variables:
> >    * mode: C
> > diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_ar=
m.c
> > index 5e3b76355e..368a670c46 100644
> > --- a/tools/libs/guest/xg_dom_arm.c
> > +++ b/tools/libs/guest/xg_dom_arm.c
> > @@ -25,11 +25,12 @@
> >   #include "xg_private.h"
> > -#define NR_MAGIC_PAGES 4
> > +#define NR_MAGIC_PAGES 5
> >   #define CONSOLE_PFN_OFFSET 0
> >   #define XENSTORE_PFN_OFFSET 1
> >   #define MEMACCESS_PFN_OFFSET 2
> >   #define VUART_PFN_OFFSET 3
> > +#define SCI_SHMEM_OFFSET 4
> >   #define LPAE_SHIFT 9
> > @@ -69,11 +70,13 @@ static int alloc_magic_pages(struct xc_dom_image *d=
om)
> >       dom->console_pfn =3D base + CONSOLE_PFN_OFFSET;
> >       dom->xenstore_pfn =3D base + XENSTORE_PFN_OFFSET;
> >       dom->vuart_gfn =3D base + VUART_PFN_OFFSET;
> > +    dom->sci_shmem_gfn =3D base + SCI_SHMEM_OFFSET;
> >       xc_clear_domain_page(dom->xch, dom->guest_domid, dom->console_pfn=
);
> >       xc_clear_domain_page(dom->xch, dom->guest_domid, dom->xenstore_pf=
n);
> >       xc_clear_domain_page(dom->xch, dom->guest_domid, base + MEMACCESS=
_PFN_OFFSET);
> >       xc_clear_domain_page(dom->xch, dom->guest_domid, dom->vuart_gfn);
> > +    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->sci_shmem_gf=
n);
> >       xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_CONSOLE_PF=
N,
> >               dom->console_pfn);
> > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.=
c
> > index eef1de0939..73ef591822 100644
> > --- a/tools/libs/light/libxl_arm.c
> > +++ b/tools/libs/light/libxl_arm.c
> > @@ -8,6 +8,8 @@
> >   #include <assert.h>
> >   #include <xen/device_tree_defs.h>
> > +#define SCMI_NODE_PATH      "/firmware/scmi"
> > +
> >   static const char *gicv_to_string(libxl_gic_version gic_version)
> >   {
> >       switch (gic_version) {
> > @@ -101,6 +103,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *g=
c,
> >           return ERROR_FAIL;
> >       }
> > +    switch (d_config->b_info.sci) {
> > +    case LIBXL_SCI_TYPE_NONE:
> > +        config->arch.sci_type =3D XEN_DOMCTL_CONFIG_SCI_NONE;
> > +        break;
> > +    case LIBXL_SCI_TYPE_SCMI_SMC:
> > +        config->arch.sci_type =3D XEN_DOMCTL_CONFIG_SCI_SCMI_SMC;
> > +        break;
> > +    default:
> > +        LOG(ERROR, "Unknown SCI type %d",
> > +            d_config->b_info.sci);
> > +        return ERROR_FAIL;
> > +    }
> > +
> >       return 0;
> >   }
> > @@ -122,6 +137,7 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
> >       }
> >       state->clock_frequency =3D config->arch.clock_frequency;
> > +    state->sci_agent_paddr =3D config->arch.sci_agent_paddr;
> >       return 0;
> >   }
> > @@ -502,9 +518,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt=
)
> >       int res;
> >       LOG(DEBUG, "Creating OP-TEE node in dtb");
> > -    res =3D fdt_begin_node(fdt, "firmware");
> > -    if (res) return res;
> > -
> >       res =3D fdt_begin_node(fdt, "optee");
> >       if (res) return res;
> > @@ -517,9 +530,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt=
)
> >       res =3D fdt_end_node(fdt);
> >       if (res) return res;
> > -    res =3D fdt_end_node(fdt);
> > -    if (res) return res;
> > -
> >       return 0;
> >   }
> > @@ -902,10 +912,9 @@ static int copy_node(libxl__gc *gc, void *fdt, voi=
d *pfdt,
> >       return 0;
> >   }
> > -static int copy_node_by_path(libxl__gc *gc, const char *path,
> > -                             void *fdt, void *pfdt)
> > +static int get_path_nodeoff(const char *path, void *pfdt)
> >   {
> > -    int nodeoff, r;
> > +    int nodeoff;
> >       const char *name =3D strrchr(path, '/');
> >       if (!name)
> > @@ -925,12 +934,101 @@ static int copy_node_by_path(libxl__gc *gc, cons=
t char *path,
> >       if (strcmp(fdt_get_name(pfdt, nodeoff, NULL), name))
> >           return -FDT_ERR_NOTFOUND;
> > +    return nodeoff;
> > +}
> > +
> > +static int copy_node_by_path(libxl__gc *gc, const char *path,
> > +                             void *fdt, void *pfdt)
> > +{
> > +    int nodeoff, r;
> > +
> > +    nodeoff =3D get_path_nodeoff(path, pfdt);
> > +    if (nodeoff < 0)
> > +        return nodeoff;
> > +
> >       r =3D copy_node(gc, fdt, pfdt, nodeoff, 0);
> >       if (r) return r;
> >       return 0;
> >   }
> > +static int get_node_phandle(const char *path, void *pfdt, uint32_t *ph=
andle)
> > +{
> > +    int nodeoff;
> > +    const char *name =3D strrchr(path, '/');
> > +
> > +    if (!name)
> > +        return -FDT_ERR_INTERNAL;
> > +
> > +    name++;
> > +    nodeoff =3D fdt_path_offset(pfdt, path);
> > +    if (nodeoff < 0)
> > +        return nodeoff;
> > +
> > +    *phandle =3D fdt_get_phandle(pfdt, nodeoff);
> > +    return 0;
> > +}
> > +
> > +static int make_scmi_shmem_node(libxl__gc *gc, void *fdt, void *pfdt,
> > +                           struct xc_dom_image *dom)
> > +{
> > +    int res;
> > +    char buf[64];
> > +    uint32_t phandle =3D 0;
> > +
> > +    res =3D get_node_phandle("/scp-shmem", pfdt, &phandle);
> > +    if (res) return res;
> > +
> > +    snprintf(buf, sizeof(buf), "scp-shmem@%lx",
> > +             dom->sci_shmem_gfn << XC_PAGE_SHIFT);
> > +    res =3D fdt_begin_node(fdt, buf);
> > +    if (res) return res;
> > +
> > +    res =3D fdt_property_compat(gc, fdt, 1, "arm,scmi-shmem");
> > +    if (res) return res;
> > +
> > +    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> > +                    GUEST_ROOT_SIZE_CELLS, 1,
> > +                    dom->sci_shmem_gfn << XC_PAGE_SHIFT, XC_PAGE_SHIFT=
);
> > +    if (res) return res;
> > +
> > +    LOG(DEBUG, "scmi: setting phandle =3D %u\n", phandle);
> > +    res =3D fdt_property_cell(fdt, "phandle", phandle);
> > +    if (res) return res;
> > +
> > +    res =3D fdt_end_node(fdt);
> > +    if (res) return res;
> > +
> > +    return 0;
> > +}
> > +
> > +static int make_firmware_node(libxl__gc *gc, void *fdt, void *pfdt, in=
t tee,
> > +                              int sci)
> > +{
> > +    int res;
> > +
> > +    if ((tee !=3D LIBXL_TEE_TYPE_OPTEE) && (sci !=3D LIBXL_SCI_TYPE_NO=
NE))
> > +        return 0;
> > +
> > +    res =3D fdt_begin_node(fdt, "firmware");
> > +    if (res) return res;
> > +
> > +    if (tee =3D=3D LIBXL_TEE_TYPE_OPTEE) {
> > +       res =3D make_optee_node(gc, fdt);
> > +       if (res) return res;
> > +    }
> > +
> > +    if (sci =3D=3D LIBXL_SCI_TYPE_SCMI_SMC) {
> > +        res =3D copy_node_by_path(gc, SCMI_NODE_PATH, fdt, pfdt);
> > +        if (res) return res;
> > +    }
> > +
> > +    res =3D fdt_end_node(fdt);
> > +    if (res) return res;
> > +
> > +    return 0;
> > +}
> > +
> >   /*
> >    * The partial device tree is not copied entirely. Only the relevant =
bits are
> >    * copied to the guest device tree:
> > @@ -1088,8 +1186,10 @@ next_resize:
> >           if (info->arch_arm.vuart =3D=3D LIBXL_VUART_TYPE_SBSA_UART)
> >               FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
> > -        if (info->tee =3D=3D LIBXL_TEE_TYPE_OPTEE)
> > -            FDT( make_optee_node(gc, fdt) );
> > +        FDT( make_firmware_node(gc, fdt, pfdt, info->tee, info->sci) )=
;
> > +
> > +        if (info->sci =3D=3D LIBXL_SCI_TYPE_SCMI_SMC)
> > +            FDT( make_scmi_shmem_node(gc, fdt, pfdt, dom) );
> >           if (d_config->num_pcidevs)
> >               FDT( make_vpci_node(gc, fdt, ainfo, dom) );
> > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_c=
reate.c
> > index dcd09d32ba..c7372fd344 100644
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -596,6 +596,37 @@ out:
> >       return ret;
> >   }
> > +static int map_sci_page(libxl__gc *gc, uint32_t domid, uint64_t paddr,
> > +                         uint64_t guest_addr)
> > +{
> > +    int ret;
> > +    uint64_t _paddr_pfn =3D paddr >> XC_PAGE_SHIFT;
> > +    uint64_t _guest_pfn =3D guest_addr >> XC_PAGE_SHIFT;
> > +
> > +    LOG(DEBUG, "iomem %"PRIx64, _paddr_pfn);
> > +
> > +    ret =3D xc_domain_iomem_permission(CTX->xch, domid, _paddr_pfn, 1,=
 1);
> > +    if (ret < 0) {
> > +        LOG(ERROR,
> > +              "failed give domain access to iomem page %"PRIx64,
> > +             _paddr_pfn);
> > +        return ret;
> > +    }
> > +
> > +    ret =3D xc_domain_memory_mapping(CTX->xch, domid,
> > +                                   _guest_pfn, _paddr_pfn,
> > +                                   1, 1);
> > +    if (ret < 0) {
> > +        LOG(ERROR,
> > +              "failed to map to domain iomem page %"PRIx64
> > +              " to guest address %"PRIx64,
> > +              _paddr_pfn, _guest_pfn);
> > +        return ret;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> >                          libxl__domain_build_state *state,
> >                          uint32_t *domid, bool soft_reset)
> > @@ -762,6 +793,16 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain=
_config *d_config,
> >           goto out;
> >       }
> > +    if (state->sci_agent_paddr !=3D 0) {
> > +        ret =3D map_sci_page(gc, *domid, state->sci_agent_paddr,
> > +                            state->sci_shmem_gfn << XC_PAGE_SHIFT);
> > +        if (ret < 0) {
> > +            LOGED(ERROR, *domid, "map SCI page fail");
> > +            rc =3D ERROR_FAIL;
> > +            goto out;
> > +        }
> > +    }
> > +
> >       dom_path =3D libxl__xs_get_dompath(gc, *domid);
> >       if (!dom_path) {
> >           rc =3D ERROR_FAIL;
> > @@ -1817,17 +1858,24 @@ static void libxl__add_dtdevs(libxl__egc *egc, =
libxl__ao *ao, uint32_t domid,
> >   {
> >       AO_GC;
> >       libxl__ao_device *aodev =3D libxl__multidev_prepare(multidev);
> > -    int i, rc =3D 0;
> > +    int i, rc =3D 0, rc_sci =3D 0;
> >       for (i =3D 0; i < d_config->num_dtdevs; i++) {
> >           const libxl_device_dtdev *dtdev =3D &d_config->dtdevs[i];
> >           LOGD(DEBUG, domid, "Assign device \"%s\" to domain", dtdev->p=
ath);
> >           rc =3D xc_assign_dt_device(CTX->xch, domid, dtdev->path);
> > -        if (rc < 0) {
> > -            LOGD(ERROR, domid, "xc_assign_dtdevice failed: %d", rc);
> > +        rc_sci =3D xc_domain_add_sci_device(CTX->xch, domid, dtdev->pa=
th);
> > +
> > +        if ((rc < 0) && (rc_sci < 0)) {
> > +            LOGD(ERROR, domid, "xc_assign_dt_device failed: %d; "
> > +                 "xc_domain_add_sci_device failed: %d",
> > +                 rc, rc_sci);
> >               goto out;
> >           }
> > +
> > +        if (rc)
> > +            rc =3D rc_sci;
>=20
>=20
> If I get this code right, it sounds like the dom.cfg's dtdev property is
> reused to describe sci devices as well, but the libxl__add_dtdevs() does =
not
> (and can not) differentiate them. So it has no option but to send two
> domctls for each device in dtdevs[] hoping to at least one domctl to
> succeeded. Or I really missed something?
>=20
> It feels to me that:
> =A0- either new dom.cfg's property could be introduced (scidev?) to descr=
ibe
> sci devices together with new parsing logic/management code, so you will =
end
> up having new libxl__add_scidevs() to invoke XEN_DOMCTL_add_sci_device,
> so no mixing things.
> =A0- or indeed dtdev logic could be *completely* reused including extendi=
ng
> XEN_DOMCTL_assign_device to cover your use-case, although sounds generic,=
 it
> is used to describe devices for the passthrough (to configure an IOMMU fo=
r
> the device), in that case you wouldn't need an extra
> XEN_DOMCTL_add_sci_device introduced by current patch.
>=20
> Personally I would use the first option as I am not sure that second opti=
on
> is conceptually correct && possible. I would leave this for the maintaine=
rs
> to clarify.
>=20

Thank you for the point. I agree that reusing XEN_DOMCTL_assign_device
seems not to be conceptually correct. Introducing new dom.cfg property
seems to be the only way to avoid extra Domctl calls.
I will handle this in v2 if there will be no complains from Maintainers.

---
Oleksii.

>=20
>=20
> >       }
> >   out:
> > diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.=
c
> > index fe9f760f71..b1d288a8b9 100644
> > --- a/tools/libs/light/libxl_dom.c
> > +++ b/tools/libs/light/libxl_dom.c
> > @@ -710,6 +710,7 @@ int libxl__build_pv(libxl__gc *gc, uint32_t domid,
> >           state->console_mfn =3D dom->console_pfn;
> >           state->store_mfn =3D dom->xenstore_pfn;
> >           state->vuart_gfn =3D dom->vuart_gfn;
> > +        state->sci_shmem_gfn =3D dom->sci_shmem_gfn;
> >       } else {
> >           state->console_mfn =3D xc_dom_p2m(dom, dom->console_pfn);
> >           state->store_mfn =3D xc_dom_p2m(dom, dom->xenstore_pfn);
> > diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl=
_internal.h
> > index 0b4671318c..f9f9cc633a 100644
> > --- a/tools/libs/light/libxl_internal.h
> > +++ b/tools/libs/light/libxl_internal.h
> > @@ -1407,6 +1407,10 @@ typedef struct {
> >       /* Whether this domain is being migrated/restored, or booting fre=
sh.  Only
> >        * applicable to the primary domain, not support domains (e.g. st=
ub QEMU). */
> >       bool restore;
> > +
> > +    /* sci channel paddr to be set to device-tree node */
> > +    uint64_t sci_agent_paddr;
> > +    xen_pfn_t sci_shmem_gfn;
> >   } libxl__domain_build_state;
> >   _hidden void libxl__domain_build_state_init(libxl__domain_build_state=
 *s);
> > diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> > index 6245af6d0b..ba200407da 100644
> > --- a/xen/arch/arm/domctl.c
> > +++ b/xen/arch/arm/domctl.c
> > @@ -4,6 +4,7 @@
> >    * Copyright (c) 2012, Citrix Systems
> >    */
> > +#include <asm/sci/sci.h>
> >   #include <xen/errno.h>
> >   #include <xen/guest_access.h>
> >   #include <xen/hypercall.h>
> > @@ -175,6 +176,20 @@ long arch_do_domctl(struct xen_domctl *domctl, str=
uct domain *d,
> >           return rc;
> >       }
> > +    case XEN_DOMCTL_add_sci_device:
> > +    {
> > +        int rc;
> > +        struct dt_device_node *dev;
> > +
> > +        rc =3D dt_find_node_by_gpath(domctl->u.sci_device_op.path,
> > +                                   domctl->u.sci_device_op.size,
> > +                                   &dev);
> > +        if ( rc )
> > +            return rc;
> > +
> > +        return sci_add_dt_device(d, dev);
> > +    }
> > +
> >       default:
> >       {
> >           int rc;
> > diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> > index b85e6170b0..671c72c3e8 100644
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -1177,6 +1177,13 @@ struct xen_domctl_vmtrace_op {
> >   #define XEN_DOMCTL_vmtrace_get_option         5
> >   #define XEN_DOMCTL_vmtrace_set_option         6
> >   };
> > +
> > +/* XEN_DOMCTL_add_sci_device: set sci device permissions */
> > +struct xen_domctl_sci_device_op {
> > +    uint32_t size; /* Length of the path */
> > +    XEN_GUEST_HANDLE_64(char) path; /* path to the device tree node */
> > +};
> > +
> >   typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
> >   DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
> > @@ -1265,6 +1272,7 @@ struct xen_domctl {
> >   #define XEN_DOMCTL_get_cpu_policy                82
> >   #define XEN_DOMCTL_set_cpu_policy                83
> >   #define XEN_DOMCTL_vmtrace_op                    84
> > +#define XEN_DOMCTL_add_sci_device                85
> >   #define XEN_DOMCTL_gdbsx_guestmemio            1000
> >   #define XEN_DOMCTL_gdbsx_pausevcpu             1001
> >   #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> > @@ -1326,6 +1334,7 @@ struct xen_domctl {
> >           struct xen_domctl_psr_alloc         psr_alloc;
> >           struct xen_domctl_vuart_op          vuart_op;
> >           struct xen_domctl_vmtrace_op        vmtrace_op;
> > +        struct xen_domctl_sci_device_op     sci_device_op;
> >           uint8_t                             pad[128];
> >       } u;
> >   };
>=20
> I assume the XSM needs updating (adding new hook, etc).
>=20
>=20
> --=20
> Regards,
>=20
> Oleksandr Tyshchenko
> =

