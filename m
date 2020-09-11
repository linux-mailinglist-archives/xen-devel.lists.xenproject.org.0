Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E76026650A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 18:51:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGmFj-0006Nb-0i; Fri, 11 Sep 2020 16:50:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMuY=CU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kGmFi-0006NW-AU
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 16:50:22 +0000
X-Inumbo-ID: 731f8013-6ae9-466e-b2a0-05fc6de0cdde
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 731f8013-6ae9-466e-b2a0-05fc6de0cdde;
 Fri, 11 Sep 2020 16:50:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFF2F221E7;
 Fri, 11 Sep 2020 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599843020;
 bh=DifogSnIZjeIczc1+hxPQKvR1SICoKxxzhxWwjiQeuw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Y24z0DNaBl7fKHd60tX+sXLEN1KfIoIRWLlvf6YY5CTpxKA5wS5PfpFtNGq9pojO5
 c5kSYNRoJs4i6whzPJlrYxU6q1ZUErH/9RGL0WE3GPNYCX6XXq59fXrzAaLuQ+TQgl
 0mZiGyxhyXEJTeYk9bi3ufBRCVeDbNDsIAz18VoY=
Date: Fri, 11 Sep 2020 09:50:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: George Dunlap <george.dunlap@citrix.com>
cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@citrix.com>, 
 Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul@xenproject.org>
Subject: Re: [PATCH 0/8] Finding a home for the Code of Conduct
In-Reply-To: <20200911124009.3760032-1-george.dunlap@citrix.com>
Message-ID: <alpine.DEB.2.21.2009110946560.28991@sstabellini-ThinkPad-T480s>
References: <20200911124009.3760032-1-george.dunlap@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 11 Sep 2020, George Dunlap wrote:
> The Code of Conduct has been approved [1]; now we need to find it a
> home.  Since we've started using sphinx for the hypervisor documents,
> I propose doing the same for the project-wide governance documents, starting
> with the Code of Conduct.
> 
> This series takes Lars' code of conduct tree, written as individual MD
> files, and puts them into the sphinx documentation system.  After this
> series, if you run "make html" in the top-level directory, you'll get
> the generated sphinx documentation in the build/ directory.
> 
> The finalized Code of Conduct documentation can be found at:
> 
> https://xenbits.xen.org/git-http/people/gdunlap/governance.git
> 
> This series can be found on the branch out/move-to-sphinx/v1
> 
> And a rendered version of the governance can be found here:
> 
> https://xenbits.xenproject.org/people/gdunlap/governance/
> 
> If there are no objections to this setup, I propose the following URL
> as a long-term home:
> 
> https://xenbits.xenproject.org/governance
> 
> And also moving both the main governance doc [2] and the security
> policy [3] into that system, to make it easier to update.
> 
> Thoughts?

Sounds great.

I'd suggest to also move the governance.git repository to a more
"official" location on xenbits.

