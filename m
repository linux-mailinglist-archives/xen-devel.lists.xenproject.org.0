Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB5C294ED9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 16:36:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10090.26606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVFCg-0005Bf-24; Wed, 21 Oct 2020 14:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10090.26606; Wed, 21 Oct 2020 14:35:02 +0000
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
	id 1kVFCf-0005BG-V4; Wed, 21 Oct 2020 14:35:01 +0000
Received: by outflank-mailman (input) for mailman id 10090;
 Wed, 21 Oct 2020 14:35:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4T7O=D4=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1kVFCe-0005BB-2e
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 14:35:00 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19e33695-2708-4a2e-9155-ef2f118f7f74;
 Wed, 21 Oct 2020 14:34:59 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kVFCa-0007fA-Ke; Wed, 21 Oct 2020 14:34:56 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kVFCa-0002uy-7u; Wed, 21 Oct 2020 14:34:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4T7O=D4=xen.org=hx242@srs-us1.protection.inumbo.net>)
	id 1kVFCe-0005BB-2e
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 14:35:00 +0000
X-Inumbo-ID: 19e33695-2708-4a2e-9155-ef2f118f7f74
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 19e33695-2708-4a2e-9155-ef2f118f7f74;
	Wed, 21 Oct 2020 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:Date:To
	:From:Subject:Message-ID; bh=j3wf0tZlxmJNJZixJiYCQiUTDKdeJMxtQfWtZ7TexiQ=; b=
	EHTl5PBIk2XlUUAUFp6EYcbTnq2AgQSMvJdqqUe19ybLwBqGAC1kbDfYBsK8D3gMfBtqpRtcJtM0B
	otrNL8VGgP1VTodIHZrZIYhRAwBwBgK5gQNlxq5Agm/Vc915My0U+GwvCbZm3QPLXRSnlKNwTyshO
	zSKNjuYV8Lmex+tNE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <hx242@xen.org>)
	id 1kVFCa-0007fA-Ke; Wed, 21 Oct 2020 14:34:56 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=u1bbd043a57dd5a.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <hx242@xen.org>)
	id 1kVFCa-0002uy-7u; Wed, 21 Oct 2020 14:34:56 +0000
Message-ID: <bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org>
Subject: XSM and the idle domain
From: Hongyan Xia <hx242@xen.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	jbeulich@suse.com, andrew.cooper3@citrix.com, jandryuk@gmail.com, 
	dgdegra@tycho.nsa.gov
Date: Wed, 21 Oct 2020 15:34:52 +0100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi,

A while ago there was a quick chat on IRC about how XSM interacts with
the idle domain. The conversation did not reach any clear conclusions
so it might be a good idea to summarise the questions in an email.

Basically there were two questions in that conversation:

1. In its current state, are security modules able to limit what the
idle domain can do?
2. Should security modules be able to restrict the idle domain?

The first question came up during ongoing work in LiveUpdate. After an
LU, the next Xen needs to restore all domains. To do that, some
hypercalls need to be issued from the idle domain context and
apparently XSM does not like it. We need to introduce hacks in the
dummy module to leave the idle domain alone. Our work is not compiled
with CONFIG_XSM at all, but with CONFIG_XSM, are we able to enforce
security policies against the idle domain? Of course, without any LU
work this does not make any difference because the idle domain does not
do any useful work to be restricted anyway.

Also, should idle domain be restricted? IMO the idle domain is Xen
itself which mostly bootstraps the system and performs limited work
when switched to, and is not something a user (either dom0 or domU)
directly interacts with. I doubt XSM was designed to include the idle
domain (although there is an ID allocated for it in the code), so I
would say just exclude idle in all security policy checks.

I may have missed some points in that discussion, so please feel free
to add.

Hongyan


