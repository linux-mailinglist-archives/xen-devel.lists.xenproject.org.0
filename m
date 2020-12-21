Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924292DFF3E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 19:07:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57494.100621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPao-00082s-17; Mon, 21 Dec 2020 18:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57494.100621; Mon, 21 Dec 2020 18:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPan-00082R-Sk; Mon, 21 Dec 2020 18:07:33 +0000
Received: by outflank-mailman (input) for mailman id 57494;
 Mon, 21 Dec 2020 18:07:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm/H=FZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krPam-00082J-AG
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 18:07:32 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 219997be-40ac-4907-8b8d-8a8014213c1c;
 Mon, 21 Dec 2020 18:07:31 +0000 (UTC)
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
X-Inumbo-ID: 219997be-40ac-4907-8b8d-8a8014213c1c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608574051;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=AdwUPMnj/e3nA+91jI02AbJYdiKEiZTbTnIiKy/Su0Q=;
  b=YgK9KCDXPAQf1flgttlBzXpCm8UxWFp40gpgbsgnFjDQce41dTrOf9zn
   dq5p2BmXe68BAqwE4fVhYMGRSH7097xJULhAC7OkGpDzPtFd9/Jv/dTZ1
   kRBTO0nrCxnXtVSTRxIq0dC9ykHzXmlovhJOdh4SjKx0BmAm9rIbFggjG
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bQaMCCJWUGBP1lf3qz7tulf92hpjyV554XsL9hSh5xqB7mUUYb5iBJZJ1KHgcPZbh1eG8jiZ+7
 8Lm6jwazseaufVYUIHI4SWfiv1u/mzqYqRLRaY5alo3Z7ckPP7NqDeLpkasW5W5T4z9/+++ZKl
 UI9SgPWZtBPsJ8hSX1BOAV/kO/K67qxpyUKeU+wdfzh1UQtIescEwG6SgTe+OE8GtwDVJyIvpw
 ARDsclprVy/NSoyg6VHjpjOeZnurysOMZyqsiV3jujsfj7SIupSTIMs+0mPhaQQh5NR7DkPz/w
 l7I=
X-SBRS: 5.2
X-MesageID: 33706800
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,436,1599537600"; 
   d="scan'208";a="33706800"
Subject: Re: [PATCH] lib: drop debug_build()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <143333c9-154b-77c3-a66a-6b81696ecded@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2575d75a-ce1d-c725-4f37-b7c9c10a2ecd@citrix.com>
Date: Mon, 21 Dec 2020 18:07:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <143333c9-154b-77c3-a66a-6b81696ecded@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 21/12/2020 16:50, Jan Beulich wrote:
> Its expansion shouldn't be tied to NDEBUG - down the road we may want to
> allow enabling assertions independently of CONFIG_DEBUG.

I'm not sure I agree that we'll ever want to do this, but...

>  Replace the few uses by IS_ENABLED(CONFIG_DEBUG).

... we should be aligning on CONFIG_DEBUG.

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wonder whether we shouldn't further abstract this into, say, a
> xen_build_info() helper, seeing that all use sites want "debug=[yn]".
> This could then also include gcov_string right away.

I think that would be a nicer way of doing it.  It should probably also
have some trace of CONFIG_UBSAN in the resulting string.

~Andrew

