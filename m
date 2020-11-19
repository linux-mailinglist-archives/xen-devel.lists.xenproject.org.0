Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F47C2B9745
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:04:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31062.61279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmQQ-0007QG-R1; Thu, 19 Nov 2020 16:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31062.61279; Thu, 19 Nov 2020 16:04:46 +0000
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
	id 1kfmQQ-0007Pq-Ne; Thu, 19 Nov 2020 16:04:46 +0000
Received: by outflank-mailman (input) for mailman id 31062;
 Thu, 19 Nov 2020 16:04:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d/3C=EZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kfmQP-0007Ph-BG
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:04:45 +0000
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1cbf80b-d145-42c8-9268-81ee5ffa0c9a;
 Thu, 19 Nov 2020 16:04:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 10so7696591wml.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 08:04:44 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
 by smtp.gmail.com with ESMTPSA id h2sm436496wme.45.2020.11.19.08.04.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Nov 2020 08:04:43 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=d/3C=EZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kfmQP-0007Ph-BG
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:04:45 +0000
X-Inumbo-ID: d1cbf80b-d145-42c8-9268-81ee5ffa0c9a
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d1cbf80b-d145-42c8-9268-81ee5ffa0c9a;
	Thu, 19 Nov 2020 16:04:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 10so7696591wml.2
        for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 08:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=On7WtObYfJqkmBWHnyAjoLI3cKLxtSNPjmpL50xHFRI=;
        b=kauqrQB8AIZxEhk7ED7FpTkba7nnvpn22yiOG+FuxlbGs5Xill+1mzqnPLtUFRInGa
         gdQLnsXvSCKHv8p0qvZ4HrdNyv51EQN/GQQywYmWORxv2em0jjMhfJic4D33Xo7dP38a
         v2RKod8xRVTLzOkGeHu05uZ9jrmrxlxXS/m0cOkg8K/rtloF/IRBVIPbXJLFt1cO8kwB
         0jK1vCR7kbJthfgixI/oV1r4E4QDNPo0NTr1Ynt/XUXOskFTIJnlqhTOns0BtDExGIOG
         lsbzAyVgkXdz+FLYXS3EhopTCD8BX/kanR0zFubQJ+JDgddfxG4bkkGnZPRLsNXkCS60
         YWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=On7WtObYfJqkmBWHnyAjoLI3cKLxtSNPjmpL50xHFRI=;
        b=CTpR3W9AA4CqP3+rw6VMR9K0a35CWS+Q6B1ucHnX3uMHlPxFHv4+kDLFsSa/hndMe3
         Dkj+lFwlzwUyM7cf3oVkOpdlLQH+b71E7OkBC9btQVgLEDkAa1LRkDIV82l0HWIeoK35
         UeNx93W8QSD7j8dWllIcYvlrckau2FBA2MSScA4spLuzO3+/ch34njTsmN4HZxjhiLMu
         lR8mAx7p+h2as6F/lr3dOa2eynfnjU+Swn0HWeJX+Gq7PB26msVLAcx/50GnSwHQLe3d
         eGengBmxCtxYa0AGmU74tA5Z9o0l84WtYcPJAyOSp0ATlegj0UCm9DijSK/J/5IbNenK
         Wl7w==
X-Gm-Message-State: AOAM530Sl0MmCjTx0TTqiKG1yFOHKLSpQBqEO0Dj2U88cv9THiWrGldL
	+Q9K1L3j8rNvGSuI0LRo964=
X-Google-Smtp-Source: ABdhPJw6pLgZpb7nxKHqbHv0bFqQp2GJDXX10ie1Fge14RL1t+c7xcjbV32a+1pbg3EF/DE+wNZS9g==
X-Received: by 2002:a1c:3d02:: with SMTP id k2mr5463382wma.183.1605801883717;
        Thu, 19 Nov 2020 08:04:43 -0800 (PST)
Received: from CBGR90WXYV0 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
        by smtp.gmail.com with ESMTPSA id h2sm436496wme.45.2020.11.19.08.04.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 08:04:43 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20201111200721.30551-1-paul@xen.org> <20201111200721.30551-5-paul@xen.org> <0e05cc16-c7b9-34a1-8862-a4e7d581189f@suse.com>
In-Reply-To: <0e05cc16-c7b9-34a1-8862-a4e7d581189f@suse.com>
Subject: RE: [PATCH 04/10] viridian: use hypercall_vpmask in hvcall_ipi()
Date: Thu, 19 Nov 2020 16:04:42 -0000
Message-ID: <00ca01d6be8d$b17884a0$14698de0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIKCyTUSJ7jm2WJ2nMqsy5EhijKogGYy4h+AwWv/32pRBDUgA==

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 12 November 2020 08:50
> To: Paul Durrant <paul@xen.org>
> Cc: Paul Durrant <pdurrant@amazon.com>; Wei Liu <wl@xen.org>; Andrew =
Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH 04/10] viridian: use hypercall_vpmask in =
hvcall_ipi()
>=20
> On 11.11.2020 21:07, Paul Durrant wrote:
> > --- a/xen/arch/x86/hvm/viridian/viridian.c
> > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > @@ -533,6 +533,21 @@ static bool vpmask_test(struct hypercall_vpmask =
*vpmask, unsigned int vp)
> >      return test_bit(vp, vpmask->mask);
> >  }
> >
> > +static unsigned int vpmask_first(struct hypercall_vpmask *vpmask)
> > +{
> > +    return find_first_bit(vpmask->mask, HVM_MAX_VCPUS);
> > +}
> > +
> > +static unsigned int vpmask_next(struct hypercall_vpmask *vpmask, =
unsigned int vp)
> > +{
> > +    return find_next_bit(vpmask->mask, HVM_MAX_VCPUS, vp + 1);
>=20
> Perhaps again assert on vp's range?
>=20

Ok.

> > +}
> > +
> > +#define for_each_vp(vpmask, vp) \
> > +	for ((vp) =3D vpmask_first(vpmask); \
> > +	     (vp) < HVM_MAX_VCPUS; \
> > +	     (vp) =3D vpmask_next(vpmask, vp))
>=20
> Nit again: Missing blanks here and ...

Oh yes.

>=20
> > @@ -669,17 +693,20 @@ static int hvcall_ipi(union hypercall_input =
*input,
> >      if ( vector < 0x10 || vector > 0xff )
> >          return -EINVAL;
> >
> > -    for_each_vcpu ( currd, v )
> > +    vpmask_empty(vpmask);
> > +    for (vp =3D 0; vp < 64; vp++)
>=20
> ... here. I also wonder if the literal 64 couldn't be expressed in
> some suitable way.
>=20

Ok. I'll see if I can suitably macrotize it.

  Paul

> Jan


