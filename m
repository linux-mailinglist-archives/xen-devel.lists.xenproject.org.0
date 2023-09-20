Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158627A77C9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 11:43:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605433.943008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qitix-0004EP-Mn; Wed, 20 Sep 2023 09:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605433.943008; Wed, 20 Sep 2023 09:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qitix-0004Cj-It; Wed, 20 Sep 2023 09:42:23 +0000
Received: by outflank-mailman (input) for mailman id 605433;
 Wed, 20 Sep 2023 09:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KN1t=FE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qitiw-0004BM-8e
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 09:42:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe76fa6e-5799-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 11:42:20 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 23E484EE073A;
 Wed, 20 Sep 2023 11:42:20 +0200 (CEST)
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
X-Inumbo-ID: fe76fa6e-5799-11ee-8789-cb3800f73035
MIME-Version: 1.0
Date: Wed, 20 Sep 2023 11:42:20 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 simone.ballarin@bugseng.com, sanastasio@raptorengineering.com
Subject: Re: xen | Failed pipeline for staging | ea36ac0d
In-Reply-To: <alpine.DEB.2.22.394.2309191609280.3563@ubuntu-linux-20-04-desktop>
References: <65096f918e2e5_29a56047619e@gitlab-sidekiq-catchall-v2-84c6ffbc68-bt8nn.mail>
 <a5a252a7-47b0-3ee2-3157-0b18e5f0b079@suse.com>
 <alpine.DEB.2.22.394.2309191609280.3563@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <3d00ccd4fc326fd2daa86be8897f8589@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2023 01:12, Stefano Stabellini wrote:
> On Tue, 19 Sep 2023, Jan Beulich wrote:
>> On 19.09.2023 11:53, GitLab wrote:
>> > Job #5118269256 ( https://gitlab.com/xen-project/xen/-/jobs/5118269256/raw )
>> >
>> > Stage: analyze
>> > Name: eclair-x86_64
>> 
>> Quoting from the log:
>> 
>> ...
>> Success: No unexpected reports.
>> ...
>> ENOENT: no such file or directory, mkdir 
>> '/var/local/eclair/xen-project.ecdf/xen-project/xen/ECLAIR_normal/staging/X86_64/5118269256'
>> ...
>> 
>> If that's the sole reason for the failure, then it doesn't look to be 
>> code
>> related.
> 
> That is one issue, I am CCing Simone and Nicola. Please send a quick 
> fix
> for the "ENOENT" error from the eclair-x86_64 job.
> 
> There is a second unrelated issue breaking staging. The PPC builds are
> failing. I am CCing Shawn. Please send a quick fix if you can to 
> unblock
> gitlab-ci if you can.
> 
> https://gitlab.com/xen-project/xen/-/jobs/5122987281
> https://gitlab.com/xen-project/xen/-/pipelines/1010095539

There was an issue on our infrastructure. Now the analysis should be 
working.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

