Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5624A435FBF
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 12:54:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214317.372814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdVh1-0008Rg-LH; Thu, 21 Oct 2021 10:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214317.372814; Thu, 21 Oct 2021 10:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdVh1-0008Pt-Hb; Thu, 21 Oct 2021 10:53:03 +0000
Received: by outflank-mailman (input) for mailman id 214317;
 Thu, 21 Oct 2021 10:53:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdVgz-0008Pn-Dh
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 10:53:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdVgz-0006kU-Cl
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 10:53:01 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdVgz-00058V-Bx
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 10:53:01 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mdVgt-0006gy-To; Thu, 21 Oct 2021 11:52:55 +0100
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
	bh=chQm04WUmNUJCVLYeJBbFUJnNx5E3mZlW7cQra395ns=; b=18f68ryq6o5yWbvldJ79ZR1kYm
	51Ei7OYFTbDU9tBWqrdg4cXv1zDvpRRZrivzk4JqJ3Wp8UCH8ZBplH0LERF5AaolCrbn6Rm1dSNTa
	iIju3T/BhZI7WPRwevSvViBdVkOJyNf30pEjHfH7VJjuns4JRu4PHvhoyakKfoldKmas=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24945.18055.505918.627159@mariner.uk.xensource.com>
Date: Thu, 21 Oct 2021 11:52:55 +0100
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Julien Grall <julien@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Julien Grall <jgrall@amazon.com>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.16] tools/xenstored: Ignore domain we were unable to
 restore
In-Reply-To: <01870077-5FE4-45D8-9716-B81C0A705DC0@arm.com>
References: <20211020144519.10362-1-julien@xen.org>
	<01870077-5FE4-45D8-9716-B81C0A705DC0@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Thanks everyone, committed.

Ian.

