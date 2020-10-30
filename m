Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF512A0130
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 10:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15540.38522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYQbe-0003Ry-Je; Fri, 30 Oct 2020 09:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15540.38522; Fri, 30 Oct 2020 09:21:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYQbe-0003RZ-GM; Fri, 30 Oct 2020 09:21:58 +0000
Received: by outflank-mailman (input) for mailman id 15540;
 Fri, 30 Oct 2020 09:21:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYQbc-0003RU-PP
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 09:21:56 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a2aa8e4-f54a-4d44-b8d8-9afcc6ec9b9f;
 Fri, 30 Oct 2020 09:21:56 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYQba-00046U-LQ; Fri, 30 Oct 2020 09:21:54 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYQba-0001sV-9C; Fri, 30 Oct 2020 09:21:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYQbc-0003RU-PP
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 09:21:56 +0000
X-Inumbo-ID: 2a2aa8e4-f54a-4d44-b8d8-9afcc6ec9b9f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2a2aa8e4-f54a-4d44-b8d8-9afcc6ec9b9f;
	Fri, 30 Oct 2020 09:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=C6Qn0UOp1nMlwhAK5tIHIGIr907LmAWq6teNp7OFnvk=; b=BFpSZQw0ufIbCXkYfnb3dOWj+a
	yAq7bRX5S+BI6Ipz4yy28MAPvlxS26VXxAhCHvPNgrpi529GvA/t7WkUCLQPInfCSQJ8Vq+6WNu4R
	3ousHKCvrgF8tIuFXhdGzVLlUPs5Fr+WxrJBLaH03tGAY1JRjyOghNr9hKT3nZmbuVZ0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYQba-00046U-LQ; Fri, 30 Oct 2020 09:21:54 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYQba-0001sV-9C; Fri, 30 Oct 2020 09:21:54 +0000
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
To: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
 <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
 <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
 <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s>
 <D8EF4B06-B64D-4264-8C86-DA1B5A1146D2@arm.com>
 <7314936f-6c1e-5ca6-a33b-973c8e61ba3b@xen.org>
 <D9F93137-412F-47E5-A55C-85D1F3745618@arm.com>
 <2813ea2b-bfc4-0590-47ef-86089ad65a5d@xen.org>
 <0E2548E0-0504-43B6-8DD7-D5B7BACCEB6E@arm.com>
 <bc697327-2750-9a78-042d-d45690d27928@xen.org>
 <92A7B6FF-A2CE-4BB1-831A-8F12FB5290B8@arm.com>
 <alpine.DEB.2.21.2010291316290.12247@sstabellini-ThinkPad-T480s>
 <1BE06E0F-26CF-453A-BB06-808CC0F3E09B@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <aae5892a-2532-04f8-02af-84c4d4c4f3fd@xen.org>
Date: Fri, 30 Oct 2020 09:21:52 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1BE06E0F-26CF-453A-BB06-808CC0F3E09B@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 30/10/2020 08:46, Rahul Singh wrote:
> Ok Yes when I ported the driver I port the command queue operation from the previous commit where atomic operations is not used and rest all the code is from the latest code. I will again make sure that any bug that is fixed in Linux should be fixed in XEN also.

I would like to seek some clarifications on the code because there seem 
to be conflicting information provided in this thread.

The patch (the baseline commit is provided) and the discussion with 
Bertrand suggests that you took a snapshot of the code last year and 
adapted for Xen.

However, here you suggest that you took an hybrid approach where part of 
the code is based from last year and other part is based from the latest 
code (I assume v5.9).

So can you please clarify?

Cheers,

-- 
Julien Grall

