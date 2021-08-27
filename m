Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 752F73F9A62
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 15:43:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173670.316847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJc7a-0004CY-Ak; Fri, 27 Aug 2021 13:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173670.316847; Fri, 27 Aug 2021 13:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJc7a-00049K-7O; Fri, 27 Aug 2021 13:42:14 +0000
Received: by outflank-mailman (input) for mailman id 173670;
 Fri, 27 Aug 2021 13:42:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DBy1=NS=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mJc7X-00049B-Tz
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 13:42:12 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93bde650-073c-11ec-aac4-12813bfff9fa;
 Fri, 27 Aug 2021 13:42:10 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630071724172779.9854027519895;
 Fri, 27 Aug 2021 06:42:04 -0700 (PDT)
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
X-Inumbo-ID: 93bde650-073c-11ec-aac4-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1630071727; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FtH6lYNtoLsRsJFYCcwAIbghdc3JRPnMky/snryegtBfhSsUmQ57OEcCC2K1Qp+JShs/NJ8XsTGizzTJXzl+lMTMH6mwl/nSdur+f69S+JsCzsGksr0Zn2yB3XsgXZ8AZAuuScuHos+Gc1OfuYk+Y0N0HDFbXl64HsKVSeN42kY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630071727; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=TmFi20IXZOCGSzpzjXY8TtbnZGVJCnidZE51dIM45zc=; 
	b=DgzGGwSByN7ek5nF7EfHwqoxDkaGNs+G6Z3IbDXUopMeuVvMWzoawPhs0ryitxan/C59Z15pIquSqXqmOa/k0DmAGxAL+sFgoP/Nn24jzuYS9zsHDK6c1EA8mXNyplJ41L8tD1kByJCss0QRNI28oPQTV/BGoRX9MUg8xZV2V9s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630071727;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TmFi20IXZOCGSzpzjXY8TtbnZGVJCnidZE51dIM45zc=;
	b=mp+I62AVhB6nziOfahkzLKpd+LNBr/A+HEyPBnqY2478gR5KQEJlpw0RKlAkNnPB
	CbOPvQ4voGfrRS4bUVbTHQYclDDjyCjtmxYsGuGOOa9xtjnwcxYf9G7tlsBgGt0jAMF
	w1jOpZii1SZL1w1eKofsU8asX0iAEktaKhZbkx/E=
Subject: Re: [PATCH v3 2/7] xsm: remove the ability to disable flask
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-3-dpsmith@apertussolutions.com>
 <aa55359e-cf96-ce3e-b1bd-a7af4397d4a4@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <59799841-7489-553c-20b8-6201d253fdf6@apertussolutions.com>
Date: Fri, 27 Aug 2021 09:42:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <aa55359e-cf96-ce3e-b1bd-a7af4397d4a4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/25/21 11:22 AM, Jan Beulich wrote:
> On 05.08.2021 16:06, Daniel P. Smith wrote:
>> On Linux when SELinux is put into permissive mode the descretionary access
>> controls are still in place. Whereas for Xen when the enforcing state of flask
>> is set to permissive, all operations for all domains would succeed, i.e. it
>> does not fall back to the default access controls. To provide a means to mimic
>> a similar but not equivalent behavior, a flask op is present to allow a
>> one-time switch back to the default access controls, aka the "dummy policy".
>>
>> This patch removes this flask op to enforce a consistent XSM usage model that a
>> reboot of Xen is required to change the XSM policy module in use.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> The primary reason you remove this is - aiui - that with alternatives
> patching there's technically not really a way back (would need to re-
> patch every patched location, or every hook would need to check whether
> state changed to disabled and if so chain on to the dummy function).
> This became sufficiently clear to me only when looking at the next
> patch. It would be nice if description also said why the change is
> needed. As it stands to me the description reads at best like something
> that people could have different views on (and initially I didn't mean
> to reply here, for not being convinced of the removal of functionality
> in the common case).
> 
> Jan
> 

Ack, I can expand further.

v/r,
dps

