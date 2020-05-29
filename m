Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A451E7D2E
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 14:28:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jee7I-0001y6-1C; Fri, 29 May 2020 12:28:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jee7G-0001y1-GL
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 12:28:02 +0000
X-Inumbo-ID: d655b67e-a1a7-11ea-81bc-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d655b67e-a1a7-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 12:28:02 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:56400
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jee7E-000IiI-Jl (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 13:28:00 +0100
Subject: Re: [PATCH v10 3/9] x86emul: also test decoding and mem access /
 write logic
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
 <627a6fbb-8e84-0509-78c8-942736e64503@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7b53fdeb-5851-62f5-6e3e-406d630ff7a2@citrix.com>
Date: Fri, 29 May 2020 13:27:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <627a6fbb-8e84-0509-78c8-942736e64503@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25/05/2020 15:27, Jan Beulich wrote:
> x86emul_is_mem_{access,write}() (and their interaction with
> x86_decode()) have become sufficiently complex that we should have a way
> to test this logic. Start by covering legacy encoded GPR insns, with the
> exception of a few the main emulator doesn't support yet (left as
> comments in the respective tables, or about to be added by subsequent
> patches). This has already helped spot a few flaws in said logic,
> addressed by (revised) earlier patches.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Extra testing is always good.

