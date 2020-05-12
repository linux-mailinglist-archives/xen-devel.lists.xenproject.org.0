Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09F71CF221
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 12:09:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYRqG-0003p8-4u; Tue, 12 May 2020 10:08:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WwR0=62=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jYRqE-0003p3-UX
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 10:08:51 +0000
X-Inumbo-ID: 92f99548-9438-11ea-a289-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92f99548-9438-11ea-a289-12813bfff9fa;
 Tue, 12 May 2020 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oJxlv/d0KiHi8eDk6YvTUJWuKtgj0TZOw+6y6VZF2Uw=; b=c6PAJHo5et+fk6tP2VBR/IlNpJ
 NbN06sit/CeYnZuBSAUuSf6/HdSSvnIXdDspU+ulXd0y3UhXlnAU5FnP0npL0JiZ8MgrmktaymFN8
 +z7tbNSj4Dgq7CpP+zNL/fXRoVRWD8Uw6dECFiA81VE5Iy69K+NmMIBFm53y0Jo19NT4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jYRqB-00033B-Vi; Tue, 12 May 2020 10:08:47 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jYRqB-0002RU-Nu; Tue, 12 May 2020 10:08:47 +0000
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
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
 <88487e23-88f7-2ce8-8292-7e97ed8902c5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8dc17648-c669-eec7-2ecd-81245fa8d517@xen.org>
Date: Tue, 12 May 2020 11:08:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <88487e23-88f7-2ce8-8292-7e97ed8902c5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 12/05/2020 08:18, Jan Beulich wrote:
> On 11.05.2020 19:14, Ian Jackson wrote:
>> Jan Beulich writes ("Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the menuconfig directly"):
>>> I'm trying to make the point that your patch, to me, looks to be
>>> trying to overcome a problem for which we have had a solution all
>>> the time.
>>
>> Thanks for this clear statement of your objection.  I'm afraid I don't
>> agree.  Even though .config exists (and is even used by osstest, so I
>> know about it) I don't think it is as good as having it in
>> menuconfig.
> 
> But you realize that my objection is (was) more towards the reasoning
> behind the change, than towards the change itself. If, as a community,
> we decide to undo what we might now call a mistake, and if we're ready
> to deal with the consequences, so be it.

Would you mind to explain the fall out you expect from this patch? Are 
you worry more people may contact security@xen.org for non-security issue?

Cheers,

-- 
Julien Grall

