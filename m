Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2110C34643E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 17:00:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100736.192111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOjQq-0005Hm-Qa; Tue, 23 Mar 2021 15:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100736.192111; Tue, 23 Mar 2021 15:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOjQq-0005HN-NP; Tue, 23 Mar 2021 15:59:00 +0000
Received: by outflank-mailman (input) for mailman id 100736;
 Tue, 23 Mar 2021 15:58:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q7jF=IV=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1lOjQo-0005HI-Om
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 15:58:58 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (unknown
 [40.107.10.112]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab564dd1-ae34-4233-bada-111d9a4ebd40;
 Tue, 23 Mar 2021 15:58:56 +0000 (UTC)
Received: from LOYP265MB1998.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:113::8)
 by LO2P265MB0032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:6a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Tue, 23 Mar
 2021 15:58:55 +0000
Received: from LOYP265MB1998.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c8d3:288b:f514:37fb]) by LOYP265MB1998.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c8d3:288b:f514:37fb%4]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 15:58:55 +0000
Received: from broadband.bt.com (2a00:23c6:751d:7701:63ab:f041:c036:824f) by
 LO2P265CA0334.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Tue, 23 Mar 2021 15:58:54 +0000
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
X-Inumbo-ID: ab564dd1-ae34-4233-bada-111d9a4ebd40
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQVlo5urUQXlqim8nlJ4yuXOAgp65C3FN7SlTHwSM+Cb7fP0l1USM0YyrUIb7E42z2aVOjNwtwAlLSt29RsG9+anjgGGyAdtAzFg3Eg91hp4mNe39xsgDrhwdOiFMGkOGzFn+bXtzwY9QbiRBh29PW//sR7XjoyM0UAifUVTYCrfr+4Y6CBuFor3KRjLWT0V5gjiY4FnGIqhquSDMqPPNxEgtBChVHqbnZd4+gAcS9wfCtHtOanGRYGeQEHsIjyvtou1OEUVjSEkaMy5CV/jLXjHp6xJWdoMtnO/C/YWeeipkeEgU645wtmoVMTBl63XN/zhlyXO6uJoYPP4Vl1tYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXJWkQg2RucF4w7bB9+7xhnq09sNwbk0FJm2HA8euMU=;
 b=cvNdn8kxYbo8E5KRE4b9wWWuHZoB3pVJqrJ23UnwEb0Ku5RArCsZwNeptM7ohcO5qOVWwp+1lILoA/HeyLB943C5o1q8M2wSn8Cu9tzAvdO4TNf1Fns1gvp2s4NhAbQIpI5gTiZkEiis/RJ0fXtwVlogM1YescezG7SqN+4VLnaJf2zD1CdnxBQAws3SsVBQ36xu+qZZ9PGpHPmx+sEZyEVLtdWLu/MBEoq+SjUl7nSwnHrjiEMRnvmjPy2AJiRxL8CQ3UmGZmh7ZQkBl/IMq9F5nza7QiHC8zKHP8DUd8ivb/CvF5sxFDQ1gvMUXHX29kEaHSh5+Mmxi2p0IN65Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXJWkQg2RucF4w7bB9+7xhnq09sNwbk0FJm2HA8euMU=;
 b=E/n1uNc9zkn132pnObSNsDyWa2Qgn5X3CBQJHy6ncLFLtshd6GMKaAoXpzigB3iTuPb6qKlsxzhVEtmKLNo8xqhO2cH4dC3hr8L6AbJkQEmIuDpgdG+DVeCEqo8IP1U2FLaoeGKqSJsW6/Uuid26LlxJfBn4lFL1r6EspQWSyhU=
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none
 header.from=durham.ac.uk;
Date: Tue, 23 Mar 2021 15:58:54 +0000 (GMT)
From: Michael Young <m.a.young@durham.ac.uk>
To: Ian Jackson <iwj@xenproject.org>
cc: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
In-Reply-To: <24665.61470.964721.635678@mariner.uk.xensource.com>
Message-ID: <f13cc06f-3f1f-12ae-fad2-adcdb3726e96@algedi.dur.ac.uk>
References: <20210322133301.11308-1-jandryuk@gmail.com> <c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com> <d410d743-5479-bbf6-676b-c8749ab07c06@citrix.com> <f53db67e-8344-8da7-6658-c521d2e3c527@suse.com> <09b5e7ee-b44b-a8ab-f29d-6617b6af93a0@citrix.com>
 <9b071192-a443-4bdc-8dac-107bbd4a0481@suse.com> <CAKf6xpvGit4YiuTfGuX2iZ1qPi-a+oNK2bassUxGd8qJADEXyQ@mail.gmail.com> <4b0ac6fa-cbe2-5b3c-fa61-52d743e07390@suse.com> <24665.61470.964721.635678@mariner.uk.xensource.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Originating-IP: [2a00:23c6:751d:7701:63ab:f041:c036:824f]
X-ClientProxiedBy: LO2P265CA0334.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::34) To LOYP265MB1998.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:113::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15a22189-970d-4e42-8f36-08d8ee148fa1
X-MS-TrafficTypeDiagnostic: LO2P265MB0032:
X-Microsoft-Antispam-PRVS:
	<LO2P265MB0032FA8D1C34244CFC44268E87649@LO2P265MB0032.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7BVWhRJy+7Vu8sc6wYVXmkg/SF7msm8b/5D2E9LmaTfWXIqu2ZPX+vLqKeqGQ4/60Y9X30tdFBeYLt/V7jD3CswEWAyNyC+OActkQmp+9G+VXUeDOrVIhTVkF1koHe23xkI8Og5Tid2il1ewH0IjVOqrCGmfywFgxSRtfLMYQcAAm0xyDqB6EEuauU/tL9TwhPF0tjLaej67HJpXmTwFnaInaLbuOkc+/5VISvRqPQnPaHl9Zjw4s5U5l+9IBSPDBJSRZOl1m3jK5Gkprb0CSjN2od06sAcxDvyICJZfHgXjCDDDBc3kKID2odUWn1VXQWOj/y2iLJ47DBVL4gDTvZPNGsyT55y1IzQtm9f8+a94fGeyXLRM1Zo4tRigFjx/YXfbCuPSGrLsOfUc5R9d0nWIqeEU454PlfDxxqPgYyGYi8oJlfko3qkx019W64Fh3ZVXGHna5moKwnI451lgydyns0BES+BDzn9Xay6JtjwZJXDJnfDn1+zwoTE7f6IwImsXkQ1wTyLLtSYxetkhYQXr483MIs072AJfkZvb9cOqxWewyC40cMHeaJTMuMznuRWvASYyobPEE3/T6b8d8pchggmaZoyKXRGDHmUPVyA/KfzL77wbGK2durLuOJvcbkUOZYN7gFfqjZQAz56bl9qIZAquvxo9Aznz5DChNrWCObmVTq6V/HKKU1pftPDw95XG46eIrD6iGouh2z5xRtf/UYphY/qVqMbeg46aD6s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOYP265MB1998.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(9686003)(4326008)(6486002)(6512007)(31696002)(52116002)(66556008)(66476007)(38100700001)(6506007)(16526019)(83380400001)(86362001)(498600001)(186003)(54906003)(966005)(8676002)(5660300002)(31686004)(6916009)(53546011)(8936002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?uws7W7CMlJ6ktpHWDD0ACyeOYswM/2R/MlbfiZ0DzcxLkz7X0xRXGEosSzy7?=
 =?us-ascii?Q?hifPiWMbdS9p+VDbKgC/fwfFGfd59ptV6pm2bzNjmXrf5aZT9wurbXl3E7t6?=
 =?us-ascii?Q?CYSk//LHXroocWo9FAH2s5V++8Z3OJrEKLnn1H6rPoghT33xkHTaMGfuMV89?=
 =?us-ascii?Q?BMWw0d1TI+bljuvBInISMGFU5/wVUPbSsZFWKw+tLSI/0seQtsmabrRFesGF?=
 =?us-ascii?Q?IrRj9NLTzuUR/inmPSeXxOXexCLN5zgPrsUFxldrLOkzJLz21GDbYe7Kc0LJ?=
 =?us-ascii?Q?vuooEoHzzJOnSbXLTr9GUDGrBhcsAdwNZEqeqPMLa4liZmBjoSQ/3B4pYUW0?=
 =?us-ascii?Q?PJtcVbthBlpuQfLEe+s6gN29AsoA2F5tOQF7yoggiRKTgJ+5XajT1e82arj5?=
 =?us-ascii?Q?3z2n24LafHBJqJILXCFBHuXLptdcDp1CS3t5oGw7nMiCN6aaMNNoY8S9GAyA?=
 =?us-ascii?Q?0F0xp0x5r8c8rjibgJLya0VrLZ0ZNq+xX6p11HV7T4R0TFo8doScZ2xXy38V?=
 =?us-ascii?Q?os+NR0NVerbFCEH7r1G3E6/kELMmYgIJHtx8+jRFS3mhPe/oOOdnRmMVFMyQ?=
 =?us-ascii?Q?kPma6HOSeGfhqbVPyjDrYXTPTZL+I45S8H/MOYJe1fUO5d8S1OF5vVBkOnee?=
 =?us-ascii?Q?UXQISL4ooP9+2U4EIyMf/49P35VuhPiDJ8gG9k+RVyWubKzoiLpVQ7QpwMsy?=
 =?us-ascii?Q?hcVi3mWLgc5T0B27fqBUJmNOnthQAGlIlA2GhkS2UyselZRnGpEWFUxE0l3Z?=
 =?us-ascii?Q?f2l68gQklcTWGsJGq+ZY0IRzgL/fL4NnvrusoQN2bZG37eVxk0+MWKXCV8VT?=
 =?us-ascii?Q?yFBjr5K+6d1DV6GXNo/BXi8xvy3ePOMTbnZs2Oxlx7psuVHdrRMLfzo19Whb?=
 =?us-ascii?Q?cDERddgZd9xc5PWN/wlUsQFWM7WVev3FD4V+a/S7SXy9DNClvzAeadVzpfz0?=
 =?us-ascii?Q?SaHlWj2YQic8hRGbfqOB7vBCE7bKdN51IUoHdu40a+gGUQKkjZd+GivLxKEr?=
 =?us-ascii?Q?qu5SVEYmn4bNloCNooca1fBhy+LMtSzaqFD5juc5XZNe6iBvNqMQuU4lXAHx?=
 =?us-ascii?Q?7lJdk5rayaAQhIj0s5+F9B7Q+UsC8kv6gvB/cPr0B9DpgeX5QABaOfrMoIVa?=
 =?us-ascii?Q?8HDCbsWjOmwVlnRCOBAPq55Qw8i/jfaQALz5jZnJ4B5jzMUawodDP846dPzK?=
 =?us-ascii?Q?UGvsgz2hKFz8zcbfmmH9IK+bKzFc8cVlsgDaZfJOkKtOGbcBDY2jf/AJ2Ju6?=
 =?us-ascii?Q?t9lJUAQYa3iQ5Bvwd0A5BUaj6iVObw6wNrZhwM9yBPxsrcsk258ytrpKqlLk?=
 =?us-ascii?Q?xI+W5ABx+n31hIIMwMe7xAgWrEjTliBa24ymZ8RPJh2jObjWtU+s1pYxAmKn?=
 =?us-ascii?Q?R0aDu3hK4gQtIsYYTzN72ZJ+8Bd0?=
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a22189-970d-4e42-8f36-08d8ee148fa1
X-MS-Exchange-CrossTenant-AuthSource: LOYP265MB1998.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 15:58:55.2219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6exziuiMK13W77l+BPPlS4ISEtHBKt564vQkUYLgdMHaAD1Dz9TXCXxLbqDUP0qvnXDWEXVptFKNhPmkT+XgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0032



On Tue, 23 Mar 2021, Ian Jackson wrote:

> Jan Beulich writes ("Re: [PATCH] xen: Create EFI_VENDOR directory"):
>> On 23.03.2021 13:34, Jason Andryuk wrote:
> ...
>>> On Fedora, RPMs drop EFI binaries directly into /boot/efi/EFI/fedora/.
>>> grub, shim, fwupdate and xen are all packaged that way.  It seems
>>> reasonable to have those important binaries tracked by the package
>>> manager.
>>>
>>> Does SuSE populate EFI_VENDOR from EFI_DIR when some boot loader
>>> script is called?
>>
>> Yes. And back at the time, when I consulted our EFI person, I was left
>> with the impression that this is the only reasonable approach. The
>> primary reason, as said, was that the EFI partition as a whole may get
>> rebuilt perhaps even from scratch at any point. Hence it's not
>> reasonable to expect package-managed files to live there.
>
> I agree with this analysis but it is for people like Fedora to decide
> how they want to build their packages.
>
> There is also the case of ad-hoc packages (eg our "make debball")
> which the user might reasonably choose to have dump things in the EFI
> system partition.
>
> Conversely, I see no downside to the mkdir.  Jan, is there some actual
> harm in it ?  If not, we should be accomodating to people's build and
> packaging strategies even if we don't entirely approve of them.

There is a request in https://bugzilla.redhat.com/show_bug.cgi?id=1750733 
for xen on Fedora to install the efi file elsewhere and then copy it to 
/boot/efi post install. I could change the current Fedora set up for 
Fedora 35 (which should have xen-4.15) if there is a good reason to do so. 
I am not sure how useful the xen.efi file in /boot/efi is anyway for the 
the Fedora set up as it will generally use a xen*.gz file in /boot via 
grub.

 	Michael Young

