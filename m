Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CDF3BD45
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 22:01:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQQm-0002hk-IE; Mon, 10 Jun 2019 19:58:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+LYk=UJ=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1haQQl-0002hf-34
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:58:11 +0000
X-Inumbo-ID: 1187e262-8bba-11e9-8980-bc764e045a96
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1187e262-8bba-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 19:58:09 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 21D93A21DF;
 Mon, 10 Jun 2019 21:58:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 1BBACA2167;
 Mon, 10 Jun 2019 21:58:07 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id RpLQvEU_2QuM; Mon, 10 Jun 2019 21:58:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 65F14A1BBE;
 Mon, 10 Jun 2019 21:58:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id VQ12WINW185l; Mon, 10 Jun 2019 21:58:06 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3EC42A1B56;
 Mon, 10 Jun 2019 21:58:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 3BBF1216B6;
 Mon, 10 Jun 2019 21:57:36 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id R0h6tXVrwM0A; Mon, 10 Jun 2019 21:57:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 248F521706;
 Mon, 10 Jun 2019 21:57:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id RpUKPz1GIZKN; Mon, 10 Jun 2019 21:57:35 +0200 (CEST)
Received: from [195.187.238.217] (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 0112A216B6;
 Mon, 10 Jun 2019 21:57:34 +0200 (CEST)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <1050197223.47376247.1559909190275.JavaMail.zimbra@cert.pl>
 <20190610094143.GA30852@perard.uk.xensource.com>
From: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
Openpgp: preference=signencrypt
Autocrypt: addr=michal.leszczynski@cert.pl; keydata=
 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
 pnKSUZgLdIxAmMNsRA==
Message-ID: <edf0eaff-2a00-b4a7-8ed9-2a1d8975264e@cert.pl>
Date: Mon, 10 Jun 2019 21:57:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610094143.GA30852@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Relevance of global lock (/var/lock/xl) in xl tool
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
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============1502503141910297454=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--===============1502503141910297454==
Content-Type: multipart/alternative;
 boundary="------------656EC655B41CDEA7C4511329"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------656EC655B41CDEA7C4511329
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I've tested the scenario with restoring too many domains having lock
commented out. It turns out that in case when there is no memory left
for XEN to allocate, all pending /xl restore/ commands will simply fail
with an internal error.

As far as I understand, it's not going to do any damage unless I request
too much memory?

If so, then there is some place for improvement, i.e. to make xl acquire
the lock, allocate memory, release the lock and then start restoring the
domain state. Maybe I could provide some pull request if I would manage
to implement such behavior.


Best regards,
Micha=C5=82 Leszczy=C5=84ski


On 10.06.2019 11:41, Anthony PERARD wrote:
> On Fri, Jun 07, 2019 at 02:06:30PM +0200, Micha=C5=82 Leszczy=C5=84ski =
wrote:
>> Hello,
> Hi,
>
>> when either "xl restore" or "xl create" command is invoked, a global l=
ock is acquired here:
>>
>> https://github.com/xen-project/xen/blob/master/tools/xl/xl_vmcontrol.c=
#L876
>>
>> I'm trying to figure out what is the exact importance of this lock? Is=
 it really critical for XL operation? I have a pretty powerful machine on=
 which I want to run a few dozen of short-lived VMs. This lock is serious=
ly slowing me down, not letting to restore more than one domain at once. =
Turns out that everything still works fine (and much faster) when I comme=
nt-out the lock in the abovementioned place, but I'm not sure if it's a c=
orrect impression.
>>
>> Does anyone know if there is a situation in which Xen would screw up w=
ithout this lock?
> Here is the reason for the lock:
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3Dea4dce89d478=
d62341cd2f9d8944e215f7086144
>
>   xl: free memory before building a domain
>   Free the needed amount of memory before proceeding with the domain
>   build.
>   Use a filelock to prevent other xl instances from conflicting during
>   this operation.
>
> So there are probably configurations where the lock isn't useful, or
> there are better ways to reserve memory for domain creation.
>
--=20
Pozdrawiam
Micha=C5=82 Leszczy=C5=84ski
CERT Polska/NASK
+48 532 461 124


--------------656EC655B41CDEA7C4511329
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <p>Hello,</p>
    <p>I've tested the scenario with restoring too many domains having
      lock commented out. It turns out that in case when there is no
      memory left for XEN to allocate, all pending <i>xl restore</i>
      commands will simply fail with an internal error.</p>
    <p>As far as I understand, it's not going to do any damage unless I
      request too much memory?</p>
    <p>If so, then there is some place for improvement, i.e. to make xl
      acquire the lock, allocate memory, release the lock and then start
      restoring the domain state. Maybe I could provide some pull
      request if I would manage to implement such behavior.<br>
    </p>
    <p><br>
    </p>
    <p>Best regards,<br>
      Micha=C5=82 Leszczy=C5=84ski</p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 10.06.2019 11:41, Anthony PERARD
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20190610094143.GA30852@perard.uk.xensource.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Jun 07, 2019 at 02:0=
6:30PM +0200, Micha=C5=82 Leszczy=C5=84ski wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Hello,
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Hi,

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">when either "xl restore" o=
r "xl create" command is invoked, a global lock is acquired here:

<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/xen-project=
/xen/blob/master/tools/xl/xl_vmcontrol.c#L876">https://github.com/xen-pro=
ject/xen/blob/master/tools/xl/xl_vmcontrol.c#L876</a>

I'm trying to figure out what is the exact importance of this lock? Is it=
 really critical for XL operation? I have a pretty powerful machine on wh=
ich I want to run a few dozen of short-lived VMs. This lock is seriously =
slowing me down, not letting to restore more than one domain at once. Tur=
ns out that everything still works fine (and much faster) when I comment-=
out the lock in the abovementioned place, but I'm not sure if it's a corr=
ect impression.

Does anyone know if there is a situation in which Xen would screw up with=
out this lock?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Here is the reason for the lock:
<a class=3D"moz-txt-link-freetext" href=3D"https://xenbits.xen.org/gitweb=
/?p=3Dxen.git;a=3Dcommit;h=3Dea4dce89d478d62341cd2f9d8944e215f7086144">ht=
tps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3Dea4dce89d478d623=
41cd2f9d8944e215f7086144</a>

  xl: free memory before building a domain
  Free the needed amount of memory before proceeding with the domain
  build.
  Use a filelock to prevent other xl instances from conflicting during
  this operation.

So there are probably configurations where the lock isn't useful, or
there are better ways to reserve memory for domain creation.

</pre>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Pozdrawiam
Micha=C5=82 Leszczy=C5=84ski
CERT Polska/NASK
+48 532 461 124</pre>
  </body>
</html>

--------------656EC655B41CDEA7C4511329--


--===============1502503141910297454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1502503141910297454==--

