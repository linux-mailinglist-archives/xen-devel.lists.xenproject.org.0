Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7372975CB65
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 17:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567599.886871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMruj-0001B3-Pq; Fri, 21 Jul 2023 15:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567599.886871; Fri, 21 Jul 2023 15:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMruj-00019L-N6; Fri, 21 Jul 2023 15:19:29 +0000
Received: by outflank-mailman (input) for mailman id 567599;
 Fri, 21 Jul 2023 15:19:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PAjr=DH=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qMruh-00019F-O2
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 15:19:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faa2f3fd-27d9-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 17:19:26 +0200 (CEST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by support.bugseng.com (Postfix) with ESMTPSA id C0A274EE0C99
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jul 2023 17:19:25 +0200 (CEST)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-4438f623370so867881137.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jul 2023 08:19:25 -0700 (PDT)
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
X-Inumbo-ID: faa2f3fd-27d9-11ee-b23a-6b7b168915f2
X-Gm-Message-State: ABy/qLZ47Rem7fpyg8C1QwPoo3ZaEA9juSeWyndMy/rPT0sn3WRLyhcn
	/EjnUIlEAK8NN0RRsdaEgEU2TpdVTZYVJyXmDWE=
X-Google-Smtp-Source: APBJJlHNbRxfAJD0rFsfvb+01SPA1D8fPFMeoIVLCnuVWHi2TKilY9DK1YZAvD7gS0BjW9IBYHcVLtCeac49IJth32A=
X-Received: by 2002:a67:bd04:0:b0:443:90ff:c691 with SMTP id
 y4-20020a67bd04000000b0044390ffc691mr307485vsq.13.1689952764503; Fri, 21 Jul
 2023 08:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <eb5fa852f306790160b967787592553d2fdf3de6.1689887842.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2307201507070.3118466@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2307201507070.3118466@ubuntu-linux-20-04-desktop>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Fri, 21 Jul 2023 17:19:13 +0200
X-Gmail-Original-Message-ID: <CAFHJcJs816ZreXXMK4ZOgxeiqowUJyXLUaBOaR9RE9FxTp+bGg@mail.gmail.com>
Message-ID: <CAFHJcJs816ZreXXMK4ZOgxeiqowUJyXLUaBOaR9RE9FxTp+bGg@mail.gmail.com>
Subject: Re: [XEN PATCH] automation: add ECLAIR pipeline
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
	Doug Goldstein <cardoe@cardoe.com>
Content-Type: multipart/alternative; boundary="000000000000372d54060100caa8"

--000000000000372d54060100caa8
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 21 lug 2023 alle ore 00:29 Stefano Stabellini <
sstabellini@kernel.org> ha scritto:

>
> Patchew automatically picked it up from xen-devel and started a pipeline
> here:
>
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/939440592
>
> However the eclair-x86_64 job failed with:
>
> ERROR: Uploading artifacts as "archive" to coordinator... 413 Payload
> Too Large
>

In the next patch, I will avoid uploading the ECLAIR database in GitLab
artifacts.
Of course, the databases can still be accessed via the links in the
pipeline logs.


>
> Also the eclair-ARM64 job failed but it is not clear to me why.
>

The reason is that the WTOKEN variable is missing. This masked variable
should be set
and visible to *all* repositories (xen-project/xen, xen-project/people/.*).


> I think at least initially we should mark the two Eclair jobs with:
>
>   allow_failure: true
>
> until we are sure they work reliably all the time. Otherwise we end up
> blocking the whole Xen staging pipeline if we make any mistakes here. We
> can remove "allow_failure: true" once we are sure it works well all the
> time.
>

Ok.

>
> The second thing I noticed is that the build phase didn't start until
> the analyze phase was concluded. This is not good because it would
> increase the overall time significantly. We need the build/test phases
> to start in parallel. To do that you need to add the following change to
> this patch:
>
>
> diff --git a/automation/gitlab-ci/build.yaml
> b/automation/gitlab-ci/build.yaml
> index c401f62d61..f01e2c32bb 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -11,6 +11,7 @@
>        - '*.log'
>        - '*/*.log'
>      when: always
> +  needs: []
>    except:
>      - master
>      - smoke
>
> Thanks.

>
> > ---
> >  .gitlab-ci.yml                    |  2 ++
> >  automation/gitlab-ci/analyze.yaml | 38 +++++++++++++++++++++++++++++++
> >  automation/scripts/eclair         | 26 +++++++++++++++++++++
> >  3 files changed, 66 insertions(+)
> >  create mode 100644 automation/gitlab-ci/analyze.yaml
> >  create mode 100755 automation/scripts/eclair
> >
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index c8bd7519d5..ee5430b8b7 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -1,7 +1,9 @@
> >  stages:
> > +  - analyze
> >    - build
> >    - test
> >
> >  include:
> > +  - 'automation/gitlab-ci/analyze.yaml'
> >    - 'automation/gitlab-ci/build.yaml'
> >    - 'automation/gitlab-ci/test.yaml'
> > diff --git a/automation/gitlab-ci/analyze.yaml
> b/automation/gitlab-ci/analyze.yaml
> > new file mode 100644
> > index 0000000000..be96d96e71
> > --- /dev/null
> > +++ b/automation/gitlab-ci/analyze.yaml
> > @@ -0,0 +1,38 @@
> > +.eclair-analysis:
> > +  stage: analyze
> > +  tags:
> > +    - eclair-analysis
> > +    - eclair
> > +    - misrac
>
> I would only use 1 tag, eclair-analysis or eclair, up to you
>
> Ok.


> > +  variables:
> > +    ECLAIR_OUTPUT_DIR: "ECLAIR_out"
> > +    ANALYSIS_KIND: "normal"
> > +    ECLAIR_REPORT_URL: "saas.eclairit.com"
> > +    ENABLE_ECLAIR_BOT: "n"
> > +    AUTOPRBRANCH: "staging"
> > +    AUTOPRREPOSITORY: "xen-project/xen"
> > +  artifacts:
> > +    when: always
> > +    paths:
> > +      - "${ECLAIR_OUTPUT_DIR}"
> > +      - '*.log'
> > +    reports:
> > +      codequality: gl-code-quality-report.json
> > +
> > +eclair-x86_64:
> > +  extends: .eclair-analysis
> > +  variables:
> > +    LOGFILE: "eclair-x86_64.log"
> > +    VARIANT: "X86_64"
> > +    RULESET: "Set1"
> > +  script:
> > +    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
>
> allow_failure: true
>
>
> > +eclair-ARM64:
> > +  extends: .eclair-analysis
> > +  variables:
> > +    LOGFILE: "eclair-ARM64.log"
> > +    VARIANT: "ARM64"
> > +    RULESET: "Set1"
> > +  script:
> > +    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
>
> allow_failure: true
>
>
> > diff --git a/automation/scripts/eclair b/automation/scripts/eclair
> > new file mode 100755
> > index 0000000000..d7f0845aec
> > --- /dev/null
> > +++ b/automation/scripts/eclair
> > @@ -0,0 +1,26 @@
> > +#!/bin/bash -eu
> > +
> > +# ECLAIR configuration files are maintened by BUGSENG
> > +export GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no"
> > +[ -d ECLAIR_scripts ] || git clone ssh://
> git@git.bugseng.com/eclair/scripts/XEN ECLAIR_scripts
> > +(cd ECLAIR_scripts; git pull --rebase)
> > +
> > +ECLAIR_DIR=ECLAIR_scripts/ECLAIR
> > +ECLAIR_OUTPUT_DIR=$(realpath "${ECLAIR_OUTPUT_DIR}")
> > +
> > +ECLAIR_scripts/prepare.sh "${VARIANT}"
> > +
> > +ex=0
> > +"${ECLAIR_DIR}/analyze.sh" "${VARIANT}" "${RULESET}" || ex=$?
> > +"${ECLAIR_DIR}/action_log.sh" ANALYSIS_LOG \
> > +                             "ECLAIR analysis log" \
> > +                             "${ECLAIR_OUTPUT_DIR}/ANALYSIS.log" \
> > +                             "${ex}"
> > +"${ECLAIR_DIR}/action_log.sh" REPORT_LOG \
> > +                             "ECLAIR report log" \
> > +                             "${ECLAIR_OUTPUT_DIR}/REPORT.log" \
> > +                             "${ex}"
> > +[ "${ex}" = 0 ] || exit "${ex}"
> > +"${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
> > +
> > +rm -rf "${ECLAIR_OUTPUT_DIR}/.data"
> > --
> > 2.34.1
> >
>


-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--000000000000372d54060100caa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il giorno ven 21 lug 2023 alle ore 00=
:29 Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabe=
llini@kernel.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
Patchew automatically picked it up from xen-devel and started a pipeline<br=
>
here:<br>
<br>
<a href=3D"https://gitlab.com/xen-project/patchew/xen/-/pipelines/939440592=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/patch=
ew/xen/-/pipelines/939440592</a><br>
<br>
However the eclair-x86_64 job failed with:<br>
<br>
ERROR: Uploading artifacts as &quot;archive&quot; to coordinator... 413 Pay=
load<br>
Too Large<br></blockquote><div><br></div><div><div class=3D"gmail_quote"><s=
pan class=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk=
0b"><span class=3D"gmail-ryNqvb">In the next patch, I will avoid uploading =
the ECLAIR database</span></span><span class=3D"gmail-jCAhz"><span class=3D=
"gmail-ryNqvb">
</span></span><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail=
-ryNqvb">in GitLab artifacts.</span></span></span></div><div class=3D"gmail=
_quote"><span class=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz =
gmail-ChMk0b"><span class=3D"gmail-ryNqvb">Of course, the databases can sti=
ll be accessed via the links in the pipeline logs.</span></span></span></di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Also the eclair-ARM64 job failed but it is not clear to me why.<br></blockq=
uote><div><br></div><div>The reason is that the WTOKEN variable is missing.=
 This masked variable should be set</div><div>and visible to *all* reposito=
ries (xen-project/xen, xen-project/people/.*).</div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
I think at least initially we should mark the two Eclair jobs with:<br>
<br>
=C2=A0 allow_failure: true<br>
<br>
until we are sure they work reliably all the time. Otherwise we end up<br>
blocking the whole Xen staging pipeline if we make any mistakes here. We<br=
>
can remove &quot;allow_failure: true&quot; once we are sure it works well a=
ll the<br>
time.<br></blockquote><div><br></div><div>Ok. <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
The second thing I noticed is that the build phase didn&#39;t start until<b=
r>
the analyze phase was concluded. This is not good because it would<br>
increase the overall time significantly. We need the build/test phases<br>
to start in parallel. To do that you need to add the following change to<br=
>
this patch:<br>
<br>
<br>
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.y=
aml<br>
index c401f62d61..f01e2c32bb 100644<br>
--- a/automation/gitlab-ci/build.yaml<br>
+++ b/automation/gitlab-ci/build.yaml<br>
@@ -11,6 +11,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- &#39;*.log&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- &#39;*/*.log&#39;<br>
=C2=A0 =C2=A0 =C2=A0when: always<br>
+=C2=A0 needs: []<br>
=C2=A0 =C2=A0except:<br>
=C2=A0 =C2=A0 =C2=A0- master<br>
=C2=A0 =C2=A0 =C2=A0- smoke<br>
<br></blockquote><div>Thanks. <br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
&gt; ---<br>
&gt;=C2=A0 .gitlab-ci.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt;=C2=A0 automation/gitlab-ci/analyze.yaml | 38 +++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 automation/scripts/eclair=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 26 =
+++++++++++++++++++++<br>
&gt;=C2=A0 3 files changed, 66 insertions(+)<br>
&gt;=C2=A0 create mode 100644 automation/gitlab-ci/analyze.yaml<br>
&gt;=C2=A0 create mode 100755 automation/scripts/eclair<br>
&gt; <br>
&gt; diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml<br>
&gt; index c8bd7519d5..ee5430b8b7 100644<br>
&gt; --- a/.gitlab-ci.yml<br>
&gt; +++ b/.gitlab-ci.yml<br>
&gt; @@ -1,7 +1,9 @@<br>
&gt;=C2=A0 stages:<br>
&gt; +=C2=A0 - analyze<br>
&gt;=C2=A0 =C2=A0 - build<br>
&gt;=C2=A0 =C2=A0 - test<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 include:<br>
&gt; +=C2=A0 - &#39;automation/gitlab-ci/analyze.yaml&#39;<br>
&gt;=C2=A0 =C2=A0 - &#39;automation/gitlab-ci/build.yaml&#39;<br>
&gt;=C2=A0 =C2=A0 - &#39;automation/gitlab-ci/test.yaml&#39;<br>
&gt; diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/=
analyze.yaml<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..be96d96e71<br>
&gt; --- /dev/null<br>
&gt; +++ b/automation/gitlab-ci/analyze.yaml<br>
&gt; @@ -0,0 +1,38 @@<br>
&gt; +.eclair-analysis:<br>
&gt; +=C2=A0 stage: analyze<br>
&gt; +=C2=A0 tags:<br>
&gt; +=C2=A0 =C2=A0 - eclair-analysis<br>
&gt; +=C2=A0 =C2=A0 - eclair<br>
&gt; +=C2=A0 =C2=A0 - misrac<br>
<br>
I would only use 1 tag, eclair-analysis or eclair, up to you<br>
<br></blockquote><div>Ok.</div><div>=C2=A0<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
&gt; +=C2=A0 variables:<br>
&gt; +=C2=A0 =C2=A0 ECLAIR_OUTPUT_DIR: &quot;ECLAIR_out&quot;<br>
&gt; +=C2=A0 =C2=A0 ANALYSIS_KIND: &quot;normal&quot;<br>
&gt; +=C2=A0 =C2=A0 ECLAIR_REPORT_URL: &quot;<a href=3D"http://saas.eclairi=
t.com" rel=3D"noreferrer" target=3D"_blank">saas.eclairit.com</a>&quot;<br>
&gt; +=C2=A0 =C2=A0 ENABLE_ECLAIR_BOT: &quot;n&quot;<br>
&gt; +=C2=A0 =C2=A0 AUTOPRBRANCH: &quot;staging&quot;<br>
&gt; +=C2=A0 =C2=A0 AUTOPRREPOSITORY: &quot;xen-project/xen&quot;<br>
&gt; +=C2=A0 artifacts:<br>
&gt; +=C2=A0 =C2=A0 when: always<br>
&gt; +=C2=A0 =C2=A0 paths:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - &quot;${ECLAIR_OUTPUT_DIR}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - &#39;*.log&#39;<br>
&gt; +=C2=A0 =C2=A0 reports:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 codequality: gl-code-quality-report.json<br>
&gt; +<br>
&gt; +eclair-x86_64:<br>
&gt; +=C2=A0 extends: .eclair-analysis<br>
&gt; +=C2=A0 variables:<br>
&gt; +=C2=A0 =C2=A0 LOGFILE: &quot;eclair-x86_64.log&quot;<br>
&gt; +=C2=A0 =C2=A0 VARIANT: &quot;X86_64&quot;<br>
&gt; +=C2=A0 =C2=A0 RULESET: &quot;Set1&quot;<br>
&gt; +=C2=A0 script:<br>
&gt; +=C2=A0 =C2=A0 - ./automation/scripts/eclair 2&gt;&amp;1 | tee &quot;$=
{LOGFILE}&quot;<br>
<br>
allow_failure: true<br>
<br>
<br>
&gt; +eclair-ARM64:<br>
&gt; +=C2=A0 extends: .eclair-analysis<br>
&gt; +=C2=A0 variables:<br>
&gt; +=C2=A0 =C2=A0 LOGFILE: &quot;eclair-ARM64.log&quot;<br>
&gt; +=C2=A0 =C2=A0 VARIANT: &quot;ARM64&quot;<br>
&gt; +=C2=A0 =C2=A0 RULESET: &quot;Set1&quot;<br>
&gt; +=C2=A0 script:<br>
&gt; +=C2=A0 =C2=A0 - ./automation/scripts/eclair 2&gt;&amp;1 | tee &quot;$=
{LOGFILE}&quot;<br>
<br>
allow_failure: true<br>
<br>
<br>
&gt; diff --git a/automation/scripts/eclair b/automation/scripts/eclair<br>
&gt; new file mode 100755<br>
&gt; index 0000000000..d7f0845aec<br>
&gt; --- /dev/null<br>
&gt; +++ b/automation/scripts/eclair<br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +#!/bin/bash -eu<br>
&gt; +<br>
&gt; +# ECLAIR configuration files are maintened by BUGSENG<br>
&gt; +export GIT_SSH_COMMAND=3D&quot;ssh -o StrictHostKeyChecking=3Dno&quot=
;<br>
&gt; +[ -d ECLAIR_scripts ] || git clone ssh://<a href=3D"http://git@git.bu=
gseng.com/eclair/scripts/XEN" rel=3D"noreferrer" target=3D"_blank">git@git.=
bugseng.com/eclair/scripts/XEN</a> ECLAIR_scripts<br>
&gt; +(cd ECLAIR_scripts; git pull --rebase)<br>
&gt; +<br>
&gt; +ECLAIR_DIR=3DECLAIR_scripts/ECLAIR<br>
&gt; +ECLAIR_OUTPUT_DIR=3D$(realpath &quot;${ECLAIR_OUTPUT_DIR}&quot;)<br>
&gt; +<br>
&gt; +ECLAIR_scripts/prepare.sh &quot;${VARIANT}&quot;<br>
&gt; +<br>
&gt; +ex=3D0<br>
&gt; +&quot;${ECLAIR_DIR}/analyze.sh&quot; &quot;${VARIANT}&quot; &quot;${R=
ULESET}&quot; || ex=3D$?<br>
&gt; +&quot;${ECLAIR_DIR}/action_log.sh&quot; ANALYSIS_LOG \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ECLAIR analysis log&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${ECLAIR_OUTPUT_DIR}/ANALYSIS.log&=
quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${ex}&quot;<br>
&gt; +&quot;${ECLAIR_DIR}/action_log.sh&quot; REPORT_LOG \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ECLAIR report log&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${ECLAIR_OUTPUT_DIR}/REPORT.log&qu=
ot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${ex}&quot;<br>
&gt; +[ &quot;${ex}&quot; =3D 0 ] || exit &quot;${ex}&quot;<br>
&gt; +&quot;${ECLAIR_DIR}/action_push.sh&quot; &quot;${WTOKEN}&quot; &quot;=
${ECLAIR_OUTPUT_DIR}&quot;<br>
&gt; +<br>
&gt; +rm -rf &quot;${ECLAIR_OUTPUT_DIR}/.data&quot;<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Simone Ballarin, M.Sc.<br><br><div>Field Application Engineer, BUGSENG =
(<a href=3D"http://bugseng.com" target=3D"_blank">https://bugseng.com</a>)<=
/div></div></div></div>

--000000000000372d54060100caa8--

