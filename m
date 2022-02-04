Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1838C4AA2A8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 22:55:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265804.459351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG6XP-0001vK-HD; Fri, 04 Feb 2022 21:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265804.459351; Fri, 04 Feb 2022 21:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG6XP-0001t3-DW; Fri, 04 Feb 2022 21:54:39 +0000
Received: by outflank-mailman (input) for mailman id 265804;
 Fri, 04 Feb 2022 21:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lKAq=ST=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1nG6XN-0001sx-Ap
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 21:54:37 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09a01fb6-8605-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 22:54:34 +0100 (CET)
Received: by mail-yb1-xb35.google.com with SMTP id e145so2502240yba.12
 for <xen-devel@lists.xenproject.org>; Fri, 04 Feb 2022 13:54:34 -0800 (PST)
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
X-Inumbo-ID: 09a01fb6-8605-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Q48td1+7MKpQbIgDJVnLJAd/H0+HKBR1pRInqASI4A=;
        b=Injl1uAsWm5OJfJE6bmaYhuGcIE1vMbLZ3erW8JMLSbEBRtWFARQfstLmtzm/rhyYn
         O34f9pJk0EHAqTuI2IYCSHXPmlRME4krElDVMS4ZNat2NnTizTfimDcz8SzsngdiTfj8
         rRJTYBzu5fFyOZNGl5v1oeyeHmHalulwLi0oyBCFHYOS/tn7YZpLcGnsDQ8yPWrLVZii
         +yXzP0dq3tsB+3NnFPwYDbB5RmoxviVZ8W465sDT9dYwmcbcyeSgBpOuWLoRjkqVR6Pk
         0BfeikMeDpkK7q6iGeLp8lipUwJ9AZbWb2YFz7iF0atKO/1OuX5oHv+s9OnU1J0DMbVQ
         nf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Q48td1+7MKpQbIgDJVnLJAd/H0+HKBR1pRInqASI4A=;
        b=Wfw0QV2kp5OGTSH7kIXCJSLRawnlJE+GDCK9tOjqMW5Nwc/GO3HLAowInHBIIow4RX
         flTefoKkinpjKMNgQoNUolBsrIl9OlA43g4qBb/58Lnw3rrhEvOJ/YtQVxB6JeXqO/Wo
         HomJih27hsJRAe6hN7PdZe2mTUITk+Bxroabhw5Z/Py5XZEAx7C1fI22MPiDWCTX+JeT
         hkalP3yrbbs7q+A8kyjRB8sgPOB62/MkfrdTLzlsyhNShB8WBG1BIiKWL1Vh7WRfbOpt
         606KQ648XLE06c5hrWDZorUVT9ZNiTqAZV2XuYr5nfE5Kw3YVYFL7fqLADMlSEPalgVv
         SnbQ==
X-Gm-Message-State: AOAM533xP8SVOTEgP/5/ovOt/Eg64V5fSsAVmJKOF/EFRpTk7Pki+9/4
	JObvIOd45LrKenqvIaNrzB/UzaOT3G+JqnI4lNU=
X-Google-Smtp-Source: ABdhPJzpzOmNXzqU/dCFw5FCRBjRR2LsKmI0aVpimy0R3IP8aRGv6YGfj5xmlSflnxMUiLRyB5WGlZeUzvAODGV/p9U=
X-Received: by 2002:a05:6902:1543:: with SMTP id r3mr1262448ybu.507.1644011673202;
 Fri, 04 Feb 2022 13:54:33 -0800 (PST)
MIME-Version: 1.0
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com> <fc340862-6842-3db4-1093-d2df44c1aa9c@suse.com>
In-Reply-To: <fc340862-6842-3db4-1093-d2df44c1aa9c@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Fri, 4 Feb 2022 21:54:21 +0000
Message-ID: <CAFLBxZa3qZ0+1MHxULZCciFPyYppv12TTe=LjcEyJAEr-KJRsg@mail.gmail.com>
Subject: Re: [PATCH 01/16] x86/P2M: rename p2m_remove_page()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000c9b60a05d7384bd0"

--000000000000c9b60a05d7384bd0
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 5, 2021 at 5:05 PM Jan Beulich <jbeulich@suse.com> wrote:

> This is in preparation to re-using the original name.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>

Hey Jan,

This series overall looks good; thanks for taking this on.

Functionally this patch looks good; just one question...

--- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -788,8 +788,8 @@ void p2m_final_teardown(struct domain *d
>  #ifdef CONFIG_HVM
>
>  static int __must_check
> -p2m_remove_page(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
> -                unsigned int page_order)
> +p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
> +                 unsigned int page_order)
>

One question that's naturally raised for both this and the following patch
is, what is the new naming "scheme" for these renamed functions, and how do
they relate to the old scheme?

Overall it seems like the intention is that "guest_physmap_..." can be
called on a domain which may be PV or HVM, while "p2m_..." should only be
called on HVM domains.

There's also "..._entry" vs "..._page".  Is the p2m_remove_page /
p2m_remove_entry distinction have a meaning, and is it the same meaning as
guest_physmap_add_page / guest_physmap_add_entry?  Or is it similar to
p2m_init_nestedp2m / p2m_nestedp2m_init -- we need both functions and
don't want to make the names longer?

 -George

--000000000000c9b60a05d7384bd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 5, 2021 at 5:05 PM Jan Be=
ulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is in =
preparation to re-using the original name.<br>
<br>
Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt;<br></blockquote><div><br></div><div>H=
ey Jan,</div><div><br></div><div>This series overall looks good; thanks for=
 taking this on.</div><div><br></div><div>Functionally this patch looks goo=
d; just one question...<br></div><br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
--- a/xen/arch/x86/mm/p2m.c<br>
+++ b/xen/arch/x86/mm/p2m.c<br>
@@ -788,8 +788,8 @@ void p2m_final_teardown(struct domain *d<br>
=C2=A0#ifdef CONFIG_HVM<br>
<br>
=C2=A0static int __must_check<br>
-p2m_remove_page(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int page_=
order)<br>
+p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=
 page_order)<br></blockquote><div><br></div><div>One question that&#39;s na=
turally raised for both this and the following patch is, what is the new na=
ming &quot;scheme&quot; for these renamed functions, and how do they relate=
 to the old scheme?</div><div><br></div><div>Overall it seems like the inte=
ntion is that &quot;guest_physmap_...&quot; can be called on a domain which=
 may be PV or HVM, while &quot;p2m_...&quot; should only be called on HVM d=
omains.</div><div><br></div><div>There&#39;s also &quot;..._entry&quot; vs =
&quot;..._page&quot;.=C2=A0 Is the p2m_remove_page / p2m_remove_entry disti=
nction have a meaning, and is it the same meaning as guest_physmap_add_page=
 / guest_physmap_add_entry?=C2=A0 Or is it similar to p2m_init_nestedp2m / =
p2m_nestedp2m_init -- we need both functions and=C2=A0 don&#39;t want to ma=
ke the names longer?</div><div><br></div><div>=C2=A0-George</div><br></div>=
</div>

--000000000000c9b60a05d7384bd0--

