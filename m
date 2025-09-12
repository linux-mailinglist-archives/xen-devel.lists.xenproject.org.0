Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB9B540AB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 04:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121287.1465692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwtrb-0005qS-2Y; Fri, 12 Sep 2025 02:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121287.1465692; Fri, 12 Sep 2025 02:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwtrb-0005np-01; Fri, 12 Sep 2025 02:50:15 +0000
Received: by outflank-mailman (input) for mailman id 1121287;
 Fri, 12 Sep 2025 02:50:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uwtrZ-0005nj-Nk
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 02:50:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwtrZ-006H9o-0o;
 Fri, 12 Sep 2025 02:50:13 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwtrZ-0055j0-0N;
 Fri, 12 Sep 2025 02:50:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=r3CAyZzIsfX0fntwAuWviWcep0O0mq7yxuSuY1bv1RY=; b=
	0jc0eVcvHHSIRp820vhiOVsrYNaj0TCSIGikL5G58Tjnhsf+AcbeZOm4oL84sQVCYAA1BDhbluyzv
	qYFqR3e1mk/ohK6TgnioSUKaXX8FMaLNWb0W0cnkVMkFbTqMqMJavYu5veYmsavOSVSIjAgKy/Nq+
	tniIDpdOgSXYLhwZA=;
From: dmukhin@xen.org
Date: Thu, 11 Sep 2025 19:50:11 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: Re: [PATCH v3 4/5] CI: Update x86 to use Debian Trixie
Message-ID: <aMOKY5Po0Hbu3Y1w@kraken>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
 <20250911231216.1886818-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911231216.1886818-5-andrew.cooper3@citrix.com>

On Fri, Sep 12, 2025 at 12:12:15AM +0100, Andrew Cooper wrote:
> With the exception of the custom IBT job, copy all Debian 12 jobs making
> Debian 13 versions, then trim the Debian 12 ranconfig jobs.
> 
> Update the test jobs using Debian 12 to use 13.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

