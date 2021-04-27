Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4843436C904
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 18:02:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118677.224897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQ9k-0006xe-1A; Tue, 27 Apr 2021 16:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118677.224897; Tue, 27 Apr 2021 16:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQ9j-0006xH-UD; Tue, 27 Apr 2021 16:01:47 +0000
Received: by outflank-mailman (input) for mailman id 118677;
 Tue, 27 Apr 2021 16:01:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbQ9i-0006xB-9H
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 16:01:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f5fe67a-76a9-4a8a-b87e-d1c28f2c70d2;
 Tue, 27 Apr 2021 16:01:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF79BB121;
 Tue, 27 Apr 2021 16:01:44 +0000 (UTC)
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
X-Inumbo-ID: 3f5fe67a-76a9-4a8a-b87e-d1c28f2c70d2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619539304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IJ8Loc3sGRY6G1ZJNWwc8SlwNFUWiDjTKpsX39X5qbk=;
	b=ZSCLoVws+kW0pvBUwxw8QjtAi0GlOxHpAfGqtCmGdmMVHyw6WbJyApmWFgjeghwL6offr5
	jwEnShkyMOAKNzhve9KhvqwFsgKlYOv7iSgWbJKMV/6iiDS0UBNbFJeGLtR1FNfLdUkiZQ
	DcYhcjT9MVBhvk0CA/EBIokavu4EKLI=
Subject: Ping: [PATCH] docs: release-technician-checklist: update to leaf tree
 version pinning
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <adc2ba4f-81b9-9841-a53c-8c52278ae62a@suse.com>
Message-ID: <f60da828-ed27-abaf-0301-559cfe017201@suse.com>
Date: Tue, 27 Apr 2021 18:01:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <adc2ba4f-81b9-9841-a53c-8c52278ae62a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.04.2021 11:56, Jan Beulich wrote:
> Our releases look to flip-flop between keeping or discarding the date
> and title of the referenced qemu-trad commit. I think with the hash
> replaced by a tag, the commit's date and title would better also be
> purged.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I've been noticing this inconsistency repeatedly because I simply re-use
> version update patches for the stable trees - the context mismatch
> results in a such updated patch to then not apply, due to said flip-
> flopping. For 4.15 I'm inclined to drop the two offending lines perhaps
> while updating the version to 4.15.1-pre.

Ian (and others), any thoughts here either way?

Thanks, Jan

> --- a/docs/process/release-technician-checklist.txt
> +++ b/docs/process/release-technician-checklist.txt
> @@ -53,6 +53,7 @@
>  #   QEMU_UPSTREAM_REVISION,
>  #   QEMU_TRADITIONAL_REVISION
>  #   MINIOS_UPSTREAM_REVISION
> +#     (drop any references to the specific commits, e.g. date or title)
>  * change SUPPORT.md heading version number; -unstable or -rc tag
>  *     (empty in stable branches after .0 release).
>  * SUPPORT.md: insert correct version number in release-notes link
> 


