Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D7A323473
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 01:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89135.167658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEhuV-0005Go-MX; Wed, 24 Feb 2021 00:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89135.167658; Wed, 24 Feb 2021 00:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEhuV-0005GP-J5; Wed, 24 Feb 2021 00:20:11 +0000
Received: by outflank-mailman (input) for mailman id 89135;
 Wed, 24 Feb 2021 00:20:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMv=H2=epam.com=prvs=26891aedce=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lEhuU-0005GK-N8
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 00:20:10 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a8849a5-def2-4bc3-9991-99c71466fea4;
 Wed, 24 Feb 2021 00:20:08 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11O0BRwU001376; Wed, 24 Feb 2021 00:20:01 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0b-0039f301.pphosted.com with ESMTP id 36w0ymta87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 00:20:01 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM9PR03MB6977.eurprd03.prod.outlook.com (2603:10a6:20b:2d8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 00:19:58 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.048; Wed, 24 Feb 2021
 00:19:58 +0000
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
X-Inumbo-ID: 7a8849a5-def2-4bc3-9991-99c71466fea4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/w5Wp6ZrXceZmuHnQnbemItW19soW8JCdf1Uc2SP3Ov3pfmZad7nP1O9sF/VVZJgeUFRhjqYAs4nG99k85N1fvWvmWbmFob/pm7r3+0Eo9vu/Z82TyaedXkHw92v/8+/ADdNLFHwWEPEgw+qey0VslD7OjgNLSHyTSZRLH9rTeoGQUvNjIEzXqNagpG/qEJMFK/yYMvs9mY42Kw7RQdfrPVPC1kEpGhqy4NXLKtBPNspBfgiwB9dDHLbWF2tb9miwS8aG4EmZ/+r2j6nsFf0yX+1a/Lb0yJ2uRtS+D17TtVtMBkE4WfQ87cQAqb1ngDZegzHLeVMcnNhV5NHDNoaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/pA7clmf8L2PrYGDWbFd1HANlAQeQJl6RNhm3tdmYQ=;
 b=T0cy9T5T7jM19lTBYHrE8rISYUFhp/LOyZ7l0KfHJQCJsPqXFQVT2lWVkUQLvYDY5dbc1nlE6shyS7snny1xcQHVjMLW2vqdjWF/2kYGF6uKDOj3aj+HbYnDXJ27SckFGJYEkfxjR1efM4/ZT0tV4dLhREhVzNZGBSKOhSJt4tGJDN6uluakTPY7y/blkn1PiayIhzXk3NZckutQusW2NNu2OZpDbRLj5Uq/IyQmvRiufLLhiFEiymFW8HURs83/KCeaK0xfWOZSVtNeS60anwwCwqqAEDj23Exg4GR/w8nCRYE4lKclHWstqoljISwrADR6YzdxyVQ+WsIWDlz4vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/pA7clmf8L2PrYGDWbFd1HANlAQeQJl6RNhm3tdmYQ=;
 b=kE6H3O+49MHAyaG0ToA8rzhBHeeftglkvCj09pVymM1fiZQkiK1y2cA33ElNMIk7/X2hZ422bdrAM51O/VHuH2VfNw9c9dO17WhNJiwu/dQworPZfLK52FGzgj+yecf/cWxbZc8NU9RGbwcB3/CFtDpo3ahAieIkJxlPuVevx0ZeDuEdDNPYcbxMVRgyZXFDYN4g8EcGF93h1A7z+qp+TmvA16sOjmI9Bxi+fwy+FYJYHtuoEckQRkBOzg7gn+rwTrs93vBdykouWFRLZrQ+PDg0DpGiFKFgYKADHYlx1JAyHcMa8oH9Xm7hYU59D1bbxSMGdUaZZee3p6jZBo45Zg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "famzheng@amazon.com" <famzheng@amazon.com>,
        "cardoe@cardoe.com"
	<cardoe@cardoe.com>, "wl@xen.org" <wl@xen.org>,
        "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>,
        "julien@xen.org" <julien@xen.org>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Topic: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Index: AQHXCiKc1pmgaaPjJEuqIKIpTRVLeqpmcUqA
Date: Wed, 24 Feb 2021 00:19:57 +0000
Message-ID: <87v9ai5nbm.fsf@epam.com>
References: <161405394665.5977.17427402181939884734@c667a6b167f6>
 <alpine.DEB.2.21.2102231228060.3234@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2102231228060.3234@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49b52ac9-9329-425e-757f-08d8d859eb1c
x-ms-traffictypediagnostic: AM9PR03MB6977:
x-microsoft-antispam-prvs: 
 <AM9PR03MB6977F775C41CF7CDCFED35F6E69F9@AM9PR03MB6977.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IAZ33xw/jYSBSXhpavFoYodX6HxZgS8qCT5RO15TPjoIIkWEjKIZgcF1hFkgxquTtM4z+ozwzaMScHrme1gkNmjjmPb/dne/NpEIodJIJ5hKX9tg+EjWL06DPOUXXey8MpekDgWFDxeGzAm7fcPwS7fTcmooIjre9lyeVnNEFiwousnrOhL9JLYsGrN7A7gRSHYn+c9ZSS96AYhWFibHXbujH9v+/y04m3OYRZpYeGn/5DQ5Fm9xmbPdegGa/9zbhzQU956E69sL0NyEvoy0sOfSlpN/+Yg4M+t+GhJOviExJGtjArJmacUbaGTv9NSZvhF1jKRCLEIkfOXTgpo4E1pTfjJUlNrG6Xr3i+iY9rFYCHwfgvv4rH199rFQnVg47t+feOE+9bNY69M5uKCHs+AA4h89vnN7Jd3/7s29xpT6BE7MDYpXVaoI79WboCqxa2ZAmqH1gARP9Sh9hfHf/T8wZNhXD9JiLGY1WEJ3wD8vOMq10fie1XfwV/rbrJu3Vbouk2+K03MtCSQCeVpT7Sh25zqoURlhktjadvHxwfpsJsJ10/wTgwQ9IioGOLX85/eSWApusk4zhP8k3KW378RnAJDKxNYgmh1ChSnsMc8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(6506007)(8936002)(5660300002)(71200400001)(186003)(86362001)(66446008)(64756008)(4326008)(66556008)(76116006)(66476007)(2616005)(6512007)(36756003)(478600001)(66946007)(30864003)(966005)(26005)(6916009)(54906003)(316002)(2906002)(55236004)(8676002)(6486002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?f5zlGFtHOJ59u2b5wDgy+BzXPFh240FnQxoX0MlycyFJsOHEO3DLX86JdJ?=
 =?iso-8859-1?Q?5Ex3bRcpK4LL/HcaR5SjolM9cBcfcQOHoRTxb0Owcucisc3TrFZdTxxUEE?=
 =?iso-8859-1?Q?tusc7uaJxB0hIzWJ3xs/AAf9PklrqKNkrzvwiNkZjch242xKeoPMsWb9nW?=
 =?iso-8859-1?Q?RV3kt7ya2YkCAAUJcETTJJxPNmd5X+HOC7d1yfvb7qEDyuZ6O98vy8iiXl?=
 =?iso-8859-1?Q?1aKVu9aFYcZJ/JgkRWaFonZiR0SZgHwkhCBavtzCleus+vLdR1JYXuj8mj?=
 =?iso-8859-1?Q?NBqmt3rIMk8ZuIaTQWgMHMMrNLvDKrSXHel6Scf7/TNaMuvQ/rInaX3fyA?=
 =?iso-8859-1?Q?TDLNEODg8+4AzgyP0eRVwyWv9DzweKlv8enLhQ89UlfX/n0ALau8+5oWw1?=
 =?iso-8859-1?Q?wbtZZPieYiex58t+a+sgvr2fUupJNUQcsT+lVXcLNn/Mq3LzxE95FY6M61?=
 =?iso-8859-1?Q?mxyPlRxu3DiDLA1n7vMVtHuJcDPcQBdwVj/v+xNIJHBvXwoSeOtdKofPYZ?=
 =?iso-8859-1?Q?6uboe4aA8AsH5n4FrXbfUEPLo9DFYkulzQHkS7Sjzo+cGR23dwExBjRa/T?=
 =?iso-8859-1?Q?Vmup7IYpEMvGybUQGbj/hp7o4vamB9cGI5+2tlhcXsHLQ2yVNEaw9nFkIE?=
 =?iso-8859-1?Q?ui/nDSb59+5+LDIq1tDU+X21+oLA4em2cB2flfw/gjZPNlaY+Tz6X2bqG6?=
 =?iso-8859-1?Q?SgC3EB+T9uAUHtCA73fmniq7jc3eP5Iu4er8CQuvn43jngrjOEmZ2dfw57?=
 =?iso-8859-1?Q?GuMdqGWEqC4aL0Rk+hBtsje5rIRXlt9RJ5sG00WXyDn8Y5KwlxWtfvzkT3?=
 =?iso-8859-1?Q?3+u4MGgN9Fj+2ZBOMNcEmM1ZOrCtZ6k5aNWBYg5dBTRKGU+4+b10NWQlgE?=
 =?iso-8859-1?Q?dOt19AeHwfAKbsVHTWxqB68kyWFVik3Bosd0lc0sQpk5qtFiWKAG/HO9jV?=
 =?iso-8859-1?Q?gWLJ6cZ8WTa/+dFnix7RcTZIKMxERdNSnJlpeFMdCU+Z20DWWsx+QUwmPW?=
 =?iso-8859-1?Q?O9MAQTmief+FcXG5JcSHdHjp9/mI2D4ZWK2MuivNcKrQmtlz4TnqhHrXWQ?=
 =?iso-8859-1?Q?eDmYxYKJoVbqrCM+SGHXURTCeMNhMMKYe0+4UGC9qFU+ZILjJMW8iO48UU?=
 =?iso-8859-1?Q?YD+17WEMhpGC9h7b1J2OZq7gT1yxny3ermhSOpCHIosvSBzzjHVGSgCpl0?=
 =?iso-8859-1?Q?yD/MspkJTrB/gsoyaphmpCxgSrchZHklqRRgGiAsdNlM8mEmz2UEnIDfnh?=
 =?iso-8859-1?Q?woqm3o5bRqT4yGQBep+ZK+3a9STtImnxe7QvjhYYNMhjaoMtiXcVRDRmZS?=
 =?iso-8859-1?Q?hIFPQdIm5NOUqNJPDPV0U7cv3Hdmifdkvj7VkqKsGyT/GaQYj/MWnhGSzr?=
 =?iso-8859-1?Q?YpRqHXfmTvskjKvJu+Ku/3mVEL0RcJmQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b52ac9-9329-425e-757f-08d8d859eb1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 00:19:57.9795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +4M8hirs1hzCsdZpCU6QM4UnjPivJJPvuEfwuR0vavtkGld+GagRJzJ/+qSvdQ6iq4mkpMn+xfvukSp0K4sO0PIHqaEfKN2oHUmyuPdR/oM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6977
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240000


Hi Stefano,

Stefano Stabellini writes:

> Hi Volodymyr,
>
> This looks like a genuine failure:

Thank you for the report. I just debugged similar issues, which seems
happen randomly and found a flaw in this_cpu() implementation. It is
currently not compatible with preemption in hypervisor mode.

It might happen then CPU id is being read while running on one pCPU, but
then code might be preempted and it may continue to run on other pCPU,
while accessing data for a previous pCPU.

This mostly happens with __preempt_count variable in my case, by other
per_cpu variables affected too. Linux uses pair of
get_cpu_var/put_cpu_var functions, that temporally disable/enable
preemption. Something like that should be implemented in my patches as
well. But for __preempt_count I need completely different approach of
course. I'm looking for solution right now.

> https://urldefense.com/v3/__https://gitlab.com/xen-project/patchew/xen/-/=
jobs/1048475444__;!!GF_29dbcQIUBPA!mJXa6VegCDFete9dsvs4m8Epto5RJvSwfsRrESse=
nHBOJ4yxtj7XSU8QELo6TojcFLguIww$ [gitlab[.]com]
>
>
> (XEN) Data Abort Trap. Syndrome=3D0x1930046
> (XEN) Walking Hypervisor VA 0xf0008 on CPU0 via TTBR 0x0000000040545000
> (XEN) 0TH[0x0] =3D 0x0000000040544f7f
> (XEN) 1ST[0x0] =3D 0x0000000040541f7f
> (XEN) 2ND[0x0] =3D 0x0000000000000000
> (XEN) CPU0: Unexpected Trap: Data Abort
> (XEN) ----[ Xen-4.15-unstable  arm64  debug=3Dy  Tainted: U     ]----
> (XEN) CPU:    0
> (XEN) PC:     00000000002273b8 timer.c#remove_from_heap+0x2c/0x114
> (XEN) LR:     0000000000227530
> (XEN) SP:     000080003ff7f9a0
> (XEN) CPSR:   800002c9 MODE:64-bit EL2h (Hypervisor, handler)
> (XEN)      X0: 000080000234e6a0  X1: 0000000000000001  X2: 00000000000000=
00
> (XEN)      X3: 00000000000f0000  X4: 0000000000000000  X5: 00000000014d01=
4d
> (XEN)      X6: 0000000000000080  X7: fefefefefefeff09  X8: 7f7f7f7f7f7f7f=
7f
> (XEN)      X9: 717164616f726051 X10: 7f7f7f7f7f7f7f7f X11: 01010101010101=
01
> (XEN)     X12: 0000000000000008 X13: 0000000000000001 X14: 000080003ff7fa=
78
> (XEN)     X15: 0000000000000020 X16: 000000000028e558 X17: 00000000000000=
00
> (XEN)     X18: 00000000fffffffe X19: 0000000000000001 X20: 00000000003101=
80
> (XEN)     X21: 00000000000002c0 X22: 0000000000000000 X23: 00000000003460=
08
> (XEN)     X24: 0000000000310180 X25: 0000000000000000 X26: 00008000044e91=
b8
> (XEN)     X27: 000000000000ffff X28: 0000000041570018  FP: 000080003ff7f9=
a0
> (XEN)=20
> (XEN)   VTCR_EL2: 80043594
> (XEN)  VTTBR_EL2: 000200007ffe3000
> (XEN)=20
> (XEN)  SCTLR_EL2: 30cd183d
> (XEN)    HCR_EL2: 00000000807c663f
> (XEN)  TTBR0_EL2: 0000000040545000
> (XEN)=20
> (XEN)    ESR_EL2: 97930046
> (XEN)  HPFAR_EL2: 0000000000030010
> (XEN)    FAR_EL2: 00000000000f0008
> (XEN)=20
> (XEN) Xen stack trace from sp=3D000080003ff7f9a0:
> (XEN)    000080003ff7f9c0 0000000000227530 00008000044e9190 0000000000228=
0dc
> (XEN)    000080003ff7f9e0 0000000000228234 00008000044e9190 000000000024d=
d04
> (XEN)    000080003ff7fa40 000000000024a414 0000000000311390 000080000234e=
430
> (XEN)    0000800002345000 0000000000000000 0000000000346008 00008000044e9=
150
> (XEN)    0000000000000001 0000000000000000 0000000000000240 0000000000270=
474
> (XEN)    000080003ff7faa0 000000000024b91c 0000000000000001 0000000000310=
238
> (XEN)    000080003ff7fbf8 0000000080000249 0000000093860047 00000000002a1=
de0
> (XEN)    000080003ff7fc88 00000000002a1de0 00000000000002c0 00008000044e9=
470
> (XEN)    000080003ff7fab0 00000000002217b4 000080003ff7fad0 000000000027a=
8c0
> (XEN)    0000000000311324 00000000002a1de0 000080003ff7fc00 0000000000265=
310
> (XEN)    0000000000000000 00000000002263d8 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
020
> (XEN)    0000000000000080 fefefefefefeff09 7f7f7f7f7f7f7f7f 717164616f726=
051
> (XEN)    7f7f7f7f7f7f7f7f 0101010101010101 0000000000000008 0000000000000=
001
> (XEN)    000080003ff7fa78 0000000000000020 000000000028e558 0000000000000=
000
> (XEN)    00000000fffffffe 0000000000000000 0000000000310238 0000000000000=
00a
> (XEN)    0000000000310238 00000000002a64b0 00000000002a1de0 000080003ff7f=
c88
> (XEN)    0000000000000000 0000000000000240 0000000041570018 000080003ff7f=
c00
> (XEN)    000000000024c8c0 000080003ff7fc00 000000000024c8c4 9386004780000=
249
> (XEN)    000080003ff7fc90 000000000024c974 0000000000000384 0000000000000=
002
> (XEN)    0000800002345000 00000000ffffffff 0000000000000006 000080003ff7f=
e20
> (XEN)    0000000000000001 000080003ff7fe00 000080003ffe4a60 000080000234e=
430
> (XEN)    000080003ff7fd20 000080003ff7fd20 000080003ff7fce0 00000000fffff=
fc8
> (XEN)    000080003ff7fce0 000000000031a147 000080003ff7fd20 000000000027f=
7b8
> (XEN)    000080003ff7fd20 000080003ff7fd20 000080003ff7fce0 00000000fffff=
fc8
> (XEN)    000080003ff7fd20 000080003ff7fd20 000080003ff7fce0 00000000fffff=
fc8
> (XEN)    0000000000000240 0000800002345000 00000000ffffffff 0000000000000=
004
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
022
> (XEN)    000080003ff7fda0 000000000026ff2c 000000000027f608 0000000000000=
000
> (XEN)    0000000000000093 0000800002345000 0000000000000000 000080003ffe4=
a60
> (XEN)    0000000000000001 000080003ff7fe00 000080003ffe4a60 0000000041570=
018
> (XEN)    000080003ff7fda0 000000000026fee0 000080003ff7fda0 000000000026f=
f18
> (XEN)    000080003ff7fe30 0000000000279b2c 0000000093860047 0000000000000=
090
> (XEN)    0000000003001384 000080003ff7feb0 ffff800011dc1384 ffff8000104b0=
6a0
> (XEN)    ffff8000104b0240 ffff00000df806e8 0000000000000000 ffff800011b0c=
a88
> (XEN)    0000000003001384 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000093860047 0000000003001384 000080003ff7fe70 000000000027a=
180
> (XEN)    000080003ff7feb0 0000000093860047 0000000093860047 0000000060000=
085
> (XEN)    0000000093860047 ffff800011b0ca88 ffff800011b03d90 0000000000265=
458
> (XEN)    0000000000000000 ffff800011b0ca88 000080003ff7ffb8 0000000000265=
45c
> (XEN) Xen call trace:
> (XEN)    [<00000000002273b8>] timer.c#remove_from_heap+0x2c/0x114 (PC)
> (XEN)    [<0000000000227530>] timer.c#remove_entry+0x90/0xa0 (LR)
> (XEN)    [<0000000000227530>] timer.c#remove_entry+0x90/0xa0
> (XEN)    [<0000000000228234>] stop_timer+0x1fc/0x254
> (XEN)    [<000000000024a414>] core.c#schedule+0xf4/0x380
> (XEN)    [<000000000024b91c>] wait+0xc/0x14
> (XEN)    [<00000000002217b4>] try_preempt+0x88/0xbc
> (XEN)    [<000000000027a8c0>] do_trap_irq+0x5c/0x60
> (XEN)    [<0000000000265310>] entry.o#hyp_irq+0x7c/0x80
> (XEN)    [<000000000024c974>] printk+0x68/0x70
> (XEN)    [<000000000027f7b8>] vgic-v2.c#vgic_v2_distr_mmio_write+0x1b0/0x=
7ac
> (XEN)    [<000000000026ff2c>] try_handle_mmio+0x1ac/0x27c
> (XEN)    [<0000000000279b2c>] traps.c#do_trap_stage2_abort_guest+0x18c/0x=
2d8
> (XEN)    [<000000000027a180>] do_trap_guest_sync+0x10c/0x63c
> (XEN)    [<0000000000265458>] entry.o#guest_sync_slowpath+0xa4/0xd4
> (XEN)=20
> (XEN)=20
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) CPU0: Unexpected Trap: Data Abort
> (XEN) ****************************************
>
>
> On Mon, 22 Feb 2021, no-reply@patchew.org wrote:
>> Hi,
>>=20
>> Patchew automatically ran gitlab-ci pipeline with this patch (series) ap=
plied, but the job failed. Maybe there's a bug in the patches?
>>=20
>> You can find the link to the pipeline near the end of the report below:
>>=20
>> Type: series
>> Message-id: 20210223023428.757694-1-volodymyr_babchuk@epam.com
>> Subject: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
>>=20
>> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
>> #!/bin/bash
>> sleep 10
>> patchew gitlab-pipeline-check -p xen-project/patchew/xen
>> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
>>=20
>> warning: redirecting to https://urldefense.com/v3/__https://gitlab.com/x=
en-project/patchew/xen.git/__;!!GF_29dbcQIUBPA!mJXa6VegCDFete9dsvs4m8Epto5R=
JvSwfsRrESsenHBOJ4yxtj7XSU8QELo6TojcGTFbSRQ$ [gitlab[.]com]
>> warning: redirecting to https://urldefense.com/v3/__https://gitlab.com/x=
en-project/patchew/xen.git/__;!!GF_29dbcQIUBPA!mJXa6VegCDFete9dsvs4m8Epto5R=
JvSwfsRrESsenHBOJ4yxtj7XSU8QELo6TojcGTFbSRQ$ [gitlab[.]com]
>> From https://urldefense.com/v3/__https://gitlab.com/xen-project/patchew/=
xen__;!!GF_29dbcQIUBPA!mJXa6VegCDFete9dsvs4m8Epto5RJvSwfsRrESsenHBOJ4yxtj7X=
SU8QELo6TojcntxRYAg$ [gitlab[.]com]
>>  * [new tag]               patchew/20210223023428.757694-1-volodymyr_bab=
chuk@epam.com -> patchew/20210223023428.757694-1-volodymyr_babchuk@epam.com
>> Switched to a new branch 'test'
>> a569959cc0 alloc pages: enable preemption early
>> c943c35519 arm: traps: try to preempt before leaving IRQ handler
>> 4b634d1924 arm: context_switch: allow to run with IRQs already disabled
>> 7d78d6e861 sched: core: remove ASSERT_NOT_IN_ATOMIC and disable preempti=
on[!]
>> d56302eb03 arm: setup: disable preemption during startup
>> 18a52ab80a preempt: add try_preempt() function
>> 9c4a07d0fa preempt: use atomic_t to for preempt_count
>> 904e59f28e sched: credit2: save IRQ state during locking
>> 3e3726692c sched: rt: save IRQ state during locking
>> c552842efc sched: core: save IRQ state during locking
>>=20
>> =3D=3D=3D OUTPUT BEGIN =3D=3D=3D
>> [2021-02-23 02:38:00] Looking up pipeline...
>> [2021-02-23 02:38:01] Found pipeline 260183774:
>>=20
>> https://urldefense.com/v3/__https://gitlab.com/xen-project/patchew/xen/-=
/pipelines/260183774__;!!GF_29dbcQIUBPA!mJXa6VegCDFete9dsvs4m8Epto5RJvSwfsR=
rESsenHBOJ4yxtj7XSU8QELo6Tojc-d06GNY$ [gitlab[.]com]
>>=20
>> [2021-02-23 02:38:01] Waiting for pipeline to finish...
>> [2021-02-23 02:53:10] Still waiting...
>> [2021-02-23 03:08:19] Still waiting...
>> [2021-02-23 03:23:29] Still waiting...
>> [2021-02-23 03:38:38] Still waiting...
>> [2021-02-23 03:53:48] Still waiting...
>> [2021-02-23 04:08:57] Still waiting...
>> [2021-02-23 04:19:05] Pipeline failed
>> [2021-02-23 04:19:06] Job 'qemu-smoke-x86-64-clang-pvh' in stage 'test' =
is failed
>> [2021-02-23 04:19:06] Job 'qemu-smoke-x86-64-gcc-pvh' in stage 'test' is=
 failed
>> [2021-02-23 04:19:06] Job 'qemu-smoke-x86-64-clang' in stage 'test' is f=
ailed
>> [2021-02-23 04:19:06] Job 'qemu-smoke-x86-64-gcc' in stage 'test' is fai=
led
>> [2021-02-23 04:19:06] Job 'qemu-smoke-arm64-gcc' in stage 'test' is fail=
ed
>> [2021-02-23 04:19:06] Job 'qemu-alpine-arm64-gcc' in stage 'test' is fai=
led
>> [2021-02-23 04:19:06] Job 'alpine-3.12-clang-debug' in stage 'build' is =
failed
>> [2021-02-23 04:19:06] Job 'alpine-3.12-clang' in stage 'build' is failed
>> [2021-02-23 04:19:06] Job 'alpine-3.12-gcc-debug' in stage 'build' is fa=
iled
>> [2021-02-23 04:19:06] Job 'alpine-3.12-gcc' in stage 'build' is failed
>> =3D=3D=3D OUTPUT END =3D=3D=3D
>>=20
>> Test command exited with code: 1


--=20
Volodymyr Babchuk at EPAM=

