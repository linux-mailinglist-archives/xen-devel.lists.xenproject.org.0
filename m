Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D420E4856
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 12:14:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNwYX-0004p3-8s; Fri, 25 Oct 2019 10:10:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0Vyi=YS=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1iNwYV-0004oy-Hh
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 10:10:51 +0000
X-Inumbo-ID: b51140d4-f70f-11e9-beca-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b51140d4-f70f-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 10:10:46 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:687b:c909:9c42:5397])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 52C97200080;
 Fri, 25 Oct 2019 21:10:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1571998242; bh=VMrJtprEymQsWpuNKcCMo5UuCf+C/wKoan2syHo2q54=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=s/9Zar4qOdep+OpIQtF/M3TgwF1cFcx2sVeTj26xmIIgx5tu/x1NJguDqcuiO8Wfv
 h02rhI4n0KW94WL6zaV0wQPuXF9viVaFDxTP3i7WBQR2np/iI2m0sus7PbU9eRWdNL
 bWoao0ZmFx2xvSkqZZggv8k26UyOkilTLzuXLKas=
Date: Fri, 25 Oct 2019 21:10:37 +1100
From: Steven Haigh <netwiz@crc.id.au>
To: Jan Beulich <jbeulich@suse.com>
Message-Id: <1571998237.2574.0@crc.id.au>
In-Reply-To: <8fdbc94b-a333-a4ba-146e-e1b853655a79@suse.com>
References: <1571918276.2606.0@crc.id.au>
 <CACCGGhBUx6AHfF2wJkQ3=M2OVDuLgR+Q4WBLCJE3Rb7-r3fRRQ@mail.gmail.com>
 <0dcf51532bdcde284d42c90780f57c97@crc.id.au>
 <82cb0edff0fb69d470a8374f5595e052@crc.id.au>
 <8fdbc94b-a333-a4ba-146e-e1b853655a79@suse.com>
X-Mailer: geary/3.34.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-DRTQUhYWMvAz9B5nICLb"
Subject: Re: [Xen-devel] Debugging Windows HVM crashes on Ryzen 3xxx series
 CPUs.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=-DRTQUhYWMvAz9B5nICLb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

# patch -p1 < ../000-debug-patch-0.patch
patching file xen/arch/x86/hvm/hvm.c
Hunk #1 succeeded at 3373 (offset 1 line).
patching file xen/arch/x86/hvm/svm/svm.c
Hunk #1 succeeded at 2159 (offset -64 lines).

I've attached the output from around boot all the way until after the=20
Windows HVM DomU crashed.

I gzip'ed it, as its a few hundred Kb.
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au     =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +613 9001 6090       =F0=9F=93=B1 +614 1293 5897


On Fri, Oct 25, 2019 at 10:28, Jan Beulich <jbeulich@suse.com> wrote:
> On 25.10.2019 09:00, Steven Haigh wrote:
>>  Further to my last, I downloaded the latest Windows Server 2016 ISO=20
>> from
>>  Microsoft.
>>=20
>>  Filename:=20
>> Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO
>>=20
>>  Have attached as much of the log as I could get attempting to boot=20
>> from
>>  the ISO and having a blank LV as the install target.
>>=20
>>  The Windows error message (shown via VNC) is HAL MEMORY ALLOCATION.
>=20
> Hmm, that's as if there was still (again?) an issue with CPUID
> handling - iirc the same was observable on maximum-size Rome
> systems prior to df29d03f1d (and its fixup). Below the debugging
> patch I did use at the time, maybe it turns out helpful here too
> (and perhaps you'd really only need the first hunk, I had put in
> the other one just in case anyway).
>=20
> However this looks to be different from your earlier report,
> where you said you've got some
>=20
> (XEN) d1v0 VIRIDIAN CRASH: ac 0 a0a0 fffff8065c06bf88 bf8
>=20
> So I wonder whether there's a new issue masking the old one.
>=20
> Jan
>=20
> --- unstable.orig/xen/arch/x86/hvm/hvm.c
> +++ unstable/xen/arch/x86/hvm/hvm.c
> @@ -3372,6 +3372,9 @@ int hvm_vmexit_cpuid(struct cpu_user_reg
>      }
>=20
>      guest_cpuid(curr, leaf, subleaf, &res);
> +if(regs->ax && (regs->eax >> 16) !=3D 0x4000 && (long)regs->rip < 0)=20
> {//temp
> + printk("%pv[%08lx]: %08x:%08x=3D%08x:%08x:%08x:%08x\n", curr,=20
> regs->rip, leaf, subleaf, res.a, res.b, res.c, res.d);
> +}
>      HVMTRACE_6D(CPUID, leaf, subleaf, res.a, res.b, res.c, res.d);
>=20
>      regs->rax =3D res.a;
> --- unstable.orig/xen/arch/x86/hvm/svm/svm.c
> +++ unstable/xen/arch/x86/hvm/svm/svm.c
> @@ -2223,7 +2223,13 @@ static void svm_do_msr_access(struct cpu
>=20
>          rc =3D hvm_msr_read_intercept(regs->ecx, &msr_content);
>          if ( rc =3D=3D X86EMUL_OKAY )
> +{//temp
>              msr_split(regs, msr_content);
> + if(regs->ecx =3D=3D 0xc001100c || regs->ecx =3D=3D 0xc0011005)
> +  printk("%pv[%08lx]: %08x -> %08x:%08x\n", curr, regs->rip,=20
> regs->ecx, regs->edx, regs->eax);
> +} else if(regs->ecx =3D=3D 0xc001100c || regs->ecx =3D=3D 0xc0011005) {
> + printk("%pv[%08lx]: %08x -> #GP\n", curr, regs->rip, regs->ecx);
> +}
>      }
>      else
>          rc =3D hvm_msr_write_intercept(regs->ecx, msr_fold(regs),=20
> true);
>=20
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

=

--=-DRTQUhYWMvAz9B5nICLb
Content-Type: application/gzip
Content-Disposition: attachment; filename=xen-output.log.gz
Content-Transfer-Encoding: base64

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
R+aKGQ3zQyfMaH9p3f4fh/P4f4NCAwA=

--=-DRTQUhYWMvAz9B5nICLb
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=-DRTQUhYWMvAz9B5nICLb--


