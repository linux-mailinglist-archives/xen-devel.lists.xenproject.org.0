Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77043357120
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 17:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106789.204192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUAW4-000064-T1; Wed, 07 Apr 2021 15:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106789.204192; Wed, 07 Apr 2021 15:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUAW4-00005h-Py; Wed, 07 Apr 2021 15:54:52 +0000
Received: by outflank-mailman (input) for mailman id 106789;
 Wed, 07 Apr 2021 15:54:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUAW2-00005c-W5
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 15:54:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a72bc8cd-ce91-4ed9-b9b7-e7e37118cf76;
 Wed, 07 Apr 2021 15:54:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75AB4B166;
 Wed,  7 Apr 2021 15:54:49 +0000 (UTC)
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
X-Inumbo-ID: a72bc8cd-ce91-4ed9-b9b7-e7e37118cf76
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617810889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yiqCoEVimYSRXkNwTYt79fhQeMotr+3iW4qaWc8UQGw=;
	b=a68UZ29GOmAQqZAsSzXJodxdIONuZS1BSzI6nrDRGzmCrdPFVankQiX+S4vmqzKhfLB8u2
	KaG2AgPfDe3DMziYrAdLCwwU34QH62+t8dgfB0277it9/joYmrN2N/Z0n8SoYQdBDRtOju
	XC1NTvrrDgCQxpUYTvXU9VMobU8lKwg=
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <7f143615-acdf-5a97-5e07-57cab49031d6@xen.org>
 <0F20064C-418C-4A4F-9883-4452A726B038@arm.com>
 <24685.52599.234444.705703@mariner.uk.xensource.com>
 <03084EF9-F130-41F7-9D8D-9AF86A87717F@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <47b84686-faac-cfc4-44ae-d6f844bc7d0a@suse.com>
Date: Wed, 7 Apr 2021 17:54:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <03084EF9-F130-41F7-9D8D-9AF86A87717F@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.04.2021 17:29, Bertrand Marquis wrote:
>> On 7 Apr 2021, at 16:19, Ian Jackson <iwj@xenproject.org> wrote:
>>
>> Luca Fancellu writes ("Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h"):
>>> The problem is that Doxygen can’t generate proper documentation for anonymous union/structure, it ends up with warning and/or producing wrong documentation like
>>> changing names or giving field description to the wrong field.
>>
>> This does not seem like it would be an impossibly hard feature to add
>> to doxygen.
> 
> Modifying doxygen is not really in our planned efforts and if someone does it that would put an hard constraint on the version of doxygen possible to use.
> 
> But is adding names to anonymous elements really an issue here ?

It's clutter in the code base, making things harder to read (even if
just slightly). It's certainly odd to make such source changes just
for a doc tool. If changing doxygen is not an option for you, how
about pre-processing the header and inserting the names the tool
wants, before handing the result as input to it?

Jan

