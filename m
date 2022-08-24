Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B4C59FFEB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 18:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392894.631515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQtiJ-0007oa-ET; Wed, 24 Aug 2022 16:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392894.631515; Wed, 24 Aug 2022 16:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQtiJ-0007mG-BN; Wed, 24 Aug 2022 16:58:47 +0000
Received: by outflank-mailman (input) for mailman id 392894;
 Wed, 24 Aug 2022 16:58:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLoP=Y4=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1oQtiH-0007mA-Oy
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 16:58:45 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03424e19-23ce-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 18:58:44 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id a22so22836521edj.5
 for <xen-devel@lists.xenproject.org>; Wed, 24 Aug 2022 09:58:44 -0700 (PDT)
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
X-Inumbo-ID: 03424e19-23ce-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=lvoSgRhX/hM984Dpk6jU2OyZt21ntG02d4eiR1/0+VA=;
        b=phMP3IztTh8uDiEacRA41+PFn2bxHyxl6Gke5lBz2zyktfJo8ZeRa/dbd6hO9VFwji
         QnE3uMfh7JiRfS0NYzVAZiyv/8W5z1QkrpbNHQNQI69um2KkU/mv3/kt97Qpkge6im80
         DfC/YQs3EOG+vnevdneMFbJ14M2/eQlRiQSnCbEo0Jnbp7SFULygeCW6rChI63f7oSaF
         QJLUFY44iIC69tLUwDvWJ/XWbS6ZaTIRbRum3L+dST7+apUJgY+BljjzAUAipDVyQAdL
         Br8sdlhbt8h7OQiSGDXTDQERcuHxSvMb3knUQhi4sGbcK9657Zh+gVfMKtlo0RTadXAI
         rgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=lvoSgRhX/hM984Dpk6jU2OyZt21ntG02d4eiR1/0+VA=;
        b=kVKOCpa3djEHiO4ohhcPlse3lN6638Jxy5bqNsZa/d9H1Yp45LYcIoSV3/gDgH3Fba
         GoodZIMx6QtVDD2dKarPh55komF0Y8GqQNKv1iPL7N8fzpc4IAAztWwNPRE4ok4oH9gf
         H12Ak/4uJr7ZzdLXQGQmbKXfyFkUdlDHOyehZwrYvljvn2aGvd8zUxoReEqnnjWNBHIs
         9Y49IDqXT5PMfabXTP3V/YhExVrjNGktKmwlJEfXeWzliqNEsT1tdhbMxIwFCAlO6TXT
         JE4bUy9nkarzY1hq3v+jsXEOY7Ra/Lkl9pm6I0qnaODk1iLRgHu1Y/z/MdtbQEfBIK39
         UMDA==
X-Gm-Message-State: ACgBeo2ZdOyDG2pgbFLFlWcOHU/IEnwwGo1yCytyU2Y8BGcw4hI4i/Dz
	yjUxMNmJUw9/mEY9yLp7FDrYyWB+c5gDlEw9+0s=
X-Google-Smtp-Source: AA6agR73vvdhz2gioDBacL1TKdnge0n2f8pz2jsTiUqzMnL6cb6dveCeu9yvnr4XrGbm3kcFmSWbOzOlIO1Oo8kRkfk=
X-Received: by 2002:a05:6402:5388:b0:435:71b:5d44 with SMTP id
 ew8-20020a056402538800b00435071b5d44mr8029327edb.364.1661360323963; Wed, 24
 Aug 2022 09:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <CALAP8f_L0ggPP=a6Xrywge2-ZTa3msqj0UKN8L66cC6ypNOAfw@mail.gmail.com>
 <2992A27C-B9F7-43BB-A7EA-CC5A3C8B5B22@arm.com>
In-Reply-To: <2992A27C-B9F7-43BB-A7EA-CC5A3C8B5B22@arm.com>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Wed, 24 Aug 2022 22:27:30 +0530
Message-ID: <CALAP8f_=NztOC9FKYnrCyknOM4jf27cRqjJ9+7UqOEH6qCAD8Q@mail.gmail.com>
Subject: Re: Porting xen on rpi4
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>
Content-Type: multipart/alternative; boundary="000000000000f42f0305e6ff97ed"

--000000000000f42f0305e6ff97ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

Thanks for your response!

I builded the guest image on yocto kirkstone source which has FSTYPE ext3.
Guest image generated is xen-guest-image-minimal-raspberrypi4-64.ext3.
Below is the content of guest.cfg file

*   kernel =3D "/home/root/Image" *
*   cmdline =3D "console=3Dhvc0 earlyprintk=3Dxen sync_console root=3D/dev/=
xvda" *
*   memory =3D "256" *
*   name =3D "guest1" *
*   vcpus =3D 1 *
*   serial=3D"pty" *
*   disk =3D [ 'phy:/dev/loop0,xvda,w' ] *
*   vif=3D[ 'mac=3D00:11:22:66:88:22,bridge=3Dxenbr0,type=3Dnetfront', ]*

I am trying to mount xen-guest-image-minimal-raspberrypi4-64.ext3 to a
virtual device & then will run the guest VM by command "xl create -c
guest.cfg". But facing issue while trying to mount.

Regards,
Vipul Kumar

On Wed, Aug 24, 2022 at 8:06 PM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi Vipul,
>
> > On 24 Aug 2022, at 15:16, Vipul Suneja <vsuneja63@gmail.com> wrote:
> >
> > Hi,
> >
> > I am porting xen hypervisor on rpi4 with yocto kirkstone sources.
> Followed the basic steps to build xen-image-minimal &
> xen-guest-image-minimal. I could flash sd card with xen minimal image &
> could see dom0 up. I copied "Image", "xen-guest-image-minimal" .ext3 file=
 &
> guest.cfg to "/home/root". After that created a bridge with below step:
> >
> > killall -SIGUSR2 udhcpc
> > brctl addbr xenbr0
> > brctl addif xenbr0 eth0
> > killall udhcpc
> > udhcpc -R -b -p /var/run/udhcpc.xenbr0.pid -i xenbr0
> >
> > Could see the xenbr0 interface up.
> > After that while mounting the guest file system it shows no such file o=
r
> directory but the file is already there.
> >
> > [23:40:15] <Guest9046> root@raspberrypi4-64:~# ls -l
> > [23:40:15] <Guest9046> -rw-r--r--    1 root     root      24652288 Mar
> 9 12:36 Image
> > [23:40:15] <Guest9046> -rw-r--r--    1 root     root           247 Mar
> 9 12:37 guest1.cfg
> > [23:40:15] <Guest9046> -rw-r--r--    1 root     root     868220928 Mar
> 9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3
> > [23:40:15] <Guest9046> root@raspberrypi4-64:~# chmod 0777
> xen-guest-image-minimal-raspberrypi4-64.ext3
> > [23:40:15] <Guest9046> root@raspberrypi4-64:~# ls -l
> > [23:40:15] <Guest9046> -rw-r--r--    1 root     root      24652288 Mar
> 9 12:36 Image
> > [23:40:15] <Guest9046> -rw-r--r--    1 root     root           247 Mar
> 9 12:37 guest1.cfg
> > [23:40:15] <Guest9046> -rwxrwxrwx    1 root     root     868220928 Mar
> 9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3
> > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup /dev/loop0
> xen-guest-image-minimal-raspberrypi4-64.ext3
> > [23:40:15] <Guest9046> losetup:
> xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or directory
> > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup /dev/loop0
> /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3
> > [23:40:15] <Guest9046> losetup:
> /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
> directory
> > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
> > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
> > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
> > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup /dev/loop0
> /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3
> > [23:40:15] <Guest9046> losetup:
> /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
> directory
>
> Why do you want to mount the file system ?
>
> Anyway this is not related to Xen, I guess you could start without xen an=
d
> still not manage to mount the file like that (linux configuration issue ?=
)
>
> What is the content of you guest.cfg
> How do you want to pass the guest root file system ?
>
> Yocto should actually generate an img file and you could use it by having
> something like this in your guest.cfg:
> disk=3D["file:/home/root/guest1.img,xvda,w=E2=80=9D]
>
> Cheers
> Bertrand
>
> >
> > Any input on this issue will be really helpful, expecting your response=
.
> >
> > Thanks & Regards,
> > Vipul Kumar
>
>

--000000000000f42f0305e6ff97ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bertrand,<div><br></div><div>Thanks for your response!<=
/div><div><br></div><div>I builded the guest image on yocto kirkstone sourc=
e which has FSTYPE ext3. Guest image generated is xen-guest-image-minimal-r=
aspberrypi4-64.ext3.</div><div>Below is the content of guest.cfg file</div>=
<div><br></div><div><b>=C2=A0 =C2=A0kernel =3D &quot;/home/root/Image&quot;=
=C2=A0</b></div><div><b>=C2=A0 =C2=A0cmdline =3D &quot;console=3Dhvc0 early=
printk=3Dxen sync_console root=3D/dev/xvda&quot;=C2=A0</b></div><div><b>=C2=
=A0 =C2=A0memory =3D &quot;256&quot;=C2=A0</b></div><div><b>=C2=A0 =C2=A0na=
me =3D &quot;guest1&quot;=C2=A0</b></div><div><b>=C2=A0 =C2=A0vcpus =3D 1=
=C2=A0</b></div><div><b>=C2=A0 =C2=A0serial=3D&quot;pty&quot;=C2=A0</b></di=
v><div><b>=C2=A0 =C2=A0disk =3D [ &#39;phy:/dev/loop0,xvda,w&#39; ]=C2=A0</=
b></div><div><b>=C2=A0 =C2=A0vif=3D[ &#39;mac=3D00:11:22:66:88:22,bridge=3D=
xenbr0,type=3Dnetfront&#39;, ]</b><br></div><div><br></div><div>I am trying=
 to mount xen-guest-image-minimal-raspberrypi4-64.ext3 to a virtual device =
&amp; then will run the guest VM by command &quot;xl create -c guest.cfg&qu=
ot;. But facing issue while trying to mount.=C2=A0</div><div><br></div><div=
>Regards,</div><div>Vipul Kumar</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 8:06 PM Bertra=
nd Marquis &lt;<a href=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis=
@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hi Vipul,<br>
<br>
&gt; On 24 Aug 2022, at 15:16, Vipul Suneja &lt;<a href=3D"mailto:vsuneja63=
@gmail.com" target=3D"_blank">vsuneja63@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; I am porting xen hypervisor on rpi4 with yocto kirkstone sources. Foll=
owed the basic steps to build xen-image-minimal &amp; xen-guest-image-minim=
al. I could flash sd card with xen minimal image &amp; could see dom0 up. I=
 copied &quot;Image&quot;, &quot;xen-guest-image-minimal&quot; .ext3 file &=
amp; guest.cfg to &quot;/home/root&quot;. After that created a bridge with =
below step:<br>
&gt; <br>
&gt; killall -SIGUSR2 udhcpc<br>
&gt; brctl addbr xenbr0<br>
&gt; brctl addif xenbr0 eth0<br>
&gt; killall udhcpc<br>
&gt; udhcpc -R -b -p /var/run/udhcpc.xenbr0.pid -i xenbr0 <br>
&gt; <br>
&gt; Could see the xenbr0 interface up.<br>
&gt; After that while mounting the guest file system it shows no such file =
or directory but the file is already there.<br>
&gt; <br>
&gt; [23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:~# ls -l<br>
&gt; [23:40:15] &lt;Guest9046&gt; -rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=
=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 24652288 Mar=C2=A0 9 12:36 Image<br>
&gt; [23:40:15] &lt;Guest9046&gt; -rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=
=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0247 Mar=C2=A0 9 12:3=
7 guest1.cfg<br>
&gt; [23:40:15] &lt;Guest9046&gt; -rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=
=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0868220928 Mar=C2=A0 9 12:39 xen-guest-ima=
ge-minimal-raspberrypi4-64.ext3<br>
&gt; [23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:~# chmod 0777 xen-gu=
est-image-minimal-raspberrypi4-64.ext3<br>
&gt; [23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:~# ls -l<br>
&gt; [23:40:15] &lt;Guest9046&gt; -rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=
=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 24652288 Mar=C2=A0 9 12:36 Image<br>
&gt; [23:40:15] &lt;Guest9046&gt; -rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=
=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0247 Mar=C2=A0 9 12:3=
7 guest1.cfg<br>
&gt; [23:40:15] &lt;Guest9046&gt; -rwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=
=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0868220928 Mar=C2=A0 9 12:39 xen-guest-ima=
ge-minimal-raspberrypi4-64.ext3<br>
&gt; [23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:~# losetup /dev/loop=
0 xen-guest-image-minimal-raspberrypi4-64.ext3<br>
&gt; [23:40:15] &lt;Guest9046&gt; losetup: xen-guest-image-minimal-raspberr=
ypi4-64.ext3: No such file or directory<br>
&gt; [23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:~# losetup /dev/loop=
0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3<br>
&gt; [23:40:15] &lt;Guest9046&gt; losetup: /home/root/xen-guest-image-minim=
al-raspberrypi4-64.ext3: No such file or directory<br>
&gt; [23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:~#<br>
&gt; [23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:~#<br>
&gt; [23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:~#<br>
&gt; [23:40:15] &lt;Guest9046&gt; root@raspberrypi4-64:~# losetup /dev/loop=
0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3<br>
&gt; [23:40:15] &lt;Guest9046&gt; losetup: /home/root/xen-guest-image-minim=
al-raspberrypi4-64.ext3: No such file or directory<br>
<br>
Why do you want to mount the file system ?<br>
<br>
Anyway this is not related to Xen, I guess you could start without xen and =
still not manage to mount the file like that (linux configuration issue ?)<=
br>
<br>
What is the content of you guest.cfg<br>
How do you want to pass the guest root file system ?<br>
<br>
Yocto should actually generate an img file and you could use it by having s=
omething like this in your guest.cfg:<br>
disk=3D[&quot;file:/home/root/guest1.img,xvda,w=E2=80=9D]<br>
<br>
Cheers<br>
Bertrand<br>
<br>
&gt; <br>
&gt; Any input on this issue will be really helpful, expecting your respons=
e.<br>
&gt; <br>
&gt; Thanks &amp; Regards,<br>
&gt; Vipul Kumar<br>
<br>
</blockquote></div>

--000000000000f42f0305e6ff97ed--

