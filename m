Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748D727FC38
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 11:08:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136.3737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNuZf-000698-Os; Thu, 01 Oct 2020 09:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136.3737; Thu, 01 Oct 2020 09:08:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNuZf-00068j-L5; Thu, 01 Oct 2020 09:08:27 +0000
Received: by outflank-mailman (input) for mailman id 1136;
 Thu, 01 Oct 2020 09:08:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNuZe-00068c-Bi
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 09:08:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d6b89f3-251c-41a2-a226-27f398b3a356;
 Thu, 01 Oct 2020 09:08:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA725AD49;
 Thu,  1 Oct 2020 09:08:24 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNuZe-00068c-Bi
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 09:08:26 +0000
X-Inumbo-ID: 9d6b89f3-251c-41a2-a226-27f398b3a356
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9d6b89f3-251c-41a2-a226-27f398b3a356;
	Thu, 01 Oct 2020 09:08:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601543304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkpkHDPoQcdt8alyC1VjT+FnO+DiQ4YeDc5Nv31DKPE=;
	b=ANoD8lf7ad8iCbzaG+rl0esRDtyb8rBqVhN9ubdJaV9VxOqON+K/5HNsbQdclwJxrpae8i
	p6+8C0cTPN5m5ej2ykkpfkdk8xDmz53eWSP+fHD7ZevkXpWB2q92v+RlYrMmWXJLAURmN6
	bJbIMYrWDxjdAVmvTtg8PD1n8XSYbSc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AA725AD49;
	Thu,  1 Oct 2020 09:08:24 +0000 (UTC)
Subject: Re: [xen-unstable-smoke test] 155187: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-155187-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d90fa45-9097-f58c-f9b3-818bf0dd0be4@suse.com>
Date: Thu, 1 Oct 2020 11:08:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <osstest-155187-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.10.2020 07:11, osstest service owner wrote:
> flight 155187 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/155187/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-libvirt     12 guest-start              fail REGR. vs. 155128

All I can see in the serial log is

Oct  1 03:49:33.145346 [   16.993554] virbr0: port 1(virbr0-nic) entered disabled state
Oct  1 03:49:33.145426 [   16.993584] device virbr0-nic entered promiscuous mode
Oct  1 03:49:33.157353 [   16.993662] systemd-udevd[1538]: link_config: autonegotiation is unset or enabled, the speed and duplex are not writable.
Oct  1 03:49:33.169370 [   16.993840] systemd-udevd[1541]: Using default interface naming scheme 'v240'.
Oct  1 03:49:33.169467 [   16.998341] systemd-udevd[1538]: Process 'ifupdown-hotplug' failed with exit code 1.
Oct  1 03:49:33.181371 [   16.999735] systemd-udevd[1541]: Process 'ifupdown-hotplug' failed with exit code 1.
Oct  1 03:49:33.193293 [   17.287282] device virbr0-nic left promiscuous mode
Oct  1 03:49:33.433389 [   17.287356] virbr0: port 1(virbr0-nic) entered disabled state
Oct  1 03:49:33.433466 [   17.289383] systemd-udevd[1541]: Process 'ifupdown-hotplug' failed with exit code 1.
Oct  1 03:49:33.445371 [   17.294929] systemd-udevd[1541]: Process 'ifupdown-hotplug' failed with exit code 1.

accompanied by multiple instances of

# Warning: iptables-legacy tables present, use iptables-legacy to see them
iptables: Operation not supported.

and

# Warning: iptables-legacy tables present, use iptables-legacy to see them
iptables: Invalid argument. Run `dmesg' for more information.

in libvirtd.log. What I can't tell is whether this is the cause of the
test failure. In any event the domain was (still?) paused at the time
the debug keys got sent. What I also can't guess at all is which of the
five commits in question might be responsible here (or whether the issue
is an environment one).

Jan

