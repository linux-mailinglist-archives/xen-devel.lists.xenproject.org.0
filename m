Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434B51E814B
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:10:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegdg-0004Hh-5g; Fri, 29 May 2020 15:09:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jegde-0004Hb-LN
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:09:38 +0000
X-Inumbo-ID: 69a4846c-a1be-11ea-9dbe-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69a4846c-a1be-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 15:09:38 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:33084
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jegda-0011lW-Lu (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 16:09:34 +0100
Subject: Re: [PATCH] x86/hvm: Improve error information in handle_pio()
To: Jan Beulich <jbeulich@suse.com>
References: <20200528130738.12816-1-andrew.cooper3@citrix.com>
 <58d93dbe-11e3-ac1b-c2b5-b410ae837726@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <19108621-8350-5779-f917-2b1f6b1cc2d4@citrix.com>
Date: Fri, 29 May 2020 16:09:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <58d93dbe-11e3-ac1b-c2b5-b410ae837726@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/05/2020 15:57, Jan Beulich wrote:
> On 28.05.2020 15:07, Andrew Cooper wrote:
>> domain_crash() should always have a message which emitted even in release
> Oh, forgot to say: The wording here looks somewhat strange (and thus
> unclear) to me.

It should read "which is emitted", but this is basically a stopgap fix
seeing as I still haven't adjusted domain_crash() to force a message to
be provided.

~Andrew

