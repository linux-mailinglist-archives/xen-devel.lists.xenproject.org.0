Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A2B3D118E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 16:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159401.293217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6DOs-00018I-1S; Wed, 21 Jul 2021 14:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159401.293217; Wed, 21 Jul 2021 14:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6DOr-000168-UJ; Wed, 21 Jul 2021 14:40:41 +0000
Received: by outflank-mailman (input) for mailman id 159401;
 Wed, 21 Jul 2021 14:40:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVq+=MN=epam.com=prvs=7836cd435a=oleksii_moisieiev@srs-us1.protection.inumbo.net>)
 id 1m6DOp-000161-MX
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 14:40:39 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28164da9-51de-4019-8145-c39e5a7e4d01;
 Wed, 21 Jul 2021 14:40:37 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LEVjii024686; Wed, 21 Jul 2021 14:40:36 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 39xnbb81yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 14:40:33 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB6942.eurprd03.prod.outlook.com (2603:10a6:102:e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 14:40:30 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::1c8:a432:8446:ee8c]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::1c8:a432:8446:ee8c%8]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 14:40:30 +0000
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
X-Inumbo-ID: 28164da9-51de-4019-8145-c39e5a7e4d01
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oP796EEy9T/9JbIESt31MHWR19ftTD/AOyFXsA3xAMkRruuUONNsS0dCZ5119Yjq0lsThpoGf99Dd0PFjSEIkqB+fSjg2Wjr0fU8m8x131PYc5s3Vs4hhrLyG3HIavh9tu8+ZCtXRFXfxaq38Gcb86nx3O7LxurlozTHufb46t66JAAucp6g8EL3qB81z2gGxausjEFF8wWYDSmCRmJPSdjTywJ5BISeYTTes4/mWEEz7AtKaXXVZGqCaqAnwhwPoriYzXrpvV4SoPIBn8iTMi820IgXQd28jQzCKyV2Z/JbFjwAXsKKrJLwmcgRugTDm9pE9neIUCf8Ci/Yt9DSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysKhj7G1Qffb8zJBTxVn9L+4oC1dxhsRi9f5Q0kfAP8=;
 b=XIkvOBEYe6FAOc5DiEZAiWY9kBNNx8hEdd29oi4nLU+IzRNys1vW1d7xVkCj9Px+OVxleD57CV3Bfs+C7JIVULxapJ0/j6gwjLLjSkPWSVpZ5erZDHXhIsxxw9FzDgr4F8siqxQNbl3j1LBIm8d6ajcnp8aB/K6M5TItMqi4+sAlfGvm2bEocOJsQn56Iym0Jq9mpMGsiJtAXErq5wY+S0IuuerPOn2S1MhgNHWm97r9k5Sx7pktrdgjFrSyXmFYMgrpbtTynbJGBdh/TONYXkRK67TJrYXfcUFSY/3MX5eHZTA+fhlwlxv76RD1Csoy5/lfw/afWyLCTjW+G18k4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysKhj7G1Qffb8zJBTxVn9L+4oC1dxhsRi9f5Q0kfAP8=;
 b=6VGIAA5lZtAB71YOK3E5c8MaBM5rV98ztwTkL2vuebzmIN/HpG0KyG6t8E1TQ15Jm30pRNHDPht7C/i0pxdMVJpXPKA41yCEsXg7khM8qvjJqMrTNGz6PmVUXt19doPfzOcgdm2JxTup7C6ihdizYPR8sAW8+fFY0J/54cKQj9uad8BAxQ04CNJPhWbBPBCTIudSwxMAZyetmdHqzOfSriIP+Ig1CJ7vU+X/it36ECbwjsiBjSrwbx4CIgPGoOYLRBBbqHi+Ryf1v0TeIN2TpZCnOzUN44HfTZ0feP8L4+19rjQJAo97GWHLJZ17zRwzcODqLj5+ESwgnb1HFSCzBA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrii Anisov <Andrii_Anisov@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re:[arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS in
 kernel config
Thread-Topic: Re:[arm] Dom0 hangs after enable KROBE_EVENTS and/or
 UPROBE_EVENTS in kernel config
Thread-Index: AQHXfga6kF2DIDySdk2Twa4+MGYJE6tNKWWUgAAlvH6AABguAIAAAJXm
Date: Wed, 21 Jul 2021 14:40:30 +0000
Message-ID: 
 <PA4PR03MB7136452DF9961BC283718F4BE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
References: 
 <PA4PR03MB7136DEB7183936907DFE145AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB713685E6A8004ED13814B05AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB71367B7662A1D3E4E234F6C0E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>,<a02d4291-e48e-28cc-52da-6b9c998b2d0a@xen.org>
In-Reply-To: <a02d4291-e48e-28cc-52da-6b9c998b2d0a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71575808-1af5-4844-8c03-08d94c557ce7
x-ms-traffictypediagnostic: PA4PR03MB6942:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PA4PR03MB6942638B59392F2C1A69DFA3E3E39@PA4PR03MB6942.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +s2Sado8EB7IUeAxDCPLzNZWz9YFFTV9ngNdQEj+HKE0TTDkQ2qs0CwCwzkaBxCEYXs2jc7ZCFXaOHaBWZ8QREOmvh9w3jlS2B5l2CUqWQr/PvjquDzWWAcfRNqvgE49XollUuMjfkwfJDnMnrBsxfDH/M/8nIVojnm3cqUbg4/HG4zhvkwKWDYsHsjetlye1BZrF9s6Gvdl2xuzvWSO1mhpdujUF9piuZWg66jGA348Ev8aKyrHOc42LW0xIGAUbzQvwCi2aXK43tmHM4n29kJX02nLXateannds/CzYjJDThmxu/h5AwetqYsrX8cO3fQPfURLw3JKVeDO1PKI4n9KH4AwpktafL3QOpq8GPL1ATdR86dH4Oud1kX2HsSUClXM+5tQQhS925aN4wqwz78VKFqZtfkuj0wOMoNmQa7fhSiZL8uBKDbYgV7s6G9/6TPPuQysexCgIqcCvyBGWKYjhbPLviOTP8cRFIQqql3aAXQnveXFyKE+6G/m1MlAkU264RnWnWBj451n5uDx1ZKaXOGL21eXEJqdDuX6O1Em5EAMKnZWNbzTpn+ufSXlzOisPl4oPeJWYA9amxbRSS/7FDXUfJUH7aeU8NVQLlyFqBi1vYG9xCcRYQLMfaSEVff4s4Ju1vNZcb4TjIPPoiynNOBvrijd+z07pTasDxm0oNdLOckni+Jq/CMvupkAeRLOwYcipUtke3lfTdKjgvuxgFfxqZ7XQB4Hon0yV3ZsHVDEjHnsrANVxU0BfdgFfhUKcq9R7oFmbamdSP9QFk0gV/fYPizLkdFLp7U57mf7TECtVFCYaoov2EyMoP2/7PnoLlS0OEWr/BOdILSg2JkiCq8LfWEgQzZIfD7DXp8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39850400004)(366004)(396003)(4326008)(2906002)(86362001)(8676002)(19627405001)(33656002)(966005)(71200400001)(66476007)(66946007)(26005)(64756008)(83380400001)(76116006)(8936002)(166002)(52536014)(5660300002)(186003)(66556008)(66446008)(316002)(55016002)(18265965003)(478600001)(9686003)(6506007)(55236004)(7696005)(122000001)(38100700002)(54906003)(110136005)(53546011)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?R7ESAKGY0TMdhfoe6AM8dZ20SaSCJ4byxC3u7C0nshZ/mx/V1yeB0dFr8S?=
 =?iso-8859-1?Q?LZrEIXT89RaWNVulkYjjcRjgCGdzKAoTpDE7fW9O0aeKrryko3bgoN5Q6m?=
 =?iso-8859-1?Q?uJoSWE18QuoTYtR1RHp3sv8nouu55WqiA8qLmhjSOxsb908sefbLCoWCar?=
 =?iso-8859-1?Q?2HDXXooRe3JHpKDv/0YFdTCXKJe5s85ITIDW9zOUbZBiFQzpyC7GdZVhSH?=
 =?iso-8859-1?Q?4+bnsjQVTh42iamAfu2C/AC+Ux8IQGjzzj+K4zApJ9KvxpYbRXkkSJ3Sju?=
 =?iso-8859-1?Q?loBJoxvZjgXnX3W3cXfjm54k68bhl9m2oEwcn/PpYljHaiWhP5HbZAx0K8?=
 =?iso-8859-1?Q?V9uaiJ92cZVnwL9WF/6+GRyNtzhcfLIj/YBTW6IoPtITBIetkTTuXO0GUi?=
 =?iso-8859-1?Q?39Mjo9DCtj5m1ZzuvoboVFtDCqdsJSWkqi6xB/z3SLlCTskSp1/kUJ7jxN?=
 =?iso-8859-1?Q?hoJTLQT1yRa4VDznpKeu10KEGrxBjQkvfaqZBZAeZqjFM0D0Kb0YF+UmCC?=
 =?iso-8859-1?Q?+fd7tvkbs+BeYARew3aM246tWq9CNwvS/9/uBOkvE7h6MczN5NEsEqbrwW?=
 =?iso-8859-1?Q?YC/cEewnJvmr2cC0PyusdXUxcqtj1egajrpC/csJudDxQoearKWtqRDzHF?=
 =?iso-8859-1?Q?4Ndr4VL+mgaxFL6Yyi7oL58OS5HSw3Ae6P/h2uAADI9qJA8QLwkCkA83xD?=
 =?iso-8859-1?Q?+8BxCgWkvsjA7hIxzlqhj3pfAirpfBnO3vt4tKBCKu13gnh6xaOHht36vr?=
 =?iso-8859-1?Q?HklZ0oSQdd7Zxrmg9R0fyEX7UdxYDqByp1u5JOt1gmmHr91pJSiefuOu3+?=
 =?iso-8859-1?Q?1woZKIPQ/jFWZdLoDy77xySvnQ5LdjpVmFBTMAMrVobL+7AUDYRoU3TKIN?=
 =?iso-8859-1?Q?c/pd/To7e8Sai8lrrvRH09IwPtcLg++LbfAcgTt1OZA2nDi6mebXm7MUF/?=
 =?iso-8859-1?Q?IFnH3uAo0BJsd1WTm14xia4W+zuWftXmZoKss5oEr9so5SxLQ2U15oxetb?=
 =?iso-8859-1?Q?9/wqWygMf+oASqTQW2VTrGMY86uIuepw/jIgtpuw4YYwUR6iHflMYQNB0O?=
 =?iso-8859-1?Q?/qrckcsLELkksEUznMuqngw81p9PeEWCJxxnEeK6tmJ2B8jePDrMPKn7EH?=
 =?iso-8859-1?Q?111PBGuhK+If5RUGTNMtYgM++7Jylp19Y1PmSYAAzQcpC1qbAvlOQtIFjU?=
 =?iso-8859-1?Q?sWS2GVPb9S6tVrbbJ5rGIXFrLhrZDCTiVC2tEvnaDH1hP6iFPWzSKw+f7M?=
 =?iso-8859-1?Q?Tn4JtvihK53xSgwu21gI7zFfQxqF8I5Fd34MtFzaDNlSu6WyqP5iZPrD84?=
 =?iso-8859-1?Q?K5tBuydVNMB4VV2PSVgUOvV7OkVIaSgv6glHTw3RJ9s8pSA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PA4PR03MB7136452DF9961BC283718F4BE3E39PA4PR03MB7136eurp_"
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71575808-1af5-4844-8c03-08d94c557ce7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 14:40:30.0568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4YyBCPmac3GhIGG03qKLQTN5BdiL7JxxrZ1rrj/4cWOz8ER1U3nPMx4rMH+CL/cw8TJgNvz1KvDDbMlP4k57e/1zKNeLKTNTifxHsAK3QGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6942
X-Proofpoint-GUID: VpECZKQxRgHZg4LTktGltPEF2u46ohdN
X-Proofpoint-ORIG-GUID: VpECZKQxRgHZg4LTktGltPEF2u46ohdN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-21_09:2021-07-21,2021-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107210084

--_000_PA4PR03MB7136452DF9961BC283718F4BE3E39PA4PR03MB7136eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Julien,

Thank you for the quick response.
Please answers below.

________________________________
From: Julien Grall <julien@xen.org>
Sent: Wednesday, July 21, 2021 4:09 PM
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>; xen-devel@lists.xenproj=
ect.org <xen-devel@lists.xenproject.org>
Cc: Andrii Anisov <Andrii_Anisov@epam.com>; Stefano Stabellini <sstabellini=
@kernel.org>
Subject: Re: Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS in k=
ernel config

>(+ Stefano)

>On 21/07/2021 12:44, Oleksii Moisieiev wrote:
>> Hello,

>Hi,

>Thanks for the report.

>I nearly miss this e-mail because the title doesn't suggest this is an
>Arm and I wasn't CCed. In future, would you be able to CC the Arm
>maintainers (you can find them in MAINTAINERS) and mention arm in the titl=
e?

I'm sorry for inconvenience, fixed topic and added arm maintainers to CC.

>> I've got a problem that Dom0 hangs without any output from kernel once I
>> enable CONFIG_KPROBE_EVENTS and/or CONFIG_UPROBE_EVENTS in dom0 kernel.
>> Everything works fine when kprobe/uprobe events are disabled.

>By disabled, do you mean compile out?

Yes. Just changed .config lines:
CONFIG_KPROBE_EVENTS=3Dy
CONFIG_UPROBE_EVENTS=3Dy
to
#CONFIG_KPROBE_EVENTS is not set
#CONFIG_UPROBE_EVENTS is not set
and recompiled kernel.

>>
>> My setup:
>> Board: H3ULCB Kinfisher board
>> Xen: revision dba774896f7dd74773c14d537643b7d7477fefcd (stable-4.15)
>> https://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!!G=
F_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks=
6cbo7Ri$ [github[.]com]
>> <https://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!!=
GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIak=
s6cbo7Ri$ [github[.]com]>;
>> Kernel: revision 09162bc32c880a791c6c0668ce0745cf7958f576 (v5.10-rc4)

>Hmmm... 5.10 was released a few months ago and there are probably a few
>stable release for the version. Can you try the latest 5.10 stable?

Switched to tag v5.10 rev: 2c85ebc57b3e of https://github.com/torvalds/linu=
x.git
and got the same problem, that I see no output from kernel. All tests were =
done with earlycon parameter set in the kernel cmdline.

>>
>> https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF=
_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks2=
9w69MC$ [github[.]com]
>> <https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!G=
F_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks=
29w69MC$ [github[.]com]>;
>>
>> kernel config: see attached;
>>
>> dtb: see attached;

>Please avoid large attachment as they will be duplicated on every
>mailbox. Instead, in the future, please upload them somewhere (your own
>webserve, pastebin...) and provide a link in the e-mail.

I'm sorry for that.

>>
>>
>> If kprobe/uprobe events are enabled - I see no output after xen switched
>> input to Dom0, if disabled - system boots up successfully.
>The console subsystem tends to be enabled quite late in the boot
>process. So this may mean a panic during early boot.

>If you haven't done yet, I would suggest to add earlycon=3Dxenboot on the
>dom0 command line. This will print some messages during early boot.
>ing.

All tests were done with earlycon parameter set in the kernel command line =
(xen, dom0-bootargs).

>>
>> Both configs work fine when I boot without xen.
>>
>>
>> Dom0 information from Xen console shows that only one CPU works, and PC
>> stays in "__arch_counter_get_cntvct" function on read_sysreg call. //
>>
>> I did further investigation and found that kernel 5.4 doesn't have such
>> kind of issues.
>> After bisecting kernel,between 5.10 and 5.4, I found that output
>> disappeared on commit:
>>
>> 76085aff29f585139a37a10ea0a7daa63f70872c

> From the information you provided so far, I am a bit confused how this
>could be the source of the problem. But given this is not the latest
>5.10, I will wait for you to confirm the bug is still present before
>providing more input.

I was confused with this commit either. As I mentioned above, I've checked =
with the latest stable 5.10 kernel and still got the same problem.

>>
>>
>> Another issue, which was revealed after I got kernel output was kernel
>> oops with message that CPU is in inconsistent state.
>>
>> [0.415612] EFI services will not be available.
>>
>> [0.420267] smp: Bringing up secondary CPUs ...
>>
>> [0.425185] Detected PIPT I-cache on CPU1
>>
>> [0.425267] Xen: initializing cpu1
>>
>> [0.425292] CPU1: Booted secondary processor 0x0000000001 [0x411fd073]
>>
>> [0.425815] Detected PIPT I-cache on CPU2
>>
>> [0.425879] Xen: initializing cpu2
>>
>> [0.425899] CPU2: Booted secondary processor 0x0000000002 [0x411fd073]
>>
>> [0.426362] Detected PIPT I-cache on CPU3
>>
>> [0.426425] Xen: initializing cpu3
>>
>> [0.426444] CPU3: Booted secondary processor 0x0000000003 [0x411fd073]
>>
>> [0.426537] smp: Brought up 1 node, 4 CPUs
>>
>> [0.472807] SMP: Total of 4 processors activated.
>>
>> [0.477551] CPU features: detected: 32-bit EL0 Support
>>
>> [0.482745] CPU features: detected: CRC32 instructions
>>
>> [0.499470] ------------[ cut here ]------------
>>
>> [0.504034] CPU: CPUs started in inconsistent modes

>Looking at Linux 5.7 code, this is printed when not all the CPUs are
>booted in the same mode (i.e. EL1 or EL2).

>This is quite odd. So let me ask a question first, did you see this
>error during the bisection or on the latest 5.7?

Switched to kernel v5.7 tag, rev:3d77e6a8804.
On 5.7 kernel I can see printk output, but getting CPUs started in inconsis=
tent modes error.
Also, I tried with hmp-unsafe=3Dfalse ( in xen cmdline, so only 0-3 CPU wer=
e enabled. And still got the same issue.


>Cheers,

>--
>Julien Grall

--_000_PA4PR03MB7136452DF9961BC283718F4BE3E39PA4PR03MB7136eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello&nbsp;Julien,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you for the quick&nbsp;response.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Please answers&nbsp;below.</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Julien Grall &lt;juli=
en@xen.org&gt;<br>
<b>Sent:</b> Wednesday, July 21, 2021 4:09 PM<br>
<b>To:</b> Oleksii Moisieiev &lt;Oleksii_Moisieiev@epam.com&gt;; xen-devel@=
lists.xenproject.org &lt;xen-devel@lists.xenproject.org&gt;<br>
<b>Cc:</b> Andrii Anisov &lt;Andrii_Anisov@epam.com&gt;; Stefano Stabellini=
 &lt;sstabellini@kernel.org&gt;<br>
<b>Subject:</b> Re: Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVEN=
TS in kernel config</font>
<div>&nbsp;</div>
</div>
<div><font size=3D"2">
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;(+ Stefano)<br>
<br>
&gt;On 21/07/2021 12:44, Oleksii Moisieiev wrote:<br>
&gt;&gt; Hello,<br>
<br>
&gt;Hi,<br>
<br>
&gt;Thanks for the report.<br>
<br>
&gt;I nearly miss this e-mail because the title doesn't suggest this is an =
<br>
&gt;Arm and I wasn't CCed. In future, would you be able to CC the Arm <br>
&gt;maintainers (you can find them in MAINTAINERS) and mention arm in the t=
itle?<br>
<br>
I'm sorry for inconvenience, fixed topic and added arm maintainers to CC.<b=
r>
<br>
&gt;&gt; I've got a problem that Dom0 hangs without any output from kernel =
once I <br>
&gt;&gt; enable CONFIG_KPROBE_EVENTS and/or CONFIG_UPROBE_EVENTS in dom0 ke=
rnel.<br>
&gt;&gt; Everything works fine when kprobe/uprobe events are disabled.<br>
<br>
&gt;By disabled, do you mean compile out?<br>
<br>
Yes. Just changed .config lines:</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">CONFIG_KPROBE_EVENTS=3D=
y</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">CONFIG_UPROBE_EVENTS=3D=
y</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">to</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;"><span class=3D"PlainTex=
t" style=3D"margin:0px;caret-color:rgb(0, 0, 0)">#CONFIG_KPROBE_EVENTS is n=
ot set</span><br>
<span class=3D"PlainText" style=3D"margin:0px;caret-color:rgb(0, 0, 0)">#CO=
NFIG_UPROBE_EVENTS is not set</span></div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">and recompiled kernel.<=
/div>
</font>
<div><font size=3D"2"><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; My setup:</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; Board: H3ULCB Kinfisher board</sp=
an><br>
<span style=3D"font-size: 11pt;">&gt;&gt; Xen: revision dba774896f7dd74773c=
14d537643b7d7477fefcd (stable-4.15)
</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><a href=3D"https://urldefe=
nse.com/v3/__https://github.com/xen-project/xen.git__;!!GF_29dbcQIUBPA!m4NH=
C2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks6cbo7Ri$" style=3D=
"font-size: 11pt;">https://urldefense.com/v3/__https://github.com/xen-proje=
ct/xen.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8=
E8JBp8Qri3haIaks6cbo7Ri$</a><span style=3D"font-size: 11pt;">
 [github[.]com] </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; &lt;<a href=3D""></a>https://urld=
efense.com/v3/__https://github.com/xen-project/xen.git__;!!GF_29dbcQIUBPA!m=
4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks6cbo7Ri$ [githu=
b[.]com]&gt;;</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; Kernel: revision 09162bc32c880a79=
1c6c0668ce0745cf7958f576&nbsp;(v5.10-rc4)</span><br>
<br>
<span style=3D"font-size: 11pt;">&gt;Hmmm... 5.10 was released a few months=
 ago and there are probably a few
</span><br>
<span style=3D"font-size: 11pt;">&gt;stable release for the version. Can yo=
u try the latest 5.10 stable?</span><br>
<br>
<span style=3D"font-size: 11pt;">Switched to tag v5.10 rev:&nbsp;</span></f=
ont><font face=3D"Calibri, Arial, Helvetica, sans-serif" size=3D"3">2c85ebc=
57b3e of&nbsp;</font><span style=3D"color: rgb(0, 0, 0); font-family: Calib=
ri, Arial, Helvetica, sans-serif; font-size: 12pt;">https://github.com/torv=
alds/linux.git</span><font face=3D"Calibri, Arial, Helvetica, sans-serif" s=
ize=3D"3"><br>
</font><font size=3D"2"><span style=3D"">and got the same problem, that I s=
ee no output from kernel. All tests were done with earlycon parameter set i=
n the kernel cmdline.</span></font><br>
<font size=3D"2"><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><a href=3D"https://urldefe=
nse.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!m4NHC=
2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks29w69MC$" style=3D"=
font-size: 11pt;">https://urldefense.com/v3/__https://github.com/torvalds/l=
inux.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8=
JBp8Qri3haIaks29w69MC$</a><span style=3D"font-size: 11pt;">
 [github[.]com] </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; &lt;<a href=3D""></a>https://urld=
efense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!m4=
NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks29w69MC$ [github=
[.]com]&gt;;</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; kernel config: see attached;</spa=
n><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; dtb: see attached;</span><br>
<br>
<span style=3D"font-size: 11pt;">&gt;Please avoid large attachment as they =
will be duplicated on every
</span><br>
<span style=3D"font-size: 11pt;">&gt;mailbox. Instead, in the future, pleas=
e upload them somewhere (your own
</span><br>
<span style=3D"font-size: 11pt;">&gt;webserve, pastebin...) and provide a l=
ink in the e-mail.</span></font></div>
<div><span style=3D"font-size: 14.666666984558105px;"><br>
</span></div>
<div><span style=3D"font-size: 14.666666984558105px;">I'm sorry for that.</=
span></div>
<div><span style=3D"font-size: 14.666666984558105px;"><br>
</span><span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; If kprobe/uprobe events are enabl=
ed - I see no output after xen switched
</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; input to Dom0, if disabled - syst=
em boots up successfully.</span><br>
<span style=3D"font-size: 11pt;">&gt;The console subsystem tends to be enab=
led quite late in the boot
</span><br>
<span style=3D"font-size: 11pt;">&gt;process. So this may mean a panic duri=
ng early boot.</span><br>
<br>
<span style=3D"font-size: 11pt;">&gt;If you haven't done yet, I would sugge=
st to add earlycon=3Dxenboot on the
</span><br>
<span style=3D"font-size: 11pt;">&gt;dom0 command line. This will print som=
e messages during early boot.</span><br>
<span style=3D"font-size: 11pt;">&gt;ing.</span><br>
<br>
All tests were done with earlycon parameter set in the kernel command line =
(xen, dom0-bootargs).</div>
<div><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; Both configs work fine when I boo=
t without xen.</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; Dom0 information from Xen console=
 shows that only one CPU works, and PC
</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; stays in &quot;__arch_counter_get=
_cntvct&quot; function on read_sysreg call. //</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; I did further investigation and f=
ound that kernel 5.4 doesn't have such
</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; kind of issues.</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; After bisecting kernel,between 5.=
10 and 5.4, I found that output
</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; disappeared on commit:</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; 76085aff29f585139a37a10ea0a7daa63=
f70872c</span><br>
<br>
<span style=3D"font-size: 11pt;">&gt; From the information you provided so =
far, I am a bit confused how this
</span><br>
<span style=3D"font-size: 11pt;">&gt;could be the source of the problem. Bu=
t given this is not the latest
</span><br>
<span style=3D"font-size: 11pt;">&gt;5.10, I will wait for you to confirm t=
he bug is still present before
</span><br>
<span style=3D"font-size: 11pt;">&gt;providing more input.</span><br>
<br>
I was confused with this commit either. As I mentioned above, I've checked =
with the latest stable 5.10 kernel and still got the same problem.<br>
<br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; Another issue, which was revealed=
 after I got kernel output was kernel
</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; oops with message that CPU is in =
inconsistent state.</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.415612] EFI services will not =
be available.</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.420267] smp: Bringing up secon=
dary CPUs ...</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.425185] Detected PIPT I-cache =
on CPU1</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.425267] Xen: initializing cpu1=
</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.425292] CPU1: Booted secondary=
 processor 0x0000000001 [0x411fd073]</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.425815] Detected PIPT I-cache =
on CPU2</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.425879] Xen: initializing cpu2=
</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.425899] CPU2: Booted secondary=
 processor 0x0000000002 [0x411fd073]</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.426362] Detected PIPT I-cache =
on CPU3</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.426425] Xen: initializing cpu3=
</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.426444] CPU3: Booted secondary=
 processor 0x0000000003 [0x411fd073]</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.426537] smp: Brought up 1 node=
, 4 CPUs</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.472807] SMP: Total of 4 proces=
sors activated.</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.477551] CPU features: detected=
: 32-bit EL0 Support</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.482745] CPU features: detected=
: CRC32 instructions</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.499470] ------------[ cut here=
 ]------------</span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; </span><br>
<span style=3D"font-size: 11pt;">&gt;&gt; [0.504034] CPU: CPUs started in i=
nconsistent modes</span><br>
<br>
<span style=3D"font-size: 11pt;">&gt;Looking at Linux 5.7 code, this is pri=
nted when not all the CPUs are
</span><br>
<span style=3D"font-size: 11pt;">&gt;booted in the same mode (i.e. EL1 or E=
L2).</span><br>
<br>
<span style=3D"font-size: 11pt;">&gt;This is quite odd. So let me ask a que=
stion first, did you see this
</span><br>
<span style=3D"font-size: 11pt;">&gt;error during the bisection or on the l=
atest 5.7?</span><br>
<span style=3D"caret-color:rgb(0, 0, 0);font-family:Calibri, Arial, Helveti=
ca, sans-serif;background-color:rgb(255, 255, 255);display:inline !importan=
t"><br>
</span></div>
<div><span style=3D"caret-color:rgb(0, 0, 0);font-family:Calibri, Arial, He=
lvetica, sans-serif;background-color:rgb(255, 255, 255);display:inline !imp=
ortant">Switched to kernel v5.7 tag, rev:3d77e6a8804.</span></div>
<div><font face=3D"Calibri, Arial, Helvetica, sans-serif">On 5.7 kernel I c=
an see printk output, but getting&nbsp;<span style=3D"caret-color:rgb(0, 0,=
 0);font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&qu=
ot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot=
;Helvetica Neue&quot;, sans-serif;font-size:14.666666984558105px;background=
-color:rgb(255, 255, 255);display:inline !important">CPUs
 started in inconsistent modes error.</span></font></div>
<div><span style=3D"font-size: 14.666666984558105px;">Also, I tried with hm=
p-unsafe=3Dfalse ( in xen cmdline, so only 0-3 CPU were enabled. And still =
got the same issue.</span></div>
<div><span style=3D"font-size: 14.666666984558105px;"><br>
</span></div>
<div><span style=3D"font-size: 14.666666984558105px;"><br>
</span><span style=3D"font-size: 11pt;">&gt;Cheers,</span><br>
<br>
<span style=3D"font-size: 11pt;">&gt;-- </span><br>
<span style=3D"font-size: 11pt;">&gt;Julien Grall</span><br>
</div>
</div>
</body>
</html>

--_000_PA4PR03MB7136452DF9961BC283718F4BE3E39PA4PR03MB7136eurp_--

