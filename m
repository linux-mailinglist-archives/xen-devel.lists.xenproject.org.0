Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C825A0A51
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 09:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393070.631789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7Lj-0000lf-UL; Thu, 25 Aug 2022 07:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393070.631789; Thu, 25 Aug 2022 07:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7Lj-0000jY-Qh; Thu, 25 Aug 2022 07:32:23 +0000
Received: by outflank-mailman (input) for mailman id 393070;
 Thu, 25 Aug 2022 07:32:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xLAc=Y5=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1oR7Li-0000jS-CP
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 07:32:22 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dc9e6a6-2448-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 09:32:20 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id gb36so37801742ejc.10
 for <xen-devel@lists.xenproject.org>; Thu, 25 Aug 2022 00:32:20 -0700 (PDT)
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
X-Inumbo-ID: 0dc9e6a6-2448-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=u/qA2tV35RVq25oPLoYqCodfJI6BuBt8yC6t0sX7xXE=;
        b=PF83ekluY1s6uYNNL7wqyQjNluOQOGqW6JA4nDUyLVNnuk22T7808YpaeXxsmvWX/E
         vZiOoSjtPHmen1yqNkEGFXclsvXYvIFcvet6owjkqf2sgJRy6pUokZM1ef492MyQblY4
         r84PBxiW7dRTzZ5qC0nxt5/xQXxaPJKnnI7wQ5oQSYiaN4tdUUABstG4Hz/bf8u/qv5H
         uD9wQoJK8ugdfjctdwMQvOCct8lf99ncE0QsdMcZEKT+p1CjMR25lt39Udq6YLqqOSnK
         rPrD2Ma2DpO4wwdVs/gbnTiAPa+v4s0+erH0Teg8Q2bXmEFKMIIeDrKtyjEvCE/co7kQ
         0xIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=u/qA2tV35RVq25oPLoYqCodfJI6BuBt8yC6t0sX7xXE=;
        b=eSNDPuxfYaHCXsy3Au95Bh7gyOY8DSuBt4eUbgxg79l0rGnSbArv3mb4RFAZyV3vBd
         RlJGtnUOpJVFFuCVAi4JZADgmeSoX/oahuyzTpacPn2OCqhcze/pTrzc3VSUYvNNYNpx
         4NFqieL5MnRWQGx17gsSkdzthwAOWIFn7BC7ekdHvWOj+hxgfmCPZk5CjGTHjWkFUJ9A
         zRXGO3WYgEux2PlqTJRFmYgSJ4Pfmu6sp4Q1+1hymgdVM1aoXmRs1ekU1tO64PQlWGld
         9GOOUtw6kjUmVYMPNGB6A+q9or4BDNk+giD0dTppQk8a6drK/i4XbiSZV2VrBqvnIeg3
         piPg==
X-Gm-Message-State: ACgBeo0qDurFJ5GLK+VtDkECvFTDThV9HQLxxdakB858bAwLU1k21UhR
	/IdNxTBPUBB+4PurP4pVwb7ryusYj/Z1jqI93gY=
X-Google-Smtp-Source: AA6agR5ExTqPChK1RsSr5t4lzjJwH2KLOYp09F/z5MSEIDtIWTXMwaP5pl/ruF7vk9AEYjGHugt379nsLDKP+zCfZEc=
X-Received: by 2002:a17:906:9b0a:b0:73d:c29e:cc87 with SMTP id
 eo10-20020a1709069b0a00b0073dc29ecc87mr1581122ejc.118.1661412740288; Thu, 25
 Aug 2022 00:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <CALAP8f_L0ggPP=a6Xrywge2-ZTa3msqj0UKN8L66cC6ypNOAfw@mail.gmail.com>
 <2992A27C-B9F7-43BB-A7EA-CC5A3C8B5B22@arm.com> <CALAP8f_=NztOC9FKYnrCyknOM4jf27cRqjJ9+7UqOEH6qCAD8Q@mail.gmail.com>
 <alpine.DEB.2.22.394.2208241401110.15247@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2208241401110.15247@ubuntu-linux-20-04-desktop>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Thu, 25 Aug 2022 13:01:07 +0530
Message-ID: <CALAP8f-3jcGen82DaVrxRTF3TMDVMkLJA5Nsxu=HDYFDqTOOdQ@mail.gmail.com>
Subject: Re: Porting xen on rpi4
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>
Content-Type: multipart/alternative; boundary="00000000000035d4a505e70bccfc"

--00000000000035d4a505e70bccfc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

Thanks!

As suggested, I changed the guest1.cfg file. Below are the contents of
config file








*kernel =3D "/home/root/Image"cmdline =3D "console=3Dhvc0 earlyprintk=3Dxen
sync_console root=3D/dev/xvda"memory =3D "1024"name =3D "guest1"vcpus =3D
1serial=3D"pty"disk =3D [
'file:/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3,xvda,w'
]vif=3D[ 'mac=3D00:11:22:66:88:22,bridge=3Dxenbr0,type=3Dnetfront', ]*

Its failing with below logs:












*root@raspberrypi4-64:~# xl create -c guest1.cfg Parsing config from
guest1.cfgInvalid parameter `type'.libxl: error:
libxl_exec.c:117:libxl_report_child_exitstatus: /etc/xen/scripts/block add
[742] exited with error status 1libxl: error:
libxl_device.c:1265:device_hotplug_child_death_cb: script: losetup
/dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3
failedlibxl: error: libxl_create.c:1643:domcreate_launch_dm: Domain
1:unable to add disk deviceslibxl: error:
libxl_exec.c:117:libxl_report_child_exitstatus: /etc/xen/scripts/block
remove [793] exited with error status 1libxl: error:
libxl_device.c:1265:device_hotplug_child_death_cb: script:
/etc/xen/scripts/block failed; error detected.libxl: error:
libxl_domain.c:1183:libxl__destroy_domid: Domain 1:Non-existant
domainlibxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain
1:Unable to destroy guestlibxl: error:
libxl_domain.c:1064:domain_destroy_cb: Domain 1:Destruction of domain
failed*

Even after removing 'type=3Dnetfront' from vif it's failing.
One more doubt here, could this mac address be a dummy or actual here?

Regards,
Vipul Kumar

On Thu, Aug 25, 2022 at 2:36 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Wed, 24 Aug 2022, Vipul Suneja wrote:
> > Hi Bertrand,
> > Thanks for your response!
> >
> > I builded the guest image on yocto kirkstone source which has FSTYPE
> ext3. Guest image generated is
> > xen-guest-image-minimal-raspberrypi4-64.ext3.
> > Below is the content of guest.cfg file
> >
> >    kernel =3D "/home/root/Image"
> >    cmdline =3D "console=3Dhvc0 earlyprintk=3Dxen sync_console root=3D/d=
ev/xvda"
> >    memory =3D "256"
> >    name =3D "guest1"
> >    vcpus =3D 1
> >    serial=3D"pty"
> >    disk =3D [ 'phy:/dev/loop0,xvda,w' ]
> >    vif=3D[ 'mac=3D00:11:22:66:88:22,bridge=3Dxenbr0,type=3Dnetfront', ]
> >
> > I am trying to mount xen-guest-image-minimal-raspberrypi4-64.ext3 to a
> virtual device & then will run the guest VM by command "xl create -c
> > guest.cfg". But facing issue while trying to mount.
>
> You don't actually need to mount
> xen-guest-image-minimal-raspberrypi4-64.ext3 anywhere to use it to run
> your guest VM with "xl create".
>
> It is enough to do this instead, as Bertrand suggested:
>
>
> disk=3D["file:/path/to/file/xen-guest-image-minimal-raspberrypi4-64.ext3,=
xvda,w"]
>
> No need to call losetup or mount. Just xl create -c.
>
> More answers below.
>
>
> > Regards,
> > Vipul Kumar
> >
> > On Wed, Aug 24, 2022 at 8:06 PM Bertrand Marquis <
> Bertrand.Marquis@arm.com> wrote:
> >       Hi Vipul,
> >
> >       > On 24 Aug 2022, at 15:16, Vipul Suneja <vsuneja63@gmail.com>
> wrote:
> >       >
> >       > Hi,
> >       >
> >       > I am porting xen hypervisor on rpi4 with yocto kirkstone
> sources. Followed the basic steps to build xen-image-minimal &
> >       xen-guest-image-minimal. I could flash sd card with xen minimal
> image & could see dom0 up. I copied "Image",
> >       "xen-guest-image-minimal" .ext3 file & guest.cfg to "/home/root".
> After that created a bridge with below step:
> >       >
> >       > killall -SIGUSR2 udhcpc
> >       > brctl addbr xenbr0
> >       > brctl addif xenbr0 eth0
> >       > killall udhcpc
> >       > udhcpc -R -b -p /var/run/udhcpc.xenbr0.pid -i xenbr0
> >       >
> >       > Could see the xenbr0 interface up.
> >       > After that while mounting the guest file system it shows no suc=
h
> file or directory but the file is already there.
> >       >
> >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# ls -l
> >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
> 24652288 Mar  9 12:36 Image
> >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
>  247 Mar  9 12:37 guest1.cfg
> >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
>  868220928 Mar  9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3
> >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# chmod 0777
> xen-guest-image-minimal-raspberrypi4-64.ext3
> >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# ls -l
> >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
> 24652288 Mar  9 12:36 Image
> >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
>  247 Mar  9 12:37 guest1.cfg
> >       > [23:40:15] <Guest9046> -rwxrwxrwx    1 root     root
>  868220928 Mar  9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3
> >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup
> /dev/loop0 xen-guest-image-minimal-raspberrypi4-64.ext3
> >       > [23:40:15] <Guest9046> losetup:
> xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or directory
> >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup
> /dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3
> >       > [23:40:15] <Guest9046> losetup:
> /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
> directory
> >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
> >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
> >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
> >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup
> /dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3
> >       > [23:40:15] <Guest9046> losetup:
> /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
> directory
>
> It looks like either
> /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3 doesn't exist or
> /dev/loop0 doesn't exist
>
>
> >       Why do you want to mount the file system ?
> >
> >       Anyway this is not related to Xen, I guess you could start withou=
t
> xen and still not manage to mount the file like that (linux
> >       configuration issue ?)
> >
> >       What is the content of you guest.cfg
> >       How do you want to pass the guest root file system ?
> >
> >       Yocto should actually generate an img file and you could use it b=
y
> having something like this in your guest.cfg:
> >       disk=3D["file:/home/root/guest1.img,xvda,w=E2=80=9D]
> >
> >       Cheers
> >       Bertrand
> >
> >       >
> >       > Any input on this issue will be really helpful, expecting your
> response.
> >       >
> >       > Thanks & Regards,
> >       > Vipul Kumar
> >
> >
> >

--00000000000035d4a505e70bccfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stefano,<div><br></div><div>Thanks!</div><div><br></div=
><div>As suggested, I changed the guest1.cfg file. Below are the contents o=
f config file</div><div><br></div><div><b>kernel =3D &quot;/home/root/Image=
&quot;<br>cmdline =3D &quot;console=3Dhvc0 earlyprintk=3Dxen sync_console r=
oot=3D/dev/xvda&quot;<br>memory =3D &quot;1024&quot;<br>name =3D &quot;gues=
t1&quot;<br>vcpus =3D 1<br>serial=3D&quot;pty&quot;<br>disk =3D [ &#39;file=
:/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3,xvda,w&#39; ]<br>v=
if=3D[ &#39;mac=3D00:11:22:66:88:22,bridge=3Dxenbr0,type=3Dnetfront&#39;, ]=
</b><br></div><div><br></div><div>Its failing with below logs:</div><div><b=
><br></b></div><div><b>root@raspberrypi4-64:~# xl create -c guest1.cfg <br>=
Parsing config from guest1.cfg<br>Invalid parameter `type&#39;.<br>libxl: e=
rror: libxl_exec.c:117:libxl_report_child_exitstatus: /etc/xen/scripts/bloc=
k add [742] exited with error status 1<br>libxl: error: libxl_device.c:1265=
:device_hotplug_child_death_cb: script: losetup /dev/loop0 /home/root/xen-g=
uest-image-minimal-raspberrypi4-64.ext3 failed<br>libxl: error: libxl_creat=
e.c:1643:domcreate_launch_dm: Domain 1:unable to add disk devices<br>libxl:=
 error: libxl_exec.c:117:libxl_report_child_exitstatus: /etc/xen/scripts/bl=
ock remove [793] exited with error status 1<br>libxl: error: libxl_device.c=
:1265:device_hotplug_child_death_cb: script: /etc/xen/scripts/block failed;=
 error detected.<br>libxl: error: libxl_domain.c:1183:libxl__destroy_domid:=
 Domain 1:Non-existant domain<br>libxl: error: libxl_domain.c:1137:domain_d=
estroy_callback: Domain 1:Unable to destroy guest<br>libxl: error: libxl_do=
main.c:1064:domain_destroy_cb: Domain 1:Destruction of domain failed<br></b=
></div><div><b><br></b></div><div>Even after removing &#39;type=3Dnetfront&=
#39; from vif it&#39;s failing.=C2=A0</div><div>One more doubt here, could =
this mac address be a dummy or actual here?</div><div><br></div><div>Regard=
s,</div><div>Vipul Kumar</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Aug 25, 2022 at 2:36 AM Stefano Stabe=
llini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Wed, 24 Aug 2022, Vipul Suneja wrote:<br>
&gt; Hi Bertrand,<br>
&gt; Thanks for your response!<br>
&gt; <br>
&gt; I builded the guest image on yocto kirkstone source which has FSTYPE e=
xt3. Guest image generated is<br>
&gt; xen-guest-image-minimal-raspberrypi4-64.ext3.<br>
&gt; Below is the content of guest.cfg file<br>
&gt; <br>
&gt; =C2=A0 =C2=A0kernel =3D &quot;/home/root/Image&quot;=C2=A0<br>
&gt; =C2=A0 =C2=A0cmdline =3D &quot;console=3Dhvc0 earlyprintk=3Dxen sync_c=
onsole root=3D/dev/xvda&quot;=C2=A0<br>
&gt; =C2=A0 =C2=A0memory =3D &quot;256&quot;=C2=A0<br>
&gt; =C2=A0 =C2=A0name =3D &quot;guest1&quot;=C2=A0<br>
&gt; =C2=A0 =C2=A0vcpus =3D 1=C2=A0<br>
&gt; =C2=A0 =C2=A0serial=3D&quot;pty&quot;=C2=A0<br>
&gt; =C2=A0 =C2=A0disk =3D [ &#39;phy:/dev/loop0,xvda,w&#39; ]=C2=A0<br>
&gt; =C2=A0 =C2=A0vif=3D[ &#39;mac=3D00:11:22:66:88:22,bridge=3Dxenbr0,type=
=3Dnetfront&#39;, ]<br>
&gt; <br>
&gt; I am trying to mount xen-guest-image-minimal-raspberrypi4-64.ext3 to a=
 virtual device &amp; then will run the guest VM by command &quot;xl create=
 -c<br>
&gt; guest.cfg&quot;. But facing issue while trying to mount.=C2=A0<br>
<br>
You don&#39;t actually need to mount<br>
xen-guest-image-minimal-raspberrypi4-64.ext3 anywhere to use it to run<br>
your guest VM with &quot;xl create&quot;. <br>
<br>
It is enough to do this instead, as Bertrand suggested:<br>
<br>
disk=3D[&quot;file:/path/to/file/xen-guest-image-minimal-raspberrypi4-64.ex=
t3,xvda,w&quot;]<br>
<br>
No need to call losetup or mount. Just xl create -c.<br>
<br>
More answers below.<br>
<br>
<br>
&gt; Regards,<br>
&gt; Vipul Kumar<br>
&gt; <br>
&gt; On Wed, Aug 24, 2022 at 8:06 PM Bertrand Marquis &lt;<a href=3D"mailto=
:Bertrand.Marquis@arm.com" target=3D"_blank">Bertrand.Marquis@arm.com</a>&g=
t; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Vipul,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On 24 Aug 2022, at 15:16, Vipul Suneja =
&lt;<a href=3D"mailto:vsuneja63@gmail.com" target=3D"_blank">vsuneja63@gmai=
l.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am porting xen hypervisor on rpi4 wit=
h yocto kirkstone sources. Followed the basic steps to build xen-image-mini=
mal &amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xen-guest-image-minimal. I could flash sd ca=
rd with xen minimal image &amp; could see dom0 up. I copied &quot;Image&quo=
t;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;xen-guest-image-minimal&quot; .ext3 fi=
le &amp; guest.cfg to &quot;/home/root&quot;. After that created a bridge w=
ith below step:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; killall -SIGUSR2 udhcpc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; brctl addbr xenbr0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; brctl addif xenbr0 eth0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; killall udhcpc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; udhcpc -R -b -p /var/run/udhcpc.xenbr0.=
pid -i xenbr0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Could see the xenbr0 interface up.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; After that while mounting the guest fil=
e system it shows no such file or directory but the file is already there.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@raspb=
errypi4-64:~# ls -l<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; -rw-r--r--=
=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 24652288 M=
ar=C2=A0 9 12:36 Image<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; -rw-r--r--=
=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0247 Mar=C2=A0 9 12:37 guest1.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; -rw-r--r--=
=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0868220928 M=
ar=C2=A0 9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@raspb=
errypi4-64:~# chmod 0777 xen-guest-image-minimal-raspberrypi4-64.ext3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@raspb=
errypi4-64:~# ls -l<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; -rw-r--r--=
=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 24652288 M=
ar=C2=A0 9 12:36 Image<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; -rw-r--r--=
=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0247 Mar=C2=A0 9 12:37 guest1.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; -rwxrwxrwx=
=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0868220928 M=
ar=C2=A0 9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@raspb=
errypi4-64:~# losetup /dev/loop0 xen-guest-image-minimal-raspberrypi4-64.ex=
t3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; losetup: x=
en-guest-image-minimal-raspberrypi4-64.ext3: No such file or directory<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@raspb=
errypi4-64:~# losetup /dev/loop0 /home/root/xen-guest-image-minimal-raspber=
rypi4-64.ext3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; losetup: /=
home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or dir=
ectory<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@raspb=
errypi4-64:~#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@raspb=
errypi4-64:~#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@raspb=
errypi4-64:~#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; root@raspb=
errypi4-64:~# losetup /dev/loop0 /home/root/xen-guest-image-minimal-raspber=
rypi4-64.ext3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; losetup: /=
home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or dir=
ectory<br>
<br>
It looks like either<br>
/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3 doesn&#39;t exist o=
r<br>
/dev/loop0 doesn&#39;t exist<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Why do you want to mount the file system ?<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Anyway this is not related to Xen, I guess y=
ou could start without xen and still not manage to mount the file like that=
 (linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0configuration issue ?)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0What is the content of you guest.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0How do you want to pass the guest root file =
system ?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Yocto should actually generate an img file a=
nd you could use it by having something like this in your guest.cfg:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0disk=3D[&quot;file:/home/root/guest1.img,xvd=
a,w=E2=80=9D]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Bertrand<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Any input on this issue will be really =
helpful, expecting your response.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks &amp; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Vipul Kumar<br>
&gt; <br>
&gt; <br>
&gt; </blockquote></div>

--00000000000035d4a505e70bccfc--

