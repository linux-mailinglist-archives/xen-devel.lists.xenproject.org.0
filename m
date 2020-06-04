Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7231EE904
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 18:59:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgtCq-0006Ny-6K; Thu, 04 Jun 2020 16:59:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VA4X=7R=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jgtCo-0006Nt-LY
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 16:59:02 +0000
X-Inumbo-ID: b0782b76-a684-11ea-81bc-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0782b76-a684-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 16:59:01 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zBxrXxW1NKsizCqIwCu8DyfbL2NqTlo9YvzPdRw8qFYcPe3Tdw9CIXz4DhfKL/jvfLjIcn74JO
 vV8jyOCnX+N0B7DFoUdm4FecGBGEo1L68UQ4BMPJ8bv7iYAI2yb5CP8Y3HKp59g25j01Y8iL8G
 ZgrAsGPLT12/avmeUre+/wsFSSzJ/uO2c5SX0NeVQ1dpjg4koYK59dsuHWlEzoplZSNroehFub
 P4u+tocZO2X+3tZP6/FA55C2BpgA3Os3eH+eQjb4RmhDsXaeYIVf/80Y5m/0xucsTelbqY/BE1
 au8=
X-SBRS: 2.7
X-MesageID: 19499881
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,472,1583211600"; d="scan'208";a="19499881"
From: George Dunlap <George.Dunlap@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Subject: Re: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWOC+BaY+gtpA/Okm3pVStoso6DajFzoEAgALCeQA=
Date: Thu, 4 Jun 2020 16:58:58 +0000
Message-ID: <82519E50-54C5-49F9-9955-D6D23BE636B1@citrix.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <CAJ=z9a2B1+A8jPXiE9adNSTWHENtULnmAxq2M5v6MxB5thZLfw@mail.gmail.com>
 <CAMmSBy_djgfQ1NT2TGo+1=7c20PyX-mzf6JiPx5ibnRkFT_5BQ@mail.gmail.com>
 <alpine.DEB.2.21.2006010911260.12801@sstabellini-ThinkPad-T480s>
 <CAMmSBy_Phfrxdjw1sSxpz-J2Q8h1n9ovp6k9a7Eiqj6HJQUNNA@mail.gmail.com>
In-Reply-To: <CAMmSBy_Phfrxdjw1sSxpz-J2Q8h1n9ovp6k9a7Eiqj6HJQUNNA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E99F0E0EBF34FA41BB4B3F7C2401F2AA@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On Jun 2, 2020, at 11:50 PM, Roman Shaposhnik <roman@zededa.com> wrote:
>=20
> On Mon, Jun 1, 2020 at 9:12 AM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>>=20
>> + George
>>=20
>> On Sun, 31 May 2020, Roman Shaposhnik wrote:
>>> Hi Julien!
>>>=20
>>> On Sun, May 31, 2020 at 3:24 PM Julien Grall <julien.grall.oss@gmail.co=
m> wrote:
>>>>=20
>>>> On Sun, 31 May 2020 at 23:05, Roman Shaposhnik <roman@zededa.com> wrot=
e:
>>>>> Hi!
>>>>>=20
>>>>> with a lot of help from Stefano, we're getting RPi4 support in
>>>>> Project EVE pretty much on par between KVM and Xen.
>>>>>=20
>>>>> One big area that still remains is supporting UEFI boot sequence
>>>>> for DomUs. With KVM, given the qemu virt device model this is
>>>>> as simple as using either stock UEFI build for arm or even U-Boot
>>>>> EFI emulation environment and passing it via -bios option.
>>>>>=20
>>>>> Obviously with Xen on ARM we don't have the device model so
>>>>> my understanding is that the easiest way we can support it would
>>>>> be to port UEFI's OvmfPkg/OvmfXen target to ARM (it seems to
>>>>> be currently exclusively X64).
>>>>=20
>>>> EDK2 has been supporting Xen on Arm for the past 5 years. We don't use
>>>> OvmfPkg/OvmfXen but ArmVirtPkg/ArmVirtXen (see [1]).
>>>> I haven't tried to build it recently, but I should be able to help if
>>>> there is any issue with it.
>>>>=20
>>>> Cheers,
>>>>=20
>>>> [1] https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/ArmVirtXe=
n.fdf
>>>=20
>>> This is really, really awesome -- I guess it would be really helpful to=
 document
>>> this someplace on the ARM/Xen wiki (I can volunteer if someone can gran=
t
>>> me the karma).
>>=20
>> Regarding the wiki: yes please! Let George know if you don't have write =
access.
>=20
> Hey Geroge -- FWIW: my wiki account name is rvs -- please let me know
> once you enable whatever needs to be enabled for my write access.

Hmm, not sure if I have the appropriate permissions yet.  Let me look into =
this.

 -George=

