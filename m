Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5E98F439
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 21:12:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyL7N-0007Pv-Tl; Thu, 15 Aug 2019 19:09:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TgGS=WL=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hyL7M-0007Ph-BI
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 19:09:00 +0000
X-Inumbo-ID: 2115fdcc-bf90-11e9-b90c-bc764e2007e4
Received: from mail-io1-xd2a.google.com (unknown [2607:f8b0:4864:20::d2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2115fdcc-bf90-11e9-b90c-bc764e2007e4;
 Thu, 15 Aug 2019 19:08:56 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id t3so1320521ioj.12;
 Thu, 15 Aug 2019 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=li8kLe7Fxipgq48zxN46f9bDSgmGztb4mDsx665fJ7s=;
 b=NNfHQemdOgD+LcrjsN+i5FoQxdf0xEmG9+F+JD7M2NDV2vL84HOYEut2lSWtq4sRWc
 bVuJtNHvXHPGKoksB44RbBJJyaTpqoj/YMQk0PjTDqm1TlkBZNXWAzQ5ChG+xWv/P0XV
 E18uSRsfTAWFO36+y18I6/JMseN+057vtab4Vks12NaOVEhi2PuuNRIwRWXJyx0jXy9S
 gwvEfZmxbK7vVVyiVR+UmQwaClem+Vtt+k2Tdn2yd0nC+ABQkfb8mwEww79wCz34gPeG
 yeM3SK4uEo1odhn07kQeOASRjnOg5YKptbIJybsUUhAHpcJyVBtfyLC0ozr0XxSVg+9a
 dNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=li8kLe7Fxipgq48zxN46f9bDSgmGztb4mDsx665fJ7s=;
 b=DBQoVJvP2nvT2kerD60HhVsZEryZRkjGcKuQprSLSCW9F66G7lpbZcYYGCLM/L7wId
 tOwuU7j2QJB+gzaghBoO3cbKVECKkLB9Las0n12E05Rd8CLh2FMZdrMrfTGWb5L2KzWN
 liVrNLZLNCyTl7nE0KbJGZlIVBirRI1iEgJBwI39Szv7SFV6ycLeV92pg6PPGdhFCk1h
 bDjTVUwnDWvC6n9bhIkv+/tK1GUXTqW24cwqBCdLBfo1fwPt0rOkVGsHwfzJytHUFlk2
 fZ+B4PamndwLF2qCa89whAOHg6tC87XKNCGcI9nUsj3EOy8UxJHGZGywtZkSkNFYSGzY
 DnaA==
X-Gm-Message-State: APjAAAWxn9fBCWwObOFa8d4SuOgH76KxbHh6ENE609Vi6SQr2wwzjvEb
 I/u2nUgHDxlVRgCS6zYfvVmeblJf
X-Google-Smtp-Source: APXvYqxL659QyGKsMWNmiTmmBaUqdWgPYr+N/07KTJl77TLrNwg+hMbWrvG1P9HcoPqn9HslUcnmBQ==
X-Received: by 2002:a5e:9319:: with SMTP id k25mr7486552iom.137.1565896135590; 
 Thu, 15 Aug 2019 12:08:55 -0700 (PDT)
Received: from [100.64.72.214] ([205.185.206.122])
 by smtp.gmail.com with ESMTPSA id n17sm2832575iog.63.2019.08.15.12.08.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 12:08:55 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16G77)
In-Reply-To: <B1A585DE-144B-466F-BC35-3E68E6469D96@xenproject.org>
Date: Thu, 15 Aug 2019 15:08:53 -0400
Message-Id: <AB4A2D57-529C-42A1-8173-9C893BC348DE@gmail.com>
References: <AB34D39A-A120-440E-9309-3950E7A465A5@citrix.com>
 <6785899F-48FE-4977-81D1-3AA700241857@gmail.com>
 <E85126B0-E13C-4DBE-AB85-5C1DF3836B42@citrix.com>
 <3963D85D-BCF6-49CC-A04E-00A03E6D6C9F@gmail.com>
 <B1A585DE-144B-466F-BC35-3E68E6469D96@xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [Xen-devel] [win-pv-devel]  [RFC] Code of Conduct
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============5783738016497614687=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5783738016497614687==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-3C43F77D-F8BF-4BCF-A7B5-5A01DA1DBB62
Content-Transfer-Encoding: 7bit


--Apple-Mail-3C43F77D-F8BF-4BCF-A7B5-5A01DA1DBB62
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Aug 15, 2019, at 14:46, Lars Kurth <lars.kurth.xen@gmail.com> wrote:
>> On 15 Aug 2019, at 19:27, Rich Persaud <persaur@gmail.com> wrote:
>> On Aug 15, 2019, at 14:01, Lars Kurth <lars.kurth@citrix.com> wrote:
>>=20
>>> Hi Rich,
>>>=20
>>> thanks for the feedback. I am going to=20
>>>=20
>>> =EF=BB=BFOn 15/08/2019, 18:23, "Rich Persaud" <persaur@gmail.com> wrote:=

>>>=20
>>>> On Aug 9, 2019, at 13:48, Lars Kurth <lars.kurth@citrix.com> wrote:
>>>>=20
>>>> Hi all,
>>>=20
>>>   Hi Lars,
>>>=20
>>>>=20
>>>> Following the discussion we had at the Developer Summit (see https://wi=
ki.xenproject.org/wiki/Design_Sessions_2019#Community_Issues_.2F_Improvement=
s_-_Communication.2C_Code_of_Conduct.2C_etc. for notes) I put together a dra=
ft for the Code of Conduct which can be found here as well as inlined below
>>>> https://docs.google.com/document/d/1NnWdU_VnC1N_ZzxQG6jU9fnY2GPVCcfPJT5=
KY61WXJM/edit?usp=3Dsharing
>>>>=20
>>>> It is based on the LF Events CoC as we agreed on (the diff is attached)=
. I took the scope and enforcement sections from https://www.contributor-cov=
enant.org/version/1/4/code-of-conduct.html and simplified it rather than inv=
enting something new.
>>>=20
>>>   Is there precedent for applying a legal contract (Code of Conduct) tha=
t was designed for physical space (conference event) to an online context?  =
 Is there an existing Code of Conduct that was legally designed for a simila=
r, online open-source community context, e.g. operating system or hypervisor=
 or other systems-level software dev?
>>>=20
>>> If you look at https://www.contributor-covenant.org/version/1/4/code-of-=
conduct.html or many other examples, what we ended up with is almost identic=
al. The same is true for most other CoCs which are used as =E2=80=9Cgold sta=
ndard=E2=80=9D.
>>=20
>> Thanks for the pointer, that's exactly what I was hoping to find.  Here i=
s some text from Contributor Covenant:
>>=20
>> "Instances of abusive, harassing, or otherwise unacceptable behavior may b=
e reported by contacting the project team at [INSERT EMAIL ADDRESS]. All com=
plaints will be reviewed and investigated and will result in a response that=
 is deemed necessary and appropriate to the circumstances. The project team i=
s obligated to maintain confidentiality with regard to the reporter of an in=
cident. Further details of specific enforcement policies may be posted separ=
ately.
>> Project maintainers who do not follow or enforce the Code of Conduct in g=
ood faith may face temporary or permanent repercussions as determined by oth=
er members of the project=E2=80=99s leadership."
>>=20
>> This is different from the proposed CoC, because:
>>=20
>> (a) repercussions are not specified, i.e. they can be contextual
>> (b) there is a confidentiality provision
>> (c) decisions are made by open-source project leadership, not a separate "=
CoC team" with TBD members, electoral process and governance=20
>>=20
>> Can Xen Project adopt Contributor Covenant directly?  It has a large base=
 of adopters, including Intel and Google projects, so we would benefit from u=
pstream improvements as the CoC is tested in the real world:  https://www.co=
ntributor-covenant.org/adopters
>=20
> We most definitely could and I am open to the idea. However, when Linux ad=
opted it, there was significant controversy because of the origin of the Con=
tributor Covenant
>=20
> See https://itsfoss.com/linux-code-of-conduct/
>=20
> I am not sure what the risk would be if we followed Linux
>=20
> However, we can address all of the above with what we have: The section yo=
u quoted was indeed from the covenant (see attribution) and I simply modifie=
d it based on the discussion we had at the summit.=20
>=20
>=20
> a) We could leave the repercussion section out - I think it is clearer to h=
ave one, but we can clearly debate the pros and cons of not having one
> b) There is a confidentiality provision: "The Xen Project=E2=80=99s CoC te=
am is obligated to maintain confidentiality with regard to the reporter of a=
n incident."
> c) In the design session at the summit the present project leadership team=
 members felt we should have a CoC team, which is why I changed it
>=20
> In any case, the Covenant suggested to customise the template to our needs=
. And that's what I have done.
>=20
> It was also interesting that when I started with the LF events CoC, I stil=
l ended up with something very similar to most of the other CoCs out there

Differences remain, e.g. Contributor Covenant has a whitelist and blacklist o=
f acceptable behaviors, the proposed Xen CoC only has a blacklist.  Although=
 you say the CoC is not a legal document, the proposed Xen statement of acce=
ptable behaviors does mention "applicable laws", which is absent from Contri=
butor Covenant.

Without getting into the merits of Contributor Covenant, there is value in r=
eusing an "upstream CoC" that has been vetted by many organizations and is b=
eing continually tested in the real world. =20

Similar to the "macro supply chain" topic:  if Xen Project must make changes=
 to the upstream CoC, these can be done as a logical patch (rather than an o=
rphaned fork) so we can incorporate upstream improvements.  The rationale fo=
r each diff against the upstream CoC can be in a revision-controlled doc, so=
 that future CoC maintainers understand the reasoning behind each diff, as c=
ommunities and contributors evolve.

Are there upstream examples of electoral governance for "CoC teams", or woul=
d we need to develop that from scratch?  Xen Summit design session notes say=
:=20
"An area for discussion which was not quite agreed upon pending an initial p=
roposal was how we would approach the handling of issues
A committee
Probably 2-3 people of different backgrounds maybe from different subproject=
s"

Could we also include existing Xen project leadership in the CoC team?  How w=
ould selection of people for a CoC team differ from the existing process for=
 selecting committers, etc?

Rich=

--Apple-Mail-3C43F77D-F8BF-4BCF-A7B5-5A01DA1DBB62
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><span></span><blockquote type=3D"cite"><span>On Aug 15, 2019, at 1=
4:46, Lars Kurth &lt;<a href=3D"mailto:lars.kurth.xen@gmail.com">lars.kurth.=
xen@gmail.com</a>&gt; wrote:</span></blockquote><blockquote type=3D"cite"><s=
pan></span></blockquote><blockquote type=3D"cite"><span></span></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>On 15 Aug 2019, at=
 19:27, Rich Persaud &lt;<a href=3D"mailto:persaur@gmail.com">persaur@gmail.=
com</a>&gt; wrote:</span></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>On Aug 15, 2019, at 14:01, Lars Kurth &lt;<=
a href=3D"mailto:lars.kurth@citrix.com">lars.kurth@citrix.com</a>&gt; wrote:=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Hi Rich,</sp=
an><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquot=
e></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>thanks for the feedback. I am going to <=
/span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>=EF=BB=BFOn 15/08/2019, 18:23, "Rich P=
ersaud" &lt;<a href=3D"mailto:persaur@gmail.com">persaur@gmail.com</a>&gt; w=
rote:</span><br></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>On Au=
g 9, 2019, at 13:48, Lars Kurth &lt;<a href=3D"mailto:lars.kurth@citrix.com"=
>lars.kurth@citrix.com</a>&gt; wrote:</span><br></blockquote></blockquote></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>Hi all,</span><br></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span></span><br></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;=
Hi Lars,</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></s=
pan><br></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>Following the discussion we had at the Developer Summit (s=
ee <a href=3D"https://wiki.xenproject.org/wiki/Design_Sessions_2019#Communit=
y_Issues_.2F_Improvements_-_Communication.2C_Code_of_Conduct.2C_etc">https:/=
/wiki.xenproject.org/wiki/Design_Sessions_2019#Community_Issues_.2F_Improvem=
ents_-_Communication.2C_Code_of_Conduct.2C_etc</a>. for notes) I put togethe=
r a draft for the Code of Conduct which can be found here as well as inlined=
 below</span><br></blockquote></blockquote></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span><a href=3D"https://docs.google.com/document/d/1Nn=
WdU_VnC1N_ZzxQG6jU9fnY2GPVCcfPJT5KY61WXJM/edit?usp=3Dsharing">https://docs.g=
oogle.com/document/d/1NnWdU_VnC1N_ZzxQG6jU9fnY2GPVCcfPJT5KY61WXJM/edit?usp=3D=
sharing</a></span><br></blockquote></blockquote></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span></span><br></blockquote></blockquote></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>It is based on the LF E=
vents CoC as we agreed on (the diff is attached). I took the scope and enfor=
cement sections from <a href=3D"https://www.contributor-covenant.org/version=
/1/4/code-of-conduct.html">https://www.contributor-covenant.org/version/1/4/=
code-of-conduct.html</a> and simplified it rather than inventing something n=
ew.</span><br></blockquote></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></=
span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;Is ther=
e precedent for applying a legal contract (Code of Conduct) that was designe=
d for physical space (conference event) to an online context? &nbsp;&nbsp;Is=
 there an existing Code of Conduct that was legally designed for a similar, o=
nline open-source community context, e.g. operating system or hypervisor or o=
ther systems-level software dev?</span><br></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>If yo=
u look at <a href=3D"https://www.contributor-covenant.org/version/1/4/code-o=
f-conduct.html">https://www.contributor-covenant.org/version/1/4/code-of-con=
duct.html</a> or many other examples, what we ended up with is almost identi=
cal. The same is true for most other CoCs which are used as =E2=80=9Cgold st=
andard=E2=80=9D.</span><br></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Thanks fo=
r the pointer, that's exactly what I was hoping to find. &nbsp;Here is some t=
ext from Contributor Covenant:</span><br></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>"Instanc=
es of abusive, harassing, or otherwise unacceptable behavior may be reported=
 by contacting the project team at [INSERT EMAIL ADDRESS]. All complaints wi=
ll be reviewed and investigated and will result in a response that is deemed=
 necessary and appropriate to the circumstances. The project team is obligat=
ed to maintain confidentiality with regard to the reporter of an incident. Fu=
rther details of specific enforcement policies may be posted separately.</sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>Project maintainers who do not follow or enforce the Code of Co=
nduct in good faith may face temporary or permanent repercussions as determi=
ned by other members of the project=E2=80=99s leadership."</span><br></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
></span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>This is different from the proposed CoC, because:</span><=
br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span> (a) repercussions are not specified, i.e. the=
y can be contextual</span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span> (b) there is a confidentiality provis=
ion</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span> (c) decisions are made by open-source project leaders=
hip, not a separate "CoC team" with TBD members, electoral process and gover=
nance </span><br></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>Can Xen Project adopt Contributo=
r Covenant directly? &nbsp;It has a large base of adopters, including Intel a=
nd Google projects, so we would benefit from upstream improvements as the Co=
C is tested in the real world: &nbsp;<a href=3D"https://www.contributor-cove=
nant.org/adopters">https://www.contributor-covenant.org/adopters</a></span><=
br></blockquote></blockquote><blockquote type=3D"cite"><span></span><br></bl=
ockquote><blockquote type=3D"cite"><span>We most definitely could and I am o=
pen to the idea. However, when Linux adopted it, there was significant contr=
oversy because of the origin of the Contributor Covenant</span><br></blockqu=
ote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=
=3D"cite"><span>See <a href=3D"https://itsfoss.com/linux-code-of-conduct/">h=
ttps://itsfoss.com/linux-code-of-conduct/</a></span><br></blockquote><blockq=
uote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><=
span>I am not sure what the risk would be if we followed Linux</span><br></b=
lockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquot=
e type=3D"cite"><span>However, we can address all of the above with what we h=
ave: The section you quoted was indeed from the covenant (see attribution) a=
nd I simply modified it based on the discussion we had at the summit. </span=
><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><b=
lockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"ci=
te"><span>a) We could leave the repercussion section out - I think it is cle=
arer to have one, but we can clearly debate the pros and cons of not having o=
ne</span><br></blockquote><blockquote type=3D"cite"><span>b) There is a conf=
identiality provision: "The Xen Project=E2=80=99s CoC team is obligated to m=
aintain confidentiality with regard to the reporter of an incident."</span><=
br></blockquote><blockquote type=3D"cite"><span>c) In the design session at t=
he summit the present project leadership team members felt we should have a C=
oC team, which is why I changed it</span><br></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>In any c=
ase, the Covenant suggested to customise the template to our needs. And that=
's what I have done.</span><br></blockquote><blockquote type=3D"cite"><span>=
</span><br></blockquote><blockquote type=3D"cite"><span>It was also interest=
ing that when I started with the LF events CoC, I still ended up with someth=
ing very similar to most of the other CoCs out there</span><br></blockquote>=
<span></span><br><span>Differences remain, e.g. Contributor Covenant has a w=
hitelist and blacklist of acceptable behaviors, the proposed Xen CoC only ha=
s a blacklist. &nbsp;Although you say the CoC is not a legal document, the p=
roposed Xen statement of acceptable behaviors does mention "applicable laws"=
, which is absent from Contributor Covenant.</span></div><div dir=3D"ltr"><b=
r></div><div dir=3D"ltr">Without getting into the merits of Contributor Cove=
nant, there is value in reusing an "upstream CoC" that has been vetted by ma=
ny organizations and is being continually tested in the real world. &nbsp;</=
div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Similar to the "macro supply=
 chain" topic: &nbsp;if Xen Project must make changes to the upstream CoC, t=
hese can be done as a logical patch (rather than an orphaned fork) so we can=
 incorporate upstream improvements. &nbsp;The rationale for each diff agains=
t the upstream CoC can be in a revision-controlled doc, so that future CoC m=
aintainers understand the reasoning behind each diff, as communities and con=
tributors evolve.</div><div dir=3D"ltr"><span></span><br><span>Are there ups=
tream examples of electoral governance for "CoC teams", or would we need to d=
evelop that from scratch? &nbsp;Xen Summit design session notes say:&nbsp;</=
span></div><div dir=3D"ltr">"<span style=3D"background-color: rgba(255, 255,=
 255, 0);">An area for discussion which was not quite agreed upon pending an=
 initial proposal was how we would approach the handling of issues</span></d=
iv><div dir=3D"ltr"><ul style=3D"list-style-type: square; margin: 0.3em 0px 0=
px 1.6em; padding: 0px; list-style-image: url(&quot;data:image/svg+xml,%3Csv=
g xmlns=3D%22http://www.w3.org/2000/svg%22 width=3D%225%22 height=3D%2213%22=
 viewBox=3D%220 0 1.323 3.44%22%3E %3Cpath fill=3D%22%23638c9c%22 d=3D%22M0 1=
.852v1.323h1.323V1.852z%22/%3E %3C/svg%3E&quot;);"><li style=3D"margin-botto=
m: 0.1em;"><span style=3D"background-color: rgba(255, 255, 255, 0);">A commi=
ttee</span></li><li style=3D"margin-bottom: 0.1em;"><span style=3D"backgroun=
d-color: rgba(255, 255, 255, 0);">Probably 2-3 people of different backgroun=
ds maybe from different subprojects"</span></li></ul><div><br></div><div>Cou=
ld we also include existing Xen project leadership in the CoC team? &nbsp;Ho=
w would selection of people for a CoC team differ from the existing process f=
or selecting committers, etc?</div><span></span><br><span>Rich</span></div><=
/body></html>=

--Apple-Mail-3C43F77D-F8BF-4BCF-A7B5-5A01DA1DBB62--


--===============5783738016497614687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5783738016497614687==--

