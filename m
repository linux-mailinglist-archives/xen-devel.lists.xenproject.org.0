Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ED91EB8CC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 11:49:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg3Xa-0007si-7R; Tue, 02 Jun 2020 09:49:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Exxl=7P=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jg3XZ-0007sd-Gh
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:49:01 +0000
X-Inumbo-ID: 48c75076-a4b6-11ea-8993-bc764e2007e4
Received: from ppsw-30.csi.cam.ac.uk (unknown [131.111.8.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48c75076-a4b6-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 09:49:00 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:53906
 helo=[192.168.1.219])
 by ppsw-30.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.156]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jg3XT-000lLb-eL (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Tue, 02 Jun 2020 10:48:55 +0100
Subject: Re: [PATCH for-4.14] compilers/clang: always use _Static_assert with
 clang
To: paul@xen.org, 'Wei Liu' <wl@xen.org>,
 'Roger Pau Monne' <roger.pau@citrix.com>
References: <20200602091602.38422-1-roger.pau@citrix.com>
 <20200602092314.uydguwrje4bomktf@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <003a01d638bf$d54dc100$7fe94300$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8507bef6-9277-6960-b878-14adb387e42b@citrix.com>
Date: Tue, 2 Jun 2020 10:48:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <003a01d638bf$d54dc100$7fe94300$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02/06/2020 10:26, Paul Durrant wrote:
>> On Tue, Jun 02, 2020 at 11:16:02AM +0200, Roger Pau Monne wrote:
>>> All versions of clang used by Xen support _Static_assert, so use it
>>> unconditionally when building Xen with clang.
>>>
>>> No functional change expected.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Reviewed-by: Wei Liu <wl@xen.org>
>>
>>> ---
>>> Not sure whether this fully qualifies as a bugfix, as the current
>>> behavior should also work fine under clang. Note that all versions of
>>> clang from 3.5 to trunk (11) seem to return __GNUC__ == 4 and
>>> __GNUC_MINOR__ == 2.
>> IMHO it wouldn't hurt to apply this patch since any breakage is easy to
>> catch.
> Yes, seems reasonable.
>
> Release-acked-by: Paul Durrant <paul@xen.org>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

