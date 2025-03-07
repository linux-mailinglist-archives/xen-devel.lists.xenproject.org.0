Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EEEA5659B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 11:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904868.1312677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqV6p-000106-M9; Fri, 07 Mar 2025 10:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904868.1312677; Fri, 07 Mar 2025 10:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqV6p-0000xy-Ih; Fri, 07 Mar 2025 10:39:15 +0000
Received: by outflank-mailman (input) for mailman id 904868;
 Fri, 07 Mar 2025 10:39:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1tqV6o-0000xs-5n
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 10:39:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tqV6b-006vsi-2H;
 Fri, 07 Mar 2025 10:39:01 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tqV6b-00CI90-0T;
 Fri, 07 Mar 2025 10:39:01 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=XTOmmQ2mK3eAeh54TywQk0UUL/JTx2q9dmNhnKy7zMQ=; b=1OtPf4htAZU3Rd4LYuqdGPd2jO
	NrsngLKHhI9MHj9pq5vgYo4rsqtytr3k+hQXsQ2qWPnJbTyWMq4s14VE7hJX0FeUkSN68H+3Q8Ba4
	gHUqZXy/o9Q/oklXinrpZaakMssFoJqkYaHHGkVJ7Z2HL/FWH5zi80opaoqdYaUawlbk=;
Date: Fri, 7 Mar 2025 11:38:58 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 2/2] hw/xen: Add "mode" parameter to xen-block devices
Message-ID: <Z8rMwkKVSgop_eNV@l14>
References: <20250207143724.30792-1-dwmw2@infradead.org>
 <20250207143724.30792-2-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207143724.30792-2-dwmw2@infradead.org>

On Fri, Feb 07, 2025 at 02:37:24PM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Block devices don't work in PV Grub (0.9x) if there is no mode specified. It
> complains: "Error ENOENT when reading the mode"
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

