Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0721C5A1A
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 16:53:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVywx-0006TF-JG; Tue, 05 May 2020 14:53:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVyww-0006TA-0z
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:53:34 +0000
X-Inumbo-ID: 300e958a-8ee0-11ea-9dc5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 300e958a-8ee0-11ea-9dc5-12813bfff9fa;
 Tue, 05 May 2020 14:53:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DACC1ACC3;
 Tue,  5 May 2020 14:53:33 +0000 (UTC)
Subject: Re: Backports to 4.13
To: Ian Jackson <ian.jackson@citrix.com>
References: <352f0b08-d869-1d57-a357-246574cb9b55@citrix.com>
 <24241.32091.790503.338211@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5ac1c474-27d6-8df5-996c-35726cb819cc@suse.com>
Date: Tue, 5 May 2020 16:53:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <24241.32091.790503.338211@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.05.2020 16:51, Ian Jackson wrote:
> Andrew Cooper writes ("Backports to 4.13"):
>> On the tools side of things, f50a4f6e244c aafae0e800e9 2a62c22715bf
>> d79cc6bc2bac 0729830cc425 are all bugs in CPUID and/or migration.  "Fix
>> HVM_PARAM_PAE_ENABLED handling" is only for 4.13, whereas all the others
>> are back to 4.7 (technically speaking).
> 
> Done.
> 
> There seem to have been quite few requests, but there were a lot of
> fixes tagged with Backport or Fixes.  I have now applied these (not
> just to 4.13 but to all the supported trees so back to 4.10, as
> applicable; plus one non-security bugfix I considered important enough
> to go to the security-supported 4.9).

Why back to 4.10? Only 4.12 and 4.13 are fully supported at this point,
afaict. Older trees should only get security fixes imo, with extremely
few exceptions.

Jan

