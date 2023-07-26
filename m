Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1625B7627C9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 02:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569998.891219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOSU0-0007YZ-7b; Wed, 26 Jul 2023 00:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569998.891219; Wed, 26 Jul 2023 00:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOSU0-0007WT-4j; Wed, 26 Jul 2023 00:34:28 +0000
Received: by outflank-mailman (input) for mailman id 569998;
 Wed, 26 Jul 2023 00:34:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0A2=DM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qOSTx-0007WN-VA
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 00:34:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ac97e73-2b4c-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 02:34:23 +0200 (CEST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by support.bugseng.com (Postfix) with ESMTPSA id BF52C4EE073C
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 02:34:22 +0200 (CEST)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-44758510539so31072137.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jul 2023 17:34:22 -0700 (PDT)
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
X-Inumbo-ID: 2ac97e73-2b4c-11ee-8613-37d641c3527e
X-Gm-Message-State: ABy/qLZxdpEiNCJ10R6GvFPiKcOrFdjDXAGyhv6tQTA45ntE+U2wsYx9
	T+KfcM8TU21FxzLm712521T216wqd2IcNmLH7yQ=
X-Google-Smtp-Source: APBJJlHmA2dYS0aHd4Om4w3JopZjDnO48tPcyQUCDek+IivVZYs/R8zqZLWFVguZ9PZmy9tTxnUURDcB1ks3COuIPUM=
X-Received: by 2002:a05:6102:99:b0:447:5054:e36a with SMTP id
 t25-20020a056102009900b004475054e36amr379123vsp.28.1690331661466; Tue, 25 Jul
 2023 17:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690294965.git.simone.ballarin@bugseng.com>
 <5e0b4afa229e29914392ffee736129f5ec2462cd.1690294965.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2307251247360.3118466@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2307251247360.3118466@ubuntu-linux-20-04-desktop>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Wed, 26 Jul 2023 02:34:10 +0200
X-Gmail-Original-Message-ID: <CAFHJcJu6jeYDQj6Z3HdSQF6ODVyWroDinvhp0JwxevoeFwAW-Q@mail.gmail.com>
Message-ID: <CAFHJcJu6jeYDQj6Z3HdSQF6ODVyWroDinvhp0JwxevoeFwAW-Q@mail.gmail.com>
Subject: Re: [XEN PATCH 3/4] automation: Add ECLAIR pipelines
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
	Doug Goldstein <cardoe@cardoe.com>
Content-Type: multipart/alternative; boundary="0000000000003c04c206015902f9"

--0000000000003c04c206015902f9
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 25 lug 2023 alle ore 22:04 Stefano Stabellini <
sstabellini@kernel.org> ha scritto:

> How do I access "gl-code-quality-report.json" or otherwise any other
> meaningful ECLAIR output? If I browse the job artifacts I see all the
> various logs but no gl-code-quality-report.json.
>

gl-code-quality-report.json is a GitLab-specific artifact that GitLab
exploits
to provide some features called Code Quality (
https://docs.gitlab.com/ee/ci/testing/code_quality.html).
The file is not supposed to be used outside of the context of the Code
Quality
features.

ECLAIR can produce stand-alone artifacts in various formats and
we can decide to store some of them in the job artifacts (see
https://www.bugseng.com/eclair/reports for an exhaustive list).

Scrolling up from the bottom of the job console output I see:
>
> Browse analysis:
> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp2/ARM64/4732041018/index.html
>
> And if I click on the link, I can access a web interface with the
> results. Is that the intended way to access the job output?
>

The link in the console is just a way to access the analysis results.
Typically the most
convenient one is the message written by the integration in the commit
thread,
see here an example:
https://eclairit.com:8444/swquality/eclair_demo/-/commit/0d312f8ebca6c4e98eabbeaf9b0fcb8b4a4344d9
.
To enable this feature you have to provide an impersonation token to the
integration,
you can find more information on the commit message.

If so, would it be possible to print out the message "Browse
> analysis:..." as the very last message to make it easier to spot? After
> it at the moment I can see:
>
> From https://gitlab.com:443/xen-project/xen
>  * [new branch]            4.10.0-shim-comet   ->
> autoPRRemote/4.10.0-shim-comet
>  [...]
>
> The long list of branch names hides the "Browse analysis" link.
>
> Ok. I will try also to remove the warnings.

>
> BTW I really like the graphics output, e.g.:
>
> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp2/ARM64/4732041018/PROJECT.ecd;/by_service.html#service/first_file&kind
>
> Very nice and clear!
>
>

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--0000000000003c04c206015902f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il giorno mar 25 lug 2023 alle ore 22=
:04 Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabe=
llini@kernel.org</a>&gt; ha scritto: <br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
How do I access &quot;gl-code-quality-report.json&quot; or otherwise any ot=
her<br>
meaningful ECLAIR output? If I browse the job artifacts I see all the<br>
various logs but no gl-code-quality-report.json.<br></blockquote><div>=C2=
=A0</div><div>gl-code-quality-report.json is a GitLab-specific artifact tha=
t GitLab exploits</div><div>to provide some features called Code Quality (<=
a href=3D"https://docs.gitlab.com/ee/ci/testing/code_quality.html">https://=
docs.gitlab.com/ee/ci/testing/code_quality.html</a>).</div><div>The file is=
 not supposed to be used outside of the context of the Code Quality</div><d=
iv>features.</div><div><br></div><div>ECLAIR can produce stand-alone artifa=
cts in various formats and<br></div><div>we can decide to store some of the=
m in the job artifacts (see=C2=A0<div><a href=3D"https://www.bugseng.com/ec=
lair/reports">https://www.bugseng.com/eclair/reports</a> for an exhaustive =
list).</div></div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
Scrolling up from the bottom of the job console output I see:<br>
<br>
Browse analysis: <a href=3D"https://saas.eclairit.com:3787/fs/var/local/ecl=
air/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp2/=
ARM64/4732041018/index.html" rel=3D"noreferrer" target=3D"_blank">https://s=
aas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/peop=
le/sstabellini/xen/ECLAIR_normal/ppp2/ARM64/4732041018/index.html</a><br>
<br>
And if I click on the link, I can access a web interface with the<br>
results. Is that the intended way to access the job output?<br></blockquote=
><div><br></div><div>The link in the console is just a way to access the an=
alysis results. Typically the most</div><div>convenient one is the message =
written by the integration in the commit thread,</div><div>see here an exam=
ple: <a href=3D"https://eclairit.com:8444/swquality/eclair_demo/-/commit/0d=
312f8ebca6c4e98eabbeaf9b0fcb8b4a4344d9">https://eclairit.com:8444/swquality=
/eclair_demo/-/commit/0d312f8ebca6c4e98eabbeaf9b0fcb8b4a4344d9</a>.</div><d=
iv>To enable this feature you have to provide an impersonation token to the=
 integration,</div><div>you can find more information on the commit message=
.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
If so, would it be possible to print out the message &quot;Browse<br>
analysis:...&quot; as the very last message to make it easier to spot? Afte=
r<br>
it at the moment I can see:<br>
<br>
From <a href=3D"https://gitlab.com:443/xen-project/xen" rel=3D"noreferrer" =
target=3D"_blank">https://gitlab.com:443/xen-project/xen</a><br>
=C2=A0* [new branch]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4.10.0-shim-c=
omet=C2=A0 =C2=A0-&gt; autoPRRemote/4.10.0-shim-comet<br>
=C2=A0[...]<br>
<br>
The long list of branch names hides the &quot;Browse analysis&quot; link.<b=
r>
<br></blockquote><div>Ok. I will try also to remove the warnings.<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
BTW I really like the graphics output, e.g.:<br>
<a href=3D"https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.e=
cdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp2/ARM64/4732041018/=
PROJECT.ecd;/by_service.html#service/first_file&amp;kind" rel=3D"noreferrer=
" target=3D"_blank">https://saas.eclairit.com:3787/fs/var/local/eclair/xen-=
project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp2/ARM64/47=
32041018/PROJECT.ecd;/by_service.html#service/first_file&amp;kind</a><br>
<br>
Very nice and clear!<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Simone Ballarin, M.Sc.<br><br><div>Field Application Engineer, BUGSENG =
(<a href=3D"http://bugseng.com" target=3D"_blank">https://bugseng.com</a>)<=
/div></div></div></div>

--0000000000003c04c206015902f9--

