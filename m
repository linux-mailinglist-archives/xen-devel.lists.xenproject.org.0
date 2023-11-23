Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EF47F5E18
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:44:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639662.997242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r687c-0004dI-H4; Thu, 23 Nov 2023 11:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639662.997242; Thu, 23 Nov 2023 11:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r687c-0004b5-EK; Thu, 23 Nov 2023 11:43:52 +0000
Received: by outflank-mailman (input) for mailman id 639662;
 Thu, 23 Nov 2023 11:43:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0YW=HE=epam.com=prvs=5691553e4c=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r687a-0004av-SI
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:43:51 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90c56289-89f5-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 12:43:49 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 3ANBD0Si002475;
 Thu, 23 Nov 2023 11:43:40 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uj2aa8xkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Nov 2023 11:43:39 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS2PR03MB9100.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 11:43:36 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 11:43:35 +0000
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
X-Inumbo-ID: 90c56289-89f5-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuOX2ANXIWn8adfMFrf5dv18BEgSuY10uV1/49a/je+l62qTYrQGs0XuwCarFwzD5H4+Lrm7gpoRlgr8ynFj4UDlqDU4SOUIRDYFSkq9xfeFT6Jmy0Ip11Prc01yX01VQ1KcTJ1xl19a20mkNbGazmf/5Kk4mwWVDJfEDiK/zK3t/POZDOoyJR71ZMtyS4y1WnFw9JGVuRwNxwZoUT2W0Dc5AWT8YyX/LwTnusmuu0+gtaZKIGQl+rvTvvfsHNeUEXQtOHk7uqdvnsJg9U9d4fyd0Ewz4W1sHnu2DeJvCQ4nJ2F4bsc6uXDjtMeFVtc7lfQq8GmzxRKvpzurOxp+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJ7P4TWEuBEeo86sHh8dnTNhNvG+OnBixLYM858ijig=;
 b=Y5PxIDF5EkkzWjUznm5oHhKoHvxxrtLKEZpHnSzYOU9ASo5BQExiemzLusfRHn+rYx4rQWQDD0yeRODvOuppE1urdeE2twbHd1iADLzcaRUk0dAhDsjsEQAGXUUJnuGeQm4Z/f8i0OzlF0uLocordzh1F8jm+XnhlAANgwVtT3t1qEKmQI6aKArMijeej62EvoIV/ryw+YF00miJzF9wtD3efQdyVE0xrkAlQZS43tnKZDMrekhodJArszL/nW9ehaqYhwPBk3fmMqAamVmUUbMoP0LBA+TC2Uur0PDnJpVn7omKX7+zUOB0xd7SpbLkl001HXv+sc2BExP60otReg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJ7P4TWEuBEeo86sHh8dnTNhNvG+OnBixLYM858ijig=;
 b=Y0LQ9G9T7dD3Ql0ke99Y/Wekj94N+9wowN+hBgckrpclFXJgEAnNlaGyj0zfs7r60fnDFmkOt2rW/ePJnzdbu0D7QfKx6aCv8uHsVGx3rIC97NhlxZSNgMvwS/zNkxYzjb8E9lE7GqSK8oLnsMWPd3uB5OTnpv3j1dJ3O3gb98ZQeXQqVqXp1W6zPPw54nAObgsa8y6Fz8hUzQ3cP8RHq21Lp+ZsP9jwbUCrjqMuUJ+vmJIBueDsiNZ31CRoEZ7lCfm1Zze5SITfDdkPxE38I49IkfIHVJhkvRR8dyseHNeqXPxVt7zWnWZHj58h26Lu3v55YX6NmGZ44UK/GxR+nw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: "paul@xen.org" <paul@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Julien Grall <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Topic: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Index: 
 AQHaHMeIsCU+MAEGAkSnPoa9ThBNz7CGlGOAgABYsYCAAAmAgIAAAakAgAAAyoCAAAJ4gIAABwqAgAAFCoCAAJ2+AIAAFY6AgAAL24A=
Date: Thu, 23 Nov 2023 11:43:35 +0000
Message-ID: <87leaoy9sy.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-5-volodymyr_babchuk@epam.com>
 <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org>
 <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop>
 <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop>
 <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop>
 <87r0khz6zj.fsf@epam.com> <87cyw1z61i.fsf@epam.com>
 <dce4efb0-4fdc-404c-8e5d-c90ed732eb8a@xen.org>
 <db7f8751c569c7cbf0049807050054071ddda0d9.camel@infradead.org>
In-Reply-To: <db7f8751c569c7cbf0049807050054071ddda0d9.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS2PR03MB9100:EE_
x-ms-office365-filtering-correlation-id: 8732e8c3-c60e-489f-1c23-08dbec196d5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Ef8mRJnhGibk68F8CDNs/YInIq3+c+9AJ9vnG5U7nkQRuKNR69XXMh+uSrHM+vLH36glXjGiGKSLs/Gu0+WRs3V3iH78Cy2k0pmNenJMgw6KVhoAOxVQDLeAEIx4jdXb1NjAJaVyY7wZumkeETYmI+I0jUelMzEtFKIrsHWD5UUJtY7myGOD1ZD3W5n2/5x4C1b7n7ir7QfnHFGKCjzmW8Oxsa790g0w3CW1RduF5Pd814k11PpdostcZUGMCF/W0eWeAjXgMXOngWSfUWgUj/tNCutdGw406ZmGOekCWF9ZovjA2Ya9LFCGj5aofnvI+F/zuDisnXpCKUQJmsk2bYuwHV15MKpmhkJjzgFKiz5i6btbaIatM3tz/daIeAvf0L1p5g0vKrnALKlVPK3u4Cj8GoisKt81SAi6DgInhwXbkh6aabcjE7AsZ4rBOB+WSElt//YJLjEB99+XczuWRaZJRJwtfvftF/NOWHJpPQh2IhKu+x1LwLxYhKO8XQ81jcuwCvaFEzrE+eeGKMxn9AUZSyAnPQ7MFsN+YvhmcimT3LQffP0dDmKN3xTbRhUwJ72bi2kg6iq8nSW3U67CQfwhKujz9viHTYrEg4W/Jx+AQ7UG0dp6Y65RKpcgDSJ+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(38070700009)(66899024)(76116006)(66946007)(66556008)(66476007)(91956017)(66446008)(64756008)(54906003)(38100700002)(36756003)(122000001)(86362001)(55236004)(53546011)(26005)(6506007)(6512007)(2616005)(2906002)(6486002)(4001150100001)(6916009)(316002)(478600001)(5660300002)(71200400001)(8936002)(8676002)(41300700001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?anJP7gjglTK7fRxt0WWBFs6DaG8iK5HnoPPRWj0XOVM62Vrh/f/2NWlQdo?=
 =?iso-8859-1?Q?wsqZaSz325MyaSmuhkB/74mfrpgvF3HYRhgdyTa/QzjhNJvnxW7zxbghAW?=
 =?iso-8859-1?Q?cwc87zsmrsLFmhUGfmlQKI8vPvp70ZKVd9JHBZkCeYv0c2tpUV40RT+fSq?=
 =?iso-8859-1?Q?rs6bdPMzS18BBz5xhTn78wutXzKQkxJUXi9yIBpD1YZnsQtNaYvJ3BPN60?=
 =?iso-8859-1?Q?uw2ZTiIXRVQ50yO3M0qLgzlJwBgbULuYUqxxVuD7fwQHcYpmzAN01P25Z3?=
 =?iso-8859-1?Q?yfVLCszKfw62UvEAZxHZZwRYTJ/O8kumJ+0NZFmukRmKCeFnMOw0p1Gq4L?=
 =?iso-8859-1?Q?GTEV1huq7wMQLYLdIoiozn+fJcalNdDyAxuyhEdKHVE70uS8YO87Ie40xJ?=
 =?iso-8859-1?Q?IM2nhl+ekdBuFGfaNCvRg7vxsFwoGYmR9SzyHgOZB8LzdCih0f87b7Pgzs?=
 =?iso-8859-1?Q?robk8xlrgCMHeYaR6J3tN545whNYPtwcoeIpX4gEnbbIHM74LEjfPT2+F7?=
 =?iso-8859-1?Q?xSyFaefj4oK+gugI5gEnB57RNLQAQgAh1+XQRYOtbDipxdzxwVY6iXtRmL?=
 =?iso-8859-1?Q?2PWfMRv5uJjXi6gxka7P+45NQDZkY2ncjKK9vg9ZVpEm69lLVsZczByair?=
 =?iso-8859-1?Q?1quui5n7p7CL4G8G1RpnL5pH1SiWjDupV1SSXKy67SKsFTIk5wlCug4mWe?=
 =?iso-8859-1?Q?cNmI/9fhSoizAu61HmIkrhR4qCpFaYM2nVwnKxtaxx2BckDRSw+9M7QrDP?=
 =?iso-8859-1?Q?i5hwjHbJwXrj8cI4tIs/GHUDkyJI7oG0RhNgVGvyCzSMfMLAg0bKJ0HFaZ?=
 =?iso-8859-1?Q?OrfWxJZmph1Ns8BeUNvoPLOV/idPLrHtbGIbsthWrWeDSevTBnVDzdiuDg?=
 =?iso-8859-1?Q?KUet5zZfO516QoBcSABJnTLpygZIkty+drREUQZpaLsg4CU5gQjgO1pP11?=
 =?iso-8859-1?Q?y40fhv4UZFo8zaFXSvBZrt7dgAqVwjsbhI4wLKr7By2ipj5rqiexSP0ENc?=
 =?iso-8859-1?Q?CMapGyju04xt2qg7k6kFkFgvRmGYkMT7U3xccJ/DxXO4H5CaVZqSu8Lxwd?=
 =?iso-8859-1?Q?G92KSNnspx7IKqUMDoypvf4PIjsKTC6Vqs4cBGiu6R6VLRV30EJXUMsmTs?=
 =?iso-8859-1?Q?+CJ3MpxJqRnLXYSm0RL79eFuQtmEbDPRW9VxW8aBY4CPWL1ePCd+bNmrka?=
 =?iso-8859-1?Q?pPxWq5uytLTqkhkN/vJLPQ/QU4W5mF0FsxcbhaWdVY4DhSoUo9cka1wKuU?=
 =?iso-8859-1?Q?fq7b3XWNPlLVzehmTuvgr3QCEKsTS8ITCzn7UjIrR89H7FIco+v17XZ8AD?=
 =?iso-8859-1?Q?Xey6VbebPMW4MxbZfi61uhhP5qPO4SsjEoeVgO9k7Ktkoy6OiiB4a3oReE?=
 =?iso-8859-1?Q?HPUoVypm+hUxnssuP74K5QUcHz2jplzmyx8tW0bL9n9FGbaqSPX5jtuIKc?=
 =?iso-8859-1?Q?MkNgrmKMM4Mgr5YooyVyjPo7APfczCLCZSsCTf21FlsKx7OL6pzgveSpM9?=
 =?iso-8859-1?Q?batuaPF/TkQKleDYmkT8xtFWFcHKfgbyCIVR4e0jHiUqz0eRDnPgpSiVi3?=
 =?iso-8859-1?Q?BJMuV69PBXNW2NCv4wQYbvThtYofd4vDMOBksSl1EMDInloZfZgPkguqQW?=
 =?iso-8859-1?Q?wYct+OLEO9hZ9JSl4QVBJR1c/7eG7XV3q4JU8s/Przo2cyNqFbNqCcsw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8732e8c3-c60e-489f-1c23-08dbec196d5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 11:43:35.5830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 22nMETR8Q8s0pgKUpioINn41mYPDDR2BnAXkZsFWMFOsRCyVI+hYOTr7KEaBM/Wn83gfIed8ux7uCKP3itbI1Sul8iGBJRw84n9DmcI5UVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9100
X-Proofpoint-ORIG-GUID: 6GNd-SMR4AP-fR9T_fil4RWhl-hTsMmf
X-Proofpoint-GUID: 6GNd-SMR4AP-fR9T_fil4RWhl-hTsMmf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230083


Hi David,

David Woodhouse <dwmw2@infradead.org> writes:

> [[S/MIME Signed Part:Undecided]]
> On Thu, 2023-11-23 at 09:28 +0000, Paul Durrant wrote:
>> On 23/11/2023 00:07, Volodymyr Babchuk wrote:
>> >=20
>> > Hi,
>> >=20
>> > Volodymyr Babchuk <volodymyr_babchuk@epam.com> writes:
>> >=20
>> > > Hi Stefano,
>> > >=20
>> > > Stefano Stabellini <sstabellini@kernel.org> writes:
>> > >=20
>> > > > On Wed, 22 Nov 2023, David Woodhouse wrote:
>> > > > > On Wed, 2023-11-22 at 15:09 -0800, Stefano Stabellini wrote:
>> > > > > > On Wed, 22 Nov 2023, David Woodhouse wrote:
>> > > > > > > On Wed, 2023-11-22 at 14:29 -0800, Stefano Stabellini wrote:
>> > > > > > > > On Wed, 22 Nov 2023, Paul Durrant wrote:
>> > > > > > > > > On 21/11/2023 22:10, Volodymyr Babchuk wrote:
>> > > > > > > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.=
com>
>> > > > > > > > > >=20
>> > > > > > > > > > Instead of forcing the owner to domid 0, use XS_PRESER=
VE_OWNER to
>> > > > > > > > > > inherit the owner of the directory.
>> > > > > > > > >=20
>> > > > > > > > > Ah... so that's why the previous patch is there.
>> > > > > > > > >=20
>> > > > > > > > > This is not the right way to fix it. The QEMU Xen suppor=
t is *assuming* that
>> > > > > > > > > QEMU is either running in, or emulating, dom0. In the em=
ulation case this is
>> > > > > > > > > probably fine, but the 'real Xen' case it should be usin=
g the correct domid
>> > > > > > > > > for node creation. I guess this could either be supplied=
 on the command line
>> > > > > > > > > or discerned by reading the local domain 'domid' node.
>> > > > > > > >=20
>> > > > > > > > yes, it should be passed as command line option to QEMU
>> > > > > > >=20
>> > > > > > > I'm not sure I like the idea of a command line option for so=
mething
>> > > > > > > which QEMU could discover for itself.
>> > > > > >=20
>> > > > > > That's fine too. I meant to say "yes, as far as I know the too=
lstack
>> > > > > > passes the domid to QEMU as a command line option today".
>> > > > >=20
>> > > > > The -xen-domid argument on the QEMU command line today is the *g=
uest*
>> > > > > domain ID, not the domain ID in which QEMU itself is running.
>> > > > >=20
>> > > > > Or were you thinking of something different?
>> > > >=20
>> > > > Ops, you are right and I understand your comment better now. The b=
ackend
>> > > > domid is not on the command line but it should be discoverable (on
>> > > > xenstore if I remember right).
>> > >=20
>> > > Yes, it is just "~/domid". I'll add a function that reads it.
>> >=20
>> > Just a quick question to QEMU folks: is it better to add a global
>> > variable where we will store own Domain ID or it will be okay to read
>> > domid from Xenstore every time we need it?
>> >=20
>> > If global variable variant is better, what is proffered place to defin=
e
>> > this variable? system/globals.c ?
>> >=20
>>=20
>> Actually... is it possible for QEMU just to use a relative path for the=
=20
>> backend nodes? That way it won't need to know it's own domid, will it?
>
> That covers some of the use cases, but it may also need to know its own
> domid for other purposes. Including writing the *absolute* path of the
> backend, to a frontend node?

Is this case possible? As I understand, QEMU writes frontend nodes only
when it emulates Xen, otherwise this done by Xen toolstack. And in case
of Xen emulation, QEMU always assumes role of Domain-0.

--=20
WBR, Volodymyr=

