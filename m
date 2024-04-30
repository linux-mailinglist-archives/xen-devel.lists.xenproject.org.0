Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D758B6C87
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 10:12:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714606.1115866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1iaY-0003hR-QF; Tue, 30 Apr 2024 08:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714606.1115866; Tue, 30 Apr 2024 08:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1iaY-0003ez-N9; Tue, 30 Apr 2024 08:11:46 +0000
Received: by outflank-mailman (input) for mailman id 714606;
 Tue, 30 Apr 2024 08:11:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/4O=MD=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1s1iaX-0003er-J3
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 08:11:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46d24626-06c9-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 10:11:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 029D3CE0EF0;
 Tue, 30 Apr 2024 08:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86651C2BBFC;
 Tue, 30 Apr 2024 08:11:36 +0000 (UTC)
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
X-Inumbo-ID: 46d24626-06c9-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714464697;
	bh=Okuepw31SRehXeoqshjfC4InPzrJlMsj8crjxsmEs+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ny2YddjIXd62EgONouXUw4MIpgq1mcR4Ny2Gcwe6ACTc+CdV0UXIy/YQCIIYl47Vc
	 UkQZoe0UGviKS6I/fiNMlR9e+zWbI6Va9a+ig1QuIAQgsZzcpNQGGCsroAtZYZ7Spv
	 zoWTvbkxlPFJxh4l9BIbK80yv3YxIwAHjrS4aFH8=
Date: Tue, 30 Apr 2024 10:11:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Xen.org security team" <security@xen.org>
Subject: Re: CVE-2024-26908: x86/xen: Add some null pointer checking to smp.c
Message-ID: <2024043015-pauper-aching-a3d4@gregkh>
References: <2024041747-CVE-2024-26908-4690@gregkh>
 <f73bb0fe-9ba6-46de-8732-bd372438068e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f73bb0fe-9ba6-46de-8732-bd372438068e@suse.com>

On Mon, Apr 29, 2024 at 01:53:44PM +0200, Juergen Gross wrote:
> Hi,
> 
> I'd like to dispute CVE-2024-26908: the issue fixed by upstream commit
> 3693bb4465e6e32a204a5b86d3ec7e6b9f7e67c2 can in no way be triggered by
> an unprivileged user or by a remote attack of the system, as it requires
> hotplug of (virtual) cpus to the running system. This can be done only by
> either a host admin or by an admin of the guest which might suffer the
> out-of-memory situation.
> 
> Please revoke this CVE.

Sorry for the delay, thanks for looking into this and letting us know.
It's now rejected.

greg k-h

