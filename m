Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B92D32FDEB7
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 02:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71846.129001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Oeq-0001If-GV; Thu, 21 Jan 2021 01:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71846.129001; Thu, 21 Jan 2021 01:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Oeq-0001IG-Cz; Thu, 21 Jan 2021 01:21:08 +0000
Received: by outflank-mailman (input) for mailman id 71846;
 Thu, 21 Jan 2021 01:21:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yF5=GY=epam.com=prvs=16557ba193=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1l2Oeo-0001IB-6V
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 01:21:06 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 614a5a85-b6ac-4d10-8508-688fe6daffe7;
 Thu, 21 Jan 2021 01:21:04 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10L1GVJO009750; Thu, 21 Jan 2021 01:20:59 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 by mx0b-0039f301.pphosted.com with ESMTP id 3668rsc3mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 01:20:58 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by VI1PR0302MB3214.eurprd03.prod.outlook.com (2603:10a6:803:18::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 21 Jan
 2021 01:20:55 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539%6]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 01:20:54 +0000
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
X-Inumbo-ID: 614a5a85-b6ac-4d10-8508-688fe6daffe7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeHwMBRoZRucNJMwbNfhLkLyshCnkNLfpAR7DQ8pzydScqr7Um8IpHDeSL3+hVT5gXyE727VAkQzretMGTuehvgPmQSuSpnI3Q6GsyELu7TkW/kb7ZxXRAV4wMnSOmeSKqzCGTrBcFuWpHqvfQnU1oBM/dgDSlovEyALTx2399p+4CAifgvlEchH0HYheXoYLM0D5g1SMZKsaCDr49RPyI219ZWROf1ygH6AXJ2MWCUVSGBlTT1MyA3oYBPP+20bWw7x2kOY3NDZn7PTRQ4kqN+UOmO6H17MHPu1yZUB8pijMOP3EcVJ9m7zqHqKmDc43gCxgxo7US54dzHKzCfbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUWdYME0IjEaBsUwxHfINZmIRFil4/pLbRthi6rNoNY=;
 b=VYJ4y5xF7w+zT8gunDgVPchoJoH1ZnG2eoSg5crLrhgiSuuLaJ06nyj8ouMbYIW7sSlEKdAtsyDBNr4cNkI0rtrQ3qHbW91SOmlWDhuyb1ZsDgG78pgWJRnu1THZecK+iJH477h0YJep0tLQRgxNa2zN+wfo45MYWZ85eKE6JuYK5XrzGLqHeQXX5I9HnUIkRxeCsUn8FWtElEu8KMMoyVMdwvf+by8KtQQg02ZBavK96Us3llCw7WaJui0Bauw/gTTYJYCwI7DFlb2yf/YrpWZBPsnkHNSmP3GGFrXRzNkpgFKoBnXn4xserN0JgGy9TUNzyyQi3e+qUtLyS470hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUWdYME0IjEaBsUwxHfINZmIRFil4/pLbRthi6rNoNY=;
 b=TNepR9c8IptasYqC0PGQptlARnaByudidDCOw6ThvQKv5EO5UnI6BeuQxwIvwWt1LY70eNmwEZC7Awpht/f2tGyjAalgEiBqNouzAaSTIgmdrCOiyKp+lWOo7KhmAGlRkLgwtUpHziYOzPfYrFHjFnp/Z6YBF3A1mp4eOYY9fCsCXGIooR9X5h0xFt4JhNz9rjZde4mOt+lRgKhh2R4lQusoTbz+S6ooklPOV+eI1DOj5ulN57CkCG+zbADJlRsBBnNUP1IULIYfJ6fmSfPGAaEKyaRNYgTN17p8qG6eXbbEmljC7wgGVJepRJomW7K0WnDYi4A5XOKMaMM8q00E7w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: Stefano Stabellini <stefano.stabellini@xilinx.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <jgrall@amazon.com>,
        Dario Faggioli <dario.faggioli@suse.com>,
        "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: IRQ latency measurements in hypervisor
Thread-Topic: IRQ latency measurements in hypervisor
Thread-Index: AQHW6T1firbO0EOYpEKUiW6vsavsPaonyNIAgAXV/YCAA7YJAA==
Date: Thu, 21 Jan 2021 01:20:54 +0000
Message-ID: <87turb13wp.fsf@epam.com>
References: <87pn294szv.fsf@epam.com>
 <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
 <e9d0a07ff4dd8f1d94922f3b8e6b415bfd9ea02f.camel@suse.com>
In-Reply-To: <e9d0a07ff4dd8f1d94922f3b8e6b415bfd9ea02f.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7aa1db51-9750-461a-ca66-08d8bdaaccad
x-ms-traffictypediagnostic: VI1PR0302MB3214:
x-microsoft-antispam-prvs: 
 <VI1PR0302MB32148425DAD777AEE1C8771DE6A10@VI1PR0302MB3214.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 17lQelnw1F5pdq05TGukRTqTVbyHk/68EobsBJcegUNU39ezTXAksttFmhcyVp/sdWH4f2/s8lcoUv94gOYX1TsH4JSI/gv4Mm8q1Zndio9k6r+VuVHNlNhUlq/AXFl/tOhJnbaiATJNGby1qU5xilPZqff2DbSaPEfqeKA4o5FvtFKrPOok/cxiVdax7Jeq5VDdR3da0sScoKimAaqFUDSb+Y7Wr/Hn26wyOaEdO/YxckbfDqcV/m5kibQqIcn1qGwpt1ITruIWO+vkDL/id9fvQEgI+b/oEDZTH6A7va4hzzkRQN47Za5K5NNqx9hur3/NdoI8GFPwBNjTDTk5C1VpRSmYVVrzA/yv3fwWlu3y2BGjnxBzcCOopFMpNwK6N/GNrDrPB4BsAVKHE4HDeg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(26005)(5660300002)(6512007)(186003)(83380400001)(66556008)(478600001)(55236004)(36756003)(8676002)(64756008)(6506007)(66946007)(86362001)(6916009)(8936002)(2906002)(76116006)(71200400001)(54906003)(66476007)(4326008)(2616005)(6486002)(66446008)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?4ckz2MHncq+7c1RanqlG1oLtHOzDioB61Mlr4sD/Y66Rr2bujF/oBQwngP?=
 =?iso-8859-1?Q?S8zb6Ec4BdYxeDWKPWdldj/yIxCJ7RzXsoF7ISC1VbXsZaMdbOCq5MR4l6?=
 =?iso-8859-1?Q?achH3C419siadD++0yQqQ47Qh7X5nX2LCtkdmRIxV9LI0BM/vsecea3mKW?=
 =?iso-8859-1?Q?f1Q+a0o8kRbGe2suWou9gqGxNQG7JSjdsnJRx8TJpT2I0B1jJg0wbZUc/b?=
 =?iso-8859-1?Q?KPRPWiG0FpeKrwG/QNa/90+aDvgrg4Gx1J/BhCiidQz3NXfWt5TRYKIfDl?=
 =?iso-8859-1?Q?WgEeMPqdRf1qKS1jCCeGqRFi3vh4B8GfBPBf/zKnlbWSQkYyEa2N+dC8gy?=
 =?iso-8859-1?Q?nik8iVbKdZUfKvHFHs6bQGJS0OXel7EcxiZNGOlOcvaTfZLjFNkLFFbTuQ?=
 =?iso-8859-1?Q?cnr9oRkMOYE5NtfgVXTfoYPar+lO8NyujW3gb2Ri2/lED7/D5Z7Ef0itbb?=
 =?iso-8859-1?Q?ERJnxGv4JvIrid3CJEcBL/Y/OHhSKBbxlpu8TbzK/vHcjBfFWxVB7OAikH?=
 =?iso-8859-1?Q?cGfOjSdTAOL7aICSoaeGwxi5+cYRNAaWHNQ8/1X+RBJ64TtK8WAb3LSaTS?=
 =?iso-8859-1?Q?iZRGyr9FJzbV85LcCPujEJGwuGIv7iwrWqcFvrarnUDWsmKCwEKgeUS51L?=
 =?iso-8859-1?Q?ZWKY5v7Z1k6Es/4cbUJxbLWyXZfVE1xprXzwdzuoO7lH43kblnWsVQU9kV?=
 =?iso-8859-1?Q?82oan7lM0zB0miiNBGin9HE+YgWyn5X+lDiukPpI9ODfoinxbt0mEBdMZG?=
 =?iso-8859-1?Q?3S+mykTG+rB72pE9txO8hwBbw5jrmblOG3vmVat+Ti4KOsnJOHXrV8IzQW?=
 =?iso-8859-1?Q?KRei+hULYSkLBagTMFurmZ5F9JzVJjFoFExik1wcDgc37s0Wb61KxbxXss?=
 =?iso-8859-1?Q?S+IIEHBmMOXR9VQLl0kGE3v0KZd4VuBIan1UAh4Ta/HsjLqDeo8VCQBVJ0?=
 =?iso-8859-1?Q?TfsG9gULBjGdHXzKMEXbswfqhkingo5glYFKKn6eue5t+n53L+Y8AaqiMq?=
 =?iso-8859-1?Q?VkUlWquDFv+eq0/k7P9HEtaOT/1Y4whqlUI37J?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa1db51-9750-461a-ca66-08d8bdaaccad
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 01:20:54.7767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EkVT//rmcNB35TWIEWsd0Mc/99/0DnfJ3X4icmdOdyMlqnETHKv/wr7p7vkYteXk8Omo1HX5uGI+iodTvDG+KS2cQA2ZRZSIBcx5nP9fKXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3214
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210003


Hi Dario,

Dario Faggioli writes:

> On Thu, 2021-01-14 at 15:33 -0800, Stefano Stabellini wrote:
>> On Tue, 12 Jan 2021, Volodymyr Babchuk wrote:
>> > 2. RTDS scheduler. With console disabled, things like "hexdump -v
>> >    /dev/zero" didn't affected the latency so badly, but anyways,
>> >    sometimes I got ~600us spikes. This is not a surprise, because
>> > of
>> >    default RTDS configuration. I changed period for DomU from
>> > default
>> >    10ms to 100us and things got better: with Dom0 burning CPU I am
>> >    rarely getting max latency of about ~30us with mean latency of
>> > ~9us
>> >    and deviation of ~0.5us. On other hand, when I tried to set
>> > period
>> >    to 30us, max latency rose up to ~60us.
>>=20
>> This is very interestingi too. Did you get any spikes with the period
>> set to 100us? It would be fantastic if there were none.
>>=20
> This *probably* makes some sense. Where the *probably* comes from the
> fact that all the following reasoning assumes that what I recall about
> real-time scheduling theory is correct, on which I would not bet.
>
> Perhaps Stefano can ask to my good old friend Marko Bertogna, from the
> Univeristy of Modena, as they're collaborating on cache-coloring, what
> he his team think. He was already much better than me with this things,
> back in the days of the Ph.D... So for sure he's much better than me
> know! :-)
>
> Anyway, as I was saying, having a latency which is ~ 2x of your period
> is ok, and it should be expected (when you size the period). In fact,
> let's say that your budget is Xus, and your period is 30us. This means
> that you get to execute for Xus every 30us. So, basically, at time t0
> you are given a budget of Xus and you are guaranteed to be able to use
> it all within time t1=3Dt0+30us. At that time (t1=3Dt0+30us) you are give=
n
> another Xus amount of budget, and you are guaranteed to be able to use
> it all within t2=3Dt1+30us=3Dt0+60us.

Well, I'm not sure if I got you right. Are you saying that unused budget
is preserved?

If I understood it correct, any unused budget is lost. So, basically
RDTS guarantees that your vcpu will able to run Xus in total every Yus,
where X is the budget and Y is the period. Also, it does not guarantee
that vCPU will be scheduled right away, so for period of 100us and
budget of 30us it will be perfectly fine to have latency of 70+us:

If at t=3D0 new period begins and in the same time IRQ fires, but RDTS
decides to run another task, it is possible that your vCPU will be
scheduled at only t=3D70us.

> Now, with a period as small as 30us, your budget is also going to be
> pretty small (how much was that? If it was in your mail, I must have
> missed it). Are you sure that the vCPU is able to wake up and run until
> the point that your driver has done all the latency measurement in
> _just_one_ instance (i.e., all this takes less than the budget)?.

> In fact, lat's say your budget is 10us, and it the vCPU needs 15us for
> waking up and doing the measurements. At time t0 the vCPU is scheduler,
> and let's say that the latency at that time is exactly 0. The vCPU
> start to run but, at time t0+10us (where 10us is the budget) it is
> stopped. at time t1=3Dt0+30us, the vCPU receives a budget replenishment
> but that does not mean that it will start to run immediately, if the
> system is busy.
>
> In fact, what RTDS guarantees is that the vCPU will be able to execute
> for 10us within time t2=3Dt1+30us. So, in theory, it can start to run as
> far as t2-10us, without violating any guarantee.
>
> If that is, in fact, what happens, i.e., the vCPU starts to run only at
> t2-10us, and it is only then that it manages to finish computing and
> recording the latency (after running for 5us more, as we said it takes
> 15us).
>
> What it will therefore record would be a latency to t2-5us, which in
> fact is:
>
>   t1 + 30us - 5us =3D t0 + 30us + 30us - 5us =3D
> =3D 0 + 60us - 5us =3D 55us ~=3D 60us
>
> So... May this be the case?

Yes, probably this is the issue. I used budget of 15us in this
case. But, taking into account that minimal observed latency is 3us and
typical is ~10us, it is quite possible that budget will be emptied
before IRQ handler will have a chance to complete.

It would be great to have priorities in RTDS, so more critical task can
preempt less critical one. I believe, I have seen corresponding patches
somewhere...

--=20
Volodymyr Babchuk at EPAM=

