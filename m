Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62614904FF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 17:53:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyeU4-0004Fv-OR; Fri, 16 Aug 2019 15:49:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L7QI=WM=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hyeU3-0004FX-A7
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 15:49:43 +0000
X-Inumbo-ID: 72084944-c03d-11e9-813a-bc764e2007e4
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72084944-c03d-11e9-813a-bc764e2007e4;
 Fri, 16 Aug 2019 15:49:35 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id x4so7059113iog.13;
 Fri, 16 Aug 2019 08:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=TW5UQErd2cvFx0DjHwqJjwN72y+nUCcn+eiNo9VqJng=;
 b=hKV5hrE+JYIYTQVF4omM9XOGxecJLKcwmvv18Q0HcalRstkvYuyhsVNcKGsj0qJLll
 Q13zq2+9oWRu+4UWiTsw2kKjEl81wtQ05fO/ez5b5AABlWgbjWLSD336E8w68YAcDotS
 oQNQsUstbUmgSz1WJgF2f7zzkHjaaMY3bIkj0fttiJ1CZosZsMCWtYD8NnMR+sp5pAz1
 yuTMki6duIL0oBuJZcnwK1qvu9ByuZUczUcS43abSk4ooGgb+X2VjHhj3J+nbdPNWefg
 6o9oNyYiJDVKMiIkF3zfEKG9nDyliqhYQ8ZeI0JnCaBvyXPlfdaBBZUH3VD3cxWaFA/O
 ZggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=TW5UQErd2cvFx0DjHwqJjwN72y+nUCcn+eiNo9VqJng=;
 b=Rs0Hyz2gva7tYp52/jYbSP8kjHheKR/SeesUOONCstnMjhxcbAmLrtnbpyG60IL7/+
 dka9fMz83DU8UWsBqf0Wq2UxiiBLA7OQlP/4ExeQCI62BOC9dNoNprK79HFaCn3NCKOq
 L3I5jDfeep9kHE7TQKMts02Gwn4rNmqUHg/StKHqeVSxnHiLmyp1GZ7yi2UvFFigyXSz
 7P7+RRRsWLDIlzDmKAwBbeS2hKOrHYLTlOyNapz6hP7PE+yNrOMx0IBVYH3yOAWQOf9s
 pWF/LuCzxnVxQmTxrS6b/Ri5/JjzCChhFa1eOxvJ4D94OHRtNJQp+apbiCvVi3sCYTzQ
 /XMQ==
X-Gm-Message-State: APjAAAV8A6sr2t5oBQFVyWP4zD5BSuCXvk//zbjOcSM1wroQZXEHBMTp
 JxeixfEOopLDEiM05eDz7DAfRgrmHzs=
X-Google-Smtp-Source: APXvYqxeCY5v88JIJyZFqRYWJ3kPMdxJTL5iCYJpL8hP6DIM5bHOKudtPFZsk3ufR8IWYA8baAU3fA==
X-Received: by 2002:a5e:9308:: with SMTP id k8mr11488354iom.143.1565970574133; 
 Fri, 16 Aug 2019 08:49:34 -0700 (PDT)
Received: from [100.64.72.214] ([205.185.206.122])
 by smtp.gmail.com with ESMTPSA id d6sm6455180iod.17.2019.08.16.08.49.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 08:49:33 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16G77)
In-Reply-To: <38ac71b4-53c0-9402-2c6f-118f29818f85@citrix.com>
Date: Fri, 16 Aug 2019 11:49:32 -0400
Message-Id: <FCA290D6-2ECA-4B95-B327-7D263E0E4687@gmail.com>
References: <AB34D39A-A120-440E-9309-3950E7A465A5@citrix.com>
 <6785899F-48FE-4977-81D1-3AA700241857@gmail.com>
 <38ac71b4-53c0-9402-2c6f-118f29818f85@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [RFC] Code of Conduct
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
Content-Type: multipart/mixed; boundary="===============7142819244020162912=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7142819244020162912==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-90C9A0B8-3600-4655-8E4C-9A4D6E70CED4
Content-Transfer-Encoding: 7bit


--Apple-Mail-90C9A0B8-3600-4655-8E4C-9A4D6E70CED4
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Aug 16, 2019, at 07:19, George Dunlap <george.dunlap@citrix.com> wrote:
>=20
> On 8/15/19 6:23 PM, Rich Persaud wrote:
>>> On Aug 9, 2019, at 13:48, Lars Kurth <lars.kurth@citrix.com> wrote:
>>>=20
>>> Hi all,
>>=20
>> Hi Lars,
>>=20
>>>=20
>>> Following the discussion we had at the Developer Summit (see https://wik=
i.xenproject.org/wiki/Design_Sessions_2019#Community_Issues_.2F_Improvements=
_-_Communication.2C_Code_of_Conduct.2C_etc. for notes) I put together a draf=
t for the Code of Conduct which can be found here as well as inlined below
>>> https://docs.google.com/document/d/1NnWdU_VnC1N_ZzxQG6jU9fnY2GPVCcfPJT5K=
Y61WXJM/edit?usp=3Dsharing=20
>>>=20
>>> It is based on the LF Events CoC as we agreed on (the diff is attached).=
 I took the scope and enforcement sections from https://www.contributor-cove=
nant.org/version/1/4/code-of-conduct.html and simplified it rather than inve=
nting something new.
>>=20
>> Is there precedent for applying a legal contract (Code of Conduct) that w=
as designed for physical space (conference event) to an online context?   Is=
 there an existing Code of Conduct that was legally designed for a similar, o=
nline open-source community context, e.g. operating system or hypervisor or o=
ther systems-level software dev?
>=20
> This is sort of a strange question.
>=20
> Generally speaking, there was a link Lars pointed to in an earlier
> thread in preparation for this, making two suggestions about adopting a Co=
C:
>=20
> 1. Don't create your own CoC from scratch.  Learn from other people's
> experiences, mistakes, and so on, rather than re-inventing the wheel.
> This will hopefully reduce the chance of re-hashing mistakes other
> communities have made.
>=20
> 2. Don't copy-and-paste a CoC unmodified from another project.  Consider
> it, adapt it to your own community culture and situation.  This makes
> sure that the CoC is not a tick-box exercise, but that people in your
> community have thoughfully considered various issues and genuinely
> decided to commit to them.
>=20
> I think both of those bits of advice are good; and it appears to me that
> this is exactly what Lars (with input from a number of others) has done.
>=20
> There are two things that we want, in general:
>=20
> 1. To cast a vision for what ideal contributor behavior should be
>=20
> 2. To set a bar for minimum acceptable behavior, and a way for excluding
> people whose behavior consistently falls below that bar.
>=20
> One area in particular where Lars thought other CoCs were weak was in
> trying to combine #1 and #2.  They need different responses.  #1 needs
> encouragement and vision.  #2 needs teeth: We need to be able to apply
> penalties and exclude people.
>=20
> As a result, Lars has suggested (and many people have agreed), that we
> separate the two functions.  This document is about #2, not #1.  We plan
> to do #1 after #2 is completed.
>=20
>>> # Expected Behavior
>>> All Xen Project community members are expected to behave in accordance w=
ith=20
>>> professional standards, with both the Xen Project Code of Conduct as wel=
l as their=20
>>> respective employer=E2=80=99s policies governing appropriate workplace b=
ehavior, and=20
>>> applicable laws.
>>=20
>> In the x86 community call where this was first discussed, I suggested tha=
t we try to define desirable behavior, which we would like to incentivize an=
d promote.   In this current draft, we have a single sentence on positive be=
havior, with inclusion-by-reference to:
>=20
> We plan on doing this, but in another document.
>=20
>> If incorporation-by-reference is not sufficient, e.g. if we will maintain=
 a blacklist of unacceptable behavior for collaborative, online open-source d=
evelopment, do we also need a whitelist of acceptable behavior?  Within Xen s=
ource code, we have been moving away from blacklists towards whitelists.
>=20
> Unlike hypercalls, all human behavior cannot be enumerated; and if it
> could, 100% certainty cannot be obtained about what a certain behavior
> is, or even exactly what did or did not happen.  No matter what we write
> down, at some point, you're just going to have to either trust the
> people making the decisions.
>=20
>>> # Unacceptable Behavior
>>> Harassment will not be tolerated in the Xen Project Community in any for=
m,=20
>>> including but not limited to harassment based on gender, gender identity=
 and=20
>>> expression, sexual orientation, disability, physical appearance, body si=
ze, race,=20
>>> age, religion, ethnicity, nationality, level of experience, education, o=
r=20
>>> socio-economic status or any other status protected by laws in jurisdict=
ions in=20
>>> which community members are based. Harassment includes the use of abusiv=
e,=20
>>> offensive or degrading language, intimidation, stalking, harassing photo=
graphy=20
>>> or recording, inappropriate physical contact, sexual imagery and unwelco=
me=20
>>> sexual advances, requests for sexual favors, publishing others' private=20=

>>> information such as a physical or electronic address without explicit pe=
rmission
>>=20
>> Picking one item at random:  would a conference-originated blacklist proh=
ibition be appropriate for online open-source development?  E.g. if someone'=
s email address were included in a xen-devel thread (on the cc line), withou=
t obtaining explicit permission, would that be unacceptable behavior for a X=
en developer?  That could disqualify much of the current development communi=
ty.
>=20
> Suppose Bob has a private email address that he doesn't want to become
> public.  Suppose that Alice knows this address, and also knows that Bob
> wants this to be private.  And suppose that Alice and purposely CC's
> Bob's private email address on a mail to xen-devel in retribution for
> something (for instance, because Bob broke up with Alice).
>=20
> Is that harassment?  Yes, absolutely.
>=20
> Now, it may sometimes be difficult to determine whether something like
> "Alice knew that Bob wanted this private" and "Alice purposely revealed
> Bob's address" are true statements or not.  It may be in fact that *Bob*
> is raising a false issue with the CoC team in retribution for something
> *Alice* has done.
>=20
> This sort of situation puts the CoC team in a difficult place: If they
> don't act, and Alice really was harassing Bob, then they are effectively
> enabling Alice's behavior.  People like Bob will leave, and more people
> like Alice will come.  If they do act, and Alice wasn't really harassing
> Bob, then they are effectively enabling Bob's behavior; people like
> Alice will leave, and more people like Bob will come.
>=20
> Life is often unclear and messy; but that doesn't excuse us from acting.
> We've all got to try to make the best decision we can with limited
> information.
>=20
>>> Any report of harassment within the Xen Project community will be addres=
sed=20
>>> swiftly. Participants asked to stop any harassing behavior are expected t=
o=20
>>> comply immediately. Anyone who witnesses or is subjected to unacceptable=
=20
>>> behavior should notify the Xen Project=E2=80=99s CoC team via conduct@xe=
nproject.org.
>>>=20
>>> # Consequences of Unacceptable Behavior
>>> If a participant engages in harassing behavior, the Xen Project=E2=80=99=
s CoC team may=20
>>> take any action it deems appropriate, ranging from issuance of a warning=
 to the=20
>>> offending individual to expulsion from the Xen Project community.
>>=20
>> This is an enforceable action in the physical world, e.g. conference even=
t, but may be more difficult online.  As the existence of spam, bots, roboca=
llers and cyberattack attribution forensics have shown, digital identity is n=
ot as clear cut as physical identity at a conference.   It may be better to l=
ook for precedent CoC legal clauses that were designed for online contexts.
>=20
> I think you're overthinking this.  If someone is banned and then creates
> a false identity which thereafter behaves in such a way that we cannot
> tell it is the original person, then we will still have accomplished our
> goal of creating a harassment-free environment.  If someone is banned
> and continues to create false identities which continue to misbehave in
> the same way as the banned person, then 1) it will be clear who they
> are, and 2) we can temporarily prevent new addresses from subscribing to
> the list without a second level of approval.
>=20
> If we really get some sort of persistent troll who just won't go away,
> then we can decide what to do at that point.  But I would have
> absolutely no regrets about attempting to remove such a person from our
> community.
>=20
>> Let's assume that digital identity can be proven and a person can be expe=
lled from the Xen Project community.  Would this action apply only to the pe=
rson's digital identity at Company X, or also to their new digital identity a=
t Company Y?  i.e. would behavior and enforcement be scoped to the individua=
l, the company or both? =20
>=20
> Your examples are really contrived.
>=20
> The goal of the CoC, as stated, is to create a harassment-free
> environment.  If person A has done harassing at company X, and we ban
> them, then naturally they're banned at company Y as well.
>=20
> Banning other people at company X will generally not promote
> harassment-free environment; but you could imagine situations where it
> would.  That would obviously be a drastic step.
>=20
>> The "Acceptable Behavior" clause includes individual, company and nation-=
state in scope of governance.  If the "Unacceptable Behavior" clauses would l=
ead to economic harm for a company, e.g. impacting a company's ability to sh=
ip a commercial release of  product with Xen Project components, would the c=
ompany be given an opportunity to improve the behavior of their employee, wi=
thin the employment context of their work in the collaborative, open-source d=
evelopment of Xen?  What would be due process for such improvement opportuni=
ty, in compliance with nation-state labor laws for employee termination?
>=20
> Not sure what the first sentence has to do with the rest of the
> paragraph.  You seem to be muddling up a couple of questions:
>=20
> 1. Will offenders be given opportunity to amend their behavior before
> being permanently banned?
>=20
> 2. Can people be given more lenient treatment if they are economically
> important to a company?
>=20
> 3. If an employee is banned, does the company have to fire them?
>=20
> The answer to #1 is, "if possible".  If genuine change and
> reconciliation can take place, that's obviously better than expulsion.
> Relatively minor violations, where it's clear that expectations were not
> understood, would probably only receive a warning.  Serious violations
> may require a temporary ban on principle, but "temporary ban" implies
> the expectation that things can improve.  Extremely serious violations
> may require an immediate permanent ban.
>=20
> The answer to #2 is, as far as I'm concerned, "absolutely not".
>=20
> The answer to #3 is, "that's not really any of our business".
>=20
>> If the "Unacceptable Behavior" clauses would lead to blacklisting of a pe=
rson's digital and physical identities from the online, collaborative, open-=
source development community of Xen, would this have a material impact on th=
e ability of that human to find employment in any company or nation-state?  I=
f so, would such a public employment blacklist be compliant with the labor l=
aws of affected nation-states? =20
>=20
> What happens if Xen becomes so ubiquitous our important that not being
> able to submit patches or participate in our mailing list means you
> can't find a job at all as a software developer at all, in any country
> or any company?  I think we'll cross that bridge when we come to it. :-)
>=20
> More seriously: Yes, if we permanently ban someone from the mailing
> list, it's possible they may sue us claiming that it's an illegal
> employment blacklist.  Assuming we've only banned people who have either
> persistently displayed bad behavior, or displayed extreme behavior at
> least once,  I expect the law will be on our side.  If not, we'll have
> to figure out how to adapt our policies based on the details of that
> particular case.
>=20
> (If you know of any relevant case law, then of course please share it.)
>=20
>> If not, would there be dis-incentives for a Xen-contributing company to h=
ire someone who could not participate in the online, collaborative, open-sou=
rce development community for Xen Project?
>=20
> Um, yes?  But hopefully a larger dis-incentive would be to hire someone
> who had acted in such a way as to get banned in the first place.
>=20
> Your attitude seems to be, "Oh, what about poor Alice, who has been
> banned from the community and now can't get a job working on Xen!"
> Don't forget Bob, whom (as far as we can tell) Alice has been
> persistently harassing, in spite of repeated warnings to stop.  In such
> a situation *one of those two people are going to be excluded*.  If we
> do not exclude Alice, then Bob will be excluded from the community by
> Alice's behavior (and the rest of us ignoring it).
>=20
> Assuming that we've investigated the issue and determined that Alice is
> the one behaving inappropriately, I'd much rather exclude Alice than Bob.
>=20
>> Would these considerations influence a company which is selecting a globa=
l labor pool of hypervisor talent and open-source hypervisor for their comme=
rcial product?  Can we perform a comparative analysis of these scenarios for=
 the proposed Xen Project CoC vs. other OSS hypervisors which compete with X=
en?
>=20
> I firmly believe that a community that insists on minimum standards of
> behavior will be "more competitive" than a community which tolerates
> toxic behavior because the people who do so seem to get a lot of work done=
.
>=20
> But even if that's not the case, I'd rather work in a slightly less
> "competitive" community than put up with toxic behavior.
>=20
>> These are some example scenarios where a conference/event CoC may not be s=
uitable.
>=20
> I don't see how any of your arguments are particular to conferences.
>=20
> -George

Hi George,

Thanks for the detailed response.  Lars noted that the proposed Xen CoC is n=
early identical to Contributor Covenant, which has been adopted by many orga=
nizations, including teams at Intel and Google.  My comment, from https://li=
sts.gt.net/xen/devel/561686#561686

> Without getting into the merits of Contributor Covenant, there is value in=
 reusing an "upstream CoC" that has been vetted by many organizations and is=
 being continually tested in the real world. =20
>=20
> Similar to the "macro supply chain" topic:  if Xen Project must make chang=
es to the upstream CoC, these can be done as a logical patch (rather than an=
 orphaned fork) so we can incorporate upstream improvements.  The rationale f=
or each diff against the upstream CoC can be in a revision-controlled doc, s=
o that future CoC maintainers understand the reasoning behind each diff, as c=
ommunities and contributors evolve.

Your discussion above clearly covers differences between Contributor Covenan=
t and Xen's CoC, and could be translated to text suitable for commit message=
s, with one commit per diff from an upstream CoC.

Rich=

--Apple-Mail-90C9A0B8-3600-4655-8E4C-9A4D6E70CED4
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"ltr">On A=
ug 16, 2019, at 07:19, George Dunlap &lt;<a href=3D"mailto:george.dunlap@cit=
rix.com">george.dunlap@citrix.com</a>&gt; wrote:</div><div dir=3D"ltr"><br><=
/div><blockquote type=3D"cite"><div dir=3D"ltr"><span>On 8/15/19 6:23 PM, Ri=
ch Persaud wrote:</span><br><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>On Aug 9, 2019, at 13:48, Lars Kurth &lt;<a href=3D"mailto:lars.ku=
rth@citrix.com">lars.kurth@citrix.com</a>&gt; wrote:</span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>Hi all,</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Hi Lars=
,</span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>Following the discussion we had at the Developer Summit (see <a href=3D=
"https://wiki.xenproject.org/wiki/Design_Sessions_2019#Community_Issues_.2F_=
Improvements_-_Communication.2C_Code_of_Conduct.2C_etc">https://wiki.xenproj=
ect.org/wiki/Design_Sessions_2019#Community_Issues_.2F_Improvements_-_Commun=
ication.2C_Code_of_Conduct.2C_etc</a>. for notes) I put together a draft for=
 the Code of Conduct which can be found here as well as inlined below</span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span><a href=3D"https://docs.google.com/document/d/1NnWdU_VnC1N_ZzxQG=
6jU9fnY2GPVCcfPJT5KY61WXJM/edit?usp=3Dsharing">https://docs.google.com/docum=
ent/d/1NnWdU_VnC1N_ZzxQG6jU9fnY2GPVCcfPJT5KY61WXJM/edit?usp=3Dsharing</a> </=
span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>It is based on the LF Events CoC as we a=
greed on (the diff is attached). I took the scope and enforcement sections f=
rom <a href=3D"https://www.contributor-covenant.org/version/1/4/code-of-cond=
uct.html">https://www.contributor-covenant.org/version/1/4/code-of-conduct.h=
tml</a> and simplified it rather than inventing something new.</span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><span></span><br></blockquo=
te><blockquote type=3D"cite"><span>Is there precedent for applying a legal c=
ontract (Code of Conduct) that was designed for physical space (conference e=
vent) to an online context? &nbsp;&nbsp;Is there an existing Code of Conduct=
 that was legally designed for a similar, online open-source community conte=
xt, e.g. operating system or hypervisor or other systems-level software dev?=
</span><br></blockquote><span></span><br><span>This is sort of a strange que=
stion.</span><br><span></span><br><span>Generally speaking, there was a link=
 Lars pointed to in an earlier</span><br><span>thread in preparation for thi=
s, making two suggestions about adopting a CoC:</span><br><span></span><br><=
span>1. Don't create your own CoC from scratch. &nbsp;Learn from other peopl=
e's</span><br><span>experiences, mistakes, and so on, rather than re-inventi=
ng the wheel.</span><br><span>This will hopefully reduce the chance of re-ha=
shing mistakes other</span><br><span>communities have made.</span><br><span>=
</span><br><span>2. Don't copy-and-paste a CoC unmodified from another proje=
ct. &nbsp;Consider</span><br><span>it, adapt it to your own community cultur=
e and situation. &nbsp;This makes</span><br><span>sure that the CoC is not a=
 tick-box exercise, but that people in your</span><br><span>community have t=
houghfully considered various issues and genuinely</span><br><span>decided t=
o commit to them.</span><br><span></span><br><span>I think both of those bit=
s of advice are good; and it appears to me that</span><br><span>this is exac=
tly what Lars (with input from a number of others) has done.</span><br><span=
></span><br><span>There are two things that we want, in general:</span><br><=
span></span><br><span>1. To cast a vision for what ideal contributor behavio=
r should be</span><br><span></span><br><span>2. To set a bar for minimum acc=
eptable behavior, and a way for excluding</span><br><span>people whose behav=
ior consistently falls below that bar.</span><br><span></span><br><span>One a=
rea in particular where Lars thought other CoCs were weak was in</span><br><=
span>trying to combine #1 and #2. &nbsp;They need different responses. &nbsp=
;#1 needs</span><br><span>encouragement and vision. &nbsp;#2 needs teeth: We=
 need to be able to apply</span><br><span>penalties and exclude people.</spa=
n><br><span></span><br><span>As a result, Lars has suggested (and many peopl=
e have agreed), that we</span><br><span>separate the two functions. &nbsp;Th=
is document is about #2, not #1. &nbsp;We plan</span><br><span>to do #1 afte=
r #2 is completed.</span><br><span></span><br><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><span># Expected Behavior</span><br></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>All Xen Pr=
oject community members are expected to behave in accordance with </span><br=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>professional standards, with both the Xen Project Code of Conduct a=
s well as their </span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>respective employer=E2=80=99s policies go=
verning appropriate workplace behavior, and </span><br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>applicable la=
ws.</span><br></blockquote></blockquote><blockquote type=3D"cite"><span></sp=
an><br></blockquote><blockquote type=3D"cite"><span>In the x86 community cal=
l where this was first discussed, I suggested that we try to define desirabl=
e behavior, which we would like to incentivize and promote. &nbsp;&nbsp;In t=
his current draft, we have a single sentence on positive behavior, with incl=
usion-by-reference to:</span><br></blockquote><span></span><br><span>We plan=
 on doing this, but in another document.</span><br><span></span><br><blockqu=
ote type=3D"cite"><span>If incorporation-by-reference is not sufficient, e.g=
. if we will maintain a blacklist of unacceptable behavior for collaborative=
, online open-source development, do we also need a whitelist of acceptable b=
ehavior? &nbsp;Within Xen source code, we have been moving away from blackli=
sts towards whitelists.</span><br></blockquote><span></span><br><span>Unlike=
 hypercalls, all human behavior cannot be enumerated; and if it</span><br><s=
pan>could, 100% certainty cannot be obtained about what a certain behavior</=
span><br><span>is, or even exactly what did or did not happen. &nbsp;No matt=
er what we write</span><br><span>down, at some point, you're just going to h=
ave to either trust the</span><br><span>people making the decisions.</span><=
br><span></span><br><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n># Unacceptable Behavior</span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>Harassment will not be tolerated=
 in the Xen Project Community in any form, </span><br></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>including but n=
ot limited to harassment based on gender, gender identity and </span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>expression, sexual orientation, disability, physical appearance, body s=
ize, race, </span><br></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>age, religion, ethnicity, nationality, level o=
f experience, education, or </span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>socio-economic status or any o=
ther status protected by laws in jurisdictions in </span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>which c=
ommunity members are based. Harassment includes the use of abusive, </span><=
br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span>offensive or degrading language, intimidation, stalking, harassin=
g photography </span><br></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>or recording, inappropriate physical contac=
t, sexual imagery and unwelcome </span><br></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>sexual advances, requests=
 for sexual favors, publishing others' private </span><br></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>informatio=
n such as a physical or electronic address without explicit permission</span=
><br></blockquote></blockquote><blockquote type=3D"cite"><span></span><br></=
blockquote><blockquote type=3D"cite"><span>Picking one item at random: &nbsp=
;would a conference-originated blacklist prohibition be appropriate for onli=
ne open-source development? &nbsp;E.g. if someone's email address were inclu=
ded in a xen-devel thread (on the cc line), without obtaining explicit permi=
ssion, would that be unacceptable behavior for a Xen developer? &nbsp;That c=
ould disqualify much of the current development community.</span><br></block=
quote><span></span><br><span>Suppose Bob has a private email address that he=
 doesn't want to become</span><br><span>public. &nbsp;Suppose that Alice kno=
ws this address, and also knows that Bob</span><br><span>wants this to be pr=
ivate. &nbsp;And suppose that Alice and purposely CC's</span><br><span>Bob's=
 private email address on a mail to xen-devel in retribution for</span><br><=
span>something (for instance, because Bob broke up with Alice).</span><br><s=
pan></span><br><span>Is that harassment? &nbsp;Yes, absolutely.</span><br><s=
pan></span><br><span>Now, it may sometimes be difficult to determine whether=
 something like</span><br><span>"Alice knew that Bob wanted this private" an=
d "Alice purposely revealed</span><br><span>Bob's address" are true statemen=
ts or not. &nbsp;It may be in fact that *Bob*</span><br><span>is raising a f=
alse issue with the CoC team in retribution for something</span><br><span>*A=
lice* has done.</span><br><span></span><br><span>This sort of situation puts=
 the CoC team in a difficult place: If they</span><br><span>don't act, and A=
lice really was harassing Bob, then they are effectively</span><br><span>ena=
bling Alice's behavior. &nbsp;People like Bob will leave, and more people</s=
pan><br><span>like Alice will come. &nbsp;If they do act, and Alice wasn't r=
eally harassing</span><br><span>Bob, then they are effectively enabling Bob'=
s behavior; people like</span><br><span>Alice will leave, and more people li=
ke Bob will come.</span><br><span></span><br><span>Life is often unclear and=
 messy; but that doesn't excuse us from acting.</span><br><span> We've all g=
ot to try to make the best decision we can with limited</span><br><span>info=
rmation.</span><br><span></span><br><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>Any report of harassment within the Xen Project community w=
ill be addressed </span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>swiftly. Participants asked to stop any h=
arassing behavior are expected to </span><br></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>comply immediately. Any=
one who witnesses or is subjected to unacceptable </span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>behavio=
r should notify the Xen Project=E2=80=99s CoC team via <a href=3D"mailto:con=
duct@xenproject.org">conduct@xenproject.org</a>.</span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><b=
r></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span># Consequences of Unacceptable Behavior</span><br></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>If a par=
ticipant engages in harassing behavior, the Xen Project=E2=80=99s CoC team m=
ay </span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>take any action it deems appropriate, ranging from iss=
uance of a warning to the </span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>offending individual to expulsi=
on from the Xen Project community.</span><br></blockquote></blockquote><bloc=
kquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"=
><span>This is an enforceable action in the physical world, e.g. conference e=
vent, but may be more difficult online. &nbsp;As the existence of spam, bots=
, robocallers and cyberattack attribution forensics have shown, digital iden=
tity is not as clear cut as physical identity at a conference. &nbsp;&nbsp;I=
t may be better to look for precedent CoC legal clauses that were designed f=
or online contexts.</span><br></blockquote><span></span><br><span>I think yo=
u're overthinking this. &nbsp;If someone is banned and then creates</span><b=
r><span>a false identity which thereafter behaves in such a way that we cann=
ot</span><br><span>tell it is the original person, then we will still have a=
ccomplished our</span><br><span>goal of creating a harassment-free environme=
nt. &nbsp;If someone is banned</span><br><span>and continues to create false=
 identities which continue to misbehave in</span><br><span>the same way as t=
he banned person, then 1) it will be clear who they</span><br><span>are, and=
 2) we can temporarily prevent new addresses from subscribing to</span><br><=
span>the list without a second level of approval.</span><br><span></span><br=
><span>If we really get some sort of persistent troll who just won't go away=
,</span><br><span>then we can decide what to do at that point. &nbsp;But I w=
ould have</span><br><span>absolutely no regrets about attempting to remove s=
uch a person from our</span><br><span>community.</span><br><span></span><br>=
<blockquote type=3D"cite"><span>Let's assume that digital identity can be pr=
oven and a person can be expelled from the Xen Project community. &nbsp;Woul=
d this action apply only to the person's digital identity at Company X, or a=
lso to their new digital identity at Company Y? &nbsp;i.e. would behavior an=
d enforcement be scoped to the individual, the company or both? &nbsp;</span=
><br></blockquote><span></span><br><span>Your examples are really contrived.=
</span><br><span></span><br><span>The goal of the CoC, as stated, is to crea=
te a harassment-free</span><br><span>environment. &nbsp;If person A has done=
 harassing at company X, and we ban</span><br><span>them, then naturally the=
y're banned at company Y as well.</span><br><span></span><br><span>Banning o=
ther people at company X will generally not promote</span><br><span>harassme=
nt-free environment; but you could imagine situations where it</span><br><sp=
an>would. &nbsp;That would obviously be a drastic step.</span><br><span></sp=
an><br><blockquote type=3D"cite"><span>The "Acceptable Behavior" clause incl=
udes individual, company and nation-state in scope of governance. &nbsp;If t=
he "Unacceptable Behavior" clauses would lead to economic harm for a company=
, e.g. impacting a company's ability to ship a commercial release of &nbsp;p=
roduct with Xen Project components, would the company be given an opportunit=
y to improve the behavior of their employee, within the employment context o=
f their work in the collaborative, open-source development of Xen? &nbsp;Wha=
t would be due process for such improvement opportunity, in compliance with n=
ation-state labor laws for employee termination?</span><br></blockquote><spa=
n></span><br><span>Not sure what the first sentence has to do with the rest o=
f the</span><br><span>paragraph. &nbsp;You seem to be muddling up a couple o=
f questions:</span><br><span></span><br><span>1. Will offenders be given opp=
ortunity to amend their behavior before</span><br><span>being permanently ba=
nned?</span><br><span></span><br><span>2. Can people be given more lenient t=
reatment if they are economically</span><br><span>important to a company?</s=
pan><br><span></span><br><span>3. If an employee is banned, does the company=
 have to fire them?</span><br><span></span><br><span>The answer to #1 is, "i=
f possible". &nbsp;If genuine change and</span><br><span>reconciliation can t=
ake place, that's obviously better than expulsion.</span><br><span>Relativel=
y minor violations, where it's clear that expectations were not</span><br><s=
pan>understood, would probably only receive a warning. &nbsp;Serious violati=
ons</span><br><span>may require a temporary ban on principle, but "temporary=
 ban" implies</span><br><span>the expectation that things can improve. &nbsp=
;Extremely serious violations</span><br><span>may require an immediate perma=
nent ban.</span><br><span></span><br><span>The answer to #2 is, as far as I'=
m concerned, "absolutely not".</span><br><span></span><br><span>The answer t=
o #3 is, "that's not really any of our business".</span><br><span></span><br=
><blockquote type=3D"cite"><span>If the "Unacceptable Behavior" clauses woul=
d lead to blacklisting of a person's digital and physical identities from th=
e online, collaborative, open-source development community of Xen, would thi=
s have a material impact on the ability of that human to find employment in a=
ny company or nation-state? &nbsp;If so, would such a public employment blac=
klist be compliant with the labor laws of affected nation-states? &nbsp;</sp=
an><br></blockquote><span></span><br><span>What happens if Xen becomes so ub=
iquitous our important that not being</span><br><span>able to submit patches=
 or participate in our mailing list means you</span><br><span>can't find a j=
ob at all as a software developer at all, in any country</span><br><span>or a=
ny company? &nbsp;I think we'll cross that bridge when we come to it. :-)</s=
pan><br><span></span><br><span>More seriously: Yes, if we permanently ban so=
meone from the mailing</span><br><span>list, it's possible they may sue us c=
laiming that it's an illegal</span><br><span>employment blacklist. &nbsp;Ass=
uming we've only banned people who have either</span><br><span>persistently d=
isplayed bad behavior, or displayed extreme behavior at</span><br><span>leas=
t once, &nbsp;I expect the law will be on our side. &nbsp;If not, we'll have=
</span><br><span>to figure out how to adapt our policies based on the detail=
s of that</span><br><span>particular case.</span><br><span></span><br><span>=
(If you know of any relevant case law, then of course please share it.)</spa=
n><br><span></span><br><blockquote type=3D"cite"><span>If not, would there b=
e dis-incentives for a Xen-contributing company to hire someone who could no=
t participate in the online, collaborative, open-source development communit=
y for Xen Project?</span><br></blockquote><span></span><br><span>Um, yes? &n=
bsp;But hopefully a larger dis-incentive would be to hire someone</span><br>=
<span>who had acted in such a way as to get banned in the first place.</span=
><br><span></span><br><span>Your attitude seems to be, "Oh, what about poor A=
lice, who has been</span><br><span>banned from the community and now can't g=
et a job working on Xen!"</span><br><span>Don't forget Bob, whom (as far as w=
e can tell) Alice has been</span><br><span>persistently harassing, in spite o=
f repeated warnings to stop. &nbsp;In such</span><br><span>a situation *one o=
f those two people are going to be excluded*. &nbsp;If we</span><br><span>do=
 not exclude Alice, then Bob will be excluded from the community by</span><b=
r><span>Alice's behavior (and the rest of us ignoring it).</span><br><span><=
/span><br><span>Assuming that we've investigated the issue and determined th=
at Alice is</span><br><span>the one behaving inappropriately, I'd much rathe=
r exclude Alice than Bob.</span><br><span></span><br><blockquote type=3D"cit=
e"><span>Would these considerations influence a company which is selecting a=
 global labor pool of hypervisor talent and open-source hypervisor for their=
 commercial product? &nbsp;Can we perform a comparative analysis of these sc=
enarios for the proposed Xen Project CoC vs. other OSS hypervisors which com=
pete with Xen?</span><br></blockquote><span></span><br><span>I firmly believ=
e that a community that insists on minimum standards of</span><br><span>beha=
vior will be "more competitive" than a community which tolerates</span><br><=
span>toxic behavior because the people who do so seem to get a lot of work d=
one.</span><br><span></span><br><span>But even if that's not the case, I'd r=
ather work in a slightly less</span><br><span>"competitive" community than p=
ut up with toxic behavior.</span><br><span></span><br><blockquote type=3D"ci=
te"><span>These are some example scenarios where a conference/event CoC may n=
ot be suitable.</span><br></blockquote><span></span><br><span>I don't see ho=
w any of your arguments are particular to conferences.</span><br><span></spa=
n><br><span> -George</span><br></div></blockquote><div><br></div><div>Hi Geo=
rge,</div><div><br></div><div>Thanks for the detailed response. &nbsp;Lars n=
oted that the proposed Xen CoC is nearly identical to Contributor Covenant, w=
hich has been adopted by many organizations, including teams at Intel and Go=
ogle. &nbsp;My comment, from&nbsp;<a href=3D"https://lists.gt.net/xen/devel/=
561686#561686">https://lists.gt.net/xen/devel/561686#561686</a></div><div><b=
r></div><div><div dir=3D"ltr"></div></div><blockquote type=3D"cite"><div><di=
v dir=3D"ltr"><span style=3D"background-color: rgba(255, 255, 255, 0);">With=
out getting into the merits of Contributor Covenant, there is value in reusi=
ng an "upstream CoC" that has been vetted by many organizations and is being=
 continually tested in the real world. &nbsp;</span></div><div dir=3D"ltr"><=
span style=3D"background-color: rgba(255, 255, 255, 0);"><br></span></div><d=
iv dir=3D"ltr"><span style=3D"background-color: rgba(255, 255, 255, 0);">Sim=
ilar to the "macro supply chain" topic: &nbsp;if Xen Project must make chang=
es to the upstream CoC, these can be done as a logical patch (rather than an=
 orphaned fork) so we can incorporate upstream improvements. &nbsp;The ratio=
nale for each diff against the upstream CoC can be in a revision-controlled d=
oc, so that future CoC maintainers understand the reasoning behind each diff=
, as communities and contributors evolve.</span></div></div></blockquote><di=
v><br></div>Your discussion above clearly covers differences between Contrib=
utor Covenant and Xen's CoC, and could be translated to text suitable for co=
mmit messages, with one commit per diff from an upstream CoC.<br><div><br></=
div><div>Rich</div></body></html>=

--Apple-Mail-90C9A0B8-3600-4655-8E4C-9A4D6E70CED4--


--===============7142819244020162912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7142819244020162912==--

