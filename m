Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF04D23BD53
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 17:40:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2z2z-0003jI-S0; Tue, 04 Aug 2020 15:40:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exko=BO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k2z2y-0003jD-F2
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 15:40:12 +0000
X-Inumbo-ID: ff6a0919-44a6-472d-8fd2-69a38907b509
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff6a0919-44a6-472d-8fd2-69a38907b509;
 Tue, 04 Aug 2020 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596555611;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=oQU5z3p7u0qO2HONNSAn7MeYJ5u5tE1n/orWWBGSqVU=;
 b=atDLpBiUYOsn8EA+FoXQ1qEE4422Wd4YnAfd7EYZRWT4v588ouJxcciW
 SneJAAQsLlxp6eRkxB1wW5RaCaG/Eo1WqBySe1aFnA7YwSR4mcgDt4eW5
 8wy1lT3CSTwubZ5LIAQehS+jGGo+G3OPNTtpQi4Qd3bYAxMMBtlZgMw2b s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WqSUKr43m+OwbMAfG/BV0p7AQBg783iTtV2hTgUZnQ6iAavQKGP6qwHIgNRfilR5Rp6dhMQhqV
 FACGJ9PgibiAKk4mpZYh7J1ze8NHc7w5kqVVVSZcLipjojkuo6YAeuxlU4/MTPXHLUSE0jat0k
 vmrRUkdYjcS6zalSr+Vhxt/JFx0Ymxk4YyDYX9jPCgegVL35xVuGqzhZJtFQfE6b34aLkSMNk2
 5/l0FwkkLJJSEyh9/XR0sDtpWfFrWn2Kox/xKmuJ3cDiBoa4aunTWYgnZzy541gLjPjW1PRmWR
 v+A=
X-SBRS: 3.7
X-MesageID: 23814667
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,434,1589256000"; d="scan'208";a="23814667"
Subject: Re: [PATCH] x86: comment update after "drop high compat r/o M2P table
 address range"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <f561f170-77ab-0108-d8bc-b897e4a8272f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <24bb58fa-9671-3ae1-8aad-47ab296c4a62@citrix.com>
Date: Tue, 4 Aug 2020 16:40:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f561f170-77ab-0108-d8bc-b897e4a8272f@suse.com>
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/08/2020 16:26, Jan Beulich wrote:
> Commit 5af040ef8b57 clearly should also have updated the comment, not
> just the #define-s.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

