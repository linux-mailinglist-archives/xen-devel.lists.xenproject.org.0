Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D11293175
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 00:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8850.23804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUdsD-0005UT-3q; Mon, 19 Oct 2020 22:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8850.23804; Mon, 19 Oct 2020 22:43:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUdsD-0005U4-0V; Mon, 19 Oct 2020 22:43:25 +0000
Received: by outflank-mailman (input) for mailman id 8850;
 Mon, 19 Oct 2020 22:43:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HaMS=D2=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1kUdsC-0005Tz-88
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 22:43:24 +0000
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cdb63341-1118-4a6c-80ed-b6453e630d9e;
 Mon, 19 Oct 2020 22:43:22 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id q9so1914904iow.6
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 15:43:22 -0700 (PDT)
Received: from ?IPv6:2607:fb90:7a46:92b5:dce5:8829:1020:d33a?
 ([2607:fb90:7a46:92b5:dce5:8829:1020:d33a])
 by smtp.gmail.com with ESMTPSA id b9sm1083408ilq.51.2020.10.19.15.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 15:43:21 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HaMS=D2=gmail.com=persaur@srs-us1.protection.inumbo.net>)
	id 1kUdsC-0005Tz-88
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 22:43:24 +0000
X-Inumbo-ID: cdb63341-1118-4a6c-80ed-b6453e630d9e
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cdb63341-1118-4a6c-80ed-b6453e630d9e;
	Mon, 19 Oct 2020 22:43:22 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id q9so1914904iow.6
        for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 15:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=mxYceR9bLFp686VU0Upx9lU0iujDWt5Dv/uOnwECcMo=;
        b=DDDiaDKDFslmiyNR1q/FEVkm9rAoIYg2dEwPttACcX3YVQg8aopCES/6PogKl4x8/A
         khiRjptOcv0tJuEK1rP9uIZh8pvCmWMnlnmJBH1XYXQqQ8SNuABEMi10opp9L+Cho0p3
         zlap8/JIZNMDzfpNbUPnhq5Tr6XVh76xE03urffRkSB1/gmB2+mRq8whkrW6F+asuwE3
         alhOiMYCPNtRtvXt7dPvPA0UrXiSmTI1yNdI6hxjYtILw+g6EycJLBjSXBNYkVtZK5Gu
         VxfVIKuijpkTMpIs18Ua4p9VfqH7tq1vzD2xzJy07coKdN2NvKClIQUZ/90nYpXgaZQ7
         f18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=mxYceR9bLFp686VU0Upx9lU0iujDWt5Dv/uOnwECcMo=;
        b=LqHy4tzGNGY4yik9bLf22dhGIfMKxarnTndhrK8h6qrhptzOtSEiciuBCeWFY5yNkQ
         mIoS1ghHtzpbrAfgFEyiJHIgOWSaDSWVyfr2m94ikcpcoafwJWSczDshraGey+SNnVhn
         089iukQ5hdNzWS3qzOIsWFh+pWUmgywsAlwYnOa3dKPfpFfxj3oRRRrzGgvy3A5bZZNL
         +6aRB9NodatnQDM+Ry1gkwx0sAmeIUV2ifqi0F2kyBxJ7BKeq2jNEWCUFhbmq928OLJa
         kWnF7ZtfGQCmMGs2XqGfP3QIuwatL3nRlFk6ztCNsoovCUdtldcMAq91K2LKd8KpLlPg
         8fHg==
X-Gm-Message-State: AOAM531S8f09lLQH6URyKycsYBr8DgjeyPQtR1LcuET9d8Po4WrGfsvO
	ZWb27kmbtDsyn/gpGu0NnMI=
X-Google-Smtp-Source: ABdhPJyerB03H51qpTEmoM9XMfJDy0SqyXQtM3B5zxanvr+z8xrZFIQm0YiEZSo0/bPdMOhzBgPQIg==
X-Received: by 2002:a6b:7511:: with SMTP id l17mr1369099ioh.199.1603147402299;
        Mon, 19 Oct 2020 15:43:22 -0700 (PDT)
Received: from ?IPv6:2607:fb90:7a46:92b5:dce5:8829:1020:d33a? ([2607:fb90:7a46:92b5:dce5:8829:1020:d33a])
        by smtp.gmail.com with ESMTPSA id b9sm1083408ilq.51.2020.10.19.15.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2020 15:43:21 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI flr/slot/bus reset with 'reset' SysFS attribute
Date: Mon, 19 Oct 2020 18:43:20 -0400
Message-Id: <6D51F096-C247-486B-B4A2-50F85855EA06@gmail.com>
References: <2d2693c9-f2a9-7914-7362-947a61c28acd@alstadheim.priv.no>
Cc: Wei Liu <wl@xen.org>,
 =?utf-8?Q?Pasi_K=C3=A4rkk=C3=A4inen?= <pasik@iki.fi>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Jan Beulich <jbeulich@suse.com>, bhelgaas@google.com,
 Roger Pau Monne <roger.pau@citrix.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Anthony Perard <anthony.perard@citrix.com>
In-Reply-To: <2d2693c9-f2a9-7914-7362-947a61c28acd@alstadheim.priv.no>
To: =?utf-8?Q?H=C3=A5kon_Alstadheim?= <hakon@alstadheim.priv.no>,
 George Dunlap <George.Dunlap@citrix.com>
X-Mailer: iPhone Mail (18A393)

On Oct 19, 2020, at 11:52, H=C3=A5kon Alstadheim <hakon@alstadheim.priv.no> w=
rote:
>=20
> =EF=BB=BF
> Den 19.10.2020 17:16, skrev H=C3=A5kon Alstadheim:
>> Den 19.10.2020 13:00, skrev George Dunlap:
>>>=20
>>>> On Jan 31, 2020, at 3:33 PM, Wei Liu <wl@xen.org> wrote:
>>>>=20
>>>> On Fri, Jan 17, 2020 at 02:13:04PM -0500, Rich Persaud wrote:
>>>>> On Aug 26, 2019, at 17:08, Pasi K=C3=A4rkk=C3=A4inen <pasik@iki.fi> wr=
ote:
>>>>>> =EF=BB=BFHi,
>>>>>>=20
>>>>>>> On Mon, Oct 08, 2018 at 10:32:45AM -0400, Boris Ostrovsky wrote:
>>>>>>>> On 10/3/18 11:51 AM, Pasi K=C3=A4rkk=C3=A4inen wrote:
>>>>>>>> On Wed, Sep 19, 2018 at 11:05:26AM +0200, Roger Pau Monn=C3=A9 wrot=
e:
>>>>>>>>> On Tue, Sep 18, 2018 at 02:09:53PM -0400, Boris Ostrovsky wrote:
>>>>>>>>>> On 9/18/18 5:32 AM, George Dunlap wrote:
>>>>>>>>>>>> On Sep 18, 2018, at 8:15 AM, Pasi K=C3=A4rkk=C3=A4inen <pasik@i=
ki.fi> wrote:
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>> On Mon, Sep 17, 2018 at 02:06:02PM -0400, Boris Ostrovsky wrot=
e:
>>>>>>>>>>>>>> What about the toolstack changes? Have they been accepted? I v=
aguely
>>>>>>>>>>>>>> recall there was a discussion about those changes but don't r=
emember how
>>>>>>>>>>>>>> it ended.
>>>>>>>>>>>>> I don't think toolstack/libxl patch has been applied yet eithe=
r.
>>>>>>>>>>>>> "[PATCH V1 0/1] Xen/Tools: PCI reset using 'reset' SysFS attri=
bute":
>>>>>>>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00664=
.html=20
>>>>>>>>>>>>> "[PATCH V1 1/1] Xen/libxl: Perform PCI reset using 'reset' Sys=
FS attribute":
>>>>>>>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00663=
.html=20
>>>>>>>>>>> Will this patch work for *BSD? Roger?
>>>>>>>>>> At least FreeBSD don't support pci-passthrough, so none of this w=
orks
>>>>>>>>>> ATM. There's no sysfs on BSD, so much of what's in libxl_pci.c wi=
ll
>>>>>>>>>> have to be moved to libxl_linux.c when BSD support is added.
>>>>>>>>> Ok. That sounds like it's OK for the initial pci 'reset' implement=
ation in xl/libxl to be linux-only..
>>>>>>>> Are these two patches still needed? ISTR they were written original=
ly
>>>>>>>> to deal with guest trying to use device that was previously assigne=
d to
>>>>>>>> another guest. But pcistub_put_pci_dev() calls
>>>>>>>> __pci_reset_function_locked() which first tries FLR, and it looks l=
ike
>>>>>>>> it was added relatively recently.
>>>>>>> Replying to an old thread.. I only now realized I forgot to reply to=
 this message earlier.
>>>>>>>=20
>>>>>>> afaik these patches are still needed. H=C3=A5kon (CC'd) wrote to me i=
n private that
>>>>>>> he gets a (dom0) Linux kernel crash if he doesn't have these patches=
 applied.
>>>>>>>=20
>>>>>>>=20
>>>>>>> Here are the links to both the linux kernel and libxl patches:
>>>>>>>=20
>>>>>>>=20
>>>>>>> "[Xen-devel] [PATCH V3 0/2] Xen/PCIback: PCI reset using 'reset' Sys=
FS attribute":
>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00659.html
>>>>>>>=20
>>>>>>> [Note that PATCH V3 1/2 "Drivers/PCI: Export pcie_has_flr() interfac=
e" is already applied in upstream linux kernel, so it's not needed anymore]
>>>>>>>=20
>>>>>>> "[Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI flr/slot/bus r=
eset with 'reset' SysFS attribute":
>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00661.html
>>>>>>>=20
>>>>>>>=20
>>>>>>> "[Xen-devel] [PATCH V1 0/1] Xen/Tools: PCI reset using 'reset' SysFS=
 attribute":
>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00664.html
>>>>>>>=20
>>>>>>> "[Xen-devel] [PATCH V1 1/1] Xen/libxl: Perform PCI reset using 'rese=
t' SysFS attribute":
>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00663.html
>>>>>> [dropping Linux mailing lists]
>>>>>>=20
>>>>>> What is required to get the Xen patches merged?  Rebasing against Xen=

>>>>>> master?  OpenXT has been carrying a similar patch for many years and
>>>>>> we would like to move to an upstream implementation.  Xen users of PC=
I
>>>>>> passthrough would benefit from more reliable device reset.
>>>>> Rebase and resend?
>>>>>=20
>>>>> Skimming that thread I think the major concern was backward
>>>>> compatibility. That seemed to have been addressed.
>>>>>=20
>>>>> Unfortunately I don't have the time to dig into Linux to see if the
>>>>> claim there is true or not.
>>>>>=20
>>>>> It would be helpful to write a concise paragraph to say why backward
>>>>> compatibility is not required.
>>> Just going through my old =E2=80=9Cmake sure something happens with this=
=E2=80=9D mails.  Did anything ever happen with this?  Who has the ball here=
 / who is this stuck on?
>>=20
>> We're waiting for "somebody" to testify that fixing this will not adverse=
ly affect anyone. I'm not qualified, but my strong belief is that since "res=
et" or "do_flr"  in the linux kernel is not currently implemented/used in an=
y official distribution, it should be OK.
>>=20
>> Patches still work in current staging-4.14 btw.
>>=20
> Just for the record, attached are the patches I am running on top of linux=
 gentoo-sources-5.9.1  and xen-staging-4.14 respectively. (I am also running=
 with the patch to mark populated reserved memory that contains ACPI tables a=
s "ACPI NVS", not attached here ).
>=20
> <pci_brute_reset-home-hack.patch>
> <pci_brute_reset-home-hack-doc.patch>
> <pci-reset-min-egen.patch>

Is there any reason not to merge the Xen patch, while waiting for the Linux p=
atch to be upstreamed?  Similar versions have been deployed in downstream pr=
oduction systems for years, we can at least de-dupe those Xen patches.

Do (can) we have an in-tree location to queue Xen-relevant Linux patches whi=
le they go through an upstreaming process that may last several (5+ here) ye=
ars?

Rich=

