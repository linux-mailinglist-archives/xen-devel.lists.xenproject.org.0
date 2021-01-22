Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B40300898
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 17:26:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72953.131517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zGa-0000sl-Iq; Fri, 22 Jan 2021 16:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72953.131517; Fri, 22 Jan 2021 16:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zGa-0000sM-Fh; Fri, 22 Jan 2021 16:26:32 +0000
Received: by outflank-mailman (input) for mailman id 72953;
 Fri, 22 Jan 2021 16:26:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2zGZ-0000sG-AN
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 16:26:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2zGZ-0003St-8i
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 16:26:31 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2zGZ-0002Mj-81
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 16:26:31 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2zGU-0004HU-Cf; Fri, 22 Jan 2021 16:26:26 +0000
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
	bh=rA8ui5/4WM/pfLHCo2xGs5wtn4p7nhDIQ/P82PqsM0w=; b=tdTAiEURlU6SIBm4GMfUbNLw+9
	UlAGRlR6OLjR/pu18RG1OlN52FEJkXQTx+ibM4IkLtFXyc/0jBzdyhPJTnCadREyWT+crr74IwVrg
	/1lQiWmw8DNwGcvxXeZ7UIzqerV8hnG/AlAwLSzIZAyAOhwegOqowwpcp2d9jnBdm9QY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24586.64690.177873.712218@mariner.uk.xensource.com>
Date: Fri, 22 Jan 2021 16:26:26 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    xen-devel@lists.xenproject.org,
    Edwin =?iso-8859-1?Q?T=F6r=F6k?=  <edvin.torok@citrix.com>,
    Christian Lindig <christian.lindig@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored
In-Reply-To: <3c119c18-b020-bfb3-3a13-dd39f4c37241@suse.com>
References: <20210122155603.23402-1-iwj@xenproject.org>
	<20210122155603.23402-7-iwj@xenproject.org>
	<0361ffd5-a640-ac59-c222-4a2d5a9a4727@citrix.com>
	<24586.64456.905401.474099@mariner.uk.xensource.com>
	<3c119c18-b020-bfb3-3a13-dd39f4c37241@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jürgen Groß writes ("Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored"):
> There is only stub C xenstored in our build.

I should have looked myself, shouldn't I:

-rw-r--r-- 1 osstest osstest  233391 Jan 21 22:14 xenstorepvh-stubdom.gz
-rw-r--r-- 1 osstest osstest  232653 Jan 21 22:14 xenstore-stubdom.gz
 
Oh so many options!

Ian.

