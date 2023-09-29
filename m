Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA6A7B36FA
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 17:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610609.950053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmFXO-0004ZK-Oq; Fri, 29 Sep 2023 15:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610609.950053; Fri, 29 Sep 2023 15:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmFXO-0004Wt-Ll; Fri, 29 Sep 2023 15:36:18 +0000
Received: by outflank-mailman (input) for mailman id 610609;
 Fri, 29 Sep 2023 15:36:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S2/E=FN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qmFXN-0004Wj-QE
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 15:36:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edb14750-5edd-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 17:36:16 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B434B4EE0739;
 Fri, 29 Sep 2023 17:36:15 +0200 (CEST)
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
X-Inumbo-ID: edb14750-5edd-11ee-878c-cb3800f73035
MIME-Version: 1.0
Date: Fri, 29 Sep 2023 17:36:15 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Henry
 Wang <Henry.Wang@arm.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [XEN PATCH v2 0/3] docs/misra: add documentation skeleton to
 address MISRA C:2012 Dir 4.1
In-Reply-To: <cover.1695801813.git.nicola.vetrini@bugseng.com>
References: <cover.1695801813.git.nicola.vetrini@bugseng.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <a8b3af7951ad68e02a25ea9347f9de4d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 27/09/2023 11:52, Nicola Vetrini wrote:
> The headline of Directive 4.1 states: "Run-time failures shall be 
> minimized".
> Thus, it requires the project to supply documentation that pertains the 
> measures
> and techinques used to prevent run-time failures from happening. For 
> ease of
> reading, the documentation is in RST format, but since ECLAIR needs a
> source file
> to check that the needed subsections and their format is the one 
> expected, the
> Makefiles for the docs/ are amended to generate such a file.
> 
> The format and categories of the subsections in the .rst file can be
> customized based on feedback from the community: the one provided is 
> just a
> basic skeleton that should be tailored to the project.
> 
> CC-ing also Henry Wang, as these are just documentation and CI changes
> 
> Nicola Vetrini (3):
>   docs/misra: add documentation skeleton for MISRA C:2012 Dir 4.1
>   docs: make the docs for MISRA C:2012 Dir 4.1 visible to ECLAIR
>   automation/eclair: build docs/misra to address MISRA C:2012 Dir 4.1
> 
>  automation/eclair_analysis/build.sh   |   6 +-
>  automation/eclair_analysis/prepare.sh |   4 +-
>  docs/Makefile                         |   7 +-
>  docs/misra/C-runtime-failures.rst     | 200 ++++++++++++++++++++++++++
>  docs/misra/Makefile                   |  22 +++
>  docs/misra/rules.rst                  |   8 +-
>  6 files changed, 240 insertions(+), 7 deletions(-)
>  create mode 100644 docs/misra/C-runtime-failures.rst
>  create mode 100644 docs/misra/Makefile
> 
> --
> 2.34.1

CC-ing Luca as well:
I'm testing the next version of this series, and I'm seeing a failure on 
cppcheck
containers on this pipeline [1]. I'm not sure about what is causing that 
conversion script
to fail. Any pointer in debugging this would be greatly appreciated.

[1] 
https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/1020917280

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

