Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 996A41E5AE7
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 10:35:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeDzq-0007GC-H2; Thu, 28 May 2020 08:34:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lRPh=7K=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jeDzo-0007G7-Uk
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 08:34:37 +0000
X-Inumbo-ID: 0f471aee-a0be-11ea-a7a8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f471aee-a0be-11ea-a7a8-12813bfff9fa;
 Thu, 28 May 2020 08:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yKMi1nya+OTYYAGIWXH70UxGsSw5kc/9JlSI1JLKCwI=; b=WHm4AQ65EWnI4bLqMSRm8Tc6GC
 H/IZ2ssjHyH2fvZMEEfJU4lofCREC/FEa0udWRRtbCsxTLydy/jxV4E/Oz6CvrQluovs7B586Xufk
 HRxNertnCsNLXJQDyUyEQaGVIfl+ZcBMh9NG33Js2m+loSd2CHKMJQr342FfH2jsprc8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeDzl-0006NI-4H; Thu, 28 May 2020 08:34:33 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeDzk-0003ZK-Tu; Thu, 28 May 2020 08:34:33 +0000
Subject: Re: [PATCH v2] docs: update xenstore-migration.md
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200528082217.26057-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <57f59299-0723-bfcc-33b3-a97562c87150@xen.org>
Date: Thu, 28 May 2020 09:34:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528082217.26057-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,

On 28/05/2020 09:22, Juergen Gross wrote:
> -| Field       | Description                                     |
> -|-------------|-------------------------------------------------|
> -| `conn-id`   | A non-zero number used to identify this         |
> -|             | connection in subsequent connection-specific    |
> -|             | records                                         |
> -|             |                                                 |
> -| `conn-type` | 0x0000: shared ring                             |
> -|             | 0x0001: socket                                  |
> -|             | 0x0002 - 0xFFFF: reserved for future use        |
> -|             |                                                 |
> -| `conn-spec` | See below                                       |
> -|             |                                                 |
> -| `data-len`  | The length (in octets) of any pending data not  |
> -|             | yet written to the connection                   |
> -|             |                                                 |
> -| `data`      | Pending data (may be empty)                     |
> +| Field          | Description                                  |
> +|----------------|----------------------------------------------|
> +| `conn-id`      | A non-zero number used to identify this      |
> +|                | connection in subsequent connection-specific |
> +|                | records                                      |
> +|                |                                              |
> +| `flags`        | A bit-wise OR of:                            |
> +|                | 0001: read-only                              |

NIT: It is a bit odd the flags is in the header after `conn-type` and 
described before.

> +|                |                                              |
> +| `conn-type`    | 0x0000: shared ring                          |
> +|                | 0x0001: socket                               |
> +|                | 0x0002 - 0xFFFF: reserved for future use     |
> +|                |                                              |
> +| `conn-spec`    | See below                                    |
> +|                |                                              |
> +| `in-data-len`  | The length (in octets) of any data read      |
> +|                | from the connection not yet processed        |
> +|                |                                              |
> +| `out-resp-len` | The length (in octets) of a partial response |
> +|                | not yet written to the connection (included  |
> +|                | in the following `out-data-len`)             |

This seems to come from nowhere. It would be good to explain in the 
commit message why this is necessary.

> +|                |                                              |
> +| `out-data-len` | The length (in octets) of any pending data   |
> +|                | not yet written to the connection            |

Cheers,

-- 
Julien Grall

