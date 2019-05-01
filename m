Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FADD107E1
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 14:28:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLoIj-0000fO-77; Wed, 01 May 2019 12:25:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2zDm=TB=citrix.com=prvs=017a1499b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hLoIh-0000fJ-Fv
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 12:25:27 +0000
X-Inumbo-ID: 3104ecb6-6c0c-11e9-be0d-7389485c7cbd
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3104ecb6-6c0c-11e9-be0d-7389485c7cbd;
 Wed, 01 May 2019 12:25:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208,217";a="89514713"
To: David Woodhouse <dwmw2@infradead.org>, <xen-devel@lists.xenproject.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
 <c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 mQINBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABtClBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPokCOgQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86LkCDQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAYkC
 HwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
Message-ID: <94292241-fbdb-3e56-38fe-ea6687461c85@citrix.com>
Date: Wed, 1 May 2019 13:25:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [RFC PATCH 2/7] x86/boot: Remove gratuitous call
 back into low-memory code
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
Content-Type: multipart/mixed; boundary="===============5134683414390356600=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5134683414390356600==
Content-Type: multipart/alternative;
	boundary="------------45CEA9DC24A385A9D6820A04"
Content-Language: en-GB

--------------45CEA9DC24A385A9D6820A04
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 01/05/2019 12:17, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> We appear to have implemented a memcpy() in the low-memory trampoline
> which we then call into from __start_xen(), for no adequately defined
> reason.
>
> Kill it with fire.

Absolutely.

> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

With the following fixup folded:

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 213a1bd..e607a85 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -673,13 +673,11 @@ static char * __init cmdline_cook(char *p, const char *loader_name)
     return p;
 }
 
-static int copy_bios_e820(struct e820entry *map, unsigned int limit)
+static unsigned int copy_bios_e820(struct e820entry *map, unsigned int limit)
 {
-    unsigned int n = bootsym(bios_e820nr);
-    if (n > limit)
-        n = limit;
+    unsigned int n = min(bootsym(bios_e820nr), limit);
 
-    if (n)
+    if ( n )
         memcpy(map, bootsym(bios_e820map), sizeof(*map) * n);
 
     return n;

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Interestingly, the version with min() results in surprisingly better code:

add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-21 (-21)
Function                                     old     new   delta
__start_xen                                13807   13786     -21
Total: Before=3363289, After=3363268, chg -0.00%


--------------45CEA9DC24A385A9D6820A04
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 01/05/2019 12:17, David Woodhouse
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org">
      <pre class="moz-quote-pre" wrap="">From: David Woodhouse <a class="moz-txt-link-rfc2396E" href="mailto:dwmw@amazon.co.uk">&lt;dwmw@amazon.co.uk&gt;</a>

We appear to have implemented a memcpy() in the low-memory trampoline
which we then call into from __start_xen(), for no adequately defined
reason.

Kill it with fire.</pre>
    </blockquote>
    <br>
    Absolutely.<br>
    <br>
    <blockquote type="cite"
cite="mid:c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: David Woodhouse <a class="moz-txt-link-rfc2396E" href="mailto:dwmw@amazon.co.uk">&lt;dwmw@amazon.co.uk&gt;</a></pre>
    </blockquote>
    <br>
    With the following fixup folded:<br>
    <br>
    <pre>diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 213a1bd..e607a85 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -673,13 +673,11 @@ static char * __init cmdline_cook(char *p, const char *loader_name)
     return p;
 }
 
-static int copy_bios_e820(struct e820entry *map, unsigned int limit)
+static unsigned int copy_bios_e820(struct e820entry *map, unsigned int limit)
 {
-    unsigned int n = bootsym(bios_e820nr);
-    if (n &gt; limit)
-        n = limit;
+    unsigned int n = min(bootsym(bios_e820nr), limit);
 
-    if (n)
+    if ( n )
         memcpy(map, bootsym(bios_e820map), sizeof(*map) * n);
 
     return n;

</pre>
    Acked-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a><br>
    <br>
    Interestingly, the version with min() results in surprisingly better
    code:<br>
    <br>
    <pre>add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-21 (-21)
Function                                     old     new   delta
__start_xen                                13807   13786     -21
Total: Before=3363289, After=3363268, chg -0.00%</pre>
  </body>
</html>

--------------45CEA9DC24A385A9D6820A04--


--===============5134683414390356600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5134683414390356600==--

