Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 485882A050F
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 13:11:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15764.38899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYTFa-0004V2-EV; Fri, 30 Oct 2020 12:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15764.38899; Fri, 30 Oct 2020 12:11:22 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYTFa-0004Ud-BA; Fri, 30 Oct 2020 12:11:22 +0000
Received: by outflank-mailman (input) for mailman id 15764;
 Fri, 30 Oct 2020 12:11:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYTFZ-0004UY-6P
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:11:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03f43499-f522-4ef7-9a0a-3f0e2c9e7cb3;
 Fri, 30 Oct 2020 12:11:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37D43AAB2;
 Fri, 30 Oct 2020 12:11:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYTFZ-0004UY-6P
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:11:21 +0000
X-Inumbo-ID: 03f43499-f522-4ef7-9a0a-3f0e2c9e7cb3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 03f43499-f522-4ef7-9a0a-3f0e2c9e7cb3;
	Fri, 30 Oct 2020 12:11:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604059879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vo7f5wZB1XrJCx2b+xFImObTT4SECdsEuIeC/WuWGxg=;
	b=jYSgHg9XaQ0Y5yfGAot4kVSuVdaEqvetdCNILzUbr0K31jYiDqrvpogw+hzRxoCigRToL0
	A+AZNLUJUf+uMjSK7zBPrHe87FZ44BGt5BtbDPe1SBEQzXjHonScJl26bM/JAROsPXnJcr
	CpEZfVX9QaFfUKzZKZusPMouTUXxIuQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 37D43AAB2;
	Fri, 30 Oct 2020 12:11:19 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] xen/common/makefile: remove gzip timestamp
To: =?UTF-8?Q?Fr=c3=a9d=c3=a9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1603725003.git.frederic.pierret@qubes-os.org>
 <29b0632e30aba9bc2e071f572fb1067108bcae8c.1603725003.git.frederic.pierret@qubes-os.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a9608920-981f-cfdb-f6c6-fca7e9b68be6@suse.com>
Date: Fri, 30 Oct 2020 13:11:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <29b0632e30aba9bc2e071f572fb1067108bcae8c.1603725003.git.frederic.pierret@qubes-os.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.10.2020 13:03, Frédéric Pierret (fepitre) wrote:
> This is for improving reproducible builds.
> 
> Signed-off-by: Frédéric Pierret (fepitre) <frederic.pierret@qubes-os.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit I'd like to ask for the title to actually mention whose
gzip time stamp it is that gets squashed. Perhaps "xen: don't
have timestamp inserted in config.gz"?

Jan

