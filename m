Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDD124CD6
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 12:36:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT23y-00066M-Vv; Tue, 21 May 2019 10:32:06 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.169])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <kparal@redhat.com>) id 1hT23M-00065J-JS
 for xen-devel@lists.xensource.com; Tue, 21 May 2019 10:31:28 +0000
Received: from [46.226.53.52] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-c.eu-west-1.aws.symcld.net id 43/8E-25548-F73D3EC5;
 Tue, 21 May 2019 10:31:27 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-15.tower-304.messagelabs.com: domain of redhat.com designates 
 209.85.167.44 as permitted sender) smtp.mailfrom=redhat.com; dkim=none 
 (message not signed); dmarc=pass (p=none sp=none adkim=r aspf=r) 
 header.from=redhat.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRWlGSWpSXmKPExsVyMXS5jm795cc
 xBivfcFrcm/Ke3YHRY3vfLvYAxijWzLyk/IoE1oxbd98zFpzgqTh09jR7A+Mk7i5GTg4hgemM
 Eo/7/LoYuTgkBOawSnRvXcAIkpAQKJO439vA2sXIAWQXSXx7UgQTblu9hg3E5hUQlDg58wkLx
 Jx/jBI/n2SC2JwCthL3t24Fi7MJqEp8+XWRCcRmAbJfXfvHCtEbINHb1wO2SljAUeLG9o9gto
 hAuMTDF89ZQe5hFpjCLDFxWjvYDcwCPhJHnqpOYOSfhWT1LIQMSJhZQFOidftvdghbQ2LBnX2
 MELa2xLKFr5kXMLKuYrRIKspMzyjJTczM0TU0MNA1NDTSNTIw1jW0MNVLrNJN1kst1S1PLS7R
 NdRLLC/WK67MTc5J0ctLLdnECAzplILTO3cwTj3wWu8QoyQHk5Iob6/+4xghvqT8lMqMxOKM+
 KLSnNTiQ4wyHBxKEryMwCgREixKTU+tSMvMAcYXTFqCg0dJhFcbJM1bXJCYW5yZDpE6xWjPsf
 v5w7nMHI93PQWSW+4/A5K7QKQQS15+XqqUOO/mS0BtAiBtGaV5cENh6eASo6yUMC8jAwODEE9
 BalFuZgmq/CtGcQ5GJWHeRyBTeDLzSuB2vwI6iwnoLFl2sLNKEhFSUg1MLvJPpy7Q0Pd9+V1Z
 1S6hW8psxTS1os/Cn49lirRIdBme6C3qlD3+5lNOX6UN2/RJbvnmSUeSOCYseKy1uYjt10ahu
 2sOLFzD5/6B1bx/4cymo+lbxB7Oi+dQnSza4b31N/sGqdAlsgflerIblf62x34KkeKf834V59
 tp+au4kkwfZ04u7yhk/LFS81DMxzJWGdN7buVf17D2pN9hjJq6u7Hqro29+pqVW79O8nrTdnj
 2T8ELx46l3p1ss2gvz3aGBMmkLNZZMx6oJYoui0x4u3yb1U2HK2ay/IdfiuY0MfCJhN/0ZT4X
 /+ZA5m+RKzNk9tyJNXc6Ldejffn67ZWtbz5MK9+aHm7Ff6hPTeWGEktxRqKhFnNRcSIAnzGFv
 IIDAAA=
X-Env-Sender: kparal@redhat.com
X-Msg-Ref: server-15.tower-304.messagelabs.com!1558434686!9296463!1
X-Originating-IP: [209.85.167.44]
X-SpamReason: No, hits=0.1 required=7.0 tests=newsletters: ,HTML_50_60,
 HTML_MESSAGE
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17913 invoked from network); 21 May 2019 10:31:27 -0000
Received: from mail-lf1-f44.google.com (HELO mail-lf1-f44.google.com)
 (209.85.167.44)
 by server-15.tower-304.messagelabs.com with AES128-GCM-SHA256 encrypted SMTP;
 21 May 2019 10:31:27 -0000
Received: by mail-lf1-f44.google.com with SMTP id v18so12685700lfi.1
 for <xen-devel@lists.xensource.com>; Tue, 21 May 2019 03:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yQKydE27ni5hufuPLCcH1jj1nAK6FkauVUkC1jY6OTg=;
 b=m1rxDtzRjd1kO/glammMwLQt8fvIBL3elHgUoiluWZ7+gtYIxRKvMqv1idxaQqLDL6
 ZJ3i96Uosai5XgwY873NL3Y2dcYv23Jds2PbN4NPqSZkOlrWjVvYKeytjO0Nb0CDJqzo
 0PGxAxYEGrF9Srj1sD+rY7rRZCK6md6e8ZDzmlF+csBYX915OFV05oLOusmCqpIJCrBm
 foQk/syzDFgY7PlutPjTOKHFtk/MKYPMIvqeXdy0gTnP4rDGhWVgUb+qChd+TazGs3/B
 AvtPdYZafCFjCGxUwXaeF5dQv71a+1C9I44W6+GEZ3LKhSmZqvfv0CgcxUidPz2j20yn
 zOrg==
X-Gm-Message-State: APjAAAV0Hre1xsYZN39OkuDzXK//R6EeKFiZIHjv7vzr2egfCdeXccZv
 GAk0PvwOBOomRZhtF9yYFhMDT5qLMnYOt6z8vk26
X-Google-Smtp-Source: APXvYqwq7LXRx2dNms6PRCQyIpubaruLlnEcvIo3F7xMIB3aIjk1JAeXJkj5AsdBNv8LKUSCobu25AHrgEoHs4gWfCg=
X-Received: by 2002:ac2:5935:: with SMTP id v21mr29336381lfi.117.1558434686097; 
 Tue, 21 May 2019 03:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <1EA56286-DCCA-4FFA-B8A3-A6D4C956A7CF@gmail.com>
In-Reply-To: <1EA56286-DCCA-4FFA-B8A3-A6D4C956A7CF@gmail.com>
From: Kamil Paral <kparal@redhat.com>
Date: Tue, 21 May 2019 12:30:59 +0200
Message-ID: <CA+cBOTfqWiEBTv-w8pbpMP3CHwpUp9v9HhLJurEka2zCKBfPpg@mail.gmail.com>
To: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>
X-Mailman-Approved-At: Tue, 21 May 2019 10:32:04 +0000
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: Adam Williamson <adamwill@fedoraproject.org>, xen-devel@lists.xensource.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: multipart/mixed; boundary="===============6021982401237699571=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6021982401237699571==
Content-Type: multipart/alternative; boundary="000000000000def0270589635954"

--000000000000def0270589635954
Content-Type: text/plain; charset="UTF-8"

On Mon, May 20, 2019 at 7:45 PM Lars Kurth <lars.kurth.xen@gmail.com> wrote:

> @Adam and Fedora Testing & QA:
> any views on my proposal?
> Regards
> Lars
>

Hi Lars,
thanks for your reply. Adam was on a long vacation and he's probably the
most qualified person to reply to you, sorry for not telling you sooner.
Adam is now back, so he should hopefully join the conversation shortly.

Cheers,
Kamil

--000000000000def0270589635954
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, May 20, 2019 at 7:45 PM Lars Kurth &lt;<a href=3D"mailto:lar=
s.kurth.xen@gmail.com">lars.kurth.xen@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div style=3D"overflow-wrap:=
 break-word;">@Adam and Fedora Testing &amp; QA:<div>any views on my propos=
al?</div><div>Regards</div><div>Lars<br></div></div></blockquote><div><br><=
/div>Hi Lars,</div><div class=3D"gmail_quote">thanks for your reply. Adam w=
as on a long vacation and he&#39;s probably the most qualified person to re=
ply to you, sorry for not telling you sooner. Adam is now back, so he shoul=
d hopefully join the conversation shortly.</div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">Cheers,</div><div class=3D"gmail_quote=
">Kamil</div><div class=3D"gmail_quote"><br></div></div>

--000000000000def0270589635954--


--===============6021982401237699571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6021982401237699571==--

