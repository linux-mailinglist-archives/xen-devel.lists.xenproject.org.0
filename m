Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB58412F17
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191379.341375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSZu2-0000N9-32; Tue, 21 Sep 2021 07:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191379.341375; Tue, 21 Sep 2021 07:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSZu1-0000LH-Ut; Tue, 21 Sep 2021 07:09:17 +0000
Received: by outflank-mailman (input) for mailman id 191379;
 Tue, 21 Sep 2021 07:09:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x95K=OL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSZtz-0000LB-U4
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:09:15 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3953202-1aaa-11ec-b89e-12813bfff9fa;
 Tue, 21 Sep 2021 07:09:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B3CB220E2;
 Tue, 21 Sep 2021 07:09:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 41B2B13B97;
 Tue, 21 Sep 2021 07:09:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8aTBDhmFSWFRfQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Sep 2021 07:09:13 +0000
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
X-Inumbo-ID: d3953202-1aaa-11ec-b89e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632208153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NFGnYauoZVnKeDnza/GotQs/rD+/zDVxEoO8ELpY84c=;
	b=p2bsao8AkBXvRYuNGYYHVxz3c45T5B2FpFbYCFPP9DiUfiU7efiqAKij99/tZgwtYjdd80
	pofwGfOhaCvVrWYcEtHlQe7CXwSuc54oBwdFkIOGL5tk3sea/KNn0lv4AIitU9ucsHiq8K
	fXpzc0G30XmOFd4Wad539lIY2rtVWDc=
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "julien@xen.org" <julien@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
References: <20210917130123.1764493-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s>
 <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com>
 <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com>
 <7f873e38-0362-1f60-7347-a490c9dc8572@epam.com>
 <alpine.DEB.2.21.2109201444040.17979@sstabellini-ThinkPad-T480s>
 <0f31a1bf-62b1-1aef-7b0f-34a1f6985fdb@suse.com>
 <82e55df9-74d3-6365-ab29-2bdfc4b74a1f@epam.com>
 <9b4962de-61ef-44dc-ffca-c54dd7990c6a@suse.com>
 <a9b98bc4-4c8a-2e7e-6abf-3a68025059c4@epam.com>
 <bb9fa2a8-9cc2-d83c-3659-c66b37781470@suse.com>
 <0b83aa77-aef0-0d98-cc0b-cf5f9c7599bd@epam.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
Message-ID: <111389e7-855d-0023-092c-f3e8bc57f4af@suse.com>
Date: Tue, 21 Sep 2021 09:09:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <0b83aa77-aef0-0d98-cc0b-cf5f9c7599bd@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gLQExX6LE8n8XrYC4Tp16QR4nWR6z0Lu8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gLQExX6LE8n8XrYC4Tp16QR4nWR6z0Lu8
Content-Type: multipart/mixed; boundary="c6BTbCTwWNpsYNT0QhNxqruPTgCxDXXHQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "julien@xen.org" <julien@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <111389e7-855d-0023-092c-f3e8bc57f4af@suse.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
References: <20210917130123.1764493-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s>
 <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com>
 <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com>
 <7f873e38-0362-1f60-7347-a490c9dc8572@epam.com>
 <alpine.DEB.2.21.2109201444040.17979@sstabellini-ThinkPad-T480s>
 <0f31a1bf-62b1-1aef-7b0f-34a1f6985fdb@suse.com>
 <82e55df9-74d3-6365-ab29-2bdfc4b74a1f@epam.com>
 <9b4962de-61ef-44dc-ffca-c54dd7990c6a@suse.com>
 <a9b98bc4-4c8a-2e7e-6abf-3a68025059c4@epam.com>
 <bb9fa2a8-9cc2-d83c-3659-c66b37781470@suse.com>
 <0b83aa77-aef0-0d98-cc0b-cf5f9c7599bd@epam.com>
In-Reply-To: <0b83aa77-aef0-0d98-cc0b-cf5f9c7599bd@epam.com>

--c6BTbCTwWNpsYNT0QhNxqruPTgCxDXXHQ
Content-Type: multipart/mixed;
 boundary="------------C8E28F828DBD3E67C23C44A3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C8E28F828DBD3E67C23C44A3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 21.09.21 09:00, Oleksandr Andrushchenko wrote:
>=20
> On 21.09.21 09:49, Juergen Gross wrote:
>> On 21.09.21 08:38, Oleksandr Andrushchenko wrote:
>>>
>>> On 21.09.21 09:07, Juergen Gross wrote:
>>>> On 21.09.21 07:51, Oleksandr Andrushchenko wrote:
>>>>>
>>>>> On 21.09.21 08:20, Juergen Gross wrote:
>>>>>> On 21.09.21 01:16, Stefano Stabellini wrote:
>>>>>>> On Mon, 20 Sep 2021, Oleksandr Andrushchenko wrote:
>>>>>>>> On 20.09.21 14:30, Juergen Gross wrote:
>>>>>>>>> On 20.09.21 07:23, Oleksandr Andrushchenko wrote:
>>>>>>>>>> Hello, Stefano!
>>>>>>>>>>
>>>>>>>>>> On 18.09.21 00:45, Stefano Stabellini wrote:
>>>>>>>>>>> Hi Oleksandr,
>>>>>>>>>>>
>>>>>>>>>>> Why do you want to enable pciback on ARM? Is it only to "disa=
ble" a PCI
>>>>>>>>>>> device in Dom0 so that it can be safely assigned to a DomU?
>>>>>>>>>> Not only that
>>>>>>>>>>>
>>>>>>>>>>> I am asking because actually I don't think we want to enable =
the PV PCI
>>>>>>>>>>> backend feature of pciback on ARM, right? That would clash wi=
th the PCI
>>>>>>>>>>> assignment work you have been doing in Xen. They couldn't bot=
h work at
>>>>>>>>>>> the same time.
>>>>>>>>>> Correct, it is not used
>>>>>>>>>>>
>>>>>>>>>>> If we only need pciback to "park" a device in Dom0, wouldn't =
it be
>>>>>>>>>>> possible and better to use pci-stub instead?
>>>>>>>>>>
>>>>>>>>>> Not only that, so pci-stub is not enough
>>>>>>>>>>
>>>>>>>>>> The functionality which is implemented by the pciback and the =
toolstack
>>>>>>>>>> and which is relevant/missing/needed for ARM:
>>>>>>>>>>
>>>>>>>>>> 1. pciback is used as a database for assignable PCI devices, e=
=2Eg. xl
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 pci-assignable-{add|rem=
ove|list} manipulates that list. So, whenever the
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 toolstack needs to know=
 which PCI devices can be passed through it reads
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 that from the relevant =
sysfs entries of the pciback.
>>>>>>>>>>
>>>>>>>>>> 2. pciback is used to hold the unbound PCI devices, e.g. when =
passing through
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 a PCI device it needs t=
o be unbound from the relevant device driver and bound
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 to pciback (strictly sp=
eaking it is not required that the device is bound to
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 pciback, but pciback is=
 again used as a database of the passed through PCI
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 devices, so we can re-b=
ind the devices back to their original drivers when
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 guest domain shuts down=
)
>>>>>>>>>>
>>>>>>>>>> 3. Device reset
>>>>>>>>>>
>>>>>>>>>> We have previously discussed on xen-devel ML possible solution=
s to that as from the
>>>>>>>>>> above we see that pciback functionality is going to be only pa=
rtially used on Arm.
>>>>>>>>>>
>>>>>>>>>> Please see [1] and [2]:
>>>>>>>>>>
>>>>>>>>>> 1. It is not acceptable to manage the assignable list in Xen i=
tself
>>>>>>>>>>
>>>>>>>>>> 2. pciback can be split into two parts: PCI assignable/bind/re=
set handling and
>>>>>>>>>> the rest like vPCI etc.
>>>>>>>>>>
>>>>>>>>>> 3. pcifront is not used on Arm
>>>>>>>>>
>>>>>>>>> It is neither in x86 PVH/HVM guests.
>>>>>>>> Didn't know that, thank you for pointing
>>>>>>>>>
>>>>>>>>>> So, limited use of the pciback is one of the bricks used to en=
able PCI passthrough
>>>>>>>>>> on Arm. It was enough to just re-structure the driver and have=
 it run on Arm to achieve
>>>>>>>>>> all the goals above.
>>>>>>>>>>
>>>>>>>>>> If we still think it is desirable to break the pciback driver =
into "common" and "pcifront specific"
>>>>>>>>>> parts then it can be done, yet the patch is going to be the ve=
ry first brick in that building.
>>>>>>>>>
>>>>>>>>> Doing this split should be done, as the pcifront specific part =
could be
>>>>>>>>> omitted on x86, too, in case no PV guests using PCI passthrough=
 have to
>>>>>>>>> be supported.
>>>>>>>> Agree, that the final solution should have the driver split
>>>>>>>>>
>>>>>>>>>> So, I think this patch is still going to be needed besides whi=
ch direction we take.
>>>>>>>>>
>>>>>>>>> Some kind of this patch, yes. It might look different in case t=
he split
>>>>>>>>> is done first.
>>>>>>>>>
>>>>>>>>> I don't mind doing it in either sequence.
>>>>>>>>>
>>>>>>>> With this patch we have Arm on the same page as the above mentio=
ned x86 guests,
>>>>>>>>
>>>>>>>> e.g. the driver has unused code, but yet allows Arm to function =
now.
>>>>>>>>
>>>>>>>> At this stage of PCI passthrough on Arm it is yet enough. Long t=
erm, when
>>>>>>>>
>>>>>>>> the driver gets split, Arm will benefit from that split too, but=
 unfortunately I do not
>>>>>>>>
>>>>>>>> have enough bandwidth for that piece of work at the moment.
>>>>>>>
>>>>>>> That's fair and I don't want to scope-creep this simple patch ask=
ing for
>>>>>>> an enormous rework. At the same time I don't think we should enab=
le the
>>>>>>> whole of pciback on ARM because it would be erroneous and confusi=
ng.
>>>>>
>>>>> As the first stage before the driver is split or ifdef's used - can=
 we take the patch
>>>>> as is now? In either way we chose this needs to be done, e.g. enabl=
e compiling
>>>>> for other architectures and common code move.
>>>>
>>>> Fine with me in principle. I need to take a more thorough look
>>>> at the patch, though.
>>> Of course
>>>>
>>>>>
>>>>>>>
>>>>>>> I am wonder if there is a simple:
>>>>>>>
>>>>>>> if (!xen_pv_domain())
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>>>>
>>>>>>> That we could add in a couple of places in pciback to stop it fro=
m
>>>>>>> initializing the parts we don't care about. Something along these=
 lines
>>>>>>> (untested and probably incomplete).
>>>>>>>
>>>>>>> What do you guys think?
>>>>>>
>>>>>> Uh no, not in this way, please. This will kill pci passthrough on =
x86
>>>>>> with dom0 running as PVH. I don't think this is working right now,=
 but
>>>>>> adding more code making it even harder to work should be avoided.
>>>>>>
>>>>>>> diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-p=
ciback/xenbus.c
>>>>>>> index da34ce85dc88..991ba0a9b359 100644
>>>>>>> --- a/drivers/xen/xen-pciback/xenbus.c
>>>>>>> +++ b/drivers/xen/xen-pciback/xenbus.c
>>>>>>> @@ -15,6 +15,7 @@
>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <xen/xenbus.h>
>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <xen/events.h>
>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <xen/pci.h>
>>>>>>> +#include <xen/xen.h>
>>>>>>>  =C2=A0=C2=A0=C2=A0 #include "pciback.h"
>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0 #define INVALID_EVTCHN_IRQ=C2=A0 (-1)
>>>>>>> @@ -685,8 +686,12 @@ static int xen_pcibk_xenbus_probe(struct xen=
bus_device *dev,
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct xenbus_devi=
ce_id *id)
>>>>>>>  =C2=A0=C2=A0=C2=A0 {
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err =3D 0;
>>>>>>> -=C2=A0=C2=A0=C2=A0 struct xen_pcibk_device *pdev =3D alloc_pdev(=
dev);
>>>>>>> +=C2=A0=C2=A0=C2=A0 struct xen_pcibk_device *pdev;
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!xen_pv_domain())
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>  =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 pdev =3D alloc_pdev(dev);=

>>>>>>
>>>>>> This hunk isn't needed, as with bailing out of xen_pcibk_xenbus_re=
gister
>>>>>> early will result in xen_pcibk_xenbus_probe never being called.
>>>>>>
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pdev =3D=3D NULL)=
 {
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 err =3D -ENOMEM;
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 xenbus_dev_fatal(dev, err,
>>>>>>> @@ -743,6 +748,9 @@ const struct xen_pcibk_backend *__read_mostly=
 xen_pcibk_backend;
>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0 int __init xen_pcibk_xenbus_register(v=
oid)
>>>>>>>  =C2=A0=C2=A0=C2=A0 {
>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!xen_pv_domain())
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>> +
>>>>>>
>>>>>> Use #ifdef CONFIG_X86 instead.
>>>>>
>>>>> The title of this patch says that we want to allow this driver for =
other archs
>>>>> and now we want to introduce "#ifdef CONFIG_X86" which doesn't soun=
d
>>>>> right with that respect. Instead, we may want having something like=
 a
>>>>> dedicated gate for this, e.g. "#ifdef CONFIG_XEN_PCIDEV_BACKEND_SUP=
P_PV"
>>>>> or something which is architecture agnostic.
>>>>
>>>> Something like that, yes. But I'd rather use CONFIG_XEN_PCIDEV_BACKE=
ND
>>>> acting as this gate and introduce CONFIG_XEN_PCI_STUB for the stub
>>>> functionality needed on Arm. XEN_PCIDEV_BACKEND would depend on X86 =
and
>>>> select XEN_PCI_STUB, while on Arm XEN_PCI_STUB could be configured i=
f
>>>> wanted. The splitting of the driver can still be done later.
>>>
>>> Hm, pciback is now compiled when CONFIG_XEN_PCIDEV_BACKEND=C2=A0 is e=
nabled
>>> and we want to skip some parts of its code when CONFIG_XEN_PCI_STUB i=
s set.
>>> So, I imagine that for x86 we just enable CONFIG_XEN_PCIDEV_BACKEND a=
nd the
>>> driver compiles in its current state. For Arm we enable both CONFIG_X=
EN_PCIDEV_BACKEND
>>> and CONFIG_XEN_PCI_STUB, so part of the driver is not compiled.
>>
>> No, I'd rather switch to compiling xen-pciback when CONFIG_XEN_PCI_STU=
B
>> is set and compile only parts of it when CONFIG_XEN_PCIDEV_BACKEND is
>> not set (this will be the case on Arm).
>=20
> But this will require that the existing kernel configurations out there=
 have to additionally=20
> define CONFIG_XEN_PCI_STUB to get what they had before with simply enab=
ling=20
> CONFIG_XEN_PCIDEV_BACKEND. My point was that it is probably desirable n=
ot to break
> the things while doing the split/re-work.

By letting XEN_PCIDEV_BACKEND select XEN_PCI_STUB this won't happen.

> I also thought that "compile only parts of it when CONFIG_XEN_PCIDEV_BA=
CKEND is not set"
> may have more code gated rather than with gating unwanted code with CON=
FIG_XEN_PCI_STUB.
> I am not quite sure about this though.

This would be a very weird semantics of XEN_PCI_STUB, as the stub part
is needed on X86 and on Arm.

Gating could even be done with Stefano's patch just by replacing his
"!xen_pv_domain()" tests with "!IS_ENABLED(CONFIG_XEN_PCIDEV_BACKEND)".


Juergen

--------------C8E28F828DBD3E67C23C44A3
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------C8E28F828DBD3E67C23C44A3--

--c6BTbCTwWNpsYNT0QhNxqruPTgCxDXXHQ--

--gLQExX6LE8n8XrYC4Tp16QR4nWR6z0Lu8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFJhRgFAwAAAAAACgkQsN6d1ii/Ey+x
1Af8CI2CUTWu83OFQy9/F1W5GVgM4CKCqlQuW0ueF5VNpGE2pCyviSCK262OwuA6kTmxEtQnhBWG
mK3jPiOPux6UsdXRc04rzcVinU+OiLa8Hmg2HT8u6hujp7nafTYrzzHDEkMgknuCaJ6PH7yPDxsl
eQE54xzLeJSBlodGnrecaK1nqXUEaOBgo32vnXfvGpvYAt/7f1sZWW0i/syivzTJVa/Gj7ugWv5R
9iKAnG6GV23FhR0/b8dQRdKUsXAHz9SN0LIEeUzydAfEvjvSylkc/E94cMDKc+rbedz0x7lipV4l
l7dkiYusgU6lcr5KSy4LwZyG3v782BOatJr42N9fzQ==
=Y366
-----END PGP SIGNATURE-----

--gLQExX6LE8n8XrYC4Tp16QR4nWR6z0Lu8--

