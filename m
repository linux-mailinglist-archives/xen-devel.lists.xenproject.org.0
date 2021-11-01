Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BED441D60
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 16:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219307.380114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ9z-00018V-2Y; Mon, 01 Nov 2021 15:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219307.380114; Mon, 01 Nov 2021 15:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ9y-000162-Vh; Mon, 01 Nov 2021 15:23:42 +0000
Received: by outflank-mailman (input) for mailman id 219307;
 Mon, 01 Nov 2021 15:23:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jqW=PU=linuxfoundation.org=aweltz@srs-us1.protection.inumbo.net>)
 id 1mhZ9w-00015v-WC
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 15:23:41 +0000
Received: from mail-io1-xd2e.google.com (unknown [2607:f8b0:4864:20::d2e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c41e33a-ee85-4f40-abfb-acf8e72185ae;
 Mon, 01 Nov 2021 15:23:39 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id g8so20654597iob.10
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 08:23:39 -0700 (PDT)
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
X-Inumbo-ID: 9c41e33a-ee85-4f40-abfb-acf8e72185ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=D5LS2FAkEdHeDnKbJfOu+RwohJh4dqDI9eCt0HGi+yU=;
        b=DSx+kkMgBZOThew1hXI3oRPDiLv/qd5EKgJ9TC3yZj10ZoVdJR1seUalx8kQEsVz0P
         CCmyJgozbcYidhkNJEg9VvQ4jn7cxxTGKnIVfqYpq8NRjK8Z/kvLP2f2DfrEt4gz4LkA
         aZym0FpH/WEgl8j00Pcg008kpKYkYnVS2R+24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=D5LS2FAkEdHeDnKbJfOu+RwohJh4dqDI9eCt0HGi+yU=;
        b=FHJHCnwM4PgBDqp0T1DNjzQzROTGgpexQFExnZFVWxZy3ObiAGw1HCU5mA+mBa24FL
         lrlKeKzkdHjDx/MyibcfJRNkOcoXUweSNBDprYiHh7wKawCLfiFHP7T9K8QeOEG6F4JM
         20WV5en1dnJb3TwtxBor/1LISFAEndsyztfOxNDXG53JrcL6zexRO2nNaadDP/TsTdtE
         FlyghlbQ3VwWxtYSv3Mx7Zo2Z9cpATKntLmMTouBEU7tGf/QQs9pGmUVmRiCb/BgpsyD
         dxYfhma5hM0MXV7ZUZQdKdU+X2VirzWzMcJynC+OFV4FM0CkrTXIx2df43zG0VUALyqg
         x/KA==
X-Gm-Message-State: AOAM533jR8Ke7F0BAcjvuDm+/7/IseOaBfSvSNQQt5aD1eUrokRT5xFI
	TvI32dsFtrT9OU4y6/r6qfcMQ4RfdnJNpa5E02/EmQ==
X-Google-Smtp-Source: ABdhPJwJ8aT6tE4jX2FhgItga64Vezn6lrKzuYxNIIaeJM7bClouiHZ1faFLRw5AzKM4mLShBxrTQH+Oqb28gytiHb8=
X-Received: by 2002:a05:6638:2727:: with SMTP id m39mr22554670jav.125.1635780219269;
 Mon, 01 Nov 2021 08:23:39 -0700 (PDT)
MIME-Version: 1.0
From: Ashley Weltz <aweltz@linuxfoundation.org>
Date: Mon, 1 Nov 2021 11:23:23 -0400
Message-ID: <CADT4064BkNr6W-6Y2LXCPW4wa+GQNzYHEW2EQRaoymrYPwfUXA@mail.gmail.com>
Subject: Call for agenda items for November 2nd Community Call @ 1500 UTC
To: amit@infradead.org, andrew.cooper3@citrix.com, Artem_Mygaiev@epam.com, 
	ash.j.wilding@gmail.com, ben@exotanium.io, bobby.eshleman@gmail.com, 
	brendank310@gmail.com, brian.woods@xilinx.com, cardoe@cardoe.com, 
	christopher.w.clark@gmail.com, Corey Minyard <cminyard@mvista.com>, 
	daniel.kiper@oracle.com, deepthi.m@ltts.com, dpsmith@apertussolutions.com, 
	dwmw@amazon.co.uk, edgar.iglesias@xilinx.com, Ian.Jackson@citrix.com, 
	insurgo@riseup.net, intel-xen@intel.com, Jarvis.Roach@dornerworks.com, 
	Jeff.Kubascik@dornerworks.com, jgross@suse.com, john.ji@intel.com, 
	julien@xen.org, kevin.pearson@ortmanconsulting.com, Matt.Spencer@arm.com, 
	=?UTF-8?Q?Mirela_Simonovi=C4=87?= <mirela.simonovic@aggios.com>, 
	oleksandr_andrushchenko@epam.com, oleksandr_tyshchenko@epam.com, 
	olivier.lambert@vates.fr, pdurrant@amazon.com, persaur@gmail.com, 
	piotr.krol@3mdeb.com, Rahul.Singh@arm.com, rianquinn@gmail.com, 
	rob.townley@gmail.com, robin.randhawa@arm.com, roger.pau@citrix.com, 
	scottwd@gmail.com, sergey.dyasli@citrix.com, sstabellini@kernel.org, 
	Stewart.Hildebrand@dornerworks.com, tamas.k.lengyel@gmail.com, 
	varadgautam@gmail.com, volodymyr_babchuk@epam.com, wl@xen.org
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000e685ac05cfbbc20d"

--000000000000e685ac05cfbbc20d
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Our next meeting is tomorrow at 1500 UTC.

The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/fsdoZMp0ZKERXS-2-VwTPzJ0/. Please add
or edit any items to this agenda. Alternatively, please feel free to email
me directly with agenda items.

Please put your name beside any items if you edit the document.

We will plan to start the meeting 5 minutes past the hour.

* If you want to be CC'ed please add or remove yourself from the
sign-up-sheet at
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

Again, please let me know if you have any questions. See you on Tuesday!

Cheers,
Ashley

-- 
Ashley Weltz, Project Coordinator
The Linux Foundation
aweltz@linuxfoundation.org

--000000000000e685ac05cfbbc20d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div><div>Our next meeting is t=
omorrow at 1500 UTC.=C2=A0</div><div><br></div><div>The proposed agenda is =
in=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/fsdoZMp0ZKERXS-2-Vw=
TPzJ0/">https://cryptpad.fr/pad/#/2/pad/edit/fsdoZMp0ZKERXS-2-VwTPzJ0/</a>.=
 Please add or edit any items to this agenda. Alternatively, please feel fr=
ee to email me directly with agenda items.=C2=A0</div><div><br>Please put y=
our name beside any items if you edit the document.<br><br>We will plan to =
start the meeting 5 minutes past the hour.=C2=A0<br><br>* If you want to be=
 CC&#39;ed please add or remove yourself from the sign-up-sheet at=C2=A0<a =
href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" rel=
=3D"noreferrer" target=3D"_blank">https://cryptpad.fr/pad/#/2/pad/edit/D9vG=
zihPxxAOe6RFPz0sRCf+/</a></div><div><br></div><div>Again, please let me kno=
w if you have any questions. See you on Tuesday!</div><div><br></div><div>C=
heers,</div><div>Ashley</div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">As=
hley Weltz, Project Coordinator=C2=A0<div>The Linux Foundation</div><div><a=
 href=3D"mailto:aweltz@linuxfoundation.org" target=3D"_blank">aweltz@linuxf=
oundation.org</a></div></div></div></div></div>

--000000000000e685ac05cfbbc20d--

