Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38F25A0C01
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 10:57:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393176.631956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR8g3-0000mS-OG; Thu, 25 Aug 2022 08:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393176.631956; Thu, 25 Aug 2022 08:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR8g3-0000ji-LS; Thu, 25 Aug 2022 08:57:27 +0000
Received: by outflank-mailman (input) for mailman id 393176;
 Thu, 25 Aug 2022 08:57:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xLAc=Y5=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1oR8g1-0000jb-U7
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 08:57:26 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef9beeae-2453-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 10:57:24 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id r4so25196755edi.8
 for <xen-devel@lists.xenproject.org>; Thu, 25 Aug 2022 01:57:24 -0700 (PDT)
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
X-Inumbo-ID: ef9beeae-2453-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=t7NbUbLs7KUV82WeXlCEUvoWqgq30ykZRNuQB6PRvK4=;
        b=C3VpZ8IAMdFYFMoxyjuT18Deg71IBEEmO9UXvqVKNUC9D5f3iHOdMT9dTjKAvH00DI
         StlEfBIKy0FZ5RtStAtCKlaTt5bumEfLuPYPeVCdjcwZ3SC2049FHnacmkzKgHvWCbfw
         Zar2PBGjxMHY/jhb9amk7d/jw4tWXii1gSniJAUJaKi2syrIZL+PGDiTtClJxB5uFnwg
         J+9BcIEhoNkjE3uqFCrw7DPUm1FNw/KRCkJu+ehVsH2LLbLzbdgTM6a5kCqhTOaodDVK
         MKtKHP25Z8/HuXWe8v9xUv4IDcEc/kTLsBHtwihdWZM8b9AZ4dEXk3rMrfQ7kzeyeOLJ
         QSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=t7NbUbLs7KUV82WeXlCEUvoWqgq30ykZRNuQB6PRvK4=;
        b=bJr11qso1NPQ4S9sadmM6uAGPW4jjtBP2lY6P6k2BQ+f3KYs7JhXURo+IfUlORYpw7
         Z3XnrAFDk4T1o6ssLEtGkPSBf5PuDO1RbOR9SqsYIbE879Gn8UEhYwTxi1mAV0sbc2Z9
         MrmPHpY06Xh8Zo5PkknZv1w11RNf/JgpbQyq1XRwnf9i2a1FDVyhK9s1CeO+JHks39SB
         A1NWA0cN0Gzp5LxGekRxrxtGy4GMVrA7FVuwRsmaq34yBHy2/ioqnpcg7fJaOEPj+n1V
         XqHNIer0bJ9nYgfAkd8cEAdKAzksFwuRTkcHcMbYtlhlhYVLN90eZoyN156MS1HavXS6
         ASYg==
X-Gm-Message-State: ACgBeo0k6gJ2AKbD+Q25BJGg0yFm+4zKCrBgAVi3hdbRwl0d5nXMICYx
	XpC9ocJTxKbUGoyaPpDHR7wTuO5LqA6qBpgj4TQ=
X-Google-Smtp-Source: AA6agR5QlAJhNj/TG7uam5q5vYDfA9a5KKnv479zcoZRYCBHwJYYFEy1MLCYHt/itjS4wdVQ2mEM789UM2RN5T/Auaw=
X-Received: by 2002:a05:6402:5508:b0:43a:896e:8edd with SMTP id
 fi8-20020a056402550800b0043a896e8eddmr2291403edb.203.1661417843791; Thu, 25
 Aug 2022 01:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <CALAP8f_L0ggPP=a6Xrywge2-ZTa3msqj0UKN8L66cC6ypNOAfw@mail.gmail.com>
 <2992A27C-B9F7-43BB-A7EA-CC5A3C8B5B22@arm.com> <CALAP8f_=NztOC9FKYnrCyknOM4jf27cRqjJ9+7UqOEH6qCAD8Q@mail.gmail.com>
 <alpine.DEB.2.22.394.2208241401110.15247@ubuntu-linux-20-04-desktop>
 <CALAP8f-3jcGen82DaVrxRTF3TMDVMkLJA5Nsxu=HDYFDqTOOdQ@mail.gmail.com> <62627CF0-8594-4DEB-9F6C-37AECDE6B77B@arm.com>
In-Reply-To: <62627CF0-8594-4DEB-9F6C-37AECDE6B77B@arm.com>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Thu, 25 Aug 2022 14:26:10 +0530
Message-ID: <CALAP8f_JqwRcPM9_xLT6U6xeHLDVNO5itA0ELC_pZ-xyUyKqtQ@mail.gmail.com>
Subject: Re: Porting xen on rpi4
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>
Content-Type: multipart/alternative; boundary="0000000000006718c105e70cfc46"

--0000000000006718c105e70cfc46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

Thanks!

No, I couldn't see /dev/loop0. Can you please guide me to create it?

I didn't change dom0 configurations, it's default generated by yocto.

I will append this "IMAGE_FSTYPES:append =3D " wic.gz=E2=80=9D" in local.co=
nf & will
update you.

Regards,
Vipul Kumar

On Thu, Aug 25, 2022 at 1:25 PM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi Vipul,
>
> > On 25 Aug 2022, at 08:31, Vipul Suneja <vsuneja63@gmail.com> wrote:
> >
> > Hi Stefano,
> >
> > Thanks!
> >
> > As suggested, I changed the guest1.cfg file. Below are the contents of
> config file
> >
> > kernel =3D "/home/root/Image"
> > cmdline =3D "console=3Dhvc0 earlyprintk=3Dxen sync_console root=3D/dev/=
xvda"
> > memory =3D "1024"
> > name =3D "guest1"
> > vcpus =3D 1
> > serial=3D"pty"
> > disk =3D [
> 'file:/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3,xvda,w' ]
> > vif=3D[ 'mac=3D00:11:22:66:88:22,bridge=3Dxenbr0,type=3Dnetfront', ]
> >
> > Its failing with below logs:
> >
> > root@raspberrypi4-64:~# xl create -c guest1.cfg
> > Parsing config from guest1.cfg
> > Invalid parameter `type'.
> > libxl: error: libxl_exec.c:117:libxl_report_child_exitstatus:
> /etc/xen/scripts/block add [742] exited with error status 1
> > libxl: error: libxl_device.c:1265:device_hotplug_child_death_cb: script=
:
> losetup /dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ext=
3
> failed
> > libxl: error: libxl_create.c:1643:domcreate_launch_dm: Domain 1:unable
> to add disk devices
> > libxl: error: libxl_exec.c:117:libxl_report_child_exitstatus:
> /etc/xen/scripts/block remove [793] exited with error status 1
> > libxl: error: libxl_device.c:1265:device_hotplug_child_death_cb: script=
:
> /etc/xen/scripts/block failed; error detected.
> > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
> 1:Non-existant domain
> > libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain
> 1:Unable to destroy guest
> > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
> 1:Destruction of domain failed
>
> I think you have a loop issue.
>
> Could you check if /dev/loop0 exists ?
>
> Did you change something on the dom0 linux configuration generated by
> Yocto ?
>
> We are using Yocto on RPI4 here without any issue like that, only
> difference with
> your setup is that we generate a wic image to have a real disk image
> instead of
> using the ext3/ext4 one.
>
> Should be possible to do the same on your side by adding the following in
> local.conf:
> IMAGE_FSTYPES:append =3D " wic.gz=E2=80=9D
>
> >
> > Even after removing 'type=3Dnetfront' from vif it's failing.
>
> This option is only for hvm on x86, so you can remove it from your
> configuration.
>
> > One more doubt here, could this mac address be a dummy or actual here?
>
> This is a dummy one you set for the guest network interface and this is
> the Mac
>  address other devices on your network will see so it must be fully valid
> (and
>  not conflicting with other devices on your network).
>
> Cheers
> Bertrand
>
> >
> > Regards,
> > Vipul Kumar
> >
> > On Thu, Aug 25, 2022 at 2:36 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> > On Wed, 24 Aug 2022, Vipul Suneja wrote:
> > > Hi Bertrand,
> > > Thanks for your response!
> > >
> > > I builded the guest image on yocto kirkstone source which has FSTYPE
> ext3. Guest image generated is
> > > xen-guest-image-minimal-raspberrypi4-64.ext3.
> > > Below is the content of guest.cfg file
> > >
> > >    kernel =3D "/home/root/Image"
> > >    cmdline =3D "console=3Dhvc0 earlyprintk=3Dxen sync_console
> root=3D/dev/xvda"
> > >    memory =3D "256"
> > >    name =3D "guest1"
> > >    vcpus =3D 1
> > >    serial=3D"pty"
> > >    disk =3D [ 'phy:/dev/loop0,xvda,w' ]
> > >    vif=3D[ 'mac=3D00:11:22:66:88:22,bridge=3Dxenbr0,type=3Dnetfront',=
 ]
> > >
> > > I am trying to mount xen-guest-image-minimal-raspberrypi4-64.ext3 to =
a
> virtual device & then will run the guest VM by command "xl create -c
> > > guest.cfg". But facing issue while trying to mount.
> >
> > You don't actually need to mount
> > xen-guest-image-minimal-raspberrypi4-64.ext3 anywhere to use it to run
> > your guest VM with "xl create".
> >
> > It is enough to do this instead, as Bertrand suggested:
> >
> >
> disk=3D["file:/path/to/file/xen-guest-image-minimal-raspberrypi4-64.ext3,=
xvda,w"]
> >
> > No need to call losetup or mount. Just xl create -c.
> >
> > More answers below.
> >
> >
> > > Regards,
> > > Vipul Kumar
> > >
> > > On Wed, Aug 24, 2022 at 8:06 PM Bertrand Marquis <
> Bertrand.Marquis@arm.com> wrote:
> > >       Hi Vipul,
> > >
> > >       > On 24 Aug 2022, at 15:16, Vipul Suneja <vsuneja63@gmail.com>
> wrote:
> > >       >
> > >       > Hi,
> > >       >
> > >       > I am porting xen hypervisor on rpi4 with yocto kirkstone
> sources. Followed the basic steps to build xen-image-minimal &
> > >       xen-guest-image-minimal. I could flash sd card with xen minimal
> image & could see dom0 up. I copied "Image",
> > >       "xen-guest-image-minimal" .ext3 file & guest.cfg to
> "/home/root". After that created a bridge with below step:
> > >       >
> > >       > killall -SIGUSR2 udhcpc
> > >       > brctl addbr xenbr0
> > >       > brctl addif xenbr0 eth0
> > >       > killall udhcpc
> > >       > udhcpc -R -b -p /var/run/udhcpc.xenbr0.pid -i xenbr0
> > >       >
> > >       > Could see the xenbr0 interface up.
> > >       > After that while mounting the guest file system it shows no
> such file or directory but the file is already there.
> > >       >
> > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# ls -l
> > >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
> 24652288 Mar  9 12:36 Image
> > >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
>  247 Mar  9 12:37 guest1.cfg
> > >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
>  868220928 Mar  9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3
> > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# chmod 0777
> xen-guest-image-minimal-raspberrypi4-64.ext3
> > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# ls -l
> > >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
> 24652288 Mar  9 12:36 Image
> > >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
>  247 Mar  9 12:37 guest1.cfg
> > >       > [23:40:15] <Guest9046> -rwxrwxrwx    1 root     root
>  868220928 Mar  9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3
> > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup
> /dev/loop0 xen-guest-image-minimal-raspberrypi4-64.ext3
> > >       > [23:40:15] <Guest9046> losetup:
> xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or directory
> > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup
> /dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3
> > >       > [23:40:15] <Guest9046> losetup:
> /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
> directory
> > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
> > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
> > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
> > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup
> /dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3
> > >       > [23:40:15] <Guest9046> losetup:
> /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
> directory
> >
> > It looks like either
> > /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3 doesn't exist o=
r
> > /dev/loop0 doesn't exist
> >
> >
> > >       Why do you want to mount the file system ?
> > >
> > >       Anyway this is not related to Xen, I guess you could start
> without xen and still not manage to mount the file like that (linux
> > >       configuration issue ?)
> > >
> > >       What is the content of you guest.cfg
> > >       How do you want to pass the guest root file system ?
> > >
> > >       Yocto should actually generate an img file and you could use it
> by having something like this in your guest.cfg:
> > >       disk=3D["file:/home/root/guest1.img,xvda,w=E2=80=9D]
> > >
> > >       Cheers
> > >       Bertrand
> > >
> > >       >
> > >       > Any input on this issue will be really helpful, expecting you=
r
> response.
> > >       >
> > >       > Thanks & Regards,
> > >       > Vipul Kumar
> > >
> > >
> > >
>
>

--0000000000006718c105e70cfc46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bertrand,<div><br></div><div>Thanks!</div><div><br></di=
v><div>No, I couldn&#39;t see /dev/loop0. Can you please guide me to create=
 it?</div><div><br></div><div>I didn&#39;t change dom0 configurations, it&#=
39;s default generated by yocto.</div><div>=C2=A0</div><div>I will append t=
his &quot;IMAGE_FSTYPES:append =3D &quot; wic.gz=E2=80=9D&quot; in local.co=
nf &amp; will update you.</div><div><br></div><div>Regards,</div><div>Vipul=
 Kumar</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Aug 25, 2022 at 1:25 PM Bertrand Marquis &lt;<a href=3D=
"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis@arm.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Vipul,<br>
<br>
&gt; On 25 Aug 2022, at 08:31, Vipul Suneja &lt;<a href=3D"mailto:vsuneja63=
@gmail.com" target=3D"_blank">vsuneja63@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; Thanks!<br>
&gt; <br>
&gt; As suggested, I changed the guest1.cfg file. Below are the contents of=
 config file<br>
&gt; <br>
&gt; kernel =3D &quot;/home/root/Image&quot;<br>
&gt; cmdline =3D &quot;console=3Dhvc0 earlyprintk=3Dxen sync_console root=
=3D/dev/xvda&quot;<br>
&gt; memory =3D &quot;1024&quot;<br>
&gt; name =3D &quot;guest1&quot;<br>
&gt; vcpus =3D 1<br>
&gt; serial=3D&quot;pty&quot;<br>
&gt; disk =3D [ &#39;file:/home/root/xen-guest-image-minimal-raspberrypi4-6=
4.ext3,xvda,w&#39; ]<br>
&gt; vif=3D[ &#39;mac=3D00:11:22:66:88:22,bridge=3Dxenbr0,type=3Dnetfront&#=
39;, ]<br>
&gt; <br>
&gt; Its failing with below logs:<br>
&gt; <br>
&gt; root@raspberrypi4-64:~# xl create -c guest1.cfg <br>
&gt; Parsing config from guest1.cfg<br>
&gt; Invalid parameter `type&#39;.<br>
&gt; libxl: error: libxl_exec.c:117:libxl_report_child_exitstatus: /etc/xen=
/scripts/block add [742] exited with error status 1<br>
&gt; libxl: error: libxl_device.c:1265:device_hotplug_child_death_cb: scrip=
t: losetup /dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ex=
t3 failed<br>
&gt; libxl: error: libxl_create.c:1643:domcreate_launch_dm: Domain 1:unable=
 to add disk devices<br>
&gt; libxl: error: libxl_exec.c:117:libxl_report_child_exitstatus: /etc/xen=
/scripts/block remove [793] exited with error status 1<br>
&gt; libxl: error: libxl_device.c:1265:device_hotplug_child_death_cb: scrip=
t: /etc/xen/scripts/block failed; error detected.<br>
&gt; libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 1:Non-e=
xistant domain<br>
&gt; libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 1:Un=
able to destroy guest<br>
&gt; libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 1:Destruct=
ion of domain failed<br>
<br>
I think you have a loop issue.<br>
<br>
Could you check if /dev/loop0 exists ?<br>
<br>
Did you change something on the dom0 linux configuration generated by Yocto=
 ?<br>
<br>
We are using Yocto on RPI4 here without any issue like that, only differenc=
e with<br>
your setup is that we generate a wic image to have a real disk image instea=
d of<br>
using the ext3/ext4 one.<br>
<br>
Should be possible to do the same on your side by adding the following in l=
ocal.conf:<br>
IMAGE_FSTYPES:append =3D &quot; wic.gz=E2=80=9D<br>
<br>
&gt; <br>
&gt; Even after removing &#39;type=3Dnetfront&#39; from vif it&#39;s failin=
g. <br>
<br>
This option is only for hvm on x86, so you can remove it from your configur=
ation.<br>
<br>
&gt; One more doubt here, could this mac address be a dummy or actual here?=
<br>
<br>
This is a dummy one you set for the guest network interface and this is the=
 Mac<br>
=C2=A0address other devices on your network will see so it must be fully va=
lid (and<br>
=C2=A0not conflicting with other devices on your network).<br>
<br>
Cheers<br>
Bertrand<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Vipul Kumar<br>
&gt; <br>
&gt; On Thu, Aug 25, 2022 at 2:36 AM Stefano Stabellini &lt;<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
 wrote:<br>
&gt; On Wed, 24 Aug 2022, Vipul Suneja wrote:<br>
&gt; &gt; Hi Bertrand,<br>
&gt; &gt; Thanks for your response!<br>
&gt; &gt; <br>
&gt; &gt; I builded the guest image on yocto kirkstone source which has FST=
YPE ext3. Guest image generated is<br>
&gt; &gt; xen-guest-image-minimal-raspberrypi4-64.ext3.<br>
&gt; &gt; Below is the content of guest.cfg file<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 kernel =3D &quot;/home/root/Image&quot; <br>
&gt; &gt;=C2=A0 =C2=A0 cmdline =3D &quot;console=3Dhvc0 earlyprintk=3Dxen s=
ync_console root=3D/dev/xvda&quot; <br>
&gt; &gt;=C2=A0 =C2=A0 memory =3D &quot;256&quot; <br>
&gt; &gt;=C2=A0 =C2=A0 name =3D &quot;guest1&quot; <br>
&gt; &gt;=C2=A0 =C2=A0 vcpus =3D 1 <br>
&gt; &gt;=C2=A0 =C2=A0 serial=3D&quot;pty&quot; <br>
&gt; &gt;=C2=A0 =C2=A0 disk =3D [ &#39;phy:/dev/loop0,xvda,w&#39; ] <br>
&gt; &gt;=C2=A0 =C2=A0 vif=3D[ &#39;mac=3D00:11:22:66:88:22,bridge=3Dxenbr0=
,type=3Dnetfront&#39;, ]<br>
&gt; &gt; <br>
&gt; &gt; I am trying to mount xen-guest-image-minimal-raspberrypi4-64.ext3=
 to a virtual device &amp; then will run the guest VM by command &quot;xl c=
reate -c<br>
&gt; &gt; guest.cfg&quot;. But facing issue while trying to mount. <br>
&gt; <br>
&gt; You don&#39;t actually need to mount<br>
&gt; xen-guest-image-minimal-raspberrypi4-64.ext3 anywhere to use it to run=
<br>
&gt; your guest VM with &quot;xl create&quot;. <br>
&gt; <br>
&gt; It is enough to do this instead, as Bertrand suggested:<br>
&gt; <br>
&gt; disk=3D[&quot;file:/path/to/file/xen-guest-image-minimal-raspberrypi4-=
64.ext3,xvda,w&quot;]<br>
&gt; <br>
&gt; No need to call losetup or mount. Just xl create -c.<br>
&gt; <br>
&gt; More answers below.<br>
&gt; <br>
&gt; <br>
&gt; &gt; Regards,<br>
&gt; &gt; Vipul Kumar<br>
&gt; &gt; <br>
&gt; &gt; On Wed, Aug 24, 2022 at 8:06 PM Bertrand Marquis &lt;<a href=3D"m=
ailto:Bertrand.Marquis@arm.com" target=3D"_blank">Bertrand.Marquis@arm.com<=
/a>&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Vipul,<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On 24 Aug 2022, at 15:16, Vipul Su=
neja &lt;<a href=3D"mailto:vsuneja63@gmail.com" target=3D"_blank">vsuneja63=
@gmail.com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am porting xen hypervisor on rpi=
4 with yocto kirkstone sources. Followed the basic steps to build xen-image=
-minimal &amp;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xen-guest-image-minimal. I could flash =
sd card with xen minimal image &amp; could see dom0 up. I copied &quot;Imag=
e&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;xen-guest-image-minimal&quot; .ex=
t3 file &amp; guest.cfg to &quot;/home/root&quot;. After that created a bri=
dge with below step:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; killall -SIGUSR2 udhcpc<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; brctl addbr xenbr0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; brctl addif xenbr0 eth0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; killall udhcpc<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; udhcpc -R -b -p /var/run/udhcpc.xe=
nbr0.pid -i xenbr0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Could see the xenbr0 interface up.=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; After that while mounting the gues=
t file system it shows no such file or directory but the file is already th=
ere.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@=
raspberrypi4-64:~# ls -l<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; -rw-r=
--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 24652=
288 Mar=C2=A0 9 12:36 Image<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; -rw-r=
--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0247 Mar=C2=A0 9 12:37 guest1.cfg<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; -rw-r=
--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0868220=
928 Mar=C2=A0 9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@=
raspberrypi4-64:~# chmod 0777 xen-guest-image-minimal-raspberrypi4-64.ext3<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@=
raspberrypi4-64:~# ls -l<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; -rw-r=
--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 24652=
288 Mar=C2=A0 9 12:36 Image<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; -rw-r=
--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0247 Mar=C2=A0 9 12:37 guest1.cfg<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; -rwxr=
wxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0868220=
928 Mar=C2=A0 9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@=
raspberrypi4-64:~# losetup /dev/loop0 xen-guest-image-minimal-raspberrypi4-=
64.ext3<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; loset=
up: xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or directory=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@=
raspberrypi4-64:~# losetup /dev/loop0 /home/root/xen-guest-image-minimal-ra=
spberrypi4-64.ext3<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; loset=
up: /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file o=
r directory<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@=
raspberrypi4-64:~#<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@=
raspberrypi4-64:~#<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@=
raspberrypi4-64:~#<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@=
raspberrypi4-64:~# losetup /dev/loop0 /home/root/xen-guest-image-minimal-ra=
spberrypi4-64.ext3<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; loset=
up: /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file o=
r directory<br>
&gt; <br>
&gt; It looks like either<br>
&gt; /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3 doesn&#39;t ex=
ist or<br>
&gt; /dev/loop0 doesn&#39;t exist<br>
&gt; <br>
&gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Why do you want to mount the file syste=
m ?<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Anyway this is not related to Xen, I gu=
ess you could start without xen and still not manage to mount the file like=
 that (linux<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0configuration issue ?)<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0What is the content of you guest.cfg<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0How do you want to pass the guest root =
file system ?<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Yocto should actually generate an img f=
ile and you could use it by having something like this in your guest.cfg:<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0disk=3D[&quot;file:/home/root/guest1.im=
g,xvda,w=E2=80=9D]<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Bertrand<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Any input on this issue will be re=
ally helpful, expecting your response.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks &amp; Regards,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Vipul Kumar<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt;<br>
<br>
</blockquote></div>

--0000000000006718c105e70cfc46--

