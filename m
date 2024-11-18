Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B169D129C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 15:04:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839370.1255172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD2M3-0002lg-TF; Mon, 18 Nov 2024 14:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839370.1255172; Mon, 18 Nov 2024 14:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD2M3-0002jA-QQ; Mon, 18 Nov 2024 14:03:51 +0000
Received: by outflank-mailman (input) for mailman id 839370;
 Mon, 18 Nov 2024 14:03:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yNJ=SN=bounce.vates.tech=bounce-md_30504962.673b493e.v1-21f92527e3404d3495738294f8e496a3@srs-se1.protection.inumbo.net>)
 id 1tD2M2-0002j4-80
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 14:03:50 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc725fa-a5b5-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 15:03:44 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4XsTqy5wXKz3sPMtg
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 14:03:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 21f92527e3404d3495738294f8e496a3; Mon, 18 Nov 2024 14:03:42 +0000
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
X-Inumbo-ID: ebc725fa-a5b5-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImViYzcyNWZhLWE1YjUtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTM4NjI0LjYyNTQ2OSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2I0OTNlLnYxLTIxZjkyNTI3ZTM0MDRkMzQ5NTczODI5NGY4ZTQ5NmEzQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731938622; x=1732199122;
	bh=XRalsAUTOmmbKLFYOVVY82M+AmAwUkx+cpAqw2uiRBk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Luy60ikDAoJXL0KFn5uXHLbzHvfvJWkYFvYwdXd9L9mTIVivZpTb1hcpDUSaPHnRV
	 izEukozxklvura/pyMMw206s2Wt7mDsEaUxUvGKLGwYYpxImYRHW60Ze/97aBHH6fb
	 VBH8rkYhjXieCsabZfo1VJFzt0teatStrfnL/pZpCv5kehraH6OD1XU2xKDFlC3Crw
	 eu2RV9IMenLr+WxRgM4f/vdolo3+1t2apYReiN84npR4HDSAM25xIPzenH5L5zKouI
	 AuhWgT9FbyZtyhaB20lbE980X759yXo/8kQlUa1wY5+HzNvaQ9u/Vczw4rOiI/f5fI
	 2Vj8s0Qj6LpqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731938622; x=1732199122; i=anthony.perard@vates.tech;
	bh=XRalsAUTOmmbKLFYOVVY82M+AmAwUkx+cpAqw2uiRBk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=r4MSMrycFUcAxtd87ERD2jPf9gW6rAjVsTSV2oae845mECb7Aocyo8ABndg1VMkvH
	 jXe/5Ehw36Ynyp7jPZe7z4QVAa1UAn7Y2yX6mOPE3Ews0DZVD3n4S4Km8GjiIapD/j
	 85Y4kKqPwmNfw1LojMhqmaTGrUds/xnfE7QK/3v9QV061ZtZclVUqJm1eU5MikqU4t
	 FFsE9/XkCjjiEdVtTqgSi8QqgNlR/mGs2nJOVGI3tWRCgRVYgnSsLw9wv8W6ewq2UC
	 JOqRD6K1T22ZE/PSgIJP61rABLTrfE+boeyqR9s2r/IXFlIzDYSKoPhb9HChOC3PT5
	 eqe0zfmfNyClQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=203/3]=20CI:=20New=20stage=20"containers"=20to=20rebuild=20some=20containers?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731938620812
To: "Stefano Stabellini" <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Doug Goldstein" <cardoe@cardoe.com>
Message-Id: <ZztJPKoLvaTZguze@l14>
References: <20241115170739.48983-1-anthony.perard@vates.tech> <20241115170739.48983-4-anthony.perard@vates.tech> <alpine.DEB.2.22.394.2411151629450.1160299@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2411151629450.1160299@ubuntu-linux-20-04-desktop>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.21f92527e3404d3495738294f8e496a3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241118:md
Date: Mon, 18 Nov 2024 14:03:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Nov 15, 2024 at 04:34:21PM -0800, Stefano Stabellini wrote:
> On Fri, 15 Nov 2024, Anthony PERARD wrote:
> > Rebuild rolling release containers when XEN_CI_REBUILD_CONTAINERS is
> > set. This is to be use with a scheduled pipeline.
> > 
> > When $XEN_CI_REBUILD_CONTAINERS is set, only build jobs related to the
> > containers been rebuild will be executed.
> > 
> > Build jobs that are using one of the containers been rebuild should
> > wait for the container to be rebuild. If it's a normal pipeline, those
> > dependency are simply ignored.
> 
> This is a fantastic contribution, thanks Anthony!
> 
> I think we can simplify this patch by removing all stages except for
> "containers" on the scheduled pipeline with XEN_CI_REBUILD_CONTAINERS
> set to true.
> 
> I think it is a good idea to have a special schedule pipeline for this,
> and we should exploit the fact that it is special and only use it to
> rebuild the containers. If we want to, we can have a second scheduled
> pipeline to do a full normal run afterwards.
> 
> This way, there is no need to carry the changes to build.yaml or
> test.yaml that are a bit hard to read/understand for someone unfamiliar
> with gitlab. When XEN_CI_REBUILD_CONTAINERS == true we only do the
> containers stage.

So, you mean having this following change instead of make changes to
build.yaml and test.yaml, right?

    diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
    --- a/.gitlab-ci.yml
    +++ b/.gitlab-ci.yml
    @@ -14,7 +14,15 @@ stages:
       - test
     
     include:
    -  - 'automation/gitlab-ci/containers.yaml'
    -  - 'automation/gitlab-ci/analyze.yaml'
    -  - 'automation/gitlab-ci/build.yaml'
    -  - 'automation/gitlab-ci/test.yaml'
    +  - local: 'automation/gitlab-ci/containers.yaml'
    +    rules:
    +      - if: $XEN_CI_REBUILD_CONTAINERS
    +  - local: 'automation/gitlab-ci/analyze.yaml'
    +    rules:
    +      - if: $XEN_CI_REBUILD_CONTAINERS == null
    +  - local: 'automation/gitlab-ci/build.yaml'
    +    rules:
    +      - if: $XEN_CI_REBUILD_CONTAINERS == null
    +  - local: 'automation/gitlab-ci/test.yaml'
    +    rules:
    +      - if: $XEN_CI_REBUILD_CONTAINERS == null


Or I guess we can also compare to the string "true" and write the
expression as
    if: $XEN_CI_REBUILD_CONTAINERS == "true"
and
    if: $XEN_CI_REBUILD_CONTAINERS != "true"

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

