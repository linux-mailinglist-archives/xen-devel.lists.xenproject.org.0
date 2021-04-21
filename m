Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEBB3668F9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114297.217809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9se-0006fU-Ao; Wed, 21 Apr 2021 10:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114297.217809; Wed, 21 Apr 2021 10:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9se-0006f3-5z; Wed, 21 Apr 2021 10:14:48 +0000
Received: by outflank-mailman (input) for mailman id 114297;
 Wed, 21 Apr 2021 10:14:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZ9sc-0006eb-AO
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:14:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dfba6ee-09d1-4241-863b-bfe73eef0286;
 Wed, 21 Apr 2021 10:14:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7DA64ACB1;
 Wed, 21 Apr 2021 10:14:44 +0000 (UTC)
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
X-Inumbo-ID: 6dfba6ee-09d1-4241-863b-bfe73eef0286
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619000084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7EvFikfHlbgIEknXLhXxcjTe3nCsX4Tv8YxBVVDYQAA=;
	b=ax/BBzBQCISMR3RM8hpgUhcqzfXKxo5iwAeycqDYaC3Xp2DLxHH56HaCL6ZatlilT0nNK0
	vSLr+tpUIXNKkOR3j9BI4RDQtRpmUsjqrcc4iUVzHfn40Ln6/f9yGt7qLzLODI2wyRpJZM
	G7sVBDfaUrWmqSWRVcp6pSfGmoEwU2Q=
Subject: Re: [PATCH] CI: Drop TravisCI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Doug Goldstein <cardoe@cardoe.com>,
 Wei Liu <wl@xen.org>
References: <20210421092705.2295-1-andrew.cooper3@citrix.com>
 <20210421100418.7nyuka557iv6z2qk@liuwe-devbox-debian-v2>
 <e4f3157b-bb47-a15f-120a-e9b87d7d1faa@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6abb10d0-a324-d05f-cfed-2ce48bb5ff07@suse.com>
Date: Wed, 21 Apr 2021 12:14:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <e4f3157b-bb47-a15f-120a-e9b87d7d1faa@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 12:08, Andrew Cooper wrote:
> On 21/04/2021 11:04, Wei Liu wrote:
>> On Wed, Apr 21, 2021 at 10:27:05AM +0100, Andrew Cooper wrote:
>>> Travis-ci.org is shutting down shortly.  The arm cross-compile testing has
>>> been broken for a long time now, and all testing has now been superseded by
>>> our Gitlab infrastructure.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Wei Liu <wl@xen.org>
> 
> Thanks.
> 
>> I guess this also needs backporting?
> 
> Unsure.  It logically depends on "automation: add arm32 cross-build
> tests for Xen" which is currently the top commit on staging, but said
> cross-compile tests were also the ones broken in Travis.
> 
> When travis shuts down, it will simply stop caring about repos/branches
> containing a .travis.yml, so I don't think anything is going to break as
> a consequence.
> 
> Then again, it is probably bad form to retain CI configuration for
> something which we know doesn't work.
> 
> Jan - thoughts?

Since the patch ought to be trivial to backport, for the latter of your
arguments I think I'd prefer backporting it.

Jan

