Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28064BE110
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:19:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD92h-0004Tp-8J; Wed, 25 Sep 2019 15:17:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5mKa=XU=gmail.com=festevam@srs-us1.protection.inumbo.net>)
 id 1iD92f-0004Tk-T3
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:17:21 +0000
X-Inumbo-ID: 917baf9e-dfa7-11e9-bf31-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by localhost (Halon) with ESMTPS
 id 917baf9e-dfa7-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 15:17:21 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q64so6062022ljb.12
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 08:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rTBq6P5OxsGLjoGVhyAwZM8k0vklyHGTB2oJI82Er7M=;
 b=eghD7xF1O36vsBrF3R1Ol+O9tfU+0jO9JXTPAGDQj/eD9TEB4fS0VQFijoygPStgr3
 10lJjOrWc1bicRYqBtncYZdXUVZQzGo/mCRUFcwwwv+kexKbN1ES5l5Ac30Iyy/VSy6b
 zUdkmBZi6iQtLRd1ksj9hb1AR/76sVMVefmq8BgklCKkDi+tVqaxFM4AvBWSG3sKDCRC
 NPA4lDaeoCpS8CsgLxRZg802nWrQPQecGCdXqYctiynPyMIAzYncAW7BXnLuqZdmqiq7
 lmNY1mZLDVoPD5SAcNNPdqQCcypDkXcAg+PaiFPMbfZqC2X+xM6M1pHyx+WOo3XdPYs0
 eCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rTBq6P5OxsGLjoGVhyAwZM8k0vklyHGTB2oJI82Er7M=;
 b=Y1hSaFBnbXFA+UK7LqB+ZpQVXPsa0bvg1f3taOPfgKPxEoSHAeNu8jvEVbexIeq+rW
 6CSN5K0GaPMS186BIyRl7U4607gjA4R9uT7CExcW10KmimLRN2RgSiqpK9zfhsi1Y0vX
 LY8gUQECIg2AnOOAwMBFJDPOjQsmbMVnVXmSldi8x7UCGKpGiPr4okkBQ97nrkuuMoqk
 pYYAJ/0l9O4pVCU6POL7sHcdAJp+9ApT0BsdcfPHwDhOtlnDQgDxMPU3qVbR8HRsuWZV
 s5Npe5jKLv/WybEmqi1RPNuVPlqR8cb5gcTXeszkylTRblWeLVEZ58LCbVqx4tIo28m1
 HMSQ==
X-Gm-Message-State: APjAAAVd0lx4+abiQBGSwe+/Xe0PdnZBFzwsutoD7OYu3XdbaakLuPJC
 7SDu+vSlcfHTu1qJo+qSm53fCx5mp4yWReplT+I=
X-Google-Smtp-Source: APXvYqzF1RqhBAB47TPrTDl3zKUBxVzKbXcvNvcrU2oxqh5sJKOV3USfSG9GeeJJkpUMrG8FnoJZki1WHtkUnydqfw8=
X-Received: by 2002:a2e:b0f4:: with SMTP id h20mr1893730ljl.10.1569424639817; 
 Wed, 25 Sep 2019 08:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
In-Reply-To: <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 Sep 2019 12:17:28 -0300
Message-ID: <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [Xen-devel] [PATCH v2 00/21] Refine memblock API
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Chris Healy <cphealy@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgOToxNyBBTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWls
LmNvbT4gd3JvdGU6Cgo+IEkgdHJpZWQgY21hPTI1Nk0gYW5kIG5vdGljZWQgdGhlIGNtYSBkdW1w
IGF0IHRoZSBiZWdpbm5pbmcgZGlkbid0Cj4gY2hhbmdlLiAgRG8gd2UgbmVlZCB0byBzZXR1cCBh
IHJlc2VydmVkLW1lbW9yeSBub2RlIGxpa2UKPiBpbXg2dWwtY2NpbXg2dWxzb20uZHRzaSBkaWQ/
CgpJIGRvbid0IHRoaW5rIHNvLgoKV2VyZSB5b3UgYWJsZSB0byBpZGVudGlmeSB3aGF0IHdhcyB0
aGUgZXhhY3QgY29tbWl0IHRoYXQgY2F1c2VkIHN1Y2ggcmVncmVzc2lvbj8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
