Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391BD4AA2D7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 23:08:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265814.459362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG6kS-0003Wk-Rj; Fri, 04 Feb 2022 22:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265814.459362; Fri, 04 Feb 2022 22:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG6kS-0003Uu-Od; Fri, 04 Feb 2022 22:08:08 +0000
Received: by outflank-mailman (input) for mailman id 265814;
 Fri, 04 Feb 2022 22:08:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lKAq=ST=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1nG6kR-0003Uo-9J
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 22:08:07 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed97617c-8606-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 23:08:06 +0100 (CET)
Received: by mail-yb1-xb32.google.com with SMTP id e145so2582461yba.12
 for <xen-devel@lists.xenproject.org>; Fri, 04 Feb 2022 14:08:06 -0800 (PST)
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
X-Inumbo-ID: ed97617c-8606-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PePstMPhLDPHoa5O9/0mJe7sY71Rc1ra8CN2ByZjf2c=;
        b=Ne8BMSKESMSnGjk1sMAS+ZMHnDUOGwVbV3MyGXtkF1+w2SQ3HiXIyS1smE7smJ16hN
         nQmuGD6CvOVoXBzPudCeCjLFzZ7edsTDVQ8h+YIZ0KSrBJ4H0zjcEH3MMZa1rDTauk5g
         wNYba5onIxc9n9kQPXkM4JCGd5jB2097Bl7jOAeh7F4pOeQPWjBJCEJhM6l1RPSKtmJB
         r+AF2cnh+M0D20zW+B8EufoFHuxnglWI60HzT5J9pOowz4s8Jy/L0W5q5zXhEigprfCs
         GxtpQRAR0A3O7CIQTQ2QnJt5rd45W/Z7dXv9ulEp+C306uyDjq4QRTCaCGkUilX1+3UR
         DlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PePstMPhLDPHoa5O9/0mJe7sY71Rc1ra8CN2ByZjf2c=;
        b=yQd5fqd7uV+c6O+dmYxjUF4A90ie/BNd9yxP1eKPL+iZPYjQ6ra4qsZKQRg1G3/o8T
         LkJOwQ+F6VOfBpEPMI805p9mNx0MQe/8v+UotL1Rp9Bg7elBSgI+aWB30Q9rJTI6p+1O
         XJBHAkeDMzatbH41/LkllZBfqsP7WOxY78R0YTOpJ8i3cnw2GF9hvFeGuvTw9XJ+ldow
         ngw/yDiDTW2gVGmR/0beD8jE+aeHQm9yAnkE7H8nV74+j5LtwUajAaqsW4MPF5u/4DAP
         ugkHQ9vqpmqB4Db8hFZCzcwaZOQvs7cXDjwbxGrf5bC+HwqoplWOxtuK9xqa2Aq+eRkL
         cFhg==
X-Gm-Message-State: AOAM530WtKy0G5/gwefkQ4CLbNhKpd9NsyRekKzeXNdxSXCyFOoLTLtt
	B5ICDAQPQpg+WkPgUqoRoj6f2xNTt6M5PPwpmlc=
X-Google-Smtp-Source: ABdhPJytghMeG7tLjYqm+rceZFiHzEcwQgSOGCPAXoXSesI2v+vozrGBhdT9krnsadjttgu4AoIzMOw0vYOHw5NUtXQ=
X-Received: by 2002:a0d:e615:: with SMTP id p21mr1142793ywe.122.1644012485217;
 Fri, 04 Feb 2022 14:08:05 -0800 (PST)
MIME-Version: 1.0
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com> <eaf6f63d-1122-f52d-1147-cda40a9c3387@suse.com>
In-Reply-To: <eaf6f63d-1122-f52d-1147-cda40a9c3387@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Fri, 4 Feb 2022 22:07:54 +0000
Message-ID: <CAFLBxZZQgfYZ=OcyhRedPvK0CZxjrHY-5kRp4EOpJ2LEFL09yg@mail.gmail.com>
Subject: Re: [PATCH 02/16] x86/P2M: introduce p2m_{add,remove}_page()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Paul Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="00000000000030128405d7387cbe"

--00000000000030128405d7387cbe
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 5, 2021 at 5:06 PM Jan Beulich <jbeulich@suse.com> wrote:

> p2m_add_page() is simply a rename from guest_physmap_add_entry().
> p2m_remove_page() then is its counterpart, despite rendering
> guest_physmap_remove_page(). This way callers can use suitable pairs of
> functions (previously violated by hvm/grant_table.c).
>

Obviously this needs some clarification.  While we're here, I find this a
bit confusing; I tend to use the present tense for the way the code is
before the patch, and the imperative for what the patch does; so Id' say:

Rename guest_physmap_add_entry() to p2m_add_page; make
guest_physmap_remove_page a wrapper with p2m_remove_page.  That way callers
can use suitable pairs...

Other than that looks good.

 -George

--00000000000030128405d7387cbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 5, 2021 at 5:06 PM Jan Be=
ulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">p2m_add_pag=
e() is simply a rename from guest_physmap_add_entry().<br>
p2m_remove_page() then is its counterpart, despite rendering<br>
guest_physmap_remove_page(). This way callers can use suitable pairs of<br>
functions (previously violated by hvm/grant_table.c).<br></blockquote><div>=
<br></div><div>Obviously this needs some clarification.=C2=A0 While we&#39;=
re here, I find this a bit confusing; I tend to use the present tense for t=
he way the code is before the patch, and the imperative for what the patch =
does; so Id&#39; say:</div><div><br></div><div>Rename guest_physmap_add_ent=
ry() to p2m_add_page; make guest_physmap_remove_page a wrapper with p2m_rem=
ove_page.=C2=A0 That way callers can use suitable pairs...<br></div><div>=
=C2=A0</div>Other than that looks good.<br></div><div class=3D"gmail_quote"=
><br></div><div class=3D"gmail_quote">=C2=A0-George<br></div></div>

--00000000000030128405d7387cbe--

