Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF514A9A965
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 12:05:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966073.1356408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7tSd-0000wh-VH; Thu, 24 Apr 2025 10:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966073.1356408; Thu, 24 Apr 2025 10:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7tSd-0000tx-Rj; Thu, 24 Apr 2025 10:05:39 +0000
Received: by outflank-mailman (input) for mailman id 966073;
 Thu, 24 Apr 2025 10:05:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YKuC=XK=tum.de=f.specht@srs-se1.protection.inumbo.net>)
 id 1u7tSc-0000q6-O1
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 10:05:38 +0000
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de
 [2001:4ca0:0:103::81bb:ff8a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aaa39063-20f3-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 12:05:37 +0200 (CEST)
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
 by postout2.mail.lrz.de (Postfix) with ESMTP id 4Zjs6l6rySzyWN;
 Thu, 24 Apr 2025 12:05:35 +0200 (CEST)
Received: from postout2.mail.lrz.de ([127.0.0.1])
 by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavis, port 20024)
 with LMTP id fFaMnjZ0vLen; Thu, 24 Apr 2025 12:05:35 +0200 (CEST)
Received: from localhost (unknown [37.85.220.79])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4Zjs6k6brkzyVm;
 Thu, 24 Apr 2025 12:05:34 +0200 (CEST)
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
X-Inumbo-ID: aaa39063-20f3-11f0-9eb1-5ba50f476ded
Authentication-Results: postout.lrz.de (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tum.de; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=tu-postout21; t=1745489135; bh=/
	7l4LvLUGhi/+rWQnguP0LuDPmeBe+N1nMOqzQPBV44=; b=hjrJm0DwqTFLHkOY9
	Lac3zkauD2WBuEcZZ7jMsLGTDaEbUA9kSlUTelGTqxYr33ol0WCCkayNCww2QYQk
	97YFTH9mF1ezzRXQW+amRkdBWI4Sh1Yil2FeAhQHuqGQq4Va3TEJ9HvOszc3yDcL
	hlYtuZLWMZHiT2NP/sg505KtCOWxppM0IBzEKrWAUQ2gogjirKQvMNagp/whpf0X
	n4zjcXnZ+hOndBQ501EcfZF2NMejWmd01Hv3LH9hg6tWUyKBiGR+gjyBhYZN621q
	DwOBW5urWn0XTUc8LoIIUWVy9npHK6kjG/q9MyQ+wr/b4L8uS3KPmzdlkvonbFGk
	YWKrw==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.873
X-Spam-Level:
X-Spam-Status: No, score=-2.873 tagged_above=-999 required=5
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
 DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001, LRZ_DMARC_FAIL=0.001,
 LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
 LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
 LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
 LRZ_FROM_ENVFROM_ALIGNED_STRICT=0.001, LRZ_FROM_HAS_A=0.001,
 LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
 LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
 LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
 LRZ_HAS_CT=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_MIME_VERSION=0.001,
 LRZ_HAS_SPF=0.001, LRZ_MSGID_LONG_50=0.001, LRZ_MSGID_NO_FQDN=0.001,
 LRZ_NO_UA_HEADER=0.001, LRZ_SUBJ_FW_RE=0.001] autolearn=no autolearn_force=no
Date: Thu, 24 Apr 2025 12:05:34 +0200
From: Fabian Specht <f.specht@tum.de>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: manuel.andreas@tum.de
Subject: Re: UBSan bug in real mode fpu emulation
Message-ID: <s6vpfyfzvp73va7geesgj6pmcuhebglqsz7vpug6c44c3qiawf@l3pxta3f7uxz>
References: <l2jnq5cxgkzcdkndp3mjf76nd7wdp2pbstkqo7llaarmbfqdge@bxdydela4rcf>
 <40a5c44c-4ef1-4852-b441-ea65e31b2345@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40a5c44c-4ef1-4852-b441-ea65e31b2345@suse.com>

On Thu, Apr 24, 2025 at 08:34:42AM +0200, Jan Beulich wrote:
> Since ...
> 
> > Similar code resides in the same file in lines 87, 125 and 127.
> 
> ... all of these are shifts by 16, could you clarify what it is that you
> want to shift by 4? Imo what we need to do here is add casts to unsigned
> int, for the results thereof to be shifted (or use some extra arithmetic
> to achieve the same effect, e.g. add in 0U). Or we could go and replace
> the shifts by 16 with shifts by 12 (accounting for the later right shift
> by 4, which would then need dropping).
> 
> Jan

I will submit a patch in the coming hours.

~Fabian Specht

