Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B23D3AE9
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 15:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160109.294406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6uvw-0007LC-Jw; Fri, 23 Jul 2021 13:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160109.294406; Fri, 23 Jul 2021 13:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6uvw-0007Im-GQ; Fri, 23 Jul 2021 13:09:44 +0000
Received: by outflank-mailman (input) for mailman id 160109;
 Fri, 23 Jul 2021 13:09:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=46gW=MP=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1m6uvu-0007Ig-4m
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 13:09:42 +0000
Received: from mail-ed1-x531.google.com (unknown [2a00:1450:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c0c4be2-3c5e-4cd5-b1ac-07e5fbee84bc;
 Fri, 23 Jul 2021 13:09:40 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id k15so1640468edq.13
 for <xen-devel@lists.xenproject.org>; Fri, 23 Jul 2021 06:09:40 -0700 (PDT)
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
X-Inumbo-ID: 3c0c4be2-3c5e-4cd5-b1ac-07e5fbee84bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rRCzeO219V/p2TwkNxchXI7lnEXVmeMIUIGjhcs9Cmc=;
        b=Gve9eT3FTWtBeRJta891nIb8UUgzP17toaBL/RargwdNQBGJOa3CixohERx3eWJo6R
         RsJZPwPVjoowy/K8N5ntIA9fXqf8h1X/EntqBd0k917FERdLzZqb5Lp4OCTKS98F4NuR
         xWPGCFrzeStcAlqJPtNN66keuNU1rfQPKK6gphVDq96CPCNp4QW/Xmtpl3N2Ld1yte8h
         d0Lv4wPfGAINObFcQLbhsTFU4lu3obDL610xZoCXQV7uPI0N+RNsExRGt2yhLzS5QZFG
         BskV5NnfEeupwErZLFSGMEMbbSdVMUovcdds/3bzlQanXizKVygi9113iLoAWZlP/Dgf
         pAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rRCzeO219V/p2TwkNxchXI7lnEXVmeMIUIGjhcs9Cmc=;
        b=YMKV/8AyQlH05yOeguaZ25YgvQUX65UUd7imeG3neviW+V+ItPlkfeNMWxzQIh/g+O
         eRedMIh3biBXg4d+E+EIT5+kfOsuQ/SXpo6wRi93E4WqYAuh3sSgRqJUxnMGMXb0++af
         qOXLgE6Yxl48xaagkkB8/Yl9T4XGZsGuk7bj2y0DRDZOzlEPV2QYGS2whB4KxQd2c1fB
         MYFDKS7so3TeFrE3ZyjjlpHekTDA5d2WE4fDHBv9huQM5e9g7gmw+L+u2VC/2VwHtOUA
         gc5wFg+tpnhvmurdyZdvrVTKV4ijyYSlXhferXAC8YcQ3nODO1pte2+/YayIgL8io/Dt
         kOjA==
X-Gm-Message-State: AOAM532nYyTji//IdHUucDeNIJmaNspPfwZ3A7VIHgYfNqaGvCPj/3F/
	Ouvck9gbh8WAEAFo9CsxafjsRAVVOaSGjPEMEh0=
X-Google-Smtp-Source: ABdhPJx+jSbNzbaJnnWuUzAsdb5uut9qOiEPl7V6+jaybztx+I60jl3/lqVoy389jbonlvhjNKVp4klPRmdK6RfjBio=
X-Received: by 2002:a05:6402:2206:: with SMTP id cq6mr5499274edb.209.1627045779797;
 Fri, 23 Jul 2021 06:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <87r1fzclw0.fsf@vates.fr> <6da30009-d817-f48e-11b4-ba9c92cde93d@suse.com>
 <87k0lqmmf8.fsf@vates.fr> <ea129173-c1fa-76f3-4964-8491b6728ca0@suse.com>
 <87wnpqm380.fsf@vates.fr> <14d1b95e-9d3a-8464-010b-d7796a26a8c4@suse.com> <87tukqy9gw.fsf@vates.fr>
In-Reply-To: <87tukqy9gw.fsf@vates.fr>
From: George Dunlap <dunlapg@umich.edu>
Date: Fri, 23 Jul 2021 14:09:28 +0100
Message-ID: <CAFLBxZaURZgLYPbKjxBv_btNPzX9D5w3gFCsVrTH0Xw=RfgPug@mail.gmail.com>
Subject: Re: Suggested changes to the admission policy of the vulnerability
 pre-disclosure list
To: "Charles-H. Schulz" <charles.schulz@vates.fr>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000bcf98105c7ca1dee"

--000000000000bcf98105c7ca1dee
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 9:49 AM Charles-H. Schulz <charles.schulz@vates.fr>
wrote:

>
> Jan Beulich @ 2021-07-19 08:44 CEST:
>
> >>
> >> They act as a resource center for their downstreams, but the
> information goes
> >> top down, i.e from the software developer to the downstream, not the
> >> opposite. Also how it entails an even bigger change to the list policy
> is
> >> unclear to me.
> >
> > For things to make sense (as you seem to agree with as per further up),
> > if their downstreams aren't to subscribe to our (and perhaps other)
> > pre-disclosure list themselves, the CERTs would need to act as a proxy,
> > in that they'd be permitted to relay the information before the embargo
> > ends. I didn't think there would be much of a difficulty seeing that
> > this would be more of a change to the policy.
>
> Indeed, because you assume that CERTs will communicate information before
> they are public. But they don't work that way in that they act as the legal
> and actual hub for the public information and listing of vulnerabilities
> reports (CVEs etc.) What they do before the end of the embargo date I
> already
> explained, and that specifically does not entail sharing the information
> with
> downstream users. So to me there is no big change of policy - this is the
> highway patrol sharing the license plate numbers of criminals or suspects
> with the city police.
>

Nonetheless, you still haven't made a clear case why being informed of the
vulnerabilities *under embargo* is necessary.  Anyone can sign up to the
xen-announce mailing list and receive notifications of XSAs at the moment
the embargo lifts.  We advertise *that new advisories are coming out* on
the main XSA webpage [1] and in a machine-readable JSON file [2] as soon as
the predisclosure happens.  (There are also libraries [3] to consume the
JSON file, and an example program [4] which could be run in a cron job to
alert someone to upcoming public XSA disclosures.) The delta between the
predisclosure and the public disclosure is typically two weeks.

Someone could argue that all of the activities you describe -- looking for
larger patterns of vulnerabilities, acting as a clearinghouse /
notification channel / advisory system for downstreams, etc -- could be
done by observing the public disclosures, particularly if suitable people
were alerted to upcoming public disclosures (and thus ready to process them
as soon as they come out).  What is needed is to make the case that this is
insufficient -- that having the extra two weeks to process things before
the public disclosure will be of material benefit in those activities.

(Hopefully it should be clear that I'm inviting you to make such a case.)

[1] https://xenbits.xenproject.org/xsa/
[2] https://xenbits.xenproject.org/xsa/xsa.json
[3]
https://gitlab.com/xen-project/people/gdunlap/go-xenlib/-/tree/master/xsalib
[4]
https://gitlab.com/xen-project/people/gdunlap/go-xenlib/-/tree/master/scripts/xsa-alert


> >> The what if question is not a valid one, as you are either recognized
> as a
> >> national CERT (there may sometimes be more than one) or you're not, by
> >> regulatory approval of some sort.  Nobody else can claim they're a
> national
> >> CERT.
> >> You can be a private CERT, but that's out of the scope of my request.
> >>
> >>> The present items on the list try to use pretty generic
> >>> terms, while your suggestion is pretty specific.
> >>
> >> So how is that a problem in our this specific instance?
> >
> > Why would we exclude private CERTs? I could easily see there being
> > countries which have no "national CERT" (for a variety of reasons),
> > with some private / non-government organization jumping in.
> >
>
> This is a good point I'm not making :)
> My request is solely about national CERTs, I do not feel that I have enough
> standing here requesting that private CERTs be added to the list, although
> I'm sure there's a point to be made here as well.
>

Jan, I think if you think it's better to include "private CERTs" (do such
things exist?), then it should be up to you (or someone else in favor of
such a thing) to craft the criteria for inclusion.  I personally think
limiting ourselves to national CERTs to begin with is fine.

In any case, what's needed to move things forward (absent further
discussion) is:

1. Specific proposed changes to the security policy to be hammered out

2. Someone to hold a project-wide vote, in accordance with the XenProject
Governance Document.

Normally #2 would be me, but today is my last day until January.

 -George

--000000000000bcf98105c7ca1dee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 19, 2021 at 9:49 AM Charl=
es-H. Schulz &lt;<a href=3D"mailto:charles.schulz@vates.fr">charles.schulz@=
vates.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br>
Jan Beulich @ 2021-07-19 08:44 CEST:<br>
<br>
&gt;&gt; <br>
&gt;&gt; They act as a resource center for their downstreams, but the infor=
mation goes<br>
&gt;&gt; top down, i.e from the software developer to the downstream, not t=
he<br>
&gt;&gt; opposite. Also how it entails an even bigger change to the list po=
licy is<br>
&gt;&gt; unclear to me. <br>
&gt;<br>
&gt; For things to make sense (as you seem to agree with as per further up)=
,<br>
&gt; if their downstreams aren&#39;t to subscribe to our (and perhaps other=
)<br>
&gt; pre-disclosure list themselves, the CERTs would need to act as a proxy=
,<br>
&gt; in that they&#39;d be permitted to relay the information before the em=
bargo<br>
&gt; ends. I didn&#39;t think there would be much of a difficulty seeing th=
at<br>
&gt; this would be more of a change to the policy.<br>
<br>
Indeed, because you assume that CERTs will communicate information before<b=
r>
they are public. But they don&#39;t work that way in that they act as the l=
egal<br>
and actual hub for the public information and listing of vulnerabilities<br=
>
reports (CVEs etc.) What they do before the end of the embargo date I alrea=
dy<br>
explained, and that specifically does not entail sharing the information wi=
th<br>
downstream users. So to me there is no big change of policy - this is the<b=
r>
highway patrol sharing the license plate numbers of criminals or suspects<b=
r>
with the city police. <br></blockquote><div><br></div><div>Nonetheless, you=
 still haven&#39;t made a clear case why being informed of the vulnerabilit=
ies *under embargo* is necessary.=C2=A0 Anyone can sign up to the xen-annou=
nce mailing list and receive notifications of XSAs at the moment the embarg=
o lifts.=C2=A0 We advertise *that new advisories are coming out* on the mai=
n XSA webpage [1] and in a machine-readable JSON file [2] as soon as the pr=
edisclosure happens.=C2=A0 (There are also libraries [3] to consume the JSO=
N file, and an example program [4] which could be run in a cron job to aler=
t someone to upcoming public XSA disclosures.) The delta between the predis=
closure and the public disclosure is typically two weeks.<br><div><br></div=
><div>Someone could argue that all of the activities you describe -- lookin=
g for larger patterns of vulnerabilities, acting as a clearinghouse / notif=
ication channel / advisory system for downstreams, etc -- could be done by =
observing the public disclosures, particularly if suitable people were aler=
ted to upcoming public disclosures (and thus ready to process them as soon =
as they come out).=C2=A0 What is needed is to make the case that this is in=
sufficient -- that having the extra two weeks to process things before the =
public disclosure will be of material benefit in those activities.</div><di=
v><br></div><div>(Hopefully it should be clear that I&#39;m inviting you to=
 make such a case.)<br></div></div><br><div>[1] <a href=3D"https://xenbits.=
xenproject.org/xsa/">https://xenbits.xenproject.org/xsa/</a></div><div>[2] =
<a href=3D"https://xenbits.xenproject.org/xsa/xsa.json">https://xenbits.xen=
project.org/xsa/xsa.json</a></div><div>[3] <a href=3D"https://gitlab.com/xe=
n-project/people/gdunlap/go-xenlib/-/tree/master/xsalib">https://gitlab.com=
/xen-project/people/gdunlap/go-xenlib/-/tree/master/xsalib</a></div><div>[4=
] <a href=3D"https://gitlab.com/xen-project/people/gdunlap/go-xenlib/-/tree=
/master/scripts/xsa-alert">https://gitlab.com/xen-project/people/gdunlap/go=
-xenlib/-/tree/master/scripts/xsa-alert</a></div><div>=C2=A0<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt; The what if question is not a valid one, as you are either recogni=
zed as a<br>
&gt;&gt; national CERT (there may sometimes be more than one) or you&#39;re=
 not, by<br>
&gt;&gt; regulatory approval of some sort.=C2=A0 Nobody else can claim they=
&#39;re a national<br>
&gt;&gt; CERT.<br>
&gt;&gt; You can be a private CERT, but that&#39;s out of the scope of my r=
equest. <br>
&gt;&gt; <br>
&gt;&gt;&gt; The present items on the list try to use pretty generic<br>
&gt;&gt;&gt; terms, while your suggestion is pretty specific.<br>
&gt;&gt; <br>
&gt;&gt; So how is that a problem in our this specific instance?<br>
&gt;<br>
&gt; Why would we exclude private CERTs? I could easily see there being<br>
&gt; countries which have no &quot;national CERT&quot; (for a variety of re=
asons),<br>
&gt; with some private / non-government organization jumping in.<br>
&gt;<br>
<br>
This is a good point I&#39;m not making :)<br>
My request is solely about national CERTs, I do not feel that I have enough=
<br>
standing here requesting that private CERTs be added to the list, although<=
br>
I&#39;m sure there&#39;s a point to be made here as well.<br></blockquote><=
div><br></div><div>Jan, I think if you think it&#39;s better to include &qu=
ot;private CERTs&quot; (do such things exist?), then it should be up to you=
 (or someone else in favor of such a thing) to craft the criteria for inclu=
sion.=C2=A0 I personally think limiting ourselves to national CERTs to begi=
n with is fine.</div><div><br></div>In any case, what&#39;s needed to move =
things forward (absent further discussion) is:</div><div class=3D"gmail_quo=
te"><br></div><div class=3D"gmail_quote">1. Specific proposed changes to th=
e security policy to be hammered out<br></div><div class=3D"gmail_quote"><b=
r></div><div class=3D"gmail_quote">2. Someone to hold a project-wide vote, =
in accordance with the XenProject Governance Document.</div><div class=3D"g=
mail_quote"><br></div><div class=3D"gmail_quote">Normally #2 would be me, b=
ut today is my last day until January.</div><div class=3D"gmail_quote"><br>=
</div><div class=3D"gmail_quote">=C2=A0-George<br></div></div>

--000000000000bcf98105c7ca1dee--

