Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE21979F5
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 12:57:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIs3p-0002yI-DC; Mon, 30 Mar 2020 10:54:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QcrT=5P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jIs3o-0002yD-6k
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 10:54:28 +0000
X-Inumbo-ID: d3156d18-7274-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3156d18-7274-11ea-9e09-bc764e2007e4;
 Mon, 30 Mar 2020 10:54:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 89666AF4F;
 Mon, 30 Mar 2020 10:54:26 +0000 (UTC)
To: Paul Durrant <paul@xen.org>
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-4-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b94676ab-371b-bb69-0d07-dd38fe22ceba@suse.com>
Date: Mon, 30 Mar 2020 12:54:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327185012.1795-4-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 3/5] tools/misc: add xen-ctx to present
 domain context
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.03.2020 19:50, Paul Durrant wrote:
> This tools is analogous to 'xen-hvmctx' which presents HVM context.
> Subsequent patches will add 'dump' functions when new records are
> introduced.
> 
> Signed-off-by: Paul Durrant <paul@xen.org>
> ---
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Wei Liu <wl@xen.org>
> ---
>  .gitignore           |   1 +
>  tools/misc/Makefile  |   4 ++
>  tools/misc/xen-ctx.c | 144 +++++++++++++++++++++++++++++++++++++++++++

Is xen-ctx a good choice of a name, considering we already have not
only xen-hvmctx, but also xenctx? If the new functionality isn't a
good fit for either, perhaps its name would better reflect its
connection to save/restore records? xen-sr-dump looks pretty clumsy
to me, but still seems better than a name easily mixed up with
others.

Jan

