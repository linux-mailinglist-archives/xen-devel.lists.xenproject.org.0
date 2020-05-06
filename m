Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F541C6D81
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 11:47:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWGe6-0000NC-HN; Wed, 06 May 2020 09:47:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C64T=6U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jWGe4-0000N3-Ss
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 09:47:16 +0000
X-Inumbo-ID: 91c26ec0-8f7e-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91c26ec0-8f7e-11ea-ae69-bc764e2007e4;
 Wed, 06 May 2020 09:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=obrGnkdPlKPx3aYfivWzsx15XeV2cLLhfAQVJKC9a8M=; b=x9D1JWipEzBdFK3O3pIEfqUU+C
 M0Rqi1ilw69f3NoaAGSaLNgeSDGOPlA9N2g4LKGi2dm19BFf5A9zE43dRTEvnUZfzmWwyq8vdKssO
 7ju3gbLv/fLSe7uaPOLcK2qbCX1ooqPsfLDQVIG+Zfkf6LKSF1zw+5Oc09P3cQvwBd+I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jWGe3-0000zj-3Z; Wed, 06 May 2020 09:47:15 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jWGe2-0000aS-Sj; Wed, 06 May 2020 09:47:15 +0000
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
To: Ian Jackson <ian.jackson@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
 <24240.3047.877655.345428@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1d8eb504-51e9-b8e7-f1af-862760f0f15d@xen.org>
Date: Wed, 6 May 2020 10:47:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <24240.3047.877655.345428@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Ian,

On 04/05/2020 13:34, Ian Jackson wrote:
> George Dunlap writes ("Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the menuconfig directly"):
>> On Apr 30, 2020, at 3:50 PM, Jan Beulich <JBeulich@suse.com> wrote:
>>> Well, if I'm not mis-remembering it was on purpose to make it more
>>> difficult for people to declare themselves "experts". FAOD I'm not
>>> meaning to imply I don't see and accept the frustration aspect you
>>> mention further up. The two need to be carefully weighed against
>>> one another.
> 
> Yes, it was on purpose.  However, I had my doubts at the time and
> I think experience has shown that this was a mistake.
> 
>> I don’t think we need to make it difficult for people to declare
>> themselves experts, particularly as “all” it means at the moment is,
>> “Can build something which is not security supported”.  People who
>> are building their own hypervisors are already pretty well advanced;
>> I think we can let them shoot themselves in the foot if they want
>> to.
> 
> Precisely.

Can I consider this as an Acked-by? :)

Cheers,

-- 
Julien Grall

