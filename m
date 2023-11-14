Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9C07EB8B0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 22:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633277.987953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r312s-000522-Ov; Tue, 14 Nov 2023 21:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633277.987953; Tue, 14 Nov 2023 21:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r312s-0004zg-MA; Tue, 14 Nov 2023 21:34:06 +0000
Received: by outflank-mailman (input) for mailman id 633277;
 Tue, 14 Nov 2023 21:34:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r312r-0004zY-9U
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 21:34:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r312q-00089b-Jh; Tue, 14 Nov 2023 21:34:04 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r312q-0005vP-E4; Tue, 14 Nov 2023 21:34:04 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=LnVbhYD540u7kXOhAkSWfLH7HruSCzPsmjyU1AVMYTY=; b=vjXGHVnSq8BClpvpAO62l5frGW
	6qGbQTmEFfNdORcAjAB8iekOoxR+WgA8/4q4n9PauSv7ZDcE/6GOAm3Qc7SzkBKwJuPSpt6U3m7ab
	EEl3/Ome85UKwbTUejekEWdbqL9/v23WZdACR3h7qx4w0MOeI5Jhg6mZDd7Zzys4Cvxg=;
Message-ID: <6d8dd0d8-8a8e-4bf8-b0a6-6af5169763b3@xen.org>
Date: Tue, 14 Nov 2023 21:34:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] tools/xenstored: remove the "-R" command line option
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231113124309.10862-1-jgross@suse.com>
 <20231113124309.10862-6-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231113124309.10862-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 13/11/2023 12:43, Juergen Gross wrote:
> The "-R" (no recovery) command line option enables to omit fixing the
> node store in case of detected inconsistencies.
> 
> This might have been of interest in the past, when the node data base
> was kept in a file, but now the usability of this option is zero.
> 
> Remove the "-R" option.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

