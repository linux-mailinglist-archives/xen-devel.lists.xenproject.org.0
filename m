Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DBC36F35D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 02:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120274.227483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcHUp-0006DU-4c; Fri, 30 Apr 2021 00:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120274.227483; Fri, 30 Apr 2021 00:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcHUp-0006D5-1Z; Fri, 30 Apr 2021 00:59:07 +0000
Received: by outflank-mailman (input) for mailman id 120274;
 Fri, 30 Apr 2021 00:59:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=963z=J3=vps.thesusis.net=psusi@srs-us1.protection.inumbo.net>)
 id 1lcHUn-0006D0-86
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 00:59:05 +0000
Received: from vps.thesusis.net (unknown [34.202.238.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce33088b-ec33-49b0-b83a-54855628fb60;
 Fri, 30 Apr 2021 00:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vps.thesusis.net (Postfix) with ESMTP id 849F72ECDB;
 Thu, 29 Apr 2021 20:59:04 -0400 (EDT)
Received: from vps.thesusis.net ([127.0.0.1])
 by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUoBqIdkD_Xa; Thu, 29 Apr 2021 20:59:04 -0400 (EDT)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 3F4522ECDA; Thu, 29 Apr 2021 20:59:04 -0400 (EDT)
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
X-Inumbo-ID: ce33088b-ec33-49b0-b83a-54855628fb60
References: <87o8dw52jc.fsf@vps.thesusis.net> <87fsz84zn1.fsf@vps.thesusis.net> <YIszOwADJ8jdBov8@google.com> <87o8dw8vyg.fsf@vps.thesusis.net> <YItQ72UkqyKuHEk4@google.com>
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: Xen Virtual Keyboard modalias breaking uevents
Date: Thu, 29 Apr 2021 20:57:38 -0400
In-reply-to: <YItQ72UkqyKuHEk4@google.com>
Message-ID: <87im448u5j.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain


Dmitry Torokhov writes:

> Userspace may or may not have access to sysfs (it does not have to be
> mounted)

How would userspace even enumerate the input devices and read their
modalias without sysfs?

