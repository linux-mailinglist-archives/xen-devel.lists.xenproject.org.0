Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE4D1FA98C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 09:08:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl5gs-0005rq-DA; Tue, 16 Jun 2020 07:07:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jl5gr-0005rl-3a
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 07:07:25 +0000
X-Inumbo-ID: 06c1ef98-afa0-11ea-b88a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06c1ef98-afa0-11ea-b88a-12813bfff9fa;
 Tue, 16 Jun 2020 07:07:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B513DAC85;
 Tue, 16 Jun 2020 07:07:25 +0000 (UTC)
Subject: Re: [PATCH v19 for-4.14 00/13] VM forking
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <000c01d63826$6d125900$47370b00$@xen.org>
 <4017F2B3-BB9B-4E9F-813C-6FE68BA0D568@citrix.com>
 <CABfawh=YHA9Lxbto5Qgf_wkSFAR+JxCdWB99iAhCmBgwSwvmVg@mail.gmail.com>
 <002401d638b0$a5460f80$efd22e80$@xen.org>
 <d3df7cbf-843a-9253-292c-b6bb48ff9c94@suse.com>
 <CABfawhmMgNCBwoTZ6Fm300q3CVUu0sQNLOU3_jW_iCr_OMTWLg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <52f24592-934a-da54-9439-a67fea004af3@suse.com>
Date: Tue, 16 Jun 2020 09:07:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawhmMgNCBwoTZ6Fm300q3CVUu0sQNLOU3_jW_iCr_OMTWLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.06.2020 21:27, Tamas K Lengyel wrote:
> On Tue, Jun 2, 2020 at 3:39 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 02.06.2020 09:37, Paul Durrant wrote:
>>> Maintainers/committers, can we please get those patches in a.s.a.p.?
>>
>> The sole reason I didn't put in at least the 1st patch on Friday
>> (perhaps also the 2nd, as it is suitably ack-ed) was that it's
>> still missing a VMX maintainer ack, and Kevin had provided
>> comments on v2 of the smaller (2-patch) series.
> 
> Can we get the first patches from this series merged now with Kevin's
> Reviewed-by he sent last week
> (https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00732.html)?

Please can you be a little more patient? I've been out of the
office until yesterday afternoon, and I'm dealing with half
broken email now.

Jan

