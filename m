Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B317EB43D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632850.987349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vky-0000c7-To; Tue, 14 Nov 2023 15:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632850.987349; Tue, 14 Nov 2023 15:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vky-0000aL-QJ; Tue, 14 Nov 2023 15:55:16 +0000
Received: by outflank-mailman (input) for mailman id 632850;
 Tue, 14 Nov 2023 15:55:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wlO=G3=desiato.srs.infradead.org=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r2vkw-0000Vo-VE
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:55:14 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 316df0b9-8306-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 16:55:12 +0100 (CET)
Received: from [12.186.190.2] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r2vkj-002YFc-1l; Tue, 14 Nov 2023 15:55:05 +0000
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
X-Inumbo-ID: 316df0b9-8306-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/dnm/wFvk/yv7xaMVVCi4UNXjRYnVLcTr44nudqfiig=; b=CrvEHaLu3ghKko6qCLNKnbyNbO
	H0HaiBWEDEqhiYXOyWq6L5fPwjkEEuFM/hPjw0DdPgdVBxI+hfbT8DDMqqG32wfgapci6OUoR+GwG
	LWXFGfKFNSpfzi7W13vkvR1Qk9iNGPwbn/ZvEhT0U/TFVXS1dCcIHK9YwgL7NXv7izHrZkaWioseY
	o2/3wuKNJ5fI/LnE0O+1GLlCXwFBTOIob05/Tt0QVIQ3fhqoeH6os7jaqbRUQXvuthfMe+J+5R2My
	36DqwE1AyHONfjQ2p9p3mJ2mXSIPNVvkoPDkUya1YBWKOoVp6qb5x1u+SdwdorOgU1Od+9cvf/1Ly
	pfoeq3TQ==;
Date: Tue, 14 Nov 2023 10:54:57 -0500
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH-for-9.0 v2 16/19] hw/xen/xen_pt: Add missing license
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-17-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-17-philmd@linaro.org>
Message-ID: <533319AD-DC12-4E44-8C95-D7A85D8E4241@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 14 November 2023 09:38:12 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>Commit eaab4d60d3 ("Introduce Xen PCI Passthrough, qdevice")
>introduced both xen_pt=2E[ch], but only added the license to
>xen_pt=2Ec=2E Use the same license for xen_pt=2Eh=2E
>
>Suggested-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>


Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>


