Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E23887E8ACA
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 12:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630954.984111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1mao-00005c-Fx; Sat, 11 Nov 2023 11:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630954.984111; Sat, 11 Nov 2023 11:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1mao-0008Uj-DF; Sat, 11 Nov 2023 11:56:02 +0000
Received: by outflank-mailman (input) for mailman id 630954;
 Sat, 11 Nov 2023 11:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sSCd=GY=casper.srs.infradead.org=BATV+506890241e50857960ff+7384+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r1mam-0008Ud-47
 for xen-devel@lists.xenproject.org; Sat, 11 Nov 2023 11:56:01 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45544313-8089-11ee-9b0e-b553b5be7939;
 Sat, 11 Nov 2023 12:55:56 +0100 (CET)
Received: from [2a00:23ee:1388:8870:4831:fbef:c526:c9d3] (helo=[IPv6:::1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r1mab-001kQA-EY; Sat, 11 Nov 2023 11:55:50 +0000
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
X-Inumbo-ID: 45544313-8089-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:References;
	bh=aNYogX38C94HF9nMzY/PuCSRi2zMPGTuqCBDWATJ8bQ=; b=fGsp+6dsbCYuEqJPjrU4EEoK/M
	r1RZj+xQuBW/xraW71Nar8HSA2LoOQdrUsMPQaweAZu63ChTVJgYV+5b77me5gW/YDr4l6+1hf0BR
	8P4Y34rk06ekpmsrpSmNEYe0gxgKV/75dTIUSYXtILdISbyBaYTGFMeS0w6KNnyY2nRY+FC4ZqiKD
	ZBqidum7afBgen4h3+XAO69DaTkqgl/C/idW0PIEDyxOmb8C3i+Gnft2HXbhZ7Li08uN5rZO/nkve
	wRNRicpa1UaKSV2WUX6H/0QhleJv05bm6KRKm3LPkStu30Bw/BIaJ4cYguVl6DorMtQWiixW+kP8r
	gjKKwLqw==;
Date: Sat, 11 Nov 2023 11:42:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: volodymyr_babchuk@epam.com
CC: Oleksandr_Tyshchenko@epam.com, anthony.perard@citrix.com, paul@xen.org,
 qemu-devel@nongnu.org, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_5/7=5D_xen-bus=3A_Set_offline?= =?US-ASCII?Q?_if_backend=27s_state_is_XenbusStateClosed?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231110204207.2927514-6-volodymyr_babchuk@epam.com>
Message-ID: <93DE8C53-EEBD-4AB6-9E03-13ABA869C299@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----O7OH88IZ1XHEHMTN2IP326XGDEP0S8
Content-Transfer-Encoding: 7bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

------O7OH88IZ1XHEHMTN2IP326XGDEP0S8
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

(When sending a series, if you Cc someone on one message please could you C=
c them on the whole thread for context? Thanks=2E)

> Both state (XenbusStateClosed) and online (0) are expected by
> toolstack/xl devd to completely destroy the device=2E But "offline"
> is never being set by the backend resulting in timeout during
> domain destruction, garbage in Xestore and still running Qemu
> instance=2E

I would dearly love to see a clear state diagram showing all the possible =
state transitions during device creation, fe/be reconnecting, and hot plug/=
unplug=2E Does anything like that exist? Any test cases for the common and =
the less common transitions, and even the illegal ones which need to be han=
dled gracefully?

Fantasy aside, can you please confirm that this patch series was tested wi=
th hotplug (device_add in the monitor) *and* unplug in QEMU, both under rea=
l Xen and ideally also emulated Xen in KVM?=20

Thanks=2E
------O7OH88IZ1XHEHMTN2IP326XGDEP0S8
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><body><div dir=3D"auto">(When sending a series, if you=
 Cc someone on one message please could you Cc them on the whole thread for=
 context? Thanks=2E)<br><br>&gt; Both state (XenbusStateClosed) and online =
(0) are expected by<br>&gt; toolstack/xl devd to completely destroy the dev=
ice=2E But "offline"<br>&gt; is never being set by the backend resulting in=
 timeout during<br>&gt; domain destruction, garbage in Xestore and still ru=
nning Qemu<br>&gt; instance=2E<br><br>I would dearly love to see a clear st=
ate diagram showing all the possible state transitions during device creati=
on, fe/be reconnecting, and hot plug/unplug=2E Does anything like that exis=
t? Any test cases for the common and the less common transitions, and even =
the illegal ones which need to be handled gracefully?<br><br>Fantasy aside,=
 can you please confirm that this patch series was tested with hotplug (dev=
ice_add in the monitor) *and* unplug in QEMU, both under real Xen and ideal=
ly also emulated Xen in KVM? <br><br>Thanks=2E</div></body></html>
------O7OH88IZ1XHEHMTN2IP326XGDEP0S8--

