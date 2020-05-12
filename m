Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA1E1CEDEA
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 09:18:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYPBZ-0005mI-3Q; Tue, 12 May 2020 07:18:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYPBX-0005m8-N1
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 07:18:39 +0000
X-Inumbo-ID: cce54652-9420-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cce54652-9420-11ea-b07b-bc764e2007e4;
 Tue, 12 May 2020 07:18:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 83FE2B175;
 Tue, 12 May 2020 07:18:40 +0000 (UTC)
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
 <24240.3047.877655.345428@mariner.uk.xensource.com>
 <1d8eb504-51e9-b8e7-f1af-862760f0f15d@xen.org>
 <24244.16076.627203.282982@mariner.uk.xensource.com>
 <09d729ad-58a7-1f4b-c779-5fd81d7009a4@xen.org>
 <4017f7f0-744b-70ff-8fa4-b33c53a8b9e2@suse.com>
 <ca115637-5e84-2990-65e8-e2f04ec0ddb5@xen.org>
 <803876ce-503a-2e97-f310-0413e515970b@suse.com>
 <bbc12f81-7854-ad72-63ee-3ec94b378bf9@xen.org>
 <bf6a9ed3-fd7e-c588-9f72-8084dab1f556@suse.com>
 <24249.34804.568523.847077@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88487e23-88f7-2ce8-8292-7e97ed8902c5@suse.com>
Date: Tue, 12 May 2020 09:18:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <24249.34804.568523.847077@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.05.2020 19:14, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the menuconfig directly"):
>> I'm trying to make the point that your patch, to me, looks to be
>> trying to overcome a problem for which we have had a solution all
>> the time.
> 
> Thanks for this clear statement of your objection.  I'm afraid I don't
> agree.  Even though .config exists (and is even used by osstest, so I
> know about it) I don't think it is as good as having it in
> menuconfig.

But you realize that my objection is (was) more towards the reasoning
behind the change, than towards the change itself. If, as a community,
we decide to undo what we might now call a mistake, and if we're ready
to deal with the consequences, so be it.

Jan

