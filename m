Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CF940AC35
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 13:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186441.335169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ6Ie-00011v-0F; Tue, 14 Sep 2021 11:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186441.335169; Tue, 14 Sep 2021 11:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ6Id-0000zV-TZ; Tue, 14 Sep 2021 11:08:27 +0000
Received: by outflank-mailman (input) for mailman id 186441;
 Tue, 14 Sep 2021 11:08:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mQ6Id-0000zP-8s
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 11:08:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mQ6Id-0003l8-6V
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 11:08:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mQ6Id-0005eB-3x
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 11:08:27 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mQ6IZ-0005Qw-66; Tue, 14 Sep 2021 12:08:23 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=afkqex+7zKLHh6fQx5wK/YDyb189/2Rwt4TBVhKWsqg=; b=Ennu79YusTvQErUjSQwHzwLExG
	mQ1T9zNdrN9hovo+cznyD3GLaWMyN+La0VMmS6iwOcHsNOKMxKBvy35Wv9w4DKR6hmno7zpttgIw7
	Cr40keGaRaF45aotat78WzwuLpjdX9hzgoOn/e+8LUxhRYur9Qx4XTuuH/CgN+gcActQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24896.33446.713051.453627@mariner.uk.xensource.com>
Date: Tue, 14 Sep 2021 12:08:22 +0100
To: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/1] tools/xl: Fix regular expression for autobaloon mode detection based on xen command line.
In-Reply-To: <9dc667d2017e6e69877a2b9859041c1f7d965899.1631555561.git.isaikin-dmitry@yandex.ru>
References: <cover.1631555561.git.isaikin-dmitry@yandex.ru>
	<9dc667d2017e6e69877a2b9859041c1f7d965899.1631555561.git.isaikin-dmitry@yandex.ru>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Dmitry Isaikin writes ("[PATCH 1/1] tools/xl: Fix regular expression for autobaloon mode detection based on xen command line."):
> The case of specifying a negative size was handled incorrectly.

Thank you.  The change looks good to me.  Did you test that after your
change, the functionality works ?

Ian.

