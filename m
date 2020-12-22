Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E052E08E2
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 11:39:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57736.101126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krf3z-0002EV-UE; Tue, 22 Dec 2020 10:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57736.101126; Tue, 22 Dec 2020 10:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krf3z-0002E6-Qy; Tue, 22 Dec 2020 10:38:43 +0000
Received: by outflank-mailman (input) for mailman id 57736;
 Tue, 22 Dec 2020 10:38:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=if9N=F2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krf3z-0002E1-2l
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 10:38:43 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0241bfa2-ba4b-4131-bc63-a3c2b8bf9f32;
 Tue, 22 Dec 2020 10:38:42 +0000 (UTC)
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
X-Inumbo-ID: 0241bfa2-ba4b-4131-bc63-a3c2b8bf9f32
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608633522;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=lUvWq22SDUDEmC+tSUDzoF0uyYMffSl6Ez2wwX28N9c=;
  b=SHfIE0ofEeh8LYqiEKBFoznUdqixk71W0WB3EjzHEJlCmYJl7uVTZJWZ
   WuK1v4jeIxKvYSxWH68/hJqPUmih3RsbXjKcYbB7+bUE7dLaRRIZm+S25
   QWE17GS1os6Dcmif97YTnWFkt2YJS26ZkB2zqA/orNicoZQ1nBPyTnpJD
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: v2cUk9vtpvzJJEZpURdEvyioznzAvjb8hAxEgS/ltZkN85r/RkWxDyUn3eD5bM7hNuto9l0pOe
 AhPBKpFy7eRyddhBACOo6UHsJM1Mv/29kngsBURPXmV7O2WGAf6pdGoC1NI+Yi63IDXpH6lA7l
 YswwSIw6ShVgPloLJl2hdHAkBVAhzT9Mm3oJI+7jV2yfWMtRQRqWFuxB6sWJic6OyKkiHwua+I
 vGWGJyuHkkriHEZRU9zFPdKBpnKHzYT3GCVQfQAOImqE2Du09T3Z0yCbawkBFWIvr8Rsyl2aLD
 VO0=
X-SBRS: 5.2
X-MesageID: 34092279
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,438,1599537600"; 
   d="scan'208";a="34092279"
Subject: Re: [XEN PATCH 2/3] docs: use predictable ordering in generated
 documentation
To: Maximilian Engelhardt <maxi@daemonizer.de>,
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <cover.1608319634.git.maxi@daemonizer.de>
 <31df2a1128c15bc1b4c738bf52e29c80982b4170.1608319634.git.maxi@daemonizer.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fcd6645b-d709-a600-05e2-dd1ba6d0fb7f@citrix.com>
Date: Tue, 22 Dec 2020 10:38:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <31df2a1128c15bc1b4c738bf52e29c80982b4170.1608319634.git.maxi@daemonizer.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 18/12/2020 20:42, Maximilian Engelhardt wrote:
> When the seq number is equal, sort by the title to get predictable
> output ordering. This is useful for reproducible builds.
>
> Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

