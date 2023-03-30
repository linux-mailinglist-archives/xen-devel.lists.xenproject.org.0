Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6826D081B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 16:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516754.801389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phtBW-0001kR-0G; Thu, 30 Mar 2023 14:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516754.801389; Thu, 30 Mar 2023 14:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phtBV-0001hP-TC; Thu, 30 Mar 2023 14:23:25 +0000
Received: by outflank-mailman (input) for mailman id 516754;
 Thu, 30 Mar 2023 14:23:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wurm=7W=bounce.vates.fr=bounce-md_30504962.64259b58.v1-7038c390049c4f2fa21330f42d38cb72@srs-se1.protection.inumbo.net>)
 id 1phtBU-0001h1-HB
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 14:23:24 +0000
Received: from mail180-17.suw31.mandrillapp.com
 (mail180-17.suw31.mandrillapp.com [198.2.180.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bf7a4a0-cf06-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 16:23:22 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-17.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4PnQd42RGLzRKM5Zf
 for <xen-devel@lists.xenproject.org>; Thu, 30 Mar 2023 14:23:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7038c390049c4f2fa21330f42d38cb72; Thu, 30 Mar 2023 14:23:20 +0000
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
X-Inumbo-ID: 6bf7a4a0-cf06-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1680186200; x=1680243800; i=charles.schulz@vates.fr;
	bh=v03fKeJ1Dtzq5D3mOSYPhf696AKYLmjzEpsJ4srESXY=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=KNB8kLnDhW2MvPnVTZmIKvfwAgmqcDOtN2wvqOFrAT2p+8oIb5uAicUINhAeMXpbl
	 hV/ikwRrCtdqb8NQ3XVmfuDDIPA/BG+/V3cPSyIbsqt4pYEOcp92Zo/9202PT+VSZ7
	 YF9lh0BuNpDwOTwd5uGod8sDF/T14t1gueR8XtXg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1680186200; h=From : 
 Subject : To : Cc : Message-Id : Date : MIME-Version : Content-Type : 
 Content-Transfer-Encoding : From : Subject : Date : X-Mandrill-User : 
 List-Unsubscribe; bh=v03fKeJ1Dtzq5D3mOSYPhf696AKYLmjzEpsJ4srESXY=; 
 b=fVdSzXiK0p3IHqvcLGl73IWn9a0ejZYuHFMR/1YTyrNT+47gEs0ZhqH1OfYOWBGNUTHFHL
 zJUwdgNwOrgo0Uqz1AQSzxij7ZJbB32zviw3cw2lncEP5OxEhpqGOYJOoWZqkqa3Ggcd4kg4
 MG6jvb69RyrBRSnmhcrIyGOPY6LYI=
From: "Charles-H. Schulz" <charles.schulz@vates.fr>
Subject: Improving website content and an introduction
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4924235f-784d-43da-a6b3-ae27d44c951c
X-Bm-Transport-Timestamp: 1680186199186
To: advisory-board@lists.xenproject.org
Cc: xen-devel@lists.xenproject.org
Message-Id: <874jq2tj1l.fsf@vates.fr>
X-Native-Encoded: 0
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.7038c390049c4f2fa21330f42d38cb72
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230330:md
Date: Thu, 30 Mar 2023 14:23:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello everyone,

I've recently joined the Xen Project and I'm working at Vates on strategy and
innovation. I will also be formally representing the company at the Advisory
Board. First: I'm very excited to join and do what I can to help Xen, it's an
amazing project!

Second, and on to more concrete things: I'd like to work on improve our
website, both on the content - in fact both the website and the wiki could be
improved- and on the style and looks.

If anyone would like to help and join me in this task I'll be happy to share
the work and the creative side of things as well :)

Please let me know off or on list if you're interested.

All the best,


-- 
Charles-H. Schulz
Chief Strategy Officer - CSO
XCP-ng & Xen Orchestra - Vates solutions


Charles Schulz | Vates Chief Strategy Officer
Mobile: +33 698 655 424
XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

