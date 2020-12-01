Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54922CA69F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 16:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42152.75794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk7IH-0007x9-Fa; Tue, 01 Dec 2020 15:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42152.75794; Tue, 01 Dec 2020 15:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk7IH-0007wj-BS; Tue, 01 Dec 2020 15:10:17 +0000
Received: by outflank-mailman (input) for mailman id 42152;
 Tue, 01 Dec 2020 15:10:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kk7IF-0007we-4a
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 15:10:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5042aadf-43e5-4008-84ee-a57859af9665;
 Tue, 01 Dec 2020 15:10:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54A4DAD8A;
 Tue,  1 Dec 2020 15:10:13 +0000 (UTC)
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
X-Inumbo-ID: 5042aadf-43e5-4008-84ee-a57859af9665
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606835413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xtF1gUkQIbLObrQLpiVl8dHZ92xK7khCutPfGFAjsR8=;
	b=PEdd8C82sXPSpASiI0bb8KY6rF8tY6mj6uvAdSCeUxqfL5KgR5Bkus5mUSzPUqcq2afmtR
	h7XZImaRylgNNrRwGw6d59g8VHUmu47zMivWKZdUr8YIznsYQ6H2vpUaZdpplcOmp+PdFq
	NIRVQ/b9BIaVDQAvM2njH8lQrOs44JA=
Subject: Re: [PATCH for-4.14] Fix spelling errors.
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <5f4935dbc0257e19b87b9461ea62e25328a6091e.1606833490.git.didi.debian@cknow.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <44d06209-65de-f959-fb93-90a924cbf055@suse.com>
Date: Tue, 1 Dec 2020 16:10:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5f4935dbc0257e19b87b9461ea62e25328a6091e.1606833490.git.didi.debian@cknow.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 15:42, Diederik de Haas wrote:
> Only spelling errors; no functional changes.
> 
> In docs/misc/dump-core-format.txt there are a few more instances of
> 'informations'. I'll leave that up to someone who can properly determine
> how those sentences should be constructed.
> 
> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> ---
> 
> I incorporated the remarks by Jan Beulich that were made for the patch
> targeted at the master branch. Other then that, they're the exact same 
> changes although for libxl_stream_read.c the path was updated to match 
> the stable-4.14 branch.

I'm afraid this isn't the kind of change we'd be backporting, unless
you have a very good justification for a respective request. The
widest of a scope of such a backport that I'd see remotely possible
is when just documentation would get touched.

Also, process-wise, there wouldn't normally be patches sent to the
list for the stable trees. Exceptions are when the backporting is
non-trivial, or when something needs fixing there that doesn't
exist anymore in newer code. In all other cases it would simply be
a request to backport a certain change, possibly directly embedded
in the original submission (e.g. by means of a Fixes: tag).

Jan

