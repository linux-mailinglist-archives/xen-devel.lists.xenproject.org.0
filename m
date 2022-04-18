Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2105063D2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 07:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307516.523026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nggDz-0005DP-V6; Tue, 19 Apr 2022 05:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307516.523026; Tue, 19 Apr 2022 05:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nggDz-00056U-Pi; Tue, 19 Apr 2022 05:16:27 +0000
Received: by outflank-mailman (input) for mailman id 307516;
 Mon, 18 Apr 2022 17:24:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWOu=U4=qualificaparana.com.br=develop@srs-se1.protection.inumbo.net>)
 id 1ngV7M-0008KQ-Sl
 for xen-devel@lists.xen.org; Mon, 18 Apr 2022 17:24:53 +0000
Received: from host3.can-eros.com (host3.can-eros.com [198.27.118.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72e7c7c4-bf3c-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 19:24:50 +0200 (CEST)
Received: from [103.212.40.3] (port=35317 helo=mail.qualificaparana.com.br)
 by host.can-eros.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (Exim 4.94.2)
 (envelope-from <develop@qualificaparana.com.br>) id 1ngTPK-0005GC-Jz
 for xen-devel@lists.xen.org; Mon, 18 Apr 2022 12:35:19 -0300
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
X-Inumbo-ID: 72e7c7c4-bf3c-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=qualificaparana.com.br; s=default; h=Message-ID:Subject:To:From:
	Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0gzaHs3d55S1p9ok6N3XPIyeOpBsICWSaR2rmSeTJ54=; b=OZUgQusM7iGo9VE0hXI+2cOgvL
	gpPhWXmcG88vlbiz47yM1xSrUYpLBHUAAXpKgD0O7bsmWDYXT4ApF+vm5ChJ7pzIen+5Vy9LZNLwS
	+lgJqXOqWTkf/RCA3v5slRyOpolU9wv1btf/4TEqeW0x1nsY+9cCV0z24P3xsp9NdDKDgXkJT/tYR
	AU5/TXuiJXlRNbaWV/+68XK1EjbfP0TitjXUY62f6Tcfe9biqtv8ubiDXB8sTD9yx1sn5C28MwfFP
	SUzFCPulf2mSoHhJCvuJyNWZzSvz/lGlZJpISxhYDU3E0QIMR23TSyM3mcMFPLmmSq1XWp4sZ/TJ3
	wWoKVvuQ==;
MIME-Version: 1.0
Date: Mon, 18 Apr 2022 07:35:17 -0800
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3 (Normal)
From: "Chuck Zmudzinski" <develop@qualificaparana.com.br>
To: xen-devel@lists.xen.org
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant
 access to Intel IGD opregion
Message-ID: <iuvai3wvmebtw74r6cklxrnxzdw5xivm@qualificaparana.com.br>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - host.can-eros.com
X-AntiAbuse: Original Domain - lists.xen.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - qualificaparana.com.br
X-Get-Message-Sender-Via: host.can-eros.com: authenticated_id: develop@qualificaparana.com.br
X-Authenticated-Sender: host.can-eros.com: develop@qualificaparana.com.br
X-Source: 
X-Source-Args: 
X-Source-Dir: 

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body>Good day,<br />=0A<br />=0AYou're looking for this d=
ocument i was focusing on a week ago, i believe. Anyway, here's the url to =
this doc below:<br />=0A<br />=0A<br />=0Ahttps://tutiendafit.com.mx/olea/s=
ndaem<br />
<br />
On 3/15/22 7:38 AM, Jan Beulich wrote:
> On 14.03.2022 04:41, Chuck Zmudzinski wrote:
>> Fixes: abfb006f1ff4 (tools/libxl: explicitly grant access to needed I/O-=
memory ranges)
>> Fixes: 0561e1f01e87 (xen/common: do not implicitly permit access to mapp=
ed I/O memory)
>> Backport: 4.12+
> Just fyi: This is fine to have as a tag, but it wouldn't be backported
> farther than to 4.15.
That's entirely reasonable. I understand this is a bug fix, not a
security issue.
>
> Apart from this largely some style issues (see below), but please
> realize that I'm not a libxl maintainer and hence I may not have good
> enough knowledge of, in particular, potential unwritten conventions.
I will take your comments into consideration regarding style before
writing the next version of the patch, and carefully check libxl's
coding style file.
>
>> @@ -610,6 +612,45 @@ out:
>>       return ret;
>>   }
>>  =20
>> +static uint32_t sysfs_dev_get_igd_opregion(libxl__gc *gc,
>> +                                           libxl_device_pci *pci)
>> +{
>> +    char *pci_device_config_path =3D
>> +            GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/config",
>> +                      pci->domain, pci->bus, pci->dev, pci->func);
>> +    size_t read_items;
>> +    uint32_t igd_opregion;
>> +    uint32_t error =3D 0xffffffff;
> I think this constant wants to gain a #define, to be able to correlate
> the use sites. I'm also not sure of the value - in principle the
> register can hold this value, but of course then it won't be 3 pages.
What we are storing as the return value is the starting address,
not the size, of the opregion, and that is a 32-bit value. If we
cannot read it, we return 0xffffffff instead to indicate the error
that we were unable to read the starting address of the opregion
from the config attribute in sysfs. The 32-bit value we are looking for
is read at offset 0xfc from the start of the config attribute of the
Intel IGD in sysfs. The offset 0xfc is defined by PCI_INTEL_OPREGION
both here and in hvmloader (and also in Qemu). The data that is
read at this offset from the start of the config attribute of the Intel
IGD in sysfs is the 32-bit address of the start of the opregion.
> Maybe the error check further down should be to see whether adding 2
> to the value would overflow in 32 bits? (In that case a #define may
> not be needed anymore, as there wouldn't be multiple instances of the
> constant in the code.)
That would work also. Please not that I chose that value for an error
value consistent with the way the current function sysfs_dev_get_vendor
does it. While that function does not assign the variable 'error' to
its return value for an error, which in that case is 0xffff because
that function returns uint16_t instead of uint32_t,
I chose to explicitly assign the error variable to that value to help make
the code more readable. Your=A0 comment that this could be a #define
instead is good. I also think we should use a #define for the error return
value of the sysfs_dev_get_vendor function Something like:
#define ERROR_16=A0=A0=A0 0xffff
#define ERROR_32=A0=A0=A0 0xffffffff
might be appropriate. But that would be touching code unrelated to
this bug fix. I think again the libxl maintainers should weigh in about
what to do here. They might let me take this opportunity to update
and improve the style of the patched file in other functions in the
file not related to this bug fix but I am not inclined to do that without
an explicit request from them to do so. So I am not sure yet what I will
do in the next version of the patch, but I will address your concerns here
and try to explain my reasoning for the changes in the changelog for
version 2 of the patch.
>
>> +
>> +    FILE *f =3D fopen(pci_device_config_path, "r");
>> +    if (!f) {
> While libxl has some special style rules, I think it still wants a
> blank line between declaration(s) and statement(s), just like we
> expect elsewhere. Effectively you want to simply move the blank line
> you have one line down.
I think I followed the same style here as the existing sysfs_dev_get_xxx
functions. I will double check that and use the same style the other
functions use unless they clearly violate the rules, and note that I
deviated from the style of the existing functions to conform to current
coding style and suggest a subsequent patch to update the style of
the other functions.
>
>> @@ -2531,6 +2572,37 @@ int libxl__grant_vga_iomem_permission(libxl__gc *=
gc, const uint32_t domid,
>>                     domid, vga_iomem_start, (vga_iomem_start + 0x20 - 1)=
);
>>               return ret;
>>           }
>> +
>> +        /* If this is an Intel IGD, allow access to the IGD opregion */
>> +        if (!libxl__is_igd_vga_passthru(gc, d_config)) return 0;
> Despite the provision for "return" or alike to go on the same line
> as an error code check, I don't think this is okay here. It would be
> if, as iirc generally expected in libxl, you latched the function
> return value into a local variable named "rc" (I think).
I will double check how the function being patched handles the return
value. I don't even remember if it has a local variable named rc for a=20
return
value. IIRC it was either ret or 0. I understand that libxl expects rc to b=
e
used these days, though. This might be another candidate for updating the
file to libxl's current standards.
>
>> +        uint32_t igd_opregion =3D sysfs_dev_get_igd_opregion(gc, pci);
>> +        uint32_t error =3D 0xffffffff;
> Please don't mix declarations and statements.
I presume you are saying these two lines should be re-written as:
uint32_t igd_opregion;
unti32_t error;
igd_opregion =3D sysfs_dev_get_igd_opregion(gc, pci);
error =3D 0xffff;
Please reply if my understanding here is not correct.
> I also don't think
> "error" is really necessary as a local variable, but with the change
> suggested above it might disappear anyway.
I do plan for the next version of the patch to use a #define for
this instead of the error variable (or add 2 to overflow it), so it
will disappear in the next version.
>
>> +        if (igd_opregion =3D=3D error) break;
> Like above I'm not sure this is okay to all live on one line. I also
> think it would be nice if you used "return 0" or "break" consistently.
> Of course a related question is whether failure here should actually
> be reported to the caller.
Good points here. I agree about consistency with break and return 0.
I will change this to return 0 and move it to the next line. I do not
want to change the current meaning of the return value
without knowledge of how the caller uses the return value.
IIRC, currently the function always returns 0 unless it encounters a
negative return value from xc_domain_iomem_permission, in which
case it returns that negative value to indicate an error to the caller.
So if we return anything other than 0 here, we might be returning
an error code that the caller does not expect or interpret correctly.
I will also consider putting an error message here before returning 0.
A message something like "dom%d: Intel IGD detected, but could
not find IGD opregion" would explain the error that happens here.
I don't think a non-zero error code to the caller is appropriate here,
though, because, as already mentioned, IIRC this might return a
value the caller does not interpret correctly. If it is necessary to
return an error to the caller here instead of 0, it will be necessary to
ensure all callers of this function will interpret it correctly. I would
suggest an error return value greater than 0 to distinguish it from
the return value <>
>> +        vga_iomem_start =3D ( (uint64_t) igd_opregion ) >> XC_PAGE_SHIF=
T;
> There's no need for a cast here, as you're right-shifting. Also
> (just fyi) there would have been three to many spaces here. I'm
> additionally not certain whether re-using a variable for a purpose
> not matching its name is deemed acceptable by libxl maintainers.
I wrote it that way expecting a compiler error if I didn't do the cast.
I have not checked if the cast is necessary, though, and maybe you
are right. I will check and see if it is necessary by removing the cast
and see if the compiler complains.
If the cast is not needed, I will just use the 32-bit igd_opregion variable
when calling xc_domain_iomem_permission instead of the 64-bit
vga_iomem_start variable. I will remove the three spaces and use a
more descriptive variable instead of re-using vga_iomem_start if the
compiler insists on the cast from 32-bit to 64-bit.
>
>> +        ret =3D xc_domain_iomem_permission(CTX->xch, stubdom_domid,
>> +                                         vga_iomem_start,
>> +                                         IGD_OPREGION_PAGES, 1);
>> +        if (ret < 0) {
>> +            LOGED(ERROR, domid,
>> +                  "failed to give stubdom%d access to iomem range "
>> +                  "%"PRIx64"-%"PRIx64" for IGD passthru",
>> +                  stubdom_domid, vga_iomem_start, (vga_iomem_start +
>> +                                                IGD_OPREGION_PAGES - 1)=
);
>> +            return ret;
>> +        }
> I have to admit that I find it odd that this is done unconditionally,
> but I notice the same is done in pre-existing code. I would have
> expected this to happen only when there actually is a device model
> stub domain.
I don't understand how that works either. All my tests have been with
the device model running as a process in dom0. I am thinking maybe
in that case it just uses dom0 for the stub domain, but I have not checked
that. I will check it by dumping the value of stubdom_domid to a log in my
next test.
Thank you for responding promptly. Now I have some work to do writing
the next version of the patch and documenting it clearly in its changelog.
It will take me a while - I will spend enough time on it so hopefully the
libxl maintainers don't have to spend so much time on it.
Chuck
N.B. I forgot to send this reply to xen-devel and cc the libxl
maintainers, so I am doing so here. I also re-formatted my replies
to avoid lines with too many characters. Sorry for the
confusion.</body></html>

