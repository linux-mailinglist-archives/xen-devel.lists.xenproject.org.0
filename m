Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F262036EB3C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 15:19:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120012.226924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6a6-0001mT-UA; Thu, 29 Apr 2021 13:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120012.226924; Thu, 29 Apr 2021 13:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6a6-0001m4-PX; Thu, 29 Apr 2021 13:19:50 +0000
Received: by outflank-mailman (input) for mailman id 120012;
 Thu, 29 Apr 2021 13:19:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc6a5-0001ll-0p
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 13:19:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de947845-3734-4545-8f5c-1edd2c518c8c;
 Thu, 29 Apr 2021 13:19:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9A667B12E;
 Thu, 29 Apr 2021 13:19:47 +0000 (UTC)
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
X-Inumbo-ID: de947845-3734-4545-8f5c-1edd2c518c8c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619702387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WUojYK+ADZ+pn5Dj/+VL+HIYJ8qwn0dfSX5cpYO46so=;
	b=X49POZH181Lf4PZd3eCu7zT0pji5xLzRIbs6JJQMO7XzoB+2JZVUziAiDWJ7jAaUw3uQ5u
	W2WSFf9vASmGdIKuZfn92MGDZJUj8ejWz7drd2oxuhmqH/bXYkZLl4mTCNnuTInd3ExEqQ
	MuTQ3+WxgP1FnDrtGPrWD1ZdoEvX9QI=
Subject: Re: [PATCH v3 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210426153741.26904-1-luca.fancellu@arm.com>
 <20210426153741.26904-4-luca.fancellu@arm.com>
 <eae12602-0616-9363-c8c6-ef6bbd78673c@suse.com>
 <E47AFE69-CA75-468D-868D-182F78C6992C@arm.com>
 <d50b05f7-f644-0123-9994-d31668bd5b5f@suse.com>
 <38004B72-8F91-4B4E-843E-B80911DC48B3@arm.com>
 <843b7489-bf08-7313-767c-9c9f1c719736@suse.com>
 <9B01F170-25AC-4777-B913-C46358F49D28@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5931c416-4fb3-d246-e406-481333223dad@suse.com>
Date: Thu, 29 Apr 2021 15:19:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <9B01F170-25AC-4777-B913-C46358F49D28@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.04.2021 15:15, Luca Fancellu wrote:
> That’s great, I’m going to push the v4 for this serie soon, now that the comment is fixed,
> I can include it in the docs too, do you agree?

Of course (provided the patch will not get objected to).

Jan

