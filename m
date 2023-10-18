Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99897CEC6D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 01:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618825.962983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtGQS-00088a-JW; Wed, 18 Oct 2023 23:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618825.962983; Wed, 18 Oct 2023 23:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtGQS-00086c-Gn; Wed, 18 Oct 2023 23:58:08 +0000
Received: by outflank-mailman (input) for mailman id 618825;
 Wed, 18 Oct 2023 23:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UegX=GA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtGQQ-00086W-Pa
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 23:58:06 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ce595ec-6e12-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 01:58:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 20A7FB82485;
 Wed, 18 Oct 2023 23:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D10FC433C7;
 Wed, 18 Oct 2023 23:58:01 +0000 (UTC)
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
X-Inumbo-ID: 2ce595ec-6e12-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697673482;
	bh=3gBd7x7/9L2RjM9vWQvX1SYgPBDjXZLy5e/83gUOZrk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nr2HOQiCOuSPRLTrSVfJ/4wFvJOQLpPxyURaCn/ATHpPkHnvDdzZ8O034XwDvbPU2
	 x2ET/vBX+IxAMKgIhIg0UC3BE+T6KN7QtSndhnI+kAYU3yOGL+h+YnjiDIQvUT6+aA
	 7k4FcR6piPRAFcX5EWZkSge30S9YkUQuwyItJ8j/BakSH/mV3QE1orZfAF2bjdbs0O
	 qieL4a7qPKtlzsi2/EpNBlGUqVHCQ4vXz1JtVQn4WRiLPm7bhh/2SchE+MNso6q5gt
	 UtGv85UBTkUHTrKVZ0bxHrB4+7RjDf8Z+3Sy3QJTrsZQDCIo8mZeBqINiJ25W7xqlm
	 ImHVwT0Fp0iVA==
Date: Wed, 18 Oct 2023 16:57:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: SAF-x-safe rename
In-Reply-To: <alpine.DEB.2.22.394.2310161813010.965337@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2310181553380.965337@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2310041633080.2348112@ubuntu-linux-20-04-desktop> <9CF5DF50-B857-4B1D-A210-E6355492CC3B@arm.com> <75d160be-4a8c-48c7-a972-201d78f0bdf0@citrix.com> <50198a73-2f0c-4cf1-9173-86a8158b425b@citrix.com> <71abd99d-7ef9-09db-9c1e-6b1c55188a6b@suse.com>
 <alpine.DEB.2.22.394.2310161813010.965337@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Oct 2023, Stefano Stabellini wrote:
> Please everyone fill in your preference here in advance of tomorrow's
> MISRA C meeting so we can discuss the results live:
> https://cryptpad.fr/form/#/2/form/view/kwflzAkvxhxF5U5Kv9O6QiQ5LEuCmHZlJhnNda7jk2g/

The results are ready. The following people voted:

Jan, Roger, Julien, Bertrand, Stefano, Andrew, and two anonymous guests.

These are the full results:
https://cryptpad.fr/sheet/#/2/sheet/view/xH3R+TopTAsyixnHU32DEKd5IpEIS7ZvnpBacMI1HcQ/

Accounting the two anonymous votes, there is a majority of 5/8 votes in
favor of keeping SAF as is.

Not accounting the two anonymous votes, there is a tie between the
people favoring to keep SAF as is and the ones that would like to change
it. However, the winner of the election is still "keep as is" according
to Cryptpad's Schulze condorcet method.

In conclusion, especially considering that the anonymous votes are
likely valuable members of the community, the winner is to keep "SAF" as
is.

Cheers,

Stefano


PS
If you are curious, the second best is "FUSA" accounting anonymous
votes, and it is "SAFE" not accounting anonymous votes.

PPS
I manually created a copy of the form without the anonymous votes to
check what would happen if we took them out of the equation

