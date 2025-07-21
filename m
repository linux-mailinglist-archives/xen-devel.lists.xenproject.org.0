Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7826DB0C060
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051279.1419594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmtZ-0005K5-E4; Mon, 21 Jul 2025 09:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051279.1419594; Mon, 21 Jul 2025 09:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmtZ-0005HA-Ag; Mon, 21 Jul 2025 09:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1051279;
 Mon, 21 Jul 2025 09:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1oiY=2C=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1udmtX-0005Ge-Mz
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:33:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b9d60464-6615-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 11:33:15 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6847B153B;
 Mon, 21 Jul 2025 02:33:08 -0700 (PDT)
Received: from PWQ0QT7DJ1 (unknown [10.57.71.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F002B3F59E;
 Mon, 21 Jul 2025 02:33:12 -0700 (PDT)
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
X-Inumbo-ID: b9d60464-6615-11f0-a31d-13f23c93f187
Date: Mon, 21 Jul 2025 10:33:10 +0100
From: Hari Limaye <hari.limaye@arm.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH] xen/arm: remove unused dump_p2m_lookup()
Message-ID: <gak52bi6pnhn6fsav744hqrhvezqrjywqewksmlqzqdcnh5jjj@l5dy6fo4pmef>
References: <20250718101535.3109001-1-grygorii_strashko@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718101535.3109001-1-grygorii_strashko@epam.com>

Hi Grygorii,

> On Fri, Jul 18, 2025 at 10:15:36AM +0000, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The dump_p2m_lookup() is not used, so remove it.

NIT: I think this would read better as 'The function dump_p2m_lookup()...'

Otherwise LGTM!

Reviewed-by: Hari Limaye <hari.limaye@arm.com>

Cheers,
Hari

