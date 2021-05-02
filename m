Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B773370B89
	for <lists+xen-devel@lfdr.de>; Sun,  2 May 2021 14:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121182.228953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldBK6-0004ZN-BP; Sun, 02 May 2021 12:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121182.228953; Sun, 02 May 2021 12:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldBK6-0004Yy-8P; Sun, 02 May 2021 12:35:46 +0000
Received: by outflank-mailman (input) for mailman id 121182;
 Sun, 02 May 2021 11:44:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mFLA=J5=nethence.com=pbraun@srs-us1.protection.inumbo.net>)
 id 1ldAWj-0008NQ-3q
 for xen-devel@lists.xenproject.org; Sun, 02 May 2021 11:44:45 +0000
Received: from xc.os3.su (unknown [62.210.110.7])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9469670-8036-4a43-bd18-5582919530e8;
 Sun, 02 May 2021 11:44:42 +0000 (UTC)
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
X-Inumbo-ID: f9469670-8036-4a43-bd18-5582919530e8
Subject: Re: Xen and Microservices.
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=nethence.com; s=sep2020;
	t=1619955886; bh=+uhelc9w5dL/b8f82bHKLBG2we8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=kDD6iFuJXxZJVtcJmj0L1SRBZs8EPNhdyaMCmUQv5cpqcFDBLFQT9tf+Hu96WlD5e
	 BtxRX5ydIgibhCSqLEnfauO6/ewaWmJv7QKizgTR9mcmpVJSf1ZbCUbDLTcQ8ihO3m
	 9LxPb4n2MHjyQZfMFP3MASQNc9bzrCvFhWaQ74yA=
To: Jason Long <hack3rcon@yahoo.com>, TMC <tmciolek@gmail.com>
Cc: Xen-users <xen-users@lists.xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <314217522.1538685.1619859473008.ref@mail.yahoo.com>
 <314217522.1538685.1619859473008@mail.yahoo.com>
 <CAA3FNtPpz=4dwymk3+YeB+ZCOYYo9TirFqdjrf+qgSL39mBWYw@mail.gmail.com>
 <795375038.1654154.1619945620880@mail.yahoo.com>
From: Pierre-Philipp Braun <pbraun@nethence.com>
Message-ID: <88f93c4d-5e77-20db-e907-65d2e0fc7d25@nethence.com>
Date: Sun, 2 May 2021 14:42:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <795375038.1654154.1619945620880@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/05/2021 11:53, Jason Long wrote:
> Thank you.
> How about Unikernel?

Unikernel is - in short - an attempt to even more isolate an application 
and its libraries (and bind them together in a single binary).  However 
it's pretty hard to setup and prepare, and therefore didn't gain massive 
adoption.

I don't know if a XEN Unikernel such as MirageOS or Rump would construct 
it can provide even better performance than OS-level virtualization, but 
I suppose it was part of the goal.

-- 
Pierre-Philipp Braun
SMTP Health Campaign: enforce STARTTLS and verify MX certificates
<https://nethence.com/smtp/>

