Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE551A369FB
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 01:29:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889219.1298411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj63f-00038k-Ef; Sat, 15 Feb 2025 00:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889219.1298411; Sat, 15 Feb 2025 00:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj63f-00036G-Bd; Sat, 15 Feb 2025 00:29:23 +0000
Received: by outflank-mailman (input) for mailman id 889219;
 Sat, 15 Feb 2025 00:29:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTp2=VG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tj63e-00036A-6a
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 00:29:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5ebb944-eb33-11ef-9aa4-95dc52dad729;
 Sat, 15 Feb 2025 01:29:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CAB7DA44C58;
 Sat, 15 Feb 2025 00:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF9CC4CED1;
 Sat, 15 Feb 2025 00:29:19 +0000 (UTC)
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
X-Inumbo-ID: e5ebb944-eb33-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739579359;
	bh=SoGGnIQW1mepNeVT77jtKkFzsiLyT5a57eQlE3kJNTU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OxQ6uz0ic/G/W+JBTCTXU2dALFB5U6O3L96RZcq5KhaBGRj/bkg+WUhQkjpnaOkZf
	 aZa7InRftQ/yJzzocClr9rn6B1FKCcqmu74MtCR5+TsybcsSiacKNtOWHGTeJry2te
	 P2QZnTJWZrAbqEV72RcXEbD+apDILtXGBJA5JSXrfJRJMoQys/1cmYek9vtIpUGwvE
	 VSD5vt6OtVft5QuSxwMjJDqFBGsKStPSQzYQEQRuZEKCctWBrnX+I0kYUXe3PURm/v
	 XBdkUmgMEWLUH2+eS+2SkO2/yEe6XadV4ok0SG/LWL/gi48gTN2epNpGRevZYbQBkZ
	 RSXSs/3hn/5uQ==
Date: Fri, 14 Feb 2025 16:29:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/4] automation: allow selecting individual jobs via
 CI variables
In-Reply-To: <53730b7d7120635ce9079b57fc7e25b610569316.1739496480.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2502141627210.3858257@ubuntu-linux-20-04-desktop>
References: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com> <53730b7d7120635ce9079b57fc7e25b610569316.1739496480.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-481172092-1739579359=:3858257"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-481172092-1739579359=:3858257
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 14 Feb 2025, Marek Marczykowski-Górecki wrote:
> Debugging sometimes involves running specific jobs on different
> versions. It's useful to easily avoid running all of the not interesting
> ones (for given case) to save both time and CI resources. Doing so used
> to require changing the yaml files, usually in several places.
> Ease this step by adding SELECTED_JOBS_ONLY variable that takes a regex.
> Note that one needs to satisfy job dependencies on their own (for
> example if a test job needs a build job, that specific build job
> needs to be included too).
> 
> The variable can be specified via Gitlab web UI when scheduling a
> pipeline, but it can be also set when doing git push directly:
> 
>     git push -o ci.variable=SELECTED_JOBS_ONLY="/job1|job2/"
> 
> More details at https://docs.gitlab.co.jp/ee/user/project/push_options.html
> 
> The variable needs to include regex for selecting jobs, including
> enclosing slashes.

Does it work with a single job like this?

git push -o ci.variable=SELECTED_JOBS_ONLY="job1"

If it does, is there any way we could use to automatically whitelist its
dependencies too? Because that would be so much easier to use...


> A coma/space separated list of jobs to select would be friendlier UX,
> but unfortunately that is not supported:
> https://gitlab.com/gitlab-org/gitlab/-/issues/209904 (note the proposed
> workaround doesn't work for job-level CI_JOB_NAME).
> On the other hand, the regex is more flexible (one can select for
> example all arm32 jobs).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> This probably wants documenting beyond this commit message. I don't
> think we have any CI-related docs anywhere, do we? Some new file in
> docs/misc?

Please add documentation for it. Other than that, I think it could be
committed. I would prefer you also added documentation about alternative
methods such as removing all the jobs except the ones you care about.


> And also, it's possible to extend web ui for starting pipelines to
> include pre-defined variables. I use it in qubes here if you want to
> see:
> https://gitlab.com/QubesOS/qubes-continuous-integration/-/pipelines/new
> Does it make sense to include SELECTED_JOBS_ONLY this way too?
> Personally, I'll probably use it via cmdline push only anyway, but I
> don't know what workflows other people have.
> ---
>  automation/gitlab-ci/build.yaml |  6 ++++++
>  automation/gitlab-ci/test.yaml  | 14 ++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 35e224366f62..f12de00a164a 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -12,6 +12,12 @@
>        - '*/*.log'
>      when: always
>    needs: []
> +  rules:
> +  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +    when: always
> +  - if: $SELECTED_JOBS_ONLY
> +    when: never
> +  - when: on_success
>  
>  .gcc-tmpl:
>    variables: &gcc
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index c21a37933881..93632f1f9204 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -1,6 +1,11 @@
>  .test-jobs-common:
>    stage: test
>    image: ${XEN_REGISTRY}/${CONTAINER}
> +  rules:
> +  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +  - if: $SELECTED_JOBS_ONLY
> +    when: never
> +  - when: on_success
>  
>  .arm64-test-needs: &arm64-test-needs
>    - alpine-3.18-arm64-rootfs-export
> @@ -99,6 +104,9 @@
>        - '*.dtb'
>      when: always
>    rules:
> +    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +    - if: $SELECTED_JOBS_ONLY
> +      when: never
>      - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
>    tags:
>      - xilinx
> @@ -117,6 +125,9 @@
>        - '*.log'
>      when: always
>    rules:
> +    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +    - if: $SELECTED_JOBS_ONLY
> +      when: never
>      - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
>    tags:
>      - xilinx
> @@ -137,6 +148,9 @@
>        - '*.log'
>      when: always
>    rules:
> +    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +    - if: $SELECTED_JOBS_ONLY
> +      when: never
>      - if: $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
>    tags:
>      - qubes-hw2
> -- 
> git-series 0.9.1
> 
--8323329-481172092-1739579359=:3858257--

