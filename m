Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37AE226D70
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 19:46:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxZrC-00008Q-EC; Mon, 20 Jul 2020 17:45:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jxZrA-00008K-Jx
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 17:45:40 +0000
X-Inumbo-ID: d2be73e9-cab0-11ea-84ad-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2be73e9-cab0-11ea-84ad-bc764e2007e4;
 Mon, 20 Jul 2020 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595267140;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=J/7Onn3GuDlUNA0Iy0qUui8mUX7sy04p5t+kCtGbrTE=;
 b=DxshoKnXMEfzd+NuZvkUU6iPAIdJxr9dSyg7xHMDcdHWdDaAJXPk1L1C
 zdQk9O7qQt5D6wQavETVugPtucJQ8RjaXZjX1HkocTIZE39rTyJtfm2pS
 hqFMbeVmc0nnHlW96rO8xPVjevp9lSVABGYDfLgDtKONsRJHUMYakhBcE M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2lqrqTiqghNNiw1IFkaWVeL/esvQ/II7RuDvyAHmDfGNrtHh7A7JQ+BfCB3m9QNOuMhRv+QWfJ
 m8XDUZHbs+Vm8ZtQLRnACBt/iOlfX5YPk9R5GozPYRN9r7IUwNYqpHvFnon38161Ph9Om7bOdd
 20/oYi3ePNUBFnn64rr/O+hK8VtFNSse+/FwPINdqO3R7JjHpDkik6U9gqppg041MX5bzxr2im
 Srx9iBhrI2yWaQX85+eiks1W0Xcl1JkBYz0fftRDe2cFJ161RdZuLIHwUpqHu4/fW6s2gsswBz
 nAc=
X-SBRS: 2.7
X-MesageID: 23109873
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,375,1589256000"; d="scan'208";a="23109873"
Subject: Re: [PATCH] SUPPORT.md: Spell correctly Experimental
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200720173635.1571-1-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4cc580c5-146f-6f83-bd91-a798763c261b@citrix.com>
Date: Mon, 20 Jul 2020 18:45:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720173635.1571-1-julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/07/2020 18:36, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Although I'd suggest the subject be changed rearranged to "Spell
Experimentally correctly".

~Andrew

