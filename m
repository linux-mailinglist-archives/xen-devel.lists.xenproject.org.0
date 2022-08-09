Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F0A58DC6D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 18:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383084.618196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLSPC-0001gd-Ot; Tue, 09 Aug 2022 16:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383084.618196; Tue, 09 Aug 2022 16:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLSPC-0001e3-MD; Tue, 09 Aug 2022 16:48:34 +0000
Received: by outflank-mailman (input) for mailman id 383084;
 Tue, 09 Aug 2022 16:48:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuEu=YN=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oLSPB-0001dx-6b
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 16:48:33 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19887942-1803-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 18:48:32 +0200 (CEST)
Received: by mail-pg1-x52c.google.com with SMTP id 202so5087655pgc.8
 for <xen-devel@lists.xenproject.org>; Tue, 09 Aug 2022 09:48:32 -0700 (PDT)
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
X-Inumbo-ID: 19887942-1803-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=poq7pbglN+mJqgr0ClUF6h7XMhrhqkEu8oEOldXvWo8=;
        b=Md+PlacZn+egXpKISpGLIIVVki3K0xVyszcIXnb/hWeW4WoCyr1eW+M2/ZTIf65yYr
         S5sDLmyGL0V4MIWpqPbPX8kIL0lhMXFKRkhUETgtacioY0/9VgS5CKCtRFJQHn2JOAur
         Xs0aaBQVkQ3TjaH6aPGaV5QFxs1e7aYBwy/uyEle6ANb/Ab0ByWnfe2j1nq2rQlzO/ah
         RLxvzoWK9QDrcgYvpv0sSARLz1HT9Ku7cSyy/mCY+DAJhAeZZU+urBdSFq++vAV7BHem
         qigzaPXWeLimGqykaVTCsh6EwULmq5TOcPwfzcmQJRHhtBrolXzxevHd8lWktSn79lNS
         vyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=poq7pbglN+mJqgr0ClUF6h7XMhrhqkEu8oEOldXvWo8=;
        b=pzN30JkpFuM+yb+eKTb2etiJm8Oksh06cMjjud9aQMUrXBqPOAyFlR6glmhRT0Mh51
         Bpf/aEmFH+Y8iDxy/wMmGMawTbhDczp4bmPsUkuTQLUUBnQG+PHkqErWvNfqev3KUYT4
         FIrWbNixCummrMJfTJbYZfiRyiq2uhDhroULQPHmiAI9ZL3Yg6iW2MBwXmNze40S/zJX
         /0h7xWthA9X6IiSzOnnYdq8uq2PqV0+BTOR737LH35DkP7Tbus7GNs/cLGxlk9/8Q2Cz
         oFbFNBnPW9m+DiXbstIHiq/GWG8kJYnZ2I7lFdjrQT8tsQKHO136j5wIBHKA1NMIQA0n
         nwBw==
X-Gm-Message-State: ACgBeo0N5wGRYUNJKL8OgNQLPYr2d/kCH+dyY2Mq6+iRP2IMQq/DvF2d
	YBHtA7fS22EkQx4skU+A1NC/vVkijI2E3GWJLbE=
X-Google-Smtp-Source: AA6agR44MkgJ7E0biX8u36Kn42JaxYDGL0xuxqg+RvTyS7XjNAp3WY1kdiB+vQv3GhlOvJYbPlqnnW/N5b2yFWpfiVY=
X-Received: by 2002:a63:5f86:0:b0:41c:f1:f494 with SMTP id t128-20020a635f86000000b0041c00f1f494mr20568738pgb.51.1660063710361;
 Tue, 09 Aug 2022 09:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
 <d5590d91683f2dddb3836b1afb444f30c2f5a7fb.1659713855.git.rahul.singh@arm.com>
 <5e762a42-d0d5-86be-e3cd-64bde82c8b47@gmail.com> <43039C71-D661-4C8D-A132-9E020D0D1013@arm.com>
 <ebed1aff-c758-f3ee-7483-fadd28a6cb6b@xen.org> <AADD096D-DA41-4B11-A869-85FC86BAA1A3@arm.com>
In-Reply-To: <AADD096D-DA41-4B11-A869-85FC86BAA1A3@arm.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Tue, 9 Aug 2022 19:48:19 +0300
Message-ID: <CAPD2p-nw9-=FmTd=z=2tjcn6970Fs-Fj+yj0Cark1ukakNP9SQ@mail.gmail.com>
Subject: Re: [PATCH] xen/pci: replace call to is_memory_hole to pci_check_bar
To: Rahul Singh <Rahul.Singh@arm.com>, Julien Grall <julien@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Paul Durrant <paul@xen.org>
Content-Type: multipart/alternative; boundary="000000000000c2bd9c05e5d1b342"

--000000000000c2bd9c05e5d1b342
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 9, 2022 at 7:26 PM Rahul Singh <Rahul.Singh@arm.com> wrote:

> Hi Julien,
>

Hello Julien, Rahul

[sorry for possible format issues]


[snip]


>
>
> >
> > On 09/08/2022 16:22, Rahul Singh wrote:
> >>> On 8 Aug 2022, at 4:30 pm, Oleksandr <olekstysh@gmail.com> wrote:
> >>>> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t
> end)
> >>>> +{
> >>>> +    int ret;
> >>>> +    struct dt_device_node *dt_node;
> >>>> +    struct device *dev = (struct device *)pci_to_dev(pdev);
> >>>
> >>>
> >>> The cast is present here because of the const?
> >> Yes you are right, cast is because of the const.
> >>>
> >>> I would consider passing "const struct pci_dev *pdev" instead of
> "struct device *dev" to pci_find_host_bridge_node() and dropping conversion
> (pci<->dev) in both functions.
> >
> > It looks like this function was added without any callers. The commit
> message claim there will be some. Can you (or Oleksandr) confirm this is
> not going to be problem for future patches?
>
> I checked the whole PCI passthrough feature branch this function will be
> used when
> we add iommu support for PCI device.



Can confirm that, it will be called by the iommu code, as I understand
there won't be an issue, the more, the exact place where the
pci_find_host_bridge_node() will be called will have "pdev" in hand.


>
>
> >
> > That said, I agree that the conversion pci -> dev -> pci is pointless.
> So I would say if there are use case where we only have a 'dev' in hand,
> then we could ask the caller to do the conversation or we provide an helper
> if there are too many cases.
> >
> >> Yes make sense. I will do that in next version.
> >
> > While you are modifying the prototype for pci_find_host_bridge_node()
> can you consider to also constify the return (it should not be modified)?
>
> Agree, I will constify the retrun also.
>
> >
> > In any case, the change suggested by Oleksandr should preferably be
> separate to this patch and added before.
>
> Ack.
>
> Regards,
> Rahul
>
>

-- 
Regards,

Oleksandr Tyshchenko

--000000000000c2bd9c05e5d1b342
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 9, 2022 at 7:26 PM Rahul =
Singh &lt;<a href=3D"mailto:Rahul.Singh@arm.com">Rahul.Singh@arm.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Juli=
en,<br></blockquote><div><br></div><div>Hello Julien, Rahul=C2=A0</div><div=
><br></div><div>[sorry for possible format issues]</div><div><br></div><div=
><br></div><div>[snip]</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><br>
<br>
&gt; <br>
&gt; On 09/08/2022 16:22, Rahul Singh wrote:<br>
&gt;&gt;&gt; On 8 Aug 2022, at 4:30 pm, Oleksandr &lt;<a href=3D"mailto:ole=
kstysh@gmail.com" target=3D"_blank">olekstysh@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; +bool pci_check_bar(const struct pci_dev *pdev, mfn_t star=
t, mfn_t end)<br>
&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 int ret;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 struct dt_device_node *dt_node;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 struct device *dev =3D (struct device *)pci=
_to_dev(pdev);<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; The cast is present here because of the const?<br>
&gt;&gt; Yes you are right, cast is because of the const.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; I would consider passing &quot;const struct pci_dev *pdev&quot=
; instead of &quot;struct device *dev&quot; to pci_find_host_bridge_node() =
and dropping conversion (pci&lt;-&gt;dev) in both functions.<br>
&gt; <br>
&gt; It looks like this function was added without any callers. The commit =
message claim there will be some. Can you (or Oleksandr) confirm this is no=
t going to be problem for future patches?<br>
<br>
I checked the whole PCI passthrough feature branch this function will be us=
ed when<br>
we add iommu support for PCI device.=C2=A0</blockquote><div>=C2=A0</div><di=
v><br></div><div>Can confirm=C2=A0that, it will be called by the iommu code=
, as I understand there won&#39;t be an issue, the more, the exact place wh=
ere the pci_find_host_bridge_node() will be called will have &quot;pdev&quo=
t; in hand.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"> <br>
<br>
&gt; <br>
&gt; That said, I agree that the conversion pci -&gt; dev -&gt; pci is poin=
tless. So I would say if there are use case where we only have a &#39;dev&#=
39; in hand, then we could ask the caller to do the conversation or we prov=
ide an helper if there are too many cases.<br>
&gt; <br>
&gt;&gt; Yes make sense. I will do that in next version.<br>
&gt; <br>
&gt; While you are modifying the prototype for pci_find_host_bridge_node() =
can you consider to also constify the return (it should not be modified)?<b=
r>
<br>
Agree, I will constify the retrun also. <br>
<br>
&gt; <br>
&gt; In any case, the change suggested by Oleksandr should preferably be se=
parate to this patch and added before.<br>
<br>
Ack. <br>
<br>
Regards,<br>
Rahul<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--000000000000c2bd9c05e5d1b342--

