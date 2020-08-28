Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55307255EE1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 18:39:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBhP1-0000nC-0q; Fri, 28 Aug 2020 16:38:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yPZ/=CG=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kBhP0-0000n7-0o
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 16:38:58 +0000
X-Inumbo-ID: 2a1240c8-3b51-440b-b3de-0cd2bdd0cfe2
Received: from ppsw-42.csi.cam.ac.uk (unknown [131.111.8.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a1240c8-3b51-440b-b3de-0cd2bdd0cfe2;
 Fri, 28 Aug 2020 16:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk; 
 s=20180806.ppsw;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CZB5kT4b6kRyaQLSOSJxhEWS4+mPftNjb+E5dFozJ4k=; b=AcbtT8JRqCClCo09s0pNWT85hV
 OHCW7/IcNLpxX7K1uNegw24LAAnPbMYiiO62a++S6H2SU+eyyJmXHG/EfJk3whTKLOJJbRg/4/N9j
 8DttHNIhy6DzDeQziHfjIMRwVWH7EZbUwmB7v7VDBzIsDo4DTTvlmsXQQzsK4JWCk76E=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-186-240.dynamic.dsl.as9105.com ([88.109.186.240]:53468
 helo=[192.168.1.219])
 by ppsw-42.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.158]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kBhOx-0002DX-8H (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Fri, 28 Aug 2020 17:38:55 +0100
Subject: Re: [PATCH] x86/intel: Expose MSR_ARCH_CAPS to dom0
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andrew Cooper <amc96@cam.ac.uk>
References: <20200827193713.4962-1-andrew.cooper3@citrix.com>
 <e24c49ce-82f4-955d-3a7b-03ffd5aa4144@suse.com>
 <9498c4e0-d8c7-1660-3074-8a818ba50658@cam.ac.uk>
 <70a6de86-f382-050c-9c33-eccc9cb76c9c@suse.com>
 <f585d05b-db9b-c890-898d-ed34a0122ec4@cam.ac.uk>
 <990665a8-a219-ef79-331a-79bf70c11324@suse.com>
From: Andrew Cooper <amc96@cam.ac.uk>
Autocrypt: addr=amc96@cam.ac.uk; keydata=
 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
Message-ID: <93da43ae-a53c-16ac-4f23-b700cc2f6b1d@cam.ac.uk>
Date: Fri, 28 Aug 2020 17:38:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <990665a8-a219-ef79-331a-79bf70c11324@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/08/2020 17:17, Jan Beulich wrote:
> On 28.08.2020 18:09, Andrew Cooper wrote:
>> On 28/08/2020 16:42, Jan Beulich wrote:
>>> On 28.08.2020 12:23, Andrew Cooper wrote:
>>>> On 28/08/2020 09:41, Jan Beulich wrote:
>>>>> On 27.08.2020 21:37, Andrew Cooper wrote:
>>>>>> The overhead of (the lack of) MDS_NO alone has been measured at 30=
% on some
>>>>>> workloads.  While we're not in a position yet to offer MSR_ARCH_CA=
PS generally
>>>>>> to guests, dom0 doesn't migrate, so we can pass a subset of hardwa=
re values
>>>>>> straight through.
>>>>>>
>>>>>> This will cause PVH dom0's not to use KPTI by default, and all dom=
0's not to
>>>>>> use VERW flushing by default,
>>>>> To avoid VERW, shouldn't you also expose SKIP_L1DFL?
>>>> SKIP_L1DFL is a software-only bit, specifically for nested virt.
>>>>
>>>> It is for Xen to tell an L1 hypervisor "you don't need to flush on
>>>> vmentry because I'm taking care of it".
>>> Or for a hypervisor underneath us to tell us, which we could then
>>> hand on to Dom0?
>> For dom0 to do what with?
>>
>> PV guests can't use the VMLAUNCH/VMRESUME instruction at all, and it i=
s
>> not currently possible to configure nested virt for a PVH dom0 to use.=

> Aren't they also using this on the exit-to-user-mode path, like we
> do on exit-to-PV? And in certain cases when idle?

MSR_FLUSH_CMD is used used for VMEntry.=C2=A0 This flushes the L1D cache,=
 and
was to combat L1TF.=C2=A0 Native systems don't flush the L1D at all, and
invert PTEs instead as a *far* lower overhead mitigation.

Then MDS came along.=C2=A0 VERW is used to flush the uarch buffers.=C2=A0=
 This
needs doing in all return-to-guest contexts.

As VMEntry needs both, MSR_FLUSH_CMD's behaviour was extended to cover
both the L1D cache and uarch buffers, so software didn't have to arrange
for both.

Therefore, the overall mitigations are VERW on exit-to-PV, and
MSR_FLUSH_CMD on exit-to-HVM.


There is no current need for native setups to use MSR_FLUSH_CMD.=C2=A0 Th=
e
only reason we expose the MSR to HVM guests is for nested-virt.

~Andrew


