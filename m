Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68397A9D57A
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 00:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968716.1358200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8RVY-0002jg-Mz; Fri, 25 Apr 2025 22:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968716.1358200; Fri, 25 Apr 2025 22:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8RVY-0002hP-Ja; Fri, 25 Apr 2025 22:26:56 +0000
Received: by outflank-mailman (input) for mailman id 968716;
 Fri, 25 Apr 2025 22:26:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1RGh=XL=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1u8RVX-0002hE-3f
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 22:26:55 +0000
Received: from outbound.pv.icloud.com
 (p-west1-cluster3-host5-snip4-3.eps.apple.com [57.103.66.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6045f3c3-2224-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 00:26:48 +0200 (CEST)
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
 by outbound.pv.icloud.com (Postfix) with ESMTPS id 969821800229;
 Fri, 25 Apr 2025 22:26:45 +0000 (UTC)
Received: from smtpclient.apple (unknown [17.56.9.36])
 by outbound.pv.icloud.com (Postfix) with ESMTPSA id 6A980180013F;
 Fri, 25 Apr 2025 22:26:44 +0000 (UTC)
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
X-Inumbo-ID: 6045f3c3-2224-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space;
	s=sig1; bh=XUdcBDAnwcqAyZS7yjDAhKBctlhnqJD41jMG068jSwk=;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:To:x-icloud-hme;
	b=Xtp+YGx1etSTNgdAf1Tsr3qyQS/k4CelH+07+U/t55M87jMytYhJrKO87wZGmJAyu
	 y7XdGnJTn9LLZNuT2RrA5Uje4/DY50hLyBD2kKmPY6HavjB4XpP/0BDAW34dz2bJdV
	 D7BZIcM7P5B/sgILtoUb+F5+E0mDQB/SbnjBvuk1L3NgUl79j+brxPzalMcVapuJay
	 a7K4RJb8H4paAbjV3eC9Gfi77+HtrP9RpmLWj2m4gYz4K4veecZ+b0YsxokCoRmbWb
	 uzMnA8JAv7w0Xpa06+CeA2XtZibKG1Hz4InaURM1KnORbFJyWjnJc1S3Wz5IxDebMm
	 dAff5Km1pDu3w==
From: Ariadne Conill <ariadne@ariadne.space>
Message-Id: <0797C187-5814-4C29-B27F-6E74D98260DC@ariadne.space>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_4E344AD7-DF61-4E9B-87DE-DB2FFF9CBABE"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH] x86/hyperv: use dynamically allocated page for hypercalls
Date: Fri, 25 Apr 2025 15:26:33 -0700
In-Reply-To: <9f7ffd79-7439-40f3-9349-4f9f4d2ee1dd@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 "Alexander M . Merritt" <alexander@edera.dev>
To: Jason Andryuk <jason.andryuk@amd.com>
References: <20250425165148.60408-1-ariadne@ariadne.space>
 <9f7ffd79-7439-40f3-9349-4f9f4d2ee1dd@amd.com>
X-Mailer: Apple Mail (2.3826.200.121)


--Apple-Mail=_4E344AD7-DF61-4E9B-87DE-DB2FFF9CBABE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,

> On Apr 25, 2025, at 2:02=E2=80=AFPM, Jason Andryuk =
<jason.andryuk@amd.com> wrote:
>=20
> On 2025-04-25 12:51, Ariadne Conill wrote:
>> Previously Xen placed the hypercall page at the highest possible MFN,
>> but this caused problems on systems where there is more than 36 bits
>> of physical address space.
>> In general, it also seems unreliable to assume that the highest =
possible
>> MFN is not already reserved for some other purpose.
>> Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
>> Cc: Alejandro Vallejo <agarciav@amd.com>
>> Cc: Alexander M. Merritt <alexander@edera.dev>
>> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
>> ---
>>  xen/arch/x86/guest/hyperv/hyperv.c            | 39 =
++++++++++---------
>>  xen/arch/x86/include/asm/fixmap.h             |  3 --
>>  xen/arch/x86/include/asm/guest/hyperv-hcall.h | 12 +++---
>>  xen/arch/x86/include/asm/guest/hyperv-tlfs.h  |  2 +
>>  xen/arch/x86/include/asm/guest/hyperv.h       |  3 --
>>  xen/arch/x86/xen.lds.S                        |  4 --
>>  6 files changed, 28 insertions(+), 35 deletions(-)
>> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c =
b/xen/arch/x86/guest/hyperv/hyperv.c
>> index 6989af38f1..637b4bf335 100644
>> --- a/xen/arch/x86/guest/hyperv/hyperv.c
>> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
>=20
>> @@ -98,10 +97,22 @@ static void __init setup_hypercall_page(void)
>>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>>      if ( !hypercall_msr.enable )
>>      {
>> -        mfn =3D HV_HCALL_MFN;
>> +        hv_hcall_page =3D alloc_xenheap_page();
>> +        if ( !hv_hcall_page )
>> +        {
>> +            printk("Hyper-V: Failed to allocate hypercall trampoline =
page\n");
>=20
> Minor, but maybe panic() here and avoid changing the return type?

Sure, can do that.

>=20
>> +            return -ENOMEM;
>> +        }
>> +
>> +        printk("Hyper-V: Allocated hypercall page @ %p.\n", =
hv_hcall_page);
>> +
>> +        mfn =3D virt_to_mfn(hv_hcall_page);
>>          hypercall_msr.enable =3D 1;
>>          hypercall_msr.guest_physical_address =3D mfn;
>>          wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>> +
>> +        start =3D (unsigned long) hv_hcall_page;
>> +        modify_xen_mappings(start, start + PAGE_SIZE, =
PAGE_HYPERVISOR_RX);
>>      }
>>      else
>>          mfn =3D hypercall_msr.guest_physical_address;
>=20
>> diff --git a/xen/arch/x86/include/asm/guest/hyperv-hcall.h =
b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
>> index b76dbf9ccc..b73edca7c6 100644
>> --- a/xen/arch/x86/include/asm/guest/hyperv-hcall.h
>> +++ b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
>> @@ -20,13 +20,13 @@ static inline uint64_t hv_do_hypercall(uint64_t =
control, paddr_t input_addr,
>>                                         paddr_t output_addr)
>>  {
>>      uint64_t status;
>> -    register unsigned long r8 asm ( "r8" ) =3D output_addr;
>>        /* See TLFS for volatile registers */
>> -    asm volatile ( "call hv_hcall_page"
>> +    asm volatile ( "mov %[output_addr], %%r8\n"
>=20
> Don't you need to list r8 as clobbered?  Or maybe just retain the r8 =
handling above and below to avoid this mov.

This can probably mostly be reverted if we get the fixmap working.

The issue we were facing before was a situation where calling =
hv_hcall_page directly resulted in a page fault due to NX-bit being set =
on the page.

>> +                   "call *%[target_addr]"
>=20
> It might be preferable to retain a direct call which can still be =
installed with __set_fixmap_x.  Otherwise, __set_fixmap_x can be removed

I think we should use fixmap, I just need to figure out what that looks =
like.

Will send v2 patch on Monday.

Ariadne=

--Apple-Mail=_4E344AD7-DF61-4E9B-87DE-DB2FFF9CBABE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;">Hi,<div><div><br><blockquote type=3D"cite"><div>On =
Apr 25, 2025, at 2:02=E2=80=AFPM, Jason Andryuk =
&lt;jason.andryuk@amd.com&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><meta charset=3D"UTF-8"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">On 2025-04-25 12:51, Ariadne Conill =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;">Previously Xen placed the hypercall page at the =
highest possible MFN,<br>but this caused problems on systems where there =
is more than 36 bits<br>of physical address space.<br>In general, it =
also seems unreliable to assume that the highest possible<br>MFN is not =
already reserved for some other purpose.<br>Fixes: 620fc734f854 =
("x86/hyperv: setup hypercall page")<br>Cc: Alejandro Vallejo =
&lt;agarciav@amd.com&gt;<br>Cc: Alexander M. Merritt =
&lt;alexander@edera.dev&gt;<br>Signed-off-by: Ariadne Conill =
&lt;ariadne@ariadne.space&gt;<br>---<br>&nbsp;xen/arch/x86/guest/hyperv/hy=
perv.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 39 =
++++++++++---------<br>&nbsp;xen/arch/x86/include/asm/fixmap.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;3 --<br>&nbsp;xen/arch/x86/include/asm/guest/hyperv-hcall.h | 12 =
+++---<br>&nbsp;xen/arch/x86/include/asm/guest/hyperv-tlfs.h &nbsp;| =
&nbsp;2 +<br>&nbsp;xen/arch/x86/include/asm/guest/hyperv.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;3 =
--<br>&nbsp;xen/arch/x86/xen.lds.S =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;4 --<br>&nbsp;6 files changed, 28 insertions(+), 35 =
deletions(-)<br>diff --git a/xen/arch/x86/guest/hyperv/hyperv.c =
b/xen/arch/x86/guest/hyperv/hyperv.c<br>index 6989af38f1..637b4bf335 =
100644<br>--- a/xen/arch/x86/guest/hyperv/hyperv.c<br>+++ =
b/xen/arch/x86/guest/hyperv/hyperv.c<br></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><blockquote =
type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">@@ -98,10 +97,22 @@ static void __init =
setup_hypercall_page(void)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rdmsrl(HV_X64_=
MSR_HYPERCALL, =
hypercall_msr.as_uint64);<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( =
!hypercall_msr.enable )<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br>- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mfn =3D HV_HCALL_MFN;<br>+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hv_hcall_page =3D =
alloc_xenheap_page();<br>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
( !hv_hcall_page )<br>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br>+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printk("=
Hyper-V: Failed to allocate hypercall trampoline =
page\n");<br></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">Minor, =
but maybe panic() here and avoid changing the return type?</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: =
none;"></div></blockquote><div><br></div>Sure, can do =
that.</div><div><br><blockquote type=3D"cite"><div><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><blockquote =
type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
-ENOMEM;<br>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>+<br>+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printk("Hyper-V: Allocated =
hypercall page @ %p.\n", hv_hcall_page);<br>+<br>+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mfn =3D =
virt_to_mfn(hv_hcall_page);<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;hypercall_msr.enable =3D =
1;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hypercall_msr.=
guest_physical_address =3D =
mfn;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;wrmsrl(HV_X6=
4_MSR_HYPERCALL, hypercall_msr.as_uint64);<br>+<br>+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;start =3D (unsigned long) =
hv_hcall_page;<br>+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;modify_xen_mappings(start, =
start + PAGE_SIZE, =
PAGE_HYPERVISOR_RX);<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;else<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;mfn =3D hypercall_msr.guest_physical_address;<br></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><blockquote =
type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">diff --git a/xen/arch/x86/include/asm/guest/hyperv-hcall.h =
b/xen/arch/x86/include/asm/guest/hyperv-hcall.h<br>index =
b76dbf9ccc..b73edca7c6 100644<br>--- =
a/xen/arch/x86/include/asm/guest/hyperv-hcall.h<br>+++ =
b/xen/arch/x86/include/asm/guest/hyperv-hcall.h<br>@@ -20,13 +20,13 @@ =
static inline uint64_t hv_do_hypercall(uint64_t control, paddr_t =
input_addr,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;paddr_t =
output_addr)<br>&nbsp;{<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint64_t =
status;<br>- &nbsp;&nbsp;&nbsp;register unsigned long r8 asm ( "r8" ) =3D =
output_addr;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* See TLFS =
for volatile registers */<br>- &nbsp;&nbsp;&nbsp;asm volatile ( "call =
hv_hcall_page"<br>+ &nbsp;&nbsp;&nbsp;asm volatile ( "mov =
%[output_addr], %%r8\n"<br></blockquote><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">Don't =
you need to list r8 as clobbered? &nbsp;Or maybe just retain the r8 =
handling above and below to avoid this mov.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: =
none;"></div></blockquote><div><br></div>This can probably mostly be =
reverted if we get the fixmap working.</div><div><br></div><div>The =
issue we were facing before was a situation where calling hv_hcall_page =
directly resulted in a page fault due to NX-bit being set on the =
page.</div><div><br><blockquote type=3D"cite"><div><blockquote =
type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"call =
*%[target_addr]"<br></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">It =
might be preferable to retain a direct call which can still be installed =
with __set_fixmap_x. &nbsp;Otherwise, __set_fixmap_x can be =
removed</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"></div></blockquote><div><br></div>I think we should use fixmap, I =
just need to figure out what that looks =
like.</div><div><br></div><div>Will send v2 patch on =
Monday.</div><div><br></div><div>Ariadne</div></div></body></html>=

--Apple-Mail=_4E344AD7-DF61-4E9B-87DE-DB2FFF9CBABE--

