Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5EC1E11C6
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 17:32:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdF4B-0006XD-UB; Mon, 25 May 2020 15:31:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvIA=7H=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jdF4A-0006X8-Ke
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 15:31:02 +0000
X-Inumbo-ID: bd2bdaba-9e9c-11ea-b07b-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd2bdaba-9e9c-11ea-b07b-bc764e2007e4;
 Mon, 25 May 2020 15:31:02 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:39840
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jdF44-000KAx-JZ (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Mon, 25 May 2020 16:30:56 +0100
Subject: Re: [PATCH v2] VT-x: extend LBR Broadwell errata coverage
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c43b9d43-2e37-d2a8-ba32-dd06062a05e2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e8f3ac62-2829-dec6-a855-ac4b50816b34@citrix.com>
Date: Mon, 25 May 2020 16:30:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c43b9d43-2e37-d2a8-ba32-dd06062a05e2@suse.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25/05/2020 16:04, Jan Beulich wrote:
> For lbr_tsx_fixup_check() simply name a few more specific erratum
> numbers.
>
> For bdf93_fixup_check(), however, more models are affected. Oddly enough
> despite being the same model and stepping, the erratum is listed for
> Xeon E3 but not its Core counterpart. Apply the workaround uniformly,
> and also for Xeon D, which only has the LBR-from one listed in its spec
> update.
>
> Seeing this broader applicability, rename anything BDF93-related to more
> generic names.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

