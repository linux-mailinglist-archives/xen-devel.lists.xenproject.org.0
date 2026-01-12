Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524FED12627
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 12:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200146.1516144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfGP6-0000Ow-EN; Mon, 12 Jan 2026 11:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200146.1516144; Mon, 12 Jan 2026 11:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfGP6-0000MB-Av; Mon, 12 Jan 2026 11:48:12 +0000
Received: by outflank-mailman (input) for mailman id 1200146;
 Mon, 12 Jan 2026 11:48:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2Au=7R=proton.me=milky_way_303030@srs-se1.protection.inumbo.net>)
 id 1vfGP3-0000Ly-HK
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 11:48:10 +0000
Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch
 [79.135.106.101]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c2a163e-efac-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 12:48:01 +0100 (CET)
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
X-Inumbo-ID: 8c2a163e-efac-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1768218480; x=1768477680;
	bh=hMZ7ISbAZAdB9j2g7jiY9n4psbr6tMeEGXfsapPyD+M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=O2npQbciQ/fOZBw9B6XGgoAZMw6d7qEBUMXMYbTU6twokp4ebieqOdCfXfn6iF4xb
	 wQDcXDAjvQqRAUJhkIFqFbucy4UonJf0yBLECSVatDoKeA864Up0knVwoR+vSNY7il
	 f4gAiUuiJEXONKw2LTLptqeTAWLzgnQ1H/WGlPMiWCe73NRbWcgJmlspIWdnK1BW9I
	 Qcc6m425eaV0JrSW20CB1U7dq+zb6yDZ+tWYb9uo0+nmjJKAep1umP97xs8KgYKOlH
	 Gtilnb7zz4jjVoxRibl6ITCL2cTOXFypyaR/JiHRBoxr4p+KVoMpz3dVME2pJMZIxd
	 Ar9UMRnlUqXnA==
Date: Mon, 12 Jan 2026 11:47:53 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Milky <milky_way_303030@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: Cpufreq drivers not working on T480S
Message-ID: <rhr8suTtSGv9hTwateK8Tx8Cm9xetzvaOsOIzexIaY-VaPyxsgzA3K0pYTeyyrKFtkc5gHJ3SrJ0I5VKjGsxBKdQm-QKPRVF_bugbAHM9uI=@proton.me>
In-Reply-To: <8a2125c7-c5ec-4be1-a7a5-61b2936cc90f@suse.com>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me> <CAKf6xpsN_RnY2dHnXKj_-UySf1z0auye2qy=KHOEhcBbZ1un9A@mail.gmail.com> <NqFx_tXl0Zmx2ft7YVNGodkDcUFK7nA8KWUQMjOmD0y4T5W3-sTcGxCt7ViSRObUeJog3069xTY0ODZIG5hrX-Th2MvE95dSze13MGQ2tOY=@proton.me> <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com> <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me> <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com> <unRhWiUKUGc3G4yBmJJ2Pc0JOSbM4HC0b-fTBaf1f0RYJEi_aIHV3-il1EafrSE9c77-tZNUV386xdg3UANDdeonG_zecEVq7HrG2COheJ8=@proton.me> <7dbd26d1-0d9a-454f-90d8-5a7f3d8e12da@suse.com> <qo8wx-b_cpRuzol0X0mW_NHY1mu3tOBCzMvy5Y_8IASOkmy1oxPdJWdbrndDL63d5lMbw1FDMkI9gCSH9BS2UFWiuyjhycfqWpJWueeHq2E=@proton.me> <8a2125c7-c5ec-4be1-a7a5-61b2936cc90f@suse.com>
Feedback-ID: 171106842:user:proton
X-Pm-Message-ID: 135c2f6b552a31190d1a0a745a34ce2fa1dfd8f3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Monday, January 12th, 2026 at 8:43 AM, Jan Beulich <jbeulich@suse.com> w=
rote:

> And was is meanwhile checked that ACPI provides the necessary tables, and
> xen-processor-acpi manages to processes and upload them?

With `cpufreq=3Dxen,no-hwp`, the `xen-acpi-processor` kernel module continu=
es not to load. Decompiling the ACPI tables from `/sys/firmware/acpi/tables=
` using iasl and grepping for `_PCT`, `_PPC` and `_PSS` returns no results.=
 

