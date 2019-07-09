Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AA763361
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 11:24:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkmJj-0001Zn-5t; Tue, 09 Jul 2019 09:21:43 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.107])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <kparal@redhat.com>) id 1hkmJh-0001Zi-OZ
 for xen-devel@lists.xensource.com; Tue, 09 Jul 2019 09:21:41 +0000
Received: from [46.226.52.196] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 9B/99-11130-4AC542D5;
 Tue, 09 Jul 2019 09:21:40 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-13.tower-284.messagelabs.com: domain of redhat.com designates 
 209.85.167.42 as permitted sender) smtp.mailfrom=redhat.com; dkim=none 
 (message not signed); dmarc=pass (p=none sp=none adkim=r aspf=r) 
 header.from=redhat.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRWlGSWpSXmKPExsVyMXS5lu7iGJV
 Yg9dNOhb3prxnd2D02N63iz2AMYo1My8pvyKBNePxp71sBV8sKlYdaGZsYOzX72Lk4hASmM4o
 cfLHMSYQR0JgDqvEtds9zF2MnEBOmUTTxX3sEHaRxImNCxm7GDmA7FKJa681QcK8AoISJ2c+Y
 YEYdIZJYsuW2UwgCU4Bf4nfBzeC9bIJqEp8+XURLM4ioCLx8NIhRojmAIlz26+ygdjCAo4SN7
 Z/BIuLCIRLPHzxnBVkKLNAP7PE3l3rWUESzAI+Eh9vzGSdwMg/C8nyWUhSELamROv23+wQtob
 Egjv7GCFsbYllC18zL2BkXcVonlSUmZ5RkpuYmaNraGCga2hopGtoaalrZKqXWKWbpJdaqlue
 Wlyia6iXWF6sV1yZm5yTopeXWrKJERjYKQXHJXcwPp/1Ru8QoyQHk5Iob1yUcqwQX1J+SmVGY
 nFGfFFpTmrxIUYZDg4lCd7PUSqxQoJFqempFWmZOcAog0lLcPAoifDeBUnzFhck5hZnpkOkTj
 G6cizZOG8RM8fl6yCy49ciIPlx1RIg+R1ECrHk5eelSonzXgZpFgBpzijNgxsNSxCXGGWlhHk
 ZGRgYhHgKUotyM0tQ5V8xinMwKgnzTgCZwpOZVwJ3wSug45iAjquLVAI5riQRISXVwGQ22bfP
 OXWpqlDs7bdKlp4/twXOftCdlz2/8PHlFsHbXK/tIh9Wpcs9K3Y8diqQS2/jJkFejzW5k2e4c
 XwJOLxi3d7VwmlaQXUt/rKtrFftiuZ8+8l8QWGP1fbbkXabK2deWG508ZTyI66ydV+U8zrLHL
 O+L5WRfjW/x6HFRvWDwPY5nx6UbnSfVnD2z8FfojbBe/wr1haGzVPbO2Fvc0Rx51mp6PsvolY
 ZKCRMfFL/6b26f9GNXbpZnKGZFhKTenl1M5Zz6xYm7N7+mk24ursk85zhLpbiVy8+n62Tq/sy
 T55zxxv9Jo5Jid8P/b15Ycv8vCq55w0pc9uO+KrI3TF7wXq/m+3Th4kWKeY+H5RYijMSDbWYi
 4oTARpomGyLAwAA
X-Env-Sender: kparal@redhat.com
X-Msg-Ref: server-13.tower-284.messagelabs.com!1562664099!858288!1
X-Originating-IP: [209.85.167.42]
X-SpamReason: No, hits=0.3 required=7.0 tests=newsletters: ,HTML_20_30,
 HTML_MESSAGE
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2121 invoked from network); 9 Jul 2019 09:21:39 -0000
Received: from mail-lf1-f42.google.com (HELO mail-lf1-f42.google.com)
 (209.85.167.42)
 by server-13.tower-284.messagelabs.com with ECDHE-RSA-AES128-GCM-SHA256
 encrypted SMTP; 9 Jul 2019 09:21:39 -0000
Received: by mail-lf1-f42.google.com with SMTP id b29so12950627lfq.1
 for <xen-devel@lists.xensource.com>; Tue, 09 Jul 2019 02:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nGxIhYHXPgoZfBrYf2wmHMpPZyk6VBuJdjIVYVThEGE=;
 b=QQ1QVy43fPfuMp8XXnrv3RRH0Ih1hH5rYr5PLpIEliGvkuyV2LNB5hgxDDfdL58dDT
 UsEWQDnmXsroaRpglYFW0/lYqasPAWGW/C8boHeFk4ZnlkptI82AN5zBu2zbxQswCLuY
 63wydVCAhcjReNRA2v6NF23gSpVfOYTJt1zmyBMaVDq/Wq642KvwOG5CBBuSM6ErhLgs
 uEv+WUJgArk9kTClbwzAIhfdt0/4q1iBYos9XW0AuuUrxDbcxKeeA2ppmQ3vViO/WWSR
 GHlTMe/jyd/2nq8t7HTnvaGfHzVjuIlnREsO3i7ExQxF7QYUtIyFmnu2/eZ4Eas0r3Ok
 s/Fg==
X-Gm-Message-State: APjAAAWoU+yxN0BVSOI23knP0gSyaNFXXyBuSgJ1veTIxsxfINYD68mc
 oK47GasPAchQeUPBc7OkcyO1oqB5Edyo2+xjvQeI
X-Google-Smtp-Source: APXvYqzcGC7iM5C9vO2isoGmnVjwvMlvpjkf8HehZS+OifZhx9tuY+7OIIHX2LsZLrpYRcnX1BYbSBwq8p05M3PwHlk=
X-Received: by 2002:ac2:528e:: with SMTP id q14mr10408091lfm.17.1562664098719; 
 Tue, 09 Jul 2019 02:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
In-Reply-To: <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
From: Kamil Paral <kparal@redhat.com>
Date: Tue, 9 Jul 2019 11:21:12 +0200
Message-ID: <CA+cBOTe9Ed1zsofQHQ8FSQDV_5E3TpzHt8zkWpD40vJu6LOAmw@mail.gmail.com>
To: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: xen-devel@lists.xensource.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: multipart/mixed; boundary="===============6511299702859056738=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6511299702859056738==
Content-Type: multipart/alternative; boundary="000000000000820779058d3c1600"

--000000000000820779058d3c1600
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 8, 2019 at 6:12 PM Adam Williamson <adamwill@fedoraproject.org>
wrote:

> On Tue, 2019-05-21 at 11:14 -0700, Adam Williamson wrote:
> > > > > > "The release must boot successfully as Xen DomU with releases
> providing
> > > > > > a functional, supported Xen Dom0 and widely used cloud providers
> > > > > > utilizing Xen."
> > > > > >
> > > > > > and change the 'milestone' for the test case -
> > > > > >
> https://fedoraproject.org/wiki/QA:Testcase_Boot_Methods_Xen_Para_Virt -
> > > > > > from Final to Optional.
> > > > > >
> > > > > > Thoughts? Comments? Thanks!
> > > > >
> > > > > I would prefer for it to remain as it is.
> > > >
> > > > This is only practical if it's going to be tested, and tested
> regularly
> > > > - not *only* on the final release candidate, right before we sign off
> > > > on the release. It needs to be tested regularly throughout the
> release
> > > > cycle, on the composes that are "nominated for testing".
> > >
> > > Would the proposal above work for you? I think it satisfies what you
> are
> > > looking for. We would also have someone who monitors these test results
> > > pro-actively.
> >
> > In theory, yeah, but given the history here I'm somewhat sceptical. I'd
> > also say we still haven't really got a convincing case for why we
> > should continue to block the release (at least in theory) on Fedora
> > working in Xen when we don't block on any other virt stack apart from
> > our 'official' one, and we don't block on all sorts of other stuff we'd
> > "like to have working" either. Regardless of the testing issues, I'd
> > like to see that too if we're going to keep blocking on Xen...
>
> So, this died here. As things stand: I proposed removing the Xen
> criterion, Lars opposed, we discussed the testing situation a bit, and
> I said overall I'm still inclined to remove the criterion because
> there's no clear justification for it for Fedora any more. Xen working
> (or rather, Fedora working on Xen) is just not a key requirement for
> Fedora at present, AFAICS.
>
> It's worth noting that at least part of the justification for the
> criterion in the first place was that Amazon was using Xen for EC2, but
> that is no longer the case, most if not all EC2 instance types no
> longer use Xen. Another consideration is that there was a time when KVM
> was still pretty new stuff and VirtualBox was not as popular as it is
> now, and Xen was still widely used for general hobbyist virtualization
> purposes; I don't believe that's really the case any more.
>
> So...with thanks to Lars / Xen Project for their input, I'm afraid I'm
> still in favor of this proposal, and still think we should drop the Xen
> criterion for F31. This wouldn't mean Xen is out of Fedora and we don't
> care about it any more, or anything like that; it would still be a part
> of Fedora and we still would like Xen to work on Fedora and Fedora to
> work on Xen, just like any other non-release-blocking package. It just
> means we would no longer block releases if it does not work.
>

Agreed.

--000000000000820779058d3c1600
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Jul 8, 2019 at 6:12 PM Adam Williamson &lt;<a href=3D"mailto=
:adamwill@fedoraproject.org">adamwill@fedoraproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2019-05-21 a=
t 11:14 -0700, Adam Williamson wrote:<br>
&gt; &gt; &gt; &gt; &gt; &quot;The release must boot successfully as Xen Do=
mU with releases providing<br>
&gt; &gt; &gt; &gt; &gt; a functional, supported Xen Dom0 and widely used c=
loud providers<br>
&gt; &gt; &gt; &gt; &gt; utilizing Xen.&quot;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; and change the &#39;milestone&#39; for the test ca=
se -<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://fedoraproject.org/wiki/QA:Testc=
ase_Boot_Methods_Xen_Para_Virt" rel=3D"noreferrer" target=3D"_blank">https:=
//fedoraproject.org/wiki/QA:Testcase_Boot_Methods_Xen_Para_Virt</a> -<br>
&gt; &gt; &gt; &gt; &gt; from Final to Optional.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Thoughts? Comments? Thanks!<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I would prefer for it to remain as it is.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This is only practical if it&#39;s going to be tested, and t=
ested regularly<br>
&gt; &gt; &gt; - not *only* on the final release candidate, right before we=
 sign off<br>
&gt; &gt; &gt; on the release. It needs to be tested regularly throughout t=
he release<br>
&gt; &gt; &gt; cycle, on the composes that are &quot;nominated for testing&=
quot;.<br>
&gt; &gt; <br>
&gt; &gt; Would the proposal above work for you? I think it satisfies what =
you are<br>
&gt; &gt; looking for. We would also have someone who monitors these test r=
esults<br>
&gt; &gt; pro-actively.<br>
&gt; <br>
&gt; In theory, yeah, but given the history here I&#39;m somewhat sceptical=
. I&#39;d<br>
&gt; also say we still haven&#39;t really got a convincing case for why we<=
br>
&gt; should continue to block the release (at least in theory) on Fedora<br=
>
&gt; working in Xen when we don&#39;t block on any other virt stack apart f=
rom<br>
&gt; our &#39;official&#39; one, and we don&#39;t block on all sorts of oth=
er stuff we&#39;d<br>
&gt; &quot;like to have working&quot; either. Regardless of the testing iss=
ues, I&#39;d<br>
&gt; like to see that too if we&#39;re going to keep blocking on Xen...<br>
<br>
So, this died here. As things stand: I proposed removing the Xen<br>
criterion, Lars opposed, we discussed the testing situation a bit, and<br>
I said overall I&#39;m still inclined to remove the criterion because<br>
there&#39;s no clear justification for it for Fedora any more. Xen working<=
br>
(or rather, Fedora working on Xen) is just not a key requirement for<br>
Fedora at present, AFAICS.<br>
<br>
It&#39;s worth noting that at least part of the justification for the<br>
criterion in the first place was that Amazon was using Xen for EC2, but<br>
that is no longer the case, most if not all EC2 instance types no<br>
longer use Xen. Another consideration is that there was a time when KVM<br>
was still pretty new stuff and VirtualBox was not as popular as it is<br>
now, and Xen was still widely used for general hobbyist virtualization<br>
purposes; I don&#39;t believe that&#39;s really the case any more.<br>
<br>
So...with thanks to Lars / Xen Project for their input, I&#39;m afraid I&#3=
9;m<br>
still in favor of this proposal, and still think we should drop the Xen<br>
criterion for F31. This wouldn&#39;t mean Xen is out of Fedora and we don&#=
39;t<br>
care about it any more, or anything like that; it would still be a part<br>
of Fedora and we still would like Xen to work on Fedora and Fedora to<br>
work on Xen, just like any other non-release-blocking package. It just<br>
means we would no longer block releases if it does not work.<br></blockquot=
e><div><br></div><div>Agreed.</div><br></div></div>

--000000000000820779058d3c1600--


--===============6511299702859056738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6511299702859056738==--

