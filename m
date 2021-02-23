Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A2E322649
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 08:17:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88583.166638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lERw8-0007fC-JB; Tue, 23 Feb 2021 07:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88583.166638; Tue, 23 Feb 2021 07:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lERw8-0007eq-Fj; Tue, 23 Feb 2021 07:16:48 +0000
Received: by outflank-mailman (input) for mailman id 88583;
 Tue, 23 Feb 2021 07:16:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lERw6-0007el-Tt
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 07:16:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75c20548-ce79-4e9e-94d2-fba73181b91d;
 Tue, 23 Feb 2021 07:16:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6632EAC6E;
 Tue, 23 Feb 2021 07:16:45 +0000 (UTC)
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
X-Inumbo-ID: 75c20548-ce79-4e9e-94d2-fba73181b91d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614064605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rZNl2J+TuuNqaHSlsFWCxq5LosMSejDP9+klGAcWHc=;
	b=iPwHmf31DvMhgFCYtea+ROBZ5MrzKgNGLNPQzC+w4aHaL+7f5B1e2gBCdjsNnRajwSQ782
	BBFi1tqcKmO6r7SctCNruPU8RaA5BJy97od8VCTnFRn/rsbnYyd+yWQ3x0O9mbf/7EZLym
	obIAy1t2yvK7CisayNkpgAyHOOEI7w4=
Subject: Re: [PATCH v3 0/5] Support Secure Boot for multiboot2 Xen
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Olivier Lambert <olivier.lambert@vates.fr>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <9a58bdf7-3a34-1b81-aec9-b14da463d75e@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f24e9e8d-9d55-f301-9a33-4398b463013d@suse.com>
Date: Tue, 23 Feb 2021 08:16:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9a58bdf7-3a34-1b81-aec9-b14da463d75e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.02.2021 19:04, Bobby Eshleman wrote:
> I just wanted to request more feedback on this series and put it on the radar, while acknowledging
> that I'm sure given the recent code freeze it is a busy time for everybody.

It is on my list of things to look at. While probably not a good excuse,
my looking at previous versions of this makes we somewhat hesitant to
open any of these patch mails ... But I mean to get to it.

Jan

