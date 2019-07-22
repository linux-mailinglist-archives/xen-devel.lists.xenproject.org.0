Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBC370574
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 18:29:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpb8K-0005Ei-RK; Mon, 22 Jul 2019 16:25:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O0ft=VT=gmail.com=lambert.olivier@srs-us1.protection.inumbo.net>)
 id 1hpb8J-0005Ed-Aq
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 16:25:51 +0000
X-Inumbo-ID: 5dfe1a77-ac9d-11e9-8980-bc764e045a96
Received: from mail-oi1-x233.google.com (unknown [2607:f8b0:4864:20::233])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5dfe1a77-ac9d-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 16:25:49 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id g7so30011076oia.8
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2019 09:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=iTNjOtvy4Yakq54l3dTvdr3yJ4iaeQ4Le10tCjnlWgY=;
 b=nWoycXq2dSGu4BsQ+qT84lCcGCOxxFpGE9KAT8Yv6whEOmxFD0+3TgWhIzihzFttt8
 DugeqF2xtY0J2aTfRPDu5JjqID/jKVnvVMvrjm6TGabOjmAfQw/bqrr6PD6MRyqO2iTF
 exirm3cZuKvZGOtalXaznVv6jzu63TsBw/hPsd+Gv1514Hj+XKZZK57zcl4IvlRdXwDf
 t6SK9svdktVHhuGpOzmTq22FLLP43XAstdkM3MydlxcsZ2Q2xqfMO265V+OYskMwv6bP
 M/lArdCj37ZVSehNCFt5NuG1c5Jvv6F4xLt5L4lzFAjgwfBW+yIbD6JOwBYNapXn7x8G
 iViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=iTNjOtvy4Yakq54l3dTvdr3yJ4iaeQ4Le10tCjnlWgY=;
 b=r1JojKPVANBXO3tKunWJmx6CkgcdDpeJGt5+vmvt5amuWiasFLZqf7bIK7rPoRUYzi
 CxwaMoXBAYLc0UgANSu9qOeVTvzNsmfhJxyrKlEi0CNUpn+IBVoVtgvgeNrOZqRxeKXX
 hlw1ay2hpj8z+978ztFsgIa+VPdF8i7qk1ZW+uvoJaKDuCX9BowrGXEdmFHeOnX/1zy1
 4AxBUZXvXqdFdpV8aIQob/h4M8eUXKy6b50cyomupj3AblFPkG69fslQ1qifLyQE5ad2
 WH7+54AaMxO4vp0pIV/hGmBf/qqncabp4OtSzFFWXk3IE5ZC3Vi50t+rk8xQGJ+32mWp
 Rg8w==
X-Gm-Message-State: APjAAAUszVH6GOk06NDtua62jjKE6BfDf+/+ROE1KzUJiMqQIpqJoXbz
 8rkmZQFdkVwH7DICt4Nz+xtCW2t8Oz8no/Z7yTDs1zPc
X-Google-Smtp-Source: APXvYqwee2cKhZpTrUqKR4JkBGNxIVFfA0Pt1g71KoSxylwJRCTmY+myMGPF9dkB5TcH34TvUDuvUHKteTecT3Fbdv4=
X-Received: by 2002:aca:dd04:: with SMTP id u4mr34117637oig.152.1563812749277; 
 Mon, 22 Jul 2019 09:25:49 -0700 (PDT)
MIME-Version: 1.0
From: Olivier Lambert <lambert.olivier@gmail.com>
Date: Mon, 22 Jul 2019 18:25:09 +0200
Message-ID: <CACJ1ZNsXOP-NHHhVTvxnsLvMx1FdJQgEibTsH4nj01b0WrO7fA@mail.gmail.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: [Xen-devel] [RFC] XCP-ng subproject proposal
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
Content-Type: multipart/mixed; boundary="===============7455999285281663438=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7455999285281663438==
Content-Type: multipart/alternative; boundary="0000000000006a82b8058e4787fa"

--0000000000006a82b8058e4787fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Following up on discussions that we had at the last Xen summit, we=E2=80=99=
re
submitting a Xen subproject proposal, regarding XCP-ng project (
https://xcp-ng.org). Feel free to give your feedback!

Regards,

Olivier Lambert and XCP-ng team

# XCP-ng proposal

## The Project

XCP-ng is a turn-key virtualization platform based on the Xen Hypervisor,
using existing Xen Project tools (XAPI). It's built from Xenserver source,
improved and maintained by both passionate individuals and companies. The
result is a completely free and Open Source solution available for everyone=
.

Thanks to a very successful Kickstarter campaign as well as backing from
various companies, the project doesn't require any further funds and isn't
seeking monetary contributions.

We believe forming a Xen sub-project within the Linux Foundation has the
potential to bring further companies and contributors into the Xen Project
as a whole, as well as demonstrate our dedication to open source. XCP-ng
has already displayed its ability to draw new users into the Xen
virtualization ecosystem. For new users, utilizing Xen from scratch can be
daunting. XCP-ng offers a way to solve this problem by drawing end-users
more closely into the Xen Project and providing an easy route for
prospective Xen users to get started with Xen. This is an area where Xen
has been trailing KVM for a long time. Hosting XCP-ng within the Xen
Project provides a route to level the playing field. It would also enable
the Xen Project to leverage XCP-ng success stories for the benefit of the
Xen Project as a whole.

## The Mission

Our goal is to continue development of XCP-ng while building a large
community of contributors to XCP-ng. We also expect an increase of
contributions to XAPI as well as the Xen Project. Through large community
involvement and contributions we have already turned XCP-ng into a stable
hypervisor platform that is used in small and large enterprise deployments.

## Upstream first, fully Open Source

Vates and XCP-ng have started to work with a number of academic
organizations with the aim to fund and develop feature improvements and new
features that benefit the whole Xen Project ecosystem (including the
Hypervisor and XAPI). We follow an upstream first philosophy, which is
possible because of the fast release cycle of XCP-ng and expect to become a
long-term contributor to XAPI and the Hypervisor project.

Besides contributions, we believe that an XCP-ng which is part of the Xen
Project will deliver other benefits:

* Bring passionate and verbal XCP-ng users closer to the Xen Project
* Bring more publicity to the Xen Project: currently we have the XCP-ng
blog, newsletter and success stories, which we are willing to share with
the Xen Project

With an incredibly active forum, IRC, and github, we are always looking for
more contributors to the project. We also believe in giving back to the
open source community via contributions to upstream projects, and we
believe becoming a Xen Project member will help in our ability to do so. To
further our dedication to open source, Vates SAS, the company with the most
active contributions to XCP-ng currently, is in the process of becoming a
Linux Foundation member.

## How we differ from existing platforms

Our vision is to maintain XCP-ng as a complete easy-to-use hypervisor
solution similar to existing full-stack solutions. Where we differ is our
dedication to the open source mindset. We have no licensing system or
license restrictions, all pieces of the platform are free to use.
Simultaneously, we encourage community involvement and have merged many
community contributions already.

## Infrastructure

The infrastructure will be primarily managed by Vates, with multiple
companies in partnership (mainly hosting companies owning DC real estate).
Access and resources can be given for people interested in becoming
maintainers.

We would also like to expand the very active XCP-ng forum to also cover Xen
and XAPI, providing a modern user friendly interface for users to discuss
the hypervisor and related parts with dedicated sections. This will help to
centralize much Xen & XAPI discussion in a place that is easier for casual
users to find than a mailing list.

## Security

XCP-ng has a dedicated email for security feedback (security@xcp-ng.org)
and is already a member of the Xen pre-disclosure mailing list.

## License

XCP-ng can be considered as a specialized Linux distribution, so there are
multiple packages inside it. However, most of its packages are licensed in
GPLv2.

## Contributors / Roles

Project lead: Olivier Lambert (Vates SAS)

* Github org: https://github.com/xcp-ng/
* Main website: https://xcp-ng.org

Extra notes:

* we already contributed to Xen hypervisor (see
https://lists.xenproject.org/archives/html/xen-devel/2019-02/msg01602.html
) and we plan to do more in the future
* we already contributed to XAPI (see
https://github.com/xapi-project/xen-api-libs-transitional/commit/3f881066a1=
bdd4b52275e49edb57fba0d47c2dc9
)
* we added new features (ZoL support, zstd compression=E2=80=A6)
* we contributed to various other projects (eg: ZFS on Linux
https://github.com/zfsonlinux/zfs/pull/8866)
* we are committed to invest money and time in R&D for XCP-ng (see
https://xcp-ng.org/blog/2018/12/19/xcp-ng-research-initiative/ )
* our dev process is fully documented and open:
https://github.com/xcp-ng/xcp/wiki/Development-process-tour
* we have dev diaries explaining to everyone what we are working on, in
details:
https://xcp-ng.org/forum/topic/1036/dev-diaries-1-analyzing-storage-perf-sm=
apiv3

--0000000000006a82b8058e4787fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone,</div><div></div><div><p>
</p><p>Following up on discussions that we had at the last Xen summit, we=
=E2=80=99re submitting a Xen subproject proposal, regarding XCP-ng project =
(<a href=3D"https://xcp-ng.org">https://xcp-ng.org</a>). Feel free to give =
your feedback! </p><p>Regards,

</p><p>Olivier Lambert and XCP-ng team</p><p></p><p># XCP-ng proposal<br><b=
r>## The Project<br><br>XCP-ng is a turn-key virtualization platform based =
on the Xen Hypervisor, using existing Xen Project tools (XAPI). It&#39;s bu=
ilt from Xenserver source, improved and maintained by both passionate indiv=
iduals and companies. The result is a completely free and Open Source solut=
ion available for everyone.<br><br>Thanks to a very successful Kickstarter =
campaign as well as backing from various companies, the project doesn&#39;t=
 require any further funds and isn&#39;t seeking monetary contributions.<br=
><br>We believe forming a Xen sub-project within the Linux Foundation has t=
he potential to bring further companies and contributors into the Xen Proje=
ct as a whole, as well as demonstrate our dedication to open source. XCP-ng=
 has already displayed its ability to draw new users into the Xen virtualiz=
ation ecosystem. For new users, utilizing Xen from scratch can be daunting.=
 XCP-ng offers a way to solve this problem by drawing end-users more closel=
y into the Xen Project and providing an easy route for prospective Xen user=
s to get started with Xen. This is an area where Xen has been trailing KVM =
for a long time. Hosting XCP-ng within the Xen Project provides a route to =
level the playing field. It would also enable the Xen Project to leverage X=
CP-ng success stories for the benefit of the Xen Project as a whole.<br><br=
>## The Mission<br><br>Our goal is to continue development of XCP-ng while =
building a large community of contributors to XCP-ng. We also expect an inc=
rease of contributions to XAPI as well as the Xen Project. Through large co=
mmunity involvement and contributions we have already turned XCP-ng into a =
stable hypervisor platform that is used in small and large enterprise deplo=
yments.<br><br>## Upstream first, fully Open Source<br><br>Vates and XCP-ng=
 have started to work with a number of academic organizations with the aim =
to fund and develop feature improvements and new features that benefit the =
whole Xen Project ecosystem (including the Hypervisor and XAPI). We follow =
an upstream first philosophy, which is possible because of the fast release=
 cycle of XCP-ng and expect to become a long-term contributor to XAPI and t=
he Hypervisor project.<br><br>Besides contributions, we believe that an XCP=
-ng which is part of the Xen Project will deliver other benefits:<br><br>* =
Bring passionate and verbal XCP-ng users closer to the Xen Project<br>* Bri=
ng more publicity to the Xen Project: currently we have the XCP-ng blog, ne=
wsletter and success stories, which we are willing to share with the Xen Pr=
oject<br><br>With an incredibly active forum, IRC, and github, we are alway=
s looking for more contributors to the project. We also believe in giving b=
ack to the open source community via contributions to upstream projects, an=
d we believe becoming a Xen Project member will help in our ability to do s=
o. To further our dedication to open source, Vates SAS, the company with th=
e most active contributions to XCP-ng currently, is in the process of becom=
ing a Linux Foundation member.<br><br>## How we differ from existing platfo=
rms<br><br>Our vision is to maintain XCP-ng as a complete easy-to-use hyper=
visor solution similar to existing full-stack solutions. Where we differ is=
 our dedication to the open source mindset. We have no licensing system or =
license restrictions, all pieces of the platform are free to use. Simultane=
ously, we encourage community involvement and have merged many community co=
ntributions already.<br><br>## Infrastructure<br><br>The infrastructure wil=
l be primarily managed by Vates, with multiple companies in partnership (ma=
inly hosting companies owning DC real estate). Access and resources can be =
given for people interested in becoming maintainers.<br><br>We would also l=
ike to expand the very active XCP-ng forum to also cover Xen and XAPI, prov=
iding a modern user friendly interface for users to discuss the hypervisor =
and related parts with dedicated sections. This will help to centralize muc=
h Xen &amp; XAPI discussion in a place that is easier for casual users to f=
ind than a mailing list.<br><br>## Security<br><br>XCP-ng has a dedicated e=
mail for security feedback (<a href=3D"mailto:security@xcp-ng.org">security=
@xcp-ng.org</a>) and is already a member of the Xen pre-disclosure mailing =
list.<br><br>## License<br><br>XCP-ng can be considered as a specialized Li=
nux distribution, so there are multiple packages inside it. However, most o=
f its packages are licensed in GPLv2.</p><p>## Contributors / Roles<br><br>=
Project lead: Olivier Lambert (Vates SAS)<br><br>* Github org: <a href=3D"h=
ttps://github.com/xcp-ng/">https://github.com/xcp-ng/</a><br>* Main website=
: <a href=3D"https://xcp-ng.org">https://xcp-ng.org</a><br><br>Extra notes:=
<br><br>* we already contributed to Xen hypervisor (see <a href=3D"https://=
lists.xenproject.org/archives/html/xen-devel/2019-02/msg01602.html">https:/=
/lists.xenproject.org/archives/html/xen-devel/2019-02/msg01602.html</a> ) a=
nd we plan to do more in the future<br>* we already contributed to XAPI (se=
e <a href=3D"https://github.com/xapi-project/xen-api-libs-transitional/comm=
it/3f881066a1bdd4b52275e49edb57fba0d47c2dc9">https://github.com/xapi-projec=
t/xen-api-libs-transitional/commit/3f881066a1bdd4b52275e49edb57fba0d47c2dc9=
</a> )<br>* we added new features (ZoL support, zstd compression=E2=80=A6)<=
br>* we contributed to various other projects (eg: ZFS on Linux <a href=3D"=
https://github.com/zfsonlinux/zfs/pull/8866">https://github.com/zfsonlinux/=
zfs/pull/8866</a>) <br>* we are committed to invest money and time in R&amp=
;D for XCP-ng (see <a href=3D"https://xcp-ng.org/blog/2018/12/19/xcp-ng-res=
earch-initiative/">https://xcp-ng.org/blog/2018/12/19/xcp-ng-research-initi=
ative/</a> )<br>* our dev process is fully documented and open: <a href=3D"=
https://github.com/xcp-ng/xcp/wiki/Development-process-tour">https://github=
.com/xcp-ng/xcp/wiki/Development-process-tour</a><br>* we have dev diaries =
explaining to everyone what we are working on, in details: <a href=3D"https=
://xcp-ng.org/forum/topic/1036/dev-diaries-1-analyzing-storage-perf-smapiv3=
">https://xcp-ng.org/forum/topic/1036/dev-diaries-1-analyzing-storage-perf-=
smapiv3</a></p></div></div>

--0000000000006a82b8058e4787fa--


--===============7455999285281663438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7455999285281663438==--

