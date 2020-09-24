Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A54277212
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 15:24:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLRDj-0006HN-3W; Thu, 24 Sep 2020 13:23:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pxis=DB=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kLRDh-0006HI-J3
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 13:23:33 +0000
X-Inumbo-ID: efb4c570-fad1-4f6b-aee4-b21fea2422fe
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efb4c570-fad1-4f6b-aee4-b21fea2422fe;
 Thu, 24 Sep 2020 13:23:32 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 110DA68AFE; Thu, 24 Sep 2020 15:23:29 +0200 (CEST)
Date: Thu, 24 Sep 2020 15:23:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Nitin Gupta <ngupta@vflare.org>
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915: use vmap in i915_gem_object_map
Message-ID: <20200924132328.GA3698@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-5-hch@lst.de>
 <9b5d40af-7378-9e68-ca51-73b2148287f3@linux.intel.com>
 <20200923134117.GB9893@lst.de>
 <1a421e7f-6255-c534-5403-715c2e809bd0@linux.intel.com>
 <20200923144455.GA15036@lst.de>
 <17f81582-f087-aeac-c06a-4cd1a5457fbb@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17f81582-f087-aeac-c06a-4cd1a5457fbb@linux.intel.com>
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

On Thu, Sep 24, 2020 at 01:22:35PM +0100, Tvrtko Ursulin wrote:
> CI says series looks good from the i915 perspective (*).
>
> I don't know how will you handle it logistically, but when you have final 
> version I am happy to re-read and r-b the i915 patches.

I'll resend the series later today, and will make sure you are on the
Cc list.

