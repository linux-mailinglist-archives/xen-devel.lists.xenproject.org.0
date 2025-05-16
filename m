Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7D8ABA279
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 20:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987423.1372701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFzTV-0003xp-RI; Fri, 16 May 2025 18:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987423.1372701; Fri, 16 May 2025 18:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFzTV-0003vx-OJ; Fri, 16 May 2025 18:08:01 +0000
Received: by outflank-mailman (input) for mailman id 987423;
 Fri, 16 May 2025 18:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=07xk=YA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uFzTU-0003SK-L8
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 18:08:00 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b37bf395-3280-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 20:08:00 +0200 (CEST)
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
X-Inumbo-ID: b37bf395-3280-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=xtkqtuzgync4nmq5fi56dj5yt4.protonmail; t=1747418878; x=1747678078;
	bh=U32vardb3bMfLhRe8zBlWvOhEEaCLcFWN5zRoe903xM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QErf5hgrOl4cTMZjNlZJg7BDueuIFnkbSsl7DWpM6dwaxEr0GJoJvNpugN8G4vDyT
	 THnb8MmmG5Kl/cKqCNZtQw+9khKYDqENiBrhEeA9t3pN7PA2M6jDOqh4HR2rMg3kKZ
	 UebvrT+neaJG5cX33O2NTTTfaahrxDIfQqGZ9T1JadiJ8duTKluVN2OUr7VL33DyO3
	 3H1S1+iqmvAsWvd9ibQAY4B+BnCM75Hb2aC1JThv/hwfGPG3nRT8uRgrqrXWvk1sRn
	 G4LiUEaNbUZEXHSANpfvKG1ivlYtClKWlTkBsKNbw2zbrp77CtH5HdaVCbFdleqDjG
	 eaFZfLL+oGCFA==
Date: Fri, 16 May 2025 18:07:52 +0000
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
From: dmkhn@proton.me
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, jbeulich@suse.com, roger.pau@citrix.com, consulting@bugseng.com, dmukhin@ford.com, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PING MISRA] Re: [PATCH v5 2/2] x86/vmx: remove __vmread()
Message-ID: <aCd+82Ffz3jfU+Y0@kraken>
In-Reply-To: <da9e619607bcf85198505bde196fbc86@bugseng.com>
References: <20250513052809.3947164-1-dmukhin@ford.com> <20250513052809.3947164-3-dmukhin@ford.com> <85f778d1-7fb5-47da-9153-35333e486d24@citrix.com> <da9e619607bcf85198505bde196fbc86@bugseng.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3aa588e9e93238631c5af83161289d4aa1f8b523
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 02:53:03PM +0200, Nicola Vetrini wrote:
> On 2025-05-16 14:45, Andrew Cooper wrote:
> > Hello,
> >
> > This is adjusting some MISRA configuration.=C2=A0 I'm reasonably sure t=
he
> > change is fine as we're simply removing the referenced helper, but can
> > we get a second opinion from anyone who knows what
> > function-macro-properties.json is supposed to be doing?
> >
> > Thanks,
> >
> > ~Andrew
> >
>=20
> Hi Andrew,
>=20
> sorry, it slipped under other emails. The change is ok.
>=20
> > On 13/05/2025 6:28 am, dmkhn@proton.me wrote:
> >> From: Denis Mukhin <dmukhin@ford.com>
> >>
> >> Remove __vmread() and adjust ECLAIR configuration to account for the
> >> change.
> >>
> >> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>=20
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thank you

>=20
> >> ---
> >>  docs/misra/function-macro-properties.json | 9 ---------
> >>  xen/arch/x86/include/asm/hvm/vmx/vmx.h    | 5 -----
> >>  2 files changed, 14 deletions(-)
> >>
> >> diff --git a/docs/misra/function-macro-properties.json
> >> b/docs/misra/function-macro-properties.json
> >> index 74058297b5..59ba63626e 100644
> >> --- a/docs/misra/function-macro-properties.json
> >> +++ b/docs/misra/function-macro-properties.json
> >> @@ -152,15 +152,6 @@
> >>              "taken": ""
> >>           }
> >>        },
> >> -      {
> >> -         "type": "function",
> >> -         "value": "^__vmread.*$",
> >> -         "properties":{
> >> -            "pointee_write": "2=3Dalways",
> >> -            "pointee_read": "2=3Dnever",
> >> -            "taken": ""
> >> -         }
> >> -      },
> >>        {
> >>           "type": "function",
> >>           "value": "^hvm_pci_decode_addr.*$",
> >> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> >> b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> >> index d85b52b9d5..299e2eff6b 100644
> >> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> >> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> >> @@ -336,11 +336,6 @@ static always_inline unsigned long
> >> vmread(unsigned long field)
> >>      return value;
> >>  }
> >>
> >> -static always_inline void __vmread(unsigned long field, unsigned long
> >> *value)
> >> -{
> >> -    *value =3D vmread(field);
> >> -}
> >> -
> >>  static always_inline void __vmwrite(unsigned long field, unsigned
> >> long value)
> >>  {
> >>      asm goto ( "vmwrite %[value], %[field]\n\t"
>=20
> --
> Nicola Vetrini, B.Sc.
> Software Engineer
> BUGSENG (https://bugseng.com)
> LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253


