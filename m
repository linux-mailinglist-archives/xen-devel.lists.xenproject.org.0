Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB93D24DD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 15:50:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159752.293770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Z56-0006ea-Qv; Thu, 22 Jul 2021 13:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159752.293770; Thu, 22 Jul 2021 13:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Z56-0006ba-LZ; Thu, 22 Jul 2021 13:49:44 +0000
Received: by outflank-mailman (input) for mailman id 159752;
 Thu, 22 Jul 2021 13:49:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4XTk=MO=epam.com=prvs=7837d5b24f=oleksii_moisieiev@srs-us1.protection.inumbo.net>)
 id 1m6Z54-0006bU-Tj
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 13:49:43 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9549046-eaf3-11eb-8fe9-12813bfff9fa;
 Thu, 22 Jul 2021 13:49:40 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16MDlM4Y002280; Thu, 22 Jul 2021 13:49:39 GMT
Received: from fra01-mr2-obe.outbound.protection.outlook.com
 (mail-mr2fra01lp0106.outbound.protection.outlook.com [104.47.25.106])
 by mx0b-0039f301.pphosted.com with ESMTP id 39y9v6r0f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 13:49:38 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PR2PR03MB5449.eurprd03.prod.outlook.com (2603:10a6:101:18::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Thu, 22 Jul
 2021 13:49:35 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::1c8:a432:8446:ee8c]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::1c8:a432:8446:ee8c%8]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 13:49:35 +0000
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
X-Inumbo-ID: a9549046-eaf3-11eb-8fe9-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OijlUTdITYx2pxPu6CInatp2I6um/B5Q7VJ07ReAbNCbHBBVytkI6Bz2xlk0jRRO1T2FoXy2yP/YGM6WuFxVXHWoDbPfPv6pSkajN+YIfDwGQSyxhfAfHSb/LBze1bD/Mf156CKVB7/khX2fJnUwqewNZG1toXrv/HgQos//y9WEAuDblY8Ac8jIVS5veNplY0zvXfC9Nj2/UAnn12n+WKB7MAOB6J5VXSS3MW/pEQayxW4rjp6S4DXJh5ZJYD7MNjhyXOUYyH5icB2NR+n4gsEwPtAR2AISaX905dTL9JItF+EIbDyXpDfCvzi+4//7VsFm29iviGfQx55FAuUPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+agHEIlwZbHm70PGXM7ln7UnNK/AIUx+d5IuIsJP9w=;
 b=VxViozB5TRlo8SYAbS8mKou2p8mT/LjaSrUt5mhueLPmsaTwOrq8B2xCBkoFY1OsmeME4BCzFcCb2oxud62s9SMAVwP2NsN92tKFQtGuY8dyztdOU+1rTC7Q8FSgkWNUlpBjUawwrIfm3SDQ91UXcUc6kp5P/hnmtaUWGWe7J52EBPwRBovfKl+NH53DXhcuoYdamoDjj67gm720GzYP1YQsiHbkysfSzmn2ipeguUhrpajVFLHG2uLA4jprWYV01zfpiThx6OJ+I61n7H/KH7/MGuJzS21v4w29eflTXM3LzQy7VvF3SXL+ZSkbiv6zXa58C01lITmF3YRLv8rlNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+agHEIlwZbHm70PGXM7ln7UnNK/AIUx+d5IuIsJP9w=;
 b=6iqK1jFMWfgyNdFdbfmKtJ4QB00tEFuaKrNm5gGGsaaB1X6GVrogAMzecR67BqaqO3ouF3BnpdTXh7d9QMaObp+buSYgB1T/+BikW13+51Z+9JBNeI5Gp+GHSAMn+k/03rWDoWW94n/mUJhfcE8N6Cflrrp2c+f9WDbS8dNKdrbclK1kr4iiBE0hOqIvAr4HMObdx3Hrj8aYvd4I5LZmTIoqPalgcPmMSObYiPdTeEK5CJFFcoE83mqidSPRhLgpttCdnXpFmjuXEQcVssb4HZRJOrcI+x8gzGkBLGN60GCJurjPsn11wmbAZAJoQM9B2hx7STfpeFVv1kqIReX5dQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Andrii
 Anisov <Andrii_Anisov@epam.com>
Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS
 in kernel config
Thread-Topic: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS
 in kernel config
Thread-Index: AQHXfk7sayRbwafWg0WziHoeeCAd5atNqbDZgACX0oCAAHofAIAAQ83G
Date: Thu, 22 Jul 2021 13:49:34 +0000
Message-ID: 
 <PA4PR03MB713676499C1F10655C0ACF4AE3E49@PA4PR03MB7136.eurprd03.prod.outlook.com>
References: 
 <PA4PR03MB7136DEB7183936907DFE145AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB713685E6A8004ED13814B05AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB71367B7662A1D3E4E234F6C0E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <a02d4291-e48e-28cc-52da-6b9c998b2d0a@xen.org>
 <PA4PR03MB7136452DF9961BC283718F4BE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <8ce6f5fe-ccb6-d463-a39e-50fd82816b86@xen.org>
 <PA4PR03MB7136D3B811F820FC8A5AFF95E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <alpine.DEB.2.21.2107211850540.14204@sstabellini-ThinkPad-T480s>,<7c3453ed-181f-a166-f16c-43a33bcc529c@xen.org>
In-Reply-To: <7c3453ed-181f-a166-f16c-43a33bcc529c@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9120ba3c-a790-4dfb-e2b3-08d94d178a54
x-ms-traffictypediagnostic: PR2PR03MB5449:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PR2PR03MB5449A7D48FC164F17B39C3C0E3E49@PR2PR03MB5449.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IEN0o5cuWDcxgcv/gjp661sQgQVquwkMzLf+hucTENWxMcY2qRNSYXszvwCriDnwt7YpNiskmJLXxsaYwRdlrNL+Ln39luspBbqKW2VffrflEjngZJSLApWvz2cPwY3tMZfFoUGnVq9LSuA9IA33RKiJZyNnCMMikRNxObVew1TSuCo9zqGU00reNhb1yNtWXqjwTCGJCTxSD5I5gqzDgPMAmZ2ykhGTvUwGdQGZkFfyM0FiRGheqQU5VKwxRVkj4VGN5VSCdle593H4zOKR7ocBt2Mn3bWDybdv+yWBZvnFttmEEbMwYnqzutvB6JdxX9cuqcuSslsiCUx6vQVArAwJhnwUVd+HVlySAGKkwvFX6EDHD9jM07pL2YOSWFEwH5Ga2b5YVe72elkvZ1wDbJTlitANXgdEdBTCMML2ZcLD8muAGIW7sN72MYXxXI/djzsQQ9FRJicjg5NWVOOzCr4JDFClDRk64Osxy4KGEGhUqh3Xkemiw+PUjnAKOfdylG+FCpOaxkEsfEtk26oLCnW+dwsP8EDpWUGCWu1oOAxwcgCCvHVdCe4IiE9NOi59meULQITjPUU+4eMvNR35SjE4HRqVf4xaHoColpa5r6CS2UfcPIFfsIF8ulXN/n7Ba/RvORFJ9awuX89aa23ZPjkZ3o+t4vYfitz2/sxRqpH6R5wJOZ7nMAa3Rqav5lxhMqWWEXIxJ2HrktYO86hnBGa81e6grSI/QWUvbqzI1MP7NjENo6zV+FKl4FWIymTuyIqhNSEQkoSl4NW1TtYZWCcSJOJyKWS1Xr/9613ZDEsXTcoWCrUTz4jnNGzVMoQSmpHwk6uC9aoKiV7Wcn5NgWBL9K+U3A89occr3sd9WkA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(33656002)(76116006)(316002)(186003)(54906003)(5660300002)(26005)(38100700002)(64756008)(66446008)(66476007)(8936002)(71200400001)(4326008)(86362001)(66556008)(52536014)(110136005)(55016002)(66946007)(2906002)(107886003)(19627405001)(83380400001)(18265965003)(8676002)(7696005)(6506007)(9686003)(53546011)(166002)(478600001)(122000001)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?c7J3TUEeBAUnm+cWeQup1vXnzLuvsRPpcabOiSNE0bs3+2XTLJhwfBVuRY?=
 =?iso-8859-1?Q?uSFqWzCFvQ01E5/D1YkPMUw9BSEioPHiwzI7OdrXLyh7sG3HOY/X48rbyz?=
 =?iso-8859-1?Q?XDE8VeZFdB0nhVobdZIObDKOPCCE1kaNakj3tME9QiTaLe6/VnAcC2dHL4?=
 =?iso-8859-1?Q?Ro0M8vjUHuS9LNqztFlKKN/Sx0HkRirdDnT3X7uPR3NQ+Z7G6jXbbIPYxI?=
 =?iso-8859-1?Q?3+JRAeWtRoo9xy8RtHfGIyDTEBHMaBbKoVUELYFhPp5m+6QP5XbLVXkPk4?=
 =?iso-8859-1?Q?IEeRUS+l8UP6iYMK4Bg0pUcHx2k4h+hUaSRJwko9CSTa9LWjiucKOQ9xac?=
 =?iso-8859-1?Q?yjj/7M2PLxobL0z03hpQAiYcEb96hLXlKxy3drNXcN5lCLO8jgeRpzkuSJ?=
 =?iso-8859-1?Q?hwemW+nzDzSylFGoaExrXqkoV3Iy9irMdUXWJHcYqN8Q+9I5EVqHFqTXKn?=
 =?iso-8859-1?Q?w42CZH3s/X9bmn5iUxW9v4uNj/QxygKpvZYx0Lxdm3iW28++Hhdn6aqmqq?=
 =?iso-8859-1?Q?QK5UOg0JDMdI/jlvHrcZphNur5EqUC9xx2gyfclw4Iy+wWt5j56bqnDqkX?=
 =?iso-8859-1?Q?qsyw4k0V+lVm9UpcviJSDJkVsPG5oTLEkj5Ib0RLYoAS67w3DuaNbfHCDc?=
 =?iso-8859-1?Q?Iz6biYFMth8ItjzUITiBwgGOTLfGFcL9EMeMAXnwUSRCPFP488VT0k5rSS?=
 =?iso-8859-1?Q?s8veDuJNZwV+KCKBRDTfPdlvMbhDZdQOxEaquFBpKiy+FqsbG22xMr3Fus?=
 =?iso-8859-1?Q?dJeoK+v8GSvYmmLBYVRGyMsBtjby3l4sIaNJHhcJ+GAWdBfL55b/mCrH6X?=
 =?iso-8859-1?Q?Ie2BoK9JvLeLc/enwMXTo1Na2s3qPLCbp3P34d1OZ0UmM1hXurKuv/S/fg?=
 =?iso-8859-1?Q?ziouGNuxc3XqSNqvChw7LirbO/W162A6rKE5QqiF4Rqx46bz7IpBxrczSC?=
 =?iso-8859-1?Q?VFI3wAiWs/tnTzZ6l159rV7lWh8QOwnX6RdjGwTzvu0jwudoVvFGnym2+U?=
 =?iso-8859-1?Q?LpUsSsVA3SrCh5+Du4+enBtc8p5g57lgXfsozszPtHOayPXrvkcSahUNvy?=
 =?iso-8859-1?Q?YRHd1p4hDbx3mf1xDe5AE5tYyvltoxPPw3qEninViBPe+4H4jSFpZU2gJl?=
 =?iso-8859-1?Q?wpliaWWtMfIOUz6PZGvZFhnB7YRHItY2T1XKHFS5sCjcOmLmG/01qr7TS3?=
 =?iso-8859-1?Q?EmXc9RDITJhfQPJxb/h1rCjfKQQHyF0U2JXyEghe1lcmY4ih/P6Jh45y7t?=
 =?iso-8859-1?Q?+HV+ZyYTWM6dFbSak4SqHIC50jfc4MRgl12MTzzcQAVGaLkgR5lFpxbco0?=
 =?iso-8859-1?Q?pb0TtutDKGNrEUvrbLCje+zOMnbF5FM47LJm4nHdZCMuR7s=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PA4PR03MB713676499C1F10655C0ACF4AE3E49PA4PR03MB7136eurp_"
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9120ba3c-a790-4dfb-e2b3-08d94d178a54
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2021 13:49:34.8776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Z4dXfPRs+uRyqJ/5B/yhNaHEFwy7HJZfpcB0zOOlxQ9IMB6yR8UXk7vmWttZ3RjwvrrN85RHlT++UroTMv661okU7lfAw8MDwiDzfcqdnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5449
X-Proofpoint-GUID: BeQI249M7mCAcp05ncAXfh_jJJIm6Dh2
X-Proofpoint-ORIG-GUID: BeQI249M7mCAcp05ncAXfh_jJJIm6Dh2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-22_07:2021-07-22,2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107220092

--_000_PA4PR03MB713676499C1F10655C0ACF4AE3E49PA4PR03MB7136eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Julien and Stefano,

This is actually a good point. There are two other possible issues:
    1) The kernel and the hypervisor may overlaps each other.
    2) The size of the kernel is not correctly provided.

I remember hitting such issues in the past and they will lead to weird
issues.

In fact looking at the device-tree provided in the first e-mail, I see:

                 module@0 {
                         compatible =3D "xen,linux-zimage",
"xen,multiboot-module";
                         reg =3D <0x5 0x1000000 0x0 0x2000000>;
                 };

However from the pastebin, U-boot will report for the kernel:

Bytes transferred =3D 37124608 (2367a00 hex)

So, if I am not mistaken, the region in the DT is smaller than the
kernel itself. The Image header doesn't provide the binary size, so Xen
can't do any sanity check.

In this case, we would copy a truncated kernel. Can you change in the
size in the DT and give another try?


If you haven't one yet, I would highly recommend to have script (either
a U-boot one or outside) that will generate the correct DT for a given
kernel, xen, initramfs. We have some example scripts on the wiki for
either solution.
Thank you very much for the suggestion. It appears to be the cause of the i=
ssue. Issue was fixed once I increased region in DT. I should have checked =
this at the very beginning.
The most interesting thing that kernel size is the same, regardless of krob=
e/uprobe events are on or off. But error appears only if kprobe/uprobe even=
ts are on.
In any case, thank you very much for your help.

Best regards,
Oleksii

________________________________
From: Julien Grall <julien@xen.org>
Sent: Thursday, July 22, 2021 12:29 PM
To: Stefano Stabellini <sstabellini@kernel.org>; Oleksii Moisieiev <Oleksii=
_Moisieiev@epam.com>
Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; Andrii=
 Anisov <Andrii_Anisov@epam.com>
Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENT=
S in kernel config

Hi Stefano and Oleksii,


On 22/07/2021 03:12, Stefano Stabellini wrote:
> On Wed, 21 Jul 2021, Oleksii Moisieiev wrote:
>> Please see my answers below.
>>
>> ________________________________________________________________________=
___________________________________________________________________
>> From: Julien Grall <julien@xen.org>
>> Sent: Wednesday, July 21, 2021 7:39 PM
>> To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>; xen-devel@lists.xenp=
roject.org <xen-devel@lists.xenproject.org>
>> Cc: Andrii Anisov <Andrii_Anisov@epam.com>; Stefano Stabellini <sstabell=
ini@kernel.org>
>> Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EV=
ENTS in kernel config
>>        On 21/07/2021 15:40, Oleksii Moisieiev wrote:
>>        > Hello Julien,
>>
>>        Hello,
>>
>>        >>>
>>        >>> My setup:
>>        >>> Board: H3ULCB Kinfisher board
>>        >>> Xen: revision dba774896f7dd74773c14d537643b7d7477fefcd (stabl=
e-4.15)
>>        >>>https://urldefense.com/v3/__https://github.com/xen-project/xen=
.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8=
Q
>>        ri3haIaks6cbo7Ri$
>>        ><https://urldefense.com/v3/__https://github.com/xen-project/xen.=
git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8
>>        Qri3haIaks6cbo7Ri$>[github[.]com]
>>        >
>>        >>><https://urldefense.com/v3/__https://github.com/xen-project/xe=
n.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp=
8
>>        Qri3haIaks6cbo7Ri$
>>        > [github[.]com]>;
>>        >>> Kernel: revision 09162bc32c880a791c6c0668ce0745cf7958f576 (v5=
.10-rc4)
>>        >
>>        >>Hmmm... 5.10 was released a few months ago and there are probab=
ly a few
>>        >>stable release for the version. Can you try the latest 5.10 sta=
ble?
>>        >
>>        > Switched to tag v5.10 rev: 2c85ebc57b3e of
>>        >https://urldefense.com/v3/__https://github.com/torvalds/linux.gi=
t__;!!GF_29dbcQIUBPA!hJARiSsCASVNpAQxrnN-7sFsVHHTS39sjRraLqBkD6AoaCbplgoyi
>>        v-iCGlHhXafbPNc$ [github[.]com]
>>        > and got the same problem, that I see no output from kernel. All=
 tests
>>        > were done with earlycon parameter set in the kernel cmdline.
>>        The tag v5.10 is the first official release. What I meant is usin=
g the
>>        stable branch from
>>        git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git (b=
ranch
>>        linux-5.10.y).
>>
>> I need some time to download and build mainline kernel. I'll test this s=
cenario and send you results tomorrow.
>
> I tried 5.10 with:
>
> CONFIG_KPROBE_EVENTS=3Dy
> CONFIG_UPROBE_EVENTS=3Dy
>
> and I could boot without issues on Xilinx ZynqMP.
>
>
>
>>        >>>
>>        >>>https://urldefense.com/v3/__https://github.com/torvalds/linux.=
git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Q=
r
>>        i3haIaks29w69MC$
>>        ><https://urldefense.com/v3/__https://github.com/torvalds/linux.g=
it__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Q
>>        ri3haIaks29w69MC$>[github[.]com]
>>        >
>>        >>><https://urldefense.com/v3/__https://github.com/torvalds/linux=
.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8=
Q
>>        ri3haIaks29w69MC$
>>        > [github[.]com]>;
>>        >>>
>>        >>> kernel config: see attached;
>>        >>>
>>        >>> dtb: see attached;
>>        >
>>        >>Please avoid large attachment as they will be duplicated on eve=
ry
>>        >>mailbox. Instead, in the future, please upload them somewhere (=
your own
>>        >>webserve, pastebin...) and provide a link in the e-mail.
>>        >
>>        > I'm sorry for that.
>>        >
>>        >>>
>>        >>>
>>        >>> If kprobe/uprobe events are enabled - I see no output after x=
en switched
>>        >>> input to Dom0, if disabled - system boots up successfully.
>>        >>The console subsystem tends to be enabled quite late in the boo=
t
>>        >>process. So this may mean a panic during early boot.
>>        >
>>        >>If you haven't done yet, I would suggest to add earlycon=3Dxenb=
oot on the
>>        >>dom0 command line. This will print some messages during early b=
oot.
>>        >>ing.
>>        >
>>        > All tests were done with earlycon parameter set in the kernel c=
ommand
>>        > line (xen, dom0-bootargs).
>>        >
>>        >>>
>>        >>> Both configs work fine when I boot without xen.
>>        >>>
>>        >>>
>>        >>> Dom0 information from Xen console shows that only one CPU wor=
ks, and PC
>>        >>> stays in "__arch_counter_get_cntvct" function on read_sysreg =
call. //
>>        >>>
>>        >>> I did further investigation and found that kernel 5.4 doesn't=
 have such
>>        >>> kind of issues.
>>        >>> After bisecting kernel,between 5.10 and 5.4, I found that out=
put
>>        >>> disappeared on commit:
>>        >>>
>>        >>> 76085aff29f585139a37a10ea0a7daa63f70872c
>>        >
>>        >> From the information you provided so far, I am a bit confused =
how this
>>        >>could be the source of the problem. But given this is not the l=
atest
>>        >>5.10, I will wait for you to confirm the bug is still present b=
efore
>>        >>providing more input.
>>        >
>>        > I was confused with this commit either. As I mentioned above, I=
've
>>        > checked with the latest stable 5.10 kernel and still got the sa=
me problem.
>>
>>        Thanks for the testing. I am not quite too sure where this may fa=
il.
>>        Maybe Stefano has an idea?
>
> Are you booting with bootefi? (I cannot see any issues with or without
> bootefi.)
>
> In any case, the fact that you need to revert
> 76085aff29f585139a37a10ea0a7daa63f70872c to see the printk output is
> very odd. It might point to an alignment problem or another memory
> issue. It is possible that the weirdness you are seeing below (e.g. "we
> get some 18446744073709551615 while expecting 0") is due to a memory
> corruption.
>
> Given that 76085aff29f585139a37a10ea0a7daa63f70872c is changing some
> section alignment from 4K to 64K, it increases the memory used to load
> the kernel. Is it possible that the size increase is causing you to go
> beyond the address range supposed to be used? E.g. U-Boot loading the
> kernel at invalid addresses.
>
> Things like CONFIG_KPROBE_EVENTS=3Dy and CONFIG_UPROBE_EVENTS=3Dy are
> relevant because they increase the size of the kernel, possibly pushing
> it to an invalid memory range?

This is actually a good point. There are two other possible issues:
    1) The kernel and the hypervisor may overlaps each other.
    2) The size of the kernel is not correctly provided.

I remember hitting such issues in the past and they will lead to weird
issues.

In fact looking at the device-tree provided in the first e-mail, I see:

                 module@0 {
                         compatible =3D "xen,linux-zimage",
"xen,multiboot-module";
                         reg =3D <0x5 0x1000000 0x0 0x2000000>;
                 };

However from the pastebin, U-boot will report for the kernel:

Bytes transferred =3D 37124608 (2367a00 hex)

So, if I am not mistaken, the region in the DT is smaller than the
kernel itself. The Image header doesn't provide the binary size, so Xen
can't do any sanity check.

In this case, we would copy a truncated kernel. Can you change in the
size in the DT and give another try?


If you haven't one yet, I would highly recommend to have script (either
a U-boot one or outside) that will generate the correct DT for a given
kernel, xen, initramfs. We have some example scripts on the wiki for
either solution.

>
> You can go and edit 76085aff29f585139a37a10ea0a7daa63f70872c to change
> from 4K to any multiple of 4K, e.g. 8K, 12K, 16K, 20K. They should all
> work the same.
>
> Looking at the boot logs on pastebin I noticed that Xen is not loaded at
> a 2MB aligned address. I recommend you change Xen loading address to
> 0x500200000. And the kernel loading address to 0x500400000.

I am curious to know why you recommend to load at 2MB aligned address.
The Image protocol doesn't require to load a 2MB aligned address. In
fact, we add issue on Juno because the bootloader would load Xen at a
4KB address. UEFI will also load at a 4KB align address.

Cheers,

--
Julien Grall

--_000_PA4PR03MB713676499C1F10655C0ACF4AE3E49PA4PR03MB7136eurp_
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
<span style=3D"margin:0px;font-size:12pt;color:black">Hello Julien&nbsp;and=
 Stefano,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<blockquote style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (=
West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFo=
nt, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:15px;color:rgb=
(102, 102, 102);margin-left:0.8ex;padding-left:1ex;border-color:rgb(200, 20=
0, 200);border-left-width:3px;border-left-style:solid">
<div style=3D"margin:0px"><font size=3D"2">
<div style=3D"margin:0px"><br>
</div>
<span style=3D"margin:0px;font-size:11pt">
<div style=3D"margin:0px">This is actually a good point. There are two othe=
r possible issues:<br>
&nbsp;&nbsp;&nbsp; 1) The kernel and the hypervisor may overlaps each other=
.<br>
&nbsp;&nbsp;&nbsp; 2) The size of the kernel is not correctly provided.<br>
<br>
I remember hitting such issues in the past and they will lead to weird<span=
 class=3D"Apple-converted-space">&nbsp;</span><br>
issues.<br>
<br>
In fact looking at the device-tree provided in the first e-mail, I see:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; module@0 {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compa=
tible =3D &quot;xen,linux-zimage&quot;,<span class=3D"Apple-converted-space=
">&nbsp;</span><br>
&quot;xen,multiboot-module&quot;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =
=3D &lt;0x5 0x1000000 0x0 0x2000000&gt;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; };<br>
<br>
However from the pastebin, U-boot will report for the kernel:<br>
<br>
Bytes transferred =3D 37124608 (2367a00 hex)<br>
<br>
So, if I am not mistaken, the region in the DT is smaller than the<span cla=
ss=3D"Apple-converted-space">&nbsp;</span><br>
kernel itself. The Image header doesn't provide the binary size, so Xen<spa=
n class=3D"Apple-converted-space">&nbsp;</span><br>
can't do any sanity check.<br>
<br>
In this case, we would copy a truncated kernel. Can you change in the<span =
class=3D"Apple-converted-space">&nbsp;</span><br>
size in the DT and give another try?<br>
<br>
<br>
If you haven't one yet, I would highly recommend to have script (either<spa=
n class=3D"Apple-converted-space">&nbsp;</span><br>
a U-boot one or outside) that will generate the correct DT for a given<span=
 class=3D"Apple-converted-space">&nbsp;</span><br>
kernel, xen, initramfs. We have some example scripts on the wiki for<span c=
lass=3D"Apple-converted-space">&nbsp;</span><br>
either solution.<br>
</div>
</span></font></div>
</blockquote>
<div style=3D"margin:0px;font-family:&quot;Segoe UI&quot;, &quot;Segoe UI W=
eb (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSyst=
emFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:15px;color=
:rgb(32, 31, 30);caret-color:rgb(32, 31, 30)">
Thank you very much for the suggestion. It appears to be the cause of the i=
ssue. Issue was fixed once I increased region in DT. I should have checked =
this at the very beginning.&nbsp;</div>
<div style=3D"margin:0px;font-family:&quot;Segoe UI&quot;, &quot;Segoe UI W=
eb (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSyst=
emFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:15px;color=
:rgb(32, 31, 30);caret-color:rgb(32, 31, 30)">
The most interesting thing that kernel size is the same, regardless of krob=
e/uprobe events are on or off. But error appears only if kprobe/uprobe even=
ts are on.&nbsp;</div>
<span style=3D"margin:0px;font-family:&quot;Segoe UI&quot;, &quot;Segoe UI =
Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSys=
temFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:15px;colo=
r:rgb(32, 31, 30);caret-color:rgb(32, 31, 30)">In any case, thank you very
 much for your help.</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"margin:0px;font-family:&quot;Segoe UI&quot;, &quot;Segoe UI =
Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSys=
temFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:15px;colo=
r:rgb(32, 31, 30);caret-color:rgb(32, 31, 30)"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"margin:0px;font-family:&quot;Segoe UI&quot;, &quot;Segoe UI =
Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSys=
temFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:15px;colo=
r:rgb(32, 31, 30);caret-color:rgb(32, 31, 30)">Best regards,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"margin:0px;font-family:&quot;Segoe UI&quot;, &quot;Segoe UI =
Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSys=
temFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:15px;colo=
r:rgb(32, 31, 30);caret-color:rgb(32, 31, 30)">Oleksii</span></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Julien Grall &lt;juli=
en@xen.org&gt;<br>
<b>Sent:</b> Thursday, July 22, 2021 12:29 PM<br>
<b>To:</b> Stefano Stabellini &lt;sstabellini@kernel.org&gt;; Oleksii Moisi=
eiev &lt;Oleksii_Moisieiev@epam.com&gt;<br>
<b>Cc:</b> xen-devel@lists.xenproject.org &lt;xen-devel@lists.xenproject.or=
g&gt;; Andrii Anisov &lt;Andrii_Anisov@epam.com&gt;<br>
<b>Subject:</b> Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROB=
E_EVENTS in kernel config</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hi Stefano and Oleksii,<br>
<br>
<br>
On 22/07/2021 03:12, Stefano Stabellini wrote:<br>
&gt; On Wed, 21 Jul 2021, Oleksii Moisieiev wrote:<br>
&gt;&gt; Please see my answers&nbsp;below.<br>
&gt;&gt;<br>
&gt;&gt; __________________________________________________________________=
_________________________________________________________________________<b=
r>
&gt;&gt; From: Julien Grall &lt;julien@xen.org&gt;<br>
&gt;&gt; Sent: Wednesday, July 21, 2021 7:39 PM<br>
&gt;&gt; To: Oleksii Moisieiev &lt;Oleksii_Moisieiev@epam.com&gt;; xen-deve=
l@lists.xenproject.org &lt;xen-devel@lists.xenproject.org&gt;<br>
&gt;&gt; Cc: Andrii Anisov &lt;Andrii_Anisov@epam.com&gt;; Stefano Stabelli=
ni &lt;sstabellini@kernel.org&gt;<br>
&gt;&gt; Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPR=
OBE_EVENTS in kernel config<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; On 21/07/2021 15:40, Ole=
ksii Moisieiev wrote:<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Hello&nbsp;Julien,<=
br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hello,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; My setup:<b=
r>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; Board: H3UL=
CB Kinfisher board<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; Xen: revisi=
on dba774896f7dd74773c14d537643b7d7477fefcd (stable-4.15)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<a href=3D"h=
ttps://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!!GF_29=
dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Q">https://url=
defense.com/v3/__https://github.com/xen-project/xen.git__;!!GF_29dbcQIUBPA!=
m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Q</a><br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ri3haIaks6cbo7Ri$<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&lt;<a href=3D""></a=
>https://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!!GF_=
29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Qri3haIaks6cbo7Ri$&gt;[g=
ithub[.]com]<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;&lt;<a href=
=3D""></a>https://urldefense.com/v3/__https://github.com/xen-project/xen.gi=
t__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8<br=
>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Qri3haIaks6cbo7Ri$<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; [github[.]com]&gt;;=
<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; Kernel: rev=
ision 09162bc32c880a791c6c0668ce0745cf7958f576&nbsp;(v5.10-rc4)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;Hmmm... 5.10 was=
 released a few months ago and there are probably a few<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;stable release f=
or the version. Can you try the latest 5.10 stable?<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Switched to tag v5.=
10 rev: 2c85ebc57b3e of<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<a href=3D"https://u=
rldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA=
!hJARiSsCASVNpAQxrnN-7sFsVHHTS39sjRraLqBkD6AoaCbplgoyi">https://urldefense.=
com/v3/__https://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!hJARiSsCA=
SVNpAQxrnN-7sFsVHHTS39sjRraLqBkD6AoaCbplgoyi</a><br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v-iCGlHhXafbPNc$ [github=
[.]com]<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; and got the same pr=
oblem, that I see no output from kernel. All tests<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; were done with earl=
ycon parameter set in the kernel cmdline.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The tag v5.10 is the fir=
st official release. What I meant is using the<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stable branch from<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git://git.kernel.org/pub=
/scm/linux/kernel/git/stable/linux.git (branch<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux-5.10.y).<br>
&gt;&gt;<br>
&gt;&gt; I need some time to download and build mainline kernel. I'll test =
this scenario and send you results tomorrow.<br>
&gt; <br>
&gt; I tried 5.10 with:<br>
&gt; <br>
&gt; CONFIG_KPROBE_EVENTS=3Dy<br>
&gt; CONFIG_UPROBE_EVENTS=3Dy<br>
&gt; <br>
&gt; and I could boot without issues on Xilinx ZynqMP.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<a href=3D"h=
ttps://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29d=
bcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qr">https://url=
defense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!m=
4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qr</a><br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i3haIaks29w69MC$<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&lt;<a href=3D""></a=
>https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_2=
9dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Q<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ri3haIaks29w69MC$&gt;[gi=
thub[.]com]<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;&lt;<a href=
=3D""></a>https://urldefense.com/v3/__https://github.com/torvalds/linux.git=
__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Q<br=
>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ri3haIaks29w69MC$<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; [github[.]com]&gt;;=
<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; kernel conf=
ig: see attached;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; dtb: see at=
tached;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;Please avoid lar=
ge attachment as they will be duplicated on every<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;mailbox. Instead=
, in the future, please upload them somewhere (your own<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;webserve, pasteb=
in...) and provide a link in the e-mail.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; I'm sorry for that.=
<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; If kprobe/u=
probe events are enabled - I see no output after xen switched<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; input to Do=
m0, if disabled - system boots up successfully.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;The console subs=
ystem tends to be enabled quite late in the boot<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;process. So this=
 may mean a panic during early boot.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;If you haven't d=
one yet, I would suggest to add earlycon=3Dxenboot on the<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;dom0 command lin=
e. This will print some messages during early boot.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;ing.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; All tests were done=
 with earlycon parameter set in the kernel command<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; line (xen, dom0-boo=
targs).<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; Both config=
s work fine when I boot without xen.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; Dom0 inform=
ation from Xen console shows that only one CPU works, and PC<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; stays in &q=
uot;__arch_counter_get_cntvct&quot; function on read_sysreg call. //<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; I did furth=
er investigation and found that kernel 5.4 doesn't have such<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; kind of iss=
ues.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; After bisec=
ting kernel,between 5.10 and 5.4, I found that output<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; disappeared=
 on commit:<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt; 76085aff29f=
585139a37a10ea0a7daa63f70872c<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; From the inform=
ation you provided so far, I am a bit confused how this<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;could be the sou=
rce of the problem. But given this is not the latest<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;5.10, I will wai=
t for you to confirm the bug is still present before<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;providing more i=
nput.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; I was confused with=
 this commit either. As I mentioned above, I've<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; checked with the la=
test stable 5.10 kernel and still got the same problem.<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanks for the testing. =
I am not quite too sure where this may fail.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maybe Stefano has an ide=
a?<br>
&gt; <br>
&gt; Are you booting with bootefi? (I cannot see any issues with or without=
<br>
&gt; bootefi.)<br>
&gt; <br>
&gt; In any case, the fact that you need to revert<br>
&gt; 76085aff29f585139a37a10ea0a7daa63f70872c to see the printk output is<b=
r>
&gt; very odd. It might point to an alignment problem or another memory<br>
&gt; issue. It is possible that the weirdness you are seeing below (e.g. &q=
uot;we<br>
&gt; get some&nbsp;18446744073709551615 while expecting 0&quot;) is due to =
a memory<br>
&gt; corruption.<br>
&gt; <br>
&gt; Given that 76085aff29f585139a37a10ea0a7daa63f70872c is changing some<b=
r>
&gt; section alignment from 4K to 64K, it increases the memory used to load=
<br>
&gt; the kernel. Is it possible that the size increase is causing you to go=
<br>
&gt; beyond the address range supposed to be used? E.g. U-Boot loading the<=
br>
&gt; kernel at invalid addresses.<br>
&gt; <br>
&gt; Things like CONFIG_KPROBE_EVENTS=3Dy and CONFIG_UPROBE_EVENTS=3Dy are<=
br>
&gt; relevant because they increase the size of the kernel, possibly pushin=
g<br>
&gt; it to an invalid memory range?<br>
<br>
This is actually a good point. There are two other possible issues:<br>
&nbsp;&nbsp;&nbsp; 1) The kernel and the hypervisor may overlaps each other=
.<br>
&nbsp;&nbsp;&nbsp; 2) The size of the kernel is not correctly provided.<br>
<br>
I remember hitting such issues in the past and they will lead to weird <br>
issues.<br>
<br>
In fact looking at the device-tree provided in the first e-mail, I see:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; module@0 {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compa=
tible =3D &quot;xen,linux-zimage&quot;, <br>
&quot;xen,multiboot-module&quot;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =
=3D &lt;0x5 0x1000000 0x0 0x2000000&gt;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; };<br>
<br>
However from the pastebin, U-boot will report for the kernel:<br>
<br>
Bytes transferred =3D 37124608 (2367a00 hex)<br>
<br>
So, if I am not mistaken, the region in the DT is smaller than the <br>
kernel itself. The Image header doesn't provide the binary size, so Xen <br=
>
can't do any sanity check.<br>
<br>
In this case, we would copy a truncated kernel. Can you change in the <br>
size in the DT and give another try?<br>
<br>
<br>
If you haven't one yet, I would highly recommend to have script (either <br=
>
a U-boot one or outside) that will generate the correct DT for a given <br>
kernel, xen, initramfs. We have some example scripts on the wiki for <br>
either solution.<br>
<br>
&gt; <br>
&gt; You can go and edit 76085aff29f585139a37a10ea0a7daa63f70872c to change=
<br>
&gt; from 4K to any multiple of 4K, e.g. 8K, 12K, 16K, 20K. They should all=
<br>
&gt; work the same.<br>
&gt; <br>
&gt; Looking at the boot logs on pastebin I noticed that Xen is not loaded =
at<br>
&gt; a 2MB aligned address. I recommend you change Xen loading address to<b=
r>
&gt; 0x500200000. And the kernel loading address to 0x500400000.<br>
<br>
I am curious to know why you recommend to load at 2MB aligned address. <br>
The Image protocol doesn't require to load a 2MB aligned address. In <br>
fact, we add issue on Juno because the bootloader would load Xen at a <br>
4KB address. UEFI will also load at a 4KB align address.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</div>
</span></font></div>
</body>
</html>

--_000_PA4PR03MB713676499C1F10655C0ACF4AE3E49PA4PR03MB7136eurp_--

