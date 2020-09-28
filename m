Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A01A27ADEC
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:35:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsMh-0008Gz-Rn; Mon, 28 Sep 2020 12:34:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMsMg-0008Gs-0Q
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:34:46 +0000
X-Inumbo-ID: 8ba55626-d696-4719-a3f2-dd283e72bf5e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ba55626-d696-4719-a3f2-dd283e72bf5e;
 Mon, 28 Sep 2020 12:34:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601296483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjJ0BZkvfqKTCUW/J2CYoR8/2vUMq64/YtBn+tCp1aw=;
 b=Q6obvP7hpti4MlgcwsL95tH1ozfZatMq0K9S9W7qNZPq4sHFfcXU7staYCeKyDc5GmNQ9h
 hzHOwGjHJ58msyZQjZOi3qoaH+nXjEHjq3lEwpBhnOwG7C0+ofW6r38ilbgYxTxDJvBFoM
 GgU/Q5nwhkUuCHOHka7ml090JSQHOZc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A273AC8C;
 Mon, 28 Sep 2020 12:34:43 +0000 (UTC)
Subject: Re: [PATCH v2 0/6] x86: some assembler macro rework
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
Message-ID: <7544a633-c753-c114-9d15-74b33ae5c2f9@suse.com>
Date: Mon, 28 Sep 2020 14:34:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 28.09.2020 14:28, Jan Beulich wrote:
> Parts of this were discussed in the context of Andrew's CET-SS work.
> Further parts simply fit the underlying picture. And the two final
> patches get attached here simply because of their dependency: Patch
> 4 was sent standalone already as v2, and is unchanged from that,
> while patch 6 is new.

And I should perhaps clarify: I'm resending the initial part of this
mainly to revive the discussion. There was some file name disagreement,
which is why I didn't commit at least the 2st patch here so far. But
there were no alternative suggestions that I would consider acceptable,
and hence I've kept the name as is.

Jan

