Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09215A9BB8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 17:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396776.637078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTmA6-0004ZY-1N; Thu, 01 Sep 2022 15:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396776.637078; Thu, 01 Sep 2022 15:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTmA5-0004Wb-Ud; Thu, 01 Sep 2022 15:31:21 +0000
Received: by outflank-mailman (input) for mailman id 396776;
 Thu, 01 Sep 2022 15:31:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5F1A=ZE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oTmA5-0004WT-32
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 15:31:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fefb375-2a0b-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 17:31:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C39F61E88;
 Thu,  1 Sep 2022 15:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87365C4314C;
 Thu,  1 Sep 2022 15:31:16 +0000 (UTC)
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
X-Inumbo-ID: 1fefb375-2a0b-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662046277;
	bh=BpStsapj3/z8E8t4ssp7E5IEy9ihL4Ye7GsJheQPVSk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aTPBD0w6gH1K8/6Lqws5TOOzwS5Xtezxpl0NrRLxhYUbC43/QOjlLN7DhbVhxIHmk
	 nvMkhX7K15MEBJFC6OS8T5kfqRmXUh8USpG62xBN1ltv3JSlp6pUFMrqVGSiOBGceH
	 rxp5MUe1BnbGgir86cWvGSX1dLBW+eJOtlAryfoXQgPl9qmSiTn0gZIVAfwkVsZxXy
	 fNZZKINhjwVI7BdxaXWS755ei0mk9LU70O5/ksVAcM2Zdta19CjTD1eMd9xMYoQng5
	 MwwkEfQu/VPuSmMnJwJ+z1XURjP9alHZQoDXe2YrHasRNos56+Sj8Uq2vBxg7bWfFk
	 u191J9L9XGEoA==
Date: Thu, 1 Sep 2022 08:31:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: xen-devel <xen-devel@lists.xenproject.org>, 
    Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: Push 4.17 Feature freeze and Code freeze one week later
In-Reply-To: <2745BA23-B42E-49E2-89A2-59A0ED70388F@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209010823170.2375071@ubuntu-linux-20-04-desktop>
References: <2745BA23-B42E-49E2-89A2-59A0ED70388F@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Sep 2022, Bertrand Marquis wrote:
> Hi,
> 
> Seeing that we have lots of series quite advanced in review but not already merged, could we push
> both Feature freeze and Code freeze deadline one week later to have a chance to finish those ?

+1

On the ARM side we have a higher-than-usual number of patch series still
to commit. This is different from past times when people rushed at the
last week many patch series, completely new and unreviewed. These series
went through the review process properly, they are in good condition,
and are typically at v4 or above. They only miss one last round of
review.

I think we should give them a chance to finish, so it would be great to
have 1 more week.

