Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39012273220
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 20:43:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKQmW-0007UY-Ck; Mon, 21 Sep 2020 18:43:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JKs4=C6=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kKQmU-0007UP-Uw
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 18:43:18 +0000
X-Inumbo-ID: 24f2ca8f-77bf-4a23-9688-42ad274ad7c2
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24f2ca8f-77bf-4a23-9688-42ad274ad7c2;
 Mon, 21 Sep 2020 18:43:18 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1FC5D68B05; Mon, 21 Sep 2020 20:43:13 +0200 (CEST)
Date: Mon, 21 Sep 2020 20:43:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Minchan Kim <minchan@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nitin Gupta <ngupta@vflare.org>, x86@kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 1/6] zsmalloc: switch from alloc_vm_area to get_vm_area
Message-ID: <20200921184312.GA4415@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-2-hch@lst.de> <20200921174256.GA387368@google.com>
 <20200921181708.GA2067@lst.de> <20200921184229.GA422329@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921184229.GA422329@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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

On Mon, Sep 21, 2020 at 11:42:29AM -0700, Minchan Kim wrote:
> It seems zsmalloc is only customer the function so let's have the helper
> when we see another customer.
> 
> If we don't have objection, I'd like to ask to Andrew fold this up.

Fine with me.

