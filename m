Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809B1324FF6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 13:52:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89709.169219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFG6p-0005jB-2Q; Thu, 25 Feb 2021 12:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89709.169219; Thu, 25 Feb 2021 12:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFG6o-0005im-Uc; Thu, 25 Feb 2021 12:51:10 +0000
Received: by outflank-mailman (input) for mailman id 89709;
 Thu, 25 Feb 2021 12:51:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LMls=H3=epam.com=prvs=269023888c=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lFG6n-0005ih-Ay
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 12:51:09 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 228437ab-2635-4c76-b0e9-e5d936f2479f;
 Thu, 25 Feb 2021 12:51:08 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PCoB1A006707; Thu, 25 Feb 2021 12:51:03 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 36x21t9ke0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 12:51:03 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM9PR03MB7043.eurprd03.prod.outlook.com (2603:10a6:20b:2de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 25 Feb
 2021 12:51:01 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.048; Thu, 25 Feb 2021
 12:51:01 +0000
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
X-Inumbo-ID: 228437ab-2635-4c76-b0e9-e5d936f2479f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4CSd6q+nBVh3qwYKL+Pk8TSuULiLAhx8OZyy2tLZZ3/b2AjiqWqDclsuZDYr5k8oDK/ot6nKBMTVVfAdssOQ0CsB0uVZuH94+tqbAcqZBmzBahgtH3rfrJTbs19Xn3J9WP6PlVDfmImFgu55eZXXj8h9trR6a4tJEsDR70fKTJQlhbzRzmmJ+L06m6FgjVjQva+BQwiG01BaTO88w1siNByUYKKx0HfziJClqh4FGvIH4p1BsrwmGsxnad5I1fLExM009bhBLM2olNKJzFVYJmYb1qVrNHN1qJAp9sgV2iEdJ3cBn5cyhZb4VwQyfjQEDbwCZcPRmg6MiN8aGWzcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emP4aFwAMAvIsnQEsPzj4VqUxQYACY1/A2oh3xxnAis=;
 b=ELF9JQoKBpT+/yY+rFz5/lMbeFqi9TrjINogNm/Yo0xj2/bg77AjKSnDXUqtp8qWcvLRp3AmpTTALSfCpJBnjDIF+irxKpRW8tVteX6zPUKQr2i5u+7otdUFhyJWP6wjfKxLyNid7fRbaMFh6U85a1SncFcus3IE4jCCylT2rSVJazfxZcKx1i5lrLrzfb17TTyQfceXrA/jztpT3LXLLfJNymJvrpd8vENDORAm0llNql9FQInyQ+yDFLTVfO86Yq6hGaVHo9PbqWRb/kTvpiw8UF2vau54ck3nLraylPbk1F9kyHBi+dWJiZiuY8AD5QqAIAEFAKWl4/iMQPiofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emP4aFwAMAvIsnQEsPzj4VqUxQYACY1/A2oh3xxnAis=;
 b=vGr9Kirx0+wxnnRBmdt2MGih3W41I1d5FdtdsHvH/s7L47FgLmo1T0n3tR6hQ6n5Xdmq+DkCnJvUCMsP/O05wKNkpLAZz+swI+ppRdrItTeONgOsP6yeE7HElrapZgXLxeB1HuMvaTz7nZ4AEaetiB00thyxAKRHi4TaB6r8Rqw6LrRDn+eTAUa26XdHpXnz61vtm6u7gvVGh7p5qkuuUoWO1bGdj7YR7mNJ5xOy55Ww3G9ilmzBqGeeEXxd9LaCicF8ry7b0JeYhSaTHGltbFgD3vTWVW3X0ZIlCMBgvHkQ2ipTBWKEsFHDpBhlPalklNrWSmXTwcXOgNIHE9/6tg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Julien Grall <julien.grall.oss@gmail.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        George
 Dunlap <george.dunlap@citrix.com>,
        Dario Faggioli <dfaggioli@suse.com>, Meng
 Xu <mengxu@cis.upenn.edu>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Topic: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Index: 
 AQHXCYx4A6OUUHr1gkqxWv1TEOLkuqplchSAgAAzdYCAAXE/AIAAtX0AgAAaNQCAABhvgIAAC3gAgADMQgA=
Date: Thu, 25 Feb 2021 12:51:00 +0000
Message-ID: <87a6rs9uq3.fsf@epam.com>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <e6d8726c-4074-fe4c-dbbe-e879da2bb7f6@xen.org> <87zgzv56pm.fsf@epam.com>
 <c1c55bcb-dfd4-a552-836a-985268655cf1@xen.org> <87o8g99oal.fsf@epam.com>
 <CAJ=z9a0v37rc_B7xVdQECAYd52PJ0UajGzvX1DYP56Q2RXQ2Tw@mail.gmail.com>
 <87eeh59fwi.fsf@epam.com> <28f8ffcc-d2df-438c-4fa8-a8174d897109@citrix.com>
In-Reply-To: <28f8ffcc-d2df-438c-4fa8-a8174d897109@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.15; emacs 27.1
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3ad25d1-1d47-4f62-5f2c-08d8d98c013a
x-ms-traffictypediagnostic: AM9PR03MB7043:
x-microsoft-antispam-prvs: 
 <AM9PR03MB704354D026606DC99DD9AB5DE69E9@AM9PR03MB7043.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wt5zOEfWGZQWXE7kgnuzKh5aIQCDVbz/g/SpA/biRiXbVFCbtuo95+DJzFyVueOpkpq72bLvl/ScVo45rwM/7FOOCgZJ2iYBfvPuECApsMsl6uVK+oo0VaCr9KjFWp3dKOXWQpnP3j+z8gA9K4ecBcl33JnY3l6Rmbp6cL/HF+5p4r6SgehJsRSaqTzxygaSjZhFZQhi3+6x72tN9AzRuHGOXs5iVfCTmBGVsBit10DbfNLIyioi7FYbKkSp/0FEqSaCKvNkaVyWPrRbSijBYy5o+h/FK5hi5gr7YBJxifO5hpgwncffVYGeYx58Zvj+TqaO+MxeQXDioTM0CSkkBia+A42lRZ87SpAVjB/UT48NxscJTm3ayWP1HBUB5ipYM1KFPKHkTP3gjqAlIwg3QQpm9Oqz5mCAXJNoWiNcytftRPUZ+5q3HpUKfN8jD8nJF4x4LtQQkVtbcjOwIpOz+dhh3FqBJdEed7/mQ6wkglgazcw2Y4SgHl0Y9RXo0DaKFNjg7lKrPoDGA7m5Zy+iVA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(6506007)(54906003)(53546011)(71200400001)(86362001)(7416002)(4326008)(2616005)(2906002)(5660300002)(6916009)(76116006)(66476007)(6512007)(186003)(36756003)(8676002)(66556008)(478600001)(55236004)(26005)(8936002)(6486002)(66946007)(64756008)(83380400001)(316002)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?K6iD4EBLxEK5Y57B0/vCMnCu+e+lNo6j6ZuzUAHOfCWWEFAH0HJwHZMVId?=
 =?iso-8859-1?Q?WnBpxVYsTQd7QaLx1Fvp5SDK2EuBQNct1GN+xQDouM1EuA7Zsz1sEjQo8W?=
 =?iso-8859-1?Q?EH1YYE16Sitxz5qxXN0dat51xRL9SiJDGhEQAJ1SVWNQQ2hztlZq+3Q4Ly?=
 =?iso-8859-1?Q?/+oPFAwYuxXg/C8zi0YM31Da7+DK3pG6SQAmN67SZnrtXvm0bj5b6ylNRb?=
 =?iso-8859-1?Q?RxC+Jid98XIEvlzTyjfVwmrqcLvXfaawRFmci5CpWJxm0WAVpDTfYQzzPx?=
 =?iso-8859-1?Q?itpSfoT1o57aAUyiG7xGM6jQgzTM9IdDdqNh58i0HBqEpgZacQhSAKh60v?=
 =?iso-8859-1?Q?aFhPQmTIFuITjczRhAJXPLab6cx1tQPAjmKiLRxyVK5lxe5CpeKgPxQdr7?=
 =?iso-8859-1?Q?+8QrM/6eMC0AFA7KKVFfgnQA/RFaaRo6DIDt4f34k8Qbe3kqilE9EL2/Bz?=
 =?iso-8859-1?Q?9QohD1tZjus9qv/odroPoygcLlzbGlYUG440ZsVDf6pUeSeJvUR8SmakxU?=
 =?iso-8859-1?Q?kaKFGKPpsxBWoZI7Wsr3fztMos6Dg9hjN29AmBrMt7xZtwWrjbqlw2NdJe?=
 =?iso-8859-1?Q?dLl3poHNQEFK9+TQSwE2N02JLNioaMCUJHD17q6G95jsCIEDkgcD4+DxnV?=
 =?iso-8859-1?Q?s2UFq6jgTF1JQMaquDX0ILFEeFZc2lU0DqgVsKIkyaZb2TTki3MYmtoT5k?=
 =?iso-8859-1?Q?Bfd2zgyp02Fk9sS85oF0aA0wpiUSLBsZA9J10++yZLFEYIj6dxa2AtbKiU?=
 =?iso-8859-1?Q?GwrVvBsavSWKy50P3Hx2oUYZ+EX987chA98GME45gwVNmLROj2NhWhJkhg?=
 =?iso-8859-1?Q?KssSaPdw6yhvjuF/yjd0J3tdU5SpzZ5m+v1s/kTFYkLP7CbQSjtAhF84Nd?=
 =?iso-8859-1?Q?HnWN2LNTOJcc0hbsCpf72vUkn+S/LRoJmUAkZPoKnD+1Ymr3IXgGjnDmwy?=
 =?iso-8859-1?Q?Gpvy7+AQ+nZwP9e+WQD/kFUACSNHZnaV3iCxQC2xiOKKtTAv9vpI+jc/pt?=
 =?iso-8859-1?Q?SOeZV/pewKYAQpRgxNXVQj4zr+08O5izm/YgK+N9KI9qHXAjEQq2h9Eaat?=
 =?iso-8859-1?Q?AlaPrOvd9Luufdf+wES+tHn6embb4z59e44lVBKoJ+SYSNbOLyzlz1xxAf?=
 =?iso-8859-1?Q?ZB+4pjT6mP92/lKzfpFZX5sRz9Iam730PyoaPfJT6ms8Jn9Grr5nRpzlbb?=
 =?iso-8859-1?Q?gi1SbEl1o/pBZeZg9qtiRnRo+JdUgCppfnFNto+lbs5bqYU62/faxpznE5?=
 =?iso-8859-1?Q?MRWwRRbTbL6fxfhgLwltP0zNmPEjyC5ryiYgyrxLsWOBp4XZgRxxzfb6qO?=
 =?iso-8859-1?Q?YikaKOLs0fQ4zHz7UxiuB2eN//LnpLGuVdUNGfusggOoIACySFov04s3r6?=
 =?iso-8859-1?Q?g87SRuMAOK?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ad25d1-1d47-4f62-5f2c-08d8d98c013a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2021 12:51:01.1107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MxF/oEllnTF0xD25MWaEKB0eY1MvFur99/gLR8kUgMpDbOj6ntqXnl1fBotfS20qsevPn06yvb/VAtfW8aL0Pof5vXExUxEvxxDc/e06LxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7043
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=961 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102250100


Hi Andrew,

Andrew Cooper writes:

> On 24/02/2021 23:58, Volodymyr Babchuk wrote:
>> And I am not mentioning x86 support there...
>
> x86 uses per-pCPU stacks, not per-vCPU stacks.
>
> Transcribing from an old thread which happened in private as part of an
> XSA discussion, concerning the implications of trying to change this.
>
> ~Andrew
>
> -----8<-----
>
> Here is a partial list off the top of my head of the practical problems
> you're going to have to solve.
>
> Introduction of new SpectreRSB vulnerable gadgets.  I'm really close to
> being able to drop RSB stuffing and recover some performance in Xen.
>
> CPL0 entrypoints need updating across schedule.  SYSCALL entry would
> need to become a stub per vcpu, rather than the current stub per pcpu.
> This requires reintroducing a writeable mapping to the TSS (doable) and
> a shadow stack switch of active stacks (This corner case is so broken it
> looks to be a blocker for CET-SS support in Linux, and is resulting in
> some conversation about tweaking Shstk's in future processors).
>
> All per-cpu variables stop working.  You'd need to rewrite Xen to use
> %gs for TLS which will have churn in the PV logic, and introduce the x86
> architectural corner cases of running with an invalid %gs.  Xen has been
> saved from a large number of privilege escalation vulnerabilities in
> common with Linux and Windows by the fact that we don't use %gs, so
> anyone trying to do this is going to have to come up with some concrete
> way of proving that the corner cases are covered.

Thank you. This is exactly what I needed. I am not a big specialist in
x86, but from what I said, I can see that there is no easy way to switch
contexts while in hypervisor mode.

Then I want to return to a task domain idea, which you mentioned in the
other thread. If I got it right, it would allow to

1. Implement asynchronous hypercalls for cases when there is no reason
to hold calling vCPU in hypervisor for the whole call duration

2. Improve time accounting, as tasklets can be scheduled to run in this
task domain.

I skimmed through ML archives, but didn't found any discussion about it.

As I see it, its implementation would be close to idle domain
implementation, but a little different.

--=20
Volodymyr Babchuk at EPAM=

