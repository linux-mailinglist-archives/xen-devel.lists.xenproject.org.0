Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E546FCDE5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 19:38:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVJxh-0007fo-RL; Thu, 14 Nov 2019 18:35:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=174C=ZG=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iVJxh-0007fh-AK
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 18:35:21 +0000
X-Inumbo-ID: 831e07d4-070d-11ea-984a-bc764e2007e4
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 831e07d4-070d-11ea-984a-bc764e2007e4;
 Thu, 14 Nov 2019 18:35:20 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l7so7684544wrp.6
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2019 10:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yb9/s5BBGt43UmfelpBreW85+nZwn5SMCH5hpeDfl3w=;
 b=ohFZW3vwhSVMPB5XVc3yN5xPxd2saOySvFouWDhep5cT35uNYp+Bir+KrNGWYgey0O
 0jie/nTOfTTvTxGWkpdXmyKk4J12Q79Cido+1N3z9sb7NA0gHgGLtG+uNPPDekxZvPag
 QS5dl1EL6BQBYXYCjEWJ0F7bFe+5f/a5M24uneD/lmriSZOFs3aUBru0hEFKZ38JFMA5
 bAlYcYBnxte2ge19aKsua2j8QPx/bLapuDNb4bzFJLgbtRjs1TkvlSDjAXE4UBs2200c
 aVhG0HnICqjzIrW5CNOemVLcu6RNlT47+karkpQ1uo3JfQ8bO4n0kXLQuIbssRsnlfwh
 Xq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yb9/s5BBGt43UmfelpBreW85+nZwn5SMCH5hpeDfl3w=;
 b=UjY6Mwub1JOBMGE6nrA6oDeHwR4es92W11KD6xZiAcIPEeROdDvdNETn2VFK6Selv4
 kORwGxgLhnPHsbyaHX/zDnJHNGfQridb5er0fAgqxSQigC1L+L4KvpWLyKcZbXrMi9fa
 dbEYB0VdmQAaMsLWzdosWZGYC9BenFrGAt26ORiotUClYk1ykuhwDGd1uxU6ay2RgaCq
 VNvvjw6qLq9v/MtAf3eQOGeW679jmCeCL/3l1pvj4oGiDxirJIB1hNTBkp52wHDVxvl5
 3/W62M9C7BHxlAmYvPebhSsOIHlbgzduptSbMj4FLkLH0G4BB9V0fNdGl9Q5WnerOuPP
 PZyA==
X-Gm-Message-State: APjAAAWqYT9/KbQLVEN9upH612O0MX8XMhEqyWy1AU4DgxuiPyQwTVP0
 X9wEVepzNruEg7hNmrft3kHOxcU+hrSZGXNeglxwOHyg
X-Google-Smtp-Source: APXvYqwsWDCphnGaWqgNCN3DZAjyQsCSU+BgKawYBpRq59uKHBizYQyHFeBwUqXc/hy+4DnucP2qvrYJaMpf0Md61NM=
X-Received: by 2002:a5d:5391:: with SMTP id d17mr10520891wrv.382.1573756519732; 
 Thu, 14 Nov 2019 10:35:19 -0800 (PST)
MIME-Version: 1.0
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 14 Nov 2019 11:34:43 -0700
Message-ID: <CABfawhkB6M8sTMdSU2t+BQqfZ6jTQjU5k9Q3337Jx8APnowxZg@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [Xen-devel] [TESTDAY] Test report
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KiBIYXJkd2FyZTogaTctMjcwMAoKKiBTb2Z0d2FyZTogRGViaWFuIGJ1c3RlcgoKKiBHdWVzdCBv
cGVyYXRpbmcgc3lzdGVtczogRGViaWFuIHN0cmV0Y2gKCiogRnVuY3Rpb25hbGl0eSB0ZXN0ZWQ6
IGNvbXBpbGluZywgaW5zdGFsbGluZywgQm9vdGluZyB3aXRoIGRvbTA9cHZoCgoqIENvbW1lbnRz
OiBBbGwgd29ya3MKCi0tLS0KCiogSGFyZHdhcmU6IGkzLTcxMDAKCiogU29mdHdhcmU6IERlYmlh
biBidXN0ZXIKCiogR3Vlc3Qgb3BlcmF0aW5nIHN5c3RlbXM6IERlYmlhbiBzdHJldGNoLCBkZWJp
YW4gamVzc2llLCB3aW5kb3dzIDcKc3AxIHg4Niwgd2luZG93czcgc3AxIHg2NCwgd2luZG93cyAx
MCAxOTAzCgoqIEZ1bmN0aW9uYWxpdHkgdGVzdGVkOiBjb21waWxpbmcsIGluc3RhbGxpbmcsIGJv
b3RpbmcgZnJvbSBVRUZJIHZpYQpncnViLmVmaSwgYWx0cDJtLCBpbnRyb3NwZWN0aW9uCgoqIENv
bW1lbnRzOiBBbGwgd29ya3MsIGFsdHAybStpbnRyb3NwZWN0aW9uIHJlcXVpcmVzIHRoZSBlcHQ9
cG1sPTAKYm9vdCBmbGFnIHNwZWNpZmllZCB0byB3b3JrYXJvdW5kIGEgZGVhZGxvY2sgaW4gWGVu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
