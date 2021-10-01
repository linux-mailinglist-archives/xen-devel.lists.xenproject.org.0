Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D667041F196
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 17:54:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200774.355345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWKqR-0008On-4o; Fri, 01 Oct 2021 15:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200774.355345; Fri, 01 Oct 2021 15:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWKqR-0008MM-0r; Fri, 01 Oct 2021 15:53:07 +0000
Received: by outflank-mailman (input) for mailman id 200774;
 Fri, 01 Oct 2021 15:53:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wCRN=OV=linuxfoundation.org=aweltz@srs-us1.protection.inumbo.net>)
 id 1mWKqP-0008MG-1G
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 15:53:05 +0000
Received: from mail-io1-xd2d.google.com (unknown [2607:f8b0:4864:20::d2d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd0e8980-9b07-4a66-8ada-ff847f3b22f5;
 Fri, 01 Oct 2021 15:53:03 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id b78so12217197iof.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Oct 2021 08:53:03 -0700 (PDT)
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
X-Inumbo-ID: cd0e8980-9b07-4a66-8ada-ff847f3b22f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Dz/fPEdYqX9+LABAefdwyNZbqnTPpSNKVGckoTyTTa8=;
        b=aMp2kteUgmJdwg2O9VraGGnWydWYUOenENknWOP7klMlqLg4/RDBwycMj6EqTkIahB
         skDfMldZetu2+Qu9kKTT6KV3yX6D5jF+SpxTeVugDD93DeYWwhoW7hLxlyugy5DzuZ8+
         XImODqUE1Q8aTgFnULZLFpNZdqMNuVC54xsB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Dz/fPEdYqX9+LABAefdwyNZbqnTPpSNKVGckoTyTTa8=;
        b=lQJHc/jGmklnfbvEc/Pg/G2908kfbaPZhDgd7zgg+wIS6VKfLcTVAvnSfZW2sGPh+o
         JlYc97F3a3vLKMIcJaFiyfclwHPGNBuKwS+AsAKrLuqhXt2jKg/Vs5VX/PPV2X2ABxCw
         u/D5kMTBSDHMnKeC7i9nHPXPQfzIGaEtdzKT/iihN7l3JCKwfuORFdf5m/EiDBnWrUQn
         On9AOk4XQItlcLEiwpy2ofGyzAc8ImkiEvGeHQHs7y8hCA74Z3/2gIqbDiwHq6espdIC
         2dr4RdWFf0SfJMN+h++bnh1LgSUVyUomo3IJ02Fpe/m1TeHsmAiZF+bkUVgREyD+lwNQ
         yL/A==
X-Gm-Message-State: AOAM530+rwnKABXNbmLVWUFT7uCeF46EmlC0wIzdEfrW5z/2fUelzZAO
	+3wAf69/fBwYr5IT9KLwUUFH452D0Xd9JvoXjoVGBw==
X-Google-Smtp-Source: ABdhPJy3SgRPLFpEVUX+8pkI/+R9VMVdZF75NHR6fsIneCc4TPWoGaFQ9dQ3A23VV9+VrGsMZynrFzpEaj1OXKSWw6U=
X-Received: by 2002:a5d:80d7:: with SMTP id h23mr8559247ior.68.1633103582546;
 Fri, 01 Oct 2021 08:53:02 -0700 (PDT)
MIME-Version: 1.0
From: Ashley Weltz <aweltz@linuxfoundation.org>
Date: Fri, 1 Oct 2021 11:52:52 -0400
Message-ID: <CADT4064VW2uG2SfOQmCjGJTmQGgWz=YeAVpS27CQiL-tvW5QqQ@mail.gmail.com>
Subject: Call for agenda items for October 5th Community Call @ 1500 UTC
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
Content-Type: multipart/alternative; boundary="000000000000eb625805cd4c8ed5"

--000000000000eb625805cd4c8ed5
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Our next meeting is this upcoming Tuesday at 1500 UTC.

The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/dcsJegMwUJOPrLTIscYT4bBa/ Please add
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

--000000000000eb625805cd4c8ed5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div><br></div><div>Our next meetin=
g is this upcoming Tuesday at 1500 UTC.=C2=A0</div><div><br></div><div>The =
proposed agenda is in=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/=
dcsJegMwUJOPrLTIscYT4bBa/">https://cryptpad.fr/pad/#/2/pad/edit/dcsJegMwUJO=
PrLTIscYT4bBa/</a>=C2=A0Please add or edit any items to this agenda. Altern=
atively, please feel free to email me directly with agenda items.=C2=A0</di=
v><div><br>Please put your name beside any items if you edit the document.<=
br><br>We will plan to start the meeting 5 minutes past the hour.=C2=A0<br>=
<br>* If you want to be CC&#39;ed please add or remove yourself from the si=
gn-up-sheet at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzih=
PxxAOe6RFPz0sRCf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.f=
r/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a></div><div><br></div><div>A=
gain, please let me know if you have any questions. See you on Tuesday!</di=
v><div><br></div><div>Cheers,</div><div>Ashley</div><div><br></div>-- <br><=
div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature=
"><div dir=3D"ltr">Ashley Weltz, Project Coordinator=C2=A0<div>The Linux Fo=
undation</div><div><a href=3D"mailto:aweltz@linuxfoundation.org" target=3D"=
_blank">aweltz@linuxfoundation.org</a></div></div></div></div>

--000000000000eb625805cd4c8ed5--

