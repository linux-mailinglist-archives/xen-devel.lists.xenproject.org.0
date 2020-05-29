Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B231D1E80E7
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:50:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegLK-0002C6-89; Fri, 29 May 2020 14:50:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ub4=7L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jegLI-0002Bg-D2
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:50:40 +0000
X-Inumbo-ID: c343080c-a1bb-11ea-81bc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c343080c-a1bb-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 14:50:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D3B7B00A;
 Fri, 29 May 2020 14:50:38 +0000 (UTC)
Subject: Re: [PATCH v2 2/7] xen: credit2: factor runqueue initialization in
 its own function.
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <159070133878.12060.13318432301910522647.stgit@Palanthas>
 <159070137084.12060.14661333224235870762.stgit@Palanthas>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b3de2398-0708-e274-2497-b30afc2e069c@suse.com>
Date: Fri, 29 May 2020 16:50:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <159070137084.12060.14661333224235870762.stgit@Palanthas>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.05.20 23:29, Dario Faggioli wrote:
> As it will be useful in later changes. While there, fix
> the doc-comment.
> 
> No functional change intended.
> 
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

