Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225B135F393
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 14:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110563.211025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWeco-0004jt-Eg; Wed, 14 Apr 2021 12:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110563.211025; Wed, 14 Apr 2021 12:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWeco-0004jU-BS; Wed, 14 Apr 2021 12:28:06 +0000
Received: by outflank-mailman (input) for mailman id 110563;
 Wed, 14 Apr 2021 12:28:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWecn-0004jP-CN
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 12:28:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7268aa32-c543-4606-b8dc-18bb43fb3c6f;
 Wed, 14 Apr 2021 12:28:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3479AFC8;
 Wed, 14 Apr 2021 12:28:03 +0000 (UTC)
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
X-Inumbo-ID: 7268aa32-c543-4606-b8dc-18bb43fb3c6f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618403284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rL7wLMhNgh7IWoJn6L3M5DMMBb1G/b4OnanfaujhRkc=;
	b=NZYz0gybOhpxwiji3jVm2RtAcK8KUDHPR8uPlDpt4H24pv0Vvpe1f08SnYJ9aqcgOJ0nLE
	olFJ11kBmt1M23qJfPHSwZ3u1BgpbZv/p+KrN86WtJzIDj/HwugvrbIBKMjsTk2Vog8el0
	LNU/N6fKkkatMavFc+Dnse0NL2039ts=
Subject: Re: [PATCH] x86/vPMU: Extend vPMU support to version 5
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: jun.nakajima@intel.com, kevin.tian@intel.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, xen-devel@lists.xenproject.org
References: <1618334701-8263-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <01a59c84-c9ed-f9ca-1316-c9fc36ecde30@suse.com>
Date: Wed, 14 Apr 2021 14:28:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1618334701-8263-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.04.2021 19:25, Igor Druzhinin wrote:
> Version 5 is backwards compatible with version 3. This allows to enable
> vPMU on Ice Lake CPUs.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

