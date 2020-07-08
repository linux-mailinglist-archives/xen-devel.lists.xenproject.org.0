Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37882217EAA
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 06:58:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt29e-0006Ji-9W; Wed, 08 Jul 2020 04:57:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2zOC=AT=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jt29c-0006Jd-SH
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 04:57:57 +0000
X-Inumbo-ID: 96195ac6-c0d7-11ea-bb8b-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 96195ac6-c0d7-11ea-bb8b-bc764e2007e4;
 Wed, 08 Jul 2020 04:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594184275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=smbKjRsU5i3KhKg3QbXzYi2KAz29ytP0Ea1NEY02NP8=;
 b=PtTPUP8GHXGdumVac5oiLLMZd6SPW2UMnfgQAPOdEgCpGaHPbFVZV6nx3Cza/VNJ1YLeIh
 6vbITakfC7OlU81+exfkeTQH80Wav3kjO7cjjm1o++kRAnO0Psxvx6Kp6GlHFCZVjrEU+v
 Kh+POpDqU3TXlY9IBLwbLpAu3NUmeHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-Pw-148vnOlaI8JRnwwDe1w-1; Wed, 08 Jul 2020 00:57:53 -0400
X-MC-Unique: Pw-148vnOlaI8JRnwwDe1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C50A11005510;
 Wed,  8 Jul 2020 04:57:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 676E271678;
 Wed,  8 Jul 2020 04:57:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B747E1132FD2; Wed,  8 Jul 2020 06:57:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] trivial: Remove trailing whitespaces
References: <20200706162300.1084753-1-dinechin@redhat.com>
 <20200707102510.GF2649462@redhat.com>
Date: Wed, 08 Jul 2020 06:57:32 +0200
In-Reply-To: <20200707102510.GF2649462@redhat.com> ("Daniel P. =?utf-8?Q?B?=
 =?utf-8?Q?errang=C3=A9=22's?=
 message of "Tue, 7 Jul 2020 11:25:10 +0100")
Message-ID: <878sfu4n9f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, xen-devel@lists.xenproject.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Jul 06, 2020 at 06:23:00PM +0200, Christophe de Dinechin wrote:
>> There are a number of unnecessary trailing whitespaces that have
>> accumulated over time in the source code. They cause stray changes
>> in patches if you use tools that automatically remove them.
>>=20
>> Tested by doing a `git diff -w` after the change.
>>=20
>> This could probably be turned into a pre-commit hook.

See .git/hooks/pre-commit.sample.

Expected test output is prone to flunk the whitespace test.  One
solution is to strip trailing whitespace from test output.

> scripts/checkpatch.pl ought to be made to check it.
>
>>=20
>> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
>> ---
[...]
>>  78 files changed, 440 insertions(+), 440 deletions(-)
>
> The cleanup is a good idea, however, I think it is probably better to
> split the patch approx into subsystems. That will make it much easier
> to cherry-pick for people doing backports.

I doubt that's worth the trouble.

Acked-by: Markus Armbruster <armbru@redhat.com>


