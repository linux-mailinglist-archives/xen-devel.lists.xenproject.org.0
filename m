Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84814AA2EA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 23:14:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265822.459374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG6qH-0004vn-HM; Fri, 04 Feb 2022 22:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265822.459374; Fri, 04 Feb 2022 22:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG6qH-0004sz-DO; Fri, 04 Feb 2022 22:14:09 +0000
Received: by outflank-mailman (input) for mailman id 265822;
 Fri, 04 Feb 2022 22:14:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lKAq=ST=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1nG6qF-0004st-QU
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 22:14:07 +0000
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [2607:f8b0:4864:20::b31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c40ffae8-8607-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 23:14:06 +0100 (CET)
Received: by mail-yb1-xb31.google.com with SMTP id z62so10488170ybc.11
 for <xen-devel@lists.xenproject.org>; Fri, 04 Feb 2022 14:14:06 -0800 (PST)
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
X-Inumbo-ID: c40ffae8-8607-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/IyKpmxVUqjrpIzjSTU9fLzwNvfMzMcv0lxO5bTkELo=;
        b=B1TnZGwfJcQTf+OzFhB3eCaPJpzwz/a8JKgPnxLfLzqkcOo9/BZnit3WYxNs099R+l
         KuiCJM+ViLvDLEE9+CgMWx2yBcjg9qN12m1PWgo2PlIfMrNkzL4qWjYJ9QQTaCvtOFVP
         75iZyybQa/NdtuoETbdCPd/QkWl7+Vj5bIA7olM8GlezQgtQoOfoISK/rdCYkzukHomF
         eTFTpSr3jA5mfPTBceFvB6vZxnjZG3TsLUxwXbIKAmosocbsz2FRFZXHsB+D0db4ziFB
         IgqeSZsc99C6/pJKl4+IFh23ZosqT8WXsiXxfeOthAmI3a0qDtmn7FHvwopD3KuqBUWN
         pqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/IyKpmxVUqjrpIzjSTU9fLzwNvfMzMcv0lxO5bTkELo=;
        b=HMj8SLEQOVwORY7vbS2kmvwojWOJqVLRTZVySDmtLJjWdMdlPHgBCxomCHopEV1MUm
         hIfCmRBMDsusmAkGzMNevc1+VNZnZLSAt1ISC2W6P/MHB0VJdKaZvi85MLN8vXc4LK+z
         GAfbF4KTaKlLewrvctSnvWlkofmNaTJcHf3Zhxujh6tzTPrzwPOUY3rxj7EGlb7+J9lN
         bROfe/sBO93rqm6Q9Y8FClPsIMmzRPtd/7xG3YQqJSVLLgp4+xkEweOxwrhC23To0QYs
         SPNi2SeO/+4wP6wuSIRl16Z+jWtVv1rOuBh3HMyK2JKRo767/mV3eEzgKs+lCM6YJ0dT
         vKTg==
X-Gm-Message-State: AOAM532xx5cwSF2M1moC+Rga7Gvb0ZjN9O7IORsr0gnJl8cLyovb4HG7
	WM2eqdj6v2Toxy6pPcSjl1mowwfvM5rfJb99oP4=
X-Google-Smtp-Source: ABdhPJwixd/IBs8x7FxIDNK7vjfQj+PmqQSnHUusSQ3rqxkF/1+J8Xs05SeulaEHSenDfIB26e9kdUS0h/utyas/Fbw=
X-Received: by 2002:a81:3612:: with SMTP id d18mr1140852ywa.336.1644012845002;
 Fri, 04 Feb 2022 14:14:05 -0800 (PST)
MIME-Version: 1.0
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com> <55643e68-432a-116a-b68e-2200e364e5da@suse.com>
In-Reply-To: <55643e68-432a-116a-b68e-2200e364e5da@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Fri, 4 Feb 2022 22:13:54 +0000
Message-ID: <CAFLBxZYCqCKeuM4XJTNgEwzoAG7P8aw2dP5kHFSSHX_xmuOWBQ@mail.gmail.com>
Subject: Re: [PATCH 03/16] x86/P2M: drop a few CONFIG_HVM
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000a1f56605d73891d8"

--000000000000a1f56605d73891d8
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 5, 2021 at 5:06 PM Jan Beulich <jbeulich@suse.com> wrote:

> This is to make it easier to see which parts of p2m.c still aren't HVM-
> specific: In one case the conditionals sat in an already guarded region,
> while in the other case P2M_AUDIT implies HVM.
>

I think this would be much more easy to understand what's going on if it
was more like this:

---
x86/p2m: P2M_AUDIT implies CONFIG_HVM

Remove one #endif / #ifdef CONFIG_HVM pair to make all the audit code
CONFIG_HVM only.  This is to make it easier to see which parts of p2m.c
still aren't HVM-specific.

While here, remove a redundant set of nested #ifdef CONFIG_HVM.
---

Reviewed-by: George Dunlap <george.dunlap@citrix.com>

--000000000000a1f56605d73891d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 5, 2021 at 5:06 PM Jan Be=
ulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is to =
make it easier to see which parts of p2m.c still aren&#39;t HVM-<br>
specific: In one case the conditionals sat in an already guarded region,<br=
>
while in the other case P2M_AUDIT implies HVM.<br></blockquote><div><br></d=
iv><div>I think this would be much more easy to understand what&#39;s going=
 on if it was more like this:</div><div><br></div><div>---<br></div><div>x8=
6/p2m: P2M_AUDIT implies CONFIG_HVM</div><div><br></div><div><div>Remove on=
e #endif / #ifdef CONFIG_HVM pair to make all the audit code CONFIG_HVM onl=
y.=C2=A0 This is to make it easier to see which parts of p2m.c still aren&#=
39;t HVM-specific. <br></div><div><br></div><div>While here, remove a redun=
dant set of nested #ifdef CONFIG_HVM.</div><div>---<br></div></div><div><br=
></div><div>Reviewed-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@=
citrix.com">george.dunlap@citrix.com</a>&gt;<br></div></div><div class=3D"g=
mail_quote"><br></div></div>

--000000000000a1f56605d73891d8--

