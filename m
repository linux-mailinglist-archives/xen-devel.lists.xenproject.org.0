Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A911EA56B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:57:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkwD-0002Zc-H9; Mon, 01 Jun 2020 13:57:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kFUs=7O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jfkwB-0002ZR-Ie
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:57:11 +0000
X-Inumbo-ID: ca231954-a40f-11ea-9dbe-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca231954-a40f-11ea-9dbe-bc764e2007e4;
 Mon, 01 Jun 2020 13:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RI26nJEjlSMT+f2wgvD/8C4nvY4PnmZob0X/mxL/G5k=; b=zTkV/8cF0m5u/kJ4SPZeHmeKGE
 SyEMYmhlO122dSqUT7sdZ9N7u+01MaxjklfBL5KQ2s937mpoqdceL0rIstFxFeDKHQSyb0W05nkIV
 hoMGmmiXkN/pWYIDWAbYzgsoZR5ka+FnK+bZyhv8V4aYnnqPCrDysm6t2KFWWQmvqsRo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jfkw9-0002l7-Ss; Mon, 01 Jun 2020 13:57:09 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jfkw9-0005bk-Lv; Mon, 01 Jun 2020 13:57:09 +0000
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
To: George Dunlap <George.Dunlap@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <24272.59646.746545.343358@mariner.uk.xensource.com>
 <4a8e7cf2-8f63-d4d2-e051-9484a5b8c8ed@suse.com>
 <96F32637-E410-4EC8-937A-CFC8BE724352@citrix.com>
 <24273.8332.662607.125522@mariner.uk.xensource.com>
 <7eaa7541-f698-b29b-b4b3-1f40fc37c5d7@xen.org>
 <63838ce9-8dbf-aacf-521d-97540758a945@suse.com>
 <429e81a2-80d5-0d50-6352-6471cd4698a8@xen.org>
 <EEFCB4D0-9C2F-4527-8445-0FA78DE7285E@citrix.com>
 <b06a89b2-3fa1-86d7-ba82-d4aac1236cf2@xen.org>
 <4F8449D8-6023-4A40-9C87-875299DD0EEF@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <51c5e3db-48a9-9ef6-699c-e8b48db1b499@xen.org>
Date: Mon, 1 Jun 2020 14:57:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <4F8449D8-6023-4A40-9C87-875299DD0EEF@citrix.com>
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 01/06/2020 14:35, George Dunlap wrote:
> 
> 
>> On Jun 1, 2020, at 2:10 PM, Julien Grall <julien@xen.org> wrote:
>> 4. Extract the .config from the binary using a similar script to script/extract-ikconfig.
> 
> Ah, gotcha.  I did misunderstand your suggestion.
The advantage I can see with this solution is this is arch agnostic and 
can be easily extend to other options. But it also means at least some 
of CONFIG_* needs to be stable.

Can this solution be an alternative to the ELF note?

Cheers,

-- 
Julien Grall

