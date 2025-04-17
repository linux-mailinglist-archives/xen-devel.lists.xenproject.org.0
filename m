Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6855A9236D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 19:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958310.1351204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5SiF-00041C-Mg; Thu, 17 Apr 2025 17:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958310.1351204; Thu, 17 Apr 2025 17:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5SiF-0003yG-I6; Thu, 17 Apr 2025 17:07:43 +0000
Received: by outflank-mailman (input) for mailman id 958310;
 Thu, 17 Apr 2025 17:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfOZ=XD=tum.de=f.specht@srs-se1.protection.inumbo.net>)
 id 1u5SiD-0003xM-Qr
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 17:07:41 +0000
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de [129.187.255.137])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 762a8750-1bae-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 19:07:37 +0200 (CEST)
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
 by postout1.mail.lrz.de (Postfix) with ESMTP id 4Zdkpw5wsKzyZB;
 Thu, 17 Apr 2025 19:07:36 +0200 (CEST)
Received: from postout1.mail.lrz.de ([127.0.0.1])
 by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavis, port 20024)
 with LMTP id cBOxVHWSWckS; Thu, 17 Apr 2025 19:07:36 +0200 (CEST)
Received: from localhost (ip-77-25-21-71.web.vodafone.de [77.25.21.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4Zdkpv6TfbzyZv;
 Thu, 17 Apr 2025 19:07:35 +0200 (CEST)
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
X-Inumbo-ID: 762a8750-1bae-11f0-9ffb-bf95429c2676
Authentication-Results: postout.lrz.de (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tum.de; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=tu-postout21; t=1744909656; bh=z
	va0/TptVOqWu9/wDGrF7NK2AQb0tx0cmf8Q2XtGOuQ=; b=XzDD2DcpDZp9eMwcE
	wiTDPJKCQYX3WvKAsUlElmLIWulYkXz1MQ3tOUjFein+voLn7Btk5M+eiG2bIfka
	WT6U016XpNpFqfiowBbi867jCshneAUWhLMxiL/Oba7tuVdGHe/wYTO+kXCSVy3h
	A+o8t7qNe9uwBvhBc4Zu1eqSjYf5FMx0VgdBrWAG/hmOCO+tOlTVj4hnmFAgbIDU
	xkJmxmdSfZIEy7lO3kdBnU2CiWilELJjKCfuwY4SR1pYI7gQ+b1u04HjL3Eb0HKJ
	sF1Gkm+rYbFJ1QZBGFhl73KOB86WQ/Jen1m1OMxJeTYahBGaSEyadnu7bwTdPauh
	c3UgQ==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
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
Date: Thu, 17 Apr 2025 19:07:19 +0200
From: Fabian Specht <f.specht@tum.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: manuel.andreas@tum.de, xen-devel@lists.xenproject.org
Subject: Re: x86 emulation bug
Message-ID: <ux7il4piqihmmx4ilr72ugi25m2m7sa65c6byxmrr22kqpwujw@d36sjo6qpfjw>
References: <jfgrmlid6fhbptebr22ccqimqhys3pchcoyuoepjz2iwoillei@xxaicsktj2pl>
 <910868c1-fc90-49ec-bd06-3ff638ff0c1d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <910868c1-fc90-49ec-bd06-3ff638ff0c1d@suse.com>

> Thanks for the report. However, already on Andreas' report on the day before
> yesterday I was heavily inclined to ask about details you certainly have
> figured out already. I find it odd that you leave to us all re-figuring out.
> In this case, for example: Is the specific value you set %eax to relevant?
> (Probably not.) Is the specific value you set %rcx to relevant? (Probably
> not, but likely some part of it is.) Is the specific value you set %rdi to
> relevant? (Probably not, but likely some part of it is. Probably you
> setting it to 0 is also why the adjustment below is needed, and using a
> different value might permit avoiding that adjustment.) Is it relevant
> that you set EFLAGS.DF? (Quite likely.)
> 
> Any other investigation results you may have collected would likely also
> make our job easier.

I understand that. We did not actually dig that deep into the bug, so
there was not that much we could've shared to be honest. Also, we are
currently busy with a paper, so our main intention was to report the
bugs as quickly as possible and get the paper done before the deadline :)
However, I'll remember it for the next time!

Fabian

