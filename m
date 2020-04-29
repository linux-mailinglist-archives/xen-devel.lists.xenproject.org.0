Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8353A1BE1F3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 17:04:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jToGK-0002wd-8L; Wed, 29 Apr 2020 15:04:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jToGI-0002wV-R8
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 15:04:34 +0000
X-Inumbo-ID: bc15c8b0-8a2a-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc15c8b0-8a2a-11ea-b9cf-bc764e2007e4;
 Wed, 29 Apr 2020 15:04:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5727DABD7;
 Wed, 29 Apr 2020 15:04:32 +0000 (UTC)
Subject: Re: [PATCH v2 3/5] tools/misc: add xen-domctx to present domain
 context
To: Paul Durrant <paul@xen.org>
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-4-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76e91373-1f7c-bd68-2800-83163fb22aa2@suse.com>
Date: Wed, 29 Apr 2020 17:04:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200407173847.1595-4-paul@xen.org>
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.04.2020 19:38, Paul Durrant wrote:
> +int main(int argc, char **argv)
> +{
> +    uint32_t domid;
> +    unsigned int entry;
> +    xc_interface *xch;
> +    int rc;
> +
> +    if ( argc != 2 || !argv[1] || (rc = atoi(argv[1])) < 0 )
> +    {
> +        fprintf(stderr, "usage: %s <domid>\n", argv[0]);
> +        exit(1);
> +    }

Perhaps also allow dumping just a single (vCPU or other) ID?

Jan

