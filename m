Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257782B83A7
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 19:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30217.60051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRxO-0005lU-1g; Wed, 18 Nov 2020 18:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30217.60051; Wed, 18 Nov 2020 18:13:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRxN-0005l5-Um; Wed, 18 Nov 2020 18:13:25 +0000
Received: by outflank-mailman (input) for mailman id 30217;
 Wed, 18 Nov 2020 18:13:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=135G=EY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kfRxM-0005l0-Om
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 18:13:24 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efdd8961-66b8-46b1-bad1-ba518191c71b;
 Wed, 18 Nov 2020 18:13:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=135G=EY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kfRxM-0005l0-Om
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 18:13:24 +0000
X-Inumbo-ID: efdd8961-66b8-46b1-bad1-ba518191c71b
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id efdd8961-66b8-46b1-bad1-ba518191c71b;
	Wed, 18 Nov 2020 18:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605723203;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=f4ynw6wksUdc+r4WzMkoLFih9xGIHRf2DUC66EGCEOA=;
  b=SBjo+VYi21POEybiX11A/YD3oz5MpqV8gy+ftbxOQPp+1ZrcEhqFsFsS
   1DxIoK9iN31UDD37GORtSXgVTFqBl7qBj027NzzNrLgoRXOiF2aVnVzr5
   CvzXuBXp5UOy/8oOaZw2CiWesvAYo2WLT7g7YP7m1hMmxeOOcAdbhLLIq
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: E6JFELmSpBxQy9swYkks9Tck3YBqP9xbUaaTHv2eF8HKz7VY+hgpPaXlmDm1IZdR006Wp84cxu
 fSkwY5ZiL8plHGYKgq3uy82+5PLGXGUbXxTJpCSSGcJnNVSvmTWk1p7vG8ia3v70jiS0oZiTUc
 pg+1mCLVlAjbX4jgl1AeKIJReBa/bpeX2OJh9OtpbxI8aTzSZcaUt6ON1Gan6VLjNzbtg4qz4g
 IrUW1LQ0hFGgOyNT2GXFZqN4Ivb9bvRd0dwiHhaQdVVrFO7rHoCMa1n3rsx7RiQIJf7Ln6QWsV
 ctw=
X-SBRS: None
X-MesageID: 32602623
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,488,1596513600"; 
   d="scan'208";a="32602623"
Subject: Re: [PATCH v1 4/4] tools/ocaml/libs/xc: backward compatible domid
 control at domain creation time
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1605636799.git.edvin.torok@citrix.com>
 <559929d2ae95f6527e5050051c917b7586182ad2.1605636800.git.edvin.torok@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <dc2e5f92-2528-1475-1513-cfb8d8c3339d@citrix.com>
Date: Wed, 18 Nov 2020 18:13:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <559929d2ae95f6527e5050051c917b7586182ad2.1605636800.git.edvin.torok@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 17/11/2020 18:24, Edwin Török wrote:
> One can specify the domid to use when creating the domain, but this was hardcoded to 0.
>
> Keep the existing `domain_create` function (and the type of its parameters) as is to make
> backwards compatibility easier.
> Introduce a new `domain_create_domid` OCaml API that allows specifying the domid.
> A new version of xenopsd can choose to start using this, while old versions of xenopsd will keep
> building and using the old API.
>
> Controlling the domid can be useful during testing or migration.
>
> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
> ---
>  tools/ocaml/libs/xc/xenctrl.ml      | 3 +++
>  tools/ocaml/libs/xc/xenctrl.mli     | 2 ++
>  tools/ocaml/libs/xc/xenctrl_stubs.c | 9 +++++++--
>  3 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index e878699b0a..9d720886e9 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -182,6 +182,9 @@ let with_intf f =
>  external domain_create: handle -> domctl_create_config -> domid
>         = "stub_xc_domain_create"
>  
> +external domain_create_domid: handle -> domctl_create_config -> domid -> domid
> +       = "stub_xc_domain_create_domid"

Wouldn't this be better as handle -> domid -> domctl_create_config ->
domid ?

I'm not overwhelmed with the name, but
"domain_create_{specific,with}_domid" don't seem much better either.

> +
>  external domain_sethandle: handle -> domid -> string -> unit
>         = "stub_xc_domain_sethandle"
>  
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index e64907df8e..e629022901 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -145,6 +145,8 @@ val close_handle: unit -> unit
>  
>  external domain_create : handle -> domctl_create_config -> domid
>    = "stub_xc_domain_create"
> +external domain_create_domid : handle -> domctl_create_config -> domid -> domid
> +  = "stub_xc_domain_create_domid"
>  external domain_sethandle : handle -> domid -> string -> unit = "stub_xc_domain_sethandle"
>  external domain_max_vcpus : handle -> domid -> int -> unit
>    = "stub_xc_domain_max_vcpus"
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index 94aba38a42..bb718fd164 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -175,7 +175,7 @@ static unsigned int ocaml_list_to_c_bitmap(value l)
>  	return val;
>  }
>  
> -CAMLprim value stub_xc_domain_create(value xch, value config)
> +CAMLprim value stub_xc_domain_create_domid(value xch, value config, value want_domid)
>  {
>  	CAMLparam2(xch, config);
>  	CAMLlocal2(l, arch_domconfig);
> @@ -191,7 +191,7 @@ CAMLprim value stub_xc_domain_create(value xch, value config)
>  #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
>  #define VAL_ARCH                Field(config, 8)
>  
> -	uint32_t domid = 0;
> +	uint32_t domid = Int_val(want_domid);

wanted_domid would be a slightly better name, because it isn't ambiguous
with a boolean flag.

>  	int result;
>  	struct xen_domctl_createdomain cfg = {
>  		.ssidref = Int32_val(VAL_SSIDREF),
> @@ -262,6 +262,11 @@ CAMLprim value stub_xc_domain_create(value xch, value config)
>  	CAMLreturn(Val_int(domid));
>  }
>  
> +CAMLprim value stub_xc_domain_create(value xch, value config, value want_domid)
> +{
> +    return stub_xc_domain_create_domid(xch, config, Val_int(0));
> +}

Using
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=36d94c17fa1e48cc9fb9ed15bc9a2237a1738bbb
as reverse inspiration, couldn't we do the insertion of 0 at the Ocaml
level and avoid doubling up the C stub?

~Andrew

> +
>  CAMLprim value stub_xc_domain_max_vcpus(value xch, value domid,
>                                          value max_vcpus)
>  {


