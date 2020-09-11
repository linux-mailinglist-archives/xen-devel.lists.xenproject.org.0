Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF87A266075
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 15:40:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGjHB-0004To-Tx; Fri, 11 Sep 2020 13:39:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DvaW=CU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kGjHA-0004Tj-2j
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 13:39:40 +0000
X-Inumbo-ID: cf405269-85c2-49c9-9d59-02f2bf277ce0
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf405269-85c2-49c9-9d59-02f2bf277ce0;
 Fri, 11 Sep 2020 13:39:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C37FDB1AA;
 Fri, 11 Sep 2020 13:39:53 +0000 (UTC)
Subject: Re: [PATCH 3/8] Convert code-of-conduct to rst
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20200911124009.3760032-1-george.dunlap@citrix.com>
 <20200911124009.3760032-4-george.dunlap@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cdd7fad9-933b-ce81-f71a-017d839fd967@suse.com>
Date: Fri, 11 Sep 2020 15:39:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911124009.3760032-4-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.09.20 14:40, George Dunlap wrote:
> Underline section titles.
> 
> Convert links to RST-style links.  NB that the Communication Guide
> link won't work ATM; this will be fixed when we convert that document
> to RST.
> 
> Adjust the formatting for the list so that it's converted properly.
> 
> A couple of clean-ups:
> 
> * Expand the label for communication guidance, and convert the link to
> the project governance to a named reference rather than an "embedded"
> URI.
> 
> * Move all hyperlink targets to the bottom of the article, and put
>    them in the order they're linked.
> 
> No changes to the text.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
>   ...code-of-conduct.md => code-of-conduct.rst} | 39 ++++++++++++-------
>   source/conf.py                                |  2 +-
>   source/index.rst                              |  1 +
>   3 files changed, 27 insertions(+), 15 deletions(-)
>   rename source/{code-of-conduct.md => code-of-conduct.rst} (83%)
> 
> diff --git a/source/code-of-conduct.md b/source/code-of-conduct.rst
> similarity index 83%
> rename from source/code-of-conduct.md
> rename to source/code-of-conduct.rst
> index a6080cd..81efe04 100644
> --- a/source/code-of-conduct.md
> +++ b/source/code-of-conduct.rst
> @@ -1,6 +1,8 @@
> -# Xen Project Code of Conduct
> +Xen Project Code of Conduct
> +***************************
>   
> -## Our Pledge
> +Our Pledge
> +==========
>   
>   In the interest of fostering an open and welcoming environment, we as
>   contributors and maintainers pledge to make participation in our project and
> @@ -9,12 +11,13 @@ size, disability, ethnicity, sex characteristics, gender identity and
>   expression, level of experience, education, socio-economic status, nationality,
>   personal appearance, race, religion, or sexual identity and orientation.
>   
> -## Our Standards
> +Our Standards
> +=============
>   
>   We believe that a Code of Conduct can help create a harassment-free environment,
>   but is not sufficient to create a welcoming environment on its own: guidance on
>   creating a welcoming environment, how to communicate in an effective and
> -friendly way, etc. can be found [here][guidance]].
> +friendly way, etc. can be found `here <Communication Guidance_>`_.
>   
>   Examples of unacceptable behavior by participants include:
>   
> @@ -27,7 +30,8 @@ Examples of unacceptable behavior by participants include:
>   * Other conduct which could reasonably be considered inappropriate in a
>     professional setting
>   
> -## Our Responsibilities
> +Our Responsibilities
> +====================
>   
>   Project leadership team members are responsible for clarifying the standards of
>   acceptable behavior and are expected to take appropriate and fair corrective
> @@ -39,7 +43,8 @@ contributions that are not aligned to this Code of Conduct, or to ban
>   temporarily or permanently any contributor for other behaviors that they deem
>   inappropriate, threatening, offensive, or harmful.
>   
> -## Scope
> +Scope
> +=====
>   
>   This Code of Conduct applies within all project spaces of all sub-projects,
>   and it also applies when an individual is representing the project or its
> @@ -49,7 +54,8 @@ media account, or acting as an appointed representative at an online or offline
>   event. Representation of a project may be further defined and clarified by the
>   project leadership.
>   
> -## What to do if you witness or are subject to unacceptable behavior
> +What to do if you witness or are subject to unacceptable behavior
> +=================================================================
>   
>   Instances of abusive, harassing, or otherwise unacceptable behavior may be
>   reported by contacting Conduct Team members at conduct@xenproject.org. All
> @@ -67,25 +73,30 @@ Project leadership team members who do not follow or enforce the Code of Conduct
>   in good faith may face temporary or permanent repercussions as determined by
>   other members of the project's leadership.
>   
> -## Conduct Team members
> +Conduct Team members
> +====================
> +
>   Conduct Team members are project leadership team members from any
>   sub-project. The current list of Conduct Team members is:
> +
>   * Lars Kurth <lars dot kurth at xenproject dot org>

May I suggest to add a patch removing Lars from this list?


Juergen

